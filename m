Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76287C5B552
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48B10E30D;
	Thu,  5 Jun 2025 15:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgV4RjW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB09B10E30D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749138359; x=1780674359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zENVqiQy8t9ps7QrakygxaKLgj6RGYedf8u40fLlF6U=;
 b=VgV4RjW5AQR84R4bJ9EtOov4hGSjK3FQ68oZJ6bDY4cxSsJH3Hq1vKYk
 joIIxLL8BYyR2HzL9oYolW4aLH2uTOanmDhvlw603t83v9ztHZtzYaksz
 i/vNo3qE9QeaANaCTCudsWaAuMyKrsUFJQ7/Tyyj/VvGKvZuP6JVz7mTl
 KgqyZXcRtBQLEhzuQmjWH2PafE29T7+uzFqOR4ye8RZVgRxnmjwR5NGqD
 MHBPpT5fhAqHUxUyVPU5+aoXSt7TZh1oFFQMDmhG0D2paGSazC5PWY9OL
 7/4uZ/rfH/JB93k8tHEx7ZDz6Z1IsZa8VBYJRnnSZ9rwMMObcE8MTFObe A==;
X-CSE-ConnectionGUID: m8vPWqXrRFypgumo7rKv5Q==
X-CSE-MsgGUID: PldaYDpHQ8e+nKb7ZgopiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="50499527"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="50499527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:45:58 -0700
X-CSE-ConnectionGUID: zDRlz3ybQ9C1X6JkgxIYvw==
X-CSE-MsgGUID: mEm+bHP1TcabEfY5DjM/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182744753"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:45:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 08:45:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 08:45:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 08:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cR+PnPoyPbkAYkDXCeIYKGfvyGrfVtwREr2B5nMw3z/eKWXaRb25u1IuKXeMBgcp12ETLjTP7PduHHNji9iL2StbZLBGIqbysG1PJ6LsM9EM98taTp+u6lH6a3Gs3n/WBzJ3dCmDkt8Z4TLHzmNgeZ6j63DCtgWioxfR5g2CG04wtneN67PiClDgWZ9PGYwNMX7PJugfZt+AtJq/mL4m7pj4d5+HdtXyVpEPyjcjUOmngy7QbBhKhBZ9CEJ3Mgq9bK0POOYDgPuN5+f7DC2GHuz+SKMCC7qoqXiq2kb7DAU/zmsAgAwhiAUK8dpH8rYvMpTKcFpfXI5MOiVFWOI1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT+D5KWNU/oZgqnEO7CfCz/SYSnAIqrkv1bRu66p+ao=;
 b=va6lqYQrRT4HsxCQu7gEOBNX+Fpi7m8PuTb2K9VoIXtZ5GzS4qJBXM9jFvJmK9rVXS9PyLliJ9j8xGDPCT2RUZOC3hU2RgNMmlVf0QYN+w/M4ezZLn0180pHIQ9O55Y4UE0NxTuVjGvRi7Qi5RF6tA9mtd+CRZJV6QzWyyZ+aUAZ2Pnjv117DDPWgbZ5Jt5LhX6aQNlTVLquJOcUwr7LMdZGgvAZanIygauTRlYEFL8qpGiYVPINCJJYArzGrQXI1ysvvEji4+o3tQdFeeTc71e4O6vZ1pKB4Ws0IV8Sbh0RVXieZ8/5ZzrFjH3lvPtKWdYUsf4HUiEWSSI1TetIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 15:45:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:45:41 +0000
