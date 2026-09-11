Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E2DC88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 11:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAAF10E2C1;
	Fri, 11 Sep 2026 11:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nppdtVvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32D410E2C1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789125437; x=1820661437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JhG4GbTlW/bUrhXFFr8V9GnM6cwiklh9UyV8Udl/fyI=;
 b=nppdtVvWqkCsCBIymVWB4VCGEZfEMp1qw3iihqyIuba1bw5aMx8Nmrp/
 F8aJjZK/wsTfvy6yk1pxTyu/UPwXaw3WwDsu+vnsdqarvsobB1vyXMT9C
 6dlShwkI6gFh0H4q9DXkbgKOapxb1E4AtHKe/QuuJ00BVnluZLrR6+XzQ
 qHxaJ92C7meztXBrjP1fJc3qhitvkKmKhDSXxg5jj3Sn45UpfWE2KTrD+
 8l8AiAia0t0ZCUCBiWgjsekRkWExs/eptFePTceoKgx9lacQj2vsyQ7SN
 Ft6MHNWZ0maJEzNpFYlNhTEHTuHqYXiQmzQ6vRDyw44Ub4PSy3fQd7mey w==;
X-CSE-ConnectionGUID: I/ifKmjfT2GaUFSVwp84MA==
X-CSE-MsgGUID: KiviSTztRkGioVccQi9GNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89716524"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89716524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:17:17 -0700
X-CSE-ConnectionGUID: MECVZLuPRR+lN4QEz/uaCQ==
X-CSE-MsgGUID: kP16K2h0R3K4Ll8R7JVf3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="272397773"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP; 11 Sep 2026 04:17:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 7C74999; Fri, 11 Sep 2026 13:17:14 +0200 (CEST)
Date: Fri, 11 Sep 2026 13:17:14 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, badal.nilawar@intel.com
Subject: Re: [PATCH v1] drm/xe/i2c: Disable IRQ on unbind
Message-ID: <aqPjOgEgFG04B_ef@black.igk.intel.com>
References: <20260911044021.2393342-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911044021.2393342-1-raag.jadav@intel.com>
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

On Fri, Sep 11, 2026 at 10:10:21AM +0530, Raag Jadav wrote:
> Currently, struct xe_i2c is freed before SGUnit IRQ is disabled, leaving
> a potential UAF in case the IRQ is hit in that small window. Explicitly
> disable I2C IRQ as part of xe_i2c_remove() and fix this.
> 
> Fixes: 0bb78ce09926 ("drm/xe/i2c: Wire up reset/postinstall for I2C IRQ")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index d8fa68206f41..82b22c5412ba 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -324,8 +324,10 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
>  static void xe_i2c_remove(void *data)
>  {
>  	struct xe_i2c *i2c = data;
> +	struct xe_device *xe = tile_to_xe(i2c->mmio->tile);
>  	unsigned int i;
>  
> +	xe_i2c_irq_reset(xe);
>  	xe_amc_exit(i2c);
>  
>  	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++) {
> -- 
> 2.43.0

-- 
heikki
