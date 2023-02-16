Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604E4C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 18:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392A710EE8C;
	Thu, 16 Feb 2023 18:59:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EE510EE8C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676573980; x=1708109980;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S/7ZHzWpq6vwFHmL3bfKQf4ziVh9X/laImItLKNFvj4=;
 b=ThNHsr2bWmODe1HmxyHUTOZLGjI3lvMgkDyopLb3/IQUyhztExDYjejC
 kpsnXeWT7T9v1DG9U5zVzUHBWzTPMB7JxkPAhSfwR/aR1AgbZVHiHR3qa
 9bBvFZUREPCKVM+TnrQzEkBq9lDGRlxHu2ZxqqfhNlW4xID3vW2a4k/KH
 WAHAo5aZ8GQPush73P9R9tzQpbKG6c+6jXQSXZsQJZupxcXhQxzheL/hD
 YY3zdROSxdUviKt78zAzGK56KV6UU6Tqi25KBIgozg+f9LYlPrLmqIq3D
 pNKW6AfR8BuoNeP+KwHJ1CKxOZNykdc2bnHmnGRPCen7WC8gGeQfHmwiu w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333162209"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333162209"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 10:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670273441"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="670273441"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 10:59:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:59:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:59:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 10:59:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 10:59:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbyqw11EWXx3NqkycbiojBxeU5eYmtWWc4aawn0Wsjr9+LufPMwvJRrF2AyHykwiNEoxTQdpHo25dqP0Jw4Vh0LwodgjnUoaGDEh9oPncycrzGvm0VtJSqwc1T5MO+FFLWxf49x/KaLO4jjhad1H/9KiWWOUNzyF+mTjugc8BOEEQVfdDtYyZUJifLBz6hWl76snH6sWPvOhYMvgNPopUJGElRQIVvdtcGclVOEX5xW3QFET9tAc2u6+mPQdhk5l7kYz+wN+CGrjUX8+rNc1lb1YCQKjkmNMuTop1/B1YhcjD26I6zQ1FqwFfOW1sQDVqL7AgXfoRecVuQaon2/qKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZs5KIc003gC+CwRTuQJhupgpmKkqYfw3LX7MbOE8Rc=;
 b=ilH2buhy9T3F3Z5qS9bIM3EoFy3WhaCCTRovkgIcLYkGF/kqp0l1EmKmwEdnE7tRC+bsyGRa/EEWbXtWRZA95dvSxOEtX2wmCAdG2EU+oeETzZcqE2SJtLGbNTwnrMLrbLtEHVEhstrMwoCCdNqFO+rLYD7lkEFHwl7tfOhJMfVARVQvbe21WgMInH8EcM6BoRevKRLyj/d8gp736z/N93GfSDzz8GAQdErpCMILKRz0FEnXymGLvy/7aO2TOfwW5Uk61htdsruTYKt1qIvZHFDnFi6MrAPThC5dbNvdJT2n71U7JcKRsaXkqdpK29Ckm47UeIY4aerbMKhAx6pDmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Thu, 16 Feb 2023 18:59:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 18:59:08 +0000
