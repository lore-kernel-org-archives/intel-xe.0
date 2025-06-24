Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4D8C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 13:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129D110E055;
	Tue, 24 Jun 2025 13:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOIlY1SC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48FA10E055
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 13:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750770626; x=1782306626;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/wuTjCB7lW23MtWHXZSoVyP3Y+CNN5XXQmwDiqRJD7o=;
 b=DOIlY1SC7tOBjCDathEYdSSFzpg5tEObLi0At1HnAbz5p8DKIOCvGqWW
 9JMJntxAMkC8TBhHytbLXZ9AIBzCoNl5h/jCe+7FdISYEfpPbrcmoNQ31
 Hi4ksz6MXFRUbGkLTSF3A0XH+h+1gpCOe/XK0A9f6SoksZiRyztS5VvK7
 ci04tQhlu9amMQwDauD8ihUGLQLiK4ql3d0BSKDh4B6Kv/Ab5iTZuERDr
 UvgWA5k6ePMGDhzDsz4/NOUhF8X2QrjuusA4nIh3lCZfDLW6gBDn0/WYX
 4XAbLApIozvaE+ZRHulhtZx17trSMuEQ3v5iJVjXoROqcHl2mw3PX4TNq w==;
X-CSE-ConnectionGUID: ezbvoB4wQLuFcAWNDK1vWw==
X-CSE-MsgGUID: aLGC58SMT1W0ohLHMPMZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52877205"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52877205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:10:25 -0700
X-CSE-ConnectionGUID: s52udvSUQQOabDpiYsx0vQ==
X-CSE-MsgGUID: oxt5uHyATj6RgyQNEFobbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="152413586"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 06:10:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 06:10:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 06:10:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 06:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fL/o+3T5Dycal1/hLeMEZmTrNR+8bgRrduWMFzvDQCJLaxT6yonn6Q1lPVK/NBa7gnOhKhmUwjbuKcfaunDlTcnFyGBgwqwGh16vHhdQeiUSG15BXt1fOq7MHfp07vHal8WB9Vof3dkcdxuNFmPPkHS2YtCYaL6JLvqqQSFg+hpB2THPZPeNFVv635G7uRE5nyVkTZh9PnA/kP0P3eThePwf8G85o4DtRXRdNQIe5gQ6D2OlXjzZfoXdFSFS9gJFd04+8L2dzg+bSGxOy7TpUNJD4E3R3DM4MF4SBfggGtHZyRQ11G3OFkxtk1rNIqOcMVDr1ncBtILOnThJAK99lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go0K+1pswt3rEVMIxnZ96R6PgQKsJkxKP3N7yg+CRhw=;
 b=TOb56mbhBpMS687ri/ExD9VmSuqSghYhwuvOSWiPPrs8fG9iRhCQeKIhFOSYFuWsZ5Ol1h88qfQjK0s8QxX/k7FvuKbuyt6TsRhmWM9I2WUXemxqDDOfN03yT8oEfaD2zLlKzRU9JytPU6h79OdAZMAZ/YnuvAnVSstjU1lNf1UOk5jCQQ0OHPahtgACxrnbo3gZhoRwi9tJRBH3FnViCWDbhseUhXUcRfMyI3AUoqWerQ/oQeVXVUYWHdPdhLHNbAhqz6fpxoEFDkfhl+DnEYJ4pJ2M8DTOShE6PBK78t1ujN7Nzkh31nRRT7DrIaBKGLyxYB2g0EPiQavDFiG+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 13:10:22 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 13:10:22 +0000
