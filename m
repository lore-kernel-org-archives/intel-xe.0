Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D67CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 08:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319110E77F;
	Wed,  8 Oct 2025 08:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpC4W0+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F7510E109
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759910724; x=1791446724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z6zHU9Zvb9YdAvaKk/aMO4Gc42LTo7EtBdltxGFDx2c=;
 b=ZpC4W0+wG44PIVzDsZYt5av8DZG+RVB0uvtKmAk1Z5ITHSKzy1Pr2vbN
 CGnNcreJ8E4ZLQUzknnenho458Wt7LSFxXcmMrFCS24NbJczl3ssvfIwy
 +IbFKbl0kSJHyfTt/WXf0ivo17vU7TTSvI+ZXH/wqbA/pH+gHPuHa3GeI
 S6NCpfFEwo1oyO3qr26s43uxMOKATgUxcClGj4Hu5+0P+XHIi0tvUbA2s
 Nz+2UGFLj14x5FHhvQxqvyxLA5DJcBdNCvK1e/kS7NsSPNMt/mR6SPr6o
 m5gmKCS5if1pbJU5rHqk2HQZRtyCczGn6pv5PWC/pf96MZZVAdhvWfzOJ Q==;
X-CSE-ConnectionGUID: mXYFQIz0R2auPenaDNH0uw==
X-CSE-MsgGUID: VTTO7Z95QCCA0bLjZpWwxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65950792"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="65950792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:05:23 -0700
X-CSE-ConnectionGUID: 8Ye8MSt3TDa6N1fwN2gmJQ==
X-CSE-MsgGUID: T10xYBskSQalLeuEGv/nbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180404659"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.169])
 by orviesa008.jf.intel.com with SMTP; 08 Oct 2025 01:05:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 08 Oct 2025 11:05:19 +0300
Date: Wed, 8 Oct 2025 11:05:19 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
Message-ID: <aOYbP6NCdKGtpcCj@kuha.fi.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-3-raag.jadav@intel.com>
 <v4k2wbqubd3axseacmj645rxf6oorhfksjew7wx2roy67cyx5i@msal4niodlrx>
 <aNu9eRb7dqnEjgaf@black.igk.intel.com>
 <aOYaSh5rlCElWurt@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYaSh5rlCElWurt@kuha.fi.intel.com>
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

On Wed, Oct 08, 2025 at 11:01:21AM +0300, Heikki Krogerus wrote:
> Hi,
> 
> On Tue, Sep 30, 2025 at 01:22:33PM +0200, Raag Jadav wrote:
> > On Tue, Sep 30, 2025 at 01:13:57PM +0200, Andi Shyti wrote:
> > > Hi Raag,
> > > 
> > > On Thu, Sep 25, 2025 at 01:38:35AM +0530, Raag Jadav wrote:
> > > > I2C IRQ needs to be routed to SGUnit or PUnit for the devices that support
> > > > it. Wire up reset/postinstall handles for I2C IRQ to take care of this.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > 
> > Awesome, thanks Andi.
> > 
> > Heikki, I can integrate your DISABLE_MSI changes which I'm assuming
> > will be in the same path here?
> 
> Yes, that would be awesome!

So something like this squashed into this patch?

diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
index f2e455e2bfe4..396d78c3b6a3 100644
--- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -16,6 +16,7 @@
 
 #define I2C_BRIDGE_PCICFGCTL           XE_REG(I2C_BRIDGE_OFFSET + 0x200)
 #define   ACPI_INTR_EN                 REG_BIT(1)
+#define   DISABLE_MSI_CAP              REG_BIT(29)
 
 #define I2C_CONFIG_CMD                 XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
 #define I2C_CONFIG_PMCSR               XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 69f39df5a692..8a4ba6a411e4 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -189,7 +189,7 @@ void xe_i2c_irq_reset(struct xe_device *xe)
        if (!xe_i2c_irq_present(xe))
                return;
 
-       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, 0);
+       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, ACPI_INTR_EN, DISABLE_MSI_CAP);
 }
 
 void xe_i2c_irq_postinstall(struct xe_device *xe)
@@ -199,7 +199,7 @@ void xe_i2c_irq_postinstall(struct xe_device *xe)
        if (!xe_i2c_irq_present(xe))
                return;
 
-       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, 0, ACPI_INTR_EN);
+       xe_mmio_rmw32(mmio, I2C_BRIDGE_PCICFGCTL, DISABLE_MSI_CAP, ACPI_INTR_EN);
 }
 
 static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,

-- 
heikki
