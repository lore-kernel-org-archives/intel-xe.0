Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B489BC98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2045810E42C;
	Tue, 22 Sep 2026 08:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fXluHjNR";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903DD10EBF3
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790067011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6yt8HPyksGEz/v/VIt69U9kjpWwNRnopqqhP0gILys=;
 b=fXluHjNRomIj1L+9GYrmIojPQ2/M0UIiyUgc5B4zEKVwgvAxhXRjlZqGfMUYfJMGtc8RsI
 wwJByFqA7yijX05mIB5f0PK4PtVgqb5G4pMxM8nIZujLm5pzaM5X/6yALt7wPzFLuP5Zys
 czuxPho052XBgTJUqqIO2sRm/F4CZ9c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-kFqmCu-_O_-gc4jrLe27dA-1; Tue, 22 Sep 2026 04:50:10 -0400
X-MC-Unique: kFqmCu-_O_-gc4jrLe27dA-1
X-Mimecast-MFC-AGG-ID: kFqmCu-_O_-gc4jrLe27dA_1790067009
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2dd188e16a2so43404045ad.2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 01:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790067009; x=1790671809;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E6yt8HPyksGEz/v/VIt69U9kjpWwNRnopqqhP0gILys=;
 b=uVVHotr5UwcPtfgkSacep1xwjzRLptDxCrrzohVviVpCB5TL/M+qa65IjL8FYU+EgC
 G4NFZ/8JTZCJiP4gCLHHTqiQITGELrR4+y6zFFZCBJ+jecCIJBZs0e2LfIYMZsTfI9se
 e5c/nel3XRBaDp40stYU4bRQTuQlBWciLUpwpx7hVWeShCdv8rfORFkFN6sAOSqTGZ7k
 o6aKfmEZT3+taykS/Bvy0G7TElDqUYTu1EjpWPj+IdlEAJ1dYYSuo82NqUSGSUaEg94W
 YUhAjgBZArbgG4Mfo1dvVRYdB/HdDS+s/XisyKPJP43tTjPWSlJ+fd+lVqP7KYbQ7IWQ
 rpBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDIghlVQfSoq8g4mzB3Gp5AHwzX3Ij0r8BIFM38Gm8L1TmfmU/kL9RP+iD4S02eOEDs2SOqrYDSQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mMuJge1YkBBDxoCUYS+R8t6Zpwl45kPbNsmYe6rYjpif/EG2Lw
 J+i1gTJLCV0MpCnu7jvRzwLa3sv6w1ptn3Qbv15AUNaMDNpukECYnW3Jr6gktNPwK6Om539By3R
 u7A5D9IeYOL29MPg08VVBKeAVDpZ2fDkuHRgTRi8520ActJhcP77itzRZ2086iPSE7nb3gEd0r3
 GuAKhPHdrlgQ0Lu0VsG4CkzLF91dkniaGPLwp8yzr0YIg=
X-Gm-Gg: AYBFou1/ewrKqsAX7jf5k5EXE9HdK89CwZcqEucrJBWqjiLymaoYMUZzoyaFBa0vHDY
 8hEsjbd9B0zTC4wYnPEvB7wHw/sTMoEQZ3QOfJC2/yXC24goR00jk/ygQE6gK0W+apx/52NfEnY
 zql1ajWekXzPE0tCCMV9xBDSLf+k28TdGYH6z4+B91ITSMumLryiUL5xyg
X-Received: by 2002:a17:902:d4d1:b0:2dd:3ddf:b876 with SMTP id
 d9443c01a7336-2df6087db56mr5516515ad.0.1790067009073; 
 Tue, 22 Sep 2026 01:50:09 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2dd:3ddf:b876 with SMTP id
 d9443c01a7336-2df6087db56mr5516135ad.0.1790067008659; Tue, 22 Sep 2026
 01:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <20260908044035.62093-3-mario.limonciello@amd.com>
 <0fb724cc-ac12-4502-b338-1c4f310f043a@suse.de>
In-Reply-To: <0fb724cc-ac12-4502-b338-1c4f310f043a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Tue, 22 Sep 2026 10:49:55 +0200
X-Gm-Features: AcwNN1WukuNNSk2ai1J1udE9KGrF1By_6QZnzs1WKDgfz3h81hw6hXJu7g_SbpQ
Message-ID: <CAFOAJEdFPrwHZV5y1E_u_Wd6oE_viPsPztxYW6PRZHJ-zdPFMQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] backlight: add kernel-internal backlight API
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, Simona Vetter <simona@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, 
 David Herrmann <dh.herrmann@gmail.com>,
 Marta Lofstedt <marta.lofstedt@intel.com>, 
 Mario Limonciello <superm1@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: boEPz3VjXBz4BAaq-Y8u55idns6jOUt9fC30q2_4BAA_1790067009
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

On Tue, Sep 22, 2026 at 10:24=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi Mario
>
> Am 08.09.26 um 06:40 schrieb Mario Limonciello:
> > So far backlights have only been controlled via sysfs. However, sysfs i=
s
> > not a proper user-space API for runtime modifications, and never was
> > intended to provide such. The DRM drivers are now prepared to provide
> > such a backlight link so user-space can control backlight via DRM
> > connector properties. This allows us to employ the same access-manageme=
nt
> > we use for mode-setting.
> >
> > This patch adds a few kernel-internal backlight helpers so we can modif=
y
> > backlights from within DRM, a brightness-changed notification, and a
> > per-device takeover count so that legacy sysfs writes can be inhibited
> > (-EBUSY) while a luminance-aware DRM client is in control.
> >
> > Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
> >

[...]

> > @@ -150,6 +153,13 @@ static ssize_t bl_power_store(struct device *dev, =
struct device_attribute *attr,
> >       struct backlight_device *bd =3D to_backlight_device(dev);
> >       unsigned long power, old_power;
> >
> > +     /* A luminance-aware DRM client has taken over this backlight; th=
e
> > +      * legacy sysfs interface is disabled until the last such client
> > +      * goes away.
> > +      */
> > +     if (atomic_read(&bd->drm_takeover) > 0)
> > +             return -EBUSY;
> > +
> >       rc =3D kstrtoul(buf, 0, &power);
> >       if (rc)
> >               return rc;
> > @@ -214,6 +224,13 @@ static ssize_t brightness_store(struct device *dev=
,
> >       struct backlight_device *bd =3D to_backlight_device(dev);
> >       unsigned long brightness;
> >
> > +     /* A luminance-aware DRM client has taken over this backlight; th=
e
> > +      * legacy sysfs interface is disabled until the last such client
> > +      * goes away.
> > +      */
> > +     if (atomic_read(&bd->drm_takeover) > 0)
> > +             return -EBUSY;
>
> Can you really do that?  AFAIU sysfs is now a de-facto uapi for backlight=
s.

And regardless if this can be done or not, I belive that would be
better if this is something that drivers decide to do and just return
-EBUSY from their struct backlight_ops..update_status.

Ideally the sysfs interface should continue to be work as Thomas said
and a write could trigger a mode set for example, but I don't know if
that is feasible to do due locking.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

