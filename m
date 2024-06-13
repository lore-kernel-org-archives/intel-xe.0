Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE23C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 13:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8117A10E0AD;
	Thu, 13 Jun 2024 13:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzvJI7Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE3D10E0AD
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718285701; x=1749821701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=DXE1UEPLjvWAZWdR41pBB7d/lt5JHLzQQK7TFmp6668=;
 b=TzvJI7Y6nQPESupgXFTWczUoq6pgP1RyF+HTncX4eWqER7G+LIrB3Ynw
 PRWA+mBbhoSrH8/IInDQrHEdxzo+3RfBGN75oETY3beBgBR+toSXP55vg
 ae0TT8+hKWMVoZ0BR+RL3JF+eLsggNzY+cvTJINUcJ/q0BvJxTIN28imd
 iSFvT5cmCDnCKf638IqS9gozLS5bem95TtTsrpZGeplBkwUQglEWHegCt
 AN3Aw8Qgvfap3YDzRxhVR/2YQAUY5kpS/YSxvaP6vXl4PSXWxBoD8zBuX
 PwuEzM6twSFrOuD1BgShMLC4ySMuVAPJX3kDBbkbGXpxSMZ6CQh04Mdv9 A==;
X-CSE-ConnectionGUID: YNfuzb55SgWO9BxCeU27dw==
X-CSE-MsgGUID: SmyJ5pVZQcmuQLBtAczYng==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26227178"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208,217";a="26227178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:35:01 -0700
X-CSE-ConnectionGUID: dyFqMO5VSWOie1ngK2m5Rw==
X-CSE-MsgGUID: Nbf1dFULSsSX80Z0WBpzZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208,217";a="44521830"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 06:35:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:35:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 06:35:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 06:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGGzffIyEyetOKAJaAm40HJoLdi2mpB5k90rm/tTmZFheOQhrMDa7555Gk60z0jnPhHzAFp6noEwNfUwPxVg0fku4DgRKDfnvokCzfQW8ZJj9MppKe+0S6o/vM3pxHgYbmRm8AJNrCQ1pmBM24rwgUGKZxn3lOh8M3AeliwVPgrNPRgbTBZ9xbSG7ieRyASCckJYzTEbO9Mx2jTlHUblTG/Y7G0ZfKzKwV8+Q1aVPWrUD3DfkVQoZTC/lgPzc/VkynYDNrAm/O1oyD8zOe4NevygxckY9qYR5ykTuvSKxJneVpEWGT1xN95O5t36V5LLwAmU4YZeyWs9if4jaFyGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6Mr5p6ysKjko36y6waP1y4g6XQiq0MqEP8qDnEVmjM=;
 b=Op7Rg96JQkc9rpXIzoalwMYN8rg41uDfYSZtFyE+RhkdBaOej+5uGevo7xfyGVnwkFjKJJ/LTa50YEL4+VYAHkaI4lw+6zn+IlSAWAinvAQ04RhVsOoOqF42KKI2NtwtSZXvdTpO22uKqMc9jA+1c1tBuH+SebQwGrHOXSi1uifJbnz4wowA7oE33OHd7Si+gQs/7ttfT4+FXt1Tl3w7xWe9VNgY80yHDLdMHA8ibJ+L3Nfcew6Zi8IdSexcDjOrcG3LID2BYyMSy+rFmFISxeUZdI/G9xboetopFvUlMh7T7Pmu3ryQmVCL78s7ZkKtTaye14X99p4QO30gPY1w/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ0PR11MB6815.namprd11.prod.outlook.com (2603:10b6:a03:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 13:34:57 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 13:34:56 +0000
Content-Type: multipart/alternative;
 boundary="------------zVYJU5GgnW04gzqhi0VHE7x7"
Message-ID: <8b1f2eaf-0f55-436b-89b2-457e2e412b46@intel.com>
Date: Thu, 13 Jun 2024 15:34:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Use correct check for being a VF driver
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20240613120749.2032-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240613120749.2032-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ0PR11MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: c3259c57-431e-4883-b349-08dc8bad9d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjQ3TjJPUzQ4Q1BnTXdnT0ZEaUpFVnRIVjB1SGVPdUcwVnpiWGp4aURxdEkx?=
 =?utf-8?B?bUdrL3lvdXlWd1lqcElJSXJWVkRyNlRZU0pDR1JjdlFvZThwZitVNUUzUjNV?=
 =?utf-8?B?MTJYUFdPY0JJYWZLU0VzR0M0b2ZITnhEYmxtMTY5WEoycFBLN29YcXBkdmlF?=
 =?utf-8?B?Zk02Q1Rlc2o5dnd0eXp2bm02QXpuRHVpWkh4bXZqdS9BbStmZnZ2a0J6L0sx?=
 =?utf-8?B?T1p3MUM2NzduczBITGRLT1dWTHVEdmcvVHNzWGpiZ2FwemdJa1cyN3krR1kz?=
 =?utf-8?B?cXlZWklQdmRxci9MNXNrclAreHVJVEd1MnZqWVZxZm5zcVRJb09rbjZOU0ZZ?=
 =?utf-8?B?eTJuakVZcmVPcUNteTAyeGVNWGtxeEFhSGlZOTNKYTdOWWR4VXNGc0l6ZVF2?=
 =?utf-8?B?amhBSE9POEwrQkVKcURaL2ZMT1laRTJUZFRXMW1yeFNNVG92Ui8xYmtobVcz?=
 =?utf-8?B?S1FvcEUzVkl4emRjVnlUdjBJeDQ5cU1UY1ZzakdYc2FsYVlxMmlaNGdvbzRQ?=
 =?utf-8?B?Y0RXamwrekhUK1FFVVlyM3hGWFNZaElVUzVYQnBtc1laMngxQ0dTYTJKUUpH?=
 =?utf-8?B?eTB4Z0taM0t2UUx6S3JjSnZtZEFQN0U1ZUkrUG82dlV3RW5Pb0NvQkZVTklU?=
 =?utf-8?B?TFhvc1pzZXZVWlN3a1g4UU56TndHbGhKYjdKaXNqRTF5czRSejJlMEVGVEdi?=
 =?utf-8?B?SnV1TDd3bWtkUFdIeTB6N3JYV0FLYVN5R3lmeGlSNFZVVHBDb000dVFHNmpI?=
 =?utf-8?B?MWU2N3lTMllkSGVEY2ZZa1ZmdUVvUWpka1g2OW9lN2JKNmJkNFZkZGR0OS9x?=
 =?utf-8?B?eEVCSEhvU0Y4VStHZVlaVVVYZi9HSW5IK3diRGNLM2kzWlMyMzh6eFIyczJk?=
 =?utf-8?B?UVZ6MlZXempicXpoVjdISURiR2NwSW4zTUdNME5scnJOSEJGL1lhdTBLNm90?=
 =?utf-8?B?cndWaktaWUR3YXlkQ3hNQVY1SGZ2R2FYQzdub2x4SFJPQVBYd2sxdFJuTWxH?=
 =?utf-8?B?aHVSMkxmZzMvS2huc0xPcXZ5SXFwK2J0QWp0Mkc0c3V5RXNabGc5MThjdFBa?=
 =?utf-8?B?TVdYOUxYWlJFRlRLZjYrTWZ2S3lJZ1pqUnE2NDg1bFYvcGM5T1RLa1BiRlpE?=
 =?utf-8?B?Tk42Um82RmVxU0Z3Y0R4T1d6aGhCQWRIT0JRek54SE1idXJKejBvbkpNQzBV?=
 =?utf-8?B?SU9vTzZiZEIwSXVVUkpnMkhKYWNjWTJxdVlxVEFsV2dOM2orSVJoc1ppU1Vw?=
 =?utf-8?B?elNUaHMzUmxWOEtJaVRQNUtjOFc1TXNyZ2lMSXErYWc0K3NhTTNHSFBkejBW?=
 =?utf-8?B?Vm1xSFJ5TExJaC93ZVJZbTZ2R2NkZWVXYWJDQ3Bmd1R6TmNvVko4MW5UUW50?=
 =?utf-8?B?VEFnTlVSMmFINzRQbEp0OG1CYmpYcmU1RjVKVHBQZ3VvZzlyd3U3bENCM2M1?=
 =?utf-8?B?bTlFMzY2MWFodWFvMkZSQ2RWVmZNUWNtby9uZmF0emthWDB5Wi9UTmJ1Unda?=
 =?utf-8?B?SGJWNmtUTWtzZEMxeXRsTm5XOHMwcmZsZ2xNRUUrUTIwandLMDJpOXR0d3h0?=
 =?utf-8?B?TUx5YXF4S2s0a3d6ODFvdEYxY0l3ci9UV3NQQm9NSVlrZkNOZjR6V3h5TVh3?=
 =?utf-8?B?cWpsMEZyTENqZXNJRGpvdXlPS21TRGJvZUdmNG1RbXZtQmZJUm1qb1ZCSUk1?=
 =?utf-8?B?RVJIaFExeGxsRy9rbkVrcnI3cFhncXdaOHBYMmRZa0V5RElJQ21TL0MxNzdl?=
 =?utf-8?Q?ESm+zRLrUpm/zA2HstWUeelXmMNicqE+6oOgcvD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1nS2NrOU5qMFpjSVR0cFRlWHdtdi8rNzdLeHZCU25DSzlobnRVYW9TajJx?=
 =?utf-8?B?RFVEYndtQlp5TVIyMWtkdnV4TEJxSGo1My9ZbytSRVpsVHFTV3NaZUFPM3k1?=
 =?utf-8?B?TWwzUGV0Qy9LcXJiSDdISE5SVDZkWnd1VWtaSjJvWGEyYWtKampHaFFTcWl4?=
 =?utf-8?B?d2NlN1FHNC9JQ1czazZTMkowZGs4RHc2UWxCODNKNTBKTmF1eWtOMEI0Y0xh?=
 =?utf-8?B?ZmFIYU5ETlFqbVVPU3U3T1NxTGdpbCs1ZEpWUTBSbnhwanJZYmpSUll2eUZX?=
 =?utf-8?B?NExwZzRSVzVvWkpGN1VFaVZhc040QWVRZGJ1V2duclNUMDkrdFdlcko5YVdF?=
 =?utf-8?B?bGxqS0owbkFVMFNSWkxHeDlOZVVXUDZiYk8xbGp3MEVmU2pBdHZWck5vcy9m?=
 =?utf-8?B?TVhsWWJkZUZIcDdoOWtHTFBqN0lyQWRFNloxeG1nYjh0VVhFWUpISTNYUWdE?=
 =?utf-8?B?NDlvYW80T0hDT3pTbW1va2czVm9mU3lmZ2ZzbDVMQnZOTitTY1ZSclRzQmda?=
 =?utf-8?B?bjNELzQ2V0JhazBQTmVCaW8vQWRSOTFRY0hPTUcrQ2xxenFOTUs1RnVkNVBm?=
 =?utf-8?B?VU1wUWJ0bWt0RWVOVS91bVZBUk1vSXJPdjU5QTZPZGRmdHUyMThtcU5HSmZY?=
 =?utf-8?B?ZHpxV3JBUXFham1kVU5NdG9uTkMzanZ5R0J6S3BwTlpuS0liUTdXaEQ3QWI2?=
 =?utf-8?B?YStNTmJwZTJZZUUxSmZrY0pIQ2VLVHVjcE55MWFpN3dkZW41ZEZ5MEo3TUdI?=
 =?utf-8?B?ci9xYnNvWjBLbEhsekhJdWJGeStuNC9BVEIrREJNN2JlUkRRbXRiUXYvQUNV?=
 =?utf-8?B?V3RKUkJEQnRGbytrK0p3RHhMSUdMUEFJVG55QXdUd0VqQXJCL0JTYjNiMHRB?=
 =?utf-8?B?MVRQWTZjNUZ4V1ZqVWpMT3J2cCtTbFppRXhIVUlBQlJQK1NPL2ExUnhlcWt0?=
 =?utf-8?B?SWp2SGpjR05tUGJzWE5JU2ZIVlhkWjJCZ0RnWTRTVHVoMFIzUEttZFo0UU04?=
 =?utf-8?B?RWNJektBdlZ2R05zcVRRZDMybytVOEp3bG5kbWVoZ1c1NzdZQUV5WkRvSWJE?=
 =?utf-8?B?N3pGclFFQlJEV3lhZDNoUnBsVzAwbkpDQUZYM0l3UVNJNm42TThHSWE5VWp4?=
 =?utf-8?B?Q2ZyK29xZXVZSVl0N2UwcXI2RnFMVzNMcnh3eUszRWl1VXJnb0N1eExOR0FV?=
 =?utf-8?B?TVl3VWZRUnVTdnB0N0dKbHZNczBXeXkyV2sxeGNOZmtSR2p4MHhvS0NpNHR0?=
 =?utf-8?B?TzVOME9aQU9YNnJUbXFidDFaNDZiRDR1V0JqUHVlcTZyakpaYklzOURQS3pN?=
 =?utf-8?B?c2Y2dDR0MWU1YnNWZDhNb3R6Wjk1bjBaSHhRak5IandiSTd2UllSYW12Wm1q?=
 =?utf-8?B?aFJsMG42Q0xJWGNOVHQ5NVZFbE1XY3QvSWxyWjlLM2I5aGkrYVNHSlQyYlJa?=
 =?utf-8?B?MnB6ZmNMTzhPcHZ0VUliczYrZU5xU2tITkIyb1Z1Z3Q0aDVZSjYra1ZIcWpQ?=
 =?utf-8?B?N0hoa2JVdGlHdFBtbjlKZkhzZlh1RDY5ZWxWRWl1OFUxN3QxVSsyU2ZxaDY5?=
 =?utf-8?B?UmdWR1RnT0NEc3Q5Wm10WHZYOHBDKy83cGZ6Tk8ycTZ4bVBvYnFSSDhQN3Q2?=
 =?utf-8?B?YzNpQm1idzdxQzJ0RHAxdWpJS1hYcGJmV2hpUUQwWHlWVFV4R2NFbXNjTFdL?=
 =?utf-8?B?Nkt2ZG56VWV0dUlKWU40VmJtU0RCNXVxUU0rSkpIbWNmQlRicGxRN3E5OEth?=
 =?utf-8?B?cTlsU2VXNkV3VkErR2xlUy9KKzF1ZjAvY2RidzRNZ3oyR1VoSkdKM1FYSElv?=
 =?utf-8?B?RHZsbWRyUEtmRlV2ZncwLzM4YTlReVBXSFNVTUl5QnVHZnowWmhhbUZxeWpR?=
 =?utf-8?B?Q1VjZHVvNEN3aEM1QWk4bGgzYWJUWmQzSDdzV0FZcVhncGRmVWNQMEEwcFl5?=
 =?utf-8?B?cFIyY3VadG4xRHJ4VG9UbmJNcW80Rmh4YzVHd1pEZFUrSm50Mk9heWJRWlFG?=
 =?utf-8?B?bWFwNUpjYUQ4ZU5FVEtZbEhPT05WMmhoakpKbm5HcXN1WmV1NFpZK3kyTG84?=
 =?utf-8?B?akQvSkdQWTlJUE9Fb29SV1djeHVXQ3YxQjQ3MWxvTVRHL0kwWEdyNDc5Z25x?=
 =?utf-8?Q?HCNhJjg8NrNR+z84NcJBU/ZHQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3259c57-431e-4883-b349-08dc8bad9d4a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 13:34:56.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiU836LlYXkWqfSr0zxQ5YoEo0ba9XwJnNwsEoq7ddBjgyTyas5x+Cv+WlYxRPBBeqrEoq0R/GRkHEWctgDsLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6815
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

--------------zVYJU5GgnW04gzqhi0VHE7x7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 6/13/2024 2:07 PM, Michal Wajdeczko wrote:
> The IS_SRIOV macro returns true also when we are running as a PF
> driver. Use correct IS_SRIOV_VF macro to skip force-wake management.
>
> Fixes: 513ea833c201 ("drm/xe/vf: Ignore force-wake requests if VF")
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 5db6926120c3..b263fff15273 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -97,7 +97,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>   
>   static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
>   {
> -	if (IS_SRIOV(gt_to_xe(gt)))
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return;
>   
>   	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
> @@ -108,7 +108,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>   	u32 value;
>   	int ret;
>   
> -	if (IS_SRIOV(gt_to_xe(gt)))
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return 0;
>   
>   	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
--------------zVYJU5GgnW04gzqhi0VHE7x7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/13/2024 2:07 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240613120749.2032-1-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">The IS_SRIOV macro returns true also when we are running as a PF
driver. Use correct IS_SRIOV_VF macro to skip force-wake management.

Fixes: 513ea833c201 (&quot;drm/xe/vf: Ignore force-wake requests if VF&quot;)
Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff">Reviewed-by: Nirmoy Das </span><a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff"></span></pre>
    <blockquote type="cite" cite="mid:20240613120749.2032-1-michal.wajdeczko@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 5db6926120c3..b263fff15273 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -97,7 +97,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 
 static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
 {
-	if (IS_SRIOV(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	xe_mmio_write32(gt, domain-&gt;reg_ctl, domain-&gt;mask | (wake ? domain-&gt;val : 0));
@@ -108,7 +108,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	u32 value;
 	int ret;
 
-	if (IS_SRIOV(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return 0;
 
 	ret = xe_mmio_wait32(gt, domain-&gt;reg_ack, domain-&gt;val, wake ? domain-&gt;val : 0,
</pre>
    </blockquote>
  </body>
</html>

--------------zVYJU5GgnW04gzqhi0VHE7x7--
