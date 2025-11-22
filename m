Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9AACFC522
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 19:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941CD10E0AB;
	Sat, 22 Nov 2025 19:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAxF6jNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97E310E0AB
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 19:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763839094; x=1795375094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xVFcDTJEqt/zB2br7sLT7kBKUETvwyNeClBXUfj9T3s=;
 b=YAxF6jNFTwDRTeBjrjvNwvzWhTEzQfTTu7O4bRqG4JlBZCX3vqYnHgsX
 lFMgFO5IwkzHNlKAkdpPdvo49W4mijlnV19adlFglOBNXz23p73y7toqs
 r0bCP2tOc3y+8DAZkSopHSOB4wPhUnLDlFdNjb+9h60V4OHxlenmTsueZ
 tKxZDWWWm4RTKZIoon/TGD7Hv127kByFA/A8FIYFxkulJ8uW+YatpiGGb
 m6yg6wrFSp5NrCB3UnvYf368j/JzmLnXgjubkrnWbREwXRzbiC4iyOyy8
 hb8WaRjjZY0I3owURCnqwzhnE6YKA1eRCtUbEKYviGGKG2lukw+scTCWQ w==;
X-CSE-ConnectionGUID: 2vPa3XLdRWqzNA90IZZNAw==
X-CSE-MsgGUID: 44EChGJ5ThuluEInmS65nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65851517"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="65851517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:18:14 -0800
X-CSE-ConnectionGUID: YAlsCovMS9GY+ybdJHP5Hg==
X-CSE-MsgGUID: O7Et2Z7HRxe6f6IkabGUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196131037"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:18:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:18:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 11:18:12 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:18:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgBuV19K1pd+2viw8kKWj7GX55SMaG236fDtuqziQGnUp8KLE5301IZ1rI90J1f9PHTRt4Q6mkHW3l2QWXVYYg11/r+8iJjaa/GfFezR3QT0RnZPKPpBTBDh2x324EYI/7j+dpnul4oRurbr5f9Bw4p3BgNVdZBHbfAoZF7UP5r3RiGIYWQ3TqZktiM3d2iysEBDgbaIvt9fnwCuQSqnnAzKevQgpN8pkO3iNOqhLIF/8ilf7lfOAafgOdR+1yPguoWrJqyFVXWYooTrOLMT8wo6PqnhzU4uIsyzjfatK4QqLalrJZtg6PMo1p0034MSmNAmn9AIhLw7F97Qh5XpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSCvPP8CBmzOzpm1LR2nCEMUMMJXHhs9Meywn7I/Pac=;
 b=YEUfiUFcX/Tdn3tBwpTOoJVzJxgTvPchADmKC5MrDNVc4/1gluDKHcxaO2h9Xeaq8FqD7Lh3o+VbG0V5EloN40g2prl04b7JKonAqMmlLCyG58TbVhIBRUZAhiy7c3L2Zyl8yW+iN6u6Z4GRMs8UM6qX2j8G8/oCPLbUO2i4nv1CIxkMXRLJPu+htN3i2robyXrfdpEfSo9fDKWhP1u+IPEPpJ0QQuoXCIOD5dcy0XpDW+1q6TvK6s1BOc4bGgKNeSrH+/SdV+dazLf/WaV7hUE7CVtqSGnckD1CqgdMeggmF+kQDR2SQSm1Pko1znw+jkl8+UFG/C3NeNKGmABH3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.15; Sat, 22 Nov 2025 19:18:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 19:18:10 +0000
