Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06214D59D99
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 10:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C008E10E22A;
	Mon, 15 Dec 2025 10:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3razF+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158AC89622
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765793522; x=1797329522;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Bl9OVyu506K2be07pimgon+9oMc+0asklutp5E1EYiQ=;
 b=d3razF+zqDfEHMmk4IBaYr1XuiGMDf6M76c3u4SIELvr5ro/LpTAvO2T
 AadVoC8DyUD2cTyIV2YwI+OaZBIQsoUjIR/OsVyVhdBttvEPus1spQkuC
 1K9Q4eRXBqyaYEr6wAOG9T/9SooifXPinvv1o+fA6GlM9KJIw4zXfXjRj
 PNuqC2vK+jvU+80HbbBQUSFJr8vQiYayNa9R5gi26tRiiWtAOHN9MShdN
 a19wpla1L1Hm/2pi+2OXrgcKYyq+fAxW45z8r+ikR2/WPJtmZRZvGGMw4
 G6bJikthnph+eHH9bzaRwOaytfAVckO+zX/SPperfun3bzchIziY9tnWP Q==;
X-CSE-ConnectionGUID: X54wm8sXSJWZj3PVgw6RPw==
X-CSE-MsgGUID: 1eU5rPDPQA6QRa3HnY6Meg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79063598"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="79063598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:12:01 -0800
X-CSE-ConnectionGUID: B1b3iN9xSTqcMH6ZACQxZA==
X-CSE-MsgGUID: DD/RBYO4SBipP2IZGwfGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="196764978"
Received: from zzombora-mobl1 (HELO [10.245.244.10]) ([10.245.244.10])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:12:00 -0800
Message-ID: <2996336638c0ce39991d6535f32a027d969b00bd.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/7] drm/xe: Add debugfs knobs to control long
 running workload timeslicing
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 11:11:57 +0100
In-Reply-To: <20251212182847.1683222-4-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-4-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> Add debugfs knobs to control timeslicing for long-running workloads,
> allowing quick tuning of values when running benchmarks.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_debugfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 74
> ++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 6 +++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A04 files changed, 83 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c
> index 4fa423a82bea..38433c9af59f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -328,6 +328,74 @@ static const struct file_operations
> atomic_svm_timeslice_ms_fops =3D {
> =C2=A0	.write =3D atomic_svm_timeslice_ms_set,
> =C2=A0};
> =C2=A0
> +static ssize_t min_run_period_lr_ms_show(struct file *f, char __user
> *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	char buf[32];
> +	int len =3D 0;
> +
> +	len =3D scnprintf(buf, sizeof(buf), "%d\n", xe-
> >min_run_period_lr_ms);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t min_run_period_lr_ms_set(struct file *f, const char
> __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	u32 min_run_period_lr_ms;
> +	ssize_t ret;
> +
> +	ret =3D kstrtouint_from_user(ubuf, size, 0,
> &min_run_period_lr_ms);
> +	if (ret)
> +		return ret;
> +
> +	xe->min_run_period_lr_ms =3D min_run_period_lr_ms;
> +
> +	return size;
> +}
> +
> +static const struct file_operations min_run_period_lr_ms_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D min_run_period_lr_ms_show,
> +	.write =3D min_run_period_lr_ms_set,
> +};
> +
> +static ssize_t min_run_period_pf_ms_show(struct file *f, char __user
> *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	char buf[32];
> +	int len =3D 0;
> +
> +	len =3D scnprintf(buf, sizeof(buf), "%d\n", xe-
> >min_run_period_pf_ms);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t min_run_period_pf_ms_set(struct file *f, const char
> __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe =3D file_inode(f)->i_private;
> +	u32 min_run_period_pf_ms;
> +	ssize_t ret;
> +
> +	ret =3D kstrtouint_from_user(ubuf, size, 0,
> &min_run_period_pf_ms);
> +	if (ret)
> +		return ret;
> +
> +	xe->min_run_period_pf_ms =3D min_run_period_pf_ms;
> +
> +	return size;
> +}
> +
> +static const struct file_operations min_run_period_pf_ms_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D min_run_period_pf_ms_show,
> +	.write =3D min_run_period_pf_ms_set,
> +};
> +
> =C2=A0static ssize_t disable_late_binding_show(struct file *f, char __use=
r
> *ubuf,
> =C2=A0					 size_t size, loff_t *pos)
> =C2=A0{
> @@ -395,6 +463,12 @@ void xe_debugfs_register(struct xe_device *xe)
> =C2=A0	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root,
> xe,
> =C2=A0			=C2=A0=C2=A0=C2=A0 &atomic_svm_timeslice_ms_fops);
> =C2=A0
> +	debugfs_create_file("min_run_period_lr_ms", 0600, root, xe,
> +			=C2=A0=C2=A0=C2=A0 &min_run_period_lr_ms_fops);
> +
> +	debugfs_create_file("min_run_period_pf_ms", 0600, root, xe,
> +			=C2=A0=C2=A0=C2=A0 &min_run_period_pf_ms_fops);
> +
> =C2=A0	debugfs_create_file("disable_late_binding", 0600, root, xe,
> =C2=A0			=C2=A0=C2=A0=C2=A0 &disable_late_binding_fops);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 339b9aef9499..9f84ce3db1f6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -460,6 +460,7 @@ struct xe_device *xe_device_create(struct pci_dev
> *pdev,
> =C2=A0	xe->info.revid =3D pdev->revision;
> =C2=A0	xe->info.force_execlist =3D xe_modparam.force_execlist;
> =C2=A0	xe->atomic_svm_timeslice_ms =3D 5;
> +	xe->min_run_period_lr_ms =3D 5;
> =C2=A0
> =C2=A0	err =3D xe_irq_init(xe);
> =C2=A0	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index b35ba29d4d35..7df0da592b50 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -615,6 +615,12 @@ struct xe_device {
> =C2=A0	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS
> */
> =C2=A0	u32 atomic_svm_timeslice_ms;
> =C2=A0
> +	/** @min_run_period_lr_ms: LR VM (preempt fence mode)
> timeslice */
> +	u32 min_run_period_lr_ms;
> +
> +	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice
> */
> +	u32 min_run_period_pf_ms;
> +
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> =C2=A0	/**
> =C2=A0	 * @vm_inject_error_position: inject errors at different
> places in VM
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4648f8a458cf..a1363f675b51 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1509,9 +1509,9 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags, struct xe_file *xef)
> =C2=A0
> =C2=A0	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> =C2=A0	if (flags & XE_VM_FLAG_FAULT_MODE)
> -		vm->preempt.min_run_period_ms =3D 0;
> +		vm->preempt.min_run_period_ms =3D xe-
> >min_run_period_pf_ms;
> =C2=A0	else
> -		vm->preempt.min_run_period_ms =3D 5;
> +		vm->preempt.min_run_period_ms =3D xe-
> >min_run_period_lr_ms;
> =C2=A0
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_range_fence_tree_init(&vm->rftree[id]);

