Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ECBC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 09:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CE710E448;
	Thu,  8 Feb 2024 09:42:45 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CCF10E448;
 Thu,  8 Feb 2024 09:42:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Remove_sup?=
 =?utf-8?q?port_for_persistent_exec=5Fqueues_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 09:42:45 -0000
Message-ID: <170738536537.1106275.15860964609621108742@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208083845.4303-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240208083845.4303-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/uapi: Remove support for persistent exec_queues (rev2)
URL   : https://patchwork.freedesktop.org/series/129311/
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
commit 2c93575d2a80c0d4f8705a379bc86eaed4059039
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Feb 8 09:38:45 2024 +0100

    drm/xe/uapi: Remove support for persistent exec_queues
    
    Persistent exec_queues delays explicit destruction of exec_queues
    until they are done executing, but destruction on process exit
    is still immediate. It turns out no UMD is relying on this
    functionality, so remove it. If there turns out to be a use-case
    in the future, let's re-add.
    
    Persistent exec_queues were never used for LR VMs
    
    v2:
    - Don't add an "UNUSED" define for the missing property
      (Lucas, Rodrigo)
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch a942be9b4f39a05326a5fc3fd774fb143b4d9507 drm-intel
2c93575d2 drm/xe/uapi: Remove support for persistent exec_queues
-:21: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#21: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 194 lines checked


