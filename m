Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3255DC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 07:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07E10E135;
	Tue, 28 May 2024 07:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu6dFw7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBCA10E135
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716881834; x=1748417834;
 h=message-id:subject:from:to:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=EPaJklRXslnU4Mijdu/G6bC/Qclfv/exNZwaHgLtuEk=;
 b=cu6dFw7N6OADHyr/8wB2icWfRXvkBI82ujTtBA1qi4iuJy1Zm9gqDce/
 uy6meIblBWOC5RXZnU78p25QfTqm+vUa4OyfRhz8ruuN+fr2Op6IpjTxs
 At7YapC+SrNa5gn3UMQhSFOQ68OzpyB/CEmkxqKTPW+LBfazd9rpu/6Q+
 MZAkoMptQ2aU7kJZv698SgfPiadFuc+MbcD4C1kvM5ezIFtTJ26wnf++B
 I1I4Uux+R9fgBExNdSwuJ6QaP13YukBajkv0IpIXg7DBkbUNnkSackyoG
 Nd4uVgXLG0qRiM0azhGk0VdReFYyzRf7/h6T72U+oBfrtX22WwKrhCeCk w==;
X-CSE-ConnectionGUID: iaGOo1eLQ6yWIN7ZVoPxNg==
X-CSE-MsgGUID: n2mChWXERXKaUGErZG3HeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11722238"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="11722238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:37:13 -0700
X-CSE-ConnectionGUID: vzL/rOxJT/yf6q+t4awZSQ==
X-CSE-MsgGUID: OUGeMoizSg6ByeHaP9APNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="72404221"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.244.233])
 ([10.245.244.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:37:12 -0700
Message-ID: <6c5cc6d2c79cd1c98d879b73f1bdc4790d9603e3.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add more document to xe_vm::lock
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20240527230731.1888261-1-oak.zeng@intel.com>
References: <20240527230731.1888261-1-oak.zeng@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Tue, 28 May 2024 09:22:13 +0200
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Oak.

On Mon, 2024-05-27 at 16:07 -0700, Oak Zeng wrote:
> More document is added to xe_vm::lock to describe what is protected
> by this lock.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

I don't think we should be documenting the locks in this detailed
manner, but rather take care when we document the structures / fields
that are protected by a lock.

If we double-document then there's a big chance that someone forgets to
update one of the documentation sites.

Also some members below have more complicated protection than just a
single lock, for example vm::rebind list.

Also (even if it's a copy-paste) it's not possible to protect a single
bit with a lock (thinking of vm::flags field), unless there are other
conditions as well, since:

A:			B:
read_flags		vm_lock
update_bit_0		read_flags
			update_bit_1
			write_flags
			vm_unlock
write_flags

Here process a resets bit 1 to its original value.

Meaning all mutable bits must be protected by the same lock.

/Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 13 ++++++++++++-
> =C2=A01 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index ce1a63a5e3e7..5597d8072046 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -161,7 +161,18 @@ struct xe_vm {
> =C2=A0
> =C2=A0	/**
> =C2=A0	 * @lock: outer most lock, protects objects of anything
> attached to this
> -	 * VM
> +	 * VM, more specifically:
> +	 * 1) vm::rebind_list
> +	 * 2) vm::flags, only XE_VM_FLA_BANNED bit
> +	 * 3) vma::tile_present
> +	 * 4) userptr::repin_list
> +	 * 5) userptr::invalidated list
> +	 * 6) vm::preempt::exec_queue
> +	 * 7) drm_gpuvm::rb list and tree
> +	 * 8) vm::size
> +	 * 9) vm::q[]->last_fence, only if q->flags'
> EXEC_QUEUE_FLAG_VM is set,
> +	 *=C2=A0=C2=A0=C2=A0 see xe_exec_queue_last_fence_lockdep_assert
> +	 * 10) a contested list during vm close. see
> xe_vm_close_and_put
> =C2=A0	 */
> =C2=A0	struct rw_semaphore lock;
> =C2=A0	/**

