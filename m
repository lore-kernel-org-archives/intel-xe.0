Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC420CEE34C
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 19:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9218D10E504;
	Tue, 18 Nov 2025 19:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETPdxR5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C3C10E504
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763494726; x=1795030726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9fQ8tt/uUKcMKiZEJ1jShpmDW4YtqSEQhDgnbb/OSg8=;
 b=ETPdxR5X1YIDUJ5RiYTTquLrdCks/wrEb0aUHxgOHDf83cf1hJ3ffZT6
 YSyJR9XSkAaMzBGlgEwCX1X+m0XjhdcBAFH7Kac3eKcIqweGnpSc99QKr
 EIQ4Ru3jSJzevnNnYrENpbbgFgwPpZS9qwd/zQL0tChin5flfmr6V2q0Q
 +udKn/O4U/EDcaCfGAw/z5SaMctyU91MgwL11hSdXzKcyA5owlGc0Xc/E
 9CEdskAaxvuUp9m4qJGDi/p1OgnIsEi7HBLvw9E6W52ukeJ7TJwDHpPNS
 AoTkVLb8MCa1WNcyGkPnw4ZV/h2GYMFAzNgUEX5R78dGd9Ofyk0W6swNE Q==;
X-CSE-ConnectionGUID: u575eFYXQOGyf7BO/4tl4Q==
X-CSE-MsgGUID: f1maWyR1S2uwpVSx1Cquxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65233266"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65233266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:38:46 -0800
X-CSE-ConnectionGUID: 0FsiupCHSWO2KWR2BcKgcQ==
X-CSE-MsgGUID: j7p6eBZVQUWN/KtFxgIxxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190121364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:38:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 11:38:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 11:38:44 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 11:38:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9WQ/myBQE2YHzFJRHpxeIPiC1lKTvnKkTuST0RGUqX+CB1CTUWpi6UvGdKYjBjSqTW57+6ZkXrw2n2k50zg3UVQtrBajJIBz6MmO83JLnAH8z8ABxjyBGiq+IxSIV+t2ogxb+5a1xpMf77SGb6eEWnEWiINtyY9cVA5Hu/4+8MHZQHnBIzDtwowl42qB2gdYwQ/tHqRw2uCSfC/9K/VWI288TbtYI3ikWjZV0r12hQ/3ekRtc7uPIYdmlhmp1MsiMlsssQK50dORuvMIzIecKWajoObzpK+xRur3mH7ONXTNCNJhNE0wyh46nJnDWVxvuYMxdvLFmXR9HGDthlZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJVxgzdL4QDaAB0OJe9jT4wmXNFeqqbqH0vhQCUExh8=;
 b=ZoN7bCi1Pugvtarhf2J4htXmNMoZNy2y135Qm/vGF+T2om2lyVGqQCMEHe6SJ2onobwg57D35/hMNXs7kwetQ4v1wWEsp7oZ3EW3H+O5VkQw/wPntmJcETdlXPykHs6QM45PdM+4bAuStSYO5D3Lvu++k7g8lUKi8RUl4GN3qwjvhI4Bjy0Cf7vJSUygYlRkX4cs5Whu3tF8eKGz9YiVgnpOC1PBKvFwpO5wHX8p5vc5rACDVBkuXSxzdMt5PHYWlBy9C3gexTS+zieC2Bx1W1o8cnn6fef4iA6izChOtKmUP/ua5QLloWgAyq0f4oaWERMwyVTFFcl9xw+Qh8bSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 19:38:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 19:38:42 +0000
