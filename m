Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4993BD44148
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 12:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F09A10E27B;
	Tue, 19 Nov 2024 12:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="MLMLWlXD";
	dkim-atps=neutral
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0A210E2A9
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 12:39:33 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6d41dbf6cfbso17180686d6.3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 04:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1732019972; x=1732624772;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c7YJRy6S+CzjFVx9ocQATHGYD8RoJ7FS66+Yih1nH4Y=;
 b=MLMLWlXDjvDkfeFbu8fb/aixDZlxJdSu11/LfZOqkK/YyLEVcP+083tU/D80pffHLe
 ku/V5Dr9ch20I+pyY/06s5jDtjvOKW7a9Isgd6g8H8uaDAp+SfE7Ua7w8mp910niKovV
 7kecHY6HKUHu+dW2DVAem5GRrMAug1vltybmfjYDc3b8DOjKRofZX6PlmUTi2RlVWJ7A
 vJccp4b9wZw9COLN5v9VrK7pLzSsPnIG9rSS0uAdBzUcC5WCrIC/h+mrI65rogif8N/6
 JWtZvsnAAaMh9CbosF23Od6ulEqwHcSAJIMmZeCdzMxU9yjQBmHtaz/PzdQR56QPcaUE
 Jggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732019972; x=1732624772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7YJRy6S+CzjFVx9ocQATHGYD8RoJ7FS66+Yih1nH4Y=;
 b=KqRSgHP1qE6z1tCD1nTsLan45VbWa7T8HYiNf3DpSeB/t7z2SLIIoiGe+Px1a5BY1s
 T6mzgiz//Mlg2OAOHoBMUq//iCApT3tbyxEal0ocCFAwynvTILKbWoAbCc3dKhIYppXm
 P47JwdjF21VnPkmVGDGZydRk1SMsKp2O6EaCL2n4AV8eMkYgQn4aEaawmkhxxVtnmZl3
 9R9xdD1FT+ZNdW+qykhtgbAqRGkRrmRE7nLODhcKStjZLZRfQv52PxbyyXb/gGYXZrPg
 iv/0IabnpKML9TPrwNGOnswUuzKLYwB5Zhol1NOtaz8CT4/LDfJlOeUXQHh1S78V6CV0
 gx4A==
X-Gm-Message-State: AOJu0YwymLDWXjpDXWpyuCdvcGdmGnTCqbTvdvVKR8ruSmNWlgTW1SDG
 I4gARDePHPtPU+dOBXAbZ6JHPHw12tYGCyQ0J/JphB/e9XvIxyxPH2ZxKbYp1iELk0BZ1/gN887
 2+4qslMLbIQQveIDxv6j2aKHlIPNybIlucsMRaj+VhQfqq69f
X-Google-Smtp-Source: AGHT+IGEtYpIyae7ccJUF5Wq5keNlhdEKLUf+IieAL1BxbNm6KQF/DB1EqtxKvme3J7OUdNvAEIEh0qTSJ+cuaA1xoc=
X-Received: by 2002:a05:6214:acb:b0:6d4:29ae:fd3e with SMTP id
 6a1803df08f44-6d429aeff13mr51505626d6.29.1732019972672; Tue, 19 Nov 2024
 04:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 19 Nov 2024 12:39:21 +0000
Message-ID: <CAPj87rOO58Q1jBO3QdygzuSZpPeabNdBMeXXd7RhNWVOUFisTw@mail.gmail.com>
Subject: Re: [PATCHv5 0/8] Display Global Histogram
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Hi Arun,

On Tue, 19 Nov 2024 at 10:55, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> The corresponding mutter changes to enable/disable histogram, read the
> histogram data, communicate with the library and write the enhanced data
> back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873

The Mutter MR you linked does not actually write anything back to KMS.

Cheers,
Daniel
