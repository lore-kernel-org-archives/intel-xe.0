Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5101C7EE37
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 19:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8834C10E3A6;
	Tue,  6 Jun 2023 19:56:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6952C10E19E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686081378; x=1717617378;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VLpdFT8/hwJo5mECzupo9pFUaeWM9P3vSy77e32mtYw=;
 b=SICzgYw54VVA1ZHhXQzKsrxqvJijfkWEC/59F0ALttidWUbDkl2+JVSN
 sD7e3jPjlEb9ZggNW5CvjrRbb55yeKFd/CTj7w00iOUv13T5dFV/6aw0i
 tCGPdmcoZVEO8u3aEQ6GAtRH9IovldQgOzyf57Quu68JkD7C0zPPuFYQv
 ynSp9XhsD+HskGatmmr98SvqsNN6Hd7+r2Q5Qlp/DFohcxwBwUW8iJzrv
 eVlDpp/ZOHzseQozpIt+urtO07evG71N7bu4lgzNsvrKk62TRLpgXOCJ2
 9bM7G3Tkg4cEGG3mpFoNh3znuf4HfSTxAH540LZhD8s7u2PbnP0boqS7w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="355639531"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="355639531"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 12:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709197869"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709197869"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 12:56:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 12:56:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 12:56:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 12:56:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 12:56:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhLKFSY6bjuE6wNjEuK4tf/N3ReqEdkj01zAWn/gXJDmZKwAaaA5px1GN5B9NDRvI4i9r4I+W6eYHPkfKtr76FNmgv/zozeHb9vKzKWFykFhETEqxZ2XLggSbVK4PpyKn5+eU1qY5wlc3H9o3AIrHory/qAVgNzl6c+H9tJOoWnpJYnLozhXgAvR58HDv/kPWxlVqfz+RF3Pv/nZKNSdWeciUTcMVd/PkZo3U3ElXfFZOOvtWYjddEhf/UeX1oTsYtlS8a/f+DrWWE/PyQdoZy/bVL+zK1a9DsUIluR9uTtYPdMjDrEhi5EK3wKJ6FTBBODgds2LeNEZrI2DNRLQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bElvd5Pi7BAaVvztbiwFXvaA1ii+s2JrxyKMh1pPkYM=;
 b=iEfV7KnrwlZ6JB/6gdJsL0yIxkdyrNXywnvUEV4U+FL5yPA1FvuOW4e4qBsyYn8zcGudtd8kHDjt8804K2fgfr0kFJSbKKDZc6XouzPFEdLFzlknc4+U4QHK9nK4bT5YBO/UblJEsGd90kbXVTQGLg7TSZULZfdks6alCBpE9xw9VLpyBLPG0tv7M70iPuidJvUaWoRnj4WwkDOhWNU1Gzsehhs0ndBgWr67VaiIWyCmHMnOQcikDiGghLAxEFWwsjdmFU5bbMHGlCQ6W4SvIhm3wNs3IUsLfnr7RYIOR4CsTxL+aJ+qmsjRbIZ48XmCFp3F5g9otyzyX3/yUsI17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 19:55:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 19:55:58 +0000
