Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90199D374BF
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 16:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0E10E86C;
	Thu, 17 Oct 2024 16:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpN3ogcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6610E86C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729182210; x=1760718210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oCxxtfJRyuVZJs3jWKWFtpdv6rpFFDVASLFHXpdOhcg=;
 b=OpN3ogcrhNcvRbhZ1mqiBaWii43i3x/qC+rbgqB7WtTNZf5BuAeX1TiG
 QWUtUr3k75fv8kMyH3fXRDQWfhmdWvdWhN0cmbS117BMrzcyWk6Khw/19
 ItWtxntXe+cezKM344Q8Vhtht/Dcgi37lgKvOvAutsUC0xxzGmhZluiC7
 8WZDLOGD3s1ryuflotftg1TpDOe1w7b5KzQ0d/QwyC+fTa/Vtqdp8nNJA
 9g6PuvY9+TJSGIkoofNigph2WN2bhaAA1RwhCYNj+Hxr4wdlscohP1/ou
 c8plnNtEJVXA6Fwuz7/ERm5+WrTJbuxjMBIwPEoq8ArcQNLBKxDI2UN+N w==;
X-CSE-ConnectionGUID: qL/6lPokRI2krIpjuvKzqg==
X-CSE-MsgGUID: 4Vl+cF8YS5eZRsMKwbqzBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="32477993"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="32477993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:23:30 -0700
X-CSE-ConnectionGUID: PU/Kn4BBQzyXslUljXQ0Hg==
X-CSE-MsgGUID: NqFnxse9TY+XkVBw2kieeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78489895"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:23:30 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: enable lite restore
Date: Thu, 17 Oct 2024 09:27:09 -0700
Message-Id: <20241017162710.942553-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

The lite restore is a performance improvement feature which avoids
unnecessary context switch (flush, save and rstore) if the incoming
context has a ContextID matching that of the outgoing context. The
scheduling is done by the Guc firmware, so on the driver side it's
just a matter of setting corresponding GuC_CTL_FEATURE flag.
This is supposed to be enabled by default, thus the flag is set
unconditionally.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: enable lite restore

 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

