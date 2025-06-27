Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F23C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 10:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDCA10E9C6;
	Fri, 27 Jun 2025 10:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBFf+IEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F9510E9C6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751020599; x=1782556599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F+uRNln6GKUDwBvy95ZRcxSahVIFgheNcF0YXMwj5YA=;
 b=hBFf+IEC4+HCAZ1V5QYeV5blp0dds7HdBATDgReWPktpHTVu+2RAGTjL
 XQQfA/sPm6QhKuccBqjN4H4am3cWS/hIGKEdYwKqiMQelYMTA3bCQbChN
 tuPBszG7w9q4XrFF/elUqlLXP8itg/VxVXUWwO7qXYUeDNd1W4PVJe6kZ
 hN2WWchUp7o/tEkgmcJi2mySdHEXe6GGzKy7ud16xmgsEjf7EKetdvjSx
 8TkZakD6iRAuowIaq/JgC4uNow1t3DtKOe/kuHRBW47Yh2rgtU3ICoE2+
 b7NhNc+Rk7pGbrAXXXckIaCRRle6OA3JBbtppKzVVvZhu7rRilOAyTK7P w==;
X-CSE-ConnectionGUID: Ja+a+kgMSgaCG5t4MGJILA==
X-CSE-MsgGUID: SEyHvJWoSAin9Wj3FKN6Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53455546"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53455546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:36:39 -0700
X-CSE-ConnectionGUID: l6OZEQAVQfyxuEWK9z9ljg==
X-CSE-MsgGUID: avz7HfigQ52NZ1nUh6WloA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="189967185"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa001.jf.intel.com with SMTP; 27 Jun 2025 03:36:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 27 Jun 2025 13:36:31 +0300
Date: Fri, 27 Jun 2025 13:36:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe/xe_i2c: Add support for i2c in
 survivability mode
Message-ID: <aF50L3QcyJQ6VRxQ@kuha.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-5-heikki.krogerus@linux.intel.com>
 <aF1YGk2TNda9r32o@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF1YGk2TNda9r32o@smile.fi.intel.com>
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

On Thu, Jun 26, 2025 at 05:24:26PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 26, 2025 at 04:56:09PM +0300, Heikki Krogerus wrote:
> > 
> > Initialize i2c in survivability mode to allow firmware
> > update of Add-In Management Controller (AMC) in survivability mode
> 
> ...
> 
> > +err:
> > +	/*
> > +	 * But if it fails, device can't enter survivability
> > +	 * so move it back for correct error handling
> 
> While at it, add a period at the end.

OK.

Because of the vacations I'll send v5 already today. There is still a
failure report from the CI system that I'm not able to interpret, but
I think it's happening because the I2C endpoint is not accessible on
every GPU. I'll try to solve that by limiting this to BMG for now like
it was originally.

thanks,

-- 
heikki
