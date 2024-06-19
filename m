Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F44C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 18:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073E10ED82;
	Wed, 19 Jun 2024 18:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8R9jB5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152F610ED82
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718822449; x=1750358449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HjBH8rLP6tBliPBs2iXUu02A1Ds8xZ76Un2NJ6dm8zE=;
 b=L8R9jB5HMLgC1dg8Db8A+qIFbTIKBlurBOzoR33rZC+GHVYHoEY2nTio
 +y4pquZCXfbN7qZhhOiLHjrIpW+CyZVW1EKpYreoXNk2PxxVsxA84AopX
 aP/x40X5N3VAS5zzsySC2tG/RnSc5hA58sUyfZrtk4iFau4hYAtleKywY
 IMqYxDzkZrWIVhA6ybUjBr42C1Twem+CxSQrV2QAOS3FwvMtHgUNgoBX/
 /24KFXeh4qXcOVwE0sLXgBVTa0KaFne2m005pYzD+3agzVZs/lpAC8G9W
 Y2XKgPRQeEiQdgaOf8dUra+sbURz1M2i5iXFBSy2Y49wyt9qE7LUo46UE w==;
X-CSE-ConnectionGUID: aC6WS8RtSrScWNlKaU25zg==
X-CSE-MsgGUID: fZkdMMM5Qcqt4UaYaWlknA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15914568"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15914568"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 11:40:49 -0700
X-CSE-ConnectionGUID: zg34NOEMT7GBZvEPvrPx9w==
X-CSE-MsgGUID: 7COnkoxCSJqnzDiPk6GFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42464145"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 11:40:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 11:40:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 11:40:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 11:40:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqNtUDXDH6XuYT95c4qYLwX0plYzZ6RT0XfAZJUxKFE5Ty6v0a1V26Px0764RObbkklOGftMC+1u0vx5LOrK1ucauPfYnlvSKrAhmkOSBcnZFohFfa5zV/xrDPBUV346Hsuxdcl1C9P5t/J5gFZRpUDnJ08CJy//eT+HRyLddtY1YwdFm5dh+JJIB+hnP3XKqXQKlseoPkEQGg5+ZLYUOSc0G2snGYjkc6VbqjUBx5smq+WArZkTlaOdZlRXFJc5CIuEPLgkTZ3uwdr1f3r/BlkgVZSTDeD375wOt4ezcqdC3xohcBl1unh2BhTtqZZWJtYDHTJY2CxUdAkrCASEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u5ZSKpMhZRJR+T7KK/5/TDPod9+1hcbeRWnjjlLGyE=;
 b=SJe5vssB4WFjeFnLVCbaixP80W7OFpil+mfvhskjn3jRh0xgu1n16j0jQNCv5EF/ZCL0bGZ/aASXAmcwpImEbiFCP8F4UiCwkNPwbb2oDxRNrT6vMNK5XffIh3YNqoQdAlwaZ1M/lD8p7pVvvw0yhQzm96cAuaXukDeOwEotV144Slc6bTo0tE3Xm015q7C4L8RLbauqIOO7rap8uK4zEWUUSu8rd6c/CAnXncHOZEu8B7vAFDJqLV+VCjTsO1AEdw5B/e9P9vnhtLGqpSiL+j4fT9CinMdkyQMXQL6ZTiIq58M7FbbUafjKtWWbhn76zyVmS5kXPtB/ZGsg1TPtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Wed, 19 Jun
 2024 18:40:41 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 18:40:40 +0000
