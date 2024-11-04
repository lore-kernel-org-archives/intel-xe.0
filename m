Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F43CD1BDF5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 21:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DD310E4D5;
	Mon,  4 Nov 2024 21:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUnGG2SI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB9610E4D4
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 21:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730755764; x=1762291764;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bFesZ3kkjvv5GaZJTwXT1pTcfK4XOGczlD3Tnoxunvg=;
 b=DUnGG2SI1XJ2rNon0ELnYRCGNMwPHlmmO48pQcyUd75jWQauHxO6N31S
 nn9fr2WIaHz6sImYD3xVmzHPgx0Y+jHVK8JYPqVG//QpO3MTULuxbIz36
 PKGfFDA8MAiPdJwak1TyuA19QAiFW2x1FEXu+IrD+ZfDdD11s7Jt3aA1j
 7ojLo9SPe6N+zi+d3m+0gcZkWPb3azmx+oMyJzP0y/M3ANYa8CR7gR6J+
 thCVgZtOXMa3jRUoTStNUlurNFwqZiUmoyBNYgXvQnbQK5r7NacwYJqxu
 IUq1FpMrI2UXDziUNfcM7HkwT+x7cRyLjfogrGtY3XEa2vvnUG9ofarvJ A==;
X-CSE-ConnectionGUID: sv4ldQm6QKuibD5FRxZn+g==
X-CSE-MsgGUID: ANVVsiN7Q5SsLNIE+mkO8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30419166"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30419166"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 13:29:23 -0800
X-CSE-ConnectionGUID: 0jBx1jLQRAmqyUVqORG6Sw==
X-CSE-MsgGUID: 5xyQ3XIBSD+Ji8FUuhGySA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88598662"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 13:29:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 13:29:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 13:29:23 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 13:29:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyqda8OgyMLY9Nf9tWz8w9N1hCVKoxfqmebfN/7X0rmJ/QdhIBuuMlem3e/n4xF/4WGyIdXtKAgw6xY1T8m9gnqhnZbjpCawiRc+S+UBX4Ah19TBnseWxuqaRW8J6zBuUTLazHLSBUNjhxESIFOewEfUIaYgtFPfwPWeFiiz9BYATSadeHcLM5Zv5Hlpbfzu1ezyKuJ+AK8YaLmaTRK0+RiC6ivHlz+5AfT6QUA1iOM4yoB39o+wdCn/aJ6aDLA3S7IpevpHx24BFLJR4pZsEMVJaXdyc5nIIyctlGjpS4gXy8vxsRr+LCSet05BjMhX5nEKRqYB+5AGpnuBOXXpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sccY73D4TSUKrcnvcexJ6CyB96eQryJdxYAa4vg+0BY=;
 b=Dsj2Pe0ClMWWYtFcISuMhEgMSGha25tt/hSy1wXFaE4rXvV5F83uQ87mxAGp4g5b5g+HPY0geuupkrrPKiOJimYr0MDee9Q+3sfqeKOW5+4bG6THnsv+fqepT1kqdYywx9hMUzseneC0UGXRo+FXPgCE7r19z0FeoRW7if1vKRNeoOruoGNO0a6hzBHAtvLwZrHUGEwhkbfTVCMLHHR2ESqknuanSJKeJQakEU7PelfNZ0+er8hVzmtFQ4NyMWdcj0cWNWCGes8qHj6BZL//dqAChgMdjL+hYMyY6MjKUJD4DexvqXPowbcG9BL6GvvhngSFSasw8zILGwHdKFEalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 21:29:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 21:29:20 +0000
Date: Mon, 4 Nov 2024 15:29:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Wait on killed exec queues
Message-ID: <hl4fi4m3kyhd6vlpxvqm2esurzltqg4e2npqrdnh5dhqclxwaf@iqnxllrueebp>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-5-lucas.demarchi@intel.com>
 <Zyj2dFOOqKnTaNPq@lstrano-desk.jf.intel.com>
 <zaabktbnnwhysogfhv72cm3f7i2lecrv3pjjnucwttgab7am5u@76hsjobttcy7>
 <Zyk2YX1bk4M6koho@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zyk2YX1bk4M6koho@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0114.namprd04.prod.outlook.com
 (2603:10b6:303:83::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 56413387-22f7-495e-52cb-08dcfd17be61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?39hzDg+2X1DxjIk+0cszgH54RcQtjoYm5qYmADV+TG/j8SCwmrJLDJPX+PiL?=
 =?us-ascii?Q?mXxEFTuv7JCrOL2xdT5MMQXWIxCAZiOj9XBF125PdraqQsjJ4SFl2M7RWABW?=
 =?us-ascii?Q?24FPtdBlffK/QJir3OkpHOHfiC3kVaufwLW5/rboUhrZP0gUwac9g7wUVK6k?=
 =?us-ascii?Q?Obk4Jed85lVbscDE7I3mR5R7yJ1zM4nc00blQGzUEZPAKbhxHfrU12Gml1FK?=
 =?us-ascii?Q?w5R4SvsZaWbTjsf+hqN+tdoBL1rF4h97t0Jo6u/GE63z6hW/Irz1A7G2NP7Z?=
 =?us-ascii?Q?JU7xUiusSx5ECpg0tcmEAfVAEUogshbDiyZxynvTc8OgHoY7DoYfLTvTpMbp?=
 =?us-ascii?Q?QiekLOp3WiskN79A3KeovrD9K2s7Eg1Or3rY0uOj9PcSxFauDJ6UlZiQqjaw?=
 =?us-ascii?Q?JMGFHs/1jeNSf1PFprYaUen7biCosTYV/862hW8OoQxJjV0Ib8H4ZLbxFjNA?=
 =?us-ascii?Q?ZGp3oXwQg3g041MI93aJ6YVD7LrYjowhRDRoR+h1avZhJWD5hHBO6xmyW5Yv?=
 =?us-ascii?Q?sfLr+gUDtidXEoaNuAw2BPMdUp3vGBdyDN511X+Z3CP/zscj4kZKNOG5xBlW?=
 =?us-ascii?Q?Eu02lz4Mcavzu0R4UMj2mjkyxXTGJJh++2ul6pZV+5OHnWqbhVU46+gQtpAN?=
 =?us-ascii?Q?fCOKdh3ZMp5FPyFSyZ1riZCBiOTVoZe/KIoCi3KSmp7RJkKB5EZw0zUTo13c?=
 =?us-ascii?Q?JAALn1XzNmxMz5Jo7vi6Ww/FeYvHP6ipW+SqoeC7oSJotqnioWXA+TKC+3sK?=
 =?us-ascii?Q?ZQr9qv552BeEiYp5TH/+Fo7S6tYLYp3ndgjktKEU4UAX955BG//PEelo1fz6?=
 =?us-ascii?Q?n9a7mQymFO8Pn22+OlzsXuHzDsehcxjXsJv/d9BJrxOkmzF2efJcO6tc+c/5?=
 =?us-ascii?Q?QAe3uPO7XLMwGW2R9HbXmwMUs8dWcbm5o4Xd4pfZG64MYcLN4aucsuU13GbP?=
 =?us-ascii?Q?M+yuSu9R7Cb2m2t/IanAYo3sFz4+OxjLzMib5HIfU2+TBcWLl/19CA7vN0VY?=
 =?us-ascii?Q?nh+nXdG1wpnxsTihRfWfc2Bjk+3E4aNMkxYalwN2vOA6MkIVWPde0kiEs3vL?=
 =?us-ascii?Q?b4Os5/rMrerZYsN0jsbYIhjdGSY3UicsPB03z+D/MdjwYELjw0vnOfhvech/?=
 =?us-ascii?Q?vxzFmwtTfLvePqhWYe1QtxK3y3VXWIlghAHrYD29wD3nhP5HP2V8N36nZo20?=
 =?us-ascii?Q?XAfu/y1e74daG6W4aLvK80bL1Al/e7GXxBAxZ5M1REz99FcMW6t6WyiFmcn6?=
 =?us-ascii?Q?tbg/2SC/ka0WqQkwRcgHM/dMLhGc6Tlu0m2cDpv7DAVD/qYok6MatjBD1Mx8?=
 =?us-ascii?Q?h++MNe3z7A+cRLA37Xq7elmy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rkWkZK5yEbwVbeRp3wawaoA+wpCy7IhtB3HAUN+KGoqlDpCHIHRkCHBKK9CK?=
 =?us-ascii?Q?F6PSc9XQyJJmF1zNuZvDRkKcsbdeRYToJRaNdvhcv3BT8b+t2+Kh0frJNdt4?=
 =?us-ascii?Q?9j7pmEhz6fp5y80ybrKuAv8hkQJXTW+bOw2yfMIn/pfs8LDCGx9OGwHK0eGE?=
 =?us-ascii?Q?YhEweyQml5d0p1LaY+VnsgQ7znyfPBskLqv68EqFZNHuXwuWXlv5ojZfRwbO?=
 =?us-ascii?Q?N297zGsjjEFOfZA0Fr+wgDOF6nMjFejZyOP5qFztzALWIjpl1Si7LlnmR8zz?=
 =?us-ascii?Q?XtoSTfDCWHezNiEBnAlRkoLdeCRLLeKf1I/7iOyExizOQuC3iefPo3PPgxzr?=
 =?us-ascii?Q?WlEEdeTGoc5iORleVCFL7t6bm2ukqHN6kcYRkI3BxrhtbwWRAyeMyp4AN+mf?=
 =?us-ascii?Q?D8LZxGpRVJLxHGz0RP8mcPumKQ3FvhuM1Je/FlkShs6ius8Q3n9Q3ESzpyFk?=
 =?us-ascii?Q?1nPigj8ZonG9pSL4Y2oyfLQXFpKVHzKmhKRiIZoJ+mLrpE7w2HyzyR8rTNpK?=
 =?us-ascii?Q?PrHTGJLszukb/pzw1gJkVO0Y7kVvqHDl2UmMF9PNh9dZ78E9aIwMw3l8Q/FO?=
 =?us-ascii?Q?hMTufaHF1UPiNID44SyEm0Js149pLFmqRKsJA319ud0rwLM9094RjCY1QdRT?=
 =?us-ascii?Q?I8z2ezkQlkw/fs3viQiDzGz0j73H7qb7B9EbHUZzkyI/78SQlCaBqrfjbLE5?=
 =?us-ascii?Q?SAioDWZbigW4LyTjeFpl71iXk8WRZWk0mAYy4sLAi6cBZoEUxqJTr59GHxwb?=
 =?us-ascii?Q?UvTHpVcsMxPSsIcarF1N3HKqt6wnu1w8ZDQaLtL7Ezf0B3clA7rJCzpfywMs?=
 =?us-ascii?Q?6xCxrOwvDUnyRDNpjHZJVtSaGBXs6DQOF97iFQnOFx9kI/umRWD6wYObt7ks?=
 =?us-ascii?Q?mSHoepwdTnezpdkRkybZP/CdEozWJpWyeyOXoGD30puQTRxtI1g0PdCSnOoH?=
 =?us-ascii?Q?WbzT7zgukPTLbcTd9N7Q8fqnuf9ca52eDpxmKEk6AbBf4Wfe7n8Qn0+17hGc?=
 =?us-ascii?Q?cn3c/Od6zAjpGfJyiYuKdI0Az17whKPoda5lwzrUzsTFi737tHR3fEGP+6xL?=
 =?us-ascii?Q?Nki4YKlo1hJTimyFoREk2lNCWH8k7eCrhflmzR87utHS0v1ffhf6tNZv7mYV?=
 =?us-ascii?Q?jHirCFOe43NlNRE9DNaKi6SaM9feP1KZ1U1YpRt+lh7Lf62Li1IVVIt2m5IX?=
 =?us-ascii?Q?PmX5ko8bC2KCpx9UKF9M8DOJbtHUkC85saVM0A0sYFHJFz0+K9eahjwLgW9o?=
 =?us-ascii?Q?7N/asQBf6/wGbj+yKohZLLFn1G2QWTi3DV8fK4KeTqPJAe3kiGaHkSFTlkfv?=
 =?us-ascii?Q?S4nlukQu+Rn86g/EIvCwm5SkQ8l1hWiZ1WsnlswR3/6GNjxEmmS9KyJiBPHz?=
 =?us-ascii?Q?ke89ZOzFoileFyujVhFDjFCr2q2dJsjs8f5wFJgm00KK6mcPVe+YKMsQvChc?=
 =?us-ascii?Q?sbLgoOl8NW/2lhU8+//SZHaOerVcxtnBAtZqpqDk8Q2XaySC19+2C+hM0agx?=
 =?us-ascii?Q?pD/nfSWn1oPqLUMUtS8P9PfzUC6MAaMS9f1JBuqjrjupUeezHtnhe9VAUCJA?=
 =?us-ascii?Q?2noIJi5QbWVFJF9wSZj+Y46mzV2v8TXWRWxwkYqIt5ZRiXUF/uj+7hjlt4r6?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56413387-22f7-495e-52cb-08dcfd17be61
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 21:29:20.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIbBz+zEm6eHbs4UroIhK/Q/QD+FxMAJ57+gStmoRkGSiTDN6HCRhiHsYeJyG6XtE76GzR6KKc6Zd4/karfTk+UNShAt8qKiA1bdeu5br8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
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

On Mon, Nov 04, 2024 at 01:02:25PM -0800, Matthew Brost wrote:
>On Mon, Nov 04, 2024 at 11:54:04AM -0600, Lucas De Marchi wrote:
>> On Mon, Nov 04, 2024 at 08:29:40AM -0800, Matthew Brost wrote:
>> > On Mon, Nov 04, 2024 at 06:38:14AM -0800, Lucas De Marchi wrote:
>> > > When an exec queue is killed it triggers an async process of asking the
>> > > GuC to schedule the context out. The timestamp in the context image is
>> > > only updated when this process completes. In case a userspace process
>> > > kills an exec and tries to read the timestamp, it may not get an updated
>> > > runtime.
>> > >
>> > > Add synchronization between the process reading the fdinfo and the exec
>> > > queue being killed. After reading all the timestamps, wait on exec
>> > > queues in the process of being killed. When that wait is over,
>> > > xe_exec_queue_fini() was already called and updated the timestamps.
>> > >
>> > > v2: Do not update pending_removal before validating user args
>> > >     (Matthew Auld)
>> > >
>> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>> > >  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>> > >  drivers/gpu/drm/xe/xe_exec_queue.c   | 6 ++++++
>> > >  3 files changed, 18 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > index cb193234c7eca..ed6b34d4a8030 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > @@ -605,6 +605,11 @@ struct xe_file {
>> > >  		 * which does things while being held.
>> > >  		 */
>> > >  		struct mutex lock;
>> > > +		/**
>> > > +		 * @exec_queue.pending_removal: items pending to be removed to
>> > > +		 * synchronize GPU state update with ongoing query.
>> > > +		 */
>> > > +		atomic_t pending_removal;
>> >
>> > Would the interface in 'linux/completion.h' be better here?
>>
>> I think it'd be counter-intuitive in this context
>>
>> 1) most of the time it's "done" rather than "pending", which is the opposite
>> of the completion interface - note that you can't call complete_all()
>>    multiple times
>>
>> 2) we'd still need a counter to support multiple queues being killed if
>>    we keep it on xef. Imagine userspace did:
>>
>>    	for q in queues:
>> 		ioctl_wrapper(fd, DRM_XE_EXEC_QUEUE_DESTROY, ...)
>>
>> Not clear how you'd do the complete_all() thought. Could probably be
>> more easily done if the completion was in the exec_queue, but the task
>> reading the fdinfo doesn't have access since it's removed from the array
>>
>
>Ah. When I briefly looked at this, I missed this was a per device
>counter rather than per exec queue counter. My suugestion was based on
>adding a completion to the exec queue which I see your point of not
>being available in show_run_ticks after DRM_XE_EXEC_QUEUE_DESTROY.
>
>> did you have a different way to integrate the complete in mind?
>>
>
>Not really. I can't say I love a global counter / wait but can't
>really think of anything else. The wait is outside of holding any
>locks, right? Seems fine then.

correct

>
>I guess my only question is do we even care if races and is a little
>inaccurate? If the answer is, not a big deal if stats are slightly off
>then maybe drop the patch. Up to you. Don't consider any of these
>comments as blocking.

for the normal case of a top-like application, it shouldn't matter much.
If the fd is still open next read, it will catch up.

The main thing here is if we have a task doing a destroy + read fdinfo
and expecting the time used by that exec queue to be accounted. 

Lucas De Marchi

>
>Matt
>
>> after writing this I'm thinking the wait could be the first thing when
>> reading the fdinfo, even before  taking the force wake. That would
>> synchronize well with the scenarion in which it's the same task doing
>> the destroy/read-fdinfo and for others it wouldn't really matter.
>>
>> Lucas De Marchi
