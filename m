Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E54D43359
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F9410E561;
	Thu, 11 Dec 2025 22:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LM+f+Ffv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E558410E561
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765493371; x=1797029371;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KxZyd+UjyEfaXNZtQcoor5460phfmFrAngrvWnS7/FM=;
 b=LM+f+FfvekMGF/QZJqTB/O5IAONnKI2ocT/Y+zA0wnZ67l/8VeHPqTNE
 FMEAmBw/PLw8Nw/zTAMyDB98UnSJ632TSZVB5y2e3RDbtZ/Aep7Q2/Nbf
 kfg6Cpqgv2x9orImXZ40KzGwLnhT85eJx4XuE4e4F2Zd+UhIeQ2ZIyU0v
 uUKwTLxq2zIGZq2vTxuHrKSfO8zSxgAe0J5qU02T0xXImA7Vtzpz4dwm9
 /xhSFg/ZqS1DmanlhoXVWX84mnkTA5AYKD9mrmFPR/IHzAeLjD+KY+QnL
 UxVHIlc1lNfB4Glo6eR+1Al78bGz8XFjrWz9vCvhIi1vBSfp98WnaMCPz A==;
X-CSE-ConnectionGUID: xUjPbP8mSXe19Xuz5RN+kQ==
X-CSE-MsgGUID: cqxvd3P7RwuTxJhtvG9Jqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70067403"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="70067403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:49:30 -0800
X-CSE-ConnectionGUID: QK/ZzXCBRDuzBWFvYZnt7Q==
X-CSE-MsgGUID: es/tpieAQ1Gn7ASQ1otwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196528024"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:49:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:49:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:49:29 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:49:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecy4WEW6a3WwSix4yN0b1Rthw2IA/tgO4bj+VY+pJp2zW+GjXBjJ1PwmLGhPyJ9zZMKR5K2NXw3GZRYoIOq3jCOc29odN8y4wSmhAq5VZJRM5hOAOXo3xgle/+4wgB6Ghfmw+O8VVlXvEXSvY3hwAKhp3gaSJhq8gHT3z8K3thiJa1l4IHDVVxeTjN/EXLOjnRsQtQzGCxwF7XJ6hsQb8/KiIeX0rsm2DMVeyebA2FahTpZTD3zalKkX79abcj08InndPjdyPdeLUlyjB1RpgqC+KYhiEsnqmHAwvANhJ8q84MzS2mGCgVIl1DIqCXxcmNNrK/8/q/cFJOaC7xV45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpm3OYvzVZxbuqehlGCc68/Dr4wAwONbnN+G6zVjlxc=;
 b=FRxbPoexB0U6DoCAeuU1OLXMaBKJYivW17KpRFtuBaJO9Mcgq0oat2pVQ59HKRDIN7/A4C3NbDl7a8wDbKX84Tl2XivQqYpH1deDy6ZlNm+k38KoCKbW8d5nlyXy+dMTEeLT+ifJZlNRJqjLzlIYSpGOllS/2vn6U3FWGJ9saDU9vGhom1PnsgsWsI37K1X3Zis0t0uSTDg1HpLC3Ns1xQVxDTioF/6S2kGdAkIPq9MaSvsR8p5eo2l8q84yYVlFXUaKhfvKEEYqegAYf1V5ZjME2SvbcGcs+6uxRD8KzFhtiko9q9Gt/7AQrONFOw1yfiQjMT3X04JEzuRfmoGNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 22:49:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 22:49:27 +0000
