Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E12C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031B10F0D2;
	Wed,  2 Sep 2026 09:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/o9Aano";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4FE10E38E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788340719; x=1819876719;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=KU3Z5C0Ode6jN8ixHUZkLcwrmODUP5WeSYIYl8AIXjY=;
 b=Y/o9AanoMEBGdW6MqxJ2o4ktFjfOzcNInBd5ojhK6MsYwPl938IDdxAZ
 VZ1HIoEiaJxRaZ/qhVbngG5n9IH2T8KX1SEFrCocJ5EhsbQd0BoHgpi4u
 cJrNJ7XH5nehey46WtV7eOMChTr+bYrC38MC8JMLe1Avb3kkgkWe452Zu
 VOk3qM1D1zh7zVLm2S8TKnlSH/HKeoSmm60SB3Wb/mR3KvwXCTlzWavTc
 d16kaB/VV1SAOAbSQ+8H8QsKjwr6pdsqoBYZtrD+qAVdoh6rHGq7LAGJz
 qGbfZI2Xd/KEO0iV6SVhyamCk+GvO+Tn5VX4XBw68G5zNLGFj/gCtNm7X A==;
X-CSE-ConnectionGUID: c5aL5uZMTBK49989WDmgxQ==
X-CSE-MsgGUID: QPGcFuRxQbio8B8cRAQhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="114336126"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="114336126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:18:39 -0700
X-CSE-ConnectionGUID: pe/L61IzR6+Wv7EcnYsfzQ==
X-CSE-MsgGUID: 4vei3AiFTEWpdHE/71cwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="271325400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:18:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Sep 2026 12:18:29 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4 06/18] platform/x86/intel/pmt: Do not remap when using
 callbacks
In-Reply-To: <20260901192736.626777-26-michael.j.ruhl@intel.com>
Message-ID: <30d90d16-a261-e5cc-8b49-c21884d6f8cb@linux.intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-26-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 1 Sep 2026, Michael J. Ruhl wrote:

> A callback indicates that the parent driver is responsible
> for accessing the data area.  Creating a PMT memory remap
> is redundant.
> 
> If a read_telem callback has been provided, do not create a
> remap.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index af7c951b569a..350129121ff1 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -373,7 +373,6 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  				  struct device *parent)
>  {
>  	struct intel_vsec_device *ivdev = dev_to_ivdev(parent);
> -	struct resource res = {0};
>  	struct device *dev;
>  	int ret;
>  
> @@ -403,14 +402,18 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	if (!entry->size)
>  		return 0;
>  
> -	res.start = entry->base_addr;
> -	res.end = res.start + entry->size - 1;
> -	res.flags = IORESOURCE_MEM;
> +	if (!is_cb_read_telem(entry->cb)) {
> +		struct resource res = {0};

I see you're copying this from the existing one, but this is wrong on 
multiple counts:

- For general initialization to default values, = {} should be used
  (the extra zero is snakeoil).
- HOWEVER, with struct resource, that won't produce a valid resource!

In this case, DEFINE_RES_MEM() should be used as you've everything 
available to setup it right away.

> -	entry->base = devm_ioremap_resource(dev, &res);
> -	if (IS_ERR(entry->base)) {
> -		ret = PTR_ERR(entry->base);
> -		goto fail_ioremap;
> +		res.start = entry->base_addr;
> +		res.end = res.start + entry->size - 1;

For the record, there would also be resource_set_range() but since you're 
going to use DEFINE_RES_MEM(), that isn't necessary here.

> +		res.flags = IORESOURCE_MEM;
> +
> +		entry->base = devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(entry->base)) {
> +			ret = PTR_ERR(entry->base);
> +			goto fail_ioremap;
> +		}
>  	}
>  
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
> 

-- 
 i.

