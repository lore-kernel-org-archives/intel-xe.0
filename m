Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8947FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 09:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC010EA17;
	Tue,  5 May 2026 09:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbeya/LZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3710E126;
 Tue,  5 May 2026 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777973465; x=1809509465;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/a2EnyDPn05RZMnVKtZjEzUUAwivOVJjxFP2yX4qmSo=;
 b=mbeya/LZozYZDOtq4TQGTfKKj4z6LOMAV3QtnJ2bPdnXeIP+UaIYBMhK
 Ugj7btQcO3zdjkFKaNYdU9zE5QPFarm8OSuIqSNfrgE5aVrNIvQZaEVaw
 t16pUJPdrdcC/ypIQSRrGYgEpmor7ydHjKpBFqlNZipedJj60mftQ2zMj
 SR5IozmLY1GvyleQOIsGmyJrg3XQxImeF/84Xc3N/9p1roFJf+0BtK1wX
 OvTUsS94pCUrlzKzV45PCtsCIV9lnB84xbTkLEfb70Xi2pTMQ1Ok1Otbk
 1ncXhsryXVfMLO1ZcxQNUYxIk5+MNk8RieuczMnyN3Z3wJm0t70+nTZA8 g==;
X-CSE-ConnectionGUID: 8rAFBFgKRxuYarXprJyFSA==
X-CSE-MsgGUID: m9HuOovrQtOKAJgJtvtczw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78830887"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78830887"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 02:31:05 -0700
X-CSE-ConnectionGUID: ngBDru85SB+aoPE5DSDNrA==
X-CSE-MsgGUID: 2DZoElVIRIeHcuWReF61Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="231392203"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.55])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:31:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/4] drm/i915/display: add struct intel_irq_regs and use it
In-Reply-To: <4467f546-984f-0367-1356-38374c6ae2b9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1775653994.git.jani.nikula@intel.com>
 <ed3401c39890fd02fb01510fc194f02e2dda4ebc.1775653994.git.jani.nikula@intel.com>
 <4467f546-984f-0367-1356-38374c6ae2b9@intel.com>
Date: Tue, 05 May 2026 12:31:00 +0300
Message-ID: <123c1c11c24a2d52f57f07589320ddd1a30e97fb@intel.com>
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

On Tue, 05 May 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On Wed, 8 Apr 2026, Jani Nikula wrote:
>> -#define GEN8_DE_PIPE_IRQ_REGS(pipe)	I915_IRQ_REGS(GEN8_DE_PIPE_IMR(pipe=
), \
>> -						      GEN8_DE_PIPE_IER(pipe), \
>> -						      GEN8_DE_PIPE_IIR(pipe))
>> +#define GEN8_DE_PIPE_IRQ_REGS(pipe)	INTEL_IRQ_REGS(GEN8_DE_PIPE_IMR(pip=
e), \
>> +						       GEN8_DE_PIPE_IER(pipe), \
>> +						       GEN8_DE_PIPE_IIR(pipe))
>
> Should I send a patch with s/pipe/_pipe applied to
> GEN8_DE_PIPE_IRQ_REGS()? In case it is just a nit from checkpatch:

s/pipe/_pipe/ doesn't help with the checkpatch complaint about macro
argument reuse.

Basically this means something like

	GEN8_DE_PIPE_IRQ_REGS(foo())

leads to foo() being called three times, in unspecified order.

For the register macros we generally don't care, and they're only used
in a fairly limited manner. To make them safe against macro argument
reuse requires a code block like ({ enum pipe _pipe =3D (pipe); ... }) and
that'll never be a constant expression.

> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Thanks,
Jani.

--=20
Jani Nikula, Intel
