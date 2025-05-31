Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7579C5AD49
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 00:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED010E00F;
	Sat, 31 May 2025 00:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqle7aEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0390F10E00F
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 00:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748649958; x=1780185958;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VZf1Eh+rCxQqLX08SovjnXweXa8TcGlLBWBy7nmJRH4=;
 b=hqle7aEr3Eg1s3YEFj5p+Q2wsFOWmVwqzxpHfUL8IFG/nXqC7sxld9OA
 tDr6iovE/0yR4UjFiHOwkJFovQbg9s/CWNe5zW8I/nnVd8/JQzqy9c4n4
 X3u45OJfJMGl9AOE2ptxYRU98Kpdb0/D8hq0/vTGAXqj+gBEncLEayf6H
 KsdBQGV3MOmWcI6bQ/ytr+JTNKiwyrskWLtxRGCte9yT0uwZbWZ6896S3
 kV9MpHzvefy2iXvO+x3NF9RD7ZFDL30vebnWP4aDJ4vZ6+COjXcSNx9Og
 Hyaouq1xIQ4JqRUnu1bln8VpURJW678ug/D4Weh0S9x12AAUhizRXNteJ Q==;
X-CSE-ConnectionGUID: isAX8miBR5SKvivZqvwRyQ==
X-CSE-MsgGUID: UeGP5vK9TL2MO0AEupohXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62094758"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="62094758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:05:52 -0700
X-CSE-ConnectionGUID: FvXv43MLTZCAc0ulxG0IMA==
X-CSE-MsgGUID: wwNP/BSZRaK7kMkeBfFn8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="144480204"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 17:05:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 17:05:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 17:05:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 17:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KolpD8EllEgk087K6jOnvneiSpz3yJ1Kmfo8J2OXOjPPORS02PAvL4IbcU8JvGUpgEiO+dIm/mVeWfKdEw7P5SoAbK7OLSXrx012CgCDC9AzX1IcI1TF/w5UI71jb7lMzhVCo67FJAmybCQjVoL3mibXoWW80WjStOnhNtQ0sPVXTENOTIGDA8t0pyTxhfOX+M1i1hgjC/0Hdo+qpVcVmfYTgQr4+QwmNhBlH/EDO+NLGWfxE4NGAD1Y5jSf4FrZCgXiv2s8/CgXmNYtHb8enXydMZCCY5NBy7oMcAMg+3NwrDUQppZW6dxdQACTf0OwWP24jTGOsAyk7Orqf879bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms2FkSmlXwhp4aBlGsR/jIvsQY4vIcJc/0nP98nDtLM=;
 b=e8x0Ig7B7W9iC4lfPw2kCMB119F2nZNIo/0NoGh7M7gzkh0EEL3X0qUUjLKiCxAtGkl8Jn5TWCTcZacLBX3xIHUdPsgZRo3gR8TCUU5WB9eSJM9sIgOQHU8AvMfivSLF7uUlTGdLq5xs6OlLQVZUbWgEBXp6xDV8nbNC0AQIGE5M6eEatNlby3Vkq2XI7kmFW9HffbpYe+A1Ph+lQ2PsTGtYmdYG2U1AkkK1i8rmsVFdor/QQW1eHw289KbnPbJ9hjbNZ/Gw1yUgu7OAZT27NiocRfhMIhJuvA+b4z+Z1HBbdNasqLXRSEG2nVeaapDVQbCkhDn4HyQymd1zKyds5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Sat, 31 May
 2025 00:05:07 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 00:05:07 +0000
