Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD25C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 00:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A543110E2F9;
	Fri, 15 Dec 2023 00:11:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AC810E2FB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 00:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702599104; x=1734135104;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YKQXVNCg3ooh/8By2h/M4fbYMFSz7F7+r2yYF7PKrxU=;
 b=MFF2d6Ungh5VpmjdLiEzH1gGv9tBJ/jhHnL6459PP8IVLBcpiWBzURr5
 YUsbBsCUfm6I1iTfLNte49BfeN45IV5oVcIz+wABGumJCH5fZYODwAGaO
 n94n1MI5vUEGf+z7yTeTRopXK3F+lolhbSQklezE/mOzfeO9RMLMHlgx0
 kQ+FpLcDQW5rLQCL0ez+KxI+Kbtwb6lx/Tor1i7j0v1m0ymhj8ALYu19b
 JYXb3iGNR3urvN3XP5ow+iyqJgooWzHJ0ctD+VfBmtO6Iq5v/xlvASbUu
 qXWFyxHfPQsrSWht66lJfHkHwxhf0+QrNN5yPHVcVs/QgrFI3XKErF/bf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2061099"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="2061099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 16:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844916287"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="844916287"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 16:11:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 16:11:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 16:11:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 16:11:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWloO0o+9Mki7VkakRqhHW8Z8DVCBUTa/uDA1PHEOVHls5GmviDwGWHQLRe+ozv2mMuFU+qQ721lbQnQbZmjz5nxHDJm3YXODHcNF/y2w6EmydsbzeNoJ1vdhC+CuhtMfSS3sew3DUY7NO5qlhEGrs9a7Q/vc2SOT2dWHE1aWee2GLm9H0gI9oDO84fXOphrH5RK7tdoUxYQI4YXZ6Wi29Sw62dMX/4vU1zPKLaKaf6A6hDiu3LjdjAhSfmwSgXbO7aT9HsoRtUxTtEvDsSjmcO+08e+jzCe/urHOue65v7uiASDBLB16B2Qo0Pu6/3rhyXix9D1XiNNEXKVFXk3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkbK778QHZM6eQKo5KrjvHWwBY4R0A4HznRquAUcJPI=;
 b=EMdgyTXPQTS7eNCEjDJJbtvfPJQ+wTR9FcQGBjHeM8nAcetKWb9wGGeQjetNS/GdEt10cC6XCALmilk9ALQIntpveBfZ2hv5JLpVmNopyODtf59tFnLf6uJQWM+SWKwbLLPySwJbGm7p7ayxWpr6QhIRNdLAfrlaIYXvVfw/g1OhlNCi3K/V/zR/hbV2eWH2J8gZTGDw+uNfbWWLoaR2CwOCP5cQvyOE5INoTnZzKo4g2zG102PB6p3Bw7ggyDErQhrTnkhUZHJd29RgMuPcKtrwRvgclkdB42sBwg/KnzWhunGWkLIqkt7L7MrOC5BIu/a5nAUH6PVBJTIArBnVlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 00:11:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 00:11:40 +0000
