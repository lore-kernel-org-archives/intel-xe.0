Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24822CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 00:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA41C10E0AA;
	Fri, 29 Aug 2025 00:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuWblP6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33F010E0AA
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 00:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756428878; x=1787964878;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=quEPar2CxTo9slmHwzAuKDBh9Co/jlKiFYZeIUVa3Wo=;
 b=iuWblP6w7nmLRdVWf6t1xZRraNdTzUhZ69aW4415tx4ujZVHadwi72l5
 zelAeGypDF+57NqaE1JixFKEuummMMqZGUjgDCzRTFD98YplWY3aBkaGF
 OxDDfu8RJEl/iUKRPKDvZmuZDDL3zNSPAmxxwy6fhj2dzJGgItyq9tN8K
 UONOo/RSIYJhINDrATsDQPYCC+0HZvY0RrsmZMBPOF13p9F03cmbXSi7g
 43IdGagYzu4WfIMC+x39djqlHSa2ox09k4/sv+U+HN39RGMpskG5+rUiD
 CvK9WW1D6R9WQWDMepe81KzK+bcatIkJItp/emMIsu2VIg8U58PrqdNsG Q==;
X-CSE-ConnectionGUID: 6TTf0id+QZe/eXHeJjxtdA==
X-CSE-MsgGUID: 5fehMGIXTUKZavdsHRmWyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76164496"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76164496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:54:38 -0700
X-CSE-ConnectionGUID: Pa5EjRiNTIWaYCCVETGI6w==
X-CSE-MsgGUID: brtD2RHOTSa8mcpo17kEtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201175478"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:54:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:54:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 17:54:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9rFUwzvqQ/npFzCv8fjrVK4oOrj2SRTe+b5YTFCbGhXW9RWg6KMoBtGo2n44K56ZnE2FrVGWf4pCA6ByRSR/PmYmX5E3Jh+2z7wTn8ylvcsfIrgnNT1Ppt7S8PtA0TsphUulaV5xCSZ7z1LclfNXzUmTXsQBbnF/aNhi9lc8XTz3Jx4n5W4eOpKKmjLtfPbsToLQwWRI8GyViA/IwqpoH8NGxkACpJdL+mJgfrUO2jY0U6Ch4y3ZLyKX8AM8rkssLcdXGE3bk+gWzN9MeDyckLj5EZWx4dABT7rQJ7EqoHuF8KDUF3dLis3ndarJX2Coyo5wR0cmCEAnSSj759Yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYr7fQZqY+h9GCrsMhaF19E1bxbGdNmDZHdDJGSOSTw=;
 b=iELhEuBtDoO+87G7o6XDtDd4WIZlXfMcon+WaaqpJLETPow4I1gZdTwUvo30b5FL+TLRF3WhNC/Mf/ASCH+SJ2khsA7GnmD5PkJY1IRtHcjOQWfTpnvTNE3ukihtEJv0fUJB6oJyCwykTK8JU2Y5wIRhKXM99pr2aduJPJHwVVwE7+ahIYK0uPhddYNlVDbYoxYDiBUrAnYbBCVJVk9zR9aanVBUaOKUnOS9MDeowAfKIDNw2fFXE9y0/p+wH/lh1Pmguj7vFOwJPNdxbDMRgMyqq/+7EHhxnALfy/jnM8GVyVU4uUjlgTbbRE2vq2fw5lwCSt1SZnKVsrkDenVw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 00:54:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:54:28 +0000
