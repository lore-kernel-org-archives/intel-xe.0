Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698D8C54754
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACA310E297;
	Mon, 19 May 2025 23:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kn0urOA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AC010E047
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747697574; x=1779233574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BXL0n48PsFynNbKuFxYZW6eJMvGrzeS/6tbzl2Qvz+E=;
 b=Kn0urOA7tnIEFFEVDXfYh3ZUeeAcjLyKv2L3f9DyXQmvhKJaDGFMlsdB
 HiDQ3aTAxMLskM2HPvUToe7LgJk4Me+AdNRxU0AZRZ0hrKyZbeRCuyHjR
 8hMq4fQtLJSv80pWqBfRANb9afTljNnYEn7eXGD0M+PsoYFN6LkpLlO7q
 4JYkNbOmGqCZoFRCcBU/p28wNttsVOar71fjj1sZ1laK87HmDrnQZ8IM+
 rBKdsFcDvvU5hPVYViS2GuYfYdQ26HeZovC8flizQcI+RADy21Uh3JKfC
 VGJkWK2QioczAHas1HEA9T8lFS2NTH0ZU1KgYRXAqC0KoHsnqQtRYKoxm g==;
X-CSE-ConnectionGUID: eLwduJNpTGmSlwUWV1wvHQ==
X-CSE-MsgGUID: FhdCknlqTYu/VEcMJJwT/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52244895"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52244895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:32:54 -0700
X-CSE-ConnectionGUID: rXwPBIT1QhK2ZSstIvdvXA==
X-CSE-MsgGUID: c1hh+VmiTReWpm2G0WrKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139419007"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:32:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/3] drm/xe: Small fixes and cleanups for PXP
Date: Mon, 19 May 2025 16:32:29 -0700
Message-ID: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

A couple of minor fixes (including fixing a non-properly defined case in
the UAPI to cover the case where GSC fails to load), plus some code
cleanup to make things more readable.

Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/pxp: Use the correct define in the set_property_funcs array
  drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
  drm/xe/pxp: Decouple queue addition from PXP start

 drivers/gpu/drm/xe/xe_bo.c  |   2 +-
 drivers/gpu/drm/xe/xe_pxp.c | 145 ++++++++++++++++++++++--------------
 include/uapi/drm/xe_drm.h   |   5 ++
 3 files changed, 96 insertions(+), 56 deletions(-)

-- 
2.43.0

