Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4DBEC8734
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 14:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB1210E7F8;
	Thu,  7 Sep 2023 14:50:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE210E80C;
 Thu,  7 Sep 2023 14:50:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABEE16121E;
 Thu,  7 Sep 2023 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB4CC36AF1;
 Thu,  7 Sep 2023 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694098239;
 bh=+gO7O6tHf+BV9PIKE7c/h7YCFsv3vVrvtAyihjc2yNA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=c9FmK49Q20pe55+Zb+EyNBOOge1ZRdMtE+UZj5GKYjA5phs1JzDOamw0Ac00GTb1T
 QkOeqd3TaSQ8tzl71GBnIQK2Fy1M8hTxzQ8wrrGr9F6NL0Yraybq8LMBn8bU9Op+Ik
 mdo6GrXbpcklesT7ZhSMzegeRn64/Wk4JARtFNkxJtn++wq1hKqBmWUaE9pxyN/W2/
 DaLTT2r3UlWi9Ux7VKuFpo1MeB0GifymRATRpoRspvzk+tzQXr/5UKfqEoj40qbuNu
 DOoqxw/BtshCVn21OJzC/2+DytDMUY6KzelYqOLwQFZuIpovZ7wmzMTftIWwtb+meA
 3grjwpB8jbXew==
Message-ID: <8708c8beff5669e772a8d2e0dd76c9e3.mripard@kernel.org>
Date: Thu, 07 Sep 2023 14:50:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230907135339.7971-2-thomas.hellstrom@linux.intel.com>
References: <20230907135339.7971-2-thomas.hellstrom@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/tests: helpers: Avoid a driver uaf
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 7 Sep 2023 15:53:38 +0200, Thomas Hellstr=C3=B6m wrote:
> when using __drm_kunit_helper_alloc_drm_device() the driver may be
> dereferenced by device-managed resources up until the device is
> freed, which is typically later than the kunit-managed resource code
> frees it. Fix this by simply make the driver device-managed as well.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
