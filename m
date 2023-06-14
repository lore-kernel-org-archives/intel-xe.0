Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E286EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 00:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F3210E3F8;
	Wed, 14 Jun 2023 00:16:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2992810E3F8;
 Wed, 14 Jun 2023 00:16:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 26FFAA0003;
 Wed, 14 Jun 2023 00:16:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Date: Wed, 14 Jun 2023 00:16:55 -0000
Message-ID: <168670181515.17428.7082725992666580588@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230614001315.1552497-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20230614001315.1552497-1-radhakrishna.sripada@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_mmio_register_rw_tracing?=
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

Series: Add mmio register rw tracing
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
commit 34b6e4590996798e82e2e2ffb4a5acc9865b7982
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Tue Jun 13 17:13:15 2023 -0700

    drm/xe: Add reg read/write trace
    
    This will help debug register read/writes and provide
    a way to trace all the mmio transactions.
    
    In order to avoid spam from xe_mmio_wait32,
    xe_mmio_read32_notrace is introduced and used.
    
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch 82705904eeb14baebfdd67326f10d3654c1f6d6d drm-intel
fbd5d3ddd drm/xe: Move mmio read/write functions to xe_mmio.c
34b6e4590 drm/xe: Add reg read/write trace
-:262: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#262: FILE: drivers/gpu/drm/xe/xe_trace.h:515:
+	    TP_STRUCT__entry(

-:269: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#269: FILE: drivers/gpu/drm/xe/xe_trace.h:522:
+	    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 239 lines checked


