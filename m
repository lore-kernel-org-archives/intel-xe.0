Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DD1C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 07:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4874210E915;
	Thu,  3 Apr 2025 07:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/wE7sEH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2810E915
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743665826; x=1775201826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l9ofa/enLfxVfkqPZWCeU2wujyuumI17PhUC/9P4jA8=;
 b=P/wE7sEHmYL6iA8eZ/JKX87RpFgS1lCu4WHM9BAuzzzrOuN3ydIy0Bce
 IP/NqUGsdFW99us0NxCRAXHWBKAH1HTJ3mRLstpVfgpHDED+PnyyOKT3Y
 lO4Kv+h4yQe13JIurR6Od3UeBK10YO04pw1LurhqJ7AbF18svHaZ+uITC
 94m9HF5EOzJBC/6NuY52zq5J7LhXdA+ugvesproKDw94gXX3d5qlQ/tN2
 NkNz6Vu4S9PYW0W6PH5Wh4iO4pyxAg+pLaWyz7HTi1AA0H8JgrFbWt1jJ
 A3IgK0b1fXRMzECj1zD2JWsxQIs+jwSOVo5wIUe7lD+5Wnypo0qAXyWuI A==;
X-CSE-ConnectionGUID: aXqK7BlGSMW9R82XF7QJyg==
X-CSE-MsgGUID: U78HuWBbSryTDE9wBLnEJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45181818"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45181818"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 00:37:03 -0700
X-CSE-ConnectionGUID: TXSWaeVfQTuCghD4iwwgow==
X-CSE-MsgGUID: +UHQB396QwaW6ezwlKANYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131052144"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 00:37:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 00:37:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 00:37:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 00:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgI+5U/e4RSA5twJGNvhOtPcvuBss1++zrk2+/BMM4hWQrrQe6C3Aaj+v7wkmMPtbGHuS9XK4KptMgXHSZzd59bUUS2Ge2ytXCasbWPSj1nVE3XnpBxID6/gsvlQ2LysRKPiGEuvIELi1YaE7zSr6H3Qjvvloi44JK4rbDn5xePSKCpE3Kggj/41ZmkQqshLI4NQ6Pwq9dgasY9yFG3hCg1EMch7IRfIaY/rQPospW3WHWLRP6QdhtpGahR1jkw7Xa0vNo2HLJZP225v+9H6ba/mahx5mZUp5rMZDrkSbJuTb6DfGNhLJEZsUI29yFFKnIDsZeueif39botSMWurvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6EWHzC0+XrJGQ2fBNd+xe3ZBl4Y1B6qyBxVwP2RbWk=;
 b=GZRwJnnZL0DF1YkJ78Oa1yzkTFmpShfFMsJX7d8KejW4DbQBK6XgG5GOpEOi+4UhRs42ntnxY36vl4r4wZbkDxvs13FMdiCqAhJ+jRxLOb6OWsYB7WogJh6M5Rs69EllHgdjlt3cICLwMF4IIK8XdTZhpHbUnBAkM8KcG9y4/O5Bn2yhdqtr71bXDBNXdJJIV/ar/5JOn95sMEAKM7LKRTujNBWK2vaK6Q/g3WKGu0L1ytCF2lDkoKlhZqRILhY/3xo4K7Jvc03guS+yzJILQCMQ2PV6Q5Wu3hAPQ3LcjuAxpb1yxt35/cHGut5mDx3TgBVGSj40kqTUl+50/xjGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 07:37:01 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 07:37:01 +0000
