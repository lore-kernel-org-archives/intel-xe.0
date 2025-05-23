Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CB8C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 19:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1F10E16F;
	Fri, 23 May 2025 18:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQgq4aLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345B810E0A4
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 18:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748026796; x=1779562796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QQLgSrDm1RsgDz5vL/NtHO9UusnR/CSWpW8ZzGV0fM8=;
 b=RQgq4aLyoMFAnib4ydcAgig1hf7u0j4igIfllfiq9DkFzpiR0hQ4YbZh
 U3ajjLDbrdKczqC5ursBNTNG+NjebBrxZo/qlZ8fd31Kf4W3b8v8K/5RH
 U8UbPJjPRru1g1OKK5kPlpavYCkA0HFDevUmEduMZgiygZmbpSUe1PLmB
 ly9ZuEU9Uh5d1E73znjlK7CRCFBP6ng5EziddpGI4dGvcchI5PC+MJooL
 MIjIoAAms9oGLLIZ6AWv3nX/MOTcNYXoq8XKBGfsRc8YKOXCrZAR3MZhD
 dEusxDmZvKGItvc07AhFJBsxGUr5DWIpogISjuZB3bQucKizhikoIL4SL g==;
X-CSE-ConnectionGUID: RBDH04zoTQqBJsWpLTftTA==
X-CSE-MsgGUID: 2sl3f9xsS86CXwqftDgYzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61498446"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="61498446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 11:59:55 -0700
X-CSE-ConnectionGUID: IuCQ7L9rTXqxj/2syEb9Vg==
X-CSE-MsgGUID: mkH7DkNtRiqSxpqY56sQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141758870"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 11:59:51 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH v3 02/11] PCI/ACPI: Per root port allow one Aux power limit
 request
Date: Sat, 24 May 2025 00:31:46 +0530
Message-Id: <20250523190155.2623462-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523190155.2623462-1-badal.nilawar@intel.com>
References: <20250523190155.2623462-1-badal.nilawar@intel.com>
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

For given root port allow one Aux power limit request.

Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/acpi/scan.c     |  1 +
 drivers/pci/pci-acpi.c  | 25 ++++++++++++++++++++++++-
 include/acpi/acpi_bus.h |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..9ae7be9db01a 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -745,6 +745,7 @@ int acpi_device_add(struct acpi_device *device)
 	INIT_LIST_HEAD(&device->physical_node_list);
 	INIT_LIST_HEAD(&device->del_list);
 	mutex_init(&device->physical_node_lock);
+	mutex_init(&device->power.aux_pwr_lock);
 
 	mutex_lock(&acpi_device_lock);
 
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 76b19525535f..53ba67678c3d 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1451,6 +1451,7 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 	union acpi_object *out_obj;
 	acpi_handle handle;
 	int result, ret = -EINVAL;
+	struct acpi_device *adev;
 
 	if (!dev)
 		return -EINVAL;
@@ -1464,11 +1465,27 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 		return -ENODEV;
 	}
 
+	adev = ACPI_COMPANION(&dev->dev);
+	if (!adev)
+		return -EINVAL;
+
+	mutex_lock(&adev->power.aux_pwr_lock);
+
+	/* Check if aux power already granted */
+	if (adev->power.aux_power_limit) {
+		pci_info(dev, "D3cold Aux Power request already granted: %u mW\n",
+			 adev->power.aux_power_limit);
+		mutex_unlock(&adev->power.aux_pwr_lock);
+		return -EPERM;
+	}
+
 	out_obj = acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4,
 					  DSM_PCI_D3COLD_AUX_POWER_LIMIT,
 					  &in_obj, ACPI_TYPE_INTEGER);
-	if (!out_obj)
+	if (!out_obj) {
+		mutex_unlock(&adev->power.aux_pwr_lock);
 		return -EINVAL;
+	}
 
 	result = out_obj->integer.value;
 	if (retry_interval)
@@ -1478,14 +1495,17 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 	case 0x0:
 		pci_dbg(dev, "D3cold Aux Power %u mW request denied\n",
 			requested_power);
+		adev->power.aux_power_limit = 0;
 		break;
 	case 0x1:
 		pci_info(dev, "D3cold Aux Power request granted: %u mW\n",
 			 requested_power);
+		adev->power.aux_power_limit = requested_power;
 		ret = 0;
 		break;
 	case 0x2:
 		pci_info(dev, "D3cold Aux Power: Main power won't be removed\n");
+		adev->power.aux_power_limit = 0;
 		ret = -EBUSY;
 		break;
 	default:
@@ -1500,9 +1520,12 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 			pci_err(dev, "D3cold Aux Power: Reserved or unsupported response: 0x%x\n",
 				result);
 		}
+		adev->power.aux_power_limit = 0;
 		break;
 	}
 
+	mutex_unlock(&adev->power.aux_pwr_lock);
+
 	ACPI_FREE(out_obj);
 	return ret;
 }
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index aad1a95e6863..c4ce3d84be00 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -294,6 +294,8 @@ struct acpi_device_power {
 	struct acpi_device_power_flags flags;
 	struct acpi_device_power_state states[ACPI_D_STATE_COUNT];	/* Power states (D0-D3Cold) */
 	u8 state_for_enumeration; /* Deepest power state for enumeration */
+	u32 aux_power_limit;		/* aux power limit granted by bios */
+	struct mutex aux_pwr_lock;	/* prevent concurrent aux power limit requests */
 };
 
 struct acpi_dep_data {
-- 
2.34.1

