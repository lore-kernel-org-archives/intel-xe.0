Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBE2C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F191410E414;
	Mon, 31 Mar 2025 14:30:03 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C3810E414;
 Mon, 31 Mar 2025 14:30:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DGFX_PCIe_Gen5_update_tel?=
 =?utf-8?q?emetry_and_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Mar 2025 14:30:02 -0000
Message-ID: <174343140240.20198.5544427697701180197@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250331142336.640226-1-raag.jadav@intel.com>
In-Reply-To: <20250331142336.640226-1-raag.jadav@intel.com>
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

Series: DGFX PCIe Gen5 update telemetry and usage
URL   : https://patchwork.freedesktop.org/series/147023/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b16df41edc0651fcd9ad170d600e5b7d0373b312
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Mon Mar 31 19:53:36 2025 +0530

    drm/xe/doc: Wire up PCIe Gen5 update limitations
    
    Append PCIe Gen5 update limitations to xe_firmware document.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 49797b335abb142725088c320346b3602248e793 drm-intel
6b3fb1998e13 drm/xe/debugfs: Expose PCIe Gen5 update telemetry
-:98: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#98: FILE: drivers/gpu/drm/xe/xe_debugfs.c:266:
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(DGFX_PCODE_STATUS,
+			    DGFX_GET_INIT_STATUS, 0), &val, NULL);

total: 0 errors, 0 warnings, 1 checks, 121 lines checked
b16df41edc06 drm/xe/doc: Wire up PCIe Gen5 update limitations


