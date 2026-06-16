Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68572CD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2320610E8C4;
	Tue, 16 Jun 2026 08:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mojo7o4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188910E8C4;
 Tue, 16 Jun 2026 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598328; x=1813134328;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=G16+iKDSRAnsME2X1DvlyBcjuFVrECOhM8flt/Ua0Dk=;
 b=Mojo7o4lvbCmf/f1rzuG/XTkWVGSUKzCmGmbnMGP0OCK6/P6j36A0MD3
 m1uBoHlaKxVcKvbQPcg0GZNTwepDbh3n6rnzOlIb79C1WxDW28ay5jBED
 R/wcFtJP+I4gHLJ84k6hp0Xmecdc2JFu4sbefS4rdKFBqu4BogY/2nbG/
 ET6/UovuZgP+o3G1EBstRvGZHwyQsadpW+GJ0NqggXofyiEH0H/I/a0t3
 EL7sWw3gBDGWo9jYP51aRhbKD5LBNxM+DkZC7KP5Jzk+n+2/En8KqwP4i
 Hl2VE8jfZy1m3scfEW+u24c2KYqC3yjEQWu5/rWNYu6qo98MfkrGAEdAB A==;
X-CSE-ConnectionGUID: 6K0mdT02RO2CU3J+TerrmQ==
X-CSE-MsgGUID: MuapLt0DT0CRtXwb5fxC5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86195843"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="86195843"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:25:28 -0700
X-CSE-ConnectionGUID: XxfxOOtJQ7ymmF7H1BY5Vw==
X-CSE-MsgGUID: 50A/efu1SP2UPX0QUaiWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="245328843"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:25:27 -0700
Date: Tue, 16 Jun 2026 10:25:24 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/i915/cdclk: Print the reason for the CDCLK
 sanitization
In-Reply-To: <20260612173653.7830-3-ville.syrjala@linux.intel.com>
Message-ID: <2b68244e-28e4-1d7d-d6d8-33468d7e899f@intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
 <20260612173653.7830-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1984148149-1781597008=:605841"
Content-ID: <ed07bb66-e862-9ad7-cf3c-a898cee03d8f@intel.com>
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

--8323329-1984148149-1781597008=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <8f7789a4-cdfe-4c8c-365b-405662dc2950@intel.com>

On Fri, 12 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Make debugging a bit easier by printing out the specific reason
> for the CDCLK sanitization. Currently one is forced to guess what
> is actually happening.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1984148149-1781597008=:605841--
