Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033D1F54AD6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 23:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2FC10E19A;
	Tue, 24 Mar 2026 23:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bk7d470C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD56A10E126;
 Tue, 24 Mar 2026 23:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774395269; x=1805931269;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=WssHRMjstst6S1HrUmHtZFzQfAXyFf+IKkZcVK/Y7mQ=;
 b=Bk7d470CPhP+Qns/VfQA7dEK2jgEgxqpIH5P4Gv01bPElpUiZKVx1Hwb
 FGM2y27Ef/bIId6Cq6T+/CBkXLED3EZf/w1g4N4QzG5L+DjaCbJscDhjc
 BIvVawkDK0OQuXNRwJ+JkhIj0ygv+ss3+NrrB6NKTeg2/7hNj1Wp2P61X
 nQl75w24PjedPgcPNgdyOoeEODPdchLeHCxkOFhJk3HlVG78F/cldLuHn
 eKbA8vENnm0iMV1/U5N0n2v4VCvm4Mrq/xCLzr0yg9ZaAGZlliszp9tlu
 6qJnEic2Lum2KIfWmos+3l/A1F93kO/xIiuyQu+wZSEC+lUK4Jsz9JVwx A==;
X-CSE-ConnectionGUID: EZRsDLP4QiC3NXwbP5aTsg==
X-CSE-MsgGUID: DOOFqlTmQUaNbB1WWWva1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75452405"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="75452405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:34:29 -0700
X-CSE-ConnectionGUID: XOFd3+UXSje1QE6ogEnN0g==
X-CSE-MsgGUID: DlNwA6XRSXypko/yns6sbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221157689"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:34:28 -0700
Date: Wed, 25 Mar 2026 00:34:26 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/{i915, xe}/fbdev: drop drm device parameter from
 intel_fbdev_fb_fill_info()
In-Reply-To: <0a4dd4e4799769560806eea5cffd133cfbbc6f81.1773840563.git.jani.nikula@intel.com>
Message-ID: <d48dee37-ef1d-9955-4199-1edaf3ab4e3e@intel.com>
References: <cover.1773840563.git.jani.nikula@intel.com>
 <0a4dd4e4799769560806eea5cffd133cfbbc6f81.1773840563.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1664705110-1774393820=:294587"
Content-ID: <36809bde-ba59-b1b1-8c51-7ea31decda42@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1664705110-1774393820=:294587
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <399cdb95-f0e0-b808-9cdd-507b736a73a9@intel.com>

On Wed, 18 Mar 2026, Jani Nikula wrote:
> The struct drm_device *drm parameter of intel_fbdev_fb_fill_info() is
> redundant, as you can obtain the same information via obj->dev. Drop the
> drm parameter, and move obj as first (or the context) parameter.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1664705110-1774393820=:294587--
