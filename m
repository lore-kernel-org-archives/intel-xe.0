Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F61C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 12:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E760210EAD3;
	Wed, 17 Jul 2024 12:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeTK+OdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8E710EAD3
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721219809; x=1752755809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hngS8H+4y6KvOVtYcV6vLYIOOaW7nqxstKZ2Bm+OUrc=;
 b=JeTK+OdQeyDpzjCb9K7EyLuif4VqG3Urvtr9Tbo96/jVnSN4vY4QQYgv
 JrM6+qLqd6c1zOlxiXyWVYzRcUPLwgDMNcvPxTaz79LhE0bPotLhKdkhY
 rgeYgPlZ0/OtC/XtwUejqenlKdO5TTano9/M7l30SfVVlGxaFZtFdaBzt
 H4S89DgAdbA2ye1t2LMCGQPfr3j6y6EmSRv8q9iiIPlsFQTLpmi97bNJt
 NlzIZFS9CewLsZIohhP26T8BtT7EWqBpPZwYxZJ+O0qkYXWiBGLOsQXE2
 q+oW+UUyp9ybrGhUiAkZNyCpprBB3KjhCXRriLlZqC0ZZ6ZpuhrlxCBI4 Q==;
X-CSE-ConnectionGUID: nkDHHs9CTim6eE9Gy0l6ow==
X-CSE-MsgGUID: uDJWtnZCT4qwuv/HhLd8jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12587996"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="12587996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:36:48 -0700
X-CSE-ConnectionGUID: rzQOl/JRQCO1kyvDq8hmkQ==
X-CSE-MsgGUID: nGhJngI4TlS1U5hdlmXtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55226593"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 05:36:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:36:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:36:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 05:36:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 05:36:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJYGuSF14JFUoWdM9RMs36BbJlRh2J9xvD7xQ2AvaKiGCs9KyTP3Q0Lti6XT17mk33SItX+yEAI88ikfE5NeqoDGUfSdeyqbykrpBtFQgUqgDz7Yr1QuEQSf6zLB69xT3dJvND1a3GYIdyh4ywnn4ObzG6W4qMl/3X9mOkObZp3gNizR0+Hsh9uohmpT5s6OHlcB0iwxXxyMXt0Rv0WV3ZiUnAYAWvdN2M0ogh1I8gIB04ojMFzjvmZ/6czq4bB1BH5vStmQJRNRK9WV58KyPyTBOX/aGSTag+V4N7ikBv48R0B9Q+AHZMdG7OGw1d9Y/6pNmPlhqSSxgTxWCXA5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itSGAyGn6mXO6lKFGDR8M5F6RRh208hZOpubdYgZnsY=;
 b=U8xRsz+uGqENiyLE2LqobwnJ9wFwU7blDm//GwltoUQ3fpggGEX/5HI5YWN/H/AOXS8OZ3WzfBa5sNXqVm+fGJWkuTCgYcLEMIfK6FJPaDtq0fh+N1biOC+MabblRY75wOiXnDjhZ0fMUxE+kheCxopRpbWI2/7O5j6yHgBwrLrGqZnhBin1i9V01DyoR5mccdhpg48s91HSv+C4Fy7wDXNZWsUr61bjs+MfG4Cx0aQH9pUD6pfLYGyLw/CRoaOQbixv3rn/cDNQjCFmxb0nBpf5AYBabXo+lgBEBDqKA4f/bNemdsmo4nZ/B0Idt8mA8VFdpLW14mLj0yl482vZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 12:36:43 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Wed, 17 Jul 2024
 12:36:43 +0000
