Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7B5CD98C5
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293510E6E6;
	Wed, 10 Jun 2026 21:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K7ZqVJ+q";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1AA10E6E6
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781125828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zn+metQNd/XG/ZUgXyMP5j+F+hyFwWJJHw2ChAA//AA=;
 b=K7ZqVJ+qE7yKELZBT3yT7zFdj7n7FoOOoNDJPuYPRFEbnxknqg4PLUI9U8J8bpwnakEgoc
 sLXJrbBs/ruTnq8OVrynTsaeGDax7jjJ7rxo8iVOLr28vMrynDDcDPutRweIJAP7C2qz80
 /kDSXf9RwIxmGOizdUyxnHsG1PnVoJk=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-YF1_P-NGN1Osci8sfjh5pw-1; Wed, 10 Jun 2026 17:10:27 -0400
X-MC-Unique: YF1_P-NGN1Osci8sfjh5pw-1
X-Mimecast-MFC-AGG-ID: YF1_P-NGN1Osci8sfjh5pw_1781125826
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304df51ff3eso7968026eec.0
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 14:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781125826; x=1781730626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zn+metQNd/XG/ZUgXyMP5j+F+hyFwWJJHw2ChAA//AA=;
 b=q290BHIZz1U3up5kYai8TOxoh/rqO3sT23UkEi159yayQKzL2qHFYQoAFrwrtVU/5g
 hECKreoNESOn+lomOacq/6BKH7f9AG+JiVG0uhYigDhKpfFlvNvcjxQNy874nMhr6Gxi
 +4X11cc4d7/0FEp5phxWPlncOBWNokdpNwbC/06EHDQ9hLQGrXwfaclWI007yLGTvan4
 dckMAOFcP5G+oPj5+c7vz6jTkHy4vJ3pBvmOJRvtDobVqMf8hSqypiey8rU09z9wW2lC
 ijMqe3sX5CkBmdzLVA+Dv6imwrQAoHqLIDRhXmwUyhkp8Y48VFAfQAoHymnzwP8SFbCG
 WBkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+3blyiBub/CARGT9y36JN/pM+8fY+9hqVgLLR+dlkoHpaFibTWO8Sjh9rJxwZsCpVPHI8BfbWVew==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWMx+I58E+U49Ot9I4jHnCKTfBRl0LREGzhTap1GVw3kTIy1uR
 D33VB6bv5OHrDMfHaTND5YWYhyWbQ865tPOS5tj6/Qnba4d6qSYWk7bwQyvtCfa/x7hLX9GAf5D
 /3SftCPft4nnWEprFBprwldN7IaH/YvHbZT4rvt3BC3TlGhF5il6znNJlJlrqyinuYv1Nyo1qtQ
 zygcoyukXarLEixwnP/a1mllxMIiu+8xI6sV6PKGHemqo=
X-Gm-Gg: Acq92OEB3JEBEfgHEFLH49uACZMh5TqLTirx+aGLpZlhm6FjrF14is6s5UTUgT6BUJB
 Cb1Uq/nIAgGmvPdT8L5BrGIjKOItYfssKzk1jgeirwDRzCBFRnnKlWp4PVErTTwntuLYivmLT+A
 v8Lp6fmiXvImi8h+dKqaKiZ4aB71o+BGElaTZXwbspzDK56O/3Pqdq0Bvd8EbjSrfbjSRPWnQ0a
 9j7QsCobe8YRb4WjtmWX6L+DAVzrD0qcfRMFoghy2vA+P09
X-Received: by 2002:a05:7300:8ca0:b0:2ed:e12:376d with SMTP id
 5a478bee46e88-307ff820bdbmr662235eec.35.1781125825957; 
 Wed, 10 Jun 2026 14:10:25 -0700 (PDT)
X-Received: by 2002:a05:7300:8ca0:b0:2ed:e12:376d with SMTP id
 5a478bee46e88-307ff820bdbmr662199eec.35.1781125825460; Wed, 10 Jun 2026
 14:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260610141549.555605-1-jani.nikula@intel.com>
In-Reply-To: <20260610141549.555605-1-jani.nikula@intel.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 11 Jun 2026 07:10:13 +1000
X-Gm-Features: AVVi8Ce5IWVyE8AXhZUnTXwJ31lTOn-qBi0p3ZXgtCPUjD5gRdicD1lr4IH92yI
Message-ID: <CAMwc25ow-MehYN8u0EFkEW-JB2CYL+od9xja0WBK0-msWMHOww@mail.gmail.com>
Subject: Re: [PATCH] drm/displayid: fix Tiled Display Topology ID size
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2KOnT3x3EhwfB8vXPjaIYdnCH8Ca6rloyrnB4kT7yaI_1781125826
X-Mimecast-Originator: redhat.com
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

On Thu, Jun 11, 2026 at 12:16=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> The Tiled Display Topology ID of a DisplayID Tiled Display Topology Data
> Block consists of three fields:
>
> - Tiled Display Manufacturer/Vendor ID Field (3 bytes)
> - Tiled Display Product ID Code Field (2 bytes)
> - Tiled Display Serial Number Field (4 bytes)
>
> i.e. a total of 9 bytes, not 8.
>
> The DisplayID Tiled Display Topology ID is used as the tile group
> identifier.
>
> Update both struct displayid_tiled_block topology_id member and struct
> drm_tile_group group_data member to full 9 bytes.
>
> The group data was missing the last byte of the serial number. I don't
> know whether there are known bug reports that might be linked to this,
> but it's plausible the last byte could be the differentiating part for
> the tile groups, and fewer tile groups might have been created than
> intended.

I pulled out my spec, and indeed I can confirm this is the correct reading!

Reviewed-by: Dave Airlie <airlied@redhat.com>

