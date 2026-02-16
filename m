Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EEFE81A25
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 14:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F0610E0C8;
	Mon, 16 Feb 2026 14:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krdnUbwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B7E10E0C8
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771252831; x=1802788831;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LCd9TfGE2r2x0XBkPd7b+CaO5FTm541khxz4pRPx7b0=;
 b=krdnUbwO8OUdmbm0ndgSqhAA5omNhi5FHVkIwwY9efvChhnZ58/DlPnT
 kXChpLQTL8V19DXOHlxJ8dLCW6PtXuWl20KFt5GLij9IziaszkzFWr1ez
 K44JGx24v+QF1ayKDjV89j1arKmnWG6p0CgLYx0qNOEq440pb3EhpLFQ4
 BxrYl9PyvyK4CZ0ql0G1ikUm0GeiyJb9OaYIBFPejUg5TXxXKNk9XZ4HJ
 9qxzKyz8b5s6lloHPSOkH8AGjIEJcIlMeTH82lwyQ8/FS8bQzkl0I8b0X
 0JRHY7VDOtda/ejk/3jZd5A5WMBwFNGgSDfOzJdSreUZOD0sAkcRsh/Sz A==;
X-CSE-ConnectionGUID: us1rlnJ5RQukRlR1aZlbtw==
X-CSE-MsgGUID: 3y27FEiqRDGPfQfQjx9lgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="94964152"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="94964152"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:40:30 -0800
X-CSE-ConnectionGUID: Skl0zABBRXOjCJB1F7D63A==
X-CSE-MsgGUID: vPO+vOPRS4St0bLUDpy4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212725147"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.231])
 ([10.245.244.231])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:40:28 -0800
Message-ID: <a849202702850022e37ad5f87e9646b51e3fb521.camel@linux.intel.com>
Subject: Re: [PATCH 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"	
 <himal.prasad.ghimiray@intel.com>, Michal Mrozek <michal.mrozek@intel.com>,
 Ankur N Shah <ankur.n.shah@intel.com>
Date: Mon, 16 Feb 2026 15:40:26 +0100
In-Reply-To: <a842f2e9d2abbf571e96835f4578b74ac6562f1a.camel@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <a842f2e9d2abbf571e96835f4578b74ac6562f1a.camel@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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

+ Michal, Ankur

On Mon, 2026-02-16 at 14:17 +0000, Hellstrom, Thomas wrote:
> On Mon, 2026-02-16 at 19:21 +0530, Nareshkumar Gollakoti wrote:
> > Performance degradation occurs in multi-BMG GPU configurations=20
> > during Peer-to-Peer transactions when one of the two GPUs remains
> > idle
> > with no engine activity.
> > The root cause has been identified as frequency downscaling:
> > the idle remote GPU reduces its operating frequency to the minimum
> > 400MHz,
> > which negatively impacts the bandwidth available for P2P
> > transactions
> > initiated by the active local GPU.
> >=20
> > To address above problem this patch ensures for the platform
> > BMG/CRI
> > the default GT rp frquency min set as 1.2GHz to ensure effetive P2P
> > transaction bandwidth.
> >=20
> > Note:=20
> > While frequency boosting improves performance,=20
> > it also increases power consumption. In single GPU mode,
> > it causes the GPU to operate at unnecessarily high frequencies by
> > default
> > and as of now we do not have any mechanism to limit this for single
> > GPU.
> >=20
> > Nareshkumar Gollakoti (1):
> > =C2=A0 drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI
> >=20
> > =C2=A0drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
> > =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
>=20
> Wasn't the idea to do this only for the Arc PRO BMGs? Perhaps the
> compute team would want to chime in here for the scope of this
> workaround.
>=20
> Thanks,
> Thomas
