Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C355CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 20:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD4310E219;
	Thu, 14 Aug 2025 20:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFk4rafP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591EA10E219
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755203440; x=1786739440;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QWqBTG8Fg9KUxQVke67j5IkkXYbMLXUxQ/8XAMRVCTM=;
 b=HFk4rafPWeyNwaaO1vCaEO8tc1A72G0oRqnLU9ejpApFQiLLTcnvGRpc
 QS5/W/rAeyte6SEbDZqX8fuVbYrrqEPdq08uhwcex7kdohyT2uahTC2V0
 EmTXradChySAS9j+o6EsteyUmrTlQHJfNfORUy2e4ffZUWofxWJE3nENK
 9cjtvum+aTQttqWqIc4lIx6y390vQbxY0SmCfv6KmPFX+LtTnN7a1IZM9
 U34E6J/1cde8tqWWaN5s8UbAjzqvp93fBuIFXKS5+npk7aTYyzDXW+C1D
 Vx06FQJPzMxR6bemvcKCxPm9LVXbyc5huHYkaEbmIcWj2P6BQkrwOne4B Q==;
X-CSE-ConnectionGUID: MuVeQjC6QxS6kR9WOsnvxw==
X-CSE-MsgGUID: ZV4RvrzETwihDo7NfkSJow==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="74983964"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="74983964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:30:40 -0700
X-CSE-ConnectionGUID: DOAVtegzTCiw88r+a0fMYw==
X-CSE-MsgGUID: KEcMxBZ0QTq70HLUij+GdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="170983546"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:30:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:30:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 13:30:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.74)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2Kr09iy2OgnE6Y5tsbHtfonFBiw7T4HTBg1W9Ltp0Rg5JBmRGVdpLmOJeK1x00R3lvqcnOS0eHl3eMXJMGAmtefvi0GHO4fJQkQjzzehyQXG9MVDoq6u6cJbCo/OCYesVst3DbdWwBLbChmTcuLSPICn6VisFudtv75eXOHdFjcflKxuw6wzK4zJ7hIchZKTEAgtlUKXvtVNmLZQCjBiO8RuRt1NXZS3h/kMT+C3jdoaiXL1yNlPLRa9Xsei+EuaMX4XPUsz9TJjRDw5P5yu4SPhve3rdtBY2ntydCDGlSm31tTRJ9nvt9dRqYFXR6uHVO08U0PD+ZiCJkBuJHjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxuLuMrndHwdQEY64wemfn9DIx2vvp14VneUJk6QjGQ=;
 b=yF8WVEITNWGHLQRXaHvBcXyAo4wQG2dno0BnHv6rWW3gqgDctM1u0OmPYU8C8CEL16wkX1bztzSOVWhDHf+eZSSCpg/jYK+IKkSzm57fDH9/1TeDCQ1SsWkTXt7VgCt8zcqg2dO2w4t/amzlFAQvCMgB7mNORhz9f1CIRMcdLVfMb0hVsl4TIuZl/Dp89AkKLQW2cLtpIBvcElOaOuPYrQAXdTLa5sBcVbHD7ejeV8mLfmbewPYhH6rAkw6JMptpE93KNBOzQIoqphS/LvwuWuhx3IxnV2iv3PR3dw1SIPhS5omjNuar4Woih46iyjhtVWP1OLXEPDiENqZqf7a3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 20:30:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 20:30:35 +0000
Date: Thu, 14 Aug 2025 13:30:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 15/15] drm/xe: Convert pinned suspend eviction for
 exhaustive eviction
