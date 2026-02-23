Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C73EC111E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 18:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2310E2FE;
	Mon, 23 Feb 2026 18:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/Pg4zyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE9A10E2FE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771872076; x=1803408076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tvWlnjBLNu6wwd+lSpzSuZJRLt78bf1RKulGGHHhNxk=;
 b=G/Pg4zyRdg+BO7/uThYTCqG6xzzEQayoRt3sKVNQ7k2zkjuBaVs0A/4O
 d/RJoNl1uV5qqiS0fYI8sFWZ6f9hqooN1bjWJGwjqLMbLVNpW0grB5FbL
 vOfmQ5bLqm51/CRrmWuZGqP4KyfP5IAsj4cc+gqkGJ2vT1UdCyHcr/jMS
 MKfzI333zhBhMzg4e7W1T3ghmqQNoTurI3W5z65WPVwCluOaFZOM1SSC0
 wWJLerhITb2oXDoiK3DW/WgfH6cPPQa8/q6ABka3K0BdUsGmtZYVom0m6
 Z4CKbeAbLRLZ7Q0HAFY47HT+muv3dBGypZPonGIarm0BKtb3AsdduYr/c Q==;
X-CSE-ConnectionGUID: 6wmTz5r2TvS8N80DH126+A==
X-CSE-MsgGUID: V1NSCoBGRSuADH33UoVb1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83498733"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83498733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 10:41:15 -0800
X-CSE-ConnectionGUID: 68btoMPvTjKs7L2uqPDkwg==
X-CSE-MsgGUID: HnRJUwB5SJacTsb1xG2foA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="238607209"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 10:41:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 10:41:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 10:41:15 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 10:41:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhO8VDTIGho99e4GED7Z/UVjk+qgCfuPPJsWEEL4Rhpaiq9TkjGQ7AXyD1twLQBr/HzTFRyOfk95PbJjWV+XeUfO8dUn7T4m2iUn2KHWADe3x3B9bsID8yC3v8lPuqTqIlr0S9AIDo+66LDd1ktdG6ekZHR3L0VUecauy82kOzewn1ozKoHnzSOmkV+a6qvvMQbORfC5xjWfkAaiAByM6TDz/Mp66+eat4xJ5NjWQRpK0oem7Rq65qBDl7H8/AWw4VCPixlHYd4gaennJ6rQOoRdJqDah1A9hr4JSzL4OQDapd9feLj3kLTPGFxn+qRVJabShpAldv9/woAikBurgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zU28Z3K+FuYqTOP56e3APjO9WpfQ7Go3fsOh8SCSnI=;
 b=u16QpAGigFr78c3MSq8va4dMuBFnNKwX5/x9uq+r9RHot3NF5s18Dw2iuk+BND6uOHza/br4B7b24zgJ2GTrDpWxqzOdrmMeEQ0aVzkmtjEY713osi1WfIzeYwcjlTXXCABZBlvp7SHIBb0s9h7EqLN8OoMdTCVKfzCsLQr3xvTIeAX6nRJXqawHZ0qKmbi0kk1CsUTrUjDvn+gR4AyIpio30m15NckLRUZnT6BRKZABwTi1o0RVcE36J9VsvCZ1ZechpYsqr35+Pg72Cs42tq9Yv2Y3KXbp0oy0PKDILhCqX14H0CzHm5jPjKPkt+uGlRjLztO29ZuwXeiLRIAFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8916.namprd11.prod.outlook.com (2603:10b6:208:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Mon, 23 Feb
 2026 18:41:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 18:41:08 +0000
Date: Mon, 23 Feb 2026 10:41:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 22/22] drm/xe/eudebug: Enable EU pagefault handling
Message-ID: <aZyfQaq2SkgMn42Q@lstrano-desk.jf.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
 <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:303:16d::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fdba25-c46e-4847-ae30-08de730b1c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MPNyqE78PtBtGIgg0ejIXnDPYEm+cuMyXXBNLPf93XpkeYz/zhp95PVi2NI1?=
 =?us-ascii?Q?/HCYM7Mon5ddC7e/mBALeNG/OEDoa+u7VhGXEvG+y5Tc6IwThD+qUap/DZsZ?=
 =?us-ascii?Q?ZgFtSUQ4gSxo//g13hgwke7pJ3KMa7wuawJFn08ykYrd8jjPAZsQPINBfZlc?=
 =?us-ascii?Q?NO85xrh44IHJoFESY+XF9eKPd0iJcHO7fKWtU84kfmN/CZmKlAWLGXPsegNf?=
 =?us-ascii?Q?YhFDztMnXfHTCaGed0COTytmdPk47S9XTJxcu3BmH/tSgyF4BHfvl4Gk9MGi?=
 =?us-ascii?Q?ZVwR9kSgX9HxyjiceRDVwV7qjkAd2ViMIr0U4ankLJCWohUlfXegpdSyob2h?=
 =?us-ascii?Q?Ly3kAXcYfgdcXc2Ykhi6AAYZ6Je9+8aSRAQ111KsKOQb9q5HH/AOr2oKqoUp?=
 =?us-ascii?Q?JvHpz4dfLF7c9iegz5yMp6ACD33ZrntW9+nKR12kP5CxkfwMwzJgL6HWKAxm?=
 =?us-ascii?Q?DBSDPvlXMV7Xl5bOEtSeKnKvo/jRruYyi9qx+2cGKrN62tHWbOIrx1JywQlV?=
 =?us-ascii?Q?nQIYS/YAaygSxJSh7Zjn+voAcCfEYize2SYkDgh7/sXEgxk49210OMt9FA1A?=
 =?us-ascii?Q?0UvnKQkyXH6khdwn7E+eMpErNIo+s6i4YV9fuOm3VcEpDlF3/7BKjkO28zX2?=
 =?us-ascii?Q?nHn4xrBXwgjv6niZdWQcuUr0dG592xcmVuzq8zs3Ma5w8ECPQdX5DFKyAa+K?=
 =?us-ascii?Q?LUij5W1nS8js8/fDrJ9MMWeXGquj2Q4yjPMX8oD0oUO2pMbPZMIztMDvuMXG?=
 =?us-ascii?Q?1pLuWA0Yegk2yp7lXNPqIBKsO+f/RzEqDtcRpy44KKmi0UMqHE1AHIOYR1TG?=
 =?us-ascii?Q?wPamaHUBPgXfsbZ6g6ci5WdPH50tt8Pg1vKQCV4ODEvEWmDiIfzop1kl6JUC?=
 =?us-ascii?Q?hLtZ6CvG6uROTEeq6NQbp1f91Y4N5Jp20ro7W97pMfOu07Z4eA8fAesoMhqG?=
 =?us-ascii?Q?SwZo+lwvYjbXoSMT3NBZX3lbPwo0lBmwDUs9i2MDvfT22M6TYFPeJtp0RI5h?=
 =?us-ascii?Q?lPYjbwKPu6kyaEo2E35Blv8vJzzppras9stGCsXVzX+mDckosN0HzlBD6Gyw?=
 =?us-ascii?Q?Magp8v06idqNGjwlzkTNIrI92S7+rP3CAkyOeX3ehwifGivbSpNha3N0FpGg?=
 =?us-ascii?Q?6wDaJsRPnj0FCDQy4ZGKnLBVRFabvxjLznFz0bHc66hwKKn6MfrqJBJgAlSG?=
 =?us-ascii?Q?5Ca/DC7gQ+7I7jU+zN4jVRhEQB8Y4s6ekHAtALZsuUvdRtCKc3dkOdRB9tyV?=
 =?us-ascii?Q?W6m2NiVBEVpyKCoI/47WqsyXw5bKsILUULHMfJUH7EI1C+6BEs94JxWZpQO3?=
 =?us-ascii?Q?w4Nz7G3qaBXvgXbhL19N8PTDaAcf1P4or1jmAmbFYDdxeI08dDfCX/qrRTxE?=
 =?us-ascii?Q?FhE9Di1mc2X1ErTeCESbMzrIKN1bahFy3LsWhY3hkMZaX6NtYQgSCvarze1v?=
 =?us-ascii?Q?GMx+0rUoGMg/ljWkbbydlfpUn0IHBBVX2JJsqf62ITxufxR76BRxkk5lBuW1?=
 =?us-ascii?Q?9P3Xh8OQTCX5BisugF0aFn33gLjf2UotgF0SyGmRjgtP/yVrRTFeLslx4YRJ?=
 =?us-ascii?Q?4v7DigAOhjLT7mwryAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bKClCq2BozbV/COC3BxxnHx5A0FlhUPGqElrG6rIlLr9rS4C5yUugbXBQxQ3?=
 =?us-ascii?Q?F/g1ihGcDipZrVnmxuf9cjeU70cagSTKmzLm6LMqCd/OWflrwctxDfjWXndN?=
 =?us-ascii?Q?ZjxxF7MHaEEm5lnjefeq2zv9+btEKj/q1PNgLxERsFPtuDjmPPeCbC5kaKbx?=
 =?us-ascii?Q?Gea4N/HmTXfNA3QdROsMKKIGsu0G+R+mo3Z/AEewQXZBax98EQ3L+itpBim7?=
 =?us-ascii?Q?xW8mRoJZMKSmos+Nbj1dHdtaDp2H6JItu91/EjJWhqYJAAQLV3gtoFnIC2S1?=
 =?us-ascii?Q?HBMki+Op9lhSExqMjhJmiooUoOxpyBZ8Hc5agKL6LOBsoUculyB4FzddwGZR?=
 =?us-ascii?Q?JYNjZch+k7eIWvwDzXZvX6d3jLVZzH3fsZ4QFE7S9MkHososNhkDtDeBv/MW?=
 =?us-ascii?Q?GZOm2ZdscGDDd2SLpy2u8MC/M8NSjEjGM1M4Gunt8jWNTXi6Q1RdK0nHZSA0?=
 =?us-ascii?Q?zgeUYMWfSBK5Ui1oFnO2dLin6YD+o37ElF3B0R1W+M5mtQd6CIenmBc/bcGW?=
 =?us-ascii?Q?CBw0Wb/J7R/+TXSRk5NHllu+5ijj4IksAebkLlBi/Pd10QB3yWeyAAoS3MTn?=
 =?us-ascii?Q?BY0TiRR33eStiMo8JCPvlRkxx7N0sfBjeFTR6yhruUQVR+iRU/B33hS6MWqS?=
 =?us-ascii?Q?0H0+Ld0NMU/hQpCjFBreWl1vLjOUajKZJfuIDBwbPXlsNvm6hjFRboohCd0l?=
 =?us-ascii?Q?oKf30LUwzFlGE4d8/h6vUDZ+az/RWOUc1PfBjjFMbHUKOQGOvWMz4ee7+iYl?=
 =?us-ascii?Q?9OEuo8P3nQTO2lUO56pEBAkvf0zlyLOBHGAnSsWGEpx2kOPHK/5NxV4p9J2a?=
 =?us-ascii?Q?J0N1GlzCxdpMmc8zbvfonPjR+VvHO6Rv4V1ryS9anRbJBMNCdLIzmrBD4exK?=
 =?us-ascii?Q?TPBvtlVC0O6+zLpUtj1pBn60CzT+04aYVgFxWgfsAEXbgpk9lleZifciZD7u?=
 =?us-ascii?Q?43s7J/TYpiP7fGzypN2o5X/uDAfh/cgbrdK7CyPiL1VvDLKnduLc24klwfan?=
 =?us-ascii?Q?eAG5Sr7KnGhNTi2gDlifsrDpMgh1vwyj7x7l/WVE8Z4evKYVU/QIW2MWv7cL?=
 =?us-ascii?Q?bG0PQ2gHMmT9b1BoVa8dHwd4weLepCxmIcwoHM9uZjr1J68ci6nB+BBIVFYV?=
 =?us-ascii?Q?rMzJKc1YwYWyw4Q8M/xMb0VBoq5Y9nfXrp6X+2hqt2t/L/FTj2RIO90pxof9?=
 =?us-ascii?Q?fs6DBDTn5vnTjhQqHIw5JwBwEijAVQRt8zSaJH4juRyfjAz1jxrNpJ1BdAdO?=
 =?us-ascii?Q?xMnMoQZ0r30eAKdgYX5tl2JtPEgcaqpLdV25vLMRRNCDwN62kNleLlbZ+4ND?=
 =?us-ascii?Q?j3tZpaZ50HEnEKurZDIpoAVGywywpGftBpHHobUp7Wjzr0brQFhtoIuHA+Fd?=
 =?us-ascii?Q?PuZn807OM1BM3LxLESthdfJxUQdXZLDN3IlQTfTZih1Iw9YPC8fBh21+YoMS?=
 =?us-ascii?Q?wjcnmAtA+ERINQIp2uojzspgwvY3uuOWS/cAojKyG3EOIatikP5I4OooZWgi?=
 =?us-ascii?Q?YvrYvqd7oei6/JpUhFvpB2ex+jy7PWVa2WEsq8pQkxFSmkteS4/mHJKBBxvo?=
 =?us-ascii?Q?LBN+RpLEm0y1gIN7Tl+TzvCtYZq8+OL+WnY0fow80+BwRlrTl4/CEfixjEsB?=
 =?us-ascii?Q?xvfnCcFD8s6msXt2iY+bCGrqlKZkZEdojDy6gNcKHwhmrFsI3x+748uXS+sF?=
 =?us-ascii?Q?t+grW7qX6oW7nFajBpfq79S+2aCf1wKFvRAgvEPu39MWQf06YwfWRnMRITPw?=
 =?us-ascii?Q?+gnIQiyU32jq5ZssXPg8TnCWf06gvHc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fdba25-c46e-4847-ae30-08de730b1c17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:41:08.8765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XVR14gCMkQPIRhl8HNdiwqygqW0ogalMDXwjaMXiVihz50e+4XeuD9mhq1c2bukQu5hvCSkvMcv9Ms+k3Ejpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8916
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

