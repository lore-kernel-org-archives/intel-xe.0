Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64053C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 15:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1710E2C9;
	Thu, 26 Jun 2025 15:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mqz41Ad/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527A210E2CA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750953350; x=1782489350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vgl32ZlVzWWIzQbqkdWqlVmMlX7pnBtlIZAglq45oLg=;
 b=Mqz41Ad/rYL/UlBwt2DxD+GsdPsxSowmcAqo09/Anw2abI4llpO+r22y
 SMkmR4wMd1FASEnqup6N03O7U7QjXcw+8DuuPXRiQzATp/MEBe0G5Dhs6
 UDVOf+53XjR5Sfmc5PtpPdVI8KozHCxZJmYPqeOUr3X2BshXw7md1lXsz
 seD6IsNgQ9RcTO9446kkf1FsKPRilkH+FGhEjlfMSjmMliknstvmpr1b8
 tlbOGGi5zeaHeQhAtZHIqws2TCB3nC+Mru2j/idm4jJwMUhPC3HwCR4hJ
 JKhiCtyj/OAKUcelqj5qyuM+b3NMXADWTvf88gVH+CJv02GT5j05J1If7 w==;
X-CSE-ConnectionGUID: mcfdXP1wQwaHyXee+b7U7g==
X-CSE-MsgGUID: o1LQnu7yTSWt9n9XYaShRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53129884"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53129884"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 08:55:40 -0700
X-CSE-ConnectionGUID: jebP1AnMT+mZYBLjtfSTBQ==
X-CSE-MsgGUID: Nu9MAYaRTJ+QkRu2DPQgZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152847747"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 08:55:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:55:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 08:55:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:55:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Thj2iq14epxeSNdAXORh/c1VN7YGtR95mP2fz8M4kZQL9mfER6dI+I27FfBwPiEWqjiSozt0GGDkXK5qQ/fl4h0w8AE4RUfGMb+w72wAv/1Vck1mTk0t3Bg9b0lmJG70zSwrBqswcr4yCUohLy+czD8t/p2GgqBMsR7RAAecHGdi+0wtZSGiFCCtfrzu+kkF8uLLqi6FYRPRpWZ+DCriXwvCcXciuCHTyyMrkkJTK9oAmCdSsS8R2V1GQzsV3XF97i5wFMGWlZeyyRprZsnkf0XRkB7+AzR6Q0+1hc5nHxKv3brxAFIAsQFxLwJ4/fREkltEATlGp6hGrFI+hTaDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cmLKRfZ6ywn3Z1hX5D5NgvZ2qSJ4Y9RLw1lNBV7kR4=;
 b=EVhZtLHNpgp1OGSPkYdkBYFa5zcCZYL9yqq3Q0ZCnT36V1AhHP/ekTuOfH2ehmYuv9SomDwwvVQsa3CuXI09MQga0I9h1Qgk9rvP7aWFz7z7kgCoiQVqirAEjH+PU18PhbD0UYgNbzlLAiDLz8j2tpDnInIGo6cjoCf45v/RzXcaGqa0pKK/8hZBkPTuSSLTQLjXF4xExoD+lfVxscyby8LrFxBUbfFja/xEpcBmAk8k9HG5LzGtownrIZ6eu1gJjv5eARsiMlJy0DMxwM0ho6AiO/NnZCtDsRD0RUnhoW3VovE6BGXajLNMX43JjeWEXmFxhrilD0KlUOzqXJye0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM6PR11MB4593.namprd11.prod.outlook.com (2603:10b6:5:2a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 26 Jun
 2025 15:55:36 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 15:55:36 +0000
Message-ID: <8ae660a7-5e9a-483e-b060-10db31d919b2@intel.com>
Date: Thu, 26 Jun 2025 21:25:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <jonathan.cavitt@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250626131805.3977408-1-soham.purkait@intel.com>
 <20250626131805.3977408-2-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250626131805.3977408-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM6PR11MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: aacd3673-4816-44ea-0521-08ddb4c9e3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUFKYVhkY2lZOXNrN0s5d1p5MnpZZWM1aVJJZk1sUmwrbFo3NW43akJxWGlo?=
 =?utf-8?B?QXkrcG5kR2xOd2lNQnkwLzd4NWJrVUZOaXZBc0Q3SUlXODNRK3pydUF1VVJ0?=
 =?utf-8?B?THE4SnhyMFhKcDJYckF2cWt4VzdycytqeHpFSmM1NXRLdTk1RGlnenJ2cG1G?=
 =?utf-8?B?OWUwS2d5bXljRHlQK0srcm9oRG5pamo1aXZJYU50MWpJUElXeERnYWFTZFlh?=
 =?utf-8?B?WDJ0a2lTblBVcDlkTlFTM2txNmVYbEplTnduRXczUjFDY3ljTG9HdS96TkVX?=
 =?utf-8?B?clVqWUVGM04yWkRCY29DM1ZwZHBtYmhXL1FHKzVNa3ZhdUpPSndBTEtZd2Ni?=
 =?utf-8?B?VlBacFEzQ0dUWklsdDA4aEUzNHZlTkNRTGJwODFlUmhhelp1Zmw5aHdWWW5C?=
 =?utf-8?B?ZXZWUzdMWlhKUkt5SU9ERldIS3J2OFhZVzBtNGNWTG9hemVYa0s2SGRKOXJi?=
 =?utf-8?B?T01lNHp1VU5nNGdoeU9lWlQzWGRPcHlmemZFek9wV3habEpuVVNTdHpqSzdK?=
 =?utf-8?B?K1dEM3pvbWl2ak02ckhVNitKU2dMbEJTOUZuRXJpRmpKTUZIRXBLZlhLNm9W?=
 =?utf-8?B?YTVPWWZTV0JBR2ZkcElqMTAwRjF2c3U3MmlYRFFCQTk1WXFMM2dCNlB4OTA4?=
 =?utf-8?B?U0FZOXNtT2F4MjJ0eDBnWlVqdHhhK1VSbzJTbEFzb0k1Mkc0YjV1N2xJTytB?=
 =?utf-8?B?R2ZjYTJTTmtrZ2RxT292dUh2bmZaazRYSEZ6K2F6UFliMVhIUWdmbEtoNnE4?=
 =?utf-8?B?NnU4T1ZPY3Qvb0NLd2xjRmRBejZUdWwza1c5MnF3UlRBVE4xTHl2cEU0WWQ2?=
 =?utf-8?B?a2NEQlF0SFBaVElxY0NIenhZeTJzNGVHNkRrbzFMTjJSMUpOZWtYQ1VmWDZ0?=
 =?utf-8?B?SjVzM0w2V1NxamlVTm1ldzZVM3V5eEZOcG54amxyVGR1eFhmVWV5TG1pTzgx?=
 =?utf-8?B?ckpLZExmV3NYSW15UkwyZGJicGR0NDhaODJVVm9RcThxeGFpbVZzaUZGTTVi?=
 =?utf-8?B?UlBPL3B0NHRkTE5rbTUvbkVKcEVLSDVJbnZQQjJTeUc4Q0FrTVhpc2J1ZGh4?=
 =?utf-8?B?ZFVQN0VnRDJDZmFnQkVsRTViZy9vM1F3b3dtZERVamdGTjRKOERDTC8xK2ZQ?=
 =?utf-8?B?QTkrNVpIaGNIVFVBdzNjVFVTSWVBMUF6NmJZWm1rYnpWVlZmelBhTWRVSWhu?=
 =?utf-8?B?NUNobXFjVzZLS2VKcVFTR2dRYngycXV2dS9tc011UDRDQmU4LzFxT0VwSDdY?=
 =?utf-8?B?VjNLQ1k0TERrNVNQVm1iMHl6ZGpDc2NaaGN6bEFSQU5sRHUxZjFYaHY1MnE1?=
 =?utf-8?B?Zm1NL212NWEydnFNU1hjbkhoQ0xlZFNQb1NHNmhOaHl5NyttcDB5a3dPeWlN?=
 =?utf-8?B?dGVkTlp5SEp0V0pQcWJXbjFUdDQrcnNscHlnVVMyU3YzZGNpb3VYalBGWE11?=
 =?utf-8?B?Zm9mS0Q3YWlWRU1vdXprSkpJZXlZeUx3TlB4YjZHZFE2YkhxR1A1UlRETVZN?=
 =?utf-8?B?bExMMFhVT1FwdkExVGtlTi9sT2hKWUtFQitZWGtuMjBEd0E3WGcxckpIcGZu?=
 =?utf-8?B?VXpacS9ZMkZxV09DMW9VRWdSNzFnQjd4YjZCRStkL0hUNUZaaFdObHZIa3Nn?=
 =?utf-8?B?bmsrYURBSGxZMVJPbG1tckpIMjQ4eUh1RTFpejlWOHFUdGgzcUZmRHhUSlV2?=
 =?utf-8?B?ZmdDRHYybGVDUkVKaERiNEw3b0JUSy9JZFZLN3NTL2JoVVQyQ3VXYzFPeVZG?=
 =?utf-8?B?Y1ZGVTFPdW96OTMvWHBJZm1tR2Q4eUZHcEtzMlY3VlA5UlpGdklMWVYrWVdE?=
 =?utf-8?B?dkRUVnFkY2dCZy85OFgwUCtlSE9LeStkcjhVMjZRNzcyaDB4djJaWHpkWjdK?=
 =?utf-8?B?U1g3aENZWDBqcUVHSGY0SjNSY05mOGxKSVI3UDZibGlKUE9GOFByTzIvR2Zx?=
 =?utf-8?Q?AqO4Y+cYvmo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG9jcWJiZEU0akc4TFRleWc1ZnluVVNlMUdPOTkyV2JFand4Y0xZb3pWaXB2?=
 =?utf-8?B?U0FRMHR5UHExOXg2UXl0SVh2UXROTWZPczFLWXR6RWhJZTBoUTZ3R1dEb3VL?=
 =?utf-8?B?WCtoUWcxVU1mK01wanplOTdrTy9Ca09NQzFxaWoxb3lLQWhIZmh5U0JuT2Rj?=
 =?utf-8?B?ZXhwZHBCTGZkUUg1Qk5EdllJeEdQbUFQVXFSdDNkQm9QQVYyeUJEVTNzdHBh?=
 =?utf-8?B?SHpDaUdBK0xZMC9WQ2tCTWljTmx4ZkJBQ0E5eVU0WEtxSFU3Wk9zekZHWE1n?=
 =?utf-8?B?SXZUSmVhcG9MblVlODhvMUlpM0NkQXpLU2pLcU15TE8wZFdjY05XTHRNNHpE?=
 =?utf-8?B?QkpiQWdpejZxd0IxN1NNdm5QL1VZYUhIRHVoa2hMWjdCL2piLzFSREkwU3NQ?=
 =?utf-8?B?dkViTXRpZVEzVkpUTVhHM1JEOUV2eThkaVlNSHZ1cTNVVGZ3ZTdOdmx1VERq?=
 =?utf-8?B?Mno1aE0rclNHb3BpYjNtaXcwSDVzZzlZU3BiUEZEb0hNL2dmOFFOUHR6d2lK?=
 =?utf-8?B?WE1WTVRQWkJxZXNOVVIrZUtSYkNVUXovbGQ1T3h6a2NvOFBkNUIwNTJoNm5s?=
 =?utf-8?B?UGp0NUw0ai9ZcnJTMFUvb1owZi8yaXQzZlY3dXJKR3NmRVBiQTRaQUh3Z2tC?=
 =?utf-8?B?QlpMSHZxOUxXZSsvL0g4am9tMGRqZFYyM29YRzVHVDlpNGdIbHFhUU1tL0kz?=
 =?utf-8?B?cjNabFk1TElvcWVkdVRKZCtXalVxbFlLbWQ2Z2FTRCthWlFDTXMyc3VjYjFZ?=
 =?utf-8?B?dVZMb0hBVUpOQlk5dHFiMThFNHU4OGI3UnRubHpkNzBBTlkvTTBWcDlXWlR6?=
 =?utf-8?B?eVBCMVZHd2tUWS9INkFzbUdsemVsTnZzVFY4R01iTFlHSitJOHp2a1d3QlVL?=
 =?utf-8?B?SzZyRmphNUtRZ01jcDllcUNINjJpV0xab05Jd010WHk5cndTK2IzUGdZMndV?=
 =?utf-8?B?Q2JmUzFKakd4TUhjbW9NdnNETnR6UXFHZmNMeDRTcEJRQThLSVNsS0NGM3lD?=
 =?utf-8?B?VW5YTkp6U1l3SXVaM25oNXlDWjlvUUhUamJ2MjRvVjZkVUlaaHF1dGorTjQy?=
 =?utf-8?B?TkhwWHZ4SjI5djNwNVptN2lyQldhcDFtT3lVRDZnMjZJd2NGVVRhRG5GUXcz?=
 =?utf-8?B?UHVFMXZUeXBoa2JMVVZXalExRUloUHBUNUVqWUhXSk03Mi9PcjZ4NEwwWDhy?=
 =?utf-8?B?MnhlR1daL1doci9tQlRKMmJ4OUtmUGhkNGhIdm5xQldjL2wrbXRwOURmbjNK?=
 =?utf-8?B?WUN6MnB5L1dVV09vRDAzMlhKTHBDL3BWeTJvdHgyVFFoYllieFdlMmVLQlJF?=
 =?utf-8?B?ZmdMQ01YZXlXVWVvM1B1QWpwSjhSVWQ3MzlWU2x0QlpUVVZlT0tLQTJOK2pk?=
 =?utf-8?B?cU9XMWNRRmZWQkhER1c3Wjd6WERCRGVyYnRxcEVnODIwSlNSRVptb1pkUHlq?=
 =?utf-8?B?dU9Ecnl5S3dkL0RUL1VYcDFjVFZvYktEa0JJZmJqakxjMHFFdlg4dWJpZGox?=
 =?utf-8?B?WGFJWlk2ZjF6YktDWWx6aklSSlM5VzNzVFlvc2M1ZkRXRDhiclF4dzVqOTdN?=
 =?utf-8?B?ZWZWZndDa1dFcGtsek5lR2xwVFZRM1N3UjlIbEd2UDE2S0h3SENGOGd4b1pn?=
 =?utf-8?B?T2pCR0F0RjZZTmp0YXF0eGcwZVFIWVBSUmVGbHdMR1BlZFVRYjhWenkyRXdN?=
 =?utf-8?B?WElRbmtpYXJYMXpWUkRoZ2MrYzRDWE84SU5pNnpJSDFSVmdsSXQyLzZTdWVO?=
 =?utf-8?B?Ty9MdUtMSUhHVURUbmpWUFFBSUJuZnR4eWJOcVdlbTlxMXE5VlgxUUs4SGM0?=
 =?utf-8?B?TEJiQ0Y2L1JhMTcwOVdXN0MyUHZ3Rm9Tbm51ZzlQMmVjaWp3b0phV1l6Q1pk?=
 =?utf-8?B?bmJFNDlETXBOaUdPMDJLelg4bDNucUZwWGNnZjdLcWVEQk03ZG40V3BhdU9y?=
 =?utf-8?B?MHZvcklneTFFeEhDTTA4ei9EdjV5Vk5Fb0c2cGFINURvSWJ4cHRoNjF5N1FW?=
 =?utf-8?B?cFVkV2FTbGZvRXRGRVhkL3dZYXlNNldRM3N0WnNGanRxWkZoNVdmbEc0cG9w?=
 =?utf-8?B?N1V6QVpZNHpWSWo2ZExXakdXNHgrbkl6eXdLNGdmRXhHSmEyTE02VHhFVlc4?=
 =?utf-8?B?SGMydU9aVEhLbE1DVlo3RU1CT09CNzh2R1AvL2VPdjJUckRVbC9rSUFQWDhi?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aacd3673-4816-44ea-0521-08ddb4c9e3cc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:55:36.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KkgNTldLGFcLsQHD3qlEFVVqUDbyc3UbnxZI1Mt9N0O3GzCqkU7Z9+okojf3dnMuYiWjs3EJJMkDU+4Uc0qLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4593
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


On 26-06-2025 18:48, Soham Purkait wrote:
> Add G-State residency and pcie link state residency
> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
> respectively.
>
> v1:
>   - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
> v2:
>   - Add BMG prefix to PCIe Link state residency
>     offset macros names. (Anshman)
> v3:
>   - Fix typo in commit message. (Jonathan)
>   - Rephrase commit message. (Karthik)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..34f5bfdffe46 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>   #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>   
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> +
> +#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET	(0x570)
> +#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET	(0x578)
> +#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET	(0x580)
> +
>   #endif

Reviewed-by: Karthik Poosa<karthik.poosa@intel.com>

