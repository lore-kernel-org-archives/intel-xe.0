Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2000C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 07:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C3F10E340;
	Tue, 13 Jun 2023 07:31:19 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839ED10E340
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686641478; x=1718177478;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RQfYClw9uslW9abdLo+8juP+6sXDNWI/fchVsYbne+4=;
 b=fSPww+rKnJsDDjHEDjaJqsEy+1IbBu5Pu7LBvVvpGoSH8Q7RzzZY7OIc
 zFVD/leAOjRh5PWgqcv9dwJ7DHr/yC8vmCgLOoRo/LPFY9a/D9Guo3WkX
 SQxOZF0rRRIc3OoPwcs+dXhSidlE67p7qMXFLsriBQPCw7CsqwhYWj93h
 +MycqWQA1y9dM39J3yTMZ1+A8DqMfGdRxIin+3v8pWjZusuWAU30HK2Pj
 t3RRBLL1sHeAYsKjgvCauo1dxGp8oLCuPrt861gTtnmqAugAXRxrU859i
 x1dupy36lbvMch2FzGO7nF3lal3rA5N0icWPUkc/oZ8O+Uz9IWml2sN0T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361623730"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="361623730"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 00:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835774987"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="835774987"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.22])
 ([10.249.254.22])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 00:31:02 -0700
Message-ID: <649e8484-08f4-2c2f-fd19-de3839025fac@linux.intel.com>
Date: Tue, 13 Jun 2023 09:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC 0/3] drm/xe: Add preemption timeout config
 options
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Niranjana

The plan to handle non-preemptible hardware with Xe is either to use 
faulting or to pin memory and use CGROUPS to control the
pinning. So when that is fully flushed out, there shouldn't be a need 
for these changes?

/Thomas

On 6/10/23 02:12, Niranjana Vishwanathapura wrote:
> Allow preemption timeouts to be specified as a config options.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
> Niranjana Vishwanathapura (3):
>    drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>    drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>    drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY
>
>   drivers/gpu/drm/xe/Kconfig         |  6 +++++
>   drivers/gpu/drm/xe/Kconfig.profile | 40 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_engine.c     | 30 +++++++++++++++++++++-
>   3 files changed, 75 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>
