Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF9DC54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 05:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6110ECE4;
	Tue, 26 Mar 2024 05:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVYqNGAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408EB10ECE4
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 05:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711431994; x=1742967994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eF0m+OXtCRIsterfMlejmqBgnr51w2cPnW3XBXucqk8=;
 b=IVYqNGAh6NK6LzCj04Yo0RMPbKYYzRZCHK0t4vaHxQb+Wlfjurz4Nq97
 0RI4Oje2Qee+IkKTTeVavlXD6O4LkQnkSBMbOrKKFehXOwiLFj1RdxKFg
 kG1pKVfMT+ifP1/BFSk3/foFJFSBSziJQ6xZb72fWfPMPhBdYaSieESEB
 He4hIRhBAI7vfK6uzZu03vyZPLjwehyBY0ZTMKJgEt+mm82NlrSkvYoar
 GVHPAtzRevO7m+wsAJNj8WVINN2XkGj+HrMOpcY46hPwl1UseGA/Vveim
 fh1KZDHi5AqNCcGOu4OuLbeLTWbTy5ZR4PPSzLo/Jo8rdIE2KKvxk92BU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17896502"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="17896502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15938641"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 22:46:05 -0700
Date: Tue, 26 Mar 2024 06:46:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 0/1] Send flat_ccs value in struct drm_xe_query_config
Message-ID: <20240326054602.ej4kfpliyagdfctw@zkempczy-mobl2>
References: <cover.1711447408.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1711447408.git.akshata.jahagirdar@intel.com>
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

On Tue, Mar 26, 2024 at 03:10:30AM -0700, Akshata Jahagirdar wrote:
> Currently, we don't have any check in IGT testcases if platform supports
> compression or not. Send this flat_ccs value as part of the struct
> drm_xe_query_config so that we can read this value in the igt testcases
> and proceed accordingly.
> Fixes: VLK-56136

What's sense of adding internal tracking ids?

--
Zbigniew

> 
> Akshata Jahagirdar (1):
>   drm/xe/xe2: Send flat_ccs value in config
> 
>  drivers/gpu/drm/xe/xe_query.c | 3 +++
>  include/uapi/drm/xe_drm.h     | 1 +
>  2 files changed, 4 insertions(+)
> 
> -- 
> 2.34.1
> 
