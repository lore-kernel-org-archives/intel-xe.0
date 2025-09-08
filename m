Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228DACA1013
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 08:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39D610E105;
	Mon,  8 Sep 2025 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvP89/8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D1610E105
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757319630; x=1788855630;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V9XeE2O7iVAFvy/9eDmy3zPbWsIPx/UfUM+dC3SgJl0=;
 b=BvP89/8j0tgN2KBwuRdP84nxUlHPRZ+DxJACza/Sn9imSFsPI660KXqZ
 PJhS32Q2YV7OGRRfn6ebrtrOuPCX3VTomwPMrFAxQe7obT5PWaTd5YQCp
 TZcar+dCg8xtakckH5A4C5J9qgEZ/gc+1Yn6zSC1MtzXnQejxV8UzW6wO
 Qd+lr+IU602/HuqfYDAeeBcRRloU9Y0W+mEGcrS/cuT8Qtl6EHBjcVgyt
 XuS2P2YCuE3bBODp5jmbe9kaiX6b6BbD0jGDdDcEf+e1qn7ju3wiWiuuH
 tUJ2BLK4/lzL/x/sn//UNMhwc0NKj76L9aR2my/vgjUITy+2IXI0Fw5s5 w==;
X-CSE-ConnectionGUID: bQZuhpfmScWC+68kdzyZZA==
X-CSE-MsgGUID: VjczgwoZR2mIu9AdFyAH7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="69824018"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="69824018"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 01:20:29 -0700
X-CSE-ConnectionGUID: yLimowvgSvGyGVxrCzPg7w==
X-CSE-MsgGUID: Z74lbgGFTN2uNfAxT7Husg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="196383690"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 01:20:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 01:20:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 01:20:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 01:20:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okkSGSnEQ1Hf25/ltyIhVC/LBOU8wtYS8FpE97ccNKOiaRER5gFZCJgZb+ME9CETcYNtnTqnXLgZQLSIeilQ3mowqRqOokAa+DGSTUdZ1BILlMdb2kTo8OLQGsrCf9LEzesMglioF6SX6hze6aJf+IV3Ks6QfuYGSiKl3QmMogCIotAk82qDEDfgYxRdqcL4a098VANzDUd441aUuNrqW7eh1JwgcLU9Ff0QLFWiK4ZwOiFw2g3yCTUxYC6KuylywXAPyYFQLCZbOPc/VzBzeGp+yyw0hMMqMWkqvpHxgSc2+C+W8eb05mtZVD9EhOM9WmwAX7cU+53bqypJEAjsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7xA1GEZCBDmv11tlPbxAWZfCRcoIYWRi1SabZ12qLY=;
 b=m4CTu+4AuBq2ekOASPojry/zv2LW2vvaZ00VVJML6qsZRFOXTPPH/rF3g2ojBwCFENfv3QZd3h9njlWR19/sIhJcezENX1FthjbfBzXyLVcHbSTxK7AySjbDQfxWLMZF/vVo2ZGtPIvsqYfTDD8CSKQSphrCnX25FvqKuUXnCnOX5Cl5xW2DEn//f/Aga0ysg0XBxP32Ysrd1JxS2vxPGB1bhydzIcSKIUHagfnBbHgTXXKK7dr29Vzj+iytCCY9wG22+XWRz/YFjDroXkhbs8HovSjvfqSUEFAFI90SQ7DnxZJ06od/u1bzqkJF3FS9gV/QorEKgmKRqqWNL+ClrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 08:20:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 08:20:26 +0000
