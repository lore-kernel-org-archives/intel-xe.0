Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1584CCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 06:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA610E6A3;
	Wed, 24 Sep 2025 06:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tsewrd/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF38010E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 06:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758695585; x=1790231585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Iu7VqVrlfe1+EtHS1D4rpJT501ZnxI7Oin2FPrcsdek=;
 b=Tsewrd/EKDw4e9EkXhxehZMs7FKIYq1QcpSBQAS0ERIFS5/oGZSpKp5x
 nti43jklTFVo1ulbrRWGm8q7V/hijjdtvpgnkz85poLVfY5YQq2MLvw3i
 CsXmGfa9gQ0aY3CyX494czhal1otQkmya3BkcXSiPJG01BUMgKNHY5a6I
 skOsQj597JjmF99jQvecRe1pLyC8EWrhHSy3ec1o+4CordGJo+sgi/3KW
 8jN+8OxuV/6VAKWBBw8iSV58/dwVvSHqzIY/w1oLHuj3KjhXlKduLD328
 vSlDL6lUbhYGwphDO1i2BzHt0rjYByIlDRiO7d4q0YKrdGTstRqSiGLLs Q==;
X-CSE-ConnectionGUID: uWXWNYeVRf2d+esnMcG7hA==
X-CSE-MsgGUID: tNSpxQuSTVqmcqGiHAQnog==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72088582"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72088582"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:33:05 -0700
X-CSE-ConnectionGUID: b8h/IBgmT5aiNbfIk5nzgw==
X-CSE-MsgGUID: wzn5jCrgRrWmDCa+yaECnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177032194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 23:33:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 23 Sep 2025 23:33:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 23 Sep 2025 23:33:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 23:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CveuRJqs2AK+Wl11mnaHLNvDJDwLJ30GEz5njZZt2Ir0SrwTgr1ig93y/VwiFPE3eJXrdD7wryY1Hrk0zSti/yOfzZ498X/cGFZtTi2mQWcs5RVHY9kSSEHZiqDlVdRbQtDdw6ilzAqf9L8mZdN8pMWGXOqYrgt25CGOqsjyFOqrJXgr42W5jf7gq3UoVVN9gpamnzMdkqN1CLngZHvlkLsIXOo9BYsThMClwBKM4r0J8chEYEcqAkqpzmhbKagEjaQP/6m9dsAL8XQsjb/les2QVMwMCzuDzsy+RtxNy3vKWNkc4EoAtPRlk540R2Y3k+4eoFaS4TQiiIaBoXxtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtQ7MrcvglcF7pfwEtUyEGYpOIW7Sb27HyAChHqjsFU=;
 b=CrOoqKyFQA5mY/YT5ArWJVY/bJKi9aHxn0S9YkbJlbcvnAN3wNQzuhuSqeSqVWM53odyqoGxexL6b9Z37L8HU1gDx17k5/1Lz6eBkKwDoWJTclxpydxzcGmS+7Ubl3tkcJvX1yqGfOHYPNuShZpn5pWNeS44xea7ypTGxVm66xQeWcKRqjQH69UHZQXorQhMD4y4uu+niFNSrRlZSujB03DtvK44gBBJzx9IAiECJHkoNkkMzYSARAykm4lJU0hr53F3aOUFFx3mxIrq7qnv5ET8xpzEy4zjNNJCdGFzk4XNwpdzzlVkm30Nt0Hucs8tSMyP9FOQ1O2sUY6IIXhb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 06:33:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 06:33:01 +0000
Date: Tue, 23 Sep 2025 23:32:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 33/34] drm/xe/vf: Rebase CCS save/restore BB GGTT
 addresses
