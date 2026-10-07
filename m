Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524A5CA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8948110F5F5;
	Wed,  7 Oct 2026 14:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="al4yXCgC";
	dkim-atps=neutral
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Wed, 07 Oct 2026 11:01:17 UTC
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A7610E432
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1791370874; bh=PUrsW9QGleEa4tKnQJ9BZnmWEhq88y9ma4fL35Srg9o=;
 h=Date:From:To:Cc:Cc:Cc:Subject;
 b=al4yXCgCn/YzmMbl3kZuHBcwU0YNGQPzfZkke9vGRtWxjQgIYSqTzXa7BQ67Gqshd
 B7DpF4B3XUNsedkMVUMwxXxPvsQC+uORVjPjVI7wwkdEj97FOsVKS1w0XmFqq173mO
 vZ0hH54tSnuin2rC2Ih3qtVKfUW6sh7n1m9EItD0=
Received: from localhost ([39.144.128.134])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id D79B241B; Wed, 07 Oct 2026 18:53:57 +0800
X-QQ-mid: xmsmtpt1791370437twx43rnro
Message-ID: <tencent_F0B7A92DA405622129C8AC48F3CF490B9B07@qq.com>
X-QQ-XMAILINFO: MEx+xBdGVwfV5eb97qcA8GTxuLYrZQLfHlx6iEcRtUxw6KKH5jWU0mqvIHUuLq
 4hTaQFhsSHanmBvPeIG9DZy3ZLuIQ/KhdUFnaMJrmBAaFZHnL0/QWkU9DWb3GIly3+3XsqOAEJj9
 uIXAfGWu5hvgLnf5lHhdbIvmec0dlo8wbsuDPBkdhDHrEoG4dKMVOLbRkyKp2/2aHnY397DL2ZfH
 2dinKjLKHoHqPgj1Ysf2Pwkp7GJDOd9NgFoXmwqkmdg7hpG2R1NEVHkxnhtfbFjFYDyXyBKbINmQ
 S0l46rdcFQtjC6tJEJF8uBqqCQQn+XDob1gCg5FecDe3h6jOs/D9TZqAeP4xYPdkJtzqANT5ii2B
 Ss3FObQxWtZffzfX/fE8wo3tJPALyqHq1dAYY2SlFkNslgge2J2rCCP2hwFUIcCKt9CZU8bAGojN
 PuDOO1EIiGN0KI5qsMRluxCFL8qsfcYi4NDgrwgFrctEf6vINFqsfE2CVpNXzYxlCVfnlXx2pCfd
 b7UQeKge13toVB+B5BwzFQ3jrTY8xnNMEi80YrbZSvyRBeu5xb+Zau/jbUaFzWHkLIXCH2AIhVeI
 7MC7VyH8NN6ZCbuIwcqBJTXfmmBlMZg4iz+24956TPVRSOdRThqBEgKleHdMpJGpOAY5iaYH6l2X
 dOUiz/0vlmrFUryqgJsJ7WuYehRjJCvbs5wFUf8iHMGmDnCd1xnUq8qp0ZAles90tH7T/Q9eW8x4
 ouUlrcENie5q3czjiqZkDBR0FoFtBx/BdRdgY19Fbb1SHbY8OgO81q25KDOI1UQR+zSMCTdpvlC7
 B0ZgNnSHuCy8wjnUs2HFG3B5gA/NOICNNaoinzpJd5hPbbp36a7mZS/5EIaIG6KKOPJbLSsqcBVL
 Yar4+eLFm1mLcRjWfMMhybooOqvhU3Pwlt7ICEsZqVdBCYKaR1D8KcU5zQZoi4E4iS+M06/Kxidk
 mdn0y6Sb8vz9uyufpaEFlrEGc65PWF+6fhheAgH66OsULtlQK3mWHYkJ3S3tH0VIcCwoS/wEk=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
Date: Wed, 07 Oct 2026 18:53:57 +0800
X-OQ-MSGID: <121677a3811a0561268ce6cc8d73faa1@qq.com>
From: Eason <1836949523@qq.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [BUG] drm/xe: WARNING in intel_bios_init(): "Port A asks to use VBT
 vswing/preemph tables" on Panther Lake [8086:b081]
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:05:56 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hello,

I would like to report a WARNING that appears on every boot on a Panther
Lake laptop, and that is also visible on screen (before the desktop comes
up) when resuming from hibernation.

Hardware / software
-------------------

  laptop    XIAOMI REDMI Book Pro 14 2026 (board TM2426)
  BIOS      RMAPT4B0P0909 (2026-05-21), EC firmware 1.9
  GPU       Intel Panther Lake [Arc B370] [8086:b081] (rev 04)
            xe: "Found pantherlake (device ID b081) integrated display
                 version 30.00 stepping B0"
  kernel    7.2.9 (Arch linux-zen packaging: vanilla 7.2.9 + zen patchset
            + one unrelated local one-file platform/x86 patch)
  xe        srcversion BB102CAE6B929F8604B5647

What happens
------------

Every boot, about 7.1 s in, while the xe module initializes the display:

  [    7.10xxxx] xe 0000:00:02.0: [drm] Found pantherlake (device ID b081) integrated display version 30.00 stepping B0
  [    7.11xxxx] ------------[ cut here ]------------
  [    7.11xxxx] xe 0000:00:02.0: [drm] Port A asks to use VBT vswing/preemph tables
  [    7.11xxxx] WARNING: drivers/gpu/drm/i915/display/intel_bios.c:2813 at intel_bios_init+0x17fd/0x1f60 [xe], CPU#1: (udev-worker)/207
  [    7.11xxxx] Modules linked in: xe(+) drm_ttm_helper ttm drm_buddy i2c_algo_bit drm_suballoc_helper nvme gpu_sched drm_gpuvm nvme_core drm_exec ...
  [    7.11xxxx] CPU: 1 UID: 0 PID: 207 Comm: (udev-worker) Tainted: G     U   7.2.9-zen1-1.1-zen #1 PREEMPT(full)
  [    7.11xxxx] Hardware name: XIAOMI REDMI Book Pro 14 2026/TM2426, BIOS RMAPT4B0P0909 05/21/2026
  [    7.11xxxx] RIP: 0010:intel_bios_init+0x1806/0x1f60 [xe]
  [    7.11xxxx] Call Trace:
  [    7.11xxxx]  <TASK>
  [    7.11xxxx]  intel_display_driver_probe_noirq+0x3b/0x2e0 [xe]
  [    7.11xxxx]  xe_display_init_early+0x8b/0x140 [xe]
  [    7.11xxxx]  xe_device_probe+0x46d/0xc20 [xe]
  [    7.11xxxx]  xe_pci_probe+0xdf7/0x13d0 [xe]
  [    7.11xxxx]  pci_call_probe+0x9a/0x270
  [    7.11xxxx]  pci_device_probe+0xdb/0x180
  [    7.11xxxx]  really_probe+0xe9/0x440
  [    7.11xxxx]  __driver_probe_device+0x90/0x190
  [    7.11xxxx]  __driver_attach+0xb3/0x370
  [    7.11xxxx]  bus_for_each_dev+0x12f/0x1d0
  [    7.11xxxx]  bus_add_driver+0x153/0x310
  [    7.11xxxx]  driver_register+0x75/0xe0
  [    7.11xxxx]  xe_init+0x27/0x90 [xe]
  [    7.11xxxx]  ? __pfx_init_module+0x10/0x10 [xe]
  [    7.11xxxx]  do_one_initcall+0x8e/0x3d0
  [    7.11xxxx]  do_init_module+0x6a/0x2b0
  [    7.11xxxx]  init_module_from_file+0xc8/0x180
  [    7.11xxxx]  idempotent_init_module+0x23e/0x360
  [    7.11xxxx]  __x64_sys_finit_module+0x7f/0x110
  [    7.11xxxx]  do_syscall_64+0xaa/0x660
  [    7.11xxxx]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
  [    7.11xxxx] ---[ end trace 0000000000000000 ]---

which is exactly the check at intel_bios.c:2813:

  /*
   * FIXME need to implement support for VBT
   * vswing/preemph tables should this ever trigger.
   */
  drm_WARN(display->drm, child->use_vbt_vswing,
           "Port %c asks to use VBT vswing/preemph tables\n",
           port_name(port));

So the VBT of this machine sets use_vbt_vswing for DDI port A.

Impact here
-----------

The display works normally (eDP panel comes up, external output over USB-C
works, no visible corruption), so for me this is a warning and not a
functional failure. Two reasons I still wanted to report it:

  - it dumps a full backtrace on every boot, which looks alarming in dmesg;
  - after resume from hibernation the console output stays on screen until
    the display driver takes over, so this warning is what the user actually
    sees ("a long line with a register dump") before the desktop comes back.
    It is not hibernation-specific: a plain cold boot shows it too.

Questions
---------

  - Is this expected for this VBT, i.e. should the OEM VBT not set
    use_vbt_vswing for port A at all?
  - Is support for the VBT vswing/preemph tables planned, or would it make
    sense to downgrade/ignore the warning for this case (e.g. when the DP
    link is working fine)?
  - Is there any information from the VBT you would like me to extract?

I can provide
-------------

  - full dmesg / journalctl -k output for a cold boot and for a
    hibernation/resume cycle;
  - acpidump output;
  - the VBT binary (please tell me the preferred way to extract it from this
    platform - e.g. the intel-gpu-tools VBT/opregion decoders - and I will
    attach it);
  - a boot with drm.debug=0xe, or any other debug options you want;
  - testing of patches, including on mainline, since I can build kernels
    locally for this machine.

Thanks a lot for your work on xe.

Note: the local testing and the preparation of this report were done with the
assistance of a local AI assistant (DeepSeek Harness WebUI, deepseek-flash
model); every command, log and result quoted above was actually executed on
this machine and reviewed by me.

Eason
1836949523@qq.com

