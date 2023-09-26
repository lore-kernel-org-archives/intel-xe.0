Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB488E7F140
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDA110E450;
	Tue, 26 Sep 2023 22:46:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182210E44D;
 Tue, 26 Sep 2023 22:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695768415; x=1727304415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JEAV4WPF8vFgX8kcHwxGMxFyw8DUrRV4bu4m1ucKno4=;
 b=Gwi6hj7EDUFuFp0Lz7ihspSqMyP9ZSnIkRKxWkcgzKe3CDhCqDFVRc9B
 r+12qD3Km5CcESiYvcYOKu4bBoOaS73Qd0uUeQtjZJ12yiS18qalWKM93
 5P3ZBqXMf/4jF7QXDtFSv/l/O1eMXNYbAn/P/br3Sb8N0uaNKAM0Cd1ab
 nj2PofGWbP/pEsVeouqai5I20GNEM7NGI5y5vPpAv80BRjosWp3cSYSaF
 MIYnfj7FQIQ5CBzIYLas3WNoS19RJAI9t7FrGNp192l9lcuW24yjrO/pH
 1YQExB6GAP5hkEi5vJN5FcwjjuPBm5FzONTyPPiWNdy0yvu+eckYGMtAV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385537129"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="385537129"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="995946082"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="995946082"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 15:46:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:46:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 15:46:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 15:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqM5IY0umLkcJ42d5PKuAFBeaLBCb7ZdFjjJGjkDYdebFWZ1HrIUijCdN/ShKKaj2QI2/ll72t0y4WesrfDoWO3HeDAWmbC/c4sKESVJS2ey3Knf8e7rCbLxyDsgPflsamVankMfKissONDWCGOGOcbiTJ3fheIfKwnvfqlCK1Y6CzMsH7XrrkO5ThQKcU1ByKtTQsD7L3+sST8O2v4u37GoA3g+VA714x8pIVBl5Sht9AGj+pfQ171Ojt6LskKlY7ygGSqVRaW41LfQYSgD1HxL8+xLfxqmZnJ5X2VNznHkDsYhX/cJd0L2rF95/DKg5DtXut5IoQPSOeLA3R0+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X24neFTWDznqHFGOoiPT5DcYrzmV1cB9n1T89aDDEkM=;
 b=C5cvpi4gwDsDkTAJRQ9Fkn1H0wO5e1kU4GH7NPXVNCpH40l73PKgkIlRQmHNboAOJ9PKDWoZ/PuUVoIR5bPe6GMW4lAQ8F7uboHsnU30vvcVGi3nf+ngDxwScLYkkJYrd2tarOdf8tGLsarzWeZo9vLafT8GR9BDgHgXe5noxgUWvIZ5nP1/dO7sCpFgAyIt45CiwoMnTW1UKYOLgzzgqIF4SgMT9HEA99EXPp2JM1WZtXz4P18xAkaJMHlc8/w/+4NFMlWSOZG6MmcIkqOxkRiNLvudb9OnvnZ9XYlT5ECHfJYIY9+Jcdhy2PUix3SJcPyZqoW3nkPhiJZ22pYIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 22:46:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 22:46:52 +0000