Date: Thu, 14 Dec 2023 16:11:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Return error if drm_buddy_init() fails
Message-ID: <20231215001137.GX1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214213954.3223263-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 7841e300-b622-4259-203f-08dbfd026912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4f405JzNtwLudAiaspCpB7fH3ZgCIdgDFtF8zm4IRU75DHszzBTOVGQWcOWMUxuF5x6QtSAWtpth6e/UBMotz4PGukjip9dqvVYvw+Wf5bhkxZwJN5oUdtPfktk1D0F+DCqeILWriXDVNaXGapYhmYkS6Q4WWqKtMwNefZ4pQMX6EH+i5vRTEz0TkzxAn7X+HDfK5+hIHO8U0lF+cyUP7HqbE5dvZhrSjWQ+H/D1enNDoZTXpmb6cIg2GlSUJpFLBxg1VIW+NwB2R0bdoQ9xWnHxM2xLiIUhcLbOk0gCYyzqmdgOT+Jyw1tMnPG49xOW/v6S2M+z1kk3m2FCMBUB4UH1Slbhw3Dwi7DDWSGVGO09ZZh/N4Gv9E8WL1SdSqHvkDMTVzFdqTi5Vp/vc5EFsAirlnxuBgWMiGUxWHZ0HTr1H7J/GlhAveZRA+sCrFHEIpNPZkrx7TxWCrhwg+neaxdLySCCiyQ5Rj90vji+N8WYvA3E+FGlU4svrQ9fblwJGOCKuWH3ubr7fdI7M8WEpKFASu66LVO+X5dDBnJqub8ZpdD8cYPFOx83ecTEs0Ra59xQTAiK41L/E6GKnVNGiJkAYDOarvbmOc2mqFJLjTjBy9pv6CgSwl4EXjjcg7n7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(2906002)(38100700002)(33656002)(41300700001)(86362001)(8676002)(8936002)(4326008)(6666004)(6862004)(6512007)(6486002)(478600001)(83380400001)(316002)(66946007)(66476007)(66556008)(6636002)(5660300002)(6506007)(1076003)(107886003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTdyRjFOWDFBUGYrZzRJMzBrVXZHODFnU1ZUZzdaS3ZaMXU2ZkRZNUJVNXNl?=
 =?utf-8?B?d2hNTm4rSnZpTjJYSlZ2dG9ndHFIWmNta05tTExjaS8ramt4cHRyNWgyanZw?=
 =?utf-8?B?R25QeWpkY1hUTDNMWmZuS0VtN3NRTXRDeVFTRVU0VjZzdFBzV0hFR3lFK0o1?=
 =?utf-8?B?Z05sMmdsNlhubnNWUEZ5VkFERXZkZElQU21ZM0swU0JFb1I5OGVRbHZxdXpY?=
 =?utf-8?B?aXMyUXZXMGpLYk9FOVlOR1hPeXd6SWtTeStnWm5TQ3pWVytzWWk5MFVxNlNm?=
 =?utf-8?B?THNXK0FIR1JZVEg2TE5VTlZ2UUlES25zVFVzV2V5TkNnbGJOVDk0dWhtcHUz?=
 =?utf-8?B?THc0Vm1qcnJHa0hDQytrWkl5WE0yZzFlNjlDczRGY3hrWHkxZGZkK3N1eG1I?=
 =?utf-8?B?cTFEU0kyaFl0QTYwOXZvNUwraXZsNjFMZ1dqYVFxNUw5dGVTUUlLekRxeVFo?=
 =?utf-8?B?OEF0OXRXZ3hiL1dCRVJhM1ljM3I1LzRvWmhJYnhIWml1WElDME02bkNqMW1R?=
 =?utf-8?B?NXd1ak53SHlDNE5ZYzNkc0xsK3N1a2pMY0lCUnlLSDdWUXNZMnpSYmRIZDJi?=
 =?utf-8?B?K3Z3VmMzRjZ5QWFudzlxb2wyYnIrZ0hxOHN4MUVSK2EzSVUxcFEvVUJSaTZ6?=
 =?utf-8?B?Uk5Kc0d4UHJ4TWVEMm9iYnp1V2RTMXdaUzA0TGtlS1ArdWZQd3A4eE5RU0VG?=
 =?utf-8?B?VUlHb1RmMmFrYjZqeDZzOWJDS0xLSGFkSUtFUG5Cemx4VitmNXVhaEVJWnJr?=
 =?utf-8?B?MVQ0dkxqZmhJc25TRnJTQmU2VUZzWDV1WGgza0lrR3czYUpSRG53Ri9RNVEv?=
 =?utf-8?B?TUowbnU3OGdvK1F1L1BRZmpMdTFvMnlEcFpKWFFlVlB4eVVrandXZWlxeU1V?=
 =?utf-8?B?TDNZejZ1YTVDdTl0SVVwb1pwM3p3M1ZRbS8yQmRBNk9ZdVVzRkhvL1pmUllw?=
 =?utf-8?B?MVpNQmI3ajc3UEhZOVdqaGh0bk5icTdabkpWYzNtLzVIaG9PU2FJd2IzQ0lE?=
 =?utf-8?B?MEJ2ZXUzdHFmaUh2VjhnWUNGM2owa1RaaUZqYzdDV3B4RTI1QTJvRURkR1Rh?=
 =?utf-8?B?NjFBaHJsZWZScHZwOXYyZHFFTE1aYTdadC8vZGsvdG1aNkF2MnN3YWFpdWs3?=
 =?utf-8?B?YytDSStGMXZSVzc0ZDdXY2NqeFhLUlJTUTMrS2NhMmZjS2xlWDNuTnVIdEZB?=
 =?utf-8?B?Z0pFLzZ3S0dyUFNBM09JNkFGZ1A0c1FGazZ4RDAxWERhSStoQUtOZDYxNTlt?=
 =?utf-8?B?dFV2V3hSOGdNUjg3RmRzMWVjNStvU0pXSVR6L2JmWTVrcEhKbW5HT3NxYVNI?=
 =?utf-8?B?czhFbFRTdlFUcCtzZjFxVGNvVVNhZFJjZG9SY0JtTnRFcExRckEwaEljMElJ?=
 =?utf-8?B?NUkvcmU1UzR1cmtXNXF4a294VUtqeVNMbmFJOXV3eGJXemtZZXBjQTN6Y2p1?=
 =?utf-8?B?RnpCb0p2Z2FOS3VsOExSZlhzZzZqM25RTWpQZXBkZ1NRVTZ2K2ZTU29ZSmRl?=
 =?utf-8?B?djVsaDNGYWhQWXVUaWVGMjNpSk9IWnZGZDE0OG5ndGdvNjdJYURFV211RVEw?=
 =?utf-8?B?ZU1yTXBxRzVJR1BqWkk5T0hhSlBoK1h5RWI5djU3NW55OW9RTGVGNkxiR0Ra?=
 =?utf-8?B?N3V5TmdzVFM2S3dZUWl6S2ttRlNwaXFWMWp3VWVCQ05kelhDOHU1WHAwczVr?=
 =?utf-8?B?OVJGTVlpUkFXTCtOSnUwOWowS21CU1cvUWdsR0RFTnpLR1llQzNyckk2MXVt?=
 =?utf-8?B?ajA0MGRKL0VVWXpWY21TTnNNQ2U4cWRpcEF2UTdDSjM0TE4zdXU1bjk2R3Rl?=
 =?utf-8?B?dGY1NGhCbDVpNXZVZGJ5OEVBNHdzcFNxcTB3S3V6OHEvcjBYakNxYXFCMXNE?=
 =?utf-8?B?c2JKejZnaFVxL0Y5aWFKdTNMNnV4YnpjcHJkekxNTWs0ZWVNR1JLMW96ZkdT?=
 =?utf-8?B?UjJLZis5ZVloVGZteHhZbFo4aTBRYVcxaFFQbEZxR3hkRERIbzgxR1NJc1E0?=
 =?utf-8?B?N0h4YnhOYWNMd05XUG5zdXk2aDIveEQ5eEJWK3hIQnlNTjdLd3R1TEtZb2lB?=
 =?utf-8?B?NnpiNXA1T0ZqMUFDK012UkpsdTBvdmRHb0RsdGJPZEppQ1lQMUErdFNMUHJn?=
 =?utf-8?B?aW9KMDY3cFAycEU2ZzEzdHY2b01SNFVXcnp2SlM3dnU0SFBhSk45TE9jM0E2?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7841e300-b622-4259-203f-08dbfd026912
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 00:11:39.8980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HMpUxlKtx5YkIkvae0aHyaOAzucsnbqrEhTVRvW9eX/2KQE/wwQVWk+YXfE9vPypHErWig/Zgt3JwQcDzeVJUCcbrHiXGczExyA00SAaB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 01:39:52PM -0800, Lucas De Marchi wrote:
> Fix warning:
> 	../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c: In function ‘__xe_ttm_vram_mgr_init’:
> 	../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:340:13: error: variable ‘err’ set but not used [-Werror=unused-but-set-variable]
> 	  340 |         int err;
> 	      |             ^~~
> 
> Check for the error return and return it, like done by other drivers.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Seems like err used to be checked, but the check went missing in commit
033851c948f2 ("drm/xe: Implement stolen memory.").

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 953e5dc0fd80..115ec745e502 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -348,6 +348,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  
>  	ttm_resource_manager_init(man, &xe->ttm, size);
>  	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
> +	if (err)
> +		return err;
>  
>  	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
>  	ttm_resource_manager_set_used(&mgr->manager, true);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
