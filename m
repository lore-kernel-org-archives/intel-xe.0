Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8080CCCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 08:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4631610E70A;
	Wed, 22 Oct 2025 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="qLcz8g00";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCA010E6EA;
 Wed, 22 Oct 2025 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ekrlHcjYC4m+Xa92FKOsdA1s49hcSWsjk1pkcgl5E+k=; b=qLcz8g00L1gzbpYWiRi/cu4S1p
 usSj8RVOMmWMZgf4y2wbCSdJhgMsMX1N73GTCjukUVhY6b6sJmzuCtQ1q+PdvNK2j3jJ6gkdxrXUD
 4PHLPPkxikg13WgqYYIy2yii8vwE3DtXYc4GizGh4pptGBzuuvGcRzWz5L7vzyBJ7fmkLphcp5BbH
 xSkrzJDZOfLNWaEG0/5MoKNxcgKLDjb1T2lO9Stgd1pGTOTVWKWWdvpLFwblsY4hSIqhZzbD9aJyk
 dReYdVT2/Rwq3bgM4jL0y6MXDSts9kssqRURqwMz67+sQuXFCprDicW1aGK+k9N6jTXdsc1bSXx/Q
 kK4o/EYg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vBUcE-000000029rJ-20Q7;
 Wed, 22 Oct 2025 08:54:42 +0000
Date: Wed, 22 Oct 2025 01:54:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver
 for Intel graphics
Message-ID: <aPib0tHn1yK9qx2x@infradead.org>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-27-michal.winiarski@intel.com>
 <aPiDwUn-D2_oyx2T@infradead.org>
 <ilv4dmjtei7llmoamwdjb3eb32rowzg6lwpjhdtilouoi6hyop@xnpkhbezzbcv>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ilv4dmjtei7llmoamwdjb3eb32rowzg6lwpjhdtilouoi6hyop@xnpkhbezzbcv>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Wed, Oct 22, 2025 at 10:52:34AM +0200, Michał Winiarski wrote:
> On Wed, Oct 22, 2025 at 12:12:01AM -0700, Christoph Hellwig wrote:
> > There is absolutely nothing vendor-specific here, it is a device variant
> > driver.  In fact in Linux basically nothing is ever vendor specific,
> > because vendor is not a concept that does matter in any practical sense
> > except for tiny details like the vendor ID as one of the IDs to match
> > on in device probing.
> > 
> > I have no idea why people keep trying to inject this term again and
> > again.
> 
> Hi,
> 
> The reasoning was that in this case we're matching vendor ID + class
> combination to match all Intel GPUs, and not just selected device ID,
> but I get your point.

Which sounds like a really bad idea.  Is this going to work on i810
devices?  Or the odd parts povervr based parts?

