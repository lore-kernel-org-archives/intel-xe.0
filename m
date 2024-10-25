Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C9CD149E8
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 20:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6154710E0D7;
	Fri, 25 Oct 2024 20:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUcWr6dO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEFB10E0D7
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 20:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729886419; x=1761422419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UAv2MbZsMMI5VUWQLh8QFHhyK/zjo/rOIVzDHtMaEP8=;
 b=DUcWr6dO5HpqUpmjOr1CmIHfeoF01pzCQmRMa3/2fyiGE4lHrH2Bxbii
 nX3ivDTAjKbDZs1x8xUzLzj0YMG90m1KEqa+G0QTaZJ5XZXPosxPnY+mt
 QOmjAmKxwlskVBdBzrygk1YE0ZeD4ifArSYq8QIv6iCVrlPE0A88fPxef
 QW6D1G0rzNQvTl1KKJlHm/vL1MMkLPKNH8puaf4T7syqdAv0vQBWM1UOr
 0gY6Qd4eEgDQ68ouF3tHia48yfBot/HFcqHBXHhzejtnSOkS3F3mNEzdA
 LP9jh8sX2UQ6KVDqe6EyDfj8P0XR5ivw+KL2iQ0Pch/P+WRsSTeg6RYXh w==;
X-CSE-ConnectionGUID: 0JFAa17GS4+J6ahAsyQY+Q==
X-CSE-MsgGUID: PHqSh8nySeGfq03tPu0BUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33263381"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33263381"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 13:00:19 -0700
X-CSE-ConnectionGUID: g+Di5TMGThukwrcTue3zTw==
X-CSE-MsgGUID: G8OZID/7SJWqPOBecA+kQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81853086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 13:00:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 13:00:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 13:00:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 13:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7Apo89QF1ZP8Q7trdAzuMDiddnm31XPQYIwwOi93wjcweYaLf7WnhNDq54HjDmTPprv2AKi7w35LfN7nEyghsQqcmKHmp62UH7Jv1rvkLRKKRHNeXsYg5AO6S4f9MTz+BaFjKjAwoubB+HiJPg7iOMfr/mRyuNZKsxnaMHqN79CCsFFpoGph7Pngu884zTEwkswYoCth8M/vgV43FWHi/RQ4wAacD32fnUTQyu85WMV8McS2+LGBUdy9ESsKsIMu4nSPywNAv191tEsPo2cDHPrc3Em2EgV5KCh0ffNG/IaQio+3gIvymfaTNTDhDVWdhF+vr8f1XbzlYNFVv6oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EptsiAmaUAfIFh/6Ly+7a2ce8mDjO9aCMHSEUMd54Tw=;
 b=QlJ8ENxpslKYJ3CpPX4DGQ5w78gjzX98GYwbyO1ftLB6VgA6EVE0P9sdt/8Dq1Cuk9+1ffAZ+Sm9rW9v444KHHbHDeD+l4HMm3Xjxxa1Kevq1do+bv0W6E2qKcilXMTAT/wZkbL6jHn+rAxkHJfhiWxrrJiHD6rBEjz4esB6ZB8zMkNq09KW15TTOyH+U1iXEMAEvVMt0/WtlFSHle36pG0+Ubre9CnoRBelvGDdzzDL6A7Z4IRcnWujvpiDl9URVPdavbI6bLMTQWwTWBhw5V3UjE4vElBach6LbzdwLfzHzXNiL8mFHeCEcveK+eaWjig4Dkql1+3bOfWHWRxCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Fri, 25 Oct
 2024 20:00:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 20:00:14 +0000
Date: Fri, 25 Oct 2024 19:59:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Justen, Jordan L" <jordan.l.justen@intel.com>, "Briano, Ivan"
 <ivan.briano@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Message-ID: <Zxv4tJMHrVvZH8bQ@DUT025-TGLU.fm.intel.com>
