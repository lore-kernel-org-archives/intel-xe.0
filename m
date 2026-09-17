Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D26C982D2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 09:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC7A10E47C;
	Thu, 17 Sep 2026 09:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpHv4gTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051F10E47C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789638916; x=1821174916;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=GmIhGUIbp4hhVMAyPIxmUS4gllPo9slVR3Wxb4ovvbE=;
 b=QpHv4gTlV9OVM7y1m/AahWK3vS8fawFG6jLlmI1BRIdlAn/jg3t04un/
 iBJyp5h++FRmDieVjNw19a1l+TKqjvXFjxqHoZxwyA+pEwsDihhw1QXdL
 ltzbChuKMaNEd4Ji4ttPxzZuvtlLlfvUDxPbhHY8Hdw6xOrg9Ir+EGO1k
 gauWxgBqh5UuhfJzF/0u81zuZSoS0rcTxveQiaclqwQTGYdh2x6fUgIUL
 R4f7vvDDIVh1TmzDTT57LFPWWn8jARyo5l5z6FDqqbHYqo6rt95NzrGFu
 l2207wkjpIGqErCS9nw3s4HulppJ1KfNlUulEnxyeO3Knodtgy3ObDngF A==;
X-CSE-ConnectionGUID: dEyY83dmQDaTwT2QsWBY3A==
X-CSE-MsgGUID: O4WiuhGVQsKaR+0DNQRn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115581174"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115581174"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:55:15 -0700
X-CSE-ConnectionGUID: TcJcPbTsRSyRzyW4l+xnrA==
X-CSE-MsgGUID: njtQzaIeR+eX1NGiw9ZkJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275640284"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:55:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:55:06 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v9 03/20] platform/x86/intel/pmt: refactor rc with a
 return value
In-Reply-To: <20260916201139.2374531-25-michael.j.ruhl@intel.com>
Message-ID: <b5c31da5-99f4-1474-53e0-46359fbcdcd8@linux.intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-25-michael.j.ruhl@intel.com>
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

On Wed, 16 Sep 2026, Michael J. Ruhl wrote:

> Upcoming changes will include possible failures from HW accesses.
> 
> Refactor pmt_crashlog_rw() with a return value.
> 
> Update all necessary usage to use the return code.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 101 ++++++++++++++++------
>  1 file changed, 74 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 831cff743803..b6540f3a9a17 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  }
>  
>  /* Read the status register and see if the specified @bit is set */
> -static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
> +static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
>  {
>  	const struct crashlog_status *status = &crashlog->info->status;
>  	u32 reg = readl(crashlog->entry.disc_table + status->offset);
>  
> -	return !!(reg & bit);
> +	*state = !!(reg & bit);
> +
> +	return 0;
>  }
>  
> -static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_complete(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog complete flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete, state);
>  }
>  
> -static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
> +static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
>  {
>  	/* return current value of the crashlog disabled flag */
> -	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
> +	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled, state);
>  }
>  
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
> +static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
>  	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
>  

This function still contains return true and false within even if you 
changed the return type (and it "works" because of implicit conversions 
but better to correct that inconsistency).

(Found by sashiko.)

-- 
 i.

