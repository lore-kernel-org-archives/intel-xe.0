Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABB0C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287AA1133CA;
	Tue, 30 Jan 2024 17:34:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF131133CA
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706636049; x=1738172049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AgED5PM/dyK0z6OhFebEe+VU+Eb/Tl5ZdvQEa6I4TnQ=;
 b=lvyjpTzdRwprv2W7nq0pWiP4ffZxnN9CiLxjEDhIU4RIBmosKHG07lC+
 0BCz6gsbQi9GY6a22YKyYd0dxla4u8Fz76++x194HuME9JuWNwnAZm7jA
 sqUVm5rqcJXPQibSLQfw8BN6GKEbl1byx0OU4XrLuPFiVhyT3cTReEMwb
 z2U1uGu+6fbWvOnqSiyVnBPZJPCXckPKk//iP9JbQKPrH46Oca3n569Ey
 lK1VDLaGc7UcA87rF8s0z1vD4pUgqovCxWYfXc1lJLGeIohox2B0NP6Qq
 J2lyDVOkOAkbF0zMJ5tD7O0TmJqoK6crf6mHv1teZN54sYX1/bCV/vOSn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="24828678"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="24828678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="29968768"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:34:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:34:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:34:07 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:34:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz8dJSV4/7myVtwGBlAPfBPRMrLFxKERMVvvw0aCbIlriaKgW3UHe0xyLRTpjOWJTS+SImL0EFnnts7NeRrf470lGSOX/ZLs6+QVbOGNDjks1yi0x0dAXajB59EMb3o2eS6B0sh3qMYOgzNQ3AOoTyGG52omxTBHoqcC7NRzETBYc55815BpxlzPa2qUJYR4iH8dCsAo6+8TQEgVSAkUM0Ixh9U7VjExgrfA4H4mXGnIyqGvfpcZ2RS0aZrUJAv25Ar7+7z88Z+KAgYpqquuPaaP9OrQb3rf8xwNkDdVQv4WuyP2Ku4mJbDHGgy2Ge0Vd5yxeuIlanfrnN3tNrInKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgEi7R17naczTWTUIVg6UzFNBgpHafPWU6hglCHlN3g=;
 b=HermYkCiZ9upHl3YaP/4uYTGGKpq6JX2MY85kpQbJzECFa6FNOuTgCyF9ELDnIT4gPhslAWxDCXmKLoEGm4UGLJImJCpRZV71cOxFozmXxIF/Vu3Ie2aoNkBPrI9cmMhMIusBnt4d+M+3rqLNR0d7JV1i14Jvq02UomLRK+61BtaUo38gflj5btJBbyLn3pPugY8OiiLhADUCBL15ICl7DAi+r9br7yDVmmA9rNuUx0ywoMFwgjpLO/UhbhvaVC7FFKrtwDThXJxSn7yzlUvF8akHFjhP1ZnsBQBhqsQeHsqeIqPF5KGwNV4jjLy6WuXVNa+nuIB+F9tJv+4tyU/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 30 Jan
 2024 17:34:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 17:34:05 +0000
