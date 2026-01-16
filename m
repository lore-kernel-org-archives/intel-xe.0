Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C91D4A5F9
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 04:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C8210E0CE;
	Fri, 16 Jan 2026 04:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Tu+QOfmv";
	dkim-atps=neutral
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com
 [209.85.214.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351FD10E0CE
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 04:00:14 +0000 (UTC)
Received: by mail-pl1-f228.google.com with SMTP id
 d9443c01a7336-2a09a3bd9c5so11538945ad.3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 20:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768536013; x=1769140813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMoe/pavNzqozUJxPNEccORtLX8eIOYK+YOGgBjskj4=;
 b=Yw0wOYpsOYbtnbh6Zs6rGzUwqwQBhYnMVwNcwUC2/cxik5GbaK+ICIFWpNeOTm8vHG
 DMZywvgeQaja0I6D6f/YkKpvZvl5adHKbyAvhiKTZag4ygsrQ4tfRxMTeIlZZ53SIeUv
 nxuawhjWvHZXIMjjZucs0/k8Edi3UCjwDBBA8AHxG22SHH2DoK8W+w6HaEgaIZ8NdYcz
 N2otw56GdLQIpVqxUEagh9QDmHXDpBOiGA9juZ/m2JvMZStxPriTt1EBYg5pjZZ3nWI6
 D4JHf3EfWI2meriYHW3vvDaFokWrtMtmQBhJcIeKdqKuDa7m9DfKYF/BwaDibKTwRG/Q
 v/8Q==
X-Forwarded-Encrypted: i=2;
 AJvYcCVbIW/ANbj0P0pBKjgHSaRNkngINp5aE/+Vwneynaxq5iQ9bIk60Y7C7iXAQFBIhN0kbaw5FyoBSA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4LohVx9ngR4OxMxPyqcr6YKcvkn82IdXYeL16f8kVQcZHLfJf
 ZZLWB1zdG858OMKjOdJzhpjpi8nGCORPA5mF8u9arHhJkHHLNdqII+Ov4VxIiXPJ4MAMkOLmMcf
 tugQJO1lQdcLEHP7dBLXOrMQE7B9jpyLQRQd+nH3ANyt9ZmghDn9bcYVRdnidFdNq97Pm2cQF6I
 lqXfsGy1rxiyD08WFoMun2lqsKPdJQeUECNcSQ6KJfTvkd8TWcvrYbwMRSkXMYD1fVf3wxa08Jv
 P/l+9S1qbV5QZIV3gU=
X-Gm-Gg: AY/fxX6iODjflAlqKQdFQ00yxG9TJaXQ3UEe5VKl10/AdiCD+DpD4FCVRCBbBWvSNMI
 6UXg4Qv8Me2ObZldkuC8joqtuAsmMjcZ8sKVPbEMQWcIa49x7HgOgBm7ukn18sA4gseik38iAN0
 K9O/tmGIwsEWMnPJ5EiThxGjCYVww37LtDxdJOYO5GYIkkU3sGFH2qeN0JvpbwHP2qjb7dA5W8B
 NNbcuE6UMH2Rrm8HCHEpqS+5XrYVSQ3TBdLzfkQ6B1olCjrlJgoZ4EiF7kDuUrXXGqMUwiKmhmM
 uuVMSsvdcBHuR7JZnZffxfw3pp+OmfAldItb3AgHyT3l1PwM28QNEdxlt2hTbsbSnlPvlf94AtX
 tF3YA9/w1uq3QHBDhwRvBijWgqyCS9/T2cDw8mSOsgv3si6b0FTfME9XBfLcxl+/o7VX8Uxxvum
 ca7PMdihsmHSwtO5qMbWyTtAweXcCha3YxpGcyJr/rjQ==
X-Received: by 2002:a17:902:e549:b0:2a3:1b33:ae11 with SMTP id
 d9443c01a7336-2a71893d091mr14338215ad.53.1768536013469; 
 Thu, 15 Jan 2026 20:00:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2a719191457sm1629855ad.38.2026.01.15.20.00.12
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jan 2026 20:00:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-59b6849824dso1305161e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 20:00:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768536011; cv=none;
 d=google.com; s=arc-20240605;
 b=ZxXfDs57DVE06yLOyRWx+FlaCyvMVrkfT4E5PdCG0izIZRLk3xn1h+nnaGZ0rgt+gT
 UzqOwL5TZUGFt0rgc0dMo05lcpxz6e7/pJS1JOo4fLHlXBjBdOFpDamuyxUzBNAN7p/p
 8Mlrs/HNzX3DQhSANbmyS3iHG+h0cy9npJxZvBIJ4yjYyW73IZoihCTPHvXgpOc5EG9q
 SnpXo1Cmqp5zKBU9U3Z3/jNeBLtZL72/aHmAQXcvYT15KdsCmD8EGqHphMfO06ryWCA9
 Ylsdy/xdeSLKAlyJ1Lgvy58pJAXL7x0IwI4wqHEkYp/Qka7jVETgFvdoURi7PbExw5+n
 61cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UMoe/pavNzqozUJxPNEccORtLX8eIOYK+YOGgBjskj4=;
 fh=TKRTO7bHTw63puJCzX3eWEYswA8LrtycGENwCs1iBvs=;
 b=VB1MfoEkWJi58nZhbFUbZ6yyooJlkmyG6q3NCARwf+Oh1hEoLejuYdmk2Z0FIu3eVk
 oxIiApSBMvGs0SwRKL+0s61ifReRDMjDPO811KOFgU5Za6s2pKiixcoHguj2hqGtO2w8
 QuRMorOytQdZ2NWctD0XK+4MKoGuMCVsX9V9VDuhBLdSXZPnJaVECTY/bobsOnuQ4xT9
 9WTXDRajqROPx6h+fnJ8+jmLiwOYbosx1nFRKk5aTcPvs734D/+o7jensYvwasxrgsym
 9P1qdT1oTW/0pO66CxoTw/jr60e/ftZopyLh0zDP8s0OCeNK7QD5tcQkn6RP8bllxMJ5
 Utpg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1768536011; x=1769140811;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UMoe/pavNzqozUJxPNEccORtLX8eIOYK+YOGgBjskj4=;
 b=Tu+QOfmvWIz1o0pOVFzA8eD6N3oYEVZ5U4R+yzbLCUDMSuw14W0XcrbJzL/b5HZUqf
 UX726pR+pe+0cseBD2rnCShvwal4IGc0EbSZPkHfmnN3YRVUEcADIz2MTFb9ajrvhdv/
 jVg8lpKikU3AdGjEJk91JHE1Iq2TwqIQYX4Xc=
X-Forwarded-Encrypted: i=1;
 AJvYcCVslZP8h6pO+rMtd1D483kvnMy+3UHRdI1cdgoTNSA0YF7YuSDItuIzWKPXXz6ofqC3sTD3x8gr3A==@lists.freedesktop.org
X-Received: by 2002:a05:6512:110f:b0:59b:7c23:c637 with SMTP id
 2adb3069b0e04-59baeedb316mr473025e87.22.1768536010938; 
 Thu, 15 Jan 2026 20:00:10 -0800 (PST)
X-Received: by 2002:a05:6512:110f:b0:59b:7c23:c637 with SMTP id
 2adb3069b0e04-59baeedb316mr473003e87.22.1768536010460; Thu, 15 Jan 2026
 20:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <c816f7ed-66e0-4773-b3d1-4769234bd30b@suse.de>
 <CABQX2QNQU4XZ1rJFqnJeMkz8WP=t9atj0BqXHbDQab7ZnAyJxg@mail.gmail.com>
 <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
In-Reply-To: <97993761-5884-4ada-b345-9fb64819e02a@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 15 Jan 2026 22:59:58 -0500
X-Gm-Features: AZwV_Qi80DLh5-dVzEeXXXwxSJzK4tEf9_V9qKxKCqReQ_R-wGE0BF4WXFFKv3w
Message-ID: <CABQX2QMn_dTh2h44LRwB7+RxGqK3Jn+QCx38xWrzpNJG5SZ9-Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] Recover sysfb after DRM probe failure
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 amd-gfx@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
 Ce Sun <cesun102@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Helge Deller <deller@gmx.de>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 spice-devel@lists.freedesktop.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000bcf4fa064879602c"
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

