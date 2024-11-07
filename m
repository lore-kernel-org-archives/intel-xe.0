Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F2D44D56
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 10:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2D510E801;
	Thu,  7 Nov 2024 10:49:45 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4332C10E0F3;
 Thu,  7 Nov 2024 10:49:44 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t9058-00000001WNl-3Zkl; Thu, 07 Nov 2024 12:49:42 +0200
Message-ID: <b9c019e9ae78044df3b96a89e97c210f585d0ccb.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Thu, 07 Nov 2024 12:49:41 +0200
In-Reply-To: <20241106215231.103474-14-gustavo.sousa@intel.com>
References: <20241106215231.103474-1-gustavo.sousa@intel.com>
 <20241106215231.103474-14-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 13/17] drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
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

On Wed, 2024-11-06 at 18:50 -0300, Gustavo Sousa wrote:
> A HAS_DMC_WAKELOCK() macro gives more semantic than openly checking the
> display version. Define it and use it where appropriate.
>=20
> v2:
>   - Make this patch contain only the non-functional refactor. Functional
>     changes related to including HAS_DMC() in the macro are done in
>     upcoming changes. (Jani)
>=20
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>=20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
