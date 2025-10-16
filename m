Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826B9CCD195
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 14:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CA410E9EC;
	Thu, 16 Oct 2025 14:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R459l7bh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C571210E9EC
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760623636; x=1792159636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NXg+kcnHfNIOYB1RtkNb4O02TYH9xcq4ObYZqdVo5ZI=;
 b=R459l7bh7wOo2021r1HuaUrB9eDqdn1b5GmCgfFG8/TWskinVzhIT6RP
 as45faZHsM2dtlE2aIvzJUDM1tdljebHnBCweLdEmFl4HCO6bJJa24gRZ
 sP9UVjxl8OjuzVBX5+t7WBot24V7FqVJIeyOkjkcvALxIv6lBHkMFqEKL
 mUZD30maZvAbRaDz1biGK5+YWDE0US/yrpFGuupR1pqJPoU2bK79dXe+G
 Fqy/dlV8O5TpY1xl/GKKwQImorg3E/oNzIOWldDU/NjNxmm8iaF2Fzm/B
 fuMQDmsApQiBpZPcuRAQxgx1AvRMOYuu7ElRds4dFJFCRMn3x8WxPzmIm A==;
X-CSE-ConnectionGUID: rgAKLhsnQIWRrXhvGZZAig==
X-CSE-MsgGUID: ynm0BYsKR5WRz1CuGWBx7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73928733"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73928733"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:07:15 -0700
X-CSE-ConnectionGUID: 65F676xbScOecKgnOKAO/w==
X-CSE-MsgGUID: x97HiiUOSAatHrIIIfx+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182139557"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:07:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:07:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 07:07:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJr6qDPQuGsoqeUqANROBI71ezZDIXbBt69Jt8zYZaJ0VR8xlYwPvI92Gfnxsxh/XImFDx82mZw3nU+ZWcM0tLKzAK9lqSYT/X5Cmqvu+YNb4K+P3fS1HEHnr3TxGIyHIQed1qEoP65ZCYrPDWRxW2I5exMa6VBpWbc7mbtR88N3qQpuxAk1AMZzvqs763D50gIqZJfUdkCRg+DXzi8gQFkcaOXSufF+sJ5DQC8a/QC7Ww/pmGs6CXucCtP7aAy5siLhtkJyD6f4wZHYh3d1IsBA/v4Paiv3jI9UxRgWghxiRFHQsSHy6jDku8cDwQuPNsuN7l3kXNPQXSlsCdQEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ne/Qz3vhWHiyn8MefNambAF31s2NJQD+SrF7O7RIVM=;
 b=Pr4MrHAOuThinsvHitPyLhmvmN+RBfA7HkokKs7jFjZpAl72AqPPP929O49KqM70fD92v05DJaUGKq7SoYnNfB5UCOMhfMa2evGLeeqoKiqu2KxWpPBRUeYJ4LtcdcbFZ852r+zsPPK5yuLXJVDxTOfkKfJApRGH8r2ww6lmGQnOPrEMtxzmPJ6Sv1B0E5+HIHWHqugpZ4U4fqM8tMfqbBpGTXt+F2it2R9cSNYGpghFiuGGpAH1CbdQMrnzQ/U3lBAaSiERCjmC1XEqECMi5Yn7cf9xT3shHNRpnFz41XJMRlHo8EW9H54tB1zty3n5MWVgDQjqPf47xpE8qvD6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 14:07:11 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 14:07:11 +0000
