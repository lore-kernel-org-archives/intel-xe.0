Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B63C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 15:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C4410E47C;
	Mon, 10 Mar 2025 15:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fgy5M5WU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E7B10E47C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741621920; x=1773157920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K7FXK2WTuQaHDdrqkVgIIlDOJu/za84tJwy/cvn0WLE=;
 b=Fgy5M5WUyCRf0os4sE/gdZehgcUl8F01rvlr1y+Jr2HtZm+cFgaU93Na
 sqTrOmIQ3j1Mx0Zi7dcRvFVvZ0B4dBJ2FW3HuXYL7gjJr1FMO/yW0zUgq
 JbdJWEnYe+ccId/pcEO3cVKbWg5C6lU4vAo6lglrH0iqM5IYQBFjWONPg
 3uRHIajPSC57ZW2pZe4ybiYmStNLJPHAHjq5ezxLzx37PmZFj43CTO2ss
 0xM9/rkAAfLhmBPk1ol7kNZlBVgCQTYZUurbxC8v8++wUNZVmBNyD20o8
 DzZlzWvkD9OsvD84Ybkc9+xvDPz44Rjg499Vj4A4mxQmYZvAhad2pIcy5 g==;
X-CSE-ConnectionGUID: 3xEkzkh5Tv2VQAleD5uAOQ==
X-CSE-MsgGUID: fOrdKYTIRLysSwoVU2QWGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41872074"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="41872074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 08:51:55 -0700
X-CSE-ConnectionGUID: inC/mdIUSBGB9XKMS7Hcnw==
X-CSE-MsgGUID: +On610HyRzWS4wNWf3cQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="150993685"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 08:51:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 08:51:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 08:51:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 08:51:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY8631BcyNSKP6HSOw+yrSP+hkj5kruJRL5ufbGmRu9NW3mGc1ttOre7ktjBeSWFdgDRjmfNNDZLHUN422crY4j9O+EFG/AqdI+MdN1lZ9RNUmoOqxijJlXX58ECvhlDZGk7PiBcfRn+Y/1Y9aDPD4Rj/huKtGSLYh0cvnbQXGgJPbmf78PnfCl1YMERIfg7uoNsju7z9sqF0pgkp7Eb56XlmNBamnFmvZYTccw+JsmbKvZ4e3Uo4BUsrt2iFEMJO5FvkbuV9knDS+S0Cfdxrs1S2R92zjrPrnmpqyWNzm4TANjmyw65cN40dgF5rwQEYaBDhfVAWRFQCYzopLMchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Csyw/gP51Fzi5PCk26Dm3GXGT+zi940SchQpSPhjYA8=;
 b=qq4Wns9KsV0r/zuMh1hAkhzIVZGS7+srpSxxRDRgt2II2mJZ4/O49TvsP+6fAPPU2ZBULQoLScfCpEoGMZv1XE9c6jPA2EGDsikPF5CV/XmAOl2NA30wEHsjrHkwA5w0zwrBNVOvU3P06GmHoBlFDgQYhGj1tBBEHEEfF+cb6hIitcOh2+Hnyt+7AnblJf5gUNHUzAdnQHIkGmpf9Hiw5tQHqa6DjDprdvNcrXSCBktYLS7WAvKWuJegR9jYhVpwSSbaKkiFJsjQgQcTI9r0emg8I62VN3K9R3SNQ0+U4sVWSK/DYI0EGGTO8OBQs76GhiQ18o3f1rLkL+MNIjR0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 15:51:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 15:51:50 +0000
