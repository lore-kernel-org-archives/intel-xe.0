Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFE8C5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 19:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7A410E513;
	Tue, 20 Feb 2024 19:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EbicfXdI";
	dkim-atps=neutral
X-Greylist: delayed 540 seconds by postgrey-1.36 at gabe;
 Tue, 20 Feb 2024 19:07:37 UTC
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7824210E513
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 19:07:37 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id cVJ3rZRzMFu9DcVK5ruPxD; Tue, 20 Feb 2024 19:58:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1708455515;
 bh=bhyTkozSilaOI3wTa7vDeTF3frYTM4nImhWGYnX59p0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=EbicfXdI+a3tOLKcNT4u8AXMI7rRi5z4CZFujYjmHCy5vrdHE5yv95ghh07lElXDp
 2DxvgFn7gJyTUAYse4z9umzGRzh0h52oaUk9UDtgMaPotThmucxgjguOg/hHSNQP8R
 50eV2NEjKcYEIHljl/V9JoyKWR8dp2Yijpst9X//fyaM465h9din2Mxll7QLkR1w2v
 7fs5wltDKP5VyjfPV4r7wA5uoz095fplA5olLFzWtd10b+CNJUJOSuNGuII9Q9MgZp
 efneR4zRosgVOd4qCAdTs8LpdSjuS6TVEBv8EkRJa8RbA4/iwGq6Tv1x1ip46zqsP7
 SE0UlUYX5ro1A==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 20 Feb 2024 19:58:35 +0100
X-ME-IP: 92.140.202.140
Message-ID: <521e55d5-37e2-41b3-9ed7-0986d503087c@wanadoo.fr>
Date: Tue, 20 Feb 2024 19:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Remove usage of the deprecated
 ida_simple_xx() API
Content-Language: en-MW
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 14/01/2024 à 16:09, Christophe JAILLET a écrit :
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_max() is inclusive. So a -1 has been added when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 21ac68e3246f..11ffacd1dd58 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -311,7 +311,7 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
>   				      q->guc->id - GUC_ID_START_MLRC,
>   				      order_base_2(q->width));
>   	else
> -		ida_simple_remove(&guc->submission_state.guc_ids, q->guc->id);
> +		ida_free(&guc->submission_state.guc_ids, q->guc->id);
>   }
>   
>   static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -335,8 +335,8 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>   		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
>   					      order_base_2(q->width));
>   	} else {
> -		ret = ida_simple_get(&guc->submission_state.guc_ids, 0,
> -				     GUC_ID_NUMBER_SLRC, GFP_NOWAIT);
> +		ret = ida_alloc_max(&guc->submission_state.guc_ids,
> +				    GUC_ID_NUMBER_SLRC - 1, GFP_NOWAIT);
>   	}
>   	if (ret < 0)
>   		return ret;

Hi,

gentle reminder.

All patches to remove the ida_simple API have been sent.
And Matthew Wilcox seems happy with the on going work. (see [1])

Based on next-20240220
$git grep ida_simple_get | wc -l
36

https://elixir.bootlin.com/linux/v6.8-rc3/A/ident/ida_simple_get
50

https://elixir.bootlin.com/linux/v6.7.4/A/ident/ida_simple_get
81

Thanks
CJ

[1]: https://lore.kernel.org/all/ZaqruGVz734zjxrZ@casper.infradead.org/
