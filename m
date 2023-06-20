Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C6DEB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 19:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B329110E380;
	Tue, 20 Jun 2023 19:37:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B98A210E37F;
 Tue, 20 Jun 2023 19:37:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 464EFAADD2;
 Tue, 20 Jun 2023 19:37:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Date: Tue, 20 Jun 2023 19:37:54 -0000
Message-ID: <168728987428.10443.2481705823159753555@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_mmio_register_rw_tracing_=28rev2=29?=
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

Series: Add mmio register rw tracing (rev2)
URL   : https://patchwork.freedesktop.org/series/119312/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b467a47e1c6e58a738a4fa4305f13702c32c781a
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Tue Jun 20 12:32:29 2023 -0700

    drm/xe: Add reg read/write trace
    
    This will help debug register read/writes and provide
    a way to trace all the mmio transactions.
    
    In order to avoid spam from xe_mmio_wait32,
    xe_mmio_read32_notrace is introduced and used.
    
    v2: Do not use inline for the function declarations.(MattR)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch f0727faae3ac98601f3f4299a967f26542b3e482 drm-intel
6da586113 drm/xe: Move mmio read/write functions to xe_mmio.c
b467a47e1 drm/xe: Add reg read/write trace
-:259: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#259: FILE: drivers/gpu/drm/xe/xe_trace.h:520:
+	    TP_STRUCT__entry(

-:266: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#266: FILE: drivers/gpu/drm/xe/xe_trace.h:527:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 232 lines checked


