Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E407CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 17:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D710E636;
	Tue, 21 Oct 2025 17:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNheN9/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997C010E636
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761067429; x=1792603429;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7FC2bg2e/KAA4/4NcnpQevCl4M6WetsVfTwvcibocDI=;
 b=HNheN9/N0+wpp95FLgXE9UzuNLE1Jw5dDFxBf51ZGEyRJBCquHs+u+XV
 kfVM4YZrCe3Kx7rmiP9YJYOjQZfoQtvQgkNZqnQ87CkClPOB1t2Fdlqn5
 yelO7Tod69h7JElHdxzoY125rxB67BW30YiwusL7cxQDYzn1Ui24GDmJY
 sX9YugnZ4F0GDPu9Zf/4GZUFf9dzKFMtI1CJZoThXhElDzKkeqe5FEaD6
 oKEt1g7fhxI7JxdhXUZ2OVEgPaZTfbdqvTuLdKS0TrnM587pBIsHGOIDo
 lM0Bu7Yu9+eFAlUh9mv1pAz4jagoh7vh3GK4i4TX3wFQggAYh3n8gSht2 w==;
X-CSE-ConnectionGUID: mpKMwll0TKKVSpe4KCdl7g==
X-CSE-MsgGUID: aaYeVyjsROSjojwxJ3txZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88670410"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="88670410"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:23:48 -0700
X-CSE-ConnectionGUID: lJ5dyev3R+Si3kkTsxCIWQ==
X-CSE-MsgGUID: j6bY2PcwRr+kDnsXB/IOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184048094"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:23:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:23:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 10:23:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOhnpdNjFgCmDpuoFm9sAJpHP48KA7b3xmT5KskFeb1Qy3RD+N7sE5z13p/HW7mNApg35qMjcVYNaNYsjO92/VGyNJiBvT4/u0aJ6mhwrS46tTNTLb+fmrIXvMIew3H8J6557ONe/oatqg2fijJn5XA3llp33gLxiPi3ZBy+bDP+lyQ4FmsgH5LTatjMPy3/IK8frvvMnoVszpj3w3PxclnRSEKjPSjSkbJb+byPTOHSeoTYmVvoQ/mVX/k7AVKkilUB7jEKS8S6lKxgoutTNs9ITfySQrnCH0/tyPaf8ATZxYpxn0C6nWNpV+MqPnb10Viy9rHu0jwfmh4HWSqK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQkozqACc+qqzbBCrxLFF3lrkUEfvn0t4cxZthNYHZw=;
 b=ZwG5yLwK2Wjsr9prQkg9Ph1LjXyAZUPLEe3/dI0R/GUVjRng7zYy491974PHbfhV4bbTiCH2tMojOiIn49iJXOl9ayQa5iODqwlTSVxxOBve5iP1EII5cW664vW3mGUUmD+hL2qBrOC6XWH2ZJqXcYGI4Tck1S/jz3kTHjj8L4OqgLbpPVIbrif4Cj1fL1aXCh/PJEQYJbEjqwBzfxaADCO4wry7TUBrCF4UBPcB9SS/XcaJIngMwfB2vjp5454w7QP4Baym+aT1I9TE4vn0ssxrUzBL8Ut1KbFwnrxW0fkFaQaH0r16Dp7WCgQgrxjuMzalR5uuoNXAjch9QxhbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 17:23:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 17:23:46 +0000
