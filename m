Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEEDEB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9D310E80D;
	Tue, 10 Sep 2024 14:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4FtASGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D99110E80D
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725976935; x=1757512935;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ce/GPLRH6W1UewdQpeYeUDgP3JjBr1AMkvy18N4GLbw=;
 b=e4FtASGIhQ4oSIDmvr4BozrQuHHVoqWdVZNGGausuEo/NRDJbmWCz0c8
 y9pFB1aSps223vlPFDvXWSSJ23P2qCykfBD1CJ6hHgj6ali1s1ILJY/f4
 ZJmonokUmIRbN3ceohLulPesqiUoeSFTGMR/CrMxiZTqX+U1UouFkp7hb
 13qM9N1Cq38YiFbWpvhXddW1QJ3xlXYzu2qCaxqyfkXKneA9zPay7+Fai
 evYkqSIz9ckbmcvmJ9jqAVPL5UFmxsD+ZRTyNupxg8hIFpCyYsjrM6tGq
 s6gU6WABKheSQz6XxuaVDjhluZkD9Cdj6XqMLOnT4dfxP92DIGP55Zv7r w==;
X-CSE-ConnectionGUID: kxXhh3jIT/qojiszCiD6Ow==
X-CSE-MsgGUID: OFTushN4RZux/oaOMWcFKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50137026"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="50137026"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:02:13 -0700
X-CSE-ConnectionGUID: edtPsd6FS3ubRopQobNxvw==
X-CSE-MsgGUID: CDh4vGMsTM27MRQriH3GzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67330746"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 07:02:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:02:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:02:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:02:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:02:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGp6bSid5EVqX5G77BpbrV1JIkblJOWPd2d+D/Bafi3RL2JTti9qecwv9lEsOHZnXrk5wo1l3t/yBHXvfjDlfOl3Y8mNcGULbH6KLXrDsox/5ybGZU7+3DU20KfXT2j/JUE1NKiVBZMQUkkwFIHJicxP8CzoXLEuThFbHkyAJXSyf0xNevs2CSV+m4nxUvxhOCbmbnfNzqQHOC4vS/E/dDc7RZhJWbiVQ+zGGsnv0/hq0AqzdEbH1hHXjou2NJ/kIrIZrZyZanU1bSw6XEXLZ9phdUBsOgCw/EnL7VeNfbp9OiJYaxQvgIijFMDdnIhKYj1F1Gs/Te66oufzvoNvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2AMiuMNZyWWvHdmg/Myajq4l4z2GvmCHFRZpynE1QY=;
 b=omS3iwqDZR4WDoeTghwkOXUWgck4guPiiuKijAdmD0oxs4w1FCnHxhKopo+HxzuNktcTMrOL53R7I0xRAPWXOUrbLS/0U64e+bcnwTbdAcv3mn4JmItOcYrG9nGBz6i3EPr1dRnxFIkH6LWGBpBIJlqksLH7dTmv4juHBoU8auHdhlrOYCiBtMYccxIJY427pTtifc4mIzbnnKUfQZgFPD7ifslpUz23RMaREGiLPeCGzK1tH95F1udIiD6V4J5K/vLmlDAVLSW4O+v9ze4PyJa3IwOvSDEpAOZ6K4elDR5zZ2tooib877Gt5EdwXX9iJfTq+BwcUd2yCIC+XctgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 14:02:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 14:02:03 +0000