Message-ID: <1e1906d1-0d79-493d-b457-22bccc873af4@intel.com>
Date: Sat, 31 May 2025 02:05:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-4-tomasz.lis@intel.com>
 <jm5pvghdqzamxob5ar6yplby54sy6k3asm4gwwvqdnqrb4hm42@mpp7omx62q3g>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <jm5pvghdqzamxob5ar6yplby54sy6k3asm4gwwvqdnqrb4hm42@mpp7omx62q3g>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0037.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::26) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cb49d5-c7c8-4168-25c9-08dd9fd6cd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE94YjI1S3ZpOVdCaGdQMXNIc2ZlVDQySWR4dUtNTHZpQzgxVlRINlVLR3Ji?=
 =?utf-8?B?OW8rYzRsaFNqei8rVi9USlluTmg4cysvc1JGaTZoSGJ4akxEQkpySDFiSlk0?=
 =?utf-8?B?T2E0bml6YlpCb3p4VTYrQStuK0l4TUJCcWZreWNFNjhPWjhIYk1IT0t6bUw3?=
 =?utf-8?B?eWJ4VldhQ1N2OXZYTUxHNjdwUGJRdVpUMS80WThKRFNQc1NpSmNBQWc2OTFJ?=
 =?utf-8?B?Zk5mWUlaM3VKSmhMM0NqL1ZvWm92N2hYOWJWdjAwUXRtaDhERUFrbXYrbXRa?=
 =?utf-8?B?bHJKQTk5dTJWSDRzVXpRSCs3T1FNUGM0ZGU1dGZla2NIUTU1Z2t6UmF3OHdG?=
 =?utf-8?B?QnFlL1BETEdOK0pYdlVXQjd2MjFnd1VtUEdBdUlNaDAwSC8wa2dWaXZaN3hz?=
 =?utf-8?B?U0E1amg2cGIwNU5jMFNVT1ZtVWx6aXlNNVoxUUZtUTZzdXFxK2hPZFg2eDB5?=
 =?utf-8?B?TFc1WUhGcjM0bVVTUVhWeXRkTFc4QUtWbXZxdkw4dDZlQmk2ZDU2akMrOFpx?=
 =?utf-8?B?YXE0T1c3NmhxUVJZZ0crUzZGSUd6QUVrejBWbTU3OHNYTitha0ZZT0tOQkdN?=
 =?utf-8?B?dUR6V1RGZUp0VmJRR2NsRVF2ZmJXc1Z5UWlKQ1gwRjRQSGJvNzZ3R3ZsOXpp?=
 =?utf-8?B?Rk1VcXBXTC9oVC9ObTNOaksrOUxTNklrdFo3SFFDQThhWjhObW9KK2kraVZJ?=
 =?utf-8?B?Uk9zbnRlSEg2Z0RRd2hxL2MwWmdjRkE0eFpMblM5cmFQeXVZWGRYTktFMUUx?=
 =?utf-8?B?U241WFZUSks2aHFMeCtvT1ZIS1duZTFLOVMxaTdZWEpvWGtWVitiNHV5UWpI?=
 =?utf-8?B?VUVzSVJXSzVOUDNwY1pPRnR5OTZXL3NKby81VFhKcXFybmJjZlIzTGI1Q3li?=
 =?utf-8?B?a0VhNm03bGJ5NEp5TDd4V1hicHhjQktMUEdKVG9VNkNYM2RCbGdTUDBoTFRn?=
 =?utf-8?B?VGwrek1ld2tYVlZhcU1Wb1dPclowLzBDU3dBZkl1RnUrZkZIdHVxU05ydDlN?=
 =?utf-8?B?VzV4bWYrZmxzK0RTTkRUMURYeUZkeGlCRGRBSkFDbXUrbEU2SjF0b1RFQSti?=
 =?utf-8?B?MmROT2V2YmM0ZVlGQ3dHcnl1VzNjajhtd1VxSmR1ZUhKUzdNZ2NqYmxzcHgr?=
 =?utf-8?B?YTRxNkZxSXRpZ2VXd3NKZHRqRHAxT1FMOXZSVjc5N1JSWTFNcnJnZXlHLzdm?=
 =?utf-8?B?NWFDd0xBQXpSNC9rUTJTZnA4UjZFL0ZKM2p1SzdjRXducHVnQWxXZHc2NTF4?=
 =?utf-8?B?TTRPYW5ibDdQQjVmMHNaMnNuTnU2QmxoQ245b0pWYUt3cW40c3M2VUhucFVR?=
 =?utf-8?B?Ti9lcjRvMEN4a3Rza0NUOHY1T1RuVTdBeTgyRkYvdFhQalFhTVJZQ1N0RStC?=
 =?utf-8?B?REZjZm1rZTFJMlhQamljdjBKSGtmaXZYSHQ0M1E5Q0FBUC9IZnhLUWdtNExJ?=
 =?utf-8?B?NFZaUFhIVXc3VlZydUJyWHlMbkU5V01meW05UEtCcDNQeVB4bGU2U01ORnBP?=
 =?utf-8?B?NWdBUkphSGFTN1JvMEhnSGhZakdMVDhIUU0rUWhDYS9WL1AzTnErK1JYWEZv?=
 =?utf-8?B?QllWYjU4bFBDK0ROQ2M1WVF2dVVkZXdyL1k1QlI2MU5XY3BYUGg3QUlxU29a?=
 =?utf-8?B?d3FpUzhsOEtET253R2cvWlJNNndmYlEvNFJFTFdjZWdrZ1hHdk5hNFQyZEJN?=
 =?utf-8?B?Vmp0L0FCOEUwNi9DdDZpRHNuRElYUDB5aDhPYzRjNDBlVnJjYURpdFVwYnN2?=
 =?utf-8?B?bGp6cCtwWGthdzlKVzdMNytVeWxyYnZjRXVrNk1TTGMzdUdib21sZmhyQU5W?=
 =?utf-8?B?ZDRKNUtZK3h4dUFMZFBYZEk3M1UrUXd2ajB1Y1ordWNJMytQVkhyaWEyUDFK?=
 =?utf-8?B?UTVPbk9KQUNWVzgwaFg3bWhNRjVpYU1mdkw0eEZ2TEt0dWhlaHFzSHFGSVJl?=
 =?utf-8?Q?rrvVHubE8Qo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUhRUTI1d2dKYTJJeWhsWWJ3bURWSWNZVWtyaExTZitlcVFjK0hyWVFFdWVU?=
 =?utf-8?B?alcwVkhyc0NNZFBsQ1VlUWQ0a0pUc1k4WlN6VExtTVZDSEZiSms1ZHRSSW5s?=
 =?utf-8?B?eGw5VmI1YVhKYVBjWXNPb3I5dWJEVVEvVmJKMjUyOCs1Y3NvL3pNeXluK2th?=
 =?utf-8?B?SjFGdFJpUWttdnNvdmVuZFRwL2dzZVo5V0ZOY0RFZW1iK0ZjZ2FsaWZYQnBt?=
 =?utf-8?B?Y1RsVXAxZ1U0WE95bFpkanUrano0cEZiUnBSUmxCMmE3WUVHbGFIbEd1bmhm?=
 =?utf-8?B?RnM3SzdlVlZFbFl4WnJhZU9WaTVYYmhxTFpNYnJCZGlYcGJYQXhYb2REZUxo?=
 =?utf-8?B?akoycjk2U3RtK1k5RnJIZDZNa0NNTGdsMWhDdjdSbTRleGN5Z3N5dzZ3T0FZ?=
 =?utf-8?B?NDBPbXJjZUdrRlV2ZWdoMDByVnR4NW1zajk1T1QzTWJjTHBQZkVISVZueUlD?=
 =?utf-8?B?VDkrcDV6UVFaREp2bjBkMzFBajFheWFNT2xqZjhwZXlpMjg1aUY5MEkyL0NE?=
 =?utf-8?B?UGhZQkU2ZEdKdkpHYVU5VEhGT1lEcFk4WGxWRk0wMXIrQUhaWXp4L2ljTlk4?=
 =?utf-8?B?RmVackc1Wlg5QTFrR28wZXd2RllINHpFWkdmVGUvbXpzWC9IOThyeVAxOVdv?=
 =?utf-8?B?ZVNsL1ArdjN2ZWJjT0gxeFdKR2tWL3lMR1lRVVA0L3RzZzlEdTVpZlF1b0wr?=
 =?utf-8?B?ZnZPd3lVNlZXMGppRmI0bEpaYWQ3dzliUDVqZDFpSVQwQXZlTW84anN5TW10?=
 =?utf-8?B?eStFV0Foa3hveS9oRmtEVVRMQUZrS085T2dvN1lwUEhORmdaMFM0ekR0WXo4?=
 =?utf-8?B?Z3krM05ZUkc0VkZxMldSTXFxMmc3VFZhcUtNS3d0SjAyUXlPMGlYQWlSSU1W?=
 =?utf-8?B?THFXUzI0VGdIaVAxN04vTDl6SE9GYVY5VVU4cFdVZmZGKzN6bGJDK0JwQWN5?=
 =?utf-8?B?WkF6RDRySVA1Qm1XMVh5UWNWRUJWRnAvNlJLTzF4V3Zad044Z1ZCbzhCZXBJ?=
 =?utf-8?B?ZklOaGRRYTcrNWZUQkNCQjFaWHhoWU9kam9OT1l1aXNrK0VscWN5SXIxQ3dO?=
 =?utf-8?B?S0czZzRDRDNqclBLcVAyYUNmL3VsWURWa3Y1NllZYWVvbXdWUkVMZ1N0MlNt?=
 =?utf-8?B?SGk3K1A2RG5uTlQ1U3o0d2E4MUVPbGV5NGVXUVZTVk9oMTd6YWQrc3pGa0dx?=
 =?utf-8?B?MmdhTnlhUmdQTVhmZmVWZ1M3djJXTU9kVW1hSEFONHNSQ1JzZU51Z3FSK0VE?=
 =?utf-8?B?cnZ4eGJZd0ZRWnpiYTdrd2pyVnJwdUZSRXZ4NnlJMEUrZHlqbHFyakxyaGJ5?=
 =?utf-8?B?clpOQXdwdmJPZlRSMzZFOUNSNXRoWmZSYytyTnV4cVk1ODh4U1lvcFhHUVNq?=
 =?utf-8?B?RG4vSDA4aThlU2huYkQwK0RiSmxlZTlHNUZmdkMyR1lXTWZtZjkxenNqN25o?=
 =?utf-8?B?dEZlaDNpMHdRbllUSzViOExSWHpmTmlJUHVlUkgra2RJRTdvU01zbjFzbW0y?=
 =?utf-8?B?WE43ZWxmdG9ZL3JDbFQxMzdCeHBRMEh5N1ZpdkhWcUNNT0ZRU01WOTdvUzBT?=
 =?utf-8?B?ejR4ekwwREZyZjhEQ2lBYWJ2emFualBXRFplK2RWOHBPZWo1SWY3MnZWQVdU?=
 =?utf-8?B?Nk1kWURSZVBrcnNDai80MkE5WUlaQ3plK0hqRU1TbGVuL2dFYmcra05CRTVn?=
 =?utf-8?B?d3dCaGt3R2VkUW5veDF6MFlLVnNEbEFtWURUYk1FYVZ1OENsNTlvR3QxK2hG?=
 =?utf-8?B?R1F5L0x5WFZTbEF1d1RhR2pjVmxpcmVDVFJ4OUJPY016dEdndmw0cGpzRFhV?=
 =?utf-8?B?ZGVRUjFvSUZlMHZiN2VLSWQ2cDY0a0xGQXZyUkU4RjJVNWdoWDA0ejlFNHE0?=
 =?utf-8?B?ZVo3NXp5aTNhYVJrQnIwcFBTeGd6SENpUGhyZjJyMnlqN0Z4ME5KeEd6U3kv?=
 =?utf-8?B?ZlB0ZzlNK0x1VHVNNUVtRFNmVjlQYWxCS09qekpLTnBJc3kzMXFNMDhSaFk0?=
 =?utf-8?B?OUFTbk52WWMvNGpaUFIvejFFWDRwc3I1bkVoSjJteEFpVFlOaUtocUEra3ZM?=
 =?utf-8?B?dDVld3lOVUNFNzUzdk9mTzFPQkEzeFFncngxb3ZMMUJ6NVZVZ1V1eHUwVlc1?=
 =?utf-8?Q?nYy9gQNaGYdjzUNeod7lETOmg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cb49d5-c7c8-4168-25c9-08dd9fd6cd0d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 00:05:07.0546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0l14wYw8kVae/2knAe+w0IDK91Tox5xVRCxcFFZlsnLlDloAaTDjxNJ0PlEsHLMA2HmHotm0HSGtO4xjNJ6sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
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


