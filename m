Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CA0CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 04:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E04610E00F;
	Wed, 24 Jun 2026 04:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktPHRQw2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5109710E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 04:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782274592; x=1813810592;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ma/mvNaVn5m2RYqho/SvjbAvFu9R06x4h98CPvCq8q0=;
 b=ktPHRQw27PvoTZ6kQ+kPlFehOr9Ja92npxAApmklt51V1n1TZR+jFiq9
 2Ywqavr/sqb/0KaIyQIZI8rtwwRy8XNABZXk4e/zdqxeQYHvud34Zh2Dm
 EGpui7U0bL0/aLCHs52wSoKnF1omht0OkzQuENOd+0eMesNwJLBQAUV6n
 mVllrE+6zGyJxlmv+acZZkIRDXtOnJVJVXw04kR8RKXhFef2FXWeDwRf4
 A/inszbSbNXljznqiW9pKPzfLeYetcWyZeJ2dnUzuZcKKcBzBex0+QF8j
 1d5C+c7KCBT7PSuQfGlP4pmc41Z8E2Jp/+ku2rTqryd/nBT2XXUZKsdjq Q==;
X-CSE-ConnectionGUID: xvZukmY2QQK2Bo8zqrmMHQ==
X-CSE-MsgGUID: 37QnWrcDT5usOCY/+xOW/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100450205"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="100450205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 21:16:31 -0700
X-CSE-ConnectionGUID: GPLNX3HVTUKkN0moDMpFBQ==
X-CSE-MsgGUID: GWIu+GUUTKCLKpW2YLOC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="246788136"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 21:16:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 21:16:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 21:16:31 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 21:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlQmZ6wnIXHNeysDC9a086heIjslcl5mLKaLJLyUmsrCzC/qRmvHzbPryG8eqmSONDNcuWMJmuR3Npm6Ni+RloEDunZl3mF52spX31HF8DixER+lsBy1D5wi8xhzM8E8P/km8DG8Iq7q4b9rLqyreYhn8ZLPYfTkK3FANUPsbBqrECVkKCuTFetQrgMvDnWApA5d6zU7ZgBaXM8F9EdTUrED3LoX3FM8d6roFTY+Oz7duv7AoavjuiLUgVnQYVYnDqIAHpmyj/+eGgdk0+4Xd2CVbj2JlcYFa0N1+AgatAm18cyZmMbxM3gYTL+TC7V586H7hl7oIDQQ4Is3FoD7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8L0D0I3L6KsCzX7wnkkGSiQ4eiCf6w/gKzbU8PykX8=;
 b=hfgJbmdniDWkX6zgiUbsOZ/293odUaTVAaoDBbawzHbuz9fM0fd6A0N1wC8ftbFu9cSJ0ln+Krx1+s8emRrf+8DidIP6/J6Us0R6UP8jxAdHZh20PFrsoTxk32ovjvLaO04goF3VRT2xw20eNuSlzSacPF5ug7GJgoFbnkL8/Sy4DOLiGvG44iEEyadjJp0DpkLtw9Z/0CksQ2CC6RcAE2gCKaJ7NKoQk/ERBfkqEiGCix5TgJEC6RbuJwhNANlq7gkMvITQ2NfnkvbJvbF4ynfIYnAcTqaHS6OPKoYmY9sa0QrA7J+O+OrqSXIOzK9Wn35GGaannQWW5Y0sgWaEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPF30373102B.namprd11.prod.outlook.com (2603:10b6:f:fc02::1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 04:16:29 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 04:16:28 +0000
Date: Tue, 23 Jun 2026 21:16:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v7] drm/xe/guc: Hold device ref until queue teardown
 completes
