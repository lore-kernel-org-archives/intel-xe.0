Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A15C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 11:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124D010E216;
	Wed, 25 Jun 2025 11:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb6ZuuG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1EA10E216
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750851117; x=1782387117;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sRdTUJQ8GjEG1rrFFL0dqGDDWdp8ogX+5RVK6C3Sz8c=;
 b=Sb6ZuuG+gUGEehkWgExYSejVwqtS+H/yExhZIj6xNYub7al/vSRD3jsy
 Y1dyXyOdYI6dv1XdpK4H8Id67pYft7cVQoBZNCuyCgEjQdB29KJoFDzih
 nBQyIiQaR/TUkkRv3TcatdQgrL0z1h9qOhuvP1AVwjM2ZCycAJiv81ZIq
 JYIEB1FvrGByuKrl0V9SriYAW4nFPwBqiOvarq/vdFJfbODdTAue2jTFJ
 VAkl7aPFxu/tufGO8X9Q4yycFbzXqtpcxc2cojeQ4mgDVxgOAd8nWMN5u
 iuWLYoEL37JI/vaA7U6VUgz4ldmdIPQyKhEGUZtZcAd1xjTVqjKQZigOF w==;
X-CSE-ConnectionGUID: OEdnSIe5QFqdocNaf9QNkg==
X-CSE-MsgGUID: sVH+c9pER2OWIENR43AQRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52980918"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52980918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:31:56 -0700
X-CSE-ConnectionGUID: EU4brEs2SyG8kkf63NlAEQ==
X-CSE-MsgGUID: 7YZhefM3T46DVR2si92u7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="175848991"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:31:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 04:31:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 04:31:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 04:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk+QGFgCeCQJ9EN3JoeQYOygAoIl8u9TQEWoH164gs/FBUraWG2hBWYfcHyI6v0ZKIH2NVYg6UHs7nQLd08h1g0f2eUQYHFU91Se3tk4zC9GgMxIf5i0bxn8jT/8biRlBEtsQg8m8k3FU8r07RhDoC1fdVkeuzZLo8K0WgsaqqsWxXHTshPvlUZ4CR0WoudY5q4+SfqI7Oz0unC0tZNUlMlTmo4DS+6/1K4cnF6n0JEcYyTMxU2pLSI8e7CFHP8Jiocjy7Q3JRju09UhlzpfWvp/LRdpKGjaU7Tj79Hv6IfwR48hrKzcUg3Ip3uD0KgnvHFFbF6ogyfe/BfC3I2MRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpkXiQVbtbQvu8E8VPYJLYXQQkiCFt002P4gAjhDpXE=;
 b=ES0NBFyIMosfDGaO7CeYKzY6nFzXBcbUaZ2a7n069RQaj6BBLA2/oKdC31k5VCJOYYNYTTgRWMUgZ9ID7sNlHq8WpwdyTb4wHf2s5ktOnbAAqwLyO5lELGrtuM1rfBI//aNjah1dnaBtUvwvtXuVXPUsDi5J0ohHI7fD4cZDLSPOUbqkZjIAPtXkYx0l0vsMpzkdqvb2H3NtbUWNuE11jgPKNz7ddoiXw55NtA/DhglCZwMXye808Bkqdar1ZA7W1Zf8nKLIsEl0x3nHzYW0XRjL7s/0B7CQJfHgxilkpCbyPdJtlcVD3Oa46U0wlrFG58LJ2BiP61/6NnkKMpI6lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 11:31:52 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:31:52 +0000
Message-ID: <814ee2c8-8666-44cd-826c-bce2f65c7994@intel.com>
Date: Wed, 25 Jun 2025 17:01:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe/tests/pci: Ensure all platforms have a
 valid GT/tile count
