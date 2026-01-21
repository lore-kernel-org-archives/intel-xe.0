Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5180AD26296
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 14:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1204E10E804;
	Wed, 21 Jan 2026 14:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Pq9mK7xd";
	dkim-atps=neutral
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1FF10E7F1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 14:10:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769004651; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jNgmeeXaIqmWa79XHkTtyJ6O7/l6OEmQUwrrJ6bxY/FdbW9vTqMz9MSr7I8dpKioPEXcZck2HLBN4aVjx+Wf0VdDMuhvTdeyyNuWj95rUOwTfECP41pU4pl3MVycwcZypibZbgNrt4m2+Na9hFGHkaUFFmWQ4U/zKEoTrKKzh9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769004651;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9CEyRyh01iqMhYqRa4DLcmvq/PVepcZbe9d4l9wOIQk=; 
 b=EZU8jBeCYElROByaWLcSggIm4POC7J5Smsz575l79EicJnG4XzFbEEJgE5oZy5SFubkK/wB54lgvUmnr21RM6MVy4cBEEtH1KoyreFPzujvm8x1YkjvX3D27GWGhV6jpw1M3nchvpnNO8HdpvFELGD2PKPGINXtG5crzD9lhI0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769004651; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=9CEyRyh01iqMhYqRa4DLcmvq/PVepcZbe9d4l9wOIQk=;
 b=Pq9mK7xdq3KxsiegdEtfLqgqh2l6ziUVGA47JpcCOpdnrdm6s+d5MnZKMeRTQw+9
 QihYXmNNIX6Tm8Zmc6Dk291LzGI37n0QybYYgjxVawKq8s1+vntrip0Z/ycrCOhd5uS
 eiFBZ8n//PPguVCvE/eHo6GdEsBkZg6F6h26ymXc=
Received: by mx.zohomail.com with SMTPS id 1769004649374451.918206998556;
 Wed, 21 Jan 2026 06:10:49 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= CI.KUnit: failure for Add new general DRM
 property "color format" (rev3)
Date: Wed, 21 Jan 2026 15:10:45 +0100
Message-ID: <6321697.DvuYhMxLoT@workhorse>
In-Reply-To: <176900389943.178097.6108000384871732066@a3b018990fe9>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
 <176900389943.178097.6108000384871732066@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Wednesday, 21 January 2026 14:58:19 Central European Standard Time Patch=
work wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: Add new general DRM property "color format" (rev3)
> URL   : https://patchwork.freedesktop.org/series/157911/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/=
gpu/drm/xe/.kunitconfig
> [13:57:15] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> [13:57:19] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=3Dum O=3D.kunit --jobs=
=3D48
> [13:57:51] Starting KUnit Kernel (1/1)...
> [13:57:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Running tests with:
> $ .kunit/linux kunit.enable=3D1 mem=3D1G console=3Dtty kunit_shutdown=3Dh=
alt
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D guc_buf=
 (11 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] test_smallest
> [13:57:52] [PASSED] test_largest
> [13:57:52] [PASSED] test_granular
> [13:57:52] [PASSED] test_unique
> [13:57:52] [PASSED] test_overlap
> [13:57:52] [PASSED] test_reusable
> [13:57:52] [PASSED] test_too_big
> [13:57:52] [PASSED] test_flush
> [13:57:52] [PASSED] test_lookup
> [13:57:52] [PASSED] test_data
> [13:57:52] [PASSED] test_class
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] guc_buf =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D guc_=
dbm (7 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] test_empty
> [13:57:52] [PASSED] test_default
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D test_size  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 4
> [13:57:52] [PASSED] 8
> [13:57:52] [PASSED] 32
> [13:57:52] [PASSED] 256
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] test_size =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D test_reuse  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 4
> [13:57:52] [PASSED] 8
> [13:57:52] [PASSED] 32
> [13:57:52] [PASSED] 256
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PAS=
SED] test_reuse =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D test=
_range_overlap  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 4
> [13:57:52] [PASSED] 8
> [13:57:52] [PASSED] 32
> [13:57:52] [PASSED] 256
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_ra=
nge_overlap =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D test=
_range_compact  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 4
> [13:57:52] [PASSED] 8
> [13:57:52] [PASSED] 32
> [13:57:52] [PASSED] 256
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_ra=
nge_compact =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D t=
est_range_spare  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] [PASSED] 4
> [13:57:52] [PASSED] 8
> [13:57:52] [PASSED] 32
> [13:57:52] [PASSED] 256
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test=
_range_spare =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] guc_dbm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D guc_=
idm (6 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] bad_init
> [13:57:52] [PASSED] no_init
> [13:57:52] [PASSED] init_fini
> [13:57:52] [PASSED] check_used
> [13:57:52] [PASSED] check_quota
> [13:57:52] [PASSED] check_all
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] guc_idm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D no_rela=
y (3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] xe_drops_guc2pf_if_not_ready
> [13:57:52] [PASSED] xe_drops_guc2vf_if_not_ready
> [13:57:52] [PASSED] xe_rejects_send_if_not_ready
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] no_relay =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D pf_rela=
y (14 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] pf_rejects_guc2pf_too_short
> [13:57:52] [PASSED] pf_rejects_guc2pf_too_long
> [13:57:52] [PASSED] pf_rejects_guc2pf_no_payload
> [13:57:52] [PASSED] pf_fails_no_payload
> [13:57:52] [PASSED] pf_fails_bad_origin
> [13:57:52] [PASSED] pf_fails_bad_type
> [13:57:52] [PASSED] pf_txn_reports_error
> [13:57:52] [PASSED] pf_txn_sends_pf2guc
> [13:57:52] [PASSED] pf_sends_pf2guc
> [13:57:52] [SKIPPED] pf_loopback_nop
> [13:57:52] [SKIPPED] pf_loopback_echo
> [13:57:52] [SKIPPED] pf_loopback_fail
> [13:57:52] [SKIPPED] pf_loopback_busy
> [13:57:52] [SKIPPED] pf_loopback_retry
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] pf_relay =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D vf_rela=
y (3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] vf_rejects_guc2vf_too_short
> [13:57:52] [PASSED] vf_rejects_guc2vf_too_long
> [13:57:52] [PASSED] vf_rejects_guc2vf_no_payload
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] vf_relay =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D pf_gt_config =
(6 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] fair_contexts_1vf
> [13:57:52] [PASSED] fair_doorbells_1vf
> [13:57:52] [PASSED] fair_ggtt_1vf
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D fair_contexts  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 1 VF
> [13:57:52] [PASSED] 2 VFs
> [13:57:52] [PASSED] 3 VFs
> [13:57:52] [PASSED] 4 VFs
> [13:57:52] [PASSED] 5 VFs
> [13:57:52] [PASSED] 6 VFs
> [13:57:52] [PASSED] 7 VFs
> [13:57:52] [PASSED] 8 VFs
> [13:57:52] [PASSED] 9 VFs
> [13:57:52] [PASSED] 10 VFs
> [13:57:52] [PASSED] 11 VFs
> [13:57:52] [PASSED] 12 VFs
> [13:57:52] [PASSED] 13 VFs
> [13:57:52] [PASSED] 14 VFs
> [13:57:52] [PASSED] 15 VFs
> [13:57:52] [PASSED] 16 VFs
> [13:57:52] [PASSED] 17 VFs
> [13:57:52] [PASSED] 18 VFs
> [13:57:52] [PASSED] 19 VFs
> [13:57:52] [PASSED] 20 VFs
> [13:57:52] [PASSED] 21 VFs
> [13:57:52] [PASSED] 22 VFs
> [13:57:52] [PASSED] 23 VFs
> [13:57:52] [PASSED] 24 VFs
> [13:57:52] [PASSED] 25 VFs
> [13:57:52] [PASSED] 26 VFs
> [13:57:52] [PASSED] 27 VFs
> [13:57:52] [PASSED] 28 VFs
> [13:57:52] [PASSED] 29 VFs
> [13:57:52] [PASSED] 30 VFs
> [13:57:52] [PASSED] 31 VFs
> [13:57:52] [PASSED] 32 VFs
> [13:57:52] [PASSED] 33 VFs
> [13:57:52] [PASSED] 34 VFs
> [13:57:52] [PASSED] 35 VFs
> [13:57:52] [PASSED] 36 VFs
> [13:57:52] [PASSED] 37 VFs
> [13:57:52] [PASSED] 38 VFs
> [13:57:52] [PASSED] 39 VFs
> [13:57:52] [PASSED] 40 VFs
> [13:57:52] [PASSED] 41 VFs
> [13:57:52] [PASSED] 42 VFs
> [13:57:52] [PASSED] 43 VFs
> [13:57:52] [PASSED] 44 VFs
> [13:57:52] [PASSED] 45 VFs
> [13:57:52] [PASSED] 46 VFs
> [13:57:52] [PASSED] 47 VFs
> [13:57:52] [PASSED] 48 VFs
> [13:57:52] [PASSED] 49 VFs
> [13:57:52] [PASSED] 50 VFs
> [13:57:52] [PASSED] 51 VFs
> [13:57:52] [PASSED] 52 VFs
> [13:57:52] [PASSED] 53 VFs
> [13:57:52] [PASSED] 54 VFs
> [13:57:52] [PASSED] 55 VFs
> [13:57:52] [PASSED] 56 VFs
> [13:57:52] [PASSED] 57 VFs
> [13:57:52] [PASSED] 58 VFs
> [13:57:52] [PASSED] 59 VFs
> [13:57:52] [PASSED] 60 VFs
> [13:57:52] [PASSED] 61 VFs
> [13:57:52] [PASSED] 62 VFs
> [13:57:52] [PASSED] 63 VFs
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED=
] fair_contexts =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D fair_doorbells  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [13:57:52] [PASSED] 1 VF
> [13:57:52] [PASSED] 2 VFs
> [13:57:52] [PASSED] 3 VFs
> [13:57:52] [PASSED] 4 VFs
> [13:57:52] [PASSED] 5 VFs
> [13:57:52] [PASSED] 6 VFs
> [13:57:52] [PASSED] 7 VFs
> [13:57:52] [PASSED] 8 VFs
> [13:57:52] [PASSED] 9 VFs
> [13:57:52] [PASSED] 10 VFs
> [13:57:52] [PASSED] 11 VFs
> [13:57:52] [PASSED] 12 VFs
> [13:57:52] [PASSED] 13 VFs
> [13:57:52] [PASSED] 14 VFs
> [13:57:52] [PASSED] 15 VFs
> [13:57:52] [PASSED] 16 VFs
> [13:57:52] [PASSED] 17 VFs
> [13:57:52] [PASSED] 18 VFs
> [13:57:52] [PASSED] 19 VFs
> [13:57:52] [PASSED] 20 VFs
> [13:57:52] [PASSED] 21 VFs
> [13:57:52] [PASSED] 22 VFs
> [13:57:52] [PASSED] 23 VFs
> [13:57:52] [PASSED] 24 VFs
> [13:57:52] [PASSED] 25 VFs
> [13:57:52] [PASSED] 26 VFs
> [13:57:52] [PASSED] 27 VFs
> [13:57:52] [PASSED] 28 VFs
> [13:57:52] [PASSED] 29 VFs
> [13:57:52] [PASSED] 30 VFs
> [13:57:52] [PASSED] 31 VFs
> [13:57:52] [PASSED] 32 VFs
> [13:57:52] [PASSED] 33 VFs
> [13:57:52] [PASSED] 34 VFs
> [13:57:52] [PASSED] 35 VFs
> [13:57:52] [PASSED] 36 VFs
> [13:57:52] [PASSED] 37 VFs
> [13:57:52] [PASSED] 38 VFs
> [13:57:52] [PASSED] 39 VFs
> [13:57:52] [PASSED] 40 VFs
> [13:57:52] [PASSED] 41 VFs
> [13:57:52] [PASSED] 42 VFs
> [13:57:52] [PASSED] 43 VFs
> [13:57:52] [PASSED] 44 VFs
> [13:57:52] [PASSED] 45 VFs
> [13:57:52] [PASSED] 46 VFs
> [13:57:52] [PASSED] 47 VFs
> [13:57:52] [PASSED] 48 VFs
> [13:57:52] [PASSED] 49 VFs
> [13:57:52] [PASSED] 50 VFs
> [13:57:52] [PASSED] 51 VFs
> [13:57:52] [PASSED] 52 VFs
> [13:57:52] [PASSED] 53 VFs
> [13:57:52] [PASSED] 54 VFs
> [13:57:52] [PASSED] 55 VFs
> [13:57:52] [PASSED] 56 VFs
> [13:57:52] [PASSED] 57 VFs
> [13:57:52] [PASSED] 58 VFs
> [13:57:52] [PASSED] 59 VFs
> [13:57:52] [PASSED] 60 VFs
> [13:57:52] [PASSED] 61 VFs
> [13:57:52] [PASSED] 62 VFs
> [13:57:52] [PASSED] 63 VFs
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] f=
air_doorbells =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D fair_ggtt  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 1 VF
> [13:57:52] [PASSED] 2 VFs
> [13:57:52] [PASSED] 3 VFs
> [13:57:52] [PASSED] 4 VFs
> [13:57:52] [PASSED] 5 VFs
> [13:57:52] [PASSED] 6 VFs
> [13:57:52] [PASSED] 7 VFs
> [13:57:52] [PASSED] 8 VFs
> [13:57:52] [PASSED] 9 VFs
> [13:57:52] [PASSED] 10 VFs
> [13:57:52] [PASSED] 11 VFs
> [13:57:52] [PASSED] 12 VFs
> [13:57:52] [PASSED] 13 VFs
> [13:57:52] [PASSED] 14 VFs
> [13:57:52] [PASSED] 15 VFs
> [13:57:52] [PASSED] 16 VFs
> [13:57:52] [PASSED] 17 VFs
> [13:57:52] [PASSED] 18 VFs
> [13:57:52] [PASSED] 19 VFs
> [13:57:52] [PASSED] 20 VFs
> [13:57:52] [PASSED] 21 VFs
> [13:57:52] [PASSED] 22 VFs
> [13:57:52] [PASSED] 23 VFs
> [13:57:52] [PASSED] 24 VFs
> [13:57:52] [PASSED] 25 VFs
> [13:57:52] [PASSED] 26 VFs
> [13:57:52] [PASSED] 27 VFs
> [13:57:52] [PASSED] 28 VFs
> [13:57:52] [PASSED] 29 VFs
> [13:57:52] [PASSED] 30 VFs
> [13:57:52] [PASSED] 31 VFs
> [13:57:52] [PASSED] 32 VFs
> [13:57:52] [PASSED] 33 VFs
> [13:57:52] [PASSED] 34 VFs
> [13:57:52] [PASSED] 35 VFs
> [13:57:52] [PASSED] 36 VFs
> [13:57:52] [PASSED] 37 VFs
> [13:57:52] [PASSED] 38 VFs
> [13:57:52] [PASSED] 39 VFs
> [13:57:52] [PASSED] 40 VFs
> [13:57:52] [PASSED] 41 VFs
> [13:57:52] [PASSED] 42 VFs
> [13:57:52] [PASSED] 43 VFs
> [13:57:52] [PASSED] 44 VFs
> [13:57:52] [PASSED] 45 VFs
> [13:57:52] [PASSED] 46 VFs
> [13:57:52] [PASSED] 47 VFs
> [13:57:52] [PASSED] 48 VFs
> [13:57:52] [PASSED] 49 VFs
> [13:57:52] [PASSED] 50 VFs
> [13:57:52] [PASSED] 51 VFs
> [13:57:52] [PASSED] 52 VFs
> [13:57:52] [PASSED] 53 VFs
> [13:57:52] [PASSED] 54 VFs
> [13:57:52] [PASSED] 55 VFs
> [13:57:52] [PASSED] 56 VFs
> [13:57:52] [PASSED] 57 VFs
> [13:57:52] [PASSED] 58 VFs
> [13:57:52] [PASSED] 59 VFs
> [13:57:52] [PASSED] 60 VFs
> [13:57:52] [PASSED] 61 VFs
> [13:57:52] [PASSED] 62 VFs
> [13:57:52] [PASSED] 63 VFs
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] fair_ggtt =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED=
] pf_gt_config =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D lmtt (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D test_ops  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 2-level
> [13:57:52] [PASSED] multi-level
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] test_ops =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D [PASSED] lmtt =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D pf_service=
 (11 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] pf_negotiate_any
