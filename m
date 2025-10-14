Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671C7CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2629910E238;
	Tue, 14 Oct 2025 19:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsF8NCZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA72F10E238
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 19:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760470462; x=1792006462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=5K5zTcX/r2oT4jBR0r7zCRPWBhHAYRSe/QidzsjYUHM=;
 b=YsF8NCZBl4prlgQSKNzhzk66zJrSlqSvaUlACvQGRPZvM60prrQt2UNQ
 FQIk08jK18DIMjPdiak9O2V0FMf3oUj6fuWbrMlhwmI83z2OeT/qNjJa+
 +HiQZa6Z1kxdbmqHDPJQGrgfz6wr0OcjelM+sMMQrztCz2rzgoYRxOCs8
 R/qrhGyj6bPVgLq0fXVPeXh506DDm6kEmEZy8NKAFWTYgmCJFWsB7JNLk
 /UFrrqMcM5AKDl39Bw7JsgN6Y4StNsVETdSwMhxWaMw8NdtOdCAAFJaCe
 vlEKXkwoq4spODW4UhmFOeP2/lVOaSAo87XLsxeIDx71lEwJnWKAFwuWl A==;
X-CSE-ConnectionGUID: tAGiYdIfRcaTAUMLXFZ1iA==
X-CSE-MsgGUID: XIJ78IayS4ys3uIt7VHMQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="50202691"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208,217";a="50202691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:34:21 -0700
X-CSE-ConnectionGUID: hq0cZ3SzSgmBpsarkFcJGA==
X-CSE-MsgGUID: Zjjgoi+fQiyApJJqigR6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
 d="scan'208,217";a="181909562"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:34:21 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:34:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 12:34:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJOCMzqyFCeLwNRBmWKTcR6tJvc2DLAhZdmRGgULaSW0K/i0hrk7TqJK+DujmApdc1mmppi1NILQPABpsb5fvdQpoXuWiETzW5sN2sMGGDQjRYA5qXZKK1v4d6j9Robv1i1oOpxO1XsEH96IvbU/nMjvDHi8xa4mKGqyE0gHWSLQ45UiZ5DqgblOo5crLxaaeHfcRVM8BcbKjMuekedSqop2Mj9mFyitWFMfZBUTuPhCchvekngrFAF1MchsDcbBgUIIF53DiH2QaAGe+b7fAWM74FIGED11NBU2KFBpy0Fz2rqRvMQl+cFNqjMKWp6PCCAEROQNeb0I8m3q9CILgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFhPG14UldGbpccA1igetV0BcTPQcKtHIbiV00XHANY=;
 b=UDqXxZeMShWe+HydQWvWG24buGopEBp1DMr2Bx+hqWMk+v+HWg5eW/vPVKguJ0mctvS3Vq8KGtf6LlWVfNizPWpEUM44lnUfKyZEF7CgvZyw43kWQ04Cw9wOmj7ny3OlQlZX0Xu33zbA/9uCMcBYHaOXw1E5TvHgip82K0D5qMpsL4vtADSjUv8wsuwJOm8Il8LQ//+73d1085Un/la6ycT8bXy8NjE7yuhk5t4vD2Z1uWGO5pPdbtLoakBBR4qZsB50ubhpFy2uh5b6eQYTdlqcz5Twnees4rR17cRTF9iwkzYCL9jCJ1+SmW8zWBrnRaw2uEGqBlpOv+J0R/YVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 19:34:14 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 19:34:14 +0000
Content-Type: multipart/alternative;
 boundary="------------0GmngnV0KZblGNkY2mv05biQ"
Message-ID: <a706dfcb-6faf-426e-b536-930d1c949931@intel.com>
Date: Wed, 15 Oct 2025 01:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
 <aO1bl1mk5CL7uP6i@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <aO1bl1mk5CL7uP6i@intel.com>
