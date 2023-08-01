Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF47EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 06:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93310E0D6;
	Tue,  1 Aug 2023 06:40:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2767610E0D6;
 Tue,  1 Aug 2023 06:40:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 23E30A00CC;
 Tue,  1 Aug 2023 06:40:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 01 Aug 2023 06:40:43 -0000
Message-ID: <169087204314.10128.7316506026433294747@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230801063750.7-1-francois.dugast@intel.com>
In-Reply-To: <20230801063750.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?name_engine_to_exec=5Fqueue_=28rev2=29?=
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

Series: Rename engine to exec_queue (rev2)
URL   : https://patchwork.freedesktop.org/series/121627/
State : warning

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
commit 3b9631a2c8c8f2109e7244f1a8fbf9c929137e8a
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Aug 1 06:37:50 2023 +0000

    drm/xe: Rename engine to exec_queue
    
    Engine was inappropriately used to refer to execution queues and it
    also created some confusion with hardware engines. Where it applies
    the exec_queue variable name is changed to q and comments are also
    updated.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/162
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch d74e8f8407bc922b04ba50e8f4e888bedb31330a drm-intel
3b9631a2c drm/xe: Rename engine to exec_queue
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:543: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#543: 
deleted file mode 100644

-:4163: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'q' may be better as '(q)' to avoid precedence issues
#4163: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:694:
+#define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
 	u32 action[] = {						\
 		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
+		q->guc->id,						\
 		GUC_CONTEXT_##enable_disable,				\
 	}

-:7486: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#7486: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)

-:7487: WARNING:LONG_LINE: line length of 146 exceeds 100 columns
#7487: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)

-:7488: WARNING:LONG_LINE: line length of 136 exceeds 100 columns
#7488: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)

-:7492: WARNING:LONG_LINE: line length of 146 exceeds 100 columns
#7492: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 5 warnings, 1 checks, 6240 lines checked