Date: Wed, 19 Jun 2024 14:40:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Fix potential NPD when OA is not initialized
Message-ID: <ZnMmJuEcOyYARokB@intel.com>
References: <20240619175427.861-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619175427.861-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV8PR11MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ff574a-5008-4335-6d2b-08dc908f51d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y5t9mtO+3ZWnfYw9fV3sePcjoODAo+oWaZ4jIVh3H2H96VtXsdpJuyk4TZFl?=
 =?us-ascii?Q?uI7wHqbnFaeo8OSW4JRoQVWppNpREgvRB00TPpY87Wr5ckW9Gv8+fj4Puo78?=
 =?us-ascii?Q?+c5MIN4RzNr7DRI9VWSjHhjMJAY/3kZ73f+zhVJgjGV9XT2rYPs3If9Mkf2e?=
 =?us-ascii?Q?Ma8qa1F9vbBTVx/06xCRnwoEkK7L3QSa/1B/k+fOivMi3YowZKwzGFBd/w/H?=
 =?us-ascii?Q?hZmcATTaQGkik8ZQvZrBNTQNFxPdh+gfkkHbHPxVY9QWs6US8Y/sUD8831tR?=
 =?us-ascii?Q?xPIiYLW3pEYEBztBtirKwXFc7f3Igd+D9mrmSuvObJEldi/oEWXTn+ST7oEt?=
 =?us-ascii?Q?LWuOxc/CgGvLPwB0B1OkAv2b5ti7D1zndIeQqgNDJZANxd7I4Qfdf00O6+CC?=
 =?us-ascii?Q?+lrriMTKXj01Nhty/f65Epr7B4fBbQGJrDK0A+dlqvJeXwYsDUWLzfRfhfXw?=
 =?us-ascii?Q?KtEZ28aIlgeZWzpwIhUAgAVYD9LwFBndgXsPvLLvBi/OAusUPjw+d0Osq2he?=
 =?us-ascii?Q?tI24WCBfcfjJS4sGI2oKaeZPN+a1awU5v625sT6sjlB8wkqyBukaVCQUWOpL?=
 =?us-ascii?Q?jCJg2+ZaaUQeTcX3Tw49i2zzgY7FVyA9TPXy5AIdUOAW+ROfUg8lrgtH7soa?=
 =?us-ascii?Q?x2TPOGBVsRdX/euM074p6sJrD/RGYRO049dIA1WjZDesCd9kKfZKLdRMn2Sq?=
 =?us-ascii?Q?Z3GefLkC6uyjQMwXkX+zWuzRsAhNshHHCm9HbXbMJas2R2fqq0yLPvFYH5z8?=
 =?us-ascii?Q?u1qMvgMhrwshOegu6ec2THDF4eDmDkQCj0GYUugurkjZXwwPUUj60nuykajd?=
 =?us-ascii?Q?7GCnqKGwVo6gETfvBnEPIxCqzKP/GpOLJab145IRyDCqhmv8lcr0hTGWZAO3?=
 =?us-ascii?Q?OMYPHjPosfEdsHUgI1mU2uJ5lnNPNcn2RHXHUnMAP/oW0+a1YdQmH/Fj2XN9?=
 =?us-ascii?Q?V1LpNsBWuMCdZqTJWpJcNAJIsdbkGpW8UOeXv7Vf0LAFyQuvUOmWYz1UhRrq?=
 =?us-ascii?Q?F3cUhfObFXXawNfOv8zq2lnPsrd198EjXnSGpOso1H50abLNoAGddqgPssra?=
 =?us-ascii?Q?WzGnIioOL7lRlIpVwib369v7QySq0+N65/k/mHGKvVjOWgFXkNQpWlqaw8BA?=
 =?us-ascii?Q?uboXMXs9UFkVwXGf+0WTCJlfX08ikhN4nopqn/eFwduEr/NhXGazzI5zCOwy?=
 =?us-ascii?Q?iXsvOZ9ZwrVeWTv8kyx5fQXVZEFIU41TRld7EGX/vc55F46p5gtWC57kk77m?=
 =?us-ascii?Q?Ce7+LoMhVAUm/IR2NfluNLnJJRxrB5qTpqTgWJZ8GFB8MpF1CWxsx0l1TcC0?=
 =?us-ascii?Q?6XMJkhc1JSgQJvHc+hWzzVyy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qaqxw8MKyvZrYibMrpf/RmhBE3HKUMhZJNjWF2mfDwstO5BWJwZvsZmrXMuT?=
 =?us-ascii?Q?g1IssLsLMJcQpNYHOLpH24HYNapENjHM6+3oHcu1eATS3v8X+5kID6YCXp/P?=
 =?us-ascii?Q?mOe1cAQFV3FcL6Pr6eiuvas3dILqp2rT7AIEuZG8DeUlr/4e40171FfPsDfR?=
 =?us-ascii?Q?HI21inJ2lVuRXZF59Kl+AXJuKIOMabRgoMSWfUu5vMWP5JhaCHtWw+FGhK+/?=
 =?us-ascii?Q?L9AWe24yXKW8wQfxBcfOKZYOrko+nc36RF9FZ2DC6+s/17RVaNLvHr7ntQrR?=
 =?us-ascii?Q?MbGIk4C+/hRqXcd1PnnUPySkZ+5FTSGmt8AQdRAeMUOZEFiWfPRsAOO5mrxA?=
 =?us-ascii?Q?MwyTMDkhLTAtbJ/BVtoRxv6wsgU257lk5/eVtuw+qYCxl7rSMPueiLs8qWZY?=
 =?us-ascii?Q?lRr6mdKJNZ1GVUWDimhxJGqbJsPlLsb0beANVKGXnQ2MIsjiQ4A+RFrJFiJV?=
 =?us-ascii?Q?JNZd9wExPbdu/8wr6Jpnyf+SRUdUzA1xbg/NkCXaYk6xWBCCWhu0FHHeRNUh?=
 =?us-ascii?Q?F71XqkyAafptDLnWwrIbCNsBil3krJE/nZuC9exPGKZ03J+FS2dGRg7sT9ue?=
 =?us-ascii?Q?5uoqSnJ/gtq0Y0osDuXrDBw1nlVan9kv+pUAu74DV0aJOA5SBKVRql4mA8o7?=
 =?us-ascii?Q?0so7yz7+G+Jyfs/Tp2CFIQAgL62x+SGb89xT68nlW/FAodDGN5JwMuxsIBjv?=
 =?us-ascii?Q?mZJItTGm6rLUBlOekmq6j51QFlUEZvxE9viigvNWKhH2UPec80W4c4woB77m?=
 =?us-ascii?Q?OVaUCjh0Bewl0/I6Xz1xJXCxL7N2lHHgK1rJrztTqrPCEdIH1uQ5yiLeyOHf?=
 =?us-ascii?Q?VzSL1535jjqgZfJcimk1QJnkKKgdAwH1slik13V9uaDxcpAxva0W1LghAJ89?=
 =?us-ascii?Q?Rs7r94vHMYbfTfU8emZpl5ej9q8LCKDdcp4ugX5wBbWw3L/V4JOgMA8O9lDi?=
 =?us-ascii?Q?/3Hco/OP1/nmjR/K/DK4tDnTdcw80CkQFucMhILq6WTHjzaHucpZM8Cm7CtS?=
 =?us-ascii?Q?SqhS+/oUrsdgHMKx3m1LfO56+siGvnCc9JWVAvfECakK2A52WIdGxU4l9pBv?=
 =?us-ascii?Q?uTcn5A1DCU3dsSpAm6yP9qtyC9Ity9F/wbs2dRZ720h6YCTKCDCgzAplE9xC?=
 =?us-ascii?Q?kEX1NwtWyktUw9vIYzD360asJct7/u4xzBclwDcZtNo2dDOZM67tsFTxZLIQ?=
 =?us-ascii?Q?U5XJNSjd7t4DvCArcD8cLW/oHL370i7noISfHPFLoMExrxQfgDMu9xSX06NJ?=
 =?us-ascii?Q?zA5W1hYoH5KxZms/TxH5yBBZJf53qTQajeTIDZc/6X+kj/otBHgW2wV6oDik?=
 =?us-ascii?Q?JhAhFw73v3XtEety5sJKjsWvHukaCHrnoLt4K2ptpZWiH313IfWEjt/GQ9cE?=
 =?us-ascii?Q?PuVovdJeNZlGQ0OO9L0dANPFxfIUtFQXVDf16q64/bm7PCp0mEtdfW8mcQkE?=
 =?us-ascii?Q?0gHAZuTe/zXkRYLycnzoiwPw3HTDovXJHexQO28LEfoAquizaBtjjHGNDKpQ?=
 =?us-ascii?Q?2ix5Nx9dAo00LEFvDIOrNx2T77k4gMOn1XM8QPJpf5HYyohi7HtaKQst5XBm?=
 =?us-ascii?Q?4Z2KYeRx5p+k9UCLvpl6bx4J379UOM29X7a2XMAz4J+yIvL6dq1wYRN7ni2D?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ff574a-5008-4335-6d2b-08dc908f51d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 18:40:40.8803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xB7mHLyz6UxILBZFh1ToAFoWYlu1xjittHuBzgkGoXgTPt2SvrbHzVNUNZn7cWCkMQmQsdHY9Yd7oxpvv7Juew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
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

