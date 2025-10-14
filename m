Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E4CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 06:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4984F10E540;
	Tue, 14 Oct 2025 06:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GT4jDBDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8810E540
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760423367; x=1791959367;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mKMdft54JGUjE38PJkebKhDD+av7/ijdgbffCAl1Z8E=;
 b=GT4jDBDmofnnMFK1oML19UF9hrw4p4fTZS8z6Z/dhwDbTBLZZfQvv75g
 avd+1y3IhhXM7tGMX6XdZ41a37jMpM/1XeSOvpGFsYLnDV+qnWlHlEEhB
 gPR7KPP4ONYT+hm9IcGHYVBCxc5MaVh1fwe7tHCK9wKoFoB4w4d6jvVWF
 mSsyuOT6+yILHZhTKsZQkncYuyv9FIyleC1m0/AySvOYL5a+BN2Gre9Y8
 Vnay3dCpzl0quAAZP77q11OMTIQPqcgWMHpywSo3wugJC9c2nbSSHlKyS
 MEwbYBIQVh1GDgZxRnny3rvvdTi7vycFq4VSC4GB5FwJd1cajrgdlayCW g==;
X-CSE-ConnectionGUID: 4AwqyVieSe+UOC5fOKBN3w==
X-CSE-MsgGUID: fnzuDR63Tg+m+yZFSX4fAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62506475"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62506475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:29:26 -0700
X-CSE-ConnectionGUID: gnd5kI/sQr2LQIbbQOrlfA==
X-CSE-MsgGUID: 3oXubzxxQAyTdvO0HpEaPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212768968"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:29:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:29:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 23:29:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTEJo6CeXb1JFSXjkD5QyhxlP0voRVxg4H2LX0pgvvzrNBVLbw7YkpyJ7Yrj80r/yFbMT3w4uKvUtRsV+EO+RkeeNeoCQ9awUqjd+ptYkBluUrZVNhE10K36mLYI9oATpJwB/vb1g6VKKmWiYKlcWnG8p1jp3wyqYmUtBLe1nhQ8wcS1YLBTEMa6JFAdo7nAg+gChE+WY1af3hQ68MSL2iSJ3eG3/WRywHCV3QO/6CfrTR9cOc1bHLNZ+1Zdbd1dUGrvzHZru7mBf5ME48/Meya2cZy1tbSqKeZyjhXhaYI3tn+y/KabIuxXnF55ot1jQZYiQjKOrSUTCnbw86RCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmT932mIDb9sXWr19BFWBvPM8Jquv1e0VK54LaOLXEc=;
 b=K7WX1+hckIRaoSqVN6d0zO9T/OVxVt259gYJtDNXVtB2vpL6g5FFGd2ljRUn3tmn8BSeZCowOakFRvk82M3fMuYcr8PkqBcAJsXiOaCsBAdB4B6xmq5eMPjRIHCOsII1TVSyNDR82nVgVlhFb1p9LrPRO4JIbAPfTngFYxOG7N1TYuuWzemKXuhsdoWWtZKl9aZhKQDYPWw01mqDW2R4LKD5Dfk/CoL8wkMgK6MY4gs2z0LnXHTdx6d5cPOFVMRMhd/NlZ648psmH3Uz4r1Nwba3xp0t9A6RcxZTJrHF+8lsSozShKSA5Zg95RkrG0sKJLpDnIZSXfqToZW79DxCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by IA1PR11MB9469.namprd11.prod.outlook.com (2603:10b6:208:5b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 06:29:23 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 06:29:23 +0000
Message-ID: <87822e9d-3055-4d72-9253-9dc464aeaa2f@intel.com>
Date: Tue, 14 Oct 2025 11:59:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251013064214.926115-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::10) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|IA1PR11MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abe225e-5ff7-4456-f8d6-08de0aeb03bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVp5Y0ZGdElySmpQNkMxTGtiTmRCRys2RDJKOGVMemZra0swSS9HdmpNQVBL?=
 =?utf-8?B?dnhtaTIxemVIcXA5cE9qaWl2NERJNlJvMndnZDBDcEx6enV6RmxSVVU3cUNU?=
 =?utf-8?B?OW9CQlVGdUt4d1R1MlI2cEE0V21DVTZGak5MRjFkRHI4cG83VnhxdG1IYXRZ?=
 =?utf-8?B?aEdMdGYvODJWaS9EbkVSNWFGRjJWYnB4QmVidVpUdDZqQnc2blRCb2V1aE15?=
 =?utf-8?B?bkt2WEZ5bUpZSG11eXMvYW9qUWc0RUNJQmFnZkdWM0tOYi80T1psQnpwbDdv?=
 =?utf-8?B?QVZSeVEvbmNWZFJpazJNTTM3ZHVKT2tZZ2kxK1pxaTA0ZGdsN3A1NTBTNlBO?=
 =?utf-8?B?R3N6MUFBTTMwbVlxb0RHRFNXS0pLQURBVHQzY3Byd0JpQXJGZS85ZVpQSUtS?=
 =?utf-8?B?dHQ2MnNJeElQS0crRzN2ZkxMV1lHMHloMGFKU1lERzBWQktyZ3g3SFVnb1FN?=
 =?utf-8?B?YkZiV3YvdkNIU1NhVzNmcEhUdFZZRjFFOUluVW9sMUdNN3JOU05QcWVacHdJ?=
 =?utf-8?B?L0F4U3ExRmxReS9VcXdnRE01MjdnYWpwKzU0WHBlT09JTWhXczZJclhENVVZ?=
 =?utf-8?B?RTlFUHp3VTZVeDViallFQWF1OGpxeWM3eWpDTk1PWGI4R0pxZFZXQzBONW56?=
 =?utf-8?B?UnVWa2w2SGd6Q2I1UmdEK294dkNnSlVpZ0FhTVdCaXRIVTNxNzVMQWRKU3dl?=
 =?utf-8?B?akNyeXo5NnUzV0pVVmtJR0h2WTN5eUlhYmdZUS9oV24xYTNwRzVsckFUMnFK?=
 =?utf-8?B?ZXVVaTB1ZkJGZ0IzT0NEbVYyMXdaNzhlZDVKbEladmtsTGJZblduYkJDTElV?=
 =?utf-8?B?K0xXckI5d2QxcVBoWXhpNW5KTTh5S3BCVlczQmtDYTBBMFhEcDdRVXFCVHJE?=
 =?utf-8?B?UW4rYjVLUmt3Vm1temVMWUFiblllaVk0K0cvVWVOUHhkVmRRcG83V2xnTE5t?=
 =?utf-8?B?dlNtV2dSaXR2ZTBwZHFoWmE0dkVMVUVLYnpKVkdzNGpZang3OWczSUtnWFBY?=
 =?utf-8?B?YUJ4ZStFTUdTOWdNWmZ2dnJWdXo1QmlLemtLVkppYjFMU29HS2NpbEp4SWFH?=
 =?utf-8?B?aHRNaWQyTURQNUN2R2J2VDIzVFY2SUk3WG5nY1hVQ1dOSzFqQy9pYy9GM2RR?=
 =?utf-8?B?dysvTmd0WDRhVnJONjhmVGI5Qm5pRzdwVXlFcURrb0lBbmJpcGpQRjhlQW93?=
 =?utf-8?B?dXVMV1BHMUd2cEpmNFlhTDlvdzUvNXdVbkxhMHprWEc3Uk13UG9SQWhxalpK?=
 =?utf-8?B?ODIvRjl5SE1SYWY2Y2d5N2M3ZVl2blVYdVVtZk5jT1dJMmsrWUowZ1pjdmIz?=
 =?utf-8?B?a2djY2pRZnpMWkd6VjFiTWoyZjZ5WFBHdFFjUERVa1AxbmEyTFpiKzNPRjdK?=
 =?utf-8?B?dTdPaHRsNHh0UmtqUXhKdEZtTXl3enlrSGxqL2RqaENXZy9Jd042VmVNemFm?=
 =?utf-8?B?L0ppazFLUjN1STV5dll6czhJeUR4VlpQdENpOVVodHZsaVE1MUtRNkRQVU1I?=
 =?utf-8?B?c05KV0dDZkpRRFAzMUZSQld4ZTVwWWovUGFyWEpHMTdSQkRMMk9JTks0b3lF?=
 =?utf-8?B?YkdDZWJ5Q1ZHY2d6c1hOUHNZSk85eEtTUFVFNi84U29OMGdpWjJLenFOMjNH?=
 =?utf-8?B?QTJ5YlNXRjRDeHhXa2dMQ1gxVjhSVjRmMUUyTERwUXU5cmNvaDFWc2tyOGtK?=
 =?utf-8?B?bFVodityL0pRM2hDTzQvVW1DbW1Id3pLNnhRMjJ5cVZBQm5OcXkwZWhDNUNk?=
 =?utf-8?B?NGNnRjlLWm1kdFZ1eExXUE80RW5uTnROV1V0N3MzZFNtcmwxRFhLQlByMGdB?=
 =?utf-8?B?aG80dEJvSEhNQnAwaFVoYUxQTUpMUnErWkpZMEx4dnluaTBJT3BaYlFzNE1k?=
 =?utf-8?B?a3ErRG5WcXRGYk1yOTVHaXIrTk9WY0JadUliZmRMK1J6b2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVkzRzZSNkZnaXdmV1dtTm9qQks5elRyV09JWXBMRGwrTXBYN2pOMklRNVlV?=
 =?utf-8?B?MUhXUXZJbFFqekZhWlZXUTNwV3V3OEQwWEVzOGpiM0VhSm02QzBVZGxtVGp5?=
 =?utf-8?B?MHZPVi95TDhmWk5Jc242MVMwRFhOOE1nbjgzOFlCTUdsTTNobEpsU1FrdTZ1?=
 =?utf-8?B?L3doYVlJRVN2eVhlb3huYm02ZEVhZVhEUU44VlI0bGozNEticmNFSlJoVmJP?=
 =?utf-8?B?UU1ibCtIMzRxZFFaWTdnUFg4M1JoZXR1T0p2cWplVllqWjREVHVUdnVtR2dx?=
 =?utf-8?B?OUhxTDRDMUd1cmNNZlUzQ3ZFUWxaTVQwMmFJNVJhQnhBUXZUSG5PTUIwMGl4?=
 =?utf-8?B?UXRMODdRNXZuWWxhMFdodXRvWDhXQjRHOS82QlRYQlk4TGw3bFFTNHkzbDhT?=
 =?utf-8?B?Q2FGRFU1WmtIQVZ5U21sRXRGdytRSVBHamN1cEs1THRLQ2U3LzlMUS9kT2g3?=
 =?utf-8?B?a2NqYmFKejVCaDJxR2gxWkJ0dDlhOGNrM01ONUxna2szMGF4R3ZuQ2dBUmxu?=
 =?utf-8?B?eExMejA0OUhJYjdIZjNJYzJyS3Bla01seWJEak9vU09SYXNsNmlNN3hSbUJt?=
 =?utf-8?B?UzRZVm9YMTEvTDRxdUZ3WUdFVXFrMDlWMURFVjdkTXZlTG03SHdWUW5lMEpj?=
 =?utf-8?B?MGtsZ0dCZVNxQVYxS3pLak9YeDl2UVcxQ2R1Qy8rb1ptdHNLcktsRE9QVlFn?=
 =?utf-8?B?Q1E0OFpLMFQvb3p3eWM4ZVhQaGtrYk9WTU5pWGhaLzVVUGFqaU80MUhZQ05B?=
 =?utf-8?B?em14ZisrYlVxVWFZdkVoSmVOUHg5eWRRMnV6dzdyUU1ubmI4aWpEYm5WK3Ja?=
 =?utf-8?B?aFRjQkJBZ0hjeUpKaTRKQkhKOWs0eGRPM3FZcktORTVpUEhqY2xmcDVzUEhO?=
 =?utf-8?B?Z0Q5dnVTVE9DckRWYnAxOExpYWZIWk1vejhoLzNxSzJDRDVRWi9NY2pNem5j?=
 =?utf-8?B?ek8vbmlMM0FieEhUcS9rdlFwTCs4cGNuejVzQk01T21kQ05HejFQS1U1VnJY?=
 =?utf-8?B?bGVGb3FyQndUL2d3MTB0M3hsbWVlSjZrVXJkOW5kOEpMYVlzM1ZLeHYySVhG?=
 =?utf-8?B?ejVxalkzdW1jNEU2WTN4NklFWmNRaWt2ZVNYL0xva2tzNm9VekRQekozVVVP?=
 =?utf-8?B?SmVoVExvVjMzbjNJSWxkSzhvQ3hDNVUxTkh1UnVEQklVZU1XenNVaFZWRFpG?=
 =?utf-8?B?YUo5V1pVbU0wWmJXTENJNVU3cmtMejhxUmVQVlltUFlOZCtFdm9MTUtiMzNE?=
 =?utf-8?B?Tyt5QTB6eVlSMGpKamRETzNCVk9DbmFlc3Yzeit3L09LUHdmaWRIeDNxekow?=
 =?utf-8?B?V3hzWm1pdGN5TU1YcnVzYlgzWmVPSGFCMGVPRnRvV1dBYWxJbXE5UW16Wjha?=
 =?utf-8?B?YS82SExYQ2tRUE1zMkdVcDFMYlRncFQzM3lmbVdaYjVLWmZzRlZpR2JSNzJx?=
 =?utf-8?B?Ymp3azBkRnIwa1dkNlQ3cVhqbXZkZDg0SDVsWTV5M2Npa0J1MDFNODBIWHNP?=
 =?utf-8?B?VmVHNnhmM0xOODNHR3VydjI4aHpCSDlrQVlPMXcwUFpMVkUyNzc3SXVvMzcw?=
 =?utf-8?B?ZUtlR1JFQTNpdy9HVWljSjFXd0FzSnFPSURDYkJSRThMOUxBY3BKWjl4OHZX?=
 =?utf-8?B?TDQzNURONEd0d09rNm16VERhbTkzVVNnN2RGaFBveVgrL3o2VmF4aWlPdncv?=
 =?utf-8?B?cGlMdXRFTFhjTEdRNWtxNUViYnJ5NWVEd3pqRERTYmtpNzZYZXo1UlNDQWMz?=
 =?utf-8?B?SFpqUWpZWHJselNlYjBLOTdncjQ3dndYVXZFWVJvS0JpbmdUS0lyQ2liR1Rl?=
 =?utf-8?B?RWcrWjYycklHTHovYnBzSHNsOGZuR3liUVR2bzZrOGRFZUovaCtCenB5Vk16?=
 =?utf-8?B?c29WZW5Mc0RwckNDOTBPSWwrcEhtRFJPcmEySS9uRGpBcjhQU2VidkRmR2dW?=
 =?utf-8?B?L25YWFJzNGllanpSSW5DaEJMdHJBOWZ6THgwd3RQNjl6djQrM2RaRndjYVZM?=
 =?utf-8?B?M250SFZxclIyVnpRMkRWYjRkQWNnYkhBbUZXbWNrWlk3ZnBvUTB3U0hjd1E5?=
 =?utf-8?B?N2ZONG5QMjYzUXhySTlqR2o3QXppYVhzbDJNZEVVcm9nNmJ4RFJKNmxQSkVq?=
 =?utf-8?Q?qIe1DslKWI2SyLLP9b9ENAWKG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abe225e-5ff7-4456-f8d6-08de0aeb03bc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:29:23.3183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nX/MvC8JNBCBenrr0MWFbXxJq8yEB4gwFJqQ0Gv42+bQkEdeLgv+XZaRSYqHSrJZFmCEtdWpNqqkfWHbxpb+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9469
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


