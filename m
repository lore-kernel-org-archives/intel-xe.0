Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB65EE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 19:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8F10E14E;
	Mon,  9 Dec 2024 19:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hH/rdcg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA1C10E14E
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733772737; x=1765308737;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=00Vq38FYlePCGiAODvQyy2QI3aS9cZ5PvRGsD7hpI9s=;
 b=hH/rdcg8cgeW1NZaau/USn5/J51KG2u618veGw4zjEph3STw5fGYWL0/
 Jdz0DeZwWgJ2BWw6KFJaBft6RCcWlVnc/CdoPH8dxmFxMdXsf4ZaYfqBm
 E4OlVMlemK6EjQAlOPsUiCP90/qV4gC+M0C/hxTDOYkljR8M2NemLJrHw
 R8FxDP23PLvicaSK6gb38ZEkVdnYhDZFpQ9AVz1t4mMXVlIkEVR/8mjAM
 mluTsafh2P/+blEy31OapAm1PmTEUSggrYPnsWlfo7+QrWNFvvrXSk12O
 wXfz5gPBpdICykiF+0ZfvKc3VelyMcJaqPjmG4rMuN9ZSvjD8lQy0ltdG A==;
X-CSE-ConnectionGUID: XUsrvqSFR7mbjQW7+Vbg1Q==
X-CSE-MsgGUID: tOhv3ORFSTWALOcWlPzlng==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33428176"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="33428176"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 11:32:17 -0800
X-CSE-ConnectionGUID: j5UEGHVKSFSkMpQ5cy4qZg==
X-CSE-MsgGUID: 2Znejq1nSaKoFNejbmNZ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95621903"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 11:32:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 11:32:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 11:32:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 11:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgLhfBH9Zyi+GYIwqS23Qxg/Dt5HevXVyu8lutjQBHd8rOuGfFe3i11KhEVHAN/bmdhAoYZE/NONmCB4462/btFoErHd28r2xf67s2RSQPAmpzX9jUOe3PTY3D37POel7X2DkGgS0qIlZwtZO2ISP20/gWmPoMD4qgLd0/otfVDEFZ6BgcrkLfr/pQqo6LEE6ieqGt/6Yy3kKYvez4I8az987fpYwDK+Cn2aBB2QmGMHS/J7hQXR87npo3PK4l/fptDJo4BjDAEDFSystj2CRJPVXkGIJBPDe1nNkOHkIgm0rU93wmx/4bYd4YcGy7m9xC+73kE6/70w2JNh/jCWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL6vilINhzkCTGBq0p3sD2/RnsbhLvi3GhL5/px9gNU=;
 b=VHP2cMH8YidDvtabXbjokyx9hR+XczhnA1S0TpAYGI56gUEgmFMva7RBm3H+d7LVqER8+epJdoEmRqFUD6FUlgMvW6xc4mAQM+0iuyrCWSACqmV6nbhMUOjZtazY5tQOAQcHE+6NfCQwO9yXRjq4AwrkQSVQQnEjdyzMAzolKio5UlCcWYx54NW3CJQQkLmH+klScJtjNdvTHipTFDM3e8my9iIO60rI/SE/gHHTpK3nsoRZSJ9p2nzJ7/PZPjqPCckbpnQmhImjtf0j01kAchkPX2R7hvp9dFLKQ+Utg1ys7dWswPX1FkvgftLFVW4WAsKIIUICCP4rCv25/K2iuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 19:31:54 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 19:31:54 +0000
