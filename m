Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F1FC3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 15:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964E510E3A9;
	Mon, 16 Sep 2024 15:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlOTaHVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC010E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726500026; x=1758036026;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kIwb3U7J5NUVnwePykqOKtfpQwPtCkGkQboRQaVZ+fg=;
 b=VlOTaHVHJP2KPhWrR4Nhk4Z9jWqNTiBGwk7ayyS2pDyCwRjUH5U1y60i
 bbxKW2q6UzubgbkpA0jUMvdaOegueGTLux0+71hFGOv1Asf/Pjs7gJ8xe
 gnHJaFx3J6IU2F3DM0obF6h9/bkMwAG55FZQJLOcFVyO3TxRmqWDceR0R
 Q7ylyJagvKrtJCszuu26mX/WQ+IrobTnOrVN+mU74b80hKdE9ibc0CL2I
 9qWhtVBySgtnUtnEBOeFtFmtSic4iVHm7bgrmi0Ki+H2rNBAwzaWChALp
 Fc5N0AKRrMzxZ99osMIwYxUS9eQizImno6z68ixbM7+oQg+7ZQEsIeoDj A==;
X-CSE-ConnectionGUID: U+TC6HLRRfa2dB2ko2xHQA==
X-CSE-MsgGUID: VYROVsUMQVCzY0EeiFxArA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29228243"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="29228243"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 08:20:25 -0700
X-CSE-ConnectionGUID: G5sQ7/IjSBayttkYuY0ClA==
X-CSE-MsgGUID: Z+L+N2D/SU677QrKAYXwOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69202769"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 08:20:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 08:20:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 08:20:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 08:20:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 08:20:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPETUvkaMMFDvgff8J58jFp3hzQ5GKtA7AhpYwzm+KKeC6EN9Jm8RVbzAy2kxsOlne+AWxwVRLFQUFXPbp/1rTMq5c16DxM5LvLixSykRGQch3w3iYM/AyuTDN53ewkl2UxDH6uxIP0+yB3NhvdOv6OUq3Yk8QWi1DnpwspF0c3Q2EPumlq53xfCLcImqktttxpVQ8N3dRxZLWGx8W5rkNp27zpOyUjN0AnL+WeXK580vJ083crBtMCImH3sZHZ5jpyIkshlRA+Pus48D5h5FwY7DkwLxnqx/nSMRp26Z+B6/tA3qoq3MIE6TyFhNJ193GIaG6O9G42ZH2u4kaSP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUzL0VLLJiBKBeqm7Fd5c+NJoLatbbSnFVXoMGRCMJg=;
 b=Ed3p6bDRMIxFVIuIrUXWyaKxsk2mxr0yZl6wV3+QWHCBwd/FfaERyk/EENgQIrHgT3GRksEpVYg+Wm0Hsqv+omcpaOlckeLtlNGTCq7+wKXI91KAXMsWK2xa3iJYRRJYu+NvzKW7s2EG2wyXPSn1EmDtOXcw24sBNhl4UoxG/q1FN00h+dmc9LJxL2qdIE4WUiNGql1eDSO/S/MyWBKMwdxd53XS5YCK2CQSs4BBo5PQeOvCOy6sRiSsExNFktFEe5IiWg9b3GGjyrRIX29wIv2Rq0CFbFEhQ/K8n54O8d5a8byJ/fQJZcSCA8AymuHaZHjALJ3FIECTukKSldw2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 15:20:20 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 15:20:20 +0000
Date: Mon, 16 Sep 2024 11:20:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v13 4/4] drm/xe/vsec: Support BMG devices
Message-ID: <ZuhMsD82tec8YPpy@intel.com>
References: <20240912184210.914612-1-michael.j.ruhl@intel.com>
 <20240912184210.914612-5-michael.j.ruhl@intel.com>
 <d6baown7x4de6ysyjkwp6dacwcknqmfcasp63hszhhehp7hqrm@2eg7q6gng3zu>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6baown7x4de6ysyjkwp6dacwcknqmfcasp63hszhhehp7hqrm@2eg7q6gng3zu>
