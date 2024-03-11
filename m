Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD532C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 14:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC0511202A;
	Mon, 11 Mar 2024 14:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyGuwpBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C9211202A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710168046; x=1741704046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R67d36v8cFN/r7/bNFYH+9xY4RH087tqkPTS1kY8I6o=;
 b=jyGuwpBetvRQL1Mqzi2u0/HPidX9qUPlpcst0ujVXIwwO+prY0BQ5N6r
 MCW9R4KWw9Fdl0+WoaAhGkBupc1tyP9w0LLNNkCaM62OKHHbesZ8Pg3OQ
 wK4uG6OvYE1L+NpY5JXvczcCHUnuRn1Z0gMGaOMF8HsYWMQc+ve0+S+7O
 JpEVn8RXtKOmW3xJpypX9fB1XkAxkvNXruDOwrrKdxNFg7WowYHMqHwzc
 PltX6OgQhj5Rt6L4jYoVBhviaWCuavDRxqnbgemq4Jv2FQhaJ8/q+qgec
 +JZ2DUQrnbzR0d84qjvgBwsIvf3QxJaTi1KV3s0iLzm8P85pwpmOb1Bfe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15395218"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15395218"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15678225"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 07:40:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 07:40:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 07:40:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 07:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwm8ajTvaCDAoym9oMRO8jbWR87k2bP90DNpLeZQuJdY6zvTmibgxj178SM3Xn6zEdjAt3ncczquwDLuolwB6UqWMhEt7nZErwat7d1g7u3SuYdVgTgRKMKlCr7YRHyo781MAfTworNDuD8z2CiFxhbBmV/tWgVbOqanKwaGvSzYrl80nYmfghw8s4p0EEl8kAyDfA0SRg+ECnMfK9n8kVzaZ9TpWTUtKJbupdcLtYq9YjgJAUVDp+KcynO2d9fkn7zplu7hg5clLgpv5XwBH9N/YS6zvWfZEIb2qa+KfJFQwrTz3lpZCL50IMF84UuvumxKPUbTnwOnETNU3Ws+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcNBUexOVNzHVHLzYaBFqydV4kCV6bp2HFk2T853qnY=;
 b=YMLAgMs62TOu2GVRGSYSG1OUA+szH8ybOCGDF9AOAaDOHh0kMaqWxdWlM4bnFcta6DDVK3d9jRVzGfww7jQLM0QTqcObDRC5qMZ8JRR6YWBwnfddR3a/cTAet2NVDyZZb0z7IEuUlQhOD+7mMX3uRtcDw3MOOsb20bpx2gN5VU/7IH6TxqE1VPcYjy+r2Cg7g1Yt5j3vpPNT9409jAFtTP5OwpceiRypLVFy+qUuFYHzaOsdxs6rjEPQTySQz2sfrAjCFFnKGH8/1xGQ0k8cbM+7kO6MHGnK5ZoDZd5Faz6m8DPs54MvX0TDUO2WVEwI3H4ixBRCOx30+aQi4b0EGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7883.namprd11.prod.outlook.com (2603:10b6:208:3de::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Mon, 11 Mar
 2024 14:40:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 14:40:14 +0000
Date: Mon, 11 Mar 2024 09:40:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@intel.com>,
 <badal.nilawar@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: re-order lmem init check and wait for
 initialization to complete
Message-ID: <td4nrxpvrlvzlzqwi6patg7blwpzngnjmvuklj2yiha37lngma@vsi477nqcf2s>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-3-riana.tauro@intel.com>
 <Zesj1vgtwk877OhR@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zesj1vgtwk877OhR@intel.com>
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbb01f4-ea70-4835-eedc-08dc41d92953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wGJ7w3SzwKsRMicwVKOV1hX7UgZn2f2XxPQZs/NMlWMtt+bNlOargM2BnsSD+vqKrtDHyV8lS8Wg94F+Zie9nLfEwnBcAY1NqWaaEuqeUKOPRc4MFRYIpM6WGjUubEC1JSHyJRnmdCY7T4/R2gsCLRU56WbW2Il0pqlQPwC8SLoMqo4SERMg93s+GGwXSJCx4qEvxqop+D4oVBS7gKjrgECvOMpxVXL3f2u5+bQwcAOsvhurCrOFcveIgFaaiAGmdG3N66X34ko/kbOmVz7H6sH044G2gFexzRcS4RHxF5FTE4X5ZJ58ebBjQko/3QwhToOd5GrBh2daM5fUWjQFoBNZtM8SQrExFwUTUAMdQPP2Jn0vmNmw5C7y17RMBeGD/SHx5SdtIvCs8bEppIa4rrGiOPRuh3wj4a8FV70wS2NgI23yqhtolsU9u6mY2Z1SRyQyGVLSh9IIVKYQxSs3QGokR09elXIHvTy0xtYMAdBut0IdalSbfrIv+WsfZGtaydLLdLq1ygRq3GrHa0YX9Q+PsQHbFuaYG0pVuQKJWhYzZ25wE5em4C2ocml2tiLzZ5WxEzD7rTHHQ9oeu7DTyXCPoEOrqTSU1bmFj+kRogj/SQtJYGN9lAshcFuDMq/9hMhGwU+Cu2WxOU250/kHv7sl5gD/GhzmB585udNg2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRhQWoTc0660MWRWkIqyW/nN4wbqfe60e0vPjAonc8N4poqfc3CJeaUToEGQ?=
 =?us-ascii?Q?B5JQlBccu/GGLr21eO23rAZkMmTxpyI62+IycHx5FEU3V3TXPmtEYpVC9g9/?=
 =?us-ascii?Q?WNwWoSmD/wk+iRoVDyyTxMRq19l+ZWVpt+gAdQs7USFRU2p8oD5Hhs3rXS1b?=
 =?us-ascii?Q?SASDSqojUBHlglZXdN8uvptHDY5XWYCh8nHZ8xcdwm7iLnKGiFQGt4PcIVEw?=
 =?us-ascii?Q?Imr/Q48EKdDZbHR1XL1gP+D23LLr+eifaq6KrZnj89NwmLCigSGI6EpktN7M?=
 =?us-ascii?Q?YX4y+x31Zvo5okogcgP8TWOXYUFwkrxGI/Ja6WIdDYk0fToJzC6pfTRRIqS8?=
 =?us-ascii?Q?6yqyNS4KX6eK/E1WA81sPej4MxTMfzTRetjCUiSg2Dj0wpee1gQGwbXLGQtt?=
 =?us-ascii?Q?j2T1IkDeHLB7af/4ids8ZCz2fyWHed1b0DZbIHll1+q5KK5nYltq6k09LoHr?=
 =?us-ascii?Q?Nvb32JmGtu9psHG4HWCw1YYffYS/358y2llmWgB6oY3fIOAla0zY6GGzcqs/?=
 =?us-ascii?Q?sRuVAaOXAK+Is4iXKnIrnQjnm3Ono/QYvE5wZWOiSm/7Qdup69+zSwjxUpaG?=
 =?us-ascii?Q?L90+T3kvi90AAmuKZkp64VPHLScFgXVadeETA6SrOhxSdHUHAYHF/GkWltJq?=
 =?us-ascii?Q?M00PCFCLG27/jCUtrYKErzb0rn5PdKUt2CXENeAA/IhhcnAfXVG5V0xqAQjU?=
 =?us-ascii?Q?dTtNNcomeXfO10fP97JzazR54ZG4Af0HvZkygjyZZ0suOrFq90Gt/01cOGqQ?=
 =?us-ascii?Q?MH8KQXnUGKPyZXoF/RhhsxYKHfMV7/QbXNcDys+ffrKZJnG2vX1GK90NtuBp?=
 =?us-ascii?Q?tm41P/ygA/JoqkDJk9h9MjsAJt8YJc9WSqF+JnlFFLrKsCTi3JaSwsOJ4ysg?=
 =?us-ascii?Q?xC+a6G3UKvf/gnzbZIPZxbk0Kcrx1Hhx9Mj+aIM3EFtT2cqym8MDbOdh/pTO?=
 =?us-ascii?Q?vMi+FIObz/zPXv2pESQP+qa/AFxEi/YHYkgxxlYN/433JeFEjNSKiB1haGkX?=
 =?us-ascii?Q?x2GmaE2teVyZmXa+qV9rIo/MpidzGj3v9PAxAzhqPIUF6T9w60Y1avMEtoef?=
 =?us-ascii?Q?7Ed0pPLkSbokCPGWXup8FyO5nrlenR8vfqoPdbpbSP4yVXcf5J61NCF0/hJn?=
 =?us-ascii?Q?J9pOd59Z8W7tHgjVIV9iUttX15kJAvBR55DBd/tmKyJxASLtMVZpsbaM1fvy?=
 =?us-ascii?Q?LXcDcxsSywGDW9qkIZAuvplF/kc3+xhI7mLhHIfehj+atHrvt5ltv4I0ib7J?=
 =?us-ascii?Q?FQJOVOzTbtUYk1GBkONG6FEIGDNxXbeVRazI5udfY0UD8/NoNXPJReWXIXSR?=
 =?us-ascii?Q?Nm0Px0Pvh40NxOrHBP8pjcO+9VocSWxauvp9jD7fa7Ek84RrZYZ/tLmMCvBQ?=
 =?us-ascii?Q?dPn9zSAW8SdkKmKGulyN3qIpWpYx6+hB9Q0NCIzmrJ2Z+gy1mARJIpGiSXnD?=
 =?us-ascii?Q?zqgta/WlDsSGgefYlz67pY7pM2mjI5DYI+NjnuihShlSkWel936+0IFlm4F7?=
 =?us-ascii?Q?HrE2iwJDaMoT8ZTHIOF7ga/b8kbilgsiJutoaqYaN6UTC90ux4BbnCZzRW/u?=
 =?us-ascii?Q?sai0ICJj4k9ZdehqWX0ugALc0qNzsxxmbSjUrZQUnMSQvyc11IeCPRNnZFe1?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbb01f4-ea70-4835-eedc-08dc41d92953
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 14:40:13.9064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWatahwjuk7hy2Ev7l++CR86uD7cd6W4E1PZPDYG9LVyzrQbSr3O78IODPFcgmvfRoSIimUxbZn4QJeEkAktEvv3+kgDXfRGtrBo6CfKelg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7883
X-OriginatorOrg: intel.com
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

On Fri, Mar 08, 2024 at 09:42:30AM -0500, Rodrigo Vivi wrote:
>On Fri, Mar 08, 2024 at 02:25:17PM +0530, Riana Tauro wrote:
>> Lmem init check should be done only after pcode initialization
>> status is complete. Move lmem init check after pcode status
>> check. Also wait for a short while after pcode status check
>> to allow completion of the task.
>>
>> Failing to do so, can lead to aborting the module load
>> leaving the system unusable. Wait until the lmem initialization
>> is complete within a timeout (60s) or till the user aborts.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 53 +++++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_mmio.c   | 29 -------------------
>>  2 files changed, 52 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 83dd60f68566..4806e7806be5 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -413,12 +413,59 @@ static int xe_set_dma_info(struct xe_device *xe)
>>  	return err;
>>  }
>>
>> +static int verify_lmem_ready(struct xe_gt *gt)
>
>maybe bool?
>
>> +{
>> +	return xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
>> +}
>> +
>> +static int wait_for_lmem_ready(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +	unsigned long timeout, start;
>> +
>> +	if (!IS_DGFX(xe))
>> +		return 0;
>> +
>> +	if (IS_SRIOV_VF(xe))
>> +		return 0;
>> +	/*
>> +	 * The boot firmware initializes local memory and assesses its health.
>> +	 * If memory training fails, the punit will have been instructed to
>> +	 * keep the GT powered down; we won't be able to communicate with it
>> +	 * and we should not continue with driver initialization.
>> +	 */
>
>the comment is negative in a positive outcome.
>I mean, one reading this comment above might conclude that we are returning below
>because we won't be able to communicate with the GT.
>
>but the code is right and we need this change. thanks for taking care of it.


I'm confused if it's indeed correct. See below

>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>> +	if (verify_lmem_ready(gt))
>> +		return 0;
>> +
>> +	drm_dbg(&xe->drm, "Waiting for lmem initialisation\n");
>> +
>> +	start = jiffies;
>> +	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
>> +
>> +	do {
>> +		if (signal_pending(current))
>> +			return -EINTR;
>> +
>> +		if (time_after(jiffies, timeout))
>> +			return -EPROBE_DEFER;

-EPROBE_DEFER will instruct the driver core to re-attempt binding to the
device later.

however we are already doing the wait here, why are are returning
-EPROBE_DEFER to re-attempt it later? We need one or the other, not
both.

it would be good to have a fault injection here so we are actually
testing the error path since I don't think we are triggering this path
in any machine in CI.

Lucas De Marchi

>> +
>> +		msleep(20);
>> +
>> +	} while (!verify_lmem_ready(gt));
>> +
>> +	drm_dbg(&xe->drm, "lmem ready after %ums",
>> +		jiffies_to_msecs(jiffies - start));
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * xe_device_probe_early: Device early probe
>>   * @xe: xe device instance
>>   *
>>   * Initialize MMIO resources that don't require any
>> - * knowledge about tile count. Also initialize pcode
>> + * knowledge about tile count. Also initialize pcode and
>> + * check vram initialization on root tile.
>>   *
>>   * Return: 0 on success, error code on failure
>>   */
>> @@ -438,6 +485,10 @@ int xe_device_probe_early(struct xe_device *xe)
>>  	if (err)
>>  		return err;
>>
>> +	err = wait_for_lmem_ready(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7ba2477452d7..7fc0c5453b21 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>>  		iounmap(xe->mem.vram.mapping);
>>  }
>>
>> -static int xe_verify_lmem_ready(struct xe_device *xe)
>> -{
>> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> -
>> -	if (!IS_DGFX(xe))
>> -		return 0;
>> -
>> -	if (IS_SRIOV_VF(xe))
>> -		return 0;
>> -
>> -	/*
>> -	 * The boot firmware initializes local memory and assesses its health.
>> -	 * If memory training fails, the punit will have been instructed to
>> -	 * keep the GT powered down; we won't be able to communicate with it
>> -	 * and we should not continue with driver initialization.
>> -	 */
>> -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
>> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>> -		return -ENODEV;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>  int xe_mmio_init(struct xe_device *xe)
>>  {
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
>>  int xe_mmio_root_tile_init(struct xe_device *xe)
>>  {
>>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> -	int err;
>>
>>  	/* Setup first tile; other tiles (if present) will be setup later. */
>>  	root_tile->mmio.size = SZ_16M;
>>  	root_tile->mmio.regs = xe->mmio.regs;
>>
>> -	err = xe_verify_lmem_ready(xe);
>> -	if (err)
>> -		return err;
>> -
>>  	return 0;
>>  }
>>
>> --
>> 2.40.0
>>
