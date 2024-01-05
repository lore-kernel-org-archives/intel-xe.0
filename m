Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F26C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 20:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6F710E69D;
	Fri,  5 Jan 2024 20:27:19 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F1910E695;
 Fri,  5 Jan 2024 20:27:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_unlock_on_error?=
 =?utf-8?q?_path_in_xe=5Fvm=5Fadd=5Fcompute=5Fexec=5Fqueue=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Date: Fri, 05 Jan 2024 20:27:18 -0000
Message-ID: <170448643855.40937.9374786079348199768@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
In-Reply-To: <fa88d289-9886-474d-b697-b69881b4ddbe@moroto.mountain>
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

Series: drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
URL   : https://patchwork.freedesktop.org/series/128270/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d829f58cf893ebf4958a96765cf1ac3edf07b211
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Fri Jan 5 15:20:22 2024 +0300

    drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
    
    Drop the "&vm->lock" before returning.
    
    Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
+ /mt/dim checkpatch 2f34bf674c7dad8d0cb6ae92d4e56805d63d0513 drm-intel
d829f58cf drm/xe: unlock on error path in xe_vm_add_compute_exec_queue()
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '24f947d58fe5', maybe rebased or not pulled?
#9: 
Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


