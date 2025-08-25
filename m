Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A952CCA0FE8
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 16:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96010E510;
	Mon, 25 Aug 2025 16:45:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F036F10E50C;
 Mon, 25 Aug 2025 16:45:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Test_GuC_v7?=
 =?utf-8?q?0=2E49=2E3_for_BMG=2C_LNL=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Aug 2025 16:45:25 -0000
Message-ID: <175614032597.267285.4195026768837607669@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250825155304.165664-2-julia.filipchuk@intel.com>
In-Reply-To: <20250825155304.165664-2-julia.filipchuk@intel.com>
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

Series: drm/xe/guc: Test GuC v70.49.3 for BMG, LNL, PTL
URL   : https://patchwork.freedesktop.org/series/153459/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42653ad7ebf6a504700ac3a807bd5ff8f463da83
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Mon Aug 25 08:53:05 2025 -0700

    drm/xe/guc: Test GuC v70.49.3 for BMG, LNL, PTL
    
    UAPI compatiblity version 1.24.3
    
    This patch is for testing only. If testing is successful the binary
    blobs will replace the major versioned '*_guc_70.bin' files for given
    platforms.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch a7c735c1739662dcc431bda50653821bff0d63fb drm-intel
42653ad7ebf6 drm/xe/guc: Test GuC v70.49.3 for BMG, LNL, PTL
-:6: WARNING:TYPO_SPELLING: 'compatiblity' may be misspelled - perhaps 'compatibility'?
#6: 
UAPI compatiblity version 1.24.3
     ^^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 12 lines checked