Message-ID: <f934197c-e4bd-4515-b225-393332b78060@intel.com>
Date: Tue, 24 Jun 2025 18:40:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Content-Language: en-GB
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nilawar, Badal" <badal.nilawar@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
References: <20250620120356.3289744-1-soham.purkait@intel.com>
 <20250620120356.3289744-2-soham.purkait@intel.com>
 <CY5PR11MB62112134B7E3BECB3514228C957EA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <CY5PR11MB62112134B7E3BECB3514228C957EA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c6317d-61a7-4f7f-bc85-08ddb32079a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWFWSUJSSTRPQlNSKzNnZGR3NCt1NjMrcnR6ZXQ3REdQWnpYZWZDUnp4dXAy?=
 =?utf-8?B?OWJjTjlBNkYxMGtSL2tObTU0dmFPdlpmaHJsKzQyZkpHZGlaY0ExeDJMR1dt?=
 =?utf-8?B?bFhldDZVUTYxeUhld0czWlZ0blZqalJKOUk2Q1gyV2M2bHU0TmhDQlZRT0Z2?=
 =?utf-8?B?R3hSbkx1a1NCSTNjdWtxYVJDT3JhNkZ0RzUvNFFQbDVxZ3JPK1pUUmovYW1C?=
 =?utf-8?B?WGFXWG16VmFudk5RNGJIQ0Z6Z1ZxbTFNTzUyUVI5VTdPS1RzSlptOXoyTEhz?=
 =?utf-8?B?WDVNL0ppbnhtNFpGcXZqM1d0cDJRekkrUG1MOUFXTm5MbW5OaWM4TEFHWXVV?=
 =?utf-8?B?TE9nOWFZWUUvOW0xSHVNL2NnQlg2MURHOGxObzJQai9nZTg5VS85eUVsSlA3?=
 =?utf-8?B?MzBPcDNxWHdEdlRlZllXOTNBUTM0OHdtN3l0VGY4M3dHNWlvWDc2VkgxRUJk?=
 =?utf-8?B?YlV0TzdvKzNWSEpoaGYycGZ4WUhpalhZK3FrNG4vMnpwekRjU3M0NEx6clJx?=
 =?utf-8?B?TzNyZHNSM1kxbXdWTFJDUTJsZ2kzQ1d1WWg1WVlFWHZqbXBZdmRuOTRlZDBV?=
 =?utf-8?B?N1RCWW5CcFJrb2R5VUMwOEtwZjMxaWNxbkFIZEt1UWJoaDhPaStISU9yYnZi?=
 =?utf-8?B?cE1ka2o1cDNpdUlCajhOaGh3Vmx6UnZ2Y0s2RUhrYTBsSlFxUXI1czRGTGpK?=
 =?utf-8?B?NFdhT3ZuRXYxcWZSUmlBZW85RUwybldtbzRYUXdtOTk3dEVLRktHckk3WFBJ?=
 =?utf-8?B?bGxnNWg4STMzbVdRb2hWZXphYVg1OFZCWXBVZHhvSXl6aUM1SndyNzBOQVpN?=
 =?utf-8?B?MlJpc1RydC9WZDBBak80cmYzTnY2dXZuMklBelU5dnBPZ3cxVVo0V3p3UFBH?=
 =?utf-8?B?c21qQm5rb2VTbldqaFNQTVVOSEJLR1VNRDRlRksrcVk2RDBnYWpsRjg1eFlE?=
 =?utf-8?B?MDIvVGRQSE5oeSswNHV4UmRENHdXam5FQzlPbXdnVUdGOFRPWkZ1cmZyVnhp?=
 =?utf-8?B?RElrOXV5T0dmbjNpbmdiUk41b3gvRDRQNWt1ZVRnamxoT2VkZDIrYUdyRE9x?=
 =?utf-8?B?TlJSOXZHOGhXb21sYmdPYWcxWGlaNWdIc0ZDRU82T1pIcG1jRHJZK2grNmNP?=
 =?utf-8?B?eTROeGFiUEZIZ0xSaUxYYy9iMkx0VG5SU1BBUG9MelkwZ0xLMUlLWGlRWldm?=
 =?utf-8?B?TXBpSlRBN1JheTFrbUhXYXRiRUt6d3ZJaks3MTNaUzhBTUE2anREemFvclNv?=
 =?utf-8?B?dVZJTUpISnVQT1c4L1VsdHpnNlhPYjRRUktnVTdacEVrdE56VjV4WmFLRHVY?=
 =?utf-8?B?Uk9ocWhOK2srenFmblQzT1VXWGRKN1BvYlg0OHpubURwT3ZCYWE3Sk1JaHpv?=
 =?utf-8?B?VW13cnRrQ0gvY2tIOEgvVlB2SnpnSTRFTHpCZmc3ZUpWREdmSXBCTmRiRFFM?=
 =?utf-8?B?c1E3UG9yOUF1MFMxeUhvc0lZSG85T1F6MEtxcU5veHI3ejdPRFQ5N2daalBw?=
 =?utf-8?B?ZTk0RmVQRjd2ZTRhbzdxc1hkZVFlYzUzQXVLbGdrdmZ4YkkrZTNPdERsazND?=
 =?utf-8?B?STgzeHdUV202dy93bld5enFPa2xmMEJrcXh3YmVRMEFuekRmMWRpbDAzZHQ2?=
 =?utf-8?B?bEo5TXRubFZpKyt2SWRGMjIxMFBlRC9RMGwzbHZHUGpoZVIvOWZjNVRTR3hm?=
 =?utf-8?B?dG1DUUUySndqajBnayt3L1FqY3NhclhxTW0vV1NQMFdwWDBVY1k2NHg5NFc0?=
 =?utf-8?B?VzVTMStUZmRSZk9nTWg4ZW1XQ1dYdlVsWER2UkZhUExGdVhsZTkrLzFNdTI0?=
 =?utf-8?B?WDN6UU02TERiRVhoaEJrN3R2bEJmSnhiVTlEYWpiYXpVZlJDZGwrdlh6U2lR?=
 =?utf-8?B?WVl5MjVkZ2lkc1NKK3JLNG81Q2tlZFdweUxuT1hrS2VSOEt6NEl4Mjk4VHB6?=
 =?utf-8?B?YkdnbDdIdlFvdjg2bnFmSCtlTHpjOTdwUzdVc21TMDRyT3hIZHJQeFRRT2NJ?=
 =?utf-8?B?cVNtcmNINTFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhudlg5TjdZVFYvMkt4U0NldFJBNlEzVzR3eERWUDRMRndIcnFGckdSY2I0?=
 =?utf-8?B?b2RwN1FrVUNCczNiK1pmZktHRkxXdFlsVHJKNkRyQmFUdE9heXloNjloWnhm?=
 =?utf-8?B?MVFRcjdHd08wTjk2M01rcHBlaXN2aGIrQThpa2d5WGxsK3hyMEFVOWZGWlRz?=
 =?utf-8?B?akRNUVFmTVkrMFRuSGlKMFg5TURHcmZQNVVDczVGNnRtekVSQnhObUFjNnAx?=
 =?utf-8?B?TEw4NmlvQkFFaThKNUJpL2tHaXd1SDE3UHE2WHZjajQvRVRDZ3VHeU5Qb0Yz?=
 =?utf-8?B?VjgvWWs2K1FsWXZ2dlZnRTVESk5kY1RweDZpa05yZ2xvMWZ5eTY4RDFnZzVY?=
 =?utf-8?B?RlRDOXlWcGpwaWtOYzFqVTdLMVN6MUdUYzdHMy93UTZ6SUVtWlJvY0dqM0lH?=
 =?utf-8?B?ODVTeDVCaGw1dDlHRXh2N3JPVUJWSUVYOUZHZ3ROMC85T2VEeGRrZEVlQm1j?=
 =?utf-8?B?RWkzZ2ZvTm55OHlrVXRWalh4Vy9IY0RKWkVNazY1K05tc2U2Y1BhUHhpMG43?=
 =?utf-8?B?L0ZRNzgvdGtQUTc1ZVd3WURvcDB1R3J3eVNoY0hiRE1JMXZQUVR5Z0FJRDZw?=
 =?utf-8?B?dGdsVGpUY0FJclJvb3FKLytxZXIzelVNTFo4bStBeW5IWDl5S3l3cjBFcmIy?=
 =?utf-8?B?NVIwOFkzUS9WR3JIckZCTGI4Q2VmdUQycndZbzEweGUxZkgvRWdmNDAyb2k5?=
 =?utf-8?B?RzF6WG9nNlQyenk5clhPMHBTbGtvMlNCL0orempPNjh6bE5hR281Y2djV1JC?=
 =?utf-8?B?UFN3WWtoemZ4MkpmYmlWVk5LUDBOWFJUOWJRZmJBZmNoL2QydHJmTEVweGZJ?=
 =?utf-8?B?MEJwNm9yY21UMTVoZjgyTDVCQnJnNi9JcVNrWjZTZDU0QjZzTldPN3VWb1FD?=
 =?utf-8?B?N2NuTzZ4MnBpQUpiekZPWnBOTnR6WEtlMExYMDFIcVF0ZVVwN2xQemllK3ow?=
 =?utf-8?B?NEtZQzllc244UWYvL3ZMZFdncFhGaFhWQ1Q0Vkt0cEplZkJKYXMwbm1RVjFC?=
 =?utf-8?B?RHFPaU5qZWpaY2loZmhRYXdVOGc3dUtwdlJaSTB2UzdSdFJXeHN5SlhmN01M?=
 =?utf-8?B?aWF2by8xemM0cE5STVNad084R0VYS2czdmNrMzVjZzdsQTMyU3hTK0wrYVZ6?=
 =?utf-8?B?cTNMcmpSaUtaYisyVVp2eldGVnh4clJyQ0d3NWczUVZvZFFEY0hqaWlBVFVH?=
 =?utf-8?B?S24yMWdBOEVTY0ZDbE0zWFpsWlNHK3NhcVJYYnRzbFJUU09hNnN5ZmozRlBU?=
 =?utf-8?B?UUFGaDh1RVpoMHpHN3RQQWpOOUkrQmxTVmhyRE9XbWtOaWxpVXFuWHc2TXdt?=
 =?utf-8?B?LzJNTm04dUw0V3A0Z2s5N05pa3Bzd0QyMVRxUWUzUER2NThkYTF2RnFpUlVZ?=
 =?utf-8?B?bDZIays3OWNXSHArY0d6UCtNWFd1RU0vbXlJZW9NVGduQmhpdU1SZFN4c2ds?=
 =?utf-8?B?TU5KRFhZaklXREZtak1FU1hIWDRxRGU4UzgxbE9GeVdkQ3l6K0czTTZWVGVL?=
 =?utf-8?B?YkFvVTg5QklkMzZKVUZQZTBzREsvRzczb2FFYzNVNFU3MHIxYjJsL2IrMUpP?=
 =?utf-8?B?eUdhYXhqcUtvYUVMc2Rjb2p4MHN2MnNSWFR0WTBPMGJNWkhUNHR1YllVNDdu?=
 =?utf-8?B?VW1wNHhBbHlTR21TdzdyazcxOEhxVUdXMmRtVkdlM0lOY1hnbTZEek9sMnhy?=
 =?utf-8?B?TnR2VWdqVXFFd2srSmtFMEVMUDA2aEZDdVU4dGVWS3hlWDVqenRLbDNzdzN2?=
 =?utf-8?B?c0N2VjB5dkpBeVJyZlB4QkxEQmpyaU9BSGMxazJkWXdwZTZLUWc1U2lVTFJY?=
 =?utf-8?B?MXRNZ0RudFNaOFJsK05uRTY2alN1ajF3bXErUFpjU2dVd3Q5aUZ6b3ppY1VD?=
 =?utf-8?B?S01WVVFHQXViK3dyYWN5cjUyamxicElIOVJ1YnpQT3ZYWFJzL0VHVXdLc0gw?=
 =?utf-8?B?eTVBSTJFbDZxMkpIZzdWM3VVd3BsdVdNd25lajJjSDB6ajZnZnk4clNScXB3?=
 =?utf-8?B?bVlxUnYwWjhYM2Vna3M2K2lEMzlTQUc4djVOQldHS25VaEllbjVpcHI0dy9x?=
 =?utf-8?B?YzI0RnVuSHFXUHJpZVJxTVBpbjFLL25uSWVkQjY4YUpWeW9GOVVmekNjdXZh?=
 =?utf-8?B?RlFFM1hzMUVzYysyamdOM1dLSnZiTmMrbkhmeUdkZmswRjliY3ltclpnTCsv?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c6317d-61a7-4f7f-bc85-08ddb32079a9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:10:22.2375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8jvtYNVxRHlx9s9DuhTRfQDv9RDvsHPuLNbGNddwwD4mBpNaXdSwGj2vedL1XQsMN8KoiJquHHUfboQHuOdWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
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


