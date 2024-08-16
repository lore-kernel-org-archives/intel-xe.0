Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03356C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 12:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219610E646;
	Fri, 16 Aug 2024 12:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4a9g6Ji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0195D10E646
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723813144; x=1755349144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E2WFMVs83jzMytGPbzmm0yUrheodztBFAuwVSmqzRno=;
 b=H4a9g6JiAKIclMC3LEs8rnnEzTO1FBehriy/bFWOHgN9Wphu8jYS+6mB
 UMIDIUamcpW5Ez8oQMZezAkw0LrEWT+nX6m5OZpyUtkkXawx3NTw1b8SS
 3w24x+ZshCCK0meZB3z9gPrVgV+K1gOgAnuBjHFRqjN5z1ZdgmixLUtkP
 GX402HXBCPBXkRomOjQP+6pQ63ugmbYAZGn5IOAkbVtUhe+d8Ca/gUViF
 ULUM2h1ZL9JyNYBxKmjHPycC2Hi08GmDW/5UP1z0RHaC01FBIieZ6D9c/
 CIaAFTBcz5NZdGW6zwVqOJtfKbfy6DuV37JmEIAS3nH4X+9tPn8s5DB4V g==;
X-CSE-ConnectionGUID: 51UykMP3RvuSotKMTNxPFA==
X-CSE-MsgGUID: 1yeD4UMiTGGkjazst2rDdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25009118"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="25009118"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 05:59:03 -0700
X-CSE-ConnectionGUID: h9SDj1QFTbWH4Yk6UVaojA==
X-CSE-MsgGUID: pN2R0HFkQnSnx5DFKSfUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="60459347"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 05:59:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 05:59:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 05:59:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 05:59:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 05:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1AdoceqGcngb/avUpyJSH8gFi8TWo+XSAhx1gWa5+RiHXKHrY5hsdyD7QxQZsMpOViFHj33d2QqHWiDNGAEDcaKDmfiBFb7kUQDQj3yjtit62ugh7UEBCjQLCjQEdQYXR2fsyCxG0lmmFFqROmw8f6xBcBwNt//fhgeznBRkDxHVMxR0oRaLVwWPYPzZZ7TzRJYR3A6omJCp4JC2qK0EcOJLeJyLyXo0QI3Zjinh+f/aowXMaoGF5cQ3AD32XemEqw6AT0U2Tae9yJGNA1b03U+Ys2oCCBp06ZsHW3w7UU4/s0pyajv16Rcp823M/cMvD1GBhKP3PvaRrTO7sKT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoq7xLASVWjkjLAPDDVPmDPWuTP6eiXHz/+eDaYinXw=;
 b=eD9I045OX1pEMGMMuO+jL5Cgf01TwH0rPY1ovSicXshalSFwJYI80WVLEn1z9QmBh8PKnkPgEnzvSrioy/i9H8WjkBWju3jgkwMMdPflJSueGMqaaHcYh5uEeRgSw00UYBjBm7hf9ursdcKKbyaqN4rRQ0r9BBvMhKqxtHKAgOaumW0Bjt9gqQH1OkPs6sgcr9g7hoz6VUF88X4kalVXnXcT7kXmmn4sC+nQrQfLrZ5zcUagXSdL6SRJILeGmpho/2fMeJnMA4YZ4YFU2MnPVsLkC9Rye/Z+WredunJ+FInLI6p8ixLnygK+rYlb2VS937UhfJuyulwV0FUTdXyzwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 12:58:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 12:58:58 +0000
