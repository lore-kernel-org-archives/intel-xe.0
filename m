Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E3AC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 13:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2938C10E21B;
	Thu, 10 Jul 2025 13:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPGn1MyD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A133C10E21B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752155934; x=1783691934;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=c8Y/ia59EsPl6AOVemEoEyiqL5ErEJBuhlrSiakl0GQ=;
 b=WPGn1MyDP8OK5sq7DWJxmkj8r83X6iBQVACfY6Kqzu/+U3Q2cjON1hI6
 ZyrrRN43xxtkh27DJtrMloxOkHXHRNND/1IbEA5bd4kNrd9mZTT3EQ2OX
 ojmP7uV8NjHuEIFdcWEVzoW9axchoaPPj7g2OM/d+JcrejNzgIdZ8Fy0X
 eSGooATEl8/ivbw4gEMcv0II0iWV6vVI660X0hSwVJY/I3ZAweZa0POyJ
 NtmB8aIFIGQRs+GQIIjRznGASjEpF7Z1m1e/WxqTfXLqkAl/1E5Oe+fi4
 OWds7t6m+iP69jhtAJP+PXtkMltxRanxfoXxP3cMBLvVfWshu2/rHbC+r g==;
X-CSE-ConnectionGUID: zTIL39XAR6SOwEAUSKCvFw==
X-CSE-MsgGUID: 4ESJ8ioASv6nSDkonSwOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53656527"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="53656527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 06:58:54 -0700
X-CSE-ConnectionGUID: ZRQDs5QHTVelsy2E+z7ELw==
X-CSE-MsgGUID: Eezceds9R3eb98Wws5zIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="155496889"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 10 Jul 2025 06:58:53 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A8C822FC6D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 14:58:51 +0100 (IST)
Message-ID: <5a43c79b-9ea4-4488-9a3a-766ae719959c@intel.com>
Date: Thu, 10 Jul 2025 15:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Don=27t_allocate_temporary_policies_object?=
To: intel-xe@lists.freedesktop.org
References: <20250702142504.1656-1-michal.wajdeczko@intel.com>
 <175161829763.134207.1025892868132091491@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175161829763.134207.1025892868132091491@1538d3639d33>
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



On 04.07.2025 10:38, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Don't allocate temporary policies object
> URL   : https://patchwork.freedesktop.org/series/151075/
> State : failure
> 
> == Summary ==
> 
> ERROR: The runconfig 'xe-3336-94631e6b7f655b1922e3227970cd6180200694af_FULL' does not exist in the database

this patch touches code used only during wedge mode switch and tests
related to this feature look good:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151075v1/shards-all.html?testfilter=wedge

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151075v1/index.html
> 


