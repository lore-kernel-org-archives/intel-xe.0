Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F23C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 07:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57D510E246;
	Thu,  5 Jun 2025 07:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMqdjX3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E6610E246
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749108775; x=1780644775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mzCAyNKV95RqVp6CyZrodmOCQn4ZDmD/cfoKbOT+ATw=;
 b=DMqdjX3sPmeH0c6rDgj/6gF31cp543JCMVVj1SRD65J0SwjG2m3BADQj
 Z9Zw4/R+GTqzVlwg03b5gWxCyDuzJoN3cNqlm7dBS2s0e2zgooHMcuimX
 ELz2W1V4aAVHwWny4zQchLz/f4eDL1Iy5rrB6BwjbeAjzxSrFCqYixDKZ
 7utLuQ8ZL+r1TkF1sT+fuJUbZ899dNbZz+KeGnZgsLlnGXekixLbVrvip
 VvVsVC5+FA94vvq40+N8pCCG1AJ9o6qfdpxzZW1es2uhwCrcaOlQALHrf
 ucTSa/qU8zlXBkMl7hMLkm7yBbsOrg7DhoOTIlKtCW9Z/IRAJXI8qDi7a g==;
X-CSE-ConnectionGUID: yOA8r3L0QKeFhmJMm83tew==
X-CSE-MsgGUID: Cz3FnzeFT5WiM5EQopnZ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50329457"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="50329457"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 00:32:55 -0700
X-CSE-ConnectionGUID: 00lR4u17RlWxkUtzDBxPCw==
X-CSE-MsgGUID: f+5h8XB3SOSUW+1IUmdNiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="176383239"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 00:32:54 -0700
Date: Thu, 5 Jun 2025 10:32:50 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [bug report] drm/xe/hwmon: expose fan speed
Message-ID: <aEFIIukIcd2Od9sv@black.fi.intel.com>
References: <aEE3C2DpYkmbTPMA@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEE3C2DpYkmbTPMA@stanley.mountain>
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

On Thu, Jun 05, 2025 at 09:19:55AM +0300, Dan Carpenter wrote:
> Hello Raag Jadav,
> 
> Commit 28f79ac609de ("drm/xe/hwmon: expose fan speed") from Mar 12,
> 2025 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/gpu/drm/xe/xe_hwmon.c:1008 xe_hwmon_fan_is_visible()
> 	error: uninitialized symbol 'uval'.
> 
> drivers/gpu/drm/xe/xe_hwmon.c
>     995 static umode_t
>     996 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>     997 {
>     998         u32 uval;
>     999 
>     1000         if (!hwmon->xe->info.has_fan_control)
>     1001                 return 0;
>     1002 
>     1003         switch (attr) {
>     1004         case hwmon_fan_input:
>     1005                 if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
>     1006                         return 0;
>     1007 
> --> 1008                 return channel < uval ? 0444 : 0;
>     1009         default:
>     1010                 return 0;
>     1011         }
>     1012 }
> 
> The problem is in pcode_mailbox_rw() where we return success without
> writing to *uval.
> 
>     89  static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
>     90                              unsigned int timeout_ms, bool return_data,
>     91                              bool atomic)
>     92  {
>     93          if (tile_to_xe(tile)->info.skip_pcode)
>     94                  return 0;
>                         ^^^^^^^^^
> data0 is *uval.

Thanks for the report. IIUC xe->info.skip_pcode is set for IS_SRIOV_VF(xe)
cases and we don't register hwmon interface in that case.

Raag
