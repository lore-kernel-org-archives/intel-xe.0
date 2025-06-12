Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BFEC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBF610E116;
	Thu, 12 Jun 2025 18:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0L0ERrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833BE10E0FF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749754055; x=1781290055;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZE2/ITVyyclJcjlNi7+ErYquMVCz/eW/HU87PlnYhK4=;
 b=J0L0ERrh9JM4Q1hbrHbnPMCt3D8KiO4bYY0Dgu7DYKUF9g1gLsfHPARa
 Y/Iki0CfBJW+fbUPF5YXoK+Lnen6/q5bM535q8HHxZiEH1//w6dXgzfBJ
 XLMaWDCBh6Gj28WIPEXi5CYZEVCOQDEHh7kYWXxwRXFVwAbnETb8gn7qa
 DZE5fTdLUGVlJHXm5piyz3SJjOMhjySk6xrEdK7GhULW7Wq6NmRPEGEB0
 7uMro/10VgMUJxI5HgiGJ4dR46eWn+P0ZhIJ/JYEi1XzcRT08mqc4+vmu
 SwR0Bg0iF8H/ZBZ8rJrxpXcr3Ox1mX4xUgVzbJx/wNvfpNoxVT7+RZPIr w==;
X-CSE-ConnectionGUID: 5U2CBrkBQE6PCZHjC2Qh/g==
X-CSE-MsgGUID: oTfC4RT7RWKZZIGfUXrVMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69393490"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69393490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:47:34 -0700
X-CSE-ConnectionGUID: usPx3W12Rrm2O/qbaRVLbg==
X-CSE-MsgGUID: JA8HmF7gQba+Ib3qWFaneQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178572888"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:47:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:47:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:47:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mA211Zw+aq3xJ9w/DvfiDC5+jE0FM0JoJM2QU/1dc5u+pAQTLHWUMDWjmk1MUAIFlg10Cl2L54PH0DpivqYuOvKiJMfq6gWWS02NnpiETE9TTJ3AyVOIonYfT7Q6s6LOyu/oRSHZ4IbBeM+X8KDY1vX8zqUMiaw2v33IOvIlqvtExKbdaYbi2SpqjsIJ7N3oS98Tj63PiaR+wymywOfKnWMPvzyEDjauXl17M8+MNbtqf3tj5++ZQFmDjfIwmZm+JnsomOfzHhXBOiPwPyFY6yMGVbmuluV6Oa+M5Garo+wmub2ssB2Er9eHBVnsPTP/NIguNh4XhVlJCGzSiq5t3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpZODMLZjAQiNi2qXCNSbnmaNp9oE83mgDbTBUASdd0=;
 b=qvNYFpKPQusE3DPRUUIPd3qpOBHKTyTsoKcKrYIBkM/F69gsFjYLxN+gFqxnpn+2sWuq5TVPZqG+lDtWrKc2t0xm6CM7nNe0nJpLaarQ7l4RKrknnj8kIf2+XIpuMDJQjNX/53fdF4/g8vVaq/FO9706rtmCkNWWMLdPudF7+2yJSp8ItVhclh/HRRYoMMemYdpguXpa1YxRSPovR70sCZv7gWWhbx51o5HHZOZCDYVM3ssUHk0NaS9co2anxvzhFrqJaE6FZ9UYRYOC5H97/sGvzPYdIM28E9C0xjBy9YCgqgXdUr9vy3RFwszxsL41ny0xnUa3SX62axdMj2G0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 18:47:03 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:47:02 +0000
