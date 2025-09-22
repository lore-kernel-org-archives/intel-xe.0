Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D3FCA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 17:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B165F10E03F;
	Mon, 22 Sep 2025 17:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljTXGgVo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7872710E03F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758563235; x=1790099235;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rmxoeuf/ttULX0hTqVbwukF8l4s8V4jFZfYROxW9V+g=;
 b=ljTXGgVol7TEl7xSHeBNkk7qF51ZevGTRtSRYe6WQyCSTggbPdH+Fsut
 3rFIDvkEBjIAm+ReNguSfIPLjro11byEE3PDjaE0jGbtx4FJ53WgfEwSF
 dgHqGiFxqqSfkKb80WAhtMdTnyG8McObPpZq0nnJVkD9SNek7uQJ+KrBr
 Y+DatvyahFLjcJxGJ2+RSs/AgLbSQNg/QEC+OJ8U53GzGCHNPIRK7PdeQ
 yb8YwaFgqHbmYvKMY9lhuQuPL3mlbti+uYoWmwGYwxMFCtuqOPs23EH+o
 evuwz+NIEB1CV/9KAF/8efamlhuKQb/f+VTUPJH+wPsEM9lOeQVwPDhDP w==;
X-CSE-ConnectionGUID: xMjDFhQvSraBIClpPIpCeQ==
X-CSE-MsgGUID: xIxOFuZjRzujwk7R/a/96w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60887389"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60887389"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:47:15 -0700
X-CSE-ConnectionGUID: Ayj1M0bZSWOOnFR1KxvVOg==
X-CSE-MsgGUID: gQu7oNkASWGutr7ye9SXqA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:47:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:47:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 10:47:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 10:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Brp9KP/igAWT2HshOie/PQhoPnizUhqfyy2zWDsoHmpS9XUG91IMnFme+0UP6QrRyn6dJSO0qXuEFmjmQsYHltwxiFFx0yn1K4WoV+mfJtDf/feLhc36FtAAD/W2OeuvxU0lyVpFYGykylNkgLXCYjzg82JC/O5GQMu8CCAmCuJ7OA/bqvG5KBPjaopAhCFHjYvBjZHAuwnF2IohwXUCyRCZW8cUiP8riic4cWNCn5a7S4LGfVx8XSV9tYPhyPRJbnnyf6CfsdhUjBrggptOez2IuIXF3rV7CApcSfUo4rBs0B7hbyU/o2d3Z8GgGb1eSeSW4WGBDD68/60+xdDYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7y+N23Gn8qqYfTFxHDXzx06KOs0QLbhLLdD0VSJBQM=;
 b=B751I7CiZXU0rbJV/VfknSHcYcdfsBBv1xKcK3DAjIjXQtzWtxhbbDjnxIorbib5DjKwyXdjiKLdu1YimIzthtlA8E5zyHaUgPnEt3A6F7bt3DPbIDyAUc+jbvenCFMO6xbRedK2eKSkAtB9DR4iK7EthEu7HMnANCEaQ1UQjwfOSC4Dl3a2tREvbU2C5RwIteVRXKXxiMu74MIYqR8YShA/TW+vdG0oyVWZ8t02h3xqajREpwlHTlS0rm0WecS7ygttnW8uw5RFcT+y61f1UteGEUxOgpL5bGIfHnmeKqJtOmSKzWcy8033mpEL1OFW6mV4Q/2+wTHyRzXQ37Aczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8067.namprd11.prod.outlook.com (2603:10b6:806:2e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:47:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:47:10 +0000
Date: Mon, 22 Sep 2025 10:47:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Use PPGTT addresses for TLB invalidation to
 avoid GGTT fixups
Message-ID: <aNGLm+8aW+w24xz3@lstrano-desk.jf.intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
 <20250918073002.15242-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918073002.15242-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0339.namprd04.prod.outlook.com
 (2603:10b6:303:8a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b215580-5b1b-479e-b3eb-08ddfa000e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alFzQ1VqZkVFRXN5bHF5K1lIMmh0NW1OTm9Vc2FQd1RCWW5oMm1sVXNrTWcw?=
 =?utf-8?B?ZHY5cTQ2Wmp2dE5rNWltSmNHdEtlWkRCRmhUblRMTXlibFdWYkQxV0NPc0p4?=
 =?utf-8?B?NHNXWjNHbWpYaEVnNGlMZU5vZGsrQ29zQlRYUklqenFVQ1ZybHhiM2QxVW9D?=
 =?utf-8?B?ekZLNFQvUGQzUnF0TGtOdEdreVdOUG5BczQ1NDRieE4wS1o2S1FRQWVwcyto?=
 =?utf-8?B?MWdQczlOSGppRkxEMXd1YUE2RGV3Y2RYczRSMVpDVFhUR0pHbGJtRzBtWDcv?=
 =?utf-8?B?SHN0NzVmVHBUVENSeVNid3cyMmRVNGt5MjY5VGdZN2s2MEtRWFF6ek5BbHEz?=
 =?utf-8?B?OEhmUzczbFVHeExwZ09EUml2aklxd0pUalk0NUcyR2xMdUxleWxrbTg3NGRz?=
 =?utf-8?B?a05aQWxObE9Memgzc3dCb3pGWWZUQUhFU3dlL01FMGtOMVVaaFFEQjlQZVVy?=
 =?utf-8?B?Nm1JM2lQNkpNWUNCVG83UkV3VFIyQytlTXhmSWdtMUlENHNQQlBKMVZOK00r?=
 =?utf-8?B?RnBCVWFNOTN2eFhnaDZTZ0NKRUo5V0xhSUFqa0tzNlI4QzBnV0ZFRFVEVFlq?=
 =?utf-8?B?OUlHbWtIYjFnQ1FHZ0ozRDZtVlNXeFlLcE9QbGVtYWw2djNhU1JkOXJDazU2?=
 =?utf-8?B?amhOQjZUVkQwUEVsZ3B5ZU9lMlAwcUFlR05PN1U5dTZXeVlLZ3dpVEhOUnFS?=
 =?utf-8?B?MXFzMlp5ZUEwbDUyUU9acFhkRTFzemhoeS9LdFNqTjB6eGFKWjhaWWxRemI4?=
 =?utf-8?B?SElPeFU5RFJTbFJZNStvZUpLeWRwTEFkRTZCYkNBQzdQV3d4NVY1ZldFcVhK?=
 =?utf-8?B?K2czbjVkYU5vRDFQanFHVHRRVmJldHExUGU2ZXRibGplWmsrV2pHSzVPNFhS?=
 =?utf-8?B?MHdHQzQyREw1V2U5MlhCOW9OL3BLTUh1NG9xSHI3NzZYMS9hSXpoZEJjOEdu?=
 =?utf-8?B?UWl2M2dhdEJRYzZBMVdFZElQUEFLaVZ6clMrd0VHcEZmbGNNTTZhczdtV3Ex?=
 =?utf-8?B?WWVReUdIcHRvRDlxS1dZdmNYc1dCdUllOXVXVEs1Q3pvM2UxMXU3TWg1Sjdu?=
 =?utf-8?B?VC9tT2szLzNHclpPWFlsT2FrWDI3VDIzYVF1QUEyUGNJV2FZYmpLeEYvZUVu?=
 =?utf-8?B?N2hJU283RDJkSmc4blowRlo0NG5yOHo0enJGSVFjdWNYd1BuSUp1bC96dUND?=
 =?utf-8?B?OTRaRXl0K3oyeHlNbmFxbFlHVmdqQW9lNTg3NW5oQ3g1UzhWaGZoaTJGeTI5?=
 =?utf-8?B?NHV6OVQzL0o5V29nRHoyNllBSGMwQ1V1TkNiRWdnZ1gzRjNKL3NYdTJaVUNs?=
 =?utf-8?B?bDJ0WHFrR1VGc1E0U09hQ05MSzI4YUM5K0g3dy80TVZxb0dtNUtoYWVLdjRW?=
 =?utf-8?B?d29jMU5Qb1gvcGRwdS9rM3I2VE5Eai96NE52MHZERUd1WFV1QWZqWkduVXBl?=
 =?utf-8?B?MzAveGw4VXUzNVdyWWhvTEZtYTNXS3hqUmE1Wjh3ZklaL3VrQWtOVi8vd3Z3?=
 =?utf-8?B?c0lKQXN3dXAyMVFvNy9BdGl2bitURVcwdjVNRUM3R2EyZ2UzQ3U5N01sQk9U?=
 =?utf-8?B?MjhnVjBIdkl0N2x1U0JmVVpRZWE5WVY2eWRZQm4vZ3FIUlhGcnJxdTJHSjc4?=
 =?utf-8?B?Ym5MNy9hTHpEQUFEaVdhcmdGVDVsQ0NGN2RKR0ZJdHR6Zi9RckVJR0VJWEFP?=
 =?utf-8?B?aFE0ZDFNaHB1U2ROdFNYekhQU2lkQmE2aDhxZkVyTVdETmdUNjBkRlJiY1M2?=
 =?utf-8?B?aGdzMzhKMUl3MmhXcm5oSjZQSHJzL2xWUnI1Y3JRSkJPK092U1FQRFVIYUUx?=
 =?utf-8?B?S0lSL2JnTGJBL1lIQi93dkx1WG1zVm1tTktYY1c2RWdZVFY3Q1BHTUJPT1c2?=
 =?utf-8?B?WXhockxGcVB3REtYMytSYXEyeU5mVVJYcjdDbEZHQW9DdEhzZmRiRGNueHRU?=
 =?utf-8?Q?2GcN+JdGfxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnFNaU9uSVlIWkllVmFtem1wNm9mQVZFZ1BiM1Q1N21tWWpPc0w5U1hxZk5J?=
 =?utf-8?B?TWFvMnFNSUtHQm9CL0ZUZ3FIS2gwT2tOb3Nua3BXdlhGSGdUQytnREFwclhL?=
 =?utf-8?B?dSsvb2RnR050VmN5OTB6UVBKUlBBb3ZySmRFKzJuTE81TnQwcHBPclVrZEt5?=
 =?utf-8?B?aytqY1MydWNVRDlma3p1Z1FHY00xa3BRV0M1aVI1anNPbHdveU9pZ0JLVGp3?=
 =?utf-8?B?Z1NZYXh5dDFwbkpKZEtRUG9PUnlyd3ZXZS9NRWQ2UXpKcWZ2U2p0a3lLN3Iy?=
 =?utf-8?B?ZTllQXFaVURqV1BnbmFUUFRxakNUUHk2MnBZemZOTk5JSnlTWkkzU2xwVzhk?=
 =?utf-8?B?SFZUZ1lRMUpvOEpVNzJ4RmxFZ285WmlBc0NoRzlBdzZxWldlbTJBeUtMVENw?=
 =?utf-8?B?SXVBOVp6a0tGM09QMk9qRU5wQTdBUWJhL1lZUkFZWXV5cWpIK09IQ3EyOWIy?=
 =?utf-8?B?M0FmNHF3d2FCbjVjNjlwbUI2dWg0WnJ1M3N6UXlKQ3VjcHlqSEp0czA1Y0RV?=
 =?utf-8?B?ZW9lbUxiS2FSeEpYblJYTEZ5L01lUWEzQVFKOG5jcWtNQmh1NUMyWjV3VGpR?=
 =?utf-8?B?TEFFdmFBb0tzcnhtOEJpZlhsNkZYQkVYekl1MGNDdVZ6RW5xaVZKSEJNYkkv?=
 =?utf-8?B?TzlGbW1tODRlNEFhU09BK3M5Wnl6c3hQTUZIblhFOXhlSGtmUk1XOE5BMFBp?=
 =?utf-8?B?UFhQVWIzcjR2SWtMSHVMMjVVSEUwOG1yeXhyUFJOTE1xVmVreUJocm0ydVpB?=
 =?utf-8?B?WVpWSXhMK2lCQWpUcTZQVENIZVhGdUpLNWxHVHlSVm1BTmFRSVpnRDdNUHZn?=
 =?utf-8?B?U09YNjU5bXQrdmt6c3l1c2o4TVhRUllHVmJuZWNyNTg5NGZrWWVyZVp0REFE?=
 =?utf-8?B?N0oreUJ4Z0h5VGJwZUs2cUNGendQM3J0Q0lMeVBhUzlWRDNUb2JCRWtONitm?=
 =?utf-8?B?Q1l3b21MVk11cW56VnpPWHQ1SkFlNnFlZ1d2YUlUWlNPRjZCSzEzUm03Wk9q?=
 =?utf-8?B?OURObStJcFMyRVQyZmthZ1o5eWZBcnU5b0NNbm5QSURCcjN6Z0lYZm40S2dH?=
 =?utf-8?B?eUpzaE9xNGgrS0FCTEJiSHZNd3VxdDAwMFMxaHJRcEVKUFprb0RMYm5mNU1X?=
 =?utf-8?B?OXdzMmZ6ZzA1UWh5clROdDJUYzNtSUlOcnNiZE5iWHNiQU1lc3dYZktLU2VY?=
 =?utf-8?B?U1RtSVNpK1hIRzFPZVlOaFlNQXJ5bnV0UHVSL1FRZW5uSlYzMWVmcmd6WjNF?=
 =?utf-8?B?Mm9XMUlEaVJvSU9ZYmMwV21sS3BFcmhodm9OU3ZpR2w5MmcwRGN3OWF6YXFh?=
 =?utf-8?B?M09USjRLdHJqWUFIem4rOVhrY1ArdmRlTTBCNWM3Y2tjcGhmWHc2U2RhMnFK?=
 =?utf-8?B?NHhFb2ZWS2VqdTB5SGFHUmc1eFZzN1VveGw0TUQrSHZxOVhoQTQrY0VNaXBJ?=
 =?utf-8?B?bVpod1NLMzNvNFVXSFRmWFVVWG02OExSSE95VmphRkwxMFJWeHlBQzJHWFMz?=
 =?utf-8?B?R3BCZkpBWkRMckFicmwzUW84VEFwbGVadHpvMDF3djdJTWxMSGhKVnVwR3pP?=
 =?utf-8?B?QUxJcHgybkxQZ1VaUE0wNkRsS1lNU0NqSXMwUis3aXp2czBXNjg3cU1JVEFh?=
 =?utf-8?B?TG9DUitpVnBPOEJJUVVFWnZYbGU5bHRIUCtMcVI4TWJEQktyVjlNaVVsMS9z?=
 =?utf-8?B?WWxjUFBUWHB3RXlJOUdGT3AvNVhyOE5GTFBmdmk5a2IyOXZRRkxBaSt6Z2Fr?=
 =?utf-8?B?WmwweEUwYVlSWWlod29iNEVCNzFLcmhncHBIUEtEZ2VxZjZGbGo4d0pKYXZT?=
 =?utf-8?B?bHY3NHVoMlF2bDJUVmhKTUpIVEd0bmVjVEJLeEhYNkZqOVZRdlVOaUNnUFpr?=
 =?utf-8?B?TTAyd2EvMy90T3NNY2VKTS9acWc5TUViay9BWmFIWHZGdXpGWlV2Y3ZoakFC?=
 =?utf-8?B?V3Y1Mnc1VTV6N2tRNzJGaHMybkw3NG1IaEYvUEdOaFpwaS90ZjFmaXZmSzZK?=
 =?utf-8?B?dzkySUhSNXZuVC82V1Njc2tudjB5YytuRFd6M3F3VnlQQmo5U0FGQkJwayto?=
 =?utf-8?B?c0hqTXhJUlpCWVJtNFVoaFZ2c3ZqQ2tmZ3BUb3d6czRLWEZaRDRVbTBGYXNI?=
 =?utf-8?B?Vk5wQ0M5aTVGM3llVUg2Z1Q2T0dQT1hnRE1OV3FLNVVscHUzUW8rSTEwczA5?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b215580-5b1b-479e-b3eb-08ddfa000e32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:47:10.3619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgf1nIGwPKZNaNEt729YHZwBRq/u+hsjyLRfJnb3BG3jJwTB43hQ7y/Uvmu97r5OaZ8upp5Oq1asLRV2vafNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8067
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

On Thu, Sep 18, 2025 at 01:00:04PM +0530, Satyanarayana K V P wrote:
> The migrate VM builds the CCS metadata save/restore batch buffer (BB) in
> advance and retains it so the GuC can submit it directly when saving a
> VM’s state.
> 
> When a VM migrates between VFs, the GGTT base can change. Any GGTT-based
> addresses embedded in the BB would then have to be parsed and patched.
> 
> Use PPGTT addresses in the BB (including for TLB invalidation) so the BB
> remains GGTT-agnostic and requires no address fixups during migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Longterm we need a bit of cleanup in xe_migrate.c to really make it
clear how the kernel PTEs are being used + kernel doc but as far as I
can tell this change should work with the current code base.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6fad5d469629..d375ebc9323d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -971,15 +971,27 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>  	return migrate->q->lrc[0];
>  }
>  
> -static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
> -				 u32 flags)
> +static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>  {
> -	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
> +	/*
> +	 * The migrate VM is self-referential so it can modify its own PTEs (see
> +	 * pte_update_size() or emit_pte() functions). We reserve NUM_KERNEL_PDE
> +	 * entries for kernel operations (copies, clears, CCS migrate), and
> +	 * suballocate the rest to user operations (binds/unbinds). With
> +	 * NUM_KERNEL_PDE = 15, NUM_KERNEL_PDE - 1 is already used for PTE updates,
> +	 * so assign NUM_KERNEL_PDE - 2 for TLB invalidation.
> +	 */
> +	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> +}
> +
> +static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +{
> +	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +
>  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>  		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> -		  MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> +	dw[i++] = lower_32_bits(addr);
> +	dw[i++] = upper_32_bits(addr);
>  	dw[i++] = MI_NOOP;
>  	dw[i++] = MI_NOOP;
>  
> @@ -1092,11 +1104,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>  
>  		size -= src_L0;
>  	}
> -- 
> 2.51.0
> 
