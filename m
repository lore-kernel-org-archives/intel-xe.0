Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3313606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 02:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d4ySrnuI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D710E515;
	Fri, 23 Oct 2026 02:38:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DFC10E515
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792723121; x=1824259121;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JudUA5oX2+JfvSm/1rbIjHDXApT3gjjz8ob0y0D4bwc=;
 b=d4ySrnuIIClkCBSpcFh/iEsgwdrFEikBR0gyak2P4EssMcpkmEIQUfT4
 CHf8DkJpIF25gSk4qZJwC6DyLGao5ueH6o77zuSFuf1tiV1jSB2sxmeev
 8MjGpztWPxWj8fZHkUhgKyhQApOkk/cEla6UblN632VSe3ghtSBKFsEXd
 rDX3Q7exZSANEXkfF6od4JgarmSExdF6Qh95ndNIzAMNFtF2cXYvCz4pH
 cQu3rj1oqvfN5XSQyEzjfQ/TzjQWuAwRzBqYXo4+jxFwln/c6X2Kd7Bhz
 rWAGJJztPAvc0ooG2ULh/BeGdQokvd8Fa1qEF5se2jHk0qyPDLMgKgjvM w==;
X-CSE-ConnectionGUID: 3/b6ydYkRRmOjwViW526JA==
X-CSE-MsgGUID: Q4045YVuRSmSseOcVkU0gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1356811"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1356811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 19:38:40 -0700
X-CSE-ConnectionGUID: uND2meZtRc+pGmK/+JB5RQ==
X-CSE-MsgGUID: CZN8qKZmSZ6V6jWa5Vps8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3461556"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 19:38:41 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com, david.e.box@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 rodrigo.vivi@intel.com, michael.j.ruhl@intel.com, ayaz.siddiqui@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, intel-xe@lists.freedesktop.org,
 hansg@kernel.org
Subject: [PATCH v2 0/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
Date: Thu, 22 Oct 2026 19:38:31 -0700
Message-ID: <cover.1792721526.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch adds a uevent so userspace can find out when an Intel PMT
crashlog is available without polling.

It emits a KOBJ_CHANGE uevent on the crashlog<x> device carrying
INTEL_PMT_CRASHLOG_COMPLETE. The value is 1 when a completed crashlog is
found at probe, or when a manually triggered capture completes. The value
is 0 when a manual trigger does not complete within the 5 second poll
window.  The ABI documentation is updated to match.

v1 was a three-patch series. Patches 1 and 2 are no longer part of it:

 - Patch 1 (NULL dereference when reading crashlog data) is dropped in
   favor of Michael's "platform/x86/intel/pmt: complete pcidev to
   device update" (b86e5062cb88), which fixes the same bug.

 - Patch 2 (inverted walk_header() test in get_features()) has been
   applied as 3678e39c6aae.

Both are in the base of this posting, review-ilpo-next. The patch also
applies cleanly to for-next.

Testing: the patch was tested in an emulated (QEMU) environment on a
kernel with CONFIG_PROVE_LOCKING, covering the probe-time event, the
event after a manual trigger completes, triggers rejected while a log
is complete or the device is disabled, clear, trigger=3D0 and rearm while
the trigger poll is running, expiry of the poll window, module removal
with the poll pending, and re-probe. Hardware with this crashlog
support is available, but testing on it is still pending.

V2 changes:
  - Replaced the two uevent variables with a single
    INTEL_PMT_CRASHLOG_COMPLETE. INTEL_PMT_CRASHLOG_EVENT=3DPRESENT and
    COMPLETE=3D1 were both fixed and carried no information beyond the
    event itself.
  - Emit COMPLETE=3D0 when a manual trigger does not complete within the
    poll window, so userspace is not left waiting.
  - Reject manual triggers until probe has finished setting up the
    entry. This closes a window where a trigger during
    intel_pmt_dev_create() could queue work against a device freed by
    its error path (reported by sashiko on v1).
  - Dropped the cancel_*_sync() calls on the intel_pmt_dev_create()
    failure and skip paths. They ran after the device was already
    freed, but with triggers now rejected until setup completes no work
    can be pending there.
  - End the trigger poll without an event when the log is cleared or
    rearmed while it is running.
  - Cancel a stale poll only after the new trigger has been written, so
    a failed trigger leaves the previous poll in place.
  - Run the probe-time check under control_mutex, in the same critical
    section that enables triggers.
  - Run the poll on the freezable workqueue so it does not read the
    device during suspend.
  - Rebased onto review-ilpo-next and adapted to the crashlog register
    helpers now returning errors (Michal's additions). A failed status
    read counts as not complete.
  - Rewrote the ABI

v1: https://lore.kernel.org/all/20261001220351.1592138-1-david.e.box@linux.=
intel.com/

David E. Box (1):
  platform/x86/intel/pmt: Notify userspace when crashlogs complete

 .../ABI/testing/sysfs-class-intel_pmt         |  32 ++++
 drivers/platform/x86/intel/pmt/crashlog.c     | 138 +++++++++++++++++-
 2 files changed, 165 insertions(+), 5 deletions(-)


base-commit: 9d3475065167197742b0882aff21cf8e78393277
--=20
2.43.0

