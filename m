Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB3C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10289208;
	Thu, 14 Dec 2023 22:06:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105FF89208
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702591613; x=1734127613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wAYq0FD1q6EbiuIjECs4u4xIDvy7xwDh01xxMGijqG4=;
 b=FmsnFbrB0ZZr1owOzeCCsyVDFQ6rCle5MAQxGDid2U4LBadnQ9StrHX5
 xj0Ir9yoZ/n63Biy+x1go0mWmLDo3mCOtdMf3K3UJAiS/5N2Z4EtlVGg5
 H9I+AYkjDmkDA8CJQoGYAtet/iAglT06HThgP1LPbQ9lw0OZWneLjxs1a
 xSTbMw6kJbPM7vF8Wh0f2ilAP2eWcyKhDTy1Am33ck4bBhFRM4qK+Q7Ml
 lQmhUHCmRBuB6d3h+slTCt/o2c6EpB/DEtE6uApcbJDQiNrwuNvaFm1TG
 tJqrqJIq792OJQ7mVBBmpD/jVK3elQoqIALFrAqpNOobWpjHDz5scMHkZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="481385106"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="481385106"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:06:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892645111"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892645111"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:06:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:06:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:06:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:06:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn36q2+x6jfbianCZvurJV7Ofjpm0/NSkwMrM9inh4/OQb0lihwcwkpske8XInle8ZMVGngC2ROBrAW3zcpzp7nshdx2lO9Yre3R168ZOg/44ohc3Q3WriV+t0xbJ4bXeNeDRByZG0GLDeFuT3ewgv7ntddC9b6GVKBSPlrgjVyBeKOKw1ZqW5vpE11uYPPB7rxZTJjff1SoAj1xNxg0J62PW+4eIo7O0GsLRYGYD0RTwAnCCudlChz4vh6ixhet3hgKjBIjmDOlqWsn+zRUpOCET/TJhwm5hYLUc99siCPYrzTzjI9COggnfJMv1UjRQKqtUyamanMAWMSuaX8I4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyjk5cRb7pHlZFI90nsMG2VJsF8sup9YTikezhDq3WA=;
 b=SG8qs5SWVa4ZYJsQTnDgX3hSOc5o1KOMMwK674Y1mDSkK0pIFErNC99EkXkyRspjzzA00MC1gMSB/sFu18LWU+0+pTooCBnGeV5r3DvQBItGGBu9bY71zydCH9oEBaP04r4HLi8cYBGpLbGiSV48EvXi+jLXtmyx3g+E7rfHuZMbAY0rSz5vyeZRYgVf3/DX9wXp/c+/IWiTG7azjvp7Fo91ydaFqsoBIlDqUtcLoH2jMuw5g7vvJEwJewwCjiBOlkNI+PHxwHtV129d8UO9Oty61VHddwILZdjhR0iHLuVdXQv8ZSanJtP/ShDFJorEb8I+3iK6BhfyZvaIQImWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:06:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:06:48 +0000
Date: Thu, 14 Dec 2023 16:06:43 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 5/8] drm/xe: Move GSC HECI base offsets out of register
 header
