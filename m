Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35EDC7EE22
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 09:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6954410E218;
	Thu, 11 May 2023 09:46:22 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0EC10E218
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683798381; x=1715334381;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=B4SXTCOkfs5bPXkNc62xnch749G4ysj9ZfCFTZmzfGc=;
 b=CWSljm89GHIOgZLq50aq/MtrErKZs5eg9vSnpb3WZwHvGbmnZJ7d6bhP
 T9kJH4cP/zrVHVk5LtTbcc7luU+NPFuvyWafqAKGhUFeqnZgCz9LyaqdN
 Sigml8o5Qw2De1GM0nNbuwXmREzhIB+KdShUPoEuxfKwai8plYBWpb5uI
 C7kYF/DrrWWkdwyU5GI2GMXAqO2TPnaBVFcFl1T7ADm/FbzkzIOxvHpGO
 qqNp7eXYehU4LocNVJzu1CPDS3Lj1grk+0SJ/cPprY5RNcu/MM6+831zT
 s2AsfkCaT6iqGUPS4PcykbBaKT4ewwGXsFE0aCIZdpEm594DysRtLDyQV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436782865"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="436782865"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811522348"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="811522348"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:46:19 -0700
Message-ID: <e32a8a9c-8dec-ce3c-45d3-248e2d82f18d@linux.intel.com>
Date: Thu, 11 May 2023 11:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-25-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-25-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 24/31] drm/xe: Userptr refactor
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

Hi, Matthew

In addition to Rodrigo's comments:

On 5/2/23 02:17, Matthew Brost wrote:
> Add GPUVA userptr flag, add GPUVA userptr sub-struct,

> and drop sg
> pointer.

These are unrelated, right? If so, separate patch?

Thanks,

Thomas

