Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB53EC61CE7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 07:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF6610E34D;
	Wed, 11 Jun 2025 07:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzETrk5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264F310E329
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749627356; x=1781163356;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=z8ezwKpKZec8BRa0co6hVhoTgjTZv38Pfo1jLo3P/Jc=;
 b=VzETrk5dzNRT70IuJ/4GXF+pU0rm2EEkt62Ag9yTE0KRHdsSTIOXAbmY
 R6XDWypHXOPMwDKoXhNndi6zGQ3dQCcz6JK/qJUdrMXPkss8Ci5ZoLqR+
 uG+8vzaHmcjP9p8IuZ8H478e3/qh+kRVD8zHS8NsjLP32BNNiInuLUHeV
 osieyYDr6qcdfcOsoKnNQqfwx2rF1U4WXQ+dNsTw7r1BoHHKktVMfa8T1
 EX5kEh8/tDNm7BXCtc7U9FqKR6exbo3QNKytEwufo17K2JyIi7FdR3suk
 3fWa0SVSPf3FEfywaN3eIs6S+1lEFRQ64akN1pJJ/UIJRgDC5GvJ/U0ib A==;
X-CSE-ConnectionGUID: biypnQS+TMKwJRPvsPZFwQ==
X-CSE-MsgGUID: U8FTfIGDQgSpMQfonUoUmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55423386"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="55423386"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:35:55 -0700
X-CSE-ConnectionGUID: aNqrH+YERZGo/WSIK8nGHA==
X-CSE-MsgGUID: uaCQAC52TT2vLcxjuWzNwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="151887045"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.209])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:35:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v6] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
In-Reply-To: <1e939cd3-1db4-432e-89c7-add155d67606@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
 <a0c92aa2-ed7d-41f0-8d7c-b66b36be3fa7@intel.com>
 <ff47692cc6c70d10b3e58cf68e6d70ef79ebd997@intel.com>
 <1e939cd3-1db4-432e-89c7-add155d67606@intel.com>
Date: Wed, 11 Jun 2025 10:35:50 +0300
Message-ID: <6fe7082cd28ada8a4f5d52e08512aaf3eb10ea1c@intel.com>
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

On Fri, 06 Jun 2025, John Harrison <john.c.harrison@intel.com> wrote:
> In other words, the test and the output suppression are inherently 
> connected and not orthogonal.
>
> So having extra complication to make the suppression mechanism generic 
> and unrelated to the injection test is wasted effort and unnecessary 
> complication.

Fair enough.

BR,
Jani.

-- 
Jani Nikula, Intel
