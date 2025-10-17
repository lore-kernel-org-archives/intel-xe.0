Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EE9CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4683910E1DC;
	Sat, 18 Oct 2025 02:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0nWEWsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9810E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755812; x=1792291812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wQ0JWiFGNQTi5bQyq0YOdoJTAv6lUnKd77WFmn0X0Nw=;
 b=T0nWEWsqVFqMhbLgA+r93ntB3M9ELC635YPTXYV3PJzf+kso7IZn4pMS
 AUpkvHw3B9hY/xigadMi6egW1KhDjPV2c5lI4jJjbfCt50Ho6ww+tF+M+
 khtuMzsUIj0h+bZCaP4rTOdHxGMwig2lJcveISTIqLCxCBUDSr5PsUOKt
 6pFvwW+tAHTPnyIZbmxN0DTE1k7egOwM8nyggbf4EsjSdsIg6uh4oILeA
 QFauHWu6AgTGYPgo4IRs98Zyqp6ngRW79vGDtdgGpXZvt/yn2NzBzAS65
 AecdBVHR6tfmYOjdFFaY/1doFzQyFzPU61o9UQ/zLxeP5LkPwG1PTj/QW A==;
X-CSE-ConnectionGUID: jY0vH9skTBatL9DKF78o5Q==
X-CSE-MsgGUID: LP8ymyLCSueO6pj+3xt9ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66612372"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="66612372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:12 -0700
X-CSE-ConnectionGUID: yRxblqxPSxCgQYAlFwwZnA==
X-CSE-MsgGUID: SJ6+0cQWR32Hbf5ZNq021Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182819851"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:19:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 15:19:45 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbmnqRGSNEM7RhJYzLH3aAaSrQwAJMQ/bZgexeaZR6aiZdGzJYy4YsD+vZ0Ju/50LgpwJViSY5Y6I0DpPnuShHmM3fyqyZrG5D2VFUuPB2i62sVQWhUZamUsQOVCI38lXTXCwcxBUu7wENYR68hcdUAF2Qsjq0jej1OAZlr/4vcSp+s16ScAZf3AWTyGgG73Y/usfGLoSv3Bc9zANxc3FaQbFrfL3O2i/MhrVG7VAqW9cmha/mbSfGAdfx2aAZxZgkgtJvjsnEKJ5917Uenzb6PSBqBe/4fNEGX++6Lwb2spti2bWnS64/K17etJdp54RYiVAJSXc+DOrQCCqR59AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm6f9UqQhpxNnoH3X6uPhNnvLKWD+Ya1J6Xzr+OI6Yo=;
 b=Aw/CGFkUi0xNgwjs3Te58x2K9Gldxhi0kR94Pf0llGJQ/v87M0GmPIrbwW2TZk6+7ylR+xi1pXCUzGOWpzHsZAFVE8jSiGNDBBNTQQfgLAL5601NJGas3r5sj4DjnI2LRizBdC4DrRa6EFZ5NMoRp+nS+skKATE0sm7pu9m9Hor64H0O4stQKDj/w+0HuhlddatSnhGu0Z33a1+T7qtafJ3Xuau6Gt/lki7gJUHCLMrBFSsjOzjkaY34kUkgtePB2SqQDNAHXqXyZxz+vPD3j1esHtSnM5/gV/xRZznecfGacVI//RzehBqOot0P4slGVkq6V7eueZRzUFVFjnu3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 22:19:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 22:19:38 +0000
