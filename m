Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29031C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0A610FD5C;
	Thu, 14 Mar 2024 20:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSC06+WF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D1B10FD67
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710446951; x=1741982951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rdmCUOj0AQPZf+9DX4Dsrn6wpKs7fBgP5N1kDi1360c=;
 b=LSC06+WFNoLC4BkAYCSPylkGYOu8QFkVZeKn0GwUim+UL3mCvIj4cBSW
 M5gtYlzQvj7CwvTQMlXE3x3npwPuQq9SfN6r2xcCrmKhT1pnOQmin+KK0
 rCtZxdkHfojgLdxADAj5UOeZEhEc4LpxqzJOOr0TMQhq22zSVHHV4g5mQ
 mldXTe4C8fxvoOU0ZytYFywZAoMKdGDAn2GR7TCRK4Wc+klwtoh6iu+pl
 6U/PpNbU080Sd1cSEkXN4WxjZWcIN0P6lB7Hz3orxRdERsuvofMAwPMZq
 KEsl2bsotmOmq+KffK6zj9LMjwhvB+dU54IeLAfFagL7z7JkQWW84X5Rd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22810515"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22810515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17007928"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 13:09:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:09:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 13:09:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 13:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAC1p30/kmKPOF+P8zg6UFEjNyQcp7Dw5A4iSz9H2gvTYPfgkGykJyjWHT52wKyTKd0ld+Lg/Ic0isJCZHntoxQMv/yv1zXg/joOWGYR0Q+tLZozbtScpiU5Xjxq2VacVf9pWNpLIKykDLY1qOrZqrGwDJubQD4mh3yitpQl6c7cJdgALjZDTj001geOncJuJLzZ3Y9JKf4mF2vRSRPfN6WUn5c1LhPvykKfB7R2ohVASBp/5XSEUiH8R8qqLatsBNAwWv5usBlxJZu0MlRhPqRt30pC2TUUfe1/OaxlKpJGmgAnJR9eZ2PU4w37Yy91+3xq14j+ugiU2IeoEWAsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdmCUOj0AQPZf+9DX4Dsrn6wpKs7fBgP5N1kDi1360c=;
 b=jFVpijKELgU8MMMyP2zN9BX5by/5yj5DYMa+F/cUBV3jD75YfFrCfkkJtWOb/nH8ImcuxWUysy1zXoULszPJPJBge7S9AVaXj1SXwFucYF5KkBeZLvksAdrMGpUWFZc+ZMLJPTiMcqiTHDZkC5w3hwQvq5mUyulNuah4ykBiRZItyzmq1RxHJDeHq98bWGHarfjwPx5VSYqbk//9TNiCZPXTVE7MiSlG8Ho9SMkZOPmTav/Sh+ZIefnLbL9RzNNolUyxPxLQ2sysvdhZpEnWfLEJwb45Ym/LKuEQwedH19Gx3HMJBLd8RVsRQ53fl8essK2xXHNuNzkPVfCgDrAHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 20:09:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 20:09:05 +0000
