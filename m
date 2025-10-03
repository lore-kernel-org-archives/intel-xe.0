Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA558CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D17810E125;
	Fri,  3 Oct 2025 14:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxqk5JV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCB010E125
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759501466; x=1791037466;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YasSseBUD6TRY/PoEz7kDSRj7eDQMLczwBf5r7l2JUY=;
 b=gxqk5JV1dAjG5SUjBm+HcxNl7Q4v7pgiumTcRpxCZ8ebux/jIMB7sTGa
 VL0jk45Ie5HDsdez2lPM0o/vapRUP0xc0LNYzLt0yIM5qGjskYysGyL1V
 gi6W16EhGsNUoZ6XY7G9qA2ZoBYFj9ezAWIsNSD815Iq/v+glIIC21O0O
 7HsX1zREvGpWRdxg0aOuObVyMS8dOG2ImgcbVDmgeTEp08GgGQ+jmWwtw
 IsjGF27MkiVJ3JNdDZV8J+CWsRnfKAkbCccs/Wn32FAcytP7L/Y3hY5II
 NowerAIbV6Y4T/qjfycwW5nfG+tvzkxF175e/Lgrs5pP1G64K8R6X2ZcY g==;
X-CSE-ConnectionGUID: 6eCUCbuSSlyBjwzcj1pn3g==
X-CSE-MsgGUID: ItU4T4+xRUaBYWf082VkXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61669126"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61669126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:24:25 -0700
X-CSE-ConnectionGUID: HpHQCvaVSwO5Y6T2GGqo8Q==
X-CSE-MsgGUID: bW+feOwUTBy2bVYZ6M5ymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="179733764"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:24:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:24:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:24:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQ46skFBQeabdQ0SayifBD1UFAZBGH+Hs0JEeXyD5j5xakNxOpjY3woulBJfx3eFcrCkeUWZuKYuCqQcZLtW1TNKbINKHf/TqJiYQgFaIiUz2x5vXHrDba7KZ8Bg4s861b9HQfzcOnJ5jWeUIwWdVJsagiCW53tUc6lrwWu73IlChcxeRV+QHEuY9bfHETK1EeA5iwMuF1MxDlWxnxOidraRyz/QGisM838MHYNpgEX0GRoJAct9ZKdY/bLRu1ZWIF6oceQnE7XZuqlrLXAAFVaxwS3dVLtBgTatJLsFeA1c1demSqwNXNjRaj5ZJDeLU6Wfqy6yRRK8KQjISiNmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3wvFAxkh3PSgQ4LTsidM4yA3N1rM/vyEtRr+SYDkjA=;
 b=kDvqw7YqlhMUs601jIknJeNL4hN954A4dSMoUzP5FXT2pWCmV6YJCYSHsjUN+uVz2I/BRkFxiwVq5Yv+L1CgrtBrHszd/sp2UDRQNchOtxJbliJUgbd80bmI/zfG/jmMKcY7ADEbXgsltibMlP1/GEZvPjYqigyN6WDz2Bd8JfilVDHuOP8X/t9YxmCzJ7EPJBw0AHdJTxaBIZeWADKDl1z+Yg5B0m8614f22ZlPRmbZqxxKuzc5rFiCXarzVhrwhNGbzhS1jZws2kIF6+7e6ylUBDcVOPo6tT7R5y8pMVOZTBS+0OLLD5jUoX+rBkme3/GPC52Cs2uxpuurdf34Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Fri, 3 Oct
 2025 14:24:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 14:24:16 +0000