On Wed, Jun 19, 2024 at 07:54:27PM +0200, Michal Wajdeczko wrote:
> If oa->xe can be NULL then we shall not use it as a valid pointer.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
> Fixes: b6fd51c62119 ("drm/xe/oa/uapi: Define and parse OA stream properties")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 34206e0b6a08..2277af816a34 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1725,7 +1725,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>   */
>  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>  {
> -	struct xe_oa *oa = &to_xe_device(dev)->oa;
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_oa *oa = &xe->oa;
>  	struct xe_file *xef = to_xe_file(file);
>  	struct xe_oa_open_param param = {};
>  	const struct xe_oa_format *f;
> @@ -1733,7 +1734,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  	int ret;
>  
>  	if (!oa->xe) {
> -		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
> +		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
>  		return -ENODEV;
>  	}
>  
> @@ -2005,7 +2006,8 @@ static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
>   */
>  int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>  {
> -	struct xe_oa *oa = &to_xe_device(dev)->oa;
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_oa *oa = &xe->oa;
>  	struct drm_xe_oa_config param;
>  	struct drm_xe_oa_config *arg = &param;
>  	struct xe_oa_config *oa_config, *tmp;
> @@ -2013,7 +2015,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>  	int err, id;
>  
>  	if (!oa->xe) {
> -		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
> +		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
>  		return -ENODEV;
>  	}
>  
> @@ -2106,13 +2108,14 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>   */
>  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>  {
> -	struct xe_oa *oa = &to_xe_device(dev)->oa;
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_oa *oa = &xe->oa;
>  	struct xe_oa_config *oa_config;
>  	u64 arg, *ptr = u64_to_user_ptr(data);
>  	int ret;
>  
>  	if (!oa->xe) {
> -		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
> +		drm_dbg(&xe->drm, "xe oa interface not available for this system\n");
>  		return -ENODEV;
>  	}
>  
> -- 
> 2.43.0
> 
