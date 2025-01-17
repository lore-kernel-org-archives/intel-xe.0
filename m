Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A935C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 21:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3710E30D;
	Fri, 17 Jan 2025 21:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgJ5ZlcI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6E110E30D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 21:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737148923; x=1768684923;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=f7e+9Jn1O5FLsMe2PxIGSvyN0nNmznf11P7TiQmM+cM=;
 b=cgJ5ZlcIjUSkD/zhb4cXGCn5AREQymsQI9GFOmotcrIDXtLbM66sJ3Bu
 Q2cu3Sr9yDTUmewb6/7Q5ewc1Mi6snS9xYuoJEZbA/yQfit9SsTHJkMxq
 nWzfTA80aI3LU6S8X4HfKZVBeu8pvhM36oMwnUNQ9pC3oFsfWULT16Mwv
 +CnbLoiVSHKwAv9GlnFQvObS6ble59AnfXdewjdM/zE5N1ErtE1JrwQrr
 5tIP7mjJBpRg1Iv3ghkk8rO9O9QR6CETT2z1rsDgdEqmYrxmZHFDxRuHH
 Oi8PzXTEPZj12eUhBfrFCg33EIUt91ntx7HKsJixgiuO3T4zoAVkEDs0D g==;
X-CSE-ConnectionGUID: x86qf39NT4qTE0x8gBi2WQ==
X-CSE-MsgGUID: LY9HKt68THCMl1WLpegWKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48592704"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="48592704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 13:22:02 -0800
X-CSE-ConnectionGUID: mChMcYyaRHqkNhkCh0v87g==
X-CSE-MsgGUID: +IVWI1vfTfKm6YksE7aJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143197806"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 13:22:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 13:22:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 13:22:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 13:22:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBip8PcB/pmqz63UVz+rnXziOTcwkRzyqNCiYc7yzUoTVlPteHaAHmA2VuU8uEVrYumGBXKMRzKCCU+duny4o+Pkvzui0xKicttmkC0JYIpr4XCQOqpY1NsGQSo3WekBXPqjLUrjmjqm7pdMK+ARCRky4wtLkzZ0YwDcreBUw8D1IdRhrh026GIwueQbvgfVy5PvcK4eHsjn7C5PjZl3kosLqNNecQTyxY1Dm33Bw51BGbEAY3kbanSn4/p5A3bn+ZsWDQYH61gcQkWLgTMCZ32FNnG+U7L1pOk76dhHJZBm2UwvS2I3UvulZ/8nHWgPOw1oQuM1/fhxhMTLfFFhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oogc4syrdZxV3ZDQ+M4qhCJvULx5NI+OzUhEMNEIcrM=;
 b=oit2/LXeiy1F8HbDZJXb6TCgaUfJm7ac35Q15fz0zQ7DjhuPcEaiIKXLaUQSS7MnBCZfcRfKWjnhicHej/ClOqGbRAIK1QrmGgAX5AB0YSMVBUHq7P8/RTEF/kFPU4+wgyRBXJhRjNvA2Q3HKfCpl6KJJUWF5PkJ1j3noA7qZn5Tnt/rkgx2FZkH0mPuijZFV0nRlqO7I3lvvVqzHb9sGq9kdYddDHEvlo3f/eO9io6R/TY8dZsgG7jl92CBjDmQvs2zdCCAvDUShDT+50Qfrk2QHCyaO2EnnBG0jZrOYc8q64sUsm8PJyma94LCdSIorQa+aLuCZziRHrLs4TXWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 21:21:59 +0000