Message-ID: <eaa98b23-cf40-45c0-969a-b84beced6315@intel.com>
Date: Tue, 18 Nov 2025 20:38:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <badal.nilawar@intel.com>,
 <ville.syrjala@linux.intel.com>, <karthik.poosa@intel.com>,
 <anshuman.gupta@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251118090012.608250-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d274bb-6713-4d57-8be5-08de26da144d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXRMRXEvUlBHbDR4NTE4b25FclRFRVM4MXFTZlJwYS9tSm1mSk1YekZqUm9T?=
 =?utf-8?B?TnY4ZncxYjJhRVNrdTRYcTJKUWhINEFlc3FDYU5CNlhKTmY2ekVOOHUreTZ1?=
 =?utf-8?B?Z2tDcXVlOTRrY2lLUUR0M0xsM29SL0dRRGhJcUdQZlR6QkR0M3NCSWxlOVp6?=
 =?utf-8?B?UUtaby9vQjFrck9XeVBDRnRuN1FGNkhpSGc3UkZQdXZldm51TmwvVER6Y2ZE?=
 =?utf-8?B?WmdIREJTMXV5RkZQZ3c5cEVzZjI0VWorMnFrRExwUmp2VjZPQmYzRk9SM0tw?=
 =?utf-8?B?a05ySncyT1gwUTNFK3ptcFJkcjIzNUxORlVrbnJoekw1dEVSSi9IbEZtU2xM?=
 =?utf-8?B?dVZmdTBwV1VFZnhVR3dhMnZSdGJSaVE3MlBvM0xqWUVORTJuNXZvUldLZ2xa?=
 =?utf-8?B?S3lxcnRFdFd0dS92eUZtU0hlQnRDZGNLcFl2aGNXTWdWV2QxODJRZnlRSVZo?=
 =?utf-8?B?YTFYWldCaStjeWJtTXNabzNZdGNFUmtDbDQvVElzVDkxUWVUNElJYW9wYTY1?=
 =?utf-8?B?ZWROWFpiK3BETEwxcTA2R0dxTWsrYnNGTndPaFNpODJwTGFXZENIYndCb2VE?=
 =?utf-8?B?eExQazg0KzJyVkNUcXM4Z202QytsRzEwN2JhNWNzbFpmN1ZtbkpvU1NqMnM4?=
 =?utf-8?B?R2psWkRlN1VKNWo1NHMvT015TW9tUHRBSTcxU095RUFZYUdkRU83djF0V3Vq?=
 =?utf-8?B?ejBWODY1UlorMEYxMyt5U2EyREE4ZVpkZnQ5ZXR2NWJ3ZWk5eG1DcWRORWhl?=
 =?utf-8?B?NXZicThOMFVia0NUeHh2UXFadlo4bU5FR2k3V3dVeFV5TFllb3J1anpFWjlo?=
 =?utf-8?B?TytZeXpVa1NmVXRqYjhnTmx5WkhrT1pQQTI5OXc2czFiQ1lnZnBOaDlpTU14?=
 =?utf-8?B?cy9aaUhFOWI5d2RZenNPbk9GUkM0U21oQzZ6TjNGOS9wTXBMYmFIUkNMQmpK?=
 =?utf-8?B?S3pqTlRDVzJoWk1rempPZElWZmxYTGtGeEcrK1B6ZVEyQ3lyVVBjdjZReXJX?=
 =?utf-8?B?a0dWckpRMjlGQTd6dlIyVDZwUHpTL3NPWlR3UnNSbGRzSFVEa0tnOXhmN1pC?=
 =?utf-8?B?VU5ZYldkbTdXN0lYb1l5b0JkQkx4L2E1V0x2aUJId0k2TS9vSEJUeUJpQkEx?=
 =?utf-8?B?TG90ZUNyZGpQVTlyNHVBMlo2bmN6NTFHTnpObG43eUZoMVFjQTdxNjEyZDNM?=
 =?utf-8?B?OHpPbU5OQXJWYVcrWjF5VVpuTFVNRVFPT3FZTXpOQmF5amo0RmtFVXRCbWtF?=
 =?utf-8?B?akJFZmNQOXJiTlgySk9TTnc4ekdMU1ZLRlJFbVV2L0pXdGR5S09Nc1F6cjg2?=
 =?utf-8?B?dFRrYWsvOEVoeW1vc2RoazBiOXhJa0c2M3lyUXN1Slo5RldCbzdiSXFVbjRI?=
 =?utf-8?B?bXJ6S2VSM09kZTlmREs4MCtMYk9YQWl1dE1QaVozYmxvNVhQaTJDcVRaa3No?=
 =?utf-8?B?VnRkdWJxU3ZrTUlONWpKajQ0dDllQzlUaVIvdVJjVW56b3ZjeHFjRzlTRWVH?=
 =?utf-8?B?c1F3emo4TSs1NUJjakI5eFhIaXJTSmxGY1dhZER6cndIRGxrQnB0cGZuSm5L?=
 =?utf-8?B?d2ZFNHFESEdRYXFyOFo2WTNRWjk3dS9kMjZ0N2VmNnQ4emQrdU1EcUNVR3hY?=
 =?utf-8?B?UG1PVms5QnViTlpGdng3N1NPdVF0bXNWb0NNdkd3bWVyR29qZWdXOWorRU1Q?=
 =?utf-8?B?WWlmRFZwVERuL1Roa24vb05WQzRuTW9XM2pkeE9tWUZTOWtKdGZxRFpZUXI4?=
 =?utf-8?B?RXVOS0p3UTgweHJ0MC9raG5rZTZmZlplbVpZV2g3V3FhaFZiSWtjc09DNmFH?=
 =?utf-8?B?emhoNUlYME1LOGQwdXNUVllRVHZ0KzVYdzV0My9tb2xYMGVZeGZIRjM0ZUFX?=
 =?utf-8?B?MlkyK2ZoOFdIOU5CMk1JcCswWXVhbHdVMURQRVJuRGNKWHVIS040VjBzb3B2?=
 =?utf-8?Q?AGwJwurL77oaNn/s+GcEpJXPeAFK2m6w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmEya0ZpcVhEQXhrN3pjSTVSd2JUMVZGbjAzZllKdW1sOVNYc1B6ejQ4UjBz?=
 =?utf-8?B?NVFmSlBESU9hbE5pR0lybGQvYkd4aVl3STUzcmtlMEJyT015Wi83aFVudmFu?=
 =?utf-8?B?eFpPbE1BeDJjRStkT2hCZ3owUTA5UjNGN2hOZEVmYzh2ZG9RNW5KNHZJaitJ?=
 =?utf-8?B?VW5CRmdTNnNwdU5SYlFmM0gxWC9zYkNpcUJIVUJLNmdDbFcvaFNGRzNhbEJm?=
 =?utf-8?B?d1pHU05la2FNejlKUUpydjgrZW5aZDd3bEdFZ21TMG9jaEJrcWlSeSsvdjJQ?=
 =?utf-8?B?VkFtaUZMN0VFbXplVDRJZVFodVdyQWt1NVNyczVZY0x2cXBYbjBLUkhXZnNm?=
 =?utf-8?B?b0ExVXpNWVp3eVdWS3hvSWdyUEVtZmlwNGhjUVFWcHd3VFRLSEczL3ZhaEJZ?=
 =?utf-8?B?Z2pYdEE4MzRoMTJTS1MwQ3V0cXdZQXFQUjkyWVhEazREamRkd1NOSXBmYTkx?=
 =?utf-8?B?cGN0NTlQSWZyYitjc2lha3JkSUtqSlFqZVhKaUs5VG9xVm4xL3VWWEdWTWt0?=
 =?utf-8?B?cHdZNDZic3N4Snl2bDJnb1B0c3g2bjBCN1NrQjFGY3FvTi91LzlVcENFTEVz?=
 =?utf-8?B?RWFjaU40cHZhaVV6UmN1MTZFb29XZmxOYzcwRXU5YVpuRUljWkRtMFJxd1l0?=
 =?utf-8?B?eHZwZ0d4ZThZRUhGRm56NFpEMjVUSzVCaG92b3lGQlJuYW9Za3dVUDhkM1VB?=
 =?utf-8?B?ZDlIRDBZZVpkWk9uTlNDdlBzc0NTSTY0UEowUnB1K0tNRkVtQUlMUFF2bWVy?=
 =?utf-8?B?L1VJK1c0QVc2NWlmS2Uvd1ZSSHJuSkRsdUJBMWNld2o0TmhBTmxSak1aTWhR?=
 =?utf-8?B?SUs5T0RtWFpKUHdUZnl5ekp0bVdjdkcyVHI5WE43eGduT3RqMjkzTURPSFI3?=
 =?utf-8?B?eXN4WDZRc0xmMk03NWpYYW9wQ1NGZ3pPQXQ0Q1U4bUp1NU84ZlZzRG9xV1Vy?=
 =?utf-8?B?WFloLzJxN0F5MU4rcmZSS2oxVlFlSmdrR2U0UGQ3ekhaby9vUHNlQitXTm1s?=
 =?utf-8?B?TUl4MXQwT2wyazJsSjgyNHdXWmg0c1RLeXoyVGEyakpyTkVEV0dyTjZtQm1W?=
 =?utf-8?B?UFlrNTdBQWRhWERQeE9HMmg2a0NjWDgxTCt0RHM3S0llVkcwN0JxQXlweWcx?=
 =?utf-8?B?S212ZFE2VjlXUFZSVXMzdHg4bVZQNVAvTzlNSGpvZGlZem5KNzNZenp0d2c2?=
 =?utf-8?B?cThFMHkwOEJCNm9YQXlWc3lJZ01wcGxqdFpjeU1DQ2hEck1XZGVtTk9UWE5H?=
 =?utf-8?B?Y1RvMzJGNWNzazc1eTZRUmpWRTFmV05FR0RNMGtBN0dIY3ByT2tNSVB0Y0Ni?=
 =?utf-8?B?Q2xLWnd3bmkrK0luSk9GVmppVEt5WmVXSXdZSjMyUWVTd1ZLV2E0RmxKSy90?=
 =?utf-8?B?QjlMNmZXekFqdFM2QUpXU1hNNm51WnUxQUxCb0RvY0tuTHhwWmpKNTlBRDRh?=
 =?utf-8?B?LzhZdFdqaXNrUWw5TldLNTZhQk9GQmxhZWFrQzBkdTBMOHE1VlZkbW5FbnhI?=
 =?utf-8?B?VXVKaDFUcXo2bTFuLzJXd3ArMFJsaVZraDRrRjZVaGM1K0xGYmc1WkJXb3VZ?=
 =?utf-8?B?VzF6aE5RSlRlekxraFVibmJxelFoTG51TFUrYndSSzlZVURKenFFMFJYOVhu?=
 =?utf-8?B?RW5QaDQvWGVxTU5rbmZyYzV3bVB4NkxOVjlBY3VxeC8yb1d0cEZzYkZKQzFM?=
 =?utf-8?B?WmZSY1lDRTQ0Q3E4V0JvNCt6cnFMS2hyL2JMcjFnSEpTcTF1OFlzUVVkMkN2?=
 =?utf-8?B?VjB0eXBpd3hsSWdwQXcyYm9hSm1wM2ltVE1mVWs4T0JjeGxoekcrWEpYa2M4?=
 =?utf-8?B?OEo3UVBFKzRFUVcvMGhGS3AzcEkxZExlVHlzQTl1WHRVQkNHSmthK0ZEU1Z0?=
 =?utf-8?B?aGE0RVdwZlpTcE5xaVFoRE1wWTluL0tYMS8vUHdRaFBFMjR6bnRjbmlpVUNS?=
 =?utf-8?B?dlJUTnNlVDN2bXBmNjNVQXRONXBqNWlFMGx5NUQ3VDJDSGRyeDVTY2ErUXRn?=
 =?utf-8?B?cWlxa2tsS3JKajl5b1RjMmFaNFBrSlhHZDNtcFVwOHVmOEhGbjNOUDAvTW1z?=
 =?utf-8?B?WXRjZjhHQjQ0c1JJdVg3aXd5Q3lQcW1uRjhDbFpnQ0cvaGNGMVVndnp3V2Rn?=
 =?utf-8?B?c25vNHJxYVo5SmtqcGxhZHRSekZ1OFE4T0xiZ0ljVnNvUyt1ZVJPbnJQbERB?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d274bb-6713-4d57-8be5-08de26da144d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:38:42.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbXFGYKjBfw6iVv3dulybIU6h1gJM/J/yF/u2g5OiigGV03oMAxIY0oNPsndUk4AI09t09RmglZE0/OKo0Os06NAEe8m9KNdQ6Xs0v3oAV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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



