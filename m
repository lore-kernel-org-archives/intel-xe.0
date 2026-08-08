Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46F0C5AC67
	for <intel-xe@archiver.kernel.org>; Sat,  8 Aug 2026 13:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6E710E4BA;
	Sat,  8 Aug 2026 13:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bKwHgXhF";
	dkim-atps=neutral
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF53110E4E4
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Aug 2026 13:17:52 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5b14d1f9315so320102e87.2
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Aug 2026 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786195071; x=1786799871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4181ND2NJKpOA2iMOnWqdVFW1veQb7Y9g4ph6yKkU/4=;
 b=bKwHgXhFxt91W1Y0AE5shO+Pn1M7wUNzkJ0NrgoCuDAHYtycV5isViau1WjwuaRlsb
 OrFKbTEjK9IwgNckegrLOOYJx7e6dKloo+6cqnH9gniFNmMPde64+fZp/9xGoLl+plg6
 aOThOtgLn/ZNWMlJuwrahN4h5AwDQz4ZVi7ITGU3mM2NheUe3G7c9bOEx7YudW0sut1t
 lRboCraq+wnAZPS5l/tKiQMeDlfIRmnuGhFWMhxEuLmMxkwM2aV+H38V9Z3YSG5J2LSk
 nDoY4eD6toDr/ZjgHMFlrwiYl6/U0eOyaLdnAjDmwNJfV19w1hE3qh3556m8EMvh0oF/
 qNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786195071; x=1786799871;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4181ND2NJKpOA2iMOnWqdVFW1veQb7Y9g4ph6yKkU/4=;
 b=oVZv/xvfsQyLcmrL6broWUqxU9sl1sqoRirRyd6jJFKbMHXBUsfOEorjl0neOGzAZV
 CRaAYWkPECVQ4n407Sop+6V83uLZGdfHxeemInysZuu3lv9bMN70zPEdN/wF9hzONJAd
 PjUTBRY1Db07FvadikJ90edm/dWICM9uPcLHszXaL3HIhjaui2yAxtCXLBwXe/ySvhvN
 ARGcws5I/4tbYTC5EVmGTiBCY78Wcpi3I7UL2Tzd4X5JGnB3gppkE79oOo55+zD1SRtD
 VypRnVyD/Y0z37zbuxaQMwnQIaMSJAO72JwUF/LymzqMLUYuXv1iJeShSpNf56I0Qvlf
 trWw==
X-Gm-Message-State: AOJu0YzNuFjNm/87ZZA4LIWA8mAPrmZ96P7wshW3Ow3p3bSWv7pv/Dim
 dxJtzjEISaRv/iRaUtUpkf3e4k3uNZOVAqOJJKd/t8/oUOFYqcEcUkLPPoAi6TqStYI=
X-Gm-Gg: AR+sD11UVqc912ZeisY9cGJAJZl9aTUqbLhQ4kClu9XxNtJKt09CXCh356NfQvWKmER
 +A+yKLoH+tVajXjVGRpbJ+L8eICfmkavKI9KMIXz3WBGU2KI9fFMbsF/ZWD1uvXfbOdOA91KiHb
 MrCXkuTWlNHB5MMAUyoSketug2B3yDYwohZHIIypySs9wgNtgIDWHmMgmydgygSw4S6dMhOre3V
 V6BdKNgq0zNAz+v4oMj7/448gVLrdij/+8PmhmRGENyKKS+i42HNd3QJPg/4/tYOLNQFIIneuyf
 OCWzORniaQdAv/tHkA2pjk9AuCTSq27bRpdKqmA6qZ6eFOmsRvz8tUa8xv750330g8VEVuDnPq3
 9dseM/HvT/vliD1YVelKnzZyfpLdgyf8/uvweGh+5N7pChz9EFuSARE5AK0eoiPK/utVF9A9SU3
 nOAxsWo3zMbuf7wb5xvI+uWQXoTjR4Voet9o7T6OPb5DCHM+/GKYOsE0or170ADDCHdQVYNU1Jc
 jnNwfAS/Z2RKuuFa8K51kHWzQ==
X-Received: by 2002:a05:6512:2520:b0:5b2:d160:f9d7 with SMTP id
 2adb3069b0e04-5b2f4cc12admr4271530e87.33.1786195070726; 
 Sat, 08 Aug 2026 06:17:50 -0700 (PDT)
Received: from NUC.lan (danayer.ru. [78.109.43.71])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b3050d011asm947987e87.32.2026.08.08.06.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 06:17:50 -0700 (PDT)
From: Daniil Seliverstov Denisovich <daniil.seliverstov2003@gmail.com>
X-Google-Original-From: Daniil Seliverstov Denisovich
 <Danayerofficial@yandex.ru>
To: i915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: =?UTF-8?q?Please=20add=20my=20email=20to=20Intel=20GFX=20CI=20allowlist=20=E2=80=94=20Patchwork=20series=20171463?=
Date: Sat,  8 Aug 2026 21:17:02 +0800
Message-ID: <20260808131721.42273-1-Danayerofficial@yandex.ru>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

Could you please add my email address to the Intel GFX CI allowlist?

Email:
daniil.seliverstov2003@gmail.com

My Patchwork series is:

171463 — [v4] drm/xe: add DG2 HuC GSC support and MEI integration

Patchwork reports:

LGCI.VerificationFailed

Series author address 'daniil.seliverstov2003@gmail.com' is not on the allowlist, which prevents CI from being automatically triggered.

CI job:
xe_pw_trigger/1236617

The series has been waiting since August 3, and the CI tests have not actually run because validation stops at the allowlist check.

Could you please add the address to the allowlist and, if possible, trigger a retest for series 171463?

Thanks!
Daniil
