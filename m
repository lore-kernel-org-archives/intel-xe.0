Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA52C624D5
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA5B10F104;
	Wed,  2 Sep 2026 10:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtSoOTnP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DC510E4C9;
 Wed,  2 Sep 2026 10:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788346492; x=1819882492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=afR6FjALdrUc+KkxLT9VjI9rpD7d9Chqb0qlR3LOFcw=;
 b=jtSoOTnPOlI1uOhV1dn7VjU/U2ydBmDgIu7hxDBop4mJPeQbkP0bmWYs
 9JQ+YYfrfto3eGLByqmO4gt/p3QIKk5suW6bwMDtmZspYm6VNJm/nViBs
 1qm+urkl/fwA+/3syWbiRn+Wjk74OqOK1/xOInOr8dNqw+OJ4VyZE4Iro
 8V/2hP4KIUNxpCwLAGzKBs+Tc6/logNYTZDuNh/3mYNri9u9pwv+jA0z8
 uMHRYHm+OLyj7rZbg9fiDL3TkDdT/chVtyEX12TQBRXV7SO4Dutgd/Gwx
 f7ksKyXrdhXExgbjgMWGJ7so4brF7Ftg+jVPgA0EsoJN1ZgjOpD4akGki A==;
X-CSE-ConnectionGUID: 808ZYt0LQCuefk6JaU8TfQ==
X-CSE-MsgGUID: XP2/aZR6S+2KYVFLl1mimA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91311481"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="91311481"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:54:52 -0700
X-CSE-ConnectionGUID: G9wwNn6BTMuFNo24A6jTPg==
X-CSE-MsgGUID: TNKVJztuR22PRkVZztD6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="273136871"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa004.jf.intel.com with ESMTP; 02 Sep 2026 03:54:50 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 0/2] drm/i915/display: fix flipq pipe CRC mismatch in
 kms_cursor_crc
Date: Wed,  2 Sep 2026 10:54:45 +0000
Message-ID: <20260902105448.809455-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

This is v2 of [1], with the following changes

- drop the patch "drm/i915/display: Flush frontbuffer tracking on flipq completion"
  due to unnecessary addition
- updates on flipq eligibility

[1] https://lore.kernel.org/intel-xe/20260807121540.2032283-1-mika.kahola@intel.com/

Mika Kahola (2):
  drm/i915/display: Reject flipq for pipe or timing changes
  drm/i915/display: Reset use_flipq when duplicating crtc state

 drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 43 ++++++++++++++++----
 2 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.43.0