Message-ID: <c0a3296b-88c9-452d-8a3f-03982562f146@intel.com>
Date: Sat, 22 Nov 2025 20:18:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/5] drm/xe/sc: Add system controller component for Xe3p
 dGPU platforms
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20251122045803.3616201-7-anoop.c.vijay@intel.com>
 <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251122045803.3616201-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f71196-4f3b-4930-00c8-08de29fbdfab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDkxSGJoREM3WXRVS1pTaTMzaWpidWQ5WlVrYUZrK2xIU3Uwby9WQm91b1NQ?=
 =?utf-8?B?LzRmUUlGNW9ZVGFQQVpuNnh2ODhxNlY5L3dYRTVXZUVzbFR5MlZ1RWJDbGtz?=
 =?utf-8?B?R2hqK3NZeFgvWUh3Z2NwN3lHenR0ZU1DQTZ4RHpTcGlSbkxOaDhGNG1tbzQ2?=
 =?utf-8?B?dUFRbVdoQm9CN0FYVXRlbHFXRU9Gb21TbEFxQ3h0bldxdHQ5N3M3UHExblVs?=
 =?utf-8?B?akZNRWpIRzVob1E4ajJhNVU4K21FbGNBbFhBOElERW5uSDdYRVdyWkU0Z1dN?=
 =?utf-8?B?eEFtR1Y1andYRVliR3VmYkk3clloUGZLYUFrdzdvWnpyeWc2dmU5dkszTVhj?=
 =?utf-8?B?L0ZkYllBVk1qTHRsMTRWeFdSL1A1ZnNlV2FnZGd3MWkyLzVqeFFYb0R6bUg3?=
 =?utf-8?B?VGVLV1R3V09RZjVocVR2QTNPZ2s4UGs0OEEvZWVWR2RnWFY0cWJDcXI3WlFQ?=
 =?utf-8?B?WUQvdGFQNk55RUZyK3N1S0lMZmt0bXZiTy95aGpacGZFNUtSNHA2Z3FtcTJJ?=
 =?utf-8?B?dlEraGp6QksrRjNWUG1lY2tpUnhKaEVrcjVtYTBQWmJGaXlITzFoS1Ezai9N?=
 =?utf-8?B?K29wNHB1UXU4dDFyU2VOUzc5SytMd2p3ekJSWEZOTTkrcE1Gb0VFRTJlc1Ez?=
 =?utf-8?B?cVBySzhuMkNOZGYwMjlJcWZKc0JYUWNWQ0EzdE1lWE5RdVhIaGFUcFQwN2Zp?=
 =?utf-8?B?b0U2SnhKZm1iaU9ValNnYjVwMjZoMmNYaGZCNWFQL1JidzI5S1RMa2ExWUUr?=
 =?utf-8?B?c3NNdFQ0WFRIT1Jsb2MrRDhoNGhKWGJ5S2s0VWxMSk80SmpKNzQ3cGsxZ2RQ?=
 =?utf-8?B?d2xxcmFkb2tyTm1jOG85SitJVXNFT2Z3RUhCQW0yaDg2aFlLRXZJbXJLcXJu?=
 =?utf-8?B?U0JnSmJzSlpSUEtJOXBtYXlyWndCeis1ajFWeDR1b3kvL1BtM1JBUGRBdXM1?=
 =?utf-8?B?NVVlSU5BbjVRZU5ScGFHZ3h4enRZbGdTcnpicFJUSy94L1h4c2FuTTZraFpE?=
 =?utf-8?B?dGVVZ2JFVVlmZUsyazdOUk5QMVk3NDJBK2JiaU9NMEhMSzlKbVVrbVlCMXpj?=
 =?utf-8?B?dXhKU2ZKY21mNWpidHlHN09sRkEwc0lJZ0lOUlFGRzVyUDhNWW56WnlHYmtX?=
 =?utf-8?B?d2h1SGJKOUVPR1I4TFJZOG1kaEdGN1lxUTZsdmRuZzlBNUZHazZkdTR5azk0?=
 =?utf-8?B?T3dFNFhqWDVydnJtMUhWMzRVbFJCQ2NxZUNsK1NvVXRTYVU0UWpnb3dNT3Vt?=
 =?utf-8?B?cnJ2R1ltVCtKd3dHSjlYSjRNSzNZZTFvSyttaUZDckNpZjJMUnVpWVpodnVM?=
 =?utf-8?B?T2ZEYnc3MGo0bFN4dDNiY2c4SEF5ZFI4OGtwVkFrQk9nc0lXOWFqaHpwYnUy?=
 =?utf-8?B?dzhkSmh2ZXRwRWVrYVJXWTJTZDhTV0RHdDM0SVVKZ1FUMXNiRTA3eHpwa241?=
 =?utf-8?B?NVgxOVM5TlNLN1dGUEV1UVdxa1BNODhxRkRlelZ6RmFnbnEvMWVxT0hNL1pX?=
 =?utf-8?B?MUZEc2dqa2c2L0VmSFRvZGlMWnRSQm92UUgrUDFiMmxzMFVrRjR5bktuSTZm?=
 =?utf-8?B?TENQNEVOODdOcHM5QTg5ZzNFQjQ2bHVpQUVTTnUxQmtTbHNrQ0hBUFE1ditl?=
 =?utf-8?B?Z1FkTWZlU0Z0bzdIT3ZYYUdqa21PTlE3N2xZWnhFaWxuMlQ5d0VCREFIbTJj?=
 =?utf-8?B?em54L2lXNEYxaVRibmxMSkZaekUveFR2M3d1aVkyRjNDYVllN2dNNzFWZ2I1?=
 =?utf-8?B?cXRsTmQ4c1NLV1pmdkF6Ylh0WlZJNnhmZUc1bWgxRGQ0Vkp6alBVSlJ1TEpm?=
 =?utf-8?B?cUF5cmVYK3o5N0pIbFFHNEV5N25xQXZoTFBxaDhHblRuN0QyMTVJczQ4OWdC?=
 =?utf-8?B?MEpFaEhpMmphdmJic1A0Q0p4QzI1Z2JqbUk1UzhsUk8vUWFZMFhYU0Y3djh1?=
 =?utf-8?Q?eZyQ0eRHTK6qesd5p/uLKhvlkt6mGJPk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJIcjA2NXplTWJpQnNrYzBjdjlHUFI4OVdqdEZWZHMybGxMWk0vU3JjT3RO?=
 =?utf-8?B?eitCcnl6bEhpRUxGbUNpcitmNVNmSmRuOXlvTjZHc2JvU1NRMGJkMmlpL2FU?=
 =?utf-8?B?MFRERkVMdEFvNFVmaE1SRGR6NS91WW5lUCtYQlpHOUlCZzJ3N3BJaUNUWXJl?=
 =?utf-8?B?L2FuWFl5ZU1oZXc4T2FJODl0YmlQeXljVko0c0NVUUFaRkZSZWVNMDJHaFpa?=
 =?utf-8?B?R1pJOU5jdjFoWWw1cVZtaVhiZUlvckRJYkUxclhIR2daMDBuNkt6SlJuRlhr?=
 =?utf-8?B?WlkyNEU3MUpnUGFta2dpQlVoQnBzcmVlb3N5RGpzSmp0MHgxWTd4ZUlFNUZi?=
 =?utf-8?B?a3hERTNuOHRNdmJLTStXZVBJcm94dWlicVlUbFhtVHFrcHJsWFMraWlmbktl?=
 =?utf-8?B?aDNiSHAreVNZLzFQcmdqV2VxOGdzNjkwUHFTRHlidTdnR0FiQ2hoRVI1UTBs?=
 =?utf-8?B?QkFhZytadXJxMExvTE1hZjhzZDFnNXVYd1VFSmFBZ3Joam05cnVWUDdRYmVP?=
 =?utf-8?B?eEg3NzZvNEpqTGpZRkkweFhhb3FvdzdFMk9QWG93a2pDVGtTOHZFMnFSOGg1?=
 =?utf-8?B?dmFycHRnZWVaUWVQV1FDeC8zOGxnZHByYkhFSlp6VGVLZVVsM3QvTzZObW4r?=
 =?utf-8?B?STdWdTJ2SzBXVkQyR29PaHB5cnN6T3lKWDdFS2N6azhDTVZUdzNIZHZ2K0Fp?=
 =?utf-8?B?dmpjdlhZRTF4bk1xc2JYOERxNXVjMTFydnFZZjRaMG14VEdXMEMwRWlnNmkz?=
 =?utf-8?B?RGdJM0tPMGc2QlZTdWlPSjd1U2piREd3MVlQQnlwa1BtbU4zM1NIb0RDZjVE?=
 =?utf-8?B?ZHgvMjg0VUhjbkx0WHFON2dsTTg0c1dveURqa1VSaWNyZXJOVHMwZnBsS09r?=
 =?utf-8?B?MDlBbFBXbm40S01NbUNDUzc5c3FjRDlLNjJEZWlvZjVCUEJ3YUtKMExIYnZY?=
 =?utf-8?B?UVByVkdkYWtRejZqV2dUUFhKL3JjYjRjOHhNb3NMY1VvRnFSS29DSzk2MHJY?=
 =?utf-8?B?THk1bWdScXdWYkZMQy8yQkI3ZnBzeTZibkx5Z3V3YTBubXRoYmdIY0xBWm5M?=
 =?utf-8?B?YTRlY1RZcXpTVVBPRTdJbWJlVTlFQUIwdkVUS0xSdE4vZmlXNVBLZW91VEJx?=
 =?utf-8?B?OEQySHd5eU1BVXlHRDQ5Unp3R0NyMWNQMUtzU05wc3J5bkJtL0hSbVJkdWsz?=
 =?utf-8?B?OGliNTlzRFN3ak5vWGh2SHB6a2dBVkd0V0pic0lrRzlpeU9iUmc4VHowUDE1?=
 =?utf-8?B?cThob3AyT2NaSEhzK2FqZVV4ZVo1RTNCK1ZJLzd1RjlNckFCVmplQzMrcDVv?=
 =?utf-8?B?VVVaYURJWGEzakg3MzlIeEEvMFo0b2RpWGxHNUtyL3ZJcEtWa3AyOTdyN1Uw?=
 =?utf-8?B?ajdNbThPOG1aTDZ5Lzh5RDZvQjR4QWFiaGVyYWZ2bCt6SkcxY25QYyt2a2s0?=
 =?utf-8?B?U0NIaVFieE9sakVoZ0QyQUp4cDJHSEFRam9VZHdNWE04L2NvVVl6MXgyU1NH?=
 =?utf-8?B?R2FkTGptNWlId0MxMmV4bE9OYkI3QnFuQTlldVNobG9lVVZNRXFMVHNPNzNw?=
 =?utf-8?B?VkZHZXJNZTdOK0V5bVE4TTNuRmVJZHRCaDJYZll6b0pZUVRuZ1N2Nk1TL3V0?=
 =?utf-8?B?TjJSdE9kT3NXVUJIcFcydFNQTXlVd3VSYS9FRis3ZGRpZHlvTGpKZVJSSDVa?=
 =?utf-8?B?cC9GMXZrL3o1Rmw0UEcwMmpGYUt5NDREUG5sVlJxajJXZXhsTkd5bVIzbHBK?=
 =?utf-8?B?ZmN6RDFNRHQwRjVwVVR6WW54cnZWa3dqVWJtS1NYUGpwOXkxMFJoQ2l6cWcx?=
 =?utf-8?B?R2N3cHRyamhEZXVpUVRyZWRVYXcyaXF0RjlrcTRpOWpraFBRU3BzRk9OZHFr?=
 =?utf-8?B?TVRyQ2JJUmlHV3kwd3luR3VBL3JwTlRMZU5jblFFVUVwK2lCamlVWEZtcFpB?=
 =?utf-8?B?Vk5lOVNPTWFKWWFSVzZ2dXJ5eEUvREJPbjVDWHRhK000SGpSN3VKWFZGd1c3?=
 =?utf-8?B?TUJoT2s2Y1QvUVBkQUlsMC9Zd3ZpZGhXaVRMTlg4NURSRWxuNVl5YlhvK1ow?=
 =?utf-8?B?K3BTdVZSNXJKdzh1MEY1eWx0ak0xdnBENy9Ub3RveUhFU0o4RllrcmExUzRF?=
 =?utf-8?B?aXgyUXUxYTZqOXRjUE9HSUo1NFF5cHBFelNEUU1KeU1mYllpb09lR2d6RDZp?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f71196-4f3b-4930-00c8-08de29fbdfab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 19:18:10.1707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VY8YSpF4iDTHVyxZnb7asYn29wwU9BIx7GsRwtw3oRPyDAZGm7ayD+ezZgxhX8QgYfL4W0ejWKf9FcOsIl14Y0T4y6L317w2yrCPaJPcwmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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



