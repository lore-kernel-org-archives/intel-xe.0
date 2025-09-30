Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2796CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 02:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAED10E267;
	Tue, 30 Sep 2025 02:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgM2+LPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91EC10E267
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 02:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759199929; x=1790735929;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zo7UJxovad23/v1kLzeK9wNQ7ApcYAUxh22wFww9hu4=;
 b=AgM2+LPu6CDXb4Cvq6FBhR1fICqqAmoEM2jGVR9PD45SN0VQvh9IxUag
 EmluJ1F/D0tBFTb6tR0l8QpiC/C2P1LFL1sHbM5j2l3g72/2vrc+f7rb2
 n6LxUdnTwL6r0KfrNOZI2YdZ5nDvN1uGHG4ayu+3zCz6rDJ8yo1W+1r5S
 ipx+K3GxwljrRjY/r6xmgJ9TpbMe3P4PP6hcnnVtq7bJ0Je49NIVZcpFw
 Kg6bereD3v37c2/F+sMWisoitnG2CBmgDK6IwvCQU+5ECidIGPsc1jBwZ
 tT1AQmWcZ5pEo6QbSFLhugdh2oKxsTvNbcV/ajKZWfV9GkjlsC1Ukg7K+ w==;
X-CSE-ConnectionGUID: qKU9pQKlQPSMvtTYakZuTA==
X-CSE-MsgGUID: awLzhI3dTnquV+BrR9TKaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="49011014"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="49011014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 19:38:49 -0700
X-CSE-ConnectionGUID: Jsnh+GbsQ6KUjgPPZiCvyw==
X-CSE-MsgGUID: onwvEaNhTTKd2S1WMPzvuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="178781566"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 19:38:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 19:38:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 19:38:48 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 19:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbdB9MM96KySp5nSMme+qaT0XVuhxsRYtAay3jG2xJGIBG2p08sO3N6luaCcraoNCU3oJKaDj8+tY2CBfGfGBE3xE8gG3uLCn37G5oBrOM8sCnrW5v27IOHPp6OcRAz8B9bb/xG5Pwq+W4EUxJ7LvszmMc7jC+4SCXuI8kwYujcH2Unixh14LKDIduM6GbZqddCXP3S9gY1DFVUTCWgcO0hmOK/V3G6cytpI7NQtc4KcoihqMnm+wfcMK1ex/RaGaaGT+um3mPxJxVRA2UM2n7I/fui1dn0ViRBckvshK6yp4B2hUzXaN2ZO284GudE3oI4BuflGR+xlfH6Oi2e0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1hP3zb65Wsg73E83OwwGQ9llCWr0b2qLv8KyaYfOO4=;
 b=w+qnAf+qDVz09U0s7M0MiWic8/RlMBMy4TX6pTmc9UJjejQDNkCZX9D0Q0Wcwoiz2pWBWsJZduMA6CBTCs9bFT+EDbhe3EfjoLv3UFPqm6q3utdNC/A55JbQ2A3lwOgDod6sXbFakI7V2uOubFoCtGIOExXAwZZcwxo9TMijm6OvUlu/Uwmkw5zOfdHMYDpl81yP4gYtW492bJWdnJGigOlpJQ7+9rxH3tp0vEzWJJVrhXBz9dGmdqQYgdiwHaYPMEvGgo64/+TaxXh5x5PZazziTqQnpYRmOykrkT7WMOnmkjCnx7EdNSOvyHIGyCqIIdwizT00lhX3ZJl+PEyslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 02:38:45 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 02:38:39 +0000
