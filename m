Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D7C10F15
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 19:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C6810F7CF;
	Mon, 22 Apr 2024 19:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUUToNfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C268B10F7D5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 19:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713814137; x=1745350137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zdq6FpXyO8qb9a/8E4r5q4zH9Hx+tbF0Hsm/71rXXKQ=;
 b=jUUToNfR6M1mfL6ybk7d6WDyThL5J0vLQ2aw0L6n1eaf4NsZ9Ic8Fy0E
 xXs9HVRb9PVRGSgeNO8AKHCWhnFRboinPxEvlI/ZqEquTuthFF2o6RAZ9
 oX9jRtje0vitKeKkHeuW/afcRAqIXzzHT5Do6gv3ty5PoinVdu32uJKog
 SOyS0TRAoQ+B4HqjRJFIIhC4LZCYnvObASyCoq0fIVOiKBlKw9o+jQc/q
 NIHs+tKsQJNqKzkcMy7jWkIuRF+3H7PLNAgcImIQ0EkeCLiXwW0iuA+wW
 W95tCZD2IwTpZ438ob+aLTRon1jbbx9aBKIEl7lOp/MMbkpOO3jX8L50P Q==;
X-CSE-ConnectionGUID: pJnWiAMaR4WsdwgtMdF/Og==
X-CSE-MsgGUID: r9Z6S5AqSr+UNL8XrhMnrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9480467"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9480467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 12:28:56 -0700
X-CSE-ConnectionGUID: f7taw4jsR7GHFLwyqmdelw==
X-CSE-MsgGUID: 6WNR+y1gT56Gao891TpegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24188615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 12:28:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 12:28:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 12:28:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 12:28:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 12:28:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8AP7EmrB+I1tgXHql7eWcNJOVIlQPlIsjBq7MVSlel+WgQrrUi6SCuIeqDe3dtigLhxqysys8sFSTanZi9Stg+EeoxL+ooqmBOsNEGEi6gbk774sj1lIS1XiKYZXRL2DgAW+LUaGk0H7cwTkxFIZzDma2IcyzmYiD2bogK+F1qpLUqodtvhsgdJS2oXTtnshM9WWdIpWdnOoYagVl7GDHYke6JIx0jloOnxqewchGHD6IEYCkRq8DNcH+eK8/67j0hzGmwDHCtyvY+uMS6Avs/W17EZ12FgigCNYOtxsq14VfekiQSZpiN9A4VgVxXyj7lbNXYNGFFOdZjZVyQVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNtbusCOTs58ut9oYaI9M4nrRnSsX6ieMBeUKu+9KGI=;
 b=m7/B3FCUVeohOSJD5xTmIoEPV5vs4CRkd+UxwEORyGFt7u2ACgJKnGXgLsqlw7TtvCdssKe2XJWuVblR9Q8elXtz/qBFdIbnsxPbLaAsPsqDf+5M8QTA+6G85YFMxIryWdri6M2Z1XrgUb7t9d9jaCtO2h1gIhv5hhzVMyKafem49bac2T1GMQbEP2sMWoR6e6EpR0wO9MfR99voDW2dABbWkHDElzgjHXDJaVxn/fmlpx1i8P/qUw3slLCZXZ7CGS7tyMB2fvSk6hgYuHuGaZ3hOQn9PCgMUOPrkUshwHyGGxL2fQvgYX91W1IS9ne6lW/BGrffUo98BniGOOFdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 19:28:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 19:28:51 +0000
Date: Mon, 22 Apr 2024 15:28:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Remove unwanted write permission for
 currN_label
