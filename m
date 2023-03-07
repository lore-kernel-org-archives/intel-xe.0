Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6E7C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 13:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3055710E264;
	Tue,  7 Mar 2023 13:47:17 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742510E264
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678196836; x=1709732836;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=olMVpHx351q/qwz7KTM9bVAzqdh9WibKA26vInu++kM=;
 b=R83bQ866cWq1CvKFe9nGlxHoiNRoRI1zvnfSHbYPVKv3IFPsjcSzn0p8
 vpARK1qgb9S5ScT301yt/pzw1gXxGvISvoyJ/lgo1HCjVZzX4itMqasQy
 nTVksc5HfR4tzvF12N2rdcp8C/rVJGmEyjGvTQXk/SNJxBr0t5nv558lA
 ecyypdrmhA78tJW6TcbzvwNLso7XBBL7/+w+rQW+SAoNg8PcwAk0y7f5b
 qdQXWZXwq+mlsirg6/cIIVNa6xlFqWfv/5hv/uIbwYP0BNJauq4t84Me+
 TbxNQdqBOSa87bcaVdEZoNA7aF4hI2zqnVYFf5h2ZYUvV4hA0xs24TjIU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316250812"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="316250812"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 05:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706808888"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="706808888"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO [10.249.254.10])
 ([10.249.254.10])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 05:47:14 -0800
Message-ID: <90b578fc-3600-d4ad-3b80-0fd798286167@linux.intel.com>
Date: Tue, 7 Mar 2023 14:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
 <20230302124258.91081-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHOBuStP=JZdFCGzJCDXcFmB5=THUXwnkGUo6-XtXEU+NA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHOBuStP=JZdFCGzJCDXcFmB5=THUXwnkGUo6-XtXEU+NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/tests: Remove CONFIG_FB dependency
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

Hi, Matt!

Thanks for reviewing these.

/Thomas


On 3/2/23 14:06, Matthew Auld wrote:
> On Thu, 2 Mar 2023 at 12:43, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> We currently don't have any tests that explicitly depends on this
>> config option, so remove that build dependency.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
