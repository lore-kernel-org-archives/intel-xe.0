Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C6FCD98F6
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9410F0EB;
	Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDiq0KjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7D910F0E9
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781724394; x=1813260394;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=cH/JdjCD4m4Hzq+/w3a92pTR16O5EKu871flLIOOc40=;
 b=YDiq0KjBgLnlX0D+rgf9Tm5mEP96vS7Au50BrOgfaOVox3OBpQDsl1DB
 ja/CVpBnGKh9y2li/zmXC3AgDldhhHN7maJo8D1c29XdTJJpM8cNRE3Kd
 CacgWRiod1UyWL9xyj+VtnRSje1+MMIlZ62A13i3Fq2YAWBmgN3hyr8C1
 DPp6ACYTUolMiSriSlinVMjIO09YVbuxYoVWEsKAGmViqV287NKTO/aiq
 oOGZBB4P7MWVBWU99H7f655dqvW++u61Ou+CjO8ACrNQSFHD0Dnuj3H3C
 SqoAQu7AmpfCEaFSj5MblxKhwMe6Fb2EBg7Bcp6AVGt/v445tRc6+LKIn g==;
X-CSE-ConnectionGUID: lPJavRZwQVGjfcIRwyxv7Q==
X-CSE-MsgGUID: KsQB6uBGRuyinFvAfGZ6Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105339756"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="105339756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:47 -0700
X-CSE-ConnectionGUID: LOuSU1QtQBujQh/daZAC+g==
X-CSE-MsgGUID: 0GCe7YtWT9G0+UHulpSi6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="278347292"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 0/5] Move RTP tables for engine init off the stack
Date: Wed, 17 Jun 2026 12:24:44 -0700
Message-Id: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBAFf0X23BSTaoo99T+KSDSbuqCJJCGti
 P/eVOixxxl48zYI6AkD3IoNPCYK5GwGcSpgGJV9IiOdGUQpZCl5zXxcuhfFsdOrVTMNXVJTYIZ
 L3si6qrkykLeLR0Pvo/toM48UovPrcZP41/6K8k8xcVYyI/rq2qNqtL7cyUaczoObod33/QN/S
 ye5ugAAAA==
X-Change-ID: 20260615-rtp_with_dynamic_vals-f161965451af
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=cH/JdjCD4m4Hzq+/w3a92pTR16O5EKu871flLIOOc40=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMvS2ZBDpmwrBJnTZXcguqhK7CmR2BiP2NmOm7
 RCmLBFO3qyJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajL0tgAKCRBNeSQFyHKQ
 BJ1oD/4olFfSvIYU3G/454d00LALI6tHRcDZzzVEwTtsKEP50W0Xyoz+6Ulf3vTv+DXL5PRsl9q
 jiO8vagQZI0wxJURBknAYXDXRg6ynrI5veQOIMVKcfZE5dZar5yvkGr9U/q9++usG+5/TOfeJAJ
 Pfy0vYTJDLmqeLdCs75wgSg8/n2iS6reBcmo6am+UubqLpG+RMBKgDDs2sEqksUJol+xSCSYW6X
 ImTdzsgzosGkKL7o4SFlXAoUYPM90LUJ9Xv9JmGhucFcW9s8lePLum5AqoLCV2S6iyCrxpE+s1I
 kfp8A0n3ztYqBh6A43tTSCVWzfgaKLfNgTtuJ3zxlvMI+NjTNxI/oVRr6h7yLGcPXnux2vw6WUr
 7SiX+lBc+kg4LZj5O3eqvY9tsQKCLiPKwnpC1ev2g5Q/2mvMqw4M8XxSNMJjMyqxmeoNWQJtW4u
 sAUNQ6LpcPpQn2hYBC6rmVPOqCHma9EJFAOmleSKUxGhQgtWcHJ7JBKbMJRC9M8fmZRPTRq2agH
 2qAkIwByL4/VP2rlPCCRDcJv1u4p/ATZtvp80KrINFByJjXpCLYF3cFkJ0u9+fNHK/ryUCV7y9U
 F9QDPF/gwUlcYitFKuFFfAT0O4/Zjj68ktWWGBdZmYK7sTXepWqtWH6GaFfDPQPxkWGVdfEz1O6
 svjbuenVtmmXo/A==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

There are two RTP tables used during engine initialization that are
currently defined as stack variables inside of functions because they're
not truly constant tables and utilize other values calculated on the
functions' stacks.  We'd like to make those tables truly constant and
pull them out of the function bodies.  Doing so should make the code
more readable, avoid compiler warnings about stack size as these tables
grow over time, and potentially allow these tables to be tested with
kunit in the future.

Let's add a FIELD_SET_FUNC RTP action that acts similarly to FIELD_SET,
but indicates that the value to write should be determined during RTP
processing by calling the provided function pointer.  FIELD_SET_FUNC can
be used with small static functions to calculate the cache control
values at runtime.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v2:
- Made tables 'static'
- Tweaked kerneldoc for FIELD_SET_FUNC (Gustavo)
- Added a couple extra kunit tests to exercise FIELD_SET_FUNC (Gustavo)
- Link to v1: https://lore.kernel.org/r/20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com

---
Matt Roper (5):
      drm/xe: Reformat xe_rtp_types.h
      drm/xe/rtp: Add FIELD_SET_FUNC RTP action
      drm/xe: Move engines' LRC programming RTP table off the stack
      drm/xe: Move engines' non-LRC programming RTP table off the stack
      drm/xe/rtp: Add kunit tests to exercise FIELD_SET_FUNC action

 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  52 ++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c      | 218 +++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_rtp.c            |  10 +-
 drivers/gpu/drm/xe/xe_rtp.h            |  19 +++
 drivers/gpu/drm/xe/xe_rtp_types.h      |  33 ++++-
 5 files changed, 219 insertions(+), 113 deletions(-)
---
base-commit: 0984dfdee2a4f9e1922fe919a6b469e115e23360
change-id: 20260615-rtp_with_dynamic_vals-f161965451af

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

