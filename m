Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9481BC624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97B10F099;
	Wed,  2 Sep 2026 09:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dz9W1lqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDCC10F099
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788340244; x=1819876244;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ax8Kd5ZzvBvX6wUvgZwWCevifEf01xj1SUEC4l3ZwwE=;
 b=dz9W1lqG8cPH6ddRfcIhdJ0OrtwuIMj9g3TxFvJ0U7kCOcV+OIWAyjGe
 I12Ax+JFlinLLfsuLeSzCGI/iEQdh37eX98BPmlZBIo34wfYI4+oDmE1+
 annrFUiMsiiaLrr1yuy8EbBopUmcyIqkkq3KgGrOMJFrieHenTT19iKex
 dx+HkZoNrZhdpWwV58eFgRk+/JOiK3Vx3bIthNcRD1n3nXMPCs5WhB/Kz
 yISPL8ms1gWLDiHDnQRc8blsmqVBZzidKKTOkm9fCyx1R5BrYudhdfUnB
 PjXV9Xgef4QXvgrYdfAxxaOpzcX2xc21y8F5/czX6TbXxH/B9Qm6LoUON A==;
X-CSE-ConnectionGUID: iyiAp0LcQOeHZl2Ohybi6g==
X-CSE-MsgGUID: Jk/KhvOTTuybuVopERI/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92492332"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="92492332"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:10:44 -0700
X-CSE-ConnectionGUID: yDDX0W13SQyT5rWE4+RHqw==
X-CSE-MsgGUID: Y68kPn5fQKWRD/W9o2qS0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="274611849"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:10:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Sep 2026 12:10:35 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4 05/18] platform/x86/intel/pmt: Add helpers for callback
 info
In-Reply-To: <20260901192736.626777-25-michael.j.ruhl@intel.com>
Message-ID: <0c9f75a9-2b32-ccb6-4041-415e8d6de5c9@linux.intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-25-michael.j.ruhl@intel.com>
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

On Tue, 1 Sep 2026, Michael J. Ruhl wrote:

> Refactor some open coded checks into helpers.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c    |  2 +-
>  drivers/platform/x86/intel/pmt/class.h    | 15 +++++++++++++++
>  drivers/platform/x86/intel/pmt/crashlog.c |  4 ++--
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 402d51df834a..af7c951b569a 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -64,7 +64,7 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
>  int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
>  			void __iomem *addr, loff_t off, u32 count)
>  {
> -	if (cb && cb->read_telem)
> +	if (is_cb_read_telem(cb))
>  		return cb->read_telem(dev, guid, buf, off, count);
>  
>  	addr += off;
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 258cb460e61c..d8291a5f08a7 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -71,6 +71,21 @@ struct intel_pmt_namespace {
>  				struct intel_pmt_entry *entry);
>  };
>  
> +static inline bool is_cb_read_telem(struct pmt_callbacks *cb)
> +{
> +	return cb && cb->read_telem ? true : false;
> +}
> +
> +static inline bool is_cb_read_reg(struct pmt_callbacks *cb)
> +{
> +	return cb && cb->read_reg ? true : false;
> +}
> +
> +static inline bool is_cb_write_reg(struct pmt_callbacks *cb)
> +{
> +	return cb && cb->write_reg ? true : false;
> +}
> +
>  int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
>  			void __iomem *addr, loff_t off, u32 count);
>  bool intel_pmt_is_early_client_hw(struct device *dev);
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 142c368a60f8..32f6a7d42b8d 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -132,7 +132,7 @@ static int pmt_crashlog_read_reg(struct intel_pmt_entry *entry, u32 *reg, u32 of
>  
>  	*reg = 0;
>  
> -	if (entry->cb && entry->cb->read_reg) {
> +	if (is_cb_read_reg(entry->cb)) {
>  		ret = entry->cb->read_reg(entry->dev, entry->header.guid, reg, offset);
>  		if (ret) {
>  			pr_err_ratelimited("failed to read reg: %d\n", ret);
> @@ -164,7 +164,7 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
>  	else
>  		reg &= ~bit;
>  
> -	if (entry->cb && entry->cb->write_reg) {
> +	if (is_cb_write_reg(entry->cb)) {
>  		ret = entry->cb->write_reg(entry->dev, entry->header.guid, reg, control->offset);
>  		if (ret) {
>  			pr_err_ratelimited("failed to write reg: %d\n", ret);
> 

This change doesn't look an improvement to me as they obfuscate the 
callback present check (and does not really make it that much shorter 
either).

-- 
 i.