Message-ID: <a20828a2-68f4-4904-8ff5-1d453ec069c8@intel.com>
Date: Mon, 9 Dec 2024 20:31:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: make change ccs_mode a synchronous action
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
 <20241209141210.1311374-3-maciej.patelczyk@intel.com>
 <e53cytk6v57vw3xcuhwwc7nncseg33q73tmyox46r6zwhwvaev@guigup4rn5x5>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <e53cytk6v57vw3xcuhwwc7nncseg33q73tmyox46r6zwhwvaev@guigup4rn5x5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0024.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::29) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f9dd28-b660-4a49-e600-08dd18882323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEtuS2JCUDI3Um9ZbFd0VXJyeW03U0R3WjRWd0JnSkI1TVA4RytObWtZV3Va?=
 =?utf-8?B?ejhtTTBnUXptV2VTekhnak02REdGRGx4UkFxM0Q2eEFvT3UzUnh4czA5UUFV?=
 =?utf-8?B?anRPMm5QeU11RS9lUzF2cEVBdEQxTWZXUXllWUowcXZ2aStZV2ZmN2s0U2Ur?=
 =?utf-8?B?MXl0QjhrYjBrdHJ4em5FRCs3NWY3QXpVSE04QnZkNVJYY3ZPNS9MOGdKUG9z?=
 =?utf-8?B?cTl3d2ZHU2s5akEvcGN2WFgyNVRlMEtncGJ0OGpvSmE1RmxQT1ZLb2Z1T2M0?=
 =?utf-8?B?SkVZUHhHc2d3VlBjTDlLRnNnVVh6aEo2ZU9HdmxZak1ETGIvc2ViNWZlTEtT?=
 =?utf-8?B?MnhLbzNQU2NEalczMHYxR1l2UUV6V0tJZmF4b0pKb0hndXpYZmdKVW8xTDRu?=
 =?utf-8?B?aDFEZ1JJdFloNStPK3hrSmU1RCsrUnNGZlFTQXB0aDdaVldwY2VGL1d4QVhB?=
 =?utf-8?B?enpNM1U2alZJNGlXWDc5Sk4xbFNKQ21ZRVhQTEY2QzFZbDQ0L1U2c3RTWENG?=
 =?utf-8?B?clFrTWkzSGcxcytjaUM3RElPdWtjSEUxeGtic3BkUTdzUVNLZ0gvbDFHV0hu?=
 =?utf-8?B?Y1ZoZEVhRDMvWGpiWUlFNUZjUC85UWp2c0F0dzdqYVpLdEZrdWNHSVpQNEV5?=
 =?utf-8?B?OUY0NXQ0M0tMS3JoMm04cWtvU2xBNEhMeFZyUnJEMWtqalprMzU5dGp0Z0x5?=
 =?utf-8?B?TkJtekxpdnhRQWVZNFphb0VkUnpzNnJkTVFjeEdsSkFqdFZtTVowMnZDVmNp?=
 =?utf-8?B?Wlh3blpXcmtldnJXT3VSb1JJbE0zdkFjUWkydE9CbkovdEJXZHV5N1d1c2hz?=
 =?utf-8?B?bmFBWkF2TEo2TXRYekljdjllOW9FY1lCbGJxc0F1YzFmL09ndVl6OWs4a21T?=
 =?utf-8?B?MlMvMW51dW9PRzFNUUR0YWR2Rk9NZEYvVTdpVTN2MnRqbnltc3UyUm9QditH?=
 =?utf-8?B?L0JVQm5yc2syYk85NkRKUWk1RXBRVDYxWUo0T0MyNW9NK256OHpNRFdBT3pS?=
 =?utf-8?B?MUs4ZzkxTUJNQTQ2SVphamI5OG9lMGNGSmhLY0FJamF2TDhhNnRFRFpPNE00?=
 =?utf-8?B?b2FFR3RoZzZnUnBtSWpqTStEaVVNdFRCYXpvaHhCOWNzNmswRGFmMStzdFB3?=
 =?utf-8?B?Y1NhOThmRDdodjhTaThFYWVYN2xteGpGdFRtS2wveTZ1TTVOcWxpSXpNZlBw?=
 =?utf-8?B?WlB6UWxsNEVTN3F5NGN4dzRoRUFxVERJRnVIdHdtQ0JaTWVuZFlCaTk4Tmxx?=
 =?utf-8?B?d3BNLzRhVzh4MkVQbEMzKzEvdlo5N1NPejBDdlRUL25lOUhwekpQKzQ0b3VC?=
 =?utf-8?B?MGVpL05Wa0N4b0FhY1UxdEQvYVB0TFNHR2kyNm1KZU9ibll0ZlVFNWxhOEhh?=
 =?utf-8?B?dTRrUm1SUm1raTFQVUNWRzB5YUFJY2ZZU0VIZVN2cVdPZEtzWG5QelQyQWpS?=
 =?utf-8?B?TTk1OHl6cld4M3g2YW9uaWtuU1ZkU3pESkltY1REK2pCbkFnVksxYkt0RHBX?=
 =?utf-8?B?djRRdmxiMEw0ZTZFUGJLeUU0Zys0K1FNOEphUEJ1T0ZtbklyNm5UdE5ORHlD?=
 =?utf-8?B?cVp6eHdZOXRtc0FGK0Z3ZkI0aGhUV0x1eUlyUWlqNEVqVDJWSGQwK1dtUmlB?=
 =?utf-8?B?NEExT1VLTjM1SlcxSWM2aUIzbDZyVEZnQTRvc0cyMk1pMXM2UlVPTmZ6QmFO?=
 =?utf-8?B?UG1WS01KYTJ6anlkamhiV3VLT05lL1dUME0zSWxoNmF2alA0Zmkvbjc1d0pn?=
 =?utf-8?B?U0RpN28xK0xZQmk2QVhjNjRleFhmK0RqYzkrQnhzVGRJa204dGNxMkZKNU4v?=
 =?utf-8?B?M3NaVnVWQ01idW8xa1Fqdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5mcE5HWm1JdldpVjRSWHhnWitsbS93eHU3RmdFMkw5dzRac2dTT05mY0Nr?=
 =?utf-8?B?Um1aWnE5Q0VvVjVmdzRMeXdBTFRkMW9uUXAvZXBxZWwyR1FTTkYybUNGK1R3?=
 =?utf-8?B?UHZIMVRNM3owY2praitJQXlrbkltb0Nla3pxUVhBelhOaXNwNCtZWEx6OFlG?=
 =?utf-8?B?anpsN21HeGtvbEN6Z2FsLzl5SUNCaHUvK1JoMTN6Nkc4VzJRM0twazkyRVUz?=
 =?utf-8?B?QXhFZnJJVDdheTFiYy9KUWlHTzFPZjRmTzZUS050U3FkUHlqZE1hZjRJL0Z6?=
 =?utf-8?B?OGdxN0QyMi9rcDdrVytiV096UGV1WlZXakYvSUhncFJvUS9rbGVDRUh0VTVY?=
 =?utf-8?B?YXB0UkRWMTNNUyt2R1hFSFRGaFZ4VWc3OFdjWEdFd1diOU9LVk43Y3ZRaDVN?=
 =?utf-8?B?eDdqcVpUUEJScEdYdWxaSWI1YjVtQndDNnBrUjF1aml2aGF2WjN0TmVGWStQ?=
 =?utf-8?B?NzhZSmhXK3FmRTl6dzhhdjk5WjI2ZjN4RldCWU9TV0k1WlVVWWZMc0kyb1N3?=
 =?utf-8?B?by9QVnBhemU2WmNYNk1wRFpuU2dyQ25XZURGalNhcjExMnpJMVFSamdQdzNu?=
 =?utf-8?B?N08zSDFXQTJabE1PUndXNkVBYU0vZmZyai96RmxaSlZMM0pUY0xudWk0Njc2?=
 =?utf-8?B?WXJJWjNqaWlkVENWMGh5WkZJZ2tJeE5YRGFleEZvajlPODgvWXQxaUJxNTB5?=
 =?utf-8?B?dlpaNnZMSTVtOE1SOHNoWThBVExFbTh1eXY1TGExdnJpMzUwRWh5ckY3TExU?=
 =?utf-8?B?Z1U5c3FWRWpoakhKTmIzNExZaGVWN2U0SmtuWldmelhjRkFpUUV4aVF5RjFz?=
 =?utf-8?B?Uzd4QjFJTEtHc01uWUtwMUE5THpWTkhmaDF4VUdGTEZSb1NFZlhLaFNINVA5?=
 =?utf-8?B?N1d0Mytxd2dEQU8vWkdCb1UyZVJDVWtQM2ZCcDk2VDRQTyszemN5Ui8xenN2?=
 =?utf-8?B?Y3k5L2t1Q21lR2Z4VEFMMDREeFFBejFlTUN4LytrMGtTZVZ5SU5ZMWNmeS9l?=
 =?utf-8?B?SGFxNDl5RW95dm8vK29laDBRcjR4WlJGU1FzWS9lejJnVGs4MXZrdUNGZDMx?=
 =?utf-8?B?MFBVSVJrNVFNSUpkcGRkMDhPOVo0eWhDbGovMUdhL2Ivb0FrWVhPVXFyd3BM?=
 =?utf-8?B?dWtITDZVdzBLU2s5UkhmNlV1YWt3Rksyb29XdHZZU09ZdDdCUDdtQzhsMVdY?=
 =?utf-8?B?UEFjcDgycUNtOThDZnBnZzNQVTlYeVZvdWpPTWx6eFVldHNMdEZITHdjOVVM?=
 =?utf-8?B?ZURGM1B2eVk1cEpKTWdxZmowQnhueUZWZS9WZjdvL0JORFhDTmswS2poSjhB?=
 =?utf-8?B?bXNoZmY5V21zdmNYK3o1MzljNDJTS0FBTThqQlNqeDZMa1paY3NESVhuazhj?=
 =?utf-8?B?QkxHSFpNcU1UYVB1VDh3elUybGRtNnN3c3AxeHp5anY5d1M4QWo5bHM5YUo2?=
 =?utf-8?B?SkZZaUZMWXRqcTFNKzRYQ3RWVGYrT3JTdjY1N0ZJQjB6MDh3STJXWmhYbmgv?=
 =?utf-8?B?RkFoL1I2L0ZXaWFqWitiOFlYbVpDejlZcVVGeFhYUW1FT0U0MjkxdExYZXJq?=
 =?utf-8?B?UGtaWVpTVlhHMXpqWHNEeFJFWEgzR1ZzeTdmNFJYRGNlQWJ0SDJhWEpjd251?=
 =?utf-8?B?RHZRVDZ0Y00rNmZCaUp1eWlWQ2xMZmN0NHQ1NDF5c0ZGR3lOYVd4L000clpk?=
 =?utf-8?B?MzlVb1lFUVErMGxOWTBnN3l2ODZIYlhWOTZjUzU3eW8rWUJ3eUNPWTlPd2tv?=
 =?utf-8?B?RTE1WU5McHJqR0dLL2dDK0VlVkZzUWNSY0Z5VkNaaWx0UjNyWEp3K25zM0hD?=
 =?utf-8?B?T2x3dGR1WWVNRHpZclp6Z3YvbW1hMlZVN2J5UnNCaHVEakU5ZS9ZcDk3UFU5?=
 =?utf-8?B?ZzNkTUh5ckFHZFpoVWlma01ZdDZIYzAweExXRGllaTdIbGpac0FZVkthZmpz?=
 =?utf-8?B?VUxQRlpaUjI5cmVEMjdhR09GQ2NUZktSd1BqbDNsNzJZb3ZzaHgwQjNJQkZB?=
 =?utf-8?B?UDZRNE1qYkM1bnZzOWRVUTY4UTB5UEE5bUFuV3hjeSszK2RtN3BDa0FEY3M0?=
 =?utf-8?B?MmxiNGRWRWE2QVNVdFBYRG1TQ2syd1p1WnFJd1UyK3IwMDFEVUsvamg2UEpl?=
 =?utf-8?B?QjNpbXAxK3JRc0lwUTN3TXhrN3ZzSDZqUDdNS2U0QWttSk45UU45NWsvaVBt?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f9dd28-b660-4a49-e600-08dd18882323
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:31:54.3526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t59cqnbmmq1K8NsJGEUDIUaGIkEopDu7mZifd8gKHQU0gyQu7MoPhLNumhcrJcC3vGo864HWY7pAmgJti7vdc6oerDHIwe3N9gMdYZzHVyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
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

