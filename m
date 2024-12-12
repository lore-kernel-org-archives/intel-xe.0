Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153DAE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 18:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D702110E66C;
	Thu, 12 Dec 2024 18:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9Mcigzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E032710E66C
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 18:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734029991; x=1765565991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M/BIzHbiWHuX9y6H/ekAvSM9YSm8/PTaRpNG2J/5+jE=;
 b=J9McigzbhjerCkHqaiSo4V3PmguQ73VKIJ3o+8WjyvSFbJp0pmYQziy5
 FWFnGYbGwMotkm6zrQUFX3Mb5zwSManIHAAbl0KzfRgSdslPWfATNQISY
 E4SrgYnq8Q60UTRqt2H2+z2QvzDvPJXr1adE6QiqWTO5MAE12TTxmuosa
 L413DE+STY1hLDrl1MvcQTt380PwldAwN2ubTYbeQG2WypPbvgsNMGWfr
 fYFU6CwyWgASfMmyg9JY2xPjs365C91RmKr7J76pRTzLmiVhHErIPuYt8
 5N/WCjgMvvAcl/FvTfDZCwgtQxNrNNicbvBUEJko7asQONVssRfs7uRVU A==;
X-CSE-ConnectionGUID: DcBj7DWNTDCwn4Y0TGr/eA==
X-CSE-MsgGUID: qF7WPGYMQA+U+3xhGgILVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34385288"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34385288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 10:59:51 -0800
X-CSE-ConnectionGUID: ypSUFgD0TGevR/XYTY6i+A==
X-CSE-MsgGUID: 4D06xSK/RwyRsINfodAmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="127114001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 10:59:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 10:59:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 10:59:50 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 10:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPv0Cs/wXXQIQfwETuQXSfSp45+7uKOeSn2ibU9J4we8G7CT2920zF5hh2PSGVPR+LKXCpkvbv4aXFC+iQkMaJmCKNvnwBFEjmjfy5pz+yPz8yAhUYv96xp4VtopOFA4Ei10EWP/8wiT/cX76eD4ZJSK2JJXMdxpuEkv4pnPp1i/dq1isIJNhsOtcrc4gdkqVVHPAWfRoxt5U3CgZDmxqyoZ5dkoUP4eGJzkQxe1uNBVrSf/mBfhETouqpIohQUjiyTMzql8u0v65f7EaIaDL2iBf9rjPKYZAYRDnCQetUTmnqyZcNCE/dkDwGPFya986ZepqAPFaGvfpMdPhmvd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElUH7P6Uulso3X/sidv/XYyzeTtQMBk7m/KO8oC/qBU=;
 b=u5vip32r2qyzYJjuvwQVraH7AfH2FPLJlqkvV4ahYHolYBLZEAXEl3ribMO7ui3AZXwHZJITnQNXv/z/GZrT/2lT/683m7vvahX4tYMjCgIS67KLuQOTwHE7r0X1PhCIX/URFHdbmEob+VBuhQTRN7biiwy0UmEGZQH2/i0//2azrwDQG0FnJr0+TTDqvZaxgHnFvtdefkwW/amiQyapLGAjVXTGQC15ggaSOhvDRauXEyRGZUfotyAhst02TSjjBG28PTOYkYyBiQ/1ZRtzUBMvLwzoe9+WlrcAcZlTj7Hj9oBdrxonSv5FOQu/Zy72z7t9r98xkxNeKnvyEwAIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 18:59:47 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 18:59:47 +0000