X-ClientProxiedBy: MA5PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::10) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA1PR11MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7f74e3-4f40-4040-188f-08de0b58a842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGEyTFBQdGpvTjdldHdpem8zY0FZaXY0ZjF6QVR2bjg2ZTZMbEVhMkt2SDFQ?=
 =?utf-8?B?UE1nUDJNOWhNRFo5TFJydUhBNlNHRVZvdDJBbW1rUG02TGpuZjVGdTJLNjI0?=
 =?utf-8?B?MGxBdkFLeFRLRTk5S25qeURDTkVSVTBOdFA5MFRCZ1NRczdFa2VNbVIzWDZ4?=
 =?utf-8?B?ZnR3OGJxMnVCZmE2c2dqTlJVYU4zRVNUYk5FeVNETzZnanAvS2RXcWJNMlB0?=
 =?utf-8?B?dmpJVU9pYlBzUUtXSGdOQmtjZEpqVTJ0OWd6TjBxYzRYTVpmUWdETUthSGxB?=
 =?utf-8?B?MHpZVjdLVXJWTklMYjB4Nyt0QXdzKzVIcExpeWJ1TlBXNVVsNWgyWnRsTVlR?=
 =?utf-8?B?a1ZjRFhWVkt5RjVCU1BKbndxUnlxSWsvdzJvV3NpRHV4WTVkMFFYWG1wWUYx?=
 =?utf-8?B?dldzMHV2YU0zTExnRDc3aTRxVWxpcDZXRWtIZDluYVgxOW5kbitUbVRMZkIr?=
 =?utf-8?B?cmdMRjdiYXJPa2lNTDlQY3FRZjBZbkRYb05ibEttVno4dTBjdTVDN0VqenVy?=
 =?utf-8?B?SlMrTGE4eng3bzhESWhqeURTTlFRT3owSTY5bVFxVzJ0NkdiRUxvS0lHK3Jw?=
 =?utf-8?B?TzhEWFJrejltU0d6SzV4aloyOUgyK204NHNiUlF5V2t6aDgxdGpBM3U0NFFG?=
 =?utf-8?B?aU9LbDB4QldDN1lFRnFGUUlZcEdNaHR0MjVHbUxkS1lmd0dZNlJ3N1I5UmpQ?=
 =?utf-8?B?SC80YTdzdTcybXA5RWtWNVA0ekdUWXE2UTBWOWh1bjd6WHdtZGU4QmZOc1la?=
 =?utf-8?B?S2VOYUE5Y1RFT3hKT3dEM2phMnZ2V1lsNlhjWEttYWsrU3JtUEczT0EzYThJ?=
 =?utf-8?B?N1RxR3N4TTY0SzFDT1ZESjM1VHEvSUJWVDNpMUVCQUdxY3loY09vaEw1RG9E?=
 =?utf-8?B?QXBIQ29wOWJOUWNsVVpMeU5lV3F0SGJjOU4wVWU1aXg4Q0VrTVJMZ3JJWHJO?=
 =?utf-8?B?L1dBRDFzYzdzNjFwWHVKN2duVmxyTlJFSkpmT0o1Uk5kanBwaVR1L20raWdi?=
 =?utf-8?B?L0NnampDenA4d1pPRm5aekd0aXZ3NXR2MG9XSnJpMUJyeWdtQ0xKaHR2eXBw?=
 =?utf-8?B?RUxZNGdrLzdKZjhFOWQ3NkhZak04alUzV0pjTkE5a0pEelNjRWJXMEpCUmY4?=
 =?utf-8?B?VTlYamxmKy95bENiUm9UeUMzRGttMTZQaWdDZlpPdWF4emI2Rmlodmk2MVdq?=
 =?utf-8?B?bTNyc0QzRnJKTjhtTXRzdXNvbDduZndVRUlicUErdmVTSWtZWkZtS0hUSzk3?=
 =?utf-8?B?b3VRczMrZkVoOFdFRmtUd214bkFheVQvSHNJS1A4SDhGRUhkZlkyNFNsLzdH?=
 =?utf-8?B?MGtYNnlpUEw3MjQ5WUpCM3VVejc0dm1UZnFoQ01DcFRPbjVEUzE4dW9yYUFZ?=
 =?utf-8?B?Mk1zNEllRVVNSkI0dE9yYnZtSGdwcHJ1cnJDN255SHZPU0h1M1Z5VVdQVVRG?=
 =?utf-8?B?TDhXMzJMT0hhYnZRaE5ydlhieXVXbnRMM0c2dzBSUktCc0J1YU9PZWhFTlZC?=
 =?utf-8?B?WkVGMFNrcmljOHNqbElOSlp5TWRTRGFtTjJ0Z25VUkNkUHRoZ1FLc0prSFZr?=
 =?utf-8?B?UUlOM2VFdHliMVdpUkNEYnJuNG91ZCtUM1ZjTk9kcVFjeU1WWUdxYi9pN3ZX?=
 =?utf-8?B?ZjJxN3ZhUEJWZkY2cHV2QUxOZUY4NXN1ejZ0T0JaMVBQZEJzcThCRER6bWtC?=
 =?utf-8?B?N0xBQ1cxVEJpc0NFY0licUdORHV5VDRUWEZqZFlYZEZvY0lOUFE5cWxEbXZl?=
 =?utf-8?B?N1IxVkxTd3JzYjAvYTlDN1ZHMlN6Vng5blFSMmt4MnpzMlVrVzhTbndSRm9Q?=
 =?utf-8?B?c2tjTWtZUWxxRjFtcXZwMUhyZTM3NHRETFNUZm9Wb2ZyUmJuclhwWXY5azJj?=
 =?utf-8?B?UEVaNEhTaDNTaS81L0ozSUFOZHUrcW9ZNFIwVEMwSnkzd0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlNZ2hWeC9pSEluR20zS1c4cTFoVUFYZlk4cmFUaWlEUFJFeUpIeENoTE81?=
 =?utf-8?B?LzA2ZFJBaGk4RkF1cjN6UXJiM1J6aDVuemwyMDFsZUh3MzJMNnJLa1RMamRU?=
 =?utf-8?B?Sy9Ud1ZQZXc0M1kvQ1d4YllONzBwc21vWW1Oeko3TzY2OHRXT0V4RW1yUWow?=
 =?utf-8?B?VkVDN255cFY2UnBiakRyQzRMMHg2OUQ1YnFmUHdSQURKNi9oOHdTVnNMQXNP?=
 =?utf-8?B?cldsYlRBRExpb25XcXZQSUZ6aG8rT1VxWFczdjZiQmdvYUlUZ21yZFVrNVFD?=
 =?utf-8?B?cjlpdXZQbUd0U1JPcVQ0a25lV3FaQ25oREl5Y1Q4QVpnem5jNy9lQzBCNjBC?=
 =?utf-8?B?UmZrc2hDbnQ2R09GWG1BYnZxeXlkNGNxWnRWUzVzOHo2N3prc3V5NUNkMjFN?=
 =?utf-8?B?d1N6ZjY4SjJyeXRwRHAzQ0E3SEdYeEh1aEkxSUdyc3pWNmY0eVVzc0hSUVpM?=
 =?utf-8?B?VmxaUzgza2ZsM1ptNHpGaGVibEZINlB1TFBGdXpKdkJFZkV3TzVjSlZ0aTUv?=
 =?utf-8?B?TVg0U0pPY1NTd2lTNHJ6Q0I5OVBHcDc1R2tlR2R3SDRDZDVzbW5qYis0MTZP?=
 =?utf-8?B?TXJFMHdoRkROc2NVZ2I4RXRrODA2NmFQUlNGZVZ6QWZQUFpRcUhvdTVnUG0r?=
 =?utf-8?B?VVlmMXdTREFNVlROa2RKM1k0a3I0VUxGd3pGbmJGTVFLK1lNZGZ3bVBiVHo1?=
 =?utf-8?B?WHQzckppUUV4Uzd1SlpwZ3FIc3ZDRWtpOTZXK2EvbVh5REtIU21vRXFnUU1I?=
 =?utf-8?B?UjY1OXpxcVMvcy9Ddlo5ZHI5R0VZbjRSYzRXbmQvczZ1UWxHVEJ5ZWd4dzNB?=
 =?utf-8?B?dnNKemVsVmg3WXAyMlhERi9NWmswZWJ2OXQ5NDlleCtNODBDS2FXb3ZodUlP?=
 =?utf-8?B?VDFoaEpQUnluTVAyMVRhZXBuQTFyZHRpVWJsaTI3bGluQjU1TjNqMHpUdVdJ?=
 =?utf-8?B?V3VneTh4a3BjaklINkw4RmNaVGtxT1JNcCtqQzErTHNzd0c5aDkrQ2QvSDE4?=
 =?utf-8?B?dUFQQVJLR1NFbklsdmR6WkJMb0twdTI1TGljZVZZQ0ZMZW1uMkhSOXZoU2Vo?=
 =?utf-8?B?VFhUdkl0TzRtbmNyM1Mxd1J4Mzc1TmdIWFBOZ3oxWGMvZjhtY3NyQXNFczYx?=
 =?utf-8?B?VG11dkxleUpSS0xhS21uSFFlTnNUblRXZFhXSXp3QjZtV0o1V0pVd3Y0c2hK?=
 =?utf-8?B?TGVIWkpYMnFyNnJJTWhHeU8wUFFMNnNpTzRGbmpHSmFlRzgyb3oza1dlajc3?=
 =?utf-8?B?TG5FR21rdmgzZXRtWE4xcmxkQW8yckVSYUZvN3d5TG9rbGZrd2VTRUZOdTVH?=
 =?utf-8?B?czkzNCtsVE1uQm93UjBvNDl1b1RPZytacm0yYUlYS1pxNGFWTHhvVUJ4NGpR?=
 =?utf-8?B?UE5hZWpUSVZiRmdJTnhQTlRBczdyeUFzTll5MnRpcEpyc2V1b2RkWUtranZk?=
 =?utf-8?B?SzhOdUZmamlwalBiZ2F2dTFWcURjUHB4WkM2aDhmM0RKM2YzRnQ4WXkyVGRJ?=
 =?utf-8?B?RzJEQXFIZ05vcEVBTkpsNmxSREtOY2dxc2ZEcDRuK2s2Wnp0NExWZmNwWDI4?=
 =?utf-8?B?M0xuR2c1MzQzbVA0UVpoeCtUcC9zMjlIT1ZhaG12bGI3d2YvTjBtbzVjTmk0?=
 =?utf-8?B?Q1d0OFBULzRTZlhJeWNkL1FWbFhFY0V1a2tqNzFISVZjWDViRjRhLy9ZK29s?=
 =?utf-8?B?ZEFWV3llSm5DT2JOUnpydGtUYnp0bDJIUVFMM3ZEMEZ4YlQxT001S2xKV0po?=
 =?utf-8?B?aVNEaW0wcWlmSERjTkpxUDZCd1JLbGl5VVh6R1dFWFJKV1JJVnA1VVhSblUx?=
 =?utf-8?B?MnRVNnh6QVRueVhWZ2drRUFvNGU3OStNWGp5eldiUXB6Y1VBUmUyd1RkVW94?=
 =?utf-8?B?elM4eTIrYTNUeFdBQ2pwTGRJSXUxUmpTam1BUUVNMWUyZlMxdkorZnN1NHhF?=
 =?utf-8?B?VGZZR1V6eEE5cHloMHZROEVNUUdISmU1ME91bk91aXRJenZ6NXIwWXFIWlZU?=
 =?utf-8?B?U2MranJLckhTdXAvTmFSYk00Ti85QUh0bFY4Wml1UThWdEs3MDVCc20xL2JI?=
 =?utf-8?B?cjI3MWZGZk1QK3I2cmxmQklEQ3Uzek0vcjV1VERoUnNNMzU4VVNXQWF3aVdT?=
 =?utf-8?Q?BcUY8Bi6gcw3bBPspt78tjY7d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7f74e3-4f40-4040-188f-08de0b58a842
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 19:34:14.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0H9zsYwAymiG4ci+PmRqFkpYm7IOqc0n3pt0EHxfiwS2VnYkvOCGw+3VZsEqtlqizuSZS38jMETrCnvXLbbfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
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

