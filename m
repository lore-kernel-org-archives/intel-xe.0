Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD65C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D6B10E364;
	Tue, 20 Aug 2024 20:36:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6E10E364;
 Tue, 20 Aug 2024 20:36:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Free_job_before?=
 =?utf-8?q?_xe=5Fexec=5Fqueue=5Fput?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 20:36:33 -0000
Message-ID: <172418619325.716489.7008983902851204188@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820202309.1260755-1-matthew.brost@intel.com>
In-Reply-To: <20240820202309.1260755-1-matthew.brost@intel.com>
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

Series: drm/xe: Free job before xe_exec_queue_put
URL   : https://patchwork.freedesktop.org/series/137535/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c144a68a56a07f3f8a56235d9a00a2f0ccaeb5ab
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Aug 20 13:23:09 2024 -0700

    drm/xe: Free job before xe_exec_queue_put
    
    Free job depends on job->vm being valid, the last xe_exec_queue_put can
    destroy the VM. Prevent UAF by freeing job before xe_exec_queue_put.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 50db4c0a8d28ec0d03ea120d17a914265fa47d5c drm-intel
c144a68a56a0 drm/xe: Free job before xe_exec_queue_put


