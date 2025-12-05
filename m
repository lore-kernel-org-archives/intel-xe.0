Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F2DD2F7D1
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 10:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E2310EAA1;
	Fri,  5 Dec 2025 10:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BzsbXOSO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351F910EAA0;
 Fri,  5 Dec 2025 10:14:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D65B40579;
 Fri,  5 Dec 2025 10:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B663C4CEF1;
 Fri,  5 Dec 2025 10:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764929683;
 bh=pJuRMZQhgNQxmUcx+UYfxc7CgrRn/9RzNX0VCF3bk2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzsbXOSOIjlU9Bp4fmujj3nmZLeb2AVKe4vqgfxxaKuXzSHQseO9SeLz3DMJzJg7n
 PNZZpxolmae/HiWDTUlzf8jGlecD8ErGBX8FXEUAYZq7qx+6NOfIeFmsvKi8MpJ16h
 imhf8bpQHo5EUr33OAbiAbOMCO2ziKUsRT3sCrMAnGVyuNnCEYrkhKSoAKrAgeLTia
 yH+9uELn6aL4cxXZbxXBS/IR7hX5sbLvHj0ZI64PlfYebYnzRW9xQfRZLxMX9x/Coe
 9TNQJBw8qDqbG2YCmo2yUSmBdk8WPSaRkGkuy+R8aRz+arnF9sWMRpDTk553OleE8g
 npe+uREsRYpdQ==
Date: Fri, 5 Dec 2025 11:14:38 +0100
From: Christian Brauner <brauner@kernel.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: REGRESSION on drm-tip
Message-ID: <20251205-crashtest-korrektiv-64a8b21aa39f@brauner>
References: <03c013c0-be12-42ab-91d1-f87395c890e3@intel.com>
 <aSjY8et1QDyvFq9x@intel.com>
 <860117f0-d8b1-4f4b-8448-d8fd83634c4f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <860117f0-d8b1-4f4b-8448-d8fd83634c4f@intel.com>
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

On Fri, Nov 28, 2025 at 01:16:44PM +0530, Borah, Chaitanya Kumar wrote:
> 
> 
> On 11/28/2025 4:34 AM, Ville Syrjälä wrote:
> > > `````````````````````````````````````````````````````````````````````````````````````````````````````````
> > > commit a3f8f8662771285511ae26c4c8d3ba1cd22159b9
> > > Author: Christian Brauner<brauner@kernel.org>
> > > Date:   Wed Nov 5 14:39:45 2025 +0100
> > > 
> > >       power: always freeze efivarfs
> > -       if (freeze_all_ptr && !(sb->s_type->fs_flags & FS_POWER_FREEZE))
> > +	if (!freeze_all_ptr && !(sb->s_type->fs_flags & FS_POWER_FREEZE))
> > 
> > ?
> 
> This change helps.
> @Christian do you plan to send out a fix for it?
> 
> Thank you Ville for pointing it out.

Yes, it's in vfs.fixes. I'll send it today.
> 
