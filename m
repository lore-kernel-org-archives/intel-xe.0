Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AADCCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4CE10E192;
	Tue,  7 Oct 2025 13:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbbCnTnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB2E10E192
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759844096; x=1791380096;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Qknr1RO4DRS74RYqFjjKpVuNyj0Tqtqw7BmQV5As4c8=;
 b=SbbCnTnI4flUnV60KAjP510WutJwE9om/M6BRxLzcAMBb6CeO/6ievsV
 t4pv301UKaL0auKMx7XIvctTUuOozFEViAaPEeuODHdh2kUdXhgZJhdiu
 sbeeIgvzCYu9Zn7m18Z2e+RXorrKr6pEX+1WbajeipurJPH6BJpvJ7jpY
 MzjHdLoAwgA329+VtGwBemJZY2RUUvK1Ff7nde7MlyOjYb8mlQ+gX3D3+
 hC9d2gVgcIlznqIGS2SPAOWZSquf4nqIhY7dkBbw9+Q09/L8jFyXWnBZ6
 awKDS6SPQ5Ew4qrhzcGZE1hWq/EYP+cSVGrcJMu2qYTQBs2HMr1HSvTy1 w==;
X-CSE-ConnectionGUID: rZV5T0A3TvOiO7oxypCA6w==
X-CSE-MsgGUID: 1U0PIc2sTICwOlJ4ARY1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73128991"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73128991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:34:56 -0700
X-CSE-ConnectionGUID: KEHLklvsQNKl/P2ksSs2dQ==
X-CSE-MsgGUID: 328D/hrFTm+vYb1sLvC1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179823379"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:34:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:34:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 06:34:55 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haBzf4bsigDG4L1517SVK+HjpEgG5AbCfSzIxhv2NQsFkfTndj+wSYv3wgb9XjPUbpIOjNi9hDzPdzSgGMPPa5Cpu3i3P3MSNA/WakyNIwgJqWXGVCt5WJKiO+NPV9GAcDtcaLRx0H5LI6qGJr+G09JkBqkxXQjYA82kKPuXh7np2KWF0GM8BkDlFrM2ntDz0wpstE+8THEDoOhefqPEb4EZyOUOKmfZotEPbRsALHZS2DmkO9Id8RFNswe0iFBgw4NusdehfSG7RAiSrvmrnF8SOf6T2kmzwlk3YvH70NB3RcyBhZ5YP4uXxL/kGWn+HfiQ/ESa6AANmLoeu/eovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdl15HapthWuZrl2jNnldoT54OWe2YSUenkAsyajheo=;
 b=eaabvyF7w6DVeNcKhXT0xGoGSfTNSFOEESyiH2hyo5F97CUPzoJ+vVxPH3ZSrWApktenPFl2z+G+FlMl7mxFdgfAFH+Z/q3Of20LxFNKa3FVZkRT+jw5XMlNtsx40zTtu+E3C90G2uFxlZpMi4FjybiIIxvi5QP33NvCY9fsE6ST4RoqZ9hhR+UAV650ZRlmuixsjkGzN+eVHblsZ8Jwvj7O3DEar4K6adleJsnZXOJTOZo4jR0lIJBSAbhDbC67/MWyVkgnOXd5fKJR7NUzJAZAxr7d9xndH4tBfQ4YLt9mHCoIGW1isas0AbU1bCIiO8sB/vTBN5D4lP3ttSk8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:34:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 13:34:49 +0000
