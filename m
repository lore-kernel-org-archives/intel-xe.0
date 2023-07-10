Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7573CEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 13:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0410E0EF;
	Mon, 10 Jul 2023 13:43:20 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6445410E163
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688996598; x=1720532598;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D9mLmdtxqti4wvnTM1iqfdR5/8B1/4NaR+yyrAmi2lQ=;
 b=T5lPV+TXnpANTgeNLtsJZV5sXDNpJK8KFWmmzC6FOUVE+CtIB/+t0bUb
 2gU3VE9r3/1wzkDFDWv9IMyhV2JhoXgQgE7ahtG5XP5EnjaxNqys00jvM
 +jl4DQiRmveOnVWrYZK3XQg03gWmOt9z82TskuBe8dTuAftS3oxEL+Yp1
 JHqntrX5vbfmde54c102pl5yBXRMdFWy9/ah8ic1xiDAdf3Du3UhZYaUr
 vp2oAw6wJpiLghIPt+tS9sVIOjIKfMUOCSefgSYJAiQarIuzcTd1WX30s
 1FxhPTy408xhq5Hso8K8PJUrHSGoKZOrX60+x8tbhw9C9dvUcRmYJvr78 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="366919651"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="366919651"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 06:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="714804975"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="714804975"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 10 Jul 2023 06:43:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 06:43:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 06:43:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 06:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzY1W4CZU37IqugbjaUeVoR/6nh80EXszCcCXOjPl2WmPKkFGQVa/CKGXHlqWnp9MnLoye0ZU+bOisco/zmq4FtmdO1NZ/kTqGoPKhywrb+IdUAW70BBBbYIgX7WhgXNE2AlnZZCKlYxk5UqH35Jn41R7EABKmBaZOMrzsb7eTDSep4ikVirof46nlFqEQD/l5Mjrq0rkBOUS+lW2OulJkd1x5XsO02XuvcIYCKXlLD9DLgdGm3Yd5FsgN0QUZhd1JV9zFeXn8o/pe2D8xUinzFNpfqa8SBYcH7Zv3uyNHcgKJoCFgt+NnwuMRvFKg/CdHRRjimWMEKAQf3z4bQ8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ywk1j4EYLApYzZVUB77RgIKlYttMGLI1KEiwBuVEuE=;
 b=RKmfFinkY8gciNIYD1uuZ1RUMln1E0Iwrf/6QaaNLtHG0hZiw5ckSD73srsrKDMnaBJZ77eOYwmGe+nis9sCVgjA0cEEcj64hIOM0jH7P6kncE1suhbHJQMILAoXTqkRxWZqhBUCZCk4pfCLz7ySob/ph/o1P03YqLCNnqmfV7BmkwHwGDGBtYX2+TEQPwcpFIzi4+f7cU6iUt1PrGxVSM4pKJ4cZ40uMW2M95Uuw/h8NCJEY90Ygbj/lONU+2V9YAlMOFR35YDQwpdnp2mjPBjYXrAInhi/LTUXP4rnT7+224Qn/WZRSxHrKZ/5NC9gSmAy4Yqf/eM6u5jj+uDnSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 13:43:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 13:43:09 +0000
