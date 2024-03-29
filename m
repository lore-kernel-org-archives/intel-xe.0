Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A3FCD1284
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 02:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2110E283;
	Fri, 29 Mar 2024 02:59:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A2210E283;
 Fri, 29 Mar 2024 02:59:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Update_GuC_ABI_definition?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 02:59:09 -0000
Message-ID: <171168114947.1064930.7860751215343312101@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240328183147.495-1-michal.wajdeczko@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Update GuC ABI definitions
URL   : https://patchwork.freedesktop.org/series/131786/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a97d617b9f0f216c4a5426598c0d3789753fb810
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Mar 28 19:31:47 2024 +0100

    drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
    
    VF drivers can't access GMD_ID register over MMIO.
    The value of the GMD_ID register must be queried from GuC.
    It is available as GLOBAL_CFG_GMD_ID KLV.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 98f893b726e1ba5db2680da3f9f53ab2af9780be drm-intel
040fa7d07d51 drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
-:67: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#67: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:263:
+#define PF2GUC_UPDATE_VF_CFG_REQUEST_MSG_1_VFID		GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 61 lines checked
bacd37b65954 drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
-:60: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#60: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:256:
+#define PF2GUC_UPDATE_VGT_POLICY_REQUEST_MSG_1_CFG_ADDR_LO	GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 53 lines checked
0de43310f7a9 drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
-:48: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_EVENT_MSG_n_DATAn>
#48: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:201:
+#define GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID		GUC_HXG_EVENT_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
a9e2b0d1b7d2 drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
f66062100274 drm/xe/guc: Add VF2GUC_VF_RESET to ABI
4c15f431fc5c drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
-:72: CHECK:CAMELCASE: Avoid CamelCase: <GUC_HXG_REQUEST_MSG_n_DATAn>
#72: FILE: drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h:553:
+#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32	GUC_HXG_REQUEST_MSG_n_DATAn

total: 0 errors, 0 warnings, 1 checks, 60 lines checked
a97d617b9f0f drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition


