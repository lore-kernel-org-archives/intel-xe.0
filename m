Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A8FEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 10:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4366510E5D9;
	Fri, 16 Jun 2023 10:06:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391A610E5C7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909861; x=1718445861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KbSSDSrvFh+mbUXuD7130U1W3KIse5HIWrxIsRFrXRw=;
 b=YeqZ6UNi+DEiFEYACtfZBmsGsVedx3eRlE5FWLOyEqTvyWHU+oLhOnrl
 QJKVZ+Czgfg8zZ9w0aA8zTHDGXwtKQUl4uZKx963ES+hpz0ZCAjsSN+Kn
 /OVC8lUsWrn3ZHWRW1qS9S0gPNb13CaIbnwJpahhooEXc5rNe6WRX1mHr
 8O6pnWv2wBefFvon8gD2xdcqbEme4C8gYhzJ98Rw8zVmiMmCf6QonjUpY
 TcpJrNMOaW1UM/VXtxpBNKDlZmJhhs+ymQr8lcwqjsAr8DIrs0uS3neW9
 fTtPc1HIjXDjPWF532JiIXwVa2wtldQ250LJECvouCD/xkG4JEPODPrF7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339506417"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="339506417"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712801990"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="712801990"
Received: from vyashin-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.124])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:04:16 -0700
Date: Fri, 16 Jun 2023 12:04:13 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZIwznalBqpRRUaGb@ashyti-mobl2.lan>
References: <20230616092521.3862926-1-riana.tauro@intel.com>
 <20230616092521.3862926-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616092521.3862926-3-riana.tauro@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: joonas.lahtinen@linux.intel.com, vinay.belgaumkar@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

On Fri, Jun 16, 2023 at 02:55:21PM +0530, Riana Tauro wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Add the registers to get C6 residency of MTL SAMedia and
> C6 status of MTL gts
> 
> v2:
>    - move register definitions to regs header (Anshuman)
>    - correct reg definition for mtl rc status
>    - make idle_status function common (Badal)
> 
> Bspec: 66300
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Looks good!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