--------------0GmngnV0KZblGNkY2mv05biQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14-10-2025 01:35, Rodrigo Vivi wrote:
> On Mon, Oct 13, 2025 at 12:12:15PM +0530, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>>
>> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Is it passing cleanly the igt/tests/intel/xe_gt_freq ?
>
> Thanks,
> Rodrigo.

All the xe_pmu@gt-freq runs are successful as per the new CI testsuite.

Thanks,
Anirban
>    
>
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>>   2 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..2d1d5121555e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   
>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   	else
>>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   
>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   
>>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>   	}
>>   }
>>   
>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>   	 */
>>   	if (xe->info.platform == XE_PVC) {
>>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	} else {
>>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	}
>>   }
>>   
>> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>   		mtl_update_rpa_value(pc);
>> -		mtl_update_rpe_value(pc);
>> -	} else {
>> +	else
>>   		tgl_update_rpa_value(pc);
>> -		tgl_update_rpe_value(pc);
>> -	}
>>   
>>   	/*
>>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
>>   	 * smaller than the fused min, we will trust the PCODE and use that
>>   	 * as our minimum one.
>>   	 */
>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>>   }
>>   
>>   /**
>> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -	pc_update_rp_values(pc);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 rpe_freq;
>> +
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>> +		rpe_freq = mtl_get_rpe_value(pc);
>> +	else
>> +		rpe_freq = tgl_get_rpe_value(pc);
>>   
>> -	return pc->rpe_freq;
>> +	return rpe_freq;
>>   }
>>   
>>   /**
>> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   	/*
>>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>>   	 */
>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>   	if (!ret)
>>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>>   
>> @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>>   
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>   	u32 rp0_freq;
>>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>   	u32 rpa_freq;
>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>> -	u32 rpe_freq;
>>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>   	u32 rpn_freq;
>>   	/** @user_requested_min: Stash the minimum requested freq by user */
>> -- 
>> 2.43.0
>>