Date: Tue, 10 Sep 2024 13:59:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Message-ID: <ZuBQ1CGPrZkx5/Eh@DUT025-TGLU.fm.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910131145.136984-8-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 6500920b-8f3b-4e95-f835-08dcd1a125d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?laD771tSlKPfvf6M+l1CyxsktIbEnlRb4adBKlJRWuF7O8MYdT5vJWrzVQ?=
 =?iso-8859-1?Q?4UNBaIufCXIHLHeXfu0QnjoN+PrTTBiPhjB+ftD43pBnHQlzPeW3pJ5YJr?=
 =?iso-8859-1?Q?QeJObIDcDGY4SX4eW0LnEzaZPEFYunsmukqurp/ZEyF5Mlow+74iLLqIrE?=
 =?iso-8859-1?Q?1wtfpmE7/b2YqMLSVdA6Xdes76mtvu7hCnaz2qKwJzjRaEmLo3jyPFuni0?=
 =?iso-8859-1?Q?SIutHDA9uafraXwt5b/Bic0BmV6gVNCdaOlIeUj0t9Ug+7pU7RsH8QirHf?=
 =?iso-8859-1?Q?gl6R5ZolvccMVKX+4tI/gJC4s1s1yfNog3rR8Jv6BAiMe01cpOPQCv2Kt2?=
 =?iso-8859-1?Q?cUCTCTkrThbNMacXrsAmxKQ8RXA3Cjn+WgE+nXeU0Aspv+RZymVS/6E8Tl?=
 =?iso-8859-1?Q?VpjXzJQR6tuR+zqhwQs0a0m0LX0T7xk/mQEQ9+8N+6E84S/hHxewFstcRj?=
 =?iso-8859-1?Q?LYw/aFTv6mXVgKzZBNJNp80CULl8gbq3hG9boEabHvUcfbMtup7amqNjVW?=
 =?iso-8859-1?Q?uun92NluEK1GYyydSp3to00lwf4IsQlgxIjimRFJswTfkIjvHpB2/5pmkv?=
 =?iso-8859-1?Q?cq+AwPPOt4B7hiv15s6FuXc3Dt9j1lyELl+W6ZOSBifq/WEMawxcS3TJBT?=
 =?iso-8859-1?Q?9QTPh3gMxSgq3wAqfO8bGwFMh+Cg2fTyGv3K7gjJSORwLzbm9Vq9YbiCeX?=
 =?iso-8859-1?Q?JpG12vzoZjHKs9SL6u6SNx3A2lPISCl7bR9MOEKmJ+kLKQwhR6clDD4Cyv?=
 =?iso-8859-1?Q?kpVCP4UnlM3Gv0ydqVE3HtWaxvvD5yLKjBPrP3OeEZthnieHDYZTV6ftPs?=
 =?iso-8859-1?Q?nWXlZqZFAEzg4hph2cclt1QxJLswFcNyUPirYQHo5crzsaXUjG5S2nfemE?=
 =?iso-8859-1?Q?tvaPiCix5QjGHqD7Q5dNOzVK3DZru+1A6qOhOSeuZfYN8NB9iB7Ubg0ywC?=
 =?iso-8859-1?Q?t42DeOGklU3xxPMiMkPrHKBQeAuF/6W4EbT+5QUxoATrjXpEt6SvDLeD0f?=
 =?iso-8859-1?Q?maXedPXNXez2+4maXVyqgFdQ1w4HLwtAb4Yvwf8GMhtuIlW8uJczWaqd3Y?=
 =?iso-8859-1?Q?m9vJv6j2k9zrxaZVyOEkSsttwrZ90hS0wz7Nzz7AvnapFIk0H6Qu4ck2wl?=
 =?iso-8859-1?Q?cnwOLyDrOrXQ9IWaIXW5FvbyTsmw4FPAX5P5zh96NeugQA4ScSTBg5NSol?=
 =?iso-8859-1?Q?eQy5cPq0Opj93XYejS8HChvks7Fy098XZmQuQdjSwa5gwT7NgRsA+G6KA2?=
 =?iso-8859-1?Q?97Glmit0yCm/tS6RmNh2rZmsN3zzgBr/qLtFWJ0J7q540xWLmRAFG+k1XM?=
 =?iso-8859-1?Q?XHF2GvYNhPUwg1RYM6KDUrpO3gul9U2jhBbJzM728bKm3VCpiFN4wQGa2R?=
 =?iso-8859-1?Q?H5llQ48KLNHLEr1ZLj06EqrqI09oVV1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?E2hA0d85IxEKGD40TnoT1S5y24wDpMkZHbZ5TpNudqFNCpK1MD5K9Jsw3q?=
 =?iso-8859-1?Q?q5INAJFgaAn4OJkmgjEzKQ2cICFPGKd2YPjrx3meOPPSi4rLLyIw8EGBR7?=
 =?iso-8859-1?Q?Y/JA9bGbkNm6WG1+BWOzMAk9y0+StMJPrdneHCipdn7mRYa2OXB22zpz0F?=
 =?iso-8859-1?Q?xcHV/m8v2Lc/2iYhznqdw0EBaoV3wv//ZxABe04247mC04IVXjnM5PO0mW?=
 =?iso-8859-1?Q?9ImugnkmsyhyaR2hjkgKw3pCLk96shoNwCacLykbAzPUi7ULE36kBx+a84?=
 =?iso-8859-1?Q?8HoOen26Buvwbh+u9rqgXh3HAGst81TaTMaMwLwUcGcNoM5nKOnSahTJaI?=
 =?iso-8859-1?Q?X1mp62+BlYye7XprldZw8pdWvDXjb/aZ4nABU5wJYzCC896BeWmfC6T9Ct?=
 =?iso-8859-1?Q?eG5+lUdM4Oj0Bgz2K49PbsUtCZc5ITCAVvRxDURrz8WExDW6qaSNi9V8Hr?=
 =?iso-8859-1?Q?ldyIeR2Ss6dekEexp0jL/d8Z/7yg70NFtAgMTK8mc76l6FKnQ/Vfr2rvHV?=
 =?iso-8859-1?Q?oNIb1IUUSAuohmfUR2XuqaJsrcd2K6Qn596CIvSo3B1xpqRFOF+clGy0xy?=
 =?iso-8859-1?Q?36njIWTwQDP4M/Y1Fnx8D8qH/iJj2z1hF73SAptkAo7oAtasjk5cc++snQ?=
 =?iso-8859-1?Q?qDNNqznwnBUhehVujyy8zCnMg67qBxmldS2Sz5Yggo+eQodKcqyokq+Cqh?=
 =?iso-8859-1?Q?y51NIMkCnJo9SrjFn6ekpFKoA2QhXQN4GfnY0lsx7KxmQZZX5cVlDV6OwP?=
 =?iso-8859-1?Q?ueQcnIUR2vMgDjW36m4mm7pGCJCGWPUVbyjyHcOeu1k9RejuMfENyT9BRY?=
 =?iso-8859-1?Q?1Is0bP+P3FyAsYDrf7PUa+DaFhwaynSodP4pYv1H1VccborU5MqCveR5VW?=
 =?iso-8859-1?Q?+1Fh+OajpRir6fN2XjDPo41e0+6QuJeEexRa4k2xuziy76/bMPSUL+OWcg?=
 =?iso-8859-1?Q?MhEbZVFsugAmeWiBVMqkiCAGQMtmZD8rHpQQr5J3jjvS6Ei8YRSsgTPJ6q?=
 =?iso-8859-1?Q?wB5oopCmIPAUEsT/nBi/4Ihh8m1ADCRdzpzwpVFrRwK6YY8LyvP06Yhg9Z?=
 =?iso-8859-1?Q?dU9TOv1C7DP6HHUEcryUw2AzqqyBWhJlM7NFXhCou4qZGJCrmoprBTBu1U?=
 =?iso-8859-1?Q?xc38maNJM+XWtcAH9KeNBaXrTo860uihzOuqRaQcMspUzjv9vBhhlME55v?=
 =?iso-8859-1?Q?NaabrV5bLhLQigGUKuI66pLzHTfANe4qOrDbtQiy53Cqa5RJdsTHpQI/wa?=
 =?iso-8859-1?Q?jHahhxOsbBRp+56i/dwwmXFv+BgqCLo2bo6iWemS0vf9jUGYMxSl0RfUk/?=
 =?iso-8859-1?Q?+fchdZttsjEULWadd/5s+wbbg0TG9x4jBN4iMDIaM3AFJaMQCaTOpOI9xI?=
 =?iso-8859-1?Q?wkbU+jhjaqGOsffW+sHFzEhYYVaDdhqacW0r3MHKgfO1RRPFzRjvbWkpI3?=
 =?iso-8859-1?Q?BKTND7I89aifZUfbhDELwLvvKCJwj7MRZfDzrohDmemvNAnWfFpDkzSc1y?=
 =?iso-8859-1?Q?qB7HudZbCAEF20Jldoo4xyd1xZ9hAw7o1CE2Vjp8dB4pMBeQ3s1j4e7HDP?=
 =?iso-8859-1?Q?d9eO4+Vl4YZvAOU1t6OI8SREj1PQaJGoUyV8XyO6qc0Zcsc+ohcukzJZ68?=
 =?iso-8859-1?Q?z14AaVFyLu4tivJ6fkDiw5XEHb1+Et8l1MA3nzhnsnskx1r+oVbPyBew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6500920b-8f3b-4e95-f835-08dcd1a125d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:02:03.5405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAs+AgBb7cCmOxv/rYgldM5EIivslQBs+ZnrZB0PAlRFwcPbHanNWdeSsS+iRK2fejF8n7HplovaZgaVQ7YXCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Tue, Sep 10, 2024 at 02:11:49PM +0100, Matthew Auld wrote:
