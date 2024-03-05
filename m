Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C16C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 16:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B642A112C03;
	Tue,  5 Mar 2024 16:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N53OlVZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6B6112C07
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709657829; x=1741193829;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vBPEWW9VpZYhoLj/n32tl/bSxpNOi7GGHFYL9rG3Hr8=;
 b=N53OlVZYgXI/mejVVWGkRZ1wXHVy+XRpHaHA2jEkC5+b1QmtNrUmHQwP
 klIzFlur4Fe0adIkuiNVxq6rPHIhg20c8mA5o1wp/JpdbKzfir8Kn9avw
 maGoEmNC0plJRU6UL90501JCPbUfOPw9MufL1t8ojE2sOf2FTb0Gpngc8
 oVXla/9JbF/yGXxQ7t4i378CRcqv6SZOv2FY6x8AbFsWBmfUmJD60llv/
 LnLdmqkukeVoxS8t7grtaMOUJ6aCqGec6K8VwYsht8RwHqMcqPhERwVn7
 piIqFljUMHRA5kmxvhlOCHbQW6StPCr1tatTKeeSQZw+xlD2kEQr++hPF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4082850"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4082850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="40318579"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 08:57:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 08:57:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 08:57:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 08:57:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTKdkWRRRuMtOXc3d7pzeRZytoU3aSN3zjul9+JtIstOyZnVKQGYhsypD8kS9+CiW4pf/UtTqFXzljL2agnBr2M5R5eBIcwdfLZaT8jcVX+s1vBHqm651R8v7BFINNQFbnDJs5OL/CrJJbIfDmj9pv7V769eSoHeiuS34LP2dJYq589kyA4js+YKtFac7SkL+jRvqcJNT0aFpz0EM5aHqaEmC9GiV9PAIMHkZUtfqBRUwolzg49Q9LCcqg/uSAFIn5BKQe6YNvwz06kiF/lBTmFaro5jGxpIO/AHXV05xsLTpF1WpW/WXsiPA/V6GRrZ1RBZ2nI4WvjJ2AKhpYxbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6maTF3RNhkGxHg5RTF17vGkhDtcENU0DS8x0CDyYhig=;
 b=dodZ6kbVMjkw24WQS99LL1ez1um7AMeDMi+xujdvtCvTyD1++utnp+1syigmwxwlg82lg/g1svyj9Q7b1hpayu+d93spkUvA2wybcYHOJK7eI6cFTB8SairTuWa6TuXgLL97ZBxiR6YSGP+d9QW/JaLNzAUN77SbEaALOfJ2L+Q/ZuHg+0oDvj4A4wgME/2OZIgc8nSJOkee+PXKraud+palY/NIYirN3kXoOzW9rOISkV5Hm2/gRvxAcC99AP81cH7WsfDLCHxiFMoLqxlmugB3AidNFZuP4tpdrJfiYW1Smc2brbmpuaa6roUvN0Gbym9lGgBAAjY0F999zTcXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 16:57:05 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::159:6973:a052:b797]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::159:6973:a052:b797%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 16:57:03 +0000
