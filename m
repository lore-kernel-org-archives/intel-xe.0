Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E183C36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 23:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3103610E796;
	Tue,  8 Apr 2025 23:34:02 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788A910E793;
 Tue,  8 Apr 2025 23:34:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fixes_for_VF_GuC_version_?=
 =?utf-8?q?and_guc=5Finfo_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 23:34:01 -0000
Message-ID: <174415524148.50469.244592436334363095@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
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

Series: Fixes for VF GuC version and guc_info debugfs
URL   : https://patchwork.freedesktop.org/series/147433/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c3969b4b584d8c7eacd011c021d806afed345b4a
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Apr 8 14:31:46 2025 -0700

    drm/xe/vf: Fix guc_info debugfs for VFs
    
    The guc_info debugfs attempta to read a bunch of registers that the VFs
    doesn't have access to, so fix it by skipping the reads.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch a49a4787e6bc70296204f4a6e1b0fed3759938cd drm-intel
dbef0e840c1c drm/xe/vf: use uc_fw_version to store the negotiated GuC ABI
f9180a15430d drm/xe/vf: Store the GuC FW info in guc->fw
c3969b4b584d drm/xe/vf: Fix guc_info debugfs for VFs


