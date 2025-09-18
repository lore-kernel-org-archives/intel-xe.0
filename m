Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA52CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 12:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A32810E17F;
	Thu, 18 Sep 2025 12:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/F5j2kg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A7310E143;
 Thu, 18 Sep 2025 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198603; x=1789734603;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/cbqcvczwtM3qfJwOvyz3uUA9J4XWh28ixqaK3Jsj+I=;
 b=V/F5j2kgWG4y/jWiN708z4C6ii9SyT9oNonj+lQH/tWsaa8NifNIkMK9
 sLpDUbuWBaOZTjrU5ZX2FjGg356vAGOnZuHKhePyo4k/Nk1/pz5Hq+VIx
 B69CF6TrC9dOopmles+Ea4a4FNnbsHFPGFLNwB3/l5YYKFbE94BYmfDNn
 H8Sy7GCOgj2ZOhFTL1T/PXhbEMGW1U9/bWRaihYWPOLc0arWoTKFEcIeh
 +QddbxO92WF9olhdK5YWvUtu0zh4b/LVDbl5hktL4DgsdXMH4jghY5UCr
 12WwArqS/OebvIkrns/WSKfsUZjdiM9RlrNY4rMsTeggwirRaHl/mOUYT Q==;
X-CSE-ConnectionGUID: 1AfSA0sHS8i9QSXS/7xu1g==
X-CSE-MsgGUID: s+rwcX9ySx+gDv4BO2pDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60446917"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60446917"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:28:52 -0700
X-CSE-ConnectionGUID: 6eAWjmUWQhel4qiETTfH6w==
X-CSE-MsgGUID: iucDUZw2Qo+PS43lY8AjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175933154"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:28:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, michal.grzelak@intel.com
Subject: Re: [PATCH v2 00/15] drm/i915: vlv clock cleanups
In-Reply-To: <dc4baf0c-420b-3486-98bd-24c4c53b5b0b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1757688216.git.jani.nikula@intel.com>
 <dc4baf0c-420b-3486-98bd-24c4c53b5b0b@intel.com>
Date: Thu, 18 Sep 2025 15:28:47 +0300
Message-ID: <e64fbd1d681c404b964c8512f79b300e1c7f5767@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 18 Sep 2025, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Although I have just issued my r-b on the rest of the series, I would
> have one question. Can't we add on top of the series a separate commit
> with rename of vlv_get_cck_clock() into vlv_clock_get_cck()?  It would
> be more consistent with the rest of the function names in vlv_clock.c.
> Patch with what I am meaning is in the attachment.

Thanks for the review, I've already merged the series. :)

Your proposal makes sense, please send the patch!

BR,
Jani.


--=20
Jani Nikula, Intel
