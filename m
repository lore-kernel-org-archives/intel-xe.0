Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDDAC2FC09
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627DE10E021;
	Wed, 20 Sep 2023 21:51:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179710E021
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695246670; x=1726782670;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gTEjMsCi0lLhQ3LYi8om10S8417CoS7zEsZFzkoBrKQ=;
 b=cRWjJIdJSZNmjpCEHt3FK+s86VCS0eeuxXgaa8RBFFuz4M3RX6rHQp6Y
 gZ7Nq08BcswO9Xj798MdModUhV4xlBbiTBiUlY3JW/7nEJvPtjxwPL2E/
 resuTKcITNEkxt0Lpo3v7kicW8aPvjYIKbZ5e6PmlOY3S0X1dm2jIHbDM
 HRp0ZcQO5CTQBjYZ2Shhy5uUj+29L3VIoCGYrnR5upIK9piUiEstK08sh
 lHT264rXu6atQDTdAWiwYS3Vc+v2yOqWnDm4gJUztuNgcO5bTTSZeAykv
 4fza0rVCWALOOSsy1tpk8hTVuAxg/TzWBKwJjT3zjUWE+qgPkuaRUOGJB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="446816171"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="446816171"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862168264"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="862168264"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 14:51:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 14:51:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 14:51:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 14:51:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 14:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enngyQgkaqWjyEu71+8ujJ6aYxEt0Y4VFzLJytZvRcCja7CHdEHr3hvw/HssOSf96+Ox2QcF+GtSM9ORo/PcHh4BySMOnXXsB7j7A5kaRuza1OImNCkVtLZr2grzYbgNdf3ZHT7V8yXFUlL//7CBdqeghncB7Sn1iu77/Zia26DhMSqrbqCjSrupVWuKAyfiKWq9bjT24IQl2MnLUxpgTtR26oqJT7aaoEqRttIm3Ff0DD8lDmP+wvM1eVhFPddjqaD7yl1Wt3ULw7ZnPqC2UTz7hxzH7V+lIm99i01wSYqLw6W1XVFOznanMR3fMZTfgsptWBFVdxALFUEIRNSMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYTlSKoeHXYBCZKWlceUtkw94YBQ7M8XRCvogUuGInU=;
 b=G0tlFJrAla0arK/+iUtc/6j2pZ0rHm/ma4OR4kXU9plYEnxBQcjUfhckpYtgRgyIuzJQOEFZH7oLS5K60kWNSyTS1yO3CXhJqEq4+OB65M3k7rmQJhVIxsD/HNVKoLBhpYrcQgEoyPK+it8381odn2s/wnrscdZe2yD7UjoTmkBXlI5JUp+ZH0HvXKoO9ftcdiXiNpZjcguIcTW4g+xuy6PP/AG4oqYSL4gwJHrMM+HsaUjurcE5SuiwHQgyRBNXo/6FSo/V8jZzVCmnIkQ8vwImfbhCCWIhXdABfurM/53kDXwk4xAnce5KbsZymAMz17CQwi8N3FTKOOVEQLQiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 21:50:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 20 Sep 2023
 21:50:59 +0000
