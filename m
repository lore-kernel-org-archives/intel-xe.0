Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA77CCD37BD
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 19:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA42F10E1D2;
	Wed, 12 Nov 2025 19:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGXEC1Es";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4061A10E1D2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 19:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762977240; x=1794513240;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MqJM1uowR/FsvZy/narrrGag49l7Cxw8eJteWvouQ+g=;
 b=bGXEC1Es3GA/j494/gdwikeNeDm03T3q1kvHAwUz8YAcZjX7/y5IUCbj
 6kPOXSTUlQfpPol9Uw2QxEDUKe3g8gImny/7BOH7+1RJGHsNaZ+D1/L5c
 bQvslwxuTpfhvyyZbnDDawg/szA9IpskV3tLYeL9gcBKlmJlS1Y4tRhfb
 vvPB+H62NXy4csozn7vZWELTangEmAvIyO/BKxSy97c9Jgz0WkyZ7c+ph
 bB01RA88FpMqljoTUXKtHhFYKwuJq7l7t01B2753ygPOiH+k/Pesqhwhh
 C01h0WauzOoSkRdegxsMbn/DIbYmmBLKx2l5q99dpZ27FtJ9ZOwTlpOmC w==;
X-CSE-ConnectionGUID: gdXh3DtaToGqujqDxpMkVg==
X-CSE-MsgGUID: fwctC1ifQPCMs5hdEDQ2aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65087746"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="65087746"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:54:00 -0800
X-CSE-ConnectionGUID: QmzFaTdSSdeWxfYzKod0aA==
X-CSE-MsgGUID: wl+Fw/vURs2bK0xPPOs+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189588917"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:53:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:53:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 11:53:59 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:53:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0PMhGmusdUhSjHT29PPqVV9woypdchMdSUT6S22DWS3ufOSxOJrLUOONO7DVmW1229FLYk2+j+hLGzx9eGpbQbSb66twg2qReAbgeR/8elLypBZoQKAwEXRSdzOkuEY0cVD3x4B7Qbtj0Knr25U/7uYTWyXGj68DxK5IMLb7t43yz5rb8m4K3KWxMkeR2oyK2cPHXXkIYnwTwg1wdTYt6CyeGF/FRswH2ZdEcuQxnqIFhSC3Lu1OyQOyaju3qKn4zDjmIhQlsGmjw/I3dv53z+AkXXimnSM63lRrlpSnv4gDRN8i4gj3SlkahbjgaIQUnpW/KpJfWDqINaF3X/DfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz+n3ZUkPjeIspdzUTczZo9qqX/wOVmT19QZY3aCrbI=;
 b=gZaGd0FMcYj8f3kP4XQoemGVV2GcVJwk0NHw5Ge0w7c1jxo1rFqlzBOHTWbN6e22CJQu6pqvpjD43M+IP739BbUAA6Weun4NZKXbk6Ox1AB0uewFhh4l/GUhcXZnh5dT13Y2GRJuZf46E03sWAwvD22LsV1cs6drdkKjjEcVIIZyq1MdlZuOJEj6DISEjF/HTKHwXs0UfNZEN3KCp11vfAhABYJDlpwYS1kTYZe88Epm1369yXJVr9674YXo1f11boHIHwFzgXc/j0Y+SDf68Y26LZkDQPcFeoo+hs0+GcLM+50b5W8d+S3ItUbp//Wxsz/oPVozt82hOxYgdEOXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:53:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 19:53:51 +0000
