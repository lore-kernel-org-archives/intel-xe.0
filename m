Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510E3F513EB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 00:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFB110EC74;
	Fri,  6 Mar 2026 00:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJieRcnN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC6810EC74
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 00:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772757139; x=1804293139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nG2HamiNDxnl6oGwOPa2x0FqvS2smKw+OVRfa/Pzljc=;
 b=RJieRcnN9lfqqow6+/KcekPzHY+JSmLvxt/Rnok9ed4zMZFjPqcFGKFG
 qMPEAbrAoAPbvx5onQ9oBvPeovfCnvOD8AkD6Mm5NXRyxssZLqo4zZBQn
 3zmo6khoGz2/Lg6kBgUBt+0mo7fZ9VUXj1b1p5bj6hiWJk1v9jgtQArRp
 7O2Ri/2Asdd4bCGj9a//OvuNOFvJXmA5d+/jrSArjOrk9faUNd9P2LHxD
 /EcS9Au3HYKva4qy1MA1ZBPQ1UzMemKl4/Ddh4vugWwsUgwPK8Tx0JIUI
 my+F7UJIQIV+4LYje23OynLT9u1Yyi74uWaxmiBsu5OBCKiuNE+xgeB0b w==;
X-CSE-ConnectionGUID: jU45LC8KS0W390xMw9Rqnw==
X-CSE-MsgGUID: gzRWKTvASAawdH1X09kL9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73734917"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73734917"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:32:19 -0800
X-CSE-ConnectionGUID: N9S6qOAXThKJ5/GR92AHUA==
X-CSE-MsgGUID: tYSDmC5YRByRQIuhm6C3bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218841811"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 16:32:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:32:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 16:32:17 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 16:32:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNPiQG9a8/uZPIODuT+6Gq/bIuvlV56yTLMgHPPuf88Noo76mXXXhfW32cqJVwA3D6a10ghVtXXKOt5af+g5QWbzu+46Fnai+X6Hy8oZgQIwFsFkwmr3qqhd2IZUGq3WxhCRJHs9tKI/CqyiBKnhHl0yvWjiAR+lKYxM+vDL7802fIKHizzYE+Dbd2rGX92oGOT2N2KX0pbXuD/8NvXkb20SeneXB808tl8MDhCzWEhmN2VSN3U/gF/vXlBNJ9phUj5hMsDFS+dsfZfQoqjxvnZ/N99wjcpDn3aQeFGs9SCruqRbmAal6GqKeQ7bPZdi+TvFzMQiHNMuLkms1NcYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVb2l5xVdEQOSpCcplo/jldHhxYvjjewyAfEPPUP/Kk=;
 b=m1VRVQPn8ec8yI3J0wRRBh1I6hkmab9KUhkBOeKKw/GEYlvxhPpJOgt+tJLJVrqfU/Iz/qnmLyu8qDoIfWubp6ZIMoyEOBMFK95QqdJa7tO9lINZrqbXiRMde4nKHYKRyvHALBSsiyjO4fzNBcplIzNtYGhG2A90b+DLZ9VwL9w4DoVyWuf37FhqILqEOodYSvsBy9dkvx1ppnv8ZrqyKbljSJhSrfdmMEgW4tgkaiYbDOfsmR+fHHPuV8sS0lqPMwenPRL75CZzUtMCro4Tbc/iDb353lGH8TYl/9o4vHZ6AlDHu8amnGRodbixe+JNhZZbFD472S4UMkMC5emGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 00:32:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 00:32:13 +0000
