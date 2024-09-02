Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA47BCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 11:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209E10E2C0;
	Mon,  2 Sep 2024 11:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9P7d2zV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9837D10E2C0
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725278122; x=1756814122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lym98TrNbvVSwJ/BYSszl/yfOHDEcwcuyEu0spEoZPI=;
 b=R9P7d2zVRPQOxdALzuH95Nz4uWOV8JBFox6o1utGv56cZ5Qj9nngdFV/
 gTUbhmN9ng0s6KSXeOD3kkh6WUYM5q3/CzVKkqICwQCcCBWut0WQ/vlav
 sDOjPH4amgbKyrsfk2gG+H9RQqLPZrd/2mrGEUQchxzeFbm8n1EH3WrcT
 K++yFAo8mk442/f4C8d+Top1npAbPWkXMyf+EmbPxbwTCVF5UIAqcfyge
 qL711StWgafM0O2ftFrJSavxXm9GovAerxBKPJ2GnBI2/V2BEB6/m/sbc
 9EjophK472Uxb3rhqIqjzv4h4IItuhB10UEnaPOZ/Y6HpdA7Zcl4qIlXp Q==;
X-CSE-ConnectionGUID: hKlMKkCJSDeF0TQZvLfU9Q==
X-CSE-MsgGUID: 9N6zLB8UQGWE8187nBpjFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="27643052"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="27643052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:51:05 -0700
X-CSE-ConnectionGUID: 726mQXLVRq6pQSXgODVscA==
X-CSE-MsgGUID: dVko5NRzTsWFclrBKU/H3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65307112"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 04:51:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 04:51:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 04:51:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 04:51:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 04:50:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmBcXZFuGlMqAaGNEKigExWzs3AVBQUBzc06wV2UmT+aroRUA49VQHtFfMDqkYBdJih29dqSB6zjB/8pf+bhSTst9TIflDnJn78ZxTHQXTDORD5hsBkx1pr5C8uKEABies9EMbXpO/40VztrxIoSJY2k5vB0xfX5O2DIR2oE8rZXEl2cMqLSPphU4+Y7kxchTumKby8VmjNAQjs6CtcX0rHwac8BhGNuKYaGDRWtmEqB0kG+HOjE7QJ+S/8onshHGwYtNmcNlqmIpjaV8BrsjD5JmwztciK4U/Is8muSAa1gxweWASJAzR7IEZMeCytW18oGbTXPMgzY2hFhq/3TEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B9u9/n0Cmgt2UJQyUyych/Y2d3gCwcU8t3mBh/Y9yQ=;
 b=YINrmrTgdNqVMePeMOxqunUice1q/fFbbLuFp6PHrq9x9YlV7bOJ/Bb2DsQHzxOTDgjqNgRf+P9T+CixF+3dgeSI+GAdo7yaYk6wh1dZ45FbHhUuDktMM3lCQ6pnoYBECU2XbKABeHA6Olfd7cDHSGfeWC1HpWtf9TQjtkYDY8Oe4I0lQfEzsNtxs7KD82Vt5yrvsbeN3y1wgfTxrzWsZxEz0aAfSd6DcRiAGtPiDlh1T36a2w6sG0D1QVBqktEEaw5CgOE6mSdnBg5IDWhKWehwbHT5NkQOWeShurMJWvm0Xu0Udqv8OnPA1epI1h7gDPn/sujOsq8wqNENwHE9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 09:37:10 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%6]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 09:37:10 +0000
Date: Mon, 2 Sep 2024 11:37:07 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pf: Reset thresholds when releasing a VF config
Message-ID: <20240902093707.xromjcrtvmeq5fbm@intel.com>
References: <20240830132100.1704-1-michal.wajdeczko@intel.com>
 <20240830132100.1704-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830132100.1704-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0024.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::6)
 To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c16208-47e9-4372-eef8-08dccb32d1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWcxUExEOGdySjl5NVQyYitjbEYyOUdlVEFiNDd6UXZSYm9LOWdTZnk2RFdH?=
 =?utf-8?B?VG56SHdTUmZuWGdqZ2REMldJeE4yaW5KNVB6OUZmK2tyQ0RlcnVta28rRzBa?=
 =?utf-8?B?VUpoZEE1MG9oSWNQZFpBK21zRk1jSDg1WFZHcFV4dTlldUlDR25TWUFyRzUz?=
 =?utf-8?B?Rkx3bDFadDBmUm5yVkdPcUNkWFdQdE5kdTRoT1c4OWtZS09iVEpBWjh6enU3?=
 =?utf-8?B?MForbk5IVklEbGthL3BaTko5STNma2thY0tJUkJTVElWUHJqN0RhTUZuQU52?=
 =?utf-8?B?b2xPZmJLb05hTWVycGV5Y3NOQU92TzNYdzZIQlYxMHcxanNSRkYyTTcrNmpx?=
 =?utf-8?B?Y2NXaThsVXo0ellsYmdvT3NnS1lUMnl6Q29VdlU2Wm1GUnNlVm9LbzFGYnVZ?=
 =?utf-8?B?NUdSRFZ0U1FYQ0JsTVJpLzY3THZQQ3U5dUQ4UGlHUEV4NEViK3FmNkRId004?=
 =?utf-8?B?ejFIeWxsRXRDbzNNeDZCZW9PWGxNbU9FbjdYNWVIK1o2bUQ2NHhFWk43RXFX?=
 =?utf-8?B?QTZMSTZKWkpUcWtYR2hLY2NlYmpwL0I1WkdtUDJuZzIvTXRFK3ZsTWFOVXJa?=
 =?utf-8?B?RlFZRUc0UkgvSW1PVlFqNFlPYW4wWnF0WnQ0OXZTNGgwUktIVnQ1NkcxNFRR?=
 =?utf-8?B?QytXQ2hZY0cvcHpndVl3d2YreVBuR216VFprNHVPN0wwR1V2WUgvV1ZHSUxt?=
 =?utf-8?B?Ny9oWk1FTGQ5RkhPNEloWW5OZjd0OHBvOFdPNWdrYnpuSWFOL0RjYU5xYkZI?=
 =?utf-8?B?S01Sb3drUnI2OGdzUnB3cEl4N29Kcm5mU3VZUkRCUXpZbGhLRVZ6ZlNCbmJn?=
 =?utf-8?B?YkUzbVgwVnNhMXMydWplZHZHOVVxd256b1k0NmZhZTVLdnc0YXdvbGJ4dDRu?=
 =?utf-8?B?NE9FMW1mQm80dFhaTDR5MXoxSWhFbXkvck5ZUHprYnRyNk5tWG1UeWdMQXc0?=
 =?utf-8?B?SW83R3RkbElHQ1lDMmlsZUdCK284N2kyM2hUc3ZGUUs5U04zS1Q2VDNkZThF?=
 =?utf-8?B?c290b3RGMkl2TkhWcGJrNTBVS2k1UVJUcGNSNkFYbTk5cDR6cEdra2NoMG11?=
 =?utf-8?B?SjZNT09XWVRUQW5vai9ZQS9pejM3TmRMM3loem1mWnI3ZlY5Sm1BTS9iSHlS?=
 =?utf-8?B?b3RjNmREQkF5NUh4cFRLZHE4Ti8yR0xTM0xhMld6NmdwU3R3RzB3TmQreUpM?=
 =?utf-8?B?Ty9Gc3E3bytmNi9pZFdoNkd0eDdHTHI1VFNvV3dzQ1lycE1EM0JicTNrbEZV?=
 =?utf-8?B?cTFJejlmNWFiMnY2ZnVERUtsdWhRRFZ2Vy83VnhSMWRIOFhrOEZZRWtFOUpN?=
 =?utf-8?B?a05TNk5aN3JORFlaMFhCOHUwdGlCeDBxd1Y5OFZIR0hUbUYwcS9HRjN3eC8z?=
 =?utf-8?B?TmIwQnJVNTEveDM1MWJXeHVsUGY1eGN3clBHSzBncXFqaVFLbDF0OTRMaFI4?=
 =?utf-8?B?WExKV1ZjYXNkM0s4dHJGbGdhMnhzZnBrVzF5ZTU2Tm1tb3l4WU1zTkNJMzhF?=
 =?utf-8?B?Smt0TXNUT2MxbGJLcFh2ZlRhWTlwWWsyd2VLd21wN2Z0SWV6Q2NqaUp2UXJK?=
 =?utf-8?B?ZGMwSXpiSThVaWdET1RLM0MrSlhkTHFkOXB3dHZQeHk3SGowVEVheGxNRllu?=
 =?utf-8?B?V1Y1VEdHZFIxOU1BSW91RHBZeVpWdVE4OHpOTzhTUjRIdko5US91d0ZzNHhI?=
 =?utf-8?B?S1VlU05tengzNFlHY1VkZUZWaHMxNHhzU1JxOUZsdkhJNVMzeFJQd2xadVBC?=
 =?utf-8?B?TWhtZkJNQkJKQUdxNWRnSVh3VE1KbmJJZGs4UlpIME1OUDArcVU4QnNQQWpq?=
 =?utf-8?B?bkloSTlXLzZKZTFvRjRVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXIrOEFrVW0xSTRFU01yTFljZ0p3NW5LaXpQVUpZczY3WnR1cy8wTi9Pem96?=
 =?utf-8?B?YTBoZjlYbFlxaUN0cnJlM1JZN1R2QXRLN2hibkgxZ3NVK09wbVlBbWV2akJQ?=
 =?utf-8?B?SW41aUUxeXZLMlQxdEdVK0lUYytXa1g2aFE4SGVtQXZ1WUh6VHZoVXZmTmpL?=
 =?utf-8?B?Rzk4MUtTOFdNR2J3YlhQeXF6K2RRblVDQ2JzdFB5eThUL3pJd2wraUdqbytO?=
 =?utf-8?B?TXU5bGh2WXdlZGhMMy9CSnRFM2cvazVpbkR5UzVIaHhGVXF2RVpTT240cWIx?=
 =?utf-8?B?a1NNUkZ6bTh1Z0F1MEdHTEc0WmF6YzFqL2FDUjhBajNVYnpvUFdoZU5pQkNZ?=
 =?utf-8?B?NTc5T2hzN1ZNeFdHeTJEV0lmR3VhVldXTXc2Z0VIMEJvTjdYVVJ4RTJFME1t?=
 =?utf-8?B?TVI5cUVSUzhmaFJrdTNGV1lscVpZQ0NJVXF4MTFWeTkxNzBsbWtQR1VFT0lD?=
 =?utf-8?B?ZlQwS3cxWDJNSlp0MkoxeVp6YUFIKytUTGxrVTVIL3l6dVdPcFRjZUJld0t1?=
 =?utf-8?B?aUw0bE5BV1ovNWoxSnZINjdWMnFSSnFnSmRTdE1DK0NiTEwvYU12eXVBbnp1?=
 =?utf-8?B?aHIxNk9rempzem5YQW55eHFwYkwzOEU1ZmlSQ3AvYTN3cG80cCtrQnBDNTlF?=
 =?utf-8?B?aHdKbmNrUXFVblh5dDhObXNoSzBkSG04NTdNU2pvejhGZzFyaERVOEFKM2J3?=
 =?utf-8?B?Y3RLTktETVN4cEhZdlNxUEtzTUhPRFd0dWFCUmw5Sis3cDhzQzhsMUFqZ3Zh?=
 =?utf-8?B?YkMvNzhleWhEdFh2cmp1TDFCOGpaNXpTeWZJMXlxS1cxaVN2aHVrTDc2SjlR?=
 =?utf-8?B?NU0wVzhwNTVkVTlhOWlxRWtyTC9ZdHlFaDRwNmlWc1FDUFhTK2FPR0lTSDhu?=
 =?utf-8?B?dnFwWUxxWlFvdzVHN0NFN1FadjBydWd1M2dLMHVBMytHY3gyVkZCaDNMSXI2?=
 =?utf-8?B?ZnpNRVNEQ3B2SkNiVWkxcU1lUkQyTXlNanhQVERrOUZ1QTVDUnhENUlTWkYv?=
 =?utf-8?B?ZVJ1RGpjaHRQYUR2Tjlna0J2c0Z6T3VOWU9SdTlMUXJGbjZwSmF2WHZaYmNn?=
 =?utf-8?B?cFNieEV2RDltY2pHSDZscGlDbXZXdXU1VG9HeHFDbTJiK1YwcGJxeDk3S3hX?=
 =?utf-8?B?NC9hUHl6ZmdpVUxDSVl5Y2JKT09RYWVTMzhPUEZXbU9aek82b1BuRjZDVkF1?=
 =?utf-8?B?VGF3SVE4ZUdmazV6UVNnWVRGUGVwMDV3ZWJycHhoWldWb3VmOVVscGhuNHVF?=
 =?utf-8?B?ZXlOM2h4c2RXVCs2WnhWczlUUUJyQnpFS1l5Y0IveHV1ZkR0QlVNWjZGRlVM?=
 =?utf-8?B?WEx1SDRrQjYwZlhUdzZMK1JkRDRoQzZCT2VSN01VMzZrWkZkRHliSWE0a05D?=
 =?utf-8?B?VHpFalRpa1hRTVQ3SWZnend0VG90NWxxa21RVVZ1emJudGNCS2syN2c5MkEr?=
 =?utf-8?B?dE5BSmwyOXdtWnlHbnQyeVBXVWUrWDEwMXZGLzVIUmJUWmNjMDZNNkJHTzJw?=
 =?utf-8?B?QzlMUUdZbmNwRmVNUzJRNG5oWUdoM1pxS0RRVHliQ25DaCs1YXhmZVJQK00w?=
 =?utf-8?B?a1ZzZXY0cXdBWWh6Qm1UNkdmcFFTbHR5ZktPNXo0WlhqcWJwTVB1cTdPcnRQ?=
 =?utf-8?B?ZHZFTjdPK3p6b0ZEL1J5cGFvbktHZkVOZWN0Y1JxQ0piaDk3Z0hHTy8wU1FJ?=
 =?utf-8?B?cWl3R3M3cDBjcHZWSFY4T0QvNDNQeitFMkZmVUJnSlU0QVZrcTZibDF3QW1s?=
 =?utf-8?B?TGt4Tk0wV0tLMk41bVNJM0ZRRUFubjJNWlhQMTA3TlExQUg2SDRHZ1ZJQVhG?=
 =?utf-8?B?VnlRZEVrL3BUZWx1Yi9tUmpnYTl4Vm9zalBSbmZLQ1dFMjUzbDJubVQzS2px?=
 =?utf-8?B?OHRTRW5YNHZ3bW1ibmgwUW1IMDd6a2haVHUxU3RiWi9lbWJvL3RyUW52a0dF?=
 =?utf-8?B?Z0h1MUJMcGF6VmI4MEJkNzRsQkpjYTBvL05GL1hMdHh2Z3gvOUQ2ZTBrcWxz?=
 =?utf-8?B?SGMxUHdiTGRKL0tqTWFoazR6WWZoYWNlZzB4QWxIb0M5Zi9qM3dnZDRQcnJQ?=
 =?utf-8?B?S01QeG9pUFQrdVF5MWVtcCtHQkhucGZDQUVIa09KSlh3YXRVS1QvSkVOKzN6?=
 =?utf-8?B?ZWIrbFA0ZmM2OW5RaURXU1UxcEcwOElCTFgvdHBNQk9PRm5POTV0aS9NNEJl?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c16208-47e9-4372-eef8-08dccb32d1c2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 09:37:10.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEDQW3QTvgX+fDVlpPlrOe/TeRbu9qSPfO5uq+ALb7kQSlYHSaivfeO5EaV1Q7LaOaCiDHOFwHFcB1bDOHBPspUvEdohmOPeRwSUqfPV1Ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-30 15:21:00 +0200]:
> As part of the VF config release, we should reset all parameters,
> including thresholds, to always start with the clean VF config.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 151eb69ab4ae..a95e546b7744 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1842,6 +1842,18 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
>  	return value;
>  }
>  
> +static void pf_reset_config_thresholds(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +#define reset_threshold_config(TAG, ...) ({				\
> +	config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)] = 0;	\
> +});
> +
> +	MAKE_XE_GUC_KLV_THRESHOLDS_SET(reset_threshold_config);
> +#undef reset_threshold_config
> +}
> +
>  static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> @@ -1857,6 +1869,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	pf_release_config_ctxs(gt, config);
>  	pf_release_config_dbs(gt, config);
>  	pf_reset_config_sched(gt, config);
> +	pf_reset_config_thresholds(gt, config);
>  }
>  
>  /**

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
