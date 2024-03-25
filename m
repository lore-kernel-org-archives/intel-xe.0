Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA9FC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3910E54C;
	Mon, 25 Mar 2024 17:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZo0qrOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5105C10E54C
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711389519; x=1742925519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QC2WQ963cpXXNVObfeQaBD4E7YWmdFfHzsYZFY+kC7w=;
 b=AZo0qrOAeliSDW/Y/od4S7WJLLg5cty+iG6K9vCZ5nL8fXVAAb+kDlDN
 mNtftYEntw+lZvOB6joG3J6tsIwxq4rXd2lCY8DQKPeIsN+SeB3kdSrqz
 QrpFCBw8I/IRVXkSp1jW0M0mfpa0vlngheVh/p8/+I9ozz5ufXWqh5pPC
 jhdFSOCyGnpUVlCAb9AwyIgSLOxVVOSn+PTzttu6IdEN9W5MTiLgQY0p6
 gMkJx/QqtQ/YmWlTNwFGEpRcQ9FG+9dbjZKcynAPkxWVCNEKEBrr9B0l9
 y6+iqDRNX4qyfki94vq5oSG9d34pM76alYas42RBF81wXu8V6b1/K17qA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17041473"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17041473"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16367992"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:58:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:58:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:58:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:58:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeV41TFSslUttbmi0XkBiVAjK4kxT4qDOfrPDOTIn/asQ9qqXU1ei9C46PWATbGWbha4vd6xwuPjLgjk3Vrwf1REOB3fU6Qud2mI83BUs1u9ZXhlBGFmoZ4YPUDe3QLaMka7QwZezUrhkqxtWj/eDioHUpOGVzwIb4Tp3jovbaFDoVdJtK76H9LVVj/9x/3z3ZZDwge+sIuWzTlJWtVKfVLNv1PPZdTxt5NmOUmnwCondACHnuaA9X+4NudzQiLM8n7udCYJ+d9ZHUX2UHaZDvK3NY78Wdw0NHuqUaVmkgZfdhys7gwD7s2wROnmgfljKcMW0DnvMlMIGR3FR1MLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHiAX2w8zlmISeFWsm8SSqPD13TksPCnQldZJLRrJr0=;
 b=X/E+5//2e8BCRc8+HASCcig8r8J+4fWVlKvfc/87oGzN+xvRgwSTmxexHk0HKt8VtSh76mJljfZU2jrs0Z8JVZuxv14rewT0wu7I3QisrEAB8XALlEabhWJG0i4R5U7RQ4pSBjrmbBRWqXOVnIu4H6CrwBcF+H5XhcdYRanktp8SkoEL+e2F60IWl9VgK5BfhvyClxxuEVHXLVvs9S2L2ytUkycpB8JjOADFxJgpsJZFITSy49aqEB0hsqlDveiy4zaitYoNKc3zOFK5WmNoHmOpVfxWG4oHY4uSRMEJDgRKUyThOdRttiJDlOPR3JQA8OyfyNo72eJsPWNfYLvVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7623.namprd11.prod.outlook.com (2603:10b6:8:142::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 17:58:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 17:58:32 +0000
