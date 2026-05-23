Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A04CD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 19:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A8C89065;
	Sat, 23 May 2026 19:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRxfPixJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5AA89065;
 Sat, 23 May 2026 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779564564; x=1811100564;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=Ulpzyx+zLkw9D1+tlk1e2Ao8oAx5AD5E/k/LWkOPp00=;
 b=VRxfPixJkIfjdZRAdsWc7iy+1ldRRD4zDfWgJfhvreHXII719GJpdF6X
 bCMOm7oBUXey1zY82F9bYimhGOJJyXMnwcPht2NMk2oY+Nt4Q1c/zHupJ
 0dQ/0+iZ7Wl0lalgRBqV7UL4rGWKXtX2a/kzGp2u1+B1PQD5XaoC6u0k1
 1RMwUImgBzR4+phkvb7qzjJ/eZR4EQzIHxpGJPC/ZXaobNv5i0BR8gYAG
 iU1bzWizj4Xh5Zr9yO4sGhWGyZe3q0MknKcLRI4RmW7/o9kSvxQ9MpVsO
 09DhnuqZWembVQIPc2Olm6KCgjPM3eoi8kAhDlCyTVqansCeKCxRR7+Wr Q==;
X-CSE-ConnectionGUID: 0UwKphcMSF6nfaFE+/KpgA==
X-CSE-MsgGUID: 6T7gscjsSUarxjt0asFyeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84338785"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; d="scan'208";a="84338785"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2026 12:29:24 -0700
X-CSE-ConnectionGUID: Hb7lsp1ZRg+GbVMsIY/4LQ==
X-CSE-MsgGUID: T9Ja0TihRIqJsMhP9vihBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; d="scan'208";a="265058281"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2026 12:29:22 -0700
Date: Sat, 23 May 2026 21:29:20 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/10] drm/i915/bw: Fix bw rounding direction
In-Reply-To: <20260522200346.17377-4-ville.syrjala@linux.intel.com>
Message-ID: <84b04e04-7320-c9cf-9a1e-780c13ea8d0a@intel.com>
References: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
 <20260522200346.17377-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1534553626-1779532242=:1544314"
Content-ID: <58bfd432-d97b-e5f4-b00f-ce3fde6761a7@intel.com>
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

--8323329-1534553626-1779532242=:1544314
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <2732f5ea-9e14-106e-9395-7632b9ddbe11@intel.com>

On Fri, 22 May 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The DRAM bandwidth value should be rounded down, not up.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1534553626-1779532242=:1544314--
