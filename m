Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083FC41513
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 08:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B028810E16E;
	Thu, 27 Jun 2024 08:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e74pUav3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D2D10E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719476699; x=1751012699;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Fanyn6qOQt9NAQPtrn6lZ5u5stvnQe3/eHjzmaZwaWA=;
 b=e74pUav3Iiv+l87M3tU+3vsfo6xVbkNNJr11XUFHBdj3sfWmMDE/GOYQ
 isGXtc31vbcccZD+8HaMMHQodh2NsZz9uMHPqqKccKEp3oIelUOFhT3bg
 KsH1ClQijYWavgR9tPkOJM1FCCRe9cfKAsA3bQMnbsF7Olug41AlWuQsq
 VK3PYaToP7ScO8O6xhHap9YiUnZYeVY46joCwbzbqP0S82h6z0dccyiHt
 2xKYa98hBDNtLsrqdAE6gH2hPTbSl2FBojv/SsRbqY4rpFH7OPPzZoWLa
 Er0FWcTopXOqH/QsC7RFhuG90S0mwfQcZ2VAOY4w3r9w6q3BncoCJVoHg g==;
X-CSE-ConnectionGUID: uJdeEM+uRPSIeyN1BPkdnA==
X-CSE-MsgGUID: ZRLV98cBT9aXugYAl5pylQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16717622"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16717622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:24:58 -0700
X-CSE-ConnectionGUID: VUXvf8aYQcu8/GpGxriE9w==
X-CSE-MsgGUID: 5il/ooV9R7e2jufPrFbCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44424094"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:24:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi?=
 =?utf-8?Q?=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/pf: Disable VFs on remove
In-Reply-To: <20240626111827.1389-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240626111827.1389-1-michal.wajdeczko@intel.com>
 <20240626111827.1389-2-michal.wajdeczko@intel.com>
Date: Thu, 27 Jun 2024 11:24:53 +0300
Message-ID: <87frsydc8a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 26 Jun 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> We shouldn't leave VFs enabled when unloading the PF driver.
> Otherwise we will get a message like:
>
>  [ ] xe 0000:4d:00.0: driver left SR-IOV enabled after remove
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ebff5ea79b1d..4b91a9878f41 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -749,6 +749,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (!xe) /* driver load aborted, nothing to cleanup */
>  		return;
>=20=20
> +#ifdef CONFIG_PCI_IOV
> +	if (IS_SRIOV_PF(xe))
> +		xe_pci_sriov_configure(pdev, 0);
> +#endif
> +

Please don't add inline #ifdefs.

IS_SRIOV_PF() works for CONFIG_PCI_IOV=3Dn. xe_pci_sriov_configure()
should also have a stub for CONFIG_PCI_IOV=3Dn.

Alternatively, if you also added a dedicated function for disabling VF,
you could have a stub for that, and

#define xe_pci_sriov_configure NULL

for CONFIG_PCI_IOV=3Dn, so you wouldn't have to have inline #ifdefs in
xe_pci_driver initialization either.


BR,
Jani.


>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);

--=20
Jani Nikula, Intel
