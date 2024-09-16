Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8C5C3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 15:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE16910E3B0;
	Mon, 16 Sep 2024 15:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRNUnGXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A683110E3B0
 for <Intel-Xe@lists.freedesktop.org>; Mon, 16 Sep 2024 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726500781; x=1758036781;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9a8q6FEVhY0hngqQmODctYqyAGdygz9oZmBEQub9Tso=;
 b=HRNUnGXIiIuQ8gsckvFiMojMgX4sVzTKM4teeq8yvAabU7SXel29GhHH
 84nAwxnLr/Ruruv9ceMbh1UEeBpNK3p+DNsaZYMrrpG461Oc+j8xFGEIm
 JB2YduOqUI2Yh50CpckLbmRPb056UppKde4TJKoyvFw2N021cEIYbJwnh
 s2EZ3HhdOHP0m2kP7aLSmiQiAo+yA6IATPGDSGGqILGHNbQxv67QDosgn
 aukWI1gRyDeqCDbu6TbUAWFHut4vfVwT9AnsW2aG9FQiGGifnIf3Fw7HC
 wyfpZHf5nmxDrUw4WtCJ7PiXPnAciRCwIPWvLLu/aW2pbp+m0Q9onWctR g==;
X-CSE-ConnectionGUID: 2WecD0yLQh+OH0joG9P4Bg==
X-CSE-MsgGUID: LhWpWtiyRgqJNc96FY9pvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42848923"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="42848923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 08:33:00 -0700
X-CSE-ConnectionGUID: CfXmEqK5S8C2ojjff64SVA==
X-CSE-MsgGUID: oqJtA5twTPWr0wXfxRvnGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="73259272"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 08:33:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 08:33:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 08:33:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 08:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixh38P2dS1HYD6bbHjJKY9nQLTAu+ca6SBM+Rg3j3Jt1q1dJe+kNMMi9K00ixiqFAyP5CIZOdmKvMV1uXeAsIvS8rnj30+Jow/sxpLPs2QgAFeKC8LU/Fi7ey4Wtt6GrNgYqrCLquQzmiw8y6hIB5jRgMW1cy8H6rQUSaTB0XeTRchgu4JVEXcuEOQ6GYRpCAXIKBXlZwM1NOlJVVNkyD0lgEUAFRTA8PZ6GFVnqzIxiwAiLBBrpL1wVZhI1QPQZ3awTANKqIqEDOo02W7YzhKPezsDAQT54jVa1yr+ahbQwQWVYbDHz6Ddv9VCc6N9NF525JlCL2nREAezGEMhGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eU7M5wRB7DQPv5Xq1ysWMElB7b0NPQXGZpnQkiR6Avg=;
 b=bTzLEqmM7LsuOM0D431bXCvD2mhg13084SuOPsaFTbu+UbqY8WSQgyakVl52xgXoh3Pl6baMnV9yQWXi/wZSc/F3rM5ZbJDQ402QyFkNaMg6pBQOSdvXqan2Ro3SClqU6gGYA9Fzsz1lqvrioi7arNqKWKNNgeLVnEzTkD/I1YQtkI05d9n87kpFvUQ9D46z4mbNCujPYfaItLbz9cGaAMTHT2Nbm4He8dngb8P4EIkweV1K/A3b2f/AVwbmoA7OHdBbdkcWF0roN8bxO6oUip9e1FijhMXFHW7akrkWQLESijbW4Pfmziemhb9JDSJAMz2SMRe3bc3H+2RtSfg3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 15:32:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 15:32:56 +0000
Date: Mon, 16 Sep 2024 11:32:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Intel-Xe@lists.freedesktop.org"
 <Intel-Xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <ZuhPpD2lLIYjm1tP@intel.com>
References: <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
 <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
 <7c75dda1-e62b-47ff-a6e2-0da2f080126f@intel.com>
 <0daf2e5c9ece014d5f85b5bcb0cb44dafa2449c0.camel@intel.com>
 <c57ee885-2cab-4a7d-8ce3-d9e7b3ab55d3@intel.com>
 <ZuLzSMH_hBl9RWdv@intel.com>
 <c07f4afc-e995-40e5-aed8-1a5db0c3547c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c07f4afc-e995-40e5-aed8-1a5db0c3547c@intel.com>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: d9298eb8-2acb-4e1e-1f14-08dcd664d634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jCwsM/2oeGKAIcF0fc0SaPl+Zk3rrZl6Z02LhzsAnBFZYA5e4qr7TnKIA1?=
 =?iso-8859-1?Q?2b2CZrqRW0GxPb3jrDxW5uyKOnqdEXMuW++A/3nWnfWlL6ETusL0a8KBZ2?=
 =?iso-8859-1?Q?Ds1ElbaifFInScCSzGeVbzxy9jIAnqYz7wwZ+1hp87YOHTrhmKEe2HiJ9E?=
 =?iso-8859-1?Q?V2wlt0XX5VpKHFws9MYRSY+ikpg1Cby+eRI9vfzwai3Z+UNc/D65qvO4T9?=
 =?iso-8859-1?Q?VE7hUz8BKqDcnOUQILz88Y0wxyECLTCUpIiLuBBNaibfEdPvT9osrXVZi1?=
 =?iso-8859-1?Q?SU+oyAOeZZimsOZ8qjEtfWNoeUNnuaiPb0X7h77j1YbYYsVVionyVRlQ5B?=
 =?iso-8859-1?Q?JcURD0AYRbFGjzP05lApBX3nnJOLjtW588nzURpL4cnp3ZpBcZGRQouHy7?=
 =?iso-8859-1?Q?OZJI4n57QDk+tPivAXCCm7Ks8fRN5pcmspGip3FIZsvpVh2p7fHbLVbog5?=
 =?iso-8859-1?Q?9llNOpHg0nwyHTWJ6DpQ+p+hT+07R3AW1p9JRy1nHIvAvXtpYsYJW2kO6j?=
 =?iso-8859-1?Q?gWj31Alv0THOYAZb+BMttcxzXK4qXsfRDGmc8zOeQcii8ZIVYCLp9EXxTU?=
 =?iso-8859-1?Q?xqs5BU/KyWlPWlAIUC4ZtJ1MPp98OVhmU1V1zBxau7nnWyhvwpUyrY5FwS?=
 =?iso-8859-1?Q?NSnwtDgS/t/tMerDyszf1/68iK0hOqWzWF1QmaNyewkGR8SYh2HqVwv7uv?=
 =?iso-8859-1?Q?+0NIkLtgB7ff2OPx6zmr4YdrcIlqTRCxX7Nkc8vJ1MBp7E8d+ehvJ/ekhu?=
 =?iso-8859-1?Q?AZvFEdzJwZAOjJWnhSN/gejMhwNv58LAdOTNpsINw1ZMXNrVJTXamHEjUP?=
 =?iso-8859-1?Q?jxjrcpSzTgqwtNowcYskzN8CLY1dXMVkVOFCrZkDEd1+TdvgMLUtaNVdCU?=
 =?iso-8859-1?Q?1BIplr5s8fpBKGkzb/z6yh8BDY9R1JSutGEb4yrgm3BPbaJGM6iQkeKwcw?=
 =?iso-8859-1?Q?IqFkIvQn+T7H7U2e/w1YuYgzT/NZsLX7UZZCJM7ws+23ZkJ9y3Mp0CCnkw?=
 =?iso-8859-1?Q?fr5nRlo62pep/094dlrdLjDbqC/uq2Y04YBUNi8zRAhEpI5xSNpUheoaaW?=
 =?iso-8859-1?Q?0XENOk/dYTnv31t6nwNngK6TZfy+b5EAdctU2MiGbdC/MMw+Gn/SusMPYu?=
 =?iso-8859-1?Q?4chi2fehka4FX3D5DGar36+JMz5EH53ltNfnmrSEYRSjf5VZup24j6d8EP?=
 =?iso-8859-1?Q?GZrplBZ5u0jqpQxtrlXC1f5mIWXBfE23/PjXAa1mn0XJIbd6XVvAz5aGMx?=
 =?iso-8859-1?Q?AgoHcPxYcksoAvY+AAlwaVp2f2ujxHUGDqv/R9jWqVSAfxCAMyazkiOcDJ?=
 =?iso-8859-1?Q?d+mtWpE4nnw6mwAYD1/hiJ4tKVcpWMmp38vKG4tyJxhHulUYiTbO2Vf9Vr?=
 =?iso-8859-1?Q?ObNy7Wd0kYnyhRNHH/2JBd961slwo5rQHnd8veJx6H92FxUWC4Uv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u8ybTVQnuVfhK25IhHsLEPA+oJq+OlV5bvc6jgz1psg1zrcqAAy0fV7A6m?=
 =?iso-8859-1?Q?fTkBxZFejleq0PecWUUQSZuv6FV+3XfiQJN/Lmvm4aZ4+NCHbXfmFVW5ys?=
 =?iso-8859-1?Q?K07KH1QdmWiC2KmJ9hr5fz1Fv9vithWPVEXyWCgJC0sb2caSsUOD7WNCO9?=
 =?iso-8859-1?Q?q6m1uEvZHvUUIQmpewc/U4i6iJvLmx7i8qaAuDqHS6PDAxrwmBeN2I3yIx?=
 =?iso-8859-1?Q?LVpagII1B/QySnyNfkuIjNaxA8msQo3neQ5Y+VZM336r7n2ZNWBjLq/DSV?=
 =?iso-8859-1?Q?+H2y9Sc7z3AFC+SLIkGjFarR3GaipqVGvsGyMNumD8XOR2mV1QADhZiopm?=
 =?iso-8859-1?Q?/d5DOku4F5JaETzt7Pp288j9jP8rtwDn39tvadNsZuMn4xX8Hy4+uFAluk?=
 =?iso-8859-1?Q?Ow5P8eeyU9vk9cFPc/bsrCOyDhXKjJw/7OFpRsAGRdFHuIzuzFeTEFD+Kh?=
 =?iso-8859-1?Q?xp8xDqFLuWBztMkHDE+QMJuLHcjUopXff7I90bWFyuRMklowqXN4hE80Su?=
 =?iso-8859-1?Q?MpU9pV1yqv77NJWhQbPV2pxgjRHfZ2LKEuJrb8sS/3V6MZ3qB4RveeIMDm?=
 =?iso-8859-1?Q?iJYW8VxxUmFxVOEESZk6Zu7PUfj4L2wMEAtJQS89EjxrUy13cC/HVdl6SU?=
 =?iso-8859-1?Q?pokg0Ul2WERo7N11m2gRdOgnsulFi5LM7H56TQ/N0b/KsMfFSFxMlWVGKC?=
 =?iso-8859-1?Q?+1sNjG4W1K5YfVYHxnznUXdtH4ctAcWtEJ21PcuOPhP1gZ8yeplJ/fSwfb?=
 =?iso-8859-1?Q?6FNesG2LmNYz0DhYFYAYRpC0HNZDyymnLoHugJ12kG5UdSMw+8rW+yeZbr?=
 =?iso-8859-1?Q?PJyzxflrAO/CAI4kSFH0+ZSJVjFzv9ufAMhxZioD3nSDQSoGPbNL1BK2Jq?=
 =?iso-8859-1?Q?RwTZlCqWkjDTuPpiSc1zN+yRLKE48Me6PJ80wPS+EH62Oo3oCXTup3nH3f?=
 =?iso-8859-1?Q?wsXzuyn1UzNhZ5xHo8H02po1OMT/kUqWea5gIdyDg7e6N0bI6nNDznUgHK?=
 =?iso-8859-1?Q?fnlMQHQ0UXfTA2SOqva/Ezpsr6yJVhO2yBOzHMhc+Ex4GM3P7tsydGWtkY?=
 =?iso-8859-1?Q?axZ9T53e2yM0va8DKNPY4n8bFumWmEoeAoS5Dnnbop911UG6okHTfvzPAX?=
 =?iso-8859-1?Q?zhSdHzjFQIMD2kizRLaVdrItAfGQPl3lmVVvhiRy5opCfdnBeWDMr9smH8?=
 =?iso-8859-1?Q?ZGPQQ1IfPhAa6EHGcAnXFg61p+t0MzleGoLEXdpiajj0wpg5fPoMC/DayL?=
 =?iso-8859-1?Q?YTXltswV3h6fEp1ynx4u2Lh6RQUnJuqkW3X2pHUhSPO+75udSC0dxTzYyN?=
 =?iso-8859-1?Q?8AQED/OVPi1QT01kBpg+fHrl3R/scwiyNW9NAkSt3eUZjd4iQTWwI8kwG+?=
 =?iso-8859-1?Q?hEUAtacVvbvkSzJcAOFgeauSV58wPcOnJw5rDD3jXxMV+xcdOxcHeQJM0J?=
 =?iso-8859-1?Q?mCqSIie9Q7kFDi0qI1btGp85BIdHk1YDEbEKX4gSlaMLoEixY0M7/n1ek8?=
 =?iso-8859-1?Q?/1rgVWL43eCl4R7ypD2u2CtUV0PJHJVq5bBP7Fag4TcJ1X00PaT6sIMmMq?=
 =?iso-8859-1?Q?DkmI3FYOEbB9Ty3Xg34lkRp+1xQUwsugRxy0qTbWOlpmQh73FyCFDbKnai?=
 =?iso-8859-1?Q?nwri9ojkkbkoqo+AHHhp16M7JQLvSPO9kaG6EzuA8+VBLFP47jZ65ekA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9298eb8-2acb-4e1e-1f14-08dcd664d634
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 15:32:56.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhGHNhVjm3Q6zjZiyWBFLA2Y/k9qlPTeWXbojBRZTjxYlNotPYJKtp455i16MffFl8d0azZitN6OCN8Tr6uyWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
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

