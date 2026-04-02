Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5102A1112246
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 00:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B3210E1D1;
	Thu,  2 Apr 2026 00:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6tfee/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9EE10E1D1
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 00:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775088565; x=1806624565;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LNhbh0324iXbsYqNqdtnGygWgh7mMc3iJtjcus5B17E=;
 b=A6tfee/0bu6JauxaXzVKlx5SXj4VFc8t90+ZMUxB+g6OPt/vDD2yfN6B
 f+iIAkL6SVKs+nme/dArH04EzJtFA6Srt+L8T4aoVaZv4tU01w8YW9nqH
 jVjgrE5VcOmgSA2RrMdD+WJn9Ud7yuGKaJI6Btq9KJVmtwnZ0ZUN96Cri
 MMlJ3qp2GWpxquO2gzEBvLwiGZ7NsjnkZsQZP6K16QvpCupuVOVlcciht
 HQPtv+vSi5DzFQEYmqjVuyPqLJkYz6JLNKLvYRRbto4RQiKnXg8E5YLoP
 qpcPF0ocA+G+Vw/MgfNt7LXgGsm6L6eoHpNERN+kQ6H3VVkIh2yUVG6p4 w==;
X-CSE-ConnectionGUID: JJK6P1XhSRijKIVn1+H4ow==
X-CSE-MsgGUID: DxkxhAfuRbKSi1Q4mvj93g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76157430"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76157430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 17:09:24 -0700
X-CSE-ConnectionGUID: 80TBnxqFRFmprIY87mr4MQ==
X-CSE-MsgGUID: i4MLrTxTQ0eltfCkA3FKEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221975389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 17:09:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 17:09:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 17:09:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 17:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUIzY4Z2sxz9T5xiaxt7Np9dRzM8cD1mFuBY91uUmAJCldZaNNjuzvoBZLEg+I8kHnHI4EitBFTuwdCDhII1zVubaabeB2rPAKw9n690UiBuducReSaCBzBnQcLMQI4bSzm95U3cY8PONjygWC7MvyS8n+AF2Dxc19P5nHMyMMdE2vkWaPdxHgT8bQXTZLQ5OiGoXZ4AOFL4wVxak02Uj+6FUlPwdUcuMLhjbdvq9YIhmTUNOUdPoS/7eRgf2Jki/GPXyzusBkIYEeIpFlDFy5ex2j7hqLMb8FmabqRszqX12dVDfapT2WBCyE8lrMqgqhYqN+zWAOVpx3C5fA02oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTImnXpreu7gp3j+0ylp2yNQT1sGrVuMMNqsx09eeXQ=;
 b=SMFkj1n8tJx/Mh6jeNuZRKPKWYZ0+HhPGXA9xdkbb/yjnUjqlXcbppFQ+0yxeUsTWXZrOyHN07HU9yH0jaqnnhERTF3A4NTyy2FL+W7FU67Q5GUE9enpHqyMEPSZtwicOTvHfq0EKH7O+qQ8NMZMdO7uBFKKgNrZltSV4yz2vvdTN8HKk+29avkLWQScqtZ3XvzVlxhfciBcZjRwZjg2GlTjwOXwrWjeLKYhg/X8k9M2901WtPVrU6qFVvO8p04IFg/RsIbd7cU7J1p35OqZTWG5voUkpx9RAHO0Wma5vN1/2b+f8CbZnhE7MUu5AiG62rvlIvesF2LT3eCZjRUhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 00:09:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 00:09:18 +0000
