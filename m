Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC574FD8FC3
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 15:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7C910E979;
	Thu, 26 Feb 2026 15:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gn46H3YL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1345610E96A;
 Thu, 26 Feb 2026 15:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B67E60054;
 Thu, 26 Feb 2026 15:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50ECC116C6;
 Thu, 26 Feb 2026 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772118311;
 bh=200LdCyQcja9I4GzpcFFWyhPdX9NYk+rNmyQKKm7fk0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gn46H3YLwillrfzwpYBkGbAGDt6vP0TWuekxiMYVZSXsbMyEEDNKa6gR9v2KD4qtf
 iPMX9q6qQ/JRnPVtKKIZvSV1nDIuCJK6pF1uGwjq77cF5v9xodqQTo8Nx5G4H565Z4
 4mITKtpDerWHqEbgDaXLRQA3avGsIpm4Ed3CXehpD6lOp9X7tD0x8g+q9W6D5PqOTi
 kuwDjD3LCPn4ZO8e7oy8yT9W2XFOzVGiw2P8AW4opzM0D+1WxH8F+82dttnSUB2+7t
 xLnay/AYwU9JT5i7oN2Ixu+5WOGvqkDD/fkE4H/D8cCJTR5wV5AOxVquYY5Ob8ZHqL
 pzU+ZmzEfo7Gg==
Date: Thu, 26 Feb 2026 07:05:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, <anvesh.bakwad@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "Hawking Zhang" <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260226070509.2c7346b3@kernel.org>
In-Reply-To: <53fc3f6f-b5b6-4ec6-9468-3cd668efb070@intel.com>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
 <20260224162203.279f7b74@kernel.org>
 <686b63cc-2dfb-467b-a472-b6766b2c8dd2@intel.com>
 <20260225161857.55fd4ba4@kernel.org>
 <53fc3f6f-b5b6-4ec6-9468-3cd668efb070@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 26 Feb 2026 15:17:55 +0530 Riana Tauro wrote:
> > Oh interesting.. that's technically supported but the regen script
> > uses "-o $file --cmp-out" instead of "> $file". If we were to use
> > a shell redirect we override the file each time which makes incremental
> > kernel builds much larger.  
> 
> If i am using this for the first time (not every time). Shouldn't it 
> include the header file (#include "drm_ras_nl.h) too?
> 
> tools/net/ynl/pyynl/ynl_gen_c.py --spec 
> Documentation/netlink/specs/drm_ras.yaml --mode kernel --source
> 
> But i am seeing this include only when i regenerate using ynl-regen.sh.
> Is it mandatory to regenerate after the initial use of the above command.
> 
> >   
> >> I used above commands to generate the initial files moving the
> >> drm_ras_nl.h from include/ to drm layer.
> >>
> >> Even after that if i regen using tools/net/ynl/ynl-regen.sh -f
> >> I see the above diff.
> >>
> >> Am i using the commands wrong or missing something?  
> > 
> > If you use the redirect the script doesn't know what the file name is
> > so it gives up on adding the local header. If you really want to have
> > the header under include we can just add an option for "--no-auto-hdr"  
> 
> No its not necessary to be in the include directory as it is used 
> internally by drm code.  @Rodrigo I will move this since this is used 
> only by drm_ras.c
> 
> But even after i move it to drivers/gpu/drm/. The initial generation 
> using ynl_gen_c.py doesn't include this header even if the header was 
> generated first.
> 
> The header is included only when i use ynl-regen. Is that expected?

As I explained above you should use the -o $file argument rather than 
a redirect of stdout.
