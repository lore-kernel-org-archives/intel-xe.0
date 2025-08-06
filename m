Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A004C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 08:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9C10E739;
	Wed,  6 Aug 2025 08:27:14 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5F310E732;
 Wed,  6 Aug 2025 08:27:13 +0000 (UTC)
Received: from 91-155-254-205.elisa-laajakaista.fi ([91.155.254.205]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1ujZUM-00000009VFQ-1jQJ; Wed, 06 Aug 2025 11:27:11 +0300
Message-ID: <56e1e10a01e0dc662a8b27b8df33906a589b4835.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 11:27:09 +0300
In-Reply-To: <06cc4d1c506e3a5b1cc50e01c4bd1135bbf0f7bd.1753953530.git.jani.nikula@intel.com>
References: <cover.1753953530.git.jani.nikula@intel.com>
 <06cc4d1c506e3a5b1cc50e01c4bd1135bbf0f7bd.1753953530.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/i915/display: make struct
 __intel_global_objs_state opaque
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

On Thu, 2025-07-31 at 12:19 +0300, Jani Nikula wrote:
> With struct __intel_global_objs_state only being accessed in
> intel_global_state.c, we can make it opaque. The double underscore to
> indicate internal becomes redundant, drop it.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
