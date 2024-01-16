Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C0EC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 17:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004510E0C5;
	Tue, 16 Jan 2024 17:06:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51B210E0C5
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705424802; x=1736960802;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iGaEBAJShhLEGHUtSAguLzUoV0hWrYGXeAhcAuD4WYA=;
 b=QeS4MpkUKBI+czXWl0VKL+oiMsezRhkaVb1U0RUoVuhspur/zLHsbpHP
 ssgzBrIkAKd8zB0bRJOdHTmCfU0e0ytBvcRI9dwkZmbNtp6P2LhukuPj2
 ZiWnzwHwN8g2XfGwvb8Abkk3pXwoEfWSHsYQIJj1x1TAsQYrLsTDbwIk4
 8mOVjKkQYDZl9YeRnBVGdQlUFU+o/b9fOcX1hysm6q0U6yl4b7mM0Ika/
 IpdPPaMCvX8jNoqF3ueghYwJbA5VYNyHQSEfGegs3uDJ8+QhRy/7BZQZO
 az8I4NlEaJ4/md2FuEeyrg/eykMpThIqtOPoc/Wr+jtyekq4nG23Z2mTJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6638916"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6638916"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:06:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="777119702"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="777119702"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 09:06:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 09:06:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 09:06:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 09:06:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 09:06:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1Du7hjqDLakKfkYhqM0wEaN51uCERQdHRpyD2iy9nNx3uZW/nhuFJ+3UrauDesBS4RdRdhdNMS0HAFu2zoM5oRLA54O6BzkcoDhed51Hy9AI1TwuOW8OsbWOELt1gakTOL9otDSJ8eCAfxw3PDpz0yOOvDIAWRBIk8rjMEfWupM9eAqlRrTaLMczFUEt85VIUWI6wjq8bT05934N5p2B9YR/aUZJgB4RLfatVI06fGwf7583bZj345BMVld3kAT94DdCnVW3C4/IZi+5ZNZP2cjLNAcoehQmaK02yUG9Oz5IGugcJBh8KqdxIB3fQBPJyvsvCjdqqgrPJV/xiyx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAqThk/YgwMCgQQoSrzNmzJU2HCJ0uErYp5cAbenPX4=;
 b=VD7drNSskuZrkrV0p5fibk/JJJr6YDKKoGauSU2PBZNqkdV3+v5+Nr7drOORGNX78VaKXcf/eQUupZWkXUTfVr1b+MLV2lMPQiniBvr2/TpI0oIwOBzC1YeixMEhymeEhBINRTixDaBGkQuXr7wV1dC0v6hbZVaTdN073jYxqaYTiJ01fZuME53OfZCkp+E/ud6T4bHn3uFoF817cRFN4mPkMivGYkcHtEwAbhZr2ivFht8Nnet2RFHCXe/Sq/hdYc0YHo0E6jJaWXOa0XRaFb/Sm6UBXmvy+vUDsOpWjqKvKiN24Df1WOBN4nvad/8Y8DHOgDeEQYmKlW5p+q/XzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 17:06:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7181.022; Tue, 16 Jan 2024
 17:06:37 +0000
