Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89410C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5F310E805;
	Tue,  5 Mar 2024 05:35:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D7D10E805;
 Tue,  5 Mar 2024 05:35:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe=3A_Make_devcoredump_VM_error_state_print_consistent_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 05:35:54 -0000
Message-ID: <170961695493.503981.5327815457633963062@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304140514.24768-1-jose.souza@intel.com>
In-Reply-To: <20240304140514.24768-1-jose.souza@intel.com>
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

Series: series starting with [1/4] drm/xe: Make devcoredump VM error state print consistent (rev2)
URL   : https://patchwork.freedesktop.org/series/130668/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9792e79ae788d7b5c911ea1b4104086e8892061d
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Mon Mar 4 06:05:14 2024 -0800

    drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
    
    This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch e90b5046fce6ed727427eec0d52e4f9626609ed0 drm-intel
4071578ffbff drm/xe: Make devcoredump VM error state print consistent
d83020d97045 drm/xe/devcoredump: Print errno if VM snapshot was not captured
f7b743a3ce3a drm/xe/devcoredump: Lock snap_mutex earlier
9792e79ae788 drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


