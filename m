Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E175FCEACDD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 15:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A5110E0B7;
	Tue,  1 Oct 2024 15:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R37E5Pyn";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FF910E32A;
 Tue,  1 Oct 2024 13:26:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 519D0A43662;
 Tue,  1 Oct 2024 13:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFB5C4CEC6;
 Tue,  1 Oct 2024 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727789177;
 bh=MgusM4RYsFRdrt0s31zuvz4JXR4CcVxc5ztsAPE1+Fs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R37E5Pynm/m8Fbxe5013oDsTiMaIH7ZoMDGM8ILDAkdASqwpXpPyjQX2+ZSnuaBK1
 +mkzQbRa3G0XORcYS9NCvevXt6dnUvtH5FfovLpahMILiw3nbPCmxNkXBAmWhijKoU
 dpGdB2wXsK0Jxxkt1G3NRKD+TP0iB3RK5Z4SYd9c=
Date: Tue, 1 Oct 2024 09:26:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, 
 I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
Message-ID: <20241001-stalwart-mackerel-of-atheism-5eeef2@lemur>
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
 <87h69xw68b.fsf@intel.com>
 <20240930211519.tquvjw7davr7zlfz@AALNPWDAGOMEZ1.aal.scsc.local>
 <875xqcw7ob.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xqcw7ob.fsf@intel.com>
X-Mailman-Approved-At: Tue, 01 Oct 2024 15:32:45 +0000
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

On Tue, Oct 01, 2024 at 11:26:12AM GMT, Jani Nikula wrote:
> - In all cases, the "From:" field SHOULD NOT contain any mailbox that
>   does not belong to the author(s) of the message. [1]

Well, the author of the message is not the original sender, but the relay
service -- so this is still true.

> I assume b4 is not using your address in From: because it's very likely
> to get the email classified as spam due to From: spoofing. Worse, it
> might get kernel.org on spam sender lists.

It's not just spam classification -- this is literally the only way to make
DMARC work. We can only send messages from domains we control, so to relay
patches coming from origins that we don't control we necessarily rewrite the
From: address (and put it into the body of the message, as git expects).

-K
