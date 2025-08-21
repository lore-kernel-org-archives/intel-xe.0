Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B3CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 07:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C1310E891;
	Thu, 21 Aug 2025 07:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fN1Qn/8f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D6210E891
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755761696; x=1787297696;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qMHKBk8694dbRCu/tZyWctwpVkFZWPo+bibXVg/YXDM=;
 b=fN1Qn/8fDuS847DFadywCeKO4NjY7/UDpcArkvUqe+4+JgXn2bPldDsB
 QKL3o3CsSCHn2lSPtUYWFytx2YuBucs/AXVika9jUGQDCu5fyr2lY2UeG
 UPY65KF36pYJQb0uZ1X9G9Oiboj5HpEMSrj7Wya26VmkgatwUfHF3TUUl
 /NEVpKWtxwv0ezECGV9NngmQpECgZLSuGnkMw9LvOjPpNtkrVCZ2vSOAU
 7lUfnBgE1fVm57RqXjmQ0Vaepb7PpoFXf95Kp8GnpGKCTfwdFgijovjuC
 470K6OpV3kUbTiUPiH/8UqDR0IX0CW1cqKpIizGKZicmJ6meR6V5uJfGw A==;
X-CSE-ConnectionGUID: lW4HvCOxQRSa13TXD8aHrA==
X-CSE-MsgGUID: Bi1ZOVx9T3SHjUGqnJd77w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57067461"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57067461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 00:34:55 -0700
X-CSE-ConnectionGUID: yadv932BRvGB0+W21gxeUA==
X-CSE-MsgGUID: oEeCBVVQT0uuF79MldzIqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168701695"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 00:34:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 00:34:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 00:34:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 00:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2y2VpsOvXwX8YdjFEqobOTa1EvhYQrGjByMpxHlAStzCCCUfVwtyjVb25FJuY0XiMKhLnmoI/10tOYPVcU2Q3MsFQbO1TkLDMu60NjwgSCBdGQnG81yIWOawwj0xVNxV7BnTvDQlhr4CVp96pfiBKn2qPSpFIp9OfD1JKzcOXaEKfFBqLx0fmjL3Tmr+rXTyldHqOk2WEocYw2f9JmGWDfjL2QoqlVjehPDnVxiBYDnCUuSUnDLycroK9mVvDOvexvFKgKOPMDaBEIaU9n6uVFGY3SuOzZfp0yqYHjSo/Ob0q8uO7PdiGdig0DJUaBx5P6glioCSsUpYcMsUxC7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYlxcMWEvP5LEx+JV9gVfdgWfIdja9mrFTF18hQgcdQ=;
 b=Ibhb+IjiJm79DXK7jrbUw1cVetr+zZ4lpF8mdBlfkxCRusSoU2x38HEgp8igwC0jfAn4w6YEYK9w7F7A9hSC610gMoDdcWrZDxJJe9l55mO5/kdjYbpc18xTukCETVkJbQhMQr3VjeZFYGv680oZiD/oMdwEQJRfoCp4kpBs0kwGvH9Qf8MeA6SSyxh2ymZnSxBbJfGZ0nDNSUo+Ww8x5LjQQ+z3O4OoOts1on5rBVx3oRFGjwMUrO0tGtD8UbaozEfFw1r72+QDSd1ckTtogEEDG0Gl0oGvHDBL8dGpMdyRzWHqJXDF/Fc9o10oOf6l/QX9TdPdDLrit6SSCcIN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 07:34:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 07:34:51 +0000
