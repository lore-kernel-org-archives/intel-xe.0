Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62653C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8BD10E9D8;
	Mon, 25 Mar 2024 17:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="LWP6CqRx";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DAC10E9E3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=OmH/+e2Fjmgqpw97wDc7uUt4UReDSV3J7Dkv6kUBSXM=; 
 t=1711386036; x=1712595636; b=LWP6CqRxYjkBGTccmytnk3d+zSF7KU+mbf6Vx9i6ZLgP6vi
 Eee2E194q4TZTvfxsbWyjCRIKijILA1knt5Q9aKfJm1BQZ0+e5X0T7YxBjB/OI7AoIidtIcLzxLEZ
 C7CZbGeXSmaL4QNV7NaQRzGEV95nEr4qdXFDtvK2+0Ccz5ZCR6mtnMR0CdlZCC3b/s4LC5OcKY1dK
 ZrAS56f/8xNZJTnNforiGPuDQaM3VzecTpg1pwypxpJmFZ6bOeg6kBw6WSTIlmfrdFyVVICmERLxM
 4ryD1XTxIOlaQJ4S3ELbusJ7KvfBdrqWR7wvUNy8YnXVwo7aKpsZ5j7yNvMmpTPQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rongX-0000000Dy0B-3sYf; Mon, 25 Mar 2024 18:00:34 +0100
Message-ID: <50c40ce746f1497cbc36ad82d6d0d3ca3ac28547.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/4] devcoredump: Add dev_coredumpm_timeout()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mukesh Ojha
 <quic_mojha@quicinc.com>,  Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 25 Mar 2024 18:00:32 +0100
In-Reply-To: <20240304143905.52740-2-jose.souza@intel.com>
References: <20240304143905.52740-1-jose.souza@intel.com>
 <20240304143905.52740-2-jose.souza@intel.com>
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

On Mon, 2024-03-04 at 06:39 -0800, Jos=C3=A9 Roberto de Souza wrote:
> Add function to set a custom coredump timeout.
>=20
> Current 5-minute timeout may be too short for users to search and
> understand what needs to be done to capture coredump to report bugs.

> + */
> +static inline void dev_coredumpm(struct device *dev, struct module *owne=
r,
> +				 void *data, size_t datalen, gfp_t gfp,
> +				 ssize_t (*read)(char *buffer, loff_t offset, size_t count,
> +						 void *data, size_t datalen),
> +				void (*free)(void *data))

nit: looks like you missed a space on the 'free' line

I don't think we'll actually _solve_ the discussion of whether or not
this makes sense.

I still think it's a bad idea to hang on to the dumps in core kernel
memory since they can be big (I would've said ath12k is big with 55MB,
but Rodrigo said graphics could be up to 2GB!), without being able to
page it out, etc. That's just a waste of memory, for what I don't think
is even a good reason.

So dunno.

However, I also don't like to exercise any power that I might randomly
hold just because I happened to write the code in the first place... And
if you want to shoot yourselves in the foot with any of this, should I
really disagree? I feel I've voiced my objections enough, and Lucas has
also tried to find ways of making a userspace implementation work for
you.

I'd perhaps argue that the documentation for the functions should be
more opinionated and actually recommend against using a large timeout
(like you want) for all these reasons, but other than that, the code
looks fine to me.

johannes
