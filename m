Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E72C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 18:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952BF10E5A0;
	Mon, 27 Jan 2025 18:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsQMALIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC91E10E5A0
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738001149; x=1769537149;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w3BkVpSEOH6m3ei7NdzygGl8Zekf1UGURyJiQc8/W4k=;
 b=UsQMALIqbjQlfYgUIuVrE3sVIlU8uWUI8AfXeW5gOV5yMAPN4x7NVydw
 +sS2ocS2cgUgZfY7leDcC7ucdS8hphAEYYHX9jhfgra0ZTBNWSYvt5CdU
 Q7hx8xm27LdoW8y923tTM46WHPo6hwmLDDPj/XJV2uYrPzk9p/NbOPain
 /OQCIh0PSRndMQ4CmpX0gzjDMwFurYD+V2axHU4xNlAX7Jw9w4fLMe+XP
 kNH9QrRXcezTkoxUV9nzwC7fMvNwsxaZfSEI5M5WfcsSH2eBzsQHu2QMr
 vYmnR+HlEynf265biog74WLhXT95i6TNK3FbP94u0w49GxUyp3UFEJoE0 w==;
X-CSE-ConnectionGUID: yD+QFzH4RTOtjS/BN2b/DQ==
X-CSE-MsgGUID: wFgTtkZUR6+BObOoyhd/zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38381836"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="38381836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 10:05:48 -0800
X-CSE-ConnectionGUID: KVdxREjYQ2mz+fRQt7jq5Q==
X-CSE-MsgGUID: yfDQHaT5S2SR+ivGEu48SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108297257"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 27 Jan 2025 10:05:46 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AD4E92FC56;
 Mon, 27 Jan 2025 18:05:45 +0000 (GMT)
Message-ID: <27108b00-20ad-4064-a79d-622e520ec4a4@intel.com>
Date: Mon, 27 Jan 2025 19:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
 <838c976cbff003ce7b85d3dbf127f26d0d3e0979.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <838c976cbff003ce7b85d3dbf127f26d0d3e0979.camel@intel.com>
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



On 27.01.2025 18:07, Summers, Stuart wrote:
> On Sat, 2025-01-25 at 22:55 +0100, Michal Wajdeczko wrote:
>> Since the GuC is reset during GT reset, we need to re-send the
>> entire SR-IOV provisioning configuration to the GuC. But since
>> this whole configuration is protected by the PF master mutex and
>> we can't avoid making allocations under this mutex (like during
>> LMEM provisioning), we can't do this reprovisioning from gt-reset
>> path if we want to be reclaim-safe. Move VFs reprovisioning to a
>> async worker that we will start from the gt-reset path.
> 
> Admittedly I don't fully understand the PF restart flow here from
> userspace. Is there some race condition we need to check for whether
> GuC completes base configuration before the PF config comes through? Is
> it possible we can get into either some deadlock between the native
> init and the PF init or start running content on some engines in native
> mode before PF completes?

Even if due to a race we start running PF content on engines before we
finish GuC reconfiguration from native to SRIOV mode, then that content
may just run a little longer than before a reset, due to initial
"infinity" execution quantum or preemption timeout settings, which in
SRIOV mode were likely reconfigured to a smaller values.

Also any race with new provisioning requests from the user space should
be harmless since during a PF restart we will resend whole SRIOV
configuration, including any latest changes done between GT reset and PF
restart.

- Michal
