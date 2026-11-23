Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DAB606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L+iYIuTf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001B210E5DF;
	Mon, 23 Nov 2026 07:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC22210E5DF
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795417403; x=1826953403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9sZJdyMZZGwKHlSOX7B97tTZthL/SxKmv7OQyogvNYQ=;
 b=L+iYIuTf+T4aCSEUl1PBZ0uckK344Hm3e5A54NQBKwtjG01VcGsFZGl4
 3CumvuuHgD+dobC8M2ivoApNrN0sh/yCbJJlAZGN+ELGm7SN9xHc2TGt3
 CKCZGXg3O6qvre+D1zelI4nLqVZHg4HQjVxjxE+Z3oi9iIHC1iE1ocRMQ
 3CgObmzHXulznM7mSm65UIdeI75dvtIrPF3lSBUy5G+aNIGqqrQbfcnWJ
 bUna9uh9ICwSOEKrzr7Z3ky8uDtuYsBPfKj0AIK26Lh3UlT03Xovu6Krf
 hoKFj1buFJOi5HHC3l32MgZP/Uwt3nRtAYx8GIfp04nSDE3ZTDtx0ffJ8 w==;
X-CSE-ConnectionGUID: +h6JwQNQQwm7GmOc7xM6og==
X-CSE-MsgGUID: tYG9nJUNS4SYYVNw4LY4Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4258455"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4258455"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:03:23 -0800
X-CSE-ConnectionGUID: oN8i1/S1R5uDhwVDUZDWrg==
X-CSE-MsgGUID: yakry34yQ0mizPDayjXB+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13036456"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:03:20 -0800
Date: Mon, 23 Nov 2026 08:03:17 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 aravind.iddamsetty@linux.intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 tejas.upadhyay@intel.com
Subject: Re: [PATCH v2] drm/xe/sysctrl: Drain page offline queue on
 queue-full event
Message-ID: <awPlNXmtQu7ml26W@black.igk.intel.com>
References: <20261123063932.1061164-2-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123063932.1061164-2-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:09:33PM +0530, Riana Tauro wrote:
> The firmware raises a System Controller event when its page offline
> queue is full and cannot track further pages until the queue is read.
> Handle it by draining the queue and offlining the returned pages, so the
> firmware can resume queueing new pages.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

For the event part,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
