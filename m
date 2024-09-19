Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94695CAC5B5
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 12:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FFC10E1DC;
	Thu, 19 Sep 2024 12:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvQOBh61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4A910E6D7
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726749183; x=1758285183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JvJEU5M/+c+VoHzK5PXnLcTyuMF5y6jjhf13a+GL7Yw=;
 b=RvQOBh61ox1m/Ktk6WLoGf9QmkVSzEh1WZTaQ+AFFvG+xTE/ZVEgZ8K/
 yqyokcflObFMeZkhC32dNp7MlpIMudHSsiajoAOU1ri6pyH/nP4pDObdb
 /yOYh3gjcuqbeB7PTSf1/c9m8qpiKA3GNbpY8dRL7YpYjtsKr+5/hs9xc
 R9/zDNy6jV3ZGVxeBhgNrqW/MyMaK/EwEWOAcNSXsjMbSTSGydndRZjCL
 fdyCu+LC6lrZXOPYrWSk39KSXa+BUTg4RQzPjrAPhS763T5qPpJrZoRKX
 5N2r28rzAW5/rSm1e+yMyzWvX1ZefR9RTPVHjFqU5LEP4yWlpBb/KhRGX A==;
X-CSE-ConnectionGUID: 7RUPzJA3RRycgtlD63zydg==
X-CSE-MsgGUID: Lb55NNfwSdiDFYpM7A192w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25851760"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25851760"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 05:33:03 -0700
X-CSE-ConnectionGUID: dnnVIOriQTiFO9rTdN0ljQ==
X-CSE-MsgGUID: 67wURa64RXSwTcbHs0TRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="69812991"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 05:33:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 05:33:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 05:33:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 05:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gF04c/D7Jkqko23bbTLAlseZWKdL1Lfhlf7S+YN6UwUCYWnrSLogoSHUYXb6Xq/qBmNCEE10cOfyIqg1Q85Oflhj4+8D26R6prD4eIz78E1iUZD0UahzSZRJLY9fUQAsEgM1XZRkLL5biFW74egnZjDcdQGL4qAeyC+ezlKxi+b52s3jIVehagJEH8QgUF+LxJ7vCqksR+SDkTWXxdRK/1D3CoAXHXioHcJ0fiTZlXqI+4yOlJRnEbT8o4kyAU4MjvouI0aeGjehjHB7P1O5p5+04QBwVy+PM5dYV7RVP9bpMkoHgiDTR0+WqCwaY3SB7chM5Tl0fcWlGCw7Razp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9J7ci0ItscPzIzucMD9M18gV2ODUzqhJrWtPmAJZ1A=;
 b=PZ3+e4iX6SUNdqORTK3Winx77C8zxSGkVsjtbBrTlG5D7+MCzVLsW2RpvULFB6LF2SnNUVisn/O7XfRTHyhHNwLVT+8NOLy+g8QBaWWKWp76qp7aIx3AZcOmv3wDUa2ZuFUChHCnReDOobCKJxH7oXX9Ohz2hsRp1Du81JUnNSAi7smOm1ip7pEKbjHMRDVRlqjlf/uxzaOVxYLDKMYI3a5ah8ktc12BQNrR9Q3L1uStwT8mrMw/2dsAZFpOTlI4d6iuyYRljlYHrrToXRVKMJ3DdEhu/fakJpWe1a4R17KcvdUMiA9vBvqJRYDsRVl0erBK3MCMnmHqQgKA4frT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 12:32:59 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 12:32:59 +0000
Message-ID: <276dee6b-4d2d-4ed2-b141-76b311dd269a@intel.com>
Date: Thu, 19 Sep 2024 18:02:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Jani Nikula <jani.nikula@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
 <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com> <87v7ytbf9y.fsf@intel.com>
 <de0252d3-2af4-4abe-b4a6-f188b8062221@intel.com> <87a5g3an93.fsf@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87a5g3an93.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: b0357aaa-2b6c-4fab-67c0-08dcd8a73229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2tLN3ZHUmJqOFhwcFE1WmZHVUdnbXJwaitNVkxPZTE2SlhWNkxHWjNvWFhP?=
 =?utf-8?B?Smc5eGFMUDlvUGhzQzBmeERpa1dBaGJKellSY1MzSkNNZXZhZEZFbURFM2tK?=
 =?utf-8?B?TEtLcndPS090aTc0dWg4QkZlb0lUOVVsOGhnR1d1alVidnRPbklNNVpSQmlm?=
 =?utf-8?B?d0cyUit3bTNoUmRFU1Q5TG9NTmxydEowdnAvazFiTjZMTmtMaTZnL295WlAz?=
 =?utf-8?B?bzdGdVBxRkRKcjE2WS91M2IvQXdWNE9TOC9TbUNsVlJKbU40Ty9FRndwa05o?=
 =?utf-8?B?aGFhR0l4Vmh5ZXB1MkY4ejBQbHhReG05Rnhybkw5d0RtK2UyNExjMlpJYXV4?=
 =?utf-8?B?MldRbFZiTFpyTFFoT3FvUEZiT09mejlkRUdhMEdFZXovbVRXQmhDN3F3Q3d2?=
 =?utf-8?B?M1VmQ2VpZitxZld3QUhUdGxsN1IvQ3BBc2hoZ0V6SklUcEI4UUdUSU1oTHN5?=
 =?utf-8?B?R3pxTzR2QUVzWWlFOUlrQmdKRitmdmcrN21MbXNxY1RzVWJwWHIvTlhVdGdP?=
 =?utf-8?B?WXlGUzl3eVJoUXBWYWhoUGhyc29pU280cWpwM09MMjlwdTRlT3lVam5CWS8y?=
 =?utf-8?B?R1FOajdrSFVVZTJBckVKNmF5WkR2MWlRelB6YjNWeC9wSDFSMVh2RTBNOUh4?=
 =?utf-8?B?eUlsTFd2eFpXdng2ZmJjOVRhQkJ1N3RCUzNnME9POUtTTTRhZ2hNNkdDejBP?=
 =?utf-8?B?aVR0STNONlplNXdBYjd0c0VrK1d0bjh5dU9rOG5PVFpQeFdER1lLOGc0eU1i?=
 =?utf-8?B?dFJmYUs3RWdIcGRzaFZNcGpyRjFWbjlVK2s0cGJ6bC9MaHFvVUhPVC9ZNVJP?=
 =?utf-8?B?L0xLTXByRnZXeGZlOHhrZ1ZVNDFBU3VHYW0wTnA3WjNwaTlUV29IZFRYVXgx?=
 =?utf-8?B?ZWlhKzRoTVdYN3BwLytKRkFHTy9vSE4wSU9tSGMrTkpTT29Qc011YUQvVVpn?=
 =?utf-8?B?Q1A4VG96UGZmcEoxdi8zTDZnRW12b2ZpaWdUVjdYQVpzdjFtOTJTbytKMU42?=
 =?utf-8?B?aWhsbmREWkVMOXMxUk9OdWd0U2N3dmt0TVFnZWNvWkNTb1RuNEp4YmZOUjhE?=
 =?utf-8?B?U2prWnBRbG5ScmJLYmJVR09aVG1MNWhRdlVsYnVpRzJCODJwODMxYnRDOGZH?=
 =?utf-8?B?TUwrZHR1TmpKK2I4R21aTElpbS9WcEhGRjBnTGdhM3VNYXVWOVh4UE9CcUZV?=
 =?utf-8?B?RUx2Ni9BOElBS2plUXNrRjBnRFRhRkJWa0xzVGpPUU1ncHBENFNGVDdmc2Er?=
 =?utf-8?B?SmYxRVIxeDVGeFhXclFwdUhENWFtR3VNQTNBZ29oNVBLVnl5ZTJCblpTQUJQ?=
 =?utf-8?B?bXhORkE1WlBmTkNGQ2Y5cklsdUU5Y3FZNUErbldtYXZFTm51LzByQ0RkVGJT?=
 =?utf-8?B?ZXZhTHV3L3NEOGpIa0IxZXVXc1FEQ2JkR0lSa3MvdHlpOUIrUURGQWdaQXJx?=
 =?utf-8?B?UHdTd0NQQTJJYWpnaGlYamVWV3NUZ09pQnd0TVNoeDMzVWczUDZMeWg4UWVO?=
 =?utf-8?B?WFNPL2lVMi9zRk1XTlRFcFNhUnBzU0lCZHJ5d1k2YXFIN3lzbVpLN0Z2YUcy?=
 =?utf-8?B?UVk1bzFGaWRTYk9xNWJ4NnlyVU1teWR2cEFudnVzSDFxenVDOTJMT3dpYjJ3?=
 =?utf-8?B?cGt5Z1phRkYxVFBqNjRISmJqU2w4UVBMYzloWHA4a3hJb2F4SmVnWDBGLzlr?=
 =?utf-8?B?YklGSjRoT3dVRmNTaXE0eXJHYVZEdTVIaklTMzdOY2NGc3BveXRUZzltWDkv?=
 =?utf-8?B?b01Memp3VkJFSGdRcEZUMHNTYllyenZ1MWxFVzkwaUZ4RXJvVVJ6dkpYaE13?=
 =?utf-8?Q?2YrrA+oEFl3PBpgn87B0Zo2q4dUUAJ55i3ouw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmhsakpkRnQ2dEVXL0NxY3daaWFaNm00c0Q5eGJaOVhSRjZSd0VJNDVTRXBv?=
 =?utf-8?B?WmJ3WVY4d2ZZMEUweUx6VGc3cjJOSEhQYTNGdWdsdjNjd1dSbDZPVWpLRkNG?=
 =?utf-8?B?OXg0cG1DU1A3b0E1Z2Z0clhVejl1TDRBUFg4ZTlWSXovU1lmR1k1RHVhdWFp?=
 =?utf-8?B?QkdCRURHc1hrckc2dEk1WkJWOGFBRGZJT3dRd3BMeDU0WFJUOWt1NTlKMmE4?=
 =?utf-8?B?d0ZhcTRMZWQxNExVRmR3NE95NU50d1Uwa1ZpZE43TVNwMTJxL0UrbVJPM3Bt?=
 =?utf-8?B?M2ZrdWc3cnhLQkFtbmVNZG9PeTMzeDBrVjNYRWxpQjBDeHFHdFhBb3VTeEta?=
 =?utf-8?B?OGgzRVp0L0Z5NnRoNitUTm9DMWU2OHJjd3VaT2lJS0h1cjhKa0kxcXJuUzdT?=
 =?utf-8?B?KzZhNXdKQlk4YlIxbkRoSlh3V1B2UVAyaTJGVFRRYkNIY3E5RG5UOXcxS2k2?=
 =?utf-8?B?QnhtTzRVYnZiSGRDZzQ1bGNPbFhNNHZ5OXVscXhreFdmaUVEYlU4VmV2REtK?=
 =?utf-8?B?MnFQaWI3MGliaDdaeWdQSFpaRjNneHJ0SDFKVVE2bnVpRE5XOEpvTzJSN0ls?=
 =?utf-8?B?V0RlSnZzZEhwSDVkaVlHZlZOUkZjSDB0dXd3T1FDaEZwRU52OERSZ2NWaW4v?=
 =?utf-8?B?NXFWcGpPWHBLZmo1eklCejNYMHRXN3lWRmlsZ0F0WTVzQlVQY3ErWFVyMzNK?=
 =?utf-8?B?K0FxWForajZFRndUcUVvM3VkTFNEaTEvUHU1N21SU1I5NWthOUxvc25QNUZD?=
 =?utf-8?B?SG8rbSt2Sk5VUFpNelpHSlpOQXY3OUpETWU4SldIc3BKU1l3TWNreGNuSDBt?=
 =?utf-8?B?VTNQSnVqbm92VFRxdUhmNmdSRWo5cHBxTTdKdnZ6Z2lhSEtaZXNyU2trSXNW?=
 =?utf-8?B?NXE4Z2FOaDhUbWxKUnZVOVpxN1dtUEo1UkduZTUyaFJNdER1cVhlRGFPOGtN?=
 =?utf-8?B?MVBjYW00cWo0YWwrekpnb0lGWUhrbkpsUEs5UlhWN0RCbEhORndlT3gyYmFV?=
 =?utf-8?B?QkVoWW1QcGU4bTZBdVVjUUw0VnRUWmlGeklKb040dTc3ejBKTmdqS1doNWZr?=
 =?utf-8?B?WGxCQmNMcjl5dThHMVhFSEp0SGlLMjhvNXROTWF0VWNrL1NnaU1lZnVOTXFv?=
 =?utf-8?B?bkRZUS9vYU9vbzZXUjhLTituMy85eVM5UmVtVmdyRnNUM3lRY0tsTUR5M2FK?=
 =?utf-8?B?WUcwQm1kb3h6cHlTcmJwejZjWXBQblhqNUR0U0dFM2h2b3l2QnZVUFI2NEkv?=
 =?utf-8?B?eTk0Z1VERjZRM00vRDdYS2VOckpoS1RLbzJIUG9mVUJ1Q0VEMmlHOW05ejNx?=
 =?utf-8?B?M1JvbnZRdjNCZjBEVDhJSmFXRG1PYkx5dU5NUkNPcHZkRlM0MGhDMmdjYjFE?=
 =?utf-8?B?Vk1VRTFzUVhheExDaGd4NG5rcHRaV1NqWWhXN0VtVzBCR1dTZ25hVFRzSDV4?=
 =?utf-8?B?WTJPUW9QaVh2R2o0clRYOExadWxzT2t4T2krZkZ0QzhVbll1WDBkT1EwTjFw?=
 =?utf-8?B?WHlUV0lzaXBzNGJ6ZlRpOVRSQmJ1dU5LQTBqRytkYUIxWnBaSklTSVM2aE9U?=
 =?utf-8?B?cmExbDhhTjh4aG80NkRtWkV3akZaK2RNVkVQRjZLQklZWWtyOFlFVllEbDVH?=
 =?utf-8?B?b1QveWVScWFUZmhybEh0SkliRGZtL3dXSzZiUnBtbWkvMVJleDBIb3J3dDJ6?=
 =?utf-8?B?T2djVjI0dXlUTG5hSlVvYkhMWW5GaGszSTZjTVJIcC9MTUViNXdpTHNQbzJw?=
 =?utf-8?B?bHZaT0NVU3dBcUt6OVZBK0JIaU1zNVF0d08xeW5zSnB1cVUzZytDL3lWbXlj?=
 =?utf-8?B?Rjk5V2JzNUJNMlhISlFXTVU0Sjg2S0JVOXA1dTFTN05RbGhUWStMVmlpcEhG?=
 =?utf-8?B?OFRRZjZoOWw2bFVhcEpxN3d3c09QQnRCSi9zMlFEck1CYUVTekovcngvaVZi?=
 =?utf-8?B?N2E4S09RbDNmTnBSSTcvR3I5V3lEbjRoblNqWm9jaU9KQmlydHMyamJLM1ZD?=
 =?utf-8?B?Z0RDWjBPZ1dHVjB6YkhGRWppQTNodzVkemp1NXhnZTRhczNyQTlPY2xwWFNu?=
 =?utf-8?B?RllPTnZzUEwybzNkSWphRmcwaFVFb1RDZ3Q4ZnNuL1N3Qmp5UnpFR2tTZ3hV?=
 =?utf-8?Q?Knzwk7P3IelZPqDBC+tAPr/WI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0357aaa-2b6c-4fab-67c0-08dcd8a73229
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:32:59.5598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7evrFzJkRm6LrHw/1tcb2mLl/5UVgdn7nug0HydKndVhdCpW+1lmJXqrBkFjbPrzSJjIcM2fzMGW79L2/Xrxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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



