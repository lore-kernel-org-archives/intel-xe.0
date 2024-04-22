Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EEEC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 12:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38645112A37;
	Mon, 22 Apr 2024 12:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZbr5DGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D40112A39
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713787318; x=1745323318;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+AI3jMWKvKMkdfOjpUlWo2g8jPuavFOCaWgwhp2Xq9w=;
 b=DZbr5DGw/bCnflD7tmPG7EepVqjXP6nGBCbGzLPZDtcl9GfygmGhw8eo
 SjpQTgIjNqBsQcISVpu1E6eXrNpL+/4u1CwX5rmMLqY9dcAQOGALSLWxC
 kUh5gdsyBz+jLWZO6RZvILqt6H+1bMUUg8bFTgsviv+lgYh+dHTHRvOy0
 bSPuEnlybcvDE6IqNCZ1aEwUKYQRsVrTZljuv4s6KrgnWTBFxVw7C7ueA
 gLsp4Z3fN8bKLaupn0uQHwAMfHSCiHSP688OlDP67djai8aK0EStdCIDA
 tLgLTXCKHJhd+6HOKn0qEQvk2NQ6dHVm3JwBxBhlw3g8XR39JjHmk7NQx g==;
X-CSE-ConnectionGUID: M941NLsPQpSDiiqPgnFpyw==
X-CSE-MsgGUID: /aO6hY34SpemaEhl053PnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="31811769"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="31811769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:01:58 -0700
X-CSE-ConnectionGUID: HIRI7/VlRQqSMle7tqaKGA==
X-CSE-MsgGUID: PTDyBPLFSbKIFm74utDbSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23968315"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 05:01:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:01:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:01:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 05:01:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 05:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DufMZ7r9bEOt4LHWcoP1KDnHTt23SWjxMTpdEmIbvLA4vHQeKwWvBT91kNdYQK4VMpjcceVWvhTTCsUTyFJTwLUjEfIezMtUd2S7xLsTuohGJEMtBXy/u5Rv3A02r1XCMe2IeYC4iGXjwQ35Vyt4/XtCeb2mFNyCTLY+lLc3/YHksnMROavY9okmb4/NvpkY/NC3ERXVxDXn8D2xuj7Nb6oRJqRZDt7wI5i1o6G91uQbzJsT853C3yktlWFgN9LNBNX/sdUePuVaUgpGQ1pfIvVytEB6AqaFzxjTY+K+ShbfWAEKHtKQWOSpDvFo6mqLQCxnVP7tGJr1+/8u63OgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxTRb/sr7Lh2OY5pnFy+8/RD5SuptmRRSOPzIvLpRUE=;
 b=INDTRFoOYzf7kK0myOsGr4kJi06vNlt2xfWi6XYqSTj3LP2CM3r42QGRBD0ha5bZ3uj3be5zZF1zh1uFhnREQLwA6Ueohz/kFg5STsMlncO00GLFBRIt7c6tzPjn+vADBnbXFEconvxD3yMzflLKqnMTjVsE5YL7ELLIj6b+UYFiD/+KnHlErJVDZJoEu2YIkZ1/iPwyHckB59pTVVkhefLdpdRMK/dw+zwOHYCJKxBK0yqX3fdTdxiYDYmUR1CioCdxXAvWet96mKUYqOCoDUg/VXz98UuQed36xHo5FrCx6JEWDl2etGxIOZLRHtkenfp+hqqcf1oQlyB1INNNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Mon, 22 Apr
 2024 12:01:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 12:01:52 +0000
Date: Mon, 22 Apr 2024 14:01:50 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/kunit: Add PF service tests
Message-ID: <20240422120150.xt3iaiuok6nf622e@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
 <20240418152802.182-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418152802.182-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR0P278CA0181.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 017a398d-4d0b-40a9-f008-08dc62c3ff79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2t1QmJaekRqcU05QXNWbmZtcGEyZ1NGdkI1TnNneVd2MWdkSmU3SGl4MEtv?=
 =?utf-8?B?cW1NZnA5NmpkSks2UlBqVDE5ckkvM3VDUUpoTnJNcFAvZFdjQmV1SFIvSktG?=
 =?utf-8?B?aGtQeThPci9WSEx2SUJrZkpodlErRGlJNmRtZHdLY3pieDBvaDlON0FkV0wr?=
 =?utf-8?B?QnBWZnBzRGlHUWlTZ0JpdjRFdUt4ZFZaYlFUNkp0YzBZdVlHT1l3clE1bkM5?=
 =?utf-8?B?Y3FyM1lITTZ1SWFpOUZqaUpoU0pyNTFlaVUzcUZTejZaajZmc1NuWmZ1VlNr?=
 =?utf-8?B?V2Q5U2JXR3RqblhFY0xNYVMzYUhvU0lrYVBIMEhVbU1RT29HeFVEK2l5ekIx?=
 =?utf-8?B?bmNWL25jZVdzOUdqdVZZRlI1TW5lVXFJTjUxRG9BTC85UTdiME1IejJ0TnlC?=
 =?utf-8?B?TlJyeFZEbkFQUzJlSmd3YU9nSjdDenZ4c3NUVHJQUjBDeGNNamswSXVzUkxW?=
 =?utf-8?B?Q05ZcEZLWDBIcmR2Ukp4dUViSWt2YlFKaVdIamRjYU9BVkxTcTZ0V1IxTVBE?=
 =?utf-8?B?eWlkaTVtZWhINSt0dUVwZU9TTlZwdHBaQ2w0TjE0UnZHWW01QjY1OExjcC94?=
 =?utf-8?B?dWFXQ2pMbzRkYXRmc2tJVjZqR3pYK0NlWnppS21vYXFRbHhTb1RwSHk3T3lL?=
 =?utf-8?B?R2RDZFVobUh1ZEZrd3ZMMXArdU5RZzVYTkhPdXV0eW5MR1F4SC9penU1MWR0?=
 =?utf-8?B?c1Fjb0R1RGRiVzVBY2RKeVVWNnJUTkhjd0ZoMnZrM2Uzc3hwQlg2aEdURkow?=
 =?utf-8?B?enlSZlFSNjRkQUhURzNlcy84UWhMQ05DNWN6Zk5NM1BEL2dqUUtGS2t3empk?=
 =?utf-8?B?amVxbkhXdFFaRUxUVEN1Vlp3RzFVNUY5emRqWWpNRjhzY2doN0VwazJNSmlR?=
 =?utf-8?B?ci9vc2gxZm9sZ2xWUWV5dWlCWjAyT2NxamZ2eFFxWTE1dWU4T2RzSjhjOFFD?=
 =?utf-8?B?VlZoaTNxY0wwemVTeWZ5eTZyVGM2UGFDd2tValp6QUVka2NodFk5ejhwekdT?=
 =?utf-8?B?ZU5ETEJHMVdLMVZvYVQ3U0dCT210Y3NTWFpUK3FhOFNZemVIYnZ4T0d0ZGc3?=
 =?utf-8?B?aDRvVWJEUGJjNVZnYWhCdC94V1c5WStNcnlCc2grQjZxYXFUYnJ0ODdjQVVz?=
 =?utf-8?B?OFdpcVFjYWhHL3daRGFsNnkxN25uU0gxRHdmckJvSU9ZZmN5L3o1bk9LWDM3?=
 =?utf-8?B?dGIreis4Y1VuWjBwU0ZuZ1NOWFhsakVLbHRYVlhHdW1ISC9QWjlMWk5LcDBj?=
 =?utf-8?B?VGZPTVFHN3NNMUtUWEdXZ29HSG1GVGhaYy9VVnlUSFdGQXZmMXBMYnVJOE5N?=
 =?utf-8?B?akJFdUE0elFuY2c5d3FjK3VpWjBoaGUwY1V5Nm0zTWpmckg4Qm1QMFd2NWxk?=
 =?utf-8?B?dExXdEJJanUwZUpDTjNCMGJDSi83ekhsejRramlhSUo1M1dWcDhJTEt5Y29P?=
 =?utf-8?B?RmVQWmt6TGhQL3R6WXFpVzF3L1htVUdwU2JuVGY2cVgrVGNRREUrajdNZ3Vz?=
 =?utf-8?B?dWVzOE5wd2dNUnRMMEZBakUrZXRVL3ZCakxkeXR2alU1djRnMnAxMFBhczgz?=
 =?utf-8?B?UkZLNDE1RXdDeHlPQlZqQXdJTEk1V3FwdVdhVGJHT2NRb3lZTHkxWjYvMFk4?=
 =?utf-8?B?N2lmc1p6ellWNGFIYnNzMndqUWlNSHlPRG9MckNOdGh5enIzVWhXVkJsU3hZ?=
 =?utf-8?B?UGUvRkVpSFN4MnZCcW9mc3M5T3gvOENMV3YzTkEvMHd2ZmNxZjArcEVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNXZENJSWlQZ3hIb3I4WkR3cXlIRmUxVDlhODRFRnlRUkI4ZG91RUNablBL?=
 =?utf-8?B?Qm5IWEpvQWNnWHU3Z080Q1VHZHNGVzFyeFFyeXlNWExqeUlBcld5aWtWRFBj?=
 =?utf-8?B?cnE0NVRFWjRMOFF2YnNxRkxjV3FKQk9UYkQzTExtTkZsemFaU2NXN2dzVUN6?=
 =?utf-8?B?bHo2NklpYWY5Y29EOHBkU1RZM2JHaERDeWJBZERodDlVSkVXLzBqcnB3d0E4?=
 =?utf-8?B?Nkg0QjJ2VWhBMnFxMnhOY3JnNWJuOFlpN1hzK2FHZmd3Q1M3Qi8xbENjVDAx?=
 =?utf-8?B?cndRTWxOZEc1dTVFa0FkRy9Qb1ZJV2VGMXdyYnp3UnpnNlJGNUQzQ0ZxNGdq?=
 =?utf-8?B?cEorRlpiNkVjNkZCUjBUdW8zbzJkUy83alNUclU0ODRLWVlGN1dWVndTdVhn?=
 =?utf-8?B?Q2YwMTNlMlRMZUdPYXhUdVpueml4eG53NUVLQldldnZnbWxzTE5Kakc4STFC?=
 =?utf-8?B?RzBrNkZ0SXMzNXFQMXJ1cTJScTdLWlFpelV6N1dZUER2MU5mV1V3L1E0YlFW?=
 =?utf-8?B?Q0VJUjA4RzNrR0RtZXZSOGhBUWN0MnRyWFBhNm5VcmN3WlV1bVFyZS93ZU9k?=
 =?utf-8?B?dWJWLzZTeWFMMTNtWHlrOW9FSXVSN2VHN1kwK3hGZ0NTSkRNUGRMSmh4eEx5?=
 =?utf-8?B?T1h5bGV4c2llTldDWVQxY2s3YVF0dXpad1VpbkZDZUx0WEdYd2ljUW9SSXho?=
 =?utf-8?B?RVJORHRsY0cwTnkzYjlrTjNPN01ENjdmcklGMjNST2ZGWHZZdmlvcEhyV212?=
 =?utf-8?B?K3AxdkxkK2JIcUMzMUxUWlJrODNaSlVwbkdXeldqRWxCY2N4amVka1RlajAw?=
 =?utf-8?B?RGFyNFZCeVZkZ1VuZ3hoZGRud2JlZk9STGNOSU9DSXhDNjk3aURKZmFzSExH?=
 =?utf-8?B?NlUza0dEK0FtNHlqNkg3Ty9qYmR4Unl4VlJpRURIa204alBvSEppbzRJUnFH?=
 =?utf-8?B?N0VNOGtSOFdnclVhdjdOdWs1V1dYUk1sdmZmTnFuT0FqMVJPdkRtcktxaGUx?=
 =?utf-8?B?eHpDYTNJUEdCdlhoZWNhd3VGbmg0RTdQbkhPdnBxN1hzMDNVRE9EN2UyVWZS?=
 =?utf-8?B?RFYvQ0RnZXVnbkNrbFJJdEdYYkFhM1hvaERoYjNZOGlCRGtrcHZRMkhXL2pz?=
 =?utf-8?B?ZGU0SzBzUlFVejBVYmc3ZURnQlRhRktSck4vSFdUSXZVdWdXVSt4NXplTnJm?=
 =?utf-8?B?U1BTWXpURzF5ZEhTNHpocWNZWTkwM2lkbjlyeXV2dUowN2lhdFFqdWd3azNp?=
 =?utf-8?B?UzRtZ1hITzgwckRITDBIOGt5eUkwdTN4NnFZSzZZK1RwcWh3ejFyMUtCNUtv?=
 =?utf-8?B?K0pZV3c1ZE9LOHd2bU5hVStUSUVFK3F5SVpKY1lHeWNIS0tUdzBxQkFZNTNC?=
 =?utf-8?B?RmVSbnNNNXVuaHUwVlBMQWtKUmxaaUFrZUZnVnpHQ1YwUm9TbTBBRFJYcmRj?=
 =?utf-8?B?WHRyblU3d3RKcW90dGlXMWdTRlFaUk12U0kyWjJjWWxveG9admlqSUtPRHVj?=
 =?utf-8?B?YnlCUldJYW5xUzI0V3RCam1tcmU4QXZPZDN3aXBVcDI4Mk5oZXYrdGVibnFP?=
 =?utf-8?B?UWlpVU1yTkwvN3VtR3hDZzY0cEZxd1Y4K3lSNFp4ZG1KOE1rQURrNEt6RmJ2?=
 =?utf-8?B?bFBVVUtNTDZLaWdJNW9rN1pSNjZSa0lsSWw1RzZFaGFIOG5NQm0zMzZBQlp0?=
 =?utf-8?B?WFJmenFYdklRV0gzV2l4cFNyMDE1WHBDTXErdSsyemE1QWlmdTZFVzNQQmlp?=
 =?utf-8?B?M25qeUR3YTBDQlBVV2M4NktHSzVnNmROR2xQNU1kV0NNZ1FDZkplUGdUekJD?=
 =?utf-8?B?a1BrbnVoYnk1WkJKdWFadC92Mzh4RTlwVUZFcDhwUklVOVNiUXRjdVR2aWtS?=
 =?utf-8?B?dzkvRTI1VkNRMEg5aHBZdnJ0aGdhZ2E5RFJUWDBqYWN3OU1tM3BwWUl0ZTQr?=
 =?utf-8?B?NWwvNWVNOFdxck1VK3hMY3ZWdXY4RlE0UXNzR0cyN29lem9adGtKSXNaNkJh?=
 =?utf-8?B?YmNNYklnL0RBblhUeGNnSmRQMHFTbkdsK2tBN1VmalhBRFJOZklLY1d6Mm45?=
 =?utf-8?B?VFFSMWUvV2wzTHlLVWxsdHp6c2xmU3l1Q1Z3UnovVWlVTkVSUXpGRmp1RHVY?=
 =?utf-8?B?Z0NHMmNucHpMTDhKeVRtRDVBelV5ajZlZjBNa3NLOFBjZUZtRHFXZE1nN0ZJ?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 017a398d-4d0b-40a9-f008-08dc62c3ff79
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 12:01:52.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MauKxzQlq1TkQSVh4TdB3gXYy6SxNHlYO+E+7MsQfRwtSttAoCiitv+VWHc9kESMMi6wWlvDvcMTPNOYgsnnBNfr09vs/sV43b/7cFsXKKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 17:28:02 +0200]:
> Start with basic tests for VF/PF ABI version negotiation. As we
> treat all platforms in the same way, we can run the tests on one
> platform. More tests will likely come later.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   |   4 +
>  2 files changed, 236 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
> new file mode 100644
> index 000000000000..b683585db852
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +static int pf_service_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	gt = xe_device_get_gt(xe, 0);
> +	pf_init_versions(gt);
> +
> +	/*
> +	 * sanity check:
> +	 * - all supported platforms VF/PF ABI versions must be defined
> +	 * - base version can't be newer than latest
> +	 */
> +	KUNIT_ASSERT_NE(test, 0, gt->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_NE(test, 0, gt->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_LE(test, gt->sriov.pf.service.version.base.major,
> +			gt->sriov.pf.service.version.latest.major);
> +	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
> +		KUNIT_ASSERT_LE(test, gt->sriov.pf.service.version.base.minor,
> +				gt->sriov.pf.service.version.latest.minor);
> +
> +	test->priv = gt;
> +	return 0;
> +}
> +
> +static void pf_negotiate_any(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt, VF2PF_HANDSHAKE_MAJOR_ANY,
> +					     VF2PF_HANDSHAKE_MINOR_ANY,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_base_match(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.base.major,
> +					     gt->sriov.pf.service.version.base.minor,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.base.minor);
> +}
> +
> +static void pf_negotiate_base_newer(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.base.major,
> +					     gt->sriov.pf.service.version.base.minor + 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_GE(test, minor, gt->sriov.pf.service.version.base.minor);
> +	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
> +		KUNIT_ASSERT_LE(test, minor, gt->sriov.pf.service.version.latest.minor);
> +	else
> +		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
> +}
> +
> +static void pf_negotiate_base_next(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.base.major + 1, 0,
> +					     &major, &minor));
> +	KUNIT_ASSERT_GE(test, major, gt->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_LE(test, major, gt->sriov.pf.service.version.latest.major);
> +	if (major == gt->sriov.pf.service.version.latest.major)
> +		KUNIT_ASSERT_LE(test, minor, gt->sriov.pf.service.version.latest.minor);
> +	else
> +		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
> +}
> +
> +static void pf_negotiate_base_older(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	if (!gt->sriov.pf.service.version.base.minor)
> +		kunit_skip(test, "no older minor\n");
> +
> +	KUNIT_ASSERT_NE(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.base.major,
> +					     gt->sriov.pf.service.version.base.minor - 1,
> +					     &major, &minor));
> +}
> +
> +static void pf_negotiate_base_prev(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_NE(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.base.major - 1, 1,
> +					     &major, &minor));
> +}
> +
> +static void pf_negotiate_latest_match(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.latest.major,
> +					     gt->sriov.pf.service.version.latest.minor,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_latest_newer(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.latest.major,
> +					     gt->sriov.pf.service.version.latest.minor + 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_latest_next(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.latest.major + 1, 0,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_latest_older(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	if (!gt->sriov.pf.service.version.latest.minor)
> +		kunit_skip(test, "no older minor\n");
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.latest.major,
> +					     gt->sriov.pf.service.version.latest.minor - 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor - 1);
> +}
> +
> +static void pf_negotiate_latest_prev(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	u32 major, minor;
> +
> +	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
> +		kunit_skip(test, "no prev major");
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(gt,
> +					     gt->sriov.pf.service.version.latest.major - 1,
> +					     gt->sriov.pf.service.version.base.minor + 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major - 1);
> +	KUNIT_ASSERT_GE(test, major, gt->sriov.pf.service.version.base.major);
> +}
> +
> +static struct kunit_case pf_service_test_cases[] = {
> +	KUNIT_CASE(pf_negotiate_any),
> +	KUNIT_CASE(pf_negotiate_base_match),
> +	KUNIT_CASE(pf_negotiate_base_newer),
> +	KUNIT_CASE(pf_negotiate_base_next),
> +	KUNIT_CASE(pf_negotiate_base_older),
> +	KUNIT_CASE(pf_negotiate_base_prev),
> +	KUNIT_CASE(pf_negotiate_latest_match),
> +	KUNIT_CASE(pf_negotiate_latest_newer),
> +	KUNIT_CASE(pf_negotiate_latest_next),
> +	KUNIT_CASE(pf_negotiate_latest_older),
> +	KUNIT_CASE(pf_negotiate_latest_prev),
> +	{}
> +};
> +
> +static struct kunit_suite pf_service_suite = {
> +	.name = "pf_service",
> +	.test_cases = pf_service_test_cases,
> +	.init = pf_service_test_init,
> +};
> +
> +kunit_test_suite(pf_service_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 4b9850cc3615..80899fa1ad2a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -547,3 +547,7 @@ int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p
>  
>  	return 0;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_pf_service_test.c"
> +#endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
