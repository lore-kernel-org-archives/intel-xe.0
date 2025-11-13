Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B08CD6E4D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3942D10E056;
	Thu, 13 Nov 2025 13:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+TnciF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6509710E056
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763038833; x=1794574833;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=xiGROYpEcyrhYkoDNM2VnOUhNm2G/dk7IhvB/f8E4uM=;
 b=c+TnciF/uilRtYfFoyakgNk121ZYdj6RMGqFbMgC6eCAdoHPVarC5299
 XlIJOn6jSAUJI2DCwjRa5uZWaehdTQ17Dx3pmUXNhSRQI/4LlX1LqlnDk
 jOLFi1i3RjoGMmhPbjBoDxpa8ztPyU1Ym2wFrsAvCnZjrM4X+t4C+HZX6
 Rr1G1asEdHDnMUmBoAQ50hlS+GqA9FKTVF7zb0XFpSmGlLJkDwrQajOKJ
 CMjOeSdSbmeo7ZfUqtStohyKqDLDr//Q15ec4J2uU3CIRxO0Q0VhUP8cP
 0/g4WpHtrIPJJ1AtVT4Z2TdX7Tyf7NZDM7YDBVL60Bb7X7eUtbnpOoMEL A==;
X-CSE-ConnectionGUID: 8NT5L9glSNK4SkvC65l7vw==
X-CSE-MsgGUID: vfgVlrYiStmX1a13VjoEPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64124151"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64124151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:32 -0800
X-CSE-ConnectionGUID: BPfU2kiiS7+9i1CcbPakuw==
X-CSE-MsgGUID: zOR4LzIeSuq34Eaw10hUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193929815"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:00:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:00:31 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:00:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cq/LwmYOR4UeZw9lQpiTWchnikgp6hI0Df5mQC0z0nR/llzoOcP1taQeksfp5Wp4bwkos16WuM0zXkddJ+SuBz+TFCj5AAkzHnezMO8PLapbNv6N2KALbhosMC7MpCJrsNp0GfqZLTIHyXMD2k0ReKlOH0rhMGOBuGEmzABguQJ8GMQA+r8ECKkzOBtQvCT35A/DAEp8C0AKj8HpE3tFKv/muERJNBdOEAEORE4z0rZfewZ2tp8CaF2XpSe60D6SL2Ya9OGpTROYakpTswyuOvZ37RyIGSPzHbb/uXJdFriCVdUd1E0/yrxP9uIa04iVZNSb4ZF71GZiS+upzx7teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2Aka9cTWKTpGeNIQVV9PzlQxAFCapWPPfxCYDGZtSQ=;
 b=ErrctTzloENsbxhG18dro6LgYw4Lw2JO0Z0VkMFd4sXGjj+q8PRxB6C7BnVNU/vdkY1T9UFds4hnBH3s8lSpWGnmuIDaqa99AYvvBcSR9yL4ZsSUtav6emf/hlRLHsVLvBLMQ1soRnXyme61Rl0cwV+gmHCPZ1woAQz+ZYBhdynbKeHExmZkWvb8TShe6e0gWCTNJVjqu6ukRsAYWWKdYrC9TFGqYxpwwfvzvWJvJOegQPc+zqbShGXWj+7W/Xc3LSt42iMVs/y8tSWy1toHEhvzQsfFoahwa0GVE6FWcDEJpUvdAxDVd4voovyeGbTj2L7iCDy+N10GU6gGmWzpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4651.namprd11.prod.outlook.com (2603:10b6:303:2c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:00:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:00:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-41-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-41-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 09/30] drm/xe/guc_pc: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 10:00:11 -0300