To: <intel-xe@lists.freedesktop.org>
References: <20250617020906.1719276-7-matthew.d.roper@intel.com>
 <20250617020906.1719276-10-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20250617020906.1719276-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: b25522bb-0d1f-4c1a-3972-08ddb3dbe181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzRacTBxYW1oTzJRcWdFaSt5aHp4MGN2V2NuSSsvU1dNQzhhOC9DWnlzNFJD?=
 =?utf-8?B?NDRVeEtWdWNVMGZRNm5sYkoyZGl6ZUwreXhOVUR2QlNUa1ZIWVJvSVU5NkEx?=
 =?utf-8?B?Qlc0akZ5cnVZUjlIMjdJOXBSSFNqcjdDMCtaU1JicjgzL1F1b2hLeGgrT1FC?=
 =?utf-8?B?ZnpmSC9XbGRtSDQyR2xnMVR3ZU5ya0VleTRTdFk5VWJPbGVDK0JnYXd0YlpR?=
 =?utf-8?B?bnhkQmw5VFBQWDJDS2lqTExmVWpqTzBOdVFUMDYvWklJN1hMZjkwK1h4eXRa?=
 =?utf-8?B?MDlQanB0WkFob0JHZjJxdkd4RkF1REJwZ3UxbzhtNE8zc3NPbC9vdlN6N1FG?=
 =?utf-8?B?SFJ1RHpWdzdkYUVHUEl6Zmo0cnV5Rzd0Z0JuMERoMWVrTDQ0dTR3R055TG9h?=
 =?utf-8?B?UHZjMnVoc3ljQm1qNUNjV0RUWkZUSUdHYVh3RWVFeTk1eFIzMkY4cUM1d3ls?=
 =?utf-8?B?UkZSQ2cySjF6ZDk3QWNUUXc1Ujl4cG1Ra3FlWENPamFDT09jbTZIUU1BSzhq?=
 =?utf-8?B?YmljemJrTlRTenRqTDQ0YkxTMTJTc0RqTHNlMmI1Q3lzd1dmN0w0bVE3MTZk?=
 =?utf-8?B?alRQMVB3NWZ1QXppbXk5TU81Q2toczdEL2wrWWFaakhObEJ1SGppclErRUN4?=
 =?utf-8?B?bG1rK3lORURHdlN3blk3dXJEbDdPa0RjOUthWGhZU0hGZktDYWxld1JXSnlQ?=
 =?utf-8?B?NUI4Sjd3RjQvajU4OWIwdHFmdlJyT0VuUGxQUG5mZ1ExWXB5WWtFcHVzNVJM?=
 =?utf-8?B?Vk5CSWhFeUo4aElob0h6SERTNnkrRGYzTEQ5YjdJd3JoMUcrcDByNEUwUmhN?=
 =?utf-8?B?TUZSSzhzeW9aL0lnQTd6WUVJNzg0YmFLQUpoeWdJTnhwSC8yRVM4NFZmN015?=
 =?utf-8?B?OXptdzZ1RW5sdTl4UjFiUVNMREZLRjBFRWl3TG5BR2tadjk0SEQ5U3M4WnNk?=
 =?utf-8?B?cDlMbCtJbEFONU5VcTlCcS9TYzdLa3pVdUNCNDI0RXVkV0Z3NXRlNlR1V0xO?=
 =?utf-8?B?dHVZR2ZyTnEzK1JOZFhuTitBbDErenBrUkRQdnQ0VWk1bVRNUzkwc05Ic0Fh?=
 =?utf-8?B?YTFnNHhoMis1ZEZlYkkySTM5RXh2MkVOZEFjcG9wVENMR01Bc2JFWHNJMDZS?=
 =?utf-8?B?OE9KUXdwUUhScnZ4bytyOWFZVi8zV2pmeDVsQVFiRVJNZ1B1dFpEOVZBMUZ5?=
 =?utf-8?B?dGNuUjB3MjhPUGxGNXJYb2N1V3F4T3l5NVpNRC9qL2lScXlJTzV0QzJNQVBY?=
 =?utf-8?B?R09oeVRIL09Pb2ZjWnE5V0VNcTk5T0doSXhCa1ROUU9EUklJVzJwYmVVVWRl?=
 =?utf-8?B?blo3cmJkazhoNDdaajJTR2hNRll5MFFHemlzZnJ5QzRFU2dGUTlNaG5uL2dt?=
 =?utf-8?B?OXBoTzZ0MUw1cVpTZnhXNG9WcjQycE9LUXB3RjgyOW5pdm02eDJKR3VQN1BJ?=
 =?utf-8?B?OTF4MWt2NTV1TXRxTjJxdk9lRS9vdGN2U3ZZOG1TNEpCQno1cUlLaisvRGJY?=
 =?utf-8?B?bjc3ODNjR2lGWXNFOUZ3ci9WdzcyZG5SSUM0QUl1UVVJUVZ6SkVPN1NCbWlv?=
 =?utf-8?B?R243UmtoMHlDRE1PY1dEdG1HVGlHaHgvNWwyY01kZkxpNm5yeGE4VGhMWFBG?=
 =?utf-8?B?dlhWMmZuSGhGSzFPMEVwbkJJTXluN2lodURQelpjWllyY2k1Y09VTTA2b2VN?=
 =?utf-8?B?R1YyYXJ4QlJvM0lBcUJtNkMvOHk2MXhla2ptcDJFNkJ2WkJUUGFwMlc0T2t2?=
 =?utf-8?B?Q0FEanluZXVIYzJ6OEpDbGhWczUwMjQxUTM1blpkUHgvc09wc2hqYVExcTNs?=
 =?utf-8?B?TlgzTGZ1WlViK1hSR1JzR0tVejJtV1VNRmI5MFdYVnMvRkNQeEdob2JCQjBG?=
 =?utf-8?B?NW1RY1ZpUEUwZW1WeGNxVWhsdEhKdlJJbllSV1pmKzBXUWlGeGhHMXZPRC9Q?=
 =?utf-8?Q?PrOSebrhqaE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG8zelkyUWRDR21Hbm5MUytzTmRjdWVJT2dacHltNHk4VjhsRFlBWTJNZVpP?=
 =?utf-8?B?RmFHS29pZFNBbEJZY2pZdE1RczBoOFNMWjh2bWNySkdlNVlOQW41WEpUSTdU?=
 =?utf-8?B?ZjBjWTNheVlZUWlQcmVTczJ2Wk9BYzVmVnVKUU5qRTRnSHpoMFpmRE9ER2hi?=
 =?utf-8?B?V0Zkc2psYkFJazkvZlppQWJzbTBsN3k5dFJqdGhZL3VOK1pXSVFTbVpWdWFn?=
 =?utf-8?B?QmFOUHFlL2ZhZFIzMll4a1M0OXpTYklzTzlxZFM5c282TGlzd3RCNHB5alpx?=
 =?utf-8?B?bzJSRjE0aUFSMCtESStkUVB5NzZ5UEN1S0taV1dBek5pTkZXK0xGWUE5Y0ho?=
 =?utf-8?B?cFBHNDYzZHNOZlhoeFZLRU5nS2I3a2dzbGxNbnRJdVhkdXJsM1V3RjBzQk1x?=
 =?utf-8?B?S1F1TTNOblE5Slk1S2VvQ0ExMXZaZ3FaWnlSYm5Eelgrdjk0L0l3aHFqaVhT?=
 =?utf-8?B?TkhCTlU1U0E2K1BiRDUzZ3FXNTRCdURWbk0wb3pTQm0reGsyNG1RZGRlaW9K?=
 =?utf-8?B?bFlMd3pqQjA4VnVqZ1JvRUFvRS9RNkkySi84Z1IrL0pMT1FWQ3p1UHRYTmtO?=
 =?utf-8?B?eWVlejBpUlpGQURZQ3l6MEZFeW9HZFVocUVBTWNFVzhJS3l3MmhmT2lNQUc2?=
 =?utf-8?B?OUlOVmwzckNDdDNleDMzbDZDTFVIc3EwWWpVN3h1bXZqMmZpV3VXY2lETVB3?=
 =?utf-8?B?bnhWWlgrSDB0V1gxRUJPNjdSdEd3K3A1d3pIRHRvMmdITktYWG5TRlk3RVZk?=
 =?utf-8?B?TExsRExqNFoyd3poZGZMVUhPY2M3TkxzbTVZeXBlakxJcURpYzQrUWJGYkFP?=
 =?utf-8?B?aUo0Uk0wMzBSRHFvZndhS3N6RURKdHc1YUxndDY1aHAvOXU0dm5WZHZKSDNk?=
 =?utf-8?B?L3hwMFhMSkVXZkNqMTRMY09FaGt1dENjVU0yb1BRMTVzV3hFUStVRmN0ckVX?=
 =?utf-8?B?YnMrcXMzZWg3T3NURmVzelZxb212NFMxM0tvejdmc1FGWXpiNGc2eCt6eVBh?=
 =?utf-8?B?d2E4anhKNXhOajY2R0Z0NUZZRzFEU3BuRUc0d1NwRlJ2MTJCcCtWcWs2amlY?=
 =?utf-8?B?UXVjRmo4YlpQTW81NmEyamwzNmNvTkp0WW5VVkNmOTNnVk5ZbEFMOWlLcEVO?=
 =?utf-8?B?bnZlTlFqWEpmNkdGRVQvbERPYmtJVmF1QTN2eWlZRXZNMFhoNnJvekx6emhH?=
 =?utf-8?B?OEEveURyaEpndjI4VXJoSnRPQVhLSms2ZHlpQlg1Vjluc2RLM1hPWWFZTzFy?=
 =?utf-8?B?eXJ2dmtheXFqMTJpNGs5akdya3Y1aVFDcEd1em1XczRLanc3dHRESTNsYlI2?=
 =?utf-8?B?OURCN1E5NDhiMWJoZkExbUtDZE5WTUJ1QXNKWDdzbFMwSDluekdMdlhSbElI?=
 =?utf-8?B?Wk1VM3VGeVByUm01Q2g4bjY2ckJGaThja29wUkp6OVcyRm5MM3N4UndPaEE4?=
 =?utf-8?B?STh6N0pDRk1MU0dudTdORlJZVE1iamZjRnhXVWdZM0FkRVRMMmh4MTF2N2Jp?=
 =?utf-8?B?MzlsaDB4bE5CZGpNUzd0N1lDOGNtdC82MEZXU3Z5QU9kd2JkZjYyckhsQTlY?=
 =?utf-8?B?bHlMNlpVTmRkd29abVBlMmhWc0EyNk1SK1RtM1ptWTVvczNURjNQWmRyVDMx?=
 =?utf-8?B?VU9NdEQ4QUV2b01rNUpERU1FdVdiSHZrSlVRaEI0d3JLS3JDU3NFMTUyMVkx?=
 =?utf-8?B?cXYyRGY4cjU0UkllSmNMY0tYam83QUZFeFV2T2RNVHEwY09EY3d3YmtYdnlT?=
 =?utf-8?B?MUQ1VHE0MVRiS3hjWEVUb0gxbTZuOWR3WmZ5dGhlT0FmMk11MC9DZzdEci9C?=
 =?utf-8?B?OXJ5TlZhUjdtR3MrNDh4dmZGZHpWUFQzaTBFeDZCUERvOVRDbi9oa3hHOWtS?=
 =?utf-8?B?Tnp0SG9tbW1PV3BhSGU4U0M0OHFpUmg4RWNTUmtaUXp1T1BRRXIzbXRsd2U0?=
 =?utf-8?B?aXNoY3lGV0hNcjZ5bWdiWFhWMS9xQThHTmhaSk51SnYyeFlFUlNCV0JPK2Vp?=
 =?utf-8?B?Q3gyUUJUcFl6WWJnaTg0VUl3VXQ0M0ZnVFJWS3RWRHhPR2lIWExBUDc0dGZa?=
 =?utf-8?B?UGtHcEtyR2Y1bnhDR3VQWWw0VU5qZCtDSktlTFhZNUxjS1g0dVdnaEhVV2JC?=
 =?utf-8?B?NFlYOVd6T2ppa0w3TVZEdExZNy9UZzhOQ0JpQlVCU21SMCt0Y01qYW9pQmdl?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b25522bb-0d1f-4c1a-3972-08ddb3dbe181
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:31:52.2366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/3+WCE31mmnrFJL2JQ8hmUgG8fvFot3PwIhFseBJaRwAL0R6W2PPwX14LHItZdL7T1B+1WCjkR037j3ahabM+bTh/b1WkQgc7xDV0PO/Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
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



