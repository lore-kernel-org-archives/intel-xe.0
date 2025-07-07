Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EBEC83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 13:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DABD10E46D;
	Mon,  7 Jul 2025 13:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVyPOK0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88A210E46D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751894591; x=1783430591;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=eSxTCGlSePRm7+fzYz5cp12bRZV3u77/8EPaTqsw0Sc=;
 b=QVyPOK0Cgvm/yvZn1nDxa5xKbT5M8FKwkZcPwLyZ/5ocRB6RzAwBCCUV
 bZsZUDnfPyp5erOZ+nzA9cE4xF0/yZngQh6WkUCs7HRvW6ZYJ4La2AKpd
 5oZSaGoqLwn+bvEz6MrGA924LHrLkHOlgwkmsg/S04B2F114UJzcukCa3
 DYFLa/2QKexB2mPxvpC5CcH2RW01bCHCK6qooobiqt5IOLN9RZ6MyKQ5p
 /1C3jhi57og6YaNlxTP2byq/Cuua/AfztSjYG3CrKVEbqGnQmhxX4gDtC
 cLStFktilrL1bK4KNzBbvEwcI3R6GgEVRthvLyhx1HUVZjhLkySqndv/E A==;
X-CSE-ConnectionGUID: tdHDLrlgRqWarSMCv8u3/g==
X-CSE-MsgGUID: VxTaMzTXR724gd3XsWrKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54207394"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54207394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:23:10 -0700
X-CSE-ConnectionGUID: IABJmHuHTFiiLbbP9Ud/xA==
X-CSE-MsgGUID: ZVZD5f/eTKWxBFNtWkYifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159758275"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:23:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:23:04 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v6 09/12] platform/x86/intel/pmt: add register access
 helpers
In-Reply-To: <20250703211150.135320-10-michael.j.ruhl@intel.com>
Message-ID: <800f3860-1cad-d5c3-803c-3b0f7d93fb90@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
 <20250703211150.135320-10-michael.j.ruhl@intel.com>
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

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> The control register is used in a read/modify/write pattern.
> The status register is used in a read/check bit pattern.
> 
> Add helpers to eliminate common code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 60 ++++++++++++-----------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 23b3971da40a..888946a8ba46 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -64,20 +64,42 @@ struct pmt_crashlog_priv {
>  /*
>   * I/O
>   */
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +#define CRASHLOG_SET_BIT	true
> +#define CRASHLOG_CLEAR_BIT	false

These defines look overkill to me. IMO it is just as simple to use 
true/false directly when calling.

> +/* read/modify/write */

As is, this comment doesn't add value over the function name.

It would be more useful to explain this function sets or clears @bit based 
on @set.

-- 
 i.

> +static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> +
> +	if (set)
> +		reg |= bit;
> +	else
> +		reg &= ~bit;
> +
> +	writel(reg, entry->disc_table + CONTROL_OFFSET);
> +}
> +
> +/* read/check */
> +static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
> +{
> +	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	return !!(reg & bit);
> +}
>  
> +static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +{
>  	/* return current value of the crashlog complete flag */
> -	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
>  }
>  
>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
>  	/* return current value of the crashlog disabled flag */
> -	return !!(control & CRASHLOG_FLAG_DISABLE);
> +	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
>  }
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> @@ -98,37 +120,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>  				     bool disable)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
> -	/* clear trigger bits so we are only modifying disable flag */
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -
> -	if (disable)
> -		control |= CRASHLOG_FLAG_DISABLE;
> -	else
> -		control &= ~CRASHLOG_FLAG_DISABLE;
> -
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
>  }
>  
>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
> -
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
>  }
>  
>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
> -
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
>  }
>  
>  /*
> 

