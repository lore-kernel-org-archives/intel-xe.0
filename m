Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D16C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 00:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339710E263;
	Fri, 15 Dec 2023 00:07:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4AC10E263
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702598834; x=1734134834;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=H0by/OR/0mmhPtG0KXZtTRytw3giOmz2SbdVqrEmE7A=;
 b=NV/zYG6acoAi/pC9LUY1FKmUgnXU+MIuyAwMFZa0vayfEu3yLLkcx7Ie
 xiLsIyNE6V9VjEvFgF9wlxWxIiC1l4DpQ0x1YDYwj52tX+LhQVecoMuuI
 ghAAjT3u/la3O1Mq3JM4T0Eg3rzJvM8spP0nwjWrnE0YXQPEOp1hea2jZ
 7IOWU0zIdFn9bHOlAR4CQQu6VzE72By1OMFDXC62p926pR6dxvSbTTpD4
 H9hYfGpbARsf9Ip141kDryuQCijf/bNobuoGtuSCVM0wmMAo3qAKkzUlw
 uqK9lyIAhjwY5hq/9aFeTGZUxO6bjld0EUNJgsbfB/RXCbmDZYrF7pvA/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2060572"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="2060572"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 16:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844915590"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="844915590"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 16:07:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 16:07:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 16:07:13 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 16:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcQKslQeMLH6JzDxIlmje3v7RGevHGaMxvYucLQSOKa37/Uo+WGz2s2WsYoVmM28eEtletvoAVBu1ZemIIAUywus9niGJoWzWZhlmhrT8DtS2J34tLOO3QgwHNh0FEYLADNW/n/wRE/GvTzMgZZw8idRoZmM19nUxriegg7o8hy2mBp+9hNod324beS/w9tw3ti0F7WT8cRCUvnwCsDkSpNP9PiEuMIQ+JUXKFMykewhMY/9Fs3ZBnYmpz0syDZ1HMtvgAkhXEzo8ahb05A56FeCtDstdPjQH/h0NxZ6kUZTSSq0cFGFvapwWOovf8Tj0mUZ4dRyBWQ9D1rqj/sccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTePGFYTVYWMffFsZkTdx2A63Ab4vF389GmCvHxe7R4=;
 b=TFknN8BdIvp9Gr4I7Tw2thZiUAnr4j7DwRAzzx65RRzmZqc1qqnWSPZg5TzzwPaEpVpc3XoVpNApkZZFW4ZQwcc24xoP+cvWaLulZtvf1NX/H+vlxW31qRfpE/Vzhorh3bdbpCHAtHpQRAIc24AR+vGdT4F+GnflsqZKwQ0C5OwS5sAc9h1PbvDxq9RdPsl4GorXLx5Z928bvUWb12eYriuueEluV6R+t6kVsGpvI67OhQ9BVJknQPqFvzFFhnHRVtfsDBj8gqcAhmcrHtIWsBs/mGLRfVe3Nm16MdM6wYIfJF4X966p4Ogum6QCzQ0adaVj0gIRWhDPVDoZij232g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 00:07:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 00:07:09 +0000
Date: Thu, 14 Dec 2023 16:07:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for Trivial
 register cleanups
