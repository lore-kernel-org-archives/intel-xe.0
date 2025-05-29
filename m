Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0773C3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 02:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E0E10E1C6;
	Thu, 29 May 2025 02:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqMoC6Tv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D629C10E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 02:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748485776; x=1780021776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GcWyON04ex7SecfsmuNyoTS4+v9qMkMrsLp0BQ3NlUc=;
 b=EqMoC6Tv/RABWdLwhvEWpmbB7q1pWPI6y1wdRcluyZJi5w4GFjNfYxL6
 m+JG7hVJA4hTxf2CjJOrAawBkUqAUDnGkuUloWgbJn15Tz3gAekkip8zL
 q66EU905V18xtLAPSJWzKcLsZGXt5FYIR1EGT8bI3nkW27uMMY/iMkAjn
 LU8w4fP1JvdALNw4JxNYVrNb1WXTJqKU5G5X+KQv53eAkzA2JhTxkmWcA
 SRw+h7r+N+8nsjkpNVAvXiHDc4oNXWiZ9EWutfuvBGGpnqLlowIP0ksob
 ShkiphVy4pYE6nVNcJdApVQuxkjY4GHzVbccq7R4ulnYZvqivFMc1Vf/L Q==;
X-CSE-ConnectionGUID: CKsb8E6RTayUHC7HwM9Ccg==
X-CSE-MsgGUID: VVYzrR+TSGe0jnRoTyWykg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73064553"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="73064553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:29:35 -0700
X-CSE-ConnectionGUID: Multt1IeR8iDArAhdz1uiw==
X-CSE-MsgGUID: QLrcqBqwS+ysfWcLvpTc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143444421"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:29:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 19:29:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 19:29:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.87)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 19:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO4/Gc3MXWfsf3NnBkkpzSJPs8vOD5bWFRbAh6jC/Ill9A6Ei8KP2vOC4pQkyBP4F7bn8tT/xukSOMtqeF8jgRfEBH9WBq3H0Q/7RfUIEA3noJj1GE6gKenLrZ6lx0SCcolxzT84mS3EoCDw4tFk2HzEmA7+4eXfP0ZK44X36exoucmLiZYu83ONO7JcsUOo7jZuuZ4Vy/3oBXprY/118sbFG9VvLuTEKtOivsg62y0M7Cu0JNwqpQ2IoEcp0N19ySAAf2IsZb001m1+TeqlltSIrGnTADGiQIuYip2TulaP6OdVIch9bOkub7FPTUABb6X3ocqNmgKP0AZ7zwLpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLu0yzsiuVTiNkdVhIlNm2DL8T+2NC74Qnjx08PqWLs=;
 b=mZFBrOftW6sjCUn8a8SL9rhMqKv0Q8NVUt1UB3xMuF0/jY0BunNssFsnYdhDGbqc4BsbQKhBna0AAAlGHr3NBWbI6ZSB1NPJzPmOT6SBu4YbP0XsIt6jYA7kgYqgSoWJ7s/v1hK2bL6729h7TkW/gRiwMXU49780f2NSXQcfTFxEVBRyQBhzi3iRx0bNhRBE5t+BIcE6DlpOHDzjWU81Xin1xGhSjfMFb0qtJv0lBo+jHLUGrl0j1jK13ehgJxZzXue0OicHF1GEfPK6E/3SphkxZD4f+WVILyLT3JyZPh/hR0j9h6TDdqklkzhjeV/HmvpfoPqRyyBxrht3JhAzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 02:29:32 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.8722.024; Thu, 29 May 2025
 02:29:32 +0000
