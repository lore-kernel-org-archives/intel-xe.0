Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA31C27C53
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 01:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20F10E11B;
	Thu, 13 Jun 2024 01:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nt6TFs9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E310E11B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 01:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718243509; x=1749779509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zgKZTlaAsyF1PaZpUUsTNuqI1yoGic/48MEsWrPX33g=;
 b=nt6TFs9qo+SCJKSmzTS93mBHI4aw6eveVxV/uXJvhY25MTX1guUBPkMd
 e32AVWqGqvXVW45FqimXaYGwCSFL3hY+F2IQT93OTZBZ8/z4sK9eIZ/5O
 6x5qZyUD4d8jYF4bETepqa5urxjOOJEWJlqEGqbfpzO3Flr04XsNxY7iu
 8c4ajZv2QPvWq8vqpB0bI0H19nbrdh/M6aN/jppEa1GzzNyMnvMACkS3o
 WVW2BKufFBnyRiOlzjy1+5B08+VvtRCKmtcu/u4UngJofgCgMt/ZF1lwG
 zKXcObOed10GP6QaBK103pCYso/BhZqQn7FZnK6LSTPci9AbdscijYosi Q==;
X-CSE-ConnectionGUID: JEZlF8aeTbaFHdNky4eGYA==
X-CSE-MsgGUID: cqdJ1xUUQBmgQlukmS3W2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15193365"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15193365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 18:51:48 -0700
X-CSE-ConnectionGUID: VSeFkR8IRmKCWCnKF4Ep1w==
X-CSE-MsgGUID: xV2yfh4sQQ66tAA3wVozIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="45106132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 18:51:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 18:51:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 18:51:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 18:51:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 18:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndf9+DyjDxSPpkp4SXA71S4U9MzAB/FXxcWJtDg6YxjSRqmAFfMcCWlRoWniqSvQ8UG6gMjjXUtHKB/JpmFnsimlxKVUkII7iDrPKh28BWdaMWH+kO0o253kU7em2jDs+7s+f9zuvWYG05Gyz1FS6zjQS8gqVpPPDRob2Ea3qXqgVAZx/VrIAFKJG7zzLCzyjuJ2wYPHVh+OnTSbEGyrg0wwFK9z/kc/4+Myr4RxvcPBtRvRhCxA46ltW7lpOTtAcPTgfLbiCktHC6Qz1Ex6ZBc4lCuonz8q2+n3jPsEQKG91MywTh9VB5bpOZVJ9BTeUR++WyMhP375yUbQXBLniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysW/4u4jlKhBC9/xEcuKn+L+E3wnZ3p8gHY7Ps+74VA=;
 b=Y+QKQ3q4MdC8cb9nV4KVnSMe3sDLsLNejQ9UvBox7krFRZCOuF2W9vmcXV14YwRdPppDHXV9CmvmUonS/syXN+s+xuleAX5dzRIFsgUKE6wEAkCCU032CWW3xUSeqahrxxtDRUwIzvYOVnN/EkJ4FxA++ypzPJO7yX4hNCkC6qQFG7n6lsAUpB8ohLJgcq+SoxNkePumAyJuZg3oNQ+Uv1U4jAbg6JdAUkcDLQ1snVEmwrZAtPnZpSBj7iqDnGa+319ObsmvTDZw490LES0br0GZyYk7Cyx0KXH0cb9GqkL56pTE+kOEEvQ/3rBRCEDpwmQBH/fKzyeCUukyBuiysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB6604.namprd11.prod.outlook.com (2603:10b6:806:270::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 01:51:43 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 01:51:43 +0000
Date: Thu, 13 Jun 2024 01:51:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 11/11] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Message-ID: <ZmpQiXlH2lmGb0MC@DUT025-TGLU.fm.intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-12-matthew.brost@intel.com>
 <96d30c2b-76b6-4086-aaad-77190c4af586@intel.com>
 <ZmohaZ02aV7tnKbL@DUT025-TGLU.fm.intel.com>
 <f346b43e-475d-4c52-966d-cf38c8376bed@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f346b43e-475d-4c52-966d-cf38c8376bed@intel.com>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a71dea0-aff0-4adc-ea15-08dc8b4b601d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJ8T60OSrjTFwKtqiom89A2rpd0VCPh0PEKurKwNpn/Xee4ynh/3FscFayNm?=
 =?us-ascii?Q?4vSjeLGChKpjACJN65OZF+8R3w0IgWrSwg/9fHR37X2wB0pOzxDbygC3vrMS?=
 =?us-ascii?Q?DLGlZDkdmkggtD4mXwVqskP56MjjXQhsNrdbo+z040oG2msBQPO7LjKD4fo2?=
 =?us-ascii?Q?D0broTNj4GPMVY41Xto8tXGgLUbQxQ/PSu2nmyBPzZAK15qzeKIrTqSKTmMf?=
 =?us-ascii?Q?njE6y3oSPeijfJx2IvltXbtZYHvbof0NqjUcR6c1qt7YKq5r2bzbLLJkmj3v?=
 =?us-ascii?Q?64PglAMfwYwejn+ww8OhvPc21hOWcgaQzAlD4oXfMjNvSWDnu1LrPMI4CF9t?=
 =?us-ascii?Q?zknogdNvHydZtcnIulmqL1dtSu3kftJzg7g/oi+c/J7GOC7+mKYBYbH15Ymy?=
 =?us-ascii?Q?ddHjdctxC8sKpXGE4wB0bomsu5PVm178FXmj0Spw9m2SEnT3C1o31jRXOLiQ?=
 =?us-ascii?Q?Zl5vEK/c60Cc9LAfZ1aUzE8znpFeIcDSDdj4/H98JQGAMiEifh9PzaLXWI5G?=
 =?us-ascii?Q?Qm5Uf/xJxt0C3FD4E607/IYAAxk+KXDcpWcNoLELtMGqpwGxDgfSilCnuqhf?=
 =?us-ascii?Q?9oPfkki3v7b3JgpMLjPVm+oqfi88tQdkgZRR9yJf5ZBYATKRvDrjX6yq15T3?=
 =?us-ascii?Q?OJjSaGozpY5ozF6X//OnPHb09iaOjsg+DBPCE00050gpaVweT3Hown1wnhZS?=
 =?us-ascii?Q?U1MsLmF9jLYKnk8HK5sqY5caDbCxb9LwbBvvmfL/+yr/Q4Q8LVvvAVfu/xvu?=
 =?us-ascii?Q?NXxXY+k5ar7wAGztQ2CnASYLHXu1ohjHtscqVla/7evgz5iUvE2rRx0hyajg?=
 =?us-ascii?Q?MMMURGPYwCKKrOLGL+VBQvYlZKk/41zDrYeeP9CaEAE/ozPvB7URT66i69M2?=
 =?us-ascii?Q?a7RzY2gX6UsnSj+yF2dCoC8ZkFMuJEVn0c7Vbm98wb9C0vkzFL8CHtQ+AfFn?=
 =?us-ascii?Q?0x3TlNUlEMuQRAGdGvF3pwGgf6rsfgYWY4eSQzFwd073YzMhTHjfNK5OVKwb?=
 =?us-ascii?Q?+0c0zUc07J8IUH2QftGZhDi9NEeBwoTMYFLk89IdroSt5L+rI7PocOyVLc6Z?=
 =?us-ascii?Q?y3PjFVBSr6XOuox7E7LiWdX7FOcdZPfBmgPniJIEzVSQC0iRArbzHu3w2JGQ?=
 =?us-ascii?Q?8VLErJjf0uysFbY37AAl9b8chBtEIX5OXEoz6mdUWVmQOUHTtbqVGYGXfifs?=
 =?us-ascii?Q?+rvT0udF6dvujQ49I8/dNvsPowqxvhJWvH0IRgUVwZuEfqeRZZCiFh+9lRwH?=
 =?us-ascii?Q?eNfuXVyDwoRSyUMBflbQI23sqyF53QzjSSemyPlUbcpw4cXtC1P4+4+ghASK?=
 =?us-ascii?Q?ERNfN7fyESTa7BhPwJ3PVOUm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5b1QJZeREW6xetwGMy/rYDUwES0059v4coO9dQMutTelW9NOtkulRGfyak88?=
 =?us-ascii?Q?VbucozVS0KxHGahqubj/5UH87sZfYJescKC7VkjUw4Q2NKm33m5TGZDgh05h?=
 =?us-ascii?Q?iOn/+i+1lgnajBc8CtV50ERhggMgQ7t0bfe3fyVwtzq+gaSQGmrTHmVcJD5r?=
 =?us-ascii?Q?UBwtfmhDo7r/aH+RZKK233CCKnk7vzKX54PDGWA/ZhvU7D5iJCv2lpjz/YDQ?=
 =?us-ascii?Q?Cx/R1mOCGMI0kxnr3jlUuGq4HGBPSjIskJVQA3YoV7UovNUAHXa/i7p89hSd?=
 =?us-ascii?Q?G1RIJIjsfnNqeA6h4EbmXTART5e9ljmyvhCv5KRW6k88kc+p9OjWwz4vAb5I?=
 =?us-ascii?Q?lKun89BK6o+4wTueQ+u7cUA0EgouteLonL8mTRdyys1fTpm50oxqN1z6va+k?=
 =?us-ascii?Q?BD/0pjHymOQRCNuoD3AK3tXSdTbdaOovQZ/00pIjFlDS+tFhNGjVGb0Gwe2x?=
 =?us-ascii?Q?0SbhQ/Zfimyaz4biCw6dmnQs2ZrdkCVyY+t4mVagPI3LqMIG7Uymb7y0wqiq?=
 =?us-ascii?Q?maehH9h58bR7cDvYpBFGhMu0XGYqAwmUl16Ws+0rGXrKo9j/ttp5aGl50rx/?=
 =?us-ascii?Q?jE107lpMsN/ZgBrRypY2dsB6iBFkL+AoNOFgq1HAHMAmXasEdmrCwMjZPc6N?=
 =?us-ascii?Q?DS4TZTLV3HaMXonAqok73+cQE36T0QLDBood5OFty5Yp0yPP1rka4/ZhOQxi?=
 =?us-ascii?Q?YjyB+moraFYBE1CX/Q6wmVBtJ/2om4Kmf5l7W77XrPWLHWTFbQo9wYTSBTHZ?=
 =?us-ascii?Q?KE6Xybk5XTzPsvnRy20G8cMg+bocq16Q5tjk344zhl48ec/jrRJ6WwlSv4qu?=
 =?us-ascii?Q?Wz17Zyc2vBx9YzBESZ8cmFhfat7xuoVWS49YcbVy5GASrxsl4c6OYkjP3UL0?=
 =?us-ascii?Q?TuvNTMbmID/cKNNig0/43W+lZeo02Dbh//MA1f0pK4P0WllevgXm/4Ig4Rlr?=
 =?us-ascii?Q?p64ZvSXwFuU8Y28ZlMjiCsYfAjQ03emHxs6Aue7nvD3D28+FOI2Qdp2aiKTD?=
 =?us-ascii?Q?R9dEyYnR5jgQm9H1Daflf25F+QclN18drJgBQ+EDt26j/7aFXmhlbImDGd+H?=
 =?us-ascii?Q?DTwGre4QXuySAgxRDMw7yAp4H63/I5I9GjfqIQIg1P5pmaUfa3zm1TTDiJKw?=
 =?us-ascii?Q?mgeCmDTNnuo6CsnwUA+mCNt61vQ6FGDd0zPbghddyTuYcDbZRr5/MNa9dd5/?=
 =?us-ascii?Q?nWHx45/iD8fJ3lzUBQbSdXGN29WncNP50WGAhdsWJYjhW8omO4ZO/eUJPCah?=
 =?us-ascii?Q?gx1ukgGnN7+t/ua4kYl5JXh76FWBzxQPr/5Y/QTZU7y0UINsVvGbRN82LTBF?=
 =?us-ascii?Q?zHf3Yxxlp1tiibmc42KQKgYPWUmNgPSUqNNPF3FR4yYFn9vk/hh2vAg+ZBWV?=
 =?us-ascii?Q?RZrNwgCZqBU7dyku4kf2hjlobDMssLTF2gMHNsPUmWEsWJhlgC8g9H38flq7?=
 =?us-ascii?Q?0XKvnIngMkFT5KLrYK1M+zThuhq8vp7m/7840qUQKgrfScPl2FIkE4xqGW7V?=
 =?us-ascii?Q?CTBeV7xb2z/rRgVHS5Kx6ZkZ1TOWzrInZ/cMWlU2Cij9lCOrmcNBn/m74kU1?=
 =?us-ascii?Q?AIJptpa0OySTLZF7w3SqY8VWzz/bgpKORJwlPPXmYl/hj4Vutgde9RwrGxDO?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a71dea0-aff0-4adc-ea15-08dc8b4b601d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 01:51:43.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xcgclycVKjG4tJy5528SQ4rxslTtxb77nFO1DVxW5FZQsokH5WaprpL9E5yQf8fpRA/NM97fdV2rzui0kHXMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