Message-ID: <287e5242-c2f3-4bad-a5b8-836c6ab6accc@intel.com>
Date: Thu, 3 Apr 2025 13:06:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
To: "Rafael J. Wysocki" <rafael@kernel.org>, Raag Jadav <raag.jadav@intel.com>
CC: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com> <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
 <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: d49cc08f-7515-488e-8171-08dd7282523e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGdrdjYxb2pUY0wrQlZidStzRDZxYjBMZ213T0dVT3QrOUJYQUx6VFFXQkYv?=
 =?utf-8?B?Z3RxeXMyWnVTVFNLT0F2QW1JdG9RTWNWNHJkTEVvMGRVYW9FUC9MZWxIZGRF?=
 =?utf-8?B?b040REp3U2JFaCtIa1o2bDU0SnlMRjJ0OTltWGx6dnRhYVhXd1pQYXdWQTIx?=
 =?utf-8?B?ZkdvQmtrdjdqSzJmQ0xTYSsvcGVzeGFPRExqNnF0Y3NONkpuRUU5c3MwMm9z?=
 =?utf-8?B?VE1lRmczK0JLM3h1dDdDbUFGZ3dUSWt5bjFXOElSWDNDVzZpRmpEcE04OFRT?=
 =?utf-8?B?aVNSaU9qQ1RPN21FcWVOQlNxeS9sZjh3Skdac2NHK2E5aGNYQUp5SWlSdFFy?=
 =?utf-8?B?SVlXK21ZSEE3ZFBZNVNkQ0FCV1RYTm5nUGZRYkt3ajd0dzI4QTYrVkxIbFo1?=
 =?utf-8?B?R3o4WnUzbkl6WjR1OFdRZlRPakJrRnpwQndJZEtzRzZjK0ZCWWV6STFCYVNm?=
 =?utf-8?B?bW9nTkRteENoMEpyL0Q3Y2ZqUFdzVURoRFVrbUpodXVNY1JuNEp5NnFiR0Z6?=
 =?utf-8?B?ZlFoZ054c3p0S2hyN0xxZG04bjlwZFgzb21ZNVBJdThTRjlJWmRhbDQ5TytX?=
 =?utf-8?B?ZUtOaWRvUUtKNVBoU0w1cE14WTJFK08wblFkenBob2VFSGFVYkVEYmp4UXlh?=
 =?utf-8?B?K05lRk9DZDRqUWh6K0JrMHNkV203b0hiVWl6UEZYZkNES25pa21Td3VLS2xk?=
 =?utf-8?B?alloN2xmUERSblFyVlVncGgrUVJWNDI2eDJxMGpDVm8vaGUwaFQyWDlLVTVn?=
 =?utf-8?B?UWN5QXhaYTcweEdCdi81N3BXcnFSOUM4Wlh0QmxUNnJZYkE5SUU0YWIxNi9W?=
 =?utf-8?B?Q1JHeHJzVEZRT1UwWld5dGYrVG1GNllxYW1QS2hTUUZXVWwvZi9RZmFra2Iy?=
 =?utf-8?B?Y1Y2aWlPY3RMZlNoeG1UZDY2Uk03NDZMdys5QUJGWEpMOE1mcWZFYnFJSE1P?=
 =?utf-8?B?Y1h1cEF3aEd6ZjYycWZWZlFUek93d05yOTg5eFh4RDFtV05tbnFsQXVIK2g5?=
 =?utf-8?B?U3ZXdURTdVlRQXpIeEp4ZFVoU3dFKzlkNlNFa2ZtWFQwTXRKNmlDWDBuSmU1?=
 =?utf-8?B?Vm5lajJtV04wekx1b2ZQZlVoVGttbVN5OFQ2WjFFVVBnSDlkd09QS0Z4MCtx?=
 =?utf-8?B?KzBnL2ZYNTk1ZjRmcXIvNWZPUEE2Zi93VHdHUkFpVlAzd2tLekV5ZXNhc3Yv?=
 =?utf-8?B?VnVQMC9QK0xtTVJaVUZyUnY1RnY0aGRrTDYvRkRPZDJLU3FOcHFyYlRQcUpq?=
 =?utf-8?B?SFM1ajJSVTJpR3pDaHlwRlBpZjNjVVFnSVJIclRtenNaTzdGcHEyQnp0VnZK?=
 =?utf-8?B?UFRwMWZKSjJkVEEwRmQ3WGh2Yi9zT09EYkpDS1UyOVF0QWljR1BoRW9VZkd6?=
 =?utf-8?B?dmE2WXR3Tm40RVJHbEZhdk9keDNWajFNb0d5N096Yk1TTkZOVGJoT3JsTENV?=
 =?utf-8?B?RlZvYitUa05vdWxyY04vNFdrdUx5K0JYTHZLbUlBQU51b1dlNGFUWDBjRmxP?=
 =?utf-8?B?L3ZVU0R3elZCTWh3R0EwS1RFaVlZK1JzSzJYdWRTbXBBR1NmZC9ZNCs2VVo2?=
 =?utf-8?B?aHUzdmswK21zU3pSRTlFdEZ2VGVvWWRyOXYrdzYrK0hkek5Ldnh4cWQ1byt1?=
 =?utf-8?B?T2poR2VVUlJpK3NOYXNGbG52S2pYVDFhbnBIZWRjNVJad0lWclNWYk9Fc3Jh?=
 =?utf-8?B?bXJaNlB3SURsVHFzdE9XUXlMVHNyZHEyQVUyVktuNDFISDRWSmkzd3JDa2ty?=
 =?utf-8?B?QTVjYmMwOW54WGJZYkVJS28wa1o1ellsM0RNeU1NNmlLbk1WOTd2Rzl3NWsv?=
 =?utf-8?B?KzZQdFhyVHFmclY1L0hvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUUxczJIa3duYjExTmw2cnUrVExHaWEzZENnaEtkT2FoSktrT29yRTRwdzBj?=
 =?utf-8?B?b2ovSjh1L1hiYm1RaXh1QUFKSzFpV2JCYVhvN1EwajF6ZkxTTHI1NWVCRU1l?=
 =?utf-8?B?OUtGRDVuTExibVV6bDMwRjh0MFBvdGpTSVNTZ2VvMWREMFNjcUNOd2JWaWRL?=
 =?utf-8?B?KythR3lqb0pZaDF2SC9UNGVMWFZLdzBQWXBRbGhFTDlHRHo2ek9qY1pweUZH?=
 =?utf-8?B?WGFUdWZJZllFMEZWR1F4YTViMldsSk9YcEJQMWxIQXZrUWlzV0s1QlRvaEFi?=
 =?utf-8?B?VUtEYkxDK2NRUlFSVG9vTXIzT2o5cDU0bTRLaHkySVZ1Q2MrY3BEdUI0UUo0?=
 =?utf-8?B?NFF4MVg4cHZHMU1sRU13dTAyTGpDR1kwYklpSVNJZlkrUlFlb3dNTGQ3b0lZ?=
 =?utf-8?B?V2JSWXpXbmIzVVZFV0pmN0Y3cEUvTC9kU1dvZ0t4MGdPY0dYMHFMVTJqK1pE?=
 =?utf-8?B?SEhmTUxLQTh6ZWV4THBINjJSOEdneVgveGR6TWcvY25XQ0syZVRCWEVFYkVC?=
 =?utf-8?B?SXMzUzl1bnpQUGZYZGF3Y0VRb0xNK2tyWDlDbzViT0Z0OTJIUUlOWWxETEVk?=
 =?utf-8?B?clN1eTN1Uyt6RFY1OGIrWEJrWGxIb3duSWVSTG9LZkFoejhjRWNmOG1XeUJJ?=
 =?utf-8?B?MWwyMkV2elppVTJZcjdHWnpqaE9GOWpuaWNzWnZxbHBiVEIwbVpWbEYzSDZ0?=
 =?utf-8?B?UTI4RUNsYWEyZ2ZrSnBtY2k0eWZzZTIrbW9RVmdWMkNwOTQwemFTaWNxZmdD?=
 =?utf-8?B?VTFpNFdQamFsZjB2UUh2TXRkK2NmeGhFVlp6WVlkazArekViaG5KbGQ3SE8y?=
 =?utf-8?B?UFRwanNKUTUxTTV4RGIrVVRMYVM0R1Z3YnVEQ2VjWGRXdFVEYklPd2tFNVgr?=
 =?utf-8?B?TjZnaDY5a2RtQm9ka2p4WVhxbWl0L3hSbWdTY3oxTjNjMTRTY05keXVnOEFo?=
 =?utf-8?B?S3hCUHRvTjNMT3JEaWlQUEI1YjZvNnVJRXVEUjZxcjBkMkRVMmExODdwbDU1?=
 =?utf-8?B?dGE0eU9WN0EwMHNpSzBGOEd5SUVzVDdPVFNBVE9GeWxhK0NDbjVEU1hxNHJx?=
 =?utf-8?B?TGVtajBqNXVxZFNwY0tpaXFxdDBmZDFWTEJQNmtDZ1VkK3BzUUNQa1Bna0sv?=
 =?utf-8?B?dW9mZmhwb0pINU1oNVdnNnQ1WXRLeUhGT0duVmZkSVN1NUh6VHBxaXhWd0dr?=
 =?utf-8?B?a1MydFYzSkhZTDR5cUV2Z0tocUFWS3BRanRsdzJCTEdUSTRoc3lTZVRBd1k5?=
 =?utf-8?B?SFY1MGc0UW9VeEFPQ1p5aGxzVm1CNXZWTHR1dFhPL2VsaTU0WmR2bmJUNHRj?=
 =?utf-8?B?L21nd243NHJUZTQwQisyczBXdkduK011QmxmK3YxdEZrVnlyMVJubUl5VDE3?=
 =?utf-8?B?eFBaeVdTL3gxZEJzcEQrY0tKTWNxWHNSMHpoNmFNL3EwbElhMU5NZlNYWVgx?=
 =?utf-8?B?bm1Rejd4UzRpckNVR012dDVLcVZINjNyZDBrVUFhdE1mbDFRY3RGUW1ydXBG?=
 =?utf-8?B?d1dCSmF1ODdzQlY1NHJtU2ZWZDN6RCt0YXVrWHQzdkxnaTBuWkxtVFNyaVF6?=
 =?utf-8?B?TmNrVHFLeHBDZ0dTVzBJc2MrbXpDY3ViTENTWWJPY0xBZXpzSGpYdThZYmlU?=
 =?utf-8?B?Q3FLcXpyMExXcU10QnB0VTRZdzRpMEVrK2I4UTBwaHF4U1RHYm1vRmRLVVVm?=
 =?utf-8?B?ZjRDTmc2Z0FjY1JCRWlzc1cva0Fld1BnbXVKT1c2M3VmejFDeitZdk5tY2kv?=
 =?utf-8?B?a3lVcWRUTjNFN3ZlSXBIWVg5ZURKdzFiemQvQnliTlJ0ODRKQnVvbDE0M2pq?=
 =?utf-8?B?cGw2TFpFUnpmNGlvVHN1UUIxUDBtbVJxODlaY1pSOFI4alJsQmJSVklzUFEy?=
 =?utf-8?B?dUV2TEVnZ3Q4SWJSZWZQMWdXdlNLQzJNS2p0SnlSK2w3RTNaMHRtdC9Nb0Jv?=
 =?utf-8?B?ZDZPMkhSZGFLUG5CaVcweXBTYjdsL0FxNHBVS3NkMFJTWkQvVk9lb05LZmUx?=
 =?utf-8?B?QkNDMHQ1Qk5EVFNRWEc3cWRmTEFXOU94Q0ZPQ0huYk9LZDN5a0tJYTRXdW51?=
 =?utf-8?B?bUVlcmdxb0J0YlJmUjZwaXFXNVViTDh4dG9xeU5OamZwUW5FY0hhd0pIcU1L?=
 =?utf-8?B?enNJODFUT1JpTm01MlpyOVhob2NTSy83VndNR2UvU2VOckFLU05ENTAvRkxk?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d49cc08f-7515-488e-8171-08dd7282523e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 07:37:00.9597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AtpXuI6ZlLadqPh0wUnZ3xZsFunt6SNYGt6kpL2EFFdbk/CzyBGOoXR5CmFeCEeChtIe5OpIGJmhRzxdSGT3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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