Message-ID: <mst66w7asy6tokfkoy47kh6jkpx574dvzfvysyavyvqiygqxog@erpw73wwhvs4>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-15-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-15-matthew.d.roper@intel.com>
X-ClientProxiedBy: YT4PR01CA0305.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c215d69-2cc4-442c-8527-08dbfcf0f7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFM4eqHfA2IN9M2VFthSB9+PDsQ7fOgLMZVvRXVxm51KaeKtHMZbBan8VoE22CrxuacB2N9pWQrPXG0/6PpVvPtOQHJArupd2G1G41XE9Ex7JhdKgD01hFKWfSLe363PrATMi2I2oIsaVmhRuborwzEdLfq0PIfl/krXxnrAmQbhkuW2KEHnh/Oa3m7eCe33ApGUM4rwSOzT8327jlBjqFVinVAWvAb+td/spBrhIDxvJeMUXkKCk4GYfVcdS7e3tDjqmQHvLB8BqRRH9rIkKJXeMmU6QWfR3JvhtlhFC0RkosvB2hbdUvdZLjKQC0NVIA/+f7X05CN5PDtBUWSCAr7wa1jYTBzRMoDpmMJzJQ2+DBLAlzdeyw1ZL9i8G0Sazqnc1jzpB10na1GtcCINE/awoafoBxdbkBTUmLob/Zusw/Q499cz/XN64/4Y47uyuL48vUmu5ty5TtjYlf9KgvVnjPXJMp5g/GfkrOR2NkysRqWSOwdur4sMyCv+MkDFN1OAYEmQnyPb25/tDuSu7LUgGdwaBMCSkvJMTTYNnCmq0gRR5IALBahcN0cQdiU+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(396003)(136003)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(33716001)(6666004)(8936002)(6506007)(9686003)(6512007)(8676002)(6862004)(4326008)(38100700002)(82960400001)(86362001)(5660300002)(26005)(316002)(478600001)(66946007)(66556008)(66476007)(41300700001)(6636002)(4744005)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKeiOSGYnmkOjQSagq4Ey4L39V89Fu9QuDEBJA2FCxE8x5sBngle44XUE53G?=
 =?us-ascii?Q?6v164SYmf+yd+DlVqSwsU823/MXN9+uvi9o++nnxb7APed5BFOLnXb60Nriu?=
 =?us-ascii?Q?Xn7Uigu/DN5q57o2NjNwE9gFuv+rKgG6iAaScj5quT89iCFY3DcFIJu2kjfT?=
 =?us-ascii?Q?bwGNKf4acNEe0y/2xwzYO8ElWTWvF46NKPpHP4uRQ3mzk6O7cJSToT8EcivJ?=
 =?us-ascii?Q?64EstUQBHQbJBVXj/OByNJ2cT/ItKnxw6VtdXr+s3NSlYaYYAi3KZB8w6BB8?=
 =?us-ascii?Q?/RzR4mts1M+dRBUmo9t82RrB8/pphS4mdULoyVkcDXW60iCb0EBTUFLI06/i?=
 =?us-ascii?Q?PL0q6wrwE1ArxZ96mzuG8oCPjVAWjvprlODvPePAnrTpuEXoG/bKrW0R5PlP?=
 =?us-ascii?Q?tt4agFVr8r/SRcQFKZRKx+NXXH93yPtlYL569wpP1WWqrN2R979DCpHyXm1/?=
 =?us-ascii?Q?nKbx2pDSLerG0SD3b3o+IGwuvDL0vlYY9keeSZyH0DUGsiWyVQ8Hn5eYoY6M?=
 =?us-ascii?Q?9ovSCD32bWlJJgRWblIwuV4+7JzFOjDctSH6JoKnHA4EXyU28a2w2lkYk8lV?=
 =?us-ascii?Q?PavDIQCxKE40LWfDLlHakk3x/4hToLNXYyWYducPaKQaDLKIg+l4NgGPSBUd?=
 =?us-ascii?Q?XF4+Jdt+5f6op/CvMUwZXk/mKXAznmEW4rDxbzXWGm00UXtOrajodxjM/RQT?=
 =?us-ascii?Q?oQcr29wk/u/kwqEmBS/pHCDrz1GmzIG9+86aNSdQW7Z1To9z8VAFbe0FcChl?=
 =?us-ascii?Q?r8ueqq4DkMAkYhCvph1tc4Vl5TaziIR7gl1ghLkdC2OeWkyMFIecw5lXYJt5?=
 =?us-ascii?Q?f+WmIFJG3DbS7w7CW51pGowuoM5kN6tLiD+0G4hs65VWaSqN/1T3vPgqhXh1?=
 =?us-ascii?Q?A9ywlxSDMsP6Xldf/alMHsbdB2c7lGIvT51OKzjA6ehLHyxgqh4NKhi24nB0?=
 =?us-ascii?Q?Q3hIgZS9h9W2Lgxiv1+dzdlBnz8TSfbkGGdDmj0nqNZAJzEC2r0Nw9jZSjtq?=
 =?us-ascii?Q?5kYbJezPfqkW9hSTiuSGKpWibXoDRDctH4mlJpfUg9rWlRl8UaqEi2f7XncV?=
 =?us-ascii?Q?6Lfuiw1VXzQq4tLCFUE3gIwjwGCHV1kNTB85xRtUKVJ4+Pz6bfylFECxPRSu?=
 =?us-ascii?Q?6wFX1hx9V9F7YG1XPZ66z4JKGFSfyINU+6PlXVIT6x0HSit8yyoGnEElbeBU?=
 =?us-ascii?Q?wQWwokPeXQQJpE6meJoYgdNbjfpZfW4ypCKrRzlFYj3NpX+Ej54mTZcJpIBv?=
 =?us-ascii?Q?9+5y21C5CLvTfUZE8xtdedaS8lFDc23IArTLMfWgTiyEdz/0G9aDf1lSaZFT?=
 =?us-ascii?Q?K37XnxUJKWpugO2+1QAv6tTNQVBpuQSDQtjJmRj1OQMtV3sHFP1agY6MoGyJ?=
 =?us-ascii?Q?JZ+S02X+3XfjOrIGZDmNRhfiyigtSNpRFcHNepE7mT9WCJtWNLDTikYzgmQy?=
 =?us-ascii?Q?VFKWB09p2N4vOlHNOJWp65SsG3gA7zXgCPzuGijEzAA+tn5vTTQq/WsY5NXG?=
 =?us-ascii?Q?7o9NYFbsvACmTnn8VIZwgxlnbM5G4aJrQ8SRZI0manxW/GCvjl526RqmdISk?=
 =?us-ascii?Q?BL6kjQUGs7/aRkJS07jmDI/BVc7BFPS8uRQxneWB/REQUrZ3jnfL+yeWVlp6?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c215d69-2cc4-442c-8527-08dbfcf0f7c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:06:48.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjDMbhKf/Qv0tUEbOr9Of/xFAfy/oJRo7GvdM9EyMlKZgAk8NxWqn9GHOGZxn6TcdpuUpVvieCgd/NvAKOlYpAvsT1rZYI/yNN39rz+uulM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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

On Thu, Dec 14, 2023 at 10:47:05AM -0800, Matt Roper wrote:
>These offsets are only used to setup the auxiliary device BAR
>information and are never used for driver read/write operations.  Move
>them to the GSC HECI file where they're actually used.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