Message-ID: <1a4d270b-9f1e-4423-8260-15ef7d7d9a09@intel.com>
Date: Thu, 21 Aug 2025 09:34:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Enable CCS save/restore only on supported
 GUC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250820114829.7447-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250820114829.7447-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b958bc-7a63-478c-213e-08dde08536b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S202cWhUemxkSjEyVmEyakFYN3h2N0k3K0tpZE9FVXk3MzBqN3RIYm11UG5L?=
 =?utf-8?B?V2pmWUNlS3pSVkRYdXFXbnk2dXZXNGY0SjArQngvbG1MTHR5WWRqR3lVb0gy?=
 =?utf-8?B?VGFzTCt6emdMOEhCNGJZc2FZNkVJdmppc2RSaDZaTWUxRmJOU2xnempzN21I?=
 =?utf-8?B?aTBEUUhBTlZzWktSb0hhU0lVUTdoRnlLbEllN2U4b0NTZFdYR2krbGg5MXVv?=
 =?utf-8?B?Umd4b05iTzc3Y0dVM3BFV3c4UWZtUm5KS2xPV2JSOUcrTFpRMC8rZm1YYmdK?=
 =?utf-8?B?T0pXb3RLL3RVakxrc1I4MUJTSmlwNEpQR3Q4OWFXTVg0dWNyWjFDOE1hUVE0?=
 =?utf-8?B?bFpHRjc5U3pXS2Y3eEU1UXQ5b0dBZHllODkxWXowZGFaOVd0OWpDOWhKTGIz?=
 =?utf-8?B?cHoxQXI5ZyswcjFnZTIvMGlyekp3ZHRWOUlUOHBBZlhubkZFMGFjdDZGZGNr?=
 =?utf-8?B?bG1EaEpBNlozWm5JQW1iR3M3alJOQXIxd3I0R1JhWmwrb1UyV2c4UE5kUnM4?=
 =?utf-8?B?NGlhejJqbHpVZW5uRk81YU9sdHljUHJJbEZNRDdNY3FIeldYQ0lnRWFucG1V?=
 =?utf-8?B?a2U5LzZuMkFTd0JmNDl1bnRZbE1KL04xUzk0cllwZFhTNFRFL1BVbmtHVWFF?=
 =?utf-8?B?ZHp4bksvNFgrU2UzRE9TczNFQWo5WG1qNTVhcTJlcXNvNTMzeVZNNWg1SUEw?=
 =?utf-8?B?TDBPbVFHcnVYdzg5bVBEQXNNZzBueHNmWld4aE80RXBLNVptdkVvTVp6VWtW?=
 =?utf-8?B?N3JTTEhGV0ZzdGYxMXVrd3FsM0NGV0xQb0Z4a0UzajYzN1h0d3VWWEc2OXVl?=
 =?utf-8?B?OGxtNFA3NStkQUdxSTg1Y3VLU2FJMHFlZlUwaFNyK29YaEFlRTlPNWswR3g3?=
 =?utf-8?B?cUVzVTJDWDdtczBXYnlybkIrODNiQ0N1QWRFdTRYL3BZeU9PZHU0andCTDZ5?=
 =?utf-8?B?d2wxQ1FjcnQ1OTBrbkhLU1BsK3JrYytxcjlEM0tGUzNZYU9XLzZ2VFhLa0RJ?=
 =?utf-8?B?QXBsZjZJY1k4RTlLSExpdnNjKzRTaWNpRVFCcmxHNlFMSEpIaGNtQlJNYnpk?=
 =?utf-8?B?TnpiSzZaSXdSYzU2MytsSjZpU3NEK3F4OFhXQU5LRkhjNFN5dFlldHphR1ZK?=
 =?utf-8?B?ckxpQmhRQzUrRGpMUUdBS3NoNEVSamYvSXNJbFFNbUREcDl6dTIyOGdHUGVi?=
 =?utf-8?B?ZUlBOFFUV3VkZkd4VXFRU3ZkL0lLWENhdk0wa3ZhWkxJZjVmZ3ZOQ1FDUVBC?=
 =?utf-8?B?S0ZVLzVuTUJHS2lhYmJadTZocFF5SjdPNmt5end0MG5NR0J2WXZHR21QakhO?=
 =?utf-8?B?bjQ3OVBDRXVTQ1ZLYlVad0ZSU1BjK0RTbFBBVC9jREpDdDdRY1BsTEFwVnFY?=
 =?utf-8?B?VHZSSVRZaW5QZ3d2VlpsREJQOCs0VlU1cTkwVFVvYkxma2ZYdDJ2ZUcybGxP?=
 =?utf-8?B?NEltVzZpb3htU3B6eEo1SDFBc1VQOXVsUktUUVNSTTYrdlpvbEw1dk11WlBC?=
 =?utf-8?B?TmtBNzZOWVN1VEdkdFN5NE1OT3NuVTB4U0NEOS9aL2VkL2pzNzNqSkNlWmpF?=
 =?utf-8?B?NjBnRWduVHVVSFpLaVgwc004eHUyUythVnlGbDVVYmx2WUxCaFZwaDVZb29H?=
 =?utf-8?B?YXpjRHFTdzdUTHZCaWJYTFBBSnNpVVZNblJxTHFIQ1MweXZ6T0trb1VjTFBk?=
 =?utf-8?B?akFaenBFeTViMUhpZU10MzlBdEZJVXRBN09mSCtINlVnOHQ4dGR5SmhCV2VI?=
 =?utf-8?B?U3lwMmhMdzgyYjBMRDV4NlF0SC9BM1FtNFpMZm42RzBnSUhlcTJtZnk2YWJH?=
 =?utf-8?B?Qkp5eVRuRmlRZmNNZ3VKakpjV3Z1TDhDT2N4VmhpRzc2TTdqRWx4TXcwQ2lL?=
 =?utf-8?B?Y211QkdidndvV1FMZXpzN3dWYmtHMldiemR2VTl3WVVjVFh4dFd6UHI0MXpl?=
 =?utf-8?Q?rsO8AQVgMAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VMc3hSY3p6Z2ZSVUhhUFpVRGxCUDZjTTNRTmdmd2NMOGVWWHNZemFBbWdx?=
 =?utf-8?B?czlSM3phbGxQN0x2VnZEYmpiVnU4RkhBTkdjUmJZS3RaYmd2YlJmN0xtVnM2?=
 =?utf-8?B?R0s4YndNNGNLeXdhK2tpdmsrS21tRnpCSDdmSDhDS21zdkFyQXFQU2dRRmlw?=
 =?utf-8?B?dDl4aXA2UkZVajVnanF3bzREdFVXM3JRNnJSN0NScWJRb0NIRUlpZ2JYZnZq?=
 =?utf-8?B?TXJDMHJXTDNPVEVUUUFTOGM0WG1qUnlqeU9SaG1UZlc1cG9NMmhDaE1CZHZK?=
 =?utf-8?B?ajFBQUhLZTNIREozRHFrMFdDRTZrMkhrZ1VmRUlZK0U4bGova0JaTnMyTUtO?=
 =?utf-8?B?TFQ4bUkrVlpZWTV2Zlovc1pzVjVLYi9ubVhoYlhtRFBDK2hQeWQvSnptdkNa?=
 =?utf-8?B?ZGdkNzJqRjhRZmFCY1pxbmNuSFVJM1RFcnRuNjRsTzBrNEh1L3VMcTZDQWRm?=
 =?utf-8?B?TGk1TUswMVpnOWpDcCtaZXRCenpkYzIzakVybFJsYWRkbzZNb1hESEsyb2cy?=
 =?utf-8?B?d0V4S2x2UU1XWGJiWlZZdjEybVlCbWJpM3cwa1d0djYvVEVNa01DR2xtNWhY?=
 =?utf-8?B?bVJXQzRyS0U5TVhQdnpBVm9mVytqWWxseTBOTzhjMzh1RVhOcjFxQjRBWVpj?=
 =?utf-8?B?dG4vOTFiL05DWjhFd2VtdG1ka2p4a3U0ejN0dXo1cEVucVZETlRJa1hYd3RS?=
 =?utf-8?B?VU9FNVowTm42OElrRW53QjQvQmZyaDY5bVlScmN0UWQ5WlR0S3hOcFlsMTg3?=
 =?utf-8?B?SDY2TDJtODV1WjdXbTdvenBjVUZkR2VEZ3h5bC80alZUNS9tdmw2ZWE0dnQ5?=
 =?utf-8?B?TjR0QmFTV2JqSnlzQUxwOWs2VWdTdjZGeVBYdG5EMUc3MzFHMTRvMGlDRXZF?=
 =?utf-8?B?OEs1MHdTdGplNDVEcnB6Sjd6L3N5cm5aU2FYLytlbTJ5Q3VUUDJtWEVMaW1q?=
 =?utf-8?B?THR3dXY3NENQT3FlUzBFZ1Q5aFFBNkhONVFlcEs5MnBOZllCaWFWNnNnanZJ?=
 =?utf-8?B?Qy9zWDFuYVRYcGtNRUJ3MHowUk56TU0zaElQNllQREM1TXIvQUZ2MXJ6eHVS?=
 =?utf-8?B?dXlibjNNUGxWVUR1Slg4L2xiM3B5ZGQycDZrSVdkNUFOMEo0RncvWmhCM0N6?=
 =?utf-8?B?dHRTVzZZOGVJelRLMUlPalVkRlk1d1AweHVPUkw5NUlKOStHaVY3RXB0Q1VO?=
 =?utf-8?B?dm5jRWszRU5ndW9TaFAxdjJQdFR2T3ZiQllVOGhFa1hEOVFhZWs1bEpiWnl0?=
 =?utf-8?B?K0NRV3JoSVdOT2g4TWEvQ1lQUm9JdDZRYWFjMmZacHZ6Yld3Sld1OUJWRzVi?=
 =?utf-8?B?Wi9MM0o2cWNpajhwK2pCbUlPYURTZUp5Tk9JV3dLc2x2RlBNTVhvVzNIbmk5?=
 =?utf-8?B?cm0xOFRQeEswRzNHMW9VMy9HUGIyMGVRdUc0NmFNcm5LTFBDUjhoQ1dLZWpo?=
 =?utf-8?B?ZCtneklFdnRKWjltaHkwRHZyOUVEeWZoUi9uaHh0T08vYkJ4cFduamR3b01k?=
 =?utf-8?B?eWFnblM0dlBFVUJDTWNhaGhMSjNSOFNIbnl5SU1USExyWUdCZklzRzY3N0M1?=
 =?utf-8?B?bVlKQllOTFhlMUhIL1FDZ1NaV3pnR1pNcytwbWxsMVgxN0ZYM2ZsOEl6V0VS?=
 =?utf-8?B?YTJvbHhLSlB5US9jeFlKSytsNEFGTnNIRDl1Y2F3bFFzZkZOQmZmZlU3aHVo?=
 =?utf-8?B?UWVGczNmYXNROUQ5Rkh0cHJILzJCNStxWjE0ejJjZm1GU0NnNTU4dFJLbUdM?=
 =?utf-8?B?WEV6OThwa2FIcHRDU2NiNWtKbkJscUh0NnBHUXhKMHdKeVQrb1FEN21CSm5h?=
 =?utf-8?B?NC9kb240bm9saUxLVlN5aDVZM2U3bG5YMGFxMVpEQjd1bmc2TVdUNDBuaUR1?=
 =?utf-8?B?N1hMYWtkUWRaQlgwL1JxaEtva09CSXRLd05uMDBFNzQzR0NjSUp5Qnc4dGpj?=
 =?utf-8?B?NWVxMXU1cWZSamwvWUp3TmNHY0JBRGd6TTZYMWRFRXZKRjBvSWFkSHhwdEJD?=
 =?utf-8?B?MlBFdkd4c3V0Q3c0ai8zM2hTVU8zWVhwL1JVeklDZzNsazA3RkpvbHk3ZUhW?=
 =?utf-8?B?OFdDdXdnZTBLVVREL2pCTjRlbUdEWStBNGRxby9iSllBOWRtWkpxZXJLVWUr?=
 =?utf-8?B?SS9Zcmw5UzlHcmFJRGlyT3loMS9wSGd3emozZjJDOUJqK3Rta0JleGlJcGhr?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b958bc-7a63-478c-213e-08dde08536b4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:34:51.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Z2xU6RApLriKAXFB7HdZS3A8aEn7yFF8YTHbHoN83D+RYbczB6AH9q5B3WEKeuHfxLu9agvwiRSWWb11aCeDqSxysHME9fpWbzreBJMM7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
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