On Mon, Feb 23, 2026 at 04:03:17PM +0200, Mika Kuoppala wrote:
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
> access will halt the corresponding EUs. To solve this problem, enable
> EU pagefault handling functionality, which allows to unhalt pagefaulted
> eu threads and to EU debugger to get inform about the eu attentions state
> of EU threads during execution.
> 
> If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
> after handling the pagefault.
> 
> The pagefault handling is a mechanism that allows a stalled EU thread to
> enter SIP mode by installing a temporal null page to the page table entry
> where the pagefault happened.
> 
> A brief description of the page fault handling mechanism flow between KMD
> and the eu thread is as follows
> 
> (1) eu thread accesses unallocated address
> (2) pagefault happens and eu thread stalls
> (3) XE kmd set an force eu thread exception to allow the running eu thread
>     to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
>     TD_CTL register)
>     Not stalled (none-pagefaulted) eu threads enter SIP mode
> (4) XE kmd installs temporal null page to the pagetable entry of the
>     address where pagefault happened.
> (5) XE kmd replies pagefault successful message to GUC
> (6) stalled eu thread resumes as per pagefault condition has resolved
> (7) resumed eu thread enters SIP mode due to force exception set by (3)
> (8) adapted to consumer/produced pagefaults
> 
> As designed this feature to only work when eudbug is enabled, it should
> have no impact to regular recoverable pagefault code path.
> 
> v2: - pf->q holds the vm ref so drop it (Mika)
>     - streamline uapi (Mika)
>     - cleanup the pagefault through producer if (Mika)
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 31 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index d48f6ed103bb..6adf3bf73b1c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -8,6 +8,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_pagefault.h"
>  #include "xe_pagefault.h"
> +#include "xe_eudebug_pagefault.h"
>  
>  static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  {
> @@ -37,8 +38,15 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> +static void guc_cleanup_fault(struct xe_pagefault *pf, int err)
> +{
> +	xe_eudebug_pagefault_service(pf);
> +	xe_eudebug_pagefault_destroy(pf, 0);
> +}
> +
>  static const struct xe_pagefault_ops guc_pagefault_ops = {
>  	.ack_fault = guc_ack_fault,
> +	.cleanup_fault = guc_cleanup_fault,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 72f589fd2b64..9dcd854e99f9 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -10,6 +10,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_eudebug_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
> @@ -171,6 +172,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> +	xe_eudebug_pagefault_create(vm, pf);
> +
>  	/*
>  	 * TODO: Change to read lock? Using write lock for simplicity.
>  	 */
> @@ -184,9 +187,28 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);

I've mentioned this before - this fundamentally broken if SVM is
enabled as the VMA lookup will never fail given VMA tree is completely
populated in the SVM cases (i.e., when SVM is enabled the first thing
the UMD does is bind the entire CPU address space with a CPU mirror
VMA). What will fail in the SVM case is xe_svm_handle_pagefault will
likely return -ENOENT. UMDs from my understanding will enable SVM by
default so this likely needs to be rethought.

Matt

>  	if (!vma) {
>  		err = -EINVAL;
> -		goto unlock_vm;
> +		vma = xe_eudebug_create_vma(vm, pf);
> +		if (IS_ERR(vma)) {
> +			err = PTR_ERR(vma);
> +			vma = NULL;
> +		}
>  	}
>  
> +	if (vma) {
> +		/*
> +		 * When creating an instance of eudebug_pagefault, there was
> +		 * no vma containing the ppgtt address where the pagefault occurred,
> +		 * but when reacquiring vm->lock, there is.
> +		 * During not aquiring the vm->lock from this context,
> +		 * but vma corresponding to the address where the pagefault occurred
> +		 * in another context has allocated.
> +		 */
> +		err = 0;
> +	}
> +
> +	if (err)
> +		goto unlock_vm;
> +
>  	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>  
>  	if (xe_vma_is_cpu_addr_mirror(vma))
> @@ -198,6 +220,10 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  unlock_vm:
>  	if (!err)
>  		vm->usm.last_fault_vma = vma;
> +
> +	if (err)
> +		xe_eudebug_pagefault_destroy(pf, err);
> +
>  	up_write(&vm->lock);
>  	xe_vm_put(vm);
>  
> @@ -268,6 +294,9 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		pf.producer.ops->ack_fault(&pf, err);
>  
> +		if (pf.producer.ops->cleanup_fault)
> +			pf.producer.ops->cleanup_fault(&pf, err);
> +
>  		if (time_after(jiffies, threshold)) {
>  			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>  			break;
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 2bee858da597..9d2d29d35a4b 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -43,6 +43,15 @@ struct xe_pagefault_ops {
>  	 * sends the result to the HW/FW interface.
>  	 */
>  	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +
> +	/**
> +	 * @cleanup_fault: Cleanup for producer, if any
> +	 * @pf: Page fault
> +	 * @err: Error state of fault
> +	 *
> +	 * Page fault producer received cleanup request from consumer
> +	 */
> +	void (*cleanup_fault)(struct xe_pagefault *pf, int err);
>  };
>  
>  /**
> -- 
> 2.43.0
> 
