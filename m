Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5903AC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EB010ED10;
	Tue,  8 Sep 2026 18:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="yUVklsXh";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142CB10E519
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:12:39 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-9399ccafdbfso114408785a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 07 Sep 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788786758;
 x=1789391558; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dDBausewcADcia+BBUgNqpTK1ysJTTFUlremu8l44DA=;
 b=yUVklsXhhBPKctKXNUcjMj8VeKMwLt/1M6wItcPh0K3ExK45yFz5Ijfib7AY2/JFrE
 0s/CUC/KyPZjbyEnhpBCGVhb3Rze6Qtk3AAqT64YTd4PqXqZ9eopHm3Vs6CLsnLiRIk2
 e+RofE/afeGbBocXXblgNaJM/BshpgUnBvd0PlZ6Z6/LxSR6nVO65E+pmudio/U3D7il
 RdDeRCBrrnbCmFkWzqoywesdLHjW4oaVAROK/sh5oJ3PGJJtbnU8m6/XEVw8x7XSxCbj
 nVsSjIcZqkora6du7XZQmr5P8UjTX/m80HtWyrFxQsPBOysVrmO6x3h7gWHd7PyK5Y6X
 0HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788786758; x=1789391558;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dDBausewcADcia+BBUgNqpTK1ysJTTFUlremu8l44DA=;
 b=SE1rYT9uVqfJd9stDi6GkOzA05vLTc7Kboq5uHNuT3mYlZ2eQpY6xblVx97wtRMEK5
 6mcfyLQW0wll1KCw1ptgYL6Yja/ZtjzOFqnaOgBc2r7Cyq+B/rfGUYhsOiJc5GtINFlC
 BMmKLsKXd2qmXVjl8K5r3GcIKALu8FQfyiYR72zA7RWG3hKUTEBbnbU6zLrm3NrhiOH8
 SSdlhxnxWOaTHY4lk6M4zdSA+dUw3mI5yHUvqJSdZkPtWhDV78jNr2fi9bwD93pvwr4v
 08/5M/uJ4jcllpC/R2P4z/wr/Pe3J79vIfkAIZkfxaUTCu09IZ2wh910OgEgGqRea6g8
 N9WA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpXSh29GXpVrYj+2cSIK6F6k23xwTGgcrkqdMo/olRDf2i0eN1kxVe4LmXYNTfkQLQMUbiK4wgaA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nLdSYKmAvRVzHhJfHejk4z0ePXsuRZt7OFzUKnCRlnnt8vC+Jj
 rIjp7wUE06NHcYpApNG9USiWC2ai1o/ObNEUxsnI4Cih+L9tO2UbQpTe/QQssM6guFk=
X-Gm-Gg: AYBFou0zjvLYrN6EczQ5Lnd57cB8t/bk1jxoeFNIsx62JsaPFVIEG+4vdpTFuC7Tay2
 Qgj5FQzS2qEV/bh+VdtfVsQEim12c8sEPpzsjMyzp+p0wXb3Ye68Bt3HxmJGTxMPhclNL0XRRcl
 n054ab0VAaqgfYTSiDwD8tTs5BXLjqQ2Y/QV+XtbY8pWCpdDhJm50G751E6jQqso1O+cE88W8Pu
 KHYVl55T0kb5I0bHzVbQm9VnleoNfTLTT45BlABT9dxrgHhYdfkgWrvbj0/E9w2W8ST4n/J3Qx3
 8OuuJpiD5unA5L1YBdvArm6mGXRoBaj9EaAKYZqOlJBSiBWg5j/0w0vy/iKZrZT/JbpA8z9uEm1
 18W+u7mVEzt0ylvVvjYeK0Z5OvDHvXFq9z4cfZ6lAsYg+o5Mn2IS5acF2h8alewu0zvWupi4JWE
 h4s6IeLMxujbQNe7tlnptd7/3atJCrI/nM0AIG42xjxMrhgIkzh8CfsMyab8s3Mz3QPP7tbU6Q7
 U5+R09PovOwuMFokbJaHuP9A+xgWpfP+0UyWa4y2C5eBPJ2CU5gRAXtxoE7FMSRuvcW9mCXYVKG
 RhWargr4a1Ab3itZqWamCQ7STgvJg7Q3xkdPBYL53/oDmnB8W5hA4e6p9pOW
X-Received: by 2002:a05:620a:2a12:b0:939:518d:7f6e with SMTP id
 af79cd13be357-9398034352fmr2312249285a.22.1788786757678; 
 Mon, 07 Sep 2026 06:12:37 -0700 (PDT)
Received: from jake-laptop ([74.244.125.129]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397f9f151esm878405785a.6.2026.09.07.06.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 06:12:37 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Mon,  7 Sep 2026 09:12:35 -0400
Message-ID: <20260907131235.11904-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904133231.9028-1-j@metarealtyinc.ca>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
 <20260904114835.483057-1-j@metarealtyinc.ca>
 <20260904133231.9028-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:11 +0000
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

On Mon, 2026-09-07 Jouni Högander wrote:
> Is PSR2 working on your setup with this quirk?

No. With the quirk the link is clean (no CRC errors, no resyncs) and the
panel sits on a stale frame, because the engine never sends a selective
update. That is 9119. Without the quirk the screen keeps moving only
because every wake fails and the sink resyncs.

So the quirk is correct for the link but useless until 9119 is fixed.
Fine to park it until then. Thanks for the mmiotrace on 9119, I'm
comparing it against this machine now.

Jake
