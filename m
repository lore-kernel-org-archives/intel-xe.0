Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D388CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 05:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B685A10E9D1;
	Fri, 24 Oct 2025 05:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXtuWHD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941BB10E15D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 05:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761285595; x=1792821595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cH2kOcJtAoVZxuUBo4l/1POSHIdQpXYypoSVE+TMgGI=;
 b=KXtuWHD5S56kt8tWQBGVmixOaQRIwG2+9BoSAuwrwgEdyXKXL73J+oY6
 sHGcJcPO0WFFGBo1hEIwpwUS26o1Heh5/WuMjC4jDTAPsGm1+7dX0VCAo
 wIRYWeLvfd+XdSZ07ehfFcjMHz1ICg3bNTtZFkfHRPDc+i8YqEdzudMc7
 SWXi4tIPxpNOjfnWu5+/1ZWDdpgBKJXvoIWa0wGNkhXak1dsLeS9t50G5
 CJxR44Knp6Qttw+1J45z7lXZkPEUrsGGuIR8dfFN2pPkTT4jte8gkNcX2
 5Q4c9/u4NKWL/+eUkpbYzrxde3Xqw39748R1/Bw7mdgYju6rG6EAW4TXb w==;
X-CSE-ConnectionGUID: k2OMHbkXS7e8etbh5KSuTQ==
X-CSE-MsgGUID: gdEcsSSFQKKu0YqyJZDRqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51041761"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="51041761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 22:59:55 -0700
X-CSE-ConnectionGUID: gJdB/3acTyS67oTYCL/mYg==
X-CSE-MsgGUID: wvaDCYNCTdmDHpfj0vxe4A==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 22:59:54 -0700
Date: Fri, 24 Oct 2025 07:59:51 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/xe/gt_throttle: Tidy up perf reasons reading
Message-ID: <aPsV15pO48jtW1cJ@black.igk.intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-2-9f36f3c8861c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-gt-throttle-cri-v1-2-9f36f3c8861c@intel.com>
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

On Thu, Oct 23, 2025 at 09:56:55AM -0700, Lucas De Marchi wrote:
> There's no need to be so verbose with two functions per bit:
> read_reason_xxxxx() and reason_xxxxx_show(). Drop the later and just use

former

> a new is_throttled_by() that receives the mask as parameter.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
