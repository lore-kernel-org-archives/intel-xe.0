Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70346C77B72
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 13:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3853910E2C0;
	Thu, 20 Apr 2023 13:03:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5F110E2C0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681995805; x=1713531805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wx/uQ3nPtj+l6kTXQU7ROKPoQZRmmXMiVQsQmCjlktw=;
 b=fcXNo29Z2gcw3KwD/TFzU65t2IMFlF5sSngiiVYhD2sMhLgi3pr1CNXT
 uX3UWtK4jr+h6vAu8xUpPLCTtv26hHoppURz9rOcmwaH1zmq2EJ/I8eK3
 l9g1d9INoNAc7A/0c0a5LzKaNWNtlsd+g/6lfK8W4SzgKKLgh+TWmM98k
 BSOUArIqK6k8mGsSUqnIK25wBmeG4DenEdbzNMF0/Dv6+MQ88sxVCJM51
 JFdJP0VUhhbrhV1agbPv8BVRnn0EFLHLDEHDLZtmr3ZrDfTvsiJ+QchZI
 FHvaO3ZeAO+6Jbehe/vsQp3uA8Hc0gtRtfBeNfJ1hyzXr9x366avRC5zu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344478635"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="344478635"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 06:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756499758"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="756499758"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2023 06:03:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 06:03:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 06:03:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 06:03:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 06:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxJZJ21DwKLNHjHb73YiGV1EdM5SzPZbp9vL4vGK12S05a1swMHIOSutXrcgh58B0raMeKIp5MGON7CIkpbVAwtmnocPROU78kz3KPTTRexncjfdY+QVpb13gE+cSaT6BWsZ8r2pphqyNS5NZe+B/fF0MlcK5n/BR0VMsMBpYwDFYd5qMv+0vHWPI2niB8+yXs1/3W8vepwdwTSTfPZ04m2mCKh2CSsQ16Pe4lkZ8Yi5W/U/i4778RbuH/usvjVWUKo4QpWidWu4pNHNO6SxkLGIyI2BteU14SfedDy6hncaZ6FivKXQhNF4nYPj3GwSg4ZHeOTGziSpWIkqal0Ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyaM4wP6zbUs2F74BzI6yWKQiQLMXMOGL08AZPZq0lU=;
 b=I398bKYiPtKLIaYlymfa1zpiN4bB5nt2llH9CGReYzncusDtBRoDjKRfedLuVZ+WAHi89XJGjCfSpnR3X6jWjho9deqDYnWSFxu1tviwzmjxwN+1GCAwrfkeVM30FU+tJFANbJjPkzTN8v8ws7BR2CHMIZ0M9t7ymBDMyHa82WDv+ElnU0d8Wc+DcExAnzqJ7sKE9XyAl0F4jtx7ek7QKT0iPEMEv+VmgMF9JZQLGaSsZOYAup//Boq5JuWixmDi5hvxPbQjNHCM7+fLkzRER+Z1Ij2CH0ST2bmFb9oJf5we8maCpgERXlKOnQsl3CM4XDLd7EmbYPq1jtQwHRXBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 13:03:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 13:03:21 +0000
