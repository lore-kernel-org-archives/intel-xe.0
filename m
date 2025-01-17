Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDBFC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 20:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9974F10E232;
	Fri, 17 Jan 2025 20:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7h2T32J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D898B10EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737145455; x=1768681455;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JFb/Mr1gBQPzN7wCiVjdxpHNKSDrhN8z36cELP2ZB7o=;
 b=I7h2T32JuK3Dejp6BAnXXKIYxQPAMLdDjrNMnid2BZzyXLWtYEqhoLwk
 CnrF28llOEoBQfRXt2IomOH7UdUl/hTFXxF9tQU4BDKQpkKfscsE2Z94e
 vdLs5+ucTv4s8dZUd9bB5L6iOHGSSlbhf6qGgQT67v/zWnrusxc+vmQTQ
 pGJLukcLVmoJU/HAZv9qiGceLB3F1dyfnmD1Ar/uKx1qX+Ts3L1d+vvpZ
 zLAf8CoDYMdjb81pKNbehhTM6LUdrZoG1GfAFYAn5CMK8uEV/5MiMibz/
 /bHnJsnmQ/AkTLzmUjlFRVeV+9UEegnUcddqyt+qR5ve7OjXQU16ZY6rx w==;
X-CSE-ConnectionGUID: kLzhsCSzR0mntd3d7Id+kA==
X-CSE-MsgGUID: MV8BLQrFSzewzdq1PoPk2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37472738"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37472738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 12:24:08 -0800
X-CSE-ConnectionGUID: GEANRe5kSAOLsBQZIr4j/w==
X-CSE-MsgGUID: jAOESMNcTcmhIZrlsunMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109960502"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 12:24:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 12:24:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 12:24:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 12:24:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaNp4g6BeHGq5RR7Cetr0Alew5ShBorGpnGa5DcWZTC6jVRNH+1jhRgoqzA7woiQZzcIdKCeeP91P4+2aaZDSwP/DYHXfoqfMVW5f0Ip2WhnR/cOkpd795v4FxP3W9TbNZ5OtuZC+TzGRKxc81rvQrh8kF4x9CRcO2C4is0holCHFCvlL9+DxMX9Y4ot/GVbF076E7WRVRtU4K1ft+4+QZiZQ52aOBMMQPSnsB2b9hCHD4Wy2C9AiYLCQHolrC+qYq32F9hXeO1KWfHzbE+81xxB8mtgKtrEqaGvn0/m6/tplQKtVyT1+lp3s0JB/vFSj+9KUR6FsJD+gGWjGrKabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thyLiFvQzgutxDGLR/cQqtxiOySDBgPfIU/nvU5fc5g=;
 b=HLqFO/6kc6DBFIvh6tN/04pUhztmZ/OzMnjPKWbr7DG6oeQQyDUBwpX2q4ED03MI2XGWVdTuKklykzjxpVLvxUFgT/zHFq69kQ0Ksfytx+KhR0l+gjW5I9kKJWhSEfuWf+agxtx+LOGhJ+Nqu4gNvLpAZzRc4aQf/vV9qooSFQ4fbsVHRqR4xUuUVWbjbsDg+itLvXs+3Pjnr9/kp7I/JBvnqFyAc2uXcC4hBhicbcqO31nkcgPhcD9gJD6r5JMqzti+Lh58zuozA0VEsDSqwWTgJc45aNJNomAMOdyqbaDJHaRn0ERhj44wxgA26bLIi1fr4h3bExhIZvQeNrwwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 20:24:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 20:24:01 +0000
Date: Fri, 17 Jan 2025 12:24:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/oa: Set stream->pollin in
 xe_oa_buffer_check_unlocked
