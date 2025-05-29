Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB75C3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 02:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C73210E6DB;
	Thu, 29 May 2025 02:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjmH1+Om";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D4D10E6DB
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748484028; x=1780020028;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EwF3I+22g0VwP65TYBhk+2bXtrkz+q/PDr4abPlZ4gk=;
 b=jjmH1+Omf1po4YXDNwn8JG6ChVWKYtgzgwf/yVDWPIrPir9KpLkczPOF
 vCegqEYxTmA2z0NvXyVnuhLJGshc4VUk/hi/b8q/oS9fk5C0RI0i0jyhp
 GPhxCeQTA4dD9dClFUIQkew53Ad+qWzwyWNai+FPgLGKpZNDZIM0wd5xU
 qxgbKEviU76sgQTg11BNxbMy3Ajo+wHGpk84WFeZxKBf4+TDE1dykK2xG
 gjFbHbj/+7Uy0lZs23weAXrDh9XIfW04tsQSS0elTcR/tkNZPEPB/mDUK
 t2KIJDNXebnDDtFCPiQ3oU6PRETvUjfKIzHTS114Buzn0NC1ut6KbRbSS A==;
X-CSE-ConnectionGUID: 8IJB40PIS+KIKbUjjrJswg==
X-CSE-MsgGUID: 51wB7AtVQyajeohwThz8gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61885300"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61885300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:00:27 -0700
X-CSE-ConnectionGUID: wbQj/XmsQg2oRNn5MJbByg==
X-CSE-MsgGUID: s3A/EtZISxajkwIIaiBZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148554194"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:00:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 19:00:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 19:00:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 19:00:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8iSbg12Eavhf+FyBpDBwCSdHK6Hgg16pnC9/PY2LC73gAJr+xt2q00soHRszPg31ZNbBI1hAIcOSDUgG74IQh7hfOrFFiowAxaIErg8T0ktdHq9aMDeVtlac1BcBw7SlkwotdUs7oR6WD1S9lKB2sPnbkaLh8SSpTqILBXdI9j3SnN018VV3bsriyjTSLmn4Y5aN2DQ0osf215t0sIWt9YmgQ1ZHS8QPN8JoFwnjpYR+DxB5LsU2AG7Sfo2svJmp5E6FKf6EVMk9wjaaKvlHfJGIKzcPPs2trgOImXTYzK04Z8yhl+FQq9kUwA8FvubWEA0Frx38lZ8Egi0TQl0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7w1bRonifIKJrlh8hLq3TEp65kZ46N/fQa8gOoj4eY=;
 b=u6uUFXzYok2Tp/RzSIH8/L4fiF1OUVZQBI5HTdcwk8vxnfL8yDQJsvA5VaMN3rbeXNjUOHU2ZSW6gggQwQ/Jy385WOxXSBGNT3wqb9xIlZ6MtsMp5DuhJRs5vHP0DYfT0ZDwIkiaqO6TQN+7nQI1c7nPMOnsjhrhs/HofeV5EdsmBX9bA8gxSgZNmCNpK4oidY9Ibx9jhkPWpbrFeCItDytVoWmPwOnEuCkC43dKNoI0pPwKgev1YST5nsh8WYcBVgyNqMmbtSRpdp8zgp8fR3noZWvxGh7jyZxt9AnywMstgUvjTEIYkz009O77ic/nkgI73YiZyvVEoDSza2WOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 29 May
 2025 02:00:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 02:00:18 +0000
