Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA18CF6480
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 21:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A092E10E69F;
	Wed, 19 Nov 2025 21:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahhCVtCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B711A10E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 21:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763588729; x=1795124729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d4anI8Zo4s9w88EccUu7UiNFiODbmWXSvhWWB+rRIEE=;
 b=ahhCVtCnEizfoYogI6g1+cvenwZ5NSeHDVTWVVwJiQdh/wxzP1k6JWiR
 qKtg1p1XxEj4tCjizQW/sO/dD4BbNNZZHYPRNUwpKUio/bl8ZufRmIICS
 mHF1Ksygrtap6JRKROi4rXmnM4sFwp6lTbqGcxUkrzoZJsIlqGu0/Np9c
 RzKP7o9p/e7n7EKkOfTLO+LPNJ06kKvIaBl5nJHoIcLfca4kXUBhC3xDZ
 9lA7kMT9lHwO4RAwGFiaR0eRtmy/PUMOBRVRIukAnv/wLUtFijY+US1Kl
 SJR4vfo9Ir6lCdJ7oSaSwX3/+3vjQlG11vluQ8BUlg6bXtEjfQzbl0Mj7 Q==;
X-CSE-ConnectionGUID: nuNnp+AtQqScGrUT2L+6fw==
X-CSE-MsgGUID: V8l677TaTC6I1r4/pbf0xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83269039"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="83269039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:45:28 -0800
X-CSE-ConnectionGUID: m+nkgUZPTbmIk7iR5MhqxQ==
X-CSE-MsgGUID: GD//MmNHTxi6qUo+83GsZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="191975566"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:45:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 13:45:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 13:45:27 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 13:45:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMdaXiAL8jJhaFo+/EFnEIkECLMqNc+5xcwR04uwdQNSbVtpspUtU8irbw6unehs5oK6/AYBeMzKwOTZszlC+ZBVV3O+iuL5tZ1UnNTl8hk0ZwGcnxiLOCZwK0tz7oXz+xmV3Af1UwCwbSfxRK3znBCIVoGrK6VIEq72mmUl+uDAjIZyjF2L+vlQHRKT+1afZtlnrC/O3p6e7N1dDTDnKdPWJkI0wUpyoDYrXJVt2CzEmz1Muxyr2h6y1lF3MX30uWFznugpL+T4JKG8QYufWjKWRw4UISg+279tG+9LVBR7O5f9orlZvhoik9T4LDX6o/zVfo6gvqMiojBfdjTSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfYXyFP+8a79FD6uGbFQEI7BUj2u85hy3im8oJ+9cVI=;
 b=pzbKFkqKH9XEA9lkuz3fT0P4p+ar52kbG7ytJFPYzifcHqhg/yv9iWpoIoR04UP68PkmEymYMg4IrM83FtOZJ2Bixxvz56ns8Pk6FGgInUeSrA4zgIISONqmKEB/sYdZ3wXtcwspi5YRI4DGqXh3L4Gy632dEWtuFmW4waOku720Jj0m9wpR1fCOp0sdTcQsTof1jxLYYvTl/sW4Yy9y/6JlOk5p19C74cVAuVGgFVc2VX/ifibtRGnUMk8g8APY/Y9QeLs69C08fufo6dU+4ujt+RPt9LJva9GlyBlA0i6UPi1B+hIYMsdu25sObGoED88qlfkene9Tz+Ly/dvP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 21:45:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:45:24 +0000
Message-ID: <a9126dbd-04c9-419a-9a33-2891805f2810@intel.com>
Date: Wed, 19 Nov 2025 13:45:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_ct: Cleanup ifdef'ry
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Sagar Ghuge
 <sagar.ghuge@intel.com>, Stuart Summers <stuart.summers@intel.com>