Message-ID: <ajtaGUaavUkXWVnI@gsse-cloud1.jf.intel.com>
References: <20260624041029.2357470-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624041029.2357470-1-arvind.yadav@intel.com>
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPF30373102B:EE_
X-MS-Office365-Filtering-Correlation-Id: 33df1202-ba08-4818-87ca-08ded1a75d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nNWmguIq/4yvMfzCPJsvMq8SL4FOKn9qBPWEBX6Pke89FF36I3m3JSA4pCLoT4E3oB6teGLkzaIUYRcz5UQvnFBDiYqoAYSXzcoWF1TlUKBwprnKaFn8TXYVAbmBkPcOKY9y5xMzF0On7cuF69FMbMShlcf3jypWJopnCNPXbgjdadDnambmSWqbvCkOPffWQ8402jeuk0EY+LBjU+Dg9oIt2LYHKLnm8Nl/rtnDMW1O4+mcBiDRFuFrafgC5HK2A1TIGVzVVYOhsLY8bzxlyxkqX9qTuRmHlbh2KHt6TEY4AHtmOR+ml6K9aqEHMIEFwf5I3kAMeYMbItEV/5Xe7K2+eUFRS/ZAPRPSdTGSPhwI9o1kaBroaFcCAuyGgzUXxGYDBOPk+dQ+qaK16NMQ1FK94aKPIRNnCoaQYFEqNGCs6wbHGwZ3Z3zxeJ7x+IZ9ONTmbQ0kyOeqLz2hJFJqqHvdZfFifR+gbE5SCsFsdPybcim828oJd2HXRkhD8UL/6qPCQYkAJwNbFIt5q7rJxKhQAf5GOYmUhXn/C0106ZbHBAv/cMm4JWvAs4MNnm0dH4ImANbMjsQaZQStnV+5o9wbprjxU08ypAuJE+VKJI3wIjDahnKi0af67o60d1sr0KLfMgOoEO7OWBhLf9WD6zCNyF9UHzCGm5xZ8N0NT8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qdi4tBw+5OW1yGRlGQirOue/BiZrSRB/jqDRlCRLvbHamY6J6odJ8UQKnc?=
 =?iso-8859-1?Q?qw3QFTh5AG1g0pusWqkNQLG/cIHME9D201b5pINSz269TRVwgMJmMosVxF?=
 =?iso-8859-1?Q?8GO5Yx0wvuJDX9hTCZG6aCUXBQ9AqmRJHoWXuEb2OaPUEpYOx+4Eokht04?=
 =?iso-8859-1?Q?c9sabigIsZ8KHKymlt6BA2AszvifP/X2spoimKAbz3mDxcQIUxD24mvFpo?=
 =?iso-8859-1?Q?CpGiMV49d9IqLiW4M0t5Fh9J3HsRXykz2iEErz6WKnQZep66Yrl1id5WpO?=
 =?iso-8859-1?Q?BhSAtI2PNJ9oq7mQXV3CAuiPozKmPccKRCtMepJxP2xfkNd+5vdUjevFi0?=
 =?iso-8859-1?Q?xuECU4yq+7ktZuyqVsKNl/MWE3dhuabBF5/27LpgAUDD7t/Q/JBsHRF133?=
 =?iso-8859-1?Q?+BKy1uWVn1SXR/CSEE9NrHzth7k40lIYg6+1sBYh/glut7PHbDcED9MrAh?=
 =?iso-8859-1?Q?s3vmAdmHkFNTqkm8m+evKTs92RnjgxPv2vInVMPZqsfXfcxiXZG8TpKRs2?=
 =?iso-8859-1?Q?HGetgB0yexPiypFv3lShN0NeDP7TVk0db4clM9LcpvmF7uGUnsk60eq/vU?=
 =?iso-8859-1?Q?Ets1L0x1BR85TBZmAMo1tWt0n1npEgcL+5zPLIImZEUzeGcQAgeWnPHUjy?=
 =?iso-8859-1?Q?ELaqms+tSU+ofPMTEXI92TeXw2Vz7BGUiQ8OfNQ9gBswH/VlO35rWuM3KN?=
 =?iso-8859-1?Q?AQDrWqHY7MVGYBUhOukHpVrJrjFhr6mi1wWATS/yXaoq29D+giCIDEsqxS?=
 =?iso-8859-1?Q?rl7GNVay6S545/mccIsdqJglYVzHSdcbqGXISDWFxNGDvPnQA3arKG83/J?=
 =?iso-8859-1?Q?gqid0Bxx4RkFxA9z/3AvSGEWe6m/GV8kmAYArEL8iknZdjVPK8SzN1uq+B?=
 =?iso-8859-1?Q?BBz0CHuDDZlLuXml/hea5JgdSRN6t9DWUGMCy7O73XEmgW8R05+YDKW/ML?=
 =?iso-8859-1?Q?YQOVLhjfazA40eLy0taNx+VXPLJBtnOYcns7y2uZ3AzTtPOVq1TjhhOMDA?=
 =?iso-8859-1?Q?3kcXqcr8l35NC+24+iw/5YvGKNIb57L64CX2XT8nZ/VsjUM8SR7uSJP5Hz?=
 =?iso-8859-1?Q?nsf0JhD3g0HOTA+EZ3Aj+NyOGnCU1bXFtNxJewpNkK765dXpDA107vDQOs?=
 =?iso-8859-1?Q?uSpzwRMlJ59nVUp5sCQdYCY4Ri2AFfrktA1zySqRPcYhEuWp/AXz3H+YUp?=
 =?iso-8859-1?Q?dh+SE2E2tgLT1MFNxocbBTK+Aj+1mFlRxA4c6sTxa7YxGq24jfSqhEBhMM?=
 =?iso-8859-1?Q?vDM9rtxT27gjRpl9Tk6uJmB6soZS5yZLfTLMFq0Tft2dQNAZJRbC8o2WEF?=
 =?iso-8859-1?Q?wxzbqQYLh1TuDg31rkBNSxt3sTO5ZL3fFrq1iwovqnx9+1jHUByyiRj+7M?=
 =?iso-8859-1?Q?Kz1zPZgbdaXW9oqqv4sUPAeQI4TOHjVLoZicRE1teMWWLBwdUMVDsqW+8f?=
 =?iso-8859-1?Q?nEab2uQaLjjSg8KbdQB06rUJ8t2FAvTr4DiKV/NSf4zl2uGR3hJqZ1ftX7?=
 =?iso-8859-1?Q?Kyrxs06bbSdxEBpJFVioHV2epvNnKvKIhg0ilX82kRGqLDAtzGV3j9V+Pc?=
 =?iso-8859-1?Q?KNVZBB1USWfgRiBfVtutCHxSasgfnGnPb4Gt4phqlBGKiIfPflCrERzq+B?=
 =?iso-8859-1?Q?MFfoX9Te7m2ZCYogvKrjjd9rIjwxRtot/+RT7T6LlIqORzijNoet4i4L+F?=
 =?iso-8859-1?Q?6fXCbdnQ+oqTVDE1V1rt3bGVxjG2N0yUn38vkRoMC+GzF2DFn2FOPy11jU?=
 =?iso-8859-1?Q?J98Nx4ISsIOo4iPsHosXMOqfkusYjGKmH2+j8cS3F6pqZp+LX1BvRxDFr/?=
 =?iso-8859-1?Q?nNYEuGrmPw=3D=3D?=
