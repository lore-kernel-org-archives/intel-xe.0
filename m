Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DEDD3EE6C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E3810E9B3;
	Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="buP14dfE";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6C10E7D5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 14:22:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2a0d06cfa93so75655ad.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 06:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769005361; x=1769610161;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Df9DnST7C0sPqC8cKGnMiT7cxfRi0XBTWHY9JjLQ7zk=;
 b=buP14dfEBR6sdmQ6ARRBNj1DQtd7iiSjOMwtgEQudS2oCVri+dH6m6rH6gPsngQ4yn
 gVYhCEoqRoGU8lO0s6wDwrWTjGXOa3Cwz9RcUfJl8UtuMpbUXjY0BIPvZBxCmNp5wdbM
 dwqqbfZ0iYHScBLltbRAeEAh5fnZlCz2fsuPaVXg1dN8+a1fvN+v7JS8Cpk6SqWnd7Ao
 H7Rjznu/8LBUvNCKPZ5pRTL9Qn3N0AGta+H2c/ZAu+hUVe8VwrZ6vFnBP65LTDWBYVNQ
 a5jrBk4YxVMkr+tkWwXfbDfEWkGKjFZyyLngfSt3ZNvJBKb7NnSytZKZpPRepeQYG99f
 N5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769005361; x=1769610161;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Df9DnST7C0sPqC8cKGnMiT7cxfRi0XBTWHY9JjLQ7zk=;
 b=oqsQ3RtoTf6u6IWTsjTzeBxP6aEJzXWNhkbveHSyy/Ok0CIhgggNyVhIR/T1BDPwRP
 LwKUU5IcIIl9PmP0lbKiMzjee7Rnqn2PO5pz5GSY0Thz9tfUgAnThpRGYNGQc9ONN6/k
 AaTKQ3jeP6B84vNqNL3qdL+Zl3sRLRQykZGRwj6g93Td2fVs5JqOalohu2NQhWr6iy3q
 3hVomoufILCilazyoMB7p/JqMRoYOWb8ogNw3GeFUqbvMfuQUitgmvCnt1bo5c+if/1G
 UPinaEbRpICvLvicgNjwY9Oj4gFtnUdWcm2ImQQohH2M4HAyqGJpM/51cZN8a7+rVBLe
 dbqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyQarrxCN86x2rPcSBrOCJWkiW+1DksA733M2SAxFbKGWbPUPi0IJdX/RlUqWge1PmkRmiAS7yNw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW3FkGfqHYn9yp4o/0bGPXXtpEwI9XyvdyrHxw1A04X0uMSAoR
 gJeDgI9+7yiBdu2+1g3tKCFWfQo4lyYw5+MbYiBYYDbo7jFD2oLxHmlak2EAtVizTw==
X-Gm-Gg: AZuq6aJQju1oZPgQPuOgbuffGWDT0a59SO/jYtOeZAXoHyB2wWiuzF0mPpWzd5AHIO8
 zKESIwVEY1HAd+gkwaMvsvZBMWyvLeJKEQbmZ8qoGgLoGzKfovD3sKWk/xPF8PLcbSfNPLc5tLN
 h217euB2hsFVf2FBqFsbD3BYaHlEkPKCG7DJBCjV8bfgKr6b8lrHqdEXrqTzGulpOrLFSxUPpTy
 u6xPH2i5QqmNprYJ8f9cCtrt7bnkaiLF+s9Tvlpq0RPJ79yd/GL4NlPHfx74mvGcVpvpPVAks+C
 Te78HtNL5oVxA7q7Q7L78ywXkbX5QK/vCyzKy+HKCYmqPllEFpjKrlPJeh2JrMsr40i3ExR3D5Q
 X8NwbaOloW0DjLlvjLocqyOR7s+9EsyWnYGOUJUwaPtQFBmGzJUBPQ4phur0PJM93bOWDhZSFtv
 izrZ5XHNRIW7Ft5UPCNMBpR3p5uEN6bCVYOBccjjI8c9VSjIQ7
X-Received: by 2002:a17:903:1c8:b0:295:5405:46be with SMTP id
 d9443c01a7336-2a7a23cc8f3mr2519245ad.1.1769005361111; 
 Wed, 21 Jan 2026 06:22:41 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com.
 [35.187.245.222]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190ce6a9sm159451235ad.34.2026.01.21.06.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:22:40 -0800 (PST)
Date: Wed, 21 Jan 2026 14:22:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
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
Message-ID: <aXDhJ89Yru577jeY@google.com>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121134712.GZ961572@ziepe.ca>
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

On Wed, Jan 21, 2026 at 09:47:12AM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 02:59:16PM +0200, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Use the new dma_buf_attach_revocable() helper to restrict attachments to
> > importers that support mapping invalidation.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index 5fceefc40e27..85056a5a3faf 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -31,6 +31,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> >  	if (priv->revoked)
> >  		return -ENODEV;
> >  
> > +	if (!dma_buf_attach_revocable(attachment))
> > +		return -EOPNOTSUPP;
> > +
> >  	return 0;
> >  }
> 
> We need to push an urgent -rc fix to implement a pin function here
> that always fails. That was missed and it means things like rdma can
> import vfio when the intention was to block that. It would be bad for
> that uAPI mistake to reach a released kernel.
> 
> It's tricky that NULL pin ops means "I support pin" :|
> 

I've been wondering about this for a while now, I've been sitting on the
following:

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a4d8f2ff94e4..962bce959366 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1133,6 +1133,8 @@ int dma_buf_pin(struct dma_buf_attachment *attach)

        if (dmabuf->ops->pin)
                ret = dmabuf->ops->pin(attach);
+       else
+               ret = -EOPNOTSUPP;

        return ret;
 }

But didn't get a chance to dive in the history yet. I thought there's a
good reason we didn't have it? Would it break exisitng dmabuf users?

Praan
