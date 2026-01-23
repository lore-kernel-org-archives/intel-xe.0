Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F74D7789C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 18:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E01010E2DC;
	Fri, 23 Jan 2026 18:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEQZWG0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D70210E2DC
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 18:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769192428; x=1800728428;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ALpxb5nlK5Khb8miR8QXoDMGeVfoAhxNhkIflVsVQ8s=;
 b=cEQZWG0c5aGHk9wjj8FgzivKSVCuz+HzGsdzHkRoYSmP63zWCpwyjCke
 OutlstFPD1veCX80Z7iVumC8AAavbKhhTB6o0l14EDwJgo0TVJfs+y991
 fyPa+3SS8Dh3sqibbE5MA4upiiuGBA4jfyIgX9l72NOoB6oQgUA7v3RR/
 g8ZpyY9nfZbBwnBV5D541g/h2LMgwDJO223MdxcG9mPIcpI3A8gifPjsT
 8wSnxIKCYeKTK/Ix5BetX2f9cqo+bBiVrHUQnWVCOe/OHcgT1B5OloUBE
 ftMZx3wbrRk36I+Gow5xfA3BzX2CBKVTqY1Z4/2XgvrfGi6TTAtRDcvZD A==;
X-CSE-ConnectionGUID: uNP85hdiQaqHP08y2Dfd7A==
X-CSE-MsgGUID: QuG+uz4STP+7zI7cpd2zVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88025801"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="88025801"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:20:28 -0800
X-CSE-ConnectionGUID: 6mwPyVopTPCWd9ab8e2gyw==
X-CSE-MsgGUID: FbH0tb65ROOeayKZay6WBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211951104"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:20:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:20:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 10:20:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 10:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0f0mpfaQjQuMFPZeMREyu7V/G3Simea8eMTvGuUnGeMIuYV0gM0V+JXEtWCGjYHDfgK4KQH6e1/uDv97spmA9H4gexLHZFYjXv8M1TNtLcV/cKfckw4Ftejlht7MKHnrfWFTpdZlK9RMqn+1NUHq0+k49ozHTlh4acAOACfK4Y1/ujp9MWLqJbZEzGnqrDFOf868mCqjYpFIWfRWEArYLyACPgnq1ruQow4lRU6woL5lGBZvlfSLik/cQ6Si/ET+I2cMBkHFBFAEkfB/ZVoa/fFAVimJgXzOo6/O0xIBSotJvMmm8rDxsjf4pt/A9heeJ5piAu49F5VS7nuhLB3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pmTQ19OZ9ZQQNlCKX6e/dD9TsRcFIxgDrsdwxGXkls=;
 b=dxdVK0xnZXIXdgwmQbvu9vl2TmytMiXGZKWGtM0I0BeD3mx1VhX6DrcYDXgcXq8Nh3jXrV0oYWxq/4LTpfDWy8/XAc9N4C6ZgL+MmPS2sj9LFl7hFh08oA4Is8apZDj8/9cRemTWa0o9IKT6mIpw53JyWS8Ie9PKx8T61mePxrWns/vKchElena9EkbYy9Go7IP/Rltnt+npcLLQlma4Bea8nKw8rf3SW/H9KJ8xjzWnFDryasGi1XJiWkB9W8HM3z+wA0SKVeMAUIiFVuTJC+yJDhY5ktwgRcfgw0rUli/pwPB1fUiJGOGiOza5U4KoYgq6cmygRLyQeV4uhrZv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 18:20:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 23 Jan 2026
 18:20:24 +0000
Date: Fri, 23 Jan 2026 10:20:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/multi_queue: Protect priority against concurrent
 access