Message-ID: <f9220fd5-4b97-412e-86ce-bb78767e5fe1@intel.com>
Date: Wed, 17 Jul 2024 14:36:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Keep the device awake for TLB inval
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
References: <20240716133855.12015-1-nirmoy.das@intel.com>
 <ZpaVlInvZh0XRUMH@DUT025-TGLU.fm.intel.com>
 <a53141c6-7dbc-4558-b134-01dce242e704@linux.intel.com>
 <ZpagjxFtmdhsIka0@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZpagjxFtmdhsIka0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::6) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 96556f2f-e202-4e60-35b7-08dca65d1d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0s4c1o0dXIyYldvUmlicmdtUUZnWVA5Z0diYVgxVWhVVUtkaTdGa1BHVmNx?=
 =?utf-8?B?bXZ1WTF2SDQ3U0NnUEFTUnpzQ3F2UitOVTg5SGRXemVjNHdWcWpmTWtEZzBy?=
 =?utf-8?B?ZTdTWG03WGdObEpSSTBLcVoycFZFSUxGTVo4OThod213M3VyaUMzUitROWl4?=
 =?utf-8?B?UlpjaVpOamlWWmRjc3RtSDhBbkNJbnVhZXRNTHl3QUM3ZnhYMXJNNnNKOXdO?=
 =?utf-8?B?c3JtbCtHSUVFUGR4bVN1MDBlajM2QkxyV1lHOG1QV2gzQUlXZEs2aStPa2FO?=
 =?utf-8?B?U2N2Z2RNa2VQVlYxbXJHblI1UkJKKzVsOVZuS0VGUTl6T2p5cnJoVFY3ZFFr?=
 =?utf-8?B?RHR1WUp6cWdnZ3VFZUVVcndlL29mV1ZvQmhaeG1UMTY0d2lXS3RmL0ptZ0dO?=
 =?utf-8?B?emZBZUlyUHpXbFdYZTRBVWozWjEzRndqZ2hXdjhMa29tR1lkNVdBb25OSUVv?=
 =?utf-8?B?UC9CdzNxS21DRDMyckRMVzZ6RS9vRXYzaTNUcTBJOUgrS3lDZEp6a3VJRTd0?=
 =?utf-8?B?eDgwdDhLU09nZUZ4eHdWd3lybWxNUzN2enM5NVkrcGdlMnlrVjRjNlQ1MWpk?=
 =?utf-8?B?elhkTHZ6Ly95YjhpK3hObEQ1amdrWmIvay9wZW1vTFhqK2tEODBXTzhBS1Ro?=
 =?utf-8?B?Qkd4eW51dHZ0dEphamZrQ21jMEtnek90UFdldExhb3VLa0VEYjVPL1BWUlFp?=
 =?utf-8?B?VFRDOWk1ZWEySUx6Ri9GTXRMc0pHdENlelQ0MWFNcnhZd0hpWlIyTjZsTm0v?=
 =?utf-8?B?QWR2eVVEaXdRVjlKaUNraklWVjUyMlFKeXZOaDVmRkQ4YXJvUHRyY0hNTFlK?=
 =?utf-8?B?RE1DazYyRDRkUmtRdjFYaFB0SGF6RkdPWmFwNldYbUtBaFNBb0ltV01kemZ0?=
 =?utf-8?B?RmJuZkNHS3YrdzYzZm1UMjdiZHlhYys3bVFoYVBYejlVQ0JhYmNsT1NtQkIy?=
 =?utf-8?B?bU1xUTU2emlpY0tYT2xxYkZHNjhhbU5aZkxnNDRNdGZiTmFHQjFyQ3d4MDdq?=
 =?utf-8?B?UmJwckw5b1dwbmw5RGdvdDY3VHBrd0oxdFNqYjR6bkFuM0Uzc2MrYWQ5eXc1?=
 =?utf-8?B?Tzh4Tk1OMUY4M00yYS9VTWY1WnZDdS9zS3hVbWhYY1VtN08xYUdHUldpUXZR?=
 =?utf-8?B?VW5mWlFtR3gvaGVDQmRCdzIxTXUxNml6QTlEQ09PV0pHZ0RmWEIvSUwzcWc5?=
 =?utf-8?B?d0ltTTRrWGxVNmcwd1BUbXB2Myt0S2V1NEJjTXBwZFBHOWxTN25tRGUvNEJ3?=
 =?utf-8?B?aXlCMUNOUmQyYlpNVTVJWVFJZTZqNCtpMTlEYitzQ1VRdm9sR2psS0toQm1D?=
 =?utf-8?B?aStCb1J4N3VjTkVGbWV6MU90TFZvRlhjMmNsUnFaSjQrU2YrY2tvRU5yYTVD?=
 =?utf-8?B?T0NFelpWUjFWV3Zja0txN1ltMTNXa3hoMytEdUZHYkJGcW9jMkh4SUNxMVFu?=
 =?utf-8?B?VitGbndYL0F1NytiZUFPWjNQVXQxNW0zYWVmZk1aNTE4Q2poellveHJoUzZR?=
 =?utf-8?B?V2g4T0xHRDNGSlRTTzAxZUhrMlAwSE9ZS28wSWFyUDh3dVkxK2VMRm1rcUlB?=
 =?utf-8?B?cVBkYUZnbVI2S1lHUCtEWDJMV0V0anBrc3VjcHVMdHVzTHExWHM3SHVJQm1P?=
 =?utf-8?B?dm5xWGJIdHRXTFJmYjY4MWE2cG1CS0h2T3U4OUp3WU9sUlVOMlBuZDFaaUZV?=
 =?utf-8?B?UmhyK3hDQ0IvRDRhYlpCaUs3YUNzY3hqYVdZN25tSjVhb3BieXlmMnoyQ3dt?=
 =?utf-8?Q?Fu6Sa2xoM1zYW6e7E8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2kwbmJaekpYM0V3WTdhODBwK0ltZ0FWdURYWXNhOWt4K0lodWcyRU9JdUYw?=
 =?utf-8?B?cHptTnBFaW01aG90czRKS25peHdzSnFnRjZFSzQyR1JJTkNOd3hpWEdwdUFh?=
 =?utf-8?B?b3dyRnlTRHNTSWIzTWJjWVVZOVAwVlc1RWtjSHJVeU8wRWNIcGUyK3NUOGZV?=
 =?utf-8?B?TzREV3BGWE9iMDFudEtQVTN0Ny9mTnVnUG9uaXZsTFBCVE5LUHBqZUVoMlM4?=
 =?utf-8?B?eHlhU1htVmhXZlJhNlFKbjJPcFRvRzhsZjQzcE9JZDc1ejg5VVZaZEMzNVRk?=
 =?utf-8?B?SE1XTTcvQTV3cUQvRTFOdGhQMDVEZFBab1dPNVlQcmxOMnFNQmlqWWFwNXFu?=
 =?utf-8?B?Rm0yZ0I3VVp3STJTbzYwTEt6aVZlYWdhNE5hUWNNRFNQWkMxb21nYytpRWNn?=
 =?utf-8?B?RTVLc2Q0L04rcFluQ1FHdXl1UlF2VUY1eEZxakFoV0kxNjhEa2VJazVaRS80?=
 =?utf-8?B?TWNXZzZMWnI4Ujk3L2dVVTVDbmZBRnZVMkJpcFpnd2ZxbVJKbVo2N2JnOEtp?=
 =?utf-8?B?akN5VTVnRFRkWVdocENPRWxWOHA0Y2x1a0Q3b21lZHFuN21WcXZWdU4zbHpx?=
 =?utf-8?B?aUw0d0preDJnUUhUbkttU001RUhmNXUyVnF5TFJ5elZaSFczR0V0ZzBkN0xm?=
 =?utf-8?B?VTkxc1cyQzRTdUU2Z2dmWEZZSnNSZUJMZ1lnQi9SOWZjQjZGdTFJVzBuUzZR?=
 =?utf-8?B?emMxRmxieG9HUlJKU2dPbHRxajlwcmd6UmJFVjFIa3JQMC9MMG9yR0xFNzEx?=
 =?utf-8?B?U09sMmR2M1ozbHphWU5nWFJUMTE0eGZ5OFlJWkRDaEJzK1M3K1AvbVZudUdD?=
 =?utf-8?B?SGcxSzJjV1BXQUhnMkFORWxRTDB3ZWZ2VlpJY2VTMUxBdEFSMFlqTkgzZGxV?=
 =?utf-8?B?N0pnbEhydlAyTmw5dTg5OXJ1S3pGQWJMdFN0MHpQUTdvRUV5WVV1WFVKUjFm?=
 =?utf-8?B?S24xWXBZbTRMM1E0d0FVSG1jQVVPMDg1RHUxays2Q2VPa1cvVEdRUVFFQlh3?=
 =?utf-8?B?THBQVTZjNHNYdUlVM1dDc3FjekpWd0xLZ08xSjQ2NHpIVnJtNi81QnRCUEsx?=
 =?utf-8?B?SmthY1g2SUd1bzlYaSszQkY1ZmJudU5RYTJKZmJub0x6c0M4QTZWVDJlSWlv?=
 =?utf-8?B?WWtNZTRJa0Jkd1BBRzAvbVljNkNzbE9mVENrcVRwMEdiYXpMYjZuNWxyMnBn?=
 =?utf-8?B?LzRRM01nNGVYekhjQzdRNkRpT0RVV0VNYmlxNGE0Uk9SVHhGdVdpOS8zVTdD?=
 =?utf-8?B?c21JTnI3eWg2SkdwbnkvWjVTR3FiK3Voc3RYR0pLUm44QzhwMmhqMmw2S2dv?=
 =?utf-8?B?R21aakEwck5QeHVKTVhySStVVHhkZmJaS2tFOUlOL0N3UnJZc2FQTkJwNSsr?=
 =?utf-8?B?RExCS2l0NDVFZzRuWHo2Z1BtODEzRk85blRuN2kzZXRjeTVCTnN0YXdZVDR0?=
 =?utf-8?B?SVRwK3FyTzBjeW5PMUhxSWtyUGVpRU5BQjNJamQ5N2E5UHdqS3hxMWNUaGwv?=
 =?utf-8?B?QjN6YVZBbk9QbUR5ZVd6V2RPYmx0UGlENVVKTnJWWkRDRVZpTGZQc0ZmWC83?=
 =?utf-8?B?TTJqQ2tUTkdyVVVwbUFWRmsxdEtpR054YWtMYUkybXlwSWdZekZCNGhzdklW?=
 =?utf-8?B?TnQ1aFQ4emVuc3VzNVR3VklxWnJ2SzZHSVdaUTFVcWl3VUROVldUQ05FWUxC?=
 =?utf-8?B?ZWFWcHI3THpaMHB5ckw3UFN5ZUpsaWZWeWxsSFBJa2VkeDhMbmwyY25zRllp?=
 =?utf-8?B?R3JaTUtkdGtzVDlqMlc2Q3RNeVFBYVNpQUFSTUlMRkRVZFBEeUlmQWN2L0x1?=
 =?utf-8?B?b3dObzg5SFRaTlhCTWRGRnV6K1lqNUx2RExzUjA3bG5aVDErTUpTOGRhdm5W?=
 =?utf-8?B?WVI5Q1lpSDY2dFhEZ3MzcWEyV0VwNTV3eU9QdEwvenNQTUxkaTRPSUtUc2lr?=
 =?utf-8?B?V2szdDloOU1xRGwzMXRINS9CQUZSQkd6WkRCcG9QMnVydjR2cDllU2UvWHJ0?=
 =?utf-8?B?Unk1OHVycDh5aEV2ZEd3eFJmQkdzQkFJeVpxUlphd0tqV29oNGxJZkw3WU9w?=
 =?utf-8?B?dysyNmNpZmFRdHUxaHB5MFFXSXEzVEFyOUd5SVExakl3OG8yUFdNeXNyNVk1?=
 =?utf-8?Q?qWBjdvBH41sPbyHraduExcQFp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96556f2f-e202-4e60-35b7-08dca65d1d52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 12:36:43.6078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blxtIIo9OCO4t0eAacKrpzKAg2adviTplCsGYhFkzMy+QEkPxyJkhHRmuK0TZ1slt8N1WqllqC5T9GhMvPJa7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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


