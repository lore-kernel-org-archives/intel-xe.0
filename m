Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0CEC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 23:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE3510E0AA;
	Thu,  3 Apr 2025 23:39:32 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF12510E2EF;
 Thu,  3 Apr 2025 23:39:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_BMG_PCIe_Gen4_downspeed_a?=
 =?utf-8?q?ttributes_and_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 23:39:31 -0000
Message-ID: <174372357177.36354.8053284014584693370@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403174742.1294227-1-raag.jadav@intel.com>
In-Reply-To: <20250403174742.1294227-1-raag.jadav@intel.com>
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

Series: BMG PCIe Gen4 downspeed attributes and usage
URL   : https://patchwork.freedesktop.org/series/147231/
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
commit 9747dd50df954101bdc984f6fdcfc8c835ec417b
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Apr 3 23:17:42 2025 +0530

    drm/xe/doc: Wire up PCIe Gen5 update limitations
    
    Append PCIe Gen5 update limitations to xe_firmware document.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
53105134a198 drm/xe: Move xe_device_sysfs_init() to xe_pci_probe()
bfaaec1dc8c8 drm/xe: Expose PCIe Gen4 downspeed attributes
-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:130:
+	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
+			    DGFX_GET_INIT_STATUS, 0), &val, NULL);

total: 0 errors, 0 warnings, 1 checks, 126 lines checked
9747dd50df95 drm/xe/doc: Wire up PCIe Gen5 update limitations