On 22-06-2025 11:27, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Purkait, Soham <soham.purkait@intel.com>
>> Sent: Friday, June 20, 2025 5:34 PM
>> To: intel-xe@lists.freedesktop.org; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>> Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana
>> <riana.tauro@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH v5 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie link
>> state residency offset
>>
>>     Add G-State residency and pcie link state residency offset macros for G2, G6,
>> G8, G10, ModS and L0, L1, L1.2 respectively.
>>
>> v1 : Moved offset macros to drm/xe/regs/xe_pmt. (Riana)
Move offset
>>
>> v5 : Reordered commits to reflect the correct dependency hierarchy.
The need not be mentioned here. Having this mentioned in cover letter 
should be fine.
>> (Jonathan)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> index b0efd9b48d1e..4e377b6eac92 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> @@ -21,4 +21,14 @@
>>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>>   #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>>
>> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
>> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
>> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
>> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
>> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>> +
>> +#define PCIE_LINK_L0_RESIDENCY_COUNTER		(0x570)
>> +#define PCIE_LINK_L1_RESIDENCY_COUNTER		(0x578)
>> +#define PCIE_LINK_L1_2_RESIDENCY_COUNTER	(0x580)
> If these are BMG specific offset, these should be prefixed with BMG.
>
> Thanks,
> Anshuman.
Agree with Anshuman on this.
>> +
>>   #endif
>> --
>> 2.34.1
