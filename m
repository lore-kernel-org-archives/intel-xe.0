Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2DDCCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 11:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8154410E07F;
	Mon, 27 Oct 2025 11:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHCeqIw2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718310E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565430; x=1793101430;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=op/Ny16WSm8HXs66KIJ3XQMm1uyUomUbRZ4eaJIstTM=;
 b=hHCeqIw2kBgUzDyeUteqQn3jXkGgn37ztx4LfRxNDkUd2dXbCYAbETwz
 2JXwv2AZFyEX0UxWbVJgYyD4YOEaZCRtTtRuyb2baAILGEAwDBTh0q4fQ
 YaBPRdjVwRLatuQE02DdwaUdL7D8Aba2AAbzU0YlYphPUZVY0feEJLZkx
 ZO+hFMW0+hYzm92nkznkVPwpm0T2Ba3tb0/jZ4dnftLj5PjP8J2cXtwxV
 aC+h2yZxFq+lYfKK6cnAxtFWemtkPLeHtAePCex5uVk/yfDjs6XOP+fvx
 o30+UbVKAX7scsn9zWVR67oxI8oKhd1gaUQOByicZoktYIV2Pa++1xBx6 A==;
X-CSE-ConnectionGUID: 3Fal0fMnRJ2qvvfkQyR5qA==
X-CSE-MsgGUID: DO034S74RhS1R3Hc0tsr0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75087677"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="75087677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:43:49 -0700
X-CSE-ConnectionGUID: SE1bQItuQgawgnEdB47aaQ==
X-CSE-MsgGUID: FiqRKGGYTUSzd8wMucDnZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185780944"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:43:48 -0700
Date: Mon, 27 Oct 2025 12:43:45 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 6/8] drm/xe: Improve freq and throttle documentation
Message-ID: <aP9a8duiit7MXIEQ@black.igk.intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-6-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-gt-throttle-cri-v2-6-41f8288a71a7@intel.com>
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

On Sun, Oct 26, 2025 at 10:57:18PM -0700, Lucas De Marchi wrote:
> Add xe_gt_throttle under the "GT Frequency Management" and improve the
> narrative making sure the documentation for both *_freq and throttle/*
> attributes follow the same style.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I've not checked htmldocs but trusting you did.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
