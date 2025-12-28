Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85D7CFD64A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 14:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929B210E605;
	Wed,  7 Jan 2026 14:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="NFKUvsh7";
	dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TlYe/woh";
	dkim-atps=neutral
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E22710E1CE
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Dec 2025 20:48:05 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 83AFD7A031C;
 Sun, 28 Dec 2025 15:48:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sun, 28 Dec 2025 15:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1766954884;
 x=1767041284; bh=stmomKs5w9KPTMilxwJpAtcHDNCZFqnQi0xKX7GpdkU=; b=
 NFKUvsh7sSjNnclgLQtHS2XztgLH8JgYCzfSZ/kpkL/FRblqetbygnKnfOGFve5x
 KuAStxpdY4SniMQ2mTE3KaRw812BJYC4YQacXsXWz7qIDGJoPyNh5mVqDzfCdx90
 rcBhpOW36Eo38+25lzOqz8PUrdndDSTrArLrq45sFAzPXuzsKE5LKaOUrRhW59TR
 kC2Pql5z7OdotdwgmEbtTl+pWmI/aQUAfQ7lDAqzTNeArsRZQd9Suc7ytUQSK34y
 n73hzfgF/kyugFNvUT8n1qIhcJY6t4qJXP2jjyJOVv/rC3L3+I9EcrsDNv84NZ1w
 CufRHJTx9Pj9kWG7TOa9AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1766954884; x=
 1767041284; bh=stmomKs5w9KPTMilxwJpAtcHDNCZFqnQi0xKX7GpdkU=; b=T
 lYe/wohkAHFaxZThgD5iVL+k83+yaVrPMr7N4KYqMGDyCptqeJSCTCFegmni8hsb
 42ZTXY6rhFH14ur8/eczdRqY9dscooc9xcUeMz8WVHEhRyc69dZkMtu3g1fCl44j
 FB1Vc41Wp3Z9OUCSdQJesnN/r9WLVCBkFgikR4lKRbDXfi+7OnVxPmIGJI7ILM9n
 HsNfsg4bcCv1chgDCWwUG0ZcCUBn5gOiGThkYE8pAxbErhdbKgJlpDqW3k2z0Luq
 0rxHL8VWzbBwYcDWSeqtIatCnm0IgQ+DlHi+9jXMNQE1PBvY7bFmn9k7NJzkfkts
 BhxIERT41aL5+cRgZ9ikg==
X-ME-Sender: <xms:g5dRafxwV9FsC59vj4kA2h1ktk9jtz8eLQiY-DjkWk1sb5vEuWDEEg>
 <xme:g5dRaTHuPh9-N_qthCAPpCWqGQBCt2UB3DU5xmbNfhSIaRWZQ7E5PqxNK-2KKlXr1
 VPxnGE2efsoalXXjz7NoW04NyjuMlLAUuu2PiLqR9BB0kQkJkDMgA>
X-ME-Received: <xmr:g5dRaUuqSLMb3ce8etAyOuFDY_oVJlRwH1dKdUYWHWAjF_OCY2Fbo2qzvs0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejhedviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfgjfhggtgfgsehtjeertddttddvnecuhfhrohhmpeetlhgvgicuhghi
 lhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrghtth
 gvrhhnpeetteduleegkeeigedugeeluedvffegheeliedvtdefkedtkeekheffhedutefh
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlh
 gvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepuddupdhmohguvgepshhm
 thhpohhuthdprhgtphhtthhopegrlhhpvghrhigrshhinhgrkhdusehgmhgrihhlrdgtoh
 hmpdhrtghpthhtohepmhhitghhrghlrdifihhnihgrrhhskhhisehinhhtvghlrdgtohhm
 pdhrtghpthhtohepjhhgghesiihivghpvgdrtggrpdhrtghpthhtohephihishhhrghihh
 esnhhvihguihgrrdgtohhmpdhrtghpthhtohepshhkohhlohhthhhumhhthhhosehnvhhi
 ughirgdrtghomhdprhgtphhtthhopehkvghvihhnrdhtihgrnhesihhnthgvlhdrtghomh
 dprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgv
 lhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomh
 dprhgtphhtthhopehkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:g5dRaTAhwtiqhhDwWv05hoX3qUoQ9Gn1XAq05zlaIo0yaU-jYb0Hwg>
 <xmx:g5dRafDXQzM9UNWhax1sGC4cY29v_LoG2k4LGcRHDW3wXBSwiTnzOw>
 <xmx:g5dRadpiIyTN_Sx3e8zMLgDrX6WthoI-enrA4zGbX7h7pSCUjdUVhA>
 <xmx:g5dRaaEAciTqumbPyQeyI1qJtoC49N-o2KRrUtM8A9_AUjcWlqKc7A>
 <xmx:hJdRabh8KzAYwhbu7ke6oEdxIrQpnjEkWKltGMkfIqNsnW8uzkzuaWgH>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Dec 2025 15:48:02 -0500 (EST)
Date: Sun, 28 Dec 2025 13:48:01 -0700
From: Alex Williamson <alex@shazbot.org>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: michal.winiarski@intel.com, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>, Kevin
 Tian <kevin.tian@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 kvm@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/xe: Fix use-after-free in xe_vfio_pci_alloc_file()
Message-ID: <20251228134801.074ed34c.alex@shazbot.org>
In-Reply-To: <20251225151349.360870-1-alperyasinak1@gmail.com>
References: <20251225151349.360870-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 07 Jan 2026 14:19:14 +0000
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

On Thu, 25 Dec 2025 18:13:49 +0300
Alper Ak <alperyasinak1@gmail.com> wrote:

> migf->filp is accessed after migf has been freed. Save the error
> value before calling kfree() to prevent use-after-free.
> 
> Fixes: 1f5556ec8b9e ("vfio/xe: Add device specific vfio_pci driver variant for Intel graphics")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  drivers/vfio/pci/xe/main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> index 0156b53c678b..8e1595e00e18 100644
> --- a/drivers/vfio/pci/xe/main.c
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -250,6 +250,7 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
>  	struct xe_vfio_pci_migration_file *migf;
>  	const struct file_operations *fops;
>  	int flags;
> +	int ret;
>  
>  	migf = kzalloc(sizeof(*migf), GFP_KERNEL_ACCOUNT);
>  	if (!migf)
> @@ -259,8 +260,9 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
>  	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
>  	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
>  	if (IS_ERR(migf->filp)) {
> +		ret = PTR_ERR(migf->filp);
>  		kfree(migf);
> -		return ERR_CAST(migf->filp);
> +		return ERR_PTR(ret);
>  	}
>  
>  	mutex_init(&migf->lock);

Applied to vfio for-linus branch for v6.19.  Thanks,

Alex
