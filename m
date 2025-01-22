Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673CAC0218C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 08:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C56B10E68F;
	Wed, 22 Jan 2025 08:24:00 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9A10E68A;
 Wed, 22 Jan 2025 08:23:59 +0000 (UTC)
Received: from 91-155-255-183.elisa-laajakaista.fi ([91.155.255.183]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1taW1j-00000003zW8-3bWd; Wed, 22 Jan 2025 10:23:57 +0200
Message-ID: <1a597663c34b48c93ff7ce264f2c63aa625247fa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 10:23:54 +0200
In-Reply-To: <20250117220747.87927-2-gustavo.sousa@intel.com>
References: <20250117220747.87927-1-gustavo.sousa@intel.com>
 <20250117220747.87927-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] drm/i915/dmc_wl: Pass offset instead of reg to
 range table iterator
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

On Fri, 2025-01-17 at 19:06 -0300, Gustavo Sousa wrote:
> We will add another function that checks the offset in an upcoming
> change. Instead of passing the reg variable to only extract the offset
> later, let's extract the offset before so that we do not need to repeat
> ourselves.
>=20
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
