Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC01C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 13:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856A10E7DC;
	Tue, 14 Mar 2023 13:14:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD0D10E7DC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678799651; x=1710335651;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V2GDvHEpztn81ofIEHqB4r77eocYv8v3wx/mTxP3qNI=;
 b=MmY6H9F5hQhmnJhvJHhVXBn0s41DUWU97RZex9/twVl3q+pQ9yUQqTJA
 a4Deo4kwt2vDR8pbD0LYtOP6cCpDams2C29tlvThRwulPOKXB13m1dV3w
 4zg3yMzIFMTdypnZJUxNgChhuzquaopiEq/SDD4/QtmdhqA/lFT9hO1/p
 qEU/CIjHcHFjHSNZwlAx7jmFzad/SEkvP5qu993I1pJm7WG7UCuzAQ82B
 rmhqmQhvjP1aBW0kkdUBK9NrxkpK9IYdcf3hij/abH9VWnZSZo1b/UgRi
 0VlI2fDzLHTReQ997WZxewY+koErgx/eF/WCFk5+I5rCtxw6G7BW7F+GO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334901200"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="334901200"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 06:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681417967"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="681417967"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO [10.249.254.202])
 ([10.249.254.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 06:11:02 -0700
Message-ID: <661577fa-99c0-748f-ff98-57c9381910a9@linux.intel.com>
Date: Tue, 14 Mar 2023 14:11:00 +0100
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

Thanks for reviewing,
I briefly discussed this with Matthew Brost some time ago, and he was OK 
with changing this AFAIR,

If we can gather some solid performance data that shows waiting for a 
while for the fence to signal is a better choice, and also whether we, 
in that case, should spin like mutexes or go to sleep, we could easily 
change this again.

/Thomas




