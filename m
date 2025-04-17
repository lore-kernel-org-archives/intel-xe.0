Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4201BC369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 08:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54F010EA60;
	Thu, 17 Apr 2025 08:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZbvT4C/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82F210EA60
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744879604; x=1776415604;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yGAzEdGxhA4rPS8jN66Pt61KbNal/TLimNiXnAfU1ow=;
 b=GZbvT4C/+WDSOejY9lmFpHxNty+bTDQtmaUn1LCofr9kz/A8ZGHUuSQz
 n0KQzNcxrx07FxCeco83mcKXMGIXt/GqU1O6O38+qAKOasvPt1dceZItb
 1fzgUzWAV9p85lOggojJJkQgmSocBAZNuNn7if8VRhFzC+o7kiBl7fU8z
 l0VZaaUgkLex38HVFdw9RmHQnoXh5dK/D89u3WJKcnItg+mhSRahXxkl5
 7dUPhDW2ZvDdzCixx+bwfE23FFEk43rJy/rB67nJlxuMp/YKxqkxNrCpN
 GPDAGst3vwlbEarfUVdfRRccno36iyy5OoHJJ38Lf6EHpIlvOjiUlHA2y g==;
X-CSE-ConnectionGUID: ZU2xZckBQiKey9VwSsXEpQ==
X-CSE-MsgGUID: 3wm4oFTbQGieJ2lEpQc1Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50279861"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="50279861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 01:46:43 -0700
X-CSE-ConnectionGUID: f00WSjr4S8WigzlXo6Qjlw==
X-CSE-MsgGUID: 0fQiN8yIT3qcDeX53Aftvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131282143"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 01:46:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 01:46:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 01:46:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 01:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mg6vVFmYjZkx4E1YCDDZYZEr4ekX9O0v9qWxzR7Uh/9DpfeXe8sfn+30z41MrfmJ+REXFy6/6TXbM5gzH5J0MwC3tL0zMQcMjj6JOr+7RF4tsWGxrH6URI9xGhzHuAKRot5B67X07tkFyg8bdbpij+SSBxgllDva2Wflh+2rRjuRjK9lZoN9AyKFnPBUv2JIm9bvxqy/BqWjE0kEnh+hSqazhEqgogXHbKUMTqXDzJ1nSjZK8FKXmM9F4XuBT50qO75UL/uC6APVF4Lj7UddTNpq+WTZ5PEatlgYrGo0ICLCCGOVuDOFI3JevdvQOZLzllrTsYYz8gPliYDkZnYsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAmyJ8en0FSH0iagGTCUiiS50+CEIGEdH6y2ZEIc00I=;
 b=D5jlstk8fn2k480JjWrVOAMPdJyCLeEiqmm8YmKKwof4BzWN0NXZ+Pj2noR2YPaC2TEnPEqKmKvouy8HKDp8FIDFk2mtqjge8pCX59FucVSlBC9CpF2yCu5V4cBW/9Fh7UAvzkhZOdqsgxvpFO3s/hlhO8jZTELlhj5MZvLS0HujZid6tzbdBOHrhxtM1DmLZDTvCKcBx7fzMu3+RKrCqF0hl3XyvbSZG5aB0KDOEtlrk62HzmjHBYP4KaoyVindfa/W4mwTB3EgmuGJ0a3NvHzIyoKlAswLCzVhRmCV0Oh2POkzsxEtHCgjJjdaot4nP02WJkJG641cpM8GNnOxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 08:46:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 08:46:34 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
