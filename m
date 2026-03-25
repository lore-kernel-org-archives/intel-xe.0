Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575E4109C02F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 15:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8C10E7BF;
	Wed, 25 Mar 2026 15:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geeDcQcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299D10E15F;
 Wed, 25 Mar 2026 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453517; x=1805989517;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=O1F1edl2qXtQrMfWL8PoznvBqmaTYvsZVfA+b+ZSuHY=;
 b=geeDcQcyEL+XoLeXKJ9A5M9Xuc/IUajIC7paz0ul2KQn+f5+r1r9/G1+
 MHrDfkJh+g7pHYpvEC0ZklUYtApmjkFJKM3jjTPHrUqhV354nYnJCkwzq
 23jKong6Q/Vvxn5M8F0XKPaZatN94/Q97y3SxIDwuQhaq5wwURbGJWzWV
 63H1ONJsV9IWpEtKWphptx8lWyz0JBbmZB4BNjGK5n+xw35xERy/Uz/IH
 gqGFQXlxzyTBSTnpjSoSRRvM9ABSPW+BBX+TTSBQNmUzj/OQLBs0Og4kR
 n9t//c5TTRRiyEIHmauXoPo1ScJIMrHyHxAcieyZamrmVMCrxtr+fYeoV Q==;
X-CSE-ConnectionGUID: FDTyYsWCQUWIqSr41Kuraw==
X-CSE-MsgGUID: 5/ncI77PQiifakQ0T489YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75381908"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75381908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:45:16 -0700
X-CSE-ConnectionGUID: GNMuHhVLQMuej2to+3Imww==
X-CSE-MsgGUID: dLvIq9LzR5azQDLeJsjlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="229651849"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:45:16 -0700
Date: Wed, 25 Mar 2026 16:45:13 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/i915: Include the crtc min_voltage_level in the
 state dump
In-Reply-To: <20260325135849.12603-5-ville.syrjala@linux.intel.com>
Message-ID: <36294584-7fc7-b2d5-a229-a713e2b3d62f@intel.com>
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
 <20260325135849.12603-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-849976479-1774452090=:294612"
Content-ID: <c1c10f56-1c6d-a8d7-7bd5-a8a6055530cc@intel.com>
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

--8323329-849976479-1774452090=:294612
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <ecf9c6cd-3bbe-7a39-cd89-69a33982f3fb@intel.com>

On Wed, 25 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Include the pipe's min_voltage_level in its state dump, to help
> with debugging.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-849976479-1774452090=:294612--
