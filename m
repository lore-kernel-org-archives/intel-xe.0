Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA293C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 14:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B1F10E3D9;
	Tue, 28 May 2024 14:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhH//pFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66C610E3D9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716905919; x=1748441919;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2wQxE/exAIByg5TxmvGu3k5hV8jYz6sOUKZaRKhj0XA=;
 b=PhH//pFuyyeQXCGDnY65Yvc9bOnOY+P5ahbq9j7PgxhLxHO0fdzm3sgH
 PXyhmDO69pjCBjm27pa5K8Hxe7OFe77MO9F2to9eVrwQ04Sb2hyPuimvK
 LVFBQlgcd9Rsqp6BpkP+H85z3W7zV82tLv7ONmunkjxoepT0XTSrA5KRe
 8tmsrMtK/pdLGNdm0VTkKPk+VZa8UvKWmnxgSwQh7lMOYygu3wRV0F+D6
 Xu3QlQSiXNIp+mX01e9hs8QDaQczq/hUDZLuURAkbPMbS1mKD6s5sjMoT
 L9/FkfbAMh0i0MHzlD5yUIVhQZ0WbRfMfz7H3b1DZntyr67pj218mnFmy Q==;
X-CSE-ConnectionGUID: /Vq8wWDTSQyQs4wuoo/qDA==
X-CSE-MsgGUID: z+v3ZyCVQw6C+SGGbLtH0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13421482"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13421482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:18:38 -0700
X-CSE-ConnectionGUID: 8RwVk3JiT6q+5xQpi6zetQ==
X-CSE-MsgGUID: CDrj5kEZRsa2/Rt5YqKsrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35571979"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 28 May 2024 07:18:36 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EFF3112417;
 Tue, 28 May 2024 15:18:31 +0100 (IST)
Message-ID: <a5058894-0726-4bc5-85a1-78e594cef17d@intel.com>
Date: Tue, 28 May 2024 16:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Store platform name in xe_device.info
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240521142257.756-1-michal.wajdeczko@intel.com>
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



On 21.05.2024 16:22, Michal Wajdeczko wrote:
> Michal Wajdeczko (3):
>   drm/xe: Store platform name in xe_device.info
>   drm/xe: Drop undesired prefix from the platform name

pushed all but this one as it needs extra split into topic branch

>   drm/xe: Use platform name in xe_assert()
> 
>  drivers/gpu/drm/xe/xe_assert.h       |  4 ++--
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 25 +++++++++++++------------
>  3 files changed, 17 insertions(+), 14 deletions(-)
> 
