Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F4ECA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541F810E6AF;
	Tue,  2 Sep 2025 12:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="U+LMqe9i";
	dkim-atps=neutral
X-Greylist: delayed 540 seconds by postgrey-1.36 at gabe;
 Mon, 01 Sep 2025 12:35:10 UTC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EBA10E44D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 12:35:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2EB244E40C64;
 Mon,  1 Sep 2025 12:26:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 044AD60699;
 Mon,  1 Sep 2025 12:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6D601C22DA15; 
 Mon,  1 Sep 2025 14:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1756729567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YCqaE2ySIm63FisMTJw+SXZ6ZQeQnKmc9VEQeBOhYn0=;
 b=U+LMqe9iV+Swgehee0pXcKAhLo0/LDdrz1Ai5aPoKhYqOroiF2TWliFgjrp26Ht9lomvJT
 hwss5BxWG1+miMipU3yEWy9H7QbaMG//0xxedQ5AJbsVzl+Lxz/HYXc4vLx5gbhAgweuGu
 YxFA59FUOIB47sxOqKaQhs05cRqnn8ZH8qA1y2qrpJOGBRGVs4koV42imwxQmIiSBDool3
 0MjNgHxADWyLSpvVQPviodq7pTETuyYX7vfTN28+T4sVOW/t9H9NfBQx8CN/QzjsMBv0lA
 12PzWREHJWSLnv9raIOvD1iErCrWX0urZXxWTolgapgCfFZH5abDQ86SHur1UQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomasw@gmail.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Raag Jadav <raag.jadav@intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <def775b1d7afe43720d2a1778735e764a01cb017.1753950712.git.geert+renesas@glider.be>
References: <def775b1d7afe43720d2a1778735e764a01cb017.1753950712.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
Message-Id: <175672956260.48300.15057365027365895620.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 02 Sep 2025 12:54:08 +0000
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

On Thu, 31 Jul 2025 10:35:14 +0200, Geert Uytterhoeven wrote:
> Intel Discrete Graphics non-volatile memory is only present on Intel
> discrete graphics devices, and its auxiliary device is instantiated by
> the Intel i915 and Xe2 DRM drivers.  Hence add dependencies on DRM_I915
> and DRM_XE, to prevent asking the user about this driver when
> configuring a kernel without Intel graphics support.
> 
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
      commit: f544bf03a771ee746b908e9a08ecb97c65a35055

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

