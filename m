Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA71C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 04:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C110F7FB;
	Wed, 27 Mar 2024 04:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZ8GT/Pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7710F7FB
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 04:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711515257; x=1743051257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kSSE2H49ffLPBrX49qPDOQlZwniroYa3ueOaWjIAG10=;
 b=GZ8GT/PeYFiEY2Yye+2p/kKMty4uzvwHnk3xj5wW+GdK/7HdZr5nIGJg
 24O6AetPPf5vCCZrTWBVE5w41H+NHmn0q1ZVea8Q8K9d9gr3wcn7s854F
 tHsMChB7kWkQac9zKpWBGApviFrizdHPTFmfthJWBpDDCohZiXASmaxEk
 wZBSKwNbv5oGRpqwBzhf/y4NKXcH5ER6oLn3x+CT9rBZHzEm9s2PotfnW
 kPG8HAOZ1Y16/QbdNeSkJVyh50PYCRvUijtLL4AMFz4e7/BpG8it0SPR2
 PgsH830sABVfmue1A5ZPSbrn1ivmzqLHLjbHV/u7JnNzLmdBS9LvyHVXx g==;
X-CSE-ConnectionGUID: tbRP2g+uTHqilPQZa1fQCQ==
X-CSE-MsgGUID: TzHKQNk2SqiwqtwRNNyq3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6452645"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6452645"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="16031091"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:54:14 -0700
Date: Wed, 27 Mar 2024 05:54:10 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/xe/xe2: Send flat_ccs value in struct
 drm_xe_query_config
Message-ID: <20240327045410.kjf3sspjfpwe7blh@zkempczy-mobl2>
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
 <b672be6eea948e332ba58b63d6f8c4c71c37a42b.1711447408.git.akshata.jahagirdar@intel.com>
 <f2e72896-8524-44a5-bb75-ff277c50eaa6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2e72896-8524-44a5-bb75-ff277c50eaa6@intel.com>
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

On Tue, Mar 26, 2024 at 08:25:56AM +0000, Matthew Auld wrote:
> On 26/03/2024 10:10, Akshata Jahagirdar wrote:
> > Currently, we don't have any check in IGT testcases if platform supports
> > compression or not. Send this flat_ccs value as part of the struct
> > drm_xe_query_config so that we can read this value in the igt testcases
> > and proceed accordingly.
> 
> AFAIK it's not valid to add uAPI just for an IGT. uAPI normally needs a real
> open source user (like Mesa etc) with UMD acks. However if this is going to
> be used by Mesa etc, how do they tell the difference between "this device
> doesn't have flat-CCS" and "this KMD version doesn't support
> FLAG_HAS_FLAT_CCS"?
> 
> If userspace doesn't need this, then other option could be debugfs. Or if
> this just a single test perhaps we can just dynamically check if the CCS
> state is zero for compressed buffer at the start of the test?

Just for making sure - is ctrl-surf-copy behavior defined if there's no
flat ccs?

--
Zbigniew
> 
> > Fixes: VLK-56136
> > 
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_query.c | 3 +++
> >   include/uapi/drm/xe_drm.h     | 1 +
> >   2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index e80321b34918..8a3a3117491c 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -332,6 +332,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> >   	config->num_params = num_params;
> >   	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
> >   		xe->info.devid | (xe->info.revid << 16);
> > +	if (xe->info.has_flat_ccs)
> > +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> > +			DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS;
> >   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> >   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> 
> This tramples the previous value AFAICT, like when we have VRAM + CCS on
> DG2. I think we need |= here.
> 
> >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index f44a19ae9333..08783234bae1 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -405,6 +405,7 @@ struct drm_xe_query_config {
> >   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> >   #define DRM_XE_QUERY_CONFIG_FLAGS			1
> >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
> >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
