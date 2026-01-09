Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE0D232F2
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 08:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B783110E81F;
	Fri,  9 Jan 2026 08:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="TdnNyIq5";
	dkim-atps=neutral
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D87710E81B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 08:40:28 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59b6cbd5495so3032291e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 09 Jan 2026 00:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767948026; x=1768552826; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgQguY/3yJH9vjqUKAYyFPM3gXFuXFaFqMIhKXi9SEE=;
 b=TdnNyIq5Y7N1gkVKB4vjolMlgMjXBz78jH+yXy8A7DK5KdjxdIdKhlRep7NFHvCPqy
 uRpAPKcQrZAay+2q3daZAvIBDqoZH4uLUoyGR+vgmay8kKklkVupF8Q4H4C4A6AMoEVY
 iKQ8XIWBK7p+uggYJS8Vng7jYkiJTe21rQusHcaM8jI9t7lip0gf7+76ET1/kyLwEVdL
 F+14Otp9F8XMXzWs82o22dEPKjNOgx3FZKpCzFOtXYAhP5MlX8r4wc0yLMfhfrE8QH/y
 AkMd0LjKI/TWbFXMUvnGlMpNrILaPHimKkqoqvF+q1tCWKrrRKngwmgeCKeB1tlThmzU
 56eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767948026; x=1768552826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qgQguY/3yJH9vjqUKAYyFPM3gXFuXFaFqMIhKXi9SEE=;
 b=bm50QgwoM6C5SSFjmv/8+azgvm3Ar1yoMJSrhn5vb1JFVsbDCUAlGXzvAnkB+GkpgM
 byv0y+0FLt2czbw3WeWGQRh+fxfIWF+jbj+sy+FFo8ZjWGDVQ9KJwcNTTrW1IzuJ7klE
 hBRwifhg5meREQ9r3v8T8utT6+GYXpI06uKLuM2encsPA/pSd+XX+h8FtT2wDa972vFS
 JiUHA/+aXqzP/44FXokuiU+YuiSr83Rn8HuAJ8j9RwglKhNOU96QTZCoC16+NsBfg4bC
 QCoecXAFlA86So7qQN1I157gHBnz5ZcQQWy/kKvXEjFTwaLOueEgj5KpkWCcOWcF6mi9
 H6Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzDsG+RD2WmnmQomVAqOYecFydCez7VkWCBnC1iKfxTje9WYH1UbXBALwNxHDWzkmWP1ERB/wYmQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9LotHq/csj3l41JJcIMuRr4hYzvEyz7VX2eoU4ecltLD5FWxC
 +fYim8WV+Dmn0WkoS61afeLIV8bSlK0RUIOzHYfeLUxeUphyWphgfAs1PhmMcZsmL+48r+NSeF9
 TLrFTY6EQiL6oSTrngBsZboufkR8Ht3VWTOOMbbb5hw==
X-Gm-Gg: AY/fxX4z4JyzluZeatOqEXiBiayrrzzIpCP3amn0nvPuni1w9q4b0YotrwdDMWcaKck
 FdGA48PoLLSA+yAzLmEQIy9NbKkJRfL2fs3Th2rD71HwTfYV692eVer/KTc1Cmo0mAHsiy8Erq7
 VpU+lSVvYSchSnpag2N2MwtmsKumvTGJzfNJdbPMToCDqbamVgfpCz63SsGqVnspDk20I76G48z
 cCQPaLVDLj7YLYRNlRvcEDTbEb1FyOgmEYNVnZtXqLIoGPudIB3x5AtFv+Ee9a16ykyxwdh2htd
 67ewlwM6gFF8R5TEzGMdfbf1YEHd
X-Google-Smtp-Source: AGHT+IFXtN+0YseD+T9APEL+SkiwbT/sxspD361H4WQpvC6fXEypZdSjIbUo+lRliv69WpOghJ3hZ0q6u2fo/hSlbqM=
X-Received: by 2002:a05:6512:b90:b0:594:768d:c3ef with SMTP id
 2adb3069b0e04-59b6f036b83mr3136147e87.30.1767948026027; Fri, 09 Jan 2026
 00:40:26 -0800 (PST)
MIME-Version: 1.0
References: <20260108180148.423062-1-marco.crivellari@suse.com>
 <aV/5KRqR6zma/ZnR@lstrano-desk.jf.intel.com>
In-Reply-To: <aV/5KRqR6zma/ZnR@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 9 Jan 2026 09:40:15 +0100
X-Gm-Features: AQt7F2q0EjRPIBo-O6epKd7ztDdCOc6wx1_RFqjOb_frYVIgnRnJP8VDXYpdajg
Message-ID: <CAAofZF4F9ZvLMj-=ge2esbvpgoFyyzCdBc2E82inbXry8kKLrA@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: fix WQ_MEM_RECLAIM passed as max_active to
 alloc_workqueue()
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 stable@vger.kernel.org
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

On Thu, Jan 8, 2026 at 7:36=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om> wrote:
> [...]
> Yikes - thanks for the fix. Will apply our tree shortly.
>
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks Matthew! :-)

--=20

Marco Crivellari

L3 Support Engineer
