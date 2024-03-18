Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AABC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3E910F506;
	Mon, 18 Mar 2024 09:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHLk7bt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBE810F506
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710754841; x=1742290841;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=V5/25dEO24su+/LfARKtpEqEmIdwgAwkM1g1Z+fJUGI=;
 b=PHLk7bt++jbiPRaFGlUsNBedQmg14PmdhI4MLVlr5WIb6F5Z6c7IDIZL
 yMfEyPzN1THpytVd2L/9IW22yiofNamaC1ozAZzpXEx6NK1AkcnyM1tCr
 Hz0VKaQUPLmsqzdREAolzIu0szSdU9DumNdwj9JDODXFHzTSodWDMbpqF
 7MTGVHRlxTq+WE0U9JQyLkC7d/CnvA3/4NwzM68iw3tgYGR+HYCz2+kxF
 LlvnHl6AuPk00uFbKnDvxG/rCMNRQkb/f2+GOimgA0ig//tAqbKzeK4L1
 mTJQlVa3xqj0GzfFYbGknsV+2CeOc5RORIqg7PZw0Kwzvjxm1mNJwTs3i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="8500043"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="8500043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13319987"
Received: from unknown (HELO [10.245.245.16]) ([10.245.245.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:40:39 -0700
Message-ID: <b90540c1-e315-499d-86bb-c57dd28bdc7c@intel.com>
Date: Mon, 18 Mar 2024 09:40:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove usage of unsafe strcpy
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240318091055.638-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240318091055.638-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18/03/2024 09:10, Nirmoy Das wrote:
> Remove usage of unsafe strcpy with a helper function
> to convert engine class to string.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