References: <20241022232756.1769013-1-matthew.brost@intel.com>
 <20241022232756.1769013-2-matthew.brost@intel.com>
 <1a5852ccbf8713023a71fc435038a80546801746.camel@intel.com>
 <Zxk1XqHRi90GG89g@DUT025-TGLU.fm.intel.com>
 <e25b8e02ceba708c71ff783c547744b7dc15cbae.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e25b8e02ceba708c71ff783c547744b7dc15cbae.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: f25bb1c2-a1c3-42a0-75a0-08dcf52fa41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bQ/8nuyMoPLkS9aC5ZM7gNN2BoA9T9isdwRhY6pEPPYnwroXjYeDueft2iGz?=
 =?us-ascii?Q?tZvdDqCeAwAlWFFMqtMGGv8N8ns8EVyIwzcyU6RluMilfKdY1JMP9RZ1pnE/?=
 =?us-ascii?Q?Lmd1KhCNTAMsY6QD2d6qoFukNX7Yb2NRzjh+n5tyjAThiCnZmjb/3DcieTD/?=
 =?us-ascii?Q?3RG77W6M2hiVopL2E7K8tmuU2V4H8D370U15hps5twAp4cxXv2TGDx+XfH9r?=
 =?us-ascii?Q?xFUExuOMnD699fh/r4nFDwVveFfkJUeIZn10bURtZNhvcfF/ZeNjsiof/ty2?=
 =?us-ascii?Q?gVyFfptAdKCdTEfuRKziqLfCEsm62oU3lDnvXgyrXuTVJey7l0OsdyH72UW7?=
 =?us-ascii?Q?szd9DlSOa+XhcxJu4vgjeLlACNpD+vY36vPJ+xbuMiBbv+bUEwWAReVxPxVG?=
 =?us-ascii?Q?jGLOeSimiWieshmMCpZ4g5H3CjU+x5dtwDv5xMUNjQNAhImiOU7+lCNk32Js?=
 =?us-ascii?Q?HKBKorV0npGQ+SiYtgrYZZ9bgmHw6rrzsI5POng5TrI0GyQR2NrSa/OicS+S?=
 =?us-ascii?Q?uwGxEJnqHQLi+C68vYX8x+s87/2f4Dzz41lb4bCL2FaZ0zbWeQBxiaWmK/Iu?=
 =?us-ascii?Q?1ISJ8u6ihsWlA7/mIqe6lPF9tHcnGTZGyGtoqKU3GttMo1YrxcRytkQtZ0wS?=
 =?us-ascii?Q?VArbv+LFvbg22twSnSEBDLWkSyyq63I2csgvxr+ZfH0wHVV2EvuJ4vx7mVpz?=
 =?us-ascii?Q?vhzGvLUMIwjXk7F1DMxZfClKjtU/pCM+Yb7X4b7Lj//wgWIoakS0bbP+lmj1?=
 =?us-ascii?Q?VETumbTp/6wb31mzgJxgEhcmXEG6zmBgTwMofe9AYC7iM/vcDUXUMKH/iUnl?=
 =?us-ascii?Q?TFYQAMVPwNPAshFAc+9klPmM7IsuZmwBgEzyicBR/vrKgVeF2Pbn9ySoCPNE?=
 =?us-ascii?Q?/O0PwlaY4zeVoZpmZ/Tzvu4cQwseoxAEMy2W2iQ/MCUzBFYU+joQgqkgHzDn?=
 =?us-ascii?Q?USISyIcgEForLGSxQeN1FY2BiLrDpuJd4rfpkZVEJ/BJYj/ArhgmSO1bIhqP?=
 =?us-ascii?Q?JV+mK1iVZ1ydP8/teP20qFJR5ixclqE4Wg2b1asCR1rUJHKfchwLIPW5ncJI?=
 =?us-ascii?Q?apEDDUdQhaKXIxxeq8VvIJo+JaOvhobekrWfPT39cJd4ih/FYT1XjAuhO3mI?=
 =?us-ascii?Q?1G3Y8JVwsbc3FjgaGyGiYZKM/3pcA8r3P/MTYETiY09grjF5pqSn2FH5xUsA?=
 =?us-ascii?Q?zh9ZWb8vgsb8TJNNW0zMBOxW6flqqbxR0NRXbkqJco0LlWdM+Kcc5WsDcEK9?=
 =?us-ascii?Q?SALGlEjnQeBwoq8aL/8YN0C0E47A0KhwlXmvl59wXDk7QsAWH26ux3At5Hjj?=
 =?us-ascii?Q?PD9Y9Ce8qD+ojLPVZxu8iAK+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UaDbwdR3a0HZnY74T06/L0ZFAlgrz1AsKT8RqLVUqWpAdp55fIsPHeRePeuO?=
 =?us-ascii?Q?RsxNjlI628B8LnGJzS3zYls/DepW9hwie7b+ybt48qpfIX78uoGZQT8MP8hI?=
 =?us-ascii?Q?HiqAh5LislRm3/zG4XFOFm4+oTwN7wQceJoA44pkkhfJahTtezcqgO7wlc0O?=
 =?us-ascii?Q?qAdRtVBhXilNeG4YmDjh/JvyQq8AbgufzTMs8R1HtB7TSo2rVRX+JrxHAtsM?=
 =?us-ascii?Q?5cSklRIQMg2UPOn60OP9j+KJ7kmQWr8Irc/F+INZ27MEmG7XSQZkb+pX/4WX?=
 =?us-ascii?Q?7HoyiPm/DJAUXqavgVSMAF8B3dCYDRfeWbza3nAWZ7Xfnj24+aEmAiXFsoEp?=
 =?us-ascii?Q?nDKTcBrAT0s8ZU76xGJsJKGJlvsZ54wNOdqxY62isNNsPYmcSvA6VDZjrEjV?=
 =?us-ascii?Q?FrWa8R4i5NbmHJ3AYWHbWL12emL8ufHRpPQug5a9iKT6qfsy12t5n3Cq9hP/?=
 =?us-ascii?Q?vz++cmZPcbgbhq7Ux4D6Ir7ZZFfu0gU3Xm9pXwsI29PjeSYDLs9KkzsKHTzx?=
 =?us-ascii?Q?eUFjcsUkShGSBu85PLR54KVaHSuHihsJ/FO9+7unQxuPIYVr2YWefwPu9yQY?=
 =?us-ascii?Q?OJjKR0yVHK2biX72+hvQ9c5g6Mr0ATH4dCvxCRS1tre4rzzoUfuA1NkYm1cL?=
 =?us-ascii?Q?56R6gll8JfE90d56P8HDwJ/uxjI0uSgdVErkIiZ5hzZ5/CY+RcY3y/mi3Uw2?=
 =?us-ascii?Q?A2oiKp1i7a6+fYYvcA4L7lZ+ApnVp3G9MCq4mHypw4NZAsO3iHydF2ef5Vk2?=
 =?us-ascii?Q?gnVSYwcNIYQlJb8jK/FVt0X5VUNryZuZCU4FL7aPruu2zZ2Q7E2icU5AfIlM?=
 =?us-ascii?Q?+6ISPKTwVxtRFiChnefzLm0980AdznvUPG+40ENPfJE1gDTFR7sXJTUw83qg?=
 =?us-ascii?Q?q9tbwA1qnGhhQb3HfjREXGU8hoFfA0Xc7bl8bX6Krx6PYIX6+wF/7xX9R+Rh?=
 =?us-ascii?Q?H2gKisoIO0dnkPenGDsxyWyWeK1x4wLkSZpxlZtoB61kFjGTic6dBX6E0pb1?=
 =?us-ascii?Q?laRF5/TmYY4WDmxZGa+erDKlWKzYyZP6hRw5gfFUk5hcL5EueCYHyyG7gihY?=
 =?us-ascii?Q?5EpfNYh52EaCHYjIBI/ijvgTlW+mlAE9pF82zTvRJa9HxmUu9Xa8juPp3Ljj?=
 =?us-ascii?Q?yLBoOw8Az2RGYjjrOl5mm/a1d+ugt1/Y1Ua/XlOeG2XPqB9vflvjOwgau4e3?=
 =?us-ascii?Q?K0r8CK6az5nfNOrVpE7+EoOAtBp1GVrTQpHh0xZqZC7aoIck6zRfSIXBSwSk?=
 =?us-ascii?Q?od61sSERHXw9Yo5o2H+1z7GFPGhA1dfW1fgbYivTGE9jBHxTboZS8oz8TYYs?=
 =?us-ascii?Q?Dm+mEvT1DKJR+RpebVklWzqNA2yldrxs32t2cyc4FUMEL5ML1Q5ZpvOhYTJh?=
 =?us-ascii?Q?yctvJMqX+QFIYG9K6BvcuaSMtxGyngCZs8AXO2m1o2J1SLEsC9Ho86cN+P85?=
 =?us-ascii?Q?HBWf8e1FIbR0bG5xYtvGGTPTCrZOZCy8f+KcnTaJNnRXyaGkf8qpTYhGBDuz?=
 =?us-ascii?Q?BEf7/gXcy+tkii6IzFeoBreorKaWm7cbCQmed4WFAGyE0dUcM85IyNVf1DHA?=
 =?us-ascii?Q?J8mnue5HL9R35a2ov+BYh2D+ADeWvLF7ZR1U3F0dW123ePuKKEbaxMfBcx/0?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f25bb1c2-a1c3-42a0-75a0-08dcf52fa41f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 20:00:14.7658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhTWT0hoTkuKvTfyE9aM/tGmE9SrCrVHAJgF8Anhuw8lXCIhBarCNgNn50EwB81gRDXvVGAa9T+Q78tft+g5+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
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

