Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C51C369B8
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 08:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4450E10E679;
	Tue, 15 Apr 2025 08:06:35 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5AC10E679;
 Tue, 15 Apr 2025 08:06:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Allow_to_inj?=
 =?utf-8?q?ect_VF_provisioning_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 08:06:33 -0000
Message-ID: <174470439383.4382.18402876611813702378@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250415075647.29295-1-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe/vf: Allow to inject VF provisioning errors
URL   : https://patchwork.freedesktop.org/series/147731/
State : warning

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
commit 9d978ff4b6bf0fbe4752723771eab07bb33de870
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Tue Apr 15 13:26:47 2025 +0530

    drm/xe/vf: Allow to inject VF provisioning errors
    
    In unlikely event, due to PF malfunction or misconfiguration, VF may
    receive incomplete or invalid configuration and it must be prepared
    to handle such cases without causing a crash.
    
    Since we believe that our PF implementation will not provide invalid VF
    config, reuse existing FUNCTION_ERROR_INJECTION framework to alter VF
    provisioning to verify driver reaction to unexpected or invalid
    configurations.
    
    However we can't use FUNCTION_ERROR_INJECTION directly on functions that
    query VF provisioning, as all detected error conditions will cause
    immediate abort. Instead define dummy functions, where we could inject
    error using FUNCTION_ERROR_INJECTION framework, and any errors from these
    functions will be used to adjust the received valid provisioning data into
    the invalid one.
    
    The following errors are recognized by these functions and to trigger
    specific provisioning misconfiguration.
    
    -ENODATA (-61)  : Force resource size to zero (unprovisioned)
    -EREMCHG (-78)  : Force resource size smaller than received (should be
                      harmless until driver detects inconsistency)
    -EINVAL  (-22)  : Force resource location invalid (like GGTT base
                      below WOPCM)
    -ENOSPC  (-28)  : Force resource size bigger than HW limit
    -EDQUOT  (-122) : Force resource size larger than received (will cause use
                      of unassigned part of the resource)
    -ESRMNT  (-69)  : Force resource size larger than received with invalid
                      base address. (Will cause use of unassigned part of the
                      resource).
    
    Fault can be injected with below steps (using GGTT resource and -ENODATA
    error as an example)
    
    $ FAILFUNC=xe_should_fail_ggtt_provisioning
    
    $ echo $FAILFUNC    > /sys/kernel/debug/fail_function/inject
    $ printf %#x -61    > /sys/kernel/debug/fail_function/$FAILFUNC/retval
    $ echo 100          > /sys/kernel/debug/fail_function/probability
    $ echo 0            > /sys/kernel/debug/fail_function/space
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 08045a4121ee058ead3c4483e6c217be20ab86d4 drm-intel
9d978ff4b6bf drm/xe/vf: Allow to inject VF provisioning errors
-:112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#112: 
new file mode 100644

-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'NAME' - possible side-effects?
#129: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c:13:
+#define DEFINE_FAIL_FUNC(NAME)  \
+	static noinline int NAME(void)  \
+	{                               \
+		return 0;               \
+	}                               \
+	ALLOW_ERROR_INJECTION(NAME, ERRNO)

-:129: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#129: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf_tweaks.c:13:
+#define DEFINE_FAIL_FUNC(NAME)  \
+	static noinline int NAME(void)  \
+	{                               \
+		return 0;               \
+	}                               \
+	ALLOW_ERROR_INJECTION(NAME, ERRNO)

total: 0 errors, 2 warnings, 1 checks, 296 lines checked


