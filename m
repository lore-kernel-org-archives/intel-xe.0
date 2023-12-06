Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E97C10DCE
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 23:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B94810E141;
	Wed,  6 Dec 2023 23:52:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443E810E141
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701906736; x=1733442736;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWMKIMKKPky04Gs69E58ou6utQF+JQa0gKSTU8c8nj8=;
 b=XbdPC1xbBih2a4OppHX5sr9bEoB4bvb25MqE9ou5MV1WQxMaIHey8Vsr
 Ua9+u+5+QmdrYPsb7ZC1D0ZAcdx7/V/qqu/nLDxtrE/NL+u7VzqVDLiMz
 4F5uZ27HVyGkw3UCX5ZkCfOVCfyOVr77uK2YrFPMXe081+ztbzvQa5H3g
 8Umy5aLcM6OEGVbKjj+u79LzK60/xbE8vDD4XHVtcs6c5U48Gbr7+6e8I
 v5t7QLZimFtQOoXFMOpv+xWTRw0k8P8boSWzQAWKDoWPNqJENnXPQpj1w
 gLOuVpEBgDsySVh5UxusTCUcAIew6ltrWOBK64gcx8iyhXiOsRagCmX/6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1030517"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1030517"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837498582"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837498582"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 15:52:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:52:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:52:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 15:52:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 15:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR81KvPEf2mrv2+t8fAzLjtxD4Q6ufGENHeoLtkft/wlu2ASHB4/AZjzGqWcthnc8glCxyJ/hN2bnzqFMU/ocQavK/wVknVlkgQgyzdqujSmIicRDG3Z92g4VUMU4j0kVcO6L00Hg53ph2nShezc1tyvat+iU8KBJSdSiddApvRNwTAaTGVE+jDrBAmkXgBY/GNtvxfk8aBBchKc1wE/g93p9H/74172/f7jKYiKzB+Wna9KF+i0ptgRddlphF+syPHQjOC+9Rd8EAVDEPXTGAtLVbaoRbR0pWOGQt40DwN24c6lB3SSNZGZwYNdVUIA4iBHWtEwOJzCFhY7rtFh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyD4o9KXnu4+Mh0IJ297XD/+fH9TfC+u8efi6hvB+bg=;
 b=ULg9MD2JlgEZHWSIdr6NnXE9HSCcuONTv5EWzzejgJSS7rTAwHpsuEQuQuxv65JaxeNJucbnwq9HbRmBbofD2p9vxQLR80TM0v4r6vL1VqcfuAlhCKtiZ9Yti6jd3+G8OEmW67+3/bIQ3X6vMjeLmoTaMVkV/nUju5Vj+HqWJvXUaN65KoZVCdRdcDMoXSwEFE+uY5GXBxXxhYVr2sEnHBxskv71r2moyJBqNDdce9R4XJLRGGeewmepzpw8/OnQvUsnSVtdBAK0F+8gkDJmecUTIscRz1T0OWhbVcNAgAgHeM0OTb5Eqn/qtPgLRG+izwSTZghgp4+kgyPA1VP+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 6 Dec 2023 23:52:11 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 23:52:11 +0000
