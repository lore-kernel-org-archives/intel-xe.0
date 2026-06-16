Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4422CD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B28E10E8C4;
	Tue, 16 Jun 2026 08:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ly9UVxV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF9E10E8C4;
 Tue, 16 Jun 2026 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598314; x=1813134314;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=RrUIwK4W1729YONzzL/73Nf5VmCHlt5GAMRUQe9bZ8I=;
 b=Ly9UVxV8k60Rng9s2NhS9A5s+e6fseLAHbZqIHsNeTN7l2hmHyMsAyB0
 mIu2KcWY4QgbbkuiToHaZRoSBM0tkrIbaDxiN7bnnv+u15Ly8Xbq3mMTo
 eQqB9Ua+IAAhOcTRwxg7oiQGzuJFYdwBdBkOf8KFthaK78fUCbgH2UaZ5
 nWOV06K6ek821Ucf0Wn6VOwEujT3CwL9J9gd9t/Ym7WXP0M0EwSixeZs0
 XbYwvmSAnFij9PrhNF1/MlphWqVF6ixIVCAyzTfmKGssqURMICbODBHOK
 xvgH6bxlJV5r5wyrkbf/1896PORYHYOYk/WLsPV8JUJEYEQCiUCDMVJiK A==;
X-CSE-ConnectionGUID: t+n4UpaxT9Gv97uneEyoVw==
X-CSE-MsgGUID: OtLY8AVqTFG+duNUo5WhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86195837"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="86195837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:25:14 -0700
X-CSE-ConnectionGUID: U7la9NPiQM+SqCw7tBAW4w==
X-CSE-MsgGUID: QRMZx1uCSyKk0BKjLNe8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="245328777"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:25:13 -0700
Date: Tue, 16 Jun 2026 10:25:11 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without
 a full PLL re-enable
In-Reply-To: <20260612173653.7830-2-ville.syrjala@linux.intel.com>
Message-ID: <5a23350d-ced1-2189-fb10-22c0c0cf55f2@intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
 <20260612173653.7830-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1614799216-1781596986=:605841"
Content-ID: <7b9269c2-67f5-e9f8-e8b2-e66be978e1a7@intel.com>
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

--8323329-1614799216-1781596986=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <34ee6ca2-d1c9-9238-a5c0-ae3afa155675@intel.com>

On Fri, 12 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The GOP (and even Bspec on some platforms) is a bit inconsistent
> on what the CDCLK_FREQ_DECIMAL divider should be. Currently any
> mismatch there causes a full CDCLK PLL disable+re-enable, which
> we really don't want to do if any displays are currently active.
> Let's instead just reprogram CDCLK_FREQ_DECIMAL when that is the
> only thing amiss. For any other (more serious) mismatch we still
> punt to the full PLL reprogramming.
>
> We also need to tweak the bxt_cdclk_cd2x_pipe() stuff a bit to
> consistently select pipe==NONE since we have no idea which pipes
> are enabled at this point. Since we're not actually changing the
> CDCLK frequency here we don't need to sync the update to any
> pipe.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16209
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1614799216-1781596986=:605841--
