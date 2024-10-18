Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EDDD3DEA3
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866C710E170;
	Fri, 18 Oct 2024 17:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrtQ32Sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000DB10E170
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729273221; x=1760809221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2T6O3aHywoNVXzDvqrK0YM5mVxkkHWq/6/m4+kluE98=;
 b=mrtQ32Sg5dLz8dmp1wg4dQQtyktCb4N+p5JT58w65nziz9KrPqqhY4zH
 Sp3WhDM8nVUWFarOovnsE/GbtS+1qycjlYcI5cw7tY6JhUXeId56Cbr8u
 uWJA37RCHTIvBVnMLgC8cG+vXcQ89j2co1FrqaKd5wjz8QdXvvIjc90Cx
 qD0+amhgbBHGvlW7lzJPftNkG9tHYJGqE4VSgKhoqVWbBLlfw0VeeiHxo
 /J+hqhAhDYedENpJl1nwBI4zxfgw8SMehP3LlOWTLz1+lGd2lksmrcrxU
 SLkgL0AP9XzrMdajeclmbCN22EVWDqjHzzBfpg0vp2ksd5OQgat3rhrm8 A==;
X-CSE-ConnectionGUID: fmjWfI/tQbC4wc1cHoieAg==
X-CSE-MsgGUID: XuO4tUZVR8u/CEOIMSZcJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39361480"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39361480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 10:40:20 -0700
X-CSE-ConnectionGUID: efcFogkhRbiMJvoOqi1vKw==
X-CSE-MsgGUID: d4w5iReOT3qJ8T1iqst5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="83511879"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 10:40:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:40:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:40:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:40:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 10:40:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 10:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYkSnbIWb5yMG4YVoh4ZOmyNonN8eDyjRCddYI24Nv1X70qvVNRun5/9LpiaGUYXdpG1NG/bHuyasHdH4Ou2hx55r7o0FmXjdEksabEFCdKsw+LH25DorUuuJxgYRvvLLjJm+OV/9gjf3cRNCpJYuUsv0197Ai9hiEDJIN9Vn6WqYPwWBi+4l7uKUoGTD8uFHK6cT8c5fTlwYORLm/TfosRHabK3adUt724PABBpvDDWtYgQROCUcDyZuBqAHH1tQ6GBXCoC6I610nmpt0CUCOOfZBLo+pmE59lxh7eYjPuA5Me3WnwphZ+jOcM9Ao7ZjFUOzG+newWBRfZoPmMHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/WvCPDjfBE3gMpRte4T8qWz+9IFHCXHchsNsG5TQZA=;
 b=p1GYNJ3dtQDLn3WUT5c4qftyHpowSrOaApwtO0rJEmWW8FYQXLG/Aj/MJaAin6KxG8u8RzC+Z1nlersNsBnQZMEA5i4+UXH8DrCGbjDyrCMrT8kzy0WrX+yz4Ej9zyYo24IijItUPFvRQjyBUQdXW/ti3oCBE5EzmBQZhO+3PbMISigmbP9EQfjg0UtCztTB6C+n9CVuQGVqWHGeNvDkrWOhtUBT7JSbP5etUdoUlzo8m1oDbu7ICYu4tO3oXtzUxPcP6kQyKYIR1vZCA6QdONasJjHR6ypSY4LIlQNj5fw5SOXg17bho3L+QdjJbd5wJ01nnl9/y1reWzebYr1BNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Fri, 18 Oct
 2024 17:40:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 17:40:14 +0000
