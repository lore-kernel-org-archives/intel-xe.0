Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037A606A326
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=haaowcWq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D5E10E7A3;
	Tue,  3 Nov 2026 09:12:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC70F10E7A3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 09:11:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id E421D600CB;
 Tue,  3 Nov 2026 09:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BB7481F000C1;
 Tue,  3 Nov 2026 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793697118;
 bh=bYpUm3WibqJ0lqesWBB8AdoMNU1eHFKty8fhWpf/ijQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=haaowcWqO5NDOmUM+RzAuUxdnwnHg7xMaRE6dHN9mcxQ6zq322zIP3arKh11Ea/F2
 t7pbC9mCPWT5k5oLbrUKlTA+NZNPZgFmN/bVOu81szWR7dAQGa+dvWujck1TJ3WvIy
 brtqRP5aLsasgavUHufO4zd6sEx4Gv1+R4p1mlE+xr0oeePDSa0c0ZLa10CwvNleEi
 95l1w8G9lzmhvSskLlYyKpmziasuqVPlqldUnYqIAu9t1p52TkQtsEwwFAiqLtvWU2
 Tb5ejsCHH9VDIdmd2DN+0mY1DFT30c9kW16fbVmulx5u3wC1BYGZTrnNkpoNG1H29p
 JZyO7ox+SWdiA==
Date: Tue, 3 Nov 2026 10:11:54 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <ebe2mfnuch5sd7yj3brxmtaie3idj7xgou6p4opzeam3udsdpr@rp3tspwnvqqb>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <auC-ryi8PFiPgiLE@zenone.zhora.eu>
 <gdkx2gc2up64m2xnkazaoehk4ftckfoemvwaws6xevhnjddcyb@drcqglzj3hdy>
 <85d7f778-6b4d-4665-8c86-65aea2454509@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d7f778-6b4d-4665-8c86-65aea2454509@intel.com>
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

On Tue, Nov 03, 2026 at 10:56:36AM +0530, Kumar G, Naresh wrote:
> Hi Bart,
> 
> I have already shared a patch for review at drivers.core mailing list at
> 
> linux-drivers-review - [linux-drivers-review] [PATCH] software node: fix
> double put for shared managed nodes - arc <https://eclists.intel.com/sympa/arc/linux-drivers-review/2026-10/msg00096.html>
> 
> please have review on the same and have added you in CC to that mailing
> list.
>

Please, don't top-post on the mailing list. I can't open that link. Have
you posted it on lkml? I can't find it on lore.

Bart