Date: Wed, 1 Apr 2026 17:09:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V6 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
Message-ID: <ac2zqvxb0/hxGPgm@gsse-cloud1.jf.intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-11-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327114829.2678240-11-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afbb740-f536-4e1e-6fdd-08de904c156d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: mBDUZpZNu/+dp607v74s4R52mlIbo0zViDZio1t5HvXZb39eYA1LrG0WJEpsfS6TvZkIeXi+uGBb4dfJrvGfAwA2LjH/8eUtvyCReunEPulRTsJXmHlhgP6ZYohKVuHrrBEN7xmUOipzf6gaErKAf+1Je+CxCq1//FGieFqi+MN5F/ZnrVa1xmgLaZOEMYi7K2y8AQZ4bsWctbsxEy/Q7pGELIlistUKxFLctxbVWxmgn+BgfMPLSsLZtYhOtwKUCCN0LbjC0JSwpi0ExXjm+rpkPvTD82EpDT9mOtI6teGbAEVj+kpBjHPNL7DPVvfgJYSaJxprnmelCBepjGleJR+Zcrp6k02DFpoJ8tJTP/wUfWB9RAPgoXE4FkAd0Z1XCGbGwSOAkwMFwczF6uy2EJCJJyDeGUZ1p+qOjl47/XJ8X85vfqE7/H1dGGRss8gg/svj5T9SOw5TMEp4ObCZgHTynQ4pxdtUjfuucRcWp+myZSWbulXVI1/XmUOrPRnwFEC0ixk4GlFuPehKVAIr09Q8Zq5sbdEys0k67/IcfiWn4OXbdreT+cvch42Pmuy+tAOZmGPCQ8G4RjHixi8eG99Ro58bSTmnngdvVfLTloUd/QLV9Ce94zdjoUsDx7SrHJbG82Ic3xSWHK9kGGnQwi+D4/31Ul9f/51aOkp/92bdzq7ovJOMWzB+LW+77jWH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5iQjVOV3hvTC9ybFZEZnlZNmU2czJNd2FvdVc5WllEWUQxei9mRVhGekEr?=
 =?utf-8?B?cENvbEJ2bEphUG94dW9IS1A5ZGc1eXVrUVFCT21BZHNMRkNscTQvSjQyeU5Q?=
 =?utf-8?B?QVdBNVJqTkhpbW5RSTZlUmRaYXdXdVYzZDNIcHlFcGI1K3orU0srdUw2bVZh?=
 =?utf-8?B?dzJoZEFPbXpaZmxmWXF1WmtZUCs2U01SNzZNMDJVZVFkQUs3bE5ORm9CWEc5?=
 =?utf-8?B?b2tNb3ZpRDFQUkJiNTRqY2orV3BXZm92REpSSlllTHBGcitOYjJHRnJhTnBx?=
 =?utf-8?B?Tm5qeWg2cDFVRENsUlZQeFRwL3BMWVpmUkN0Rkw5V1Boc0QzOFlvRW1qaTlj?=
 =?utf-8?B?TUJMOWJXYm1FTHp3dXBHZVVIc2NjSUhWM2xTbEdPWEErQnNQR3c1SEZuTjRC?=
 =?utf-8?B?QlNqWnd6aUFCQWg5MHdhYTlCdC95ZWlET0RhT0U2U2ZwUzJUVmdNYWw5R1BV?=
 =?utf-8?B?NW85MlNWQVM3Z2pNTzBTZVVKM2pZaWx4bmszdjR2TlpTOFJFaUJWb3Zreno5?=
 =?utf-8?B?VUVZdkNldXNmUjFqTjE3VXdORHpDaDcvVUc3WFJwd0JiNDJod2R3TWdpQk5X?=
 =?utf-8?B?a2VGRlY1ZWhwSm8yeE8xMzV2NWxoaWw2U1JId1RJdUFjTkgzcS91Yk85K1p5?=
 =?utf-8?B?eHIxYUQxNERYdjlXaTRvaWYzeXNDa0kzb21jb040WmpkeERaVnppMm9RWlVt?=
 =?utf-8?B?d1BNYUdwTkRnZmFwelJoWFNKeU5xUVBuTzdud3V4ZXVqVzJrMit0aVEyOVA2?=
 =?utf-8?B?bVAvSHZhL28yVHM3c2ZaT21LcDVMUmJpbWpodUxKdDQ5Ti80Q3EwQmZvVlVN?=
 =?utf-8?B?MCtuOUlEREZLTENvbFIwU0tNMjZOcTJRTmNpaXU1Z2dOVHVTY1VkT1RDbStj?=
 =?utf-8?B?TTNKNVREdU5qY0NIbXF3VjYyMHBoOTJCMTdOc1lYd1RvcDFUdE8xU2diSlND?=
 =?utf-8?B?RWdkTFVxaUtxbkh0cGhTUFBGU2dLWjdyQ09Udjk0MGJLb3QzSmhUNVZUSEhG?=
 =?utf-8?B?aVRFdndRTi9wM2hvbkUxaVFvcTVmVjBLM1NXTUl1MXgrWTgyQUtTS2pnK1N5?=
 =?utf-8?B?TmxUMkd6elZ4cC9OWVdwUVFRaHFFUVF5RnNVZzBFOEg1dHl6YnNRcWdiUTQv?=
 =?utf-8?B?UnhmNmRXYkJSL0JkZS85UStJdlJhaitndUs3NmdtMXd3R2Z5SnpJZTg0T0Z6?=
 =?utf-8?B?OGFFYmoxVVZKK0VERWpLZFlQT3p3Sk1xeUNBNGtGd3FTbTYxWUx4c2hNOVE3?=
 =?utf-8?B?UnM5dWdTdE40eHlPbzRFSEQ2V0ZzY3hlNExVMHBQakhRSnU2SytLVjdPWXpY?=
 =?utf-8?B?WHJEUEJhUlZCVS9kRVFxZmxwUWVwUUZEOHpnZTlIUXQyM25XSDAwc2t0M29q?=
 =?utf-8?B?Y2lLampRVC8rOVlQZ1RVd2xWK25xTkN1UWlvUHN2TlJySFV2VEpSWnpwRWZH?=
 =?utf-8?B?UzdtYmNzMndzck1xQVVZV2xKYjA5QnliclBzOWlkMFltZS9adWFIZG4veXRs?=
 =?utf-8?B?aWRzeVVNYThCVlNWNjVWbHlPa0FKR29SWkFBa0tmcjZnT3JyOW5nL3lreEUz?=
 =?utf-8?B?c2N6eklMYjUwdk4zLzYxU3VreURaQkc0KzdtbmlBa3JyQWFLRVdrMDVFQWxa?=
 =?utf-8?B?NlJzVi95VUtBNHRSeGF4U2szc0FYWVp3R2k0WmExcmlUZXE3SU1SQUQyK0JP?=
 =?utf-8?B?NEpFcG14MzdoTTVscjJ6elNqMWs3eFNFKy9sazVqZFJpTVpPK1A1UFdvTER2?=
 =?utf-8?B?eDJ4dDBVVW92OXlad2lBSTMzQjl3R1UrL1RQTHhsZld6REE5cEw3c1Y5bm5Z?=
 =?utf-8?B?YTI5S3BHbFdqVnRVd1pzcXBpRmJvVTJ1WnF4M2ZXc3A3aEhEbnV2YVVXbU9h?=
 =?utf-8?B?L2NYZUtmOHFyMWdZYmx1MnBIYkU3NDNXR3c0L2d0c0RvSnN1dlYydFpEb0ZM?=
 =?utf-8?B?RlF0WlQ4Z0JCaTRaM2JsaUIxSGE0ZjNmd2lTZ0pZc2ZaUlhQYzVNcGt0TUhO?=
 =?utf-8?B?dVB5M2YvVFZ3YStSVGRKWWIya1JNdG5wbDYyUmh4TmNmTzQydXVSbXAzQlRy?=
 =?utf-8?B?SmljeFl1bkgyN2dtbjh1aWZ5Ums5NmdLemFVTUJJaHczbFdhVS9Yd2xUZkYz?=
 =?utf-8?B?RFlwb05MNnd6RWtIQWZVUGpuSmJIRDdyQldXYThzek1sZVpLY01ieXF1cyty?=
 =?utf-8?B?clcvVzBvSVBGTmw5ODdrajRqZTBQYnBKZWNGVHNaU0VRRExlYjZuQmdXNVRP?=
 =?utf-8?B?cnl6Y0k0WENPYTRyVmxyaFRGUFErWUVUeFlxajBjU2FNcERGWHo2b0V6QUlN?=
 =?utf-8?B?TW9IYk5HWE92ZFlIOWRLNkRVY09VTmU1dVhSZ0RYZkdtNHZUUm91azRYWkx1?=
 =?utf-8?Q?KtvJKPI8QVi7Wxxw=3D?=
