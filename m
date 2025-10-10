Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E50ACAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 04:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B10410E267;
	Fri, 10 Oct 2025 04:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2O7Y4+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CA310E267
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 04:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760072363; x=1791608363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ydHktSV1le2LYV+8dS7WkGjDdA5FmTAN2TrPEZpgAEw=;
 b=m2O7Y4+iSW5TI0BILzXGL24d+Dj19xiCmTVV16SSlfow6HKnQYRcmXFz
 c40x05pcEd/Renkygcpgo6EW3RSbvdLODD2a7D8+yS6Pg41fBczWZj/b2
 WU9LeGlw1m39bZ7CipdV+rK+ELJFHMvp/VebE/OuYbhHfIuTyt+MS1pNd
 lonWzTKE2hYf9UackFoqEeukdCr7U+ghqTk8FnVRJg5Tz+EB58iuNwO2y
 Ai13zbCMHqzzsS2LxKss7S9H6MEJUQkSJWHUuE5XgoEoICzrO9boFXZbK
 9IW0Ncs77giulXnXAc4CSLv2nemPosNFWEyRsgYT1yrYziDqjyr2ng0x6 A==;
X-CSE-ConnectionGUID: 5gjPpdMfT9+azXoxAZ7h6A==
X-CSE-MsgGUID: Gx4q2jjLTBKnO1jUqikzfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62209866"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62209866"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 21:59:23 -0700
X-CSE-ConnectionGUID: YxuoUlsaRoeiQI6JCCsfAA==
X-CSE-MsgGUID: HO8cgRMQR+G17giZf6H+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180576431"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 21:59:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 21:59:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 21:59:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 21:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m09YFYi82yrf7pXDVCFhPwxkYqe6aWC2mzZHTHqYxbVi9UPf/uXz3tuD43rSU9dTm1paMQJbvpbKn1ZcY8DlEKMjwZyW3c95W4gTPm9e7/MJuWfkgsf1Vdy8JvIm2PELKmca6QFzA59Hp7ZZLZojeEY+vx9dZxEagWldDnpbQjLwmQH9n+2V/RwZgQIv/6068pcvxONiR8ImFmt5aYpYm2TgOS353hUZPor9ueD4mDLLjFXiwTMzY7qHGAoSySFraYg1E8bLs8SkkDXS3kS2YB2JWBVlTCQvLHv6CsgzN1Z4uwKrnv1yeTL0NnYYG9lROILbeFTAcb6Dd9ijXXD3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/CUszciflpNnJvrGKl88LoWS8R3565hyspRJ4xGTSU=;
 b=pk9kXXdGxBSqUlmZ9G9tL3M2g5jcA0huQTZdM0dIcJs2eQmu6dHp/ZO0DvaPq6ji19gITuVrmK6Z5Yff7WCDqIX0DLGyFJxAOMWCu/jWus2x51Z7ygLT2lk6gIYyip4RwktNPSWec8uHXfTdujkUv/FnFENzLXnwEkNa0Sa+JFP4EMoklN+FpSbYyNKMks8iHQlDYMn762F6wQNBLFpJdlHxko2X8asNR9f6srHIuBtRFW15SDLIc1v1v0+mZLKUPrVegRvOhyW0XIaD1Wl6xJTNq8yxMi1wj24sNoDIsnF+NaizncfBwEzkSqgpdU3yL8HetDO64ND1fPm7qJ0ORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Fri, 10 Oct
 2025 04:59:19 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 04:59:19 +0000
