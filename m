Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED4BCA1013
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 00:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBEB10E123;
	Fri, 19 Sep 2025 00:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWq0HaY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADE510E123
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 00:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758241470; x=1789777470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FWvFbNYNBuOkv/R+lPqzjaDw4C+OqT7EoQxwlnhWJ/g=;
 b=IWq0HaY42w1tHIxh62vw9Ll80StG91VnqMBHqBJFyPGqrpXsRJRKW2Q2
 zneTtj9uBOVfdnA1IJEDcAEqnvV0RrONdxruJLJu6Afr8iy00rxxZvl00
 xoAynbx+G5cj0raG1DPVH5KOGu5ac/E74qhGPJYG1AuQVGeuHCS7w5K7w
 RVHGEeDUeQrsR5IQZmH/6Oyj1z2H67Wal3q1NQgQ6j7fpdoJScy9tRwr1
 7rI+cPqhAK83/sLKRtWbN/YnQpltH5EsQNIuxTPaqvvfxjKkzIb7L07O/
 dV+cqKqF7c0oUu2gIwsTynrAaRu4uIHnPg7wLQLmI5PUEURbDe1GVBdHg Q==;
X-CSE-ConnectionGUID: M/9T+ezOSvCA5T9nGlOhvQ==
X-CSE-MsgGUID: DXe6YcIuR5ak/N7rHHxWNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60516818"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60516818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 17:24:30 -0700
X-CSE-ConnectionGUID: Mg2pm7hYSbqArR0FANLtGA==
X-CSE-MsgGUID: Rvf+EqM1QHe8oNwSxq74ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="180118224"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 17:24:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 17:24:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 17:24:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 17:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9QtxjlUkc57sSZ1fTPk5HwqS7Npc7gM342AstLLqvLsAlPUumRzHG5NdvrQJ3T0XCGIBSb9rDJmOyqVBMPNmolPzPu5VSlWH5gS/trbGgBRh0XSC63zGpm1GWP6KYV3Tktu8H0XOipV7ZzirIPeTu78MRkl3SiwnrJwqEJJoaHJWq25srD/LJmX0bBVHT4Ttx+/1wmJGs29bWGvZO+qaHZWsjFAIwuv+iQQLbdg6pEnjKd+Tx7oWKquGQeKiggWElb7te1/sTejEtEBOULxXTYFe1vU07tccfJWILKJe2o3KED9xlulvdJY2D3Du/U5tMSWHP1O0sfPOYR5eSIKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4nmmTuGEnCSu2VdP31VnSkOGvMpz8jVnl+cKn9BGQ4=;
 b=feWAj+fXcMUSPNiB9Kq20G6NaX3dPEhf4cHZqHwUPQLbFoZKAI4cEmZj12SKFvRDgoXJpnvCbJGpHjV0vEGqtdWaywdjjjMTS9kMX4nH6c1RAto7bcTF5c8sVXjBIz9WlgaQUa58go+cLQ/rMXCHmh0BvMrn2MquMmlYhpiN0obDDX4MCCcLj1Oj0CB8Rbzxzy+IEKcpDa1Ngr1+ftarSTUxrKCnJwp7rICAVErw7geOcHNBhvqc7EW2LbzMQ1b9N+taUOcvzdvxnXKpUUd1deilAXGGgi15yvkqex6dyB/syQELGLTozhPIpHXNH0NqWJRvXKz9eNGbhOYCux2D7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 00:24:24 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 00:24:24 +0000
