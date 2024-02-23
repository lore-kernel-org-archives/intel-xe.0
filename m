Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E955BC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 00:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9811D10EACD;
	Fri, 23 Feb 2024 00:14:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC0D10EABB;
 Fri, 23 Feb 2024 00:14:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Remove_unu?=
 =?utf-8?q?sed_flags_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 00:14:50 -0000
Message-ID: <170864729070.235433.6880476198473422813@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222232356.175431-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240222232356.175431-1-rodrigo.vivi@intel.com>
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

Series: drm/xe/uapi: Remove unused flags (rev4)
URL   : https://patchwork.freedesktop.org/series/129781/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c81b394de0d76089b5d024760f9d5cabd57f5bc1
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Feb 22 18:23:56 2024 -0500

    drm/xe/uapi: Remove unused flags
    
    Those cases missed in previous uAPI cleanups were mostly accidentally
    brought in from i915 or created to exercise the possibilities of gpuvm
    but they are not used by userspace yet, so let's remove them. They can
    still be brought back later if needed.
    
    v2:
    - Fix XE_VM_FLAG_FAULT_MODE support in xe_lrc.c (Brian Welty)
    - Leave DRM_XE_VM_BIND_OP_UNMAP_ALL (José Roberto de Souza)
    - Ensure invalid flag values are rejected (Rodrigo Vivi)
    
    v3: Rebase after removal of persistent exec_queues (Francois Dugast)
    
    v4: Rodrigo: Rebase after the new dumpable flag.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 5e139b8dd8049fee9f42fe76c603b5cfc286af7f drm-intel
c81b394de0d7 drm/xe/uapi: Remove unused flags


