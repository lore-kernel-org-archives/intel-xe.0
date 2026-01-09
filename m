Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015E1D1A62D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBB710E8D7;
	Fri,  9 Jan 2026 13:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="EPHAQige";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bri3xpHj";
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D6010E8A3
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 11:32:50 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 609Ap0W72799806; Fri, 9 Jan 2026 11:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=/gXKEvgGHbIELbMD6V
 UcW7BibQujUlbTj+BYhHZUhPo=; b=EPHAQige84keOyu6ouH87shIrxa7EET9tK
 JN9PRkHJADWakeYupHxiLgNSG6Ca7zfLAjha2DZAljw35YVwV0eIAfGYWnqaE8yj
 Mety3QwUjy/s6gFLE3TE3Kbn+amZBahZp5h+UGTYS6+7CYaMqLPcz1Hl817FU1E2
 13Eogl9eM4tdxa8UqOQHyX+7Jg3JINhwMBowFxWeDFgg0SjKuVyhwNmv4YjeicFO
 j3aQcAEWuZkQMmPh2GhuAJWgegel70dHPFD79ysYxwEGC/z3k/LSJqfmyQhVRfO7
 6Q9CZmZqtE/LTD6LDIuoNpvCiog+faVxw6gZ3O3perxoRq91rFCw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk09h0196-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jan 2026 11:32:49 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 609BH2mo020452; Fri, 9 Jan 2026 11:32:48 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4besjp9jpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jan 2026 11:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR9IaJJxmNa4qqU90lNuymVf6ClTj4JbdZ+2Av65KHN4LZ20oFvD9TBcJipYu4bwFyg1iLfbLO/mcCZs0wmirLPRoZLuTSCFEmcVwQah28vdvkIylyjiI6toFJTVLBpbM62MQ1bzwuGD1UH1vlZ7UXE/TViNxi+j+rs0qlcFTe9nRqKumEQtQVGZLj22emyAlEoH6oiSafqskAxqA4NLPTyckFM2ug0lOJB/MS9sgtewA6FQYjbFV25Q/LV2vIFKZbmgpu1odSJXiHBJ3wmXk5kO0xrMPKABEGPL9lj2Qv7LmhPc8ojVN3xWtY9hjfKJ3WSXA/0OXCMFfB0gLCDkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gXKEvgGHbIELbMD6VUcW7BibQujUlbTj+BYhHZUhPo=;
 b=dEty3HDruHSXgambJcFNGYmvZUSdRV6pFEPZqjoknjdlgcUcqtvNMD3VqKWuVNSescI5pPI/u1Q8fGZWK5FcsgFuCUQAau/TM7MMekm0kLc7vsi1wDgHYWNcIvD/P4h7FjhR30piLS96s1b2gd5Fg79873m8lMvyt9KqWDIt9geCU5WrMKz+Q4NcPD7/8g9Zd4pIVjQn1sF5KKapMwN6SYUYn+XNcp1K9/KHurYRO7jN6rtneETI1sQKH9rEOxd4ZSHxml1P9wAEn8uH53C/puNe2Baa+bOy+so0kiWyu0nak5219d2VJW8Oa8Nv8CILTUPhxt1fctsHO13nTpUJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gXKEvgGHbIELbMD6VUcW7BibQujUlbTj+BYhHZUhPo=;
 b=bri3xpHjwM//HXFU1futlSbp8zauQfYpQ/aHsEAjkmfOb3yoG2e/isDwPY6IqTWg1Dt2jfxF+VHIfYMvHvmgBWQ7YE6heKEby9ph/9GrWuB3pA1UguN2vX17evrxi2nLtKUbRL/6cb07wdM8iLgOVI93zsss3GtjATG1AzhqET4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8163.namprd10.prod.outlook.com (2603:10b6:208:515::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 11:32:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 11:32:45 +0000
Date: Fri, 9 Jan 2026 11:32:47 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com
Subject: Re: [RESENDv2 v2 07/11] mm: Add a new swap type for migration
 entries of device private pages
Message-ID: <7b46131e-de14-40a9-be73-25855bb73ed0@lucifer.local>
References: <20260108060102.41357-1-jniethe@nvidia.com>
 <20260108060102.41357-8-jniethe@nvidia.com>
 <ed99b6b6-f722-470d-a40e-dddfcc9ae585@lucifer.local>
 <8bf680f0-94ed-4614-9ace-a081a6558460@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bf680f0-94ed-4614-9ace-a081a6558460@nvidia.com>
X-ClientProxiedBy: LO4P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: d34adc41-90c4-481a-df40-08de4f72cf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oMDfs034e/89AR+STmX87l3GXMD4IMOSzoUdkZTP0KauKWIbBmeJo0yjkGfs?=
 =?us-ascii?Q?kCnxQ9NzOpAA8F73RUiaP887uDCacQdv6zV8qROlhfhyyVEmpGTZfiYaW3Av?=
 =?us-ascii?Q?2eyVgWKkr6hhaAWE8GggXcZcQLZc9H/ybWsxobHPTvMwqeFOncGx8xBaJvJW?=
 =?us-ascii?Q?sLoEKPgwZT1quk7ORDPPKnqISl2xPQdqOutrzqrS7cRxtO2fu9mP/trtXGFc?=
 =?us-ascii?Q?DC4alLYga7+un8AkC4u0sAEekmMBJeqdwZY53xMAFN8LAfNJzfpXhPemh2sl?=
 =?us-ascii?Q?CzIQdjhXL1b/EDbBsnYG4ARY1jgJLnmRojhNWSdAtcnXWQTLc4jwydBuP7aS?=
 =?us-ascii?Q?HpF0sp30ViIqXZ0bTUxNKgTfLyj9AL8jXtALrfc0CxI7x4NKQKqCXm4dWen2?=
 =?us-ascii?Q?A9+w1Xna7cLq90H42qNZrRdaw3sFR8a3CmQLauO2XE7aFxgLTZiC45m3ya5J?=
 =?us-ascii?Q?1U/dv92Hj7pCS/iTHp0vSEIec2Srh6uwx1TBgXt00wl1PnU3gUaYZOYvuQs/?=
 =?us-ascii?Q?PuBmeQ2ZwcmOs0H1hP1T4LFSajsV7FK3bENC2PVkZ1N1l2lINrjO0ln7UBSk?=
 =?us-ascii?Q?HcxOtNQLTu0HJVcQae2xQ+tdzeJ6KZgZl9/Ql1AeuNp+EEnvD5jKjBd+s/12?=
 =?us-ascii?Q?fdOvshCCJKr0eeaK8lO7mioaj94rk9nGImri75ecB84j+lmMGPMS3T6P9MrJ?=
 =?us-ascii?Q?1eOI1NbWS5kjxBhS0fTpME4RxgKhG1HGpuTDjCJqpDQIRSC05TOVLuIJvPgP?=
 =?us-ascii?Q?kt6UnmhK2AYeUMY8zEF95KudVL1ftNuGrFVQ18ONdA83+/2tcU+q/h/iu4xe?=
 =?us-ascii?Q?aXFtOfYeEBDN3NaWbGOTgd755D037QS96MB/DjlmIbhRcg2u+pR6nM9RyDmN?=
 =?us-ascii?Q?AHt29juy+5xNvbq+f1mX68928CryGwoDZwSlCMZkFfjksaO0W5MhOAIFWeEe?=
 =?us-ascii?Q?DCeldamsJ8Pp4gIPA8NsV7T/PcDnapqSh7gmzFAr16eFeDrI6++8BB9xLwsN?=
 =?us-ascii?Q?EZMVHUMexKIQFvMgzDNz38w77+PjvnHfBHn6OZ1ZxkY2kZbg/c9jMj/+u9Cu?=
 =?us-ascii?Q?u/KAmewn2acHqBAN+NPq+1msrJwMXZSJvSfOBx8zDFX9f3bZaqdc6cSJoPt/?=
 =?us-ascii?Q?5t6REzvnGaC5ledm9NDKl88AOrmwGXyXubHBlR7/B9fXsMnL+6Dl5QC1A+hH?=
 =?us-ascii?Q?b3LCg2nwnJ+0abx7wAWxQFI/sw+e6iNcNkMlUsBVoL7Vgqb/qpwSARE3/Na/?=
 =?us-ascii?Q?YbJCht+XacHK6J2G999E3THvcjkqj7xlum3rB5hiqggCphsWUKZPCe9xjJ8t?=
 =?us-ascii?Q?SS6B7frNytsYs64L9b3gzqr3Y7Cy4hYDnOqv5VqtZ35PLaAzDcOIPW6U2ji1?=
 =?us-ascii?Q?fWhM1dZTxQSbIHZHo/xYKFlxc/HwZbDrX8aIH+HEZm06AgYzRoWgLWWKzA6a?=
 =?us-ascii?Q?rDT0VbjZdonVwg+X4MSiNY/2ZaHjE/g+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AufqtMEJK337mpstXtZliMYO/0sWb9UwSYMFEQ7/f/tozt24e/Ojd+d/nWRZ?=
 =?us-ascii?Q?qzjVjx8GOcxHPwOEn2uM65+NrpdRxf4pzyE6+Y1Uav7rq3pWQ05Wg1Tg+XdM?=
 =?us-ascii?Q?yRmL2NJerKwSvjiGhnRulUC8SyqjDUdPiIHM2jvvVsyjExB1fkBQzCnHjn3b?=
 =?us-ascii?Q?cQn9VQssLsf1KlJwd47tjjmNZCMRMMdkWa8y4hTmWGN0JBU5r6y9gTtZbOnh?=
 =?us-ascii?Q?whLjCIOlTf41UtoKnluFWyfkhVYfnRwXdJFbcTj+n4desXvB4ThMuASsseRw?=
 =?us-ascii?Q?AffQyCPewUAmtH4pKH6wkGMgtASvqfHW17HSRodkVadf31ChFLEV30ux0I01?=
 =?us-ascii?Q?3RF/MgepsobdMmdIqDLb8Bl6B4ueMM2H8o9yg/MOWKhAMTqOY/ChsxipYiz5?=
 =?us-ascii?Q?WWIz9WEjo4DJmz+ocL0otH/DYdOQ3Qi5hzx+88j6fxkBr46cWtLD4MbAOit2?=
 =?us-ascii?Q?JiRLuw+XO+1oqXhhEierSxR7jFNhrxFa+mZ/3WScXhv+ty7oMOFbft2/w92F?=
 =?us-ascii?Q?x3AEdMTFr8kCtyP8GRNAJppGcEhKO8kUB5QUE762XklSmXwWwFrZISuKc8Cx?=
 =?us-ascii?Q?mpNPMRpMwAlSYjScOFlXTt+ACPbrgrhKufoVFZFi/XQOIr1/MIQ3itSNvL8E?=
 =?us-ascii?Q?9dDay2nI4oENvmPR32CfGi2bwX6QIKElTqcQXA6Dd6fgxrw7P7FM1DFDWalY?=
 =?us-ascii?Q?vey6Ex86tvJrwJJGQxUMUbIsxrQ2tuyvini5lQzybq+6bIVUKeOsYxNX5rS5?=
 =?us-ascii?Q?CfZJA3jtn8I1aVuvA8JWhxtuK1i8L7RM7j59rV3uU83j1MDYlmodFuhy6GL2?=
 =?us-ascii?Q?T7IXJenEu+t5bvGMmotlfLxWT25uk93xVH25xTxOQAL2o+ZP4o6KM0HeKyGS?=
 =?us-ascii?Q?BShcO/7DdYf2Wke9BkLyQlgkg1K2d9RbrrvDiZNbGKJVCUPvKpN1ocilOY7W?=
 =?us-ascii?Q?LbIe8TW+noThIOPp1va8ym38XHWMrbBe9GCYG9nja4QHpN+LAVoo6eGkv1/E?=
 =?us-ascii?Q?i4HElog9niZgasIwqJFtYko/nv+YTstRFu+3pR+I3WenS+r2EtyKiJAev2Bc?=
 =?us-ascii?Q?aFlWb5qTVu2KVI+IGxCye+W1vqkyG/C9v6Svwkp4Zxa9WSarVfo8uVHMYVGL?=
 =?us-ascii?Q?GRec1UoBABMq9+IJcSYxbt0SElg1ZQVoKwg/UeeVzu66w63iJq0Rf8FhcWng?=
 =?us-ascii?Q?pFPsKcEyp7Qc6QNn++F1hoBAlVzBR+9rEGwkq6/OtFTAhh7jMRam/29rqKEZ?=
 =?us-ascii?Q?Uee+oiznIGN/xejC1msWfzQS7zQzRC9S7RIsoJ3kx8NyX7ncanEMTqeLTAIT?=
 =?us-ascii?Q?XS75rkzQWqOa1RT9i2uxWvj26+0fMkyoRhhCjQxNKjFgzTG35rLPg3Q1YkX1?=
 =?us-ascii?Q?xA011Cx/uTfv70Rxf/qd6SKHUipvMCw7jBVZuzDxRifiT857rNE1Zvy7Mp9G?=
 =?us-ascii?Q?dMlc6N4C/nsCvGkSKcpVCHLHj6iWg/L43sFt3sUYetn1ZmvgSNJ0W7BMe0L2?=
 =?us-ascii?Q?MLFiJPHf/IEB3kiietx0g73XOcIw9HjOtSJ0i3ysH3E3/jwAReqCuZgiYVTU?=
 =?us-ascii?Q?9//M/IuI/M4eKi/CdRe6cjQ/OI5NGFUgwHYB174/byCBuM7gFuzY064PXb7C?=
 =?us-ascii?Q?HQymE1sNll/kO8u7rC+KD4oj+MQ/Alr245kWtkre3BILS1yYR2nzvhirkdpZ?=
 =?us-ascii?Q?SFfSCRo2U4yaPFfICXg6jVmZ0ZFt0FmOIzr5TtYH3iX1bZjBYfGI1PnCObx7?=
 =?us-ascii?Q?54rktyIc1PDPwi+gTsHYLrpUcSbkJSY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: B0dhAu3mIvuGcVEcxeNCmlPFG61yizyPadYtvuSzXF1Ptos7RBX+KkWBsSmU9XeNpkjWqb5J8fR+0SD+8kei+aCmGpwhYqrkyDOuvwh0bI2krRqvNO3tOUGw+ezbH/450WEGYlJPgl5APO395PhV4Bzi1N/R8T+OQYGhAawC/UZeGXEsyTNMMXtj9e4tOQ5zpNdyVs8nePEXebsFVIJ+yDRdKrG+9MP+OtFX/sM4YOj91go4Y7yaKymEf4TmOGwh3AHSaT7z+T5S+PITAMxqhYoacMK0Gof+PHGm470EjA5GuudCzu0RFEbjM3m5ne5+tH8//5Rjf5mm4148/3rma6h659/ZseavFJnnYsrYXKbSUzD+U915iZ/JG42vtN54COPyZ1ck63sKiCUUKvOXbQy2fqnFisgPlc9+D/22szGNhJH2oAWVovbQoLnb4G1xEzrWNphhq+F8JjueRTXV5W+BVpZeQdHG2hs90AwTCgm1q9DEtWEVtjWSoAEBfWRoU7HmSmtTmImTLLYt31ngRJVx9l7fnRHf5rqzo4mHg8xyUZlhYNU6CH6VslqbiptJd0CgGEWEsVC4vBBM9isQtm2TGyfJ0maU3JIkLEOriAc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34adc41-90c4-481a-df40-08de4f72cf1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:32:45.3719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQKVWuV7di7CiBDwu2T9qAavWiiYq5LTFBu6k9TBw7IRsS5azk4YBnuyOlVr2s2NMcy2ww+NOTngODouMZiwiYWmPNuZk/CMs/VpTYYO+64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8163
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601090084
X-Proofpoint-ORIG-GUID: 1KFr3lglssyHvFPKZy-kACFVZyUJXbeb
X-Proofpoint-GUID: 1KFr3lglssyHvFPKZy-kACFVZyUJXbeb
X-Authority-Analysis: v=2.4 cv=AZm83nXG c=1 sm=1 tr=0 ts=6960e761 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kuTuYLHN2Zi8AzQQOpkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfX4C0UEvccThK+
 3/K5MfLORcA3IiR7m7TQOFcJFmafbZKCHdPPaf47TD/eXvKZAETiSyn8Vjtax8whdSY4enVvxYw
 AlS8S0G2EBmUAUDldhGHq0/8eF1lOAGOmog/v/6qmSw0AZv7U4iAEl83tHOznFd0XYIhvaArmy4
 2sZfQz/bzwwEtjvY9XfUuIUkxrbAqKYOlZgLh/1SKYkGv7EGprP2pE4RklsB2ZgEdFhQtobHXkG
 Fa1D1mDMDXdiTUi9W87k2EJD1jIBdEcVGfM/aDdkjJ4E6rTd5PB+HNLmPv7Iffkgb7DIAJ6aVZT
 giP0Kkou18zndIzErMr+N/tKeXRy4KH9xLY3O2wZqGr7egAti1vThtAKPuvDqGKuTIHSPG61ln0
 71Y6cVvsWijiydH4ARmQRHWPJWd/Ya9xDhWVFQGtGHJavqcWEtA/mTmhFHLHfkyvZWbD5j5G07H
 XFoQMwAseU2E58tJteyOmRDlk0mb11YsPPVyDz4s=