Date: Thu, 17 Apr 2025 10:46:21 +0200
Message-ID: <20250417084621.249148-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0268.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 109dadaa-7163-4d9f-42b3-08dd7d8c5ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDRERlVhcGZ4NVIwYkZGOXA5L1ZFNFllaEs0cjkyUDJpTGpqbE4xMHlVc29r?=
 =?utf-8?B?TU85cnRjdU1oMFpFakp0WnAzdkl0MzNLMVNjU2h0Wm5YS3RIMjBRRVM1MHlw?=
 =?utf-8?B?a1VGeSsraC9FbHBLaXpQQngyZXJTSmRWa0ozb2x1b3N4WkJ4YnRxNzhKNEx2?=
 =?utf-8?B?Sy9EcUlENW9JYlhoR25rTmNnbWZZcjk2RVhSZTJ2MUJPeUc5TGFUNkswcFZE?=
 =?utf-8?B?UStLTCt3ME8rZE9JSzY4L0s1YjZaNDMxUHArZk5xNWNJN2h5UEJGbXZ2TEpW?=
 =?utf-8?B?b1ArWkJPOWozajdxREdacmtid0RmWXdFeFVOV2VnSXpPN3cvRGE1bjdOWFpr?=
 =?utf-8?B?Q1JYQlZBcGJNNU9TSUdxRHZTSXNCaVNJNzNNNUJsaStPTGVXREZiL1k3V2dC?=
 =?utf-8?B?QkJZN0Z5c1YrZ0VJMEwyREhLSGZhN0RMMm1MS2xmYlRyRzdObC8vcUptbUZM?=
 =?utf-8?B?VXcvalpqNzZsakJpdzAxKy9ia3VhTklRS1hoeDVNOERVbEFEV0Q0WGRnNmZr?=
 =?utf-8?B?S0ZKR2ZpaThFYzM5RHNRQ1ZFRXBLN3Y0dGFSNkQ2RDk3d2ZWaVpnbzZGZUZl?=
 =?utf-8?B?MjZHMkJFVFZuc1VySVFxZi9ZT25NZHd6OHpWZEk2aVNuK2U4Ny83YW9mcG80?=
 =?utf-8?B?VUpjZ2cyeVZPV1FNN1lPMkhNaHIvUFRmOXRKUHlSUU5tdVhUOWp0K2h3dmc1?=
 =?utf-8?B?WWF1ekswNVdqd1NsSlFtSWgwUnd6bHNicEp2VDUyU0c4bnNNcnJlWFU4OUpj?=
 =?utf-8?B?bG9CZVBEOGhiNG9abHozdHJWaFplQnRscXFNcUpEWVR4Q0xQSkNCbGsvejhN?=
 =?utf-8?B?c283NUdOb3owUU4zZG9nTmswZ2hxZVBJQy83NkRxcXRlYmhiVDN5NDloK0hm?=
 =?utf-8?B?QWFiKzV3YUl3TjNEL3d6SWJiTUxJbTFwVlU1SERTaGhqRE9FSUtWekgxZHRI?=
 =?utf-8?B?L2lid1FsYmxtZFIwRHBaRVV2enhKRHhqamhUWE4weGRUWURlblpXY2JKc2FG?=
 =?utf-8?B?U1I3YU1BUTNTNG0zRzRKNjh3WWk0L3RsRnUxQUVCOWhGVVBhUjhMVDVYbDgr?=
 =?utf-8?B?UVl4NUNVY3lOSU0yVkFnUnNoT00wZlVDajBCMGtNUWk1aGZUNkNpZWt0eVBn?=
 =?utf-8?B?ZFFzS0JnaXYxVzQ4ZkI4S2pKMmo4SytGaUZLNUE1eFNmVFJGVFZyZEpMdXpx?=
 =?utf-8?B?QUxubjdKM2QycEs1UlBOaUJSb1lVdERwT2luTHNiZHdnUndGSWk0dEh5Z1Zw?=
 =?utf-8?B?TFlTdXhDS3docUZkMm5jNzhmYnJpdVBmUCs2WjdIN3V0MGhXOHUzUFpRVFdl?=
 =?utf-8?B?Y3ZEVlBJdkU1enNtVWZ6bDZMR0ZrdGZrenFvOThOWXpwVnpEMlVzekt0S21m?=
 =?utf-8?B?VElLWlRDcnRrTGxaTVdleEVmc0x6by9LSC9JOXE1NmMxZzZxVUE3WFBya3RF?=
 =?utf-8?B?K0NTcWR0WVhUNFVjOEVzMVREcFNIR1BwQ25hM2VzdElOeHZzNjk4Wit5bFJv?=
 =?utf-8?B?S3BZRVhjR0l0TTNkZVRyOGpJUG5iV29NNFB2dmhETE1JbERDc0hGMHYxWTZk?=
 =?utf-8?B?MUxJRm1sUDhKbDRFbks2RWdXbmtackVPNHhpTE9iUDhXMXZvOThDc1lPTjN6?=
 =?utf-8?B?amhtKzRTUDUzK3dCQlZvcGwvZG02N1h3a1hYN05vaVhWeU1iMVZpRGdkS0tu?=
 =?utf-8?B?RTNvMmg1UVJjQ0xXeFhiMmxPaDFaUWVOQXhtakR2NEc3dHJBZW9YZXJ5Zmg3?=
 =?utf-8?B?UEllcUxibFh0a1dxL1l2R3hhVHVvRHpTMGJPUWprT0FKb2dYNUd0RC8wbXBD?=
 =?utf-8?B?N21WT2xtMkp1RUdVUGY1YmIvdGRFdzN1SjVZMGc5OE1TbDZJcitMQWNlUzlQ?=
 =?utf-8?B?dUNITGFKMjZhV0FmTkkzVGtndGFpeVRCVmgrRkR0clVhQVhtMW1jaUswMTVs?=
 =?utf-8?Q?0ipK3iG1oj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aThIRHN2aWtwNmdIektyN2p0ZnkvU0R2b2RNQ0toSlVRM3FySlVHemtzSkZx?=
 =?utf-8?B?V2dDTTJjUW5DOGFqMDkvZjFtOENpQXFBZ09YTWFQL3NrZzgzUWxNbkI5SGJQ?=
 =?utf-8?B?WHFObWp6N1BHc3F4S1U0Z2tJVjdIRjBWa002K3hqZG9wcGQvdms4am0yUzlN?=
 =?utf-8?B?R1BOOU9wZytpODFPajMzdEphZ0N2ODdPN3k1eER6MDcxQXltanZvZXdVSUg0?=
 =?utf-8?B?QUlNRkt0aXFJcitJRFBadTk3QjdxWDkxK3NGY1IxMUlGNFpVanExc0x3cnkr?=
 =?utf-8?B?Y0pmT2N6TEZpYjlvVlhqVWNFcWhiSFd6VnpGZHhOZmh0cjZPajhsZmVuZjlW?=
 =?utf-8?B?RmRGY3FJZ1R4amVBeEp1YkpZQW93T1hhOEJlbE5yTGJPNy9ITC90SXd3WFhy?=
 =?utf-8?B?WjJsajlmalNtVnNmZGJQb2t5dXlYcHgwSTBzWW9jN1ZCd3hxV1A2OUcybU84?=
 =?utf-8?B?WkJvdFF2czhxS2dmb2lPWks2UlZ4bjgvKzkxWG1wZmZPaFI0ci8zUGpaaXZP?=
 =?utf-8?B?dEwvdWZEb0tmTTFRbE5jN0RjZ0M3UGxVWmF2TTY2STFXYks3WThTckpsbXMz?=
 =?utf-8?B?c2trNWEvZXN3NEgxMWZadUxzcHRLdlp3ODNwRVZEWUdSd09RcGgrN2Ruc2NI?=
 =?utf-8?B?SjZFc0VMczYwQ3BoY2xYLzVpZGFOTStkZkdSRDZnYUxOSStRMTFXRGFsa3d3?=
 =?utf-8?B?WW5Pbjd5aFBZUzVDc0hlWnl5Y3JrUWlrbGhtVWpmWEVuV3VwYm1zTFFsUDVD?=
 =?utf-8?B?aFhmSDdyNndLZk9sQ1lyU2VHSDlvdlVEeDhoL2FuMGhhUU93czlGd3pNN2xj?=
 =?utf-8?B?OXM3Zk84Zy9CTjVtdEFMTGhKUDB3K0c1VCtmQlNBVTVMODNVTG1vckt4N1pz?=
 =?utf-8?B?SEhEVHVqMTZSMzNZZVdGejhrdG1lQnV4ZnZiTmhVenVxR0tIelk5MTUyakx3?=
 =?utf-8?B?SmFNM2dhT2dhRmlmWGI5MG0yUU40emJEbG5ob1pMTDJHcVd1RnF3WFYyemJE?=
 =?utf-8?B?QmFybFBrcnhHRzJVUkx3blEwWWhNang4QlFCdVN0bEtFOGNHODZzd09sSjJq?=
 =?utf-8?B?ZW05M20yMU42NEdWMGJuQUpBRFBadTdjKy8vSGluRWo5d25rSjJsd01aK29Z?=
 =?utf-8?B?N3A2QWZVT0F0RTNRcldwUElEZlczWXQ0MnVaUkxyM0VjUVA1SlpNVllQL29Z?=
 =?utf-8?B?NUZSQzhnNHRxTnlJYUw4aHk3UEFXRVBZd0I1L2lFMXVTT09QVkNsd09tUFps?=
 =?utf-8?B?SU9QbXZCZE1HTE1VM3FILzB3VlR6dStERDRXeEV3TklneEd0QmRqT0pDc0Jl?=
 =?utf-8?B?TzRWd2UxbzVZR0Q0Vmw1UHAwK2RNTVNiRDZxSzA2YzIvRWNlOWVzamVxRTFy?=
 =?utf-8?B?VGplZitvR2JzNVk1S0EvbXh3WTFrUEZzQmNKdnZTeDc4L3BYd2hQOUVpZjYy?=
 =?utf-8?B?SkFTUlh2VzZIK0ZOU3E0ZEZRd2lta2dqQXd6eXp0RWtmZVBYZSt3NHJwSFhl?=
 =?utf-8?B?eGhSNUY4bTZRZllSVVBDTE9WOVhwbzMxRndNbHVZV1FXa1FvS3h3NDQrb083?=
 =?utf-8?B?ekdIaHd6eE82cFFyY2NuU1diN1RqNWdJN3ZCSkFtMHJqZzVKdTFteER6ZlVh?=
 =?utf-8?B?Y3cwNmluM3BVaFhCNzhvSVdtU0ZCUTlGSE5vS25UNlRlOHdVbWdiSVkvUTlE?=
 =?utf-8?B?cStMTi9HTzZidTcyQ3ExL3NjdVhGRUlxSytzYTJjM2JUV09WT1M5SW5XcG1H?=
 =?utf-8?B?ckVBTy9vUmtkV0JTTFgycERMK1N1M1o0UmphM0d2M3doMXY1VnBPaWRRU3Ux?=
 =?utf-8?B?MWdGUUFlSzhKNmYvSXVrR2xXSFVXa0IzOUdrLytVZmw3TG52blZoUitIa2Z2?=
 =?utf-8?B?anVqTXFiVXdxcUFKYTc2aEFCRHZaNERkVm1aSUdLcVZnUHNpOEtkQlE0Q0xI?=
 =?utf-8?B?QUVYWFhhN1diQThyaU5SazJBRUFXVTNzbjY5WGZad09LK01aYkE5dTVYOEU0?=
 =?utf-8?B?V2lRMkhvc1BsNFZhR1lweGUyQ1d2cGhKRHUreW4wdXR1RWhMNDA3dzJVYlpv?=
 =?utf-8?B?N2RmL2U2TnNLNjh3MFprWG1NVUc0K3M1MW5OQ1dnM2JFRU9zYm5laUFEUWM4?=
 =?utf-8?B?eWMrUUZrU3lsT1JMRytwM2YrOTVzVzBvOXdMVzc2d0oyS2Y0aXRwUjJhdGNr?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 109dadaa-7163-4d9f-42b3-08dd7d8c5ba9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:46:34.5245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkFq0+7W/KlFB2BNMO0iTTznWG2DcjcwmjO8KchEFoNaBEy59Y87px5KDOoYHrvEN9vI1o/LuId1WtEqObVVjI2mF3uyqWI2TMGU+gQF8JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7636
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The LMEM provisioning is applicable only on platforms with LMTT.

