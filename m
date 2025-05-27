Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359EBC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 14:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E516310E466;
	Tue, 27 May 2025 14:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h00kqgbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C37D10E466
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748355328; x=1779891328;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S2Kwr59kb5HAdRwIJozOa133ZcfDeyykO6QiIvoxAjs=;
 b=h00kqgbXK3av9V5uNExLBVrMA9sNBeZZz/lyX6W/3CiHAlmyQsHvbHSE
 99BoAGONSWzUj0JhPQBKye5THO4Qu2ucqKX3i3bS6jk6q8/HJ+rgxF5uR
 qFe3cFiiGlDO8NNiGCLUeemZeP/fQUy+0fEWXxhUxFteAGteDiREe0dwx
 aPmGt3mgiO6daMPg2vjCiFLkeDAExHiC4JFrVZz1AxbiSspfrIcxaiaJW
 ZBKH648/zPn8MicoC9TsHtx2EhjsHzi+JFNHPhQ376AtxnfRaqdbOMbbW
 CbcjMBFpd3NeY83BLCRhKLadXXDzaKTfH1jh8M5wTWWTbK127nY5vNP3t w==;
X-CSE-ConnectionGUID: ZR9GU1qaR3qCewIWIo/gFA==
X-CSE-MsgGUID: zihKq/coSxeSJDWkfwBsRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50402086"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50402086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:15:26 -0700
X-CSE-ConnectionGUID: 3ODe5t8AQGeBvqk1ubVXLg==
X-CSE-MsgGUID: hpYOCQmXRseoUbQ5jPPOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="148102458"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 07:15:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 07:15:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 07:15:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.51) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 07:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQQlj+aIJIHrovnojlupbWWxibjGvEBNN6/TckPxYFs+Mu0EDHzD0LrBssikFdEAHoLr5VaRXtodM9kRIw35wp+OJmT3kwVo6AZQBXXrXMaFz+zNqyn7BTJ972GyClWlXGzVAv6k+RV8nXxR0qrjkauV4qE4oNDW4t6Sckcq9r49Dsv8+709Hf1VJclsSaR4Q1k6XYQ7uMNF8YZrIIglseemfKNijq0qSRG5UlaWQQouAmncyLPXYs2ayZdJ+0jtVXCh1oS9axxzPR1PNx3VI+d3FexpkZXECdqTSEU6bL4urjn1FqkGBGoxvTb5MLyXs6bkECMrvwcM5caqt89n5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6v/PGJUuVsCZSjyCpikgGhCbeDuFZxUVwkPGi6Wqfg=;
 b=Pm/UuX4KhtTCFZyKYOr2Xg2svF38asiB76vvZAiuq+iOCptk0Gy0brV5cJ4q+xdJ/e/umpmKFBvmSEAJgApvya8TKpdAO/Hg+vNAmWuYOcuOgnN/aR/mDGOLSuTL5mC9OCw1Pw5NFApHRai+3KFxjuJsJuRS5k1CZYj9XFRBAwd8tvDNy3h8FNSYvqCBPJQRkldiwqYYa7m6mdD4JHL862uUTVpF/aQIG30ywBY63Y2m7rpuT+r6K3RH1PRsztcNCnnDxIxbaY1MbM/cra+poGsrSkaJXH8ld0nFLZulwlykThxXd0YRq6CrNCOJDPXPmXkNuvXhTu06UKvzF8Rjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 14:14:54 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 14:14:54 +0000
Message-ID: <072ceaa1-22a9-48e1-8133-a033a8c8cbd6@intel.com>
Date: Tue, 27 May 2025 16:14:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-3-tomasz.lis@intel.com>
 <LV3PR11MB86950BF30DA68B8F5277FB73F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <LV3PR11MB86950BF30DA68B8F5277FB73F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0268.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::41) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CO1PR11MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ab9413-6831-4a26-2301-08dd9d28d9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm5RSkMyNVNpY2Vubmw4UTR6M0lLem5lenlWdjBtMDNPYVoxNEJJQUk1Y2R2?=
 =?utf-8?B?TTlaeFZEM1VMTU1hUEp1Zm9Ldm1vcnc0SFZ2WkxxMU4zMEdoT3FNVFIydmc2?=
 =?utf-8?B?UHJkWnFsNnFXcllxQ3JJRXZ2d01ZU2lNSFAwd2d1NzJIdE84YWNJNnd0VG1m?=
 =?utf-8?B?RW1Wd2VBR1dLNDUwUVdEOGsxZy9tckxwZk9JWDVkUWl4dVU2WlRWWFpnQlpq?=
 =?utf-8?B?eW5qMVVkelE3QjMyRCtSQW1uZE0vZjNFUkg3NVV6VFZLV2J6MUVYMm1uNExG?=
 =?utf-8?B?WWd5Zk0vV1hrMGxWTUtLQU5XYXJaTHpHdTNrUUhOdTNwRHp4eFZ6a0tXVWJP?=
 =?utf-8?B?TVZCdHFRbzVRNFo2em1Ja2pSQXRuNDZ2Y3NQR25CVDV0ckxIYzN4SVJXb0hM?=
 =?utf-8?B?VGRvWjF5ZDAyWTNnQlREellxTVg5M0g0dENMd2pYQ1hkOURQSGxjMG12NXBL?=
 =?utf-8?B?NjRRZmVlSlg4dDV2RzQ0UGFNMmZyUWtCSWtWOW9mdERCa296OGF2aTR4MFdl?=
 =?utf-8?B?Vjk5V2ZVNlBIcDEyT0dxVVR4U0JSMUxLUTJ5cU04QU1QWXFUZjVQWVlDek1I?=
 =?utf-8?B?T0d3bUlmODErYjJ2ZnVRQTF4blpPYnRCSnZlQldYc0p1OFFaWlQ4YyszWk4y?=
 =?utf-8?B?eVlpMG4rN0t2WjRRazNGQVV6M3NWaURUYVZZK25NQTRmcU9QNmRISTB6Z1R5?=
 =?utf-8?B?S0FUQWZySUVZbHM1dzdRMmQ5ZUhFeFNjeVZQVncvWTcxQTRMcnZWalo4Slda?=
 =?utf-8?B?aG1OMFMyWTBsY0FSSGRkNEtNb3RobUp4Q3Q5K1NxZDErWXRKS3I1ZnJXRVp5?=
 =?utf-8?B?cDFsTDNhcXhyMmd0UkJyekJqaWxEUHQvcHN1SlJCbTZ5TTNJMEVBSDlnWDRh?=
 =?utf-8?B?bVJlSmphci9aYTB2enVlMWVNRjAzNVdWUHJoSGR0RUdjTVllcEg4VU9QYVNG?=
 =?utf-8?B?WXcrZTRYT1M2d1Z4K1RSeW5TTEZrZlBQaHZaYnY2T1oyc0QrQUhWbFpSTHBT?=
 =?utf-8?B?RHBFejVzOGhtTEtCaVI0QnVVN3lIOFBJUUptMVQ2ZklJOUIxWWhQWEdBcTBD?=
 =?utf-8?B?NGk4NHVMSGpTcG94MzJ6NUhPVG1WblVLV1VoSjV6eXh3WTMxc2hPcGFDNE4x?=
 =?utf-8?B?Ym9ZQW41OVBoSkhyaWRCVlNpY1NnTWVQL1FpUzVQV2dGS0N2ZkdMWkdaOFRD?=
 =?utf-8?B?SElDdXA3MGpLS3dPS2s0WTU3Y0RURFhPbng3M0VCMnFwRnhjOUFPcTllbFY5?=
 =?utf-8?B?Y3BsZXpxczFyRW1PRUtzUE1tbWVISUMxeXBCTStyY0ZXbFpJcEl0c1dWK3Fv?=
 =?utf-8?B?dkhkcEtOd0Vid3R6cnQzWVhMN3dJV3J3dm9CNVh0THNIRFU5azhIWDd6aFpx?=
 =?utf-8?B?NVVjMEZVNCt6cTQwbDVZWUh1K1NDZVVOT3FxZzU3MCtoVHV2clhlMFRTbCs0?=
 =?utf-8?B?VkZadEZ1R28wd3ZscElyNndBY2dWckRCeWVaQjhLQldlSWx0ditrRjBRU3ZS?=
 =?utf-8?B?SmYyaUNGbkJpdXd2TlJRUm5tVWFpbFUwTFlzUEhFSTJKa1doSTBoT0RGQXgw?=
 =?utf-8?B?a0NZNVp1RU0wZHRHWWNwbTZLRllqaU1BZHV5cUpBYVlOSkVRaDJtZFlVSEgz?=
 =?utf-8?B?ZWF4RTIyem1mSnNCeXgzMDhzeDVvdHNza0V1Z3A5SXVrVjFuZWwzZU15eG5F?=
 =?utf-8?B?b2pXeUcwY2ttK2pVUGV6NkdWelVIbVpzb3AzemVCT0Z3OG1haUI4QXp1c1dK?=
 =?utf-8?B?ckNPSStvYkJmZEUvTWNidWQ3NkhCNkFkS2FMekovVEZjREFUMzRsU3NLNkFi?=
 =?utf-8?B?R2tRUTVXaTJUUjg3K2NNdlNKbGk4Q2l2ZnZTRmU0MW5Way9hanNsTzduSm5Z?=
 =?utf-8?B?L1kyWVBTckkvcSt6N3NyVmFDTDQ5dkVKZ0xNTFpObmY0bFNOR0FyUlFTUWlC?=
 =?utf-8?Q?FEBBX7fdPF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JYaG1mYTR1dlpoZm9mYlZGdTBCcHVaRmRyTzVJSjFibzF1ZEl6MFZ0a3Vu?=
 =?utf-8?B?T2YzZ0ZEM1dNRWlKZGZDSWt2MGVIdTJ1eXdZeXhxVlByd0h1MkpOUllJenB6?=
 =?utf-8?B?RHJrdlUxOVdTVHdUVnBYemZ4OXVDZWs2TlJJTXpQR3BZdytPM0RmeHJpd0Zh?=
 =?utf-8?B?UW40WkREQy82YWw4alltNXgwYi9OYm05VU5YT0JFcWpzK29rYkJmSlZOUkpI?=
 =?utf-8?B?aGJLZytDN0JJTVJ2Q3VsZWhzWlBwck9nK0h3eHE3MkV0U0hWQmF3RkdmSHpu?=
 =?utf-8?B?OXJMU2NPSzNJaVdLdFliU2Z2ek1zVnpmNU5ucC9kMEJURG1BUk9KcnQrZjlo?=
 =?utf-8?B?ZzBTNDdTR2tyRlZETEV1M2MreHZ3NHJieXdZQTlXYnhuc01HNitheFVEVFp0?=
 =?utf-8?B?YkRWNkY4eGxYRVJleERQckVtcDBNZ3NyTWNaeitHQ1J2VTROSGVYVUplUlh3?=
 =?utf-8?B?aXo2dk1pMTAyRmQrR3o1Vng3dWMzNHZDMWZ6YVdQR0FQN1NSS3dOUEpQMjBw?=
 =?utf-8?B?eXpLbkxiWWlGRU12dVpJS2pFUS92Y05jemp0ZE9FZ2NGZWJocUVpOUxMYWZy?=
 =?utf-8?B?ZmJCWWJYYWxzUm5jRnl0eElsNjB2dzBiTlgzUngvcDNEMWc3cmpSSXY0VDV0?=
 =?utf-8?B?RnFjNDlCMWtrdUwvKzdNRGlHalFTSzQ0WmVwWHVJZ2FlcUk5S3BLNFV4akFI?=
 =?utf-8?B?aFQ5c1V5d2w4WG9WZUJLWlZYNWp0L2ZHT3NYWWxYZEd2REplKzhwRUxaTDhq?=
 =?utf-8?B?Sms4QjVjTElCVTlBNzRTOVpYMGkvb0FwUVpHZUREeTZDL3hpK0phN0VMZ1cw?=
 =?utf-8?B?dGdqVjZEald1NVcxUXNwVjJsZTdCaTYza0MzUHBBMG1WUmtiZm9hSXVGRnBE?=
 =?utf-8?B?Y0lUeUZKMVJKdHNNUndOYUFyczZuazFpRklMcXJiU1FZcE13TVVuR2Vwaldr?=
 =?utf-8?B?c01NM1BXNUNrRzNkKy84MTFuVTVCOXVrb0dSZW80czU3NmNWa3RBOUg4cFor?=
 =?utf-8?B?NHJ3dU1Jdy9aRFZFOE0rUjVtbFM4QTNZQXBHcWN6K2VVeEtCaVpOd0w2dXNo?=
 =?utf-8?B?NDJ6R1JVQWVQMUdJUkdXamg0SHhHNS9nTTl4LzJNRFZkQzhwWlArWTZxaE91?=
 =?utf-8?B?T1BYZTUrWnl4dHc3aUxUUTM0VEtDL1VTL1lsdjliV3ZsQm4zcFRrZXFyS0tp?=
 =?utf-8?B?YnlyaDN3VFVQQmlBYTVacEY3ZHNla1E3RmNGT0p6Z2VVQjRZdFFjTWxxa0to?=
 =?utf-8?B?T3hQTk9lSWZFeVErRHhJV3hLTW9kZUp2Nm8rUlJYKytkbnE2U2E4NFlPODJz?=
 =?utf-8?B?TDZqbTI2bzl3bmE3aCsvdDF0YTNVM1JvUllDOUxQL04razdXcHdJbTZ5VjZZ?=
 =?utf-8?B?cCtiRHRpYkNHOWJqbUNWZVFZbmVPR0hvS0ZEUWNNdTYvK0Nkcmk0d3NuaXhD?=
 =?utf-8?B?ZmhBUTRsYldHVG5KejY4bGUwZG4yNlFVN29ic2xjZWVISkV5VkQxVm03Q2xO?=
 =?utf-8?B?b1NnaWR4UkRNdVFXb1Mzb2hvbnh1SDBLdTEvK0tyODJBcTJRMmpMVVlQeGMr?=
 =?utf-8?B?dmdBOENjZzRMSm5YYXlxWS9DeDcrOTlRb2pLL1BjQ2tvZlVvdFU5S0JKeVF5?=
 =?utf-8?B?MDVZK3RUTDI2eFU0NXRDY09RK3RGem1Oa2h0alk2U3I4cjd3cUJ0UXBKbUJr?=
 =?utf-8?B?LzNiWGRIVzRTS3l6RmwzQXRBUVlqcFVjcHJja0IyM1l3NFBraWZnSEkvV2ND?=
 =?utf-8?B?YUEyZ3piaVdBdUh1c0lvNUp3b05KbndndHVDTnJvT0JCWkptQ0VQYjhFQTR3?=
 =?utf-8?B?Ky9Pazh1MG50L3hEeU1YWTVXc2cxcFZobisxWWRUcTEzWlBYczlNMTlaV2pn?=
 =?utf-8?B?NXdma0ZyQzc5dEtuZ0ZWTnJpREZpakk2anZoZHJQcWtqSkpydXNwM3lWdDM4?=
 =?utf-8?B?OFhXcFlITlNkYnc4b0tpUnZWWHVrUHVROUIxbCswQm50UUhYU3l3SGpYOGgz?=
 =?utf-8?B?d1NPZ09kU1h4YnNYalRkbVJmUEI4Rk9PUDJpM2ZTYVNOb2t5eHlKTGszT0dE?=
 =?utf-8?B?eTZQTGRVYWRZYUc0SFFhM05sbmw5WVFwWUdIUlB1elcyaUo5cVNvbGtjTFF5?=
 =?utf-8?Q?+1b/hEYWEphCC9FMW5azIa+GM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ab9413-6831-4a26-2301-08dd9d28d9fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:14:54.2121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiZIdCzr5fi/5oNLW02rVIbdBaUJIZhp52oZsz56aNGQfT4orPflVoVSyAEL9S4qK0BO4TJguq/gubsSaabejQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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


