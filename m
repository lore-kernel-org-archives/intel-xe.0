Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D18C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 03:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D516610E218;
	Wed, 21 Aug 2024 03:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnJMUCAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FE010E218
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 03:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724211208; x=1755747208;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W5YKA9tSphQh9n+1049phY5IFbaS26bMgkyF/VyT6h4=;
 b=KnJMUCASd16GTzvqtdP7lpE5Gfqixzy0AgsQOT49vQqbKsVsvsy3dpps
 tyarFUWOvt4B/d4xlE1wSO2omMvbcUaZ38rkwgmjUvYrru757CanvwHHG
 I3exXQyNLF7X6G62Zo6lNjkiV0YU9qfDk7i1aR1K/SVrYNyztBD8lWJln
 acwrUH6UuLbXFJOelcO+ZIJyOp+cfRjFJz3UmyUiF2AK4hrBoXhe7yUaq
 0J7w9cUBUBQSpfVnWME3Vhjbs7rdwvgwV3WxSn6CTvKMOzjLoJTpaEgKX
 q+pTDwFDcvccRQ+J1xZR0j2tN6gf4XpvjeW56+PVST8mj3i967ady2WJK w==;
X-CSE-ConnectionGUID: oy6lCgH3TfWSprZqkci/Nw==
X-CSE-MsgGUID: N39ZE01LTWO3R7K30xC8lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22430016"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22430016"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 20:33:28 -0700
X-CSE-ConnectionGUID: LYLIcpk8RAyl0tMrkD6EdQ==
X-CSE-MsgGUID: b3RW/dXnSKau5nszsJWkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="65158015"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 20:33:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 20:33:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 20:33:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 20:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uibtxqk+Uw8Qw/+bMDmGrc8GDLYnUuCTHWVeIH/mva9stJPWLmpPMvSLjxAgASmHJCrfslcF4+emXYyH/2i7GswWogiouTES9lF/kIRwPr0bUzhIzg/R9m1dXYAxM2/9bBXKhlUUXo91S0lpOQ7Z44q5LIlD9Mnq3JArtSJhtDHGk8sq15sRrGcA2WPt6deWvqZStSoR0nTR+ueU5LMxJKeS6UhRTZEQ6LvceeWUdkQeNqteJ62qYFjj6L+UnBXsSL0zxrmV+pw2nl+UIviKsFjACgdXpdmc1qWekn+aiK6++Vk2pvKOaPOgiDkSPrzbDeHqAIpz4fm2mN6U7yIR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbI5741G7Ryf2OASCx4BcPcfiX945UKLt2HjafB5rGU=;
 b=Kpe7i4QymNSLiZTx6SluHynErzILk7kQ10+RdP32hK0BrOmxIZs/8ZDVXTTlRyqz8ueg81XPT+gDn7nre9uqeeiF0GywvUndldjZPKwvPYWsEKRMWoS6tJe5S4M5hDSZSwZOzovxph3nkHEjsW7WSvWLJ065bfXWa8O17op/tJ4HnaupGj8SdI9DHR8EHTVH1gPZovI9dtXXPJlA4PQjh9TYCoF0tFoE4ZRbCArry9YnzgOJyk+OKbw3DmzppCDgUkS6I1K9I+oJZdaPhC6A3YhEAruEEPS7P9+JmQHcLzDyZ31158Qr2mKEFKWqwL1jl63JMtbiSsAOotwpOptbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 03:33:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 03:33:20 +0000
