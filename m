Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1A606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 05:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XV1zsJKa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918DE10E4C1;
	Thu, 12 Nov 2026 05:50:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7853C10E4C1;
 Thu, 12 Nov 2026 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794462629; x=1825998629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSulcHrIkUANm+NsGpY4cGWQZPW7PEXcbkOaNRGvBRM=;
 b=XV1zsJKa2mJTgdcQOM//abIXQJFkO1gPSyzIKmN1exNSBP3rWzql5Etx
 pVWCBHL3evlFueEiS/1S5yO+viAF1dpPTWdAhqjtnNxaawnaoLmOey9ys
 bCExazJqinalfQcrjOUi9pwXO5RZ7OYgsTt2gunWQyx//SezHq7pkCui1
 9RLlg9bz4R9otfnHFla6x7V3imwG71iLfoFt54NZQZWSkY58k3wSG44yp
 gQtzR73lgEqVUSJIEvyjACan8qyaB+EIow4eGdzm0gR1I4PFkjSX+I8/R
 fqoGVvWAR6oW6tb2IKY8QIevdXaXch6HxbieizuUwNT28ooygn3DIpt6P A==;
X-CSE-ConnectionGUID: X28gG4plT+qfiBoyUZHyXw==
X-CSE-MsgGUID: frmeoI3HSJWRBDOQ1tVFVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3335546"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3335546"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 21:50:28 -0800
X-CSE-ConnectionGUID: JznElEXNQFuh06GEzNYiBA==
X-CSE-MsgGUID: kqDaBprWQ/mC0IjVS6IfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10292864"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa012.fm.intel.com with ESMTP; 11 Nov 2026 21:50:25 -0800
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Xiao Lu <xiaolu.xie@intel.com>, Sam Raskauskas <git@starsam80.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v2] drm/i915/dp: Avoid YCbCr420 on HDMI2.1 PCONs due to
 the TMDS CLK limit
Date: Thu, 12 Nov 2026 13:48:16 +0800
Message-ID: <20261112054816.246137-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111050542.3935869-1-xiaolu.xie@intel.com>
References: <20261111040636.3932240-1-xiaolu.xie@intel.com>
 <20261111050542.3935869-1-xiaolu.xie@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The reporter of the issue this patch fixes tested v2 on drm-tip
(1434742f20cf) and confirmed it in the issue:

  https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17800

The dmesg he posted in the issue shows RGB 10 bpc for 3840x2160@120 on
the PCON, with FRL trained at 40 Gbps, where it was YCbCr 4:2:0 before.
He gave the tag below in the issue and asked for it to be added here.
I will also add the issue link as a Closes: tag in the next version.

For reference, the commit message of v2:

> drm/i915/dp: Avoid YCbCr420 on HDMI2.1 PCONs due to the TMDS CLK limit
>
> When the DP->HDMI PCON drives an HDMI 2.1 sink using FRL, the sink's
> max TMDS clock is irrelevant: the HDMI link doesn't carry a TMDS clock
> at all. However intel_dp_hdmi_compute_bpc() always compares the TMDS
> clock against the EDID/DPCD max TMDS clock when the downstream limits
> are respected.
>
> For a 4k120 sink behind a PCON with a 600 MHz max TMDS clock this makes
> RGB 8bpc (1188 MHz) fail, so intel_dp_max_bpp() returns 0 for RGB.
> YCbCr 4:2:0 halves the TMDS clock to 594 MHz and passes, so the driver
> ends up sending 4:2:0 to the sink (using DSC to fit the DP link), even
> though the FRL link has plenty of bandwidth for RGB.
>
> Check the FRL bandwidth instead when the PCON will use FRL, i.e. when
> it supports source control mode and the sink is HDMI 2.1, limited by
> the lower of the PCON and sink max FRL rate. The TMDS clock check is
> unchanged for TMDS links.
>
> intel_dp_mode_valid_downstream() already checked the FRL bandwidth, but
> with a different set of conditions. Use the same helper there so that
> the mode list and the bpc/format selection agree. As a result:
>
> - Modes that need more than the lower of the PCON and sink max FRL rate
>   are no longer listed, even if they fit the PCON max FRL rate.
> - If the PCON won't use FRL (e.g. an HDMI 2.0 sink), the TMDS limits are
>   applied to the mode list instead of the FRL bandwidth. RGB-only modes
>   above the max TMDS clock are no longer listed.
> - Modes that were previously capped to 8bpc by the TMDS clock limit can
>   now use a higher bpc, up to what the sink, the PCON and the FRL
>   bandwidth allow.
>
> Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>

Tested-by: Sam Raskauskas <git@starsam80.net>