Date: Fri, 17 Oct 2025 15:19:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Message-ID: <aPLA97EuckLAW5iZ@lstrano-desk.jf.intel.com>
References: <20251015104709.44476-1-nitin.r.gote@intel.com>
 <20251015104709.44476-4-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015104709.44476-4-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5264f33a-a001-4da0-da9f-08de0dcb42b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2QvNTI3UnJXOWJEY1NUR295WEZxd2Z4Z1VCRmQ3UytXODM4RTVnYk0yVGFF?=
 =?utf-8?B?U0JUcjJnQktlc0tYY3N2NVA2YTFKL3lnYm9IcVBNNHY0VnVRdG1KckpES0dM?=
 =?utf-8?B?R0RzR2dLdzdhZStBZERUeXFsMUwwNzJ1OW5aL1VISkpwaE1TdVJSUVZ1UGhW?=
 =?utf-8?B?bzhPejNsWExoaGxoak5RY2hGRkJ4OHJNSkFTamJoS3E5eWFSUGJnTHhIUjdq?=
 =?utf-8?B?b1RTdC9GazkyMHphUDk4TWxTazlzVURZWVBZdE8rYWFJRlRVVXlHR1NOZW5Q?=
 =?utf-8?B?YTJVOHJudWdaZlZBbXQvbGtYMWhUdE1EOFVuVWMrZXA0OFhYbGVtbzlGOXg1?=
 =?utf-8?B?Qksvay9SRHpnSjdTNnVKSWtkOW10WWpHREh1Uk95QlBFSmRldGI2VDVJRVFB?=
 =?utf-8?B?ajV2NFozKzlkNmFTWVB4bHRHOHRoWlZ2am1lYy9nOFJmcFpZVVBmYXJkSHln?=
 =?utf-8?B?UlIrZGNaS0M2N1hoTTdtMXlVT1Z2UlVtRnVOdngyZFFJekwvVHIyRFA2QU5l?=
 =?utf-8?B?dlVFSmg3UzcxREUzZDRyL1VCdEhTeE5CdHZ4UWxYUndZZjBOcnRtb05XRmc4?=
 =?utf-8?B?bHRZOVVRSjhTQ0dwZUdtSElPakdEczlpblRPNTBpbTViRjJ4REdxMGRBTVN4?=
 =?utf-8?B?RlZ4TG1Tb1ZvVkNMR1N5VUdJazRmbEdQTlVTT1RYSFpzTEMyVFJxaWVDK3Rm?=
 =?utf-8?B?L1Y0T3Jta2g5cFdvckZ2MGVmalNZRUpLZ3V1ZmlCaTNVR1lJYjFUSThqU0pE?=
 =?utf-8?B?UVUxRHBtaXpFdlR6MlJwdkVzd0REUkdnZDR3d05zZkVkbW15K21ZNVh1WXVF?=
 =?utf-8?B?RW9zTHR4L0Y4WXdtdysyMWtoRVkzdmxjbkFYdjJ5WHJDVHJGSExqSkVFZkYr?=
 =?utf-8?B?T2p5MnFIVHF2WUVtSlBPS1pMeXBXRC9oREI1Nm1YSm50aG1qdjgvL2NCQW00?=
 =?utf-8?B?OEwybElvS3lZWWRDbGpFS3VNYVV4Vjg5dFRNNUdQNVVORkxVbzYwWk9WNDhr?=
 =?utf-8?B?OFlMUE85SmtjYlZJS2p0R2JrMmNvSU9FT3hsWTU0OUtYOHY2aEw0enFQcEQr?=
 =?utf-8?B?aDczUUJaZ1ZzeWk0TkYyYTlCWDd2djRnYmo3VU1YMVc0eG5reGZOSVJSRE01?=
 =?utf-8?B?cWNQV3BIa0Q4UDZUZEZvbFVrNVVtaDVRZU9TcHZ2RTJlTEphd0JDcERNOUlD?=
 =?utf-8?B?MWsvVitkSm9ZeTFlb0Q4Zi9CZ2RnWjQxSm9QWWtrQ1FzQm9lUTZIYUd3ekw3?=
 =?utf-8?B?clVLa1Q3Vlhrd3JEQkRxZkZoNkpyZU5qMW1nZGlIU1RUdzRCb1pZOFJIbG5o?=
 =?utf-8?B?bHZHWksvRFZNRmtmSitaVEVESExBVmZKODRIakVnRlM4RGE3TEphL2YwVlVE?=
 =?utf-8?B?NFU4ak52cGpVeVVGRHA4WkxYYkd5SUR2bStlV0MwRzA2SnAxWjBlYlBnOWQ4?=
 =?utf-8?B?YVdFL3ZRUnpGQmRWS0pOdTY4VllERGFWU21qdit1eDBnMlhYMW9mV00yMlp6?=
 =?utf-8?B?QzM1N2xQT21lbzd4UTlIbys3dTh2aGdOVk42REw2NU9SdVZydjQxNDdiZFhl?=
 =?utf-8?B?cUNrTytGclRUaWJQZzExZDBvKzlNRk91WG43NFpBQUJHSGp6YThtYm1icDFR?=
 =?utf-8?B?QlBVZ3VZQk42WnM4UGpsYldlZEFnMk9jdzJZWEg4MzNvbVpPcWxzT1Ivd2Yx?=
 =?utf-8?B?VGhMc05PcENvbUJ6eDJNcndody9ZeU9jKzNOaVhCODJobDhXdy9OYVgwQ0N3?=
 =?utf-8?B?M1h4YWJkcExDTHlWbHZobWNaTG5BMnVybUY4UDVYRHR3UTYwVFhEZTU4M29n?=
 =?utf-8?B?RTJ4SCt5ZXIvQ1Mza3ZNZnFKcTB6dUVYcEJWNm9lYUFOV1U2VWRlaVEvWXhh?=
 =?utf-8?B?aWtCNW5PR2FrNmN1aFQ0Q0hqcWxsajVEM2hLK0MvbDFWV1JxNmwwdU9MQ29w?=
 =?utf-8?Q?SgkU3oOd4mcBdHZT2uKOmZRVwSkWDKAS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlBCbEx0V2Rzdnl2UXF1bmw2emh4MWNpMjA1MGlpQ1NMbkIyU2xBOXVNanlD?=
 =?utf-8?B?WmhQVnkrNTBaUHpHdDdENlU4RHpvWWViK2xpSGloSEVsRmxlS0FhZEF1QklL?=
 =?utf-8?B?dWlEMWpET3BNSVJSTzVDRUJkYmNQOUtYYm9zZzVVcDNsK3lad0ZLM0RQQ2RP?=
 =?utf-8?B?Rmd0Rm5LMm5aMFh0L3hZekMvZFJHSXBnUU9NZGlVZVFQUmt0RWpjTCtYcVV6?=
 =?utf-8?B?TzZ5bnpqSDhzTkwyR0pLR2hpcnFtTHVZTWpvb0owNlN4UG91RFdUUGgwZno3?=
 =?utf-8?B?ZGpnSldCUHI0OTlPQ29jNlV0NXFONGNGZTVVTCtzYmN1d1cxZy9tVlhBOEhl?=
 =?utf-8?B?ZFNzYnN0UjMzWGMycFRCRHAvNG1kL09RV2dQM0FMUGVuRWpjbmJHNmpTTWZt?=
 =?utf-8?B?c0ZDSG5Oa0VXOFpMS0ZBak9Hd3ZPellSZXJjKzJkQzkzeE45bWpvcVJyL1ZB?=
 =?utf-8?B?WnRSSFhuRXdSMW1rNE4vQzNPVlpqYkJJYkhBVVhiVUVUOGNYWVVGY0poNVlk?=
 =?utf-8?B?aWU5NWM0UHZ5SDBrU3NKL293QnJYOERPUUt5dXIzdjhvR0RtQWdaQmZtYlRK?=
 =?utf-8?B?L21zTVBvUjN6T2dYZUJtUWhYa2hneFVpcWJKSFRIWjJQd2RLT1RJdTM0NnBZ?=
 =?utf-8?B?Y09Rd3NRQXJuNFYzeitha3IyS2NLRFdTSlE5TGR6YXJNR2xTZUJWcFY3UFVP?=
 =?utf-8?B?R00vcVZpcWhWWmtmUjlscENWRUE1OWZwM2VYSVl2emN5L2xWN2R3NlREejJi?=
 =?utf-8?B?Qk1mb3J0UDV6Z0JWbW4wNlR0UmhkdDFjNVNEMFp6RkZDd3hpKzVkcDJQdlRW?=
 =?utf-8?B?c3JYRlU5QllpT0ZyQ2tLeWwvTE5PaUtlQW5BdjlQMEg1cVdJVDg1VUVreXpq?=
 =?utf-8?B?S1dJRDBid2VteExYNTAxVnhtemwzNTJBZVlubVQwUmk0dEpyNkliMXJaeUxh?=
 =?utf-8?B?cTJFMWcrWnNEOGVaRWdGQzZvQWdzYnJDVlVDampaRUNVWmhwaHl1K0JqS1dR?=
 =?utf-8?B?OUNkemExclRkWkhoNk5telBFZENLSXRuMkdjZlgzeFpHYTNpV3JzZTZJUnpQ?=
 =?utf-8?B?Tk92WHJHdGV2YXlEYmd2VXlTU0toNDlrVHhzZEpjT2gzSnlJbVY4dWdjRkRz?=
 =?utf-8?B?dXdza3RvYUQrZGxScnI3MWJjOS9hemk4Q04rdDkxUEpBRUdLeTNlUlFJUFFn?=
 =?utf-8?B?U1Y4bzFaOWFYakt1YndoTUdhdUlDUENhWWY1MEp5aFBXUEpKMFFGdXZmdUxy?=
 =?utf-8?B?MVdhejdEcWxPOTR5TnhXR0hldWdYRXZHTUdTVUg3UWdXVjBIdjUvUHk3MUpt?=
 =?utf-8?B?NlFTMUp2UkNBYWZCNnNURzRnTXdqeVJnbmMrWjk2eXNkNU03THdxQTM4SVI5?=
 =?utf-8?B?VDVzQTFtS1ZLbUIrWW5mSURZeWtqSUFhUDdEa3RoaUFBM0RSQXhSZUlKRjdG?=
 =?utf-8?B?bGYwKzBieW56OWVqcCt6UE9zbkM5dmpuaTVpb1lxQWxuTmtJbU1uODVpZ0t5?=
 =?utf-8?B?R1dBWmVoUmMyaUhlS3dSaDdPeFlBekJSMk9zSFl1OVp0Z3NvL1lrakZWSmRY?=
 =?utf-8?B?djNYVlJ3R25CTGRuamI3VzIxSzZqeVg0TGpvUmwvZTlscG9vRmdSTi84MEJl?=
 =?utf-8?B?Uy9lN3ZoL0tFdGltQTZCUG9aZVpYM0FmaW81VXZKQnhEVGkydWhLZXRueHpO?=
 =?utf-8?B?WUpvTjFxbUVLbzZzZjdzOWpPNnlZTlBaTzBRVTNyekhxdzZhVE5SMDVGNTl5?=
 =?utf-8?B?cFUzVVptWUNEUVVFMzltNmhHeUYzUFpuOUhtMEVuVTZOcldGNm1ucTlLNk1z?=
 =?utf-8?B?bm1EMlA4bWFDTlUrSUJFbmdqakZSTVhoZkY0emUzb1VScDNSTGJaVURvbnFD?=
 =?utf-8?B?ZVNvcDBKOXdYK2N4bXBPR3g3NE1wVEMzWEFNQlVmc2V3OHUzYmZoM0NXSlY2?=
 =?utf-8?B?VWRPeUl5bXVCM3BudVVERVF4T1g2M3ovRVhkLy9ONm9CYTVDRnRneHZtNWNL?=
 =?utf-8?B?MXo5QWJ3cll5T3dHbFFmUGdscjI0ZDlxK0MxMTFEVDJDRHRsM21lWVJrb1g3?=
 =?utf-8?B?d1FzanJXajRKNjIrSjBvRDJJTXQ2RmQwaGEvdnNPdnludEFpbFBIblJ5WFU5?=
 =?utf-8?B?Ymg4MFQzaTZEdWE3ODBjdk03bm5MWE5KdndKTzhvMTRPUy9wY3FteHMxSWhu?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5264f33a-a001-4da0-da9f-08de0dcb42b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 22:19:38.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKuURQTgUeMlBfcb6xOlxS6C42rGNtAQ4e4ifXVgaNLM/E6EiOnzALbjo3jyUHSibq2w5DcEWNuobjwJtVjMhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
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

