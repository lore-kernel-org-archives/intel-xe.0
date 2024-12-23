Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047A7E7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 13:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937A10E315;
	Mon, 23 Dec 2024 13:49:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29E010E0B1;
 Mon, 23 Dec 2024 13:49:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tracing=3A_Fix_a_p?=
 =?utf-8?q?otential_TP=5Fprintk_UAF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Dec 2024 13:49:02 -0000
Message-ID: <173496174298.2104685.14968102895555169592@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241223134250.14345-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241223134250.14345-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/tracing: Fix a potential TP_printk UAF
URL   : https://patchwork.freedesktop.org/series/142919/
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
commit 33a1f06ba214b9aa206d3eefd1fb67ff7b34747e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Dec 23 14:42:50 2024 +0100

    drm/xe/tracing: Fix a potential TP_printk UAF
    
    The commit
    afd2627f727b ("tracing: Check "%s" dereference via the field and not the TP_printk format")
    exposes potential UAFs in the xe_bo_move trace event.
    
    Fix those by avoiding dereferencing the
    xe_mem_type_to_name[] array at TP_printk time.
    
    Since some code refactoring has taken place, explicit backporting may
    be needed for kernels older than 6.10.
    
    Fixes: e46d3f813abd ("drm/xe/trace: Extract bo, vm, vma traces")
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Cc: <stable@vger.kernel.org> # v6.11+
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 57cbd7d762d4dccb8784836a6a12bbb4122c1695 drm-intel
33a1f06ba214 drm/xe/tracing: Fix a potential TP_printk UAF
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
afd2627f727b ("tracing: Check "%s" dereference via the field and not the TP_printk format")

total: 0 errors, 1 warnings, 0 checks, 29 lines checked


