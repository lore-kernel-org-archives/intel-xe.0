Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A57C47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 13:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F8F10EED0;
	Mon, 22 Jan 2024 13:25:15 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6510EED0;
 Mon, 22 Jan 2024 13:25:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/exec=2C_drm/gpuvm=3A_?=
 =?utf-8?q?Prefer_u32_over_uint32=5Ft_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 22 Jan 2024 13:25:15 -0000
Message-ID: <170592991530.646721.13691205770155132065@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122131828.12444-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240122131828.12444-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/exec, drm/gpuvm: Prefer u32 over uint32_t (rev2)
URL   : https://patchwork.freedesktop.org/series/128973/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 56e4dd83872dd80e3e72724360022e20e7fad299
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Jan 22 14:18:28 2024 +0100

    drm/exec, drm/gpuvm: Prefer u32 over uint32_t
    
    The relatively recently introduced drm/exec utility was using uint32_t
    in its interface, which was then also carried over to drm/gpuvm.
    
    Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@redhat.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
    Reviewed-by: Danilo Krummrich <dakr@redhat.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch aa09aa0293f752644c8c5d040e4a7af4e463627f drm-intel
56e4dd838 drm/exec, drm/gpuvm: Prefer u32 over uint32_t
-:30: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#30: FILE: drivers/gpu/drm/drm_exec.c:79:
+void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)

-:52: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#52: FILE: include/drm/drm_exec.h:138:
+void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);

total: 0 errors, 2 warnings, 0 checks, 32 lines checked


