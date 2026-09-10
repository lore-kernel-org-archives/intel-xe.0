Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD67FC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A52310F46B;
	Thu, 10 Sep 2026 11:43:26 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E097A10F466;
 Thu, 10 Sep 2026 11:43:24 +0000 (UTC)
Received: from [62.183.198.118] (helo=[10.147.29.250])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1x4dBR-00000003Pod-1ruK; Thu, 10 Sep 2026 14:43:22 +0300
Message-ID: <2d0dcfbd1b072cf3faf7ec23f1a8b959ba7d4502.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 14:43:11 +0300
In-Reply-To: <aqFAwUzmDE00rpie@ideak-desk.lan>
References: <20260908100659.113555-1-luciano.coelho@intel.com>
 <aqFAwUzmDE00rpie@ideak-desk.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915/display: check configuration index before
 shifting
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

On Wed, 2026-09-09 at 14:19 +0300, Imre Deak wrote:
> On Tue, Sep 08, 2026 at 01:06:51PM +0300, Luca Coelho wrote:
> > The calc_allowed_config_filter() function passes the return value of
> > iter_pos_to_idx() directly to BIT(), but the helper can return -1 for
> > an invalid iterator.
> >=20
> > The iterator already rejects negative indices before doing a
> > configuration, so this should not matter in normal flows.  In any
> > case, for robustness, check the index explicitly and warn if it is
> > negative, avoiding an undefined shift.
> >=20
> > Fixes: 39e30bdf2f92 ("drm/i915/dp_link_caps: Add link configuration ite=
rator")
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>=20
> Reviewed-by: Imre Deak <imre.deak@intel.com>

Thanks! This is now merged to drm-intel-next.

--
Cheers,
Luca.
>=20