Message-ID: <aXO75hKp1NthswhB@lstrano-desk.jf.intel.com>
References: <20260121211933.3354277-2-niranjana.vishwanathapura@intel.com>
 <b6b13b58a7ffd230d68964e32ddfea7972809751.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6b13b58a7ffd230d68964e32ddfea7972809751.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: c9673afb-f392-45ac-0083-08de5aac1368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jHyiD+AcEAlrusnfhY0QWTS5NaP8jNvSTeYoblRKEZ0h3mZe1wqq26mZn9?=
 =?iso-8859-1?Q?7y1w1ld96s6nFhqURjGJRZQvgjzYi9S4c6MgHKe2VDl2BPneLRxwASzXPt?=
 =?iso-8859-1?Q?3J70chcX64OesJAOO/fhCe+ppfgjI9+iJr+JF198/m3vlfwV5YdM5ezs6G?=
 =?iso-8859-1?Q?xniRial46nZkX6r8YSI4DctL/HpHoSFsXNce/5skQq0Xd4BWNvNVURJ75W?=
 =?iso-8859-1?Q?agaVr+VKQIeQgpUWixRPs+FlB3++Yhxv4Uu0atvwrGS30xBX8ZFfWqMZIl?=
 =?iso-8859-1?Q?A+LSS6qzMUJJ6l7NSMM+5tTQCV3wgVRGBI7Dnt+wcFQ22Sm0g+sMDTQTkY?=
 =?iso-8859-1?Q?/VJDPlNxf7gDPtCpj4yQ9s1VVgxsovSyFr82LwBeoaYPSg1ACDjiT2q1Za?=
 =?iso-8859-1?Q?CRPr0XN/GMWut5rndXVFvgk6I7fe5K8SS5V1k3doI5rqXs8O3LXAWDlIx4?=
 =?iso-8859-1?Q?h09L1x/YSmivACU8OvuIVbE4a/PUW5eS83cfeQNKpKkNdlB3Y0WAtaOisQ?=
 =?iso-8859-1?Q?6GgPrXlCGstWvlU3A8GkWbHsaJ/19ocj/femzBUR6hfZ+CxIb2VEbfadxz?=
 =?iso-8859-1?Q?kMPFrpWsDMljxPqs0gv97Tw9/HKY92iNysoZc4AcowzAZYDZy76n4uVFDB?=
 =?iso-8859-1?Q?d79MjV1BAF84Mu48ATmzjPtBfXJBLpkXO735jwd7dUnUqe9CBALTKtTtaV?=
 =?iso-8859-1?Q?cPWR6IbVPhUOzS6+ZeuVE/eVOymLuH9FrB9TtpwhyBJxtQ9pRJUF5FlSMs?=
 =?iso-8859-1?Q?KbHmuQNPkJCB7AY1M9cNWThA29ckVMYRQs6eNkYEN0wU6wys9zBVvTV46B?=
 =?iso-8859-1?Q?NVfKMQEwZz4eUcIFbG0v5PjneSXT7iL8Co9Z5Utu23+Q2aMCMIUAKdCKH3?=
 =?iso-8859-1?Q?CPb0lnuYLahnVx36vv4nFl4nUMnXjFpOOT5M1Rs/0XZxrEcESjB2WDBUt5?=
 =?iso-8859-1?Q?NZkZwq72pTOL07m6LtaOvblXyCD9E3idEuZNnwXTV2bT+EY4M8e8AfQjel?=
 =?iso-8859-1?Q?tis28tSxTEqxkXgkj46SKs+DRBdDdYmCTAp3FIX5dzAmv+UBY1m02mxZ+u?=
 =?iso-8859-1?Q?poc+31Ng+eebiS5QIHR7UzWmIO6x3PXKj/rBCt1T3coyzgci8i5ZPE7tOu?=
 =?iso-8859-1?Q?K7wL+bcwi+zdRKRdqtb4eH6kMyoi68P4MP7Uj//0IzdiJlN+S+0fbGATCN?=
 =?iso-8859-1?Q?kbBZhQIf7dXzCbLokr6uevEBVLBnH2iqcvT0Ie+MaEBA5KGrSOc6wg6Tml?=
 =?iso-8859-1?Q?pF8vp7JbSyRj67TqcDTnQ8lK5kxQqeGjIrrhdcQ0EQ5LLwzMnLzHPTPJQO?=
 =?iso-8859-1?Q?cV4xs7PT/EQrQc2uem3KYheC8VrAE3chL1o6O/YjPiTgSId8n1EyDeCLIn?=
 =?iso-8859-1?Q?eXl7jSn++35I5iZyQaDH4mRXZO6deV3jMpQGESTifvb14uiVu+Ng7hIzlh?=
 =?iso-8859-1?Q?4HKJgcEaQXRTDJ6YsaEwc6ob2Acvni8DImCIEn3o3tqv0An+kbY2K3Kqk+?=
 =?iso-8859-1?Q?nynZVXIJfYZIU6H8m3kIIYdK3aaiE7u84mWdp1MQilnWPaGXPYPKsD50zq?=
 =?iso-8859-1?Q?5gwyaXKhlKDvJ/T7i0t7Q5TPx/hUbRL6HjgxPjB4+Dayvl2W2J0ZLhL3xr?=
 =?iso-8859-1?Q?bQWAACPZvxLrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CW6ga+BnVvzliNoiZz9q9G3R5rSoojT36v+qPSO6cTMeRE5469Nky7dgBv?=
 =?iso-8859-1?Q?8zcPP/YBP4rm0OjFXRBoDEy2QA56Oh8npW0Gz3kI33DIouyk7s/zAmCyla?=
 =?iso-8859-1?Q?TjoZigfVZ800Y+y2vR7GhPcl9IcASbwl9nPlUvwWp+OG7fEVIOFM9yuvdK?=
 =?iso-8859-1?Q?Uyy+/4TGikE+WHpHTLdJc+F0vmlMhMNztEEmN0ssmB842R7gF8HAj6Tndo?=
 =?iso-8859-1?Q?pc9yRoqJQXqFUrer6ZTtG6yFlpqxkq0D7bQ+JmS1fmzSClYYatIYBQWesU?=
 =?iso-8859-1?Q?mnnhyCStpjNaVUV7t+b0GTn3/oSC5B2cPgb+BXr6v2Ukqw1bCteb1iipwT?=
 =?iso-8859-1?Q?4meIo9/FAJpAt51WZBrdoxcZ4TQY2l8dJFdS5+hRq6WM9g16tHIC3rCzkQ?=
 =?iso-8859-1?Q?Zy9/bPoJ+KO7wIJDpy487NRo/kS2aMpr9pM7eooACBDEmeuzMYob3wVo+k?=
 =?iso-8859-1?Q?qHtU5rB7V64TDgo4cjxMCNj2zUWfCbQHtmiAPq6dpIpmwIveZs7cKskWfS?=
 =?iso-8859-1?Q?BV3aljCYCfvEtMo7tPfysVPZYbfFh9+Lg9gVaL1vZUBR6sJjt2BVV1m3LG?=
 =?iso-8859-1?Q?QxDDRs6QnctiMQ6EDLvTV+qp3/sokRm4pcLtX9CTirQIoMan6n/Tol5nCy?=
 =?iso-8859-1?Q?zD5H4mOsiZH/N5UQwkYqjp55bnkfwQ2PmyG6c5MIHzjif73IMN7aUTvSFn?=
 =?iso-8859-1?Q?+LzC23bHUAs3/VgdRT0a2B3LRS6gIIy9ZYMMej22QKmHxebPyumqjdkueO?=
 =?iso-8859-1?Q?pDB0mRdfywDfprdanhrhYheCv33s/UGnSRY60wJD0d23Gfk2vrREcVNn0o?=
 =?iso-8859-1?Q?Kn+mvX+aldSZlEiq2oR21Jpbuc8FmHflt/w3ay1opMC3cSH6fZ+Vx6Lqss?=
 =?iso-8859-1?Q?9H2LOaaqUdhNcOne/RdSt7W/vs+NUwLWkyjGAB8gUtHozOp7HX7hOe+ep8?=
 =?iso-8859-1?Q?lT6ttn5DskjFPMuKcxej0Zjhj6n05Q0SvXP+jhRTfoWWV4hsbmVEpu/0xd?=
 =?iso-8859-1?Q?WIzLG1+EN7IF0ejdkEnPHGYfMg1Gb22ev+x6rGGNPWarnaewqPrZFEiDCk?=
 =?iso-8859-1?Q?30vU2am+R5uekrDWk0goz2EhmZgIrbGkyveNqj9J3oNZ7CB8ghRHB9ti1M?=
 =?iso-8859-1?Q?vGS3iY20CxO+1s79H9J2Yrrlcb/LmXZrp/7BYyU29/rsoujxxTTbP6ekuF?=
 =?iso-8859-1?Q?ROzF1ozCdvsm4rKhLlzPFwTZiKaBotQ3k6/AxfO2UU4MEMHJJJvd6F3L25?=
 =?iso-8859-1?Q?Tq319Z/HtUaEgOORPyrV8IDANS06TOyvH/xbpJtq9AYDCEUMY9BV0+mThj?=
 =?iso-8859-1?Q?LA8pN+UdD2BdblwLEhvuUHKuOzUqyyBaXoQlLGFjGNCm+CLiZpZ9Dtkzyk?=
 =?iso-8859-1?Q?Nz+a4eMPMT5sQtpPB0e07hmw+5DQn6rTFc8GcOyVeWP0ZSMFvZo5KSPWhy?=
 =?iso-8859-1?Q?DTNjE/YOsw5L6LDfik0m3+LG3ZvWyMyCWjmRbatQ5kVN9uMInm9yjwkrC4?=
 =?iso-8859-1?Q?ZK6jg+8oHMa5L9Zj82agA9wwBWi5Oe4jfU1hKO0cTatKno34/H6JgNVLKx?=
 =?iso-8859-1?Q?cPjKBIdLreb0tSQWHdjEZCfzXD0Tjl1FLqCQGKdrvzIQxYC8Fe7Upoo8bO?=
 =?iso-8859-1?Q?xpyR1yD7cDCWCYfiVehqGmokGpMAeeZ2PB2jYdCXCtYqu+dFI757x9uTsg?=
 =?iso-8859-1?Q?QbfSMXJq3kowRtPW55o0uC0BmjK/4t0Q4hgF9XCQHF3wC+XMZrvJrkER6E?=
 =?iso-8859-1?Q?cU9O+5C+pFNWR7JilcDk74jTH6Dei1nFY1lCq7eHPjRUNjzh6gCZys0bFw?=
 =?iso-8859-1?Q?lsup1UeNEg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9673afb-f392-45ac-0083-08de5aac1368
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:20:24.0940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R9YRKssfRrIIB+dBt/bnyHHy2THHRVLi7NC7ppakUYkUcquc4Z8jNN9jqrVnvz9snFvQwTGkOhqHTuzt0oBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
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

