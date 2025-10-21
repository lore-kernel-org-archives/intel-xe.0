Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D358CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 15:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D3110E309;
	Tue, 21 Oct 2025 15:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkZ93iAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0A210E070
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761059078; x=1792595078;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NyWDPXbHA+QcUsfrk8k8SXEPeVt+3jkY76wrGMDzWco=;
 b=BkZ93iApE5w6rA5QPUPr1WqYFXlEOob8HGQSMomejcqOq9EdMT/6CjED
 OrUDF8jQOzgHvB/v0Ll4GsZYz5bFB6qkEQFWKnnnTkKNBMwcY26nRAu5A
 E0Yw/9v6M0klybuppP9UA3SKDEcpeae8BDO7QRJnYjILjNQMJYYRzsmYj
 wOzpHANqczv/Ti7OzKcR399/ysXOWJ0a6a4KHS96IWoMMdvk5XvP1F793
 pfJHfceZ3jJcVMbYuWsGFzgyBv3tKBttOzB5Kp7K3CvD7Vfl6lihWXfWU
 24zfstQoyL6JGYDiZqyIfdJH+b+SADwtQgToIRAK3aEsCnYe6dbBNYmzT g==;
X-CSE-ConnectionGUID: H+ZxOYvrSECq4/4K97m7Hw==
X-CSE-MsgGUID: ur8wMBzwRW6YhJu/mlts0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80811122"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="80811122"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:04:37 -0700
X-CSE-ConnectionGUID: XSUcBNMaTryBtcjiOi9HMg==
X-CSE-MsgGUID: tiqPakyRShWLCMR06iKdZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183469896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:04:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 08:04:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 08:04:36 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 08:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFCj2yNoKmkDoegL85Y6V4Gh+EUzdnIGXcdQr5UYLugDBQ/xJwbTfh2bunwuZmYmN11wnNaLzzL6ZgloPQd3X3yBaLJ4NJ//F5vt3bFZ0Xc7I6EGveqk2Dvte5qeSYoqeNM59wC/pw/6O/EibE7ve1vwjIv1y4fCwd8rh6rzGI7ekWXlzhNdBeLA3Z5lDfzXpdusktXuBc26mrLihG6U12PNGq1gaPbM4LuQ9fNBYs1BZUEPrQVyK9F/ZTjQ8mTmKKYEoT4EEHFGsOY51TOq+Bi0qLeV8nJMuePlWsDBaXtiSWISJWw3IFj3qLbRze+z9lhe+qSahTgGYW1MVfUmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDSwICebYBOdFHO0PL5LQ+3NGg6oY9ma8yaFkhG0AUw=;
 b=gN8HlQALTGUCFbEJsKcbScRSJLd1rMl7T8iEin8Z3gCGpBLvdC8TAqZX/Rer0C49nYBSLQGSW2vg9Kqc5KG5o2B/xCs1pdj37EIhGRQBeHKVTqOJsoyAlPlDiYUaw0qzbHLwuNdzPvfU54JNFbi2HYf2jdYY9XPeLbyxO7gT8RGtCS3ROEvEXHLPaXx2z4xfmgK0VKuEH8q60b1n8x118k9q7cZrb9Nx+7xVvPNBSm9YeasVXE/RniPz3Dwt2ZOp9du0xfX6JZn1h/jU3Neeonx7KHue/qvIAv2crIiVVo1RvuJIPaaMV9LyRzxp5HslVHvbH06sUzlmPLvV4KQ5Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5784.namprd11.prod.outlook.com (2603:10b6:510:129::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 15:04:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 15:04:33 +0000
Message-ID: <e90a6fcc-ac9d-4707-ab10-6e57ed6a554d@intel.com>
Date: Tue, 21 Oct 2025 17:04:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe: Assert that VF will never use fixed
 placement of BOs
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Piorkowski, Piotr"
 <Piotr.Piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "K
 V P, Satyanarayana" <Satyanarayana.K.V.P@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-4-tomasz.lis@intel.com>
 <8c9bf95c-e650-4035-a5a4-3c6b1d353851@intel.com>
 <f4e2aaf2-a4e5-497a-8b35-7044b29dc48a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f4e2aaf2-a4e5-497a-8b35-7044b29dc48a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 7567b183-ffe8-4d62-1c4a-08de10b32492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGlvaU9FMVRzTGZyNDhFNXdVczhhQ1lyNnZINVc4S3lKYUlGOWV5RXNDVTdj?=
 =?utf-8?B?bzE4U05KVTMzZU43VHNXakxkU0thb0JYbHVzRHZKZjlac3M1US9lbG1odkx6?=
 =?utf-8?B?SXU5NS8ycTJFNXk3T3JrYUZlM2RXRjVKczlFSkdyTXdsR2ZjTktuMXJvLytW?=
 =?utf-8?B?cktZY21RT3NrTU1QcWt5UzI2K05BQUZsUkx0TVp0aHFKUFp0QkZBdUVzT1c1?=
 =?utf-8?B?YVZUeXlkVVFZdVVsYkZJVlBkWjM5S1ZRY0IxNm5MUTNSQkFXZVEyQ2w4amFB?=
 =?utf-8?B?L2M3SkVrbWZvVStBWUl6TjB2RWtLNXRZUVBmNDEyOXUrMDMveFZLMDJFckJP?=
 =?utf-8?B?d1NPdG9XUUdVNnN4UCtkdFQxQlJmMHpsYjRoQ2tkd1E3cmxnNHJDeVdPRmxB?=
 =?utf-8?B?ZDRGcnNuQlJDUEp1K2p6YkRObjl3WnN3MXVuQU8yTzFYTHRsQ096Yk8yM1Ev?=
 =?utf-8?B?NngwZWc5ZUt4YnF0MHJjNEZLWWZ1bDQwQXIxaXIzWHFQVXlUWU9MOWhjMWJp?=
 =?utf-8?B?WWZmS3VjbjN3UlJZMXJJY3cxMHFKdlJZVHl1TXdWbkxicjBJY2ZBWndPLzQx?=
 =?utf-8?B?TkpGaHdBR3hnK2lVMjlrMFkxUms1U0w1TjJwZnZ5WDJUQVdueE9PNzRFd05Q?=
 =?utf-8?B?ZEdyZ0xDcWFteUFEazVQUGNnQ3E1K0VNWE1LV2NDMmQ4ejVobityRGd1ZVdB?=
 =?utf-8?B?OEVLYk5qMS9zWnRPRWUwbGYyZ1h1dmN5dWFFN2MzTHMvNDk4Si9TT3lXUEl6?=
 =?utf-8?B?emluRGFzM29jSWZOVHZSYXgxS25uZzk1OFlrZHJrbW1hQnBLY1hwcEZJYjZx?=
 =?utf-8?B?YURBRXNtNFZBUXlyM3pmWG1hLytEVkpqVUN6YjJkNGRXVDB4UFdHeTB3ZGtX?=
 =?utf-8?B?Tmo3bytkU2dPNHFFcXV0RFBNdVVNYWFYZUM4RTRnRlQvUHEraUJIV2FyUDJq?=
 =?utf-8?B?Tk1YTjhRNThqWjA0YkQ5RXk4bHI5dnpaZEc4TGJQbWVrQm51WjdiTThtSzZu?=
 =?utf-8?B?RVBBUEJ1cUQzeEoycExiSU9yRERkaEVTa1hvOVZHOE45MW82cnFESVROOHRV?=
 =?utf-8?B?OUY2WGxSWmdDdUhWcGc2QjFKNXA5SWNIazJRdlhvMUpFSTAxYjF4VFFvZi95?=
 =?utf-8?B?bFlUNkNZeWlJQUpvSVFlTUkyeGNpb2Z5Z2ZZbHpKakNXdGRRbk5IVkE4K2gv?=
 =?utf-8?B?K0tDdi9qQnlFM0pnSFcwQmZxdnBHbWRNNWZaMFJOT0twOUdwenpTaUlJUWxC?=
 =?utf-8?B?MzI0dWxJWjhLNk1SZFFOSzFLNjNYbG5Sd0hFSWhUbmJFWXUxSjZ0YjFWTWFQ?=
 =?utf-8?B?UTlMb3VGbFNZVUVOa3p6R2txOC83cVYyZ2RFKzRBTlpKczFvWlEwL3pFZFJp?=
 =?utf-8?B?VC9yM2lTaWVPVWxwcnptb0lpb1YxekNocjVQeFAyRWhiSHlMTXVsSUZBdmNa?=
 =?utf-8?B?MVBOZXEzNCsxSmVhbmhUa05hMGVCaFlPRW1NQzl4My9WY2NCYjFIK0NwY3dW?=
 =?utf-8?B?ZDhLa0NORnluRGxjbU0vdGJTbTFkNzUva3hHZi9rUHhob0hTeFpLbVdpZThz?=
 =?utf-8?B?aEZqM29hVE5hNHF1dTA2dXhUcXh3R05lQk00QmZwZ09TZnd0VE1vclFYZ1Js?=
 =?utf-8?B?cG90bFFpSGYwTEZFOTdJQTBPU08ySktRN3BGa1hCVkZ4MXZmZjBqUlJId3l6?=
 =?utf-8?B?WTFqUGNNMi9TdDdvMHBOT0pmcy9OLzRwMzY4VnNBakRGRk9uNHZ5OXl0R21K?=
 =?utf-8?B?RkhZVTlNZ3hOTjFmQ1N2U2s3NUhtQ0hvVWRMenpVYzA5bHhmeEI3b01PVjdS?=
 =?utf-8?B?SjJIb29SOHFGS1g0cTh1YnQzWXJnVWJNNG16eXkvYjdqQzhoTUNFcVNQcTRp?=
 =?utf-8?B?bjdUS05yU2liaEhGdXZHUGxUTnpnYkptVVJnMWhzTEdFamU1MktpemQyUzJt?=
 =?utf-8?Q?OnYgf0X8IT++JV4FhJVm0hH35bEIa+hY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtuR1F5RU92MExYYWtKU0VESkVLRkJNaHVpSXYzQlBuWFZnSUpyRFEvamlj?=
 =?utf-8?B?ODUvNE9rdkJENmtTTERUTjVlY3NOeXBybjVzK2s0NkdsRWoyRWtQSnpTUmp4?=
 =?utf-8?B?N2M5MnhwTUducCtJaklQaXlKOXNmWVpsY1U4QmNFMHBCb01PRHVYSi9ocmdF?=
 =?utf-8?B?TVo4OEdrYS9sYS90TkR6MVVaL2tqRlNWZVZGUmZJemFwN0tGRXBJS1FlcjBI?=
 =?utf-8?B?THF5b1ZaZEEyQXBmSENqRk0wSDFEQXNuRVk3NXdackprdHkxOHVRWUdkSExQ?=
 =?utf-8?B?SUpjaEVFd1NrdFF1cktaNjM1amN4SjNPVTNjRG5TbTF5OTB1c1FEeFp2bjVn?=
 =?utf-8?B?MldGTXdLeUo4bmRjQTF5T1o4Ni9yT25vZ3hPVXBDSzlTSTgzYTJxRFllSGtB?=
 =?utf-8?B?cVN4WjZaZit1YUNCOWxweUNndWpMcWhRRlRZSHI4SWh4cHp6cjc4SWJlM3hF?=
 =?utf-8?B?a3ArR2g0d0picE1CK0QwZFpOOXBFVHdoeXZLME00OGFNSC8xS3NVTFpqY1ky?=
 =?utf-8?B?ejVpT3NBR3lEQktGT0w4eGk2cWo0VEhLZ1lONGZiMkdtcmx0MS9yalVPZXlk?=
 =?utf-8?B?VHZGMU4wQ0NjMlFScGlacnEvOTdzVmRJdVF2b050SUFPUkluaGROR1V4dlVB?=
 =?utf-8?B?bVRIMWRQNHFza1Aza3BBTTZsNnJ5Zkt6NWRGeW5sRkw4YWFtSHRqM2lvMVhr?=
 =?utf-8?B?V2FOR3ZBN0NmNnBVM3lLZTMrNk1Uekp4RmQ4M2JJb1VwMVlQa1dtS0xFUjNH?=
 =?utf-8?B?TGg3SGxsWjNQcnljUVI4dTlvUzFqQW1mdnRjc0orWFNIQXg5T0FNdlFVdCtl?=
 =?utf-8?B?dzdrS2JOcGJ1UUkwcHU1WnM3amNVTnllU2R0RG1HV01wemJCd0tjQnE5YVRD?=
 =?utf-8?B?ei9OSXlQTmwzcGlVSThYZU1ZMnc2VEZCb3FKM1lqVk41ZzVTemRxMkRaeCtw?=
 =?utf-8?B?VHhMTmRyaGRqSjVZaWhDQlAxTnFKRVBXbHVxRVp6M2l4eWIvYVpGSEVjWmFr?=
 =?utf-8?B?d2hSazBwc3dXem5hMnpZcUpzRTdkMVh4WG9uck9TMXhSZk1QMktQdGhpOGNz?=
 =?utf-8?B?bGdOS2RTUU9tcEF2Z0hkRzhvTmRkR3d6a2ZtU1p3NmN3Vmt6dnFOM3dZWkFh?=
 =?utf-8?B?WkNGN0NraUVUMnZzK3NiU2xHKzlPZFl4dUhYNzJPcU13OGNaVGUzUit3TG5N?=
 =?utf-8?B?ZmRhUWdQbUJhMDMzblB4MHo2NkRWL1BCSk45T3JlQkpMQzBBb0daQTRGSDRv?=
 =?utf-8?B?UUJFVktZaklJSjZRRUdDSnF6UTFRMmp4bUVNS3pYU1hxancxR0psd2VRb0Vp?=
 =?utf-8?B?L0N0Y0N0ZDQrNEpUaFhWa0FGVHN3bStSNlFDNlhYM25DUWE1TGJZUkZ0c2tR?=
 =?utf-8?B?NU5ERjFtbzF2cTlvNEk2Y0RvWU53MHkxQ0dXbjkrVmJ5Z2k5WForVU15b1l3?=
 =?utf-8?B?KzNrZHVaQ1h5V2FDM1FDZllhTU9mWDBLeWM5ajNuWmV4Rnk3bGZTa1NNYm1O?=
 =?utf-8?B?YUlzWU5Zbit5VXE1cjFLN0UvNWFyOEI4UmhvMnpUOWxya2dYOThWN1hROTNx?=
 =?utf-8?B?QnMxeTV6aW9USFNwWEJGMG9CeUNkUFJ2Z0lERFRHWERaSWlSOFMzMFpVWjVi?=
 =?utf-8?B?MVhZeVdJdHo1V0ZGZDR4V2VXUXhYdHVyRTdMeGw0TXhkSCt6Q0lBTkpoTXZS?=
 =?utf-8?B?azFRVzdnYTJnTzkraWtmeXZ4aS83K3NPRFByeTBoUFRKS09mK1F0VlRBVFRY?=
 =?utf-8?B?V2tDdmFZT3FtK0JoVVNOZ0pWVjJuWlZ1cXZMQ0h0SGgxZFkwUmNVMlBkNWcr?=
 =?utf-8?B?SS9WSmc2c3BCMWZvOXJ5cTJCek1VZFhaMFgyeWVLc2lCTUVCMUlNUnJ2eU4x?=
 =?utf-8?B?UUtkc1J4aEY3NE9GemZTMEhwMzkya1ZHQ0RJdkZyZ0orb1F2ZUZQbXN0bzRl?=
 =?utf-8?B?MkpLYWZiQ0JqUXcwWGhGb3ZZTEhuQ2owSDgvSTNwN1JrTThmblprZnE3dnYz?=
 =?utf-8?B?M1RtK3pVUVdqRnM1amJNZUpHS3cwa2RXWC9FcXhxRnA1L2ZlZE00bUtrcVhl?=
 =?utf-8?B?UXVCZzVUMitLckw2cWpmMGNzZ3lqNWp1aXJta1lEUTNMVEQwRGxmck9qRWNz?=
 =?utf-8?B?Y1BtczFYckFMV3NrUWU2VGNpYlZPQnBNL3NlZWs3UzJ2NHhYVlk2TEFTNmxC?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7567b183-ffe8-4d62-1c4a-08de10b32492
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:04:33.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otswXkFlB1prkADFEzH3IALdHaKbj2Hk/QheonMUkxc56VxQYd/BzTKUB/H3589fwefpFV1fRgBLJoMc+KrBWv9rOCBOZIN+8aYP4bxHpno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5784
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



On 10/21/2025 12:48 AM, Lis, Tomasz wrote:
> 
> On 10/20/2025 11:59 PM, Wajdeczko, Michal wrote:
>>
>> On 10/20/2025 10:58 PM, Tomasz Lis wrote:
>>> Most BOs do not care at which offset they will be accessed within
>>> GGTT or PPGTT. The few which do care, should be only created
>>> on PF, and mapped within GGTT. On VFs, mapping at fixed offset
>>> would be problematic, as each VF is granted access to a range of
>>> GGTT address space.
>> it's not a matter of being "problematic" but this is just prohibited
>> as there is no assumption which GGTT range will be assigned to the VF
> will update to "prohibited". though that's a simplification. Fixed is not the same as constant.
>>> So, since fixed addresses of GGTT mapping can only be used on PF,
>>> we can add an assert which makes sure no attempt of fixed placement
>>> will happen for a driver probed on a VF.
>>>
>>> The assert will also ensure that VF migration can be properly
>>> performed without a need for special handling of the fixed placement
>>> addresses.
>> this last sentence can be dropped
> will drop, though I can't say I agree.
>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 7b6502081873..8e826a4aa574 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -2259,6 +2259,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>>>       struct ttm_place *place = bo->placements;
>>>       u32 vram_flag, vram_stolen_flags;
>>>   +    /*
>>> +     * to allow fixed placement in GGTT of a VF, post-migration fixups
>>> +     * would have to include shifting the page ranges
>> it's not about implementation of fixups, this is just not allowed
> 
> "not allowed" is not an explanation. That is clear from the assert itself. The comment is here to tell why.
> 
> Having only a range of addresses is not enough of an explanation, as then we could still have fixed offset which was computed so that it conforms to the range limits. Fixed does not mean hard-coded. For such computed fixed offsets, the explanation in comment is correct.

any of your "valid computed placement" will have to take into account the VF's base/size anyway

and since this "base" cannot be guaranteed to be stable across the VF life, those computations that expects or use this absolute "fixed" final placement are illegal regardless of any missing "migration-fixups" implementation

OTOH the relative offset of one BO to other BO, will be satisfied after migration without any special work

so still I'm not sure how above comment might help

> 
> -Tomasz
> 
>>
>>> +     */
>>> +    xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));
>> but the assert is fine, so with commit/comment updated,
>>
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>>> +
>>>       if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
>>>           return -EINVAL;
>>>   