Date: Mon, 25 Mar 2024 10:58:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <jani.nikula@intel.com>
Subject: Re: [PATCH v6] drm/xe: Add a null pointer check
Message-ID: <20240325175829.GZ718896@mdroper-desk1.amr.corp.intel.com>
References: <20240325141223.3426250-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240325141223.3426250-1-karthik.poosa@intel.com>
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fc50bb-5da0-4ca1-7ee3-08dc4cf52f0f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMzXENvlfH+ivTVXgeDZnJNXNI9vhI9xGaKAPKwIw2eOAzzUjF/aennvsFh9yd1oXh6nMRMW4CWFpm7lUzDneLERHh8bKiOL+HZnjgf1ScURMluI2VK8nvPZl2abBjZQpCT33fSJ+RQiXJ+LVSpPl4+3Xlb3OVmS07m6i0uoN1n1vGiLS/XsGTphzqXvrPLZeEky4Tf0va7hOUB0w27R97zSuDFa9guiAL13Sz9yMA2Ciow9R0FHxv/e8hUQc5FsKmPmPFiS92dH/GsH+ZW5NXD6WRN+DR1D8sk+0YC1Y8D/aQqswKOc+Hx/LnrU2qiJzhG+Ge6d6vi16HjCd56xkYVbAu7xmJY98OjGBufOG+pMwKlrXW5q5HLH+UddIEpw2b3ONfooyQsLNakrXl7cWfblBVOXpGUyCRxpKDU9aZl3fixcWZG3YPHoapKZz3+LW47741gK9byFaayI1eqf6u2ssqYM5eJnXOKYQYzf2W+c2wDsAL/JpGwGzCAjRcU/BKdOvB8Nt1oLl55dMqGHtN51WV+DK76AdLAv/h2XVm08BED+2DeOiMiDUsXrNyZ+Me1KNNg86yJGRsm3VAB8PzeKDpZLAWVUaM8goGR9JS6qgQpqHLsJ0UotqUNhi6fkQLlBYvj0VmrbMHez2MHc//Pu4FOWIjtV5hXo11DTlL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53udB3FRFM2DuVJ27FNqFjb7/dMZ/UUWlkOSsUmF7wv+0eAqtIDLUWcmh6ug?=
 =?us-ascii?Q?iQ7/cEC4boe7HvUc2UYzFa2b/zhTKRBcICBvjj/o4kaVnqbgm1VLvsDdomJZ?=
 =?us-ascii?Q?AJLFMVLc9X+FcvKDO1VQAYSBBNy80O4W6XT23SB3ATp9Z42WJ+DNGiQJ00wb?=
 =?us-ascii?Q?iMe3EqjNRQaxg5h3AnRW1VeRhGI7iE98Gv6D/4q24uoGsxQy0mzW+AxsSMKH?=
 =?us-ascii?Q?rSITteFW9Bs2tm5r+Id4fzpbfA/gY4IJdEEcAIWPxoZUVVkvkRB7RsynKZR8?=
 =?us-ascii?Q?siZuU9FBI6/eCDLy7+X2wzouQidrNCyjYmgP4aBwFOSBAZgQC6y0EPoVTHB8?=
 =?us-ascii?Q?h/u46kdNGpAXtwqd54lptc4G/2mTVA1pzPhKOlgHe0m76693HYBAtvvgaPxu?=
 =?us-ascii?Q?vWVs4jnkALsl01OZBQx4Ye/LW/wZKdsF77iENBK0o+vu90KyMItr9KakDdHr?=
 =?us-ascii?Q?/EddqkLIz7JJrCCt65+F+Svnj25n6Dfy88Vx+QY8dHlWMokIdvVp/4klrKWX?=
 =?us-ascii?Q?XoWQMIraGi0BxZpJU1EKfpFWQsl9zUJ7Y4IxwMbRxieCpWaEk0VaNwtbm8bf?=
 =?us-ascii?Q?FDn3T+C3RfYXf39CplhEZv/Dx3lHOGFiFfKEBBT+Cu0Tm7+nRxISHiV+yZ3C?=
 =?us-ascii?Q?UzSODAzre/8e1k5ZVbKQb+o9i/Ay8qjsR/1kesITU8+z/YCy9yZ2d+JFcmxg?=
 =?us-ascii?Q?yB+EHxzCiLa3RYSTsnGDJL6CkmYwYQ0MyQFo5l/FHQcKxDCLvB7jYOiw1/ae?=
 =?us-ascii?Q?jfEKvpWZbRST0llf6nxihMzeFTaGB50kzjodpBBvtNE5bDDJQAsUk9UPwpVb?=
 =?us-ascii?Q?FwNKx5pULxvAkns/v6dDgIOiOAfhyxWk7TpZLLUMtcWK6PobS7m/6tNb8xGI?=
 =?us-ascii?Q?DzJIxk60OZ6+6ZJhSUf6UFdCnKk39HzK1utVKsLFGtU6Edzou7fb0+FyT3fM?=
 =?us-ascii?Q?6ZOZFZkBAL+HnRJWXQRC97sTXGmlXLu61Xrt6PsV3LHIg4rHe8oHeFwSgeGj?=
 =?us-ascii?Q?X6kye62XICohJxK4LN1HXkm/hx/oeO6lMXUss9JzHeeGKWQS6WW+ZVGYp8qT?=
 =?us-ascii?Q?SVZIfRpMG6Woj7E1w8WSMdZs93v8porm1HgrjBUD4llCg2MSJLOnHJoRPLf2?=
 =?us-ascii?Q?AHXY72Jt+86xPDPBlxilQd08qb/oEEe6l0rSeU6wVmhX9J6sNzu/0VFrmLYQ?=
 =?us-ascii?Q?N+Aw014mgrVcEbWq7o1ec2HoBHr5wMiuTbts0Xntn9Iabsgo9oHR+bSYJX8p?=
 =?us-ascii?Q?HTZkzRXVR3H8XHZMDkR0qWBBi4JRk5HiHpu0k4GKqYuHo8JtiSGzUWKt00zc?=
 =?us-ascii?Q?Hvr7M+MIHFUuDwFE1s4SRyVQE5JB2D1LOKneXFRUpWfMeg5PspyezC9LNiZe?=
 =?us-ascii?Q?EDuLkyJW+b9dPnFlm30/t9rjaA8dsu93amC7fgAZGKsAl2VFn71ZInVT2U2v?=
 =?us-ascii?Q?E5EHUWbCqnhVmSVwscxUi2AGyjnU6yKjzxhzS3OMJZsn3AyhAWPesakINpr6?=
 =?us-ascii?Q?3nTWr0ZE43SsYYUJPd7RXMppnqdU9v41kNDfDjSu7gMhlYgubtmjW0Qp1slg?=
 =?us-ascii?Q?p8CvJZfQrdtV3Eo/Zi+2NSc7u2/ex2VnofJJxbdxDvE2zznT5D9owbNiKw9l?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fc50bb-5da0-4ca1-7ee3-08dc4cf52f0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 17:58:32.1157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ThmAlDE0ijVWyIKuorohHNrKYPFaRavSuZAjBwYOq6wF6meIwMUDX5LkChmMAmuotx3Uu6P0epw5zqcnV06dJ217uVRhSawnGQdARLSKTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7623
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

On Mon, Mar 25, 2024 at 07:42:23PM +0530, Karthik Poosa wrote:
> Add a missing null pointer check.

You have so many versions of this patch that I've lost track of which is
which, but as I commented on an earlier version, this whole patch seems
unnecessary.  All Intel devices will have at least one GT, and we can
never "resume from runtime PM" before those GT(s) get initialized.  So a
NULL return here is impossible.  If you want to be paranoid, you can add
an assert to make that invariant clear and it will get compiled out of
production releases.


Matt

> 
> v2: Release resources before returning error. (Riana)
> 
> v3: Update commit message. (Badal)
> 
> v4: Change drm_err to XE_WARN_ON. (Anshuman)
> 
> v5: Fix XE_WARN_ON check. (Riana)
> 
> v6: Update commit message. (Jani)
> 
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..f6837bd6f9a3 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	 * really lost power. Detecting primary Gt power is sufficient.
>  	 */
>  	gt = xe_device_get_gt(xe, 0);
> +	if (XE_WARN_ON(!gt)) {
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