Date: Tue, 6 Jun 2023 12:55:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20230606195555.GH5433@mdroper-desk1.amr.corp.intel.com>
References: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR05CA0134.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cefc399-10fc-4ec4-62f9-08db66c80bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTKccMkmOoGrsb7Ddqbq4vErMYcHLpxGT+xDOWJ2dw5+YwLLatGTPtaYiYubwdqSrBWsHlGr7vIaaARyuSnNT8m2mL3VvOxBBZ52wUy/Yctw3WzjEUfeD8OBAvr3e4Mtq9ezwYwIz2bttGmZrkh28uPlOj7fKAkGItIQpKXnH6OSK9BAQJhYQ7zIPFkJLsi29tlXEUIwyMiS9tbzC87lZNwio6rB9/gEUy8uJPazJVmkOQDAu/vO9o5pMcUy5ddiYui5821lQe5F8zaBoOIDfd66T6XrF8k8D/XwHeaXl+LbpAMeEavgzHzm6Xsr0UjyicASO3UqWm7VvpH6RxZIiPKnhbGpYR1X33blf3fRyOQAWV5OMYJ8eCIDmjRj9svj/7wleFSvlyTQRSNrcmN9AVMdoxEcYgct1sgvc9s4Jc9N2XLFYSpxnyGuHxkmWYZjVkFQcBqnMnX57KhVwKB1jXntJJ0KcOuuH5B3CT2qXmIUcPNsMiyx/n8FRSsLxLUpVuYwu7iy9A+PPreUyrUGYynbEuWhtXRnaMK4EnuG5JgIlj0v9E6J1OyLenCGdTM8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(66476007)(66946007)(478600001)(6636002)(316002)(2906002)(6862004)(8936002)(41300700001)(4326008)(8676002)(66556008)(6666004)(5660300002)(6486002)(26005)(107886003)(1076003)(6506007)(6512007)(82960400001)(38100700002)(186003)(83380400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N6lasLPR3mewQwPrf9vO5XejEo29WvQpd91a1aV2uaahzasSVx7RCIkHeRh9?=
 =?us-ascii?Q?emRlpBAoxPATA0qpjq7OxiPRD385mVULHNuACo3mjR+n2DynBHkgjOMB8xwX?=
 =?us-ascii?Q?mcDAga6cG/ZwR0WEYjOWmyVS4VRCAfbkraDxmuswOiQR5FX60HMAWF8f45bB?=
 =?us-ascii?Q?7NPRTdak5NzIETgF0nxN2umzDwrMMoouCYF8HJcs4s6D1FDl/2PsulirhaCf?=
 =?us-ascii?Q?jSurN5V/YdTRDCC1d0MUSpk+LQ+3PpwKcgGOXafugMp8jGWLGdKQxJnl7mba?=
 =?us-ascii?Q?1P8WKQohfTiDVCkGjudwfrfA8nXSqihKN/gmfkZPOqfaQOvPglYucxuWHXl4?=
 =?us-ascii?Q?9ZgSnpyv1aYW3uUkPGzmNCjyaQcc1Bc+PKrIjCL342PxTQqAA5PA6aAec7sk?=
 =?us-ascii?Q?MpOlnYRo/BqhQz5cAOLUQbNbpaQrZuych5HhHMC/POyRBDIwKRHveKfc4IxI?=
 =?us-ascii?Q?sR9VzhJC3LHiwdbcwITLcv1O/e9DCa2nqbfIvdamj/hIrTORZvRgaRdg0yWQ?=
 =?us-ascii?Q?G50b9H7AkgPDH5AsBeAjoF1c7eS2TkiXb0q9WyUF8x3AGyXyYhEpio7clxUe?=
 =?us-ascii?Q?WS0oZX9gKeKxe5DiEFigf7HTDsCDPHCBvMgw60NI8WXXqRLDnVsRvrtu+/rM?=
 =?us-ascii?Q?8bbl62emc2AxuIdPNDTLG9kqzbUJuqFN2lffor/dbMQAPWYBuyZpHqm2OpiJ?=
 =?us-ascii?Q?Zld3iuYw/IqgGNtikVZNwyF29Z+T6/rs34WhtgchRw/Dav6GJcooj1QBUcR+?=
 =?us-ascii?Q?jldYhrHdlMdNc6eXKDtpC5y5hfCTYvWZ+VJks/7asRpx1Tba7+GZvQSjK8YG?=
 =?us-ascii?Q?AbZi+Rga5BrCn1IsrYV3hFb4mCk24rZF2/rKLHU4JqLMeoChLiEx+6iW4659?=
 =?us-ascii?Q?SQd7C5HpwHlYYZqh8yXjF7556asPxgE2JWZxBCDS+bTvtWn71ael4EAFLTgv?=
 =?us-ascii?Q?7MhE3clii2GJevDsmrzSu+dTayVjixo1BdqhkXuQrBR3C28EV2bSvN3iVSAI?=
 =?us-ascii?Q?Xa6XU1Wc6nWAOr90/l6/GZ/mwKDPsUd6TwdsomEjW1DlJTPzBqNKLXRh+LO/?=
 =?us-ascii?Q?bPmnShjj4ZKXaoQujjdECSTBxfIiEgDVikZE7Go1Y8i0pddJ9rz1+wYom0B5?=
 =?us-ascii?Q?o41efKWyTW0nBDDIkvGaXxAduyqehOOKK0FB/dMm2730w2ArtJDxi80oOalc?=
 =?us-ascii?Q?E9dzJ7BSZc+6P8gFgsL2B14V+JXz8nJ3vhpsmc854y99KCADwW1S/of/1VXt?=
 =?us-ascii?Q?wbj2kLX2Pb9ix4P2uOkAuJeDT2V+TXXtkeCYO+NXzjx2t7CGkBh6dM9psuZP?=
 =?us-ascii?Q?TTrX1L2sHMpsrNLmftUdbpCEiLS6+ugfUQ0zHAQ88M2NNe6zbKLRfkvQPScG?=
 =?us-ascii?Q?xgIIo9bjhoUuYswe3GZ1yOq2Zuk6YuB9+TBUQiGKSVLidpRx4MxIlXoZ0jKw?=
 =?us-ascii?Q?SomcoxXnHVsm9hDHDV8Uru/3R4qbs9mRLhU0Cep1r2vwTJxfHV1nNCh4dz8F?=
 =?us-ascii?Q?yhJulJdH/FHx0DeI6AsazRkuK8Iva4+3un6wHpVh3Cn6xfFtQZDqQbuhVHSz?=
 =?us-ascii?Q?O7BDtxppOuSN0QN3Ha1nAf3+84KwBqCrThHO2JBVW6Y545WszrzZBmMVrd2u?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cefc399-10fc-4ec4-62f9-08db66c80bbb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 19:55:58.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpaqtHtlg7/IqmjlpV84adr8Mq1N5GFXOJazKgUrBaaJPNnXwqBcyWup+KoJvaT3WFtES0cHBqK4pzVlamy/+NHX1NzIXXPCcaRaRRt0VvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
 query api.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 03:19:29PM +0530, Himal Prasad Ghimiray wrote:
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Does userspace actually need this reported in the device query?  It
seems more likely that they're going to need a tile-based equivalent of
'drm_xe_query_gt' that returns not only the tile count, but also further
details about each tile.  If that's the case, then also adding this
count as an extra field to the device-level query seems redundant (and
the existing GT count seems like it's probably redundant as well).

Are there patches for any of the userspace components yet that show
how/when they'd use this?


Matt

> ---
>  drivers/gpu/drm/xe/xe_query.c | 1 +
>  include/uapi/drm/xe_drm.h     | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c4165fa3428e..54efbefd663f 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -197,6 +197,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		hweight_long(xe->info.mem_region_mask);
>  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
>  		xe_engine_device_get_max_priority(xe);
> +	config->info[XE_QUERY_CONFIG_TILE_COUNT] = xe->info.tile_count;
>  
>  	if (copy_to_user(query_ptr, config, size)) {
>  		kfree(config);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0ebc50beb5e5..8e552aa55037 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -185,7 +185,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
>  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> -#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
> +#define XE_QUERY_CONFIG_TILE_COUNT		7
> +#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_TILE_COUNT + 1
>  	__u64 info[];
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
