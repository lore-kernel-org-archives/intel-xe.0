Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC170D6CFB3
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 02:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87E710EB43;
	Fri, 23 Jan 2026 02:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTmq28lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FD010EA66;
 Fri, 23 Jan 2026 02:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769136677; x=1800672677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CTuoonUHJTAnLU/MFdgjqTzh3xH0CnwxIbTYXjsega0=;
 b=YTmq28lZzvP2XNDSg1Baw9qdb0gug45iTA9EsNlCcpJRe5kxlFhLQI2b
 BA/je2W6d3eOBPLAhn68oX27ytmkdz1MGCnFZxXEkuhzreTsvNGtRci8v
 yTVV9/fyYNzFqKhLh0PFBD4Z6mhR8BWFLJOSSgO+UIaQqCdVxNi8+JWNP
 wvg3s/1K0dw3aYmy6BaaCGavrRql0IiboUYmyVcaYLm4EpTsZB2jrKvYL
 yLPpHvBX8BxzsYM1Jm5Lq2YKUl/+b1CGv5UkT7Bibl3TugOrbA+ZnEMMj
 uh9kNhuZZM+4QjOa6A0wRTJ89/a5kHapUF05MX6DtwvVkKRRYJZTdNRvm w==;
X-CSE-ConnectionGUID: Tjgr/TZURpu+DgnA4VL7Hg==
X-CSE-MsgGUID: Zm+hhJqrTf63MZcVQc2RRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81016457"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="81016457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:51:17 -0800
X-CSE-ConnectionGUID: r8IcQLVLTmyjSbcC2mI8JA==
X-CSE-MsgGUID: V8s5VnLBQBa22G635UH6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="211773092"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:51:17 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/6] platform/x86/intel/vsec: Make driver_data info const
Date: Thu, 22 Jan 2026 18:51:03 -0800
Message-ID: <20260123025108.3772255-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123025108.3772255-1-david.e.box@linux.intel.com>
References: <20260123025108.3772255-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Treat PCI id->driver_data (intel_vsec_platform_info) as read-only by making
vsec_priv->info a const pointer and updating all function signatures to
accept const intel_vsec_platform_info *.

This improves const-correctness and clarifies that the platform info data
from the driver_data table is not meant to be modified at runtime.

No functional changes intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
v4:
  - No change

v3:
  - No change

v2:
  - New patch

 drivers/platform/x86/intel/vsec.c | 20 ++++++++++----------
 include/linux/intel_vsec.h        |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index a10e2c65205c..61b32ae7f064 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -42,7 +42,7 @@ enum vsec_device_state {
 };
=20
 struct vsec_priv {
-	struct intel_vsec_platform_info *info;
+	const struct intel_vsec_platform_info *info;
 	struct device *suppliers[VSEC_FEATURE_COUNT];
 	struct oobmsm_plat_info plat_info;
 	enum vsec_device_state state[VSEC_FEATURE_COUNT];
@@ -270,7 +270,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct dev=
ice *parent,
 EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
=20
 static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_head=
er *header,
-			      struct intel_vsec_platform_info *info,
+			      const struct intel_vsec_platform_info *info,
 			      unsigned long cap_id, u64 base_addr)
 {
 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
@@ -406,7 +406,7 @@ static int get_cap_id(u32 header_id, unsigned long *cap=
_id)
=20
 static int intel_vsec_register_device(struct pci_dev *pdev,
 				      struct intel_vsec_header *header,
-				      struct intel_vsec_platform_info *info,
+				      const struct intel_vsec_platform_info *info,
 				      u64 base_addr)
 {
 	const struct vsec_feature_dependency *consumer_deps;
@@ -452,7 +452,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
 }
=20
 static bool intel_vsec_walk_header(struct pci_dev *pdev,
-				   struct intel_vsec_platform_info *info)
+				   const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
 	bool have_devices =3D false;
@@ -468,7 +468,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 }
=20
 static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
-				  struct intel_vsec_platform_info *info)
+				  const struct intel_vsec_platform_info *info)
 {
 	bool have_devices =3D false;
 	int pos =3D 0;
@@ -519,7 +519,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 }
=20
 static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
-				 struct intel_vsec_platform_info *info)
+				 const struct intel_vsec_platform_info *info)
 {
 	bool have_devices =3D false;
 	int pos =3D 0;
@@ -565,7 +565,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 }
=20
 int intel_vsec_register(struct pci_dev *pdev,
-			 struct intel_vsec_platform_info *info)
+			const struct intel_vsec_platform_info *info)
 {
 	if (!pdev || !info || !info->headers)
 		return -EINVAL;
@@ -578,7 +578,7 @@ int intel_vsec_register(struct pci_dev *pdev,
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
 static bool intel_vsec_get_features(struct pci_dev *pdev,
-				    struct intel_vsec_platform_info *info)
+				    const struct intel_vsec_platform_info *info)
 {
 	bool found =3D false;
=20
@@ -622,7 +622,7 @@ static void intel_vsec_skip_missing_dependencies(struct=
 pci_dev *pdev)
=20
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
-	struct intel_vsec_platform_info *info;
+	const struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
 	int num_caps, ret;
 	int run_once =3D 0;
@@ -633,7 +633,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id
 		return ret;
=20
 	pci_save_state(pdev);
-	info =3D (struct intel_vsec_platform_info *)id->driver_data;
+	info =3D (const struct intel_vsec_platform_info *)id->driver_data;
 	if (!info)
 		return -EINVAL;
=20
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1a0f357c2427..d551174b0049 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -200,13 +200,13 @@ static inline struct intel_vsec_device *auxdev_to_ivd=
ev(struct auxiliary_device
=20
 #if IS_ENABLED(CONFIG_INTEL_VSEC)
 int intel_vsec_register(struct pci_dev *pdev,
-			 struct intel_vsec_platform_info *info);
+			const struct intel_vsec_platform_info *info);
 int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
 			   struct intel_vsec_device *vsec_dev);
 struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
 #else
 static inline int intel_vsec_register(struct pci_dev *pdev,
-				       struct intel_vsec_platform_info *info)
+				      const struct intel_vsec_platform_info *info)
 {
 	return -ENODEV;
 }
--=20
2.43.0

