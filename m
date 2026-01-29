Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED3D73E89
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AAC10E8CD;
	Thu, 29 Jan 2026 20:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M89UFxJh";
	dkim-atps=neutral
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA2D10E253
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 17:54:08 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c2af7d09533so717987a12.1
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 09:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769709248; x=1770314048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRBeS4+WQmZOEFMKUG8W1VxyeXhFlcnz8q11qIvwb5g=;
 b=M89UFxJhHI6qbcUc9gyaDKKcgns+oBNp1sXgGbs/+cZ8rOxn7q3KrpvXeJDV5cT4mT
 3vnOx8p8ykM4/8l4hAbOJD5k9fe/RJtLTn3xhE+2KGUrp5dqT4rZggDP7rWLvl0+Bhk5
 QuCYgJ11M+wyCimScqaqbrMNsFdA/jtdL0qR30rWyBc+Z9TJ2Y2Ar/SdfVJIBaDDb3Vq
 GUh2+82xnnPWIxksc42RO6XhGtRpDYCynjZkdT70SMsxwvDDcVw/AEYbRYT9EqpvLhSB
 j4nCGiHC/tz/jYT7I7+p8WvNYMmpKLj8jy0lu3eOC/9NCu9ug0lRTNCDlsQ3ugq9ybzl
 I8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769709248; x=1770314048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pRBeS4+WQmZOEFMKUG8W1VxyeXhFlcnz8q11qIvwb5g=;
 b=cKCaH65mUIlDXMhtTdzEGdLgi7IbGCHJnOqHDrM5c7LiHs0/s+9bqwuXbgODTRnE3R
 QoHlFkXEnBmWV3RAIJaaGoEWI6B8920EhCd8gY4xE4smRLIkALiFc0mdIwszN72XnPhb
 T+rPJxFq+1+1mhTcnkAzJ3DEpZopgle4nZSRdqR7OuZuQQYhr0WgDXVQ+WuTmyhJaGNi
 N90vaTZGQUA5N2A7jo6iH7Zo+uu9hEsSLmiAnPu+2WjiwK8HiCW6zqh71G9o1pbcpegt
 zZpIlX3OC9SI/Lwp07y5PqEJJAsuAN6m7D0WgGQCmparMagQwmMuooLOI/T/hb/Z//4p
 PIXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsWpIvmsQc2Towys4IZnx0BU0s085Ez944vukY/M3NrPiFynxGAHke3l+lhIOyfW3Pme0Vwx5ezQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjiEpZ7sWhiyc1p95lw50MYAXZEQEO+H13fqzPkJ/k7FW2SkI5
 S637KthULnCHfFgVCDm7VFrrokqduVySmpj6GBYmqSwIKrfzNxaQeeE=
X-Gm-Gg: AZuq6aIqneam1z6uHqDAMRcW2fDHdjfWubHyFC8BUEin/9mrW8vb5+4Depdaqgz2rqf
 LOG4RtPqHCmRFVCXMV/H2IYMri2HRJCzhlClDIVTpP7/nE+I/+ILQv+wz4ZbxqrUiqVzS+WnhOb
 K03GUnMqAxl1uf8Kj5nSdM2bEl7kBq5VYdpdVZ9fEGfntR07ziEXE69VWkBv8urxQ1hIijNKhH2
 Pon+ywq8+7hIyAzZo3y7osjBrxY32kZ7hQTQYlRqegK0w8dZihexHPuG10AOSzcT/M4VF0cuLgR
 nO8OD3juiQdYlPAXWHVw/CTrH/m19nY+Sbk3GQ6PMml3ix5yLVJEM2nCW8QRsovT0xi/uKff1Fy
 Hyuhl4cGoYyQjHyLmxuuQAGH5RoL+otEYV4KMdLoH/vbr/NnkjLkcFCiFlgLijHCphNMrpNKljQ
 /fTK+hBz/fCKub
X-Received: by 2002:a17:90a:d60d:b0:32e:38b0:15f4 with SMTP id
 98e67ed59e1d1-3543b2dc1c9mr291029a91.7.1769709247945; 
 Thu, 29 Jan 2026 09:54:07 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f2cb5adsm5952303a91.3.2026.01.29.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 09:54:07 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Thu, 29 Jan 2026 17:53:58 +0000
Message-ID: <20260129175358.1100-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXs3XOYucVna8eGH@wunner.de>
References: <aXs3XOYucVna8eGH@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 20:47:57 +0000
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

> I don't quite follow.  The patch counts the number of GPUs and
> uses the set_os protocol if there are at least 2 of them.
> One dGPU + one eGPU = 2, so the protocol is used.
> 
> Am I missing something?

Well your not, and it was a mistake of me, which i apologize for.

but i still think a MacBookAir dmi check would be better, as
theoretically you can connect a eGPU to a 2013/2014 MacBookAir,
which would enable set-os, and will cause problems in applespi.c