Date: Thu, 28 Aug 2025 17:54:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Add xe_guc_pagefault layer
Message-ID: <aLD6QGh0v26tdCtD@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-7-matthew.brost@intel.com>
 <9958e5bcd6c539f4699db872e96ff31febc250cb.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9958e5bcd6c539f4699db872e96ff31febc250cb.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cadaf8-7396-47f2-67ce-08dde6969b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzgrOVpERGpqdUhzb1cwSWdyVWowNEF2aVZGV2FvTE1nb0JlMTdVaVp5QldR?=
 =?utf-8?B?R1hiS21KVUJOeCt1NWhMdnUzV2RrZExrODFWSXlrV20rdkppYnZ4Y2tJUFVT?=
 =?utf-8?B?bTVBQXd0aVBxSDZkYUNxMWFzSFNnOHBibjdVZjlVOTdIRnIxMkVqWUdtMXVF?=
 =?utf-8?B?VlpZVk95UTlQdDR0UWVJQ3RrUFdESmJWZERyRnYrOFZobmprTU11Z2VBZklO?=
 =?utf-8?B?NStYSjVKdXh1MFpkU2hkTXZUYmlIUXdZaC9qdndkM1pUclovOUk5QkxBQ1V1?=
 =?utf-8?B?ZGpINVVnOWR1OGQvUXd3eXR4em1UZXpnRStiK3ZDemIxaUdLbzZnVU1IMHhs?=
 =?utf-8?B?VTZLV3NpU3JGeGJtbU1yVHk0M2FQZWtUSG5NcmMwNUxSRGJTSWhsOXhGVHdJ?=
 =?utf-8?B?SjZyZjB0bnZwZ2l4bzA5c0tWSStFYlUrblRSeE11VUZYb1lER1hJWVA5MU9Z?=
 =?utf-8?B?ZVFyM2NnMUdieDVvQktaNXBjMEJQeG5TQW11MzBYQnRqdUc2OG0rNm10bWth?=
 =?utf-8?B?UHVVci9DL1poaUpvYS9qWnNYVElFeUE2SjV5dEJrZDJTUDZ6WDNRYVk2cVZR?=
 =?utf-8?B?SWM0akx5V2J0dldqTzVpejloRWRoeWowQklMMnlrRGx0a3JzQ1U5M0xFaXg2?=
 =?utf-8?B?Y1k1MzRFaEZrRWtSSytTM0h2a2FGZE1VcE9EaTRtODJ1VEhLd1NKdUczQnJh?=
 =?utf-8?B?b1hhRmg1ZHFJanFENG9TTDZFczBjZ0g3UHRPcm5JK0pmZHFiQzNTMHNzUnJj?=
 =?utf-8?B?dm5Ub0ZtQUFtYk40WHNPd2UyL3RJWWF6UWdHZ2FyWlRVRFZXYS9BTHRLajNI?=
 =?utf-8?B?OHhtMCtsMDY1UmFkSlhhcW5neVBZOWJ1bmE4emREaHJadW5PWHpaZnVnU1hx?=
 =?utf-8?B?WUpHSEs4UlMzc1RuZ0JMYlQxODlTUkdUUVA5MUdwTHhQeXdpN3NucjlNTlRC?=
 =?utf-8?B?dUlRY1hOZ3grZXBZMnhyQkFTQ013S013UFBZN2xoK040N3c3UDJBUFQ5YkUy?=
 =?utf-8?B?Q1N0VzRIUFJhU3FZRlFwaHphdkRiNzlQcHovcTlMQUFJQWlSQms5bDdBeVB4?=
 =?utf-8?B?aVBMaG5ZWnVnbGxLb1FVTnBLeXdWL0dwa05YZHlRNlJDZzI1d3RNYUcrVzlR?=
 =?utf-8?B?cEFBSnRycXdWSzQ5RjNPRDROc1g3dk56UlRNVnFIWnBvNmZ2TjJnUmxENk84?=
 =?utf-8?B?azB3N0thL3F4SUdaRzAvbzd3VFA3c25Ic3RYN0t4YmVCSzNqeXdvZVRJUEZZ?=
 =?utf-8?B?bHBMK1dmWjZHQi91enRPdkRURVl2cTk2WUNPSHdyUFNPL2ovNzU5R2pRTGhs?=
 =?utf-8?B?a0ZoTzNJNnE3YWExV0U0a2lteExmV3oyUUJsNzlzUUdreisxdUlvTVVnYkJC?=
 =?utf-8?B?OTkzd3ZEQTgzNitlcHpDdUFSL1ByeHpGOUZrYUp2T3Y4OEF3R2h0UW9HMDAx?=
 =?utf-8?B?SVYwWVhVdmlMZDBsQ0ZUMCs1MFVRY1kwY3hMcUE3R2dIWUZKV0wvWjdDaFA0?=
 =?utf-8?B?ZCtvWTZaUVdDK2tORVd0MTZZR1MrSFl0V2tWbzBvQmpaYzdyTmpvbGxWK3FX?=
 =?utf-8?B?MGdUWGIvTHBqM2ZHVzhjTk9iMll4L3BPVUVkSmNRcHo5TlB0cmZiVFR6Y1lB?=
 =?utf-8?B?Y2d5eGpkWnd6bWlJaGcrajVCSTZ5Mk4rRE51VjJiNmxDR0tBakJIRHF0QzNj?=
 =?utf-8?B?MWRkeDZSZHBjandUMzllMUovQzRMSlJqSXpCai81amkxSHQrWXQ5TGp2Y3pi?=
 =?utf-8?B?cXdoY3U3SHcvRHM1YUVPNE1la2dzSkpDY3hDZmRWNkt0Nm14aE80YjNOZ1Bl?=
 =?utf-8?B?L05SSlZMRU1vSmJEZEdlM2JVRzFNL2Y4STB0dkhtZS9BTkgrbFpwdUtjYXBM?=
 =?utf-8?B?Si8zbWtPb3lDbUJ2TGsyTktxQUdaVzIyQjFxT1JWbk9aWC95d0dOTk1BUFRi?=
 =?utf-8?Q?7vD0caV8hkc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c283VnI3SHNpTG5VNC9EZVdpWXRQOGlteEx2R2t0V2J1R2c0ZmVnaEc0SVJK?=
 =?utf-8?B?NnIvMjNYWFRxWmVDbllJMXdNS0hMdVdmVjFWSzFSUHZvV1JaRDQ2QjYrbWpD?=
 =?utf-8?B?eVBxMXIzYUZtTTRDclg0OTVkQ3pDWWdzWVB5ZW13cW5WMmtsYXoyNlgxWUNY?=
 =?utf-8?B?dkpsbXhsb3RoSnBUSkJrK3hoeTZqeStKSUFKUWxxdmJvdkFaWUJTbGVyRFNB?=
 =?utf-8?B?RGNwd21qVzlYYVhzUWFUN0xtelQwR0svZVZmVC95S1hQOW5tbzBhN3BnTklu?=
 =?utf-8?B?Lzd3V2NxZWhUbmViSEEzWjNNWlJXWHFNS3FnL1V6ajhIWE40eS8vSU1ZZk1P?=
 =?utf-8?B?QXpuNU9IaHF6d3IwQ2Q2aWRWNlAvVmRnekNuQndENHptMGVtOXZHY1pFaVNN?=
 =?utf-8?B?RzJSVkdMTGpJbFNOMXZiTHpKK1ptdy9GTEYxam1HYUtlNldIUlBJUU5uVTg3?=
 =?utf-8?B?UnBlWndvWk5Rd1JRSVFiSFdFVmdhYWQwbFFncnl4LytvUW1jU1dyQUxjRGpT?=
 =?utf-8?B?UzBYZVZOMkRyVlBBT0dqaVpBaXpjU2xwSUxxZzFTcmM1WHlpNWtEVXQrblJM?=
 =?utf-8?B?dlBYbEtwZXhTTVJiMnRJdEVrcUQ5T09uOE5MZ2srMUZtL1gwMzZtMVg1c28w?=
 =?utf-8?B?ak5lTW9oNE14RnZmNUJnQzRhYk84OUhFTUhVVE1vYWRFRFdKc2FUQUF4Z0Ft?=
 =?utf-8?B?WmdaL3hla2NPei90bHpVaDkzUkdSU3RrSWFCTHk0OEVveVVZeTlvYmFBV0NY?=
 =?utf-8?B?Ri93eDRIUGUrUk96Zlg2S0lKRHVYanh6M1EweWdpMk4wdHpySURLL0VGcnZo?=
 =?utf-8?B?YmptZWNZWTBuMldDY216anpmTHJhS0g1TXhpRHl2SlhHVzZMNjVVdy9tQ2RQ?=
 =?utf-8?B?RWZlbm9yWDNFYTh1ZjdrVTZZdUtHZlg2Zjd0VGM4MW5QN3F2VUNxelRnSkky?=
 =?utf-8?B?S0dKZEZvNm84M0JYak1IbUhJaXB2OFdYT1JyZ0UrWG43MVk5TnhEUzc2cm1R?=
 =?utf-8?B?c2FSbXZjdDhhL21VNlhlQkpyb2FkSE1oVHo0bEJNdUI3dmF1ZFBrU3dod2hB?=
 =?utf-8?B?RzdsOUlHN0JMZ2U1SnBZSnFvUk5yblIyUjN5czE2MjQ5d01PZzkrTnllSm9C?=
 =?utf-8?B?MVkvVjFPL3FnQ0Q5d2JHb01uOXVsRVpHYWJzaUxKNzhMVG1QQXQycU9rZ0t2?=
 =?utf-8?B?d2o2K1EzMjAydGMrZWFGTDlqZk9LUXJJbDVUUGUwV3QzQlVCYzJwVTlnam9Y?=
 =?utf-8?B?cElFTHgxUEhJelNFL1I5Tm5IWGtHOStISUxRMDBEaHJNQzJPYnJZWkRsd01r?=
 =?utf-8?B?eHU5cCtEdzJWdlhKbVI5bEF3eVhVZW5jRFVyRFhlMUZTc3N0WGlSRUJ5QlB2?=
 =?utf-8?B?UVM2bDY0V293S0gyMEhWc0UrMEFOYVpydUtVZ0JQOXZlSkZXOHJWUGMzeEYv?=
 =?utf-8?B?S3ZxN01YRFNjeHp1QXBuenBVTHNKb2hvKzAwWnlyNVYzSk5yQ1Eva0wwMFYr?=
 =?utf-8?B?NVNrc29qMDQwbzNaR0Nnd0xQYVgyWE9mZHF1aUpjamp2aStDMjZGcjdIUUFT?=
 =?utf-8?B?bGtNMGxrWjNjUy9aVDFGYTYvWHRLVXNtbVNoUTV6YTBJTFdXNzBIeXdSck5m?=
 =?utf-8?B?SmdQSkxoelRCUHNidXoySkMxcEd4Q0xQa0tmNzByaVQ2ZlR2MkIxdFY4TDhC?=
 =?utf-8?B?MXRuZlpnbHhiT0VJcjlkVjNBNFZRRlFYK09BTTlrcjZGemxXTHFoUDZnWjJU?=
 =?utf-8?B?UEdBdit1dCtIRm1sbGtDdjl0T3BzbitmY1AxaVRXL1FwTGF2bWxvdHRiako5?=
 =?utf-8?B?cnNraGRFQU9Oc2VFMUh0UUVqa0xIMDI4ZnNHdjZMTEx1eU9lbVZOVzVkSlRW?=
 =?utf-8?B?NXZWK2dFVkxSM2laV1p0aFgvNHIwTyswSU1aNlBPSDJJYW9SWmd1WGEwQ1V6?=
 =?utf-8?B?bTRkL2FEbkZOK2M5R3RNMUhGOUh1MU04K2RCdXJlYlR4OHY4aVJySzlzUklZ?=
 =?utf-8?B?QXFYdGIvNTlxRmI4MHVETlRFU1A5TXhoK0E3L2NMWm4wcFZSSDR1VWxDYVZW?=
 =?utf-8?B?NGNPNHRzMDhaTjhIaW9XUUJ5aTN0VWQ0TWk3UHBGeXcyVG1vSTNXZWs2cnE4?=
 =?utf-8?B?Tlc1dUlGWHFUZDR3ZXpJMm1oc1J3c3d6UGtvMTRxY0dGN2lQL2tSVUFxemJa?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cadaf8-7396-47f2-67ce-08dde6969b86
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:54:28.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBgA2HNe9IPvdZkEWyiw2HOjrdKn2wTyUAQEgCEuC6yDWHTmQl8fbsBNklx1Tjt6zSO7W58ZHMWalS2xfRUdUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

