Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E2C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 08:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BC310E73C;
	Wed, 12 Apr 2023 08:21:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8278D10E73B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681287691; x=1712823691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=34+t+KoLNgthjVn42xG4aQIjzCkiUzlv9ErnZmXysaI=;
 b=Ai9I34Pdii6fHUq8CP0qanF9CFKTQF/EYuT2DovT0YuIwhYpTQMmKDln
 7nFKiJWiFad7XzCpBWb/nUslTvzsTld8lutqTmKDC1ziXctuRNY1xbRDC
 P+NX1yYkG2lv+ScYqLwvciGNaDNdeeTuyf9E5CaGPiQHyu5z6S+0XecFx
 G/LICsCYGh+HoqcxRoZlCQOI1GevvsD0g+KpY5R8pQ8pf0ttcs72pTllg
 o1X14xTll7LEp1cRpI9z+z1UKSovizjVryPaQRpYkwP0zooeiISqIUDqt
 ptbKs876XPLxmbOPBdHr0TtkILGYD4m1ow7SbhwXu2aDp+m8r1zoD8w7c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406665649"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="406665649"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 01:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="758150821"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="758150821"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 01:21:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 01:20:52 -0700
Message-Id: <20230412082054.3314568-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/2] Dump + OOB workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is 2 RFCs in one, since they are more or less related.

PATCH #1) Dump the "driver workaround database" to check what are the
workarounds implemented. This is useful when checking against the spec
what workarounds are implemented in the driver.  This can later be
extended to mark what are the "active" workarounds on the current
platform.  I think this second scenario is more useful for the debugfs
usage.

Other alternatives I have considered:
a) Reuse the kunit infra; with this it's possible to easily fake a
platform and get what are the WAs considered "active" for a platform.
This is nice because it doesn't need to run on real hardware. However
this may be abusing what the kunit is for

b) Just write a tool in C or python that parses the section from
the .ko and output the info need. Drawback is keeping in sync the
declarations from xe_rtp with this additional tool. And probably also
that it'd need to process the rules by itself.

PATCH #2) "out-of-band" workarounds, i.e. those that are sprinkled
around the driver. In the implementation here I tried to keep the caller
similar to what it was before. With the addition of XE_WA() the caller
"registers" the workaround so later we can access it. As example I
converted 1 place in xe_guc.c to use that.

Note: The "condition" is checked each time it goes through that code
path.  I was debating the ability to just re-use XE_RTP_RULE() instead
since it appears all the conditions can be translated to rules.
Consider this the alternative (a).

After writing the commit message for that patch I thought: but if we can
transform those conditions in rules, we could very well keep them in an
additional table in xe_wa.c, which is the alternative below:

b) keep an additional table in xe_wa.c whose action is to set a
bit/byte(?)  in  xe->active_oob_workarounds[]. During probe
the rules are processed and the ones active are marked in that array.
The extra section created by XE_WA() is then used to just map
the WA to the index value. Then the callers would only need something
like `if (XE_WA(xe, "XXXXXX") { ... } ` since the condition would be
executed once on init.  However I'm thinking that this may not scale to
all workarounds we may have.

Thoughts?

thanks
Lucas De Marchi

Lucas De Marchi (2):
  drm/xe: Add debugfs to dump all known workarounds
  drm/xe: Register OOB workarounds

 drivers/gpu/drm/xe/Makefile       |  2 ++
 drivers/gpu/drm/xe/xe.lds         |  8 +++++++
 drivers/gpu/drm/xe/xe_debugfs.c   | 12 ++++++++++
 drivers/gpu/drm/xe/xe_guc.c       |  6 ++---
 drivers/gpu/drm/xe/xe_rtp_types.h |  8 +++++++
 drivers/gpu/drm/xe/xe_wa.c        | 38 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wa.h        | 14 ++++++++++++
 7 files changed, 83 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe.lds

-- 
2.39.0

