Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9575C41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 17:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5813E10E082;
	Tue, 19 Dec 2023 17:47:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF92010E082;
 Tue, 19 Dec 2023 17:47:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AD0C5AA915;
 Tue, 19 Dec 2023 17:47:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_more_Gu?=
 =?utf-8?q?C_CT_states?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 19 Dec 2023 17:47:16 -0000
Message-ID: <170300803670.17581.13592392969995287974@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231219172824.832873-1-matthew.brost@intel.com>
In-Reply-To: <20231219172824.832873-1-matthew.brost@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc: Add more GuC CT states
URL   : https://patchwork.freedesktop.org/series/127982/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c030aa07e278112953ac7faddd26b245bc513928
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 19 09:28:24 2023 -0800

    drm/xe/guc: Add more GuC CT states
    
    The Guc CT has more than enabled / disables states rather it has 4. The
    4 states are not initialized, disabled, drop messages, and enabled.
    Change the code to reflect this. These states will enable proper return
    codes from functions and therefore enable proper error messages.
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a16a6c075a3d400fa8d0e51d22bb77c211048f44 drm-intel
c030aa07e drm/xe/guc: Add more GuC CT states
-:202: WARNING:TYPO_SPELLING: 'recieved' may be misspelled - perhaps 'received'?
#202: FILE: drivers/gpu/drm/xe/xe_guc_ct_types.h:80:
+ * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
                                                          ^^^^^^^^

-:221: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#221: FILE: drivers/gpu/drm/xe/xe_guc_ct_types.h:114:
+	enum xe_guc_ct_state state;;

total: 0 errors, 2 warnings, 0 checks, 181 lines checked


