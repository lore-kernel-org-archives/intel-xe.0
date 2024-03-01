Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA68AC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 08:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491D310EC0A;
	Fri,  1 Mar 2024 08:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="nlwr3IzI";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11AC10EC0A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=vuG8csCkwvbPWQAQ1iQPW5EjQIodYKZO0NB6u/TNuN8=; 
 t=1709282324; x=1710491924; b=nlwr3IzIRgVOaJqyMoqFJA7tTkusSGDSi1rQQcK5onRGKYL
 oAkN0vtq6ekFkyUwIeHh8FW7JY6sH4E8McidekjqGaDBgDWJ8n3/TwrrJKKU9lYDYpvsW+CJ4mkr4
 jnx7gjcKvQokRN7R1OOEjTkGIiirMCwpDudeZ1LdGVc7Fi86E1u09U23mlzoL6aWHL6MZ+1fswBJ/
 MvHF30eUf1UJaO/n/iVh3TSh6UBdJFXqn36rszOqmwk+Q9e7yC/BEJZLCLtB+R5vm1jeZs8HC9ktH
 iO1/qGDSpQ6bLbXbZ4ahL0glFYdy3wnDhabzEb4jKgh/fNS0M+oUlFc+Ac9N99Ow==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rfyPh-0000000EqAR-03E2; Fri, 01 Mar 2024 09:38:41 +0100
Message-ID: <0f4244ea6866f451f3f8a5b5e2db8be53de1f0c2.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/4] devcoredump: Add dev_coredumpm_timeout()
From: Johannes Berg <johannes@sipsolutions.net>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "quic_mojha@quicinc.com"
 <quic_mojha@quicinc.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Date: Fri, 01 Mar 2024 09:38:39 +0100
In-Reply-To: <a27ac0d3bc52c2181852a25641b7020f50a50648.camel@intel.com>
References: <20240228165709.82089-1-jose.souza@intel.com>
 <20240228165709.82089-2-jose.souza@intel.com>
 <84e4f0d70c5552dd7fa350c61c28de9637628ee6.camel@sipsolutions.net>
 <a27ac0d3bc52c2181852a25641b7020f50a50648.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Wed, 2024-02-28 at 17:56 +0000, Souza, Jose wrote:
>=20
> In my opinion, the timeout should depend on the type of device driver.
>=20
> In the case of server-class Ethernet cards, where corporate users automat=
e most tasks, five minutes might even be considered excessive.
>=20
> For our case, GPUs, users might experience minor glitches and only search=
 for what happened after finishing their current task (writing an email,
> ending a gaming match, watching a YouTube video, etc.).
> If they land on https://drm.pages.freedesktop.org/intel-docs/how-to-file-=
i915-bugs.html or the future Xe version of that page, following the
> instructions alone may take inexperienced Linux users more than five minu=
tes.

That's all not wrong, but I don't see why you wouldn't automate this
even on end user machines? I feel you're boxing the problem in by
wanting to solve it entirely in the kernel?

> I have set the timeout to one hour in the Xe driver, but this could incre=
ase if we start receiving user complaints.

At an hour now, people will probably start arguing that "indefinitely"
is about right? But at that point you're probably back to persisting
them on disk anyway? Or maybe glitches happen during logout/shutdown ...

Anyway, I don't want to block this because I just don't care enough
about how you do things, but I think the kernel is the wrong place to
solve this problem... The intent here was to give some userspace time to
grab it (and yes for that 5 minutes is already way too long), not the
users. That's also part of the reason we only hold on to a single
instance, since I didn't want it to keep consuming more and more memory
for it if happens repeatedly.

johannes