> [13:57:52] [PASSED] pf_negotiate_base_match
> [13:57:52] [PASSED] pf_negotiate_base_newer
> [13:57:52] [PASSED] pf_negotiate_base_next
> [13:57:52] [SKIPPED] pf_negotiate_base_older
> [13:57:52] [PASSED] pf_negotiate_base_prev
> [13:57:52] [PASSED] pf_negotiate_latest_match
> [13:57:52] [PASSED] pf_negotiate_latest_newer
> [13:57:52] [PASSED] pf_negotiate_latest_next
> [13:57:52] [SKIPPED] pf_negotiate_latest_older
> [13:57:52] [SKIPPED] pf_negotiate_latest_prev
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PAS=
SED] pf_service =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_guc_g2g=
 (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_live_guc_g2g_kun=
it_default  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_live_guc_g2g_kunit_de=
fault =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_live_guc_g2g_kun=
it_allmem  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_live_guc_g2g_kunit=
_allmem =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKI=
PPED] xe_guc_g2g =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_m=
ocs (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_live_mocs_=
kernel_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_live_mocs_kerne=
l_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_live_mocs_=
reset_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_live_mocs_re=
set_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
SKIPPED] xe_mocs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_migrate=
 (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_migrate=
_sanity_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_migrate_sani=
ty_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_vali=
date_ccs_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_validate_=
ccs_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKI=
PPED] xe_migrate =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_dma_=
buf (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_dma_buf_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_=
dma_buf_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKI=
PPED] xe_dma_buf =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_bo_shri=
nk (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_b=
o_shrink_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_bo_=
shrink_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPE=
D] xe_bo_shrink =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_bo (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_ccs_=
migrate_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_ccs_mi=
grate_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_bo_evict_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKIPPED] xe_bo_=
evict_kunit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [SKIPPED] xe_bo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D a=
rgs (13 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [13:57:52] [PASSED] count_args_test
> [13:57:52] [PASSED] call_args_example
> [13:57:52] [PASSED] call_args_test
> [13:57:52] [PASSED] drop_first_arg_example
> [13:57:52] [PASSED] drop_first_arg_test
> [13:57:52] [PASSED] first_arg_example
> [13:57:52] [PASSED] first_arg_test
> [13:57:52] [PASSED] last_arg_example
> [13:57:52] [PASSED] last_arg_test
> [13:57:52] [PASSED] pick_arg_example
> [13:57:52] [PASSED] if_args_example
> [13:57:52] [PASSED] if_args_test
> [13:57:52] [PASSED] sep_comma_example
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D [PASSED] args =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_p=
ci (3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D c=
heck_graphics_ip  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [13:57:52] [PASSED] 12.00 Xe_LP
> [13:57:52] [PASSED] 12.10 Xe_LP+
> [13:57:52] [PASSED] 12.55 Xe_HPG
> [13:57:52] [PASSED] 12.60 Xe_HPC
> [13:57:52] [PASSED] 12.70 Xe_LPG
> [13:57:52] [PASSED] 12.71 Xe_LPG
> [13:57:52] [PASSED] 12.74 Xe_LPG+
> [13:57:52] [PASSED] 20.01 Xe2_HPG
> [13:57:52] [PASSED] 20.02 Xe2_HPG
> [13:57:52] [PASSED] 20.04 Xe2_LPG
> [13:57:52] [PASSED] 30.00 Xe3_LPG
> [13:57:52] [PASSED] 30.01 Xe3_LPG
> [13:57:52] [PASSED] 30.03 Xe3_LPG
> [13:57:52] [PASSED] 30.04 Xe3_LPG
> [13:57:52] [PASSED] 30.05 Xe3_LPG
> [13:57:52] [PASSED] 35.11 Xe3p_XPC
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] chec=
k_graphics_ip =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D check_media_ip  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [13:57:52] [PASSED] 12.00 Xe_M
> [13:57:52] [PASSED] 12.55 Xe_HPM
> [13:57:52] [PASSED] 13.00 Xe_LPM+
> [13:57:52] [PASSED] 13.01 Xe2_HPM
> [13:57:52] [PASSED] 20.00 Xe2_LPM
> [13:57:52] [PASSED] 30.00 Xe3_LPM
> [13:57:52] [PASSED] 30.02 Xe3_LPM
> [13:57:52] [PASSED] 35.00 Xe3p_LPM
> [13:57:52] [PASSED] 35.03 Xe3p_HPM
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] c=
heck_media_ip =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D chec=
k_platform_desc  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] 0x9A60 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9A68 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9A70 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9A40 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9A49 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9A59 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9A78 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9AC0 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9AC9 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9AD9 (TIGERLAKE)
> [13:57:52] [PASSED] 0x9AF8 (TIGERLAKE)
> [13:57:52] [PASSED] 0x4C80 (ROCKETLAKE)
> [13:57:52] [PASSED] 0x4C8A (ROCKETLAKE)
> [13:57:52] [PASSED] 0x4C8B (ROCKETLAKE)
> [13:57:52] [PASSED] 0x4C8C (ROCKETLAKE)
> [13:57:52] [PASSED] 0x4C90 (ROCKETLAKE)
> [13:57:52] [PASSED] 0x4C9A (ROCKETLAKE)
> [13:57:52] [PASSED] 0x4680 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x4682 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x4688 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x468A (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x468B (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x4690 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x4692 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x4693 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x46A0 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46A1 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46A2 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46A3 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46A6 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46A8 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46AA (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x462A (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x4626 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x4628 (ALDERLAKE_P)
> stty: 'standard input': Inappropriate ioctl for device
> [13:57:52] [PASSED] 0x46B0 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46B1 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46B2 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46B3 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46C0 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46C1 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46C2 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46C3 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0x46D0 (ALDERLAKE_N)
> [13:57:52] [PASSED] 0x46D1 (ALDERLAKE_N)
> [13:57:52] [PASSED] 0x46D2 (ALDERLAKE_N)
> [13:57:52] [PASSED] 0x46D3 (ALDERLAKE_N)
> [13:57:52] [PASSED] 0x46D4 (ALDERLAKE_N)
> [13:57:52] [PASSED] 0xA721 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7A1 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7A9 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7AC (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7AD (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA720 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7A0 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7A8 (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7AA (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA7AB (ALDERLAKE_P)
> [13:57:52] [PASSED] 0xA780 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA781 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA782 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA783 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA788 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA789 (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA78A (ALDERLAKE_S)
> [13:57:52] [PASSED] 0xA78B (ALDERLAKE_S)
> [13:57:52] [PASSED] 0x4905 (DG1)
> [13:57:52] [PASSED] 0x4906 (DG1)
> [13:57:52] [PASSED] 0x4907 (DG1)
> [13:57:52] [PASSED] 0x4908 (DG1)
> [13:57:52] [PASSED] 0x4909 (DG1)
> [13:57:52] [PASSED] 0x56C0 (DG2)
> [13:57:52] [PASSED] 0x56C2 (DG2)
> [13:57:52] [PASSED] 0x56C1 (DG2)
> [13:57:52] [PASSED] 0x7D51 (METEORLAKE)
> [13:57:52] [PASSED] 0x7DD1 (METEORLAKE)
> [13:57:52] [PASSED] 0x7D41 (METEORLAKE)
> [13:57:52] [PASSED] 0x7D67 (METEORLAKE)
> [13:57:52] [PASSED] 0xB640 (METEORLAKE)
> [13:57:52] [PASSED] 0x56A0 (DG2)
> [13:57:52] [PASSED] 0x56A1 (DG2)
> [13:57:52] [PASSED] 0x56A2 (DG2)
> [13:57:52] [PASSED] 0x56BE (DG2)
> [13:57:52] [PASSED] 0x56BF (DG2)
> [13:57:52] [PASSED] 0x5690 (DG2)
> [13:57:52] [PASSED] 0x5691 (DG2)
> [13:57:52] [PASSED] 0x5692 (DG2)
> [13:57:52] [PASSED] 0x56A5 (DG2)
> [13:57:52] [PASSED] 0x56A6 (DG2)
> [13:57:52] [PASSED] 0x56B0 (DG2)
> [13:57:52] [PASSED] 0x56B1 (DG2)
> [13:57:52] [PASSED] 0x56BA (DG2)
> [13:57:52] [PASSED] 0x56BB (DG2)
> [13:57:52] [PASSED] 0x56BC (DG2)
> [13:57:52] [PASSED] 0x56BD (DG2)
> [13:57:52] [PASSED] 0x5693 (DG2)
> [13:57:52] [PASSED] 0x5694 (DG2)
> [13:57:52] [PASSED] 0x5695 (DG2)
> [13:57:52] [PASSED] 0x56A3 (DG2)
> [13:57:52] [PASSED] 0x56A4 (DG2)
> [13:57:52] [PASSED] 0x56B2 (DG2)
> [13:57:52] [PASSED] 0x56B3 (DG2)
> [13:57:52] [PASSED] 0x5696 (DG2)
> [13:57:52] [PASSED] 0x5697 (DG2)
> [13:57:52] [PASSED] 0xB69 (PVC)
> [13:57:52] [PASSED] 0xB6E (PVC)
> [13:57:52] [PASSED] 0xBD4 (PVC)
> [13:57:52] [PASSED] 0xBD5 (PVC)
> [13:57:52] [PASSED] 0xBD6 (PVC)
> [13:57:52] [PASSED] 0xBD7 (PVC)
> [13:57:52] [PASSED] 0xBD8 (PVC)
> [13:57:52] [PASSED] 0xBD9 (PVC)
> [13:57:52] [PASSED] 0xBDA (PVC)
> [13:57:52] [PASSED] 0xBDB (PVC)
> [13:57:52] [PASSED] 0xBE0 (PVC)
> [13:57:52] [PASSED] 0xBE1 (PVC)
> [13:57:52] [PASSED] 0xBE5 (PVC)
> [13:57:52] [PASSED] 0x7D40 (METEORLAKE)
> [13:57:52] [PASSED] 0x7D45 (METEORLAKE)
> [13:57:52] [PASSED] 0x7D55 (METEORLAKE)
> [13:57:52] [PASSED] 0x7D60 (METEORLAKE)
> [13:57:52] [PASSED] 0x7DD5 (METEORLAKE)
> [13:57:52] [PASSED] 0x6420 (LUNARLAKE)
> [13:57:52] [PASSED] 0x64A0 (LUNARLAKE)
> [13:57:52] [PASSED] 0x64B0 (LUNARLAKE)
> [13:57:52] [PASSED] 0xE202 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE209 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE20B (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE20C (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE20D (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE210 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE211 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE212 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE216 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE220 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE221 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE222 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xE223 (BATTLEMAGE)
> [13:57:52] [PASSED] 0xB080 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB081 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB082 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB083 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB084 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB085 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB086 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB087 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB08F (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB090 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB0A0 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xB0B0 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xFD80 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xFD81 (PANTHERLAKE)
> [13:57:52] [PASSED] 0xD740 (NOVALAKE_S)
> [13:57:52] [PASSED] 0xD741 (NOVALAKE_S)
> [13:57:52] [PASSED] 0xD742 (NOVALAKE_S)
> [13:57:52] [PASSED] 0xD743 (NOVALAKE_S)
> [13:57:52] [PASSED] 0xD744 (NOVALAKE_S)
> [13:57:52] [PASSED] 0xD745 (NOVALAKE_S)
> [13:57:52] [PASSED] 0x674C (CRESCENTISLAND)
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] check_p=
latform_desc =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] xe_pci =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_r=
tp (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_rtp_process_t=
o_sr_tests  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] coalesce-same-reg
> [13:57:52] [PASSED] no-match-no-add
> [13:57:52] [PASSED] match-or
> [13:57:52] [PASSED] match-or-xfail
> [13:57:52] [PASSED] no-match-no-add-multiple-rules
> [13:57:52] [PASSED] two-regs-two-entries
> [13:57:52] [PASSED] clr-one-set-other
> [13:57:52] [PASSED] set-field
> [13:57:52] [PASSED] conflict-duplicate
> [13:57:52] [PASSED] conflict-not-disjoint
> [13:57:52] [PASSED] conflict-reg-type
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] xe_rtp_process_to_s=
r_tests =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_rtp_=
process_tests  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] active1
> [13:57:52] [PASSED] active2
> [13:57:52] [PASSED] active-inactive
> [13:57:52] [PASSED] inactive-active
> [13:57:52] [PASSED] inactive-1st_or_active-inactive
> [13:57:52] [PASSED] inactive-2nd_or_active-inactive
> [13:57:52] [PASSED] inactive-last_or_active-inactive
> [13:57:52] [PASSED] inactive-no_or_active-inactive
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] xe_rtp_pro=
cess_tests =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] xe_rtp =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_wa (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D xe_wa_gt  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] [PASSED] TIGERLAKE B0
> [13:57:52] [PASSED] DG1 A0
> [13:57:52] [PASSED] DG1 B0
> [13:57:52] [PASSED] ALDERLAKE_S A0
> [13:57:52] [PASSED] ALDERLAKE_S B0
> [13:57:52] [PASSED] ALDERLAKE_S C0
> [13:57:52] [PASSED] ALDERLAKE_S D0
> [13:57:52] [PASSED] ALDERLAKE_P A0
> [13:57:52] [PASSED] ALDERLAKE_P B0
> [13:57:52] [PASSED] ALDERLAKE_P C0
> [13:57:52] [PASSED] ALDERLAKE_S RPLS D0
> [13:57:52] [PASSED] ALDERLAKE_P RPLU E0
> [13:57:52] [PASSED] DG2 G10 C0
> [13:57:52] [PASSED] DG2 G11 B1
> [13:57:52] [PASSED] DG2 G12 A1
> [13:57:52] [PASSED] METEORLAKE 12.70(Xe_LPG) A0 13.00(Xe_LPM+) A0
> [13:57:52] [PASSED] METEORLAKE 12.71(Xe_LPG) A0 13.00(Xe_LPM+) A0
> [13:57:52] [PASSED] METEORLAKE 12.74(Xe_LPG+) A0 13.00(Xe_LPM+) A0
> [13:57:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) A0 20.00(Xe2_LPM) A0
> [13:57:52] [PASSED] LUNARLAKE 20.04(Xe2_LPG) B0 20.00(Xe2_LPM) A0
> [13:57:52] [PASSED] BATTLEMAGE 20.01(Xe2_HPG) A0 13.01(Xe2_HPM) A1
> [13:57:52] [PASSED] PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] xe_wa_gt =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D [PASSED] xe_wa =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [13:57:52] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13:57:52] Testing complete. Ran 512 tests: passed: 494, skipped: 18
> [13:57:52] Elapsed time: 36.509s total, 4.164s configuring, 31.829s build=
ing, 0.466s running
>=20
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/=
gpu/drm/tests/.kunitconfig
> ERROR:root:../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=
=80=98const struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98h=
dmi_write_infoframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infofram=
e=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:340:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   340 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:340:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   340 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:343:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   343 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:343:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   343 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:346:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   346 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_yuv8_or_id);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:346:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   346 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_yuv8_or_id);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:349:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   349 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_to_rgb8_or_id);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:349:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   349 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_to_rgb8_or_id);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:352:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   352 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_producer);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:352:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   352 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_producer);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:355:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   355 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_yuv444_yuv420_producer);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:355:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   355 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_yuv444_yuv420_producer);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:358:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   358 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_id_yuv8_or_yuv8_to_yuv422_=
yuv420);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:358:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   358 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_id_yuv8_or_yuv8_to_yuv422_=
yuv420);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:361:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   361 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_yuv444_yuv422_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:361:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   361 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_yuv444_yuv422_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:364:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   364 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv444_yuv422_rgb8_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:311:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   311 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmt=
s_func, output_fmts_func,      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:315:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC=E2=80=99
>   315 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,     =
                       \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:364:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT=E2=80=99