Received: from SN7PR11MB7602.namprd11.prod.outlook.com
 ([fe80::f774:c3b2:1d90:d174]) by SN7PR11MB7602.namprd11.prod.outlook.com
 ([fe80::f774:c3b2:1d90:d174%7]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 21:21:59 +0000
Message-ID: <349ff52f-94d2-4e14-b0cc-2847312877cb@intel.com>
Date: Fri, 17 Jan 2025 13:21:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [topic/xe-for-ci] drm/xe/ptl: Update GuC version for PTL
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250116183144.378985-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250116183144.378985-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To SN7PR11MB7602.namprd11.prod.outlook.com
 (2603:10b6:806:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7602:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c4cfe9-3e05-48ba-4d39-08dd373cfa47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajRLWmZoNzNId2FqOCtZWkU5TEZOVWorSFVsWm90dzlHVmI3MS8ySlhoeFAw?=
 =?utf-8?B?bzRTejZMVUt1dlA1Sy9ZZGNwdUVkY3g5L3ZseThwRWZ0RWV0OVVjRjJvZ296?=
 =?utf-8?B?MXo3Y2ZmcEZicEhwc1N2K0Vjd3J4S1RxaVpldjg5MjJjNno1VWpsS0ZWc1Bq?=
 =?utf-8?B?Z1JpdEpUMk1lUlFoaitEcVZHM0NuNWJJWHlYcnBkTDFWcVRTN01JbWhtRFlI?=
 =?utf-8?B?UVV3RTVaQXl2aHRpZHl4VDl2REYvRnYwWEVwajBudHVCU2U2aXdzNHZJckc4?=
 =?utf-8?B?a09OVUtwaGh3aENBODlJcFZvdXh0M2NlYXVucVRjc3FKUU9rdTZZMTIrWVdk?=
 =?utf-8?B?QW9ocFFkY2h2MzQva0R1QVBzbDdock9YZWhOSER5RGtUb3pSR1NWTEdtcnhT?=
 =?utf-8?B?K29wNVc1ZEdnQ2VhNTcxNUJKdkgrZFJOTWRLUk1JZ0hFcWNQai9RSHdIWWo2?=
 =?utf-8?B?MHV5aFYzUE1SQ1RzUUdBdHlHcFI2a0tLV0J2andrWlNMVno1cmVzeWJKSGRM?=
 =?utf-8?B?S2F0K3F5M2llZWVhNDVJTzJqL1d2aWRUMXZ6S3NJWTlTbzI2NVR6ZmZ1bHZ0?=
 =?utf-8?B?M3A0S0NjOWN0djRGTmlkU2dnZGRQSEdHdUwxSEtJT2FQVWxYN3ppNVpSc0FF?=
 =?utf-8?B?aXNLNVpWbCtYVTcwdExKaFFVWmIzS0ZhTDRNTVhranlOZ0FkNGpscVlFZW5y?=
 =?utf-8?B?M3BsTDliL1l5K3J3TXVvRmhpbWJYeWdTbHJYWlZNSUFxUE4zNjM2cTZpUktM?=
 =?utf-8?B?RmJ6cDc3eTg4K3JoQnhJaWxKSXhjd1lSMlpocUc0YzdhdWVtenhUU0lrcnZV?=
 =?utf-8?B?L0ZjVm1oWkJaSXRqeGNyRkhxRnJ2bjVEVHczeHYwRnBienFkSWxDaXhCdEVx?=
 =?utf-8?B?d01EVVdDYnhCU0Y3NnhlQzVqU01WUWs4TFAxZ1hWRU9jV0FtUXFjdUJERVJz?=
 =?utf-8?B?bUlId2l0V1BMR2hLNkdxY0pPVmEwNktRRkNWemxkaXNKYVk2anZQeERpVnhF?=
 =?utf-8?B?ZklSN3hySzhSTTFleWFqcWdmRld2bHpzMW1aOGN0bmI2M3ZnOFZqZnFxcmhM?=
 =?utf-8?B?clNFWXV6M01PZzlFU2tXQjZoVitpRlJ1bTB2cjNxeFNBYXkzTWJPUWhwZmov?=
 =?utf-8?B?L0p2bzNPSjlQMjJ5ZnUyZWVGQmFNU0RJTFUrOThvemd5NTVhZlhpdEpvVHE4?=
 =?utf-8?B?VDU4QWYralNvMEtkVVBUYTRQODBPbmhKQnpBNmZ4ZzlwSWEwMGw4RXdRRUQw?=
 =?utf-8?B?cmZYd2w3a3FTUGpWV1J4K3Mxem9WWjVBMTBrMTdaYk04bjFkTkVlUmxOWHh3?=
 =?utf-8?B?eEt1Ti9TV1RmSHRHK09MeUdZaGN3NDNNRlFYYVNMb29zSDJrdURvZkxHMEZy?=
 =?utf-8?B?WUJMOTE0UXcxMk5NVU5qeml6WGoyNE9ZZ1htWm43V1hIRGV4QlFLMmZlTmc3?=
 =?utf-8?B?L0svRnB1dkpsUHBQNjB3QThMdzV4SUt3OXFlSzVxaFpCVHowNFhXWGlja21N?=
 =?utf-8?B?aHBrMFAvNWFNUEtXSytreDYxOVF5dFFhSWxJSlM3V0lnYWhsUkJvM2xLL0l3?=
 =?utf-8?B?dkNIREFYWmt1QTRXdE9CVGhhejlmdXppa2lGL0gzUVVGYkphMyttUGZ6L2Ni?=
 =?utf-8?B?TDVPbW44K1o1N2UzN1RobnVPTVdKSjNZOEo5UEt2OXc3LzdDZE9zSnNXVzZJ?=
 =?utf-8?B?NTZCYkE2WTdwOTFhMHpEMWoxRUlJaXRPYUZMSFNqWTUzcVFlR2k2T1FBZnM0?=
 =?utf-8?B?aUVIMmRMZTdUZkR4WlF5c3BBeVlyZlg3R0trYWdIRE9aQ0paN2FYNG9KTnVF?=
 =?utf-8?B?d1ZFK0N4TTBERERkRFUzdSsvZkNxMC96bDVvdStCQkRvL1VEb0xqbElqY3li?=
 =?utf-8?Q?1fVxubeTdo28L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7602.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJVK2xELzFvdkx6MVk1NjZXL0RBTEc1am9MdDQzNk5yV00zMjVhNjlnWmJ2?=
 =?utf-8?B?ZGdPNHM4QktpNFJ6c3B4bTQwTlpOZjVRbWR5L2hsbmg1OEFhdldMaUpOUGVH?=
 =?utf-8?B?UXl3dzlpRzh5d2VuTE5zSEYyejE2MmFEOXNpS2xBNW16SkFyMHgzWWIzYXlz?=
 =?utf-8?B?UDF1WXo2SkNNS1lDekFiVDVSKzlnWXFQWUxUSS9UN1dDenZrdTVXUDFicStT?=
 =?utf-8?B?OUlzMUZkTld0dFlwNjJSTzJWbE4zYkZscDBnZUpWbG8yTHJ6OFk0NmRGNWFD?=
 =?utf-8?B?MDdiRzFNR2lzYkJteXNudnNLS1UvaXpIZ1ZCL29IZTdBZ0JVMU1XU1l2bC9Z?=
 =?utf-8?B?NDJDa1MrR3Y2aUMyNndWV2xIa01YTkJreFpySUlDa2k1Y3ljaHJ6YjJqWTNS?=
 =?utf-8?B?blVmeFpqaVVqU3JwVjl3azBDN0F0d1FXWGJ6b0JISDQrNUlVTXhVUXJZQ0Jk?=
 =?utf-8?B?L1NCb3ZCSlZ6T0plcjRmUjhWTE1jRlUzTHg4OHVjdkFObDBMK2VGYS9kdkda?=
 =?utf-8?B?bjkwZm45RFgzWFVvVDNXZFZNSWJOYnEvOTZLQUw0R0g0KzgrQUJ2RDlTcEZ6?=
 =?utf-8?B?ZjBoeElRTzFXbWFPZGo1Zis3NnJEeGhFN0V4TnNERWo5L0ZyUktxTTF3Z0Ur?=
 =?utf-8?B?RSszZS9tSURnaFhkQ3BpcXR5d0UwdnN6ZWlLMktzN1hBbUZyTVdrd0tNRGZO?=
 =?utf-8?B?VmJiZU51dDBHbTJyOEdWUDF3ZlQ0QTdxMkU3MUZFL1RFTUozM1d1NThxSUFK?=
 =?utf-8?B?SzEyY2Q4UzRsMEFZTkFMQzlMRG9URHhOaUVXa25rSXpqUm9ibytpQUxNN3FR?=
 =?utf-8?B?RlhRS3NwaEUxaW0zQlI4am9Qd3BQUDNqc3ZicHYwTW81M1NnNmxScDlWbFFU?=
 =?utf-8?B?dEJjK0JtRDhLMkRsd1EvK1hnSnR1UEpiYjU4N2lqa3doSkVIN0FrU3p4NkE2?=
 =?utf-8?B?WDRaS2V4bzhMSEVQVk9oWVFxMmVYUlpZWGI4cDQ5YXc0WS9NRjFTbGtFZ0VV?=
 =?utf-8?B?N3FPSmZ6dEFkbFJuVG1ITVFLSzJaVGo4Y21LOWZkYXBydEpZQ1EvZlJhQmJP?=
 =?utf-8?B?T3VGT2pnTVRBbHlDVGZ6ckNKeGxVdE1TRGlZTTAvc1JhMUhsVGExVHNYSEcx?=
 =?utf-8?B?TFdrYmpIcUZxd3QySTJOaGhId3Z3TmFVZkNKTGQxYlNqM2FHaGlVUGEzTGU5?=
 =?utf-8?B?anlGYW1qMXpvM2ROdWt6NG03NjRWN3dVN05VUGxiN0lHaFBhb04yOUlVb1Rr?=
 =?utf-8?B?eHpyQ1gyWkJxbk5JVFNKS2xkME5MUmhHa2R4cmh4cnRqTUY4MkRxNWlsZlhF?=
 =?utf-8?B?bjJWQkdqYzFWNE1JSmpzMnVpbUxqdWVFUnNOSzcrRERxSitzelhqMmVrOGJI?=
 =?utf-8?B?WWhOdTg5UzJmYnhWa1llcFI2WnpvMTNpVE1FTHVmK1J5M1RUQ3lxN2ltN3BR?=
 =?utf-8?B?YjVNYVB4QmJ2eUd4VXY5ODVocnpHYktLaks4eGsrOWVvZFVzOGpFYWduZ1Qr?=
 =?utf-8?B?STNRa2JsOVh3QnNPbkVGUTBKK00yb0ZqK3lHTkE1MTdDWWwvSVU5UTYvT0JI?=
 =?utf-8?B?VDVSUGZLcVZ2ZHVlUWFINWhZU2hjZmNhamRvNUtsMmJhNUVVUXdqU1NoaXJp?=
 =?utf-8?B?REwzVWpwbW5MN21aU1JmZXJlMGM1SnJzWFp0bXJoRDJpUVNtaVBBL3I0RjFE?=
 =?utf-8?B?ZWpObVMvSGhKbzkzREI4TytTN2RRUXBtSTcyZE1rakcrcFBGWWNYMWNkc1V5?=
 =?utf-8?B?K1FESVordEFQd01kT0NqM29UTlUvcVpEU0Q0Mys5akh1dUl3QW8xR05HUXNx?=
 =?utf-8?B?RG9FT3lJVG1uNFNrUUhPQjYzYWltenNGOE5KVkppMzdJZmlXQXRDaG9yYy82?=
 =?utf-8?B?V1ZKODk5MEljVitoRlhSaGVzaUhIc1F6dURLSG9hSStPZk5XcmJJTnZmMGFo?=
 =?utf-8?B?UnRTWmNqYkNHV3ppc2RFU0R5VkI0Q2FxTUVFMGNRNlJvTzNQNy9XWGUxY1Bp?=
 =?utf-8?B?eHJ4cmgvOWZRSkx6TUt2M0ttWmU0cXQzcVJiNnQ5MUtRMWo0SlJiR01BWWJt?=
 =?utf-8?B?QVpsT3hNR1F6S2RuQ1lFblhyclhTU1hoV3V5Qk5QSjZTcmdGK2pRcisvUmgx?=
 =?utf-8?B?eURlTzllUGJtV1Zlakx1RHBRTTV5bHJHb2xma2FNM1k4dVg0Nm40OUVjRFJ2?=
 =?utf-8?Q?h8dDM4h8CP8fgQSdLeFXo5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c4cfe9-3e05-48ba-4d39-08dd373cfa47
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 21:21:59.4432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OT6ORgmDPvkm3q1OUZCLsh3nYFJjUAXDViTY2Gp0D+g17o8AlEIsidV6ahNXTrSwLiwqoKEFreD8MrHuYPwnjhv6HICRCIRL2k3FQwu3KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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




On 1/16/2025 10:31 AM, Vinay Belgaumkar wrote:
> Move to GuC 70.38.1.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 9c14b0adad0c..18e06ee9e23f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
>   	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>   	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\