Message-ID: <94d97911-037c-4d9a-a3e4-9b631b30b9b8@intel.com>
Date: Fri, 10 Oct 2025 10:29:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
 <aOgTgFc_-FgrV9wJ@intel.com> <694610a1-6735-4875-978f-c626e9300050@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <694610a1-6735-4875-978f-c626e9300050@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd49e33-a3c3-4d3f-4214-08de07b9c561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXBYQTJ4WVBBM3ZGei9EZVZtNmhIaDZaZGVrQURmdWw5OFV2V05uOUNoYlRq?=
 =?utf-8?B?RklwQmg0M3RTbWMwRXk4SE1NeVIreXVYU29uWVQwbUFWUHMzNVRNbS9EbVVv?=
 =?utf-8?B?U3VyM25hZUdkNDZiaHVqZG1MTDJ0THFneXZaSCtTSFJWbXVmOE9seDMvaDY0?=
 =?utf-8?B?MEMvN21EbTByU1FrQVVTN09UN2VFOFJUVzBsRjkzR01BRy9CSlV2ZXo4bmJv?=
 =?utf-8?B?Mmo0WU5lUTBqRmtXUUMxb25tZ1plWm9DRUtVTmlyVys1cUVQL1RRV25oZ2l6?=
 =?utf-8?B?UXJoSHd2cXNGS1QxUGNNNURDS3lRbzhRNGI3THlYaHFyb1RBYmJNTUREcGNO?=
 =?utf-8?B?MEtYSU8yOERvYXUxNCtmaDJ6blpKc1ZHT21tcWdSVWIzTXY3MVJLMDdxNENj?=
 =?utf-8?B?RzRCYk5qMVFtcmg0akp2ZzdLMHpnVzMwNmg1R0JPY0FZOXpsR1luaUFhN2ps?=
 =?utf-8?B?R0s3M1FnQ01hVnJYT2RvbjJhbzlwaFdZZlcvdDkySm9jZjI2aXhlaC80Y2Vh?=
 =?utf-8?B?eTY2YmNTeFZRTnhtMTNwOEJkd2dCVHc4TkNXVzVkczk4SFgxQXNNeHNyTkhD?=
 =?utf-8?B?RTlYZlljcnhadEpiOWVHZU81bGtObUpKS1doblE5Z0toMWdBM1JGS2Jhb0tt?=
 =?utf-8?B?bkg5SVhHL0VSZy9QdVlIMER2WVpnV0R4UWkxZDBsYkZGQ0wvN3B5MmxrRDhH?=
 =?utf-8?B?THdBWnUvRTlQak16aFRPcGNOUGlNcVpuYWFyZFpGdDNlRmZ3ZnUzcE1hdGNt?=
 =?utf-8?B?TWlhcHdIaC8zekhpMC9OZVpIdEo4aUVQc082ZnBKUGRXMUQxWGJJOXB6RjU3?=
 =?utf-8?B?YW5pdzVpT0QwcVVtMEFJRS9iOE1BN0g0dzVSV2lZdkhlUkZxU0ltVXhKWVYy?=
 =?utf-8?B?K1QyN1c0RU9CVkdaWWIxVlNUQ1poNkJTMnpiTWNadHN3RHhWWTd1dnp5OHVy?=
 =?utf-8?B?SGpMZVhseDM3eE9GM1B5LzZXbkcwUjFwMnZoTTNjV21BclZwN3ZOZFFwNmcv?=
 =?utf-8?B?d3YyVkVINGwrVHRkVWFoUDA5eitpcDhHRmk5Ums0M3dkbFp2UGZjNmQxZVNO?=
 =?utf-8?B?VjdXLzlhSmNuN2FYaUZ3blgzNW1zZlgvQTNhdWlvV0dtdkVDYkFZMnpJQURh?=
 =?utf-8?B?b3NBR0gyNGUvWnlqaTVUMUJtelhYKy9seFZ6M0VkdmNGeVU5THhxRHRYOGRo?=
 =?utf-8?B?a2p1K2paM082ejFoZ0d2K2toSzUyQnJYL2VvcTdwcFZnMHB4UXpRK0pFU2Fs?=
 =?utf-8?B?TFRmSFRoRVcya3p3SEluS0pUb25sdWIvbUFidDl0NE9nRERpSERpK1pSNzJm?=
 =?utf-8?B?ZUdkYjh0Qjdvb3hIOTNLQWpBU292cWZRUU1HUjF3TG5FTnJTNlhZbzRpMlpI?=
 =?utf-8?B?c3N2L0JERXJXUmYzN001VTFIRDVKWHY2bVlpYlBKaE85ZzJKM2pyWWxGVkFF?=
 =?utf-8?B?Nmg2eTBXWGJUdUR4bnM5aGY1VVR5dTFtZjRZQjBrZTFwMitKNFhlQUt0YnNj?=
 =?utf-8?B?QUVpYjVxeFRGZDZwZndUSFlrV1ZVRjk2NnNLMUJqckM4WTdYSUVoWnl1WThv?=
 =?utf-8?B?M2o0eUdjb2NZKzlPWkRJRWlIeFArUkc3a3Y4TTROMGVYZGcxY3dsWnBkS3Ny?=
 =?utf-8?B?c3hXdnpaMGcrQkdhWU1kLzFncVNIUi8yNGd0Q1BWK2lkNG1vSGZpNUNiMkFY?=
 =?utf-8?B?VE5pdUdtZytRWXYxWm5BV01xdHpUZFZ2MEkvd0ZBRlNYRW9HOVJtZ29mTncy?=
 =?utf-8?B?QkZyMml6OUI4cEVGdlQ0WG9OUDJIUDRIdjIvbFVTWmx5TGp5ek90VEhUUDFI?=
 =?utf-8?B?QnNDaG5kb2lha0J3WGJNQU9QcTNJNGNxSzZIM253amxVMXRhK0FaNXBjeGdI?=
 =?utf-8?B?aXJKc1FQM2NQTjVXZzdOc1pyL1dWVUxZbGs1MHlFbDVUMlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RJL21BUmtnZ1BUOFIzVytqeHFsZi9tVm1wR0tqaG1UMGY1cnpZWjBKVkc1?=
 =?utf-8?B?QzhpM1QvRVIwTDVpUkxURjI5Y2ZtV0h2YUlsNERSVkF4K3M1MXEyR2lDeUZl?=
 =?utf-8?B?d1RsL3V0cEFleHRSWUN1dGNxRnJuWSsyL0tqYnQ2ZFZTbk45d3k2ZzN0Q1lT?=
 =?utf-8?B?TGhwemlXYjYyaVRYcWlrUHREV1NCMXM5VndkKzZMMmsrVHUwaHVkaDhJRjFO?=
 =?utf-8?B?U0FjUC9zSjVZMnJQTC9xWE40Zi9VeXRNMGhMT1VJZEZtVTYwNTd4dDJ1eG00?=
 =?utf-8?B?K0d2Zm9CNXdkYytQeUpMcDk3M1FVWit5REZaNEtFZEMyclU0Qjg2Z1VGcklW?=
 =?utf-8?B?cjRmbGh0ZC82UVIwTHVpT00wZ2pkYjMzRTJGZVZiYWJzWWN3ZUc5WkIvQmQ3?=
 =?utf-8?B?ZUZzN0ZkM1dvVlN1SXBqL2tTcHNOc2FicTZOelU4NzdzV1FaWk1pR1N2ZEZF?=
 =?utf-8?B?SWM0R2dpSzUzL2pRd0xHNnpPUFArS2dHQ3NBZmxNem9wSjlMMkhQT1JkZlJv?=
 =?utf-8?B?dndHam5mWGJ3Q0VpTk82R0l0UGw5c3BPbmczY1ZpaUl2Q1dZS1RHMHhoaXFB?=
 =?utf-8?B?UVlpSDFFVHU2anJBdVY3ellGQ3NyaEJJNW1aR3FySloxOVp4dEZTNXNHZmpk?=
 =?utf-8?B?ZU01SU0yOTdNMy9NZk1YaHVwOGRDdUNsbXFlUmhjQWNDenpBTkxtdks3RW1y?=
 =?utf-8?B?a2lYWnpEQlhhbUoyWUF2MjNudVVmRVprd0RrWmorYjBNb2MwNHNMK2lZUG1E?=
 =?utf-8?B?K2tsR0cyV0NuUDJJWnljcGNNYmpReGszTTg3Z0M1UzgxMDdoOXE5SjVQbkdS?=
 =?utf-8?B?UEhaa2FQeFNSckpVVHBwc0hLeVpYbkY3MU9PQXp3YkxBblQvSzF0Y2lXTnhX?=
 =?utf-8?B?Yi9vTWt5V0hYTkVDa09ZWUtWNWdCc01vTzhjTzQrQStWNXQ0OEFDQU5BZDlW?=
 =?utf-8?B?Q1JjVmZqa2dVWUEvbTBFS3ZmRWFBOXVZM1ZRbnFWRlhyenQxcjhndUY5ZFBn?=
 =?utf-8?B?dmRzdXVDNGR1MWZtUTFlNnZxZjIzMTdzVEt6OHRNQ3o3Lyt6NFUyRitRYm5D?=
 =?utf-8?B?cS9lcjNYVmdNWUk0TGs3MXVEYzdNZUdoM0JSejE0R0FHQk5UZ2JjMjdtbmZ4?=
 =?utf-8?B?eWdUanRuc3pKSkYyQlAzclZjc3pmdmVGbVdweEhoWjFEUG1ZbHFlbXNEOXc2?=
 =?utf-8?B?d25pcGZ0ajJNa1NuSUFMQnFqVm5zVFkzOVZ6c29KUHptKzhpM3grRUxZNEtW?=
 =?utf-8?B?L1BXWDA5VmRGQlVSbjFqaE5TbnR3amQ2SlE3WklzNUNkdGVBTVdqNHRsMFRZ?=
 =?utf-8?B?RkFZcnBuOGtESEF1RFdmNWZvRlNwMjZYMHZWMXFqaEJ4dUp3MVF6ZTg1YWkv?=
 =?utf-8?B?LzZ5ZHNyeTR3a3FXMTVib3laeUxNYmpXZGVNK2lEQXJ4RXdZcGpwT3RWNkhO?=
 =?utf-8?B?QzRrY2lONVV2Ly9kYTVpVno5ZVF1T3BiRnJNTzJPbHo1T01xenF0dWd6d052?=
 =?utf-8?B?NEl1WmQzSUx6NjUyVFB0ek1JMmw1aTZUSWRLSEt1bDVoamIvQnB3Y1FsYjlS?=
 =?utf-8?B?UWVKZ3pQaWpLbll6ME9UT3JqSFpic0pBc2dBSHJwd2VCc0p5c3FUZDlqcXht?=
 =?utf-8?B?TU1iWXhEY2graEMyV1Y2QVBrVG92d0l5MjkyZVFPeVRZNVhZY2QxVWp5WGFk?=
 =?utf-8?B?dGs1SDhhaWV1WVBIMEIvNXdrQmsrRG10WlNWWHF6b240Zlgzb0tKRWZ5S01p?=
 =?utf-8?B?dTdUTXVTYjR4cW0zNEtaT0NxYUkyUWZwSmo4Y1lCOTN6SlMrZCs5clBYeCtx?=
 =?utf-8?B?aEllUlBETlZnUUhnRHNxbGxOVGpSN3VqSFgrSnR6MC9TaDdLYitUd0d2UUJl?=
 =?utf-8?B?N3F5dFJCWmJIN1ppWnR3MEhEc0R4VWFGSWRodGh6KzFkNDJXVkV1RVlaR25L?=
 =?utf-8?B?dzJkWk5aTzBhKzBzcjEvWG1oV1lMWDhtTmFEMFZRUm5VVG9JYXZXVWNMRy84?=
 =?utf-8?B?d1YzWjIxTkEyNVN2dU9wWE5Za3BiUDFPc3FsYXJXa1Q2ZnRQQllDY3prOUpi?=
 =?utf-8?B?K3hPQTZJSzdubDF6cmQ1U1luTnNzSTlXcExCcTRvVXlyTkRubkxVcnV3aFR0?=
 =?utf-8?Q?1NaUyE3fRlz2ZTu/Q7at3W0Nh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd49e33-a3c3-4d3f-4214-08de07b9c561
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 04:59:19.6717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izJicN1TzNX2xqGh3B1xvgbIsPe/nv3AXuCymtB8LFs0tpjXeRqBdcToCnuU0L06yy01VN9tGkQzRjgvCS9Pdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
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


