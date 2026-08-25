Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6165C61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 09:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640A210E996;
	Tue, 25 Aug 2026 09:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eznmjm1O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0808010E996
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 09:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787650490; x=1819186490;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=KlF/8GVOr+Pgut7IyB9p0C8vh65ERwpQ25zE27gbb3M=;
 b=eznmjm1OTw/vormoSLKFkLWKKmkLcZQhRHILFUtNWdnQ0WVVAgV+UDoO
 pmOumRUmfuWPyPFiIZPJUlW2nbF747G9C42QXhI1+1F/GkiARrExyvX+Z
 P0/spdYPxCY8ewx8wH3DG+h4TL/Ktag0KRLYMQgmr7xLl6PYb1GN41p+J
 1FCgBFkZC8lFO0GRgJ70kI5G+8c381P1a25ShPVuPxcuX0XBHVJD7cIRa
 p2ff0ftMSmMBmyq0WoNx6P5UUPmy7m++KRwx+pSQs29huUzFao/i89HCK
 AD7LYYxfmVN4MAipYlQgfqMui7Fz9sGJGrTOCe8vVpTRx2Ob5QlFS5lGI g==;
X-CSE-ConnectionGUID: 6LZpsGrWRsK6WlI+dh76eg==
X-CSE-MsgGUID: 456EjKUORyaQ4SmmLSWLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88129497"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88129497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:34:49 -0700
X-CSE-ConnectionGUID: /yxF89rURqCy/kBjwuWgpg==
X-CSE-MsgGUID: GY+AQnHERUCkSGIzWXx6GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263965814"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 02:34:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 12:34:41 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
In-Reply-To: <20260824162317.2450380-14-michael.j.ruhl@intel.com>
Message-ID: <d86e5e19-e6fe-468f-1a9e-cf51c0b2da2f@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-14-michael.j.ruhl@intel.com>
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

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> Some HW does not have direct MMIO access to PMT control and data
> features.
> 
> Augment the current callback infrastructure (data access) to allow
> a registered driver to customize read/write access to the control
> paths for PMT usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
>  include/linux/intel_vsec.h                | 14 +++++++-
>  2 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index f936daf99e4d..5923ad7abbd9 100644
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
> +	if (entry->cb && entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->dev, guid, &reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);

Never print __func__ in any user consumable message (level > debug) but 
write the message in plain English.

Also, this needs include.

> +			return;
> +		}
> +	} else {
> +		reg = readl(entry->disc_table + control->offset);

Add include.

> +	}
>  
>  	reg &= ~control->trigger_mask;
>  
> @@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  	else
>  		reg &= ~bit;
>  
> -	writel(reg, entry->disc_table + control->offset);
> +	if (entry->cb && entry->cb->write_reg) {
> +		err = entry->cb->write_reg(entry->dev, guid, reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to write reg: %d\n", __func__, err);

Rephrase without using __func__.

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
> +	if (entry->cb && entry->cb->read_reg) {
> +		err = entry->cb->read_reg(entry->dev, guid, &reg, status->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return false;

It seems you need a lerger rework here to properly return error codes.

> +		}
> +	} else {
> +		reg = readl(crashlog->entry.disc_table + status->offset);

entry->disc_table

> +	}

This looks mostly duplicated code, add a helper?

>  
>  	return !!(reg & bit);
>  }
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 843cda8f8644..917d9397a993 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -90,13 +90,25 @@ enum intel_vsec_quirks {
>   * @read_telem: when specified, called by client driver to access PMT
>   * data (instead of direct copy).
>   * * dev:   device reference for the callback's use
> - * * guid:  ID of data to acccss
> + * * guid:  ID of data to access
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_reg: when specified called by client driver to read PMT state
> + * * dev:      device reference for the callback's use
> + * * guid:     ID of data to access
> + * * reg_data: register data
> + * * offset:   offset of register to read
> + * @write_reg: when specified called by client driver to write PMT state
> + * * dev:      device reference for the callback's use
> + * * guid:     ID of data to access
> + * * reg_data: register data
> + * * offset:   offset of register to write
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
> +	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
>  };
>  
>  struct vsec_feature_dependency {
> 

-- 
 i.