Message-ID: <3e00ec7a-dab3-4bf5-9fdb-a6d63581130b@intel.com>
Date: Thu, 18 Sep 2025 17:24:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_pc: Add ignore efficient frequency support
To: "Anirban, Sk" <sk.anirban@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20250916140543.3055778-2-sk.anirban@intel.com>
 <dc4de0b6-f2ff-4979-8a03-ba4bbed26d39@intel.com>
 <07809716-c6f2-419f-98b1-43e482fab11b@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <07809716-c6f2-419f-98b1-43e482fab11b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA1PR11MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 517b73c4-0071-4eb5-886c-08ddf712e2ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEZDR2p5d2Z4dVVLaHdleDB3TUZjMzkyaXFKZGFFcWRueDhOaHViRlpFeTB3?=
 =?utf-8?B?cFZhVWlBOUdGUXhLakNtYy8yUmN5RFRIcWZ3WlZydkFZeVJwSjMzaEplUDRY?=
 =?utf-8?B?UE5xWENhTjVrMnFvemRydFZYSFEvN3pnWXBDMEFHSVpBMmFBSUlDVHk0eC91?=
 =?utf-8?B?bWVWWnd1cTRXQkIyVGRnVlpMb1lKNzZ0aFNBUjRVbzRkZUFoNURLTE9oMkQ3?=
 =?utf-8?B?cHNXRGxQNTYvRkVjMzY1Q05oaW9SbExqMkJ6QlFIeFE3cVhzazVubmRrbkdY?=
 =?utf-8?B?TFpkUnFTZGlHVkVaQ2Vxd1o5VGtmc3p2QXUwa1pWbEwzMGhINkkyVTdib1BZ?=
 =?utf-8?B?aUVYeW9xOGFKOW8rOW5aOWN5TzZmM0NhanFGRDUxZGJrd21JTXNnU1dJc20x?=
 =?utf-8?B?czBuL1M2L0ZETWJKZHlZWDJPNUJ2c0Z2Skxwa2diZTRHN0RXOGlSOTYvM1Zm?=
 =?utf-8?B?OUtUZ214anlZcUhKVDJ2Qnl6ZnluYWswbUhvdEtXUXBuQytTcitlaGRlSjdB?=
 =?utf-8?B?bVhqMVpqQzdKcWp1Sk4rZTVGVXlaTFNWdWRCeERiK0ZBUHpQaHFnUFk4dzF4?=
 =?utf-8?B?ZXM3UVVOK3RxVTVSdEVKdlZlY0Z4K0NJN3Yvak5sd3F1MEw1dXV3NWR1V1Yx?=
 =?utf-8?B?bGE0NEVCVzBKaTJwL2pNajczOGYxRjV3anlqaEsyMlFrVUlLaXRCQjhnWFdD?=
 =?utf-8?B?MTBwaFlHL2s5ZlVnRkdwdEdhRUVPUCtzWUgrVVFwd2tDMnBDa2w5V1dqdjV2?=
 =?utf-8?B?VmJSdWFPNzRsMzdocGI3R2tLZmN3VkpKSFUwZndzR21BK3RUbzZURkZwOUs3?=
 =?utf-8?B?N2xRSFp1ZW9RbjlaVmpWRndhYjNDS1dvZVJoZytyWEZtRmQxOEJaT2VKbk1C?=
 =?utf-8?B?ZURraUJmQjJkY1MyUnBNTWxTNjhRcnpTWVV3WTM4ZmtOaWJWSXA4eFAzbW03?=
 =?utf-8?B?ZTVrSUdTT1BlNUtoNkdqekFMdWFaaVlOSDRha0dWQ0pMK3l5RTFSTVdHNkJE?=
 =?utf-8?B?NGFjTmRveGV5ZlgvdXBicUhOQ0ZGTjV1Z0UvREJtT2RvSDRtUjdXKzJweEZx?=
 =?utf-8?B?MHBuOVBsT09rWk5hTUNxZmNSY3FTdkNPNkZLNEQ3QTk0ajdPcTFWSjVKMVF4?=
 =?utf-8?B?MzFVbFhhb3dVVXEzb2J2MUw5Z0Z5VmtuZUREcjBXdFBFM3hYb2RsMytWZndu?=
 =?utf-8?B?Rm1yTC9wazlWS0RsYVNCMzR2SHd3bis3V3ZuYUlMMEc0K3RSWERldTYwdG9l?=
 =?utf-8?B?RDBkR2gzQWFkR1AzVDREM2lkdGEya2dmVXRrQTRjbDVpQXFVSzNlYmVpb3Q4?=
 =?utf-8?B?UGI5UDBXcnQ5am9vWHYzSTZUbTZPZHZORjNKWElKbDNuZW04ZlhoRWozZ0Nr?=
 =?utf-8?B?REZUTTlsWTRMMlBPRUlPUXdaL1dmVUNTajEyb2VIeDBad2s5azlyWURnTFlo?=
 =?utf-8?B?ZUJ4QW5aZ2liaWNOWGNZZVFRNUNxZ1NmSVJLbys1TnNTd2M1b3Nid3BBK0Ju?=
 =?utf-8?B?WGp3NkFDMkZRL0VKNEdmcm5FWnhQU201Y25Dd3V1ZExjVVpWL1BlVW4vamI2?=
 =?utf-8?B?b1BKcWVuR1BXSStCZjA5NzhmM0VOblJVb2V2NzdPRUVYYVlidjcxRGF0eFVm?=
 =?utf-8?B?SllXSENQam5lS3VQc3BMSTU3Sm53c05yVEpQeFh1eVhrcVNFYkxKVHIwRXZ6?=
 =?utf-8?B?dWZoZVF1OUNEcEdzcnpHZ0czajdWNWtZYVZhTldSczVsNWRNc3h3VUMxL1VW?=
 =?utf-8?B?QTdOM1BlS043dnNGYjRmVG1uRWlHbEFCclNZMC9NZ2Z6dnVjWnhoRGVpdXRq?=
 =?utf-8?B?ZVp1L1BUNnd6VDdzcU9FMW40bk9hNUxFTmRyb3dwQUl3aTM5Zk5qVUFqUE05?=
 =?utf-8?B?WlJEQmVOTUdhcjhCd094NWh6eUdBWWdnSjFXaVZyelNRU2U3TWorQlZudlB3?=
 =?utf-8?Q?atEjhM3hfG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVERlBzWjN6VjJ6dTVUM2pNK2M4YTNlYU1LVENjVjZ3eFhlMFhFZGpJaGtz?=
 =?utf-8?B?WmIwanJNOXpvYzRxci9ubWM5M3lTOGk4eG1iQXk5OVE5OFppcHFkSlVHdUFJ?=
 =?utf-8?B?WE9jalZ0c2trQ3RCS2gzb1JpOGg4OWs0ZFplcTM4YlFoK2UzRCs0WUlWaklR?=
 =?utf-8?B?WHZ4UExZK2tvMGRzdDR1TWY3d2lEZDdtaEVXRTRJcjBTNm90RisrQ2w0UUp4?=
 =?utf-8?B?a2JYTUQ4ZTdvd2tiZDJHeDlCMTdNdnZKa0dyNitDODdEQ0o1TmdVNWFGTVlo?=
 =?utf-8?B?TWdJZ2dlWFcvU2dlV3pJQzNWMUM5c3VYZVo0N3RqV0lxV05SOWFLTFQrVFJI?=
 =?utf-8?B?elJKY2RNSm90eFVXWnVtYWl4U1pJVC91ZzNxUUFaWEt2V0ZxVzhocjhwdDBL?=
 =?utf-8?B?dHg3Uk1IMXA0N3JlUlNPalBXVUR3MDcwSDRhT0c3cGRJUjlmQll0OGUvYXNl?=
 =?utf-8?B?VzNCZkU1ZW5wSXZRb3A3Sk1uOWU4RXhWMG5KNjFrclhCQzk0bU1FS3pKcFNr?=
 =?utf-8?B?WDg2WldTNEtaV01JZ0x4aFZMeWFGaHhGQW1ucGxpeVlxcnViUWFiZ3lya2tw?=
 =?utf-8?B?ZFN5MUNxbm1RUmRjalhzMXl1UEhDN3V5UjcwRzRkYlBjQ1lMN0NyaDdnTjZP?=
 =?utf-8?B?SjQxbGxwMGkyWjlISWU4aUZHM1NQdG9Wa1UrMVR6d3dYTVhGbDJMQUdVdGx1?=
 =?utf-8?B?dE9sQ2hWdHp1OFZOcnliZ0wwWVM5NW1ZLytOUXFsdWc0RXB3VWZYMVI5c01N?=
 =?utf-8?B?SmtzU29idFBrVW5VU2YyLzE5cmFUMVA1RFNXTTBVVkdBa3BhSDVUaTg1dW93?=
 =?utf-8?B?c20wckxVU2picUs4dkJ3NEJBNTNkSkc5d05EV0M3SGg5anNlY0hDaDE3WlBD?=
 =?utf-8?B?WHVEOFFJSWFKUkNFNkYrUStnT0d3alVvdFhUS25PZ29NQUVmUFB3cE9yODRI?=
 =?utf-8?B?MkFVMFIxVEtUVkJtZjEwbmk1U1R2TjJDdmdYY1c3TFlKbUw3LzBMaGtGdGhv?=
 =?utf-8?B?b3BTMk0rM1RjaWdUeEVnNzVTaVNtblhKQk9YK1JoL0F3VHRpS0djNnRIVndC?=
 =?utf-8?B?VTB2a3o4cWhiRGZJL1pBLzJ6NlpzSnl2REcyTTdEcVVzbjBoM2loV2RHa1RV?=
 =?utf-8?B?WlV3bHhVb2x6b2hFNzNnWlFkUHMrUW0rRm9QZVMrTHBMWGQ0SGFtWGoxamh2?=
 =?utf-8?B?ZzNsSXdjSVBNZXgrcHNPUUpJRFllNm1hejA4ZFdVdjFsczFGZ1ZqVjYxdXdB?=
 =?utf-8?B?RnYrS1h5QldVamptTzEwM2thaDY0T3JXQ0pLNWsweXRsbFY2bnpIbEVhZ1Q2?=
 =?utf-8?B?UFc3TFlHdUdPdnZSazkxUDZISjlISE9ENHVCWlRqdFlNTlVQQTBIWWdHTmdr?=
 =?utf-8?B?LzNhbGY2WVpXdmdqWDRLS2FSOTVoZkI4bGhTMnZ0bkUyNTgwZ3laQktEVStZ?=
 =?utf-8?B?NkZlN0pwdDJhRFVVN1FqZkVPUTcycTQ3UUUvTzZsVUxxdmgyMUcwNzQ2VGEr?=
 =?utf-8?B?Z1JwREpFV051Y2NLRTlmNW51ZlJxZkRYNEJiVWRRUDNTdHZEVytxUEdJd0pm?=
 =?utf-8?B?VGk0dURuQVU5ZkNkN0ZPY1VoTUJCejlYN0ZDQWdWZEZFc3dYMFZGV3RLdUpj?=
 =?utf-8?B?bExVZ2pnN2pxcjNtRVo5WldzQlRXbzVmUTVIdkhML1V0NmY2N1U4Q3EyTlIz?=
 =?utf-8?B?ZUUvSE1Sa0QxbmlzT1YxeFJ3aHRPaVpmR2xDeHdEVWl3SDhWdkJjcTkwVFZr?=
 =?utf-8?B?Vld0MGtFdmRxeHVOR0dPZjZDYUU3VG42Z3NSWmUzQUtEdTl1TGNQVzJaNVFn?=
 =?utf-8?B?eUpNc0pWWjJIM1g1RHJ2YWJYNzFSQ1V3ZUZPMDl2ZjRoMzFhMDBKYStRZDVW?=
 =?utf-8?B?YUVpY0NNUUxUSFJEWlJXZCtNTnFXbXVUMU11YmFkR0RwWTA0UFE0dWxXY1h4?=
 =?utf-8?B?cHBPWGpyOC95MTl3RjR2YlFyWTUzb3Q2OWJobVovaUd5MFdQaTFJcmZMcFQy?=
 =?utf-8?B?czlhaTgwb2M1SnZobWVVRmZuUWhJMUljVW44YnYwRG9mSGpqVlZNUHpNZ0Fa?=
 =?utf-8?B?TzdDNVJDWmY1UnZ4bHdBaXE3ZEVSVDhrTGJMYUhlS3BYTHBtQm1NOW9NbVZr?=
 =?utf-8?B?TTFjS3dIUjA5UzM2TTU5a0Z6b2lmNTgrNUx4SlBmc2sycGZLOUI0TFYxM1E4?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 517b73c4-0071-4eb5-886c-08ddf712e2ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 00:24:24.2941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAm7YoqzpUXt1xJRTz7AaOnLtmQYltHTgTJdlop2wOPTMpzi4q29NGMqw+0/n9S5IsSYFHDBgacgy6kPnn+wK7kPZTjuFYEyMh6Bq1BUb3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
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


