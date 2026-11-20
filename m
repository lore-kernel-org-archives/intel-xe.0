Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E3606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJyCFq/y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC20C10E160;
	Fri, 20 Nov 2026 15:38:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8B110E160
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 15:38:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C88B6004E;
 Fri, 20 Nov 2026 15:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F51F000C6;
 Fri, 20 Nov 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795189093;
 bh=2FgtRMXzeRZftqIe7eoC1QyDZ55VuPWTNh+tbGDFUdg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hJyCFq/ycz7zFqSzmQEhI81/RlEXWL6EDsWOSBjnBWt79EJyu8CtwCF52AVIqNqbn
 4SUreLtyOjKMq6nAMzH4CypseWxujd0qEm6sY4vU0S4hbpbgaUAR8c8YZ+EJp+S53T
 QoC4/RwI2uW2Zef2CCP7sT0OSP/V1kxkEOUT9i/WXdHqfnJujrw0RweN3JYW+1WAQi
 kB8kQLZWJu2b3degmfTOtgk7LJPv610ay9duGDUKrCNYa0P7C9sqkFJRr0PVc0Abp+
 Gu1lxGHE7mNx6q5iwKoJnBjogZR5YWsD7yFyVNn9KI0vwlGt4WPRDE/1dDgdfzKEod
 qdGrQunj5PKmw==
Message-ID: <sashiko-outbox-225473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/hwmon: Unregister hwmon before the device is
 unplugged
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
References: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:38:13 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/hwmon: missing Fixes trailer for devm hwmon unplug race
  fix
--

commit 665f57d7a31cd2bcb2429c94c413e7551d488e30
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>

> drm/xe/hwmon: Unregister hwmon before the device is unplugged
>
> hwmon was registered with devm, so its sysfs attributes stayed
> reachable after drm_dev_unplug() until devres teardown. A reader in
> that window accesses an unplugged device, e.g. the PMT energy read
> on BMG.
>
> Unregister it explicitly in xe_device_remove() and in the probe error
> path, before the device is unplugged. Removing the attributes waits
> for in-flight reads, so none can run afterwards.
>
> Cc: Karthik Poosa <karthik.poosa@intel.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

[Severity: Low]
This fixes a device unplug race where hwmon attributes stay reachable
after drm_dev_unplug().  Should it include a Fixes tag for the commit
that introduced devm_hwmon_device_register_with_info() in
xe_hwmon_register()?

  Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120152753.1346=
010-2-rodrigo.vivi@intel.com?part=3D1