Message-ID: <733f6db7-ce2a-4f67-9c66-d44702a03ab0@intel.com>
Date: Thu, 12 Jun 2025 11:47:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
 <CH0PR11MB544461EFF28E40A16C84A175E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <f466922e-2884-4e42-ad64-4d1ce063b4fa@intel.com>
 <CH0PR11MB5444E69BE6FC406E515DC61BE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB5444E69BE6FC406E515DC61BE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:303:b4::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6e3937-364c-4eb9-e8ad-08dda9e1852b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJYVy9zUVNNQkpURjgwYy9NK3l4YTZaUFJnK0k5NDZrM0VKSFJoUjQ1Skx5?=
 =?utf-8?B?OWgrWlpmR29qVWhXRWVjcXlhaDdkTzcvbzc0UUFwN3FtWVM4aW1vT3NkUkw1?=
 =?utf-8?B?eWZzaTNSSGg5bFZtTklUZG50eGVDU01NU2EvVWZYc2ZMaDkvaXJCVEZQQWFE?=
 =?utf-8?B?eHVzeWhUbVp3bU56R1NET09PMGJGTXNPbFBoZ21ZOCtZODZlMEVONTVtU2ln?=
 =?utf-8?B?V0hyTEhXTFRnR2owaTJEYlNBMWhMSEU5aDJVcCtwaHJkeFB2eE9lanNLSFIx?=
 =?utf-8?B?UlV3bkxUMjl5SnpKdi9kdHB5d1lVZEFXMWppSzJFOVNuVWpsQVZjV2FEUnJi?=
 =?utf-8?B?cHBHQ3U2WW43V2w1OG9KRnZHK0xCdERkVExTWXZIdzAxUStaV2Q0WnlsTWd0?=
 =?utf-8?B?bWZmeFcyK0RZUzEyTzIyUTB5VExQQzZZYnd2aHB1Q3RQUnVDaThQS1lQOXFO?=
 =?utf-8?B?UWZBMXczWTNtSGFhUUVRVTBGWUVxWnU0djRGMjBwNVNyUVp0d0x5dTByL2Fk?=
 =?utf-8?B?N1JkKzE0Tm9XdWJTeWFjSjZyNms0K3RYaGVmRm1NQUVMeWRzNnR2LzFQcExr?=
 =?utf-8?B?Um45RlZ3SkxPS3pmc2hrcWh0T3ZacGs3QWlSTDd1VG16Y0ZsTWFKejhwZ0Zt?=
 =?utf-8?B?QUJiQTFNYWg1eVV1T096bEdiZGxmaWl0Y05mb1dNSlZHaE93VHB3T0UxTjdH?=
 =?utf-8?B?cVUzZVFnSThRT0tKTWJDMFBQSzBDN01PY2RVODM0Nm55SVVRSDB6N2doUmJS?=
 =?utf-8?B?SXJNM2VLZ3A1dCs3WERaaUhnYy93TkRPajJOck8rejVXM1Qrbm4wRmhnZlNM?=
 =?utf-8?B?Q0ZXcmNTc3JvWDNZc1l5NXhiNVRSYjVNM3hZcHZRdXBQQXAzQWE4cE9lUWxY?=
 =?utf-8?B?U2oySDJLNWw0UW4vcFNXTVowTXFwWHdZcDJEOXdZMkh1NE00MDZwemhSUDBU?=
 =?utf-8?B?Y3cvdkt0OXZjWkVTRGp1a0pscTY5UnR6YlpJNDVMM0h0c3BncHljOFVSNWky?=
 =?utf-8?B?Skh3eVM5bTBwZ3hxV1B6ZE9iNSt6SmM1MFJIY245cmxwSWQ0ZFdia3NpNFU4?=
 =?utf-8?B?SGlsR0FSa3dDMnY5VHBnQnZyaERXZEt3R1p1VEhwdGJsSTFQZ2x2M3RzTUNI?=
 =?utf-8?B?ZGxHZUJjUzBlQkt0NUw5endHa1FMUXZaZmwxa0k5cEVYb3NMM1pIdTdWWkhn?=
 =?utf-8?B?SWpIeFV0SC9rRTA3R2FvTzlJWUwwTDJhZjgxcUc2dk4vUGw0aHZZV1BCdDRr?=
 =?utf-8?B?MlRDVks5UHBQSUhUcDNiV2VVZHJuaWt0T2I5UWx1Wk9maW5OZ2RpVGRRVGw0?=
 =?utf-8?B?c2dha3N1blQ0dG5BNlZBa2FVWjBsZ2NZanZjMlFJVGVZK1dBTXZQOUYwMFpT?=
 =?utf-8?B?U2NwckZHVWYyejN6TkFwRmVUaE0yZWoyTldDT1E2U2tsQkNuMzZZU2k2MEJW?=
 =?utf-8?B?S3FCMVJLczdnRFU1VGYvSldTSGI4c0x0WlNTaHVTRjViNGFTaEtUb0RyOEVS?=
 =?utf-8?B?b1l3NzFybmlHSTdnL1orN3pOWENnLzROWHpUbTJ2bTE0SmRSWEtucUtpeXds?=
 =?utf-8?B?YzM5RWwxeDZ6ZXdxK0V4c2liU0laRnFpL2ZKLzVNelVmWVBwTTZTaVg3YitC?=
 =?utf-8?B?L1NEYmxvc29nRktESkhBdm1vTW5pQ20vMlNYeHdnMHp2Tnl0eDlhdUoyVm9k?=
 =?utf-8?B?YW9ibHF6dDVvV3ZVV0taVWhydWpIMmVlYXF4RWtCN2czY0w1aFBMQkhVREtQ?=
 =?utf-8?B?MjI5VVdIWER5Y0ZxSjFvZEUwMHBpajNVb21za0xpa3R5ZkJNSDQ2cDk1RzZD?=
 =?utf-8?B?VmhFZEM2dFp0NUpkY2VQdGhjVGJSN1RlNlNXTDBkSWNVKzVEMXVCek9SUHVw?=
 =?utf-8?B?ZStzeDVVUTB2cXRLQVVRbzFvMjBGaXJVNnhUV3BNQXp6T1BwbEZlQkd0bWpD?=
 =?utf-8?Q?mQOxz5Xwhw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdsYnNBL29kTXprNTA4U2FpRldXZmhoT0t4YWdtWnZpMTBvbGdPYk9oR3h2?=
 =?utf-8?B?YVE2YkRET00yQkIrZkF0cDFOSjlWS2lMc3NzUXRUVlNWcFhoTFRDTzg1NXZM?=
 =?utf-8?B?SHV4WUZORk1XWkZUc2FJN1RnWnZ1eW5BZkNoTXkxT1hwU3pCMFZNeVB1K3No?=
 =?utf-8?B?WnNPYUhTVlhNb2lCb1FPZkhFTzRmTUFISFlxVFF0MVYwZWw1TVh0YXZ0cnFu?=
 =?utf-8?B?Y0REbUJxendqWmVDQ1ZmYWhDKzVPQjlsdnpLY1lUZVQ0MTN6WS9NOE5YdUl5?=
 =?utf-8?B?enRraUl2Wkh2NG5QSG1DdVp6Z081VmdlTnc1NVJiVG90czBVclFIVFNtTTQy?=
 =?utf-8?B?SHBxNHJuMVI3cFFxNEtoczBPRXRQcXVnMWxQZi9pSWZ3WmE2UnpzV0s1MXN0?=
 =?utf-8?B?Vkh3TzlGMG80TXNVaUdsWW4xdmlEMlJVRDVjZnR5UlYxWlVMUjQyZ2I2S2ZO?=
 =?utf-8?B?bFY3cXFFVkJNUjl3bDdxYzVoRE5JU2w1UTdqT01QeU1hZ25ZOGNrMmc4bmVM?=
 =?utf-8?B?QUx3cFNONGZwbjEwbEFaUEF6N21nc3lSWXdMUWowU1o0S3ZHTEhjenNpalda?=
 =?utf-8?B?TElSejhWRDNhc1k0amN6Zlh6ZDg2NFRvdlYvY1RlTVNTVzVBc2E0M3hCeVhS?=
 =?utf-8?B?VXBnaUdJZ1dCK29vVDJ4YU1wdkJTTlZyQVJXT0RsWlVaRzRIWVgxblNNWmV2?=
 =?utf-8?B?N01lWFpvYjN4WlptVGdhTklRV2Y1VDJnamRIRjJZUXM4Sk56YitUamJQKzZz?=
 =?utf-8?B?V0VRbUdUSmRiNEZ1amhETEhhUjR2cEY2OVZOMlkrNmJlb3BOY3FKTDFSblhr?=
 =?utf-8?B?aG53U0RCRDI2V3dXMmtMSHFiZmJXMFZoRXU5NzlYNm9yaE4xaFl4cG5vMVU3?=
 =?utf-8?B?MktUeFhaWGhFZ1BXczd2VEl5amtwaEJNZzBxckpBS1RLZ2ZxeXVwVWhJeDR5?=
 =?utf-8?B?SzhROHNkSXQwVFJmZjdpRGhVYnRtYTFBTER3ZmZNcjluYWJDY0FBVzlUd1ox?=
 =?utf-8?B?Z21IVW5qdW0zQU4wUVZYaXMrZG1RbkF6S3pZcWZuenFFTmdTU1pUeU9ScUUy?=
 =?utf-8?B?RU1PRlo5U0g4aWN1dVcrRkxyOHE4ekM5RHFnSXZvRVJxMzNYTllnYTRVSERN?=
 =?utf-8?B?ZkdnRzlzNjdReThrbnlrVThZellqc2N0SFlOcXRaZkU2WkJLSmVIek1kL0R0?=
 =?utf-8?B?azN1LzBacURLTVhJTEJzSG1ueUVBTjlnNzN1UTc1OHo5bmlFZ09SVGdwbHNW?=
 =?utf-8?B?bUdmWEhJeDJRWWNRWjA0UW1yaCs1YWM2RFcwZXlNT0U3ZXdTODNXNTd0SkdV?=
 =?utf-8?B?TWZ2di9NR0lYQm1RbTUrcjZ3MDV3OGRPOE1mZXgxL2VYSEY2a1ExSHVkOGsr?=
 =?utf-8?B?dklEQnpTY0hOZGVSTHZMQ0FrbjhTRTMxQUc1d3Vkd1JlTm5NRWtYdVdaT2Jn?=
 =?utf-8?B?bkFlcEVpSWlJY3dOVk9JcUtzZHUrTXFQZU42NmNwM05JWlJYb2EwMC82ZFJD?=
 =?utf-8?B?L0dIdEVaSUc0VkE1TXMzNkloSTNzUjRoLzlqWjVFS3F4dlZnb2Q3SDNObkJD?=
 =?utf-8?B?SzZQZWFLZU5pczRyb01tWWdOMVVqR1BpbktTTVpVVUIybjlxMEsxMzJGVjhP?=
 =?utf-8?B?WUREOHUrNHVQN0hteGo0YlAyWkhOT3loK1V3SnNIUUhOV0UySGNUWnpqaEZS?=
 =?utf-8?B?Mk1XRjV4U2ZKUjhHT3hPb08xbGtPSEY4RW5ISUtha3JRd1ErNmwrdnNoNjZR?=
 =?utf-8?B?b1ZHeG5sM1ErQm9HdklqVngweG5scmg3MUlCTmltTW8wRFdwdWdJUldZQWQr?=
 =?utf-8?B?azF2VEVEQktzbzIwTFRzcFU1NXhkMHQyeUlEVzg3NmZ6RkFidVFXTGJob2lX?=
 =?utf-8?B?VlNqbEpCWUd3M0NwQlFGMWUxenRIbmVMNEJqNmpYL1Rmek9rbUZ5Si9TcDRO?=
 =?utf-8?B?MjB0d3JnN1pBUU1KZW5HemxIblhTckU0ckdFRGpTM2xLQllGN2w5QjA3MS9p?=
 =?utf-8?B?K3JOMDQrTnV0clVPYmhuai9hWk5xbXF5MWxlK1pjRWtiNHE1bWJnZ050bVdR?=
 =?utf-8?B?c3NWMkhjdjk2cXI5YzRFMWtpS1dRY1dCM1RxVkgyQUxoUHVlY0dMTzZZRVhU?=
 =?utf-8?B?QU5EOUEvbWtSSFZwbmZLMjFFNWQ4T2JUeU0zbmFHK0RXQVFRaWJCVndSU0xX?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6e3937-364c-4eb9-e8ad-08dda9e1852b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:47:02.6664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxv4otOl6PGHoL3iz+x6j2vdDABX1CY5p6btyR1fK8Lj9kGRnHDYyxND9W/J2/q2H27S94uKvmIn7iRgoX+/9GXs7nYqfC9J1jQg0/7wcsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4611
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

On 6/12/2025 11:27 AM, Cavitt, Jonathan wrote:
> ----Original Message-----
> From: Harrison, John C <john.c.harrison@intel.com>
> Sent: Thursday, June 12, 2025 10:50 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.FreeDesktop.Org
> Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>> On 6/12/2025 7:32 AM, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Harrison, John C <john.c.harrison@intel.com>
>>> Sent: Wednesday, June 11, 2025 4:57 PM
>>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.FreeDesktop.Org
>>> Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>>>> On 6/11/2025 3:04 PM, Cavitt, Jonathan wrote:
>>>>> -----Original Message-----
>>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C.Harrison@Intel.com
>>>>> Sent: Wednesday, June 11, 2025 2:06 PM
>>>>> To: Intel-Xe@Lists.FreeDesktop.Org
>>>>> Cc: Harrison, John C <john.c.harrison@intel.com>
>>>>> Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> The GuC has an option to write log data via NPK. This is basically a
>>>>>> magic IO address that GuC writes arbitrary data to and which can be
>>>>>> logged by a suitable hardware logger. This can allow retrieval of the
>>>>>> GuC log in hardware debug environments even when the system as a whole
>>>>>> dies horribly.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> So, this is basically a new modparam value that redirects GuC logs to
>>>>> a specific IO address?  I take it guc_log_target = 2 is the default value, and
>>>>> guc_log_target = 1 would print the logs to stdout, then?  I'd ask why we
>>>>> use 0 as a default value and not just default to 2 all the time, but I think I
>>>>> already know why (we need to guard against guc_log_target = 0 anyways
>>>>> to prevent printing to stdin).
>>>> Um, read the patch - "(0=memory [default], 1 = NPK, 2 = memory + NPK)".
>>>> The default is zero. And no, nothing prints to stdout. This is about
>>>> hardware level debugging. It has nothing to do with stdin/stdout/stderr.
>>>> Those concepts do not exist in hardware nor in the KMD. If you send the
>>>> GuC log to the NPK target then you need a hardware debugger (JTAG, etc.)
>>>> to read it, as described in the commit message.
>>> Ah, okay.  When I read "This is basically a magic IO address that GuC writes
>>> arbitrary data to", I thought that was indicating that we're writing to the
>>> in/out/err IO addresses, and that the data being logged "by a suitable
>> You say "the in/out/err IO addresses" like there is such a thing.
>> In/out/err generally refers to stdin/stdout/stderr, being the default
>> first three file handles of a unix process. File handles are not IO
>> addresses. Such file handles also do not exist in the kernel. And they
>> absolutely do not exist inside the GT hardware. My comment was referring
> Okay, right.  The last time the distinction between I/O as a device concept
> and I/O as an interface concept was relevant to me was about 8 years ago,
> so I can understand how I got confused there.
>
>> to memory mapped IO addresses, i.e. hardware registers. On a normal
>> system, there is nothing connected to said hardware so the logged output
>> goes nowhere. However, if you have a hardware debugger attached to the
>> system then it can trap those accesses and record the log.
> You know, sometimes I forget that the intended customers for these
> products are major companies that end up shoving these cards into
> giant server racks and not PC users with screens and keyboards.
>
>>> hardware logger" was occurring separately.  I guess I also thought NPK
>>> was a writing protocol and not a hardware address.
>> NPK is neither a protocol nor an address. It is a block of silicon
>> called North Peak, also known as the Intel Trace Hub.
> "The GuC has an option to write log data via NPK. This is basically a magic IO address..."
>
> If NPK is "a block of silicon" and not an IO address, then perhaps this would be better
> worded as:
>
> "The GuC has the option to write log data to NPK, which is basically a block of silicon..."
NPK is a block which implements a register which is written to by GuC as 
an MMIO access. The point of saying 'basically' is because this is very 
simple view - GuC writes to a register. All else is irrelevant. If you 
want the full details then there is a white paper about it. But 
generally speaking, if you don't know already then it isn't relevant to 
you because you don't have the hundreds of thousands of dollars of 
hardware required to make use of it. So complicated descriptions are 
pointless.

