Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F7606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fazDTKVQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EA610E8A8;
	Wed, 25 Nov 2026 03:59:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE110E8A8
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795579187; x=1827115187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nj3Ho3XbHYpU8nUBZCAi8KL7perc0wBgcujwZqke9Fo=;
 b=fazDTKVQD/2zX7oUI0P3vm2AVZMUO56mHMGRHO1yIYbHgKlBNSqay0G/
 8HzwhwdQrVBTdE5OaMQiJDUhH9mvNvZJ1Xn5DluEEhtN2Y7JlECctZPDb
 AZj0nXlROw+ZlPUfbE8XSdvSfUulWZ2VouYjr9C5/aq2G/y2kkbLAwa4I
 AMhkALwQ0enFUAbK+RbjRXKuTFlUjBUJTizd4PIwUYSDGoTca8om5yooP
 1nVI9FpaNkEZ7BeOeoXCY0nZ65fS5Apdu/MCO05GN6kFYBCIi2cyR1Kzh
 l5LMQ9zUC0Imcj/KrbD/9c0AzgwXP5YYPNRqj8ipjWsjCJxEbHmKYJTqR g==;
X-CSE-ConnectionGUID: f0HiSdvBQtyfmibApmoWuQ==
X-CSE-MsgGUID: Xv6G8/EiSfS/HAWFVec+/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4365661"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4365661"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 19:59:47 -0800
X-CSE-ConnectionGUID: ImA8ifSMTJO8hpi9u2h+tg==
X-CSE-MsgGUID: 7xffYzzfQ1OGyVWqLI7SgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="13783129"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 19:59:45 -0800
Date: Wed, 25 Nov 2026 04:59:43 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe/vf: Support PCIe FLR
Message-ID: <awZdLzhQ_Kr1r8sg@black.igk.intel.com>
References: <20261124203604.467922-1-lukasz.laguna@intel.com>
 <20261124203604.467922-3-lukasz.laguna@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124203604.467922-3-lukasz.laguna@intel.com>
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 09:36:04PM +0100, Lukasz Laguna wrote:
> After VF FLR, GuC remains unresponsive for VF until PF completes VF
> cleanup. Before proceeding with VF re-initialization, reset GuC VF state
> over MMIO until GuC becomes responsive.

I'm wondering if this can be part of vf_gt_restart() to keep things
generic? Otherwise we'd end up with a lot of duct taping all over the
flow like this one.

Raag
