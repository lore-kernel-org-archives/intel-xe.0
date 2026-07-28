Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC65C55173
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 22:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DAF10F0C8;
	Thu, 30 Jul 2026 22:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Yb8QQHZ+";
	dkim-atps=neutral
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jul 2026 12:20:47 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22D610E450;
 Tue, 28 Jul 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1785241246; x=1785846046; i=markus.elfring@web.de;
 bh=Qhwh8pFsGLuqpZfSM4dAu0UCLRZAEUW3H/Ogkx+1KL4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Yb8QQHZ+dIKXNg/wqQSUO7JFvPHJJYL8b/8rFsyDHH+6j169JXkiRPHEbsjb2G+3
 Pg524VA7YMKo2wOiUG24mFYzYi7Rov6xp3qi2Hs0qhgxBFxLcwgC52lmXy7I3rPia
 hLSEOLPMyhG1PCM2pBSJRZgh7wBYfpB3i9v3KAfkEahsNfKgBfHEETapE2JF0SV4c
 KEUmKhJt1u7pwkl+u6UKX7b1g8t9/1ZZnG3teKurtB1+Spt+K+7ej9VHyVM/RHQ84
 HFmSaxNmz3TWxM8zZhHadsDrfSvKHznDQSowQ+LGHuVCkk9GtbMqTXzzaQkkwwVml
 Q+agMO8leqWdQ8cFPw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqZMK-1xJMlo1Clc-00iU8L; Tue, 28
 Jul 2026 14:15:16 +0200
Message-ID: <4fad393f-ab3f-4f29-b0a3-8ef440b0e82e@web.de>
Date: Tue, 28 Jul 2026 14:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/bios: Move a variable assignment behind a null
 pointer check in intel_bios_encoder_supports_dp_dual_mode()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <e81277a0-93f8-45e9-9fa4-7c2c2df9c311@web.de>
 <alZVl0o7uBoncUos@intel.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <alZVl0o7uBoncUos@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZI0JXO1j1sBBqysCYGJomPon/Mmco38eWvA7iHsLWvWptUQ7QH6
 Wvo8UgOOjVUtCCqAQzst/8R56iCxjIaHO+bkKG+52904f3kTiyN6J6Qy4H5n1bsJ2xxSSZQ
 yWpY/Gj46M4mo3jtctmQ4nsGYAg+sGR2W+NupMIYGipshFsi8Nj8Ul+YJMKtaz+JWNxduo6
 ZsNOThSujXI7V5s6mkDmw==
UI-OutboundReport: notjunk:1;M01:P0:q95hRdoUD0c=;XNWim0JlhYxg9PWLqci/rzvU6dG
 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
 3EN4mtno3ArCydXob1f3D1Aoa/6SHlWlUg==
X-Mailman-Approved-At: Thu, 30 Jul 2026 22:07:25 +0000
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

>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function =E2=80=9Cintel_bios_encoder_supports_dp_dual_mode=E2=80=9D=
.
>>
>> Thus avoid the risk for undefined behaviour by reducing the scope for
>> the variable =E2=80=9Cchild=E2=80=9D behind condition checks.
=E2=80=A6
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -3514,8 +3514,6 @@ bool intel_bios_is_port_present(struct intel_disp=
lay *display, enum port port)
>> =20
>>  bool intel_bios_encoder_supports_dp_dual_mode(const struct intel_bios_=
encoder_data *devdata)
>>  {
>> -	const struct child_device_config *child =3D &devdata->child;
>> -
>>  	if (!devdata)
>>  		return false;
>> =20
>> @@ -3523,6 +3521,8 @@ bool intel_bios_encoder_supports_dp_dual_mode(con=
st struct intel_bios_encoder_da
>>  	    !intel_bios_encoder_supports_hdmi(devdata))
>>  		return false;
>> =20
>> +	const struct child_device_config *child =3D &devdata->child;
>> +
>=20
> does it compile?
>=20
> please keep the variable definition where it is and move only its
> assignment after the null check.
Would you find the proposed adjustment more acceptable if a bit of source =
code
would be moved into another function?
https://refactoring.com/catalog/extractFunction.html

Regards,
Markus
