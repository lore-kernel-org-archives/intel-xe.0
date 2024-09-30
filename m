Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77997CEACDD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 15:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809DE10E0B7;
	Tue,  1 Oct 2024 15:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="naILaSEh";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036810E4FB;
 Mon, 30 Sep 2024 14:20:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4F772A425C7;
 Mon, 30 Sep 2024 14:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD3BC4CEC7;
 Mon, 30 Sep 2024 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727706058;
 bh=1eRBRJrzOiuIVTVGRLAO8jbOWOlpEY4/q5p7G1s7jCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=naILaSEhwqimNgUULIFTqSlwxMUbgmh8C2eC73P2q65wypavM5LFHzjS54Dk2AIGy
 XRAm382kcAq7sXbjLKdoiAbgWueaiQV5eTbTEX8TOfywWXdDa1oTcNbxiZnDz4/9le
 1mBhLOwyv/Ba3XA13I3vqRQQfHu/UBcjhOzTPQ+4=
Date: Mon, 30 Sep 2024 10:20:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930-rustling-auburn-jaguar-23d200@lemur>
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
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

On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
> > Was it an automated tool that sent you that message? Normally, email clients
> > would honour the "Reply-To" field and not use the From: address put in by the
> > relay.
> 
> It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
> Patchwork <patchwork@emeril.freedesktop.org>".
> 
> [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
> 
> I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
> using the From field.
> 
> 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
> 	Reply-To: da.gomez@samsung.com

It's no big deal as long as you got the email response in the end. We expect
this to happen with a lot of automation, which is why any replies to the relay
address are auto-discarded.

-K
