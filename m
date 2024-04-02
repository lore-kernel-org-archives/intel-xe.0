Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D414C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 13:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2800810E509;
	Tue,  2 Apr 2024 13:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4XqKrAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC510E509
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712065958; x=1743601958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0BmowuIl5s9/HPPT+NaVpnl/ZrQbnuuZLs7D2lEdWl0=;
 b=b4XqKrAEPh/0TquZ6/uKL46TAEvmXfAvrAi3w3/DgW6sr1iVe1CMOMHE
 Sq4TvwEsRRNfZEgRHYibxBOUP8P0TgAV/BeqdIR0co7tNIMEy98efBgXe
 w63fNzKQvH5+aY4vxyNCGQllmMT/z6uuabAHqvhpxAFR8HSTty6cN1QXL
 fFOw4TsJWguALfc2uAX4lyTDZ8YWvDIrtqQq/Tt2O+zFZgletV2X3RmF8
 HIrjOjEVSr3LzWOP4xvqEtAodN4lCAtCt2y7q+YYwFnWxRsgZRyohehhf
 ogf3Ad/0rpPQaom0eYwM/zugird+LcMG1MiU6ZCaaFO6IUTd4saZS08st g==;
X-CSE-ConnectionGUID: 2WtHj28YTniWONx5PiffTQ==
X-CSE-MsgGUID: 5xbMxjq8SC6190ArK/eezg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7391314"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7391314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 06:52:37 -0700
X-CSE-ConnectionGUID: s3BngdcoTNqaheKMRYtz8w==
X-CSE-MsgGUID: shxGggBiS3C2zV5I5+MZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="17974548"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 06:52:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 06:52:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 06:52:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 06:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOGjdQesugtF51NC+MfTflfYmlNI5i9X+YbkH66kyn0+To8p4HXbqZxnqsH0vf6ECcTikb/pUjLls2cYy2U/ApJxfnuJDKRKVasAwU3x7ArVLbAvhLR/JOjsVa5A3002zZmqGDgN/NE80gV10uX/Eppz8uOxqvXCo2pjcqImMdVnu0OBrGtMlt7zEMJHPnAqMNaXDDJC3bQ3Aa61ACZxRqH7/txOsLL5L70JycKeb7Fx1ZBZCHqD52HC2W97yQ8HQ7CRoUPAN5xSDW8RtmQk5NUWE0TubW8Prk1npWMm/CJnexqAiIs6qCqHATjxnI+t5yHYytVej4Ko2p5dlvjnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d45PJlAlAVydQRu4CicgLm2mJiLSnalx7Oyp2Cj90I=;
 b=Vc1BN53XlRkvICmZlmpxoqZgltFo5kPRsBE2ZUFrAjCbfDO3q37cavEGeFROOGJ18qjy2tKlK5huYh2pREwF512Lfk0xB17uxrGEobF1mJME/6SbshZJQggWbfCZpbNHudEt8k4IsGobGLON2p/IQnX6Odu73DrcjLzJvcuPVRIJOnL//52KWTobpKLr4sAuwav172ZONU2fajOYcEUYYmySDSUqQGKiIy0EFx8psMgJWL4KOQsVWy/GWLKw9jh9PS8Ngm0KARqoRBG0iG710ms+BwOB7PRS2vMzdHr4/Z6R0ueW4e7fcIe7+llH5XfN0KgHeXL4PxBBrJvHjuvPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4557.namprd11.prod.outlook.com (2603:10b6:806:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 13:52:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:52:34 +0000
