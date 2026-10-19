Received: from smtp.lore.kernel.org (ip-10-30-226-214.us-west-2.compute.internal [10.30.226.214])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DCA606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTj79R+7
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E554ECCF2E6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916A10E775;
	Mon, 19 Oct 2026 14:48:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5AA10E775;
 Mon, 19 Oct 2026 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792421326; x=1823957326;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VYxl3bvhuId6CIrYku+/4tK8mgx+1TH+z4Or7LU1Uq0=;
 b=NTj79R+73A5YlKRXmlsvov3oaDAIryvy8ljOBRKb4xjf9mKf3wD8gKee
 td1RPB1clb2HMGbAEIzfWpuVLFSwqXi6z3b60imqkQWYKiFenVazrppS/
 1QAuqB66VFdy4S9Iwysf9dyxGoQIeRMjxRLs2pUy+Xlwu4UQgYNYRlOhV
 aZ3mA7ddanzh+vjQX3GBnYnNCuPTJKloUBhazT7yxV7xzVYgXiBqN2n2v
 i+Kz3aFQnTHx6VZ0+UFTerBmYXK65tpaE/W6PlB2T55z9k455UtWJ1xfQ
 wG1d/JcMwIAvZSRb8dDyUXpWt9fLrTfbSItm4LpANlilb94e83zENQpaC Q==;
X-CSE-ConnectionGUID: 5//QY1WpSyqys9kthKXsXA==
X-CSE-MsgGUID: ScnDC4hrT1uzM385arKXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1000541"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1000541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 07:48:46 -0700
X-CSE-ConnectionGUID: YTUPxpKoQXC40cw/Rzh0TQ==
X-CSE-MsgGUID: Iju0O2fsTDaJnaHsvG0jzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2654725"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 07:48:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/i915: Display VT-d cleanup
In-Reply-To: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 17:48:41 +0300
Message-ID: <f50d37e5b238eda203f8572298ab519277cb8f64@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Drop bogus VLV/CHV VT-d things, and polish the VT-d related code a bit.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Ville Syrj=C3=A4l=C3=A4 (3):
>   drm/i915: Drop bogus VLV/CHV VT-d stuff
>   drm/i915: Optimize VT-d w/a handling a bit
>   drm/i915: Document which platforms have VT-d
>
>  drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++---------
>  drivers/gpu/drm/i915/display/intel_cursor.c   | 20 ++++++++------
>  .../drm/i915/display/intel_display_utils.c    |  6 +++++
>  drivers/gpu/drm/i915/display/intel_sprite.c   | 27 +++++++++----------
>  4 files changed, 40 insertions(+), 36 deletions(-)

--=20
Jani Nikula, Intel
