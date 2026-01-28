Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EFED25B4E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 12:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAA010E2A8;
	Wed, 28 Jan 2026 12:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgvF54EE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0AB10E2A8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769603255; x=1801139255;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=mSU9Od5pfumgAGx59V+h4QAONM+CmRRuzzgcCfSxee0=;
 b=CgvF54EEACM7DsfttGMgDD6LDuMWNfUl7hUBfFkvigpqY3YiCsA678rj
 1W/yOD+KApSybpRLBLKs8G4hSAnj1BpNFM8Yc3eEQSy20wFHKiAGZjm2p
 kKM6rsh3O5qhUXp+EXfL8o5oGLaqqrpHBMGY2e7Wpt72YDenoh6QXc+dD
 FWk0m4z9eqy4cWYWEjItt/W1Y4I5sKAABYea0RIZZ9raC0G7oIs1A4eQt
 sL9PQa3jzuJ4sEG0geTakraWdBZfmN+dvzY7QQq3kJLn59kMMhv78L1c/
 DKMp4YdtTJw1bRC1l1Qd0uZhokb/dA/UnFWUvFdLmuKixbKYiBnVCQac1 w==;
X-CSE-ConnectionGUID: pY0DVEG9QqidGnLFn0BwPw==
X-CSE-MsgGUID: 8q5QTaU1ScOckazxcuaXmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74673333"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74673333"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 04:27:35 -0800
X-CSE-ConnectionGUID: tyt7dcc8Tseq5OQRWqUuLg==
X-CSE-MsgGUID: dER6XLW+QxOSz2Q8raJCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213123560"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.14])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 04:27:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:27:29 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 1/5] pmt: Add register access callbacks
In-Reply-To: <20260127182418.640701-8-michael.j.ruhl@intel.com>
Message-ID: <406d5451-0f09-df2c-1b49-4e643e605a24@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
 <20260127182418.640701-8-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 27 Jan 2026, Michael J. Ruhl wrote:

> Some HW does not have the explicit access via MMIO.  Allow

One space is enough after a stop.

Please reflow to 72 chars.

> for parent drivers to control access to the status/control
> path.

This sounds quite vague compared with what you're doing (adding ability to 
provide custom read/write accessors).

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

Please don't ever use __func__ in prints intended to be visible for normal 
users.

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

Have you checked that these don't generate warnings and how they look 
visually?

>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct pci_dev *pdev, u32 guid, u32 *data, u32 offset);
> +	int (*write_reg)(struct pci_dev *pdev, u32 guid, u32 data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {
> 

-- 
 i.