Date: Thu, 16 Oct 2025 19:37:04 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 22/23] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <aPD8CCUkpAAhFjS9@bvivekan-mobl1>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-22-bfb74f038215@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-22-bfb74f038215@intel.com>
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8bf67a-7cdf-44a7-9d04-08de0cbd4ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmlwRGFaVmgxalk4U3ZzNnNZTUhzTWIvTlJZTnhWZFlBZWdOMWc1bWIvNVN3?=
 =?utf-8?B?RW1sYjFKRkxFc2VRL0ZwaDloOHM5TkJuNFJXZ1VQRkRXUGdoNGhSemdPVjFh?=
 =?utf-8?B?Q3dLeXU5K0J4WHdENm5QM3BsaEdoRC9ETG5yRGZsQTliUXZPa0FUTitsYWMr?=
 =?utf-8?B?MDc0d1lNUWhLOWhtK0htaHQvTk96emNLU1cyc2FFWS9QK204Q0drZVFEcG9l?=
 =?utf-8?B?a1dDMUp6YnZiVzNNZ2xqclYvV2Q2SEh0YzdXMlNzL29nUG41TWJWeTRDNFdC?=
 =?utf-8?B?bWVYZzkxK2V4R25FQkRFcHN4Q0NHMXR5UGtRQmpHRjVMczA4MGtCc0N3Vk14?=
 =?utf-8?B?d3I5M29kNk5qKzJ2NXB3bVNndEFOcnFGNjV3MkxqSytVSkx2V2J0RkdrL0VP?=
 =?utf-8?B?RVFZelk1enFPSEd4SmR1ZHRaSXFIYTNZbDdVOE1qNG5tVVpmdFZXY1lGVFkx?=
 =?utf-8?B?Sk0zbm5CNmh6UzVZZytHKzdpdnVXTmhaZ1haamNiNUF4LzV2MzduVGJxclMv?=
 =?utf-8?B?SW9zUWJFK2FQWm91THFoRmpoYkRlTTdDVEpNcjRlUkluM1YxQlMvOEZUMGZp?=
 =?utf-8?B?ZVl1Z3BzNnpKV3cvSTVUVGRMNjBIYUtRV0FjZ0k4bUVXMWh1Y2JucFFZdTMy?=
 =?utf-8?B?MVQwZTBHbmVWVVo2a0c3bDYvUGFQZlZFYWltNkdsRCttV0RYa2hzakY2RlF2?=
 =?utf-8?B?UlNLSUc5alBtdXdGL2IvS2o3Wlh4NGlOMzE3MHFyOUdtOFhQTmFhUExpZ3dW?=
 =?utf-8?B?dDAvUExJbk1SOTZnUzNDVGd1a3JNdEg0bHdwNGpzaVhqakJtZ3c4bWJ6Qlkr?=
 =?utf-8?B?T2MrK2J6K2ZoejZFY3drMlhTUjc1MHB0cmI4dTJiRHM5WnFmYkpWNDAxUGEr?=
 =?utf-8?B?MWc5N2hka1Z3RC9oVTdrYjN2b21xUTZ6QWxBWkRnYXcrUk54RkI0QmZJUGdC?=
 =?utf-8?B?QWNKdEdqQjlkOVhTZVQya2dFSnNIRUpPT29NSElWY0JBYm0wbU5PU1BnSC9F?=
 =?utf-8?B?UmJkcElhWXpUR2VCdWdLQVp0blBNN1Z5MmJaamhXYktibFZKTEplSFFTMnZm?=
 =?utf-8?B?U3pjSCtRbXRTREpjV3dPSXpWZkUzTGh4aEtrV2s1aytVL1FLWm9iaU5lZ3M4?=
 =?utf-8?B?S01URk1TcnVpSVVpOVhzVXA0ODh0Y3IzbXhqWFc0YUptM0czTFZhMHhXTVVC?=
 =?utf-8?B?L2dkWGpUQTVBKzZHWXozakdiek13UkZWck0wZG0rZzJlRGhsWCtYM2JONHpp?=
 =?utf-8?B?UXNxc2d3UG1OKzU4K1JnS3kzczZUaFg0cFk4V3dYYnh6TXB3Q2YxcG5zZ1Ft?=
 =?utf-8?B?ZjNFa2VIZWVpaXd1VTltVkdHallFLy8zeFRrMFp6UmNRQU9qaVhUOVdPc3Fh?=
 =?utf-8?B?Z3FpSE0rNnI0c21ZZGs5dWhtVUkvVkdPakNHNDVnSHh1dnNVZjJHQkNxWTl5?=
 =?utf-8?B?VEJiNGoxc1NuQnJOK25BOENXSXhIWkk3S0l0Ykx4K21CdXlaeEJOQUlqamEx?=
 =?utf-8?B?T3AwYTBpMmtBSlZoZzJ1azFlS3ZZWGxhZHFCUENRejJYbHl4TUlvSHE2NUkr?=
 =?utf-8?B?NXpBS2R4SUxHcUZ5cFc3NjB3cWJRYk40TVZJcGtGS2pLNHE2ck1oNlRkbmg5?=
 =?utf-8?B?ZFNLZUpSVDFxZ0lPTHBmT1dYN0toeVNIRWxUTEhGbEwxSHB2c282UStvWCtP?=
 =?utf-8?B?LzhLWFBBMERrSVlVVk8xMW1PRDZSTkYvaTZHTjRTZUppcGZXUml5ckNvN0Vn?=
 =?utf-8?B?dEVGY1E4RHNBSEk4b1RZT0d2cFN6M0F1NmxDUTQzdmRyTi9pdlZsV1N0aHhS?=
 =?utf-8?B?bUU3U3JWQ1R4TDlNeUlCaGFlcDVENExKVzBLMXlVb1hVR1VobU0yOW1Ua2lk?=
 =?utf-8?B?alRJbWF6QUNDdEtLQnBzRE9TaVM5RjZhOS9lcUthbU9ZYVFDVGowZDloSDZG?=
 =?utf-8?Q?ua1TZ8b1iiPCMrCNrBtcNfC11e5fkPod?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ems5ckxvUXZlWGtUaXJROW1iT2JWaFJBc3V5dFZtSTVhc0VkMnkrY2Y5TjND?=
 =?utf-8?B?aHhIcXl3dFlLdSt6cFVPSlRmbEpFOC82c3d2OHN5aUVpMnNtbjN2MEZwdkVv?=
 =?utf-8?B?STYwUlR1cEIxT1dqZE9VRitCUUR1QVU0TUpOZ0QwbStiWGk1NS9QbCtYZVUw?=
 =?utf-8?B?NzBMc09PYURTaThQNzdSSmV0YS9lY3ViUDVsSHYxSUthN1Q0dWZkZk5OS2xS?=
 =?utf-8?B?TE5Dak5vdWhFRDBRM1RubG92eTJKTXRkeEZ1eFUzR1hPZ3lCYUVpOGc0MVV3?=
 =?utf-8?B?NmdsaGp0ZUJFY1dWT29KZG9HRTUrREovZ2liM3ptMmFubDRhUVgvaE5oQU1C?=
 =?utf-8?B?aTZIaU9NR3lURGZaVmpSZEx1Ym9qYXJON29pT0JjM1F3d2JaZDQxcjlNanlY?=
 =?utf-8?B?LzhEbkVETmZGV3J1czFVSCtxMUZTSzNUaWxsWjJvelV5SGIySUJvdlp3QTYy?=
 =?utf-8?B?S2ZYQ3QxaDVaZmpDUG1OVGJBUVNKcFd2VXVyejNGc1dXazhMY3VYK0dzazQy?=
 =?utf-8?B?ZGFFREluZ0pNNGpkelpobFVJRkVjMnVrbVNRckVMUjVaK1p3NzY1WllIUE5n?=
 =?utf-8?B?cElUanQ3Z1hzaE1XV3ptVitKbVlYWUtnZ29wb1ZyRHpLaHBMbFByTFNrOFhC?=
 =?utf-8?B?Q1hNZ2ZydjBzalo3MDlnNmJkQTloeGF0eEQ0YTBJRGp5Z0pSRkwzb2FRYVlw?=
 =?utf-8?B?SDB5NG5UeloyUFh1b0ZTZ1BDLzJ6UGlNRktJajl5NWxhU2lzMUJyQlJpRVpz?=
 =?utf-8?B?dWhMTlYxbG1nZ3EzdG5UZnpNWjM1bFlqYUZjak1jU25zNUxDWmpSN2FDdFBQ?=
 =?utf-8?B?K0lJd0krYkpQbEw4YXZTSlZKbVNBc3ZLT0N0SGZIQ1BnNDdsTUtCdURpcE8w?=
 =?utf-8?B?ajlkVlAzdWZxOUpqNVBnbUJZWDRoREZoVktIMHI2ZHptYVJScElsVnZ1ZmZn?=
 =?utf-8?B?K25NT1dsOTZxVjhBYUtJTnFIdzBIUmFxcFAyTjg1M3dMbFFKWm9oZEVnVVJs?=
 =?utf-8?B?d0RnUEZEWGU5N2o0QWtYZzFuOEZXdmhGc0lIaGwrRkplNW5hUGhiSkJwem9s?=
 =?utf-8?B?V2IzR2VadFlBdnZ6U2Q3dTN5NUJ5UkNsY1VUQ3I2RjhuTWxsbkl0eThTUyt1?=
 =?utf-8?B?QVdPQ3hYNmZWc0hFaG1MTDcxY2EwZUVnd0ZsdHRpUnIxT0xsbWw0THhGdHFV?=
 =?utf-8?B?ZnIrcUMrTDJKbjY2bDc1TTFtR21pcVZIVGVsb1B6OGxTOUZod1BZWFdUKzJN?=
 =?utf-8?B?WUE5S3NOWHlvN1FYZmUwRkRMdmg0dHgyZkNmeC93K05GbTYyQ2E5WGlPMFlr?=
 =?utf-8?B?RDVKR3c4REVZNWl2alhTQ0tCaGdNaHB6SENpcGtsdnY5SWR3TFpaT0JDMFQy?=
 =?utf-8?B?elJ6N3JZcEN4Ri9LRU00dTlZVGp0K09lbFRTak5xQkJvSHY0U1ozTFdEbmtn?=
 =?utf-8?B?aStGdGhoZWxNYzNWTW1LMEpEU0lNaTlJOC9IMm5WWWJEaDFqWVBmcWZZRk9Q?=
 =?utf-8?B?ZHAyMS84bEtXUTdGSkRPWEk4N1MybUlRd1FsR0pmYnBDSHo0SEVhYzBIbXZR?=
 =?utf-8?B?M3lYa0lxZGtsZCtLMjEzQzVWcnU2YjNVeSt3RlpJcWhweXMxWXV3Rlk3c21U?=
 =?utf-8?B?aWl4a1BsTUFhMCtoVndseSttZEtUckh2Mmdrck5Sa1dqdmlzSlVXdEhLWkJO?=
 =?utf-8?B?WTB5eFo1TkRjSFFVK2g5MFFXT0JsK2s2djRZTERwUnlUeHRCNWJkQ3FETUoy?=
 =?utf-8?B?MDZUNnlTcDMvSnFQUE9XSlhUajhuMm5Vd2xlREt0MEI1SGJ2RWFXMkQ1V0Uy?=
 =?utf-8?B?Rmp2R1YvU2J5dzJkMUx0VHMwLzh6b2ZrYzh2Vk1TN3RCV21odnhwalRLaWNv?=
 =?utf-8?B?djJmTHRVa24yVEhBTDJqZFlLaFRtSDNFNm1wcU5xRzBpeVU1VGs1aW5aa3RQ?=
 =?utf-8?B?WU5DWGVSeU94NW54dXZ6VWpPcjZEbXRldFRtYUJYRUJOOTVsa2NXMnRBaVJ0?=
 =?utf-8?B?Qk02LzVvb0xqbFFNNWlJZldwVFhKbER1NFVBdWN6d2VvZTZyYk9UeEZ3dkVU?=
 =?utf-8?B?VWIvS0xjUHNTbjI4UjQwaEFvNSt5ZythSWlLTXNHRzhxajJpYnZHeHc5Q0Ns?=
 =?utf-8?B?T3J2SUkrUG1IdVc0cVNTbFp6d2VGM21oanc0aFkzbVUxYitJQS9LcG9XWkJi?=
 =?utf-8?Q?bxaCuhLMFokC7bjc67f6vZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8bf67a-7cdf-44a7-9d04-08de0cbd4ccc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:07:11.3648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sh61j/8iZYvMl0GGCrpYb2R0+zFIZZ9LPPpT52FN86/GidWGrhZFM6kAgRo2KNxaZOXs/j5dJwX9T9p4Mibu+fjfdjCoM7Fpbx8mL8MYyCX9NZCrfVne+ajd8/f24w9L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