On 7/16/2024 6:32 PM, Matthew Brost wrote:
> On Tue, Jul 16, 2024 at 06:25:01PM +0200, Nirmoy Das wrote:
>>     Hi Matt,
>>
> Outlook reply? Prefer a Linux email client for the list for proper threading.
>
>>     On 7/16/2024 5:45 PM, Matthew Brost wrote:
>>
>> On Tue, Jul 16, 2024 at 03:38:55PM +0200, Nirmoy Das wrote:
>>
>> GT can suspend while TLB invalidation is happening in the background.
>> This would cause a TLB timeout when that happens. Keep the device awake
>> when using fence which doesn't wait for the TLB invalidation to finish.
>>
>> Cc: Matthew Brost [1]<matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das [2]<nirmoy.das@intel.com>
>>
>> + Rodrigo our local PM expert.
>>
>>
>> ---
>> Adding strace here for more information:
>>
>> xe_pm-18095   [001] .....  3493.481048: xe_vma_unbind: dev=0000:00:02.0, vma=fff
>> f8881c3062b00, asid=0x0000f, start=0x0000001a0000, end=0x0000001a1fff, userptr=0
>> x000000000000,
>> xe_pm-18095   [001] .....  3493.481063: xe_vm_cpu_bind: dev=0000:00:02.0, vm=fff
>> f88812a00d000, asid=0x0000f
>> xe_pm-18095   [001] .....  3493.481093: xe_gt_tlb_invalidation_fence_create: dev
>> =0000:00:02.0, fence=ffff88811bf3d000, seqno=0
>> xe_pm-18095   [001] .....  3493.481095: xe_gt_tlb_invalidation_fence_work_func:
>> dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
>> xe_pm-18095   [001] .....  3493.481097: xe_gt_tlb_TL_fence_send: dev=0000:00:02.
>> 0, fence=ffff88811bf3d000, seqno=93
>> xe_pm-18095   [001] d..1.  3493.481097: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x7000, len=8, tail=44, head=36
>> kworker/1:2-17900   [001] .....  3493.481302: xe_exec_queue_stop: dev=0000:00:02
>> .0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
>> kworker/1:2-17900   [001] .....  3493.481303: xe_exec_queue_stop: dev=0000:00:02
>> .0, 3:0x1, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4
>> kworker/1:2-17900   [001] .....  3493.481305: xe_exec_queue_stop: dev=0000:00:02
>> .0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x0, flags=0x0
>> xe_pm-18095   [001] .....  3493.756294: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3003, len=5, tail=5, head=0
>> xe_pm-18095   [001] d..1.  3493.756470: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3003, len=5, tail=10, head=5
>> kworker/u32:1-17912   [006] d..1.  3493.756535: xe_guc_ctb_g2h: G2H CTB: dev=000
>> 0:00:02.0, gt0: action=0x0, len=2, tail=2, head=2
>> xe_pm-18095   [001] .....  3493.756557: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3003, len=5, tail=15, head=10
>> xe_pm-18095   [001] .....  3493.756559: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.
>> 0, gt0: action=0x3004, len=3, tail=18, head=10
>> kworker/1:2-17900   [001] d..1.  3497.951783: xe_gt_tlb_invalidation_fence_timeo
>> ut: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93
>>
>>
>> How do you know from this the device is suspending? I can't tell that is
>> happening. I do think this raises a good point that suspend / resume
>> should be added to ftrace as that is useful information.
>>
>>     xe_exec_queue_stop() was coming from xe runtime suspend code. I am
>>     pretty sure about it but I could double check it.
>>
> That would be a good idea.


