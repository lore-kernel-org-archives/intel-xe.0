Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44CFC7618E
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 00:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80C610E102;
	Sat, 22 Apr 2023 00:27:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E2010E102
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 00:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682123222; x=1713659222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A1CPxjvGivtxGVBjI9GeJbyqcI1yE/KHXxlL0MrD08c=;
 b=BSROQd9WNVv2aFpOqVUzBdY+R2RxMPnG8ncEN0gWkAEgzKG5iT54rjnE
 SY71PhCf5jErggkdVHxTRtt+E8epeO+ncOxQGDQN8tQeE8IbdjANU1x2x
 nqTAsPm8iEFcPcRt8fKJqXYWXLXCQTapaxXyXrZIboZ04FzW9Xf7lW3v5
 /fqmLqJDIK9MJd3opoYeR+H99KYtLER/LGOz5yABFsCmToG2LguAB8n3g
 GnISna/cRU9csFe2Bahw4scrsx8z+8PNOKc1qBzkADwP/m9Hx7fR/AKw4
 MwenUwqsQ4imep/zyewv79E4iPsGaeABYJMCGCbtlg/sqP1EhjYiAMIn5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344861458"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="344861458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 17:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="803916576"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="803916576"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2023 17:26:59 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:26:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 17:26:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 17:26:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV6Cvnz0paMfHin+HanNVi/CqaU0yycex9PFoyhtsJRth3VQWowWX52Uh0lHuPxzpO1t92i6ZLuhaOeCjVDEav6fIN2LpJVD26XaBVsB0qNc4W/bAEb41jc8w57CAaaxYCKRFY019PSe2QyyyATt/Hr7RKAMvjZk/8VNw3ZwMCZLIKxE8OLfKI9cr6HXmR7Kyh2DKS4nnx+0FCcVmqwzOogh23Z4bFpQJM/eYcfyB002kdJnh0LWQn9hSitKABZZcG/ggftEqGQoX9nYi05c7sOvRRFp9ZbUugannx3oLWzmiLeY55yheNH4N5fw9IUfVQybLptbPhlSen/IU08zZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHTGMxYTUVIcL2muzNVMKjBecKovYvtfT3o6ii5HB8c=;
 b=jO/8QIqKd1oYIJs9xXW5FV9NI2IdEqnO+y3rY3pMq6UhGH0KRKtAmGjM6ErgmEe6lDQ3pRPyUAov83YMRbMrnZiDkUF6tiJq0nrQ4DPCldxc+pCWkqtCrpcSJnpVyHYXj8rRbYX9Cn2Fz8oKWWVVPvAXhBL2agxoWLVnk07V0g21XcNOH+LL4mQmRvQQm1YtgguAkZX0Ox4UDzrWCnHRjoE6xdibMHCGOvXRUU/6uzMBuV8ViBPlGTKYwRlS7Dw4wUiRFYiuBd1MGeLtrTDugDc8M299DfNd0h1qwYKtRA+jkfdKUCAF88IsHKmTvjxNCPFk8sFCB1kbyHcAAQrREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5459.namprd11.prod.outlook.com (2603:10b6:610:d2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Sat, 22 Apr 2023 00:26:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Sat, 22 Apr 2023
 00:26:51 +0000
Date: Fri, 21 Apr 2023 17:26:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230422002648.GT4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5459:EE_
X-MS-Office365-Filtering-Correlation-Id: 370acf09-9568-4870-ff38-08db42c8447d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P91f3Cr19rDUDz9Mf1CHa1T8lqbnwoqI4xgvFGmpEZvAi2x0CpXceDqA5vkoeZnpm3HXcXDyIWP6gLd0G4s8aTo4MNKDit6tqAdR0j/MuIhKSvNHw2QvfhoqJb3SeKBHMJL075f5gLzGrP9XxQb7+9D/NgZXNi9zDPDiLTpxt6ryCDc9PfFeHff7kpH4XK0jH8T+NZWnYAqCdmsam/i0htekTcIiBybe+JOD5MQGTJelCg3o9x5XJl5xEIP8w2f7W5hV9K4u0WGHEPzjLNmKp9udrTwfH5CWgDwqfCBNu8XPtJnCSN3KWw48RxQLX3gPJiApvDAUJiNrZwLMRnWJACeXz6yc2AkHh+FiU4l4N0nKHLwK1SERYj6z7aUeueBMB3ga9dZoRrQscDFULlnv2+6iVYUmQIPaXXQq8S1hM6K84zaOu5VSA3GGfINL6yRTaUhVKMySHKKCVRP6iB967E0IE7ovJhdNRv4iPtaKs3WtSbDpH3f6RMptH/Jvc+PEFJl9RxBKAIm2BjxX/dR9C96iSOcvecIVkauqPGi4rq66/CWMKxHckjUrnUAO3T9S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(30864003)(186003)(6506007)(26005)(6512007)(1076003)(6486002)(6666004)(38100700002)(6862004)(5660300002)(41300700001)(66946007)(66556008)(6636002)(4326008)(8676002)(8936002)(66476007)(54906003)(82960400001)(478600001)(2906002)(316002)(86362001)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QuibJjPwlwHjK757upbD66Dr1v8kwj7LGVH5/EUDYDPI8QUStMUEnczR1uKw?=
 =?us-ascii?Q?hygz9kRriq+xaHmzdo58KEfKjVjb1i9ruRXbtvOHJir9GkR7kbedOKmiZrGX?=
 =?us-ascii?Q?STlVf1CoihZPztRyX3zkIkPXIUF/FukLiG32BnioTsohlhmnuJmaACJrKShm?=
 =?us-ascii?Q?0icGd8rSZzB5ddW9hon/vSUAFun9tv1qoqmKHV2T0PmAaIFB4oMIZMGFRl93?=
 =?us-ascii?Q?KzCIRp4wLv3tH6hT2by4ycJ0xfVFe4XUsQbyCTw5ZcjYZbsw1Wg+kfIYHosm?=
 =?us-ascii?Q?wGTnY6dqezK67fkXJ1jJEOr3DG3got6qwGmEW+FxUeFLIdll/ZknjTlu+5S+?=
 =?us-ascii?Q?mxvLsXuSXMtv/8HSaNOYwF5m+Hkg3Xg1Ps9KhqpBeBUKY1LGStjglI6oauT1?=
 =?us-ascii?Q?CeuLmi97VL8oLfxlnM6Wg4OSehGwaa29psKKMKm1psBtG6IMFk+Y3y4+JzWY?=
 =?us-ascii?Q?tHYb8ifgGSNUcbfsenXVixrdQj8iR4kZbREFctBs06enoxvvmH+V06NZtXq2?=
 =?us-ascii?Q?QqjHQS21Gn/cDQyZjBJhSneM/+VZueWYYbTiN/Y9IUxxWQjV9xmyW3W/x+dj?=
 =?us-ascii?Q?PR87JeK34ODcgWuJtOsohB0W2XBLjnlAS8t0uOgA6ANizOktNfNSzPR7DCXJ?=
 =?us-ascii?Q?DxI0rgrTgWwNq9j9QSHPq1q2nWP00Oza7B7UzB0jLbBI6bYq4GdBkoGI2Jm8?=
 =?us-ascii?Q?Sec/DRQoXGgEX3HWgc2U94a/fuNzhMpHVPeCuE3AxwnNrktun/THVB6BMcoN?=
 =?us-ascii?Q?NmAa2UGU1N3RP+jxo/AZvu6mw6fr7xCkZyrV8ccc4EfWIxPcgg+1wVnPfoyn?=
 =?us-ascii?Q?vKCIcEzhipKapW3PDppxK3L/KgjkWTicTJuS075X1rRp/P978Q7CTPXAsIX8?=
 =?us-ascii?Q?yzQpC07ef4ouKK0/DetiGisku0zhWuV6X9bCpyl4frxyPpW6ap6xNbLs40vO?=
 =?us-ascii?Q?72sWG/n+1oDDDg1tGguthkzDCn7Fmp7jh7KjTBkovUDB05XcXLV8GG5yry8Y?=
 =?us-ascii?Q?DTeIMZq9UADEbYgMfTsGv61i4QskBJ00IbCXLG1jH3smE4LCqhgSjz+sICEg?=
 =?us-ascii?Q?NvylcjLyiwts6ewzc5+OIB+Sx+nCZosw+uFDJzhyu1Ik7+6OOauVVb6G9GD2?=
 =?us-ascii?Q?t4n+OfqPP6CqZ6CJQiqwOajOrHQJlcYZKJo30/uf45cKlkFDa27p2Md/Fsb2?=
 =?us-ascii?Q?P+SjOpE2od9jgshwrzF2DrVDzNCKUJWoXMrskMKfpn2N8p5p8LcRSTvPDBU+?=
 =?us-ascii?Q?zH4ukj69GWEZJAzbknccDHCjLM+uv1JdPNAM6w/S30gX9pQZvg3iYci8SclK?=
 =?us-ascii?Q?n+WvUiqwml+VUhW5rH50dMeENsrUsOLJ2wBf4QIotS1/rMxXY5Hq5xsJN5Qe?=
 =?us-ascii?Q?N5pCdZ8EJI2CcxuFzxUJmCghnHM+C4UvXMrjh8xD+xMfgaujYyneNneoEIxM?=
 =?us-ascii?Q?8LcImJLCcnwthzW/vZhgloFNpmq0ANIglpPSNJyd0bzxUvOKSVF3XMNGl/7P?=
 =?us-ascii?Q?CRyg8uMS+OAJojhb9XyZPEreGGNXKHO+CdHHIdwA9l2zt6fbfcCCQGLoGUKQ?=
 =?us-ascii?Q?8IhACk3JCUSIxp9Fi9jXDKR2J3mww0TaInW3v88dDXvW3dGw4w3PsE/xasOn?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 370acf09-9568-4870-ff38-08db42c8447d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 00:26:51.6368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k21h42ZFsJMZj08zNFAOM56PltElYlXlYDvYdhXQq1pMnfl/1K1Btwh5m6n5Ns2g7dbV1GYm79DIDCxZcnDl8gc2WEe68+2TqIZIniaK9xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5459
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/17] drm/xe: Use REG_FIELD/REG_BIT for
 all regs/*.h
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:51PM -0700, Lucas De Marchi wrote:
> Convert the macro declarations to the equivalent GENMASK and
> and bitfield prep for all registers.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++------
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 53 +++++++++++-------------
>  drivers/gpu/drm/xe/regs/xe_regs.h        | 12 +++---
>  drivers/gpu/drm/xe/xe_gt_clock.c         | 17 ++++----
>  4 files changed, 48 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index bfcb0e9a6d4c..938055f75492 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -22,7 +22,7 @@
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
>  #define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
> -#define   RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
> +#define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>  
>  #define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
> @@ -54,7 +54,7 @@
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
>  #define RING_MODE(base)				_MMIO((base) + 0x29c)
> -#define   GFX_DISABLE_LEGACY_MODE		(1 << 3)
> +#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  
>  #define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
>  
> @@ -68,17 +68,17 @@
>  
>  #define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
>  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 1)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 2)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 3)
>  #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	REG_GENMASK(1, 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_1		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_4		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 1)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_16	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 2)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_64	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 3)
>  #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
>  						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
>  						 RING_FORCE_TO_NONPRIV_DENY)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0908224737dc..4076d903b20e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -9,15 +9,13 @@
>  #include "regs/xe_reg_defs.h"
>  
>  /* RPM unit config (Gen8+) */
> -#define RPM_CONFIG0				_MMIO(0xd00)
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
> +#define RPM_CONFIG0					_MMIO(0xd00)
> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 4)

