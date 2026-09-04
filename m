Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC9C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42DC10FAD9;
	Fri,  4 Sep 2026 18:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J18iCKtn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0910E57C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788546307; x=1820082307;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
 b=J18iCKtnhUt2mKICt6jsocYQ69wp2XBPDfhguINC6WyFN7bZ6lZOeJXK
 z3zBuFJM2/ffulxUcCilvcFI+QenjbUQWKcve61+hF+UAUvje0hBIsTlb
 vCP/4FLSsx2W1Ifg001gnWppfI7RDEPci1cPmyHoOOn8tKonh9YbFs/eT
 9R710uTQGW0Xm5JPBuIUG+mojB4jGliD64+ViBdkCBcElIZIipn2mwnmk
 pQIIrdQPz9wzf+1gWKDXVB6xkezRtlMfOYtuYT/+/dyuEuio3/mBYE0sS
 QAjp7hcTBZ81jdpjuDLSVVRdj7prGcWYDlUfdQxoPhjz9WR51U0qpsbp7 Q==;
X-CSE-ConnectionGUID: pi1rRhh2RvOpLmZfGnEokw==
X-CSE-MsgGUID: jvdi85YuTnCYm7nkIbZtrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932209"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208,146";a="88932209"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:25:07 -0700
X-CSE-ConnectionGUID: 58tshCLHRT27RaQhJc2vsg==
X-CSE-MsgGUID: Fhdb8Vh0TSmb7WpWMYH8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
 d="scan'208,146";a="294992474"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:25:06 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v6 06/18] drm/xe/vsec: Do not register BMG PMT for VF
Date: Fri,  4 Sep 2026 11:24:56 -0700
Message-ID: <20260904182451.1164868-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
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

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..71bc359b2ad1 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (IS_SRIOV_VF(xe))
+		return -EINVAL;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		if (IS_SRIOV_VF(xe))
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