Message-ID: <e29041b1-9a0a-4c3d-b761-9c345a0098fa@intel.com>
Date: Wed, 12 Nov 2025 20:53:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/30] drm/xe/pm: Add scope-based cleanup helper for
 runtime PM
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-37-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251110232017.1475869-37-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c88fdc0-5228-497c-2279-08de22253360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlRSRDkwakk1cE5TNFdFTUZHZjA0citpbFNnSnZxZ2w2SVQ4b3lyeWt4eG5D?=
 =?utf-8?B?UmVvKzRpUGIyOStWL0UwSFVQMGdIeHdqR3JkbXBBaHU1UEthN1liRDJTUHMw?=
 =?utf-8?B?Z0dZZmRod2dwNG9XNDdCcHViNFdDM2xhWmFDOTZPaE83MHBUWSt4aTljS2E3?=
 =?utf-8?B?Qm5BcUhnTnB6eVRDeitiSUdXcVI1ZGJBeVdFUDM1TEk5OGRYdUh5MTdQZTFh?=
 =?utf-8?B?ekRKcUl5SFNtbzZBMXBXM1ZOb3MxQVFnemUzSGlLRFg3SWVvZlRrN2gybmtG?=
 =?utf-8?B?cmZERkNPa3NxZG80dmphOHBtcG1FQTlobVRrdG5lWjlBc1F5M2F3djE4WGpa?=
 =?utf-8?B?R3BVR1JvK2Q2MkpEd0JYaTFqbmtRS2RRcXdlSVY2RjVUeDEvRXVXS3FaQW90?=
 =?utf-8?B?amF3VTlVMzFkZzR5a1JVcnpXcklmU2ZPRXJ4aTJWbGY3b3RqLzZrMFZxVkx2?=
 =?utf-8?B?SnRmZjZDVyt5NGpNazU1bVBxTXJWcHdsY0xOMEpHMXNNRmptVUZ3a1JpMEc5?=
 =?utf-8?B?dDBvaXpvSGRjRE9BMitUVlk3OUM1ZjZybVNmMXI3R09VUHpMejVMQ3pVclJY?=
 =?utf-8?B?aVA3N1R4UllSMEZ4eEU3bzJSUTN6MkNZOVlkd3VtZ2pDVHFwM0x4R1RnbXVN?=
 =?utf-8?B?a0dzbktyN0lJRk94KzRCTlhudXJadUwxRlhlK3RQMzNxajlpdkx6VklKVDZI?=
 =?utf-8?B?RzFqVkhOc2ZMRkRpY1piKzNHWmpkc0Z5VlUvMjNXZWNXZ1c5NWVRSXMrYmMr?=
 =?utf-8?B?QU96UlRiT1YvOUM0S3diZnBqeDlMZk4wc3I2UzgyK2kwK0VRbHdacTZLM3Ft?=
 =?utf-8?B?YTFtQnJReC9PT0FLTnNjUXdkYTVrVXRuakxodGFtZ0t4OXZacVBhK09GS0tY?=
 =?utf-8?B?S25hTXlpcVovOSt3OTV6WFV1d3BFRXVWRUZNdnp4ZWc2SzROZHlsTEtsamI1?=
 =?utf-8?B?K3NralJqenhZeTlKN1JiU0dPUXlGaTkrM3RpOWNjbmd4cTMzdEFRZ1pUVUE5?=
 =?utf-8?B?R3RIUzFNc3I1Q3dpbitIMnJ3SVczY1kvbjc1amhoby80VTJtVnpmZ0hBNmJh?=
 =?utf-8?B?WmI4U2VCVzZ5dWRiQzlxK2UrZ2x3Sy96NVZUbm0rNUo5TDBDR3A2WDE3L0pZ?=
 =?utf-8?B?R3IvWkFwckZXRjEvTWRYR3J6L0ZTSkt6MW01cVFKUUtKVWhFbktzckJHL2ho?=
 =?utf-8?B?NE5XTTUrcmtrZng5S3pFb1RqVis3V2Nja0Z3cWlSKzNwUnBsRHgvd2pPVXNP?=
 =?utf-8?B?OGpHVkFIQjMwN2xPV1FEb0pvdi9KNElMaDlGcGRnK05nY2VieVo4Z24yZjdj?=
 =?utf-8?B?bi84UFJ1VlJWUXNSc3dNK0MxUXdIT1VySjh2N3RON25DNk9YaituMU1aTjZP?=
 =?utf-8?B?MGRPWG5EWEhZdENuUnZPb3ZiK0owNTJQN2d5TWZzSjhRYkNVa2h2aE0ybmx2?=
 =?utf-8?B?MVBXYnpyVnpMUDRUaTN2aGt6ZTJtcm5taWZwajBQMkVtSVhGNjF5SEM4eUYx?=
 =?utf-8?B?RytMWUd2TGRWQUYvblkzL3liK2lQaGp3TlBTVUluZk5OUlFYcTBLaTNCQTZa?=
 =?utf-8?B?TWNEUFl0ajdHdVZaM29wd2FKRy96THdIWVFJU25kR0ZHOEVoZnFsSFBGZ2hT?=
 =?utf-8?B?MWFNeisrZVJYNkNtOUhWRGRBeHpqbHo4cGQ3UWxlaXBxaVprMFYrUjEzK2Z2?=
 =?utf-8?B?N0Z4Y043MW00a3F2clZOTXFMN21pUm1vUWY5QWVremE3bXRhU1pyU1hySXJM?=
 =?utf-8?B?Smt2aDYzd3RQTUlIZ3NhY0pMTGpGaE9yU00yU0JKRzZLYTRvRkRPWCttdWpy?=
 =?utf-8?B?NCtMT2VYeTJlT2lndlV6bGNVczk5Yk5JUW10MElGVkhnK2pjK0xDNHhldG1S?=
 =?utf-8?B?aGM4Tkx4bjN4RTJjdEhPeTFDNFRPcWNpbC9EenZxMDZXRVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjlHQnVOSjJxN3pwQUlQWUx3bXk5ODRQNklYNDJVZEdYRnJpWlRKTk1LNFRu?=
 =?utf-8?B?RERnU0EveUxGKzlHdTA2Y2grN3ZTMG9VRU1YMDF4V1RyRldXdGc5L1FvbWJP?=
 =?utf-8?B?bEF1S2ltdWorbDVnNEw5ekRmQi96cW1HODlid1IrZ2NhTGc5VjdWQ3Awbm1I?=
 =?utf-8?B?VGFaWjcwWFRGYTZaNk95MFNjRVozOG5rWjdiaHJUNUEwUThDbU9lNmc3TXFr?=
 =?utf-8?B?RDcvL0k1eHU1cXUwdTZHK0w3WnVMcHpzWGJKS05LUSsyTWtLaldLblZFR1Ay?=
 =?utf-8?B?MlVoSUdGcEZsNHVWblNBUWY0a2NYS0hpNjBIOGxyaWgyMThJMmdCRzEzbDI4?=
 =?utf-8?B?M1IwZU1MWk51bXI2U3M0Tkc5MThQTy9UaG9uT0FuTTQ5VGZoL2kvU2dDVmNo?=
 =?utf-8?B?dXYwK0pKUEhsYkV2anBDWG5xdDlob3NvOHRPRWpoVGV4Mld5MzBxdFpZakJF?=
 =?utf-8?B?d1BhWlpPczl4LzhibE1XMUJZbHJER1FBTW13YVNXODFnMU42V1hjbHRLZms1?=
 =?utf-8?B?SGwvbzVCOTlZNkZHMGNMUU9CckNmWkIwOGRNWGFOdlhMR25NMFFNTjZHMGlR?=
 =?utf-8?B?NDl0R3YxcFZ3UzZMcy85bGRHQkF6OVZnQXNpQzdObUZNOHZsc0xkNmovNzIy?=
 =?utf-8?B?a21mV0xMekFFclFUU3FMVy8ySU5kd3d1Qm11WkplcVk3MC9ONnlIdnJxRnhZ?=
 =?utf-8?B?dWJ4cmlvMlY5ZEx3cDg0aUdpMHRDQ0VXWjFId2M2RXNhQTFzVGQwb1drMERJ?=
 =?utf-8?B?Y1pMTUpnRFRzMHRMa1ErckszcVlsbS9ETTNrcmEvNFNveDZ6cUJrY3NwK1VK?=
 =?utf-8?B?dnpSK0hMREFwNVVuUlU0UGpKUEJLc244T3JXMGZKcllCVC8rZXQ0bFFEVllP?=
 =?utf-8?B?NDVteUVkSXdxUzEyQngzYlNWNkpxMzNKc2kzVGMvd1NSeTlzMTdiK3A3aGdx?=
 =?utf-8?B?WlBHOGNBc0Ywem5Bb1lVOVZQTTdJbGVmLzVIYWhRdlA2YW9nS1ZLbHRxOUll?=
 =?utf-8?B?Wm84ejBJZm9uNE5BRlhpaGxmQSt2ODI2RkppcDF6bGVkcHRCNzBwUk9mRlJh?=
 =?utf-8?B?MTV5eXJIUWtncG1zZkFUZThMaUJqd01Oejl3aGlaNVZrK1BBa3FpMVFSRzlK?=
 =?utf-8?B?ZUhkdG9kZTBmcjB5YkphUXJXQWxURDIwOHNtL1pucENOL2EwcGJkampNaENa?=
 =?utf-8?B?ZEtNdC9jUUdLU1Q2d09Wa1BkbkNlT29ZNUlIbWJ6QWVPN2lDR2FId3FRUXVI?=
 =?utf-8?B?Ti9oRWloOGVKWDYvSlJvWDl5NWx1aUpvMTJONHR5WXJSeFFKcitIK1ZOWmg0?=
 =?utf-8?B?MFBSSUE3aEJ6Qit6K0pBV3dIZ1RVU2crOTFrbGxWTGluVTVTZGU1MHVwQkRm?=
 =?utf-8?B?ekcxTkZ4REFnMHdmLytRS2I0MHhmdE9FSkFqZEtVUXluREZ5K1VDQVd5MU91?=
 =?utf-8?B?ZDZqQUY0SFQrVDBKTGd2TmIxbXR5bXluNmkrVWdMcEJOOEo5UzllbmdkZDZw?=
 =?utf-8?B?UGN4TFltMFplbUZhaGN0Z3Z1Y0x4d3JocS9YWk56UTc1Y2hqZU5sc2VGQmF6?=
 =?utf-8?B?QzArY0dmeGpWdk9lQTUzQTJlVkl6YXVvejhVL2lrZnRmY0VucFBnOStaOXNL?=
 =?utf-8?B?MVJBSG8wZDVzSlhJRW1NTlBjdWdKZHAxU3RCc0FaWGIrSFY2ZldiZXdHSlNo?=
 =?utf-8?B?dTVqa0RCb0t1d1NhbXcyM25IK1ZHSkxFaDh2WmR2SGg3VkJtV2tVRlB5MjJK?=
 =?utf-8?B?UC9aVFM5T2x3TkxiRklGbGJrdk1yY3R6bXJwZzFvdFRRRzdtS1RJdWwyb3Bh?=
 =?utf-8?B?VDQ0TjF6UUpNTGdWRXFGNHZnejJBUjM3ZVJTQ2RjUzdOcElvMmpWWkNzWjhz?=
 =?utf-8?B?WDNGc1RhcW8zK0h6UG0zRGkzdXMxSXBFczJNU0xuQ21kZXZrb1hIUG50c3E1?=
 =?utf-8?B?SFhiSVU5NUhqODBqdnRqbGtJUzBVMmxia2l2emoxZFJ5QXRPVXcwNDZrcll5?=
 =?utf-8?B?VURvVkhZQlhwUG5KbkkzUkt2K2F3czJkbG0wSFIwVGpqRWpKZnVZWGdrWEdB?=
 =?utf-8?B?bzh4c1BBZjNGcmpldTE1UDRuVmlZaHpIZ2p5MGp4VHlkaHVOdW91akZFaldn?=
 =?utf-8?B?cSt3MGF2cWJjdHhsR2ozYTRTUFZnb1JEQ2lRNkt0YXpoWEVWV0lLUkNEckZ3?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c88fdc0-5228-497c-2279-08de22253360
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:53:51.1199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqL7a6WVdxnoS9g7Kzg6Mk9xG4V5VMjwEbMWPrrVS0nJe23PZqIHu9A+/FendQjCHpKB9F7T3jV2qXd6w2oaBpWgAxv4iGku+N7T0DBhTpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
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



