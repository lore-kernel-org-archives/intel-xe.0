Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D94CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 10:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6510E9E6;
	Thu,  4 Sep 2025 10:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWEE2GMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6034010E9E3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756982673; x=1788518673;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w3CiljGRzyFYcYW2DgKRyn3jTM3+jyZmn4T/Kbgw2Ls=;
 b=gWEE2GMgc9KSe30nA2py/TI6FPLU145WztDIh1JtGW/Fx4N+65eYxJVm
 e3tWa7gg3LyeDr2R9j7BZvj4BJP9jWHnd1Wb3LLnLfBebT7HcXnQtjnpG
 1Od6BIS6QE8JiAHvyWhGeLLjhJBL+sWY6D++41zO2iwSbjFa2A9j+Jx3K
 P+yguUEXjlek8204JBoriV3KRp3+PX8GflwJeSez+Oyj0r4BQ1mWjhjaZ
 Ghi8wAQn1dHWMWIJ+mRtQhz8HgWQ1YemCeYw97zs8uNXScEMHhcBC8/dx
 CZIhhzvqXZiQUomCDb39F52qp8c8ESSDaca1Dm9ZOvXkrL6/0cP4/LUZU Q==;
X-CSE-ConnectionGUID: 858GWmLAR4+g3QH6K7BCqQ==
X-CSE-MsgGUID: iJY8K8N7RZ6DHbq9iL50dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63145080"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63145080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 03:44:33 -0700
X-CSE-ConnectionGUID: BCVOshnMSXKdDmc/XPx5BQ==
X-CSE-MsgGUID: ElVCT7CPTFGJ96ex6kUwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="172313158"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 03:44:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 03:44:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 03:44:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 03:44:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kzr5B9dgEB+AjCpXTFJMjkU0K2u2VliGpY0SgYGZN/fRVXglx0Fn9tc3xg5JGXRg/lOb7IxTaQ3wqkTSLuVuEFXmURsm+011CnRDitM8WzcCml/r61mDBLsGXK9IhjA86CHUGXanLY6/t+NQLWpuZVzDxZfMwC/s2UGYI+sXRaht2apk0aAEBm1EYV+2LadoIdsFrrJF6KloI5A+ZYmU1HH/WkFO+TVR5wwBt+FLlpCMDXFmGE13ETQq/mIOo1YzsUJAZfP2fNIRqDgtNAesQcqwJQIXcqEKCqXxwSciRtusZcFnLZhMM04l/2HqIjwVKaEVbrlxHZ7mhrkqmLfDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97XuPPRTGvQhqM2MoOHBq7KFP2F0Mb3rJa8o9Y5HXdk=;
 b=wsTeh3yP/W681erPVxojNbcCLP3TUdEpTjSb5dOTKYu0ixIq9Euly8VTyFvt8ETHmFViF7NTd0hJK0QQk5yxPFsUg1zZErJFaPazhlBW9JDMmOwt9cA6o0LrE5CzoA1moy3vK83ySIwVUDyOCoeMILhVnJcuBzqA30+WtPxoocTf6tBMnS1PXaJZf5NGBAn97AfIoodiMI3KGe/UP8uRiX1XOEZ3KfcPAVX3X/bT4JhbfHc+kG//oeASBh/NXJ6GioQ4mFLb4TitwYJT5yQqF7tA290ygRAwlvDiXGCUlsPMQu0XdinK6CSiAJEmUj1geopJZC287R/jdPn6zNM8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 10:44:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 10:44:29 +0000
Message-ID: <28a410a4-1649-4de8-93c9-ba20f0a411d4@intel.com>
Date: Thu, 4 Sep 2025 12:44:27 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/debu?=
 =?UTF-8?Q?gfs=3A_Move_sa=5Finfo_from_gt_to_tile_directory?=
