Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C5BCD4F50
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 08:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4657110E09A;
	Thu, 13 Nov 2025 08:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVumQfU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A100210E09A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763022655; x=1794558655;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cnbGmzj/IH5rSUU80OwIpMvgr8+pfD7ViSoGsdIzqqI=;
 b=bVumQfU2mfwRghnK2DkIpW1tLkwMDKBWySc11Ti3PsRaXDKtJtFQSGtf
 P5j4nWFVHftzHIT3+lgYbGZrABgdhVfbG5YiCWUD0xM2UiwxbccJblu0s
 V3kRNkuDH41/pcpnYc3WHbXgQPvuBbIVVXBjY/Enn7eJT9qsHv+V/XKrD
 MBoprzs77HcjpNZpATjCxIHd/s0SncRskgUFyNBIfDgokpYZBZrkaFkUd
 LESVs+kfqJERGRMJv2y8aAR11aR1Ru3r8Lg2LsNP4zChKUJdXKbPdzsHR
 pFFjG4NdawbyvByJeKylxgg9BobtMd3OTfsX/8sLydh8j5vjF5lIr7PhP A==;
X-CSE-ConnectionGUID: 55ZAyc1VTpKfsEvzVdT5eQ==
X-CSE-MsgGUID: IUoJcjVaR4m5ucGgdAgAvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="90570223"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="90570223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:30:54 -0800
X-CSE-ConnectionGUID: yL8GQmYsQx+CSGmgwj+Jqw==
X-CSE-MsgGUID: jiMOr3s+SDWQ4PGevSesnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193697781"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:30:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:30:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:30:53 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:30:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9GBt8LgbvbhAt1a0Ja7dDd1B/NiuBxvTLtKIoETWAg+lrLbkHSGWVvnuw+fv1QUjaDlyHf5uJArK28i35uYilD5ef70Dxfd0F1d2yjZzmRddsXehaS+/5D6DlpzPlUMPjaz8lf0lTu1HgCVG+wmjJZ0Zv3CKJ0kLJmOB3MAk42oY1brZ8VBUJaBkmPQpfYo1CFK0R2QyWe7aYT+7dUwAnBDfN4s+ZV3h0CW49a/ueewUdC7LWYkiPgaMNn9yn9tMTmy78RaCRgzcuSIiISEr25AuvUbadGgMbvG0FWvRe9ihunrRMLg/mfMmuKDXffXybxYHB0YZ/EfcsmMof1/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeKBsqW9q4QDPEpESaM1aUFMDJiVUeRlTlBa8FnXp00=;
 b=TScdXmqHD1P160F4n5RUH0WshgvY5RAZo6RpYdZx1cSA8pgL8lLXJyjszpKBWhShPVDZFxjo2n2zNaJlt5WlduHaACoNa9o/LlSNdvS5yRZkn/7iMm0CqtcjRcwViHTHoU2OYOBQJXcLTllRHRGlNAzOPa+Iaik4oF5PImTgjY2x4K5+wQwdH/Jx/NJCsJeVUPg/Lzuh4joCcMKtWslKq1IwVmfYP2R/PemAYeSFLsLJkSYFNZ97jRBH4ETyK+Jt6OZjwvLWD2ejsSin29G9edbVZT+M1dilYrRHULQuU3s7fFzdU+45Sl+P2JPZrSm25aNMSQXkl+zMQirCCnjlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 08:30:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:30:51 +0000
