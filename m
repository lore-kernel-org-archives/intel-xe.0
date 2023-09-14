Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8321EEAA5F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 18:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4FC10E2A7;
	Thu, 14 Sep 2023 18:08:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63B810E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694714889; x=1726250889;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9793sImnsii/lzxmnnQTHjsRmxwlyxNPc3fWjFHtu7o=;
 b=Ga17sGujzj/HLrLVuoj5b2B/cwAgRu0JIe5F5tWb4c6mtf3gbRlEDbCm
 l12kLBwPet09b8s5Z2TXqwfaHqvNBEzBEPF7yOpIX5LUWfTGLw5Ivo4a0
 1H01HTg/I5VTlxviApZKnxoWJSFKCxDcTn5U1ifX2ikEXZvbBDatf09ux
 IKDJVt3O/aDPJXrZ5tRA03qmlLp9nBrXxhlHf6HzgPvZwb4kKc7L8wMkX
 cFADy+K3s9sy9uzysjbM+z1DNUfO8ksUr5Dh14/kF7c60mJty7jBtCzUv
 Mgpyut7xAcrGQIJVT4fsZkMEu/ejpEPmKGpPRcxT1dkWkvSGDpywJK1+A Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359292287"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="359292287"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 11:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="834834131"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="834834131"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 11:07:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 11:07:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 11:07:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 11:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rad6jQVNqmv9EztyhAUA+edE3Ko4LBQ3WTaL/r63bLXoUdcoZU2DHLWVc7xlu/w4tSKiSJgZxWE4y179h6N3z5xDBXNQjGkOEaVph01qqpeIy/86Im3P1jL83SXKiLlsE3fatG0hpiXKXeVoWQ6z2MZhZNBhFqXvFZVclX5KUfQMGklllfaCCkurUj8VuUHeMTczUBD8eQ58lWW9LUFuleDothB+Yj9poiao9QpZqrZQeUoB0S3AYt3mYuZXxiN8PC36XxY+KWSdkyWGvfHAMJH0JLQWksH1CQE4qZZ5ahXtkBeJIARPxaP0hXdA7Tun/tZ+5VRKooQWoEkcVOtiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHvLyyIqM+O/16sjv+C/aFahVbQnnGRDINdg3F1iRNE=;
 b=Pi9tNVXDt/EdmvR3KhQOwXb1fNyrsM8qPF6aIU7tOOzZsY+4Qs5/b5A99ht73UExsh8x20VE28WDNVRCjMOiSpDnVu/uftzK9cK5ThM7+8is3m6zKe2kDQo8duH91qpNxr0KQ0aitMrQ3exfA63XczyIbGhX4eJRERWr5bdJtghdnTcFMub+FS2aCE79hkcsZJgFaefzWkJxGbZ69haaqRBeGdPdd6G8yv92zjuDZDape9lEatzQkK4BPuDq3GyDy6Qhew5XcW/AqWK7a11ANTdPkapKfsVTw3HFDZfEotbVNQBBLnhUtujOszFlL39DIjUlnk03I2OPxUWU5W7Mtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Thu, 14 Sep
 2023 18:07:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 18:07:56 +0000
