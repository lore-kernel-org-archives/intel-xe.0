Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97B5C83F2C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 15:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF2310E0CD;
	Tue,  5 Sep 2023 15:15:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9458710E169;
 Tue,  5 Sep 2023 15:15:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 94D26A00E8;
 Tue,  5 Sep 2023 15:15:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 05 Sep 2023 15:15:55 -0000
Message-ID: <169392695560.19170.6374072943936144503@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905143144.1706967-1-lucas.demarchi@intel.com>
In-Reply-To: <20230905143144.1706967-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_LRC_workarounds?=
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

Series: Fix LRC workarounds
URL   : https://patchwork.freedesktop.org/series/123286/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e527ded4175e5a1365f05f644e4107d11b6fc90d
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Sep 5 07:31:44 2023 -0700

    drm/xe: Fix LRC workarounds
    
    Fix 2 issues when writing LRC workarounds by copying the same handling
    done when processing other RTP entries:
    
    For masked registers, it was not correctly setting the upper 16bits.
    Differently than i915, the entry itself doesn't set the upper bits
    for masked registers: this is done when applying them. Testing on ADL-P:
    
    Before:
            [drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00000002
            ...
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x00002000
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00000040
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x00000200
    
    After:
            [drm:xe_gt_record_default_lrcs [xe]] LRC WA rcs0 save-restore MMIOs
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x2580] = 0x00060002
            ...
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x7018] = 0x20002000
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x7300] = 0x00400040
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x7304] = 0x02000200
    
    All of these registers are masked registers, so writing to them without
    the relevant bits in the upper 16b doesn't have any effect.
    
    Also, this adds support to regular registers; previously it was assumed
    that LRC entries would only contain masked registers. However this is
    not true. 0x6604 is not a masked register, but used in workarounds for
    e.g.  ADL-P. See commit 28cf243a341a ("drm/i915/gt: Fix context
    workarounds with non-masked regs"). In the same test with ADL-P as
    above:
    
    Before:
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0000000
    After:
            [drm:xe_gt_record_default_lrcs [xe]] REG[0x6604] = 0xe0efef6f
    
    As can be seen, now it will read what was in the register rather than
    completely overwrite the other bits.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 7ec520d3a63b6e95174329108cd44359a70907ba drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


