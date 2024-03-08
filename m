Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CC8C54E58
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 15:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5E10EF63;
	Fri,  8 Mar 2024 15:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDNxy9K1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C2A10EF63
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709911427; x=1741447427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZBpB08Sjkz1EW7vLXGxUeM/P20uiHBPgOT1mZpWnquM=;
 b=ZDNxy9K1TIytc+sHI6LgDFVPcuqs0MZDwMPNw6uhvbc5CaNEXuKO/IzG
 tRBRssIVrtt1MfUhCqMo9ensKXLqZyUxEg7+8sqtvvUJMPtrlBuh+Jzrv
 Rx7+S8nyDa8QbLk/zfEDpsyjuvPt90vpXMoBqI0IzMhsHzKLGEMi08gsW
 9Bcs8sqgBGRQIoT0Y+rciK93+tAgYaffe6dxCod5i4G9SpyFqRtriKbpp
 WJCKWjrtWJ2x1CH8zvhNHWDgqDICqjThs2hAgzbLDATksZ6jsA+G4rffd
 2M6UXEzQ/HYhyLFQL8I7FsIbsa6vls7MHlGW8ExIi/OxWIzqPLdpvYFon w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8452844"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="8452844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10592786"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 07:23:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:23:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:23:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 07:23:44 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 07:23:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt89NZztGQfah5UCU2ydsEAxLFAl6lVSJesoSajru6UNas2KLRGo7BoQxeRta75hMUjy0xZzbQ0r1H8FsaW6Jr3t6o07Fcci6NIcAuee+V/x5KAqScoEAXDMuv6SrfsTzSpjTqMFB1xnETZLNC1lN4cfTab8r3ZaVH2dEnLYVfqC4Ozu2H5ux8GhsWHAyK3V7v3GgVAd+6X35bZUSfDVTSFdRqJAwip9NA6yXkuikuyEvOnYI+6haeCnb8yn2A0kJJJorSJngJC2A0JyYm1JQhRc4FlahFM5pC7uUNDl9xpJ88SYd6rlGaDfc7qfnZKgdG3obvNongyfYE+pCQ9qTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Skhk5SrYVPTynwzsLI4uVT7V/84DyMQsYnSmvI9vuB8=;
 b=I68LuH9lvH5y2Qny3xnZV9q9JadBmjW+Ekumb+0rbNHIw5PgLbAZnq1UE2fLb9GBIViV5q4fyWOOWW72oi5DpCnNwR6znWuBDJHC2cLLqIbseUicGxQAHqXQj+jm3/oYfKx2aZK4o8jkhZphBh5tzkU/o+KyUoJ6ev1UrutaEqG3iWN0PdIbkTdbQTNWt1xXYvdRkptgbrj246oDQ4JzUE0Q6Dw3tCZI1nJQ6ySfI8grkqTni6AyEVOz0fXtNj7ZxQiEz4aUs4GRxttdrTCthFmQbkXjZn/q1blNfGKI9e+xoa/42dghWhKSbJ8QRgEttg/qf60OaduyX3uFlFcBlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Fri, 8 Mar
 2024 15:23:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 15:23:39 +0000
