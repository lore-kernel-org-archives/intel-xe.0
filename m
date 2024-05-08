Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7DCC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70AD10F6DD;
	Wed,  8 May 2024 20:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ssmpp2lC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15F810FBEA
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 20:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715198841; x=1746734841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6A3TbKbfAgc5G+XIXwdGPRAcfZpCoLdnFhx5U9Qv83w=;
 b=Ssmpp2lCg3MMTfA3oDa0vk4Qhzjp08casSPBR922UB4VIuFMTXL7Fzqg
 xWA0DgbuSUYHsNOXdXnXUjh1pGuVI9jOr6NVN3Mw9COVTeYy8DwwpSBnp
 FpBFX6d+N5U/xzMiK5KMlhG9cojxgpEuYyRSaeEzS3fihgiOAiudPRJy8
 mlMNj9fU9OZdUCsdP4y88QGUXvpJdCWY1/+rdg4btcjlavSGaM/iAd6n9
 1BSj4G+K5HxcYAqq5dz4XDTRD4lGWup9C8NxkQi8h/b17nTTSAhwzl4w2
 pM/rWRDP8oONWa5gbGiJQN0FuuIccTOZjbGAWi/+sdeK9KkFV23CZkgTh Q==;
X-CSE-ConnectionGUID: gKJAet+USpKLkGcH7FYqeg==
X-CSE-MsgGUID: gL9bA93ATsuBuRc2880wEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36466711"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36466711"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 13:07:21 -0700
X-CSE-ConnectionGUID: WWJju748QS2gF5vrSZVHIQ==
X-CSE-MsgGUID: oI9C8CZEQnKk8/s67QBXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33515514"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 13:07:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 13:07:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 13:07:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 13:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejo5sfJPpX/GFSrzm/18rI2FDfPE58HagfAkGZzjcdU/3DINW0hVvXdVS0sKxEFI9eD7Sz0sVo/ys5Wrzl18S5FPp9I6UMpDGj+qi/VyzpOEsLFkLfQVqgkJE/J9HEb33sZRUNa+7qASSDzfwJWJg3dJ401C3+LnG708QvH/gmGXlrT51kqkyqgSksjEv9DZVR1JzsFzd6zmkZRwe6WzFVbi50XgeDhP+ZJ1MsoVwI8Td/J+DzZFtDz15ULQz4OIahQMEcCR5vWwV9hRI7+kj3bDVxN9RLXFNsrCNnPnDBbk1gy1xUvHdbQE7hu71SkF9S/PEfuEJYgf0lAmm1vUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZAUgh5lG7vUr7PCdm2EgqnO6J+y3bP6xwrv/GBhpyA=;
 b=hZRYSwToazFOQVnjqDXPfgAi6aYcWtT81Y/g7/oaYyY3JgVmz+xxOecTRIl5niynEHwqfFZR4TzGXS1+sJ4ylHeS9/qjZFWLxv49F5Zlw2FoFNtQanwrMWd1qI4do/FJuAMfp6SYFZon75zWeO1yKzaiM4mdDylLBedmBezFPeMC6yDfMRcqv7J6oARElpij5Tz8M/dff29WqISrUZwVeaabsr3/7xvn6nV8O/92S+nq1/3H50o+MoJJ7bFXqPW5qpdZRu4B6Zxnf4+tNacYhwVH8kZd8aAK5CL854D6FxarRhFDc4nHHB/8cpYQbNxVSuUoOw+xKIkThis8aluOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Wed, 8 May
 2024 20:07:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 20:07:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/7] drm/xe: Relax runtime pm protection during execution
Date: Wed, 8 May 2024 16:07:03 -0400
Message-ID: <20240508200707.375414-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 264529e1-31db-4725-3412-08dc6f9a765f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmR1L2syaDhqNTZaaUVndkVWYURtSlJsc2F3VndEZHdROCtWTy91MTRGM1g1?=
 =?utf-8?B?a2x1bzMyVUxGR1lpQVE1dUtmZHArRktsVml3cktyTHVydndUc3FNbHJSYTdz?=
 =?utf-8?B?WkJ4azRObGN1dTlHcVJmTVVkS2RrRHA0OVdGSmUzT284L2hpSzU4TjY5a2FX?=
 =?utf-8?B?SXVNY2RkSDRuMmxobXZNbzYwQWJnY0gwa2dyVStzbzJlUFNreDhxZEZvK0sr?=
 =?utf-8?B?UWY4N3NqbWdYOVBxcmoreHk2bUoza0c5dU9GK0tycmt1U3k4MmZ5a0w0RCtI?=
 =?utf-8?B?TVk1WXlVZ2N5YXpXZ05SOE0vTDNHYTBQeHNYYTRmcnpJS0VpM3NkZEdNZUMw?=
 =?utf-8?B?eUxqZjI2Q25YbFFISjFJaVZmT2J2R2NRYnlCUVd4VHpPMWdkUXJyS3FNL0Ju?=
 =?utf-8?B?M1QybFdYVUlyT0JhbVJTaUhPTDdQK0VkSXdEYXdvVHllNjlsVWx1aWRlei9M?=
 =?utf-8?B?ZWxrNkU2elNjSmhMWEM2UTB3VlV3MDVJWWNHb0ZZd3ZCNEJjd3A3dDlCRmVI?=
 =?utf-8?B?UWp5V2J3M1k3SU1QT0s0RWd6UTlOdzVFbkFlbHY5c1JmbFVmSHhqU3poekRV?=
 =?utf-8?B?TitQL0lnSzJQb1pGeGNxVmFLdkpMT1RIdVcrMnhEeFN2UTJXZFZNeXlGei9I?=
 =?utf-8?B?ZUZ0dzdlckxDL3hreU0wYWpzWmpFTzJHa2VuOUg2Sml6dmFjZ2lQeU9QQ3I2?=
 =?utf-8?B?SkxrOHdkTUNSUzBzRDNPS2g1WFJnNzE5M0UxYzNTemVSaXRyQkVZRkR6MkdW?=
 =?utf-8?B?enpBT2RIdWhTTDdlYnM1QTdSV0xYSUJwZWJHcDFseG9Rdy81N1k4NlcxdzZ1?=
 =?utf-8?B?UzlzNDFMR1RXMWlsUTM4dVFBWUtjcVVEVldlcXZBQ3BiV0Qvc1dneXozdUR1?=
 =?utf-8?B?eC92R0gxb3VudDZiNC9sZGQ1b3ZXTlJFVWpyenRQcXpYN2t2dkVYSllWMHRm?=
 =?utf-8?B?SmdzRnlwc1M3cWZRbDY4Y0NsNUUwbnR3REhsL2RJT0pzeXRtdzF5WTVrQ1Fi?=
 =?utf-8?B?V09IbHcraXhZZjhyWlFQWjdONVlhOGo0S2tNcG84RE44SUFtbEh0TzdvVklD?=
 =?utf-8?B?cHRGaVhWVDhJQ1U0MEhFV1pPb2lHcFN4VUtIN1dzVVozcDJ2eklEWnBGMlEz?=
 =?utf-8?B?MGh3andiMi9CV01UR3EweXJjbVZZa2RvWDY3NWV5Ujh4V3ZLR3dxV1JGOWdP?=
 =?utf-8?B?ZVFuckwvMXJjQzZJUjJiMFJQRU1DMVFmcC9zSDZxZUwvbk0rOHNmWmxWQXY1?=
 =?utf-8?B?UDVKdnRURHVQTnJHeU1XaWtXNXhjaktXUUt3WnhUMk1lWU5qclhnYmhSaGEw?=
 =?utf-8?B?SUgxWHdDcGN0ZmUwcmdCYWVFOVo2d29lSDBsOGt6T2xiemErY2hRSCtLNVc5?=
 =?utf-8?B?VE9NeEtLUCtXNGs3M3NNckM1RFBOZVlxb2JMZXVMb2tDbmlMeDNTeGN4bGEy?=
 =?utf-8?B?dnVzZlkxTnpTT0xvWEFwc2FKbEYza3FUelE2U0N4M2JWbkd3VHFCcHJJd3VP?=
 =?utf-8?B?dTA1UUdXZmQydUZwT2RLRUpyQmtTUEVMSlpNNytYeFRWbkVVNjNKZm9oVkoz?=
 =?utf-8?B?cU4vNWw0RFcvOU02NkVIcmoyVFRlUHZqOG9DNGVydm5pWTRBcDVhT0dEY2E5?=
 =?utf-8?B?K1hrZWVnSDlndzhJenVVb1hnNWZyTmlUTDliRmpYaTE3NUJlRkdVSGw1RmhW?=
 =?utf-8?B?bVppcThwSDhnVWEyUnNuSHVGNFBJZVl6amRIdUwzV09ldDFTNEhXU1dnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFQ2ek4vd21XN3V1YUx5MjErcXpmajBEWjFGdjhGamF1RUF0MC9zVWtKNG1M?=
 =?utf-8?B?eU1CVC8zeExnQllheHk2RXBCRTloc3RtbVBtcXJ2VzFjeFZiMW96NlNFdlBR?=
 =?utf-8?B?TVllSmFObjVnZ1pDNFRYZU1pQXJHeUthWTczUXhOa2oyai8xN2d0TTgzSzkx?=
 =?utf-8?B?eGdhWVM4VDZFTTlGRmh4cE4vRlh4WkdnWldIODk2VjhOSE81aEg2RUJ1Smlv?=
 =?utf-8?B?dEdxWjNSV3FCQjlteDV0WDY0U1VKTWlETFNhZXI5UkllUjZlV2xHRlUrNUF5?=
 =?utf-8?B?ckNCZUJ3NFM2SFpncStyVURVN2gwQnl5ZjNCdlV2cmp0N0NJSmtHUjBJMS9F?=
 =?utf-8?B?cnFDbTJQNkFnNEZCa2QyaEI5T3pPZmRyM1RxdDFxMnNCK2w1RThwLzBUSFdB?=
 =?utf-8?B?dUswZXZQd2dOQjluellFL0dkMVhrZ2Nlak9GYVk5MWM1TVVxS0J4MGJLTUt3?=
 =?utf-8?B?akNxWVVCZFRSbEd0VDdTb01nQVo1ZGdQenhSWVlrL3hLVXNsRVl5cjQvVlhX?=
 =?utf-8?B?K3Zlak1CUklmZTJ1OXVubTJSM1U3NVJpYUR4OFlVK3hrZVk4Uk5JbzB0dXU4?=
 =?utf-8?B?QWIxQ1V3NHZZZ2lDK1ZoK1RPVTRnRGFEVVd1cklsTlZEMTlyZ3VtWDJyVklX?=
 =?utf-8?B?aCsvclMwN3Z0TG44TExnU0JidkRDMG5YdmthK1BEeHdMSWRaUjZhRnFPQ1N5?=
 =?utf-8?B?MndVOVBSUHQ0Y2YzQnd5bmJYZGRYVm5mRXUvZzhJU2YvUkRQWEhjT1E4MkJl?=
 =?utf-8?B?TGQ3R3pLREdEMXhHNFVHaEI3RWpLZzA5SE9mU1Q5bmNCYmJPczVJYjcrd3Qz?=
 =?utf-8?B?V1Eyc3NKbktqV2J2OXhraFRUM3F6YUtRTHpBbXBRSFFmbWFuRmNETDk4T09N?=
 =?utf-8?B?eWNoTytiaFA4SDZJVURuV3dyMVNxWlFSQWxOVzZXMEF4Yi9YMmVwV2FqWVBq?=
 =?utf-8?B?TXVvRFBrUWRXSkZvbXBVdWNyUEZIRW11NmF1MVhoWVo3MG0yM0FjMUFEbm5v?=
 =?utf-8?B?cytsV2JTR2hUNDIxU0FuMlZGTEZlalBLMkpMckRYa1JSMzhFSnBGQ3Nsa2py?=
 =?utf-8?B?UXNiaUlHNTJFd2dUKzR1U3puZ2wxa1hBS1c5S0V5RlI1c0VoRExlcStTVGVm?=
 =?utf-8?B?cnZLWi95WlFNbGFyc05jb21rWWR5eVhobUV3VDVMTUs0OEZiTzVaeWpvQlBK?=
 =?utf-8?B?RWZQYmxBMWtpZXlpd1FnNFZydWJIcDN3WHBIcHRnbXBtUFY0ZkN2RVJyM1dG?=
 =?utf-8?B?dXEwaVlwUzFBQnlvcGxDbGJUM2ZqWExQbklUMlA1SkYreEI2dWFFU2puTnd3?=
 =?utf-8?B?S1U2eGdCbDBUcW8wa3Q4MDNLVnI2bkgxMDB3RHdIMVFTN3FLdDRuWkdYb29i?=
 =?utf-8?B?UlovbE0rTyswZ1psRkhhRkF3eDhYWHJWT2RaSEQyeGZPMVUzbnhVbDd1Wmdv?=
 =?utf-8?B?dXBYLzl5VU1lckpGVUN0UTduSFlkeWJ6ckxSUWlzTE9iQm4zdWF5TDNJZ0k1?=
 =?utf-8?B?aVlRTlYrQnp0SS9PT1d3WW1vNDlwK1lKelJrWW9zNnFvTWhlL05nbDV4OTBw?=
 =?utf-8?B?VlJlTkRxSXVURXc4ZE9jeUFJNFEvOExWT0xkb3drdGVSS0xxSkw3Ui90Mytx?=
 =?utf-8?B?UFkzeTByN1pYSmZjbFZLbGpXYlBYVS9BSlZkWmoxOHQ1V1FJcUZhUTlmV1o3?=
 =?utf-8?B?OGMxMmZRNWplWnBNc1RuWWlVdU5DakVNTVhhYU9xcHJXTld0Z1I1SldidHU5?=
 =?utf-8?B?aWNhM2V2YzBJYU1keXVrNEJnLzlMK3BLclg5WTArTHNBZm9id2tIMjB4QmhE?=
 =?utf-8?B?bTN5ck90UStJMU9jY1VBNHBiMk1laHJlR1NwZFQvQjJIMHp0MndxSytaT0w2?=
 =?utf-8?B?Y0dpb3pBcnRlWitSczlEV08yWWdkZTFqSlhSaEFNNGxYdTErNDJvcXJkUFRK?=
 =?utf-8?B?NWVETWRMWGxMWnRLT3ZLQ0dtTkphRE1KVkhYOUVrQmM2S0dQeHNWeU16d0Rv?=
 =?utf-8?B?VGs0cVI1bjIzdHNGbEliTlVyTTJLdmZmVWFXbndnY3NsUVBVblBLUzZ3NlVW?=
 =?utf-8?B?QXpwWTAwNGpYTFdIbmxjZlpDeTR4Y2hWYXEzUkN6QlpuSmlZUzNxYnF5TEF4?=
 =?utf-8?B?NndTcmlHUnphSG9manZjMitrbWdMQUhNODBzZkZjYnFYVDIvMU1udjUremlw?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264529e1-31db-4725-3412-08dc6f9a765f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 20:07:18.3881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYctPu2raejfSa6N0hszTfDXfk7Qymm0anNalDQrqKJe3/+MZzrLhHEL4OmkRMkpAyQUADOqh0YrN5EXqpqzCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