Message-ID: <d9c9b830-3deb-469d-83e9-93a5adb3ffc9@intel.com>
Date: Fri, 3 Oct 2025 16:24:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/34] drm/xe/vf: Close multi-GT GGTT shift race
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-16-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002055402.1865880-16-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5c27ee-f3ee-44c8-2b7d-08de0288889c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE92ZC9jMnNCUUxvSlBTN1hyY0xsWXFmME1oalpZR2NUTTl3NWF5N3l6Z1Ax?=
 =?utf-8?B?aThITWhFdUNLUVpmaWJPNCt0bmdvVVVSTFV0NUVYSVlCVWNlWTFLZDRYeEtv?=
 =?utf-8?B?L1NIS0lSVlJaWUpNQ0lPSzZDTkJuSTlXMTRDbWRRNnU0RWUzaEw5UWpJSkVX?=
 =?utf-8?B?eW1XOXpwdXpQcnRhS1c4L1A0QW5zdWpSdkNMUkxzMmg2MVRuSzVWVEF3WWhp?=
 =?utf-8?B?SzFGVTZITUpuSHNveUM4UUE2ZGZqT2t6YkxqY1Q0Z0hsZlRwMlEwVFJaK29G?=
 =?utf-8?B?V1hiNExxZ3pPaVNVTDRQZ2NpVTdIQVIxaDBWWlFoSURHQ0lmWFErQ3Y1U3BN?=
 =?utf-8?B?VE5LS0RNRlRiUDhwcDVMTzJFc3hvYk9EaTlpaS8ycnBqd1c2MSttYy9ITU9u?=
 =?utf-8?B?MGxNbFg4TzVXNnFpeEd1N3lIMUpFL1oxdWJmMnVBN3hsVGV6VmF3cmo1Q1li?=
 =?utf-8?B?M3NybUZJY1VBbHZVUUtYQTIvT2FHQ1pYL3VBWVhlSCtaQ1YzT3VQaE1IR29Y?=
 =?utf-8?B?TkMyL20xVm9EdlU2dnlxVEQwbFd1RjM0QmJQWGt6bTdDUTdsSTlHME9HQk44?=
 =?utf-8?B?ZDVGTEh6RldJR1RXY3AxQ1RVSGIvUHprb0MxcU9aMUt0RXNUZmxUQlordFI2?=
 =?utf-8?B?R0xpUnRmSEhvL2hmUzh0bC9oanBMTy9vRTUwdkJHSDR1S0h0YzQzd2F6RDVU?=
 =?utf-8?B?QmQzQnZHT0tUZFp4SFpXajM2MFhJd2ZFMWJjdzRtQmpuTC8wT1ZtMjQrUEJk?=
 =?utf-8?B?d0J2aWN3WG1qRWtSSk0yT3ZNK3NKMGJjZSs3SGRKOUt4Tm92eVMvZ21OWDRO?=
 =?utf-8?B?UGNzSSt0bGp6Y0ppeEc2VHc0THcydjVDM1VJYkJHR2MvUkRTQjJXSUFtLzNN?=
 =?utf-8?B?MkswUUt1aGdXcGpleW5JVDZkZ2hPdzVxS3pidzUvMllkeFlHOEtWeHA0enZh?=
 =?utf-8?B?WCt2My9Cd0xxYVQ0Z0JHOGhZYWdSOXJuQVJNS0Z0azYyTUZzd1RZdENpbEFj?=
 =?utf-8?B?UjNOUXpiMFVzRlc0cXl2TW1qQjg5ZkJrN3k5eWo3ME43d2dwUnFna0g4SThy?=
 =?utf-8?B?NGRvbDA5TWJzUzlCVnlOcFRlczJOTm5XMEVCZkNoVDhGWUhUMmQ2MVpSQ0Nw?=
 =?utf-8?B?WjNOM1pORm9HTXVuMjc5RjdOc0o3clhGZmlPckc5d1k3UjJFcFdtSnBneGxU?=
 =?utf-8?B?dHNFRDNGTEpTZS96YTQxNUVrQkpSS2QwSkhqaXhPNlM5TzlpUXVmb2F2d3F0?=
 =?utf-8?B?M2RVWndoVk8wZk9xUWFIeXRSaXFlSUFOV3QyM2orZWxaZjJ2ZzJkaGdJbmpT?=
 =?utf-8?B?Uk5XMFRwVC9Kank2d2h3bnBHTGFQL1N0Z2JYSHo1N3VsMWN0K1gwbFV2MDdw?=
 =?utf-8?B?c1k5dkY4Y0tWNWZ1R1lwcVJRNnpnRTZlNE1pOFVrbjlYL2hpYyt0YkNiSzF3?=
 =?utf-8?B?Z09uQmNRWHpNS3VEZUJsdVhuNGhHZ25hTzlxbWF5bCtjc0traWVUd0dPNm9y?=
 =?utf-8?B?dGRsY2F6WWpucTRhV29sNDZLSTZ4cGtQWWYxeDFyYXRVNldhT20zV0xBM05H?=
 =?utf-8?B?RWtlU3B4UjlPeVFLNE11UlJzbHVUR2doems0c3ZoUlpFT0VaOHlZWDJXOE1H?=
 =?utf-8?B?ZXE2emZmK2g4QUphSHZGWEk1ZVU2c29rQTJuQnlsdGg4OUZDSmxNcHZ3V1dn?=
 =?utf-8?B?NnhWWThTTm1xczhMVEI0NzlwVjRmWFZGTk14UkN2SE5WVXVrZFJBTWxDcGxL?=
 =?utf-8?B?U0VuSDV5b1FJanhhOHJSbnN5a3Z2Vmc3cS8vQ0NPK0VpZDJYTDR1SVhpRjlH?=
 =?utf-8?B?d01RQjBidlFmais3UWc0YzVnbmFXN2txOTFkNWdHTzdXU29hbVpmeUUxZ0px?=
 =?utf-8?B?SXBzNjN1S0JJOWttOXJnVmhxbHpBQzZlOUlLY3FRUUxqQTh6TnBhVlFWdXBP?=
 =?utf-8?Q?TxlIonBd0kw3HwTf7T9zdx5hEEH5MUOw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajVzbEFTeGl4RzBQall5blVIbG1KMGZYV0RSY3Y5SjQ5WkhVYjJJWlQzNkNL?=
 =?utf-8?B?bjZ5bmVQeXhCMTFVc1Rnb01nMGxPQUdHTzFpWXhXRWcxV0JWc3VVSGV5Z1gy?=
 =?utf-8?B?UFg2eTlQN0k4UnFLM2tsR2VES2tPaG0xMWhIK3JsVStKTTFUSVdwdmlHYlJu?=
 =?utf-8?B?a3VmYUdTeXVPVy8wVjBUc1FudngrNFA1aUUxemF5MWZPR0xlbXZoSjRQcDNM?=
 =?utf-8?B?N21CUjZHWjEvdGp2MXk2SVFYMUlvMWxoRUl6NnEzRjF5a2VMcHNlMVVXeEtP?=
 =?utf-8?B?ck9ia3IzNDd5NmxET0xOS3NGR3NWcEQ3b3cwOWYrajYxRzdrc3cxWlkrbHd6?=
 =?utf-8?B?YTd5SFNoZ0Q0THkwa1BBdVhzZTJEeWFnSHMxTk55cVduYTNPUnQ2VDA5c3dK?=
 =?utf-8?B?T2p5ZFdxMS9lZ1Y2bFhwUHF5R3YrU2NRQWpGc2JPRmZBOEM3WUZHcFZXT2kv?=
 =?utf-8?B?bUN2TUl4aWt4eFcwcWFhU29BZjdsOW4xOFR0b1V6Q2NNZmNLRWlGcC9jbk9P?=
 =?utf-8?B?YTRSQ3RPTFRKN09TN2FleE03SFpobXJKY0x0S0g4Y3pCTGtOU2lObGNCVkYr?=
 =?utf-8?B?T1JyTmtTdkp1WHhUbnJCN0hGaEhQeFJNQmJhbjVSZWJJdHBTSXRMY1BKQ0gw?=
 =?utf-8?B?MkRwM3ZpN3RzUmlDQm1mY2Jia0VabU9kMi95QXVYOWVZTmpUclpWTlAzRVlt?=
 =?utf-8?B?SzYxdi9zUFcrYnY0MUtIL2R6MTBzSlFTYnBlRzNhNFVRczNzY2ZpUVl5NEdz?=
 =?utf-8?B?UHllOFlhN3BEK0JlRms5a2d4WVNORUZ4K3VTQm9xZjU2QmlEMFdORzM4akxs?=
 =?utf-8?B?L3dYem5yMy83VWM0NHBqSHZnYWlLcWhxeGFkNjQ5cXpBRWNHQjAwZnNRL2h0?=
 =?utf-8?B?NlVCdTVWWDJHRER3L3ZjWFk0b1FLSENZOFNOZVRMY0VXd05oS0VGdlQ0NEhO?=
 =?utf-8?B?VDFDZUs2UFpiSkNuTzNWYXRkaURldkdUUjFteFFFOHhxRnIza2lsUVQ3RmND?=
 =?utf-8?B?SmlpNEdwOHlBNzVBam5DYld3dHFkWUx6L0NPejBldFhGSzdLVGI4V25TUGZm?=
 =?utf-8?B?a3Azc3BMaDlYR1UxWCtkaU4vQ0duSlpkS2p1b1hYOXh5Q3hHdjRCK2lqSkZ1?=
 =?utf-8?B?ajU4Y3dhTVZ2WUN5eDdQVnJjQWF3Wkt6WkxCTUxnb3F0RjJNUW9TUFRWNyti?=
 =?utf-8?B?ODRYUWp2NW1uZ1BYWWFqRUtzb2wvWGFUdC9UOFJyOCtCSFRVV0pZMGpocEcv?=
 =?utf-8?B?dzlvak5Ta1ZFclBkVVVkYzVwT3ZwYU83anMvN0tXS2lZNG5wY1lVcU5iQWxF?=
 =?utf-8?B?ZGRTWlpqdmxxbXRxNTV3WGRZNDdSd21UdFJDRDdvQ3oxOHE3OVprTnlFT25U?=
 =?utf-8?B?ZVBSSFJ5TmZQSW8xelFQbFBudkxTVWw5Q1N5a0MrY1B4T0laVXY0RkU4MjdY?=
 =?utf-8?B?NURXUFB5Z2hNSWNBa1J4eEFSUTNKMmFNY0pHSThEaWk2RVc3MUhvcTBDd1RY?=
 =?utf-8?B?OGFWQXJHNFZTaDdlNitEOE5rUm9aNHhjejF0cElVaTR4dzkwTXRybTNvY3N4?=
 =?utf-8?B?QjRVOXJ6QjVJUDZLaDVBdXJCdzNWSXJCZndhNTc2Kytqa1haTUpYTGdHeHFU?=
 =?utf-8?B?TnNmVFpJYWU2K0lLU3FhUUE3STR5eGJieVZTTXBldFp6UldvR200UktwVlFz?=
 =?utf-8?B?b0pCR2k1QmdLZUdRTjhzYmNSNy90WHBoSlpWSTcxbHFaWldDK1Zpb2dhRUpI?=
 =?utf-8?B?RFJCTnUvSVFGS0U2VXVKTjZFMUhRNnd6MWJHRlBqMUJJUGJ4a0lCVDF6MVRq?=
 =?utf-8?B?MEZDcVdmd2lINC9zWm5qZ3BCWmdoVHA3aStDSVZ6cTIrYk5DaVdIOXFyUVNy?=
 =?utf-8?B?LzZROWIxUmhOU2Y5UXJ2cFA4MUxMb3lSazlzZW9nQXZoSHE5bldPb2xVSUlk?=
 =?utf-8?B?dmRsUllxa0lMaVFvREVOeXJhNDArRFBGUHJyaHJFd2wxNjF3RDJUVE9WMXBh?=
 =?utf-8?B?ZWFqS1I5L0FVa0xvL3NheUs0RWUzcW9TM2JxZTg1MFRWbVdhWlhndkpybVNx?=
 =?utf-8?B?TzNMeW1NMFUwcDJWZlgrS2VBUUMyWGovK0hKUVFUblZZVUptUncyWHNQN2dl?=
 =?utf-8?B?TDRUQ0hBZ2duK3B6S05vdFhaZnpvMlBpSXFhc25WbWJVMHJWb3Z4ZFBTWG4z?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5c27ee-f3ee-44c8-2b7d-08de0288889c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:24:16.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6YAsPo36dAEUa0BvKkuKm/CtfcKDR0t+HudGf7XQ2b/cdozsAxnR0439VGxL+yXjYirAksaLqqwrnzKGqw6DDhXFAoNqgvXr/TIppU5Eww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
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