Message-ID: <aJ5HZ63s4J3rxxmx@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-16-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: d131f015-a0d6-4332-448e-08dddb716c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3RSMTM1ZzF6MHQyd1RZSUpRRTZKSkhkVnVJellpWDJzcURtZjluZmM4V3Ar?=
 =?utf-8?B?WlRvU2hjLytWSDhPblVrc2hZNFdnKzR4Vk9GMVYwalNIKzNLVjY0RjNNa09E?=
 =?utf-8?B?dHZwaUh5c2t3bWpHdUJoM2ZrVkd1WVU3WmlQU25KaGExWXU2ai90alFUNlUx?=
 =?utf-8?B?U2F5VTY3OHhqb3U1TWxUSVpUNW5Tb0w1RmVnTG9RK2h0UCtJODdocldqQlY4?=
 =?utf-8?B?VnNaRWFZYSswaExPSUM0a2R5d0hyd3FlOXFyQkVVbzVhTjBTWTZqcUdJUUhU?=
 =?utf-8?B?dGpHWVNvUnJVVkI1T2hBRFZzZk9XbjRtU0gzYkxUOGYzcCtPUWhLNHFYb0kr?=
 =?utf-8?B?c1hhYnNQbDRSd2crTW8vTGlZazQ0ZDFlVldaaUlhc2Ivbm1rd0xDOHJZQnR3?=
 =?utf-8?B?RnNpTmhmcGJzZ1NZTDc4OFFlNTJRdElUVkI2T1F4Vko0SjQrSFB4MVhqbFRq?=
 =?utf-8?B?ZEo5WUQ3SlZ2TWVrM0h1ZTNiUHpPazd0TUFLQ1JtcnZsV0lmRVM0b0RlUzVG?=
 =?utf-8?B?QStKNVhYdzhYRkYvYWNKK2FUU05LeERqWG1ib1BKVThUOTJOYkx3dTdUa0lU?=
 =?utf-8?B?c2w4bVVETVRhTjlXRTNaZ2EvYm5sYWZtc0lTYWEzRGdDaG1wOHNvSmZBTlVo?=
 =?utf-8?B?SzM4MDFxVFdqSWpVNmdwR2ppdHB1Um45eW9UNnFUOVZjb1B3YXFacE11L1RF?=
 =?utf-8?B?UWxIeDFqKy91dHdEaFV6UVo0eDgrbGJkQTZTUVB5blcvNHBEYmJsZGFMVXkr?=
 =?utf-8?B?RVRvb0RwOTgwYk1FTHVQV2lBZTdHTVRick5YYnV2YUxvRnZCbnJJNndlV2dp?=
 =?utf-8?B?MlBmSWltZ1JBSjVXOGVEZGJlMUsra0F4bEo4SnpTR3dwVGRaYXphMDFkeGk3?=
 =?utf-8?B?ZWxwZnpzME0vUVY1dkMzMnZvVGFtOVVHbVgzbWdlZEV0U1Bka2V5cll3TkdH?=
 =?utf-8?B?ZWxhVENxTnluL3plRGw4VThEVU5LR3B5Nk5FQ3ZoZ0p3YlpWb0Q2TURrUUx0?=
 =?utf-8?B?T1dDbnBlNlVQQ2pLWkFnd3AzNUdHVVRLU3ppYzIyMEJmV1ZZZy8xRkdIKzFk?=
 =?utf-8?B?WjlaQkVndFNzeEZTUW5rVy9uWWNjYThlajkwczQybDVtNXVpWkE2Z1Qxaks0?=
 =?utf-8?B?SGM3YS9RdzlGeGgvMnBVNktOOEtXazdKSDJpL3pnZ2VZYkgveitRNVgza2VU?=
 =?utf-8?B?ZmtWbjBkcjhIdWtPMDhsUmJqdjFKR1lGeXFnYTM3dTBGVjlBZVBMeHBYVlpR?=
 =?utf-8?B?NVVmZHAwS0FSdFFKMEhRdHFUemRYbnV0Z2kxQkFXanRVSTU2S1FLOTBlVzZ2?=
 =?utf-8?B?MGZmMUFuaWxzUjVzZVMzdUlGMmIwWnNLWlJ3WkhaOFp2RWMvS2ZmNnBKcmdI?=
 =?utf-8?B?cTI3MlJNMytOaDFUdm1FWGRYQStFQWhrQmYxMjJQc0VIMlFyL2VpVVVFdVcz?=
 =?utf-8?B?NlBHbmJtSjNpRHQ4NmJ0TmxFRUhqbU90ZEtHS2JmOWFlQUpqYzZXVWhlOHdk?=
 =?utf-8?B?Nm55aXEwUW5PYkMwT1NUZU1FRTBiTWE3b1U2T3VoeWlJWDZWY1hPaVo5eFV1?=
 =?utf-8?B?UnlyUW55S1VUMnA3b3RyUVBaWXNpL0VBS3J1azBvQkxaUWt1cGtYVWY5c2Qr?=
 =?utf-8?B?WFZDQVg2MWsvS3hxN3hBWmpIZ2ZQZk9mWXE5L05TdDlyV1lpTDFrc3ZHREhu?=
 =?utf-8?B?ZjIrZnJYNFUyZjM2dVlmTjZxUjlqaDRSR0kwZ2ErSXRscUc0NW1rQlBHZVBv?=
 =?utf-8?B?aFRjV01YR002MVVyaDNCcHNvS0JqaXE2eFpsanJrbVRyTG5nNUxwYUNMTk1L?=
 =?utf-8?B?NXRBRzl3dUVTc2s4MzJWN1owdy9GYk1TNHg4VG9KZWdESXhBWEF6VklhOW04?=
 =?utf-8?B?QlRpS3NBcyt1VEMxemtxLzZvQmYrTkoyUk5kY1BCSThITmNHZ1VZakx0dDVj?=
 =?utf-8?Q?1/FzeWgxj3o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emluRFhza1E3WXB2SlJJOElQdXZGUTlMZFRsSXZmMklpdjMrZzFneFk3T05R?=
 =?utf-8?B?NXJSeXkyU0NVQ2JmRlpRSURlRHVaREl3aHltZVlEUnJNZDBvSTJnczU0Umg1?=
 =?utf-8?B?S3lnMEZFZHJVQkd5MjNrcGZ6c1NqUXpJZ0c2dW84WUdWcXpwakNjb01hcTdz?=
 =?utf-8?B?YnhHekJNdUo1eU1iWmRtQW9tVmdpck1FbzR5QWJjbG1iQmg5K2Z1N3gzUXl0?=
 =?utf-8?B?MVBsTHZFUTNGbHliODNGSW9sRll2OGtyc21pbnpuTWY1dzVPR1RxZGhrUjcw?=
 =?utf-8?B?V1pxeDhBekFqNFJGOVB2MnFQVHI1ZXZhZDFwMzhmc3phVXI3TFJ3UU9SM0Vz?=
 =?utf-8?B?b24vQytlTjh5Z3B6bjNBMlBKZmVNY2cyMG04Ykd1ZEpKbWl4a2M1alc3b2dZ?=
 =?utf-8?B?RWpOSFdjTFVraWtNNVdoRytvb1pkcDZCajhQOTR4WnREbnVJUmpLaVJkOHND?=
 =?utf-8?B?VENXR0hjR0VQM0RQUFhmK2p2Sld0QjhZOGVWdjZuQldYbjhEdWluSmQ5RlJ1?=
 =?utf-8?B?T0RsRDF1clYvWnhSRXh2MnJvcmg4MzJwWXRyaFJsc0poNGJlMmMyN3l3SmEx?=
 =?utf-8?B?TG1mYkxqNDk5UnBYNnhkR3RkNm1wVEgrRS9uajhiZll4Tm5iM1ZiQ1VzNUsr?=
 =?utf-8?B?LzhNZ0RZZEtSQzF1cCs0UDFEUi9LVjJ4TnJUMGpFVTlWbWFaR0JHRGFzL0Zs?=
 =?utf-8?B?OFlVKy9VUnhUbW5kMGtLYm5XMklDcUZ6NkZyL3BiMHVoOGFFZ0tzdFYxVGNH?=
 =?utf-8?B?eXAwWTBYSmtsOFRqdU93djlHcG1vVHV5T3NvS3pDL1M4ZXRrN1NDakRPSDdH?=
 =?utf-8?B?d3VnSlB2ZEZEQzZzM0E4L3Q1WDRBSDdLWjhSbzh0NmlNMzVWNUlSWjcyRVNa?=
 =?utf-8?B?enlZekpDU2s0TTA1dUZqR1M1VXN3Snk1YTE0T3lHSFpOUk5JQVdueTlnR3V0?=
 =?utf-8?B?TnNLRlZXZm42c0hzZ05YK3IrVmg4dUVnYlVHQWtMM1Z5U3lQS3lmdHM5L0Nv?=
 =?utf-8?B?UXlKMjZWN2ZBcWlQNDBhLzd0cUtTQ0JnczZpR2M5TTBNbDVSMGVudGlyUGFh?=
 =?utf-8?B?Mlo1V1RYUTdKVUdmejBEekxtcXVwb3VhZmdmT2tuNmlaTzVraTJTWjJzcTVM?=
 =?utf-8?B?Ykplc3FRNTdJMjV4TnlyNnhWRUFtYTFLNEhBYU5uRG01UzlhSTdBODlSWmVR?=
 =?utf-8?B?Z1Fnb3ZUZUtSTCtLaFc4bmMwYlZndFQ2Yys3c0pWQ0c5TDFGeUlJY0dqVkJT?=
 =?utf-8?B?MEJCVTJqVkdpQmwvYVNuQ1FEQnRETmZnZXU3cTNGTTF3TEJXV3BIMS9vRzk0?=
 =?utf-8?B?QzhFeUV6Zll4dnNBbTFQVUFWOG9nVGFRc3BwRmdjZG5jWENFQVlqclBNM2tW?=
 =?utf-8?B?d3RHQWhEbVg2dG5ZSEcrUnJwc3cvMkcwaHUrVGxyenQwRm5adGdDUVlaTEhD?=
 =?utf-8?B?bkNsOUpBQUJTVlkyV21GSmllSGpUblJDN2RDMmsxQXdPUGJnTHBxUEp5Wkhy?=
 =?utf-8?B?alc0UkdoTXNCcVdQMnJUNWZJTHJrdXN6b2NZWTBJaU52R3VNbmJjbXEyNmxj?=
 =?utf-8?B?emhlb2oweEZkM1ViTWRyV0k3cVRVV0V3M1FxMjNJeU9ranVzRlgwSStyTTJW?=
 =?utf-8?B?Skt1Q21icTZMR0IvYitjSmpnRUdPTnNzbVIvYW1IT3diazc1Nk00aHZsVEJt?=
 =?utf-8?B?NjJ6dkdiYmR0TWxxbVJOeTVEczU4cDh6aXB4aktUVWxXYnZGZXBndzZiSVN1?=
 =?utf-8?B?TUN5dG5vc0ZVcXV3UGpjSzZ3OGZzc0xsS2NyR0VLazZMSExSclRDYnI2eHJ0?=
 =?utf-8?B?Tk5ER3ZmNnhUYzVmQkFRVlZ2YjZ6VCt5YlY0L29QZk5Ca3Yxc0tqNk82UmQv?=
 =?utf-8?B?eWU4dG9HWjhLSEd3cWxJR1Fjd1plcktQYnF0WmN2ZmhoTFNuSHJFV2RLc2Nq?=
 =?utf-8?B?WjdyKzJmZ2dzMVJUWWhRWlozMmx4T1Q1bG9HZUlPQU42Z2NNNGdTSEt5VjBk?=
 =?utf-8?B?YkNEZVJnc1JPV2pnOEU0V1RNeExlL2ZXb0dUaWRlWjJPT3ZodG5hcldvRWZq?=
 =?utf-8?B?a2xIcVV4RXgvaVh4TFArNHAyQjRNd3VxU2pyblhQeHVyVUdXUkZReEUyUnhV?=
 =?utf-8?B?WFBSSjdTTFRvQ2I2OFBTazdCZGE3R2tRbTZaSkpDekF2cXp6d2tzU2J1T0tU?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d131f015-a0d6-4332-448e-08dddb716c30
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:30:35.1716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BJkuFEAQlst/FOOEjLw1OvARuKqBzSAgtwGMzzJc1zNXFv45u03CQ4/tl/J4iISGW6bsLGlWEQV3fh1ZWKdlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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

