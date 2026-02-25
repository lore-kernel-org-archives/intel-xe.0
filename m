Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC6FFD45EF
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C35410E82A;
	Wed, 25 Feb 2026 20:26:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7466D10E82A;
 Wed, 25 Feb 2026 20:26:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_unsafe_GAM_?=
 =?utf-8?q?port_backend_for_TLB_inval_+_PF_ack_profiling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 20:26:06 -0000
Message-ID: <177205116646.288682.18045348145870113737@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225202029.2722574-1-matthew.brost@intel.com>
In-Reply-To: <20260225202029.2722574-1-matthew.brost@intel.com>
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

Series: drm/xe: Add unsafe GAM port backend for TLB inval + PF ack profiling
URL   : https://patchwork.freedesktop.org/series/162171/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1e20e7e7aba376c1ffd1c66462a103dfe590b7d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Feb 25 12:20:29 2026 -0800

    drm/xe: Add unsafe GAM port backend for TLB inval + PF ack profiling
    
    Wire up a new GAM port MMIO mailbox and a GAM-backed TLB
    invalidation/page fault ack path, selectable via the module_param_unsafe
    gam_tlb_inval_mode. GAM TLB invalidations can be disabled or issued
    immediately.
    
    This is intended for profiling/experimentation to compare GuC-mediated
    TLB invalidations and page fault responses against the direct GAM port
    path and measure the latency/throughput differences. Enabling this is
    unsafe (bypasses the normal firmware-mediated flow) and is therefore
    disabled by default and incompatible with SR-IOV / ctx TLB inval
    configurations.
    
    Bspec: 59311
    
    Assisted-by: Chat-GPT # Documentation
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 940d2c5064ed09bca924fd8aa017be99cc745b31 drm-intel
f1e20e7e7aba drm/xe: Add unsafe GAM port backend for TLB inval + PF ack profiling
-:21: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#21: 
Assisted-by: Chat-GPT # Documentation

-:21: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Chat-GPT # Documentation'
#21: 
Assisted-by: Chat-GPT # Documentation

-:105: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#105: 
new file mode 100644

total: 1 errors, 2 warnings, 0 checks, 835 lines checked


