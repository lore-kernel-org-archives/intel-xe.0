Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D4D1AD53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079A310E12C;
	Wed, 16 Oct 2024 12:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J74a0W3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356510E12C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082165; x=1760618165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m2tkVxrWZS+i2NhMKqTLS1zOQit9UDcZtr9WEbHP+Ek=;
 b=J74a0W3qlNTyk8i0yguq/ZW/KDBNxlF7joHkntoZi+/TwOkWS7xHTo89
 Sq32PnD85cUU0XYK/jlR3lI7CJByV7krfSjMPFK/Hvie3gi2l3DI5mj/w
 J6L0GMixvsfwnwbIqDbToFM36osYI20F7WGwQtAPFrmOC4xOeN1nqBbOv
 PFPJmiQoRYLK0BO+whMNaeAWfBoQ+fhOOU9IN6G8CwG4UMUTG2KSAR9cd
 pM+KkMqHzvjFa7jODMWPKD7kmOyrLcN0hhXvBG6Wv+iE0hZ4r50ij/eyy
 Cm9Tb0CeFxKKdN1yyYTjFJGPgWJlOaGzpQgTMcTlbWDuit4IdPGRg1U4C A==;
X-CSE-ConnectionGUID: TVxjrsXdTOqrABBG3+jzaw==
X-CSE-MsgGUID: VZaYplp3TkecwfQOlbZGQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32324614"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="32324614"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:36:05 -0700
X-CSE-ConnectionGUID: sty8NZhPTLuHRa4ccLdjBg==
X-CSE-MsgGUID: 45JVjQnvR0e6B3cfDWsCKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="83291089"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 05:36:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:36:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:36:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 05:36:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 05:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucPvY306yUTergXVVbWPTQGlkeTQobLfOa/PzquwITlqKkxEA9gyy9XsVEE1WzzRyXt3k6Q6gXib+E3mCIM/eh3DAbQ/k2q08L1MIZtwBk4UXNJIoBllwxHz4hqURsYQfGDQ8P7hzyAWPyFIRznTEqmTX5DYYYwVFOuej5oJSMtKFgUvvBORC1yldrKm6rbiEF6n3mkSRoJXwabhAWjGVCHB5XmUdzp1dYXaUrHQB2+d3afonIRB4aa/w7pyzrIn/bSA/m2LpuNf0KraT3BxsTyv217CkSgVT0wzGsm/Rt9qJ2AGOlNuKJT6hN0o430KeAMh5x/alATleq9Di+v+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q3GWzVUey36XXnpeniC4KUIARvEXlekmB4QFPZbY6o=;
 b=jVBQsFYeEoneBjZrKGDcV57ZxPEfmQX58todTU4ZrKxIxf5IjwET7Buw+Op1EQWtAANF86Q706hIc7sxV6WtrjrGguhV71ZInK5C7QazMMxd9GGznRHYIuPpABwp5V/Yf7+nX7V7TzjwboJxWwlQS+5tjXVZW8SgT9TV7t7wd1Lg2GZrTnwVOS7WsA+BnEm8ZN6BIttRP/zj+GywuEFfXUcU8RV+Bclo2ntLp0kSjqxM2l/Q1IAs78ONpxJssM4pw2gC94LI6/ZYjG5+zh9LUvBLPZeriviDm7c9Fs3RXDY0roUKGnZ1HGcMDGJp+RzPuYKEifpzQhiGS22bvxoXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 12:35:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 12:35:58 +0000
