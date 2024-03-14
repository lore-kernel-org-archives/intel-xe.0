Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29077C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 00:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78FF10E3CE;
	Thu, 14 Mar 2024 00:14:11 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1733310E3CE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 00:14:10 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rkYjV-00000002O6U-2u3l; Thu, 14 Mar 2024 02:14:07 +0200
Message-ID: <f882bd2c7f54b6ec395b235924b9c204021353fa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Date: Thu, 14 Mar 2024 02:13:54 +0200
In-Reply-To: <170844763454.44184.7132459305280750890@gjsousa-mobl2>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-7-luciano.coelho@intel.com>
 <170844763454.44184.7132459305280750890@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] drm/i915/display: call DMC wakelock enable when DMC
 is loaded
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

On Tue, 2024-02-20 at 13:47 -0300, Gustavo Sousa wrote:
> Quoting Luca Coelho (2024-02-07 07:30:07-03:00)
> > Although the documentation says that this should be done in the first
> > modeset, it makes more sense to enable and disable it when DMC is
> > enabled and disabled, including during suspend and resume operations.
>=20
> I remember suggesting the pairing wakelock enable/disable with DMC
> enable/disable in the RFC. However, after some thought and re-reading
> the spec, I actually believe that this should actually be part of the
> transition to and out of DC-off power state. Thoughts?

Right, this makes more sense and is more aligned with the
documentation.  I've made the needed changes in this patch, so it will
be sent out with a completely different subject and content.

Thanks for all the reviews! New version of this patchset coming out
soon.

--
Cheers,
Luca.