Date: Wed, 20 Sep 2023 14:50:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230920215055.GK233750@mdroper-desk1.amr.corp.intel.com>
References: <20230920212103.2145677-1-lucas.demarchi@intel.com>
 <20230920212103.2145677-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230920212103.2145677-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb00531-d25f-43c9-1a4a-08dbba23acb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBWu2d/Gv+2FJu5Ly+f10FCx8aVwM46q0K80HKB7zaEG8Q/SI1uBiTCO90qZClEUHiy1VgjljMFils/D2dRjNBn36jcrYV7tnWEk8pjFtNGGul4TM2TIXWsA1/GaNVbI6cNOicW+LBSjJM4db4dC0rGAyyYKzdIAlaPCbETwGLXwClb7bwePqDhZeR9KnM7dYHePd8lMsVsFFwqBMLiZkG3Urw5FsYj9z6YXfGrZnqo/ANNNGQt4+S0wYXZAtLnc3UE9YdcX2U9f8f97MaQsI0fbt1x3Xoo5MfjlZdqYlRSguwBfXL+CtDJBa6lv9wiw8leigwrLLtiEM73pk6P74tzs3LwyQW0AcWwnxCkFHUCXTD1UDDR3su1uPpmlYatik44ZELIcpuB/7vSR1GyCRGl30mZO2KryACxaML5S+K16L5qJbhd3+MhctXwZdra6luvPxBub8w03fsYQs0odS8XpTXplzH5RAFFwcHd83jYJeNhJxbqNQ8MvtiQywReWlamZwX98kRNwmoH1LTW+Z0vt8NUt634dUklO+xlGC9Goz1LDE6ztSmzuI3OeqVml
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(1800799009)(451199024)(186009)(107886003)(2906002)(6636002)(5660300002)(83380400001)(41300700001)(316002)(66476007)(66556008)(8936002)(8676002)(4326008)(66946007)(6862004)(33656002)(86362001)(6486002)(6512007)(6506007)(26005)(82960400001)(38100700002)(1076003)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0M0/cuZp8BAv3tdb75N0vHxTJq9t5Tsu/4hBkoj/5PVU5ydwK6FcvezK+Avp?=
 =?us-ascii?Q?CvHSvAG/sVj9Xo/+oETS+HT2W4dJdAjd+/mXd30o9lhUlqkHhESuYADJ3YaE?=
 =?us-ascii?Q?9L+eai7sn/cVWNheefettRzE1N7V4SOGzDFNzy5SUgVk/zv6N/X3Jqnq3DZR?=
 =?us-ascii?Q?UjhgOXEPq2RFXjrKuME5LXiMPH7QmN2tG3+opvjQlH1xaJbd8N7vDsbQyxjS?=
 =?us-ascii?Q?olrI/jzRrBxsA5SF5i8CLqGoVIMSJA5vAjjhSdf8pINQfhVs8B4wjnWrW9kW?=
 =?us-ascii?Q?HzzNNSRbJl1iIiWa8kmE6y1AMSTySSpIw4gqVLar1UTyk+gT6XmL/5mg4v5j?=
 =?us-ascii?Q?aQ3+u0332upAFxMbV3HcU3mJFBlOYxp51yVWV7GUj0mCksQBka2KIiuD/Wij?=
 =?us-ascii?Q?39r1SEhCcmQWFPW1ODNmo/QcILhvA3SJrkTfKxxmtFoXHKAoH1Z3d5GItzpa?=
 =?us-ascii?Q?rXS0m105fYKTFvAGHcLNL0SUWXXwFb3Wl46vUQXMTzyz4Hnhvntv/XjdcVw8?=
 =?us-ascii?Q?+x+sYO5gpW5SUcpi94fwkItNs5FjA5O3rXiIcXbURvju9KXahqi1vVlGNw7O?=
 =?us-ascii?Q?yzdGJOL0iLqMGbEqEUJI1Xx96IHghe1ce6NclJj0aOBXQWsE5f3PbBWjVvIp?=
 =?us-ascii?Q?z9BPqQh5creSlRsFC3mq2id1gB/lcqnrYUGNYd7eG2vHcB+BFlflAK2OlDuR?=
 =?us-ascii?Q?SP/UWEUrWDdsUC+8wgSHQjRGm1x41fRyeG91DGTkVKBYkT9kU2NyFHQ69qrh?=
 =?us-ascii?Q?DFPZRXOCOFtGU26+vp3UZiWsPleqVt8Diz3I9Ag+4MUwPM5qAUWDllyjjkq8?=
 =?us-ascii?Q?9CCCAgi8b1h12xdt0zoRCZdHkoQH0oJnb6frTfBb+BYxlclwJLZMwC2uBOYd?=
 =?us-ascii?Q?mljmXEnwvvliqV/t4LJtUjX6jhRHx7crBXHMMMK3AI7CQ37knw3ipuR4Bnxm?=
 =?us-ascii?Q?MbjNSToERS9yjuofIFEY5AdrnBS+nQqIi/VedWvA+GScTo/oEMscbfab4ftV?=
 =?us-ascii?Q?A4m1+92KZM73mVok6uF2XvhS+dzTK4Wyv9IGX3/HTEtpUfUJjgl2uNOsFCWX?=
 =?us-ascii?Q?SgYtibx15XrentEbNoXDNWnotDimvPYRiF+tw0jv+b4OL2z8uV6tBeKCM9sL?=
 =?us-ascii?Q?FHlk9atEDJrhjjjKYap9hVN6MwxKn07UWeyONWyUTN/90QEEO8RfeMYbK1Hd?=
 =?us-ascii?Q?uvQC9insTcImd1X6H56mGdrCZWoSz6cdQi8P+YtJk85pbUwIeJ7bLsSBQTuD?=
 =?us-ascii?Q?YM22JmPYlzaGju6xfg2//PpaVaWmVcDn217NE7zJvPS5VsDbcpxrbOvzkxfl?=
 =?us-ascii?Q?+eyEMrIr9cuaMijQNVX13ab5dvou4ucspkYmjvc1e0AndjvISAffMRuMq42H?=
 =?us-ascii?Q?+KBSkKL/SXliTGtaX4bBtgo39L5X9mToYjEf+0DWKoqEmef1/n0D6CcJlzkd?=
 =?us-ascii?Q?6zmHHpr9imfABXAPLzOk2E6CtGxrELZCDP8KFsNFveJa0MmPRN899VQZPR+6?=
 =?us-ascii?Q?9maNz+Olajg9bJJ9eTuOZEfSpMgmIXDBJw+TDAZ4VoKsnHh/LkD93YEXXkfn?=
 =?us-ascii?Q?kVE9hsoyesnEhdc/oxNI0RxrW53uNF5Nhp4MqARNnIL0aLh04cpVdU/aulX6?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb00531-d25f-43c9-1a4a-08dbba23acb6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 21:50:58.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m23rn8zTVJFc34WE7yECSRYnt0txYatK7ACBtMZhgXahu/B8ziN0S9z6ob7/MlCZFQwa7mLCoupjshlmxGBZqvmkWjPAqxRXPH6Bqi7EYHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/xe2: Report number of Xe2 EUs
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

