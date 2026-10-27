Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18126606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVKXmmP/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B8F10F466;
	Tue, 27 Oct 2026 12:49:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6022E10F465
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 12:49:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 878C46022A;
 Tue, 27 Oct 2026 12:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899DB1F01825;
 Tue, 27 Oct 2026 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793105391;
 bh=+YWvj0OKixnN6cJxkNh68P9jY0lPwmrBUZ8Z8XOwl8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fVKXmmP/JDqJxYMETZaWdJwLLT17HU61xt6oLXQq9hApwkeidLveuGET/W+kRnxas
 qX3ciL+WlVs5t04dQmLfeHRbdo+RzIAyB0wIJlk26Zsnc4lt0BYpck6QXCnn0C9Uw/
 GKGBjv2IgMPXFCmXdtsEvSmWU+oE0zpgiYlvb7pZ6mE0b6tyhRs34+9F1aMYXO4YUI
 Ig/Gr0Fjc6aOaFH9j3I4mk0GKVsIsaV+0PnosCWcH0HJcP4Xi696gikZPWjfrxJLVh
 HSui4U4AQP3QBRxk6P8PXUQdvyMUqZuSKvjTKLmqK4Fe42tqR+88t7IrN9wBI/GzEv
 By0WagM4HVRIg==
Date: Tue, 27 Oct 2026 13:49:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Upadhyay,
 Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <auCda9k66Yi_Mh0z@zenone.zhora.eu>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Naresh,

> @@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
>         sysfs_remove_link(&swnode->kobj, dev_name(dev));
>         sysfs_remove_link(&dev->kobj, "software_node");
> 
> +       /*
> +        * A managed node can end up mirrored onto more than one device (e.g.
> +        * a bus core copying the fwnode onto a child device, as i2c-core does
> +        * for an adapter's own struct device). Only the device that actually
> +        * owns the fwnode releases the creation reference and detaches it;
> +        * every other device only releases the reference software_node_notify()
> +        * took for it.
> +        */
> +       owns_managed_fwnode = swnode->managed && swnode->fwnode.dev == dev;

at this point fwnode.dev is NULL, set from device_del()

Andi
