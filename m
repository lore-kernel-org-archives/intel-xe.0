Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6320CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 08:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC8E10E0A1;
	Sun,  5 Oct 2025 08:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDQLJmXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAA110E0A1
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759651443; x=1791187443;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fI/zjs0LbprTdh7u3MDPMgPrrWY5X+QjhzRRnJjZF+4=;
 b=CDQLJmXLTYjAQ7uG0Ur6HW8th7FT485+pfuMk+HLUHJE1+3Njy/xtiBU
 hlG01aI8sa5hwZcm4NCwP2RVQ0DjWTrNM+5uMS535TnxGnpABTgV21mOS
 GUXoKhjhRmNxNPfVJs6Y7rCPa5jNJI81NfGTVJWq92lfoyX5JB7NeU+Tq
 BAQk2G5RBgMuspl/8iOI8N4ghK8Vr32DOOg+RPUJP/BzfjK7bMEkIY2as
 RUlXVnqxBPFlwi1kcQRqqUEm3p1R7dBNx/yeydDSLSHlDME7eRcYJTUMn
 ugfcRdaMc4ockYDVyya6JbHONx4Bkv/DWmzuNG2/yi/C/r+GWaN43uZFd Q==;
X-CSE-ConnectionGUID: UeT0tAyuRuCHx9nx711JAQ==
X-CSE-MsgGUID: 0vzl377DRY27FajKE/U+/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="84485632"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="84485632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 01:04:03 -0700
X-CSE-ConnectionGUID: 3pttVpXeRCKna5RZdMZPhw==
X-CSE-MsgGUID: p3XDf8rORdS7VTk6upHQsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="178914088"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 01:04:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 01:04:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 5 Oct 2025 01:04:02 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 01:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGKBPvuCJKjirPVs7tS2NZlUBlcxjKM99KUg6R6xlguOIl9mdjls8avyUbC/I9G4hiFYWEHc/y24G1KY1gY+z2XEAMwGAfyLPw22NAbpOGjmkcfHEFI9SzAjk8GCfvAjGWVDeY6mLyfSw14cSwgx8eSXrY90zFOLdXoiMNFVWogfkVmeFZlr+4cDqWVbQkKo3y556N2+RF7EiIhFGzBL686m4SeK6wmwXMetgXepsqRCx2kcK2Y9ZNZJQG8Ve2abQeM2qghVFbgFUwZK9XUKyZnYYQBXAdbW7Fx0yY766x+DcrczadFAaXrwaWcxLaTgPf2epdzdWOejH9XRNRbSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvGAMmEBaRArQLwDBDoEQUXe/OV8KBBvtpWKTFYqvOU=;
 b=rA3BDR01vDiNS8sg1UT3q6AE9XHMy1bxuqNSep/cDLuwe+MYOXxOTDh2zdsQ8Yd34R7M+V+fZs8tB6PNg6AtP8i//xILuYtoOt47jOuhQVo9YOii9YPCNXVtsa3CllhBRayBOqAO2psnpPMLTWmUh+NfYD35V2l+fuP1vCFo2LQV0ba4+D4T9Ara9dN6Es0ePiGBfREFlGiLrA0oj2XLJcnGPWEJCLmQ0b9RHlFMUCJ5ZOgQi7bIaD6QqAwZUGj67uPVU7NY1a7w0S4uOKiTxARP5XARi4dY6LCYB7Q74kf+SJ2vkh5EZzcqrqQ4F/VXSjrOrvo1e4gG8UMDKi/IcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 08:03:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 08:03:52 +0000
Date: Sun, 5 Oct 2025 01:03:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 27/34] drm/xe: Move queue init before LRC creation
Message-ID: <aOImZcxZRIdmUl8S@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-28-matthew.brost@intel.com>
 <f02466e8-cf05-4b16-a55b-e759b3236b05@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f02466e8-cf05-4b16-a55b-e759b3236b05@intel.com>
X-ClientProxiedBy: MW4PR04CA0301.namprd04.prod.outlook.com
 (2603:10b6:303:82::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abcff25-bd08-47d5-03c3-08de03e5b8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sml3c3BPdW13a2dVTVd3czhuWDNkUWd5OVUyWWRQK1VDS1dPc0J3WjVqUEpL?=
 =?utf-8?B?MHVlem9NZDE0NjlRem5DdmFXZWdXcXZoTFpRT0FrcmVOWVVjRzIzZ3IwVGow?=
 =?utf-8?B?a2F0dzcxTi8wbllBRktPdnhQd3BiNWxhTTY5MkJsUld6b29SQXlGd3E5WjZZ?=
 =?utf-8?B?ZUJoZmFzMUdGQXR0bE4xNm5BOUtrczhqdDkxcU5DWllxLzFMekFSYXJpVkJL?=
 =?utf-8?B?NkRWSncxVzJNWVJJK1BiTE5PT1ArUG9tblhncmc1YjhkOXl5S3g4MHJrSitl?=
 =?utf-8?B?bzhoTFIrZWx5NVVCTGxYSURIcEZQYWJmTlJ3WkFMSENiVG9uUlgyRVQxSDE4?=
 =?utf-8?B?eEk1a1VJdUFGamRGSW9KK1VvamUxT0xyYis4endmSyt6cHgvZ0R2eU1BUFhz?=
 =?utf-8?B?VW8xMmEwMmY0RWlENUJKaTRFN25Yc1UxdzBCZnFMOS9oRk5iSXRhOTFJRWE0?=
 =?utf-8?B?QkNIYms2Ynd3cnpQL2NOZUJ5TTMzenFVenJHM0Q2UWRsdEFJSU81VzFrT2c0?=
 =?utf-8?B?bU9TQU5Pai92ZTNpNTc2aUFkM3FwVmtEY0Mzd1pkRFlzWWpmNi90SXNKQW5P?=
 =?utf-8?B?cXl0cG9lc3hQbG9TUW4rV01jS2MwY0JZNE5tcTNOaEs1Mm1rY0dzYXI4TWg5?=
 =?utf-8?B?ZEZMcUpvZFBZNkFBbzd1YjJsQ3kwU3hzUUJsZUdPNTVjb2ZNYWNpSG5RMjBy?=
 =?utf-8?B?VEFvcTRGRjU5N2NqU3B6eVRNZlhCbVducStRWFB4RFhnMHZCR0hpWGQ2VU9O?=
 =?utf-8?B?VkVTVVBmTk9VT3lDeUlCNEVJRjU1ZVhBM2MvNWxnUzdOTUZmaWNWdHFVUVZH?=
 =?utf-8?B?Y2lRMy9qNkJHa2l5YjNESjdqODR4TUpDUWUxMS9sYnAwZ2Zaa3JiN0dCODdI?=
 =?utf-8?B?U0plREhCai9EL0hJam5ZR3p5VG9xZjN2cTFPdFhXOUVxZFkzd0FDNFRUTDVl?=
 =?utf-8?B?OHlhS1ZyMDNyMDdrTkp2MkM1ZTUrMnBkWlVqUGQ5aWFVaFp0RzNYUkl1KzJr?=
 =?utf-8?B?T3R1Wk5hYmNHWklraHdZb1kxZmhxT0w2bzZnalhhUHRydG1zRTQrM2FkMHMr?=
 =?utf-8?B?eG9xRmdENkczSXVXSWc1emErTmFuWTZtMUszdHRXdXcweUVRZWI4eWtnZWFD?=
 =?utf-8?B?VUMxYlpTUmxDc3h1bW1qa3RYcDdHYTYzdmtiajNKTGZENnZNWG8randFRjFN?=
 =?utf-8?B?M0pWbVg1R1Q0eTdIb1lpZW43UTdCQjNtR0FLT3Z2YTZpNjY4c0VPWnBpTFJl?=
 =?utf-8?B?VDNCR2tMZm9hdVV3RFJDSFRoSVlrTnI5cjd1YkVPZVdORnRtRUQxSHQ3d3g2?=
 =?utf-8?B?bnJ1OG9GY0hIZXN4dTN4bXRvczR3VTRoOVlNYzl0VDNlUHJDK1BWempKQVJy?=
 =?utf-8?B?aGpJUG5kY3NrUHRlS1FraG5GTTdGTE5UakV0anBHVExyOVJxN01tY2JaRXU1?=
 =?utf-8?B?WVpkUjlpR3NpYm5PQnJ1bmtaZER5K0Y1SlJnZHpUaUtYM1QyeWlpL1AvQUVY?=
 =?utf-8?B?R3o3Q0ZWbzdJeG8rc25GSVV4ckpXdHU1MGdXaTRWN3l0bUVPTmhaL20vL2pJ?=
 =?utf-8?B?TG9wdDNCV3hIVjI1cE1aYnJoT2VwNnIwKzRTQSs3VzFOcDRWVlNoV3NmZk9p?=
 =?utf-8?B?Mzh4WEJBWXFVVWQrZW52Tm9PNnFJY0tnS1QzZUVaaUwyalpCN0ViVWhZc3g0?=
 =?utf-8?B?NFJtQkZZZjN2V0FwWGdSb1FVeXIrSGdZWldPRmp3RGsrVEdCSjR3THRpc0Zu?=
 =?utf-8?B?Y0VLTlN3aElsLzZOT2ZwMEhmczBtSEpQeWp4d01nWSsvaU1zcEpJOWRoazlS?=
 =?utf-8?B?VnlKYWpCSkZUS0NCRkE4MTQ1UzFZa2F4b2dpZy90TE1VOTM3dGNORmd2MzdX?=
 =?utf-8?B?UksxTlFwMlZnTzZON0xWZVJVQm16SnAyYnZmVHlaSDRMdUdYQWVabENBVUtU?=
 =?utf-8?Q?IoMDgMP63rcxUhBI6ydukH3Nha+knuLl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2U5aDgzY1RIYmQyd0M4alhUdjc2UlVkRzdnRUtWQThJSjU0em9DVzMwYmRH?=
 =?utf-8?B?VGhKaEpGZDZteVlualFGK1JFeTRsVlhLUkVzcEsxUll4MFB6VkRhYVJBL085?=
 =?utf-8?B?VmNUQlhadUJiNEtYNWxvR004ekhxbWd2S1pKbzNwZFVmOEhmWkRhbFRzR1BZ?=
 =?utf-8?B?Z29kblFTaU52OFJTNHBwT1YxU3NWb2cyVlNpUWIwMFR0aC9aNHpIS3NzSzBR?=
 =?utf-8?B?YmtGSHlrbFVQWDRHS1pycmduK0d6djVHMlZEa2VOQTR1dGovNy8ycERDcU95?=
 =?utf-8?B?U0xycTk1eWtiZGVwUXFNL0R4cXRKTXZIN1VzbnQ0RFdZQ3Y1SjVYeXdOYU9C?=
 =?utf-8?B?T3FMa0hYSlVzcUNPNHJNek1VMHp2WVVxbm5ZZ0tqZ0FWVUJ5T1BkMy8xeFlj?=
 =?utf-8?B?OEs5eUVFRHYyeENiUE5SVE93dXY5N2h0WHkrK3dOZ1M3MlJ2eDJUeEF1NXBN?=
 =?utf-8?B?dWlVU1BhTWUvYU8wN0dESkhsNXoxRDhlWEhoRWhoSGNXWFQxWGJZeFY0YllQ?=
 =?utf-8?B?UG5sWHkxVWFTK3FlMm41UEtaSzYwcVRHZCt1d3pZYjNUZGo1RWw4SXgzUncv?=
 =?utf-8?B?NmNHWnhRMTNObGJoaVM2c0JiMThVaUtxUDI3WkhJQjNvSm4xM2Y5NXdPc2Yx?=
 =?utf-8?B?RTJmU1hBQU4wZHNUeitHdGNaeXpIQmVnTWRpTW5MejN5cTFOSm4vMXphQXdl?=
 =?utf-8?B?Mm92bHVkY3FwTUFsOUhPY0NsWlpHQTBQVWZ3cElDeHBjOUdZZDl4NGFFUm9R?=
 =?utf-8?B?TmIxZU1zaGhPdEhGQW54UG9zSVM2WnovZ3VnRXFscVhtYU9vUzR1Mi9HZEEw?=
 =?utf-8?B?NGJYK2crdktrOWd2YVRZWHRzbzlBOU5WNTV2RHNwZUtSZ2xsbll0VW93dUZh?=
 =?utf-8?B?MmcwTE9iTytFOGtGVDQyamVHbFpYNUZmRHNjNERWY2pyclY5dFE1WUduUlR5?=
 =?utf-8?B?MGZyMDhxVEUzekpQZUJwSUluTUYwSStLR2U5LzFHZm5wZXQ3U3dHWkdzd2kv?=
 =?utf-8?B?U0dkUnRFUjV5UFo5S2g3cmRycWphcGZETStnQkxodCtjUjljZXFMQUpPdlBC?=
 =?utf-8?B?QUJWYTZvQzh5b1d6MEhydlV4SmE1VFBsdVRtdDU4aXpDTmV1QS85ZVhyTnQ0?=
 =?utf-8?B?ZmJKNDZobVBmM3JZa0FCeTZkbVdTbmFpVkdLSzdaMU1YeU9ER3FITkdHbDZl?=
 =?utf-8?B?UGw3RFQ2K2xzcGV2VmRQSXpnTDB2Njk1eTFieVcrVGNTS3JxM0NKQnZPdnFn?=
 =?utf-8?B?dHk1Mml2YTE3c1JjWC8zalRRZTdHRDJMWVdPczJrLzdYVE9MOHBES1NTb09K?=
 =?utf-8?B?RDUyb0VFOGJzaitJb2ZyMXJkOUFMcHovZEZuZEJ2VnVnMk1OZzFjRm9nRk5F?=
 =?utf-8?B?bVJubTVuVWxvNXlMcDZGV0hNZmVkbkpBQ0ozRGdTRVVEY005eDRpbDk1aWxz?=
 =?utf-8?B?NTlsOHdoNGJnclNSeExlVzN3eVFPRTBIL0w1d0pzOVlURzlyZzJlR3BaMUV3?=
 =?utf-8?B?MTh3SzQ3SkZ4d25JVzV1cjJBazlkQkN0N3pzZHhaNHZkcis1d2FlRU9WNGcw?=
 =?utf-8?B?SW9CbVIzWFlsamE4YWp2eDV4STFzVUVaZUQweHpZczNPUVcyZElCS3crK2U3?=
 =?utf-8?B?VkV2a3dVTGF4Y0pQWUY4NDZoS1N4NThCYjY1K3hIcFVkSXl0SFhWaTJ6RGNZ?=
 =?utf-8?B?MldlNFNmWnFMWHdrUnJ1TFBHOTZmRzcvVmtUVG9xakJhaHdrTWdkSFY4WGhX?=
 =?utf-8?B?YklqbWtDd1dVcjhmbXRyQ29xWU1YT0Nwc05lYzJWNk9qQnhxVGlrTEx2VlFi?=
 =?utf-8?B?NEJLL2pXQzFuSEhSdE9mWi8zSmx2WGlITWc2T1VQbkhJRUV5bjVhaG9HU3ph?=
 =?utf-8?B?M1JOU0RtaUpEeDI0RHRDWGdqQTNwc3hPY3kzZUMvRDI5WGZLM1ViYkNmbk5p?=
 =?utf-8?B?dkJBVUl1bThsN3M2aDE2T0FOQzVxaHBLNUNQUklnN3BxQU9yb0tZZkVrY1d6?=
 =?utf-8?B?c0d2ZTNsM1dsQlluUGFubUx3NVFoQWdoL2h4S2NCbGkrcjNOZFpGOGRBb3ox?=
 =?utf-8?B?OVBidERsRGozbFI1bFZtaDQzTVRSVHFLU0RJTmo2aXZBZ0pqMFNWYlBpek4y?=
 =?utf-8?B?dXNMQnZoM205ZDRKNTlQRHUxejlDci9qZlRpdGo5RnFNRXVkUjFGYTRpb3A4?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abcff25-bd08-47d5-03c3-08de03e5b8fa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 08:03:52.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwGgZlzGjIjCJg4gzHL2OKh4oaMZYGXXI0e4wIg/HRFa64cS9SAN7xz+mxTjN00j6sN0hHVRpqZKKeIrJMPwCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
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

On Fri, Oct 03, 2025 at 03:25:19PM +0200, Lis, Tomasz wrote:
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > A queue must be in the submission backend's tracking state before the
> > LRC is created to avoid a race condition where the LRC's GGTT addresses
> > are not properly fixed up during VF post-migration recovery.
> > 
> > Move the queue initialization—which adds the queue to the submission
> > backend's tracking state—before LRC creation.
> > 
> > v2:
> >   - Wait on VF GGTT fixes before creating LRC (testing)
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
> >   drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
> >   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
> >   drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
> >   drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
> >   7 files changed, 90 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 81f707d2c388..3db8e64d9d13 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -15,6 +15,7 @@
> >   #include "xe_dep_scheduler.h"
> >   #include "xe_device.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_sriov_vf.h"
> >   #include "xe_hw_engine_class_sysfs.h"
> >   #include "xe_hw_engine_group.h"
> >   #include "xe_hw_fence.h"
> > @@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> >   			flags |= XE_LRC_CREATE_RUNALONE;
> >   	}
> > +	err = q->ops->init(q);
> > +	if (err)
> > +		return err;
> > +
> > +	/*
> > +	 * This must occur after q->ops->init to avoid race conditions during VF
> > +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> > +	 * depend on the queue being present in the backend tracking structure.
> > +	 *
> > +	 * In addition to above, we must wait on inflight GGTT changes to
> > +	 * avoid writing out stale values here.
> 
> This paragraph needs expansion. Maybe:
> 
> ```
> 
> In addition to above, we must wait on inflight GGTT changes to avoid writing
> out stale values here. Such wait provides a solid solution (without a race)
> only if the function can detect migration instantly from the moment vCPU
> resumes execution.
> 
> ```
> 
> > +	 */
> > +	xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> >   	for (i = 0; i < q->width; ++i) {
> > -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> > -		if (IS_ERR(q->lrc[i])) {
> > -			err = PTR_ERR(q->lrc[i]);
> > +		struct xe_lrc *lrc;
> > +
> > +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> > +				    q->msix_vec, flags);
> 
> Previous discussion still valid:
> 
> ---
> 
> > > If migration happened at this place, it is still possible to create a
> > > context with wrong GGTT references in the one LRC which was already filled
> > > but not integrated into the queue yet.
> > > 
> > > I don't think we can avoid races without a lock.
> > > 
> > > -Tomasz
> 
> > There might be a small race here, let me think about this. I will say
> > this change xe_exec_threads --r threads-many-queues though. Locking is
> > definitely not the way solve this though - reclaim rules are in play
> > here which make locking difficult and convoluted cross layer locks will
> > always get nacked by myself and others.
> > 
> > Matt
> 
> Ok, if you can find a lockless solution again, that would be beneficial.
> 

I thought about this part, very small race.

 - A VF is creating a queue and passes xe_gt_sriov_vf_wait_valid_ggtt()
 - vCPUs halt
 - vCPUS unhalt
 - The original VF thread programs in bad GGTT addresses before fixup,
   iterrupted before WRITE_ONCE which makes LRC available for fixup
 - VF post migration thread fixes GGTTs
 - The original VF thread completes WRITE_ONCE for LRC missing the fixup
   window.

A large lock doesn't work here as xe_lrc_create allocates memory and the
VF post migration thread is the path of reclaim, that could invert and
deadlock.

I think the solution is:

 - We always blindly fixup all GGTT addresses on every LRC in a VF upon
   GuC context registration.

IMO this can be done in follow up but before feature enablement. The
odds of hitting this race is basically impossible given the window is
insanely small. I've run xe_exec_threads --r threads-many-queues 100s of
times without it failing on the current code base so IMO this is code is
stable enough for initial merge.

I suggest we open a Jira so this follow up doesn't get lost.

Matt

> -Tomasz
> ---
> 
> > +		if (IS_ERR(lrc)) {
> > +			err = PTR_ERR(lrc);
> >   			goto err_lrc;
> >   		}
> > -	}
> > -	err = q->ops->init(q);
> > -	if (err)
> > -		goto err_lrc;
> > +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> > +		WRITE_ONCE(q->lrc[i], lrc);
> > +	}
> >   	return 0;
> > @@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
> >   	int err = 0;
> >   	for (i = 0; i < q->width; ++i) {
> > -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> > -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> > -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> > +		struct xe_lrc *lrc;
> > +
> > +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> > +		lrc = READ_ONCE(q->lrc[i]);
> > +		if (!lrc)
> > +			continue;
> > +
> > +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> > +		xe_lrc_update_hwctx_regs_with_address(lrc);
> > +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> >   		if (err)
> >   			break;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index f83d421ac9d3..769d05517f93 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
> >   	const struct drm_sched_init_args args = {
> >   		.ops = &drm_sched_ops,
> >   		.num_rqs = 1,
> > -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> > +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
> >   		.hang_limit = XE_SCHED_HANG_LIMIT,
> >   		.timeout = XE_SCHED_JOB_TIMEOUT,
> >   		.name = q->hwe->name,
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index e1af5f9084ea..49b68a4a1f2b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -480,6 +480,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >   				 shift, config->ggtt_base);
> >   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> >   	}
> > +
> > +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> > +	smp_wmb();	/* Ensure above write visible before wake */
> > +	wake_up_all(&gt->sriov.vf.migration.wq);
> > +
> >   out:
> >   	mutex_unlock(&ggtt->lock);
> >   	return err;
> > @@ -743,7 +748,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >   	    !gt->sriov.vf.migration.recovery_teardown) {
> >   		gt->sriov.vf.migration.recovery_queued = true;
> >   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > -		smp_wmb();	/* Ensure above write visable before wake */
> > +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> > +		smp_wmb();	/* Ensure above writes visable before wake */
> >   		wake_up_all(&gt->uc.guc.ct.wq);
> > @@ -1262,6 +1268,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
> >   	gt->sriov.vf.migration.scratch = buf;
> >   	spin_lock_init(&gt->sriov.vf.migration.lock);
> >   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> > +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
> >   	return 0;
> >   }
> > @@ -1305,3 +1312,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> >   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> >   }
> > +
> > +static bool vf_valid_ggtt(struct xe_gt *gt)
> > +{
> > +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	if (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> > +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> > + * @gt: the &xe_gt
> > + */
> > +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> > +{
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> > +		return;
> > +
> > +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> > +					       vf_valid_ggtt(gt),
> > +					       HZ * 5);
> > +	XE_WARN_ON(!ret);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index b125090c9f3d..3b9aaa8d3b85 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
> >   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> >   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> > +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index c1bd6fdd9ab1..f0bc45a782a4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -8,6 +8,7 @@
> >   #include <linux/rwsem.h>
> >   #include <linux/types.h>
> > +#include <linux/wait.h>
> >   #include <linux/workqueue.h>
> >   #include "xe_uc_fw_types.h"
> > @@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
> >   	struct work_struct worker;
> >   	/** @lock: Protects recovery_queued, teardown */
> >   	spinlock_t lock;
> > +	/** @wq: wait queue for migration fixes */
> > +	wait_queue_head_t wq;
> >   	/** @scratch: Scratch memory for VF recovery */
> >   	void *scratch;
> >   	/** @recovery_teardown: VF post migration recovery is being torn down */
> > @@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
> >   	bool recovery_queued;
> >   	/** @recovery_inprogress: VF post migration recovery in progress */
> >   	bool recovery_inprogress;
> > +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> > +	bool ggtt_need_fixes;
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 497a736c23c3..7fe3fb07e35e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> >   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> >   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> > -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> > +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> >   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> >   			    q->name, gt_to_xe(q->gt)->drm.dev);
> >   	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 188565465779..5fb6c74bdab5 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
> >   	kref_put(&lrc->refcount, xe_lrc_destroy);
> >   }
> > +/**
> > + * xe_lrc_ring_size() - Xe LRC ring size
> > + *
> > + * Return: Size of LRC size
> > + */
> > +static inline size_t xe_lrc_ring_size(void)
> > +{
> > +	return SZ_16K;
> > +}
> > +
> >   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
> >   u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> >   u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