On 10/2/2025 7:53 AM, Matthew Brost wrote:
> As multi-GT VF post-migration recovery can run in parallel on different
> workqueues, but both GTs point to the same GGTT, only one GT needs to
> shift the GGTT. However, both GTs need to know when this step has
> completed. To coordinate this, perform the GGTT shift under the GGTT
> lock. With shift being done under the lock, storing the shift value
> becomes unnecessary.
> 
> v3:
>  - Update commmit message (Tomasz)
> v4:
>  - Move GGTT values to tile state (Michal)

I'm wondering if this would be huge task to make this move as a separate step/patch?

>  - Use GGTT lock (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 166 +++++++-------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |   2 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  30 +++-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   2 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 +++
>  drivers/gpu/drm/xe/xe_vram.c                |   6 +-
>  9 files changed, 117 insertions(+), 127 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a6c361db11d9..c27414d4e856 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -27,6 +27,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_tile_sriov_vf_types.h"
>  #include "xe_validation.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -185,6 +186,8 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +			/** @sriov.vf.self_config: VF configuration data */
> +			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index dc2516be590b..768c192eb662 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -436,42 +436,57 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> -static int vf_get_ggtt_info(struct xe_gt *gt)
> +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile_sriov_vf_selfconfig *config =
> +		&gt_to_tile(gt)->sriov.vf.self_config;
> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size;
> +	s64 shift;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	mutex_lock(&ggtt->lock);

with
	guard(mutex)(&ggtt->lock);

you will avoid all below error prone goto's

> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	if (config->ggtt_size && config->ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>  				size / SZ_1K, config->ggtt_size / SZ_1K);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> -	config->ggtt_shift = start - (s64)config->ggtt_base;
> +	shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
> +	err = config->ggtt_size ? 0 : -ENODATA;
>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +	if (!err && shift && recovery) {
> +		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\\n",
> +				 shift, config->ggtt_base);
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +	}
> +out:
> +	mutex_unlock(&ggtt->lock);
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile_sriov_vf_selfconfig *config =
> +		&gt_to_tile(gt)->sriov.vf.self_config;