On Wed, Aug 13, 2025 at 12:51:21PM +0200, Thomas Hellström wrote:
> Pinned suspend eviction and preparation for eviction validates
> system memory for eviction buffers. Do that under a
> validation exclusive lock to avoid interfering with other
> processes validating system graphics memory.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 205 +++++++++++++++++++------------------
>  1 file changed, 108 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 82bf158426ad..efb9c88b6aa7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1139,43 +1139,47 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>  int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_bo *backup;
>  	int ret = 0;
>  
> -	xe_bo_lock(bo, false);
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, true) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_assert(xe, !ret);
> +		xe_assert(xe, !bo->backup_obj);
>  
> -	xe_assert(xe, !bo->backup_obj);
> +		/*
> +		 * Since this is called from the PM notifier we might have raced with
> +		 * someone unpinning this after we dropped the pinned list lock and
> +		 * grabbing the above bo lock.
> +		 */
> +		if (!xe_bo_is_pinned(bo))
> +			break;
>  
> -	/*
> -	 * Since this is called from the PM notifier we might have raced with
> -	 * someone unpinning this after we dropped the pinned list lock and
> -	 * grabbing the above bo lock.
> -	 */
> -	if (!xe_bo_is_pinned(bo))
> -		goto out_unlock_bo;
> +		if (!xe_bo_is_vram(bo))
> +			break;
>  
> -	if (!xe_bo_is_vram(bo))
> -		goto out_unlock_bo;
> +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +			break;
>  
> -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> -		goto out_unlock_bo;
> +		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> +					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +					   XE_BO_FLAG_PINNED, &exec);
> +		if (IS_ERR(backup)) {
> +			drm_exec_retry_on_contention(&exec);
> +			ret = PTR_ERR(backup);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +			break;
> +		}
>  
> -	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED, exec);
> -	if (IS_ERR(backup)) {
> -		ret = PTR_ERR(backup);
> -		goto out_unlock_bo;
> +		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> +		ttm_bo_pin(&backup->ttm);
> +		bo->backup_obj = backup;
>  	}
>  
> -	backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> -	ttm_bo_pin(&backup->ttm);
> -	bo->backup_obj = backup;
> -
> -out_unlock_bo:
> -	xe_bo_unlock(bo);
>  	return ret;
>  }
>  
> @@ -1215,99 +1219,106 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
>  int xe_bo_evict_pinned(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	struct xe_bo *backup = bo->backup_obj;
>  	bool backup_created = false;
>  	bool unmap = false;
>  	int ret = 0;
>  
> -	xe_bo_lock(bo, false);
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, true) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_assert(xe, !ret);
>  
> -	if (WARN_ON(!bo->ttm.resource)) {
> -		ret = -EINVAL;
> -		goto out_unlock_bo;
> -	}
> +		if (WARN_ON(!bo->ttm.resource)) {
> +			ret = -EINVAL;
> +			break;
> +		}
>  
> -	if (WARN_ON(!xe_bo_is_pinned(bo))) {
> -		ret = -EINVAL;
> -		goto out_unlock_bo;
> -	}
> +		if (WARN_ON(!xe_bo_is_pinned(bo))) {
> +			ret = -EINVAL;
> +			break;
> +		}
>  
> -	if (!xe_bo_is_vram(bo))
> -		goto out_unlock_bo;
> +		if (!xe_bo_is_vram(bo))
> +			break;
>  
> -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> -		goto out_unlock_bo;
> +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +			break;
>  
> -	if (!backup) {
> -		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -					   XE_BO_FLAG_PINNED, exec);
> -		if (IS_ERR(backup)) {
> -			ret = PTR_ERR(backup);
> -			goto out_unlock_bo;
> +		if (!backup) {
> +			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
> +						   xe_bo_size(bo),
> +						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +						   XE_BO_FLAG_PINNED, &exec);
> +			if (IS_ERR(backup)) {
> +				drm_exec_retry_on_contention(&exec);
> +				ret = PTR_ERR(backup);
> +				xe_validation_retry_on_oom(&ctx, &ret);
> +				break;
> +			}
> +			backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> +			backup_created = true;
>  		}
> -		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> -		backup_created = true;
> -	}
>  
> -	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> -		struct xe_migrate *migrate;
> -		struct dma_fence *fence;
> -
> -		if (bo->tile)
> -			migrate = bo->tile->migrate;
> -		else
> -			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
> +		if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> +			struct xe_migrate *migrate;
> +			struct dma_fence *fence;
>  
> -		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> -		if (ret)
> -			goto out_backup;
> +			if (bo->tile)
> +				migrate = bo->tile->migrate;
> +			else
> +				migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
>  
> -		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
> -		if (ret)
> -			goto out_backup;
> +			ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +			if (ret)
> +				goto out_backup;
>  
> -		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
> -					backup->ttm.resource, false);
> -		if (IS_ERR(fence)) {
> -			ret = PTR_ERR(fence);
> -			goto out_backup;
> -		}
> +			ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
> +			if (ret)
> +				goto out_backup;
>  
> -		dma_resv_add_fence(bo->ttm.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_resv_add_fence(backup->ttm.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_fence_put(fence);
> -	} else {
> -		ret = xe_bo_vmap(backup);
> -		if (ret)
> -			goto out_backup;
> +			fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
> +						backup->ttm.resource, false);
> +			if (IS_ERR(fence)) {
> +				ret = PTR_ERR(fence);
> +				goto out_backup;
> +			}
>  
> -		if (iosys_map_is_null(&bo->vmap)) {
> -			ret = xe_bo_vmap(bo);
> +			dma_resv_add_fence(bo->ttm.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_resv_add_fence(backup->ttm.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_fence_put(fence);
> +		} else {
> +			ret = xe_bo_vmap(backup);
>  			if (ret)
>  				goto out_backup;
> -			unmap = true;
> -		}
>  
> -		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
> -				   xe_bo_size(bo));
> -	}
> +			if (iosys_map_is_null(&bo->vmap)) {
> +				ret = xe_bo_vmap(bo);
> +				if (ret)
> +					goto out_vunmap;
> +				unmap = true;
> +			}
>  
> -	if (!bo->backup_obj)
> -		bo->backup_obj = backup;
> +			xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
> +					   xe_bo_size(bo));
> +		}
>  
> +		if (!bo->backup_obj)
> +			bo->backup_obj = backup;
> +out_vunmap:

I just want to confirm that this is safe. The cleanup.h documentation
discourages the use of goto because of scoping issues. I assume that
since this label is within the scope of the guard, it is fine.

It might be worth adding a quick note in the validation guard’s
kernel-doc mentioning that goto can be dangerous, explaining what is
allowed, and perhaps referencing the cleanup.h documentation. I could
see this being something developers might trip over.

Patch LGTM, though.

Matt

> +		xe_bo_vunmap(backup);
>  out_backup:
> -	xe_bo_vunmap(backup);
> -	if (ret && backup_created)
> -		xe_bo_put(backup);
> -out_unlock_bo:
> -	if (unmap)
> -		xe_bo_vunmap(bo);
> -	xe_bo_unlock(bo);
> +		if (ret && backup_created)
> +			xe_bo_put(backup);
> +		if (unmap)
> +			xe_bo_vunmap(bo);
> +	}
> +
>  	return ret;
>  }
>  
> -- 
> 2.50.1
> 
