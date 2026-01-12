Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F875CF45A4
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 17:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CDF10E427;
	Mon, 12 Jan 2026 17:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOIQ6oqv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE5910E426;
 Mon, 12 Jan 2026 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768237525; x=1799773525;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=e5IAzi57ff2/e3uw+PIAYZX/s9KuJ8usqza2ZUTuiKc=;
 b=TOIQ6oqvmvErXMnvGg2pTAjPg4CIzxOiJDEQ9tRuChJG45D6B/0ZvpDn
 zxesy7s/HLZM6K4eCM4bTbiqSCWMdrsYT5SJZ/niV4c8JGFNiczzEspLw
 RVQX1qcmsFMKxDk2OiZ9vBFt4y7H7Y+AKmiXMDrCVpw3yAkZoOmZFZjJO
 0jyItLgLP+h7Gaj7DamM0aNgLjA35+TevCQTNkcbuU2uW/kvnx+s+UCXy
 qP9zs24f4uRVxigsjeMa3r8f1boVctbeajCTDOmlDFdqGMV2OzctCBsVK
 bZz+Op0tajbRUZKbDH8k0g0xfgx8qcWJZJwqEoarwFFtHwMSz2BKu6uo/ w==;
X-CSE-ConnectionGUID: Bfx850atSamuKthAQDOpDg==
X-CSE-MsgGUID: ZqZBcpt1R5W+ksMPl5QPHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73358259"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="73358259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 09:05:25 -0800
X-CSE-ConnectionGUID: J+E1339BRP2Ce8GvxnMeKQ==
X-CSE-MsgGUID: gZnrReDSQpKm/AVgzlvydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204225735"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 09:05:24 -0800
Date: Mon, 12 Jan 2026 18:05:21 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx-trybot@lists.freedesktop.org, 
 Jani Saarinen <jani.saarinen@intel.com>, 
 Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>, 
 Mohammed Thasleem <mohammed.thasleem@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [CI v2 0/2] acpi: pm: s2idle: LPS0 changes
In-Reply-To: <20260110154405.2825339-1-michal.grzelak@intel.com>
Message-ID: <4152311d-4f8c-d072-e072-326c0c1297db@intel.com>
References: <20260110154405.2825339-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="8323329-1063292613-1768237524=:2838210"
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

--8323329-1063292613-1768237524=:2838210
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 10 Jan 2026, Michał Grzelak wrote:
> These series is a continuation of [1] and tests Rafael's changes.

Haven't included SoB: tag in each of bounced patches. Corrected
the mistake by replying to each patch with my SoB:.

>
> [1] https://lore.kernel.org/intel-xe/20260109223442.2622647-1-michal.grzelak@intel.com/
>
> BR,
> Michał
>
> Rafael J. Wysocki (2):
>  ACPI: PM: s2idle: Add missing checks to acpi_s2idle_begin_lps0()
>  ACPI: PM: s2idle: Add module parameter for LPS0 constraints checking
>
> drivers/acpi/x86/s2idle.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
> -- 
> 2.45.2
>
>
--8323329-1063292613-1768237524=:2838210--
