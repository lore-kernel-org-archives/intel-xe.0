Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B5ECD5BB1
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 12:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF9010E4D1;
	Thu, 21 May 2026 12:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="xEKejN2M";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="pyhZSDN/";
	dkim-atps=neutral
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B8910E0C9
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 17:22:26 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 4480D7A0088;
 Wed, 20 May 2026 13:22:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 20 May 2026 13:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1779297745;
 x=1779384145; bh=s5dvkWtEODdyoI8bOKVGpIdgoX0fcCuk5jrlqtqFDrw=; b=
 xEKejN2MNN5XlBB2sNNYbYDhnNkrWsZc/y2/sEaspFQXnhE6F0IYS2uhxR0J0oDY
 08oCuoP0/GOOkWxscEGyujvYH12gw8YPy5JOdLi8oCMD2QE2Ne2Ir/gEpOgrMHlw
 wXPbRZyaZnjolilBTzhPUIbjG11YHeJT6ilEYWwWrXqCd4L8xK+HTecgP7MR0E8W
 7KGQuc7+eq9yvfxdoVLkWswezkMwyBijdhVANgkGID7qzxecI641UPQLHxgDkegB
 eNXWq3X5tejU19ugLJrAZE/x9jyJwwUzW5rml5opLHTTSd5o4yUo9eVdSWUp+RgJ
 WZEas8Ipmh9FLTOqI1aCbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779297745; x=
 1779384145; bh=s5dvkWtEODdyoI8bOKVGpIdgoX0fcCuk5jrlqtqFDrw=; b=p
 yhZSDN/dlAAgS7nL+8nwGrn0furYE39opSQHn+7mhKOtr+PPdKanoY1nqU27kjGx
 QEMWl+p47zmYNB2A5+pOglVRtEZdc9LbfnqDh/d60j9yeo84+VpzSyMaFtnJ7/Ov
 yS5cZ2oAjHEghQXHon0AL+McOe2U2mKTfi4j/+UvfitR+YpSe3Jz+h2Dj7kR/+t8
 pgzHcsdhOKT3GYjhQvguDVNT5nWSxNi+PyvSy4vx896odFJOxtWA7yyuNoVp4me8
 5BXNseW0qK2KmYm60N4bdDuql22doSBgD2c2AGezPGJqVvzlXGwEEaVMiAF7AIF/
 qMo/nUjiZ9onLRelCczDw==
X-ME-Sender: <xms:z-0Nap6uAGhrbWj-yDA9NHLz4V_JRy3eLkB7Cv0t3mXcTaCja4_1_w>
 <xme:z-0NatTLPjWhLfKiToSiSHeOTuYdBuri9V53kVMPWc1W-H_1UVL2swAh2MNcgPwAZ
 nOgNERAwELaXXM9TQNzTcT7UYPEdVr3zGJb41F2Jgsbp4a1zAIY>
X-ME-Received: <xmr:z-0NastiPVPkiyr4wY44OJk7WgUN3XBmfqc2Ryr5vn-mfIVdW_q9sngPeEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeehvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpeetlhgvgicu
 hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
 htthgvrhhnpeegudevhfejueefveduieeuueeifeettdekveekhffgvdetfeelueehgfdt
 heffhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grlhgvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepuddvpdhmohguvgep
 shhmthhpohhuthdprhgtphhtthhopeiihhgrohhguhhohhgrnheskhihlhhinhhoshdrtg
 hnpdhrtghpthhtohepmhhitghhrghlrdifihhnihgrrhhskhhisehinhhtvghlrdgtohhm
 pdhrtghpthhtohepkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
 hinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphht
 thhopehjghhgseiiihgvphgvrdgtrgdprhgtphhtthhopeihihhshhgrihhhsehnvhhiug
 hirgdrtghomhdprhgtphhtthhopehskhholhhothhhuhhmthhhohesnhhvihguihgrrdgt
 ohhmpdhrtghpthhtohepkhgvvhhinhdrthhirghnsehinhhtvghlrdgtohhmpdhrtghpth
 htoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:z-0Nav8RdxoqD3ErBvEx8eGsZeEWHkWQ-wnqJpF55QzG6z8fcsjcVg>
 <xmx:z-0NalzO25DDQ5AgJps67VEeJrUMzcMwCKyMMcKf2dfapU7_IKTFow>
 <xmx:z-0Nah_Rdzt0SMwunZQdpQr2FewfigOgo7kqD9yCWoOUoPa2of591A>
 <xmx:z-0NajPHZxyM38iyvL05FV1dk5lJB3HVgStAma7xB7pKjbedyzHLsQ>
 <xmx:0e0Nag9IV7Fx8cb0O6p3-2wCg7N27qYmWt3dftVTxmfT2EULehAbvHnC>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 May 2026 13:22:22 -0400 (EDT)
Date: Wed, 20 May 2026 11:22:20 -0600
From: Alex Williamson <alex@shazbot.org>
To: =?UTF-8?B?TWljaGHFgg==?= Winiarski <michal.winiarski@intel.com>
Cc: zhaoguohan@kylinos.cn, kvm@vger.kernel.org,
 intel-xe@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Yishai
 Hadas <yishaih@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org, alex@shazbot.org
Subject: Re: [PATCH v2] vfio/xe: avoid duplicate reset in
 xe_vfio_pci_reset_done
Message-ID: <20260520112220.274025fa@shazbot.org>
In-Reply-To: <20260427012128.117051-1-zhaoguohan@kylinos.cn>
References: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
 <20260427012128.117051-1-zhaoguohan@kylinos.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 21 May 2026 12:29:21 +0000
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

On Mon, 27 Apr 2026 09:21:28 +0800
zhaoguohan@kylinos.cn wrote:

> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
>=20
> xe_vfio_pci_reset_done() sets deferred_reset and, when it manages to
> acquire state_mutex itself, hands the cleanup off to
> xe_vfio_pci_state_mutex_unlock().
>=20
> That helper already clears deferred_reset and runs xe_vfio_pci_reset()
> before dropping the mutex. Calling xe_vfio_pci_reset() again right
> afterwards repeats the reset handling unnecessarily.
>=20
> Fixes: 1f5556ec8b9e ("vfio/xe: Add device specific vfio_pci driver varian=
t for Intel graphics")
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
> ---
> v2:
> - Correct the Fixes tag to point to 1f5556ec8b9e


Micha=C5=82, any objection?  I'd prefer to include this with your ack.
Thanks,

Alex
=20
>  drivers/vfio/pci/xe/main.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> index 4ecadbbfd86e..cbff5af385ef 100644
> --- a/drivers/vfio/pci/xe/main.c
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -135,8 +135,6 @@ static void xe_vfio_pci_reset_done(struct pci_dev *pd=
ev)
>  	}
>  	spin_unlock(&xe_vdev->reset_lock);
>  	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> -
> -	xe_vfio_pci_reset(xe_vdev);
>  }
> =20
>  static const struct pci_error_handlers xe_vfio_pci_err_handlers =3D {

