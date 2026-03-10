Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3E0EB107C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 15:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D97D10E2B9;
	Tue, 10 Mar 2026 15:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0iee0qf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC21910E2B9;
 Tue, 10 Mar 2026 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773158285; x=1804694285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+X9y7KNZkgvzI52SfL7d0kDv8uqgqC8C4w+XHZkcG7Q=;
 b=k0iee0qf+RpJdsyRqAUy+MYod3edIjp4KzIMk5f1fl3EAVtP+/6fd7H8
 enFlNcSdDBctU+BA5Ilp4V4T14rRBz8uit8apWNEVYbrpf+B6Wrw7WNLx
 QQ5xxhoW+1Nvo8tgYIBYZzkIc3BBlyxrV4XV+7rWFgwYFMaQy/uZE0Z35
 19lP3MZWidKGyP+Cxp/6KoRcgsXO1MbkoQUUNnINrrDI4saZ47gX2pixA
 lp76P3R3blQN1qVlPZnkBJjaJ/PAvnMEKz7UZx7YKaVnSXFusRjUCTHjs
 Ke44PIILn1Tr9JK7yl9SfWRjxxb6acNXPN+IoDlAgfOYPYsjiWxL9Lnx4 g==;
X-CSE-ConnectionGUID: KOKAXPYcQjyaWhPQgPobQg==
X-CSE-MsgGUID: lUbkZS9US/2Ox+gsm3zHDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84842710"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84842710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:58:04 -0700
X-CSE-ConnectionGUID: EAFOKXmUSPSFAlI0Z/OpMg==
X-CSE-MsgGUID: r2eYoRa7QNuN57UImdj9jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224615359"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:58:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>,
 David Howells <dhowells@redhat.com>,
 Christian Brauner <brauner@kernel.org>, Kees Cook <kees@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, LMKL <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH RESEND 0/2] Xe driver asynchronous notification mechanism
Date: Tue, 10 Mar 2026 16:57:39 +0100
Message-ID: <20260310155741.87191-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

There is a need to inform user-space clients when a rebind worker
has ran out of memory so that it can react, adjust its working-set
and restart the job. This patch series aims to start a discussion
about the bet way to accomplish this.

The series builds on the core "general notification mechanism" or
"watch_queue", and attaches a watch queue to each xe drm file.

The watch_queue is extremely flexible and allows filtering out
events of interest at the kernel level. There can be multiple
listeners.

Another approach would be to use drm events, but then there
could only be one listener per open file and no filtering.
Otoh drm events would probably have the shortest delivery
latency.

Finally there is eventfd (man 2 eventfd) but doesn't appear to
allow carrying metadata.

Any feedback appreciated, also on method preference.

Patch 1 extende the watch_queue interface slightly,
Patch 2 implements delivery of a VM rebind worker error.

Note this is to be regarded as a POC at this time. No need for
a detailed review.

A user-space igt user is posted as an RFC here:

https://patchwork.freedesktop.org/series/162576/

RESEND:
- Widening the audience to solicit watch_queue feedback.

Thomas Hellström (2):
  watch_queue: Add a DRM_XE_NOTIFY watch type and export init_watch()
  drm/xe: Add watch_queue-based device event notification

 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   7 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_vm.c           |   7 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 drivers/gpu/drm/xe/xe_watch_queue.c  | 107 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_watch_queue.h  |  20 +++++
 include/uapi/drm/xe_drm.h            |  46 ++++++++++++
 include/uapi/drm/xe_drm_events.h     |  56 ++++++++++++++
 include/uapi/linux/watch_queue.h     |   3 +-
 kernel/watch_queue.c                 |  13 +++-
 12 files changed, 263 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_watch_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_watch_queue.h
 create mode 100644 include/uapi/drm/xe_drm_events.h

-- 
2.53.0

