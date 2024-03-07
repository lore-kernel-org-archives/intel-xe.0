Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D32C54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 13:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C815910F145;
	Thu,  7 Mar 2024 13:58:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177B110F145;
 Thu,  7 Mar 2024 13:58:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/xe=3A_Make_devcoredump_VM_error_state_print_consis?=
 =?utf-8?q?tent?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 13:58:22 -0000
Message-ID: <170981990209.580282.6943782517659928500@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307135229.41973-1-jose.souza@intel.com>
In-Reply-To: <20240307135229.41973-1-jose.souza@intel.com>
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

Series: series starting with [v2,1/3] drm/xe: Make devcoredump VM error state print consistent
URL   : https://patchwork.freedesktop.org/series/130866/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a3139e4bb2658b8c957b8ff1ccb77c14895af103
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Mar 7 05:52:29 2024 -0800

    drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
    
    This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 52039ea425493b1ee6e3362f46f6d0b179d380b5 drm-intel
0f9c46d8eba0 drm/xe: Make devcoredump VM error state print consistent
37bd00e90e7f drm/xe/devcoredump: Print errno if VM snapshot was not captured
a3139e4bb265 drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
This is a left over of commit f1a9abc0cf31 ("drm/xe/uapi: Remove support for persistent exec_queues").

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