On Wed, Oct 15, 2025 at 04:17:09PM +0530, Nitin Gote wrote:
> Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
> 
> Key changes:
> - Parse and record per-op intent (op->map.request_decompress) when the
>   DECOMPRESS flag is present.
> - Validate DECOMPRESS preconditions in the ioctl path:
>   - Only valid for MAP ops.
>   - The provided pat_index must select the device's "no-compression" PAT.
>   - Only meaningful on devices with flat CCS and the required XE2+
>     otherwise return -EOPNOTSUPP.
>   - Use XE_IOCTL_DBG for uAPI sanity checks.
> - Implement xe_bo_schedule_decompress():
>   For VRAM BOs run xe_bo_move_notify(), reserve one fence slot,
>   schedule xe_migrate_resolve(), and attach the returned fence
>   with DMA_RESV_USAGE_KERNEL. Non-VRAM cases are silent no-ops.
> - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
>   decompression when request_decompress is set.
> - Handle fault-mode VMs by performing decompression synchronously during
>   the bind process, ensuring that the resolve is completed before the bind
>   finishes.
> 
> This schedules an in-place GPU resolve (xe_migrate_resolve) for
> decompression.
> 
> v3: (Matt)
>    - s/xe_bo_schedule_decompress/xe_bo_decompress
>    - skip the decrompress step if the BO isn't in VRAM
>    - start/size not required in xe_bo_schedule_decompress
>    - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
>      with respect to invalidation.
>    - Nits
> 
> v2:
>    - Move decompression work out of vm_bind ioctl. (Matt)
>    - Put that work in a small helper at the BO/migrate layer invoke it
>      from vma_lock_and_validate which already runs under drm_exec.
>    - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Hi Matt,
> Thank you for the review.
> Regarding multiple bool params in vma_lock_and_validate(),
> I will clean it in new patch.
> 
> -Nitin
> 
>  drivers/gpu/drm/xe/xe_bo.c       | 50 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |  2 ++
>  drivers/gpu/drm/xe/xe_vm.c       | 40 ++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  4 files changed, 83 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b6502081873..7438c01c1895 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3307,6 +3307,56 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> +/**
> + * xe_bo_decompress - schedule in-place decompress and install fence
> + * @bo:   buffer object (caller should hold drm_exec reservations for VM+BO)
> + * @vm:   VM containing the VMA range
> + *
> + * Schedules an in-place resolve via the migrate layer and installs the
> + * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
> + * Returns 0 on success, negative errno on error.
> + */
> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
> +	struct dma_fence *decomp_fence = NULL;
> +	int err = 0;
> +	struct ttm_operation_ctx op_ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = false,
> +		.gfp_retry_mayfail = true,