Message-ID: <Zia6byaxqAgFtixm@intel.com>
References: <20240419125945.4085629-1-karthik.poosa@intel.com>
 <65bcccf4-475a-494a-b88b-40afd0aae639@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <65bcccf4-475a-494a-b88b-40afd0aae639@intel.com>
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cd11f0-82bc-427a-1b57-08dc630270e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jlC+OY5hYg0HrAB2tJt42qUjVKTdXXMuPRMNeBY+MMn/ym43K1NMOidlLwdr?=
 =?us-ascii?Q?ichIkfv4FMqCPWMe+QafUx13prq1RWBIX6W+K5dJQCA2pvRBCi7rotICjgz4?=
 =?us-ascii?Q?8KNzfarvOSa3B/jbuARfltUZwywCTvAxqQBMiWAt/JDcTAazzpadYhUcgUlB?=
 =?us-ascii?Q?NO5mpwrRMFHU++wj3jq6Bk/zQ+0eeydyAKYWxjFlrmTDkqmojzOX7aFP96IU?=
 =?us-ascii?Q?LeXxuoZGCildEQhTzydwaeoNl/6kbVQXS3dj/Z/smm5Af/UdQ+QKH7CUVMQS?=
 =?us-ascii?Q?IAInXtel7jvvfMFVOL5ew4+9zAHakMbbhEK2FNko0xm/0+CINKwhbpmLBdAL?=
 =?us-ascii?Q?DdhoFSbJBHWFE6kFSy4tuXCD4ulHtKl3+OAkjNithM4v4dWAK5FV0JL1GSNv?=
 =?us-ascii?Q?Gwl98TwNFcZX7JFA33H/A8cLNsTI+1nzzRw5F9+QBe7RYjaZpUF7Ag1Ygg/C?=
 =?us-ascii?Q?Y4KVtNww9qY6inBQF2zFq/qtGJDrMj4tgYe1XaRXccr8WW/RA0qkIqTRvWkY?=
 =?us-ascii?Q?RJhMtWPe5WBJrWmd5Y3oIKcIS7bcueMhWhFX5NhB8h0+Zu1Tvl6uw7Q45zFB?=
 =?us-ascii?Q?emoAWDSreyuH2mytnzFgxXYKYyoV4bPTH4znKIth2Ci4pmJ7NaodFClyyUei?=
 =?us-ascii?Q?c5Q19O433Kqc/Jc1bMJ09f9wlOuCQskhAOIL1Bh3uRRp6OzEuVVUR2POkrUB?=
 =?us-ascii?Q?i/BrHZM2297agvENR5TxpHMHNOwIixJMzoJIdkTnws++XcTVitNWqJqJqpj6?=
 =?us-ascii?Q?xkqAA3ftBSzgNcbHxLMxVn4qAuywX/7OICb2nkEFiVqqoVb4RGv+Y8Fsnk0/?=
 =?us-ascii?Q?QoW4SZrBXPrBpi1spueAiGWFGi7pCQD+tNO9SWzp/OgIdFW8llF6gj3K3bO8?=
 =?us-ascii?Q?eFo2lTCW9vkWX0R1r9enYtB7PtzuFwrwyRWQ/HUQN91pw7nswDQvVhg4Xm+P?=
 =?us-ascii?Q?fOVaeCLmaba31dplH/LiglDHp/oHvnWuW/NWTMxSJdcgICL1JRpBdBk/9XvL?=
 =?us-ascii?Q?XzOqYl7R6TQQd/iw/ujsnCMqvBuh0kPpQAD+LE5bLdbxc543D1d87Y+NfIop?=
 =?us-ascii?Q?/DZ1ShVKKrt04ZVH+VxszsSCaXTdY4QDXqVhO2uEi6+RM5QmuThjjMWytWn8?=
 =?us-ascii?Q?ka2vj7ssJ5SnZNZ+t9EqSS7czQUJAhO+E4Cx1DVUVDVetbLvk+jUoyJiQDjz?=
 =?us-ascii?Q?+LVCLvhONIJ8BgnsutktQnPBPFCfBQ3t+vKdefuMS0H1uE9KGrGbqj8ac32f?=
 =?us-ascii?Q?bOsCJV+J0BhujxkRD3jWFgAzpmiNuFiUDEPAc2442Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T+/FPEnRlj1DZ95GtV8XbPFpru3jhO/YWVzEdgXCfWkna3oq9nSBUhOzzt6Q?=
 =?us-ascii?Q?nB7wE3Jf3tcLKr2dhagLgPxroEBZ23gBu+DmAM0kDBTOVG2/ebOKnWn9nQxi?=
 =?us-ascii?Q?/A4pdTohe9ow24X/nTzQqWW78ISkXKFciyuBUJldeDgkNg8oITcQ94Q1temq?=
 =?us-ascii?Q?T3fb/POZnlHqOqyma1i0uBoYvwib97cOUso90hyYn2y/YzcE6D6vdaLj8CmD?=
 =?us-ascii?Q?sLT1+30Duon68tCuTExjAVOgpP8SShRx64XD/06okxxfBOsGhqPbRyRlnrHq?=
 =?us-ascii?Q?ktGpK10/LxaigIiDI4hzcN8NJuacENFySIRY4vaxmG1daVmWeQgpruc66jXN?=
 =?us-ascii?Q?zg/k+ZxjCU8t1c39yHJ/CrEdpOfRY6C/g76VHIIfcXitzcIeQqOdbUY7HgPt?=
 =?us-ascii?Q?DOrpsPmLRpN+25bNeNOHwrugqJ7w5VIu0ZYLCazFCmS9hoseLVX+6pBkF+6s?=
 =?us-ascii?Q?Q1iC/0w/eD39kPT00K+/V8yXbGtZsGfj7vdRbUc1fcZj35L8QWvqtd/7G56j?=
 =?us-ascii?Q?Aqcc+UwJGNXhO+y2reqbf+moA1tjmgqID6fBQLKS47cQBlkk+IahwozTUAYV?=
 =?us-ascii?Q?BIAZ+kC8496bYZdbmDrfhy1JhAAzSTcAlsR5kAsWittUaoc0dQJ3NnjUPbWG?=
 =?us-ascii?Q?YbW+crEz2AeDdz1/VFUYzzr6GwQvBu68NuNOMbpdHXWudqf6xmXy+k8LFPRH?=
 =?us-ascii?Q?t//c6gLmh9o4uiA0tcfh3KDMCX19WpImFu7AXSchmhrJHcsSwmmLcBKYEMzI?=
 =?us-ascii?Q?VZxjNC/FjVVqHRImGYc0TSBLmkWkqW4bvs65hDUWYJhOK3X6kJrY1Br/MYYl?=
 =?us-ascii?Q?w5l0zf+bvsjuSiOYNZehTcrgLiLy61vxyTAIawEVrrdRkXtylx7zBEarqZQX?=
 =?us-ascii?Q?rdw74mvO8gsQcIPDZEOuxZywZ6oR1wMpeU9GVuGin5L1SLdeHWIj+60q9uWs?=
 =?us-ascii?Q?WAh91AoPF1t3RvaJrxpBX1KrRpXJ/HXGbc2udfEKsqtwaDxUAwrBwl3vTH0L?=
 =?us-ascii?Q?FAQJ9DNHUMzk6ErZMq7KEZv2Lhilx2/4Z2G0oQmF5tlaYgO0f0NRrWjX6Yj0?=
 =?us-ascii?Q?pVkMUBO9gyp+2TpbKwL7tof1GrQjtLREbqtfz6cdWCH1DpUKNR0523laA8qC?=
 =?us-ascii?Q?+eubrKif44BAiJ46fe43/BO9UYptGZE530w7jZAfGzLCyS98U/7hu/f3EjFT?=
 =?us-ascii?Q?KUspoEEvCTR50wztNlf78jGgIZKGw+kh1Yw80sxqjMeLswurY4gd+UrPGcJo?=
 =?us-ascii?Q?9fRwhzBJORkv3M46nlqi4z0GHev4Wt/U/orr10YRSfm8RAMWS/4mhBCNV6Q7?=
 =?us-ascii?Q?v9tDsqUhROF6kUaBOkmYofmE9vqvfB//YL4w31x1M2ozh+hcFtrWOo+Rtl3m?=
 =?us-ascii?Q?oha1BkeM7YqCU+NjiwpnZW2/oQ9L6JLaGKKUXJQJxQnvK4SOdxpE9JtjEsU3?=
 =?us-ascii?Q?ZC/rKhh+iAXPcgfVADB8b0UWnZPKksBJ+c0UWhzP4CFxQ518y/bktRgpi0UP?=
 =?us-ascii?Q?0HDl8iFNcFlThTtK28HABAtmJEI6NaeMuxvNse5uSbfGSqmZb8efQ7/8gz20?=
 =?us-ascii?Q?kz2blYTFdDMDuCAo2j1uZwI+8QQG6NILVqy3jl0x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cd11f0-82bc-427a-1b57-08dc630270e2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 19:28:51.7404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjfq4vIebLEB+YmJpNhLPq1khxyGEtGknCdg8JChqI0IE57QU8GSyadoI7duZtZRUIM7aBuxRVnPjC/tyjVxIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
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

On Fri, Apr 19, 2024 at 07:55:11PM +0530, Riana Tauro wrote:
> 
> 
> On 4/19/2024 6:29 PM, Karthik Poosa wrote:
> > Change umode of currN_label from 0644 to 0444 as write permission
> > not needed for label.
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Looks good to me
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

There's something strange with the CI runs with this patch.
I even triggered a retest, but got exactly same strange failure
on both runs.
Maybe CI was down or bad during these tests and it needs a third rerun?!

> > ---
> >   drivers/gpu/drm/xe/xe_hwmon.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index 453e601ddd5e..dca275117232 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -550,12 +550,17 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
> >   {
> >   	u32 uval;
> > +	/* hwmon sysfs attribute of current available only for package */
> > +	if (channel != CHANNEL_PKG)
> > +		return 0;
> > +
> >   	switch (attr) {
> >   	case hwmon_curr_crit:
> > -	case hwmon_curr_label:
> > -		if (channel == CHANNEL_PKG)
> >   			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> >   				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> > +	case hwmon_curr_label:
> > +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> > +				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0444;
> >   		break;
> >   	default:
> >   		return 0;
