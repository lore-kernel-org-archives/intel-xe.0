Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82913C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8710E10F;
	Tue, 25 Jul 2023 11:04:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 870E710E3CB;
 Tue, 25 Jul 2023 11:04:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 840C4AADDA;
 Tue, 25 Jul 2023 11:04:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 25 Jul 2023 11:04:43 -0000
Message-ID: <169028308353.27668.6004002512874836439@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230725110116.114688-2-matthew.auld@intel.com>
In-Reply-To: <20230725110116.114688-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/engine=3A_add_missing_rpm_for_bind_engines?=
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

Series: drm/xe/engine: add missing rpm for bind engines
URL   : https://patchwork.freedesktop.org/series/121305/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25e325532c6a3dc169ceb499a17ae4537a769b36
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Tue Jul 25 12:01:17 2023 +0100

    drm/xe/engine: add missing rpm for bind engines
    
    Bind engines need to use the migration vm, however we don't have any rpm
    for such a vm, otherwise the kernel would prevent rpm suspend-resume.
    There are two issues here, first is the actual engine create which needs
    to touch the lrc, but since that is in VRAM we trigger loads of missing
    mem_access asserts. The second issue is when destroying the actual
    engine, which requires GuC CT to deregister the context.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 9698525fb32efb5a5a439bc34b4735e0fdfafdae drm-intel
25e325532 drm/xe/engine: add missing rpm for bind engines


