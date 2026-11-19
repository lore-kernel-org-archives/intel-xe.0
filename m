Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D4E606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJV3lu4c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E731123F2;
	Thu, 19 Nov 2026 13:37:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D921C1123F2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 13:37:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id 21E63627BC;
 Thu, 19 Nov 2026 13:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 665301F000C5;
 Thu, 19 Nov 2026 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795095436;
 bh=gG43eDCqeq136Np27fFY6TkCdfE16m+EKLT7923WjiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BJV3lu4cpOWzJJPiI9PXYRUBZdAhJq8JzwPDCXg+7r4XKez/PxqVamAttHxWa0ySR
 yLcDJPLPrgegecoiUDT98x/Tp9EFBilvrWPCnyV25B/f7jfCMkcKkUxt0oaSGqCXhC
 eJlGsRe7daolA+ThuyoI1kcI4DXhgcKNV0VbAMK/laLm4tXIJOzpr+qONRbfieijpT
 kLr+WrhfrwBESlSJ4XMHimK4ooSD8W2Ju3qHHFYncMKggTGYvLlZRLhj0cDZQlawlh
 WmFi2hUrXK9ANUZgevN4rKLpOYb2AzUpybKBiVofmUHiplhBqF0Tj7uW8dGzt8yKn8
 aHBEqYB+Xzt+Q==
Date: Thu, 19 Nov 2026 14:37:06 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Stuart Summers <stuart.summers@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Message-ID: <kd7u47uhw7kzvfu4a6xxtpd6pkad3fkwlw3lxgt3hdllfpzd52@dw2lkxcd3nnr>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
 <sashiko-outbox-222127@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-222127@kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 10:49:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] driver core: test: platform_device_swnode_shared() tests
>   unmanaged swnode
> - [Low] driver core: test: unsafe device lifetime in
>   platform_device_swnode_shared()
> --
> 
> commit 456e50d0c4a7cd5e70182bbae38d6d777a4710e4
> Author: Stuart Summers <stuart.summers@intel.com>
> 
> driver core: platform: tests: add a shared software node test case
> 
> This commit adds a KUnit test case verifying that sharing a platform
> device's software node with a second device via device_set_node() leaves
> the owner's software node intact when the second device is unregistered.
> 
> Link: https://patchwork.freedesktop.org/series/175858/ [1]
>

...

> 
> [Severity: Low]
> Can allocating shared with kunit_kzalloc() and an empty release callback
> cause a use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y?
> 
> Under CONFIG_DEBUG_KOBJECT_RELEASE=y, device_unregister(shared) ->
> put_device() -> kobject_release() schedules shared->kobj.release as
> delayed work instead of cleaning up synchronously, so KUnit frees shared
> when the test exits while kobject_delayed_cleanup() is still queued.
> Also, if any intermediate KUNIT_ASSERT_* fails before the end of the
> test, the unmanaged pdev, fwnode and shared allocations and registrations
> are leaked.
>

This should be fixed by the following patch:
  https://lore.kernel.org/all/20261119-swnode-kobject-parent-ref-v2-1-7ff8bd54e526@oss.qualcomm.com/

Thanks,
Bartosz
