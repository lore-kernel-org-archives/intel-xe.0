Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9030CF513FD
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 05:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7510E35D;
	Fri,  6 Mar 2026 05:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LAmke10L";
	dkim-atps=neutral
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A3410E0F0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 05:46:33 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-64ae222d87dso8063237d50.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 21:46:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775992; cv=none;
 d=google.com; s=arc-20240605;
 b=FXCkvpbMV75arc+R8nEkEuil8GmsmgXwnNVYich6G4FA3BRhFmpjOppbTaEr/9/Jb1
 OIh8PCe5Gj4b7yJBa43q1wjr/JfVt4VxS6/gEF3RPpIpz7FwSE1lWmrTsfcvaHxGhqFl
 BmFitfM1XZkuY0vriG6/3CXtOTT9zMCxryG+Yxhyt8amHJrBUN6Ve2yKYYefWHPD4AKD
 URZ8D6MompFgZuLL4HHtV21Ld5Tj2hJG0osF7dWzHHLvXPOmKFXpiAojult/U7KrFJ7I
 P9UpMcDjiAtLBg6+KsYvk2VWbS2rCVsrUVXDctZBWjAovDnGRgbjrDQ9O1F1j54eukZu
 BFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gySPSmwSpyr/gGsudI7ZuhMGELf9TNwJtCU3S8Eju9Q=;
 fh=jNdwcPegxr/smMjIgeMG7ZwNu9oeJ90P4km8uEAiD5Y=;
 b=VMDcfcUWjnlUGuPHtDsGjMLTCTdDnJ1KjoKKy3YMozdVftV3OHwlzn3ZRfflxu0JVl
 JOPd24ZtKZEZQ3UUHR+qRO3pd1YEmYiPLzfhzYhGSfjwI5AuuzlfyztUd2vgxt7NT1Qs
 ZO3RozzUCLO5HJVMb8MTxROzQHMVkZPWRXeXTdFdwMR65bKJJW/UMFL9fQwirHs/l4D0
 pvOuGTDPVXrfi1a1rqEtv+YBdjitPsukgr6IZ40gPmyjn3u2UzuGYH0OftUo8P03bcyP
 eaNAFJTctU3wMbLRmo+U2+699PfZE+DGpoSd1I5QVDZJ4phRm5SmIVvSLkoKzmBjwXfB
 4NFg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772775992; x=1773380792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gySPSmwSpyr/gGsudI7ZuhMGELf9TNwJtCU3S8Eju9Q=;
 b=LAmke10Lqo0xtdbzuw45IGXQ7kZCXCXHhYCE8o5NpClnQ//eyfxNXdSJru2t7VOmJ7
 IQOZCnTJD2tbxwsyi2WrWf5dY/Gx6nngk5GbdxM37DIRDvxJyK2fOVwTRQl41/hUS8O9
 B7+BJ3M4dGJo+9mN1HqYQktEP27iL4neoORoL/TUqawuXPiEqUJK66GW5EyuIOZXZ4mI
 z9NRvJ7XaVnDxlqnUwWyVHhU3fY0shimNbTM5XC5gYo+/vc3ythWQgPOQ0cJZihGhUvM
 zew8RBc6SLnLckja7wlKHlsFWkskvvUsaJsJNa3JGbaKk23usiTd6Bpg6yZO6bNWucV4
 nPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772775992; x=1773380792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gySPSmwSpyr/gGsudI7ZuhMGELf9TNwJtCU3S8Eju9Q=;
 b=UBpu1KeDx8uSavurlPcJRJOh1iUVCN0aY4xpBbZhM+ark4NGi/lSst0vISlHiY3wyo
 a2PacJpgmld39NvXwKVneEcFwiOnhOJHKTpNB8E0M2hCe06geL7/lrqmsdPhWpKTJKMY
 1L3pqPkJVqspfysXDOCuIdCgB44kuE+FTWG/J1VKz487gVVaZ2izfKTie/NbhnKkUkUp
 FvjtvQ+66urrpDf9J+oxU2WRvlIFmokRJyKDULkzC28fuPWhtFX+IUFZETCxlO4Vt4XI
 8RySxB29+6Dth/7iyQud3I1g6x0g7cw0OezEvxqDocr2ZQIPqBasXohFSHTM7vbXOijf
 ScYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFOS9iXGi2VZDPjvZkEGvkIvT7T5wD425MTEfJAAyWVFY0mTwsRGP+IuqngA/cLE5VbWuu1HDf3w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuPCp5Ecn6n9s38iVInuSFbZ3go+cMTE8LI1AdbtErTsXV6AV9
 lqSYAMKNjDDBzV/jmPxymx7kP03gQziYAcb2VSq0vb6mM9GTYfSbQ7XHPx5c1HjHdQJjwIWg6p/
 tb2g5cfOVQp2jdMxFY94dDcgEtRiKpwI=