On 10-10-2025 02:17, Belgaumkar, Vinay wrote:
>
> On 10/9/2025 12:56 PM, Rodrigo Vivi wrote:
>> On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
>>> Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call to 
>>> ensure
>>> current RPe values are used when setting
>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 3c0feb50a1e2..ea1ff96bec32 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, 
>>> u32 freq)
>>>        * Our goal is to have the admin choices respected.
>>>        */
>>>       pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>> -                freq < pc->rpe_freq);
>>> +                freq < xe_guc_pc_get_rpe_freq(pc));
>> I believe this is correct... But wondering if we should entirely kill 
>> the
>> pc->rpe_freq ?!
>>
>> Vinay, thoughts?
>
> Makes sense. No point caching something that can change based on 
> thermal conditions.

Vinay,

Consider a scenario where the user increases the minimum frequency, 
prompting RPE to adjust accordingly. If the user later lowers the 
minimum frequency which will be below the RPE value, it will result in 
IGNORE_EFFICIENT_FREQUENCY being set permanently until the minimum 
frequency is raised again above RPE. Is it valid behavior or am I 
missing something?

e.g.

    min  =  100  ign_rpe = OFF
    min  =  200, rpe adjusted to 200+-y%, ign_rpe=OFF
    min  = 100  which is < rpe , ign_rpe = ON

Thanks,
Badal

>
> Thanks,
>
> Vinay.
>
>>
>>>         return pc_action_set_param(pc,
>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>> -- 
>>> 2.43.0
>>>
