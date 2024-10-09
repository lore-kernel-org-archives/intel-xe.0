Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918BACF042B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 01:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5504210E155;
	Wed,  9 Oct 2024 01:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4BEaeIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF1D10E155
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728437266; x=1759973266;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IxrUdyBI0o/EtjHonY7Sa/kMDLn/lJqpxkTfyI0b/Fs=;
 b=O4BEaeIQL7C7qiE/D2W+d8/Z5C2bhh4IdZkFUuiW+tyutQt5UfYv2XsM
 Ls8yCzkjw3NN5MtzBD1uObNxr2TnqFJ8+IB4fUXj1iqjqSUqdZqyBHsv4
 P7d5ym1YykIZSr6N74gu7iZuH3nFOsoBARyi+4KGBy+0rAjVbRZddqMNi
 N+lpGmny6fOTRCwWgKsOgjDHDcG6dqGdjT9YZGm18rP9xzozCbCfCm6J4
 3Bi1Y0cNHUEgJytt2xcfA4GtunWcZrtN1f0sjCLGO8Y3U/P91ucm6mJwO
 IAmsDDyCGnYz8T8V3dnzwQv8vo3op6G3HAdeiKhXTEjwOeNLAAcnTTuh9 Q==;
X-CSE-ConnectionGUID: qq6wFxybTzi5RFX/S5ijzg==
X-CSE-MsgGUID: 6VgqdOrXSG6x/SWvcNzDNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38270290"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="38270290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 18:27:44 -0700
X-CSE-ConnectionGUID: tedR7QWQSL29/y27/vx6Qw==
X-CSE-MsgGUID: Se4jzE8UTwCfIYyIMPfM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="113553043"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 18:27:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 18:27:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 18:27:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 18:27:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 18:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEeMHAn56oc4F5jmqpylpIJYk1058PYZOHeeKEg8+0NIZddS9/UZGAgbPcbP6M0rvEWM2g4ILiU/qLpG6sUAFkI1Sip4tk4LWRkYGNFuQJenofYO95cH7WZNsacfoTZLctxD7FsJ+TyEvVbftsF43gSD/pSr09CXEQk+y6uPtQ6QrAQ+4hZh6E5K7RDc0cSGJBJ/QGLV3LoEwyXoWc2OinOJiwPpXjvqX9JR8400NV6yAJymvuOf96gU/y941GyvZA1xHJADKziFBnVqy8aMXetmOglrKIws8Ih5D+MzdIRcRwK5rnf+DITHxqYalz18Y6po79WYOEr9kpJZLk7drQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB2BzM3taCyeF5wtY0RgoseXrBsa1PMT9dPFAMqO5/c=;
 b=AeLbQ9HsbfIK5tC6T3akca1VurO1LXM+kBfj2VNSfHv7zk1IwE7Y6dAaUrqLR4VGDcvIuNrINLKzbSK8Uf1iJozs6l4e0mspzuSYbsIdmTkzb/h4ml7lDABJRp/RbeHczJMcg8XN7oOqTqGclYxbV/sEuVi/ivP6Nk3pzq+6mCw2T78Ir+IXNVI641B1OirS5Hht6zT7bM6Da6aZyG9RTVxm9gyAujpvJimvzBEH1W6HKOo6ON0OItjJLjPhw3VbaIlNmvaf+1ov51bgMzTkD+3p9fo8tZWpqXRa7rugBTZf2aJR0qlKk4qObp8wXP/ULtRfAeN9RgPnrK2Qdxonww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 01:26:58 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 01:26:58 +0000
