Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E5BCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 03:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D010E06F;
	Wed, 27 Aug 2025 03:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hijcpkO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFE810E06F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756265087; x=1787801087;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nkP9c+DTqs+DO0piskI+npOaEfUuwqZyOEgzDdYFZ7A=;
 b=hijcpkO8AD5bbRhY2zJ4YYoQzWkY+juXLlaxJrm8P5xr9uSGkdUT9lUD
 JgLnoTOreoTaf9tt21rfNJ3diAkAIWAIuSm/TGOSbuyjhHmSHdkfZMDVN
 5cffwl7//sB8HUgUdjtLPKnC/ki45d2Ufo8VJidm8D90AMPkUWOQVhPpK
 VuUvIE+5sBfzGNeVU9PV+zKmVb9oJFuEvoXpAB+rFblpTWlPfQ5qmvCS6
 DKB2+0uDAh/hGKwMBebtht55XLsbaeggTkszyqxRaTw8YDhUd57AdTw+h
 q0UKhdbjPP5BanBJGn6DrODpZtvLiP1/si+shrldaVoJJ1P7KIe5XpW83 Q==;
X-CSE-ConnectionGUID: 7n0+JtTvR1OV82o0MkbBKw==
X-CSE-MsgGUID: GFNA6EKmTqW0xM1zYniz8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58571196"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58571196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:24:46 -0700
X-CSE-ConnectionGUID: HNZsy/gyRGCSi7MeWop+vA==
X-CSE-MsgGUID: 48bznQvHTrSKUdoYoZ4Efg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="193384591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:24:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:24:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 20:24:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3m+d1r+a2pto8/WbVEGK1GjgAqF32/xk3igE2k28arqVdZ01LTjC1/rLcu3N7YHvx2of8RHsTl7toM+0iDWImYWIBwTX+We6vOiM4MmnwSdSwcIKqus2OAKqGI/R551nk0oX3tkj7x0rhjFIrb4h8HOofjTGRw4YipewaVTfU4hS6g57FRMb8xq3zyZwdf957FSYS0BUdIWUhGwHRqvPJ3WIOHUC6ehDL3Cply5YuOLqRUbrypCZX0X85fkxKRJN8OpF/Wq5uPZ4pzmXLmz47/rjjLQ5md4Ap74KmIX8IH12GS0tiBWCq5ahKVCYPHt8PH/+hXYgIBfJmgIlXCWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZgJOYsmMMagaoawMaCQblQ6FBkFIcM/myOw60m2bbE=;
 b=ku3J8b5Si2qGPzG9A1ooXqTvnslKHSQuAyJCVSscxz8vDfWcUd0wF/oTE2ImDlyJLtqZkC2St96ROE47ca4ckAHBt06Y7UtVFPuaNaPfZ4DcRlYYVv+FBQmiDroLhiqUg0bP5bpz8P6up6IeIHfzPJV35gD92Am2XH9NCAflii+u9Xi1FVSE05wgf+50A16CohD89kUafeRtwmUyV/XGUe1ps0XZNL/PUN2QH6pgHY2sdxiqvvNE6qj0Y4POug7UHXInCvsPM7s0sCBLrm0BWAjikD7PBKvbiHX51rbs8jK0yxfvLsXLUgMvq/LRz6a8Q4D+I/92dNDt/7K/q0/+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 03:24:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:24:42 +0000
