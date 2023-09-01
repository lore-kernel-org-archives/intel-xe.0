Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF66CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 00:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A864710E703;
	Fri,  1 Sep 2023 00:31:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4E10E46E
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 00:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693528287; x=1725064287;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2WdgHbB2jazyzkPrRZxq+0zwfm950075UtBWtpREuI0=;
 b=LNNLRSziy7/9g6FEvBtdKfQEY9rEUVZ/GRsrtAbII3fR5791T6uXmVKu
 eJU7ncYEfTPRYsKstx9ARUKln8HLb7iEvgZzIBWO66U4AEudp7iSZN113
 KT/AoGibvs77GbPaiP99JkZixj6yVBW1vdu1CGQjpld4GLv0C5F65v70V
 +quaO1rI48nPK35hOXpGAoamIZa9nVePFOSzTcvfXvCJXepEfc5cUI5or
 a0R40nWdn9vN/xjaTbHUlQtj5v/UOS/OlDSIf1OLBaMEtku84hcaX5ykn
 Oq1fsMlo3q44Gq6ziRpa8c3TQknxiQrmuEuwWm0YBXS1jb9Lj6EGNO6xF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366329892"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="366329892"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 17:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739738137"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="739738137"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 17:31:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 17:31:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 17:31:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 17:31:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 17:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U657HBr1iYrCqq32W6v1Qcnd/hN+vobRRhTpSwsbSB1lMuwCNo9fSd1Y1V2w/aZgUto4DiYnF7Zy/scbbnD7ofLvkDPmUeOMNSl/Sjcxo5gra9LVLJPRUO2WwZMESJC3sMFtPR4e3OMSmhXyN1+rrlW4LlIDWh0L12h6l31WHV85cW14b4LAj2dZLzvYWpdjH4I9+CCeCnaaAKGKhCKXeYrOf8rrclSvbqBe2QG3m2LIhf0Crajh/Z6fn3oJqfsKwFu1wErzxtP3QPPJ+6oV9CfyLB+dgFjUE6al/+Vx+NBgW24MLO5ncNDNKp8YMPaNktI7fRXBW+ryReazdPeJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrD5rlff1VM4Q2tvI5Nz+oAoc2SdD45tSA21SbTzRIg=;
 b=d+s8uXP5+efQZJ7nShXG/+qiug8P/3LuHn52XEk989mGYOMR4JGaiYAJxryeJwIFMTiDvBE9BEv1vVzF7wxWC31400gMaxQMPe2rwYTaS7BabNVmS42oG/LFytwC9im1SBvWGKcHwBDipOH2pabuO105eiegc0P/oAiYazaUSoSGmVHWej3kS2G8slBY6gF9tIHUewtoxPZGBApx8nG3/rwYunONt0+przjs8I96YmlQhuo2U23ozPZnVZo5GnQ7ckxKz949nNxJGkcUIP4+i+umxLKL86ElxnpNy2TmH1XLqrtBE2uAvtk5hJ3SxK5O1HiPw/dSEPVWXqCOKNEUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 00:31:16 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a53a:1157:885:64fa]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a53a:1157:885:64fa%4]) with mapi id 15.20.6699.034; Fri, 1 Sep 2023
 00:31:16 +0000
