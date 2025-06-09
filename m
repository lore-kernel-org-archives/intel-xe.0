Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA901C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18BD10E3E7;
	Mon,  9 Jun 2025 14:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAv1EYLt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557C810E3F1
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749479779; x=1781015779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OXTgbhA/WQW+8WRoiJMPQ0IUEsG0F3hHz5R4OOTBF4Q=;
 b=XAv1EYLtAsP7uXGXIM86Yj+j1UeO6wy1Mptypw/j7j5rvCeqsXVDfomL
 UKvxfVhPCrAz/BPI49YIH4IqI/0/Hts2NRl5rbFdJBi3LI7pYP27gfrrL
 kibr22RdLm6pqVHPguOERRSyeJY7+NifuRMo9pZrPOJBGUvBW8nYpM551
 4wsDpM+RSl0y3QmVXe2iJpzR0euasecrWwXFW/QXIE+UbLnGc5THUbhjX
 AqwS86B1qYezrp6lNLzMIqeZHiPZLSjfeJFOSNB6KAf6CK8o9qA1yiJ5b
 B4N62hRA9rO9WwNTXjoDS4NA9fRlm4OoPEJ03Ep38qN5dfkkCuZtlOEdX g==;
X-CSE-ConnectionGUID: v6f4qGUkQVSsE8YB8QJltA==
X-CSE-MsgGUID: GzjMeX9gR1qiQt2kW7ZKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55350296"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55350296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:36:19 -0700
X-CSE-ConnectionGUID: YRpYKIhCQc+jhmabHAqcrw==
X-CSE-MsgGUID: ja5oE0fGR8m3DJ4l2+Q9+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147497044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:36:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 07:36:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 07:36:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.45)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 07:36:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voZQfojrhdeSREYT/I5OqZgpQw7a2IFJZq4X0uIGbBuwPNWku+XBVMIjPr8YWZLk8rdGSG3/MEvU8d1qTDw93SMZfKqV2vCiYe5KynFRxRga1dRJvRhMD6S/zJu6ewGuxCMLu9iCP89hyXVTEztf6NyxS+GYYdW37eF323G61Fe0SFAEgk859EzwoGv5+tNDL0we5cfyMkSCyUfcB1m4dqXW7kRtPFN1LjnWdVOeQD+qe4r7p1pJIySx6IUjjcoSwjPEvclBwthK63USFNNKFY86RdB3x31N+6pH64R+zkJAdnERS0/ga9iN8PBCrYo4vF7Wozg9E6hL0Hk61Vjduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp5s5AsnyEgurCXoivA5pWhhZa5ad7nEQdB3GUjjOXo=;
 b=LwEN42I19HICJf59snvU3wNYJepj4XViAxMrbuxaousAdHLfCiWM3aBtHaPGn5rV/HDW4mQ1oyAHC1r2JglQL/lftTOjjrIw+XNMBw/AE6UAA288qgbHenSHBS6JpAhDK3RDstPzznm2Do+ajm26Urt3W0u9MxIX5lriicheu8Ny7i3F80cax75YFNTYIOLjLJdZAkNX/yBJawacSft/heVT7UiYhzTNOcbJTxUyMMYggqF4v269tZbTncJkOQHEsnN/Ce5jsdqe3lS4MuwfRc/kYzlr0jC5l8lyvLyNOyngYWBnhcGUyY/CuE8P7wWTicJwP52lSrkX/+wX98P5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 14:36:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:36:12 +0000