On Wed, Sep 20, 2023 at 02:21:03PM -0700, Lucas De Marchi wrote:
> With Xe2, one bit in the fuse enables one Xe2 EU.  Note that although
> Bspec 62564 still refers to 1 bit == a pair of EUs, this is about the
> legacy number according to Bspec 70820.

+Cc Jose.

Looking at the bspec history it doesn't appear there's any true hardware
change here; this is just a terminology change that someone thought
would make the bspec more clear (so they added "legacy" to the true
hardware count to distinguish it from the fuse register, and then later
came back and added a separate "Num EU" column that matches fuse
register).  And it seems that this attempted terminology change wasn't
even handled consistently across various platforms.  The equivalent
bspec pages for most other platforms are still giving only the "legacy"
numbers, either with or without the "legacy" label in the text.

But regardless of which terminology is actually more/less confusing on
that bspec page, what really matters is what our userspace partners
want.  If we want to change the uapi from reporting the true hardware
value to reporting the fusing number, we should coordinate that
behavioral change with them.  And if they're trying to access
hardware-level ("legacy") EUs independently anywhere and can't just
operate on pairs, then such a change may not be possible.


Matt

> 
> Bspec: 70820, 70821, 62564
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 011ad7f2325c..878f3ed7bc26 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -49,8 +49,8 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	if (GRAPHICS_VERx100(xe) < 1250)
>  		reg_val = ~reg_val & XELP_EU_MASK;
>  
> -	/* On PVC, one bit = one EU */
> -	if (GRAPHICS_VERx100(xe) == 1260) {
> +	if (GRAPHICS_VERx100(xe) >= 2000 || GRAPHICS_VERx100(xe) == 1260) {
> +		/* One bit == one EU */
>  		val = reg_val;
>  	} else {
>  		/* All other platforms, one bit = 2 EU */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