xe_pm-69228   [003] .....  7390.584812: xe_vma_unbind: dev=0000:00:02.0, 
vma=ffff888132716e00, asid=0x00027, start=0x0000001a0000, 
end=0x0000001a1fff, userptr=0x000000000000,
xe_pm-69228   [003] .....  7390.584834: xe_vm_cpu_bind: 
dev=0000:00:02.0, vm=ffff8881a00f0800, asid=0x00027
xe_pm-69228   [003] .....  7390.584871: 
xe_gt_tlb_invalidation_fence_create: dev=0000:00:02.0, 
fence=ffff88813270b400, seqno=0
xe_pm-69228   [003] .....  7390.584874: 
xe_gt_tlb_invalidation_fence_work_func: dev=0000:00:02.0, 
fence=ffff88813270b400, seqno=0
xe_pm-69228   [003] .....  7390.584875: 
xe_gt_tlb_invalidation_fence_send: dev=0000:00:02.0, 
fence=ffff88813270b400, seqno=213

xe_pm-69228   [003] d..1.  7390.584877: xe_guc_ctb_h2g: H2G CTB: 
dev=0000:00:02.0, gt0: action=0x7000, len=8, tail=44, head=36
xe_pm-69228   [003] .....  7390.585030: xe_pm_runtime_put: 
dev=0000:00:02.0 caller_function=xe_drm_ioctl+0xfd/0x140 [xe]
kworker/3:6-69022   [003] .....  7390.585050: xe_pm_runtime_suspend: 
dev=0000:00:02.0 caller_function=xe_pci_runtime_suspend+0x3f/0x120 [xe]

