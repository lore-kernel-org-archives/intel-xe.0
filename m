Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BCBC7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 08:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557F010E1AF;
	Mon, 22 May 2023 08:53:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB36B10E1AF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684745583; x=1716281583;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FokgbLngcqOXfvDWshfWohbh5WUCI+ey3I76lJ70z9I=;
 b=jtg3Dpc91tH+DrmjrO3CnIIdL2yoliAezBYL/quTHTCc0t7xqyHz5hWI
 YkFX4eCdW7plKskanOU9sfmz1luVYU7AxpjH83+IAlSQm9aX2Z/drPyet
 f9ukaRuH/up4RsOJPAmwoxnryetV4LFunFvUZ1LtGRWfVResgEB+Av813
 uXWxQtL/kT116WG2nPaLKsMlil53eodIFMlqKF1AXz9nFE/Nkf8derGe5
 Sbiym4W0iTSwTmwclGyyMBb3LUc5CgWhua7Cq1BzWVn8KPFVYq2/3/mon
 4P6Ko/zwN4xT5kR9wd9n/ZvNO/EvDHyB0weWa8HAVddk+S2I+lzlAbuGF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381089700"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="381089700"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 01:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="736339529"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="736339529"
Received: from andreipo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.228])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 01:53:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230518085259.4083944-1-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230518085259.4083944-1-anshuman.gupta@intel.com>
Date: Mon, 22 May 2023 11:52:58 +0300
Message-ID: <87fs7ooihh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
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

On Thu, 18 May 2023, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Intel Discrete GFX cards gfx may have multiple PCIe endpoints,
> they connects to root port via pcie upstream switch port(USP)
> and virtual pcie switch port(VSP), sometimes VSP pcie devices
> doesn't bind to pcieport driver. Without pcieport driver, pcie PM
> comes without any warranty and with unbounded VSP gfx card won't
> transition to low power pcie device and link state therefore
> assert dev_warn on unbounded VSP and disable xe driver
> PM support.
>
> v2:
> - Disable Xe PCI PM support. [Rodrigo]
> v3:
> - Changed subject and Rebase.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e789a50a1310..e09d76b7755a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -603,6 +603,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
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
> +		pdev->driver->driver.pm = NULL;
> +	}
> +}
> +
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> @@ -628,10 +641,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return -ENODEV;
>  	}
>  
> +

Please make a habit out of running checkpatch.pl --strict locally to
save everyone's time.

CHECK: Please don't use multiple blank lines
#91: FILE: drivers/gpu/drm/xe/xe_pci.c:644:
 
+


>  	err = xe_display_driver_probe_defer(pdev);
>  	if (err)
>  		return err;
>  
> +	xe_pci_unbounded_bridge_disable_pm(pdev);
> +
>  	xe = xe_device_create(pdev, ent);
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);

-- 
Jani Nikula, Intel Open Source Graphics Center