On Thu, Aug 28, 2025 at 04:11:49PM -0600, Summers, Stuart wrote:
> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > Add xe_guc_pagefault layer (producer) which parses G2H fault messages
> > messages into struct xe_pagefault, forwards them to the page fault
> > layer
> > (consumer) for servicing, and provides a vfunc to acknowledge faults
> > to
> > the GuC upon completion. Replace the old (and incorrect) GT page
> > fault
> > layer with this new layer throughout the driver.
> > 
> > Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |  2 +-
> >  drivers/gpu/drm/xe/xe_gt.c            |  6 --
> >  drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c | 94
> > +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_pagefault.h | 13 ++++
> >  drivers/gpu/drm/xe/xe_svm.c           |  3 +-
> >  drivers/gpu/drm/xe/xe_vm.c            |  1 -
> >  7 files changed, 110 insertions(+), 15 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 6fbebafe79c9..c103c114b75c 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
> >         xe_gt_freq.o \
> >         xe_gt_idle.o \
> >         xe_gt_mcr.o \
> > -       xe_gt_pagefault.o \
> >         xe_gt_sysfs.o \
> >         xe_gt_throttle.o \
> >         xe_gt_tlb_invalidation.o \
> > @@ -75,6 +74,7 @@ xe-y += xe_bb.o \
> >         xe_guc_id_mgr.o \
> >         xe_guc_klv_helpers.o \
> >         xe_guc_log.o \
> > +       xe_guc_pagefault.o \
> >         xe_guc_pc.o \
> >         xe_guc_submit.o \
> >         xe_heci_gsc.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 5aa03f89a062..35c7ba7828a6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -32,7 +32,6 @@
> >  #include "xe_gt_freq.h"
> >  #include "xe_gt_idle.h"
> >  #include "xe_gt_mcr.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf.h"
> >  #include "xe_gt_sriov_vf.h"
> > @@ -634,10 +633,6 @@ int xe_gt_init(struct xe_gt *gt)
> >         if (err)
> >                 return err;
> >  
> > -       err = xe_gt_pagefault_init(gt);
> > -       if (err)
> > -               return err;
> > -
> >         err = xe_gt_idle_init(&gt->gtidle);
> >         if (err)
> >                 return err;
> > @@ -848,7 +843,6 @@ static int gt_reset(struct xe_gt *gt)
> >         xe_uc_gucrc_disable(&gt->uc);
> >         xe_uc_stop_prepare(&gt->uc);
> >         xe_pagefault_reset(gt_to_xe(gt), gt);
> > -       xe_gt_pagefault_reset(gt);
> >  
> >         xe_uc_stop(&gt->uc);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 3f4e6a46ff16..67b5dd182207 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -21,7 +21,6 @@
> >  #include "xe_devcoredump.h"
> >  #include "xe_device.h"
> >  #include "xe_gt.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_monitor.h"
> > @@ -29,6 +28,7 @@
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_log.h"
> > +#include "xe_guc_pagefault.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_guc_submit.h"
> >  #include "xe_map.h"
> > @@ -1419,10 +1419,6 @@ static int process_g2h_msg(struct xe_guc_ct
> > *ct, u32 *msg, u32 len)
> >                 ret = xe_guc_tlb_invalidation_done_handler(guc,
> > payload,
> >                                                            adj_len);
> >                 break;
> > -       case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> > -               ret = xe_guc_access_counter_notify_handler(guc,
> > payload,
> > -                                                          adj_len);
> > -               break;
> >         case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> >                 ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg,
> > hxg_len);
> >                 break;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > new file mode 100644
> > index 000000000000..0aa069d2a581
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -0,0 +1,94 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "abi/guc_actions_abi.h"
> > +#include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> > +#include "xe_guc_pagefault.h"
> > +#include "xe_pagefault.h"
> > +
> > +static void guc_ack_fault(struct xe_pagefault *pf, int err)
> > +{
> > +       u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> > +       u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf-
> > >producer.msg[0]);
> > +       u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf-
> > >producer.msg[0]);
> > +       u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
> > +               (FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
> > +                PFD_PDATA_HI_SHIFT);
> > +       u32 action[] = {
> > +               XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> > +
> > +               FIELD_PREP(PFR_VALID, 1) |
> > +               FIELD_PREP(PFR_SUCCESS, !!err) |
> > +               FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> > +               FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> > +               FIELD_PREP(PFR_ASID, pf->consumer.asid),
> > +
> > +               FIELD_PREP(PFR_VFID, vfid) |
> > +               FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> > +               FIELD_PREP(PFR_ENG_CLASS, engine_class) |
> > +               FIELD_PREP(PFR_PDATA, pdata),
> > +       };
> > +       struct xe_guc *guc = pf->producer.private;
> > +
> > +       xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > +}
> > +
> > +static const struct xe_pagefault_ops guc_pagefault_ops = {
> > +       .ack_fault = guc_ack_fault,
> > +};
> > +
> > +/**
> > + * xe_guc_pagefault_handler() - G2H page fault handler
> > + * @guc: GuC object
> > + * @msg: G2H message
> > + * @len: Length of G2H message
> > + *
> > + * Parse GuC to host (G2H) message into a struct xe_pagefault and
> > forward onto
> > + * the Xe page fault layer.
> > + *
> > + * Return: 0 on success, errno on failure
> > + */
> > +int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > +{
> > +       struct xe_pagefault pf;
> > +       int i;
> > +
> > +#define GUC_PF_MSG_LEN_DW      \
> > +       (sizeof(struct xe_guc_pagefault_desc) / sizeof(u32))
> > +
> > +       BUILD_BUG_ON(GUC_PF_MSG_LEN_DW >
> > XE_PAGEFAULT_PRODUCER_MSG_LEN_DW);
> > +
> > +       if (len != GUC_PF_MSG_LEN_DW)
> > +               return -EPROTO;
> > +
> > +       pf.gt = guc_to_gt(guc);
> > +
> > +       /*
> > +        * XXX: These values happen to match the enum in
> > xe_pagefault_types.h.
> > +        * If that changes, we’ll need to remap them here.
> > +        */
> > +       pf.consumer.page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI,
> > msg[3])
> > +                                     << PFD_VIRTUAL_ADDR_HI_SHIFT) |
> > +               (FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> > +                PFD_VIRTUAL_ADDR_LO_SHIFT);
> > +       pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> > +       pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE,
> > msg[2]);;
> > +       pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> > +       if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> > +               pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
> 
> We have a comment in the current implementation that says "sw isn't
> expected to handle trtt faults". At a minimum it would be nice to keep
> that here.
> 
> But really it would be nice to have a little documentation here as to
> *why* we don't care about these types of faults. Should we print
> something if this shows up, at least for debug?
> 

