Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6051BC77B7E
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 07:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C1C10E1D6;
	Tue,  2 May 2023 07:55:26 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5E10E1D6;
 Tue,  2 May 2023 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683014123; x=1714550123;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g0FyRCCiikiQvyuNavsxbmENCxRQwRaBjdxw2Ndg0iU=;
 b=NGybmO8WT5Veusq4j9Sq+9XXkQwzAbXlBw8mrN55Oufgey64tNA4/e59
 99NiWgaIYqNmbwWU4bjXkZb9y7hCFoduxt8SAiL4q1jkjXIjOStN0IRuD
 GUm5oBhRTyY7zVsCskR4sJ0KCj8lXhhrEFuRP+I0EYF1xt+BONGSy+lda
 gKnYcp1hM6WHFdqko9BkEGniBRLOkhuyA5GC4/6tOVcj5Cd3R8Qr17F+x
 Db+7cxE7Ip6kOtpLwd9MLM4pYmpt9t0ul/1CxEet3c7ORxIV9lJatDYBM
 K+UoCJwre5YRZokpaHRg2FlhsBQamXF1J8QBlDduQ8fAvBCdFi73/grXi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328708039"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="328708039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765668566"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="765668566"
Received: from xinpan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.163])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:55:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230426205713.512695-3-rodrigo.vivi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-3-rodrigo.vivi@intel.com>
Date: Tue, 02 May 2023 10:55:14 +0300
Message-ID: <878re72mn1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 02/14] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 26 Apr 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> +	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");

Drive-by comment, could use %d and xe->drm.primary->index instead of
<n>.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
