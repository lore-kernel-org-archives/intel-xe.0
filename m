Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F40606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQ5OWBfg;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=IPgPGLko
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5C210E1BC;
	Fri, 20 Nov 2026 07:25:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B1410E1BC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159530; x=1826695530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PcCoN0NBQn+36QsIESCQjPElmf+LWkU84qHOaeOfOr8=;
 b=HQ5OWBfgrZWekUwkK96fxSq0bTZKn0ZM07nVdZUDr8yuUEfC7ioXOCHO
 4lKO0ehffrNOso5PoTiZYsVl5eMNMFxnyIc0iKfD/NhBVHSVEv8o46QuC
 BEigAO7VC3gHBRtKLr2qEn7kloP+mDBUc8OYX58QbYNcL0wuFcskt//43
 5n+j/E6Zx3QjeRsFhbE5jLNCty/QwbEVSe1IWzvRjSwtZfKrWUEEehxiK
 LOF+FiLT84uDfuKr2Zv75uLCbdHDwy1iCSiKg92jHQXFVQAP2xioBPvCQ
 ZP7HOGzE01fRURFwXgTyuVuSNZ/ihpCcET0W2N/Fvsvvs+rxI9DfJ3vui A==;
X-CSE-ConnectionGUID: qkY8q2A7Ti6i6G0iNc9C6A==
X-CSE-MsgGUID: epRGuV5CRAClDXXYMGygiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4073944"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4073944"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:25:28 -0800
X-CSE-ConnectionGUID: euNMT1jGS3aTFHjtnCWCjw==
X-CSE-MsgGUID: VJ9nX8B7QQqM3+KI0Voxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="12479063"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:25:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:25:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:25:28 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:25:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUVz+GA1LQx7mXpX2NBByHIYRG5TnWYlShg4yu7NeVpMTedwPuDf5OvUuFRoaznL3RGMVdv68r2LWIHzCKUpgJCEg4bf0qaCoPjeR9xBh9vIRCmA89fqh0OhdwIGdL9RUO24R7wla6NtYRGp5+9R9sl5NsbUTgK3GkrKWgBUqujviX45vSy4gCtf3tLKI42gRkgAzARaxnPuAVgs/3kbmaXdG/eQYnjCi7jPRaBlYEe8R4Os3mhujq7e7ZAhU425i1HPsjXUKn/3/jOMPlaKi0AU5MFGflg0OLkKUT1N98M07B1aIK8y9naFxlPpyg86Db+R2UP9yInDhLBFsyRL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtwFzjGEibCiSjMNLA02U35XWFjvGtzAeBU9HKfKZ5c=;
 b=B4e6upHjmXTO4xgOwgT3gOHdEttVvG0e0LoifOZUEsrxF1htqTXYFdUaMiqlde1D6GYSe0WwKkIp8OddL9Rwmw1BlkEXDg5v788C/y76bL35+bAOZexJEO7fO5Ded6sDAb4NlUdPXPXCS5dlpTwHnHnWDLAZUzMThToyVnzykRm+UEgmn5A3bskbe4pUNk0swnGdShv4gfohgH/XkKfkgH8F6VYTSCkktJ8ReixyV8JNltKvcohhr9m5kUs70FuX90sWkE46Z3I8hzYWa8VzHDb41CJEWWPv05m+OAhKd5p/rPVd+wt8cET9Boh9BRTJQXb3DXWmpSC6FSrsV4uk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtwFzjGEibCiSjMNLA02U35XWFjvGtzAeBU9HKfKZ5c=;
 b=IPgPGLkoCusLRwOl5Ab0sykshf1bh1cuBLrmMm8AjVaeNrIFEsIj224GVg0kX62+qD6qjIR/iI78l5d68lCCLgVmdqJ6k6l0oIyfau184ElxS4wRc5xOixnYbB/wBDomEbSRYj/6dOGOX081WC60AJIytb39yTxsnE50HlbxZKg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by MN7PR11MB170846.namprd11.prod.outlook.com (2603:10b6:208:5f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:25:25 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:25:25 +0000
Message-ID: <82c8bbc5-bdb3-44e5-bf3c-c1906e666016@intel.com>
Date: Fri, 20 Nov 2026 12:55:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] drm/xe/oa: Fence OA ioctls and mmap against device
 unplug and wedging
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-15-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261119002737.3899877-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0234.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::8) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|MN7PR11MB170846:EE_
X-MS-Office365-Filtering-Correlation-Id: 784d0110-d8a2-448b-4136-08df46d7719e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|3023799007|261022113327099003|5023799004|4143699003|11063799006|261022075727099003|261026140227099003|261022105027099003|261028144727099003|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: hAk2nO1XNGdfn4molFS2EFosJhmZIMpCoxaFLAeHgkum3MPuN330fiq18ylPhSp/QnLwbtB+3yQFU17pe3X0+JJ/yy6u0ZUo86QVjAQ7NayEmvwxahZPY/tphyoAYi1sm63BexxEfwMzPfK953CYJIsyjSP3yUokuh8d6prhnhtkmGljsydqKS1bTGq0lkYjHtypB80gvddbWDnAMdRp2E/ce0puYRSzhWgYS5vk90MBvcZGSM2nLsrz0oLSz/9MaKb+OHTPxYegNN/ptizC2wwpdrHwNfMG7quooh8PSEOuLpA8whDSecePgjX4rE2xy1eqa5j8ygjrR8WD2qyGS7uIPII4J/6o+wEfjuInXDjMS+5xe9P6iyvqjb3TDzavCNVK1Gnq9EOlzcEKjugnOq/5QT0zL/kIfXSbMWL611JoETagyW1hY2EMsEou64bp6D+qTTptOWEfNF/JB0eg3x6vT+p8zPBeAyVKhHA2yoqeGqRA5kERueewtsVe5YNy0OW4qaA1E3Tfi8GpST1x8eKamhBy3hi2gwO2h86oFSWve0ZayfjGORmF63Fp36tj5Bl9r0zEg7EadcIkZZpr+bEOv4+A14cNjTbrr+Yle9hO4+MtY1sUsFgB5AOszTICnlKDDLGBljRpi2qOOAYNxtTDDGpn4rWdCupLnJIybHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(261022113327099003)(5023799004)(4143699003)(11063799006)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUcyUG1HdkRHSTFGdVFIVEk1WlovMkVDWFZvdXZrNWhSaE5QWUlQdTZ1bit5?=
 =?utf-8?B?SlpRbHBmMGxHYWd2dnJSMmMrMExDb3laWGY4U0tjS1crRG9iMHZXejRSVEdX?=
 =?utf-8?B?MGp5YnRuT0RNZ3JPVW92cHl6TFVDTHZOd3lvMU5DTFRCcC81Vk5nWVZJNC90?=
 =?utf-8?B?T2dTWUd2S1Nmb2kyaWkzUnBDZXdJd1RGQzJ0TTJFVmlId245OGs4OXRPTFBC?=
 =?utf-8?B?S3FpYjgrcHhLZkZMcGhZRWpBcWV3dHZ2OVNHLzV1dVROY0p3M2tRdmdqb2NU?=
 =?utf-8?B?dFNiMnJ0bmxEQjFxcGozaU4yN25EeW1URFQ0ekhFY29sS2pPOFJQMFVlSklp?=
 =?utf-8?B?THhoLzZuemVJaTdKRFRDK0hubUNmMDhUdFE4V3lzYWhKVXlmVVRqQUNoaWl6?=
 =?utf-8?B?dHg0U21oQzZINTFmdkhxcWx3dUgzL0FJaEhqVVFhSG5rSFdmdXk1RklLeWFP?=
 =?utf-8?B?cTduTTkxODJ0SWRSc1FyR01saVBhMGsrdWdKNW9ONjhsKzFnVDduOG4xS05U?=
 =?utf-8?B?T0swYTZHM3NGSHFTZTRkYi9pK2tKT0psMEN5cTdsT29hNEN1TDEwanU2UTh1?=
 =?utf-8?B?K0tjbHV3bTZiNE03QTkxVE1yR2Zkb3VjT2Jya0phdUo5Y29tR0RDc1ZTMnVV?=
 =?utf-8?B?WVd2SEFnWGlNb2VmQ3NsaXJkbnplTS9sKzlRTmpNUXBNUFlDelJMRnpPUm9V?=
 =?utf-8?B?dHlHdEQxWGRsS3lrNy81WWpTSzNhYmYwZFAyV0pvdEd6QjlpQ1hHcnBDQVRC?=
 =?utf-8?B?TS9RaTZUQXM4YlZDRDBQMUliSytXNWd0Zk1aNm5MLzBjTXZ2NzNSczBrN0Mz?=
 =?utf-8?B?QWExM28rWm5uMUhvcWVHeHNHMnhta0orcklIRlZKOVgrZE84NFR1T0J2SC9H?=
 =?utf-8?B?MSs0QnZBbFFzQXJXaW5ObU9RYXNEbHVTY2ZldTZRbFdmUmlMK0pHYjF5RzFw?=
 =?utf-8?B?OFZtOEtoekN0WEZIUmxMdElKUnB3aGRFV2JJYjBmQndLOXVhT0xMa2dLdTlw?=
 =?utf-8?B?Y1JLbVdOdjE0UytOcysyT3p6Vks3MS9tbkxUSmJmRmRoT2JoL3F0WUp4R0xS?=
 =?utf-8?B?cit6Z3o4amsyVjNSR2tPNTBzbXFpTWFKc2VxelFwNGRJallzaWdpTXcxTkVE?=
 =?utf-8?B?NWd1VGNCWjRTQTZZdFVmUzdmQ2xNZXA3ZFZ1TXZpOFlVaFRGWVM4UWV5djRZ?=
 =?utf-8?B?TGNURDR0QklSdzBIblIvWjdaMVZDNzhvRG5XM0xHN1o0NzhycHZFVTRvcHpm?=
 =?utf-8?B?VGVrY1YyQ2EzbUhFbFJmNXVBWmNvMFJBMmxRVXZoVkI0M2hQOWZMTm13QWpo?=
 =?utf-8?B?WGV1c0ZMZjN1eGM1R1ltc0FPamw5R0x4V0kvNmViWk9mMjltLyttUCtIOGl4?=
 =?utf-8?B?YzFIWjNBaTZOM3dFdjUzQ2FZVkFEd1hIbWgzNUtRSCtQM1ZKUUxwSVZZUFEr?=
 =?utf-8?B?NUFpZURqbS9JUyt1NjhGVXZ4eGpQY3E4YnJndTRpVVkrRHJLZjFxeWltKy9u?=
 =?utf-8?B?dENyR2xpSUVJNk5BMUtJRGxxZFd5YjdHVGN5RExjdGk2V1c0RTNXL1c3Qnhs?=
 =?utf-8?B?TDFvL3dML0xLMHJHcWY0ZDZtOVVoSit1MWpnVUFNaHcwWUovL1k2d1BPOUpE?=
 =?utf-8?B?VXpqRHdwdUd3My9NK0ljSmhSbFFPbGcyQXZTbjBMTWhtc0RlYzJCMVBHSnUw?=
 =?utf-8?B?NFZtVS9aTGowd2ZPdEhab2xNWnhldnp4M0NSVXk5SldlQi9xTzBlc1QweXJE?=
 =?utf-8?B?NE5Ecm5jME8yT1hwb2hRVC9jT2FGVm9DUmhqeXRISXU1RUJuR1VVa0lCZDF1?=
 =?utf-8?B?OWcyWVZQd0E4VExlcVZ6QjFPMHEvYlVKZS9ka1BEZHR5MWw0L1EzdXBhbXpO?=
 =?utf-8?B?V2FSTnpMTHVhR1FUSE1jL3lrSHlkVFFDZ040OFExcFNpOCswSmNieWtQY3pR?=
 =?utf-8?B?S1VxaHRzSzA0a2NzdWVuWFB2L3o3Y2hYQjQ1YkFZQk1YbnBlM3FxT0VPS2hk?=
 =?utf-8?B?ckNOa0J5OFJiT1g1a0VGYkVmWmJHUGtrWWFrUlM4RzQ5MllLaVNoWWQ3MHVM?=
 =?utf-8?B?RERvQ2NwNkMyRmc2UHI4T1VxQWZZK0NucnY3Y3dLWmRnZUJVbm12Nm9iNWxm?=
 =?utf-8?B?OXdzZlNIV2NReEZ0UHg4QnlwWjg5a1lZQlZ6RUVpa0VxUm55L1pLbDVVdEky?=
 =?utf-8?B?ejFSVzRmdmRJeWVEV3liRysvN3hRL3FTVG9CTEh5MmRSMXlsOTlZZkVYcDBR?=
 =?utf-8?B?a0VDb1Y2NnE1L1RwSFdqWVYxdGtXOWUwNW1JME9GWWRkVVY4c0ExeVcrRGE3?=
 =?utf-8?B?YjJLazZhRWM2dmk0YjU0aW8wem1sNDE1ditPcTUvY2FwbFo2MUdFZz09?=
