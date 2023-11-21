Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0812EC61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 19:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F8F10E2A9;
	Tue, 21 Nov 2023 19:09:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC310E2A9;
 Tue, 21 Nov 2023 19:09:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5E8F2A47E9;
 Tue, 21 Nov 2023 19:09:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 21 Nov 2023 19:09:39 -0000
Message-ID: <170059377938.30158.9057194597822093656@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120160205.669295-1-lucas.demarchi@intel.com>
In-Reply-To: <20231120160205.669295-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/mmio=3A_Make_xe=5Fmmio=5Fwait32=28=29_aware_of_interrupts_?=
 =?utf-8?b?KHJldjcp?=
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

Series: drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts (rev7)
URL   : https://patchwork.freedesktop.org/series/126428/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 331a03f9bbcc34fdad048c8bd7b599c37013228f
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Nov 20 08:02:05 2023 -0800

    drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts
    
    With the current implementation, a preemption or other kind of interrupt
    might happen between xe_mmio_read32() and ktime_get_raw(). Such an
    interruption (specially in the case of preemption) might be long enough
    to cause a timeout without giving a chance of a new check on the
    register value on a next iteration, which would have happened otherwise.
    
    This issue causes some sporadic timeouts in some code paths. As an
    example, we were experiencing some rare timeouts when waiting for PLL
    unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
    we found out that the PLL unlock was happening within the expected time
    period (20us), which suggested a bug in xe_mmio_wait32().
    
    To fix the issue, ensure that we do a last check out of the loop if
    necessary.
    
    This change was tested with the aforementioned PLL unlocking code path.
    Experiments showed that, before this change, we observed reported
    timeouts in 54 of 5000 runs; and, after this change, no timeouts were
    reported in 5000 runs.
    
    v2:
      - Prefer an implementation without a barrier (v1 switched the order of
        xe_mmio_read32() and ktime_get_raw() calls and added a barrier() in
        between). (Lucas, Rodrigo)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
8a342e66a drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
331a03f9b drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts


