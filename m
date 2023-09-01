Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951A0CA0FF6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 20:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6030C10E08D;
	Fri,  1 Sep 2023 20:18:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E7510E08D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 20:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693599511; x=1725135511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2nuNYd4sLKl4hFyQMIGJDlUGEANQPpedMBuA9Vzd2co=;
 b=Vcq4JM2geeAqf2Ot+ofhUp1cepvaJoyn8YqYOk/Jy24Ew58de4H0zfSS
 kdAREfOAqUuO/zsvvPXOdHcmRvoiCp+IB53AtgbtvKz7+A2p5rZU38Gjn
 5eY955Uj9jWah44WhzgAweQeHrhdWnGCNrxXBwsiIIqKy+8K8MWvTboEV
 EFgVmUlPENG5bnCY9zqO1Uw/Nngx2MoVEgPLdOJVLA7ZXovpQkimR+sNs
 DWFqQBAK/5zQxk4T67IlLIHAXG4mAwUccwN07IRzrQ1LQD3avBETKKj18
 HWisUE8HaLSEf1r6yZOKQJpngFJ7XI/6aCb0JQT0AEAXbdGe+S8vZyWdY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407296366"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="407296366"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 13:18:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="743240307"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="743240307"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 13:18:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 13:18:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 13:18:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 13:18:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 13:18:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fX12/4Bv+i7JBqOM569Iy+cDsrVweJF0NsqxQqTLAWD9ftVgURVv5nAIu5utul1GDZ64JPPaHlSBXvy4x29L17mvqXW6MMmWilvgDeFt4ouqDwJSIAYz/voD9V6trQuhgsc8MxQF6ndB+es3abP4y7T+H0NZwpUywPI1rMvIFBFKxNKw9/NwO0qaYc/Q8sHs+3BwNXXMMcXMeQiubLaQYitxW88uhQQDpu3WIzHQcMsgyRCrtXtf39ILrwwmFvq0YkJwNZ9NokpZsCCntqSBH4MceRHIq8AtHmFmBIIGShVYTbn1NFkFr5NcdTxaVQilE4H7hfYE+8OPq2wJtLCyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjVu7RJqmbFIgx04LWSlDzhP226XXfBUKwyTB32+FNk=;
 b=MDK3yhJn4Db/zbtqLnRreX4cyQZCYT/NCxFgGkjCTpotdpSehIamrrwbFapj7knyyZzv6giRuJsJxqxKZUIL2T5q0rlVvr5cC886CjNPddMg9np2lRxqn58IP9rPFsIr4iR1pu015siDJ5AwzIM4nbABM28mBuogmznbhHPPU1f6FE3pMaarrItwnvu+4yLr7HvKW+ijgCZDDvT1yVRULPQnO7Zbfa5wbEk/nD2y/YXm9ZbWza7wMrYwx4Hm4e/E2yeX4I4T6A6AFw6PtWIZPQtooOidNE1LvdaCJZwgOANt+t/oL9b/Egmlql29wFOIg2YoyI4yHo+cw91IoTpwtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 20:18:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 20:18:25 +0000
Date: Fri, 1 Sep 2023 16:18:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPJHDPFObO5wMzTX@intel.com>
References: <20230901160300.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230901160300.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: e98a5a79-86c1-4ed8-4c7b-08dbab28988a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPHV7z9nzHD1UOuhyQWddK3kW/kZm+XIDRpQns6dgkEE5ApdDmsBAeCGZaBX1lGISacuGHrFeHmsAQ2phgLa1V/GTywbkv3e1rywZ1enYq+ssSoXLLg1+MElnhfLbfLJavEeGzqiaKYtEkpHwL90VmqJG5wTTelQ1G6UMz6/dy1tfwk39q0HrnIeheuU3hzlJuv+nDpi+K6sBjY/iV7rBenJUmN7bg8u5v8oERlZkzaAyr50Ct9jKuSpG4PlHuVwB4kT4N5vIfYs347d0aNhw8B8ueAImxLFK0b429B/kffQmy6k0Rfo6ZNp7uFOb/LwyNQCnl4PdoeCbRI0scXB7dcP8V5zww7rGx58zzBwHeRNUcCsTXvK8btTC29sMLKiOvoHM4VJvRIGRSiqiRfI8GBuzjoq1uGKBBSBN6lqH6H5/zqdmclXWDcH9Q9VuDbfgszEfna+8Q5y2YCO6MOHYbTDtXNUVisPEzdvXtHlQeGiBgUXbUJPsnx1Sj6KjM6d66G+PV5izL+aF078g+G0v4PGYA48W6hPEmv6pHj9c2DyndVJMVOfv5BoxJhN/Zx8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(36756003)(478600001)(38100700002)(4326008)(44832011)(6512007)(86362001)(41300700001)(2616005)(8936002)(5660300002)(6862004)(8676002)(6666004)(26005)(6506007)(6486002)(83380400001)(2906002)(316002)(66476007)(82960400001)(6636002)(37006003)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ogFU9Angur+u8JN4n1dw2WiTvpR9Tc7oMDYLr49lCl7fVJ4Z9pzTMYwCGVW?=
 =?us-ascii?Q?GDwlBJEzDm1FfMPm2Uk1FQx5a8/UjIG42PUyILtp2C3fQMNWSBkMIv/hc0q3?=
 =?us-ascii?Q?nXCigRFm47kbRsa8FLuDUo0JDlIIqN7TQ+g9WrkufeKXjfcCa4TIJe4FL9mX?=
 =?us-ascii?Q?9PbXFGzJwP6OqeXFIhQbMtkM9Jwlm86GUYPY4d0cY/hVUGCLlgpf7NzCSYKb?=
 =?us-ascii?Q?QyFdBxkfN1h6RzpsI6IW6QAXOtYxVL42eUeB87OvXvBK63Zsgu7XQAsCLOLH?=
 =?us-ascii?Q?9yhR+7NJ+llRJglp8SkEr5nl1PvjKs/n5Bl4yb8VESSAxlw3JWDAZsueYdJJ?=
 =?us-ascii?Q?R4B4lPAgdfuEo3DAJCw0t8C9OUFo//glmFWM/kWNTYzqCrGgf0Y8Jn1YhavK?=
 =?us-ascii?Q?l9anQ4OUP8S13CV0WHS8QEXx1Csi72KOGZ8n9/davgwQW1Y/lYz6YjF5SM+0?=
 =?us-ascii?Q?xbMMcnrj5yrcfxDoumBZ+sryHmR9tQ4zCHOeb21gdH8MimDqbuAWR6fRVMAh?=
 =?us-ascii?Q?Xp/BZ2pGXn/KkjJdOLMhHuf/k9oYgDaHnL83Ja64VKpCAeYTYVZmrXZcCyd0?=
 =?us-ascii?Q?umzkriYK+08FPFXRySEM3arRcRhxSY2kinzPPToREXdPH8scBA1wzM7iVPz3?=
 =?us-ascii?Q?sJxuwcoSIlmCJDES4SwaLVozPIvgTJ9HWHanJ4QKcLYibwvHVDcnVvPHap65?=
 =?us-ascii?Q?Wx75R9wLUh6oGKLwNfee5NUWK/2kv+tftOyPlEVFwONpUiD7BVXWShzDL4Ev?=
 =?us-ascii?Q?0Jx3CMRJ4mkxjgUPL5jX3oPZSNAEE6KFdPrAcCKBwpfWyv7BvzYRBD0bzuej?=
 =?us-ascii?Q?pe+u8KE0yzvkndSUZ4IwxexZgbd50mKtlLWvGehOlL/dkIWMwcuc64ixZ1ao?=
 =?us-ascii?Q?yRTOc+kRRd+kR3ATKgh83sKn71b9OBsP5vtOLPSvKcRQ82PJuAbmwtOjkR6G?=
 =?us-ascii?Q?MyQyjhlb/NMZZzSEYTNQCaDmNZkk9kmuCnGp2ppWk94oPsW2mmDzEwhRVoco?=
 =?us-ascii?Q?+5z3f4ihbZRLEd+kGZZoouYo74aEgNdHjFsN9vtnmeH8L7HtecmK4ug6O86+?=
 =?us-ascii?Q?RkLnWnvPFtjAhh8HdLD29gUMD2MI+ES831Gt4t13PglcTRnwePWOAZYIgvZb?=
 =?us-ascii?Q?Armv5nsjSO+UFH+jPRjsHaaLIpiK323Iwkb1Qd2hmclLgPXHP/DC5qYC/KjW?=
 =?us-ascii?Q?h1/0U+r/pLmRTLIzYLXcyE1gJQdOw8FvRIXBOgMOa+hXQ3OCWBlkuuAefaSP?=
 =?us-ascii?Q?PstK5mxS5nphE3WEz7S1w6MyD7VfEqPv7jyI5Mpcl+O04q15OxD0Etcu4MQw?=
 =?us-ascii?Q?P8K7w9db3Ylu3Dxb15xBNPBFaM1bOFSJZ14DG/jr6Ehcv+2Lhh3/HwPvvVFt?=
 =?us-ascii?Q?ZOmP2Umk8Prx4mOwGP76UQ3O9fOMD4/IojjH5vfO7VtzW7WTyZcTg+o1h1qz?=
 =?us-ascii?Q?iufl3ap28v+HTJ8sJVqswnk8mR/sOAO2esqMnROiE7/6yqFDZ/ugU/G09CzX?=
 =?us-ascii?Q?Yqps5moOt/RnIU1PgL1AUvdli+CPKL7mLVzmYyEGlpy1q/rzEnG54bKtfdzq?=
 =?us-ascii?Q?XzcTRxBvG/3xJboqGbhO/a9C7T3x0q1hsa4SKZol?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e98a5a79-86c1-4ed8-4c7b-08dbab28988a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 20:18:25.2675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hs005uYzRsiWnbVCKw4dF9X2MADLxhGJ89lO4Yyd/07eKtvcxG9ANWKjLuc952bhyKKP7U6snoSaa+GE82P7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Use acpi_target_system_state
 only if ACPI_SLEEP is enabled
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

On Fri, Sep 01, 2023 at 04:03:00PM +0000, Francois Dugast wrote:
> This fixes the build when ACPI_SLEEP is disabled.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index b6b547c4877c..54f52b6d702d 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -331,7 +331,12 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
> -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +	bool s2idle;
> +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> +	s2idle = acpi_target_system_state() < ACPI_STATE_S3;

what about:

s2idle = IS_ENABLED(CONFIG_ACPI_SLEEP) ?
         acpi_target_system_state() < ACPI_STATE_S3 : true;

?

> +#else
> +	s2idle = true;
> +#endif
>  	if (!xe->info.enable_display)
>  		return;
>  
> @@ -360,7 +365,12 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
>  {
> -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +	bool s2idle;
> +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> +	s2idle = acpi_target_system_state() < ACPI_STATE_S3;

since there's duplication maybe even add to a static function?

> +#else
> +	s2idle = true;
> +#endif
>  	if (!xe->info.enable_display)
>  		return;
>  
> -- 
> 2.34.1
> 