X-Exchange-RoutingPolicyChecked: sV0OYF+pGx/1M8b6ETCHp9kmj/cm7BvB5GKTEkrYJlEHvDlTkVGatjOSYP7ez4LBIFLFJORGFzHPk04AT2QrguKvh8VqyZMQhu3IjuUiAWsQg9JjpgNpu4aCnv/PLkst5SH9l3udNqzzn5xSvPLONl0O4PE4NVyzKGch7Ow6yUvr3jPXSmAwXt2+mRyRA2PufDuCi4bKmkpNO6Y7HCOq4m5pzqeiLhcrsZ/XVwyrwJt/6k1qaMnyqcvpNCbv6Mlj2ZeF8r6zbFAKBwKRj3+mr6dmMeK1hJj/GLRBhwib9XG8O6WFI1VH5PXu/siGOnFp87N0vKpDMgYUZsne67D3Ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afbb740-f536-4e1e-6fdd-08de904c156d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 00:09:18.6155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyBZcKpRNj245g2G+dt4l02V3sZ77U6jOYb+A826H//3hOadIYj7cSomZgdpKblElD2H7sNfgI/Uk3FIpQtVkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
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

On Fri, Mar 27, 2026 at 05:18:15PM +0530, Tejas Upadhyay wrote:
> Add helper with primary purpose is to efficiently trace a specific
> physical memory address back to its corresponding TTM buffer object.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/buddy.c       | 56 +++++++++++++++++++++++++++++++++++++++
>  include/linux/gpu_buddy.h |  2 ++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
> index 52686672e99f..2d26c2a0f971 100644
> --- a/drivers/gpu/buddy.c
> +++ b/drivers/gpu/buddy.c
> @@ -589,6 +589,62 @@ void gpu_buddy_free_block(struct gpu_buddy *mm,
>  }
>  EXPORT_SYMBOL(gpu_buddy_free_block);
>  
> +/**
> + * gpu_buddy_addr_to_block - given physical address find a block
> + *
> + * @mm: GPU buddy manager
> + * @addr: Physical address
> + *
> + * Returns:
> + * gpu_buddy_block on success, NULL or error code on failure
> + */
> +struct gpu_buddy_block *gpu_buddy_addr_to_block(struct gpu_buddy *mm, u64 addr)
> +{
> +	struct gpu_buddy_block *block;
> +	LIST_HEAD(dfs);
> +	u64 end;
> +	int i;
> +

This is somewhat of an orthogonal issue, but we really should update
gpu_buddy so drivers can register a lock that we can assert is held in
functions where gpu_buddy manipulates blocks.

Something like this [1].

I’ll defer to the gpu_buddy maintainers on whether this code is correct.

Matt

[1] https://elixir.bootlin.com/linux/v6.19.10/source/include/drm/drm_gpusvm.h#L341

> +	end = addr + SZ_4K - 1;
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct gpu_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		block_start = gpu_buddy_block_offset(block);
> +		block_end = block_start + gpu_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(addr, end, block_start, block_end))
> +			continue;
> +
> +		if (contains(addr, end, block_start, block_end) &&
> +		    !gpu_buddy_block_is_split(block)) {
> +			if (gpu_buddy_block_is_free(block))
> +				return NULL;
> +			else if (gpu_buddy_block_is_allocated(block) && !mm->clear_avail)
> +				return block;
> +		}
> +
> +		if (gpu_buddy_block_is_split(block)) {
> +			list_add(&block->right->tmp_link, &dfs);
> +			list_add(&block->left->tmp_link, &dfs);
> +		}
> +	} while (1);
> +
> +	return ERR_PTR(-ENXIO);
> +}
> +EXPORT_SYMBOL(gpu_buddy_addr_to_block);
> +
>  static void __gpu_buddy_free_list(struct gpu_buddy *mm,
>  				  struct list_head *objects,
>  				  bool mark_clear,
> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> index 5fa917ba5450..957c69c560bc 100644
> --- a/include/linux/gpu_buddy.h
> +++ b/include/linux/gpu_buddy.h
> @@ -231,6 +231,8 @@ void gpu_buddy_reset_clear(struct gpu_buddy *mm, bool is_clear);
>  
>  void gpu_buddy_free_block(struct gpu_buddy *mm, struct gpu_buddy_block *block);
>  
> +struct gpu_buddy_block *gpu_buddy_addr_to_block(struct gpu_buddy *mm, u64 addr);
> +
>  void gpu_buddy_free_list(struct gpu_buddy *mm,
>  			 struct list_head *objects,
>  			 unsigned int flags);
> -- 
> 2.52.0
> 
