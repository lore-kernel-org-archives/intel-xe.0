Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7763E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 19:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9331410E77C;
	Tue,  7 Jan 2025 19:13:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E95910E77C;
 Tue,  7 Jan 2025 19:13:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Fix_GuC_log?=
 =?utf-8?q?/ct_output_via_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 19:13:52 -0000
Message-ID: <173627723244.1001743.6546492729280161343@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107181017.2639339-1-julia.filipchuk@intel.com>
In-Reply-To: <20250107181017.2639339-1-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Fix GuC log/ct output via debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/142982/
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
commit db38ea3f6dd988b8b36771e483886a20b57a9ec0
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Tue Jan 7 10:10:17 2025 -0800

    drm/xe/guc: Fix GuC log/ct output via debugfs
    
    Change to disable asci85 GuC logging only when output to devcoredump (was temporarily
    disabled for all code paths).
    
    v2: Ignore only for devcoredump case (not dmsg output). (feedback by Lucas)
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch dfcd517d1169ab05be63134ba5cbc7bfaf030eb1 drm-intel
db38ea3f6dd9 drm/xe/guc: Fix GuC log/ct output via debugfs
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Change to disable asci85 GuC logging only when output to devcoredump (was temporarily

total: 0 errors, 1 warnings, 0 checks, 29 lines checked