> If the put() triggers bo destroy then there is at least one potential
> sleeping lock. Also annotate bos_lock and ggtt lock.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h |  6 +-----
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 53948a965404..4176b302c38d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  		drm_gem_object_free(&bo->ttm.base.refcount);
>  }
>  
> +void xe_bo_put(struct xe_bo *bo)

These are helpful but thinking we might need a version without asserts
that can be used in code paths where we know that we have another ref to
the BO. I can already think of a case in the SVM code where this would
be needed. In that version maybe we assert the ref count > 1, granted
that races but probably the best we can there.

What do you think?

Asserts look good though.

Matt

> +{
> +	might_sleep();
> +	if (bo) {
> +#ifdef CONFIG_PROC_FS
> +		if (bo->client)
> +			might_lock(&bo->client->bos_lock);
> +#endif
> +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
> +			might_lock(&bo->ggtt_node->ggtt->lock);
> +		drm_gem_object_put(&bo->ttm.base);
> +	}
> +}
> +
>  /**
>   * xe_bo_dumb_create - Create a dumb bo as backing for a fb
>   * @file_priv: ...
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index dbfb3209615d..6e4be52306df 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>  	return bo;
>  }
>  
> -static inline void xe_bo_put(struct xe_bo *bo)
> -{
> -	if (bo)
> -		drm_gem_object_put(&bo->ttm.base);
> -}
> +void xe_bo_put(struct xe_bo *bo);
>  
>  static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
>  {
> -- 
> 2.46.0
> 
