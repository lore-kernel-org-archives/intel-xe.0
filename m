Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50754C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 09:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214B610E5C3;
	Thu, 11 May 2023 09:07:01 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427010E5C3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683796019; x=1715332019;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qb9Bc0cPMaTePhNt4j2Epf3xNrC0Ym3q3D5HoU862mw=;
 b=J5TiYI+BnVbJfK5qE/jRHjNebgzowvT8Cip8ctuMNUwfnOH63LdAJ6Hh
 bQeM+UgG9Z7DfdhkjZcee8f2VVk8Wtd1ZCIRyWzsiIPKF6HgxbL9frx8P
 HYX7yqkgn4oDe8TbJz58x9by1FxW3rHUCobwfo+M5bvJ9an+dG3MYP/at
 xfiTh4KmrPAFzahd62f8WIb36HpNd3wNytXjhsMeCpqD6BcohReBCQ8cq
 hOUXhK+XbYaZTZlOLGNacXXfWKaLJvnLxfTs035IKMfcLAFhJGysV/Nra
 QBxZqWurvTjYSHVF8pI7x0x2+sBTyHM5yuv1tzPAhH2BaMsxh9uddWPnP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413772261"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="413772261"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873891167"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="873891167"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:06:57 -0700
Message-ID: <ca9df240-f2b5-4ccc-f952-be2e72d82b89@linux.intel.com>
Date: Thu, 11 May 2023 11:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-22-matthew.brost@intel.com>
 <ZFVbfEHdT3ROuVeV@rdvivi-mobl4>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFVbfEHdT3ROuVeV@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 21/31] drm/gpuva: Add drm device to GPUVA
 manager
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/5/23 21:39, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:17PM -0700, Matthew Brost wrote:
>> This is the logical place for this, will help with upcoming changes too.
> Please split the xe from the drm stuff in different patches and
> a bit more words of why would be better.

+1

/Thomas


