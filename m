Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644ACC61CE7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 10:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD0110E608;
	Wed, 11 Jun 2025 10:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fn5U67lE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7F10E608
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 10:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749639152; x=1781175152;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=gGMagrCDK3sN1QP+NUuRSNak5emFF1SEvpjfqW/lTX4=;
 b=Fn5U67lExvJDNiFYzksolqkamSoXHMzZc7bY7akLKTPKiJSjAsuBLvkv
 k9YHYX5NxXANPPvnDmRqlKsAnQNNjeIB5aksZ+UMQqROyj8GYwS5X+ZRq
 FS1fd+t9K4weBqCYIa1BoICInMqaDBv2gIlny+ADGaQXbgmGJuMl+E6ih
 rvCJbZzcTpF83+4izEmGBdiCGFHHUG6M1Lp8nWQ7Uia/kpB6FC3P3O7hq
 DlUQfSQpoK+oKH9J8ZfyfgecnH3MCgRWpUiWT8xjw800LJhM3//L3VH5W
 xfLoUEXmv9jgvUScoJyF8BktBZlixaurju74mYFVI4P2ldxiqidnY9PSY g==;
X-CSE-ConnectionGUID: pAbhxS7vSUKjgc+Ylx4bqA==
X-CSE-MsgGUID: /ubp5sDRRTq6Q2eawtgE7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63186271"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63186271"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:52:32 -0700
X-CSE-ConnectionGUID: X8kzDrbZSSmWKMsjkooWew==
X-CSE-MsgGUID: InIDx2zRQEC8iQ5CX9WUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="152443572"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.183])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:52:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 13:52:24 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v4 08/10] platform/x86/intel/pmt: add register access
 helpers
In-Reply-To: <20250610211225.1085901-9-michael.j.ruhl@intel.com>
Message-ID: <8baebd44-971f-dd79-cede-1e8fd5965956@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
 <20250610211225.1085901-9-michael.j.ruhl@intel.com>
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

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> The control register is used in a read/modify/write pattern.
> The status register is used in a read/check bit pattern.
> 
> Add helpers to eliminate common code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 58 +++++++++++------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 99f0e85f2de6..e11865686f2a 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -63,20 +63,40 @@ struct pmt_crashlog_priv {
>  /*
>   * I/O
>   */
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +#define SET	true
> +#define CLEAR	false

There's a risk of namespace collisions if using too generic names.

> +static void read_modify_write(struct intel_pmt_entry *entry, u32 bit, bool set)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> +
> +	if (set)
> +		reg |= bit;
> +	else
> +		reg &= bit;
> +
> +	writel(reg, entry->disc_table + CONTROL_OFFSET);
> +}
> +
> +static bool read_check(struct intel_pmt_entry *entry, u32 bit)

Despite being static, I'd prefer these to have prefixes. With the prefixes 
reading the calling code, it's trivial to discern it's an driver internal 
function whereas generic names likes will not convey the scope 
information.

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
> +	return read_check(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
>  }
>  
>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
>  	/* return current value of the crashlog disabled flag */
> -	return !!(control & CRASHLOG_FLAG_DISABLE);
> +	return read_check(entry, CRASHLOG_FLAG_DISABLE);
>  }
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> @@ -97,37 +117,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
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
> +	read_modify_write(entry, CRASHLOG_FLAG_DISABLE, disable);
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
> +	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, SET);
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
> +	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, SET);
>  }
>  
>  /*
> 

-- 
 i.

