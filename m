Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4F4C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09B610E8D5;
	Wed, 15 Mar 2023 15:19:56 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297C710E8D5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678893595; x=1710429595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iuBKFpQdKJAe+CJRgKzyTfPJJgDIalQMTQb1VoC7dc0=;
 b=FBzxe0MsJfQM7Hh1gjNHKJQfirSs5LzHlPKJF0IRL3SbmZ7KGNTMIyXn
 KSoLlCiIJXdVxO4v58qehtFxP2Vx8Yo+c1yythWEaGM81zjf76eAwMXMK
 xCi2tk8zu2KMQ9LgD46SORDM34fD4lTWwacbVyLNzXCYKrHrwzVeawGHT
 YbN1ME1ZTSKox/2leu1tGaCJlWbrMCO5Ild76DNgiksUUg+HphBohdAiJ
 /bgW3B3PhGxISaPzvubFmArp/dvnT2nnVLlqaFqhlEJ6eO7XByS2Sg1oB
 kQZzU1imdsOLP9nY7pY0FOZHoQxvu7P6W5z24SMq0hEtM4bHgGLBGRrx6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402603551"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="402603551"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="672784120"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="672784120"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO [10.249.254.237])
 ([10.249.254.237])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:19:24 -0700
Message-ID: <f1dd8fdf-09cc-01bd-f4db-f2991ae77883@linux.intel.com>
Date: Wed, 15 Mar 2023 16:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHN+vy8R48HRY72ZCmmfv4LG1uMV3zBrY0GMMe5P2ADCYw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHN+vy8R48HRY72ZCmmfv4LG1uMV3zBrY0GMMe5P2ADCYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/migrate: Update cpu page-table
 updates
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 3/14/23 13:15, Matthew Auld wrote:
> On Mon, 13 Mar 2023 at 20:46, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Don't wait for GPU to be able to update page-tables using CPU. Putting
>> ourselves to sleep may be more of a problem than using GPU for
>> page-table updates. Also allow the vm to be NULL since the migrate
>> kunit test uses NULL for vm.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Seems reasonable to me, but I'm not really familiar with the history here,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Hmm, it turns out that this change uncovers a bug in xe_exec_basic igt 
(unless I misunderstand the syncobj semantics). I've posted a fix for 
that on igt-dev. With a little luck that also fixes the strange igt 
failures we've been seeing with deferred storage allocation on PVC.

I won't merge this until the igt fix goes in.

/Thomas


