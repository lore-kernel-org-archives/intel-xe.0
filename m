Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD14AC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 22:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3D10E5F6;
	Wed, 25 Oct 2023 22:44:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A599D10E5F6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 22:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698273863; x=1729809863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3QVbHLoW0+kLX6yfSUvqCuxFEAk7M7KPYkBvglu8Y0Q=;
 b=QnEYBWHoIJl8NR+T9/R2jkZoYttFKLDVNvQRJqtqJFepzDH9NkwRV9ch
 DvUHB7c/Xqk6d7VwgPcnkSFmzHL/9rMQ5YKDcDUFGVfwrBkQbAcNHp2Nw
 8/eiS0R0Dzupa5ersSFQFVyVlPJ/+657qrz6ilhw4ad6UV0gQdOso7OHP
 cNr4mD+MOw75+dEjC+grIYyMytA0Atu7y9vhOKBqfxed0lWmFWyEU+mMZ
 StNZS5f4mNtB8MCHUho8TSOJbQk8y8cpU05UzUiu9IkjLHv8ZD19rp+Dv
 4YCd5vRi/yIms5BeUYPwzbEbkQGVdCcZtnJyUATVzzDlK4Ktz4THOyzzg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418538335"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="418538335"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 15:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="875679335"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="875679335"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 15:44:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 15:44:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 15:44:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 15:44:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 15:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVqlL4PCOtAdKYtO0Q0emfoSxKJEp81n4VW2sTXWMU1g5vHBo/4MbSPqW7bRmetjAJA6pL+t/xDPRU86/CMBcvPukH//FWW5ZTmhrPX+zEoZqk64IEzHiVu8k36Kb+aUTRYO5y3Nae7AzFfepkVpeubmLmWdGae4Ihg0kth9jnjtxYYFhWoN0NZO4yt7BEk94RVTXAGKXXvpxE87sXDY1KoxRFuioFyyRfVd2teIx64KdvkOkbt9sXoQlIg5NTC6LaQcMxX8j6TFrXmJ9YU1GvbD+yZityeQ6Azo46HcHdcm+ZvAieP7bhRBSXqjCHOaaCrM10zJB/JWAx//Q24ZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIdf0jKzvjL0DkkFORgVM9xi8t3NX/1oZG5+Dk25+4A=;
 b=NoddfIjFjnsqzfQhuhJkcJSXjPAHZYqsFo2kZ0qLv3LPKXSDwyRHEKCQIB9Ym10LBryZdMgucpvf9U4ob9K8JesXqJrkvSDTSRaOajqbdJVMpBjOnOKxPniE2Jwn71UwaKdcpaxcC1koGDYpUTBSkSUZxwQXJ/C3Lsiq79q3pfDkDbNd6rJeP7rzsmNSJifW3q/44VPrcGDrB4IRLMxtjCdw7yqH8Oi3mgQARIGARGGzyWOYSRmO9IgQUMWBiNVr4dijTIUP5gPjgYGFEQiykChIOIrZlcpNpkyBDIYrjtV7kXWUDsVtwi95o9Xxz6wB4RpR4e8MtooAY2C9KLgPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 22:44:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 22:44:19 +0000