Message-ID: <11def395-7b94-4029-8537-2c720e886113@intel.com>
Date: Tue, 21 Oct 2025 19:23:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Update GuC log buffer type value
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
 <20251009215749.378905-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251009215749.378905-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a77b27-3991-4aeb-b22d-08de10c6970b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWkzK1lVK0dTQ3Q5UmJsaTlSb29NcHJDVzlGVk5QUmVyMUtnT0MrRTNOa0JC?=
 =?utf-8?B?VWxkQk5IVE14bUFMUHlKZ3lBUmQyQW9NZUpveVZXQnNnZXppeDZ5ekQ4NVp6?=
 =?utf-8?B?clFpdUJpbWJHVCszL2drODVJbGpaRTRNTjV5L1dFZ2lGQXY4RmN0YVB1V1N0?=
 =?utf-8?B?NEZFRklxUzdMa2IwS1l6V0JVL0NZZm5IU2JPM1VzZ3ZGZ0FtYUZiV3hRT1l0?=
 =?utf-8?B?eWZLbkdUKy9SMHE5bENMS1crTDJNWlRMa0I1ZGdCOW9Bak10VkI0WXRDb0RU?=
 =?utf-8?B?SXVtbGViU1lNNnV0Q01uaTVzcTk3Z0VOMUtwajNOU2d6OTRvTGFrNzdGM2h1?=
 =?utf-8?B?b1llYzBVNitTZkh1eVhEL1B1R0l4WDRnQXJkeFVkWmVDSEY4TEZWNGU1Um5l?=
 =?utf-8?B?ZytjQnErN1NlSjZPaFFTSExWUnZvQlFONmFENGlMbFlPVXd2OHlJR05UaG10?=
 =?utf-8?B?MmFwQVl3VXk4SkM0Q25NUUFhYjJTRkpTRzZ3cWk1SzVEMVZzc1JYejdnaWxk?=
 =?utf-8?B?WGhGYUNKN1V6Qkd2ZTdsWTByb0M1Qzl2dFhVbEpvZ2lMS21zRjQyZHJBVnFL?=
 =?utf-8?B?dG5WU2pRS0xIT0RYbDQvYzVLZjc0ZHNCUCtYTGhGNTJBYWFZR0tHR3VZREZm?=
 =?utf-8?B?OWhrMS9RSzQyNjNCb1ptMTZhd0lSTE92TGpNSkVGWkhyTWJTdkpSeUwrQ01l?=
 =?utf-8?B?aklzMElVYWtmMkczMXIrTlFubjJHZS9xOUhKMXgvT3NCTy9WVFFtUGU4cW1r?=
 =?utf-8?B?QlhJL2cxay9lRytiNERZNTBiNllyU1oxeVZCQXgvS2FrWFhRdVNMbjYrMnlI?=
 =?utf-8?B?VDBIdkVTdlpwcmhRQmQ2NUh0a1hxRWNVU0dFZCt1ajdZM2VoS3lJdWttYlpU?=
 =?utf-8?B?Ukszc1ZEYlZRWXJ4a3NmY0dIRVUzYTY0eUhUTy9tUmlNV3VCdXg0TWZVNUl5?=
 =?utf-8?B?c3ZnNWRDTDgzd200dHI5Vk1rSjFBelovRVY2RW9DaHEvdGJLWmpmN2NGelBW?=
 =?utf-8?B?c3F1MWNUWDAydVJqMlFSbC9GeEQ5ZkpzWEl2MzZ6dk9EdTVUQkJpcmtBeVJB?=
 =?utf-8?B?VE5tRHBXZ0RjazdBRkFwUVRYWWtFWTRiM2pCMEw1OCtCR1QxeUoyaTlZL1Iv?=
 =?utf-8?B?V1dNRGRFbFZSK2JZTmFLUE5GME1tVWV0RHVUajVIcDNVRXZMcS9hdU1PaUs4?=
 =?utf-8?B?QTJ6a2psWkZreTV4Q2VLQjFKRm40MDJtWUVtbVBSckl5bUxGb1F4VmVsRnJq?=
 =?utf-8?B?Wm5GcW4wRnUvREZXbDBkb0JFTGxSc1FFTS83Nk9BbmhPOTF3MWJiR0RlQTdW?=
 =?utf-8?B?Z2xibzY5SzFOcm0vV1J6Um9YTDNZNjBUc3diZzdWcFhudkxpR0VyVkJZdzNn?=
 =?utf-8?B?N01DZHBRN2lHWWpuUDF3Qk5NcFdmbUpjMzM5MmFPZStpZUdmMlRwS0cwd2Z0?=
 =?utf-8?B?b0g1cUI0L3pJZU03c2Z6SGE3a09aVGhPZ0YreEM2cUdYTU5YNVlEQjJhSk9t?=
 =?utf-8?B?VGhhU0VzdDRid0I4YUN2ZFc2b3Bhd0h6Z1gwZzRsaUR5UGRhUjdLS3ZsVm54?=
 =?utf-8?B?bEZhMHMzdDB6N2RqYmYvODRKV3hYNDdHb0J6UWhvYUJUUTFoM1kzRSt1Qmlo?=
 =?utf-8?B?RVZUVXN3TVdOT1dQU2RCV3ZyYmovUXJqay9IMjVjZkRMcFBEcU1FNzltUDJr?=
 =?utf-8?B?T2pOUWl6b2ZhZlRKSmg0enljZjZ0WXVJUFlWLzUrZzJEdWloc3daNEhpTmdy?=
 =?utf-8?B?ZUVyaDFYcnpEZkwyNGsySVpFeURnNDVJTUxXamFJRFpiNHZrVFdOUnFtOTZo?=
 =?utf-8?B?TEFGMmR0bkNNMG9vSkhGejhUd1dheTk1VlZGdHB2YU5DdTd2Snl4M3ZEUW9M?=
 =?utf-8?B?UzFpSXZ3UjdHdVIzaW03WUZFK3hHUldEaW1CTmptV1dQdjRTM3ZQSENCenk4?=
 =?utf-8?Q?AiWor1ll5XrqJI59OcDoMEg0tHeGRkWU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkNIWnhJc2crU2d3dUx6S3NqeitRSmN3dkxaZS9rWjZ6SVZIWk1nTWE5clIv?=
 =?utf-8?B?WWNZdUMvMzNTUDJWMDFlcHZaQ3oyUkRJRllMd0pBY3FndERmYVJPakcxd1JP?=
 =?utf-8?B?aCs1TmpPTWViVldhOVE3dHhwdWVrNkpWVmtTak0rWk5pK1k3RktLVWJTK2ww?=
 =?utf-8?B?MEZCaXdtbWY4K1U4bnN3MkdCTXFxYWsxcW83Y3FKQ21kcDNtN0hMVnJNYlln?=
 =?utf-8?B?WEZRVS9MeGt6c05JcFZXUWo0bmJQVUhyRklkZmpOT0JDNjl1UkdsVlgxMk1I?=
 =?utf-8?B?eHdoWDlic3lpdmRBNmxkTmhucWdaOVQvNFpvRzdxMk0wbldvZGJPWGx5N1Nu?=
 =?utf-8?B?L0huWFk3dkpERU5uK3ljcEM5b01tMGQydUY0eHlLYnVBT3dpY2VWQi9WSFFv?=
 =?utf-8?B?QStKT1BNdG9nR3k4eWQ4bHFEK3h4VFlWaTEvMW8zOGZCc1E5d2tTQmNCRGlL?=
 =?utf-8?B?VmwzNHVzSU8vK2t3SGFMQ2gzd2kxYjMvUDdTaFlmazJZbHFaVHBDRVQ2R0hC?=
 =?utf-8?B?MW9GTFR3Y2lZK2x2TStKdHhvOEFKNDJuQ2xHNjhLTzJXSVltbFdkK2loM25F?=
 =?utf-8?B?ZHdacUUyUWYxQlVSNlV5MzdVR0Z1ZVlCR1pCYTBVakNnNTl0VVB5L3gyc1Fp?=
 =?utf-8?B?cUVqdE50N2t0a3h1WG1kVHlxOWlxNjJwS3kwRE5tT1drY1hmUlovRGU3dUt5?=
 =?utf-8?B?ZE1JRkxjL3RpaThFMml6WVBQMUx5R1ZIbVc3U1ZieHRNNU5RL0REWGNGVUI1?=
 =?utf-8?B?aUpqNEcvS09LSmJwNDZEREdsaFZkbzV6QjRmZ0ZDOUxHeHhqM0xhak9oZXFU?=
 =?utf-8?B?TisrNUlBbWM5RjExTUlmWW55RmF2cVdZOFAzblQyZ3Jpd2I3aFEwbi9RWWRw?=
 =?utf-8?B?TU9PM2ZZNGNQTERMcnQyWnR4NnV1a292dmFTb2V2bS9EcVNnWXdFbjRFQThE?=
 =?utf-8?B?WXV6VTRCSTdkWk9ySnN0TzVaT2M5dm5UYnZadDFGTkt0NjdQMyt3YjhBcHFa?=
 =?utf-8?B?TW5hbTlhTXhTbGpjcmFlYVRjaDQyMERpaVdsV0libXdQYVhUZU9BdGlZZ3Rp?=
 =?utf-8?B?SWR1a2RZdHFNbE5JcnplR3lxVXpZa3dMY2d2L1RnOVVXcTEwSGVjK3pGQlRG?=
 =?utf-8?B?alBhWnNPdm5tQW5YN1p4NDVLeUlRUm5lZ1VGK05RUlpSQzdZZDkyc1V3QW45?=
 =?utf-8?B?bW5JQk9QZTRXR2dWQXBySGhwSEZSSW11MksyeGdCRXQ2dVlvQ3JPYjA5TzVD?=
 =?utf-8?B?UUx2VFR0ejh3YTZ2eHdrMzBxQ2xGS0xOUzFMM0pvTUF4b0dKY1pWWVd4VU9K?=
 =?utf-8?B?MUUwMVI3WjhQUDRCQjVJVzVSQlN5VWg0YUc5VU9tQ1dEanJjRHdLanBreGRy?=
 =?utf-8?B?ZFhNOUpzQlRxd3IrUnJzYnNydEs5VG1lY3ZQekQ0Syt4S1pYMUZwR0pESXBN?=
 =?utf-8?B?K29nWENZZ1k4S0VxckREWjJhWFdZNmxZTFo2M2RpbFFCSUs2UTdwUWRRQVg5?=
 =?utf-8?B?bWcwVDRhdnhjbzVyb2xIUFRWSnprS1U1Vng0STBLb2UyS0kvdHVUMGFmNlpC?=
 =?utf-8?B?aE10TGxJZTRvNnpLUVhhRitESXlPSGljTG9ESzVCRUovZkRUT3hkY015bnVO?=
 =?utf-8?B?T1FuMEw4SDAzUEM2WlRRd0tkc3J6RCtrQVlZWHFHRmxiYlNjTHhFMzVVMWFK?=
 =?utf-8?B?Z0JRWnFVREVrSDdxRDVocCs2VTE4ZVdCWkVHUHl5MzdzY3IvdHBpOXcxRHFl?=
 =?utf-8?B?R1ZMTGp2SEgrQzlubTBFdGxMaVZYeCsxRk80enY3UWpJeHZNcks3YWNCd0VX?=
 =?utf-8?B?UTdPU1o3TWFnS1c2QldEY08wc0FQREdld2thc0kxVjFrZi9qTm9WRjhhYW1r?=
 =?utf-8?B?Mys0enY5KzZoc0hxNXRjYndKWnluUnlHSU1RRms4OFJGYytObktpSE5Md2Q0?=
 =?utf-8?B?cnQ2b0lCWlB6TGZoeVUyZGpMcEhUOHZhV2NjTEpWZVF2aW9NM011c2x1Vytl?=
 =?utf-8?B?VkZha0Yza0F6b1Z5S0xjOGVRUVJ3SDVUNlkwYTdyd09WejJiS1RoeEFxbEtS?=
 =?utf-8?B?SWJQVUtQY25Va0hZSU43RUMxdDFidm5jc0hBQktIclJlSW5BanVFNjFQajlu?=
 =?utf-8?B?YS9IRnJjTzYvMlAveWtBVEpFdXA3V084Zm5WQUR2QlkwTWVrQmdSRlhLVEs3?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a77b27-3991-4aeb-b22d-08de10c6970b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:23:45.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzmQLAIqC9ITUrEEiAYj5EkERNghuAdlFnIWQamOv/r8vTny1c7vW9qYez3eQ71ZwIXtC2GdtNRu6YL2m/JqFRzUoQnIV3LhusyYLpVLDyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
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



