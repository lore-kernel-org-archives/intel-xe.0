Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5095DC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 14:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E07710E72E;
	Thu, 29 May 2025 14:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgJW+FRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD510E72E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748530677; x=1780066677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WRAyRC4FcPrUeY9Cg/8k0L8YZYnoStCgK2zfqKKyTUU=;
 b=SgJW+FRWd9iBIbenXNbI8EXZBNlmkXZrwgUSP3uQxols5uDD/ewm5Ge2
 YE2itUUZIyOi65s9g/8F1sfEzIbI+AsSpcsQ1eZjg+ev3nhs6kUJsWK1p
 NvNhpgCjlxXAWtWjVaWgvHcGqBFoJUhhTnGE4mk3DK95n7j9I4O+YPWuV
 NqiSJvk7Z5UtX9qIA3c0vRJTbFo6d9+ehOu9XMLZh/O4zN+6iKfJV32gR
 Ar/ddFf3FJiz/ktWjVOdI7WumjYSAIi123p/aDjaws3HLIIVNTpisD+AV
 43hS23EoWiY5R2/oSq5QgSZLKrHYn7R37IHG7b7SoxXP+vCCZde1XD5bc A==;
X-CSE-ConnectionGUID: FApMQybBR4qRl3A2vzGCBw==
X-CSE-MsgGUID: YXXkhRRpRHGRjeixTxvEOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68019267"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="68019267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:57:47 -0700
X-CSE-ConnectionGUID: o6nbIDH+RIe9dJ/jWO8grg==
X-CSE-MsgGUID: q6QgyD/2R46hBKSKYGEa4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="148740692"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:57:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 07:57:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 07:57:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 07:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCWFWgXdu3qRKGs/pRdK83wdToP8yRF22oNZkfsLso4XukoK/PIAfn3cJeHSNLpKmMzbbD3qwF5POFNKSJAMmbehvzQu4ZM8Ke7UQQA/5cn18miOE0uACz1a4Czch237PV9RWeguWFvcDs5MoYeMQMQi5ZssC6/ou4gfcSEd5/rviA+NqDF9NUdiOP8cr0m2KoiGBCl5Fb0sLzdXhW+Dv1qpOgaFlbdrbgGne7STxUNoaEDECnmfNkijv6cDkymb/9kUtLa86LGXiF/7gLA9k9KYsACwW9gX6I50ifZbBtTeJLf19hduLSqVW+/mrYnJxbZburrDep4Kvz2IsX3NhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb/jEB5zxweWWQuz4AfEgom+OtTOLlrN4EL6Nqv+DtE=;
 b=CR8L9M9rWEmWerN3BnKYt9Yu1YuNFQ8h7cq35kw5960sr6gQLCriP+/8Fkw5BTg0I9bKr3jCA+a4RcXfonPpzCHb9P5kmdOU1eGDXeXRQzCRNh7C+cL2y3HxACCRz9ePgDcWZ70fGPmoEEoFEbePQkigYFzLtDQJGZzqhIZNvd6urC2w8JYPeTWj8dyaHAI9/B/SVB26McSkKUtWeeAKTaG7kFs81VvmIrFvT4bvtdOH68T+vmxaPqq2HQhuhpGEyGJGGrR6oVa1rkdnRV4qsl/Isl9PwN2Y+qTt47UtLQ72hi2PTxLrTpivmddE0nRjUAVdplA1JhUKgiAZCkLO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DM3PPF49E43CAC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 14:57:41 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 14:57:41 +0000
