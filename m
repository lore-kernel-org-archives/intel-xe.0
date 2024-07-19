Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E2C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 07:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CF010E03A;
	Fri, 19 Jul 2024 07:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONAiHSop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5A410E03A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721373488; x=1752909488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L63qooVNUd66OIk/b3UG+RKvgZcq7qzR9SevrKUNIeg=;
 b=ONAiHSopROEuny/NMHTvK9gOITMLfce8WPq0cnr9B8EYuBkwfLEBAWQg
 pZsBsJKwkAKxT4yfyLbf+mVn5WHf0jFczSYlJHiALQGUme38nTX8myidi
 RqHz2bo5o0OCrSsB36JNVdW4Rz33epyHPLYQMHL+7ti8x20Frbq6S/wPa
 Z1WTmtrYSsg45OTH0enT7HcrtSjtc3QOoaMNt0BRyhcxFEJM2DN2Q1isn
 T2s5oKa52vxllytkwCoviXEIYXDXXlec2Ud99nIjnMI3kqtyccgqG+Gs/
 4oiISarj7DMTfJL0t4WRB85JgvyrYTWG0cdG/pnnixLj1MlRcrsw8iol9 Q==;
X-CSE-ConnectionGUID: lKNQVDXCR32kZYdd5akIiA==
X-CSE-MsgGUID: rBrnJXQlRYKs7rA38y3EGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22840978"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="22840978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 00:18:08 -0700
X-CSE-ConnectionGUID: eJUu7oI0Sbm85wnuqFJ6jw==
X-CSE-MsgGUID: CuNJU2hPTYuR5QXDmRPtmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="55217202"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 00:18:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 00:18:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 00:18:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 00:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEyVIxhvzXKUh44btrMsHsKDPrf30k50jOU/QrsAbi1Z4IQ5+J2hm9tp/ZX2ygeDk+Wyn44vpHy+fFdfqgBiQgrY6CqeNK8iaW50lPhf30JH/v+oN5/ofPENKdhUMXq3wm3b11WLBN3PGcMbKJ4NMUnKYg5vNnsj7NtuKp8uMSX2VRwl8jci/VilcLg5eAwdXcdotwBT2EmXP/9/UKtEmMGRd3HFC07j5qGLlPuJjD+jAm1w5eN8xaW5c0KLrtKwqFs4yKy+HVnfbrLpMI5XGtyhjHyKF2wyxWb8P/PS6955xQv6YAkkvAbFlpIiloWcqmjj7LxF9hrfalaOhhumdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0Qo5HJSGX6Cx9g5CBJmpEu+uHzgDLyy1SMNIxVaKpA=;
 b=MNWregDZedviqAAqQ1/OMcX7ic+gGsnouaPhK3bM4tsUFIzncYuVR9bQFBLZT4SjS5kLGGAu8DOK3Ljx6w54rYNu9qvITCSno8Ee7kZRbOQBfpTuK/pU+aea1omV+7vb4IzxEfpRP3ZvftGpRBwROAyqFQYrk0itg/WrhWzC0jgGp2w3YX38Oo27nJ835+ilsgm9SYzf8yp/Ga5ZSZJ7P1mzlU1ZLgbAUEylbHDzEzJMC8kOp6naU5UuI/Txmc+9+koZJUBZr1bKcoJfF5bnGvxJHfsAuLSQ5Tc6hwb+0tjXZSdWBI9HaJT8Y0huBbyeVTctfargIVCnXUZLvLpzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 07:17:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 07:17:07 +0000