References: <20251118-fix-debug-guc-v1-2-9f780c6bedf8@intel.com>
 <20251119152157.1675188-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251119152157.1675188-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: be231c99-ee33-43c6-bdc9-08de27b4f239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVkvd01idE1HVFU4Qm4yWndsaGpRUWVhNmp2RU5FQ1pZbFRFejY4cEk2UEVz?=
 =?utf-8?B?VFJJNjNtMFhYK1d4S3JRTUZ0VjFVdms4UDZOQ2YxK2ZIOFFsUFpVZEw2UjhZ?=
 =?utf-8?B?YmEyTGsxQ25sY0pNS2NKUmJ1cldRNkZ1L3FraGxoSU00RlF5UWRVUGU0eEVG?=
 =?utf-8?B?Nm1vOUtUZXNKdDQ2dStabml5ZkVzYnlwTXRId2JUR2pRdkJtbEtlT0xjMTlZ?=
 =?utf-8?B?Uk02VjI2TnR3YWkrWkh0c01OWUx6VDB4QWNXWHRad2pOU09PWFQvMjhuL0wx?=
 =?utf-8?B?c2NPTndYb1MyM3B0QnU0bGR3b2V0ckhvZ2lUK1kra0V0bC9ZSEc1bjdUbUVI?=
 =?utf-8?B?bFhYTzZZZG5IZFVSYjZXcU9vWW8xTEcvVnJzQ2dsL0JLVEU3cWlOVzlWSjQ4?=
 =?utf-8?B?WEhjcElaM3JqUDNYYTRjN1grZTZMYm1ENnBnc2MxOUpLdm0xVHpsemNlY2E0?=
 =?utf-8?B?MkIzMDlwTnpRcGpQNUhCdFlLcy84cm5leldYWnpPSTZIZlhiZ0FFeUFpN3FK?=
 =?utf-8?B?dzF6UXBVSEw1dW5MeWplNURGbUVmcS9KbEkzaVhJckh2a2RtQjJDdG1PNngr?=
 =?utf-8?B?N0p0eElBT2M4elhEbW5ieVhYZEUvMStIUzNqekh4amNSRzRSZVdVbmRHV2hD?=
 =?utf-8?B?WDg0RW1RRjFsalloN2E5ZkVQYm53ZTlNNUFDRms5a3Rzby9xREFWeXhLRktk?=
 =?utf-8?B?TDNramNjdGZlVm1PY1pNWjlGZ01NZm8wbElzejVLcjRaSU52UytaeXQvOWdi?=
 =?utf-8?B?RmRkWTFRUGR5cTREcld2QUJlOVF1ZUpYU29yTk44cFVVU01LeXpobmVFV3lV?=
 =?utf-8?B?RGc0UEdHcXY4NzZXdG5RaUJCWXN0TWJxTFVMMFh1MjJzeU5PZ0l2Qklpb1A0?=
 =?utf-8?B?Ly9LalgwNVk5RDFLZytYMkp2ZDVYSkdBNXdJWWw0a2RLR3o3Vm9vb2pBYlJt?=
 =?utf-8?B?KzYrYjZUTVl3VlY3RVJpdEg4WWxtNUdRbmZxT3FubS9oRy9vSnQ4K3JkdVE5?=
 =?utf-8?B?ZStoVkx5VXRiR1FLRnYrZ1RFUTI1OXAxOFIvc2pBVGN4cnY2Nlp6Z1Y5SkxP?=
 =?utf-8?B?MHdHcHdHUlhFWTY2U2E0V2RJVXR6QnA0cHMvRTd2dUVyMldGRTFOeW1NMEJQ?=
 =?utf-8?B?dWNVd0dYZWRKVGEwVmNTbnh6WVJkV0szQlpqdmVpbEo4SzVIeVJIOFZhQWtr?=
 =?utf-8?B?VndHV3lnUHZUZ3NIdHhyMHFRcW5hd0R6RFo3L2ZuSHBrQVJNakJjWHkwSUJv?=
 =?utf-8?B?OVdsQXhwWTFMSm00VDFXeXFFMk12Sy9pWERrNGdBOUV1QlBhZWRZSDF4c3Y1?=
 =?utf-8?B?dnpyaWVzOXlLai9kcXc3Y0xmZUNyYmt1dU02a1Vsb1lhRU0xVVZScXJQSkJz?=
 =?utf-8?B?QTBLVmtYdHlyYllmTytZWk5vVi90aU94eGg2QXRhRVV3c2xOTndyUCtWajNy?=
 =?utf-8?B?TmlpcGxoYStvSWt5c2tzekQ2WDNKdjlHVzM1Z0liZ2J4NGZ3UmxrVUdMT1ow?=
 =?utf-8?B?ekNwWlorS1hFRkJucjRGZUJvKzVkR3AyeTI1RDNSQUVrRTNacGIxR1hxN29u?=
 =?utf-8?B?UTR3Q3VmaHZyaWhkY3h0Q0tCUktFUHVzYmIvQ2F2TjQzYmZxZFRkdndoNzU1?=
 =?utf-8?B?NFFHZllpUGNpd3JtNytBL3V4b3QzVFNoSERzL3l3bnZnZ2VpK3lTdkUveksz?=
 =?utf-8?B?WjZxdUlGQVI5aUIvRTRabDlNQlRDRE1MNGpFMHF3YkhUcTFDd2l2cjV6U0oy?=
 =?utf-8?B?d1A5TVpIbjkvbDI3bncyekhOWWZHaGdaZE1rbndjVkNwWm0reHhrbk1VNit6?=
 =?utf-8?B?SG1IelA3aE0xUXNkTURkRTlzYm5zMTdlYUNhRExUdWFTRnJGajJRTldONTlR?=
 =?utf-8?B?MHU4RkNVM2pleEYwaHozSUk4ZEFjWTBBM1B3RjZ6TUlGZHhuSUF6Tms4ektp?=
 =?utf-8?B?QURNUmt4RVVpMERIMWhRQWlWc2NEbmtpWm1ockllZ3ZXRVA0SlJhMHlmSVNC?=
 =?utf-8?B?c1VxR0tmSHlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z05NMEdtbi9BNENndmkrQ0xsdFdna3NWNEw4QjdoN2JHeFZnREhpdlNSQkVG?=
 =?utf-8?B?V2RKcUg0TFJ4Q1plYlo2Z1VvMWNidm1uV0JWQVh3dE9PbllPd2w2cGdtR2Nn?=
 =?utf-8?B?K0UvV3VaaE9PT09Ba2NnMDBFY2J4RWZKQllGUTBwYStTT0htYW9GVFBrbUF2?=
 =?utf-8?B?TU5wUFNpeVFsdUhuaGxJU0tvTXhFaUNlL2NLY3BHOVoxcHNrRG1VQW4ybjBi?=
 =?utf-8?B?cG5qVytiM2FrTnJsNkRhM0Z2M0thSlJ6L2dmRjhGK3hzSklVek03cDNrdndr?=
 =?utf-8?B?UFR1YUlmVTlQZVp0dDduRUt1SFU2anUyNUNCYzlkTEQzK1BsUmZBWjNmOVhj?=
 =?utf-8?B?eVNGTUNVZ3JQZmRWUzUvL2hXTWxXRXhadnd2SmFDbDZTaVI1WG1VQkYzZzB4?=
 =?utf-8?B?dkJRL1RpaDVLSGhVWmhnZkN3UVNvYWQxS0FWM05COE1GZUFGU0dpK3NYRlkz?=
 =?utf-8?B?Q293RWRMYm5ER05vV3pQUjI2VzF0UHhGWWxWZmVPQ3ZxQ0wybGRUWE5kZGRL?=
 =?utf-8?B?MEN3VkdLRWF6Z2JjQTcxK1NSNXUxQURTcS9YSFgxRk9Nb2pkZkZyVXQ2cWdo?=
 =?utf-8?B?T1dOdUVEMTcyNVBRcERqVVNLMWVOR3pzUHptZXd0dFJUajZYdERqTXoxdDAy?=
 =?utf-8?B?d0xXM2Eyd1lZcnBzRzlsUC9XcGNueWxZUmxKaGd2c3BZVk1JdGxkdHFpcS90?=
 =?utf-8?B?dmQ5cjkwMTZwZVhBcGcwRzZXMjZXbHVCMnBBSk9VU0xvR3JtMktWRk5BRWVE?=
 =?utf-8?B?TUs3VkVRZ3hVcUtoMVVBRG5YcE5ZeXlBdVhpQ3h3bGNyTXRUUEdIYkpocUNv?=
 =?utf-8?B?ZG5YRTJvaCtiQlFja1gyMlU0SlJ2ZmdmTlNHYzZVdDZ4VkV5dXFlcmNMTDBt?=
 =?utf-8?B?OWJDenBPUUpvU1hSbTlNRTdwbnluYWZhaERnaHBCNk95QWNjbnJUZGR0eWl0?=
 =?utf-8?B?NmhLb0p4S2s3V3RTeVhmREJuQmNQamNRN3p0RkNZUmFlNFBXVzU1OVdYUFJ5?=
 =?utf-8?B?QnZleE1BU0pCYTRUSVY4enJYODhYODRYMXdLT1N1ZVgzRWNvcG85eUR2MXNa?=
 =?utf-8?B?bGFmUHcyaWxwNW9KMWY5NkZGMzdTTHdPc2FHWkptTEpUVTFoaGMvUG5EQUwv?=
 =?utf-8?B?MTBuRlpFRzFQT0NUdzl0MkxTQk5lOUpyckVta2Q3RWQyQ29KOHZ1TFN0eHVJ?=
 =?utf-8?B?RkxkdXI5UWo5SmdNdUFUa0hPdDhmL2IxTTUwQWZoamJyWmgyWWVFcTR2T0JO?=
 =?utf-8?B?WmNZbGl1UEZBM1ByeFo0QjBrWmJMek5nWFRsaW5GM3pTdmVqTjRPd2NMdEV4?=
 =?utf-8?B?TDJsVk1wbC9EaTNUc1FsMDZjTnFmd25KZWYzUGtPaHl1MGF1dXlYcUNHUk9x?=
 =?utf-8?B?bkx1MThReHpHUkNVNGNRZ1VTbHpkclBOdTVmVnVpT3E4T3EwZ1lGeG8zNk9D?=
 =?utf-8?B?aTNBaWNVa1ZkWkpTR2Jsa1FaOXhyUUwvR1VXTWl3ejBlNGl6eTBPdmcreURL?=
 =?utf-8?B?QzVqdWdSRHZSY05KeUtYMlI4RDUzVTdDU3J4MG94ZjhtSnQ2R0dtS0NuemxF?=
 =?utf-8?B?V1U3UU1EZWJEWWEwam5sSEgzYVBkQ0p4ZHdkRG5KUmNRSXQvRUlRam9rNUJM?=
 =?utf-8?B?UzF3a09zcjlzckpZbUhSQkNjdXdvbDZ6TVZjV0lNUmxibjlZVzFJNStoUy9N?=
 =?utf-8?B?cWczRURucEtTNXlkYUNVZ2plaExDbFIwSEpQVkJQbWRxa0dBNmxOck85V2N3?=
 =?utf-8?B?Uyt0QVFmYjdwN2d5a2hVMEZnNkJJTEc1UnlrTWpzQko3RlRFNm02bjZITlgx?=
 =?utf-8?B?TGI0TXJFZ2o1djZKMS9ReVcyREJBei9BTE0wd3JlSFVCbm5rZjRnR0t2SVpl?=
 =?utf-8?B?bWxLdkxlN3VmT1RtUzBJZTNZWmxVTFRvMEdHTXdwQzEyM2R1SjdNM01yWWg5?=
 =?utf-8?B?TXk5VGFwcjFOdW5idTlkQmtUSDNoTlkvZ29YS3RuWlRoR21rYitTZWVkUm5L?=
 =?utf-8?B?a1ViS3RWZGpmUEZleCtmL0FsdzBieGJWRUNFY3c5VlVva3I2SEJGalFJVW9w?=
 =?utf-8?B?WnhJcTlCbVlDVFBxYWpiZGdiVGhkU1VOTkRMWGFMekk3R0xibGFrYzhlSFFV?=
 =?utf-8?B?alJodHlWU0llb0p3cTNNUktuLy81d1hSWGZSQVNhc2RKRmF5Z29vWWVvRGZM?=
 =?utf-8?Q?hdNqAjJXJOOHT0Vh8Mc8Tuw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be231c99-ee33-43c6-bdc9-08de27b4f239
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:45:24.6842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrfK2DQ2qltSTiV9X+k0AEvH637EvUgej9sBwT1JiyorGvC2J26ZhEBAkMlBFOBDesOgU8E2FZ375bhJ6+pZwekY6DntDrWzGTAijUQYNvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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



