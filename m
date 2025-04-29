Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81814C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 08:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454C610E391;
	Tue, 29 Apr 2025 08:13:26 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557E10E391;
 Tue, 29 Apr 2025 08:13:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_fix_devcoredump?=
 =?utf-8?q?_chunk_alignmnent_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 08:13:25 -0000
Message-ID: <174591440522.23428.8144255364283834050@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429073407.3505712-1-arnd@kernel.org>
In-Reply-To: <20250429073407.3505712-1-arnd@kernel.org>
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

Series: drm/xe: fix devcoredump chunk alignmnent calculation
URL   : https://patchwork.freedesktop.org/series/148393/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d43f8e6b0e02bc337a35a298a9e2549c218c76ab
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Apr 29 09:34:00 2025 +0200

    drm/xe: fix devcoredump chunk alignmnent calculation
    
    The device core dumps are copied in 1.5GB chunks, which leads to a
    link-time error on 32-bit builds because of the 64-bit division not
    getting trivially turned into mask and shift operations:
    
    ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!
    
    On top of this, I noticed that the ALIGN_DOWN() usage here cannot
    work because that is only defined for power-of-two alignments.
    Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
    link error and hopefully produces the right results.
    
    Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
    this will clearly fail on any 32-bit platform and is also likely
    to run out of memory on 64-bit systems under memory pressure, so
    using a much smaller power-of-two chunk size might be a good idea
    instead.
    
    Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 2653f1a7089beef2da70293be1226983a979e918 drm-intel
d43f8e6b0e02 drm/xe: fix devcoredump chunk alignmnent calculation
-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/xe/xe_devcoredump.c:208:
+		ss->read.chunk_position = div_u64_rem(offset,
+			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)

total: 0 errors, 0 warnings, 1 checks, 27 lines checked