Message-ID: <b180dc20-c2a4-b38d-654b-5a47a1fa2d62@intel.com>
Date: Thu, 31 Aug 2023 17:31:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "Chang, Bruce" <yu.bruce.chang@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230830213403.16127-1-yu.bruce.chang@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230830213403.16127-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: d60f62f8-2466-4d4a-c116-08dbaa82c0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOnuFYLqWMs+bOEjv7f3A+NkXwIaKGu5u8tWMRteewE0o3L6XbByAVCtO4ACWpL/hbg1PSk4sO3RnTUB/V4Sidnc5hTyB6Geisu6fntkWDrm2MRSnmFyaAzIibq38GOJCcUVC7K7F3+dkknn6gBMC+GfyHEnpXO0KB8wwuLFiCG77Uy7DtjzQ6NOhSlwnUy0COsdl1bykC6lImnefu7pTJw4ZsjGNHwjV2KLoZ9KKVMf4o22mXBLt677w28wPZDuuMgDe7H39KBHoVs0PDXVWzp3ECVFC5utTLxQ8AhOoY6VhGjm0XI5BA1Ik07J/QVdppZiCxX/ooWh1lOSoZ8FlBbk9UrETFakqfIOOfeC030oGJjWJJdGLaSyTceNXLxlmXvXNn5nCSocyRZ6ewZqqds0RU7xIO3L6KXpdUeymtYUmd2l06naOXEwXmN/DP42Dyx4L3b1+Ep6jGycf4ziilJPTwAemeuaY9fCVZ1fk99n4pJaf2mSeQ5yLuh+mD7f6MhBu08n+5ZET6BZzY2I9DolNox3HtD88IGn7YYqUAOy8HAJQ8eYyzbnBG6hHk4/+T7Oxmvf43bVTyfMhRmVb2oB5BbrdO4rcJg75p1pfg72JQOv184iOc4nMap5JiOB0HyLFfBO9dA0Lt6vHIltqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(66946007)(478600001)(53546011)(31686004)(6506007)(66556008)(54906003)(66476007)(6486002)(38100700002)(316002)(41300700001)(82960400001)(6512007)(86362001)(8676002)(31696002)(36756003)(26005)(2616005)(83380400001)(107886003)(2906002)(5660300002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVFXdkJSb1IxUi9uWlRTUHFFZ05senRQNUpyNldFZ1cxdXBkaHBQZCtMY0Zz?=
 =?utf-8?B?ZkNreENFd1RaZnF0eENaUDRyRTU3UE1YWG5hdVZySldFNG0rc0ZSdGNEcndr?=
 =?utf-8?B?MHFMYnRJbGhMRjBjc1R0Um95YWpIU3FPVWJ6ZDY4b2xYRU9NWWFZNkpGakRh?=
 =?utf-8?B?Yk01QmdnUjh6QXN1M3dYb0pVcU5jbnpUU0FtcmJrNElWZ0FPcHBWTTRqVjF3?=
 =?utf-8?B?di9GaFpueXIwQ3pQSlcrMUdxbWQwTDZnbCszb3hIWlQ2SnBJVTV6WHVXdG9k?=
 =?utf-8?B?Qlc3MXhUMXA1UVhMZjdBWXloTE5KSzBWVVc0ZnVzYmZIcUxMajR4NEFKRVR4?=
 =?utf-8?B?ZHZrY2h6dTVlM1dIc3RSWkV2czVEbHpHeEMrWGtJeEJJZDhaNEJTSUQ0USs4?=
 =?utf-8?B?TzMrVEE2RnBYdW5YZDhIeGpwbDlZYTcwWUFoTFZGcGx4blNYRCs2OXlQTzVW?=
 =?utf-8?B?Z0tiWWVJUTljWTVRVWpsRjhyZFQ1c1hXNVFzRWZIN3FjL3ZtTjFvMnFjZm5y?=
 =?utf-8?B?MllIb0tLZEhSaXVpaFMvOHRxQ1VSY2FXQVl2TlU3VFlKUXFpUnhNQVEzaU9U?=
 =?utf-8?B?SVZrSlZXUzZNbC9INVBoK21BNUVwNU9Mc2JxNGZNVVJZQXhBeC9KcFNMc0lo?=
 =?utf-8?B?SlE0NHB0YTRyaTN2bWtGNm9nUjdoNGFoQzRxY21McGFvU252R2JmMVhwUnMr?=
 =?utf-8?B?SnJRVlQ2SnNhcXZFUm1PUzR5azIrRTcybDVzRktCSGp0VS9qSU9mNkVaOHFq?=
 =?utf-8?B?QXRGMWVZT09nRmpoZFFINmR5bk5Qbm04TzlSKzMzZEV6aTRHc3BMQWo5UzZG?=
 =?utf-8?B?NzBQM1RWWWpjOGZZdUQySXVkRlM2Q3ZlUEh4SVNwazVhaWgwazU5VS85SFpM?=
 =?utf-8?B?dEZnNm5BekQrMWljUXVTN1VJbFBoNDNiQWE1c1dZekNqMmJXUzVXZHJHRlNz?=
 =?utf-8?B?SHdVdFFLTERxRmN4L0NnR1ZJS05mMDM0aFFHaUpKZDczaDZ2VTJUUW91MTZx?=
 =?utf-8?B?V0oycWpOZFFLS3NuTFgzYmlnSUpWTk1sb2dXTWlXcHZjSW1nUERZbVFTUHUw?=
 =?utf-8?B?WlpmbTJPa1hndEFjVmVOWWRUSWI2TGxPMkNsNnZHVWxna2VyZTBpVythL2Qx?=
 =?utf-8?B?anIzWXcvQjRQUlVBVm9qWDRYSG1yeGJIVFcxRzVUNWZxZjZaekRpb1dWaVhq?=
 =?utf-8?B?VEF6bjU1RHFqUm9IYVB6NWJqVjJ0TklYWHdib0JiOC8vOTZ4RzF0RVQrUGVt?=
 =?utf-8?B?dFdKYjF0WnEwRC9YdTBkQ2cvOHo4eWJSWDZOR25aWDJLZFFqRFN1YzQ4TlYw?=
 =?utf-8?B?N1p5V3ppZHBhR1BPbzQ0bjVmblQ2UlBra2YrYXFMV0pQajJrWDBFdDRrRW5l?=
 =?utf-8?B?bFVpZUthdVlyNnZYYjA3bjQrNVJHOW9wYWd6RDBjcGVUVElsSHc1b1dsQlNB?=
 =?utf-8?B?RFZGZ1p4Z2lCNmczenVrd1hrSUpTWEpDZUcwQ0lLN3U2RlRRdzFFS3QxOWxN?=
 =?utf-8?B?d1hQK0RQR3MzN1d6QmYwQW40Y1U2bEJFUUo3aFUyekM3SDVNV3FVMFg0bFpw?=
 =?utf-8?B?ZGZsc1N5VVZQNE14aGcrdTJjdVZ4TE02Ly80TTdLSm9zWFFoOFRFV0hsVVRw?=
 =?utf-8?B?SVZwaW5ZdTZ1c3hiTVNQeDJ6WmNzWElZaW0xN3FtNDh4SDdWS2FqK3FaSEtO?=
 =?utf-8?B?Z0pXcXZpclpoL3BvVE4rdjQ2YWhFRkJxbjF2Znd4MmFZRGo5Tk5ZRmVCdDI3?=
 =?utf-8?B?RW12ZkhLWDdDb2RsbThRZnlwR0YvOU5ZWExpc0UyUEl1L2pYZllJcHFqK3NV?=
 =?utf-8?B?NWpqWG54MUFvUllObVZLbzFYVlE2TzJqWG0rSGdpL2VrWG5vbXZYYUU2Vmcy?=
 =?utf-8?B?VlkxM09MdHc0dU82SHRZc0dJUnpLZUI5d3c3UmM5dkJTUzVYYldOUThiMDNx?=
 =?utf-8?B?dU0wWFpuWWlYQkZya2g2WEE5QUdiSXl3aXJlL1RTNFY2M3VFa1ZoaEtLUnhD?=
 =?utf-8?B?cXAvMHhncjVqYkUwWG1RekwrYmlyZWU5TTJ0b3hwM0xsaTVNVngzTzA3VlJU?=
 =?utf-8?B?aDJRcmZEOGg4ZTlMelpjK0FZSXY3ejhQTTBQTmdBSmk5N1Y5TDhDNXJNSmlz?=
 =?utf-8?Q?W9CdWFoszOmZ1QRnvreYwMX4p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d60f62f8-2466-4d4a-c116-08dbaa82c0dc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 00:31:16.2339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBwwCHXeOG3Ye1xiOHrhKA8AT/0h3gTGqyBY88xSOF4W3fW+MuoE7D5tgMNNMPMyswk4QaeEPUlvn7rPGrvF1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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
Cc: Stuart Summers <stuart.summers@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 8/30/2023 2:34 PM, Chang, Bruce wrote:
> The PVC HW has a limitation that the page fault due to invalid access
> will halt the corresponding EUs. So, in order to activate the debugger,
> kmd needs to setup the scratch pages to unhalt the EUs.
> 
> This feature can only be enabled if scratch flag is set per VM. So, once
> EU debugger is running, the debugger umd will set the scratch flag,
> otherwise, this flag should not be set. So, in regular run, this feature
> will not be activated.
> 
> The idea is to bind a scratch vma if the page fault is from an
> invalid access. This patch is taking advantage of null pte.
> After the bind, the user app can continue to run without causing a
> fatal failure or reset and stop.
> 
> In case the app will bind this scratch vma to a valid address, GPUVA
> handles all of this (e.g. it will create ops to unbind the old
> VMA, bind the new one).
> 
> This patch only kicks in when there is a failure for both page fault
> and bind, so it should have no impact to regular code path. On
> another hand, it uses actual page tables instead of special scratch
> page tables, so it may not require to invalidate TLBs when doing
> unbind if all upper layer page tables are still being used.
> 
> tested on new scratch igt tests which will be sent out for review.
> 
> v2: per Matt's suggestion, remove the scratch page unbind.
> v3: correct error handlings.

Looks good to me.
Reviewed-by: Brian Welty <brian.welty@intel.com>

I know Stuart had some mis-givings about merging ahead of EU debugger 
support.  But you are not adding the scratch feature per se, it's 
already in the uAPI.  You are just extending it to support fault mode.
Patch is small, so to me, there's enough justification to go ahead
and get this merged now.


> 
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 +++++++--
>   drivers/gpu/drm/xe/xe_vm.c           | 30 +++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>   3 files changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b6f781b3d9d7..bdd84b109e9e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	write_locked = true;
>   	vma = lookup_vma(vm, pf->page_addr);
>   	if (!vma) {
> -		ret = -EINVAL;
> -		goto unlock_vm;
> +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> +			vma = xe_vm_create_scratch_vma(vm, pf->page_addr);
> +
> +		if (IS_ERR_OR_NULL(vma)) {
> +			ret = -EINVAL;
> +			goto unlock_vm;
> +		}
>   	}
>   
>   	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 389ac5ba8ddf..58e0309556a0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1262,7 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   		}
>   	}
>   
> -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> +	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
>   		for_each_tile(tile, xe, id) {
>   			if (!vm->pt_root[id])
>   				continue;
> @@ -1998,10 +1999,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> -		return -EINVAL;
> -
>   	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
>   			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>   		return -EINVAL;
> @@ -2783,6 +2780,29 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   	return err;
>   }
>   
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
> +{
> +	struct xe_vma *vma;
> +	int err;
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return ERR_PTR(-ENOENT);
> +
> +	vma = xe_vma_create(vm, NULL, 0, addr, addr + SZ_64K - 1, false, true, 0);
> +	if (IS_ERR_OR_NULL(vma))
> +		return vma;
> +
> +	err = xe_vm_insert_vma(vm, vma);
> +	if (err) {
> +		xe_vma_destroy_late(vma);
> +		return ERR_PTR(err);
> +	}
> +
> +	/* fault will handle the bind */
> +
> +	return vma;
> +}
> +
>   static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>   {
>   	int ret = 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..ddd387333cd2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>   
>   int xe_vma_userptr_check_repin(struct xe_vma *vma);
>   
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
> +
>   /*
>    * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>    * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
