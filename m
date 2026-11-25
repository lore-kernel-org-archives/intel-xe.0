Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F13606A682
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XQ6D6IgL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Xi9cJyTn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A4910FEC9;
	Wed, 25 Nov 2026 18:14:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70EA10FED1
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795630467; x=1827166467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9X2i/0i2y0NIWceaE1xN5nhIixmDrry7Hk1F8KVM3jQ=;
 b=XQ6D6IgLkoEoezRNgvQkejI8c0JkuiZ/zFiwg4DH7So+TiXsGQ8nDOHy
 7HlCgxmlwaEddWgF1YpRYCpTeJdz8sUnvMJ5TXRhbN08k/QEY/rEiacTK
 1C9r/DfMGS8OeykvolvcMouFi7ghi+147i5bNg4Fk0czeUzueXLENRHb5
 9CL2aTMA4/x5+KsxG5d2jJ0ZHjjZ3onH4QdPiEQS8rneG+og6mf3ZBS5s
 mjjeNOsHeCNFSDYcteKnPYgHLpYiXkXoqs+M1XPxaAuxQLmkiGoxmECET
 li9VPCrBOF6yQFqfeWv6nf258J5DjCT+TyEKcRrOW031TWPLtMUGXIRxS w==;
X-CSE-ConnectionGUID: xDRuBqQ4RC+xSmcWjdh46Q==
X-CSE-MsgGUID: gKt6bdhxSR2iVKcApy4RZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4403299"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4403299"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 09:10:59 -0800
X-CSE-ConnectionGUID: GG3ydNwhSiuMI7WKlFzBWg==
X-CSE-MsgGUID: mC4SCv30Sy6gBRMt8bKcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12210045"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 09:10:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 09:10:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 09:10:57 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 09:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cq9jE5Pm+WaAIsnYRXWLb8CUyegoJXRmdVan4FJ1T6tjS/yPxLQoFSLHHcAvPVc4i5t9+7hnhCvEAhrTSLnoZkR2aiY1mupqXIMfSWw1r4NmL1p8MmorkF1MIOxqlp/reWM2wHG9DOV46VjO0kaF02G/5BTQT2fiwMenSPDBOdZ684JMkrWXcGa4uIocQbf5kbgfgeIrqEG69+PHuDP4ick7Gk9ExrUDTLpinjMpot12B71MRj/qJyrq0JUutkfK+K/ekrWvnyVqEUJWxYqn8tBLShRPS5OStJ7A0T6Wc62cW2Ei9I/Wid/fwk6Cs2o3IGDiu7lKMeMJpbuA6XM5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFScxsTSoxL3nSDRb5VKqvpFNqJX/zjFyFuRu4b1g7M=;
 b=j484t2pTGYF0K7IZ2NbizV8Prm6oLF2ZFKR9OsU+BY8ZAn3oSSHXg3bq771P/kk65zd2C0oBFsyy/kKKUp68cdc4VtEH9EzqNdVRbSu++bzE8Pz9vfn/bPdy5Zcxd4IkrebmEXwhSh01YLNliAeF52udn66djScnJWybwUU/7jDMr4swWUg7mEV+eD0J0GCAQKujQjUx+JzY4XsI0Y/Ll6j4xD5vXh94tDjn0Bwase7xpHE0VCureBMeKoQ5E/ifCTxM47MVi8g/emQgDOM79BQwfh53ZznETyUTAd7YhIE67ZVTM68U3aWsNd2xPyj00OItnVszEYEHF9J9BxUorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFScxsTSoxL3nSDRb5VKqvpFNqJX/zjFyFuRu4b1g7M=;
 b=Xi9cJyTnGJuFZ8Py1geUoKvhjAJPb1fpJyY/JDtN4GmDIJRXM3PpdqlECFBZkmWErlqvaZL9kJwZ6nNOyfk4YFa0R78aOjsvdi6IiC+DwbM74RugFGuIJ43vFDU6WtCKy24OlwBD6hBUgHk8HBwBdjhTCnrorcJJVDheHodYjQQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:10:32 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:10:31 +0000
Date: Wed, 25 Nov 2026 09:10:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2][CI-ONLY] drm/xe/bo: Fix self-flush deadlock in async
 BO free