On 10/9/2025 11:57 PM, Zhanjun Dong wrote:
> Update GuC log buffer type value, to align with the GuC specification.
> Update buffer offset calulation.

typo

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c      | 13 +++++++++----
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> index 554630b7ccd9..b1819679fa35 100644
> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
> @@ -10,8 +10,8 @@
>  
>  /* GuC logging buffer types */
>  enum guc_log_buffer_type {
> -	GUC_LOG_BUFFER_CRASH_DUMP,
>  	GUC_LOG_BUFFER_DEBUG,
> +	GUC_LOG_BUFFER_CRASH_DUMP,
>  	GUC_LOG_BUFFER_CAPTURE,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..b5d837efaf74 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -330,10 +330,15 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
>  	enum guc_log_buffer_type i;
>  	u32 offset = PAGE_SIZE;/* for the log_buffer_states */

btw, this should be fixed SZ_4K, not a config PAGE_SIZE

>  
> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> -		if (i == type)
> -			break;
> -		offset += xe_guc_get_log_buffer_size(log, i);
> +	switch (type) {
> +	case GUC_LOG_BUFFER_CAPTURE:
> +		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;

../drivers/gpu/drm/xe/xe_guc_log.c: In function ‘xe_guc_get_log_buffer_offset’:
../drivers/gpu/drm/xe/xe_guc_log.c:335:27: error: ‘XE_GUC_LOG_CRASH_BUFFER_SIZE’ undeclared (first use in this function)
  335 |                 offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


> +		fallthrough;
> +	case GUC_LOG_BUFFER_CRASH_DUMP:
> +		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
> +		fallthrough;
> +	case GUC_LOG_BUFFER_EVENT_LOG:
> +		break;
>  	}
>  
>  	return offset;

