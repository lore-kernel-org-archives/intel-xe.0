Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19ABC982FF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 12:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B31810E483;
	Tue, 22 Sep 2026 12:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="g1EMx2NH";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82910E483
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 12:25:07 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so30481385e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1790079906; x=1790684706; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Z0UH5f4Xwx0eHqEEdAgzMEXfye5CzpFBUkt22qJELao=;
 b=g1EMx2NHfVWs8pDd4hQYQo3szxAMrQbN1rEc7DKVei04dq9WOPnxdjerKAJGOucTS0
 EY/yxaA5qX6eqfEs0AA3lMxK6Er8l8uZg/tCG4tsUDjwiUjHlLUF2dZ/Pq8Au3MTOuDZ
 1iKOGviAJfw5cKWurnk6YWQbtjT7KUYkrmftRqudgGAcpXOq2L2+Z8f/rJh+UZgdz/LX
 SWCmv5krwSo6ZLteVSscBULRHV1Zj0SJit2Z+lHgxcgELVaArhCm0i+pLdvRiA3ei9hX
 RICn8oPekC+or/cLa9ZyjCrh5bG6nFMspfkVil2B4JgujqXF7+EaxRsJDDV5pWH7yjBq
 SQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790079906; x=1790684706;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z0UH5f4Xwx0eHqEEdAgzMEXfye5CzpFBUkt22qJELao=;
 b=zvTWCXmEqjlte0MfmHscdOmOanfX4O8BIsJ0KjLMrXK7KKhQDCxO1GvzelSXwYA5uW
 xgrKyrTG1reAR8th6HWLXjKwaFYTMC43Q59pUokMbSUXOk6Iq7rxRrFLT1bIQ1Mn9FUG
 chC2kkKHZzMMTw+lFOat8B1iU80I3lITgtuV7OZ6+QRXTw7mnJ8N7sE39geWPu8BL0Su
 5xNr7NB9fnXCgIKFLSDnXqySDr8gBpRBknu0Sz5aaFkoALHCbq6/WcUwJqFPbvBgYMpw
 h3ightXootYBPGyH15Or6PA0bzuq/CLU/dv4Wcgjq2xAlilBpJ/jZuvna/icYRgXHbEr
 /rTg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3MoCoW4lL10cYUfvzsJLcnWWNnx9KX/jaKe4HtkEjoa1JMw/WqQSh+0DNnOwia8M25FnaD4XdTw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kK73HrmcL8blRF+RcFTtiXwMj5tCSlyBGtkj37CjGfM0aLPgTe
 yhyNxE3eECpUVI4AUGSWpYmFoc1SM9BcFhwbEqzJW+hR0mIIbgZSaCNBstEcRk2T4u4=
X-Gm-Gg: AYBFou3P75lgLrLPEfLomZQQIUkS5jHJHM4tHNAbzdh7/DBeqdYViT1pRLLp+TmRqVp
 tYB+/Ro46fkMd+kxjvp4Y5DDqv7rmp29np3tBC1SVN4YNqoEabnOcpPFIUML7LLSdf7FfNKEUoU
 lRuS1fRaSjl1scT8fOhE/mafUythRveBtwWmDlht823pYfK3Ldfio78hLgI5YFaIBX5iDP9pabf
 o142QD4wOFAS2RPZp4SvwpqwHxpgfvXdnX5k9RoqG2vr92vhmSZdKT3qc+VvYZDRYqfNglGocxc
 cvy802clAt/wVJhFwpAqSKvOcr3RaQkGratTUAKd+n3iVgZLpXJklhBS+6fBf1UO9A/OtU/KqCW
 i9uGyKLhN+2dkOXaPSn4/W3fsn6HpL6hajiJ6jxN5f5bnW0/DTkA0z4eZPVw4DRdvwwmDxP9u3d
 Wd4kqPR0JR1ehPEwj0kw1iPM1pobMVDSH5r5L0b8N/nWwNzCd9CLkJmQMmZg27srNMg6x49Iriw
 RLG7nZl3sfOmO0Cbeur18ocmmbcVJsnowe4E+6NtliMmO0a7cVH/DXA9R32SDStrduHiU2tWSvK
 lPJasHr/EFcrZFiWjRP/mad5fKdFSVgyUB6mxlOz
X-Received: by 2002:a05:600c:1f95:b0:49e:7862:c09e with SMTP id
 5b1f17b1804b1-49fc57238b8mr181860835e9.14.1790079905892; 
 Tue, 22 Sep 2026 05:25:05 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100?
 (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz.
 [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdad40b4dsm48644925e9.10.2026.09.22.05.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 05:25:05 -0700 (PDT)
Message-ID: <d7bdb421-4c65-4133-95fa-ecf3ea2b7374@suse.com>
Date: Tue, 22 Sep 2026 14:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Remove the error-injection.h include from
 linux/module.h
To: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Francois Dugast
 <francois.dugast@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, linux-block@vger.kernel.org,
 netdev@vger.kernel.org, linux-api@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/11/26 5:04 PM, Petr Pavlu wrote:
> linux/module.h appears in roughly 15k #include directives across the
> kernel. This makes it a "hot" header, so it should avoid pulling in
> unnecessary definitions.
> 
> The header currently includes linux/error-injection.h to obtain the
> definition of `struct error_injection_entry`. However, this is unnecessary
> because the type is only referenced in the file as a pointer, for which an
> incomplete type is sufficient.
> 
> Add explicit includes of linux/error-injection.h to files that use the
> ALLOW_ERROR_INJECTION() macro and currently rely on it being provided
> indirectly via linux/module.h. Then remove the linux/error-injection.h
> include from linux/module.h.
> 
> The first five patches can go through their respective trees if preferred.
> The final patch depends on the preceding cleanups.

Thanks for the Reviewed-by and Acked-by tags so far. They cover the
majority of the changes, so I plan to pick up this series on
modules-next at the end of the week. Acked-by tags from the relevant
maintainers on the remaining patches are still appreciated.

-- 
Thanks,
Petr
