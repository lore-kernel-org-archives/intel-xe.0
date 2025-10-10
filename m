Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D98CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 10:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4E710EBA8;
	Fri, 10 Oct 2025 10:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIGaCwXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F84F10EBA8
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760093416; x=1791629416;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ADRsOvW/6PJoz0buF0Naq76hA0hjVacIp3nkcoFnj+Y=;
 b=aIGaCwXkCJpZW1vNE09f5ysv43atUtwXGoksefR+Ubvb3lAgRUEC/B7u
 PHCF8nKvdXVNRkGCF4yEtnbp+J3yDGbIsq7PWnJ4ptWWf1Q6tV4b41M8+
 f7BJSeFxCjYzhrPFxls0CeXys5zMgc90nfXSH9m0+B+3ZE0ynDNLNvQXK
 MFMWV8yyw2/rKD2gND5+YsmPe8E3gVtVPaqNQ1M5qbmwRc9VTxQ8kGJ3L
 JxSRWErvfjBaKh4WIX5yCHGRI7rcuAIynOosJqG/HKWJUgVzg8Mq5W1RI
 BAEzBjSfQaE0qnJLsyAbjxfqUQITrhOLWiCCPgNM83rP/bN8W4EJ1pe9z g==;
X-CSE-ConnectionGUID: VPEGcpMhSsyq1ORk6jaPlw==
X-CSE-MsgGUID: 7Mcrsi/xTZOFPktTb1TsLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49873143"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="49873143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:50:15 -0700
X-CSE-ConnectionGUID: d1r6dYr2T16YkNn6WZhg2w==
X-CSE-MsgGUID: K1J0S8KXRgiNOzc/HUQYiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181382816"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.168])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:50:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 06/23] drm/xe: Move 'has_flatccs' flag back to
 platform descriptor
In-Reply-To: <20251007204829.1468209-31-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-31-matthew.d.roper@intel.com>
Date: Fri, 10 Oct 2025 13:50:11 +0300
Message-ID: <dc7266763823a6b8876dc0d6e9cfa6bb0297d999@intel.com>
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

On Tue, 07 Oct 2025, Matt Roper <matthew.d.roper@intel.com> wrote:
> @@ -604,6 +605,8 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_fan_control = desc->has_fan_control;
> +	/* runtime fusing may force flat_ccs to disabled later */
> +	xe->info.has_flat_ccs = desc->has_flat_ccs;

Related, but not specific to this patch:

I'm looking at bspec 59255 and it seems to me the fusing is about CCS in
general, not about aux vs flat.

Should the runtime fusing be separated from has_flat_ccs? Am I missing
something here?


BR,
Jani.

-- 
Jani Nikula, Intel
