Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C387FD377B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 18:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3B610E78E;
	Wed, 25 Feb 2026 18:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIuDPXu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6853710E78E;
 Wed, 25 Feb 2026 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772043104; x=1803579104;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6RzMctoP9cmmlLa9z9zO2tahdPeut9ktYzd4QTKtFok=;
 b=RIuDPXu4+tVy/HUCWcslx0MQnkdaPATmdlQhqu0VddVIj8XY96Xz39jh
 UPTLhikBtdUU9VbpOR1cRXQGjQtToIUKIZ/kBXo1n6YSViK3li89maHwD
 T/ig91t5k8OYEce23Vz968Kuc6+TYZMx4mJaTCnV9DVsHF5+MBxJ2gEme
 nMXJ19owqQljmPkwjti91y/OzkzktI2p0shdmS0PjpDc670iYzaErhlXw
 9PtQarhrHebQEelDYoB4OKgqfkiXjWPFUCXVfupif81u7DeG18Sgg26ag
 7EurbdRAAtjL87Ezia3QBSWOKcyXyMpv+RYdMN07m+I2SZz5+Ur7lbWAn g==;
X-CSE-ConnectionGUID: xnxuZfsUQvmm3JNJ7v3BpA==
X-CSE-MsgGUID: FfUo5ZHAThiQwNgYzsEiPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72795400"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="72795400"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:11:44 -0800
X-CSE-ConnectionGUID: hXSS+iM1SYODZPLoPH99Qw==
X-CSE-MsgGUID: FRe4OnDnRjGZLDn4kcxl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="214396457"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 10:11:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/compat: Remove unused i915_reg.h from compat header
In-Reply-To: <20260225174306.GQ4694@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260223171015.1035550-1-uma.shankar@intel.com>
 <9f4d35467196e95d548030876a7f73386ed36d79@intel.com>
 <DM4PR11MB6360D3D5EFB752BC46B8D02BF475A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20260225174306.GQ4694@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 25 Feb 2026 20:11:37 +0200
Message-ID: <09eb82885835ecea2f60c9eaba15bf58c13fb32e@intel.com>
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

On Wed, 25 Feb 2026, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Wed, Feb 25, 2026 at 04:40:23PM +0000, Shankar, Uma wrote:
>> Pushed to drm-xe-next. Thanks for the review.
>
> Even though this is an Xe patch it might have been better to send this
> one through drm-intel-next rather than drm-xe-next since drm-xe-next
> doesn't have the prerequisite display patches yet to make this header
> removal possible.  So at the moment the build of drm-xe-next is broken.
> Not a huge issue since drm-tip is fine, and drm-xe-next will likely be
> fixed soon whenever a backmerge happens, but I figured I should point it
> out.

On the contrary, I think it is an issue that warrants a revert.

It's a hard requirement that committers *always* build the branch they
apply patches to before pushing, no exceptions. CI doesn't guarantee
that at all.

With the build already broken, you can't do that, and more breakage can
slip in until it's fixed.

It'll take a drm-intel-next pull request to drm-next, and then a
drm-next backmerge to drm-xe-next to fix this, and we don't generally
want to rush that to hotfix build issues like this. The build failure
*before* pushing is an indication a backmerge might be needed, and
that's the normal order of things.


BR,
Jani.


-- 
Jani Nikula, Intel