--000000000000bcf4fa064879602c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 6:02=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> That's really not going to work. For example, in the current series, you
> invoke devm_aperture_remove_conflicting_pci_devices_done() after
> drm_mode_reset(), drm_dev_register() and drm_client_setup().

That's perfectly fine,
devm_aperture_remove_conflicting_pci_devices_done is removing the
reload behavior not doing anything.

This series, essentially, just adds a "defer" statement to
aperture_remove_conflicting_pci_devices that says

"reload sysfb if this driver unloads".

devm_aperture_remove_conflicting_pci_devices_done just cancels that defer.

You could ask why have
devm_aperture_remove_conflicting_pci_devices_done at all then and it's
because I didn't want to change the default behavior of anything.

There are three cases:
1) Driver fails to load before
aperture_remove_conflicting_pci_devices, in which case sysfb is still
active and there's no problem,
2) Driver fails to load after aperture_remove_conflicting_pci_devices,
in which case sysfb is gone and the screen is blank
3) Driver is unloaded after the probe succeeded. igt tests this too.

Without devm_aperture_remove_conflicting_pci_devices_done we'd try to
reload sysfb in #3, which, in general makes sense to me and I'd
probably remove it in my drivers, but there might be people or tests
(again, igt does it and we don't need to flip-flop between sysfb and
the driver there) that depend on specifically that behavior of not
having anything driving fb so I didn't want to change it.

