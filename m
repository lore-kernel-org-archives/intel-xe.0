Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AD7CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 09:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670F410F528;
	Fri, 26 Jun 2026 09:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbasbY4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4310F52C
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465528; x=1814001528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xFxgXPfopDDAVEGkHr/xRM6OQfBVNsCOZ7ZFwa4xaVw=;
 b=FbasbY4UKunnuOb46h/GFKUzXx6F7i4ISEru9xWOMYbPoOs4sNCP3jUU
 7pxMYGEgwTzmiDC75Wy0LUSliLcY2LbWyYbmcXO0ibWIRQISwJuZbhYXk
 RuZmX0sytaF0+Spz7ZtBwQKaaWfjF2Bdh91+BIU/yXQxe/4vzEKpa5PCK
 YbWkNpi5WKMb9mUammiD+P56iOHa8wBygF7Gh8e3nkmW71gL69lS+pDzH
 6a8YsAM5NrpnXnS1C0sz8sT0p5W68690jBZRy8TDtgGnPAQTqT/78CCi0
 BbiZ7dI0DlzLgaPV+9gni+el2nKYhsh1T1HSlgQeLVwseMJD+7jf3X6NW Q==;
X-CSE-ConnectionGUID: bSMigAlUQPWhEtcFgFyang==
X-CSE-MsgGUID: TOwCKhgMQ0uE5pD8BxrVgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="86938011"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="86938011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:18:47 -0700
X-CSE-ConnectionGUID: 7f1roBp2RJ+5uATkM7nwGQ==
X-CSE-MsgGUID: vinBuUk+R/ijM6Fngtwq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="247913246"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:18:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:18:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:18:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ4L0421bqB6bKgbOqzB4OTnwcQNUQyFI2R12PV6EmVWJnWH0aWHTyqlt/LButdx/l0aZ26TTfvJh+u2OUSFv5lFEZ73+3Z3R3QQaXJmCuveUKTF4VtwFno60ITRX/yxjnCfABdZEbjwGPpWnoSfsrVlqv0EeiJDKoGN6YG+28SOZLOCd6pHsRgZMzCzkQsAl0hd3bzIeFCi60eNsewn2YL5hmaQgNhQb5pPpOuEr7/i7FtD3nEqpGhDFKKSh9LIqF5Zijr+Avqn3PQwx1U0bPHxWxeUpj+UzR7KVrG8YdpFAI+nSQ49EhbNxitfySSxt2S4tl/dF5qrpDuT+7oSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xt23VOP/E9JmYf+9FPsYPJayLFlxb6a5Ch/5Mdugux4=;
 b=KtKS2YuyUOcAKchuSj2qqomnraw0q2VggczvwKQ1HhxGoC3eqlGverErdKvOtyqt2JFASRUCKOQ5FKrYaWoFQvXYIT9nYhK8Q0Ksqyd/IzdRWBOYtNHBTE6JWaaJ78T3t5nuZDdGcEe0tlluh34OzhRlB2ZFxI0YJYLYQGpg8jiFw5oRu3DgJE96h20dpMWlXxnEtYHEAnx6oblVH0ocuaiH1IKE1UWcKaWvUeqOnw5YtPKDvLqbWJOoqIcGOnGAO4c9M04bTOydfoQya1tG7z2KjbCfATOq3bzaHL1Yi6d3lHlx+MEfoup7Zk/cSuWrw/ZsfyL9VlYm3pFVVz/8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8837.namprd11.prod.outlook.com (2603:10b6:806:468::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Fri, 26 Jun
 2026 09:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 09:18:41 +0000
Date: Fri, 26 Jun 2026 02:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/1 v4] drm/xe: Wait for HW clearance before issuing the
 next TLB inval.
