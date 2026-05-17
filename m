Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773C0CD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FF510E17F;
	Sun, 17 May 2026 09:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwLp5u3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E0C10E17F
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779009265; x=1810545265;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gSuwYKkIK0ZSjK5NIO/DfwgmIS6X7Rw2QbWUVSxGeq4=;
 b=mwLp5u3VRCLH9Gz8ymhMWTffRkfw73/s1SB0g48PuvOBthqurLrbAKZO
 6kCKSn7rDf6gn4km1LneI/rakLHm8GQ+nbA2SDw3VBTONizqFLHC6uvi7
 gcGUseMsIdmyHJqR2ULye7TpRNzDqqiPzFIVLRVgb4r9Q1bF3z1Zhn/qz
 ebE4fSK6ub6Xv79gMaPGDxK7Bp0FLw9EKlY/IUFSu2lN/klkabbi58vfX
 NBa604hn7yck/8BRMYu0cbNRmp8rmsJ2CfmddY8azL5e+Bho3SxVBlCpp
 XYOUI1qQJbHwC0APMpNqknRjwgNfvyEMvSFtFO/s2r0amJKlK5ToNB6aR g==;
X-CSE-ConnectionGUID: vwMjqN3IR82q6oXzXTj9Ow==
X-CSE-MsgGUID: K/ixNwjESHyYOvmIztvosg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90591141"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="90591141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:14:24 -0700
X-CSE-ConnectionGUID: 3jL8lh/rRRijaWa2M0L5Ig==
X-CSE-MsgGUID: eGg8x2PRTRy4Z4eWEZWR9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="234681313"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:14:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:14:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:14:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fb+5xXuZZrNeCjuza9c1FLC7XMVCenjhaovui3xZ4PxZHR4cEDHdV1flGD+iRVbXhX9FcXunMrvbypbu6mi7KhzZB6jcfSUxbsn5LA7aBTqnvPDsZkj93AgkpDdXJc6Cfma7fmh39/CtTj3kg3VsRERnZe9QfkJWcXme6RwDqFmL86BNWfbwBlRCALVdRTtkYHoZzRqWb7UOzIR1Ow48wcjqI5qO53NLYRii9/7/+41n4Ko27Nq0SuLiClBFK7Fxt4W4TypsIMrKk++rtVXTQXQcFSq52nBbbwXO7sIkZ6IyLR8YW8+D7f4ArXhYq+0WNK2nyV+OaYAFfmErjwK2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V/GZbcPvmF86kimDSldHuQu/sfuRdc0otqB5K19t2Y=;
 b=S7PQ9/fu8Unf1U15jXCphvQT6KgM+XmAQE3zGp4rsd5XswYMepvkXyb/Q9I17EfHeecL4jloTnEickZvuNebteDZbxuHQgxy1WCd6K82M7CWYPgaRX2mGQUPDacE9bsfts7UVRgmJAf+AB3K4XVd71JdrSWTCcvUxQKnHiD0gdmsvRbBG1cG0uwzzVA/9ZcLwGapqUFVvPhMIWjJr7rwBcejNw4pP8Ke9UMj6gmOKGk0CNprayD+pZWYTLol7bUJ/bV0eHuf9R6DCFlbZqmD8jN4zhLoQkPFCMiJsxnAluvChLcT0XJMBRlj8gd19hUAozZ4wM70L07Z6/e7yDQ4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 09:14:21 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:14:21 +0000