Date: Tue, 5 Mar 2024 08:57:00 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH V2 3/3] drm/xe/arl: Add Arrow Lake H support
Message-ID: <ZedO3MVFZx0mVyvQ@msatwood-mobl>
References: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
 <20240229061331.3398966-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240229061331.3398966-4-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|BY1PR11MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 470b7048-9d39-45a7-c9ce-08dc3d35480e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2Tf5cVDawohVMPXI6YHeetmQT4IeUMqtppJlgDbOgEvKC4zF6kLJJ4Txkb6+iNheyb1/8BGeyCPmpnJ8Zumcv1u5WkJUUoFCYpn847+b50lOxcfNLAaGzwkoUTwnMBVzH1K9WyEwvFiAn1HQS/pd1x5BJV6uq52lHNiHKO/rbNaPBoHOVBlSuqwyy2MdrM7HIRnsZbRaTqZm475JfBfKAioX2x++GwljwF4Z5AsnyLAOPT9LAHlPfdSIo5ewke5djumI2dZHO4s3dAyocV7HJ9brWx4XW7DBzn31RatozEMSnwXZTwXBfa7R3fxB+cYya/OPkJ1MaqYNf5B4VygVVpJmv/Zm9juAOZeT2IOY+TUkalwYPcNN5ZjzZNPJ1P/ltGNyIlJM37fcCKovhXOQ6wAyyS7u9DWKV3pQ+rwTVhG2Z5rvcJPwjz+otjVhhPTWR9mK87XqO80P4rCiE+jRXFIo0o4jUJdzMbrfq6WyfvbzCpaO8q7rK3Kj1XltL57RUCxUIUO9vwuQWjvfBlWmgnuXXWRuiFHOM6dePwRVMdsUXidsj8yiNnOzpzL8xX3TOl0KAQWBgX96NxhhvvJpawPBrK2eZvIzaLTNWDRbvxxqReZXRso7Mb2xB1OS8vYcvqCXI68i0AAvxYrs+y26moauVFdyU5Delgi+q26IPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlDS0twbVhNSEwySzZBcjNWMS8xZVJvWnhidXB0SSt3YldNbTFEcFQ2QWlL?=
 =?utf-8?B?QW9UWkNkeUNqNklQeWdOYUNRZmxWdThpQXRsdlloWGdoYmZlUXFEMkt4VWhp?=
 =?utf-8?B?ek5SL2J1VUQxWGZxVDE2eVhIQzhNRVNhV1VPa2RjSGI0QlFLQnZmKytrdE5S?=
 =?utf-8?B?WlBzSjRlMUk2d1haWFlVOGtGRDh6S2lMVmNGTWppdCs3RUJqUTZYUTAwenJh?=
 =?utf-8?B?eVRqS0crbGw3bUpoZGJvZHFUbnpiVldwbmtNd25jWjNHQUdZWUVtMlVUOHdU?=
 =?utf-8?B?ZFBac054amRsdmNRSVQxWTk0V3RCTzcveElKUVhGNEl1YXNkc0labXFnUURD?=
 =?utf-8?B?dlppdHZhZDl1WU1uQVUzKzZzTE0yWERjME9IbHczWmhTR2REY3hvYmJsZ1Rs?=
 =?utf-8?B?MnpVY0pjQ3dnbjFDbzJNOTRQSWRyei9qUzNxc3lzbm9yaWVhbWVkWmlOWW5K?=
 =?utf-8?B?c2doZXFxbUZMbmZHV25BYnM4QUwrOE1rMmVGMVB3TTZwdXFHN05ScVVSdVFl?=
 =?utf-8?B?OTU4bkIrNDlRSTBSVjlnS3BRWHovS2YzZ0M2c1lQQldLWnhnQUFKVi9oZGw0?=
 =?utf-8?B?azlWSVRVTXBVTllZNE1DeFRTUEJoNVdGaTc1WVJFLzZHVGZCV1J3ZnhvRWQy?=
 =?utf-8?B?dXlqdWU4bkZtZ0VEbkpNaHdRd09XeEpSajRQd3RRKzdjTTE2bklFYWdOanox?=
 =?utf-8?B?RnUvaTVwSUZXVDJJeTRyYllWaU8wYzJ0V3lGd2RrbzJqbXVicmQ4cUMybWcx?=
 =?utf-8?B?STVQd2dTYnZUV2l6bGEzZEJsK0duZjJ4bm0wN2tLanR5OEZxRnRVaGMydytY?=
 =?utf-8?B?UDNSVzJpTkVNL2wvS0ovaUc3QktxZkhZc0V1MDZTMlFOdWEvTUdNc1BSQlB2?=
 =?utf-8?B?TXg5MmIyeS9acUc1YmxDNDhERllUNnBTRDZyZlZVRXNTbGtJVGtxVEttZk9R?=
 =?utf-8?B?bzFMemxydng4M1cxQ0F4RW1BNW1tanZRdmhDTW5xQlM0Y3JNQWMwTHNGU3FH?=
 =?utf-8?B?UDFmaVpGWGozSDNkMFQvUkJ5alRVcmVEd0piMlNqblZyTmtzS1BEMnRWVFhu?=
 =?utf-8?B?YmI2Vm1vOFVLY0l3MEZJQVpkUkRWUmRESkN0WExUK3dnTS9LOUJvZ05kR05U?=
 =?utf-8?B?d0MrV0w0RmlDeWFvMk5naFJyeldFM29wSzcxM05xYkM5Zmd0VmhENEtPRXVM?=
 =?utf-8?B?MGtPMTJxTU5rWlBnSmRDMG9DMWxrMkVrT3NGZzFwUXBUTVNHRWU2L0JtTmNN?=
 =?utf-8?B?OUlHN09UZ3RFaDFDb1Z3VHlYNmwrOVZpSFdLbzFMRTR5akZJbTBPNUtaaVo0?=
 =?utf-8?B?T3E2d1dBQjk1b3ZjSStqbGhYRXFHb0d4Qm5qWldnMXh5Uk4rM3BoRWg4WmVC?=
 =?utf-8?B?L3dqeFRveU1LVGhmYitQVFo3aDExNTdveXd6bWRKbEVYb1FmMkpycHFrejdO?=
 =?utf-8?B?UTFneE96cnB6MW9GQ2g5cXdFaW9zREZERjFla1dqVVB3RDJvRjJna1RhTm5I?=
 =?utf-8?B?cjAwSktpV3RnTzA3MUpENCtxSlJDdE00eDVCWUV6V1BQQTFUY2NMNkV4OVlK?=
 =?utf-8?B?aUwwUmh3czNEQThHSVM0bmdjMmFiNHg4Z3FJQURYSmIzS3A0eEcxa0hWemR1?=
 =?utf-8?B?dEFMZ080MzV3UDNMeWRzeDNTNElHVytObDRibGxtUFdRcGRTSFZGTVJCdmFR?=
 =?utf-8?B?eDZDblhlT2NiZTF3d3lvaGIrMVdWeExIaXBmTlB0N0ZXUnArV1ZhbWlQUGtL?=
 =?utf-8?B?MUw4eERqRzRYS3NUdit0alpJanNNcTJyMldPaXN1Z0owL0tSRnhSQXZwVlU1?=
 =?utf-8?B?Y2E2OFBDNnZ4UFBaN3Npdm9XSS95SWtKYnBsOVp6NnhQOUgyN1Boby9OSEZj?=
 =?utf-8?B?c0laSENPVFcrdTJ1K1VsTlU2OWZFVjBmbEh5dmdWb3pVd1gvWFR5RnM0bHdK?=
 =?utf-8?B?WXZzbjJrUHlBckpjaDVac3ZDTVJLOW1jUjFLa2tkT1FVK3RFclI1a29wbU85?=
 =?utf-8?B?Z0puWDFYTGNzL3ZSU2FObTJ3MFJvTE43Yzk2dHk3U0IwS1d3cmd3U2lCS2VU?=
 =?utf-8?B?RUhtaU01Nis3S3lrVHBmOWJUTnJFZzkwakhlcjU0bGgwYW1mR1Q1OXJCN29s?=
 =?utf-8?B?ejlCMytiR3RLSlp5V1lpUitDN240SjNUVnRsWVF3RmxXRUthQys5VnFmZ0Fv?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 470b7048-9d39-45a7-c9ce-08dc3d35480e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 16:57:03.2446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8b1xC8g7jVvywSicrqyXx35da7+4FeWI+u8uLhcylF2gmY60Ex2CBDX4fxRcq0+9u/w5YJrqicGSVKzcXrHgWgiXSEmnL+iHVK6BWS7nPSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8030
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