On 9/16/2025 10:52 PM, Anirban, Sk wrote:
> Hi,
>
> On 17-09-2025 10:59, Nilawar, Badal wrote:
>>
>>
>> On 16-09-2025 19:35, Sk Anirban wrote:
>>> When setting the minimum frequency, GuC automatically adjusts it to
>>> efficient levels, potentially overriding user requests.
>>> This patch adds the slpc_ignore_eff_freq sysfs interface to disable
>>> this behavior, allowing users to enforce their exact minimum frequency
>>> settings.
>>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_freq.c      | 36 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 49 
>>> ++++++++++++++++++++++++++--
>>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>>>   4 files changed, 86 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>>> index 4ff1b6b58d6b..fb16fa5c6a0f 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>> @@ -227,6 +227,41 @@ static ssize_t max_freq_store(struct kobject 
>>> *kobj,
>>>   }
>>>   static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>>>   +static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
>>> +                     struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct device *dev = kobj_to_dev(kobj);
>>> +    struct xe_guc_pc *pc = dev_to_pc(dev);
>>> +
>>> +    return sysfs_emit(buf, "%u\n", pc->ignore_eff_freq);
>>> +}
>>> +
>>> +static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>>> +                      struct kobj_attribute *attr,
>>> +                      const char *buff, size_t count)
>>> +{
>>> +    struct device *dev = kobj_to_dev(kobj);
>>> +    struct xe_guc_pc *pc = dev_to_pc(dev);
>>> +    u32 val;
>>> +    ssize_t ret;
>>> +
>>> +    ret = kstrtou32(buff, 0, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    if (val > 1)
>>> +        return -EINVAL;
>>> +
>>> +    xe_pm_runtime_get(dev_to_xe(dev));
>>> +    ret = xe_guc_pc_set_ignore_eff_freq(pc, val);
>>> +    xe_pm_runtime_put(dev_to_xe(dev));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return count;
>>> +}
>>> +static struct kobj_attribute attr_slpc_ignore_eff_freq = 
>>> __ATTR_RW(slpc_ignore_eff_freq);
>>> +
>>>   static ssize_t power_profile_show(struct kobject *kobj,
>>>                     struct kobj_attribute *attr,
>>>                     char *buff)
>>> @@ -263,6 +298,7 @@ static const struct attribute *freq_attrs[] = {
>>>       &attr_rpn_freq.attr,
>>>       &attr_min_freq.attr,
>>>       &attr_max_freq.attr,
>>> +    &attr_slpc_ignore_eff_freq.attr,
>>>       &attr_power_profile.attr,
>>>       NULL
>>>   };
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 53fdf59524c4..0229a89e3ff8 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -336,6 +336,8 @@ static void pc_set_cur_freq(struct xe_guc_pc 
>>> *pc, u32 freq)
>>>     static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>>   {
>>> +    int ret;
>>> +
>>>       /*
>>>        * Let's only check for the rpn-rp0 range. If max < min,
>>>        * min becomes a fixed request.
>>> @@ -347,8 +349,10 @@ static int pc_set_min_freq(struct xe_guc_pc 
>>> *pc, u32 freq)
>>>        * GuC policy is to elevate minimum frequency to the efficient 
>>> levels
>>>        * Our goal is to have the admin choices respected.
>>>        */
>>> -    pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>> -                freq < pc->rpe_freq);
>> This code already respects the user’s request by disabling efficient 
>> frequency when the requested frequency is lower than RPE. So, why is 
>> there a need for an additional sysfs entry to disable efficient 
>> frequency?
>>
>> Regards,
>> Badal
> Currently, the SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY parameter is only 
> set when pc_set_min_freq() is called—and even then, only if the 
> requested minimum frequency is below RPe. However, after the driver 
> loads or when the requested frequency is above RPe, there's no way to 
> manually enable this parameter. As a result, we see frequency 
> fluctuations during IGT testing.

Questioning my own reasoning on the need to do this. Do we have a 
scenario that is failing currently? As Badal mentioned, IGT tests can 
just set min to <RPe, that should automatically disable RPe. Am I 
missing something? The added complexity here just doesn't feel 
justified(unless we have a known failing case that requires it).

Thanks,

Vinay.

>
> Thanks,
> Anirban
>
>>> +    ret = pc_action_set_param(pc, 
>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>> +                  freq < pc->rpe_freq || pc->ignore_eff_freq);
>>> +    if (ret)
>>> +        xe_gt_err(pc_to_gt(pc), "Failed to set efficient freq\n");
>>>         return pc_action_set_param(pc,
>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>> @@ -737,6 +741,45 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc 
>>> *pc, u32 freq)
>>>       return xe_guc_pc_set_max_freq_locked(pc, freq);
>>>   }
>>>   +int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val)
>>> +{
>>> +    int ret;
>>> +    u32 min_freq;
>>> +
>>> +    guard(mutex)(&pc->freq_lock);
>>> +
>>> +    if (!pc->freq_ready)
>>> +        return -EAGAIN;
>>> +
>>> +    if (val) {
>>> +        ret = xe_guc_pc_get_min_freq_locked(pc, &min_freq);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    ret = pc_action_set_param(pc, 
>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
>>> +    if (ret) {
>>> +        xe_gt_err(pc_to_gt(pc), "Failed to set ignore efficient 
>>> freq(%d): %pe\n",
>>> +              val, ERR_PTR(ret));
>>> +        return ret;
>>> +    }
>>> +
>>> +    pc->ignore_eff_freq = val;
>>> +
>>> +    if (val) {
>>> +        ret = pc_action_set_param(pc,
>>> + SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>> +                      min_freq);
>>> +        if (ret) {
>>> +            xe_gt_err(pc_to_gt(pc), "Failed to set min freq to %u: 
>>> %pe\n",
>>> +                  min_freq, ERR_PTR(ret));
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * xe_guc_pc_c_status - get the current GT C state
>>>    * @pc: XE_GuC_PC instance
>>> @@ -1382,6 +1425,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>>       if (err)
>>>           return err;
>>>   +    pc->ignore_eff_freq = false;
>>> +
>>>       bo = xe_managed_bo_create_pin_map(xe, tile, size,
>>>                         XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>                         XE_BO_FLAG_GGTT |
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> index 0e31396f103c..3a87d0da609d 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> @@ -31,6 +31,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, 
>>> u32 *freq);
>>>   int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
>>>   int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>>>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>>> +int xe_guc_pc_set_ignore_eff_freq(struct xe_guc_pc *pc, bool val);
>>>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char 
>>> *buf);
>>>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char 
>>> *profile);
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h 
>>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>> index 5e4ea53fbee6..c3b44598507b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>>>       struct mutex freq_lock;
>>>       /** @freq_ready: Only handle freq changes, if they are really 
>>> ready */
>>>       bool freq_ready;
>>> +    /** @ignore_eff_freq: Ignore efficient frequency */
>>> +    bool ignore_eff_freq;
>>>       /** @power_profile: Base or power_saving profile */
>>>       u32 power_profile;
>>>   };
>
