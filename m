Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8533BD66B9D
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 00:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337D310E106;
	Wed, 27 Nov 2024 00:37:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE5F10E210;
 Wed, 27 Nov 2024 00:37:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixes_for_MI=5FREPORT=5FP?=
 =?utf-8?q?ERF=5FCOUNT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 00:37:38 -0000
Message-ID: <173266785870.3541275.11732617739697920847@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
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

Series: Fixes for MI_REPORT_PERF_COUNT
URL   : https://patchwork.freedesktop.org/series/141811/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a6a4b00a751e0371ed02cfa9aa50a13ec4cb19e
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Tue Nov 26 16:31:27 2024 -0800

    xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
    
    To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
    Setting this bit cause the context image size to change and if not done
    correct, can cause undesired hangs.
    
    Current code uses a separate exec_queue to modify this bit and is
    error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
    the target hardware context to modify the relevant bit.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 739a2506c44a0be22cc842d2c625a05ed21c1198 drm-intel
088c6981f81e xe: Allow a GGTT mapped batch to be submitted to user exec queue
1a6a4b00a751 xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
-:146: ERROR:CODE_INDENT: code indent should use tabs where possible
#146: FILE: drivers/gpu/drm/xe/xe_oa.c:836:
+       ^I};$

-:146: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#146: FILE: drivers/gpu/drm/xe/xe_oa.c:836:
+       ^I};$

-:146: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#146: FILE: drivers/gpu/drm/xe/xe_oa.c:836:
+       ^I};$

total: 1 errors, 2 warnings, 0 checks, 133 lines checked