On 27.05.2025 13:56, K V P, Satyanarayana wrote:
> Hi
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tomasz
>> Lis
>> Sent: Tuesday, May 20, 2025 4:49 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
>> <piotr.piorkowski@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>> De Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: [PATCH v3 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not enabled
>>
>> The RESFIX state should be achievable only when CTB communication is
>> enabled. If CTB was disabled and we still got it, then either we're
>> dealing with unclean initial state, or the driver is not currently
>> functional. In these cases, exit the RESFIX state by reset.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c    | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>>   3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 4ff7ae1a5f16..b9af112ca771 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_sriov_vf_types.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_guc_hxg_helpers.h"
>>   #include "xe_guc_relay.h"
>>   #include "xe_mmio.h"
>> @@ -932,6 +933,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct
>> xe_gt *gt)
>>
>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>
>> +	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
>> +		/*
>> +		 * If at driver init, ignore migration which happened
>> +		 * before the driver was loaded.
>> +		 */
> nit: Can we rephrase description in simple terms like below?
> "During driver initialization, ignore migration that happened before driver was loaded."
Ok, I don't like the provided replacement comment as it doesn't 
emphasize that driver init is just an option (not very likely one), but 
will rephrase.
>> +		xe_sriov_vf_post_migration_reset_guc_state(xe);
>> +		return;
>> +	}
>> +
>>   	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>>   	/*
>>   	 * We need to be certain that if all flags were set, at least one
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 2674fa948fda..099a395fbf59 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -134,6 +134,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>
>> +/**
>> + * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * This function sends VF state reset to GuC, as a way of exiting RESFIX
>> + * state if a proper post-migration recovery procedure has failed.
>> + */
> nit: Can we rephrase description in simple terms like below?
> " This function sends a VF state reset to GuC to exit the RESFIX state when the appropriate
>   post-migration recovery procedure has failed."

I don't know, "to GuC to exit" doesn't strike me as simpler to understand.

The triple-compound sentences are generally more readable when two parts 
are separated by a comma.

GuC can get a VF out of RESFIX state by receiving "RESFIX_DONE", but an 
alternative way exists by GuC receiving "RESET". This is what I wanted 
to convey by this comment.

I don't really see much place for improvement here, other than dividing 
that into more sentences.

> Apart from above nits, LGTM.
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Thanks

-Tomasz

>
>> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_reset_async(gt);
>> +}
>> +
>>   /**
>>    * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
>>    * @xe: the &xe_device struct instance
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> index 7b8622cff2b7..ba846af34a13 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -10,5 +10,6 @@ struct xe_device;
>>
>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>   void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe);
>>
>>   #endif
>> --
>> 2.25.1