I think you want .interruptible = true, everything else false.

> +	};
> +
> +	/* Silently skip decompression for non-VRAM buffers */
> +	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type))
> +		return 0;
> +
> +	/* Notify before scheduling resolve */
> +	err = xe_bo_move_notify(bo, &op_ctx);

The downside of the resolve operation in preempt fence mode is we need
to interrupt hardware execution which is pretty expensive. We should
stress to the UMD teams if they want to use this feature it is highly
recommended to use page faults. 

> +	if (err)
> +		return err;
> +
> +	/* Reserve fence slot before scheduling */
> +	err = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +	if (err)
> +		return err;
> +
> +	/* Schedule the in-place decompression */
> +	decomp_fence = xe_migrate_resolve(tile->migrate,
> +					  bo, bo,
> +					  bo->ttm.resource, bo->ttm.resource,
> +					  false);

See my comments in previous patch about triming the argument list.

> +
> +	if (IS_ERR(decomp_fence))
> +		return PTR_ERR(decomp_fence);
> +
> +	/* Install kernel-usage fence */
> +	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(decomp_fence);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_bo_lock() - Lock the buffer object's dma_resv object
>   * @bo: The struct xe_bo whose lock is to be taken
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 353d607d301d..472c9de889c9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -308,6 +308,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
>  
> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm);
> +
>  static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>  {
>  	return PAGE_ALIGN(xe_bo_size(bo));
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 08bc55bd91d7..8bb2a3259d56 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2305,6 +2305,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			op->map.is_cpu_addr_mirror = flags &
>  				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> @@ -2859,7 +2860,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  }
>  
>  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> -				 bool res_evict, bool validate)
> +				 bool res_evict, bool validate, bool request_decompress)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -2872,6 +2873,12 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  			err = xe_bo_validate(bo, vm,
>  					     !xe_vm_in_preempt_fence_mode(vm) &&
>  					     res_evict, exec);
> +
> +		if (err)
> +			return err;
> +
> +		if (request_decompress)
> +			err = xe_bo_decompress(bo, vm);
>  	}
>  
>  	return err;
> @@ -2959,7 +2966,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			err = vma_lock_and_validate(exec, op->map.vma,
>  						    res_evict,
>  						    !xe_vm_in_fault_mode(vm) ||
> -						    op->map.immediate);
> +						    op->map.immediate,
> +						    op->map.request_decompress);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> @@ -2968,13 +2976,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.remap.unmap->va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && op->remap.prev)
>  			err = vma_lock_and_validate(exec, op->remap.prev,
> -						    res_evict, true);
> +						    res_evict, true, false);
>  		if (!err && op->remap.next)
>  			err = vma_lock_and_validate(exec, op->remap.next,
> -						    res_evict, true);
> +						    res_evict, true, false);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -2983,7 +2991,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
> @@ -2998,7 +3006,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> @@ -3306,7 +3314,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
> -	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>  
>  #ifdef TEST_VM_OPS_ERROR
>  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -3364,6 +3373,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  		bool is_cpu_addr_mirror = flags &
>  			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> +		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  		u16 pat_index = (*bind_ops)[i].pat_index;
>  		u16 coh_mode;
>  
> @@ -3398,7 +3408,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
>  						    is_cpu_addr_mirror)) ||
>  		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
> -				 (is_null || is_cpu_addr_mirror)) ||
> +				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
> +		    XE_IOCTL_DBG(xe, is_decompress &&
> +				 pat_index != xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) ||

There are several pat_idx entries that are not compressed—see
xe2_pat_table. I think what you’re aiming for is to call a helper
similar to xe_pat_index_get_coh_mode (perhaps
xe_pat_index_get_comp_en?), which checks XE2_COMP_EN for the pat_index.
If that function returns false, the IOCTL should be nacked.

Matt

>  		    XE_IOCTL_DBG(xe, !obj &&
>  				 op == DRM_XE_VM_BIND_OP_MAP &&
>  				 !is_null && !is_cpu_addr_mirror) ||
> @@ -3418,8 +3430,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> +		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> @@ -3434,6 +3446,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
> +
> +		if (is_decompress && (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
> +				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))) {
> +			err = -EOPNOTSUPP;
> +			goto free_bind_ops;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 413353e1c225..7d652d17b0dc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -357,6 +357,8 @@ struct xe_vma_op_map {
>  	bool dumpable;
>  	/** @invalidate: invalidate the VMA before bind */
>  	bool invalidate_on_bind;
> +	/** @request_decompress: schedule decompression for GPU map */
> +	bool request_decompress;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.25.1
> 