Date: Tue, 30 Jan 2024 17:33:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/query: zero the engine info
Message-ID: <Zbky9x45K5h18tVB@DUT025-TGLU.fm.intel.com>
References: <20240130155122.12138-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240130155122.12138-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 16aef6dd-91de-4546-3da5-08dc21b9a80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOGdFZVGJUrCrM8nmHjR7Qf4NxrNeezwS8C7K5g3dkrwgfJRZyglhJBSOXrZYYFyM44CsSdqHicd/kP5XI0zLzIRGvjjswzPoWoiDf3VCp7q8RmDxhuYR2Z6XG3rFZP+sssTX3iB0Hvi/gdnmfhU+z24XLCHJMIK++y8HyOKbOdln4ThkukaQC6fgpPDbxiJ7FBSinpaKkvXwPdPzSx4XmqwQX82sz+kdqlVnEvYCBBYJAqhPx7XQ2V42g2mGzjIc4NDp7/rmQeHZTfY83U8Kgi23HRpq4Wtq593KOK4bqawgL9st5cPYrgUOC/BuqBS8/ZxLjoYg5V+1lYv5zybqvKPkgqmnExH9ZbUzsyLot/J8gX2rGAuAbEG8O5Zj18SblgUKR4A8f3+m2BGwjseWGYXCTLTlX6kHt1EjMX63B7aJEBShdk7A8MoVfi9RNDFvMzKIOTOCsXCEsIBJGZ4iMJ/1y3G/QT5jrXH5+FafNEnWnR7/UBQt4WD9ldmKQYRIdSjuMHPkT43U5HR7w9+3B4mDvHIXda1rWn+0AzqcOrX50VxYbb43GnkOOXypr91
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(41300700001)(6512007)(6666004)(26005)(82960400001)(83380400001)(5660300002)(38100700002)(86362001)(2906002)(44832011)(66476007)(6486002)(478600001)(66556008)(66946007)(316002)(6636002)(6862004)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l5AJO7uLwJOT76JmtjDv82m+9+CW88OxYKHKBD8S4MnbC6HQUerA0+ORQalE?=
 =?us-ascii?Q?iOYaewnc6DIZk7D7AaJY3Ce2K7koPiDFM+jUoPoOIi7NeWWe789puvyOKtbW?=
 =?us-ascii?Q?CegUeICyuQQmWRA/Ky3DUU+xKwT96hQqbL/ydMFpqw45jFBBkAFVN9TBQaYv?=
 =?us-ascii?Q?9sl4YohRbuLsLOljr7ybWOsGWI7cII+kbh9Qdpi14qdQco4AZosznF2PFjal?=
 =?us-ascii?Q?TO0/Ft+i+CP4/AAZGmKSCC2zpX6tUViC4bNJGHkSruOfgRvVobKlMY/1+mFh?=
 =?us-ascii?Q?TuisaDSSIqMDRonwC4RHqCb5M5/pwYQINn5laRmLfjLYu8RHoV9YbyWVL8JU?=
 =?us-ascii?Q?7saGHswUR91dJwvQOCh6+PBms+EN5696dwVOp1rbXokfCxPh2dbuJK2C3c4D?=
 =?us-ascii?Q?v+WSu5fMxYu5zHLCsKDTDDO50r8Vs29BKPSzfBdk4L2xaFlbm2cy2GTOEzO/?=
 =?us-ascii?Q?SMrMMfhucoPIGkbW8JlvN0pO+pSz8XIg2MyflxdcY2AjYTWQ9EhCCozSk37B?=
 =?us-ascii?Q?PeJq+xgK9u+vJ9fnN3GkKPldDzEAnfMGRoIUUbxL/MM6E9FMgIqvTbNHWqUX?=
 =?us-ascii?Q?Au7lgvoe1XTxutEqtAPoCTymlZnBoazQYD7w3OJkfKZrvBvVpw4kYozjFnnr?=
 =?us-ascii?Q?xdjCwlHbRKhk4WX6Gzqmn3vWtQVC70rgC4gQYc2YCnMXonWd5Y52HOv5wi+V?=
 =?us-ascii?Q?KpcVSEpLrMygrgxYHWI0cJjk/si5Sz9I5lbI7xrutfo/sVbbJy/PRI2HFmrv?=
 =?us-ascii?Q?7pXmZ/IXyJJ5GMmjBNNsnCqROPCJ58TOTl/CJDNjNfQg9C3h823W0kdksycS?=
 =?us-ascii?Q?Y62LmfYznv2IopOrPQlJMnaELrhIEcgVAR+5OFD7fx/8HEd475gKA60w0RE+?=
 =?us-ascii?Q?ifcAEKKV8VUZ9lHfDTRm4awFhxWwCUCBLI3CrZ79jB5aWeWZfNDnmObw18cg?=
 =?us-ascii?Q?Mo32tvsyoCFggIimvOH+YmDTY4hxo6x3YQJ0ZXF06e6hn8no2AsC92drjT9t?=
 =?us-ascii?Q?i0oQOjvCTyjS8EdxQ1GO+G1bIXtJfYCNX7Fspl91wzoval+Br7RaVrtZVz6R?=
 =?us-ascii?Q?jStf40mLR3LGtRHplvv1Tp7YgYOf1OuTI5di2A57y5CzVy3mAYjKtX4y9pjS?=
 =?us-ascii?Q?W6xutNqE9j8Zaaq+yCpiJHmnenXZnJve3BqXQdKYqOEROl0ogjH4IumfLsVR?=
 =?us-ascii?Q?pBUDrlAACKNPjWEjjM9mqOE3/8cq6CYbbBaePilNS+Q+wR+jptQxen5DFlaR?=
 =?us-ascii?Q?ICi9/1MDPY/y5OX7Z6Afh35HD+iBMScCnRl7mcuNGH6tZoQ0G2qa2qTm0zlU?=
 =?us-ascii?Q?/qQ+n0ALotWUOdE802/JMIAFo+Zj+4bs3NNI2nvkjAq9DnEwsq/LXOWYiutq?=
 =?us-ascii?Q?YBdgfLNhEIZUKjK7PT3KBWX+G8i6ZXlZKMSeoPP1939OE6PgTNh3gZv5CCkh?=
 =?us-ascii?Q?Ci/guOooXEDWXKKweR6tQg5hcPJzb9kGlxlXV52+qDfk9tqbgwTExy+QhnmV?=
 =?us-ascii?Q?du1Xv5q7e2/y9C9xQm8VPi7BSvIdZssndF2WE1YP5tkeCb63WctTgruxneqz?=
 =?us-ascii?Q?F7sq50BxZnLamzeUVc2ZpDrUB/Du+x4REZ67ItBAkl41yDSsW3J6aPlNVag4?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16aef6dd-91de-4546-3da5-08dc21b9a80f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:34:05.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah+KUD4//kFYNPUt9R/KOI70JHoRYKJmTFdE+0+M7HOLk76WhhNfSL9miuSC/dWA/VAZl4CogU/p3WUtOdajAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 04:51:22PM +0100, Nirmoy Das wrote:
> Use kzalloc like other routines for better consistency.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Maybe s/zero the engine info/Use kzalloc for drm_xe_query_engines

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 9b35673b286c..02a4e2c083e4 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -198,7 +198,7 @@ static int query_engines(struct xe_device *xe,
>  		return -EINVAL;
>  	}
>  
> -	engines = kmalloc(size, GFP_KERNEL);
> +	engines = kzalloc(size, GFP_KERNEL);
>  	if (!engines)
>  		return -ENOMEM;
>  
> @@ -212,14 +212,10 @@ static int query_engines(struct xe_device *xe,
>  			engines->engines[i].instance.engine_instance =
>  				hwe->logical_instance;
>  			engines->engines[i].instance.gt_id = gt->info.id;
> -			engines->engines[i].instance.pad = 0;
> -			memset(engines->engines[i].reserved, 0,
> -			       sizeof(engines->engines[i].reserved));
>  
>  			i++;
>  		}
>  
> -	engines->pad = 0;
>  	engines->num_engines = i;
>  
>  	if (copy_to_user(query_ptr, engines, size)) {
> -- 
> 2.42.0
> 