Message-ID: <aj5D7hXn4qNxKEvR@gsse-cloud1.jf.intel.com>
References: <20260624225105.2355641-1-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260624225105.2355641-1-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eae12a4-6d40-4b8e-5746-08ded363e9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|5023799004|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: w2QgLc2Gl0TpVdj5riZqsNJ9IqX0Bs+hFTSVTikWjppMIvDiQfeHfrWeUTHWwYWy37aUdYYEpo8I5m/fCECm0YnFJydlvtFmL98LOYFT1CCyauIC/uqzkXXuUwFHU3witp0SgtRhZ37fEQ7zmCb1WfWpNdpY+6WqUeQOtWPr3lslXl+HuyZYN4OsEvhwLfKM2NV95sW3LbOmrdIEIKJj/KuRQU2BIYFGfjTWV65dXKYaF5cIpnjIaxLnTvXWdLYNfL+Yb1O3g0hU6VYI1mcBVoduqEB9JH0lwPCONSbmh7onjgsDzhdwIBP7cNGz+nDuC8d2lz+nlJELs9PLak3UC1xt1dM+YTUQMahDWKpadGFkYviBpH2jQgukm/q3LTayby4MCi8VVXTzaOO5ITPyZllUK8w/88ySUo+hV85Hzb0XruqETXVqvKBJxqm5ECa7wZEb0zgadfxJNSOhKEu2nXDiNkPe0syFh1oq3abZbin5/0jHi5BW5t6GjIyei93k4wyUP4pS/CBLd06PBmQIh3NXYwwRqbUQ5ncJ8G0Igk+zCp7XgHxwM1wyqZfzp56ERVSqzp2DCAfSjgMowjE7svGgIS1zoAmYVYINmJZnS/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(5023799004)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZwKqlz2F//TY+MmXauphm1YtgTS7781P85ERwCKH05x92v76MlIHx6fj7ANW?=
 =?us-ascii?Q?MhkLMOBpLWRHlPTKK9yyS2FWLFR6ZhMQbxVZ2smsrJX6DyL2eG05xfSDvhzb?=
 =?us-ascii?Q?kyOhbO/hU1Amna8PpqbuWq+xC99PxYEdBZ8N+XTtnSkEw8WX1DhEiGG4WPEj?=
 =?us-ascii?Q?w1rbFMZLMOCq19D4Q9HfqZcOJqZ9veztj6ZS3usI4zuB6HwoBFnP4JdgeYYY?=
 =?us-ascii?Q?CHjYdCRZ8hiN0OyYOuUk9jOH6/fn5idndlgaU7EqRK3WN29Ryb6lywwKfBXD?=
 =?us-ascii?Q?MoNJVIHQlTe+4JdCXK1lmVGzEvRUzngnCdZFvTxwe6XsOOKn/Krp072YyOkq?=
 =?us-ascii?Q?6xVTvV8uCUsHzPFF6sjGJjY/5usk7BDCOZqTCEiuJqzrcQp2gN9sMzdM/TBo?=
 =?us-ascii?Q?gaSs0qtK1qReVJBdgeWaeP2TBtubA/kTgi6WbFha7CEKnmY25sXL3os302tx?=
 =?us-ascii?Q?Rn3oWKfzzNReRvs13diAQAYzHEE2r9p2UYDvotNUhX8nKWoYpXmjZXHMov0B?=
 =?us-ascii?Q?H+OTFZBgUBZd4PWTHgmGtjIt6akqlSPlTzvRV0VIl+eVAKtfxIBWVGoWsIsp?=
 =?us-ascii?Q?nE5JaLbyp0SCyAt91g1fR5X9I99MMpxLEFTaEt1DEab0lUwUVx42bEgaHmSA?=
 =?us-ascii?Q?Or2LhS+KPHFTAPPkPoZfbPKK+NM/kYr/Xgd1vltasb2WSl44RGnhxqWdxCYv?=
 =?us-ascii?Q?ZSuz45esnlDzN0HH8mAy33AoFwSa6RqY6M3/G7iwSTGiZJiuLLTPepicZcyF?=
 =?us-ascii?Q?IHSvJAvbCEyjTFVsKZCvuZvIDWNWpD/+jaFFFjg3ig0P86XhdlFWBSL+ijnn?=
 =?us-ascii?Q?7XdqYi6wT5nn427AmQJ7POSvaSzRUH3Mp122UjuYuEFsGqlqKrkSWZ0OtkFC?=
 =?us-ascii?Q?Jy6J1OPGkgP+h+IFnZK2/JSo/Jtz2df6AhIroZQ23OAAgtju6R7R9NiDPTx7?=
 =?us-ascii?Q?hpwfmPDud/i7HWyvlpNAiWfxWel+EKBXXgTCEAj0rTTKAgVxAI3hsOk28b3Z?=
 =?us-ascii?Q?hf0DjSjvTHYvvrMTCxwrR3QJC+R+wCtfXKsHftFDPP7z/LxrNpo7Z1FiKTLD?=
 =?us-ascii?Q?U1HfaGwHx7HUUDRcRZO8DWFNuXyOgg+CEMsCHjLNEXCBESRDpgTHTqIeC3uU?=
 =?us-ascii?Q?F0iWKZ/ET5nFMnICXoosi/heObEFmJpZfNX69zXfqQcWBCD18UJXbrmOU+rI?=
 =?us-ascii?Q?y5/ydsalRF/Lwu/aWkZFUylg17UAmpiN4twud4HKhhxhQgrTElsO6K4bIJCz?=
 =?us-ascii?Q?rL/+7zNjnw3FZ5Hib8MOVV5GPqvMQtq5hpqcFSTz9Kr199KLEQBr9rcjDIXV?=
 =?us-ascii?Q?QHJYXTnAvIAVFQ51i7mwl5jOJt+zXVhusNlIu0Pq4fdPft9OMXdAscWN5BsG?=
 =?us-ascii?Q?ZMwxBatxkPtIXKV7j1Ion9lv3LRk5+0ozFmO8zmphRu0/UC1QloT0aCiPsFM?=
 =?us-ascii?Q?dWXRPsixd4KxlWQk+IsiJSD2S1s0vC9NqW4/8b4/6UyJFRV8CdtTks5d2Q6j?=
 =?us-ascii?Q?Co6BjpoaHCJzDSK/M63bMZs0UF3tQSh+Z0IoMNiLVrqL6B7f+eEi1QviZWGz?=
 =?us-ascii?Q?dxTe0HbR5u8ibgwMqhRPFCRx4jrOTwR71GzK/aWsnG5mjX8bAB8g31c38vwe?=
 =?us-ascii?Q?qhkkNiy7vne6CdriwZ9lq33NYezp5QasGNU4TSTQQ+J5YqYXrkZEaYBmiVuo?=
 =?us-ascii?Q?WoW20FvGcsI3zrf9tNTm+VRKFm57XUUH1e+aZeXwzXeK8B2tMpq7LIfBkAAR?=
 =?us-ascii?Q?/URTbSpzyGxlWDkG78yMzvsHopJDfSA=3D?=
