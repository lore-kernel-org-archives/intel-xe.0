Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACDBC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 17:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36910F723;
	Thu,  2 May 2024 17:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnvkqeRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25810F723
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714671555; x=1746207555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l+LJPhM8fpaxeUyL1VwJLyZItGXV2iYjufZZ84MFegY=;
 b=gnvkqeRwdm7a9EKfcXSLAyvqPIgu0580ejvMPNZWUEU0wY0NSOwCJRdl
 Vh+rS8Jgj7tEBCNPMkjsx66dHxRQhrE2ySJ4FYNNw0BM1nnzY0V90mp2U
 /LsjOom17IroSrHTS2aAWbdnBoJJmu8bgHMobmOn5JekvxOicoDTh57y3
 I4maSQI8eOibtL1FriZsDSWapdjMDL53N8wuHze5Z+h0g6jkYdyf8Hkce
 9/nESKum+c9LFJfd8Z1lksjr5IDds5JxZjgr2CsQz7WmVyL+EUMHJuBSM
 hxDRBgXheNEHEXIJk6Ci83hDyINI8F3HxWTwVghCGGxUOx9OmnDE6gY7R Q==;
X-CSE-ConnectionGUID: 8OHiZ93iT+ym/pyaA+C5og==
X-CSE-MsgGUID: 5sAajNemR5OViMaNuze5ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10996610"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10996610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 10:38:47 -0700
X-CSE-ConnectionGUID: ol+eBelVQlOH/Wnk4WYDxw==
X-CSE-MsgGUID: htnaRMi8R4KGMoB+qTMn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27288576"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 10:38:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 10:38:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 10:38:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 10:38:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 10:38:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZthC/hFSvwvWVDXWPkYCtA+rTS2rr18WL/ziPQjnbujv/ouxbSt2zK1Ha1XWJ5FcErL32QbMymrOK75vMlHDlqJGsTHmuAs1yoi1kgKY95Lj7ad5589BipXgXE5mkfFLy4LmjvUFZiR6mqUo7/Ogj/+Y47suQ3a4Ov/tjrAtdxmHaLXJVoh4hlCw0eDVGjnKqSCoyvzX0WGtLJGXKpJ2j4+4/tdUCErjVr649OjcZMi0P9CkQBQEDYD9a8S02FYPpN+unUZmoPbxzo0GSQS+TRPNIGW4wgdhgy/PW+KdUagFtz17uptws+Y371vLRZpjX9ApqFq04jmKtSwCiPc6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euVA6P7Hsq49b/cUWgmRDMPfTQXgAIU8ic6FGvh6YiU=;
 b=mRIrVgXs7HPz2Fju8rXxLda198kl3y1T2KeJw/FiOp77kdlVBPpbxrB1EKiBwBmB2acr9+XyZqB/seiXCk0lLMaKWrLthJFQ47aj/I/skvSbPp3Uv0uERFfVFnm9FPt/j37vTjDPj5pWlJM4/6iBRBG5iRtePFy7wER+OK7NS94xqjumtisoM3MBnpDmsL600YT+H+Vf/mSb5erzF5aZbN9RoCTFMqsJqLpa3xmwZhJAarK5rg/1yMLcOB8hmEpFHKdyYsj6cbHa9naNwWi5cRh+He6QxFit8oCh0HL76kHaTO0ZousVL5+cz/3IwsgUbefAsrqaFKb5oJVJQhDvvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 17:38:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 17:38:43 +0000
Date: Thu, 2 May 2024 12:38:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] Define generic helpers for manipulating macro
 arguments
Message-ID: <tk6kfeniwc3jl3vyuw3ntrwbyyss2sjdeuy6hojzri636mfadn@enhnebj6k34f>
References: <20240501223221.2395-1-michal.wajdeczko@intel.com>
 <ZjM_vNXn9JmlzOkc@smile.fi.intel.com>
 <6d79251d-574e-44f5-9aa5-6f5bc948da0e@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6d79251d-574e-44f5-9aa5-6f5bc948da0e@intel.com>
