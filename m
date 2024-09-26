Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F8BCDE009
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 13:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800BF10E309;
	Thu, 26 Sep 2024 13:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReijNKF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3FC10E309
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359156; x=1758895156;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E7S5Prt1xeFLsfpcfvW/Zoh/vk+1zvWiUqfhUsYmyzM=;
 b=ReijNKF9baO9PGd8l9/MTo/Q9uv+MtoxasGZ7j1bCHafYRz6bpqxe/bh
 QcRdSm+Ud4jOiNhQ0vgp46iWdmX2Qub7zWQgPKs//3o6J6XuvOrv6zBij
 IEs6k4sNXl1oG37lWWBd52qflw7ZhXUvPlF899+gS9OAAVTBCmjUPZfht
 gmuHGNH0zy48ZZ/3pqb40RPsqImjpq3ByCoFk7gk8SZSuvbaoPdyUUmCJ
 5F2kpwtFigPC+b84hTTMndEC01rK1wd14IhfJDIaIl9oHQI9ZqGTuuKzV
 DSb2arJllW2oCt4pCePI9gGkD5mYpN8tYvSgpDS+VJ7Z5Jwg48uwQAGMp A==;
X-CSE-ConnectionGUID: F2rpWCiyQzCE9cpKcJESew==
X-CSE-MsgGUID: uaVlTltmQJyd+7/8MfcKwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26576298"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26576298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:59:07 -0700
X-CSE-ConnectionGUID: IukVkg2PT1GbmR3BKFwnig==
X-CSE-MsgGUID: AoE9TCyKRMCCEvxWA18hlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76981355"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 06:59:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 06:59:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 06:59:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 06:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr/qJvQ+/3NA+hNjtsAMmO1tkA+ueDJHUIeBphCR/F/4Aa73RqvyjE0cwFeKdekP2pnN6/O/LcHJkrYde4i1yxM8Onf5XUt5IeOjWBnzPVlKNm2eHsnqljdgNg+e3pMRzK8Myxzarh0luzWvWsfoDL+evDiaSjaSl3HLgPNCbXt3Zmlb33rS19OnLiO9p0oDSM33gTMOVxIaQGteP2ZlywQJIvQuNn1zCWCR05cgSckk5UeEhG0ZSnylZoUd8Jz7/x2320JJWJ/GKuaKsXszACKde9taK5CvQyTrpRtnypdXvumBD38qOEGFh/pyDQXq7K6JQZWoGYryJa+zPmngzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTZhEmfGpOy0+qocMFKdu6jkzUUYqXzhy9Dz98A2r+w=;
 b=J4j3XP0jYix8/eiSXWx6a/iBVcmbmWjaCEigRlqXAqv3spVZDMaOrLqY2VdRb7l95178q1DGZgBzgqxM1gIRrZB3PXOqkvS8fsSZulo+2j9yUN5W/elu2AOdWnbYvJ/7kvzxYj7LkuuDKnLHb/e0btKtgFaY2RToASkjUOVZgj+cbyjadRSSbuHsLLjmwKk6E2vOV0G55orrMsoVMnzU7nDNwopMPs70uU09OJm9fIl3XbCH11ER1DkVDuepB5N8U2SDsfgwu4wLV9AgqJK6eNrcihXW3ZbP21DOXPsJVhsoQK4y9I3r6qHHlHZblBZrnTCLLcE4jUzjhFJC3QyXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 13:59:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 13:59:02 +0000