Date: Wed, 28 May 2025 19:00:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 4/5] drm/xe/configfs: Add attribute to disable engines
Message-ID: <20250529020015.GY6239@mdroper-desk1.amr.corp.intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
 <20250528-engine-mask-v4-4-f4636d2a890a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528-engine-mask-v4-4-f4636d2a890a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4430d3-8c13-409c-752d-08dd9e548ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1t2/xRZfv7rtXIuVYJsKhDrWGozxjRK+gYQ7euQIkxw91qtN9Ca5aq1HT4?=
 =?iso-8859-1?Q?KuQL5cyFM0tp4fRnakI9EZaHrzBx/uD0+xbmLYT/kAui9UmmB/eSP2R8OT?=
 =?iso-8859-1?Q?NaeBQ12LLoijJGlr/edVwBg72RMEpRFlA8DBf1TnvUmixrbefwOK0Vuu47?=
 =?iso-8859-1?Q?tyOxGTXuwHCWQhUqrGjJoggAyoluVAfRhtwMoTVky6R2DfWAqfquxDp1Wh?=
 =?iso-8859-1?Q?fxV+Tp5HUgjc1KTLV5K224i+syQe0zAxiq2742HOQ+kaVs8Y7ja3CMS7Fh?=
 =?iso-8859-1?Q?0N7Or3M4Z3BIXG3Lvt0LFXlLTZsRNf19bnzg+JuqcA3OcDg65rnbwf4NNz?=
 =?iso-8859-1?Q?WIi3Z5WiJ4vZfB+tAPAGLiJb/c2+zOLZqJriWByJtSnyAHqTFx/zw4GT+6?=
 =?iso-8859-1?Q?ZHeBOLc9nzO/ju/qnJqbBVoK5IhwQvtC31QqXUVUdzcDP5ITuhKp5DRYJi?=
 =?iso-8859-1?Q?aNucoHr3cFduKNLjJBL5JgbzeO/DlLY9qapS7zzT6S6KKIT/xZU+qWxtNj?=
 =?iso-8859-1?Q?9pv5CDN9sHd7ueo4EpgkSZLJUOxhVgdt+yDKpWptYUC32MbjAYvqFmPGj/?=
 =?iso-8859-1?Q?rHbM1dhh8C4jH+wC5ncLuBECkutDGgT8sMBsu5/dO6QnjgujVp0w56FAs2?=
 =?iso-8859-1?Q?eAiDOFCVyGxDv9j1e8wBz+DQ9otrrl32bHRI0b5/Yl16FAmRilvs41yynX?=
 =?iso-8859-1?Q?Z4L1grdLGM0OFgQEwxjBt0IH1IjbCJYSl+VdlnL/s++xJejoC06ENpwCVt?=
 =?iso-8859-1?Q?q+e0rQmgxe8u7OH5mVv9O7FD4dO9BUAlJDWQGOxAsu85fzd+zBY8usiVUk?=
 =?iso-8859-1?Q?VGPwBA7Ikf6jog50ng/ktHZcK5804V7NP8x1fdCmJzQqQzotsBgT8teJKf?=
 =?iso-8859-1?Q?3DIBHA7KWcMaLcvF9vHikNGPV0XNhtYDTkhVW63Kd6dDdCnjWaE4QZEQxb?=
 =?iso-8859-1?Q?A+CaqUJ5yJ+Piy6n54TykRtt/8f1J2Rdn/OT7n6fcLMBrq4LGWBrJPtQKv?=
 =?iso-8859-1?Q?sEQdJt/ROrQyF180faKAZjhXF6eqq+UW+6r8o1nkCKWgBaIlvsPFyi8oS6?=
 =?iso-8859-1?Q?GYRX0RTsvHdz7xlAyJyIfFUFqwkzeyaOj4TO9mLE4I7CZXd7DjEEr8mE5Q?=
 =?iso-8859-1?Q?g37cHvz4CzGkgj7inkGoSe/VdnihFl77+T20cUYI6LbrA5wkq21j9Tvy5b?=
 =?iso-8859-1?Q?5Hf2qeWyDMPEMYxVAfy4NrvHtXJCdcmm4cm2Qh4JuodECeYbwcdAkAwIYq?=
 =?iso-8859-1?Q?OlxyjfE8MJzXVzI3l4TmFJNKP5pnSXKGAk3ZjGDng7YXWDFZCUva++Evlx?=
 =?iso-8859-1?Q?xAPhiBcGN5gpKB8ZRVRKIRrxrSO/hv4Ue3Eor6xtEDrV1qaKVPeB/AVWbz?=
 =?iso-8859-1?Q?otzkdQ+DuJHIWBxgU97WTtkgHbtd6gv/Bj8TYF8YWNbYjXsjkTEiiFkoxF?=
 =?iso-8859-1?Q?DSWR9PCiWZjkWIJG8CVBwtndS0GkaXDAf5YAeln6MsRsKULOepEE0UspFD?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SCGL+DmAd7UYs2qVkOi8ETPVG912SbtZ5xeaGq497MSLoITvyhdEwrhmG9?=
 =?iso-8859-1?Q?mfYfDjep8sVWd6EKTMyVlGG+39aquJybF+Lzm9LHxyQuiAV+7CLemBp8OZ?=
 =?iso-8859-1?Q?9gv/yukldYGLUHliUhQlAnZUqdTfkk+kAVbYzGPIBjiPEvvdQlBaCvqaVd?=
 =?iso-8859-1?Q?zQLJ1GSIe1dIqVWrYMvoi4W4jdFaBVwmYJozLfUF4ZJLUzt0hhKEdJNBHu?=
 =?iso-8859-1?Q?0IqZvWrjwELRArFrhHfUswkW+RLpRoZBxsXTJ4mObufAPl3QCf4XqnqYIp?=
 =?iso-8859-1?Q?+Vqn2H+8+l+ev/LaKPAelWrVIOwiAbk2TMPVcsdOD4FpJhzpni0tn9WDPP?=
 =?iso-8859-1?Q?k7a/VyQavjuhEvRxvg49cD5iuGbdbU5uamN7eGPumrLgEzeNoI18QzJ0LZ?=
 =?iso-8859-1?Q?KjOkEf8eGTkCyinkqs9OCmNdSnQNbHP+gL/Yveh37tgLxR3ykRDCbmtshx?=
 =?iso-8859-1?Q?OpJ7KV2Pe5Usrw/O7A8Jum0mNqFVUt2fWuI508GqJTVaW/J/UetH9QPLxz?=
 =?iso-8859-1?Q?TQtOplDXMlJE1S41LJHE5acoaJ3adJ9TZxJmV4ujVSzfCXOa755vgjDC5E?=
 =?iso-8859-1?Q?bh9yM0p89X/74DlfvU/OSVIdklKZSARsb1sENrEGl7hk66DrGt5CtyuNxR?=
 =?iso-8859-1?Q?MrwI8cnGjWhd1pzFIiyh2NumxkAqwkBcjMPulyNeXMgY1naWRcaFxzuYPU?=
 =?iso-8859-1?Q?THmUZmHjF7NUJh/eMySDNzdJjK+E1A+SxXlSDHuYc8UoMEtLBFF4fQSrku?=
 =?iso-8859-1?Q?2AvJyG+byaQSfXdIaDDKYP1PUgUw9B1LtWHPVbbBSTo3o3ID1C8C2FbLI7?=
 =?iso-8859-1?Q?pI9yZmGPwcNDw5YdVm6i5q9KbkKeX5ae70b4BS2CGB10j9QYioeE+TdVwI?=
 =?iso-8859-1?Q?rT0RJiahSmNxAiUEimAVv22BYTaMaM+25tvZb61eiwcdfsE/bhFas+Bxe1?=
 =?iso-8859-1?Q?bhDyCWZcYtQagMKLirEjcDDztQsCT3EoDPWTxURzK32f7cTSA9qDr7Ygx/?=
 =?iso-8859-1?Q?/BBoUHGSJvs45WGsKRgYWEPGRmFoDOli6BMi/IveQdFWMfvCMREgeyHxfN?=
 =?iso-8859-1?Q?pt/xVqy1XdmChcTxcHwYtwiC6UbMg0y0c/HzjHEw7acCqRDG6WUvAW2+zi?=
 =?iso-8859-1?Q?d7N+1xVG8OIndBbKe3EURjqNxjHM+sxma1vSLTqrQhsuRXh8mCkBCW/yhp?=
 =?iso-8859-1?Q?0H2TkvrVH15FYSDRBkX20T9jJ9vg+2sKcohmEtvAmmDBcbSWQ+bS7vONWA?=
 =?iso-8859-1?Q?nHHwss4M+mORjmS3zGP52FiOmDQjkLrdMeHi3iH4sxF2ewejieDKl/n4q+?=
 =?iso-8859-1?Q?zC7klDd7QhhQ9quDhRyz4ezn7479PT1tRl+LMiaHqjwm9Tlgvn/wJ8+dMP?=
 =?iso-8859-1?Q?wOP/Ff+Q4GYKj/+lxQ1vIyb9QXvEo6l3gItfZRBj/ZJdTLs3QnwFDdXmE/?=
 =?iso-8859-1?Q?lr7f4t8KbTOX9xaASEqw6tbtlbC0KAwv0I5C0DAqkgUYQVn34BxyTupSVZ?=
 =?iso-8859-1?Q?RtRcf9f4qteWTPRI0tRDASs/3IDiu4gMa1NJ3w/PSXIBBo9tM2MZB4//Li?=
 =?iso-8859-1?Q?jlgIONhb4AYrgAJc0zh5kvEqv+oovGz5W5MXeEFGrVV7lZUYxGnKTvJEx+?=
 =?iso-8859-1?Q?YAjfdKXk/jhcNz/TGnD9Y/H38zDbjOQ1PWg+7NxV2F8OgeAnPLKAps0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4430d3-8c13-409c-752d-08dd9e548ff5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 02:00:18.8086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V63MfHCNy3wJIGSbth8uHoeAPriIsB5Fax6uMszQoposGNv2My1ncam/mpIfg3Chc6v0JnyfmNhIVzGV9c+V6EoT/KSABXAyZj7ePKnJXSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Wed, May 28, 2025 at 02:54:07PM -0700, Lucas De Marchi wrote:
