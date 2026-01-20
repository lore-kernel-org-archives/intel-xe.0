Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291FD262A2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CB110E664;
	Tue, 20 Jan 2026 21:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIkpcs29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFEA10E66A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768943486; x=1800479486;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d/nEyzgwUuCWiAVxDEsOYex85JRGbmtg1Sm17KZaMPE=;
 b=GIkpcs29OVWpJAbUfFnki5wy7uFoP3E0ZY/6Y2VBrHV4F1uwZTexG5YS
 TYs4k69R44vIqWm+vk3XZjO7FqkjqzIhgEwUrnAwYNIrNgxIacvzazK7W
 x4hGKJ+klWsQ4NkwSf6YKhnNQloxgqcRhDzSTtnfeTcbDfR8rXp3C1s58
 MYlAy/3nqJMiKQX1aLzadrhecXMfRuDuAENtTu682ZnCod3T6pxenpWKo
 1nk4bM01zPh892sN/eQgZSO6pmmEc0+lCO/qvVvJl5KVsxlZNL7BVCxJs
 Gl4zEhelu/qR8uYJB182tY7VY2PeDveismy8wbMo0hgxEhyByQq+hunF8 Q==;
X-CSE-ConnectionGUID: 4bmpdTQnSheqE4ut380FsQ==
X-CSE-MsgGUID: aADV7uI9TBGXmP4kpqM48Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69896736"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69896736"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:11:25 -0800
X-CSE-ConnectionGUID: 2MEf+rxERVWHnmGdx1a1zA==
X-CSE-MsgGUID: QPc7e+bhR5qLNIo1yrPSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="243802225"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:11:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:11:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:11:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:11:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpKpzy8YpwS2S5yRk3oxjtlcO0B7dTA7+THrn0rXA4patJq9rvzQ8X/mltnVQ3DFQ0qBxjo3uu4frfpWvUaywerKfTqMbz+Ioxeva6LagTzBUee3/vZKKKvGxjY7AeIkOtl70h9XBxOuEHk7rHATxB5m4lWWeyu2i3A25VqVrOu9OS1VOfIQ3hPht0X2hxK4M07acfZVB+EI3n7xtzlUfT98qegjmimomUYY2Fi8sLvTmeG6sT1WVVMamplWSEn+1plAONwhSTZ5pjQeO2szYmax+h+WetuIPWk2zG/DeheFDPhpvf3uHzyK0kVA0TQ0ZMNAgnE35j5bT9uZT68V/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/A5tMUND3tvdto2a7oiNhMUrinErkPYcg+/y7H3HUw=;
 b=ywme0J2MGQQ7TH1pHI48enwM49vz/5Oy4nXW6MIYP5V8koAqmCLgtrL+ahZsdCbrUrkJSnVaU8oUg/x+/KA0RNY7/RDGOED8ICkAR50ulOe4bucxTO5IXcQlmVXMUX3/CHoeVwaIWXQmogqVE+I2shHsNAjdOZ3E3khyO5X2uxPIskHqFprlcLwHNukfE94rr8fNEuWIvRvsQbSR086UlqDkEP5G6SRmTB5NpcW2SwUVsYVoCdfhhSGo9oXnDR505FlezAOeBKz8TuZZbPi1/zI3okchb4N7aDDuARrB+vkf73addM8K9COZuXn77xHXy6p++ul//qpHmHYcM/4URg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 21:11:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 21:11:21 +0000