Date: Fri, 16 Aug 2024 14:58:54 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm/xe/pf: Add function to sanitize VF resources
Message-ID: <20240816125854.rkvdvq4tqcw3bqzk@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0027.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::7)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 533af21f-df80-46ea-019a-08dcbdf33124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0NPaGJaNGxWK3huQ0RTY0ZtbjI0VUl2RzJKcnNDTUlCZ2FnajNvYkQ5aG1j?=
 =?utf-8?B?anNTRm4xckRIS3dwL09XN1JNNlZtdlgvdTM0aTR5U0UzMFFRVjVid0RobzF5?=
 =?utf-8?B?R2t4dit4S3VSdzRMeWxEcHNYUGRrU2pmQVlsWXBYVURUTjdtY0FFaG40ak10?=
 =?utf-8?B?OUx3TmI0NzBnZUlETnFVdk5XaHZjc1RzeWs5R0MyNG5qejlSN2hsdi9BYmRZ?=
 =?utf-8?B?OThLaktPbFN5SEZ4VkErRnJpR3d1bXZpSkJlNHVHcXprcUhhQUJCOTdhNjhO?=
 =?utf-8?B?eHRCcDJqdE5UZXVtMG9mM0dlMGR6YU1mN0dBbDFQZ3BzUlNYNmpKSG93WkJX?=
 =?utf-8?B?RExJOGpOOE9MMVorM0RVVWxhbW56Z0ZjZmxwdzBJcE0vcHlLZXVTUG9CTFpv?=
 =?utf-8?B?M0twVUUzY0l6ZVlZUmFNeGJ6QSszckRFK0tsUGRtcG8zdHdYTUV6RmdmNWd6?=
 =?utf-8?B?c3EzNlhQMTVseDlVcHJ3K2JhaDg1c1NKeDR0QmtFcy95R1JiSVZ5NzB1dkFH?=
 =?utf-8?B?OVBoZ1VrMkhPdWtpS0hxSFVBME9sMUg3Sml0bGlqdnd1WDhBVU80eWxvYTN4?=
 =?utf-8?B?YzJSalQzcDJVTFZRS1dKVUFqeHh0YzZIOFVhem55TzhaWk56RU9weXlveGsv?=
 =?utf-8?B?SktXT2xyenFmWE9mMVZvTHlNV1plVzJrK0N5SUNzMjFMOS9YN0xZR2kwK2J5?=
 =?utf-8?B?enZyemJUN3p4ZkNaTEdOM0V6UEZTWFpwSGdGSVlXTGp0K2Rpbk8rRjFCYnVa?=
 =?utf-8?B?MEVGMy9mTTBFOXlJM1NuTUt6bDhxbmVYamM0SDIxWWhBc25iRWFmRTVqWjky?=
 =?utf-8?B?MStPbGNVcnYvZFZIKzdOR2h0WEdvL3dwRXNYelluUXpYZkRNQkxvVHRWQnoz?=
 =?utf-8?B?SWpuVE44WEhuOW1qR0ZBSXRGd1hobXU0ejQwZDdGYmd0anFhQUpWU2FuMkdl?=
 =?utf-8?B?NndKNHVsVXdyRTdjZi93ZlhpNGJjRHF6T0k4U3Z3clpmNUZFVnhrZXBRVlE1?=
 =?utf-8?B?NVp3Y2V0ODRzMXYwNi8zMHdNMDByMC9qUXVBU0pTV1hzcFAxWVNreTFXcnd0?=
 =?utf-8?B?MkJpMWFRRk94ajlIY25OR2d0eCtiSEZNL2liby8zcEIrVUR4dmV2d29qTUV5?=
 =?utf-8?B?a2M5VWViVXh6TnVsQXVxYWRtTkxjVFVlN3JUQ1NKZXNZSkZKQnJFNTRwOW9F?=
 =?utf-8?B?Z0FjYkVhbW1FZ01zaHhtSmtyRHk4YWE2dDNYbnRmd1VSZzZDSTg2QWpJVW5V?=
 =?utf-8?B?bVBUUFRGSEdjL2IyZzVsZ1F6V1c5V2dPSWtQaUNRZ1BwUW1xeXdwMTNIV0FZ?=
 =?utf-8?B?clJoaFRnbTQ4Ykp4Y0ZqeHJiYTdQSjdJbXgzdzdaTjg4SWovOUM1RWJra1hw?=
 =?utf-8?B?b29Sb3NYU3ZYekdkVDY1MzJVdnlzc2R1QVdSRFc5dXRMNkhRMFZvdHRvdFpy?=
 =?utf-8?B?WHVOYk9UMmNsWGdFTDdiWXZvQWgrUWI3YVNKeTFKdHNzcDF6Z09ic0hjaWU5?=
 =?utf-8?B?Q1NFQmNBdVo2anU5dzhuUGI0RGxKbGtYa2xFNWhlT1JsMThzMGVmWElic1hi?=
 =?utf-8?B?SE92aTBNYXU0L3I2ekNJVldKMXpDV053Rk5TaDBOQkRpZ0JHalpDK1UrbVJL?=
 =?utf-8?B?cUlva3dXTGxNbUNjNFQ3T3VCbytoUlBMVS9GZzRoUU5ZRVY3ekIvdTNLTTg1?=
 =?utf-8?B?cjVOQWxxSEdwck1oN3UrTnhoYWNNdVA5VDVBa0J5dTBLUWVBeGozd0xQL281?=
 =?utf-8?B?TVNuM0RSM2d6OVRFaUlmWGRPRGVmWC95aXpLVlhJL3R2blZNS1Y1UzhTMEI5?=
 =?utf-8?B?Tm5FcG9PNTNTajVXbnB0dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjlraDVhM3c3VmRJZUZFcTgwL0ZrdjZLa0dhL1cxNVI3U2NvVXdTSmxwRGZC?=
 =?utf-8?B?U3N5a2pHR1FYaHpQUXFEV3AvckF1V0c5WFJ2UTBISCtNOU02V1NpazJaalJY?=
 =?utf-8?B?TDI0bDV5NFZhMzNCZ29aOWZYZFN6OTkxNk5LeUNYdHJGSXhjUVcyNTlhWXZE?=
 =?utf-8?B?YkxseXdubFU0Q1F6VzRGUUVTR2tBQmhMZ2hxbkNwYjRScVRuTnpBaU1uQzZa?=
 =?utf-8?B?ZUhaWGdZb2RGb0V5aDZpQVU0QVlFam9XN1ZOR0k1ZEVEbE14MTJzdEpsRmQ1?=
 =?utf-8?B?RmRCYXhma0VDL0E3RXpjSzMvSEkyRUhESTJhNnpJWTVJUGNKYi9lNzBUWm5s?=
 =?utf-8?B?OGpJM2FDbjdTTUJYclZTWW1UOWZ2ZHRFaVNIayt0aWxiOVB1MHVOMU10VVlT?=
 =?utf-8?B?NndRMjByVGRPYVdSU1NsMWFraW4yb3FpWU44U2JVU2VKRDNqUFpNb0R3azha?=
 =?utf-8?B?QmtzZktkNDFFNG9iNnVOYXlZUG4rWWxmaGYrUHEycUo4bmhMeGxLb0FkTXh1?=
 =?utf-8?B?NzhSRmlSZkhDYngzdHhFMjNmbEttZFVvWktlMlpicXZ6L3ZQNFZ5bXhqUDd2?=
 =?utf-8?B?U2E5T253b25yZUdjYjFZS3REeS9nNDR2OXpFSkVwWDlDL3BZbzNIdUdqdEwr?=
 =?utf-8?B?KzlJZm91dWM3ZndwM1VCQit5UVpxQ2dnODN0TVY0UkQ4RUhiMGZFWmRZOEtw?=
 =?utf-8?B?OEszYmNvNEwyR0NlVjY1TDhvc1BYR0hWU1pJanBIUmYxcFJvTDVTV0NHS0NI?=
 =?utf-8?B?Ti91WjlkSkpXOU5sR1ZOeUJnQXdxVDVYWkp5QlM1QWJzRDRuSUVPRVpKTnZn?=
 =?utf-8?B?YjlxM05jYklZaXZpOUdKVnFGVTQrQWFVOTRZa25ra3dwYTErT0xKbS9RMXE3?=
 =?utf-8?B?QzBJcUxOUDZ5VXJjYjdtRVFCOTlUdVE1Q1JLdHE1U2lsQkNGRXNnVTJVZ044?=
 =?utf-8?B?c1pCQlk4OVZWeFZPNWU5eSs2SjY4Y1lDc0MrTlZVcGY4cHlNSTJTR1hZZ3hR?=
 =?utf-8?B?MkhLd0lFUzJ6eitOOHdjMEpYL291WGI0SzhIOVBPdTBUejNLSXVSaUZrOU4v?=
 =?utf-8?B?c0s4RldVbVFLbTRUMU15aFNFSnhNWVpTZjV2clRoTmQ1YlZBKzJzTmRDZ0RH?=
 =?utf-8?B?OUd1aU1MZUJHTVVrdHZWS3VJY0hEMzhVK0lnZmZubytLamMrVk1BNTdyNVQ5?=
 =?utf-8?B?WjRkVUNoRGZDd2V0WW1oS2VneWJrR2xjWDZIT3EzclVPZ3MyNmRNVnVONU8y?=
 =?utf-8?B?YXJROS90S2p6WE5KQlp3bzg2cWtSWG9TOE5lMjhtWHd3RkZNWkljTVlzUWNm?=
 =?utf-8?B?bzRFdjFPL1k4eGZjTXlTN2xHci8ramJ4em9MOWY2WmxXYmNhYTk2Z01DSXZR?=
 =?utf-8?B?bENhVWFJc2pCUENYbWJ5WGN1ZTg5Z3ZlZitEVVd5Z1UxQ3lWOUNnM0pCWXNj?=
 =?utf-8?B?dGlpTUhBVG9aMGZqMGFjVktlcTRROWtmMXQzRlZveXYyelBFdGlVRjJCQlhP?=
 =?utf-8?B?MnBOZEQzUlZDYzdsR09GaVJyL29XRWo4T1lQUHVFOWUraUJUeXgyV1VjNHBE?=
 =?utf-8?B?ZE54OGhIcEhhMzJOMEFveEU4bUFQSFZtc05ZRTB4NG5uUmR1aGNoMjMzZi95?=
 =?utf-8?B?eUc2M1lyRXk4OVJZWnU2aFcrZXF1UXdUYnlwd1ljb2JWa2JoQTFxWUFFQjVP?=
 =?utf-8?B?Yk5jbk1mSVpXOHRQdnN4YlZieUhrTy9MNmhRd1JmZXl5WWJzQm9INmJJem9m?=
 =?utf-8?B?Vm5WMXJuNHNOWjF2UHRrdTJwdkpCdEgyWjRBT1FZaE5zVU8rRno4bmdzZXll?=
 =?utf-8?B?Z2tVZ2E0Z1ovcjFkY3d3Uk1ER2hrK2JrZjUvWmoyQnhCL2VEWjhncXNpeG5o?=
 =?utf-8?B?dEdTZDBLYWR6bzVYOGZMYXMxTVd5V3FMZUI5OUpURFlWYWdoMGk5b3UvdGYx?=
 =?utf-8?B?VTJUUXArWjJlMXVZd2JpVktWOXIwbWlTS1VZbG5JbUpnSDFMT3Baazh1bjMv?=
 =?utf-8?B?cGQzTEFZY21KVVFuRjNnWkwyMWoyZklZWHhFTk1jeWxLa0NISWluUDMvZFBn?=
 =?utf-8?B?YnZlTDFHckYvTE1LTUpIZ3RYK2tBalYyWjdDeHU5eXFVR3R2QVZPUG5jZ3Vs?=
 =?utf-8?B?ak00Nzh2YXRWV3FIbktqM015ZUZic1RkSFdYcWtObkVhOTZwSnBmbkFvTkNZ?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 533af21f-df80-46ea-019a-08dcbdf33124
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 12:58:58.0190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lT+lcudnm3PUXdq7JtQtmH5QfKAHtJ1qb5roJzdh2kL3y3XhzCWeH94TsXOVNj6sqfNsGoQl40fgDB93E3r6FHKcsb/poZ4Cf+arvLwI6ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:48 +0200]:
> On current platforms it is a PF driver responsibility to clear
> some of the VF's resources during a VF FLR. Add simple function
> that will clear configured VF resources (GGTT, LMEM). We will
> start using this function soon.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 84 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  2 files changed, 85 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 227527785afd..eba6793294f3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -29,6 +29,7 @@
>  #include "xe_guc_submit.h"
>  #include "xe_lmtt.h"
>  #include "xe_map.h"
> +#include "xe_migrate.h"
>  #include "xe_sriov.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wopcm.h"
> @@ -1893,6 +1894,89 @@ int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool forc
>  	return force ? 0 : err;
>  }
>  
> +static void pf_sanitize_ggtt(struct xe_tile *tile, struct drm_mm_node *node, unsigned int vfid)
> +{
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	if (drm_mm_node_allocated(node))
> +		xe_ggtt_assign(ggtt, node, vfid);
> +}
> +
> +static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo, long timeout)
> +{
> +	struct xe_migrate *m = tile->migrate;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	if (!bo)
> +		return 0;
> +
> +	xe_bo_lock(bo, false);
> +	fence = xe_migrate_clear(m, bo, bo->ttm.resource);
> +	if (IS_ERR(fence)) {
> +		err = PTR_ERR(fence);
> +	} else if (!fence) {
> +		err = -ENOMEM;
> +	} else {
> +		long ret = dma_fence_wait_timeout(fence, false, timeout);
> +
> +		err = ret > 0 ? 0 : ret < 0 ? ret : -ETIMEDOUT;
> +		dma_fence_put(fence);
> +		if (!err)
> +			xe_gt_sriov_dbg_verbose(tile->primary_gt, "LMEM cleared in %dms\n",
> +						jiffies_to_msecs(timeout - ret));
> +	}
> +	xe_bo_unlock(bo);
> +
> +	return err;
> +}
> +
> +static int pf_sanitize_vf_resources(struct xe_gt *gt, u32 vfid, long timeout)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err = 0;
> +
> +	/*
> +	 * Only GGTT and LMEM requires to be cleared by the PF.
> +	 * GuC doorbell IDs and context IDs do not need any clearing.
> +	 */
> +	if (!xe_gt_is_media_type(gt)) {
> +		pf_sanitize_ggtt(tile, &config->ggtt_region, vfid);
> +		if (IS_DGFX(xe))
> +			err = pf_sanitize_lmem(tile, config->lmem_obj, timeout);
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_sanitize() - Sanitize VF's resources.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be PF)
> + * @timeout: maximum timeout to wait for completion in jiffies
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, vfid != PFID);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_sanitize_vf_resources(gt, vfid, timeout);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (unlikely(err))
> +		xe_gt_sriov_notice(gt, "VF%u resource sanitizing failed (%pe)\n",
> +				   vfid, ERR_PTR(err));
> +	return err;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_push - Reprovision VF's configuration.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index c0e6e4743dc2..42e64769f666 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -50,6 +50,7 @@ int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
>  					enum xe_guc_klv_threshold_index index, u32 value);
>  
>  int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
>  int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
>  
> -- 
> 2.43.0
> 

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


-- 
