Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E28C5DF8E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 12:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4739010E525;
	Fri, 21 Aug 2026 12:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kIs2OCIa";
	dkim-atps=neutral
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F00A10F1F4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 02:35:02 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6a17211b9ecso1577995a12.2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 19:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787279701; cv=none;
 d=google.com; s=arc-20260327;
 b=oCMGINqiAa5Cq36vTWBz66rHznj+aC5WQaGVCEjuycIjiuLEpQK3rWB5GOOYYT4toF
 kivizyyxsIWWWONdQznpji73LqKOPKSr4MfQLBqy3e03eLKNKh7s8mcPlanN3enXm4er
 dUbxYwLOetucpqGYK6pe0VKBCHiA/vBsvQa9dSfFYbfY92OHRFZ3jorH5K/GEPrq00ub
 Q5i3Ny6/J6Izw/0P/HEli9US0EeOKnLB34KcIChRQLeYdrJDf1HktHPtMGz8Qu8PkBkj
 /+gNoucbJNvqeIqmaZcevLOmzoSnpLdD6pEcu2Z/Fv8RbVpSJOWyWPrfUMnu0xzd/MeU
 +vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5QZdcXNBQdr13U8BPGDODnZ5OKZMk9kR7dBUEi3Ksl4=;
 fh=BrRyuI4fTAhUkWG2NT3hrSAMIAi9GzpJGNXtaXKbrXw=;
 b=OBaIawdlep8HexqNP2gyCu241aGu1NUNBcmtR4QOeV21tb+67AMSBbj03bPWKXiVlo
 2X9DM2amLf8HEPNSKrk4wIWQw+Lz/tD+av9+uirggKpDvlNXw1/jwAk+vYCOSfS+6aLy
 F7HxPRSTE7niYeqFqfVUL55Cn/awhVZEec7/w67UH+uiJFGUfR/FaYGMPpO+u1/1HJQz
 P1hDtOQhGCKQgj+uxWAdkmSzPoa0NuQeQBbAkVkz9HhYXF8k3hBWhwFXcbDGk+yVoCCU
 YNjE3MDxdo+MEmeDkTIUO28hh3uSeTBqojrJapDhhHCRlrhcuOj+oY5L96WYhav1sUoD
 YfKw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787279701; x=1787884501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5QZdcXNBQdr13U8BPGDODnZ5OKZMk9kR7dBUEi3Ksl4=;
 b=kIs2OCIa2qnVF6vkak7z+dARn5GKkWDaHPwcvmWUCVIs9hWpbAQAzCYrXsWJQVcVLe
 6/ONxkTXkc9dPrZ1VdRttmRmHQnXNmSd78SRYkiu0QKs9LoS2M3iT5LO9vpyPHPb7gaX
 GjdersLBPnCpax7nrhO6eOb8chRQ2r0mLc5GJCgeUCn2x9hnXA60qYrS5vdMBI77bGj1
 f2xqY651nTb2SEcTAvl9U9m7fz0Ivg2iq16W97cXo5EXF7SfzCFbS0DrmbHI/VPyoAcU
 ov+V7KDLZEaa7Yx6uRSH60PRtQIMDP0SQDugwxgQaHfpUdmBqsKQpLgLgr+dfTPc81U4
 7GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787279701; x=1787884501;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5QZdcXNBQdr13U8BPGDODnZ5OKZMk9kR7dBUEi3Ksl4=;
 b=YS03YX0mugtB9iNytTby8sPlaz3Uy42K3tgUmLoiylhJf41flkHb+eM5izQ6YJVASb
 GM9RdxvRrE0ZjKh1oyp+8cljeiCoZK11fbwAmxhTCzx+/HJ0/wRGKqawnYCt+3hCgJ93
 V4Xz3+zIS5+wYE1lI1NOUcAZbGnJ/LFwEmmkNlu+qbTznH3BbqgHkCId4CsmK5j/F7XP
 QI3U0BloXOGBTIIHz0jXK4TPKEE27SRZ8vVp2wLxUFjWrZtQ5hWM6YMn18X/axiBWQdw
 qrkSLe4dFalQN6O5SAwgGPRLZMUWv40D28IJt9kOe6bUUP2ljsYzJBTkJXax/3f7SvRH
 kE8w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVMoAZax77eaiRkpGZjtV1ZLtFgfpAp83tzIGrDMTWZbRUG7re0hKWR0eJSkc61hyfUSI9Voq1SA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++k/x//hbtQYkQFYEZGB4ihdpDFSRNzTKM1M9ymbb6CjS6IjMiRf
 Auf8CSps5Ew6us0sJnunHb7md5IYPWlx34TtEDRCe+6cz9Lg30e7i25KhHBGPQuhwSHlnumsXEH
 6HqjWFtElx8FE6omyRrPus0iwqWym7qs=
X-Gm-Gg: AR+sD11c4N2YWhP/Qbict7MX35XXXqQ3AT3QFryEtDPsCAsK8vYKdu1ytEpwuR/fDTU
 Z5rgQRRYlhLBM1oI3EBeOEbrZ5w5BnMdm1oX9QsymRAMlDzlwlruEdWBZMATPQrr22dP4XXmOcz
 0SmMRoRB+3LrD9TcSkuUovXUEaspdbtcTcRT2n0iNJ4LkFt3PRX4KFNal+o9onimzdAekZ+RCS8
 6qxh5AFiqnbT6eLTQGZSCMk7KllEJxiX95s+p8kreK22qNYOz0bMgT7dFUtI6QM5rlPrCR3Kozm
 va1h/66/Xtr8Sh4d37bgJsOsGtBFgiwGSXw9KmJJw55emXK+Je0+AZy7nYpeubZclLtSkMUvqSK
 dCm76AToLiQsEW+rSRfLq/2CzZcSzbpRi+wX8arhmMtw=
X-Received: by 2002:a05:6402:4584:b0:6a0:a4f5:f4eb with SMTP id
 4fb4d7f45d1cf-6a42f1a5f37mr3225955a12.4.1787279700689; Thu, 20 Aug 2026
 19:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
 <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com>
 <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
 <CAMpTW2fxFRrpn1b5WGYBrtLLMfUo_fmx9s2D0b552GJp-sF5qg@mail.gmail.com>
 <8b7001c68c94491095f41d2a3dff45090c0a95cf.camel@linux.intel.com>
 <aoeUdfrPX+0ZnZMr@gsse-cloud1.jf.intel.com>
 <CAPM=9twBded3B553KYzwDtVd0NbhbAwbiVDGw_bdrmBnOKgtKA@mail.gmail.com>
In-Reply-To: <CAPM=9twBded3B553KYzwDtVd0NbhbAwbiVDGw_bdrmBnOKgtKA@mail.gmail.com>
From: Nathan Bourgeois <iridescentrosesfall@gmail.com>
Date: Thu, 20 Aug 2026 22:34:49 -0400
X-Gm-Features: AcwNN1V5XdrjAPd5CfnoI9GnFh3eZ9Ur8FDV7w6rT1a-sJ-swYUViTiwIvCxbOY
Message-ID: <CAMpTW2eXS9tBzppJvvfZ-FiwoJ5MKOAdB9sqYgCDPVQ_+___ZA@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
To: Dave Airlie <airlied@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 21 Aug 2026 12:52:53 +0000
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

> Shouldn't we just be calling xe_bo_validate() here instead of
> ttm_tt_populate? (With the correct xe_validation_guard() wrapping).

> Yes, this might be a better solution, making ttm_bo_setup_export()
> completely unnecessary.

If ttm_bo_setup_export() is unnecessary, I'm happy to change the patch
or make a new patch. I will attempt to implement and test this locally.

> This part looks good as different patch from what I'm assuming will be a
> TTM fix.

Regarding this, what do you recommend I do, assuming the patch
remains local to drm/xe? I'm still learning the ropes of contributing.

Nathan

On Thu, Aug 20, 2026 at 9:08=E2=80=AFPM Dave Airlie <airlied@gmail.com> wro=
te:
>
> > Yes, this might be a better solution, making ttm_bo_setup_export()
> > completely unnecessary.
> >
> > It's also a bit odd that, in flows where we don't have backing storage
> > on export, we populate with pages and charge the system memory cgroup,
> > only to move the data to VRAM when the import attach is triggered,
> > resulting in a copy and a change in cgroup charging.
> >
> > I guess the question is why was ttm_bo_setup_export() introduced over
> > just a validation at export?
> >
>
> I'd like to think I had an answer for that, but I don't. Likely
> because I wasn't thinking about VRAM charging at all, and just
> worrying about making sure we had populated some pages for system
> memory ones, so the other side couldn't DoS us.
>
> Dave.
