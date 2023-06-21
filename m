Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BACEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 22:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D2C10E063;
	Wed, 21 Jun 2023 22:23:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CD710E063
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687386234; x=1718922234;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TlM1XNwsx1N2EX6HDiIgPwOlIiOih3I6/K6h79EtkGc=;
 b=Syd2PkAgbr/wObuOOiED9jxMT/xI4p88fg+cwajQuFM+QDyvt5fsguuQ
 mtDedp3s1eZVeJowI6d8FvCvnKDVKCDSK/vl55bdHB+DZ1BLdmhRZtzop
 STr2WNelNFi2YCOeCT0vXV91cH7wqcxbVYo30KMkzj3JK05PeKZLfGX1W
 bCDVUmECtYA8QCSSpHWWqhE2gzuXMQCVxcevoHZRcEW0BFbe8WXVFoAlQ
 60i1sc4LtV9PMFvTT3QIrXxeWNXCk4Tl7cqxlqJwypB0i3iilNBf1mrHf
 3s+vFkCc0dkeWL3G7UwKadCtnMPKtvBTaXCAXDbkaXTwh9Ru5GHNsc7He g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360339404"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="360339404"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 15:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1044903946"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="1044903946"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2023 15:23:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 15:23:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 15:23:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 15:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvveRlNqAZcWcu/s15tPhe2Ddk3wveZt76alvYXKa4kp9h32TpbXPa6evbZPXZWenn9/WNrZeFVJgFy7jL0KOh/z+9Oy3hMvn+WUMkjjZqxj9sujqkiOzLBz8ItY6ibzrwXwnaWqaBfLGf7k9DaRmxFLgQz5bUjbLyL4LFU4jcC/7g42y8u8I6MWg5BWdwp3p21EDejIvMQLgzVnj91n9k5bNNuhrGXpcGwfZqRxGQ/DdVe1MhBx+s72c0OVY+FyBlNYvGQ+2EJaJvmS4f3vg81CLrKSY4i3tT2NDC1mYjUeJrxrAT6jkX87I+tKQ7w0Be5Oxr1/gbF2CA27B6kXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaFK49aDiiKAOW8zjjE59Eha7g9YzrjN5qnTBQq8KUw=;
 b=CpieetNiTiQJKnfairmHe8hLC3FjBIu1drMkDoaUDUygoxExTqNpFsMHwsffJEnew6ATOvWdEzAGBx/SHAN2gsXlpxqOB+oH8FLPih9aIfn3pux02X8PT2eEKFepim0H9lqRnA1TVZVjr9Wx6SXkd5RlKTElZrhU+paHTg11tE7NMmWxpTKg3kCXED0meQd36HGMJXEq3Hpk24whWkCmJe8hblBV5nXKHNAaQf0nLZ+usBOAPEVOoiZMAZ9HXyiP8Uf4bmtVTCaRvIEaAqltCTR/3ckuD9aoBIaDYuQ22pDNvHSQEvDLQOa4hpay3r+v++rbSlSZBTVspLlmGo+7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 22:23:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 22:23:51 +0000
Date: Wed, 21 Jun 2023 22:22:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJN4QDSiWTsl9h+7@DUT025-TGLU.fm.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
 <20230619152222.11733-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230619152222.11733-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0059.namprd17.prod.outlook.com
 (2603:10b6:a03:167::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ae9080-b7d4-46bb-ca72-08db72a63065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7SYv+nMvMv78mMFYu2jmGSuf8pp/3cGz/C7SZV+5DwxnYIkpuAlvv8zt+7MQ7+UqZApoMhiab1Y88LkXPSuMSB4JfV+yNR53oYvvUXDZ1I5aPA7lo6NvoPYTQ9Tfpd5eGTX2Rv9XGjlGUUdTiZNYNLjnNFbfyYwYGb53qE6h0Ubo3Vo8oWEs2UTVdAVGEQrPcufDRaeWPZyq2zWOZ7ABS5Ih5sIwuP4SUBqbo5OaNd0dHcxr6AUKVlDuH6aHJGcWREcHktY6o4oujyrQqsoBNPd8Og+BHN2u0MuQYFa1UABjjCr9K/qutB0WMMDpSo4tsWZCUAEk5oYmvYXubB+8aIsLthfLdGu4hrrpW7FTJE93keSfCiBUt/k9G0dsKFisBVG2nPsxzv9x4/hHMoNnYvBl5HpSiyBAcF7zzDqoTMUDJRlthvgc5d9KeAN2NZrpW7jOYqTDXxQW+R6CGuzt6Cy5Rq6MBRbhbFOJLvD71SYEsCAvF4+aJFF2VmUhvi4pEfHCMLnWNzsMHLwgLeGOQhpgvot8/RpkqNqqlmm0OKn8jblDEKWU+io8XHbgD3WKmvqiBnS1UtaRr4/tyR7OjaldE1TZ2rY5rIxPdhtPwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(83380400001)(2906002)(316002)(186003)(66556008)(66476007)(6512007)(6916009)(66946007)(4326008)(26005)(478600001)(6506007)(8936002)(44832011)(5660300002)(6486002)(41300700001)(8676002)(38100700002)(82960400001)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Uct35P7j2wZ0KXmfVNU60C29bcMDzhcbKP7nlTPE1lyTn/n9E47jsSsFeo?=
 =?iso-8859-1?Q?FgWuttjXO0sVWw/FqPYtypeuT38L8i1yfUtNd7XFB+UtlWYWBoJh9IT2Aj?=
 =?iso-8859-1?Q?R8s9S5u4Nw/IvHLuQcMn50cWOfsd68UmichhJ/pMVS9jU9y2v2P13ELp2M?=
 =?iso-8859-1?Q?2e+PO7dwTl7YXrF9RmYoxM9tkBJzn4JMSBodsHx5XJLwSfJ2RVRBtlPE8B?=
 =?iso-8859-1?Q?wdGPaEc55J43/ypHrAzqJoI6sCkRJsWA9sbxgIdEM0mHDQbkIFbJL1Ywso?=
 =?iso-8859-1?Q?PuRY9F47+TrYidwWpcT46FiP7ZAfb7a0b9R1j3oSN3taOOI8gLYnyL9s9I?=
 =?iso-8859-1?Q?l8vZ4KcJc1xX4sGe3MJCqj41jL4DFxpBQn8mSSMi8EzXjEcBxa9ZqyTpoL?=
 =?iso-8859-1?Q?ZUmu7ssNIj2YtFn/ZCyby9zQ8la9qFvpOzlpIF71ZV2dheJ3BewqjNUTA2?=
 =?iso-8859-1?Q?S02zICo2P0hb5U0kt5p9AF9ZIfT50V2B3ur0GICUsa4sEFGANP1Mj2mM+a?=
 =?iso-8859-1?Q?TTR24A4qKqrXoFcr4pMGi8YMq7Isb2SsheCi0bry6EpV873zdV7FEtIYAZ?=
 =?iso-8859-1?Q?XTxvEHlWZ7M4yZzrfxbed6oxeL/KaGJcGIDdwN6WPxJraPUAh56h74UZxO?=
 =?iso-8859-1?Q?huft+BAn+II+DvDuZxacW09yEAoCgdTrT0UgT5IeeALYMpMVVj2xOdheDL?=
 =?iso-8859-1?Q?PNj0jWVtatrs30SF68vTH2a+94zhtF6uuRO9XoGijd12pKkZcjUJYSbhpF?=
 =?iso-8859-1?Q?Up5JUTyHK46UzIldoH6sm5ev5UtcaqWCJfJU2cvCLv3TtWu2PRAhLJJ87t?=
 =?iso-8859-1?Q?jcPsuedRtJ3yp7mHcr2pxACfaSbGevU0lNfth2lcrx5ez39sPrfiJEN2S3?=
 =?iso-8859-1?Q?cpW811xm2qUySMxvDY56MQWArlCCOboUHMNUTsAP0SR0ARooYVHXZdou7J?=
 =?iso-8859-1?Q?eBMZa8r6AUxOP2RccTVwgXIRsFFHSJhRsRgVG+cFrLJlBQweNQK0dyGt31?=
 =?iso-8859-1?Q?1rCh/r+nT7fW5CXAAqoyXf+odPqgjC5CfGmmCcEa/0Dtbszd4+8EngFdrD?=
 =?iso-8859-1?Q?G0By5fTxL4sxnxuLgeUC9GxBOKgY0ULg5UPKBsdUtYA5G9ZnHkrvMQ5QHl?=
 =?iso-8859-1?Q?KyOei0DbZtiNhTZ3gjzvNCW1+MnsoJrlroXIRyrScqQI1oUwJqs9hj8cCC?=
 =?iso-8859-1?Q?fGE7kNfSRzw7LjMeCd01EDI7iHlUcVUPZiGv+PuFS3ysVy6PIVS6oRJLZo?=
 =?iso-8859-1?Q?i3dLQcwEDxblL6RDoh7dbh/5W08rq/gsWfOlYqMiATpBHksr+0ajRcnNrl?=
 =?iso-8859-1?Q?18Hw3TKfaiKe6a8brSF2AdvXW+xrZQDgUrNpUMeX0uRKglFWgCT9xVQrAC?=
 =?iso-8859-1?Q?xIdMJdMdc2P/pcaeOBIAYzaYgnKn1V2IgOItLWXn0cLSQHJUAFuxDuY6g1?=
 =?iso-8859-1?Q?93Q8Epah1uuqvNtf9tR49R9m2bSMvzpLVEKrpfMWqyWdAOjcdhipOqLyO6?=
 =?iso-8859-1?Q?/pGosFhpfX6wfSiWWZGflSUDZ/WcNGgNOXzdK2EGh8gw13JJL2aqhT6/W9?=
 =?iso-8859-1?Q?oaOocZV14a8ACNeEt4zRFutc6ma5Jue0t4CpjNm5qs+4YDMQObeJed1WqC?=
 =?iso-8859-1?Q?0xkWd1bfRI10JDvxe3ZpogP2swjdOJ4WH1zTcPyvBWgx1zgTOIwvzDRA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ae9080-b7d4-46bb-ca72-08db72a63065
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 22:23:50.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wE3qFK8Yrmne2TuwBHSUmEPqFaV1SFXHJkx67RNuYIQZv6cexrohd836l69d+z5zyW8Ktxiq27OP55KbLd7c+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe/bo: Gracefully handle errors
 from ttm_bo_move_accel_cleanup().
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

On Mon, Jun 19, 2023 at 05:22:20PM +0200, Thomas Hellström wrote:
> The function ttm_bo_move_accel_cleanup() attempts to help pipeline a
> move, and in doing so, needs memory allocations which may fail.
> 
> Rather than failing in a state where the new resource may freed while
> accessed by the copy engine, sync uninterruptible and do a failsafe
> cleanup.
> 
> v2:
> - Don't try to attach the signaled fence on ttm_bo_move_accel_cleanup()
>   error.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cfbcc071f2ef..c95fedc22fdf 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -700,6 +700,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (!move_lacks_source) {
>  			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
>  							true, new_mem);
> +			if (ret) {
> +				dma_fence_wait(fence, false);
> +				ttm_bo_move_null(ttm_bo, new_mem);
> +				ret = 0;
> +			}
>  		} else {
>  			/*
>  			 * ttm_bo_move_accel_cleanup() may blow up if
> -- 
> 2.40.1
> 