v2:
 - new commit description
 - use xe_gt_assert in xe_gt_sriov_pf_config_set_lmem instead return
   error,
 - disable pf_lmem_info if LMTT is not available

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2420a548cacc..5152b1873b67 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1520,6 +1520,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 {
 	int err;
 
+	xe_gt_assert(gt, !xe_device_has_lmtt(gt_to_xe(gt)));
+
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (vfid)
 		err = pf_provision_vf_lmem(gt, vfid, size);
@@ -1629,7 +1631,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
-	if (!IS_DGFX(gt_to_xe(gt)))
+	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2163,7 +2165,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 	valid_all = valid_all && valid_ggtt;
 	valid_any = valid_any || (valid_ggtt && is_primary);
 
-	if (IS_DGFX(xe)) {
+	if (xe_device_has_lmtt(xe)) {
 		bool valid_lmem = pf_get_vf_config_lmem(primary_gt, vfid);
 
 		valid_any = valid_any || (valid_lmem && is_primary);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fe47f41b63c..13970d5a2867 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -308,7 +308,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	if (!xe_gt_is_media_type(gt)) {
 		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
 					   0644, parent, parent, &ggtt_fops);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
 						   0644, parent, parent, &lmem_fops);
 	}
@@ -558,7 +558,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 		drm_debugfs_create_files(pf_ggtt_info,
 					 ARRAY_SIZE(pf_ggtt_info),
 					 pfdentry, minor);
-		if (IS_DGFX(gt_to_xe(gt)))
+		if (xe_device_has_lmtt(gt_to_xe(gt)))
 			drm_debugfs_create_files(pf_lmem_info,
 						 ARRAY_SIZE(pf_lmem_info),
 						 pfdentry, minor);
-- 
2.34.1

