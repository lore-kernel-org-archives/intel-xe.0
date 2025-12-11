Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B3FD43359
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E2B10E561;
	Thu, 11 Dec 2025 22:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqT05b94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3B010E561
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765493256; x=1797029256;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OxED8MDBTZ6NhuQr0fQkjIHk74+5RmxDAVtil0ulx3s=;
 b=LqT05b94unTDqrPkX7Wx18zorumlBWQDICRfRaPPDShxwtYXiTOScuDn
 WSLBJm5/fWkgOdLReuKJNB8NBydbJv6XHTvlWEFg34CHGnvbNjIJdhehj
 EMvpeMTfQfu4XYPVsxcMkiaEkQ+kPRfZV7kvlbNydeNPeCuALfq7BjJUC
 RE/EiPUqgPct4IrtgMOorYUYuJs52UGbSrJ5MZ+9Uf0jG0KUwjWbKBtqG
 dFQ8BBJ/hVXXD1FzioIenqfJAAuux3m+AMZy6FdXGh4zTqNktSKLMyXeT
 BZBKu7wgxtDqxQhEFT3z78kyP8/IF40SuFH6uhGLLmMjyVEEcf158JSjd g==;
X-CSE-ConnectionGUID: DXuO1k1mRW261Z4Mo5mJHw==
X-CSE-MsgGUID: 1vUSGgn8T2Keh1cUc77dEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71332066"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71332066"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:47:32 -0800
X-CSE-ConnectionGUID: rrpZvz3HRoSQGkd1B3Ejiw==
X-CSE-MsgGUID: mgNW90KzQVqV3f5ORaQT8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="197394309"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:47:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:47:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:47:31 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:47:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khiEsA4UvoXSqi1h5zhySvHls9IO++Ns2tD+p5fB4McihAJK467ZQdpeQGlByu36R7B2tKXdO+PUZk2V/YSUg+yI2UOgJVNJWVE5fZ3We2ZnnJqipQbK8m3ZFmde3R9a6Xc+xZGQpOmCANylTsMYk4F7m4Z8XGH4Tl81HC3huEP0SmnAQzV64befTP0EzDI4WNSTNQeNYqX8+Sbo24KjyWPjuMDYQItaOOmJ4SMA08Ge65KxJDgSz7uYZRKPSqxO4vtXF4aT8YCfdcP8EXeWUtiG7bLn9MJQQJri3Eb+mwxSlTWlF9BnitWI5V+o9o8cK5v24OJksMJGajWuQ/6lwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU/GPVKRVB8aoV/vHnVaR9rjjtrcF+3ngl9dtJvu1a4=;
 b=m3JWO0wx73OpNA+zg9K+8ZDoFRw4YhCnjWTrh5h/tXH+7JojnDkB+dtjHC370VnL+pCCyXpDTaDNd4RJ8Q5gj4Ugfk/5utsVn71lzWuir+w8sMQG2Cb6Q83qD+pvTvd7+Gdii8uYK2KCJYdp5v6VbEJc4/BgLEvAwzYDTi/qze8yw9RnYlf3lM0+KRG7lJEVmx94tvNDe3yHSsEV/7CPoJNxpvFfnfAVAVXwKlRnPcZYMUaGFlYI6DNYOCVZcuRtsxZOOyZDBGuOq3Arr5bJPLSf0pgndkNIn0qSrsP4/L0+78xxYgShD5MFu28oOpV+KQWc1jlt7EET9EDTCXuPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 22:47:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 22:47:16 +0000
