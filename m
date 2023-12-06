Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FE0C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 22:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D2010E109;
	Wed,  6 Dec 2023 22:55:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D3F10E060
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 22:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701903323; x=1733439323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q7RmUU6ZEOlcmZqRc0+FD0rx0CPUglJdNfgy/8PJ1QQ=;
 b=TauMT/ecPExb7uqCDx335srYZrb9Mw2gFKsi7rbQgfj0idoJZkjd9Caz
 iSYXbADk9Qg4XQHPosrg8bN9zvGTR+eoXvAJS1gMI+liD0+8HfYGGPKiV
 GoFcGRnYPWfXWXGiKdAHwKpMxiTQ6FQMAfqcU2PrtsrgGWYLk7euZgpAo
 6dCK/+YRc1VWba5KFcpkBQH2dOAULSHJ2IZVjgO9VgQy8d7ZZENr+Jd08
 OC0vgr1+UCYvCZ2bgSnRCVfNPPVumcWDgKLo6NMoogB3YlGbMMfA0hY1C
 SXBtyffU3M7DR/HLLcxYUNrPcu0VHxBNYXsJVuRDRg9UDpTw8wJc7Oq1Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="971733"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="971733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19477588"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 14:55:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 14:55:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 14:55:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 14:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKTTDMQ2qvQhMvOb7FrjJhHLG7/kLdrqOWzfWDeBHpegCCsl9jFz6nxNODFJf8UP6oT2zfA4/HREGh42Nzm4B5ZWyOL/e7KmF1ljmiEoAvoILNLovsPoWNfb9P702qrYtX9ERFc8R7lvAk7OqM+nHvz7g+NVsNAwdQTPeHDThd2jPvAh0C/gnBDDH2GrhCoiuFp+IZ92f7XXiEbRSWOkzddof8025WscYE+JAEVkLdmIicBAbWtmof0Yy7tzD9kqCQxO3QWaEiSpcWklsDIkcSttjo8mhh0P/+YX3iDF0d5cjNLaKRbt3D4OpP6BUuD67WDoaeacjpv8ID6Wd480rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuzCxoLLJMG1O8wkHLxKqvg+YnEnZY1tFrIgsB0Llww=;
 b=H2PuEWChFuVJoMQhAtd9yLmAnho1MEHkOU/LLaxiQxApKYxnzcPbvuTE0PPkUIep1JJ9aX/qVWwlMCcE1ApOlrcMfFJGuKLaUez5nCx3yOxo499W1/MLKAMMybc+trQ00fwQYk7A1a6n/oVYUXPs4FShdcidVKSVjn3XjvPjUYmz3ECfdyFLsVyvZWxy9lzYXY2BuZT4PjEP12UIQVw7s0SHY0jFrMty2501W4n5lvRjjie2l26GZqHM/2rt4mjTeqItYnPxa2LA5YR4Drr8pMKcfJY734QFZAnfsHWuWHgbaaemvijQCRToWvi66gGQJ8Q9la6gLSou8mabNWBEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 22:55:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 22:55:12 +0000
