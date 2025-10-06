Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10ACAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 09:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED3F10E274;
	Mon,  6 Oct 2025 09:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VA3uEPwF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E15210E274
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 09:24:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 16656603EF;
 Mon,  6 Oct 2025 09:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654C2C4CEF5;
 Mon,  6 Oct 2025 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759742658;
 bh=HQO3BghtODWv879KhWCgZnbHiA4tn37XW6G/0phmyiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VA3uEPwFkNliMXoB/m6c7pfq6D1t9SI6qJhehWlhberWyJMjEggmJ5zXNZ8KXSgxp
 OsmmLouSqojpfzzBZ67hp+0ZHnJc1wviJnsS0DnFFGXYn+y6jJQLkT/O3cjjyST6Id
 UqH+b7kXINz76cn9gUtVG5MlwzCfNbegJGQX3fdQ=
Date: Mon, 6 Oct 2025 11:24:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] devcoredump: Fix circular locking dependency with
 devcd->mutex.
Message-ID: <2025100655-prankish-parking-9059@gregkh>
References: <20250723142416.1020423-1-dev@lankhorst.se>
 <20251003180052.wpx4d5mqs6tmmber@hu-mojha-hyd.qualcomm.com>
 <977e15c2-ad91-45c4-be99-0390ae7f8315@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <977e15c2-ad91-45c4-be99-0390ae7f8315@lankhorst.se>
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

On Mon, Oct 06, 2025 at 11:11:01AM +0200, Maarten Lankhorst wrote:
> >> @@ -401,13 +424,20 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
> >>  
> >>  	dev_set_uevent_suppress(&devcd->devcd_dev, false);
> >>  	kobject_uevent(&devcd->devcd_dev.kobj, KOBJ_ADD);
> >> -	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
> >> -	schedule_delayed_work(&devcd->del_wk, timeout);
> >> +
> >> +	/*
> >> +	 * Safe to run devcd_del() now that we are done with devcd_dev.
> >> +	 * Alternatively we could have taken a ref on devcd_dev before
> >> +	 * dropping the lock.
> >> +	 */
> >> +	devcd->init_completed = true;
> >>  	mutex_unlock(&devcd->mutex);
> >>  	return;
> >>   put_device:
> >> -	put_device(&devcd->devcd_dev);
> >>  	mutex_unlock(&devcd->mutex);
> >> +	cancel_delayed_work_sync(&devcd->del_wk);
> >> +	put_device(&devcd->devcd_dev);
> >> +
> > 
> > Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Thanks, through what tree can this be merged?

I can look into doing that after -rc1 is out.

thanks,

greg k-h
