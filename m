Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B3C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 11:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8C710EA5E;
	Fri,  8 Dec 2023 11:19:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E467210EA5E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702034373; x=1733570373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wZO+042L1FRKqE+oL8KzksvlD+DD7Iv2wkqsLQgRC6s=;
 b=YG+8f4ZOHrLZ1gKGoC8LN8RFypc42wv75HNglEKkuWkSxD4mDk9HdLJL
 9Gkc7PRceXTkyhQgdkfXxf8yJye429XTY1iyprUdTy3TYHqGTvSSoVwjy
 kd7e/BYBSi3YZ8itMVxlD2zH2g2lzWL5AwQ9xfVXUfyOHYiZkdxMnvS8U
 y+xDoaqwP0wV97lOiBRh6qZjGQ+My75+mNTPzvNZ3Uo0X2sUniMwCw0iA
 DU5nwx71HqL4KCcKFtNJ7ZT0yl+Zlz9Iv+FlLph1TEvV0xci5oPxA5kpF
 RcAbq5RzASPbzpOaeWAUVu1Hiui3gUThYINvzbfa9hCBx8eaBH1QwLqSa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1457977"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1457977"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103538024"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="1103538024"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:19:31 -0800
Message-ID: <eadb0ae0-fe72-aba0-9196-217bdcef8468@linux.intel.com>
Date: Fri, 8 Dec 2023 12:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/xe: Replace the scratch pages with NULL PTEs
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
 <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
 <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
 <20231207163213.GZ5757@mdroper-desk1.amr.corp.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207163213.GZ5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/7/23 17:32, Matt Roper wrote:
> On Thu, Dec 07, 2023 at 05:25:01PM +0100, Thomas Hellström wrote:
>> + intel-xe cc.
>>
>>
>> On 12/7/23 17:17, Lucas De Marchi wrote:
>>> On Thu, Dec 07, 2023 at 04:44:23PM +0100, Thomas Hellström wrote:
>>>> Replace the scratch pages with NULL PTEs that return 0 when reading and
>>>> do nothing when writing.
>>> but don't we want to keep scratch so we can check when things go wrong
>>> and writes go where they shouldn't?
>> The argument against that was that apps that incorrectly writes to scratch
>> and then reads back the same value wouldn't notice that it did something
>> wrong, and the case you mention would to some extent be captured by not
>> having a scratch page at all and check for pagefaults?
>>
>> I admit I haven't been following the discussions around scratch pages long
>> enough to know the historical uses for it. Cc'ing Joonas for further
>> discussion.
> It seems like null PTE is probably the best thing to do for real-world,
> production use.  But for developer use we might want to add a kconfig
> option at some point that brings back the scratch page and pre-poisons
> it, since that might be useful in some debugging situations.
>
>
> Matt

Hi, Matt.

Sounds like a good idea. IMO, Let's add that when we get a request for 
it for debugging purposes. I'll leave the scratch page-table structure 
in v2 so it should be easy to add in.

Thanks,

Thomas


