Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FC606A322
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 22:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gljLTJzA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E5A10F186;
	Mon, 26 Oct 2026 22:08:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC93B10F186
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 22:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793052483; x=1824588483;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=qP/Ml0hQ3qAJbufDURm4B5qPi0RXQ7InZ+JULcsb3OE=;
 b=gljLTJzAODMA2I4ygy4lTMCeVT+hu6SIFM6G2Q6wXbFA8TqDXjVjWvvV
 IdIZE8TCWx8NqNXlGGVESiWQkut3VhSSOlce+Rv/ZbGxyg8+9z0BRP0aI
 yWMS08mFF5039nWISJVUlGukqLPRHy5ULNS7S4c5l2sGVjX85RR568M37
 7AvG9F6nDn/y9SO8UGIHHZf7veYyuCbLJWWkRixOPMx2hzb+RiiYPkWsW
 6SAgLeV3Mdp3fJ1Uhsai5iz+oyth5NxX5sNcjaGlvD8bEqAxTbqsA0vyW
 RHZB+ddZdO6x6xQNOIQzHr2Z2AJcY7sKLPX/svHc36Ru3GCREzELjPR7X g==;
X-CSE-ConnectionGUID: gDJemNUVR+WwMboRGf1PGw==
X-CSE-MsgGUID: I2+xBNtFTjGcCVOvlWCX0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1613814"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1613814"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 15:08:03 -0700
X-CSE-ConnectionGUID: 9OKQsPEoQmu7dEVGCtRr8A==
X-CSE-MsgGUID: OsW0rnAzR02mNUFOs5Az0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4336190"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 15:08:00 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 0/3] drm/xe: Update Wa_14026539277
Date: Mon, 26 Oct 2026 19:06:46 -0300
Message-Id: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23N0QrCIBTG8VcJrzP06HR21XtEhHPahNpChxVj7
 54bQaN1+R34/c+Aog3eRrTfDCjY5KPv2jz4doNMo9uLxb7OGwEBQSSh+KHPlOdRMAVSYlUzpS1
 RupIFyugerPPPOXg85d342HfhNfcTna6fFKxSiWKCiXKaEnCMlPzg295ed6a7oSmVYMn5ikPmu
 palMEZUmtpfzr68/POdZU6dKg1oR8GJJR/H8Q2pBS2BKgEAAA==
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
 drivers/gpu/drm/xe/xe_vm_madvise.c        |  3 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 9 files changed, 97 insertions(+), 58 deletions(-)
---
base-commit: 3543fd9d737a3f30b44d036b5de64c379d1c376f
change-id: 20260701-wa_14026539277-9d39ae09ab75

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

