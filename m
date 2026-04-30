Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2113FF887E
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 00:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5153910E05C;
	Thu, 30 Apr 2026 00:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dZrRX3aK";
	dkim-atps=neutral
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832DB10E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 00:12:04 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8ee7ffd738dso138862585a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 17:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777507923; cv=none;
 d=google.com; s=arc-20240605;
 b=gAZf0/7cf2URWe/54gVaJK6QUbT2YCb74/YdSg/ux3LqHcMf0uBCMQPI32kjFE4HOu
 HIl27yaFzBe4MVQRo1Jm3ut4jvKXeLRBa5qmpJra/zV1qrO3Op7H4RQpKiWN9Q6nw5Rk
 t8UOlRcWyfEWuICuuyJXZNMv54KCGfRxxOpPhOpbprNjOPnfE0DuGV9dXldGwV2XxJK4
 OB89/duf2XflwFluH5JJijIe6cuj0RKvi/NRg721HPqhDgqyDbYmBCePDoX7X5O4BRQm
 l6P/ENJ5+adD1CNuLE2fisX4X/wZ3SmD6MmpN0MjK3K/odMgxVPMXe1iwNa/AoDEy5+S
 txRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3nEd8GhcPX0qnwWzFGTR107MFZJdj0/mrhBb3kZrZ6o=;
 fh=B8b8vn3uZHX+jMFqioK0j4m2suGfmz/K8r7MFbfkSaQ=;
 b=Blvgu18yOcFpUDzBuFGRFmwDJRivgMwA658Fc+ZuDsMb58bVic5gOpC2FOb/7yBwig
 WEeMXamNkKAhj2b0oxBhGBFIYKPGQ5fHv9Jv0fai5PJCzSbbTjRWo+gYoVanwR+eSX9U
 tMnn0j9NsLwCibSmq1s8R+mYgNMSyQxge3xAdny5w4MgGZHNZhWBqURrBV01vunXFmGF
 Hps9UIRFArAquO8e1A4fxUIkrap2qOowEISSoDLjIC2GV1nCTZpDqyynY+zA8HNH6mdB
 Y6O4+DSeWWx9WpsNQaYtaY/mKAlxhOa9Wph+ycBZCKQMQZy47p8kDEgnvmsLEuROUe8d
 5qVQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777507923; x=1778112723; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3nEd8GhcPX0qnwWzFGTR107MFZJdj0/mrhBb3kZrZ6o=;
 b=dZrRX3aKGFkQvQSXfDwv1hvSx3I26wan+UsYB8T5pXBJ6ZsrrPTGfKUHdWrllA9pfB
 gkIl8sPpKGOwpwrFdPPmAcgo+m1f06TSHUdbzevbgYxeZ7mzuzogTGJc2Tqa5hRG2f1g
 DJLbiZ1DU4Ppv9wflBdcQeGtjS8J7Rb6DWUEWxk7EJqJ78cdOSvgoboDoOlvY4k8DclI
 lXp+2cNp8lA8qD8P/fodQBsphxt5kojGODV7HeKiPxNn7uMmnBEV1Y29FiQG9ipJUWEe
 ABeJCEZ/qpRqd3KBBDwHYGahe1mYMyYypd6/dbgBGUqwLH14sFSm9NYZPS+bgf1nCw0Q
 P+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777507923; x=1778112723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3nEd8GhcPX0qnwWzFGTR107MFZJdj0/mrhBb3kZrZ6o=;
 b=nILke15slpmzEX/HaKFtQsYzyfdBRiYUQa1wd0v9HyZ+0szdh+yYqtBRGLDYpq3GiA
 w8/mMnWLhF/dCy5qE8B3Y5bFHRD1gM/SyCJy1Nti4N4bJoSmArPwz9zzAsjTd/060OZw
 rzmzwiNBecorTWqW2u74tG0zOg6BS3NyHWUfGcvXZ7AjH+mHGYwhyC4SFCVqDM+jXfQL
 z4iiIjkccXVJObbvhmiK43CKfuoKYNE3rlpe+iaIWZTfVCrASU0KiH2FJCzaiVfaWtzd
 zXm6y1nrVhrZJq/rAtHP1CnoUt2gb+XKd41EtDARUPI/kuIpLukgrSBi9LeaBk5jfacM
 0QRg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/WmRmohHynUleWNAtln1osjCpzH74qLm4vhL7D7Ki6JKyFq4XquO3tqPGbN8rvQDShQRaNFGZcJg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEgoxRjgA7ECRaXl6WxHgzNcolq8501Rxnc2n1zSt8ReSRqHyc
 IfTuC6zYHjtPikWzunMyBLbuifH478Ep2IiZDuIiWdm/109VXh+36pLYXl8VrtVl3SZXD7PsdI1
 ZcyAamJt//ejZ3SMjWuBRkPlecZTtJ/4=
X-Gm-Gg: AeBDiesSAEBa3JdbwBwILOepNK4NSFpT6Lzdg+dj10sRvH49m0Z4h/+EvhPyYRdX69t
 b42Sohihif6/ECvXyfqF+OwvRAAWV+/kCkd3vfcGWbkcKJcVSL7NqyfiIr4d9hAOu1HP+99544G
 s1iF2JUwxTUTwf9dLOPWRBaFx/jfk+F/NMsPFq1BU9dPNCLKhUkIihtWl8C03bGS4oHlLlxzKme
 7h4D5ZElK50wj/yN0yBQDnEnoSArwBvNNWzgO+TmvgLBVL4ZLOcIHPTyoEn8D8UcqrFFQAOfxIn
 PYCBq1L6Aw8tbOj+evYxCNbaL/jyBU2Kq4kgLFIkDXteBTtXwn7bcoqXjkKZY9XlgMhG9s9KNRW
 2E5Z1+KOQvsfZ
X-Received: by 2002:a05:620a:4095:b0:8cf:cc59:c0a0 with SMTP id
 af79cd13be357-8fabaa2bf74mr36635085a.27.1777507923443; Wed, 29 Apr 2026
 17:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260421012608.1474950-1-matthew.brost@intel.com>
 <20260421012608.1474950-2-matthew.brost@intel.com>
 <30c84c41-192c-44ae-a614-2b9951c55727@ursulin.net>
 <d7dda563-280f-4126-a822-a3d43ce5048e@amd.com>
 <aekygVvRz7mu+elE@gsse-cloud1.jf.intel.com>
 <5bd5ed0a-fef2-4bd4-b7a0-d263bcfb1c7f@ursulin.net> <87se8didkt.fsf@dancol.org>
In-Reply-To: <87se8didkt.fsf@dancol.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 30 Apr 2026 10:11:52 +1000
X-Gm-Features: AVHnY4Lx4MSky0CoYbtwC3YofIJZy4_67QHDp4CUlg5yy6McmmIsN_5LFWDlkIQ
Message-ID: <CAPM=9txEMjXVvxAOxx7GND5tQLO2sA7K49piXN=PBchNG11H7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ttm: Issue direct reclaim at beneficial_order
To: Daniel Colascione <dancol@dancol.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Carlos Santa <carlos.santa@intel.com>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

>
> Probably stupid question: for systems like my Lunar Lake Xe2, which has
> unified memory and (IIUC) no special cache-type or write-mode
> constraints for GPU mappings, would it be possible to use regular
> system-provided pages (e.g. from shmem) instead of going through the TTM
> pool and allow mTHP to provide the aligned and contiguous backing
> storage that the GPU wants? Something like GEM has, but maybe inside the
> TTM API?

TTM pool doesn't get used for system memory allocations in that case,
if you are asking for cached memory.

Dave.
