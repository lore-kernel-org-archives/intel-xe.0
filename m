Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B51CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977AC10E3D2;
	Mon, 15 Jun 2026 12:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJEiIdLO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8B110E3D2
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781526432; x=1813062432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RJscRQYkmtIME+rcD+pnqjBPN1buZnpAkMGsjrjkCHA=;
 b=cJEiIdLOmUuNyzeAXeSbJDvOdU16F+YZc0KmhHeWfiJkEnxPF1YMZXXu
 QmLqqbvlRgUSl6BXpEwkrZhtSSpPQKggjCf4JW3VohNszQdx1VxRp2c+G
 /DDtl5wrpyXfjyF5UqqwV+2qDpF27JVoSYQbQTHlWPXs14oUe2vVMt5Xb
 yj0+O1cZlSvzdjCw9J4+4jNeSfcN+nODDR9Wb9tClBqLgmS1DV7VkD40Q
 cc2m9GchbZTYB9I+/lut2VW4NF+91CKkFnNPSd+YKwBpP72Xo7ZuapcxK
 NGbFHy1cPsG9RMv+zZm+whLwHzghn3ZkBF1a0klnbJ1jMaICmNNpluvhr Q==;
X-CSE-ConnectionGUID: kSKKBqJkR624hgZtOiOXpQ==
X-CSE-MsgGUID: NMYNGSwYQ3qPgKW8HsoJwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82004571"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82004571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:27:11 -0700
X-CSE-ConnectionGUID: d45zJcEOQT6UQD9jvrDb4A==
X-CSE-MsgGUID: sPoD1W2sSPOcsNbrX/KebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251381453"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:27:08 -0700
Date: Mon, 15 Jun 2026 14:27:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v3 2/3] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
Message-ID: <ai_vmcyzx2B7MbLK@ashyti-mobl2.lan>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-7-soham.purkait@intel.com>
 <aicuwb6lk-CoRduh@zenone.zhora.eu>
 <2d217c00-9800-4846-a99e-e8f592ef09ac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d217c00-9800-4846-a99e-e8f592ef09ac@intel.com>
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

> > > +/**
> > > + * enum xe_ras_health_status - Device health status values
> > > + *
> > > + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> > > + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
> > > + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
> > > + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> > > + */
> > > +enum xe_ras_health_status {
> > > +	XE_RAS_HEALTH_STATUS_OK = 0,
> > > +	XE_RAS_HEALTH_STATUS_WARNING,
> > > +	XE_RAS_HEALTH_STATUS_CRITICAL,
> > > +	XE_RAS_HEALTH_STATUS_MAX
> > do we need this *_MAX status? In the next patch you can also use
> > ARRAY_SIZE().
> I'd rather keep XE_RAS_HEALTH_STATUS_MAX paired with the static_assert(),
> since together they catch enum/string-table drift at compile time.

It's OK, just a matter of taste, I'd have done it differently but
this way works, as well.

> > 
> > > +};
> > ...
> > 
> > > +/**
> > > + * struct xe_ras_get_health_response - Response structure for get health
> > > + */
> > > +struct xe_ras_get_health_response {
> > > +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
> > > +	u8 current_health;
> > should this be of the type "enum xe_ras_health_status"? Same fot
> > he next variables.
> 
> The struct mirrors the FW layout and needs fixed-width types — an enum on
> the other hand has implementation-defined size.

makes sense.

Thanks,
Andi