Message-ID: <4a63b8b6-771c-46a1-a4db-4d5f790a868c@intel.com>
Date: Thu, 13 Nov 2025 14:00:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_survivability: Redesign survivability mode
 sysfs entries
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-5-riana.tauro@intel.com> <aRTQYPQkLyZYfD0w@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aRTQYPQkLyZYfD0w@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0140.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 7feea840-5d11-4b07-107c-08de228ef40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0s4R01HKzVLdmJsZEdCcVdNZDRpVUFBWDRkVWxLdWF1K3BTZUZnV25YUGJK?=
 =?utf-8?B?c2RvNVdpbyt2RmRWSUdOY0ZJSW5WdWozcU1sMkNSTGluMmNCZkE4UXI5akFi?=
 =?utf-8?B?cG9oUWwxell0NFkyZVlweTRZVmwycXh3dGNvMHRIeHJQNWpLMDg1ODlyckp2?=
 =?utf-8?B?WWRzMjA0a0NLclp3UkplWFN3M1NBZGlxMWtLQ0FCdVRUSXBrVW1samxwSmww?=
 =?utf-8?B?YVFzdXdnc0V5QjNMOE1RblUwVWNaK3RTbHdPQlRqNnVPWCtDc3dmMVdQaHFO?=
 =?utf-8?B?MVBpNEVITHpCSmVXVzQ0aWxQalVHajBGMUNhYWJ4RTh5NzlPSjBYZEYrTVcy?=
 =?utf-8?B?VjE1ckFRWGE5dHBtOXl5MlRLUzZTYklqQWxsbG1iOGppUHYydlMveC9nL25V?=
 =?utf-8?B?UzhleUJqNmtGU25RRm0vNzU0RGZQTWpHR3kvOXM2NDVWdU13VTYvcVFBZjd1?=
 =?utf-8?B?NDJDSm5vZHlkdjAzclp2T09JTFZJeEZoY0Z5c0QwQjZZUnRNbUZkUyt0RlhN?=
 =?utf-8?B?ZHFUN0o5dXJqMHplMm1EWE9vYXA4MTg0RkZJR29qMk9RUEVpL1Q3eUNuS2dX?=
 =?utf-8?B?VzJlMFREa0ZiUEFZWlpqYzdRczJTUkdwWDRweHVvVzhrVGIwdlpJc0dvaFhP?=
 =?utf-8?B?QmlVK2hSU3ZjRnVYSkhnV2lHOFhWL2EyNmNsVzRJellqMGgzTEhySkJWc2p4?=
 =?utf-8?B?Ky9kbGl4c2Nka2NaWXdPaTczOEJ6UW1BWmN0b3RHQWxGTFZ2YXczNlRMNTZw?=
 =?utf-8?B?NDBpUDkveGxQbEZDelBsS3ZHMmU0bUliYURkcVY5VUJPQXEvTjVZQmlNZzBG?=
 =?utf-8?B?TTFYWjlMSTQ2WkpabmdKdVZUT1pNb0cydEdabWZiTDByZmZudUd5ZWlvQkdU?=
 =?utf-8?B?TXZKWlhuZy80ZDZkRXFzMW90d01yejUrbU5RQk8xbTgyV016ODNxcFNPSDBM?=
 =?utf-8?B?NXgrS09JWm1FaEdmYU9VdCtIR0paeXdjeFNmK3QwNVJ2VEwzRzNaNThLeTZU?=
 =?utf-8?B?VGhKUEI1R1pyWWFjSU5YdzE2MU54VUUxZGwyY0RNSENjL24rMFJrcSt2UFdB?=
 =?utf-8?B?U0JWRWdFZDl2SHFENDU3YlBUQzRXRkg2UjRuaG9TNzdlSlpVYm5USWl2K3FW?=
 =?utf-8?B?MUlkYmhnTFRVWVk2TDc2bnZ5TEkrQlNxT1lYYVMycmFTSG9OTVJxRSttcGtC?=
 =?utf-8?B?T29NYVpuQURncXQvNE1GK1JYdHRQQkFmcnNRL1JBTmpGMlVOMGpxbXN2VDI1?=
 =?utf-8?B?M3NMR2gxS3pKa3dMbUttclRPdlVUaXNKOWwwWXBqQjV3djFpOWdXWE9kL1lZ?=
 =?utf-8?B?Z0owZDk0RXNkYzhNd3A5eWc0eEtPeWVhbG93THAweE5ZN2QvL08wSFAzenI3?=
 =?utf-8?B?aEdudlF4dHRhdU44ZnJwTm1RcDU1eXpoczNUU2tJbmR1SUlyQ3ZQY1JXYUM2?=
 =?utf-8?B?RitUWVhiRk1VWDR6cFlmR3NYQTFwUTlCd3cwVS9kZld1UFI5bFROTTlMYW1S?=
 =?utf-8?B?RldFSlFvRGk0Y25EUkpnTDZuNmpDZTZLUXJ5eStFdXdIVXVqbU5haE40Ykkv?=
 =?utf-8?B?cXpScVdLaGFhL0doUy84bW9wZFdTaERsdk4wTE5hb1RTejFydC9sM2xRYUw4?=
 =?utf-8?B?Q282YUNlS2Rtckp2NXZYcFlSVzhmUExkVVlQek9CekpxcW01cG43S21Gbzhv?=
 =?utf-8?B?Wnkra0ZCUHpUN0dVczVBQ04vazZ5d0ROR093QW0vQ0lGRUhWbER5eWtzYnUr?=
 =?utf-8?B?amVKRGtUMEFUV0dHTVQ5ZHdXTjlScHVHa1FyUnlyNW0vbmJhOXBqZWdXVkdP?=
 =?utf-8?B?QUpqdFMyUGZFU0JKSVg4VmdiWmtWd3V3L2hmTnJsZG5QODNURkg0YVB1SFJ6?=
 =?utf-8?B?ekQvOW5mUm5Fd09LVHFJbTB1K2VCSytaUk5VSmlvUWp4aUEyK0VBWXdPTUUw?=
 =?utf-8?Q?ySn4q6bb2BqHqEwkKm1PfQIXoss75vuM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZHVlhkN0ZJT09ocWFKa1h1amJ2TndFNkxpcWFPYldrSG95QkpFSzJPZkZ5?=
 =?utf-8?B?QWdXTXVCdnZEY0JNTjhtb0twT25wbThxeFMyR2pNSlBmMkY2VEhnRlVYQ2pZ?=
 =?utf-8?B?UmhlMlRsRnBtTEY2OEkwcUVTVWp5UFBpMGhUaWdHSVBsMDJCaUQ2Q0wvaUpt?=
 =?utf-8?B?NG5Zb1dPaEU3dnc2N2xHWWhKNmVMRnBIdDZIR1BTUmhoM29KdVNpR2FsMTRt?=
 =?utf-8?B?NG9Xc1dsZ25hRFFzN0h6OXRwRmZnSndPaml0NTI0NldrU1VYUmZPUm9QSi9i?=
 =?utf-8?B?UElXQzhFNzhQMEV2OSsySWdBYmJpVk9jTjNsR3IzTXRPZ3hjelQ3UVJaNTRj?=
 =?utf-8?B?dnRsU0c2cXkrYjc4SEV0OVJEdjBZWVZGYzY4TTMyRVRMWTJ1SlRiOGJTWTl1?=
 =?utf-8?B?OC9OZlE5SnBRRTFuQmV2SUQ3Z3ZJaC9vaDBGTDJ6bld3aHhLTy9lQU1OcWJy?=
 =?utf-8?B?L1hBbDNqc2lkcU9kUEg5cEJTK0VNeDFNSGtUMVZveWpmK1N4MWFiTE5tWDRL?=
 =?utf-8?B?TWZmcDBJakJvZDlIN0FnMy8yQ2tEQmRid1NEQU5RTGpnc3llNkE4YnBleEJu?=
 =?utf-8?B?OStkc1NObEpVZ0hsaVVwWFQxMkVoRG5QaHlGMkk2dnBhVkZIRVdaSkcrM2o2?=
 =?utf-8?B?UXNrcGFkdFJieDEzaUZDdlFKRWxuRXlGTEN2ZlJPbUlMSklSdG1Hb1prWWhr?=
 =?utf-8?B?L2NoOWFCYytaNTROQkdDLzhzS0FiS0lxRXgwRUlMVjAyZ1RId2tqUGljckZ1?=
 =?utf-8?B?NkFUa3k2RHV5ODQ5VTFjVzNWVW9nNVRKQnluZkNqSzQwWjU5bHdhTVVYSVY4?=
 =?utf-8?B?SEFJUytrV2VtejkzakNXS0Q3cThHczh6SFRrcWhzQTNaMnJEZTJCQ3g2azBs?=
 =?utf-8?B?aVc4ODhVZFhUNU11SURQZjNINmRDeVVueFRyWE9sd0Y0Z0txU0I2aXM0dzY2?=
 =?utf-8?B?UjV3Rytlbjl0MDU4cTFvNC9IY0VxWDA2OXRRelZaZXBjMW5zMkRxd0RFT29u?=
 =?utf-8?B?RndjUHVzRERGV0pZVFUzYkc0cU9Uc3hZaGYweEZVdG9KVGtMSlF5emxaNFVQ?=
 =?utf-8?B?dFp4MHprR1AxZzRYRm9PTW8yaHdKaVpIU2dLSUVHUHl5Q2s0L1RUL1VkMGlq?=
 =?utf-8?B?SXhWanhKaEtKb01zcUlIc2JRYXJkMnRqWEJqWWZUdlF6a1ovazlBTUl4Wkwv?=
 =?utf-8?B?aGRsY0dWQkp1UWNkL1NaMG8zejJKOGpzcmhyNVZaSWdtYnEvZ2ptOEQvaWt0?=
 =?utf-8?B?QUJ3NEtTK29iZ3h3ejhYd0Q2V2I3NUF0SFMwM25WdE9STW9MS0RMTS9VaEtl?=
 =?utf-8?B?ZkJzM2F6UkY4b2xSWExxQzBKRlNxUVpxVk8wbVJ6MGRHc2FLT1dNZHlLakk0?=
 =?utf-8?B?endHRzFKWVpDYlBoL3N1Z3Z5ODU0T0FpcGZNNC9CNXdIdDJCVE02ejhkOWgv?=
 =?utf-8?B?cVgybEhzcVY0NkJRbHAzU3J6dUcwOHUyRFo1ZzcrdS80aDZQVWVDcDcwMEJn?=
 =?utf-8?B?c0tBcnhqNDFoSlpjTGx4VXdHblBqTHNXSGpwZWZhQ24zbnNWaVMyUkVCOTRT?=
 =?utf-8?B?MEw5bnB3VkhjbVhZMjc2dkFJVTRFSytyN2p4M1pSQ2ZzaUpKVVIyRXRqdWFn?=
 =?utf-8?B?MTNCbDZISCt0WDN1SlJEL21SMG9wb0g4eFpQaEdYeldTKzVZbGV0ZlVVdXdh?=
 =?utf-8?B?UHZHZUI1a2tmaE82clFJY1QvYkhqVW94dWJTQ3loWmhBUXJtUzlsV2ptbTBs?=
 =?utf-8?B?QzZnQU55VUNZbnNUZGJ5WGRYdEpSYmdML2MvZnRGZVJyZkQzbWg5UEkvSkVv?=
 =?utf-8?B?S3drTDMrZUFkb1U3RUduQ1UzNy83THlLK3RUUUhzRG1GRVNIUkRLT3hQUVBv?=
 =?utf-8?B?MW0rNXBDSnhiQy9LK00rQWVuRzYySHRmQUZINmkyTE84U2FwTncwQTlScndF?=
 =?utf-8?B?eXJxSmI5M2pTcnU5RFhlVlRVTFJBSnJIUTZ5b3U2MlNWWU1UMTlzYzN1ODVD?=
 =?utf-8?B?RXFHS3BqVW1aZElzaDQxVHoyTmFVYiswV3pQSHhoNEMyVTNPTVNMdHBPT3dU?=
 =?utf-8?B?aytPbGUwM3AzQkZKU2xnbWVLSGFaaGxkMDJ5Q0RzZjlUUDBzTms5VThZamdh?=
 =?utf-8?Q?DHfiT/fbNq4o3C1cccCNzJkm2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7feea840-5d11-4b07-107c-08de228ef40f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:30:51.3877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOJNza0S3OnmnYScG43M40xcbbbP3ZMfW31Uo1ZNPVk8BkQeCS2KKdGuc4eWO6xc2nP3DiHFQqiGfcn5GIbZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
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