Message-ID: <da5593f5-5f2d-4405-a9a3-f8dd2f22ae8e@intel.com>
Date: Thu, 11 Dec 2025 23:47:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] drm/xe/sriov: Add functions to set exec quantums
 for each group
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-24-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-24-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd7c873-b841-4bd6-913c-08de39073b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUxMWnl4VlZNWWQ2anFxMmJwNnNsM3V3L3lxWEdTVUxQZE40NkFPMm8rVW1w?=
 =?utf-8?B?UXVVMkIwN0x4OUFpRHo0VGlEbEcxNlhnNktTTHFZZFh2YTllenFRdk5BelBL?=
 =?utf-8?B?Z1IrYkRleksrUmppejkwL3NUZUlWODV0Y0NDUEcybmRIMUxRZEgrVlZoNXlp?=
 =?utf-8?B?NGE4Tk56dGUwVWhPeGdVWFZ2anNhUCtnUTJmdDlYblluazJJalNpdENoT2VD?=
 =?utf-8?B?TzJIa0xxcXNsWitqcTNvcE9Fd3BuNHV6dGlqQWVDYjAxeldRcWRmZnpxRUNT?=
 =?utf-8?B?SG5xQUVZTEhJMWFqTENGNml2RjhBa1ZqNEpWZXhKL0pSQ2s2ckoyQVlsRTJC?=
 =?utf-8?B?Q1B5RkM2ZjBPTlhsNFE2QUJWSjI3NWpEMFovOFFHaFVNazhFb2JsaWduTFV0?=
 =?utf-8?B?NlBGTWQ4MHJUdXhpbmdpMEdKb2FtWVhWRTlSMklWaEppZFlJWjVPWTVoTGNZ?=
 =?utf-8?B?bWVoSTZLMjFyWU9LaGJRNXJ4RjRnZ05HRCthMjI2TDhBMHhHR0t6RDh4RW5K?=
 =?utf-8?B?OTlkUzBPTWhZR3BLMTRjaFRHUThPK1BaSXhMaUlnU2VCTWFWRjFKbjlxTmpx?=
 =?utf-8?B?UnFQKzVQcm90anJ4RUMzbG9HTm5taHlYY0F1MGxsN3RVaXJ3cmZqbDlHanRB?=
 =?utf-8?B?OVhEbStnUjhGVndlZjJ1TlpZTUtNQ29TeUZRVjQyWGwwdlh4WWJlVmpic1Iy?=
 =?utf-8?B?Y2k1TkhKVFY2aUJqS3Vsd2Jidm5NeHU0bGZwMHV4RDBTT3VWaWxuVW1SQ1RV?=
 =?utf-8?B?emxyYUdtcy95aHluL1h2bC9WckN2ak5FUFhqbDhlNGJxSFBQczNXemt1RmMr?=
 =?utf-8?B?ZDRZempVTGZ1Tjh3cjRDREg3LzJNWVFudmpxVHVtK1NvWG9yTDBUS3d5ZE5V?=
 =?utf-8?B?d0oxRHBWc1NMcEZ1NzJPVEtJQXdKQldjVjNlSzR1RkJNd1JxUlExeHRmWWdr?=
 =?utf-8?B?VTMzUFlLREFNZWpkU3ZXUDVYUXdaU3RpSGFHYlpwa29sUGdVMzVrTEZaWTE5?=
 =?utf-8?B?cWtPd3BYTytEQytVekdjRU53eS9SS3J5UzVGRzZKWk40K1lYNDBzM1hzVXlk?=
 =?utf-8?B?VUFPQ2h0Q0lCdzJOSWpPdG5RczVFMU9ueXpkRFQrem4wRDY5enJWcW5GSVVS?=
 =?utf-8?B?Qnk5bHRtRTJpckpYQlJpM3RrUTRiTlZubFc5dG1DYUpnblpPNzNqTHBlbHNV?=
 =?utf-8?B?NGk3SDFMUExPcVdsUWkzSlYyTW9hNWlqTllIMHl2SjdqYmREa1N4WDFwV2E1?=
 =?utf-8?B?Vi9KSW9DK0xDSjdxVWZEUWxUQTRMQi9VOENQY0FsbzNQUDh0ajhGNkJqbTZN?=
 =?utf-8?B?amhrMlBvaUpwek1iU2xOZWhaVTNpRVdzaVRkclluRzdvTzIrSUplQk0vaTd1?=
 =?utf-8?B?dk8xbmtSdG94UXVVYjlJS3VOa3VGeUZpQUNJVnZyRW02WU1hT0ZYQ2RZUXIr?=
 =?utf-8?B?cUpZNmdIMWFKb0RHcWU5Nmp1OVExbVFTMDEzVWxRR2RrV1c1eHpCYkM3bldh?=
 =?utf-8?B?cmpFTUV1MFpDWDNjYlNNeWZFZHJ0OCtZRXEyMUlEUmFYcXlnQWxCb2lHSlpt?=
 =?utf-8?B?ZCtQZXFTWlpobGk2RGE5TThMeGxMM1JERmxTZHh1VUtEbTFya2o0MEpQb1FS?=
 =?utf-8?B?V3huNzJiQms3ZVIyZ3NXV0hDMHZaeEYrbXpLa2JNMkpIY1BVUjlnaTVwRXFw?=
 =?utf-8?B?N2hDQjcvOFd6MXErWU8yT3NMbzMwYUFoZDBJLzlGaGM1b0cweFJuVk5mdnBK?=
 =?utf-8?B?RW83Y2xqTnJYZVpHZFBRaWEvZ2VkdHIxNlgrR2MxS0NJQ3o5c2FyQkFSNWxL?=
 =?utf-8?B?S1NFN2VPRjBLUkx1YlhETmhVbFBLTHlGTnNNRGdUTWl0TDY1YVkrTGMwRkIx?=
 =?utf-8?B?YUErOU9LQmsxa216ZGtMak1NN1duRWtNNHdyajQzQ2hGWDQ2K2VGbkZKeVBR?=
 =?utf-8?Q?aLyX0H+Lywl/fEthLaYZDtlBrHu/NIXK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWpjTVJOT1hkMVNHNzgxa1FEd0RLR3p6TjNtcndpSTQxMGtCWWZ4REdVTFVH?=
 =?utf-8?B?ZExUaWRKUTRHTmw0TjNySmR0ZVVIR1dqQWF3UlJVcnhQZThQR3o1MVg3eWJ4?=
 =?utf-8?B?UVVadVM0WThuMlFIcWJjVk5tWm9aVFcyYWNHWGs5cFQ0ZFozdWNPVytPb0ZJ?=
 =?utf-8?B?VWxXZkx0VXpNWmJ4eVJ2d2ZxRDVUYVFNUG5tbjFVd2c2aUExWVVROE84aXdk?=
 =?utf-8?B?Ni93djRXVVExZXRMSktQcWUyc2w1dFZpRXRDRWdFMGxQNWtVUlF3bU9EcHJz?=
 =?utf-8?B?bUgrcXFJZWJQTmJtMitvNEwwckxIejBxSFg3cHZQeEFMdk84cTNuUW1ZbVVm?=
 =?utf-8?B?OUFISFJTUWN0TWFJQ29TSThyVFRaSWJISEEvMFJQaGJyNDgwS1JYdkp1a2JN?=
 =?utf-8?B?S3NDSVVVeFVaVXZYM0c5TmxXTTVNMXJRK0krSUQ5dU5DenZoSlU3bTMvVG5G?=
 =?utf-8?B?SFB3WXBUZmpRRGdZWFVYaDlLbUEyVkt6a2w2R3JHK285UVhUQkVWd2l2TStN?=
 =?utf-8?B?NEJ0U2VxL3lsaUl1eTMzUWJxTDcxNG1VRStjRExBSWR3Um81S3VOSkpLRmZw?=
 =?utf-8?B?K0NobTRoa2ZCVTB2cS9aemRFd2JVTFBrM3pydUVOWEhzd2VjSlhxd3FHQ3Uv?=
 =?utf-8?B?TnRadHhpbW5CRFY4VGszWlJTQytuaUpVd3k0cWcreEF0SFFZcXYvRkxIb0R1?=
 =?utf-8?B?RUdGYlZ2b3ZKQkk5RUZDelVCQ3NJYmxERy9nRFE4SFZCT3lnTnNHdEEvMU5z?=
 =?utf-8?B?YUorSE5QOFhDam1aOTIyN2pkdFJQaU1aRWRmZWl3UXZUa3JHdFd4bHFhOU1i?=
 =?utf-8?B?RDFNblUvaHVPOXo2ZjVBd1hhK1A3dCtRWmNUUi92TGVvbnNGVmJ1Q3JBVk9o?=
 =?utf-8?B?Vk91bVo5UGMyTXMrQVdZWTN4Z3I1YW5BMXVyQS9JaU84cHZONTI0bVh1Snh2?=
 =?utf-8?B?M1dIOTViZnJ3SWRtMjczQjl1WmFQdW40RlhKUkVLMlllRTlNSGM2aXlHSmZw?=
 =?utf-8?B?K1JMdS9GbTFJWnYwYVdtcUg4OWk2YlNKcGxsYkU2NWNIRFQ3RldPeWZRcWJS?=
 =?utf-8?B?ckt4SDZxM0k5TlV0Zjd1N1dUQzk0UEIwajdaUUlCWG9iejNSL2NlWElQK2cv?=
 =?utf-8?B?UEFicncxQlV4b20rcTRvNno4ME00eFJaTExvbzEwdXgrWlo0V1VFUTFEZFZM?=
 =?utf-8?B?OHFGNkg0MlBzUmVycjIvUlhhNFd5SGNURUY5emlkVW1ObUJZa3FTL3hLWG1k?=
 =?utf-8?B?QzYzZ0tLWUlCejNNSUk2UVg0OWMrQnBqdjJ2Mi9hMmxlZ2dUZGNFZFhpVlhO?=
 =?utf-8?B?aXJ2SUZIRElndFdCZDVuSVB3QzgzcUR4c3FEZkFyNytTN0t6Z0NQUHBHME9s?=
 =?utf-8?B?S1laYlRyY2Q5Zy9GcGR4VVgyMXNtRFlzMmFXNWducDMxNDd4QnlkK2ZwU0hm?=
 =?utf-8?B?L1BDL3VZekJRdmJPcGREYm1DcG9aYWk1YXhHaEpZcnlhaVJxeXRJa21IejdK?=
 =?utf-8?B?N01uZytpWmNTQ3RaNmdaZ2VFS0tDQWVVaWVDK3Y5ZXVyaWZ6Z2E1T1ZQNW56?=
 =?utf-8?B?NC9PQWd5dGRSMEJ5MlZHQW5heG0ydWhxYm5wcEFwMWVSY245dXBCZk1kOTlQ?=
 =?utf-8?B?S1o3WWtWT2h3T1NYQ1EvMEtqR2xoU3JyTzZsTGZOUVB4N0pIaUV1Yk1laGdu?=
 =?utf-8?B?Vmc5blk2alR3STlETXpndkNpODZoYVR2UWhhRU40OXBLS3hwL3VqK0k5R3BW?=
 =?utf-8?B?SVZtQUlmMEsxeUJMdjRrS2pKaUlYRW9xbHB4YldtVzNWcXNPQ3ZEUHNZaDJD?=
 =?utf-8?B?QStVZ28rby9JbHg3eDMvL3Y2M25MbzhxSXhMZWZOZDFDeThCMjhObCtvc0dK?=
 =?utf-8?B?TzdOUjRiSVZJZ3VxZERsM0hrS1YwMk5wU1dKQWltVXJ1ckNQK0ZTcVVWaE5y?=
 =?utf-8?B?cTY2VEgxcnB1eFVON2lVeHlONzlqMnloQ2pZM0ZlVVUrK3pKckpWc1hBM3FG?=
 =?utf-8?B?dmhMcjVyb2pNc1ZQcXpId0pmWUl1RnBHalY0VGpWOVV6SEhxWFhSNmxqdDJM?=
 =?utf-8?B?OE03UnJpUzRZTkl1L3NTdFpNYW1YcTU5cUlpaWNUbU03SHdid2J3ZDIyMGRJ?=
 =?utf-8?B?SkJDRkhmSDIva200VmF3UkxuUmNIQVRpQzZySnh3WXFoR3JWdU1ocHRNSUw4?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd7c873-b841-4bd6-913c-08de39073b88
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:47:16.4321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ayiYjjNgRZgwVbixvF/7wfHhWI5ujSlXdEAPR2QLx/sqfvpxKF/47E+cGL1/C6WHSxpJnwI1f+Vbb7ieh0hqz0vkTDz3W6KAd0MUdDiCjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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