Date: Tue, 2 Apr 2024 06:52:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 04/11] drm/xe/bmg: Add BMG mocs table
Message-ID: <20240402135231.GC6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-5-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-5-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4557:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /dMJviKmZa7wknn0QZuH8oSdTJhDdTCze5Sn26jUE6ZL/lxg1G4bp3+PS1TO5MgsOL1JnGgnBM7298izCkkDL3c2y6bfZ6Uqv1KkCx24lEoI8GJVCurEf2QJGv7LMfF17JrehVUoCe87wFITxOx2+QQNufRthYm06SEQtqNaxQmcsqJ8Kzt794+O5LDKxtaTA7o+dvuRE1dLDm36WClZWjTy+oQum9xX5VJQvMXtrYSBfnM+YIQ81gboXOkjMswtKvS9WEtcjO/6hV8w/iTt4xtCMB7nryT1X/Hbfp7/MwQ7wF2ePUafl5X5ER1oy1ZImB1ncL7qUxf8+K8BC5ry1k7ojmQUcy3cTgWueNRLa0fg7RXmgdLXtSXlvSn6+XzVwUIkCMKy0ZaG0HkwTwfls6rjTvDJQL0LpBcD59mqXqVhPyXt9TCE75+0pK34Y/wsW7uAFXjG29hZcgOzgJ97ScOcdZwZEpLuMpR9mYrfFb4T0d3qOy7+9VLFiyCZNSeTJENaDI7N/6nEtm/fHGY0aB4q+uL8v8bhP0Uc4/lbdb97ZKtbgZ72OhCaaYkB060qSfwq4lPjOuSs+RTXXd5XrQhx1g6mgfF67TsqQZSDwnajVkdrv+kIZgTkY1/NN50fxdIag+cwLJVZ+Gs0qfnt2NFRK4Ud15aCrauAMqaKq3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pV4DlJLpMPNZ6DJFpHvOOK/dt27GeJQmSGpR4KI4lw8U76zxNxiS5OyeviUt?=
 =?us-ascii?Q?218EyZev/Y08IR7DWM920Zo0P2ni2MxV35zyid/gwxxYIqioZV0tgZeohbHQ?=
 =?us-ascii?Q?3Ey6Tyc221AMAzOkiapvFMcofYT75mlENd959jFre7SQR3LdhcXOM2NNpFfw?=
 =?us-ascii?Q?Bt0Ie5ixtxOSSWux0xH/OZe+f0uLoQUQUPXaKWu9TwEv7Q/P3BTvBU8fpsRR?=
 =?us-ascii?Q?Ig0khdGRt2nhcLgzB4xtDCH2YHj0QTYrD3lfHpnRybGo4XjECkNmFqWz89Yr?=
 =?us-ascii?Q?z6hvpGgIedTcixLEAZIvoWSZR1pzHvw0prJ4QM6O2LUPej9Fvv3l7QvJxz86?=
 =?us-ascii?Q?MMpGpPjusGlyFOOxujb4GAX1q+o1Q11K0CBwTLitN0UfeLC071EikR+J83BM?=
 =?us-ascii?Q?C1uwFKUr4rl49GDoSwODlX3GM0s1iOnZs/ZAYBM4enxmEhemkNti8PDcxCnQ?=
 =?us-ascii?Q?qSG2vZtGt0b7aJjLSul078YbLsFuOZA4tUZPKE5oJN4Uk7syl+Rc3y6FiWbp?=
 =?us-ascii?Q?D79XxezFHnvahHGhA7FaeleHpMR2DqKkDn4XdMWMxYECbpgXlnvw93AEmAIe?=
 =?us-ascii?Q?LdcGGAAwyW5OVS0WxAEQCD9oYWI6DgAG4uozhtLP7xUVXAYKagGS7d90UloI?=
 =?us-ascii?Q?G0FNN9FTxzfW4VHtktFKZ68qqD94iMJtCsirt9eKf9zu04DrIh3vK47NMej1?=
 =?us-ascii?Q?dlp7I4QJs7z5C8OgWah7HlxI+2D/D7Lh/Eqe1cHvR6PJcon8TyLYWMS4ISf/?=
 =?us-ascii?Q?oNWLuhwVP8ylxj6fC1hy+5/6Qb+aXeKmtYp9jEMbIqqicH9sOrXz2e7QVbCo?=
 =?us-ascii?Q?/GZfwF1xLoxZ1w+khxND894RsQBDwNcG5mq+i3JbnTsy7Ulk2WIbsAbRB9xA?=
 =?us-ascii?Q?i7zXEynQhotzx8KjPA2So51+vstwRf96aw3qQOUmQkGQv6SYbOHulJIawL9/?=
 =?us-ascii?Q?1YZI+a17b9JhBMekbFAB0ONpSYv4782HTh6oBVDc+a97wZ4He5f6Gb0eN/lI?=
 =?us-ascii?Q?d1+v6xKwlghWrmUVMCUjunCwUUDzl0a/G+0Xq8DD6l7ktMJg19ftJxBnNhGI?=
 =?us-ascii?Q?tNOwQJxnbHO1PXqX5smg+g6vDzqteFZU7C4JG7yRJWxdlHEiKB/tOCNngUm0?=
 =?us-ascii?Q?kn4DowTjpGNknSugy8pkiG9Bv05+XDfnGxmTfEXXGNaJEHeM3/PU3rtKfwcc?=
 =?us-ascii?Q?ksC7B2z9ycMxc2bj7KDVLbfw/51FRfkNchi7K//eIK4EYVEa5X2VTwuN0nwT?=
 =?us-ascii?Q?f6ol9hZl1xp49xsbvuY+tvmvie4MVvKGKuoE3JnLVUfIh0pyaS8MgRmcwio9?=
 =?us-ascii?Q?VcsnrGbrjKP1jQknaIVJJ6GGaz1zVB+dMJyXgXaQHu7WEb9SMlBtF7H/sKdk?=
 =?us-ascii?Q?kTtai9M7REv9/0f+WqyrgAU/zXFmtUOk/nqnj8Pzb8NjdL79M8eUQevQddP7?=
 =?us-ascii?Q?igJFroeaokLcqgzgV/Qo/zkD97my00yWLupnQ3I/Jej8LV06m1c8J8HIm91J?=
 =?us-ascii?Q?pgufjv+632npPRGjUqB8ioJrhWXVdPQgm3roBVJebvdBxc5gteevUsn6JgGG?=
 =?us-ascii?Q?5MztegJRU/upnKetSglcdh30dpqC8jqwym3SeGoofDvKyY+zXU+xjCpihwpG?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b1d977-dc6c-452f-3dcd-08dc531c25b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:52:33.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gB7GxU6I+CG2Izz99KjC4qWkmp9G9FrSQ3afsEp0TQqgeCU2A7/4tYNLXbwo/4sYFaZEWMy2BcCf2iZZmfErQztKNu0EIyVUgZ0F7dVoLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4557
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

On Tue, Apr 02, 2024 at 06:17:17PM +0530, Balasubramani Vivekanandan wrote:
> BMG uses the same MOCS table as LNL.
> 
> Bpsec: 71582
> CC: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index bff659d20062..4f836aeeabff 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -375,6 +375,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  
>  	switch (xe->info.platform) {
>  	case XE_LUNARLAKE:
> +	case XE_BATTLEMAGE:
>  		info->size = ARRAY_SIZE(xe2_mocs_table);
>  		info->table = xe2_mocs_table;
>  		info->n_entries = XE2_NUM_MOCS_ENTRIES;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
