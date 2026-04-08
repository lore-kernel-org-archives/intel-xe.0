Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974871073CAB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EF710E670;
	Wed,  8 Apr 2026 13:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uct9QV8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183110E64E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775654330; x=1807190330;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wP8xqm1c9pOtZE+AjgnJEcQxxFjmbjiNw8VPW/xZJMA=;
 b=Uct9QV8VaWYR0WG0qlWPi0nuqXQEFGnG4wcVvwa3wOW31HIvM0bqOb3X
 NzasiT4IIwlzZ8FTul87GhNFLLr+GlDAbTQj9X5f2vUp2bUniwGwzMb5Z
 3vNTCL60jI1PgFKeFDx44S0f8Xj6AK9lYXcRZakc8Wc6c1GkAEl+xccqC
 k2QpIHM/7N74xJnzsBTaRbtFR9eMk8fz8rT2PS8fMueY0w24VdBwFDIR2
 CwGQco6L4/53xXv60UJ+ZdNdhC5UfheZlE0/qEMTPcMY7mRnRW6TgyV3N
 ENhoBt1zBK3Mbileo+sZV9NOGXMRt2K1g1fp5dsTNsupkIPGcVGG4e1EM A==;
X-CSE-ConnectionGUID: P1wTvqHtQBq4qCw6NHDpnQ==
X-CSE-MsgGUID: 9mzzRt/nQRe4vDvFxYut7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80496891"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80496891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:18:50 -0700
X-CSE-ConnectionGUID: misvPjVlRe6BENX6d8ezOw==
X-CSE-MsgGUID: n7OPOiK9TBm/jqqK0PbRnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="224166117"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:18:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
In-Reply-To: <4c38349fdee090e69100437781c3f5cc2a354b4c.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260406225338.98533-1-stuart.summers@intel.com>
 <fa58f4c0-d126-417f-803f-7a521c5df8da@intel.com>
 <4c38349fdee090e69100437781c3f5cc2a354b4c.camel@intel.com>
Date: Wed, 08 Apr 2026 16:18:40 +0300
Message-ID: <07168815102825e019bfd6eb7ad9b82dd0040953@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 07 Apr 2026, "Summers, Stuart" <stuart.summers@intel.com> wrote:
> On Tue, 2026-04-07 at 11:48 +0200, Michal Wajdeczko wrote:
>>=20
>> On 4/7/2026 12:53 AM, Stuart Summers wrote:
>> > From: John Harrison <John.C.Harrison@Intel.com>
>> >=20
>> > GuC provides the ability to gather logs through a hardware
>> > interface
>> > called NPK. For certain debugging scenarios this can be
>> > advantageous
>> > over getting logs from memory (or in addition to).
>> >=20
>> > Add a hook for this alternate debugging mode via a configfs. This
>> > translates into a parameter passed to GuC during load time.
>> >=20
>> > v2: Convert to configfs from modparam (Matt)
>> > v3: Configfs documentation formatting (Shuicheng)
>> > =C2=A0=C2=A0=C2=A0 Kerneldoc/comment add + configfs entry ordering
>> > =C2=A0=C2=A0=C2=A0 Only set the guc_log_target when GuC log is enabled=
 (Daniele)
>>=20
>> nit: we may keep change log under --- so it stays on the ML only
>
> Ok makes sense I'll do that on the next upload.

Is this an intentional deviation from the quite prevalent drm subsystem
style of including the changelog in the commit message?

I'm not dead set on either style personally, but I do not like
conflicting review feedback, and people not knowing what to do.


BR,
Jani.


--=20
Jani Nikula, Intel