Date: Wed, 6 Dec 2023 16:55:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <klfcmsla75h3sxdhd6vjxsrnaej2qycu3bjizntytjyxflae7t@d7dsiab2o3e5>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
 <20231206205034.1105637-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231206205034.1105637-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d817a8-818f-4996-02b1-08dbf6ae6777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4CiqjI1ifpL0IMGuYFilX5sQBaiCH3s/hgjXnU1yTPj4FPHZPwhFgzwvD2s2n1WBFxlzuD9tGHac/2n7dFJCGD63AyJ5Ou+iSs9I5vyNzaf0KEK4EQpZKftCE4soMY3x1GT5PGKc6HgTcVN4cNqYs8vBqd55FOUiAXirn+cRReeA+039pb2gWQiepTmh0Q7n5Wc8wawsRimXAL/p2xdSR2V7oGkiDpo9Fwq9UrmeTVNc6ThwxANPf+Eii4Ijbuv1u7agCjC9HNzmXeZDLIZUN3Kx5EtJCftnXoDqL7qaQtgMmIm36nd7J+NNHPL/gFndhzCFI4/aZubfnWNQ1fuNI43aE7bOX8ad+pLiQs44p+aCBD/43QVRezw3oUWkOWGVJxPbOakrsCDPhlvbl0kVuJv1BSxOHh1cKOfGRTMglL/y2WEWM8hoc6eGz7CIJPO3tNOgqUUE5tr3s7gLfFoiypMWMjQmVwn/Sro0wyIVJZjD3P5FhfKyF8jJguIeDqgl2Y6pM5yGRWyUgRRyNZVWCVB5Z/7/nQ3DmdQm/luR9zYecm7FP8kz0v5UJL0EW+d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(33716001)(38100700002)(5660300002)(41300700001)(82960400001)(9686003)(83380400001)(6512007)(6506007)(26005)(2906002)(66556008)(6486002)(8676002)(6862004)(478600001)(4326008)(66946007)(316002)(6636002)(8936002)(86362001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MsBHvYa2axiyJYPliIxhwMm2HnyCl8aqcPdrL2PCtLpAq5pSuKvjy8196Xqo?=
 =?us-ascii?Q?YLWjKuuY2JHgnnhq6KFY6/5tvg2JqOBlp+2Wm3I3paEN1tkn96TY2iJ2ImEm?=
 =?us-ascii?Q?dgxgpjnR81Nl0z0QYzr/vABILJ0iOd0N6llVwkwLAxyiXqLH7BRXlREKlQu+?=
 =?us-ascii?Q?oaejRbEF54AClBtDGoND7hZ1MNmxYmYyJRalVrZ+7MXVu6vZx0Nj6VMwBWk3?=
 =?us-ascii?Q?1wlKsIUd22i7eEw2vlQJTPvJS7my5U+A2L7UTgZjcvTn6zRaDnjWzKzJy4HZ?=
 =?us-ascii?Q?BvDefM+alj/Vl5BGTUbJfotndywj16zop+2KKthxnRdg0NV0zt7O40eayTJq?=
 =?us-ascii?Q?py9AuMNkahNtXObulhBti5HJfwmv0iD7mrdBYl5CdVmoFM0n4FIuwvHMG27j?=
 =?us-ascii?Q?F5ecja62KETilPWljvvrv3MY296rbBzIyJpguTXh0i9vo63T3L2m0qZa8qD3?=
 =?us-ascii?Q?bU5iA/XMfD4JIVbNipqTl9g6F4JE5keC+eq8A6ZEVv3JgYaPKsZlkTGs9N07?=
 =?us-ascii?Q?x6AoHG1KCX3Frrr/zIFQtmLfboGQR7dfoLgWSIi1F678zoaqvgQuh2H3Pt2N?=
 =?us-ascii?Q?Ev8KcnqMWWaJE6JfhJu3ddY/mUz3rXqdDdMasl2nfN2eVJBvP7ilU1Iwc2vz?=
 =?us-ascii?Q?Wsm6LoeqYxB/gAFuycNHFaZvgd4ymElWeGjcwjssnndUe6AKmSecFXUEdLlg?=
 =?us-ascii?Q?eYSH2u0ZinI2Tt5LjXT2jyxOr20zIuo0iwYE5IXVNIqlnRXUa966VNxAYzGx?=
 =?us-ascii?Q?OU2Itakrhb8fI3CY5V5Qwfz83qDt2ufX5JFuAHLDfWL2cwgH1iDNd/S6iDDc?=
 =?us-ascii?Q?w30nDdm275eIvlFo82sE4WRF/4wpUqarAE6XwgGB2Ohh7klxgmYs9X2KU+06?=
 =?us-ascii?Q?pRqXWXXepQwIbjLTmrDF8J0YnpaNpwqvc9s7KlA2uOVZvQFx+bsR5vgntrcc?=
 =?us-ascii?Q?h8daZQz84eGQ5qaw13SDaX6CFJM6wtE/kAdLJhYMUuLSXRIuVxqnAuP1BAcC?=
 =?us-ascii?Q?ZT50zE5Ufp2z3g4cUludaz+lCE0Pqo5UFcLFVQVgs0if3WKTlG/rHLNtU8LY?=
 =?us-ascii?Q?5YqNejuZQFrp1Xl1YM7upnZpZQe2CXgBjpQh7Ci4dI7SYk6xmuDuW8rP9iLB?=
 =?us-ascii?Q?0bStq/dFPX+Y/2yJAE5fmlqx1yJJP++qgYC9+umrtAfF8Ms4JDoFqkZN95q7?=
 =?us-ascii?Q?6ScoBxEJPnWxZcAXMlqdp5ID9gaHGkWCvB0bYRPjORv41S7A9050C80wFAlh?=
 =?us-ascii?Q?LYh74UFDvCt9z8lpvgh7IKX8i4n8ULvlUvq+vK1G52MIZTMeM8r+ot58sy0D?=
 =?us-ascii?Q?jiZXkKkiGRB/KjnYdxdUm/PHDpQlhK8OwoHlADnQy6Es2y418wLCpUNJ1wnW?=
 =?us-ascii?Q?HBQrMqGdoD8Uued4hg6/o0rL+gehwUa2HHSX6ogmS7Xxd/PRUnnjN+qqDxZj?=
 =?us-ascii?Q?MqPCezbGJrXE+1Yt2M5LJ+mlIU9Q1gsnxsx2f9lo8NPs0VrqIonXHCdQvqtB?=
 =?us-ascii?Q?IAPFTdWjsNa5Dz0slJDSJj/bSnyKQzDWfrErtUz3BN4dGGe6rCO7Nx4ke3d0?=
 =?us-ascii?Q?4NE2j2dsGHp0bNq8lXdbz6JkcD4YPVfGrNbcHPBv8LF84HdslqK6rKPvDwcE?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d817a8-818f-4996-02b1-08dbf6ae6777
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 22:55:12.6249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMJDFelAZSDRd4NXVPKN4uZMrHxFJ71XPb+i4xP3x/BfCn0LHYKcK/Sm/RMjvonVvqaNNX//NHSgDhTCuEdoWjTR5iMR0xOnHAXtMMuZjl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Stash GMD_ID value in xe_gt
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

On Wed, Dec 06, 2023 at 12:50:36PM -0800, Matt Roper wrote:
>Although we've stored the major and minor versions for graphics/media in
>xe_device, it will be simpler to implement the uapi version query if we
>also stash the raw register value in the GT itself.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
> drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
> 2 files changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 154d6c7072b9..c6f7885ffdc0 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -381,6 +381,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> 	/* Initialize CCS mode sysfs after early initialization of HW engines */
> 	xe_gt_ccs_mode_sysfs_init(gt);
>
>+	/*
>+	 * Stash hardware-reported version.  Since this register does not exist
>+	 * on pre-MTL platforms, reading it there will (correctly) return 0.
>+	 */
>+	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);

I was coincidentally reading the PICA_DEVICE_ID for a debug (that we
currently don't read) and stumbled upon this.

I'm wondering what's the correct place to read and save the GMDIDs. We
already read it on xe_pci.c:handle_gmdid(). Why don't we simply stash it
there? With the current design, it doesn't seem we allow 2 GTs with
different graphics / media version since it still on the xe side
initialization.

So, why don't we just stash it on xe rather than GT?

Lucas De Marchi

>+
> 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> 	XE_WARN_ON(err);
> 	xe_device_mem_access_put(gt_to_xe(gt));
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 4e48c4643163..4e7a4494a554 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -117,6 +117,8 @@ struct xe_gt {
> 		 * hwconfig blob.
> 		 */
> 		u64 __engine_mask;
>+		/** @gmdid: raw GMD_ID value from hardware */
>+		u32 gmdid;
> 	} info;
>
> 	/**
>-- 
>2.43.0
>
