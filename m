Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A4D1951B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 20:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0054F10E498;
	Mon, 26 Jan 2026 20:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pzrR2Cj+";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A21910E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 20:54:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a0d06cfa93so3225ad.1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769460846; x=1770065646;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hzbl67LvVO3G9O2kTwPWCnjF6/j6A2BV5AiFShhPhBU=;
 b=pzrR2Cj+phHrgyIAbVJoFm060moWMkBNKJeheocm6Z6eJjwlJwpZB5+ikU5LUx91zc
 JMuieJPR5j2fZw9stD5+huqWokb50nANvsFzRq+jqebaeWrRoLID7xvtmLJ1Ap5xLE5d
 2Hae/oEt3udcikzmYqDnm+w06SUZyBkhp2Kn+WHnB75AaJuExVHMcoFMS9v9nJfcow5g
 FputNENXp94uf8kMMkV7XGqzvf8gVxR8oCSzkC5hd6L4/7hAsPe9cN0sWsawtDIN94UL
 6EumaB+3D8OwI6WxjoqaekAyqj60xBLNcu5J9d9EDmPcdf+f8pUT26fZh87EsrBpszpm
 Kv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769460846; x=1770065646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hzbl67LvVO3G9O2kTwPWCnjF6/j6A2BV5AiFShhPhBU=;
 b=uc/Tgq0UGQkSU8V5DBJzWg4QyKlSzRWRvNn947Xn2ppSMJx6DsWddOUD5pyRhmUeJ8
 N7WakyS47UvhwpASIh66+Pp0+IFZlDG98fi6iKbN58jfP7vTXXUL5g3VmdZQN2FI18k3
 PIHGvE0dIehBovqA3BXcxnFPXWvRgkTGt9NGxgZvsIZb8OgQ4oP/b8mIfHTjKOAFnZbv
 V04M4QQ/0hZqKZofZhkSuyPh5Hnvk9qwOf+3+Kldykpq3257f2lRAevNVqdlUL97pAQ1
 +L8H6LgZxdGY7136CPKI1IZl1kAO2OVqwLmHimJf2gRifDEOcztLNB+E/60+CeTtGT2/
 XQ2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX9pAzIwXTV2w/lpeq1AcZAcxwC4X+BnSvZlQfzCgu5+aJIUxjdc+n1NTTHOd1hbwSFmNht6D0nQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxyjermon+xLwXUcc1GCpgB3u1z+8gXbhX4HJlAbX8MabdIrgMv
 yCt7wUd4drDZ2PPlecgbI40p9qEBcIC10D+bBdsjD09BiVKOxQx98zEOAoNXrCF3NA==
X-Gm-Gg: AZuq6aJiTLNxb6N/9E5Ra2mp3gxXVrfncX0TNE/6vPujZX3lkgsDgZ/7cu4LcRSj4y7
 EwCH0EDhiqnL56GF8UoHwOTTNS1jjfbJ0WTV1t/5q4FFLN7rOsWdr5PMPnLhIebzL8bu1osY/kF
 G7m3KfaCRfbpQmfasGmyRJ11meA7yv1fgxG3fxYvHsHuKzmMgxsmnnt31h6ytd6ykcK6gBXt7c0
 AeqoYBJJX5zOEUN/d0ESHdJEYVTJx3VrgNWw+wAAhimeQGUAWOQF709SeJKkNy5Uvx27dlb3Ewa
 u+g8UR9B9lpbPzReXj50HlSqoyrIrp4jY6BCx2383+g7QspelAvzp1QCOC4BKBwj/8leaHn256O
 /+2XazMxWdT/0fkwwv7i9xHMpfo3ZtFd5ZrAN3Wt58qYr7OzEDJMF5wKQ1/N6kkL5ZBQcz6SHX5
 Epq702l29ik6O0zl5oczo+B8pESsQ1TpaKnOqMqvVmETtk3yhv
X-Received: by 2002:a17:903:1cc:b0:295:5405:46be with SMTP id
 d9443c01a7336-2a8447fe3b6mr3809735ad.1.1769460846094; 
 Mon, 26 Jan 2026 12:54:06 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com.
 [35.187.245.222]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802fda160sm94991165ad.88.2026.01.26.12.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 12:54:05 -0800 (PST)
Date: Mon, 26 Jan 2026 20:53:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <aXfUZcSEr9N18o6w@google.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
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