On 11/22/2025 5:58 AM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add a new system controller (SC) component for Intel Xe3p dGPU platforms.

in some messages instead of "SC" you're using "SYSCTRL" / "sysctrl" names
maybe functions/file should also use SYSCTRL ?


> 
> This component provides the foundational infrastructure for communication
> with the SC firmware using the MKHI protocol over a mailbox interface.
> 
> Key features introduced:
> - Detection and initialization of the SC interface on Xe3p dGPU platforms
> - Mailbox communication with SC firmware
> - Fragmented message transfer for large command payloads
> 
> This implementation establishes the base for future SC feature
> enablement and firmware command handling.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/regs/xe_sc_regs.h |  49 ++++
>  drivers/gpu/drm/xe/xe_device.c       |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_sc.c           |  89 +++++++
>  drivers/gpu/drm/xe/xe_sc.h           |  15 ++
>  drivers/gpu/drm/xe/xe_sc_mailbox.c   | 374 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sc_mailbox.h   |  61 +++++
>  drivers/gpu/drm/xe/xe_sc_types.h     |  35 +++
>  9 files changed, 635 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_sc_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sc.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sc_mailbox.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sc_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7ebfbf9051bf..50e8dc86d915 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,7 +114,9 @@ xe-y += xe_bb.o \
>  	xe_ring_ops.o \
>  	xe_rtp.o \
>  	xe_sa.o \
> +	xe_sc.o \
>  	xe_sched_job.o \
> +	xe_sc_mailbox.o \
>  	xe_shrinker.o \
>  	xe_step.o \
>  	xe_survivability_mode.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_sc_regs.h b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
> new file mode 100644
> index 000000000000..2b7053586197
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_sc_regs.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SC_REGS_H_
> +#define _XE_SC_REGS_H_
> +
> +#include "xe_regs.h"
> +
> +#define SYSCTRL_BASE_OFFSET		0xDB000
> +#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
> +#define SYSCTRL_MAILBOX_INDEX		0x03
> +#define SC_BAR_LENGTH			0x1000
> +
> +#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
> +#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
> +#define   SC_MB_CTRL_IRQ		REG_BIT(30)
> +#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
> +#define   SC_MB_CTRL_PARAM3		REG_GENMASK(28, 24)
> +#define   SC_MB_CTRL_PARAM2		REG_GENMASK(23, 16)
> +#define   SC_MB_CTRL_PARAM1		REG_GENMASK(15, 8)
> +#define   SC_MB_CTRL_COMMAND		REG_GENMASK(7, 0)
> +
> +#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
> +#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
> +#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
> +#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
> +
> +#define MKHI_FRAME_PHASE		REG_BIT(24)
> +#define MKHI_FRAME_CURRENT		REG_GENMASK(21, 16)
> +#define MKHI_FRAME_TOTAL		REG_GENMASK(13, 8)
> +#define MKHI_FRAME_COMMAND		REG_GENMASK(7, 0)
> +
> +#define MKHI_HDR_RESULT			REG_GENMASK(31, 24)
> +#define MKHI_HDR_IS_RESPONSE		REG_BIT(15)
> +#define MKHI_HDR_COMMAND		REG_GENMASK(14, 8)
> +#define MKHI_HDR_GROUP_ID		REG_GENMASK(7, 0)
> +
> +#define SC_MB_FRAME_SIZE		16
> +#define SC_MB_MAX_FRAMES		64
> +#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
> +#define SC_MKHI_COMMAND			5
> +
> +#define SC_MB_DEFAULT_TIMEOUT_MS	500
> +#define SC_MB_RETRY_TIMEOUT_MS		20
> +#define SC_MB_POLL_INTERVAL_US		100
> +
> +#endif /* _XE_SC_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f15489c100af..9fbd0b084c74 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_sc.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_shrinker.h"
>  #include "xe_survivability_mode.h"
> @@ -963,6 +964,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	err = xe_sc_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3f118c64a124..86a0c83c802d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -314,6 +314,8 @@ struct xe_device {
>  		u8 has_range_tlb_inval:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
> +		/** @info.has_sysctrl: Supports System Controller */
> +		u8 has_sysctrl:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> @@ -576,6 +578,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @sc: System Controller */
> +	struct xe_sc *sc;

maybe:

	struct xe_sysctrl *sc;

> +
>  	/** @nvm: discrete graphics non-volatile memory */
>  	struct intel_dg_nvm_dev *nvm;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sc.c b/drivers/gpu/drm/xe/xe_sc.c
> new file mode 100644
> index 000000000000..18448efc173f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_sc.h"

I guess we don't use this include pattern any more,
as we have HDRTEST makefile target

> +
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_sc_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sc_types.h"
> +#include "xe_tile.h"
> +
> +static void xe_sc_remove(struct drm_device *drm, void *arg)
> +{
> +	struct xe_sc *sc = arg;
> +	struct xe_device *xe;
> +
> +	if (!sc)
> +		return;

this shouldn't be needed, you are in control what is passed here

> +
> +	xe = to_xe_device(drm);
> +
> +	mutex_destroy(&sc->cmd_lock);
> +
> +	xe_soc_remapper_set_sysctrl_region(xe, 0);
> +
> +	xe->sc = NULL;

we usually don't do that on unwind

> +}
> +
> +static int xe_sc_probe(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_sc *sc;
> +	int ret;
> +
> +	sc = drmm_kzalloc(&xe->drm, sizeof(*sc), GFP_KERNEL);
> +	if (!sc)
> +		return -ENOMEM;
> +
> +	sc->xe = xe;
> +	xe->sc = sc;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_sc_remove, sc);
> +	if (ret) {
> +		xe->sc = NULL;
> +		return ret;
> +	}
> +
> +	xe_soc_remapper_set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	xe_mmio_init(&sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
> +
> +	mutex_init(&sc->cmd_lock);

use drmm_mutex_init() instead

> +
> +	sc->phase_bit = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sc_init - Initialize SC subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for SC initialization, called from xe_device_probe().
> + * This function checks platform support and calls the main probe function.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sc_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	ret = xe_sc_probe(xe);
> +	if (ret)
> +		drm_err(&xe->drm, "sysctrl: Probe failed: %d\n", ret);

you can use xe_err(xe, ...) helper

> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sc.h b/drivers/gpu/drm/xe/xe_sc.h
> new file mode 100644
> index 000000000000..0e5c89ddc957
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_SC_H__
> +#define __XE_SC_H__
> +
> +#include <linux/types.h>

not needed

> +
> +struct xe_device;
> +
> +int xe_sc_init(struct xe_device *xe);
> +
> +#endif /* __XE_SC_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.c b/drivers/gpu/drm/xe/xe_sc_mailbox.c
> new file mode 100644
> index 000000000000..6f2500c63a3c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_mailbox.c
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_sc_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_sc.h"
> +#include "xe_sc_mailbox.h"
> +#include "xe_sc_types.h"
> +
> +static bool sc_mb_wait_bit_clear(struct xe_sc *sc, u32 bit_mask,
> +				 unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	if (timeout_ms == 0) {
> +		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +					 0, NULL, false);
> +	} else {
> +		ret = xe_mmio_wait32_not(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +					 timeout_ms * 1000, NULL, false);
> +	}
> +
> +	return ret == 0;
> +}
> +
> +static bool sc_mb_wait_bit_set(struct xe_sc *sc, u32 bit_mask,
> +			       unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	if (timeout_ms == 0) {
> +		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				     0, NULL, false);
> +	} else {
> +		ret = xe_mmio_wait32(&sc->mmio, SC_MB_CTRL, bit_mask, bit_mask,
> +				     timeout_ms * 1000, NULL, false);
> +	}
> +
> +	return ret == 0;
> +}
> +
> +static void sc_mb_write_frame(struct xe_sc *sc, const void *buffer,
> +			      size_t offset)
> +{
> +	const u32 *data = (const u32 *)((const u8 *)buffer + offset);
> +
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA0, data[0]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA1, data[1]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA2, data[2]);
> +	xe_mmio_write32(&sc->mmio, SC_MB_DATA3, data[3]);
> +}
> +
> +static void sc_mb_read_frame(struct xe_sc *sc, void *buffer,
> +			     size_t offset)
> +{
> +	u32 *data = (u32 *)((u8 *)buffer + offset);
> +
> +	data[0] = xe_mmio_read32(&sc->mmio, SC_MB_DATA0);
> +	data[1] = xe_mmio_read32(&sc->mmio, SC_MB_DATA1);
> +	data[2] = xe_mmio_read32(&sc->mmio, SC_MB_DATA2);
> +	data[3] = xe_mmio_read32(&sc->mmio, SC_MB_DATA3);
> +}
> +
> +static void sc_mb_clear_response(struct xe_sc *sc)
> +{
> +	xe_mmio_write32(&sc->mmio, SC_MB_CTRL, SC_MB_CTRL_RUN_BUSY_OUT);
> +}
> +
> +static int sc_mb_prepare_command(struct xe_sc *sc,
> +				 const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +				 const void *data_in, size_t data_in_len,
> +				 u8 **cmd_buffer, size_t *cmd_size)
> +{
> +	struct xe_sc_mailbox_mkhi_msg_hdr mkhi_hdr = {0};
> +
> +	mkhi_hdr.group_id = msg_hdr->group_id;
> +	mkhi_hdr.command = msg_hdr->command & 0x7F;
> +	mkhi_hdr.is_response = 0;
> +	mkhi_hdr.reserved = 0;
> +	mkhi_hdr.result = 0;
> +
> +	*cmd_size = sizeof(struct xe_sc_mailbox_mkhi_msg_hdr) + data_in_len;
> +
> +	if (*cmd_size > SC_MB_MAX_MESSAGE_SIZE) {
> +		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (max %u)\n",
> +			*cmd_size, SC_MB_MAX_MESSAGE_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	*cmd_buffer = kmalloc(*cmd_size, GFP_KERNEL);
> +	if (!*cmd_buffer)
> +		return -ENOMEM;
> +
> +	memcpy(*cmd_buffer, &mkhi_hdr, sizeof(struct xe_sc_mailbox_mkhi_msg_hdr));
> +	if (data_in && data_in_len)
> +		memcpy(*cmd_buffer + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
> +		       data_in, data_in_len);
> +
> +	drm_dbg(&sc->xe->drm, "SC: request: group=0x%02x cmd=0x%02x payload=%zu bytes\n",
> +		mkhi_hdr.group_id, mkhi_hdr.command, data_in_len);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_send_frames(struct xe_sc *sc, const u8 *cmd_buffer,
> +			     size_t cmd_size, unsigned int timeout_ms)
> +{
> +	u32 ctrl_reg, total_frames, current_frame;
> +	size_t bytes_sent, bytes_to_send;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
> +	if (total_frames > SC_MB_MAX_FRAMES) {
> +		drm_err(&sc->xe->drm, "SC: Message too large: %zu bytes (%u frames, max %u)\n",
> +			cmd_size, total_frames, SC_MB_MAX_FRAMES);
> +		return -EINVAL;
> +	}
> +
> +	if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		drm_err(&sc->xe->drm, "SC: Mailbox busy (RUN_BUSY timeout)\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +
> +	drm_dbg(&sc->xe->drm, "SC: Sending message: %zu bytes, %u frames, phase=%u\n",
> +		cmd_size, total_frames, sc->phase_bit);
> +
> +	bytes_sent = 0;
> +	for (current_frame = 0; current_frame < total_frames; current_frame++) {
> +		bytes_to_send = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
> +
> +		sc_mb_write_frame(sc, cmd_buffer, bytes_sent);
> +
> +		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT, current_frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL, total_frames - 1) |
> +			   FIELD_PREP(MKHI_FRAME_COMMAND, SC_MKHI_COMMAND);
> +		if (sc->phase_bit)
> +			ctrl_reg |= FIELD_PREP(MKHI_FRAME_PHASE, 1);
> +
> +		xe_mmio_write32(&sc->mmio, SC_MB_CTRL, ctrl_reg);
> +
> +		drm_dbg(&sc->xe->drm, "SC: Sent frame %u/%u\n",
> +			current_frame, total_frames - 1);
> +
> +		if (!sc_mb_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			drm_err(&sc->xe->drm, "SC: Frame %u acknowledgment timeout\n",
> +				current_frame);
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += bytes_to_send;
> +	}
> +
> +	drm_dbg(&sc->xe->drm, "SC: All frames sent successfully (%zu bytes)\n", bytes_sent);
> +	return 0;
> +}
> +
> +static int sc_mb_validate_response_header(struct xe_sc *sc,
> +					  const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +					  const struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr)
> +{
> +	if (!resp_hdr->is_response ||
> +	    resp_hdr->group_id != msg_hdr->group_id ||
> +	    resp_hdr->command != (msg_hdr->command & 0x7F)) {
> +		drm_err(&sc->xe->drm, "SC: Invalid response header\n");
> +		return -EPROTO;
> +	}
> +
> +	if (resp_hdr->result != 0) {
> +		drm_err(&sc->xe->drm, "SC: Firmware error: result=0x%02x\n",
> +			resp_hdr->result);
> +		return -EIO;
> +	}
> +
> +	drm_dbg(&sc->xe->drm, "SC: response: group=0x%02x cmd=0x%02x\n",
> +		resp_hdr->group_id, resp_hdr->command);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_receive_frames(struct xe_sc *sc,
> +				const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +				void *data_out, size_t data_out_len,
> +				size_t *bytes_received, unsigned int timeout_ms)
> +{
> +	u32 ctrl_reg, total_frames, current_frame;
> +	size_t payload_size;
> +	int ret;
> +
> +	*bytes_received = 0;
> +
> +	do {
> +		ctrl_reg = xe_mmio_read32(&sc->mmio, SC_MB_CTRL);
> +		current_frame = FIELD_GET(MKHI_FRAME_CURRENT, ctrl_reg);
> +		total_frames = FIELD_GET(MKHI_FRAME_TOTAL, ctrl_reg) + 1;
> +
> +		drm_dbg(&sc->xe->drm, "SC: Receiving frame %u/%u\n",
> +			current_frame, total_frames - 1);
> +
> +		if (current_frame == 0) {
> +			u32 temp_frame[4];
> +			struct xe_sc_mailbox_mkhi_msg_hdr *resp_hdr;
> +
> +			sc_mb_read_frame(sc, temp_frame, 0);
> +			resp_hdr = (struct xe_sc_mailbox_mkhi_msg_hdr *)temp_frame;
> +
> +			ret = sc_mb_validate_response_header(sc, msg_hdr, resp_hdr);
> +			if (ret)
> +				return ret;
> +
> +			payload_size = SC_MB_FRAME_SIZE - sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +			if (payload_size > data_out_len) {
> +				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
> +				return -ENOSPC;
> +			}
> +
> +			memcpy(data_out,
> +			       (u8 *)temp_frame + sizeof(struct xe_sc_mailbox_mkhi_msg_hdr),
> +			       payload_size);
> +			*bytes_received = payload_size;
> +		} else {
> +			size_t frame_size = SC_MB_FRAME_SIZE;
> +
> +			if (current_frame == total_frames - 1) {
> +				size_t total_response = (total_frames - 1) *
> +							SC_MB_FRAME_SIZE +
> +							sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +				size_t remaining = total_response -
> +						   *bytes_received -
> +						   sizeof(struct xe_sc_mailbox_mkhi_msg_hdr);
> +				frame_size = min(frame_size, remaining);
> +			}
> +
> +			if (*bytes_received + frame_size > data_out_len) {
> +				drm_err(&sc->xe->drm, "SC: Response buffer too small\n");
> +				return -ENOSPC;
> +			}
> +
> +			sc_mb_read_frame(sc, data_out, *bytes_received);
> +			*bytes_received += frame_size;
> +		}
> +
> +		sc_mb_clear_response(sc);
> +
> +		if (current_frame + 1 < total_frames &&
> +		    !sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +			drm_err(&sc->xe->drm, "SC: Response frame %u timeout\n",
> +				current_frame + 1);
> +			return -ETIMEDOUT;
> +		}
> +
> +	} while (current_frame + 1 < total_frames);
> +
> +	return 0;
> +}
> +
> +static int sc_mb_send_command(struct xe_sc *sc,
> +			      const struct xe_sc_mailbox_app_msg_hdr *msg_hdr,
> +			      const u8 *cmd_buffer, size_t cmd_size,
> +			      void *data_out, size_t data_out_len,
> +			      size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	size_t bytes_received;
> +	int ret;
> +
> +	if (rdata_len)
> +		*rdata_len = 0;
> +
> +	ret = sc_mb_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out) {
> +		drm_dbg(&sc->xe->drm, "SC: Command completed (no response expected)\n");
> +		return 0;
> +	}
> +
> +	if (!sc_mb_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		drm_err(&sc->xe->drm, "SC: Response timeout (RUN_BUSY_OUT not set)\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = sc_mb_receive_frames(sc, msg_hdr, data_out, data_out_len,
> +				   &bytes_received, timeout_ms);
> +	if (ret) {
> +		sc_mb_clear_response(sc);
> +		return ret;
> +	}
> +
> +	if (rdata_len)
> +		*rdata_len = bytes_received;
> +
> +	drm_dbg(&sc->xe->drm, "SC: MKHI message completed: %zu bytes payload received\n",
> +		bytes_received);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sc_mailbox_send_command - Send command to System Controller via mailbox
> + * @handle: XE device handle containing the system controller
> + * @cmd_buffer: Pointer to xe_sc_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + * Optimized to move memory allocation outside the critical section.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
> +{
> +	struct xe_device *xe = handle;
> +	struct xe_sc *sc;
> +	struct xe_sc_mailbox_command *cmd = cmd_buffer;
> +	u8 *command_buffer = NULL;
> +	size_t command_size;
> +	int ret;
> +
> +	if (!xe || !cmd)
> +		return -EINVAL;
> +
> +	sc = xe->sc;
> +	if (!sc)
> +		return -ENODEV;
> +
> +	if (!cmd->data_in && cmd->data_in_len)
> +		return -EINVAL;
> +
> +	if (!cmd->data_out && cmd->data_out_len)
> +		return -EINVAL;
> +
> +	might_sleep();
> +
> +	ret = sc_mb_prepare_command(sc, &cmd->header, cmd->data_in, cmd->data_in_len,
> +				    &command_buffer, &command_size);
> +	if (ret) {
> +		drm_err(&sc->xe->drm, "SC: Failed to prepare command: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&sc->cmd_lock);

	guard(mutex)(&sc->cmd_lock);

> +
> +	xe_pm_runtime_get(xe);

	guard(xe_pm_runtime)(xe);

> +
> +	ret = sc_mb_send_command(sc, &cmd->header, command_buffer, command_size,
> +				 cmd->data_out, cmd->data_out_len, rdata_len,
> +				 SC_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		drm_err(&sc->xe->drm, "SC: Mailbox command failed: %d\n", ret);
> +
> +	xe_pm_runtime_put(xe);
> +
> +	mutex_unlock(&sc->cmd_lock);
> +
> +	kfree(command_buffer);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sc_mailbox.h b/drivers/gpu/drm/xe/xe_sc_mailbox.h
> new file mode 100644
> index 000000000000..d5ca43c40f1a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_mailbox.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_SC_MAILBOX_H__
> +#define __XE_SC_MAILBOX_H__
> +
> +#include <linux/types.h>
> +
> +struct xe_sc;
> +
> +/**
> + * struct xe_sc_mailbox_mkhi_msg_hdr - MKHI protocol message header
> + */
> +struct xe_sc_mailbox_mkhi_msg_hdr {
> +	/** @group_id: Message group identifier */
> +	u32 group_id    : 8;
> +	/** @command: Command identifier within the group */
> +	u32 command     : 7;
> +	/** @is_response: Response flag - 0 for request, 1 for response */
> +	u32 is_response : 1;
> +	/** @reserved: Reserved field, must be zero */
> +	u32 reserved    : 8;
> +	/** @result: Result code from firmware */
> +	u32 result      : 8;
> +} __packed;
> +
> +/**
> + * struct xe_sc_mailbox_app_msg_hdr - Application message header
> + */
> +struct xe_sc_mailbox_app_msg_hdr {
> +	/** @group_id: Application group identifier */
> +	u32 group_id  : 8;
> +	/** @command: Specific command within the application group */
> +	u32 command   : 8;
> +	/** @version: Protocol version */
> +	u32 version   : 8;
> +	/** @reserved: Reserved field, must be zero */
> +	u32 reserved  : 8;
> +} __packed;
> +
> +/**
> + * struct xe_sc_mailbox_command - System Controller mailbox command structure
> + */
> +struct xe_sc_mailbox_command {
> +	/** @header: Application message header containing command information */
> +	struct xe_sc_mailbox_app_msg_hdr header;
> +	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
> +	void *data_in;
> +	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
> +	size_t data_in_len;
> +	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
> +	void *data_out;
> +	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
> +	size_t data_out_len;
> +};
> +
> +int xe_sc_mailbox_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
> +
> +#endif /* __XE_SC_MAILBOX_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_sc_types.h b/drivers/gpu/drm/xe/xe_sc_types.h
> new file mode 100644
> index 000000000000..5ec2126cebe4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sc_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SC_TYPES_H_
> +#define _XE_SC_TYPES_H_
> +
> +#include <linux/completion.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_sc_mailbox.h"
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_sc - System Controller driver context
> + */
> +struct xe_sc {
> +	/** @xe: Back pointer to xe_device */
> +	struct xe_device *xe;
> +	/** @mmio: MMIO region for SC registers */
> +	struct xe_mmio mmio;
> +
> +	/** @cmd_lock: Mutex protecting mailbox command operations */
> +	struct mutex cmd_lock;
> +
> +	/** @phase_bit: MKHI message boundary phase toggle bit */
> +	u32 phase_bit;
> +};
> +
> +#endif /* _XE_SC_TYPES_H_ */

