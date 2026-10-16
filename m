Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E57DCCF2E7
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7AB10EC70;
	Mon, 19 Oct 2026 11:42:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928ED10E3B4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 20:27:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso3554765e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792182429; x=1792787229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jqtp5LPxF0IFxOJfCVzAQN6SnoPJKqsXWwttpYr3O58=;
 b=KZ/WnmGFPJgsK3sN5vOQr3YmcN5hNEmBzFj32QVjQC0URelqFGR0h12S8P/6524uig
 hUm8HxtJ+wxBpdUmUEtvXoouJAUV0QSCmf+2KF1NKofSY9OUwunjx5V6C3eRMVPMDzv/
 q+genrQVQoehS36dJKrddLR3GvE8dbUHXA2xQOOoijuiitAr4OIa9TiWv1tShqOzRb1u
 xB59UiuWpRztf5cPPQ2OYA+VOmQVY0ZVAtUPexVrrEPdgz5M4hMRb2T6HlQHjS9wv70c
 Nb7YtDmdzWCqf4OpbjTCJn4xfNqiJesc+HMFDbYdaRMJVCD/XLLvR91uKEWNn2NTtZ8T
 B1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792182429; x=1792787229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jqtp5LPxF0IFxOJfCVzAQN6SnoPJKqsXWwttpYr3O58=;
 b=02Sc1kIwq4BNK1TRO1wlbqJf7pUUUlPBpn1zkVm0uJme0hS1CTtCvjhiGFB9+BQzJC
 RMe6gDn4Tk3aSflEMO+KLZf2hLc2DeO0qdbRlwv3x/9fMCGt5otujRb2iyj5Kf5Zmpo/
 AEsGdEkmq9KL8ZOWZ1l6KaJPXLD7/pAg9rwc6416DdIotT1Tt2C26F804bWeV0yxkBpn
 tdn0yDPcA/bwDMi2xCWnwjdY6YcEr3v91/QnlhNh/BuyIaMK9JDBz3EFg51tIMm8Kpve
 Phek9zPNOS1gGV3laHNSfg010jKTobX/3aX6w3gFOB+i0fWT4UXhTpnxl0Q6GPEaH2bu
 yX4A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwwyGn11wSVRaUe5DAgMjStwBNbU5Tcyhj+lLHVOcz5M9ZP+Qa+DYcoQ8I8JbRKQpCsW9MBIVc++g==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKWg2S5e/bRqt/wQbkR4v0xXWpZFmyt71W6p2wF/DWeiyv99MmV
 Xn3GeF7jddVOFvI6k8sug80RJjHWqm0hdXc2JLxArGUOlFy/K0QHfGst
X-Gm-Gg: AYBFou2ZU6rogXSMqMjb95SUPxMyeu4kx+J5WAjuQolZHHtLEViVPk8mMwxaeDW/CJK
 xo9qvifODNRe73cRoaDCNR/W44WRNXbt4AKjrYkT/smA9MLupN5K9GC6Ntsv8ckmfn+Bmm2cuRp
 u6obOKbSmo2IUP4R1JYbQOFG/8PzAKqelDzcV8QR0z90GljZzDAdHLSh8GuCf1fDI6tomiAB5ve
 nPcs+XbrtDs3x/LnYi/NqYdSKoU1e9nrYgoMssD/JHLf74p9KTbi6q85k/Z8Xdk1trCOck3CAfI
 u1se9CtxXABSf80c76b2r6DuIROnkEcJc1fRt+Zu8ZfxAgeXQJ1jwJAp0ic8PzcY4B6+jria/Yg
 3YWoTtwdk5/c5XfuG3tJMNXXZ0G8mKKxrbycPF8yv8hI8N1HbrU5r4nxatmbXiwvx6q9W9XF4Mt
 bWSiTB43XoQG9qEqCykJeWhtNC8/1Txoi9nuqt145vlSJ0YZZ7WfeLe9wdtlH0QVV/AXgnUK91C
 JPNx7Ge2yxTEtYx9UiCLdkIs5Hhz7HjVyiW/HU1CAknXhgb6F2EmPjJfStAPbaRLHbsjv1zcRV6
 kxMWBEOlpD1X66pTBMrGYJwC82uP821JecULMgyeXXnu8h7XrnMxZ3t9NYCmiS0zPz61KnKb5SC
 qsg==
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id
 5b1f17b1804b1-4a1d760e327mr19553895e9.24.1792182428699; 
 Fri, 16 Oct 2026 13:27:08 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de.
 [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1d7659805sm22421075e9.7.2026.10.16.13.27.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Oct 2026 13:27:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Alistair Popple <apopple@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 03/26] dma-buf: Add dma_buf_mapping_attach()
Date: Fri, 16 Oct 2026 22:26:53 +0200
Message-Id: <20261016202653.97339-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <3-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <3-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:42:17 +0000
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

On Tue, Feb 17, 2026 at 08:11:34PM -0400, Jason Gunthorpe wrote:
> +	match_args.attach = attach;
> +	if (dmabuf->ops->match_mapping) {
> +		ret = dmabuf->ops->match_mapping(&match_args);
> +	}
> +
>  	attach->dmabuf = dmabuf;
>  	attach->importer_ops = importer_ops;
>  	attach->importer_priv = importer_priv;

I may misunderstand the intended contract. match_mapping() runs while the
attachment is still zeroed and without dmabuf->resv held.

Patch 11's amdgpu callback needs importer_ops and importer_priv, so its XGMI
match cannot work here. Patch 12's VFIO callback asserts dmabuf->resv and
reads priv->vdev, which cleanup changes under that lock.

Should the core initialize the attachment and hold dmabuf->resv for
match_mapping(), or should callbacks avoid attachment and lock-protected
state?

Thanks,
Karl