On Thu, Sep 12, 2024 at 11:06:20AM -0700, John Harrison wrote:
> On 9/12/2024 06:57, Rodrigo Vivi wrote:
> > On Wed, Sep 11, 2024 at 12:59:54PM -0700, John Harrison wrote:
> > > On 9/11/2024 12:54, Souza, Jose wrote:
> > > > On Wed, 2024-09-11 at 12:35 -0700, John Harrison wrote:
> > > > > On 9/11/2024 12:30, Souza, Jose wrote:
> > > > > > On Wed, 2024-09-11 at 14:12 -0500, Lucas De Marchi wrote:
> > > > > > > On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
> > > > > > > > On 9/10/2024 12:43, Lucas De Marchi wrote:
> > > > > > > > > On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
> > > > > > > > > > On 9/6/2024 19:06, John Harrison wrote:
> > > > > > > > > > > On 9/5/2024 20:04, Lucas De Marchi wrote:
> > > > > > > > > > > > On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
> > > > > > > > > > > > > On 9/5/2024 18:54, Lucas De Marchi wrote:
> > > > > > > > > > > > > > On Thu, Sep 05, 2024 at 01:50:58PM GMT,
> > > > > > > > > > > > > > John.C.Harrison@Intel.com wrote:
> > > > > > > > > > > > > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > There is a need to include the GuC log and other large
> > > > > > > > > > > > > > > binary objects
> > > > > > > > > > > > > > > in core dumps and via dmesg. So add a helper for dumping
> > > > > > > > > > > > > > > to a printer
> > > > > > > > > > > > > > > function via conversion to ASCII85 encoding.
> > > > > > > > > > > > > > why are we not dumping the binary data directly to devcoredump?
> > > > > > > > > > > > > As per earlier comments, there is a WiFi driver or some such
> > > > > > > > > > > > > that does exactly that. But all they are dumping is a binary
> > > > > > > > > > > > > blob.
> > > > > > > > > > > > In your v5 I see you mentioned
> > > > > > > > > > > > drivers/net/wireless/ath/ath10k/coredump.c, but that is a
> > > > > > > > > > > > precedence for
> > > > > > > > > > > > including it as is from the device rather converting it to ASCII85 or
> > > > > > > > > > > > something else. It seems odd to do that type of conversion in kernel
> > > > > > > > > > > > space when it could be perfectly done in userspace.
> > > > > > > > > > > It really can't. An end user could maybe be expected to zip or
> > > > > > > > > > > tar a coredump file before attaching it to a bug report but they
> > > > > > > > > > > are certainly not going to try to ASCII85 encode random bits of
> > > > > > > > > > > it. Whereas, putting that in the kernel means it is just there.
> > > > > > > > > > > It is done. And it is pretty trivial - just call a helper
> > > > > > > > > > > function and it does everything for you. Also, I very much doubt
> > > > > > > > > > > you can spew raw binary data via dmesg. Even if the kernel would
> > > > > > > > > > > print it for you (which I doubt), the user tools like syslogd
> > > > > > > > > > > and dmesg itself are going to filter it to make it ASCII safe.
> > > > > > > > > > > 
> > > > > > > > > > > The i915 error dumps have been ASCII85 encoded using the
> > > > > > > > > > > kernel's ASCII85 encoding helper function since forever. This
> > > > > > > > > > > patch is just a wrapper around the kernel's existing
> > > > > > > > > > > implementation in order to make it more compatible with printing
> > > > > > > > > > > to dmesg. This is not creating a new precedent. It already
> > > > > > > > > > > exists.
> > No! no big dump in dmesg.
> Please see other response. Dumping via dmesg is intended for internal use
> and impossible to repro fatal scenarios. There is zero expectation and end
> user would ever see a dump via dmesg. This entire patch set only includes
> one actual trigger for doing such dumps and that is only if
> CONFIG_DRM_XE_DEBUG is defined. Which it would not be for an end user.
> 
> And if you are saying that internal developers are not allowed to use dumps
> via dmesg then we might as well give up and go home because there are very
> many bugs for which this is the only viable debug method.