again, this is PF only patch, so:

	drm/xe/pf:

On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> The GuC has a new dedicated KLV to set the EQs for the groups. The GuC
> always sets the EQs for all the groups (even the ones not enabled). If
> we provide fewer values than the max number of groups (8), the GuC will
> set the remaining ones to 0 (infinity).
> 
> Note that the new KLV can be used even when groups are disabled (as the
> GuC always consider group0 to be active), so we can use it when encoding
> the SRIOV config.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with another nit below

> ---
> v2: drop the option of setting a single group, add an helper to encode
>     the scheduler configs, rework setting change logging code, code
>     improvements (Michal)
> v3: use GUC_MAX_SCHED_GROUPS to define the max KLV length
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  14 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 165 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |   2 +
>  4 files changed, 181 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index a5be29abe6fe..05dff9c74ae1 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -392,6 +392,16 @@ enum  {
>   *      groups and cause the latter to be turned off when registered with the
>   *      GuC, this config allows the PF to set a threshold for multi-LRC context
>   *      registrations by VFs to monitor their behavior.
> + *
> + * _`GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM' : 0x8A0E
> + *      This config sets the VFs-execution-quantum for each scheduling group in
> + *      milliseconds. The driver must provide an array of values, with each of
> + *      them matching the respective group index (first value goes to group 0,
> + *      second to group 1, etc). The setting of group values follows the same
> + *      behavior and rules as setting via GUC_KLV_VF_CFG_EXEC_QUANTUM. Note that
> + *      the GuC always sets the EQ for all groups (even the non-enabled ones),
> + *      so if we provide fewer values than the max the GuC will use 0 for the
> + *      remaining groups.

nit: maybe we should mention: "Available from GuC FW 70.x.y" ?

>   */
>  
>  #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -453,6 +463,10 @@ enum  {
>  #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
>  #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
>  
> +#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY		0x8a0e
> +#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MIN_LEN	1u
> +#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_MAX_LEN	GUC_MAX_SCHED_GROUPS
> +
>  /*
>   * Workaround keys:
>   */
