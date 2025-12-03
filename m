Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988CD2A532
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3410E9BD;
	Thu,  4 Dec 2025 20:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aaront.org header.i=@aaront.org header.b="gV+u0FGC";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="W8kydWPc";
	dkim-atps=neutral
X-Greylist: delayed 796 seconds by postgrey-1.36 at gabe;
 Wed, 03 Dec 2025 19:44:58 UTC
Received: from a8-22.smtp-out.amazonses.com (a8-22.smtp-out.amazonses.com
 [54.240.8.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49FD10E197;
 Wed,  3 Dec 2025 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zp2ap7btoiiow65hultmctjebh3tse7g; d=aaront.org; t=1764790301;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=bgsZJdi5ylSbVlwh4WmpdyyjmV4T9AWsNENCPRx3zuQ=;
 b=gV+u0FGCsrTgSUPmyG3lYCIXANvyaXrVgfcS1Wx0Ymo5GZ3guZ+zYAhGgiIVOjoM
 11YlLzOjboEtSBIywfIhzObk3Eixrk6DWhFocLiak+hXkUoUUphiIt2IS94jY+n/lBH
 D8MC6GmQCsBzusl7gGH0goSXd6OhITsFaYYAiP0EK6WNHvf8xn3BpDv8HDPCgwbmkjZ
 WQS5SRQAW53fnSAYGEzz19yvEdga0xI1xBPEFdvWGhsgxaJP8HNp6SJjY3DPFR9pYFF
 7uPxpW6z7voFeXDI4Aiy1s2qSyOzuBE4z/emOsLeX84yWXkEr78O/chJqi6hDzOfFbs
 ytKjXN72Wg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1764790301;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=bgsZJdi5ylSbVlwh4WmpdyyjmV4T9AWsNENCPRx3zuQ=;
 b=W8kydWPc827KUEi4eLsnEF4rWVzPceQDDYy0R9FzVEank2e8wbfk4kaAJgYGSuxe
 ClYZSo0ZuGx4r7ilqatdx+OlX+NLsZQYZWYUrWYR5zGmzqS/aVpmtMSt2Is2alb6CW1
 5vUNc+RNq89E5PzpNgkTNfDqPRl40N/mRQDKiauM=
Message-ID: <0100019ae5b2f1b5-f3c0c4aa-9978-4076-9e6c-f7b276594d6e-000000@email.amazonses.com>
Date: Wed, 3 Dec 2025 19:31:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION on linux-next (next-20251201)
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, 
 "Saarinen, Jani" <jani.saarinen@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a22915de-fa1b-40bb-9950-8a8552466225@intel.com>
Content-Language: en-US
From: Aaron Thompson <dev@aaront.org>
In-Reply-To: <a22915de-fa1b-40bb-9950-8a8552466225@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.us-east-1.8/56jQl+KfkRukJqWjlnf+MtEL0x/NchId1fC0q616g=:AmazonSES
X-SES-Outgoing: 2025.12.03-54.240.8.22
X-Mailman-Approved-At: Thu, 04 Dec 2025 20:29:17 +0000
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

On 12/3/25 01:10, Borah, Chaitanya Kumar wrote:
> Hello Aaron,
> 
> Hope you are doing well. I am Chaitanya from the linux graphics team in 
> Intel.
> 
> This mail is regarding a regression we are seeing in our CI runs[1] on
> linux-next repository.
> 
> Since the version next-20251201 [2], we are seeing the following regression
> 
> `````````````````````````````````````````````````````````````````````````````````
> Starting subtest: load
> (i915_module_load:1280) igt_debugfs-CRITICAL: Test assertion failure 
> function igt_debugfs_path, file ../lib/igt_debugfs.c:121:
> (i915_module_load:1280) igt_debugfs-CRITICAL: Failed assertion: 
> debugfs_root
> (i915_module_load:1280) igt_debugfs-CRITICAL: Last errno: 2, No such 
> file or directory
> Subtest load failed.
> `````````````````````````````````````````````````````````````````````````````````
> 
> I see some other drivers also failing to create their debugfs entries.
> 
> `````````````````````````````````````````````````````````````````````````````````
> [    0.134437] pinctrl core: failed to create debugfs directory
> [    3.488263] intel-lpss 0000:00:15.0: Failed to create debugfs entries
> [    3.563494] intel-lpss 0000:00:15.1: Failed to create debugfs entries
> [    3.631076] intel-lpss 0000:00:15.2: Failed to create debugfs entries
> [    3.697366] intel-lpss 0000:00:15.3: Failed to create debugfs entries
> [    3.764351] intel-lpss 0000:00:19.0: Failed to create debugfs entries
> [    3.841824] intel-lpss 0000:00:19.1: Failed to create debugfs entries
> [    3.909492] nvme0: failed to create debugfs directory
> [    3.937845] nvme0n1: failed to create debugfs directory
> [    5.636042] pinctrl core: failed to create debugfs directory for 
> INTC105E:00
> [  177.973628] cec: Failed to create debugfs cec dir
> `````````````````````````````````````````````````````````````````````````````````
> Detailed log can be found in [3].
> 
> After bisecting the tree, the following patch [4] seems to be the first 
> "bad" commit
> 
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
> commit f278809475f6835b56de78b28dc2cc0c7e2c20a4
> Author: Aaron Thompson dev@aaront.org
> Date:   Thu Nov 20 10:26:33 2025 +0000
> 
>      debugfs: Remove broken no-mount mode
> `````````````````````````````````````````````````````````````````````````````````````````````````````````
> 
> We also verified that if we revert the patch the issue is not seen.
> 
> Could you please check why the patch causes this regression and provide 
> a fix if necessary?
> 
> Thank you.
> 
> Regards
> 
> Chaitanya
> 
> [1]
> https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
> commit/?h=next-20251201
> [3]
> https://intel-gfx-ci.01.org/tree/linux-next/next-20251201/bat-arlh-2/ 
> igt@i915_module_load@load.html
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
> commit/?h=next-20251201&id=f278809475f6835b56de78b28dc2cc0c7e2c20a4

Hi Chaitanya,

This is fixed in next-20251203 (commit d3666c1f8a31). For next-20251201 
and next-20251202, you can also work around the bug by specifying the 
kernel parameter "debugfs=on". Sorry for the inconvenience.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/fs/debugfs?h=next-20251203&id=d3666c1f8a31b7ff6805effcfedfac22454c6517

-- Aaron

