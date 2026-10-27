Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98FF606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vnqmv0yz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E4910E0BD;
	Tue, 27 Oct 2026 15:12:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7784E10E0BD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 15:11:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9035160136;
 Tue, 27 Oct 2026 15:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640461F01825;
 Tue, 27 Oct 2026 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793113916;
 bh=i08hK3Y72EMqaiYbM0I5CoFLbR439c29S6xr6O3hVc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Vnqmv0yzfueGhgQ7wGh8YJKCl47gAInqXtS/qjkP8G23Aaz05tH4TO0BxkQFmLFBD
 Z8VtDCP8XB/TrEOkjwa1xaU/gQspmCLG1/8wipN/FXgPKb/UzUYktTkwIRCFwezI9T
 T8joYwbvOevd+Jt828BeHiXWndlTdinGWuaymr59EhJxj5XNvYpzEMVDMQnnt9paPd
 2aWKgbg5KaVL3z8nF4uJzuqA2n/iKdyN4JdLEXwtr7Tfo4LnaDc8cwAGX3caj8ZmTm
 X2KWCDIkit91SegYlVDLZ7oJC/BfzYfJmXLmKKuvKFc7mqMPrmSWBiIclUf7v9oz+E
 siySk+7nHynQg==
Date: Tue, 27 Oct 2026 16:11:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <auC-ryi8PFiPgiLE@zenone.zhora.eu>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Balasubramani,

On Fri, Oct 09, 2026 at 10:12:42PM +0530, Balasubramani Vivekanandan wrote:
> The kernel crashes when unloading the xe driver on CRI:
> 
>  Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
>  RIP: 0010:platform_device_release+0x80/0x90
>  Call Trace:
>   device_release+0x44/0xa0
>   kobject_put+0x9b/0x250
>   put_device+0x13/0x30
>   platform_device_unregister+0x29/0x40
>   xe_i2c_remove+0x80/0xa0 [xe]
>   devm_action_release+0x16/0x30
>   release_nodes+0x3d/0x140
>   devres_release_all+0x96/0xd0
> 
> This started after commit 0f485f88656af ("drm/xe/i2c: use
> device_create_managed_software_node()"), which attaches a managed
> software node to a platform device created with platform_device_alloc().

...

> We can fix it by removing the dependency on i2c->dev in
> xe_i2c_notifier(). It is using it to match against the right adapter.
> Instead of using the device, use its parent to match.
> 
> Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

The patch looks fine to me but I still see that there are some
concerns. Like Danilo's points are valid, can those be addressed
later?

For now:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Let's wait a little and if nothing arises I can apply this for
XE.

Thanks,
Andi
