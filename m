Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CE2C48297
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9210ED37;
	Mon,  5 Feb 2024 13:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfbB0DQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66910ED37
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707139859; x=1738675859;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0fZSAiy58kM/4/z0SkK1YfCKWrH9WVg4KfmmEGB/MGI=;
 b=HfbB0DQYfNi9lDE4sLXnJMkfqMHkm4hbSBM4WQcbTV/Y/lG0s28S7NCN
 IOS05Ikk7CM+MIxqek4c8Pd4Ppj/Z7hLzaIXTaffz2TsZ3Z76EIB6ekri
 b8QjMGztb30zF6qQtXmHS2a5wRiPy0E6mY+pgLTzox3c6VuA1nyuD8imZ
 aRsGw0fdQZ38UDr+x+kAxr7TxNukZvIOwtvxlokaQOiMSQdNqTnvXooOV
 cy3vEFMjUfe1lmvfVUykXi603MIzNdzIDtTC28+4vEuLnCQPqZ7E9jcMK
 ONiG2cIMpGkuWeTLDnZL2QFYbqvTiHWqt5gKvoe/w2r0PxPML65v3m2zP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4315961"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="4315961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="31803798"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 05:30:58 -0800
Message-ID: <71909839-f4c8-4a15-8548-5fcf61aee8b0@intel.com>
Date: Mon, 5 Feb 2024 13:30:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 28/34] drm/xe: Remove mem_access from suspend and resume
 functions
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-29-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-29-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> At these points, we are sure that device is awake in D0.
> Likely in the middle of the transition, but awake. So,
> these extra protections are useless. Let's remove it and
> continue with the killing of xe_device_mem_access.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