--------------0GmngnV0KZblGNkY2mv05biQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    <br>
    <div class="moz-cite-prefix">On 14-10-2025 01:35, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aO1bl1mk5CL7uP6i@intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, Oct 13, 2025 at 12:12:15PM +0530, Sk Anirban wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">RPe is runtime-determined by PCODE and caching it caused stale values,
leading to incorrect GuC SLPC parameter settings.
Drop the cached rpe_freq field and query fresh values from hardware
on each use to ensure GuC SLPC parameters reflect current RPe.

v2: Remove cached RPe frequency field (Rodrigo)

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is it passing cleanly the igt/tests/intel/xe_gt_freq ?

Thanks,
Rodrigo.
</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre" style="white-space: pre-wrap;">All the xe_pmu@gt-freq runs are successful as per the new CI testsuite.</pre>
    Thanks,<br>
    Anirban
    <blockquote type="cite" cite="mid:aO1bl1mk5CL7uP6i@intel.com">
      <pre wrap="" class="moz-quote-pre">  

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3c0feb50a1e2..2d1d5121555e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * Our goal is to have the admin choices respected.
 	 */
 	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq &lt; pc-&gt;rpe_freq);
+			    freq &lt; xe_guc_pc_get_rpe_freq(pc));
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
 	pc-&gt;rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
 }
 