> Add the userspace interface to load the driver with fewer engines.
> The syntax is to just echo the engine names to a file in configfs, like
> below:
> 
> 	echo 'rcs0,bcs0' > /sys/kernel/config/xe/<bdf>/engine_allowed
> 
> With that engines other than rcs0 and bcs0 will not be enabled. To
> enable all instances from a class, a '*' can be used.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 149 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8320d57ef5a80..8ec1ff1e4e808 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -3,14 +3,19 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/configfs.h>
> +#include <linux/find.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/string.h>
>  
>  #include "xe_configfs.h"
>  #include "xe_module.h"
>  
> +#include "xe_hw_engine_types.h"
> +
>  /**
>   * DOC: Xe Configfs
>   *
> @@ -48,6 +53,30 @@
>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>   *
> + * Allowed engines:
> + * ----------------
> + *
> + * Allow only a set of engine(s) to be available, disabling the other engines
> + * even if they are available in hardware. This is applied after HW fuses are
> + * considered on each tile. Examples:
> + *
> + * Allow only one render and one copy engines, nothing else::
> + *
> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> + *
> + * Allow only compute engines and first copy engine::
> + *
> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed
> + *
> + * Note that the engine names are the per-GT hardware names. On multi-tile
> + * platforms, writing ``rcs0,bcs0`` to this file would allow the first render
> + * and copy engines on each tile.
> + *
> + * The requested configuration may not be supported by the platform and driver
> + * may fail to probe. For example: if at least one copy engine is expected to be
> + * available for migrations, but it's disabled. This is intended for debugging
> + * purposes only.
> + *
>   * Remove devices
>   * ==============
>   *
> @@ -60,11 +89,30 @@ struct xe_config_device {
>  	struct config_group group;
>  
>  	bool survivability_mode;
> +	u64 engines_allowed;
>  
>  	/* protects attributes */
>  	struct mutex lock;
>  };
>  
> +struct engine_info {
> +	const char *cls;
> +	u64 mask;
> +};
> +
> +/* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> +#define MAX_ENGINE_CLASS_CHARS 5
> +#define MAX_ENGINE_INSTANCE_CHARS 2
> +
> +static const struct engine_info engine_info[] = {
> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
> +};
> +
>  static struct xe_config_device *to_xe_config_device(struct config_item *item)
>  {
>  	return container_of(to_config_group(item), struct xe_config_device, group);
> @@ -94,10 +142,96 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t engines_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u64 mask = engine_info[i].mask;
> +
> +		if ((dev->engines_allowed & mask) == mask) {
> +			p += sprintf(p, "%s*\n", engine_info[i].cls);
> +		} else if (mask & dev->engines_allowed) {
> +			u16 bit0 = __ffs64(mask), bit;
> +
> +			mask &= dev->engines_allowed;
> +
> +			for_each_set_bit(bit, (const unsigned long *)&mask, 64)
> +				p += sprintf(p, "%s%u\n", engine_info[i].cls,
> +					     bit - bit0);
> +		}
> +	}
> +
> +	return p - page;
> +}
> +
> +static bool lookup_engine_mask(const char *pattern, u64 *mask)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> +		u8 instance;
> +		u16 bit;
> +
> +		if (!str_has_prefix(pattern, engine_info[i].cls))
> +			continue;
> +
> +		pattern += strlen(engine_info[i].cls);
> +
> +		if (!strcmp(pattern, "*")) {
> +			*mask = engine_info[i].mask;
> +			return true;
> +		}
> +
> +		if (kstrtou8(pattern, 10, &instance))
> +			return false;
> +
> +		bit = __ffs64(engine_info[i].mask) + instance;
> +		if (bit >= fls64(engine_info[i].mask))
> +			return false;
> +
> +		*mask = BIT_ULL(bit);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static ssize_t engines_allowed_store(struct config_item *item, const char *page,
> +				     size_t len)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	size_t patternlen, p;
> +	u64 mask, val = 0;
> +
> +	for (p = 0; p < len; p += patternlen + 1) {
> +		char buf[MAX_ENGINE_CLASS_CHARS + MAX_ENGINE_INSTANCE_CHARS + 1];
> +
> +		patternlen = strcspn(page + p, ",\n");
> +		if (patternlen >= sizeof(buf))
> +			return -EINVAL;
> +
> +		memcpy(buf, page + p, patternlen);
> +		buf[patternlen] = '\0';
> +
> +		if (!lookup_engine_mask(buf, &mask))
> +			return -EINVAL;
> +
> +		val |= mask;
> +	}
> +
> +	mutex_lock(&dev->lock);
> +	dev->engines_allowed = val;
> +	mutex_unlock(&dev->lock);
> +
> +	return len;
> +}
> +
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, engines_allowed);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_survivability_mode,
> +	&attr_engines_allowed,
>  	NULL,
>  };
>  
> @@ -139,6 +273,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/* Default values */
> +	dev->engines_allowed = U64_MAX;
> +
>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>  
>  	mutex_init(&dev->lock);
> @@ -237,8 +374,16 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>   */
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>  {
> -	/* dummy implementation */
> -	return U64_MAX;
> +	struct xe_config_device *dev = configfs_find_group(pdev);
> +	u64 engines_allowed;
> +
> +	if (!dev)
> +		return U64_MAX;
> +
> +	engines_allowed = dev->engines_allowed;
> +	config_item_put(&dev->group.cg_item);
> +
> +	return engines_allowed;
>  }
>  
>  int __init xe_configfs_init(void)
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