Message-ID: <ef56343d-7b87-4748-ab2c-f7fd855c42fe@intel.com>
Date: Sun, 17 May 2026 12:14:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/xe/memirq: Use IRQ page from HW engine definition
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: f48490af-f903-4208-7734-08deb3f4ae75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: ChXY9dFS1lVShpLhdOfpZJzSP7mOhcZt0jDsnSuJgrc4nMxRvC9mbR3hzzkm5l7yJHS/VaIz86GfV/xcS4cJI9i7UG21vr+IO1O3Gp+3oMj3DGO3TeiJFgEgfKT2LjXCbo/UcyeMahUcqM3zYC4A5FDjvoknFBbtR/UA+PdtZJGJEjRulrl4LxySGBFwBYYqnEgw3E5LjMlajq8nWPNCuUSXmno8owWBYWaGrp2s+EzE6r4lc8hXqhY495V3mixmroYiPcAesxwMMkZOgsAU3fakrctlJaxp+PQrVTtLrQnJPdSEURPOp/lTO5GmJwP4h/5/Psi/VNP8XgJ/1mjXABa346kw62r6atLToK9FIjFU7ZrAoZJT6/d+bspIXrwxrxbpEHanKlAfUsdDItcRjWyZyoh2lWuqqj1CCfrRG8MjibUzwY1IUXQ+F8N8Aem0w8iBBWiP2tPNhoFBGXR1vC42w78Bv+D2viu2TXJaL2ll/kmD25+gA//ojEgnF7uvz6opknN0g7TT+aFw2gdzc5Aaj9Xvldwp3rphwFiC/Fm952Dmdo+Hu1Dpa9QcZdcHEKNU0FglvOE0CMIpZUXpdZiPNvyQ4fBrZxFoRwwIi2XxTww8omS86UEoY8peapKsExpRWC4R4SzhzUo2ePInMRgtsIAvlSm7O5dvGzdu0D4RpfGgMHghNkIegdyxX8Qa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxuTUtONlYxMTd2WWFoNGJ0Wm5HK1BHb1JyVERwS1dNZEJZdzA1VkdDdisw?=
 =?utf-8?B?c3Y2ZXB6OHh3VUFtL2lHZ0wwbG9TMkJCVTIybVJGbUJsUGxJTm8vUWVucGYv?=
 =?utf-8?B?dTZRZUpQTzlUTnljRUJWTCtBQnRrVW5WZGV2cDRnaUh4ODdTbzlBRlhZV256?=
 =?utf-8?B?aGFsRGcxN2UrWFJaUVF3UmZpTTlNd0Q1bUlsdS9zb0dYQy8zUGl5L2xWaEZF?=
 =?utf-8?B?dVNlTld1NVBVUCt2K1AzcXBhZ1Q5MDZaMGwzVVhtRld2T1FWZHBGKytOK3Bl?=
 =?utf-8?B?bkFvQnNhTldYYzEzUkdzSlBldlBCZndFQm9FWG5nd3lwOGRqVEY4OXR4RFhQ?=
 =?utf-8?B?V2piMGhqdE9ZRE9BRTY3UzFudEplZzJhbDVLZ2dRcVNvejZ0RlJHV2pOUEY1?=
 =?utf-8?B?OE5uSC8vb3U3TTIrKy9QTXJzQVJzTmtraCswQWVDam1ZMkpjRHBUKzZhVXdG?=
 =?utf-8?B?ZWo4ZVR0VnhEdXNpY1hxbklmS0dUdVd1eVIyTnN0d2JNNTNuSkw5dlRyUEti?=
 =?utf-8?B?RzN4RlphWkIwNXJJSmZ4U2lScFpnK0hTbjhxWXdQVXl1anUvM2JJOHYxdDFl?=
 =?utf-8?B?TnNaMVIzdFNDdlF2c1FlVUFMOGJ4VzlsNVArTXRUWkdla0hxUUZtQVl5OGNz?=
 =?utf-8?B?Z09tMlUzanlVZHFHcDk0THV1UzlmU1RRa3ZKYkxxb21tbnlQd2FzRXlUanls?=
 =?utf-8?B?Tk5CdTlxSVNxTkhaczRveVhDQndyaVM1Y1JBUEdPc0hsMFJZL292VkdyTFJZ?=
 =?utf-8?B?L25NeGU1aHQ0b0xhM01iMk5tMFkxTC9GcHd4Q09CdkVuZFQyOFExQWFiWlM0?=
 =?utf-8?B?N0h2cy9oZ080czN4NVNKTnRmY2gwRklXK1FJbzh1MXZ2WlNVaDBBMzhmZ3Fu?=
 =?utf-8?B?WHY5TEtsTSthTFlPZnhqK1ZVbTI5K3V5MlRtYUNHQjduNnhLbFo5L1B3WnVY?=
 =?utf-8?B?SlcvWTdoc3Y2QTEydE51emNNeFpRYjFHQTJTVmErbGVFaXhvemZDaDBkMzl5?=
 =?utf-8?B?dzR5MDdUVkNwTzlSY01tT3RPZFdraTVkeVdDQWJ0MFB1Q24vVFRCZEl3TVd0?=
 =?utf-8?B?TGdUM0ZYeU1CSXlIbVE1aXRkMnA5ajJqNFIwb2lPKzB6YkJpNGk5TkpIU1c5?=
 =?utf-8?B?WDN1Ui8rWkFIcWkzc1YzOVkydTBEUkVEeVpjdmpRaUJOTUhTN2NsYmk4WmM5?=
 =?utf-8?B?VVBkZW1KbnNTM3pPcTNFdUo4eldhSkc0ejlKM21aR2JmMXVQR2RhMFI2Wkkr?=
 =?utf-8?B?TEJGMUxPVCsrbHhQQzU2YUtPOWNhOEt3RmlGQkFoc3ZscmhudW11b3AzZC81?=
 =?utf-8?B?ZkpoSVNuWnJDN1J3Wi92YUxJNTliekc0TjRjRVlHcVhCZWlYVWl5OHliZDhF?=
 =?utf-8?B?cTlDU2lleWZEMkZJd2RxeXlaQ09EeU1nalYxcURjYkdDMzZtWE5lZG94NWov?=
 =?utf-8?B?OWdwNWpKbEE0Z3lzUlZFU2lHelZNaDFpc0hZNzY4NVZwT3dmSEhpZ2swVFhw?=
 =?utf-8?B?cTNXWmJWVUlmdGIvUUlRaERKcW5VSGNPYzJseElKTGh6UFVUbm5La3BBNTVU?=
 =?utf-8?B?Wkd2WUZhWHhEdDZVSkVIZkFzazVlRGtJWlRXbTdHZTR4WUE0OWxzN1I3VnJi?=
 =?utf-8?B?RzQzcnZPZjR2NmZJUmlqUDBYbFd5RXVnOTVwdDdRUTh3L0NzYzdOQXEvR1Fy?=
 =?utf-8?B?ekJnOVRSMFNtWTBZRXY2OXJPN0VaZkZmOTIyNXlIandkSk1seFdQQTQ5OHMx?=
 =?utf-8?B?TituZThxVXJ2eFJkY2NxcmRxMlJ1TUhXY1kxa3VrckRRb1Uvb1pNMVNPM1R2?=
 =?utf-8?B?c2Yyb0tadkxWRC96eFVZRUNhSGpwUE52SVpzaC9veGFSUGVVMTJrRGNMeVVp?=
 =?utf-8?B?Y0lHb2RlaHh4bHRGV21RZ2FpS0JVOUpqMjFZbHRDeGNDVk4yMEhvdlVqS3J0?=
 =?utf-8?B?Wmx2RlhpdHFPQ21GeWU5a29FWWV3QW55cUtiSnFReFp5OGthRDF3QkcvNG9D?=
 =?utf-8?B?cnVoU1Vib3NMLzFwTk8yZ2ZiNEpJaGc1Z0pEQWZ6TXJ4azRaVGpNWkNXNnJD?=
 =?utf-8?B?UjBZa1hxaFF2OElRY244THpMS0wzdC9SVnk5V1huLzVWb2lPS0tNald5SGEy?=
 =?utf-8?B?WWU3REdpQ21aRVUxSWFJRmplVFZlcjUxRG5GeGQrNENQMXdYa09RVC9pL0w4?=
 =?utf-8?B?Q2VNWjU5U2NEVnc4YlpGUkJTZGtCUlkrNWxGV2YyUWdXY2duK3cxN1VUSFVp?=
 =?utf-8?B?WmltMDIyUUtVWkR6eDNpUnh0NXliSlF2Qy9pMWhUR21hdEE3Y3lQbmZXeGc0?=
 =?utf-8?B?ZEtOL0NHYndsd2dlbXBwZUR4UjBNdXcwNWd2Q09tK0tpN2RtbDVoZz09?=
