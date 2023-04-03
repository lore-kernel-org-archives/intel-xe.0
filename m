Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98653C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 13:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AD010E155;
	Mon,  3 Apr 2023 13:14:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AE010E155
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680527656; x=1712063656;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MbuqOfVThmrwmFIreZU0UgACxs2fp1w7fSb5srDBQUQ=;
 b=V61gZTf39NLc9GW48v+He9wgAKcHS9HIAeDh+9JnuRFxkfzu5sFHFiV3
 KoUxce4QVlhNz3q1yCs3+emHkcyxxUu3bOIkS02d4krIs+kGu5chICLuW
 0J4bE8T6jKfFNg6lqnJdxzzB8HKEHKqWSrs6xWPZxlWf474yw5x5+D24x
 txj/FebCYbWpRbEEBxVtDhiakOvxNdTo8PEdtvEz6m0R3A+kFCQ/7kbKt
 ilR87VidKvDSAsBF6tp50RKlHTMlyi8t6XD+D5rSwG9jfpCjCNKklkwId
 YROBL44vDyY09NnI0pVdK+SQB8qs6+hir/47gVJQhGtIxrrCvohe1UuZo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322289502"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="322289502"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 06:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="718542298"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="718542298"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 03 Apr 2023 06:14:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 06:14:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 06:14:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 06:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBmhIFT5tUOn9/oWnUjxEa/B4OfTaiT4BL1HD2eWJdlbr5ko2DIUUqplSfqBuEjzSU71oiuEn59+K+fx8UM/dS+vPs/f3wp1deh2G+zoeW9hy5BGUVCx3Y+rXsW4NKhmNUXlYmV9ifSK78rJS0Yyvo7s5wbU+o9QOy1uu/x0nXJDzG0b/kiLVEVGLGmQJFfuIQ71u2B2WYRcZWO5Oc1B4iMF717ENW25UjD5fkh4k9Sem0KiaVVrDg5l67Vouj0rYZgTnotauEYOgy0Fb4481TmtwjGNJo+tqcoxIPqSRyI+9CHeY/82oF6zBfJO/Nasnua38P4nQLMtwqElnd0fOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7/jH0QC+IQYdV5mUN9VWgFi261elHc8aoKTkDZyP8M=;
 b=B2Jx/DSLL2HItNfIwAOWv1/mUQFoMDub5m41qSzF6ZgSJXFnPTNX9Mvh8gMSIqk3rFBMCc8+zprMMUgMG8g1FzDyxDxyUN/pgcxaYWhnmV41k+iC5xMSQeUtGRbqdQfCFvpfuF8PNUgz6t79j4gTXwOFQUWLm+o5vfwXjvACgVdMWg6UGZGBnPrwd2gcsJtlqbptu0r86DMkcYprxz2P5B0GEG/HLQpxeDTaztjrllBXbMyYm3MqMKNqkC39KoEjzlAzTYWl7pYH4xkM6SUMtdONjHceYAfWM4wE2mH68uHEIKFTynHWvbbO2U5UeNiDtUTRVofsOKSZMrjS3lOduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.28; Mon, 3 Apr 2023 13:14:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::87b4:14a9:fca1:cfa2]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::87b4:14a9:fca1:cfa2%7]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 13:14:08 +0000
