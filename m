Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46360FF886F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 12:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C1B10E68A;
	Mon,  4 May 2026 12:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=panix.com header.i=@panix.com header.b="kGIXSncC";
	dkim-atps=neutral
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB5910F645
 for <intel-xe@lists.freedesktop.org>; Fri,  1 May 2026 23:23:31 +0000 (UTC)
Received: from [10.50.4.26] (45-31-46-51.lightspeed.sndgca.sbcglobal.net
 [45.31.46.51])
 by mailbackend.panix.com (Postfix) with ESMTPSA id 4g6nCk65VNz4Xbq;
 Fri,  1 May 2026 19:23:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1777677811; bh=vCsgPt5FzI68qFgzA5x7Fij+v13ZuGX0JIAuQDB3Luw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=kGIXSncCyFuoJlGE0wlnE9TSuGmtnYGbX8gOi3zR0tMs2XH8jZSavrLs+pw86+vBN
 F3V06toV4LXQl87MYyLl4bdbK6w9z7k8nMVJVJySGqQcJPh8a1FuvMyEgfflNTLhGK
 3SYuBLyU2Vixf41V51r8PTuwra4KtguZ10dge5T4=
Message-ID: <faa7d61c-7422-4127-af2d-a54e7b95b547@panix.com>
Date: Fri, 1 May 2026 16:23:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PATCH v4 0/6] mm, drm/ttm, drm/xe: Avoid reclaim/eviction loops
 under fragmentation
To: Matthew Brost <matthew.brost@intel.com>
Cc: airlied@gmail.com, intel-xe@lists.freedesktop.org
References: <20260430191809.2142544-1-matthew.brost@intel.com>
 <20260430191809.2142544-3-matthew.brost@intel.com>
 <f25f27a1-bf09-44bd-9b37-49f159d82d6a@panix.com>
 <afUGSmS+jNPP8O5v@gsse-cloud1.jf.intel.com>
 <1bc0b1a7-a01f-4dc2-ad7a-3a05f975331e@panix.com>
 <afUWr74J1OVdcwGZ@gsse-cloud1.jf.intel.com>
 <afUqKwUnyfz1WbPh@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <afUqKwUnyfz1WbPh@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 04 May 2026 12:43:10 +0000
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


On 5/1/26 15:33, Matthew Brost wrote:

> Looks like a simple accounting error in the shrinking path. Here is a fix
> [1] that seems to work for me.

NGL, I lucked out with this error; I wouldn't have tracked down your 
patch series if I hadn't started looking at the Xe driver 'cause of that 
huge GPUActive value, rightly or wrongly- I was about to begin the 
potentially-painful process of un-merging the last DRM/Xe series from 
Linus' master (the thrashing doesn't happen in 7.0).

-Kenny "So ... thanks, Dave! :)" Crudup

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA

