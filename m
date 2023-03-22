Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9975C76196
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 17:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C5110E116;
	Wed, 22 Mar 2023 17:42:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09A10E116
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679506944; x=1711042944;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2yYWMPePzFFRVu3MsJPnHjregAfPUZ7YzzK3dA3hegs=;
 b=LPFayUWOBJaf61uUYTwGvWTyhdsEdaUJSeqwRUkA0Of4ra0F2ODzf7kG
 A8aNGg4J8PggJ91Yxmt9KDhRrV6SK2kLNNm4I8gS/xG5RvR4gUV1xVBkY
 amxucwP9wYFUzYtpF4W4C/qcM6vf+BEaWnGefAN3I+auYPCTV39V+UvB2
 SG13aAjRrTKYx50+h6gpmgTomZQcFOB06s/bfg0aESNBxycCFi4Q7Gh4Z
 DhrRehxEHuiTyMmxWyqrv2WWTVm1eC7VswPGzCYGWExo1v/vKQmjCxlT7
 j9SYEYz2Bl8I/h6wYQM9MZ5XpWbUKuayIwM/AX2nm6oiAFJMalDNJd1HM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339323336"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="339323336"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 10:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="792664566"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="792664566"
Received: from ftbyrne-mobl.ger.corp.intel.com (HELO [10.252.26.151])
 ([10.252.26.151])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 10:42:21 -0700
Message-ID: <8c2ca820-de6d-6444-8520-a139b84ffa3b@intel.com>
Date: Wed, 22 Mar 2023 17:42:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: intel-xe@lists.freedesktop.org,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230322165733.309447-1-matthew.auld@intel.com>
 <167950609839.13423.8136608844625182728@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <167950609839.13423.8136608844625182728@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_Revert_=22dr?=
 =?utf-8?q?m/xe=3A_Allocate_regset_space_for_Wa=5F1607983814_unconditional?=
 =?utf-8?b?bHki?=
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

On 22/03/2023 17:28, Patchwork wrote:
> *Patch Details*
> *Series:*	Revert "drm/xe: Allocate regset space for Wa_1607983814 
> unconditionally"
> *URL:*	https://patchwork.freedesktop.org/series/115520/ 
> <https://patchwork.freedesktop.org/series/115520/>
> *State:*	info
> 
> Participating hosts:
> bat-atsm-2
> bat-dg1-8
> bat-dg2-oem2
> bat-adlp-7
> Missing hosts results[1]:
> bat-dg1-8
> Results: xe-pw-115520v1 
> <https://intel-gfx-ci.01.org/tree/xe/xe-pw-115520v1/index.html>

Seems to bring the ADL-P back...not sure if it also helps MTL.

> 
