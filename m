Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2960EEB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 19:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E167D10E0CF;
	Tue, 20 Jun 2023 19:14:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A543310E5D9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 10:45:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79D6661569;
 Fri, 16 Jun 2023 10:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313F3C433C8;
 Fri, 16 Jun 2023 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686912347;
 bh=/NH92olQrrHDSXMB/AgQnH02IsLg/W8rXsI2Fg+oyVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZeB5qveZjfZH3hgzFNw4ewD/E4xe69u6V4EdlA3tYjo9wsAUSJdsewxNZL6d2D9T
 vGo1v/wsCPET7J+vG/SirQWxPahjilFncK6Lri7OWWP0wDbIfqSAEAn9Oc39UN1Q/l
 SpH5Rd5mz7ocvai36f4L+WIoDeh65zZAPSUD+Lovepo8mCxXR8UNVjQAHliEFMo+2N
 E94v10NX900s/kKfoD/ASuCBt3SQHIhl43yzufDMYZAIPOJuV77Oq3dg9DK4nTUQy7
 NVNovj5CPgonBvocDIZfLUi3bSef2EKVR4SAwr7/AfkvL3v0be+c33NTA+L/ijmRNP
 UpTWwrzgl2qdw==
Date: Fri, 16 Jun 2023 12:45:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230616104544.4f7ia7otr5t2oa3d@intel.intel>
References: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
 <ZIwaG2tlLQIpposb@ashyti-mobl2.lan>
 <20230616102406.klskmif6thctfgxd@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616102406.klskmif6thctfgxd@zkempczy-mobl2>
X-Mailman-Approved-At: Tue, 20 Jun 2023 19:14:16 +0000
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Use nanoseconds instead of
 jiffies in uapi for user fence
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Zbyszek,

On Fri, Jun 16, 2023 at 12:24:06PM +0200, Zbigniew Kempczyński wrote:
> On Fri, Jun 16, 2023 at 10:15:23AM +0200, Andi Shyti wrote:
> > Hi Zbyszek,
> > 
> > On Fri, Jun 16, 2023 at 07:37:27AM +0200, Zbigniew Kempczyński wrote:
> > > Using jiffies as a timeout from userspace is weird even it theoretically
> > > exists possiblity of acquiring jiffies via getconf. Unfortunately this
> > > method is unreliable and returned value may vary from configured in the
> > > kernel config.
> > > 
> > > >From now on timeout is expressed in nanoseconds and its interpretation
> >  ^^^
> > 
> > you have a trailing '>' here, maybe a copy/paste error.
> 
> I've checked in the patch and I don't see this character there. Are you
> sure you haven't inserted it unintentionally during review?

It's not added from my reply as I see it right away.

there must be either a bug in mutt or git-send-email. In my
private mail I don't see the trailing '>', indeed and it's not in
lore either.

Then... nevermind.

Andi
