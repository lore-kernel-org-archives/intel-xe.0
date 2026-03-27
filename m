Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427E310BA43D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 08:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F7810ECC0;
	Fri, 27 Mar 2026 08:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPBluaq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A372610ECC0;
 Fri, 27 Mar 2026 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774601174; x=1806137174;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=As4/fdYuAPR/Tn1fEv8RqKgAcL/+YA4RWvzQKyTNZ9w=;
 b=WPBluaq3SPG/Dhz8aQhtu5tFpohF9vzD64SaaHiM33WuB828KbNWUKPK
 WOpHcR0JYxX3ZK/e3fdhExR84U1bEgvivYw5C4UZuDB6pcyyyo7YIBiVF
 uV8j1aqlXZSTzf9/z+F76VgZfIS8v5tswpaE9ZXcAxKCRzD+w7ejuKX+J
 S9zaGIYK4XCNAksSLynwG9UNKPL5S2dAHKc1GAsx6Wpvp1tdFU5BkoWdM
 tJiucsabcz5MCxiEk1kYeXMx2D3Wi+PFqwlX80BHH0WSRwY9qV0V70Ya3
 04PrpOV6FPc+dlVT34tKeHDZJRAytCPFqXr8obQElKmLh8fq9WlNzCy8W Q==;
X-CSE-ConnectionGUID: SlZi1lo3Q0eZM60jyCS3bQ==
X-CSE-MsgGUID: GiuhLATVTCaQXlrb7f4B/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63226473"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="63226473"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 01:46:13 -0700
X-CSE-ConnectionGUID: UMvAYdpKTw6DySmNRctSAA==
X-CSE-MsgGUID: 6nFS+WDQQYSYCdMiD1y78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="255755574"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 01:46:11 -0700
Date: Fri, 27 Mar 2026 09:46:09 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 2/9] drm/i915/casf: Make a proper hw state copy of the
 sharpness_strength
In-Reply-To: <20260326223139.19116-3-ville.syrjala@linux.intel.com>
Message-ID: <2cb8acb6-bade-7b36-df13-455f66c2efdb@intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
 <20260326223139.19116-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1610796245-1774601172=:330621"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1610796245-1774601172=:330621
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 26 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Make a copy of the uapi.sharpness_strength property value in our hw
> state. This is how we deal with having proper state for joined pipes.
>
> Cc: Nemesa Garg <nemesa.garg@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>

BR,
Michał
--8323329-1610796245-1774601172=:330621--
