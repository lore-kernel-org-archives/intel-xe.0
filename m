Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85678CCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 18:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3C110E647;
	Tue, 11 Nov 2025 18:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4GiJV69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFB310E647
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762886492; x=1794422492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i/Id2LUGBeNjZ0EAEzeCsvMgtYGYPVfPEOhBq2TloCE=;
 b=V4GiJV69rtocLtxNbfR3vvynF7pp2PS7O0Xx7c0K3FHABB0JbP6VwCq4
 cjw0E5GssvFFU7M73aV7Hff33001/pUEuM1swDjuqnV6Z0U4+44AtJXSV
 ZAQNPEKqy3H3pfqauWHeOLZ8DSBw7RxUuvOQR3PaKMbC7X1SxCJbYB7Ti
 2a/yfpvg+j0iWqYCf/WNiDOUOP/NRMTrEzgPs5Gy+zAefHLkoPCLxj2Rj
 5qywCx4WrXRFOjfOzXoIyxTnkltvujNRvxlRB4WYG3/WbO01U5b9utJ8r
 XcX/uyPsD54xuOk6898t2aZEM3y3epFXhTF1wWaHGmrZIaCSNkQ/godMI g==;
X-CSE-ConnectionGUID: JKIQwfDuTRWa0Bvvy9soYQ==
X-CSE-MsgGUID: EbBtV6b4QQa4ynpqF0BloQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76409685"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="76409685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:41:31 -0800
X-CSE-ConnectionGUID: +uhJBrLTQyKpbwuv1Tu9Rw==
X-CSE-MsgGUID: f7mkq2GVSmqsKEv2I49BRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="189194379"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 10:41:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pf: Add runtime registers for GFX ver >= 35
Date: Tue, 11 Nov 2025 10:40:44 -0800
Message-ID: <176288643274.3515636.6104404454314755814.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107211845.3633633-1-piotr.piorkowski@intel.com>
References: <20251107211845.3633633-1-piotr.piorkowski@intel.com>
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

On Fri, 07 Nov 2025 22:18:45 +0100, Piórkowski, Piotr wrote:
> Add a dedicated runtime register list for GFX ver >= 35.
> Compared to the list for GFX >= 30, this variant drops
> HUC_KERNEL_LOAD_INFO, MIRROR_FUSE1 and adds SERVICE_COPY_ENABLE.
> 
> v2:
>  - drop MIRROR_FUSE1 register
>  - update commit message
> 
> [...]

Merged to drm-xe-next, thanks!

[1/1] drm/xe/pf: Add runtime registers for GFX ver >= 35
      commit: 23e719e93b1bb0501aacc0a4cc96a1fe2d0b5a15

--
Lucas De Marchi

