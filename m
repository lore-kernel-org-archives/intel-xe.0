Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504DC54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 11:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42DC10E1F8;
	Thu, 29 May 2025 11:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXvx9tiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7E110E1F8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 11:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748517292; x=1780053292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hbL0S2IEk+q+AwNLVozQtO3i7tdmPJvr+qnF3g7ECdU=;
 b=lXvx9tiQIh62TF55uZLCdKotPRUM9ojRUbukR+D7j5fd/dXEtHPMdt3a
 qn+7qTY04REwGUDyFcQFArmLGKNWjlkVX3QtEBZwkJR3+8FXTtyR/NAGJ
 puIylYfCmNfAIhEyXTzqkJzkLbsv7cKqOu5SWjC2eI9CG/dUw8qRmddHY
 8rGwkCR5AJ5Xe4xWWCsOckd2yzoTaH4s0+LeSemPMelPEXIGYfJucDJoR
 sf8CgVvlR0LhFLTCUS4qNmd8WGVKz2qgGI1Fdp/oRv0wPO3tqp3UWsVSH
 ZUHN58FaGMmSWgRDdnu5jixw3Gd8vbafD+so7skVb4IpJIlaZDp8IiR9r A==;
X-CSE-ConnectionGUID: o8BKW7hIQuSHHpIlXPnlMw==
X-CSE-MsgGUID: meVpTNzZTzWZvLP8Ggh9ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68123108"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="68123108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:14:52 -0700
X-CSE-ConnectionGUID: W9gYz10mTKarErL6n7mjoA==
X-CSE-MsgGUID: nOUMC7r2QoSKbR7gymZLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="143510395"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:14:49 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH v4 02/11] PCI/ACPI: Per root port allow one Aux power limit
 request
Date: Thu, 29 May 2025 16:46:45 +0530
Message-Id: <20250529111654.3140766-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529111654.3140766-1-badal.nilawar@intel.com>
References: <20250529111654.3140766-1-badal.nilawar@intel.com>
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
index 87f30910a5f1..d33efba4ca94 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1451,6 +1451,7 @@ int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power,
 	union acpi_object *out_obj;
 	acpi_handle handle;
 	int result, ret = -EINVAL;
+	struct acpi_device *adev;
 
 	if (!dev || !retry_interval)
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