I would try to avoid accessing directly tile-level data from here,
but we can fix that in follow up

>  	struct xe_guc *guc = &gt->uc.guc;
>  	char size_str[10];
>  	u64 size;
> @@ -481,20 +496,23 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>  	if (unlikely(err))
> -		return err;
> +		goto out;

these goto's seems to be unnecessary now

>  
>  	if (config->lmem_size && config->lmem_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>  				size / SZ_1M, config->lmem_size / SZ_1M);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>  
>  	config->lmem_size = size;
> +	err = config->lmem_size ? 0 : -ENODATA;
>  
> -	return config->lmem_size ? 0 : -ENODATA;
> +out:
> +	return err;
>  }
>  
>  static int vf_get_submission_cfg(struct xe_gt *gt)
> @@ -508,21 +526,23 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>  	if (unlikely(err))
> -		return err;
> +		goto out;

same here

>  
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);
> -		return -EREMCHG;
> +		err = -EREMCHG;
> +		goto out;
>  	}
>  
>  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> @@ -530,7 +550,10 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	config->num_ctxs = num_ctxs;
>  	config->num_dbs = num_dbs;
>  
> -	return config->num_ctxs ? 0 : -ENODATA;
> +	err = config->num_ctxs ? 0 : -ENODATA;
> +
> +out:
> +	return err;
>  }
>  
>  static void vf_cache_gmdid(struct xe_gt *gt)
> @@ -544,17 +567,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> + * @recovery: VF post migration recovery path

