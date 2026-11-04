Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585AA606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A4K8Shcv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1521410E25A;
	Wed,  4 Nov 2026 14:03:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A06A10E1DD;
 Wed,  4 Nov 2026 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793801032; x=1825337032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ADY5KWQdItMjQYLs2OcrpRpo0LnJVGba2dng3OKQ6ps=;
 b=A4K8ShcvVykQroEIVeovpCIHyTm1JPdfnFcVgXbRXI1XIlrlE1ir6BS4
 yJLRNFJdaueQdyos0cRVDsPvDcbil00ZCJ6JBgkluPFWFTK5aJ/RV6deH
 TzryP+NpWhX0DxMKuv2hGlP3t3zad8XP4f4F3A5J4jVt29It0E6/0rh8V
 7XO717+EErGFC2UxhvZGDBEZ0FZ1ZHMus8leNPm9Iev5BaO27cj9fVrHP
 473/aC2KCD1VsCYsawMHwhEBx2sXRUH3zHhXqfVlDOv/rGoolhB8DAsX9
 0W8neVH4u76vUqyAgj8fW+Yifoma23H9qe4KB3ljBF2Ggvt+TQGLAjc4p g==;
X-CSE-ConnectionGUID: /f09OL21QT61B+HCsK+GVw==
X-CSE-MsgGUID: 9Hbo1jReTWCVPYNAdS+xWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2430042"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2430042"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 06:03:52 -0800
X-CSE-ConnectionGUID: 7x+lwRgFSW2qRDBmWml4YA==
X-CSE-MsgGUID: 6aZAGlvbR02/JZHgDT6p3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8517005"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 06:03:48 -0800
Date: Wed, 4 Nov 2026 15:03:42 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: add and use INTEL_REG_INVALID macro
Message-ID: <hmvgtsddytpw2zqof3at3mdl7a6yeg4uzyibulm2vzpo5eknvr@rnhqr4h3e6c5>
References: <20261104133757.168881-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104133757.168881-1-jani.nikula@intel.com>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 03:37:57PM GMT, Jani Nikula wrote:
> In the future, the register typedefs and macros will be completely
> separated between i915 and display. Add a display INTEL_REG_INVALID
> macro to ease the transition away from INVALID_MMIO_REG.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał
