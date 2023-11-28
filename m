Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5BCC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 13:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA90710E529;
	Tue, 28 Nov 2023 13:37:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA9710E52A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701178618; x=1732714618;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=10zTZRs9XtaKjP9SOlLcHD6JQk3fK/fMGt6NFwD0cgo=;
 b=GhEaUa1ZEHrIuSOtmJWF+dDgnFAMu75Upag/XUTyxyTWOHkTjsurTKfL
 d1SSrCAUBJYXyQh5QyRSUfMbOZqW4uz02qCIw1tnBWjy7gIyQeRv5/yku
 jU5ZzDrCMU2MZpYP3h7cGtgPol5Zt6aOAoB08reOQQEwz/q5IYmoynXuf
 PfM1zQg8h5TdNdatvZgHR7yofGlbmQolTO0YVYAL/RdZUUO17maHMB4by
 sHo7wqTmxO70A7cY8SyLksBzhHgRxh0QIUxIN8YZmGSQeGzWbCLy8+8JM
 HMF/wDFTZAQ58crWoRtCHCczMRciO+TcPfXv7XItIUtHXPTi+AmzL9zba A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372297457"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="372297457"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 05:36:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="912433145"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="912433145"
Received: from kjeldbeg-mobl.ger.corp.intel.com (HELO [10.249.254.83])
 ([10.249.254.83])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 05:36:56 -0800
Message-ID: <273d22f529cafde3bfae432ae2f2de4d921a1239.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 14:36:53 +0100
In-Reply-To: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC v2 0/6] Enable compression handling on LNL.
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

Hi!

On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
> Series enables flat ccs on xe2 igfx platforms and handles clearing
> and copy=20
> of ccs metadata during bo creation and xe_bo_move respectively.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
>=20
> Himal Prasad Ghimiray (6):
> =C2=A0 drm/xe/xe2: Support flat ccs.
> =C2=A0 drm/xe/xe2: Determine bios enablement for flat ccs on igfx.
> =C2=A0 drm/xe/xe2: Allocate extra pages for ccs during bo create.
> =C2=A0 drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
> =C2=A0 drm/xe/xe_migrate.c: Use NULL 1G PTE mapped at 255GiB VA for ccs
> =C2=A0=C2=A0=C2=A0 clear.
> =C2=A0 drm/xe/xe2: Handle flat ccs move for igfx.
>=20
> =C2=A0drivers/gpu/drm/xe/regs/xe_gpu_commands.h |=C2=A0=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/regs/xe_gt_regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 40 ++++---
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 32 ++++-
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 139 +++++++++-----------
> --
> =C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A07 files changed, 119 insertions(+), 102 deletions(-)
>=20

I forgot to mention, in xe/tests/xe_bo.c there is a kunit test that
exercises basic clearing and migration with a CCS-metadata-enabled bo.
IMO we should update that to make sure it runs with the new code as
well.

Thanks,
Thomas

