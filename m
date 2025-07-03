Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE00C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C610E14F;
	Thu,  3 Jul 2025 22:49:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06ED610E906;
 Thu,  3 Jul 2025 22:49:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_LRC_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 22:49:51 -0000
Message-ID: <175158299102.131399.5008068359815576531@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
In-Reply-To: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
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

Series: drm/xe: LRC refactors
URL   : https://patchwork.freedesktop.org/series/151152/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 305c85360916b124e2cd93ed233df6cc7d56d799
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 3 15:41:16 2025 -0700

    drm/xe: Waste fewer instructions in emit_wa_job()
    
    I was debugging some unrelated issue and noticed the current code was
    very verbose. We can improve it easily by using the more common batch
    buffer building pattern.
    
    Before:
                    bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
         c4d:       41 8b 56 10             mov    0x10(%r14),%edx
         c51:       49 8b 4e 08             mov    0x8(%r14),%rcx
         c55:       8d 72 01                lea    0x1(%rdx),%esi
         c58:       41 89 76 10             mov    %esi,0x10(%r14)
         c5c:       c7 04 91 01 00 08 15    movl   $0x15080001,(%rcx,%rdx,4)
                            bb->cs[bb->len++] = entry->reg.addr;
         c63:       8b 08                   mov    (%rax),%ecx
         c65:       41 8b 56 10             mov    0x10(%r14),%edx
         c69:       49 8b 76 08             mov    0x8(%r14),%rsi
         c6d:       81 e1 ff ff 3f 00       and    $0x3fffff,%ecx
         c73:       8d 7a 01                lea    0x1(%rdx),%edi
         c76:       41 89 7e 10             mov    %edi,0x10(%r14)
         c7a:       89 0c 96                mov    %ecx,(%rsi,%rdx,4)
     ..etc..
    
    After:
                    *cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
         c52:       41 c7 04 24 01 00 08    movl   $0x15080001,(%r12)
         c59:       15
                            *cs++ = entry->reg.addr;
         c5a:       8b 10                   mov    (%rax),%edx
     ..etc..
    
    Resulting in the following binary change:
    
            add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-348 (-348)
            Function                                     old     new   delta
            xe_gt_record_default_lrcs.cold               304     296      -8
            xe_gt_record_default_lrcs                   2200    1860    -340
            Total: Before=13554, After=13206, chg -2.57%
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5bf9f9da41be2c8562f5d95aba623d27cb2aecf9 drm-intel
6af7e5f55281 drm/xe/lrc: Reduce scope of empty lrc data
5d1424e058d9 drm/xe: Count dwords before allocating
d0cd1b0fba3a drm/xe/gt: Extract emit_job_sync()
4b5e71dcc1c9 drm/xe/lrc: Add table with LRC layout
f1d4a216d666 drm/xe/lrc: Remove leftover TODO
8bcd747d5f0f drm/xe/gt: Drop third submission for default context
305c85360916 drm/xe: Waste fewer instructions in emit_wa_job()
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
                bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;

total: 0 errors, 1 warnings, 0 checks, 152 lines checked