To: <intel-xe@lists.freedesktop.org>
References: <20250829201106.1263-1-michal.wajdeczko@intel.com>
 <175655832913.287034.8437782941398528646@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175655832913.287034.8437782941398528646@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0041.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9d8977-a83b-4014-dc63-08ddeba00643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHU5RnFsNUQyOFIwQ1JEbExuanV3REVBTlNsY2REcGdUdlZaNCtocks2bzA4?=
 =?utf-8?B?OElvaTVoclFlc0dJR0x6dWFQa0gyQVJodGJFeGNrcWk0NjAwWDRXRngzNFpC?=
 =?utf-8?B?V0NCMi9QQXVlbjNWZ2cxTmNISGxTb1pKdk1LTGpxelZZeG9pT3BaeUJEdHR4?=
 =?utf-8?B?cG02RlpaN3R0VUoyQ0x2NndrRU50dnMvTzAyQXJaWFY5d1ppN3UweHVDSi9w?=
 =?utf-8?B?MExhNGpjK0VlUysyLzJoVE81TW9hT0RscHc4YTNZcFBmS2VGVkhwdTZZTVZC?=
 =?utf-8?B?SXN0MVRGY2NueEVyN3dSRUYvVmdxbjM3dFJIcHJCcXk0N3hkM2hQWUF3dUdK?=
 =?utf-8?B?OWdYMGp4eHFCbEp4N0xZVWhxMVNqdGxpRXhHRlVoSWhMZkVjdWd1ZHo2UlY0?=
 =?utf-8?B?QVczb3M4V0NaWGNrajVSWkNiS3NNUVBGcG9QWVFkb25tZHhkbWFrdmJ4L2p3?=
 =?utf-8?B?ZllrQnR6UlQ3QlNSNHVIanU3MU9zM1dMNFZ1aGZNMjJ4bU1wK1JyNlFzZ2dn?=
 =?utf-8?B?YS91WHJPSnZvRWVjd2FIbDNWYzNxMEU5Rk9FcUdra1l6NnNpcW5XekozaGJx?=
 =?utf-8?B?WkhxcGtlSWNmd3ZRZkQ3U0loM3JvUVp4RXJnM3V6OXROUDJaSFY2ejBGTEhH?=
 =?utf-8?B?blQxOTEwZDhPMytZaUoycU5Yeno0cTZuc0U0TGg1bzdVbTQxdlErN1cyLzc4?=
 =?utf-8?B?RFlLZWVDT1E4VE5PWkdNOFpRR1RhOXA2NDNHUTh0VU15bUNBaTQvcklia2J0?=
 =?utf-8?B?WHZxZlRWcGd3VXJoTXR0ZHdJbUpLakExcE1rRXF5QUN0OHA4aFErUlV4Qklp?=
 =?utf-8?B?UXhsT0pPeWxoV0VnSWpRQnBTYVUzaFgxY1hRaGZzWTFIVkxBTGNYenJjMUl0?=
 =?utf-8?B?NGF4S0EybEhNSnB3SkI2QUNxWmF2VGdMM293Zyt0VXpSTUFycmZvUU1XSjRk?=
 =?utf-8?B?VDJ2Uyt5aEFJZ3lyNmkraGgyaThhZ2hNZ05RTDRiY0pGcnB4SDM0eUd6UC8y?=
 =?utf-8?B?YmhaM1p4dTBPTVNxRDA5THJ3b0JzMDk3K09oMjdlY2QzQXcweDltYVR4ODJx?=
 =?utf-8?B?bU5hRUVDNFNXbFlPaDhEU1VNUWI5M1hHT0hLSHZOd2d5V3FHUkhNdnFjZHY3?=
 =?utf-8?B?dFBxM0phdVZTOGUzUDdpdEh2L1QyMUhBMnFSNFVxdGY4QmR1SFNPb2tuMHRv?=
 =?utf-8?B?Yno4dW5qQnpEUm51VVZGVzdyVXZYR1VBdmRxdmwyclpOdGduc3dvTzdxUGU4?=
 =?utf-8?B?STZqTS9FL2pLZGdDUStUeDc0cVM1eWJHVDVTL1hHU1U4ODkxcFV4MFdtS0VI?=
 =?utf-8?B?M2htU2d5eHArVXJ6eit5U0JVeGhTdFgwSmJMcTV3cFpLelVpR05HV0NKdHJj?=
 =?utf-8?B?YWRQRDRCNndUTThtTnF1UVN1ZEtZV25ObTQ0TFlURGtqblZ4UXpTbWk5dnJi?=
 =?utf-8?B?UC9rWUVzNVV6cmQ3dTNheno0YzFUOUEvM3ZrWExXbS9Kbm1jRTAySUpaWU1R?=
 =?utf-8?B?Zm1nSW00VFBka1BBN1FvcnJWOGVRdU91cjlJTmpCQm1YSFg1U3dCSU4rNVVi?=
 =?utf-8?B?ZkQ1NVpGV3Z1dFNxVEZCQjV4dXZLbXdnak11YXg5MG9NR2EyblZSalN5YTBU?=
 =?utf-8?B?eFJxYzFDZWpDdnJFV2NWZ2o5T1ZLUysyeHVnVjM4b0Z2Q1grQS9OZkRTZ3I2?=
 =?utf-8?B?dnAxYzRUWFpjVE9xYm5GcThnZ2twS0xHZEJaUHFmT29WOWZzcmU0WFQvcE8x?=
 =?utf-8?B?SjVqQlBuMGo5TEI0WUJmRHRmK3dyNU14WERtdHhCTG5XT0N3VFUyd3RtZWR2?=
 =?utf-8?B?aUJoSzVBR0p0cE5zWkROak5jcW5wdFcyM1k4NUhuM2R6akRKZFUza25lWXBP?=
 =?utf-8?Q?loDCxg9fYU9Qr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpTUUxwbDlJTG14TXljTkk3bVpxTUYrREMwcjczTDdlNEh5N3VMLzhXZGo2?=
 =?utf-8?B?bkRhdG1LNDNOd3l1ZWxOaVdMeGE0cnh3WnRmZFVnYkR6S3poY1hzMVZUUU9w?=
 =?utf-8?B?Q2Z5VDFhdkRqUWdZUjFqYkVmSUY4YzgyVDlBS01BcklYQXJtMlA4QWR4VkYw?=
 =?utf-8?B?UFZaS1lwaVE4OFl6MDUwVlYyK2NCNTFaekxjanBqbzJBTi92NisxTmVxMVh2?=
 =?utf-8?B?QnFWSmVDa2pVY1A0UVBqcTI5cDBJbXF4UDdhZ3phZ2hVQ052cllDZk1MbVVJ?=
 =?utf-8?B?RFdmbGNyQlR6b2V6bXdyMnEwMTEyZ1ZuY012bEZGVTZZT2taOWNwOStnNHFZ?=
 =?utf-8?B?YlhGbmFLaUY1N0pKeDArVlJ6UTVWKzhVeklTR2FJZkdWSnhxd3pUS0tZVi9h?=
 =?utf-8?B?cllUT29sNDNIM1E5Vk5yS2NsNVZhWFdmOTZieWF2SzlvdllvcWhubkxsQjhY?=
 =?utf-8?B?WGMrZzI4K2VobWFuUUdPeGVpRi9MbVlyQ2YzSG1QbE1GSUVWUGgzVS8wNnEw?=
 =?utf-8?B?YnJPRFBZblU1aHBCajR0Q2I3VWlDNGIrcTZsaWMzRE9KaFhqc2lTVnpGdVJt?=
 =?utf-8?B?eW14d1U4OU1lNCsvY3puYit0dE81L01pQnBXK3Ird2NnWDZTSkhHNmRwTFNt?=
 =?utf-8?B?M0RtWHpaaTRVNTZLOFVNRm0xaDkvVjFlR2lmU2V3dklVVXhOdXZ3U2hwWGUz?=
 =?utf-8?B?SUFUNjl0WC9kWENQZ3FoR2lEaXE5dnRIZytoUTgxeW5wSURUTW43TDhQOE5v?=
 =?utf-8?B?b2FRQ1dRb0pod1VEOE9VVEIzUHUwaDlQVTFoYkFBTTVVOUs4eVlSRCt4WmpW?=
 =?utf-8?B?czFDaG1mVUlsSDNqM3VHOFhPR1J6bFVza01XMUM2VUtYR2xrWHZtMWtja1Nh?=
 =?utf-8?B?dTJ6cmRoWEllWmJxRENHdkIwdVVSQ1JGVi83S3VaN1pVajNSdXBPTHRlQXJn?=
 =?utf-8?B?NU1JMzRJZVB6OEJhQVR4Z0V0QVZsYXNYVnk4a2FXZ0xuTWcxclVZY0V5Q1FB?=
 =?utf-8?B?ckRzYkhnUEhLUVR3M3FiMEU1NW5hTDNmQXZ0TjE1Z2hoWkRqeWVBS0t6RHYv?=
 =?utf-8?B?MnBuVUUzNmYxUEVVdjdISzZIcU5NNlZMVlRrVmJDOXUxNk00NUwvL2JObWsx?=
 =?utf-8?B?THlLM3VleWhXaUxZVURicC9WekdWS1ZXanY4aFZDQWlxY0wwQjF6MUY0S2o5?=
 =?utf-8?B?VHhOQXRuUFRHeDIvZWtSZTJsM2FFMkgyVlVwdTBvWVliQWw0dndXV2pndlR0?=
 =?utf-8?B?eC9zdDgwbUo5c2EyeC95VVhQSFFiYXRndm13REF4Y0Y4V3NuZWw5Tnp3YXMx?=
 =?utf-8?B?bVN3QVM3MVRMcGZudXFNNlpybTJQTnArcmNLMXZFV3dDRVdacmNoUWJqRzdz?=
 =?utf-8?B?S1Z5ZzhmNDg2MXlHZi9Fd3ZtS3oxaFhYU2p5azVqbVB0QW9iZ2VyWmtqZ3c0?=
 =?utf-8?B?eEk4Q0Mwb0N5ZVArQTh3OFJ0MXVkQWVmYkhEUm11UW5TM0Q5SzE3SXJiRWZG?=
 =?utf-8?B?dlFGcmNOZGZ6NUlSRG5HSVRkdllvaXhVSGl4RWdKYk40ME9kYzRzTTZubkdp?=
 =?utf-8?B?R3JXUy9CUW9ZWkRraUo0SGlLemdjTCtSQnByaGg2QXc4SWoxaWdHa3VnekpE?=
 =?utf-8?B?REJGSHRHTGt2L21IWXFmNEpLRUlXejBiMFRuSU9CbGdmY1I5OFhaZWkxZkFR?=
 =?utf-8?B?TmpUUzYrVnZwc0lQU2ttd25ITHkvYjROWm9zdFI0RGp2cXVnNnpkcDdDTG9t?=
 =?utf-8?B?eUsveDZpdG5vUElUTk1NVkNxaitrbldGWmNWNXBQK1BEZGp4Unc4ZWI3Q0VM?=
 =?utf-8?B?WHcwM2lRN0lSUW12Z2g3WC9qVkJCWnFvWkx0NkVhYWxFWU92REVtbFFheCtO?=
 =?utf-8?B?dklWRmh1RkEzcHhvdHdhdzFuS1BUTERRWmNudkwwVDJMaUtBaEFzeGVRUC9h?=
 =?utf-8?B?alA4UElSOVN5N2E5aDM1N2FDcllnT0llQW91VjBHWHRhSEdaT3VXWHIrRjlG?=
 =?utf-8?B?Umw3Rmw5Sk5JcTVieW41NDVjUXNsSFpvdEtmL3JSL0xYU0l1SjNldDAyZHZy?=
 =?utf-8?B?RG1KL2FGV3ZGalNmeGUvZVZmUHVLeklsR3ZYS0FDZ2RoZ1NQUUl1NkxqaVNl?=
 =?utf-8?B?d2Z4eUpzR3NaUngwczBvQVZsVCswUytDODFVRDNDbTJtSXlsekpmQllCR0dj?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9d8977-a83b-4014-dc63-08ddeba00643
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 10:44:29.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZWKbvZB3v5qQaDsQ3QjY24ZvbwRfMXsXZo2xaqZNHXfJOjxhVfW5gY7Yugg01aKGRHYK4bBLVr7bCcd6GMFpTU5+TYiqDM/7mPCMAP1Pmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
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