On Fri, Jan 23, 2026 at 01:04:10PM +0100, Thomas Hellström wrote:
> Hi, Niranjana,
> 
> On Wed, 2026-01-21 at 13:19 -0800, Niranjana Vishwanathapura wrote:
> > From: "Vishwanathapura, Niranjana"
> > <niranjana.vishwanathapura@intel.com>
> > 
> > Use a spin_lock to protect multi-queue priority being concurrently
> > updated by multiple set_priority ioctls and protect against
> > concurrent read and write to this field. Also, guard against
> > compile optimization by using WRITE_ONCE() and READ_ONCE() macros.
> > 
> > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 20 ++++++++++++++------
> >  3 files changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 7e7e663189e4..66d0e10ee2c4 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -230,6 +230,7 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> >  	INIT_LIST_HEAD(&q->multi_gt_link);
> >  	INIT_LIST_HEAD(&q->hw_engine_group_link);
> >  	INIT_LIST_HEAD(&q->pxp.link);
> > +	spin_lock_init(&q->multi_queue.lock);
> >  	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
> >  
> >  	q->sched_props.timeslice_us = hwe->eclass-
> > >sched_props.timeslice_us;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index e987d431ce27..ab6980aaa36e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -163,6 +163,8 @@ struct xe_exec_queue {
> >  		struct list_head link;
> >  		/** @multi_queue.priority: Queue priority within the
> > multi-queue group */
> >  		enum xe_multi_queue_priority priority;
> 
> Should probably add to each field protected that it is protected by the
> lock, and in the kernel-doc below mention that it's used to protect
> certain members.
> 

+1.

> > +		/** @multi_queue.lock: Lock for
> > @multi_queue.priority access */
> > +		spinlock_t lock;
> >  		/** @multi_queue.pos: Position of queue within the
> > multi-queue group */
> >  		u8 pos;
> >  		/** @multi_queue.valid: Queue belongs to a multi
> > queue group */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 456f549c16f6..76dd3a204811 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -827,7 +827,9 @@ static void
> > xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> >  		return;
> >  	}
> >  
> > -	xe_lrc_set_multi_queue_priority(q->lrc[0], q-
> > >multi_queue.priority);
> > +	spin_lock(&q->multi_queue.lock);
> > +	xe_lrc_set_multi_queue_priority(q->lrc[0], READ_ONCE(q-
> > >multi_queue.priority));
> 
> Since we have the lock, no need for READ_ONCE()?
>

Also agree no need for READ_ONCE, WRITE_ONCE if access is done under a
lock.

Matt

> > +	spin_unlock(&q->multi_queue.lock);
> >  	xe_guc_exec_queue_group_cgp_update(xe, q);
> >  
> >  	WRITE_ONCE(group->sync_pending, true);
> > @@ -2181,15 +2183,21 @@ static int
> > guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> >  
> >  	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> > xe_exec_queue_is_multi_queue(q));
> >  
> > -	if (q->multi_queue.priority == priority ||
> > -	    exec_queue_killed_or_banned_or_wedged(q))
> > -		return 0;
> > -
> >  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> >  	if (!msg)
> >  		return -ENOMEM;
> >  
> > -	q->multi_queue.priority = priority;
> > +	spin_lock(&q->multi_queue.lock);
> > +	if (q->multi_queue.priority == priority ||
> > +	    exec_queue_killed_or_banned_or_wedged(q)) {
> > +		spin_unlock(&q->multi_queue.lock);
> > +		kfree(msg);
> > +		return 0;
> > +	}
> > +
> > +	WRITE_ONCE(q->multi_queue.priority, priority);
> 
> Similarly here, no need for WRITE_ONCE()?
> 
> > +	spin_unlock(&q->multi_queue.lock);
> > +
> >  	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> >  
> >  	return 0;
> 
> Thanks,
> Thomas
