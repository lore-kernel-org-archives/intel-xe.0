Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660C7D6ED02
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 10:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FEB10E11C;
	Thu, 21 Nov 2024 10:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjfoFUZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1A010E11C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732186391; x=1763722391;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vBjc8pp7QeaOlJVJMuXxy6JmVZLSm/GCXSEBxSyWRWg=;
 b=CjfoFUZ2LA5VgJsU8k3aDmd1EHnAx7D3aam1M8IU6BYRO2VK3xrKNnsP
 qR/niJfoO8SRsTT21/uYeschzpT5+L8RRVRYOwHJexlS0s33mw3QwYQHn
 2QL/xMV3g1SaUw8g9dGQgdXIoA1MUkVF6toTWd9SAJGEmKo8MbT+JnPBq
 b6ZjyrMaj8AGffvOK6C+RQafN/MTAdCn++JaMbtT3iTdkTTGwgtsM91oN
 UMsb6a8kXZANVALmk0PlPpTIQeqtReGxgWElrlXAcPjYBRF0GVysLsD9s
 T6Q5fv7sj/JJDeW/9djMkk/UUL3Sa6a2HgaFSMLHEunLK30CnaPoF1oyo w==;
X-CSE-ConnectionGUID: eX9MCt2ERJyZNWIC2wKB+A==
X-CSE-MsgGUID: qG3Q1bj1TDm7RFdQHgcJMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32537462"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32537462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:53:11 -0800
X-CSE-ConnectionGUID: waWAgeIWT+GcE3FPZBjehA==
X-CSE-MsgGUID: /aiC4zDKSuWiftqrIa2Qow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="127743738"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.95])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:53:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, ryszard.knop@intel.com
Subject: Re: [PATCH] drm/xe: Sort again the info flags
In-Reply-To: <gh2z4erofoxvb5npgoopc7cq7b32erdfxeqztroseyqywmel5o@fc6r37gczlpk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
 <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
 <pma4bikew4wnxhs2nczdzbbpz2yt77pvoy5xdxq23sg5cw4e3n@aypm5hztxb2v>
 <87wmgy14oe.fsf@intel.com>
 <gh2z4erofoxvb5npgoopc7cq7b32erdfxeqztroseyqywmel5o@fc6r37gczlpk>
Date: Thu, 21 Nov 2024 12:53:05 +0200
Message-ID: <87a5ds26zy.fsf@intel.com>
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

On Wed, 20 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> IMO we should turn all these "checks run on the build machine" rather
> than "checks executed on the target hosts" part of the hooks infra....
> because that is much more visible than scripts hidden inside the CI
> pipeline. And then people can even run on their own machines.

Going on a slight tangent, thinking aloud. Could we split the load more
between running on target and running in, say, qemu? Like, there's no
point in running some of the drm selftests on each target host. And
could we move more towards splitting igt this direction too?

BR,
Jani.


-- 
Jani Nikula, Intel
