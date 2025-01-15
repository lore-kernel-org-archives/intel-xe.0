Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599BAC02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 11:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F51210E5DB;
	Wed, 15 Jan 2025 11:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkILHIhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0636010E15A;
 Wed, 15 Jan 2025 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736939348; x=1768475348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SSKIP4Z3AOY6VgQBJ0ZBetNsc5NDpGV6zTUnrYUunlY=;
 b=gkILHIhr6LMzM2N+4H3MqI+gAAqcxyjm06Z4PPggnlfdynuHTNQp2c7y
 yeZe4ThM2p2sqCLPQmjVItUHowJIivl+i5zwDPsVc0X7UhsB2cUXWvkAi
 bkNqcX8svv7qcyJIPz/3zyvsSp3x6CcSuMkBk7wmGP8Tmc9ty3wh0yvTK
 zPxYGx1YMUrHPBtLCkTZHmsi2DJhkEaA1wRkD7jOx9WpSRUEw+9mqor5v
 49mXqqDHadvV2WaSXX4NElaxKk6r2SnmUs78QnGW8lV2bX2pbivq/rvdp
 LQRKgBD9y/3hFYaLcvMHLRoK9RjJZtPDPf3WuKsoW+IZ2z/bTSAXckKlY A==;
X-CSE-ConnectionGUID: FVHKcD/PQUGz2cWVY4GeOQ==
X-CSE-MsgGUID: GZSmDx3/QqqkpsaYS4oDuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47854521"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="47854521"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 03:09:07 -0800
X-CSE-ConnectionGUID: c/PcNeFdQQOpeHrfHyMaNQ==
X-CSE-MsgGUID: V5+/HhV2TLCFcWYDSqQPRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110239149"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 03:09:06 -0800
Date: Wed, 15 Jan 2025 12:09:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t] tests/intel-ci: Fix a syntax err in xe.blocklist.txt
Message-ID: <20250115110903.maekb7peoi4yfgbe@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
References: <20250114173523.3267049-1-oak.zeng@intel.com>
 <b0a4127bd7403d4dd9390be78f819f524d36b194.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a4127bd7403d4dd9390be78f819f524d36b194.camel@linux.intel.com>
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

Hi Thomas,
On 2025-01-15 at 09:02:20 +0100, Thomas Hellström wrote:
> On Tue, 2025-01-14 at 12:35 -0500, Oak Zeng wrote:
> > The syntax in below lines are wrong:
> > 
> > igt@xe_evict@*-multi-vm-cm*
> > igt@xe_evict@*-threads-*
> > 
> > With above, those xe_evict tests are not blacklisted from xe.ci.full

I merged this with correction s/blacklisted/removed/

> > category.
> > 
> > Fix the issue by adding a dot (.) preceding star (*).
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 

Sorry, I didn't see this at merge time.

Regards,
Kamil

> > ---
> >  tests/intel-ci/xe.blocklist.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-
> > ci/xe.blocklist.txt
> > index a9b647c1d..fc270198f 100644
> > --- a/tests/intel-ci/xe.blocklist.txt
> > +++ b/tests/intel-ci/xe.blocklist.txt
> > @@ -93,7 +93,7 @@ igt@sriov_basic@bind-unbind-vf$
> >  # Exclude xe_evict tests that are not expected to succeed
> >  # due to missing TTM exhaustive eviction
> >  ##################################################################
> > -igt@xe_evict@*-multi-vm-cm*
> > -igt@xe_evict@*-threads-*
> > -# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
> > +igt@xe_evict@.*-multi-vm-cm.*
> > +igt@xe_evict@.*-threads-.*
> > +# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
> >  ##################################################################
> 