X-Exchange-RoutingPolicyChecked: OtqtQ1RBlBhEsKuVPM5ZxcgP8/YtGo7MqoUnOQPvhCLweGbNLryfJJyou5dIaWUnG+N+aYNC/Ogi2AmYziYtm+j/PNyFnXbt3kBkraLv/bwLAfQ5xRWEX4xsjGV+Ngpa5d4tVomxhMIChH0oONgpJOZukPtseUrIRD1RDQlzaqFA7cm++kq8outPkveTBYSBflPRYyq4p7TQ7Rx4bIMFViOq67CL9tX8KNNmRXgQUn6w13YC2oafBgYnAIb1JlXGDzH3wogc0Me+b3+JPEW0F1BiTPikWh1wAgxnTFKpw4WGJFs1kpG/GXJY182em2LjTVdKP73Wv/IJXmhrcbUiAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eae12a4-6d40-4b8e-5746-08ded363e9c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:18:41.2044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruH6blXth0g4g76iHh2/rVp31xOSbXcUwuP2PQta56NNm7gJYp5qXw0tO4c+FFG8o69MUm8ZppYI+DF5OwQVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8837
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

On Wed, Jun 24, 2026 at 03:51:03PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Attempt again after validating this in the internal tree for a while.
> I hope this time it will pass the CI.
> I knew Matt Brost wanted to have a GAM port layer for the mmio access,
> but not sure if it worth the effort if the only usage is for MMIO-based
> TLB invalidation.
> 

I have to insist on correctly layering, if we are here, we should fix
the layering.

Use this as a ref implementation:
https://patchwork.freedesktop.org/patch/707237/?series=162171&rev=1

In particular xe_gam_port.c.

Matt

> 
> Fei Yang (1):
>   drm/xe: Wait for HW clearance before issuing the next TLB inval.
> 
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 70 +++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> -- 
> 2.43.0
> 
