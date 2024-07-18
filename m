Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD63C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921E10E063;
	Thu, 18 Jul 2024 18:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6zS6lC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573E10E063
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721328214; x=1752864214;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=5rKXBdwWpVOXAzRK/5D7hcvdofEV/eOM/hzo5cuQ3iM=;
 b=T6zS6lC1qZcHuavg1Jin1MW3tyqQb/9532opo9wqVxG2CuQIMzp4kJFG
 Q2G0dsRO33JEay6SBQIln56/cgQUp4FbdG2UFLF8TcI0ah4P1v+IEqFRd
 JZfSsTRzR3HAQN5Ngy7/yk8H+ICAOm20PbJLOJYhcOs9Gbz4rF00DtcCv
 +thU2raSNuIRJ0u3r6cCQAwIDzzd0ow0CED7uy1CFix5/XUh4U1bLJDSt
 UrWB0IweXbNcyMi8Rz5XXJJrxVSizPUPz4N763zQOioGXqmPT82CttqHC
 C/Gh7m7VMOwxu+fDOjLFJFt2MQSVDZ4iJBALaulJO6ZuNgO4thHiNn12i A==;
X-CSE-ConnectionGUID: wzTo+H3XSKamDZFKan1g6A==
X-CSE-MsgGUID: ZRZfq0eZQQCj+GFfgrjI/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="36452934"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="36452934"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:43:33 -0700
X-CSE-ConnectionGUID: BeoeYnebQv2hSxChMmPEAw==
X-CSE-MsgGUID: HTlkNnyAQhWfi8R+bxpBvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="50723855"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 11:43:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:43:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:43:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 11:43:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 11:43:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuIhnGMNBfC3qVRQ6wcUDSCUwNvP5RObBVxmymA5nhKq3+9JO9cmbniKp6nI0tRtFI3LnLahMxD7hUhJ90SlE6NRPtXLbz5gXcpgoABvEOvmPkWdOMfhkLJx++bwnexlqfe+neh0Wj4MKR14naWvuPeb3P9Ken017lI6OV4aTwAn0rsEai6sTXTW9dxMMXzv3+lYJE2mfDgIzRKe4uwXt/0jLGyzFYi3dsH8NMrzrMv1POgYOOPy+vt7k20n0B2nppBEN+CAYaZjRJpfdcXdaEzI0aSoG8qJEvOKjpZ7XKnQk0u18octbnhcN25Vs8LpitatNMY02x2SVFUBUT1Rxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44HaVBMiGyzGDn34tdKHK4FbiGCdJNgE2fw3YHW5mLQ=;
 b=bIA5VAPuPRRSuP3TxQsdSb675ZOm0HHowY2lfMCPeYfdXQKA7lEBYV7q1sNyaN3YvuMhmxTtgNoLpkcWkPQx+6elxTH0WWNwbc5vwSq5AlQiONtOJTVYuEGYsyIVWGc9FCcdK1GmPegQNL16o3srpwt6S0odvXnKiK58OGrhk1rkJw8KRHtnySUl8IztdOwkBzyx/aosijzz/Ukj1upr26lpXYCXeyUrWS4dmSVs0yGh9FDp7dE332PNzV4+L74gVcQBWvYUIRkWK4XQCfNEJUWEV5TUfB2ITLwLq1/wXP7chD5zeT+zyMQNyhTQJfT8675d2KMf9nYPCnOtSlrhlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 18:43:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Thu, 18 Jul 2024
 18:43:29 +0000
Date: Thu, 18 Jul 2024 18:42:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVA==?= =?utf-8?Q?=3A?= failure for Build
 PM into GuC CT layer (rev2)
