Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC21E77188
	for <intel-xe@archiver.kernel.org>; Tue, 24 Dec 2024 16:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E310E2A4;
	Tue, 24 Dec 2024 16:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+jfNbsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAAD10E2A4
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Dec 2024 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735057589; x=1766593589;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=4Rs0HCzwRpBaydL9reK5jO8kXk3aXgu38VN/DbZAJo8=;
 b=i+jfNbsEr4bVrJFQayfH/4gFe0veXHWvddIzAwVVPqWUPY47lbCU3I41
 Z6vSGWx4+msQjKgESg9pa33TSS7zvy2nmFlllneFuByyC3tEFqguNJgRo
 Wub1ZfBlSIAIRKFM00gej0yqsTwazihjZybl5a1VFDwbmYsRER3nDOHeG
 sDDJ1t5uPVAVPu/7mKsoESyNAPcl6Fo3JTSPT97qum1qJFn2fi6DhCOF/
 EeIBm2U3mPI4M5V9tT87vcmwTKMuFE4T1Ahh7muxnfJBt2lK7H1soC4SY
 JoiHTvMSgrtvkAAku2YJNStHb7l20/aJfnpcgrImpe4zn/yR/8qogWy1u A==;
X-CSE-ConnectionGUID: nR/t8tm2SYyTLAMYl5ps3Q==
X-CSE-MsgGUID: Fi0iORRsSDSGyy/w2Lc77Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35648803"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; d="scan'208";a="35648803"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2024 08:26:28 -0800
X-CSE-ConnectionGUID: K0YADUEKSECBSAX6DmQOHQ==
X-CSE-MsgGUID: hlZnPB8WSe2nkFLx/H3ZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; d="scan'208";a="100032503"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Dec 2024 08:26:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Dec 2024 08:26:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 24 Dec 2024 08:26:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 24 Dec 2024 08:26:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNFq2uywIePOMT3oR3PUwIPdPbekzDr3mP2lwWPn1s7oS1SzRGgEcMyLB86/Rw412ZQp8TzATyx7+5YGagpf6iyyMESvdZowcfOXbqDXq4eX1TLYBLlnrOwv1Dtp1/jXzRhpeRfpXaIoXzpGhBjnrwkeRM3gjGBZAD0ef0Y5mlnkfZcNiL8pT64ftKQIcelncv+jdMCqFuLYBvtQtEDU7bqkoqAeOO33/eCA0WShpwHv0nK6bXf1HB2EAIUIoTFseO5rjeabRDZJZZLcfETgyC/IZYSoWZDioGxeWk79IzfG7du/aJrTf1gyNtHUzhb+NcKefFuKMfZgX04bXxEptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/Vwa87vFx205Us+ygm2STP3pw1TAKJYeiJTRXkgDyQ=;
 b=yzbtnlyfyoGiTUDoQf3mg027kwEGOapoVElXwhyg7iXZfLEL1GFYeT1pZqg++o9bPMVl0LQROa+7SOduRDqcxDMRbwuIznd6J7oiwn22IWKGSGP7lf3+y9LcgjZ263Jb1gjzhYxHJQhd14A2FBPStkbRfiDONaHTHO5zoWoHJaI7UawwI/HHpbmKQsffCAGjz49Ht9a566NcTSoQfEGRV00h2fPIo004bVUBqKPzFBzqC/q8Ks8j85XG6iwb78EnkbDihL0CLoFrQEEbKxYVY6y94z0d5mAH+cmi+Q6oz0J8xocqfal1oYh8YNR3NqkPvNzZ4IaKGfePJ1B957D2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 16:25:52 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 16:25:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173499201800.2246156.15347381790371044013@b555e5b46a47>
