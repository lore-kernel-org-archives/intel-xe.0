Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977B8C5B572
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 03:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403E410E112;
	Tue, 25 Aug 2026 03:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UD6SEQ2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD45210E112
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 03:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787629688; x=1819165688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ynybgv7A+W1fp7KTrZunT26NYoDJCixA6pNkrbvhQ9Q=;
 b=UD6SEQ2nNYChEzBcAo0cMYY0kJcCXpNlMXJO3ajYEA9lkZe+XAXOZKc4
 W9ShRkQgeIpmD7h0eWKG6d2Q4HNAdDiTWh+VvElPpWbXdJFBXPH2ocGUs
 JGz963g1ZRpLEdfiZHgcv9P1Zx4Lt1EyGLPoDLBc1eitl8FKznbkSEsNj
 EobaW4Kzo00w0T1gkAroajv6ZQpESrvNwudF13BQj8hHZKuwAlxoMe2Eq
 FVkwPBwkW4syp6zKm2Ep3JqmY5qjDDUgoUUedHDRa4O6bbqHPt8Ljp26v
 gzKrhmPUM+Rdbl51/a6TVDlVz86VsIMulCRgnUyy+C9SE/hFnJrGKBhAV A==;
X-CSE-ConnectionGUID: dSWuVrQkQe+ChGQwlkEkTg==
X-CSE-MsgGUID: jE2kOQABTleAQTcCP8ztOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88146670"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88146670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 20:48:07 -0700
X-CSE-ConnectionGUID: kQc/aVQyR0ep32AfgPUDfg==
X-CSE-MsgGUID: QcoA7d+TTNWlxJsbrXM2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="292024231"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP; 24 Aug 2026 20:48:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
 id CB82F99; Tue, 25 Aug 2026 05:48:03 +0200 (CEST)
Date: Tue, 25 Aug 2026 05:48:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 1/3] i2c: designware: Global register definitions
Message-ID: <20260825034803.GJ893316@black.igk.intel.com>
References: <20260811121008.1493015-1-heikki.krogerus@linux.intel.com>
 <20260811121008.1493015-2-heikki.krogerus@linux.intel.com>
 <aoyb0WYzCd-DEIWC@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aoyb0WYzCd-DEIWC@intel.com>
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

On Mon, Aug 24, 2026 at 03:30:25PM -0400, Rodrigo Vivi wrote:
> On Tue, Aug 11, 2026 at 02:10:06PM +0200, Heikki Krogerus wrote:
> > Moving the register definitions to a global header file
> > include/linux/designware_i2c.h. That removes the need to
> > duplicate them in the adaptation layers for this driver
> > outside of drivers/i2c/busses/. There is at least one of
> > those in drivers/gpu/drm/xe/xe_i2c.c.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Suggested-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Andi, Mika, are you okay to get this merged through drm-xe-next?

Sure.