Message-ID: <awcWheuLWdYTdXtT@gsse-cloud1.jf.intel.com>
References: <20261122125605.3508411-4-sanjay.kumar.yadav@intel.com>
 <20261122125605.3508411-5-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122125605.3508411-5-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: d411a7ce-ae18-4e81-f594-08df4b170292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|56012099006|11063799006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: 2gArA5abu5i4Dr2cC7l0xDjE/yKcRx0NlesF7ufhHf4ng2jwmrqEhNG/g6i/gVxqn1Mh70RpxT0yGDZjT0/ZZLssltjKvkLnNi5e8tFlbtgamrF1tSDAIkDqUjIM6HmWLEfiqOFECbK8D7KNvaaX2+835igOWTGZr/FH1UjZDHJJKHcrvtS25phGHvudRUhtbo1ZXEmqgXLoCl56oZg7Zl8TqiWW62TCb7WZnr8wO6eiw+M+QNWzVgisIRiODF0k9o4hG1vzY0vP0bkKSKSndjrvO4aaMNly68qmtXeX74dSw6hm56rMXPE+L5xx0zjyAw94P2XtzVhzqUChYOPsd+C6LU6Zq2kxbcfNBOho5XNv1Mjc2/JuyY4/BJzIWoOBHNDgqsDi2+ETs36ll+rzMxe04lfZyeh8MLLeIqeZdjBzvoXwN0xzZ8ZfrPKe1zflE3JhgSmqKpOImKsf5ZclfA21oTBpm7Bf1WSUO7MqWaEnc1tPURMEIuptpQNwxXm9c0FfBihQamN+DxwIlC7LpBRpengC9JJ1+zH3oe9beFKOxGnSqaNLR+KXKNkjvlD/xrojk5bylnStV5Mk5OcfOLhiDRBZ2JmYkKOKxiy8DFmrcJq30CD9eLqrojJXdNRFoadf/lKwvoNWEeAfFdWgWzhf4v+EW1lk1sqxQtxl59w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UgwONcBpwbPGjodC+wIR9S/g2Mo7xbF0DQWCb65SeoATUpJzoUd7AytU3FkE?=
 =?us-ascii?Q?voRBRqA6SyDuuz7rI9M6XsVi7i+XpJ2a1yxD5ix/CB8wCfdeNuGmjtnSI3JO?=
 =?us-ascii?Q?3YsXRxDNyRUPXSoISIwDL+6TW/yd/iIMKiJg0090dKFz2z7e0Khwog5cA+Pn?=
 =?us-ascii?Q?dtbZBlKscAro5TsTQ5JsU5hm2m6fz2Bc4FRZYhnz/0KmSBjm7nGJZzHDaAM2?=
 =?us-ascii?Q?GbqtHRA1EmfS6Cl8ZXqSTWs46L/GO7rMNgHYklnhStLQvJGka3FF92lAi5A9?=
 =?us-ascii?Q?JG8kLA/80WbAjLsIAwp+dSsE4wYj6jyC+vXjrKTLme8saxobJSRpz2ObxS9T?=
 =?us-ascii?Q?PXDSUlcXiv0mn9r/KOaGe6Ni+6NZfYPe7l1El4yjn9dAkl39KI2DoY4gp4M3?=
 =?us-ascii?Q?Jss6PCZdyL4EPVBHwy2d/+pi/oO7u8ZbXtRrp6UtxTQvd9zV/DYvmCv4cgVO?=
 =?us-ascii?Q?DOFQ8mqMPUKJr6IKpk+TLAt5ivnrrWzEJM7yCEfuxmNW4wAMRXk48jwI1y+2?=
 =?us-ascii?Q?Vmokl9x31uW/uBSQaRQ86Pq+t2J8MUTRCUWUvbnVkvDBbO1JI/jBsYzl4Dlg?=
 =?us-ascii?Q?OQw3MRykd16EAlw4KaIcAf/3iy+6e2VKxvLJShYAB2gVwLbS8J5HkmSX88rU?=
 =?us-ascii?Q?186Mah2v2dwipskDvqNnyqvCjCsR5azpwbsaSkAp8NIYDzj++n+6XhZnynIi?=
 =?us-ascii?Q?lbLyH/4Wt445nbyPAJrA6/uytuSqijUlOVepnX3zs08pLKUL0bvU2rurBlkO?=
 =?us-ascii?Q?4FndLhlB01SPJ5Ium7uP6N37lnG9QNTI3M5inGidcHnyR06oQy9QpZYwqK7v?=
 =?us-ascii?Q?0nPdtrMW2pC+I9khZN4Xn/2k0nfyxQFUoQnv4p2IXUJ/ikAGNGQ4n+SP7gRY?=
 =?us-ascii?Q?TBpaN+MniJdTcZ5d+IZqRkTqbFAVn4hcaywvNiPxs44KdR1AO/4Rcvd+21v9?=
 =?us-ascii?Q?OU5oMWAI0GeqeihOUDSwxLppXZLZ8+h/xHBFi7VQAaq+OGp+NyXL0aCPRIJ/?=
 =?us-ascii?Q?3vV4Ej8nBAgj2cf3OvAjdKJOkL3gWRrVjIQ0x9LJIZ6KHcmVlmOh0FjWjt2h?=
 =?us-ascii?Q?gDCca3ucX6rDHoiYseLpkx787gxD90b11zZ+Td6Yy4bfz08qsEE+e0xdaAf4?=
 =?us-ascii?Q?ESdqXb2QzBOn9tWKZDWLjLEuXXKXTnaNjGBeGH+yXixF41tXcK8bv+ZzKzQn?=
 =?us-ascii?Q?ADNGT1eF3o2MUhhI9R3CmveSYpIj5LBjgJYwMJGjMrQOKGFFyuhptXRwn34R?=
 =?us-ascii?Q?ujMHyZ1axtW/hkmYPqkWhKjFYp4g26yH9hXuttYHFZGWdFr79QtUklCAjiNT?=
 =?us-ascii?Q?7yA0q7EfBeyrVnqlSCvHjSgnC12JmR5Gdu/25Bncd4L97MJoD5dZS+1rm7DV?=
 =?us-ascii?Q?8GLfYvSC+lcw/wKLCbOvm+oSrgYxOyf5cQFjAXnrN+65NZjLZz7nj5khvCYC?=
 =?us-ascii?Q?TdMjX2FfTQgU7rRRbFwL6l1WrZNVindRVmbVbu5xBvuHvhcqlxC4Lbqje0gY?=
 =?us-ascii?Q?ZRaujOBRfn8+yE76Lc7o0Tf/jAFarB/5tKsTq5AOj7NmbtczFba5lQJGp+m1?=
 =?us-ascii?Q?jgK3Mbusc0Tji353sLEjLnI6/v4Csh8arRMw2KgFCU8jIKozhbmYpDmbr6pW?=
 =?us-ascii?Q?0VxlaoS2/Y+AhUWt06Wmpo+Ys/bJcIF7RO/RfhKXzM7KwsRIPTOU/+Ku0mOe?=
 =?us-ascii?Q?HhihPRhWv696jE4otgRxASqpIHX5JRRKSKWs4uIBHm3cNiBy1hgCLTqgvgcf?=
 =?us-ascii?Q?IEcAQxYaBgtyXsv3JmwXsmrmIPDvHcE=3D?=