On 8/30/2025 2:52 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/debugfs: Move sa_info from gt to tile directory
> *URL:*	https://patchwork.freedesktop.org/series/153736/ <https://patchwork.freedesktop.org/series/153736/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153736v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153736v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3642-94efba53a792987b3649b6370e69f772c2210412_FULL -> xe-pw-153736v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-153736v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-153736v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-153736v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

unrelated

> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset:
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3642-94efba53a792987b3649b6370e69f772c2210412/shard-lnl-3/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153736v1/shard-lnl-1/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-busy-nomemset.html>
> 
> 
(xe_exec_system_allocator:5934) xe/xe_ioctl-CRITICAL: Test assertion failure function xe_wait_ufence, file ../lib/xe/xe_ioctl.c:585:
(xe_exec_system_allocator:5934) xe/xe_ioctl-CRITICAL: Failed assertion: __xe_wait_ufence(fd, addr, value, exec_queue, &timeout) == 0
(xe_exec_system_allocator:5934) xe/xe_ioctl-CRITICAL: Last errno: 5, Input/output error
(xe_exec_system_allocator:5934) xe/xe_ioctl-CRITICAL: error: -5 != 0

and lot of

<6> [596.169151] xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=19
<7> [596.171498] xe 0000:00:02.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT1: Engine memory CAT error [33]: class=vecs, logical_mask: 0x1, guc_id=20
<6> [596.440572] xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=6
<7> [596.440596] xe 0000:00:02.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT1: Engine memory CAT error [33]: class=vcs, logical_mask: 0x1, guc_id=7
<6> [596.441810] xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=7

but those were seen also in the previous xe_exec_reset test


