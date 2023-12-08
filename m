Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DE3C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 15:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22CC10EAB0;
	Fri,  8 Dec 2023 15:05:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F6D10EAB0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702047900; x=1733583900;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=oWzineNy214M0h8qmObW/oO4AHhdTlsR871DWYrHIZU=;
 b=Kkr+6FDpZH/iH4aF5Q9Yue/qQYaapVDnHyp9vTyCWZH2iohAWcw3Yigl
 hk4U1uCdSbNjTCfO4ojW14AxBYqmhZKSeIiX6ihDR2As1Dt5ehYBGtadw
 QSdvby2CayI+bhUIijk0SUYeysMWqgbRFOriZYZpCpr60yxXnL8yKLHKu
 LEn2ltAvkzxOwdZWihF9mDrlUePn2XKP5XJbSfKLDg4U0PLzTvUsw6TRi
 t6AACFHctM5C/OZc9uEe1N+/UAS8kW/MKBQILxASMZGvHb46arYiE8q5o
 j18HHsQU4LIH5uyN79uXPOukt6w6MaxuAT7glMreWCrsSL4B8Z+KeCpq5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="373914679"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="373914679"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 07:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1103585622"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1103585622"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 07:04:59 -0800
Message-ID: <c02d0342-3b9a-7454-b9c6-c40bd0fd61ea@linux.intel.com>
Date: Fri, 8 Dec 2023 16:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-xe] [RFC PATCH 5/7] drm/xe: Take in-syncs into account
 when num_execs or num_binds == 0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231207055729.438642-1-matthew.brost@intel.com>
 <20231207055729.438642-6-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207055729.438642-6-matthew.brost@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/7/23 06:57, Matthew Brost wrote:
> Wait on in-syncs before signaling out-syncs if num_execs or num_binds ==
> 0 in execbuf IOCTL or VM bind IOCTL respectfully.
>
> v2: Wait on last fence in addition to in-fences (Thomas)
> v3: Use function for in-fence signaling
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
>   drivers/gpu/drm/xe/xe_sync.c | 74 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sync.h |  5 +++
>   drivers/gpu/drm/xe/xe_vm.c   | 41 ++++++++++++++++----
>   4 files changed, 121 insertions(+), 9 deletions(-)

Should we move patch 5/7 and 6/7 up the series to that everything works 
as expected when we enable the functionality.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