Message-ID: <ZpliI+lLtsV+ILfz@DUT025-TGLU.fm.intel.com>
References: <20240718173445.1490455-1-matthew.brost@intel.com>
 <172132675089.287349.11586045289897142861@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172132675089.287349.11586045289897142861@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR11CA0063.namprd11.prod.outlook.com
 (2603:10b6:a03:80::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: b72ef5ae-663e-4f53-e725-08dca759844c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m32F0CAU58CbvhlZdraof3BcVYAeDMjD2BNTUpMu3f6mlS69XQ3/DzRNKWue?=
 =?us-ascii?Q?+w3ComWIMLlxvDOUP72dtK7dyETzP1flxS5avIQx9gyaAZ0uFqroH7/XdY8w?=
 =?us-ascii?Q?60xS42Z/uO21nd+tCSmoa+QJIBkrJxRKc/oK9IET3W+N9/SbA+MxIHUeRg7n?=
 =?us-ascii?Q?FHy7bQwMULEeNfrw1L9MIa5IgsOdME45i8RuNSBwunymSm1z8uoQ+fRQziWi?=
 =?us-ascii?Q?XuupJXNOw2nXRgzDjQk7guR637A3lMvl8wkA3BHq9sJuNMFAL35rxaVGMq1D?=
 =?us-ascii?Q?46Vuc14htYjhfhTVcbBkQLhqH+/EE1LFgm8U4r2oZuKrwUD46t6NSI8mVlpi?=
 =?us-ascii?Q?JkW454Qqrm+o4QyCvOZ45OhDa6VL8bYKzdSuaK1zl4u+MxB8QzzTuYLvBJOA?=
 =?us-ascii?Q?dBjuS3mlszNWrjy+V27NFwMfZw/fXVqJJ/YtzMf40AoTrqcPQMSye+oiy7eq?=
 =?us-ascii?Q?gGHbl95KX5NloeszK9Uo08glm92BspzGm6ev7k6UJwc8ptXf7mToNwFKZ9iz?=
 =?us-ascii?Q?Q7XZrbTVJhfhZi6VVBO5hf5cjJ0nHQ+iYqyhSRwotOrBDdzRy9xOjjG211Ne?=
 =?us-ascii?Q?PHmB/vBrW0qKJN9RaYV5gZg8EhN59mEPUeEqQRYTYNIBVWqFEMeXkuINjlYG?=
 =?us-ascii?Q?mu1oN/t5XHhHqdmB9EkobmLoKCQsmUnVUBBoLLXppbd/LeMaiOH3fFzsk8zY?=
 =?us-ascii?Q?7Yq6n8RnF5GKDLJYFaAg7Q2WmMpyGStYaItcpk5UN+Mgh2fPRHv5Moe/O3yr?=
 =?us-ascii?Q?pn/fOc094zVcsDviB7fp/j7TdqVAFs8Z7TFfj0IAhVcGKG+HEvKs2fgUlAvC?=
 =?us-ascii?Q?xHTm/KJaaq54MW4OhJd90cX9b2wo+D2D3EpSDI+CJd9zBY1/OsJUtJcpQG3c?=
 =?us-ascii?Q?KRi05/4uxuKNyahxVs4KAUV/USTJdw/d2Nc72rudqmC3VJTiMx9AaUNwAwaJ?=
 =?us-ascii?Q?De3ASU1Rh5IHWSkYt3CNA+IdLj0oSQJnp+o7MNqVmB5EQWJpoySTz9cfyLEf?=
 =?us-ascii?Q?MJFSEgh+AMPj2DQrfli6KVr4uk4mh03pfH3482F/5qrwy/pLzE7BkqToryLe?=
 =?us-ascii?Q?D8UNpvWGuP7UccsgMCZKqX+pJM+vJhvvVx2Ekb106LKV5wt5eRdKEAmTxlNu?=
 =?us-ascii?Q?tEbCXKzQt9pq+V6OOFxpl3mRB5ie/f0juwfHZW61OjldUTYrtwN6N2NtNfhO?=
 =?us-ascii?Q?UGE1OjPvMQ6ZSvQ/5lIyNWvJ8Lwq2r5rwKiVugkGlK7n1Y7+GSwoxI+hXfPb?=
 =?us-ascii?Q?eJKpOJpqtPa6vhat/3Mdj90hlAxh/o5zgz4z3JIwY+dRiTUqL+ItiVkB7Oj/?=
 =?us-ascii?Q?Mnc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?104O0SkV6noGbDEllSJ8Xy+onil5IvlSXv1tarNcuemk/xgMDnH1icxCYQud?=
 =?us-ascii?Q?h20WI8Iax47+Y1aROI/gCjdtrnyQoGiZXEHCA2EULkyShxtLKk/d6slHZJXL?=
 =?us-ascii?Q?aPy2a82v+7KjNcF25E8dq/7gamQ6HlO9uo0VC7hrTkAiTS8pwk9hKYBOLosC?=
 =?us-ascii?Q?Mblh55ssMDnCiYxB5S3q1uBASejvhAfjUeOL/rSrci2ylo7MOOMQ7KN8n2sm?=
 =?us-ascii?Q?PDEDpY3FLXlNJbHlibwQdPfc6bb2oqUnP4+j5g+AfWiaiuTWJI1vLAwTTrak?=
 =?us-ascii?Q?EG/TjzMHtmwxiyij5CY+6gS7GPXBjfaQPdQhM4DPW8t7sayldDXtQDGsWyUi?=
 =?us-ascii?Q?YLOyuwSP/DYIZoDlAAU2I5NLe2ucdO+hAy5DNnqN0BysdxnHrM8hislTCQNL?=
 =?us-ascii?Q?LUvpcRrhNAl+oakF+G3CoxrubcjwAmRdsyj9Orx3LYuODep8sJHLjOMJKAF7?=
 =?us-ascii?Q?hhegYjpGRzH45/UU0wT0DCJ9V03beGfUMi7Cs5YgiINun+KsC/VpMyDzhb5j?=
 =?us-ascii?Q?L5TnQgfZzGG3JKlRhJrbgA5Vj4lzDEiAyPzKXxy+0bNOcgic+3L1RC+cNSNX?=
 =?us-ascii?Q?0fEDHLdefL5iC8GsHLWdXRIhWzerv3AfZ2u9PMJ+qDzKH5hxoMRO3znEQ3yZ?=
 =?us-ascii?Q?mtaBkELt0rX5k9tyLUXv9HPcPXbjhfWUgKum64oRnaojw0Vs/SQ/W3klJFN/?=
 =?us-ascii?Q?hOg35yNRi0wdJ4HK4qwS4mueg4szalRJiBz6iVBEC/nkB+L7fxSnArkNuEGF?=
 =?us-ascii?Q?v7h/DmULLPwnEr3YByHtHba3ouN3Ui9he2TS88xR9YdrvDm6n+Iw0Drct3d4?=
 =?us-ascii?Q?phicoBDayDNIF0nwvVMZaWwTCNN9/hnrabrPgJh957tTgDbc9mVL6tXfWE7d?=
 =?us-ascii?Q?rUuuTu9gEkJWBGL8M/y/pjOdl/+uq5svHkd8WfshjwZ4DPVKk9hE70ybAvbW?=
 =?us-ascii?Q?/ig+qLXC+eWbnvhShQSuxAMCTI9KE3sYSqODYixf04WfGT7BJkj0iXf0rptw?=
 =?us-ascii?Q?PG9m+skEmhTmfJ2DxGzVsvqFjpVBF64Ukl5WqWaHA+9Ex3MS78MoVTTk4KQA?=
 =?us-ascii?Q?bR9KYmm6T9bgIJKZkdR4DPyTNoSgT1VLU1l+k4dc/vnY23JFPtsKKxvrHLLf?=
 =?us-ascii?Q?xj87NOzOiz6vPU7mNkGwHn9MRhEETy44vU4+0bAY2x4FDHXZ598OL37+oUGc?=
 =?us-ascii?Q?HVYFzPF1n8Od7VmUOvGG8vCd1DWKs8swUFXzH4reSed4bcm02RJINpeqU+S2?=
 =?us-ascii?Q?8NJ8HzDBKyvta8jS88Hfi/5SB4myDpmEPWzs/2536oJgogrUSg0u/oB6ix51?=
 =?us-ascii?Q?V+dNT2dJOAa+68aAISDEt8ahbuZJJo/Qy50p874aiJhPbjohuizajzcmrFrR?=
 =?us-ascii?Q?K3ToChLd1Z3k0l2GYJlI1enwXFDiiyuZABJO9gdoHLxvzZsVQ/Zucylnlog6?=
 =?us-ascii?Q?dZIQvMkKO4i46UvUzlGgFYlQos6PBVG21PVI24AMdAqzrF6j6hgW76kuX53j?=
 =?us-ascii?Q?FR1gqxDwIm58kEARfCKCh3EKgW8/4OyLpZZq0eCjTlgn91j04b4rWblWRpfM?=
 =?us-ascii?Q?wyemG+FzxiU5rSQMcmkpjD7B1zrXn87XInf02AqDvQ93MTZWttRWhC3qLzue?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b72ef5ae-663e-4f53-e725-08dca759844c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:43:29.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVXLoiueZhKIMl7aeXUVRMsIEZrvnVpmxQ5mIpctITj6YZIMss3qbdoBdTik6+w0E//salguk0QCB5T28qBcvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
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

On Thu, Jul 18, 2024 at 06:19:10PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Build PM into GuC CT layer (rev2)
>    URL:     [1]https://patchwork.freedesktop.org/series/136226/
>    State:   failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v2/index.html
> 
>  CI Bug Log - changes from xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d_BAT
>                              -> xe-pw-136226v2_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with xe-pw-136226v2_BAT absolutely need
>    to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-136226v2_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (7 -> 7)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    xe-pw-136226v2_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_vm@shared-pde-page:
>           + bat-atsm-2: [3]PASS -> [4]DMESG-WARN

It looks like this series needs to be combined with [1] to be fully safe
due to TLB invalidations of bind being kicked to a worker after a bind
job signals. Still worthwhile for correctness, I don't think a device
should be suspended when G2H are inflight or scheduler messages are
inflight either.

Will post a combined series shortly.

Matt

[1] https://patchwork.freedesktop.org/series/136219/

> 
> Known issues
> 
>    Here are the changes found in xe-pw-136226v2_BAT that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@xe_live_ktest@xe_migrate:
>           + bat-atsm-2: [5]PASS -> [6]SKIP ([7]Intel XE#2109) +2 other
>             tests skip
> 
>     Possible fixes
> 
>      * igt@kms_flip@basic-flip-vs-wf_vblank:
>           + bat-lnl-1: [8]FAIL ([9]Intel XE#886) -> [10]PASS +1 other test
>             pass
> 
> Build changes
> 
>      * Linux: xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d ->
>        xe-pw-136226v2
> 
>    IGT_7930: 7930
>    xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d:
>    943ad04000a54cc7fdb5347606d0ce6a93ea286d
>    xe-pw-136226v2: 136226v2
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/136226/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v2/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d/bat-atsm-2/igt@xe_vm@shared-pde-page.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v2/bat-atsm-2/igt@xe_vm@shared-pde-page.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>    7. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    9. https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