Message-ID: <fa85e1ad-e81a-488a-974f-140f06f2136a@intel.com>
Date: Wed, 6 Dec 2023 15:52:10 -0800
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <20231205213659.179813-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20231205213659.179813-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS0PR11MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a21a7e-4eaf-411c-c76f-08dbf6b65d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfFx8rjsfawdaZ8XQJbfzECjWcFkIduzUw0H2OFyrpyF08Os2dKd8IEHwDzlNzkhFagsZphRPbDoEmElrIMKY8eS726Ej6KW5/Cba6cPDrg8GAbQnSONwg6+necUxqaSuhoDsleCJqLK8Kpwpcsg0D81x63CcNbnkxyTijUjrReHVqHHIsemXCDelGHFFCjGcfTCPa6uU+SMEggoekMAypiyDfCmytKjgshIgCkgwR3XC1zwSHgHYP4ComotBWGvWCGjHNzHgZWGGOcIwaH72UghzdNC8ioz1CN61hyuzX7OySNonrlw6IjyuuMAQz0sHtVdBwW+TjVe8wIc3L/RpYzfG4MzvGjQCcYqlcwNQ2ZaXcsdQ7M+guG5xwMktO7uzrsKaJOosYt7HBvRflyuxchPTyhqlbr26OUB1SA8iDVFg9Z1pB3RUn1Hnww5CeeNmHShi0FXuuEllO8fGyAFMQt6j41CwZfCdIAiiR7rMpud7k0wMyF4yMmMhe99yVAK7PItJxxcEBxyRRITISqaQ7h9h+AU1t6z8kXCuD+EA1N0rvFzOKQ1hcouepkBJhwD58BZJzYo2JWuwHLsgtkrJb9ypqbWHMxHjsE5PS4kcuEjNRUrLrA77+XND27YAJ7k+WSKJkTt9nEWHp9tHwqFiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66946007)(54906003)(316002)(66476007)(66556008)(8936002)(8676002)(4326008)(2616005)(5660300002)(53546011)(2906002)(30864003)(6506007)(107886003)(6512007)(6486002)(26005)(478600001)(83380400001)(41300700001)(31686004)(38100700002)(82960400001)(36756003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnlPV2JrUGNKVzBhakFKRkl3RVpxM1YzRVd3RVVUNytzWUwzc0hTT0xZckZW?=
 =?utf-8?B?VnpaQ1N2T2xlakdkUndyMXM3RDF2ZGVhTkFtWUNjUXZ2YzNIczRHNkRVSzU4?=
 =?utf-8?B?U0VyQ0JhRE5BMG9QdXpWY3I0cGVhVzZqa0s0S0hvd0V4Z2JuZHFjYm9WbTh1?=
 =?utf-8?B?ejlmZzhrYXpDTEdkR1JhSkJuM1F3N3FWRGpJNmd2dnp1QlZGV2xtSGtXRGtm?=
 =?utf-8?B?VlRXWTBDZkNJdDB3VlFSRnNwWmhmL1FvYmh0SUE1dVVILzRnOU1Fd095QytP?=
 =?utf-8?B?U3dZVCs2V0lPZDFQWjNmNmNyQ25QYnhxYjFVNTE4UUdoQlRhZ2M1L2hvekEr?=
 =?utf-8?B?SVZxenp1cVE3UUR6OWNhVzZuY3h4ZEdGMVp6YzhGOUhQVmRIbFI1dHlLT1Rk?=
 =?utf-8?B?SGZDWGxBQm1ENTZ3d1lxemoyRUJaYittZ29pSzh0dkY2SWtaUHVQSmZLcEtU?=
 =?utf-8?B?SmZyelp0aDVnU3dXaDVHQ2JTS0FWTUNNWEcwWkljaXRSa0xybTRpcWduOEtC?=
 =?utf-8?B?aUNqeFQvVXRsREdBdUFUTk5zdWNMMllSN0k5UDUra0l4cm1RenI2SWx1eFpu?=
 =?utf-8?B?aTJmTzdRcjRLSkp3NmxBWThPV1B2TXV5VFZ3Q2FLNmU5UlBpa1hqeFB0djhB?=
 =?utf-8?B?ZURwN0pOSmpLY21IUXVrRElRYWhxeUJkZFJnOXVFVTNKc2NMQUNHZ1Ewd0Yy?=
 =?utf-8?B?bk1vL0YzUUo0UDEvMWJNWjVaTThUWTA3RFlhZXZYYi80TitkNVhWUm1kY1RV?=
 =?utf-8?B?WW9JTEpUVFk2S0xxTmRQVkU4TEIxY0I1VEswNTA4NUxMd2YxTEtNbStkRTlT?=
 =?utf-8?B?bVF2Rk1SbEUxbmhBUU5GUHBhcGN0WldWM0tyMWFLR0hVeVljZWk5alc2N1RU?=
 =?utf-8?B?bDJ3Z0tESVY0L2JTbnJVaGxaWTFBaWpHUDMzQ0wrbWRPRk1mMW9DaDZ3MVdq?=
 =?utf-8?B?NDU3UjJGNjNzT2FzWWwwL3U4MmxKVko4SnFwTTMvZnV1RGhMN2x3UjJyaHUx?=
 =?utf-8?B?Wk9SRWVDdG8wcjNFKytsOGM4WFN4bkR0RllINWNLSkZPaXF4aG1reG45SllL?=
 =?utf-8?B?NTZVb0NURzRSWWlGNk84d2RJSzVPV1piVDhJY1hka3JReXdNaUxFMmpYeXRZ?=
 =?utf-8?B?dE9iUkd5RitDVFJ1aGlIc3I5Z1NJa1JkWHZuZmttd2s5T0VhTW9kSUd5UXdp?=
 =?utf-8?B?Z0pWNFh5VUxveGFCMU5INkdYVXFNa3hIVFJLQTRuM3ZzTkNva2VZTld1VlUy?=
 =?utf-8?B?bXREbUoyU1RyUWVpZEIzeG1MTDRjMHdzZVlSUllYSUpFcy9JR0Y3MFlYbFA3?=
 =?utf-8?B?elNBQ25HajdCbUl4K2FRWEpYbzMrM2VoNVhCUlc1TXM5elAvREEvWkp5VXlk?=
 =?utf-8?B?VzVnem9OZGQxVEwvcUVyYnZCTVl2WHd3TzUvZHovcHNWWW56czIzZHcrakFG?=
 =?utf-8?B?aDVvb3BPVzdvMkF6aTdaOTlNSHFGeEM4L1ByY1g1NC9LLzlOZDRINnFKVnND?=
 =?utf-8?B?aGdsZGVoTUNkMm5BYVBaSEVuZmFwemhob3QybkFVK1JIR1kvZkpLd3VOYWhE?=
 =?utf-8?B?a2VuVjNtT0o5Q2EycUpaNzJyYkZkZFpBN1lwbjg5VENMNHNFUHN0ZitwUHBW?=
 =?utf-8?B?dmg5aGhBdlI0dFlBcThzd2NRdjdlWkhZOFNQS0RhSENGMlU4R1JFWDVyalFt?=
 =?utf-8?B?SjZnb1JjaStwdm1iZjhZTG45dzdIZjhXMkRtQ0E4d21KY2lnMFlBajhUSExw?=
 =?utf-8?B?RXlZR2VUdFlDRTBQNWkxWjAvWFdvMXVNbkJpNSt2U3Rac21Lc3lhRVNJVWhG?=
 =?utf-8?B?djZmVDg2bGV3U1JPdHRYalNIMUphamp3aTd6WEJTWkU2YVlMaG5WaEt0U3FP?=
 =?utf-8?B?Vi8vL3lwdXlwR1d3NVRWb3dPV2cweHhpWElBSmdSQzUrb1dsWXpZbm9tbzkz?=
 =?utf-8?B?RTl6bytGM1BSNmlBem11Q0Zqd1RDdXRXOFpNdTUybHJUQVhkbHp6MFBnelYx?=
 =?utf-8?B?bFArVXVwZmlTajEvemgyelYrZGVabTJ0TjVsUlRTS0FLZ0gvU0srcnRXbmZS?=
 =?utf-8?B?RTc2eTNHbi93Y2hzenJsb3Urd1MybEgxdjFybllLT3dGbEN6M2k5a2kzdGlu?=
 =?utf-8?B?NDRJQmRvbXFBR2d6eHBaZ1BFaC9hRElXMzNaNUd5WXpEYjBuYWZzRWk3VXVs?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a21a7e-4eaf-411c-c76f-08dbf6b65d62
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 23:52:11.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebR6kndWVliqQ4fbPwIjqOVoQMYzOhVB0vHzTng44zsrY+NtBGKhQfmuozx7jY+e7F0XmO7NKmFLIbG4B0+rmht44wYDgOlPHWnbLoERj+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Create a xe_gt_freq component
 for raw management and sysfs
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/5/2023 1:36 PM, Rodrigo Vivi wrote:
> Goals of this new xe_gt_freq component:
> 1. Detach sysfs controls and raw freq management from GuC SLPC.
> 2. Create a directory that could later be aligned with devfreq.
> 3. Encapsulate all the freq control in a single directory. Although
>     we only have one freq domain per GT, already start with a numbered
>     freq0 directory so it could be expanded in the future if multiple
>     domains or PLL are needed.
>
> Note: Although in the goal #1, the raw freq management control is
> mentioned, this patch only starts by the sysfs control. The RP freq
> configuration and init freq selection are still under the guc_pc, but
> should be moved to this component in a follow-up patch.
>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile      |   1 +
>   drivers/gpu/drm/xe/xe_gt.c       |   3 +
>   drivers/gpu/drm/xe/xe_gt_freq.c  | 217 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_freq.h  |  13 ++
>   drivers/gpu/drm/xe/xe_gt_types.h |   3 +
>   drivers/gpu/drm/xe/xe_guc_pc.c   | 197 ++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_guc_pc.h   |  10 ++
>   7 files changed, 344 insertions(+), 100 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 87f3fca0c0ee..3bca43cdbe3d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -72,6 +72,7 @@ xe-y += xe_bb.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> +	xe_gt_freq.o \
>   	xe_gt_idle.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a9c71da985d3..38a1e9e80e53 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -23,6 +23,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gsc.h"
>   #include "xe_gt_clock.h"
> +#include "xe_gt_freq.h"
>   #include "xe_gt_idle.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_pagefault.h"
> @@ -494,6 +495,8 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	xe_gt_freq_init(gt);
> +
>   	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>   
>   	err = all_fw_domain_init(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> new file mode 100644
> index 000000000000..769d59441988
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_gt_freq.h"
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_guc_pc.h"
> +
> +/**
> + * DOC: Xe GT Frequency Management
> + *
> + * This component is responsible for the raw GT frequency management, including
> + * the sysfs API.
> + *
> + * Underneath, Xe enables GuC SLPC automated frequency management. GuC is then
> + * allowed to request PCODE any frequency between the Minimum and the Maximum
> + * selected by this component. Furthermore, it is important to highlight that
> + * PCODE is the ultimate decision maker of the actual running frequency, based
> + * on thermal and other running conditions.
> + *
> + * Xe's Freq provides a sysfs API for frequency management:
> + *
> + * device/gt#/freq0/<item>_freq *read-only* files:
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the PCODE.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
> + *
> + * device/gt#/freq0/<item>_freq *read-write* files:
> + * - min_freq: Min frequency request.
> + * - max_freq: Max frequency request.
> + *             If max <= min, then freq_min becomes a fixed frequency request.
> + */
> +
> +static struct xe_guc_pc *
> +dev_to_pc(struct device *dev)
> +{
> +	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
> +}
> +
> +static ssize_t act_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
> +}
> +static DEVICE_ATTR_RO(act_freq);
> +
> +static ssize_t cur_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = xe_guc_pc_get_cur_freq(pc, &freq);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +static DEVICE_ATTR_RO(cur_freq);
> +
> +static ssize_t rp0_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpe_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
> +}
> +static DEVICE_ATTR_RO(rpe_freq);
> +
> +static ssize_t rpn_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static ssize_t min_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = xe_guc_pc_get_min_freq(pc, &freq);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +
> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buff, size_t count)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = kstrtou32(buff, 0, &freq);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_pc_set_min_freq(pc, freq);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(min_freq);
> +
> +static ssize_t max_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = xe_guc_pc_get_max_freq(pc, &freq);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +
> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buff, size_t count)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +	ssize_t ret;
> +
> +	ret = kstrtou32(buff, 0, &freq);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_pc_set_max_freq(pc, freq);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(max_freq);
> +
> +static const struct attribute *freq_attrs[] = {
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
> +	NULL
> +};
> +
> +static void freq_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, freq_attrs);
> +	kobject_put(kobj);
> +}
> +
> +/**
> + * xe_gt_freq_init - Initialize Xe Freq component
> + * @gt: Xe GT object
> + *
> + * It needs to be initialized after GT Sysfs and GuC PC components are ready.
> + */
> +void xe_gt_freq_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
> +	if (!gt->freq) {
> +		drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
> +			 kobject_name(gt->sysfs), err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
> +	if (err) {
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +		kobject_put(gt->freq);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(gt->freq, freq_attrs);
> +	if (err)
> +		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
> +			 kobject_name(gt->freq), err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
> new file mode 100644
> index 000000000000..f3fe3c90491a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_FREQ_H_
> +#define _XE_GT_FREQ_H_
> +
> +struct xe_gt;
> +
> +void xe_gt_freq_init(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index a7263738308e..4d24d0e78e6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -299,6 +299,9 @@ struct xe_gt {
>   	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>   	struct kobject *sysfs;
>   
> +	/** @freq: Main GT freq sysfs control */
> +	struct kobject *freq;
> +
>   	/** @mocs: info */
>   	struct {
>   		/** @uc_index: UC index */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index b1876fbea669..2bdabbab2d7a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -57,19 +57,6 @@
>    *
>    * Xe driver enables SLPC with all of its defaults features and frequency
>    * selection, which varies per platform.
> - * Xe's GuC PC provides a sysfs API for frequency management:
> - *
> - * device/gt#/freq_* *read-only* files:
> - * - act_freq: The actual resolved frequency decided by PCODE.
> - * - cur_freq: The current one requested by GuC PC to the Hardware.
> - * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> - * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> - * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
> - *
> - * device/gt#/freq_* *read-write* files:
> - * - min_freq: GuC PC min request.
> - * - max_freq: GuC PC max request.
> - *             If max <= min, then freq_min becomes a fixed frequency request.
>    *
>    * Render-C States:
>    * ================
> @@ -100,12 +87,6 @@ pc_to_gt(struct xe_guc_pc *pc)
>   	return container_of(pc, struct xe_gt, uc.guc.pc);
>   }
>   
> -static struct xe_guc_pc *
> -dev_to_pc(struct device *dev)
> -{
> -	return &kobj_to_gt(&dev->kobj)->uc.guc.pc;
> -}
> -
>   static struct iosys_map *
>   pc_to_maps(struct xe_guc_pc *pc)
>   {
> @@ -388,14 +369,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>   }
>   
> -static ssize_t act_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_act_freq - Get Actual running frequency
> + * @pc: The GuC PC
> + *
> + * Returns: The Actual running frequency. Which might be 0 if GT is in Render-C sleep state (RC6).
> + */
> +u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>   {
> -	struct kobject *kobj = &dev->kobj;
> -	struct xe_gt *gt = kobj_to_gt(kobj);
> +	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	u32 freq;
> -	ssize_t ret;
>   
>   	xe_device_mem_access_get(gt_to_xe(gt));
>   
> @@ -408,20 +392,25 @@ static ssize_t act_freq_show(struct device *dev,
>   		freq = REG_FIELD_GET(CAGF_MASK, freq);
>   	}
>   
> -	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
> +	freq = decode_freq(freq);
>   
>   	xe_device_mem_access_put(gt_to_xe(gt));
> -	return ret;
> +
> +	return freq;
>   }
> -static DEVICE_ATTR_RO(act_freq);
>   
> -static ssize_t cur_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_cur_freq - Get Current requested frequency
> + * @pc: The GuC PC
> + * @freq: A pointer to a u32 where the freq value will be returned
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
> + */
> +int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct kobject *kobj = &dev->kobj;
> -	struct xe_gt *gt = kobj_to_gt(kobj);
> -	u32 freq;
> -	ssize_t ret;
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret;
>   
>   	xe_device_mem_access_get(gt_to_xe(gt));
>   	/*
> @@ -432,54 +421,67 @@ static ssize_t cur_freq_show(struct device *dev,
>   	if (ret)
>   		goto out;
>   
> -	freq = xe_mmio_read32(gt, RPNSWREQ);
> +	*freq = xe_mmio_read32(gt, RPNSWREQ);
>   
> -	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> -	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
> +	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> +	*freq = decode_freq(*freq);
>   
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   out:
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(cur_freq);
>   
> -static ssize_t rp0_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_rp0_freq - Get the RP0 freq
> + * @pc: The GuC PC
> + *
> + * Returns: RP0 freq.
> + */
> +u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -
> -	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
> +	return pc->rp0_freq;
>   }
> -static DEVICE_ATTR_RO(rp0_freq);
>   
> -static ssize_t rpe_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_rpe_freq - Get the RPe freq
> + * @pc: The GuC PC
> + *
> + * Returns: RPe freq.
> + */
> +u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
>   	xe_device_mem_access_get(xe);
>   	pc_update_rp_values(pc);
>   	xe_device_mem_access_put(xe);
> -	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
> +
> +	return pc->rpe_freq;
>   }
> -static DEVICE_ATTR_RO(rpe_freq);
>   
> -static ssize_t rpn_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_rpn_freq - Get the RPn freq
> + * @pc: The GuC PC
> + *
> + * Returns: RPn freq.
> + */
> +u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -
> -	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
> +	return pc->rpn_freq;
>   }
> -static DEVICE_ATTR_RO(rpn_freq);
>   
> -static ssize_t min_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_min_freq - Get the min operational frequency
> + * @pc: The GuC PC
> + * @freq: A pointer to a u32 where the freq value will be returned
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
> + */
> +int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	ssize_t ret;
>   
> @@ -503,7 +505,7 @@ static ssize_t min_freq_show(struct device *dev,
>   	if (ret)
>   		goto fw;
>   
> -	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
> +	*freq = pc_get_min_freq(pc);
>   
>   fw:
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> @@ -513,17 +515,19 @@ static ssize_t min_freq_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> -			      const char *buff, size_t count)
> +/**
> + * xe_guc_pc_set_min_freq - Set the minimal operational frequency
> + * @pc: The GuC PC
> + * @freq: The selected minimal frequency
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
> + *         -EINVAL if value out of bounds.
> + */
> +int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	u32 freq;
>   	ssize_t ret;
int ret;
>   
> -	ret = kstrtou32(buff, 0, &freq);
> -	if (ret)
> -		return ret;
> -
>   	xe_device_mem_access_get(pc_to_xe(pc));
>   	mutex_lock(&pc->freq_lock);
>   	if (!pc->freq_ready) {
> @@ -541,14 +545,20 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret ?: count;
> +
> +	return ret;
>   }
> -static DEVICE_ATTR_RW(min_freq);
>   
> -static ssize_t max_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +/**
> + * xe_guc_pc_get_max_freq - Get Maximum operational frequency
> + * @pc: The GuC PC
> + * @freq: A pointer to a u32 where the freq value will be returned
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
> + */
> +int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	ssize_t ret;
ret can be int now
>   
>   	xe_device_mem_access_get(pc_to_xe(pc));
> @@ -563,7 +573,7 @@ static ssize_t max_freq_show(struct device *dev,
>   	if (ret)
>   		goto out;
>   
> -	ret = sysfs_emit(buf, "%d\n", pc_get_max_freq(pc));
> +	*freq = pc_get_max_freq(pc);
>   
>   out:
>   	mutex_unlock(&pc->freq_lock);
> @@ -571,17 +581,19 @@ static ssize_t max_freq_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> -			      const char *buff, size_t count)
> +/**
> + * xe_guc_pc_set_max_freq - Set the maximum operational frequency
> + * @pc: The GuC PC
> + * @freq: The selected maximum frequency value
> + *
> + * Returns: 0 on success,
> + *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
> + *         -EINVAL if value out of bounds.
> + */
> +int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	u32 freq;
>   	ssize_t ret;
here as well..
>   
> -	ret = kstrtou32(buff, 0, &freq);
> -	if (ret)
> -		return ret;
> -
>   	xe_device_mem_access_get(pc_to_xe(pc));
>   	mutex_lock(&pc->freq_lock);
>   	if (!pc->freq_ready) {
> @@ -599,9 +611,8 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret ?: count;
> +	return ret;
>   }
> -static DEVICE_ATTR_RW(max_freq);
>   
>   /**
>    * xe_guc_pc_c_status - get the current GT C state
> @@ -666,17 +677,6 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>   	return reg;
>   }
>   
> -static const struct attribute *pc_attrs[] = {
> -	&dev_attr_act_freq.attr,
> -	&dev_attr_cur_freq.attr,
> -	&dev_attr_rp0_freq.attr,
> -	&dev_attr_rpe_freq.attr,
> -	&dev_attr_rpn_freq.attr,
> -	&dev_attr_min_freq.attr,
> -	&dev_attr_max_freq.attr,
> -	NULL
> -};
> -
>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> @@ -952,6 +952,10 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_pc_fini - Finalize GuC's Power Conservation component
> + * @pc: Xe_GuC_PC instance
> + */
>   void xe_guc_pc_fini(struct xe_guc_pc *pc)
>   {
>   	struct xe_device *xe = pc_to_xe(pc);
> @@ -963,7 +967,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>   
>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
> -	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>   	mutex_destroy(&pc->freq_lock);
>   }
>   
> @@ -978,7 +981,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_bo *bo;
>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> -	int err;
>   
>   	if (xe->info.skip_guc_pc)
>   		return 0;
> @@ -992,10 +994,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   		return PTR_ERR(bo);
>   
>   	pc->bo = bo;
> -
> -	err = sysfs_create_files(gt->sysfs, pc_attrs);
> -	if (err)
> -		return err;
> -
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 054788e006f3..cecad8e9300b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -14,6 +14,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>   int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   
> +u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
> +int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> +u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
> +int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
> +int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
> +int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
> +int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
> +

With the minor fixes above,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
