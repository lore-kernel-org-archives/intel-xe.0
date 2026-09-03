Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC99C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F20D10E10B;
	Thu,  3 Sep 2026 15:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W6t2mXfi";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7569110E10B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:27:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 96E896053D;
 Thu,  3 Sep 2026 15:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FE01F00A3A;
 Thu,  3 Sep 2026 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788449233;
 bh=OSp3ZpLjHZLdmN8cRBMuhCneZpsFwukfAv2jriSIDko=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=W6t2mXfiaf2WSyEqC6hpGqSJKMmNukKCEQc9HAu5fcmdPLRlYWzDnKXkAtfEmgbXw
 5T+8NO270yGS1fJFbXHJRU+uyNo+KkZqRCocayLtnCamoS0wDcbbCgVRNT+9UV9r6R
 m0UOu1+KUu3BPb29f51zfG3U7wDYRQwwEjXujlYrymsydY6lZl2oIu4/3V9MQXO9xx
 EftnWDob7GJdzKJ+ocSrP9zyXbeueq+luZDc2PCAUHXrPh9+Hnbiop3jLh7DORYLxp
 ccLKSp3WUT/CJONr1AjlT0SRNh5O+al3dg9AEEr/ucPLl/ut8WDkrVRctSP/uvcRLc
 i4tFadRqaolog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/27] drm/xe/eudebug: Add vm open/pread/pwrite
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-13-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-13-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:27:12 +0000
Message-Id: <20260903152713.21FE01F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing runtime PM reference acquisition before accessing device m=
emory and MMIO registers in VM read/write and fsync operations.
- [High] Missing bounds check on `timeout_ns` causes integer truncation and=
 allows a user-controlled unbounded timeout that leads to device-wide lock =
starvation.
--

commit 4d072be6d2def21f4bb83f2b06e9fdfe40aeb1c5
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>

    drm/xe/eudebug: Add vm open/pread/pwrite
   =20
    The debugger needs access to the client's vm to read and write, for
    example to inspect ISA/ELF and set up breakpoints.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug_vm.c b/drivers/gpu/drm/xe/xe_e=
udebug_vm.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug_vm.c
[ ... ]
> +static ssize_t __xe_eudebug_vm_access(struct file *file,
> +				      char __user *r_buffer,
> +				      const char __user *w_buffer,
> +				      size_t count, loff_t *__pos)
> +{
[ ... ]
> +	do {
> +		const ssize_t len =3D min_t(ssize_t, bytes_left, alloc_len);
> +
> +		ret =3D __vm_read_write(vm, k_buffer,
> +				      write ? NULL : r_buffer + copied,
> +				      write ? w_buffer + copied : NULL,
> +				      (u64)(pos + copied),
> +				      len,
> +				      write);
> +		if (ret <=3D 0)
> +			break;
> +
> +		bytes_left -=3D ret;
> +		copied +=3D ret;
> +	} while (bytes_left > 0);

[Severity: High]
Does this code need to acquire a runtime PM reference before accessing memo=
ry?

VM/VRAM access delegates down to ttm_bo_access(), which requires an active
runtime PM reference that is absent in this call chain. Because the fops
handlers execute as standard VFS file operations, they do not automatically
hold the DRM IOCTL PM runtime reference. ttm_bo_access() delegates to
xe_ttm_access_memory(), directly hitting the xe_device_assert_mem_access(xe)
assertion. If the device has entered runtime suspend, accessing memory will
crash the kernel.

[ ... ]
> +static int engine_rcu_flush(struct xe_eudebug *d,
> +			    struct xe_hw_engine *hwe,
> +			    unsigned int timeout_us)
> +{
[ ... ]
> +	/* Prevent concurrent flushes */
> +	mutex_lock(&d->xe->eudebug.lock);
> +	psmi_ctrl =3D xe_mmio_read32(&gt->mmio, psmi_addr);
> +	if (!(psmi_ctrl & IDLE_MSG_DISABLE))
> +		xe_mmio_write32(&gt->mmio, psmi_addr,
> +				REG_MASKED_FIELD_ENABLE(IDLE_MSG_DISABLE));
> +
> +	/* XXX: Timeout is per operation but in here we flush previous */
> +	ret =3D xe_mmio_wait32(&gt->mmio, RCU_ASYNC_FLUSH,
> +			     RCU_ASYNC_FLUSH_IN_PROGRESS, 0,
> +			     timeout_us, NULL, false);

[Severity: High]
Does this code block indefinitely and cause lock starvation?

There is no bounds check on timeout_ns when passed from user space, allowing
an unbounded timeout. engine_rcu_flush() implicitly truncates the 64-bit
value to a 32-bit unsigned int timeout_us. xe_mmio_wait32() will block for
this duration while holding the device-wide d->xe->eudebug.lock mutex.=20

Furthermore, because the PM runtime reference is missing during fsync (as
noted below), the MMIO register read will likely return 0xFFFFFFFF, meaning
the polling loop will never succeed and will guarantee the full sleep
duration. This completely locks up the eudebug subsystem and EU page fault
processing across the entire device.

[ ... ]
> +static int xe_eudebug_vm_fsync(struct file *file, loff_t start, loff_t e=
nd, int datasync)
> +{
[ ... ]
> +	for_each_gt(gt, d->xe, gt_id) {
> +		struct xe_hw_engine *hwe;
> +		enum xe_hw_engine_id id;
> +
> +		/* XXX: vm open per engine? */
> +		xe_eudebug_for_each_hw_engine(hwe, gt, id) {
> +			ret =3D engine_rcu_flush(d, hwe, vmf->timeout_us);
> +			if (ret)
> +				goto out;
> +		}
> +	}
> +out:
> +	return ret;
> +}

[Severity: High]
Does this code need to acquire a runtime PM reference before accessing MMIO
registers?

Hardware engines are iterated and MMIO registers flushed without asserting
that the device is awake via a runtime PM reference. Because
xe_eudebug_vm_fsync() executes as a standard VFS file operation, it does not
automatically hold the DRM IOCTL PM runtime reference. engine_rcu_flush()
directly accesses MMIO registers (RING_PSMI_CTL and RCU_ASYNC_FLUSH). If the
device has entered runtime suspend, accessing MMIO registers will cause PCIe
aborts or system hangs.

[ ... ]
> +long xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
> +{
[ ... ]
> +	kref_get(&d->ref);
> +	vmf->debugger =3D d;
> +	vmf->vm =3D vm;
> +	vmf->flags =3D param.flags;
> +	vmf->vm_handle =3D param.vm_handle;
> +	vmf->timeout_us =3D div64_u64(param.timeout_ns, 1000ull);

[Severity: High]
Can a malicious userspace client provide a huge value for timeout_ns and
cause lock starvation?

This is where the user-controlled timeout is saved without any upper bound
validation, setting up the lock starvation issue in engine_rcu_flush()
mentioned above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D12