On 19-09-2024 17:06, Jani Nikula wrote:
> On Thu, 19 Sep 2024, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
>> On 18-09-2024 12:49, Jani Nikula wrote:
>>> On Wed, 18 Sep 2024, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:
>>>> On 18-09-2024 00:20, Matthew Brost wrote:
>>>>> On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
>>>>>> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
>>>>>>> Agreed implementation/usage will be same, will use explicit type for
>>>>>>> clarity.
>>>>>>> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
>>>>>>> typedef unsigned long xe_wakeref_t;
>>>>>>
>>>>>> I agree with this.
>>>>>>
>>>>>
>>>>> What? Really? I thought it was pretty clear rule in kernel programing
>>>>> not use typedefs [1]. Reading through conditions acceptable and I don't
>>>>> use anything applies to this series, maybe a) applies but not really
>>>>> convinced. The example in a) is a pte_t which can likely change based on
>>>>> platform target whereas here we only have one target and see no reason
>>>>> this needs to be opaque.
>>>>>
>>>>> Matt
>>>>>
>>>>> [1] https://www.kernel.org/doc/html/v4.14/process/coding-style.html#typedefs
>>>>
>>>>
>>>> While running checkpatch on my changes, patchwork had also issued a
>>>> WARNING: NEW_TYPEDEFS: do not add new typedefs. I reviewed the usage in
>>>> the Linux kernel tree and found it used in many places, which led me to
>>>> assume it was safe. I now realize that I should have been more careful
>>>> in understanding the context of its usage and referred to the kernel
>>>> coding guidelines. This was an oversight on my part.
>>>>
>>>> Since this doesn’t impact the CI or runtime, I will avoid reverting to
>>>> unsigned int immediately and will hold off until I receive the other
>>>> review comments. I will incorporate the changes to revert it in
>>>> subsequent versions while also addressing the other review comments.
>>>> Thank you for bringing this to the attention.
>>>
>>> If you end up replicating intel_wakeref_t from i915, and go as deep as
>>> the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
>>> disguised as an unsigned long. It's a struct ref_tracker * when you have
>>> certain configs enabled.
>>>
>>> You could just use struct ref_tracker * everywhere. It's an opaque type
>>> to start with.
>>
>> The original idea of using typedef for the fw return mask was for the
>> sake of clarity. However, Matt B pointed that the use of typedef in this
>> instance is not in accordance with the Linux kernel coding standards.
>> Additionally, I agree with Matt B that there is no need for the fw
>> return mask to be opaque; therefore, it is preferable to maintain the
>> use of unsigned int.
> 
> I'm not sure it's a hot idea to explicitly state that the return value
> is a domain mask. The callers shouldn't need to care, should they?
> 
> For example:
> 
>   +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   +	if (fw_ref != XE_FORCEWAKE_ALL) {
> 
> Under what conditions do you expect this to happen? Shouldn't

If any of the requested domain is not refcounted (not awake) above 
condition will happen.

> xe_force_wake_get() flag cases where it couldn't deliver what you asked?

Internally xe_force_wake_get prints drm_notice when requested domain set 
ack times out. In the driver currently caller is sometime returning 
there is domain ack failure.

usage: where XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL) is used, which looks 
redundant to me it can be moved inside xe_force_wake_get.

case a)
	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
	XE_WARN_ON(fw_ref != XE_FORCEWAKE_ALL)

	//Here caller doesn't bother about all the domains are awake and 	continues
	func_b()
	
	xe_force_wake_put((gt_to_fw(gt), fw_ref); // Puts only domains awake by 
xe_force_wake_get.

case b)
	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
	if(fw_ref != XE_FORCEWAKE_ALL) {
		xe_force_wake_put((gt_to_fw(gt), fw_ref); // Puts only domains awake 
by xe_force_wake_get.
		return -ETIMEDOUT;
	}

	func_b()
	
	xe_force_wake_put((gt_to_fw(gt), fw_ref);


As of now driver have both usages and this patch series caters both.
	
Regards,
Badal

> 
> BR,
> Jani.
> 
> 

