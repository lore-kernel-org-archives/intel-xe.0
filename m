Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC45BC5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 06:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8A10ED3E;
	Wed, 19 Aug 2026 06:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IF4Z0oZ/";
	dkim-atps=neutral
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2710ED3D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 06:56:05 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c15ba3a2b4bso82357166b.1
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787122564; x=1787727364;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3ISvHdVx5NNV/ZYzWt2FMv8YK9yLKQC7l7IY+HralrU=;
 b=IF4Z0oZ/G4BE0freMqqYGceykVfcYccS4Ka2mWBz4opk+3cD9qrYxUhfl7+B1S4mTK
 OKZq6InBtqDt9oGUChTyL6ODOK5CY5cGjryqGqAjjaMrEsElkqYCUGPuXDVTxMi1rrMT
 GfwAW8N2UR7boD5S4vaQOIZkoi61UOZpWBe8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787122564; x=1787727364;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3ISvHdVx5NNV/ZYzWt2FMv8YK9yLKQC7l7IY+HralrU=;
 b=JKqMrFvuobYg3cxZb7fA5Jh2yAaHnGc2eprogQ5dgep24lu+4djt5/imb9iyNAHCn+
 MyeucRk7IXg6jaoHeAxTHFrO1y1xezcmUVT3fd+3JoqVtNWEhlABRQSgWnuFShpadCk5
 bMxBO7T4c6Fbsw1XgeqClGHlRtBCGJ47+JBJEDZpT23Yp6sbRa/YYGfQbw5BNthgBnix
 SkqDQdOFQafzGYVWbXlszS51po7Peyrjx727+hINcFXuo1mdDSsaMRYM9JeOpOPRJMY1
 oXjA3JNajBkNhs4hNs3hO5iNceekhntoAj+JKUqKphUUeHm1ll21cMwMup1n9KNstqsi
 udCw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpcJy+7Cck1vCvaAHl+HoCZPG3K4KZJRh08YTWizy1LM6flmKPn6P9sQdtn7Rsjx2UDihf3FGJicw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU2yBeqKmajQUCdAtNyNs/VuynQaVzi5V6QexjZZWYkg0SRMFP
 ZmIpzNvXCDkW989TK2qNyDVcX3nCxe6KeBGkrA68uH5NAH7Hv/KQLFgmYxX8Xw23N1pkD2rm/zu
 7HBcHYSY=
X-Gm-Gg: AR+sD122RF14sAzu/LP/MqXkfO4WoMQACayhsVeDQTvCAFJNQ5ozqJ6yFa5xV3dYRTp
 BZuE93CuB5+7Wg97XAWSD1nYVmbHpMpHabtn2XCVmUwbeWaIOYYzYH68RPSn38G8pYqF1ohSWrL
 VNdOCb2boRpbkD5UvRsV+Yg+UJ3FvInMVxx0O1QeNi6kmrZIrvpOWj8qWF4NVwf/TiRW9b1hw5o
 OAqV3UhSUw8cyTPmt+QQV7iz+V2Dkvf5Gy/GQ4/LBKI4uoQwzC1c/5WPZvXhbf3T/bJoNeuJQ6y
 EI54rRDgcEgiF0qliYdA3u8AGNCqXX2/vLqdvf2IhSikXr0SVn0/r6LVl8++yn+klV+uUiDn9Ro
 qzeLtudh/KTlEw/13/j7oYlFRk/zVUt9cpeRGysItKOa0YR65eiQuKG5sfEk5CCew7xXymlqPj2
 is/85tqroaC0LhszZjXRmd9kNOVC1q6mkZurx+2kgORCcKSRnb1fICEvkdizWqkm5yS8/pdhf0J
 nJjr3TAiAr3T+t6Hi+U9Si79opWu9NBPBBdWw==
X-Received: by 2002:a17:907:ea94:b0:c19:49ee:19b9 with SMTP id
 a640c23a62f3a-c242e215190mr122701966b.15.1787122564031; 
 Tue, 18 Aug 2026 23:56:04 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c243c78a4bcsm33842166b.29.2026.08.18.23.56.02
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 23:56:03 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c16794450aeso85620866b.2
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rqdb+TWSdHa+6I6ej4uAc7FEuPM/PSXf5OnLleHr7oSYizewb5CgM06gCzj1xjOXKLHrnRcTl6fug==@lists.freedesktop.org
X-Received: by 2002:a17:906:99cd:b0:c21:74ed:4608 with SMTP id
 a640c23a62f3a-c23f9750de3mr137322366b.10.1787122562579; Tue, 18 Aug 2026
 23:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
 <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
 <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
In-Reply-To: <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Aug 2026 23:55:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
X-Gm-Features: AcwNN1XoNlB6Jg88sFbQERhyg6-m7rz4jXRQR6ymPHvlXUqlK934fTgVD-Ok8_Y
Message-ID: <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 7 Aug 2026 at 10:46, Matthew Brost <matthew.brost@intel.com> wrote:
>
> I think we may have found one. I haven't been able to reproduce any
> kernel job timeouts on drm-tip with this patch applied [1].
>
> If you're still seeing the issue on your end, it's probably worth
> pulling it in.
>
> Hopefully this fix will make it into your tree soon enough too.

Well, that Xe fix made it into my tree as commit 9f83c94469ff
("drm/xe: Order ring writes before ring tail updates"), but it turns
out that now I can generate those drm job timedout issues at will.

[  +1.222075] xe 0000:4b:00.0: [drm] Tile0: GT0: Engine reset:
engine_class=rcs, logical_mask: 0x1, guc_id=12, state=0x3
[  +0.000041] xe 0000:4b:00.0: [drm] Tile0: GT0: Timedout job:
seqno=4294967171, lrc_seqno=4294967171, guc_id=12, flags=0x0 in
systemd-logind [2068]
[  +0.048338] xe 0000:4b:00.0: [drm] Xe device coredump has been created
[  +0.000001] xe 0000:4b:00.0: [drm] Check your
/sys/class/drm/card0/device/devcoredump/data

But at least this time I have ssh into the machine, so now I have that
devcoredump data file.

I will send that separately off-list, because  it's 2.4MB in size.

                Linus
