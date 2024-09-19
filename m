Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379BACE8D68
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 09:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C4B10E6BC;
	Thu, 19 Sep 2024 09:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5sWO7JM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529F510E6BC;
 Thu, 19 Sep 2024 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726739307; x=1758275307;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q9jrLoMaexfuBVzJWImNX6TugJBNU78fjH/gmE4GMNU=;
 b=X5sWO7JMixj92/eDPfxJE1A7tAb9PL6awe7/4mjUU7dkxwlbI0w+6gHo
 CF05C5Gm+DqM6jQEnW8cxBLUAhATBr556CjWPRLJBTj/QgRhD+Z5lX9/O
 5G+NL+hPwRwQ+XgYlxGmMkeHpyrTpALuohcsyXLs/c7vV2VkhTJXFVfSM
 yn6aaJKM8uQpQNpjCySN4SLsB3QlbI3tBYF7q4mhfaFYqZvhYkkK0WWnK
 f8F7Ig7385QzMTt0d6zhNUxtrMblyWpdB17jw86sV79F34AfJQMX7GUPm
 rv+aZe2ps+NY/4tfvaKKvl5zxOuQoc2W8r7BhCJxymP2a+bE5YOQec0+U g==;
X-CSE-ConnectionGUID: C89M6GqARXi/VNFJ+UGosA==
X-CSE-MsgGUID: PfhQ8lB9RQ2bSxswXvX9ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="13589603"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="13589603"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:48:27 -0700
X-CSE-ConnectionGUID: 8yBXjvbAQ3Kda7tOuG2yIA==
X-CSE-MsgGUID: Xh2bcs3XQ0qQFT8ccF/+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="107347801"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:48:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luca@coelho.fi>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 0/2] drm/i915/debugfs: intel_display_caps
In-Reply-To: <cover.1726231866.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1726231866.git.jani.nikula@intel.com>
Date: Thu, 19 Sep 2024 12:48:22 +0300
Message-ID: <87frpw9dp5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 13 Sep 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Strike another i915 core -> display include and call.

Thanks for the reviews, pushed to din.

BR,
Jani.

>
> Jani Nikula (2):
>   drm/i915/debugfs: remove superfluous kernel_param_lock/unlock
>   drm/i915/debugfs: add dedicated intel_display_caps debugfs for display
>
>  .../drm/i915/display/intel_display_debugfs.c   | 18 ++++++++++++++++++
>  drivers/gpu/drm/i915/i915_debugfs.c            |  6 ------
>  2 files changed, 18 insertions(+), 6 deletions(-)

-- 
Jani Nikula, Intel
