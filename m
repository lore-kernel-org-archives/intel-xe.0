Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D63CD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 19:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F4B10EB0C;
	Fri, 12 Jun 2026 19:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfEc5I7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4810EB0C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781292339; x=1812828339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vKpJ7c2wAiZ38jaCkh8TJsaECK4zVHqBZj+Jim88VsU=;
 b=ZfEc5I7eDKoL0RzFjdRvjWVLU3wI/1D1iUKzdbUlzQODbQV4poqytpaa
 wfptSzH5MS9imcwOcgSY5nBZ1A/l3+7d5ixr4eEuymMGpcGzSfyQzeqSA
 jRXcgBjNOGGs0f1+kWqQKxOREeCyzHZRdHUFebAitYkzi0n0KZgF/uG4Z
 uycgDDPI9T7HjDX63+XZ4cIsSk2ECTRgopoOElvs9lDfd5ZF2798nC8+d
 xddtuXN2X38fPoAZ+p6NS4SCMeJgMjv+DyP+U21K73AY12MdkJm4nIkPI
 e5bdxemujDWFyT5z5v4MdJURMbk8fRuYPMG98eiKn+QA6mcf4qkXZgeNZ A==;
X-CSE-ConnectionGUID: 3X3VpwXQSuCaIPEfgQcQ1g==
X-CSE-MsgGUID: 4p8zUk6pQ4iF8BZWEuysFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82037301"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="82037301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:25:39 -0700
X-CSE-ConnectionGUID: /TE5WUyKREKkHWxxEzeo5Q==
X-CSE-MsgGUID: 5uLToPx/SkWpZWxki5oHVw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:25:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:25:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 12:25:38 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY4oE4jjIPbpInF9zY63pn5SIrJhx/QEf0j/Rh4khssbSzLXTp24HxbWdXZsOjRJ4EhhJPbt7ccE2Ti7SX3CQGFCS8XbFIQXjMamunST//vqppGuNNVlejQ9DB3diNnt/hivTJzRea+dBKPjLxPI9T8oM6d9dkkKfRXwTh0tbxMoR2gkkaMPj8klzljcbyN21n5nHUPkfAZnokFPPVAZfxAurO5cyUxpor5d/oitA6p3R/s7S6MUEW8UAu5S1AlKm9qUuMcjvhSm1vz78KB+eTKkdvmTkQs1EdwNjs4EMQ1LV5S1I0ifnSI5WrAFZJ1CzD6mAroejSwkC1BqcrPUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vznR0qkWjP7zp3XuXoQGYgA2ONZ8E48UVeEbAU6XHVY=;
 b=dCZ5nRAAgk2LzEfa8HJQnP0FI19E4cUmzen0tJZEAJyk77aJDOxtTIAG5IWexMbu9Rfskd+Boq1FVwy6AxnONTtypD5i9gbY++xHD3fUS+brhfq0lX4sxah2pPxle/DBBGH51xV9Dt7BN4hfeD1sl35YHxPnvbzLCBoRWVDnmsm6XFCxs5aN8RIczF5icl0I85miuhjagGxNaC/K8XX3jG/YHBfsNH28O2CSV/MfNbStfAcPVv86mb542ley6baV0U0MC80jb33KR8I3eRr2IYL9e8O3TSzZL1ZQEQGJBrnwlFuFTBmORwyG+GKOM8M0UpZAIVEhNYj0z7RFNFLG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 19:25:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:25:31 +0000
