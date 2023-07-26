Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDDCC001DE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 09:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ED910E440;
	Wed, 26 Jul 2023 09:26:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A07910E440;
 Wed, 26 Jul 2023 09:26:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 271B6AADE0;
 Wed, 26 Jul 2023 09:26:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 26 Jul 2023 09:26:31 -0000
Message-ID: <169036359115.23472.2491621437299555362@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726092348.212488-2-matthew.auld@intel.com>
In-Reply-To: <20230726092348.212488-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/engine=3A_add_missing_rpm_for_bind_engines_=28rev2=29?=
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

Series: drm/xe/engine: add missing rpm for bind engines (rev2)
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
commit 6d365ebdaa4a48f75f6c3ff16f644d12404fc62a
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Jul 26 10:23:49 2023 +0100

    drm/xe/engine: add missing rpm for bind engines
    
    Bind engines need to use the migration vm, however we don't have any rpm
    for such a vm, otherwise the kernel would prevent rpm suspend-resume.
    There are two issues here, first is the actual engine create which needs
    to touch the lrc, but since that is in VRAM we trigger loads of missing
    mem_access asserts. The second issue is when destroying the actual
    engine, which requires GuC CT to deregister the context.
    
    v2 (Rodrigo):
      - Just use ENGINE_FLAG_VM as the indicator that we need to hold an rpm
        ref. This also handles the case in xe_vm_create() where we create
        default bind engines.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/504
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 3eb59fdaff17b28970c5be4fd00dba25b3ffb3f1 drm-intel
6d365ebda drm/xe/engine: add missing rpm for bind engines