Message-ID: <b0c98b5b-9d49-4180-89ee-e8f04e172fa3@intel.com>
Date: Tue, 7 Oct 2025 15:34:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/33] drm/xe: Add CTB_H2G_BUFFER_OFFSET define
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <20251007130505.2694829-23-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251007130505.2694829-23-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0022.eurprd05.prod.outlook.com
 (2603:10a6:803:1::35) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: d791d6c6-6705-4d2e-f78a-08de05a6498a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlRDdmtLakNRR2xwc1k1QmN5VTRvdk9GTnQ4SXI5bE5COWJrN3RjT21tSzZB?=
 =?utf-8?B?eEhpODl3bXN4eVNwTWRDWVBtWGl0Vmc0cGdvUEdjMEVZMCtUNUw1djg0ODRV?=
 =?utf-8?B?dC9GcW1VTTRONk9LUWllaUhrN3ZUYUxrblh1dUd1bWpMelMwdjRHMXdvTXo2?=
 =?utf-8?B?cUUrajk3Sm5BVTRXOU0valVKWUI5aVRHU2JWVU5TTTVRVkh2Ti96cHFTeEZ4?=
 =?utf-8?B?WnoyYkpnYW5DK1hVTUVzQmkxY3JZakNRcFFmQWJqOXpCeTNNTzYyeTZRaHNC?=
 =?utf-8?B?VVFlekZ2bnJGTlZtd0dqZHFvVC9tZjZaZlZSaUhnUHJJb29kRHhTZ1IwOXox?=
 =?utf-8?B?dTZyK2wvMGVDQkpBMnEvTHIxanJwYmtyOUNqc1RnbnQ4ZStBRkhXUU83MWZu?=
 =?utf-8?B?Y29XNlpUb2YxSDkzZE1yUlB3S2Mwc3k0eEc3YTZkUENTTTJpYTdoVk1GMTZh?=
 =?utf-8?B?MTBSNnhidWNsU051MnNwdGVqSGxSN3JRbHluR0R3TXliV0RWclc3YlN4bHhB?=
 =?utf-8?B?TWtBY09YWWUrQkQzaEQ3Z1M2bXdRdWRPSTZVbkxnOHVkbzRUQUdIMG5sQjQ5?=
 =?utf-8?B?d1pJYTVNb0YraHpFRFBzQ0dKMjVmQU5DRSszREJXdDh6Sm9kUEJYbmUxeEdT?=
 =?utf-8?B?N3pjU0ZTMHYwQUhPbm1CTFlqRitpUWplZ1RQanJPbFM1S3U0UndtVWFzL09F?=
 =?utf-8?B?MlkrbGJGYlpWR0pGMGk3QUR5Yjk4ZnlWTHFiNFYxbmFLZ0VZZjJiNko2REUv?=
 =?utf-8?B?QitvZHRJL2NHR0kxS1dyMlRua2ZGNExnWk5tV0daNW1pQS92VUp3N2hFNmg2?=
 =?utf-8?B?bVpaempCRCtpeDZ1THhZeVJ6b0MxSVkrRm9MYlpScnlZU3JvNy9iaG5rWCtE?=
 =?utf-8?B?VHpLUHdBb2ZqMk9KU05lbnpCVTU0STVUeDR1MHovUUlPTlQwclp6RnI4dlAr?=
 =?utf-8?B?Vk13cVhmREhyd001ZWpKbG5YaStCRWtMbWQ4eDB0U2taVitoaXgzSGhPNEk2?=
 =?utf-8?B?U2NSb1Q4R2ZGc1RqYUVaOWpJcDhnU3RqVHFrM1dUbGc2bkJQT0FRT2xwbmJi?=
 =?utf-8?B?MFlKQmJwVlZIemlpZGVwUDZGMEZOQzBlcnByWTRIUFRORDhJampXWDdDRVF3?=
 =?utf-8?B?UU5yd2FtUEluYmlhekNRK1J0K3RqeVRpU09uNEJsOFJXNVg1TSt2NTFGQ083?=
 =?utf-8?B?SytLSTRrK2ppNVhhZGRJMlNORG9FWTBtdGRvR2l5UXF0dHlrMEpDWGkvVzRL?=
 =?utf-8?B?aDZHeHdNemFCdTdxdEZPSCtUQmh2SmY1SmwrTFFuUDZ3K1c3V0ZVbENHR0JS?=
 =?utf-8?B?SURnM1VDZkVCN1hOUUhiWit5QUlEZmhsOTY3Z0dkbFhDUXhQSm5MQ3haUzBT?=
 =?utf-8?B?OHdxYklHekdTQlhmbXZpZnZqN1YrUmtjU2VhaDZ5aWg3bnh0WDFJN2pHMm0w?=
 =?utf-8?B?WjRGcjl4T1ppK2xna09sK3c0ZWlKS1d5bEV5a3Y0dUtCOG9SdEFONFZJcmM4?=
 =?utf-8?B?V1c1R01GVEtVQTdLMDYrRk93L0RhWG1ka0c5aVpyNHBDSDhRam9CL3M4YlpS?=
 =?utf-8?B?VnVTUWxwT05vQ2xZUTFPc01UR0VhSnNWQXhWUmpkeHZ4bytNWERRYWZ4WlVx?=
 =?utf-8?B?OVEzT01JWmJDQnJqVnVEelZHd3pVc0JBWkw5c2wwaGFHbFlhczFRR0w0Zmpq?=
 =?utf-8?B?SXljRHVCLzQ5ajlOSDVQSHhVdFRGQnVPa1hVaDEwWGk0ZDN6S2hqSmpJMmVq?=
 =?utf-8?B?SFVUTjRUY05TU3pTOU1FSzZnMkpDRy9wajBJUktNeVduZG1hR3RzNm1DQndV?=
 =?utf-8?B?SDNhbG95UVU4QUZtRit1bExJeGhuK0JTNlFoam8wY1l2NytpbTJWcjlwcy9o?=
 =?utf-8?B?ZmVsL2doZjZ1cG03Y2VsbmJkallER1RvVExHWXpJTjY0WGV2V25nb1FzMDVt?=
 =?utf-8?Q?h3DIfNgA5biV38Ftdfdsajy+EJuI0Znv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T05rMm5sNUZYU3MxRWZZeGRzZVEzdlBhRkdsLzdEaHdnS2xSM1JRdEQrd0lE?=
 =?utf-8?B?TkptdVZnbkROaSsyb3pmVUsyazNxcG1DdnVkUFNnQ0k4aUpQTHhNRVdrY3NR?=
 =?utf-8?B?VFp1MmJKOFp2dGp4ajU2Nmw0Qzk2TUdxSkxtODRQRmZ0MmgzWUl5ei94OHZo?=
 =?utf-8?B?VTZEUkJ5TFZhcEtBaEVzRTdSMWRzdGZkZ3BzR3dpVnczRFNvR1JMMFUxZGlo?=
 =?utf-8?B?NDV6M3dRWGE4My96YVdKZVpObFVNcnZzRnJRZjhjNnRTNVl4MFB2WlBaTEFL?=
 =?utf-8?B?WWY1eEticWhhNlRwZm01YnBmSkRrWU96dHc4OFpyV1lNS2dyeWdDMHB0S0xo?=
 =?utf-8?B?UzhnU0phd1MyaGJRZ3A2VEdYYzFHZkFTWEtUVmpSMk5HMmZBV0pXTWp2T0VY?=
 =?utf-8?B?aUdDR1UxL2hmdjljbGNSL2lXSTN2aTIyR2V2YUxwMmVaY0RlU0RVbitHOFlS?=
 =?utf-8?B?MjgvUDBjMkhiS0o4NU1ldnl5NjNGTFVGM0lUeUI4SmRmVklxTjZ0aWY4dDI3?=
 =?utf-8?B?Qm1aTGQ4Ujhiaml2ZWtIekUvOFo0U2psOG8wKzN5cjIrcm81dVBYWjdPcHdQ?=
 =?utf-8?B?dXN2Q0R5RVlSZlVodEtWY200WUtONDg0Q0JZN3FHSHR4SHlqNmQ3N05kZmM5?=
 =?utf-8?B?dE5mai9tNDNkbmRCYWI1bytMUlE4VjZ2d3F5Q1ltYnlpUXRDb3pCbytMUXI0?=
 =?utf-8?B?SkkzM1BBc1h2TjFpUTRUZHF2Ylo3UUpraU1JQm5QbFQ4di9MN2l2NEsvMVpO?=
 =?utf-8?B?VjdkM1Y4bXBtYUM5aWJxM3dZY0tnMG9wdEFrTk1SMEVBUTlrdktzQXlwbDZU?=
 =?utf-8?B?VDFSeWk1MU9pVlNiSTRoWURDczJSOGRSN1FXMXdDTEFRbUk5bzJaVWRoaExl?=
 =?utf-8?B?MWFJZzV0Q3pWcTczOHpRRHJ3b0JyRUk0SFdGNUdianpMUG4yY2hrZmVsbm9x?=
 =?utf-8?B?blk2c2hJMUljbWkvdFYxSVlaMWNuUnk2RTdObFRKeFNYcTAxL2dtQjV4ZHN5?=
 =?utf-8?B?WmhOaFIremJ4bzY3OTVGclI5VklocTd1NWFUakJsOG9rSDN0RUl6a1dHMG5h?=
 =?utf-8?B?STBvb3Bva1Uxc3NpVkw3a0Y2a3ZDU25weXNkK0JBZVNlRWQ3cmNMQ0hXQmln?=
 =?utf-8?B?K1ZFL0xLK0ZobXVqNGtkWWlBSHpZUEZiaVRWdmJCWWJQVER1U2JZcWx5RzhF?=
 =?utf-8?B?Nm1XZ0pTYlNzcmZmK1ZTSUt3emVxR1BzZkpiZEgyRnFGNmcyOXRDK3NObjdD?=
 =?utf-8?B?STJRNmFxcmtWQ25SUk5VZjdiZCtHelFsQTlxVFhESENhbk5EdHdJa0FCQTBr?=
 =?utf-8?B?d3RiTVU4WmlhU3VZL0V2RzJ2ZWE2cVpJUGNSRVdXRGlLaU83VmVYeUN0bEtG?=
 =?utf-8?B?QW5kNTQxNEljUTJrN21ZWHlTblBnZU5QdDZBMktqZzRWdjRUb1cydzlHcFlT?=
 =?utf-8?B?WDFWaW5rejN0MEpmdXFoQ3F6Y2dHWDlHYzFoVzkyUnpuNHh1RWppczVoMkdX?=
 =?utf-8?B?N1ZRNW93cm5vMXVldlV6cWIzaDg2VEpMUVdKV3VucHdNQUUycitZekhZOU81?=
 =?utf-8?B?Q1V0c1ZETnQxcmJkU3R4SjROR0JLWUowSyt0L2pvck1mN0NPQ0NKajdNVVZC?=
 =?utf-8?B?VFhHZXlzcEwwbzlTcWJhNTAyN1dFMHp4M3FGZnZrelNwVzNOT1JJbmhBSWlG?=
 =?utf-8?B?VjcrcU5PQmFvdHlpUXRvWGZnVlFSSXlUOUlFeHZWbXc3WVYwSGlLMWhKRTk1?=
 =?utf-8?B?MitIYWRDQnlUU0E1QitHeWJlVGZ3YUdwVitVSUhtbnhQSTk4blF6ZHpFZXd0?=
 =?utf-8?B?NUIyU0xOZlFjK2xKOTg2b3NTNHlmNlZtemJDVHZRN2RvR3Z0cEF4dG9tVmNj?=
 =?utf-8?B?Rk9iVnQybmZMUEtJY3RuWk03MXR0amNBS0ZNSzRabERnemNnSnVkWElLY1cv?=
 =?utf-8?B?Q0Vtd3RqeGFRUWQ5YUFhZlZ2TzlKaWw0SnY1Y0RNOWxOZEVXeG9wUnM2TkhR?=
 =?utf-8?B?NnJVb2tZYnZ3ODRiMUFaVXkrU1FzWnkyallQdFZ2STA2WE14eFp2VXIrS1Fu?=
 =?utf-8?B?ZWV5czNyUjhaTVhBcFRPckFFRENvRi9EcFhJT2FOYTdZQytISlNoUHBSMkZE?=
 =?utf-8?B?YkpCWlVRNDBBZzA0bDFHWVhTM3UzaGRmWTR3YzVmTEdTeWJPTHlHRmNXVFdV?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d791d6c6-6705-4d2e-f78a-08de05a6498a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:34:49.0793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh43ycC9YxAroW6KUOtRUd/WLXu/CYIj4MAlgNxXfXNC8qlO73N86GCrv3GmZ2LxsNgqRV5PPpg2LhMvSGvGGbZWUJH842FHko4Ccag0pvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6011
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



