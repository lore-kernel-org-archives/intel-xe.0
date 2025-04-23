Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE54C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 16:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5C10E6E3;
	Wed, 23 Apr 2025 16:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+C5tmd3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4956510E6E3
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745426470; x=1776962470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l+Eo/k90yzYQtJjtxddvP7IUI6hRGbBw6xM+3tLM7As=;
 b=B+C5tmd31BdvTSkNvbhu6rpF8RfJwybwEq9NoR3iljgyJ62RTxBhslds
 CL+NKHQ/qAWenWIyoimYJZNjFhSD4gsSBdK/ZxGu5EBUhHr/JwQS4wmCr
 HDmSQxrw5imi1n0B1ghqAI/ZI3sKoQSOncq1dyC5F6FI7Aa32njHdQCVx
 PRVfg4anoHPsXSIMM/CkJHn2d19c/X35TCY2yC3k26wWpLkfYxlLCJtVn
 vDpffXx6RtnB5IYbxNsE9gPCn6BJ1AlgjaQEq1y6upjb6ujlSYDXbEJEt
 HiGeIbAv1A1aU4tIaWrXZcRp2smbHERXjAJ0WPJg+fu+4toht3weIGiWG A==;
X-CSE-ConnectionGUID: YN+onA18RlaIMYVsk5y4MQ==
X-CSE-MsgGUID: Ybe01lGzQvmZ7gHAri2Liw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47129083"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47129083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:41:10 -0700
X-CSE-ConnectionGUID: IzA4oMCKS+eB9mrVpEkt4Q==
X-CSE-MsgGUID: S+p8lT46S8WJqE81mlVREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137355252"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:41:08 -0700
Date: Wed, 23 Apr 2025 19:41:04 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <aAkYIOSfmCY-XB3S@black.fi.intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
 <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
 <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
 <csahlwfbgaxsm7rf4g5i747wftr5zet7ta434jop5vr2he5lmw@baknat76wftw>
 <aAkA1swWzrROJbqv@black.fi.intel.com>
 <34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com>
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

On Wed, Apr 23, 2025 at 09:25:27PM +0530, Vivi, Rodrigo wrote:
> On Wed, 2025-04-23 at 18:01 +0300, Raag Jadav wrote:

...

> > And all of this will take place when the user is doing a "firmware
> > upgrade",
> > and this can potentially open the door for "link speed downgrade" to
> > be
> > confused with "firmware rollback (downgrade) done for the link
> > speed",
> > which is not the case.
> 
> well, gen4 is not a firmware, but also
> 
> is gen4_downspeed == gen3 ?!

I understand it as "downgrade to" than "downgrade from".

Would you prefer gen5_downgrade instead?

> yes, naming is hard and this is why we stick with the spec names
> without re-inventing it, which only increases the confusion.
> 
> > 
> > > > > > 2. This information is for the end user and has to be
> > > > > > translatable enough
> > > > > >     regardless of what spec says about it and the distinction
> > > > > > reduces the
> > > > > >     chances of misinterpretation.
> > > 
> > > when you introduce a new term that is not known, I'd say the effect
> > > is
> > > pretty much the opposite and it can be even worse if a future pcie
> > > spec
> > > starts to use that term.
> > 
> > Agree, unless we're expecting users to be informed about the spec to
> > be
> > able to flash their firmwares. But if you insist, sure will _upgrade_
> > the
> > document ;)
> 
> I believe you meant 'update' the document! ;)

Well, I meant to use 'downgrade' but we'll be going up a revision,
so.. :D

Raag