On 11/18/2025 9:59 AM, Raag Jadav wrote:
> If the device is running older pcode firmware, it is possible that newer
> mailbox commands are not supported by it. The respective functionality
> isn't useful in that case but nor is error logging, as it doesn't
> particularly signify anything wrong with pcode firmware or device as a
> whole. Introduce xe_pcode_read_probe() which allows the caller to check
> for mailbox command support and determine if the respective functionality
> exists on the device without it being reported as an error. This is useful
> in cases where we want to make functionality decisions in the driver based
> on pcode return codes and a relatively simpler design choice compared to
> other solutions like checking pcode firmware version, which comes with
> additional complexity of binding every single command to a specific version
> and deems pcode commands useless in case the driver fails to obtain it for
> reasons unrelated to pcode.

s/pcode/PCODE

as in the message below you are using "PCODE", so IMO the same naming should everywhere, including commit message

> 
> This only silences command related failures and still reports other
> failures as errors, so we don't end up hiding the genuine ones.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 42 ++++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pcode.h |  1 +
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 0d33c14ea0cf..797b757f7a68 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -30,7 +30,7 @@
>   * - PCODE for display operations
>   */
>  
> -static int pcode_mailbox_status(struct xe_tile *tile)
> +static int pcode_mailbox_status(struct xe_tile *tile, bool probe)
>  {
>  	const char *err_str;
>  	int err_decode;
> @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>  	}
>  
>  	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> +		if (probe && err_decode == -ENXIO)
> +			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
> +				err_decode, err_str);
> +		else
> +			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> +				err_decode, err_str);

for tile-related messages, we have dedicated tile-specific helpers:

#include "xe_tile_printk.h"

	xe_tile_err(tile, ....)
	xe_tile_dbg(tile, ....)