On 28.05.2025 22:16, Michał Winiarski wrote:
> On Tue, May 20, 2025 at 01:19:21AM +0200, Tomasz Lis wrote:
>> While applying post-migration fixups to VF, GuC will not respond
>> to any commands. This means submissions have no way of finishing.
>>
>> To avoid acquiring additional resources and then stalling
>> on hardware access, pause the submission work. This will
>> decrease the chance of depleting resources, and speed up
>> the recovery.
>>
>> v2: Commented xe_irq_resume() call
>> v3: Typo fix
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c      | 42 +++++++++++++++++++++++++++
>>   5 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> index 869b43a4151d..455ccaf17314 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> @@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
>>   	cancel_work_sync(&sched->work_process_msg);
>>   }
>>   
>> +/**
>> + * xe_sched_submission_stop_async - Stop further runs of submission tasks on a scheduler.
>> + * @sched: the &xe_gpu_scheduler struct instance
>> + *
>> + * This call disables further runs of scheduling work queue. It does not wait
>> + * for any in-progress runs to finish, only makes sure no further runs happen
>> + * afterwards.
>> + */
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
>> +{
>> +	drm_sched_wqueue_stop(&sched->base);
>> +}
>> +
> Why we can't reuse the regular "stop" function?
> In which cases it's going to cause us problems?
>
> The only difference between stop and stop_async is an extra call to
> cancel_work_sync(work: &sched->work_process_msg);
> and that worker checks sched->base.pause_submit in various places (which
> is set in drm_sched_wqueue_stop), and exits early if it finds out that
> it's true.
> Is this about the case where we're inside ->process_msg()?

