Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB5DC25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 22:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A40010E8C4;
	Thu, 26 Oct 2023 22:05:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBBE10E8C4
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 22:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698357897; x=1729893897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ox/chwp2fhvWSN2lf7Nl+l9slZe6NEyxfhYpme/BPXc=;
 b=fF8DJbXj9CN8SnJdQGdzcM4woRnj2GT1EUhirghpeZvY+v/8eU1Pb5XP
 0eDivq8DAYw1y9MyZTXYtpo+ptkOmQsKEHFVEiI8HKiHaptWHc7YY8MIw
 GUDn8Yzu7+EcNBv9ZoI+PXSJbjnp1fTRd3+x67EY76/yrM4orvFj9FtrW
 kPbUvE87N2OgH2kFMJzvhHp5T2KtEqfHciFO5fFP7aYIpDUoWt8nG0yKr
 7OVhjdDHwJCPlS5tvWCwy59mQpQBDGzJcZ3I8LnAt9UAcPdM2dnSRNXrY
 y3KLKO/iZkAo0g1nJcXws/Kfo7tWLqW8FknsyAk+I2hV+cn90hFZQM8Hs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="390515089"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="390515089"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 15:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1006536397"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; d="scan'208";a="1006536397"
Received: from miryad.jf.intel.com ([10.54.74.46])
 by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2023 15:04:56 -0700
From: Carlos Santa <carlos.santa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 15:01:27 -0700
Message-Id: <20231026220127.3406918-1-carlos.santa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] drm/xe: stringify the argument to avoid potential
 vulnerability
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
Cc: Carlos Santa <carlos.santa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This error gets printed inside a sandbox with warnings turned on.

/mnt/host/source/src/third_party/kernel/v5.15/drivers/
gpu/drm/xe/xe_gt_idle_sysfs.c:87:26: error: format string is
not a string literal (potentially insecure) [-Werror,-Wformat-security]
        return sysfs_emit(buff, gtidle->name);
                                ^~~~~~~~~~~~
/mnt/host/source/src/third_party/kernel/v5.15/drivers/
gpu/drm/xe/xe_gt_idle_sysfs.c:87:26: note: treat the string
as an argument to avoid this
        return sysfs_emit(buff, gtidle->name);
                                ^
                                "%s",
1 error generated.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Carlos Santa <carlos.santa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
index 7238e96a116c..8df9840811cd 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
@@ -85,7 +85,7 @@ static ssize_t name_show(struct device *dev,
 {
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 
-	return sysfs_emit(buff, gtidle->name);
+	return sysfs_emit(buff, "%s\n", gtidle->name);
 }
 static DEVICE_ATTR_RO(name);
 
-- 
2.25.1

