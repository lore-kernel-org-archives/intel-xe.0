Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE50C54735
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 11:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE1D10E2F9;
	Tue, 27 Aug 2024 11:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mISBdd+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7A10E2F9
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724757162; x=1756293162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1X6Y1Bv59DP5KJr2wSyZYLkWtfjqN+tbnVt/1UZZqdg=;
 b=mISBdd+vsxiZHOjRG5alMZgzTCXjaCIvIBycwS6yZrGf4UQ4uSIAOxKk
 EPMoFr+IrkGHnsyLi1tCU1luAT+icSwMshPbLxIg6rfUNIVdg7GLrecSd
 8gGSbKzyuXTNTlVG1l87byEku1UTZTaTz26upOZiZjruBBob+xIvpf6ea
 oou2LqDfaEAlOX+RPRUv01RaGravxwT6PMogTJUl67jfyRdlB5vFxRkQv
 IQhHx4Yoc168Qq9TYJV2sfn3uqAJw8Uyba4fyOgCO48jp0A17b0LQQNCt
 ZmvrOir/qt0PNOi7A8AQPTLJMmpLYhwd7PeU4+rNbQz9O5J7pPgkgfBGG g==;
X-CSE-ConnectionGUID: YGCggWdfT3efeFUouFXzNw==
X-CSE-MsgGUID: 9F0TlFH9QIi+K23X9Kvc8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22748187"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="22748187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 04:12:41 -0700
X-CSE-ConnectionGUID: EidXwyECTuSVl2+wqF4UfA==
X-CSE-MsgGUID: TqxfzsyAQqOU7+6UYgYzGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="86017501"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 04:12:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 04:12:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 04:12:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 04:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyoBEIMVLSCO4DWtv5+ie+9AK37aqOjaMBD12zAAk+dZF3KNPIWJfLPEQUvABccOsrxemMLHDwDE+SSSXjDZozCkmwzum6PvAmIR2jlOo2zoqvmipn0Ps0I0HAwhtp+ft2QxC0dFsGxEdNi5iqMWsYwPykrk5ddEyet9LtyjHNQN6Yc0HksVUAQplqQtiwmBe8Tz3JhDcOe8/du3xWyn+YeIoMrEIPZ7/Emtk3r67pn/VPe05cGdGGogZU5QECQ7cRhhsXIwzPK8vTHekwWh7Aw7RrnMAddEAKJvP1XCrhGqMQBPaM4AeUY+2579e/kVu5qdaxALAFMOjAaf3w9pUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viXDDzRRWaMGK5OZTbg48xGADcwY36XaQqFlkQ5uqiw=;
 b=cA/+lIQajK5Yl2KO6z8mUFz/bNSKM0BjdubXAg2Kux1AQymXwG/I8HNGC61PQ4CYhUVpIuHseaHPy6IPTs1b88lyDKm1XmzW0ANsGVdn496fP4bSqTANI85DmQ9xwajt+l1PqMp25tvobczMQSaH6sVNHXRs5Cs2+Gq0Oy4k0hjTlhdlt738PtE7zfirVsaQXS0ZtGHdYt0ON0DFt0TU3N1sZGVAOY5oliGpPNEanJHwxeNA8dCxSiYUY5iknWDNYLHDs/BvPDX/Bl7hlktc9uO7sPn3A3UiIVcVv0Bg7UDUB0+bdrK1vHMDUGnfGMhdAxh+7pKPJv3rd0489H/EjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 11:12:39 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 11:12:39 +0000