Shouldn't this be REG_GENMASK(5, 3)?  That matches the old shift value
above and bspec 52453.

> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ		0
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
> -#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
> -#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ		3
> +#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>  
>  #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		_MMIO(0xd50 + (n) * 4)
>  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		_MMIO(0xd70 + (n) * 4)
> @@ -39,15 +37,15 @@
>  #define MCR_SELECTOR				_MMIO(0xfdc)
>  #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
>  #define   MCR_MULTICAST				REG_BIT(31)
> -#define   MCR_SLICE(slice)			(((slice) & 0xf) << 27)
> -#define   MCR_SLICE_MASK			MCR_SLICE(0xf)
> -#define   MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
> -#define   MCR_SUBSLICE_MASK			MCR_SUBSLICE(0x7)
> +#define   MCR_SLICE_MASK			REG_GENMASK(30, 27)
> +#define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
> +#define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
> +#define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
>  #define FF_SLICE_CS_CHICKEN1			_MMIO(0x20e0)
> -#define   FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
> +#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
>  #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
>  #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
> @@ -59,12 +57,12 @@
>  #define PS_INVOCATION_COUNT			_MMIO(0x2348)
>  
>  #define CS_CHICKEN1				_MMIO(0x2580)
> -#define   PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
>  #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
>  #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
>  #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
>  #define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
>  #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
> +#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>  
>  #define GLOBAL_MOCS(i)				_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
>  #define GFX_CCS_AUX_NV				_MMIO(0x4208)
> @@ -131,19 +129,18 @@
>  
>  #define	MIRROR_FUSE3				_MMIO(0x9118)
>  #define   L3BANK_PAIR_COUNT			4
> -#define   L3BANK_MASK				0x0F
> +#define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
> -#define   MEML3_EN_MASK				0x0F
> +#define   MEML3_EN_MASK				REG_GENMASK(3, 0)
>  
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				_MMIO(0x9114)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  
>  #define GT_VEBOX_VDBOX_DISABLE			_MMIO(0x9140)
> -#define   GT_VDBOX_DISABLE_MASK			0xff
> -#define   GT_VEBOX_DISABLE_SHIFT		16
> -#define   GT_VEBOX_DISABLE_MASK			(0x0f << GT_VEBOX_DISABLE_SHIFT)
> +#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
> +#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>  
>  #define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> @@ -203,9 +200,9 @@
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
> -#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
> -#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
> -#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> +#define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
> +#define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
> +#define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
>  #define   NODEDSS_CLKGATE_DIS			REG_BIT(12)

Should these be reordered high to low for consistency?

>  #define   L3_CLKGATE_DIS			REG_BIT(16)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
> @@ -225,7 +222,7 @@
>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>  
>  #define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
> -#define   DFR_DISABLE				(1 << 9)
> +#define   DFR_DISABLE				REG_BIT(9)
>  
>  #define RPNSWREQ				_MMIO(0xa008)
>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
> @@ -233,20 +230,18 @@
>  #define RC_STATE				_MMIO(0xa094)
>  
>  #define PMINTRMSK				_MMIO(0xa168)
> -#define   PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
> -#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
> +#define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
> +#define   ARAT_EXPIRED_INTRMSK			REG_BIT(9)
>  
>  #define FORCEWAKE_GT				_MMIO(0xa188)
>  
>  #define PG_ENABLE				_MMIO(0xa210)
>  
> -/* GPM unit config (Gen9+) */
>  #define CTC_MODE				_MMIO(0xa26c)
> -#define   CTC_SOURCE_PARAMETER_MASK		1
> +#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
> +#define   CTC_SOURCE_PARAMETER_MASK		REG_BIT(0)

Calling a single bit a "MASK" is silly.  We could drop this
completely...

>  #define   CTC_SOURCE_CRYSTAL_CLOCK		0

...and dropped this unused one...

