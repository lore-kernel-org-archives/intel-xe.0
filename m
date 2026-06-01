Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3EECD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3C113188;
	Mon,  1 Jun 2026 10:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZX6x9eiB";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11A113194
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wi97KWGdJTdWq3IdYpsAWLx4xopc99EofOMqrefmH9Q=;
 b=ZX6x9eiBPV38y8Bjz6hiGqz3TItoF+lCpb9j6fw+st8riYtmvSsQRYg4OF3YhGc+reI/Xa
 348RIHXwT5aIiala50ZB8/GarJFHxjeF16d22Kpbt/FXc+euOfsA53i0Wfv7rAqYmfVuyB
 eR0zxHGFKuRt8YreH7uy9/zLCDPEbBk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-YseORZtmPT-RzjYcFv6Jfg-1; Mon, 01 Jun 2026 06:30:02 -0400
X-MC-Unique: YseORZtmPT-RzjYcFv6Jfg-1
X-Mimecast-MFC-AGG-ID: YseORZtmPT-RzjYcFv6Jfg_1780309801
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490aadb1386so2511085e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309801; x=1780914601;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wi97KWGdJTdWq3IdYpsAWLx4xopc99EofOMqrefmH9Q=;
 b=h7JPsT3gR11Gv5+jwUGHuQOW+kU1avVp3rA71FkXwMKkwJyDU2Qk8Re9uehsQZe5qy
 GUYL5IaTdFhwpK6/dtWSHYlaR/SXjED21IqOeQ6Q958C3awpMtD8P/qCNr99J2BMneGA
 hs3Baoc0mXvpLmbMb0m3Zrp59CKP1dYVbj7U+ahwaa+D2voRksb76VDCkmfKa0ouNHN5
 tPbb0+JR2nTMjsdonVo248dBM+7YRqE90+zuZDjfoWCBN6qcF+jS4D7duYdPBzJ+ZL8m
 f7KqKdIionpsxAqCm9iNXm/+V6cfKBGHgTY/qZF028M3aud5pxrx1GPei89k0kWSAcHI
 /RAA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8E/0PuDL5wSod8wqBgdhifvy23sIQotx8xXNAaw0vDak6zqWZm0an5AgCsemGLmfy3RepBtJjFEA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwerVBtgBbP03aQ/B5q1SDVs8Zrk4xy2yaQnRv1AgZaQl/sAbAI
 QaoGP6J1P2tRyczZrVdbBcVyDPIWxsNmWqZwR4QWMSU/hydazLboI3rXibvfHsR0BFPd46epIhj
 L9QAwdHwMHNPIWJ3YVXl7ZalvJ8Q6P4BHeqCxoI3ycAkCAix2bNShsEfRDFnvws8zwR58
X-Gm-Gg: Acq92OGWM+/nDXEaeYE8ByGkBkwud/DbRkxS8OTeZiYqPTNBvBgNN5/XqvdjNUkV+E/
 BRJbpdzIdJ4+QFmQ8x25Kc8FnCW7Gug0dURdNpnfBTPCkjatbzsa+5J9nzrv6wFYck2cEbYqwuk
 7ztk3ex1TVD82FiT4+JGzkPzg6/t0ymzBo/wm86XaFWJVWplAT0gfd9/BE4VjZyMcK8bJmpOiWR
 9jxuQrKn+ROVWVFZEb9j2HMyryKsaVlbbaUK91hHUlmkvLadwoDW/HjHobO8ZljD4GOKWbOWBhd
 pe1QKH6sHtTWkZu/B1YrkeDHj0hC4odRDtB7PTJmp/gibGxPHdDpbRCpNGiR5S0uRhDgkYcy2aO
 uz1aMlpi3AHizrAVI+NbSV8929giHntn4x4cqa01/96eVS39L4uT7kyGY95Kl2T6izqRo5T6N9j
 3rrpCn1B0WnQGROS4=
X-Received: by 2002:a05:600c:1d0f:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-490a2a22bb4mr148349645e9.6.1780309800965; 
 Mon, 01 Jun 2026 03:30:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0f:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-490a2a22bb4mr148349225e9.6.1780309800553; 
 Mon, 01 Jun 2026 03:30:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490af0babdcsm4375085e9.0.2026.06.01.03.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:30:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 09/10] drm/damage-helper: Rename state parameters in
 damage helpers
In-Reply-To: <20260530185716.65688-10-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-10-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:29:59 +0200
Message-ID: <87bjdulfiw.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cBkgZ_ndk52YpMP5z6yFRKFFmiCJ1rR5LO_VCAY9AqA_1780309801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rename some of the state parameters of the damage-helper functions to
> align them with each other and other helpers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

