Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702A4E6F093
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 14:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0153510E181;
	Tue, 23 Dec 2025 14:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=realtek.com header.i=@realtek.com header.b="eEa16hv7";
	dkim-atps=neutral
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Tue, 23 Dec 2025 07:54:43 UTC
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFC510E0C9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 07:54:42 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BN7lvLN3961266,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
 t=1766476077; bh=xByRV1TY48tGSFoUCJDAh3e/CdOl93sKfyavZMY91wE=;
 h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:MIME-Version;
 b=eEa16hv7w4iMTsKRtL7NU1oC6rbtm5oOdjGouu1OSaqP+8ibwoSjgcMNHv9b3uY4e
 bAfS2IgU/18Tqu/HlqeZVcuazzMZunsv4lnCK1OSPTr4VxnL+/7jZX1iMlq+sgycEI
 1IIHu94PjxGKUEOtgyG/w+ettjldltb25u7ZpRIaF0M+NeUPddSq03ANQ+tyUXIlJD
 UB6ZCuQYbIzJdocgZT2R6whoaA1VuMaLwYMgOoJkeR4HwDUJG7JXPmXdHKM/z2IDfc
 JRE7ul6rrvEl9yN1TShpiFCtjkueqM9QUE/0kaEb1JNIoS/zkccxSnZVvdehrBlqKu
 cJolkAqQKcH/Q==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
 by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BN7lvLN3961266
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Dec 2025 15:47:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 23 Dec 2025 15:47:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 23 Dec 2025 15:47:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Tue, 23 Dec 2025 15:47:57 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Chris Russomanno <russomch@aol.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>
Subject: RE: [BUG] Intel B580 (e20b) HDMI Flicker & Realtek RTL8922AE 6GHz
 missing - Mint 22.3
Thread-Topic: [BUG] Intel B580 (e20b) HDMI Flicker & Realtek RTL8922AE 6GHz
 missing - Mint 22.3
Thread-Index: AQHccYNzkqomb5qXxkujgzhV+EMuFbUu29YA
Date: Tue, 23 Dec 2025 07:47:57 +0000
Message-ID: <3dcf5e11aa284daa9d3733141ccdc17f@realtek.com>
References: <AB8446D8-708B-4971-8852-87353112E60F.ref@aol.com>
 <AB8446D8-708B-4971-8852-87353112E60F@aol.com>
In-Reply-To: <AB8446D8-708B-4971-8852-87353112E60F@aol.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Dec 2025 14:57:33 +0000
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

Chris Russomanno <russomch@aol.com> wrote:
> Hello,
>=20
> I am reporting two issues encountered on brand-new hardware using Linux M=
int 22.3 with Kernel 6.14.0-generic.
>=20
> Hardware Environment:
> - GPU: Intel Arc B580 (Battlemage), PCI ID: [8086:e20b]
> - WiFi: Realtek RTL8922AE (rtw89), Firmware: rtw8922a_fw-3.bin
> - Display: Samsung 4K Monitor connected via HDMI (No DisplayPort availabl=
e)
>=20
> Issue 1: Intel Xe HDMI Flickering
> The Samsung monitor experiences intermittent black-screen flickering (1-2=
 seconds) at both 4K and 1080p
> resolutions. This behavior is not present on Windows 11.
> Troubleshooting attempted:
> - Added kernel parameters: quiet splash i915.enable_psr=3D0 xe.force_prob=
e=3De20b i915.enable_dc=3D0
> intel_iommu=3Digfx_off intel_idle.max_cstate=3D2
> - Forced "TearFree" and "TripleBuffer" in xorg.conf.
> - Frequency remains at 60Hz.
>=20
> Issue 2: Realtek RTL8922AE 6GHz/WiFi 7 Missing
> The card functions on 5GHz (1200 Mb/s) but does not scan or see 6GHz freq=
uencies.
> Troubleshooting attempted:
> - Set regdom to US (iw reg set US).
> - Driver options: rtw89_pci disable_aspm=3Dy, rtw89_core disable_6g=3DN.
> - 'iw list' does not return any 6GHz/6105 MHz frequencies.

Please share output of 'iw list' before/after setting US.=20

In my side (expected) frequencies of band 4 are:

[Before]
                Frequencies:
                        * 5955.0 MHz [1] (disabled)
                        * 5975.0 MHz [5] (disabled)
                        * 5995.0 MHz [9] (disabled)
                        * 6015.0 MHz [13] (disabled)
                        * 6035.0 MHz [17] (disabled)
                        * 6055.0 MHz [21] (disabled)

[After]
                Frequencies:
                        * 5955.0 MHz [1] (12.0 dBm) (no IR)
                        * 5975.0 MHz [5] (12.0 dBm) (no IR)
                        * 5995.0 MHz [9] (12.0 dBm) (no IR)
                        * 6015.0 MHz [13] (12.0 dBm) (no IR)
                        * 6035.0 MHz [17] (12.0 dBm) (no IR)


