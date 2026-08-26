Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD0C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF18010E2D2;
	Wed, 26 Aug 2026 10:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xx6uVe0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356410E2D2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787740676; x=1819276676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f2wPE8d1JIoAJOJrL9/manjpjPzNZrjo6YjX44HE6e4=;
 b=Xx6uVe0xS/6IYbxIcw3ECSBdi2eVoGxbNU+otS7Uws29IN/esVfP9/6f
 hNG78rGkWJRanVslyQSwKqcTedSU08lglmTiDutanJrVYnnMuQiWGL8Jb
 IY+O6rnmMe1vH0ny7fS6qlxGakBujoBxM/2xMRerlF4E6T6NBPSyeRgZA
 pgdAogP0jWQLurf+CsbC13sS7Wr1F0aQM8S9/OGLK3I4ZGX3e0p6QPdj9
 gKgEqcDe1bKxWIbEb5f2yb+uQwwIUTbhlNDgjDmFSrxUWVTN9IrFQK1dH
 RNdmCZfwpfFjbme3NjkiX/vuzFBTvJcTTiYy1GZo/GGIsZS28S/NgK/tm w==;
X-CSE-ConnectionGUID: q3zdULJuRsqD0PzAKGGVdA==
X-CSE-MsgGUID: 1tWvPocXSvuCsO21bP6rcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="111002383"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="111002383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:37:56 -0700
X-CSE-ConnectionGUID: QXzwTp4tSrmzazC/dhEYTw==
X-CSE-MsgGUID: J6juIQ7nTSSOL0AUH45piw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271342436"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:37:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 03:37:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 03:37:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 03:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmDytxEahpuC3J+PqvJsX7mW1tB92m+XkalWh7/RMGrr/Zpnf3Z12hG9Zb4yI8bVEXGNj9aMA6Pe3lVn6+NErJq9xc8r538QQi1e8RQgek4GUDL+GYde2VivVhSTxrfbP+MxpYRAWf7c8VhYE6+0tEB9TAg8uMR8B7kpuKs82+lDi24x38blwevJx69h4c3GzFFXG8HdaBTkpDenKgwBZs2IIYvib8hMCWrSjhmP7R50voxGSbUu5YhjZAfOfafkeIcoc+d6OPbgY0+HLDDd4v2Xe4PJh4BsKntLE7Kfcdh6mPN3zM0+BjRHUO7cupBw8RMGFEmV9eLn73ksbl6t7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvkgu/joZ7SSNivkZ9yn3djIJ3TDf/MpLi/KSdHxbi8=;
 b=A+l7T1D3vkdMgvCMWRQjoWbc87+spOMFoLUQ2O1NTR+WfDcRcDbsnqlDLKWgPc8P3M2CpX3pm/X7/i3cX9UcfjiHXR4i85yoA8h8uaWQjLJtyKDF3bR2AGIOgvdKCwJSQHBN00sGAKPHsFSt1wn8Un8K27pdVcBNksLfCDfX+pQLwOWT44Pe0BzqulVLG07JP+Lyd+2sLzARH8VVMHDc4v+8Es3DoK6Ph+5r/S8g9R65hy63FFPoQdcJoEaFGkcBV78KTkXrOmikibGAHYEXKla3PHqnlSqrYtxEhECrzX2FisyreigM1Jk9/LUiTGtByTCVauMuFXCw0/SAJglnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DM3PPF74831EF4B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 10:37:47 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 10:37:46 +0000