On 02-04-2025 01:05, Rafael J. Wysocki wrote:
> On Tue, Apr 1, 2025 at 7:53 PM Raag Jadav <raag.jadav@intel.com> wrote:
>> On Mon, Mar 31, 2025 at 10:18:16PM +0200, Wysocki, Rafael J wrote:
>>> On 3/31/2025 6:15 PM, Rodrigo Vivi wrote:
>>>> On Sat, Mar 29, 2025 at 07:20:37AM +0200, Raag Jadav wrote:
>>>>> On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
>>>>>> On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
>>>>>>> On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
>>>>>>>> On 27-03-2025 21:49, Badal Nilawar wrote:
>>>>>>>> Hi Rodrigo,
>>>>>>>>
>>>>>>>>> According to pci core guidelines, pci_save_config is recommended when the
>>>>>>>>> driver explicitly needs to set the pci power state. As of now xe kmd is
>>>>>>>>> only doing pci_save_config while entering to s2idle/s3 state, which makes
>>>>>>>>> pci core think that device driver has already applied required pci power
>>>>>>>>> state. This leads to GPU remain in D0 state. To fix the issue setting
>>>>>>>>> the pci power state to D3Cold.
>>>>>>>>>
>>>>>>>>> Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>>>>>>>> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/xe_pci.c | 1 +
>>>>>>>>>     1 file changed, 1 insertion(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> index 7046e7e9a6c7..3317d475be79 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>>> @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
>>>>>>>>>            pci_save_state(pdev);
>>>>>>>>>            pci_disable_device(pdev);
>>>>>>>>> + pci_set_power_state(pdev, PCI_D3cold);
>>>>>>>> Another approach to avoid calling pci_save_state and pci_set_power_state,
>>>>>>>> allowing the PCI core to manage this.
>>>>>>>> Currently, the above change aligns with the Xe RPM suspend flow.
>>>>>>> Either way is fine it seems. Or we don't save the state and let pci subsystem
>>>>>>> handle that for us or we save and set explicitly. So, let's move quickly
>>>>>>> with this option here that is already fixing our current issue.
>>>>> On our way to become another i915 now, are we?
>>>> could you please expand on this?
>>>>
>>>> A simple git grep on pci_set_power_state and on pci_save_state
>>>> return many more entries than i915.
>>>>
>>>> what am I missing?
>> It's not about PM at all, just a reference to the infinite
>>
>> [1] more code -> merge -> dammit -> fix -> [1]
>>
>> cycle.
>>
>>>>> While this might be a good enough band-aid, we should probably explore
>>>>> how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hide
>>>>> issues.
>>>> perhaps this indeed...
>>>> perhaps the ones doing power state themselves are the ones declaring 'smart'?
>>>>
>>>> Well, on a dumb script here it looks we have over 110 drivers using pci_save_state
>>>> and only 6 of those using DPM_FLAG_SMART_*
>>>>
>>>> So, I agree that it might be a good idea to explore things here and find the
>>>> optimal settings.
>>> See https://www.kernel.org/doc/html/latest/driver-api/pm/devices.html#the-dpm-flag-smart-suspend-driver-flag
>>>
>>> It's fairly accurate.
>>>
>>> The rule of thumb is to avoid mixing these with calling pci_save_state()
>>> directly and setting device state from a driver callback.
>> That's not what I meant here. There are multiple issues at play.
>>
>> 1. An AER is reported[*] on root port during system suspend even before we
>>     reach any of the driver PM callback. From initial investigation it seems
>>     like a case of misbehaviour by some child device, but this is a different
>>     issue entirely.
>>
>> [*] irq/120-aerdrv-145     [002] .....  1264.981023: <stack trace>
>> => xe_pm_runtime_resume
>> => xe_pci_runtime_resume
>> => pci_pm_runtime_resume
>> => __rpm_callback
>> => rpm_callback
>> => rpm_resume
>> => __pm_runtime_resume
>> => pci_pm_runtime_get_sync
>> => __pci_walk_bus
>> => pci_walk_bus
>> => pcie_do_recovery
>> => aer_process_err_devices
>> => aer_isr
>>
>> 2. Setting explicit pci_set_power_state(pdev, PCI_D3cold) from xe_pm_suspend().
>>     Although we see many drivers do it for their case, it's quite a questionable
>>     choice (atleast IMHO) to hard suspend the device from driver PM callback
>>     without any regard to runtime_usage counter. It can hide potential issues
>>     like AER during system suspend (regardless of whether or not it is supported
>>     by the driver, since it is supposed to keep the device active on such a
>>     catastrophic failure anyway), but I'll leave it to the experts to decide.
> If the driver does not set DPM_FLAG_SMART_SUSPEND, and xe doesn't set
> it AFAICS (at least not in the mainline), pci_pm_suspend() will resume
> the device from runtime suspend before invoking its driver's callback.
>
> This guarantees that the device is always RPM_ACTIVE when
> xe_pci_suspend() runs and it cannot be runtime-suspended because the
> core is holding a runtime PM reference on it (and so the runtime PM
> usage counter is always greater than zero when xe_pci_suspend() runs).
>
> This means that neither xe_pci_runtime_suspend() nor
> xe_pci_runtime_resume() can run concurrently with respect to it, so
> xe_pci_suspend() can change the power state of the device etc. safely.
> Of course, it needs to call pci_save_state() before doing any of that,
> but it does so.
>
> This is expected to work, but resuming the device from runtime suspend
> during a system suspend transition can be avoided (see below).
>
> However, on the resume side, pci_pm_resume_noirq() runs first and
> because dev_pm_skip_resume() returns 'false' (since
> DPM_FLAG_SMART_SUSPEND is unset) and skip_bus_pm is 'false' (since the
> device is not in D0), it will call pci_pm_default_resume_early() which
> will (1) put the device into D0 unconditionally and (2) restore its
> state.
>
> This means that by the time when xe_pci_resume() runs, the power state
> of the device is already D0 and its state has already been restored,
> so the initial part of it is arguably redundant.
>
> There also appears to be a problem with calling pci_disable_device()
> after pci_save_state() in xe_pci_suspend() because restoring the
> device's state in pci_pm_default_resume_early() will inadvertently
> cause it to be enabled AFAICS.  I would call pci_save_state() after
> pci_disable_device(), so the device would still be disabled after
> running pci_pm_default_resume_early() and xe_pci_resume() would enable
> it as appropriate.
>
>> 2. Since we're already setting D0 and D3 states in our runtime PM callbacks,
>>     utilizing DPM_FLAG_SMART_* flags will allow us to skip unnecessary
>>     runtime_resume during system suspend and let PCI PM take care of all
>>     the PCI stuff in a smarter way (even skip D3hot/cold if it's already in it)
>>     without us needing to duplicate code and do everything manually.
> That's true in principle, but care needs to be taken.
>
> First of all, DPM_FLAG_SMART_PREPARE and DPM_FLAG_SMART_SUSPEND are
> about different things.
>
> DPM_FLAG_SMART_PREPARE is about the direct-complete optimization that
> allows the suspend and resume of the device to be skipped completely
> if some additional conditions are met and it allows the driver to
> control the behavior related to this optimization (see "Entering
> System Suspend" in Documentation/driver-api/pm/devices.rst for
> details).  The bottom line here is that because xe doesn't provide a
> ->prepare() callback in xe_pm_ops, this flag will have no effect.  xe
> may want to set DPM_FLAG_NO_DIRECT_COMPLETE to disable the
> direct-complete optimization completely, though (i915 does this for
> some reason unclear to me).
>
> DPM_FLAG_SMART_SUSPEND is about leaving the device in runtime suspend
> across the entire system suspend transition if it is still
> runtime-suspended after running its driver's ->suspend() callback.
>
> This means in particular that if DPM_FLAG_SMART_SUSPEND is set, the
> ->suspend() callback may run in parallel with xe_pci_runtime_resume(),
> so it cannot be the current xe_pci_suspend() because it cannot
> manipulate the device or call pci_save_state() on it or similar.  The
> most straightforward way to overcome this would be to point
> ->suspend_late() to xe_pci_suspend(), but this would cause the device
> to be suspended later unless it was runtime-suspended already.  In
> turn, suspending it later may cause the total duration of the system
> suspend transition to increase (because the device will now be
> suspended in a different phase of the transition).
>
> The suspend time can be distributed somewhat differently if the core
> is allowed to take care of putting the device into a low-power state.
> Simply removing the pci_save_state() and pci_set_power_state() calls
> from xe_pci_suspend() should be sufficient to make this happen and
> that would be my first step (after fixing the device disable/enable
> issue described above).
>
> Next, you can point ->suspend_late(), instead of ->suspend(), to
> xe_pci_suspend() and that is still expected to work, but the total
> system suspend timing will change.
>
> If this works, you'll be ready to set DPM_FLAG_SMART_SUSPEND.

 From above what I understand, setting DPM_FLAG_SMART_SUSPEND enforces 
the requirement that the device must be
runtime suspended in order to be suspended. Is it valid with respect to 
xe kmd?