Message-ID: <caf78e62-4e45-43a0-a8fd-6f8164fd5e84@intel.com>
Date: Thu, 26 Sep 2024 09:58:58 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Add?=
 =?UTF-8?Q?_GuC_based_register_capture_for_error_capture_=28rev22=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240925012835.493842-1-zhanjun.dong@intel.com>
 <172733528493.1104749.12633883409297671318@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172733528493.1104749.12633883409297671318@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: d70964c9-5b47-4a94-acbf-08dcde336055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nk05SCtJQkd2cHBKa0pOUVNyeGIvMjNTYTloU1NvWUVlMjZuK2Rya00rQzhU?=
 =?utf-8?B?OEUyUm41TG16bXFTU1lZbnFMMjViNnhYR0E0V1VRMTFvMEhuWVYwcmo2WjRF?=
 =?utf-8?B?eVMyVkZmM21jMlpaYlNzSngzMCtHT0tIL3A1MmRHREFnN1dKdzdFOUdkSWt0?=
 =?utf-8?B?NG96WjJBVWJINXVDa3VVK1EwRnRCVE1NVVdpTVpSQlpUQjFVc0JsTm14SXZq?=
 =?utf-8?B?VDFRTVZzc0xQTUI1TURvS1Y5UFhUU2Vwd25Cc0VXTE81bVBTV0t6UHN1K0JT?=
 =?utf-8?B?M1k5dGxybENrNm04eTkwMHFzOW4zcHNzdG9YMXphL2VUVnZTd2FJc0ZrSUpU?=
 =?utf-8?B?RldaTFRnTTdZNUtxZlcvekxCYWhKOSt5RVVLWWs3NkYrQ3hwTWNhUjN4N2RY?=
 =?utf-8?B?M2Nid0Z5YXBPczhMWDFFK0xLT2QxOE0wWW1aSWx2eWZCQVIyM05VWTVXSldY?=
 =?utf-8?B?ZjhHQ3NpanZwWnZIZ3VKcUJUT0hqdXhSZk5MT2RmWEVwN3NhZ2pEdUgyUGs0?=
 =?utf-8?B?SXlKKzV6ek43Qlowby9WajNJeHFSVmpsWUx2SndrNUh2cmkwSTZKZUJvOWN3?=
 =?utf-8?B?SEFIVnlDR3UrRjFxTHFXRmdObXhZZDFnZlFCak90dEVVZEFaaXFzeHBldVJ3?=
 =?utf-8?B?REhSTmRBeVl0S242QkpNcTBIZXd4QTBXSUxCKzZHSzJpRHhrL3BTN0xZUjYw?=
 =?utf-8?B?a1QvUlk2UDNodWtmZVNIdG9tbnl2WXAydjZBeVBnTm1sSmQ0eHhZc1JBM01B?=
 =?utf-8?B?U1FhdmM5MkF0akpZbVc5NWxBUDVjWG1aSDZrZVBnSC95b0kxVmJ4SjBGaGxr?=
 =?utf-8?B?S0dYV3JXa3RRMTZwSFRkaXVDd25NSmhiK0FScjFxWHVKWGpNR0FRa1IzTDNk?=
 =?utf-8?B?MTNNeU14REJrSWRidnpUOG9zVWpRSmRyTnFRZDFobnplSHZUa2JjQzVDVmEr?=
 =?utf-8?B?UmIrOE1Qd2NQMGhlaW5RMzgvVGhEYlkzRXpZOWc5MWRDbEE5blJuQ0FvcjBx?=
 =?utf-8?B?UVFmR1BxaWkyaUVjR3dveEYyeGtrVWV5UGU3cThYZGNpUWhpMGhPMzFXL0V4?=
 =?utf-8?B?WkdmcW1QYWJRSkNuOWxOUnRJVmhQZThDZTZIMk1aWTZUT08rWTNYeFgrNmJt?=
 =?utf-8?B?MWpvUjh3eW4yTUJkZWNsRy9vRFpUbmVOWDZFMlFnMHoySSsxUDJxUCt6NGNh?=
 =?utf-8?B?ZEFCN2dJZEtIV1ZlVEQ2SkJJcnZyc2RJZnNYZ2FvQ3dOVENtM3Myd0g1RW5s?=
 =?utf-8?B?bk5hVHptWHpRNzlPRHVOWDR4Yy9FQ3NpTEMxOU51dkd2d0VISnhSNnpUOE5p?=
 =?utf-8?B?V1FGZ3N0eWZjdlVnOE1HL3dKeVk1N2p3TTg5NEkwdjF4bEZ0Qmtlb2dPNENO?=
 =?utf-8?B?a1lqL00reVo1N2RYTlZ3NUpITUUwNHZiSFdtWG9VZ3gyZzBDeWdhTXF6N25V?=
 =?utf-8?B?S084WXlETXRmUnFwTG83Z0hxd3ROVDM4VlpmdnQ2YWpjbGdxcXFGRExFQ2NT?=
 =?utf-8?B?Ky9iRkVyUGhwL3htSDd5TXhIczRMSVdFZXRKT0NzTFBlUVV6Umhhb05BaTVR?=
 =?utf-8?B?dEwxRFhxM2JzUkFHVVV0ZXFaMXJXTDRrcUpZQ2VpR0ZTRWY5NS8xY0xKVlVo?=
 =?utf-8?Q?oZp0LYuIT5iwzSvc+aCQ4pWrM47hlLZFr1zUILUs+eek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cityVUJNV0xHWTlTNDJ4dFlKV2pLNWEySmxBR3dzVTc3NVVsKzh3WUwwcktD?=
 =?utf-8?B?OWpMVVBqUVBPMno1Q1ZSYVc4eHcya0FoQ3RyY0NEcGpoK1Ewb01XKzFpNlRo?=
 =?utf-8?B?cEIyVHdTMmNqMFF3TlhFZm1weW9haTlxZStZSjIrQjh2NHRQRXczS0pLUlNF?=
 =?utf-8?B?K1gzZUJidUQrbUdFYUlkWjdORUxBYTRnaVJ4MXgvVWNSRTVIV3pra1Y0S05L?=
 =?utf-8?B?cHByZFlKdk1idi8vaFpTcC93MjBMeGdaT0d4aUQ3ZlVqRU9XdVhjVFFEV0R0?=
 =?utf-8?B?aEN0d1NlK1h5WUtmWWNUcW1UL1Zna0owdkxrZ1NoVDV2VjdNU093WC8rUDl2?=
 =?utf-8?B?SUVxaXpKcW1OaEUxL2JQN1lBSDFYcHk1c2lwd0htUjdPV2pwNXJKTGdLL3cx?=
 =?utf-8?B?RUIyNHVVdmdmRnJMUjIrUWxPd1FpTGlCNStXV1ExdlBMYnRRektzaUVNTGhI?=
 =?utf-8?B?YWI3U256bStzMDZTOHFTa05VUWxFMHBocURyQTNqS1U0ek1OdUswK1FKdzlQ?=
 =?utf-8?B?ZTV4d3ArdFZRUmxEMFlNMzZ1TDF3anErRXl0cnJiZVNsMThubVg1MmNITUdp?=
 =?utf-8?B?czYwcWFVVERNZDFMTm9yNmlXMVJhdnZxcDgrUDk2SCtXcktwanVPbFF6Vm5E?=
 =?utf-8?B?VXVRaHZ4dmc0U0VCM0tvcVM2T0dhbWVEYjMrRG9acjJqSUxObE81QVN0dTgv?=
 =?utf-8?B?WEYrTXA0SGFUd1dGUFhkeGpLZEI0eitRcys0d1U3V240cW1ST2d6SzF0Zm83?=
 =?utf-8?B?Yi9tYlVtVzhtbnRWY2phVUFOTXNjM0x4eXl6Um85TkFQS3R6V2I5KzkyTDN2?=
 =?utf-8?B?YVFjWWg3SThOTDJEbnZsa0RLZEd5SWVGSC84OVBST0ZjVGdpR2s4NW9qY1V6?=
 =?utf-8?B?U21xNWNzUmp3RXJEczlUUityTnpWeFZvTkFRbHNlTnMrL20rUlBydkZQMnRy?=
 =?utf-8?B?czE2Tk9DVkIrUTJEakdpczB0NkU0UHFHRnFmMFN4THBaandQemRNRkVXSEtZ?=
 =?utf-8?B?OTNrbFoxWjNFM25paTQ0SnRVVklNeUNJK0tNNmtiYm1WeENnZGNOSEcxaDk0?=
 =?utf-8?B?T005RVBZNmFhbklxVWdpQm5MZU1zZmVsbnIvZWVTR3B2R0VVUElURGFOZ1lW?=
 =?utf-8?B?b2E4UzBSUlZ5SzVrUU1mRVMrcTA1YXZXcWZxMVd5RTlKbEovU1hscVE2c1JD?=
 =?utf-8?B?OUJuQmpJUndYL1RBaDM2MkxzOE9heVZDbGdtOVBUKzNGd3F2MzFlV1ZueWdN?=
 =?utf-8?B?bTdSdXBiU281NmovQ0FwQlZ0dXdjMUIzZjU5SHFWS3JzM3ZUampzS1I3QnNS?=
 =?utf-8?B?ZStDVkptTTRUOFZ0cHZISU9aeHhUN3o3dGsvQllucGNQZTVaMUJiMkRLSHpJ?=
 =?utf-8?B?UXVvNklGL2dkdmp3R3dlZnhiWnhWWjRGYU42NG81d1JhRm44aDR5MWw0N1pK?=
 =?utf-8?B?dWk3MEYxeUltSmdwVVVVQmtEeHlPVWloOTJCZDVKenpHcXNNSHlod3BJSWtK?=
 =?utf-8?B?RzcrcVQybGUrUVlmdTZ6Y3dhRHY2d29JQi9VNXRMOS9jNm1NOHErYUxUbUFk?=
 =?utf-8?B?cGVTQk94WWdCbVdOUTBUNm95b09qakhVWXl5ZlJ2Rkd0OU5vOWNnVVBLZ1k1?=
 =?utf-8?B?bTh4QUMyQyswZlBEVDlmL3JHdWphNk9sYmNNYUJpWjhYcHhpUWR3eHMzQVh5?=
 =?utf-8?B?MmhuK090ZmN3NTBld3ViVUVycDhxdHdoQ1dlenFxS0xtSFUxRzR2SlV1SC9u?=
 =?utf-8?B?T2NPVXZJVzZlTFRpK3hzMnlXOUh2NjltL2UvZDBTODRQdlJFNkNOYzQ3TU5X?=
 =?utf-8?B?ckgvcThOQitXaHJ1WlltZ1MrUTZQaURiWFI2eks0MFA2OEtvR1huTWhYekxy?=
 =?utf-8?B?K2hGK1NhNzNXUGJMY2dybmo3SmhnTHRVNmNrbjlYQWtabkZrTjFTdHRNTDYw?=
 =?utf-8?B?TWkzZnFnTE05cUlzRTBwb0hQTkpBTVFpQUF6aWFoNXVVSXRwbGJ4ejZLczV5?=
 =?utf-8?B?b3Z3Mk1MTGdKK0t5NC91K1UrY0lVc2JjYlFrcUZmTCs2bEJReEphdjJyYkty?=
 =?utf-8?B?M25WSDFLVUd1TndsYnBzV2QrN3hZV1lWRXplWTZrd1dSVk9rV0pBaHJuYkxs?=
 =?utf-8?Q?LQB0gCvQiEQfaZl2DQxcZAw8i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d70964c9-5b47-4a94-acbf-08dcde336055
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 13:59:02.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcoP5uRBD7cS412R6aYnul+5Tm3xUL1U8NPNJgMWV1vu4cxYSGyS0Ydd9zkgoPCTCS0tGGpuPUxo3C+TF4ROkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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

