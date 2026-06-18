Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF276CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 11:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFABB10F275;
	Thu, 18 Jun 2026 11:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZouLcfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415E410F26A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781780529; x=1813316529;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=utll+xNDZEJic4ei/dAeaoid9/l9DbkIMZvLKzXAs3Y=;
 b=WZouLcfQMRNCdZUw5+CJSRcaMOd6UF4K4vmsmicwSAXy/9bWZbzWgKJO
 jYGqRy9eE2kfBVu02wYggVBJ2Ja9gBYR4ZIBVW2Y29JkUsI1+QX5T0AX5
 yy811dA3zmUi5XdxQHayD27kzbKG4z0bQoyd+GuE9WObsifvHl0u6m6kf
 wWi7TQw8Aq8R67gfos2rPJuea+98eMeB6vdgX9P0k6+vyNQaqdln+iR9x
 OuAyGPV6mWhgaxkLJ8OxZA1rqQHwzP8ZM0Uj/3J3S3JM57RGAkP/MXxMb
 m//yZXyUaDIqDf7zsNV/rmPDKO8m7CB0jfeVZLBoN47lw8jmlwrS7zusH g==;
X-CSE-ConnectionGUID: 3wWUjItKTCe6zZcWt2LDDg==
X-CSE-MsgGUID: uHRHBp4qT/uKolHMtmfyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82509555"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82509555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:02:08 -0700
X-CSE-ConnectionGUID: K/ugE8VbTd+IaSZHC5AkqQ==
X-CSE-MsgGUID: fJvizbiEQLGGwEw+lujKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="253321034"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:02:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
In-Reply-To: <DS0PR11MB87186F6A43DCAE1F5EE4091B81E32@DS0PR11MB8718.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
 <0fbd905b226bfa9224991fa8d414edb8c94222a2@intel.com>
 <DS0PR11MB87186F6A43DCAE1F5EE4091B81E32@DS0PR11MB8718.namprd11.prod.outlook.com>
Date: Thu, 18 Jun 2026 14:02:03 +0300
Message-ID: <5e0f7bc20a9db6d20cee2803732a5898a547c400@intel.com>
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

On Thu, 18 Jun 2026, "Upadhyay, Tejas" <tejas.upadhyay@intel.com> wrote:
> Commit f597d4b2fd0d is NOT in my tree (drm-xe-next). I will need to
> see why its not in drm-xe-next may be next rebase is still not done. I
> will wait and respin, I also need to think on Matt's concern.

Please do yourself a favour and develop drm stuff on top of drm-tip.


BR,
Jani.


-- 
Jani Nikula, Intel
