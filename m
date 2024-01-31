Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D0C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 09:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E27113AD9;
	Wed, 31 Jan 2024 09:19:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B78113AC1;
 Wed, 31 Jan 2024 09:19:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vm=3A_Subclass_use?=
 =?utf-8?q?rptr_vmas_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 31 Jan 2024 09:19:32 -0000
Message-ID: <170669277274.860255.4579676525434156159@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131091628.12318-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240131091628.12318-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/vm: Subclass userptr vmas (rev2)
URL   : https://patchwork.freedesktop.org/series/129324/
State : warning

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
commit 9ca3a33aebf7368509b22ff0c65cc7a8e9192204
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jan 31 10:16:28 2024 +0100

    drm/xe/vm: Subclass userptr vmas
    
    The construct allocating only parts of the vma structure when
    the userptr part is not needed is very fragile. A developer could
    add additional fields below the userptr part, and the code could
    easily attempt to access the userptr part even if its not persent.
    
    So introduce xe_userptr_vma which subclasses struct xe_vma the
    proper way, and accordingly modify a couple of interfaces.
    This should also help if adding userptr helpers to drm_gpuvm.
    
    v2:
    - Fix documentation of to_userptr_vma() (Matthew Brost)
    - Fix allocation and freeing of vmas to clearer distinguish
      between the types.
    
    Closes: https://lore.kernel.org/intel-xe/0c4cc1a7-f409-4597-b110-81f9e45d1ffe@embeddedor.com/T/#u
    Fixes: a4cc60a55fd9 ("drm/xe: Only alloc userptr part of xe_vma for userptrs")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3d244fce99b65e012c4409d8a22bb9168c41f101 drm-intel
9ca3a33ae drm/xe/vm: Subclass userptr vmas
-:24: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a4cc60a55fd9', maybe rebased or not pulled?
#24: 
Fixes: a4cc60a55fd9 ("drm/xe: Only alloc userptr part of xe_vma for userptrs")

total: 0 errors, 1 warnings, 0 checks, 547 lines checked