Date: Wed, 25 Oct 2023 22:43:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZTmZ97WnNQEW/HCa@DUT025-TGLU.fm.intel.com>
References: <20231025180008.24167-1-brian.welty@intel.com>
 <20231025180008.24167-3-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231025180008.24167-3-brian.welty@intel.com>
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af86984-2c10-4b6d-c423-08dbd5abecde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHBsBFmrHVUDebXL42oSqQGvICsLllk4TDsY9tQIZv4OZaGPOV/wGIZQgHtjVsrfGJLmqV4D9jVSm5LNXvC31t3yZcDN3aJhedzmaZSOGzFdbbuhmS90aOfwZsulTTsUdRUJb8omFzEB0TH+qThE6QuBwfVw9LJJHryD6uReyAdrPWY23yxbDV+QKB5eRmdbILgc1933uUZ+QGcpMzA9ZhP6v/6X1GbGKmOYT6CZBAqvO9w8IXUZ/uZh0Qc7U7wtU5t2D+h5ILt7A/ZBx1z1qp8KCWtxOvTY8ZQRpHcztLpKXa6X7K97b6b6+QDD7AwnMDp6YWxM5k22i5W1AB0urYm8PsXNX9Zv+Qh7yA4sfapOQ8whqyNnOvslzhvbOuMQMs2A3uyStjNIDwagr7uSJSIBI+zizuwPm/bvvV674iDDQWJPz/zs5Dz/Ss4nwwnetOOYXxBWitRKI9nIYAdpNInJzxni2S2JThg4zv7oKv7xWfdNgwXLWQYGpGtpkLqvjzvN/GKowbEvxzKCJ1kYW9zi0gWMkyeO3pYscfWBRJ0PTJEKOLifk9fmXEHhv5s4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(2906002)(41300700001)(6862004)(82960400001)(38100700002)(6506007)(4326008)(44832011)(83380400001)(86362001)(6512007)(26005)(107886003)(478600001)(8936002)(5660300002)(8676002)(6486002)(66946007)(316002)(66556008)(66476007)(6636002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+h4ONdJhjAND2pht50ZEElIcuDtRgkeuUQOZC1patO9TjVQ978x5eRY3lpfl?=
 =?us-ascii?Q?7/MaLIHbNPlg0cIaFLS7scr4yuVvx2rZzo0fvK802SmnEEb+IG81zY7GtB5C?=
 =?us-ascii?Q?ak1SmzZBzvsV0neJU6CktwDEdCm8xG9/qr/kYcWXalJJKbFdbroXeRBzJ5jN?=
 =?us-ascii?Q?hWUXceVxH/2QrPGrGdp2SrG4fgdhS+J1tjFNLqjJgAVv4XSPrM1/b664/pmi?=
 =?us-ascii?Q?uxw+7gXxSVo5z/2dym9gUa4lMvqtlvgYdjGj+rPEccz+CBm3bSRnYi1eq1E6?=
 =?us-ascii?Q?o7Xuh9Nz8c8JJWDrV/F7SU4OlGga52adVWUJgTe2shYIikZ3KuiLrrx5kvyt?=
 =?us-ascii?Q?ivBJ/5qHPHAnetWGbfLQn80/POuxb/n68znjLaBDFrs++Ig+fAtybNH5CP8C?=
 =?us-ascii?Q?irv+yiNJdem6ramnIa9/APDI2n+hKJH6bXczJ4HLNrKjapKBQQOGtZJ0xT+J?=
 =?us-ascii?Q?ytygAHryk3NoBe18A9SxqHz4C++ONn8tJmEF/b78BS6d2Bd5X8nDBj6yvtSu?=
 =?us-ascii?Q?RvW7tppaM/dAd9Vq6mOF7akqE/0FFs670RJgkOmVtiO2HxFz+2JBCEyV9crx?=
 =?us-ascii?Q?aFSubk8xDQx/PI4QSEPmsXEEMFdA84cEqLOko6WIVY8Zxj04NXsVwHz8q57w?=
 =?us-ascii?Q?+YwNAkiO/uzejmC2zib17fZYujkvlX2lsnvjicUFN2r9aYwjymr9Aa8OuPpA?=
 =?us-ascii?Q?iIAfzIwaAwBFFjOh/1u6OZyCs9ARqtlauTtPEVKRGpEh2Kx/qDsBEDqb6CXv?=
 =?us-ascii?Q?QtfWBB7LmgzS4u+Ihn9PI7OkuVKYlwk7JTm/Fd1GZRgYZOaKxmSLDjRRPzUC?=
 =?us-ascii?Q?VeOI329Y7Rn8S2zENOCcsXx6ODklC+Yg4oAyzbrljLr9QVYGmYj7GgY6KZY5?=
 =?us-ascii?Q?G0r7sDuRJl/8k3c2lUbKUl5FhSOjCF+gVYlyyb88Rslv2NHdGLC++7N2zxsl?=
 =?us-ascii?Q?kiALzeayeXYkv385bJsJBAU4Bpd6oZrnphZm4GXztO75yRz4AwK3L1yRriW8?=
 =?us-ascii?Q?Xkx6l2L2UD4fEK3ikU5qif2uHjBeF9Ikob+qz0LspOcic69UF/UBaqFwIcS4?=
 =?us-ascii?Q?ZudTSBnsWZ9kqPO8ftCExNIxCDgXMv2OTYDL9JY4447uUtGCgWrLxpwAjOsy?=
 =?us-ascii?Q?67+gixhawh6EvgDYSupyuViuZeeFqCZH/lcZFcMseZL47znaUL3z13Q+m2kU?=
 =?us-ascii?Q?AOPTQ8EVCh9peVwSNyPHOitaLUP3q1M/Gm8f3bEbbbwkcVT3ftLRSrsz51ML?=
 =?us-ascii?Q?DZglPaNYNWUhydTubxs+kSfbXiOgxmnT6hBrRB/KqDToj/Y5hdPj+Xt4wmSK?=
 =?us-ascii?Q?btJqC4Ovn6dhsDwQvSsClVDYHodlx6aeZV3hwUYeIF1za40YZVfen0NuJe3H?=
 =?us-ascii?Q?I353dr62aSZDi3mpus1Tz1TbftD1Dm5GESklBubS/VUkPxOyyiFFZCsp/Igy?=
 =?us-ascii?Q?DJJc7/W7I1+jfZGwS/Y9YZB0uoomsjCAZcOwIfwsZvkTHCWvX8CHNu/bQuJY?=
 =?us-ascii?Q?CcJwdduhXJVg5gdK4XGsGhDJMdO3VaaVUlqNV4Q8OhcqV0NBJLc+OQOdcMcS?=
 =?us-ascii?Q?Z4YAN/mRqp/J69idVj5dViq1Yt/4RwOZ5eFjfZBzpPXYC3SYd8hf2E2gbeFM?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af86984-2c10-4b6d-c423-08dbd5abecde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 22:44:19.5177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v86R6QUCJi2LVYGJxSYnbWZ0ph0b4T9cjg5pKHAwGiNv2X5IvrLkJP+z/I+noPpfti6uKl5PfbLOl290Sa3XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Remove unused xe_bo_to_tile
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

On Wed, Oct 25, 2023 at 11:00:07AM -0700, Brian Welty wrote:
> Unused and would like to remove the memtype_to_tile() which it calls.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 13 -------------
>  drivers/gpu/drm/xe/xe_bo.h |  2 --
>  2 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..795234886f7e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -109,19 +109,6 @@ mem_type_to_tile(struct xe_device *xe, u32 mem_type)
>  	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
>  }
>  
> -/**
> - * xe_bo_to_tile() - Get a tile from a BO's memory location
> - * @bo: The buffer object
> - *
> - * Get a tile from a BO's memory location, should be called on BOs in VRAM only.
> - *
> - * Return: xe_tile object which is closest to the BO
> - */
> -struct xe_tile *xe_bo_to_tile(struct xe_bo *bo)
> -{
> -	return mem_type_to_tile(xe_bo_device(bo), bo->ttm.resource->mem_type);
> -}
> -
>  static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>  			   u32 bo_flags, u32 *c)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 4e74201cc986..98ed35cf39a3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -113,8 +113,6 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  			      u32 bo_flags);
>  
> -struct xe_tile *xe_bo_to_tile(struct xe_bo *bo);
> -
>  static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
>  {
>  	return container_of(bo, struct xe_bo, ttm);
> -- 
> 2.38.0
> 
