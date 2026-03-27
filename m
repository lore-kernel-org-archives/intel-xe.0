Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6E9109E544
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 09:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D1110ED55;
	Fri, 27 Mar 2026 09:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MR1j+DWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A710ED55;
 Fri, 27 Mar 2026 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774604151; x=1806140151;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=nodLxYeY1cFG9Ec22+AHCsA6f+9QKqXbxLwAJHrC5ek=;
 b=MR1j+DWwW34J2B0NEYzEzaPx51DdtejRxHKH9UH7o/uaVF4aOrD73BrN
 MlwU+aBE+fHE5lUUY/nKMTHHrw9P+ojy3xzVx1bt/vlHHA5Wrls4R3eUK
 VJQmFsOSdSVaSt2NeZ8OaeD/YhycQwH42dIqIehyw9W2uX6Z4PrkPJ6kJ
 ytvyXCkZ4d2SrQv/jg75CQaey4e2ev9+zD0LyhgAHbKi8EPbFhmpluoMz
 zh4n+gP8BVLfh9SJPk92hIHm8d9yFastGNitzGcF65Czx9NZI8Mxj2mPJ
 W4SwkZ5xgs86/5YYuapnuL9u5VbiT11EMMbP3gaHtdMmZ5ghvMWiRmXeH Q==;
X-CSE-ConnectionGUID: slmyMe6kSLCwCbiRjYekbQ==
X-CSE-MsgGUID: YhezoS5IQRCKtDNBgS5MCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75566369"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75566369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:35:51 -0700
X-CSE-ConnectionGUID: JP3U7L5NSJy0GZeorPBaUA==
X-CSE-MsgGUID: frrgGYYKRqKmgNCRl0pipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="220419149"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 02:35:48 -0700
Date: Fri, 27 Mar 2026 10:35:46 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 5/9] drm/i915/casf: Handle CASF in
 skl_scaler_get_filter_select()
In-Reply-To: <20260326223139.19116-6-ville.syrjala@linux.intel.com>
Message-ID: <dfd14fde-d08d-7064-bc76-e7ab09914088@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1846110227-1774604149=:330621"
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

--8323329-1846110227-1774604149=:330621
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 26 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Nuke the duplicate CASF_SCALER_FILTER_SELECT and just have
> skl_scaler_get_filter_select() return the proper value for
> sharpness filter use. It is the same "use programmable coefficients"
> value we already use for the nearest neighbor filtering.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-1846110227-1774604149=:330621--