small note about what's different in this path would not hurt

>   *
>   * This function is for VF use only.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
> -	err = vf_get_ggtt_info(gt);
> +	err = vf_get_ggtt_info(gt, recovery);
>  	if (unlikely(err))
>  		return err;
>  
> @@ -584,80 +608,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   */
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  {
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> -
> -	return gt->sriov.vf.self_config.num_ctxs;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the LMEM assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> -
> -	return gt->sriov.vf.self_config.lmem_size;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> -
> -	return gt->sriov.vf.self_config.ggtt_size;
> -}
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u16 val;
>  
> -/**
> - * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: base offset of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> -{
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>  
> -	return gt->sriov.vf.self_config.ggtt_base;
> -}
> +	xe_gt_assert(gt, config->num_ctxs);
> +	val = config->num_ctxs;
>  
> -/**
> - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> - * @gt: the &xe_gt struct instance
> - *
> - * This function is for VF use only.
> - *
> - * Return: The shift value; could be negative
> - */
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -
> -	return config->ggtt_shift;
> +	return val;
>  }
>  
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> @@ -1057,6 +1017,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>   */
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  {
> +	struct xe_tile_sriov_vf_selfconfig *tconfig =
> +		&gt_to_tile(gt)->sriov.vf.self_config;
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	char buf[10];
> @@ -1064,17 +1026,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
>  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> -		   config->ggtt_base,
> -		   config->ggtt_base + config->ggtt_size - 1);
> -
> -	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> +		   tconfig->ggtt_base,
> +		   tconfig->ggtt_base + tconfig->ggtt_size - 1);
>  
> -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> +	string_get_size(tconfig->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "GGTT size:\t%llu (%s)\n", tconfig->ggtt_size, buf);
>  
>  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> -		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> +		string_get_size(tconfig->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "LMEM size:\t%llu (%s)\n", tconfig->lmem_size, buf);
>  	}
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> @@ -1161,21 +1121,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> -	s64 shift;
>  	int err;
>  
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, true);
>  	if (err)
>  		return err;
>  
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			return err;
> -	}
> +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> @@ -1274,7 +1229,6 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>  		return -ENOMEM;
>  
>  	gt->sriov.vf.migration.scratch = buf;
> -	init_rwsem(&gt->sriov.vf.self_config.lock);
>  	spin_lock_init(&gt->sriov.vf.migration.lock);
>  	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0b0f2a30e67c..08568e68447d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>  void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  				 struct xe_uc_fw_version *wanted,
>  				 struct xe_uc_fw_version *found);
> -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> @@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index e753646debc4..1796d4caf62f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>  #define _XE_GT_SRIOV_VF_TYPES_H_
>  
> +#include <linux/rwsem.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include "xe_uc_fw_types.h"
> @@ -14,12 +15,6 @@
>   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_gt_sriov_vf_selfconfig {
> -	/** @ggtt_base: assigned base offset of the GGTT region. */
> -	u64 ggtt_base;
> -	/** @ggtt_size: assigned size of the GGTT region. */
> -	u64 ggtt_size;

maybe we can keep GGTT base/size at the GT level, as this is still
a valid data that we get from the GuC, and the base/size at the
Tile-level would be just what we actually use/setup?

in theory both (or rather all 3 is some cases) should be always the same,
but you never know ...

> -	/** @ggtt_shift: difference in ggtt_base on last migration */
> -	s64 ggtt_shift;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;

and this one should then either be removed or keep it like proposed above

>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..c016a11b6ab1 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> -	err = xe_gt_sriov_vf_query_config(gt);
> +	err = xe_gt_sriov_vf_query_config(gt, false);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index f221dbed16f0..074981e2ef07 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -9,7 +9,6 @@
>  
>  #include "xe_assert.h"
>  #include "xe_ggtt.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_vf.h"
> @@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)