On Fri, Oct 25, 2024 at 01:32:33PM -0600, Zanoni, Paulo R wrote:
> On Wed, 2024-10-23 at 17:41 +0000, Matthew Brost wrote:
> > On Wed, Oct 23, 2024 at 10:47:05AM -0600, Zanoni, Paulo R wrote:
> > > On Tue, 2024-10-22 at 16:27 -0700, Matthew Brost wrote:
> > > > Short circuiting TDR on jobs not started is an optimization which is not
> > > > required. On LNL we are facing an issue where jobs do not get scheduled
> > > > by the GuC for an unknown reason. Removing this optimization allows jobs
> > > > to get scheduled after TDR fire once which is a big improvement. Remove
> > > > this optimization for now while root causing job scheduling issue on
> > > > LNL.
> > > 
> > > I just tested it and it seems to do what it promises. Thanks! Having a
> > > 5 second hiccup is still horribly bad, but it is - checks math notes -
> > > infinitely better than waiting forever for a syncobj that will never be
> > > signaled.
> > > 
> > > This patch will *tremendously* help Mesa CI, since we can reproduce
> > > this bug all the time with Vulkan CTS tests.
> > > 
> > > Suggestions:
> > > 
> > > - Can we get a message on dmesg every time this hiccup happens? We're
> > > not sure if it's happening on real workloads on people's machines, so
> > > maybe having some sort of indication "oops, we just unstuck the batch
> > > you submitted 300 frames ago!" would help.
> > > 
> > 
> > We will add 'notice' level message if this occurs.
> 
> I may be wrong, but from what I understand, 'notice' level is something
> that will *not* show up on people's dmesg if they are using distros'
> default config. This message signals a bug is happening, we need to
> make sure it appears in dmesg by default. The whole point is to be able
> to figure out if this is happening in the wild. Can we promote this to
> KERN_WARNING?
> 

I'm honestly not sure what shows up where. 'notice' is same level as our
job timeout message though. If we need to raise this level, the job
timeout message should also be raised. To be safe, will roll both of
these changes out in a series - I wanted to refactor my latest rev of
this patch anyways.

Matt 

> > 
> > > - Since we don't know how long until the real fix, can this be tagged
> > > for stable? If it turns out this requires special GuC, it would be even
> > > more valuable to have this in stable since those tend to take more to
> > > propagate to people's machines.
> > 
> > I don't see any reason why this can't be backported, will include required tags.
> > 
> > Matt
> > 
> > > 
> > > Thanks a lot!
> > > 
> > > > 
> > > > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
> > > >  1 file changed, 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 0b81972ff651..25ab675e9c7d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1052,10 +1052,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >  		exec_queue_killed_or_banned_or_wedged(q) ||
> > > >  		exec_queue_destroyed(q);
> > > >  
> > > > -	/* Job hasn't started, can't be timed out */
> > > > -	if (!skip_timeout_check && !xe_sched_job_started(job))
> > > > -		goto rearm;
> > > > -
> > > >  	/*
> > > >  	 * If devcoredump not captured and GuC capture for the job is not ready
> > > >  	 * do manual capture first and decide later if we need to use it
> > > 
> 