X-Mailman-Approved-At: Fri, 09 Jan 2026 13:49:21 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey Jordan,

Thanks for the feedback to the feedback :P but can you re-send this
replying on the thread to everybody?

As it's important for all participants to see the back and forth.

Cheers, Lorenzo

On Fri, Jan 09, 2026 at 10:39:45AM +1100, Jordan Niethe wrote:
> Hi,
>
> On 9/1/26 06:08, Lorenzo Stoakes wrote:
>
> > > @@ -28,6 +28,9 @@ enum softleaf_type {
> > >   	SOFTLEAF_DEVICE_PRIVATE_READ,
> > >   	SOFTLEAF_DEVICE_PRIVATE_WRITE,
> > >   	SOFTLEAF_DEVICE_EXCLUSIVE,
> > > +	SOFTLEAF_MIGRATION_DEVICE_READ,
> > > +	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
> > > +	SOFTLEAF_MIGRATION_DEVICE_WRITE,
> >
> > I think these should be SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx
> >
> > And I realise that's a mouthful :)
> >
> > But to be consistent with other naming, including SOFTLEAF_DEVICE_PRIVATE_*.
>
> Sure.
>
> >
> >
> > I don't see any users of this, do you definitely use it? I mean presumably you
> > might in a subsequent patch, not checked.
> >
> > Otherwise I'd wrap it into softleaf_is_migration().
>
> It gets used in the final patch of the series when we begin doing things
> like:
>
> static inline struct page *softleaf_to_page(softleaf_t entry)
> {
> 	struct page *page;
>
> 	if (softleaf_is_migration_device_private(entry) ||
> 	    softleaf_is_device_private(entry))
> 		page = device_private_entry_to_page(entry);
> 	else
> 		page = pfn_to_page(softleaf_to_pfn(entry));
>
>
> >
> > >
> > >   /**
> > > @@ -211,7 +279,8 @@ static inline bool softleaf_is_migration_write(softleaf_t entry)
> > >    */
> > >   static inline bool softleaf_is_migration_read(softleaf_t entry)
> > >   {
> >
> > For these ones that you are making sort of compound now, can you please update
> > the kdoc to reflect it? You've done it for others but not this one.
> >
>
> Sure, sorry I missed this one.
>
> > > -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
> > > +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
> > > +	       softleaf_is_migration_device_private_read(entry);
> > >   }
> > >
> > >   /**
> > > @@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
> > >    * readable migration entry?
> > >    * @entry: Leaf entry.
> > >    *
> > > - * Returns: true if the leaf entry is an exclusive readable migration entry,
> > > - * otherwise false.
> > > + * Returns: true if the leaf entry is an exclusive readable migration entry or
> > > + * exclusive readable device private migration entry, otherwise false.
> > >    */
> > >   static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
> > >   {
> > > -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
> > > +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
> > > +	       softleaf_is_migration_device_private_read_exclusive(entry);
> > >   }
> > >
> > >   /**
> > > @@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
> > >   	case SOFTLEAF_MIGRATION_WRITE:
> > >   		return true;
> > >   	default:
> > > -		return false;
> > > +		return softleaf_is_migration_device_private(entry);
> > >   	}
> > >   }
> >
> > So all of these above ^^^ are making it so you can't determine if an entry is
> > 'migration xxx' vs. 'migration xxx device private'. Is this ok?
> >
> > Does anything need to exclusively determine if something is a 'migration
> > xxx'?
> >
> > If not then fine, but just wanted to check.
>
> The new entry types have the following relationship:
>
> SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
> SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ
>
> So it is remains possible the distinguish the types using the
> softleaf_is_migration_device_private_read() check
>
> In practice, the only reason for introducing this new type is so we know
> when
> we can not call pfn_to_page() on the swap entry offset. That is the only
> time
> that the difference matters.
>
> Rather than introducing a new type we could accomplish this by adding a new
> flag like SWP_MIG_DIRTY, SWP_MIG_YOUNG but my concern was how we handle the
> !migration_entry_supports_ad() case.
>
>
> >
> > >
> > > diff --git a/include/linux/swap.h b/include/linux/swap.h
> > > index 38ca3df68716..c15e3b3067cd 100644
> > > --- a/include/linux/swap.h
> > > +++ b/include/linux/swap.h
> > > @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
> > >    *
> > >    * When a page is mapped by the device for exclusive access we set the CPU page
> > >    * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
> > > + *
> > > + * Because device private pages do not use regular PFNs, special migration
> > > + * entries are also needed.
> > >    */
> > >   #ifdef CONFIG_DEVICE_PRIVATE
> > > -#define SWP_DEVICE_NUM 3
> > > +#define SWP_DEVICE_NUM 6
> > >   #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
> > >   #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
> > >   #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> > > +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> > > +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
> > > +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
> >
> > I've lost track on how many entries we have left, have you tested this with a
> > config that maximises the number?
>
> Good point - let me double check that.
>
> >
> > I really hate how we do this by the way, that's another thing to fix... :)
> >
> > >   #else
> > >   #define SWP_DEVICE_NUM 0
> > >   #endif
> > > diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> > > index a9ad997bd5ec..bae76d3831fb 100644
> > > --- a/include/linux/swapops.h
> > > +++ b/include/linux/swapops.h
> >
> > Since this is pure softleaf stuff can we please put it all in leafops.h if
> > possible? I know we already have some stuff here rather than there, but this
> > really doesn't seem to belong here.
>
> The reason for adding the swapops.h entries to correspond with the softleaf
> entries was it looked like the swapops were still required for making
> the entries currently.
>
> That is, there aren't softleaf equivalents to
> make_readable_device_private_entry() and friends yet.
>
> Would it be better if I introduced the swapops.h changes in a proceeding
> patch?
>
> >
> >
> > Cheers, Lorenzo
>
> Thanks for reviewing.
>
> Jordan.
>
