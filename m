Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F14D59D8E
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 22:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4655510E17A;
	Fri, 12 Dec 2025 22:37:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136310E17A;
 Fri, 12 Dec 2025 22:37:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_performance_when_page?=
 =?utf-8?q?faults_and_3d/display_share_resources_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 22:37:26 -0000
Message-ID: <176557904638.82816.16116646450992795560@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212182847.1683222-1-matthew.brost@intel.com>
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
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

Series: Fix performance when pagefaults and 3d/display share resources (rev2)
URL   : https://patchwork.freedesktop.org/series/158833/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 14faf1fcddbb4e3727dabe0e69db1e556ef4e256
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Dec 12 10:28:47 2025 -0800

    drm/xe: Add more GT stats around pagefault mode switch flows
    
    Add GT stats to measure the time spent switching between pagefault mode
    and dma-fence mode. Also add a GT stat to indicate when pagefault
    suspend is skipped because the system is idle. These metrics will help
    profile pagefault workloads while 3D and display are enabled.
    
    v2:
     - Use GT stats helper functions (Francois)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 54801dbae9da83dcad253f7fbe0e09864bfc028f drm-intel
29407e0d3416 drm/xe: Adjust long-running workload timeslices to reasonable values
82d936acadbb drm/xe: Use usleep_range for accurate long-running workload timeslicing
6d7a37623b4d drm/xe: Add debugfs knobs to control long running workload timeslicing
1bff613f0a2a drm/xe: Skip exec queue schedule toggle if queue is idle during suspend
-:123: ERROR:BRACKET_SPACE: space prohibited before open square bracket '['
#123: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1958:
+	u32 action [] = {

total: 1 errors, 0 warnings, 0 checks, 132 lines checked
5c053558870d drm/xe: Wait on in-syncs when swicthing to dma-fence mode
-:109: CHECK:LINE_SPACING: Please don't use multiple blank lines
#109: FILE: drivers/gpu/drm/xe/xe_hw_engine_group.c:219:
+
+

-:172: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#172: FILE: drivers/gpu/drm/xe/xe_hw_engine_group.c:340:
+						if (err)

-:236: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#236: FILE: drivers/gpu/drm/xe/xe_sync.c:255:
+{
+

total: 0 errors, 1 warnings, 2 checks, 199 lines checked
5b9ba0a64bd3 drm/xe: Add GT stats ktime helpers
14faf1fcddbb drm/xe: Add more GT stats around pagefault mode switch flows


