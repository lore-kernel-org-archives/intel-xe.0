Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43974CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 06:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4910EAF5;
	Fri, 17 Oct 2025 06:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5Wfn8Ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C1310EAF5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760683983; x=1792219983;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=U91txE4Ckah1aJloHAAPJCFvSe+JMqlRS1IudiV9rBM=;
 b=c5Wfn8IasLyGC1EjwouBDwQc8KMKtzNzyPUiYZRmV3XTpAk+Milj52Sv
 JYqxLsul72RTahJZOsZVPbWs9xgGjnfayu/zEEJ4+WDMAE5zzLH49UJSg
 moxeuSWNyTK5T5KyWChECgrM1rMZ9YeRq2+/Cwdi+nczWDQapZHJp3tsY
 4Sje0ChCV47sUM9XUK//rXYvzmCguq8W1tDpgvsIvYgL7cq7j35lXS+WS
 1Xik/mnfLmQm4jrm3Zd2fQRhY/3zRsf1CpRJkZ5/HYbNJ37ibrIh6pmdE
 kvPZg3B/zF8EMErQVbGk6h8Q7Gg/a/h78mX+ApQ0m6X/XAFn/VvHzdmTS A==;
X-CSE-ConnectionGUID: 4gC/RYUoR56hb0+UO+kCQA==
X-CSE-MsgGUID: fYD5SL95T3aqgw7sfMvgAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88358799"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88358799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 23:53:02 -0700
X-CSE-ConnectionGUID: L6kq+HQ4QR2VWpM6sEwN7Q==
X-CSE-MsgGUID: vdVee0VLSQ2o1XV+aP47gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183449865"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 23:52:59 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <q6kh6f3irhjbeamygfujaoiiazksiiiatvbiqfdlfnewkzqfx4@55g5ahohiuqa>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
 <20251016000742.GM5409@mdroper-desk1.amr.corp.intel.com>
 <2c4yb7mcc5r2nbnnb2ncg2kmjhl2vp62da5u3gafh7lz7uudyk@nkeqesrnpbqy>
 <SJ1PR11MB6105ACD99635C212C80B80A5EEE9A@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <q6kh6f3irhjbeamygfujaoiiazksiiiatvbiqfdlfnewkzqfx4@55g5ahohiuqa>
Subject: Re: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>, "Chauhan,
 Shekhar" <shekhar.chauhan@intel.com>, "Vivekanandan,
 Balasubramani" <balasubramani.vivekanandan@intel.com>, "Upadhyay,
 Tejas" <tejas.upadhyay@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Muqthyar Ahmed, Syed Abdul" <syed.abdul.muqthyar.ahmed@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri, 17 Oct 2025 09:52:56 +0300
Message-ID: <176068397658.10831.17875493806017000287@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

(Switching to my @linux.intel.com address)

Quoting Lucas De Marchi (2025-10-16 16:59:34)
> On Thu, Oct 16, 2025 at 06:52:20AM +0000, Muqthyar Ahmed, Syed Abdul wrot=
e:
> >> -----Original Message-----
> >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> On Wed, Oct 15, 2025 at 05:07:42PM -0700, Matt Roper wrote:
> >> >On Wed, Oct 15, 2025 at 03:06:34PM -0700, Lucas De Marchi wrote:
> >> >> Current implementation of compute walker has dependency on GPU/SW
> >> >> Stack which requires SW/UMD to wait for event from KMD to indicate
> >> >> PIPE_CONTROL interrupt was done. This created latency on SW stack.
> >> >>
> >> >> This feature adds support to generate completion interrupt from GPG=
PU
> >> >> walker which does not support MSIx and avoid software using Pipe
> >> >> control drain/idle latency.
> >> >>
> >> >> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.co=
m>
> >> >> Signed-off-by: S A Muqthyar Ahmed
> >> >> <syed.abdul.muqthyar.ahmed@intel.com>
> >> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> >> ---

<SNIP>

> >> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >> >> @@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
> >> >>   if (xe_device_uc_enabled(xe)) {
> >> >>           common_mask =3D GT_RENDER_USER_INTERRUPT |
> >> >>                         GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> >> >> +
> >> >> +         /* Enable Compute Walker Interrupt for non-MSIX platforms
> >> */
> >> >> +         if (GRAPHICS_VERx100(xe) >=3D 3511 &&
> >> !xe_device_has_msix(xe)) {
> >> >> +                 rcs_mask |=3D GT_COMPUTE_WALKER_INTERRUPT;
> >> >> +                 ccs_mask |=3D GT_COMPUTE_WALKER_INTERRUPT;
> >> >> +         }
> >> >
> >> >It probably doesn't matter since our execlist support isn't functional
> >> >and we only really support GuC-based submission, but technically
> >> >shouldn't this be outside the 'uc_enabled' check so that we'd also get
> >> >these interrupts if we tried to use execlist submission?
> >> >
> >> >BTW, is there more support for this coming in future patches?  Without
> >> >MSI-X, what's the mechanism by which userspace finds out this interru=
pt
> >> >has fired?  We're unmasking/enabling the interrupt here, but I don't
> >> >see how anything happens once the interrupts start showing up.
> >>
> >> Himal / Syed: any detail missing here?
> >>
> >> Yes, AFAIU we are still missing the change in the irq handler to get t=
he
> >> notification and the mechanism on exec queue creation for registration.
> >>
> >
> >For exec queue creation control can only be supported on  platform suppo=
rting MSIX .
> >This is for non-MSIX/MSI.
> >For this irq handler just need to wake up waiting kernel or user thread =
and that is happening for all irq lines in handler so nothing special need =
to be handled.
>=20
> yes, we will wake up the waiters on the ufence, but then how is this
> different than the pipectl notification?

The action of waking up threads and userspace to wait for the interrupt
is all the same. It is all about having a faster way to generate that
interrupt from the batch buffer without having to issue pipe control.

> Is this part just so
> userspace can be compatible with non-msix platform?

The difference between MSI-X and non-MSI-X implementation is just that
with MSI-X, there are multiple vectors so less latency for kernel driver
to search which threads to wake up. Other than that it should be the
same here, just a faster way to generate interrupt from batch buffer.

Regards, Joonas

>=20
> Lucas De Marchi?