I can add a comment but why we don't expect these faults, I really have
no idea. I believe I copied this code from the i915 without any real
thought.

> > +       else
> > +               pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL,
> > msg[0]);
> > +       pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
> 
> Again I think we should log the instance here as well.
> 

Sure.

Matt

> Thanks,
> Stuart
> 
> 
> > +
> > +       pf.producer.private = guc;
> > +       pf.producer.ops = &guc_pagefault_ops;
> > +       for (i = 0; i < GUC_PF_MSG_LEN_DW; ++i)
> > +               pf.producer.msg[i] = msg[i];
> > +
> > +#undef GUC_PF_MSG_LEN_DW
> > +
> > +       return xe_pagefault_handler(guc_to_xe(guc), &pf);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.h
> > b/drivers/gpu/drm/xe/xe_guc_pagefault.h
> > new file mode 100644
> > index 000000000000..0723f57b8ea9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GUC_PAGEFAULT_H_
> > +#define _XE_GUC_PAGEFAULT_H_
> > +
> > +#include <linux/types.h>
> > +
> > +int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 10c8a1bcb86e..1bcf3ba3b350 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -109,8 +109,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm
> > *vm, struct xe_svm_range *range,
> >                               &vm->svm.garbage_collector.range_list);
> >         spin_unlock(&vm->svm.garbage_collector.lock);
> >  
> > -       queue_work(xe_device_get_root_tile(xe)->primary_gt-
> > >usm.pf_wq,
> > -                  &vm->svm.garbage_collector.work);
> > +       queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> >  }
> >  
> >  static u8
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 432ea325677d..c9ae13c32117 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -27,7 +27,6 @@
> >  #include "xe_device.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pat.h"
> 
