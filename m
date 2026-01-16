Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFC8C982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386A010E0F4;
	Fri, 16 Jan 2026 22:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjqQFf1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECFB10E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768602125; x=1800138125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r7FC1bm9A866N8Up02AgN0/OtfU8sYAFmsf4LWyFugQ=;
 b=cjqQFf1vSo92W6p4ZqJtFXUhJNzbsz6EXCQfCZ1RnMPz1I+ER3N3/7E5
 VN0S9GXZPeQEy/7BPMyDsJsJYbPPVcrxiWvBUWh0DsyxFoGeVdLhnIVu6
 alI4t0c88rLK3D1h43FTftREcNmTIV4qVugBv7zLVOdm31ywIpPVnsU45
 mPuYXrvUlv4mjfV1DAZZZ7po90jhW49X8sqsetft0lmPMyvqmYZ0j2YMU
 qhdGvNE4wW7HTUMAQQDMwHAvUML6yCdoKUAhdeLykDcwskeKZiNOZK/8i
 d4OtoslqWWEUnEa51K5b2TrcEdqPV4PPm7tgTKs+zFsWUFn5nmlxVaKh3 A==;
X-CSE-ConnectionGUID: LUUTS89cTjOS4mAzYkEb7g==
X-CSE-MsgGUID: cHsTwFzmSHqBwx/Jz37c/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80642646"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="80642646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:22:05 -0800
X-CSE-ConnectionGUID: u5STYuLJSFO/R7jxdKX2CQ==
X-CSE-MsgGUID: WXcgck9gS7W5iqaTsHSc6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="228354623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:22:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:22:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 14:22:04 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:22:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/PaUptLtUP4pgCOshCofFuz219NnVJ8HpVL1yTUgLWZnbMraPmnFFzQSJ4ougRgCKcPPLVpHYFa43rPHME3YGkqOlDWuMgfQYclqflMKgXVjOoIygzfEM2qATD7vlA0Wk98aoIqemjS4JUT7Ceg1bHtHTbFNRVcXvFy9F3f2lK7YyMpVAEM3Lwl9our04Z3CJoGFTlieXQXqxXP0ibhzR8vv8YwBdP9LUD20Tpa4Hsv4ucRRkW6xB4OMSj4d2pAadeKM46EjFU+7rVE1DSW3E3Z8hianBaWGuZ3vC4LnSc/YAOgUiK9h/2ugmRrhGx51Awb/cCF5aj8fqZiEfniJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3BBQB8Yk+qiXkqIdpPh7KZXE7srEW2U0ylMQ7QlLhQ=;
 b=UE7pT3ZNEV3kIk0DtbG3sSMjf787Cb2jIoN1mEiJEy6wODawT6PevG+AGN0K1kmPuG7PLJmPDGeP1nfthT00UY496TFlaal3JI0zURXN1WmKLNYjmctF8iv/XMfXXrGhkjQtX3nur+C3sXGufoYS06xocQuqY1vDUOGJUqsONxnUtFvbZFLEUup/+Mjua388hWlRrY/b61I60F25fZa4PxxiLzmRPSmX9b4oW2KRO3htq5TluZ2U1zbNt8lMobx7Gi2L9ni5cPecdoeeq3QitZsBNtkkwHWeWrDoeiMQwdyXNrYgf4BlO78b+CE0d85/d3XwufyDW1z/BGTNdOiFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 16 Jan
 2026 22:22:01 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 22:22:01 +0000
Date: Fri, 16 Jan 2026 14:21:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] drm/xe: Ban entire multi-queue group on any job
 timeout
