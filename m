Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C39AF5A8C5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 21:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9C10EB5F;
	Mon, 20 Apr 2026 21:04:18 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080810EB5F;
 Mon, 20 Apr 2026 21:04:17 +0000 (UTC)
Received: from 88-113-64-214.elisa-laajakaista.fi ([88.113.64.214]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wEvmv-00000004RSv-32bY; Tue, 21 Apr 2026 00:04:14 +0300
Message-ID: <554c2074af0cbd9def802aa366847450bc84dca7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 jani.nikula@linux.intel.com
Date: Tue, 21 Apr 2026 00:04:12 +0300
In-Reply-To: <aeaT07EcZ8jXeR41@intel.com>
References: <20260420204715.3906215-1-luciano.coelho@intel.com>
 <aeaT07EcZ8jXeR41@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915: remove unused DPLL_TEST register definitions
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

On Tue, 2026-04-21 at 00:00 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Mon, Apr 20, 2026 at 11:46:47PM +0300, Luca Coelho wrote:
> > Remove the old DPLL_TEST register definitions from i915_reg.h.
> >=20
> > They are no longer used anywhere in the driver.
>=20
> Reading register definitions is easier than reading the spec.
> So unless they are incorrect I don't want to remove the
> register definitions for anything.

Fair enough.  Patch dropped. :)

--
Cheers,
Luca.
