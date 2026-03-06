Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DF6FCC062
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 19:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45FE10E05E;
	Fri,  6 Mar 2026 19:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="2QFV/qb9";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7406110E05E;
 Fri,  6 Mar 2026 19:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=OmHM+KnL43Ma2pC7tvmsDtqgnqZz0DSdLjwo0zHMF70=; b=2QFV/qb9Uj3Hm1XPrVhiSRtQ7B
 JTFiKH3DwrIcnrWSixqDlOgkwl6WnzhlLtyJsoT8aDHAV2jNVz8UOfXQUIOZlKmbIm4ojJHXVmgET
 X1XIojGGbWgyC1KxT4gZFtG1lkdROnvvOloQl4H4Pwhhm3VI+8C43tLbS5j3tNf276Mqv3rQdeaTM
 J1ynsvc/tE+LJUNCoMZHSdkvz10AG4e5I+bnw8rPqIYTnXJl171ysBqgEFQ7jjihWvrpWel1uMv9x
 WXNbbZH7JOzg71q1LX77AA61s1/Tr9It6/tMvdFkZL0hvv56E3DhiJ/32OLi+VmbzcUBtf1ZuRcK9
 lnLteYPQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vyb1P-00000004Pdi-41M8; Fri, 06 Mar 2026 19:39:40 +0000
Message-ID: <c1f471dd-778f-4c9c-821f-faecfcaed62b@infradead.org>
Date: Fri, 6 Mar 2026 11:39:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] iopoll: fix parameter names in kernel-doc
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20260306063829.2059375-1-rdunlap@infradead.org>
 <7b4ab61091b0bd032e129e46237f707d2448ca08@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <7b4ab61091b0bd032e129e46237f707d2448ca08@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 3/6/26 2:31 AM, Jani Nikula wrote:
> On Thu, 05 Mar 2026, Randy Dunlap <rdunlap@infradead.org> wrote:
>> Correct the parameter names to avoid kernel-doc warnings:
>>
>> Warning: include/linux/iopoll.h:169 function parameter 'sleep_us' not
>>  described in 'read_poll_timeout_atomic'
>> Warning: ../include/linux/iopoll.h:169 function parameter
>>  'sleep_before_read' not described in 'read_poll_timeout_atomic'
> 
> I think the right fix is to rename the parameters instead. They're
> passed on to poll_timeout_us_atomic() where the parameters are called
> delay_us and delay_before_op, emphasizing that this is atomic i.e. no
> sleep.

OK, will do.
Thanks.

-- 
~Randy