X-ClientProxiedBy: MW4PR04CA0212.namprd04.prod.outlook.com
 (2603:10b6:303:87::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: f21b103f-76a2-44ee-a95e-08dcd6631391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDExV1hGVFJsQnBMWmFscTNwOURVSkJlSXVIMUdmbzc0MDR6MVAyU2NSNmty?=
 =?utf-8?B?Q2hodHptd1d2WWl4aHNyUk1VcTVKWlM5aWNRQXM2Wkh0TTVQL3h2WFdrNGVk?=
 =?utf-8?B?TVpnVU5Vejl4ZUJhTVp3REJnTDU4VTJFMFZzYzZNRUR5clEzdXl3elFINVB2?=
 =?utf-8?B?eWZneWFsZC8zdFBkRkFoam1BNWdIUkM4SE05S242WDQvcmk4eUxQamhTNXFT?=
 =?utf-8?B?eFUyQUM0ekc0RXZCUXVSMGVENm5xZjhDcWVCMGRLN1VJb2EzZ0s0bWVoclBD?=
 =?utf-8?B?MzBOU0lkcDVJOCtISlcxd2xRcFlSdDhvczJic2l0RkVTVWpvK1RoMDcwaHFQ?=
 =?utf-8?B?aGsrWmtnNTJubWRzZFhRNkNZbXVuZEJzQnpDNk15RHlYNUxkMmRSLzYrVzRt?=
 =?utf-8?B?cGJtTlN2Q1BYK0NPVmhNOHA3dWlaamZoY1dyVWNNVUNoK2gvSG8xVzYzei9G?=
 =?utf-8?B?TkN4ang3ckhrZWs3RWV2RkVEN2Z4MVc2eStUUmYzcGN4bEVrc1RDSXV2Ukg3?=
 =?utf-8?B?T1pSclZid3NBZzRvNG9tR2xNUjZMNUhEbkJrUUNleUtKQlhTbXNiUklHeGhI?=
 =?utf-8?B?TWZQRURsaHZOVzhzMEhnTEdISUVyd21tT29meE1KNkpkTTJVR1dDZElZT3ZQ?=
 =?utf-8?B?VXdMZ3p5d05IS216bjVFVitxQXVLTXFmaHJrdlphaUl4c1NqSzVyOHFrRTNQ?=
 =?utf-8?B?K1UvZWk2N2kxOWgvRVkzdlY5R0RRZ1lPb3FlYmFHT3AvdEZ5Rno1VG9naitw?=
 =?utf-8?B?Qk1XOVB3aENiZDQwdmxTcGNQOHFLbjJVeDMvYW9xR1R0cWdIcmVIODl1NnYv?=
 =?utf-8?B?Z2NpaWZ0c1VGanV6UitMdS9jcWl3bXVYTGY5OHhzUW5ZZTYyeG1nQlYwcDdz?=
 =?utf-8?B?cW1jc050c1V3Nm51U1NlbXpWbkV4cjNkdlhockVhU0NwcE9PbGVCSUh3WThF?=
 =?utf-8?B?eWdOYXh1bGVqdk0yYVNRVmRFQ3ZzaHlwZkV3REtiN1hTUHIvQlFKd2RFb3VI?=
 =?utf-8?B?dzRINFlIekFmSzlZb0YyYk95NS9TVnZYT3lGdnZrYkUyTXhqdndhZTRvMk1B?=
 =?utf-8?B?cWJ1VWFISE9RUnlMUUdPK0ZyL1hwRmptdjZlblQ0WDh1SFo4U1p0Zy9ZeDdi?=
 =?utf-8?B?TWtFL3g1Rk1rSTlpMzU2aTJ5MFZmdEFZMktpOUJTSzBaVzFORk51Vi9YRHhR?=
 =?utf-8?B?WlNSZngxckZCNUdEeUdRb3RXMFFlYVNyNEorOFliZkhmVW1HbHJPenh4VDFX?=
 =?utf-8?B?bkdwcXR1eFV1bVlxNmFwUlIvS25CeHVGZVF1dXdZL2lXckVwdCt0YjJiL282?=
 =?utf-8?B?aDQzaUx1TmwzSVdqQTc1MmN4QzNhTGNqeUFmQWg4bHl6UlQrYit4M29DOUc1?=
 =?utf-8?B?eUFibEVOM3htVytmT2svcUFHbk1pcVd6L1c3NlR2QUhRY2RsQmR0czJhUHVp?=
 =?utf-8?B?MFJiRkxvMmJ0YWl2ajJzM2pnTjNROHdsZC9ETytzbXkzSEZXa1V1NjI4L0I1?=
 =?utf-8?B?WkVUVjcrY2FaZjRuZGtLUS9SQms4OXRIZHJWdnpFNGRXYjQyTXFISGdoYk1v?=
 =?utf-8?B?cWJDN09GNHVnWjdsQlpxZWxwSnBVYTdHcmVoZSt3c0xCTEQ4bGxUdElVcjhj?=
 =?utf-8?B?Zlk3S2t6QlVCZmMwNE9oNFRKci8vWHZSSElvVTdSQUtBZmRDUFVUekNxeWZK?=
 =?utf-8?B?Qi8yMnh6UzRwVEpXdW5ib2U4aFloOWNPdW9KV1hvUUVOTGhoQXI3UERPV0Zm?=
 =?utf-8?B?Z2FnV3BySkhQSUdBODg2c2swKzcrTUJMRDVSbitzVjcwbXNBUitiU0JtLy9O?=
 =?utf-8?B?UXA1VUd0bVBZNW9EYkpoUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW4xYnU0THNCWWFTd2JLREJXcWQvSEpiSzdONTdBZ0FxM1poWk5yUWF3V1NI?=
 =?utf-8?B?cHpYaC9reHZBa0JRZ21RbkIrYXFTaFpiRXA4d2MydXh4eGxlYS96OXJYRkF4?=
 =?utf-8?B?eUJOdWs3MU1PRVpOZVhXVHRDZXBQSGZPNmZSazlXUUEwT1pwajZFcUVmUlpO?=
 =?utf-8?B?bjRqOG9EUWRnSDB5VlNtelFmdm9QbGpxZituZ3pmb3BSWFhUbDV6TDRvc0pO?=
 =?utf-8?B?Tjk2Y1crVG0xMk55TTBpSytmc0ZXTlI0a0ZDdTA1WG9hNVZPTmd1K0s5YlBC?=
 =?utf-8?B?dVdKZUNCMU9Ya25hSHRtaHgrNy80dGJmS1FvUmZUWExpSkIwTnNWQlNoa0Zw?=
 =?utf-8?B?MDc5aDYyb2c5ZFRYTUFkV0RwUUZ0ZmM4WmNxMkcyNWR2UUlKOXZQRnIzS040?=
 =?utf-8?B?eEkveGxTVUdXdHRQdWRhaXFsbDFwOXd6ZnZXRTZIMllIN2szOE9uWnR1YndD?=
 =?utf-8?B?VHFXd2ZyWnBJSEtkak51OFNMaW9KQWdQNTd0dE5CMFVySk5zbUttUlpUM243?=
 =?utf-8?B?NDJRNlVrU0czQ1YyajVZYnVBNUNHSkttemxnSFZRZ1JiQkR6bFpPSk5pUWs4?=
 =?utf-8?B?K05JVjg5cTdhWFhpSEp3dkd0NC9MajZZODB0ZHgvQS9GMFFnUXNacjNqcDNw?=
 =?utf-8?B?LzVtUktaR1M5b3lHcVlJb3krNFBtNVlVbURZbEhTdU9DRXFpODVTOHdkTFZC?=
 =?utf-8?B?MlRabWJXR2Q5RGl6b3lodGZpZWRVY1VxbGd5M3l0YU5jd2pqdFVOeVh5MklL?=
 =?utf-8?B?Smc5RmV0djNJUFhHWnZsVTBDNms2N3JuMVdUS3IvalIrTDhvRGtMU2tFQlA5?=
 =?utf-8?B?QnlnaGtsK00xY2VHVHFrQStjY01WeXFYbEpraXBuRVFFd3FOTnZiQjdBdGx3?=
 =?utf-8?B?N0oxRE5rNm93RStSa1R5RE5oQkFIaWJSVGlvbmVpMW40WUVPVFVDM2JXVTla?=
 =?utf-8?B?Qisyek1hMC90ZEtDYk9UMWw2ZzBLWllRMmt4ZWY1VUdkaXFzenpwb2R5VWNV?=
 =?utf-8?B?ZmFzNiszdU5xOStoT1lreVV1b1dEa3g3NTFYcHF2SFNlV3ZxcDc3QWFzUzJ6?=
 =?utf-8?B?U3dEdWhvOEkrbThINnVrOWdMeEx6bndwVWtNU3NKR3pnM2lGRWtvTGpQUGkx?=
 =?utf-8?B?N3E4aUhWS3BxZXo5MlUzZ0JNeWlxMHU2RVg4MmlBNWFQdG5LQVFnK3MzRWxF?=
 =?utf-8?B?UnFDajZkMURmK0EwR2o3MnE0OHlzV2hZcnR2aWpLNi9TRTZIQ1JLQmtuUnUz?=
 =?utf-8?B?ZDZFaStnOTQ4U2dXalFaQ002WWZBSEZLdHd2UzZSQ3F0eDRsVVlKSlZ0Z0Y2?=
 =?utf-8?B?TWpuQWhmUWZLdTdXNzBpNVg4NG1sNStsc0sraDVZcmwzNGd1dFF6ZHNWRzVJ?=
 =?utf-8?B?a3VnZVllUHVEODlsbWM4L1ZleVZOY254MmpHWHc5SFR0VUNFbHZMRTFRdjB1?=
 =?utf-8?B?cytGRUo2RlNpTXdmRFVRWlNkYzdnTUUrL3F1S1RIczFEMkVEekFlSXlMWDVu?=
 =?utf-8?B?RWFCRGxKOUd0Z3E3M25OSDBxOHAzNWdYa21nZHl3dUxTQU1BcC9kekREdWdE?=
 =?utf-8?B?bHIxdEo4anZCSDd3Rm90N1hOSzZFU1l4TXB1VkRYdGdOK01sNVYwSVNmWk9Y?=
 =?utf-8?B?ZGROSTJ0bkYxL2F3UUI2d2gvTUdTWGRnZTVSWHlLZUx1YkpON2IzMDRMcTc4?=
 =?utf-8?B?R2E5b3ZqcU5OYlFSVGNSVFNkT1JHaWc0cnE4SFFGUHJTRXNQMUVVNU9zc2di?=
 =?utf-8?B?VzRsN3FjTDEvOHVMYzl2Y0tuN0FCaDlseVNVUGFNMTl6SmxpVzFkcHliVVB5?=
 =?utf-8?B?ekhQbWZRVDlNOXNYU2VrWUVUK3ZRVFdRKzBkNEZOQUNKL1hwazFncVF1Zkkz?=
 =?utf-8?B?L084QmFYT2ZsWlFMSnFHbDNZSDdaZEs0N2ZCMXpIdEdEd1JUQjRETDFBWGhU?=
 =?utf-8?B?Zk5uelAwM1c1TWJDT3VTTmkxVUhUa2JacUYwemhwSXRRUUFBaFQvMFFHUTdR?=
 =?utf-8?B?S1l6MDZaWmJnd2tWa0FyQ1JoSWZHcXloemxwdHM3NlJIYU5wVVUyVFEyemRC?=
 =?utf-8?B?UFhuS3JhUkxTaExhbm8wN3c3UGRXOGZoaEhMY2dIMGExQSszV1JSV2lBMm13?=
 =?utf-8?B?d0pNamRkaU0wZ1lUeHJlWlFIWnRuc0R2Zk12WjJ6azFRN3JObXF4SzBNKzcz?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f21b103f-76a2-44ee-a95e-08dcd6631391
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 15:20:20.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AZPC0V9l/tMjubBaPGwX6W1lq95WG5mcpkQ+XhERLNdGjGcmlFI3Fh5Mxf/qpQj+EjEoVridbzNzb9Zp+V0Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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

On Fri, Sep 13, 2024 at 07:01:56PM -0500, Lucas De Marchi wrote:
> I was looking at some possible way to split this so we could have it
> for 6.12, but I don't see a way. Even if this was 1 or 2 weeks ago, it'd
> be hard since the first 3 patches are going through the tree.
> 
> So... I think this will have to wait 6.12 to be backmerged in
> drm-xe-next. Cc'ing Rodrigo and Thomas to know if they see it
> differently.

I believe this could be added along with the vsec patches in the next
merge window.
I even had acked the patch to be there. But not sure if it was picked by
the vsec maintainers or not.

> 
> Some additional review below.
> 
> On Thu, Sep 12, 2024 at 02:42:09PM GMT, Michael J. Ruhl wrote:
> > The Battlemage (BMG) discrete graphics card supports
> > the Platform, Monitoring Technology (PMT) feature
> > directly on the primary PCI device.
> > 
> > Utilize the PMT callback API to add support for the BMG
> > devices.
> > 
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > ---
> > drivers/gpu/drm/xe/Makefile          |   1 +
> > drivers/gpu/drm/xe/xe_device.c       |   5 +
> > drivers/gpu/drm/xe/xe_device_types.h |   6 +
> > drivers/gpu/drm/xe/xe_vsec.c         | 223 +++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
> > 5 files changed, 248 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
> > create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index edfd812e0f41..ce4da2b30db3 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -109,6 +109,7 @@ xe-y += xe_bb.o \
> > 	xe_vm.o \
> > 	xe_vram.o \
> > 	xe_vram_freq.o \
> > +	xe_vsec.o \
> > 	xe_wait_user_fence.o \
> > 	xe_wa.o \
> > 	xe_wopcm.o
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 4d3c794f134c..c3edb0f36d05 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -54,6 +54,7 @@
> > #include "xe_ttm_sys_mgr.h"
> > #include "xe_vm.h"
> > #include "xe_vram.h"
> > +#include "xe_vsec.h"
> > #include "xe_wait_user_fence.h"
> > #include "xe_wa.h"
> > 
> > @@ -373,6 +374,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > 		goto err;
> > 	}
> > 
> > +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> > +
> > 	err = xe_display_create(xe);
> > 	if (WARN_ON(err))
> > 		goto err;
> > @@ -759,6 +762,8 @@ int xe_device_probe(struct xe_device *xe)
> > 	for_each_gt(gt, xe, id)
> > 		xe_gt_sanitize_freq(gt);
> > 
> > +	xe_vsec_init(xe);
> > +
> > 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> > 
> > err_fini_display:
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index c92df0a2423f..cf37af207210 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -487,6 +487,12 @@ struct xe_device {
> > 		struct mutex lock;
> > 	} d3cold;
> > 
> > +	/** @pmt: Support the PMT driver callback interface */
> > +	struct {
> > +		/** @pmt.lock: protect access for telemetry data */
> > +		struct mutex lock;
> > +	} pmt;
> > +
> > 	/**
> > 	 * @pm_callback_task: Track the active task that is running in either
> > 	 * the runtime_suspend or runtime_resume callbacks.
> > diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> > new file mode 100644
> > index 000000000000..1d82ef980b80
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vsec.c
> > @@ -0,0 +1,223 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright © 2022 - 2024 Intel Corporation
> 
> just 2024 should be fine.
> 
> > + */
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/intel_vsec.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pci.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_device_types.h"
> > +#include "xe_drv.h"
> > +#include "xe_mmio.h"
> > +#include "xe_platform_types.h"
> > +#include "xe_pm.h"
> > +#include "xe_vsec.h"
> > +
> > +#define SOC_BASE		0x280000
> > +
> > +#define BMG_PMT_BASE_OFFSET	0xDB000
> > +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE_OFFSET)
> > +
> > +#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
> > +#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
> > +
> > +#define BMG_DEVICE_ID 0xE2F8
> > +
> > +#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
> > +#define SG_REMAP_BITS		GENMASK(31, 24)
> 
> we should probably move these to regs/xe_soc.h or regs/xe_vsec.h or
> regs/xe_pmt.h. Then please follow the same format with added spaces for
> the bit definition.
> 
> I don't like the defines here since it's hidden and it's often accessing
> the register in a weird way.
> 
> 
> > +
> > +static struct intel_vsec_header bmg_telemetry = {
> 
> we prefer prefixes with the IP rather than the platform. Is it possible
> here?
> 
> > +	.length = 0x10,
> > +	.id = VSEC_ID_TELEMETRY,
> > +	.num_entries = 2,
> > +	.entry_size = 4,
> > +	.tbir = 0,
> > +	.offset = BMG_DISCOVERY_OFFSET,
> > +};
> > +
> > +static struct intel_vsec_header *bmg_capabilities[] = {
> > +	&bmg_telemetry,
> > +	NULL
> > +};
> > +
> > +enum xe_vsec {
> > +	XE_VSEC_UNKNOWN = 0,
> > +	XE_VSEC_BMG,
> > +};
> > +
> > +static struct intel_vsec_platform_info xe_vsec_info[] = {
> > +	[XE_VSEC_BMG] = {
> > +		.caps = VSEC_CAP_TELEMETRY,
> > +		.headers = bmg_capabilities,
> > +	},
> > +	{ }
> > +};
> > +
> > +/*
> > + * The GUID will have the following bits to decode:
> > + *
> > + * X(4bits) - {Telemetry space iteration number (0,1,..)}
> 
> what's the meaning of the X here and in the lines below?
> Maybe just document line by line below
> 
> > + * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> > + * X(4bits) - SOC_SKU
> > + * XXXX(16bits)– Device ID – changes for each down bin SKU’s
> > + * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
> > + * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
> > + */
> > +#define GUID_TELEM_ITERATION	GENMASK(3, 0)
> > +#define GUID_SEGMENT		GENMASK(7, 4)
> > +#define GUID_SOC_SKU		GENMASK(11, 8)
> > +#define GUID_DEVICE_ID		GENMASK(27, 12)
> > +#define GUID_CAP_TYPE		GENMASK(29, 28)
> > +#define GUID_RECORD_ID		GENMASK(31, 30)
> > +
> > +#define PUNIT_TELEMETRY_OFFSET		0x0200
> > +#define PUNIT_WATCHER_OFFSET		0x14A0
> > +#define OOBMSM_0_WATCHER_OFFSET		0x18D8
> > +#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
> > +
> > +enum record_id {
> > +	PUNIT,
> > +	OOBMSM_0,
> > +	OOBMSM_1,
> > +};
> > +
> > +enum capability {
> > +	CRASHLOG,
> > +	TELEMETRY,
> > +	WATCHER,
> > +};
> > +
> > +static int guid_decode(u32 guid, int *index, u32 *offset)
> > +{
> > +	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> > +	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
> > +	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
> > +
> > +	if (device_id != BMG_DEVICE_ID)
> > +		return -ENODEV;
> > +
> > +	if (cap_type > WATCHER)
> > +		return -EINVAL;
> > +
> > +	*offset = 0;
> > +
> > +	if (cap_type == CRASHLOG) {
> > +		*index = record_id == PUNIT ? 2 : 4;
> > +		return 0;
> > +	}
> > +
> > +	switch (record_id) {
> > +	case PUNIT:
> > +		*index = 0;
> > +		if (cap_type == TELEMETRY)
> > +			*offset = PUNIT_TELEMETRY_OFFSET;
> > +		else
> > +			*offset = PUNIT_WATCHER_OFFSET;
> > +		break;
> > +
> > +	case OOBMSM_0:
> > +		*index = 1;
> > +		if (cap_type == WATCHER)
> > +			*offset = OOBMSM_0_WATCHER_OFFSET;
> > +		break;
> > +
> > +	case OOBMSM_1:
> > +		*index = 1;
> > +		if (cap_type == TELEMETRY)
> > +			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, u32 count)
> > +{
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> > +	struct xe_mmio *mmio;
> > +	u32 mem_region;
> > +	u32 offset;
> > +	int ret;
> > +
> > +	ret = guid_decode(guid, &mem_region, &offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	telem_addr += offset;
> > +
> > +	guard(mutex)(&xe->pmt.lock);
> > +
> > +	/* indicate that we are not at an appropriate power level */
> > +	if (!xe_pm_runtime_get_if_active(xe))
> > +		return -ENODATA;
> > +
> > +	/* set SoC re-mapper index register based on GUID memory region */
> > +	mmio = &xe_device_get_root_tile(xe)->primary_gt->mmio;
> 
> this doesn't look right. We recently moved away from using gt as the
> target of all mmio operations. This seems more like tile->mmio.
> Cc Matt Roper.
> 
> 
> > +	xe_mmio_rmw32(mmio, SG_REMAP_INDEX1, SG_REMAP_BITS,
> > +		      FIELD_PREP(SG_REMAP_BITS, mem_region));
> > +
> > +	memcpy_fromio(data, telem_addr, count);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return count;
> > +}
> > +
> > +struct pmt_callbacks xe_pmt_cb = {
> > +	.read_telem = xe_pmt_telem_read,
> > +};
> > +
> > +static const int vsec_platforms[] = {
> > +	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> > +};
> > +
> > +static enum xe_vsec get_platform_info(struct xe_device *xe)
> > +{
> > +	if (xe->info.platform > XE_BATTLEMAGE)
> > +		return XE_VSEC_UNKNOWN;
> > +
> > +	return vsec_platforms[xe->info.platform];
> > +}
> > +
> > +/**
> > + * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
> > + * interface
> > + * @xe: valid xe instance
> > + */
> > +void xe_vsec_init(struct xe_device *xe)
> > +{
> > +	struct intel_vsec_platform_info *info;
> > +	struct device *dev = xe->drm.dev;
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	enum xe_vsec platform;
> > +
> > +	platform = get_platform_info(xe);
> > +	if (platform == XE_VSEC_UNKNOWN)
> > +		return;
> > +
> > +	info = &xe_vsec_info[platform];
> > +	if (!info->headers)
> > +		return;
> > +
> > +	switch (platform) {
> > +	case XE_VSEC_BMG:
> > +		info->priv_data = &xe_pmt_cb;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	/*
> > +	 * Register a VSEC. Cleanup is handled using device managed
> > +	 * resources.
> > +	 */
> > +	intel_vsec_register(pdev, info);
> > +}
> > +MODULE_IMPORT_NS(INTEL_VSEC);
> > diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> > new file mode 100644
> > index 000000000000..3fd29a21cad6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_vsec.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright © 2022 - 2024 Intel Corporation
> 
> just 2024 should be fine.
> 
> Lucas DE Marchi
> 
> > + */
> > +
> > +#ifndef _XE_VSEC_H_
> > +#define _XE_VSEC_H_
> > +
> > +struct xe_device;
> > +
> > +void xe_vsec_init(struct xe_device *xe);
> > +
> > +#endif
> > -- 
> > 2.44.0
> > 