>>> It didn't occur to me that we'd need to directly write the logs to the
>>> hardware logger in cases of catastrophic failure because we already have
>>> methods of streaming the logs directly via the serial ports.  Though I
>>> suppose that we're talking about different "logs" at this point?
>> I don't know what logs you are talking about. This patch is quite
>> clearly only talking about the GuC log. Which is generally accessible
>> via debugfs snapshots or as part of a devcoredump capture.
>> It is not ever 'streamed directly via the serial ports'.
> I was referring to the dmesg logs at the time, though I will admit that I forgot
> there were classes of logs that never get printed to dmesg.  I don't
> personally agree with the practice and think that all relevant logs should
> be printed to dmesg if possible, even if only at certain debug levels or
Sure, lets write to dmesg from inside the GT hardware. I'm sure we can 
add that in to the next product...

DMesg is for super important kernel messages. Sometimes, it is the only 
way to debug kernel related problems because the system dies and 
userland is no longer functional. But it is absolutely not meant to be 
the default output method for all possible logging systems. For example, 
the ftrace mechanism exists precisely because dmesg is not the right way 
to log many things.

> upon direct request.  However, I can at least see why we'd want to store those
> separately in the NPK silicon block in case of catastrophic failure given the files
> they normally get saved to are wiped on system reset.
Nothing is stored. NPK is simply a transport mechanism here. If there is 
nothing connected to it then it goes nowhere. /dev/null if you prefer. 
And there is no file to get wiped. The normal target for GuC logging is 
a memory buffer. Any access via a debugfs or sysfs 'file' is just code 
being run inside the kernel to read that memory buffer and return it to 
the user.