Date: Fri, 12 Jun 2026 12:25:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/9] drm/xe/rtp: Keep track of non-OA nonpriv slots
Message-ID: <aixdKYPTgv0Ha9AC@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-4-ashutosh.dixit@intel.com>
 <aixa7+GyBKv7T9/c@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aixa7+GyBKv7T9/c@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:303:dd::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: fde7bce9-5c91-40cd-1d98-08dec8b85e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1NjKlzRFMwfXDey7v5ILOwaerlF+sqkXL7lp+K7K50b/JdRTv8kII6Oltg21DMRUFWC/d8T8UMuPT1LF9OUYovOZCkNzSQAaLScmj+lZsXoSkxhO26mvC9LrTWhCQSDhRTfVkF9Wgy6JX+hyyBonDDsmbGaSh3FVv9RQi9SzQ4FbH8dKRQbYC1KUErbFT+vuc1EumbaLX5kVLhLM0J0bjrRYCzS7FB/+TSBoGPLT9olY/k3/cPVMHV1nlW8hNp9gVvYdoUqOd++pe0CylUXDovV9IbirOzGo7i3P5VhVes7ixq7g3muM5t14bLFjBRiaQlIWYHCXzmy/2rTXaE1DWHZD8sesWl2LgADOtn3QDMd3SFOL398lvnviU4mTG48e3OfjHjqJVSKP64yBheRXVLBRPDy33WCOFK/VebSQulCDrgOpTVoxOJNoQgFLFJgYC8o4Iv88DC1P93Rlos62y49zbzp47EjF6+wWxkMgEZePYwU0om4nGAH+9K1ErUp10/aLsA6X2lO3CqlYgeOf8XVJHDARdPI92bsEsNrjmWHAb9nQ3Zt4v1Qz43xfucBrKEax0g6+ZIwiL6bKjvgFZRfAQTGhiac3wsPwABjwHv4+DvlIxvva0TOs2TfJhFCbYYb4O03/h7/14gRMVm44yzbTx4MnnsEzCn0Yzzh2NrSwTorormf3RqAhH+SQVr6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhUUWFQZ0RWRTkyZnYrWlRISlBhck9pblB4SHU5RElSYU9BM2JLbUFoRHBq?=
 =?utf-8?B?eUJ2ZkxOVE0zZ21jWFlkV09mVjZLNEZmSmo5NUdMN3FXQTIvU0JmdksyemVj?=
 =?utf-8?B?K0hjZVBQUks2VlAveVdQRnVSTmNYU2U0RkJUVCtleDI3anFaTmxKZXBvWkdE?=
 =?utf-8?B?M1NCMXBKb0FUMHhVQThoSHNPSmZaTk56TExZS2NCbFVEZkNxaUNUVjNwTWQx?=
 =?utf-8?B?NHRGb2hVbStTVjViTmxsWUR5dVg4dFJsNVZNRVFKMUdneTl2UG9GMUx4NU5k?=
 =?utf-8?B?aXAwdmpHSWQzandaeEdsSnFyaWMrT0I1TE1zQ25XQkZLNDBTU3l5MkhOdXlv?=
 =?utf-8?B?K2dJa0hxeFBNSVA1V1loRXkzcHl6V3IrazRCTnpLZ2JXNXJPQXZYS3N6cFor?=
 =?utf-8?B?ZS9RZXE4TUlkalplYStZVy9SVUYvSWxhdnkrR1M0MGxMYTQ3TG1xTG02VWI2?=
 =?utf-8?B?aU1MbUU5S1FaUnZBYmdwb3kwNnlSQkxkQURybWs4bmJCeUQzYytIZElDdEdm?=
 =?utf-8?B?UU84cUcwelVCT2JIeVk3WllyZFJzUmNvWkJ2c1I2Mk1ydW11VmRSdzlqbGtV?=
 =?utf-8?B?OEJNaGM4WFFoRCt1RUNJSWNYcmo5NkhlZTNNdUFEelJ2NklxTmxOYkVaWUMv?=
 =?utf-8?B?SnlYbGUrQXlwTGdCOGJ4YTVnWWVUZFVWMExUekxWcEQ1a3FlNUdXazBqcXZa?=
 =?utf-8?B?Rk5oOHh0dXdVSWNqdXlwenpvbURXK1pHSmJ3S3F3MnhzOWJWL2lJRkFoWWtJ?=
 =?utf-8?B?cFVrdzh2cG5ESGl4WGpObmR0T2xkS3YvRzRycUwvSVdNeUl5ZDNPd2VxdTJB?=
 =?utf-8?B?YlFXcFdlNzVyWWlFa0d0N2pCaTVhdi9QUHlkVld4Zi9mVTdlRXlSUStiaytL?=
 =?utf-8?B?SGRCcElzRFE4NWdNY0txZUc4b3U3NU0xOElkY0FXRGo4aHVzbGJEVHpLZ2xx?=
 =?utf-8?B?b3VWQ0hCeitOejA5UGRvOFpDK3NGYmlUZVloR1NXaHVJU1dueG4yTzkzRzY2?=
 =?utf-8?B?bFI1SEgwVjA1WFBIM2RSRjNxYjdQNlVJd1IrdjlFM2hSY0xjUnhsRHdZenlt?=
 =?utf-8?B?NC9xMmZWQUdmSEIyRUMxV0owUlZYb1hOek9vN1hOdk5jQStkYnBmOERLRFN4?=
 =?utf-8?B?UHdteUVtOStNb1B5ZXdIZjdXRGNXYTdmOWkrRTlVendvUDV5MnBWVngrMnRI?=
 =?utf-8?B?YkhHWUhKWVNKVlpDZnFyakJGdUZOR01SakU4STdNMFllTVNWRGIwa2VxcHlT?=
 =?utf-8?B?WGdvNG9zNmJoMXJtNGFTNWRVYXcyZ1FBTVNxdW16RTNweVkyVjA4bENCS2d5?=
 =?utf-8?B?OElrNGtuZW5QczNLaGVJcTJSMk82dDlud09jdTFZWUFVNCs0Z2FTN0tHeVgw?=
 =?utf-8?B?QWxoczFkaUVUc0lMTUdzMkEydklTQUdMVVVoRUZJM1NLTzF4YzlseWxyUDdt?=
 =?utf-8?B?RzNySDhLYURwSTVmcFJoQmxGSituWG9OdlkyckFEQi9pUE5qOERRMzR5czdU?=
 =?utf-8?B?Ym85R2t4a204ZGtDT2F1TVdJakh5aDF6QWRHT3QvRVI1Uzgvd0xjWTF0WW5H?=
 =?utf-8?B?S2tiVDROL0MrZlpWYzJGQTBaS0JkN25pK3E1aXV3emJlT2p0ZTRqRUlER0lK?=
 =?utf-8?B?elNGeVF5THFJQWVTQmVQUENRN2hRRERqUTBzalY4aUdRbUpDQzg1cGc5bDFk?=
 =?utf-8?B?emU0RExDanYrcEFaaDBkMFAwV05uNUJ4NEE2cEtWTU5FQ3Z3YkVxN2haa3lR?=
 =?utf-8?B?eVJlc3NjS1MzWFdzY244clNSK09Dc2lzWlcycnNkcCs3a29wYTVtVm1XSGhM?=
 =?utf-8?B?cmpoeCtKbWU3anJSL3VwNXYwUFhDUTdpZHI5MjlybzVLVHRHdEc4eW9kcHV6?=
 =?utf-8?B?SG8yYmZMejJieFYzT21NWlVoclBoQ1p6R0RoQ1NYVm5qaDRIcjR0Tk1MM09G?=
 =?utf-8?B?NFpRWnV5M3dtc2hISDk0eFIrQUcwL1pjcEhVRkNodWtiYU1RZTBodFRiQXN4?=
 =?utf-8?B?SWZoT0NHb3RRTm53dXVwT2VSRXVPeDdmU3Q3U1hkYjBCK2ZGZGR0dVBTT0RB?=
 =?utf-8?B?QXJjVHZ1S1BxL2pONmNYTE5CU1RuV3lZb2t0VnF5aC8xUXB2ZWk5c2dwa2lR?=
 =?utf-8?B?UjVKUVVrR0hEZzFwZnJNRUh0cHR0aFVkRWExN1BVSllPY1JqSGwzRnNXUU11?=
 =?utf-8?B?bTZyQXo5VVhIazJ0WDl0SDRJUDV0SE52cGlyWURIeEpmWlZGVDNQTCt3eEVF?=
 =?utf-8?B?a2d0SUNxSk5ueW9wZEpHVStHSk52NWN4aEZpMnVsMUhxenM3dFdpRU5KRmNv?=
 =?utf-8?B?SzBEN0lYWFNIbWdUWEh6Mys4VDVUcFBqMFlqYlRUVXhyeUUzdGpoZGlvSEhT?=
 =?utf-8?Q?Fk0Lz7i86Z/LkdDE=3D?=
