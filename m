Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CC2C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 08:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BBE10E4D4;
	Wed, 13 Aug 2025 08:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhttpafF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF6C10E4D4
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755074895; x=1786610895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vrWFpPkqO7UhMaBH8TYqpGoK1AMHaRP1+ZcHkug4jx8=;
 b=BhttpafFW0zHkTxyMoikAKOn0XcwNOLRUe26WhhtkeeMFIEbkmxPySAf
 hlvKOg0MwoUdUegm0Ak+lFxAepr6IjxaYkXOJaBQQDmx8QmDIITiASZjD
 OCLxSdgCpMPayJpnINwudAdi//yoP3CIn8LffvkSCZLZx+Z+YwpUQXjE4
 nTvjVwTjJ6SBb54V1/yvcS/rloJ2Attviq0rVzNVFi3JUM3j8cyRk19LG
 snDOm7evw3BLO307Wjrxh6jgl9f4EXoNp9nbJm5j9XZSoTdRoV7HTw17F
 HTmYoIvhmrJoLs6arfYDqw1P3q5ya0p1KhtIb2UZel1yPGAxSTaLq6/Es g==;
X-CSE-ConnectionGUID: ZKdSDvq+R2mVbmVKurdOCQ==
X-CSE-MsgGUID: Br/y119aTAawXV3U2FprJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61208718"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="61208718"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:48:14 -0700
X-CSE-ConnectionGUID: I4Fv0FRERnySeeCS6/0m2w==
X-CSE-MsgGUID: Xc9H0EsKTUWQ9pOm1mZSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166789803"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:48:13 -0700
Date: Wed, 13 Aug 2025 10:48:10 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/xe/i2c: Introduce xe_i2c_present()
Message-ID: <aJxRSmyswbjpyE_B@black.igk.intel.com>
References: <20250812122646.1178231-1-raag.jadav@intel.com>
 <aJs8F1gFEhKszBD1@kuha.fi.intel.com>
 <9e87c59e-de7e-478b-8916-ba25a24c6f37@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e87c59e-de7e-478b-8916-ba25a24c6f37@intel.com>
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

On Wed, Aug 13, 2025 at 11:28:31AM +0530, Riana Tauro wrote:
> On 8/12/2025 6:35 PM, Heikki Krogerus wrote:
> > On Tue, Aug 12, 2025 at 05:56:46PM +0530, Raag Jadav wrote:
> > > In preparation of wider usecases which require checking for I2C
> > > controller presence, introduce xe_i2c_present() helper.
> > > 
> > > Suggested-by: Riana Tauro <riana.tauro@intel.com>
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > LGTM. FWIW:
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_i2c.c | 18 ++++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_i2c.h |  2 ++
> > >   2 files changed, 18 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > index bc7dc2099470..6534ec5de6dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > @@ -146,6 +146,20 @@ static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> > >   	fwnode_remove_software_node(i2c->adapter_node);
> > >   }
> > > +/**
> > > + * xe_i2c_present: I2C controller is present and functional
> > > + * @xe: xe device instance
> 
> '-' instead of ':' according to kernel-doc guidelines

Which means this needs to be updated file wide, but weirdly the doc parser
seems okay with it.

scripts/kernel-doc -v -none -Wall drivers/gpu/drm/xe/xe_i2c.c

> With that change
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Awesome.

Raag
