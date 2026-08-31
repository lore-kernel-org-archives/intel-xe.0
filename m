Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C90C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C228010E66A;
	Mon, 31 Aug 2026 06:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaV4jNZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A664510E66A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159481; x=1819695481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vj3Z9KzG1F45s4G6JrmosXfaxubBYaFetEU3D7gqGAQ=;
 b=MaV4jNZmofQTEwHefg/E8RUzyMGlSpv8GtTKRvJJFAxV7UPVZEDfnWKR
 dP1XiF1Z6zxvplAs7iuVb3dRFRsaJJx+GHcsvVfApB3xWGJdClH+k89d3
 xUo+irpj2i5vPsw4+WeRujfeO8PbH4asPO7kmSuTSXxvsUfVsy+/N4KtM
 oZ9nT9MO73XaRkd9p5F9M8jhj5FGxp5TRNRe/yqt30zy9PO0uPEzCRvzR
 o3YqhVsQ6bBLnZhnxuT6eb3w+LoINq+z/nC+03c8SmV0HNM26+uKOFYEj
 y4fzMoN+NOCedrjwbsz1Eiuk8HucsuIiGzwVymLkp/0umx3oJ0dD5D2ug w==;
X-CSE-ConnectionGUID: DoB+LDUnRyGz7ztqhwwBYQ==
X-CSE-MsgGUID: JPvXHRZVRw6M40gyyw2iKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="100070374"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="100070374"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:58:01 -0700
X-CSE-ConnectionGUID: CFr2ZuGQSXyP8Rd53rckGA==
X-CSE-MsgGUID: sM4qChVjT1O1BU+CUYyBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="273981790"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:58:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:57:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:57:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENPpzHFRmVCOVjx5e8ainICN/zWvP/d8mkKSbSnUVwpSCwT1ceXimboRWn+VS5dYBG+HPH8FUTzZRGEgxv/AmYk8gy7CmbdvZw7oq0OwKf0Va8E+ZffbDhjh9qMqnuutqP089z/Yf0qqe2abMjUeVrW0bKzCjWAT8k4WnuX7AvWkaM79mBvDhtCeY07IFJvQ4NWd34xzYPIyVvgEUFGTiuQuD0R0pibTWLyeBT/VGN/IVIpQSeFkKGJwj2zo5cVECXePnNud4iFk2+3GMRhcFHe3muwn7l29gOt+pSJSMrY1sgv0Oq1mxrSTW4XbR6VCqEbsuvI9U9HbvnbvoVLjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1arWZX13AF14Dlj2gHsQnX1xYft7hjbJaTQQKZMYZ7w=;
 b=QMHVEoO6JvcxaLA230Q25ComOJ9hMuDgNYiVcLA/y7+dHH9COrziL7WbNV3ftBP1FWNvsbtEu08qPgI6utfMpAwQlVuLKybuKNMauxQ+uFTRsqOr85ctAL9/Wmdc5EAJK3fbUumnnm0kK4iy+ybvfaGV9ZqNNu6TY5WdeycQBpRLx2RimrBVzZW9WRmRyQSi+XJ1sHA+OT229fG++p65DR+Jxd6+6Ybq+7PTPF7Koh22PQlmn/0eqP415A8XSIkRHLigaNOs4WNIxMYcZT1MPaXr7drhT7rskEavetNyOKT+p+9gh9T78SZoiZlykw7mtPtQM++f92iOoD8WbvxJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB7163.namprd11.prod.outlook.com
 (2603:10b6:303:212::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:57:57 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:57:57 +0000
Message-ID: <42f2d58a-88dd-465f-b9cd-08f49b4cc91a@intel.com>
Date: Mon, 31 Aug 2026 12:27:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V19 09/15] drm/xe/vram: Add VRAM page offline fault handler
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-26-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260831064942.315720-26-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a31f89c-b5b9-4951-7508-08df072d3043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|5023799004|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: SWykx+LNhtYVZVidD9Oc6nJ33WDJltiqKi3WGdo2u0G6ZE2rtp7Blpjba/PvPGP8yJ6D7AmKbbWVYuQ9SR5w/GmX+nsD+/ojaYL0s+H6QKwKtENfgu4NFRRFJcozKo0Hor+AHJpwWMTRxbjWJsbLMeMXf1fytQpAA5WzLz62UtWJ53oMG0xJV6xF7t8BGvghpuQyGabypC9vvXb70NtyMEJzBkSJmLvPz+jh/60aytQnRVtuzmTnrmJdctoNiyq1ZARcNZddbsZEXTvtCvLqTLWCH8sN78BsnbUdMKAOL7k/iLB2RXLK3WhckfaOcpiVfKdBQTq1udPsbdo2ta28Oa1f4ItCqApopLR8kCwSg0Z5TFnGdHEVwQB5rslM4ozWrUTJuM8l0IuU+s2LUuWGLQUETkdNFa6PL5pxYYwVJv1elZVTS8STRhlcUoDSEmbEhilD/C/mIJKom+PDfbvmw6aADjyvSkLbMWsjZnzuPwC/JEETFj7PuHTAx2AV/GPsnnFFsANtXBCvK4jsh4H2XcgnAtSrcheGocqLogX5tknFLTxmGEsgpSFzmLaIFNCtFVoNNIgxCEJPrUL88ekDqPp3bWpkp0QKXfBi1yuK4AqiaALx/9O5szobo4Lwxd21fkdXvuvkWRJSqjK7yPs8hdFLAykHceL87C/wmK6SoWw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5aeUtXUUVSS2xybFdpSHBNaVF2dzBmOUtBQ1ExcDlFZ1dKKzRVY3pGZm5J?=
 =?utf-8?B?eEVsV3BxNi84cmtOR01SalZhZkFVQ01BYlJ3djBhTDArVEJFODZwSTFkVTZP?=
 =?utf-8?B?UCtHaDFoSHZTVjVDR2E5cTdmVzIxZDk3Z2ZvdkNOTUtpdWZkckw5enVBZVRn?=
 =?utf-8?B?WjA1S09yU1A1OGIwK3BYc01tZTl1bGNqdk5XdUFuTmRJekJSVkxZZWFaQlp1?=
 =?utf-8?B?dWJjOW9oRjVVWFV4RGViYVlnTzZWN0Z0NURhSGhkTnd5NzcvRzJIeG1IbDJx?=
 =?utf-8?B?ZEFuZVpEZzVBUmd2ZjkxVUFKUU8wOHM1R0RFaXlwaU02LzVSbFlON05kdzRP?=
 =?utf-8?B?eTZMeTRuVmhVTkZoS0RMTndzTjR2cFp4MUVJNVVvR1JWSmxxS3h5K01tYlhI?=
 =?utf-8?B?d3FLbFE0ZXFzOTBBM25XR1RrNGE3Yi9OQVFIMkQvcU1PV0xiNGFDWkJ2dnpJ?=
 =?utf-8?B?MldyRVQyeGtQM1ZtMW4xWk4vWGtmNjIySk9vR1NYTjY0cnBreXVyRVhHYzBM?=
 =?utf-8?B?cVFpaDN0Z1NYdkI2ODV4djJsd3ZsenVISDRpbXozRy9QNEcvb21NaEk4c2FV?=
 =?utf-8?B?RU9hNllteEk2cThIYWsxdUpOc3hLa0FaWm1sRVlFS2NOWDA5MkNaTysvc1kr?=
 =?utf-8?B?TjN6NWhJZmg2NHJ2Z0hTZ25uM21GTE5GMWRVRHZlUXJqOG8za0d4QjhlU1F5?=
 =?utf-8?B?SkV4SHdCWlB2OGRtMEtHWmFsQjk0UGVPeXFJc3JYR0ZrZmhCRkRTNTloSDdl?=
 =?utf-8?B?MUJqOEpWWGhDd3NaZnJYQjJndWtaNzVZVWI1ZkdpcFpndmRlUnFoN0JNQ0xn?=
 =?utf-8?B?TEd4R3pIR3h0cnZHOXJNbzU4WG1HaER1RW5YRzZlOFROMVJZMkNLd0U0d1No?=
 =?utf-8?B?QWVJbm5LcVQ4STF4THFhRGV6R3NtRlhTNTkwL0RNVUFkaTZmZzdURlVTYzJF?=
 =?utf-8?B?cy9wYVFtdDlOVE9RSTVITzJISFN6d0tKWmJ4Q3ArYmVyYkVWN1JkU0hCVWRy?=
 =?utf-8?B?Z0lVd0NaSVRPekZWQURsc1ByOWlSTTZMYW8rYkV4MFBOZi9LNkJ6dTJqYkpG?=
 =?utf-8?B?YmdIaE9xSy9tWEJkMG04c3NSSy9nNVVLeVlZMWo2UGU5b2RPd0QvM3ZybENI?=
 =?utf-8?B?SUhEeE1LWGxiMlZLZm9NMThvcHBtdG1IeWg4V3BnUzBIZENqZXdSY0l1RjFE?=
 =?utf-8?B?bTBrNi9NZ2NHV3ZMYkxSWkZnOHFtK0hyZGllNnk3ajc0Q2NIbUl4dDh0TjBF?=
 =?utf-8?B?Q3JGNExSYWYrczd2QWZmdnFmdU5zZjR1QzFiNVB1SWJQSGJiT2cwc2xqTjVu?=
 =?utf-8?B?N01KMXFwTEZGMnNnMmRPRGIwSk1ocTJ1T2ZYNmdUb01CUTlTQmZXL05jQmZl?=
 =?utf-8?B?bE1oVy81ODlzSGkxSmw2V3J0NmV2L0UydUJtS3hHNWlxR2tRWCtkZWdLZUs3?=
 =?utf-8?B?SmhUOS84L3U0V0MzM3FrT0krTFlLVzZDSkZrNDJZY2VPM1BaM2crU3NacDQx?=
 =?utf-8?B?SGszdzNLVlhLSVNhTzVIb3lMVDJHRDV0M3kyRFdKUEJiTmMwdjhldFllbzI3?=
 =?utf-8?B?UWdGNFVua0xteGkybmliQVNzTTZHdXd6WkViS1kzbVBYZGZJTHFKOFhHZVNM?=
 =?utf-8?B?TmlDMHVSalVqVWlCWFVpSWJ4c1UrQTFvdDRFbFBuTTViVkxEZ1Y4WG11aDR2?=
 =?utf-8?B?TlM2N3ArUEhxRG9uZVR3d014VDhoZWdqWm9JUUhUT0Y5R1laMUdIYVg0LzB6?=
 =?utf-8?B?UFpMdysySFhJcHU3TjFIOWVhZk80aENCd3BDUW4zVVRIcDIzeGhtV0wyYmdZ?=
 =?utf-8?B?K0RjNkZwaTdlTFpDejZ3MWdyT1VaRHBjQVZOaTdaRHdkbFhUdUlVczlmMTNl?=
 =?utf-8?B?QzA5OUgyaWVnZFRuS3QyYVFBVmxGdGhxeWsvL2s0WUI5bVVsTlFwdm00Zjg4?=
 =?utf-8?B?OGJBbWd0VTAyZlBFQWRORmlBOThTZFVRWVZOS0U5dkFEMmlVc2diUVNhUFRq?=
 =?utf-8?B?ZzkvQzJWVHhwK0piNmcxTWx6M1Z1OS83TXB1SU5nQ2ZyeXNCWEUrUnlMN2JL?=
 =?utf-8?B?S3U1U0RoUVdmKzdyM2hwdVdxaW8wZHlBcVpKN0dCbklyY0RVUHFnQVg0M2ZR?=
 =?utf-8?B?azZwdGZwYUZIKzNRZUtIMmlYdE1tcVRid00wbjZZMlB4MWgxMkhnVkptTHNG?=
 =?utf-8?B?Q2RkRklJQ0VMaWw5VFg3cURTejRaVDFzb1hqQ3VqelUwM0wrOUxLbmRjZXFE?=
 =?utf-8?B?VlhSV1BwNEZ1cG8xOFhNamxNck5PUWx2NHlqQWVaM3pPTTFJbmtKUGI2dm9L?=
 =?utf-8?B?RFFLYjJRc3hrZXpUdmZqRGd5UEFYL0FRL1ZycDBiclhuSU5UWWQ2VzFVZys1?=
 =?utf-8?Q?JvS97XVSWCL0w22g=3D?=