Message-ID: <aNOQmwNz1AN2vBXd@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-34-matthew.brost@intel.com>
 <5ff075e8-fb77-4f4d-bc03-9c06c99831c9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ff075e8-fb77-4f4d-bc03-9c06c99831c9@intel.com>
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 185f6452-43f9-470c-5f6e-08ddfb3435a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlpJK3FFajY3MkI5bmExbENPVUJ2andZb0xGTldiS0svNy9wLzN0OXF4dG1O?=
 =?utf-8?B?TC9QRkNzRHhsNHAwVkdFVXY2dnRQMmNMWFdwRnRPTkFmQ0hKSU12TENmenpv?=
 =?utf-8?B?SEQyb295L2t2N3VzTklWbE4wTlhGVzRuZXdHaUZhT0xxdTZxT21Fb2xkaUQ3?=
 =?utf-8?B?VmRHRXkxOGVSQ3B6ODE5V2dYc3dOZEpwYktudHY5K29nOHl1QmR0cmJnblY2?=
 =?utf-8?B?M3gydW1MQTFRMmJZRFNyZXQ2SGd4S3hkK0VWL0xKM0ZDNE9NN0JvcWlOZWdH?=
 =?utf-8?B?RTNvMEZsYzdRdzNCWlpCSmEyWGF3cW9MMEVuZ3RFUDJkaFMzSGoyck5pSVBF?=
 =?utf-8?B?M3JqM1hFK1hOZUpnV09rTE0wdWZUQ2t1MHRmcEdlQXBMT3VGcWNGZUdwQ1ow?=
 =?utf-8?B?aG11eGpyUG52REZKSVM4cVpROEQ5SkZlMjJ6M2ZxUThiZGRTVWQ4N2hFdGdi?=
 =?utf-8?B?NEVkZWZNV3pXQVdYSkVHWEZrZXcwaUFVTkJVYTNsbXh6MG5CY3NMRjhaWTNa?=
 =?utf-8?B?SnlCSDZ5VnJyOXNVN3dLRzdKbkQ4VjJZdEljZGRGc2R5NkRkREUwTVRjdmlM?=
 =?utf-8?B?RURKRXA5U3BIL0wxYzZGejRRSExtWG1pSFlqNHR2VzVlc0RBM1VsME9jU25t?=
 =?utf-8?B?TlAra2hEWTB2SXFBM0dIdS95ZlVEeFBsajNTQVF1bGNUdmx2Y2J2V2Z2TjE1?=
 =?utf-8?B?VXAzaFQrdERIbiticVVxeXBMYld2b3RxNkJOUHlmZXlxenBjVXM4aVQzRFJR?=
 =?utf-8?B?M2VUNjNZbUt2aTY3N2ZwbXhuSkEzVEhzNWs3MDV2eUFrNk9jV01CVWxOMjll?=
 =?utf-8?B?cHd2Y2xTUWVpZzBVYWt6QXIwL241YU1LVG9HMFlsUmliSW5scWhiZXJFRkZy?=
 =?utf-8?B?dDlhZGNaYnhmYzRrR3k2NjZMeUxYMmlPcUF1WVc5Rm5ZQnR6UWNlajM5SXJo?=
 =?utf-8?B?Ti9ZY3NmTStqYjVsdjdLbVBKOTB1VGNIRGFLcUIwTm45MitIMDV5Z1RHY3Zm?=
 =?utf-8?B?cG1HOGJxbE9sSXJiSmdBdElEYzJELzhrT2dzanJFbjVFRGYwajl3a2tJSVNn?=
 =?utf-8?B?dFYyOFZjRko5NFRNODU2K2MrT1k5S3JYUUwyU0tVMDRRZTQ4d21Db04wM0pW?=
 =?utf-8?B?RmRVOG5MVXZlM1loQVdiemJFVWtrc2tKNFlZeUFRajFzamJoWVFhY3ZWbUhy?=
 =?utf-8?B?OGM4RUsvemFFaHlTYkt5WENDeDJ0OTFmVDMvQjRsd1R4akVSdFFra0ZRbWxV?=
 =?utf-8?B?empHek54L2ZuRUhBMkF6aWUxTC90SGoyRVFXWlErU3B4NmVqeGpLVXh0Y2lZ?=
 =?utf-8?B?TkxTY2ZFZE5yVVo1bm85RmlDTXRKc05WV05RS0oybDBsLzZHVERnRlpjMktM?=
 =?utf-8?B?VDk2YVd0eklTQ0JSemtONW1VZFV2aS9GRkY3aVc4TnRpb0h2bHNIOEtwMUNy?=
 =?utf-8?B?N0I2VFhFT2xJQlkyYnB1WjRoeFY4MXlLTGYvUVo4cFNUT1hIZndvL2FTbzE2?=
 =?utf-8?B?ZEpVczRVVXJZL0M5Tm43dEI0TERmMjQ2em9Uc1g4MFRSZDd1djdjS09XNzB2?=
 =?utf-8?B?WVhNWi80K0tkTjdnOTBIaGdzZVNFSldUc3VCcGc4WEVpMU9oT1IybTFGR3Jm?=
 =?utf-8?B?WUw4RnVTQkVFT1pYcHFTd2hBZWNmTlg5ZlJ0QmZDdXlLMlVjOUFxQTZrZVB3?=
 =?utf-8?B?VkdETmZSd1czekh5RjlUOUJHY1FvRUZtcktFbEhWYkt5aXNlaFphSndqUlAy?=
 =?utf-8?B?b3FGaXlxcXBlSGRGUkJoWkNhZDNnVWRTeEFSSjR5dGRkalE2U3YxSEM0Und3?=
 =?utf-8?B?cVNXWHpUcnVBQmU3UlZMTTlSZ29BNEZ5RldCaVBNKzFaK01hTnZuMVlTU2Fk?=
 =?utf-8?B?Z3RMTHVndFdWWmVtZUJhYmwrRWpjejU2dWt3YklXS3ZTMHEyd2ZOY3dVZ2Ns?=
 =?utf-8?Q?N/GtZBzkztc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXE4TW83VE5heHd3Umk2QVpLVVlMZFhUNDdzeFFURi9KUTJ3TS9pTGdFZU5a?=
 =?utf-8?B?RWxGMk1MMDh0ZDNYcSsxMmczTmlwcjJ0TU5BdWZ2Y1RoYXc1akxOcHpPbjFu?=
 =?utf-8?B?aFhMVW5nUVEvN2s5a1J4OGlONEhzQ2t5bzZ2dVVEa2FYd0FtZ2N1cGpNY1Bv?=
 =?utf-8?B?RHpHR0tIRnBOWEhiR3pHaW1LOWFLZ0ZERll2Q0NGUUxweEtXS1pUajRnZ1E3?=
 =?utf-8?B?ZFIzeUJBcE1CWmhTb1VienJIblZwU09XWXBCbzB5em1VQjN5dXI3aW9ZWjky?=
 =?utf-8?B?WWJQRkJodWQ0eFFPaXI3SEtYU0kvNTlNNEQvbUVWSVBic0JRU2FvUEpGYTY4?=
 =?utf-8?B?MXdyZkVNOE1vNDdna3BNZm1QUmFkd21XTEVDdCtMSjlGVUFvZStiOEJUbjBV?=
 =?utf-8?B?MzZBUVlIa2pXWXR3QW1xZnErZFpxdWlTTWw4ZTdON0VubHVBY3RCKytjdy9G?=
 =?utf-8?B?MnNPRE44U244bHllK211WDR3SjlidHVWOWRyR2lWa0szM3Rsa2dEYTEzeEVT?=
 =?utf-8?B?Y2lMNkFaNnI2ZGYrYmRpVm1jc3ltM3FOdE0yQWtCaE5IcW9yUVhRQjhUZTRr?=
 =?utf-8?B?RmZXMFhWMVJlbFJnSDBWWWkrazYzWDRMbzdZVjErTlpYcG9kQTVFczlFN3Aw?=
 =?utf-8?B?M0g5T3N2V01kdTlodXV3ekdTSU5EVE03QnhoY1RYNU8xNzNLb3dFVnYvSmlO?=
 =?utf-8?B?UjRRWGlFdkdsUHpsbGpxdU5yaE1kWG5VMTNtbjk3ZHBSQjdSSmxzdVVEdjUz?=
 =?utf-8?B?bGtlVUtNSDR6eWlwY3NhNkhzT1cxN1R3Zm9vYk9yN1g2R2tGWkg2a24wVk8v?=
 =?utf-8?B?dWZCVzI2dVZ0aU9PYjhBQ3c0RGhCMUh2Ylh3TlZjVXZnRkNNYW55NndDWUJt?=
 =?utf-8?B?MnFaWTdIWjlWb0ZvQkNGZXhpaytxdjdxU2ZEQkFRaG90dFhnMXcyWXFOVFBn?=
 =?utf-8?B?WFFXMnhpU0ExVEwxUTdTK1RZOUk1c3dPWjhYdzBEL2FoS1pZQUw2UVhPbXVN?=
 =?utf-8?B?M0Z0VVZpZUVmbnVMWDVoQ2lOMlFmKzh6WUNBZm8xNS8rUGlYSFZ5bVowU3Zm?=
 =?utf-8?B?VkJyNkEyQ2FRTkZtckRZNzhCeXVZbzRoWEZ2Uk1nUVRTeCtUclBTZ1pFSjV6?=
 =?utf-8?B?Y0pSVW56WGJEcGpnMGVMajV2d2k0S3RFV1EweTVGU2ZxVlJyeU55cVRrKzc4?=
 =?utf-8?B?RUw0WVJPMjhKY0Vudm5CenVhdnR5Sys5dmVwRGpJUWZIUTdIVmk0ODFVTGtx?=
 =?utf-8?B?bEdQTk1IWTF0ZFRJUzV0L25keUN4S0wxNmFTMEQ2TzE5VnVZYS9wMUt6ajU1?=
 =?utf-8?B?bS9hb1lFSXkxVFZhcCtxTThTTjlPUGdiWEFQNlJmSWlVSU1FTVV3SFZSZEdT?=
 =?utf-8?B?M1hvRm9RNVphYzdnOTAyV0pUT2ZMMzJOcUY5aG1zUEczdDdEc1B4VjRGR1Mr?=
 =?utf-8?B?bkNNSFM4R0pJT0s4NGl0UmIzeWtOTjZwRjZ6c2hBWldocGVmdW9VVnVIY1RF?=
 =?utf-8?B?amdqeG5HNEVreDR4T21FNVBFTDNXNk12QUNFVHlSRWFUdjR2ekdGRHBQTzl0?=
 =?utf-8?B?blAyZXNmc2VHNmowM09LT2w5NFBLcEZqcGRLOXdBR2U2amZIZG1mQUtaQXdD?=
 =?utf-8?B?MlJ3eGZpdGg2c0szNkxxRFB5T0t1OVBlSUQrNklSYTRWQnJQSzkwREZiRHho?=
 =?utf-8?B?N2JpWnh3amc3dGtDS1VpZ21GQVpJOUJTNU9yY25HSWl6WVgxZW5EY1VVTDlE?=
 =?utf-8?B?NDViN2F1MTdJTCt5aFVwd3QxY3IzaTd1aVRxU2hRUTliRGZnRCtxRTRsYXdS?=
 =?utf-8?B?dmsxSzUydjRkMklHaUhTWFZTbnZ5OVo2OTJzYmVTRW8rc0NlUGMzQzJIYmZU?=
 =?utf-8?B?VW4rUzV2NXp1MWhTS0ptcFcraVpZNmluQkVySytxTXJaempJUVdJU1ZSRGVj?=
 =?utf-8?B?UFV4bVdTYVNab0paaGpiUlFDSCs0K0ZqRWZYNHZ3M0UzT28vVFk1a1NLN3R3?=
 =?utf-8?B?Um1sNXZPZjcxNG9qdnZYYzRjenJQQzlPS1RJQlhaVkVwdUZyTEg1bGVqNEE3?=
 =?utf-8?B?TVpPbTl2ODJoODFBajhlT1hUNEQwRXZyem5WTm1pWlZNUWtVcFFTT0xzSVor?=
 =?utf-8?B?WFZLbnJ1TnBzMVU2OXZxcGxXWkU5eGhWdkhKMEFKalFkZzZvTmcxYjVvM1Rq?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 185f6452-43f9-470c-5f6e-08ddfb3435a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 06:33:01.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w47VDkCIFKVGjxM6Hd9ofTDE8iL2XHUVzjFwlZ+dW6ZPCQXjKCsecPxCZys6ywdM5vYFjBvcZezi/nTKsDA4Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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

