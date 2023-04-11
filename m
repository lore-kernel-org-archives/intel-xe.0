Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C11C76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 08:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920CD10E4ED;
	Tue, 11 Apr 2023 08:33:42 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C8F10E4ED;
 Tue, 11 Apr 2023 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681202020; x=1712738020;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fIA42E/NqS1J9slRZVTEL1WbCsc7J9fF9Bsyy9v1lyk=;
 b=KYLYzaxLnMMNy3z/n8VzBeKf4ZtoXpq7RiV3Tpx8iA3olWtt4+HtURQc
 CmPXVT0yk/1Q7XS0jj9xMJmhMLJovXDzLomJ9i1/VqPN+Jc8nS024oNiG
 9UauC4fAuhy5DK7hSIG6PZgKrkU/R79DLtNAr/9zbgRCGbqdkMaG8yaUr
 pDlsLxEHYodeZmYbUzLmDUoG3t88L+00uy1BSA0aXPZWlJFqw7E//B0TH
 swsdARHYiSErVkQe92sHwb1MMJBZjGApyc2Ss6cRj11EOe9jlBkZMYhVZ
 ABZp+AoJI0AW9/vQgbyH39TqdSLWdeq4GsCB1JNSw2s1q2viIX59rc38E g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="332240120"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="332240120"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 01:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777836093"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="777836093"
Received: from tunterlu-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.56.34])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 01:33:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <87edoqes4r.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230410183219.191543-1-jose.souza@intel.com>
 <87edoqes4r.fsf@intel.com>
Date: Tue, 11 Apr 2023 11:33:32 +0300
Message-ID: <87bkjues2r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/i915: Initialize dkl_phy spin
 lock from display code path
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 11 Apr 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 10 Apr 2023, Jos=C3=A9 Roberto de Souza <jose.souza@intel.com> wr=
ote:
>> Start to move the initialization of some lock from
>> i915_driver_early_probe().
>
> Please send this as standalone patch to i915. It won't get merged to
> i915 as part of series only parts of which apply to i915.

Not to mention drm-xe-next is *not* the path to upstream i915
changes. Each i915 merged there is a potential problem in upstreaming
xe.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
