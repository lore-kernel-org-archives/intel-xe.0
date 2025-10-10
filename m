Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A864CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 10:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33310EBA8;
	Fri, 10 Oct 2025 10:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0RGDwN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1D10EBB8
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 10:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760093434; x=1791629434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=svQ+fHb6CCVc16L4fsztwmtzrOfpjqenpQ3M6WLhaxU=;
 b=B0RGDwN6xBQDkQlSOTNNfChpUsMJi4c6pVcGPx0jUX648V8EPv+Ft814
 aI4ImdpRdAqw7MWkIFWx/LkSZcMZZ3EqC8kHNH0pmZF9CsMx9vhY1X4hR
 nLvPvNgP/CCGrHwGi0DWeN2bjVDWJWfYhZDOKx4gp0pfwVHk6H0E5Fd18
 pg+R3NOjgSgpOigb+IH9/chiCrTpBBWcoRzeaGyE+3sA3PdzdyxVLF1oa
 5qsb729Q0vCD3fCVSjz1i/HhsfgQGNOWGI5IBwek5HEL3zcvOuz1eQyrp
 JwJW+7jW4EbEmUZMYD/7PnC1SUzuC/xzfj6V1w4uO7RXSZGfEz4PdTWke Q==;
X-CSE-ConnectionGUID: EIr5WIQCS+WHhSEFg79XVA==
X-CSE-MsgGUID: 5ZRvxyHUQfOqtcVLIO7jcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62340235"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62340235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:50:33 -0700
X-CSE-ConnectionGUID: VaZulyLdRxiV75MDEVPqUA==
X-CSE-MsgGUID: fFVcvlT2QzeiD2CqeuYJQA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:50:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 03:50:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 03:50:31 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 03:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHrV8rhGG/Gfe449/68psI7whEUBcMtclIJldDlKSyi30Vb2on67h5PXvpZ3HTTK2HGgmrsSuoedYQYQ+sxoRuKZdrrsPaX+3McOY0l6AI6FVgGaeCnst5uEp+rOMUpTMkysHUsu9B7adzjEmrJEXRqz+fVyFhyF7EXxslDdGa0t1L5W7djC5VHzOfjGB6Zcxh+ChMEXfxmuD1AIMahBjOBgYghHCXLvqpspZpP3M80nTuycUkVODoS9CJ7/hRDWxz7qsUz6yxxS6FiKHkUhCT4TNNLzNqV8ZDLMgFLqDAo4DGitWhDxT5gJURcJuMi5R4yHvt2y4XbMYk8CaQVlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naWooO9fcvXZnhpjeDx6Mg1NUV14JvBaV3Kx+w4ksHU=;
 b=GD6sjEUF/Hkj6lczgKKJWUGzJ0icq4L8HbUD+5flM8bsQl0GzL+cuxOGb4P9aw+oaAmqTRkwxTTy3AW6Ozvjc3/boXEkOexLap5cubR/sLXc3jkpfqZA1VaH08BLVKvx0BjzBbAztTsxb0f4v1zMThCTPWjl9VElnf4fsFvQsUvk8TUSOgH/rQxPXZ5f0AlSIqmIUSFeBvLUHBqVmrjAO/Jff26yjqc+r2Hs9MRl1Ked5pqq1yPEQNhgHS9QOJ0E9P6GF7XhQd1YWBVTIC8MkSepHLG8EAPWIeaGMTfnkuE055LRhn9sWWuWJG3ziuGfhO/eMp/DY0eiEee9FyPjkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH2PR11MB8814.namprd11.prod.outlook.com
 (2603:10b6:610:281::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 10:50:26 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%4]) with mapi id 15.20.9137.018; Fri, 10 Oct 2025
 10:50:26 +0000