X-Exchange-RoutingPolicyChecked: lVA2WBGVfQ1veAjZGXNsY1e2nNPNHr4mIXtIsobGyGIPYttLdZK1rFV4CcKkrn7CxEg6EWcvfZy9k2yZwOc+NcIgCeIRIGyWQ7QQjYLk1z66f4GHMjQv8kZd3mtSZN6Xooit8tM9ngTJpUSaDwV++C7RInIe9/ouH5oOKkU1XVAQ9PvNM4I+VU50uPvmTkLbo2SOtdUBnbagNULFSWWKWY3QQGTmV8nfbvqaRwQJeqCvzbG/1A1t8vJQDne+3Tvd4G5y7NUM6uHZ3jV6y4NaL11n1FUjQX4mrcyblJEL81+z3LeqBCnuwfI6FfEKf+ksUPa6lZ5zcQlepYpTelLt5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33df1202-ba08-4818-87ca-08ded1a75d33
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 04:16:28.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emQ+O69G6E8xzxWoZFGglXr557jwynwPlncWLqhWjzOgyykxj6j7e0WGmnnHY3cu9QBhP8aCDXd9eAcdH3CNLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF30373102B
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

On Wed, Jun 24, 2026 at 09:40:29AM +0530, Arvind Yadav wrote:
> GuC exec queue destruction can run asynchronously. If the final device
> put happens from a destroy worker, drmm cleanup can end up draining
> the same workqueue and deadlock.
> 
> Hold a drm_device reference for the queue lifetime and drop it after
> queue teardown completes. This keeps drmm cleanup from running while
> async destroy work is still pending.
> 
> Move destroy work to a module-lifetime Xe workqueue and flush it on
> PCI remove so hot-unbind/rebind still waits for pending destroy work.
> 
> With queue-held device refs, guc_submit_sw_fini() cannot run with live
> GuC IDs. Replace the fini wait with an assertion and remove the unused
> fini_wq.
> 
> v2:
>   - Rebase
> 
> v3:
>   - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>   - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>   - Drop separate deferred drm_dev_put worker.
>   - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
> 
> v4:
>   - Replace the guc_submit_sw_fini() wait with an assertion and remove
>     the now-unused fini_wq. (sashiko)
> 
> v5:
>   - Move destroy work to a module-lifetime Xe workqueue instead of
>     system_dfl_wq. (Matt)
>   - Flush the module-lifetime destroy workqueue during PCI remove to
>     preserve the old device-remove wait semantics.
> 
> v6:
>   - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
>     letting it outlive the xe_device/drm_device. (Sashiko)
>   - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
>     can be queued from the reclaim path.
> 
> v7:
>   - Drop the per-device xe->destroy_wq and use the module-level destroy WQ
>     for SVM pagemap destroy as well. (Matt)
>   - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
>     helpers because the WQ is no longer exec-queue specific. (Matt)
> 
> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  6 +--
>  drivers/gpu/drm/xe/xe_device_types.h |  3 --
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
>  drivers/gpu/drm/xe/xe_module.c       | 50 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_module.h       |  5 +++
>  drivers/gpu/drm/xe/xe_pci.c          |  6 +++
>  drivers/gpu/drm/xe/xe_svm.c          |  3 +-
>  8 files changed, 101 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 089872507bdd..0d8848e66d6b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -469,9 +469,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	if (xe->unordered_wq)
>  		destroy_workqueue(xe->unordered_wq);
>  
> -	if (xe->destroy_wq)
> -		destroy_workqueue(xe->destroy_wq);
> -
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> @@ -580,9 +577,8 @@ int xe_device_init_early(struct xe_device *xe)
>  						       WQ_MEM_RECLAIM);
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
> -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
>  	if (!xe->ordered_wq || !xe->unordered_wq ||
> -	    !xe->preempt_fence_wq || !xe->destroy_wq) {
> +	    !xe->preempt_fence_wq) {
>  		/*
>  		 * Cleanup done in xe_device_destroy via
>  		 * drmm_add_action_or_reset register above
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..1ed993dffb52 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,9 +355,6 @@ struct xe_device {
>  	/** @unordered_wq: used to serialize unordered work */
>  	struct workqueue_struct *unordered_wq;
>  
> -	/** @destroy_wq: used to serialize user destroy work, like queue */
> -	struct workqueue_struct *destroy_wq;
> -
>  	/** @tiles: device tiles */
>  	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afe5d99cdd8b..982356513f3c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> @@ -37,6 +38,7 @@
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> @@ -232,17 +234,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc *guc = arg;
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	int ret;
> -
> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
> -				 HZ * 5);
>  
> -	drain_workqueue(xe->destroy_wq);
> -
> -	xe_gt_assert(gt, ret);
> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  }
> @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  
>  	xa_init(&guc->submission_state.exec_queue_lookup);
>  
> -	init_waitqueue_head(&guc->submission_state.fini_wq);
> -
>  	primelockdep(guc);
>  
>  	guc->submission_state.initialized = true;
> @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>  				     q->guc->id, q->width);
>  
> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> -		wake_up(&guc->submission_state.fini_wq);
> -
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> @@ -1685,6 +1674,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  
>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  		struct xe_exec_queue_group *group = q->multi_queue.group;
> @@ -1703,36 +1693,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  	 * (timeline name).
>  	 */
>  	kfree_rcu(ge, rcu);
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>  {
> -	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> -	struct xe_exec_queue *q = ge->q;
> +	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_device *drm = &xe->drm;
>  
> -	guard(xe_pm_runtime)(guc_to_xe(guc));
> -	trace_xe_exec_queue_destroy(q);
> +	/*
> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
> +	 * Keep the device alive until the PM-runtime guard unwinds.
> +	 */
> +	drm_dev_get(drm);
>  
> -	/* Confirm no work left behind accessing device structures */
> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +	scoped_guard(xe_pm_runtime, xe) {
> +		trace_xe_exec_queue_destroy(q);
>  
> -	xe_exec_queue_fini(q);
> +		/* Confirm no work left behind accessing device structures */
> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +
> +		xe_exec_queue_fini(q);
> +	}
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_guc_exec_queue *ge =
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> +
> +	guc_exec_queue_do_destroy(ge->q);
> +}
>  
> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +{
>  	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
>  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> +		guc_exec_queue_do_destroy(q);
>  	else
> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> +		xe_destroy_wq_queue(&q->guc->destroy_async);
>  }
>  
>  static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1927,6 +1933,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
> @@ -1938,6 +1945,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	if (!ge)
>  		return -ENOMEM;
>  
> +	drm_dev_get(drm);
> +
>  	q->guc = ge;
>  	ge->q = q;
>  	init_rcu_head(&ge->rcu);
> @@ -2014,6 +2023,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	release_guc_id(guc, q);
>  err_free:
>  	kfree(ge);
> +	drm_dev_put(drm);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..31a2acb63ac3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -100,8 +100,6 @@ struct xe_guc {
>  		 * even initialized - before that not even the lock is valid
>  		 */
>  		bool initialized;
> -		/** @submission_state.fini_wq: submit fini wait queue */
> -		wait_queue_head_t fini_wq;
>  	} submission_state;
>  
>  	/** @hwconfig: Hardware config state */
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 4cb578182912..473be717e2c4 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>  
>  #include <drm/drm_module.h>
>  
> @@ -91,6 +92,51 @@ static int xe_check_nomodeset(void)
>  	return 0;
>  }
>  
> +static struct workqueue_struct *xe_destroy_wq;
> +
> +static int __init xe_destroy_wq_module_init(void)
> +{
> +	xe_destroy_wq = alloc_workqueue("xe-destroy-wq",
> +					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
> +	if (!xe_destroy_wq)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +static void xe_destroy_wq_module_exit(void)
> +{
> +	if (xe_destroy_wq)
> +		destroy_workqueue(xe_destroy_wq);
> +	xe_destroy_wq = NULL;
> +}
> +
> +/**
> + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
> + * @work: work item to queue
> + *
> + * The destroy workqueue has module lifetime and is used for async teardown
> + * work that can outlive a single xe_device, such as GuC exec queue and SVM
> + * pagemap destroy.
> + *
> + * Return: %true if @work was queued, %false if it was already pending.
> + */
> +bool xe_destroy_wq_queue(struct work_struct *work)
> +{
> +	return queue_work(xe_destroy_wq, work);
> +}
> +
> +/**
> + * xe_destroy_wq_flush() - Flush the destroy workqueue
> + *
> + * Drains all pending destroy work. Called from PCI remove to ensure
> + * teardown ordering before the device is destroyed.
> + */
> +void xe_destroy_wq_flush(void)
> +{
> +	if (xe_destroy_wq)
> +		flush_workqueue(xe_destroy_wq);
> +}
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> @@ -112,6 +158,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_destroy_wq_module_init,
> +		.exit = xe_destroy_wq_module_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 79cb9639c0f3..e8e54f701cf3 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/types.h>
>  
> +struct work_struct;
> +
>  /* Module modprobe variables */
>  struct xe_modparam {
>  	bool force_execlist;
> @@ -27,5 +29,8 @@ struct xe_modparam {
>  
>  extern struct xe_modparam xe_modparam;
>  
> +bool xe_destroy_wq_queue(struct work_struct *work);
> +void xe_destroy_wq_flush(void);
> +
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..dc35f8a8c4b8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1049,6 +1049,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  		return;
>  
>  	xe_device_remove(xe);
> +
> +	/*
> +	 * Preserve remove-time flush after moving destroy work to module
> +	 * lifetime.
> +	 */
> +	xe_destroy_wq_flush();
>  	xe_pm_fini(xe);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e1651e70c8f0..6ff99310fdb4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1732,10 +1732,9 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
>  static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
>  {
>  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> -	struct xe_device *xe = to_xe_device(dpagemap->drm);
>  
>  	if (from_atomic_or_reclaim)
> -		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
> +		xe_destroy_wq_queue(&xpagemap->destroy_work);
>  	else
>  		xe_pagemap_destroy_work(&xpagemap->destroy_work);
>  }
> -- 
> 2.43.0
> 
