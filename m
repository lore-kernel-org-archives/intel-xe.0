Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3950C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 05:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ADF10E0F6;
	Thu, 17 Apr 2025 05:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4+dKG6E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900F310E0F6
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 05:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744867387; x=1776403387;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m1Z0q4gqTEI+eDSX8lz9DewMvSi5AStjtrE9TwMK+/U=;
 b=l4+dKG6EAzbnfcTy9geceywbYNgCJWT65Y3P0vjf3YochuJv/UHrkHnA
 1ArWHOaZX7NuKk91NGKh8AbAAY5c180YtWFskid5vRNOgrzz6TOAmglFd
 oYPaJ230Cz0zzKgkdjzAhBvpMqUFpGoNNOe2laLTNXLZEdH/crEv9iLZO
 UmwTqavK9j9Z1NdBwkq1O3jHRp833tI2/vmBkEy5TVfZlUswkWo5vRQ/J
 fk+JEJqNNKBZT1lG1WyTG3lSiDLYX18hM0/nbJdmXcvtpAHHiwAKCnWme
 a5SRu1fJph17R92s8bHUrKg381tmaAdWVYigKcQ7ub9spA9OqpaW7/6WN w==;
X-CSE-ConnectionGUID: W6qMdI3JTEOZeYt2Zj90iw==
X-CSE-MsgGUID: gMeWUyxYTtydhBGGTXJ6aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46323322"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46323322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:23:07 -0700
X-CSE-ConnectionGUID: UT8XVg4WS6OXqCkYg9vbSg==
X-CSE-MsgGUID: YRrJHQVnTQCI7jWQNxOgYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131233915"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:23:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 22:23:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 22:23:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 22:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y20ygeRJOaOpfhYUE6VBAgZ5VMGuCgsDCpLcn+oOZQ4PC46H33Q0Z6swO12Hk5iNaaPwyozwLSoq0S1gEKRePnzYk3ROiEF03ppy1Ip7Gl1doHXnHC7gvd7moBkNy7GM/oSpz6KYWp8e1QO6QRR+iI11uNI9Bx38lAEEiAwKTUjtMiaOdRaMg6UsHbfoEPdgsjWIPy1oUbEVddNyOih2krW7NiG98oyLJE8er3keH/zvrvI3GSyTSLOL/DZ0efhE/TauOisG6Jg1nx8k6uwDHDrRam6CnA+0iDsajb1hB+ujzAxgnvw057gLA0uPdL3qPrATZIy0+tpDD3DCPCCMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7Q923kkXC9oa8etX9/bTUmkxW4f/aBlv1GED0AkXMs=;
 b=uAJRC/oeTY4zC2vtf7PRXfkHn7Hx/SFmORfr2y2VJ672k0PZ4bmRIZLCH/JLdzplKyQdU58LZbBFLiTjme56nX4DSMY4yRjcwfEexeTXhQhPpD5cX4idMB3smVrRmsZUzgV1VvYiLpjL9CC/ymscK6OuOhmPOWNEY6+Sk6iUQ+WdftG5sdoiJGi+5v3U/m7/T8C/VL0ovksFApMtlT92ziSx2vN3VqeN3wYWgftbpZx3vj6AkbDRjMA3cqs+keWSUn9aTySpqe6wJXwbUCndy4d7tyOHpyV48g2suZjzCKoUjf+x/L+XWm9t+vDJoQ9u5QjaW8GDK4RcEsSIKi336g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 05:23:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 05:23:01 +0000