Message-ID: <176303881117.3698.7643196452483021515@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: 80496382-94fc-4bf0-299a-08de22b49e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9jWE9oRzg4Uk1SU0g5Q01oaEo1OC9vZllsNlFUQmZtTnFtcWN6SThCQVA5?=
 =?utf-8?B?SEtDNjNoTzZidnlnbTNDUExDZ2s5R1BvOUM4dVgxMXFNVlN0cFMzK3NYSmdv?=
 =?utf-8?B?SVp5Q2p2RGcwRmdOUnFhR2s4dUNTYVpmQ2VCZHB3cmpWNDcyZ0pDRDVtV3Zk?=
 =?utf-8?B?N2JYNThXTWxyOW1nMkZFNEFGeVhLMVV5ZE10THhwb2hONzhlOEdWNjNNWDM0?=
 =?utf-8?B?SHBId0tPeXBSV21BWGZrc3VlL1c5VmJYNGtkSm1EdjBXVkFNS1JVZ1R3NDFx?=
 =?utf-8?B?LzRuYUpMWThIdkRsL0k4SUo2M2NLYTVORTM5bUVjSGZsRWg1dE10V3BFcUJI?=
 =?utf-8?B?cXB5TzVNOGZxUVdvSlVtLyt0OExZNXZhcFlsWlpIdzV6ZVhsa1l0M3ViVTVR?=
 =?utf-8?B?ZHNSTXpNK0JFQlZ5SDhPa3dwNHltZDdueEtxankzWTU2ZjIvb01JWDQ1TVVC?=
 =?utf-8?B?RkVVUnY1S0NmMS9uOEt4RDNrMk9iYkVQelVWQnJlUExGRWFucWYrQjVaQ2Jt?=
 =?utf-8?B?bkJZUHNuVHVIYVZVZ2xJb2h1TUN5Y0ZtdVZSVis0YVpxVHRWQ1Y2aEFSMnJQ?=
 =?utf-8?B?WEZ4cmY3Mi9KcWZ2MlIwR1Z4QnFKT2JqbGl2Vi9FK0RQRnAvbXc0STczRExM?=
 =?utf-8?B?enR2WmRLc2p2S2FKNjR6b2hCQ0cxTmJvTUxVV3FKbGFVaGlab29pbXEyMHZH?=
 =?utf-8?B?ZEhVUUQ5anBRSW9Yei9ZL2FBUEloMzR1NE10NEhlM29uNkF5eWRUT2tYdGtP?=
 =?utf-8?B?OHlHWDAzUUFxQ1dQTDhlZTFBOXU1KzhKYnB6VnVkeWc4Y056cExBeDRJZ0Vr?=
 =?utf-8?B?UndQcVZveXJNbzZMUjRaM0JZUEZSa0tNcjc4ZXBwWG1VU2lXS3FNUGQxbG1E?=
 =?utf-8?B?R0kwTkZJVjFwT01uQW9LVEtTZnZkY3lYTlJMNG9SZGgzOW1xRG5SUjk3NE9D?=
 =?utf-8?B?T1ZMdkxZOEVEZTYxQTFnbVdHYmduVW13R3FFSmFpNU9tZlN0VHFjN3RiUGdr?=
 =?utf-8?B?RjBMa2VNa1Y0cDMxWG85dFh1M2NaNjhTelUyL0ZGS2w5UDVzbkJ3MUpXNUVN?=
 =?utf-8?B?dVA2dkpJeTNmRGlmY3BUU05wdXBVSW1odmFHaVhWb3dwOXd5Y280RGx4R0xi?=
 =?utf-8?B?UkZwZ3BCNS82NlkraVlqem1OdGJoYk9wN2h0aEIxNmthQXhUSVc0a2Z2L3pT?=
 =?utf-8?B?aGR2aG94eCtST25mb2N4L01vaDJDblMyQk43dU9Nc1RZZTNRQ3BDaitUaFdq?=
 =?utf-8?B?Z1NxRnJSVHJQbjJsRWRSQWlWaWpOYlRBUi9tWjVkQlpIWFcySmpUM0ZOTjJo?=
 =?utf-8?B?Sm8zbFBSTlBob3p1VVp6VVZEUllBbU1KVDgycllSbE9mQk5mVmN1Qit3ODZC?=
 =?utf-8?B?L0hxaklmdWFjdXU0ci95eEVwcTNzNFNvVlhpc1RiNkp0TVZmdWlMMitwZTVz?=
 =?utf-8?B?OGttb3dBSG5keDk0TG1xNmRueWVtb2pnbW1EeUFURUN6THpHZUJUbzZKc2Zq?=
 =?utf-8?B?Szh4SGhFMlY5VHRWdE55M0R2cDJVa2Iwb3pWRlZ1dWtuNFcxVS9PVmJRWjNn?=
 =?utf-8?B?T0xkL0xzOUh0Y1JZVi85aDMrb2ZSOWJUVWp2U3lTY2dPRnl6L3lvdkNjZGFP?=
 =?utf-8?B?MndiblJiZjlqSFpHcUQ1cU9sd3JWWkc4S0xmT1BlbE5jZ2IyQnNCMlRLc0Ri?=
 =?utf-8?B?dldEVjB2THoxTk8zS2NpWG5MbDFKbFdaaXZpRG9xa2E4dnJQbjFwSDUwOE16?=
 =?utf-8?B?WklqclQ4L0dUSlNnZGdnUDFEVWc3L2FXYnZteDNmYlp3SHBMMlBzdDk1MUp4?=
 =?utf-8?B?MnhqRlRMMEdheTN2MTl6NHF1S0h4RHBZemNmZUxMRnZmeXB6VnFFZWpLcG0z?=
 =?utf-8?B?enYrRDluSXpTajMzeWlYOWwzeHN0dE13V0RkWWo3bEZOdkNMV0FHTGx4K0pO?=
 =?utf-8?Q?d3tSsMmzwxf9lnn71fAka2s3YFtYXywP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFVxeWQxeS9ReFJWZUVORGkyTkhaS2dvcVljdFducWd1QlJ5UW9pL0JNV3Vn?=
 =?utf-8?B?K0c0VXFXWlpuUU95SWJLREwxbXAvU2FXdUlaTVRCVGJMOG9jWXMvNlZweHpv?=
 =?utf-8?B?N0tTU3Uvb3BCWitXMitpYng2MSthbWdjUnlPMkw3dmNUL2IwRUd6b0FtTXFl?=
 =?utf-8?B?WlRnUS9xemt5Tm4rWVNDeThwdTdvanZWaWx1MmttckVhRXVwR09tK0diOXlv?=
 =?utf-8?B?cEZIYldJSnlyQWFlazJiVTNRNURJSmdSYzc5Z3NEaTFCU0ZCYy8zNWhXRUdo?=
 =?utf-8?B?VWxPdHpvUjlWb3l3enYvTEZzYUVSOUMzYVR4bE5yVktGWmFZV1hkdldMK0Y3?=
 =?utf-8?B?bys2bmtMcnE3MVhhNlVtUjBHUDJQemZKSVZJUDdUdHJZWWttNjE5RWVPWUxH?=
 =?utf-8?B?emJHblpzZTFvMEJJWlpGSXVTRVRlK2t6SWtFTnkwcGlrRit4UkVTdUlhbWtp?=
 =?utf-8?B?aFpZcEYyckFqaHhLY2RjYU50Uk15VkNzODVSZzI1Nys4K1VqazZXVHRjeW1L?=
 =?utf-8?B?bGtNeW94ZzZXbWZCVSswc0FrMlRZY0w3czV6L3VmNVR4MzV6cDRUR0Q2Mmps?=
 =?utf-8?B?cW1KaFA2djV0VXhXdnNFS1Ricmp4VnhleE1maGZTeHZFaHBjMUNNZlRGYzlV?=
 =?utf-8?B?d1NpSTVZY2NBOW1DNTYydzFKWmJxK1B6bVAwdk1DZUdnY2ZKcVhUbWU3QUt2?=
 =?utf-8?B?ak9Pd0tpN1Ntc05ENGNUc1JWNGE3ZFRCTjczNjdpaHJLY2RDOFRVamF3ZGsx?=
 =?utf-8?B?NzVKTmRpeVpBY21nQ1AxNTRtVmxxK21UenFabjZ0ajZxczhvbnJ4VWgzaUtF?=
 =?utf-8?B?QldyWXJ2Y1NrVFVLLzFrZFR1d2tML2JQS3ZiVUNMMThJZE5xNEdNSHZtOVJ3?=
 =?utf-8?B?MWIxdDdDTnlTM2gwcnZsSERIMlNjWHFvQnpGWjN2WHErWmRhM1pYYnpiVkxU?=
 =?utf-8?B?OU1KK3lXbk9jRVhnSDltOHVLL1ZQZ2pRbldpaER1bW9ialZINFpaS1RnZkJi?=
 =?utf-8?B?TlFZMFgxcjFJT0hEWHZkZVF1d3puQkRLUHl6em1pVEdTVmxWVWFkblRHTlhV?=
 =?utf-8?B?TFBZVjB4aTEvVkRqKzZ2b1V1OW5SQXNZV0tHUEtrMU1QN0dud1VySm5hNVVU?=
 =?utf-8?B?M2kxZ1BpSENJQVFUOTRPVzZGS1dUZitaOFFoQUJtVVBCS2FlRGQ4eHFkRnEx?=
 =?utf-8?B?Y2pPSzluQ0xuQWVOV3ZpZUNaUzBSUVVzM3lZRTE3ZFJaV1BCWVZNWlZGdTM5?=
 =?utf-8?B?WTRJNXEyNlo2Zm9tRFJOUERSbWNxcUZYenZTOG9KNnRUUWJvUnplWGpDMzR4?=
 =?utf-8?B?ZmZEcWVJVkxuYXhYTkhyekNlOTc4VFpLbytlb0JXTXJFOVFaMW5pNDhQN2Nx?=
 =?utf-8?B?bVFUQkZuWDF2WTl1eTNVaCtBd0pnRUx3MlRkYW5RbjJLclEwbWhiQ0pFb1cr?=
 =?utf-8?B?Qzl1WjNRbThxcUVTS1lOTmtoS3JwdG55eXg4Z1JiaXdjaXlCYXJiUnZtUjFR?=
 =?utf-8?B?YVRBcUVnV0pNRm1xeXhJWmtINnVpVWFBY2M3eUV3Uit4dkFLeW5ZREVJZjRp?=
 =?utf-8?B?bWJ3dVoxTWdmR0ZqVGZvcTc3R0xrQlM1SkxjUFl0L1RpaEQ5NnduWkc4SHJp?=
 =?utf-8?B?UDhMS2s1djcyM0ZnZ1BqT2IreW11d1pxZDJwQk1hMEFkQVRMWjBnYmtlT0Y3?=
 =?utf-8?B?WWZnaE5nZ2JaeERzZDYrVnZQSG1WK0NpNDgxMFlJVGNieDZNeWgvZWtaVUZ1?=
 =?utf-8?B?TXNXcUcwMFN2UHZaOURvVGg4MEVpNW55cGNwcCtuZDBkMk52RDE0ekQ2Z2Ft?=
 =?utf-8?B?bmJEUldTQjhQY0dFUkg3K20zZnZzYkxJMTBPQ0ZSWlZTcElEOFQ3dk5NVFVK?=
 =?utf-8?B?MUplaHJOU05BRmtUb2ZTbndxajhlOWVpU2lWOWJWN2ExaEROQmdMVmZhY2Fs?=
 =?utf-8?B?WjJoVDl5aGE4TWFDeXJwK1EvaDFUUGZjc3J6a1IwcDVnSFdiQ2NVSHBqekdK?=
 =?utf-8?B?NzlOQ1RUaTFlaVlQUDZnQ2VPRDhVem1MeVM4R291SFBPTjU1Y3RNc1lteUtk?=
 =?utf-8?B?VXdibVB1Z3JqYndGOEpVK1VLRzI1SWJNVENpSkRaL042c1kyTWRLeDYwbWJF?=
 =?utf-8?B?QWIzR3c5TGhXeTBrYis5SEpaNzY3WWswTXcwb3l0Z1JGQ1pFTDZWSUJYTHdl?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80496382-94fc-4bf0-299a-08de22b49e2f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:00:27.7846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iEHKoTeC2lcTfBuvzvnK2NQQBSSGmSTVyRCZf4ghnxknYs4OkRk7OzHyUScRHV1/gTnjZUQWBft6mwNJpHn1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4651
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