Date: Tue, 20 Jan 2026 13:11:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aW/vdvCw/3DZwfpt@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: c1371d98-7bfc-474b-1057-08de586875c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk04bFg5ektWMzlsN2FzYzZ5WEdQZjBHZXZZMi9CQnJGUWRkemZuZmtYTXov?=
 =?utf-8?B?Y3Y5aUtyTDdOc1NRc2JJSVNxMGxGdmJSaVo5NnErRHhFa2N0a1hJNnU4NFZO?=
 =?utf-8?B?RFV1MytXZTBBbmFHWUptUUFPbS9sakpCWE9JVGdSNWVkSE5xZUlrT2dWZ3gy?=
 =?utf-8?B?eHZOVGJsTFZERTZCVHg4YUVMSUFveDJ3UkFpTW5zS250UU5SdGNvNmozc1ZY?=
 =?utf-8?B?WXBGR1VuYUgyeitheWRFM2FwWlBXeGdZVm5FbHNIQmZJbktDRUJPQ1BhbFFi?=
 =?utf-8?B?L0cvTks3ZTYwbW9FeGVuQWJwNjdralBJQm5jMTFtS0VLRnlMQkc5Y1hYNExn?=
 =?utf-8?B?Qk9JVnM0Ullsc3BVNkpzM3lkakJ5TDlXMTVBd3dsQ0J6Wk1Qb29UM1FmYmcv?=
 =?utf-8?B?S3VTRlJyYWZEV3ZkN0ljYWovbCt2N2w3M3ptam9mNnVJcnVMU1ZGVlozZUIr?=
 =?utf-8?B?QURpWmNDOWlLK1NSUmpJc0w5d1p2YXRNWFJUcWY2OGIzbWozcktWTnY2OFRO?=
 =?utf-8?B?aGc5VC9GYzFuNzZ5bnJNWFh0bkNPcE1RQ1hvR1JLSXptQkNxc0dMbUFvY2FW?=
 =?utf-8?B?dDlxMWpzSjdDVzBPZFBnY3JXT1lNbzB4VmQ4dG1JSFMzUE9SaSs0cDV1V0cz?=
 =?utf-8?B?cFg5dkJyV2MzSFlvdWZvS3NiYmNTcG9BM1JPWXpNWXAweWlSU3ZsNVVZRmR0?=
 =?utf-8?B?N1NuODQzanIzbnZERWZqMzR1ZXlpQTFFc1RBYlBxeG1zbHp1bmlwWlB6L3dG?=
 =?utf-8?B?M2dUZVhUbHBzNURrQklqM2pjSHJLdkxxUHNXM0IxemRmWjR0MEZlN1dhaVJN?=
 =?utf-8?B?dm56bVFZQlJmaWlHVWdpLzRKSjQ5YzdQM2JxOWZVUE5leEdVdXBsUHJkcW1U?=
 =?utf-8?B?c20zQ2l1S2hLVEZ5dHhoL1pFOHIzbE9NV2xma1MxSVJOOGhhQnRySDJiL0lk?=
 =?utf-8?B?N0ozYUwwZWNBamg0MEhWYStESE9zcWVnbW44YUlFSHNNWGFDYnVqeEx5L2NJ?=
 =?utf-8?B?bmVUd1U4MjVVTk9PaHF5U3g1cXU0NkxkNWRhNm5ZNjNaWGxxS3hXcUVsREpQ?=
 =?utf-8?B?eml0NTQwY0g1V09yUW9DU0lRMmJ3VzFqazNwbDFIdFVsZ2FyUUc2dm5IbUx6?=
 =?utf-8?B?YkUrSmJ2U3A5Vy9iOHpYMnorVlhMYjhFZ1pnS3JrRHgzZXk5WmNsRkpKK2hQ?=
 =?utf-8?B?b0RTT29La05IdDZnUjFuMXNOUXJ0cHhpcmQ2dFRnaitNMVB0MGxrdUxGa0I4?=
 =?utf-8?B?L3gzakZ3WUVka0huSmFZbTVqbUIzaFZmUVNXclcra01Geko0N1Q4K1RveG5G?=
 =?utf-8?B?cHVxSFhiZmo3a2NJUEh0WWJyWGcyQzBmWXptUDRSbXFtNnBIdlpFMjBJUUFZ?=
 =?utf-8?B?MXpHdzYvNjAyTTNBWlhFaXAyM2R5Z0Z2QVRjVitudHlsTXVOK0Y1RTArZG5o?=
 =?utf-8?B?T1MzTmZaRVIyNjNNN0xMNjBvSVI0ekRFQ25Sc1ozblEyQ2NYSHZvRGRrNTNN?=
 =?utf-8?B?ZW1Yd3ptZWRkSFhJWWNZMGpLS2diaXhJellzRVJhbE8wYlByYmsvdVU0Z2wy?=
 =?utf-8?B?QU5ScHhrdjIyenh5N0tMZkxoSmNFSjRZdW44cXVDeXNQR3BMYmMxNFhIMTZX?=
 =?utf-8?B?RWxIUG1aSm1QWFJyNnMzUUlKTWVKWldXZ25kbXBYMGc4dmpGTFMyeUxZVjJt?=
 =?utf-8?B?dHdiTHpZL29CbktNdVQyTGlGcXNLaEw4NnAreENndnlUQmRMN0hjTlFhVVJr?=
 =?utf-8?B?aEVySlArSUV1N3NmT0xwZWI5Zk5veHMvLzNxaGx0VEdRV3lxdXg3NStPcHFN?=
 =?utf-8?B?eW5GQ0czZkkzblpvVysveGl4Z04wcnhoTWdvOEh0ZEViazVvUDlYVEp6c3FN?=
 =?utf-8?B?djRBOHNvdjJRUWJKUDFLekM0M2JWUlRrU2tMcDZoWUNUM3NrR1lZM3IxUzdR?=
 =?utf-8?B?dWo1R0lOMWpCVFZON2ExU3A4aiswTG5MNXhpWkFnZWh0dFREU3hWWlJlanov?=
 =?utf-8?B?VEhaUkdUNHdHVWNsSUdyMWREN0NKN0o4MTI5VXZuSWVuM0VlNndsZHFyRjZD?=
 =?utf-8?B?ZWEyV2IySXVML21NelNEOWZwZlBHQjFJV0JFbGZzNHRnaGRnN0RndnlEaGta?=
 =?utf-8?Q?DSWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9vdHNJdkFDRjFoS2lGeFd0TmE4NWo3Rm04RUQ1MVkyUlVTM1RZYXFIcGhx?=
 =?utf-8?B?SXJGZDZpRXBLMXFScmRTTU92TjM0ZUlHVHRjSDBqcWUvelBSbCtzK2p3UUVq?=
 =?utf-8?B?MU5TakkrUTZpS2E5SWpDdFNPcmhBMEpiL0Z1N0xsSCtxUEVvRUVXNVJQWDBv?=
 =?utf-8?B?elU0VjdIeWgvd1ZWNWVENFpraVVnZTRmY0NPdWdxd1NRTUNhSkhxNExBYXA0?=
 =?utf-8?B?RnJwSjdYSDlzajdnTS9Ld0VRT2hCSCtER3pVWVJJNDlNTm8waCtuV05BTjFV?=
 =?utf-8?B?QWZSVmNWV2Q0ZCtueU9HUnBOR0t2UTVxdTFWTEIyTjB5a3psM1NVc0E2R1JM?=
 =?utf-8?B?Q3FkUXJ6L2VOZmFMOWRaWU90WUtCZGdkbzFRdklKaml6ZU80MGFvTGY0c05D?=
 =?utf-8?B?eWxmYitzV1RBYVBCZmJCOEsxQVpUa2ZJZmhjTjlsZDB4clVtcHNxOEVmZksx?=
 =?utf-8?B?c1IwaTBVei9SYUJQOURQKzZjRERYQW5WS0MwQzhVek5BVVJmZmdCN00zZHZQ?=
 =?utf-8?B?T2FoRDJnVktiZ3VZVEtBM0owL1NMY2M3WW0xQjhFTCtuN2R1bmEzODVFaWpi?=
 =?utf-8?B?NFBodk05Ty9lSU5HMS9pK2xKRjN6dVp0V0tONWREa25GbC9IeFVGUlFGQms0?=
 =?utf-8?B?VlNmVWM5TE8wQ3VKSklBbGV2Qkd4czR6UFdWVUVPb1JrdXRBamNESS8yTlNq?=
 =?utf-8?B?RGQvbmcrZlA2NythQjA4ZjVpRFRDdHFLS0pjZXVXUkhtaDNzQzNaUUlsTFA5?=
 =?utf-8?B?c0s5cEdWRHlteTFxQ0dOanMrQjROR1UyNUN5OHRnQWJINjQ0ZE9nOFdFSjZR?=
 =?utf-8?B?d3dkKzVzaUY0eW81Q3UyK09uQVNPRSszNVZxTnJTMnZSbVAyUnc0QmZVdWtV?=
 =?utf-8?B?aVJVNU8rdU5sMVppVUVKVzQ3Z0N5T0JJcktuaHZsYmRkN0tFVEdxS0pOK0NN?=
 =?utf-8?B?NjZqTHF1WU1SOGtDVnJyL1pud1kzZHpKQUhGamlhR0l0VmU5VWxRem1ScWQ4?=
 =?utf-8?B?MTFQTmxkdzhqSDhWS1hxTzcybDJ3ZVE1anZ6TGs0K3M1dlFTNmluemY3S1dD?=
 =?utf-8?B?VG85VlZ6RXcvM25oTXNRdTNXNVhvWlZHZFp4MzBoaWEzV3h3SzhmZUN3YmI5?=
 =?utf-8?B?bEgvYUFWRmpJMjRsYXNxVDhyNys2T0ZkdjBpZW1NN2hKTXJuQiswL1VaL1JD?=
 =?utf-8?B?ZkFtL1p6dzJydm9aMXBBdUVLeGUvMjdESEMvZXIyU1Q4M2l5ZHYyWDNsVVZK?=
 =?utf-8?B?K1VidGxBeDZjdkpyOXVkQ0Y0VHlHVm5jQXlVTk53M1Z4TzBqRHdhSnFEQUx4?=
 =?utf-8?B?Q2wyeHE5cVAxSVYrTDR5eEc3bmNnUnlyRHdPbkErRGRpdHFBTlNSL2RpTisr?=
 =?utf-8?B?dDRESGw1eFcxY3hMREQ3RlB5V3Q4VC9ZSXlNRnlaeWdCTEJLUVFIMWZPMmI1?=
 =?utf-8?B?TW14S3NwNGdmR2dLNlpwTytSMmRtcUhwazBCUk10c3g3dnV0WlpieUppOWh5?=
 =?utf-8?B?WTNmU1hKenZRUktTZWIxRHZnMjVNbm9sQytJd2drM09walNpanZJaHRpYU1T?=
 =?utf-8?B?SytaalNFQUkwcWhzMThJU1pMSllQbkpCNGJ6MHFxbGtua1o1VmliaFJGUnox?=
 =?utf-8?B?clh4V2doOTl3SnZhcFhadVo1Z2VQRjJjTDk3bGxub296MWhlZmZ2Tml2bkdi?=
 =?utf-8?B?WGpUVytiUlJRWjNxVE03U09MdmZBek1GU0pnVFZ2VHN1MTBIejlzOEhzeStj?=
 =?utf-8?B?ZE9XeXVnTXpVamxIRGZwbjliUmJPTEVpTG1nMVNFMHJ6V2t3REoveFhjbVFI?=
 =?utf-8?B?UGlMWHd4RUtDWkQxKytPTFJib3JJaTF1VHBORXkwSm5IVEEzTTNNdXVpWCtW?=
 =?utf-8?B?WVFYUGVMaFA5M3pVbzAwQi8rUUk2U3lMdS9uUnV4ZEg3Y2ZvTjVERDlSSUx2?=
 =?utf-8?B?ZU1rVG03MGV1VEtJelVtNDQxak1ReERhVm5yZG1yRjF0d1lpMjNnQUl6U0Fa?=
 =?utf-8?B?c29iYmg4SGZ4bXQ5dGV4NlNVY0d3TDVJQkdhQ3ZnL3VESlhjcFdFdktaS1dR?=
 =?utf-8?B?L0c5cjg5SU5ZQ3ladXV2RjE2VmVxVWNEek52MkNOa1BoUzF3QWNlcHNhSUxY?=
 =?utf-8?B?M05FMjBTOVlPejdJb3J5ZzFydkkza3l3QW1MWFBYOENHbGhpSDgvT3Z4WlN0?=
 =?utf-8?B?ZFB4em1HSE04ejIzK1N3SFdIMTlYellGSFFVa2U3d1RFaFpvK1hNS1k2U202?=
 =?utf-8?B?WWtWSi9LdUlnYXJWc2NDZWtSbFFmWUxteE5ZaERPaUxEYVVxdHJuOFlmRVkr?=
 =?utf-8?B?SVZ5dTVQTEFCRHpKNE8wZWhqbGRaRzczNmIrSTJ2eHZQMUFvZy9EMUl3RTQr?=
 =?utf-8?Q?/gbYLJU6vNsxMkwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1371d98-7bfc-474b-1057-08de586875c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:11:21.0270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXzOgwfIYqojDmaiQBLEg7dCjXIJjIK0jsOLfgxaxtSCqXyGjGq6Pn+OZ3BRfLtVk+SQkDIgTLKKs4phIKssOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

