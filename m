Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95EC606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 23:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933B610F26B;
	Mon, 23 Nov 2026 23:41:57 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7473F10E4B4;
 Mon, 23 Nov 2026 23:41:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ras=3A_core_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 23:41:56 -0000
Message-ID: <179547731646.72772.13336248578756643067@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123233326.2882114-5-rodrigo.vivi@intel.com>
In-Reply-To: <20261123233326.2882114-5-rodrigo.vivi@intel.com>
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

Series: drm/ras: core fixes
URL   : https://patchwork.freedesktop.org/series/179415/
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
commit e4c090671b17993a890967ca1bb89076c78d8958
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Nov 23 18:33:29 2026 -0500

    drm/ras: Keep nodes alive while netlink operations use them
    
    The netlink handlers look nodes up without holding anything, so
    drm_ras_node_unregister() can return while a handler is still using the
    node, and the driver then frees it.
    
    Reference count the nodes: the xarray holds one reference, each lookup
    takes another until it goes out of scope, and unregister drops the
    xarray one and waits for the others. List-nodes only reads the nodes,
    so it holds xa_lock instead.
    
    drm_ras_nl_error_event() gets the node from the driver, so the driver
    must stop reporting events on a node before unregistering it. Document
    that.
    
    Fixes: c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over generic netlink")
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 6e071be9c703c9e81f5be2d2601dfa5754d446e2 drm-intel
c3ff3351d2c1 drm/ras: Initialize ret in the list-nodes dump
0d05ff68fea4 drm/ras: Do not fail an error-counter dump on a skipped last ID
e4c090671b17 drm/ras: Keep nodes alive while netlink operations use them
-:48: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#48: FILE: drivers/gpu/drm/drm_ras.c:121:
+DEFINE_FREE(drm_ras_node_put, struct drm_ras_node *, if (_T) drm_ras_node_put(_T))
[...]
+static struct drm_ras_node *drm_ras_node_get(u32 id)

total: 0 errors, 1 warnings, 0 checks, 172 lines checked