Message-ID: <c599e5f8-ae8b-4437-89f0-f3246544c502@intel.com>
Date: Mon, 8 Sep 2025 10:20:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Move ADS BO realloc to xe_guc_ads code
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250905143538.7927-1-michal.wajdeczko@intel.com>
 <e505dfe3-19ec-4323-8833-30a5b00efa19@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <e505dfe3-19ec-4323-8833-30a5b00efa19@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ff43f9-a892-4ff7-2c2f-08ddeeb0906f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1d0bWh6TWIxRE05K3ZKNFlxM095MTJCZWNWcEJDVjNhYnV3VGZyWTdtQnQ1?=
 =?utf-8?B?UDEvTDVGczYwUmxwdU14dko3M1BJaXJ1eklhelhkRGhzMlZCZDFxek9jOGRw?=
 =?utf-8?B?UUFHSDl4SVU2UU9ZcmFtNGJ1cGhIVUIyQ2djMmE0NW9LTit2SmR5OTFaeWlx?=
 =?utf-8?B?QW5kWjN0VDEwU1BjaWVxbUhnNGprSXkzTUNXK3NwQy9ieWE3UFE2c0JUTFU2?=
 =?utf-8?B?dDdaZk5XR09GdXlFWUFRQ1RwbEcrYXgwK0dueTlXS3BnNEJaVjlyRStqVDEy?=
 =?utf-8?B?YTJBUmlnM1lKZS9QaFNrRHFnWkVURlhvWEZ3a2tYWEk0ZkRsQTd4bDViRTVn?=
 =?utf-8?B?aHovcU8rajdRZG4rclZHc0pLMWliNGI5Y1lPY1UwYXdxRXdaNXlWSHBMRjls?=
 =?utf-8?B?cTZBS1djSm5GNmFTR2lnVjFIbFhKTGdiNmdVWEEzS0s3ZEkwRnlsSnNHeGJG?=
 =?utf-8?B?czRvak96RzQ2ZWdiSkloeFdhbDhuamIrSFRiTTU5K2R2Y1c3bC9PSDV2Vy9B?=
 =?utf-8?B?UG1nNEFGNkRhVUF5aTh6SlRWWjF4SVVMME0rMVljTWZrdHdhN2gzVGw2WUp5?=
 =?utf-8?B?eGFPMGpBeVM4eGVEU3hTcnlrcy9DYXFlcVV1NEkxSGE1dm8yYmVzRit0ZStJ?=
 =?utf-8?B?VVoxOGcwZVhiR0tncnozZjR4QndmMndiTHJJZ1NsOVQrVlFiVHM2anNTaEhJ?=
 =?utf-8?B?NzhYTVRxbnBKbjhmc3kzVTdRUWFZZndxN2d1RmVDbUhMc2JQRmtaaHlPMnRW?=
 =?utf-8?B?WVIzTTJ0Vy84U0doalVDL1prZ2xpQVdzNVJoUWVsQXJIcFVkTkF6NHpQZWFP?=
 =?utf-8?B?TEV1R0pVWU40UXJzLzJHVVAwWjNqTXYvV0dvTjFrU3FqQTJYMUZxSEpSU1JX?=
 =?utf-8?B?Y0NEaUg2VFlOMmxiVllrTmtraFZ1U1N1WVV3THJ1WWJuSnptOVc2SWFFcHdD?=
 =?utf-8?B?SE9UOVZ4bk1Wd0l6RHZtcUdmc1EwVFdKVk1EeGxzZ3FHMThpN1doalVCYUEy?=
 =?utf-8?B?ODBlVEZ1UjI3RFl3bCtDc1VtQThpS0c0VTJGZVNpWDh4UHhSQUNvOUJOM0Yr?=
 =?utf-8?B?RXFJa1lQdkgzLzltWlNQMS82VXpsN01TSGFMbW9XZUprQk1rNFAvSjRmTEJn?=
 =?utf-8?B?WWE1b1h0bzA5SFpyT20wTVBGVUdORHdOQUlIQ0QvdnpsMDhCcEVWSkozWVBN?=
 =?utf-8?B?Si9lUmRDVUZIZVhLNTdwWEtCK0I0aXZoREZNdjUzQzNhVi9EK1ZIZmJjYzZI?=
 =?utf-8?B?emVDTUVkWmZHK3lYMGpqRGE3UUxjSnFCWjZlOUt6VHVLelV6OUhCZDREVmFr?=
 =?utf-8?B?QnpUaXlqMVMyZmxJK3JxMkpTSTcvT2M2emVtN3lPTWY4T0JNQ3dJd2pEVFFw?=
 =?utf-8?B?aHhYR29SSGZnZ3VHUWRzdG5IZHF3V0NyWHFzL05ycmY2RDhaQ25lYUtGQ2ZE?=
 =?utf-8?B?Q1NGYXBKU042anlIRllnZzdpbHl1M0ZaRVdUNDJ4aFZxZFRYU0QvaVowS1Zp?=
 =?utf-8?B?RVdBM0RxVGptT0kvcm11Mmp3bXF5MTZjdjhkdHlnRlREUHpLajBxWnFlTWlP?=
 =?utf-8?B?K3ZNNVZmWnRMdHBWWVdETzY2RlcvWWEvSW16dzBjK0xCV2k2M0h1OXQ3OXFm?=
 =?utf-8?B?eHJRV2didEUrNVJ5MjhYdytMLzMxZGsyeVoxNktIMXVXOG9qRXRPV2VRa0Rl?=
 =?utf-8?B?aHh0b0JOK3ZaQ3VnZW5HNWk1R2NPV0ZnUmErNitmbTlUZkwxVE1kdzhDNzVt?=
 =?utf-8?B?S0ZqRFEvaWtRVWhpMnEyRUp3WFVSQ0ZFTXlDK3M1VW1UZFV5Zy9RSXBVZ1FL?=
 =?utf-8?B?ODRzdkJ5bncvRkdSZUlCNkFCRXVKOWQxRUpCU3VBYnpzWFNHVUwrRnpRZ3RS?=
 =?utf-8?B?MGY2b3lhVng2MFB4MHhadkVPc2ErSjF4c244eVlhejFLSTZOQWFZV1paaGk3?=
 =?utf-8?Q?RBVGV08cbC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RXSW0ybkRDbkdrU2dPd29aQVBNb2JYRHY2ckt1eTl5OEtJaW9oVUEzMXZU?=
 =?utf-8?B?SEdvcnRMNDFhTnRJNGJIcTIxSDFRTFpYaEcrRGxqdlhUS2loQTJEWXJCeW5I?=
 =?utf-8?B?TU9jOVZiZmNlUVU3bE85bWtsdUsyTDFlMHVKRXZsTlU3dDdmQ3d6cDM4WWUx?=
 =?utf-8?B?YytIMDNQaU9BeWFFenZLS2RyR1RoakNzSFdzV2dmR3ljeWFWbXgveFFoSXRI?=
 =?utf-8?B?dzZyRVpHMTQwMU81WWVQWlNKRmsxalFkeHhZY2ZyRE1IdlAvanJHZWNwd0Vt?=
 =?utf-8?B?bTNyV1V0Vzc0RHo3cFJEeDFNSTRaVFJEb1dHWGIzSlV2a1RoQW1TSitaNzEx?=
 =?utf-8?B?WjRtL1BjN2Y0ZktsM3RCcWtiSnNray95QTFEVEtYOUVoUGxKUDRkbmR6cG1E?=
 =?utf-8?B?OXpJQVBvSnlsa3VnN28wb2FPdG84YlhTemJRUUgveXRUY0JRazVxNGFoSlZ2?=
 =?utf-8?B?Z0ZvcndPRGZiNmdQSFZlM0x4Rmc3WkpLNzg4ck8zSjRqSE9XVzN0QUlJZ0lZ?=
 =?utf-8?B?clVKTnFrSHZmZkVoWm5LbGM5WXpLVHlzcU9NdnNUbXQwTUhzYm9wWi9OK2p0?=
 =?utf-8?B?YzgvVXFiRmxuUEdSN0pybDlwaUlzSXQ2K0dQWDVnMGl0NzZxYlp4bnNCalBO?=
 =?utf-8?B?NlZNUldPRGMvVXFaYUhzbTVqSCtqRjVQL0srcDJIM0UyUU5EQXhEZGNDaGlh?=
 =?utf-8?B?YjBKNGV3VTYrV0FLSFVmUzJzRklPQjZOTENDdnRnU2FGUDFYSjdNUUJCUFlt?=
 =?utf-8?B?U05SNmNwSVdRNHNYeUlERzZqVXVsdXptOEo0MHBqVmpMdWtCZ3ZtQS9lMHlB?=
 =?utf-8?B?MVpBbVNSRXMvZytnVGFTU1NBZDF6T2RmNS8rcExzOVBjQmZ2RktldE5sUnBq?=
 =?utf-8?B?U0ljZnA4dlF0anJ5TG52U09WNmVTVVpkelFBWGRRSnl0UEE1N2JhNGFLaERY?=
 =?utf-8?B?T05nWlZXdTRsT2MvaWVoRUd2WnFyekkzZzBOZmxpRUhDeWJwUGFpbFR5eGlY?=
 =?utf-8?B?TTJhdkZGN0gvNDhreTVmWUFaRDRLeHU0OXRWbm9xU0tWTmpRZHNWc3lkQkJQ?=
 =?utf-8?B?M2dhemlkTWtZdDZsQXd0cnAvYk5xWk1nQ1BDNERkZFR0NFhYZnVRRXBBTU9q?=
 =?utf-8?B?RUhpZDhTUTBReUJhZjl4aG9UMEJpeHMxc3UxdUpHQktJanIxeHFVVEF1cDVI?=
 =?utf-8?B?eFFJWXk5bTVYV1NFaWZycE96ZFJpVkcwNjdRcXhsSWM0L3J0UFRIbGx6dFlT?=
 =?utf-8?B?dnl2Rk9zUUFkeEEya01HQmtaU2RiUzNvZ2R5UW9YS28ybmNKYlBCWVRNMlFE?=
 =?utf-8?B?RkY2YXFEV0wxcy9zSFlpVzF3b215Zkg3OTVpTitFbXhGL3RsMmlEcUJla0gz?=
 =?utf-8?B?dHZ0a1hZVWtpYlBmYmc3TloyYXpaOWZCVjB2THZNM1ZLajNWUisrZTh6OGhv?=
 =?utf-8?B?MGM2RHYxdmU0M05QYURhVDR2RHlGRm9LZmRWdTZ4Q0tXZitJVUViSjA5clpl?=
 =?utf-8?B?UW4yK2VaekRvVnJkRDRVaWt3OWdEZzUvQTFIRTByNSt1dVA2bDBwd2d1SjV6?=
 =?utf-8?B?SStLOWtQbUlCbFFkZFh5bTlpQjc2cUMwOWVMdkNHNFczRVF0bTJmUnRZSnpu?=
 =?utf-8?B?Yy9BT2hON1lCUUd6TWpBdkJZeTl3anFrSHp2OVRyVmo2ME8yQzYxQmFjYkdu?=
 =?utf-8?B?ay9jYTBOeko1a3RZdkszY1NtMXpJTnNEbkYrK1ZzVU1tR29acjlkc0FUdTR3?=
 =?utf-8?B?ZGNzeWhOcTAxRWdtWDVHazV6TVpKb0V5MXp1aFhOVHNqVTVJQVhzdmpnbklk?=
 =?utf-8?B?UVp4OS95cHNWdUN2cEpzR1ZWOGljcFNLMGZjMXpvSHNqck1udFROZ3VZK2py?=
 =?utf-8?B?T3ZZQkhETmpKT0JPSzk2NGd2STQ1YUNadk1hYlJnVHAxUG1CSHluSmdoQVdS?=
 =?utf-8?B?YUs3Q1pMdUpQaXBTRnd0Vm9IazJhR2E0UHdkUFhZcVpjSHBndmxhd3hreGxI?=
 =?utf-8?B?SVQ5UDlHSnpTYWVhZXhoampGU1RENUowT29aM1loZi8rd3Q2cnBRZzY1NGEr?=
 =?utf-8?B?ZjgxckZWRGI2MHdVWVZJNWJJLytYbTVucE1pNEIzSjVPY2NRT0ZTN2paYlJs?=
 =?utf-8?B?YTRVZ08wK0FuZGkxRVBkU1JRKzhrOXN2VjdGSVJsZHlydVhPK0J6SU1zSFhi?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ff43f9-a892-4ff7-2c2f-08ddeeb0906f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 08:20:26.3667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3QuKWgVuVxqXm3piFC30AEffU6ctaephNen55oPEUUOs64aSfdlAFUuBs/U70qJJJZfda9Ojmhh0Y0+Ua90Fs7t61twyIT7y1RHpn9qzRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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