On Thu, Feb 29, 2024 at 11:43:31AM +0530, Dnyaneshwar Bhadane wrote:
> ARL-H uses the same media and display IP as MTL, and a version 12.74
> graphics IP (referred to as Xe_LPG+). From a driver point of view, we
> should be able to just treat the whole platform as MTL and rely on
> GRAPHICS_VERx100 checks to handle any spots where ARL's Xe_LPG+ needs
> different handling from MTL's Xe_LPG (i.e., workarounds).
> 
> v2: Resolve confict and reorder PCI ids in sorted order
> 
> Bspec: 55420
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  include/drm/xe_pciids.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 2b7c2003ddb4..ab4a8987ac65 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -176,10 +176,13 @@
>  /* MTL / ARL */
>  #define XE_MTL_IDS(MACRO__, ...)		\
>  	MACRO__(0x7D40, ## __VA_ARGS__),	\
> +	MACRO__(0x7D41, ## __VA_ARGS__),	\
>  	MACRO__(0x7D45, ## __VA_ARGS__),	\
> +	MACRO__(0x7D51, ## __VA_ARGS__),        \
>  	MACRO__(0x7D55, ## __VA_ARGS__),	\
>  	MACRO__(0x7D60, ## __VA_ARGS__),	\
>  	MACRO__(0x7D67, ## __VA_ARGS__),	\
> +	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>  	MACRO__(0x7DD5, ## __VA_ARGS__)
>  
>  /* PVC */
> -- 
> 2.34.1
> 
