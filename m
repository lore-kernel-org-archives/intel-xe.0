Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F23BC77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 08:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD9F10E0CA;
	Fri, 28 Apr 2023 08:50:49 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9510E0CA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 08:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682671848; x=1714207848;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VZ569pmwN1JnyK6CfrFq81hBMi6861zcei/SyN38Kog=;
 b=S6iZrKwuyF+tNVxWnWvNiu0dTJzi7fxoEZOzbzQhOp2LEldDvuSbUNjb
 4WzoCbVofcAigq+2vR9oUN161k3Ir4lagLXuKlXzdtiXWMSI9i61pgDug
 /yE/+XOKseE67EUGBM/J6h8e6j/raJ9LTeC+0cok1Oz6BXTMErksqpPbI
 zCVcj2d15v8QP/eDwN1mgI9XuHbVaLOj14gCUGlcquy2Jg7vDy0OyCq+W
 4oPrAVmmWu1Yu/9E/KztZSu037xyNit2J/X/YAIV/N/p/5BjCtpqEhTUw
 YAsXMWeIDkBri44BXSohbLEYjE6WDvwGFx7FEQnP95h4Zvs+x9ULZKpwm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331996278"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="331996278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759562687"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="759562687"
Received: from rgahan-mobl1.ger.corp.intel.com (HELO [10.252.11.149])
 ([10.252.11.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:50:45 -0700
Message-ID: <5f53aa8e-eb64-cc7c-6eb3-e960a91950b1@intel.com>
Date: Fri, 28 Apr 2023 09:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230427195213.3958260-1-michael.j.ruhl@intel.com>
 <20230427195213.3958260-3-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230427195213.3958260-3-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Rename GPU offset helper to
 reflect true usage
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
Cc: himal.prasad.ghimiray@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 27/04/2023 20:52, Michael J. Ruhl wrote:
> The _io_offset helper function is returning an offset into the GPU
> address space.  Using the CPU address offset (io_) is not correct.
> 
> Rename to reflect usage.
> Update to use GPU offset information.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
