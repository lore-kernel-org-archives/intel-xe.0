Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F75C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 20:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B37810ED47;
	Tue,  8 Sep 2026 20:14:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDB610E4BE;
 Tue,  8 Sep 2026 20:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/intel=3A_Generalize_PCI_ID_macro_for_subvendor_and_subi?=
 =?utf-8?q?d?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Werner Sembach" <wse@tuxedocomputers.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 20:14:46 -0000
Message-ID: <178889848677.137999.10057925794180885351@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908200707.65516-1-wse@tuxedocomputers.com>
In-Reply-To: <20260908200707.65516-1-wse@tuxedocomputers.com>
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

Series: series starting with [1/2] drm/intel: Generalize PCI ID macro for subvendor and subid
URL   : https://patchwork.freedesktop.org/series/173627/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6d713155ed235998c7faea1b99b289883e2dff12
Author: Werner Sembach <wse@tuxedocomputers.com>
Date:   Tue Sep 8 22:05:29 2026 +0200

    drm/intel: Add quirk to disable rc6 on some TUXEDO devices
    
    Some TUXEDO devices have random rare hard resets during video streaming.
    
    Disabling rc6 fixes this. Until the root cause is found this is a pragmatic
    workaround.
    
    Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
+ /mt/dim checkpatch dd822035c9dcd89e47cbfa75da6f3119617fbada drm-intel
4a18cd4844c0 drm/intel: Generalize PCI ID macro for subvendor and subid
6d713155ed23 drm/intel: Add quirk to disable rc6 on some TUXEDO devices
-:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#50: FILE: include/drm/intel/pciids.h:715:
+#define INTEL_RPLP_TUX_IBP8_QUIRK_IDS(MACRO__, ...) \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x130F, ## __VA_ARGS__)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

total: 1 errors, 0 warnings, 0 checks, 51 lines checked