Yes, exactly that. `guc_exec_queue_process_msg()` waits for hardware.

During post-migration recovery we cannot use any function which does that,

and we cannot wait for any such functions which might have started either

just before PAUSE or after migration but before the recovery worker 
finishes.

-Tomasz

>
> Thanks,
> -Michał
>
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
>>   {
>>   	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index c250ea773491..d78b4e8203f9 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>>   
>>   void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>>   void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
>> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
>>   
>>   void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 80f748baad3f..6f280333de13 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1811,6 +1811,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>>   
>>   }
>>   
>> +/**
>> + * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
>> + */
>> +void xe_guc_submit_pause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		xe_sched_submission_stop_async(&q->guc->sched);
>> +}
>> +
>>   static void guc_exec_queue_start(struct xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -1851,6 +1864,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>   	return 0;
>>   }
>>   
>> +static void guc_exec_queue_unpause(struct xe_exec_queue *q)
>> +{
>> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> +
>> +	xe_sched_submission_start(sched);
>> +}
>> +
>> +/**
>> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
>> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
>> + */
>> +void xe_guc_submit_unpause(struct xe_guc *guc)
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +		guc_exec_queue_unpause(q);
>> +
>> +	wake_up_all(&guc->ct.wq);
>> +}
>> +
>>   static struct xe_exec_queue *
>>   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 9b71a986c6ca..f1cf271492ae 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
>>   void xe_guc_submit_stop(struct xe_guc *guc);
>>   int xe_guc_submit_start(struct xe_guc *guc);
>> +void xe_guc_submit_pause(struct xe_guc *guc);
>> +void xe_guc_submit_unpause(struct xe_guc *guc);
>>   void xe_guc_submit_wedge(struct xe_guc *guc);
>>   
>>   int xe_guc_read_stopped(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 099a395fbf59..fcd82a0fda48 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -11,6 +11,8 @@
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_irq.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -134,6 +136,44 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>   
>> +/**
>> + * vf_post_migration_shutdown - Stop the driver activities after VF migration.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After this VM is migrated and assigned to a new VF, it is running on a new
>> + * hardware, and therefore many hardware-dependent states and related structures
>> + * require fixups. Without fixups, the hardware cannot do any work, and therefore
>> + * all GPU pipelines are stalled.
>> + * Stop some of kernel activities to make the fixup process faster.
>> + */
>> +static void vf_post_migration_shutdown(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_pause(&gt->uc.guc);
>> +}
>> +
>> +/**
>> + * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * After we have finished with all post-migration fixups, restart the driver
>> + * activities to continue feeding the GPU with workloads.
>> + */
>> +static void vf_post_migration_kickstart(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	/* make sure interrupts on the new HW are properly set */
>> +	xe_irq_resume(xe);
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_submit_unpause(&gt->uc.guc);
>> +}
>> +
>>   /**
>>    * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
>>    * @xe: the &xe_device struct instance
>> @@ -247,6 +287,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	xe_pm_runtime_get(xe);
>> +	vf_post_migration_shutdown(xe);
>>   	err = vf_post_migration_requery_guc(xe);
>>   	if (vf_post_migration_imminent(xe))
>>   		goto defer;
>> @@ -258,6 +299,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (need_fixups)
>>   		vf_post_migration_fixup_ctb(xe);
>>   
>> +	vf_post_migration_kickstart(xe);
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
>> -- 
>> 2.25.1
>>