On 9/5/2025 10:03 PM, John Harrison wrote:
> On 9/5/2025 7:35 AM, Michal Wajdeczko wrote:
>> We already have dedicated GuC ADS function that is called during
>> the post_hwconfig step. Move ADS BO reallocation there to have all
>> of ADS BO management together. Note that since any BO reinit must
>> be done prior to the point where we prepare GuC boot params, as
>> those include BO offsets, we have to move up call to ADS function.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c     | 10 +++++-----
>>   drivers/gpu/drm/xe/xe_guc_ads.c |  8 ++++++++
>>   2 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index b3a6408a5760..a62c483c9d88 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -705,10 +705,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>>       if (ret)
>>           return ret;
>>   -    ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
>> -    if (ret)
>> -        return ret;
>> -
> But the sole purpose of 'xe_guc_realloc_post_hwconfig' is to do the re-init in VRAM for all GuC objects. Why split the ADS object out and then have to re-order other things to cope. This is the sensible place for it to happen.

But those "GuC" objects are not directly owned by the GuC (aka xe_guc), nor were directly allocated by the xe_guc.
Instead they were allocated by the GuC sub-components in their corresponding init() functions:

* GuC CT - see xe_guc_ct_init()
* GuC ADS - see xe_guc_ads_init()
* GuC Log - see xe_guc_log_init()
*..

