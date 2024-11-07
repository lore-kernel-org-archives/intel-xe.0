Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763F3D44D78
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 10:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397A310E7FD;
	Thu,  7 Nov 2024 10:51:55 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3996210E7FD;
 Thu,  7 Nov 2024 10:51:54 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t907E-00000001WOx-36Wf; Thu, 07 Nov 2024 12:51:52 +0200
Message-ID: <d1ac67295027c64ac9269ca7942085117ff6e893.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Thu, 07 Nov 2024 12:51:51 +0200
In-Reply-To: <20241106215231.103474-18-gustavo.sousa@intel.com>
References: <20241106215231.103474-1-gustavo.sousa@intel.com>
 <20241106215231.103474-18-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 17/17] drm/i915/xe3lpd: Use DMC wakelock by default
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
> Although Bspec doesn't explicitly mentions that, as of Xe3_LPD, using
> DMC wakelock is the officially recommended way of accessing registers
> that would be off during DC5/DC6 and the legacy method (where the DMC
> intercepts MMIO to wake up the hardware) is to be avoided.
>=20
> As such, update the driver to use the DMC wakelock by default starting
> with Xe3_LPD. Since the feature is somewhat new to the driver, also
> allow disabling it via a module parameter for debugging purposes.
>=20
> For that, make the existing parameter allow values -1 (per-chip
> default), 0 (disabled) and 1 (enabled), similarly to what is done for
> other parameters.
>=20
> v2:
>   - Describe -1 in the same area where 0 and 1 are described. (Luca)
>=20
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>=20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
