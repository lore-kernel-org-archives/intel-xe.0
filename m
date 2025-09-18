Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F583CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 10:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D9210E706;
	Thu, 18 Sep 2025 10:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lO+JULjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA2E10E6FE;
 Thu, 18 Sep 2025 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758193196; x=1789729196;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=1DGk2ku1q02V6tDFpfi61S1sGnGwBL5jFsS9Q1FXyUQ=;
 b=lO+JULjCpb6u0gdpkD9XlBQJj9PRJtDubT+D4//ODq6N6m7sKxpKc8v/
 GchG91kDYFbq57thvIhecPLr+vuSXkugXDnk1dl9v4zMBgBGC9ghMEQ++
 s8OeKvo4lWKPDX5njYZod4iRpmN7AUmz9eua5bYiOZUV1TauZXdG7yJbz
 O5SFhAIUp/bR8gbuGMLlshf89KpwpkP0NDZYUUguoOJZTeO4zSqkt09U6
 nDt13WS/Y71ET3hnsShNkEaTU+F6yqyS7JiDaIQTNGvp2pd5VDCiKgUVG
 HCABQTj7eotwkWgrkP2MGLyPNp0+n1UXjSdZ5D1xmKUOw/grIRhU/Gd4u g==;
X-CSE-ConnectionGUID: 2rCb0MCOSL2mm15lyG+5gw==
X-CSE-MsgGUID: EIoZ7M9kTl2AGnzL7Z1/DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64148311"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="64148311"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 03:59:56 -0700
X-CSE-ConnectionGUID: qhHJmHhLRwe2zXEiFUQKLQ==
X-CSE-MsgGUID: rsq4iAy1T0qezW51kUoGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175117208"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 03:59:54 -0700
Date: Thu, 18 Sep 2025 12:59:52 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, michal.grzelak@intel.com
Subject: Re: [PATCH v2 02/15] drm/i915: do cck get/put inside
 vlv_get_cck_clock()
In-Reply-To: <480b654b6c736a03343dfd17eb130c39fd82c637.1757688216.git.jani.nikula@intel.com>
Message-ID: <0ff18fdb-213e-804a-a330-d345834d79e9@intel.com>
References: <cover.1757688216.git.jani.nikula@intel.com>
 <480b654b6c736a03343dfd17eb130c39fd82c637.1757688216.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1199131769-1758193195=:965526"
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

--8323329-1199131769-1758193195=:965526
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 12 Sep 2025, Jani Nikula wrote:
> Move towards VLV/CHV clock interfaces that handle sideband get/put
> inside them instead of at the caller.
>
> With this, we can switch to the simpler vlv_punit_get()/vlv_punit_put()
> in vlv_get_cdclk().
>
> We'll need to move vlv_init_gpll_ref_freq() outside of the existing
> get/put in vlv_rps_init() and chv_rps_init().
>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-1199131769-1758193195=:965526--