On 8/20/2025 1:48 PM, Satyanarayana K V P wrote:
> CCS save/restore is supported starting with GuC compatibility version
> 1.23.0. Gate the feature on the GuC firmware version and keep it disabled
> on older or unsupported versions.
> 
> Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> ---
> V1 -> V2:
> - Fixed review comments (Michal)
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 4872e43eb440..9ace6f83c0ec 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -10,6 +10,7 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_guc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lrc.h"
>  #include "xe_migrate.h"
> @@ -258,6 +259,7 @@ static void xe_sriov_vf_ccs_fini(void *arg)
>  int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_guc *guc = &tile->primary_gt->uc.guc;
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>  	struct xe_tile_vf_ccs *ctx;
>  	struct xe_exec_queue *q;
> @@ -268,6 +270,11 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	xe_assert(xe, !IS_DGFX(xe));
>  	xe_assert(xe, xe_device_has_flat_ccs(xe));
>  
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 23, 0)) {
> +		xe_sriov_info(xe, "CCS s/r is not supported by this Guc version\n");

maybe "notice" level is more appropriate here?

also it would be good to tell the user what is the min expected ABI version that is required here

and "s/r" might be hard to understand

s/Guc/GuC

and since CCS S/R would be badly broken, do we really want to allow running migration recovery and then investigate random errors?

what about updating vf_migration_supported() to avoid recovery at all?


> +		return 0;
> +	}
> +
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;