Date: Thu, 20 Apr 2023 09:03:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZEE4FM3uzUZKnzp7@intel.com>
References: <20230420055648.323567-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230420055648.323567-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b03b91-1fd8-4a34-2bbc-08db419f9dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aiszI+RIXYHPpk2A2L9S2BAnwuyCuE4l8bIKl8LKXrYZoJWptqZXKzKG2hv2d/jVJ4YFdzonB/6liCv1ZvpewSDaLskdB6mA7bDGjY0qFSjcfwuAWAuekcu/u2+rK6O/RIxsEhAprQv8UZjRQc08X4ClgiGco/qYzT3d3MguCQ9ei0v32S2DEGZFceyWhooCEmltuvWxq8rOBCsWTzZhKC4/SxHadG9gMNZGsPJrJJBSlPu6QZ1tIooyGF6T6L9IHS/19UBDV3sLl2PwSkyvp2Iy8ufoTd9etw/FQzJz0+UpUQbnY+egCJk6E3GC4f57N188OuPbExIhfKRjTImvnVF21o69JwjaoQ/gvb8MyTTnDggGZictcSJvJSDwIpGbxbg8JCOh7D+owIZsXif+sB4+Td1X58DC1i3sJFv5MdjMpDhFwOteB+nmJouoUFQeZjoSa9kmxRKpHCr5blncV5b1auj/ljFrJ4D967B2UQoKBn/F+2BPpBjHc/5dJ7VRAAje2pVlZd0XSQWfaP00txvf9uNoJGmvatzuwTiq+ANY/EvUrWMB/M+QRWEZ7oub
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(4326008)(316002)(37006003)(6636002)(66946007)(66556008)(66476007)(186003)(26005)(6506007)(107886003)(6512007)(38100700002)(2616005)(83380400001)(6862004)(5660300002)(41300700001)(8676002)(8936002)(478600001)(6666004)(6486002)(36756003)(86362001)(2906002)(82960400001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Omw5X+EQ0LBjVlqP9gzUEpDaghc81oRYAOU1G4XfAA9BvT7DTTqtkqIpB2uQ?=
 =?us-ascii?Q?/Q8D1sqFr0dxPmPcsN315GCK2dUozHcvfCRLJbbQhi3S9LpFUSKbn660gIhs?=
 =?us-ascii?Q?Pt9bOHgE+ldKMtufAiPSGesi6QIyUs45MyzXYIU2JcBcmQec+u5LomKhO/8U?=
 =?us-ascii?Q?s/LYf3HSBTd1Kn4WrGQ3tijqa6AGAZbFcGeYz1eVQcoF/KQKXaHKbSv+TzJ6?=
 =?us-ascii?Q?Epf3MQWvN2I+/M7KX/C3/UOMkZt4r2qCy9y3HXoUaAH/TJ7og8wP2IuZ6a9R?=
 =?us-ascii?Q?YokNSawdrNv+wvrSgNLLZt5h20OJO3ETIWhq/lJwqfOLrsNzgAYsgQLwB0JI?=
 =?us-ascii?Q?5BPcPG1Ie11ihbGjmzO8PpQ54ilEiQBbCtm+efsoYRBSqnzk5Sui+M6HHDHj?=
 =?us-ascii?Q?5lDNKTTzQoPCaXcN2WX/LqFydLHrH1SyMyEwKtbOQthJ+G61eR44/tOwsfv3?=
 =?us-ascii?Q?sbxl6VL9rNwZlrrEB2w33aI09dIUq1Ceop9ct3IMAdzdVnPR9OTVYUkM4TbT?=
 =?us-ascii?Q?rmRqcDmIWf+ggus2IJkvY1SrPbVZu/U+/qvlj36s7IVyVKO7Q+HPmVElWRss?=
 =?us-ascii?Q?gkHdrvMk1NmBGaMA9ewI5Hgiui7os2RQ28iXi5/iSb4YTFakiI+CKrRhZJwI?=
 =?us-ascii?Q?SVCVH2HTCseJISFIhwFYtCShsBT4DGzfWHZAlc8KEa+aiB7vYqt2bbUiIF2S?=
 =?us-ascii?Q?dUvvHAM1y7lCHC/ZN75t3O4f3eh+i7MzofUdPK/Px3P4+PM0SR8idaHba922?=
 =?us-ascii?Q?wfHKZsgoW+52SUjogrepJGkLLWuxy9JHBnsSkbFexoNp91FGAgMS5KMw8hET?=
 =?us-ascii?Q?nTV3nWzqtTy3GmTF12B8i7Di5ZzvtpT/3TzrghQfUw54Qq5pVSLdVzbVxAhN?=
 =?us-ascii?Q?fv3GbwgqHKneeg44s8VOFSaaPdwADIsDnBXFZFvUbCGQcD6lYgkiwGblecpH?=
 =?us-ascii?Q?2a1DNSxB5cDj/0qXo1VoTphJhBbuie46C948P9ydWOIbgLhNPIEK2/UfsVzj?=
 =?us-ascii?Q?7Trdf7xjdzxYo4mTIesXanoLiMAYhd3VU+35MSMC0sgBFAH9sGRlC67sfF2p?=
 =?us-ascii?Q?fu9HQFOKgRZLlG5LfcA1pT2n1/e6liFpKbgKz9fM7pSj/2vrtdFuzM/1BClH?=
 =?us-ascii?Q?q918X2jIfQbk+okCfBcRWSI1l2k8vSbnMnevUmmAfx88Yy6weDNRBlobllKy?=
 =?us-ascii?Q?zm4j5CeEQQBjjrIL6jQRdxx15yaoQycdld5dfe/V4xEsoHZcwO6JfK+7ifVC?=
 =?us-ascii?Q?AOyCBwfNwT9RppLUdDhEUMR2ejLrFdY1g0BustwN7dPEmbX7xAFpIbi73WfF?=
 =?us-ascii?Q?N6JgfXLdu2KK/i2FW2vuJnPmlj5ybrDCTHWmilmzp6irMmnVNoGb2YpxEWx8?=
 =?us-ascii?Q?alOVy0CwpmL5B6SY+gz0zHV8ZbIGc2jUCUUJ12dycPTbkjOkSzzV9KYhUvca?=
 =?us-ascii?Q?BXiDd5KEQ3ldc8Q+3mv0dMKXrVmS+OEbW/96VVspga9MYGm5/i+iawGR4cze?=
 =?us-ascii?Q?oviqWhKM5WzPxnzh4hthB/tdIm57g7IlzeLTAN5Xn1gfOUZoCAF0+Cw+nGLK?=
 =?us-ascii?Q?J9tP09SbIYINNO6PSd2sS4VoWWc7TYHYXuxYyX5/w+Bp1s6JJDRQf3BneHfY?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b03b91-1fd8-4a34-2bbc-08db419f9dfb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 13:03:21.1759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twQWBX9G62GTCUXLvJmNyaWZBuOsyHkAOjPqYhAhiNjL97AmT5gh26dU1wXl4hpFjKMMvcT5e3Fs+0RGpTLp3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/guc_pc: Reorder forcewake and
 xe_pm_runtime calls
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
Cc: anshuman.gupta@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 11:26:48AM +0530, Riana Tauro wrote:
> When the device is runtime suspended, reading some of the sysfs
> entries under device/gt#/ causes a resume error
> This is due to the ordering of pm_runtime and forcewake calls.
> Reorder to wake up using xe_pm_runtime_get and then forcewake
> 
> v2: add goto statements (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Although I got myself wondering if we shouldn't add the mem_access
calls inside the forcewake or even the mmio functions...

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5a8d827ba770..b853831b342b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -370,15 +370,14 @@ static ssize_t freq_act_show(struct device *dev,
>  	u32 freq;
>  	ssize_t ret;
>  
> +	xe_device_mem_access_get(gt_to_xe(gt));
>  	/*
>  	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
>  	 * to verify that our freq requests are really happening.
>  	 */
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
> -		return ret;
> -
> -	xe_device_mem_access_get(gt_to_xe(gt));
> +		goto out;
>  
>  	if (xe->info.platform == XE_METEORLAKE) {
>  		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1.reg);
> @@ -388,11 +387,11 @@ static ssize_t freq_act_show(struct device *dev,
>  		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
>  	}
>  
> -	xe_device_mem_access_put(gt_to_xe(gt));
> -
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(freq_act);
> @@ -405,22 +404,23 @@ static ssize_t freq_cur_show(struct device *dev,
>  	u32 freq;
>  	ssize_t ret;
>  
> +	xe_device_mem_access_get(gt_to_xe(gt));
>  	/*
>  	 * GuC SLPC plays with cur freq request when GuCRC is enabled
>  	 * Block RC6 for a more reliable read.
>  	 */
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
> -	xe_device_mem_access_get(gt_to_xe(gt));
>  	freq = xe_mmio_read32(gt, GEN6_RPNSWREQ.reg);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(freq_cur);
> @@ -610,17 +610,17 @@ static ssize_t rc6_residency_show(struct device *dev,
>  	u32 reg;
>  	ssize_t ret;
>  
> +	xe_device_mem_access_get(pc_to_xe(pc));
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
> -	xe_device_mem_access_get(pc_to_xe(pc));
>  	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> -	xe_device_mem_access_put(pc_to_xe(pc));
> -
>  	ret = sysfs_emit(buff, "%u\n", reg);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +out:
> +	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(rc6_residency);
> -- 
> 2.40.0
> 
