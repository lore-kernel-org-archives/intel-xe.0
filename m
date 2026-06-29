Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B71C44506
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53D810EF98;
	Wed,  1 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pg6Uf/8z";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8857C10E6DC
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 06:17:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso14693345e9.1
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Jun 2026 23:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782713829; x=1783318629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gD8QxoDHBMynsX/nmz6FeNsnsEwmzfTNM7CnqhTDUtg=;
 b=Pg6Uf/8zAOysXf7zhpINXifyDVSEdfQLkzKTAbsDMJzrsZBOZSRsoYCEA7jrkp0K4M
 XjQ+kIlI6/I6Qc/lwZX8Qq7LRNi4ILjxy4i2526vHzrRh1SXuV6U+LOGeXIBfUljcfLB
 euoC5PyxK/Fu4suld3oTtdafLh8DcQVMLSTtZuIQwSRim5Y6KNpkARNeT3Tvhg+ytaVI
 IAtKjDgU59Fi4WnrUwOxQVd9hOUs65t9cc0asskD9tTEXlPckK6xRi9ezG6vCOnqlEGB
 JD9oPl89y6or5v1Mt7lzIvcQUO7yg16yr0YEkr1ilPY+mX3iMzBVmwP78kGhwde9EJFX
 5gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782713829; x=1783318629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gD8QxoDHBMynsX/nmz6FeNsnsEwmzfTNM7CnqhTDUtg=;
 b=B+FUPXkhI0yJYooFcO9L32ZVwuAvxCstHWIOwfuO81sZr/XL8b+dz+FFTXUFtCOV+m
 5JPxRcOv6LNqDy7vraCb6s9pw6/O/0cd8m50+A0QKVfiRbLaWriqixnwkeMiWajeOFbG
 XboXXSpMAUW18tsbvviBTgkpFF77FiB4sxFz29myAxWF5OW7aI9CaKlMYxpZnqSwj6lS
 2iS4Hm0XM0g+U5eF96w+XcXHXn/cF3i6XkK5Kd1AF/XGHljGr347VGrcTmODVnSNuNej
 PZOd1kArGzIV7mmcW02vXb9W5REZ3nys3Mquef1O9WDraiU+tXaJTbVAH45NcG/4TaNc
 lu8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9eVobhHWDh8Pv9vpW4dYqaevHoINbRHastAWRL6KozbdZP8VGSDQla+h0PRyTr1t5XIx4KAdJ+bw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjWkqRczakzi0fVU+HwjJtPdurMQWcuHTF9LsOMuO5OvpxrBxE
 FQn9MXWeDS8Ah1XlfXuHw2lzPVYSvd8woW46AxvOwbFVirmL3uhgOAKrVHfvoxwe
X-Gm-Gg: AfdE7cltu+HVXWc9igvfLKeUsuKmbx0tdQWtxTvuD7pgoM4dYpwheHz5tTatO8FWOmO
 06kahT83BgxlEbUq6z2yAxln76yRrfMHboFV/SzKIT8Ru5H13v/EASyX/RkAv6CaCdlXtsrNloo
 Zi5NH8GJxFOcdc5byc7vCtc18RluVyabPwlDjDR46B4RpSo6zjL3m8aJM8u5RBsKuna3mrNOGX1
 tgVpNIuShL81ophQrx5Wx02Jh0z4YeLMFoZGaw6aBSJhxtOG2dWJ7/Lo9PRrHYMrsFlYIKbYFkE
 Cgwb5uvOIJbfYUaoyNyjN0YCvLm7QoPd6FKf5lWXPxFjh8OlVx29NVHgdCBTQ5W9FCsd6O+bvq9
 xSqFts7YlAb4gQkTL3PQ1iQSN1mgCjM/BLyaqEdQDKPkEUnHbigLjMwX/DA1kF3FuLe9R9RcEwf
 qSIKlDBoyzoQ5V5kJHbhW0F5gzYmD0p0FqTy4XG9JEAQ1tr40JFAn7kXkEX2pRkWKsGQ==
X-Received: by 2002:a05:600c:c047:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-4926fc95e86mr104276025e9.30.1782713828484; 
 Sun, 28 Jun 2026 23:17:08 -0700 (PDT)
Received: from JTOLLET-M-FKW7 (232.64.3.89.rev.sfr.net. [89.3.64.232])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f7670bsm281334725e9.0.2026.06.28.23.17.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 28 Jun 2026 23:17:06 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, arun.r.murthy@intel.com
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Mon, 29 Jun 2026 08:17:05 +0200
Message-ID: <20260629061705.55335-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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

Hi Ankit,

I noticed commit b7d51d65e4f1 ("drm/i915/hdmi: Poll for 200 msec for
TMDS_Scrambler_Status") is in drm-intel-next since June 11.

Now that 7.2-rc1 is out and the patch does not seem to be in
for-linux-next/drm-next yet, could you let me know what the expected next
step is? Is there anything still needed from my side?

Thanks,
Jerome