Message-ID: <dc1098fa-836f-4c24-89f5-36fa7c86ffd0@intel.com>
Date: Wed, 16 Oct 2024 18:05:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/26] drm/xe/pat: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-20-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 217d254a-3852-4730-dea7-08dceddf15cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTBhWTdRbkN0OHpZcEJwMlNTYXRuOUdFSHJmd0NhRnBDL2RvRDJwRTVqbnQx?=
 =?utf-8?B?MGcrTjdEVnJxc2ptVnVvZ3pmeDBqa3o5aFVzOEwxL0MrNXZXc2xiY0IyZlJQ?=
 =?utf-8?B?aWdlRXBnbGl1WVlyK1RxNWpXOEhVSGF1aGcrdWdxSEFXZTZ6ZktDM1NWaFlM?=
 =?utf-8?B?M3BFR2dMT2hGd1AzRW1KdlYzQTM0MGtrVTVUdHFXTXBEVnFZYjFCSkRQUzlH?=
 =?utf-8?B?N1JNRUNLb2ZWOTF0YkF4Qk50bVUwRmpSN3YweWR2cmdzUXpRcFBqMkw0T1or?=
 =?utf-8?B?bnVQc1JBMkpYK203N1o4R0w2Szk5QUtKLzFGUERPZmpHRGRVQkxKL2hQU29w?=
 =?utf-8?B?YTgraGxYelhPMkhiVC9GbWxHaWhLMThqRE9WakpDbXpNVU0xYiswU0lWUWpo?=
 =?utf-8?B?QmxyWVVPSGhSbGtjRGRiNVJSSHlQQ1AwMGpydEovazNKOXo5Mmd3LzFlbGpB?=
 =?utf-8?B?dHNZVzVCRFdUZkZjM3haMW1TS3lWM2VFR25LcW9RL0FnRXM5c2VYTlBySDVm?=
 =?utf-8?B?VFdhd00yN0VvWFpMc0FobTh4K3ZzZ2tJbHBBN1VUY1h1S0JvVHluVTlnZnBr?=
 =?utf-8?B?eEdsNEN4Rk81UGU1Q3ZhOVFtL2hnT1djdEQwTTgvTUdMbW5LaGdkQ2tpT0dl?=
 =?utf-8?B?Y0tqckhuVUQ2UTV5SURJRkRQcGZRWnlUMGNPVFd1VzlDN1ZsYXdZb1o1V0Zy?=
 =?utf-8?B?VWlTRWJlSHFiWnp5bEpiQy9idG5JTVhtVkhxWms2Z291WGhva1FUMjdWZm1Z?=
 =?utf-8?B?d1Z0R0x0aXhDWEtrMjFQVDZ0T2ViMjZGRUhJcWNpb2k5d2JpMklQT0pjaVM3?=
 =?utf-8?B?UW83dXZVcW1lSmtWQis4ck41Z1RtY0NjZnZqTTJBNTlpN2VwakhMYWVITXpo?=
 =?utf-8?B?MHFBUS9CYlJIc092QzJZc3k5SExVMjhrV0QyR3NqMFR0SkZXdkZUQThTUnlo?=
 =?utf-8?B?dlZGYnhrbkxOK1FZZ21xckdPMTJnZCtEc002Q0F2eUFCeXIyeTVBRVJqUFpH?=
 =?utf-8?B?ek9MZ3pDUUZ1Tit3bDI0SSswVTlkMW5XUnI0b05OSmd3cFg2SDNNU1JSbjQ3?=
 =?utf-8?B?NHlqaUZyTHZmajVEMEZKZGV0d0NjQ01mck03a1JMTUpvTHFadmtjdnBkM3U5?=
 =?utf-8?B?bTJ5MHVBNTFLRzN2ZzR6YTk4eHNLUEZZK01iQzNQNFUyangydFNuMjNSSGw4?=
 =?utf-8?B?MlpwczBLbjFHQnQxblVtYUpaNE1KNzZ2WGFBbEdWSHRXaTBha0VBTkVnWWFP?=
 =?utf-8?B?REhySUh0MEFpd2ZFNGRSWTlqWkNmTWYvWmRvYjlWQzBpNFU1bWsyN2VodzF6?=
 =?utf-8?B?K0g4TUdrdmJTUlB0UktGaDNFY01SZ0dMR0o3S0NuWk1iMWRJQ2dkdTVrYlJ3?=
 =?utf-8?B?WFZNYTNEU2syblprREttUWsxVFFhR2tjcnhWb29xOHBTd3NrWUhXZXBXQ0VV?=
 =?utf-8?B?SmUvQ2Zncm43Z015L29pQXNWNFMwNzB4RHBlbTZiV0xYQ2tlVzdQMkRhZWFk?=
 =?utf-8?B?dVJUT0JOQjE5dTB1NlFNcmxMS1BHYzhrd2g3SmVTSThPY1RPWnhjdzZiZHNs?=
 =?utf-8?B?TlRYOXBRWFFWcTZlOUFJVmM5RldDQWFFNnY4aklNWitHTXlOV0tFWlRKelJ1?=
 =?utf-8?B?NEkwKzVGVDlrVXFrMzBaNEhWd3l3TEZBYm9Qa3ZDVU1KVnNhQzFCMXlMOU92?=
 =?utf-8?B?WGxrc3NjOWo0ZnloQnNaVGVqelE0M09aVGJUZldqZXNsU3g4Qnd1S0N3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHo4a3lYekpUNWd1Y0MxVlpkUnVKcFpWeWw4M1UvSzJna2NYUDQ5MTR0RWxF?=
 =?utf-8?B?WEhZREJEaTlGZjd2TFRiRTVMUGxhRmZsQTJDY3JjVi9aaTRHTzRFU0V3eWZF?=
 =?utf-8?B?TElQbmRHcU9TWnBHVklyZC9JMmFpTFZUMnlmdDd6d1ZUakVqZWZZZ2p5clEw?=
 =?utf-8?B?NjRiRTREem1hWS9uUmc2NU1HZFdxTWlBaVA1WnNiTXY2aHlNd2k0T2k5dHZm?=
 =?utf-8?B?QlpnM1poNlEwbTYxZjdVQml3ekhCN2ppZGZJYk9DZHRXUzEzUDlOdFNzL3Mz?=
 =?utf-8?B?QW1HR3QxdWYwbmg2bitGZUtsR1FIREZGNDJhME1WaS9uNEFGbkFFNzZFWWNv?=
 =?utf-8?B?dW5jNCt1Q0h6Y1dGTTFnTXQrd0hvckF6N3ZzT2ZsTFNkNDdUVVVlcnFkTUZq?=
 =?utf-8?B?U3p4TDVwdkhremNJUnZrd3NsUEY5aXJQRUJ0UXNveEJjVVRPcTUyUVJZOVpl?=
 =?utf-8?B?bE4xTmxEVHNwMnlVMjY1M25tR3RCLzd6YlEySUlkcEViWS9EYW90SHl3bk1Z?=
 =?utf-8?B?NTJsdTB2OWtnQWV0V0lTU3cvOFh6NUVlbHU2UU04T0pPTWd3YlFTdGNIeEho?=
 =?utf-8?B?NEtKYmd6eGhpZEhMd3dWQkptL1J0WnlhS1FWaGE5UEpUc2E2akxNV0o0VlZ0?=
 =?utf-8?B?ZXVKNTJoM3FrY0kycExpR1JiN3MvU1UrQi9zcWNXRmM0eTJTMkNBWU9iZXZq?=
 =?utf-8?B?TlVMUnZkZG56dnQzSnJKUzJTWXpqUDI3NVJ5MCt2ZkhGb0RHdmhjejdOMWNX?=
 =?utf-8?B?ZVhlZGNoOVYzT3pRdi9BTjN0TGZ3VXp1OVFKd3l2VDR5NnQzT09TKy9PRVpk?=
 =?utf-8?B?UnVnNzRLN05ENXF0bzhoanV3U2JwUzJwWU1zN09LVnFOc0QxWkc0cHZHSTYy?=
 =?utf-8?B?QitVOHdITldrcHBycTBCOUJXN1Q1a2dRN21jRk5SaUNvdEJiL0JBR3NQQ2gx?=
 =?utf-8?B?SHg5RkgxdlhyQTcremdSanhJVkxOajMyWDhwUVMyYUlNbnNlNmRJQnZBTWx3?=
 =?utf-8?B?Z3QvRURkUFRVTlBTVUQ0b1M0akJUZkcraG8rUUI5d2RhYjc4by9yNzM1aXcw?=
 =?utf-8?B?YTFiNllpTVc3cTJ4dUpUVFBwQVdXbVhYS2hkYnY0N0p3N3lQUVBFVmQ5bThX?=
 =?utf-8?B?R3RDeXhGU3JVbUUzeHdHWFpNYTV0bkJPcjc1SG0vOENQNVhTZTBhb0tQRkRV?=
 =?utf-8?B?TjZyNklDK1RBTGJud21SUlExQ1NkRjlrNzJ5a3k2cUtwbytwLzhwZzZYdGV4?=
 =?utf-8?B?VnEwRTVaejExOU5HNnhDdjg0OGhHZklsL0RUM2dzMFlEaVFSa3Z1S29hcW1Y?=
 =?utf-8?B?TWxNOWxka1NDVG1BbGE3OTRvN3hNcTk0WkdTa0VGWGV6WHpYSDg1QTNiOWR5?=
 =?utf-8?B?S1Z2K0VKOGRpMWt1YlViOU9NeGpqdWdTY21LZjNtTHdnWjR6YWhVSVlZN0Ix?=
 =?utf-8?B?a2lHeldUNE1MRC9PVlBqbWVod0lDMWZhbStWUk5GZHNzR0xRdmpHUXpHOWhM?=
 =?utf-8?B?enhEd1FkYzNKMmtwb0xraVpDOWcya2c5L1Babk5LSExUM0ZudkJPL2tHYUJ3?=
 =?utf-8?B?c2hyS2x6UmZrTzh6OWdib3dSK1lzcDVkalVWbWd3cHhSandZTERFOFJyYU1k?=
 =?utf-8?B?Tlg1S0tGOThHN0x6QjlSMGJlZnBMQmJSR3h5dmVEZjQwMUQ0dTlBcTFuZWI1?=
 =?utf-8?B?R0tvUkxDK0VybmdCdVRuWjQwakJZd0VtOS9LcXVvaVpid2dYL3YxS0xOR05Z?=
 =?utf-8?B?V2Y4Q003WlJYamNvKzV3WHdES2Y5MUlOUS9VLzdCcXB5TFZXZm05VitsSWg3?=
 =?utf-8?B?VDBIcHR6QXJ0d2lyeDljZlo1MjdRYjcxK0I0OU9jQ3owdkJJMVA1cURCSi8v?=
 =?utf-8?B?SDdIb2hJWjZQV3dSRFV3YmVlMGszc0R2ZFdFMmtQMXpTSXVqMU9HZkx4NU42?=
 =?utf-8?B?UDRGRjVOT2QzMlo3WmhFSVBOZmFWMnR6dlRXdnZLYnlhbnJnT0pRS1c3dy9Q?=
 =?utf-8?B?M3ZPY0xqR3Bvdy9uREZEZjlLL3V1V3VUczU2Zm91U01NUzMrSkRuMzhCYkIz?=
 =?utf-8?B?d2FRMGF5UW4wZHIwdldiZm9MRnNzRi9aRWNWQkdERFdFOWlrVVREZ0hBSDdQ?=
 =?utf-8?B?ZXQ0YzZsOTdOQmJQc0VRcnNZdzdmQkFqT3VpU0VxTGVSeW9LT0pmdmVBaDJ5?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 217d254a-3852-4730-dea7-08dceddf15cc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:35:58.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcYLaYeJdPHf8VY9qXtMKJ1rHWwIXT5W9cs7F/1g3ul6NwLcSLULXCW2Sy56HIyizG3Vv59H45+efTy/aIrj6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> - don't use xe_assert() to report HW errors (Michal)
