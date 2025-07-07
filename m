Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA524C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 16:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A44110E32E;
	Mon,  7 Jul 2025 16:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pxj+Nw2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB9110E32E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751906197; x=1783442197;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QYHq3pbsVHiab4fvzH6YyHnzoSStzWS0+ofqfwXcYlQ=;
 b=Pxj+Nw2BAvUqSP217cqsAoeE2zoPJFSwE5xnTUAO7tehovV4e6KAbQOw
 5zMnIds0WsBgvqeX52sMYyx+eek8BQEpYXc4EOzwnC/IdQtx74iZ24GMD
 jmrQEu9xdo/YUS5u+U3xSspA/n41TsX5j1Jbp4BMG9SXlA/mOK9DLvtES
 XZCJX6VU+9wwTcKnIf1JmcDhdvSxUyIMz/S8SFudkdZbZEmJT+nHz5fqd
 fhC2003mpsvF78IIaiAD3worxMIr5Xddz1iZARC+6tB0B2EBKPxP+Al1V
 9j18SFwrec6FTkDnkX7uVI1OSPuofohFUFx+lY3dmxXwS3IzGXFkBB2Vb g==;
X-CSE-ConnectionGUID: EYi0cF9TTfCJTQAXxCNS0w==
X-CSE-MsgGUID: RYtVbvzCQBKDzbrCZflOnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65482855"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="65482855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:36:36 -0700
X-CSE-ConnectionGUID: OY/Vd1mRQk6OL28/R4LfPg==
X-CSE-MsgGUID: Lf89AohHRd2AkMkDVmIYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155619645"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:36:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:36:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:36:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppw8nplxlDfNvBt836ZDZ2rDGI2Y2Y0B/Sh7t6eWUjgEXWb8uLob/q4dWNY+agZBTOrgctUcr3zwx9YO4z3eRoJfWZqUcHNaKhTeldCfDAaQz47vFSQjfE0MxrWr6m8cxsP8FFjk8KdwdZOdMG2kPx/xfcyM/IoxS0kb5+ijbfxx/ab0p3RWrfuTQKAJjHAiK0aV3J771Kv48yNvZVBXFNFlcFNU+7toiFAQne4U78R4mcNNsk+skIfIMzw0t99675296WF9dYK+piNukjgLNZle5lnuxnBxDrgB4wut8znZIbUCObFv3YKv3bYlV0aknBeP3NDbjNzwz1IywtT/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/FAl9cemzxQRZ1RmwJ332Y6V1mAWjAcAgz+rYH5KVk=;
 b=q+h2eYA40t/JBxLS2CYvSSBmYi8iXA3SxSq9RgJyMpmNF2Rv1uMGu85gplUgApQtn0qg/O1DfHjF5Uh5ZzbapWWq5jm/EbON3/lY566lvgSOBYbJYIMLJYGika5gA9JHfKlrex/HbVxQh9rWnnuB93o5S6e/R+K/sgifRcG818+xCEy1Ucjgj+pvuikbzbju1YlJ1l60ColVCzJTKYOHapMTYd7J/lqBh1ePrlkiMY8FMUO7phPySEEy+W+x1BGRZE/G+j6u2qDzX7AcFvi8Pxwtsl++DtPUQ1l5961iYi3XpGsNanJRVRds2uaquKzKZuCkcpV+KxI87HFcM9k/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF3FCD980E2.namprd11.prod.outlook.com (2603:10b6:f:fc02::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 7 Jul
 2025 16:36:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 16:36:32 +0000
Date: Mon, 7 Jul 2025 09:38:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v9 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Message-ID: <aGv390JjsB0tlBn0@lstrano-desk.jf.intel.com>
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
 <20250707145609.3857467-4-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707145609.3857467-4-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF3FCD980E2:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc05c5d-816c-4a06-e890-08ddbd746e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wUluJKR2ZqZzzafX/l9iz2Z+6Qs+7LDZ2eBdJathQwKu19gVcDX+V16TQd?=
 =?iso-8859-1?Q?emzDo1cpE58Q/loClZCaScYIYKbHhDmdmRMR6PJ6mlK1HF07641aM5D11F?=
 =?iso-8859-1?Q?o4COJYPts2a1SjkXul2aTrbu+Lrf0Bpm+2pixaeHAnPFAdsLGeNYnZ30qx?=
 =?iso-8859-1?Q?ijLwkJmrcafJqNBR7gTVM9J3SZt6mj7wuQ59PoepK/fBikSKqcXehzrWj+?=
 =?iso-8859-1?Q?11/Up7XV4Pxl/oGPyaaWsUfeErWih7yM1pSFvpCTA12kZJyFJXAeKJPjd/?=
 =?iso-8859-1?Q?bBhGers87TJlZ6VA6pCuwl96ErpdCCLhhSoKdMO3J2eFL5o3zMEzc7QULn?=
 =?iso-8859-1?Q?/hg5X0J0VRzfreFK1YwDCwCYA0SZaOrapjpFAlY7E76OtgFchAqcGZMEuZ?=
 =?iso-8859-1?Q?BsMrelhrYrMn0QtnfKIOuIxh+v9q0h6u4G5gR1ccy556X9dlC6rwN2skfs?=
 =?iso-8859-1?Q?Rdonnq94VWIXfjGbOLeQAPbQABrPsTFJ05vqQqVXpX2OtWpMEvkSykul2L?=
 =?iso-8859-1?Q?SAH5DTu2KDp9D5i4fTfDKYqupHDyBxFZ0pralcTt0yFG+prj5/sqzDp4dq?=
 =?iso-8859-1?Q?R96v3CvpwdfeEqgW8wLpcHXSLDUZGvghTnsBvwWCTLvhxQ6lfqyLLIPASF?=
 =?iso-8859-1?Q?oQ+GNgpLrEF12pj+e7xOlZKAEhaI3Jnb5JkiQPmNYuDP5PTGrzivuGDtXs?=
 =?iso-8859-1?Q?fCfKHPfe7cJoWib009lNkb7yWgbvnEov3L33LOCAv+P6TY9iTfUIFTvFQk?=
 =?iso-8859-1?Q?D6nD2nF6m/ZHKy6XvuYaXHU7+/5EauGXzrxIweyVv2cCZW/ytB/rltT7R/?=
 =?iso-8859-1?Q?0ONNcfxzbXyBqPahaxg8djpQenM8u+97nIpegQpcc4f4Z0V6fQnGrbflwD?=
 =?iso-8859-1?Q?Gnh+/fXTs7xzHQ4IYhINe4+5Ya4KP6sKTykQNVERbARqzZOQpE61IQZmf9?=
 =?iso-8859-1?Q?FTgjejnd2goZfpb3kFLSSW9RsZaVdNPnBD9qgfIR2BZkOVk3vpVMdNF/eR?=
 =?iso-8859-1?Q?XTIvEtA4ybkzGQPJ16lyF5gd3ZzEIbvv+725IGUnhP23heKwlIjxslO+6i?=
 =?iso-8859-1?Q?94mAqVrxJl80AUB8QWmsNU2sUbgRW1n1u5PljLj6En5I5CZsDV34BF0+Bk?=
 =?iso-8859-1?Q?IDr4qk+nZ6VYLQcTRmKEhfAoPEs2/T29WWss5iGN1EXqVsGU+WtYdZgYdR?=
 =?iso-8859-1?Q?u6ZLRBf3bEfu49qC5Let+8y429ouD5nCwIoy/IeRKt9WAgPhOvw0cvrurz?=
 =?iso-8859-1?Q?uDwpLfYb7pYUrfvmJwR/j7JbryS5a7ZACXoU7aR/0CHELD31zkE5uM2RAS?=
 =?iso-8859-1?Q?DDHwy7nnrEEZSjGJOHHhfB96A0JN6ZSwv/qA6njd8xtFPunxtGVGbyCNhl?=
 =?iso-8859-1?Q?VwXl1zZxLiL9jjAOXQ6eVnlBAElS62q0RT6khLHRXgxVQVKNK4qluaXEoy?=
 =?iso-8859-1?Q?qsoOdtR8MO1YcTFHVo5/YN9h6dwP1VzycF13YuZeHhwHIm+1fcUhfozeIi?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bDom0zyZo9klrdJg4dnPNgsZ9MEBOrJg9LioUNGodSuiLA0q3Pw5ytnPoN?=
 =?iso-8859-1?Q?umUvI4N49lkbximjSVCR7mZ4qSshT3IH/ZN0ozOlIP/E2mCy+JAoqLWMFT?=
 =?iso-8859-1?Q?bRCJM5xpKKpUvyXMCZlP8vfIilz5w1jz93k5qtVWwSUhH3J8ssVCRn3IBv?=
 =?iso-8859-1?Q?/yOiKqDkKK63APSzGMwvD4roVzPTU70XKC0ulr5JCBpIp8nNw3w9Gtbzs/?=
 =?iso-8859-1?Q?VjQbkwKyWYIzNB2Z7fJ+3lAdxU+GHGvcG5QsKXix/Vb7D7oBcJcpHshf1O?=
 =?iso-8859-1?Q?c5onwuRfseEfiyvBNEUORqCUOATVbE8s56CGJ2M7upAwwtzoOFpEle4/1N?=
 =?iso-8859-1?Q?sMht0oOyKszlWj2+JtkVIVkkZI7ANZz85DueSNBfAqzV4vKMyWZIdKaHuv?=
 =?iso-8859-1?Q?iLtHMDezFTVu/3uv2F6GYrFYUVfbqih6RHTOp02N5dGJ9b+ndJW4rBnnZN?=
 =?iso-8859-1?Q?mBHe9dRiiYJW1dNywLcjeLDUxbUV/x1UhexiDwPePpZVc9tFDx0aPewNLT?=
 =?iso-8859-1?Q?q7Avo+vKOo961joVfSbshMPKTb+PVgIYJEAdViUgBBBrRNzfgoVq+ulI58?=
 =?iso-8859-1?Q?TxV44OuB6AkkLdeRqzBgHzwNiffhH2p1bXCm1UH7WgbnbOs9vKHlfypqnd?=
 =?iso-8859-1?Q?an56GZ42EHSkSKBlCOGd/AB0RMHduR5lpFpHN8iDr4HArPBzgQHQsYcKYG?=
 =?iso-8859-1?Q?cANmSnMyhIUn8OUiejLcrDSISWjex/DVQzcPJgSNYS8g97jG8gNpX2p6qN?=
 =?iso-8859-1?Q?1DR3EGqc2Xs6uk/z9rR9kiK/3ytx2Ytq8DKVZX8D0FcnD0ItcS1jzOvhyQ?=
 =?iso-8859-1?Q?UEnI4ALMegpgwv3aj+InxGcuCYMKh40TaPDwiEWUsdzs3YEroKVYBqwRLD?=
 =?iso-8859-1?Q?V/soNGBX2T+QbfU6CqKpgPst9tW6wNy6vPr6/rCRCsV1+K1lwjsqi/KXP8?=
 =?iso-8859-1?Q?Zb/3LygpL++oXpAP0ryx8X0XejRxEG1LkWz4PkB/FUzW3Okkp04J3R4SqU?=
 =?iso-8859-1?Q?v3nKvoEOngU+3+t+lgkdRQiR4BKuaj89fakkOWpu+EqZAdqK+72FzMMtrX?=
 =?iso-8859-1?Q?Ns4VJDc7GtfVJqp515eh9rUnsaYcPV4lu5Jlqj7fttRFxs9fLV1VnzHaVz?=
 =?iso-8859-1?Q?Tk0dhDnJ+bpOv8RJL1Jdw8fAXANahxrsG2v9Vk3tnbvxM/hrC9RECERZno?=
 =?iso-8859-1?Q?U2In2XRzF9GBZcWTIVHDIVHSlfsW/16CiCJNy/kn+LNkbkItvKvq9UWu8R?=
 =?iso-8859-1?Q?WIF27KU2nQUur74xzWlJaKCa3iiD68A87nKiGFbZWYrMrK4tPxlq6Mr80M?=
 =?iso-8859-1?Q?mHn1LgWIbHQpbiNM2jZzfQSlsEDwHwbSOQqR/BJUtXyAIFjHXA1gXZyfq6?=
 =?iso-8859-1?Q?ZFt3FlUngnnN2DcCnrD+AtwMm4rmO9l9YkrTnTprdBj4rQyZhqSQgW8CeL?=
 =?iso-8859-1?Q?F4+4kOeyLUXdTHAHHEC/HTiRFj/o3aO7ndFdhd9oqF6X9zult3qW7CQcjT?=
 =?iso-8859-1?Q?sqMltwyWeqfFmG+BFsfWhmGwwUZJcMm/Sort+g8kS7oG0zZYGX8xCVSwzB?=
 =?iso-8859-1?Q?sFvbyyRhzLSr2hP8uOGzZknuvwCPskiswMutmZLuwjV9mokMEe568EjwNi?=
 =?iso-8859-1?Q?tJtrV9TSyZPPvB7LWlCIXB8LIx6Kkspx0Fo2QkCxiDDAeNj/G+QAF0mw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc05c5d-816c-4a06-e890-08ddbd746e4d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:36:32.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BdMJc/hV929KUvZy/r7KxNuI6iIaSSCKmQZZmd9jHJmzR3ePWSzruR7VH6hzNaciBs3IBKErEVL0XJ6LNQRdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3FCD980E2
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

On Mon, Jul 07, 2025 at 04:56:08PM +0200, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Let's move the xe_vram_region structure to a new header dedicated to VRAM
> to improve modularity and avoid unnecessary dependencies when only
> VRAM-related structures are needed.
> 
> v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
> v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
>  drivers/gpu/drm/xe/xe_bo.c                    |  1 +
>  drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
>  drivers/gpu/drm/xe/xe_device.c                |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
>  drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
>  drivers/gpu/drm/xe/xe_tile.c                  |  1 +
>  drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
>  drivers/gpu/drm/xe/xe_vram.c                  |  1 +
>  drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
>  13 files changed, 86 insertions(+), 71 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 2187b2de64e1..f2cfba674899 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -16,6 +16,7 @@
>  #include "xe_device.h"
>  #include "xe_ggtt.h"
>  #include "xe_pm.h"
> +#include "xe_vram_types.h"
>  
>  static void
>  write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 873f4e18cb2a..11591c7cdc70 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -21,6 +21,7 @@
>  #include "intel_plane.h"
>  #include "intel_plane_initial.h"
>  #include "xe_bo.h"
> +#include "xe_vram_types.h"
>  #include "xe_wa.h"
>  
>  #include <generated/xe_wa_oob.h>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7f8470b22dc9..a35a9e0dbfae 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -34,6 +34,7 @@
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vram_types.h"
>  
>  const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
>  	[XE_PL_SYSTEM] = "system",
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index ff560d82496f..57d34698139e 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/iosys-map.h>
>  
>  #include <drm/drm_gpusvm.h>
> +#include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 19019b032c78..4bd0619574ff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -63,6 +63,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vram.h"
> +#include "xe_vram_types.h"
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
>  #include "xe_wa.h"
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ece4bfcde477..55b068183f8c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,7 +10,6 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> -#include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_device.h>
>  
>  #include "xe_devcoredump_types.h"
> @@ -24,7 +23,6 @@
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> -#include "xe_ttm_vram_mgr_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
>  struct xe_ggtt;
>  struct xe_pat_ops;
>  struct xe_pxp;
> +struct xe_vram;
>  
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
> @@ -68,63 +67,6 @@ struct xe_pxp;
>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>  		 struct xe_tile * : (tile__)->xe)
>  
> -/**
> - * struct xe_vram_region - memory region structure
> - * This is used to describe a memory region in xe
> - * device, such as HBM memory or CXL extension memory.
> - */
> -struct xe_vram_region {
> -	/** @tile: Back pointer to tile */
> -	struct xe_tile *tile;
> -	/** @io_start: IO start address of this VRAM instance */
> -	resource_size_t io_start;
> -	/**
> -	 * @io_size: IO size of this VRAM instance
> -	 *
> -	 * This represents how much of this VRAM we can access
> -	 * via the CPU through the VRAM BAR. This can be smaller
> -	 * than @usable_size, in which case only part of VRAM is CPU
> -	 * accessible (typically the first 256M). This
> -	 * configuration is known as small-bar.
> -	 */
> -	resource_size_t io_size;
> -	/** @dpa_base: This memory regions's DPA (device physical address) base */
> -	resource_size_t dpa_base;
> -	/**
> -	 * @usable_size: usable size of VRAM
> -	 *
> -	 * Usable size of VRAM excluding reserved portions
> -	 * (e.g stolen mem)
> -	 */
> -	resource_size_t usable_size;
> -	/**
> -	 * @actual_physical_size: Actual VRAM size
> -	 *
> -	 * Actual VRAM size including reserved portions
> -	 * (e.g stolen mem)
> -	 */
> -	resource_size_t actual_physical_size;
> -	/** @mapping: pointer to VRAM mappable space */
> -	void __iomem *mapping;
> -	/** @ttm: VRAM TTM manager */
> -	struct xe_ttm_vram_mgr ttm;
> -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> -	struct dev_pagemap pagemap;
> -	/**
> -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> -	 * pages of this tile.
> -	 */
> -	struct drm_pagemap dpagemap;
> -	/**
> -	 * @hpa_base: base host physical address
> -	 *
> -	 * This is generated when remap device memory as ZONE_DEVICE
> -	 */
> -	resource_size_t hpa_base;
> -#endif
> -};
> -
>  /**
>   * struct xe_mmio - register mmio structure
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e69a05126dae..275ab5f03291 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -33,6 +33,7 @@
>  #include "xe_migrate.h"
>  #include "xe_sriov.h"
>  #include "xe_ttm_vram_mgr.h"
> +#include "xe_vram_types.h"
>  #include "xe_wopcm.h"
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e6871734ffa9..ee015e3f5d9e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -17,6 +17,7 @@
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_types.h"
> +#include "xe_vram_types.h"
>  
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
> @@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>  	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
>  
> -	dpagemap = xe_tile_local_pagemap(tile);
> +	dpagemap = &tile->mem.vram->dpagemap;

I'd leave the helper here and move 'tile->mem.vram->dpagemap' to the
helper.

>  	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>  				       xe_svm_range_end(range),
>  				       range->base.gpusvm->mm,
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 858ce0183aaa..bd2ff91a7d1c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -20,6 +20,7 @@
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
>  #include "xe_vram.h"
> +#include "xe_vram_types.h"
>  
>  /**
>   * DOC: Multi-tile Design
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index fb0473fa9098..8dd87ccb2aca 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
>  
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> -{
> -	return &tile->mem.vram->dpagemap;
> -}
> -#else
> -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> -{
> -	return NULL;
> -}
> -#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 3de2df47959b..8f9b8a1d2c05 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -15,6 +15,7 @@
>  #include "xe_gt.h"
>  #include "xe_res_cursor.h"
>  #include "xe_ttm_vram_mgr.h"
> +#include "xe_vram_types.h"
>  
>  static inline struct drm_buddy_block *
>  xe_ttm_vram_mgr_first_block(struct list_head *list)
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 71f463f2c3be..35fd7f5d7cff 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -20,6 +20,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_vram.h"
> +#include "xe_vram_types.h"
>  
>  #define BAR_SIZE_SHIFT 20
>  
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> new file mode 100644
> index 000000000000..a01838236036
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_VRAM_TYPES_H_
> +#define _XE_VRAM_TYPES_H_
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +#include <drm/drm_pagemap.h>
> +#endif
> +
> +#include "xe_ttm_vram_mgr_types.h"
> +
> +struct xe_tile;
> +
> +/**
> + * struct xe_vram_region - memory region structure
> + * This is used to describe a memory region in xe
> + * device, such as HBM memory or CXL extension memory.
> + */
> +struct xe_vram_region {
> +	/** @tile: Back pointer to tile */
> +	struct xe_tile *tile;

If the goal is share one xe_vram_region among several tiles, doesn't
having a back pointer to some extent break this? It would be better to
only have a 1 way relationship here: tile -> VRAM but VRAM cannot lookup
the tile. I haven't look through the entire series, but in what cases is
this backpointer needed?

Matt

> +	/** @io_start: IO start address of this VRAM instance */
> +	resource_size_t io_start;
> +	/**
> +	 * @io_size: IO size of this VRAM instance
> +	 *
> +	 * This represents how much of this VRAM we can access
> +	 * via the CPU through the VRAM BAR. This can be smaller
> +	 * than @usable_size, in which case only part of VRAM is CPU
> +	 * accessible (typically the first 256M). This
> +	 * configuration is known as small-bar.
> +	 */
> +	resource_size_t io_size;
> +	/** @dpa_base: This memory regions's DPA (device physical address) base */
> +	resource_size_t dpa_base;
> +	/**
> +	 * @usable_size: usable size of VRAM
> +	 *
> +	 * Usable size of VRAM excluding reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t usable_size;
> +	/**
> +	 * @actual_physical_size: Actual VRAM size
> +	 *
> +	 * Actual VRAM size including reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t actual_physical_size;
> +	/** @mapping: pointer to VRAM mappable space */
> +	void __iomem *mapping;
> +	/** @ttm: VRAM TTM manager */
> +	struct xe_ttm_vram_mgr ttm;
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> +	 * pages of this tile.
> +	 */
> +	struct drm_pagemap dpagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
> +#endif
> +};
> +
> +#endif
> -- 
> 2.34.1
> 
