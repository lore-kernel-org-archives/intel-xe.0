Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D063CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 08:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C78510E109;
	Wed,  8 Oct 2025 08:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2UwPux6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C213410E109
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759910940; x=1791446940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=al6uUQ/z8xN7x6vF5ONtUjPThlROiOhgNhbrvaiUdaA=;
 b=M2UwPux6SzcPFzq4n9c/2aUkl6VrLpbZUeIg+xzKlcvBBwN+tZkX99So
 pNV/z2WaxWmDTPzUzjuaAkjAjUyQwx6SwhyzIuhyXJxZy45teXam4em4Y
 iWqsVnt/cW4JI3otslx/ISeGXqiTzvdYG97nLBWqEySuHCx9+wVgi6DfW
 KLj3X5ZH1DAF3Of2FcC92jgykzU6qcd016VcC5Fc0YiIwoN9LtuGcHTSn
 VZIDhSOWP2fNepGUsSKnsBuuKHdp9/blpNK4A1jg7ZbdGQUBKyw3NepQ/
 GGuQjELhLNYTGHcKEbM+osfKfW+b3oeYVPWiJt+NZRjcqWuVv+QYSsCU7 A==;
X-CSE-ConnectionGUID: 0E3gB03NTqGtpbxokVmOwQ==
X-CSE-MsgGUID: mwn9c9xwTma9rgRCEd5o/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62005699"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="62005699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 01:08:59 -0700
X-CSE-ConnectionGUID: W8ldCQjaSD+504EH70Ph8Q==
X-CSE-MsgGUID: R05DnoxNRJeRMZg4B9wtwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="211024732"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.169])
 by orviesa002.jf.intel.com with SMTP; 08 Oct 2025 01:08:57 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 08 Oct 2025 11:08:55 +0300
Date: Wed, 8 Oct 2025 11:08:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com
Subject: Re: [PATCH v1 1/2] drm/xe/i2c: Introduce xe_i2c_irq_present()
Message-ID: <aOYcF8syCKyl9faI@kuha.fi.intel.com>
References: <20250924200835.3143173-1-raag.jadav@intel.com>
 <20250924200835.3143173-2-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924200835.3143173-2-raag.jadav@intel.com>
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

On Thu, Sep 25, 2025 at 01:38:34AM +0530, Raag Jadav wrote:
> In preparation of wider usecases which require checking for I2C IRQ
> presence, introduce xe_i2c_irq_present() helper.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 48dfcb41fa08..25c6b8f3c0bb 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -160,6 +160,11 @@ bool xe_i2c_present(struct xe_device *xe)
>  	return xe->i2c && xe->i2c->ep.cookie == XE_I2C_EP_COOKIE_DEVICE;
>  }
>  
> +static bool xe_i2c_irq_present(struct xe_device *xe)
> +{
> +	return xe->i2c && xe->i2c->adapter_irq;
> +}
> +
>  /**
>   * xe_i2c_irq_handler: Handler for I2C interrupts
>   * @xe: xe device instance
> @@ -170,7 +175,7 @@ bool xe_i2c_present(struct xe_device *xe)
>   */
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
> -	if (!xe->i2c || !xe->i2c->adapter_irq)
> +	if (!xe_i2c_irq_present(xe))
>  		return;
>  
>  	if (master_ctl & I2C_IRQ)
> -- 
> 2.34.1

-- 
heikki