X-OriginatorOrg: intel.com
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

On Wed, Jun 12, 2024 at 05:57:26PM -0700, John Harrison wrote:
> On 6/12/2024 15:30, Matthew Brost wrote:
> > On Wed, Jun 12, 2024 at 02:56:42PM -0700, John Harrison wrote:
> > > On 6/11/2024 07:40, Matthew Brost wrote:
> > > > In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> > > > scheduling enable needs to be toggled to properly sample the timestamp.
> > > > If a job has not been running for longer than the timeout period,
> > > > re-enable scheduling and restart the TDR.
> > > > 
> > > > v2:
> > > >    - Use GT clock to msec helper (Umesh, off list)
> > > >    - s/ctx_timestamp_job/ctx_job_timestamp
> > > > v3:
> > > >    - Fix state machine for TDR, mainly decouple sched disable and
> > > >      deregister (testing)
> > > >    - Rebase (CI)
> > > > v4:
> > > >    - Fix checkpatch && newline issue (CI)
> > > >    - Do not deregister on wedged or unregistered (CI)
> > > >    - Fix refcounting bugs (CI)
> > > >    - Move devcoredump above VM / kernel job check (John H)
> > > >    - Add comment for check_timeout state usage (John H)
> > > >    - Assert pending disable not inflight when enabling scheduling (John H)
> > > >    - Use enable_scheduling in other scheduling enable code (John H)
> > > >    - Add comments on a few steps in TDR (John H)
> > > >    - Add assert for timestamp overflow protection (John H)
> > > > v6:
> > > >    - Use mul_u64_u32_div (CI, checkpath)
> > > >    - Change check time to dbg level (Paulo)
> > > >    - Add immediate mode to sched disable (inspection)
> > > >    - Use xe_gt_* messages (John H)
> > > >    - Fix typo in comment (John H)
> > > >    - Check timeout before clearing pending disable (Paulo)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 303 +++++++++++++++++++++++------
> > > >    1 file changed, 242 insertions(+), 61 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 671c72caf0ff..cddb391888b6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -10,6 +10,7 @@
> > > >    #include <linux/circ_buf.h>
> > > >    #include <linux/delay.h>
> > > >    #include <linux/dma-fence-array.h>
> > > > +#include <linux/math64.h>
> > > >    #include <drm/drm_managed.h>
> > > > @@ -23,6 +24,7 @@
> > > >    #include "xe_force_wake.h"
> > > >    #include "xe_gpu_scheduler.h"
> > > >    #include "xe_gt.h"
> > > > +#include "xe_gt_clock.h"
> > > >    #include "xe_gt_printk.h"
> > > >    #include "xe_guc.h"
> > > >    #include "xe_guc_ct.h"
> > > > @@ -62,6 +64,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > > >    #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> > > >    #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > > >    #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > > > +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > > > +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> > > >    static bool exec_queue_registered(struct xe_exec_queue *q)
> > > >    {
> > > > @@ -188,6 +192,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > > >    	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> > > >    }
> > > > +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > > > +{
> > > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > > > +}
> > > > +
> > > > +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > > > +}
> > > > +
> > > > +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > > > +}
> > > > +
> > > > +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > > > +{
> > > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > > > +}
> > > > +
> > > > +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > > > +{
> > > > +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > > > +}
> > > > +
> > > >    static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > > >    {
> > > >    	return (atomic_read(&q->guc->state) &
> > > > @@ -920,6 +949,109 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > > >    	xe_sched_submission_start(sched);
> > > >    }
> > > > +#define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div((__t), 105, 100)
> > > > +
> > > > +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > > +{
> > > > +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > > > +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > > > +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > > > +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > > > +	u32 diff;
> > > > +	u64 running_time_ms;
> > > > +
> > > > +	/*
> > > > +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > > > +	 * possible overflows with a high timeout.
> > > > +	 */
> > > > +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > > > +
> > > > +	if (ctx_timestamp < ctx_job_timestamp)
> > > > +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > > > +	else
> > > > +		diff = ctx_timestamp - ctx_job_timestamp;
> > > > +
> > > > +	/*
> > > > +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> > > > +	 */
> > > > +	running_time_ms =
> > > > +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > > > +
> > > > +	xe_gt_dbg(gt,
> > > > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> > > > +		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > +		  q->guc->id, running_time_ms, timeout_ms, diff);
> > > > +
> > > > +	return running_time_ms >= timeout_ms;
> > > > +}
> > > > +
> > > > +static void enable_scheduling(struct xe_exec_queue *q)
> > > > +{
> > > > +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > > > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > +	int ret;
> > > > +
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > > > +
> > > > +	set_exec_queue_pending_enable(q);
> > > > +	set_exec_queue_enabled(q);
> > > > +	trace_xe_exec_queue_scheduling_enable(q);
> > > > +
> > > > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > +
> > > > +	ret = wait_event_timeout(guc->ct.wq,
> > > > +				 !exec_queue_pending_enable(q) ||
> > > > +				 guc_read_stopped(guc), HZ * 5);
> > > > +	if (!ret || guc_read_stopped(guc)) {
> > > > +		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> > > > +		set_exec_queue_banned(q);
> > > > +		xe_gt_reset_async(q->gt);
> > > > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > > > +	}
> > > > +}
> > > > +
> > > > +static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > > > +{
> > > > +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > > > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > > > +
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > > > +
> > > > +	if (immediate)
> > > > +		set_min_preemption_timeout(guc, q);
> > > > +	clear_exec_queue_enabled(q);
> > > > +	set_exec_queue_pending_disable(q);
> > > > +	trace_xe_exec_queue_scheduling_disable(q);
> > > > +
> > > > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > +}
> > > > +
> > > > +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > +{
> > > > +	u32 action[] = {
> > > > +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > > > +		q->guc->id,
> > > > +	};
> > > > +
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > > > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > > > +
> > > > +	set_exec_queue_destroyed(q);
> > > > +	trace_xe_exec_queue_deregister(q);
> > > > +
> > > > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > > > +}
> > > > +
> > > >    static enum drm_gpu_sched_stat
> > > >    guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    {
> > > > @@ -927,10 +1059,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    	struct xe_sched_job *tmp_job;
> > > >    	struct xe_exec_queue *q = job->q;
> > > >    	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > > > -	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > > > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > > >    	int err = -ETIME;
> > > >    	int i = 0;
> > > > -	bool wedged;
> > > > +	bool wedged, skip_timeout_check;
> > > >    	/*
> > > >    	 * TDR has fired before free job worker. Common if exec queue
> > > > @@ -942,49 +1074,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    		return DRM_GPU_SCHED_STAT_NOMINAL;
> > > >    	}
> > > > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > > > -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > -		   q->guc->id, q->flags);
> > > > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > > > -		   "Kernel-submitted job timed out\n");
> > > > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > > > -		   "VM job timed out on non-killed execqueue\n");
> > > > -
> > > > -	if (!exec_queue_killed(q))
> > > > -		xe_devcoredump(job);
> > > > -
> > > > -	trace_xe_sched_job_timedout(job);
> > > > -
> > > > -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > > > -
> > > >    	/* Kill the run_job entry point */
> > > >    	xe_sched_submission_stop(sched);
> > > > +	/* Must check all state after stopping scheduler */
> > > > +	skip_timeout_check = exec_queue_reset(q) ||
> > > > +		exec_queue_killed_or_banned_or_wedged(q) ||
> > > > +		exec_queue_destroyed(q);
> > > > +
> > > > +	/* Job hasn't started, can't be timed out */
> > > > +	if (!skip_timeout_check && !xe_sched_job_started(job))
> > > > +		goto rearm;
> > > > +
> > > >    	/*
> > > > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > > > -	 * somethings has gone wrong and the GT needs a reset
> > > > +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > > > +	 * modify scheduling state to read timestamp. We could read the
> > > > +	 * timestamp from a register to accumulate current running time but this
> > > > +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > > > +	 * genuine timeouts.
> > > >    	 */
> > > > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > > > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > > > -		if (!xe_sched_invalidate_job(job, 2)) {
> > > > -			xe_sched_add_pending_job(sched, job);
> > > > -			xe_sched_submission_start(sched);
> > > > -			xe_gt_reset_async(q->gt);
> > > > -			goto out;
> > > > -		}
> > > > -	}
> > > > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > > > -	/* Engine state now stable, disable scheduling if needed */
> > > > +	/* Engine state now stable, disable scheduling to check timestamp */
> > > >    	if (!wedged && exec_queue_registered(q)) {
> > > > -		struct xe_guc *guc = exec_queue_to_guc(q);
> > > >    		int ret;
> > > >    		if (exec_queue_reset(q))
> > > >    			err = -EIO;
> > > > -		set_exec_queue_banned(q);
> > > > +
> > > >    		if (!exec_queue_destroyed(q)) {
> > > > -			xe_exec_queue_get(q);
> > > > -			disable_scheduling_deregister(guc, q);
> > > > +			/*
> > > > +			 * Wait for any pending G2H to flush out before
> > > > +			 * modifying state
> > > > +			 */
> > > > +			ret = wait_event_timeout(guc->ct.wq,
> > > > +						 !exec_queue_pending_enable(q) ||
> > > > +						 guc_read_stopped(guc), HZ * 5);
> > > > +			if (!ret || guc_read_stopped(guc))
> > > > +				goto trigger_reset;
> > > > +
> > > > +			/*
> > > > +			 * Flag communicates to G2H handler that schedule
> > > > +			 * disable originated from a timeout check. The G2H then
> > > > +			 * avoid triggering cleanup or deregistering the exec
> > > > +			 * queue.
> > > > +			 */
> > > > +			set_exec_queue_check_timeout(q);
> > > > +			disable_scheduling(q, skip_timeout_check);
> > > >    		}
> > > >    		/*
> > > > @@ -1000,15 +1136,60 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    					 !exec_queue_pending_disable(q) ||
> > > >    					 guc_read_stopped(guc), HZ * 5);
> > > >    		if (!ret || guc_read_stopped(guc)) {
> > > > -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> > > > -			xe_sched_add_pending_job(sched, job);
> > > > -			xe_sched_submission_start(sched);
> > > > +trigger_reset:
> > > > +			xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> > > Not a problem introduced in this patch set so maybe not necessary to fix
> > > here either. But we have seen what look like false hits on this warning in
> > > some of the reset tests. The code gets here if the schedule disable
> > > genuinely times out which is what the warning is saying. But it also gets
> > > here if guc_read_stopped() is true and that happens if a reset occurs
> > > asynchronously to this timeout check. In that situation, there is no need to
> > > fire a warning - the abort is intentional and expected. It is also not
> > > necessary to queue up another reset just below. It seems like the warning
> > > and the reset should be inside a further 'if(!ret)' check.
> > > 
> > Agree. It should be:
> > 
> > if (!ret)
> > 	xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> > 
> > 
> > Will fix in next rev or before merging.
> What about the xe_gt_reset_async call? Should that be only in the case of
> genuine timeout or is there a reason to keep it in the case of an abort as
> well?
> 

In both cases it is fine. If guc_read_stopped() returns true it means a
GT reset has been queue'd. It is harmless to queue another one as we
only allow 1 in flight at a time (i.e. you can call xe_gt_reset_async as
many times as you want and it only results in 1 GT reset). Also the GT
reset is executed on same WQ as the TDR if a GT reset is queued, it
cannot complete while the TDR is executing.

Matt 

> > 
> > > > +			set_exec_queue_extra_ref(q);
> > > > +			xe_exec_queue_get(q);	/* GT reset owns this */
> > > > +			set_exec_queue_banned(q);
> > > >    			xe_gt_reset_async(q->gt);
> > > >    			xe_sched_tdr_queue_imm(sched);
> > > > -			goto out;
> > > > +			goto rearm;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Check if job is actually timed out, if so restart job execution and TDR
> > > > +	 */
> > > > +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> > > > +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> > > > +		clear_exec_queue_check_timeout(q);
> > > > +		goto sched_enable;
> > > > +	}
> > > > +
> > > > +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > > > +		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > +		     q->guc->id, q->flags);
> > > > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > > > +		   "Kernel-submitted job timed out\n");
> > > > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > > > +		   "VM job timed out on non-killed execqueue\n");
> > > I still think it makes more sense to have these two warnings next to the
> > > comment that says why these are unexpected errors...
> > > 
> > > > +
> > > > +	trace_xe_sched_job_timedout(job);
> > > > +
> > > > +	if (!exec_queue_killed(q))
> > > > +		xe_devcoredump(job);
> > > > +
> > > > +	/*
> > > > +	 * Kernel jobs should never fail, nor should VM jobs if they do
> > > > +	 * somethings has gone wrong and the GT needs a reset
> > > > +	 */
> > > ... i.e. the warning about kernel jobs and VM jobs not failing should be
> > > here.
> > > 
> > Sure, can move these warn below this comment. Do you mind if I just fix
> > this at merge time?
> Sure.
> 
> John.
> 
> > 
> > Matt
> > 
> > > John.
> > > 
> > > > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > > > +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > > > +		if (!xe_sched_invalidate_job(job, 2)) {
> > > > +			clear_exec_queue_check_timeout(q);
> > > > +			xe_gt_reset_async(q->gt);
> > > > +			goto rearm;
> > > >    		}
> > > >    	}
> > > > +	/* Finish cleaning up exec queue via deregister */
> > > > +	set_exec_queue_banned(q);
> > > > +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > > > +		set_exec_queue_extra_ref(q);
> > > > +		xe_exec_queue_get(q);
> > > > +		__deregister_exec_queue(guc, q);
> > > > +	}
> > > > +
> > > >    	/* Stop fence signaling */
> > > >    	xe_hw_fence_irq_stop(q->fence_irq);
> > > > @@ -1030,7 +1211,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    	/* Start fence signaling */
> > > >    	xe_hw_fence_irq_start(q->fence_irq);
> > > > -out:
> > > > +	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > > +
> > > > +sched_enable:
> > > > +	enable_scheduling(q);
> > > > +rearm:
> > > > +	/*
> > > > +	 * XXX: Ideally want to adjust timeout based on current exection time
> > > > +	 * but there is not currently an easy way to do in DRM scheduler. With
> > > > +	 * some thought, do this in a follow up.
> > > > +	 */
> > > > +	xe_sched_add_pending_job(sched, job);
> > > > +	xe_sched_submission_start(sched);
> > > > +
> > > >    	return DRM_GPU_SCHED_STAT_NOMINAL;
> > > >    }
> > > > @@ -1133,7 +1326,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > > >    			   guc_read_stopped(guc));
> > > >    		if (!guc_read_stopped(guc)) {
> > > > -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > > >    			s64 since_resume_ms =
> > > >    				ktime_ms_delta(ktime_get(),
> > > >    					       q->guc->resume_time);
> > > > @@ -1144,12 +1336,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > > >    				msleep(wait_ms);
> > > >    			set_exec_queue_suspended(q);
> > > > -			clear_exec_queue_enabled(q);
> > > > -			set_exec_queue_pending_disable(q);
> > > > -			trace_xe_exec_queue_scheduling_disable(q);
> > > > -
> > > > -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > +			disable_scheduling(q, false);
> > > >    		}
> > > >    	} else if (q->guc->suspend_pending) {
> > > >    		set_exec_queue_suspended(q);
> > > > @@ -1160,19 +1347,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > > >    static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> > > >    {
> > > >    	struct xe_exec_queue *q = msg->private_data;
> > > > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > > >    	if (guc_exec_queue_allowed_to_change_state(q)) {
> > > > -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > > > -
> > > >    		q->guc->resume_time = RESUME_PENDING;
> > > >    		clear_exec_queue_suspended(q);
> > > > -		set_exec_queue_pending_enable(q);
> > > > -		set_exec_queue_enabled(q);
> > > > -		trace_xe_exec_queue_scheduling_enable(q);
> > > > -
> > > > -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > +		enable_scheduling(q);
> > > >    	} else {
> > > >    		clear_exec_queue_suspended(q);
> > > >    	}
> > > > @@ -1434,8 +1613,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >    	/* Clean up lost G2H + reset engine state */
> > > >    	if (exec_queue_registered(q)) {
> > > > -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> > > > -		    xe_exec_queue_is_lr(q))
> > > > +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > > >    			xe_exec_queue_put(q);
> > > >    		else if (exec_queue_destroyed(q))
> > > >    			__guc_exec_queue_fini(guc, q);
> > > > @@ -1612,6 +1790,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > >    		smp_wmb();
> > > >    		wake_up_all(&guc->ct.wq);
> > > >    	} else {
> > > > +		bool check_timeout = exec_queue_check_timeout(q);
> > > > +
> > > >    		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > > >    		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> > > > @@ -1619,11 +1799,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > > >    		if (q->guc->suspend_pending) {
> > > >    			suspend_fence_signal(q);
> > > >    		} else {
> > > > -			if (exec_queue_banned(q)) {
> > > > +			if (exec_queue_banned(q) || check_timeout) {
> > > >    				smp_wmb();
> > > >    				wake_up_all(&guc->ct.wq);
> > > >    			}
> > > > -			deregister_exec_queue(guc, q);
> > > > +			if (!check_timeout)
> > > > +				deregister_exec_queue(guc, q);
> > > >    		}
> > > >    	}
> > > >    }
> > > > @@ -1664,7 +1845,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >    	clear_exec_queue_registered(q);
> > > > -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> > > > +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > > >    		xe_exec_queue_put(q);
> > > >    	else
> > > >    		__guc_exec_queue_fini(guc, q);
> > > > @@ -1728,7 +1909,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > >    	 * guc_exec_queue_timedout_job.
> > > >    	 */
> > > >    	set_exec_queue_reset(q);
> > > > -	if (!exec_queue_banned(q))
> > > > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> > > >    		xe_guc_exec_queue_trigger_cleanup(q);
> > > >    	return 0;
> > > > @@ -1758,7 +1939,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > >    	/* Treat the same as engine reset */
> > > >    	set_exec_queue_reset(q);
> > > > -	if (!exec_queue_banned(q))
> > > > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> > > >    		xe_guc_exec_queue_trigger_cleanup(q);
> > > >    	return 0;
> 