Date: Thu, 14 Sep 2023 11:07:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230914180753.GU2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914153112.455547-11-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 6259c2a6-7de8-46b5-4a96-08dbb54d85d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fxwwjq7MdeH9oOy3a4d9Uxk9XJ/ewcjhpyJ14mo1A2s66w5pNn+56WO7f68/khjPXli1cVztLfK4EHMj7oPEakQW/lKAPp0s38nvW4+/8L9Du5GHe0WdI/Ag1hs0GOyXO4Dx8Bq6VHVn/tuc800uzETvN5LJqZFZnyy4DCnEZPYS6H1WyegDAKWc9GGumM9AGT8AAcNr4VQp05hj9GFKp6LGHLymHvQ4kLP3rvAF5tTFpeZIMr5B7tXIKExyafOmL42GCOupwAhar1vKeXBxf/Ou5QuhWosK0bghYmHEwvAwMWmDIMnSNvXAgKB2oMW0C2N/EXKjPsor49GRmvdbEZduixibGVnpD1JnRSt2F9a93eOolNucxrPX3A4pc1NzcMPR7zfj1hmXrMes08/UkYAA/cgsFwlPo7sYTjW0sfKoQE/LJkgOBH195pXT5oVp1VNbQC1jbtX2hRazwr0+WaQNKoJ/mlF+BlmkO/2oRn4Xgr9Xaqo72s3GJ+ikiO1VuxpNsqOsFHSZ7LngBMa4rSbHrMxQdtespiFTOR/xiLKhbiLK+TL1nunX/LTGNo70
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199024)(1800799009)(186009)(54906003)(316002)(41300700001)(6636002)(1076003)(26005)(107886003)(66946007)(6862004)(4326008)(66476007)(8676002)(66556008)(478600001)(8936002)(5660300002)(2906002)(6666004)(6486002)(6506007)(6512007)(86362001)(83380400001)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4R+RQCwl2qU60s/3mwxDSZ1+Jz+hdpdACsYSkQGLksGoD9h49/hXq/c8iRpS?=
 =?us-ascii?Q?YJi5qtaRru9KP1X15cg+/3L79rernWowt5x93Zm2yky9qCcKbBZ7va6bg/KJ?=
 =?us-ascii?Q?qHPjcJOC+NIW5xkEVrrAgBc31a7meDXtYyV4I0HRpmHFhgAKNrAz6WOLQQPi?=
 =?us-ascii?Q?IgP73y/vTAxhM+USaA62jLPlWqYfGYusC2FlBj/Gm4fdx23rGK+dk/Ug9etQ?=
 =?us-ascii?Q?sA0mCUubgdjtvAvAqKEYebcRAf4tVgBYEIK1jA6DDo0WHsdOMB7eXFPgfcbm?=
 =?us-ascii?Q?H3EWUQyTj+mxRZS+7UjwVSMGKm4JLHY+o8d5MdRoKFK43s9uNMWz+Z4QTWN2?=
 =?us-ascii?Q?4YnadvL3Xyyl9sb8bukL00Hx+FNETOg6RJoO1mOcQ74AVtuw/E1n9WRlXDw/?=
 =?us-ascii?Q?W4jRb0PmK0GyYRXytE5PGZLPTyXJwsA7e8YNbOTJFY3zaGmIslARNSVq0QFW?=
 =?us-ascii?Q?KTQrJO6x0i6TOJ5nh+1Ilgai1PX6XZ2S/Y81WIJ41Xq3NfhoNK8XShSku6jG?=
 =?us-ascii?Q?+AmJxY0m4ye50MO0RveNAxPr71x/ouYTd6oJSHFOoxb1vbkJYAIyVX8A+VJx?=
 =?us-ascii?Q?T6aP6TFHUSOx/KttttbzvaO5D/sw2MEpxaf2xx0yfK8XMUEihKxEx2HZNGkv?=
 =?us-ascii?Q?BXJI5O73oHrBciTR8YJfdk609pgThwhjaSKIeOS1O3427dsjOPwzdmMQPyEa?=
 =?us-ascii?Q?qT+nUC6R+NWcrt5gv34gdeRLeBCDwEd0r7+US+2HB0fIAbPDmHnBkjW6wGHg?=
 =?us-ascii?Q?R8s5ro/DCLr9eBJ7IEzAE8TWpDqYMp8RYymNWYIlR5/KoujV0ymqZ1UNstmJ?=
 =?us-ascii?Q?9DwcA4q5pSFdnKD6/1cqAdYsvCSWa6oGFpvesp2mb7JFL+kMkLxS0qjq9T3r?=
 =?us-ascii?Q?ufxjDi57x5OPhmob41DYBjGlHzm8NT5jWvST7GuSPrUw6xJjLz3FrWLSb3r8?=
 =?us-ascii?Q?wCS+qbiMg8wefZ/xp/E2btcXkDzKDr9+LVGwBwscDnVZIwR/xkwBulz9WIn1?=
 =?us-ascii?Q?8sCWSmhPFvOhNj7mydTdnYes1ct5booUPiBdhPxexUP0u//Y/0EYY1T2q9hi?=
 =?us-ascii?Q?MGpS2P2emEVAVvAAUnWzisUB0M5IoK8fGVvuwFASIFHcBk+tZpVfsmKLVF/K?=
 =?us-ascii?Q?i7rC5mWuebZBd0bzWlqivuPPXkPus60IUa5ivx3mbKtHq52TJa6nl+X6T4xp?=
 =?us-ascii?Q?YajAEUFfalgFhaJ7bWOEE1QAAUCE6xvohofv39em/d3QxT0EXFMx49qMjoe7?=
 =?us-ascii?Q?qM7dSug3avfAi7Opy1jEP2rCnhLb+BYRTlxODSHTuv/vc/hq3YVL9KdwDW09?=
 =?us-ascii?Q?dIum3Jx/gLNhdUQ5rr9WnKYiadV+WjD6N873OnY0a2F7VjMicAncXFUj8VWB?=
 =?us-ascii?Q?N+iqbVDx9i00o7sjO6xJ4ioeTgT/fCfVs/J60GBarDrx4OKO92E1tkqSiCX/?=
 =?us-ascii?Q?XOUxQRjvvdNrHpxrcvbKJjlyoqjKIvvBWdi2KU6+Xjk9QjDZ2pALLxbQ/zid?=
 =?us-ascii?Q?qx3NB9Jmjfy9QwRT7sNwRbB01I9nik8JBBafMSFO3BcFKkADOmF+UxaPsbcb?=
 =?us-ascii?Q?F6NQWcTaIMoOZdiTEbcI/7xCdyGs0GoeI0sy45yYeYeZvzhqRjOj9UFIFr+c?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6259c2a6-7de8-46b5-4a96-08dbb54d85d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 18:07:56.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5aoV6+0M7X/uxKJE2pzG0J/DVTiKaj5YfBbKHHFQAwndlvuavLr9LaMzDsvrs7Pu4nyurzOOHq1cav+u33oxsath2anvFVyCeJrVCJodL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/pat: trim the tgl PAT table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 04:31:16PM +0100, Matthew Auld wrote:
> We don't seem to use the 4-7 pat indexes, even though they are defined
> by the HW. In the next patch userspace will be able to directly set the
> pat_index as part of vm_bind and we don't want to allow setting 4-7.
> Simplest is to just ignore them here.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index aa2c5eb88266..fb490982fd99 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -38,10 +38,6 @@ static const u32 tgl_pat_table[] = {
>  	[1] = TGL_PAT_WC,
>  	[2] = TGL_PAT_WT,
>  	[3] = TGL_PAT_UC,
> -	[4] = TGL_PAT_WB,
> -	[5] = TGL_PAT_WB,
> -	[6] = TGL_PAT_WB,
> -	[7] = TGL_PAT_WB,
>  };
>  
>  static const u32 pvc_pat_table[] = {
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