Message-ID: <5c6726de-dcdf-4bd8-9522-492608738177@intel.com>
Date: Thu, 17 Apr 2025 10:52:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_pci_probe()
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-2-raag.jadav@intel.com>
 <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
 <7fb3fcf0-3dc1-4d98-af23-58c9e77a47d9@intel.com>
 <Z_-LLx2Qb-iAouGF@black.fi.intel.com>
 <83da2447-1242-4bb2-8039-ffd76d925c28@intel.com>
 <Z__crNClWVPQHE6y@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z__crNClWVPQHE6y@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc6f80d-f7be-45e8-d92b-08dd7d6fec16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjlXTzFPZHdFbDMzaFA2OHNOUUsrU20xWElEZ0pnc0NQckpVdHRuQ2hTM2dT?=
 =?utf-8?B?b0VNSGdVd2NyZk1qTnpoMWRtLzVseTRlRzl0YnhXTDRUOWlKdTA5OWNPL0tQ?=
 =?utf-8?B?T1BBbTBxSUxMWUlmT0pWOFlsVmxOazR4eThvS1ZubUFqby80REpsTUV4YVEw?=
 =?utf-8?B?TTlqd05uUjBZREduVEZGMHp1RGNtRFNYNG50Mk01Y2l0alNIdDl0OXlyMjEy?=
 =?utf-8?B?UEVmM0JTQXc4ajRVc21aSkZWR3B5anpYaHdvS04zM25wUDJRWElHYVR3cGk4?=
 =?utf-8?B?cktIa3luSjJRMFhOWExsZWpDU0wzcmw4OW5GK2hEWE1Ua3FUZzhTWXR3d1F4?=
 =?utf-8?B?U0RyY2lHMU54Q1NhYWd2dWNLUm1vTzFOUGxuajNDTHNXczl0ZzdaUkpsK1F0?=
 =?utf-8?B?WWFaYnYwWHJ5UStVZEtURTYyYzZWYjlYNGJLWkJpZW9LUUV3TzhGeGl3OWIz?=
 =?utf-8?B?TllYdEVnblcrVmxGVEJsRDZHT1FqOHdDb1hSUmRzcDY3UFBGTFhxWmpoOHVW?=
 =?utf-8?B?Q1EwZXhiM1FvMlpCZDhEZ0xrNG16b09FcFRLczhiMnFnZlZWNGZmbFZvT2R5?=
 =?utf-8?B?blJiNHVQSGFTQjFhZVROM1RuVStEVTV2WlRKUmhSMXJOQmxmQUVFUjlzQWQz?=
 =?utf-8?B?b2NHczA5dENUT2N5ZWMrMHdYY2txTGFTQkR3SlcyZithL1hMU1hHTk9tYUdn?=
 =?utf-8?B?TURLOWladUlXMmhSYy9kWVJsMnQ3aS9DS1J4OE9wb1RBdWJuOHNjMzdvVDdW?=
 =?utf-8?B?SzdXSWhPT0FzSzZTN1k2OC9uaGQ1RUxOTGJ3RnA3aVgySnNReWtHVXU2RG1X?=
 =?utf-8?B?aU0xU0MrMVMvQWZKc1VJblh2WC90N2hwYS9PeFY4dFA1MmFBY3pUZmI4alFC?=
 =?utf-8?B?ejEzclRjRkZFdFNGNUwzbHJhVmcwL0R6VEtSK2YrYW80S2pqeWF4UUtVb29D?=
 =?utf-8?B?OUEyUW5YZzc1MUtldWg0QVBkT3hGRURyMDg5YjBNNklXUW1iYk9IdkFmRndP?=
 =?utf-8?B?M3hhQ0xxL0dJQ2FlZW9hMy9xcXBoYnlzaGF4bG52V09CU0NuZ1BPNDhiaWxS?=
 =?utf-8?B?NlY0cjR2VC8rUDRqQmJGQjlLdHpzcm8rRzVFRWdhSFAxcTgwL1U0SG5FaFdY?=
 =?utf-8?B?ZDhSV1ZKRURxeGl5NllYNUZnUkRJMkRSbCt0MUZDQVNaT05pcmJMUlhrbTJC?=
 =?utf-8?B?a25JaHNjWFRHQTd0YTlpSVJ0Uk95aUw4MjZRZHVRb0VkNzA3a240Z21wWXBv?=
 =?utf-8?B?dmkwS1N2dUsxOUI2YkoxOEFOai9FNEpvSmRTYWR6VGkvai9GeGxVZUZqbnNG?=
 =?utf-8?B?OWdLbSsrd3RCN1p0MHRVc05iVFBLQVhqRDZsSUJKUklyUmRrc2xFUHV6RFZU?=
 =?utf-8?B?SmVaZmtIbFNIc3MyVWFJVEp3MXpnY1h0VzlHdWtMbDUvbi9vemtvSE93bXpR?=
 =?utf-8?B?Z3VzdGs2T3JicStLNFBZS0dtQ2FqWkRFb2VPcjlLT3RwZStBVE1WajVYN3hB?=
 =?utf-8?B?YVhwb0g4U1FrU2FBN203Zm9iWHFseWNCaDlxbVEvQ3dEcW9rRzZBUFE4bTVh?=
 =?utf-8?B?ZHlSTzdhQVRZK0hZOHYzZ0d2djQ0Y3paUUZlR3NTRzRvSjIxMzJLWm5jOXpa?=
 =?utf-8?B?d1ZEZ2pWdzdQRDM0S1FBdFpKWVNRRjBTK0Q5OW03RjJzN2VFV05US2FMZ2lS?=
 =?utf-8?B?YUV2N3FjN0dndTNsaWU5LzdDa2pZR3J1RnBqYWo4Q3AyR3kya2NCNW56QThC?=
 =?utf-8?B?dWptNjdVZnV6Q3JjOVI0QzBGRUNPUEt2eUtvKzJ3c1kyVUtZYlk5ZGFsajNy?=
 =?utf-8?B?bi8wYzFQSU0yeUR6S2pLbk9tem1UQTRlU0ZySWZyTXFnMnErNEMvUzk2U1pt?=
 =?utf-8?B?Z3NFSUtodEdYRWQvcEVWdlU4cVY3akgwNXBlYUs4S242ZCtibEd3QXR4eVNR?=
 =?utf-8?Q?1WG3ZoTOtLc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXkxUjNJT2JFcjlhWTR5Smo5bk54YS8zeXlucFdCWTN0blF6b2gzS25nOW9V?=
 =?utf-8?B?RXIvNGYwNUkrYlQrOGtQeW1rMWk0eTBmZmNYY0RSdFFHOTJybWllbklnZHpW?=
 =?utf-8?B?V3BFU1dhWHBkMVhXVWRieU5GN1JuUmhmYTJtYVdNZ09lc2Z3bExyTmZ1RDMy?=
 =?utf-8?B?MGMvSk1EOGpYejFmTnR6T3U2UHRPWVRza3Y4TWQ1T0ZndTIxbW5UemdNT0o2?=
 =?utf-8?B?YVRJT3BmSjE4S05nVUlEaWd6cnRqUkRBVjVCbytyYTBXWEttbVB2S0N6MDVT?=
 =?utf-8?B?SzhQQSs3eUtXYXlVRTQ5aTlYYVI5VjFLVWoyVTA1NTVpRnBqeFVVVXNxNFM5?=
 =?utf-8?B?aXU2U3hRa2Z4aE8rSmN0NzFSQnBOblR0NWNQUVVYZy9lQWgrbFNZWG1neWs0?=
 =?utf-8?B?bFRCWTRMdlYyaGVYS1ArMU1pL2N5WEs4RGJ3MzNteUtTUGlaaVpvRWJpL3lR?=
 =?utf-8?B?ZFRCK0hwNWdqeTRFTkEzL3NBcE16MTRRUVVrbXR0UGdlRXZjZ3M0SzgxbFdY?=
 =?utf-8?B?ZGlkZDNPaElwckhWdjAyeEpqYWVZcmdvTzcwaEpIU0hhWU0yYTFXc1dQbkxq?=
 =?utf-8?B?bFFvZDFKbHZrN29rTzBKeUQ0U09jWFpwZHQ5YmRQVDFNVHF4b0JseWx1Yito?=
 =?utf-8?B?QWlwVGwrOC9VUUg3ekpXZEswVlpTMVZnUm01ME9PNVhlZXpGWVhmRi9TZGJ6?=
 =?utf-8?B?RkJZRkRNdFkxQ3Y2YVZYOElGb1BYRDFObWJNbXBmdE1FUW9vRGRaNWlqVUdm?=
 =?utf-8?B?TzRjdXdabHZFUndTK0RUbVVOSjZNZy9IdThONkJIZzMwLzM4ZTRzWGhGU1BM?=
 =?utf-8?B?d2hZYjFkRk9Fc3N2RFhJMGQxc3FsdmFOd0VKUmhhMzgwUkZaQitzbE9wRktS?=
 =?utf-8?B?VHNuNmdvcWxNZmFpS00walZKV3BzR1BlWjU4cDBkQU1IcHA2ZlpuZFFlMXdh?=
 =?utf-8?B?VGZrbURLa3FFOExXUmw1YzIyVUc1YzRPZ1IwZ0FlWHNJK2o0TG85K2F3cE85?=
 =?utf-8?B?UVZVc0VLTUxESXVNOHcxNHA0VHVuL2w4TzcvTnRRcDVVZm9reDA0VnJuZ1Nt?=
 =?utf-8?B?NlArQjUyVkRLSlY3RFpvVUU1K2lNZG5pVjVhdjB2WXNIb251Zm9CaHhHd1NM?=
 =?utf-8?B?SjIxdWxJYml6eW9KdGsvSThKMUpoM1VNekplU0JlYUloOGcrRDN0K21SbGJH?=
 =?utf-8?B?N3huZktrYlBIVWJvczJtODJHWWgwcU04Zko1L1lxdDJtR0JiY25CeS9RMVlt?=
 =?utf-8?B?TktnNFVTa3BQQWtqcXZGMS8xRVgxSXUrdWhsa2NSMnJNd3lYSTRMM1VyV3Z5?=
 =?utf-8?B?eHd1REN0WDNQZ29yMFhDQVF5dlFnaEhhSHRuaXVuSUwxK0xrUXRwb2xXL1V1?=
 =?utf-8?B?UDBMeEF3eU5pd3pCNmY4TVRpSkRlWmJkc3kxOVFZTTVZcUFlMlkra2hlSDVl?=
 =?utf-8?B?K1FicTlJRUtGRHF6Sm0wMzA1YjltUzU0aU5RemJEMll1OWZkL1dXNW05dXFv?=
 =?utf-8?B?MGU4VFdrbDg4cm4xc251eThkblRNMFFtVVY3Um9QcytYMUlMNGFtNWduTTln?=
 =?utf-8?B?U25ib0NwTlFZdDVxYW83eC9kWG5NWi9mMUErMStjeDkzMjFJUThBWDM4RWU0?=
 =?utf-8?B?MHpPUHBtTU00VGJJQlFGMGQ0ZVlqaEJJdnBXS2pvdnI1MWQ1YlJqNHIxSjQx?=
 =?utf-8?B?ZnZwWWgxWnZ0dGo2MWMvNUc3enlhRVQzL3M1ZlRGQkxtZ0F2bE1TQk5xRnQy?=
 =?utf-8?B?aFdSRHFWQnN4U2l5dFJGZHRpYmNVL2Z0cWZmL3hUNmdud09DTUFJaGRjR2Rp?=
 =?utf-8?B?RkxiRmRuTUliQ3ROUy90ZkhiRGY3aStVUDl0UkJ3bGl6U1dWTWRJTDdYc1or?=
 =?utf-8?B?SVZqSFBVQ1BDQkM3R2lhZWVLZ0RwM1pyUmZaVnhVTC9LSXBnK2RBeGFpWTBG?=
 =?utf-8?B?WFNhYVBkM0ErbGZyc1M1STFZc2wxQUJaM3lTMzlwUjYzb0JqTzRUNkg2UjZl?=
 =?utf-8?B?OW5BYjAwVVVraENxOFZnMlJPeFFyU2pKTlBmQXJuOU5hejAvZTA2U2FBQWdu?=
 =?utf-8?B?VndKczRTS3pxdlFrc0J3ZXI1V1M4TUNxQ1J4M3BobEdoZGNpRC8rQ1FqZ2NJ?=
 =?utf-8?Q?q4qZnFMMfqbPe5QlWC0RNYJ5v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc6f80d-f7be-45e8-d92b-08dd7d6fec16
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 05:23:01.5792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVbfQVfZXyH5M+wOFD2jrETybPJPy66QGlHIq2+5xCRwVis6rlxKGB2vu5m+5jti9LsqwIUCZA15VOlWxJ+3kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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