Message-ID: <4b6a94b0-2b19-4dbd-8436-87d9ed145dca@intel.com>
Date: Fri, 10 Oct 2025 16:20:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/svm: Ensure data will be migrated to system
 if indicated by madvise.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
 <20251010104149.72783-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251010104149.72783-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH2PR11MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: 55aeec96-28e2-497f-dede-08de07ead240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXMrVzJYakhaNWZOaXk0NlBFY243d0F2OU1wS3JROHB3QkZaKzNROExMb1Rt?=
 =?utf-8?B?QVNJSExQTkhHYTlaM3hpS2NEN1lVRHZzZG9UZG1EUnZFblR2bE9FTDZZbklQ?=
 =?utf-8?B?QXN1WjR2Q0J3Rk56Y1lBbGo1WU5ZMm0rWWZ2SVE3U0VGQW5qTUozbzF4cGJ6?=
 =?utf-8?B?YTUrT2xYZEF5T0ViV3BKSkRrNFV2Z2tZM0x0dEZFM21HMDBvSDNEOEpYelFQ?=
 =?utf-8?B?amtNUXJ4bHpQQitZQTlFdlBnL3dhY0gwUGhmemRrQXcvelhsdXFlc3JiNXBo?=
 =?utf-8?B?UW45NVNMYlhCbnAxYmtHZFlMbVVxQlZ1SXNkWStQd2JIcTZlT215aGtSeDI1?=
 =?utf-8?B?QXB4U2lscjJIQS92WDZSbkdveUU4SDM0ZktYREdWVTRlZzBmbEFzWTVSOU1P?=
 =?utf-8?B?cDIyOHF1cUR4bytDcTFFQkI1dVlaQ0QxZVhrNE16MDZkbGJHY3hudG9RdzBk?=
 =?utf-8?B?WGhTck9aNzF4SWhwSzR6UlY2ZSt0ZFAveVNJdmhvc3hHUWh4NGNhRFc4ditE?=
 =?utf-8?B?ZDJVUG41T3R6RkZtSExOWGh4YVYzQVNLN1gwVWNpV1B1S2FJNi9YUlZJQ0tp?=
 =?utf-8?B?Z3ZKbTlUa1JPbWxQTjJiM29rbVhNbkxGWkpYQVF6OFloeER3eENhRlVKbUkw?=
 =?utf-8?B?S2gzcUFKK3FBN0tqTFBJaVhJKzdlc3pEalg1bGo2Myt5RFh2dUlic1Q0RUJj?=
 =?utf-8?B?OTl3eC9Eck1ZRThwTE0rK25ZdVhUT0lNZHEvcytYTXFTeHBwWXBTeVp1Y0dX?=
 =?utf-8?B?VjVJNmFVWGZ5WTdSTWJCYnVQV3RBYjBMdkJ4MVRvUUlISy9RQXdzRUtoQkIy?=
 =?utf-8?B?WForOThOZjB4WTFucjJ5UG8zT282a0lBMnRTSEk4WXV2VmF1aUZ4Vy81bU5O?=
 =?utf-8?B?dGJ1S0tFM1Z4TGVndWphQkNqWVVISHZ3UlFPTVp6SkowOGVkZHpHSDdtK2hj?=
 =?utf-8?B?Q1NhenJYZzRjV3VHbzI0ODA2dnROVk1RRlJzMUM3VXlISzFlZ0hmK0g4Mk9Z?=
 =?utf-8?B?Q3RYcWMwM29SaFNBdEh1L0RNb25PZzZITFRYRkdzYmxpYW02UnN2SFVucHlE?=
 =?utf-8?B?Y1NSZCtqOW5nb296S01ER2VySzhudzhzeVdrdTFGT3h2QjZyT2RSL0wwT3lr?=
 =?utf-8?B?a0lKdXo4aTJFT1VhbjVxMDQxWFlIalRwY1Fpd3hZTXQ5NEp1R0NxWVpkR1Bj?=
 =?utf-8?B?OE1GRWFzdWwzWWV2eEFoYmVsbWMwSXErU1BJUjFOVmVCNkVONEZpR1VvUExY?=
 =?utf-8?B?Y1c5LzdacVRna2ZMZC9zeFZxRDd4TytVQ0VpVnZUM28zdFBQZW84cEVNMWp0?=
 =?utf-8?B?TnpjV1B1c3BzZEg0TFM5WmJhbjRVR3NhM1dHM2pFSG0rWSt5YjJITDV0NkNJ?=
 =?utf-8?B?dkgzdThHRjRyWHZZUVZzRkxwNjcwRFlsWkRVWHVRMDFIaW56a2FiZFZFWVF3?=
 =?utf-8?B?YXpwL2RHMDdhM0tUTUROQmp6TXlvbFhCUEtVbFMwSGpQWmZWV2VZaSttcjN4?=
 =?utf-8?B?enVVZzJ4blh6cCtuUGhML3VSMVU3cm16RG5XV1VEK3ZhL1FBUm1BTzVmc1dC?=
 =?utf-8?B?TEpFQzVTZkZ1bFRkWHFKcE1tS1lnVzRmdEpxbGZxc3hoQTg0NHBiT2J4YmNU?=
 =?utf-8?B?V0dLQ0VuYXEvRHZub0xIVVNjVVZ5d1hDTlRSTi80K3gzdE1iUTAxc2kyNG5Z?=
 =?utf-8?B?RGorRi9zWmV0UGNMdGNOaXRLVnM0dTNTMnhtWmJsV0c0cVBxblFJbVAwc3Vs?=
 =?utf-8?B?NmhQY0xqRVV2WTBZSHBOQm9XVE5IRGpiK0liNTVLL3YyaGpFT2UrMFB2ZkFw?=
 =?utf-8?B?TDh6VjVoQjlKUTluYmFLL3cvV3JHZkVYVmVldG5jYXdDZXp5MTF3d3RZYnJV?=
 =?utf-8?B?UktUbU04cElJZ3Uzc3JKQm5ocEpKV1hyaDZzWmNKWm85VGRrVVFRczB6WGFY?=
 =?utf-8?Q?j5eS4ZyuZPNi6Sw0i+tRFS+UtOIW2m83?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFoOXZHaDBQaklhUFU3aHJ3YjNSdHNUOWFCZUZCc2pRK3N4cnE4eHQyckUv?=
 =?utf-8?B?OFJVZ2tXYWxaVWhsTWh6R3k3ZTBEVkdnQ202Uk9NLzBOZkZtRmt3enlXZmZ5?=
 =?utf-8?B?cWlMS3JHNld0a2toNkRNakxjTW9ZeDhaZU8rQjdGeEtYR1ZGcHYwWlpOSEdE?=
 =?utf-8?B?bmZtNlExOEp6OGRGOGVBbUxiYUFNRHprWVJidUgrMTFtV2ZmOFRnWDJTZUUw?=
 =?utf-8?B?R09KYkVKcjBwSEVDdGxJWmYvN0lISUJESWhPQUZDRVU0aDRueXRnL3FMdDhp?=
 =?utf-8?B?RGpjZXBLZjR4WjN1RHFYWmp1dnowc29MQ1V6L1ZiYzNkdGhsN05JZ0Qza3Nh?=
 =?utf-8?B?dDBpaUJ4eFd4N3Z1ekpDbk1FeXZhMlJxVFNHdFVqbDUyNFFFWDBCME5oSW1Q?=
 =?utf-8?B?RllPZlBWN0ovMXFJcjBKSGlFamdCWjh4clprY2lsMFFjY0EzQmkxeGJsNWJk?=
 =?utf-8?B?VFdnOEFpLzVITko4MFBDY2Y0dnpGMzZLaEVQWkxHc25KQWFtWmlRaEZGdWs3?=
 =?utf-8?B?QWhVeWs5cWZhMTJ5ZFFzMURxK0xYQklFTWJaOHNXb0NFWTZ0T2phbjVXWG13?=
 =?utf-8?B?RUJpZG1lZVhTQU1VTEh2cFduSnNxVVBlT1NDWTVLaGhQNWwydzNJeEcvZ1F1?=
 =?utf-8?B?ZVFFWXRlbVVWTmkwdlRlMFBWWks3UXdJdkxLY0dzRURSYkZlYWNnWVN3ck5E?=
 =?utf-8?B?QjhCa0dWaG5RQ1haOThEZThHMXdxZlZseGdkdGE0Zi9mcXZ5ejJZR1hyVWNo?=
 =?utf-8?B?cVJqclNwTkRwdmkvSGpZMHRLMmtoN2lQU0ZPL0ZkSXdXemNxRFRYM3BRVWEv?=
 =?utf-8?B?b2REMjhTQ1dpWEVWdE5CeE5WSzZUNFhrTlZiMnJWNGU0WHFpTHowT2dBK1ZN?=
 =?utf-8?B?Q2w3M1JTMThmZC9panpaSXpOMS9velVZVC92SXpxOEtCeVpKY0RWQ05wMVZK?=
 =?utf-8?B?aXloeFAzTTByVVRoQURxN0JDQmMwdCtxQVhBYXFrTURVLzJvQlBEV0twRmpx?=
 =?utf-8?B?VGZvenNXR2RSdlYrSmZhcllJNmt3RkdNL1k2S2V3dVA4STh0aDdOWXhUUGpF?=
 =?utf-8?B?dVhpUzlRMEMwcXluKytFcWNqUmZ2akVXalZoWjY5YUd5MnRaUlpnUnd1TFVo?=
 =?utf-8?B?amJGZWZpY3RPeDVOOFZ6NDdUcW9GLzIzYjdESU1nS3AyYkRLYVF6cWVWbWVF?=
 =?utf-8?B?MWRzdk5VRHFVQUx6Z1h4Q3l1TlNlRGtRWDkrUzMvWm1ud1pGMW9yZ2R4QXU1?=
 =?utf-8?B?bTRNalc5L05Nd1VaUDJHNGVJei9sSW9ycWhvdnl3cERYOXFxZUNOQ1J1Q3Fm?=
 =?utf-8?B?Mjc5NldTZEY2T1M1V0dwSHpmUEFWTGRFcEdvQnlZSUwyV2ZvK2U1UiswU3Z0?=
 =?utf-8?B?NDAzV053aUdacnlNNHd3cmVvLzBOWXpFejdiVk5pS3lRYitHVEw5WXpqQklt?=
 =?utf-8?B?ajdLUVhHUll4bWZEMVdkNE9ISkR6MUoyTlpOaUM1QkVqWDBDQk9yVWZzNEs1?=
 =?utf-8?B?LzJoK1dKUU9HMDVMZEdoQVcyTG14aWlkU3ZQSldSZlQ5SzNQbjlkZk8zMmhW?=
 =?utf-8?B?VEp4RzhQekR1blBmdEFZQmcvbitPNWFJenpPOWhSckVMRVJZQ1FCTEE5VDEz?=
 =?utf-8?B?YnRHVG43QlkzdmdlYncvYk0zS2xvWDNDSHp5SndublNjSDMzdU1nYTBZOEN4?=
 =?utf-8?B?b25DZlFzeWx5cS94ZllmZFZmUzFzQ0xPdEgzdkcySmU1ZEo5UGxMZUNqNE90?=
 =?utf-8?B?U0hRR3lGT2UwYnJManpiTFM1L01JNjhFWi9pY1NaTCs3cEdtalBxTk9naTdJ?=
 =?utf-8?B?WWYya3A5N2tQWkkxTUx1MERrVEN4amxSV0I3Zlh3ZDRCZE9CQ043YnFWby94?=
 =?utf-8?B?RkZ0VG5FNlN1YU91S24vVTFQRm5tamlNbUVTQ3V6VURxY0w4cHFrSUZyVGd0?=
 =?utf-8?B?ZlR4OXhWNHo5VHVta1VEZWRxR1JBVUVvUUtmbHJhUWx4T2ZTN3gzRUw5OHFD?=
 =?utf-8?B?eVdBcUh1QjMxQ1pxakErckJHRnRVRGZVMC9LVGZ3bnM1WVpBQ05NcExmVGkv?=
 =?utf-8?B?dXZYUkNJdWNSR3FuSCs3K2NyYTE1RzlvWWFOcEJLL2t5OVV3dFRjVlY4L2lY?=
 =?utf-8?B?Z2RhSkxUREt2L0hwL2ZLYy9ob0FWbTJmSkxVMFJwenNLMmM4QUZ3TDZya0lG?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55aeec96-28e2-497f-dede-08de07ead240
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:50:26.7562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY9uRdRwIHOYR4qDHPRZ4VoxcZSAphZyeuu2Idtqlhk41Ho0g0CP6rtdlEhtw3N0QjszQW3z3EpgD0dS6tfqp7staK+F7NvAsvqAlEMqlL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8814
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



On 10-10-2025 16:11, Thomas Hellström wrote:
> If the location madvise() is set to
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, the drm_pagemap in the
> SVM gpu fault handler will be set to NULL. However there is nothing
> that explicitly migrates the data to system if it is already present
> in device memory.
> 
> In that case, set the device memory owner to NULL to ensure
> data gets properly migrated to system on page-fault.
> 
> v2:
> - Remove redundant dpagemap assignment (Himal Prasad Ghimiray)

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7e2db71ff34e..ef8c7aa485b5 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1034,6 +1034,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	if (err)
>   		return err;
>   
> +	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> +	if (!dpagemap && !ctx.devmem_only)
> +		ctx.device_private_page_owner = NULL;
>   	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>   
>   	if (IS_ERR(range))
> @@ -1054,7 +1057,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   	range_debug(range, "PAGE FAULT");
>   
> -	dpagemap = xe_vma_resolve_pagemap(vma, tile);
>   	if (--migrate_try_count >= 0 &&
>   	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
>   		ktime_t migrate_start = xe_svm_stats_ktime_get();