Message-ID: <b2c4c872-8343-48ed-8a98-fd6ba89141fc@intel.com>
Date: Thu, 29 May 2025 20:27:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/6] drm/xe/hwmon: Expose power sysfs entries based on
 firmware support
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250529103430.2348053-1-karthik.poosa@intel.com>
 <20250529103430.2348053-7-karthik.poosa@intel.com>
 <aDhgL7NEDUj56oq3@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aDhgL7NEDUj56oq3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DM3PPF49E43CAC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa089d1-5c6b-4ca9-5a0e-08dd9ec128f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFBqSjZ6NjA1OUNNZW5PZEtocytmS2dnYmk4SEhCYlNFL0tkdTcxMWFHQ0ov?=
 =?utf-8?B?cDNEV1lIbXlXREVYdDgrRjRxZnNtaTF5OWFqQ3ZTY2lHMXBFbUJmVUhVTjBt?=
 =?utf-8?B?dTJqSGY3RTlMSStXTTBCTzdibC82ZGwyMzFBU1ArWVRIYTFVcVdUS3lpV24v?=
 =?utf-8?B?U2FzYUlHeFhoRzVLemdlSVE3SWtJdnNRNWZvV2szbVlKNmpEVUpxRjI3QlVV?=
 =?utf-8?B?cDRmOW5ZTGZieWhEcmFzUGFESTBJQi8zV1hNc3hHNjROMFpVdHl4OVlXMUZR?=
 =?utf-8?B?YkU2dGdFbzlYS2lYMllISEFIeVhXekYvbW1USWkxOVNabzNQQXQ1dUNMUTF3?=
 =?utf-8?B?QllJREhUTDVNSEZyemJSaVV1WlU1d3FTbE9EVlZhMXhlOWo4dTNoeG12VUwv?=
 =?utf-8?B?eEhDTHlKeFlLbFlqcDhxODZrUFh0aDRLdmt5VTNWcDhJdFdtbHpxTWhKUExX?=
 =?utf-8?B?UnZmNjljaklDdExtWEFsbVR0TDhKa2tPT3lVc2dXZU12eHJGcHlpdHZFOHBx?=
 =?utf-8?B?YnNjNjl6Z1dqSjIzQ256V3gxQnVCaUduR3dlVEdZSUI5UXFFRVJJVmV0Ukcw?=
 =?utf-8?B?N21HSDZZeStUdUh5eDV0c0c4Z0VjY3g5T3lZUC8xdEpFWldkUDYxUnNDM3Vo?=
 =?utf-8?B?VGdiUWxjaTdja1RnZEIvOHFpUnY0a2dvcmdEMjNaMzZRcWQ4VXFvMkpJR1ZV?=
 =?utf-8?B?UitaYlVnc00ra3NBejBpN2xFSGN1R0FWNlI5cGExeEhOZWE2SUU5SWZXbTdt?=
 =?utf-8?B?QkpLVTZlbkJHNDFrQ1JOMjNuQ1RwQ1hxdTVPNWJUN244MW5ZMHhiU1pLdHR2?=
 =?utf-8?B?UGszNG5BOHdkU1VmNGNwOFFtcXBSenRBL1JnMTlRYkFjSU1kUE95b2VObU1o?=
 =?utf-8?B?RWJ4ZVloMFJkUDkrVkM3STd2NFU3WHBzMldNQSszd1YvYTBzZzMwb2FGZmpt?=
 =?utf-8?B?U3ZreEhuQkNpbUVqUkZZOU1UZCswZzdJY2pDSnliODR4VzR4aWwzZUMwUm03?=
 =?utf-8?B?QmI3K3lPZE13NlB1Mk5mVFo3bHZxdlJUMUhQTDNsekFwL1pVRTNlaWx4RWlW?=
 =?utf-8?B?VXF4SUM0YTYyUmhtR0NKYnZkOERreTArUmR4SG5kL29XTVdLckFYcmNLRUx2?=
 =?utf-8?B?M056YWFpUWpnWVgwS3I4eXlEcGRlM2JkOHFYQzVhb2tGblZtMFJmTkNqSURR?=
 =?utf-8?B?c1FnM1pad09zTVVFTmxQazFJMnBGZVovUWhKZlR3WEM3aGFXRXJpTVZac2or?=
 =?utf-8?B?V0xGWEpBcHJzUm4zaHh1WXZKTzhVcEI4MkFKZmJmaENSeHhjNmZRVExRazRt?=
 =?utf-8?B?c2ZxVldBUWNabTZvUk94Uk1uaXJzTi9QczFscVQrYTJUTytXWmwvTytjdWNQ?=
 =?utf-8?B?aTN0KzRBT0VGdzVlUUpOZ0RWUmtqamZvRGVVSE5SWVVsRUgzU2UzUXp3djFJ?=
 =?utf-8?B?dWhjS3pxUDh2cUY4T09JWlNFOFc3NXU1dUY5bkRjNGcvV0pvTkNYZWdVU3o0?=
 =?utf-8?B?YnV6eFZ0UWliaFZTa0ROZ2pOcU4xYUhVVEdsdm5tdStHY0hMdFVxT1I3aC9W?=
 =?utf-8?B?MzBlQWN2aU1UWnJhY0dWSUJBS3NnTDNIREV4WXFYODMya21MRVdMbzlsM0lh?=
 =?utf-8?B?cEJ6OGdQaDlzbkZvTDMxenJ1Q2ludWpoYWxSeUE1VWNhdEV3YURET00xdmVD?=
 =?utf-8?B?U0JnZTRqR3RuQWtIWUg0Ukx4cE02OVI0T2pSUGVUTS9GVWxnQmxjZWI0WlJh?=
 =?utf-8?B?ek1OSjdmSjNBa0dYck0xM2FkTDNBM2tOYzlTRS9XOUQ4TmtncVJLTW1PWVJ5?=
 =?utf-8?B?RjAzZXhsUjk1djVLY0xqcDl3Ui82S3MxM3ZhdzBxeFN2UFoyVHAybFVmRDVD?=
 =?utf-8?B?R09COHhFSFhPVkorQjNHcEJaVEVNOUtjVGp5OEZOMVJxZ2RONXJRc2xEWU5j?=
 =?utf-8?Q?+pkiPF/WOTs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlQxK0xhR0hhL3ZUZFNkOFQrTENRVmMwYkJUbVM3NVNUQXpqS3VKMnhIajBa?=
 =?utf-8?B?Nm92WlZkRnl0Q28veXpYMFJUSjhwWW9aQVEzelVweDNjdXBvZ2J0TWRVamlX?=
 =?utf-8?B?K2pXWnY3MUkzby9YeGlpV1NYcVc4YWErTDdxQlNTWDNSSTJRSGMvai84MFFn?=
 =?utf-8?B?ZTkvalBuaFU1TmNzMmFDYW0vOFNWcVZpTWdkTHRtc0EzdkNXMG4xNGt6aVBR?=
 =?utf-8?B?T1FSRW9Sek1EQUlpRjI1QlpocE5HMXQyMEZXYklWc2k4VEZUdHpOWXk2RmN2?=
 =?utf-8?B?a253cEVlOTZYbi8yK3M1VytaektOMloyVVdFQ0ZUOEloYUlDbFhGZmxWWGlj?=
 =?utf-8?B?VHJQVGxsOFJWKzh1RkZlRHQrb2tDRXFoVHNNbi9KTjZBRWYwUDdBTWJKMGRN?=
 =?utf-8?B?NmcxalFHVDNsQnZHN0RMRGpQMHM5d09FYXdXMWFMSGVPUmhjQ2FSMTlrYkVC?=
 =?utf-8?B?U24xb3FKZHhtb0tUbjd5Y1UzWklPUjk1SVFEKysxcDFGc25NZGRNTXd3Nyta?=
 =?utf-8?B?MVM2eEE4WmRDTk1QL3ZhSUwxYWZuMmZzMEtoZE9kT3lBSDE5OVJOQzdwWGJ1?=
 =?utf-8?B?c2oraThFekY4TFI1YUpXd2x3dlZSVXFtUDR2ZklVYmdiVkU2YkNXZWgxMm11?=
 =?utf-8?B?UFNZUzU2cU5HbEdINFU2RzlnQkk2TlRicm4wL2hnNk1CazdYQUZ2QkY1OVV2?=
 =?utf-8?B?SGF5NjVlU00rS0ptVWh2TEpzVXluMzlIbWFFUWVXRHpDWDNVeGxERkYwSHhX?=
 =?utf-8?B?UVpQQ3ZjYy9jTVVEdEV5THRRYmRvOTF2TzNvSFk4WWxwVHhiZjViM1BlM0Ri?=
 =?utf-8?B?Y3NUZzRSSnFYWU5yeTQwNjNXaUdtYlc2cVRaQzBEWWkxbVRtamF5eFk2U1h5?=
 =?utf-8?B?ZGFaZHRudzduRSs4YUsrY3hrcnd1Wlpjd0xyblg4elpUN1U1SXVhMXJZZTEx?=
 =?utf-8?B?S0k5MXZscnVLc0NRS3VUajJWMis1L25jTmFTUXA1OThrY3diaWZGSkxQM29N?=
 =?utf-8?B?TGVrdTNVV2MrUlJGUVRZYXByM0NEa1FZZW4wSmFaQWU1RWVxM1FuZ3Q3MnFu?=
 =?utf-8?B?UWJBYjY2VjJ6eEJtRVJseG1yMlhFVDJDNk5oYUlmTnNoWmdsLzZnd2pZOUMw?=
 =?utf-8?B?V0tYZ0VQRzArZjZOMmNaQUVkbUJDR1RHa0l0b0RSam4ycUdmQkJwbFlPUXQy?=
 =?utf-8?B?TGNxSHJwaXNqT016STFYb2ZRSkQ2N2kzRVRsTVhzOXlodEhBTFBXNy9wMWFv?=
 =?utf-8?B?dDl3VXl4QlRUSkJ4VHh3c3BUT2YyOEVTMjlnUFRsZy96QkcvWkxZVWVKVUJM?=
 =?utf-8?B?Sk5Dc1NqbHA1dTNUTEZGS1JhYXJBbmFySFRvMUFNdkN4d1h4TnhXRElzaEZH?=
 =?utf-8?B?QlZHVndVK3lYbURHbGgraUZZaVF5RjZYMEU3OGV2SDJKdnZoTkU2VnNubUh2?=
 =?utf-8?B?VVNWSElqWTYzL2xrL01ocm82WS9PSVBZUGlpaUdqTGN6NlFDa3k5UlBYUkI4?=
 =?utf-8?B?K0NRNmFHcHJPUmpRbjRSWVc3WFlzMys0M2pRcC95bUh6L3I4UXhTVGVvWFZY?=
 =?utf-8?B?NmpWNnV2SEJmanBaVlZ2dWtYc3QvZTZGeWlOdHRETnVjcCtPV3BxbjQ1T0dM?=
 =?utf-8?B?UkU3d1BveW1CZUp2N3dDdkRsU21SSk1zYU9NdVJhOHNxdDFnN1Rib3diVW9P?=
 =?utf-8?B?a3hZNU9SZ1VHSUlxN24rWmxFRFozSXd4R3NLcTJRcUtlWnNoMWJVb05YV1gy?=
 =?utf-8?B?ZWtHQ0pmR3c2WStpbHpncGI0M2MvbHFJaWtzdkRHQXZlRk5qZjBxQzNhSFZG?=
 =?utf-8?B?RXZPVzN4Y25PODdZMjAwUzRTNjdUNWF0UVFtWjJMUUdTTGY3Q0xzeUJGTnJm?=
 =?utf-8?B?Ui9udjdYcnJhZ0gxdVNKZDU1VkxDNTY1YjFCMldqRGdTWlpXb0x4c2g2THRL?=
 =?utf-8?B?WEY1STZBWWVwczhpQlFOdW90SmN5OXA1bUpuTG1rWVVRVkpaOENHazVwZjg3?=
 =?utf-8?B?K2pwdVdKTmcyOTUvd1duakcvSWhna1NMTlU0b3phMEFrSWhraHZBSk04T3Zk?=
 =?utf-8?B?VWZVeGZMNy9Fb25yd3U2U09qczZsSGlEVGJJVkd4Z1dYa00wUkdrT3JSS1pV?=
 =?utf-8?B?Ynd5ZmpSTWw4WFVvT1NLcy9XK0xZMDAwR2lhTld6d1NpZGgycG9pYU5NemhU?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa089d1-5c6b-4ca9-5a0e-08dd9ec128f2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 14:57:41.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQobk1UWJwnd27blfB9tQwcfyQYWCrhsiSInxUR7tkEyQt8FE2OrtFNtwERABRnIXQdpcGqceFHLaTsn6bQktg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF49E43CAC1
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


