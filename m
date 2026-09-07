Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FFDC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 05:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CB010E638;
	Mon,  7 Sep 2026 05:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcVRnJfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8F610E638
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 05:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788759172; x=1820295172;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=BuDBXhrtmn5DgYtORmloj4MKwN4M2d7iRpGVjj721rY=;
 b=QcVRnJfBbrrbLJBJfUY9yGFCQt9NnNIyLL9zd7Sed5Py1fmJ7mGupB69
 Scxskvq6CeGCBPJScidknQL/geFJzmSgqBoLfLNXqSDWYdbmAzCFxvMlu
 rGEa729PVd7/q93hxrHqxx4gg2UeKkI5SQf2LWuUNiPtHYrZaNBT5Y2Gt
 P0LZEBmHr9SeYeuboZ36OJ/TLZJnRcz+ZGx3QP0SNc0ARh2mPeaaaZxWB
 fvaGcMWqVjWtGpGfa1xeTXelspMyadoB/nv87ysuE/1l4H6/I2t5sIn60
 XvNpwycWUL06CRYrXq+efCfr9DJPIG15d0g1oa/j3WonuQILTSV8xtnB9 g==;
X-CSE-ConnectionGUID: 6JhmQ5zURLuFwevyafJQAQ==
X-CSE-MsgGUID: 2U3LPKSCRemRSoTA1YdeOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89031386"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="89031386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:32:51 -0700
X-CSE-ConnectionGUID: a9Twvd1qQayxlbymQGvngw==
X-CSE-MsgGUID: B8vHJ7fjSWW70Mb/xU5VOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="270574745"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.184])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:32:47 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <apmgwallbRKwJf2k@intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <apmgwallbRKwJf2k@intel.com>
Subject: Re: [PATCH v10 00/27] Intel Xe GPU Debug Support (eudebug) v10
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch,
 matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, gustavo.sousa@intel.com,
 jan.maslak@intel.com, dominik.karol.piatkowski@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com, maciej.patelczyk@intel.com,
 gwan-gyeong.mun@intel.com
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 07 Sep 2026 08:32:44 +0300
Message-ID: <178875916456.26101.5847097549987254166@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Quoting Rodrigo Vivi (2026-09-03 19:30:57)
> On Thu, Sep 03, 2026 at 05:59:24PM +0300, Mika Kuoppala wrote:
> > Hi,
> >=20
> > This is the v10 patch series for Intel Xe GPU debug support (eudebug).
> >=20
> > This series continues from the following previous submissions:
> > - v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.=
html
> > - v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/0522=
60.html
> > - v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061=
476.html
> > - v4: https://lists.freedesktop.org/archives/intel-xe/2025-August/09164=
5.html
> > - v5: https://lists.freedesktop.org/archives/intel-xe/2025-October/0978=
59.html
> > - v6: https://lists.freedesktop.org/archives/intel-xe/2025-December/106=
405.html
> > - v7: https://lists.freedesktop.org/archives/intel-xe/2026-February/115=
750.html
> > - v8: https://lists.freedesktop.org/archives/intel-xe/2026-April/124147=
.html
> > - v9: https://lists.freedesktop.org/archives/intel-xe/2026-June/128834.=
html

<SNIP>

> > # Supported Hardware
> > - Lunarlake (LNL)
> > - Battlemage (BMG)
> > - Pantherlake (PTL)
>=20
> Are we adding CI?

Assuming you meant CRI, not in the initial submission which focuses
on the uAPIs.=20

> > The code for this submission can be found at:
> > https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v10
> >=20
> > Tests:
> > https://gitlab.freedesktop.org/DominikPiatkowski-Intel/igt-gpu-tools/-/=
tree/eudebug-dev-next
>=20
> What about the upper level PRs and reviews?
> Could you please update us on how that side of the review is going?

Latest GDB submission is at:

https://sourceware.org/pipermail/gdb-patches/2026-August/229340.html

Version 4 has undergone a medium rewrite, as far as I know the review so
far has been around how GDB should model GPU devices (multiple lanes). So
far there's really been no discussion about the uAPI which GDB uses through
Level Zero Debug API. Discussions about the status of the GDB user interface
and internal architectural review probably best had in the GDB mailing list.

In compute-runtime uAPI is merged behind disabled by default compile time
option NEO_USE_XE_EU_DEBUG_EXP_UPSTREAM, to implement the Level Zero Debug
API through which GDB calls.

Regards, Joonas