>  #define   CTC_SOURCE_DIVIDE_LOGIC		1

...and make this one REG_BIT(0).  Then in xe_gt_clock.c the code would
just be "ctc_reg & CTC_SOURCE_DIVIDE_LOGIC."


Matt

> -#define   CTC_SHIFT_PARAMETER_SHIFT		1
> -#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
>  
>  #define FORCEWAKE_RENDER			_MMIO(0xa278)
>  #define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
> @@ -350,7 +345,7 @@
>  #define GT_GFX_RC6				_MMIO(0x138108)
>  
>  #define GFX_FLSH_CNTL				_MMIO(0x101008)
> -#define   GFX_FLSH_CNTL_EN			(1 << 0)
> +#define   GFX_FLSH_CNTL_EN			REG_BIT(0)
>  
>  #define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index e6b81bcff91f..da1d5aa6cdb7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -37,10 +37,10 @@
>  #define XEHPC_BCS7_RING_BASE			0x3ec000
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
> -#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
> -#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
> +#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
> +#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> -#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
> +#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
>  #define FF_THREAD_MODE				_MMIO(0x20a0)
>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
> @@ -90,10 +90,8 @@
>  #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>  
>  #define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT		0
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		0x3ff
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>  
>  #define GGC					_MMIO(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 1b7d00284535..384a47d3c3eb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -17,13 +17,12 @@ static u32 read_reference_ts_freq(struct xe_gt *gt)
>  	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE.reg);
>  	u32 base_freq, frac_freq;
>  
> -	base_freq = ((ts_override & TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
> -		     TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
> +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> +				  ts_override) + 1;
>  	base_freq *= 1000000;
>  
> -	frac_freq = ((ts_override &
> -		      TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
> -		     TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
> +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> +				  ts_override);
>  	frac_freq = 1000000 / (frac_freq + 1);
>  
>  	return base_freq + frac_freq;
> @@ -35,9 +34,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  	const u32 f24_mhz = 24000000;
>  	const u32 f25_mhz = 25000000;
>  	const u32 f38_4_mhz = 38400000;
> -	u32 crystal_clock =
> -		(rpm_config_reg & RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
> -		RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
> +	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
> +					  rpm_config_reg);
>  
>  	switch (crystal_clock) {
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
> @@ -74,8 +72,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  		 * register increments from this frequency (it might
>  		 * increment only every few clock cycle).
>  		 */
> -		freq >>= 3 - ((c0 & RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> -			      RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> +		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>  	}
>  
>  	gt->info.clock_freq = freq;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