Date: Fri, 19 Jul 2024 07:16:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/4] Have xe_vm and xe_exec_queue take references to xef
Message-ID: <ZpoSw8/LCzIydcsj@DUT025-TGLU.fm.intel.com>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c12f24-9f77-4c7b-966d-08dca7c2cc6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DbSRqUGzC+oqh2RmoHQ0kjHZCGhMJxxDeemVc+D7KAIcgTutUpRliIiPhQmv?=
 =?us-ascii?Q?syNuZZMDnVi3SpE9tdPMImo4xDME32VZ3FFf/7g329AjPRxFg3RHoIkxPs2S?=
 =?us-ascii?Q?PJlwUlZUerJ8k/Y1dFokqfAJKFpyHdCEbEvwamsVJKwDA+aelyb3u5lYDume?=
 =?us-ascii?Q?TARffDBUTJIgVg7RvA0FmJCKPbPWRDDA/RUbXv+rIfxxnS/7Dunm1gsX4V6L?=
 =?us-ascii?Q?s84AxmRWqneTKqmRxre34VNV+CtjvHaLwDjL9gRZlodSzv6eBwhC2Mz8SpcS?=
 =?us-ascii?Q?vMm98Y6iF8zl4RK8byvEVST01sz1EMOHW1jIeW/0MES9Qg54QYodf89RxND2?=
 =?us-ascii?Q?Oc+ZbOBUJxetFpwTJBBV7FxcmXk9WmwHdnp2yC5XD5MTqdhAXCaXVZTAqyVu?=
 =?us-ascii?Q?Ug/+pZRc5BkEtE0olJxHk6/2YNYhvRyEiVbS1O1jUuDFDr1A8GWiSIV62mCF?=
 =?us-ascii?Q?eU7Ssx2wJmLqx7wxavBmR8mZADORAQ1wddLNBGjNNmpL1Cs08I4QnuKngDIm?=
 =?us-ascii?Q?pQea16JqhsUhOXsGFIqiqaKdkavA+CTR+agu52bPnnd8qUhSK0DMimTxdBpL?=
 =?us-ascii?Q?EtyiDHLe5gtxyK1oWwo36lgWKbep3HvQCv5/f9Mywdd+srOw4ShuiWxuiKWB?=
 =?us-ascii?Q?edVWhAciI6vVY38CNHqrKlikce0m5zvEbyXhW2mD02OnWdcarNyOJLtgnOXw?=
 =?us-ascii?Q?kHDI/RyWL/Pz5xANOQAiwfrkkW8S1I/8v0r8s4CmqVmBVd5n3z4bNOzuLbJ+?=
 =?us-ascii?Q?BQlP6uj8goReef5mmlK0hvpGc2BSuw+uGWXnWecmd70rS4ED8+Q8pz6qk+ci?=
 =?us-ascii?Q?8727kW9VixJ0Td7QBhcOSq4BoTJfuSpRDbCmew/obzWj//5Z/POlynJriT6M?=
 =?us-ascii?Q?Y+yRvrr3RqMXOAZrmiqY4MOiuttt5nezLELuqDIeWyJ6Lb8mjZsH+Bbj6H4h?=
 =?us-ascii?Q?U5IeTeZbylwZiC4Z/Np4B5rgL/rcH2Kwrt9u950ULKGj59AhHq1iTHhPweLP?=
 =?us-ascii?Q?USvdmei1lL5rOWRi10RBb3YL+PrmgsXJ2j2S/dVsvC7FIaiQfRfLerWEJRc2?=
 =?us-ascii?Q?xmoRjVbUZ7WRjziyVueYvHKq/vdAaOCjMf04aSKzW5nwboPrZbS9yHPGKQ6J?=
 =?us-ascii?Q?LSChLTwQC3lyasEchiq0twxosHox/idtPgEu3zyvE3uMhVM7TRBR2yrv+l5J?=
 =?us-ascii?Q?9B+zQ3MQAIIBGUM+hW8cgx32XgLh/5T6UvKWob8d6501UaYxDl8mdnibfIv5?=
 =?us-ascii?Q?3D24xWP23RQrEDFbwT98DWzBjEqY8ev5AyXkRHO2h30FLdpEDkJmUNlNFTea?=
 =?us-ascii?Q?jJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2IbihRCrkjUwfYPzBA3M7B2w0VSFP8a2naqK3ki9+v0IBJrKKpIJUYPDvCK?=
 =?us-ascii?Q?zPBrKn1YncO19k9tzgnn4FhmFEZs0d5GozcE/RTfNer+h3B98PEzRqFazdvi?=
 =?us-ascii?Q?S/yi2e3m8zF89xultBsf4TTBjq7O2qp09Qbtv0DhsLt/yh1RTlocx2JPT4op?=
 =?us-ascii?Q?OF5TFBITsQDgMYWyJVEPH0TsyMhw0OziU6x/mGcZs+pMBNVg7Y475C6xiyr3?=
 =?us-ascii?Q?f5gODffltCXl/qVBzFSn8IQcR0wG7i5amHFMFcuNOgxfIPUA0cK8lroW5rgH?=
 =?us-ascii?Q?QexBoeIDsoQEgVUvfcpV8ftzGdBjHQ+iX8gW/qbZsQrut+JzU4hRjuDfzDxL?=
 =?us-ascii?Q?M7eyAstTIFGEupAzptuP9vK0+DBBHGdxVv23QtwY2GXJLu4S1Odt8GMV2ovl?=
 =?us-ascii?Q?LG0JAs+rL2E3QbX31muA8cVRKwFEDEWgjTRXRbhqYRQ5SHzWLtfztHrIRJZb?=
 =?us-ascii?Q?fEYYPv8buSn4euNbIsGx7qnxL0JVJU2iapPQs9raKYma8SCqtb764/Obzhit?=
 =?us-ascii?Q?JA5UcPhSDqrkVVTZIQ1YlamG/PMm+uT/yXbr6DiR6v5gemxik/GOEUTwAq1o?=
 =?us-ascii?Q?wqgEceDGfF951OBIjatPYWYjkPlar9B9Ju0zZaMux1J0siobdUOLAZH771sC?=
 =?us-ascii?Q?pFagNuSxbwxMo1gC98OnzEgmIyTOm60BO1wG1sBzavUvqK/If1oaG/NJTisB?=
 =?us-ascii?Q?MGASAPrFKIerjW+Q3ZuZV8N7eqxxf9EWBdyghxhG0YPPJ9ChDy/0cZGZwzys?=
 =?us-ascii?Q?dD/CSrWP3/miLIlSmIIgXIB1FVneg/cIYdHbYZc7KiZp9C1C5vfwIhXQyfOW?=
 =?us-ascii?Q?mn9h13qoOECRR2Zt5DVgv4QFyTdqM4zqpLR6RP9nSOD9u+jQ51rx/hT58YQn?=
 =?us-ascii?Q?4Kgzs+37nW9em903aHDplTnOeJulDVF2SBq2Oz518PPfpR8zZ0u+WDDKqvCD?=
 =?us-ascii?Q?ZYaFUJzFOpA0QnBDtOgZRc5ww95xI8MMNVtPBZTPSqnKaiLirH2zEcNRy55m?=
 =?us-ascii?Q?XKvui+d2JXV00/xgWSysUl9y8x6JCGRkaD+p+KtoJgoGcAwNSb7c0smN7+/n?=
 =?us-ascii?Q?K2rIU5udVJYVBoJXWZbB6yZ+jY2r0FdmAR1csQhCVzwP4BirUjJ/jzUdddrE?=
 =?us-ascii?Q?Ned/ryNNyt8YEEHs3muHf8FO3pQTHchC+OnDTnRGAWL6mQS75gsRobwLLeHz?=
 =?us-ascii?Q?tDByG0tNUVuljoRNMMUgi7K5XXtEBwzcz3kfukjjJaylOwvEayZCi4zDnfKO?=
 =?us-ascii?Q?JaZz1ibSyBYqv4n6qJ0s/200PAax6cSs+2oFCsPyDc9aJFRgsUXgP7LxHzbd?=
 =?us-ascii?Q?MZYWhfFrnQHaJS6KcxWrCsBEC0Le+WM2VZHA4JEGnEb8YSSgjqN2VOVz+ANM?=
 =?us-ascii?Q?x61MHjgap/HcwKevpjTYHxqKn2N40pp7xiZdwD0D8/HCQcezW9WNCCO7Kuly?=
 =?us-ascii?Q?/fCULa5jVohTfQQjqYYxwPKq528DcIH+4SvlH/302qfl122HfZAYxwz8hiYv?=
 =?us-ascii?Q?RCvXmQwTtnnYJw8g8MQkHZztMioEFLez/cm/k4pvMoKTTqupgYY+mI/dxbqo?=
 =?us-ascii?Q?JJ47N/0FgqNhaqI+3yII149hE6H4zNNjIw/HiuC3+SWENUmM697cyiuL17XE?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c12f24-9f77-4c7b-966d-08dca7c2cc6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:17:07.5696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjhvPYdpbZZ6YwFsQoRlkak4NLUmCC+KAI+Z7ny80zzCjTAwusGxbqc/HoSjfYIN4KcnPe5+uls85IgWtPC/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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

