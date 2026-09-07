Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43EC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9B789D56;
	Mon,  7 Sep 2026 13:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F//Jb8kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAD789D56
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788789554; x=1820325554;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ba070qty+mGRYIcjyYB6dtuZD2+NaQlZqlyN4w2Bkp4=;
 b=F//Jb8kn/6xYhoze4vGZE0i7Jg1Ucu0iQfXZAai8Nn88Pex05A/aus8h
 4JBxorpkD2BovaOHAmZE4/V3qvOdoRstw+Lgs6QdsgSgj7BHBczCT9sWn
 +PdrGUFHqX/A/ZCDxXGi+TNaQPC0PuqOl8zaFGLOFW1kuCjmuDxB5Y3dS
 wTVbY2BPmw1XzUtSkzB3SfKOIOx9c/zGpGgP+XoRR1PjO6ZRzlSOsp5g6
 dqXO5WWfqyP6n0C+iBPebJ7Q5njF1CFrQsmuaJBT5Qha9SnoZZoRzcwjx
 tw7KTcWi2ed6yz3uBYdZfh1ViqxIbilpkRAle8hFt67+yi+HKLtE4GMnC Q==;
X-CSE-ConnectionGUID: pRou3Rf9ReCW3mbecFai/w==
X-CSE-MsgGUID: KgRFkZOQRaq3d41flZY1/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76751343"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76751343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:59:13 -0700
X-CSE-ConnectionGUID: L58sKDG1TMaT4LLzBD1//A==
X-CSE-MsgGUID: S0bWvZAHQLe3zijvk5WmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274231954"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.247])
 ([10.245.245.247])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:59:11 -0700
Message-ID: <4bfbed2a-afc6-45b1-8ddc-bec6afb9046d@intel.com>
Date: Mon, 7 Sep 2026 14:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
To: Jan Maslak <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Christoph Manszewski <christoph.manszewski@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
 <20260622103449.3335928-2-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622103449.3335928-2-jan.maslak@intel.com>
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

On 22/06/2026 11:34, Jan Maslak wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> MEM_COPY_CMD can corrupt memory when MATRIX_COPY mode uses a pitch that
> is not aligned to the destination address.
> 
> Fix this by incorporating the destination address into the pitch
> selection so the chosen pitch is aligned to both the copy length and the
> destination address.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