Date: Thu, 5 Mar 2026 16:32:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3] drm/xe: Add Wa_14026578760
Message-ID: <20260306003210.GV52346@mdroper-desk1.amr.corp.intel.com>
References: <20260305063553.3665044-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305063553.3665044-1-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 280c5d4c-8bbb-463f-4e99-08de7b17cf5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: XdUP+1SHsAV1KlDWFh6xsdwFVJhIgZiPkrOQeBiArVeFSPgDIB+DUCpN9OeHhHmFcyBuN9ize/p2i+UHSEknW5MxB29pyqAE3MbiF2TcsuuqF3bLSv80ZLa1JbxcBzm+bqmv6mrhInze02tiXP+/ZHuP+0u8kO2rHyDWAVm6fXEUdygzyTilUHlfGkY+7YsuJ6XpUpjAJ7Up5LrdKiMpgS8ZRTxlwt5Snw5nI0W3dFWZWtUpCx5ugjRpdsJ+sa/ereHCNoLTKUl3b9aDHfzDJUraG5yoKF/DRuttoWd/FRqH81yQYtGnxr+AfFwSVZwurIo6yvviR4KYeywjLfcmF8DMKvjghseo2CT5sFpYJ5P5Qtsu47a45YNFEOs11PZ4V4+NdmhCTHQ6AO5ss+GYJ0ODzXMlYBPJn4r2xHgdNlncWbteLJIzrqWbuk5BKV3FCI1UkJUUHYiYJd+KqU4xngZSzv1sOzLuSJUgm52FiakuFXmaR50pzPapRbHr9TKAhUyEwR/Ez273CC2JNP/0cRXqzX1TiWwz7pX1jlsXNQ0AfFVnrtxA//LxupZUWD9cJirWja3iIIkE/OCYuysuPD8VmkPCmscp13XNr6i/G/GHjKybH3MPg9Mfsw8eLRYU4CG1mYCheAVHlY4+E44C1ah9A2adQXDBuEg+jiA1Sm5Wo4prc3gC2crCvV40pExY2+hBdlN3voh2hD0nHioB78Wjqi+ziM9TYlGS0a540nA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFAlHFNRuyq6fKKwzjQVgP/NW5+gGka1WfaesQnH27rBOz+4hJ1oQg1+XqLp?=
 =?us-ascii?Q?zc9YzJnIFGuXIVpPFxu+wv0IZ2KSFKOMueAxODDXRJGbfEEE46SFA0LpsRvg?=
 =?us-ascii?Q?9Q7EOpWqOpDcfgBWRaeKvFd8weobmlUxITj65sy0zr9ql5S5CoBi46wUBaTJ?=
 =?us-ascii?Q?6ugD2K7OzmTlU2MpJu0c3KGe457xbTDqNlBj8voO9WTKl907nxpWSWysUdwO?=
 =?us-ascii?Q?Fu6FHUivN83MW6CS6App+7P1mBDzQYXHVzIoNhGS2hNeJTt/AIsGNTGBH/QD?=
 =?us-ascii?Q?tXgrYpYrv/3UCC19aqb3OKASSSJGKF3o+Alep0798KyPgJUlYM4s+TaynZ7s?=
 =?us-ascii?Q?EmgdImDvRXIhfXQEXQut44/lTkmR/X7I3OLN1Ujy1W9R5rfbauNmJpA1773k?=
 =?us-ascii?Q?JZoPkTrqFcg6425zsCAdK3MeMxdR+rx3pBRkFYyaUVl9nc4oXQFdX8J59j0q?=
 =?us-ascii?Q?/d/VpTc9Ec76OtEYShV4qKHHs6g075wPm1PhoDG3e1doiRNHUOqYmi7ikMXn?=
 =?us-ascii?Q?csEC/5FxxyHbe2SmnlmW5JUL1hI2pRX6JVfweZLE+d8BqIxy61sBD8r9buZf?=
 =?us-ascii?Q?4WqWByJomDs359CYsKft4Jz+kSScF1q4pHPCmhz0aYHh8xC1jkLxBo55Y3Kl?=
 =?us-ascii?Q?MlYO5T1qJETuYZt4NaGrFhnOoyEJwys1CONRI93/5Hm+2cJRIrwPq6hwLX55?=
 =?us-ascii?Q?36WCvKuHSa0svQh8MijCrmUkhV0OjZ44bIQuhDjWicur1ilLCBVsdzdIMkhg?=
 =?us-ascii?Q?nh+L/ngj54YxsS9f5QQpyRJTA7yq3MINlP4WabPCrl15qPohFoAjc2iWhLec?=
 =?us-ascii?Q?2HhE2kMOKMBSCuE3fB4Q6cjstKCWAQvJUNvEaS6zpDVASDx/pOjQbRsgEbVa?=
 =?us-ascii?Q?/pCabKMe/zn6dCmGwvaQgjBTclybEo5BABClu7h5vnGe35os6Vy2ZIM1LBtA?=
 =?us-ascii?Q?3jxslI+SMOnppuvu3waoa9hW0kKZITMkDs3n92xjgpR3TyXEVGLCpBdKdFwQ?=
 =?us-ascii?Q?hNm+j90lH0SR44U7mU/fKbtX9f2bP6GHd0sRPUV2XV/55F2Iwb/DoRjT9xVe?=
 =?us-ascii?Q?WnoDUpCPbHgLj2WO8fWLEO+yq6rTnl/LJirL4YcJ9hQq7WtLEM689Gz7oGwI?=
 =?us-ascii?Q?nYkKXxxt0bA+bROZ9G9AWjkaUrviCjb9WrNE88j6glXWePbkCHe0piO+SheV?=
 =?us-ascii?Q?zrmAYu706lvUPHWytjnh+IyXQOCrkRlaRq7mXDDworiuel6usBRQLYxL6d+P?=
 =?us-ascii?Q?f6pqcZw9MRm/sJzx6Us/FVhEoJ/pZSGCob5CF1Jrn5MTQ2i5ZyvEOlBe0AVK?=
 =?us-ascii?Q?P/LWGUOrjQA/Kgrs40iYHl554JbWUMIsoI2mjN5peENTMSWqJpvepvZ4uQLJ?=
 =?us-ascii?Q?X79LoTIfbSBQqegAM0LdVmymVzPXH1LZOm7VgtYUYnDhvlDOWgQ37H5rYQpI?=
 =?us-ascii?Q?bg280tP/6Y9NMMKzhUc1jK7y9rmNjQ05900nD3afIeNWieTykCuFODYHvxFl?=
 =?us-ascii?Q?SmyK1mKLuEdxJZQOKA/4xDC1dqR4ne0IWM+VDc5pbwT6nlpMDkJVc80KWLyB?=
 =?us-ascii?Q?4ppKP4zXhHOeyy9mcKoK1wkAP9ylN6VAXmAyryTYXNH6gOCuYVjzvUTzweUE?=
 =?us-ascii?Q?tsOVmh/njy+fvbhVl/RJ3g3H40BxJ+NAY0s7pM4sp3Bo2MtRw+5ikviKl/sg?=
 =?us-ascii?Q?UX8BECXffLOsn+DOZEp0PlMPxXKOeY2M3RYDEhM5et6k4chwJwjB/1cMv9Mb?=
 =?us-ascii?Q?k3LC2xQLBlMeNptyqBpsbDMCRUSj78E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 280c5d4c-8bbb-463f-4e99-08de7b17cf5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 00:32:12.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enoX7CEjMBctbGTNGMb1ThGkvrXtuds+bYA6ZawjvbLG0iYdduMYgbDUWPliytP0NqqmJ70XMZ5yNu3zwHMwCMdaOD5zttUr2rxwIA25pao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

