Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C554C0219B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 01:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ABB10E1CD;
	Wed, 12 Feb 2025 01:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFwCc07r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BC510E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739322180; x=1770858180;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ut+hjgKMF2pZYM6/LyfZh7XG+O8vY17ivh3ngj0lBk=;
 b=SFwCc07rxoGFA+pu8RvPp4ynfXHmlgdWDXs1uDoLjGCTGwjH1U++Dd4y
 W5KkdlklA/hSHql/jAnHCSEwx7E4fGO5CLRKuz4gEAngo83P7mEZg3jNq
 7QlYtfJtk7zD1BrFrp4b6lUH7huCAFxe6h9sNqJYoDJpTm5b9o6rbMOAp
 QuBhZKgpEqTPWrtGd7nfvJM4FzjIXrpB4HbyR7VpwR+S0acBLZZXhYfF6
 MBw91Dc3eJi+AKoyNuxd2k/agK6NYcCJIHbpl2QHhxYm+IpnQnDNhBLrl
 SH7+jYQo/c+AAhQoHOSricPFaGSuUg6hMQGT28y7P14srH3OyN2Q0g10s w==;
X-CSE-ConnectionGUID: anxMSEnER/S+s+DQF1fkEg==
X-CSE-MsgGUID: wluuL3iETSyOAuKkX+QR7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27564197"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="27564197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 17:02:59 -0800
X-CSE-ConnectionGUID: ZPqPyLYNSdizB6GbI0iPng==
X-CSE-MsgGUID: 6xdWFEIARQy4+3pYgKsnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117607853"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 17:03:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Ensure that polled read returns latest data
Date: Tue, 11 Feb 2025 17:02:55 -0800
Message-Id: <20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

In polled mode, user calls poll() for read data to be available before
performing a read(). In the duration between these 2 calls, there may be
new data available in the OA buffer. To ensure user reads all available
data, check for latest data in the OA buffer in polled read.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fa873f3d0a9d..a692dffcb638 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -548,6 +548,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 			mutex_unlock(&stream->stream_lock);
 		} while (!offset && !ret);
 	} else {
+		xe_oa_buffer_check_unlocked(stream);
 		mutex_lock(&stream->stream_lock);
 		ret = __xe_oa_read(stream, buf, count, &offset);
 		mutex_unlock(&stream->stream_lock);
-- 
2.34.1