On Wed, Sep 24, 2025 at 09:34:25AM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 24-09-2025 06:46, Matthew Brost wrote:
> > Rebase the CCS save/restore BB's GGTT addresses during VF post-migration
> > recovery by setting the software ring tail to zero, the LRC ring head to
> > zero, and rewriting the jump-to-BB instructions.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c  |  4 ++++
> >   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 24 ++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
> >   3 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 46d1d1fa91b2..d8d96dd76c73 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -34,6 +34,7 @@
> >   #include "xe_pm.h"
> >   #include "xe_sriov.h"
> >   #include "xe_sriov_vf.h"
> > +#include "xe_sriov_vf_ccs.h"
> >   #include "xe_tile_sriov_vf.h"
> >   #include "xe_tlb_inval.h"
> >   #include "xe_uc_fw.h"
> > @@ -1228,6 +1229,9 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> >   	if (err)
> >   		return err;
> > +	if (xe_gt_is_main_type(gt))
> > +		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
> > +
> >   	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> >   	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> >   	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index 8dec616c37c9..bffad45e655f 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -175,6 +175,15 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
> >   	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> >   	u32 dw[10], i = 0;
> > +	/*
> > +	 * XXX: Save/restore fixes — for some reason, the GuC only accepts the
> > +	 * save/restore context if the LRC head pointer is zero. This is evident
> > +	 * from repeated VF migrations failing when the LRC head pointer is
> > +	 * non-zero.
> > +	 */
> > +	lrc->ring.tail = 0;
> > +	xe_lrc_set_ring_head(lrc, 0);
> > +
> On lrc_init(), the ring may be pre-populated with some GPU instructions.
> Should not we keep them as it is? Making tail=0 will overwrite the
> pre-populated GPU instructions (May be some WAs??).
> -Satya.>   	dw[i++] = MI_ARB_ON_OFF | MI_ARB_ENABLE;