X-Exchange-RoutingPolicyChecked: gDm0mNsL6MQRu/JlXpi7A73a24sHvAbWivALqBbALWIrumq8E20GAxJBzMfQXyVXHeYFYQB5Y8+Z5InHXRZsEuTtrblSE4c+R6g3+t2UUX1DPH4gWBqfyJOdvj3K4P8VaLQ6gyAr9kyEGfLF0n6jNU28IEFeYAHhQfRUeM+hgFmu8socGj+f5syGzj30rjOUwFdugf+ZKYh1uALS4ZU+jYCkjfhthBuqO8d+Wlo1aGgBUOdrG3uIgmfWUsAnmvwK/T4pgrS7zS+69hQAl/5GqJIw/wQZ3gqFersXaNu612K0iktvIvViF9cvb4JCHGrktO8Mz45c14b0JcDJYLlh9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d411a7ce-ae18-4e81-f594-08df4b170292
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:10:31.1015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqfUlMeG9zKnkaOkIvp3LFZbkpWwVX5jYyO3NfHbCRf9QMaLrFplt/OFd/47wa+BhHA/QUvbR/kakihaZ2b/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 06:26:07PM +0530, Sanjay Yadav wrote:
> The async BO free worker can drop the last reference to a page-table
> BO, which puts the VM and, via drm_gpuvm_free(), possibly the last
> drm_device reference. Device teardown then runs from the worker and
> xe_bo_dev_fini() calls flush_work() on the running work, deadlocking.
> 

What if anytime we added a BO to &bo_device->async_list, we call
drm_dev_get and then drop in when we remove it from the list?

Then just delete flush_work in xe_bo_dev_fini and convert it to an
assert &bo_device->async_list is empty.

Matt

> Hold a device reference across xe_bo_put_commit() so that the final
> put happens only after the list is processed, and when
> xe_bo_dev_fini() is called from the worker itself, cancel any requeued
> instance and free the pending BOs inline instead of flushing.
> 
> Fixes: 0e33330f1238 ("drm/xe: Add struct xe_pt_job_ops")
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a..dc78f5f49e35 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -4157,8 +4157,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  static void xe_bo_dev_work_func(struct work_struct *work)
>  {
>  	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
> +	struct xe_device *xe = container_of(bo_dev, struct xe_device, bo_device);
> +	/*
> +	 * Freeing a BO may drop the last VM reference, and with it the last
> +	 * device reference. Hold a device reference while freeing so that
> +	 * the final put, if any, happens only after the whole list has been
> +	 * processed. The refcount is already zero if xe_bo_dev_fini() is
> +	 * flushing this work from another context.
> +	 */
> +	bool dev_ref = kref_get_unless_zero(&xe->drm.ref);
>  
>  	xe_bo_put_commit(&bo_dev->async_list);
> +
> +	if (dev_ref)
> +		drm_dev_put(&xe->drm);
>  }
>  
>  /**
> @@ -4176,7 +4188,17 @@ void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
>   */
>  void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
>  {
> -	flush_work(&bo_dev->async_free);
> +	/*
> +	 * The final device put may come from xe_bo_dev_work_func() itself,
> +	 * where flushing would wait on ourselves. The work may have been
> +	 * requeued meanwhile, so cancel it and free the pending BOs here.
> +	 */
> +	if (current_work() == &bo_dev->async_free) {
> +		cancel_work(&bo_dev->async_free);
> +		xe_bo_put_commit(&bo_dev->async_list);
> +	} else {
> +		flush_work(&bo_dev->async_free);
> +	}
>  }
>  
>  void xe_bo_put(struct xe_bo *bo)
> -- 
> 2.52.0
> 
