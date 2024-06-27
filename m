Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415A5C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 18:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C1910EB1F;
	Thu, 27 Jun 2024 18:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKcftwRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD02810EB1D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 18:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719514419; x=1751050419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0fW4huYuejUxm+M0I+3TTAMDrxBHd4I492jU3kdRamQ=;
 b=VKcftwRF4xVfWyJoA2Hp6nrN2e3AXVD9X+ZyLRQNX3vzq094v4dKkMDH
 bS9QVksuD1wz2A9kSgzw5HBJBw5hMpMU6UkJnw/X0CgKmWmRZGXvDJHxv
 HGxqaRWveKlnOyy2mquZh+xGzvgfqa+Mj9kscFRorLxlZNdcGzsXAUSqJ
 oT7cSzDGCOETm5pgqQ0rqexSp+2Lmc4gEdXYK+P1CbZasobP6lxu8+1ON
 mUP7jRlNKuBZG/qMw5f3spH9ELnzQtBWHsX3TczgsMYICLm9e+lvZXFpm
 hHuUD5ofVHRmbvGr0UoLJz3yUAwzlCzfn/MmygN4XjdPMVTzXaVdah7zT w==;
X-CSE-ConnectionGUID: 0RbcbM5MRMyJRwA7H5Nq8w==
X-CSE-MsgGUID: MdUtloR0TAWUQt1DFKWpEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16895097"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16895097"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:53:38 -0700
X-CSE-ConnectionGUID: up5d3p40QNaUaQ8txuRwVg==
X-CSE-MsgGUID: MHNl3dsSRHqrrVC2KnARSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="82025862"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:53:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v3 0/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Date: Thu, 27 Jun 2024 11:52:58 -0700
Message-ID: <171951433802.770280.9188868497591995447.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626170746.2926011-1-karthik.poosa@intel.com>
References: <20240626170746.2926011-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 26 Jun 2024 22:37:45 +0530, Karthik Poosa wrote:
>  Removing xe_hwmon_process_reg as per review comments from Lucas in
> https://patchwork.freedesktop.org/patch/587830/?series=131765&rev=7.
> 
> It was reviewed as an umbrella function which can be avoided.
> 
> v2:
>  - Rebase.
>  - Improve commit message of patch and cover letter. (Badal)
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
      commit: f4efd274d93b5000efc58bbfa14f8f863a57642d

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