What I'm saying is, as a user of CONFIG_DRM_XE_DEBUG, I really don't want to see
this big polution in my dmesg everytime.

I understand the case that the machine entirely hang at boot and you have nothing
but the serial log messages that was dumped there. And you want more information
in that view. I understand the case, although I know that we should be really
working to avoid this kind of failure to start with.

A failure on a Firmware communication should never ever caused the platform to hang.
But well, you might tell that in order to solve cases like this you would need
information from why the firmware failed so badly, right?!

This should be a one off case, or a totally separate config, and definitely not
driving decisions of stable api/abi like the devcoredump. Clear now?

> 
> 
> > 
> > > > > > > > > > > > $ git grep ascii85.h
> > > > > > > > > > > > drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
> > > > > > > > > > > > drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
> > > > > > > > > > > > drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
> > > > > > > > > > > > drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
> > > > > > > > > > > > drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
> > > > > > > > > > > And the list of drivers which dump raw binary data in a coredump
> > > > > > > > > > > file is... ath10k. ASCII85 wins 3 to 1.
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > > > We want the devcoredump file to still be human readable.
> > > > > > > > > > > > > That won't be the case if you stuff binary data in the
> > > > > > > > > > > > > middle of it. Most obvious problem - the zeros in the data
> > > > > > > > > > > > > will terminate your text file at that point. Potentially
> > > > > > > > > > > > > bigger problem for end users - random fake ANSI codes will
> > > > > > > > > > > > > destroy your terminal window if you try to cat the file to
> > > > > > > > > > > > > read it.
> > > > > > > > > > > > Users don't get a coredump and cat it to the terminal.
> > > > > > > > > > > > =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Lucas De Marchi
> > > > > > > > > > > They might. Either intentionally or accidentally. I've certainly
> > > > > > > > > > > done it myself. And people will certainly want to look at it in
> > > > > > > > > > > any random choice of text editor, pager, etc. 'cos you know, it
> > > > > > > > > > > is meant to be read by humans. If it is full of binary data then
> > > > > > > > > > > that becomes even more difficult than simply being full of ASCII
> > > > > > > > > > > gibberish. No matter what you are doing, the ASCII version is
> > > > > > > > > > > safer and easier to look at the rest of the file around it.
> > > > > > > > > > > 
> > > > > > > > > > > I don't understand why you are so desperate to have raw binary
> > > > > > > > > > > data in the middle of a text file. The disadvantages are
> > > > > > > > > > > multiple but the only advantage is a slightly smaller file. And
> > > > > > > > > > > the true route to smaller files is to add compression like we
> > > > > > > > > > > have in i915.
> > > > > > > > > > > 
> > > > > > > > > > > John.
> > > > > > > > > > > 
> > > > > > > > > > PS: Also meant to add that one of the important uses cases for
> > > > > > > > > > dumping logs to dmesg is for the really hard to repro bugs that
> > > > > > > > > > show up in CI extremely rarely. We get the driver to dump an error
> > > > > > > > > > capture to dmesg and pull that out from the CI logs. Even if you
> > > > > > > > > > could get binary data through dmesg, pretty sure the CI tools
> > > > > > > > > > would also not be happy with it. Anything non-printable will get
> > > > > > > > > > munged for sure when turning it into a web page.
> > > > > > > > > I think that's the main source of confusion on what we are discussing.
> > > > > > > > > I was not talking about dmesg at all. I'm only complaining about feeding
> > > > > > > > > ascii85-encoded data into a *devcoredump* when apparently there isn't a
> > > > > > > > > good reason to do so. I'd rather copy the binary data to the
> > > > > > > > > devcoredump.
> > > > > > > > But the intent is to dump a devcoredump to dmesg. It makes much sense
> > > > > > > It seems like an awful idea to dump hundreds of MB to dmesg.  When we
> > > > > > > talked about printing to dmesg it was about **GuC log** and on very
> > > > > > > initial states of driver probe where we didn't actually have a good
> > > > > > > interface for that. And the log wouldn't be so big. If we can already
> > > > > > > capture the devcoredump, what would be the reason to dump to dmesg
> > > > > > > (other than the non-valid "our CI captures dmesg, and doesn't
> > > > > > > capture devcoredump", which should be fixed).
> > > > > > > 
> > > > > > > If any sysadmin have their serial console flooded by such garbage there
> > > > > > > are 2 reactions: 1) someone got in control of my machine; 2) something
> > > > > > > went really bad with this machine. It's not "fear not, wait for it to
> > > > > > > complete, it's just normal debug data I will attach to an issue in
> > > > > > > gitlab".  And I'm mentioning a serial console here due to that
> > > > > > > cond_resched() added, which is only needed because you are trying to do
> > > > > > > in kernel space what should be in userspace.
> > > > > > > 
> > > > > > > Oh well... looking at this the main reason to use ascii85 I can see is
> > > > > > > because we already have parts of *our* devcoredump using it, and
> > > > > > > userspace relying on that. That's new to me. Let's stop bringing dmesg
> > > > > > > into this discussion.
> > > > > > > 
> > > > > > > > to have a single implementation that can be used for multiple
> > > > > > > > purposes. Otherwise you are duplicating a lot of code unnecessarily.
> > > > > > > > 
> > > > > > > > And I still think it is a *very* bad idea to be including binary data
> > > > > > > > in a text file. The devcoredump is supposed to be human readable. It
> > > > > > > no, it's not. devcoredump doesn't dictate the format, it's up to the
> > > > > > > drivers to do that. See their documentation.
> > > > > > > 
> > > > > > > > is supposed to be obtained by end users and passed around. Having
> > > > > > > > binary data in there just makes everything more complex and error
> > > > > > > > prone. We want this to be as simple, easy and safe as possible.
> > > > > > > > 
> > > > > > > > > For dmesg, there's a reason to encode it as you pointed out... but
> > > > > > > > > no users shouldn't actually see it - we should be getting all of those
> > > > > > > > > cases in CI. For the escape scenarios, yeah... better having it
> > > > > > > > > ascii85-encoded.
> > > > > > > > > 
> > > > > > > > > What you are adding to devcoredump also doesn't even seem to be an
> > > > > > > > > ascii85 representation, but a multiple lines that should be concatenated
> > > > > > > > > to form the ascii85 representation. For dmesg it makes sense. Not for
> > > > > > > > > devcoredump.  We should also probabaly need a length field (correctly
> > > > > > > > > accounting for the additional characters for each line) so we don't
> > > > > > > > > have an implicit dependency on what's the next field to know how much to
> > > > > > > > > parse.
> > > > > > > > The decoding is pretty trivial given that line feeds are not part of
> > > > > > > > the ASCII85 character set and so can just be dropped. Besides The
> > > > > > > > output is already not 'pure' ASCII85 because the ASCII85 data is
> > > > > > > > embedded within a devcoredump. There is all sorts of other text about,
> > > > > > > > including on the start of the line. There are multiple ASCII85 blobs
> > > > > > > > in there that need to be decoded separately. This is nothing new to my
> > > > > > > > patch set. All of that is already there. And as per comments on the
> > > > > > > > previous devcoredump patches from Matthew B, the object data can many
> > > > > > > > hundreds of MBs in size. Yet no-one batted an eyelid when that was
> > > > > > > > added. So why the sudden paranoia about adding a couple of MB of GuC
> > > > > > > > log in the same form?
> > > > > > > I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
> > > > > > > HWSP and HWCTX").  Probably because I haven't seen that commit doing an
> > > > > > > ascii85 encoding before, otherwise I'd have similar review feedback.
> > > > > > > 
> > > > > > > Looking at this just now, so I will also have to balance the previous
> > > > > > > users and existing userspace consuming it.
> > > > > > > 
> > > > > > > +José, would it be ok from the userspace POV to start adding the \n?
> > > > > > > Then we can at least have all fields in our devcoredump to follow the
> > > > > > > same format. Are these the decoder parts on the mesa side?
> > > > > > > 
> > > > > > > 	src/intel/tools/aubinator_error_decode.c
> > > > > > > 	src/intel/tools/error2hangdump.c?
> > > > > > > 
> > > > > > >     From a quick look, read_xe_data_file() already continues the previous
> > > > > > > topic when it reads a newline, but the parsers for HWCTX and HWSP
> > > > > > > seems to expect to to have the entire topic in a single line. But I may
> > > > > > > be missing something.
> > > > > > Sorry I'm not following up this thread.
> > > > > > Add a '\n' where exactly?
> > > > > To break very long ASCII85 streams across multiple lines. That will
> > > > > allow the devcoredump file to output via dmesg for the situations where
> > > > > reading from sysfs is not possible.
> > > > > 
> > > > > This patch is adding an ASCII85 encoding helper that is more friendly to
> > > > > output via dmesg. The patch does not currently change the existing
> > > > > ASCII85 encodings of VMs and hw contexts. However, the intention would
> > > > > be to update that code to use this helper eventually.
> > > > It will break the parser and I don't think we are allowed to break it at this point.
> > > The intent has always been to add compression as we had in i915. That will
> > > presumably also break the parser. Although I'm not seeing how a debug log
> > > parser counts as critical user space that must not ever be broken.
> > We shouldn't be breaking the current userspace tools. Any change like this would
> > need to be synchronized between all the current decode tools.
> That is why the comment was 'eventually we would like to'. Nothing in this
> patch will break a user tool unless that tool cannot cope with new data
> being added to the core dump. And if we can't add new stuff to core dumps
> then again, we are fundamentally broken.
> 
> > 
> > > > What I can suggest is add another sysfs with a coredump that skips the binary dumps so it is readable by humans.
> > > That will just lead to confusion and problems with people sending the wrong
> > > file. This needs to be kept as simple and error-proof as possible.
> > Perhaps it is time for us to convince devcoredump folks to accept
> > multiple files like nvme folks were asking a while ago? [1]
> > 
> > [1] - https://lore.kernel.org/lkml/1557676457-4195-4-git-send-email-akinobu.mita@gmail.com/
> Is that likely to happen any time soon? That thread was from May 2019. We
> need something now. And it's not clear if that is adding a filing system
> within a single core dump file (i.e. read one file from sysfs and then
> extract later like a tarball) or creating multiple sysfs files that all must
> be read together and passed around together. I would strongly advise against
> the latter. As I said already, the whole coredump thing needs to be as
> simple and easy to use as possible.
> 
> If more official support is added to devcoredump itself in some number of
> years time and is actually beneficial, then we can move over to using that
> interface (and break the user land tools again...). But until then, this
> version works with the least amount of disruption for significant benefit.
> I.e., it lets us actually debug problems right now.
> 
> John.
> 
> 
> > 
> > > John.
> > > 
> > > > > John.
> > > > > 
> > > > > > > Lucas De Marchi
> > > > > > > 
> > > > > > > > And again, arbitrarily long lines (potentially many thousands of
> > > > > > > > characters wide) in a text file can cause problems. Having it line
> > > > > > > > wrapped gets rid of those potential problems and so is safer. Anything
> > > > > > > > that reduces the risk of an error report being broken is a good thing
> > > > > > > > IMHO. Robustness is worthwhile!
> > > > > > > > 
> > > > > > > > John.
> > > > > > > > 
> > > > > > > > > Lucas De Marchi
> > > > > > > > > 
> > > > > > > > > > John.
> > > > > > > > > > 
> 