John.

>
>> John.
>>
>>> The reviewed-by still stands.
>>> -Jonathan Cavitt
>>>
>>>>> I also take it this is modified on boot by, for example, writing
>>>>> "xe.guc_log_target=1" to CMDLINE_LINUX_DEFAULT as a part of the grub file.
>>>> That is generally how module parameters work. You can also set via
>>>> modprobe.conf files as long as the Xe driver is a module and not
>>>> compiled in.
>>>>
>>>> John.
>>>>
>>>>> Yeah, seems good.
>>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>> -Jonathan Cavitt
>>>>>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>>>>>>     drivers/gpu/drm/xe/xe_module.c | 4 ++++
>>>>>>     drivers/gpu/drm/xe/xe_module.h | 1 +
>>>>>>     3 files changed, 9 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> index e16d19b44bcc..9c0e3113f7d5 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>>> @@ -35,6 +35,7 @@
>>>>>>     #include "xe_guc_submit.h"
>>>>>>     #include "xe_memirq.h"
>>>>>>     #include "xe_mmio.h"
>>>>>> +#include "xe_module.h"
>>>>>>     #include "xe_platform_types.h"
>>>>>>     #include "xe_sriov.h"
>>>>>>     #include "xe_uc.h"
>>>>>> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>>>>     	else
>>>>>>     		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>>>>>     
>>>>>> +	if (xe_modparam.guc_log_target)
>>>>>> +		flags |= FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_target);
>>>>>> +
>>>>>>     	return flags;
>>>>>>     }
>>>>>>     
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>>>> index 1c4dfafbcd0b..fc8c681819b9 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>>>> @@ -21,6 +21,7 @@
>>>>>>     struct xe_modparam xe_modparam = {
>>>>>>     	.probe_display = true,
>>>>>>     	.guc_log_level = 3,
>>>>>> +	.guc_log_target = 0,
>>>>>>     	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>>>>>     #ifdef CONFIG_PCI_IOV
>>>>>>     	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>>>>> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-res
>>>>>>     module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>>>>>>     MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>>>>>>     
>>>>>> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
>>>>>> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
>>>>>> +
>>>>>>     module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>>>>>>     MODULE_PARM_DESC(guc_firmware_path,
>>>>>>     		 "GuC firmware path to use instead of the default one");
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>>>>>> index 5a3bfea8b7b4..4d978f6f26b6 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>>>> @@ -14,6 +14,7 @@ struct xe_modparam {
>>>>>>     	bool probe_display;
>>>>>>     	u32 force_vram_bar_size;
>>>>>>     	int guc_log_level;
>>>>>> +	int guc_log_target;
>>>>>>     	char *guc_firmware_path;
>>>>>>     	char *huc_firmware_path;
>>>>>>     	char *gsc_firmware_path;
>>>>>> -- 
>>>>>> 2.49.0
>>>>>>
>>>>>>
>>