Message-ID: <20231215000706.GW1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <170258566759.19958.18231072789493334996@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170258566759.19958.18231072789493334996@emeril.freedesktop.org>
X-ClientProxiedBy: BYAPR01CA0016.prod.exchangelabs.com (2603:10b6:a02:80::29)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 997532e2-2031-428c-f3de-08dbfd01c766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wtmE5zLHnNYp3JgKFIj3poWgawMrD5rjb85l6IQdDQ15ToZaLI4zmqBMimjE8sgyb08Asvz+/5C+KZmMW1JCZSSR89iCFce5ex02bgX7p04cZJ1Gnwve7Gh5PE6vtBOSLq5VFnKPWkaK0wNoa5mqqLEmZOyYGPj8STso0/ffqGHVapS4AwffYtshINLRvHLIPkY54cxl7Qz254w/X0klE+Qp9EXBbZGQ0XS8tJrgWOWVbT7va9r91bO4IvA73DfiqurSrO6eeJ9skOO3iQ9aMRccqgGTjiRsiTZrDYUfnA0KzgMVqx5kUS+ntX5iulO0FZ1dlpXGwcVjlmFC4c+ArJYPQZkDg8EsRgI4G+X9abNFHmwZsfWaNP25sxHK4H71D6gOsI8weNBx+CyjEdO4XYRYMje1P1RaPFN25CdM05/ENkvHIv4dDZUATWGV+0LMrilD7uYgwh6ObwtUyNC3uW2+SMCtf48SAN0rdfByrYSfIG1Pn7zpYIPhWje/g7Y07ykeil+pqki8CiVAUhCV6RsrjKtLxyubzMJudh13pOGC6PqEvNoeM/u7vi4qXE+DfAynLRVtA+BYeZgQ+sRxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(2906002)(38100700002)(33656002)(41300700001)(86362001)(8936002)(6666004)(6512007)(966005)(6486002)(478600001)(316002)(66946007)(66476007)(66556008)(6916009)(5660300002)(6506007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7a7DGjInV8j1RsCp1UuI1eLrfuwmUykJlCmWbAxzSwELXykxeEuA7qZDmX5E?=
 =?us-ascii?Q?YtB8GOzkPbXWcn3o7ckkzGf+1DQ82s9ac/esR9SM8eT6ZjzCcscsNrbVDMfW?=
 =?us-ascii?Q?wDU+QR5cz42qzjjmMz4CIunHdreGSOOzzjwpKzFDm9CfkMyt1iaJhxSRwKPC?=
 =?us-ascii?Q?eI/1OCTZRo9y7DYoo5plOV1OHGEISXppABp63/UtzH5Hw5pj/O9O5DggKHDC?=
 =?us-ascii?Q?l+nUSjPPHHjSSBuoQgDbkQnJu2UI5eU69XA0ceCpVvShK9r02fzAKFgDKXif?=
 =?us-ascii?Q?Q4zM0rDonD22JYCQHPAOlhC3JIVhUuD8C9OIYXvYgEGJonB5sNKmQFI9bucZ?=
 =?us-ascii?Q?Zv9sYHHVqSZpJ5V6fOcHkO+fmJXGkbIQoiddsLRPhO3o8J735e2VJ8+6NUlo?=
 =?us-ascii?Q?pnIq7WQ24rUspFF6ETUq9cDrEkV2COLkvP5oMjUet+dA03NVOcY7O4B41UIz?=
 =?us-ascii?Q?j0R5T4TQowfswPCADNtliQS2f7DjEaS7cXygwzq0vY4hq0ale8WDi1j+4N4H?=
 =?us-ascii?Q?ljpjd83c4USZx4tp9DmdrLPHpYhOV3frIiGSLDmlrTUKMYMzRKP2hgav6I3L?=
 =?us-ascii?Q?sk3SOthn5MZDouQVa3Cj2QmOAeGyAGAm9d4cM0R06HHxsHMxjQsIGa6i9G2o?=
 =?us-ascii?Q?SHjv9QJK/LdrWG6Zqnb/QWe3xAAqiUJ7/C5tuqtpzkm75U/YBH7eR/Txh20z?=
 =?us-ascii?Q?/cUHwCEMjbhdP13XtxKQ95ePmIaSolcaZTzRSZb2omQiGPW0zMDI054Cc+Ip?=
 =?us-ascii?Q?itf6PoE6jopEVAGWMq3OGqwBGhrlqrgHueKUG4guzPStFM9GGxu6EE0O1Hly?=
 =?us-ascii?Q?3YePwYHGw/mk+UWIwBHxXcKVqeEEQLimAUc1JBzDPcKt9Fpa8cRmwQ3BpLaj?=
 =?us-ascii?Q?07qS47C6adcQ3Gp+QL8W0EDbz0VGZcRQ4laYQfhrayRi9ezaYPmivf3BIz2M?=
 =?us-ascii?Q?yUQa6eAFbN+dzlhVyESbkdzjtq6gIRWAM6heZiH2np10dqlCBl20vx2BRyk0?=
 =?us-ascii?Q?W0gxnD7HenX626X/eM5IEUQJ1VDz7jMZDd3y+pKBzJsvRDrCqGmCWUstgznl?=
 =?us-ascii?Q?/eNnlJRbfRLPc2s605OsQp9i8FRBfNsSlDXO/MISf9Hn1VKSiT3CstFn7eQL?=
 =?us-ascii?Q?txAVbBmuM6c1B6bGUkMTmHJVvaA2FhT0Cu4gi0opXirCfgT5vKFN5iwjCyhD?=
 =?us-ascii?Q?oWQgcoYyaFCxU9LZxwBg5FBLqMkPSqxf/npWxv0cfXzYkBoab15028mQpuTo?=
 =?us-ascii?Q?jSDckQq0iczQ5S7iZp3MzbQqxbxi9aY6aIRr9Tln44+n9IQv+TPw/b9kuNnZ?=
 =?us-ascii?Q?+w0wCR2/LYE88bRcGb8HQuHVhKpNG8mrcEP5XcCI8Kz41L7KPKeGGxhL9FIE?=
 =?us-ascii?Q?8+9cnKTrT3GTgg2nkEgg5TqBajXQ+h8qGaizEPMbvpaushKmdw/0Fz/lRLBh?=
 =?us-ascii?Q?v9lU5cqOUIUMy6HE/AelOASG+FOkuDhKsk5KmD84hjH2wEOzKDA26o8fgdlf?=
 =?us-ascii?Q?JCADJ0s1H4GVNMTr2IHpUwuewUc9Rt5/Nj+I5Duu/eTIRPMO0NGiTAPkXx7U?=
 =?us-ascii?Q?6KxE1ke5mpgbxWryNajyzjpKMzUQkafBFBww55m2KVo/Fj2+bjO8RDHUm+js?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 997532e2-2031-428c-f3de-08dbfd01c766
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 00:07:08.6511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qotQNZ5NkpV5NzeZJLKXBuy29G3C0NeiCsHziooiwxLezUWtnQKS+GVyRwa/L9M8YuDl+UDxFacbOs9qDT8w5DwN96Tf4Y9syCeCf5yqrCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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

On Thu, Dec 14, 2023 at 08:27:47PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Trivial register cleanups
> URL   : https://patchwork.freedesktop.org/series/127829/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c_BAT -> xe-pw-127829v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Lucas for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-127829v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
>     - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#906]) +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:
>     - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html
> 
>   
>   [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c -> xe-pw-127829v1
> 
>   IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c: e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c
>   xe-pw-127829v1: 127829v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