References: <20241223211014.90405-1-gustavo.sousa@intel.com>
 <173499201800.2246156.15347381790371044013@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.BAT: failure for drm/i915/cmtg: Disable
 the CMTG
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 24 Dec 2024 13:25:48 -0300
Message-ID: <173505754822.1822.6258856521975510751@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0309.namprd04.prod.outlook.com
 (2603:10b6:303:82::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 80943d13-f422-4979-e54e-08dd2437a288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WktvSUYvT3B6MUNSQ0REOWc3NXJ1NDNaYW5FLzc1Q3Z0TXlVeUpCQk1XeU5j?=
 =?utf-8?B?Q2o1cE1hcDF4S1k2aWlPQTdUYk1IWU5YTzlQQlpDZjU3UUI1c0pwWCtRYnpC?=
 =?utf-8?B?SHJiVnVnYTZzMi82cTd3ODFzTG1WcWxZNDlVOXdvSUp3TlVEczRsU3BrUG1T?=
 =?utf-8?B?UGNkRCtHWmlHdGVCTXNLalNMRmhiVEIwd2EzNVN0eGRsMzdocVBXdjNaRnU3?=
 =?utf-8?B?OFlITlA1YzF1SzQ3Y0tHdlZaWGk0WVgzUlJqNDJEeHBLQ1YyMzhaeEo3N0lv?=
 =?utf-8?B?dGcyTTdEWHlCTGZxSk1IU0dZVHhCbHZOb0UyMFZNWkgvb3NQelFaSzFMY3lw?=
 =?utf-8?B?ZkxuMDFES29HNi9ydXJtZ0FvbkZFQzVkK29HZUxmaUJzM09jQTh2QjEwc3Nl?=
 =?utf-8?B?SVJQWFRUWVpoOTlTWkRHOUwzN0NIaUFYbGlHOWY5S1dyQkN1N3k3b1hJVTVw?=
 =?utf-8?B?VmQvLzRibFAwc2c2ZmlHZC9CSkg5OFBQeCtpNjZwaXF0WFdZVGlBeFRkV1Jj?=
 =?utf-8?B?cVYxR3l0L3Z6bGJPOFBqbldqNnJwOGoyM0J6NDdoNXYwYzVEd25CdFc1S3hs?=
 =?utf-8?B?cVo5OTV2RmlVMVhBTW82RmI0T3hEcjRJdG83MVRhVlVHZ2EyQ0hxcTA4SnBU?=
 =?utf-8?B?SHB3U2dVaVcyblg4THZtTzllSUgxS1JvV3Q1QkpHZW05LzVuZC8rc1NNQkYw?=
 =?utf-8?B?aFAwR1JTamVnS2s4bEcxS1BTeFhRUE1nUUpJam9UaVh3NHo3Z1ZubHdYZFp6?=
 =?utf-8?B?MHNQUFpqclRTOG4yUEt6MWhacUV4WDhTblZyV0dnY1p6cEFDdzJubVkzY3FU?=
 =?utf-8?B?c09selFGekpGbndkT1RUZ0MwVTJRWFMyRXRDV0MxSjQzR0dvRURCRmVMVlhK?=
 =?utf-8?B?M1FDOG1SN0kyNWYxZXMwZXJPanZ6a3YxTjFpaEdzN0doZVNPRzMrRmMzTFZL?=
 =?utf-8?B?Vm81TkhGcHNiYzkyaXBTTzQ1THBmM2Vjd3RWQ3NJcmZlamZJQ0NjMHJhU0Nh?=
 =?utf-8?B?Y1cvME9HVFp4SEZlVi9qS2R3Myt0OVU5YmMyUVZIRXVIUG0rUGRUOGJoOG8w?=
 =?utf-8?B?aCt0VVIvRmkyOUZHM2VRcjQ4c3oxRDhJdTFScWp2MnZQTXhRZ1FjME0wcjFK?=
 =?utf-8?B?Yk5MMlJ0VHVZd2Z4elNpeHMzK3p0cjZkYVVvV1MyNldTVU4wYkwvTjJ5aW1q?=
 =?utf-8?B?Q1JmOUoranI2eUlsZ0pXZ1hldjAzMjFKMlNsWkN4MHh6NzNWb3ZFdEY4NEJB?=
 =?utf-8?B?dkR4dHZKUGFYaDNIRlFrSi9FSTRTODUvMVpJdi9lU2ZBMjl4eDNQL0VKZnZI?=
 =?utf-8?B?RXV0cU9Id243dVJ2dk81OEttaDJhWFRwTXZqa04rK2hFVjQvOHVGRThNMkI1?=
 =?utf-8?B?LzkyZ3JKZXhpVkVnK1l2QnZHaHo0dU1VbjFlQUcrTHpra0x3TEJvQkdRWjZw?=
 =?utf-8?B?WTNBdnFEZ3lVOFhPMHNyL3RDTlExR0l4MzI2MUplcDJBeEZLcUcxSFRrQTV4?=
 =?utf-8?B?ZkhpeHU1bDd6N1IvZ1U4TVRJTFFjcldBLzZFY0J3Y3QwWEZtbE9CVXVnWVpz?=
 =?utf-8?B?am1Ma0MweXdvZFdVV0hUTVVrUTdZdHRNQ1MrWTlVVVc2S2V0M01iU1h5TGNo?=
 =?utf-8?B?Uk96ekNuN1g2STg4VERjN2FHR0xWanJMcll1YWlOL3R4Y0hlRW1PMTgvN09t?=
 =?utf-8?B?OVVieHRvemsxdFlMU2pvNjVySVR2N1IzSkh6OEM2YzlhZjJ1cVhGZGZURDhE?=
 =?utf-8?B?dzZDVHFBdVhla2Z0Sk83cXVYTGJxTGNCV2RGZTNOeEhGdWdIZXZwaG44UkZC?=
 =?utf-8?B?L1FZR1g4MC82a2g1Yi80Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDN6NzRiR0FuN2xQN1lWcFVPNGVPTmdxNDJwYjU5eWVQNnRweW13Q20vRFg1?=
 =?utf-8?B?MWVjdCtwUkFmY3dBcGpQS0Y0UzZOWU9kSGxRMHg1T0NvWmo5WGtZeU1BNGgw?=
 =?utf-8?B?WHBoQVZzb1Q1TUJZa1hYRHY3TmV4M0szTGQ0SDI1RjBNSFZnRVhGbTdGdE11?=
 =?utf-8?B?UlpZRitQUVd1ZGZRZ1lweEpVUmlldzlkRkxSYjNDSlByS1ZaMU1DME41Tkl5?=
 =?utf-8?B?aVp3QStXOWhjSkh4UnVPSkJvK1VPMHN6WkNEdGw0eXFaV2k5eXRyODRzR0U1?=
 =?utf-8?B?aTNuMHIvUGtLc1YzazZmV09yZzYzTHZ4VXF1R253NHVKc1VJNnlsZUtZNzRY?=
 =?utf-8?B?UEtGRWdzUWxPVHRZZE1XbWFjWG5VOFRreDVUMjJQOHpNV1ZOeTdsNkNtS2k3?=
 =?utf-8?B?Vi9CeldWVkluRXhWMWc0ZWRkSEl5TWFIdXBXTm9lZDlqekZwL3FkdDJWOFhh?=
 =?utf-8?B?a29YZ2czZlNveUdLTTc1cEFTbFkxUURPcWN3VDl6NzFycW9uV0E5Y0xUOU9q?=
 =?utf-8?B?d2IvaytQYWRaT2p3MHlyMWdOQU9IZFVjaUtqa1A1bWNnTkRtTm9hRFVDQ1Av?=
 =?utf-8?B?ZVZlL3RwT0crNGFvTWwxU0xFKzJySWpLWWtwZ2xmUEdXR2xkQjVhOTVSUHQ1?=
 =?utf-8?B?a1VEcys3anFpOXgyaTE1L250RW1mN0d4RHVuUkpPTEZueStKVmJvT2Frang4?=
 =?utf-8?B?VllWWHFnMnY2bWdUM1k0b2JkZWZHcVE4MFYxN0MyZGRWUDY0RmRpNUNQTE5m?=
 =?utf-8?B?a1dqdHZjYVpaUHZYbU5xT3o2WW9iQmFNaURkelcwNzU4Z3Z1YUlWTHRYYVJo?=
 =?utf-8?B?Z0dOaVBKRzBMQnAxWTVURm52R3JWN3YvMHZRUXZXYTVEUVphZWZnT0Z1RVF2?=
 =?utf-8?B?V3lJWkZsYnhpZEc0YjZ1Q1JQcHVVU1dXN21vMHByK0JITmtXdTFtQ0xFNVNv?=
 =?utf-8?B?V09rVVJ5MHNsazJtNWFWTFZQTm9yN0JnZDFIdU5ReGpKV1lueFhUM2FQZEh0?=
 =?utf-8?B?YkZKaDUzWEd0SW5vNktHTHVHMTFLRFBSd0RKLytEOXJqcXBrZXJHUzRLRXFX?=
 =?utf-8?B?VjBWOWpZRG9JMTRtcm9xVThnUnZzdVRlMU1JTVpETkc5U0pISGJ1OVVrTmo4?=
 =?utf-8?B?ZitYM2ZpQkN3aThKOVdNR3pXOERKajJkTktmYkZKUW5SM1graSsrTENXdVQ2?=
 =?utf-8?B?Z1p0M013OERoMkxSbktvTmVzRGRtZ2ZHTlFGemRsaTFCTUFBaXJLVkp4R0tz?=
 =?utf-8?B?Y0xmaFpsSzZqUFh6Rzc3Ti9meEFjcHVtYjJFOUJUejZldGx3TUpyejYwanl0?=
 =?utf-8?B?Sk03cUV3ZmNMK1BWU2pjc0ZNenJHU3NzZFpSTEM1RGY1YXVxVjV4TzVwM1pQ?=
 =?utf-8?B?WmxiaEE2VGlRYVZKamlBZlNkRWxMdUlpVnVZZE80S1Q3Um1Xc2huZW9mbmhx?=
 =?utf-8?B?SVVrdERrSSsrSXNheko0c1dSMkNobEYrSmpTc01TcGZLS1k0S0tJaGZ4K1dy?=
 =?utf-8?B?Yzd5TVk4cHZhQU5TeUFodHROblYwanJNQkEydFdZQzlxTTNiL1lhQk5aUVp5?=
 =?utf-8?B?M2JEMC93a2JLTk9UTXpKUmZaS1dhSVpSZURhRXVqTVViS08vdHpibzJabGtD?=
 =?utf-8?B?Mm5sdkxoL1JLZlV2VmMvc0FTQWxJeEpRWWFjdGVFWHJ0dXVmblZ3VkFRdmNB?=
 =?utf-8?B?aWRWUkdhT0NmVk9yNkxMcUJDS2twMjJIb0tlaVlRWHRjdVB2M0V5MGhpMzkr?=
 =?utf-8?B?MXFrN0RKekxRcFpYbkFBeFhSbjdDR1dmNWFjbjVTUGdCU0NEMGZsREd1WTNL?=
 =?utf-8?B?cEcyWTlrc2d4S002Y2x1cUVsSndoOEZKNXJ6dXh5L0hqRzJUM2NLZktYR3JX?=
 =?utf-8?B?aDIxTkFSamh1Zldud0JkVitwRFc4YUI2eEN4dElnNHR0bjAwb0d3MDNFZGxY?=
 =?utf-8?B?SlZkaWdaclMyRzZGOHN0MlMrQm4xR2NvMC9jYmphbzlQbE5Nbkk5LzRJTnNy?=
 =?utf-8?B?SWIrQ3JnUU9xa3JJR1BtTWlRMHYxVGZxVTRDV2tLOEsyT2pVcnRHZmdJNW84?=
 =?utf-8?B?Q2Ryc1NBMXNqSTU2TnFNdUVmU2h4R2xsWStBQjhsLzMxdXpJZTkwTTFsem1M?=
 =?utf-8?B?VUpmdFZhOUFlMHVYKzV3ZG55TENXQUhUVEZqNkZYL0p2U1RQanFGN3MyQ2lI?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80943d13-f422-4979-e54e-08dd2437a288
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 16:25:52.6986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6mFlrUD76L2ajSNO09cYVP8ZHBjgRmw6vSeApvf8oE7Of4NxLWSEz6JpOG+LUwfg9hWfbbbC6Sd7U5tlNByCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

Quoting Patchwork (2024-12-23 19:13:38-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/cmtg: Disable the CMTG
>URL   : https://patchwork.freedesktop.org/series/142946/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2421-8fd79761c1b6984d01b45a4bc8eb8ad81f6546e4=
_BAT -> xe-pw-142946v1_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-142946v1_BAT absolutely need t=
o be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-142946v1_BAT, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (10 -> 9)
>------------------------------
>
>  Missing    (1): bat-adlp-vm=20
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1429=
46v1_BAT:

Yeah. Those are related to my patch and I posted v2 to address them.
Thanks, CI!

--
Gustavo Sousa

>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +40 other tests dme=
sg-warn
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984d=
01b45a4bc8eb8ad81f6546e4/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-c=
ursor-varying-size.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-lnl-1=
/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>
>  * igt@kms_force_connector_basic@force-connector-state:
>    - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984d=
01b45a4bc8eb8ad81f6546e4/bat-bmg-2/igt@kms_force_connector_basic@force-conn=
ector-state.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-bmg-2=
/igt@kms_force_connector_basic@force-connector-state.html
>
>  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
>    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] +40 other tests dme=
sg-warn
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984d=
01b45a4bc8eb8ad81f6546e4/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pi=
pe-a-edp-1.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-adlp-=
7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
>
>  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
>    - bat-dg2-oem2:       [PASS][7] -> [DMESG-WARN][8] +36 other tests dme=
sg-warn
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984d=
01b45a4bc8eb8ad81f6546e4/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-cr=
c-frame-sequence@pipe-a-dp-3.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-dg2-o=
em2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
>
>  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:
>    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10] +36 other tests dm=
esg-warn
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984d=
01b45a4bc8eb8ad81f6546e4/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@p=
ipe-d-hdmi-a-3.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-bmg-=
1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html
>
> =20
>#### Warnings ####
>
>  * igt@kms_frontbuffer_tracking@basic:
>    - bat-adlp-7:         [DMESG-FAIL][11] ([Intel XE#1033]) -> [DMESG-WAR=
N][12]
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984=
d01b45a4bc8eb8ad81f6546e4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.htm=
l
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-adlp=
-7/igt@kms_frontbuffer_tracking@basic.html
>
> =20
>Known issues
>------------
>
>  Here are the changes found in xe-pw-142946v1_BAT that come from known is=
sues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@xe_live_ktest@xe_dma_buf:
>    - bat-bmg-2:          [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +2 ot=
her tests skip
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984=
d01b45a4bc8eb8ad81f6546e4/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-bmg-=
2/igt@xe_live_ktest@xe_dma_buf.html
>
>  * igt@xe_live_ktest@xe_migrate:
>    - bat-bmg-1:          [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 ot=
her tests skip
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984=
d01b45a4bc8eb8ad81f6546e4/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-bmg-=
1/igt@xe_live_ktest@xe_migrate.html
>    - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 ot=
her tests skip
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2421-8fd79761c1b6984=
d01b45a4bc8eb8ad81f6546e4/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v1/bat-dg2-=
oem2/igt@xe_live_ktest@xe_migrate.html
>
> =20
>  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/103=
3
>  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/119=
2
>
>
>Build changes
>-------------
>
>  * Linux: xe-2421-8fd79761c1b6984d01b45a4bc8eb8ad81f6546e4 -> xe-pw-14294=
6v1
>
>  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  xe-2421-8fd79761c1b6984d01b45a4bc8eb8ad81f6546e4: 8fd79761c1b6984d01b45a=
4bc8eb8ad81f6546e4
>  xe-pw-142946v1: 142946v1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1429=
46v1/index.html
