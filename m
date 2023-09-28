Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA69E732C8
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 13:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0819410E18A;
	Thu, 28 Sep 2023 13:06:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962EC10E18A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695906409; x=1727442409;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=icdB8WuFGhukjWCql6rpEq4cQkuetIjroho6bWY7qvM=;
 b=SchkXcgxYC/3eiSSDcVdzDrJqiqDgVr+heoieowEQ3965DwtKRMCycvp
 8SKtMSi371ku5ce91VS87QSLcqZhXU/TFTZfcNKHRO+XprJX67lPNisMm
 +bK5ty02FJ+HDMgt8WMgi/i2FG8sUFxbtraS2124a0HzmR+hIV2bY44LT
 BDYx7tm/jQ3NowTPDx/X369N11JnPe0zSBaCn9Uwb09VgpcXkcZJ2IOCZ
 mlf3Kl3TOfMLgfzFRfthny+zZx2rZqSVQAwPo2+Y7Yi4SK7MBgMqyLz8t
 HpFDKyfaj23rLV28l1gXkHvxkuMsIrj9qihFEJKWbITdD5oPVQ1c9NfiC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="446197079"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="446197079"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839842615"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="839842615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 06:04:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 06:04:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 06:04:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 06:04:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 06:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUXpDTI174mstKYHcHONev9dUJkBdRnYOmjtSCf0Usz68T32Iyo2ArI7q3XWZI+3xh70hc16LrzpJAWOyaUbnQQDICxt39jBM1Wk4+LhYYLBcly6joMSir28+0xF3tAgoabx55H6f+sIY8O7NRVKBcRcY/PJTA3AetkmCDN4AdVswgtPa/z6KabP9sGWr+e7aZXon3v9976rfIQn0nJPovaDhf90x+CDzRLtNPxruGeAWn6jnml9YYEJpCbmVGGUDCb4SDKWazvAxMx5NRsYRtWkxP9ipZhFgUoJP3ejWKGhY1goZqWMK4P2QM7VpBR1a3vyuIT8QdUGFa4Xhj4+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2xHRvI7/aABv1uCsFBXQXOAgA9i9jr3Lb3BCT2ZK7k=;
 b=fcA9WyxPNTihnoYw0Gt99XRkjyIQExeM5bBguw+ctfvfqoySrCt3Q0MA76HQXSpnTiZ0ZjuPMSDhcWMYXYS+2jeVDMr88XBs8Zs7hlG+6tVwV/ZSzN1jkweWu27ZVKbCZxFIZK4yLiff6kjfRaD6/a7KLEP0wca5tairZ462QBABvLsF9qNpgAJZIsJF50+AN5knThHElRmEYubvTVEOxhhlgKXdHsV9jfFpr2lYfGAJw8TnyXw54xm5elJVNJ+nn32o6w3Woe5nPsu5qaTZ7l5dUHXgZLlPfTU3ZkRrKg7tsefWLaALCpMzqsTPw8wHmsXYj7wEl+v6O0d7/aQijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Thu, 28 Sep
 2023 13:04:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 13:04:23 +0000
