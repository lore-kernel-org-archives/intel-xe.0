Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AD606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ww00hyP4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9E010F4B5;
	Tue, 27 Oct 2026 13:15:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96A10EC20
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 08:03:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e4831c028so1100604f8f.0
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793001806; x=1793606606; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oue2gY3N148Z5QjebnGzECChsQECIfu8P/sF36ovlgA=;
 b=Ww00hyP4q6cCB020hECdbIGhq3pKARobVYkwcfxjinSX3RPa59vG6sCopEVWoqEG2g
 dpbd49Y+IeqwYml43JQbYPBCxzQGxAmo+6s0BxNCBWS+rhWMzYQnAdTTQjPVTkFUn0F/
 Lozka5lzT3hwbc0PxmoyMuGZxlHaZMUyBCCzOCaKU+k5bd6YEaztmhmeu9nqz2ZrO8Fr
 gwJ2lvvHnNLP/wHGUGvs3lLMQ7QnJYtv+2gqRti1C54/bq+fTeb0FrM5a9ZH82Avy8Sm
 VebkDUzaZnusp8NEJsQvVNbWzAm7nJWuVZQG79RfWA0NZdMeHUDQsJ6XyepoXJwzazBl
 pq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793001806; x=1793606606;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oue2gY3N148Z5QjebnGzECChsQECIfu8P/sF36ovlgA=;
 b=Q64UP5kvPFeM6zm4EbSPnD6ipOYfuBm1stQt7zIKqqTo5ZeiV+pSf7dKpBjXbugYkp
 mGPu/ntOSZliWVtOIFCBsjJvCTxKzVgwr0kKxsa1bkKNBTccADGZsam5U50GqZKIL8zg
 I/5BuplREDvgT5qLmZK5iabiGS6r09AVkTrjjbemfyP8AIVFmPlCyQQ7B33bCeyFx3JF
 lxyOuv5Goz8NCD4K+Ft0jSBxBJ4rnzSaBrkGtb+qf5blhMQ4ly4+IGLNFyd2iRBEG2jS
 b59vSXnv6b5SI7cy0bwKCTEammReECM7ouGxDr6urbR4ifoGGOvGmiKfzvQareoZLUOf
 vHgg==
X-Forwarded-Encrypted: i=1;
 AKwUvByCQdOBX7VbEWqv3hnvIfVJKHQCQHxoF9EXA39KRvIUmWLIGsi72NkYOMdcvgqGWkpKV4M2v7BVFA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLWmTXnzsAYHmlG6VcSZBvI4MS1NMQolzb02nlJbwRls6axpSv6
 BEOJp/U7MJm7E+oN/wWELIK6x1FwR/EMOJ5/jHNN6jVm9TLbDwjXhu+8
X-Gm-Gg: AYBFou1buR3HLYMGeWWSXWOYt5OFEEr4vRUEg0p21j+RP4srKut8VmqmbLjGofKa8hS
 sf6qM6WiQweFkOqddrWyYJeUhV7tdDBpsNzZPhZXnpLntd1L1mAQN0FxVwEl28s+3+aSlK7SEGM
 2HWETlsmHkfMoIZKT7gdBJUj3ZveculefRVWGykJ9H8m5BuYsdwG/J/8YKR+ElM49Cb3q9z/G39
 PToyTdLbMvGrazVZn4LkxWPoJQX6YLKsCx7AwBhGWTxjhiNfDpGbQoj6aiJj8gS+jOCCrePTjvh
 m/K4tGG9AXxufrLGSNhhRIwJZyW72xBTec8HV8LIrMNjMRSm0c2VsK82oiEK7mL03hStByoK+iT
 oKSdWs5zbD3ttJ0sxNkYguinFwAVyrvAOr3SxIE7IAxKr1LppHRdKALTWZP2ZqSWW1d42Z1eCAh
 VvWDGagzwFe33YlMOsnkeZ7KoQn765dGKpHnP18R7aeVyan8T7G4EGJxAFswmjpde0GuBpTOfaj
 BpZX0yE5o6eEazjiOwwvref6/WrXUX91kab9wJVN/LR3PxONRqJASQ9HEmj58/tQiJhtw1X4Xq1
 DRTRVH/dIk/2nkym8I29cunWEVQ+kzQCOnUriEXACrLzhgj6Ouk+SHbFf678LZpKr1QOb/QBcYE
 M8XWMYUEOeTrDb0qtocQoSItLvtseYpVb7ZhyflYgcsCCOLmSMoIPf7FrcK7cGA==
X-Received: by 2002:a05:600c:3f12:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4a47a8dc6e6mr85645335e9.11.1793001805868; 
 Mon, 26 Oct 2026 01:03:25 -0700 (PDT)
Received: from unknown748F3CBA5068
 (dynamic-2a02-3100-b1a4-1201-5c78-89f4-99d8-70d7.310.pool.telefonica.de.
 [2a02:3100:b1a4:1201:5c78:89f4:99d8:70d7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a04ad39sm473163315e9.1.2026.10.26.01.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 01:03:25 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:03:22 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com, 
 sumit.semwal@linaro.org, jgg@nvidia.com, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Matthew Brost <matthew.brost@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dongwon Kim <dongwon.kim@intel.com>, Leon Romanovsky <leonro@nvidia.com>, 
 Kevin Tian <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
 Baolu Lu <baolu.lu@linux.intel.com>, Felix Kuehling <felix.kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-rdma@vger.kernel.org, 
 iommu@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com, 
 treding@nvidia.com, jhubbard@nvidia.com
Subject: Re: [PATCH 05/26] dma-buf: Let the exporter select mapping type at
 pin/map
Message-ID: <at8IQZ34wkHQ_5PL@gmail.com>
References: <20261026053623.202642-1-apopple@nvidia.com>
 <20261026053623.202642-6-apopple@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026053623.202642-6-apopple@nvidia.com>
X-Mailman-Approved-At: Tue, 27 Oct 2026 13:15:56 +0000
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
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 04:35:56PM +0100, Alistair Popple wrote:
> +struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> +					enum dma_data_direction direction)
> +{
> +	struct sg_table *sg_table;
> +	int ret;
> +
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ret = dma_buf_mapping_select(attach);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	sg_table = __dma_buf_sgt_map_attachment(attach, direction);
> +	if (IS_ERR(sg_table))
> +		/* Nothing was established, so the choice may be made afresh */
> +		attach->selected = false;
> +
> +	return sg_table;
> +}

The map-failure report from Sashiko [1] reproduces with a KUnit test
against the full series:

  pin selects B -> map returns -EIO -> selected is cleared
                -> retry selects A, with the original pin still held

The exporter pin count stays at 1. Preserving selected when it was true
on entry makes the test pass. Patch 7 needs the same fix.

Could dma_buf_mapping_select() report whether it made a new selection?
Then the error path could undo only that choice, without dropping one
established by an earlier pin or map.

On the Sashiko failed-pin report:
("Because the attachment is not pinned, the exporter may migrate the
buffer elsewhere without invalidating it")

I don't think this follows from the documented contract.
select_mapping() requires the exporter to keep the recorded type
servable and invalidate before an incompatible move. That obligation
still applies if ops->pin() fails.

Is retaining the selection after a failed pin intentional? If so, this
can be added as a test documenting that alongside the map-failure
regression test.

Thanks,
Karl