Date: Thu, 16 Feb 2023 10:59:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <Y+58+U3wm8YbL52w@mdroper-desk1.amr.corp.intel.com>
References: <20230216174616.302678-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230216174616.302678-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: e285ae11-4af6-43dc-93ea-08db104fe1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXHgncfFtOQ2epMi53vygQlebxHMZRhD3PhXU3uYQ8Gv/bigc54eoSReP8t3cOnGDa370vjsP9tjklNX6EmzsXcxU2prCz6HG37gy5BTGDFZ7p+zNLvZ+b2KxgFMe8vDWJnfKqu8TsgB1DLcS/oP2v1cEMqAG6DzT+m5rkZVFheazfha4E9tBvpcuexPaPCGfIGHeqEHh0rbzfPMRbgTa3apTWdzmiNDX5oQgxobVNv5mxCxkfnulyJP47jJeyZXDquPUuWRvsce+iAiMvCBkrbz2YWLgsJ5SZlZ5ykt7iQpwA/vm9NvjRN5gV8GaSJj/9UgFv1OWuVYnkHmuzr8feVSlq93+Il4VPVDD3JHJfyMCkPAGkE46tiBMWGawQJnhblAZpvtXXlLi9FBVNsWNLWbDLpReoUzuhgH1V1MQCr1IRp9j6plRKpx4NMLBTCNmHunalJ0DZUPT3Rf+XhDG6GicXpMnm1OuhLJoY3bIqTwwnNHnZAZ4Kl2Ni5wJbHxf6xY1j/oTW8WK4bRJLleNeuQAahE0e0g5JHoBmfIuTYz3xgSqJGrzWem+0e/s80cigRUIGaUQzcgw/Wnlp1bD81V6tTQn5/5wxsgMHs4hzPB6p8BczhqLebQpkVF09J4rU0vSzKYPCMr5t/nfBk0NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(82960400001)(2906002)(6636002)(6862004)(5660300002)(8936002)(66946007)(66476007)(316002)(66556008)(4326008)(478600001)(41300700001)(8676002)(6486002)(86362001)(186003)(6512007)(26005)(6666004)(6506007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5B7d/JkqxM1d1sEOmxtCCEzx8WW5a05B9dIPMDUZ8OKu1v8IFqvDN91fA5?=
 =?iso-8859-1?Q?UmUiCkK5oxCkXoOOa5+xgklsAFhd0i8bn4I/ndBbbWcgL3GEV1Q0xuYD8Y?=
 =?iso-8859-1?Q?b2tMMxsWZZMLlN5zhPB8RFxlr5YVFx+1pKlCAP7OjRAR+gNcr5koZzzutF?=
 =?iso-8859-1?Q?wtQJhfyCYpqjQSv1zt9yVe9Heule82+TiM5xvjrjnaJ8LcOn+kf288dfyn?=
 =?iso-8859-1?Q?Oai2a52iD/gM5q9qxsebYk7bWzDvufvGVRO01yAn717I9s8eYSGiUTS4PO?=
 =?iso-8859-1?Q?ePJlcaqlgovqCNrMccTlmVD113ZDad+lKdlOjQ1dwFH4sip0rHQgWXLpAx?=
 =?iso-8859-1?Q?gAGF9XYp7iIKBuYFr/tJ3OqVVjzw2EqMuig0PJa732wN83h/S8rs9yxemy?=
 =?iso-8859-1?Q?WePUBXljYLaaSethwTvIB3JwfNW5gsdhxf5yTgR5r+D5deMfhyseC/JWxP?=
 =?iso-8859-1?Q?LVb4dgGD0y9qw0bzCr74FQLrGnX7439615JPBsgDPJRr+YysENrI/u5Ktj?=
 =?iso-8859-1?Q?UcIYhWOgNZgLwCb3Ab7jVXpx/VQsqWBAdAnzMYWYVc71WGzDGPs06HmYUR?=
 =?iso-8859-1?Q?Ha1cs1DrXpK6JpnxX4DJZNrYPQYt70MGoj4zgzo/eQybFxrssQK2DEDjT6?=
 =?iso-8859-1?Q?on6Po1UDTevCz1Kbr+Gic/Ft5WWbSKxVUE/ICE8z8eVRMeq0x3VA3nXFGs?=
 =?iso-8859-1?Q?FB8imA/I+2vthWAd0BDoyVnGZmKKouujK+Mq5teXFXQwLewjcBVILUqCYz?=
 =?iso-8859-1?Q?vJiWAlVUljFLdmFZSVmwsGJt0/3Rb0Dk1WLO/k0VaK49K+uW6yHaIIjVYY?=
 =?iso-8859-1?Q?roPlYhxyCTOwB3Lou0tI6NsueeGo8zmp9UGVMHeo1wwZLqLDkyaKfUusVi?=
 =?iso-8859-1?Q?C3sdQVK1qctWwf6qyr/UCFYSKK1Pudqy4Z/v9xGaLnZ+TNH3YLVOM2HkP5?=
 =?iso-8859-1?Q?fbbwbK1epfrxpZ2fVgQiYpUY9XJWifF9/OdlqzDAdv54LGfDxnAOiPm82a?=
 =?iso-8859-1?Q?j7cYVSg9wCX5J7mR2CHItGzWGzAiNCFJpL3cEoQ0/taa8KYx3KoHIwJAT3?=
 =?iso-8859-1?Q?2fI6Qv0oXTMsJYmEY5tAyfldp29nWJs1dzl2tkR4lDKMMu0G/Efk4VPJqu?=
 =?iso-8859-1?Q?njz5NIjghUi6KQNkxkJ/OZUfiLneGGEj7YuatJRM0k8E15EQkNb/JZmipY?=
 =?iso-8859-1?Q?mD/d5yixriC6HH41KzoYJMkz6v1DNXU1+C1E5hoL9QGEvKtFLha8wlJElm?=
 =?iso-8859-1?Q?luwasBVttFCn7B/Quyo2VMeoWowZ5d+BRyx/lnW6psYHqNArXlyvTYU4A5?=
 =?iso-8859-1?Q?zojf3wl1p5vV0mbPZlTGio3kOAuDR4gJwquhkSnzdR2kcpV/KXPMnN3i3N?=
 =?iso-8859-1?Q?DGvD6XjtkpRBFFvzj6did+2PyUcy1dXAx5FrszA82T8T6DpIJvHWpZ710d?=
 =?iso-8859-1?Q?7Kds6tghS3GyjA3BZmIoYNmzKOhJvjLCpNtETF4etHuTYm+Vvzx1mnzSgu?=
 =?iso-8859-1?Q?Kgt9quHKXDIYENhzzv2nRXWMufEhUvgyMhUWNvRLLcDPVDFKk5bNnHbllh?=
 =?iso-8859-1?Q?ntjkTyf06FVP0JuaK1onXYP3s2hbIc5QLuDJKtpQSNEFQcif1ykDkk3XYp?=
 =?iso-8859-1?Q?YPi2/fYzlYAkmAShwfnzxHjRXPZKMEaOFnD27VF0F3rDqj6MZyEonQ7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e285ae11-4af6-43dc-93ea-08db104fe1c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 18:59:08.1190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7qwNqv2pd6mVINbROnjMwUHWEkx3wbMj5aLyYLNJjDWwTKWh7vIQAxYH/e+Fw0sDnyox3rvA9NKu5N+p/zAd+pyegciopi4iNfZebx+waU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Initialize ret in mcr_lock()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 09:46:16AM -0800, José Roberto de Souza wrote:
> ret is not initialized in mcr_lock() when running in platforms with
> graphics IP version < 1270, this could cause drm_WARN_ON_ONCE()
> to hit eventually(what just happened to me).
> 
> Fixes: 62a813fa315e ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index bb71071c3435f..7617f03408794 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -383,7 +383,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  static void mcr_lock(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int ret;
> +	int ret = 0;
>  
>  	spin_lock(&gt->mcr_lock);
>  
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