Message-ID: <Z4q8YNJNhYJLETeY@orsosgc001>
References: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a15402-b8d2-427f-705d-08dd3734e142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGpTb0hXN2dDSDFiQ2tmUlgzT1ZGRmxoVDJCcFpmekREaWYxcml0NXpoTXJq?=
 =?utf-8?B?QlQ3UlRFNyszT3E2NTdBU1RvdEp1aVVFc1h0L0FMVlU5N0RIWERSVUJOSXFX?=
 =?utf-8?B?UTNoanZOQmNvQjVmbytZMGV6Q3NKcGpvaFhRdzEvU0g4Z1NpbDZONS9PeGcv?=
 =?utf-8?B?SzlBOTdkWmJqWG9rUW42b3lYR1h4bzh4VU55V1N4a1hLd2RhSlZHS0kxR3VQ?=
 =?utf-8?B?d3lmdEF6ZitSMW9qQkZyNmRYc2M5MFhPNjExNFpaN2w2b0M4cFlJUmNRMW9a?=
 =?utf-8?B?ejlkdTlMSy9uZ01OVDY2THZ1Yy9uNU9EME9Zc0Y4TzA5ZFlURURsTkdaUjYw?=
 =?utf-8?B?bFVaa1Q2MEtJd240OEduS3pnRzZVWXFNcUNOai8vVlhJRjVtVW1CVStQQlRu?=
 =?utf-8?B?V1JiZHZiWGwvdDcxN1Y5NWN2Tkh3YUF5TUNyYzRsK1lQZXNKVDBSVFl6TWFQ?=
 =?utf-8?B?YWEwTUNsRklQTXZMV0JPYXVsQnVqV0x1M1loRFY2YmhzVlpGNUpudCtOQVgv?=
 =?utf-8?B?a21XUGhmY1Jnb2ZHbzE2MmhFeTMwejN1VHVmSEVwZXlDbER5QkdQTjFBbHRH?=
 =?utf-8?B?VWp2bnFyQysxVStmYUJSSzFNelJBMVdZMWRnZ3drUHNKOXpKUTl0L3FWSHFy?=
 =?utf-8?B?cm1Yc3hiWXp2aW9wUytMZm02OGxsYmJobThFdGM2N3hMY1lTVFBkUjA5MXNE?=
 =?utf-8?B?VmtjT1MvNnJoTG82SERkckdqbUpLMzk1dHFEUldlREJTTzlhMjE4VThFZU1h?=
 =?utf-8?B?YTdNemFzeGIyajBvOVJYajZjTmJGcVlGSlZyeXJrdm03bHdBL2FNZmhqaEpt?=
 =?utf-8?B?Z2pPTVhjbVZmSTQvVUxFSHpiTWV0UkVKQURHSys3N01QdDh4dXpUcFFESDli?=
 =?utf-8?B?S2lGVWY5dTU2bllQeDFaakdRbktqRjhjRDVSRFlnbVNDSmk1L3c4OVhUaXJ0?=
 =?utf-8?B?SlRTTzQyK005LzFvZ1d5ZXl3UnJvaXdUVWp5SS9KZWtodVlJNW52TjBtaXNN?=
 =?utf-8?B?b3RwQ3lJNUhHbnBYRUdHY0hwaTZZYTFPSG9nZ0xuOW1MV1lTTjFid1g1RERo?=
 =?utf-8?B?ZUsvdXZHSVNmY1V1SStTTjFFNStPSzA0RHYwZWV6OVdjeWtSYkRsL24rV0Iw?=
 =?utf-8?B?L2FGUHVacjErdlcxb1FoVkpVa0JlekJmcy9Tc3UySG9HV1VXMGtJTEZCNjBx?=
 =?utf-8?B?bnRLQm9xcmdwYVZXVXc4MlFnbHdiSVhIRGdicXNsZW00bTkvVndsWjRlU1FC?=
 =?utf-8?B?c01LTE9BOFQwOFlndnNsdlZsSEVQUzdRbGp6YStoYXhhYWVPRFB3Z1hQNlNW?=
 =?utf-8?B?UXJWZGswTU8vSzlXWS9kK2hkRUx0Wk5FMWl2ZWQybW5IM2JZaE9BRWlON3h1?=
 =?utf-8?B?TWFkbkdTdHBJK1Izbmw5MjhPSW5xTFFnNFZkKzAyd2wralgwT1hINjNwakxj?=
 =?utf-8?B?ZGJ3VHhucFplK3lpZzFGVmw1Wk5WS3BNRnB4Qkp5YUVEbTh6dXg4a3dlVUlW?=
 =?utf-8?B?RXBBOGZ0Vk1LVTVRcWtHM2VoS3dwNEIzTXJPRktVS3ZxUWNQQjg0MTA4L3VI?=
 =?utf-8?B?MFhwUHdVOXZtWFlERnlkNVFic1JXN0NUbU51WTE2MkNnQUJ5cTlCdUZzR2ZX?=
 =?utf-8?B?SG1MOU1paTYrRnpRU1lySEduMGVvSU5pM2Y5TDZlSnN6VjE5Q2lUMGlyT1Qz?=
 =?utf-8?B?SmZob1hnaFljVWdHUEh2ajdKQk9Ya2ZmR24yQkQvSFRxWWNUNjJwN3RaZU8v?=
 =?utf-8?B?dDJnZmNxMENwSmt4K21qUHM4cUszbjZqVDBMNnk1c3Y5RWQ3dDF5eWxoUjEw?=
 =?utf-8?B?U2xOVEdBaTg3S01nQks3a0xtdmNnL3ZtWHczTVIzblRMNU9KdU5VWm4zMFdC?=
 =?utf-8?Q?gEs+X8KlpDYHD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlNlVVZIS2lqVFNac3ZsOGN0dTlEVzdaS21PSjM4SzlnNVVYOCsyRXZSN0Q2?=
 =?utf-8?B?Uk9PWUhuUktNbis4aS9qZkdWWVZUa2trOTV4Y1ZPU1d1YzNxU1hBK3JKSkx2?=
 =?utf-8?B?UFFNYVhoeEcwR1dnQ2Nva29aR1FRM0FlaGd1MFhhZDA3amRVTmdlc2hVWGRq?=
 =?utf-8?B?WjRRY3Rzd3ZvMEp3dkE1K1lJQmlhQ2syM2psWTFVc3daR0JkT0YwMkNILzF4?=
 =?utf-8?B?OGg3R0EzSUFZTVFWanl6NlZwSUVPWUFCS0paRWw0cjJRdFF5OEM5NkwxY21F?=
 =?utf-8?B?UWNKTnJ1Z3hFNml6UVkwN1dZTzZ5TlFrUGUrNGZOL3JkUVdpMk1CcWh4ckZl?=
 =?utf-8?B?RlROeGxlMXB6NEpoeElwNVgvMXdXczU5M0RyTHdMdm9hNzhwakZDYXROazlH?=
 =?utf-8?B?am1WZ0dISlp1dmM2SFA1UU0ybnltZmdndkRIS29jQ2ZJbUtLMGpXMzBiQ2V5?=
 =?utf-8?B?WVNTRXBKam12UGhmQ2xpZXAwejdGWjNsMjlHUnBGZmhINFR5TlZUVTBFMjJZ?=
 =?utf-8?B?TFMrZ2E4SGRUbGVKNVNSbzRUMjc4OXVFakdIUXR4SHRoSHBRUjBzUnhxZWlO?=
 =?utf-8?B?Z0t5R1BwZ0FWazh5MHNWN0VPRDBBb0paT2w5a29RYlFHdThOTUVJZTQ4bE5z?=
 =?utf-8?B?M282c2VwWHBUSEFOWGxQYjdKaTJoL3BUbmdaRU0yU3QzVHdlcWgvTUlSOXFE?=
 =?utf-8?B?S0cyejVpblV1K2psbGpuc1o4RnJLUExadDJoMmRzS3hYa2JZQSswQ2FBMjk0?=
 =?utf-8?B?RG1PT0xodGovWnV4aWZOWlR5bTIzWVB5VWwwQXVubHFYZy96RHpKZkc4MWdD?=
 =?utf-8?B?YVM3VXBGeDJhajR4a0dOeHh2SXdtM1VRbFBuaFYveERndDBTcTBxTXJyUXYx?=
 =?utf-8?B?Z0Z0R1pOdjFVQnEvbWZSdXc1VTVMQ0J0VHppWHlkUDNxaU9ETGlacURTL1Vh?=
 =?utf-8?B?OEEyaVcwWDZGaWgzM3FrT3FtSW9IYWVBS2VoWkV4UXVwa2REQi9DZ1pGY1dj?=
 =?utf-8?B?V2hteTQyblR6S2daa1Z5NzdXK1ErVkwwOHpKVVZOclZrN2REY1hscDZvVkQz?=
 =?utf-8?B?c1RGNW5IdmFEdUc4d2dybzVaTTBQVmVWN3ZjclcvYjkyRDQ2VnEyRzN4YWNP?=
 =?utf-8?B?SWJ4L0pOY0pwSmZkV0RHOWZod29LMjlaeEw4L0F1cDJ5QTdTbUdqUU16QUs4?=
 =?utf-8?B?Ri9pZFE1ZHIrTWlOZ3huQllhUlhreE1Pc0xDRWpwOHlHL3VVNVRxcFRyZkRD?=
 =?utf-8?B?SFQxWGN5QnF0bW5aUzk0c2EvRVE2WnJJTHcycS9SbUtGdEhSK0FRZGNqczc1?=
 =?utf-8?B?RTNOTnVUdVhSMVNpTHo1MTBqQXNGZHlsbi9vYkplTC8zaDViRGxoRXNMK1V1?=
 =?utf-8?B?Q2lKcmdFQXBxd2oydDYzZ3BDTnFlR0QyQmo0cDJTMDlJU3JNYk4vKzZkN3RB?=
 =?utf-8?B?Ymdpc3ZVU05wQUhxdjltZVQxaHNWelQyYkxwbVU2Tkc0TnVwdjk3YTZjTnBl?=
 =?utf-8?B?VWRHVGsrUXhkL3lZc0hlcm9ZYWZIN2lMSW1jNjF2UnAybE9pODBya2VRMll0?=
 =?utf-8?B?NEU4M3QyMGZUTjV2Tis0bjRYVE15cDBicWg0QThkaG0wcDUyWi91dm82alFW?=
 =?utf-8?B?dW95Ry9paHpjaEhhZ0tpWm1UV2xzbGFzUGhDZ3EwL1VCZ2xpTml1bEJPa3Fw?=
 =?utf-8?B?enB0cE9aZUp4eWQrcndZUkJNTXpHbnduRm5rdVBNT0g2cUNNVGM0MFE3a2k5?=
 =?utf-8?B?ZksxTis1d2E4WWRsQWtIRDVQNlNoOFFOcXd0eGRoYSthbW1JOVZObGxmcnRG?=
 =?utf-8?B?dUR5d3ZSenpDdU5YT3RLWmtPdUt4ZDlKblFMc1J6UUNOSmdlMEpXbVhSYU9o?=
 =?utf-8?B?UEhQWjNXU1JPa3hvRFl6UllXaWVFREtZQXZjb3lka1Y2c3JEMW9oWGdqUVRL?=
 =?utf-8?B?dHRPbHJCT3A5OE5EdW1iU2NvUmZkdmlQU3g5UEdXMEtVWkFMaDh1ZmtEMWZo?=
 =?utf-8?B?Y2xxUEJtYlVqRGZtcDlqUVhCUTE5cTZodUxZeEppYmV4UHE5a1hUTlF1S3BH?=
 =?utf-8?B?cWk1b05KY0dxcnplZ0cwTUdoNVdVT2JKS2RzbDNZaFhXN09VT3BXSEt1ZzR5?=
 =?utf-8?B?VzB1WlhuUU5WbGlKZmFlQUpLUmxlTmNmalRyTkNVeVdmWCtXdlM3NE1ZVVZo?=
 =?utf-8?Q?ZhqQ0YeBjPTKDZSIVoPpC/0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a15402-b8d2-427f-705d-08dd3734e142
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 20:24:01.4968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db5h35ojlM/O+nlhymat09SZg9EgNx9ge/9CSf99fwdbDpH9ZiDV3QEL4e4gOhKfRJSUFALJ3VJmKNxPFH8Yp/lfuJ9GwawPOuDYFY8ftoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
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

On Wed, Jan 15, 2025 at 02:20:29PM -0800, Ashutosh Dixit wrote:
>We rely on stream->pollin to decide whether or not to block during
>poll/read calls. However, currently there are blocking read code paths
>which don't even set stream->pollin. The best place to consistently set
>stream->pollin for all code paths is therefore to set it in
>xe_oa_buffer_check_unlocked.
>
>Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index eeb96b5f49e2a..e27c1752aa57c 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -237,7 +237,6 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	u32 tail, hw_tail, partial_report_size, available;
> 	int report_size = stream->oa_buffer.format->size;
> 	unsigned long flags;
>-	bool pollin;
>
> 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>
>@@ -282,11 +281,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	stream->oa_buffer.tail = tail;
>
> 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
>-	pollin = available >= stream->wait_num_reports * report_size;
>+	stream->pollin = available >= stream->wait_num_reports * report_size;
>
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
>-	return pollin;
>+	return stream->pollin;
> }
>
> static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
>@@ -294,10 +293,8 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	struct xe_oa_stream *stream =
> 		container_of(hrtimer, typeof(*stream), poll_check_timer);
>
>-	if (xe_oa_buffer_check_unlocked(stream)) {
>-		stream->pollin = true;
>+	if (xe_oa_buffer_check_unlocked(stream))
> 		wake_up(&stream->poll_wq);
>-	}
>
> 	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));
>
>-- 
>2.47.1
>
