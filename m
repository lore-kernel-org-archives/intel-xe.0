Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F40CEE32D
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 16:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246E110E781;
	Wed,  9 Oct 2024 16:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXVBvRpm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079110E781
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728491625; x=1760027625;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=I+kWVC8OxccZIQP/0SGNgXUntgCo4M6rcRY9pCiLLz0=;
 b=eXVBvRpmaGzaYNpDESf6QafIkcpp1ODW6R3PyE1Nr30ZynYDb7IjGvMW
 VuHXE7pTFYwgEHWuvNHbR0D5Vob6aCfeDqonhY7HQ68f602LoPmPxKpZf
 VA3Qz96QEh/IGkUnjCvLFb9Hr6s7o9UdBwIXuYi2BBNIKpx5HgUBwzPBV
 YGqe699Mn7WWEYPDeEZOOLYPz6vu2Ymgs74xVevjMzz+7wX/bF8oUNLIC
 0EJEG9PZHvHAEFDfcUyw+Ouq1s1PSN55ixoANU80Vt5zL+cK58U7mO90y
 /CJtJOAxSpUCja1eG+yh5CsjDfMqw7l42I3aki1pc0Tq0mk2MLBUhQqh9 g==;
X-CSE-ConnectionGUID: 9PBckYM+TsCzkNnlqu/qmQ==
X-CSE-MsgGUID: IpSKqzKxSFGurONFcL5n0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15423686"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="15423686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 09:33:44 -0700
X-CSE-ConnectionGUID: eXjoB0fDR6CXizJYrt/Yuw==
X-CSE-MsgGUID: 6zasEmNHSHK+/58T9GkbCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="107071118"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 09:33:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: xe generated headers (was: Re: [PATCH] drm/xe/ptl: L3bank mask
 is not available on the media GT)
In-Reply-To: <jyqqbtftdd654f3zjdaspygedv5lusi4tmzpnk3dqlylmmbd6v@mehvg5dd56zu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241004212037.1431184-2-matthew.d.roper@intel.com>
 <878quxa3sg.fsf@intel.com>
 <jyqqbtftdd654f3zjdaspygedv5lusi4tmzpnk3dqlylmmbd6v@mehvg5dd56zu>
Date: Wed, 09 Oct 2024 19:33:38 +0300
Message-ID: <87cyk98cd9.fsf@intel.com>
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

On Wed, 09 Oct 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> I like to keep the "generated" in the name since it's then clear
> that file isn't in the source checkout, but one should look at build
> directory instead. And even if someone mixes the build and source dir,
> there's no possibility of a clash.

Ack.

> I view this differently than what you are writting above. There is no
> "system/global" includes in the kernel. There are only the include paths
> passed to the compiler and the only difference between " and <  is that
> for the former the compiler will *first* try to find the file relative
> to the compilation unit.

I think generally the headers under top level include/ are included
using <> and the rest using "", regardless of which paths were passed to
the compiler. In that sense, they are the "system/global" includes, even
if that doesn't match the conventional meaning.

A little bit of git grep suggests <> outnumbers "" for includes in
include/ by a factor of 100x.


BR,
Jani.


-- 
Jani Nikula, Intel
