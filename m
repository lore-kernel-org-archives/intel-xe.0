Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C7606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dgjvMv48
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC2C10E85D;
	Wed,  4 Nov 2026 08:07:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D6310E844
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 08:07:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id 2D1D160AB0;
 Wed,  4 Nov 2026 08:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 031CE1F00919;
 Wed,  4 Nov 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793779664;
 bh=5argj3jgxjaIwdw//Cy2pyVRb1WgHueQojCsHqAHNoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=dgjvMv48L/DVv/5S1AfLGCLOtgbnN4sq3Pmso+syVhotcxSLf/116pypPxqtJti+O
 xh+q44Tilz8M1FYMpcHhS9yTd2GaMqjAUy1+K9QBRy92bcGa1Hb6KmsAh7Kj5Xfo/o
 tU29J4/ABuUBL1pbDg49TGAaaTE1VFdGoULURlYaCv7yUdc+GJru46ZOCCXFmJJleB
 67hYlp93fl+PfKdHojmh5J9qn3plazUF+4QqUuVzMve6wiJqdKjYqomwnEcq5p3kbf
 yDCL6Lc3pDKmnIDw7qZZX0un0PwznmY3wGDlPVQV251mausVovoplalPtbLUfVDZHh
 uscG4noDnwecA==
Date: Wed, 4 Nov 2026 09:07:41 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Kumar G,
 Naresh" <naresh.kumar.g@intel.com>, 
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, 
 "bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <vr6opngpmfg75pngzrkb7xnllrjnpjq5dlliishq3tm3wdm4n7@kwlo3kdvjquf>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1>
 <at8_996Aarbq0_TO@black.igk.intel.com>
 <at-XhFGST5C3lFTu@ashevche-desk.local>
 <q2caxyahv532pazvrfgzartdn6433hkkz35ofwhfuizdzbd5ch@rkvjmv63kdce>
 <80e999b49fb3489a891742dc4267be740b0035c6.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80e999b49fb3489a891742dc4267be740b0035c6.camel@intel.com>
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

On Tue, Nov 03, 2026 at 11:43:23PM +0000, Summers, Stuart wrote:
> On Thu, 2026-10-29 at 18:02 +0100, Bartosz Golaszewski wrote:
> > On Mon, Oct 26, 2026 at 08:10:12PM +0200, Andy Shevchenko wrote:
> > > > 
> > > > The below patch actually looks more correct to me compared to the
> > > > swnode patch above.
> > > > 
> > > > Andy, I'm sorry to bother you with this, but can you take a look.
> > > 
> > > Bart is in Cc and I believe he recently proposed some fixes against
> > > driver
> > > core, but I can't say now how relevant they are (at least all
> > > keywords sounds
> > > very similar).
> > > 
> > > https://lore.kernel.org/lkml/20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com/
> > > 
> > > Ca you give a try and see if it resolves your issue?
> > > 
> >  
> > Hi!
> > 
> > Sorry, I missed this thread before. This series fixes a diffent
> > issue.
> > I'll take a look at this one but it'll probably be a different fix.
> > 
> > On that note: is the swnode balancing series good to go? I haven't
> > received any reviews.
> > 
> > Bart
> 
> I was seeing this on my side too on xe driver unbind and put a quick
> unit test together with Claude in that reproduces if that's
> interesting...
>

When the fix goes in, please consider submitting this test in an actual
patch too.

Bart