Message-ID: <aWq6BrQW8kiIFU0N@nvishwa1-desk>
References: <20260116220333.861850-1-matthew.brost@intel.com>
 <20260116220333.861850-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260116220333.861850-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f3399e-c9a1-4cdf-6a95-08de554dab79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?awQFQzP/MdCM+VxSVfmz5lP1Y7Sv6Q8PThEkjyt5CgDncLs/hiL3lRQuX2Zh?=
 =?us-ascii?Q?SWctG8YIz3FCu98CcQSDNReg7CenerrNXG1QcwXnYwtab3UWUvlMwBVnEOz9?=
 =?us-ascii?Q?gml6ZQ34QXf8KYuDCpDfZvjxJO1RPOpOol9q+hGZb04P12LckRUMe23EBqP1?=
 =?us-ascii?Q?Lfpf1fME1OKn22WOBegVqA66YLWFm0rKIOa9eM8q5nSXKX3qs76d2XEo0F/y?=
 =?us-ascii?Q?2mRSkXUKH7hozjkhrgpWlsjA30EpY6XrjrbNZa8uzUvbg3HE27MArBQpO5uJ?=
 =?us-ascii?Q?RqwAIeUsSiYcNMWRszSikxOnC/dG6Gf0EIR4FsvR8nwgup0DbmkqhI8XAn68?=
 =?us-ascii?Q?JwaXbAdG4WvSLg+R8Jq2wyLZWWZO1S5VubeabmfsX10MkOqQeR4ysAoxuJZY?=
 =?us-ascii?Q?TG+TGVfYFGWsr9EHD9MkBPMnRltlHGIAFBkQslzA6yr6mdDqLsgxIB7IJgkW?=
 =?us-ascii?Q?XCfLzYI6HM2qSaY8n2oEESzS6duZasGJzJ5CyIXXsCXzK6uxgVcb1+a8APzm?=
 =?us-ascii?Q?WB0bHYONCtMDqH+CnjB6kBPyAQDqev6rDffL2Px+RRUv1yvydy3KWG+WapsF?=
 =?us-ascii?Q?UncRmAjTkD/KawoSedyxptj3kFtDeYdLVazJ3od4RmXIDoa/qV8S04ililla?=
 =?us-ascii?Q?Ca9J483gYVCUu0ewEw6QnlKNuFc6QzHUa/Pg4YNSk1nHtZPoc1xmJ6mrWxuM?=
 =?us-ascii?Q?7egkyJh9SnOStFIazXOClvdet2q5GCRjSg3qec0rOeh45EXXYhzUnIX1eLCo?=
 =?us-ascii?Q?GEDERLcT3RtNUc3MBN2aFkcNPtUUrzRS1fqYMaRE5TB8ljOcgBiY9EgU+1mR?=
 =?us-ascii?Q?NaRJIUIREMB6j2zM0+fOlNNxi72kUb8AKh6xgjQLN0T4KFPE4C2Bc8leebs8?=
 =?us-ascii?Q?uBY9oNxTrMuP7klBl4KsEKhZuBzd+AeX/g9QoZ2NQoAKABLrjxgjqMs4X6Kx?=
 =?us-ascii?Q?EJ1PxZrRp8j+e/SC54eInQVtd/Ri8z75gsEDvJeNrsX598w5fCscrTL9aL1n?=
 =?us-ascii?Q?fLZdjygzTIRt3qNm1HBGI7j3A5dLYzfGhGY4k+qDqgQxlKrYpe3MuQxwJRQM?=
 =?us-ascii?Q?+lnnwlrgYD3E9NmOau+EvXMLTRsNZ/rJE9dR1tYBcY082b7lFQUN95hq0mXx?=
 =?us-ascii?Q?yb/ZXiP/kVXw2ZLWtbRPBaJTtzT12ojUtHYfSYDlrpybKCVEdlPe+V0qTjfD?=
 =?us-ascii?Q?cR1rX8fM9fRZc7vdxVmb+gcGgQ18ObaVKjNzOqUr7FRsa1BWoQcuI+K2DR2X?=
 =?us-ascii?Q?uSZWfCZqjpSvorTRfi51acdO8fWvD+jlzFFZcYcxm24NGol8N6dJFwa6Ojnx?=
 =?us-ascii?Q?4iwjp9qg5jgvvZzp22PSF7bedH2Wk/GTF+i9SSus5ZE7DWOjgIZkGWOJpVKi?=
 =?us-ascii?Q?npC09mc0O34NAjmMbQG8fOCO5OpYrdUExaJRrGkXhwnU1mBqzWcd+phWNJi0?=
 =?us-ascii?Q?xadn4kolQGqYgs7K1KE3Zd3q42YLCWLtvgzoxix5XQXFgEA3j/+uYb1K1lX+?=
 =?us-ascii?Q?Sx4k7MRVWZGh4Lt9cAlhpzPfJ4dDwf8qmsH0cDwUEHy1flg06sPDX6ZcLcVm?=
 =?us-ascii?Q?p3V904ppCig9aBPUQi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8E5G5utS+yW4Wk46wRKEklYMYNDhw98aZOYz+UEo302JDklTMlGb/KNyv3L?=
 =?us-ascii?Q?ic2CTjAu+2v8zuhislDodKtOURZTR74pmBCIonx0AngIMbMb8HGUxI+tmu6t?=
 =?us-ascii?Q?a4IFnJHiiXzQglgaJywIwYQfGLIXeIG3/dBjdKDnxZX4agSYlI0KIcTc7mfI?=
 =?us-ascii?Q?mq1p574Yhe3EP+FpeMu0JAy5UBy5UdukhDdbHBjZ4NQzJXXx/0FDmPPodOSP?=
 =?us-ascii?Q?cyTgrewskhJMcuRoGLa5taC1TeMUIBb6z77Cj8jkI88EhvgH/dDOueZGQWJD?=
 =?us-ascii?Q?KksJoMKXoQUlg1uUndARCTS9dSv2WgVqkJ7Tumj3VRMo2zrwxC/tk4yEso9A?=
 =?us-ascii?Q?S2aP94lXUmTRR+tU7nxZHGUkGizdJSCup7gUO+xSccM43tyi14vGlE6O7aLs?=
 =?us-ascii?Q?F0ESWo10re3CBbHMVoxQfDfsibnNs0v+bir+xlmRhln+mpLWYJ6Sx0x9RED9?=
 =?us-ascii?Q?+ywp1JCQJVyMWnbeFBVgOY5bac/C99YItV7I9b4o2H4tYnb7VFWuaHsywy1E?=
 =?us-ascii?Q?Y5GCiGyKOwzuoXtLlXzN+CRIY9iZY/NL6CGkCzYrDz5yWFcmSYD7Vr61sYwK?=
 =?us-ascii?Q?fFXQiiYsjiRrTI8hExniDl+EFZX3xtnLAoQG+G0qTFWO3fnXhsdFnVW4IMGu?=
 =?us-ascii?Q?jdb3QX4H3fhyhyc/6u6NF1O86ZtYFyPzJiw3V7ARgvC6jSOzXxIco9mv1QQ+?=
 =?us-ascii?Q?I9JuNd2RphOE/u4R22aqn20xIT4/cT26PdjTnvYXB2zHVW5f5/Cid7cjU2G/?=
 =?us-ascii?Q?JZFgZBWOO7zqPDfh+hk0q1FkBHCle33w5rYBy+13q0DDylDfT8KeXZCmqYbV?=
 =?us-ascii?Q?aEoCnplQTxjYs6lLbWM2PkoAoY6FGSc0cSRA8SV7vU5cQ7l6QvR68LdQlZu4?=
 =?us-ascii?Q?QE5o4IloT//jfT9jjAHVVcYsMxBeQdvaC3BxQbJlYqSvG4L3TpU0o6ByJkTm?=
 =?us-ascii?Q?x64Xt6v70tBStN4fr8MFU6fEFG8H6dOIoNOb/2H3X1HRkUCkwdRtnNjirYL8?=
 =?us-ascii?Q?jfgPisQLs5Y0Zb8kAOw7zUSQoPcV0bq9yujz5aVd/n/E173/0airXvBN1cX9?=
 =?us-ascii?Q?4Vw6Nzgl4MmalWjX5iJNKJcUkVVFPjjDF1UQp+6BRn0cfUZh9Z4BSpXXlxf9?=
 =?us-ascii?Q?WXYBQu2XThqDgdCuxGHd2XTKChb0bmWD9B7kWVrN+0gVntMAaNzcIYwywliS?=
 =?us-ascii?Q?bLgJSegjNUX09b564teyHaKvfRyMO4HTV0/71/aWBZWmhNGxfCFfqrWrJBJ5?=
 =?us-ascii?Q?oN598PCVQD6VZ7fW7yBMMnCHUp3mB83oE4iHc2851FehY75WRRjgQpEVmX+l?=
 =?us-ascii?Q?PpcjAasVO1rnePcS8W7fpYm7RnU6LqNwf8f4iv2xrA/Nb4mU38h2erfZ607f?=
 =?us-ascii?Q?TPPgyTPQl7i+uj3ya/8m+WVIWG04j/QkypzEnJn4VdmogfMXoC+NjDFhpDCS?=
 =?us-ascii?Q?/l4Be/Ubx7SOdFHR5YrGldGeUf03mBV0lYSBRxAK2djhgrI2ofWlS3g9KYuC?=
 =?us-ascii?Q?ft22SFcdtTsiF0TjSD64F70p4w1hWZ9wq8nBwZnti+X6R1O7dURezOQtuGWi?=
 =?us-ascii?Q?I8EbbJ/BBP6jlV/4jao1AUHrCklfu25vCQ2BOGMfei17UPhxQg81MXe6qAQD?=
 =?us-ascii?Q?3gQohHJqaaMtxfHFXOrct34XCpUtPaAaNS3V5KlhvA7E3cid9R3jC/TUROr6?=
 =?us-ascii?Q?d62u2qwVHggLZ6SBwd9/bmMh344SzM0+mH7KStCiWf+QM+gcY7uqb2G3MqkB?=
 =?us-ascii?Q?P6lQ+iQOZmWAFcgKsEvBe90eGEDr/Y46qXOnnbhwd1TSGOL5jSIO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f3399e-c9a1-4cdf-6a95-08de554dab79
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:22:01.2664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnLonHmj0l2mIRrUksdGf/gIHxqWFnYAbDImgs/fX31dbNCWDKK2B1DNJ9v9DakVIdEjZj6pDZqyRpRpfgk4PC3vxwlh1xES6xCNgziWlQNrmcmliIcXtyatwyIoWz6z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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

