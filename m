Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E4EC7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 09:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BFA10E9ED;
	Thu, 19 Jun 2025 09:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmC461Bt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AE510E9EB;
 Thu, 19 Jun 2025 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750323858; x=1781859858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pWWlc/dqUrAsxZzrkjTSAZEEY5tw8Uf/REXjVuf5KjM=;
 b=PmC461BtRGV5nuyA+I5ZywF0QX37S6swWFCqoDAWpjOK18tK4QeHFhpX
 F3GFh3LBRrfxrH+T98gkPky3toeaah1vye/Ba0dXoHmpuEQOI80h6Hq5W
 fNvsRCsUmZUfj++zDnrZKiSibT1TBZkDMpizedj/4Gkmt77HLrc1YXsej
 0znL/n3FzTEqy2FOn4k8DZ9zmwloykvsFhTNaOU+q6TTmgL6QlCZrhK7c
 OR76x8w3KQj/iAGlET4Iae3Y2NcEo2cOwbaXAGYnIDd97dPb0i4iHQHEO
 zofGLYGnRnwVZ8xlmzCFAHG/eAjjW/RTmJLncFUTAgZflCPcszOjkQHNr g==;
X-CSE-ConnectionGUID: 4LgfOxCzRGagb5IAbtinHA==
X-CSE-MsgGUID: U35O1g9WQ064QWl+la7roQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56393335"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="56393335"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:04:17 -0700
X-CSE-ConnectionGUID: l0+KERn3TnGqtegPsf26NQ==
X-CSE-MsgGUID: nfuhE+N2RGCt1kvmczlDHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="155151739"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:04:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH] drm/i915/hdcp: Use HDCP2_STREAM_STATUS to verify
 content type status
In-Reply-To: <DM3PPF208195D8DD47DE9A8561A7623809BE37DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250619040519.3375518-1-suraj.kandpal@intel.com>
 <9447239ea5d3bd0e42383868c3da0e5dcda0412a@intel.com>
 <DM3PPF208195D8DD47DE9A8561A7623809BE37DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Thu, 19 Jun 2025 12:04:12 +0300
Message-ID: <d844665797d267ac3f5984151ea5b052a9d523b3@intel.com>
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

On Thu, 19 Jun 2025, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> And this is now duplicated in two places.
>
> It is reading a different register

Right, *facepalm*.

BR,
Jani.



-- 
Jani Nikula, Intel
