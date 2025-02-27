Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557FC19F32
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 17:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D2710E040;
	Thu, 27 Feb 2025 17:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FiWxzz0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079E410E1B4
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740677710; x=1772213710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hMkt3dw5SVqtWunzz9rn1/Twazo7REMk4mb5oRI8hcg=;
 b=FiWxzz0c5/PZKJDVF16qDXqvpkeGFFmH8EfK/+UtE3bhctUjF1gdYo0n
 uwAWhlhEnxp3o/ahLxfKXG+6bZ96DxCHvZMQyWE2NbJrNdkL2TyYcUMCK
 7UuHMq+Z7J4ENCsk+2q3GU/fDs9m1LlE/ejpBpHUHUTIUybPmK02Dpmw+
 nWDwgETwgVISRrh0wGNnczZc3s6nxwNrO6SzlCwBJHPJOVoigwpCxFScf
 8LdnyBD0G4Aii0VvozdYeaWHQbik7zlOKbtkv/aAUc2tbioP5nb8nBKjM
 PoCCJlJZtg4r2JeJITOdSsWF1Brzr1NG1xlyEIvJ0dyBLW9i6qZT6IBvP A==;
X-CSE-ConnectionGUID: g5Rwnd64Qzeioaj4/5HOtw==
X-CSE-MsgGUID: LIjBxpZuQjOsWNFGxu3mTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45496987"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45496987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 09:35:09 -0800
X-CSE-ConnectionGUID: hs07X+21ROSncmK92swQtA==
X-CSE-MsgGUID: 2+6NddfgSoi5TSevkFMosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="140319496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 09:35:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 09:35:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 09:35:08 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 09:35:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxKUVYlvOzg1sPukRZdwBSWSUM/Sx6YmKV/JPDzsHkrzmdbMB2LiNHRtcMtCPEO+Wz+eGPX0nQHGh3X+FjA7m8zYhxcMlyPV/SpwWFkV1327xFiGiiwZUh+teER/ygRFMl0UL0tDWdR2i0/Zxjra+4um+CzFsU5eNZE+HX4Kfb2nDX1HCCGq+S9KhDwUw6FJwx3P31t5IklprdT6ciojYO4SRXeDGnQ51+nGhk1807CikeF0WAmMfYPFU3Qtz2FoeWCbyqHftTeI4fxniwLsaGyauB9cWAss7k/szvbMWaCHbh8FYYXUnj4D8IxEAUYCw2HfmTsoscsacqLySqjzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsKPDRWL8dU8Gc2O7dt1NJwWyua84RJMBrxGzs2qR0k=;
 b=xXzl0m+E3oYgr4Vrxedh2O7LIDgeCKS2VY7NSSDB4R7Cimn/GMqbWmT/9/vJmQM+fwxi+75co3kQ14appzUUoeAzI1D6i7jpSom8ss7qz/nbKJTDD4Q3a+XLHNmhk4PP/KoFQe+UTD0Udivl9V7QMmf91jkgKMH2RlB2VhW/ebntxpO3FzaGJuvcnjhlxyliLSB+q6OiSiFhgOSV84EGPJTE0+E1hkx81/wp7XSNMOC4FJNG6WWYUO8S/HV0PTbY9tZcEa7RPTVLXBFp+7QM3xk2nvCm17Q1MyTtjp5uToi8jqhhv4zLRlfrJKzcYoAZgSY7/D9YVZXbjmaY2KENFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 17:35:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:35:04 +0000
