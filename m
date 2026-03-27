Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C0510ED641
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 09:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF3310ED28;
	Fri, 27 Mar 2026 09:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lA3tp3L9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AA110ECBC;
 Fri, 27 Mar 2026 09:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774604784; x=1806140784;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=qJP4cXACCP/vOQtb0e6q3BAacU5M4vWrtvi8V3LwN2I=;
 b=lA3tp3L9pdQoAjl8Fi3C+Ktw7RGIpSMTv7niJDK2RFDKpBDLkEei6PGh
 uhycolhrio3lNYjAIzgeGbxdopHD45z+624G8ZQvpYhlkR163iHU8Ae5a
 BZjNKr8x/zZaTYlLOp84WD0qXIx6mKGxoHoyugIfFjuOaFc0eOu/T/f64
 qcURt5Qlmdz/Bep0FRvr/1fijvK+kwn85jBjKASJwjJSzNQc3mFpJLpXt
 029wOhgmRpu1EWw8vJRqDLz9e2vz63sX4bnqjeYKKwV2jjNTSs+vBDRsW
 tvUEsQqkb9ST04f+ZSIQqRJbMXI6kUYliai8BRrmI5v8o+IvIb4sZSwWp w==;
X-CSE-ConnectionGUID: ZSjK3mJ5TJCMovP8qf0X8A==
X-CSE-MsgGUID: Zk9eWdaKQm+f85acqw+j1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85982734"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="85982734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:46:24 -0700
X-CSE-ConnectionGUID: rtCcyg9vS++/rPpEC/mQug==
X-CSE-MsgGUID: PLQ6IMDtRPyCXfmuyKIBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="230194689"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:46:23 -0700
Date: Fri, 27 Mar 2026 10:46:20 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 7/9] drn/i915/casf: Remove redundant argument from
 intel_casf_filter_lut_load()
In-Reply-To: <20260326223139.19116-8-ville.syrjala@linux.intel.com>
Message-ID: <6fb36f40-3ab8-fc68-b065-778ea51790e9@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-476154567-1774604783=:356608"
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

--8323329-476154567-1774604783=:356608
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 26 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> intel_casf_filter_lut_load() can find the crtc from the crtc_state.
> No need to pass in both.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-476154567-1774604783=:356608--
