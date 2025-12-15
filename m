Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A81DD5B85A
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5F810E671;
	Mon, 15 Dec 2025 17:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHqhSUOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445AF10E63A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765818434; x=1797354434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=76nzMjmJ5xN5EKTwVV/69M3jzweAptyHYwXWG9dvWX0=;
 b=NHqhSUOMGsOb+kqJ9gI5+Imkph7iblR47TbzprGQgkimr6oGXNTiF35n
 Sz5IY+lSizjv7a0xdUjGsDHGrKcZe3phJM3ItMmHCWjfM49DVFppTCpCA
 Fsb5oQ7RguLCjTmaOF4grOAcFrQH4DN/K74JkwJ3IusIh8Dzcw92laJsu
 zxTX3qJLVMh14gcSBs3e/6dikcRNIcgYWd3bg6EJqbpFGI3eWATFA51Hh
 lHsYcd3kqeCYKdsA5Oi8OYRV/UpA2NqK/1hCfuu4abdCJn2LxISsJvSUJ
 nkwNU5w3McOX5TYeQtGD1JXqZed4EYNHGSLpz0EuHiVFu48YYvDVqjoru A==;
X-CSE-ConnectionGUID: hJzwg72sQqGzKz2wHSA9IQ==
X-CSE-MsgGUID: LN120MZDSrqlGFrXbOa26A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78430655"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78430655"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:07:14 -0800
X-CSE-ConnectionGUID: 6CjJgZyLREeR3zhoPslmRA==
X-CSE-MsgGUID: aXeS15XWTAqNLPChRSrq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202876068"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:07:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:07:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 09:07:13 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:07:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/wpYYv6EciC0djAekuEPC9EMuIdIenN8Dtqu7ldmP35r0otNRGA+HOvCoAadAQ2EvnjANX600JRxJnfIX3oBQMlFjkaDW0UknzM+TbTw7gZ7MGKSSTS7ZhKOux9uRU6ogwytH5PBTtB8e0qp2sAHTFgK5IOpXWRFDEQQ+zTX+D78k7XfZc0rGSL7NgLFZt98cLuzC2sVrTbwhmngndKtJwgiwPuqaWKz1URtRqBmZVXVTic9z6T2elCwL8hg1/ul3fHELOw6kcUJ4sAAHVg59KwVuJfaa3nVHD4v9oGyWCTOQ60+yIa0C/9DpP/9n8WzdoIzSV7Z7Vv4fR64CmXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf5xTx/urTBiUaLVZbsz/kwuTrmLQsXzAATFOxVDWis=;
 b=bIALDNYZ8BbudF3q6Sk/spULrWNuoGCdrcing+7ZyCppJzYyKH4ATZSlmlL1qfmJTKC1OUZ+NYaVT1WKp7odtpkvrw+AjlCzNLg+dwWwHYCGuC/fqWW0arJ2iUBrJnS1FLmvOca8EIfSG4bx7b8i+e5M0euj+SMSBO2WZMI3TFxwXO/TgqLMMdsq8yjXuTM9K71KG5hNAqgZCPNyI/+UIPe7J778ORO8RGHii4rZTRCgkID3MmenuRqTQOKqYbcN6fnfGZQYnbAzOCqOKc/nnXbwzomdyIv6DDD5FDMWsNeRjYf3djbOV/HxdOFHuzC2IjPT9b/Mcfn+a4Z6+ON03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF213267FEE.namprd11.prod.outlook.com (2603:10b6:f:fc00::f14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Mon, 15 Dec
 2025 17:07:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:07:09 +0000
Message-ID: <16d1dcde-cc15-49af-bbc8-6329de659f01@intel.com>
Date: Mon, 15 Dec 2025 18:07:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST
 helper
To: <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
 <20251215143739.196336-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251215143739.196336-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0018.eurprd08.prod.outlook.com
 (2603:10a6:803:104::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF213267FEE:EE_
X-MS-Office365-Filtering-Correlation-Id: a959b86f-80e2-48c4-5491-08de3bfc61c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXdUd3hybFcyWnpsUmZXa2xDSGxINkNzMzdzRDlWUGpla0FWZzd3TUxWQWRO?=
 =?utf-8?B?UjlreVNLQkZDWThpWHo2NldrcHhPczZsdy9TZ3E5aXFNYkhXeGprZ250eU1t?=
 =?utf-8?B?WGZUQ2FZY2haZ1NRQ2xDZWRsR0FoTWJkTU1tUHJxZEpjcm14SWNkUnB4YmVI?=
 =?utf-8?B?NGNPUDFsdGtrV2dTeHZWZlJRWjFFYjRNTUh6UE5mVGZTWGcxOHMzSGFGeEFW?=
 =?utf-8?B?S3ViYXFxWVBjeFVXL3hnWWFaM3M2WGF2THFaZTRlb0p6SEZnRzlQYzF1Z0Zj?=
 =?utf-8?B?T05MenJWSElzUGZ6cmRRUTNmaTVPNytWL00wTXpyMnRZeTF0VlFtaC9oZWdu?=
 =?utf-8?B?VHdKaEQxRkRkVE5BQkxGdUN2Nyt5dmM2QjVRRzNycmh6cGVpdTZpZmZsVXJ3?=
 =?utf-8?B?RVFyMUJyZUJXMjgvSmNwY0NjdC9CUk9hWTJ3QThVUWkvT2ZuS0FVbzdiMjVk?=
 =?utf-8?B?VHgyaHVuaDZyUnFzYTI5SHJRTnRPZitwTE45QjBBTzFSVjVHRUxucHdMLzh1?=
 =?utf-8?B?NmxFbkNPK3ZJN3RCOHZSQ3J5c2Z6ZjYxUkRFQk5mdTNseDRlaVQ0NTVyaWNF?=
 =?utf-8?B?QTJzVUhLT3FOVVo5MmJJRXMyM3JuSEd6b1lRTTFPZ2ZXZmFBbjZsMTE4WTNz?=
 =?utf-8?B?dW5SMlU2MnJyUUZxODNrbWVacWlkVXBuMTE4L1pycWN4bGtzdWFUd3JtYyti?=
 =?utf-8?B?TXBuNm1XbGN0d2pUVGdhVlBrb2ptc1VTMXVZZ2ZXazBQOGhBbHdFOFl6YXdF?=
 =?utf-8?B?bUI1T2dPWVZjK1FCZ0QzWXNBamdCQzY0WStGTTA0ZXZjNEZ4N25wVkRiQi9P?=
 =?utf-8?B?NmkvNTI4VE1scFpJT05FRUZQb0M2MVpCZ3Fab0FYOEVuK1IzQ0wySC9Mbm1C?=
 =?utf-8?B?ejlZTDZhUGVWYng4bVZvREhGVUU1NkRRUVpuaFJDbHQxVGpWSFAxOUdmNGV3?=
 =?utf-8?B?QzlqRkJqb1ljVDhjOGFIVXpqVDFWYm9PZk40bDNpVGtWdktrVHdNK0dMZzRI?=
 =?utf-8?B?NFVNQ0FMQW9ibzZmMFkyK3NadXFGVE15dngyKzlsUWxRNXNPSHZiaGZabklo?=
 =?utf-8?B?WGNwMVlNRDBuc3hzZjdoSS9PNTZ4a0g3MkFKTWowQVhQdm81cVFnN3ZTeTRK?=
 =?utf-8?B?SWFOMVRRbzRXbVg0RkFYUWtka01TWkE0alU1R3ZPQ1hndnJuVmVaUEMxSEV1?=
 =?utf-8?B?NEtPWjNPZEtaVUdDL0trMjdhSXo5R0NPL2h5MGNwOUM0V3pzUTlzalE1RC9r?=
 =?utf-8?B?ZCs1NHpnekhQQ3p6angxQXZoenR6NEV2STR1UzUwdGpTTVl0Rmwva2pEK1c5?=
 =?utf-8?B?c1puZmttcjJzMVFCSVgwczJKNVZzSmVWMjBIYUJxWTFkOFp2RE5seDhmbnZY?=
 =?utf-8?B?RnR0OEhxR1hjMURKeGdQTFY1YlhLVzlRMmhCMGZ4OWN3UWhuK2lzNEVkektF?=
 =?utf-8?B?bmpLa212TElDVWQzTFpsczNHOTgyMWMrK09MYVdVY1pCNmRBeWxpcjRoanE2?=
 =?utf-8?B?S0ppLzFTLzR0ZzVNaFdUT0xjemVrdGpJVXpHR0VkQXlhVEFQZjZJaVBqSStV?=
 =?utf-8?B?VzNEb0NUSktGYUpIVk1LMnlVWGRTSnpDTFI1STFMS01XQWs5TUVuYjVwVDcr?=
 =?utf-8?B?NTl3YlRFcjJBeklqS0VmNGJJUkJRYnYyV0lEMmpDUTJ0NDVWc0hpS0kvRnpH?=
 =?utf-8?B?N1pqdm8wUGJlQ1VySkJsQWl0Z1hUMXlNL3JyS0ZjbzRKbHNPdU1DbSthMUJy?=
 =?utf-8?B?eVhlRkcyWDY1ZU5ISTN3bjhJOTY3ejl6V2xBRFM1azVQT045WVJBeGR6eDF3?=
 =?utf-8?B?MjRLZmNQdUtmUzVFUXRiY2k0cjVtUzdQNlp6YURYNCtWdjhwTHdGWjhhRFo3?=
 =?utf-8?B?aTMzZHhyNWsreDk1d1BPUi9mb0pRV0xvVGpDbXNDdG94M2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHVpbHJxMTBvRkpuWUVaTFU4Tklkd3ZUR3RIQjBmdG5aSWtSdTlzK0d6YlVk?=
 =?utf-8?B?ME8xbExlcE1MSDFMSjVUTkpqekNtdXJqUGZINEcxbzlhT3N6Q1NMZWcvVGZo?=
 =?utf-8?B?NmZvSTY1QlVQNVN0NnRmM2tpWDJrMit2cjd0THVQZEp4K3RUdXZKa0tldlRE?=
 =?utf-8?B?aXBtTHhVNXJPKzd1M3JjMk8wL3F0eXBxeHVGYmlaY1pzd2lIUWRBeGVtL3pN?=
 =?utf-8?B?VWVkbFN0d3BBaUczaDZZQVIrN0IzbEJMTXhnSEt6ZlBxcTNnV0Q4TWxLVjQx?=
 =?utf-8?B?RWQ2aVhEVWw1QnJvYXBtUVhWTm5XYnduQU9jdjFGcWdtbTJPeVhaUVQzK1dp?=
 =?utf-8?B?WkduYk42aXFSRGx1SHFyTGh4dmRaRlliQTVhUzNHbzhZamNDdGwvVzMySHV5?=
 =?utf-8?B?eUxpUXpTc0lqem1mblNocEpWblVVRnJFWmIrREl0ZlRuQlpJWjB6aVdXMURk?=
 =?utf-8?B?WHcwWWJZeHZrWFdFbktFOWczVmdPQ2ZVV3dDMnhKanFJL2Zlb1VVRDJYWmh4?=
 =?utf-8?B?QzU2NGNJWG9VRVp0Y1JjVVljdTBiQWJRWElZOGkxYmRYVStWdU04L3pJWDZP?=
 =?utf-8?B?N3F3eUtEcFJ1S0pFT1R1NVhWMFlGbFU1amcwR1dzMmJqZjNPUE9yZEpPdmg5?=
 =?utf-8?B?R1NmS1IxNzNzRHpiRi85ZFR2NTRQOHZnOE5NNGEvZGFVcXBIK0VaMzVkRWN3?=
 =?utf-8?B?RlZaaWkvNExuNmNRVjdDN0FSKzRDNXNuSjJQNDJ6OUwzREo2ck1OdkI0YnBi?=
 =?utf-8?B?QkZ0NUVGV29xdXJHdUp2cW1RbWlwdVcvMkVHVHBaeWxZTmJ3VVFCa29pSnJV?=
 =?utf-8?B?SElDNlJ5Q1JFYWRMa3pJYWVXWmdCLy9zR2hObGtCUWIxRDdhODRzRDBGcVNy?=
 =?utf-8?B?RTExSDZ1ZEVlL3owWjV4dThzNEl2eGdMdElRdGJmSFZ5WnppZjFUMmg4TEdz?=
 =?utf-8?B?VEZsZFRvVUFEbVo3S1VwZjAyVWtna3pVWFFjQ0lua0FwaXUrUUkwS0N4Zzcr?=
 =?utf-8?B?UURyYWYzcGYyaE0wdlFxNVpLMlllaFJTa3VaN3pmdE1ZSVF6T2w3d0wwSmVZ?=
 =?utf-8?B?QVdDSmFwQTB2RTBQWktaNkpndHFLa2tGWEhIN1dqbzlNQVJoejNnbTRqWVVt?=
 =?utf-8?B?SkJhaDNJUnE0eW04SURkdmZtTUVUTTZwellhTmdmUDFNS3Z3SEhlMEk3MGJ5?=
 =?utf-8?B?bGZuZTQvUGRHcGRqMVNleUZ2cnN5d3RVdGdIUWZyREZjMTMxSS90ZjRLL2Qx?=
 =?utf-8?B?TTBwMGswakJXcGg0djEwQzQxVTRQbTR5dGh6bG9OM096Nm9jamxNMU5veGdw?=
 =?utf-8?B?c1Y5R3g1OFJmeXdYc05zMnp5Tm9GVU92Y1ZkTkhGQ3FnNUNuVzVoTXFmU3o5?=
 =?utf-8?B?WC8vQzNRbmpXR2JRdm9LamNrcTdOR2U5VU10bnViRDB0N3ZrbXk2VTl1am5R?=
 =?utf-8?B?V05QMUFteUFoUGdsNDI5YUdFS0kzYWJvcjJTVVQvZFk3dG96bW9tbzRYZWRF?=
 =?utf-8?B?RE13MUV3ZC9CRGFKZTF1MUhuTmw1TXpCdnNpYThwOGlTOHJzc3FHUzJHa1hP?=
 =?utf-8?B?SC91bVl1Y2tTUlVGMnBHTzVpTlk3WXhCLzVjcDhwNVp5NG9hTnE1L293Um1C?=
 =?utf-8?B?bmJaNGtZQ0dPczlseGN1cmRRL3R5cU1WUnE3b2dydEVFVWt3WE1qZGlya1dI?=
 =?utf-8?B?QjFQelJIWVJWUnlkVTJzZ3RZOWNRWlhEbXc1QTdDbmlEQkJOMW1mb1RmQmkz?=
 =?utf-8?B?UVZnRDdhUGNuUmJGTDRUK1grVzBqczFzNm5EUUJEOTNadDdkby9YeUJqdWJZ?=
 =?utf-8?B?VllxN29RYjdpbUdSWlhKZEtORXNIaWRyemtuZGZ3UnErVUdSeDljNTJQNHVJ?=
 =?utf-8?B?SHVjb1hBN2V3NHNYQlRVU1BnNW5aMVgxaWRZcWh1WjdscnhOeDRMVVJ4b1R5?=
 =?utf-8?B?dVRpUEdpUXp4VWtKVUl4b3pUWlY4b0pjQ0lNandXc2NNM25Fb1Q0UmVaKzFR?=
 =?utf-8?B?WTJxMTY1bWpmUEo2MkFHVnJmcXFLekxGWVFlNTVHendSM0RCU0k2aW1HQWt3?=
 =?utf-8?B?K1I0VEpaYmFBdjhYOCt6QkFvbWxmRkd6T1lCWkV6SURTT0s2WXB5YUp6bDVl?=
 =?utf-8?B?bCsyUTNmem1PclJ5NmtKYloraVAyZ1RtSEJWNTNXdVFERkorK1A3TjV5enJM?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a959b86f-80e2-48c4-5491-08de3bfc61c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:07:09.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNxXFZ6hKMkIdl3D6IGe/Lpnpqfj4l6JTqJj2kcmhv54cMQ/ZzBa8wugGLEbjiTb5aoshJs8blWSQU92uveQaOMv+ArRT0Qyg/53WUp7gMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF213267FEE
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



On 12/15/2025 3:37 PM, Michal Wajdeczko wrote:
> There are already few places in the code where we need to check GuC
> firmware version. Wrap existing raw conditions into a named helper
> macro to make it clear and avoid explicit call of the MAKE_GUC_VER.
> 
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> v1: split from [1] (Michal)
>     rename helper and add new macro (Daniele)
> 
> [1] https://patchwork.freedesktop.org/patch/693953/?series=158874&rev=1
> ---
> note: there is yet another place that could be updated (xe_guc.c)
>       but since it seems already broken (VFs don't know FW version)
>       it should be fixed separately anyway.

posted [2] fix for this other usage

[2] https://patchwork.freedesktop.org/series/159040/#rev1

