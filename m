Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47831C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 06:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA54110E121;
	Mon,  3 Apr 2023 06:08:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3858A10E121
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 06:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680502131; x=1712038131;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hYiRoYNPMDAEzr3U1eo5pDrbUIR51dJ8cwh+5LDaRCo=;
 b=fdhr24tltj+DNWSK2yDVXCZJLAFL/1cAma8kXwlU35b4O42Qs2lU9SiZ
 hTUNwD5IyeUCN/hRe5KZWFcxMm9ru258ynGHrQvXveY4XJYTGLbYx+8aE
 Fc/dtGP6nwfMYMLH4xqzYbguykvgeQsjCPqRDLVG3JVfZS75Ek9r89bzQ
 kLMUlCAPDY7rR2k4RPvDoVyCcclAWEDJab1wOmuraOtlD7AuOJu+tZOLx
 iAcRZyyayJatPQr9fPE1ZLVpjnf9d6yOaMT1QOiho6FZl2OID2MTLCarr
 EHbRx01RP7KUyCxH+nPhW1wDYC+ccXjPG34bh7qutMr7BKJeuoCh9SM+Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="339314450"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="339314450"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="829435728"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="829435728"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2023 23:08:50 -0700
Received: from linux.intel.com (unknown [10.252.28.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1CE23580C4C
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 23:08:50 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjDN1-000Ruc-20
 for intel-xe@lists.freedesktop.org; Mon, 03 Apr 2023 08:08:47 +0200
Message-ID: <373f5f5f-5568-58cb-bdce-5733f6cf8c7d@linux.intel.com>
Date: Mon, 3 Apr 2023 08:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: intel-xe@lists.freedesktop.org
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <167943651434.18679.13280164790202879090@emeril.freedesktop.org>
 <20230331151415.khx4flgdsxeldz4d@ldmartin-desk2>
Content-Language: en-US
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230331151415.khx4flgdsxeldz4d@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Unit_tests_for_rtp_and_GT_wa/tuning?=
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

On 3/31/23 17:14, Lucas De Marchi wrote:
> On Tue, Mar 21, 2023 at 10:08:34PM -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: Unit tests for rtp and GT wa/tuning
>> URL   : https://patchwork.freedesktop.org/series/115463/
>> State : success
>>
>> == Summary ==
>>
>> === Applying kernel patches on branch 'drm-xe-next' with base: ===
>> commit 1ae4dd9e82429e075aa7121404b06ce170da5848
>> Author:     Matthew Auld <matthew.auld@intel.com>
>> AuthorDate: Tue Mar 21 11:44:07 2023 +0000
>> Commit:     Matthew Auld <matthew.auld@intel.com>
>> CommitDate: Tue Mar 21 14:03:29 2023 +0000
>>
>>    drm/xe/buddy: add compatible and intersects hooks
>>
>>    Copy this from i915. We need .compatible for vram -> vram 
>> transfers, so
>>    they don't just get nooped by ttm, if need to move something from
>>    mappable to non-mappble or vice versa. The .intersects is needed for
>>    eviction, to determine if a victim resource is worth eviction. e.g 
>> if we
>>    need mappable space there is no point in evicting a resource that has
>>    zero mappable pages.
>>
>>    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>
> we will probably need to change this format a little bit. Now `b4 am` is
> complaining:
>
>     ! Trailer: Commit: Matthew Auld <matthew.auld@intel.com>
>      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
>     ! Trailer: Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
>     ! Trailer: Reviewed-by: Maarten Lankhorst 
> <maarten.lankhorst@linux.intel.com>
>      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
>     ! Trailer: Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
>
> ( it would have been worse if it would add the r-b/a-b )


Well, b4 will complain if the format is not the one provided by:

     $ git log --pretty=email

or:

     $ git log --pretty=mboxrd


Regards,
Mauro


