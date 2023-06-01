Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B6DC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 14:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0BC10E551;
	Thu,  1 Jun 2023 14:17:59 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DF110E551
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685629078; x=1717165078;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DJTIumygeAA0QakENBrSsoGlt1KCBO3oYiIRgUlL5U4=;
 b=a/xCkIBiwDr8n3echPt2Kx/hXqTaqjHQIxiG06roIU3Qi5lixTtY1ZLi
 QuaVjFmaIrPOJfyGveifbiLgv9brKWGxLnFdMjtCXfPhuiUvLHSNehEsU
 LWer04z33l/X91zQzMJgw7Pc/v6Vr/JQkqCkf8DFrr1je9KXi8VCmE3Ht
 GIJ4/5JYL61EzDC7BlfX9Kkvjh588NfPjD5F7foQ10PR5RnSiqQ5qqWqD
 8CX1qcqTCMzbPfBQkfx/1zR8Oxa5Lh/sKIYJyDOxQVNwe4spuUIjhrEEg
 OgEX+Zt5CanZxWHANXSxvBIO3/1DmddFJRoxm+hjOiEWHSx812Hu8spLJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353065921"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="353065921"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772435253"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="772435253"
Received: from chauvina-mobl.ger.corp.intel.com (HELO [10.249.41.195])
 ([10.249.41.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:17:56 -0700
Message-ID: <30a4e9d9-3a8e-8399-4188-f51be59bb8b9@linux.intel.com>
Date: Thu, 1 Jun 2023 16:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230601123505.646031-1-matthew.auld@intel.com>
 <ac489553-cd65-a16c-b8fa-c77bf0fc49e5@linux.intel.com>
 <c93fe5f3-8dd0-0d52-265e-13e91b921d94@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <c93fe5f3-8dd0-0d52-265e-13e91b921d94@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: fix double list add
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


On 2023-06-01 16:16, Matthew Auld wrote:
> Hi,
>
> On 01/06/2023 14:19, Maarten Lankhorst wrote:
>> Hey,
>>
>> I guess that should make the ignore argument pointless?
>
> IIUC we have something like:
>
> vma = create_vma(vm, bo, ...) -> list_add(..., bo->vmas)
> ....
> vm_insert_extobj(vm, vma)
>
> Here we need the "ignore", otherwise bo_has_vm_references() in vm_insert_extobj() might incorrectly think the vma we just added to bo->vmas counts as a reference, and then the vma never becomes tracked as external. Or am I missing something here?

Hey,


I guess it could be done before adding it to list of vma's instead. However that's  good enough reason for me to keep ignore. :-)

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