On 13-10-2025 12:12, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
>
> v2: Remove cached RPe frequency field (Rodrigo)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>   2 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3c0feb50a1e2..2d1d5121555e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   	 * Our goal is to have the admin choices respected.
>   	 */
>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>   
>   	return pc_action_set_param(pc,
>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>   }
>   
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	u32 reg;
> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>   	else
>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>   
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>   }
>   
>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>   	}
>   }
>   
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>   	 */
>   	if (xe->info.platform == XE_PVC) {
>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   	} else {
>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   	}
>   }
>   
> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>   		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>   		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}
>   
>   	/*
>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
>   	 * smaller than the fused min, we will trust the PCODE and use that
>   	 * as our minimum one.
>   	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>   }
>   
>   /**
> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>    */
>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>   {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 rpe_freq;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		rpe_freq = mtl_get_rpe_value(pc);
> +	else
> +		rpe_freq = tgl_get_rpe_value(pc);
>   
> -	return pc->rpe_freq;
> +	return rpe_freq;
>   }
>   
>   /**
> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   	/*
>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>   	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>   	if (!ret)
>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>   
> @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>   
>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>   	u32 rp0_freq;
>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>   	u32 rpa_freq;

It might be worth considering avoiding the caching of rpe_freq as well.

Thanks,
Badal

> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>   	u32 rpn_freq;
>   	/** @user_requested_min: Stash the minimum requested freq by user */
