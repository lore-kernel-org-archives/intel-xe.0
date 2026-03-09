Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C90CFCA182
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 20:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3EF10E5C8;
	Mon,  9 Mar 2026 20:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVfVJkv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCBB10E5BF
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773086874; x=1804622874;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=COzAWBnxm+sguUD+IgBKVl26FwPmPiGUsY0k0sRhMYM=;
 b=QVfVJkv6WrkT/vTXkBbI7pX0oCGyqNwBGQXzZdD5jO9eeLe51S3hiSI0
 C9hRg/3D9P/BUP2wLuF9TsP/3jmcP3VdhXSEmG7S3Qxe1phLuH+tsYfWv
 s9J+sIBsRc9jEeSOVwry9fu7xDfQrs/sPUfZ12TEfFlSmsmxs6xf7WvsW
 IZQ3y/pgLiO7ke4lFpCb9ycx773x2gSOCUYuXMdBRGXuHlZE08FCW9GQD
 XoTe9Puk0dInhOpuHxXpo3vUdMWJQ4aHZwGxhtd7oHBttJ6ZiOoZAybc4
 cG7B38PtROUPdNy13eUc09oWGckmc7iKbeNA0KHzuQKVjEEbODeuOi3MT Q==;
X-CSE-ConnectionGUID: /xkoey3fTCKp+aB2BKYrfw==
X-CSE-MsgGUID: l2yXD81pTeWF9AhOls9iJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="61694887"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="61694887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:07:54 -0700
X-CSE-ConnectionGUID: MDuj944gQkqzjMD1MIkwqw==
X-CSE-MsgGUID: 3TnrvJhdTz2z+DdtHl+tOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="242879514"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:07:53 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 17:07:33 -0300
Subject: [PATCH v3 5/8] drm/xe: Call xe_wa_process_device_oob() after
 xe_sriov_probe_early()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v3-5-0416900dd498@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

We will need to use FUNC(xe_rtp_match_not_sriov_vf) in an upcoming
device OOB workaround and we need the SRIOV mode already defined by the
time that workaround check is done.  Move the call to
xe_wa_process_device_oob() to happen after  xe_sriov_probe_early() to
allow usage of FUNC(xe_rtp_match_not_sriov_vf).

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..5651bcdc6752 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -699,15 +699,15 @@ int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
 
-	xe_wa_device_init(xe);
-	xe_wa_process_device_oob(xe);
-
 	err = xe_mmio_probe_early(xe);
 	if (err)
 		return err;
 
 	xe_sriov_probe_early(xe);
 
+	xe_wa_device_init(xe);
+	xe_wa_process_device_oob(xe);
+
 	if (IS_SRIOV_VF(xe))
 		vf_update_device_info(xe);
 

-- 
2.52.0

