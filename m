Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B837606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iyCCj01G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0D10E301;
	Thu, 29 Oct 2026 17:03:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9560B10E301
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 17:02:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7392D600C8;
 Thu, 29 Oct 2026 17:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002131F01816;
 Thu, 29 Oct 2026 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793293377;
 bh=LHFyE7BjeYMSpFNPORvuHnl7K/2W4Ijv0GEw8kIQY5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=iyCCj01G1GuDUtYaaWzeJYpOOkpFbeOjWlKpNYkzGn3K230wKq4cCbnDP4Y1OO8Vf
 PM1LJ4N6zj2QHw5ezuojHpVBnrX1xQwSEXUBKCIXtXJhfUNKdcp/z0Vqk47P0Ur6iV
 H4ubeRXawiP7GUm5D28g0/10Q480iTQNbSbX3FkA9EezaFJCREqWY6XUhkwKf5YQLN
 qnUWPydxeWY3RMJn6R77PQJ5GnHYC98K131MWrQoMB+QjyLwMBcqFpKSAvkOIj3kNc
 i/3abW9oK1rt/ehcWAnFpmJvoJnrVVDQ8ozr/vEpmcULzA8c+QBtY11tyR0Y9JDUHW
 Fb8V6yPa9y7Lg==
Date: Thu, 29 Oct 2026 18:02:52 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>, "Kumar G,
 Naresh" <naresh.kumar.g@intel.com>, 
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <q2caxyahv532pazvrfgzartdn6433hkkz35ofwhfuizdzbd5ch@rkvjmv63kdce>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1>
 <at8_996Aarbq0_TO@black.igk.intel.com>
 <at-XhFGST5C3lFTu@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-XhFGST5C3lFTu@ashevche-desk.local>
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

On Mon, Oct 26, 2026 at 08:10:12PM +0200, Andy Shevchenko wrote:
> > 
> > The below patch actually looks more correct to me compared to the
> > swnode patch above.
> > 
> > Andy, I'm sorry to bother you with this, but can you take a look.
> 
> Bart is in Cc and I believe he recently proposed some fixes against driver
> core, but I can't say now how relevant they are (at least all keywords sounds
> very similar).
> 
> https://lore.kernel.org/lkml/20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com/
> 
> Ca you give a try and see if it resolves your issue?
> 
 
Hi!

Sorry, I missed this thread before. This series fixes a diffent issue.
I'll take a look at this one but it'll probably be a different fix.

On that note: is the swnode balancing series good to go? I haven't
received any reviews.

Bart