Date: Fri, 18 Oct 2024 12:40:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI v2 4/4] drm/xe: Initialise display before GT and tile init
Message-ID: <mxlwpmympnhyxkh52zdtnd2pury3hhu7n33i5hjcsdddt4uatf@dxysfp6c24xg>
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
 <20241018170631.6598-5-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241018170631.6598-5-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PR11MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c6f9fc-a5b1-4fd8-12e4-08dcef9bec75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rXFAjlVmJiMDInSZV3qG0Qoqfo9uj/yOGzN2NDSKuuugVO1HeaabA7vhWjeh?=
 =?us-ascii?Q?epMpsL9uP7fFlfVsVfn7auOMpTmCoEP62u3bIFuwNFFXeDYl4aHgf0GxSLCN?=
 =?us-ascii?Q?bSFuTwG/6QaR41rPmadzciz5BPxvzx9Qv1knFgVLVUscYEIOQwTPuCa7d/f6?=
 =?us-ascii?Q?YIBvvGq++FbDKEa16q6ciBgq2/kF+nHIe157OFzpn3csbOkLIze/MpLoLNyk?=
 =?us-ascii?Q?KHsjZZu4kJtke7xYeCUhW0PBWN54CV6Dkdx8cUt4GQEvN61uBU/XcGWSQE27?=
 =?us-ascii?Q?1LME7mcmMoaof3L9dtSNRK79jKHI+r9XmH+HUhR2f2hwis7se5DeP7O5V6u4?=
 =?us-ascii?Q?LbyhrWtZOLVUG3x61bFK0N1OZam92MIQRaLDJU2Rmxh7IhzqQjGO0nHs7SFF?=
 =?us-ascii?Q?bX/RFZ7Lz4kf1MfNPSv0mkJptR4T+JA1+Lov2a6NT5W+dUz4mltZCqgdjCuO?=
 =?us-ascii?Q?h+FWZ3Nm/fo9HmiRBABXNsmky1DT1w6BhzLlM7Welm8mQr31o7U2rwF4n4HM?=
 =?us-ascii?Q?UXiqbf9qDo2ij185jy+JfKk+PHsZv4V2F+K9z8R3eG+TkZrpgV5WqIEZS9L7?=
 =?us-ascii?Q?2JOVXP0+rtuBGQJdH1a2qAV+gz/NqiaEKksDLN4EH17p93B7bP6w9Itah+7i?=
 =?us-ascii?Q?Vf0/EmVHEwQIUpb49E1S8hwG+13JNvJDr6EroK1cdYmLiqppbqy/Chficf0h?=
 =?us-ascii?Q?uqnM5IXOA17PGobCmMRsmwyYxVm1o0ozwZvhfkSYTsbE32Ij36O8fbf4tgvp?=
 =?us-ascii?Q?MnvCEqL/PtDRvHr6pw6PfUsHrMftJy0CE9KQCIv+0NR1ugMk66wQdEvkiN45?=
 =?us-ascii?Q?rAOwv5Mjp0dTlTV2r2XbZICJ5RjAQQLQ5kEG55qiyATlPg/QMM9ipbbI9hJw?=
 =?us-ascii?Q?PrLTikjzoFywV6FI+2ve7K26UzblXIkQV14rZ+MRRndbOV8Ik+fLm2+aoxIr?=
 =?us-ascii?Q?FGhSIkvrLBYozWdjKqHu+bScacf49G87Pk6lRXfHLJpE4JXomfzE1FHLk1Tl?=
 =?us-ascii?Q?NIEW6y3G+zXty8at2NUmApYQwzyPAZL1iL2LoUW3BlledxOCvcd1QHgLPv/B?=
 =?us-ascii?Q?8vUoOIZaqo7ulffn5hb1Y05CWA7xBWfcG2ga5Cyu65WpEu79c1Qp5fHqu3FE?=
 =?us-ascii?Q?Zfy24QAMSVH0Xd/q94Ak40EePRmlLPWeP69BRIKAn+Qk1aOm3kjjjyt61sX4?=
 =?us-ascii?Q?OSNklopk+M3IONIeUDNK/jJdz0/BwYaQQqX75lXRviP1XYR1MMZCtygWxxP+?=
 =?us-ascii?Q?oqVF16GaCVQDAswJgB1iGwvu0LYi4jIXKOubMvwyXJO0tL8IdfSJPX6hSwQZ?=
 =?us-ascii?Q?7YH4vJ+AS/VKnC9/ljFLya08?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jrHG8A9E2QjNjJXUBA10gY4+j1KUwJZfqFM+jCt+6wqviLYcTRD3W3of5sQG?=
 =?us-ascii?Q?ANBJulY8W+O3fCo207uYr7KGgAY85DiuWiyVIcYjyB+AyEVktK4zH89riDMf?=
 =?us-ascii?Q?04P9FeA3DFE6exGQKkSgwFCdrYzoti+mGsqTZJMA7rbfxitxbBUDqZWLUwuX?=
 =?us-ascii?Q?Lo0adcugQlqjeNUhEzspMe/H8DQXAh6dm+yiBol109bRdBWEo5MIc6wStILb?=
 =?us-ascii?Q?6tY/ZJvwBiikPsn2B4PWQ1ca97vTjjaU/9q27JKZQ7toOL1fyMroFyelNpLn?=
 =?us-ascii?Q?ExPGRgFskPomj2XaFzpCi4SC4xYGZk+VQ78iLnsdn18TK/7cg4E/1u4BCp3z?=
 =?us-ascii?Q?pE3jqXH9VhPq+41sng3Lkc4mL1x6yk+XNCpY5NKzVHfpl6AcXQGtXf8c+S0y?=
 =?us-ascii?Q?e3uj8VqsMlNhZ1alH1APFWd7kTkg6MUKQ3Qhlk340h1k9t1txfOBcPdiLeHA?=
 =?us-ascii?Q?DDZs1c8cRz5heEWX1LE+wkaXWi4PHN9vJUKDJP/y0D5Nnoes382IWyA9tvcG?=
 =?us-ascii?Q?1XHysqFXq6oTHnxGmQqsH1zgS08IGl5Noe3h3CG7Jhg+sJOPf/DQI34b1BnD?=
 =?us-ascii?Q?Eoz0C0XASgBhT3pqFxS7yK9OXvCp5pQaO8EpvTqgPKs6KDJTfIgmskvOJ0Pw?=
 =?us-ascii?Q?efWpGDxHQ6HkeP3n+SXhe94Zii9RvSHnfhtRzCP90zZwk0GJyKF2F07RGV2w?=
 =?us-ascii?Q?lIyJWjUlKjZ7DEY1mLdGV3X+Sbovk15OqoNaCQ6bXgiH/89LLVdGRs50JYGG?=
 =?us-ascii?Q?aYZERGQZLfQz1KFeg5gDDvc+O13zIp+SpV+r2Rky4diDeC3Ott5cs9qQ/ZU+?=
 =?us-ascii?Q?QL4txMQMqx1AnFWUALdDtSKFtxVVX+9hkw5OgiPXCWO0gckWMnVemGdEj/JH?=
 =?us-ascii?Q?4BlKhHypdBCbGEq3oYC6v5D0ysEAqp0tRXtb+Kv8hOd/b6u9yDx0I0DCclxo?=
 =?us-ascii?Q?pYUmdzs0xB+oocrjWoet1c1cAKcPKp6Xa9Fy0elbV4kW0FiWoyCN2vZdLphk?=
 =?us-ascii?Q?oqMevYFrQ7gBjRX1C8G27HKjRH5OKKzBGwKywxOlxm+0eOXnP6AZHjqLhxrO?=
 =?us-ascii?Q?EMFJZqmiaWjwFyOjJDsdVw8+WYuvrPTOSo9IBuEwFba6Xp81DBa2tbmNA1Cu?=
 =?us-ascii?Q?735vH7h8QZcUVrcF/gRGKNwd706w9Rl6cGrPXg9PQOSnSALu4qO82c3sKxdI?=
 =?us-ascii?Q?/wguwa1TR9X7fdFvksa2xQE8i1/f3FpoNe7V+mE4NC3dadIdKpEB4rRxQMBc?=
 =?us-ascii?Q?ZHQk6jHFOi5cOxMBHWhbAk0MveryL28s4KgZWBidnyXwmNhQBPC7Vmq78du+?=
 =?us-ascii?Q?P8jlqeSK4RAGN5KKmp6yLB0jDgfvKKHLOsoaVTpn5VsSnrN6EfpHsB9C20pT?=
 =?us-ascii?Q?J1Lap0t4Oo4YGwQIdJPUyuX8WhcKaCsOcv/cdYujDD2dcjIjZB+SUzwlSvme?=
 =?us-ascii?Q?zQB7NZ1EOfnvhFQ3bj+QE+kFEXl3HXePjsaHb9RyhFX8GjVZwXdbKT+qQQay?=
 =?us-ascii?Q?SOt6X/BMeg6yV0aORMxz75A8u8MPZUBsB2/h/LRjNbaBEPvRu08uV/eIdCEb?=
 =?us-ascii?Q?ZvS5tERGcBF9oiple9SuKA+Sd/lukBAFpvO7MnJLkp01Z5kfaPx6ynJGOdbm?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c6f9fc-a5b1-4fd8-12e4-08dcef9bec75
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 17:40:14.7706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdQDWUlQwteiVFaCovzFn1Krkw61OUbW0UPkan2iH6VxuPz848unvsK6qnz2CENpl4UWD6SPTpPEzin75zWbePSTRHhmwpB/mFddm1c9rcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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