Limit the protection only during moments of actual job execution,
and introduce protection for guc submit fini, which is currently
unprotected due to the absence of exec_queue life protection.

In the regular use case scenario, user space will create an
exec queue, and keep it alive to reuse that until it is done
with that kind of workload.

For the regular desktop cases, it means that the exec_queue
is alive even on idle scenarios where display goes off. This
is unacceptable since this would entirely block runtime PM
indefinitely, blocking deeper Package-C state. This would be
a waste drainage of power.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 14 --------------
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 +++
 drivers/gpu/drm/xe/xe_sched_job.c  | 10 +++-------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 395de93579fa..33b03605a1d1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -106,7 +106,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -119,17 +118,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_lrc;
 
-	/*
-	 * Normally the user vm holds an rpm ref to keep the device
-	 * awake, and the context holds a ref for the vm, however for
-	 * some engines we use the kernels migrate vm underneath which offers no
-	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
-	 * can perform GuC CT actions when needed. Caller is expected to have
-	 * already grabbed the rpm ref outside any sensitive locks.
-	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_get_noresume(xe);
-
 	return 0;
 
 err_lrc:
@@ -216,8 +204,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2c0aa3443cd9..8b1afbe3058c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pm.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -1073,6 +1074,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
 	if (xe_exec_queue_is_lr(q))
@@ -1083,6 +1085,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
+	xe_pm_runtime_put(guc_to_xe(guc));
 }
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..a4e030f5e019 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -158,11 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
-	/* All other jobs require a VM to be open which has a ref */
-	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_get_noresume(job_to_xe(job));
-	xe_device_assert_mem_access(job_to_xe(job));
-
+	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
 	return job;
 
@@ -191,13 +187,13 @@ void xe_sched_job_destroy(struct kref *ref)
 {
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
+	struct xe_device *xe = job_to_xe(job);
 
-	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	xe_pm_runtime_put(xe);
 }
 
 void xe_sched_job_set_error(struct xe_sched_job *job, int error)
-- 
2.44.0

