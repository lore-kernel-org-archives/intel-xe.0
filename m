Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE5FC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44A010E09B;
	Wed, 26 Jun 2024 10:39:45 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2659410E835;
 Wed, 26 Jun 2024 10:39:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_MSIX_functionality_to?=
 =?utf-8?q?_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 10:39:44 -0000
Message-ID: <171939838415.160231.9692274447464887201@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626103345.2801735-1-dliberman@habana.ai>
In-Reply-To: <20240626103345.2801735-1-dliberman@habana.ai>
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

Series: Add MSIX functionality to XE
URL   : https://patchwork.freedesktop.org/series/135422/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf6161e18dd39fd1875ea65d5001183eb01a7309
Author: Ilia Levi <illevi@habana.ai>
Date:   Wed Jun 26 13:33:45 2024 +0300

    drm/xe: msix support for hw engines
    
    For devices that support MSIX, we would like to be able to configure
    the hw engines to work with MSI-X. This patch allocates MSIX vectors
    for exec queues (via MSIX allocator), registers a handler and
    programs the lrc the same way vf does it (using memirq). An
    additional field added to the lrc is CS_INT_VEC.
    
    MSIX vector 0 is used for GuC-to-host interrupt.
    
    bspec: 60342, 72547
    
    Signed-off-by: Ilia Levi <illevi@habana.ai>
+ /mt/dim checkpatch 4e4d42f54537b821c3aea17ef8b669a36ac09356 drm-intel
8553f50e4fa2 drm/xe/irq: refactor irq flows to support also msix
-:46: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#46: FILE: drivers/gpu/drm/xe/xe_irq.c:680:
+{
+

-:47: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#47: FILE: drivers/gpu/drm/xe/xe_irq.c:681:
+
+}

-:169: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#169: FILE: drivers/gpu/drm/xe/xe_irq.c:789:
+{
+

-:170: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#170: FILE: drivers/gpu/drm/xe/xe_irq.c:790:
+
+}

total: 0 errors, 0 warnings, 4 checks, 163 lines checked
56be28f10248 drm/xe/irq: add msix allocator
-:74: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#74: FILE: drivers/gpu/drm/xe/xe_irq.c:856:
+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
+			bool dynamic_msix, u32 *msix)

-:100: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#100: FILE: drivers/gpu/drm/xe/xe_irq.c:882:
+
+}

-:123: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#123: FILE: drivers/gpu/drm/xe/xe_irq.c:905:
+
+}

-:142: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#142: FILE: drivers/gpu/drm/xe/xe_irq.h:21:
+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
+			bool dynamic_msix, u32 *msix);

total: 0 errors, 0 warnings, 4 checks, 115 lines checked
b7216e7f395b drm/xe/irq: add hw engine irq handler
-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/xe/xe_irq.c:847:
+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf,
+				bool dynamic_msix, u32 *msix)

total: 0 errors, 0 warnings, 1 checks, 30 lines checked
4941f8fe6a5f drm/xe/exec: adding msix infra to exec queue
701366f69ec3 drm/xe: move the kernel lrc from hwe to execlist port
a679684ca630 drm/xe: move memirq out of vf
579d43494908 drm/xe: msix support preparations - enable memirq
cf6161e18dd3 drm/xe: msix support for hw engines
-:94: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#94: FILE: drivers/gpu/drm/xe/xe_execlist.c:268:
+		err = xe_request_irq(xe, xe_irq_hwe_handler, hwe,
+			hwe->name, true, &port->msix_number);

-:103: CHECK:LINE_SPACING: Please don't use multiple blank lines
#103: FILE: drivers/gpu/drm/xe/xe_execlist.c:277:
 
+

-:191: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#191: FILE: drivers/gpu/drm/xe/xe_irq.c:751:
+		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
+			GUC_INTR_GUC2HOST);

-:202: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#202: FILE: drivers/gpu/drm/xe/xe_irq.c:762:
+	err = xe_request_irq(xe, guc2host_irq_handler, xe, DRIVER_NAME,
+		false, &msix);

total: 0 errors, 0 warnings, 4 checks, 249 lines checked


