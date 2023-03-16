Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA34AC6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 12:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF20D10E0FA;
	Thu, 16 Mar 2023 12:46:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1E10E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678970806; x=1710506806;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZCnXeHn3e4LwynbSiREK4KC0QqbQhWBjmJwaAE3WIzw=;
 b=BbEUPL4jGOBuvxi7iMH1XLSl8glQTuZ78T/qzHxS+XwF6dK/BcfH4JiT
 pCRlYOtMJ72HEqsicL6TxcoICujeVWs0WsUBd0+ZAvme+JZRtM3eUCogB
 RVh+WphyiyKMO58xv3S/CA0Js4j0P5b0GiA5gQPo83aVmd0gjT+xAkhtE
 Ompq7bJXCRORGsbMr3JZqbbLAKKJ7KTGJWYjLV6DwWtt6ZTa4uThbarzu
 JdlatMu1UX6I4Km0fm+jVVqFeyDS6nJL57WyJpi2+G8HHoYd5VSBxEhHg
 5rvzr+tZ+votw0EPdWoegpKlaFgjHeTkJACDgnjjX3VUzFygCFpIVjqs4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="402841202"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="402841202"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="682302930"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="682302930"
Received: from dekblom-mobl1.ger.corp.intel.com (HELO [10.249.43.98])
 ([10.249.43.98])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:46:45 -0700
Message-ID: <edca84b3-753a-1f1b-8ddb-b71286c1da1f@linux.intel.com>
Date: Thu, 16 Mar 2023 13:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
 <CAM0jSHPC9JOdBKw0JV-LUh-4SdQKi9n0_HHdbHT3aE4Lq0QLeQ@mail.gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHPC9JOdBKw0JV-LUh-4SdQKi9n0_HHdbHT3aE4Lq0QLeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix Alderlake-P and DG2 display info
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


On 2023-03-16 13:21, Matthew Auld wrote:
> On Thu, 16 Mar 2023 at 11:08, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> DG2 has cdclk squash, without which we calculate the CDCLK wrongly.
>> Alderlake-P is LPD, not gen 12 display.
>>
>> With those fixed, display should work on both and all problems that were
>> uncovered by testing done from rebasing are fixed.
>>
> Can we add:
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/210
Yes. I 've added it and pushed the rebase to drm-xe-next.
