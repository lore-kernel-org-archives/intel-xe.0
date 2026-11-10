Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059F606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 00:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE53510F5E4;
	Tue, 10 Nov 2026 00:43:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60C810F5D9;
 Tue, 10 Nov 2026 00:43:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Define_GuC_firmware_for_C?=
 =?utf-8?q?RI_and_NVL-P?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Nov 2026 00:43:02 -0000
Message-ID: <179427138274.12.17481144535282043332@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261110003553.787861-6-daniele.ceraolospurio@intel.com>
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

Series: Define GuC firmware for CRI and NVL-P
URL   : https://patchwork.freedesktop.org/series/178136/
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
commit e66de7af9bbb9c8353c78098e8d74d28f7915ab7
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Nov 10 00:35:58 2026 +0000

    drm/xe/guc: Define GuC firmware for NVL-P
    
    GuC firmware 70.83.0 (UAPI 1.46.0) is the first official GuC firmware
    release for NVL-P. NVL-P has separate FW images for the primary and
    media GTs, so we need independent entries in the table.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 808930035a8f606c1e19906bf8f2704b77c08e27 drm-intel
c21716b80c65 Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
7f72400ba36f Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 7 lines checked
4c9ba1928347 drm/xe/guc: Define GuC firmware for CRI
e66de7af9bbb drm/xe/guc: Define GuC firmware for NVL-P