Date: Tue, 26 Sep 2023 15:46:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224649.GR2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 52295899-2aa0-45a1-33e3-08dbbee27a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1cwc3R35iUDjG0xBc1zcibgCa14n9tXZ0k6fv3jX0zwDAro2Uvmn5Lji/TKe1byKXgRyFlGW0WFYyvkEQWlgumEvxe8HtaXWFPymPbXQ69lbja9JDMuA9BPZAqP0T8KpVDijTbetP+63AjtZ55CJa7ZGg/0zJYY14f3cDwad7JUbY6/SnT82bPzXK717unzkP3tmaJnOHrMMTPU0x4Ta9zq/ma3/LxSpaXrPafjnh1TurROe1sec0haMcteL+7+Q+wUwxpbtZARG3JyLJp3rQPt74TFTFQ6TXhP1CHRkoPQCC/27SIAMPCgeL7klpM9rPkqL2mHZCj9GUmB3BOK9LDflk+qAgqZ9YWZxpPp09vegnqTWNyQIPRcxhRKemPexN0ZtoXKGIEyK9r3a7bSO5mu4XuHmp5NCigSrf4oSCfifVBKMMwP0LPy2gnApDu90XoJ6eWjMGdMtjzs5hRQGBni27m9MDMFrNzrvet2sB8V3PVq30sHzLhCc87fuD8Pm4e4CLOKMCNYMHiGRba4WxLqHRhKrF/0DTB74VCB7WijzHVfdpqQjKJq0ce0TNf+X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(6666004)(6506007)(6486002)(478600001)(5660300002)(83380400001)(316002)(6636002)(33656002)(1076003)(82960400001)(6512007)(66946007)(86362001)(26005)(8936002)(66476007)(2906002)(4326008)(8676002)(66556008)(41300700001)(450100002)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++c7XWAVOOHplUFATmt91out8HJYVb5EQ567KsE17blJKgWDEYzwJ9CIoGqN?=
 =?us-ascii?Q?oQWu6A45y/Wq1Hfx+BpSxd9fIaUw00l04QkZqH2JftlijEwp1HiILSJuPzdd?=
 =?us-ascii?Q?kl9oYPYGFiWUBq91wLqRxff6+QZs5Q6NKjn8UgXeAnZL8qAvo5iZFEO5Ywal?=
 =?us-ascii?Q?HHAjncXOsYFYS1ArlXIIpj7SW3bqpaZDvfUh/J8fvZfG/KTyGulV/alMUG60?=
 =?us-ascii?Q?6YsFfLNwuGL+PR3Cl3YsjznBPrILz6HJTuqy9cxVKnVAnNhkVkRxrA2vrg4g?=
 =?us-ascii?Q?kh9/3UwWy0E1MmO9PBakydpzbp/PYZZ9eXu9BBgjOd73L3zTEJOkCkLpI69N?=
 =?us-ascii?Q?bineFaoo3ICHDBpVjfCyOmq0RaZ0LOES6W6ab6N+qj1Fpo3QJnXs7xDp7lGp?=
 =?us-ascii?Q?xjjhLE85nVNstBQflm4EQH3l5inV/tvR+OIQ7Om+zLm+oaoQV40QGdphvob9?=
 =?us-ascii?Q?ivuw63BMkMBHIlVHRlg+wVXp4p18PFJO/pHuhXKoAzlTIxv/4qUZWXvEXVvj?=
 =?us-ascii?Q?8xwrCTJZghGYUf5ozG/PdmkEendzum0jG/iwc1jZsxRc9Nh/+C6aqNtrC85t?=
 =?us-ascii?Q?m2C4QcEdNSHjXdc6WIQDZfJ2nLzhib548YhMrftVnwOSX+C3cKkdfxk7RlvC?=
 =?us-ascii?Q?7q1WfY388lUZ2Csm1HDkARPVVilwgMzKZo/9uHTf5SthlOwFYiFUZuhTYd+D?=
 =?us-ascii?Q?GiPuuIhSRZCDW6XfiP4sWyfintDi9ebQUE2zCme9npNXc0ZxH2pFrfuQoXzW?=
 =?us-ascii?Q?F5YlYHAnCuwsXwU/XylQLuatkRIU5vx/x9HSjyihSgsCAgUeKbP183IAQnUz?=
 =?us-ascii?Q?+GTWQFXltsjZM0rLku7Rp8wMA+ujQh8kyAZLZ3x7MSnxjq7Wbuf3DXKxPXKK?=
 =?us-ascii?Q?QTxCRvy4ItSgZYYr/38fNIEc7c2NaTGrLKKhN+oNWq1ljweT1abVNFxnSvhy?=
 =?us-ascii?Q?DV+aCFaZX6ZoKbc9MZvOZN7JN4ez5zJ3Ir3vfcEfz3fjbWFvEYRXu9JEzXi9?=
 =?us-ascii?Q?mFP8HW5PHefxdq3cQY9Sy/Ci38vymT2vfoQgdstRn/AtUkW6OVBjL99xAq6s?=
 =?us-ascii?Q?X8o0h6IU3X+vpFizTf2VrMGN66wZHQ0merM6fe5K4EGsiFX5lI4OsfDw6L3U?=
 =?us-ascii?Q?b2seohuUQMPh5yQkDERyAWgYzAy6tnZs07Gg2JqCUhu6B4enlqw7yZ8XCvf7?=
 =?us-ascii?Q?rYKbe+Xx9oELFhPimuNPb+ZGW6m2JVZqKIFRnkXNxH3R+tzXk7dTkf/yGjeM?=
 =?us-ascii?Q?dZBa1D2W796GHaqN/NvFYznqOGP4ZQrpphX1CffiDh+FLs/lq27JHQCoFNqF?=
 =?us-ascii?Q?M8Je1G6MP1v6mvqmeWQUqrpAXc3EIN102LKeAFZB+nynraBZlxcDzxGDUZD9?=
 =?us-ascii?Q?sbwcbFpUSE3QX6PB28+3it6s1pFNaKqdRIpeZFO0D2e1aNops/f5OU1fR8Mm?=
 =?us-ascii?Q?3PzaYqzRuTNonINRQMOEItO6pXufGJ9aX/i8pA0jGV+zFHeap74LPMYRXvfK?=
 =?us-ascii?Q?IvJS2FfrFJ8/x5L30hpJsYvDIA1B1iKfdncY0VGunPUvjhukjouacHh89hci?=
 =?us-ascii?Q?V1hL+4+gwVUxnvHYPs5M6xbGKOTxmTDXyMpiSAdn4AFoBpsqnql54j92OyIj?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52295899-2aa0-45a1-33e3-08dbbee27a30
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 22:46:52.6141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94h6+hjaybGxOie7vV8GDs+3q7czplMkF3sdMwo2TBCT34pb86b4muoMtN0m+Nzz+M8+9xw17HT13yLubWNKcsrLq4OEzWj8POdnx72UNw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 11/14] lib/igt_fb: Add Xe2 mocs to
 XY_FAST_COLOR_BLT
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:43AM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_fb.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 722996779..d353b439f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2754,6 +2754,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  	struct blt_copy_object *blt;
>  	enum blt_tiling_type blt_tile;
>  	uint64_t stride;
> +	uint32_t devid = intel_get_drm_devid(fb->fd);
>  
>  	blt = malloc(sizeof(*blt));
>  	igt_assert(blt);
> @@ -2763,7 +2764,11 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  
>  	blt_tile = fb_tile_to_blt_tile(fb->modifier);
>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
> -	mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> +		mocs = intel_get_uc_mocs_index(fb->fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +	else
> +		mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  	blt_set_object(blt, handle, fb->size, memregion,
>  		       mocs,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