Message-ID: <fb989a8e-1367-4681-a501-57e7c2974513@intel.com>
Date: Thu, 11 Dec 2025 23:49:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] drm/xe/sriov: Add functions to set preempt
 timeouts for each group
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-25-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-25-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::34) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 841583cb-5dff-4d23-720d-08de390789bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3JKemxzdWJac3ZYaTJURnVZL25Fd29ORDIxOEt3cVRuei9CM095YnpHWnhU?=
 =?utf-8?B?U25aWEdHKzBRNHNlNGZWaG1iemFFclZjb3hOSkNPQnZqTWowVmpKaGFNZUdK?=
 =?utf-8?B?WWVsZDdXVTh4amxCWDVrbzNBdGdTUDRJVGdRUk5uMHdPcFFaaUs2citDTkVz?=
 =?utf-8?B?Z3QwL3NvZTZtc2VIUFFRR1NxZC8vdTcwOXdIVHBudXBWekNFZkdVaTFSMVFQ?=
 =?utf-8?B?MnY4SGtidnNYWFhVRklSRk8vb05nVjAxSGRBKytRRGt2VnRQM0M5V2NmeFA5?=
 =?utf-8?B?N1RmWlVtRjhMRWNrNWhSMlJBTFRyeFRJS3gyTkZDK3dhaHFqYS9xM2g2Rldq?=
 =?utf-8?B?OGtXR1ZwYUVjcG9RaFZ6WnZURmlXcWhsVllMWCtsNUNvZ3JubllIbTR3VmM3?=
 =?utf-8?B?S3RrN2hrNXNROU5DcytXK1NNVzZaOWlVcjRXeE5ITkVpT3p2TWlvbmpwYkZB?=
 =?utf-8?B?aGZZYWxycjdKelhVS3pLakU3UXdsUk5pU0tDWEs2ZEtaSmg4L2VWaGhSYmZZ?=
 =?utf-8?B?TFRveVZ3bEpHc3JUeVRmMEswdkU4b3lvaUs2OEk0NkpqSGxCZEgzVjlrRENi?=
 =?utf-8?B?aUtaR0RaVDhqcHlGOXlQRWJnWDJQVEpPQ1UvQVNrWHVDUjMzN050MmhpanhX?=
 =?utf-8?B?S0lXMVZnZ3Y0QjYySGdYUkdLcjZPektaT2ZOajhtRE5tZzFCaHBNOUhMQmxK?=
 =?utf-8?B?eWwyT3BwWS9KVUxDVjV6NkNFUXVSMlBxR3lPQmdTNmRNYUhmWi9PbHo2ME4y?=
 =?utf-8?B?UFd6QSt2d1g3MVljRi9ISDFjQlBkZW80RWNPUUc5SStXT3ZVSWhFczhsZlo4?=
 =?utf-8?B?c2FRNGV5SzdrMFpTQ0VZVDN0WS95SDVscmNWTzF6Qk9ueHNMblY2c2lQNFhK?=
 =?utf-8?B?N05aT3ErUXQyZUdVOUwyNVdIMXZvS0VDNmYxNTNSbUlpZ2IwRmdGbmgrZnFR?=
 =?utf-8?B?WG1MY2dMb21nNXFqei9CRWJPTjl5RGlyMUpWTEROU20ydS9UL0F1cVNmekkx?=
 =?utf-8?B?Q2M3S2JDSFRUUG5DVkdNUUgrRmdQdWFLWVdSa1VNZVZRZTdKbUhkNThxVnZj?=
 =?utf-8?B?dTFVcEI3cFJjb0hWWWdIT3hmekZGbHNEVC9jVjBvRVZxYnAxNFRGMVJrZ25I?=
 =?utf-8?B?TFJBY2syYUtHZTl6Mm9aOVdQUlVtVFZJeG9IVk5MelFWKzd1c3BBQVpwcm9B?=
 =?utf-8?B?c2VuOExlalNFTVFXYjdHR1ZObmd3U2tJcnN4dlRxVmZTeXM4NnZnT2E5Zkty?=
 =?utf-8?B?ZzN1NmhiV254NXY4Qm56ZmsvRFpwSDlzelNjTmE1M3JyOG5wNTBIelN3OGY3?=
 =?utf-8?B?S2I1dUNtRUpyNzVYV1ovNmV6QlFTd29XZThPeExYUlZZT3VmY01MOHVtMzZV?=
 =?utf-8?B?VFBpZVQ1cFg4ODNDNC9KUU4wRGk4ZXFONEI2R2xvVUtPek5DOE5sREQ5UjFY?=
 =?utf-8?B?YS8zbTZWakVTd0dYd01qTWphcVZtSURvUXFKaEpQMXlWM2NMb1gxWDFWRUts?=
 =?utf-8?B?a29lUHhYRDBzdUhnSiswMlJRMURtSmVUYzRyLzBONHRseEFvaHplQXFNN3F0?=
 =?utf-8?B?VXR2YUNMUEMrUjZQOEhvd1RsSWJLK2psd3drek9uQkVWa1lQTllCejdJR0ZL?=
 =?utf-8?B?NUZFWXZYWVI5QXV2U0tseVpCdERudGIrY0dYQWR6bHZZcEFzcVBqVGxMbDZ1?=
 =?utf-8?B?UFZwWjI4cU1HZ0RjQjFDNmJVaGJJcmJQU0FrQitwWlJyRmJjVUFCckVMUm4z?=
 =?utf-8?B?Q2VQaHJoT2ZHUGs3blVEck1GdTI4U0NrNkhDLzBJdFpESkNWSFF6cU5BOUgz?=
 =?utf-8?B?SDR4eWZWMWEzTUFyaUk1bWE4OVRmQm1nV3kvbnYyVnlDdGtkdDV2b0dtdk95?=
 =?utf-8?B?R1pHYStrVzIwN0Rta2UyNWRDUDZQMmZuSUYzRTZhK0tpa3ErNEtTSFFZeU9L?=
 =?utf-8?Q?HAUs/i0SAE5E41C+oSvFepzco6GIIkQV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05PbmNrYVJ4UUtlRjdRUVo5dzBzY0t6RXpPMDFFcnpBYStOcWt4elk2bWhz?=
 =?utf-8?B?SzMzdFJ6ZlVYK0drUyt2M3o1azVkVjJEdjZrYkdJWDJKd2ROTUdNVW04TWVi?=
 =?utf-8?B?dWUrMDNzSlFrSzgyMDRRalpZK0ZzbnhlWUQra21uSW0vVXpiSTA0TWxiRVVr?=
 =?utf-8?B?R0toR3Iwa2NNQndzSHJHTzlPc3BuNHVaM21ZWmhjYUJQSHIzZmRPdkpFK0xw?=
 =?utf-8?B?clpySExsbzlFOHF3ZXVBMHZzTlF2VkRaTGVWVGhKZy9EOHRJcUdEc05neklR?=
 =?utf-8?B?anVqLzNJZXJCTDZaTHgwUU1OWUg5Umx5NmxMVmpuRUE1a1NoMzVrQzAyMjVw?=
 =?utf-8?B?d0F3bVJYY1Y0aUhCTjM2S3pjenBnT3NoNWFad3NBUmpSRVRRUWVtM1BXUmVp?=
 =?utf-8?B?ajMwVzFyOEdzVWU4MjB5TkJwR0diR2gyZEwwWVp3eHNoYWV0NXYyZmFmRE5v?=
 =?utf-8?B?T3NRQWh6dkpKM3RXZktZTkRlTUZiUWlsYjlNekhiT3R3R1BOY0NabWFlTEFL?=
 =?utf-8?B?VW8wT2RrT2VUWlEwQS91dTRUYXcwWjV4UFpCUkNxRDVsR0JrWlVYcklSakI2?=
 =?utf-8?B?Ky9OWDNGeGNwR0JXMDlPMEpBNjdxOFFGU0dETFFoMVlwcEdLZDlUVXJiVXAx?=
 =?utf-8?B?UGF2UU5mVVR3TVdKd1QxVTQ3T0FuMjNQWlJkUFl4ajZvaGh1OWduakROMXlv?=
 =?utf-8?B?QUZmd0xlMjNzTFFkL2tob3FXdWY1U2ZtcXhVbXBRZlphQW5GKzlWOHFlSjNO?=
 =?utf-8?B?NjJEUndsTnZWalRadFVlRVhzOStBZXFBc3pxL3BZcWcvbHBNVnEzMXQySmk5?=
 =?utf-8?B?V3lTTDhibFpCNTFaRHQ5VlMvam1oT1R1YjhCcVIwUWpmNEZZU0FqQUJEVUln?=
 =?utf-8?B?T3UzNkFZU0o3cjBadm1Od2FEUGd0NTVNbjRuWWFvdUJoS2JoUEFWY1hpa0da?=
 =?utf-8?B?ZUJQVUkrZnZ0cVZUT1UxNTlma2lrRHhOcWJFeUdkZHJTRmk2a2xMSUFKTURY?=
 =?utf-8?B?ZGpPSGIvamh3VWZRTCtMbHNyN0Y4QTFiNmEzbUwvaDJRVzNRZHBMVHpudUcz?=
 =?utf-8?B?aUpUME53YXU1N1ZkUXd1QTZnRWpjU3V3MkI3UXpnRnJtRGhSU25vZEpWaFVo?=
 =?utf-8?B?Z0dJZGRYc0liN1NrbElhY1lsMVNsOWdBdmFvWThTbmNNN2lFTWVCTEZIYjQr?=
 =?utf-8?B?VWVwSUU2alRUZDc5MEVtUXR2a0JUaFRwSEc3ZFlnRW9JSzM3TGZncXpGUzJ4?=
 =?utf-8?B?OW1aQ1RySDV6MEIreTdKYmpmUDg1MHdxSEtEbllYZGtGeS8rbTMrOFl5R0pu?=
 =?utf-8?B?Ni9FVGdZS3FzS1dxT25wYWdtSGNPSys5ZnpNWXk4NTNGRXRFcy85Zm12UFhP?=
 =?utf-8?B?MzRWUjFFOEJ4REdmSURnWElNbkdad3l2SjZ5RXNDMlUxdWRBZTJDcWVNMFA0?=
 =?utf-8?B?b2FkeG1kMUZtL1FPU2hYN2xoZHRPSUUxVEgvTkU1b0V1L0M3bVA0dW1xMkhm?=
 =?utf-8?B?SVVKeThjd1c1dVNYL05ONllta29KT0s2OU5YNEY5ekpoN2Mvbjcvb091KzBL?=
 =?utf-8?B?Uk81L2VjYkRJZ1B4M09SZWk4eGgyZVlKOCtpWEl6bmVNaFlWdUZxdGxyd2dY?=
 =?utf-8?B?dTk1OE9QRzJiUlVwQ3lDcllxSW9FT1J2WVgxMjdIUmo2TEw3dHc3dFlPSWdG?=
 =?utf-8?B?RUN4d2cwZytmWENRQW5md09sSVg5SVUwR0dqRm5JNDZVNG5Ca2tYUG9KWFI1?=
 =?utf-8?B?R2w4bzRMUGFBa1RCQVhIZ1Q2c2lqZ3JTUzU2bVpTcTJSbTZ0RytId1h1VzNj?=
 =?utf-8?B?b3FDcjR6RjhjSmR1YS9tOHZwajVCZ3h1NGh5L1ovTTh5VUphaFpDSnBWemp3?=
 =?utf-8?B?VGtkRVlZMDJSZmdkTDBIVTV2WlBlRWR3SGF5eVcvajRKNjBTQlhKR1NUSnlI?=
 =?utf-8?B?QVd1U2FHVGQwMFNQVkVkUWtvR2IxK3VnUlEvTVNwYkMrbjlsMkMzeDlxeThX?=
 =?utf-8?B?c3owdnhxYzJybFFIV1lNUnVHTTdUdmtsR3d6c2RkNEdna0g0RDBDRUNiUlZw?=
 =?utf-8?B?dVB0cFhuK21VT2dHSkluS0hhMitwWGk5T0laRlN5QzNGeWpjUS8rMmthMHNK?=
 =?utf-8?B?a1ZrWUtRZ0RuK05KRmpEcm9mc1FqY25zOHpOZlhmODlXQktrKzY0UmFiR1g5?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 841583cb-5dff-4d23-720d-08de390789bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:49:27.4743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4Li8cWW2cBa6zMJebGyhV0MhfaOA2JHcKkS/Tu745FTQMhfxM19SwTG6PjxeD2bBiy4vK/Rhoi6/+P5JzeYKOzpYQ8FnLkQjxTQT8ZWDF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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

