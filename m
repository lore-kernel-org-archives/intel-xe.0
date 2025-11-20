Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985FCCF885A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466FF10E280;
	Thu, 20 Nov 2025 13:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlP26cki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C0F10E280
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763645262; x=1795181262;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feS6Z/vJoIgb01Tjp/7r3Yk/UP144Ba96asVTMv5LC0=;
 b=LlP26ckiP9+/YFX0Tc6cCNq27kAAFI90i5bFm1DzdXH4uzLqelp0k736
 nJf7thisqzReT66abKsWydOm8/IEkMbc/UN2lCKvEhI7C7eWjaVrofcTI
 R0+0PoL8/DfGAWqnx3xX5/6UwqGkpXGQnRlDRWaeLp1UsAkHimuX9vg0V
 m0op40CYv+rlFmvf2NbgfonMK+7c152kAqRiaqRHSAyvwLINJBBmQniXl
 2tc4WfMrUcYzXYrnOfeliQssVvGX5uLVTz/4FHxqRaa7BEZhMKPkDRMIt
 MeEQyThCiBAae++rHInsXuIJh1Gp/DuC3b0PizDcqxM3nG+cohBkmIOUg g==;
X-CSE-ConnectionGUID: wnN932RnTA21zVSWOSI8zA==
X-CSE-MsgGUID: ffWQOSqeRhCn4IIdp294mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83335113"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="83335113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:27:42 -0800
X-CSE-ConnectionGUID: 1NiwXmQeTAaTMBUbhrv8ww==
X-CSE-MsgGUID: 02x0Vi8VTEyya1e55EusxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191485747"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.162])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:27:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] Some bind queue fixes
Date: Thu, 20 Nov 2025 13:27:28 +0000
Message-ID: <20251120132727.575986-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Notably there is a uAPI change here, with now banning bind queue sharing, which is quite broken at
the moment, but was never actually intended as a usecase. The hope is that no userspace cares about
this.

v2:
 - Some fixes from Matt B
v3:
 - Fix error path handling.

-- 
2.51.1

