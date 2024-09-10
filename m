Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCEBECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 06:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A5D10E6DB;
	Tue, 10 Sep 2024 06:33:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B1B10E6DB;
 Tue, 10 Sep 2024 06:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_EU_stall_?=
 =?utf-8?q?sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 06:33:35 -0000
Message-ID: <172595001588.979268.16273900484443638401@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725866097.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1725866097.git.harish.chegondi@intel.com>
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

Series: Add support for EU stall sampling
URL   : https://patchwork.freedesktop.org/series/138389/
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
commit 56119e9fbd1fb7b6c1703e7ce7516944f25f6ac2
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Mon Sep 9 00:36:40 2024 -0700

    drm/xe/eustall: Add support for EU stall sampling
    
    A new hardware feature first introduced in PVC gives capability to
    periodically sample EU stall state and record counts for different stall
    reasons, on a per IP basis, aggregate across all EUs in a subslice and
    record the samples in a buffer in each subslice. Eventually, the aggregated
    data is written out to a buffer in the memory. This feature is also
    supported in XE2 architecture GPUs - LNL and BMG.
    
    Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
    from the user space to do initial setup and obtain a file descriptor for
    the EU stall counter data stream.  Input parameter to the IOCTL is a struct
    drm_xe_observation_param in which observation_type should be set to
    DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
    DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
    drm_xe_ext_set_property structures in which each structure has a pair of
    property and value. The EU stall sampling input properties are defined in
    drm_xe_eu_stall_property_id enum.
    
    With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
    can enable and disable EU stall sampling with the IOCTLs:
    DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
    User space can find the EU stall data record size with the IOCTL
    DRM_XE_OBSERVATION_IOCTL_INFO through struct drm_xe_eu_stall_stream_info
    parameter. User space can also call poll() to check for availability of
    data. The data can be read with read(). If the user space doesn't read
    the EU stall data fast enough, it is possible that the EU stall data buffer
    can get filled up and if the hardware wants to write more data, it
    simply drops data due to unavailable buffer space. In that case hardware
    sets a bit in a register. The driver read() returns -EIO error to let
    the user space know that the hardware has dropped data. A subsequent
    read by the user space returns the remaining EU stall data.
    
    v3: a. Removed data header.
        b. Changed read() to return -EIO when data is dropped by the HW.
        c. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query data record info
        d. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
           to xe_drm.h. These declarations would help user space to parse the
           EU stall data
        e. Addressed other review comments from v2
    v2: Rename xe perf layer as xe observation layer (Ashutosh)
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch bab1666fc2379a31ac48e7d61683d3edeaf29244 drm-intel
56119e9fbd1f drm/xe/eustall: Add support for EU stall sampling
-:40: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#40: 
    d. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2

-:62: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#62: 
new file mode 100644

-:131: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#131: FILE: drivers/gpu/drm/xe/xe_eustall_cntr.c:26:
+extern u32 xe_observation_paranoid;

-:359: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'write_ptr != read_ptr'
#359: FILE: drivers/gpu/drm/xe/xe_eustall_cntr.c:254:
+		if ((write_ptr != read_ptr) && !min_data_present) {

-:1306: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1306: FILE: drivers/gpu/drm/xe/xe_trace.h:432:
+	    TP_STRUCT__entry(

-:1316: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1316: FILE: drivers/gpu/drm/xe/xe_trace.h:442:
+	    TP_fast_assign(

total: 0 errors, 3 warnings, 3 checks, 1376 lines checked