On Fri, Jan 16, 2026 at 02:03:32PM -0800, Matthew Brost wrote:
>In multi-queue mode, we only have control over the entire group, so we
>cannot ban individual queues or signal fences until the whole group is
>removed from hardware. Implement banning of the entire group if any job
>within it times out.
>
>v2:
> - Fix lock inversion (Niranjana)
> - Initialize new queues in group to stopped
>v3:
> - Blindly call xe_exec_queue_multi_queue_primary (Niranjana)
> - More comments around temporary list when stopping (Niranjana)
> - Restart group on false timeout (Niranjana)
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I think it should work. If at all there are any corner cases show
up where secondary status checked is not in sync with the primary,
then we can handle it then.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> drivers/gpu/drm/xe/xe_guc_submit.c       | 120 ++++++++++++++++++-----
> 2 files changed, 97 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 5fc516b0bb77..562ea75891ba 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -66,6 +66,8 @@ struct xe_exec_queue_group {
> 	bool sync_pending;
> 	/** @banned: Group banned */
> 	bool banned;
>+	/** @stopped: Group is stopped, protected by list_lock */
>+	bool stopped;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 1b2f66f4425b..bd5e40b3468e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -556,6 +556,72 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 	xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
>+static void xe_guc_exec_queue_group_stop(struct xe_exec_queue *q)
>+{
>+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>+	struct xe_exec_queue_group *group = q->multi_queue.group;
>+	struct xe_exec_queue *eq, *next;
>+	LIST_HEAD(tmp);
>+
>+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
>+		     xe_exec_queue_is_multi_queue(q));
>+
>+	mutex_lock(&group->list_lock);
>+
>+	/*
>+	 * Stop all future queues being from executing while group is stoppped.
>+	 */
>+	group->stopped = true;
>+
>+	list_for_each_entry_safe(eq, next, &group->list, multi_queue.link)
>+		/*
>+		 * Refcount prevents an attempted removal from &group->list,
>+		 * temporary list allows safe iteration after dropping
>+		 * &group->list_lock.
>+		 */
>+		if (xe_exec_queue_get_unless_zero(eq))
>+			list_move_tail(&eq->multi_queue.link, &tmp);
>+
>+	mutex_unlock(&group->list_lock);
>+
>+	/* We cannot stop under list lock without getting inversions */
>+	xe_sched_submission_stop(&primary->guc->sched);
>+	list_for_each_entry(eq, &tmp, multi_queue.link)
>+		xe_sched_submission_stop(&eq->guc->sched);
>+
>+	mutex_lock(&group->list_lock);
>+	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
>+		/*
>+		 * Corner where we got banned while stopping and not on
>+		 * &group->list
>+		 */
>+		if (READ_ONCE(group->banned))
>+			xe_guc_exec_queue_trigger_cleanup(eq);
>+
>+		list_move_tail(&eq->multi_queue.link, &group->list);
>+		xe_exec_queue_put(eq);
>+	}
>+	mutex_unlock(&group->list_lock);
>+}
>+
>+static void xe_guc_exec_queue_group_start(struct xe_exec_queue *q)
>+{
>+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>+	struct xe_exec_queue_group *group = q->multi_queue.group;
>+	struct xe_exec_queue *eq;
>+
>+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
>+		     xe_exec_queue_is_multi_queue(q));
>+
>+	xe_sched_submission_start(&primary->guc->sched);
>+
>+	mutex_lock(&group->list_lock);
>+	group->stopped = false;
>+	list_for_each_entry(eq, &group->list, multi_queue.link)
>+		xe_sched_submission_start(&eq->guc->sched);
>+	mutex_unlock(&group->list_lock);
>+}
>+
> static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
> {
> 	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>@@ -1414,7 +1480,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> {
> 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> 	struct drm_sched_job *tmp_job;
>-	struct xe_exec_queue *q = job->q;
>+	struct xe_exec_queue *q = job->q, *primary;
> 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	const char *process_name = "no process";
>@@ -1425,6 +1491,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>
> 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>
>+	primary = xe_exec_queue_multi_queue_primary(q);
>+
> 	/*
> 	 * TDR has fired before free job worker. Common if exec queue
> 	 * immediately closed after last fence signaled. Add back to pending
>@@ -1436,7 +1504,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		return DRM_GPU_SCHED_STAT_NO_HANG;
>
> 	/* Kill the run_job entry point */
>-	xe_sched_submission_stop(sched);
>+	if (xe_exec_queue_is_multi_queue(q))
>+		xe_guc_exec_queue_group_stop(q);
>+	else
>+		xe_sched_submission_stop(sched);
>
> 	/* Must check all state after stopping scheduler */
> 	skip_timeout_check = exec_queue_reset(q) ||
>@@ -1451,14 +1522,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	if (xe_exec_queue_is_lr(q))
> 		xe_gt_assert(guc_to_gt(guc), skip_timeout_check);
>
>-	/*
>-	 * FIXME: In multi-queue scenario, the TDR must ensure that the whole
>-	 * multi-queue group is off the HW before signaling the fences to avoid
>-	 * possible memory corruptions. This means disabling scheduling on the
>-	 * primary queue before or during the secondary queue's TDR. Need to
>-	 * implement this in least obtrusive way.
>-	 */
>-
> 	/*
> 	 * If devcoredump not captured and GuC capture for the job is not ready
> 	 * do manual capture first and decide later if we need to use it
>@@ -1485,10 +1548,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	set_exec_queue_banned(q);
>
> 	/* Kick job / queue off hardware */
>-	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
>+	if (!wedged && (exec_queue_enabled(primary) ||
>+			exec_queue_pending_disable(primary))) {
> 		int ret;
>
>-		if (exec_queue_reset(q))
>+		if (exec_queue_reset(primary))
> 			err = -EIO;
>
> 		if (xe_uc_fw_is_running(&guc->fw)) {
>@@ -1497,8 +1561,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			 * modifying state
> 			 */
> 			ret = wait_event_timeout(guc->ct.wq,
>-						 (!exec_queue_pending_enable(q) &&
>-						  !exec_queue_pending_disable(q)) ||
>+						 (!exec_queue_pending_enable(primary) &&
>+						  !exec_queue_pending_disable(primary)) ||
> 						 xe_guc_read_stopped(guc) ||
> 						 vf_recovery(guc), HZ * 5);
> 			if (vf_recovery(guc))
>@@ -1506,7 +1570,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			if (!ret || xe_guc_read_stopped(guc))
> 				goto trigger_reset;
>
>-			disable_scheduling(q, skip_timeout_check);
>+			disable_scheduling(primary, skip_timeout_check);
> 		}
>
> 		/*
>@@ -1520,7 +1584,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		smp_rmb();
> 		ret = wait_event_timeout(guc->ct.wq,
> 					 !xe_uc_fw_is_running(&guc->fw) ||
>-					 !exec_queue_pending_disable(q) ||
>+					 !exec_queue_pending_disable(primary) ||
> 					 xe_guc_read_stopped(guc) ||
> 					 vf_recovery(guc), HZ * 5);
> 		if (vf_recovery(guc))
>@@ -1530,11 +1594,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			if (!ret)
> 				xe_gt_warn(guc_to_gt(guc),
> 					   "Schedule disable failed to respond, guc_id=%d",
>-					   q->guc->id);
>-			xe_devcoredump(q, job,
>+					   primary->guc->id);
>+			xe_devcoredump(primary, job,
> 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
>-				       q->guc->id, ret, xe_guc_read_stopped(guc));
>-			xe_gt_reset_async(q->gt);
>+				       primary->guc->id, ret, xe_guc_read_stopped(guc));
>+			xe_gt_reset_async(primary->gt);
> 			xe_sched_tdr_queue_imm(sched);
> 			goto rearm;
> 		}
>@@ -1580,12 +1644,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> 		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
>
>-	xe_sched_submission_start(sched);
>-
>-	if (xe_exec_queue_is_multi_queue(q))
>+	if (xe_exec_queue_is_multi_queue(q)) {
>+		xe_guc_exec_queue_group_start(q);
> 		xe_guc_exec_queue_group_trigger_cleanup(q);
>-	else
>+	} else {
>+		xe_sched_submission_start(sched);
> 		xe_guc_exec_queue_trigger_cleanup(q);
>+	}
>
> 	/*
> 	 * We want the job added back to the pending list so it gets freed; this
>@@ -1599,7 +1664,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	 * but there is not currently an easy way to do in DRM scheduler. With
> 	 * some thought, do this in a follow up.
> 	 */
>-	xe_sched_submission_start(sched);
>+	if (xe_exec_queue_is_multi_queue(q))
>+		xe_guc_exec_queue_group_start(q);
>+	else
>+		xe_sched_submission_start(sched);
> handle_vf_resume:
> 	return DRM_GPU_SCHED_STAT_NO_HANG;
> }
>@@ -1965,6 +2033,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>
> 		INIT_LIST_HEAD(&q->multi_queue.link);
> 		mutex_lock(&group->list_lock);
>+		if (group->stopped)
>+			WRITE_ONCE(q->guc->sched.base.pause_submit, true);
> 		list_add_tail(&q->multi_queue.link, &group->list);
> 		mutex_unlock(&group->list_lock);
> 	}
>-- 
>2.34.1
>