Date: Mon, 10 Mar 2025 11:51:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [CI 0/4] Misc reviewed patches for CI
Message-ID: <Z88Kkv7g4-nwKsQ3@intel.com>
References: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4969ff2c-d8d9-48b7-271c-08dd5feb78a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G3wP1fluVsxVuC2eOw7MeDpoHqpQshY4yQxKe81m8cKCasrWdgNs2wqyNGhm?=
 =?us-ascii?Q?vWIBzc3OdmtA6h5YvRVvyA05j2iiNstIHF1j7lp1yCIQnH5XzWducncZqyZ8?=
 =?us-ascii?Q?B7LtyYnodjp9ZtdrkR/RXLeF+awa3i+ChsIGi2XN4M0rDRdWlOd4CkYdjgLz?=
 =?us-ascii?Q?QezWqzg3+GmeQjocoi8RhUQPvPN/JWGGw9//qe+0O4uAdT4NGAIK8+roV7QK?=
 =?us-ascii?Q?8O4x3Opur/l8m8JB6A+iD77icQD6oQf6r8J0QSq1dD4FaHQqNWyeLvtQ0VUr?=
 =?us-ascii?Q?64gQX6SLcjWpiiYzh7YhqOS/uzBcV76VnbzjlJN9zaOUMqQirqAet1tbKA7i?=
 =?us-ascii?Q?g0b8gXxXNp75gsH4HMogAhS2NQM7Fgy32zLXPYXswEhhqURUtGVk3r6L1hA+?=
 =?us-ascii?Q?TMCNQuHQaaoxCuAPPAdC5Z8fu1NKX75i3nb11hbEA2qusKIt/o1sVvCITbyZ?=
 =?us-ascii?Q?F7JbXbpwbnqrFBEgbpfvwhg64+ipdVjDyGrkSx6OQzrixWN4LJMQ5txZO6na?=
 =?us-ascii?Q?ypuNpLhnmppRyWLrgGRVaPqT5SYFlstFoChVzKSaTuacL6xXj5tNb+qYmud9?=
 =?us-ascii?Q?qMkRnDkvUOrr+OG+ldT975ednJ+vGsO4KBMpEBHZJJXzpmNNihN/TB9nH9g9?=
 =?us-ascii?Q?hW1TKfn6HYeci2XmkDp8UA0DuWw5TTu/qAjgBc2YcGK90JWcaGX59zqhCmzx?=
 =?us-ascii?Q?LaY3pc5iW4pJuUZNEOYKtZZdX+O2C37+J+LA98C+SviVPpYzElVxNksJETf1?=
 =?us-ascii?Q?TGxMd9wYYDKZqccxA90Jc0s+djj2yvhzuhmq/1GPD4LLC0sYhl5olOUIeXk2?=
 =?us-ascii?Q?hmT7J8XVfPI5etEs5gCoLeR6zQswVwrg4FAUqXpcY+KF71AYSyMjcNvgrkXv?=
 =?us-ascii?Q?p9K8ei1FylQnwa+W2pjbzggBZ8sgReV5tbBVh6C/uYpfrhtQGW9/EOafDL+6?=
 =?us-ascii?Q?ce2wVsNVXWwFxaCdkYrWRI2YPzpYkEWqrRYromcHBFQ2gKN3pnHGYoqa9zwa?=
 =?us-ascii?Q?k7z5cAKWxTz6gh3W99LbDF/TLhkEb1acleHhEWd93/2K300QWdt5gEDYPe4T?=
 =?us-ascii?Q?hFV2rO6TD4Sk6JZfH8os4/vqFnEXuab40YwIcLZSaFEo26j0vVlAr36XQkdG?=
 =?us-ascii?Q?3GxdYJvJnp7N6rlKXTPTSus4k79Ed0Trgvryvnlq7JBxZha+M8yNlQxEWcRC?=
 =?us-ascii?Q?Sq+au4b02BaWNOTL44izX9gsSl1WAD/O62elGQOkl1muy0WXR8A5vtCnfUFD?=
 =?us-ascii?Q?Wr2b25RqcYPo/HBOzdLGs0wvS0rMV0zVMQBGmiT4CETlzAjTam9XVtpwL4pe?=
 =?us-ascii?Q?teOegkCB7tbyN37MlLDpFbVDgvBh2HuDy497X6yooUOuxj7zhuos6OPbNT4m?=
 =?us-ascii?Q?Iaunsm8uEAHRWMrStTwUuHrg4yXo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7fOLMiN0lEESFKfcUllpIu3YYrQTO2qmauz4bBtuIdi4j4xj8vJEvLasLFJ?=
 =?us-ascii?Q?DD7wEVMbQQ5rAonoH2Mvi6oUr6Uqbiy+t7DYqALKbl/k2N1+yiH0RAC/dG8a?=
 =?us-ascii?Q?GuHzVW4HKn6kcq8wgkX50a7v5YwJIRvD4oCdP9JQLTPf1bNPMgsUQFoBLlM8?=
 =?us-ascii?Q?WqYY7jlsxJaNYJBRNAUbg9TUvv0E9TIPhrmtEbBL+k3Ps/eCFKl1D494wq9Q?=
 =?us-ascii?Q?qpmXUZmtc8eAuOdR5MwlvYlAHNn1dNJxT0pXRIVtSw30DK5pemYZ4O9U/zVF?=
 =?us-ascii?Q?sgLju0LNo8MpPMS7sRPTnKpuPEz5QXH5VGZ6RF31CDYMoXBl4+0sRWkBLBHK?=
 =?us-ascii?Q?0VqJFaFM5vKzLfOYZTAbCSGgqiP0CHH2MptsRYoZMQRyVJLIFEUnnL+Klwvr?=
 =?us-ascii?Q?Fb05+iQF/hGuachp8MU71W4fJVATJIw23vNyopKWWy+NkJQ725RJac/nCgzR?=
 =?us-ascii?Q?Fu3OAhaACy2DmkA+NyyIZo24da9I+WEkBD9LC57ZeGFG44pMd+gU6FrnAJCy?=
 =?us-ascii?Q?VpYmYu+oRs9jeqjzpPanJnDHxwFoQ3scC/RZXfEKDSta++1EKZwWFB+h/SOi?=
 =?us-ascii?Q?h19F7gw7XV4u/Yyku8zyFS/InKVk9mtBN2qwCcqQRbUdaT9mYMPLEJhMIgxK?=
 =?us-ascii?Q?mJhlDw2CCR03P4e1szFS3Uvpw8Ng8MGn6Rj1xG/lSnQM4oprPXeL82nKXbM9?=
 =?us-ascii?Q?RGy6BZV4CNLswzj+rFqlb2jzK1w3WukELlM2VuGkAYQUv3g/gptQUpza+ZO0?=
 =?us-ascii?Q?6b7ak3bjV7ShMwz3+Mmvsuyfv4OoULpOuGIfRLPHGdZ6Vg7caYPRgrx2wKgq?=
 =?us-ascii?Q?tT0vWn62uYlZra0AwGzoUbxr7uN878bDVEl0gk08m0MwiBCRLJGtySwzAzt0?=
 =?us-ascii?Q?SCiSRaCUuRrz2BFr8rgivWz1Lm+oV0mSdYcVRIEVDYlzIHLYdf/1jjJkgmRv?=
 =?us-ascii?Q?QEtVTYtDwWzKeDcgT6XVwf0DuDHy+6rUBLWYg4KSAiXetwRxwaWJQ1S+/+uM?=
 =?us-ascii?Q?gih9a+fhNrzKnjSlgZrmzQRDwGr5QdP8M42Zc1fztyjK/W0zvJ5Wqc4zbbAx?=
 =?us-ascii?Q?CvSrYyvH/Dl4z2ZEUMux666dNTEObTlGn1S6uLy3H9ffAdIDo/FjI+VPxp5/?=
 =?us-ascii?Q?akRooVrwkceQJYORO2HWNTLhVk3CxoAho17nUx3Ws5fSsthkP5M/3QxOebwC?=
 =?us-ascii?Q?12OQ7/clT/S99wwIcV8EOTQTQT8ixprmcwaa60HQKx3Ife7IHpPFWD0LSiZc?=
 =?us-ascii?Q?Tg9nawJg6ozfrZnyWmO3jNWk+eRRNIJONxa8NxSb6UJpw9rq++lp1wt5xNGk?=
 =?us-ascii?Q?bPo00Kyh4Suv7vGzJjYn8sGyEzbLdCUMNAExBNKerFadqfYQBKEHjP79FnWe?=
 =?us-ascii?Q?Hi558w2yHiD9h3yexC+zzMFE14qDJ/SHT6/jnehh71D76sC5S3aRhJ93WTGW?=
 =?us-ascii?Q?TaXUC/GZwjUrdV0yIFpTQmxxUi3qbpN5tp5KRqxteCpcOQakOS1TSzLjNnc/?=
 =?us-ascii?Q?7is3aDXvtlpeNKdUGmpxhIGHErP7F27pKjxcH7c/6xztTkE3CxQ+u3Y2tZT4?=
 =?us-ascii?Q?IcRsRMMTm3P4SqsFS5NJhdu1zAS8dX2bbRq7qGseGoaPjlplMsxSI9bGfFGL?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4969ff2c-d8d9-48b7-271c-08dd5feb78a3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 15:51:50.4691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM7RAcnOfE8jobTm70gqTjc/8C8MTf/deCpAjvDgRumwK91RHKc04FY81ishbx5CBIYdZaTj3Wn3t7Em9iyGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
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

On Fri, Mar 07, 2025 at 11:13:58AM +0000, Tvrtko Ursulin wrote:
> Four already reviewed patches extracted from my ADL-P AuxCCS series, but not
> really about that feature, just general cleanups.

I just pushed them to drm-xe-next, thank you

> 
> Tvrtko Ursulin (4):
>   drm/xe: Fix MOCS debugfs LNCF readout
>   drm/xe: Fix ring flush invalidation
>   drm/xe: Pass flags directly to emit_flush_imm_ggtt
>   drm/xe: Use correct type width for alignment in fb pinning code
> 
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 +++++++++---------
>  drivers/gpu/drm/xe/xe_mocs.c           |  4 +++-
>  drivers/gpu/drm/xe/xe_ring_ops.c       | 28 +++++++++++---------------
>  3 files changed, 25 insertions(+), 27 deletions(-)
> 
> -- 
> 2.48.0
> 
