Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A81E82CDE
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 22:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F6A10E165;
	Fri, 29 Sep 2023 22:05:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6C810E165
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 22:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696025133; x=1727561133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AJtUwRlBrq553yKLIy5LXLQ32w8aXYsiigYEUgYedPM=;
 b=B9sw+azo408VQOdqrS4JifVYqAuLMj78lPiMiwX98js3giLANAlyvIuS
 LMpDwRyHV9IKL5MStHscy6bskalqC/TS5VNB1wVapraWunHO4IBGGLK+q
 EAqSHlhJ5XinIvZhG9ZtlXglMdrY1lE+omWZ3tBoyZhsyqQNdfgXkhVK+
 Xm5AC0wvSubJiFT6SyU3O3jChEQX1FBumPAgtOZ1rxM/hUZEQ/u2H2ycD
 u3jiNDzWbYGmErgP00AWHMhmdrHtUZ8PUHHcAfyQUh4aSBiACdxLncdcm
 NakcAXcSkZIeFVmgN8Hx0/+YlX7q1Qjq05VK8QQNp9L4YpeLJswqPrasn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="361772003"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="361772003"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 15:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785224414"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="785224414"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 15:05:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:05:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 15:05:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 15:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djCLVY8KhkHj87tmPz/Eat3JJGZfUpSXnI4SvueRGj9/VFvOF7v9sWLr5sze51vlLgW+8PnRkb6aPgVkRJKlyj2QPIfLGTwThiVcUkhBk/DSU64lc/nqhVYrNHruzSXW2UwIOImoWh9tkb/4Zx23AJCRPNHDR+z1grZHrJvEImFgrQHSV4XjSIqD5t96t6uJCo0luJw5rrVyL9KgMR4h3377ngvOeWM4vC37TLJwAD5/zJxAo7mwruPEVG6YyDKOHBSyt2OB9gca+VRLrmasunTKIE/uR08ms3gvnSM3BUhn0VXLjhqAREVcO3s0ERn8P2w6t0U1lqUaOpGKuQKtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJDj34GK/SIgDK2cd64q0N8SriJhOEgVucmzGriBgs4=;
 b=LN9NDCBQIPjHDe9TaszVUtdS7z5t5E7+NXLjrMQp6fbKj/uNfLsx+PsthubOD0113NgK3iydV8S+m8dZuhwWtRiAR8P6aAtUaM871+qrtyeZWOnQyH6VmlEjX8B6MYoJMbKRJyfGyFTQnpEDiSBS2Finc2qH7YbP8Qt2TmmW92CF/u48MmxbkMz2rF38DrudCMTUWnbayVMC3n88MOW6PV0aj7eukkRGYkqcI5rfsbkgtyG8GXnBkCXus+e9K0YzDbblLHro/vBZCaLKhRoVg+9tPBEyXEpDy2Tw5WikHNbtgd1l9L/em/RwUwSeVx7Po1wZDhIcwyngiRRkUEUj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Fri, 29 Sep
 2023 22:05:12 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 22:05:12 +0000
