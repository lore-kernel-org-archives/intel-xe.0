Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7004CF3963
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6B910E741;
	Thu, 19 Sep 2024 17:50:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881B10E741;
 Thu, 19 Sep 2024 17:49:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Add_functions_to_sa?=
 =?utf-8?q?ve_and_restore_VF_configuration_blob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Sep 2024 17:49:59 -0000
Message-ID: <172676819922.1047703.5836636804928394073@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

Series: PF: Add functions to save and restore VF configuration blob
URL   : https://patchwork.freedesktop.org/series/138876/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a4ef9a7169044765c3dab137da002a875f06f27
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Sep 19 19:15:28 2024 +0200

    drm/xe/pf: Allow to save and restore VF config blob from debugfs
    
    For feature enabling and testing purposes, allow to capture and
    replace full VF configuration using debugfs blob file, but only
    under strict debug config.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 8fdbcd0d647cfca8f49da0c8cedb4053de87ec12 drm-intel
f343b548de53 drm/xe/guc: Add yet another helper macro for threshold
e866c1793816 drm/xe/pf: Update success code of pf_validate_vf_config()
660c20da7f81 drm/xe/pf: Allow to encode subset of VF configuration KLVs
896339b499f6 drm/xe/pf: Add functions to save and restore VF configuration blob
-:100: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'TAG' - possible side-effects?
#100: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2142:
+#define define_threshold_key_to_provision_case(TAG, ...)				\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
+		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
+			return -EBADMSG;						\
+		return pf_provision_threshold(gt, vfid,					\
+					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
+					      value[0]);

-:100: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#100: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2142:
+#define define_threshold_key_to_provision_case(TAG, ...)				\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
+		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
+			return -EBADMSG;						\
+		return pf_provision_threshold(gt, vfid,					\
+					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
+					      value[0]);

-:100: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#100: FILE: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2142:
+#define define_threshold_key_to_provision_case(TAG, ...)				\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
+		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
+		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
+			return -EBADMSG;						\
+		return pf_provision_threshold(gt, vfid,					\
+					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
+					      value[0]);

total: 0 errors, 2 warnings, 1 checks, 192 lines checked
5a4ef9a71690 drm/xe/pf: Allow to save and restore VF config blob from debugfs