On 6/17/2025 7:39 AM, Matt Roper wrote:
> Add a simple kunit test to ensure each platform's GT per tile count is
> non-zero and does not exceed the global XE_MAX_GT_PER_TILE definition.
>
> We need to move 'struct xe_subplatform_desc' from the .c file to the
> types header to ensure it is accessible from the kunit test.
>
> v2:
>   - Rebase on latest xe_pci test rework from Michal and convert to
>     a parameterized test that runs on each PCI ID supported by the
>     driver.
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_pci.c      | 31 ++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_pci_test.c | 12 ++++++++
>   drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 +
>   drivers/gpu/drm/xe/xe_pci.c            | 38 ------------------------
>   drivers/gpu/drm/xe/xe_pci_types.h      | 40 ++++++++++++++++++++++++++
>   5 files changed, 84 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index baccb657bd05..9c715e59f030 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -21,6 +21,18 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
>   KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
>   KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
>   
> +static void xe_pci_id_kunit_desc(const struct pci_device_id *param, char *desc)
> +{
> +	const struct xe_device_desc *dev_desc =
> +		(const struct xe_device_desc *)param->driver_data;
> +
> +	if (dev_desc)
> +		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "0x%X (%s)",
> +			 param->device, dev_desc->platform_name);
> +}
> +
> +KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
> +
>   /**
>    * xe_pci_graphics_ip_gen_param - Generate graphics struct xe_ip parameters
>    * @prev: the pointer to the previous parameter to iterate from or NULL
> @@ -55,6 +67,25 @@ const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>   
> +/**
> + * xe_pci_id_gen_param - Generate struct pci_device_id parameters
> + * @prev: the pointer to the previous parameter to iterate from or NULL
> + * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
> + *
> + * This function prepares struct pci_device_id parameter.
> + *
> + * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
> + *
> + * Return: pointer to the next parameter or NULL if no more parameters
> + */
> +const void *xe_pci_id_gen_param(const void *prev, char *desc)
> +{
> +	const struct pci_device_id *pci = pci_id_gen_params(prev, desc);
> +
> +	return pci->driver_data ? pci : NULL;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
> +
>   static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>   			    u32 *ver, u32 *revid)
>   {
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> index 95fed41f7ff2..37b344df2dc3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -44,9 +44,21 @@ static void check_media_ip(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, mask, 0);
>   }
>   
> +static void check_platform_gt_count(struct kunit *test)
> +{
> +	const struct pci_device_id *pci = test->param_value;
> +	const struct xe_device_desc *desc =
> +		(const struct xe_device_desc *)pci->driver_data;
> +	int max_gt = desc->max_gt_per_tile;
> +
> +	KUNIT_ASSERT_GT(test, max_gt, 0);
> +	KUNIT_ASSERT_LE(test, max_gt, XE_MAX_GT_PER_TILE);
> +}
> +
>   static struct kunit_case xe_pci_tests[] = {
>   	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
>   	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
> +	KUNIT_CASE_PARAM(check_platform_gt_count, xe_pci_id_gen_param),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index 3a1df7a5e291..ce4d2b86b778 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -27,6 +27,7 @@ int xe_pci_fake_device_init(struct xe_device *xe);
>   
>   const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
>   const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
> +const void *xe_pci_id_gen_param(const void *prev, char *desc);
>   const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3b997c941bbc..a4885f64c2c4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -38,44 +38,6 @@ enum toggle_d3cold {
>   	D3COLD_ENABLE,
>   };
>   
> -struct xe_subplatform_desc {
> -	enum xe_subplatform subplatform;
> -	const char *name;
> -	const u16 *pciidlist;
> -};
> -
> -struct xe_device_desc {
> -	/* Should only ever be set for platforms without GMD_ID */
> -	const struct xe_ip *pre_gmdid_graphics_ip;
> -	/* Should only ever be set for platforms without GMD_ID */
> -	const struct xe_ip *pre_gmdid_media_ip;
> -
> -	const char *platform_name;
> -	const struct xe_subplatform_desc *subplatforms;
> -
> -	enum xe_platform platform;
> -
> -	u8 dma_mask_size;
> -	u8 max_remote_tiles:2;
> -	u8 max_gt_per_tile:2;
> -
> -	u8 require_force_probe:1;
> -	u8 is_dgfx:1;
> -
> -	u8 has_display:1;
> -	u8 has_fan_control:1;
> -	u8 has_heci_gscfi:1;
> -	u8 has_heci_cscfi:1;
> -	u8 has_llc:1;
> -	u8 has_mbx_power_limits:1;
> -	u8 has_pxp:1;
> -	u8 has_sriov:1;
> -	u8 needs_scratch:1;
> -	u8 skip_guc_pc:1;
> -	u8 skip_mtcfg:1;
> -	u8 skip_pcode:1;
> -};
> -
>   __diag_push();
>   __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index ca6b10d35573..e4bfbafa6809 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -8,6 +8,46 @@
>   
>   #include <linux/types.h>
>   
> +#include "xe_platform_types.h"
> +
> +struct xe_subplatform_desc {
> +	enum xe_subplatform subplatform;
> +	const char *name;
> +	const u16 *pciidlist;
> +};
> +
> +struct xe_device_desc {
> +	/* Should only ever be set for platforms without GMD_ID */
> +	const struct xe_ip *pre_gmdid_graphics_ip;
> +	/* Should only ever be set for platforms without GMD_ID */
> +	const struct xe_ip *pre_gmdid_media_ip;
> +
> +	const char *platform_name;
> +	const struct xe_subplatform_desc *subplatforms;
> +
> +	enum xe_platform platform;
> +
> +	u8 dma_mask_size;
> +	u8 max_remote_tiles:2;
> +	u8 max_gt_per_tile:2;
> +
> +	u8 require_force_probe:1;
> +	u8 is_dgfx:1;
> +
> +	u8 has_display:1;
> +	u8 has_fan_control:1;
> +	u8 has_heci_gscfi:1;
> +	u8 has_heci_cscfi:1;
> +	u8 has_llc:1;
> +	u8 has_mbx_power_limits:1;
> +	u8 has_pxp:1;
> +	u8 has_sriov:1;
> +	u8 needs_scratch:1;
> +	u8 skip_guc_pc:1;
> +	u8 skip_mtcfg:1;
> +	u8 skip_pcode:1;
> +};
> +
>   struct xe_graphics_desc {
>   	u8 va_bits;
>   	u8 vm_max_level;
Looks fine

Reviewed-by: Ravi Kumar Vodapalli<ravi.kumar.vodapalli@intel.com>

Thanks,
Ravi Kumar V