> 
> v5
> - return unsigned int from xe_force_wake_get()
> - remove redundant warns
> 
> v7
> - Fix commit message
> - Remove redundant header
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 65 +++++++++++++++++--------------------
>   1 file changed, 30 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index b16473818173..30fdbdb9341e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -182,11 +182,12 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>   
>   	drm_printf(p, "PAT table:\n");
>   
> @@ -198,9 +199,7 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   static const struct xe_pat_ops xelp_pat_ops = {
> @@ -211,11 +210,12 @@ static const struct xe_pat_ops xelp_pat_ops = {
>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>   
>   	drm_printf(p, "PAT table:\n");
>   
> @@ -229,9 +229,7 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   static const struct xe_pat_ops xehp_pat_ops = {
> @@ -242,11 +240,12 @@ static const struct xe_pat_ops xehp_pat_ops = {
>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>   
>   	drm_printf(p, "PAT table:\n");
>   
> @@ -258,9 +257,7 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   static const struct xe_pat_ops xehpc_pat_ops = {
> @@ -271,11 +268,12 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
> +	int i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>   
>   	drm_printf(p, "PAT table:\n");
>   
> @@ -292,9 +290,7 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /*
> @@ -330,12 +326,13 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err;
> +	unsigned int fw_ref;
>   	u32 pat;
> +	int i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto err_fw;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
>   
>   	drm_printf(p, "PAT table:\n");
>   
> @@ -374,9 +371,7 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   		   REG_FIELD_GET(XE2_COH_MODE, pat),
>   		   pat);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -err_fw:
> -	xe_assert(xe, !err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   }
>   
>   static const struct xe_pat_ops xe2_pat_ops = {

