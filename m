Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D410CCF9E3
	for <intel-xe@archiver.kernel.org>; Sat, 25 Oct 2025 15:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9943310E28F;
	Sat, 25 Oct 2025 15:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNXu7WR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE94710E28F
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Oct 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761407171; x=1792943171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FfwoOF4ylegc4Ryl0HORDzLaD8vbR6bAjEYo4oiRLjs=;
 b=SNXu7WR/ZQpwYzqv4JYMEIQqdEyTQEMil/XecQ/xZ0XQavISHK1ghIQX
 2acrMgkYA8TkecnVNIJze3aH8/wFB/dxNz8gLa1J2KK3Bpke0xZcucu92
 1h7g57jKJzBINlZ+PloMdcH7u59tHi8EvXE9dgT/oVngFf00qnxCzNAy7
 fgDlbXkCiWOSLH2SHMzGv42eBAU+TvUbnJ0/aLdW8nxlvnD2fZ1+x7DXU
 5LPIr92MKfKBS4Jo0meHvBJGNHFLxgDIzPVK8LL69qYqyTITWwysoes/v
 F+x6yWf80ITJYG/0mmPItHUACYKxEb5tz09HSQrfjOwXuriDlXUGSvdi9 g==;
X-CSE-ConnectionGUID: CNCq8wuNSNudMUd/x9LCOg==
X-CSE-MsgGUID: U/aqUuYZS0OGu9p8VWjKIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51131993"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; d="scan'208";a="51131993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 08:46:11 -0700
X-CSE-ConnectionGUID: XgfqxgwHSpOUWnM1VQk95A==
X-CSE-MsgGUID: z8076AHCRUqa7TCKA4aufg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; d="scan'208";a="184570427"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 08:46:09 -0700
Date: Sat, 25 Oct 2025 17:46:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/xe/gt_throttle: Always read and mask
Message-ID: <aPzwv9fyqnwd8MlE@black.igk.intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-3-9f36f3c8861c@intel.com>
 <aPsY9-0Uak8-g5Nk@black.igk.intel.com>
 <v2hpmt7nvj3bgkqhqbdp34hcdxum5rzcvwzvqmoj4p23a5jshg@7lpgbshqsyxi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v2hpmt7nvj3bgkqhqbdp34hcdxum5rzcvwzvqmoj4p23a5jshg@7lpgbshqsyxi>
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

On Fri, Oct 24, 2025 at 11:13:38AM -0500, Lucas De Marchi wrote:
> On Fri, Oct 24, 2025 at 08:13:11AM +0200, Raag Jadav wrote:
> > On Thu, Oct 23, 2025 at 09:56:56AM -0700, Lucas De Marchi wrote:
> > > Use a single function to read and mask the value the callers will be
> > > interested in. This reduces the risk of a caller using a plain call to
> > > xe_gt_throttle_get_limit_reasons() without applying any mask, which can
> > > return unexpected bits for future platforms.
> > > 
> > > Select which reg and mask it's going to be used according to the
> > > platform and gt type and always use that one function.
> > > 
> > > There was an odd xe_gt_dbg() when reading the status, which is not done
> > > for any other throttle/* sysfs file, so just make the status be as
> > > special as everybody else.
> > 
> > This was to debug the rather controvercial design choice[1], but discussion
> > seems have died down and this is no longer needed.
> > 
> > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> 
> I read the thread again and will think about it.

Forgot to add. If you're removing xe_gt_dbg(), you no longer need the
xe_gt_printk.h include here.

Raag

> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > Reviewed-by: Raag Jadav <raag.jadav@intel.com>