Date: Thu, 28 Sep 2023 08:04:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <dbemahqf4yya7icjhcv47v34fqbfgl76rlyeordmno4dupfom2@66sdmkd6duor>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <20230928100537.392675-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230928100537.392675-8-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR11CA0061.namprd11.prod.outlook.com
 (2603:10b6:a03:80::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 4111ad3d-af08-49ea-6569-08dbc0236f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGyQ6kSAq1sflQZv7VJX4h/T/COxcTk52N6MvyFPAixhzo0TFkoK8nJ1FJVfVl97bOTJMhz1xwl0IEximm6E4CZfZbzj7BHKTNdh1/dwK4G8aw6HWYvd8/9bJknj4mwksO+z4x1qePdFWEVyPt6XJ17BqIi52/WBBUOM+Y75Mpnr53FENijLuGqd4wORIzN0mTSmSt1u+Yayk6wMjxVKkX12vAG2pjZiQkG025u1elrW/jl75GZvgwC+jiQIxnF834FmlHJZzRctLrz6E5vYgvkTsR4mhWX3IuMjl4OIK2cABJty4nxGZNcT427/v0rorSwRezjCxnOCBug63Dt59dXMONnjlkp1L4pupG52qohBGDwXfiZzzMPvwZfTypcKrB8Zoa9ndQjUJ+RIScNvhGnWbIuCrx4Ta4otyCVidsPxTiPSBKa7+jXt5zYcvHmVJBVr5RywGoG8mysYLu1iGXqaVedmUQET3rXJIyLihTeYyYhXJJsqlWw4YmoqSAr2djlPRGklpG75xeqPy91EAZbUQm2CwcTs/CnIQCGIBZUH1Hd0zeGt6P/PCunLD6/m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(6486002)(6666004)(478600001)(38100700002)(107886003)(26005)(9686003)(6512007)(6506007)(82960400001)(86362001)(2906002)(6862004)(8936002)(5660300002)(4326008)(66556008)(66476007)(316002)(66946007)(41300700001)(6636002)(33716001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBGMwqQoTPJpX7hKoQSpnFimR18EYAlO/svpsidJtgyeKjzAuiTyW+Nvkwrp?=
 =?us-ascii?Q?PdbJblFk5vXetGVCpitFVUpjtCBkRMhJ1UYPXEwiwkB+4J/XsTkNUL5bnAwQ?=
 =?us-ascii?Q?cbnVSt4tZ837dDs0Nr8+dMQonZT8wdB/G4p8ChVriWXXjCC46r90SPacyXGy?=
 =?us-ascii?Q?vvSlm1hhgEMmSZDJWlJxelyWQ4zo33Hn68mZZOP9mphkQPH/Mk5ImbedC7l9?=
 =?us-ascii?Q?72ozwjtSFXwMVeOxUqcLj7XAUf4SnFTAR04R6g6Wc5Zxe58Fdsr2jv3fxTQG?=
 =?us-ascii?Q?6V1thvPE27FggySTujOB00kkr+YDws15XZMXcr1XuYZtGJeE8ljJ1kUGxx9f?=
 =?us-ascii?Q?SJHpDKkR6rISTYmMoen3nzgc4fPSfytTMzFjW1lxz7ItteAt1ZnZz2Qeyaor?=
 =?us-ascii?Q?TCJ91bb1FJyn5oyGjK+ui/gpPH4qdLpAk5mnzkhOle/aZhhc70etQcFdk1Vu?=
 =?us-ascii?Q?u+79uDjXV1qcUyQwgWsjtbQCFo6G4x00CHwOw7RmPiBRR0yZytex2qRFgLq3?=
 =?us-ascii?Q?faNYJoZD8mmpAci1RjkFFDJxNjpqgXr0hpaD9s3Ttq50GzJqqDIVUSQExaYp?=
 =?us-ascii?Q?mf28j6SgBxfZlQwiO67dmOjggP+NlObR9TAJtvt9pXUWtS28FANtY+iV0jcc?=
 =?us-ascii?Q?IIrXPb8BY+iJEln2c1lzBdY7UhHY05TWSWM0zmUvMo7tL40GSmaij3AaXHr+?=
 =?us-ascii?Q?7arNaRjduo918kLUR78sNLXgU021ynbQH1m81/bB/ED4EbIFBfrB7E+PX3dJ?=
 =?us-ascii?Q?5mi2BOdEal8oDxk5TBTBvlW6WzyRHiSYsDNqbGzoqsOU8oZdYTrFdi7+VkXu?=
 =?us-ascii?Q?rahL1Oi+t+tm04rX8V/1tME8PW5+pubgF0vYOhj238Ef9+TCEmPK2bG9YLdm?=
 =?us-ascii?Q?eaC27iyuQ3Xqy5TzwLjPOqVXYS9mxlesJh+gYwqmqK2JRz9ADsxGeHmmTl3T?=
 =?us-ascii?Q?WKiiOtl9/27uyl7mTjdGZwcFqo9CEzVK+vPizAC20C4126/J+wJ1WJ/uFhFJ?=
 =?us-ascii?Q?vHZFDqW1Ti2oBjDx6XlpZqryOxQKnWvzDc9aF4MoY5TNg7Iw0FFycygtMxER?=
 =?us-ascii?Q?ryz1EL6PcWjsYya/RICW8QBlgCNAwfrjy0FuewN7DggRTC3FnY+FsHkJAAIx?=
 =?us-ascii?Q?WVatYHj8q0F7Gvig8ENSlINowF5JfKQaCgnegNXJRBaxNp0hatAGB1Y9Abd6?=
 =?us-ascii?Q?ZhdR8VQdXTnkN9QIikL3x4io1FN+ecKFI4A1XDuyD/VfXXf3ijqsv0JJeUzg?=
 =?us-ascii?Q?T413TL37N+b8dnQE9U/euJ3JS213c0/9TgypW1x+fNCZh/GtaxZuHALilV8N?=
 =?us-ascii?Q?LWlMmgvfbexFLCeRp6D0FONAHi6HOPvuxfHGck9HShDIrvYHX5NwRYyLdNMP?=
 =?us-ascii?Q?bGaE7AejDHRU79rRifj5mrHiNEHt/SeyH2NOJENSFNrMdWfMIwxBpw3YtPT+?=
 =?us-ascii?Q?vHK7GzqE+rX8xdpZJyFfjDnZT3V2nSaijKXHnWYdMUs6NVp3MU9PyzApoDTu?=
 =?us-ascii?Q?WmG65uakdSqvky3CUPoQBub23B2BVqLS94syLC1hxZ9i8A5LXgPW2vlbIczc?=
 =?us-ascii?Q?bBptpcwDjB1Hz2GDLpZqiCs8fLPtSvVZLfyCNxsbJqBxJ9/cULRZ0bX8wesJ?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4111ad3d-af08-49ea-6569-08dbc0236f71
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 13:04:23.1951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dh0kzvGmWK0INlRVH8EpXEl+/8wiYiPf3TBhJ80SOZOkjN0fdYO4ET8tOzNZAyN5x883bgm2fwYq5/n/t+hCx7cea23UourqLu18TXUK2kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/5] drm/xe/pat: trim the xelp PAT table
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:05:39AM +0100, Matthew Auld wrote:
>We don't seem to use the 4-7 pat indexes, even though they are defined
>by the HW. In the next patch userspace will be able to directly set the
>pat_index as part of vm_bind and we don't want to allow setting 4-7.
>Simplest is to just ignore them here.

But why do we want to leave them in un-programmed state? Wouldn't it be
more future-proof we we program them to something like UC?

Lucas De Marchi

>
>Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pat.c | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index 869aee64641f..36b79d675e54 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -42,10 +42,6 @@ static const u32 xelp_pat_table[] = {
> 	[1] = XELP_PAT_WC,
> 	[2] = XELP_PAT_WT,
> 	[3] = XELP_PAT_UC,
>-	[4] = XELP_PAT_WB,
>-	[5] = XELP_PAT_WB,
>-	[6] = XELP_PAT_WB,
>-	[7] = XELP_PAT_WB,
> };
>
> static const u32 xehpc_pat_table[] = {
>-- 
>2.41.0
>
