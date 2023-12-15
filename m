Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB3C46CA2
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 10:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784310E9A9;
	Fri, 15 Dec 2023 10:31:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207210E320;
 Fri, 15 Dec 2023 10:31:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD56562521;
 Fri, 15 Dec 2023 10:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F301EC433C8;
 Fri, 15 Dec 2023 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702636310;
 bh=vFbU2tFE37clXv2Xl5gB2YnceDfRmJ14hCYQib0idGw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IGrUXIxJovTU0LyzSnY5KAkgmcpMBYQxuXeISlBsJDNYrp/zEdCE8y0PAQGnzAh2B
 En0ApJAbZdjS35gQZoKuH7UjBW+C9V8hcUyhYvOZBQypuTrN7cUVDqjjKWs8gy5obs
 KIDNzTxVAe0Y3640AUwN9bPr6cDVHWhQg1eQ9iRp1Jw2uiNnJ0aS+0NPL+TOk2xKlX
 SqinmlYo1FLc2ZW8YWIf5m9VBtUlKDSZADH4n5VDYmQ8v9L/1s48PRagAOKy3T1Nbh
 PGRfz/o9QDv0lPInXzk6qhy1JqXpI3Op3ddgnADRRe3ePutHDzuwt3dz1CE4Ua6hNf
 Liogtyiqbqbzg==
Message-ID: <bfbffc035ccc1da6c224aebea128764e@kernel.org>
Date: Fri, 15 Dec 2023 10:31:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?TWljaGHFgiBXaW5pYXJza2k=?= <michal.winiarski@intel.com>
Subject: Re: [PATCH v3 1/3] drm/managed: Add drmm_release_action
In-Reply-To: <20231211220939.215024-2-michal.winiarski@intel.com>
References: <20231211220939.215024-2-michal.winiarski@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Javier
 Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Daniel
 Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 23:09:37 +0100, Micha=C5=82 Winiarski wrote:
> Similar to devres equivalent, it allows to call the "release" action
> directly and remove the resource from the managed resources list.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
