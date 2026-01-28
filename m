Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1C2D3F07A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 15:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E3310E71C;
	Wed, 28 Jan 2026 15:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZXAr0cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92FB10E71C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769614239; x=1801150239;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6zPd5spmWJWQQqvS+/TKoBN5KReKeBDGB+kuYGaloQA=;
 b=YZXAr0clxZwSnSAh3t4Gqk9LQB1+Ec3Ctt+QmWNMv1xuw6Nhb/m9aGRh
 MoN2jp3V4IAk4FhEYguxjpl7Brx/MwGVVUiiSa/gqIXGmxiV89MYN80jq
 6Leucb53e46JpI6HNYJlRkPZaFDB/DqikLedjBdfdtmcP2s0wRZaq26na
 a21TNrO1vqs6mq41eamE6uySDB8qhL0zilQvlMVbs3G7olXyvNGpfave6
 w7MxT8nHNj22QWKl3A169nTAslHlfPNd23H/xmoGfKcOuDE6kCvv2UGoD
 pb/p+1gxc7ceLYnXhrIMPYj0sHeh/Ad2nUT/QInnxx3T2/9qkaZDx+4bz Q==;
X-CSE-ConnectionGUID: 8zP1P/JPSfSI9uZnh1ZWjA==
X-CSE-MsgGUID: 7kx3zZIwSxq6Z6h/wiSXsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81557830"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81557830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:30:38 -0800
X-CSE-ConnectionGUID: LZdElvtJT5y4ax/7q8xgDQ==
X-CSE-MsgGUID: W4uQP4cPT3u8k47ODINEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208536126"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 07:30:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 1/5] pmt: Add register access callbacks
In-Reply-To: <20260127182418.640701-8-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-8-michael.j.ruhl@intel.com>
Date: Wed, 28 Jan 2026 17:30:31 +0200
Message-ID: <7c4167508d597118cab2470daadab05e10297d5e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 27 Jan 2026, "Michael J. Ruhl" <michael.j.ruhl@intel.com> wrote:
> Some HW does not have the explicit access via MMIO.  Allow
> for parent drivers to control access to the status/control
> path.

I think this is quite vague, and could use some copy-paste from the
cover letter, for posterity.

BR,
Jani.

>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
>  include/linux/intel_vsec.h                | 26 +++++++++++----
>  2 files changed, 55 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index b0393c9c5b4b..978b35d56888 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  {
>  	const struct crashlog_control *control = &crashlog->info->control;
>  	struct intel_pmt_entry *entry = &crashlog->entry;
> -	u32 reg = readl(entry->disc_table + control->offset);
> +	u32 guid = entry->header.guid;
> +	u32 reg;
> +	int err;
> +
> +	if (entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->pcidev, guid, &reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return;
> +		}
> +	} else {
> +		reg = readl(entry->disc_table + control->offset);
> +	}
>  
>  	reg &= ~control->trigger_mask;
>  
> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  	else
>  		reg &= ~bit;
>  
> -	writel(reg, entry->disc_table + control->offset);
> +	if (entry->cb->write_reg) {
> +		err = entry->cb->write_reg(entry->pcidev, guid, reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to write reg: %d\n", __func__, err);
> +			return;
> +		}
> +	} else {
> +		writel(reg, entry->disc_table + control->offset);
> +	}
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
> -	u32 reg = readl(crashlog->entry.disc_table + status->offset);
> +	struct intel_pmt_entry *entry = &crashlog->entry;
> +	u32 guid = entry->header.guid;
> +	u32 reg;
> +	int err;
> +
> +	if (entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->pcidev, guid, &reg, status->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return false;
> +		}
> +	} else {
> +		reg = readl(crashlog->entry.disc_table + status->offset);
> +	}
>  
>  	return !!(reg & bit);
>  }
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 1a0f357c2427..5416f84aca40 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -80,16 +80,28 @@ enum intel_vsec_quirks {
>  
>  /**
>   * struct pmt_callbacks - Callback infrastructure for PMT devices
> - * @read_telem: when specified, called by client driver to access PMT
> - * data (instead of direct copy).
> - * * pdev:  PCI device reference for the callback's use
> - * * guid:  ID of data to acccss
> - * * data:  buffer for the data to be copied
> - * * off:   offset into the requested buffer
> - * * count: size of buffer
> + * ->read_telem() when specified, called by client driver to access PMT data (instead
> + * of direct copy).
> + * @pdev:  PCI device reference for the callback's use
> + * @guid:  ID of data to access
> + * @data:  buffer for the data to be copied
> + * @off:   offset into the requested buffer
> + * @count: size of buffer
> + * ->read_reg() when specified called by client driver to read PMT state
> + * @pdev: PCI device reference for the callback's use
> + * @guid: ID of data to access
> + * @data: buffer for the register data to be read
> + * @offset: offset of control register to access
> + * ->write_reg() when specified called by client driver to write PMT state
> + * @pdev: PCI device reference for the callback's use
> + * @guid: ID of data to access
> + * @data: buffer data to be written to the register
> + * @offset: offset of control register to access
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct pci_dev *pdev, u32 guid, u32 *data, u32 offset);
> +	int (*write_reg)(struct pci_dev *pdev, u32 guid, u32 data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {

-- 
Jani Nikula, Intel
