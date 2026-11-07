Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC0606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvYcZIQM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27D410F326;
	Mon,  9 Nov 2026 13:57:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AE910E552
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 08:57:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso8611375e9.0
 for <intel-xe@lists.freedesktop.org>; Sat, 07 Nov 2026 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794041875; x=1794646675; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kw2zLGhVUDQnO5rFq8cwt1gUENr7fOzbT4vb4xG8V9g=;
 b=rvYcZIQMH+WCux42vzqTcwUzsWPvrdbZUqoG60qSiRDwAePx2rZLAX30Gq8TUfv+Ys
 M+rL7OIwfW2WgPAAn2U+RRy2FsOKubyuwlGUgYg3VyfZQNelMm5cD5KGLw+EWcF1gpf0
 RNvuecJjfGopOzLWrx86ivIbB/UIXvYhLpKcZIVwteG9qyI2PECtb9Urg+4NX0xKai/h
 R/CeNawwyasZ4Y9xHecnoenJqkfTs9MehY3UFWFvllN/ORT/eq2dhPvHzkRF9HSkgQ5a
 Kx7A76h2ampKGyOuAM14GqpNybKayUu6ckjU4V0fzGcmBJ4q21VR/sRQwLyjnHbbKxf5
 rpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794041875; x=1794646675;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kw2zLGhVUDQnO5rFq8cwt1gUENr7fOzbT4vb4xG8V9g=;
 b=m6A3w0JE+J+5wSYhpEu53nSk8URS53T9/I8Bn2DgAewguAXBvQ6/VpMYyTFDwr1JKD
 wnEDJzcr99ZWiXHsW8OiVdvteQQVAH72KSof34Qvz8l21T0n2tCOqS8J5Tt1GEveTsIa
 mRfu+9nMfQmW7ORH55YIcRHP/LRZ3WlID8cghFIKfym0mMuiOgCRCUmth+USUzPRG7LT
 YczQwHvKjMlzp3mtYHfpCFqfjpjAVj8dQ7fJEp3zQ0p8YrxtjJX/g6itSYfzdixHgH5r
 jNhAHab+U0ZdkhtTpOTZqR2X9Xk8m6e+fv5M8lmOsmkD0IaWTuyPiC6xpsCVKiRbcuta
 gKVw==
X-Forwarded-Encrypted: i=1;
 AKwUvByzpkoTJut76L8RadG+gWcROk/L2Zc9uMAjQ6BZljtm9HJEMsenUxCfclhGWrOEIaAEw7jRPySUEw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8rMH8JGF375AH7x/a2bkp+SKZLrIkO0CXYih7mHaE3O/XCjGbh
 4vANE9AY69695M5FtitNiiPrNfwwG0nvWlxPGDiuE1PYnQg1GJoCNA0I
X-Gm-Gg: AYBFou2n553FwCDnzlIubwiiGUBj5SQHLatocIUwxvdJaKZKvJNDiYPsYeAW74CRXdw
 Z/MhMFL7v0RS4PCZ/GQd/5EiWPtbm0Sz/m1CDSkkbyRpeflxnbxjo7RrEx3tDv0HYOGH5RYKI9i
 ND5JHBV2EIYdTWbxHm0l1I8aCIx46L3e0ftNBkgO6QKp1zljr6O9bbrpOFJFugkgiZ05RiZjXSW
 Jdbt3464pC9Ik6YJeXod3eZiHpSzm5tJylN6GuJMpU2VRopeVm1Yk0WOWbWmw+wwtZjLL7ZzatB
 Odg8cZAFnNVXT6QVlLV8G64nqI7ymZ4z4mcavZLY/igzUvpRIBYtpJIIB1heAoYJKgzBej7QTLH
 FIVO9kdhYWG3tt36jZXfkVCN7k96Yphj+t6LWAwtzvnvzyA6jGcE5+uO1uGLlVlDCFK3MVCYuWL
 0I9WSqBuLFsJeHKKE0vV1ZgievVWGJkIJLh5dTdZTVs+ovKquWU/4VgTx1Db2NrF4vNXuFM7z81
 YtFk0qsRP2mwpxud9ji8zvVpRpVNfCWrmCe7F9ffiKA0HAgZq6jUIZyTLkr3FCgICCwJng6V7gM
 34J8kDIectnH9Fc3J4ZXCmNKZfM4rVzZ7YjjapmyHg7UQbgpxVK52YSY+rJfWSAVH4/9P8jWB7O
 W7boN6Pu7UM3451h+CEGjEZTgH2mowktViMYY5tyQZLsRazjCkS2GcznDBBu9qzaP