X-Gm-Gg: ATEYQzyqbp5C4IeOmrwqAzMZqKuJZ/jywSGlyRGQW67f1BukaBGACawqTDfM8WmaX6P
 V4EoLV3G9B05D8TAJ1y8m8w1CVgwt6+FGg8NpHjXdLWmwITaiKmJtG+RpE/MYh44w1xM5ytpjfN
 XBSShZ2BSJE36Ybx6ivGH2z7LGyvN1RBeA+wcgYOiU2VpsFnFP4ndRR9Pf4/XbNW17FxJtNgQAX
 Zvp49kba96R4on2QSEfRRohpPVlV2Wbevl2oAK93WR/EPefF091ZiuuvAX1Estq8QGkD2h+nnqQ
 IUhxuJ9KLbgQYbdWFMxFd+3uVRWx7BqZiOW21Pn+8Fh2JGxVdGMn9p4O2kRUB06yjYNwv1IJ
X-Received: by 2002:a05:690e:e11:b0:64c:9af7:6f42 with SMTP id
 956f58d0204a3-64d1406eb11mr825686d50.7.1772775992454; Thu, 05 Mar 2026
 21:46:32 -0800 (PST)
MIME-Version: 1.0
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <20260305230948.679-1-hdanton@sina.com>
In-Reply-To: <20260305230948.679-1-hdanton@sina.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Mar 2026 21:46:21 -0800
X-Gm-Features: AaiRm52M38enSoQxpr3rvVDWJo4N9JWznrpB91YzTCfq16i8XIPMihDOEZCRuS8
Message-ID: <CAPaKu7RBw9mzvQVznX7UWhMTXLVU+tcaOVHtNP2FmoT5-D+daA@mail.gmail.com>
Subject: Re: drm_sched run_job and scheduling latency
To: Hillf Danton <hdanton@sina.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, 
 intel-xe@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 5, 2026 at 3:10=E2=80=AFPM Hillf Danton <hdanton@sina.com> wrot=
e:
>
> On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > Hi,
> >
> > Our system compositor (surfaceflinger on android) submits gpu jobs
> > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > to run_job can sometimes cause frame misses. We are seeing this on
> > panthor and xe, but the issue should be common to all drm_sched users.
> >
> > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > meet future android requirements). It seems either workqueue needs to
> > gain RT support, or drm_sched needs to support kthread_worker.
> >
> As RT means (in general) to some extent that the game of eevdf is played =
in
> __userspace__, but you are not PeterZ, so any issue like frame miss is
> understandably expected.
> Who made the workqueue worker a victim if the CPU cycles are not tight?
> Who is the new victim of a RT kthread worker?
> As RT is not free, what did you pay for it, given fewer RT success on mar=
ket?
That is a deliberate decision for android, that avoiding frame misses
is a top priority.

Also, I think most drm drivers already signal their fences from irq
handlers or rt threads for a similar reason. And the reasoning applies
to submissions as well.
