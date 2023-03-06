Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51D3C61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 18:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCA810E41D;
	Mon,  6 Mar 2023 18:08:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AA510E41D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678126094; x=1709662094;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1n0taPedc+zYlXZwLrD/QFDrONCQ2tSJXrWaK1JGWLs=;
 b=Kfx00xkkR8cVQnLfSw9m0Xw3K5vTMETqeFLy9kRIMUdGmahh+wzeO0lq
 tQd/1J3EcOJlR86GJ4YtcPnfvGuv864kzqokh9wYDYxIMFs/jOArgJCTa
 LFliUOBh0DUXDphhStbqF12Cnkz+ufWkQcxcVJVMW8sGU5jpbKJa1UV0q
 IoQ7YYNO4fB4+OqKugGA/4/X+WdJ3bHzuJdUI3Tkf0sG9LzZunAH+LBa0
 7FhRtSjiE4OSctqf7F8U89qR+Zw8bQ130itP+rvOY6f9aazeIHDtvCMtI
 enrXyHzEEJ0RWXIOgNsh3ayaATMYo65ftgSBGIP6OwSkoEeCeiI5rPpFs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="323941408"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="323941408"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 10:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005514536"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005514536"
Received: from ramuchie-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.58.188])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 10:08:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230306175025.720323-3-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230306175025.720323-1-lucas.demarchi@intel.com>
 <20230306175025.720323-3-lucas.demarchi@intel.com>
Date: Mon, 06 Mar 2023 20:08:09 +0200
Message-ID: <874jqxu512.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Constify xe_dss_mask_group_ffs()
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 06 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Due to how xe_dss_mask_t is implemented, the type is a pointer.

Per coding style, the fact that something is a pointer should not be
hidden.

BR,
Jani.


> Since
> this is only used for looking up the bits, make it const so it can be
> used together with a const gt passed around.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 2123f84be336..967f2349c67a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -109,7 +109,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>   * groupsize and groupnum are non-zero.
>   */
>  unsigned int
> -xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum)
> +xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
>  {
>  	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index b2540dc266f2..2375f005e0c8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -15,6 +15,6 @@ void xe_gt_topology_init(struct xe_gt *gt);
>  void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  unsigned int
> -xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum);
> +xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>  
>  #endif /* _XE_GT_TOPOLOGY_H_ */

-- 
Jani Nikula, Intel Open Source Graphics Center