Date: Thu, 5 Jun 2025 10:45:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Message-ID: <vmtkl2bvwn6ualbftneb4bfpvnu5fjsbs2qrurkz4ifejxoqxb@vus2o5jhnfxl>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
 <20250604145236.1143122-3-dnyaneshwar.bhadane@intel.com>
 <20250604185419.GG6239@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250604185419.GG6239@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV1PR11MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6cc4f8-def1-4873-167f-08dda448063f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dKP+9oRDsqP0LAgH4Lzn85P62vsh38xQ/dTlayFXaaBVIEN41dOppN1FStk7?=
 =?us-ascii?Q?tIlUAr+A/2wLhH7V3FDyq6y19RKJB2upDvFhABeehXHcG5/UgCGKO/B8K/A2?=
 =?us-ascii?Q?TmoIE+Az6ojrYIPQc6jbvw/po1CK1XoI3Il2HETsp90yPPRF/uTJ9knHO1Ul?=
 =?us-ascii?Q?tGW/StXvRZDt+RocKM4q+Fbr683vAWdSSwgpQ4HpLifrRhah8AMDKl+nKDJE?=
 =?us-ascii?Q?dtVLRuV0R655WgGUfbifuujpwXwLwHGuZeiZdeaWsT/Gn67EIAhfDgaiKw8B?=
 =?us-ascii?Q?3pZUtYX4jsHV5aa1qwA3KzzQsRKNZ9nksjThMz89mWT3p1IEcGPfXOCqgepY?=
 =?us-ascii?Q?x1bQIcE2eWYb7E3IyjraJwnS+1gYzL1dOyYFCWhO9P9cdHkpfMfdiio0eTGp?=
 =?us-ascii?Q?i7WD6o9Th8wbXRamQgxvrbGnztWnOeCK08vQe2iHxkE8R9UdmWP3+U16pgmN?=
 =?us-ascii?Q?FtRqvazNmvyMv39Ek5gFFLwGuoY/Ppp8Jrzx6+fxosPxL8MYDlcHuWFAbFO2?=
 =?us-ascii?Q?GU803ovo/9CV1Y13XKbPnuIhnxVRyTVM8syfYyEgtpl2KUQJnNVMuJ7VgTuU?=
 =?us-ascii?Q?LXcAIWfU4zNPLagv+lqcAwFsWEnotXIkWJkxL29dVuXbcu3VdLRCYCpLK5bR?=
 =?us-ascii?Q?p4TPPC7xGqqmPvsnNCDo59s4Qkn0dZVXoUPfkOF0WOW/KHVzVlrGF4OQcJpA?=
 =?us-ascii?Q?Ky0B1xDaLJQwSMXV/aodpOrtoAAW5FVtG+8A7mf2PIQ5p39YrQm/FXa8nacJ?=
 =?us-ascii?Q?1zSHT45A3SrZgyrbhe1339hPr0mq6W8ObB/ynMxVndOLZqx05JO4Q/+Vfy15?=
 =?us-ascii?Q?Ag7qObaotfnK8tNNsabX1YF9dTnfygrcFLkmyAmPboySuNA+8QdUy35afbeQ?=
 =?us-ascii?Q?tMxpwi6BNOn+8bz219KzSsufjDpWO1sHZuq57EoSy5I6XrYhDE/Yov5w2HMb?=
 =?us-ascii?Q?kJIJhQEb6Xh6IdovSbxVBcRrK7bh69IvcqR7HNM+GNzccWRfwV5tsgAMD3gX?=
 =?us-ascii?Q?p+RGsiKSi3p9O0cc0TuvtkTUYEW1iO0vHSNDk2YyuT18voqHcY1pXWiGuTxf?=
 =?us-ascii?Q?LK2maYiP18gvmcoKO17npuPTV95pE4PvD3n4K87QCv3p0dY61OICmpUTgpoS?=
 =?us-ascii?Q?NKjtm/VbsmeGYVM1Ly8iIkpYuwsxEzMwDWtL5ebKS5GznfxK+do/hmNYkEpw?=
 =?us-ascii?Q?C4XTtROJKiK1XmN7WnWXItLS2JkTA0CO+WNFFqPbmRlZb3x8gql39B13m3/E?=
 =?us-ascii?Q?Ed6JiYzgRDvU7gswwwpzqfVPACVzo0ILte1Lp6rBu/WnZa59+z8wk4PqUTuH?=
 =?us-ascii?Q?j1rb1wPWou8/y3/aCiap+jK0Fg5mhjcXfb0d+5eKTxRo3meGkR2LK1wlPwD9?=
 =?us-ascii?Q?L+jSK5qKHahF6sGcKurx33GwN7fV3E0l64rz0A1gBXWmIP75sAA5eWEKP/d9?=
 =?us-ascii?Q?yDRuSuUI0oQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TnhXqmPAZ/uGsK7S0PykNkjIjWOHi62XxY79TEV1Jgn/5ASI/JVeLhz2MieL?=
 =?us-ascii?Q?zh2j1gwGwytilyKFZGVePqvsGCSCRrIfEFbC9S5DMciDXYaPTXwX1AUg6sX5?=
 =?us-ascii?Q?hGEp6ESiu6H57/WTkWoG9g1OuFrvEFzoyHnH8xrCEEtb0S+qgeRaPpOw6re2?=
 =?us-ascii?Q?ehFmRbI1IzGyhU74J66WAljuNWkzK+Xr06SLdWCgZOXqxsYhqR7yrPUgVQJD?=
 =?us-ascii?Q?2Kl7xlHd0muzXF72+hYr7W1mRYEPDkKZyuygPC5M8ND+vxN4izTbudwsqs95?=
 =?us-ascii?Q?7kSLgQM5o+Rkhmt+RSD4uupuPuj0DhtmdApy1Wo1BWkB/L6ZI9XDqma0tPm/?=
 =?us-ascii?Q?/F9GOc0ddY/a2niJuxSftLzSgXKrmiu7KHUxmvu/kJY31TB1m3Va5HUzYqz9?=
 =?us-ascii?Q?WDRgu07HdmfaI4jHYQvBMf0x5randDWNOtb324SoV+2mAaGVRk1tLcQ7d3LV?=
 =?us-ascii?Q?nvTekXs7o3a+KCNo47m6FXAXqy1njspsR9BXXg537C4uZdoSLyb2+iMPJ373?=
 =?us-ascii?Q?WH+txpau43d2Lq3/Cx91qRwA4oKttF8j+GlrHJjEsV3c72oD5/jRTs6t97cR?=
 =?us-ascii?Q?+PljoI+DHnEBO5jr0CMkMLfK9B1jE/6EBpAIiXM4shGuMi04kqZZr3K7JqCm?=
 =?us-ascii?Q?BIOWGCs85gI/VklriZX3yIegkrMVst7YhJUOfspdOrWBK+KRi40Xxsggkz8m?=
 =?us-ascii?Q?4mrKmeXdz52H23MZQg9DGTrmXlq17e/i1RVXH1vb5hDVHV9NVOYqsqp1E2lD?=
 =?us-ascii?Q?y/brAlcsmraiBF0c2F7wQM6DN3z6zg1mCsHVWb0JC1T+SgSGDMzrTKssQHqO?=
 =?us-ascii?Q?V1jxxyTPvSAT5qQeHpmPHt11eRXY6j53BYe9+upfC+pX2JTmRy7oh6Eu1ZPe?=
 =?us-ascii?Q?qj6njZM9m2Cgg15YJeGZpp6VOvmLk10eoJYf/M8k2G7/zoxfmIQ2FYNkurd3?=
 =?us-ascii?Q?m63eoMn2GNxDwn6PGjBq791+1Ro57xADlrvQ4Uy7BS360WfQQjjgQQA5Cxl3?=
 =?us-ascii?Q?TRiuM9p4FG03o4b+4W50rSPX6EozT6yhhaMudfqdn91nNZn6IEBRbZWCwHDE?=
 =?us-ascii?Q?VHgLXi41i1q+MRISvDXcnAOGIr+m/7xbWrEUFybOswarc91LWRX1DWFAvC2Q?=
 =?us-ascii?Q?NCqi5jMUusW4IE71uc7zKrsJUI/a2f64kTAo95j0mgmLiYNv2lbqnIgi8AQ+?=
 =?us-ascii?Q?3p0/GsAZ97rDpMgiokKpFrB0VKXIRNFBb6ovEwSmA9rzBfEdBtsBTBHC6PwI?=
 =?us-ascii?Q?YAcxG1xsEcZwPw19nU0X4VkTja1fBRd8lgRXodIENUIzpyfNVFYwatVZTics?=
 =?us-ascii?Q?LSrIKqBpwa814uHXzqGPsGVRK2LrqwPhR6hhN4IposceXmnI0XW88rovtt8/?=
 =?us-ascii?Q?x33BryF/fm5qJhJpRx2DLt122EF5oJzOguCvte+c8uSA8cC8CeeI8JCv08RC?=
 =?us-ascii?Q?hMskP9qSTPrNLG4TehfzwMIvOaIsw/MQUhQkkolzOi8fnigrBSyXzmKvTsED?=
 =?us-ascii?Q?MfgLHcxc+RSDcjp2OZ0kP05GT5+kNGdDWb9BJywybO/9OQtdVYw/FhIVooLs?=
 =?us-ascii?Q?8QwfdrsMOqr/jrDXCOArn9LVaQWwUyr+oc86hFM0FuJlPCaf5DNf7b7inFrW?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6cc4f8-def1-4873-167f-08dda448063f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:45:40.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6DyT9YgP0qvLiQ7vKXm+0DasQcvpPANdl6E43H7vq5z8MxBDAVmGXW0652v1EnNRMMdbtecytju+I8AbyqnoaafsujxNF38BME5JHBVYK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
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

