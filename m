Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904AC27C4F
	for <intel-xe@archiver.kernel.org>; Sun, 30 Jun 2024 09:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A33210E16A;
	Sun, 30 Jun 2024 09:33:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B23010E16A;
 Sun, 30 Jun 2024 09:33:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_EU_stall_?=
 =?utf-8?q?sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 30 Jun 2024 09:33:21 -0000
Message-ID: <171974000156.409.6061256178251820828@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1719735354.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1719735354.git.harish.chegondi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/135559/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 135719bf7ac1aa41406f14d0ba6f7e3aac96c781
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Sun Jun 30 02:28:45 2024 -0700

    drm/xe/eustall: Add support for EU stall sampling
    
    A new hardware feature first introduced in PVC gives capability
    to periodically sample EU stall state and record counts for
    different stall reasons, on a per IP basis, aggregate across
    all EUs in a subslice and record the samples in a buffer in
    each subslice. Eventually, the aggregated data is written out
    to a buffer in the memory. This feature is also supported in
    XE2 architecture GPUs - LNL and BMG.
    
    Use an existing IOCTL DRM_IOCTL_XE_PERF as interface into the
    driver from the user space to do initial setup and obtain
    a file descriptor for the EU stall counter data stream.
    Input parameter to the IOCTL is a struct drm_xe_perf_param
    in which perf_type should be set to DRM_XE_PERF_TYPE_EU_STALL,
    perf_op should be DRM_XE_PERF_OP_STREAM_OPEN and param should
    point to a chain of drm_xe_ext_set_property structures in which
    each structure has a pair of property and value. The EU stall
    sampling input properties are defined in drm_xe_eu_stall_property_id
    enum.
    
    With the file descriptor obtained from DRM_IOCTL_XE_PERF,
    user space can enable and disable EU stall sampling with
    DRM_XE_PERF_IOCTL_ENABLE and DRM_XE_PERF_IOCTL_DISABLE IOCTLs.
    User space can also call poll() to check for availability of
    data. The data can be read with read(). EU stall data consists
    of header and data pairs. The header format is defined in
    struct drm_xe_eu_stall_data_header. If the user space doesn't
    read the EU stall data fast enough, it is possible that the
    EU stall data buffer can get filled up and if the hardware
    wants to write data, it simply drops data due to unavailable
    buffer space. In that case hardware sets a bit in a register.
    The driver sets a flag in the EU stall data header flags field
    to let the user space know that the hardware has dropped data.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
135719bf7ac1 drm/xe/eustall: Add support for EU stall sampling
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:54: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#54: 
new file mode 100644

-:356: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'write_ptr < read_ptr'
#356: FILE: drivers/gpu/drm/xe/xe_eustall_cntr.c:259:
+		if (unlikely((write_ptr < read_ptr) &&
+			     ((read_ptr & buf_size) == (write_ptr & buf_size)))) {

-:365: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'write_ptr != read_ptr'
#365: FILE: drivers/gpu/drm/xe/xe_eustall_cntr.c:268:
+		if ((write_ptr != read_ptr) && !min_data_present) {

-:440: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'write_ptr < read_ptr'
#440: FILE: drivers/gpu/drm/xe/xe_eustall_cntr.c:343:
+	if (unlikely((write_ptr < read_ptr) &&
+		     ((read_ptr & buf_size) == (write_ptr & buf_size)))) {

-:1095: WARNING:QUOTED_WHITESPACE_BEFORE_NEWLINE: unnecessary whitespace before a quoted newline
#1095: FILE: drivers/gpu/drm/xe/xe_eustall_cntr.c:998:
+		drm_dbg(&xe->drm, "Invalid GT for EU stall sampling \n");

-:1305: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1305: FILE: drivers/gpu/drm/xe/xe_trace.h:385:
+	    TP_STRUCT__entry(

-:1315: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1315: FILE: drivers/gpu/drm/xe/xe_trace.h:395:
+	    TP_fast_assign(

total: 0 errors, 2 warnings, 5 checks, 1326 lines checked


