Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FC3C43602
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0FD10EF9A;
	Wed,  1 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPmV8Rit";
	dkim-atps=neutral
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8E610E3A7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 12:55:21 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-697edb1bf6eso1358030a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782478520; x=1783083320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QsVffdBc7bPXV4cXmRez2xscdfa7HYA+uxVYDAWdk7Q=;
 b=XPmV8Rith1nLwAq1u+oeXP1Ouc87ZFMUobr5R6b2gw2qnuOIkx/GAQLCXSbpM3OjgJ
 YQrFsIm6NF7hqGSJJ6dj1rpjO6cJNq/V4N/HHe71CbHOayIJ7h5VVC+NdW+cQBSe7qjN
 RCgpZBWkex+jshF2nlZOdwoKeWPSQhHpb+Zhv/x+ujwanqQjhbasmEwDMtBmoJeUoIYJ
 nEyCyfPV4nLHW3fcbedo8A2Xp1Q3OMxVPyMVRVREaHEbq8ewtIHdkQPlTPm/wxk65KBl
 N01KXKjZil/hBvs9cO76BTImAgYeGCiAf9IDqvhjggVgSpspCAx5I46Cw+xx5Kj7xY3P
 x9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478520; x=1783083320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QsVffdBc7bPXV4cXmRez2xscdfa7HYA+uxVYDAWdk7Q=;
 b=NlCOQB1AVy9BTAfqIMSjuYwTWgQXLWjetaydSCXjCYMdhuUFr1seiEgJBdAHHk5YvJ
 E59mfqBo1e/WqVo/4wAfp9C1f+kaTOZ2dnHOBBd7jKUW2ir0j6qmiScir0CVU7bFCXxm
 GtRSELx5b9ZE8BWGAQF49Rk0wCa8XXGWIaByYTbXsykwwNi/41WDjLZs4VdevQ3/Rhss
 WObaMZKihtepxN5VRTthxnIzVCDBNoPu+l7tL1qBbGZNNXrBGOATLK3RC/sY6znovFcH
 BbauhUdim1BQVcqX6HERmTakR9Qa4MBGG7jJYsIYJRdHONC4mRWrQ2vHdOdNAXmYZDJ5
 ogew==
X-Gm-Message-State: AOJu0YxuxXDXBqYP2k9S8V7E5L4atL9nKY7kAyPV3UHCn2xcVv7oMbNd
 LeC7q/FcDYlNfNPOCjF5CCZGKOaxmUgx7nWsXiroVysLQ47hX/GSOilYZEaOrSyu
X-Gm-Gg: AfdE7cm/uIzulkqvLSfxUh3d+L2EurWXDxrZH5Q9N3dSgRYJqFp5t1dNFDHOChUxZ7T
 j0exF2yrN3NvER14nw29HAnIr4exGBZckl6tKE2xWAUiz9zemr/Z0dhWYEv0rOhlzWeGvEW7OLL
 hW+R9vg991+Wb2JaM8QOEkAgvwVP29uFlQABLJjEr78MF/u5QSZQxKQvCG/Xs15DeMZHCVBMHMo
 IoAr7JNPDixJ2MjdDa7q2V8WxD5zVGf9QRAVF7zWfV9DMTot3yphDMX46aHsApUyojU0IFegW+v
 Cq3TX+2LvEOugP3DZ5KN/jse4AKCXhBqJ98oZs9GRoqwHPVyAy/NHVwCocxnxVDqgUQEOCXHCjq
 kUQ+Hg5u66clAqY/wuLaM9Bl2j4sbl75VGRkOo3wOrLmA7v0K4uB7o+KUqkCFoqwCw4jjL2KsWl
 c4EiZgr7z9nzeQuLJM2jwilrf7kVL3zMJKZUfBrxGMZc/cRr8CKSUR4k/MEG/n9YOfR/BLe3OSF
 ioVefqws4Ihh4HjKa+RR93XFWQqsT7NrQ==
X-Received: by 2002:a05:6402:3585:b0:697:f686:80c7 with SMTP id
 4fb4d7f45d1cf-69810b1d4fdmr1909867a12.26.1782478519921; 
 Fri, 26 Jun 2026 05:55:19 -0700 (PDT)
Received: from fedora ([154.66.167.183]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-697f46e15besm2750532a12.15.2026.06.26.05.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:55:19 -0700 (PDT)
From: aquiles <achillezongo07@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aquiles <achillezongo07@gmail.com>
Subject: Re: [PATCH 1/2] drm/xe: count UMA shrinkable BOs as reclaimable
 without swap
Date: Fri, 26 Jun 2026 12:54:43 +0000
Message-ID: <20260626125443.2114770-1-achillezongo07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626112638.2042298-1-achillezongo07@gmail.com>
References: <20260626112638.2042298-1-achillezongo07@gmail.com>
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

Withdrawing this patch, the approach is wrong.

Signed-off-by: aquiles <achillezongo07@gmail.com>