On Mon, Jan 19, 2026 at 01:01:34PM +0100, Zbigniew Kempczyński wrote:
> On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > fence signaling instructions in the ring, as the largest portion of the
> > > > work (the batch buffer) is already done and fence signaling consists of
> > > > only a few instructions. If these instructions are preempted, the GuC
> > > > would need to perform a context switch just to signal the fence, which
> > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > preemption immediately after the BB start instruction and re-enabling it
> > > > after executing the fence signaling instructions.
> > > > 
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > >  
> > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > >  
> > > > +	/* Don't preempt fence signaling */
> > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > +
> > > >  	if (job->user_fence.used) {
> > > >  		i = emit_flush_dw(dw, i);
> > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > >  
> > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > >  
> > > > +	/* Don't preempt fence signaling */
> > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > +
> > > >  	if (job->user_fence.used) {
> > > >  		i = emit_flush_dw(dw, i);
> > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > >  
> > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > >  
> > > > +	/* Don't preempt fence signaling */
> > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > +
> > > 
> > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > wait for completion, pipe-control is necessary to wait on
> > > compute-walker).
> > > 
> > 
> > This asynchronous behavior may explain things. Is this a common use
> > case?
> 
> Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> not doing this relying on kmd.
> 

It would be good confirm this.

> > 
> > Also do you know if render engines have similar asynchronous behaviors
> > or is this specific to compute engines?
> 
> I don't know, I think Mesa folks may know the answer.
>

Let me ask around about this.
 
> > 
> > Lastly, the i915 disables preemption on both render / compute engines
> > immediately after the BB before emitting the pipe control. Is this async
> > behavior a new few feature in Xe2 parts which only the Xe driver
> > supports? This might explain why the i915 works and Xe does not.
> 
> Test exercises WMTP and this is supported starting at Xe2+. Probably
> what test is doing has a meaning in this case. First compute-walker
> submits kernel which loops until it will observe some memory write.
> Second job executes compute-walker with kernel which does some quick job.
> But first occupies all EU's so second job can be preempted only when
> preemption occurs and SIP will be executed. So if we disable preemption
> immediately we submit compute-walker I think we have no change to enter
> SIP and switch. Even if I add pipe-control to batch level according
> to Daniele comment job it is still preemptable and we move pipe-control
> location from kmd -> batch level..

Does the test work with a pipe control in the batch? That would be a
good data point - if let me know how I can change the test I can test
out too.

It is fine the batch preempts, we actually want that. Mid-batch
preemption is not what we are trying to prevent - we are trying to
prevent preemption of the fence signaling after the batch is done. As
long as we don't regress any user applications we can safely make this
change - it is fine to break IGTs which are not doing the right thing
wrt to batch programming.

Matt

> 
> --
> Zbigniew
> 
> > 
> > Matt
> > 
> > > May you try to put arb disable after emit_render_cache_flush?
> > > 
> > > --
> > > Zbigniew
> > > 
> > > >  	i = emit_render_cache_flush(job, dw, i);
> > > >  
> > > >  	if (job->user_fence.used)
> > > > -- 
> > > > 2.34.1
> > > > 
