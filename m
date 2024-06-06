Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84148C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C2010E165;
	Thu,  6 Jun 2024 05:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDJqLf4I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97F610E165
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 05:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717651323; x=1749187323;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aZBd1+w23hVYBHWlFuJvZ+G66kT7dsVhoSp4rGYrWuM=;
 b=PDJqLf4IVE+7je1R27pkYBezFTmE/y+QqjpyP2v7da50osXNk+PTAobj
 9V3PV8nWnB2Ox6wQpZ0BPse7nI4RWSaY79ZQuJOl7YyBIxF+7YOjorqo1
 nCHG4OfqVc5btbCGOe9voP9tGoG466A+0LzoBHLYUk//ZXpTznxN5lW6N
 iVxdgOUTJnYXM6TtruVB/6ygxjh8amuT2c5y5+/pdut1icNrMvsM4axD/
 rWmaSdMItIFAUBc3TYvohgwV5RoseT77/gvrbeoNL3AZfVQhT5IXcQQIA
 0T9LvtBON+yZsRXWtNKzfuTBsdwvw2eVr821Q+ZkslKJ3ON1vOpLFo8gJ A==;
X-CSE-ConnectionGUID: 0qkXl86BRmajDgC/H1WVYw==
X-CSE-MsgGUID: QspxBuIQReKbiFK2Y86KSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14135032"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14135032"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:22:03 -0700
X-CSE-ConnectionGUID: 0EEU7rg1RYqI3Lr8EovQnQ==
X-CSE-MsgGUID: jgXlDqjnQuC9bx79ftzuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38286404"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 22:22:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 22:22:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 22:22:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 22:22:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FW6hyhX5UOChOyFyF0OtIw+Ad+KsDW32ki+iHZr8NqkTxpciAaOHkDx6CWP4kPP4DxfeTRga9UtYMoGOXKuzYfDyrDTxcD2sinoABoTG6gxZLfmiGB3JpkBEbxqj6i7Rfdtvw++XvbmWef5Iv+WYTG5M3kHHpxyNKtNmGBmqIEfRPFX73p2jNUvs4qUhzYUt317Vtvi4wAQv79H+v6nh/CzTwFXQ1r8QTZ39Gj+ZRDEvO9Lfol+KMJaVzvw0U4vUfAj2tpVmSovfQWigHUpUP7EGtGLohR2onYGvIB6zdPYqx5mfYTz5pBdHl0GYvsuF5Vc8UcryABtDtFMqpXH5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0TeA/pIbS1qKXySvRzrtebccMUBmlzDq9YR8DZG5kM=;
 b=nJRyEtyssy8Q41Sx8zccUEqaOffWEE0orSX3AIWBIQRF5Z41HVRnd5bDidUO8dHqzwWQL4e21LcqmXqTirEY7Z7Dls/4kTCGJJHTl6L+n4t/d3VZkG8v8lDOiJbTokx5HqhakF/+w5byMWusWq8E5tjpCt8xEu2Pna+de/F5lYeYuxVqc4REM/48sCDrL+6FAh8/+Gf4Hx3wxFgueSQGl6PO95xfuZ6vdr3Mxvwt1F9bHMA2V0HSJ95auzuTS6HUcMUmV18/8PZ9sNLSe9wiJLVHKNjTv3z7xsCqWBq4Ey1uXdIMf9n3LN2KC2eg/6fH9r2EMv+G17e6HGPFYqEtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8675.namprd11.prod.outlook.com (2603:10b6:408:219::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 05:22:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 05:22:00 +0000
Date: Thu, 6 Jun 2024 00:21:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Do not dereference NULL job->fence in trace points
Message-ID: <6ihxlf3wqtypk53fe3ppldnfw6nqe3qlji4rfpiwqk5szlvczk@h47lvwnjiyjw>
References: <20240605055041.2082074-1-matthew.brost@intel.com>
 <ngmanv6726qo7ggl7w7eb2ifhox3mjvfcug74ljassq224hv6a@edjwmgcr7rmv>
 <ZmElG5XGOt82S/6m@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmElG5XGOt82S/6m@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MWH0EPF00056D09.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bdd440-a211-43fe-c185-08dc85e897c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LEdecRuOlR005Go3ym0N09plU7CxTr1IIoAolS9fKdSQ9hqS6YqIFEIMwr?=
 =?iso-8859-1?Q?ebqNTVYTWmTZv6KQMeTGlui2X7F7p2g/pWkpofRqvZx+kId8f2xprUa9+n?=
 =?iso-8859-1?Q?QwsbKTpbjFMOY1RouYJy+YcE3ym06MKQrWCV3fBY579OnYqd3R1Rsjx5wu?=
 =?iso-8859-1?Q?edJxS83kjXGXJ/T0Oj3vp2N7XAX5ztvPTcul+Ors9lhVHekgSoTwuaTPDI?=
 =?iso-8859-1?Q?JZbk+VvIYFVRvbLzJXRAEIhc6foq+NDaYQGvvPsCgK7FBKfVUNNp7FFOqR?=
 =?iso-8859-1?Q?PP1CswB3GRAObUiFJtH9BrTqiFUIyAps6Y60m+RHFKhCKfMt0JP4RNilV5?=
 =?iso-8859-1?Q?BrqVSVd3ulR7UswCuIBpjS6nydXEFbXfHRNtWjg8a98etj21Fy5GlHIZK5?=
 =?iso-8859-1?Q?UQfvTNSpbTxcNZ0yyXjA7fXj3aScs3lEpLG3j5clYfu87EE3uHxiZhWwND?=
 =?iso-8859-1?Q?IlxJQsw/0kyW/oZmHLm2u85MumLM90WrvLmJQPilwBnNEQ0+azvXhZwDlp?=
 =?iso-8859-1?Q?uEKOd+Odk3nv4wPkHIkE43vswMpsq+STgnQDB1BJtyXWMjppqc7thU5tLa?=
 =?iso-8859-1?Q?w6lmjFilkz/dE5hd0EFwaGWbVc+Lm/NGTmdPESNCTWkB5TtBzYza6Y4Vw7?=
 =?iso-8859-1?Q?wrhe5ypn3GMk5r3ny5jfAsHkwbBCyx+06bDicMpA8vV5IhrhGkqXjvciMW?=
 =?iso-8859-1?Q?X5Bk4D7NJ9SxIl7RC7bQdKzZ2Zkhh9F8qcKD+YzyQWPiJI6REgUhH09I9l?=
 =?iso-8859-1?Q?9tD2d18HKBLtabORauSui0nfwqtt8cWJlDkeno06SLw4PnlvGzcx5V2uhB?=
 =?iso-8859-1?Q?iqsEOPssjxrqIPiA+UbTTZkF6ymvXHaEF0cRokfq+LDzkZE31UZGQw1sAA?=
 =?iso-8859-1?Q?liqGkTsHwFaQ0nrWkYCHFBub1QLZDFhD6uDe/fTprXgjq9TUYsoNcbHosc?=
 =?iso-8859-1?Q?jC4EXjHY9JHbIGwFLccz1KW5lsGp92hkHkyKWkPF9g+QPEoOCVRVSTbije?=
 =?iso-8859-1?Q?Iig4wcfjkjtApWwf99KXYqc562LYPKzOllxqUaJvruTSC4uY3783TDwhDi?=
 =?iso-8859-1?Q?qLytdhATjcufYYw96VvvNQtzq8C7X1BkJtavDvS67XftBiLGGtEk5Zka9G?=
 =?iso-8859-1?Q?zxSl5UkOFVLjz8d8GlQqxizOct1zdn4LPAlCNUQhRPW9B6TeeyrzcLQi4g?=
 =?iso-8859-1?Q?9rDqqKvU+Z28jeuMO0bjCLP0vzrPPiEx+3BbOMzsKGj5M8MzlMmv6eMRx/?=
 =?iso-8859-1?Q?X5Y6F2hXia2HZ2nS9eEe15ux1NTpdDJng8lL8NQvBQ5DRMB+W48l4QSu4B?=
 =?iso-8859-1?Q?DRxolEkd2tD4/WrZVE7pAzeB9H9oa9lyqk/rGmM9MxS6kQEJTFNzFa3zTj?=
 =?iso-8859-1?Q?B4XGO4c29W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2ag0laxPsoawtuZtCjf8wnX0jgdRWUdkx5YMqK4I9q0mpizV8z9IzpW3/e?=
 =?iso-8859-1?Q?txmAeQ4cXgzr8ijvNDpv/31ACnxM3V6hf4tfoQbwEAKzKoPaB0UZHpqcV2?=
 =?iso-8859-1?Q?n6j2xukrmHvh8ksqBfXzxx4S6uWTlFcTBZgQ05FslUD1yxZ+ruRJwcb8XU?=
 =?iso-8859-1?Q?OqpkTJzh8EU5KSSYgogIx+uySBVGFVg5KwAj2CQsSxFjQ+4UhrXlqDgeq2?=
 =?iso-8859-1?Q?FHNidBJ4bxSPOM7Ph+6aCoNcwj+cec77hrDUJOeAkf0nLHRHOAlWma+epg?=
 =?iso-8859-1?Q?xcGA5FGzp1DE6DGWpaOJxxz9t1VtjLVvQPvEZ4JJu4duI4WCxDk+h/LBbO?=
 =?iso-8859-1?Q?W3yEIAYgNd++5jYHdRoUEhhwCjHnQ99G2dOeOAepPACNlXj8ZIsUrcFJGh?=
 =?iso-8859-1?Q?mvFcO3WdqZfM7sJo1RlPWorGZJNbRTkxEQkoyvI9NEZyG5KPCkEEapMXLR?=
 =?iso-8859-1?Q?hpBQBt9QSE16pfQ7gh7eHkElqyWgJdipO8Rqepchsksjzfl4CA9OBaSpx8?=
 =?iso-8859-1?Q?lWZLWEQ58RqamqE4s1oFGzhAuKPRikx+4FO47swlIKBKiB+PJdeZtgXGGA?=
 =?iso-8859-1?Q?v5DhKNZLqgo1zQDBL3wFhBlhKRnvUm6zNkl71CbBp2puN0yF6YChyGLVDR?=
 =?iso-8859-1?Q?uUwqhD/mc0c+ESE++N0L8P+LF5vkcA8IfVwynbhoXv9pxhQQSmOCyFR7kD?=
 =?iso-8859-1?Q?t8m7MADPLORvkvS15BSD1t5k+a4ESdteF9z2n4N9J8noYoz9cfIZpGSC0u?=
 =?iso-8859-1?Q?ZHhSyB11WP542sB9SqFbmCjuzOY6O83TXeKlwKwqzwp+ua3tU+DgG9nH6J?=
 =?iso-8859-1?Q?Tx263KKnt8SnnE54Fynns1fm4n7jjjJqqQi5ZIP6sGMHDJ17bS9533irj6?=
 =?iso-8859-1?Q?s6h5/jojKBJVWcE6xMnTKCeBhZJdPauQ58bdkIu1lwuyNUHIjMV5plGpDp?=
 =?iso-8859-1?Q?VguUcxAVN4wrcWfGmY1XicayMG9bdjb3rArWknH2+o1JOsHoewotnQy1Ws?=
 =?iso-8859-1?Q?f2Wgz7tKSWKdDJzRdDQqoGFPDak+lfRxOnmxfp7qWPAQab2hG9uGOXK62e?=
 =?iso-8859-1?Q?JrMKFeSyriE2cxRqYUq/F8wtmVvHfE3OQEqR/8XxphtmqT3jTpk0s5gaqL?=
 =?iso-8859-1?Q?bsT/nfLY+TMP5OaduyDPiJ+bGNB1c6DGWJR3fSRdo2k7OhTfT6wA21W0kx?=
 =?iso-8859-1?Q?l2n1jfvmRYvIf2jtdtLbKmLm54EhoigzOkWsPb3/ISY5Zt6mdnMkLGXZ07?=
 =?iso-8859-1?Q?y+DTOXWTBpKNQJn2bg0ldT3ANrBXxTQzAQBKiZV9Mihnp4k2aMlB6G7+Ax?=
 =?iso-8859-1?Q?1fr/cezjJxzfKR7QnEV6ckrFqovKGmsU6BML1890taS5ggTUdDrAhJBt1W?=
 =?iso-8859-1?Q?HabnjsKSJs95aEueF80yAhj+/HrBXwo7LmsPnDnvFvqY3JIa6bqWHfKIuO?=
 =?iso-8859-1?Q?9E1CPbRiteyS/3FxgfHR5+4iyVI+gZo88OMzmGWWgI7MlI1AxRNxtbencL?=
 =?iso-8859-1?Q?EuErRbXzelCZ26Mi8Tl++HFOffeUuSAJe61NcnPg76YD5PvVAHIBT7+e+R?=
 =?iso-8859-1?Q?1OxM1gk+7Ry7VIckPd+O7j4jlGz1p251ON6JY7VKiOnyJukvdFXtuY5p7c?=
 =?iso-8859-1?Q?ZCF4Fh+tmWteLKllNEKdGX6yJcz3iQPbiVyMVx1BDXsAP2RlVDPAjg1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bdd440-a211-43fe-c185-08dc85e897c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 05:22:00.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2wF+m2DJEaS4FEQvwnNppy+X+aSLZtrVVUa5o5aqE+6wX2uk/t//P2ZJ3ZYwVLYB4DdAvkKY8LlW0C8Iyr0JnKhxNn+LEf3U1ID74m5Q6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8675
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

On Thu, Jun 06, 2024 at 02:55:23AM GMT, Matthew Brost wrote:
>On Wed, Jun 05, 2024 at 06:13:42PM -0500, Lucas De Marchi wrote:
>> On Tue, Jun 04, 2024 at 10:50:41PM GMT, Matthew Brost wrote:
>> > job->fence is not assigned until xe_sched_job_arm(), check for
>> > job->fence in xe_sched_job_seqno() so any usage of this function (trace
>> > points) do not result in NULL ptr dereference. Also check job->fence
>> > before assigning error in job trace points.
>> >
>> > Fixes: 0ac7a2c745e8 drm/xe: ("Don't initialize fences at xe_sched_job_create()")
>> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
>> > drivers/gpu/drm/xe/xe_trace.h     | 2 +-
>> > 2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
>> > index 002c3b5c0a5c..f362e28455db 100644
>> > --- a/drivers/gpu/drm/xe/xe_sched_job.h
>> > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
>> > @@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
>> >
>> > static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
>> > {
>> > -	return job->fence->seqno;
>> > +	return job->fence ? job->fence->seqno : 0;
>> > }
>> >
>> > static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
>> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>> > index 450f407c66e8..e4cba64474e6 100644
>> > --- a/drivers/gpu/drm/xe/xe_trace.h
>> > +++ b/drivers/gpu/drm/xe/xe_trace.h
>> > @@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>> > 			   __entry->guc_state =
>> > 			   atomic_read(&job->q->guc->state);
>> > 			   __entry->flags = job->q->flags;
>> > -			   __entry->error = job->fence->error;
>> > +			   __entry->error = job->fence ? job->fence->error : 0;
>>
>> we already include xe_sched_job.h in this file and even call
>> xe_sched_job_lrc_seqno() a few lines above this. Why can't we call the
>> function you just fixed? With that changed,
>
>We do call that function above, it just is not in the diff.
>
>We don't have a helper to go from job -> job->fence->error hence the
>open coding here. I could add a helper if you like.

ahh... ok, I misread s/error/seqno/ thinking they were handling the same
thing.

let's just merge this as is then.

thanks
Lucas De Marchi

>
>Matt
>
>>
>> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>
>> Lucas De Marchi
>>
>> > 			   __entry->fence = job->fence;
>> > 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
>> > 			   ),
>> > --
>> > 2.34.1
>> >