On Wed, Jun 04, 2025 at 11:54:19AM -0700, Matt Roper wrote:
>On Wed, Jun 04, 2025 at 08:22:35PM +0530, Dnyaneshwar Bhadane wrote:
>> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>
>> Add set of workarounds for xe2_hpg.
>>
>> -v2: Fix xe2_hpg GMD version for some workarounds.
>>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c         | 55 +++++++++++++++++++++---------
>>  drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
>>  2 files changed, 40 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 67196baa4249..2c0e0adc5904 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -489,8 +489,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>>  	},
>> -	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>> +	{ XE_RTP_NAME("16021540221"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>
>Breaking out 20.01/20.02 into a separate entry farther down is good
>since it keeps the LPG and HPG handling separate, and also avoids
>blindly applying this 20.03 which doesn't exist today, but could
>potentially show up in the future.
>
>However is there actually a benefit to splitting 16021540221 (a-step
>only) and 18034896535 (all steppings) into separate entries given that
>the two workarounds have the same actions?  I think breaking it out like
>this will actually cause a warning if run on an A-step platform since
>we'll have two entries trying to update the same bits of the same
>register (see compatible_entries() in xe_reg_sr.c).

humn... it looks like our kunit in drivers/gpu/drm/xe/tests/xe_wa_test.c
is only covering the gt table, not engine. We should add entries for

	KUNIT_CASE_PARAM(xe_wa_engine, platform_gen_params),

and

	KUNIT_CASE_PARAM(xe_wa_lrc, platform_gen_params),

to cover this in kunit and avoid introducing these bugs.
Shekhar/Dnyaneshwar, would you be able to do that? It can (should?) be
separate from these patches to avoid unnecessary delays in applying
these workarounds.

thanks
Lucas De Marchi
