Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE84606A330
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E510E034;
	Fri, 13 Nov 2026 12:07:13 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE51710E034;
 Fri, 13 Nov 2026 12:07:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_KUnit_tests_for_CPER_?=
 =?utf-8?q?GUID_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Nov 2026 12:07:11 -0000
Message-ID: <179457163190.19601.1074453307485279881@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
In-Reply-To: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
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

Series: Add KUnit tests for CPER GUID mappings
URL   : https://patchwork.freedesktop.org/series/178476/
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
commit 08f784674a8c2db2bb24be10005fa655438a8686
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Fri Nov 13 17:28:32 2026 +0530

    drm/xe/cper: Add PCI ID to GUID mapping verification in KUnit
    
    Add expected UUIDv5 mappings to verify each PCI ID maps to its
    correct GUID.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch d41695c479e8bb24eb941e5ba916e42784af6f4d drm-intel
aeb54df33bd6 drm/xe/cper: Add KUnit tests for CPER GUID mappings
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 90 lines checked
54ff6b9f4a3a drm/xe/cper: Add KUnit tests for GUID uniqueness
69f7ceef6a0a drm/xe/cper: Validate platform GUIDs in KUnit tests
08f784674a8c drm/xe/cper: Add PCI ID to GUID mapping verification in KUnit


