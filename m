Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7B5C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 23:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A5113728;
	Tue, 30 Jan 2024 23:29:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6819D113728;
 Tue, 30 Jan 2024 23:29:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Convert_kernel_?=
 =?utf-8?q?job_timeout_from_assert_to_warning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Tue, 30 Jan 2024 23:29:28 -0000
Message-ID: <170665736843.824492.8032953954796349833@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130180452.1416603-2-matthew.d.roper@intel.com>
In-Reply-To: <20240130180452.1416603-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Convert kernel job timeout from assert to warning
URL   : https://patchwork.freedesktop.org/series/129329/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0121da92ffbaab16a2d095089400e54780cb878a
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Jan 30 10:04:53 2024 -0800

    drm/xe: Convert kernel job timeout from assert to warning
    
    xe_assert() is intended to be used only for "impossible" situations that
    should never be hit (and if they are hit it means there's a driver bug
    somewhere); assertions are only compiled into debug builds.
    
    Although we expect jobs submitted by the kernel to be well-behaved and
    run without error, timeouts are a legitimate possibility for reasons
    beyond our control (bad firmware, flaky hardware, etc.).  We should use
    a real WARN if we encounter these, even for non-debug builds, to ensure
    the issue is being properly highlighted in bug reports and such.
    
    Also give the WARN a more human-readable message and move it below the
    general notice-level message that gets printed for any kind of timeout
    to make the errors a bit more understandable.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3d244fce99b65e012c4409d8a22bb9168c41f101 drm-intel
0121da92f drm/xe: Convert kernel job timeout from assert to warning


