Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C18DC001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 10:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98D310E455;
	Wed, 26 Jul 2023 10:14:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18FC10E44D;
 Wed, 26 Jul 2023 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690366475; x=1721902475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pfRh5oyy6VCyiF3x2MneVJqc5gHtqenrUaifm9+HF2c=;
 b=XEEW8j1Ht88mZ1ZFAR/E0mwblR6ZSc6GjTjHaECiJEG21198fz9nz29p
 HMPzm1kTF3gQGNGDZAehRDiVk4RCF6HUqYz237qTIkrT7zibsLTP3JIAn
 LkWEXF2P+xB8yeJjBclddylKZ9GxYMj+8eleu6OacJaEm7IbJot9Gy+UU
 fqqGoRZR7RbFzLh9Es4ajRIwGIw9zx8AZ8lnY3LLZ0fgaNitFFCuDB4HZ
 GRu+UChhR6E+oBiQhy567x596rRqPkRTIIN5Uu+0Odn9JsHWjXiXqT31U
 AVgBFESiTy5nsAtam2yNdZZxcp8OXLvPvDs2unyH2/CxUxf8WbzTnJO/0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352873469"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="352873469"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 03:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720413709"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="720413709"
Received: from amuszyns-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.13.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 03:14:34 -0700
Date: Wed, 26 Jul 2023 12:14:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230726101431.o53pbvurkpouv2mm@kamilkon-desk1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
 <20230725205626.346256-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230725205626.346256-2-rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 2/2] xe_debugfs: Remove
 guc_enable check.
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

Hi Rodrigo,

On 2023-07-25 at 16:56:25 -0400, Rodrigo Vivi wrote:
> drm-xe-next commit "drm/xe: Invert guc vs execlists parameters and info.")
> inverted the param to expose the status of the non-default config.
> 
> And commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
> entirely removed the query check.
> 
> So, let's simply stop doing this debugfs check here.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I am sorry, please drop my reply for 1/2 because separate 2/2 patch
break incremental compile, so merge all this into one commit.

With that you can add my r-b tag.

Regards,
Kamil

> ---
>  tests/xe/xe_debugfs.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index 5e16a71a0..5434d4645 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -104,10 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
>  
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>  
> -	sprintf(reference, "enable_guc %s", config->info[XE_QUERY_CONFIG_FLAGS] &
> -		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "yes" : "no");
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
>  	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>  
> -- 
> 2.41.0
> 