Date: Wed, 26 Aug 2026 06:37:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Read mailbox phase bit from hardware
Message-ID: <ao7BzVmDAW_BqBrS@intel.com>
References: <20260825172827.3801591-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825172827.3801591-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DM3PPF74831EF4B:EE_
X-MS-Office365-Filtering-Correlation-Id: ea264ef3-2b96-4569-33de-08df035e1176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|5023799004|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: X+Npnb42hHlMsCxt7VxrvD1On6zGE7yrp6zol0ez1a+WGqVZako32puK5IQSdNXoojGnctWZVVGK5hkKRHmJClQfBL5TRX7aS44P5XUqGmh99U1nV4F7PB0lkRpFr9Xky+oze79tgrKZvSLA5IaL5AIr+1a3uCYZ8Z0OzAewRPcpSbKAR2a4TIvCeZ33oR1xbYKyun1+FapZCG4rpshOLiQja8jEJPHQZC/5Z9IdVDAyikTcuzY5ngrSQWHKpGSNIpuOtHXhh1DG4vMsxb63METcSWxjUA8BXdoiIGS1yv47fy4k0Z+dVjRF0zQAKUV0qiXJBvycv0Xs3cjqFQQmqcr2uCENXEsW7iatE6HuVa+GtRCRQFmJe9PLARIngt/U/k4Hm6knwbTpvknzHDvB4e4U4qSZWVwnaQBt7Dvc5bW+b9fzY7kOetH1s4Kn54OEd0VKk4P5qNqPKSx2ymVzIQmCak/cnWIg7qEGaFL1uQ2mbzHwqsGDy+VYCwZd63nRhsEyzuHrGIBFsjc2sVMUmBqtMIYIsVjhtgxCL2q6giU4xRUtYZbBEssAIDM0x9hxG0D4IRx9EM25GLHTQrcKB8Gs5ewf8f+UCqL3yj30Cor/Cq8ndk3tY0jhdU3njV7h5yDg5VVUK6D9U8o6klQenPCkfSNDHdxcLYjm3zdrXLI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(5023799004)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7cM3acfa1MDzzNkfXHSTzlx/GQ/OgI1PLU6jx80rTQDIjw3vabJ1h8/Vp4G?=
 =?us-ascii?Q?xyKkX4HzU2UBtdjbIeQHFiVe/QBPcNGdbGgmnAhxuuZ5qzyI9Q2yjN1sdtQn?=
 =?us-ascii?Q?TdbLSDu8rGzRbatN3Kx0vcnU7QL7IufYesrkfrZWNPe1zfJGgJoFjJfhDw3i?=
 =?us-ascii?Q?OUJ3XynEB8L7xilE1rd5TdDf8+HurytiMwNcP80yIwzP+/WtuKobe8+kapJU?=
 =?us-ascii?Q?hqRUsW7dFV+u1f5iRXwQCNG3tbhmMDHvyTjcUwpjOvD/99C5OKE2cd04n17t?=
 =?us-ascii?Q?p/++tln3TcRYGjUzkbjiDqDkLmkPAOvKDDu5N/0dfaxvL2bVmm5y0XQfMANS?=
 =?us-ascii?Q?qNHFoWtyOianQQwZw26SvKkjUo62yk5h+rS7DCIparNbjY8zkMr7e5uzeX1d?=
 =?us-ascii?Q?nQwWBQRF0i+XbMj2qbAX6+5/zvoSsBvFXBjwIdgs3IacAjG/Ly0qSZw7uPSr?=
 =?us-ascii?Q?RGhBuo8fkh5Tm5Gw21OZi5oC44fT0bPV4pIBNyeTFvvpbM1KTkU19baIgw4X?=
 =?us-ascii?Q?DIbW9l6dz2d+EqR70GnxTm7X6bV3R3daQVfWpXm9bT+pJpOoiw0gNKC5bdYx?=
 =?us-ascii?Q?xCHBB1Q3A9o3G3NGOURPp7y0GAWX88QMfugsiqAxcb+r5Jmhg4WaVBoWc7ov?=
 =?us-ascii?Q?x4hfdLdNFdmK7a2vEsX8eOezI36PPYyNw31WhsGaSSJSz1nRXB/ljqQHyLjK?=
 =?us-ascii?Q?nO+NU8B9qK0FwznmTE2dCMxYL18/JBn7b4Gi7WGpIJspfZRwYMRVFXQo7Q37?=
 =?us-ascii?Q?DoO3m4jg41Zq6chfz3WZQB6fcgGKC9Cl/6hrJYMt8aMt0ok4IzpxWeM5YaUO?=
 =?us-ascii?Q?kr9xUzqOEUkUBeTpMQFRENAmPnSEvHcBTiv+xrDwaWKPjlhJOwuRRDTGA/2M?=
 =?us-ascii?Q?MeZTAWy7IqiHOpQsV+WgKMrB4jdKFPrRhBF5Xal8RmV9uCCheNtpu62W/rID?=
 =?us-ascii?Q?IaIho30thZXVmkNLKXetqKmCpvrJQ4yFheiSk6KJvejp3BNuqYw6LIeDks25?=
 =?us-ascii?Q?uhsXFSMxKH4GefqxabCxV8THmjnTNOhYYONcCxWAwz+c0wlZLOflzTpFPQBD?=
 =?us-ascii?Q?EiWlV8GcJozM5AG1yJ7SjtzyoTeNQiffXX0sG9S8oDX+aWbEohRuyIXlIK+V?=
 =?us-ascii?Q?XOsvTJcOenRc5Za/fGSdSBZXkohxHrrQlibt6gm0uLjCf25jecjlfSfp4h7j?=
 =?us-ascii?Q?65PkjUy9/bZKttRNpdbfjqK/Yhd9xvLwKNXsI13yNZ3cpF+4UybMCVNiYM3w?=
 =?us-ascii?Q?F+aWAV3EpYOX76e7sraJ2VjFthIaJE9RQ4Hvk9Kz4qhm1lY/kop+CFcez1Zj?=
 =?us-ascii?Q?1/wCRkQPtB8s+C8gkcv2n1qBn+5aZAXgTHQOKVYfRDq1ZA1iScABRiK7FYcC?=
 =?us-ascii?Q?d08pzkxI7l3vQ//UlEaLoXKKv3eck/YbnfEPu90bp9jbbOtFugAL+eyQ/r9R?=
 =?us-ascii?Q?J81vELa6ie7d96LYsdSuseGeh9JdqGYMZey9+EJtyNMVtPOqOuBXcCxoyFGW?=
 =?us-ascii?Q?ZscM7ZxcjMqvg6UjI4l6WdGceG8WGXd2xVDoZWAqxP7XU503drEKfa3HIBiY?=
 =?us-ascii?Q?87Taf7ytsQ557lWdFBup7lTtkLt+wFhpb/N1W22zFMNcqPhZf2tDKgnXkVIT?=
 =?us-ascii?Q?OlxVAnt1eulnPH4k42ihKJlG9beMBgNUbeabgQnWmbDiNIfDIMJKfI4I3Eer?=
 =?us-ascii?Q?X+0I4QDSvwLaqmny16FWSkUV1EZi0kxyUp3J/EEQjPdRzNXrK8jydPgZwuF0?=
 =?us-ascii?Q?FmU2muI//A=3D=3D?=