X-Received: by 2002:a05:600c:a015:b0:4a3:5a91:5f61 with SMTP id
 5b1f17b1804b1-4b6df028f04mr88902585e9.14.1794041875269; 
 Sat, 07 Nov 2026 00:57:55 -0800 (PST)
Received: from unknown748F3CBA5068
 (dynamic-095-114-115-226.95.114.pool.telefonica.de. [95.114.115.226])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7701af6sm8597238f8f.38.2026.11.07.00.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 00:57:54 -0800 (PST)
Date: Sat, 7 Nov 2026 09:57:22 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Matthew Brost <matthew.brost@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dongwon Kim <dongwon.kim@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
 Xu Yilun <yilun.xu@linux.intel.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
 Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-rdma@vger.kernel.org, 
 iommu@lists.linux.dev, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 Alexey Kardashevskiy <aik@amd.com>, 
 zhipingz@meta.com, treding@nvidia.com, jhubbard@nvidia.com, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v2 06/23] dma-buf: Let the exporter select mapping type
 at pin/map
Message-ID: <au7mBMbRC8q6NILj@gmail.com>
References: <20261105-dma_mapping_type_v4-v2-0-78b8dc9ae80a@nvidia.com>
 <20261105-dma_mapping_type_v4-v2-6-78b8dc9ae80a@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-dma_mapping_type_v4-v2-6-78b8dc9ae80a@nvidia.com>
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:00 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 05:40:41PM +0100, Alistair Popple wrote:
> + * A pin or map that fails after dma_buf_mapping_select() may reopen the
> + * choice only if it was the one that made it. A selection that predates the
> + * call belongs to a live pin or mapping and must survive, otherwise the next
> + * pin or map would reselect under it without an invalidate.
> + */
> +void dma_buf_mapping_unselect(struct dma_buf_attachment *attach,
> +			      bool was_selected)
> +{
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	if (was_selected)
> +		return;
> +
> +	attach->selected = false;
> +	attach->selected_idx = 0;
> +}
> +

After dma_buf_invalidate_mappings(), attach->selected is false while
attach->selected_idx still holds that mapping's entry for a pending
unmap. 

If a pin/map fails before that unmap runs, was_selected is false and
dma_buf_mapping_unselect() resets attach->selected_idx to 0.

A subsequent dma_buf_unmap_sgt() then uses matches[0].

>  int dma_buf_pin(struct dma_buf_attachment *attach)
>  {
>  	struct dma_buf *dmabuf = attach->dmabuf;
> +	bool selected = attach->selected;
>  	int ret = 0;
>  
>  	WARN_ON(!attach->importer_ops);
>  
>  	dma_resv_assert_held(dmabuf->resv);
>  
> -	if (dmabuf->ops->pin)
> +	ret = dma_buf_mapping_select(attach);
> +	if (ret)
> +		return ret;
> +
> +	if (dmabuf->ops->pin) {
>  		ret = dmabuf->ops->pin(attach);
> +		if (ret)
> +			dma_buf_mapping_unselect(attach, selected);
> +	}

dma_buf_mapping_select() sets attach->selected = true before ops->pin()
and the map callbacks run.

In patches 14/15, xe/amdgpu migrate a VRAM buffer to system memory
during pin and map when the attachment does not accept P2P.

That migration calls dma_buf_invalidate_mappings() and clears
attach->selected on every attachment, also the one being pinned/mapped. 

When the callback succeeds, the attachment stays pinned or mapped with
attach->selected == false.

A later map/pin on the same attachment can then reselect without an
invalidation.

Thanks,
Karl
