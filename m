Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA8606A327
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 04:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hP1A5lC/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E182D10E11B;
	Sat, 14 Nov 2026 04:33:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8910E11B
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 04:32:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5EA9B6112C;
 Sat, 14 Nov 2026 04:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15C71F000C4;
 Sat, 14 Nov 2026 04:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794630776;
 bh=3j35L1fx7NcZjFfwjKRPJrWDyv1lUWN98hG/AOa3J/I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hP1A5lC/7n40gZz/dmHdYRTMxJmfchv6+WmdRbAb9dYsWroKWl7muyQRCxZVDDYoT
 XR+ISxvXBND2PLtFgum/5o6umH6RBlQ+5sRy0RVQwLwlUe/kN+N/5HeeTJYB7ryMiZ
 EB6D84hhl+m/lMGWIzMEZNzy+AiEoQJnXkFGLRWcR1sl/f0+ZLJy8Ekt4OzqEz41V3
 rtNPsM58lLcdQJYO/b3w91+ZHYGn7SFkenpkryOwaKMLlhTL7me4O9968BpHmR1CBm
 vxjEGmrWQ9EH+dqrhBlZRiadRiGjNcbHmMJbjsIMYzXW8LVRjBxT1BHaeS9MYZhswp
 rw7X734t8HVOw==
Message-ID: <sashiko-outbox-214142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2] drm/xe: fix UAF race between exec-queue teardown and
 GuC CT pause-abort
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261114035753.3027117-2-tejas.upadhyay@intel.com>
References: <20261114035753.3027117-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 04:32:55 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] drm/xe: missing Fixes trailer for commit 78f3bf00be4f
- [Low] drm/xe: commit message cites out-of-tree assert in
  guc_exec_queue_kill()
--

commit 46bb8a16fcefb342a61773f14635615595ee2bf1
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

> drm/xe: fix UAF race between exec-queue teardown and GuC CT pause-abort
>
> xe_guc_submit_pause_abort() walks guc->submission_state.exec_queue_lookup
> and unconditionally calls guc_exec_queue_kill() on every entry found,
> without verifying the queue hasn't already begun/finished its own
> independent teardown. guc_exec_queue_fini() (run once a queue's own
> refcount drops to zero via the normal close path) only erases its xarray
> entry partway through its body, via release_guc_id() -- so there is a
> window where a queue's refcount is already 0 but its xarray entry is
> still present.
>
> This was caught as a debug assertion firing on both BMG and CRI:
>
>         xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
>         WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at guc_exec_queu=
e_kill+0x2e2/0x360
>          guc_exec_queue_kill+0x2e2/0x360 [xe]
>          xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
>          guc_submit_fini+0x11f/0x180 [xe]
>          devm_action_release+0x15/0x30
>          ...
>          device_release_driver_internal+0x230/0x270
>          unbind_store+0xac/0xc0                          [BMG: igt@xe_con=
figfs, sysfs unbind]
>          pci_iov_remove_virtfn+0xd1/0x140
>          sriov_disable+0x42/0x100
>          pci_disable_sriov+0x23/0x40
>          xe_pci_sriov_configure+0x2b9/0x1350 [xe]
>          sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IO=
V VF disable]

[Severity: Low]
As reported by Matthew Brost on v1 [1], upstream guc_exec_queue_kill() and
its callees do not contain a kref_read(&q->refcount) assertion.

In addition, xe_guc_submit_pause_abort() holds guc->submission_state.lock
across the xa_for_each() loop, while guc_exec_queue_fini() must acquire
the same lock in release_guc_id() -> __release_guc_id() to erase the
xarray entry before freeing q->guc or q.  Could the commit message explain
what upstream issue or use-after-free is being fixed here rather than
citing an out-of-tree assertion?

> Pin the queue with kref_get_unless_zero() before touching it, skipping the
> redundant guc_exec_queue_kill() for entries that have already
> independently reached a zero refcount instead of operating on an object
> that's already being torn down elsewhere.
>
> V2(Sashiko):
> -xe_sched_submission_start(sched) must still run unconditionally for every
> non-duplicate entry regardless of that refcount check
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

[Severity: Low]
As reported by Patchwork on v1 [2], since this fixes the unconditional
guc_exec_queue_kill() call added in xe_guc_submit_pause_abort(), should it
include a Fixes tag?

  Fixes: 78f3bf00be4f ("drm/xe: Always kill exec queues in xe_guc_submit_pa=
use_abort")

[1] https://lore.kernel.org/r/avcy5lJdRge%2FD8qm@gsse-cloud1.jf.intel.com
[2] https://lore.kernel.org/r/179457832098.20475.2771158659080650020@9ac1b6=
3fe3ea

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114035753.3027=
117-2-tejas.upadhyay@intel.com?part=3D1
