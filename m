Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCD606A333
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iemi3ABa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F3510E511;
	Wed, 18 Nov 2026 10:24:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0F610E511;
 Wed, 18 Nov 2026 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794997488; x=1826533488;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Wm8VmhTabhOpl9Lbk2lJZ3IrVa6fHF0sCSEVtOGg6zg=;
 b=Iemi3ABaSToXfLC84zsfOPLIX4PazDV1EbYFh3B17ttdFPI+MFS83iws
 NW8MgtQ8G5M8ogIZHYVqXvPb/rvyKbwqjIUTZq6rHplbse2uMmYuyVp8q
 krTwGFrjcmet4LcuCx+a8iMpyLjXMbxwXg8nneeWk5Z4TfMuoKqmgPOue
 WyPR5mifhbvrtAykGv7Z0y9i3/WyaH3Ilxmf/wWx4+7yos9a+FOh+Cv5W
 41UErE9qj1T2AOlwOsO6IS1PDNhk8DA7catszkUliRQpHBR145MifkU1G
 E6ZkSS72AsvqueaVhbMxsx5wdRCeYGf7IiTGjerNc6SGbwxIh3wO8UbGf A==;
X-CSE-ConnectionGUID: gtYn2vl6Rc+YjFWBO/F5cg==
X-CSE-MsgGUID: KaSmScMdRky1DBNR8+U/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3792713"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3792713"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:24:47 -0800
X-CSE-ConnectionGUID: A2JZtvEUTmGsZ6ZmdZmgSA==
X-CSE-MsgGUID: sC/yW/N9QpammuvW+kL6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="12045472"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:24:46 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Auld <matthew.auld@intel.com>, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH v6 1/5] drm/xe/display: Avoid using stolen memory for
 framebuffer when media gt exists.
In-Reply-To: <20261117143038.479557-8-dev@lankhorst.se>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261117143038.479557-7-dev@lankhorst.se>
 <20261117143038.479557-8-dev@lankhorst.se>
Date: Wed, 18 Nov 2026 12:24:43 +0200
Message-ID: <db7ccaec935c5df651a6c1d051d70185b06872b0@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026, Maarten Lankhorst <dev@lankhorst.se> wrote:
> On systems with media GT, extra latency is added when accessing stolen
> memory when the GT is in MC6.
>
> Simply disable allocating stolen memory for framebuffers when media gt
> is found.
>
> Thanks to the previous patch, it will be possible to preserve the
> contents.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7513

Closes: instead?

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Link: https://patch.msgid.link/20260630135523.1775379-3-dev@lankhorst.se

What's this needed for?

> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_display_bo.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
> index f5102cd0e95d6..9385026a80b97 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> @@ -131,6 +131,14 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>  	if (IS_DGFX(xe))
>  		return false;
>  
> +	/*
> +	 * Avoid stolen memory when the media_gt exists,
> +	 * because a lot of latency is added when media gt is in MC6
> +	 */
> +	if (xe_device_get_root_tile(xe)->media_gt)
> +		return false;
> +
> +	/* machine hang when doing lots of LMEMBAR accesses */
>  	if (XE_DEVICE_WA(xe, 22019338487_display))
>  		return false;

-- 
Jani Nikula, Intel