On 29-05-2025 18:55, Rodrigo Vivi wrote:
> On Thu, May 29, 2025 at 04:04:30PM +0530, Karthik Poosa wrote:
>> Enable hwmon sysfs entries (power_xxx) only when GPU firmware
>> supports it.
>> Previously, these entries were created if the MMIO register
>> was present. Now, we enable based on the data in the register.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 65 +++++++++++++++++++++--------------
>>   1 file changed, 40 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c57c613471c3..25a89575a629 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -296,18 +296,12 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>>   		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
>>   	} else {
>> -		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> -		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> -
>>   		/*
>> -		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
>> +		 * Valid check of these registers is already done in xe_hwmon_power_is_visible.
>>   		 * So not checking it again here.
>>   		 */
>> -		if (!xe_reg_is_valid(pkg_power_sku)) {
>> -			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
>> -			*value = 0;
>> -			goto unlock;
>> -		}
>> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>>   		reg_val = xe_mmio_read32(mmio, rapl_limit);
>>   	}
>>   
>> @@ -652,17 +646,20 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>>   	int ret = 0;
>>   	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>>   	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
>> -	u32 uval;
>> +	u32 uval = 0;
>> +	struct xe_reg rapl_limit;
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   
>>   	xe_pm_runtime_get(hwmon->xe);
>>   
>>   	if (hwmon->xe->info.has_mbx_power_limits) {
>>   		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
>> -		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>>   	} else if (power_attr != PL2_HWMON_ATTR) {
>> -		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> -						       channel)) ? attr->mode : 0;
>> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +		if (xe_reg_is_valid(rapl_limit))
>> +			uval = xe_mmio_read32(mmio, rapl_limit);
>>   	}
>> +	ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>>   
>>   	xe_pm_runtime_put(hwmon->xe);
>>   
>> @@ -806,24 +803,20 @@ static umode_t
>>   xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>>   	u32 uval = 0;
>> -	struct xe_reg rapl_limit;
>> +	struct xe_reg reg;
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   
>>   	switch (attr) {
>>   	case hwmon_power_max:
>>   	case hwmon_power_cap:
>> -	case hwmon_power_label:
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>>   		} else if (attr != PL2_HWMON_ATTR) {
>> -			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> -			if (xe_reg_is_valid(rapl_limit))
>> -				uval = xe_mmio_read32(mmio, rapl_limit);
>> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +			if (xe_reg_is_valid(reg))
>> +				uval = xe_mmio_read32(mmio, reg);
>>   		}
>>   		if (uval & PWR_LIM_EN) {
>> -			if (attr == hwmon_power_label)
>> -				return 0444;
>> -
>>   			drm_info(&hwmon->xe->drm, "%s is supported on channel %d\n",
>>   				 PWR_ATTR_TO_STR(attr), channel);
>>   			return 0664;
>> @@ -832,17 +825,39 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			PWR_ATTR_TO_STR(attr), channel);
>>   		return 0;
>>   	case hwmon_power_rated_max:
>> -		if (hwmon->xe->info.has_mbx_power_limits)
>> +		if (hwmon->xe->info.has_mbx_power_limits) {
>>   			return 0;
>> -		else
>> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>> -					       channel)) ? 0444 : 0;
>> +		} else {
>> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> +			if (xe_reg_is_valid(reg))
>> +				uval = xe_mmio_read32(mmio, reg);
>> +			return uval ? 0444 : 0;
> with these checks here, now your drm_info will never be visible... and the ifs there
> becomes bogus...

if check i.e PWR_LIM_EN check is 'needed' in xe_hwmon_power_max_read, as 
power limit can be disabled by a write !

the drm_info there can provide dmesg log, that power limit was disabled 
as shown below

root@:/sys/class/hwmon/hwmon5# echo 0 >  power1_cap
root@:/sys/class/hwmon/hwmon5# dmesg | grep -i dis
[19645.834054] xe 0000:03:00.0: [drm:xe_hwmon_write [xe]] disabling PL2 
on channel 0

root@:/sys/class/hwmon/hwmon5# cat power1_cap
0
root@:/sys/class/hwmon/hwmon5# dmesg | grep -i dis
[19703.412812] xe 0000:03:00.0: [drm] PL2 disabled for channel 0, val 
0x0000000000000000

if we dont want the PLx disabled log in read, we could remove that.

> Move the entire logic here and make like there, checking enabling bit and not
> all the 32 bits...

REG_PKG_POWER_SKU defintion is different from REG_PKG_RAPL_LIMIT, it does not have enable bits. We have to check all bits of it.

>
>> +		}
>>   	case hwmon_power_crit:
>>   		if (channel == CHANNEL_CARD) {
>>   			xe_hwmon_pcode_read_i1(hwmon, &uval);
>>   			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>>   		}
>>   		break;
>> +	case hwmon_power_label:
>> +		if (hwmon->xe->info.has_mbx_power_limits) {
>> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>> +		} else {
>> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> +			if (xe_reg_is_valid(reg))
>> +				uval = xe_mmio_read32(mmio, reg);
>> +
>> +			if (!uval) {
>> +				reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +				if (xe_reg_is_valid(reg))
>> +					uval = xe_mmio_read32(mmio, reg);
>> +			}
>> +		}
>> +		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
>> +			xe_hwmon_pcode_read_i1(hwmon, &uval);
>> +			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
>> +		}
>> +		return (uval) ? 0444 : 0;
>>   	default:
>>   		return 0;
>>   	}
>> -- 
>> 2.25.1
>>
