Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57172C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177AF10E93F;
	Mon, 18 Mar 2024 18:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIsgiEiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4B10E93F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710785634; x=1742321634;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o491vLC0fEjBKcSjmUegfeeaVgnbCjYjBQr7WrwbSyQ=;
 b=dIsgiEiCa4Nm5WQaKzRHJTB1ECuBqKe4ivdMDmjT3EWLHC+mstKHQvRF
 7vRTTzix3MdBPjiRUZtcjbFHTN1AUIuSMBbATEHBdMnh8aYPb2JyCw+dx
 bIsWJhHTmAeejv28zMeoBTNLclAjKpYqIsnouEvYU8O3OaLrvqDHq5Nhu
 0qmmIW0oz+GOQlT0Gd3SwxgblnEPxWi7K55W+wTNMUKU7BT9RyIdKH+5l
 SI//K9Wh8Sdrq1uq4MDhc3nNfTtHyMLDlykh4Rz1tNhkm/UxnPncXW0vb
 L4SezT0GiBjCDFDhoL9LQ1yB+VSZqOMeKn1/3vp4W1sF+LVmsNh43p6SA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="31053130"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="31053130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18280686"
Received: from unknown (HELO [10.245.245.16]) ([10.245.245.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:13:53 -0700
Message-ID: <77b0a055-f06b-4c4e-ab81-94dedabdf9b8@intel.com>
Date: Mon, 18 Mar 2024 18:13:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Convert gt suspend/resume messages to debug
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
References: <20240318180141.267458-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240318180141.267458-1-rodrigo.vivi@intel.com>
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

On 18/03/2024 18:01, Rodrigo Vivi wrote:
> Let's be quieter on production configuration and let's also
> print the entry point of the gt suspend when debug messages
> are enabled.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