Message-ID: <5c0b1205-185d-45e9-9f4f-1c5299d53cd0@intel.com>
Date: Tue, 30 Sep 2025 04:38:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/36] drm/xe: Don't change LRC ring head on job
 resubmission
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-10-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-10-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::29) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: eec08d52-48fd-48dd-396e-08ddffca764d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmpwVy82SWVQbEtaZXhQMFk1dU04dVpDNlBTckxqeVAwM0F2UnpYZHQ2YXNm?=
 =?utf-8?B?WmN0S0VUeWQ5SVhQdXptdGNlbTlwQWZNbFhRVVNDUjdIUnYzVHoraWFURkRM?=
 =?utf-8?B?cXRTc2hWSDhvMDhETjZtbGRpdHk0U2VEbC9xb0ZZWEFFVkpQYkREakFBdTRq?=
 =?utf-8?B?cWxXTm9XM0Y2ZWdQejBUNTk3ZzBSV0I2VzZacVJyWjA3V0NhdzhKbGFKamNk?=
 =?utf-8?B?bDc0eFJIaFJqNDhlY3ZlZWNiaFZmM0pBVmtYMXU2K1NzS2M5R3hIeEVpYTVs?=
 =?utf-8?B?UHJmUE43ckdvSTRqWmRLSE5vbUlRUXRoZEcxK1JlQkZicUluWGQ3VVhqSTg3?=
 =?utf-8?B?QmRPVTVvNlk2YWFlWUF6bzdvVE5QSk9WcHQyVnhRbVF2elFqSVdFQTI3Z29Q?=
 =?utf-8?B?R0NsbFpydjlKc0hhQXd6UUlUWXBsdnlycHdnSTcya0lPblZtVkRSNXR6MzZH?=
 =?utf-8?B?eVRleDhwQkRGWXM5RzlkTTVmZ25VUDN3Nkc3dkkrV2lWK1VTUnpMaTVrb3ZK?=
 =?utf-8?B?R0xzREZEemovSDZ3NjROQUw1dDhHbHdBcnRhcjRhSHUzcjJOQjE1bldlRDVi?=
 =?utf-8?B?eFlINFk2R1p4c29SenhXMGUxTlN4MW9XNWd5bGlZdFcraFNKeFBBb0o1Y0dl?=
 =?utf-8?B?TGJYdFY3V3BtZXZvUVhFWVJ0cEUybG5qaGhncmtmY1JmWC9vZDVtUVVYQ2tP?=
 =?utf-8?B?QTAxY2V0K2paTFdsSldjQkFoTzhHZHJaZXgvQXlsNVdjOTNZS2pKSDRrTmZz?=
 =?utf-8?B?ZWx3bVM1UkhodlRvREtYRHlFT3J5UUg2ZjdGOWkvY3cyc0JhMndZWVVWR2x3?=
 =?utf-8?B?UUVwUGU0aTYxM1l0dEV0aVg5TWY5ZndhbHRWcDRFL1d5U3R0RTc2M1MxRkVV?=
 =?utf-8?B?aklxR20zNExNWEZxT0lDdmsvcmVybGxZYzVCOVRpS09yQk1Lc2dqeUJ3TUNn?=
 =?utf-8?B?aWJSVDFrVUVTcmNja0xma2pCUk9sVjZFeWNpUExDeDdmc3VDMFJsbnB3ekt4?=
 =?utf-8?B?eGI2Y2I4Q1hEWEVwa3pKdGhDYTd2WVBSVk4yWXFlSGlyRSsxZlpXUjR4Ui8y?=
 =?utf-8?B?K1hxcm1PMG82cTFUUW4yTGRRYlkxLzVRSll6R3BEMmkyM1J6bVBqTmJFWitx?=
 =?utf-8?B?ajQrS3JXOEhBdW9FT1BKYk45eTJvem9SdHhnZWs4RmE3M2VDUjBPUGVPUlVi?=
 =?utf-8?B?SzFJMzRralp0cnZxVHpCMHExTFlkZjVDd1lkN3pNRjAraERkM0t1OC9TVWVH?=
 =?utf-8?B?ZTVKRXQ1YklKWllKUHVRc0txa2RWelVGUWozSzF5akk4MjVHampvRWFocUc1?=
 =?utf-8?B?ODRLS3JlOWg0VkM3Rm84d3RCUVI2TzFDSmpDU0NCbmovdUg4SnIvN1FOYnVC?=
 =?utf-8?B?cExxY0RWbStKejRyNzFQMmJJQzY3N1FWY3ZHc3V5aVY0bnRYd2xSZVdPU0pL?=
 =?utf-8?B?K3FTeUM1OHBLUTNmUWJVUml2cVhvQUxHQ0xtVDU1OGoyaW9DUGowVDg0WURD?=
 =?utf-8?B?bzJLQWZNUkV3WjV3L1FMTkRGUVlSVUptWHkxSXRFUmg1Y0F5UDJMbTc1RzV2?=
 =?utf-8?B?S2xFSFZVbnNNc0FBd2VxczdoSm5ZZW5VUVJabld1Tjl1NU81VXlGbndsZHNk?=
 =?utf-8?B?bll5L2RtbUtITlBFenFUbnF2MCtGZjBueG9GQU05ZGIxY1gwVVpuYUM3R2Mx?=
 =?utf-8?B?b2dPSndoN1Y1alZ4SWRvd0ZwQmEvbWVlT3BXZWpXckpSUjZzWkNvWlE0dFZo?=
 =?utf-8?B?R3lQc200SDVhTCt2am5VOUMwUXF1dUFUNlBjcG5pbHN0M0lUNkVyM0lUdS9T?=
 =?utf-8?B?aVdSQnhtQlJDTlZtaFJMQnlXL3ZKZUpZb2FLb0VLSXU0SHpVVFN4WkRVL3VY?=
 =?utf-8?B?dGlHNDE4YTM1UGhYYnFsYm1zNTVSMmdGUjBkU1BUazlYeUtoSVRsTWNKT1hh?=
 =?utf-8?Q?yjshK05bleh9QrWxUR3Cv1uze+1U8Edt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk5GeWg4WHJ3SVNYcCtQMk9IUzZrZWdMaGtzRm9YSjdxVzdDUFVoNGNHYnBR?=
 =?utf-8?B?UTA3RlBQWmxtR3FQWVJOMDNnem0vWlRHdlY1aFVZaHEzN3N6dVoyUDZReWND?=
 =?utf-8?B?T2tUWGZhcmduSDNpaVdvd1dJcWhBQzhnTVZaQlhOVW1BbFl3dDZqR3dnaE0y?=
 =?utf-8?B?L2tXTmppekFhQkV3Q1hUODVKSEQxbVhSaVRKaEp0ZDVhWkU4eFBWOEdkSWlB?=
 =?utf-8?B?UjBBTVkySjRIUHlIM3FhUlVBL1dJbWNSbUFrNUpSUXFJVkRyYlY1SmVCOWt2?=
 =?utf-8?B?S0hVTW9lZ0lYOXlQaWZSbEZPVEVsRkQxb3FJZHNCV29pT1V6eUN6R0NUUzFJ?=
 =?utf-8?B?dXpTcTVHdVJkTk1YemM4cEpBN0JIYVN1VkY1QTlOUXpJTmVxZmhUVjVaY2Yw?=
 =?utf-8?B?KytOald0aHViNTJCdEwyMy9LRlVFU0FET2dBYnV4c0w4MlJOUHRoTWoyaTJq?=
 =?utf-8?B?YVZRRFowbWU0U1NQOE4yYTQ5WTJnVHE4a1gvWkRjMlVKL2tXQXFMbmpFTzI5?=
 =?utf-8?B?NXdubHVmcTV3ZWtuVUh0RmU4Ni9ZRnZCdm84bE9VRGFMaDNUTmxBNmZHUmJo?=
 =?utf-8?B?WWk5eTREVm5IejRnRFdjbXYxVFNNM0Q0S05JVkRpN043SkRtTG5nQXplaW4v?=
 =?utf-8?B?R0tSM3dHWjg5MGdVeUs2bzVodkNoNEFDVXZoNGZZdkNCRUtVdEJBdDZ6azhP?=
 =?utf-8?B?WHQ1TDQxSXA1N05yZHQ1ZXc2UWlheHVZZDlteGV3Mm0rQSt4c0Rld3FZMFJG?=
 =?utf-8?B?VmZRMlVDZlNMMDBKeUw4cVQzQzU3ZTBLSDc2aFlsbUt5RjRrYlFaaWM3a2E1?=
 =?utf-8?B?YTZrUCtlM0hreEVjNEpuM2tuYmIwazFUdnVUbVNsRGFUeVA1UVRrd21MWkRj?=
 =?utf-8?B?WVhEdHREbmxEOEJid0hERUdPZ3RwZVFZMmU3UFh5V1NyU1JtQzlCaXMvWGhT?=
 =?utf-8?B?YlZTTjFCdmVBc0VCL0ZGdEFSMFdxNVhLb29lOFVOM0I3d0pSa0xSY2puczhl?=
 =?utf-8?B?b1R5ei9ZeUowS0c2bGdXUkRoT1BsaFFieTlvbzRlaUl2Y2hTMzUyV3BkVmg5?=
 =?utf-8?B?VU8wRkwwTnZkb01INXNNeEVleENsQ0prdDlpTllTWjR2VGtOVnZyS1g0eGxu?=
 =?utf-8?B?eGlXVmRISnNFRFdjMG5sZkJqbnNYVmdGZDJUWTJQMCtEREhOZFVBdzNZUEE1?=
 =?utf-8?B?UDFMVFNZYmsxK1RjNEk5ZGFLdTRhazd6NkN6Rzl1R0xmRkp6WHZQMmN6UmV0?=
 =?utf-8?B?TFkreWZ4dlZkSnRKTENwS3hXSmNjaE5UUC9HN1ErRVMvOUZ6cWRGekJFNkNP?=
 =?utf-8?B?WXBaUWxiQkhraVFad21rdXQ1OTUrdzUxUGQzSGU0QXB0QzZUS214VlkvOEZa?=
 =?utf-8?B?T0ZacVN6VUlDNXRhd0lLaWphR3N2QUw2eTFRRUgySHlZTDBhUUxqSFMrWEkv?=
 =?utf-8?B?c2lkWGZ3S3EvUDR2cy9Yc2R4blBocEswY0JUQ0dJV0ttemExQWJCOFhkeGdZ?=
 =?utf-8?B?TUVjb0x2T2RrMXNhUzB3cnAxVWYrTVBzL29hZnN0VWRFbUlEaTJGSFg4RnFZ?=
 =?utf-8?B?ZXBxUld3WnVsNmdySkR5WDFqSVdIdWF5d2haZ2pBZUhxQ1pRbnFjQS9DTmxy?=
 =?utf-8?B?SFVheXEyY1N6MkZzTC9BaktRcW1Qbkx5ZXMweThvcDdRU0xqQlgzOG0vem1h?=
 =?utf-8?B?cmVVSjV3WUNEa0M4MFVWQ0E3N1lCYTVNMWZVL1pJbnZBQU8zTDNKQ3lDYnZw?=
 =?utf-8?B?YUo3VXJPVTUxZzlhbmpWVHNwa1Vvc3U0d1BHRmIrb1JpL2JWSTlaR2lBQUZu?=
 =?utf-8?B?WG9reWRpYW9HNkVDb1pTT1lOdXlqOVRIZllXQ3JqNXZoR0NFZUU4QndpWnVU?=
 =?utf-8?B?SXdoM3dPYjFabkp0QVhxY2gyQnA4NkxkZEVzOGM2Q1N3dGR0QVlMRDNEaDZ0?=
 =?utf-8?B?NHlKQ1QwelNrVE51S0lCbzZkNUxBUjRrclFBNmRxWDZOZ0hZekdCV01WSTMz?=
 =?utf-8?B?a3AzTXJiR0NwZ2ZiQmJ2cEVhNFpSNmhoV3BUWi9hRlhWcTNtRjh5M3ZWY2Yw?=
 =?utf-8?B?WkI1ZlgwSUZHWEhyRHQwMEJGMXRkN29wN3o5WlFTYlArM0NiM1FWT1ZIWUxk?=
 =?utf-8?Q?eNXf7q6fjvAN9Pa0eY7Cru8Ac?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eec08d52-48fd-48dd-396e-08ddffca764d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 02:38:39.2206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m//stMdMK3PYUjuqNDTZsP9oVe4ZKKlkpW4I6YeNywgqkLdbxRA9kv+UK94YqXlOQUSOeE3RT0kOcAfYjfmkWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Now that we save the job's head during submission, it's no longer
> necessary to adjust the LRC ring head during resubmission. Instead, a
> software-based adjustment of the tail will overwrite the old jobs in
> place. For some odd reason, adjusting the LRC ring head didn't work on
> parallel queues, which was causing issues in our CI.
>
> v6:
>   - Also set LRC tail to head so queue is idle coming out of reset
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3a534d93505f..70306f902ba5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
>   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
>   		int i;
>   
>   		trace_xe_exec_queue_resubmit(q);
> -		for (i = 0; i < q->width; ++i)
> -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> +		if (job) {
> +			for (i = 0; i < q->width; ++i) {
> +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> +				xe_lrc_set_ring_tail(q->lrc[i],
> +						     xe_lrc_ring_head(q->lrc[i]));
> +			}
> +		}
>   		xe_sched_resubmit_jobs(sched);
>   	}
>   
