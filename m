Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8332606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FqkBY7NN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A913510E75A;
	Mon, 23 Nov 2026 08:48:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B08510E758
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 08:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795423697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pUnM1GAlqWckiyCNJNe7ZYUuta6sBgcZx+7TRlqcMxw=;
 b=FqkBY7NN7ZjySTCtiSIyyDFe9w8tBhlo2jbEW7Ldop4To78wcY6uCycYckbYO/dbe2mH4Y
 nyxlQbmwIEPJTe3HA/GxlfdLQjmMJeJHmGe3GBOLslnVC03XuDDCSDvRpk3lV4iFbaWipK
 bFs203uAxUnide5Y4hQY9SsLmtww9Go=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-2tRKzPncONyRA5aVyK7ugQ-1; Mon, 23 Nov 2026 08:48:15 +0000
X-MC-Unique: 2tRKzPncONyRA5aVyK7ugQ-1
X-Mimecast-MFC-AGG-ID: 2tRKzPncONyRA5aVyK7ugQ_1795423694
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4923b9fdd43so1926919f8f.3
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 00:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795423694; x=1796028494;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZIoXELwpYh1o5DnGcjLjeH54OjVLR8OUMZ7+fanJt4Q=;
 b=QCc+/Q9rqqmn6CC4v1iZM54A/PDtYGV7MWVwkHTu3x9uq9vZsCUjCDcj7LbQQVE0/g
 LDLHHPM4umxN4Uu4Aw9otLFhywgQpbV/SgkkGyJ86IAOm2CRs5dDAKN3DNCTSpEyeGKW
 d+PnCn2/4nkflOAfzs4Ijzu8lvil/9YHiOryhtCbxmaTy2ekKQAaofOOcUUfqYiUPGfi
 sPzAxCyMYRBkYYgi1Klo3T6AikVcZCdYGUuA4Wv9ut4EFjoApnUUxzUlTjGQJZAtlGa3
 kmstMeklnaSuVJdUDV3pMb8rNbfg5BvW55pXP86JXznBsePvysx7IFqXpJ+a4d0mGQxc
 QB2g==
X-Forwarded-Encrypted: i=1;
 AL+hErHKhrMBeoZv0cfJHzE4bHrsuN0mDz7ADIaLpmo9bnfRfDKSGwEJTYTMWBm77UgsBdoFWUTwSMNalA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/H2X/76y63qZMOCjQw4lulyQi4wEZZA1Z8InPjBrmUmztscmT/
 S7gdqzYs8vMOZ/M8GUAe9SwM4ppUXae26gHxcG3NHDsbI2PcdRgK/vya/B5JZUlOQPFw0OlzQTH
 XHSbqqT1J+a0oVPh11D7IDrITxaDh8g3Pwr7Ic3kvte4JP2r9JgcD9F22mV0Gc1Te99Pw
X-Gm-Gg: AZFdTZeE0GF5zhGAHB05GHJ7Cng+rO0IVkGLHForW9de5Jha2wZRvfJS2bjKvqzImwX
 ShCAPZkJXPPt3fI2q59ZNnXXl4C2IHZdWPdrdJ6PKJ5XoFMhxqh0jbVSZyCqd43TVGtKRr5gd47
 yS56jmCpm57Tt0TzmTcJJD15vO1bleRTa9H5AmfL/snKHwMEIrhrbjoKEX5SJQRGwYIW3K9K6qm
 yiO2/S/VLG9bVvfIg8V7DtBH1k7gywyHjel+Dqjw9ghNvwl+UUGruKbt3AeFH+GqFZdxseOKpqd
 5+RS9mnBnW2nZxUTFJvREqcwotKkGhp179jUrSST/Uk0mzF1ak+nKR43LCeUWIz0gc6sZx3cK3F
 WXhyV9g2Ica6u7p5ng8mMiHaYqV8HkVyuqd5D5e7StRP1QvVS9KLZFrzSlvaC2oeLvQ9KvAhIb6
 BGscFqudpq7pe1wW6Elw8F/GJm0beq6y3SGRGBxiI=
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4bb887c2c98mr206908795e9.4.1795423693814; 
 Mon, 23 Nov 2026 00:48:13 -0800 (PST)
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4bb887c2c98mr206908455e9.4.1795423693410; 
 Mon, 23 Nov 2026 00:48:13 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906d6a13sm155883195e9.3.2026.11.23.00.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 00:48:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Mario
 Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 01/12] drm: add connector LUMINANCE property
In-Reply-To: <awP0nasqAc4pAeMR@houat>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com> <awPvoLCDeq1YFLE_@houat>
 <awPzsMWZ7e0i6i54@intel.com> <awP0nasqAc4pAeMR@houat>
Date: Mon, 23 Nov 2026 09:48:11 +0100
Message-ID: <xlv14id8rl10.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -MwgE1yt5_r0eBHYIc4ld24okQ9QQAWO_dlX4knbxpE_1795423694
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Nov 23, 2026 at 10:05:04AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Mon, Nov 23, 2026 at 08:50:29AM +0100, Maxime Ripard wrote:
>> > On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
>> > >=20
>> > >=20
>> > > On 11/20/26 10:41, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:

[...]

>> > > > > +config DRM_LUMINANCE
>> > > > > +=09bool "DRM connector luminance support"
>> > > > > +=09help
>> > > > > +=09  Expose relative luminance as an atomic DRM connector prope=
rty. Values
>> > > > > +=09  are driver-defined levels rather than absolute luminance i=
n cd/m^2.
>> > > > > +=09  Drivers provide connector helper callbacks to program thei=
r hardware;
>> > > > > +=09  the DRM core does not depend on a particular backend.
>> > > > > +
>> > > > > +=09  Drivers migrated to this interface will use it instead of =
registering
>> > > > > +=09  a legacy backlight class device. Leave this disabled to pr=
eserve the
>> > > > > +=09  de-facto userspace ABI in /sys/class/backlight.
>> > > >=20
>> > > > I don't think this will fly if it breaks the backlight class inter=
face.
>> > > > No one can actually enable this outside of some niche embedded use
>> > > > cases where backwards compatibility is not an issue. I think what
>> > > > you need is a generic backlight class implementation on top of thi=
s.
>> > > >=20
>> > >=20
>> > > The idea with this was:
>> > > 1) to get the series landed
>> > > 2) let compositors merge solutions around it.
>> > > 3) Then add backwards compatibility to kernel so we can flip the Kco=
nfig
>> > > default.
>> >=20
>> > I said this a few times already, but we keep having those discussions
>> > while the backlight sysfs handling is far from being the main point. Y=
ou
>> > should *really* consider adding support for the luminance property for
>> > something that isn't tied to that interface (like DDC/CI for HDMI), an=
d
>> > treat the sysfs API as a sysfs series.
>> >=20
>> > It looks like people just have conflicting opinions on this particular
>> > part that isn't going to solve itself easily. You should not treat thi=
s
>> > sysfs discussion as a blocker for the infrastructure work.
>>=20
>> You want to be sure backwards compatibility with the backlight
>> class is a solvable problem before you land *anything*. Otherwise
>> you might just paint yourself into a corner with no way out.
>
> I disagree. The luminance property is more useful than *just* for
> backlights but is also useful for HDMI, DP, and MIPI-DSI that would all
> use it.
>
> If that's the corner we paint ourselves into, it's still a pretty nice
> corner.
>

I agree with Maxime. Drivers can choose to not expose the luminance propert=
y
until the sysfs backward compatiblity is sorted. But this shouldn't block t=
he
core infrastructure to land, given that's useful for other drivers/use case=
s.

> Maxime

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