Date: Mon, 10 Jul 2023 13:42:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKwKw9qS8ddUE+Gh@DUT025-TGLU.fm.intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
 <20230710094037.28179-23-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230710094037.28179-23-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: de49dc23-379c-4712-3dc7-08db814b98d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzFBXHc7YwWa58c894vEY0ssY4IvjnxFUDXcWuBuOzhfwp7KKJkUERfe7Gs5xc9Fk7mSFBXBApEs5Qbg1UZciKTXotlNvemrnXSZUtiHNI95R0CtEGqVAk0++2ruF/HgRzdV6EogqZTAIMZ/WoRIYk92gO1qmZaxNP4WBwJTnb1AdQEiy2dJSlM524hp3B8ZAESvb/T1vD1RzfLVwSHlld83yLiVC0YLnzPcEaQ1NHp6xyVCOAgRUzNsKZPr/J4V6ywt/84acVIXGzS9CCmYB8jt2o7q69xE9WYLkB0pWjKuyPEus9vVFjOi6cLP+2ddu7RjddfZz4afvFXbf4ALcuqTC5Mir7u1gMWxcFxcrKywG5ZDXZKt98I0uCfDT925HgB0jt4x/eFDV5n1Q736k1RLwgT9XY+R+Nt/XfcKnrIMZcT5nVz+XMR+Yg7fU5Hhz7mzVgZQSo/5SM37uxlK72VUJF6rhEj1LR6Uw3Fcqb4YqRLfm2k2uQ7Z5CYMtCYA9JC60e+zQ4H6SeNcnU7xGYJga1F478ubfvBWvugy+xVe8pE1iSLIYZc0AnjgpuDi4G+jVRCXGcANaUM+mLOqqpQzTmFxaMvexOgaBYlKF6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(86362001)(38100700002)(6666004)(6486002)(54906003)(82960400001)(107886003)(26005)(6506007)(186003)(6512007)(44832011)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(6862004)(66476007)(8676002)(4326008)(6636002)(41300700001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5Sh8SA7dTrMjZdbY9spMC0ZyGN97Ia0t2s5NJ9DH9BP/pK8YRmLA6Be4D+?=
 =?iso-8859-1?Q?dpEp7mYzfy+hBCepAzMusn/58NPfpcniaoNCJ9FWbIC9iowfErmQKRfqJ+?=
 =?iso-8859-1?Q?fQCzvJ+SeENCNy2Z958x18ziRzQ8SJINC93VGJ5PUuYfdJr/2NxDMWOAbV?=
 =?iso-8859-1?Q?8Vr1jG6yiTT0Ajmb9SqkSOWhatHxsW85nWE3L3SV8E6n99YoEumVYo+SZS?=
 =?iso-8859-1?Q?n2oUpORxg5qvVLwEM9CJ9k2w1XlBGYmxasB1G78pBK8H2LPH2rVlkYgDkt?=
 =?iso-8859-1?Q?DVC2fXcA6rcIaXvIvFr6kfS8okZEmNNPwh6QSsNzC7CgvLz5Ht/Ji+3FIJ?=
 =?iso-8859-1?Q?ITp6pEqdyCOWlmRrqQ4GQQVZwKETY853pQbBWFAlwjdOw3jUbEvnKRsEZu?=
 =?iso-8859-1?Q?8r1/EtgQWsHdqIq6ln4xjCeMI7CUdSKqvVXNnUfpJQFGRaDktRlGUn/rt2?=
 =?iso-8859-1?Q?7mFdEHvom/LxIchYg5Y75FD9w2behDTiTQ5dxV9CTEXcof0aTpof/ipRhR?=
 =?iso-8859-1?Q?gQlqxWz7YiCjzUubZBPneMaJ2KTxkPr8CBS/tuKSFFi+jpTG9dMh7thOXS?=
 =?iso-8859-1?Q?UkotYfr4h6SGSSWGqsWdMqvxFomBYTCN5iAlLBPChBSnhVpY7+43C4BSic?=
 =?iso-8859-1?Q?VnMiDS7rb+oTZ9tEoygqTT1UApZYQmGUF50qN/PWzbXvxuDEUeSzMqZEZZ?=
 =?iso-8859-1?Q?6KbQmSje2C0Aft68xClqwET8za1clc3S5AU3Dh8xf2ccqM2F1C68wViP/t?=
 =?iso-8859-1?Q?hp7TgIcD3Plth/3irqLAUexuEu+SI7aoFQyFuOXwK3jKD3FuIafrRG4fDI?=
 =?iso-8859-1?Q?PM/flAOBxk4tnQkbsH6wTB80hRFmxCvBbSXCEZg50pkM6SPMhjW13GUU52?=
 =?iso-8859-1?Q?VV09ZxBxdLRTBchW0oDMauM1/mgweg4n3mslYkjhPw7huGrFDjFfNb1AjB?=
 =?iso-8859-1?Q?aGtoJdJGBfII2uuAldIzj0UOE1LmRjjqJKMGPnn7E4rBuRbacpA8ncpmMs?=
 =?iso-8859-1?Q?ES3zhHfX9tPvwGFHynvIGmMyT3xGnblAEld9lahyyma91vqhOP8lEgXH9C?=
 =?iso-8859-1?Q?/Mblo2AioiK+ZTPDFkwNEH08jawwKpeBBRNKl6XHbrBFL6HVivv+xqqp5D?=
 =?iso-8859-1?Q?AhNcD6TDTbmsLFrt7tWsKzQBMk8Xvi2tDXmvRL0GuZmzTu9yrk4DZWxDI5?=
 =?iso-8859-1?Q?Cck6fRJmQafmSBGlaOjqsTNX/HkAS01sxdcIN5q/bZSM9DUEyo87uxM3qQ?=
 =?iso-8859-1?Q?3yTcB8RldF+hKU4vVomhrIDjFjAwYM8DGeiL1LOmq2jUdPnAaqgItRc0B9?=
 =?iso-8859-1?Q?UdRSusQezOxvclvzlBtCfDUP6GMwJyj/pwAK7eq+uAstYCjmc0xV74REhP?=
 =?iso-8859-1?Q?VRZXgsd67KcgYa1uNrTiWUfCN25YbPgHHW7vrFf27zva8l5jZepXeITvEo?=
 =?iso-8859-1?Q?xDn5C+369pzIMz8qTNVHCjoUTj3HH/+K1lQ8kRWnE6CTfZFaThTmmTeSLF?=
 =?iso-8859-1?Q?CitCkd+BMAnvrustvyZGQrgTMMbyThG2S3m/PoL0ZmTq6iYpFZiytBeQMM?=
 =?iso-8859-1?Q?JTXWQ2hM0H7ovp4i/PgQ7ICm/D7OA7Gp/LRLE+VG8xQB029SGxqRN8tdHV?=
 =?iso-8859-1?Q?aqYl28Y5Fw5L5EaScoxezbCGMO05IA/zfyy3qf42sAzzgB9yQ8ITzsTQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de49dc23-379c-4712-3dc7-08db814b98d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 13:43:09.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/iWKSzgl8adJD8M1oewLhW6RJhzl4hW9tNGMuceA6C2Flin8DLSkOEtnvh+uaRuXlq68fJR79iETR76hqxsaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 10/11] drm/xe/ct: update g2h outstanding
 for CTB capture
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 10:40:48AM +0100, Matthew Auld wrote:
> Looks to always to be zero when inspecting the CTB dump.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index acf488b00b66..0b086d17c083 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1219,6 +1219,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  
>  	if (ct->enabled) {
>  		snapshot->ct_enabled = true;
> +		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
>  					 &snapshot->h2g, atomic);
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> -- 
> 2.41.0
> 