X-Exchange-RoutingPolicyChecked: RCkgiLrAYURVA3f+0jWyeYjYybmcVS2pJ+65H6J0+yCQZasxgjvz4BONwPUWTvtb9itM97GsK6E9LfTG7rDiaLj+vLc9F/HV8fR3vMWyU11jCnS4ECDhXGWmudPnaCVi94UjSJGrmDkv4UXyqoJ8luoNUt3aubMSogClCNQY2iSSsHrsuq8/STSQPhFJi2gTlb2Ov+MoMiWxjMycK8DbHSEq+JDDVTbuSPb/mgK5vIr+Y/Wgpo0Kl/bilg0TTl2HAwq4ujNqE2XViEdmfirC8w4dfd4BrdvR6nZGgBpfMRIqAfkvmsCufT9GRfRjU8Y6MbBoQ6ZTvc76AJdfAHugXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f48490af-f903-4208-7734-08deb3f4ae75
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:14:21.6496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNTANiEwdbe8EsRSKSETpHzGsF6aE4aKh+l321Hkv6nDMvDk/8A1Am79Flxt9bwsw35QKYas/YSLnRNibYJF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> We can now drop repeated calculations of the actual IRQ page used
> by the engines from our memory based interrupt handler and other
> functions.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 38 +++++++++-------------------------
>  1 file changed, 10 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 6d27102b8011..285fffea62d8 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -263,15 +263,6 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  	return 0;
>  }
>  
> -static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
> -{
> -	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
> -	memirq_assert(memirq, memirq->bo);
> -
> -	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
> -}
> -
>  /**
>   * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
>   * @memirq: the &xe_memirq to query
> @@ -286,16 +277,7 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
>  	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
>  
> -	return __memirq_source_page(memirq, hwe->instance);
> -}
> -
> -static u32 __memirq_status_page(struct xe_memirq *memirq, u16 instance)
> -{
> -	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
> -	memirq_assert(memirq, memirq->bo);
> -
> -	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(hwe->irq_page);
>  }
>  
>  /**
> @@ -312,7 +294,7 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
>  	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
>  
> -	return __memirq_status_page(memirq, hwe->instance);
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(hwe->irq_page);
>  }
>  
>  /**
> @@ -500,16 +482,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>   */
>  void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
> -	u16 offset = hwe->irq_offset;
> -	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
> -	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> -							    XE_MEMIRQ_SOURCE_OFFSET(instance));
> +	struct iosys_map source =
> +		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +				      XE_MEMIRQ_SOURCE_OFFSET(hwe->irq_page));
>  
> -	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
> -		struct iosys_map status_offset =
> +	if (memirq_received(memirq, &source, hwe->irq_offset, "SRC")) {
> +		struct iosys_map status =
>  			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> -					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
> -		memirq_dispatch_engine(memirq, &status_offset, hwe);
> +					      XE_MEMIRQ_VECTOR_OFFSET(hwe->irq_page,
> +								      hwe->irq_offset));
> +		memirq_dispatch_engine(memirq, &status, hwe);
>  	}
>  }
>  


