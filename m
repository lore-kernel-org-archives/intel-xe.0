Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD5CCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 10:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DCE10E697;
	Tue,  9 Sep 2025 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OCBC34dJ";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE5D10E697
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 10:28:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b00a9989633so148644866b.0
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Sep 2025 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1757413729; x=1758018529; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JKGepJQf9M6lLtehJhlq5BApUCT3KilSUJbItoq+UYI=;
 b=OCBC34dJ5kE9b4D2pVjfQQcEr9NqU0LWf3Fn9HLy96Vl838f5WECyPEceo0dLxLPUh
 8uHuccuq1Ei7scKZqQCWn8IgCUxubOoT2QXiS7NI+Kt4py5vR6NjBeMgY6fR+TP2bVj+
 NKLOfrgYIQaE+TvOlolzz14p1AMAy17j5zu4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757413729; x=1758018529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKGepJQf9M6lLtehJhlq5BApUCT3KilSUJbItoq+UYI=;
 b=F0ZH8RG7qlIZXowmDxkFaysdUJ6ag0N5uVd2fsIwV7LRQl5KRITCTqx2qh6QUP+Ouy
 t21aW0NOvkn30EoHAmAXEckgJxJbdSMmKshS/hPCxMNe7BN6YfN18+blGJkEko0Pbt/7
 6hUT30W9k9CMcizHn0Uzn0S82H9DV2BkWII8xC2umu+ddlOamgi3XweOSzCzBZcqv6F+
 EH1qHwsEBml6MvFinbbC52m10poFDMjiialNt7UKRrnV7c9+QiEsEKoI0OppjivVL16p
 ZoSX8bv+04a6+25LA0b9u0i7HgHFkiaIo1dbk4lUnFTejz62vYNuPrBu5tGW78bfBBDT
 B+2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXemH9t17z0BZA3B2giuZLQejBcQp7zWQx1986urzWf7a+cLLuFksNvJoqpxCKlc2uYVDU7zmxkQg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaF3GWiwOQKOls1ypPzxexfkBiu37COPHyBVN5XOxm5HCfOAyT
 JuaSMs5OZkZFM4+GeWJDhzTyt9Omv5T48j+5H1Yuf6a0l9M1MmlibMnBcvaNrZvnWUriciFIaH2
 aoarG
X-Gm-Gg: ASbGncu4/uB3ru/y+yCc6+hHdmjKUKcYsBeRpR4GRNy0tQ4xggNG0EZw+R0ARljBRNB
 h3OF00HhvzjgDQE8ipW+AMJ4q8D/FBw/GzBRjK/TiZ/f40P4kjj7hIBZN3hqqXRgSn2VI0hOUK8
 8fFo9K8cKCjeAVF0j8C0OgEEbhaM4ukybB45alOWrbK8T3eFPwaTkN/pxde0iZ9xB3e/JxWajea
 xp8aDuRzT0T8j1htrPphLxw8SD2XK0WR1igjDx8qvSEi3F+2MPY9BUzx1qV644U9OhJdORCT49A
 nmzaW78L6ANA7OmUKG0OghdHVCeZmAwgrPt4VOGWFe2Tdr1mjQBpkTATK9IVKzJ+1u0vxeSyotG
 MHCqOnUHR1eMHvXWFfbEhK+/5RBK0i6/OaxMxegsg1SI5
X-Google-Smtp-Source: AGHT+IEBkJ3EwLJJ+SbqYg1kqZCCIo6t5rvPOtBHOjN/zdmZCuifWtmUOwJ+nIlb5XiDEeLQY82oaQ==
X-Received: by 2002:a17:907:7292:b0:afa:1d2c:bbd1 with SMTP id
 a640c23a62f3a-b04b1f7639amr1089829966b.30.1757413729254; 
 Tue, 09 Sep 2025 03:28:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046b783722sm1472154266b.97.2025.09.09.03.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 03:28:48 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:28:46 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [01/10] drm/drm-crtc: Introduce sharpness strength property
Message-ID: <aMABXu_aijfcdWRY@phenom.ffwll.local>
References: <20250724134544.284371-2-nemesa.garg@intel.com>
 <CAFZQkGzBCU+tDUP=KahwCq8=LLW3a8NKiNK5U4JQ0btUFFz+9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFZQkGzBCU+tDUP=KahwCq8=LLW3a8NKiNK5U4JQ0btUFFz+9g@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Fri, Jul 25, 2025 at 01:22:00PM +0200, Xaver Hugl wrote:
> Hello,
> 
> This patch is Acked-by: Xaver Hugl <xaver.hugl@kde.org>

Since the kwin MR looks like it's ready too, the kernel side looks like
it's ready for merging:

https://invent.kde.org/plasma/kwin/-/merge_requests/7689

Might be good to record the links to userspace and igt in the commit
message so it's easier to find. Anyway, Jani asked me to stamp an approval
on this, hence:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
