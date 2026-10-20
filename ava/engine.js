export const TREE_NAMES=['Cherry Blossom','Golden Wishing','Crystal','Rainbow'];
export function freshState(){return {version:1,vocabulary:{completed:0,started:[],reviews:{},turn:0},maths:{completed:0}};}
export function progress(total){const year=6+Math.min(2,Math.floor(total/300));const tree=Math.min(11,Math.floor(total/75));const count=total>=900?75:total%75;return {year,tree,count,leaves:Math.min(50,count),flowers:Math.max(0,count-50),unlocked:[6,...(total>=300?[7]:[]),...(total>=600?[8]:[])]};}
export function complete(state,id,hadMistake){const v=state.vocabulary;v.completed=Math.min(900,v.completed+1);v.turn++;if(hadMistake)v.reviews[id]={due:v.turn+2};else delete v.reviews[id];return state;}
export function chooseWord(state,words){const v=state.vocabulary;const due=words.find(w=>v.reviews[w.word]?.due<=v.turn);return due||words[v.turn%words.length];}
export function validState(s){return s?.version===1&&Number.isInteger(s.vocabulary?.completed)&&s.vocabulary.completed>=0&&s.vocabulary.completed<=900&&Array.isArray(s.vocabulary.started)&&s.vocabulary.reviews&&Number.isInteger(s.vocabulary.turn)&&s.vocabulary.turn>=0;}
