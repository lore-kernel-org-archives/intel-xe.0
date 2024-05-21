Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB21CC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21F610EADE;
	Tue, 21 May 2024 10:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRwa9sYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6A510EADA
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716288324; x=1747824324;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=CFWg0cfpVNDyIg7dcGY1hR+C2Y2XDH0zBvZ3Nr/Ne/s=;
 b=KRwa9sYN4zprRzBmQphzkFVaHESGc9IceXVWs+e+bKQtyRNPwrrJDaMJ
 yYwmCaahK+3HYdgqxII0peF2/V2ya2iFOuuEMPm9WsHHbOXhOd7q9lCsa
 Q/y5Iy5JhJtZuydPi0CRg3D9gweqdmiNCE9mq6E+wo9cMDwtO6Xyk+wC9
 z/wsVWFHRfoTZhv00Grw1O5+7ODxxtJRjKpV8ljqmzaHWh5YIyAsaeS0O
 kTz+HDLFPj8aQw4SAtU0Yku+ptY9yjWtwXJTPEQ4NCD3iVEcllUO/n8hF
 CGIyONh5pmNkOJ2SttFXoFxyFgpgNFfHIWV6G0qnLhjgvBO3vVWeiqBIo g==;
X-CSE-ConnectionGUID: dKJQ8qpVRE2yjKD7Y8LCbw==
X-CSE-MsgGUID: TXCBl0vWRyqUIqq268MIig==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12310919"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12310919"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:45:23 -0700
X-CSE-ConnectionGUID: 0jdlO9LrSJC4/6VXZei3SA==
X-CSE-MsgGUID: Kyoi2hE3QoSBG+H8DAgXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="56103072"
Received: from unknown (HELO [10.245.245.25]) ([10.245.245.25])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:45:22 -0700
Message-ID: <629f14b0-322f-4eae-b42a-bb127f2aefbc@intel.com>
Date: Tue, 21 May 2024 11:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Use uninterruptible VM lock
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240521102715.22700-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240521102715.22700-1-nirmoy.das@intel.com>
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

On 21/05/2024 11:27, Nirmoy Das wrote:
> Interruptible lock can return error and needed a return value
> check. This test should finish quick enough so use a uninterruptible
> lock instead.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
