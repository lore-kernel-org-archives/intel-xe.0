Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0475CE8E6A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 17:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747B910E3A5;
	Thu, 24 Oct 2024 17:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bddVjBAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B076710E3A5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729792114; x=1761328114;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=pK/B9sr5ZxPCieC7Z/QYBlEQX+2kIHitRX4AF6jkOgE=;
 b=bddVjBAWjybwRCdXGMWa8LYvErgw88V/wdw3In+32HWamnasQ/d0nx1b
 gkRIPNqPoIEAGJ5ijyT0y5ZPC9ZZ8MTNmpc3nU0YyxAoVZQ075VqnTFwS
 CODxLF7mAEWcmM7B6orPXUGQ762tvHaF2G+rNKMT2hPgx0qO8huEPPmP+
 X6b05AThZw48MP4DL0uhhQiVr5i4B7aGaM0Dvs7lXrfFTpzRZoU0fwNTr
 3XuqY7N0tc83OdTXDlCHuLS82HxAxz+3sxO0TSc2YwAdQVM9VXpxwNdtF
 tCBfNkvEldNNWT4FhEUhdkTiLRePCyrNKwoQRnWC9j0omNIwGfKk9IJlw g==;
X-CSE-ConnectionGUID: GCgQzVy0SxKdp2BeHl2R1Q==
X-CSE-MsgGUID: otag/2gDT6esI+0lV2rY8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29556059"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208,217";a="29556059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 10:48:33 -0700
X-CSE-ConnectionGUID: aAPlrKikTqm0uWUNt0yX5Q==
X-CSE-MsgGUID: ktl7TqyTRYq3v/6GgFVoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
 d="scan'208,217";a="111467267"
Received: from nkwan-mobl.amr.corp.intel.com (HELO [10.124.131.154])
 ([10.124.131.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 10:48:33 -0700
Content-Type: multipart/alternative;
 boundary="------------JhQFtRXqjTv27VA0pfCVS2IK"
Message-ID: <c717c281-ec3e-4c40-be0d-71d668d5b51a@linux.intel.com>
Date: Thu, 24 Oct 2024 10:48:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] drm/xe: enable lite restore
To: fei.yang@intel.com, intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
References: <20241017162710.942553-1-fei.yang@intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20241017162710.942553-1-fei.yang@intel.com>
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

This is a multi-part message in MIME format.
--------------JhQFtRXqjTv27VA0pfCVS2IK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-17 12:27, fei.yang@intel.com wrote:
> From: Fei Yang<fei.yang@intel.com>
>
> The lite restore is a performance improvement feature which avoids
> unnecessary context switch (flush, save and rstore) if the incoming
> context has a ContextID matching that of the outgoing context. The
> scheduling is done by the Guc firmware, so on the driver side it's
> just a matter of setting corresponding GuC_CTL_FEATURE flag.
> This is supposed to be enabled by default, thus the flag is set
> unconditionally.
>
> Signed-off-by: Fei Yang<fei.yang@intel.com>

Please ensure that the version number is included when submitting revisions.

Kwan

> Fei Yang (1):
>    drm/xe: enable lite restore
>
>   drivers/gpu/drm/xe/xe_guc.c      | 2 +-
>   drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>

--------------JhQFtRXqjTv27VA0pfCVS2IK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-10-17 12:27, <a class="moz-txt-link-abbreviated" href="mailto:fei.yang@intel.com">fei.yang@intel.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241017162710.942553-1-fei.yang@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Fei Yang <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a>

The lite restore is a performance improvement feature which avoids
unnecessary context switch (flush, save and rstore) if the incoming
context has a ContextID matching that of the outgoing context. The
scheduling is done by the Guc firmware, so on the driver side it's
just a matter of setting corresponding GuC_CTL_FEATURE flag.
This is supposed to be enabled by default, thus the flag is set
unconditionally.

Signed-off-by: Fei Yang <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    Please ensure that the version number is included when submitting
    revisions.<br>
    <br>
    Kwan<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20241017162710.942553-1-fei.yang@intel.com">
      <pre wrap="" class="moz-quote-pre">Fei Yang (1):
  drm/xe: enable lite restore

 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------JhQFtRXqjTv27VA0pfCVS2IK--