On 11/19/2025 7:21 AM, Lucas De Marchi wrote:
> Better split CONFIG_DRM_XE_DEBUG and CONFIG_DRM_XE_DEBUG_GUC optional
> parts from the main code, creating smaller ct_dead_* and fast_req_*
> interfaces.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Fix build with CONFIG_DRM_XE_DEBUG=n
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 206 +++++++++++++++++----------------
>   1 file changed, 106 insertions(+), 100 deletions(-)

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 07ae0d601910e..ccacf3a5da829 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -42,6 +42,21 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct);
>   static void guc_ct_change_state(struct xe_guc_ct *ct,
>   				enum xe_guc_ct_state state);
>   
> +static struct xe_guc *ct_to_guc(struct xe_guc_ct *ct)
> +{
> +	return container_of(ct, struct xe_guc, ct);
> +}
> +
> +static struct xe_gt *ct_to_gt(struct xe_guc_ct *ct)
> +{
> +	return container_of(ct, struct xe_gt, uc.guc.ct);
> +}
> +
> +static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
> +{
> +	return gt_to_xe(ct_to_gt(ct));
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   enum {
>   	/* Internal states, not error conditions */
> @@ -68,14 +83,101 @@ enum {
>   static void ct_dead_worker_func(struct work_struct *w);
>   static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
>   
> -#define CT_DEAD(ct, ctb, reason_code)		ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
> +static void ct_dead_fini(struct xe_guc_ct *ct)
> +{
> +	cancel_work_sync(&ct->dead.worker);
> +}
> +
> +static void ct_dead_init(struct xe_guc_ct *ct)
> +{
> +	spin_lock_init(&ct->dead.lock);
> +	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	stack_depot_init();
> +#endif
> +}
> +
> +static void fast_req_stack_save(struct xe_guc_ct *ct, unsigned int slot)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	unsigned long entries[SZ_32];
> +	unsigned int n;
> +
> +	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> +	/* May be called under spinlock, so avoid sleeping */
> +	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
> +#endif
> +}
> +
> +static void fast_req_dump(struct xe_guc_ct *ct, u16 fence, unsigned int slot)
> +{
> +	struct xe_gt *gt = ct_to_gt(ct);
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> +	char *buf __cleanup(kfree) = kmalloc(SZ_4K, GFP_NOWAIT);
> +
> +	if (buf && stack_depot_snprint(ct->fast_req[slot].stack, buf, SZ_4K, 0))
> +		xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s\n",
> +			  fence, ct->fast_req[slot].action, buf);
> +	else
> +		xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
> +			  fence, ct->fast_req[slot].action);
>   #else
> +	xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
> +		  fence, ct->fast_req[slot].action);
> +#endif
> +}
> +
> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> +{
> +	u16 fence_min = U16_MAX, fence_max = 0;
> +	struct xe_gt *gt = ct_to_gt(ct);
> +	unsigned int n;
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
> +		if (ct->fast_req[n].fence < fence_min)
> +			fence_min = ct->fast_req[n].fence;
> +		if (ct->fast_req[n].fence > fence_max)
> +			fence_max = ct->fast_req[n].fence;
> +
> +		if (ct->fast_req[n].fence != fence)
> +			continue;
> +
> +		return fast_req_dump(ct, fence, n);
> +	}
> +
> +	xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x, next = 0x%X]\n",
> +		   fence, fence_min, fence_max, ct->fence_seqno);
> +}
> +
> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
> +{
> +	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
> +
> +	fast_req_stack_save(ct, slot);
> +	ct->fast_req[slot].fence = fence;
> +	ct->fast_req[slot].action = action;
> +}
> +
> +#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
> +
> +#else
> +
> +static void ct_dead_fini(struct xe_guc_ct *ct) { }
> +static void ct_dead_init(struct xe_guc_ct *ct) { }
> +
> +static void fast_req_report(struct xe_guc_ct *ct, u16 fence) { }
> +static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
> +
>   #define CT_DEAD(ct, ctb, reason)			\
>   	do {						\
>   		struct guc_ctb *_ctb = (ctb);		\
>   		if (_ctb)				\
>   			_ctb->info.broken = true;	\
>   	} while (0)
> +
>   #endif
>   
>   /* Used when a CT send wants to block and / or receive data */
> @@ -112,24 +214,6 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>   	return g2h_fence->seqno == ~0x0;
>   }
>   
> -static struct xe_guc *
> -ct_to_guc(struct xe_guc_ct *ct)
> -{
> -	return container_of(ct, struct xe_guc, ct);
> -}
> -
> -static struct xe_gt *
> -ct_to_gt(struct xe_guc_ct *ct)
> -{
> -	return container_of(ct, struct xe_gt, uc.guc.ct);
> -}
> -
> -static struct xe_device *
> -ct_to_xe(struct xe_guc_ct *ct)
> -{
> -	return gt_to_xe(ct_to_gt(ct));
> -}
> -
>   /**
>    * DOC: GuC CTB Blob
>    *
> @@ -199,9 +283,7 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_guc_ct *ct = arg;
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -	cancel_work_sync(&ct->dead.worker);
> -#endif
> +	ct_dead_fini(ct);
>   	ct_exit_safe_mode(ct);
>   	destroy_workqueue(ct->g2h_wq);
>   	xa_destroy(&ct->fence_lookup);
> @@ -233,13 +315,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>   	xa_init(&ct->fence_lookup);
>   	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>   	INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -	spin_lock_init(&ct->dead.lock);
> -	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -	stack_depot_init();
> -#endif
> -#endif
> +
> +	ct_dead_init(ct);
>   	init_waitqueue_head(&ct->wq);
>   	init_waitqueue_head(&ct->g2h_fence_wq);
>   
> @@ -747,28 +824,6 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>   	spin_unlock_irq(&ct->fast_lock);
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
> -{
> -	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -	unsigned long entries[SZ_32];
> -	unsigned int n;
> -
> -	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> -
> -	/* May be called under spinlock, so avoid sleeping */
> -	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
> -#endif
> -	ct->fast_req[slot].fence = fence;
> -	ct->fast_req[slot].action = action;
> -}
> -#else
> -static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
> -{
> -}
> -#endif
> -
>   /*
>    * The CT protocol accepts a 16 bits fence. This field is fully owned by the
>    * driver, the GuC will just copy it to the reply message. Since we need to
> @@ -1338,55 +1393,6 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>   	return 0;
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> -{
> -	u16 fence_min = U16_MAX, fence_max = 0;
> -	struct xe_gt *gt = ct_to_gt(ct);
> -	bool found = false;
> -	unsigned int n;
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -	char *buf;
> -#endif
> -
> -	lockdep_assert_held(&ct->lock);
> -
> -	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
> -		if (ct->fast_req[n].fence < fence_min)
> -			fence_min = ct->fast_req[n].fence;
> -		if (ct->fast_req[n].fence > fence_max)
> -			fence_max = ct->fast_req[n].fence;
> -
> -		if (ct->fast_req[n].fence != fence)
> -			continue;
> -		found = true;
> -
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -		buf = kmalloc(SZ_4K, GFP_NOWAIT);
> -		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
> -			xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s",
> -				  fence, ct->fast_req[n].action, buf);
> -		else
> -			xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
> -				  fence, ct->fast_req[n].action);
> -		kfree(buf);
> -#else
> -		xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
> -			  fence, ct->fast_req[n].action);
> -#endif
> -		break;
> -	}
> -
> -	if (!found)
> -		xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x, next = 0x%X]\n",
> -			   fence, fence_min, fence_max, ct->fence_seqno);
> -}
> -#else
> -static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
> -{
> -}
> -#endif
> -
>   static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   {
>   	struct xe_gt *gt =  ct_to_gt(ct);

