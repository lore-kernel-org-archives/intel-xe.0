Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EB6C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90E710EB11;
	Tue, 22 Sep 2026 08:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I8wqazkk";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCCF10EBE6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790065994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F96J7DJJAKJfcMZddwK3W30eQH37p3jCY4JYz68S9D4=;
 b=I8wqazkkDbLLDkLPdzMh5DzxHOm3rGyXH42DTR7u9Q3lIqFYdQMjs+FV4JGPgIe9eKkLdb
 icQXTumn7bjIqVL17B8HZYTq9kPGQPpIJhEPrLuRPnssAh6cH+OPdI/ykAXFEvgFcRzPdU
 QHj1JRK4qnHMHf+o+W4/Ez2pGHkHoq8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-i0UiiiuIMVO61qfXtJShvQ-1; Tue, 22 Sep 2026 04:33:13 -0400
X-MC-Unique: i0UiiiuIMVO61qfXtJShvQ-1
X-Mimecast-MFC-AGG-ID: i0UiiiuIMVO61qfXtJShvQ_1790065992
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc73ab90ae7so3360512a12.0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 01:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790065992; x=1790670792;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=F96J7DJJAKJfcMZddwK3W30eQH37p3jCY4JYz68S9D4=;
 b=D36fZLMrJlYt5mMLEVuhmp9y/qepCW3tb9m8nK3LyrTrKcZ7emNB/pA6P2y9JSUvNk
 AkSu8Y1cHL7GVUWEYZKRLGQmILSp1MPwvKcWI/Jl+70q4x+haDQXkZADiHntxkSS66d9
 TqZMv3OOianv5fQYsdCMU4Xlm1dW1PhiYF7oXQioXwgOPr9aeOHzzyOZ+/beIL++kDzD
 CcINNa0CIr8UUx41nQ8Y2JnNJa2EwTeXqD9YUIooUa+aFAVjnUh3NyiudmbOS/QwmfZa
 h1IWhruIOG4I1THoRnrR6TfVxMkBE2PUGPhmJm+ObdxZB59amp4gqbt1pQStWLTCeG0V
 2I8w==
X-Forwarded-Encrypted: i=1;
 AKwUvByHZAVi6NsYYOtMgR3+U3bUr4KOQ1YEBaZ+04t6OcbhvqGWWzxCKV5RELkNMmDLXVGRY4b71sf1xg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mSzMzuICUKVdvbN9amNTGaNtkrh2toDP24MntjErlMzP29bJz3
 U8b2fS144wUi/Tu44kMKYjRWn0v/al1Un9qXBHw/W2hc0KEGYRAkGMjhMHSiYc8yalg0hTWvQzJ
 zOyo1VkksDfIKQxfLF0+gQpsb7/KbSAXduAP67pXm28zt6kQoL0zlajk5FazxGHZ1A0nguxiPO0
 ZcsoVsVzwbTdqSFWSzC5z893fNXodZtUTxBvgibOusmmY=
X-Gm-Gg: AYBFou0bZeKVr9Eux261SWrSASdIr0eeDHvey/PKheUwO7Ig12Yav/P6QhE8AUXL8S7
 HX59A4I6OzXRuuiMTzMHxJNEhJeALXPbxn1+hu8nISw1m8FJpSYUMeAkttGm7eAs63/dz04gOxf
 aOlmTtgPc6blS/OYZcvGPkX9uoJT5+p12h13mpkWyRrtmv6Xt3pIRVgiuA
X-Received: by 2002:a05:6a21:3997:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3ddec64510dmr599381637.21.1790065992352; 
 Tue, 22 Sep 2026 01:33:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:3997:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3ddec64510dmr599341637.21.1790065991877; Tue, 22 Sep 2026
 01:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
In-Reply-To: <20260908044035.62093-1-mario.limonciello@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Tue, 22 Sep 2026 10:33:00 +0200
X-Gm-Features: AcwNN1VtA49KGh0oWUGKjHEN55TPH-cQU1mit2FWLOruyptSR0tnv5cErAS2kZM
Message-ID: <CAFOAJEfgXY7cfLvizuxbS75CJd7mF5tewxp+PH=EhTtpy+aZXg@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Add support for a DRM backlight capability
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, harry.wentland@amd.com, 
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nJzOVG6hS0UeMJoJc08r1keB9l-nw97vA6-OIpBM23E_1790065992
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

Hello Mario,

On Tue, Sep 8, 2026 at 6:41=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> At Display Next Hackfest 2026 we reviewed progress moving brightness
> control into the DRM connector properties.
>
> There is a range LUMINANCE property that will default to 0->0.
> Once a driver attaches a backlight it will be updated to 1->max.
> If the panel supports the minimum backlight turning off the display
> the range can later be updated to 0->max instead of 1->max.
>
> The legacy sysfs interface is synchronized with the DRM connector.
> When a compositor using this feature is loaded, sysfs writes are disabled
> to prevent legacy tools from going out of sync with the compositor.
>

I don't think I agree with the direction of this series. The main
issue for me is that if the sysfs interface is disabled, then I don't
understand the value of doing all the hops between the DRM and
backlight subsystems...

IMO when a driver sets the DRIVER_CONNECTOR_LUMINANCE feature and the
client advertise the DRM_CLIENT_CAP_LUMINANCE capability, then the DRM
driver should be in full control of the brightness control and not go
through the backlight subsystem at all.

It would be better if the hardware specific logic to do the brightness
control is factored out and used by both the struct
backlight_ops.update_status and the atomic modesetting state check /
commit.

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