Date: Thu, 27 Feb 2025 09:35:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Message-ID: <20250227173501.GP4460@mdroper-desk1.amr.corp.intel.com>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
 <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
 <20250226215944.GF5109@mdroper-desk1.amr.corp.intel.com>
 <j2cqfbthxacfqelnons5m7ltaaqkdqdrzkbuhvx6wpdexpvpt6@hmlr7ey7otv6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <j2cqfbthxacfqelnons5m7ltaaqkdqdrzkbuhvx6wpdexpvpt6@hmlr7ey7otv6>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: d65c324c-ba0f-4b91-3584-08dd575511e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJBjgUUl+idRvQmkfABEClGUgF4lCMHHNd6LUn8PC5hD3vsmziRcIhFoHGjy?=
 =?us-ascii?Q?F2oJKZ1cTsKDkDUUpPTSfs//DSvVf+GAZ/Qa4SH17dWOHyIAlWNHD7h8ktIW?=
 =?us-ascii?Q?LLsSC6fhTwC1JJTWOOhaV9banFkG+sxgtHx6+xNReNOtJnjZha0Y5JLgqzas?=
 =?us-ascii?Q?TWff5BxsJWkjuKweqx1i8VKCd69ibxlfRWugfzZhjQ5tiTwClWowHpRUYpEu?=
 =?us-ascii?Q?93NO6ywnBi2uwrwegwoH4gZEG7SdoivTLv2NgDGyJlXwlfPORC8KVFDUuyhP?=
 =?us-ascii?Q?QAH6DrTIIsW4mvDuBiTpuXLx6/GubilIIs4+tGTXK3N+lHjLR1EA4wRdUwDi?=
 =?us-ascii?Q?xIVYfqKdbjBGpULAMbpac1f7qcBTkVNZc2HsiDor/owRtk0JOv/LFM/V6WmO?=
 =?us-ascii?Q?9zQYWQPsvJEaSqTauEnnvVET1Cqnc+vEB0hWEGKoA3FeLVuLQza3XzboJqUZ?=
 =?us-ascii?Q?93UwTGQZnKaZGruXP6iQOZrITW2gEEL1hZS7WQ88UiJ0tx1Dxpg+2bfz+VDn?=
 =?us-ascii?Q?SqivAB76cd3zjv0SUdTCR8DjuRpO+ffQT1q9DjCG0lL5XyjbJen19NfBwbQl?=
 =?us-ascii?Q?uo2hWyKGTSufZcDjwnMSG4w+5q3x1TGufoy5eLF4vb8HBRq9Pl9XC3AaiFAD?=
 =?us-ascii?Q?FhWImFLmpFhHalT13nUR+BMqjUl0MmEXBh+v3J2nlMXCPITQpUCiGRKzsBIW?=
 =?us-ascii?Q?vXQnnfIhm8UwdZp8LYrIBLZ5732huhS3zC2J022P7a22Bx4v+/QCBvgsY2qq?=
 =?us-ascii?Q?hvWgPYdIfgCZi6s232QzIHwm9il7tEsLV2mCCbUjwzk1cAwVfQ3RwFPzU7iL?=
 =?us-ascii?Q?loSDw6C8+DTC8bj8U6DxmnDMZJgsoEu79pNuKZ6J8cwgeKN/TilausnY4IiJ?=
 =?us-ascii?Q?dhDhrK67tpKjYIzSKL8ixLxEdqwqNvPg7AbQTDoUaUQhRshc39lGpHUDh22h?=
 =?us-ascii?Q?R6zHaW7IpkhXtZn3hq/JjCUR6ljQLaRfgw7xtwCLnu0DSIkLHa/DrnpJ4nSc?=
 =?us-ascii?Q?wZzS6/AFN5IL5kcz/Lu8Cu5hPV1Qa5eNQT8QlV4rREoXfNHG3nm6UegvPgPK?=
 =?us-ascii?Q?wL8i6GpySFMF+8r6JCGiEqdt0jv472vZXyPSh2bLdRuJvJJY4mjscEtfp8RE?=
 =?us-ascii?Q?Hja9duYFc7ggcl2BV4pCIfC/EOt5K/g5BKdgsQQDc9E066r+Bbvak9NWcr2S?=
 =?us-ascii?Q?77nON19hxIr310oxqha8TmwqpurWVvKr59u+XSiST9M1rexCHZeLsO5sWUKG?=
 =?us-ascii?Q?g61SqUPqkMAS5xy4huR/DDBLtEP7qbg++pqOmNN5kYeqb85RmhMRUejcMmeG?=
 =?us-ascii?Q?iQIeZF9sjtfQ2p9RqlipS4N6k4HARMeapiAP6wyXSNNjS2rGv6ctUUMlEGks?=
 =?us-ascii?Q?eILaR9zMq3VS7ujyWi+On+e4FFKo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wXJQhRKJ2+Vr6S2xTUvMjkdnbC5RgWnGVugOm34ASGHcmoq4udtng/DBYsj9?=
 =?us-ascii?Q?fSQ2BM5NFvXPgFSfqF149K+C1GLqlBI5kCdNsrFY3SxbdgMhKsF+ygif3qQ3?=
 =?us-ascii?Q?L3GCk3ZPGCwD8tzIQECIMctEQ/7TfvyX/gLNL1eEyiJvrPVfNHbcTdDGdAA7?=
 =?us-ascii?Q?FHeF+g0FvLHUBEdpE9y1nThF5loRD05c2X8ytp50owvydluGTckVVZuZVjCk?=
 =?us-ascii?Q?+IElE35mktQDd5Ex7AOrvh+ie8CPA7gLj8MrWH92Eo9HypwkUJq2zIOCCmrW?=
 =?us-ascii?Q?cdrVYQpv2wQOUej4lrLWJJ2ohI6fc5su5+C/06tNW7ke1DxDwOGLb5mpqqvB?=
 =?us-ascii?Q?8B1iNK+hGpfw9wAGxqRGYgLpcwHyFXC1BRYuwktKfL9duS3+p+Kb/IQ7B03Z?=
 =?us-ascii?Q?L68ptW7NRu4w4QimngOOHCSUk6d+lorOc1QYE2xTmLTG09gcjiLtAcXreAlV?=
 =?us-ascii?Q?z432K8JvEpg+Wovb8nWdFAdoxKcePXQiROppntiGDmzbypZKIiI9MuLfO++Z?=
 =?us-ascii?Q?KpqD/iy2end/CF5riQDpp636ojI8jNgmDn63LzpDMxGjkdzAQr6yqRPb2eqc?=
 =?us-ascii?Q?P9Zwa/W8RNfmvVlf9sEZgkGmgS+VvchCrlDJjGCb+5Pd0wHciLMEWlGweyhV?=
 =?us-ascii?Q?WMm3eO6PcD5cy3Kp1fA7SqPBv/lhnQkncNbIPh7rZF8jcDwUUIVaRyqdGXBB?=
 =?us-ascii?Q?xeXoj7qiZ85lh99bQ5wZKBS79+UFmprt7dUALsoF+Nij8aUNGEXa9r6sGXz0?=
 =?us-ascii?Q?9pf9Qvsi5WeGpJCNsnyx2A1vOVwq11wmSJLre8BBYAhfrB1gJb1E0KLWpYLV?=
 =?us-ascii?Q?+hspj7qcBjUorYad503wa0bhgLuYBDAivP3g4hv4by7Ets0JHBniQVju4n2k?=
 =?us-ascii?Q?s3gQnbLxBCagdYOgx3uZeC0jGIJqT3W6Car8Reqy0QwTQo4EagHqNCCi1Df7?=
 =?us-ascii?Q?sp9rj8cRkVr9bmdgpOGfNTdOUEKTwv+GKRFzIFz6my33vpJktP6/xa9MX8ue?=
 =?us-ascii?Q?xeMfAQcM1+N01FQ6UgLGxzAMq+p7RK72x9pjDtHZNBfOo8tARRd974nEPKt+?=
 =?us-ascii?Q?lOl9NlTHjhzdplJNb8e/clEXBEmDGA4VIBsqvasDfKXmMEFYSOJmbSqqy+wR?=
 =?us-ascii?Q?5yqiEuydUTttSX8tVn/ZAQSisKAytWxXI7OORrSmLJSm9QsZY4kOqN5hUOXs?=
 =?us-ascii?Q?h/3JnUtR9c7Lgi2gBZLtMiZ9Jd421P/XfjlCowZ1YInYTnTdp2ZsCzMb7kH1?=
 =?us-ascii?Q?LuyBV0FmJwYHkHWQYTo3ph07rf383rt38SSQvQhD2ugwCtFUxULRCLwb9Frb?=
 =?us-ascii?Q?PMdu4tX0nBMeigGKCd5DDb7WRdk0F2e4vYpvqn8y1Xqh4WiE0aMhDA+xAWP3?=
 =?us-ascii?Q?1IxR6hadxWfaENLD1RyCwNWLQ0R8WsAKFX171pO7P+8lL/unWP9xUortI0n0?=
 =?us-ascii?Q?x7eTY2dLttBo+TNqy3RCwmPRiHqh0qKneVTWQqkzTG7RiVycbSeoFeh5zJei?=
 =?us-ascii?Q?kjtJLl/g1Yy59e8jwdJ4sqZbPvd2Bpf7DIqJYFwO4IcdJLp3afFsKTi646U+?=
 =?us-ascii?Q?uubP7VNvCwDwUYBCKMHPp1SwVJZvtLsdIVZU4Izb/0Gmox2lpmLYjs+WYmVH?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d65c324c-ba0f-4b91-3584-08dd575511e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:35:04.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ScqlFkUeBTqnAEcVIyQ2FQDKNG0nbCUNZflW/gx8npTqtKn4Ol5pelc3KR6vasK0LXA1oL22BGl4dFDhowh7GRn04ky1kFjddfivVZ2miY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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

On Wed, Feb 26, 2025 at 10:47:52PM -0600, Lucas De Marchi wrote:
> On Wed, Feb 26, 2025 at 01:59:44PM -0800, Matt Roper wrote:
> > On Wed, Feb 26, 2025 at 11:20:16AM -0600, Lucas De Marchi wrote:
> > > On Wed, Feb 26, 2025 at 11:21:03AM +0000, Tvrtko Ursulin wrote:
> > > > Any rules using engine matching are currently broken due RTP processing
> > > > happening too in early init, before the list of hardware engines has been
> > > > initialised.
> > > >
> > > > Fix this by moving workaround processing to later in the driver probe
> > > > sequence, to just before the processed list is used for the first time.
> > > >
> > > > Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
> > > > should be present while we see, before:
> > > >
> > > > GT Workarounds
> > > >     14011059788
> > > >     14015795083
> > > >
> > > > And with the patch:
> > > >
> > > > GT Workarounds
> > > >     14011060649
> > > >     14011059788
> > > >     14015795083
> > > >
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > Cc: <stable@vger.kernel.org> # v6.11+
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > The version in Cc stable is because it's what matters for officially
> > > supported HW by xe.
> > > 
> > > We've been using the reset domain to decide if a WA is an engine vs gt
> > > workaround. Although I'm thinking if it wouldn't be better to simply
> > > drop the FOREACH_ENGINE processing and move those workarounds to be
> > > engine workarounds. Matt, any thoughts?
> > 
> > That's a common mistake we've made in the past --- it doesn't work.  If
> > you try to put a bunch of these registers onto the GuC's save/restore
> > list as happens with engine workarounds, the GuC will throw an assertion
> > and fail to load because it considers them to be outside the very narrow
> > set of register ranges it's allowed to work with.
> 
> but that's a GuC issue that we would try to fix? at least for new
> platforms. if the register is in the mmio space for
> that engine, why would GuC do that?

