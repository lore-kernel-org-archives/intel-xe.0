Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A425BEB362C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683AC10E370;
	Mon,  2 Mar 2026 20:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rfb8xWEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D366410E370;
 Mon,  2 Mar 2026 20:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772482084; x=1804018084;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=QK8dhOvAVpVaPRpU3mxKsxqIE9B/0BE1QoewCJVnGn8=;
 b=Rfb8xWEyQp1WviG2Nx01mzYnwVOQZu3WRmhhkmHypgWhxBoMpV8T69t1
 LyjazkdCk4tR7NI0ylNKmMpcZtnQJu1ipfutl47H/PZVf9xk5ILIdg94c
 KMvc+lghh6EJB744PcFShFkZnWYBvs4QisEU0NbDrt4/K0TikhnMvo3ZQ
 jlfLX068/0C2g7r21XH/WDOxVb4te1y1riiwvMkefAOkJDGy2eiQ8jfqQ
 0BT/Uq9Gf18WnlPyCpxgah1TbZ1r8vp/Euol+Qg8PfhegunBiddfTNDna
 SJTCCZOXW/SpWDpX69rTCgOwQh0b9TBjngJHUIRXVf0/1la06vCLR0A7f w==;
X-CSE-ConnectionGUID: YQLFL3yxTTC2yE3TwtruVQ==
X-CSE-MsgGUID: EFym8ahRS/OsKWS73GuPXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73371341"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73371341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:08:04 -0800
X-CSE-ConnectionGUID: eSjdZvkpTgifKygnEOLW6A==
X-CSE-MsgGUID: kl6krIH8RNGyo0bIu2dDfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="244756726"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:08:02 -0800
Date: Mon, 2 Mar 2026 21:08:00 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 1/8] drm/i915/reg: make masked field helpers constexpr
In-Reply-To: <788f538cc71dec0db25e0c768e8945bef6f9701c.1772042022.git.jani.nikula@intel.com>
Message-ID: <82bec685-cad7-94dc-b8b1-ae4913dbce64@intel.com>
References: <cover.1772042022.git.jani.nikula@intel.com>
 <788f538cc71dec0db25e0c768e8945bef6f9701c.1772042022.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1527428566-2100778568-1772480497=:1836696"
Content-ID: <2b33c185-2278-c977-b59a-2bb900c2a3bc@intel.com>
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

--1527428566-2100778568-1772480497=:1836696
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <b14050ec-4f6e-30b4-205b-b7257eb343a9@intel.com>

On Wed, 25 Feb 2026, Jani Nikula wrote:
> Make it possible to use _MASKED_FIELD(), _MASKED_BIT_ENABLE() and
> _MASKED_BIT_DISABLE() in contexts that require integer constant
> expressions. This increases their usefulness at the small cost of making
> the warnings from build time checks less helpful.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--1527428566-2100778568-1772480497=:1836696--