So since we logically separated CT/ADS/LOG into dedicated sub-components, handling their internal data from the GuC level is a clear violation of the layering and we should continue to let sub-components manage their data on their own, and this means that it is up to them to reinit theirs BO at the post-hwc step.

Note that in case of ADS it might even mean that ADS size can be adjusted as we know actual config (something that is not possible to be done at upper GuC level)

> 
> John.
> 
> 
>>       return 0;
>>   }
>>   @@ -847,6 +843,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>       if (ret)
>>           return ret;
>>   +    ret = xe_guc_ads_init_post_hwconfig(&guc->ads);
>> +    if (ret)
>> +        return ret;
>> +
>>       guc_init_params_post_hwconfig(guc);
>>         ret = xe_guc_submit_init(guc, ~0);
>> @@ -869,7 +869,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>       if (ret)
>>           return ret;
>>   -    return xe_guc_ads_init_post_hwconfig(&guc->ads);
>> +    return 0;
>>   }
>>     int xe_guc_post_load_init(struct xe_guc *guc)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 5631722f34f5..fc2c37ca9dbc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -424,11 +424,19 @@ ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
>>    */
>>   int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>>   {
>> +    struct xe_device *xe = ads_to_xe(ads);
>>       struct xe_gt *gt = ads_to_gt(ads);
>>       u32 prev_regset_size = ads->regset_size;
>> +    int ret;
>>         xe_gt_assert(gt, ads->bo);
>>   +    if (IS_DGFX(xe)) {
>> +        ret = xe_managed_bo_reinit_in_vram(xe, gt->tile, &ads->bo);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>>       ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>       /* Calculate Capture size with worst size */
>>       ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
> 