On Fri, Oct 18, 2024 at 07:06:31PM +0200, Maarten Lankhorst wrote:
>Display needs to be initialised first, because we need to preserve the

this is what xe_display_init_noaccel() was supposed to be doing, which
can't be done before xe_ttm_stolen_mgr_init().

It looks like recent commits violated those comments :(

         /* Allocate and map stolen after potential VRAM resize */                
         xe_ttm_stolen_mgr_init(xe);                                              
                                                                                  
         /*                                                                       
          * Now that GT is initialized (TTM in particular),                       
          * we can try to init display, and inherit the initial fb.               
          * This is the reason the first allocation needs to be done              
          * inside display.                                                       
          */                                                                      
         err = xe_display_init_noaccel(xe);

We will probably need a better way to guarantee we don't regress again.
The right order is tricky and we keep regressing when we change it :-/

I will give this series a try on my machine and report back.

thanks
Lucas De Marchi

>initial framebuffer. It will be overwritten by any allocation we do,
>especially on discrete where the framebuffer is not in stolen memory.
>
>On integrated even if we still recover the initial framebuffer after
>allocating, it still shows up as temporary corruption on-screen.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 37 +++++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_gt.c     | 24 +++++++++++++++-------
> drivers/gpu/drm/xe/xe_gt.h     |  1 +
> 3 files changed, 41 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 76d8c6868d15e..34bf62a1bcf27 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -683,21 +683,10 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_ggtt_init_early(tile->mem.ggtt);
> 		if (err)
> 			return err;
>-		err = xe_memirq_init(&tile->memirq);
>-		if (err)
>-			return err;
> 	}
>
>-	for_each_gt(gt, xe, id) {
>-		err = xe_gt_init_hwconfig(gt);
>-		if (err)
>-			return err;
>-	}
>
> 	err = xe_devcoredump_init(xe);
>-	if (err)
>-		return err;
>-	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
> 	if (err)
> 		return err;
>
>@@ -705,9 +694,11 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>-	err = xe_irq_install(xe);
>-	if (err)
>-		goto err;
>+	for_each_gt(gt, xe, id) {
>+		err = xe_gt_init_mcr(gt);
>+		if (err)
>+			return err;
>+	}
>
> 	err = probe_has_flat_ccs(xe);
> 	if (err)
>@@ -736,12 +727,30 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err;
>
>+	/* Now we initialise the rest of GT and tiles, and enable interrupts. */
> 	for_each_tile(tile, xe, id) {
>+		err = xe_memirq_init(&tile->memirq);
>+		if (err)
>+			return err;
>+
> 		err = xe_tile_init(tile);
> 		if (err)
> 			goto err;
> 	}
>
>+	for_each_gt(gt, xe, id) {
>+		err = xe_gt_init_hwconfig(gt);
>+		if (err)
>+			return err;
>+	}
>+	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
>+	if (err)
>+		return err;
>+
>+	err = xe_irq_install(xe);
>+	if (err)
>+		goto err;
>+
> 	for_each_gt(gt, xe, id) {
> 		last_gt = id;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 89e9d9d4db060..3824ae24ecb1a 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -542,6 +542,23 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 	return err;
> }
>
>+int xe_gt_init_mcr(struct xe_gt *gt)
>+{
>+	/* Init enough GT for display init to go through */
>+	unsigned int fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+	if (!fw_ref)
>+		return -ETIMEDOUT;
>+
>+	xe_gt_mcr_init_early(gt);
>+	xe_pat_init(gt);
>+
>+	xe_gt_topology_init(gt);
>+	xe_gt_mcr_init(gt);
>+	xe_gt_enable_host_l2_vram(gt);
>+
>+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+	return 0;
>+}
> /*
>  * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
>  * enable CTB communication.
>@@ -555,9 +572,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 	if (!fw_ref)
> 		return -ETIMEDOUT;
>
>-	xe_gt_mcr_init_early(gt);
>-	xe_pat_init(gt);
>-
> 	err = xe_uc_init(&gt->uc);
> 	if (err)
> 		goto out_fw;
>@@ -566,10 +580,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 	if (err)
> 		goto out_fw;
>
>-	xe_gt_topology_init(gt);
>-	xe_gt_mcr_init(gt);
>-	xe_gt_enable_host_l2_vram(gt);
>-
> out_fw:
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> 	return err;
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 82b9b7f82fcab..58aa95fe0aa61 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -29,6 +29,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>
> struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> int xe_gt_init_hwconfig(struct xe_gt *gt);
>+int xe_gt_init_mcr(struct xe_gt *gt);
> int xe_gt_init_early(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
> void xe_gt_mmio_init(struct xe_gt *gt);
>-- 
>2.45.2
>