So with this series the worst case scenario is that the driver that
failed after aperture_remove_conflicting_pci_devices changed the
hardware state so much that sysfb can't recover and the fb is blank.
So it was blank before and this series can't fix it because the driver
in its cleanup routine will need to do more unwinding for sysfb to
reload (i.e. we'd need an extra patch to unwind the driver state).
There also might be the case of some crazy behavior, e.g. pci bar
resize in the driver makes the vga hardware crash or something, in
which case, yea, we should definitely skip this patch, at least until
those drivers properly cleanup on exit.

z

--000000000000bcf4fa064879602c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVIgYJKoZIhvcNAQcCoIIVEzCCFQ8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghKPMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGWDCCBECg
AwIBAgIMYT8cPnonh1geNIT5MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NTUwOVoXDTI2MTEyOTA2NTUwOVowgaUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjETMBEGA1UEAxMKWmFjayBSdXNpbjEmMCQGCSqG
SIb3DQEJARYXemFjay5ydXNpbkBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQCwQ8KpnuEwUOX0rOrLRj3vS0VImknKwshcmcfA9VtdEQhJHGDQoNjaBEFQHqLqn4Lf
hqEGUo+nKhz2uqGl2MtQFb8oG+yJPCFPgeSvbiRxmeOwSP0jrNADVKpYpy4UApPqS+UfVQXKbwbM
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIPhs
Q+k2q3KtslWtYwB+RUVZOSs9Q+p5fc1jjMFKwfpoMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDExNjA0MDAxMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIzDYYUyCyT9dVC6l4aOs54ywGPVFxwPwFcTShF7
JVRsxKBn2MEcv5TlwbINsyXRmEsPTt4lA3puz+6l4a1rEoDbbUuwQcbhvu8dFfVY/LN8iufyONP1
U2l05F64PZdGNqeAuhIKGxEH42Hv84/C0LRnt/48nSVm28/wuxMzLJoZbSD0NVkRSIHmVSgUCta1
5EqWp67P8p7/I/tKzcVlLURhjjHDJrw5q09Po+eatyqoOqJURszYGB0syJeHpzTbpzzgRqV/3WPL
LY8PIbn2EBQxQrQs4V92L1oLMJJqSLTJBcKYlI6RZBf2BhEhsa1ackwRE7jBlDUgSXpWbRMaeuk=
--000000000000bcf4fa064879602c--
