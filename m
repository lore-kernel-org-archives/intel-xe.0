Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AF3D44D56
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 10:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C71910E7EC;
	Thu,  7 Nov 2024 10:40:54 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D9710E7EC;
 Thu,  7 Nov 2024 10:40:53 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t8zwY-00000001WKX-3kEd; Thu, 07 Nov 2024 12:40:51 +0200
Message-ID: <70b0c12d814edfaac4f4be70a1b3d750ce880bfe.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Thu, 07 Nov 2024 12:40:49 +0200
In-Reply-To: <20241106215231.103474-3-gustavo.sousa@intel.com>
References: <20241106215231.103474-1-gustavo.sousa@intel.com>
 <20241106215231.103474-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 02/17] drm/xe: Mimic i915 behavior for non-sleeping
 MMIO wait
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
> In upcoming display changes, we will modify the DMC wakelock MMIO
> waiting code to choose a non-sleeping variant implementation, because
> the wakelock is also taking in atomic context.
>=20
> While xe provides an explicit parameter (namely "atomic") to prevent
> xe_mmio_wait32() from sleeping, i915 does not and implements that
> behavior when slow_timeout_ms is zero.
>=20
> So, for now, let's mimic what i915 does to allow for display to use
> non-sleeping MMIO wait. In the future, we should come up with a better
> and explicit interface for this behavior in i915, at least while display
> code is not an independent entity with proper interfaces between xe and
> i915.
>=20
> v2:
>   - Make the tone in comment the comment added in
>     __intel_wait_for_register() more explanatory than a FIXME-like text.
>     (Luca)
>=20
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