Date: Thu, 14 Mar 2024 15:09:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/mocs: Clarify which GT is being operated on
Message-ID: <5smbm6gsgu5csz5gvdotlb5la43u3ea2iqzgbxuliql4ptz4er@b7imqqx56ktx>
References: <20240314195825.3226856-3-matthew.d.roper@intel.com>
 <20240314195825.3226856-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240314195825.3226856-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b940ac8-2dc4-4777-3de7-08dc44629942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KH71D8OsGBXtIrGmyxteY/fa1JflgXbXyfFU5zmQsFp+C9AhHdTR0viB8qOOFoyq9LVEOgsEueO4QsUZnZtyk/0LindonALq30/RE7OtZx3J8emVg3Mcax3ahyzNNOZwEdFDYn0g5SBBOemGXY8jrKZEkzkKmah1VvFcVr7wWIm4CFBwCyhBENxryWBhLwFY81RHgf8NNHtpbywDRAA6jNz9B5AdrRiBU4e18N54vsjArQ7jrhxnYLNR6jOv2bgsfNxkj2y/w7yTd8gyFvHNAAA6NF+B6su5UluiRLNgO9LlETzyQtboN5uGxdlBuFdvb79Cp4oHbxsjaM4yaTPAbc63fGKb2UyIwLs4B+1SpvY+1LODewUdZ9oRt6x9lpNFdhe9mi72CiOndOEp3OSifWL5oRK67QjNvwMVkpkwCEja65ub3RWwdPUkzY78H7EZYTgG6xjx9En9YalrUUmZCpZTUmz3nxL5vuXqlUZdh7ciuxCy6qPV4ZGH78Zdzd0vtkhjrgZBR0ew4mTmSoDcmfZCQR1YaZTkFWjqsLdQmSz2oWGMfuuaAsplrvEDUS2/8lLtqfp+nHtKVEgQgU5xD/Us2HmUa3nKlvH5Za/CnJ1oiSDnRJHDvHJGTY9NcNDMJ46amanbvNTP9/Pf80wKJjg7I7rKSz2r1kPOQu543d4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EYAbPNXnxZSW5Rdia6C5XLonUAfLM0RhhieHZ12OlKKtwfDbaUm6ndrS4YOK?=
 =?us-ascii?Q?mZ/xdmON9JLqwYHlp91sbU/2MSRci8RkgqJTfLT9/uMIApUuFhERtGr8tSSm?=
 =?us-ascii?Q?DhzLJkXB7bNqjkuJ0QVb9wGZt5r+zMP8jpfDNIBM3B3NglAR0RE3d5FRRtn9?=
 =?us-ascii?Q?fPVBbAy0MxGyMgFmp/OOhPCiQ2ANuJ3odw+fYxJD3T4/SB9Oo3yxtIc3bCzs?=
 =?us-ascii?Q?8Naxl+GQSRPEmCQY3FxGMXm0Y+/ukyeQ/uhWkr1uakGi8RNtEnbl+pzWvolo?=
 =?us-ascii?Q?mawCJZCUIQ6QryW8QXGkPGiNnPMuMCiAkCza4Sqk8kdm75e+AKC1hnfiTYrZ?=
 =?us-ascii?Q?Ar585kzQ6QXptBRwd5cpTF9Kp1sCCb5A1Ea3vcUlcXGTLi4W++t7vgAHqsIi?=
 =?us-ascii?Q?Z45M0empvotgH09hvmgEz4H6F5h6UI8xFKZrPXrxhDEyngEoSnHfZZ0HtpWI?=
 =?us-ascii?Q?OzSMy8ONk7CoLZtUaKWu1u2kqAAUUklfqU+X1S2ndQi/gdHyr/7zAUIPJAyr?=
 =?us-ascii?Q?f43sgVWlVB7kh1hJNqdKouJVAqBb0nCD7KU/9eCyU2DPo/pXpqUKHu6iqTOL?=
 =?us-ascii?Q?90ottcWiR/tzsB74Hvq4ln8fd/OQCnRl3LzlF/1nj2fiS0iXVs6ih86F3BQT?=
 =?us-ascii?Q?S3H6jZkSmjGIj1qJRjR2yiST0W4FJ/RKix6mOT5facd6yYj7z2iN4RNlIxXz?=
 =?us-ascii?Q?5bcJKgKRF7mZTl6kJNeP2dYrLIPT5K+o/dK/hSQb7AbK1YbTLxiMxGnP/OXd?=
 =?us-ascii?Q?cn3Cgo9J0u0y82JZBQP3GjxMCJb40N5vGpi+ZBS16DiUJdV+SqsBi8a5smHd?=
 =?us-ascii?Q?NvKqpfOo5y10PYhJHksObiVuJ7kMDbJUDTSR7ElSr+PTuTaN9MFin195PJjY?=
 =?us-ascii?Q?7emVslKk9QoCXaYmt0ZOmjJ7htW7dMwQZSDCQGvO/Hu4PH+KRSrOtoT5gLGD?=
 =?us-ascii?Q?tONsi5//aqbfbZKh28LVYKmBB6agr1//HoipbceQhwLGUNEMNCU8E7+zQlhA?=
 =?us-ascii?Q?FEyLAW8iuP7CGz6spXLP9qQM/SAG+QkLxLXtGs69MX2wiBs0TFVPoqyCFS5g?=
 =?us-ascii?Q?6AQCG5FXxXDz5hmasbk9Ijvg9yzJty3421+sEl3SD6yHVZu3uIVN98u7O7Z3?=
 =?us-ascii?Q?1NYuzr703L/Dj+Q1Ro7/vMv5KHrZtSS3OhI2Bign4iuOftg99webS5VsV6rL?=
 =?us-ascii?Q?oaCmq5B08lodaSfPS4S0WhtHJkLZxCbh9e5L4qJyl708F6eGSSvuh8gPirTg?=
 =?us-ascii?Q?toRu7mduH4vrf/7bF4r+iBBpT1DQTtgFk90mbVByfpKc59sy6grMO/w9NXAq?=
 =?us-ascii?Q?4WSc6Px+0oS8dM8u3tP3HjDdaf9eY12xV0ROsBNlPXKF2algq6CC6hJZAOXL?=
 =?us-ascii?Q?P1t8MQj173Ux1k2pzWHA7JfYZNp7cfEumSLYy1A+DvcvMovxl1C/ZJqnb+Ql?=
 =?us-ascii?Q?vKcPK8pXSfDewqsYaheWiJ0TdoTbOauHp7reE7S/VEMxlGY6beFXkaw2f/Oj?=
 =?us-ascii?Q?MME8YTCHBZGDV207AuUJ1r4ead/5BrvDuSA1ynYcnH2HQVMcrsLdU5E8iwqX?=
 =?us-ascii?Q?WH3N3YbHl5R7pvRAF6ANyswjrssdl3K39/C1ISMaaPVvP78UmsMxIUkVomvl?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b940ac8-2dc4-4777-3de7-08dc44629942
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:09:04.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tajnZ59Picb6jUMwBrXpYezQXOMg650uCcfKZDm8P+yY72uV6Ppa1QvDlPr/EbCyD/Ce4EVcRg/eIVS5wqAnkGdJSNwn0FHcfPRKuBmNfE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
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

On Thu, Mar 14, 2024 at 12:58:27PM -0700, Matt Roper wrote:
>Switch the MOCS-related debug messages to use a GT-specific logging
>function and add ID/type output to the beginning of the MOCS kunit test
>to assist with debug when problems arise.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
