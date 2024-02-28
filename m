Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC03DC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 17:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0D10E33C;
	Wed, 28 Feb 2024 17:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="Az2kxa1p";
	dkim-atps=neutral
X-Greylist: delayed 2088 seconds by postgrey-1.36 at gabe;
 Wed, 28 Feb 2024 17:40:44 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA1E10E33C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=mBC3pgi3Jdc2YKejyvmMgNdf8EHNn5L2lgfo9Ko6DEA=; 
 t=1709142044; x=1710351644; b=Az2kxa1ptWXikOfpmf7zs3DcR1UvVWsxMyi2gB85QSWA9P5
 nVJaTKp37+ZA9ize4nvvDmn6+w3iKGViKUicUyLfe2/rUChVmgYmLISQgezol97AI0WLik4HgzSK1
 N0yVORuK+ERZMb9YLrr+q6iLBGIISP5Pw9alTWudazYvRA35no6LBRWA23JPYCko1D+3SmmhF2vbJ
 c+/InqLF7ZdsRQCcoAef2bWF3K81RVmsvdzj1Obd9ucyR6q8Xdj0qVNmxXJNXS4lue7irb+39Haaq
 01RQEoMLxP39mr+8feD3fTRVz9K9M6bRq/0qxllNlrfYJtGMg7wqfIuLEOQWhasQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rfNNQ-0000000CIq1-2nGv; Wed, 28 Feb 2024 18:05:52 +0100
Message-ID: <84e4f0d70c5552dd7fa350c61c28de9637628ee6.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/4] devcoredump: Add dev_coredumpm_timeout()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mukesh Ojha
 <quic_mojha@quicinc.com>,  Jonathan Cavitt <jonathan.cavitt@intel.com>
Date: Wed, 28 Feb 2024 18:05:51 +0100
In-Reply-To: <20240228165709.82089-2-jose.souza@intel.com>
References: <20240228165709.82089-1-jose.souza@intel.com>
 <20240228165709.82089-2-jose.souza@intel.com>
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

> Current 5-minute timeout may be too short for users to search and
> understand what needs to be done to capture coredump to report bugs.

Conceptually, I'm not sure I understand this. Users should probably have
a script to capture coredumps to a file in the filesystem, possibly with
additional data such as 'dmesg' at the time of the dump.

Having this stick around longer in core kernel memory (not even
swappable) seems like a bad idea?

What kind of timeout were you thinking? Maybe you'd want 10 minutes? An
hour?

Also, then, why should the timeout be device-specific? If the user is
going to need time to find stuff, then surely that applies regardless of
the device?

So ... I guess I don't really like this, and don't really see how it
makes sense. Arguably, 5 minutes even is too long, not too short,
because you should have scripting that captures it, writes it to disk,
and all that can happen in the space of seconds, rather than minutes.
It's trivial to write such a script with a udev trigger or similar.

If we wanted to, we could even have a script that not only captures it
to disk, but also deletes it again from disk after a day or something,
so if you didn't care you don't get things accumulating. But I don't see
why the kernel should need to hang on to all the (possibly big) core
dump in RAM, for whatever time. And I also don't like the device-
dependency very much, TBH.



But if we do go there eventually:

> +void dev_coredumpm(struct device *dev, struct module *owner,
> +		   void *data, size_t datalen, gfp_t gfp,
> +		   ssize_t (*read)(char *buffer, loff_t offset, size_t count,
> +				   void *data, size_t datalen),
> +		   void (*free)(void *data))
> +{
> +	dev_coredumpm_timeout(dev, owner, data, datalen, gfp, read, free,
> +			      DEVCD_TIMEOUT);
> +}
>  EXPORT_SYMBOL_GPL(dev_coredumpm);

This could be a trivial static inline now, if you just put DEVCD_TIMEOUT
into the header file. Seems better than exporting another whole function
for it. Then you also don't need the no-op version of it.

johannes

