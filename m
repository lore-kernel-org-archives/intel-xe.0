Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCFCCAC5A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 11:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242E310E715;
	Thu, 18 Sep 2025 11:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lz43nQbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2110E715;
 Thu, 18 Sep 2025 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758194903; x=1789730903;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=9bfpBTp2+yOriZIlFTrhMcjSlPuTs9+e0Y4k/5a05V0=;
 b=lz43nQbtkbeDwAFqodTd9kYYvQCvsAVlQ4mz1uShHNABu6KudivIeYCb
 8ESa0DPoYtMcVb+hAcWqnGDQUP6OfXUsmoZDzRZv8uL32kciojZleyh3l
 7HQa2zHYLGxAywg7Ae3UFpXDsupw6hEFUKR3Z7xOhrzGMyT/xkthIlTvt
 lsJqPLzbd3Pkhp38AOkr6IuQtVmohjbnMuVGzLd1mizsfsWKRGnlOK8rO
 EmXqfDI+j9TubNuadp1YE4w0RCA/IJ7THV0bAFUcaQg1PFLFdZ8u6UY6J
 iDocJHFkVnbO7vQVc0KLN2rYWuhAVeFldpcp+KNPCr+Kko4MpFvxz7uQg g==;
X-CSE-ConnectionGUID: x46sPkxBQEizdDqy9CK3RQ==
X-CSE-MsgGUID: T6kqViCxTn2vAXGNo0rZzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71202102"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71202102"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:28:23 -0700
X-CSE-ConnectionGUID: Ow0zXXqoQJSXB7PwpI56Fg==
X-CSE-MsgGUID: 2XhNzM8fT76WmCU/fxQQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175591863"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:28:21 -0700
Date: Thu, 18 Sep 2025 13:28:19 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, michal.grzelak@intel.com
Subject: Re: [PATCH v2 14/15] drm/i915: move hpll and czclk caching under
 display
In-Reply-To: <cbca9b13f2235a624a21bf7617ffe763e25c848c.1757688216.git.jani.nikula@intel.com>
Message-ID: <fb87eb6f-6df7-8621-547a-1c4ec52bdfd1@intel.com>
References: <cover.1757688216.git.jani.nikula@intel.com>
 <cbca9b13f2235a624a21bf7617ffe763e25c848c.1757688216.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1510050614-1758194902=:965976"
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

--8323329-1510050614-1758194902=:965976
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

On Fri, 12 Sep 2025, Jani Nikula wrote:
> Perhaps not the ideal place, but better than having to have the fields
> in both struct drm_i915_private and struct xe_device.
>
> v2: Rebase
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1510050614-1758194902=:965976--