Date: Tue, 16 Jan 2024 11:06:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH] drm/xe: Fix typo in vram frequency sysfs documentation
Message-ID: <zquqa5dm4le5kufpm3gvukrtfla3hfwbc7a66dmcp5xvayf4ji@jdurfd5qisjz>
References: <20240110074203.2169233-1-sujaritha.sundaresan@intel.com>
 <cyt4suev4duu5vgiwurootcxklz3jdxdtdq552ggkbwqtqdh6i@snb34eaejk7i>
 <d8bbf3ad-0c20-474d-a0d1-ba17f93bad99@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8bbf3ad-0c20-474d-a0d1-ba17f93bad99@intel.com>
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: fd80d527-25cd-4b37-ead1-08dc16b57fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lev4FXEYakjVoQqH99gr2NvyUGMQukUn8VSEdw43MA4C78/BpywCuv4VFEat7cm4iZuqgBqi8PoDq91mHXKUwEmEF8F75qWW8DVeU20gcJb2gi2wnwl1eMkoTepgo5xJqQAzoqOJ/W7LLJhNnjH7fuJJ6ZgS+nkf0BTQxNyknbhNm4dQsWP6dSb26DkO/0t0Rc+VZBjSYKt9SPIQ58YtzddRwO4JL+1o8hj/bopO7wqJUPkXrqzbfmuZ3OIloUQQuu9wOTmME8c+0iTkZL0yOrOIArICtRw68NBbzdP7qXw1kpP9xch7FGvnWn/htuPz5QkssveJT1LJoKs6B3DeUCwMZCPSh+WSF3a7sO1r+ShNVTEyHzZiz9NwIyJMRMLSOaqpAJOhKVYD/IvHRAbvWudBVRjc7Hfs14CsoKCQIZ5mZT5DVhmOD0VEdXCyDDybFAq5OLJfkUuvDyfAdLp4oFnK3e8TrcqHTBp+FjV8RWl9C9nKh1nJN2wKcJOHJKxP5XWglW3/MC/evoi4RMfXqt8joQnvUs7hX+9/oFYzAi3RWvRqdKduQUfMjWi8rs32
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(478600001)(4326008)(6862004)(5660300002)(8676002)(8936002)(316002)(66946007)(6506007)(6636002)(6666004)(6486002)(66556008)(66476007)(6512007)(9686003)(26005)(82960400001)(38100700002)(2906002)(41300700001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?94Q6aUHkpJKg94ZrHUxb0J6I8dhkTF0zzv7okg9WQELj69uQVjxL+PnX79?=
 =?iso-8859-1?Q?W7Tj34boPqGS1Ee6CHzk38eu+69xhHlNi0KQv6D6Q7RErpXtBHTCeK60Ik?=
 =?iso-8859-1?Q?6qg2Kv2NCwt5ZGlLTOlHRKOrNv267T3jtnf1gjfbUCkoylGe31Mby0YOiS?=
 =?iso-8859-1?Q?PVrp1VFnLNwRsyJcybIqgtsfQAJJvX0twt/J5R5nS3lWpA+p2r0mlXNM3z?=
 =?iso-8859-1?Q?cpzdf4bXqbkYt2U78UCmJbOu3fxLZc6KO9fl+JXEFOTSahtKmVFBvLxmeR?=
 =?iso-8859-1?Q?Py12mK6a2LDnUtO8Rwopcg7uZ+E0zaz3vJosH9u1nSk4Dy0FJREr2lhsDy?=
 =?iso-8859-1?Q?dFJfzcMNpVy10jJ0Iekc1IElsDX8suTLzGTpAkaq2B1hPassmKr382viqn?=
 =?iso-8859-1?Q?BD2eARBFMAslbssygLQRu7A3UJddjwo+e1UMnjYnJR/wieXf2qJkmW9Hzf?=
 =?iso-8859-1?Q?h6P+HneNdAYZKu5TeL5EOjgsXBLyU1qy4jEC3iNznlaQPt/apHVTF3z5iL?=
 =?iso-8859-1?Q?P9qcVyBVucBaUQaL/cmjIdBrx0OYTG+GJNwdISapfNGXF/IOEVVAYhqntE?=
 =?iso-8859-1?Q?+kZU+Xbu5wn9Gy9TUs6QngJJ5wLv3SR+CZYcpzxAfaOY1KXN8pCu4R+X9i?=
 =?iso-8859-1?Q?DR1HQfAtlPzR+wYMRoT7Ox+tKXmzHT1p7syDTM6oZFe/9ZRQoAwl6hVkUc?=
 =?iso-8859-1?Q?6sFwvAXCJUA3IG5BZVQY3FQATLEO0gjYWaOWZSMyHFpVM/47mE5BfU+KaG?=
 =?iso-8859-1?Q?MCVXfO3U2G4WYI0pYhgljXD/BuIjrVo/6ZcXZHPtUUanUy9AWLrvRLoc3Q?=
 =?iso-8859-1?Q?0eECXOhhpwLgwbFGzBfpkGkT9Mx4ANqBzdG0/uOgSmZWStHED+4vEb9WLh?=
 =?iso-8859-1?Q?CTSqVvd86gc3vNWPMHukjb/yQakILlBfvcrEbdOiEJk3BST1HpDYUqetmL?=
 =?iso-8859-1?Q?U0DOhnR4IusnYjVOMDBW2JK3Jg9ciNtDDFGDLYjj13MsKnCXtivX37zhiC?=
 =?iso-8859-1?Q?uErVF9OfemE2lcTP858gdnQBErghMlOae8ptCzBZvtMS2LkPP3Ut2yI6cI?=
 =?iso-8859-1?Q?AWrYkm44pg7qWklrHWHCNeDRsfGaWwjU9i20yCFwmZnDIpGdbDGBCe4V+j?=
 =?iso-8859-1?Q?UnnqtO4Pm0olqHVV3alksWQVGzeuC9cCXFw0cuVZYDDNCRvoMdIXxsgTlI?=
 =?iso-8859-1?Q?lA2VHuFSW+xFw0aQYkL0y+gBUChfqN3MDftphkPTE2eL6vDj4Z8hGmdJbZ?=
 =?iso-8859-1?Q?IE1BvcfczSwMPvoOu6YNie4P24S56T907KlXYtCKegx4yQEQiivYXrJJEU?=
 =?iso-8859-1?Q?JAipE9UJAfeiEVOKcjpWhb0p5Gl7NVxJJUL5kdJFbNZeYn8ijs3GBu1prH?=
 =?iso-8859-1?Q?gDkvCqX8ltJJvpYir6hXNJl+X/PeeVTyKFJ558+qWcXmlpxX8vVRelV1HD?=
 =?iso-8859-1?Q?AHGRq0YPS7cynwuuF9r/WBHYVg+RkVDdNqqCSliVAkX6L+1wQjAstr/Swq?=
 =?iso-8859-1?Q?znrzVLgKRYeeCnoqoN3+KoZ20Y6YNtlMbUzXkmSyTNoFkJo6k0Al2Q6D6d?=
 =?iso-8859-1?Q?gvtat329o3pInO2voqxteH7QodcFu0b8+X+hKaZ1lFY6kQZ75eopYCyGzs?=
 =?iso-8859-1?Q?eDdH+z7i0AZUZP3Ky4gUwDRhUrSHicEnNRQTxcfAG+v7Xr0bqiNExXFg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd80d527-25cd-4b37-ead1-08dc16b57fe6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 17:06:37.2021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4o7nSBfFPUd+j1APjvfgICWCVzZraJJPOXDVZ78H7yvXTBU6MlR68M/Bp7LrsolwnbhcJwQvEBtYehWNf6br2RrRj1PaFcUHWXhAomX/6eU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

On Tue, Jan 16, 2024 at 03:39:54PM +0530, Sujaritha Sundaresan wrote:
>
>On 1/11/2024 2:13 AM, Lucas De Marchi wrote:
>>On Wed, Jan 10, 2024 at 01:12:03PM +0530, Sujaritha Sundaresan wrote:
>>>Fix function naming and description for xe_vram_freq_sysfs_init
>>>function.
>>>
>>>Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_vram_freq.c | 2 +-
>>>1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c 
>>>b/drivers/gpu/drm/xe/xe_vram_freq.c
>>>index 733146293307..838f582e5632 100644
>>>--- a/drivers/gpu/drm/xe/xe_vram_freq.c
>>>+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>>>@@ -96,7 +96,7 @@ static void vram_freq_sysfs_fini(struct 
>>>drm_device *drm, void *arg)
>>>}
>>>
>>>/*
>>
>>should be /** to make this kernel-doc, too?
>Sure will fix this.
>>
>>>- * xe_vram_freq_init - Initialize vram frequency component
>>>+ * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
>>> * @tile: Xe Tile object
>>> *
>>> * It needs to be initialized after the main tile component is ready
>>
>>there's a trailing list after this comment that should be removed too.
>>
>>thanks
>>
>>Lucas De Marchi
>
>What's the trailing list ? Didn't get this. Could you clarify this a bit ?

sorry, s/list/line/


	/*
	 * xe_vram_freq_init - Initialize vram frequency component
	 * @tile: Xe Tile object
	 *
	 * It needs to be initialized after the main tile component is ready
	 */
this -->
	void xe_vram_freq_sysfs_init(struct xe_tile *tile)


Lucas De Marchi
