Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050DDE7DF0F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 18:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FF910E55B;
	Mon,  2 Feb 2026 18:53:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69910E53F;
 Mon,  2 Feb 2026 18:53:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_replace_system=5Funbound?=
 =?utf-8?q?=5Fwq=2C_add_WQ=5FPERCPU_to_alloc=5Fworkqueue_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marco Crivellari" <marco.crivellari@suse.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 18:53:00 -0000
Message-ID: <177005838030.217507.10192863826272507865@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202103756.62138-1-marco.crivellari@suse.com>
In-Reply-To: <20260202103756.62138-1-marco.crivellari@suse.com>
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

Series: replace system_unbound_wq, add WQ_PERCPU to alloc_workqueue (rev3)
URL   : https://patchwork.freedesktop.org/series/156941/
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
commit b0f177338830ba210d3dc2a85d9190c0d401418b
Author: Marco Crivellari <marco.crivellari@suse.com>
Date:   Mon Feb 2 11:37:56 2026 +0100

    drm/xe: add WQ_PERCPU to alloc_workqueue users
    
    This continues the effort to refactor workqueue APIs, which began with
    the introduction of new workqueues and a new alloc_workqueue flag in:
    
       commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
       commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
    
    The refactoring is going to alter the default behavior of
    alloc_workqueue() to be unbound by default.
    
    With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
    any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
    must now use WQ_PERCPU. For more details see the Link tag below.
    
    In order to keep alloc_workqueue() behavior identical, explicitly request
    WQ_PERCPU.
    
    Link: https://lore.kernel.org/all/20250221112
    Suggested-by: Tejun Heo <tj@kernel.org>
    Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
+ /mt/dim checkpatch a68485eec77211a46da7bdb6a0f862e4b365f1e3 drm-intel
d391a4e602f6 drm/xe: replace use of system_unbound_wq with system_dfl_wq
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

total: 0 errors, 1 warnings, 0 checks, 56 lines checked
b0f177338830 drm/xe: add WQ_PERCPU to alloc_workqueue users
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

total: 0 errors, 1 warnings, 0 checks, 35 lines checked