X-Exchange-RoutingPolicyChecked: Ja2TaHzmJa4eAlCLK4bFiYH0OGRJhEuJ1oN/JDhLBlyq11zdyMqNl7x/RzZN6tLXWsrUHty60PP4Gdy/QDBWJ06apBoTlpWgVTwi543/A/ODV6HoD/8xXhT05YIvA5RBE82G/f/CKjOhCLan8ZGi/GGKJUtC9IjECTBVsE48AS9w91m+ufbctjx/BOLCHX449pmn++DzfmWG7ZTL0u+dCZMxLnu60K9PcmYFEn8+LlHBP/ffjmJII0GpBAwYZeiB55ZantyzeYxXrPOdoQJ3a+Z86Zhpj9cfJp3AQCD6JZ4kGAH6zO6R7a1GYPIvSkeN2n84j2v7MU4c2Yrh3CZDkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fde7bce9-5c91-40cd-1d98-08dec8b85e0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:25:31.2339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpcNFsNXuW8D2z7OaGZ28ssHdEEZNJB/OkonGoiF6rw0uWWkfH3wIJcl1Y5eF9jjc3v4tAIVexz+71bkJTGV3ytG6/trcddpJx5AKIZRiac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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

On Fri, Jun 12, 2026 at 12:15:59PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jun 08, 2026 at 03:36:18PM -0700, Ashutosh Dixit wrote:
>>In order to dynamically whitelist/dewhitelist OA registers on OA stream
>>open/close, we need to keep track of nonpriv slots occupied by non-OA
>>register whitelists.
>>
>>v2: Introduce hwe->nonpriv_slot (Umesh)
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
>>drivers/gpu/drm/xe/xe_reg_whitelist.c   | 8 ++++++--
>>2 files changed, 10 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>index 84c097da9b6f2..11fa6d5f2f680 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>@@ -138,6 +138,10 @@ struct xe_hw_engine {
>>	 * @oa_sr: oa nonpriv whitelist registers, changed on oa stream open/close
>>	 */
>>	struct xe_reg_sr oa_sr;
>>+	/**
>>+	 * @nonpriv_slot: Next available nonpriv slot
>>+	 */
>>+	u32 nonpriv_slot;
>>	/**
>>	 * @reg_lrc: LRC workaround registers
>>	 */
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index 6d642c2f6fd76..571a8e6909422 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -161,7 +161,7 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
>>	},
>>);
>>
>>-static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>{
>>	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>>	struct xe_reg_sr_entry *entry;
>>@@ -193,6 +193,9 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>
>>		slot++;
>>	}
>>+
>>+	hwe->nonpriv_slot = slot;
>>+	return slot;
>
>I was imaginign this function will not return anything once 
>nonpriv_slot is part of hwe.

What I mean is in this function, you can initialize slot to 
hwe->nonpriv_slot (which is 0 on init). Then at the end, you set it to 
hwe->nonpriv_slot = slot.

Umesh
>
>>}
>>
>>/**
>>@@ -206,9 +209,10 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>>{
>>	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>+	int first_oa_slot;
>>
>>	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
>>-	whitelist_apply_to_hwe(hwe);
>>+	first_oa_slot = whitelist_apply_to_hwe(hwe);
>
>No need to store first_oa_slot. You can just use hwe->nonpriv_slot.
>
>Umesh
>>
>>	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
>>}
>>-- 
>>2.54.0
>>