X-Exchange-RoutingPolicyChecked: nvgnGy0jMmtEIoCTkx9frbpEiR+MZot0ALTrtjhzGzTJmJKeXLcZphN8d7AWwO/56AEksisFHAoYMjnZ3j1O+78fHDFVX1bPguN7P92QSbrtS3MVOHdMG7jJPIWvEvLzce2qWnYtSCi7ic4DXsBGs16Et7REYopbQ73x0TL/N4u47uNhvkDEskq+Sjni6yw2nOPmeIw3hh46MCPBnMyHMu9HYpW5XTI0nqwwT/Dw2o12WIGldxEVnq+3Gr8v8arssTP12HBg2FZSjgvNGQJd8lJLXTH0IAtXiWK5nGIGZ6BE727cefL2tq72TKhizARngJiwzP9/WTZTlUToCTH6Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a31f89c-b5b9-4951-7508-08df072d3043
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:57:57.7786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvVoCH8R7eZL2fXNED3ZJcmyuC5uDBPu3wPmWsu8lgFfmWMnkP/qb3js3WEMBJ98LNq7v1C7WBQ1K7toqB02KJrcFLCU/EpnInu1fsPAJs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
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



On 31-08-2026 12:19, Tejas Upadhyay wrote:
> Add the core VRAM page offlining logic to handle HW-reported faulty
> physical addresses:
> 
> - xe_ttm_vram_purge_page(): Purges the BO containing the faulty
>    address. Bans the associated VM (if page table BO) and exec queue
>    (if LRC BO). Moves xe_exec_queue_kill() outside xe_bo_lock() to
>    avoid AB-BA deadlock with vm->lock. Uses READ_ONCE(bo->q) to
>    safely access the exec queue pointer.
> 
> - xe_ttm_vram_page_already_processed(): Checks if an address is
>    already tracked in offlined_pages or queued_pages lists to avoid
>    double-processing.
> 
> - xe_ttm_vram_reserve_page_at_addr(): Two-phase reservation that
>    first queues the page, purges the BO outside the lock, then
>    reserves the buddy block. Handles both allocated (BO present)
>    and free page cases. Returns -EIO for critical kernel BOs to
>    trigger system reset.
> 
> - xe_ttm_vram_addr_to_region(): Maps a DPA to its corresponding
>    VRAM region. Checks if the address falls within usable space,
>    or infrastructure zones (CCS, GSM, DSM) where it returns NULL
>    to flag a reset path. If the target address is outside any
>    known region returns ERR_PTR(-EOPNOTSUPP)
> 
> - xe_ttm_vram_handle_addr_fault(): Entry point called by RAS.
>    Returns -EEXIST if already processed, -EIO for GSM/critical BO,
>    -EOPNOTSUPP if out of bounds.
> 
> v13(Himal):
> - Remove redundant code
> v12(Sashiko):
> - Handle multi tile and add assert for 4K align
> - Remove unaligned action comment for ENXIO
> v11(Himal):
> - match everywhere with enum vs bool for status member
> - Fix comment and remove unused var
> - if purge fail let next alloc confirm failure
> - pass absolute address, useful for multi tile
> 

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 266 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   1 +
>   2 files changed, 267 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 1253989a8d06..e5994c14487d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -13,10 +13,16 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_range_manager.h>
>   
> +#include "regs/xe_regs.h"
>   #include "xe_bo.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
> +#include "xe_exec_queue.h"
> +#include "xe_lrc.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_res_cursor.h"
> +#include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_vram_mgr.h"
>   #include "xe_vram_types.h"
>   
> @@ -572,3 +578,263 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
>   
>   	return avail;
>   }
> +
> +static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
> +{
> +	struct ttm_operation_ctx ctx = {};
> +	struct xe_exec_queue *q_to_put = NULL;
> +	struct xe_exec_queue *q = NULL;
> +	struct xe_vm *vm = NULL;
> +	u32	flags;
> +	int ret = 0;
> +
> +	xe_bo_lock(bo, false);
> +	if (bo->vm)
> +		vm = xe_vm_get(bo->vm);
> +	flags = bo->flags;
> +	xe_bo_unlock(bo);
> +	/*  Ban VM if BO is PPGTT */
> +	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		down_write(&vm->lock);
> +		xe_vm_kill(vm, true);
> +		up_write(&vm->lock);
> +	}
> +	if (vm)
> +		xe_vm_put(vm);
> +
> +	xe_bo_lock(bo, false);
> +	q = READ_ONCE(bo->q);
> +	/*  Ban exec queue if BO is lrc */
> +	if (q && xe_exec_queue_get_unless_zero(q)) {
> +		/* ban queue */
> +		q_to_put = q;
> +	}
> +
> +	if (bo->purgeable.state == XE_MADV_PURGEABLE_PURGED) {
> +		/* Already purged by shrinker during unlocked window — nothing to do */
> +		xe_bo_unlock(bo);
> +		goto out;
> +	}
> +
> +	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
> +	if (xe_bo_is_pinned(bo))
> +		xe_bo_unpin(bo);
> +	ret = xe_ttm_bo_purge(&bo->ttm, &ctx);
> +	xe_bo_unlock(bo);
> +
> +out:
> +	if (q_to_put) {
> +		xe_exec_queue_kill(q_to_put);
> +		xe_exec_queue_put(q_to_put);
> +	}
> +
> +	return ret;
> +}
> +
> +static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
> +					       u64 addr)
> +{
> +	struct xe_ttm_vram_offline_resource *pos;
> +
> +	lockdep_assert_held(&mgr->lock);
> +
> +	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
> +		if (pos->addr == addr)
> +			return true;
> +	}
> +
> +	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
> +		if (pos->addr == addr)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
> +{
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +	struct xe_ttm_vram_offline_resource *nentry;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct xe_bo *pbo_to_put = NULL;
> +	struct gpu_buddy_block *block;
> +	u64 size = SZ_4K;
> +	int ret = 0;
> +
> +	scoped_guard(mutex, &vram_mgr->lock) {
> +		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
> +			return -EEXIST;
> +		block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +		if (WARN_ON(IS_ERR(block)))
> +			return PTR_ERR(block);
> +
> +		nentry = kzalloc_obj(*nentry);
> +		if (!nentry)
> +			return -ENOMEM;
> +		INIT_LIST_HEAD(&nentry->blocks);
> +		nentry->status = XE_PAGE_RESERVE_PENDING;
> +		nentry->addr = addr;
> +
> +		if (block) {
> +			struct xe_bo *pbo;
> +
> +			if (!block->private) {
> +				/* Race: another thread just reserved this block */
> +				kfree(nentry);
> +				return -EEXIST;
> +			}
> +			tbo = block->private;
> +			pbo = ttm_to_xe_bo(tbo);
> +
> +			/* Get reference safely - BO may have zero refcount */
> +			if (!xe_bo_get_unless_zero(pbo)) {
> +				kfree(nentry);
> +				return -ENOENT;
> +			}
> +			/*
> +			 * Critical kernel BO? Best-effort check without resv lock;
> +			 * worst case a concurrent pin causes reset path unnecessarily.
> +			 */
> +			if ((pbo->ttm.type == ttm_bo_type_kernel &&
> +			     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
> +			    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo))) {
> +				kfree(nentry);
> +				pbo_to_put = pbo;
> +				drm_err(&xe->drm,
> +					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
> +					__func__, addr);
> +				break;
> +			}
> +		}
> +		/* Queue both free and occupied (to-be-purged) pages */
> +		++vram_mgr->n_queued_pages;
> +		list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
> +	}
> +
> +	/* Deferred put outside lock to avoid recursive deadlock */
> +	if (pbo_to_put) {
> +		xe_bo_put(pbo_to_put);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +
> +	if (block) {
> +		struct xe_bo *pbo = ttm_to_xe_bo(tbo);
> +
> +		/*
> +		 * Purge BO containing address - reference held from above.
> +		 * Note: brief window between purge (freeing blocks) and re-reserve
> +		 * below. If another allocation claims the block, buddy_alloc fails
> +		 * and the status will be shown as failed reservation.
> +		 */
> +		ret = xe_ttm_vram_purge_page(xe, pbo);
> +		xe_bo_put(pbo);
> +		if (ret)
> +			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret);
> +	}
> +
> +	scoped_guard(mutex, &vram_mgr->lock) {
> +		ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
> +					      size, size, &nentry->blocks,
> +					      GPU_BUDDY_RANGE_ALLOCATION,
> +					      NULL, &nentry->used_visible_size);
> +		if (ret) {
> +			drm_warn(&xe->drm,
> +				 "Could not reserve page at addr:0x%llx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = XE_PAGE_RESERVE_FAIL;
> +			return ret;
> +		}
> +
> +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> +			if (pos->addr == nentry->addr) {
> +				--vram_mgr->n_queued_pages;
> +				list_del_rcu(&pos->queued_link);
> +				break;
> +			}
> +		}
> +		++vram_mgr->n_offlined_pages;
> +		list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* RAS will send command to FW for offlining page based on ret value */
> +	}
> +	/* Success */
> +	return ret;
> +}
> +
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u64 addr)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr = tile->mem.vram;
> +
> +		if (!vr)
> +			continue;
> +
> +		if (addr >= vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
> +			return vr;
> +
> +		/* CCS, GSM, or DSM — infrastructure zone, needs reset */
> +		if (addr >= (vr->dpa_base + vr->usable_size) &&
> +		    addr < (vr->dpa_base + vr->actual_physical_size))
> +			return NULL;
> +	}
> +
> +	/*
> +	 * Return an explicit error pointer so the caller knows the addr
> +	 * is invalid and should be ignored, NOT SBR.
> +	 */
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +/**
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
> + * @xe: pointer to parent device
> + * @addr: physical faulty address
> + *
> + * Handle the physcial faulty address error on specific tile.
> + *
> + * Returns 0 for success, negative error code otherwise as follow:
> + * * %-EIO - critical BO or address outside any VRAM region; next action is reset.
> + * * %-EOPNOTSUPP - log-only policy or unknown address; no further action.
> + * * %-ENOMEM - allocation failure; next action is reset.
> + * * %-ENXIO - address not found in buddy; no further action.
> + * * %-EEXIST - address already processed; no further action.
> + */
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
> +{
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct xe_vram_region *vr;
> +	struct gpu_buddy *mm;
> +
> +	/* Assert that the address is 4K aligned */
> +	if (WARN_ON_ONCE(!IS_ALIGNED(addr, SZ_4K))) {
> +		drm_err(&xe->drm, "Address %llx is not 4K aligned!\n", addr);
> +		return -EINVAL;
> +	}
> +
> +	vr = xe_ttm_vram_addr_to_region(xe, addr);
> +	if (IS_ERR(vr)) {
> +		/*
> +		 * The addr is outside VRAM and GSM.
> +		 * Log a debug message if needed, and safely exit/ignore.
> +		 */
> +		drm_dbg(&xe->drm, "Address %llx is out of bounds, ignoring fault.\n", addr);
> +		return PTR_ERR(vr);
> +	}
> +	if (!vr) {
> +		drm_err(&xe->drm, "%s:%d GSM addr:%llx error requesting SBR\n",
> +			__func__, __LINE__, addr);
> +		/* Hint System controller driver for reset with -EIO  */
> +		return -EIO;
> +	}
> +	vram_mgr = &vr->ttm;
> +	mm = &vram_mgr->mm;
> +
> +	/* Reserve page at address */
> +	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
> +}
> +EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 87b7fae5edba..d5392beff30c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>   void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>   {