please,

	drm/xe/pf:

On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> The KLV to set the preemption timeout for each groups works the exact
> same way as the one for the exec quantums, so we add similar functions.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: drop the option of setting a single group, minor updates (Michal)
> v3: use GUC_MAX_SCHED_GROUPS to define the max KLV length
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      | 13 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 95 +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  5 ++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |  2 +
>  4 files changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 05dff9c74ae1..f8588c76c2cd 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -402,6 +402,16 @@ enum  {
>   *      the GuC always sets the EQ for all groups (even the non-enabled ones),
>   *      so if we provide fewer values than the max the GuC will use 0 for the
>   *      remaining groups.
> + *
> + * _`GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT' : 0x8A0F
> + *      This config sets the VFs-preemption-timeout for each scheduling group in
> + *      microseconds. The driver must provide an array of values, with each of
> + *      them matching the respective group index (first value goes to group 0,
> + *      second to group 1, etc). The setting of group values follows the same
> + *      behavior and rules as setting via GUC_KLV_VF_CFG_PREEMPT_TIMEOUT. Note
> + *      that the GuC always sets the EQ for all groups (even the non-enabled
> + *      ones), so if we provide fewer values than the max the GuC will use 0 for
> + *      the remaining groups.

nit: like in prev patch, maybe add from which FW this is avail

rest LGTM,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