No, that's intentional behavior.  Just because something is inside a
register's MMIO space doesn't mean the GuC should be re-programming it
on resets.  The proper behavior for re-applying workarounds really comes
down to the register's reset behavior (whether it's wiped by resets or
not) and that's based on the sub-unit of hardware it lives inside, not
where it falls in the MMIO space.  If the KMD asks the GuC to reprogram
something that it shouldn't be, that's considered a KMD bug and the
GuC's assertion is there to catch that.  It's a safety net to make sure
the GuC isn't accidentally touching parts of hardware it has no need to.
I might be misremembering, but I seem to recall that there may even be
some hardware enforcement to prevent the GuC microcontroller from
touching such register ranges on certain platforms.


Matt

> 
> Lucas De Marchi
> 
> > 
> > So no, unfortunately these do need to remain "GT" workarounds, even
> > though they need to be applied to registers that have per-engine
> > instances.  :-(
> > 
> > 
> > Matt
> > 
> > > 
> > > thanks
> > > Lucas De Marchi
> > > 
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index 650a0ee56e97..d59c03bc05b7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > -	xe_wa_process_gt(gt);
> > > > 	xe_wa_process_oob(gt);
> > > > -	xe_tuning_process_gt(gt);
> > > >
> > > > 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> > > > 	spin_lock_init(&gt->global_invl_lock);
> > > > @@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
> > > > 	}
> > > >
> > > > 	xe_gt_mcr_set_implicit_defaults(gt);
> > > > +	xe_wa_process_gt(gt);
> > > > +	xe_tuning_process_gt(gt);
> > > > 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> > > >
> > > > 	err = xe_gt_clock_init(gt);
> > > > --
> > > > 2.48.0
> > > >
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