On 10/7/2025 3:04 PM, Matthew Brost wrote:
> Rather than open coding the H2G buffer offset as 'CTB_DESC_SIZE * 2' add
> CTB_H2G_BUFFER_OFFSET define.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fd2385635962..503cf5cb5d33 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -167,6 +167,7 @@ ct_to_xe(struct xe_guc_ct *ct)
>   */
>  
>  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> +#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)

maybe one day for completeness we should add remaining OFFSET macros

>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
> @@ -190,7 +191,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>  
>  static size_t guc_ct_size(void)
>  {
> -	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
>  		CTB_G2H_BUFFER_SIZE;

and convert this helper function to macro too

>  }
>  
> @@ -331,7 +332,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
>  	h2g->desc = *map;
>  	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>  
> -	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
> +	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
>  }
>  
>  static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> @@ -349,7 +350,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
>  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
>  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
>  
> -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
> +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
>  					    CTB_H2G_BUFFER_SIZE);
>  }
>  
> @@ -360,7 +361,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
>  	int err;
>  
>  	desc_addr = xe_bo_ggtt_addr(ct->bo);
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
>  	size = ct->ctbs.h2g.info.size * sizeof(u32);
>  
>  	err = xe_guc_self_cfg64(guc,
> @@ -387,7 +388,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
>  	int err;
>  
>  	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
> +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
>  		CTB_H2G_BUFFER_SIZE;
>  	size = ct->ctbs.g2h.info.size * sizeof(u32);
>  

but still looks good, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