Message-ID: <3f2a15a4-7f9a-40d0-bb33-b4843dc9605a@intel.com>
Date: Wed, 21 Aug 2024 09:03:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Invalidate media_gt TLBs in PT code
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240820161632.987369-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240820161632.987369-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d94021-56bb-440c-493a-08dcc19200ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEY4ak01V1Z1bEdIbm1RK3hId1F5a1RxTWFyVERjZkVVaTg3ekdVbHBDNGxr?=
 =?utf-8?B?OCtCa0tSdGhqeGF3TGozbnl2VTVCbXhpcmIvLzZGcUx2RHlkOW4vcGtNTzgr?=
 =?utf-8?B?cWRkS2t1WDdRRHhuVjd6MGNRNkNSWC9zTXhSbE0yc09IdmtDK3phSlFqYTRW?=
 =?utf-8?B?N2RMUElPY1lZbHd5L1lhRnRVRjRXQ1ZuM2ZZSSs4VUVPK2lWUnFIcjhSTXJ6?=
 =?utf-8?B?akpZNEhyY2NYekd6K1VUZlIxOFRmbFJmZnQ0eklmbjZkOTA0c1RzeVlnVTlO?=
 =?utf-8?B?ams1c1AxMlNEdW5XSGREQU5rM01qSVNFV24xbUNvK25aVXZGaGZaVGtFckJn?=
 =?utf-8?B?Rlp3OFlsL3pZY3UrZUxycm41OUljWmYydEV6NmFyTkRiQVMyYWZ2ZVRwME0r?=
 =?utf-8?B?WkVEL0lNTUVNK3ppbk81bjFZc2xScVdZcEJkSFFhdU1QZlVEaGhxQjdHTDFv?=
 =?utf-8?B?cmtmRXM5TTdMU0xDVEFXL04vanN0RVVhK3ZWNERYZS80cmdMekVMaTR5MC9Q?=
 =?utf-8?B?SkpyT2M4b1o4dmFydlZVUUd4ZnVXc3FXcElWcUxWTUQ1WkVpaXFodWxXd1hk?=
 =?utf-8?B?dVJrT1lvTlEzMGdjK0ZHSlZFQ2dhTFQ1OVdrMDlPdjJjb1lORHpvMkVGaWwy?=
 =?utf-8?B?c2p6SWxhZXZOZWFXeEtPRkNpK055OE9PeEhyeGlGWWN2d1UvQzBzWlYvaXZj?=
 =?utf-8?B?REZUdW0xZ2lwYjJrNERtRHgrb095dWNEdE9qMkJ4REtnK0tCVGJHSVJxRTRs?=
 =?utf-8?B?WmtQeExESk1oYWZERkpYZ2VxTWh6TUU3eE52RmdtRktCZkRCR3N1TmNWQUdF?=
 =?utf-8?B?TjA2Z1dHYkJYZUhPbEk0YlFscEVKODQrWDh5azJkdG10UjdJbTZQbGkyaTdU?=
 =?utf-8?B?Y2oralEzVlVnU1ZCZ2ViR2M2V0pka2NKM3ZmTlo4L1pFSlMzT2lISFN3K3Bq?=
 =?utf-8?B?SUJhVTE4cEVtVWQvR2dVVTNXQVJ5ejRwRm5XaElTcUQ2Nk5qTHVuZE8yaTRP?=
 =?utf-8?B?TU13cW4vUkJoYmRTTjVVRFR1eS9XMjRvRHp2K2h2aEJuUDh2bkJtK1JzQ1BW?=
 =?utf-8?B?OE1oNWhZMlZoYXlOalpGNEg2emxHZHNrTjd4TE0xMkJDVFJrVVpNVEVuUzVG?=
 =?utf-8?B?dGcvOTJaSGM3aDkvb2JpcGE0amdZUjBpN1FWZkpOZHAyVkI4K0ZmUkJtSEdh?=
 =?utf-8?B?N0F0Y3M2TjBRTnJlODZDZDJzMDZ0VXEyWWpVNEFBcm9PbGVaRU5MYjc5MUt4?=
 =?utf-8?B?ZWdCa2g2MDM5U01ZcWkrM1MxWDlTUFpoKzZXcG93TVd0alRzVUQ3b2o3ellL?=
 =?utf-8?B?dlBNQTU2bXhNNkRxZC9VbWhCaFpVOE00RWpHWnNmU2dGSWxLeXJETHYvdVZI?=
 =?utf-8?B?RjZnZlhzSUFGS0dRVjhPOU1hWklGMzRiVEQ2VmVXU1NTUTdBc1VXZUxmUHVu?=
 =?utf-8?B?U0dwSE9ibW1KMHk0M3FheE1FR0NaQ1pxZE5RVzdaeTBEMUc1VE8zVy80cmVp?=
 =?utf-8?B?cEFOZXdXTEg0TEs3N1lrYlFqR2VhZkgxbm1mWGZTMjYrdTk0R3l2azE4VEZM?=
 =?utf-8?B?TUtWZ2dyU0gxNFFwNU5HajNQemdmMUM5SXZNVGtTc2hXaCtLVVlLVHN6UExm?=
 =?utf-8?B?TktqdmNPaHVMNjBoSDFoNmRuRVJORzE0NGVtK2gyejliYVhDTTNPb0ZLaHlC?=
 =?utf-8?B?aW9lM3ZuUHNYdmlFRjJLWS81ZUNYTm0vTzhsNXFQeHc1YTNWdDNYaTFVdU9Z?=
 =?utf-8?B?VUtBS1o5VkQ1ZDdJQ0tpTDZINFNmYnV4ZUFRUzUzeUpyWUNXRmNVREUxQ1Bm?=
 =?utf-8?B?UkF5OXRDSDE3RFdPam5YQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNoNnFoMERGNXNEVTNCbTZSUXcvNWhaVGFjVjRIZVNaeE5MREtnK08xYUlX?=
 =?utf-8?B?OWtuRVFSS3dIV0VGNEFEbk92aDl1d3BaUElqS1BIYlltVnFZajArSVJsNWlk?=
 =?utf-8?B?OExjYkd0RnVDTUtoUXpPelgyQTdXUTBXODZEYUFVMUpCcCs5NjNhUUY2Nk9O?=
 =?utf-8?B?U0NwNFdnaUN3K2tNMFJMWWtJRnZ1TTdXbFFRL2hIWVZqandzQ1hnbll2Sm9V?=
 =?utf-8?B?cTA1STZSRXpWdnRiczVoZGR0Z1BIUUpTbWR4UEJuQ2dzTjN0Uzk1WFM1Y0Nv?=
 =?utf-8?B?TEFpbnN4WHFOOGlUcVBaOHpBQlRhN2xBR1Rpd2hDUXJSNm9kaW5aaXl4NXBh?=
 =?utf-8?B?aHlCcFZSV2ZRbjZtUmFzRU5hcWdmdVlwdGluN1dDYnRNUXU1dDRiQlZNS09u?=
 =?utf-8?B?cFQxWlRMaXN2KzRFc1VzaGdCNUxyQVlsRytMeWR6dkhBL2Y0aTUwb05ZTXQ1?=
 =?utf-8?B?ZmIxTUdkNnluOWo4SUlMWHNRZnEza0luM2x4MHZ1SG9qZ0N3TjlYV0h1dkNG?=
 =?utf-8?B?Q3V6bnFpZ1dEK2xmMkxqN2FuQmZNaDJaemNKWnI2MnBoOEc1aXRWQjBwNDZk?=
 =?utf-8?B?dXZULzFDblBsZGdER3VMclozM2xhTUlVbFZHN3NxVmYyaWhlTU5aREUvcmZH?=
 =?utf-8?B?WDF5cGVjd3RZeHlpSThCbE9sUWJOckNON1pSOWJBSEJVTkx2VTJSSTV6bG1n?=
 =?utf-8?B?bGZ6S2dmcm5YQ05vK3VIeitIR2RPRWxQZ2hxVGJjRldYSGtGY0lJaE83b1I4?=
 =?utf-8?B?ek9TREdyRVZmWVduVUYrQ3NuTGhwc0dWTHB5RzhtUEx2bGREL1NaTDZYNjUv?=
 =?utf-8?B?QllCV0VqTVQrYkt3Q1FXRnVadEdKQUlGZDAwOHMvTU9pLzZIZCtjT3EwKzhP?=
 =?utf-8?B?MjBNU2t1OGczRXdLU3ovUTRVTW82UmdvRnVpNXpncXcrN2tlSVg2YTA2clBw?=
 =?utf-8?B?bmJOb2ZEMnlpMGQ5ZURzSDc3cWRhOGFLR2ZNd281anVKV0pQRFVDWXdDb3dQ?=
 =?utf-8?B?Q0ZQcGNWSkNQNFZnTDMwOHQ0RGpDa0hpNXBsMjh2aWw2NHFFNWs4cG4vSXNs?=
 =?utf-8?B?YzlQeG5FUm9TVThKaGxmUUlURUhpY2ZKRmVaaGFIZGJYUVltQlJwL0JWZUk1?=
 =?utf-8?B?NnJxUEVQRDhYNlJ0V2x3c3pXWElSOEJWZWMzYmdpYTRMYXo1a0FUaUNUeUJQ?=
 =?utf-8?B?MUp4czAvTkVPeUk1Nkg3d3lXRE5DSm9NSEJoYlBwb0E1VHJNRlozVVY3S2Nx?=
 =?utf-8?B?bUNtdEs0VGlGRE5meGlYMVBCUGgyUkRBNW1wYWREV1NKeVhqSzlpdEphVlkx?=
 =?utf-8?B?bUtBRVVabW1UcXFmSVl1akNFTWQ2L0lFdDY5WittNnY1UTdkZWJLb0J4Tjgw?=
 =?utf-8?B?eEFPSERmSk9STkhFZWtsdG5xUkN3SHJhbXRoaVByVUFJR204RXI4QVF1VUxp?=
 =?utf-8?B?eDJWS2JqbzFHVW84WFpmMmFBY1J0VDBRblZPcE1qYlhPaTFoaUpBUEZWRCtp?=
 =?utf-8?B?SFF2RDRaT3d0ZkJBUGI0MUEzY3RHdjFOZTN1TVVaWUtiOVJyVG0zTjBwQ2hW?=
 =?utf-8?B?OGtSY3ZHRC9oRnBoUVIzMy9mVHRlMnhuRjlKU0VsOWIvRFM4TjU4QzB1bHRQ?=
 =?utf-8?B?SEpldmxSVGxROTF2bnJNMVY0ak9SWjFUQnUzU0dOZWRlNVkrSkF2c1ZaQjdz?=
 =?utf-8?B?aDAyRVZLViswdktaamFpK2FWWUFIc3JPZnBrY0FJZlRqR1kzVS8wa1BRNlVz?=
 =?utf-8?B?Y2l0SWtlYUxVTjRxdFBWaHJmR1hkcElUK0NBVHJSOG41ZWhWQU5VSWhFSzhz?=
 =?utf-8?B?UXVuaFJCTDRyOGM3R1ViMkk4a3FFQW9DejN1MXQ5S2o3SXRwOEt0amJYbkUy?=
 =?utf-8?B?eUYzUDJOZnAvS0QrMU9zRlZldGU5enEvTDlxWXhCSmNUNzhWNFBYaHMxQzl1?=
 =?utf-8?B?MHdXemZ3eWpQb3pnY05iS0JKNDI1em1lakd6WFl5REtoNGtIamNBSXRUYk92?=
 =?utf-8?B?NjNQNHllV0VSYlhoRitnSjFNa2tnMTVrMVNTWTdZNlNMOCs5R1ljek1yL24z?=
 =?utf-8?B?b0ZSOVJxVHFhem9aYVhldzAyYXBnOGdiYStxbE82cnpaUWtlekRaczVQUDF1?=
 =?utf-8?B?ZitjckZVWTk2NTA5akdra2loMnQ5ZmVKREIwaHc4Zi8vUU1PLzN2WGVKMnBO?=
 =?utf-8?Q?G6lotEBxsyB6fngEVAaGlxE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d94021-56bb-440c-493a-08dcc19200ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 03:33:20.5406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA86GEWLYejn81WLecZLXFB63IRCkVWBxWS6raFDVRKqgnWcZL/OBkBRXdX9EZc5zvlmLlmp9PTBmHjPo7i41LIkQhSlEsxXBooTLtVUBtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
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



On 20-08-2024 21:46, Matthew Brost wrote:
> Testing on LNL has shown media GT's TLBs need to be invalidated via the
> GuC, update PT code appropriately.
> 
> v2:
>   - Do dma_fence_get before first call of invalidation_fence_init (Himal)
>   - No need to check for valid chain fence (Himal)
> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 99 ++++++++++++++++++++++++++++++--------
>   1 file changed, 80 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 579ed31b46db..6c6714af3d5d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <linux/dma-fence-chain.h>
> +
>   #include "xe_pt.h"
>   
>   #include "regs/xe_gtt_defs.h"
> @@ -1849,13 +1851,20 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>   
>   static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma, struct dma_fence *fence)
> +			   struct xe_vma *vma, struct dma_fence *fence,
> +			   struct dma_fence *fence2)
>   {
> -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
> +		if (fence2)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> +					   pt_update_ops->wait_vm_bookkeep ?
> +					   DMA_RESV_USAGE_KERNEL :
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +	}
>   	vma->tile_present |= BIT(tile->id);
>   	vma->tile_staged &= ~BIT(tile->id);
>   	if (xe_vma_is_userptr(vma)) {
> @@ -1875,13 +1884,20 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   
>   static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			     struct xe_vma *vma, struct dma_fence *fence)
> +			     struct xe_vma *vma, struct dma_fence *fence,
> +			     struct dma_fence *fence2)
>   {
> -	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>   		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   				   pt_update_ops->wait_vm_bookkeep ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
> +		if (fence2)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
> +					   pt_update_ops->wait_vm_bookkeep ?
> +					   DMA_RESV_USAGE_KERNEL :
> +					   DMA_RESV_USAGE_BOOKKEEP);
> +	}
>   	vma->tile_present &= ~BIT(tile->id);
>   	if (!vma->tile_present) {
>   		list_del_init(&vma->combined_links.rebind);
> @@ -1898,7 +1914,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>   static void op_commit(struct xe_vm *vm,
>   		      struct xe_tile *tile,
>   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> -		      struct xe_vma_op *op, struct dma_fence *fence)
> +		      struct xe_vma_op *op, struct dma_fence *fence,
> +		      struct dma_fence *fence2)
>   {
>   	xe_vm_assert_held(vm);
>   
> @@ -1907,26 +1924,28 @@ static void op_commit(struct xe_vm *vm,
>   		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
>   			break;
>   
> -		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> +			       fence2);
>   		break;
>   	case DRM_GPUVA_OP_REMAP:
>   		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.remap.unmap->va), fence);
> +				 gpuva_to_vma(op->base.remap.unmap->va), fence,
> +				 fence2);
>   
>   		if (op->remap.prev)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence);
> +				       fence, fence2);
>   		if (op->remap.next)
>   			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence);
> +				       fence, fence2);
>   		break;
>   	case DRM_GPUVA_OP_UNMAP:
>   		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.unmap.va), fence);
> +				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
>   		break;
>   	case DRM_GPUVA_OP_PREFETCH:
>   		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence);
> +			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
>   		break;
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -1963,7 +1982,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   	struct xe_vm_pgtable_update_ops *pt_update_ops =
>   		&vops->pt_update_ops[tile->id];
>   	struct dma_fence *fence;
> -	struct invalidation_fence *ifence = NULL;
> +	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> +	struct dma_fence_chain *chain_fence = NULL;
>   	struct xe_range_fence *rfence;
>   	struct xe_vma_op *op;
>   	int err = 0, i;
> @@ -1996,6 +2016,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   			err = -ENOMEM;
>   			goto kill_vm_tile1;
>   		}
> +		if (tile->media_gt) {
> +			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> +			if (!mfence) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +			chain_fence = dma_fence_chain_alloc();
> +			if (!chain_fence) {
> +				err = -ENOMEM;
> +				goto free_ifence;
> +			}
> +		}
>   	}
>   
>   	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> @@ -2027,19 +2059,46 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   
>   	/* tlb invalidation must be done before signaling rebind */
>   	if (ifence) {
> +		if (mfence)
> +			dma_fence_get(fence);
>   		invalidation_fence_init(tile->primary_gt, ifence, fence,
>   					pt_update_ops->start,
>   					pt_update_ops->last, vm->usm.asid);
> -		fence = &ifence->base.base;
> +		if (mfence) {
> +			invalidation_fence_init(tile->media_gt, mfence, fence,
> +						pt_update_ops->start,
> +						pt_update_ops->last, vm->usm.asid);
> +			dma_fence_chain_init(chain_fence, &ifence->base.base,
> +					     &mfence->base.base, 0);
> +			fence = &chain_fence->base;
> +		} else {
> +			fence = &ifence->base.base;
> +		}
>   	}
>   
> -	dma_resv_add_fence(xe_vm_resv(vm), fence,
> -			   pt_update_ops->wait_vm_bookkeep ?
> -			   DMA_RESV_USAGE_KERNEL :
> -			   DMA_RESV_USAGE_BOOKKEEP);
> +	if (!mfence) {
> +		dma_resv_add_fence(xe_vm_resv(vm), fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
> +	} else {
> +		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +
> +		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
>   
> -	list_for_each_entry(op, &vops->list, link)
> -		op_commit(vops->vm, tile, pt_update_ops, op, fence);
> +		list_for_each_entry(op, &vops->list, link)
> +			op_commit(vops->vm, tile, pt_update_ops, op,
> +				  &ifence->base.base, &mfence->base.base);
> +	}
>   
>   	if (pt_update_ops->needs_userptr_lock)
>   		up_read(&vm->userptr.notifier_lock);
> @@ -2049,6 +2108,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>   free_rfence:
>   	kfree(rfence);
>   free_ifence:
> +	dma_fence_chain_free(chain_fence);
> +	kfree(mfence);


Patch LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	kfree(ifence);
>   kill_vm_tile1:
>   	if (err != -EAGAIN && tile->id)