Date: Tue, 26 Aug 2025 20:24:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Document GuC submission backend
Message-ID: <aK56du0nxtMqv4TX@lstrano-desk.jf.intel.com>
References: <20250818033646.2622613-1-matthew.brost@intel.com>
 <20250818033646.2622613-2-matthew.brost@intel.com>
 <1103a410-afd6-420d-aea8-2896c960bda0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1103a410-afd6-420d-aea8-2896c960bda0@intel.com>
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: a449b837-29dc-4329-c6a2-08dde5194316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L05kMW1LTFVMM1Y5YXpUMHV0RXFJNHZ0T0VPcFpiZnlHcmJNbnpid1QxQktP?=
 =?utf-8?B?cXdsaVBTd0FwZ0dJN1FBWnhlam5vMVVSbWNjMnRnQi9idUFoNlRXSkJFZ0l3?=
 =?utf-8?B?K3F5N0NNaStXa0VGUVdSa2JPTXdUVVUrR2VhMG5vTmIxeHc5UDdlRkEwaUw0?=
 =?utf-8?B?VHZDOUJocE5vWStPUXJwbTk0d3QvMzROY3pZLy9ZcWJ0amtOWndVR1VYVnNh?=
 =?utf-8?B?K2czMEtOcy9Hb1d3MDJJRnpKcThuSDhobHpha3UrLzA5N1ZuUnUwbzN2cG9r?=
 =?utf-8?B?ZFJjbUs5Q3dQR3R5QkV5Q0ZVMUxSOGVPZk1zOG1CeCtXcitRajF3RlJvbzh0?=
 =?utf-8?B?KzIxeDRpOFZIaFIvWWtNaFVQaURTVlBuT25BRXBqSUUrb3AyNjY2SjZmckNt?=
 =?utf-8?B?RFhLeklOVzlEZjF0Wkd4WGttWnVSbTliTzFlamozWW1xSmRIQldrRUdMZ0ZY?=
 =?utf-8?B?dUg2TXFpdXMyaGN5T25wSUZHUEVtSmhvaWJDTFpJRDFxM0d1RFprb3g3YVcy?=
 =?utf-8?B?blg2OW5MMEVQMkhZejc5cDQzN2k1SVF2cERsOU1EVUcrTzY2cGRuWWVEZFdL?=
 =?utf-8?B?dE9ENU9qcE51Y0JyR0JsMzRKbmswMXpRbHpTY25mNWdoK3ZnZHlCRDY5SE4r?=
 =?utf-8?B?L3VEOWY4S2RpajA1NnhtdWQrZjFMdEo2Q2VoeFAwMHIzQ3JYRlM4NTN2OWZO?=
 =?utf-8?B?Q0NncER5TjVWTnFRZEFxbnJJYlJoQzJ6UnJmbDZTZ3cvRjg1WU5yY283U3lR?=
 =?utf-8?B?bmF3emhLL0tDeDA1cXgrTG5lTHF6aWVqTUM4Ny9xNldGeUlOMmwyY21Ra2Zn?=
 =?utf-8?B?cmhpRWhqVVVpdUdoNVFSdHBxTGtNMC9KQWNDSzZRRFRjYUIyM0JnWS9OVHcr?=
 =?utf-8?B?ZXJVWGFZdzFKZjZmRjBiNzVueDNycWlqZ0wyR2t4QnYwSG01dldIWUNmL0c2?=
 =?utf-8?B?OGs5dHY1ZFRYdU9yMjVBbHE5OFNEdUtZVjZIUVV0QTdvTXJaV0ZRZDA2RXhH?=
 =?utf-8?B?N1J4MHFDV3dhVlcxOExkV2dBY1BLaXBpZExDdVFQZFc5OHg2bUFPeHlKNFNj?=
 =?utf-8?B?TWhJc01KS0V2cmdMV3p4UDdTNDZiT25OeTRQQlJ3ZlE0eVJCcHVhdTRSekNX?=
 =?utf-8?B?dVlENWtRb1g0S25RRzNYbFA1SUZ6SnBPSE5peVRYSTUwSFlsckhxWGRsUmh3?=
 =?utf-8?B?RWp4VlpvbkZrUk1xbllmMEp5WnE2bUlZUTkzK1ZkczhQUHFHdExSazlKUS9H?=
 =?utf-8?B?alJtOURGbGFYd3kxK3AzSG1mYWRDZzNCWlIwaG5vRkVvZGs3U0pER0hCd090?=
 =?utf-8?B?SVJBMW5aVnhNN2c0R3FjeTJNSmR6aTZTczd6RzdTOGVjemZMNVlHZ25pdkh2?=
 =?utf-8?B?bURWOWVhRmlhUTZ1QXpxQi9CcTlpSU9yeGZTK25QZnZPZGNJdytPSDhES3Vv?=
 =?utf-8?B?WjhrSXJYRThWYVVCL1VUSHRuMTVZQW5BNllNenBadmdVZTdpY05aeTd0K1JQ?=
 =?utf-8?B?WDBNOFlPY3JPeEc1OFkyaElreTBzcFdGUXdscUw4N0p1UG0vMzVHdlVxa3Qr?=
 =?utf-8?B?WHNVejk2QWk4dnZYQ1RpRSt2VWdKdFliOEZKVEtobTRvMUxoV0YvTzI0VGFZ?=
 =?utf-8?B?c1pjR1VkdkQrSktiNWFkcUdBb0krcWt4Y0gwVjJtVmlDdEtxY3pjN3VSRURR?=
 =?utf-8?B?cVFrNE5FamUxaUpiUkVjVC92VjQ2bE5valJXWVdOMlZObmNJdlJTdEJHalJK?=
 =?utf-8?B?dWtyYVBwUzJrWU1OQkhxYmV1UkJEckhLQmRKVFdKdmRPa2pKZ2lNcEMxZnh0?=
 =?utf-8?B?Y3VFczJtNHB0azUwNjRDdTFZRzBBaTI0bWY0b0xMTnJ2RlVsWndOa2llb09J?=
 =?utf-8?B?MjhsNU5mckpvV3BhN3dROFRQdEc5ODN4V09saUtFdEppTGY3ajZ6bzRldmFT?=
 =?utf-8?Q?6v2UpAtYFZk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxmY1ErRnFUUE9UMnJoNjBsSmJvcnJKcWVCbmV3R1Y1c0hqaUtES1ZwSEFn?=
 =?utf-8?B?NUFEb0hVYjVDN3V5dTRSR1NyRTg5RWQ2Y3c3bWVBYW5JR245NmdzYWN2TW9y?=
 =?utf-8?B?Tk0xbTlaUmQ3TGs2aXRRZXFweHBkeHBOS1Ryclh1OEdzSFRFcXdCb053SHRh?=
 =?utf-8?B?aEVHc3h0T0RsQWJvRFJWWEE0NS9zT2xOdEFIYjhYVzBzSE5xUTltdmxmdXpL?=
 =?utf-8?B?cXNSZFhvUWVXMUJ4T0ZtVEhRM2pNb2NGY2lHSGpBOGZ2d3ZpRnQ1L2NhMldu?=
 =?utf-8?B?T1VBaFNhbzI5Wi9PUm9wcUVpMlJ5VThKRmpRV1JlNFNLdUs4UkVXeHVncmZ6?=
 =?utf-8?B?U2VncUllRTc0ZWxGcXRPbGVoakFGRW43T3ZGWVpMeDlHV3BwYkg2V3c0U1dY?=
 =?utf-8?B?emtJcjIzZ05GbzNWUEhETHJ1d3pXMmFacHJieVRRcnBaRHhlZFJGaW9sUW9Y?=
 =?utf-8?B?QUNpcm1tU2NFY09wWnh6MHd5SEM5NzU2SXA3MFpjRk94TE1kSmxGQ0krTmNV?=
 =?utf-8?B?a01xUE9kR0xTZWk1ZzV1UVI0enphZVdxZG5JOGNYRnV6SHVVYXN2SzUrQzJ6?=
 =?utf-8?B?WVR1RHJLVnRYRzVLbklVK2ZDNHNlV1BTOFNRaWczaUJFTW9adnVpTmRDanMw?=
 =?utf-8?B?d0l6SUtQTjRXdkFiVkxPVjRweFpEN1QxdEM2alJCVFRjM1luOVRXUHc3Y0o0?=
 =?utf-8?B?WXoyZW1GZmkxdU1sNUZaTngreTQyWjlaSEw2MFhRdUJFazhaL1lBcGpVVXh0?=
 =?utf-8?B?THZucnFtbEQyUlN1dUpiU0t4bWlLSkJIektGRHhNMWVNQ1lSVjl0UUNRSmxu?=
 =?utf-8?B?THM2WFl1ZmRqOG95RXB0NUpIcHFZY3Z3ZWdiQ2hMTmgzb09WRkM3MktZWmdz?=
 =?utf-8?B?a3VGd2EzVFREc1loT21XTmFRUnRadXJKYW9yS3FrRm1FRDJnSVRqUGQwbHRN?=
 =?utf-8?B?NzdVR2RpTW9CK0JGTGx3Q24zMytManBSQy9CR2M2cnNzNXRCNGxEaFR2Y1hF?=
 =?utf-8?B?Y3NvUkpXSGxjTzd2RVQwakZBSWZxdGMxcWsweWtKNUs4WEcwbjdDQ3FvcTQy?=
 =?utf-8?B?WnVyckpoZkpSanJZQjlHNnBTWUJ3R3pWeUJETUtLb3ArTkYzVHIrak1Nb0ZT?=
 =?utf-8?B?Nk9SWW9xNXhtTkIrOGRFT0x6a1pReG54Nlc2dWoyUEQxNlBBOHhVMjhLalhj?=
 =?utf-8?B?cExEcjNpNFM4aWV1VDN0WFU0enVRc09tUHpHTm1EUVBoeHJFaHpVSTd5Y0JN?=
 =?utf-8?B?NUUxcnFBOTR3Qk1mOGN5WWdqRXRBZWx3SmtVWXBHeGw4K1JGdEw0akR1MTJr?=
 =?utf-8?B?RFJlRjhvckUvdmdDU2RCMjZualovNE9Sejl3d21YcHBwN25DMW0zRkc0M0w5?=
 =?utf-8?B?VHkwNVFnc1JwUUFYRWJaZFZjS2tESFJyblhpUUlocTAvRmpPSElwZXJMMzNN?=
 =?utf-8?B?cmlaQ3gzRFVoRVl2UW9tK2doUmx4OGVwbjVmekpYN2RjeWRia0hWdmI3YW1U?=
 =?utf-8?B?RmxoL0lPaTNCYjYvMnBxYlVYOG9Fd0UyWS84alMwbm96ajJoVFJWVk93WTJ3?=
 =?utf-8?B?TE1nbTdRMUNTNmxNcExRNElaaE9oY05pekF6ZTNpSHhoSDVMRldCa0pTWmJW?=
 =?utf-8?B?N29yYlEvQjZYZ01JWjFOcFMvTlJCSHIyelBJOWlSeEkxZTd3empDWXB6OEp1?=
 =?utf-8?B?VFVBMnd0UXpXU0tTNlJnajZmWGw5MVZ1OHpEOEhySjRpRE1VN1p4REdEMTls?=
 =?utf-8?B?WTNYd2pTNytnZ085dkFIZHFvZzRZNTNXNFp6Zk91SkVMT3UvSGVrYnYyQ0N3?=
 =?utf-8?B?VkgvdjhvRjhCZERiQ09xR2RSdTV2L0FnL2oxNjNjZnlvWU1yVHBYZENlZzJ6?=
 =?utf-8?B?MTdCcjNmUE8wS3ZJb2src2xoWlk3YTFIaWl6eVpscS9xUEEzaDgzMTdaRk0v?=
 =?utf-8?B?ZzBoeXNsTHNIN3VtY3JpWFB5Mks2Q2lwS2NiWUFJWlZXd0cwUVJRRzhLdExl?=
 =?utf-8?B?amFPV1pnVWJwL2N2WFptaTFlS1Blbm14V0wxZnRHSUlVVUxZNXo0UVc5Tm9x?=
 =?utf-8?B?Q2FRTFViamFHcm82YU1iS29URXlTWG5LMVVTWE04STB1b3FYc2RuZmZZOWdC?=
 =?utf-8?B?RXN3S2l1a3E5d1B4TUFtb1RidWdtdHp1aE1OdkdwZnV6U0ZpczczUVpDNEYr?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a449b837-29dc-4329-c6a2-08dde5194316
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 03:24:42.2176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLa37eGwJCqw8IkLa3i5V0wEN/ODaXbaSYfk/fNeLfZr29Zcq6f/alXB9moMWkImLRiNIj8KJTjht7Q6TxNKmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
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

