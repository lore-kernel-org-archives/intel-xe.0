Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C777EC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 15:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62210E895;
	Wed, 12 Jun 2024 15:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P7r/Zs9H";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575110E895
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 15:10:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE9D0614BD;
 Wed, 12 Jun 2024 15:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFB9C116B1;
 Wed, 12 Jun 2024 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1718205005;
 bh=ZuEtNZwwOHtkdd1OwgkAj9rzmJGCtDmVV3FUpnzB+QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P7r/Zs9HIew4lkEhYW3pw+95q83DX4q0OmpjzxrgLFwyKblFd3mnD3y5TVEILW2Yc
 2HuukgnaTOBLnFu6Of+pE7zBQcB03dcii9IWgRiWEz+67YFKmV6plqDmc4uWNAtzwj
 ZVw9Ffl2Y65cNuk5v6fToWCMr4JOojnRCWb2Bj0E=
Date: Wed, 12 Jun 2024 17:10:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v6 1/2] devcoredump: Add dev_coredumpm_timeout()
Message-ID: <2024061248-scanning-backlight-da0f@gregkh>
References: <20240611174716.72660-1-jose.souza@intel.com>
 <49c2fbdc91d128c5249d50d016d97c8e5162f7b7.camel@sipsolutions.net>
 <Zmm2jC2nx6gZ2WOn@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zmm2jC2nx6gZ2WOn@intel.com>
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

On Wed, Jun 12, 2024 at 10:54:04AM -0400, Rodrigo Vivi wrote:
> On Wed, Jun 12, 2024 at 02:02:37PM +0200, Johannes Berg wrote:
> > On Tue, 2024-06-11 at 10:47 -0700, José Roberto de Souza wrote:
> > > Add function to set a custom coredump timeout.
> > > 
> > > For Xe driver usage, current 5 minutes timeout may be too short for
> > > users to search and understand what needs to be done to capture
> > > coredump to report bugs.
> > > 
> > > We have plans to automate(distribute a udev script) it but at the end
> > > will be up to distros and users to pack it so having a option to
> > > increase the timeout is a safer option.
> > > 
> > > v2:
> > > - replace dev_coredump_timeout_set() by dev_coredumpm_timeout() (Mukesh)
> > > 
> > > v3:
> > > - make dev_coredumpm() static inline (Johannes)
> > > 
> > > v5:
> > > - rename DEVCOREDUMP_TIMEOUT -> DEVCD_TIMEOUT to avoid redefinition
> > > in include/net/bluetooth/coredump.h
> > > 
> > > v6:
> > > - fix definition of dev_coredumpm_timeout() when CONFIG_DEV_COREDUMP
> > > is disabled
> > 
> > Got to v6, heh.
> > 
> > I still don't think this is _right_, but I guess I'm OK with giving you
> > rope to hang yourself ;-)
> 
> I do see your point. But with the udev in place, 5 min or 1 hour it shouldn't
> matter right? But for users without the udev script then a long time is better
> to react and learn how to capture the very first GPU hang information.
> 
> > 
> > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> 
> Thank you
> 
> > 
> > Seems like you really should've CC'ed Greg though since these things
> > usually went through his tree, so if you want to take them through yours
> > he really should be at least aware ...
> 
> Indeed
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Greg, ack on getting it through drm?

Fine with me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
