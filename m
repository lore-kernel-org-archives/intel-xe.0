Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44733EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 18:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901510E11D;
	Thu,  3 Aug 2023 18:33:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B711A10E11D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691087597; x=1722623597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=clXjMp0s+hVzeLwBfai170xQz+b0RX75WZ9vvQNZCaA=;
 b=PAJRoUgKpqaVdTLijFWsE0LyeTtjYlIpAu44j+itLBtMqMzQ0L3X6EJp
 GjZ9Sm2jIHrds7Xx1ei2VN5C6Sv7DiE1y5/6Z40vj5naleFvKtaVljAVX
 klWOmwtCaymgVJQyIwgcY3Nv3wkUIwRC2oORBByJVI/dNhNiqpYuP1e3H
 dhDQZ3QuUkdDbfWvabrufeG33BnqB11FOgzW3d8vcL0WDCs8uAenjlM2f
 Iywck1vh1kxlNWDXVRREzKCdrGipNpUhg7DxMAL99Wu/ZTHjhWJdQpuFs
 FRaghyYjzabReY2Jz2BHk0nTmrodx3hncPwzGSHacqdQPG3/CBfhGFHXw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349556683"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="349556683"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 11:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819789559"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="819789559"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 11:33:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:33:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:33:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 11:33:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 11:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuAB7ugi+WJ8rDBURy7mheSVveLq5BeNIUXB0r5JxZNoI3MMZaFJa9w8vg8o1d/Ebu314TNOt7FakXjUxzFvt6MzuIE8go6XDIQ1EZ7Qb2Ox9Vvvo5G0WrJckKfaSwlIloelObKBP7UMGsTh1kfExSULxf3ha9RgLYysS+0oalXE3U/aolKWAMWWvjg6LTHESTpZhu7drf9zHREq0/6hTNsD1DOzMe9Oz7AVBTJJSiXPAwps0RFRna9syMDUkfNM8ajMLHiLnTpJEpAhon6tTowezk4ZxUdKhOeMNMC/M2EF4N/TOiJr/RTePOM+emUWEdIFP+JdAfhpTeRfX5urvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuG9W0EqJKRsHk/RiBsenhx9ui7/1S/MiIYvbIqYuFs=;
 b=lpAxvVivdxnGaec5arP6CB0CHUa6264h/2QBQNYCMJ7/+5sphQfgX4sM2nqqcK2oynh8moPyaV6iNkr6Gjvh+0B5SeRvlq/KJ7dWAUjyCnpuLekRsI3h62knv4aHdPU0nbFLFWhYa8uf1cKetb5Jpw1sml9VZtH47zgzkwfJwtQx6NL2WN8zibPXR68GOvPfFgqNBD93rw9zKDiGUu0VtigOKhXcFll3rwQ+sTWoQnX3ootvFB1W/uswkgIFoZbOpFFXvZeNLJ51On2gZlufYv0zq/bbGs6zxE3QCK4Z/chjERkZeCpyCkQvM5n6W3ibQwIzMhqr8K8fgYtlaRoc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7954.namprd11.prod.outlook.com (2603:10b6:208:40e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 18:33:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:33:14 +0000
Date: Thu, 3 Aug 2023 18:32:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZMvytzGNetQxODNL@DUT025-TGLU.fm.intel.com>
References: <20230803173849.285599-3-matthew.auld@intel.com>
 <20230803173849.285599-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803173849.285599-4-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff68dda-c399-4bf6-09a3-08db945018ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPgJcbwbx4q6hnG0yWwhueMjxRHIuGOxy2OXxXWW+DnqdcNpAj9m5xAoG9mxgu0GafL8zxyfHrxNXNJkZA9/ye81OrMUj+TbzkAVvBdtsugdGAyvnzl8n8OYsYRVhF83EvzBzIM+a3pBmEbBnr28hOc1/quArZ1PsNibwJOxZC2oLYwpX2lIPQWnaz/JokfZqnDnLx/3Sm0nyMYNkoLbBrv6g7cVOb1qqL3kIyo9zvQdDpQiHgCHUUANnJ0lEE3HlCAFZXkGYY49LSSkA6WIW8l21iQfO7RnYIZVTY7WB+XKul0NEL8ROYUMiEo02w0zuZWA6SMqZBBpfxKk/y7BiDV/xZv1behTKPKjvn+NLrP2CA67+XThrUcWA1vIi3V9KS2KXWwijh3afm3sAwc7V5LsiPFvL11xvFIU8cIFTFhDOb+e4KoD4s3XRqo04jK8WQUczjC2t3YQUo05GduxpgRLuK0ofDubXgp8NRDrjMJhDNScbGt60dGOywsipzweaSuE8Buf5qcgZDnGuCpxCuufDCE3O8xQfs2Qtq6RVEwblmHP0wD8TvL5IUeaTRnX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(6506007)(186003)(83380400001)(26005)(8676002)(66476007)(316002)(66556008)(2906002)(6636002)(4326008)(66946007)(5660300002)(6862004)(44832011)(8936002)(41300700001)(6486002)(6666004)(6512007)(478600001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JhMtG+Nugxtxm1J0183auA7xrHDtovakNFBToc2vSOPL4UsT1ps6CYDQ0diN?=
 =?us-ascii?Q?o/Qk7HZa8HSTxYay0pQx8/RjglyL2mrqfSCKw9Jl4CwxFQirFJ17Qls2kUzM?=
 =?us-ascii?Q?FNxjjbYaMX8jbded0CySh/mgvw3ydCS+KEUgJ4x7ttaXnbbOqIrO+Z+XtVwJ?=
 =?us-ascii?Q?XWo412nm5XXCmbxKuaAxsEDTtxBfsUY0Tz4xeAnNfo9Rm/g8NeuN3h66rJym?=
 =?us-ascii?Q?Mb1hGXfqxHeuy4nExdxdqW7QM2zzXnAa2dSpSl9Uthicna34z+uKSZbnLLpQ?=
 =?us-ascii?Q?4ZTRwwfjZvBnhcZak86okRyqlXUuzJ86soNE+W6xNZJLKLau9WOOqsdIZvbq?=
 =?us-ascii?Q?hTgRpaQVh0PTCInG0OQ485AuUxeuC834xjc2PtjRPtfBm7yM9IlMc6yAzYBS?=
 =?us-ascii?Q?rI7y9DwkXcTDy0pRoAwctBuNywLyLu9XuNnc3xqWtwMNcgneLoZjR4kJK7r5?=
 =?us-ascii?Q?o7Q3qQVZxu/DeRT3+wozfetA4V+VGOF4VvswkEo0fFtt5opZavMOU7vgcQRg?=
 =?us-ascii?Q?S7XHz8s044W1+EpRGOC8lulpgyt8nvWrdfH23H1rvaMeo3W6+yFBcPseIkT/?=
 =?us-ascii?Q?m8mn/kwVJAV+P07IZtFCPeRoqkJCHDUuXQ+PZVPrhHIwoMLbPXSNky1+GwSZ?=
 =?us-ascii?Q?ZDcnpfMg6iXgR18HhWoN3/BR/Du7L+oU6aNeTJQCG52vdwWjsq0FFlAkI1FD?=
 =?us-ascii?Q?tTgTJdD/97ZJEDSo0Nnli7UffuKVbc48IVLBFz0uXjxF48QTZEWC+v5M+6fN?=
 =?us-ascii?Q?Uky6pWtqy0PQTyDGRVuQlYzYF+imTu7+fe7B2+bi6J5pCuLbUj9rY6Ka4MfZ?=
 =?us-ascii?Q?GrzokzJni0fWMABWbKhROl/1Tsv8eVr5q+JkImU/mJwEDbIu3vgHYgQeHEG7?=
 =?us-ascii?Q?jeAuxVR2PkzbEX0SNXEBJSw5Eb9/ktO6VIYb6VYfhQilzeKzTzZviFL/eGkx?=
 =?us-ascii?Q?d3l64iVUgLF/GfQ9eyHN4e7i7zFo407MEnRmoOSDcwIR71fzuQjnYurEDbxh?=
 =?us-ascii?Q?Yg4M3TwG3qewjjqHy8xIO7oUnOEWStJix2omVaJQ1eJ6/rCNYDXYv6y+T7Jg?=
 =?us-ascii?Q?89gJ6esti2BxB4OSc955HqNzsCOxKyqdMVgzI869xEEs3Fw8vbBw4Eqj50Nu?=
 =?us-ascii?Q?Q0BKPj6S+7etUByGbXwCOrhCDvMtwVOss6d041Pnes9aE1ecCJED20J9MG9N?=
 =?us-ascii?Q?3DEZI+B4UONK6vI5Ro88a4JvznVm/Yq/HP6ze2xn6LyV81V3fxsOAL38vnBi?=
 =?us-ascii?Q?PVG+BwPY2ISIFIFWDsEztyArY8sttbqbXjF1LpIO6Kf7sdI6rekXQluTNvG3?=
 =?us-ascii?Q?l3qzK/z15odt3VoK0zfBflbykhGgUYXnvSMB9uUEhiRRkKIZkL2NMFEhTte2?=
 =?us-ascii?Q?Oe2JfIFNzk8O4UUtJRh7axNVowbnSWhmYNMWdDUMdoKDickjCaVvPn6X5eaE?=
 =?us-ascii?Q?ygZ78vphr+Es9cksGNZJadv6R3SLnxW9LRT9CkZlBVPYhXmLSVpZg1pJ5Y7s?=
 =?us-ascii?Q?z8tf/OY5yjmjN0oXq3IiP2+3849InTJidEkNas60QoKMBojAAOUJ6RMo6pzr?=
 =?us-ascii?Q?O8Dbj55OVQ8OOGs3ImKUzC4CQI3kf3ze8G92JJSDfTf8UnbHWdSFliBj2eBf?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff68dda-c399-4bf6-09a3-08db945018ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 18:33:14.2156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfgHph91HvVcyVeQXsfbh2sFTfpCoj7rDrGHShTrFWthSuPDQqwh4XoalnnAYaoP+dWo1WtVYSmGoKYwPNCAZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/guc_submit: fixup deregister
 in job timeout
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

On Thu, Aug 03, 2023 at 06:38:51PM +0100, Matthew Auld wrote:
> Rather check if the engine is still registered before proceeding with
> deregister steps. Also the engine being marked as disabled doesn't mean
> the engine has been disabled or deregistered from GuC pov, and here we
> are signalling fences so we need to be sure GuC is not still using this
> context.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b88bfe7d8470..e499e6540ca5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	/* Engine state now stable, disable scheduling if needed */
> -	if (exec_queue_enabled(q)) {
> +	if (exec_queue_registered(q)) {
>  		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
>  		if (exec_queue_reset(q))
>  			err = -EIO;
>  		set_exec_queue_banned(q);
> -		xe_exec_queue_get(q);
> -		disable_scheduling_deregister(guc, q);
> +		if (!exec_queue_destroyed(q)) {
> +			xe_exec_queue_get(q);
> +			disable_scheduling_deregister(guc, q);

You could include wait under this if statment too but either way works.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +		}
>  
>  		/*
>  		 * Must wait for scheduling to be disabled before signalling
> -- 
> 2.41.0
> 
