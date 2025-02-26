Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCF8C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 16:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E91810E95E;
	Wed, 26 Feb 2025 16:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnWI8gDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8AA10E95E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740588902; x=1772124902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u4eHo/pu+bt8vn5O+3036TKbPm+UDIADtzLG7F+TCKM=;
 b=hnWI8gDEv6a3Ppv8oOjeLWbWySIu6jycjlzUIwunufk9zGThIjltuqQp
 KsVLleOsBfMPrO1kQH5Rgj8t7yyaWX0vO/sdBKfCuHVGUIWqbInbGLBrb
 of1GPogAXForVO+RoOXlP2hket/Ta9rW6Lgo2YzUagwAEVVsB+ltW4xJQ
 fXGAmLXuLL2vYXvp0U2qcqWZcUecSg1j7YhAEKIimTjuaCA9bIqXCCeNv
 51XNvCrrMXjkP6PpPEjtyqtUHPIKjJiRBmjYS6NARMY4wQwzIVgy/6qjF
 aM0rZjGJUE/tgUlSmJSuKuewjJLhPf4t7QFuTQrT3TOe/EqkAgclOJSzU Q==;
X-CSE-ConnectionGUID: hB8ucLDNQ5CRwNJeOy8XoQ==
X-CSE-MsgGUID: PUd7il+gQVKJQV2eVE9njw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52862956"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52862956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 08:55:01 -0800
X-CSE-ConnectionGUID: RJDzA3RERKej9Eg9yWqo0Q==
X-CSE-MsgGUID: 8K0I+t1QRMWC/BVNaI3R9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117675312"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 08:55:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v5 0/2] drm/xe: Add and refactor workarounds
Date: Wed, 26 Feb 2025 08:54:49 -0800
Message-ID: <174058886662.4090089.18629809212115504.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220094645.358647-1-aradhya.bhatia@intel.com>
References: <20250220094645.358647-1-aradhya.bhatia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 20 Feb 2025 15:16:43 +0530, Aradhya Bhatia wrote:
> This patch series adds the workarounds, Wa_16021333562, and Wa_14016712196.
> It further refactors  Wa_18013179988, Wa_14015568240, Wa_1508761755, and
> Wa_1509372804, to use the newer macro, XE_WA(), for OOB workarounds,
> instead of selection based on platform labels.
> 
> Thanks,
> Aradhya
> 
> [...]

Applied to drm-xe-next, thanks!

[1/2] drm/xe: Add Wa_16021333562 and Wa_14016712196
      commit: 8c5fe7d88bc1c12662a804fd75edb6ac85225ce2
[2/2] drm/xe/oa: Refactor WAs to use XE_WA() macro
      commit: eef3ede533aea7a40e2f72a7886da4827f10eeac

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