Quoting Matt Roper (2025-11-10 20:20:27-03:00)
>Use scope-based cleanup for forcewake and runtime PM in the GuC PC code.
>This allows us to eliminate to goto-based cleanup and simplifies some
>other functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc_pc.c | 62 ++++++++++------------------------
> 1 file changed, 17 insertions(+), 45 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc=
.c
>index ff22235857f8..b2e10359e019 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -511,21 +511,17 @@ u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
> int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
> {
>         struct xe_gt *gt =3D pc_to_gt(pc);
>-        unsigned int fw_ref;
>=20
>         /*
>          * GuC SLPC plays with cur freq request when GuCRC is enabled
>          * Block RC6 for a more reliable read.
>          */
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>                 return -ETIMEDOUT;
>-        }
>=20
>         *freq =3D get_cur_freq(gt);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return 0;
> }
>=20
>@@ -1085,13 +1081,8 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  */
> int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_m=
ode mode)
> {
>-        int ret;
>-
>-        xe_pm_runtime_get(pc_to_xe(pc));
>-        ret =3D pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode)=
;
>-        xe_pm_runtime_put(pc_to_xe(pc));
>-
>-        return ret;
>+        guard(xe_pm_runtime)(pc_to_xe(pc));
>+        return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> }
>=20
> /**
>@@ -1102,13 +1093,8 @@ int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc =
*pc, enum slpc_gucrc_mode mod
>  */
> int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> {
>-        int ret;
>-
>-        xe_pm_runtime_get(pc_to_xe(pc));
>-        ret =3D pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
>-        xe_pm_runtime_put(pc_to_xe(pc));
>-
>-        return ret;
>+        guard(xe_pm_runtime)(pc_to_xe(pc));
>+        return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> }
>=20
> static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>@@ -1198,7 +1184,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc=
, const char *buf)
>                 return -EINVAL;
>=20
>         guard(mutex)(&pc->freq_lock);
>-        xe_pm_runtime_get_noresume(pc_to_xe(pc));
>+        guard(xe_pm_runtime_noresume)(pc_to_xe(pc));
>=20
>         ret =3D pc_action_set_param(pc,
>                                   SLPC_PARAM_POWER_PROFILE,
>@@ -1209,8 +1195,6 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc=
, const char *buf)
>         else
>                 pc->power_profile =3D val;
>=20
>-        xe_pm_runtime_put(pc_to_xe(pc));
>-
>         return ret;
> }
>=20
>@@ -1223,17 +1207,14 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>         struct xe_device *xe =3D pc_to_xe(pc);
>         struct xe_gt *gt =3D pc_to_gt(pc);
>         u32 size =3D PAGE_ALIGN(sizeof(struct slpc_shared_data));
>-        unsigned int fw_ref;
>         ktime_t earlier;
>         int ret;
>=20
>         xe_gt_assert(gt, xe_device_uc_enabled(xe));
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
>                 return -ETIMEDOUT;
>-        }
>=20
>         if (xe->info.skip_guc_pc) {
>                 if (xe->info.platform !=3D XE_PVC)
>@@ -1241,9 +1222,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>=20
>                 /* Request max possible since dynamic freq mgmt is not en=
abled */
>                 pc_set_cur_freq(pc, UINT_MAX);
>-
>-                ret =3D 0;
>-                goto out;
>+                return 0;
>         }
>=20
>         xe_map_memset(xe, &pc->bo->vmap, 0, 0, size);
>@@ -1252,7 +1231,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>         earlier =3D ktime_get();
>         ret =3D pc_action_reset(pc);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>                               SLPC_RESET_TIMEOUT_MS)) {
>@@ -1263,8 +1242,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>                 if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
>                                       SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
>                         xe_gt_err(gt, "GuC PC Start failed: Dynamic GT fr=
equency control and GT sleep states are now disabled.\n");
>-                        ret =3D -EIO;
>-                        goto out;
>+                        return -EIO;
>                 }
>=20
>                 xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
>@@ -1273,21 +1251,20 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>=20
>         ret =3D pc_init_freqs(pc);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         ret =3D pc_set_mert_freq_cap(pc);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         if (xe->info.platform =3D=3D XE_PVC) {
>                 xe_guc_pc_gucrc_disable(pc);
>-                ret =3D 0;
>-                goto out;
>+                return 0;
>         }
>=20
>         ret =3D pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>         if (ret)
>-                goto out;
>+                return ret;
>=20
>         /* Enable SLPC Optimized Strategy for compute */
>         ret =3D pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUT=
E);
>@@ -1297,8 +1274,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>         if (unlikely(ret))
>                 xe_gt_err(gt, "Failed to set SLPC power profile: %pe\n", =
ERR_PTR(ret));
>=20
>-out:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         return ret;
> }
>=20
>@@ -1330,19 +1305,16 @@ static void xe_guc_pc_fini_hw(void *arg)
> {
>         struct xe_guc_pc *pc =3D arg;
>         struct xe_device *xe =3D pc_to_xe(pc);
>-        unsigned int fw_ref;
>=20
>         if (xe_device_wedged(xe))
>                 return;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE=
_ALL);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE=
_ALL);
>         xe_guc_pc_gucrc_disable(pc);
>         XE_WARN_ON(xe_guc_pc_stop(pc));
>=20
>         /* Bind requested freq to mert_freq_cap before unload */
>         pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>-
>-        xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
> }
>=20
> /**
>--=20
>2.51.1
>
