Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D598FCAC5A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 11:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D0410E707;
	Thu, 18 Sep 2025 11:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ht5VXoY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480310E707;
 Thu, 18 Sep 2025 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758194269; x=1789730269;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=RAdfM+e7N74snojJ05Fnj6ED3cSQ2E8E4JIat1KqQu0=;
 b=Ht5VXoY550fZDEg5x0n0bSm2haT9H4RQjPvF6lXkXOquzaKWRa90M23v
 61tw6UKb7PTfpuxREJ4mLlMaashC+lCeku7N7xD4x9qgRVAxt66nqWdMu
 ubVSa5aMxKUZFe9y+qBmEl6Wa2r5VxUQgTnD54rhMFQkAqk7k3ljEU/ju
 MX/Ly6XNywN79YYJ8Mh4x53uV3eXPNAdhaC+hTGsONMcuxt4tQR+/ESsx
 DW2K96AxzCjgL95B2bqywYr8osnI4rvzPBj7sCbO1iL9mXkxyhbL+LAnz
 MEiXJPc0MVUau8r/+iPHb+C/xvu2m0NiMPzV5V4DxesuvyzwiTHu0kuRB A==;
X-CSE-ConnectionGUID: ZDyAnQmFSZONk//xmVPYFg==
X-CSE-MsgGUID: AgcNd5FWQFSbA/Nww7OGjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71201308"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71201308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:17:49 -0700
X-CSE-ConnectionGUID: 6Z+J9wHqS6W3xzKMM/cQRA==
X-CSE-MsgGUID: EQz0pBEaT5mvKdVMznsKuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="180796492"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 04:17:47 -0700
Date: Thu, 18 Sep 2025 13:17:45 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, michal.grzelak@intel.com
Subject: Re: [PATCH v2 10/15] drm/i915: cache the results in
 vlv_clock_get_hpll_vco() and use it more
In-Reply-To: <14695618682d8d8fad1adc485de7a122c8e1494a.1757688216.git.jani.nikula@intel.com>
Message-ID: <abf3e321-b8f9-578f-bf28-0f59d404c4d9@intel.com>
References: <cover.1757688216.git.jani.nikula@intel.com>
 <14695618682d8d8fad1adc485de7a122c8e1494a.1757688216.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1440307481-1758194268=:965889"
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

--8323329-1440307481-1758194268=:965889
Content-Type: text/plain; format=flowed; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

On Fri, 12 Sep 2025, Jani Nikula wrote:
> Use vlv_clock_get_hpll_vco() helper more to avoid looking at
> i915->hpll_freq directly. Cache and return the cached results to avoid
> repeated lookups.
>
> v2: Rebase
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1440307481-1758194268=:965889--
