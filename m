Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B2AC77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 13:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D16C10E28C;
	Mon, 29 May 2023 13:35:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E0610E28C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685367338; x=1716903338;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hJswZRY+f3d3pAywdNHR0hYm3o5ZVN6iqbWGTE6u2Q4=;
 b=dJ4GjdKaoIRAonM1BEwNQT9sZQhCQdCOo3VY5fvvFXYw+VfovjTjDjMX
 1jQSeBf04/sDZcUZp5G1MFDXbdIpJmBSUfIOewaEDlpuEYphKVp5z7It9
 nQwr/jhmx+bPk/6PH/O3Fy8OCu7DILhN18qTmY/EOU9GbVUv3wJXWeCPp
 W65bYxHRpTOsJmE3RVblxOka73bK80pAXX1HB7stRfGZAGkf/M+NXBBMJ
 By0ditY28llHSmek0TVEeT57VYUKCbWpuhIv2AcoNdV9sOT41D9Wth2kO
 bVa/jZuoYAOJjzlpeogPoBMbzwHhPhWKIj4sfQMmiCsfYOCp5wfgofuAs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354720189"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="354720189"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 06:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="952762479"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="952762479"
Received: from olhomerx-mobl.ger.corp.intel.com (HELO [10.252.46.198])
 ([10.252.46.198])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 06:35:26 -0700
Message-ID: <678c272b-97dc-f556-4403-96c2f895fa9b@linux.intel.com>
Date: Mon, 29 May 2023 15:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-3-maarten.lankhorst@linux.intel.com>
 <0ff025da-9d8d-d7bb-80a1-f7623578e210@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <0ff025da-9d8d-d7bb-80a1-f7623578e210@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Add debugfs files to evict
 everything.
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

Hey,

On 2023-05-26 15:02, Thomas Hellström wrote:
>
> On 5/26/23 14:10, Maarten Lankhorst wrote:
>> Easy for testing, when you just want your BO evicted.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Do we have some documentation somewhere about what our debugfs entries are doing that needs updating?
I've not seen any documentation for those specific debugfs entries.
> Also can we evict stolen memory?

What is useful to evict? I think all of our users of stolen memory only use it pinned.

~Maarten