On Wed, Aug 27, 2025 at 04:57:11AM +0200, Lis, Tomasz wrote:
> 
> On 8/18/2025 5:36 AM, Matthew Brost wrote:
> > Add kernel-doc to xe_guc_submit.c describing the submission path,
> > the per-queue single-threaded model with pause/resume, the driver shadow
> > state machine and lost-H2G replay, job timeout handling, recovery flows
> > (GT reset, PM resume, VF resume), and reclaim constraints.
> > 
> > v2:
> >   - Mirror tweaks for clarity
> >   - Add new doc to Xe rst files
> > v3:
> >   - Clarify global vs per-queue stop / start
> >   - Clarify VF resume flow
> >   - Add section for 'Waiters during VF resume'
> >   - Add section for 'Page-faulting queues during VF migration'
> >   - Add section for 'GuC-ID assignment'
> >   - Add section for 'Reference counting and final queue destruction'
> > 
> > Signed-off-by: <Matthew Brost matthew.brost@intel.com>
> > ---
> >   Documentation/gpu/xe/index.rst         |   1 +
> >   Documentation/gpu/xe/xe_guc_submit.rst |   8 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c     | 300 +++++++++++++++++++++++++
> >   3 files changed, 309 insertions(+)
> >   create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst
> > 
> > diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> > index 42ba6c263cd0..27c9f7e87006 100644
> > --- a/Documentation/gpu/xe/index.rst
> > +++ b/Documentation/gpu/xe/index.rst
> > @@ -27,3 +27,4 @@ DG2, etc is provided to prototype the driver.
> >      xe_devcoredump
> >      xe-drm-usage-stats.rst
> >      xe_configfs
> > +   xe_guc_submit
> > diff --git a/Documentation/gpu/xe/xe_guc_submit.rst b/Documentation/gpu/xe/xe_guc_submit.rst
> > new file mode 100644
> > index 000000000000..81a41a2ad255
> > --- /dev/null
> > +++ b/Documentation/gpu/xe/xe_guc_submit.rst
> > @@ -0,0 +1,8 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +=================
> > +Xe GuC Submission
> > +=================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
> > +   :doc: Overview
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 1185b23b1384..62f39fde5def 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -45,6 +45,306 @@
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > +/*
> > + * DOC: Overview
> > + *
> > + * The GuC submission backend is responsible for submitting GPU jobs to the GuC
> > + * firmware, assigning per-queue GuC IDs, tracking submission state via a
> > + * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
> > + * outstanding jobs, managing job timeouts and queue teardown, and providing
> > + * recovery when GuC state is lost. It is built on top of the DRM scheduler
> > + * (drm_sched).
> > + *
> > + * GuC ID assignment:
> > + * ------------------
> > + * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
> > + * H2G/G2H to identify the queue and remains reserved until final destruction,
> > + * when the GuC is known to hold no references to it.
> > + *
> > + * The backend maintains a reverse map GuC-ID -> queue to resolve targets for
> > + * G2H handlers and to iterate all queues when required (e.g., recovery). This
> > + * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
> > + * lookups are acceptable in paths where the queue’s lifetime is otherwise
> > + * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
> > + *
> > + * Basic submission flow
> > + * ---------------------
> > + * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
> > + *
> > + * 1) Emit the job's ring instructions.
> > + * 2) Advance the LRC ring tail:
> > + *    - width == 1: simple memory write,
> > + *    - width  > 1: append a GuC workqueue (WQ) item.
> > + * 3) If the queue is unregistered, issue a register H2G for the context.
> > + * 4) Trigger execution via a scheduler enable or context submit command.
> > + * 5) Return the job's hardware fence to the DRM scheduler.
> > + *
> > + * Registration, scheduler enable, and submit commands are issued as host-to-GuC
> > + * (H2G) messages over the Command Transport (CT) layer, like all GuC
> > + * interactions.
> > + *
> > + * Completion path
> > + * ---------------
> > + * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
> > + * is called; it drops the job's reference, typically freeing it.
> > + *
> > + * Control-plane messages:
> > + * -----------------------
> > + * GuC submission scheduler messages form the control plane for queue cleanup,
> > + * toggling runnability, and modifying queue properties (e.g., scheduler
> > + * priority, timeslice, preemption timeout). Messages are initiated via queue
> > + * vfuncs that append a control message to the queue. They are processed on the
> > + * same single-threaded DRM scheduler workqueue that runs ->run_job() and
> > + * ->free_job().
> > + *
> > + * Lockless model:
> > + * ---------------
> > + * ->run_job(), ->free_job(), and the message handlers execute as work items on
> > + * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
> > + * mutual exclusion: only one of these items can run at a time. As a result,
> > + * these paths are lockless with respect to per-queue state tracking. (Global
> > + * or cross-queue data structures still use their own synchronization.)
> > + *
> > + * Stopping / starting:
> > + * --------------------
> > + * The submission backend supports two scopes of quiesce control:
> > + *
> > + *  - Per-queue stop/start:
> > + *    The single-threaded DRM scheduler workqueue for a specific queue can be
> > + *    stopped and started dynamically. Stopping synchronously quiesces that
> > + *    queue's worker (lets any in-flight item finish and prevents new items from
> > + *    starting), yielding a stable snapshot while an external operation (e.g.,
> > + *    job timeout handling) inspects/updates state and performs any required
> > + *    fixups. While stopped, no submission, message, or ->free_job() work runs
> > + *    for that queue. When the operation completes, the queue is started; any
> > + *    pending items are then processed in order on the same worker. Other queues
> > + *    continue to run unaffected.
> > + *
> > + *  - Global (per-GT) stop/start:
> > + *    Implemented on top of the per-queue stop/start primitive: the driver
> > + *    stops (or starts) each queue on the GT to obtain a device-wide stable
> > + *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
> > + *    VF resume). Queues created while the global stop is in effect (i.e.,
> > + *    future queues) initialize in the stopped state and remain stopped until
> > + *    the global start. After recovery fixups are complete, a global start
> > + *    iterates queues to start all eligible ones and resumes normal submission.
> > + *
> > + * State machine:
> > + * --------------
> > + * The submission state machine is the driver's shadow of the GuC-visible queue
> > + * state (e.g., registered, runnable, scheduler properties). It tracks the
> > + * transitions we intend to make (issued as H2G commands), marking them pending
> > + * until acknowledged via G2H or otherwise observed as applied. It also records
> > + * the origin of each transition (->run_job(), timeout handler, explicit control
> > + * message, etc.).
> > + *
> > + * Because H2G commands and/or GuC submission state can be lost across GT reset,
> > + * PM resume, or VF resume, this bookkeeping lets recovery decide which
> > + * operations to replay, which to elide, and which need fixups, restoring a
> > + * consistent queue state without additional per-queue locks.
> > + *
> > + * Job timeouts:
> > + * -------------
> > + * To prevent jobs from running indefinitely and violating dma-fence signaling
> > + * rules, the DRM scheduler tracks how long each job has been running. If a
> > + * threshold is exceeded, it calls ->timeout_job().
> > + *
> > + * ->timeout_job() stops the queue, samples the LRC context timestamps to
> > + * confirm the job actually started and has exceeded the allowed runtime, and
> > + * then, if confirmed, signals all pending jobs' fences and initiates queue
> > + * teardown. Finally, the queue is started.
> > + *
> > + * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
> > + * that is shared with other recovery paths (e.g., GT reset handling, VF
> > + * resume). This guarantees only one recovery action executes at a time.
> > + *
> > + * Queue teardown:
> > + * ---------------
> > + * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
> > + * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
> > + * in-flight jobs detected on the queue during GT reset.
> > + *
> > + * In all cases teardown is driven via the timeout path by setting the queue's
> > + * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
> > + *
> > + * Reference counting and final queue destruction:
> > + * -----------------------------------------------
> > + * Jobs reference-count the queue; queues hold a reference to the VM. When a
> > + * queue's reference count reaches zero (e.g., all jobs are freed and the
> > + * userspace handle is closed), the queue is not destroyed immediately because
> > + * the GuC may still reference its state.
> > + *
> > + * Instead, a control-plane cleanup message is appended to remove GuC-side
> > + * references (e.g., disable runnability, deregister). Once the final G2H
> > + * confirming that GuC no longer references the queue is eligible for
> > + * destruction.
> > + *
> > + * To avoid freeing the queue from within its own DRM scheduler workqueue (which
> > + * would risk use-after-free), the actual destruction is deferred to a separate
> > + * work item queued on a dedicated destruction workqueue.
> > + *
> > + * GT resets:
> > + * ----------
> > + * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
> > + * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
> > + * as follows:
> > + *
> > + * 1) Quiesce:
> > + *    - Stop all queues (global submission stop). Per-queue workers finish any
> > + *      in-flight item and then stop; newly created queues during the window
> > + *      initialize in the stopped state.
> > + *    - Abort any waits on CT/G2H to avoid deadlock.
> > + *
> > + * 2) Sanitize driver shadow state:
> > + *    - For each queue, clear GuC-derived bits in the submission state machine
> > + *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
> > + *    - Convert/flush any side effects of lost H2G.
> > + *
> > + * 3) Decide teardown vs. replay:
> > + *    - If a queue's LRC seqno indicates that a job started but did not
> > + *      complete, initiate teardown for that queue via the timeout path.
> > + *    - If no job started, keep the queue for replay.
> > + *
> > + * 4) Resume:
> > + *    - Start remaining queues; resubmit pending jobs.
> > + *    - Queues marked for teardown remain stopped/destroyed.
> > + *
> > + * The entire sequence runs on the per-GT single-threaded recovery worker,
> > + * ensuring only one recovery action executes at a time; a runtime PM reference
> > + * is held for the duration.
> > + *
> > + * PM resume:
> > + * ----------
> > + * PM resume assumes all GuC submission state is lost (the device may have been
> > + * powered down).
> If device was powered down, all GuC state is lost - not only submission
> state.

Yes. I can make that clear.

> >   It reuses the GT reset recovery path, but executes in the
> > + * context of the caller that wakes the device (runtime PM or system resume).
> > + *
> > + * Suspend entry:
> > + *  - Control-plane message work is quiesced; state toggles that require an
> > + *    active device are not enqueued while suspended.
> > + *  - Per-queue scheduler workers are stopped before the device is allowed to
> > + *    suspend.
> > + *  - Barring driver bugs, no queues should have in-flight jobs at
> > + *    suspend/resume..
> > + *
> > + * On resume, run the GT reset recovery flow and then start eligible queues.
> > + *
> > + * Runtime PM and state-change ordering:
> > + * -------------------------------------
> > + * Runtime/system PM transitions must not race with per-queue submission and
> > + * state updates.
> > + *
> > + * Execution contexts and RPM sources:
> > + *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
> > + *    executed with an active RPM ref held by the in-flight job.
> > + *  - Control-plane message work:
> > + *    enqueued from IOCTL paths that already hold an RPM ref; the message path
> > + *    itself does not get/put RPM. State toggles are only issued while active.
> > + *    During suspend entry, message work is quiesced and no new toggles are
> > + *    enqueued until after resume.
> > + *  - G2H handlers:
> > + *    dispatched with an RPM ref guaranteed by the CT layer.
> > + *  - Recovery phases (GT reset/VF resume):
> > + *    explicitly get/put an RPM ref for their duration on the per-GT recovery
> > + *    worker.
> > + *
> > + * Consequence:
> > + *  - All submission/state mutations run with an RPM reference. The PM core
> > + *    cannot enter suspend while these updates are in progress, and resume is
> > + *    complete before updates execute. This prevents PM state changes from
> > + *    racing with queue state changes.
> > + *
> > + * VF resume:
> 
> I am confused, is that a chapter about VF restore, or about PM resume on VF?
> 

Bad terminology. I should use 'VF restore' throughout.

> I started commenting below treating it as PM chapter - and yes during VF
> resume the GGTT can change, at least for hibernation. But during resume no
> contexts can be created, and there are no lost H2G as that was all cleared
> while suspending. We should name this for migration step - restore rather
> than resume. and the resume chapter should mention the specific quirks of VF
> execution (or real VF resume could be a new chapter).
> 

See above. Restore is the term I should be using.

> > + * ----------
> > + * VF resume resembles a GT reset,
> I'm not sure this analogy gets us anywhere. VF restore is its own thing. GuC
> is not reset, and it not only stores CT buffers but also context states,
> including pending and preempted submissions. Also it isn't responding to
> commands.
> >   but GuC submission state is expected to
> > + * persist across migration; in-flight H2G commands may be lost,
> No, they're not lost, just require fixups. It may be KMDs decision to ignore
> the existing commands and treat them as lost.
> >   and GGTT
> > + * base/offsets may change. Recovery proceeds as follows:
> > + *
> > + * 1) Quiesce:
> > + *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
> > + *      snapshot.
> > + *    - Queues created while VF resume is in-flight initialize in the stopped
> > + *      state.
> > + *
> > + * 2) Account for lost H2G
> Should be "Treat the H2G as lost". It's not really lost.
> >   and prepare in-place resubmission (GuC/CT down):
> > + *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
> > + *      bits to a safe baseline and tag the ops as "needs replay".
> > + *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
> > + *      tail equal to the head (and, for WQ-based submission, set the WQ
> > + *      descriptor head == tail) so that when the GuC comes up it will not process
> > + *      any entries that were built with stale GGTT addresses.
> > + *    - Reset the software ring tail to the original value captured at the
> > + *      submission of the oldest pending job, so the write pointer sits exactly
> > + *      where that job was originally emitted.
> > + *
> > + * 3) Replay and resubmit once GuC/CT is live:
> > + *    - VF resume invokes ->run_job() for pending jobs; ->emit_job() overwrites
> > + *      ring instructions in place, fixes GGTT fields, then advances the LRC
> > + *      tail (and WQ descriptor for width > 1). Required submission H2G(s) are
> > + *      reissued and fresh WQ entries are written.
> > + *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
> > + *      in order via the message path.
> > + *    - Start the queues to process the queued control-plane operations and run
> > + *      the resubmitted jobs.
> > + *
> > + * The goal is to preserve both job and queue state; no teardown is performed
> > + * in this flow. The sequence runs on the per-GT single-threaded recovery
> > + * worker with a held runtime PM reference.
> Since this explains the VF restore (or rather VF post-migration recovery,
> the largest part of VF restore is done earlier by PF) only from the
> perspective of submission (as it should, in this context), it would make
> sense to put here a reference to the actual VF restore documentation (DOC:
> VF restore procedure in PF KMD and VF KMD).

Sure.

> > + *
> > + * Waiters during VF resume

> VF restore / VF post-migration recovery

Yes.

> > + * ------------------------
> > + * The submission backend frequently uses wait_event_timeout() to wait on
> > + * GuC-driven conditions. Across VF migration/resume two issues arise:
> > + * 1) The timeout does not account for migration downtime and may expire
> > + *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
> > + *    signaling a fence).
> > + * 2) Some waits target GuC work that cannot complete until VF resume finishes;
> > + *    these typically sit on the queue-stopping path.
> > + *
> > + * To handle this, all waiters must atomically test the "GuC down / VF-resume
> > + * in progress" condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
> > + * after wakeup. The flag is coherent with VF migration: vCPUs observe it
> > + * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
> > + * If set, the waiter must either (a) abort the wait without side effects, or
> > + * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
> > + * that occur while GuC/CT are down are non-fatal—the VF-resume path will
> > + * rebuild state—and must not trigger recovery or teardown.
> can we rephrase to reduce the amount of dashes in last sentence?

Sure.

> > + *
> > + * Page-faulting queues during VF migration
> > + * ----------------------------------------
> > + * Page-faulting queues are susceptible to state corruption if they are runnable
> > + * when vCPUs are halted for VF migration. Consider: vCPUs halt while a
> > + * page-faulting queue has an outstanding fault; the fault cannot be serviced,
> > + * the GuC attempts to preempt the queue, but page faults are not preemptible.
> > + * This creates a deadlock that can lead the GuC to reset the page-faulting
> > + * queue, corrupting its state.
> > + *
> > + * Mitigation:
> > + *  - Before vCPU halt, upper layers must issue a control-plane suspend message
> > + *    for all page-faulting queues and wait for completion (i.e., ensure they
> > + *    are not runnable).
> > + *  - After VF resume completes (e.g., global start of queues), issue a
> > + *    control-plane resume message for all page-faulting queues.
> > + *
> > + * The Xe HW engine-group layer already provides suspend/resume for
> > + * page-faulting queues; the VF migration flow should hook into these helpers.
> 
> How page faults will be handled is not settled yet.
> 

Agree. This was speculating, likely not valid. I can remove.

Matt

> -Tomasz
> 
> > + *
> > + * Relation to reclaim:
> > + * --------------------
> > + * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
> > + * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
> > + * message handling, and all recovery paths) lies on the reclaim path and must
> > + * be reclaim-safe.
> > + *
> > + * Practical implications:
> > + * - No memory allocations in these paths (avoid any allocation that could
> > + *   recurse into reclaim or sleep).
> > + * - The global submission-state lock may be taken from reclaim-tainted contexts
> > + *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
> > + *   must not allocate or take locks that can recurse into reclaim while holding
> > + *   it; keep the critical section to state/xarray updates.
> > + */
> > +
> >   static struct xe_guc *
> >   exec_queue_to_guc(struct xe_exec_queue *q)
> >   {
> > 