On 11/11/2025 12:20 AM, Matt Roper wrote:
> Add a scope-based helpers for runtime PM that may be used to simplify
> cleanup logic and potentially avoid goto-based cleanup.
> 
> For example, using
> 
>         guard(xe_pm_runtime)(xe);
> 

for the record:

last year [1] use of DEFINE_GUARD for our RPM was considered almost as API abuse ;)
but now [2] [3] it is used exactly for such scenarios

[1] https://patchwork.freedesktop.org/patch/599366/?series=134955&rev=1
[2] https://elixir.bootlin.com/linux/v6.18-rc5/source/include/linux/pm_runtime.h#L617
[3] https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/tty/serial/8250/8250.h#L191

> will get runtime PM and cause a corresponding put to occur automatically
> when the current scope is exited.  'xe_pm_runtime_noresume' can be used
> as a guard replacement for the corresponding 'noresume' variant.
> There's also an xe_pm_runtime_ioctl conditional guard that can be used
> as a replacement for xe_runtime_ioctl():
> 
>         ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>         if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) < 0)
>                 /* failed */
> 
> In a few rare cases (such as gt_reset_worker()) we need to ensure that
> runtime PM is dropped when the function is exited by any means
> (including error paths), but the function does not need to acquire
> runtime PM because that has already been done earlier by a different
> function.  For these special cases, an 'xe_pm_runtime_release_only'
> guard can be used to handle the release without doing an acquisition.
> 
> These guards will be used in future patches to eliminate some of our
> goto-based cleanup.
> 
> v2:
>  - Specify success condition for xe_pm runtime_ioctl as _RET >= 0 so
>    that positive values will be properly identified as success and
>    trigger destructor cleanup properly.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index f7f89a18b6fc..6b27039e7b2d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_PM_H_
>  #define _XE_PM_H_
>  
> +#include <linux/cleanup.h>
>  #include <linux/pm_runtime.h>
>  
>  #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
> @@ -37,4 +38,20 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
>  void xe_pm_might_block_on_suspend(void);
>  int xe_pm_module_init(void);
>  
> +static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
> +
> +DEFINE_GUARD(xe_pm_runtime, struct xe_device *,
> +	     xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
> +DEFINE_GUARD(xe_pm_runtime_noresume, struct xe_device *,
> +	     xe_pm_runtime_get_noresume(_T), xe_pm_runtime_put(_T))
> +DEFINE_GUARD_COND(xe_pm_runtime, _ioctl, xe_pm_runtime_get_ioctl(_T), _RET >= 0)
> +
> +/*
> + * Used when a function needs to release runtime PM in all possible cases
> + * and error paths, but the wakeref was already acquired by a different
> + * function (i.e., get() has already happened so only a put() is needed).
> + */
> +DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *,
> +	     __xe_pm_runtime_noop(_T), xe_pm_runtime_put(_T));

maybe instead defining the noop() helper, we can just skip this param:

DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *, , xe_pm_runtime_put(_T));

> +
>  #endif

either way,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

