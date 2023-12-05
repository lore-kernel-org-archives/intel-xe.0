Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D69BC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7810E622;
	Tue,  5 Dec 2023 22:01:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA37510E042
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701813683; x=1733349683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lbicuYdZpOgraJVTMU8FQXYG3KHw40FBkI/lNfnN5Qw=;
 b=L6XI6tgkzeY4UvjxwXSjtq9SLHp2tNpCBFWL/HyO315Q1HCQIt95dB2y
 25HZNwWEAvLzFzkUPdJKcHSsAlkIlDzmKYrTRd5iQezwZz3Xd/3wFZVJI
 bfZn6t2ZxjvBTh89IfCk3KawpI0Sb9sWK4p4MCAaodrvFCa+EQ/OHeG8+
 3mZ/wRlBNkSVzlF6LJRrygp7CiX+3fIWkT8heawgCCkTUZCeYKp69TSjj
 6BlnRwklfAD7o7oxqe6Y48zwXaSZVDyiwkHpc+2LHCKoUJEqMUb4b4pZ3
 nzRWQXC2kst1f/Rn99VOd0lh00jmxJqIkvJyUARPOG5tWnZpUY+auKro3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12683315"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="12683315"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102599073"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="1102599073"
Received: from ckochhof-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:01:20 -0800
Date: Tue, 5 Dec 2023 23:01:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZW-drmtQSKZC--M9@ashyti-mobl2.lan>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
 <20231204053709.30013-4-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053709.30013-4-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe: Avoid any races around
 ccs_mode update
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Niranjana,

On Sun, Dec 03, 2023 at 09:37:09PM -0800, Niranjana Vishwanathapura wrote:
> Ensure that there are no drm clients when changing CCS mode.
> Allow exec_queue creation only with enabled CCS engines.
> 
> v2: Rebase
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
