Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F8FC0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2493610E88E;
	Thu, 23 Jan 2025 18:08:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A325B10E88E;
 Thu, 23 Jan 2025 18:08:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_GuC_log_dump_and_m?=
 =?utf-8?q?inor_fixes_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 18:08:35 -0000
Message-ID: <173765571566.3642529.6811561791905993310@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123180320.66198-1-jose.souza@intel.com>
In-Reply-To: <20250123180320.66198-1-jose.souza@intel.com>
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

Series: Enable GuC log dump and minor fixes in devcoredump
URL   : https://patchwork.freedesktop.org/series/143898/
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
commit 561428bf29244959255f4bb02d84341e1b018c82
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Jan 23 09:59:43 2025 -0800

    drm/xe: Drop duplicated information about GT tile in devcoredump
    
    The GT tile is already available but was added again in commit
    c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),
    so here deleting it.
    
    Here a devcoredump example with the duplicated information:
    
    **** Xe Device Coredump ****
    Reason: Timedout job - seqno=4294967170, lrc_seqno=4294967170, guc_id=13, flags=0x0
    kernel: 6.13.0-zeh-xe+
    module: xe
    Snapshot time: 1737573530.243521319
    Uptime: 2588.041930284
    Process: deqp-vk [8850]
    PCI ID: 0x64a0
    PCI revision: 0x04
    GT id: 0
            Tile: 0
            Type: main
            IP ver: 20.4.4
            CS reference clock: 19200000
    GT id: 1
            Tile: 0
            Type: media
            IP ver: 20.0.4
            CS reference clock: 19200000
    
    **** GT #0 ****
            Tile: 0
    
    **** GuC Log ****
    ....
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch c5111274c3116699622a6bb72b1c95a4478631ce drm-intel
163bc22564cc drm/xe: Fix and re-enable xe_print_blob_ascii85()
1c3ce42a1c96 drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump
561428bf2924 drm/xe: Drop duplicated information about GT tile in devcoredump
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


