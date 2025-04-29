Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E5C3ABAA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 09:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76010E2EF;
	Tue, 29 Apr 2025 09:15:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663B110E3E2;
 Tue, 29 Apr 2025 09:15:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_firmware_late?=
 =?utf-8?q?_binding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 09:15:56 -0000
Message-ID: <174591815642.23602.7312384091233468777@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429073804.972137-1-badal.nilawar@intel.com>
In-Reply-To: <20250429073804.972137-1-badal.nilawar@intel.com>
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

Series: Introducing firmware late binding
URL   : https://patchwork.freedesktop.org/series/148394/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6e9db086377bd8a1d71b4f4505aca1a304b53bb7
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Apr 29 13:08:04 2025 +0530

    {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
    
    Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited
    access from user space (as admin) to some very specific PCODE
    Mailboxes only related to hardware configuration.
    
    PCODE is a Firmware in Intel GPUs which is the main responsible
    component for power and thermal aspects of the Intel GPUs.
    
    Each different Intel GPU came with different PCODE versions with
    different mailboxes and different needs. In the lack of an unified
    interface, the per platform sysfs entries at the device level is
    trending to grow, to allow admins to control different aspects of
    the Hardware.
    
    In this first experiment, xe_pcode_fwctl only adds support for the
    Battlemage late-binding firmware information.
    
    Late-binding is the name given to 2 other new auxiliary firmware
    blobs that for now lives in the Flash like PCODE, but that soon
    it is coming to linux-firmware.git: Fan-controller and
    Voltage-regulator. Then, PCODE provides some mailboxes where the
    status of both late-binding firmware can be queried as specified
    in the documentation that is added along with the new uAPI here.
    
    RFC IMPORTANT NOTE:
    
    ===================
    Admins will need to query this information. This code here aims
    to be used by Level0-Sysman and/or Intel XPU Manager directly
    from user space. But following the drm upstream rules, the
    userspace code will need to be ready before we can consider
    getting this patch merged!
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 2653f1a7089beef2da70293be1226983a979e918 drm-intel
5026d9d5292c mei: late_bind: add late binding component driver
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

-:45: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#45: FILE: drivers/misc/mei/late_bind/Kconfig:4:
+config INTEL_MEI_LATE_BIND
+	tristate "Intel late binding support on ME Interface"
+	select INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  MEI Support for Late Binding for Intel graphics card.
+
+	  Enables the ME FW interfaces for Late Binding for
+          Xe display driver of Intel.

-:217: WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'mei_late_bind_push_config', this function's name, in a string
#217: FILE: drivers/misc/mei/late_bind/mei_late_bind.c:143:
+	dev_dbg(dev, "mei_late_bind_push_config status = %d\n", ret);

-:261: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#261: FILE: drivers/misc/mei/late_bind/mei_late_bind.c:187:
+static int mei_late_bind_component_match(struct device *dev, int subcomponent,
+				   void *data)

-:291: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#291: FILE: drivers/misc/mei/late_bind/mei_late_bind.c:217:
+static int mei_late_bind_probe(struct mei_cl_device *cldev,
+			 const struct mei_cl_device_id *id)

total: 0 errors, 3 warnings, 2 checks, 351 lines checked
1a994e34ad99 mei: bus: add mei_cldev_mtu interface
6c54f28ef5ee drm/xe/late_bind_fw: Introducing late_bind_fw
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 260 lines checked
d8384911aaa8 drm/xe/xe_late_bind_fw: Initialize late binding firmware
3677fe5a2bb7 drm/xe/xe_late_bind_fw: Load late binding firmware
df915ff55caf drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
0833eb91225a drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
9e51e744487f drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late binding
6e9db086377b {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
-:98: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#98: 
new file mode 100644

-:192: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#192: FILE: drivers/gpu/drm/xe/xe_pcode_fwctl.c:90:
+DEFINE_FREE(xe_pcode_fwctl, struct xe_pcode_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
[...]
+static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)

total: 0 errors, 2 warnings, 0 checks, 353 lines checked


