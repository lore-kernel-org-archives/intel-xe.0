Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6415C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 05:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5777C10E1C3;
	Fri,  7 Jun 2024 05:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvV+C+fN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBA710E1C3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 05:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717736783; x=1749272783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IA1UKAxj78IfGHYBX7nm5fQ5SMoOdV/EZgUTvvK/c00=;
 b=LvV+C+fNBtzyHA0Vy6XSVG2zg97gGiPIKj+eM9Fkb0AWxr8W9VCMM2O/
 ylWIKs7h6Ei0tNqN8cmI/KNhouUe7ZUZcyXkOhcjXJOhbIuD9lAXgdSyg
 yXrd/+wFRt8NTmWSdXZCI7R5EMc+MxBqqZVIjoZUjr46qB2306ro6/Ffl
 MTMReEGMVYPwMkrOjTJEwvPOXMZcj0SEXY56cG2R1t6zFI4ZaEoHJa/zd
 tsLoVm+c/BYvNo44arZdTXHy7HC0IuwjwKEd8YnvFKuErdouXEWVWQtTZ
 vj8/PB1pIZ8elcs0+Qj/gFctw7jYWQRawOYe0yFQXhCpd9uwvnjfgH2rL w==;
X-CSE-ConnectionGUID: HyfhVSv8Sc6BT6e5wUqXWw==
X-CSE-MsgGUID: m6WHPWpFQ2aff48fxI2mNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14183479"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14183479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 22:06:23 -0700
X-CSE-ConnectionGUID: 9OhfICvaT4yhZiLoIodhSg==
X-CSE-MsgGUID: cmFh7w0sTsqGkYP05dKeZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38773078"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 06 Jun 2024 22:06:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 0/2]  Assert for multiple or undefined forcewake domains
Date: Fri,  7 Jun 2024 10:52:11 +0530
Message-Id: <20240607052213.1391082-1-himal.prasad.ghimiray@intel.com>
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

Below functions expect enum xe_force_wake_domains as inputs, but doesn't
support multiple domains (XE_FORCEWAKE_ALL). Assert if caller passes
XE_FORCEWAKE_ALL.

v2
-Assert if domain not XE_FORCEWAKE_ALL.(Michal)
-Drop patch 3, it is already merged.

Himal Prasad Ghimiray (2):
  drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
  drm/xe: Check valid domain is passed in xe_force_wake_ref

 drivers/gpu/drm/xe/xe_force_wake.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

