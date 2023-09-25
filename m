Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACF6CE7A89
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 09:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C9110E21A;
	Mon, 25 Sep 2023 09:03:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982D10E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695632615; x=1727168615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gjS9rT0LKGx3wKt0kLnajLw2vLivvzOd+2HMFB8d3EI=;
 b=d1QW+Wx7hhSp0DFskVs+3xUdU0ldeGW8F8cyf/Zy5mYfQbOGJw9SaA1N
 o+Fwo5F4SIsIwGhR6Y0ampHxvXXuHAZwq0rNTZjzf5u8ASGgXAz1s5gZZ
 aA4hw8keUSGd9z5Kv8+aiXMG/mVesc6dfCtzopIV9s8BZecmreEdU1IjD
 LQu/4eSnPFf7Dx1QTEWKxps8Yzq+/21PtrJDaxZa9ThHud5Zm9y4AQbzP
 Exv2pFVH2wps4NU877DoGaZB14HwLlX66EXM7jPpAtzEfQDlbb70WuWCQ
 LlokvYo/MtGv/QZQI1D03hPmQrHH+qXQaKkSyAHPPx/AzVW7isBrc6+ie g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371526366"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="371526366"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 02:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="818544248"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="818544248"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 02:03:28 -0700
Date: Mon, 25 Sep 2023 11:03:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZRFM2uqKYt5kJOLM@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925081842.3566834-3-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v6 2/5] drm/xe/hwmon: Expose card reactive
 critical power
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
Cc: linux-hwmon@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

On Mon, Sep 25, 2023 at 01:48:39PM +0530, Badal Nilawar wrote:
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> 
> v2: Move PCODE_MBOX macro to pcode file (Riana)
> v3: s/IS_DG2/(gt_to_xe(gt)->info.platform == XE_DG2)
> v4: Fix review comments (Andi)
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