Date: Fri, 8 Mar 2024 09:23:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
Message-ID: <gemxrsxlh3cb6xczwelucd3yh7q2retw6yqmdc34ggu5wcoxlk@6sdjk4az6m5n>
References: <20240308134817.1940638-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240308134817.1940638-2-suraj.kandpal@intel.com>
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ea8a2d-5c76-4195-5f54-08dc3f83baec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAgLIwUz1xMxd5vH8epMaRRtDPXu2M93Nughh/UP0v02bNvNl88/E2q9HGt4Gp2WR+IjEQnKBANBBIJQC2PaztKuc/s03Hvu//UuMMDcO/Mum8lzWB+UPF9tHwFhv9lUC62vInuFryZ8kY1uCPXVXmmCyltrOztX3k8eT/nd3cqXZG9mJTxNfgrlAeCgDXQBF6hXNCFpwdVYPz9CWzwCRTfUDo95njTO28eL2tS2rv11QrmRGATNUqI1mXmo6L/c7C7334GADjsphFJNr0dZmRkOvRobR1t53g4db10r4zfgb36nZNhgLKW7RJ5hX4l4TaS0BhgmZ3CoObAtf5x8lbKU6Qh6osbeb6zmcW/HmwupsFlx9EzyrEgs2mCqXooeg/qoyamDZsrx8OEQL6M4wP2jcVBgrHM8ipwENbsV7aCOZ+seuDmhD1RgGcf+2/LGsXmookHYjxi41/cC9xrq45pfLAtwWyyddUNLmapoyJy6urpbwD7ZAsqyegrcNveq90zDP2rf3jRkINDGop7On0/UFtHZPL35CivbC8ZAp0pvGvfvzIsmlETLDA1B4NvQcpCbxf+9X4y+JscWv8eG4VZioMGszhIpkM/HGrfdzel3Y+PWgtTRjPyF5YhIQ6UwcxAp6WtfF9k6iq+7xoDDr/4qfDw9e79r99YGczQc/rA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n6xSox30TowmJfgV7eZbx3ZvLragDC2UsqJpbMG5ksb1MrDgHupcUj7GfYE8?=
 =?us-ascii?Q?6KRwr5aJsSpwOOV2EkgQaMsIEHVoFeByLo7V1/IMfQSYKTPeP5IUqaPUpIqC?=
 =?us-ascii?Q?32OqwvWjzjZKCyniZAFB3QFraiZ4mmLnorkMzt46L5hHUWycHJxEFrQup83d?=
 =?us-ascii?Q?luIfvTBETFC2wqL75mQjJSMuyHfeWapJrONhqvm/qYHnx83RtQQzHb31IxsB?=
 =?us-ascii?Q?73g+jw7kZJXizDZErGtv6TKSj6+ahMEDvmt8PgSo3HvQ8d7WTTVPsU39GGjz?=
 =?us-ascii?Q?a7Whz6Dk9rWTQsjj/9no/viK+jSV5QktXiM4zM0mlKpSYHr74I6M+4Kvl7ir?=
 =?us-ascii?Q?Pf+60PIf7qS+pKyyOtVjg4EdQuCx2vkLba3t3IFznA99mfB29Odpe5sJfWWr?=
 =?us-ascii?Q?0jt7dZeREJJigWD7Ia7Pq733zHUWCFsTSKlrntWguogj117KTN1/OS0FIeor?=
 =?us-ascii?Q?ginpu9eImz5UWNrlIbBBhuBFK7KzcB2h+9pJVI8qnFb1OQ2jycWDoYrLIzeW?=
 =?us-ascii?Q?xdE0+nak2Ewyh53kEfAQP/e2H/pizlQ1j48Fpbib8cmgiRKtIvv1u6YG+SZ5?=
 =?us-ascii?Q?nI+w+QZCAjfhFFX9xSUp5qH/4GHCgPUO1IhVRjsvci3lWfzPCZ0Vxoo5ZRWM?=
 =?us-ascii?Q?e4aGvNv83xYE5kiDjVq5gCOTrMvYUPAKOSN9E3zRRaK7wKLy55FmgxUW2SlU?=
 =?us-ascii?Q?uU5KOgB4FypRcf/zITxfFnfmPSTHWjNkI/LDzw4Q1QwIF2GXyFf5RlSgcH1n?=
 =?us-ascii?Q?uyWzbwu3YklTNXI+Se+AsKcmkZPhSLpnVZFMQnm+QVHN9Q41VxQhGjd/dPoy?=
 =?us-ascii?Q?2hYBhE8Sjrd+orVduNzl1yZNRA786u2E49vc+Qt8v7cSUIZJWKaRPMJsxXSG?=
 =?us-ascii?Q?zrU2WL6zw89Xbknj9IrR3wGsTEI5sxYJLYkfGIY2SQ4qedmaYHRKTSYeP6zr?=
 =?us-ascii?Q?p/by4hLI1aINNKjENmmOW6XIg6sPyXrFBcZHp+UC+xBy8tcc8lhoxwfIbrLw?=
 =?us-ascii?Q?P1LnSzkCUehxAd8sCVqYZalMqo60VXDegmgtEfQRYcbgOutCnTpdNfaXOcg5?=
 =?us-ascii?Q?wWCVaq6QaqFN9z9JHK+rl8qA254i4HKVPA0puBTHjqpx43yygI076iMku2eT?=
 =?us-ascii?Q?/18TUXlNTqSkuaglxXyBgOQXtsZSWAEtu9/8/0gSvwlTov3/ztwlJpDvmB/3?=
 =?us-ascii?Q?D2SJtfKYiSU9Nt4n2nnoa9t5hCUj9fTDDgcajLq7WI76gmpMZTAL6M8gZDYs?=
 =?us-ascii?Q?EZM9/o9lpdItizInJDxow5FiHk7WTLrzTGDr+ugHrIAnWvPcZTQK5kq2MKN1?=
 =?us-ascii?Q?SuZBVywDcBOjzYHnoh/GAevjofCcRKEkjYORWSb/SULX4qec9UN9AlwcNf1w?=
 =?us-ascii?Q?I22DkrqLn7YLh4fhpuhoFMNEaxcUN6U3QozGnv/Qg7HKQ/D727b75uwvaFQB?=
 =?us-ascii?Q?hTw/M5brVX26t4Jb7QlUEvfD1QOxHFJXlnGNcDbWbtUDeNKZIrFQT0OVzLCi?=
 =?us-ascii?Q?sfq9tvubBRd/SWemRtduFtWPZNFpLNJKS4+adu6I/jKPy0en4ls7oHwcSShi?=
 =?us-ascii?Q?k+Wi8Wb1sCHOVihxm03rPs+Srhl5ut3hUafsnfv9K/L4Ppj0LGO8rg1ds0Hn?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ea8a2d-5c76-4195-5f54-08dc3f83baec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:23:39.0724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spOiT09BPso2kTrTcyWxCPlGp5SN+BqztbzPojx5q5I6T/fxgj4BVMkJ9pz1nCwFJvSWrvSSA/cuSRclkmYVPAh4SvLqzLtjItRazYIOEhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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

On Fri, Mar 08, 2024 at 07:18:18PM +0530, Suraj Kandpal wrote:
>Add condition for check of hdcp gsc cs requirement rather than
>assuming gsc cs to always be required when xe is loaded. It is not
>required for Gen pre-MTL

"Gen pre-MTL" is not a thing. There is no mention to "gen" in xe and I'd
like to keep it clean. Please refer to it as display version (like code
is doing) or just the platform name. With that small reword,

|	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
>Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>---
> drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>index dcde1d0ac1f8..25c73602ef55 100644
>--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>@@ -32,7 +32,7 @@ struct intel_hdcp_gsc_message {
>
> bool intel_hdcp_gsc_cs_required(struct xe_device *xe)
> {
>-	return true;
>+	return DISPLAY_VER(xe) >= 14;
> }
>
> bool intel_hdcp_gsc_check_status(struct xe_device *xe)
>-- 
>2.43.2
>
