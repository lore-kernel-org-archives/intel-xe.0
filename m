Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AED2C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4D610EA02;
	Mon, 25 Mar 2024 17:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaBQoIcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D5A10EA00
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711387362; x=1742923362;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JAyA9XUNvyhhJRKiMEYbMMVYZOPtJJ8vKHb0hH4F+Jw=;
 b=WaBQoIcOe4n1+B8x+SAMz6hofSxOJyZqWIFEe9UfxeKkBDBP+W4X2OOl
 kI+rTfQpPt6Flm++sc9fpsqtRC8qzh+DZNTgh9zGP4eLozMjq5x1cmkmo
 644hnYevZ6Z6m/IcQYbDL61jpqbrEVudiXFrAqpaj7m0qOHI+NimnlSuO
 2w1wM/4MQGNCstgUWFhsb/J/H6gJEJVFoPsClu4tE2fBvlTBHDOn/GtnI
 NlxMS9hNZXPGRUBrbMCTWa+/HzSvLjanYseTJrIt/bUynhuqvMgrQLH7q
 AqjdpBD9U9umVNP1php1A4Vh/Q5cZb2aTzxuNUTZ6wHh8qrr7Wmb9LBZm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17137424"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17137424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="53163640"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:22:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:22:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:22:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:22:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHeOiz78nbYPw9XZjEuMZqAAXimJryZSrecC2X1x9RIKXrudaoUKrcX93C2FjTOjFOc+K41pkBAHOvWIlETfjJLIA2C3spbAXusXkiXzrgeiI6zVReFTThl02XE0OQpU7ScOC4WOicYTH0fb809mzzSMXtuHKPCKX6T5AeIrhVZ6f8D0s7+5sgg8bCZy4jH3ub28qJYNUeVjjxnQscI4iMuwcPhJzuI52mSgDwEAFj5MBxIqw1/JKNzgIhwRB+prFp8oeC+9OPDtQmIk26Tpt8SAkoVwBd//aFH1f+OIuiyqBybmsIpxI6/l7is8kvwTOiw9SDCoDTSVPwFg8a5XRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eo9Jpa+Dq5BzGHgqOUpTVvWAfkO82Fi6Bdo95W8w+uU=;
 b=X+/pwaKvwcI8Swvm/504XNOl0qFhgNqTMjY2KoANKJ7Hvt4x3CVSSHp69XC9BYAbfxIjuP3MLkVSF6ATyMPjlBIpNXHxlMosGTVijuygBsU/CjQxnVkLxVYkcTMnlMlrsySyhhYail7XgP/3mrP2/A/b1zpw1poMRhJoIUWvwxqKlMfJXEl0UwR5SgK5sjgMz58rStJupcNt2dE0hIMNF6Yjty959jQwt/LA8N23K3/uv3j3sKypQlDOqA973KOnn/QtA6TX800KcyvLppCAql96/XKfr5Ewroc4ujfwT8YZdJZxuD/vJFkskT/WxXf5fYjXYZwD+59PKytNQyP8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 17:22:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 17:22:37 +0000