kworker/3:6-69022   [003] .....  7390.585134: xe_exec_queue_stop: 
dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
kworker/3:6-69022   [003] .....  7390.585138: xe_exec_queue_stop: 
dev=0000:00:02.0, 3:0x1, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4

xe_pm-69228   [003] .N...  7390.585171: xe_pm_runtime_get_ioctl: 
dev=0000:00:02.0 caller_function=xe_drm_ioctl+0xdc/0x140 [xe]
kworker/3:6-69022   [003] .....  7390.585622: xe_exec_queue_stop: 
dev=0000:00:02.0, 2:0x1, gt=1, width=1, guc_id=0, guc_state=0x0, flags=0x0
xe_pm-69228   [003] .....  7390.610680: xe_pm_runtime_resume: 
dev=0000:00:02.0 caller_function=xe_pci_runtime_resume+0xb8/0xe0 [xe]
xe_pm-69228   [003] .....  7390.623993: xe_guc_ctb_h2g: H2G CTB: 
dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=5, head=0

This confirms that indeed the device went to sleep after after sending 
TLB inval.


Regards,

Nirmo

>   Any chance you want to try adding some useful
> ftrace points to get full visibility to suspend / resume flows?
>   
>>
>>   drivers/gpu/drm/xe/xe_vm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index b6932cc98ff9..241b7ea00d5f 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2700,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>          struct dma_fence *fence;
>>          int err;
>>
>> +       xe_pm_runtime_get(vm->xe);
>>
>> While I agree the device shouldn't enter suspend while TLB invalidations
>> are inflight I don't think this patch will help with this.
>>
>> This code path is called in various places in where we should have PM
>> ref (VM bind IOCTL, exec IOCTL for rebind, or preempt rebind worker). If
>> we don't have PM ref when this function is called, that is a bug that
>> needs to be fixed at the outer most layers. Beyond that, GT TLB
>> invalidations are async and pipelined (e.g. they can be sent after this
>> function returns and completion can returns sometime later).
>>
>> With this, I believe correct place to fix this is either in the CT layer
>> or perhaps hook into GT TLB invalidation fence (Arming of fence
>> takes a ref, signaling of fence drops a ref).
>>
>>     I was planning to send something more simple:
>>
>>     send_tlb_invalidation() -->   xe_pm_runtime_get(xe);
>>
>>     xe_gt_tlb_fence_timeout() --> xe_pm_runtime_put(xe);
>>
>>     __invalidation_fence_signal() --> xe_pm_runtime_put(xe);
> The problem with this fences are currently used everywhere in the
> current code base so we'd have an imbalance. This changes that [2] but
> even with that __invalidation_fence_signal wouldn't be used in same
> places. Thus building it directly into the fence would make sense to me.
> Their are concerns about fences signaling in IRQ contexts though. I've
> pinged Rodrigo about this off the list, let's see what he thinks.
>
> Matt
>
> [2] https://patchwork.freedesktop.org/patch/602562/?series=135809&rev=2
>
>>
>>     But that seemed too low layer for power mgmt calls. But if TLB inval is
>>     pipelined then I agree we have to stick to a
>>
>>     lower layer to fix this but probably not down to CT layer.
>>
>>   If we choose the latter
>> option I think following series will help as we will use GT TLB
>> invalidation fences everywhere for waits [1]/
>>
>>     Regards,
>>
>>     Nirmoy
>>
>>
>> Rodrigo - I know we had talked about something like above but it doesn't
>> appear this has gotten implemented. WIP or did this get lost in the PM
>> work?
>>
>> Matt
>>
>> [1] [3]https://patchwork.freedesktop.org/series/135809/
>>
>>
>>          lockdep_assert_held_write(&vm->lock);
>>
>>          drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
>> @@ -2721,6 +2722,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>
>>   unlock:
>>          drm_exec_fini(&exec);
>> +       xe_pm_runtime_put(vm->xe);
>>          return err;
>>   }
>>
>> --
>> 2.42.0
>>
>> References
>>
>>     1. mailto:matthew.brost@intel.com
>>     2. mailto:nirmoy.das@intel.com
>>     3. https://patchwork.freedesktop.org/series/135809/