Message-ID: <1cd79769-73cc-4b4b-bac6-c03e6aec0d69@intel.com>
Date: Thu, 12 Dec 2024 10:59:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
To: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@Lists.FreeDesktop.Org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-4-John.C.Harrison@Intel.com>
 <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0028.namprd21.prod.outlook.com
 (2603:10b6:302:1::41) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 02fe2a5b-9b24-4fbf-2409-08dd1adf25fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THlhZ1h1NGdZdFd6YzlMQ3UyRW54Skg3Mkd2amZ5YUZWTlNkeDF4YWltS2Qy?=
 =?utf-8?B?YmtlU1pOVE5IeVFsd1FwamY4RG5qMnRPTGZ3aGRnb3FhbnV4eWFqbG10a1dE?=
 =?utf-8?B?eUM5VG9zS1dBOG1oQlBOOE5sa3pSSmZGMXU4dXY2b1VYKzhtMWpqWmN4MHBR?=
 =?utf-8?B?Tm9WY2pvNHFES2x0Smc2ZFVrK05vcUJCdEtkVnNPQ0hIdmVMazRmZ0VhVys5?=
 =?utf-8?B?UmFCRTRGRVJNbXJwYllHZ0NNdnlLeGE4SGZNN2VmTm1ERkpNdC9jb3Q2UHZo?=
 =?utf-8?B?V0p0M1p2ekZDK0Q2ay8wMlpSNXBlSmszUGF6NzJZODQvbDdybk9uMm9oUjRG?=
 =?utf-8?B?SHFxd01qYkpUR2lpcDNsQ2dPVHd6Z2hLbWpZcm1DY3d3ZXBqTnovRWVJSHBZ?=
 =?utf-8?B?ckxNVWNCVUJjOUdDOHRtclBTaW5WK1NySnlNaEJWNmVlTFgzZ1NKTjd3azM1?=
 =?utf-8?B?UDlQMVBWT2FrQUlFSnRvQy9nR2w1WWZ3RXM3R05IM0hhVE1SRnNHQWJyMmUw?=
 =?utf-8?B?bnBMeStRWk5iSXZSSFZud3J6cmNhZThoZjhFTHJQa3NTN25EZkZaNXluY0Jz?=
 =?utf-8?B?ZFB0eEhBeFBQUXdSWUozcERYdW1OZ2VPVjBoaUZEYTltci9pYkVuWXNSY0pm?=
 =?utf-8?B?VThmMGFkdU8yTFNzUnR6RlF6cjRmSjAvbkdhd0J5OFVwZU9nREFVMUw2MnFW?=
 =?utf-8?B?V0xrNVk2SEh0L29rZ0Y1TWZibk13b3NVeldTbkpWdmR0dXRaZ2RwTEhiV255?=
 =?utf-8?B?czVPUisyRUpaRmt3VzFveDJaT1QxMmdFRGFFWE1HVGZFWEtqT0syc1NPUzd0?=
 =?utf-8?B?RTgzZlhYQ3kwOVIvL0FqUThWc0d6cDcrRmZCaG52VTk1aEhBWVBiQVgxY1o5?=
 =?utf-8?B?ZkdkNG05U3lQTG9RS1hrY3g0VFFjQ3FUaTluVnQrbmpObWxlMjUwZ1FYeEVP?=
 =?utf-8?B?RjJaSVFad0gvamZJUzJUN3luTUxNZ1JsVHBkQnRZMkxVRGEyZzRkTDVRL2V1?=
 =?utf-8?B?cmUwRW81ODhna0YxbjkwTjd5YktzS21GNGRzTWtaL2RXRmhZMFFlUnJzeTgx?=
 =?utf-8?B?RDdOVGNRQ090NktyVFpvWGt2dGp6a3hzMVh4cEFCNmJwQVJDY2JkZ3dienpE?=
 =?utf-8?B?OUhlSlRFdEsxZlBaQ3pYTVg5RzhlK2szWG5hU1ZuNjJyMVRUSkc2M2RzR0gz?=
 =?utf-8?B?TnZJbmhxREpNQUNEeHQzY254dG1TTnFidnVnVlI1Zi9qTlRSRm1KQklFQ1Vm?=
 =?utf-8?B?c2k5bTAxVyttS0dpU3N1U2Y3TmE4aHJ3NXZWNkdtNnVDUFl3bGhsbmZVQnBB?=
 =?utf-8?B?K055cWViNm5FMU5uVDBLZGVtT3RuaG1KRVBEeE9rMHMxTzlxSHlhQVFCTjBw?=
 =?utf-8?B?VGo1d3JsN2djVmEvWXY3bFdCandSelJ4eUtpdGZSM0psSEFnVEZLUUZyMExH?=
 =?utf-8?B?UkFOOWF5TksxTHorcGd0eGZ5MGJ2dy9iV3ZKbmJWdm1aSHpMNWZER3pWQTZn?=
 =?utf-8?B?ZkdNL0JqVWMrMEFBL0tVNy9YNFFjMVlmMHQ1REI5M1RmbGYxNmpVYzkxbDhE?=
 =?utf-8?B?cGUvTjFkczd2d0M3Z2FTMVkxT29NVElFcXB4QVU1TzlObVhZaUVsSHU5Mmhr?=
 =?utf-8?B?QjdidER4aWRxeUpVOVlqYS9UQUU4VWh4NW5HdFQrdGN2L3pUWkUxcUlvRWd4?=
 =?utf-8?B?VlU2YW5pWitVRTQxdU9VWmpMOUFIbnVVOGxXTUJyYVVHTWpibUNZQlZNd2Fl?=
 =?utf-8?B?Z2ttcDhDNVM2aGdIamFnV0Z6UDZONEI3eFVTOXdlcEtZT2tCT1lMSmxBZFl6?=
 =?utf-8?B?TUF5VmE5a1hXMkNteHp4Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Mva09sQmE3a1VyQVE1RjlBbGNialVNMndqMVpUTjNTL1dZZjBnSXpSQlNJ?=
 =?utf-8?B?Ym83cXUvS0QxaUliR3I5c3RqcndBMU9ja3hEQytqUElmajdWaXJvZDJjbXFu?=
 =?utf-8?B?S0p1bUpxQVQ0VHc5OUhZRlFjTGxIVzRtOHBqMEFZRlJQejRiL1R3YkpRUmZn?=
 =?utf-8?B?Y0xZdVBSdCszOGVVUW05cmVPb05qQ2dKZjdDNlM5NHlzaXM4UG9sMTJiYTJj?=
 =?utf-8?B?dVVmUE9xeUx6ckxFN2RoM3FONHZ3dGVSVlkrMVJJYVRnUkdFek1nWndQQkd5?=
 =?utf-8?B?aG4vOW5NUjFtREEyajRWcGxydXNRcEVGMk9adXIzelhuODMwazJ1QUhoWjRp?=
 =?utf-8?B?a1Y0TzZLQWZPZE8xUGlld25TR1l3OXkxZFFCWElMSnpIekt4ay9wbVV6a1Jy?=
 =?utf-8?B?M21ONlZMV0QvU292Nzl0RGJscTY1bXVpMjJWcDd2b3JyL0dUaGJLMC9DdTBa?=
 =?utf-8?B?ajcvZGR4SEo1dTg5Y0JUZk1pc0JhaXFvbDdabENYWUNFNGxJKzVWeVIzR2g3?=
 =?utf-8?B?bi9sN1VaUmNDRktsRWJFQWZyS29ZTU51U2hOc3pwZFV4d1dNeWtEUStGZVVP?=
 =?utf-8?B?NXA4b3djaUxpR1ZsRE5sNjFJNi92eXlac2ZpWU04NTlFVmpURU1aMkJXYWZY?=
 =?utf-8?B?U3JrbVNHalRDUVNlY1BRZmw0SERrYW1JUXlDMFZUUmtRdzFQSUVkanRBNVBF?=
 =?utf-8?B?U2lYVGQrd0V3QTlJYWw0S2c0cHVLb1JVY0JVejNvOHBZZUNFZHZrZzAzbWd1?=
 =?utf-8?B?TXZsR2swYktkbzl6MWtoUnFmaEZMMENZVXFQREc4WUFmZjRtcFZPMGMrY2tT?=
 =?utf-8?B?ZzRhZlhJYVpFTWtxdUhqZFBmd3ZzVEh4cEhlc0RsOEFXSUY4dnlTQWo1N1Z0?=
 =?utf-8?B?dUNoUUxTaWRnQVlmZEtZMm42ZHNHT2NoUm5YM0YwZXBXU2x4SVBHNG9DejZz?=
 =?utf-8?B?eGFoNkZQMU1ZNTdVK2tkOHNzK2QzaGFEc204MUNOVnBSSHJxeHRDVythK3Nt?=
 =?utf-8?B?Y3NocXBzYnFXb2UwT1J4R1FmWHpxZUxuazY3SVFsREdHdldLSjUwMFlwRDJP?=
 =?utf-8?B?ankwODFOR2pqc3lPU1l4ZFpPYWtNTDNuUjZNVW1EUEpuUU1VYVNUeGZqVVU0?=
 =?utf-8?B?YXdISGIwcVNmVnJDTjVmYVJkbWpiaGNFS0dFVVFMRk5FOS91M29MY2lYbHdn?=
 =?utf-8?B?SVdnNmRCN2h3eG93KzRsY0Y0bjk1TXAyZTdIT2lVZmZBQXVaSDNuWHRiY2h1?=
 =?utf-8?B?cExtUFBsaXkwUFhXb1ZCWnVOMUpvYUVlbzZDaHAydmtoSGlZSHpHZzh4Mm1X?=
 =?utf-8?B?SDNleFd3WjJFZ3FRRDBlWmZQa0FCSWU0VzZOUy9TYTlmM1RLTXF0ZWIzbngv?=
 =?utf-8?B?bjU4V3pybFVXU08waGRaSE9OOHhOMzEzWDN2OHVoNGxDVTE0dkE3eDJYNGxG?=
 =?utf-8?B?cHBWNVNBckxWN011NStKdXV1UzdTQ2pPYUVZcVdLRkUrNEE3RVh1emN1aDFW?=
 =?utf-8?B?QjZ3NzRpczJGU2lZTFpEVnczcm1WL1hpUGpkNktwN1JHS0ZSbnp0aG9ZeHBL?=
 =?utf-8?B?ak0zTTdnUFR6RlJXWlBMNlRxNlNTUHZVa1ZkY1JhZE9tY2Z2R2dQUHJYem15?=
 =?utf-8?B?aDBEVldHYVQ2VzR6bWZlWjU4UXRha1UwMG5keEo2NmI3S0lQeW9sakVxVEF0?=
 =?utf-8?B?Z2JZb0EzaGZpcTZmcUZyeDMzZmJzbE5NSUZ1aFhXWVo1aWZldkJUcnhRM291?=
 =?utf-8?B?RWhheFhlVlBiNlcyUmFQNUJNSWJ0M1VzOElaK2w2cVlqMkhGdFJQTjlTY0g5?=
 =?utf-8?B?TUVaalByQ213U084RFFTcFhJSXBNY0tDYTlSR2NRdkdsSys0ZldKd2h0Rzcv?=
 =?utf-8?B?NDVodVJxYjVoNTQxM3p0RDlsN0JnZjB3OVQ5a2dINUFqeTZwNUgzT3lxbVVo?=
 =?utf-8?B?Nml4dFpBK1I2US91ZVJLaUVaV2pEUGJJVkJyRWloWTYrNkNSSi9nVnpXUm04?=
 =?utf-8?B?ZFFsQ1V2QnV4RkF2MWc2Nm9yaUIwTFNhNGF6cERYL0dFdjJhMFB0MllKQnI1?=
 =?utf-8?B?cDN4UWdpZnZRZUlWek84UlBNV2drMUlidHpLcGgyZ1F3UVVPclJoZHJjbWtU?=
 =?utf-8?B?YXRKcE10aHJNZ1R2b0R2dzRnTXI4RXNvQ0xLOFlYMXpsa3djcTNXQW5jYXYz?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fe2a5b-9b24-4fbf-2409-08dd1adf25fa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 18:59:47.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHdOtEtAYmpvKFY0G5ScoVDF1ue05VqIjlQwqt17Jto+1lt3LjE5k7QwmQ5e/mkAf01kGKbB6dhuNN/DrQRCPQ0qmYWzP9e06ehNcpkwjcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 12/12/2024 10:17, Souza, Jose wrote:
> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The xe_guc_exec_queue_snapshot is not really a GuC internal thing and
>> is definitely not a GuC CT thing. So give it its own section heading.
>> The snapshot itself is really a capture of the submission backend's
>> internal state. Although all it currently prints out is the submission
>> contexts. So label it as 'Contexts'. If more general state is added
>> later then it could be change to 'Submission backend' or some such.
>>
>> Further, everything from the GuC CT section onwards is GT specific but
>> there was no indication of which GT it was related to (and that is
>> impossible to work out from the other fields that are given). So add a
>> GT section heading. Also include the tile id of the GT, because again
>> significant information.
>>
>> Lastly, drop a couple of unnecessary line feeds within sections.
>>
>> v2: Add GT section heading, add tile id to device section.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c       | 5 +++++
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 ++-
>>   drivers/gpu/drm/xe/xe_device.c            | 1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c        | 2 +-
>>   drivers/gpu/drm/xe/xe_hw_engine.c         | 1 -
>>   5 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index d23719d5c2a3..2690f1d1cde4 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -96,8 +96,13 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>   	drm_printf(&p, "Process: %s\n", ss->process_name);
>>   	xe_device_snapshot_print(xe, &p);
>>   
>> +	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>> +	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>> +
>>   	drm_puts(&p, "\n**** GuC CT ****\n");
>>   	xe_guc_ct_snapshot_print(ss->ct, &p);
>> +
>> +	drm_puts(&p, "\n**** Contexts ****\n");
>>   	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> This broke Mesa parser!
> It can't now parse the exec_queue context because it was expected to be on the '**** GuC CT ****' section.
Then the mesa parse needs to be updated. That was clearly a bug - exec 
queue contexts are absolutely not GuC CT data and should not be in the 
GuC CT section.

