Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AEFC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 14:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8510E0C1;
	Tue,  7 Nov 2023 14:36:06 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF4B10E0C1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 14:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E7145B8172C;
 Tue,  7 Nov 2023 14:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB05C433C8;
 Tue,  7 Nov 2023 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699367762;
 bh=K3rekygBEwbjKu81yXel/MYn4q9jsZqaJD0PXd0KmRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0XgA6bHSuFP5ciVHfbpE0EVStAnHNQZTHVwV2aLr+pbP8XQS6R+bqycl+D0F3rwQH
 aLvKqL0DBp7+/ndbqkFybXn/fEGYjyupjx7owKOFkoSYrVmMYOCKIeOVkVoGBch8iv
 a9GoAyrG7Jk5g/YYuROH8HbvDv1GkILGgm40KTK0=
Date: Tue, 7 Nov 2023 15:35:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Message-ID: <2023110718-obscure-carrot-3467@gregkh>
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

That is correct, and should be fixed up, but you didn't say that you
made this change in your changelog text so I didn't know why it was
there.

> I can drop this change if it is inappropriate to put it in this patch.

It should go in a separate patch please.

thanks,

greg k-h
