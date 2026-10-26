Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27839606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 13:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA64C10E2F3;
	Mon, 26 Oct 2026 13:35:17 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392E10E2F3;
 Mon, 26 Oct 2026 13:35:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_xe=3A_select_confi?=
 =?utf-8?q?gfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Oct 2026 13:35:15 -0000
Message-ID: <179302171579.71285.10289586351488856116@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026102603.2045493-1-arnd@kernel.org>
In-Reply-To: <20261026102603.2045493-1-arnd@kernel.org>
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

Series: drm: xe: select configfs
URL   : https://patchwork.freedesktop.org/series/176848/
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
commit 4d9b53b9f77b047f7809bf9b3ef21c4eccefc8be
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Oct 26 11:25:50 2026 +0100

    drm: xe: select configfs
    
    The original addition of configfs to xe missed a compile-time dependency,
    which leads to a link failure when configfs is enabled as a loadable module:
    
    ld.lld-21: error: undefined symbol: xe_configfs_get_survivability_mode
    >>> referenced by xe_survivability_mode.c:224
    >>>               drivers/gpu/drm/xe/xe_survivability_mode.o:(xe_survivability_mode_is_requested) in archive vmlinux.a
    
    A recent workaround added a 'IS_REACHABLE()' check around the calls into
    configfs, which makes it link in this configuration, but this is generally
    a bad idea because it makes the actual behavior inconsistent and confusing
    to users that expect configfs to work if both xe and configfs are enabled.
    
    Use 'select CONFIGFS_FS' instead, like every other configfs user does,
    and remove the unnecessary stub functions. There is little practical
    difference here as anyone using XE graphics is likely to have a complex
    configuration that already selects configfs anyway, and the link error
    or the IS_REACHABLE() would only manifest during randconfig testing.
    
    Fixes: 30499cbd7961 ("drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m")
    Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 8e30a30c4948a9b30b9af31ebfaaa951630ae8a3 drm-intel
4d9b53b9f77b drm: xe: select configfs
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
which leads to a link failure when configfs is enabled as a loadable module:

total: 0 errors, 1 warnings, 0 checks, 48 lines checked