On 11/12/2025 11:52 PM, Rodrigo Vivi wrote:
> On Wed, Nov 12, 2025 at 04:03:38PM +0530, Riana Tauro wrote:
>> Redesign survivability mode to have only one value per file.
>>
>> 1) Retain the survivability_mode sysfs to indicate the type
>>
>> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
>> 	(Boot / Runtime)
>>
>> 2) Add survivability_info directory to expose boot breadcrumbs.
>> Entries in survivability mode sysfs are only visible when
>> boot breadcrumb registers are populated.
>>
>> 	/sys/bus/pci/devices/0000:03:00.0/survivability_info
>> 	├── aux_info0
>> 	├── aux_info1
>> 	├── aux_info2
>> 	├── aux_info3
>> 	├── aux_info4
>> 	├── capability_info
>> 	├── postcode_trace
>> 	└── postcode_trace_overflow
>>
>> Capability_info:
>>
>> 	Provides data about boot status and has bits that
>> 	indicate the support for the other breadcrumbs
>>
>> Postcode Trace / Postcode Trace Overflow :
>>
>> 	Each postcode is represented as an 8-bit value and represents
>> 	a boot failure event. When a new failure event is logged by Pcode
>> 	the existing postcodes are shifted left. These entries provide a
>> 	history of 8 postcodes.
>>
>> Auxiliary Info:
>>
>> 	Some failures have additional debug information.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 159 +++++++++++++-----
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |   1 -
>>   2 files changed, 115 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 1662bfddd4bc..3d9417911c33 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -19,8 +19,6 @@
>>   #include "xe_pcode_api.h"
>>   #include "xe_vsec.h"
>>   
>> -#define MAX_SCRATCH_MMIO 8
>> -
>>   /**
>>    * DOC: Survivability Mode
>>    *
>> @@ -48,19 +46,25 @@
>>    *
>>    * Refer :ref:`xe_configfs` for more details on how to use configfs
>>    *
>> - * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
>> - * debug information::
>> + * Survivability mode is indicated by the below admin-only readable sysfs entry::
>>    *
>>    *	/sys/bus/pci/devices/<device>/survivability_mode
>>    *
>> - * Capability Information:
>> - *	Provides boot status
>> - * Postcode Information:
>> - *	Provides information about the failure
>> - * Overflow Information
>> - *	Provides history of previous failures
>> - * Auxiliary Information
>> - *	Certain failures may have information in addition to postcode information
>> + * Survivability mode sysfs provides information about the type of survivability mode.
>> + * Any additional debug information if present will be visible under the directory
>> + * ``survivability_info``::
>> + *
>> + *     /sys/bus/pci/devices/<device>/survivability_info/
>> + *
>> + * This directory has the following attributes
>> + *
>> + * - ``capability_info`` : Indicates Boot status and support for additional information
>> + *
>> + * - ``postcode_trace``, ``postcode_trace_overflow`` : Each postcode is a 8bit value and
>> + *   represents a boot failure event. When a new failure event is logged by PCODE the
>> + *   existing postcodes are shifted left. These entries provide a history of 8 postcodes.
>> + *
>> + * - ``aux_info<n>`` : Some failures have additional debug information
>>    *
>>    * Runtime Survivability
>>    * =====================
>> @@ -79,6 +83,29 @@
>>    * to restore device to normal operation.
>>    */
>>   
>> +enum scratch_reg {
>> +	CAPABILITY_INFO,
>> +	POSTCODE_TRACE,
>> +	POSTCODE_TRACE_OVERFLOW,
>> +	AUX_INFO0,
>> +	AUX_INFO1,
>> +	AUX_INFO2,
>> +	AUX_INFO3,
>> +	AUX_INFO4,
>> +	MAX_SCRATCH_REG,
>> +};
>> +
>> +struct xe_survivability_attribute {
>> +	struct device_attribute attr;
>> +	u8 index;
>> +};
>> +
>> +static struct
>> +xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribute *attr)
>> +{
>> +	return container_of(attr, struct xe_survivability_attribute, attr);
>> +}
>> +
>>   static u32 aux_history_offset(u32 reg_value)
>>   {
>>   	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
>> @@ -88,7 +115,6 @@ static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability
>>   				   int id, char *name)
>>   {
>>   	strscpy(info[id].name, name, sizeof(info[id].name));
>> -	info[id].reg = PCODE_SCRATCH(id).raw;
>>   	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
>>   }
>>   
>> @@ -102,26 +128,23 @@ static void populate_survivability_info(struct xe_device *xe)
>>   	int index;
>>   
>>   	mmio = xe_root_tile_mmio(xe);
>> -	set_survivability_info(mmio, info, id, "Capability Info");
>> -	reg_value = info[id].value;
>> +	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
>> +	reg_value = info[CAPABILITY_INFO].value;
>>   
>>   	if (reg_value & HISTORY_TRACKING) {
>> -		id++;
>> -		set_survivability_info(mmio, info, id, "Postcode Info");
>> +		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
>>   
>> -		if (reg_value & OVERFLOW_SUPPORT) {
>> -			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
>> -			set_survivability_info(mmio, info, id, "Overflow Info");
>> -		}
>> +		if (reg_value & OVERFLOW_SUPPORT)
>> +			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW, "Postcode Trace Overflow");
> 
> Are these name strings useful for anything right now?
> We should only have the values inside the file and meaningful file names no?!

