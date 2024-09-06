Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839C7CE7AFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 09:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98210E9E7;
	Fri,  6 Sep 2024 09:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrW/VPeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14C810E9E4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725616363; x=1757152363;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7gdg7kSbfFGeBZMD6dg5gPFbXL6dtKVBssykkWRcUMk=;
 b=LrW/VPeMaffze88f9HYX8rzaou0RrUXOFRwgd2dpEY2pdb23Rj/Qy78Q
 zan/qdlYQF9zpu2heCiE6Qj74Qlpib5Pwx6dcfz+Ma0uUS6LmrRxJzRDM
 q0ya8X/G1sOFfac3O3qrRNWa8JR0rKyK20oXuXlO5l+SiQGbYuLs1X81k
 jRcp0/NVsu+kyohlZusmmWnHIZbJsIFLxhQ41182ca4lbHB/wUZM3MRA2
 LQ+qEaJhAuT55CFV+EcCAha466Ynp6p1jtU6EbOs9yLSfir7yi6lKrNNZ
 dB6C4ewN4hS9edWx7XMp+h4L6bLeoqlMmQdEGgJbGKDEXQEBZawr1r3he A==;
X-CSE-ConnectionGUID: +GBXSSw2ShKJrTCsExIAxA==
X-CSE-MsgGUID: WtxgxkOiQNCdzkf5GGCI9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34966690"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="34966690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:52:42 -0700
X-CSE-ConnectionGUID: EtucUGQIT3WXDDWrnqTifw==
X-CSE-MsgGUID: qlm5T3jHTuSicwfqTTgaKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="70710693"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:52:42 -0700
Message-ID: <3cf1bdff-3abe-41b8-9078-c4fc5607f3e7@linux.intel.com>
Date: Fri, 6 Sep 2024 11:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/xe: Implement device shutdown to make kexec work.
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <87frqeovgq.fsf@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87frqeovgq.fsf@intel.com>
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



Den 2024-09-05 kl. 19:34, skrev Jani Nikula:
> On Thu, 05 Sep 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>> Testcase:
>> kexec --reuse-cmdline --initrd=initrd.img -f vmlinuz
>>
>> Because we don't shut down xe correctly, we cannot reload xe afterwards.
>> Implement device shutdown by performing a FLR, then we can load the device
>> cleanly again afterwards.
> 
> Maybe a silly question, but what's FLR?
Function level reset. It resets all the resources on the device, so display, all gt's etc are all turned off.
It's far faster than resetting each component separately. And it even works if display is the cause off a panic
since no locks are qrequired.

Cheers,
~Maarten 