Message-ID: <23ddf12e-d363-4022-aca4-45661f578d4b@intel.com>
Date: Thu, 29 May 2025 07:59:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/19] drm/xe/bo: Add attributes field to xe_bo
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-19-himal.prasad.ghimiray@intel.com>
 <aDegn4lbaUqDnEb2@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDegn4lbaUqDnEb2@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|DS4PPF0BAC23327:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f28417-81da-4acf-5940-08dd9e58a4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1VRUStGYVRib2RvdGhsY1h2dkczRFJiVGZ5RVpjTllldFp3ZWdqckwwb3o1?=
 =?utf-8?B?RzFsL3ZJMHUzQXpEUGxsR29RZEtXeU9uR093cXAyV2ZNSXRKOVlib3J5a2NK?=
 =?utf-8?B?b293Q2VHK0NPanRtSzVqVVowaVdVQWMrM051SEFsNnlScTZnZno2Z2k3b1ZK?=
 =?utf-8?B?YnVIUzN0WU9ESDVveU1XU3hRWjNZRFJoZmZwQU5ENGtyb0NNK1dXVWJyaUJi?=
 =?utf-8?B?NVRPTkdJRDg3ZXBwWTJGZndGQ2VJZFUwUXBnSGd1UGlQdDRDd1hKSDhyenpB?=
 =?utf-8?B?QTA4UkQ1S0ZCTVNML0E3bFBGY1YvVjJiWEhLOW5XR3dTazh1czVrRW0xOFBu?=
 =?utf-8?B?ZG85WHUycXhmWjc1VUhYbnFXaFQxOTJyNUg4TnJmZzRuZGEybm4rRm5yaGRn?=
 =?utf-8?B?NVBpNHdhazFqelF1NUFjUkFKR3ozaWNJa29WS0VtK3E0SG5KWkNzT3JhTFc0?=
 =?utf-8?B?NEVNNFpoVStBWXc3RjFYc2JYRHlGWTh3enYwNFIvVFFuaG80Y2JoVmpDcm1q?=
 =?utf-8?B?K3czSnIyNWwzQ1dWZWtqaXdiMEdob2pHVTA3YUMvTVhHR01VSU5xdzV2K0gy?=
 =?utf-8?B?NENnTkJGckcvVk9NUEVMYW9JZUE0MEpIVHQ5bUFNSEExczI2ZXBBeFoxTnh1?=
 =?utf-8?B?bTUxbng4YUczYVNoY3REY0R6VmdOKzBORkwwMTNudVB5MlFqUXdlUThrL243?=
 =?utf-8?B?c05hK3BMcnJkWmFWNGRub25ETkxudDRyWklVNGFtekMwa2VtZHBjUlcxeUl5?=
 =?utf-8?B?Q0JRUDZyQTl0dEI5UU9LZys4UXFUR2xuYmNVMlFWSkVKMzV6QW5uYjdMZkNa?=
 =?utf-8?B?a3czZlZ4RVFKZjN0SEkySzQyZ2N2bFFhMzZYSlBKUWZldGFqMzkwSC9LZExB?=
 =?utf-8?B?eStNak5YUlEyb2xLcENCTjdJQVpBUzE1QkpjbDNIVnVHTG9jZmRnR3JxU3VG?=
 =?utf-8?B?a2MvZEVTeUxuM252MUY1TnVYSlBwOUxRWE9nci9vVjFuOEtoSmp4UEpLNGlF?=
 =?utf-8?B?R3lIeVhPV2NuQjBvbFo2K1pEdnFZcUc2VkZOZWVjd0h3Umt1MjhpTTRicHVl?=
 =?utf-8?B?NlhVUmdQdHpEbkRWU01OS3ZmSlVaYWFQak1xVThaeWd0djdVckUvVHh0Z2ps?=
 =?utf-8?B?UDNiMVA2V2w2Mnd0UnFEYmh3VDdET3pINmloWGdtbmRzcFNaOTNUWmVUejhr?=
 =?utf-8?B?SVVYMWt6TkdVYitOeGFLdXlvN0hSMzJxN3pXK3VhY1JmTTBqZ0RnL2hQa1Z1?=
 =?utf-8?B?SVRlVEk3N09wWnNLaXJseWxIK2VjUHl4VmpCWTlqTzU4aUxnMzliM0IvMWpP?=
 =?utf-8?B?bEhsWmVmdE50c21oUFQxR1VUYVorbjcxV1BKYmtiZFEyM085blhXRThtSVlK?=
 =?utf-8?B?ZFFXSndPbTBIRVVwR09oNHZFaHM5VkFYM1BxWE83QzV3NnNPU0JNT2gwTWM4?=
 =?utf-8?B?cktQSW5sL2NWcTNpdU0ySVBtWUx3NjNreGhGdHRxNzcxOEsrRnA1dEszcXVk?=
 =?utf-8?B?WEdlcHAxdzdhaFV2QW1xWmtlajBuS3I2dzBWS2g3U1p1RWNuVGxzV2JHZnNB?=
 =?utf-8?B?K3FSQVRXejZLbDkzZzM4MUNGamRKekRBT3RPU0JnTnNBaUtGNHg1VklHSk93?=
 =?utf-8?B?RDFqa0JrSGJvRjVQQkNxZXNPOFA0M0ZlV21ud25KYjA3VW9wT01aMVlhT3BJ?=
 =?utf-8?B?S1BwajBzVGFHYTZYMnAyK2JuM1czOUpzeUp4SVNramJVcFJEbXFIRU1vcjB2?=
 =?utf-8?B?dGpOS0lqeElvRnpJWHVSWmVqVDkvU0hnaHI0R1JFbm5qZlMzYXNIMG5uZjlB?=
 =?utf-8?B?VUNjRm9neHVrem5UQnJSdHpKaXU4RVFpc21oVVFSVU1Nc2gzbTJrei9HOTEw?=
 =?utf-8?B?RHJLVjdxTnZiUkMzdjhkT1NXUHBMMGR2N0c2S3JaUEw5NGZHckU4eW9hUGtK?=
 =?utf-8?Q?Z9uwTcf427k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzlsanhmYzNiREZxc3ZPT252bXhKQnB6UU5tYkdmd2Z5eWJ4NVh0QTlBekFW?=
 =?utf-8?B?eU9jZjRiaFNJRHl4OTY0WTV1Rmh6dFVXY083d3Y4MjUwQkx1eGR5c3JoY2R3?=
 =?utf-8?B?ZnJpektWVE50alI0TWd4QXdGKy9oaHVmTzNXVWQ2Qy85UlR3UkF6U202cFhX?=
 =?utf-8?B?aE9vWlpIenRRSnRVc0tRMjRFSjQ2N3RxMkd6M2dFbURDL29LMVp1ZVp2aHAr?=
 =?utf-8?B?cEp2TWgzeForZHk0UDJqdEt5MFRPSkNuY3lHT1czRzkzQkpvdGJSUkhoYm5y?=
 =?utf-8?B?Y3dnZ1RkRjJaRlp4TkFINEtDQjFSL1FuaGhtU2Ivb0VyeDBrZEJXWHRDdDk0?=
 =?utf-8?B?Nk9admJFK0o1ZmU1cm54czJPRG4vR2lyaWdHbjRUeHp3WGx5Q3FQZ2hkRTFC?=
 =?utf-8?B?RFNHbVVhYmY0V1RkSEE3WjQ2NGtGVmlLaHNPVnJsYXNEM3Z1Vkdnb3BLMGJy?=
 =?utf-8?B?RW1qRWVYNy9mV202WW95RlV1TThTV3VXYnhabzNPZkJOWkZGaHorU0hwYm5m?=
 =?utf-8?B?VVkxTExwQk5RQVZtUWlsMkRub0draTZKaHlBZnVJb29uWHVHYWloaW5OalMv?=
 =?utf-8?B?cGR5NVN0TDdVdjFsWU0zQU5nckFqNEtjZDNVYXNlU1NrblhKNFgyKytvd2RE?=
 =?utf-8?B?SEJoNExHcVNNVm54bnF5Zm1helR3SEwxcEdNNHJzS0tleGVzeTJpWWRSTzA1?=
 =?utf-8?B?Q3ZucXNzcXBKcFRSTDdZMER1QmN6SkRBZHlZeXUxcU9jMjV4MXdKZVIwaENh?=
 =?utf-8?B?eHBxOFlTZ1M4K0FuQWRkNzdHS1NvQzNQaFMrVGdyRGxUeGRyRE5LbmE4UmdO?=
 =?utf-8?B?dlZHZnl2OWY1VU5KZUEzMldLbkZvSXNXWEdLajhWVlZnZTM2ZzYzZ095UVIx?=
 =?utf-8?B?SXQwaGpnM2FBZ01Oa1ZZTCs5OWdaYjVCSWZBclR1WUJwZWJkbGlYN3k3V2Qy?=
 =?utf-8?B?T0ozZXdVRVJGN093Y05yOVh3RnRvNjBURU5PTHA4VE9YYzNKK2l3WFlBNUpH?=
 =?utf-8?B?QmxJM1FleWphY1Z3dm5Ga1VJTVhWaWxvRk1jaUFvQURCczBnVUVVakdUbG50?=
 =?utf-8?B?ckNSNU9GSUpick01TUk2NktGREdkUGUyZUUrVWNkVkpBeTJTVWRWL09nRXlz?=
 =?utf-8?B?Z3NncFNuOGt0ZkdwUHVPdC9BZjVkdFpFNTVwMW5adXB6WWdsVlV2bmg1RVN6?=
 =?utf-8?B?emlhNWEwVW9HdjgwTHllNzhZbUVSc1FoalJ4SFY5MzFlZFBoWTFtU1Fjc21a?=
 =?utf-8?B?dHdzT3d4cDFTZEVvTFZPYTNqRkZzN0N3VWlVQmtlL3VKNUJhU2RoREFOaTJS?=
 =?utf-8?B?MWJPSjJhVXdMMUlRRHk3UmxlQzZ6eTBRL0hySmRONWIwSk5CYy9rTDRBRDVp?=
 =?utf-8?B?cGdyNXVBK0RsbzE5SFF0S2lrMlE0ZllaMTlkVHlMdzJKaXRqblFSMFpiT1p5?=
 =?utf-8?B?N0JjS3MyanlBVTFXM0xQQzNPcWJxM0M2Wk51RDd5UDllakRMaG02MElkT1dq?=
 =?utf-8?B?Rk9DdHZpbGZUdHFwL29jTGNITHdaMWZaNmRaTGhzY3pRNGNtczBYUTRrMzBy?=
 =?utf-8?B?VXk2YTNYOS9TZUI3SG9ieWlHdGhlb0Q1QUt2SFA5Y1FLaHZ1UEI1WWtVNDUy?=
 =?utf-8?B?N0xQa213b21qd3NFL3BEOUdGZE5nekJseXZwMnRtOTBCZVBUcnFldHNyWXZS?=
 =?utf-8?B?S2Fid1VsMWdBTjh5YzVDbFZ2cS9Ka1N3VlBQaU90c0dMd1kxOW4xOTVmVEZx?=
 =?utf-8?B?SGlrYk9IZFBKQjhGSEM4VEZYd2FhdnlDTUswZ0g3ckVFQUNRVmJaVGtGMmR1?=
 =?utf-8?B?MDA2TG5ZbEhSaGM3MzdkS1JFRjhINnViZ3dDMmJteEI1OS96cDhablNoQ0Qy?=
 =?utf-8?B?MGJUcHh0UllhVnlOTjRJVUIxMXFTc2gvbXlSWGV2SXJmcVpsWU5ycHBIbkFo?=
 =?utf-8?B?Z0FsM2pRNWNyMDI1dkpIMW1BMlhuTUVIeDZtOXVlYTdRdmZsVHF2ckYyb1pZ?=
 =?utf-8?B?NWZLLzVCQjdZcTdSN284V20vcC8wYnJPTEZaRHJpaDhzTzN3bUJEcmdKeWRK?=
 =?utf-8?B?c01mZldzTTMzUERNbjVhWUtpcE5HUGlUL1dGVmcrZ3EyalNlb2gwajNWVnFq?=
 =?utf-8?B?MUY5R0JncXR4dWs2eHdTR1NoQkVlTHJkS3pvMHU3VVQ2VU5ScTlCdExoYmhV?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f28417-81da-4acf-5940-08dd9e58a4cc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 02:29:31.9508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fln0CrgMHneFWdo2205GRJqXCfuTEoN3dPe6dIIwd+bxQ7sX+0GUD9GfpxsfcUDlgSEiDFw5gMeTALjKvIVFWkhj3Z38gbes427xVsOAGR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0BAC23327
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



On 29-05-2025 05:17, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:10:02PM +0530, Himal Prasad Ghimiray wrote:
>> A single BO can be linked to multiple VMAs, making VMA attributes
>> insufficient for determining the placement and PTE update attributes
>> of the BO. To address this, an attributes field has been added to the
>> BO.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index eb5e83c5f233..70960368a5a8 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -62,6 +62,11 @@ struct xe_bo {
>>   	 */
>>   	struct list_head client_link;
>>   #endif
>> +	/** @attr: User controlled attributes for bo */
>> +	struct {
>> +		/** @atomic_access: type of atomic access bo needs */
> 
> , protected by BO dma-resv lock.
> 
> Missed above in previous rev, RB stands.

Will add in next rev. Thanks.

> 
> Matt
> 
>> +		u32 atomic_access;
>> +	} attr;
>>   	/**
>>   	 * @pxp_key_instance: PXP key instance this BO was created against. A
>>   	 * 0 in this variable indicates that the BO does not use PXP encryption.
>> -- 
>> 2.34.1
>>

