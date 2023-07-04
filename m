Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B921FEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 14:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AAF10E139;
	Tue,  4 Jul 2023 14:44:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F40B10E139;
 Tue,  4 Jul 2023 14:44:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1B1C8AADE1;
 Tue,  4 Jul 2023 14:44:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 04 Jul 2023 14:44:13 -0000
Message-ID: <168848185310.28591.5358173597568368973@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230704142440.58130-1-jose.souza@intel.com>
In-Reply-To: <20230704142440.58130-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Make_explicit_that_exec_uAPI_expects_canonical_addresse?=
 =?utf-8?q?s_=28rev2=29?=
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

Series: drm/xe: Make explicit that exec uAPI expects canonical addresses (rev2)
URL   : https://patchwork.freedesktop.org/series/120143/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78fd216d109d74e8e549b709ff04d4cae1074819
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Jul 4 07:24:40 2023 -0700

    drm/xe: Make explicit that exec uAPI expects canonical addresses
    
    The batch buffer address in exec uAPI is used when emitting
    MI_BATCH_BUFFER_START that expect canonical addresses in future
    platforms, for current ones the bits above 57 for PVC and 47 for
    other platforms are ignored.
    
    So the safest approach is to require canonical address for all
    platforms supported by Xe to avoid uAPI breaks.
    
    v2:
    - fix check for non parallel engines
    
    BSpec: 60223 59475 45718
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch cd26cb9c94f4f04586f04fca4e94181c53854c46 drm-intel
78fd216d1 drm/xe: Make explicit that exec uAPI expects canonical addresses
-:38: WARNING:LINE_SPACING: Missing a blank line after declarations
#38: FILE: drivers/gpu/drm/xe/xe_device.c:444:
+	const int high_address_bit = xe->info.dma_mask_size > 47 ? 57 : 47;
+	return sign_extend64(address, high_address_bit);

-:64: WARNING:LINE_SPACING: Missing a blank line after declarations
#64: FILE: drivers/gpu/drm/xe/xe_exec.c:235:
+			const u64 canonical_addr = xe_device_canonical_addr(xe, addresses[i]);
+			if (XE_IOCTL_ERR(xe, addresses[i] != canonical_addr)) {

-:71: WARNING:LINE_SPACING: Missing a blank line after declarations
#71: FILE: drivers/gpu/drm/xe/xe_exec.c:242:
+		const u64 canonical_addr = xe_device_canonical_addr(xe, args->address);
+		if (XE_IOCTL_ERR(xe, args->address != canonical_addr)) {

total: 0 errors, 3 warnings, 0 checks, 47 lines checked