>   364 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv444_yuv422_rgb8_passthrough);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi #=
# _funcs,                      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI=E2=80=99
>   365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthroug=
h);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:43: error: initialization =
of =E2=80=98u32 * (*)(struct drm_bridge *, struct drm_bridge_state *, struc=
t drm_crtc_state *, struct drm_connector_state *, u32,  unsigned int *)=E2=
=80=99 {aka =E2=80=98unsigned int * (*)(struct drm_bridge *, struct drm_bri=
dge_state *, struct drm_crtc_state *, struct drm_connector_state *, unsigne=
d int,  unsigned int *)=E2=80=99} from incompatible pointer type =E2=80=98i=
nt (*)(struct drm_bridge *, enum hdmi_infoframe_type,  const u8 *, size_t)=
=E2=80=99 {aka =E2=80=98int (*)(struct drm_bridge *, enum hdmi_infoframe_ty=
pe,  const unsigned char *, long unsigned int)=E2=80=99} [-Werror=3Dincompa=
tible-pointer-types]
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |                                           ^
> ../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi #=
# _funcs,                      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI=E2=80=99
>   365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthroug=
h);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:306:43: note: (near initializa=
tion for =E2=80=98yuv444_yuv422_rgb8_passthrough_hdmi_funcs.atomic_get_inpu=
t_bus_fmts=E2=80=99)
>   306 |         .hdmi_write_infoframe           =3D (hdmi_write_infoframe=
_func),                          \
>       |                                           ^
> ../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi #=
# _funcs,                      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI=E2=80=99
>   365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthroug=
h);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:10: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |          ^~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi #=
# _funcs,                      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI=E2=80=99
>   365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthroug=
h);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:43: error: initialization =
of =E2=80=98int (*)(struct drm_bridge *, struct drm_bridge_state *, struct =
drm_crtc_state *, struct drm_connector_state *)=E2=80=99 from incompatible =
pointer type =E2=80=98int (*)(struct drm_bridge *, enum hdmi_infoframe_type=
)=E2=80=99 [-Werror=3Dincompatible-pointer-types]
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |                                           ^
> ../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi #=
# _funcs,                      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI=E2=80=99
>   365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthroug=
h);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:307:43: note: (near initializa=
tion for =E2=80=98yuv444_yuv422_rgb8_passthrough_hdmi_funcs.atomic_check=E2=
=80=99)
>   307 |         .hdmi_clear_infoframe           =3D (hdmi_clear_infoframe=
_func),                          \
>       |                                           ^
> ../drivers/gpu/drm/tests/drm_bridge_test.c:334:9: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC=E2=80=99
>   334 |         DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi #=
# _funcs,                      \
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c:365:1: note: in expansion of m=
acro =E2=80=98DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI=E2=80=99
>   365 | DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthroug=
h);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_bridge_test.c: In function =E2=80=98drm_test=
_bridge_chain_init=E2=80=99:
> ../drivers/gpu/drm/tests/drm_bridge_test.c:520:36: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_clear_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_clear_avi_infoframe=E2=80=99?
>   520 |                 if (bridge->funcs->hdmi_clear_infoframe &&
>       |                                    ^~~~~~~~~~~~~~~~~~~~
>       |                                    hdmi_clear_avi_infoframe
> ../drivers/gpu/drm/tests/drm_bridge_test.c:521:36: error: =E2=80=98const =
struct drm_bridge_funcs=E2=80=99 has no member named =E2=80=98hdmi_write_in=
foframe=E2=80=99; did you mean =E2=80=98hdmi_write_avi_infoframe=E2=80=99?
>   521 |                     bridge->funcs->hdmi_write_infoframe) {
>       |                                    ^~~~~~~~~~~~~~~~~~~~
>       |                                    hdmi_write_avi_infoframe
> In file included from ../drivers/gpu/drm/tests/drm_bridge_test.c:20:
> ../drivers/gpu/drm/tests/drm_kunit_edid.h: At top level:
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:958:28: warning: =E2=80=98test_=
edid_hdmi_4k_rgb_yuv420_dc_max_340mhz=E2=80=99 defined but not used [-Wunus=
ed-const-variable=3D]
>   958 | static const unsigned char test_edid_hdmi_4k_rgb_yuv420_dc_max_34=
0mhz[] =3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:726:28: warning: =E2=80=98test_=
edid_hdmi_1080p_rgb_yuv_dc_max_340mhz=E2=80=99 defined but not used [-Wunus=
ed-const-variable=3D]
>   726 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_34=
0mhz[] =3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:612:28: warning: =E2=80=98test_=
edid_hdmi_1080p_rgb_yuv_dc_max_200mhz=E2=80=99 defined but not used [-Wunus=
ed-const-variable=3D]
>   612 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_20=
0mhz[] =3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:498:28: warning: =E2=80=98test_=
edid_hdmi_1080p_rgb_max_340mhz=E2=80=99 defined but not used [-Wunused-cons=
t-variable=3D]
>   498 | static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] =
=3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:390:28: warning: =E2=80=98test_=
edid_hdmi_1080p_rgb_max_200mhz_hdr=E2=80=99 defined but not used [-Wunused-=
const-variable=3D]
>   390 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hd=
r[] =3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:271:28: warning: =E2=80=98test_=
edid_hdmi_1080p_rgb_max_200mhz=E2=80=99 defined but not used [-Wunused-cons=
t-variable=3D]
>   271 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] =
=3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:163:28: warning: =E2=80=98test_=
edid_hdmi_1080p_rgb_max_100mhz=E2=80=99 defined but not used [-Wunused-cons=
t-variable=3D]
>   163 | static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] =
=3D {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/gpu/drm/tests/drm_kunit_edid.h:57:28: warning: =E2=80=98test_e=
did_dvi_1080p=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>    57 | static const unsigned char test_edid_dvi_1080p[] =3D {
>       |                            ^~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_br=
idge_test.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> make[6]: *** [../scripts/Makefile.build:544: drivers/gpu/drm/tests] Error=
 2
> make[6]: *** Waiting for unfinished jobs....
> make[5]: *** [../scripts/Makefile.build:544: drivers/gpu/drm] Error 2
> make[4]: *** [../scripts/Makefile.build:544: drivers/gpu] Error 2
> make[3]: *** [../scripts/Makefile.build:544: drivers] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [/kernel/Makefile:2054: .] Error 2
> make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>=20
> [13:57:52] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> [13:57:54] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=3Dum O=3D.kunit --jobs=
=3D48
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
>=20
>=20
>=20

Naturally, the last one-day rebase is what shoots me in the foot. Ugh.



