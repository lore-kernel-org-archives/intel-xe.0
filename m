Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C0ECCF9E5
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 00:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB27510E009;
	Tue, 28 Oct 2025 00:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrNvXFTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE13610E009
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761610786; x=1793146786;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6WtVZimvAvzBEDWx2KGKQD60gpPc4pJUol6Vpv7yrRI=;
 b=lrNvXFTGTldY6ECVAyz38uzadd0XjJeIKjqdU2HEU1nPCk7/NRlIeLQF
 BDpekpPZJFK0T2GTJYQvKPvF9rQh2PHnpmHsGkjoMunKV2RuRxRQYLsTu
 7ebyy2egwId8iy4D1LPILLVJeYgWqw0axIKsQ9cXn5uwqqmcbOtO3Llpq
 2pi+2M03GR/7ChGZvq8c0wlydenjJRUly/lyXSVTPA4XpGhSfwE3oIPhg
 W6vrg0SAF8610WvluMXkjM9wwnDoZy/NHMyRj5nVdgKCXXIDpX4xLBRRP
 nrNg21W6wzlUB4dZVYRkHXHfsv3pCchF/71XC+Fk0cp2NQPqlzna48pjz w==;
X-CSE-ConnectionGUID: SXRWMbTMSHqDNSpMSuF+Cg==
X-CSE-MsgGUID: nKbzVNeLQKSQwuTU7AELGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73989681"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="73989681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:19:46 -0700
X-CSE-ConnectionGUID: UuqPlGQbTUKRb8ErLWHX4A==
X-CSE-MsgGUID: 1q4j8qWVSNy5196YumJiLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189557202"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:19:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:19:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 17:19:45 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQYIjmlnYBEXe9y0py8t0pRP8nr2o7qNyviorW+NhimkYFQY2HGy52oTPmzfD4hE7uCsIfK+O0eAGPtqdLyb12Iw4OwkyqgHPnteLEpxkgrM8IhN1stu5oi9IgoV6ZpJxEnrarpuBKswCz5SmZ4VVOfK49OIDZ/Aiia/y7i9GGPayeuARExa4JXJ9pOQze7LKkTtWt3io3uOSpz2H5a8Ns1ymrnXAxPjrHTCA6Vw3DrQATbobz9W+BUCPAevXFje3L32UEEfbm8SLz8d2uJTQZXoFyo2laQFoiPB16iJ95JFbh7hj8CCheUu19ikBljfpqjavB++4UxdSl75LoV3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkEUttxVn9TSMr4q+RgCagG3Nnjt4kJeJ4rS59UldLA=;
 b=ttIAmUFqec/iIQZ11HeXA0giqt3nSGwkEGeC+vPZkBaW3667oMvEd1wFHbKtrxXLrDn/GUd1tbyWUeWFIMUKRFAdaoonAf9Jb7VDW3eDbJSJKLcABwMiNg183TAHTuipfZFXounsKxzW8pBI86o6M5V2cMEOgJZJOxEXhbvhWuwQdO0cwesA3pUdRfvPC+P4IpX9ZgkqSmvj7FzG+Yj/QeZfsFkve6zyjzzfcplMXnGIUDwu/6F++07Cxwk8epUJVdcx5i97Pz8plai1ojTR61MlWxhie5qlNAjjnf/6MNPTem4juw3rUvUhyEHsHSuEUPnH6ZztSw3bYLg+deLBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB8786.namprd11.prod.outlook.com (2603:10b6:208:59b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 00:19:43 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 00:19:43 +0000
Message-ID: <e9b98170-8dba-4640-a9ca-034bd40ac4c8@intel.com>
Date: Mon, 27 Oct 2025 20:19:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/guc: Cleanup GuC log buffer macros and helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251023175855.2464961-1-zhanjun.dong@intel.com>
 <cdcac9b3-79b2-4c3c-9a7c-de6fa584b2ac@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <cdcac9b3-79b2-4c3c-9a7c-de6fa584b2ac@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3962b882-ecb1-4e20-fd35-08de15b7b14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9QQ2ZSSURNZ0tCWElYQVZxQnJzdnRtM2M4V2RNVFhlTmFSOHhYdTNjeXRP?=
 =?utf-8?B?cy9ubnlVNFBHb3dKRStPdWNORkJDZ0cxYWt4N2RYL1RGTzBHUkp3Y042dkJp?=
 =?utf-8?B?UVNIZ1NBczVOVkIyNGVjZW0razhYbk5XQzR0cmR2UVhnYWJ4NW9MbnoxS092?=
 =?utf-8?B?RGxVZXEzaGwxMDVUdFhDS1MxMjNsQVZwR2RjQXF3YUlFTHdIN2tRVXF0N2RK?=
 =?utf-8?B?anlXYkdIejl2TXZXR0VkWjBaa2ZYVmw5TGhnQXFLbGljeXVwL3U3c1VYbEJp?=
 =?utf-8?B?NFFZcFlzekNhNWcxYjVLWC9zREJoTTNMNFc3SUNqRFVWUlVUeEN3YXA0Qkw4?=
 =?utf-8?B?ZE9OT0R5YjB0anN6YjFlMWttVnY5ZncrMXR6Sk44TnhUN2wrdjVkdnFIMzhn?=
 =?utf-8?B?Y1MyL1VDTzltZVM1bFJlRTkvTTdYWmxOOE8rd0Y1bElLdmtNK0tHKy8wTGlh?=
 =?utf-8?B?Yk9hMkFLSGlMUFc0NmJLT3o4SWJiWnB2Qi9kUmFhYzBOdUNOc0JLK1NUNEpx?=
 =?utf-8?B?MnVDUU1NL3BBUWpDUUg4ZHgxUWFtTjhQR2xBSzNBZ0lvbGZ2eDJWc1gyNXYr?=
 =?utf-8?B?MHkwMzZYaXoyT085VzgvN0lVaFZseU9hcmNlbEc3TXR1a1JnZk0rbWV3b20r?=
 =?utf-8?B?ZENhdnhyRXBQcWFVWDhHNHQwN08zYUltTVdFVnA3Z0tZd3FYQXAycGlUOVRx?=
 =?utf-8?B?ckFYRGx1RkFWcllXbXVYK2k1QmpzckNQM0hvckxaY0VONWgxeCt5RHM0T0Ir?=
 =?utf-8?B?L0E3ay8zZXAvYlFJS2lGMXVJU1Y0aXRmUnhkYjNuenRCZjRNVHMzWkxIUFpi?=
 =?utf-8?B?Uy9QTzVQMXFyQzVUU2IrcytVTHVQZm1KWjN5VVE4MlI2MEtjbyttbkNMRnU5?=
 =?utf-8?B?T3lLVk5BYm1IaTgxaFRIOU4vODlwS3lPbXF2WWZEQkZXNlIwZGUwc284UjVT?=
 =?utf-8?B?Vzd0bllNN2VXT2h5cjdXOER2Q2VkSklweTVxL0U2aStJdGNZcXJRK2V3bzdh?=
 =?utf-8?B?TnU1bElPR0QxMjVERUc0bmNNbThaZXRybmgrUW1CcE1pTVA4L0FzYUc3RURZ?=
 =?utf-8?B?R2Q4TkkrUjduWTQzdEhjNWhYS0MxZXU0NjJOU3QrTm5CTnNaVUdoc01STHRx?=
 =?utf-8?B?VGhVR1JkNmUzU2dkY08yeHlMT3hXN1BBY1Y2cG1RUU9KdFl2TEhkRlF2ZDZv?=
 =?utf-8?B?My90SzRiL083Z0ZMR3diS3F1bVp0V1hsNFRNUzdYREpwZXBZZ1lOM01KODg3?=
 =?utf-8?B?dmtibG9CT1pTS1c2bFNPY28vYmNCVkM2d012WU5Bcnh5RFVmNVlrWUt5dGdB?=
 =?utf-8?B?UUFjSUZjaTI5NmMvQjRtNDhiVU56L3ZLazBzcVBqaUxVYklTQUlKWEU0U1NY?=
 =?utf-8?B?L2QxdS9YSTloQUtZMVpGWnQ5Z2xUbEV5L2NYVXg3NGJNSEFSR0F0TWNrcysy?=
 =?utf-8?B?MjNyeCtnNGZ3bTJOdkplTXI4Qnd0aG1EVjdBVW1mNWZiRWoxeGRmcktaL3dt?=
 =?utf-8?B?ZWtpd3I3ZVNuVXdYUVB0eGE5b3FPY2hFeUJMYlBhQUNwR1dpM1ZSK2dKZitW?=
 =?utf-8?B?TkNwZXF1dUROc1lXODA1Z2Z5TlVoaStXNUtEVDRaTlhFZUttSVpLQVM3MUxE?=
 =?utf-8?B?VnZCVk10cUY0YmJlenJYcUJKM1pneFEvTVBsT1BteVdxbXlMZUorR3lHUDBn?=
 =?utf-8?B?SlhoR1NPZEkrVGRpblplbGoydk1xd05aUzVHQStockFyMG5ZZWxGa0pNc0pY?=
 =?utf-8?B?a2pweHN6NEJMb2w2S2Y2bFB1Qk9jd0htLyt3K2dVdjc1MkRmWFEyR0xpVjhu?=
 =?utf-8?B?Rk9PVzdvajkyNUI4Y3hIYWY0RGJpR3VTcDAwNmFIUFpwR0VJUGJVVStJY0hi?=
 =?utf-8?B?REl5T2tSQzVGc055SCtQejdIZlhMNzU1ZFFNV0xTbXpnODNHcDl3WXNqMWFY?=
 =?utf-8?Q?PhS75UoeGdZrL5/1CsLgYErdhwit5MWb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTl2UVFYcUFBMXI0V2Q2aklSd3hDQ1M3MWZaK01QRlJySlZ0b1pXTkJXYUlq?=
 =?utf-8?B?OVhrZFFjMzZHdjZsWnI3VGRwUFEvZVJIWnIrVTJ2L2V2ekdKOWRXdGFhYmwv?=
 =?utf-8?B?L2ZLeDQ2YVloVGVKUWlZcWkvZ0E0WDAySUFTU3BFSmYwbE5wT0g4aWt3dlRC?=
 =?utf-8?B?bnNxTGhoL2w5ZlVNUSt6R1dUZ1F0SThYbTlJa09uL0ZDNmR6T213RkRJNDV3?=
 =?utf-8?B?TlJBQU9FR3F1NGJBOWJtWm5UejY2Sm9qb0g1UmtrTFlsM1A2RXIyVVZIUVZP?=
 =?utf-8?B?dVJrSzR2NnFyODZkVDZIRHY1a0M5cUVEZlZLdXJDUDkvYjQ4Um54RWd2V0ZN?=
 =?utf-8?B?M1QyR2p3eTNOYVQ0ZG9weHZZaTYzcEtwWGQ5WW0wU2V3S1BLSXlHaGRiTldj?=
 =?utf-8?B?S3F5ODBObzFjZlBFTXZlczZRR1pwTzgrZGIrZS83NkFTNFFxS2tmWnhwNHU2?=
 =?utf-8?B?akVhY0NLb1d3UE91QTF4Q3ZjaUxWU2hEbi8vZW9aaVVvQXNhZERSTlQxTW8w?=
 =?utf-8?B?VGVyYjVvUFpjRlVaeTJrQThvZFVtWnh4bGYxZ2c0UEJ3M210emk3VW9VVEhC?=
 =?utf-8?B?dHhTMUxlcTAyK0d4ZkxWYUxyQzhvdmZZVGl6aGlmcFFVYTd5R0RacFdOcTM1?=
 =?utf-8?B?OXYyS24zaGhoeDVzODJ3bGdMWnhXeTd0ekhLblZ5T0xneW1INDhoTXNPZkFw?=
 =?utf-8?B?UTBCTG5TaVFNaGpiaTdXWGYzb2xjYTFqZmxhQWpad1l6Myt1TTdEWkRqT2xY?=
 =?utf-8?B?ekZsblhxY0gyUjZqSkRZMHNZTlF4Y2FCWHpKOWk2ellGdTljQ21wOFNNNnVK?=
 =?utf-8?B?ZmZ6N0k5dkZYemJQdWhyUmZldWxpV3NnSXl6MEszd21jWldZRk11ajFaTG1m?=
 =?utf-8?B?MTY3ZUdhcjBmNTVZU1EwSGdBelhVNDhhTkxCQWJpVXlWS3FlcHFiWklkY29m?=
 =?utf-8?B?RkFnbkNySjJVRktuQ1ZoTU1ORjJ6L085SW55ZGFMeFlvaFZjMnNFVzBuZmR4?=
 =?utf-8?B?Njl0YnhQc1BsOFdMSTRjSkJMbjB3aitTSnBIL2F1aTlCTEhCUmEwdE53MzVr?=
 =?utf-8?B?Tlcrd1M2NlFVcFRzZWpMQnUxanhyRTJaSjI1dHVIR0w1aGZkY3NYK0ZHNE9n?=
 =?utf-8?B?c2wwSHJXZS9qaE9wb3Q0eGVlSHBkQmtKUThmMUpaQURya0lCQjZKWnFBVkJC?=
 =?utf-8?B?WHVXaWhkemJnSEFnU1lSOXh3UklsUGNtWTVlZUlDNjFWRVlRaU5tTHdYR1lS?=
 =?utf-8?B?SFZRRlhVTmtjN21DMWRnZGM0ZStSNVpHVlhHV0NrWWhHN3FhNEx0OWtmN1dw?=
 =?utf-8?B?akhXMGY1OHVUWGhudkwxVENKeElnN01wbitBWHplcHhVTGlaL1NZNUw3Q1pW?=
 =?utf-8?B?bktVak1QUTM2cnZoQk4vKzN4MzQxcTB4V3IwcUs4VklueVY1OENXWXk1clQz?=
 =?utf-8?B?R0Y3d1ZxQURwYis0VHVpR2ZndDdPUEVqVSsyaU5QZ0dLTEdFSGt5Zk00MFlL?=
 =?utf-8?B?b2Y4bnYwblR4UGxnblhqdmpTeVF1N0IreW1qdWxuTXZlaU9pVUxTWFMwRmZp?=
 =?utf-8?B?MDJrMDJTZWMyK3dJQndRSURIeWYwUnExUXE2alpqbUZPWkhaQm9DMjdMdGly?=
 =?utf-8?B?TUFrMTJSUXFGUk91b1FGQmZuK3lTUUNuL2E1MFpmb0NzNldOaldjV3crejFE?=
 =?utf-8?B?bEJDckhpZHQ0eGd3eGkrTzZuTU5oQ01uZXRvZzhsdFRPS0hMOXZxMk44aGEr?=
 =?utf-8?B?YlhFckFCUWhPTzlWZjVLcHhLdm4xN3VSelRHdVhvWXg1Zm9vWjNvNDZRTnp3?=
 =?utf-8?B?OWV4MEU0ellvcUpDWFhwNHpKU2srNEhnczJwa1EvSks4RGtlbFdrU0ViZ1g3?=
 =?utf-8?B?THplcFg2NlRXQ2J4RERmb1Y1eGJOOU82dnVQalhWZFZkZGoxTFA3djAvOG5p?=
 =?utf-8?B?UFZ5TFZJSmVBckZ6YUVGSWZjaXdzSlB6aXZIQUNyOTdKbUR3QloxOE1ReGUz?=
 =?utf-8?B?OXZwQ25ja3JXODZYbFpJV2MyRkJNSzVjZ2VWdDFaNGtib2ovRzgxNjdvbDlQ?=
 =?utf-8?B?Zkg1T3h4eFM5WlFUYkN4US9GeW5TandDOWhZa1ZWSkJ1MjhUREV1V3lHOWdY?=
 =?utf-8?B?YUtWdWMrMXNZUmZXZWNtWE16cGdlRTJIcHpzUWwxblB5WjZXM3hsL2p3ckts?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3962b882-ecb1-4e20-fd35-08de15b7b14d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 00:19:43.3662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SmGilX56Ftc/6hJ6ffp0tu6Wn0ki7ZtY8NJtfl8LNCB4IAwGEibgh+X6Th7RYT/4pQ+6CZamGuHhdOFmHhC3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8786
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

Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-10-23 7:04 p.m., Michal Wajdeczko wrote:
> 
> 
> On 10/23/2025 7:58 PM, Zhanjun Dong wrote:
>> Cleanup GuC log buffer macros and helpers, add Xe style macro prefix.
>> Update buffer type values to align with the GuC specification
>> Update buffer offset calculation.
>> Remove helper functions, replaced with macros.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> Cc: michal.wajdeczko@intel.com
>> ---
>> Change list:
>> v6: Avoid change same line in series twice, squash into single patch
>>      Correct PAGE_SIZE to 4K
>>      Promote memory layout comment to kernel-doc
>> v5: Change patch order
>>      Sync macro names across buffer type, size and GUC_CTL_LOG_PARAMS
>>      Replace guc_log_size with macro
>>      Update log buffer layout comments
>> v4: Replace helper functions with macros
>>      Rename log type xxx_DEBUG to xxx_EVENT_LOG
>> v3: Update comments
>> v2: Use SZ_4K, instead of PAGE_SIZE
>>      Expand for loop with switch and fallthrough
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h |   4 +-
>>   drivers/gpu/drm/xe/xe_guc.c          |  23 ++---
>>   drivers/gpu/drm/xe/xe_guc_capture.c  |  16 ++--
>>   drivers/gpu/drm/xe/xe_guc_fwif.h     |   6 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c      | 129 +++++++++++----------------
>>   drivers/gpu/drm/xe/xe_guc_log.h      |  14 ++-
>>   6 files changed, 82 insertions(+), 110 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..fb5e2b8e7cf9 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,9 +10,9 @@
>>   
>>   /* GuC logging buffer types */
>>   enum guc_log_buffer_type {
>> +	GUC_LOG_BUFFER_EVENT_DATA,
>>   	GUC_LOG_BUFFER_CRASH_DUMP,
>> -	GUC_LOG_BUFFER_DEBUG,
>> -	GUC_LOG_BUFFER_CAPTURE,
>> +	GUC_LOG_BUFFER_STATE_CAPTURE,
> 
> 	GUC_LOG_BUFFER_TYPE_EVENT_DATA,
> 	GUC_LOG_BUFFER_TYPE_CRASH_DUMP,
> 	GUC_LOG_BUFFER_TYPE_STATE_CAPTURE,
> 
> or
> 
>     enum guc_log_type {
> 	GUC_LOG_TYPE_EVENT_DATA,
> 	GUC_LOG_TYPE_CRASH_DUMP,
> 	GUC_LOG_TYPE_STATE_CAPTURE,
> 
>>   };
Will change to
/* GuC logging buffer types */	// <- Will leave this to prompt this is 
log buffer type
enum guc_log_type {
  	GUC_LOG_TYPE_EVENT_DATA,
  	GUC_LOG_TYPE_CRASH_DUMP,
  	GUC_LOG_TYPE_STATE_CAPTURE,
...

>>   
>>   #define GUC_LOG_BUFFER_TYPE_MAX		3
> 
> do we still need this?
Yes, upcoming LFD feature will need this>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index d94490979adc..c82570c70964 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>>   	u32 flags;
>>   
>> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>> +	#if (((XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE) % SZ_1M) == 0)
>>   	#define LOG_UNIT SZ_1M
>>   	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>   	#else
>> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   	#define LOG_FLAG 0
>>   	#endif
>>   
>> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>> +	#if (((XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>   	#define CAPTURE_UNIT SZ_1M
>>   	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>   	#else
>> @@ -115,20 +115,21 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   	#define CAPTURE_FLAG 0
>>   	#endif
>>   
>> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>> +	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE);
>> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE, LOG_UNIT));
>> +	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE);
>> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE, LOG_UNIT));
>> +	BUILD_BUG_ON(!XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE);
>> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>   
>>   	flags = GUC_LOG_VALID |
>>   		GUC_LOG_NOTIFY_ON_HALF_FULL |
>>   		CAPTURE_FLAG |
>>   		LOG_FLAG |
>> -		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>> -		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>> -		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>> +		FIELD_PREP(GUC_LOG_CRASH_DUMP, XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE / LOG_UNIT - 1) |
>> +		FIELD_PREP(GUC_LOG_EVENT_DATA, XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE / LOG_UNIT - 1) |
>> +		FIELD_PREP(GUC_LOG_STATE_CAPTURE, XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE /
>> +			   CAPTURE_UNIT - 1) |
>>   		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>>   
>>   	#undef LOG_UNIT
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 0c1fbe97b8bf..4e2c5a51adc8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -843,7 +843,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>>   {
>>   	int capture_size = guc_capture_output_size_est(guc);
>>   	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>> -	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>> +	u32 buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>>   
>>   	/*
>>   	 * NOTE: capture_size is much smaller than the capture region
>> @@ -949,7 +949,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>>    *                  ADS module also calls separately for PF vs VF.
>>    *
>>    *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
>> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
>> + *                  Size = #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
> 
> do we need this "#define" ? maybe just:
> 
>      *                  Size = &XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE (warns if on too-small)
Sure #define to be removed>
>>    *                  Note2: 'x 3' to hold multiple capture groups
>>    *
>>    * GUC Runtime notify capture:
>> @@ -1367,7 +1367,7 @@ static int __guc_capture_flushlog_complete(struct xe_guc *guc)
>>   {
>>   	u32 action[] = {
>>   		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
>> -		GUC_LOG_BUFFER_CAPTURE
>> +		GUC_LOG_BUFFER_STATE_CAPTURE
>>   	};
>>   
>>   	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>> @@ -1384,8 +1384,8 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>>   	u32 log_buf_state_offset;
>>   	u32 src_data_offset;
>>   
>> -	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
>> -	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>> +	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_STATE_CAPTURE;
>> +	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE);
>>   
>>   	/*
>>   	 * Make a copy of the state structure, inside GuC log buffer
>> @@ -1395,15 +1395,15 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>>   	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>>   			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>>   
>> -	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
>> +	buffer_size = XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE;
>>   	read_offset = log_buf_state_local.read_ptr;
>>   	write_offset = log_buf_state_local.sampled_write_ptr;
>>   	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
>>   
>>   	/* Bookkeeping stuff */
>>   	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
>> -	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
>> -	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
>> +	guc->log.stats[GUC_LOG_BUFFER_STATE_CAPTURE].flush += tmp;
>> +	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_STATE_CAPTURE,
>>   						     full_count);
>>   
>>   	/* Now copy the actual logs. */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 50c4c2406132..8b5c58b1857c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -91,9 +91,9 @@ struct guc_update_exec_queue_policy {
>>   #define   GUC_LOG_NOTIFY_ON_HALF_FULL	BIT(1)
>>   #define   GUC_LOG_CAPTURE_ALLOC_UNITS	BIT(2)
>>   #define   GUC_LOG_LOG_ALLOC_UNITS	BIT(3)
>> -#define   GUC_LOG_CRASH			REG_GENMASK(5, 4)
>> -#define   GUC_LOG_DEBUG			REG_GENMASK(9, 6)
>> -#define   GUC_LOG_CAPTURE		REG_GENMASK(11, 10)
>> +#define   GUC_LOG_CRASH_DUMP		REG_GENMASK(5, 4)
>> +#define   GUC_LOG_EVENT_DATA		REG_GENMASK(9, 6)
>> +#define   GUC_LOG_STATE_CAPTURE		REG_GENMASK(11, 10)
>>   #define   GUC_LOG_BUF_ADDR		REG_GENMASK(31, 12)
>>   
>>   #define GUC_CTL_WA			1
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index c01ccb35dc75..995148e3f103 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -19,6 +19,45 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +/**
>> + * DOC: GuC Log buffer Layout
>> + *
>> + * The in-memory log buffer layout is as follows:
> 
> ... as follows::
> 
> and empty line here
will follow>
>> + *  +===============================+	      0000h
>> + *  |    Crash dump state header    |		^
>> + *  +-------------------------------+ 32B	|
>> + *  |      Debug state header       |		|
>> + *  +-------------------------------+ 64B	4KB
>> + *  |     Capture state header      |		|
>> + *  +-------------------------------+ 96B	|
>> + *  |                               |		v
>> + *  +===============================+ <--- EVENT_DATA offset
>> + *  |  Event logs(raw data)         |		^
>> + *  |                               |		|
>> + *  |                               | EVENT_DATA_BUFFER_SIZE
>> + *  |                               |		|
>> + *  |                               |		v
>> + *  +===============================+ <--- CRASH_DUMP offset
>> + *  | Crash Dump(raw data)          |		^
>> + *  |                               |		|
>> + *  |                               | CRASH_DUMP_BUFFER_SIZE
>> + *  |                               |		|
>> + *  |                               |		v
>> + *  +===============================+ <--- STATE_CAPTURE offset
>> + *  | Error state capture(raw data) |		^
>> + *  |                               |		|
>> + *  |                               | STATE_CAPTURE_BUFFER_SIZE
>> + *  |                               |		|
>> + *  |                               |		v
>> + *  +===============================+ Total: GUC_LOG_SIZE
>> + */
> 
> since above layout is fixed (up to actual data section size) this DOC could be placed in abi/log_abi.h
Yes, to be moved>
>> +#define GUC_LOG_SIZE (SZ_4K + \
> 
> maybe this one should also be defined in .h where other _BUFFER_SIZEs are defined:
> 
>     #define XE_GUC_LOG_BUFFER_SIZE (SZ_4K + ...CAPTURE_BUFFER_SIZE)
Will do.>
> or make all names shorter by using only _SIZEs suffix:
> 
>     #define XE_GUC_LOG_SIZE (SZ_4K + ...CAPTURE_SIZE)
Refer to my comments below about shorter names.
> 
>> +		      XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE + \
>> +		      XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE + \
>> +		      XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE)
>> +
>> +#define GUC_LOG_CHUNK_SIZE	SZ_2M
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -37,33 +76,6 @@ log_to_xe(struct xe_guc_log *log)
>>   	return gt_to_xe(log_to_gt(log));
>>   }
>>   
>> -static size_t guc_log_size(void)
>> -{
>> -	/*
>> -	 *  GuC Log buffer Layout
>> -	 *
>> -	 *  +===============================+ 00B
>> -	 *  |    Crash dump state header    |
>> -	 *  +-------------------------------+ 32B
>> -	 *  |      Debug state header       |
>> -	 *  +-------------------------------+ 64B
>> -	 *  |     Capture state header      |
>> -	 *  +-------------------------------+ 96B
>> -	 *  |                               |
>> -	 *  +===============================+ PAGE_SIZE (4KB)
>> -	 *  |        Crash Dump logs        |
>> -	 *  +===============================+ + CRASH_SIZE
>> -	 *  |          Debug logs           |
>> -	 *  +===============================+ + DEBUG_SIZE
>> -	 *  |         Capture logs          |
>> -	 *  +===============================+ + CAPTURE_SIZE
>> -	 */
>> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>> -		CAPTURE_BUFFER_SIZE;
>> -}
>> -
>> -#define GUC_LOG_CHUNK_SIZE	SZ_2M
>> -
>>   static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_guc_log *log, bool atomic)
>>   {
>>   	struct xe_guc_log_snapshot *snapshot;
>> @@ -257,7 +269,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>>   	struct xe_bo *bo;
>>   
>> -	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>> +	bo = xe_managed_bo_create_pin_map(xe, tile, GUC_LOG_SIZE,
>>   					  XE_BO_FLAG_SYSTEM |
>>   					  XE_BO_FLAG_GGTT |
>>   					  XE_BO_FLAG_GGTT_INVALIDATE |
>> @@ -265,7 +277,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>   
>> -	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, GUC_LOG_SIZE);
> 
> use xe_bo_size(bo) instead
Good idea.>
>>   	log->bo = bo;
>>   	log->level = xe_modparam.guc_log_level;
>>   
>> @@ -274,49 +286,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>   ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>>   
>> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> -{
>> -	return CRASH_BUFFER_SIZE;
>> -}
>> -
>> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> -{
>> -	return DEBUG_BUFFER_SIZE;
>> -}
>> -
>> -/**
>> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
>> - * @log: The log object.
>> - *
>> - * This function will return the capture buffer size within log sections.
>> - *
>> - * Return: capture buffer size.
>> - */
>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> -{
>> -	return CAPTURE_BUFFER_SIZE;
>> -}
>> -
>> -/**
>> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>> - * @log: The log object.
>> - * @type: The log buffer type
>> - *
>> - * Return: buffer size.
>> - */
>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
>> -{
>> -	switch (type) {
>> -	case GUC_LOG_BUFFER_CRASH_DUMP:
>> -		return xe_guc_log_section_size_crash(log);
>> -	case GUC_LOG_BUFFER_DEBUG:
>> -		return xe_guc_log_section_size_debug(log);
>> -	case GUC_LOG_BUFFER_CAPTURE:
>> -		return xe_guc_log_section_size_capture(log);
>> -	}
>> -	return 0;
>> -}
>> -
>>   /**
>>    * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>>    * @log: The log object.
>> @@ -327,13 +296,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>>    */
>>   u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>>   {
>> -	enum guc_log_buffer_type i;
>> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>> +	u32 offset = SZ_4K;/* for the log_buffer_states */
>>   
>> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> -		if (i == type)
>> -			break;
>> -		offset += xe_guc_get_log_buffer_size(log, i);
>> +	switch (type) {
>> +	case GUC_LOG_BUFFER_STATE_CAPTURE:
>> +		offset += XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE;
>> +		fallthrough;
>> +	case GUC_LOG_BUFFER_CRASH_DUMP:
>> +		offset += XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE;
>> +		fallthrough;
>> +	case GUC_LOG_BUFFER_EVENT_DATA:
>> +		break;
>>   	}
>>   
>>   	return offset;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 98a47ac42b08..a3620462f44c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -13,13 +13,13 @@ struct drm_printer;
>>   struct xe_device;
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>> -#define CRASH_BUFFER_SIZE       SZ_1M
>> -#define DEBUG_BUFFER_SIZE       SZ_8M
>> -#define CAPTURE_BUFFER_SIZE     SZ_2M
>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
>> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>>   #else
>> -#define CRASH_BUFFER_SIZE	SZ_16K
>> -#define DEBUG_BUFFER_SIZE	SZ_64K
>> -#define CAPTURE_BUFFER_SIZE	SZ_1M
>> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
>> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
>> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
> 
> what about using shorter names:
> 
> #define XE_GUC_LOG_EVENT_DATA_SIZE	SZ_64K
> #define XE_GUC_LOG_CRASH_DUMP_SIZE	SZ_16K
> #define XE_GUC_LOG_STATE_CAPTURE_SIZE	SZ_1M
With BUFFER_SIZE, it is clear is the size of buffer, not data size.
Without BUFFER_SIZE, XE_GUC_LOG_EVENT_DATA_SIZE might mislead meaning to 
data size.

> 
>>   #endif
> 
> then we can also provide here:
> 
> #define XE_GUC_LOG_EVENT_DATA_OFFSET	SZ_4K /* btw, this fixed 4K header size should be part ABI def */
> #define XE_GUC_LOG_CRASH_DUMP_OFFSET	(XE_GUC_LOG_EVENT_DATA_OFFSET + XE_GUC_LOG_EVENT_DATA_SIZE)
> #define XE_GUC_LOG_STATE_CAPTURE_OFFSET	(XE_GUC_LOG_CRASH_DUMP_OFFSET + XE_GUC_LOG_CRASH_DUMP_SIZE)
Good idea>
> 
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>   	return log->level;
>>   }
>>   
>> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>>   u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
> 
> then we can kill this function, as there is only one user which can use XE_GUC_LOG_STATE_CAPTURE_OFFSET	directly
Good idea >
>>   bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>   				   enum guc_log_buffer_type type,
> 