The failed igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit test on bat-lnl-2 
is an known issue and to be fixed by:
https://patchwork.freedesktop.org/series/138889/

All other failures is not related to this patch.

Regards,
Zhanjun

On 2024-09-26 3:21 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add GuC based register capture for error capture 
> (rev22)
> *URL:*	https://patchwork.freedesktop.org/series/128077/ 
> <https://patchwork.freedesktop.org/series/128077/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b_BAT ->
>   xe-pw-128077v22_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-128077v22_BAT absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-128077v22_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-128077v22_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>       o bat-lnl-2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1 other test abort
>       o bat-dg2-oem2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1 other test incomplete
> 
> 
>         Warnings
> 
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o bat-bmg-1: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html>
>   *
> 
>     igt@xe_pm_residency@gt-c6-on-idle:
> 
>       o bat-adlp-vf: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html> (Intel XE#2468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_pat@pat-index-xelpg:
>       o {bat-bmg-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html>
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-128077v22_BAT that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@xe_evict@evict-beng-small:
> 
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@xe_evict@evict-beng-small.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
> 
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32 other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o bat-adlp-7: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html> (Intel XE#2871 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html>
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o bat-adlp-7: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> +3 other tests pass
>   *
> 
>     igt@kms_psr@psr-primary-page-flip@edp-1:
> 
>       o bat-adlp-7: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html> (Intel XE#2871 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html> +1 other test pass
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>       o bat-adlp-7: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> +1 other test pass
> 
> 
>         Warnings
> 
>   * igt@kms_frontbuffer_tracking@basic:
>       o bat-lnl-2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#2235 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v22/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#2235 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235> / Intel XE#2548 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b ->
>     xe-pw-128077v22
> 
> IGT_8032: 8032
> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 
> 88d592f72f7bc508d6a027b1f96aa2e53f803e1b
> xe-pw-128077v22: 128077v22
> 
