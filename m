Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B886D3EE67
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A46410E9A7;
	Thu, 22 Jan 2026 13:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0Xse8ydv";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D171010E819
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 14:47:39 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a35ae38bdfso75385ad.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 06:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769006859; x=1769611659;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BMkS4BFW7iikoL2BjP1nG2XKvn880JyWpxnGNG3+/cM=;
 b=0Xse8ydvwg4L9X/kqPkrLnAo/DGlQco7YyGpx2vOqDkShYc4xzMqseD4ONFSUp/MRc
 TzsDeD4+gK7tCyJmbyP4FifRZPeNCwy6IQN8bozSICS3GhEHBtDgJ0zQUNTkO+S3e6A6
 XckDGbjsS8b7VzP7ADEIUBARvV7woD8Uyl/bZ70BkmjhyJW8T+otMCwdXwK9S6+JnBI4
 u1NSWPEXAIXyrp6FfuuDulQ/VlLflTZw74G7VdLj20xWzpUIBpk6JvaSObpAma9Go6sh
 uABoVwv/hCcA6Jc91ub6ROcVaJdW5tfR6LJ/GeG4JLtt9If8uMg5MlL0Ddwz32QBITAq
 EKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769006859; x=1769611659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMkS4BFW7iikoL2BjP1nG2XKvn880JyWpxnGNG3+/cM=;
 b=fcVHrqM1sfEOKi0BcUnrOAmLJFKbVEqufTVkfeWNix+2M0jREUr4WRms8cfEQn6qqJ
 /cRXowmlxWHRcjPAkviq2LKVSeUZPUwIdgKd25/c49IeOeAa0vBhCfry4fM1uxqJKrrS
 hbMlKp2zi+ALt/FtTws9RiseSmT+q+cqvtpKJBUATM4QbAaGXaJbWacIglSMJTuDrCon
 DmLalqUsyhulWwcHCTnbdnUqTclecVwRebOQLOmbeRrAZP6j9ZQbXoOwFTYO4lJGwGQj
 LlagOhkK2iuwBHhX/vcoyjRnGk8PFcLwIb4ANTkerJ14Xf1X9qksAVlG310g4kbhkQPF
 KOoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEDC0jflQwTCfwOR73Bb4auNM9t7qEt0aA1DW+NUT7tuZW8umc85bDQs74IlHhdSdWe+6BvKmovg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxVCYEgX8ACVTELhLmQT/2vJZBAFfDW1FZ79vyg6XolQaSQNjk
 ztIVHMOih5nyJAs1zMWtD6brcilYeh2gy9EDW6uZpZGSlAoqRIHnGJNsyGfl6gP2LA==
X-Gm-Gg: AZuq6aL030L0t6F5xuO/VgQUnZ0YmF2uqxSmvezfq7AVRt1PeLCQl8Ia6DQD01p2spH
 u8I2pZsaUC1Z1BFZuwxsVci6Ach8wIlXpeA+kTO7GVxcNycIxNvvtskBrFPftSWQhwcPY1aaFKA
 vXIDbko3sZUOWC8iSdvFf9nORMVIwYsq6sZ/IEKe4rG7U36kldumH4YAfLp/WamqvodhYKARiwh
 2EGHu27Zn+s74tygH+OE1jZzXJdK+4Xcix2Bg/5votoOKd2BNAVJqU8PBTHvjkAZuk0RfDRdG8n
 VpMFRy+MDfaUjzvy50lEh5pdat1J3baIC0ljPcmz08P5rJ6+pVylJn0PA8MaWdKFMpFrWDTvigO
 DbVU/BzM0vRsswDzQ4Y+G825ZkRhcFAJGZJPHSx2lhwdm8F55QUNd8cQMjBcjgQyIvBe79JojF3
 aZgfCC/nPP7lCMttakJ31X1OprEFqLbY2Vs4qo53sMoD7dAnKK
X-Received: by 2002:a17:902:dac8:b0:2a7:87c2:fcde with SMTP id
 d9443c01a7336-2a7a245b58cmr2655545ad.15.1769006858836; 
 Wed, 21 Jan 2026 06:47:38 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com.
 [35.187.245.222]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa108b21fsm15434806b3a.13.2026.01.21.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:47:38 -0800 (PST)
Date: Wed, 21 Jan 2026 14:47:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v4 8/8] vfio: Validate dma-buf revocation semantics
Message-ID: <aXDnAVzTuCSZHxgF@google.com>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca> <aXDhJ89Yru577jeY@google.com>
 <20260121142528.GC13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142528.GC13201@unreal>
X-Mailman-Approved-At: Thu, 22 Jan 2026 13:38:39 +0000
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

On Wed, Jan 21, 2026 at 04:25:28PM +0200, Leon Romanovsky wrote:
> On Wed, Jan 21, 2026 at 02:22:31PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jan 21, 2026 at 09:47:12AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 21, 2026 at 02:59:16PM +0200, Leon Romanovsky wrote:
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > 
> > > > Use the new dma_buf_attach_revocable() helper to restrict attachments to
> > > > importers that support mapping invalidation.
> > > > 
> > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > ---
> > > >  drivers/vfio/pci/vfio_pci_dmabuf.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > index 5fceefc40e27..85056a5a3faf 100644
> > > > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > @@ -31,6 +31,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> > > >  	if (priv->revoked)
> > > >  		return -ENODEV;
> > > >  
> > > > +	if (!dma_buf_attach_revocable(attachment))
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > >  	return 0;
> > > >  }
> > > 
> > > We need to push an urgent -rc fix to implement a pin function here
> > > that always fails. That was missed and it means things like rdma can
> > > import vfio when the intention was to block that. It would be bad for
> > > that uAPI mistake to reach a released kernel.
> > > 
> > > It's tricky that NULL pin ops means "I support pin" :|
> > > 
> > 
> > I've been wondering about this for a while now, I've been sitting on the
> > following:
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e4..962bce959366 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1133,6 +1133,8 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
> > 
> >         if (dmabuf->ops->pin)
> >                 ret = dmabuf->ops->pin(attach);
> > +       else
> > +               ret = -EOPNOTSUPP;
> > 
> >         return ret;
> >  }
> > 
> > But didn't get a chance to dive in the history yet. I thought there's a
> > good reason we didn't have it? Would it break exisitng dmabuf users?
> 
> Probably every importer which called to dma_buf_pin() while connecting
> to existing exporters as many in tree implementation don't have ->pin()
> implemented.

Fair point. I agree with Jason that we cannot leave this open for VFIO
and we can have a pin op that always fails.

But at the same time, I'd like to discuss if we should think about
changing the dmabuf core, NULL op == success feels like relying on a bug
I agree that it means the exporter has no mm, but I believe there should
be some way for the importer to know that.. the importer can still
decide to use the exported dmabuf while being aware.

Thanks,
Praan