In v1, entering survivability mode and allowing firmware flash is not 
supported for critical errors. We only log the breadcrumbs in dmesg for 
debug.  Used in log_survivability_info
> 
> If they are needed it is probably better to have an array map.

Sure will use an array map.

Thank you
Riana

> 
> The rest of the patch looks great
> 
>>   	}
>>   
>>   	if (reg_value & AUXINFO_SUPPORT) {
>>   		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>>   
>> -		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
>> -		     id = aux_history_offset(reg_value)) {
>> +		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
>>   			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>>   			set_survivability_info(mmio, info, id, name);
>> +			id = aux_history_offset(info[id].value);
>>   		}
>>   	}
>>   }
>> @@ -135,10 +158,9 @@ static void log_survivability_info(struct pci_dev *pdev)
>>   
>>   	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>   		 survivability->boot_status);
>> -	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
>> -		if (info[id].reg)
>> -			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
>> -				 info[id].reg, info[id].value);
>> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>> +		if (info[id].value)
>> +			dev_info(&pdev->dev, "%s: 0x%x\n", info[id].name, info[id].value);
>>   	}
>>   }
>>   
>> @@ -156,25 +178,38 @@ static ssize_t survivability_mode_show(struct device *dev,
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   	struct xe_survivability *survivability = &xe->survivability;
>> -	struct xe_survivability_info *info = survivability->info;
>> -	int index = 0, count = 0;
>>   
>> -	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
>> -			       survivability->type ? "Runtime" : "Boot");
>> +	return sysfs_emit(buff, "%s\n", survivability->type ? "Runtime" : "Boot");
>> +}
>>   
>> -	if (!check_boot_failure(xe))
>> -		return count;
>> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>   
>> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>> -		if (info[index].reg)
>> -			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>> -					       info[index].reg, info[index].value);
>> -	}
>> +static ssize_t survivability_info_show(struct device *dev,
>> +				       struct device_attribute *attr, char *buff)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
>>   
>> -	return count;
>> +	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
>>   }
>>   
>> -static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>> +#define SURVIVABILITY_ATTR_RO(name, _index)					\
>> +	struct xe_survivability_attribute attr_##name =	{			\
>> +		.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
>> +		.index = _index,						\
>> +	}
>> +
>> +SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
>> +SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
>> +SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
>> +SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
>> +SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>> +SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>> +SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>> +SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>>   
>>   static void xe_survivability_mode_fini(void *arg)
>>   {
>> @@ -182,17 +217,47 @@ static void xe_survivability_mode_fini(void *arg)
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = &pdev->dev;
>>   
>> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>> +	device_remove_file(dev, &dev_attr_survivability_mode);
>>   }
>>   
>> +static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct attribute *attr,
>> +						int idx)
>> +{
>> +	struct xe_device *xe = kdev_to_xe_device(kobj_to_dev(kobj));
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +
>> +	if (info[idx].value)
>> +		return 0400;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct attribute *survivability_info_attrs[] = {
>> +	&attr_capability_info.attr.attr,
>> +	&attr_postcode_trace.attr.attr,
>> +	&attr_postcode_trace_overflow.attr.attr,
>> +	&attr_aux_info0.attr.attr,
>> +	&attr_aux_info1.attr.attr,
>> +	&attr_aux_info2.attr.attr,
>> +	&attr_aux_info3.attr.attr,
>> +	&attr_aux_info4.attr.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group survivability_info_group = {
>> +	.name = "survivability_info",
>> +	.attrs = survivability_info_attrs,
>> +	.is_visible = survivability_info_attrs_visible,
>> +};
>> +
>>   static int create_survivability_sysfs(struct pci_dev *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   	int ret;
>>   
>> -	/* create survivability mode sysfs */
>> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>> +	ret = device_create_file(dev, &dev_attr_survivability_mode);
>>   	if (ret) {
>>   		dev_warn(dev, "Failed to create survivability sysfs files\n");
>>   		return ret;
>> @@ -203,6 +268,12 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (check_boot_failure(xe)) {
>> +		ret = devm_device_add_group(dev, &survivability_info_group);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -244,7 +315,7 @@ static int init_survivability_mode(struct xe_device *xe)
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	struct xe_survivability_info *info;
>>   
>> -	survivability->size = MAX_SCRATCH_MMIO;
>> +	survivability->size = MAX_SCRATCH_REG;
>>   
>>   	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>>   			    GFP_KERNEL);
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index cd65a5d167c9..1ed122cf62f2 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -16,7 +16,6 @@ enum xe_survivability_type {
>>   
>>   struct xe_survivability_info {
>>   	char name[NAME_MAX];
>> -	u32 reg;
>>   	u32 value;
>>   };
>>   
>> -- 
>> 2.47.1
>>