On Thu, Jul 18, 2024 at 02:05:44PM -0700, Umesh Nerlige Ramappa wrote:
> Just posting the revision that will be pushed for reference. This rev
> only has documentation changes compared to v2, so will not run CI on
> this.
> -----
> xe_file_close triggers an asynchronous queue cleanup and then frees up
> the xef object. Since queue cleanup flushes all pending jobs and the KMD
> stores client usage stats into the xef object after jobs are flushed, we
> see a use-after-free for the xef object. Resolve this by taking a
> reference to xef from xe_exec_queue.
> 
> Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

It looks like not having ref to vm->xref is causing other issues too [1]
[2].

Let's get this in ASAP.

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
[2] https://patchwork.freedesktop.org/patch/605099/?series=136240&rev=1

> 
> The series adds xef refcounting and ensures all consumers of xef take a
> ref to it.
> 
> v2:
> - Include review comments from v1
> - Squash patch 3 and 5 from v1 to add Fixes/Closes tags
> 
> v3:
> - kernel-doc fixes (Lucas, Matt)
> 
> v4: Rebase to drm-tip
> 
> Note: Patches 1 - 3 can be merged independently
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Umesh Nerlige Ramappa (4):
>   drm/xe: Move part of xe_file cleanup to a helper
>   drm/xe: Add ref counting for xe_file
>   drm/xe: Take a ref to xe file when user creates a VM
>   drm/xe: Fix use after free when client stats are captured
> 
>  drivers/gpu/drm/xe/xe_device.c           | 58 +++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_device.h           |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_drm_client.c       |  5 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++-
>  drivers/gpu/drm/xe/xe_vm.c               |  6 ++-
>  7 files changed, 71 insertions(+), 21 deletions(-)
> 
> -- 
> 2.38.1
> 
