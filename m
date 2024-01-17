Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1BC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 09:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE71510E699;
	Wed, 17 Jan 2024 09:47:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44110E695;
 Wed, 17 Jan 2024 09:47:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B8B761591;
 Wed, 17 Jan 2024 09:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC31AC433C7;
 Wed, 17 Jan 2024 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705484823;
 bh=+W1QtavGg43I25Qlt8kktX9sjC8kTiEwRJDpeusCOuI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tuBDT7USVMJgL8Xa7Tv6d0XoAkJsWYWSsdCooC5XhNIDnwP13fjPBHxDbqUNQhxq+
 ZqzjOpl+QbgxyBxmlewJbqOU87S9hrz7Nc3A8PmYs8KYIRF3tX9rJ2OoNKNQGR2fM6
 n+SVYh4HQ2RVzXvQSdmoZRBwaJnINPqtDQ8SgNgDSy5AMLwQipd4izUhY786kCGJ9U
 NHutOYBogx742ky4pvDRCf/CWWkXw2ENLKf8jvZBAvGIZTfOL3EnWfV6T769vdpvC4
 hBASxjLOoHfrm1NBhuRfcViGEbstJpNn+L6zbFca9uPV7PE4J2LJqkf0ze7JJljARf
 5GuQ2lasJAHzA==
From: Maxime Ripard <mripard@kernel.org>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
In-Reply-To: <20240115171351.504264-2-michal.winiarski@intel.com>
References: <20240115171351.504264-1-michal.winiarski@intel.com>
 <20240115171351.504264-2-michal.winiarski@intel.com>
Subject: Re: (subset) [PATCH v5 1/5] drm/managed: Add drmm_release_action
Message-Id: <170548482051.96553.15600235735895208775.b4-ty@kernel.org>
Date: Wed, 17 Jan 2024 10:47:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 15 Jan 2024 18:13:47 +0100, Michał Winiarski wrote:
> Similar to devres equivalent, it allows to call the "release" action
> directly and remove the resource from the managed resources list.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