X-Exchange-RoutingPolicyChecked: wKGkU3v+CVWVZMxY4Bv9m+QP6uDmc+6r1CPTr9O2UJ7yuc2IGmJNHq+IVtWFl7Gz25LBVbuha3UUiILnrWRo2LKaxbdF8avOOh97IKZRwXi+sPknOkLvIzocx3Q0IgC1tIZF2YXJq0AEfX6j7mTt2MB3s80bZY2SJhhBtHuQfNK4RvzHOfK6/XRunjsyeMV4AUDJuQSQXVdbVKoqAWUvlq7FHNnZqsn8Rpy89gl7KRx6HYcGG+ixZooqhPoEHSbX6phmvSRyVtmU7stpQUljt5PBbeRP0aOLn/GhebuhbMeAWQxCRmU+GAA/4ormnSetvGEuxe6raAxUeS+FPbBz/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 784d0110-d8a2-448b-4136-08df46d7719e
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:25:24.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocjL3+X2kV/1WMUCaRM3LzxjqOUYc3VfEwwZzulEveLiQMAvxzwt97TJchNAate69dealKe9KA4AQ6Mupssv4Jqh/b/o6ppNawxGMMHqKzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB170846
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
> drm_ioctl() only checks for unplug on entry, so an OA ioctl that
> started before drm_dev_unplug() can still open a stream, or access
> oa->xe and the metrics idr, while the device is removed. The ioctls and
> the mmap of the OA stream fd don't go through drm_ioctl() at all, and
> neither through the wedged check of xe_drm_ioctl().
>
> Run the OA ioctls of the drm fd and the ioctls and mmap of the OA stream
> fd in a drm_dev_enter() section, so that they fail with -ENODEV once the
> device is unplugged, and drm_dev_unplug() waits for the ones in flight.
> Fail the stream fd ioctls with -ECANCELED on a wedged device, like
> xe_drm_ioctl() does.
>
> A config without output syncs waits synchronously for its batch, while
> holding stream_lock or gt_lock and now in a drm_dev_enter() section. If
> the batch waits on an input fence that never signals, or never completes
> on a wedged device, that would block drm_dev_unplug() or the stream
> teardown. Stop waiting once the device is unplugged or wedged, and fail
> the config.
>
> A stream fd can still outlive the device, the following patch handles
> that.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
> v8: Split out of "drm/xe/oa: Quiesce OA streams on driver unbind and PCI
>      reset", which carried these changes since v4
> ---
>   drivers/gpu/drm/xe/xe_oa.c          | 75 +++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_observation.c | 20 +++++++-
>   2 files changed, 78 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 1c2f57735e0d..72f173fb23cd 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -43,6 +43,7 @@
>   #include "xe_sriov.h"
>   #include "xe_sync.h"
>   #include "xe_wa.h"
> +#include "xe_wedge.h"
>   
>   #define DEFAULT_POLL_FREQUENCY_HZ 200
>   #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> @@ -1082,6 +1083,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>   	struct xe_oa_fence *ofence;
>   	int i, err, num_signal = 0;
>   	struct dma_fence *fence;
> +	int ret = 0;
>   
>   	ofence = kzalloc_obj(*ofence);
>   	if (!ofence) {
> @@ -1125,12 +1127,28 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>   	if (err == -ENOENT)
>   		xe_oa_config_cb(fence, &ofence->cb);
>   
> -	/* If nothing needs to be signaled we wait synchronously */
> +	/*
> +	 * If nothing needs to be signaled we wait synchronously unless the device
> +	 * is unplugged/wedged.
> +	 */
>   	if (!num_signal) {
> -		dma_fence_wait(&ofence->base, false);
> +		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10)) {
> +			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm)) {
> +				ret = -ENODEV;
> +				break;
> +			}
> +			if (xe_wedged(gt_to_xe(stream->gt))) {
> +				ret = -ECANCELED;
> +				break;
> +			}
> +		}
>   		dma_fence_put(&ofence->base);
>   	}
>   
> +	/* The callers clean up the syncs on error */
> +	if (ret)
> +		return ret;
> +
>   	/* Done with syncs */
>   	for (i = 0; i < stream->num_syncs; i++)
>   		xe_sync_entry_cleanup(&stream->syncs[i]);
> @@ -1722,11 +1740,20 @@ static long xe_oa_ioctl(struct file *file,
>   			unsigned long arg)
>   {
>   	struct xe_oa_stream *stream = file->private_data;
> -	long ret;
> +	struct xe_device *xe = gt_to_xe(stream->gt);
> +	long ret = -ECANCELED;
> +	int idx;
>   
> -	mutex_lock(&stream->stream_lock);
> -	ret = xe_oa_ioctl_locked(stream, cmd, arg);
> -	mutex_unlock(&stream->stream_lock);
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (!xe_wedged(xe)) {
> +		mutex_lock(&stream->stream_lock);
> +		ret = xe_oa_ioctl_locked(stream, cmd, arg);
> +		mutex_unlock(&stream->stream_lock);
> +	}
> +
> +	drm_dev_exit(idx);
>   
>   	return ret;
>   }
> @@ -1765,27 +1792,41 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>   static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   {
>   	struct xe_oa_stream *stream = file->private_data;
> +	struct xe_device *xe = gt_to_xe(stream->gt);
>   	int ret = xe_observation_paranoid_check();
> -	struct xe_bo *bo = stream->oa_buffer.bo;
> +	struct xe_bo *bo;
> +	int idx;
>   
>   	if (ret) {
> -		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
> +		drm_dbg(&xe->drm, "Insufficient privilege to map OA buffer\n");
>   		return ret;
>   	}
>   
> +	/*
> +	 * drm_dev_unplug() zaps the OA buffer mmaps and waits for this section to finish, so
> +	 * no mmap of the OA buffer can be set up after that. Can't use stream_lock here, it is
> +	 * held across user copies which fault on mmap_lock, held by the caller.
> +	 */
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
>   	/*
>   	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
>   	 * buffer's own range in the drm device's address_space below
>   	 */
>   	if (vma->vm_pgoff) {
> -		drm_dbg(&stream->oa->xe->drm, "Wrong mmap offset, must be 0\n");
> -		return -EINVAL;
> +		drm_dbg(&xe->drm, "Wrong mmap offset, must be 0\n");
> +		ret = -EINVAL;
> +		goto exit;
>   	}
>   
> +	bo = stream->oa_buffer.bo;
> +
>   	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>   	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
> -		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
> -		return -EINVAL;
> +		drm_dbg(&xe->drm, "Wrong mmap size, must be OA buffer size\n");
> +		ret = -EINVAL;
> +		goto exit;
>   	}
>   
>   	/*
> @@ -1793,15 +1834,19 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   	 * VM_MAYSHARE, don't copy the vma on fork
>   	 */
>   	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
> -		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
> -		return -EINVAL;
> +		drm_dbg(&xe->drm, "mmap must be read only\n");
> +		ret = -EINVAL;
> +		goto exit;
>   	}
>   	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
>   		     VM_MAYWRITE | VM_MAYEXEC);
>   
>   	vma->vm_pgoff = drm_vma_node_start(&bo->ttm.base.vma_node);
>   
> -	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> +	ret = drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
> +exit:
> +	drm_dev_exit(idx);
> +	return ret;
>   }
>   
>   static const struct file_operations xe_oa_fops = {
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 39e05b9131a7..9e23ade51dc1 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -7,6 +7,7 @@
>   #include <linux/perf_event.h>
>   #include <linux/sysctl.h>
>   
> +#include <drm/drm_drv.h>
>   #include <uapi/drm/xe_drm.h>
>   
>   #include "xe_eu_stall.h"
> @@ -35,8 +36,8 @@ int xe_observation_paranoid_check(void)
>   	return perf_allow_cpu();
>   }
>   
> -static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> -		       struct drm_file *file)
> +static int __xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> +			 struct drm_file *file)
>   {
>   	switch (arg->observation_op) {
>   	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
> @@ -50,6 +51,21 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
>   	}
>   }
>   
> +static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
> +		       struct drm_file *file)
> +{
> +	int idx, ret;
> +
> +	/* Hold off drm_dev_unplug() while the OA ioctls run */
> +	if (!drm_dev_enter(dev, &idx))
> +		return -ENODEV;
> +
> +	ret = __xe_oa_ioctl(dev, arg, file);
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> +
>   static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
>   			     struct drm_file *file)
>   {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

