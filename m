Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B5C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 11:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EBD10E0F4;
	Tue,  2 Jan 2024 11:16:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D42D10E00D
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704194189; x=1735730189;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=fUuxNHwb8V5gGMb+QyByArh/rZHPEt/+vUA4Z6TtRjY=;
 b=bhev2jiSyKkUcCuIfAygbkW783RfXxQC8dHB2I/wW4aEDMYep0oQX2fO
 1HRRNZiQf2L00+fGbbtSUYOxtCfcGL54B7oU7YcX/8n1DhecJ9gw3g/E7
 CS8C0eX6LiTE+YWrH//P6joCt4DUmzJMTVbY4g09awtaoEksbKgonKuk/
 XVPNwCRbwXUkHSdhbHvKlel43gR9uSFyxs1Bz2GD9/0s+YM/2/A7+yAlF
 EMKtVzKG+c52f+/Irby2aDDlCXOkBG5nCYWyRceB5q2abgFqwxWhGXPlF
 Rrykez+gx2u6zzKBCUXvTeEruB2b30GIotNwaZo6aMxiZRbKVWt4aUUv0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3680636"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="3680636"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 03:16:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="1026749217"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="1026749217"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 03:16:27 -0800
Message-ID: <464d71dd195eac4145cc5dde4ee4e8d04899387b.camel@linux.intel.com>
Subject: Re: [PATCH 15/17] drm/xe/oa/uapi: OA buffer mmap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 02 Jan 2024 12:16:12 +0100
In-Reply-To: <20231208064329.2387604-16-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-16-ashutosh.dixit@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
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

On Thu, 2023-12-07 at 22:43 -0800, Ashutosh Dixit wrote:
> Allow the OA buffer to be mmap'd to userspace. This is needed for the
> MMIO
> trigger use case. Even otherwise, with whitelisted OA head/tail ptr
> registers, userspace can receive/interpret OA data from the mmap'd
> buffer
> without issuing read()'s on the OA stream fd.
>=20
> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_oa.c | 53
> ++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 42f32d4359f2c..97779cbb83ee8 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -898,6 +898,8 @@ static int xe_oa_alloc_oa_buffer(struct
> xe_oa_stream *stream)
> =C2=A0		return PTR_ERR(bo);
> =C2=A0
> =C2=A0	stream->oa_buffer.bo =3D bo;
> +	/* mmap implementation requires OA buffer to be in system
> memory */
> +	xe_assert(stream->oa->xe, bo->vmap.is_iomem =3D=3D 0);
> =C2=A0	stream->oa_buffer.vaddr =3D bo->vmap.vaddr;
> =C2=A0	return 0;
> =C2=A0}
> @@ -1174,6 +1176,9 @@ static int xe_oa_release(struct inode *inode,
> struct file *file)
> =C2=A0	struct xe_oa_stream *stream =3D file->private_data;
> =C2=A0	struct xe_gt *gt =3D stream->gt;
> =C2=A0
> +	/* Zap mmap's */
> +	unmap_mapping_range(file->f_mapping, 0, -1, 1);
> +

Can release() get called at all if there is a live mapping()? Meaning
the unmap_mapping_range() shouldn't be needed?

/Thomas


> =C2=A0	mutex_lock(&gt->oa.gt_lock);
> =C2=A0	xe_oa_destroy_locked(stream);
> =C2=A0	mutex_unlock(&gt->oa.gt_lock);
> @@ -1184,6 +1189,53 @@ static int xe_oa_release(struct inode *inode,
> struct file *file)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct xe_oa_stream *stream =3D file->private_data;
> +	struct xe_bo *bo =3D stream->oa_buffer.bo;
> +	unsigned long start =3D vma->vm_start;
> +	int i, ret;
> +
> +	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> +		drm_dbg(&stream->oa->xe->drm, "Insufficient
> privilege to map OA buffer\n");
> +		return -EACCES;
> +	}
> +
> +	/* Can mmap the entire OA buffer or nothing (no partial OA
> buffer mmaps) */
> +	if (vma->vm_end - vma->vm_start !=3D XE_OA_BUFFER_SIZE) {
> +		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must
> be OA buffer size\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Only support VM_READ, enforce MAP_PRIVATE by checking for
> VM_MAYSHARE */
> +	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED |
> VM_MAYSHARE)) {
> +		drm_dbg(&stream->oa->xe->drm, "mmap must be read
> only\n");
> +		return -EINVAL;
> +	}
> +
> +	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
> +
> +	/*
> +	 * If the privileged parent forks and child drops root
> privilege, we do not want
> +	 * the child to retain access to the mapped OA buffer.
> Explicitly set VM_DONTCOPY
> +	 * to avoid such cases.
> +	 */
> +	vm_flags_set(vma, vma->vm_flags | VM_PFNMAP | VM_DONTEXPAND
> | VM_DONTDUMP | VM_DONTCOPY);
> +
> +	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages =3D=3D
> +		=C2=A0 (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
> +	for (i =3D 0; i < bo->ttm.ttm->num_pages; i++) {
> +		ret =3D remap_pfn_range(vma, start, page_to_pfn(bo-
> >ttm.ttm->pages[i]),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE, vma->vm_page_prot);
> +		if (ret)
> +			break;
> +
> +		start +=3D PAGE_SIZE;
> +	}
> +
> +	return ret;
> +}
> +
> =C2=A0static const struct file_operations xe_oa_fops =3D {
> =C2=A0	.owner		=3D THIS_MODULE,
> =C2=A0	.llseek		=3D no_llseek,
> @@ -1191,6 +1243,7 @@ static const struct file_operations xe_oa_fops
> =3D {
> =C2=A0	.poll		=3D xe_oa_poll,
> =C2=A0	.read		=3D xe_oa_read,
> =C2=A0	.unlocked_ioctl	=3D xe_oa_ioctl,
> +	.mmap		=3D xe_oa_mmap,
> =C2=A0};
> =C2=A0
> =C2=A0static bool engine_supports_mi_query(struct xe_hw_engine *hwe)

