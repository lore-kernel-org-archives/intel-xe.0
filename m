Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B070DCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696DB10E470;
	Thu, 12 Oct 2023 09:20:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BC110E061
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697102442; x=1728638442;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OsF6bdWMVJRT2wRF/RZHh5NFxoDhRccOL/py9LLBwmA=;
 b=UeJESeFbUDS+VhmtVQoCPeLmcZ8a0NWFv8wW0fVpOqRDiLREv9FfEJfI
 JQW4Gx0SAnxyEZoSRXAezzuENwQMSYxCLkpPOJ3tBsLtjqFrt8dWQ7TTv
 vjClxRMC8EngKd+p+cTnXOXdBNBhO4IgloZX6089nbyjlPtDE68HNJhan
 9gOXfB//+Mu1hGYCnssvq7tWMz0m0PhGaCHVGBYQqSx9je4qZCCQ0Un9N
 pmoHBSvRbSavKAigr/JifdTmX57POlh8nGKa2ww2pbrGm2kn3FJx0QeeW
 o8EzQSVcTTiLJ3PpWYvsm1g8c3ERQJ44uqKLXDdJOZORwB3Ke79u9HMyX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384727048"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="384727048"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927917183"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="927917183"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:20:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
In-Reply-To: <20231011163506.1747972-1-ruthuvikas.ravikumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231011163506.1747972-1-ruthuvikas.ravikumar@intel.com>
Date: Thu, 12 Oct 2023 12:20:35 +0300
Message-ID: <87il7c2o4c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH]     drm/xe: add mocs kunit
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023, Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com> =
wrote:
>     This kunit verifies the hardware values of the mocs and l3cc
>     registers with the KMD programmed values.
>
>     Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>     Cc: Mathew D Roper <matthew.d.roper@intel.com>
>     Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>

Please pay more attention to the patches before sending to save
everyone's time. Thanks.

BR,
Jani.

> ---
>  drivers/gpu/drm/xe/tests/Makefile       |   1 +
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 143 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  24 ++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  13 +++
>  drivers/gpu/drm/xe/xe_mocs.c            |   4 +
>  5 files changed, 185 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
>
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests=
/Makefile
> index 51f1a7f017d4..39d8a0892274 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D \
>  	xe_bo_test.o \
>  	xe_dma_buf_test.o \
>  	xe_migrate_test.o \
> +	xe_mocs_test.o \
>  	xe_pci_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/test=
s/xe_mocs.c
> new file mode 100644
> index 000000000000..0dd3f933cbf6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +#include <kunit/visibility.h>
> +
> +#include "tests/xe_mocs_test.h"
> +#include "tests/xe_pci_test.h"
> +#include "tests/xe_test.h"
> +
> +#include "xe_pci.h"
> +#include "xe_pm.h"
> +#include "xe_gt.h"
> +#include "xe_mocs.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +
> +struct live_mocs {
> +	struct xe_mocs_info table;
> +	struct xe_mocs_info *mocs;
> +	struct xe_mocs_info *l3cc;
> +	struct xe_bo *scratch;
> +	void *vaddr;
> +};
> +
> +static int live_mocs_init(struct live_mocs *arg, struct xe_gt *gt)
> +{
> +	unsigned int flags;
> +	struct kunit *test =3D xe_cur_kunit();
> +
> +	memset(arg, 0, sizeof(*arg));
> +
> +	flags =3D get_mocs_settings(gt_to_xe(gt), &arg->table);
> +
> +	kunit_info(test, "table size %d", arg->table.size);
> +	kunit_info(test, "table uc_index %d", arg->table.uc_index);
> +	kunit_info(test, "table n_entries %d", arg->table.n_entries);
> +
> +	if (flags & HAS_GLOBAL_MOCS)
> +		arg->mocs =3D &arg->table;
> +
> +	arg->l3cc =3D &arg->table;
> +
> +	return flags;
> +}
> +
> +static void read_l3cc_table(struct xe_gt *gt, const struct xe_mocs_info =
*info)
> +{
> +	unsigned int i;
> +	u32 l3cc;
> +	u32 reg;
> +	ssize_t ret;
> +
> +	struct kunit *test =3D xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto out;
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> +	for (i =3D 0; i < (info->n_entries + 1) / 2 ?
> +		    (l3cc =3D l3cc_combine(get_entry_l3cc(info, 2 * i),
> +					 get_entry_l3cc(info, 2 * i + 1))),
> +	    1 : 0;
> +	     i++) {
> +		reg =3D xe_mmio_read32(gt, LNCFCMOCS(i));
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x 0x%x\n", i,
> +			 LNCFCMOCS(i).addr, reg, l3cc);
> +
> +		if (reg !=3D l3cc) {
> +			KUNIT_FAIL(test, "l3cc reg 0x%x has incorrect val: \n",
> +				LNCFCMOCS(i).addr);
> +		}
> +	}
> +
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +}
> +static void read_mocs_table(struct xe_gt *gt, const struct xe_mocs_info =
*info,
> +			    u32 addr)
> +{
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	unsigned int i;
> +	u32 mocs;
> +	u32 reg_val;
> +
> +	ssize_t ret;
> +
> +	struct kunit *test =3D xe_cur_kunit();
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	ret =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto out;
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> +	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> +		      "Unused entries index should have been defined\n");
> +	for (i =3D 0;
> +	     i < info->n_entries ? (mocs =3D get_entry_control(info, i)), 1 : 0;
> +	     i++) {
> +		struct xe_reg reg =3D XE_REG(addr + i * 4);
> +
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr,
> +			 mocs);
> +		reg_val =3D xe_mmio_read32(gt, reg);
> +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr,
> +			 reg_val);
> +		if (reg_val !=3D mocs) {
> +			KUNIT_FAIL(test, "mocs reg 0x%x has incorrect val: \n",
> +				reg.addr);
> +		}
> +	}
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +}
> +static int mocs_kernel_test_run_device(struct xe_device *xe)
> +{
> +	/* Basic check the system is configured with the expected mocs table */
> +
> +	struct live_mocs mocs;
> +	struct xe_gt *gt;
> +
> +	unsigned int flags;
> +	int id;
> +
> +	for_each_gt(gt, xe, id) {
> +		flags =3D live_mocs_init(&mocs, gt);
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, mocs.mocs, GLOBAL_MOCS(0).addr);
> +		read_l3cc_table(gt, mocs.l3cc);
> +	}
> +	return 0;
> +}
> +void xe_live_mocs_kernel_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(mocs_kernel_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe=
/tests/xe_mocs_test.c
> new file mode 100644
> index 000000000000..ef56bd517b28
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#include "xe_mocs_test.h"
> +
> +#include <kunit/test.h>
> +
> +static struct kunit_case xe_mocs_tests[] =3D {
> +	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> +	{}
> +};
> +
> +static struct kunit_suite xe_mocs_test_suite =3D {
> +	.name =3D "xe_mocs",
> +	.test_cases =3D xe_mocs_tests,
> +};
> +
> +kunit_test_suite(xe_mocs_test_suite);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe=
/tests/xe_mocs_test.h
> new file mode 100644
> index 000000000000..7faa3575e6c3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MOCS_TEST_H_
> +#define _XE_MOCS_TEST_H_
> +
> +struct kunit;
> +
> +void xe_live_mocs_kernel_kunit(struct kunit *test);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 19a8146ded9a..0594ee7c0c15 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -579,3 +579,7 @@ void xe_mocs_init(struct xe_gt *gt)
>  	if (table.table)
>  		init_l3cc_table(gt, &table);
>  }
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_mocs.c"
> +#endif
> \ No newline at end of file

--=20
Jani Nikula, Intel