X-ClientProxiedBy: MW4PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:303:85::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8173b3-137b-4706-10b5-08dc6aceb662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rA7XMkT9MIFYJDb4E6su2pAjIZeWmu8OTSBruONVGiClPwhregiYasVAOQFU?=
 =?us-ascii?Q?MGH+Kj1cS3xZx5PDNBFN9JCx1Jz6Kih+BCPmv0xNsuj68ibghyL4zuYaK1TR?=
 =?us-ascii?Q?vuj5XnifZyHMFI5r331wPh9WCq+8pQl9ixvtKLjZ45syLKwDOUXOUMhA72k+?=
 =?us-ascii?Q?0jDZp3cAtX1hpi6pnpkRhB4vntvu/n8CSclR+UYNmq85YrONKeG59DOIp1Lq?=
 =?us-ascii?Q?69lx7I2aFRDr+38dJdN6Jg5ARreeLPAACfDHKep1K7+2Sg+sG0krJTyZTu1+?=
 =?us-ascii?Q?Smn0myKcd5+WePRraD2opL6s0Bnay3otPzEAO417nHKvlNCMUL7bq7HCn9LR?=
 =?us-ascii?Q?qaN9qpoNVRg6nq5altbsepqXmmO4tT0TJZ9TxwmJTQGygEYfzy3ph94OoGao?=
 =?us-ascii?Q?TmvkoBu/uglxpSlOg1lP8L9ZkV5C04wx5d1ste3J8GenYZ7b+veRPAt9cDIR?=
 =?us-ascii?Q?NeAAeJkqzGlF6Z2ikNtQaPP/6Zlfuk07llJqhAf5oQK3w+YAIjDetOhYdctW?=
 =?us-ascii?Q?QDFU2Tz6XPRZTriJrQGu+AiI+8M6/71Xhga7XbxtVGlICtVAB0d8FArOZUxL?=
 =?us-ascii?Q?wVif37HHmCHKTzdh35q6uYknA++ETujf2Cez61FdPWrtr4VHdyWY1CwJaMYh?=
 =?us-ascii?Q?+xA6b7Eu/b8fqHGE/ptsnfbAObz3vE8bdtWmcb8Ei6zTMVff0a95qZ3ISrFU?=
 =?us-ascii?Q?x6Gy7zp6U0/Fggrec1tuF8uXPtYuthEBpPWPkrOuWcHTXH1BaVTqV5UYaUZE?=
 =?us-ascii?Q?cWA+aAk8LCZG1hAEdggS4FktI4ob/bpbR1ledadfGrCoiY4NC+wLm2+tkGY2?=
 =?us-ascii?Q?nOp0dF6OCPA3ivRHV6YP5LGO89gWm/RWPZ8BGB/6m6RoJll2Zffb3cP4vHDB?=
 =?us-ascii?Q?3JTuM/F8jgyTS94HXJTCKPCQJrKPEomZ23v2IoL7ZWNcWcXpkGvkoSz/E3pl?=
 =?us-ascii?Q?U1Ctq91IETfhI8JY3yCW4obUiBUlGcncIezuYWo1kG/KlP6wten/Qg6KDt7w?=
 =?us-ascii?Q?L6fmJUwKtlEi2DR/e5ZSqDC0yEV0hDEH8UjCnHArlhW8D7crxSFvRhY+USlJ?=
 =?us-ascii?Q?dmsWaa/8/O4vIXSLnZaY1EWFHoyVMOX8yVwv9ObyD4IA4wfUNMTwUU05+4vz?=
 =?us-ascii?Q?xVLyVnD+daaCNF08V32TljGcfVuWn3QbzGFaW6Z+OIQ4h5+EXIi9qaNTzb89?=
 =?us-ascii?Q?d+lkXoRf8iPepgBvg3nhevqmtFb/jU0m1qAvDXkfoAMdf7NXOA0wqtEydmE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pffBg/Lz5+PZRjDdpe6k1+KJtC/q0zL89pBB+yf0LfNyMdyMs4ydyQ/t3tW?=
 =?us-ascii?Q?DLYlK+J+lN/ZJYwPIg+t1gpcOLPvLwEq+JZM6CS/uTM0imggY+1vqGw0VUm7?=
 =?us-ascii?Q?JpfHVk1zn1aPcmxJL0N8GQVizLJpyzf6Ap57wmxOABCb0t6JyfDRB2nxsTHZ?=
 =?us-ascii?Q?vOfOnXcVISpoWBJMth/rx0+rCkdQpR8JjPvQirfFzSqX9TAaMICHvn6Rj8OB?=
 =?us-ascii?Q?K8Qn+nDma1uaQ3f4p6XxbgZBQBgzpeay0V7HfkXWq0PZWGFwtvv3l9t5O1OQ?=
 =?us-ascii?Q?WYErUNYK9pda+VoYUPaEE2bb7I/Z9a2+QZhgfNynJp+8MAkS6Av7wMZiSH6G?=
 =?us-ascii?Q?LrnOZuwKvMmCJkZdzc8gyARGMbx7+7+OBlCMp7v+c+bIfJVT+KSHZeSY6wD/?=
 =?us-ascii?Q?pZKoDNjA4Sh7y6WCDCSX4gNad8hAMnHPahCionisiyu4Brsxc7ahHI6S3vwX?=
 =?us-ascii?Q?lUMVTlEwO6ls8eYh0F0szEf0puFPHYR+7pbmuXdut+xzQEK6WWi/7K6mLNQE?=
 =?us-ascii?Q?YyWqpB/bGsSZCo1Ld6D+niSoM1vuiK60yFABdSCVqX6nIHyy3AN5cFs47FFU?=
 =?us-ascii?Q?Wqk8qRY6fhQVCw8u/J/xMs/zU/CjEko1c95EKLZz3uSyXoDvuGRwHRuw/B+S?=
 =?us-ascii?Q?+gv1RuDWNEijmtSD0chXTTF3G8HmAywdx6lFyj8SBSBRVrHUAy07axc9Zurh?=
 =?us-ascii?Q?O5Snft85dHx829OYO2uF+3hW/Xxkd2iMK2yKBkldDhNZl+Gkx+OIHu04bVfX?=
 =?us-ascii?Q?uJengyt9O+mW6NkKC6xPt/X1vpdQGqr9Qz0+gj0cuLAzNsVqokExlgy6SGlY?=
 =?us-ascii?Q?LkdiGuRmWXACZpq1g0Obh5JAGbym+KMO4EL3iwviFuXYvosIl8+npT40LVje?=
 =?us-ascii?Q?FOuXtPYs9vuy4xsuyxP/ASckO/kBFUv7DDlaaDjANYsDNm/AvWtQY9zh2319?=
 =?us-ascii?Q?nc10LSZw44uHU3YcHhukm/VofZLXR3qxhp6Df/pAcTJQFcIM4FwHRQwAI76/?=
 =?us-ascii?Q?puDue2iqAWZol4Zkb1I7qUNUiqtkGKr4f7cfTTQpnweB9gzohLoEyBX2VbNN?=
 =?us-ascii?Q?NjMcddV88oNdJwp//nXEWkO0u1ZDheUEEtNdQOIO70PJCX+/yezG0GGvnUiF?=
 =?us-ascii?Q?RibdrrliWr7t8xLoMHxy0YFMBSfnijLEIzQqd9M9pnmta9yVpIRR5FeHLFPL?=
 =?us-ascii?Q?FZRinD76NI9sAV0rre9dsXBVRvr4f7ZEauiedW/Z0L9MbOkdF1AXnkaymWNX?=
 =?us-ascii?Q?zk/Io/puFE3dpzVoDcf+7DkDIBVPfyQr+kT3eDmqHdLOqZFmFU5wK1aCM5n5?=
 =?us-ascii?Q?QpQzHhx2XA5oAikj4FXq98G4NclNG0FcqbR1fHwUpRk7s5YLy3aLBJPcQDdY?=
 =?us-ascii?Q?lf62QTTASR+vt0yiePKygqGx5NxmhKtpKVOJwM3t/2Hftr1eGUUcZi7kuNtL?=
 =?us-ascii?Q?qktUosZhwFmhOJVC40r0zPbmR2woOshfPopQmjHRKcSupSy2tGtQGkd9G9XZ?=
 =?us-ascii?Q?S1hgKeLPLgeBHOMkB+Nc2dVEZQMk4P0+XmO5XRdiqvX/J6NC04tQYupMFsX5?=
 =?us-ascii?Q?0tPCIlouepsyGCyYe0fbNjQbYsODyEmOy+oxjYvEjiThgewmMnRbyRsm0V2o?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8173b3-137b-4706-10b5-08dc6aceb662
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 17:38:43.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMabV6b2eS9UAX7FKNSSJZd0wlNCvy+FP093UI0eix5mwS2vZsAVIWHL2BcQarV5hghvm/2ESzMlP+4eL5DJXctvg+4xOTf6DTYDoFBmj6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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

On Thu, May 02, 2024 at 11:24:36AM GMT, Michal Wajdeczko wrote:
>
>
>On 02.05.2024 09:24, Andy Shevchenko wrote:
>> On Thu, May 02, 2024 at 12:32:19AM +0200, Michal Wajdeczko wrote:
>>> Michal Wajdeczko (2):
>>>   args.h: add more helpers for manipulating macro arguments
>>>   drm/xe/rtp: Prefer helper macros from args.h
>>>
>>>  drivers/gpu/drm/xe/xe_rtp.h         |   4 +-
>>>  drivers/gpu/drm/xe/xe_rtp_helpers.h |  26 +++----
>>>  include/linux/args.h                | 103 ++++++++++++++++++++++++++++
>>>  3 files changed, 115 insertions(+), 18 deletions(-)
>>
>> It's good in general to have the code being deduplicated, but the above
>> statistics is a bit scary.
>
>The statistics here might be little blurred due to added documentation.
>Without documentation this would look a little better:
>
> drivers/gpu/drm/xe/xe_rtp.h         |  4 ++--
> drivers/gpu/drm/xe/xe_rtp_helpers.h | 26 ++++++++++----------------
> include/linux/args.h                | 26 ++++++++++++++++++++++++++
> 3 files changed, 38 insertions(+), 18 deletions(-)
>
>> Do we have more users where we indeed make code much
>> nicer?
>
>A new user (still inside Xe driver) for these macro is on it's way, but
>before that I wanted to start with a preparation step and promote any
>generic helpers to the outside of the Xe driver, as it was pointed in
>similar case with other helper macro [1]
>
>[1] https://patchwork.freedesktop.org/patch/578134/?series=129854&rev=1
>
>> If not, let's keep these where it belongs to for now.
>>
>
>If this proposal didn't get any traction, which won't surprise me based
>on outcome of [2], then at least I would have some ground for creating a
>local xe_args.h or use xe_macros.h as a location for common args macros.
>
>[2]
>https://lore.kernel.org/lkml/20240214214654.1700-1-michal.wajdeczko@intel.com/

I share the same concern as Andy. When I saw this series I was a bit
more concerned because there are plans to change the rtp part in xe,
moving it partially to code generation rather than using CPP.

However looking at the changes you are moving here, they are more about
the simpler macros. And it's nice to have more documentation and make
them less magical.

We need to be careful that some of the macros are not generic and were
purposely built. Example:  _XE_COUNT_ARGS() and COUNT_ARGS() are not the
same thing and return a different value for 0 args for example. I think
we don't rely on that anymore, but we should really pass this through
CI. It should generate 100% the same code, so checking the .o matches
after this change would be good.

As per xe_args.h vs args.h: I think we can take the intermediate step
doing a cleanup + documentation by moving to xe_args.h and later try
to promote xe_args.h to args.h.

thanks
Lucas De Marchi
