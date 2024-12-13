Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E86E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 06:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179B10EEFB;
	Fri, 13 Dec 2024 06:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Skc688fn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2652C10EEFB
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 06:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734069888; x=1765605888;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RSbVng+JQXqD1gIMX1QE2gLfFU8ksF7VdlPLH63LUKU=;
 b=Skc688fn1X7Qe93C2cxUsQPpL8W1Ed/6uQdiT0JYNNUS58E33dNq4iWz
 g2sXKrccNyqE8HRbSVu43dFSDNKGxZSKp2xtVZX34JMo1MQez3NQga3Tf
 gC/t3fGKdGkb80S87eeP4QHpQEBkECYFMRXws0fZ+04aNdVWM6sfp/HuC
 bPWmOU+KaFoOQZPgclKAkYHjWuQ1qDb0LXsF3nSO3QFJduxxLaJ7NZcit
 x7+LhYyMNWk9z+/geMvnJvbPdvIUfHCI9UroXzx0HOsFGn+pBTX4sBU3/
 PQz4192vfAgJzVL21/si/dndQSHi6bjUcg3SXFikk3m6l4/Rc83m+5uZP w==;
X-CSE-ConnectionGUID: AEazddxpSyejxQsMX395Mg==
X-CSE-MsgGUID: XWv7sdrCQd2TPrq3xq/pVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="52038978"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="52038978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:04:47 -0800
X-CSE-ConnectionGUID: 21ZdNzxRTSyDPcvFVk33qQ==
X-CSE-MsgGUID: svNLoVMwSMSmitd90cPnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96302435"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:04:46 -0800
Date: Fri, 13 Dec 2024 00:04:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, 
 aravind.iddamsetty@intel.com, john.c.harrison@intel.com,
 ashutosh.dixit@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <htcdqjyj75ymzb6ywe6wczq7vyhop4cocco7pj26sseajtlmo5@hafxw5sqtbj7>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-8-riana.tauro@intel.com>
 <u3bmt4wjtini2n7bes6gyq2f23kboagca4ee3ekg3oer3qjujj@mh5ct5xwggo6>
 <30a06548-d50f-4c57-9697-39a2bc3a562b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <30a06548-d50f-4c57-9697-39a2bc3a562b@intel.com>
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

On Fri, Dec 13, 2024 at 11:30:38AM +0530, Riana Tauro wrote:
>Hi Lucas
>
>On 12/13/2024 11:14 AM, Lucas De Marchi wrote:
>>On Thu, Nov 21, 2024 at 12:09:03PM +0530, Riana Tauro wrote:
>>>Engine busyness is supported only on GuC versions >= 70.32.0
>>>Allow enabling/reading engine busyness only on supported
>>>GuC versions. Warn once if not supported.
>>
>>did i915 used a different version of the guc api?
>>
>>There's no platform supporting GuC >= 70.32.0. We will need to add one
>>to be able to test.
>Requested for this guc version. Will merge this once CI passes with 
>the required version.

this means you also need the igt ready for that. Is it done?

Lucas De Marchi

>
>Thanks
>Riana
>>
>>Lucas De Marchi
>