On 13.10.2025 20:24, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
> column than the Xe2/Xe3 tables since compression is not supported.
> There's also no "WT" entry (which we wouldn't have used on a platform
> without display anyway).
> 
> Bspec: 71582
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 6e48ff84ad0a0..7649b554942aa 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>  
> +/*
> + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
> + * option for compression.  Also note that the "L3" and "L4" register fields
> + * actually control L2 and L3 cache respectively on this platform.
> + */
> +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
> +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
> +
> +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
> +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
> +
> +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
> +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
> +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
> +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
> +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
> +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
> +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
> +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
> +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
> +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
> +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
> +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
> +	/* 11..22 are reserved; leave set to all 0's */
> +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
> +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
> +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
> +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
> +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
> +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
> +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
> +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
> +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
> +};
> +
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  {
>  	WARN_ON(pat_index >= xe->pat.n_entries);
> @@ -380,9 +415,68 @@ static const struct xe_pat_ops xe2_pat_ops = {
>  	.dump = xe2_dump,
>  };
>  
> +static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
> +	u32 pat;
> +	int i;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +			   !!(pat & XE2_NO_PROMOTE),
> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> +			   pat);
> +	}
> +
> +	/*
> +	 * Also print PTA_MODE, which describes how the hardware accesses
> +	 * PPGTT entries.
> +	 */
> +	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
> +
> +	drm_printf(p, "Page Table Access:\n");
> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> +		   !!(pat & XE2_NO_PROMOTE),
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> +		   pat);

For completeness, we can print the _PTA_ATS register also.
Outside that, patch LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
> +}
> +
> +static const struct xe_pat_ops xe3p_xpc_pat_ops = {
> +	.program_graphics = program_pat_mcr,
> +	.program_media = program_pat,
> +	.dump = xe3p_xpc_dump,
> +};
> +
>  void xe_pat_init_early(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> +	if (GRAPHICS_VERx100(xe) == 3511) {
> +		xe->pat.ops = &xe3p_xpc_pat_ops;
> +		xe->pat.table = xe3p_xpc_pat_table;
> +		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
> +		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
> +		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
> +		xe->pat.idx[XE_CACHE_WB] = 2;
> +	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>  		xe->pat.ops = &xe2_pat_ops;
>  		xe->pat.table = xe2_pat_table;
>  		xe->pat.pat_ats = &xe2_pat_ats;
> 
> -- 
> 2.51.0
> 
