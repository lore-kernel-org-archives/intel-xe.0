Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CE5E9371D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 22:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A5410E082;
	Mon,  9 Oct 2023 22:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8F10E082
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 22:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696890413; x=1728426413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gYcev3bHZuzf4IFdo7kOLU6+CodtobdC68pgELgxro0=;
 b=giR3P5BsyG+YaoL6TceOMW5R/yN/LR4Y0MeDzkEyTGlt273HIx6tH6Kh
 7TbLow7t1m4p78tkl6GkSWaKNqNe/vIjXDdkz5UVnI9sRHTkflo44dGYd
 yfnmTXdrbLhSArpfwxMXDjNm4CxcRaesKB88V6NBQwc+hn4dudAqC9Kih
 /28pINSwbbKzYHqESbLYy4+Dt6kTdLMLt93n7SAUc6f8Zc7of5o8Ham2H
 Yb5aU9b+8NGiUtkoddd7k1UPFz+jT6VwT0Ny1lboBg848DAd78cuKJOWL
 QxGfvrQd3I2InKsRXCuwX5AN/XKKNrhESqgiAVsngcmmNvDnB94w8NJoE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369325820"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="369325820"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000389561"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="1000389561"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:24:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 15:24:07 -0700
Message-ID: <20231009222409.620443-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Xe PERF layer
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
Cc: ogabbay@habana.ai, gzadicario@habana.ai,
 Harish Chegondi <harish.chegondi@intel.com>, bdotan@habana.ai, talbo@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These changes were originally submitted as part of [1] but since they are
needed by multiple teams developing different Xe PERF stream types, I am
separating these changes out as part of an independent series which can be
merged first, independently of OA.

The full use of these uapi changes (for OA) can be seen in [2] and [3].

[1] https://patchwork.freedesktop.org/series/121084/
[2] https://patchwork.freedesktop.org/patch/558376/?series=121084&rev=6
[3] https://patchwork.freedesktop.org/patch/558375/?series=121084&rev=6

Ashutosh Dixit (2):
  drm/xe/uapi: "Perf" layer to support multiple perf counter stream
    types
  drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl

 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_perf.c   | 21 +++++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 16 ++++++++++++
 include/uapi/drm/xe_drm.h      | 47 ++++++++++++++++++++++++++++++++++
 5 files changed, 87 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

-- 
2.41.0

