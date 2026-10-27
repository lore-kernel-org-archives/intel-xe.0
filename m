Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3F606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gfke97sZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EC610F5CB;
	Tue, 27 Oct 2026 14:28:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D88210F5CB
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793111290; x=1824647290;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=N74id0aU8TF9KlHylJZkFVUW1gFG9DYAaf6dgbD1Pgc=;
 b=gfke97sZdMgwt7ZiimfSTs1iD8u2nluDwaIwZj5225RzgCl/YZ08/SmO
 m3l2tronYqtj5tWYHr7XoPaZauBHz2KtaHtn1HotyKWbHzTOtuE18vIcg
 ry9iA0C3+BObxMMQ93wqjilB0FTF+txA1O8KRtwUxTkBwYs1hHZpXF171
 O1zysyV9SeX14JbKIBK+VOwbwBQk7GWm2OEyo+3ebAIgHiRrSdfO5PKjr
 47YIEifooNA4GE33xaF4xM2ywgHLOCqTuvXRko9OBVHL7P1dUGGxzYSpJ
 46/8/GMRI2VQJ9pukIC3zwZrjy/4/0ivhNHS3/lSFZOGMYkQBqBtS/31d Q==;
X-CSE-ConnectionGUID: B9V+HZzzTPOfwigcT5RX0Q==
X-CSE-MsgGUID: qgO8EQohQJK/mUBmgr57LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1695953"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1695953"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:28:10 -0700
X-CSE-ConnectionGUID: WB8knHejQVqNKr9lCt60Jw==
X-CSE-MsgGUID: iOK0/P/ASCKYLhNtsMx2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6316092"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.252])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:28:08 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 0/3] drm/xe: Update Wa_14026539277
Date: Tue, 27 Oct 2026 11:27:26 -0300
Message-Id: <20261027-wa_14026539277-v5-0-541941b1c032@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23O0YrCMBCF4VeRXJtlMkmTxqt9DxEZ08kaWNull
 apI331HWVaxXp7A90+uauC+8KBWi6vqeSxD6VoZ1XKh0p7aL9alka0Q0EMAo0+0NU5GZSOGoGN
 jIzFE2oVKCfrpOZfzPbjeyN6X4dj1l3t/NLfXvxTOUqPRoCFmMoDZQu0+S3vk74/UHdQtNeIzd
 zOOwqkJtU/J78jwK7cPXr+5boWbHOuElA1m/8rdP5f/+Rl3wivHDhrLEYme+TRNv1hcwVppAQA
 A
X-Change-ID: 20260701-wa_14026539277-9d39ae09ab75
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, Carl Zhang <Carl.Zhang@intel.com>, 
 Filip Hazubski <filip.hazubski@intel.com>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The definition of Wa_14026539277 has been updated in the workaround
database and requires a different implementation.  Let's revert the
existing one and then add the up-to-date implementation.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v5:
- Incorporate feedback from Sashiko to make the madvise-specific check
  for the workaround to happen early in the VMA-independent function
  madvise_args_are_sane() instead of check_pat_args_are_sane().
- Link to v4: https://patch.msgid.link/20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com

Changes in v4:
- Rebased to fix conflicts with latest drm-tip.
- Link to v3: https://patch.msgid.link/20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com

Changes in v3:
- Changed patch "drm/xe: Add up-to-date implementation for
  Wa_14026539277" to handle 2-way-coherent PAT indexes irrespective of
  L3 cache policy.
- Link to v2: https://patch.msgid.link/20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com

Changes in v2:
- Details of the changes are in the patch's changelog.
- Link to v1: https://patch.msgid.link/20260721-wa_14026539277-v1-0-09fa102f3084@intel.com

---
Gustavo Sousa (3):
      drm/xe: Extract override_has_cached_pt()
      Revert "drm/xe/nvlp: Implement Wa_14026539277"
      drm/xe: Add up-to-date implementation for Wa_14026539277

 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 --
 drivers/gpu/drm/xe/xe_device.c            | 28 ++++++++++----
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 -
 drivers/gpu/drm/xe/xe_gt.c                | 39 -------------------
 drivers/gpu/drm/xe/xe_pat.c               | 64 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pat.h               | 10 +++++
 drivers/gpu/drm/xe/xe_vm.c                |  5 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c        |  4 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 9 files changed, 98 insertions(+), 58 deletions(-)
---
base-commit: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32
change-id: 20260701-wa_14026539277-9d39ae09ab75

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