Date: Mon, 3 Apr 2023 15:14:03 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <2hwjrydixenxvil2ok6cxl2tyeo4bc7eaa34mtoxxzl7yfkc6a@s7opei3pyjro>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401085151.1786204-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: LO6P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 1364e967-61d7-4ae2-cb19-08db34454e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utsUxBaoXW6TGpoGpMvKGfnjKe6dxGmWDk+Q5YGDhLNDuFHDuSKYUbmCQlNL6G8xUYoa7aI88maaoqVTAk52JbD6hOMibphl50NlJRf2vUAnxGlDcD/gF5980osLzUkgVkxzt7V7EoowjzbSHuwEk9apWRruaTYRuClpqeLt0Pm7MzbX9nWIbzWDaAGJH3I0WHKWAaCsR4RKWu9o6GsjdS4vXiGGYE/4FguYyjkdP4IFk16LCIlCTh4AIcrFHXX/SE9ZGziGpRQwyzbQ8FiebzEtNTWj8y/KtiaYQ/zPDD67k5i09pek1s29B7sWTNeG1GOvuPjMQynUOJSG3s8dqkYR77Wnf4Nf1q6vYuFLU9j1p2fm4sAuL7/tNJ3dsWuaDQIaEWSxmNKwwHNNs5J6SjnoDE6Uq7xdFM06IwlyLM6HGpSbYwrgQbAQJ9zuM4yMLBV+C78GY5v0AndBNkERYoyLDhbvz384zVuOdAY3lZy6m/YlHtrKfHNIpVGd/YO3vHtZT+gJbh57fTke/LmQJgkhia02nZlbv5IHOAMd7EDFTMh3vaNFdebgqoRx40m3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(6486002)(83380400001)(26005)(186003)(6666004)(6512007)(9686003)(6506007)(33716001)(41300700001)(86362001)(38100700002)(82960400001)(5660300002)(66946007)(478600001)(66476007)(8676002)(4326008)(66556008)(2906002)(8936002)(6862004)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEZ0eXVQcno5OEpPWFN1L2RuUmxjUld2UnZlcTBSQUtQWVBhbFQ1eVltYXN4?=
 =?utf-8?B?UEQ5aThOeWw5SEJRdEFWUkVpMGdkbVQxYlNLcU5ZMEtuRnM1WUh4am1EbEZW?=
 =?utf-8?B?b3cyWUtjUGtLQnFmb3lCTVFsUzVybHlnNnZ0QXlWcERKMG1XdzlxeDgybFZY?=
 =?utf-8?B?bzhqOFUzTnVOZDNTL29FMXEzUzMvbUI3SGU2eWkrMzlMS3M0L3V1QTk4NmxC?=
 =?utf-8?B?Lys5TnBEQWVEMlErMGhrcXVVYmtOREd5UzMrblZXTGt6WDk2b0lRdkdKNWdv?=
 =?utf-8?B?K0dra3E5SElOYlhjTkdWZE9URTJYblBQOEYwY01VWVU5TVpQTEZQMlFYenIr?=
 =?utf-8?B?Sk96dDNWMG9mQ2QzKzJRcGV6MzVCZmtYcmNoSXlGMnd3UGxzYzMzYnNHSzBu?=
 =?utf-8?B?M1h5S0lVMk5wRDVncTd3YllJUzJBeDJUNkRzaGxnR0dBeVpldDhxaHV5YnIy?=
 =?utf-8?B?b2g1VlRGdGtkMW16YnNncUhrUnd5QXZ4THRjRGlFQXVzU3hQd0I5d0VhVyt4?=
 =?utf-8?B?aVB2N1M2SlMyQU96cHlKN0ZlckM0ZzNZcXJkYWpwc1p1dVpUZ29haUVObml0?=
 =?utf-8?B?RmlOY0txanE5Rm5QdUZjYXpoSHZGeE53SE41WEZiVTZQUnpwOTNFYStwUDNU?=
 =?utf-8?B?MEhtcXNTWGh2RFFqSDhJb2N5OGdMWVNjdVVSdkErYUNoS3k0c0VIc3d5dmgz?=
 =?utf-8?B?YzZZempEN2J6Vm5HR1VQRGZXaTUrTHR4MW1sYVorRzhKK3h6bjJwczBwMFJy?=
 =?utf-8?B?TUJtdnRSWFlBY0htVGxRUjZETlE0a0F6aE9zMXFQTWVQZlJ3MmczaXlvQit4?=
 =?utf-8?B?TGpBMnhaOGRrbDhLc293d2dCTkJEeGFlTzVxYzhPeU5TTUJiRGhEczhyRVZ0?=
 =?utf-8?B?K3NEeGNVa1Ftenk0MVAvL0tJcmVBbjVGNEhxVTFyeS9NdzN1S3hBY0xpdkpT?=
 =?utf-8?B?bjNSeXJwRHRSNUxBWGtabjMwaXdoQWV2VDdVZW56UGNXRjVMcEUzRmJYYmUx?=
 =?utf-8?B?WXNsWG5yTHhQU1V1bzQ2QyswaHMrTndpNzdrTHFBNVRleDhoeG5wc1lVZjh0?=
 =?utf-8?B?MDlKbXVjWDdQRCt2bHRvVmwvRmUvMmZrendGVTZvcC9lc3R1UjZEdVFqQW1o?=
 =?utf-8?B?eDJNSTlISjhQSU1qNk1kbTdLV1dHeFJWblNGME1BV1FBOWo5SW0rWjU3bWM4?=
 =?utf-8?B?SHVGK3YyN2F2T3BoRzA5WEtTNkJwaFkxVjNWdmpvRTg2QXNZSVllVkRGUXNJ?=
 =?utf-8?B?aVptYXAwQUFZRStGWDNyeUs4SGl0cENPOVVOQkRuMjRXUHJRUjhJMDEvSm9x?=
 =?utf-8?B?WVMrWWNvM3JTSVZOTllxblVoYnlzRW1FYWJuU09od01CYThxayttU2s4QnMv?=
 =?utf-8?B?aHh4RDNuMy9HaFhCZ2pJdktjckRCV0ppaDBYb21oR2VadjZkOUVMbjJ4ckI2?=
 =?utf-8?B?UGszdU1waTlDTkE1OTNxcThjOWpTWjNTUmo3dHNVWFhBQWVLakFxcjJ4QmJn?=
 =?utf-8?B?K1JpVEo3NEh3cXlsQjZQcURIcThVSVA1MThiaVQyb0E2bUpmdkpiVFlsWlJj?=
 =?utf-8?B?TTA4OVFFelltUWRPSkE4bWswTCtJQzBTNXI3MmFhMmdhL0l2NjRRS0U5Ym1X?=
 =?utf-8?B?K2x2MTN5QXZjbi93dkF3T3V0Y0g0VVZ2M3g1a2NSUm5NdTI4ZDV2dGxQeEVr?=
 =?utf-8?B?czJJMFZLaEpNNnRoVFk0d3hSU0hMMWxQcU55VHNWQlNWT1k2a250WXFGYzJ2?=
 =?utf-8?B?NEt1bnY3Z0x4RXhmN1hLblMrbjZIK3IzSHFJUDVUbEJZVWZiQURsK0JxV25z?=
 =?utf-8?B?dXkyMnV2L1c1WkxlTlZCa0pabUFHNkdKTjBJU1ZtYXhsVlk1N0JuSWZiM0Nh?=
 =?utf-8?B?OWtncm9WWERxb0NtUHEyMnNQNkdaVEltUFRySkRYNFVMM1hRdzhqQTNnbWV5?=
 =?utf-8?B?M09tQjJJcXlHTVhyRjRTMzRqTDZHRy8rQ0VUT3o0OFpXR3l0blN5OW4xYUk5?=
 =?utf-8?B?a2VxenlPK2pzckVIR3dZYU4yRi9qU29oWEhudFkzNWozL0VnT2FiOS9jRGtv?=
 =?utf-8?B?Ny9lY1dHT3E3UjdyaitSc2VFdDhVVlAvUE01UFd5RVdPS1lvd3IxaGFnUkZu?=
 =?utf-8?B?UTZZTTZoeEVSRmJLTDQrWVQyOVlLUGcydDEvNkhTL1ZvQVJqUFhKZElhWHp3?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1364e967-61d7-4ae2-cb19-08db34454e92
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:14:08.6228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbxh0cybJOb2zt/b6a4wo+kzmdbL0lSwSfGGKxAoHO4zFrk35323ht2xJzXfP2A8CCfN9TvV/TZ30fwJTf+U6jsuAevl2ESq4LGTp4LMoFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/7] drm/xe: Add test for GT workarounds
 and tunings
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:51:51AM -0700, Lucas De Marchi wrote:
> In order to avoid mistakes when populating the workarounds, it's good to
> be able to test if the entries added are all compatible for a certain
> platform. The platform itself is not needed as long as we create fake
> devices with enough configuration for the RTP helpers to process the
> tables.  Common mistakes that can be avoided:
> 
> 	- Entries clashing the bitfields being updated
> 	- Register type being mixed (MCR vs regular / masked vs regular)
> 	- Unexpected errors while adding the reg_sr entry
> 
> To test, inject a duplicate entry in gt_was, but with platform == tigerlake
> rather than the currenct graphics version check:
> 
>        { XE_RTP_NAME("14011059788"),
> 	 XE_RTP_RULES(PLATFORM(TIGERLAKE)),
> 	 XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
>        },
> 
> This produces the following result:
> 
> 	$  ./tools/testing/kunit/kunit.py run \
> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig  xe_wa
> 
> 	[14:18:02] Starting KUnit Kernel (1/1)...
> 	[14:18:02] ============================================================
> 	[14:18:02] ==================== xe_wa (1 subtest) =====================
> 	[14:18:02] ======================== xe_wa_gt  =========================
> 	[14:18:02] [drm:xe_reg_sr_add] *ERROR* Discarding save-restore reg 9550 (clear: 00000200, set: 00000200, masked: no): ret=-22
> 	[14:18:02]     # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:116
> 	[14:18:02]     Expected gt->reg_sr.errors == 0, but
> 	[14:18:02]         gt->reg_sr.errors == 1 (0x1)
> 	[14:18:02] [FAILED] TIGERLAKE (B0)
> 	[14:18:02] [PASSED] DG1 (A0)
> 	[14:18:02] [PASSED] DG1 (B0)
> 	...
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/tests/Makefile     |   3 +-
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 136 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.c        |   3 +
>  drivers/gpu/drm/xe/xe_wa.c            |   2 +
>  4 files changed, 143 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_wa_test.c