X-Exchange-RoutingPolicyChecked: X0Fi6OqCKii3+ua3QEricCFbwSTWVwYKBkm8xlIjts8hXBInu8PNZgH4wSUIRebDS6O6eo50D0Tfb3WLmOy6kfJl5dtf9IScK7iExcJcsNekswT2T2aNySQWgoqBGln26ygNVa3X7CzTqQZgTHLAlSCaYN1nMczfCbUIOeIMLWrCRkusiHD9TK7T9N1Tn2upkalANS/55JkpI3T/rEEJjjL3cXfVGFV17vkn8r+7EiRw5kXrtN4N8cvRtsk/Bj2cj9eBQZEUJZehmeKW74q8H2ZBbZZe+J440Fk/5fKIHJ2vKK8VSWEGYq7tXb8ZYyvfeB0uCJpNGQkMwkOEoeBB/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea264ef3-2b96-4569-33de-08df035e1176
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:37:46.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTGly+jL4ILMN38YZXr6Wj9W2j0UJ/1gH1EcsFDAO350H3xDmgYMf051o5Tda8kaMx1O0fu2Q+bNQnlckqVnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF74831EF4B
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

On Tue, Aug 25, 2026 at 10:28:28AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> The mailbox PHASE bit in SYSCTRL_MB_CTRL is toggled per-message and
> was tracked in software as sc->phase_bit, reset to 0 on error paths.
> If the cached value ever drifts from what the hardware last saw, all
> following messages carry the wrong phase and get silently misread by
> firmware.
> 
> Drop the cache and read PHASE directly from SYSCTRL_MB_CTRL before
> each frame instead, removing xe_sysctrl_mailbox_init() and its call
> sites along with it.
> 