I’ve thought about that. W/A should be applied through a W/A BB
mechanism, not via the ring. If I recall correctly, the original code
for programming instructions in the ring came from Faith’s original Xe
PoC code from over four years ago, which we’ve never really revisited.

In my opinion, that code should be removed.

I could include the removal in this series, but I’d prefer not to expand
its scope. We can address it in a follow-up. I also don’t want this
series to grow in complexity by retaining what is almost certainly
useless code.

Matt

> >   	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
> >   	dw[i++] = lower_32_bits(addr);
> > @@ -186,6 +195,21 @@ static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
> >   	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> >   }
> > +void xe_sriov_vf_ccs_rebase(struct xe_device *xe)
> > +{
> > +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +
> > +	if (!IS_VF_CCS_READY(xe))
> > +		return;
> > +
> > +	for_each_ccs_rw_ctx(ctx_id) {
> > +		struct xe_sriov_vf_ccs_ctx *ctx =
> > +			&xe->sriov.vf.ccs.contexts[ctx_id];
> > +
> > +		ccs_rw_update_ring(ctx);
> > +	}
> > +}
> > +
> >   static int register_save_restore_context(struct xe_sriov_vf_ccs_ctx *ctx)
> >   {
> >   	int ctx_type;
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > index 0745c0ff0228..f8ca6efce9ee 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > @@ -18,6 +18,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe);
> >   int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> >   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> >   int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
> > +void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
> >   void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
> >   static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
> 
