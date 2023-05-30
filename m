Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0B5C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 14:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8F10E161;
	Tue, 30 May 2023 14:41:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D59B10E161
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685457670; x=1716993670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=V1jx0A69exymt/j+jrSBNdc10Sa8359keH6zP2XCkzY=;
 b=JjGwsmYmAIbMJkZZeYatdIpBiK6lBAm0f9VJHzoOs9g8dxCIx8mZnqaS
 IAMwUonrf9Ph3TOdzfwqfgxb+bXK2jXQ+TjxSo++nstGHSEkOV0bkEbRu
 oic6p3W/QlD+niYbQ9eixalHdBB+xl40fwdjUr5/4TDyCjv20fqXtMfEB
 4FBI/b4spZeE6v4JWelYCcckvvpuZW3hcM68S73p9+s4BEkwlVl77/V1X
 JQeGGSCWf4lEGuNyWeBTn8hj88gDteQLHP6fLB7R84HZYzA4xZJXOw9nn
 psczHTcwmTvNrQcwSQWSWjml2BX/vGjKIKX5b7feZs9+CjiiMlf/o6T+J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441292093"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="441292093"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709667060"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="709667060"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:41:08 -0700
Message-ID: <6cd54420-f374-c796-940f-807ddadd6f43@linux.intel.com>
Date: Tue, 30 May 2023 16:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-3-maarten.lankhorst@linux.intel.com>
 <0ff025da-9d8d-d7bb-80a1-f7623578e210@linux.intel.com>
 <678c272b-97dc-f556-4403-96c2f895fa9b@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <678c272b-97dc-f556-4403-96c2f895fa9b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Add debugfs files to evict
 everything.
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


On 5/29/23 15:35, Maarten Lankhorst wrote:
> Hey,
>
> On 2023-05-26 15:02, Thomas Hellström wrote:
>> On 5/26/23 14:10, Maarten Lankhorst wrote:
>>> Easy for testing, when you just want your BO evicted.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Do we have some documentation somewhere about what our debugfs entries are doing that needs updating?
> I've not seen any documentation for those specific debugfs entries.
>> Also can we evict stolen memory?
> What is useful to evict? I think all of our users of stolen memory only use it pinned.

What I meant was, assuming that we have evictable stolen memory, can 
xe_bo_move() handle it properly, even when accessed as system /ggtt? If 
not, should we ditch the debugfs entry for stolen for now?

/Thomas



>
> ~Maarten
>