Message-ID: <57df9581-2125-4044-9804-4bb4bf5c68d6@intel.com>
Date: Tue, 27 Aug 2024 16:42:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>
References: <20240826133633.129853-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240826133633.129853-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: c739f3ab-2563-4473-1c01-08dcc6892976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnZlODNvMGJ4T1d6VmVqNlBVZzZDSW5IOGdpM0xKbWVTdksyL0xaMENUNUhm?=
 =?utf-8?B?V2t4czNGVlphUkJxMStrcTJNU0dSVUluSnRSSm4rK2V1N1QxUFQwcDdEWW9l?=
 =?utf-8?B?MExQWityeFpVUFQ0ZFo3U2pnT2VyNXhwWjlqbVc3WnBjdHlsa2pSeUlVQno0?=
 =?utf-8?B?YStxQmd1TmRhUk1RaytodWl6Ymc1b0hId1FPL2NQUUd2ZlErbVl6MTBmTW1R?=
 =?utf-8?B?VG5selp4Yjl3eFU5QTZNVm1CZnVGMzRJdk1YWWUvTUt1RHRuSkdwdVFrZTRI?=
 =?utf-8?B?SHJuenRxdkNTQXdDK2xWZko2Q0FGRGFMYWhiRUFnZ3daNEFsUXdBOU9hR05h?=
 =?utf-8?B?d1dEN0hhYlZRNE1YU1NVM2RXNFNjMDFUQm5Jc05jY2RmMVJ4Tm1vaHdkUUJk?=
 =?utf-8?B?cW1sTmpyTzhmVElyKy9lQU5uTDNuRkxRUnVrU0FYZWZJTkdDbnk4dDlCeWZ4?=
 =?utf-8?B?NTdpOWQ5Y3dZYTY5LzM0MVU4QTkyaWNUTkNRaGdxSEY1Q3R4MXN3b3lJU05L?=
 =?utf-8?B?N24vMG9TR0lhUjJIQUlMcklad2NVdkN1cWV4UUhrMEpKWit2OTQrNFV5WXR2?=
 =?utf-8?B?Q1lYeXpkb1I2NkVQV2h0QVgzcHhTR1ZMdXJiRjdaQkdSS3g0WkE3NFdmQ1Jn?=
 =?utf-8?B?RkQzcHZYbU03RGpYUEdoeFEyRzRWL2x4TEo4bE05QzRIaklQSUhqNm5jTU5z?=
 =?utf-8?B?Yk5zTHRBeFMwVEUybkkySUE4VTluOERqeUtWTUxrWjZSN1BKbU5HVUZ5K2E5?=
 =?utf-8?B?RUtUalY1cnRNV3p3TWNYaDRpdzhCU3g4aWJEdEorRDE0NHBGTkEwd29NRWRk?=
 =?utf-8?B?OElCV05FRE9GaWZicFRlQ2hPVUpvMjZqNHArS0dEZys1VnBiN29XZkxUV1Vw?=
 =?utf-8?B?aGNENEM3UENhamxQL3MzLy9tc056V2p5UCtCVXlCdEtvbXBIZklnWXg0S1lW?=
 =?utf-8?B?QWpIODVRL3RpRGpIRjJhUG5xQjZRL2FwdW00TkNCNGU5S1VjTEZIci96dXQx?=
 =?utf-8?B?cW1pWUhNM0tMRy9GdGp6YzNJd2FmMFB3L2lDNVdUWWpVNGJST09rTG92RXJV?=
 =?utf-8?B?TWlUcWFrSDhFaDhCbzd3bmtWMEtmbU5wOEVBeHl4R1RHSUYrRnpteE05WFd3?=
 =?utf-8?B?ZDJIMWUwcDZkV3hXd0dJU2VuYWpFMW1HOE5YVHo1bHNrMmdZaWlYRHRxdk93?=
 =?utf-8?B?b3F3by83Yk5ob3d6Ymt4RlcrNlJ1ZndMQTZFR1c3YlhZV1hxZnV2cDBYV1pm?=
 =?utf-8?B?UUJMdUVBS05LcXBWUGFyOGRhRDg1b2hETE50ZituMElhMHE4WmtyZUxGby92?=
 =?utf-8?B?cjJabVRiVWlkMVhXc3RnYkpLMENLMXhEdDZVMmg3dVdCM1piWVJUeXNRd05l?=
 =?utf-8?B?TWhoR1JjSnVoaDRVWXo0VW01STc1ODhLRGdFTkg5UTVrSUZrVlFQYWJURG90?=
 =?utf-8?B?T1kwWElVb0RMMWdzazIzdHFpV0RJTVlSUWRKdS9kd25WemU1bnNZdysxbkt0?=
 =?utf-8?B?TkVIRDZ4MXg2TzhUVTBlNUZuZy9DYnVwVlVOM0NIZ1lpWnVtSTJNUEsvNkw1?=
 =?utf-8?B?MElZZ0l4MG51aE9ZMXl1dWpSTWs4NGJUWEh6NHBWTmFEMjN6SThtVE9vWWFT?=
 =?utf-8?B?eTF3TnFSbUpnRk1Xclk3b0RsaGRtekRzVmdXQ2JZbERmZ242aFYwdFRpQ3BB?=
 =?utf-8?B?WjVqQ3FCeGw2QkFaTzZQaHBScWlvbXhYbXNxWW1MVWVHblh4WHRLT25XWG9Z?=
 =?utf-8?B?MXRKakFmb3BnLy9uTTJXdDVBT2hVU1VQSThEZXNyQms2aFlRUGR5VW5teUlO?=
 =?utf-8?B?RzZZaUdxRXoya2RManh4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHphNWpUTnA5S0ZhR05ENU5FMXhYMnRPUFF2aXFsWlFqU2w0UUhBdTFtYnlm?=
 =?utf-8?B?Q09zd2w3cDFwVUkrZnBWVklkWHlralB6QWtrZURkbUFkdExpNE1Ka29ZWUF3?=
 =?utf-8?B?Z0QwRjA2MWlWQ1puOWh5MlBJMTVPN1JCWFRJYitKdkZwZVlKY1E3UnM5S1U5?=
 =?utf-8?B?aHhyWmMvNlI2dEMvRExQdnFEbmRLaVNnUFJJR0tPbGgxaEkwbXVGTWdLSTdl?=
 =?utf-8?B?dUE0SGFnQklKdWVIcmtNRkFXdFVNU0EzSHRXM3dqdTlzNmY2RVMyWXVQRWJC?=
 =?utf-8?B?WEczS0JSdFUvTVVWMmFPbGlMYXJ6NzFNT3VEMXJDMXRhRTVSWDBuNUVGTm83?=
 =?utf-8?B?by9xWUpIOFhvT2s1NDBDWjgrQk5PZTkxMXVGMTI5NUx2MjVmN3Nzd2ZwYklt?=
 =?utf-8?B?YXg1eGZyVDFjMEdzaWVQam5KSG55M0huMFlTV3IyendDTGw1SWdlK0pZYjZL?=
 =?utf-8?B?YW9HQTA1QjRLRHZZdFBLK2VnL3VpZWN4MERHRkN3NkNQMmw4MEEzSzRIRHhv?=
 =?utf-8?B?cUFqR3plZnNyMldlcDJ6R1RIamQvYlFtSkIzemtmcDVIY29BeWZlK2R1S29K?=
 =?utf-8?B?Zkp1LzUzNEFjV0hGczNtOUNIdHFlMzhwdTlKZ3VGck1CQU43cEZER3dYZmxm?=
 =?utf-8?B?cWRHTkJWTUJodUJzTy85TGM3VmIzLzJRQWp2N2xKd2tEbHVlbHdTUmE4NnBp?=
 =?utf-8?B?OEZqZE5LM0dabWI4SUQxdnlwVTg0VWh4UGt2amdId1FTSDBlMnIyZFdsMGJj?=
 =?utf-8?B?NWxUOEk4RzhuVStXY1ZTNEN4anFSZitLUlcrakJKVEcyZ3I2UFdHNjlhMEhm?=
 =?utf-8?B?cVFzd0lUNmlVR3lpenpTVDVsUmlNdGpHRGFlSURxd3lzY04wNmZvNlNodFNv?=
 =?utf-8?B?REhCK2NZMHVTTmk2VStBSkkrWEZITE9zNk42M2FBU0ducWt4ekhiVjIweE1o?=
 =?utf-8?B?Q2IyclNRNFJPc25Rbmk2R09XaXNFL1dGejZHaThxcW1CejhnZmljTTlNWUJa?=
 =?utf-8?B?V2JHMVI2b3RBbmZhcjh4RlRsMXA2SllMZmRRTXEvVU5FdmhMcHNmVU0wYnk2?=
 =?utf-8?B?akxQcVczaGU5L0pXdzFqcDFUTXoxSHRMOUlyb1Q3MTRiYnQvb3lHb3ZvaG83?=
 =?utf-8?B?S0h5RnlueDlZQ0hXbi9heFpONU5BMXVXTkdOT3pxeGhhc2VBM09Gb1ozTWNE?=
 =?utf-8?B?SDJiWmpLb01hUk1kcCtobFQrVFFNVm9PRzZvTlUxQnoxTEJTUzhFSVpiT1ZW?=
 =?utf-8?B?VzJWa3BPazJWWUV6emxUY0tXdmRBY2c2ekhnMVRHQTVtNEZVZ3NpRFl5QXp2?=
 =?utf-8?B?QjJmUUJ3MXhXVTZCV0FnUXBKT0lKbklTenkyRHBYWDJ1c0dqc1pieElNMHQ5?=
 =?utf-8?B?c1FOd1Z1eUdrK0tReVMybURVSDhBc2Noa3VQc3BjQlZmODNWNnFnVjdTRDkw?=
 =?utf-8?B?QVEzTGxLNjRpUUViU0xnVkV6ZUFXdzlZd1FIU2NYMmN5U1RzanU0dXZpVEdj?=
 =?utf-8?B?SVhucmUveXA5T3VUVVViNUVSY21WOVcvSjkzUW9SS2E0NGZTQ05NL09mcXpX?=
 =?utf-8?B?WXhyQTlpMnFBQzd4U1lZbWRWNDhwUitHbjdFSUw5MDh5Y1ZFUmsvYzhMQXNN?=
 =?utf-8?B?ZURuMzRoTHp1TG9ERGJwaU8ydndnU2ZZTmpKRElMNVdKUFZjOFE3K016WEtL?=
 =?utf-8?B?VkFjc0N2OGdJZ0pob2d5STRVUldoSXdMaXVHWnhNaTk1Z2IxY09Ec0RoUkIx?=
 =?utf-8?B?RWRTTDBpdVhRUWNHV2VxQXViUldBNytZM3NUVE9YUmMvTklnYzU3eUFOMVlM?=
 =?utf-8?B?STY3RjlkbFpwdTVPWWtadlA2R3I2SVhNQTJpUHUvelZNWlVWRGFrbjdaYy9n?=
 =?utf-8?B?TEZaaEl4UTN5Yy9xUUp1Z25tRWZJalhIbVlBNkFFU2NEclY0UFNZVzVhMWc0?=
 =?utf-8?B?MWtodjlFbUV1UGt0b0xONmdTMnlvYjBHL2c0cG54aEE3TUh2bE5pUTJaQi9m?=
 =?utf-8?B?ZUNoQjZzUjQ4R0FYbTV2WjlrMkpBSThJZnlIcUZrbGVoVTV5U2dYeDA0OWJk?=
 =?utf-8?B?L0tQbTgrZjAvb0JKekloZmtkNTQwWFlTVlJxSzhWWHVIeEovd3JVS1BWaGRq?=
 =?utf-8?B?TkJzc2EzYytrdjN3WXlVd3RvdURlekI1bU5ycXVEYUpDeTA2Q01iUGswL3pE?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c739f3ab-2563-4473-1c01-08dcc6892976
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:12:39.1443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNyXV3yn75EkXfbfBGECunzl0fM8/vuavxqfsPp67hQz7Nr6nzrJIS0cBzTn8kE2UV4v+N7L79GnVHSIaCtnAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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



On 26-08-2024 19:06, Karthik Poosa wrote:
> WRITE_I1 sub command of POWER_SETUP pcode command takes param of u16
> instead u32. Corrected it.
> Without this pcode may return illegal sub command errorsCould you please rephrase the commit message. May be like this "The 
WRITE_I1 sub-command of the POWER_SETUP pcode command accepts a u16 
parameter instead of u32. This change prevents potential illegal 
sub-command errors."

Regards,
Badal
> 
> v2: Mask uval instead of changing the prototype. (Badal)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 832ea81faeee..1faeca70900e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -450,7 +450,7 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   {
>   	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>   			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
> -			      uval);
> +			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