John.

>
>>   
>>   	drm_puts(&p, "\n**** Job ****\n");
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index 440d05d77a5a..3cc2f095fdfb 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -37,7 +37,8 @@ struct xe_devcoredump_snapshot {
>>   	/* GuC snapshots */
>>   	/** @ct: GuC CT snapshot */
>>   	struct xe_guc_ct_snapshot *ct;
>> -	/** @ge: Guc Engine snapshot */
>> +
>> +	/** @ge: GuC Submission Engine snapshot */
>>   	struct xe_guc_submit_exec_queue_snapshot *ge;
>>   
>>   	/** @hwe: HW Engine snapshot array */
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 09a7ad830e69..030cf703e970 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -961,6 +961,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>>   
>>   	for_each_gt(gt, xe, id) {
>>   		drm_printf(p, "GT id: %u\n", id);
>> +		drm_printf(p, "\tTile: %u\n", gt->tile->id);
>>   		drm_printf(p, "\tType: %s\n",
>>   			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
>>   		drm_printf(p, "\tIP ver: %u.%u.%u\n",
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 0ac4a19ec9cc..8690df699170 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2240,7 +2240,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>>   	if (!snapshot)
>>   		return;
>>   
>> -	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
>> +	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
>>   	drm_printf(p, "\tName: %s\n", snapshot->name);
>>   	drm_printf(p, "\tClass: %d\n", snapshot->class);
>>   	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index ea6d9ef7fab6..6c9c27304cdc 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -1084,7 +1084,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>>   	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>>   		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>>   			   snapshot->reg.rcu_mode);
>> -	drm_puts(p, "\n");
>>   }
>>   
>>   /**