On 9.12.2024 17:26, Lucas De Marchi wrote:
> On Mon, Dec 09, 2024 at 03:12:10PM +0100, Maciej Patelczyk wrote:
>> If ccs_mode is being modified via
>>   /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
>> the asynchronous reset is triggered and the write returns immediately.
>>
>> With that some test receive false information about number of CCS 
>> engines
>> or even fail if they proceed without delay after changing the ccs_mode.
>>
>> Changing the ccs_mode change from async to sync to prevent failures in
>> tests.
>>
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c 
>> b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index b6adfb9f2030..8d02ec3f7d12 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -115,7 +115,7 @@ ccs_mode_store(struct device *kdev, struct 
>> device_attribute *attr,
>>     struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>>     struct xe_device *xe = gt_to_xe(gt);
>>     u32 num_engines, num_slices;
>> -    int ret;
>> +    int mode_changed = 0, ret;
>>
>>     if (IS_SRIOV(xe)) {
>>         xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> @@ -151,10 +151,14 @@ ccs_mode_store(struct device *kdev, struct 
>> device_attribute *attr,
>>         gt->ccs_mode = num_engines;
>>         xe_gt_record_user_engines(gt);
>>         xe_gt_reset_async(gt);
>> +        mode_changed = 1;
>
> I think this can simply be the sync version. We don't want to allow new
> clients being created while this reset is taking place, which is what
> the mutex below is protecting against.
> Lucas De Marchi 
Hi!

Does it mean that the xe_gt_reset_wait() shall be in the critical section?

The wait can be unconditional as flush_work won't block if there is no work,

but I haven't tested that.

Maciej

>>     }
>>
>>     mutex_unlock(&xe->drm.filelist_mutex);
>>
>> +    if (mode_changed)
>> +        xe_gt_reset_wait(gt);
>> +
>>     return count;
>> }
>>
>> -- 
>> 2.43.0
>>
