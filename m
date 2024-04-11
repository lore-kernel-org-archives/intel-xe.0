Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED74C04FF6
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 12:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F28110F5E1;
	Fri, 12 Apr 2024 12:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="EWxpxzrA";
	dkim-atps=neutral
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2222510F469
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 22:40:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-516d0c004b1so449138e87.2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 15:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1712875203; x=1713480003;
 darn=lists.freedesktop.org; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4TnsFcjuXgA9nuQRAvIeS3/zSNBm8/9BgUmS0MLmqs=;
 b=EWxpxzrAP05nE5WhVpSLWMoLHhgLWaVwOXPs8qpumJh8khPnupLIdB6kFWMMLe7y1b
 EoHAaIzUILpYmbaLYx2c9L5FVmbcIoZnnD0XKBjFtyU1chCx8lifdN9AR5f5sHqW/hca
 qeQVDHnOLPFWKjeGXj1iwlDCvTaUvPUNNps3DIX5wERuST/4f3TKeo1u4xsil1Uz0Xhn
 zUZd99H/a1k5ZCK1gEuHJi1krNlC84Fp3ubEFxZ4dCWOODdV0Kphj8LhBPxcUDfntOPe
 L6zxrpRHgUHYgSd09Ykn7zWA8tM1Gp5H5BfDWY4kj38MpkFd+YPw0aqFHxl1cTNEhcYl
 wDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712875203; x=1713480003;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4TnsFcjuXgA9nuQRAvIeS3/zSNBm8/9BgUmS0MLmqs=;
 b=gm5Eg6j00AGSa+Vha4xLgRLAuShIu9eTys6bRiEXrXY2GlWyBEyjqtZ/r9q9qYsAEz
 6Cc7KvMACAVln2RJAxaZoRYyAJ33h2rylSkSJZD0zxpYD29ngQmpMp83PZzaZbIiZI6Z
 UhofIacRzEza/KtzPTPOAGXtV6E52OScilhyKbtQFOuvOKlA8j9m4SNheXES6Ao0p9K9
 ePBcU4vH7NhAHFG40KVVgWmlExILZhBDTcP/v2pVZY0pgc5CU06Wzy4kJJG3LkMswtDZ
 8btSLdVVrmh3kDfgviYkagM2AVXQqPTRzfe3giWL7cfV3NzitdlcGo7eha0wq4wzHZ51
 4YcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBILQmGHYDZfG0VsqnKwnp7Xzwtmdpyk22R9Vmg0Fvg9Rjg03vLKTXqwqdhlzL0L/tvul0uP2BgsDiAf6pU/34jS7Ky5su31t25zGnXF4=
X-Gm-Message-State: AOJu0Yw0wHzof56cfZQHHoKg11Y4BX/CIvXZI7xJMai9ny5Jcloi6oAJ
 qDYcgc/ZEyMkVb86+JmzyJBH0SU1UuvGtvr58ZRDuKdhW2IxUqGD9Jfa8asIQGQ=
X-Google-Smtp-Source: AGHT+IGY8qJhojjfCfabFUjR9vvGK5A/WLCfM1Bk52OhJKElMImmd0eUpMrnmf84M99SmcErfv1epA==
X-Received: by 2002:ac2:57db:0:b0:513:eeaa:8f1f with SMTP id
 k27-20020ac257db000000b00513eeaa8f1fmr649500lfo.47.1712875203340; 
 Thu, 11 Apr 2024 15:40:03 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:10c6:ce01:a470:5d20:8e1a:464a])
 by smtp.gmail.com with ESMTPSA id
 jx24-20020a170907761800b00a46aba003eesm1144762ejc.215.2024.04.11.15.40.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2024 15:40:02 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
Date: Fri, 12 Apr 2024 00:39:51 +0200
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 speakup@linux-speakup.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-afs@lists.infradead.org, ecryptfs@vger.kernel.org,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-arch@vger.kernel.org,
 io-uring@vger.kernel.org, cocci@inria.fr, linux-perf-users@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <193B959E-60A3-499A-BFF3-EA7B2D0B6C12@toblux.com>
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
 <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Approved-At: Fri, 12 Apr 2024 12:18:57 +0000
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

On 11. Apr 2024, at 17:25, Dan Carpenter <dan.carpenter@linaro.org> =
wrote:
>=20
> It's tricky to know which tree a patch like this would go through.

The patch is based on the mainline tree. Should I have sent it directly =
to
Linus then?

I'm relatively new here and therefore only sent it to the corresponding =
mailing
lists.

Thanks,
Thorsten=