Message-ID: <6fdf094e-59a1-4d45-b814-ed72361ff672@intel.com>
Date: Tue, 8 Oct 2024 18:26:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] drm/xe/pxp: Add PXP debugfs support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-12-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-12-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:303:16d::21) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b19a19-63d0-4257-05fd-08dce80177c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnZFRzhyWWozNlVVb2JJcm9yZXp3UlRBWjBDZ096bWJkWWx4eVEvRmlzRTBE?=
 =?utf-8?B?Tkw0d3lxZVZKZVFhVXJmSGZabkpDUDIrTTVIU2xFMkxmYUpCeXlyYWVkcTN0?=
 =?utf-8?B?NTlxREhIa21WMXl6Rm5KcWQyUVNLTktPVW44a0pKMzI3TlhMcThkWHVxRitz?=
 =?utf-8?B?WnRpMzZteTRGaTJSNy8rSUFDVGw0czUwUmNNS2EyMlQ0SENsb1Y0eDYxeEtW?=
 =?utf-8?B?UHZEMFFteXFrZHlHZ05KbmtEYzlBeEQzeUNLK3dWQmxjUHA1RTVXaWFwSE4w?=
 =?utf-8?B?T1ZYQklUcEdpTGpUUWJyR3pwZ1dFWkZYVjRjTHFmeWNGZVV2YklnNUNOUVgx?=
 =?utf-8?B?UHhhUGxmWjMzR2g5RVVlR1NUS2E2ejJuOWFtanE4c0tYbHhpSGtZZExoNDND?=
 =?utf-8?B?R1ZxN29zSDFBYVhydnVRYVdrcEcxKzhQcXNyYlhPVll4TE81NkFWUG0zVTJs?=
 =?utf-8?B?RzFoaHhUUEVxZjlabHk0dTFvVnkyQlRZYWxBckQzT2NqYUk3Y0FMQ0RZSDVI?=
 =?utf-8?B?a0xBNDBMUVVuUkE1VW5aNWFYVk1BMTZUQkFRTXR3UGVFT1Zoc3Q0VnlVSC9O?=
 =?utf-8?B?eHdSck9jVVdSeUFYTDZBWDFRU1ZhYmNLTlhQSkRzcG95dDc5elJZTEJtYkV1?=
 =?utf-8?B?SzcrRkprRVlrRmhCaEdOdXdGUENHU2lMdXV6MUJBdi9QK2cwOFU1R3ZvT3Fa?=
 =?utf-8?B?WEZnNiswWnJlM3IvSFc3NEdndTB3My9ZdVBhYUZKZWVwWVV4UFlmc3lndGJs?=
 =?utf-8?B?SkFnZFlHZDlyOVpmVzIwWmVBYmh1VkpHcWkxWDkyc0VTM2p1dy9ic0U4TDV2?=
 =?utf-8?B?VHFCOGxrMjcrckptZ1V1dU80RDVEWWpVSkR5MFRxZzdLZmJyczFsdkpBcXpt?=
 =?utf-8?B?VGVoZC9zRmd4b2hWNkhrSGg1aWduYnpmd29yNEpnU091ZGZhUXNQRDdnVHVo?=
 =?utf-8?B?M3hTTVhQNXp3MU1DZmx6eVRqNEhwbmc2VjJCY1JBUXNuZDZRSGdFYmk5WlV1?=
 =?utf-8?B?ZlRocFRPSzFyVnpHVzFlRitYZXBkdmE0b3R0RGlCVkVVVlkvaXBQOEd0Q2c0?=
 =?utf-8?B?WEdZUDg4SEVuOHk5akRVK0lzUkg3U2wwbzZ3M2VtNDlZQzlQbm5Qems3cmFO?=
 =?utf-8?B?U2VUUFhvOTUycERlVHlycXIzZ3Z4by9SK0lRU1gvV0I5Zk5wMFQvV0VRREpD?=
 =?utf-8?B?cU1uWmhFc01zVkpDTVUvQ0xLRlg0RjQvMUptTHNZUnZlNFRqL2NTNHEvcVpI?=
 =?utf-8?B?M0o4RGtrQWhPQkxqUXpvRTFSTzVrYVpwenVuTU1majJLL2FRQ2QvV1hjWFVo?=
 =?utf-8?B?Tis5OE9wcktucm1xd29mRzVyL0E0dnh1c3ZTVWxldDVvUzZLRkxJUDFKcWg4?=
 =?utf-8?B?MjArV3dqVGdZeEhaOFlwNGxWeGR6Q2VRdTRoRXp2OENtdENXZmFoSXpwOVRO?=
 =?utf-8?B?VDY1YVJjZWdFMmtkenBPZmdIeUdpc1MvTEFwMkRYMGVla2U0aExRMm9KN25n?=
 =?utf-8?B?d3d5NVRZVjQ3NnMyM21tQkdYdk5Oc01aSkE2VDZjNHpOYnVoNGF6bnpzNWUv?=
 =?utf-8?B?cGtEZVJtRjRkalVoNnFxNTRyUE9XQ09HSEo1ZTJBcDNzRHJoc1lGeDcrVC9k?=
 =?utf-8?B?WG05UWFEaXRKY0Y3ZHVUeTZLTHFUQ2w2ZWp5N3czbXVRVkllRzlLU2FlMndP?=
 =?utf-8?B?d3NyeVQ1VGhZYVBXa2xoakd1SlJ5Y2ZWeVZ5b1BNWVBCZEZvUjNIUHVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eC8yNXk4Z2JNL3JValNBclBBSFJYUUxmRlJxTXVrWTVjd091VCtxMHk5aWo0?=
 =?utf-8?B?d0oxTTdESjFvMy81R0g3RWhhSjdMR3E5WTdHcnNtaVFRSHdscEVEa0c2SU0x?=
 =?utf-8?B?ZTY4OXczZCswQ3dwTGtPYlpmZWtRdkhpaWpkYlBCYTlxSlRmZE1meWJDQlBC?=
 =?utf-8?B?SzJkaGxnVWh0TXhVcHpJdXRqdGxjRGtQblQzQXlxMTNxOW9jNEpGamEyWk1n?=
 =?utf-8?B?Z2RkQURYbklsTkV0REwrTkgvNzJMN0J4aW8yRTBFazNLUHhwbFRHWitBT3Fu?=
 =?utf-8?B?Q1RzYy9xYkt2VVhEL240cGY5dytyamk2dEZtbW4xVzhrbHdhdUlpYzdXOWZP?=
 =?utf-8?B?VGNHSkpqNElZUnF5Z3QycjI3eEFyb3djMHdJODZVanJTRit1dlNzbjVodXcr?=
 =?utf-8?B?amtLbDd6TlROZjRGOFdMdzFPb1pmd1MrWVdBNUNTKzZXb0wrTW93Wk9ieTJv?=
 =?utf-8?B?eFRkTXJVaWlXMUs1TXZ1WFVBVS83cjRVUy92c1dlRGN0RytWdVdyMUhuNjBx?=
 =?utf-8?B?cUVqMk5jbC9SUkx1U3NOMEx1dm8vMGFnTWFaZ0hUbkE4bTUzRjRHYVN6K2c4?=
 =?utf-8?B?WExVMDJ0cmFtMWxxdkxoUzhhaElPa2dsMG84SE5VajZtSlByZStsQ2g1ZXds?=
 =?utf-8?B?YzVDVGswSWRnUnU0YXZ2SUo2WXBHRjR1aXR2Yzgwd0dXWVRLTkRCNGRiM0Fv?=
 =?utf-8?B?dTZVbEp0bTRNdGJJM01VWDJCWXZyWGQ4TW54Q3lZczMxR244M0lUWWVvVHZ5?=
 =?utf-8?B?YmpkdHBac2ZlYzFNb1JDa0NpMWZHalZhbHE0aG9PR0thRnVHbll0dUZ2dG1P?=
 =?utf-8?B?SE1TRlNqU1FTTWVPSDAwR2JPdDdrWllnZ2F0VmtOdDgrcDhyVlQvL3E5eHJP?=
 =?utf-8?B?S3VDbVczVFk4SDc0ZklEc0dUMnNnbjFzVDNhN0ltTEhBMmxONGF1Z3BMR1dB?=
 =?utf-8?B?RDhZcGU3SkVJUWR4THJRbW9JVWhjd0lJWGxiNTFWb2xVK1hhYjZNNEhNL0tR?=
 =?utf-8?B?MkhnZEEyTHdiNnJQN2Nvckt6RVpFSTU2Zi9rRitpU1ZBSUJGY1V4WFYwaXE3?=
 =?utf-8?B?bUJ5R05pNXRjdW9mUnQ1SVFSWkp6b00yZTk2T2FUalFXMk11YVlSMWhKYjVE?=
 =?utf-8?B?d1pPcXVFdXh1aFhkcnlYamRkaUhHd1NSRjJZZjhVY1BSNENKWnhUenZmdU1U?=
 =?utf-8?B?RVRqL2V4eDdQTXExMndIQVdkbmV4TmdmekNkTzcwL284aDF4d0FYYmdQMnR0?=
 =?utf-8?B?dTF6WGpFNVFpNEQyaGNxOU9jcWtmK2xwTlF6NGx6NHhaQ1pPVXBoWUw1R2sv?=
 =?utf-8?B?MWVzR1hzTEdMeS90NndkTzQ0bEVvK29YSDZOZ3p3OXN4Qlp5eW5ieEw1cGtQ?=
 =?utf-8?B?NGZldFkzdU1oQWdQVXVxNWNFalAzQmNrRTZ4OE9KQmRZdk5hTEZFWGFpelFp?=
 =?utf-8?B?WHJwcEhtNHlmUkNUZ1BrQnpEWXFVMVJ3TTFEVUgvcEg1Y0J3Tit2Wk8rNkky?=
 =?utf-8?B?L2ZKbGlYYXVqUTk4L1dyMXJVMDdobDEyL1k5R3I3a0cxNTRMWU11UUMraFln?=
 =?utf-8?B?VDAyNVo1cFNwVmlYN1RWZ0pxM01hVEhvbGdaVlpFenJtTlVaUHk5Rjc4bUJ0?=
 =?utf-8?B?MEE4WXRwUWR2aVAzcWNlaXdadWc4b2p6QlJqMlE4NkNYMTUzL0xyUkNvKzh4?=
 =?utf-8?B?b2NRb1ZZSG82bmx3cUp1Sk1zc0F2Z054elJwUERsdEZlS3VWVkZlZldnVnZy?=
 =?utf-8?B?RnpZYVhiT1dlNFpTNHozK2lQeU1MblFiVmdCZ1BUS3NXTFQ5czBISHhvV0pr?=
 =?utf-8?B?S3c5WGZWU20raVA3cG9oSzdhM1VnOWNlb3kyM1daNEJLREFKTDJ4NTA1dk44?=
 =?utf-8?B?QnFnVzZ4N1ZmRHpVb3ZiNDUycVdRR1RiUW9xbWhFeWhpSGJiUE1kMitaSHE2?=
 =?utf-8?B?emZoNWl4MnlvdlNTTkJ2dzI4dm12Zno3L0dMdjVtM2pXa1EvWWFYWjBPVFdp?=
 =?utf-8?B?bmpjSkVhSnpyc1F1NGZYL21ncjFjRHlHbUZIQXphaitDSGplTkZUTnpyYmNP?=
 =?utf-8?B?Q3VXWkNhdkFBdWN4SmFKM0VTSlFid3ZxN2RtcnNqbzIvWmRGOHNScUlFRDNx?=
 =?utf-8?B?UktsTXA2ZEZ1VS9nT25heE5Bci9wTTR1NC91SmRqOWVkM3YvdUFmNFVnRjU3?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b19a19-63d0-4257-05fd-08dce80177c9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:26:58.3561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVHv4qpmqtsp61WDTBjC77sFXeXxVX9zVib5tTjsi5s+jmHd/6ZToFIwi75TKz+rHywEO4z0Qhspbh5Swn6gSv5jnRtkhoRLOjVCYHX/UCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> This patch introduces 2 PXP debugfs entries:
>
> - info: prints the current PXP status and key instance
> - terminate: simulate a termination interrupt
>
> The first one is useful for debug, while the second one can be used for
> testing the termination flow.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile         |   1 +
>   drivers/gpu/drm/xe/xe_debugfs.c     |   3 +
>   drivers/gpu/drm/xe/xe_pxp_debugfs.c | 120 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_debugfs.h |  13 +++
>   4 files changed, 137 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a508b9166b88..7cc65f419710 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -84,6 +84,7 @@ xe-y += xe_bb.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> +	xe_pxp_debugfs.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 1011e5d281fa..a04f9c2d886b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -17,6 +17,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
>   #include "xe_pm.h"
> +#include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
>   
> @@ -214,6 +215,8 @@ void xe_debugfs_register(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_debugfs_register(gt);
>   
> +	xe_pxp_debugfs_register(xe->pxp);
> +
>   #ifdef CONFIG_FAULT_INJECTION
>   	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> new file mode 100644
> index 000000000000..00c8179a9f0f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_pxp_debugfs.h"
> +
> +#include <linux/debugfs.h>
> +
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_pxp.h"
> +#include "xe_pxp_types.h"
> +#include "regs/xe_gt_regs.h"
> +
> +static struct xe_pxp *node_to_pxp(struct drm_info_node *node)
> +{
> +	return node->info_ent->data;
> +}
> +
> +static const char *pxp_status_to_str(struct xe_pxp *pxp)
> +{
> +	lockdep_assert_held(&pxp->mutex);
> +
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +		return "error";
> +	case XE_PXP_NEEDS_TERMINATION:
> +		return "needs termination";
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +		return "termination in progress";
> +	case XE_PXP_READY_TO_START:
> +		return "ready to start";
> +	case XE_PXP_ACTIVE:
> +		return "active";
> +	case XE_PXP_SUSPENDED:
> +		return "suspended";
> +	default:
> +		return "unknown";
> +	}
> +};
> +
> +static int pxp_info(struct seq_file *m, void *data)
> +{
> +	struct xe_pxp *pxp = node_to_pxp(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	const char *status;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	mutex_lock(&pxp->mutex);
> +	status = pxp_status_to_str(pxp);
> +	mutex_unlock(&pxp->mutex);
> +
> +	drm_printf(&p, "status: %s\n", status);
> +	drm_printf(&p, "instance counter: %u\n", pxp->key_instance);
Maybe cache this inside the mutex lock as well? So that the instance and 
the status were at least a valid pair at one point even if things might 
have changed since.

John.

> +
> +	return 0;
> +}
> +
> +static int pxp_terminate(struct seq_file *m, void *data)
> +{
> +	struct xe_pxp *pxp = node_to_pxp(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* simulate a termination interrupt */
> +	spin_lock_irq(&pxp->xe->irq.lock);
> +	xe_pxp_irq_handler(pxp->xe, KCR_PXP_STATE_TERMINATED_INTERRUPT);
> +	spin_unlock_irq(&pxp->xe->irq.lock);
> +
> +	drm_printf(&p, "Termination queued\n");
> +
> +	return 0;
> +}
> +
> +static const struct drm_info_list debugfs_list[] = {
> +	{"info", pxp_info, 0},
> +	{"terminate", pxp_terminate, 0},
> +};
> +
> +void xe_pxp_debugfs_register(struct xe_pxp *pxp)
> +{
> +	struct drm_minor *minor;
> +	struct drm_info_list *local;
> +	struct dentry *root;
> +	int i;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	minor = pxp->xe->drm.primary;
> +	if (!minor->debugfs_root)
> +		return;
> +
> +#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
> +	local = drmm_kmalloc(&pxp->xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
> +	if (!local)
> +		return;
> +
> +	memcpy(local, debugfs_list, DEBUGFS_SIZE);
> +#undef DEBUGFS_SIZE
> +
> +	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
> +		local[i].data = pxp;
> +
> +	root = debugfs_create_dir("pxp", minor->debugfs_root);
> +	if (IS_ERR(root))
> +		return;
> +
> +	drm_debugfs_create_files(local,
> +				 ARRAY_SIZE(debugfs_list),
> +				 root, minor);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.h b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
> new file mode 100644
> index 000000000000..988466aad50b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __XE_PXP_DEBUGFS_H__
> +#define __XE_PXP_DEBUGFS_H__
> +
> +struct xe_pxp;
> +
> +void xe_pxp_debugfs_register(struct xe_pxp *pxp);
> +
> +#endif /* __XE_PXP_DEBUGFS_H__ */