nit: if it's static then no need for "xe_tile_sriov" prefix

	vf_balloon_ggtt_locked()

>  {
> -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> +	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> +	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
>  	struct xe_device *xe = tile_to_xe(tile);
>  	u64 wopcm = xe_wopcm_size(xe);
>  	u64 start, end;
> @@ -244,11 +243,30 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
>  {
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	mutex_lock(&ggtt->lock);
> +	lockdep_assert_held(&ggtt->lock);
>  
>  	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
>  	xe_ggtt_shift_nodes_locked(ggtt, shift);
>  	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +}
>  
> -	mutex_unlock(&ggtt->lock);
> +/**
> + * xe_tile_sriov_vf_lmem - VF LMEM configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the LMEM assigned to VF.
> + */
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +	u64 val;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +

drop this sep line

> +	xe_tile_assert(tile, config->lmem_size);

or rather move it here
> +	val = config->lmem_size;
> +
> +	return val;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 93eb043171e8..54e7f2a5c4e4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -11,8 +11,8 @@
>  struct xe_tile;
>  
>  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> new file mode 100644
> index 000000000000..140717f81d8f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
> +#define _XE_TILE_SRIOV_VF_TYPES_H_
> +
> +#include <linux/mutex.h>

not needed

> +
> +/**
> + * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> + */
> +struct xe_tile_sriov_vf_selfconfig {
> +	/** @ggtt_base: assigned base offset of the GGTT region. */
> +	u64 ggtt_base;
> +	/** @ggtt_size: assigned size of the GGTT region. */
> +	u64 ggtt_size;
> +	/** @lmem_size: assigned size of the LMEM. */
> +	u64 lmem_size;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index b44ebf50fedb..bc471e3dd494 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -16,10 +16,10 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
> @@ -237,9 +237,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		offset = 0;
>  		for_each_tile(t, xe, id)
>  			for_each_if(t->id < tile->id)
> -				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> +				offset += xe_tile_sriov_vf_lmem(t);
>  
> -		*tile_size = xe_gt_sriov_vf_lmem(gt);
> +		*tile_size = xe_tile_sriov_vf_lmem(tile);
>  		*vram_size = *tile_size;
>  		*tile_offset = offset;
>  

