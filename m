Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47893E73145
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 09:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8EB10E3C3;
	Mon,  2 Feb 2026 09:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="eGsy4AuH";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ED910E27B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 09:16:42 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-59b6c13b68dso4762689e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Feb 2026 01:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770023800; cv=none;
 d=google.com; s=arc-20240605;
 b=jDFZDVOn+RIIWEq5odJfj7v662NwZ2tyFzWf8crYhTft+nv0ys/O43ltOHup5il62a
 hMLx9LOEmQyO2T+5RRByB1Crn1P0/cM4LZhyFmimZfBEczqATv9NO01ecKO9ex8l1A8W
 imPq1G2BmbfQ4RMt6OeMO/iLd94pN93Dysh2yQdMslsjCBSj366HFrx+pVmN9Vk2q3j/
 t/fdd3F1CXF7RwPF2XVPx2IQ029PxyIjK2EZffJc9pO+3Nc5N5I7h3tB0ChyL1UokuAa
 +wNZEeUGf/Y1MUCi7dO0swhHLrQzYPo1/6350l0reGaNsyw2vuafc0cjd1zrzq2VoQNT
 eMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=R/NRB1DGTkm4ptQyWhhpF1o6WtxIIheLLpHt5b/iWMQ=;
 fh=yZOS3vo+3y6ekC0EpUCx39L8V60inf2l7PuAmdwHvl4=;
 b=HJC3aB+wt8CXbsOy0cBHbaB6zuRSrY7/d7oCXhZxZpLgcaWgVvQBUUuWW+IYXUjFbe
 PgjtcawT8l6Y2rBuHn8N8ObGt8t+jPoJXTSRf1gZsWjpHzWlBLZiSZzhx9X2GIWiBxzj
 58vWDEAxrGzZsMpHndilwFZWyQk+fMLbIVaLW/BR39stkvfpgLEkIQgBnLmW/cs3j5Dc
 Gg1jC/+Pr8ac6ExPZRKP18UNiFeQDO1ZQac7ukcjAWsicjHt/tcSiEDD3IVK/AAkr/Cx
 do+pknLYPHoUI+Ngn+xk32IikAtULELZduvBVPO3X00YJ5vrxcQsYSdPexTZ6pe8HXeO
 iFlw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770023800; x=1770628600; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/NRB1DGTkm4ptQyWhhpF1o6WtxIIheLLpHt5b/iWMQ=;
 b=eGsy4AuHypeeSZADFijjCdlG6exP/0lqSw0+E+yN4kSbWcNnN26N27NrZCKLWflJ3p
 IvVxPT969Xjyk3X7f9Xs2ADP4L8D4hD/BnkSSEsIc19uEzT9hZvOMn5Po10aC2YEodB5
 3IMFcBq++ONHcWpSq/F687TuGZPe8zUZqBAB4Jnb27fTZoq4CLYrCEGLgqQbK9+A+pCY
 a7HPubBeyYYCzOjIS0v4p27jbFpljZU9ynnCMirlkgKSsGf03Dhrn+6cnLRPpkYuoE54
 dYTPXAtF75P/GcP/3lUdF2U6w/DCCw+h/4VL5WivyZADR2WVprkiCvflce1GMJtEOdI0
 fGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770023800; x=1770628600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R/NRB1DGTkm4ptQyWhhpF1o6WtxIIheLLpHt5b/iWMQ=;
 b=aHnx0mjCuwlC2FOocmUC+woQy+5NI854e0OhEy+Ul4HVEM2lRoxgB5g3m/ECusBjRy
 Wd9+BROpsmAfAP8/WO0Aj68dlbmjvlK2LwO0vFJ52xc7h3OnFnlKw2i4f2uZhAeefyZn
 hqiEeu6od7fkm2WyaJwC2rnBOjeuanh9UoB5RQfq4NWQh46j7VCPbdDVh0HJYFyPkw2C
 sVeWYH3raAEDhEEsiv9Cmwk5tyRK3ius0BDSAXsFdABBmtFy3pcmPLSe1c6EqXc5a93f
 bDgx4/JwTd8G+RyjrW7XLRNl8BkFnK3g+9UEqwMZK5JQ0NoqMlTOiOXfL0ynDmGQ1unK
 aA7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxBbcmfKjVznl1DsYBeDYye/HIJdk75Sv1zMILtbU8x/jDPLNzEEONsYeXPvE/+Vjv+wKeTa6rrw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwktA+08uFWDwyrDT3o11OnWb6QcC8XSDJjk3S92unv2l9IkVxO
 vWh6gRaXI5pKGv18t9VjIaD+30ZtMpE2KdKdLfxxB6Vk1ASH3THF/MXunaCw6amQNKZl7noZCp2
 OqIbM8UMgSE5JI46HziYs0dk/wB2AeCb4DmE7MdIX0Q==
X-Gm-Gg: AZuq6aLKMOeOqlfM99rfWhhAzb4OynEL5ZuKbHYbigt7RcRBQ7RUjh+UA0/4ielS0sX
 YrFiJqeNZUfB1TgEAKkDwg4gS34kfBtD6fsPGpUfvnPjxXq4S9VMhPv5rMNyBClMEMKnjiCD70V
 APZ/KoRdkT56gwR8d8XKFSyfy5c+vqoYJy1yYyagUged22wvKXpPt6GBK1RXPEAlIlTIBYZXnIr
 91VMJJmZhzYL1DD531GauEfwD4POcLMg1Pz9VZ9dnws9anc40DcdpAxzZijzuoA6RZFg5Y8nDYJ
 PemO1PyCLqlRvLtqfdGtNwrbZUZQ
X-Received: by 2002:ac2:4988:0:b0:59b:b2f0:d2e0 with SMTP id
 2adb3069b0e04-59e0d8a7ef0mr4247440e87.13.1770023800494; Mon, 02 Feb 2026
 01:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20260124145401.44992-1-marco.crivellari@suse.com>
 <20260124145401.44992-2-marco.crivellari@suse.com>
 <aX0qzAHieOEAyD5w@intel.com>
In-Reply-To: <aX0qzAHieOEAyD5w@intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 2 Feb 2026 10:16:29 +0100
X-Gm-Features: AZwV_QhqmhMVE8BCRe1whVS_Y_pBx9ytwTjV5QVHI6x2n9sqYo1PSqVumqHFup8
Message-ID: <CAAofZF6ZA8pnfCnFzAu3FxPxe_p3R5ZHao=kij-qwrT6feQ2bw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Fri, Jan 30, 2026 at 11:04=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.c=
om> wrote:
> [...]
>
> Thanks for improving the message.
>
> Could you please rebase on top of latest drm-tip. It is not applying as i=
s.
>
> Thanks,
> Rodrigo.

Hi,

Sure, I will rebase and resend.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer
