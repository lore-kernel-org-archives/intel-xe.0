Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF13CF45AC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 16:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF4D10E42C;
	Mon, 12 Jan 2026 16:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3LEJ3HE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B166410E433;
 Mon, 12 Jan 2026 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768236624; x=1799772624;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=LNciimMsSO5+7Ow1MkfVdtaApRFHs0yH2rHgsk2zsJg=;
 b=m3LEJ3HEnE3bnW8IRzekHCHvcS+SsaBlFFwdxwx6yf7pquHR+7morsNY
 R3Wi7Qm49Rz0e2lYZoQRRnZEvS1BbLk3CVDTa4RTMkTbF1yV1Hz+Pa+Gb
 Md+YmIMaFqTodt60q5YTTXkueNO5HR9Ws0yVBp+go8O+fju4+V2qrU6Id
 zfQaYzrFAm8v3i0pEyLdHTrmiT9yutxNsMmZBKEAz53BF5wWJg334nUHU
 9u2XfyoT/k9Z8R1k2ypa3ZIHHM+x8vE8rOHr+TnwJ37GIXF5CPtZ988Un
 un8fvHwQpmD2aLgr1XLmfFbcRHATyOMPdb9Y+WGas36Y4kPSQFTAW6u1G g==;
X-CSE-ConnectionGUID: du9LfK12TMePI5ejNhLFMw==
X-CSE-MsgGUID: 91czjKlMTkejMi+FDanh8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80620727"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80620727"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:50:24 -0800
X-CSE-ConnectionGUID: eFG49A3LS5GfLCOHD0i+ag==
X-CSE-MsgGUID: o10JTrakTVS0oLPe3NID1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="208650760"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 08:50:21 -0800
Date: Mon, 12 Jan 2026 17:50:19 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx-trybot@lists.freedesktop.org, jani.saarinen@intel.com, 
 suresh.kumar.kurmi@intel.com, mohammed.thasleem@intel.com, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Mario Limonciello <superm1@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [CI v2 1/2] ACPI: PM: s2idle: Add missing checks to
 acpi_s2idle_begin_lps0()
In-Reply-To: <20260110154405.2825339-2-michal.grzelak@intel.com>
Message-ID: <460af095-b3ee-59bd-f210-2432e991ac13@intel.com>
References: <20260110154405.2825339-1-michal.grzelak@intel.com>
 <20260110154405.2825339-2-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-824930680-1768236623=:2838210"
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

--8323329-824930680-1768236623=:2838210
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 10 Jan 2026, Micha³ Grzelak wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> Commit 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints
> when needed"), that attempted to avoid useless evaluation of LPS0 _DSM
> Function 1 in lps0_device_attach(), forgot to add checks for
> lps0_device_handle and sleep_no_lps0 to acpi_s2idle_begin_lps0()
> where they should be done before calling lpi_device_get_constraints()
> or lpi_device_get_constraints_amd().
>
> Add the missing checks.
>
> Fixes: 32ece31db4df ("ACPI: PM: s2idle: Only retrieve constraints when needed")
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>

> Link: https://patch.msgid.link/2818730.mvXUDI8C0e@rafael.j.wysocki
> ---
> drivers/acpi/x86/s2idle.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
> index 6d4d06236f61..2a9edb53d5d4 100644
> --- a/drivers/acpi/x86/s2idle.c
> +++ b/drivers/acpi/x86/s2idle.c
> @@ -515,7 +515,8 @@ static struct acpi_scan_handler lps0_handler = {
>
> static int acpi_s2idle_begin_lps0(void)
> {
> -	if (pm_debug_messages_on && !lpi_constraints_table) {
> +	if (lps0_device_handle && !sleep_no_lps0 && pm_debug_messages_on &&
> +	    !lpi_constraints_table) {
> 		if (acpi_s2idle_vendor_amd())
> 			lpi_device_get_constraints_amd();
> 		else
> -- 
> 2.45.2
>
>

--8323329-824930680-1768236623=:2838210--
