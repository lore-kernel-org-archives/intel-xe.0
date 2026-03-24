Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD66F54AD6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 23:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBA610E626;
	Tue, 24 Mar 2026 23:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAzarLHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB0710E623;
 Tue, 24 Mar 2026 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774396010; x=1805932010;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=/7NLQyuDJSn+6gPC56PWTfcg2gD3eCd5qsIv3aoXOzM=;
 b=eAzarLHbHrtXjUqNjq025ohKzFiARJKwt92Ouad1jddMJaP8HhVpj8nH
 G8595Dff8Ulre5hh552n4q1zIWKpCg+WR7nQeoCkmS1isxp2Si2MkLPgN
 pnjsPZsxtPf5S7405cIaq3Z62K6ruO/TBdJ7F+jQw01w+tQFJm+39rLmb
 TC6OMBA/njCednlKZT/QMQvm+oDZJLWUZAUASKH7z5esbpoFwY6BQ+haN
 gpZ00LRTQsP+qtEiEounHAsp7/0BKwPVsK/AnNnDwcYKH4xNXSx1k3/h8
 Juy0rCSp2YCqkx303Jrf9LMDML+F9OEaWlMxgm3rev0RIfxgs3XwPIs+k w==;
X-CSE-ConnectionGUID: 6cHgoxDFQDuACKAAk0KpzQ==
X-CSE-MsgGUID: LXdRdUuvSJCkVOtsqJvE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100874732"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="100874732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:46:50 -0700
X-CSE-ConnectionGUID: uSHO2dcjQ1mW/ESPaVE1Bw==
X-CSE-MsgGUID: u+GP9nEIQ96g9+Pv0gTuXA==
X-ExtLoop1: 1
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:46:48 -0700
Date: Wed, 25 Mar 2026 00:46:46 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/i915: pass struct drm_i915_private to
 i915_bo_fbdev_prefer_stolen()
In-Reply-To: <f55e56b5bc14a3f21113a5a5773ab743639f2d54.1773840563.git.jani.nikula@intel.com>
Message-ID: <c564257f-67ec-9196-76ff-0ad0b0fc668a@intel.com>
References: <cover.1773840563.git.jani.nikula@intel.com>
 <f55e56b5bc14a3f21113a5a5773ab743639f2d54.1773840563.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1389204505-1774395091=:294587"
Content-ID: <3d73300e-2b3c-8a21-1156-bee8c9f64bb7@intel.com>
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

--8323329-1389204505-1774395091=:294587
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <61e1e171-9541-352c-67aa-4c9ad837ff16@intel.com>

On Wed, 18 Mar 2026, Jani Nikula wrote:
> This is i915 core code, use struct drm_i915_private for simplicity.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Same comment as from patch [3/5] if it applies at all. With it being
addressed:

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1389204505-1774395091=:294587--