Date: Fri, 29 Sep 2023 15:05:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZRdKEiWQoRxKlW8I@nvishwa1-DESK>
References: <20230929200618.3421234-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929200618.3421234-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0047.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2c4d65-da9e-4318-9a27-08dbc1382752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xq15el2XjlYdvI81REMrGhuDCuLZ8xZZBZcolYzv+E8TizgGGKztklKxDcUhybUqbaSMnN4SX06ztoX5yKSlZD+AlGY3hAgK1cu+2VuitJ/Yp6Hq9oSoaQmeo10e21xgLKDfXtUTuy4HG2KV9nO4m06VehDm0PbFTM02dS6raRfNHKyblJL4J7+3nEUcbba/my3RJS+ZFr7EDHDNLf/XTTH1vETRGYBeFVN2uO9eE81fro+KYKoVandowlaO99tGyQozpuX187qD2u9MH3tipmB8br+6NzqcpzBLXcK1l8XfTe+YAwzQqeNVWv+ugntvoPyI+/SONkF27WiC0QVXbSXExTDqnvi2ZWLqtioEYKhTdrnVQZDdm+WN/9op9rEgN1IbnqggTLBMyx9CzZjoS/Vj8X3hdf7M/xDhkm0fTW05j+QLI/sr2+KJio6jmxT5vu527yUDTQnDeB2MZdTASC2Uss0sQxsiDGnl8/B8XvG0ytFC/MOx4pWUUKPOGS1kd6Q/3hh9XrBlvtX3fTFnYFw1RVWVwcMzN+rZS+bRZwCvXE+tu90cPvpRS45GW1mD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(316002)(9686003)(66556008)(66476007)(66946007)(6636002)(6512007)(8676002)(4326008)(8936002)(41300700001)(26005)(6486002)(82960400001)(478600001)(6506007)(6666004)(83380400001)(38100700002)(86362001)(33716001)(2906002)(5660300002)(6862004)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tQHQNsxpuRsBvJfb2Gm5r758oHrHrS6ros/z9zMMWb/jkfsV36keFyhTUYRP?=
 =?us-ascii?Q?MqR4HXQg9VHaGhhyq8IO9R6B097eLHbj6FzmAV0zkQPchus+aP1hfH/Tzn4N?=
 =?us-ascii?Q?Bf4cxEWGPZiEGQpcZNNFIJ0oLzw57Hc5AeK5n77bxbphjG54iNSBK2SDp3mG?=
 =?us-ascii?Q?kNjEgEP9tW1m7Ll/EpNmvWex1sBofhcD01Ag0voTaiousO8zlXCUXKAFSUSX?=
 =?us-ascii?Q?LaBTY/3SWPM3WWYVcsIHLDZiqUA2MflgGmKxUVWNis874G/LtBSkR/d0rr/d?=
 =?us-ascii?Q?JA7sr5Yq/nzRzvAvz1UvX58vobiQWmTqLe7gSq0jAA0swaenL4gv/6avRzwi?=
 =?us-ascii?Q?Buv3hlr//W7SDyKU1QqI2hjFWz7cVAEW32dHnblGQH9aDeZ7HFceITvj+7xU?=
 =?us-ascii?Q?vlKtgXG6n908lmcJgKVu5PTfBxk+YX4fOdGQ0BNJpagvfgMwaAOHyyUMt+6f?=
 =?us-ascii?Q?erXYm9Ksrrvuioh5CK6SqsZRRYod71cDm7Osm0kixDliguG1pa+s3MmUU4A0?=
 =?us-ascii?Q?ke1hTIYVSbyo1SLEb9PDMFc4YWxYZb/0mMOhSmEXuLVaEwn/LvpPEuZUEU+f?=
 =?us-ascii?Q?8R3akH3JtnmHvIx/NxHJ+owPrMS6nSCexk8E3KboiQFbjpinkQ1ZkHFIXdDa?=
 =?us-ascii?Q?k5I3IOqNrO5s/ufQh1UBIIc2VAHOinCsqAm2kDxDePxK2Z1DDLBpvrNA6Z9e?=
 =?us-ascii?Q?aAqU5dxERVlTfgeQSMa/tUT2LIoghDiBdeDKF7ElHlpJVaiHdIyP5BC9ToOZ?=
 =?us-ascii?Q?8quzGLv8okkX/hjiGrXI4/ZkQ4u/avbwZwvsuviKdN8RI1wg3Fg1pHUvZNUB?=
 =?us-ascii?Q?g509Fh91umSGuNxj2TBj2xq+ReX02gG76BJy2UVRriqcplNm2ROcNkdUHtsQ?=
 =?us-ascii?Q?2nUifNIieH69TbU3BufG4+JFyzlNeCbotkMQohMurLIrWDiwoTUK1D4QtSgX?=
 =?us-ascii?Q?pP/hI1wr/ii69wEOFGd5BXAGHstA2sl+GoY4E6rMHwImdyv+P3TyJapZpg6x?=
 =?us-ascii?Q?vpqcxCgYaO6zNp2LIyn93xd+2pH+MFDwH/cEfEby0cbVIrTlgI5cjpRNgibm?=
 =?us-ascii?Q?6Sey2LARoEsllPE/ZBd8v6XslC6o6oFUkGKz1ZUAg+LWbDvpzhCQMsYRr9lu?=
 =?us-ascii?Q?BkELWdx+F5CwGSIMnhq0c2uZe1BdLKh3gi7HqXkW2QsYqtOX6IrvQvYrDZsw?=
 =?us-ascii?Q?/uwjioWyecGOvNx3LF3OaRvIS3S3MY71uIQhRNq3P+h7IffpyI8wMsLCDsAR?=
 =?us-ascii?Q?8OAxNLv85dfgM4aNFXqopTuU6m+yxs8jhVvqj5M9JFiDaASB+1lgnGZLALS1?=
 =?us-ascii?Q?N8H64TM30nvOiiKnym/1OAvNR0VcNKolNErH9U0EnHX5Ijnq6Vf3Ybip1qj3?=
 =?us-ascii?Q?3jCk6fCLt7eZlW1iThQiyhE0SOLspEs++bfC/a4J++veaoYNAPSScmOC8HzU?=
 =?us-ascii?Q?VgEzuReZ7j/XhtGC+vDLo08k/5l4e+asJU0SBwAuK0RTW9F61IqMmh1eedY5?=
 =?us-ascii?Q?6rxylf/M7k8/YVxXCALtnm8yJEWwq2sSnnxJ6r/EvLfP/d+ht+kIInD6bmOg?=
 =?us-ascii?Q?kF1M+IHLotRjcBd97lP+tAIl5BZEtK3bQ59u+hoim8ABNu3TAkFSDjMuXvVQ?=
 =?us-ascii?Q?eH41JqaIoxI9Bxx7O1XkHKc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2c4d65-da9e-4318-9a27-08dbc1382752
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 22:05:12.6679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD/cQ4tbBwXrByLPcdFjVPHNAqbp74nhpyXWToqRBQ7JtIOyWwpXys6cWTPlRfzdA4RI8NMALMo8x9DXIFwesjLcOo7NwESm5f4SpWSfY2DXq9BLQNpWwJTkIx9zS4Zz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix exec queue usage for unbinds
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

On Fri, Sep 29, 2023 at 01:06:18PM -0700, Matthew Brost wrote:
>Passing in a NULL exec queue to __xe_pt_unbind_vma results in the
>migrate exec queue being used. This is not the intent from the VM bind
>IOCTL, rather a NULL exec queue should use default VM exec queue.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 57ffac324564..26b9f2310c5e 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1732,7 +1732,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> 		if (!(vma->tile_present & BIT(id)))
> 			goto next;
>
>-		fence = __xe_pt_unbind_vma(tile, vma, q, first_op ? syncs : NULL,
>+		fence = __xe_pt_unbind_vma(tile, vma, q ? q : vm->q[id],
>+					   first_op ? syncs : NULL,
> 					   first_op ? num_syncs : 0);

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> 		if (IS_ERR(fence)) {
> 			err = PTR_ERR(fence);
>-- 
>2.34.1
>