On Sat, Jan 24, 2026 at 09:14:16PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma-buf invalidation is handled asynchronously by the hardware, so VFIO
> must wait until all affected objects have been fully invalidated.
> 
> In addition, the dma-buf exporter is expecting that all importers unmap any
> buffers they previously mapped.
> 
> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 71 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d8ceafabef48..485515629fe4 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -17,6 +17,8 @@ struct vfio_pci_dma_buf {
>  	struct dma_buf_phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
>  	u32 nr_ranges;
> +	struct kref kref;
> +	struct completion comp;
>  	u8 revoked : 1;
>  };
>  
> @@ -44,27 +46,46 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	return 0;
>  }
>  
> +static void vfio_pci_dma_buf_done(struct kref *kref)
> +{
> +	struct vfio_pci_dma_buf *priv =
> +		container_of(kref, struct vfio_pci_dma_buf, kref);
> +
> +	complete(&priv->comp);
> +}
> +
>  static struct sg_table *
>  vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
>  		     enum dma_data_direction dir)
>  {
>  	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct sg_table *ret;
>  
>  	dma_resv_assert_held(priv->dmabuf->resv);
>  
>  	if (priv->revoked)
>  		return ERR_PTR(-ENODEV);
>  
> -	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> -				       priv->phys_vec, priv->nr_ranges,
> -				       priv->size, dir);
> +	ret = dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> +				      priv->phys_vec, priv->nr_ranges,
> +				      priv->size, dir);
> +	if (IS_ERR(ret))
> +		return ret;
> +
> +	kref_get(&priv->kref);
> +	return ret;
>  }
>  
>  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
>  				   struct sg_table *sgt,
>  				   enum dma_data_direction dir)
>  {
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
>  	dma_buf_free_sgt(attachment, sgt, dir);
> +	kref_put(&priv->kref, vfio_pci_dma_buf_done);
>  }
>  
>  static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> @@ -287,6 +308,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  		goto err_dev_put;
>  	}
>  
> +	kref_init(&priv->kref);
> +	init_completion(&priv->comp);
> +
>  	/* dma_buf_put() now frees priv */
>  	INIT_LIST_HEAD(&priv->dmabufs_elm);
>  	down_write(&vdev->memory_lock);
> @@ -326,6 +350,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	lockdep_assert_held_write(&vdev->memory_lock);
>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			dma_resv_lock(priv->dmabuf->resv, NULL);
>  			priv->revoked = revoked;
>  			dma_buf_invalidate_mappings(priv->dmabuf);
> +			dma_resv_wait_timeout(priv->dmabuf->resv,
> +					      DMA_RESV_USAGE_BOOKKEEP, false,
> +					      MAX_SCHEDULE_TIMEOUT);
>  			dma_resv_unlock(priv->dmabuf->resv);
> +			if (revoked) {
> +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +				/* Let's wait till all DMA unmap are completed. */
> +				wait = wait_for_completion_timeout(
> +					&priv->comp, secs_to_jiffies(1));

Is the 1-second constant sufficient for all hardware, or should the 
invalidate_mappings() contract require the callback to block until 
speculative reads are strictly fenced? I'm wondering about a case where
a device's firmware has a high response latency, perhaps due to internal
management tasks like error recovery or thermal and it exceeds the 1s 
timeout. 

If the device is in the middle of a large DMA burst and the firmware is
slow to flush the internal pipelines to a fully "quiesced"
read-and-discard state, reclaiming the memory at exactly 1.001 seconds
risks triggering platform-level faults..

Since the wen explicitly permit these speculative reads until unmap is
complete, relying on a hardcoded timeout in the exporter seems to 
introduce a hardware-dependent race condition that could compromise
system stability via IOMMU errors or AER faults. 

Should the importer instead be required to guarantee that all 
speculative access has ceased before the invalidation call returns?

Thanks
Praan

> +				/*
> +				 * If you see this WARN_ON, it means that
> +				 * importer didn't call unmap in response to
> +				 * dma_buf_invalidate_mappings() which is not
> +				 * allowed.
> +				 */
> +				WARN(!wait,
> +				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
> +			} else {
> +				/*
> +				 * Kref is initialize again, because when revoke
> +				 * was performed the reference counter was decreased
> +				 * to zero to trigger completion.
> +				 */
> +				kref_init(&priv->kref);
> +				/*
> +				 * There is no need to wait as no mapping was
> +				 * performed when the previous status was
> +				 * priv->revoked == true.
> +				 */
> +				reinit_completion(&priv->comp);
> +			}
>  		}
>  		fput(priv->dmabuf->file);
>  	}
> @@ -346,6 +402,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  
>  	down_write(&vdev->memory_lock);
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		unsigned long wait;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
> @@ -354,7 +412,14 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  		priv->vdev = NULL;
>  		priv->revoked = true;
>  		dma_buf_invalidate_mappings(priv->dmabuf);
> +		dma_resv_wait_timeout(priv->dmabuf->resv,
> +				      DMA_RESV_USAGE_BOOKKEEP, false,
> +				      MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +		wait = wait_for_completion_timeout(&priv->comp,
> +						   secs_to_jiffies(1));
> +		WARN_ON(!wait);
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
>  	}
> 
> -- 
> 2.52.0
> 
> 
