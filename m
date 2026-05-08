Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51EBCD3436
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 11:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11CA10F45B;
	Fri,  8 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anc6jXW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E6E10F45B;
 Fri,  8 May 2026 11:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778239795; x=1809775795;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Lh81hV3cLttgyBHTwNg6YrqTzPkgN/v+lp1x2twmGzU=;
 b=anc6jXW9OOh+6IYY3D3BQFJV0wcpMQxYhIkFJZ2NNM5EBg9o7PmHHMRy
 vOJFUIi+5H8RvqR9qkECGChNsEoZhv2MLGLyR4cHzG1De9bgq7RZH7pAg
 GGuTVrwnRSdPj27yf0+OMYaBjE/URELw4U8q6glLR1mGH46yqjvhpRuzQ
 f0wQjeVPUACizxMGjT8QXO0ugv2zKlveNMK2TqyqX4oF5ExOGXZtBhF+l
 24I3IgDgKbn4XvFfbfLoCDjo0lnQ7cxmB57Qr87x5GKyuTtJ8DHQhGrV9
 SFa/Ea0h4EyFkEmg6s5gCkA/AZSmJVYajZh71J03/DKgDDujt8wzuY+uf Q==;
X-CSE-ConnectionGUID: DvylrT4+T5Kautd8s62ETw==
X-CSE-MsgGUID: 7DQVQbKUQ6+oVADmgQsttQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79312855"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="79312855"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 04:29:54 -0700
X-CSE-ConnectionGUID: MZHl84DGReqVTnOubLtbBg==
X-CSE-MsgGUID: CZMVq/AvQem1XJQbHK5//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="236870213"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 04:29:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 ville.syrjala@linux.intel.com
Subject: Re: [RESEND 0/4] drm/i915/display: start switching to display
 specific reg types
In-Reply-To: <cover.1777972548.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1777972548.git.jani.nikula@intel.com>
Date: Fri, 08 May 2026 14:29:50 +0300
Message-ID: <0fb8d06a63af7f22dea6d08d69d94350c97a1e83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 05 May 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> Jani Nikula (4):
>   drm/i915/display: add typedef for intel_reg_t and use it
>   drm/i915/display: add struct intel_irq_regs and use it
>   drm/i915/display: add struct intel_error_regs and use it
>   drm/i915/display: define and use intel_reg_{offset,equal,valid}()
>     helpers

Ville, ack on this one?

BR,
Jani


-- 
Jani Nikula, Intel