On Thu, Mar 05, 2026 at 12:05:53PM +0530, Varun Gupta wrote:
> Add GT workaround Wa_14026578760 for graphics versions 35.10, 35.11
> and media version 35.03.
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
> v3:
>  - Use separate register defines for graphics and media (Tejas)
> v2:
>  - Fix register define ordering (Matt Roper)
>  - Broaden workaround scope to cover graphics 35.10, 35.11 and media
>    35.03 per workaround database (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_wa.c           | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea..c4da4a5c02a5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -100,6 +100,11 @@
>  #define VE1_AUX_INV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>  
> +#define GAMSTLB_CTRL				0x477c
> +#define GAMSTLB_CTRL_MEDIA			XE_REG(GAMSTLB_CTRL + MEDIA_GT_GSI_OFFSET)

We don't need a separate media definition; MEDIA_GT_GSI_OFFSET gets
added to all GSI registers automatically by gt->mmio.  Just a single
XE_REG(0x477c) will suffice for both the primary and the media GT since
the media one will be translated into the 0x38477c address when it's
written.  For RTP programming, the xe_gt->mmio used to perform the write
will be the primary GT for rules using GRAPHICS_VERSION and will be the
media GT for rules using MEDIA_VERSION.


Matt

> +#define GAMSTLB_CTRL_3D				XE_REG_MCR(GAMSTLB_CTRL)
> +#define   DIS_PEND_GPA_LINK			REG_BIT(13)
> +
>  #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
>  #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 26950b8a7543..fe6e42517799 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -164,6 +164,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  		       MEDIA_VERSION_RANGE(1301, 3500)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511)),
> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL_3D, DIS_PEND_GPA_LINK))
> +	},
>  
>  	/* DG1 */
>  
> @@ -303,6 +307,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
> +
> +	/* Xe3P_HPM */
> +
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3503)),
> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL_MEDIA, DIS_PEND_GPA_LINK))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr engine_was[] = {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
