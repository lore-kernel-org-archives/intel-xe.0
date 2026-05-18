Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FF6CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 21:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537D410E8EA;
	Mon, 18 May 2026 21:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEoiCNQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B0310E8EA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779140023; x=1810676023;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=PMwhYsClBQpsZVffBveEFcES3kXJwecSQjJqO66Qx6U=;
 b=KEoiCNQN33ZGHceU1j4uJJIQEoWxDlq0fYhPXwfSSr7E0dEn4NMm4JCM
 F/HJ1V8AF7fyySUvaxTTLUzmozfEEMU9BniVb0/XWLKpnzplmqDbVbpj9
 f3FqIHlYrxPDv5um/zUmCMyxUXPbAv+m8wh9+ZNgH3EiRfAeglF8Yj5mK
 c97g6qewhEEEEI/UhXCQyKp9Zsl+N9Td2Qm63Fl5FvRVzM449R/4R5MzL
 gvDvGDwrAjX04bg2H3GfeLGgSUTCjRlB9gwPIpsAzXTD11fwFWXsB4vUw
 xbVrb/pfbkQcgwYaCDV1Xq9ZASFyQK8CqOOJH/bZluXDkkz8I92pvcEF8 A==;
X-CSE-ConnectionGUID: bqg3kQj/QTOlOfS8OccV6Q==
X-CSE-MsgGUID: Bd9g367lThynZLXGZjK9mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79723879"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79723879"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 14:33:42 -0700
X-CSE-ConnectionGUID: CYJoOA7HTz+TOn+VjmX6Bw==
X-CSE-MsgGUID: rWTJvHL6Q/yH4UGqGR38ow==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 14:33:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 14:33:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 14:33:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 14:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsWHhjNew65BKw0VVbJVw6hLvDVs44ahuUdPOVWxdlZNPC6930+k85GbAdDo0/pJK8cEJXRiwqQNHDxu0kiqdsynzzPo3JUZK7jqEzun7FD01bGBNZ+i8QkAHbbFBoiibpoV39XKa/3qCSkJzK0PjsytiTGSON0+hpkZxacqgDPnYVv6n81Qw8ZP5Kq5NL3hNnsvSR2sb6NB6WyrRb2EH2JstzRB9+AiFj0Vk1YLdHbUklPRQYn3vYGTHk3je6v3BDQ4RIPXFrWsYX990dBMG4MGUmgTqT/nOiyoIZAzPBz08LhCz89YcVCC36lWJYkbKm3otkIdi/u7H81Ie/7ezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rvJG0aUCqk4ILqVDXYGQOu7cHfoC8u9lFETF1r/aio=;
 b=YjbEDV2YfNnOKKKiF05n3P+WDDjrdeVWIzntSdZlgO4bQXHsnwL4mXn43Zyoy8V6zDtwjpbWaVQ9SufQMmaTGYwZe9UvFdOiz1NXGHbfCD4wRpHW2x0XnNMmFgK61neE+I25oNusOCsvwUtuDrmV4lyGYWvMjh6PsFGhF/XwijhYIHI/VpTTVPjXGO3noRufdpNIlQO9jT9XZQD43Ch6HD7l7Tu1SOKDHGAv4z1Tp0e103prqkmF1pDGeY6lPikpaAism/sSdF9hqs3+w2kKPsI4m/oMPZD0A7j4l6twhQi5mmFL8kLFyUgwnOboKWKuN7ujy/LYqYfZpSx0YKFCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPFA92F35354.namprd11.prod.outlook.com (2603:10b6:f:fc02::44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 21:33:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 21:33:36 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
In-Reply-To: <DS0PR11MB87180B8324EF263C8F688F0D81042@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
 <CH0PR11MB5564D434BB05246B60A8568F98072@CH0PR11MB5564.namprd11.prod.outlook.com>
 <DS0PR11MB87180B8324EF263C8F688F0D81042@DS0PR11MB8718.namprd11.prod.outlook.com>
Date: Mon, 18 May 2026 18:33:31 -0300
Message-ID: <87cxys9zdg.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPFA92F35354:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbc4556-f6d8-4a8f-c38a-08deb5251e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799003|22082099003|56012099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: nzgLVVYHKyhCCWWoHH/HxqRQ7KoengGvIitXtufj3/tm116GCW74u2+7FoPtlB+nsYtDu6ubn90XIfo59kysg059KvUG1Oj49kOcTT71I3SKQVmO/CofXzLrthQTgpAjXJSE36uiSXtN9V52txmEPlsWsPYtefn77oVFgGCVewMcv6oH5OWi5oDQ8S1w/4vW5agt9+F48Ngz0al5HbFPsTYD4W2KKrE2KkSNHcOlAl8FL0F/sBDp7Y/KIgw6cdAge9psLX9UYaE+pbk3FpGeXIhv7oNvkG/DE6dGvMr1nOsn1MukikevRJTYXxgxtYf9u8i9X/xk38HHNzdhH5LrYPINQlgHFdqgEn20Y8ZY43zJkcO+n0yumXxHKm2Ej3gEzoeQUNt0KStvhw6ge5JgjHhHBjhthuj8bGbLoTqFKELRXgjun/2C1Vh3ltv/0yQXsRg+QwiT/T6L282mY3ZdRJfDApBdNH2IMo8HTJsgf1BGq1tI1ySbIyWfqjQZE4099G2RXCJtt3FTp4+SvVweNQHZtGtEJ4el1GLhqWW2KpY0VJlF47ZwCFzQe7uWSNu33gVZEx4FNCpZ1Sdog/g3z5IxCQymdajU8CO36ZogqoHFWeUJ2aV4t0FZv/+vSjY1uJ7bityvj6cj0XWGWPrpO+Mvgvq+dJ5+kTtaNIkctPpgqSNRiUEolADZPWCqyzw5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799003)(22082099003)(56012099003)(18002099003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wym40iGY9MZJ51DrVVuB0YNwpSQAC3tBWU3vWDNFVfENCXAKMwE50qhYhloi?=
 =?us-ascii?Q?V1W07s1klaDp4J2NAEPJghHAyqJFcCMJWtZi38heYli4ltxgmGT8xpKXSD6C?=
 =?us-ascii?Q?qu0Zl8GP+4cs7Na43QLprWt5330onR0bka21wm3fZsLdCnSec7Xg96rA0xIR?=
 =?us-ascii?Q?nfG2om/ISjMbl1a1KMFmC3l50eMzzxFeOCfQXxS48Kd40Kk3kxVqV3DRSWVt?=
 =?us-ascii?Q?c42Sz5M/eiqpUaH+Hze0gZTQzOdxB6ZJ2k9HaxVPbS8QXKur9xILlnaOgydq?=
 =?us-ascii?Q?29XI45MjkyExbiybu85W08sxWTIGg8smbmxpG3lD7RYFRC167/SMrbJHEP9A?=
 =?us-ascii?Q?ZhWy2adZ0LK1xfYXPkoOFtz0R7MrKWUFpzSRFUTfFxQcHR7quT+SPHx/NIWt?=
 =?us-ascii?Q?l1h8wdshXljg3Bmkyxbg+l/vYc5kKwV2EUu1qHbvszdhapaJdoYxpBrgHxT4?=
 =?us-ascii?Q?OrU0BXlxISPwD7A0+5uZcygckhSf0MzlvIIQJGYQaTfKua6SMWyrzePhXplo?=
 =?us-ascii?Q?NgARlrUpTaLK0ubaSu1XhBlJkCcAGOj/4TVTY7FNz/jvADzqBnY7nyKcnGh7?=
 =?us-ascii?Q?FGbOkUSbjpAcD7jmRYJ1kxSMdTlqHOw7/Ft9eFkEsAktqU4Hu7bhGHbinkem?=
 =?us-ascii?Q?vDsy8UMSo5EePniCFSACe1pNUa/+AY6+0G3Rl7SSLjiZbQqwApcoyvWbRbSn?=
 =?us-ascii?Q?vRUfHnddgFzHEp60CuR2/bTKyRD5tLbkFIE/klf4a1QQRZQ5DA2UfePJjEGO?=
 =?us-ascii?Q?AHtWYhKgmYdFIjc7ViGf4TNHrdyqFYqYtdoKb8DlttI1pg5NGZ+vK4E727dP?=
 =?us-ascii?Q?BAGiiUEjlKwAGI3lgriigVnLpXveyssalza0KhSF3N/KKtsxyz/m84g0Q8Da?=
 =?us-ascii?Q?GtMuMcWPP2ka7Cd9idQHWa+lHHrImGMj4+PBYOWf857h064WLh4fp96z34Wm?=
 =?us-ascii?Q?R7EnZ98JVpuNXFiPzcTZPxbXBj8DPN4oEpXg2fBrWGLSXojHtQKvZx007bCN?=
 =?us-ascii?Q?Ozc3jJKw2HSKcXzAdxUds9pWPERa6C8XPq+XzlVwuLxAsZ8YwgWpteyNCIYO?=
 =?us-ascii?Q?33Um0XN2XMFb8yrGlUZSOldxxrBdygHeW26WF1mhTbNkbg1nOto8dsCa9ezk?=
 =?us-ascii?Q?GGnSPFgzO+yIySOs7O0sRjempwAUEU1ETTzA7b38ETJqm59bpgBysh6x5MhM?=
 =?us-ascii?Q?s5owo/QEVa48/WlpXAIEIPxnzbT/SdVmsW70CUD4ZPonXxAzPkdkXW9NCIEl?=
 =?us-ascii?Q?UPJk9L+WkGfnAcZ6v9tbK0kg5Et4UAElGSpIcboKgwLBDuOT55o3MngH3scZ?=
 =?us-ascii?Q?y8NBNh4GEDJCSUppPz6Ugg18URfRxnG3pzoxzfDBIShLB5tdWBrJo11t2w5D?=
 =?us-ascii?Q?chYKv6aTpfVdvaedPMqp9wbFRSti663fo1HGXdWY8CxPNOvwpTDlQTvZ+/Kl?=
 =?us-ascii?Q?F0Imx42cP5m1pcIuSejRVnv2dBNorn4JZC0k6SvO/w01ulU+tjZYxYVUCBc1?=
 =?us-ascii?Q?Ajw3lscvByoaXxEavCa0oOg/CBjP0JyvZjMC+sRwyHZ+wNNCAGdwNz49bYqj?=
 =?us-ascii?Q?7AZMx17WopnfMlk+iM/u/AdjdxPisUcgxlo2h2WgxynD6xYKJgxxPWX0ibh8?=
 =?us-ascii?Q?xF3Nb1d4sT/tIQWkYH5savvddHpk5laT615RUTMtf8rFTdQB/t1ajgTAR2IU?=
 =?us-ascii?Q?nLsQYoNPYD2VITztpP6yA5TYXcSj1bqS4bRCBfMqdgUOMrMRoZxWVsUMud7m?=
 =?us-ascii?Q?oVCOgHAJow=3D=3D?=
X-Exchange-RoutingPolicyChecked: OCznWlVPsRfp+UhkA88tXHe/di/tjJRnW81HxcGPQWVTSSclevjb41ZA0ZujS/bZJB9E5OjbM8ijabiRVWzIQv3od5Q/H5Wrv86gH/ZgFjGbNz5GHldJZpm6SYcAUeUYsJ971L2eo6q2mwJBY2+kLZUt1wr741caFsC2bPWPJunBRARAf0YstrcVSOEhQSiJ18uyS8xvZMSoc31tCsBNWhsf0VFiGhuTKpobnbj7Is6wzaCT7KTGlQmgaVGLLnp+NyR1eSy4rs6qz9750xiZqGJuJZCdw+N0FecGBZGN4TvOvxCruWOLDs20+rnUu6oKioKp3JR7eZoe7vEGEVaReg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbc4556-f6d8-4a8f-c38a-08deb5251e78
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 21:33:36.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av0yBb22IZmr5xM1t9NYuvr6X6IHj2HxXLZ9UUHw/AbpcBs8UPyWZaDSzBt9Uo+G4P9b86bRQMmWemw32fj5MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
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

"Upadhyay, Tejas" <tejas.upadhyay@intel.com> writes:

>> -----Original Message-----
>> From: Girotra, Himanshu <himanshu.girotra@intel.com>
>> Sent: 14 May 2026 17:30
>> To: Sousa, Gustavo <gustavo.sousa@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Sousa, Gustavo
>> <gustavo.sousa@intel.com>
>> Subject: RE: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
>> 
>> 
>> 
>> > -----Original Message-----
>> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> > Gustavo Sousa
>> > Sent: 14 May 2026 00:37
>> > To: intel-xe@lists.freedesktop.org
>> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Sousa, Gustavo
>> > <gustavo.sousa@intel.com>
>> > Subject: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
>> >
>> > We encapsulate the logic to check if the platform has L2 flush
>> > optimization feature in xe_device_is_l2_flush_optimized(), but
>> > guc_ctl_feature_flags() is using an open-coded version of that same type of
>> check.
>> > Fix that by replacing the open-coded check with
>> > xe_device_is_l2_flush_optimized().
>> >
>> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> 
>> Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index
>> > e468b638271b..4023700ff2a9 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -98,7 +98,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>> >  	if (xe_guc_using_main_gamctrl_queues(guc))
>> >  		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>> >
>> > -	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) &&
>> > xe_gt_is_media_type(guc_to_gt(guc)))
>> > +	if (xe_device_is_l2_flush_optimized(xe) &&
>> > +xe_gt_is_media_type(guc_to_gt(guc)))
>> >  		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com> 

Pushed to drm-xe-next. Thanks Himanshu and Tejas for the reviews!

--
Gustavo Sousa

>
> Tejas
>> >
>> >  	return flags;
>> >
>> > ---
>> > base-commit: e54a14bbf920aa5eefc70aba9927482ebe630f8b
>> > change-id:
>> > 20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-
>> > f94e54ef51cb
>> >
>> > Best regards,
>> > --
>> > Gustavo Sousa <gustavo.sousa@intel.com>
