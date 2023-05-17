Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3E3C77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 12:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098C310E414;
	Wed, 17 May 2023 12:57:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5CA10E414
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684328259; x=1715864259;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2cIW4GcY9eD8dexjLYdW1venoWYiT3NTaRRca5l2xPs=;
 b=ThYAd4Oqcd8pP50MRNpgLlcCn4632PXZsdQadY0D/Vok4/tMFdJdk3ni
 vTjhJ2ZC36PQi7WtxKw9JZ8rYLawEyr+mRall75qM8uZ+ybtP0taqtaET
 l4Aqtlkt0zd17OBz+Lte4wz2CBCQwDD5LXGnCrS6qsmbd8nJQHabou/SS
 DYKq20JCOydyuhEltD58QH5r78WnJoVZIFst1vNzGWXMmgs0xtb3KqjQ3
 GDru39zAhF+pbcElbeoqZKvwbl0JXgvh6xhBQwa5W9ZpV4Isg9KEi42p0
 0dwW9JgXJm5mNgQFXIDTpEb184q5mK/X6zUIh2EtuCAh4OKO11ewss7Fw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438094579"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="438094579"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 05:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771447112"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="771447112"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 05:57:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230511094817.2734836-1-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511094817.2734836-1-anshuman.gupta@intel.com>
Date: Wed, 17 May 2023 15:57:34 +0300
Message-ID: <874jobgloh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/pm: WARN_ON() on unbounded pcie
 parent bridge device
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 11 May 2023, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
> they connects to root port via pcie upstream switch port(USP)
> and virtual pcie switch port(VSP), sometimes VSP pcie devices
> doesn't bind to pcieport driver. Without pcieport driver pcie PM
> comes without any warranty and with unbounded VSP gfx card won't
> transition to low power pcie device and link state therefore
> assert dev_warn on unbounded VSP and disable xe driver
> PM support.
>
> v2:
> - Disable Xe PCI PM support. [Rodrigo]
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 855cf8557056..ee61a03d1afd 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -579,6 +579,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	pci_set_drvdata(pdev, NULL);
>  }
>  
> +static void xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
> +{
> +	struct pci_dev *bridge = pci_upstream_bridge(pdev);
> +
> +	if (!bridge)
> +		return;
> +
> +	if (!bridge->driver) {
> +		dev_warn(&pdev->dev, "unbounded parent pci bridge, device won't support any PM support.\n");

The patch subject does not match the code.

BR,
Jani.

> +		pdev->driver->driver.pm = NULL;
> +	}
> +}
> +
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> @@ -604,6 +617,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -ENODEV;
>  	}
>  
> +	xe_pci_unbounded_bridge_disable_pm(pdev);
>  	xe = xe_device_create(pdev, ent);
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);

-- 
Jani Nikula, Intel Open Source Graphics Center
