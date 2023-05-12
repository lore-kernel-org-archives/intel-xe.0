Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD80C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 13:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B394A10E6B4;
	Fri, 12 May 2023 13:33:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE4810E6B4
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683898423; x=1715434423;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=9TxPeelwW6lovKbP12ypyhOO+zXDwSJDx16CradUC0A=;
 b=izvcNEiug7nPDcVFiVMYCjpGmrVLMVmyD1xDz0/3tybPZTYAo3EsZH+O
 7ToaGssxPsoLIwn7FNfl2guj08fKQyCakG9+QgtiARZJXXFlBMZTSLzxY
 Xf61u3ZIdGCFjtEegqD9C1DwE/r79rJLQJNCkhwDa837Q0VB/6KIlUYTO
 jnky4rWBTjxUI1nkpP+tMqcUObZGddZj9UVY017hvcvBPi+UOCG3piOFC
 44Wi5D17Af7NTCssdH/xUJvHcZKWEYVvrbGh2FxW/k+KKwraSOAY7CJ0u
 +ITrvjaRTbKYntm52jd++WOVzM2N3I2mLocJokBjgD7NXD7sEKcJVvg9l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340103911"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340103911"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 06:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030087728"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="1030087728"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.161])
 ([10.249.254.161])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 06:33:41 -0700
Message-ID: <b7c7cdf6-fadf-9e3a-0e55-2be2c4987738@linux.intel.com>
Date: Fri, 12 May 2023 15:33:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Intel-xe] Small fixup for the initial review
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

Hi, Oded,

I found and fixed two locking issues in the initial commit you are 
reviewing.

Are you ok with me pushing those as fixup commits?

https://patchwork.freedesktop.org/series/117668/

Thanks,

Thomas


