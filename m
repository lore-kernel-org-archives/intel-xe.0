Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD0C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 08:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0140C112369;
	Thu, 28 Mar 2024 08:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="fuyKiJoX";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA5F112369
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=TYFqbUHOJ3/hT9xWTRUIGd5P6PahnEHSypeL9bbT9Fk=; 
 t=1711615606; x=1712825206; b=fuyKiJoXnIDH5PIk/6Bgfi/Bj5XyrH8Bs5UF9b2u9u9+ONk
 nbxW1WgxH/uYm2q4xIhcrhk2gsGaUvALah5fumvIwWbHdAH/9Y/MJDwFr1rP6JLbG2poBKLu9I4pO
 RfDRmS9IwMQwFKOZn7mMRdx7RxQOmuc99ONAJtH+uAju3MblfQITnU5XkVPRok//c1ubGgtkzBd2W
 nS/dNDYxRumMM4luzpT4qjMdH5rGVkOjn8bKBpnyUc5EeLowtzQuhvBU0lU8m9MoACX55vbacV7Zo
 3v9gpZG/tnijV9g7ead4LiQEQV5zMSTIHFw9y4jf5uqJSkVz6XGsPDfAD1GKuG1w==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rplPC-00000000nLU-0aP3; Thu, 28 Mar 2024 09:46:38 +0100
Message-ID: <9577110df4512a82dd27af0f831b569b502fe528.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/9] um: Minor fixes and cleanups
From: Johannes Berg <johannes@sipsolutions.net>
To: Tiwei Bie <tiwei.btw@antgroup.com>, richard@nod.at, 
 anton.ivanov@cambridgegreys.com
Cc: jani.nikula@intel.com, linux-um@lists.infradead.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 09:46:36 +0100
In-Reply-To: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
References: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
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

On Wed, 2024-03-06 at 18:19 +0800, Tiwei Bie wrote:
> A series of minor fixes and cleanups for UML.
>=20
> Most changes in this series are very straightforward. Please consider
> picking this series for v6.9.
>=20
> There are still some remaining -Wmissing-prototypes warnings. I plan to
> send a followup RFC series first to fix those warnings.
>=20
> Feedbacks on this series would be appreciated. Thanks!

LGTM, thanks.

For the series, including 8 and 9 that were discussed before
(but Richard, feel free not to add that individually):

Reviewed-by: Johannes Berg <johannes@sipsolutions.net>

I also did build-testing for this, on 64-bit only though right now.

johannes
