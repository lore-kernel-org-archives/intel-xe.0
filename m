Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB0FED3D6
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 14:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4F610F5E9;
	Fri, 24 Apr 2026 14:48:54 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6B10F5E9;
 Fri, 24 Apr 2026 14:48:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PCI=3A_Fix_resizable_bar_?=
 =?utf-8?q?fails_due_to_bridge_memory_region?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 14:48:52 -0000
Message-ID: <177704213222.7958.13255607873597100425@5ab824fced77>
X-Patchwork-Hint: ignore
References: <7f673ce8-fa00-47aa-a50f-812ae5073279@lankhorst.se>
In-Reply-To: <7f673ce8-fa00-47aa-a50f-812ae5073279@lankhorst.se>
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

Series: PCI: Fix resizable bar fails due to bridge memory region
URL   : https://patchwork.freedesktop.org/series/165435/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 69242ef658cebfb11f3e6ea1465352116bd1bc6c
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Apr 24 16:43:26 2026 +0200

    PCI: Fix resizable bar fails due to bridge memory region
    
    I encountered a problem that I have on my system, where I cannot resize
    the bar because one of the bridges has a
    
    If I take a look at the topology, the GPU shares the memory region with a bridge,
    
    +-[0000:64]-+-00.0-[65-68]----00.0-[66-68]--+-01.0-[67]----00.0
    
    The specific bridge likely causing a failure is:
    
    65:00.0 PCI bridge: Intel Corporation Device e2ff (rev 01) (prog-if 00 [Normal decode])
            Flags: bus master, fast devsel, latency 0, IRQ 32, IOMMU group 1
            Memory at 382400000000 (64-bit, prefetchable) [size=8M]
            ....
    
    Which causes upstream bridge 64:00.0 initially to allocate the region
    [38fe0000000-38ff0000000) for the GPU, and [382ff0000000..382ff07fffff]
    for the bridge device.
    
    Bridge 64 is big enough for 1 BMG with a 32 GB bar and the second 8 MB allocation:
    pci_bus 0000:64: resource 9 [mem 0x382000000000-0x382fffffffff window] (64GB window)
    
    The reason for failure is that bridge 65 has a 8 MB memory region assigned,
    and previously it was ignored when reallocating.
    
    Failing case:
    xe 0000:67:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
    xe 0000:67:00.0: BAR 2 [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
    pcieport 0000:66:01.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
    pcieport 0000:65:00.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
    pcieport 0000:64:00.0: bridge window [mem 0x382fe0000000-0x382ff07fffff 64bit pref]: was not released (still contains assigned resources)
    pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
    pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
    pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
    pcieport 0000:65:00.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
    pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
    pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
    pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: can't assign; no space
    pcieport 0000:66:01.0: bridge window [mem size 0x400000000 64bit pref]: failed to assign
    xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; no space
    xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
    xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; no space
    xe 0000:67:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
    pcieport 0000:64:00.0: PCI bridge to [bus 65-68]
    pcieport 0000:64:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
    pcieport 0000:64:00.0:   bridge window [mem 0x382fe0000000-0x382ff07fffff 64bit pref]
    pcieport 0000:65:00.0: PCI bridge to [bus 66-68]
    pcieport 0000:65:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
    pcieport 0000:65:00.0:   bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]
    pcieport 0000:66:01.0: PCI bridge to [bus 67]
    pcieport 0000:66:01.0:   bridge window [mem 0xd7000000-0xd81fffff]
    pcieport 0000:66:01.0:   bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]
    
    Working with the patch below:
    xe 0000:67:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
    xe 0000:67:00.0: BAR 2 [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
    pcieport 0000:66:01.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
    pcieport 0000:65:00.0: bridge window [mem 0x382fe0000000-0x382fefffffff 64bit pref]: releasing
    pcieport 0000:65:00.0: BAR 0 [mem 0x382ff0000000-0x382ff07fffff 64bit pref]: releasing
    pcieport 0000:64:00.0: bridge window [mem 0x382fe0000000-0x382ff07fffff 64bit pref]: releasing
    pcieport 0000:64:00.0: bridge window [mem 0x382000000000-0x3824007fffff 64bit pref]: assigned
    pcieport 0000:65:00.0: bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]: assigned
    pcieport 0000:65:00.0: BAR 0 [mem 0x382400000000-0x3824007fffff 64bit pref]: assigned
    pcieport 0000:66:01.0: bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]: assigned
    xe 0000:67:00.0: BAR 2 [mem 0x382000000000-0x3823ffffffff 64bit pref]: assigned
    pcieport 0000:64:00.0: PCI bridge to [bus 65-68]
    pcieport 0000:64:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
    pcieport 0000:64:00.0:   bridge window [mem 0x382000000000-0x3824007fffff 64bit pref]
    pcieport 0000:65:00.0: PCI bridge to [bus 66-68]
    pcieport 0000:65:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
    pcieport 0000:65:00.0:   bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]
    pcieport 0000:65:00.0: PCI bridge to [bus 66-68]
    pcieport 0000:65:00.0:   bridge window [mem 0xd7000000-0xd83fffff]
    pcieport 0000:65:00.0:   bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]
    pcieport 0000:66:01.0: PCI bridge to [bus 67]
    pcieport 0000:66:01.0:   bridge window [mem 0xd7000000-0xd81fffff]
    pcieport 0000:66:01.0:   bridge window [mem 0x382000000000-0x3823ffffffff 64bit pref]
    xe 0000:67:00.0: [drm] BAR2 resized to 16384MiB
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 3573339bb775e24c33992aa26fdf05e073943ac9 drm-intel
69242ef658ce PCI: Fix resizable bar fails due to bridge memory region
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
If I take a look at the topology, the GPU shares the memory region with a bridge,

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


