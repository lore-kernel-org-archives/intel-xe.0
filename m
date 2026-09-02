Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C02C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251CA10E506;
	Wed,  2 Sep 2026 12:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="en+QzbqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCD389207
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352907; x=1819888907;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0wIahzho5gcJVDPRPFQXeBwyq3mhopRnMiv2/ztGNqM=;
 b=en+QzbqW2Sf4B1oHVRhDNvmk/kaNaveItfT+30j9bmgHMoUlCt6HI6FN
 rxnctsvpVMQX4QQ+8cwbaOGy6Jb2KQhwSOYmdiufrQPBpsG3rGvnjDOkk
 ZDp7Hj7EE/bdoU1G70hiijshjsbsFY1n0WmxeHtiZVv/0HO296RA2IPrm
 WOOzaiM6uheqY3QLNYY2sZMD/j5mq5ucYK+niBxWy5zg9ghqKKnQ7OohB
 zVkdMh1KMUGRgfQHD0k/pqtHUp4k5i/sDXgsLP03J3DDSJRjcAUPJ70Ov
 7waR5nB+Y0MgSvgmxTAEjBzWP8nb99p8OT/V2aZyo4maLZXzqNgs4xG+n A==;
X-CSE-ConnectionGUID: /IDaUL2qREaTVpUpuQE8hQ==
X-CSE-MsgGUID: xYIKpTZYSQCJzZ5qvCz7AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88829507"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88829507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:46 -0700
X-CSE-ConnectionGUID: AF2UIF5WSjuwTPdBvtIRzQ==
X-CSE-MsgGUID: n6WMmvhBQRa4wZsuSxdRGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269965272"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/5] VRAM health check + CCS fix
Date: Wed,  2 Sep 2026 13:41:18 +0100
Message-ID: <20260902124117.918018-7-matthew.auld@intel.com>
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

v2:
 - Give more details around what the VRAM health check actually does
   and how it catches the CCS bug (Matt B).
 - Tweak the CCS base + alignment print (Matt B).
 - Drop the fix from Linus; this is now already in drm-tip.
 - Add some hardening for VRAM CPU mapping also.
v3:
 - Fix the panic path in the VRAM CPU patch (Sashiko).

-- 
2.55.0

