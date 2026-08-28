Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20A9C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA410E286;
	Fri, 28 Aug 2026 15:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRqGKsSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AC110E286
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930064; x=1819466064;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0e9Q1LOEjvf+ZH9ULj9nP4wvICLEntGnotY8aeXg340=;
 b=HRqGKsSrjgb0ztDe52ewFy4uVhQzllw6gi6k4zryXscUa9roWAkhenm+
 y/vtO6UFJ8ItBvUPxhxx+lxwJyhatsTVYbLsCJmdZM/TzxyHsQlWQ1yRA
 RFsEjV2FaJbvFj6wzNDy6byGrhn+TzaXWqr6Z0cpHpnoUR43hDzFWUhXO
 cy/TexxLxUYqlnsDG1lndEvblUfrjqa0sStv8GjJZA/tGcoU3tOOIDyCv
 1JwAlgLUuPuAAVlTLhBVYc/WCJmh+SmqzCh+zwgVE9wz3TC+HLOsiiKVJ
 jxaUGj8VAoM6WIyKh79z+9uz9EAuvQZUeEKKfAWp5DJLloe/pHFzKB1UE Q==;
X-CSE-ConnectionGUID: htv95oCeRT+tHSPsC3sjSQ==
X-CSE-MsgGUID: Mvqxh0ZISEeTRiALjZlAkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92252187"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92252187"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:23 -0700
X-CSE-ConnectionGUID: pOP1vSbuQfO9k1H1atLjZQ==
X-CSE-MsgGUID: h8SQbn2DT6Ci3sjEQDTVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268746394"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] VRAM health check + CCS fix
Date: Fri, 28 Aug 2026 16:14:06 +0100
Message-ID: <20260828151405.662533-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

Add a basic VRAM health check routine, which does some basic sanity
checking on the last VRAM page. This could be extended in the future.
This seems to reproduce the same CCS issue as Linus, on my b570.

This also picks up the fix from Linus. I went with leaving it as-is,
but that means we need to fixup the identity mapping to support 4K
pages for the tail part of usable VRAM.

It doesn't look like anything in our CI actually has the CCS alignment
issue present, so merging the fix from Linus without the identity map
changes likely shouldn't trigger any asserts, if that does end up
coming in via another tree, AFAICT.

-- 
2.55.0

