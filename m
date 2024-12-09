Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB340E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 16:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717FC10E296;
	Mon,  9 Dec 2024 16:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgVRrHp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65F510E296
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733761385; x=1765297385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NI1m+Q5aQbsOXkh5/VX0kZ6h1XTGo/ZYcri0skIEC50=;
 b=DgVRrHp+kQV/B5zf7/n5VeBMrNBsevYND4KaIz8lOYIT4tywviXY2770
 R9dshZWq41Jc9ABwVufq9t5EeDiKBrd5J2orGSmpvsZVh2xmgvw9i1Ak7
 cMhyMsnO61RYjuhu3H6iU8vEWdf34ElIxQ0kWAU4RIEVewpfEYaR3GCIv
 7/1YzH2pf3EUgoG/MM/UgrA7eay8AkNjsD6ZhWDz145T3dzufkDmOY6/S
 cb30DuYoeVuxk48Bsd7F0S5HdR6Bo3ySTb1hcEBiAKCVD8BsfHzfHD/R9
 mk6jhkI11J6E+BBtBmHNiSQJCWjX+QwBKW0XHvYS0jdalYoXSlnoq16Ag w==;
X-CSE-ConnectionGUID: ejz8QoBTTmeT8Ty7LrRw7A==
X-CSE-MsgGUID: z4aNg0aYT86dInbWUMRcUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33411589"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33411589"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:23:04 -0800
X-CSE-ConnectionGUID: Lxh4YscKQeCjInDDjPF+mQ==
X-CSE-MsgGUID: ovYQmGKJTsuxrxMdbAcJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="125953350"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:23:03 -0800
Date: Mon, 9 Dec 2024 08:22:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>, 
 intel-xe@lists.freedesktop.org, niranjana.vishwanathapura@intel.com, 
 Thomas Hellstrom <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: introduce xe_gt_reset_wait to wait for async
 gt reset
Message-ID: <hb75rvvovu6r7owm7ly3yjwh7x6nqxb225ode7pe6qfu34pmgc@zxhtb5q3xbyj>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
 <20241209141210.1311374-2-maciej.patelczyk@intel.com>
 <Z1cB5Wx7AWUUD7L2@black.fi.intel.com>
 <Z1cEtYgIRzoaVRY4@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z1cEtYgIRzoaVRY4@black.fi.intel.com>
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

On Mon, Dec 09, 2024 at 04:54:45PM +0200, Raag Jadav wrote:
>On Mon, Dec 09, 2024 at 04:42:49PM +0200, Raag Jadav wrote:
>> On Mon, Dec 09, 2024 at 03:12:09PM +0100, Maciej Patelczyk wrote:
>> > The reset of the GT is asynchronous.
>> > Adding a wait helper to wait until gt reset is done.
>> >
>> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/tests/xe_bo.c   |  2 +-
>> >  drivers/gpu/drm/xe/tests/xe_mocs.c |  2 +-
>> >  drivers/gpu/drm/xe/xe_gt.h         | 12 ++++++++++++
>> >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
>> >  4 files changed, 15 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>> > index c9ec7a313c6b..b51434fc5bd1 100644
>> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> > @@ -266,7 +266,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>> >  		 */
>> >  		for_each_gt(__gt, xe, id) {
>> >  			xe_gt_reset_async(__gt);
>> > -			flush_work(&__gt->reset.worker);
>> > +			xe_gt_reset_wait(__gt);
>>
>> Why not just create a
>>
>> void xe_gt_reset_sync(gt)
>> {
>> 	xe_gt_reset_async()
>> 	flush_work()
>> }


maybe, the problem I think is the 1 letter difference between

xe_gt_reset_async
xe_gt_reset_sync

that may be confusing/error-prone.

I like the helper, just think we need the naming to be polished.

+Thomas

maybe having this as xe_gt_reset() / xe_gt_reset_async()?


Lucas De Marchi


>>
>> and use it instead?
>
>Or perhaps reuse force_reset_sync()?
>
>Raag