On 4/16/2025 10:07 PM, Raag Jadav wrote:
> On Wed, Apr 16, 2025 at 08:15:48PM +0530, Riana Tauro wrote:
>> Hi Raag
>>
>> On 4/16/2025 4:19 PM, Raag Jadav wrote:
>>> On Wed, Apr 16, 2025 at 03:34:43PM +0530, Riana Tauro wrote:
>>>> On 4/16/2025 1:25 PM, Riana Tauro wrote:
>>>>> Hi Raag
>>>>>
>>>>> On 4/3/2025 11:17 PM, Raag Jadav wrote:
>>>>>> Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
>>>>>> non-PM attributes as well.
>>>>>>
>>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
>>>>>>     drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
>>>>>>     drivers/gpu/drm/xe/xe_pm.c           |  5 -----
>>>>>>     3 files changed, 13 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/
>>>>>> xe/xe_device_sysfs.c
>>>>>> index 7efbd4c52791..d4c73acea1cf 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>>> @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
>>>>>>     {
>>>>>>         struct xe_device *xe = arg;
>>>>>> -    sysfs_remove_file(&xe->drm.dev->kobj,
>>>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>>>> +    if (xe->d3cold.capable)
>>>>>> +        sysfs_remove_file(&xe->drm.dev->kobj,
>>>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>>>>     }
>>>>>>     int xe_device_sysfs_init(struct xe_device *xe)
>>>>>> @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>>>>         struct device *dev = xe->drm.dev;
>>>>>>         int ret;
>>>>>> -    ret = sysfs_create_file(&dev->kobj,
>>>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>>>> -    if (ret)
>>>>>> -        return ret;
>>>>>> +    if (xe->d3cold.capable) {
>>>>>> +        ret = sysfs_create_file(&dev->kobj,
>>>>>> &dev_attr_vram_d3cold_threshold.attr);
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +    }
>>>>>>         return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>>>>>>     }
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> index 58347fa91841..246682b2a2be 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> @@ -18,6 +18,7 @@
>>>>>>     #include "display/xe_display.h"
>>>>>>     #include "regs/xe_gt_regs.h"
>>>>>>     #include "xe_device.h"
>>>>>> +#include "xe_device_sysfs.h"
>>>>>>     #include "xe_drv.h"
>>>>>>     #include "xe_gt.h"
>>>>>>     #include "xe_gt_sriov_vf.h"
>>>>>> @@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev,
>>>>>> const struct pci_device_id *ent)
>>>>>>         if (err)
>>>>>>             goto err_driver_cleanup;
>>>>>> +    /* We have PM related attributes, so do it after xe_pm_init(). */
>>>>>> +    err = xe_device_sysfs_init(xe);
>>>>> Layering doesn't seem right. This should in xe_device_probe.
>>>>> d3cold capable can be moved to pm_init_early and this to device_probe
>>>
>>> Are you sure if we can use ttm_manager_type() in pm_init_early()?
>>
>> you need only d3cold.capable to setup sysfs. This call is using only pci
>> calls. So this should work
>>
>> xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> 
> Sure, but should we expose vram_d3cold_threshold before calculating its
> value?

pm_init anyway fails if it's not able to set vram_d3cold_threshold.
Adding it to xe pci layer seemed wrong to me because there are no other 
sysfs init calls in probe.

But upto you

Thanks
Riana

> 
> Raag