Date: Mon, 25 Mar 2024 10:22:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
Message-ID: <20240325172230.GY718896@mdroper-desk1.amr.corp.intel.com>
References: <20240322143523.2531519-1-karthik.poosa@intel.com>
 <20240322143523.2531519-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240322143523.2531519-2-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f199a7-b4c9-42fc-a98f-08dc4cf02b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9uGfvgH3X4OaHsPHxYALGIJjthx4dxxBw9EpY+GrQUCF7A/psGOYdkhAfhRWggPpQar3+LHlUqNJ2RdfAK8zT36Dt4J5nx6Pfx7kY6Av1DUaLZbzL0F1F/p7SwGef9OWjDDhUVtLRfZUGIx3uLFCjESgF8TIXnKxnfoPAoVlV8yJIvKWr5qDkoA01cG22elMz6ByLX4LgKexud/03pf6apQRpvYT0Uf80rfPCpDtOlNU7AaJgX5Dh/7VZHbX0wqjZ/mrH1Do6dyM/Iha9IpWuwdv9okrQpmczOHzLhA/WrLLHOF0i5nCWsizCZeMFTAzWw85TAupvlhxR8ekrDrLU4thILT/DeZW/ETcbgLYYxI1G7RqrsPC+s1MXQOfhZQ1gIVyzyySzWazj2Ls1dgY+hCxsRIxjxP+RfTB4EKnjchNgJOhZJaGewed/I1jibckz3gYWn/+pCW4P2GugfWXRcaHdeG/B2+BrZiuoEdIS0pbZkfQ4OQFnuKB+MkieE8vCv26XLu9ZPK4M9oMY2EK1iAobFPG8+zAarPzQ0nRis5+n/4o7mZxzpLO6v1TgoNdfqTwqzgzf/D95bZ+TtTSlVMHRGrFntVnHt8ltfwd79Xb3NeaB2S1pQnhg3zSPSMT+GSclX5mAN1gHH9BEmTGoqcd2UnhjF2j9Xz/+c2PU+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KJJagMAFOV+TJDySO8UnrDQd6uoFSSY0997n4pYsHlOQ9sSLVsZ7VB3nPoAj?=
 =?us-ascii?Q?WK5UhOuPwGNVyX8dIBRwu2TLZyWBkS5LUCMvsfT3FoBEPds96JYjmDRVyQgW?=
 =?us-ascii?Q?yzTKUr2F6XNbZvjg/Dj1+yBpjDr5jwaqIscE9nC37sucKJXsuUX85r70B93M?=
 =?us-ascii?Q?x+g/7/LINH7FljZrhpxSom0+htIdG67Io5QBT6XGKl+/r+5NSK1syOC3OHei?=
 =?us-ascii?Q?VDeBotRwRIj8ZAUBj25D9biY27FkIqFLBAoV1iiojlcQlxn+EcN1OewklBd/?=
 =?us-ascii?Q?XdcLRbpyBIs1patesGMbONh8w3vXryB8O7slxeC0yGOz6oHcZmzIPCQWZeWr?=
 =?us-ascii?Q?2Vm+I+eDm/geH+/yuwlEawyZvdlMAw/Szovkj99XUGiQ2yPtW4Vu9LgoQffs?=
 =?us-ascii?Q?Y+3WIiRt98ZVAY/BtSR9miG+7UA66FGdxpuIuV7oSN0zJOdoVxChfpnezWr1?=
 =?us-ascii?Q?YQTjXrlQgR+iXbl3lCN3GSydNWyLTTtT7vdo95AD+jRCnFVxkaqmsTQXqeBq?=
 =?us-ascii?Q?ztqvGNpqiJp5xXeBeZsVJbD7fD1GqF0DKaeimBU8V6HgtYniE1pCsG9R8CX8?=
 =?us-ascii?Q?zTneFqCPy+j+EPVb6mdl4x4BTOY3hLWVpHY1HT2PtNqTZjlPLxqP7QgNYuue?=
 =?us-ascii?Q?zdZTXPPj3FXunaEYkLs57KrBuYEEF8uZF0qTpFONR1+3pywnTTWSgvQc6ZEN?=
 =?us-ascii?Q?KwwPIcieGDS9fMVW/yl/6fxCdW+QxZLukfBmrE7UBhimwwz7dcItOTVfcyi/?=
 =?us-ascii?Q?P0vfBmmNMMTjqEciK/eHmCaWJDoWtwxkM8bmqETmUO4k22WKBd6FILXX2oKD?=
 =?us-ascii?Q?xrrHsgKnyAW8uqLS/4YdctFMEWDxcuw/flqmltlRfTnxakw6BWAUasjmlyy1?=
 =?us-ascii?Q?GEY8HvE5UV9T/0AVC4OrRVqieoBNUA2xqSnJleXjYZh01keX708D5QDGXsp5?=
 =?us-ascii?Q?cHUhPyouO8LR1yLYWIv26/riGd3/FhAQyZpw0eBEHoRWN8NEiAXsV30ILoNP?=
 =?us-ascii?Q?xBu0tV6XLIywE18koDuNKBozBBMwri0C7lbosKsatFbQ7SbNOY+vv+JhUhxT?=
 =?us-ascii?Q?9oOwxIWONwOfahEtT0RkxqCea+De12yxAQ2q7AVmyoXNA3OtU9DTOQ/mwtc0?=
 =?us-ascii?Q?x8nTJtBJnmSkZbH0fmAs+Rj7gWwq4SmW1JYJ5coni5+3Qy/1QdvCvz5sPk7l?=
 =?us-ascii?Q?LXn/oUlXRkvNNQujXUQVFoSNu5haNjOmsxxkNvV9JHnDila6GxiyuHd+3S9o?=
 =?us-ascii?Q?IPv4XFm6RejqB7ewINkljsB37O+xXP7U0ZF0CY8yRaszAlbIIeeKhZ859a09?=
 =?us-ascii?Q?ybrTtr27bb4xUoH5gq8LzDYkf8Qrc105gho1bXk6RlaglHYz8k2KevnkK0ue?=
 =?us-ascii?Q?vUkMPtOezUTYfmZZYVxtG22Yvfh0iWuX18APsOkfrq+UusjpYYucjitvuiiq?=
 =?us-ascii?Q?slGb1kWrATH3p1y7ZDd8uT/lGO4JgZ/El0E+a3BqOha5P4/JcC3oih7zLAKx?=
 =?us-ascii?Q?9/aUt9W6/GQCy/73YHwy95DhCsaRHhWH7psHABnxiI2hESyovdNHD5P8LHQZ?=
 =?us-ascii?Q?nwPfs14YTI0kZIQDrxl5BBPgejrc01Y1yxK8d7/uPQYk2FNWVd+RIt/dT7Yd?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f199a7-b4c9-42fc-a98f-08dc4cf02b06
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 17:22:37.8764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJI6Nsw+QmyUA7JaxQ//YMI3Rf71LevOsylRxbpjEd1qYiyC0v2U2if3yPyyC1itSDvxibcQEeTzk3ARexg65KOef6gAVaJw2b/5HW/7Vh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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

On Fri, Mar 22, 2024 at 08:05:22PM +0530, Karthik Poosa wrote:
> Add a NULL pointer check.
> Release resources before returning error. (Riana).

Runtime PM doesn't get initialized until after we've gone through
xe_device_probe and initialized the GTs, so it shouldn't be possible to
be resuming from runtime PM with no GTs setup.  And every Intel platform
has at least one GT, so we would have aborted probe if that GT failed to
come up.


Matt

> 
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..46abf63bc37b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	 * really lost power. Detecting primary Gt power is sufficient.
>  	 */
>  	gt = xe_device_get_gt(xe, 0);
> +	if (!gt) {
> +		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>  	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
