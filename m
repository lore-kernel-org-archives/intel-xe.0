Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3E9CF45AC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 16:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205C510E421;
	Mon, 12 Jan 2026 16:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1u3ljrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F9B10E421;
 Mon, 12 Jan 2026 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768236754; x=1799772754;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=pJUQc2r1ljRfQdwBY4HezNXZDmFjjrrCVecKtNJNBDk=;
 b=a1u3ljrNvLAtpDNMqUrRsHTI/VVA20JGAnHuN7wvb2KNqyeD/8hnbavW
 9ALMPso0nVoSDoA/jLlcT+DN26M/V5Z7zJubSBx+aXIZta+9BSSn34ZNq
 AZAczlAbnTO7LrIP5QHlUUhM5BgSLk/p20Kbx91XRmwJNF6vMZjO8X+lm
 +5D9LGrlwsCC4OpmHbXLjzdZK70xhN/AbjilY8GWjE023KivpbbrTZn63
 NZbfNn24UMxu1iclWYQqfNxp/sSZSywqmiR0bR0CWR9c9a4SubCcZ4h8y
 dSdoVVr4WupYGnUwsHvhgZu988Yhlc2xpBr9KH3HqP2kvaOPi7R72w7Lu Q==;
X-CSE-ConnectionGUID: AHQxh9Q6SXW0aSP56XvHkA==
X-CSE-MsgGUID: VrAfCowlT6euXj2FX0Pu1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69591658"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69591658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:52:34 -0800
X-CSE-ConnectionGUID: XTfRZiw8R6miooCXDRiEQg==
X-CSE-MsgGUID: /UdBfcnNTNK/GVcg/3k5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="203948444"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:52:31 -0800
Date: Mon, 12 Jan 2026 17:52:29 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx-trybot@lists.freedesktop.org, jani.saarinen@intel.com, 
 suresh.kumar.kurmi@intel.com, mohammed.thasleem@intel.com, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [CI v2 2/2] ACPI: PM: s2idle: Add module parameter for LPS0
 constraints checking
In-Reply-To: <20260110154405.2825339-3-michal.grzelak@intel.com>
Message-ID: <653b6ef6-e881-1aa7-fab1-32c8c76ee544@intel.com>
References: <20260110154405.2825339-1-michal.grzelak@intel.com>
 <20260110154405.2825339-3-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1962454917-1768236753=:2838210"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1962454917-1768236753=:2838210
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 10 Jan 2026, Micha³ Grzelak wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> Commit 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints when
> needed") attempted to avoid useless evaluation of LPS0 _DSM Function 1
> in lps0_device_attach() because pm_debug_messages_on might never be set
> (and that is the case on production systems most of the time), but it
> turns out that LPS0 _DSM Function 1 is generally problematic on some
> platforms and causes suspend issues to occur when pm_debug_messages_on
> is set now.
>
> In Linux, LPS0 _DSM Function 1 is only useful for diagnostics and only
> in the cases when the system does not reach the deepest platform idle
> state during suspend-to-idle for some reason.  If such diagnostics is
> not necessary, evaluating it is a loss of time, so using it along with
> the other pm_debug_messages_on diagnostics is questionable because the
> latter is expected to be suitable for collecting debug information even
> during production use of system suspend.
>
> For this reason, add a module parameter called check_lps0_constraints
> to control whether or not the list of LPS0 constraints will be checked
> in acpi_s2idle_prepare_late_lps0() and so whether or not to evaluate
> LPS0 _DSM Function 1 (once) in acpi_s2idle_begin_lps0().
>
> Fixes: 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints when needed")
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>

> ---
> drivers/acpi/x86/s2idle.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
> index 2a9edb53d5d4..cc3c83e4cc23 100644
> --- a/drivers/acpi/x86/s2idle.c
> +++ b/drivers/acpi/x86/s2idle.c
> @@ -28,6 +28,10 @@ static bool sleep_no_lps0 __read_mostly;
> module_param(sleep_no_lps0, bool, 0644);
> MODULE_PARM_DESC(sleep_no_lps0, "Do not use the special LPS0 device interface");
>
> +static bool check_lps0_constraints __read_mostly;
> +module_param(check_lps0_constraints, bool, 0644);
> +MODULE_PARM_DESC(check_lps0_constraints, "Check LPS0 device constraints");
> +
> static const struct acpi_device_id lps0_device_ids[] = {
> 	{"PNP0D80", },
> 	{"", },
> @@ -515,7 +519,7 @@ static struct acpi_scan_handler lps0_handler = {
>
> static int acpi_s2idle_begin_lps0(void)
> {
> -	if (lps0_device_handle && !sleep_no_lps0 && pm_debug_messages_on &&
> +	if (lps0_device_handle && !sleep_no_lps0 && check_lps0_constraints &&
> 	    !lpi_constraints_table) {
> 		if (acpi_s2idle_vendor_amd())
> 			lpi_device_get_constraints_amd();
> @@ -540,7 +544,7 @@ static int acpi_s2idle_prepare_late_lps0(void)
> 	if (!lps0_device_handle || sleep_no_lps0)
> 		return 0;
>
> -	if (pm_debug_messages_on)
> +	if (check_lps0_constraints)
> 		lpi_check_constraints();
>
> 	/* Screen off */
> -- 
> 2.45.2
>
>
--8323329-1962454917-1768236753=:2838210--
