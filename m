Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043B5CEACDE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 15:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DAC10E640;
	Tue,  1 Oct 2024 15:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rVlMUl92";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1833A10E508;
 Mon, 30 Sep 2024 14:07:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 170CD5C0715;
 Mon, 30 Sep 2024 14:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA62C4CEC7;
 Mon, 30 Sep 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727705254;
 bh=45WJzA0P/g2EdVJ2lnXjZDehqloa9YYnfFhlgML4fYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rVlMUl92cKgL/A5KRJNQWMJfzuT0V8dEFGNpvqtK9rsRU3+NWDuNBMP/s0neWbREW
 gkwkvVIKVcIRQYGdNPfo1vqcegdGNnO6KQBQMS1dGo5pDc5ZjLIAMxAJxG1TcA391o
 NXLTSa41bL67YhStjFRIflOR4n+Euy86RX+GFGTU=
Date: Mon, 30 Sep 2024 10:07:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
Message-ID: <20240930-sapphire-swift-of-reverence-168e2b@lemur>
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
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

On Mon, Sep 30, 2024 at 03:30:07PM GMT, Daniel Gomez wrote:
> Hi,
> 
> I sent this patch [1] using B4 web endpoint and then I received a
> response email to the wrong address: To: "Daniel Gomez via B4 Relay"
> <devnull+da.gomez.samsung.com@kernel.org> instead of To: "Daniel Gomez"
> <da.gomez@samsung.com>.

Was it an automated tool that sent you that message? Normally, email clients
would honour the "Reply-To" field and not use the From: address put in by the
relay.

-K
