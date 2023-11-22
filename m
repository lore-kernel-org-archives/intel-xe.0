Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA36EC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 19:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18D910E148;
	Wed, 22 Nov 2023 19:49:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB96710E148
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700682581; x=1732218581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4oyJH2WZkDSysiB99ZVDs9EEPobqg71TaVsLiXGxuUI=;
 b=DtwCpwqNjAyp6wDE/l+XndQnlXQj6gd8GpJjPPct0XT5ojSSCG6I/T9k
 aDuj90OnEb26yH4lxY8Okw9lKR3yg+mjSvguwzNQJmyoHb6JIRtXVOkVr
 xJsCitibcFNnVniFf8pjEJ0FyU1yfcvw63egMfsAlTcq+KUlWalN4JnFd
 9Pyx4bkZlw+3DdAH08ylTK3qM5Pw3ore5aaTa6WL5u+h0Y848JYLUrnPY
 JewoGbpmdNUH33eTfPPj820QaDdialggSBcc+z1OS8mquSnwSbUaYswsN
 kNi0h7+rbk5zTrdqztydPfw0gSGuQHVDOKS9wk+u4gaEwVpG2RX84hyMo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389289820"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="389289820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 11:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15407546"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 11:49:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 11:49:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 11:49:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 11:49:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSBPY+jk5GZ+ItnmoanM/Q/IAhkL9GacxbdRU5JZs7nx1XlBVwhKp1Ew+JuKdgdCiZLPjIZH9yYIfTbNjpEnCP2hbzJh8qYvW7+4ouOPWKz5F+OGt2NJft5oDZeRE6VteuodrQ5mY+M5dA3bbNLocwm1MY0qVKezAh7RmWNDgf/IJ6qGf7KrqKuqzgDmU/zxd+5DYD7r9rZpQZlrXHM6g+Ole+UjzMYIIgCnyXEuUY5XCw+FFKrNQ4qkyDimCZExu+ZqJzLus+yEMnnwwyfCbveInS5S9wHjPyq+CdofIB0abk+EGXP9AYwmqelQjV43Lqeb8EPGoZxoBxBjHbbayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8mkk3KCEfqBtV1D9nnJ4OwLYr/tDHC1IOMlowAcHag=;
 b=Ug/dZ7FBl62IsqnNJWRKWTMjT59WCH/ONnudH6UB9wI0ycsy6Bsk22A8Pc7E/ILVXOKtmwY1u6YGrQbFbaYBEP6W99A8AtAb80CTh81Z3AbA0TY+awOruPcTrrrro2/LTjYlCaTScYym+1vyWVMKK+lpj0qRYyfuM7deIS2/lBx8+PQrr+ldxRa08UFWOqAkNtLA41tDWocDbOdYfN6lOKIRt685INHzm+i0X0UxDD3xID092LRz6JfZsMuEPBUM9vbblxpPBYG1AAs6Yc0r3jVulyFEYqUqN7GhKqsJjqnq03YZwacxjF98HbTWIjqdKACIQC8QZ5h8yXWuaAtrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6469.namprd11.prod.outlook.com (2603:10b6:8:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 19:49:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 19:49:38 +0000
Date: Wed, 22 Nov 2023 11:49:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <20231122194935.GQ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
 <20231115073804.1861-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115073804.1861-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d69e0d-ae22-4b56-347f-08dbeb942902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEP3j6MXo0YbucUKEzBxxTJ/e8HoGsjrXLnhAyuDOxMyOINmjyL7V9Vwv5XoMNz11YvUG1yrNkFAFdSzY7TilWFt8Z2DSd09tcGHYkKi7wvWlUNIMLjAEZUhOnsTvSOF3VcaaS6LL2UGDisG+6uKLXPmvDo4BIIYbF/rys46eIeIfhZTPFzLlyFviJ8MipYdcpD7korH4+jn7pf2AoZMpmQktUPntM4YBrug2C0oVxGIrJiy0Z/ETKcvLYZ08Yo0d03l6uZRK8e3eNS6MXHqfLNW55qFv+HZ02+a1pqM9owGGUt1H3/f5oIoPM/pezex9MdXaFxx70Ss+K+3TpgKhElmCw+sNDAI+4shuMabPuI1t4g5bqtqfyQlCiG7ck7I3s+On24nt9zlJSqP30s6ekbqv9hjFfzNWuMiKmnwINZCkRp+D2Yilij/dtvdib1W0lZMG6CPWDIPcau1TppWlk0XWGw7M3IheOUEhIex2VMVbpJfixuCFczx+ic1HNPRw9VHVaNCj6kGcXIlmDiwRb9bXmp0dEY9+lNnsVfgczYkMNEM1V3ur9NuZu0QdgmN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(1076003)(26005)(6512007)(82960400001)(38100700002)(86362001)(33656002)(5660300002)(2906002)(6666004)(6506007)(6636002)(6862004)(316002)(4326008)(478600001)(8676002)(41300700001)(6486002)(66556008)(8936002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ygAengVJQCMg8oHy5uXsH9rOyoVnLZASzzHXyizsV66nW+Hd+XAfpaHA0Ivb?=
 =?us-ascii?Q?3kfx4BmpXZCvZPirXKNt//bRSWWSubESeaXz0oWGH2T+PZlj+zlT3RumI5B5?=
 =?us-ascii?Q?VQqa+vS/OomVBmM8CJVUbA1kAJ3q4bPetFS1ujGF3etvLCATsR5PH+ctsBys?=
 =?us-ascii?Q?8ifSR0L4QmBSJPWwpLNM5Ij0L3RXTrEXWlkYhrh9mZAuAx1n1HpLzRUExsat?=
 =?us-ascii?Q?MPZmbAPGsYprWwhVWyTMkjO3iovV9iL8LCizr5OCq2srAlf5ATeNVy7cpmx9?=
 =?us-ascii?Q?FDPVSIKwONhUXg29yJR6WYPtZhGEh9uk8zFxOBgaOuf6MsqE+YKt08ZPmZSP?=
 =?us-ascii?Q?HRhbl8b82srlVve1uc4aHB1NZFshlp6HfAmcOPHFUbN21vQOferdSrwN0KUT?=
 =?us-ascii?Q?ShwzyYEyaueUWaxIHRoLadxdBSYuHHiqrl4SklrY1c0x3phMnwIjYW3CHX+i?=
 =?us-ascii?Q?CmWdfQHiP0kBXefcAUB4ZncWJer7C7GurK1foS5CSm5n32Xuh1XDe59yE86S?=
 =?us-ascii?Q?GvM3LmeYDha37Ci6x1h/uSLnpYZ2Px+MCcc943VUYKA2KG3JsKsavfP+j0ya?=
 =?us-ascii?Q?fyU2bg955ZkDjYw+zB2f6CFsnI2qxDvhHSlALxbcbGP1wx5uhaCpz/LSCqtO?=
 =?us-ascii?Q?JAIuoseFti/c6E1Z/uO9YMetqttlRjtWT7PGyzwJDOiag8e8UrCkVkYsQsbh?=
 =?us-ascii?Q?SHahFH/W4r6ly90kOu8kfnvgov6RqkM5HMJPcOU5i/z0f1LiBPN+S3R3iURD?=
 =?us-ascii?Q?eUSrO/yxnMuWxVWXLXc2KIlgEcmkJxqn4hTP7p8doyZaRwjLjhUoyscUjpIF?=
 =?us-ascii?Q?UlWnsgd65Ad6e0oAdhN4UlayJfvXMx0csseG7PEBPJcS2Z7o2ouU6qdxFVje?=
 =?us-ascii?Q?9s54uWxcT044Bzo2TT3WP92kkSD5t7MclhaEBUBHouGM+qWBAgiQQLCIxYQg?=
 =?us-ascii?Q?QrkBIlWh4yaqabMlmIov2qpI4H/e91j5ixRUCoIUWK79Rl57c23lv94zi5Ov?=
 =?us-ascii?Q?b3fMkaptclUvXAJco893w+qovHDVNgf2zdvE6ZjHDeQs31keGHd4GbFxsDRN?=
 =?us-ascii?Q?myi9CzUkuhoDNwQZAABRASmzgyRtWciVZtiQFJVjqnL5TL+QRG1UJwQvUw43?=
 =?us-ascii?Q?aHIffGVpMbcXLH/GYTYXHnA+GSVk+085H7H9EEX+5b1Bbb8z5XYfKnu3cfVu?=
 =?us-ascii?Q?xQSPOuuQ8wRMpTKWJK9HrQLgGClAIJY8Un8aVReEJ8FblyilTfj/JdfrGxO2?=
 =?us-ascii?Q?vwi5CEmNKZygzmkMTb1705uNwNds+xBxnyOqJKvR6D/MOg/a5jtdd1B3o7k9?=
 =?us-ascii?Q?EOkF3+6GKkVKVLO0eLMSfNTRK4DcHhvCUSSlJ2MfM0OJuzFg7hsrsAAY8Tzi?=
 =?us-ascii?Q?yiJKjVMqf/Fu60dzmHYr3EVQ36hKYPmq4VWXyC56VeT9f2ymyyyapBVUi65o?=
 =?us-ascii?Q?brM4hSIZB306h2QZlpPNcgrt1jL/ikXpcNNB3llILfGH9W92KfjmnB/yWOJ/?=
 =?us-ascii?Q?wzaZeTeqXJrre4Ntx0Amvzyrb28Oay/6IrdwnQTAKgM+GkV2ZDn00o8Vnz4O?=
 =?us-ascii?Q?58Vpe0kkmICw8SQrzIimd+Aq3tulPGwkHVqzyS6AvKdPwvEWotQYj3HvGy4Q?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d69e0d-ae22-4b56-347f-08dbeb942902
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 19:49:37.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46E7MuC6JlQtA3camPWxx9wFndw/4ObwYpFrkIKFU51+bp6WiWQvaSYIiFCaBPtevPQSn+iepJyCfVI4xHreXpOrC+9zlaDxsr4cJXKbnD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6469
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Print virtualization mode during
 probe
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

On Wed, Nov 15, 2023 at 08:38:04AM +0100, Michal Wajdeczko wrote:
> We already print some basic information about the device, add
> virtualization information, until we expose that elsewhere.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3030b223e4a0..cb762c11dd0f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -736,6 +736,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe_step_name(xe->info.step.display),
>  		xe_step_name(xe->info.step.basedie));
>  
> +	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
> +		str_yes_no(xe_device_has_sriov(xe)),
> +		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +
>  	err = xe_device_probe(xe);
>  	if (err)
>  		goto err_pci_disable;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
