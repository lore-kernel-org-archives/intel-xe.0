Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6ABCD343F
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 07:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED7810F236;
	Thu, 21 May 2026 07:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVEVpPW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0C410F236
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779349823; x=1810885823;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j/gTHCrP9Cm5wXdqMubdnUnKaSwWamTEbrkJzIb4KLE=;
 b=mVEVpPW/4H7OMVneElcd5pbxmBugfYFHCX3CPgJ8kSvR7Kn8fv/drYS0
 6rZ4Nt1hVqXwNKEDvaOVKd1KYfDak67lNQ7HS9rwVxx6mcI5hXbVK3Q8h
 G2DFuPQQiElhk1xPLuN/uXClBT/5TaC/4qmYZWNwOZDLqhJDqf/cFhgrl
 uCuSlonU3S7C9vPbgI6+63heXPz6kL4DxvJ/R0It32nULX5rYFEGR+UMu
 GoSE7LkXb0XzXuG3qrSAesW+Ak2LNz46lLBM26eIw4h0yIABI4Gfi/xDJ
 ufjeuM8GLsp127bcmgQRVMio0reYlF7HvES4rAhFsLvZ8Q7ZxYTzRWiE0 g==;
X-CSE-ConnectionGUID: gPC945wqTnGQttkhREgtNw==
X-CSE-MsgGUID: Sy+pkpUURGyDa6i/NKibiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80383465"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80383465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 00:50:22 -0700
X-CSE-ConnectionGUID: k65LGtJnTGuV7QKMR0KcyQ==
X-CSE-MsgGUID: 0tMaKbX3QHyN7sVKI9pSVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="239601835"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by orviesa010.jf.intel.com with ESMTP; 21 May 2026 00:50:21 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH v2 1/2] drm/xe: Fix return type of disable_late_binding_set()
 in debugfs
Date: Thu, 21 May 2026 13:14:09 +0530
Message-Id: <20260521074409.2112472-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521060338.2112191-2-mohanram.meenakshisundaram@intel.com>
References: <20260521060338.2112191-2-mohanram.meenakshisundaram@intel.com>
MIME-Version: 1.0
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

Sorry for creating this new series by mistake, I already replied [1] to original series
Don't review this patch

[1] https://patchwork.freedesktop.org/series/166914