-static void mtl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
@@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, MTL_GT_RPE_FREQUENCY);
 
-	pc-&gt;rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
+	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
 static void tgl_update_rpa_value(struct xe_guc_pc *pc)
@@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	}
 }
 
-static void tgl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 	 */
 	if (xe-&gt;info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, PVC_RP_STATE_CAP);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	} else {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, FREQ_INFO_REC);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	}
 }
 
@@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) &gt;= 1270) {
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
 		mtl_update_rpa_value(pc);
-		mtl_update_rpe_value(pc);
-	} else {
+	else
 		tgl_update_rpa_value(pc);
-		tgl_update_rpe_value(pc);
-	}
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
 	 * smaller than the fused min, we will trust the PCODE and use that
 	 * as our minimum one.
 	 */
-	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, pc-&gt;rpe_freq);
+	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, xe_guc_pc_get_rpe_freq(pc));
 }
 
 /**
@@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	pc_update_rp_values(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 rpe_freq;
+
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
+		rpe_freq = mtl_get_rpe_value(pc);
+	else
+		rpe_freq = tgl_get_rpe_value(pc);
 
-	return pc-&gt;rpe_freq;
+	return rpe_freq;
 }
 
 /**
@@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(pc-&gt;rpe_freq, pc_max_freq_cap(pc)));
+	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc-&gt;rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-&gt;rpe_freq));
+	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..f27c05d81706 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -21,8 +21,6 @@ struct xe_guc_pc {
 	u32 rp0_freq;
 	/** @rpa_freq: HW RPa frequency - The Achievable one */
 	u32 rpa_freq;
-	/** @rpe_freq: HW RPe frequency - The Efficient one */
-	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
 	u32 rpn_freq;
 	/** @user_requested_min: Stash the minimum requested freq by user */
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------0GmngnV0KZblGNkY2mv05biQ--