Date: Mon, 9 Jun 2025 07:36:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/9] drm/i915/xe3lpd: Add support for display version 30.02
Message-ID: <20250609143609.GK6239@mdroper-desk1.amr.corp.intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-2-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250606195104.1771715-2-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfbe376-1233-442b-e4d2-08dda762fb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U1YgNczGTZt+qLQ7vhdUoaYELDsDfyXMBrADjkqUGTm3ouf5k6qelzsOSxV8?=
 =?us-ascii?Q?b+/Dhwl2EpBONmz8NqXnvJR/oRGwd1QCRRsRjOd1Rbo/weVtnox514Uz3rlG?=
 =?us-ascii?Q?fgSdRV36HrhkLRPuS9V4jYaHZqwsfAtc0rxt3Py2dhL5LXS0HIF1on2how+p?=
 =?us-ascii?Q?N04/tx39JGwjToCkwa/26eVnxCykC34LU9B+n1GPIIdDjI0OoZZD6Ngty0Gw?=
 =?us-ascii?Q?t5jO9RLTLh/OQ/s4Qqm9WP8qKsV9gaGWP7LA9sjOsioNCwhUwacKq3shTMdH?=
 =?us-ascii?Q?orm2q8j9EyujepChHWPxeNRBL0sR5UR7pUB2MDiclvo0x5Ozh8fEVvlWb6Uy?=
 =?us-ascii?Q?HCb4BtLDidwnZy93Sd31nVxRCu2lXXdwXUF+wkXldEw3lr8L99aXStbm8ny/?=
 =?us-ascii?Q?G6mMES/W2PpFdce/sxFueyNK5bjXX94gpmJJbFa7/hIiAWA4QdJiSuwDmVUG?=
 =?us-ascii?Q?jBL4iD71Ani08RMjk+nSpxQUpGovkXoZ35MqO6huEPlEipd9hFO/+hDzUtH/?=
 =?us-ascii?Q?xeOFO12dGhdo8khuVAgcCkhmjP93zOFkiXTlzhFJFQmpoNvmKvvJ/DXSn2oS?=
 =?us-ascii?Q?jZFbWFF2LtyqtVAZbrpDzhZUVE9QMuZdyJNC37OvkTfv4JnMOu1quMARdWGD?=
 =?us-ascii?Q?IsxHtHLhIX7M8zDBJGrOJgQvqy0g+z0QHQeFJw6VH/lulDbEiWHwbkImU99c?=
 =?us-ascii?Q?ka1HLbBbgOiawbeZpuqcffWaphgiES9f5ilnONf7tlFv23bUtFTmm3jnB08/?=
 =?us-ascii?Q?qQXCObGqrlC5BI8bMslYZwB40u/X82Dam3QN0Jmad3QRCsDY9fbuu6iwOsUT?=
 =?us-ascii?Q?OX0EI4WAb9XrNmNtFnXb87pM2T5eL4FqseiJ9xU7c0lbMEwNQVuTaBDA7NWi?=
 =?us-ascii?Q?xCwtkmA/UXNDiNzoUq/xznHWV+6DTkQNJ/T0Ul06NBk79PHj0uIpdYYds75s?=
 =?us-ascii?Q?wt+8GFJr8EO0kK4PZTwqv3H7EptlG/8LQnKfNRP2d6JYBj910drVOTfklh7j?=
 =?us-ascii?Q?4vazBiwQrzP46mPFFLnsInsTbZhCOPaYLrfYfCyohOyivfUl/0/BbBc01kkI?=
 =?us-ascii?Q?kBgLrSSuttrK5HWeReLb1fTXn61McyQfkpS39w8fcRwFoIqVbu8Z9LI8ofkB?=
 =?us-ascii?Q?uOV4XBiPl7u495UZd+sLgP1B1Dw1QeyukR86w6mGLZW1Tq1ESCUmxVsOWUdB?=
 =?us-ascii?Q?mfIKp7XyeELRZ97blRT43B6CXs3P+pv9pN74dzlNUn15N2OyauCK89swful3?=
 =?us-ascii?Q?uZf0UjffwsFkmmyTalozt9Je/zw/SsffAUyVJAp4+VBlpgqSsh680dwVwmgO?=
 =?us-ascii?Q?MVU7qN0cs4Vr7fPK72DvhOq9ubIGD7AjN+mvwI6iXjJKXWFEfiUTJXMLzrG8?=
 =?us-ascii?Q?as+FVorpaQ7UsDkvE2cbSMt+vE7ZWgTR7v6TIRxXd7gCeWShlHqMGNnun7ff?=
 =?us-ascii?Q?hkKjRsfAQAk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WSSMfZahOK+v6wL3Olvl9O3rDXnMmhsmzGvucnNRqyvUDu/UIr6zjbkltUgp?=
 =?us-ascii?Q?P8XYClD5R7LLH20G8g6+k8Jcaj8S5OIR2bqvQ6b4EV9/tM33WhBaVbq/xDxa?=
 =?us-ascii?Q?NtjMQvyFD/UenlpWanqJiOL1AT2GkGVhHA5vmMdV/ZsrqMMf0CsBWcUyC5T/?=
 =?us-ascii?Q?+ZgWClX7QdBkmiiW3yeJp4hPsFKEukbKElN3WeYDuLaC0J8s0DNR1/oTQZfs?=
 =?us-ascii?Q?BU3rXRwf6XwCi5tyjdke7obllL5xH5U9DVADlUDx2NxxsZ2j25muM4eTE9PA?=
 =?us-ascii?Q?G7NxDxjYuTibPgOTxooEepCxZxEp2cEArpKgYqk+57wORgRM+PgwAmwbN0Sl?=
 =?us-ascii?Q?tE/+ZCh09O9Bte6myk8GU+j5VYoLdjUw7tCVzgCIqLb2gV70NofKXNaR1/2a?=
 =?us-ascii?Q?kx0f+GQs2Ll59HONzZmlhQHYZ4bIcQzE8IgWYEy+J2O0xM6VKMjYUXj2eC1L?=
 =?us-ascii?Q?3G9PmiCi8UFy1A8vkNkFpe3t57ThPTPKAuZN0mlfqaIAahV1Gs1oJu11VzV2?=
 =?us-ascii?Q?Pf++C4DkHXwhy0ZEmQlFrrGIMkizw/hLLD6RLj1TCb/48xBx9q2H8Xbul7p7?=
 =?us-ascii?Q?+ec4RHEtNlGUU1y8xxCGyK4u+ga+MlRqInTm2pO1R5D+4OJqWOYcOEQJTXp5?=
 =?us-ascii?Q?K3FZTZZzRasuaHpDgmVF6KJZnrvuZeUUbAZNnEObwAzdwmGMWBUlRuhy6AP4?=
 =?us-ascii?Q?pLEftT8IzgAEYIDhM6oTrG83LElK89N6e7HAJjBAabG7EcFJQ5NKr7dzWkVA?=
 =?us-ascii?Q?Qv7u1CxAOVSD1sDPy/NkfzIJSBMaNShzrfAer76aIvIslmbj2rxoKY1wijEw?=
 =?us-ascii?Q?rwW0Oz1bOLXy3ItQ2N3/as2awJYS65cYrmQ8jIH0JreQjO/6KNjClTp6QAfM?=
 =?us-ascii?Q?7ovvGWsepe4AenebS0Xk6DU6sBW080wcx4jprzhZIQV5+SQ7wjgeyCVBvnML?=
 =?us-ascii?Q?KI9IbLhKOeOOhQyTjmb0F3C2NXpNq1TJUdO/JBMTLKMCeldCLIF7KFFEzgCc?=
 =?us-ascii?Q?rW+TGW0UZqouhlKgG4Sta92eHPyHwZu4HP90cUKf2iFqSjLBGWgcUgEu37zL?=
 =?us-ascii?Q?LBJL/VZy0HJHbyKUznJntJJA9cur3G3+8im9kQhgpx8p/+bdWkYOjiZ1et9o?=
 =?us-ascii?Q?j814Mvdfkh7fDBJ4ewQ8G7y+VfYIlT9XSgCsLIeCln1CFoyymkRTSXHJxvZ+?=
 =?us-ascii?Q?jIYOKkEbZ6Wij5ZTCVvJW6uPySdpiHYvOqf4bBw1g4xoXrxdDQRoK2sNBgaj?=
 =?us-ascii?Q?QSjrL7Dh/molZ8BFamzPCk2nbJFE2hul+omI5CBZgU0gV06Y+Fn5OdwKsUZK?=
 =?us-ascii?Q?UXYbwXq4H20KPlEf3OI2PFlxe/UkNdwNgLeujd8AwCdTVNBvDiobbfIp1Zou?=
 =?us-ascii?Q?0Nl/zqUAP50uxtTuplx7psl9WNX61Ml2a6q/PS8ACuk/HE6X0t/ssxivAXV6?=
 =?us-ascii?Q?8GXLlAHkdsDOuwicqx/TuxcsQ7eqV69NgFba9XeN5jmCkmdq83cFvL27sC9Q?=
 =?us-ascii?Q?7lUR7lOUppQ+dbIkJ5syh/2oJpeoFH8AEf495nVa9P1d5dFEwW2MG+yrqS/h?=
 =?us-ascii?Q?FOcfvdLUbbfI018dYXe/IYd6m88gj8s+JElDZcaD6SWkF8CruUfCMm79+jo9?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfbe376-1233-442b-e4d2-08dda762fb22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:36:12.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4klNtHr3qu1TozrUaCFs2SG0rZy9vOjLjiJ2wumamHcz5YoXXarWhLLef61m9cVMazsQZmMiLcIDj/9I43Afs/BYhLrp2e4hL3Ff7CYzd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
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

On Sat, Jun 07, 2025 at 01:20:56AM +0530, Dnyaneshwar Bhadane wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Display version 30.02 should be treated the same as other Xe3 IP, but
> will have a slightly different set of workarounds.

It looks like this series was only sent to the intel-xe mailing list.
The display-related patches will also need to be sent or cc'd to
intel-gfx so that i915's CI can run on them and ensure there isn't any
accidental breakage of i915 platforms.


Matt

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index 1d8c2036d967..d398b9086116 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1479,6 +1479,7 @@ static const struct {
>  	{ 14,  1, &xe2_hpd_display },
>  	{ 20,  0, &xe2_lpd_display },
>  	{ 30,  0, &xe2_lpd_display },
> +	{ 30,  2, &xe2_lpd_display },
>  };
>  
>  static const struct intel_display_device_info *
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
