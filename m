Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0395606A327
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752B10E8C0;
	Tue, 24 Nov 2026 20:40:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D71610E8C0;
 Tue, 24 Nov 2026 20:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Crescent_Island?=
 =?utf-8?q?_PMT_support_+_hwmon_use-after-free_debug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 20:40:57 -0000
Message-ID: <179555285717.80553.10431912895522597320@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124194656.3508212-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261124194656.3508212-2-rodrigo.vivi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Crescent Island PMT support + hwmon use-after-free debug
URL   : https://patchwork.freedesktop.org/series/179553/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4099dc6353f1be8b622b7c5babcdc2552d324c25
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Nov 24 14:46:54 2026 -0500

    drm/xe: Crescent Island PMT support + hwmon use-after-free debug
    
    DO NOT MERGE. CI only.
    
    Squash of "Crescent Island PMT support" v23 (19 patches) from
    Michael J. Ruhl:
    https://lore.kernel.org/all/20261124020752.30551-21-michael.j.ruhl@intel.com/
    
    plus debug output to find who frees struct xe_hwmon while xe is still
    bound on the SR-IOV PF BMG machines, where unbind crashes in
    xe_hwmon_unregister() on a 0x6b6b... (slab poison) pointer:
    
     - log the hwmon allocation and the unregister call with their pointers
     - devm action with dump_stack(), printed when devres frees the struct
     - kmem_dump_obj(xe->hwmon) before use in xe_hwmon_unregister(), which
       prints the alloc and free stacks of an already freed object
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch cb6f07e3276d07538caeb25e6282c0b828d949e6 drm-intel
4099dc6353f1 drm/xe: Crescent Island PMT support + hwmon use-after-free debug
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1235 lines checked