Fixes: 1f95f618182b ("drm/xe/xe_sysctrl: Add System Controller mailbox communication support")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing soon

> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl.c         |  7 +------
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 22 ++++------------------
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  1 -
>  drivers/gpu/drm/xe/xe_sysctrl_types.h   |  3 ---
>  4 files changed, 5 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 1db20be8158b..62ccc9be71b4 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -85,7 +85,6 @@ int xe_sysctrl_init(struct xe_device *xe)
>  		return ret;
>  
>  	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> -	xe_sysctrl_mailbox_init(sc);
>  	INIT_WORK(&sc->work, xe_sysctrl_work);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> @@ -114,12 +113,10 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
>   * @xe: xe device instance
>   *
>   * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
> - * Restores SoC remapper configuration and reinitializes mailbox interface.
> + * Restores SoC remapper configuration.
>   */
>  void xe_sysctrl_pm_resume(struct xe_device *xe)
>  {
> -	struct xe_sysctrl *sc = &xe->sc;
> -
>  	if (!xe->info.has_soc_remapper_sysctrl)
>  		return;
>  
> @@ -127,6 +124,4 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>  		return;
>  
>  	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> -
> -	xe_sysctrl_mailbox_init(sc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index e13eebaac1d0..72baf1aa4b3a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -145,6 +145,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  	struct xe_device *xe = sc_to_xe(sc);
>  	u32 ctrl_reg, total_frames, frame;
>  	size_t bytes_sent, frame_size;
> +	bool phase;
>  
>  	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>  
> @@ -153,7 +154,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  		return -EBUSY;
>  	}
>  
> -	sc->phase_bit ^= 1;
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	phase = !(ctrl_reg & SYSCTRL_FRAME_PHASE);
>  	bytes_sent = 0;
>  
>  	for (frame = 0; frame < total_frames; frame++) {
> @@ -161,7 +163,6 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  
>  		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>  			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> -			sc->phase_bit = 0;
>  			return -EIO;
>  		}
>  
> @@ -169,13 +170,12 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>  			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
>  			   REG_FIELD_PREP(SYSCTRL_FRAME_TOTAL_MASK, total_frames - 1) |
>  			   SYSCTRL_MB_CTRL_CMD |
> -			   (sc->phase_bit ? SYSCTRL_FRAME_PHASE : 0);
> +			   (phase ? SYSCTRL_FRAME_PHASE : 0);
>  
>  		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>  
>  		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>  			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> -			sc->phase_bit = 0;
>  			return -ETIMEDOUT;
>  		}
>  
> @@ -321,20 +321,6 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
>  	command->data_out_len = response_len;
>  }
>  
> -/**
> - * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
> - * @sc: System controller structure
> - *
> - * Initialize system controller mailbox interface for communication.
> - */
> -void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> -{
> -	u32 ctrl_reg;
> -
> -	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> -	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
> -}
> -
>  /**
>   * xe_sysctrl_send_command() - Send mailbox command to System Controller
>   * @sc: System Controller instance
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index fb434cc165b2..f0d5e3d7f5e3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -26,7 +26,6 @@ struct xe_sysctrl_mailbox_command;
>  void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
>  			       void *request, size_t request_len, void *response,
>  			       size_t response_len);
> -void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>  int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  			    struct xe_sysctrl_mailbox_command *cmd,
>  			    size_t *rdata_len);
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 66ba24f43017..98c2f473f7c6 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -26,9 +26,6 @@ struct xe_sysctrl {
>  	/** @cmd_lock: Mutex protecting mailbox command operations */
>  	struct mutex cmd_lock;
>  
> -	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
> -	bool phase_bit;
> -
>  	/** @work: Pending events worker */
>  	struct work_struct work;
>  
> -- 
> 2.43.0
> 
