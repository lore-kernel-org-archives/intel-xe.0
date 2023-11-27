Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D109AC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 13:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EAF10E2A1;
	Mon, 27 Nov 2023 13:54:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F48410E2A4
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 13:54:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B08C661244;
 Mon, 27 Nov 2023 13:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1475FC433C9;
 Mon, 27 Nov 2023 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1701093258;
 bh=ogCda4IEnDbNwVjhJVW41RiF6AQ3B1fNwlkaBmmQ3rU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FBcSYuPWTlZjyqzxwZXmZSuDeaMcwQtlYYSAQGq0iLf50ff8CbHDviDKIw2qbzL1d
 u0J8KcptauMCV9s8Hm3wK8XZxjq5zFe6F2JNLDba14mB8BrlFSGh9sYf2z1qmAw1wD
 K8ORd9fh5q5COdIT3wKLBA8O2aI/OmtqGPcenvlE=
Date: Mon, 27 Nov 2023 13:32:47 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Message-ID: <2023112729-quench-device-397c@gregkh>
References: <20231107134606.316651-1-alexander.usyskin@intel.com>
 <20231107134606.316651-6-alexander.usyskin@intel.com>
 <2023110700-emptier-retrain-08fd@gregkh>
 <CY5PR11MB6366D1F5EB27DA07628B42DCEDA9A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366D1F5EB27DA07628B42DCEDA9A@CY5PR11MB6366.namprd11.prod.outlook.com>
Subject: Re: [Intel-xe] [PATCH 5/5] mei: pxp: add dependency on Xe driver
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Winkler, Tomas" <tomas.winkler@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 07, 2023 at 02:26:17PM +0000, Usyskin, Alexander wrote:
> > 
> > On Tue, Nov 07, 2023 at 03:46:06PM +0200, Alexander Usyskin wrote:
> > > Optionally depend on either i915 or Xe drivers.
> > >
> > > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > > ---
> > >  drivers/misc/mei/pxp/Kconfig | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
> > > index 4029b96afc04..d9ae5483567f 100644
> > > --- a/drivers/misc/mei/pxp/Kconfig
> > > +++ b/drivers/misc/mei/pxp/Kconfig
> > > @@ -1,11 +1,10 @@
> > > -
> > 
> > Why this change here?
> 
> I've been told that SPDX should be the first line in the file,
> but here fist line is an empty line.
> I can drop this change if it is inappropriate to put it in this patch.

It should not go into this patch.  Remember, each patch should only do
"one thing".

thanks,

greg k-h
