Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDF9E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 22:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7947510EE9F;
	Thu, 12 Dec 2024 22:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxaiQbgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1040A10EE9F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 22:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734043675; x=1765579675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vAFXfN7QIrYYF8ydW62z7CEiT2ch0MkzU2KkwWojRxk=;
 b=XxaiQbgkGoXw1yarmzyAUtuC7AZ3ii4l6Iy9cp49LOIGMYHmOwsC7tvO
 xehtUuql4cyRsw/LhHBq8hniO1DGd6OVKdEnQYcdOoHMyUR08ViXrvWnW
 3Fcz5X+8Ii6eIF7zKp58bqczmtQNyZFKrhOeE/bv8Ox8PcVx2u7t1Spfu
 D+RkRLbp9fz8N7gdMr7y5g/lkZps+ntovZ3nrM5JPkYej5+pU0Y+WQkJP
 oDznE+spUygU0VJf3PGWRrsXTlXREN+6WYb78q3lw8zmxPofW5Gorv5UB
 ZlQz7WfgE0nal1SSA1cHb05QLceMO2kIM9OidTkYBqHHoqp6C7CrV2JR7 w==;
X-CSE-ConnectionGUID: pTzqYW5kTveDqPvcIjTGmA==
X-CSE-MsgGUID: 0Qp4RBt9S/6sdgEYR2sbWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="22074720"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="22074720"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 14:47:55 -0800
X-CSE-ConnectionGUID: AVO3+Js2R9uxHm28JYEr/g==
X-CSE-MsgGUID: v6WC0BKPT+unUoUNO34VTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101214322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 14:47:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 14:47:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 14:47:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 14:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sANdnwXWkYxhBUWZfKmrlhSprYvtMkGw4Iy/rKNdsXXKIS3XZ4qWYhPzQ/z5sHn16F3HHFtJLenbJXFJ4lbaEmYUJA+uxt6nS1EgKMrgYrHH/YFcSJcagL9kkIZA+EuU5lmvhCquy8g/z+eJySZH0GFzg0r8tIrbL38vP5vC3N6B9zLKIF55kJ+Ie1h5yV7aA0IiSOKZ5vros4k64eAibvpArLBh+ZRObjSNwijcwj1hvXRUlbQbfdriJxZeSGevvvBJwtf03js1dq2+LWx83X2x2f1aZae4T9q8oimv625AoIfKFnVi7XADduy/qBR674ckHVSXcseVZJUgUvqomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HKwixfnLvvldzGNQY3uyVYawrvYy1AsdX/xfTGd4zw=;
 b=ay40UgEE1qKRx97lg5LW7j9JRD8VxhBuosYaIGEou/IQgPHPzK2sdubDq8UszDTkhCg57IQ1nv4jA7C/18tiJ0Y1lktPEfY8cSOn2MPU6OTRoU5L4rjR8TH/FU2nt+YBg4svgMMnvPd/d6QBnPoi/bEYu07+Wur9V14S56jkwKVKQLtYo4KZeEpiUyk5F+qf5yg1ugA0cua9lw30PhWFtJYhfqB6gzr96PM27d05KLUk3M2IeX854QjABijXfagmrK6tSLwE/VfZcUFuq4iLm45mRlhNT54tjznk7SP3yADEf5tOjrrcr06W5/O3iR1XZh3SE86haK4P8m0vkmdIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.23; Thu, 12 Dec
 2024 22:47:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 22:47:20 +0000
Date: Thu, 12 Dec 2024 14:48:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/13] drm/xe/sa: Allow creating suballocator with custom
 guard size
Message-ID: <Z1toI/eyWXgYzVS/@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-9-michal.wajdeczko@intel.com>
 <Z1pXRtHk5S8Fazd2@lstrano-desk.jf.intel.com>
 <89aefb1b-6286-4d96-b21d-e6cb163e0dce@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <89aefb1b-6286-4d96-b21d-e6cb163e0dce@intel.com>
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 72871f04-55a1-41f6-91ac-08dd1afeefdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uz9YeEa+Y+KpleTzOdPRNRIK0aw1zOWjdrEJsxEM9+xx4NOcseHYu5UNSz4v?=
 =?us-ascii?Q?O87HOj89PpWs6NrNjYkZOAwsDbCbYolc2BlU/4fSqDpZbNgk491Upso4x8nL?=
 =?us-ascii?Q?mpbIqDhgXa2rSzA2IobVtHEMarMVFl77o+9FXPIksURzxEcwLWLyflDbI3t3?=
 =?us-ascii?Q?rzTNgDqJvISzbpQvYykDBHO2FL0/l8CTT9Bu1XXty2rS4CdE/rhgQt5FETYx?=
 =?us-ascii?Q?it48VNB+vUOvID1XFzpcffmIj26loyrrbfu5sXN7vCpiJZ338Fkz/xLEcZVg?=
 =?us-ascii?Q?vivKh5TyIjFpmU4rbvlNdLHU9lF9hEyH6ZDgTcErV6JHRgAMlI8jYwUD9y4O?=
 =?us-ascii?Q?hLAaE1JMxmH1UimC3AL9lCJY0d4Z1ndVI2+y78GFbfWCwRwde5073tLelM2I?=
 =?us-ascii?Q?9sxqC4XzHDqticwkXAp3s8kf2FoztJMGR4Yc9qT6RxWvrmRQWLHa7CXUDHpC?=
 =?us-ascii?Q?Ihc6OlOTxYDiWCZ0bc22lwHmsrLElV4o+OtNmihubzhrgFsUU+2hru9M/v1x?=
 =?us-ascii?Q?X0PAZnbp7HCr5utgtbuKF06i8UAts8AIzl4S2iYBEEVKxg1xC/IwaT7I6usA?=
 =?us-ascii?Q?z/C2WQY+fQINhiRRH2munRWz9DY5ojwcH+7kTrM9X5kabpHdi2muXWxlzbIT?=
 =?us-ascii?Q?Vmh9cEOeynuKempEuLiUDYRhY3uU24YqNqChTkzexEU2qzoFPgIJrKTZGGBi?=
 =?us-ascii?Q?BMwEG+PP5YU0o8k0GhJxdBEuPxP/MarSRScS2jR5hpSw+CcZs5/Q99FQkJGs?=
 =?us-ascii?Q?xfoo+cQdZ2Oc/yNJUKCeODowuWKrUE38eR5avIm1G7Wwa7uqvxK0OjobZpAH?=
 =?us-ascii?Q?3pSskiH/Sk4H0fRVEfpdxDxYzB+XiYZ7KaTw+cikuMg71Oi1ciECGXM/PswR?=
 =?us-ascii?Q?FI5QP/34S0ngLT1KU23ZXnq32oMIuUMC1tAX+SZLf8GU+zqzRIszis7+9QiW?=
 =?us-ascii?Q?WpX5xHhxJti/FmB7OV4dEjhb4NfBjDx62qInosuZZGpHMmOC6T4141vZ9+6P?=
 =?us-ascii?Q?Dt9FStKjMkxjWxm9oRkycntFmejf4G9Pz+5PuAWhWApqCSWWdvIFQLy8WZnv?=
 =?us-ascii?Q?6t19/NuC8MaBR1zGXkmwVmMK9wc50Vy/7XEGRTOfBz8wXGCy2AC5xBfByYfm?=
 =?us-ascii?Q?xGZ6ATPLfrbT3A+nTYKkb3nUe4cGIY+hGwwy+bnD8ijLqa3BP0hs8EcT/2bz?=
 =?us-ascii?Q?dnsDxTttOMh50zOS6JydOBuTvOLLqKLPZ2eDqA8iGeaDVsOW23oVIHr5/DBc?=
 =?us-ascii?Q?rhU7z+ZiNe55iJX7mE4ZI3LsBOGVpKFYY9MmZKr1+n6SyjN2Hih7/8jj/WJq?=
 =?us-ascii?Q?TZZgy7jWYhom0+JcD7I8+fiXIKYCwre3BjPrhEtUwum7Tw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LS4Wuhzs3hisHSy3BJkrgNDDz73Qy5Vbn+rmttiEhNV/FdP4Isf9RNUqP89p?=
 =?us-ascii?Q?yRqYcUPlRvjaeYyekeCYAMQx2kZeFB4b5om0zlZgQMyX9PFm48Qj5oAjhowz?=
 =?us-ascii?Q?0uuc2v/jmBGbQDRd6XtaUxTci+XT3dzukSehl/Ye4ik/n3AsCFx7Mrmo3qoX?=
 =?us-ascii?Q?kYkN4egr/l63c8tHbsy9lEvnyz6DptFdAQmeirmmYA1bZvZtcW9HYgAZ3tZN?=
 =?us-ascii?Q?S0GE66JGjkJU76qVKD5w1fgkwtYo24W0EuFjAhraoQbZcmEDCaiNaJFzSf3a?=
 =?us-ascii?Q?EDKH4l2yRl2EbQ1orZgpAOaZ+mnCvI//ToV9gLZU4utaja7+CE2YavTHCQcQ?=
 =?us-ascii?Q?qZ9q5PIImYuY5QF2Q4+APDwHZNU01KiOCtJOFOBrwxrfPJ9l+dCrCtMnBPne?=
 =?us-ascii?Q?GiVHjSN+hm3Xcp578Pn+R9GnXETnts9yiVINOPl9OhRG/3otu31ktk8FEmZ7?=
 =?us-ascii?Q?oK+kbyZ6yvnC8jVMvKn4RZdiTicW7Q5nQNv+1qFAGYxoWIIVeciBP2vuJFbX?=
 =?us-ascii?Q?cVKWS/8DgFqsPUMM5ewJEgat815uKn/wNodWa7Mln5l8/0Z2DEwtGAHaSRkG?=
 =?us-ascii?Q?Rn+AMUIT8H23A5irkoChCjTgGznrYqlJ50YMavzRMhvT/THbAuj97ptQHTTt?=
 =?us-ascii?Q?6YBrgA5KuBXibmlVIlEqe0oezuziFG0YCH2KJGLo1FOCeqvsXWpe9k8I8eFf?=
 =?us-ascii?Q?14NdIfe9eRn/iM/nVO/2AADQUtz2s5ZK00nelpk7Cm0kJtMivlBGdQFwpR52?=
 =?us-ascii?Q?SnWGFE4wgN+A/TwEsui/4xN7DxRaZq/upmgeojPawmYr6Y9XaItDGXGTrl3z?=
 =?us-ascii?Q?kRR/QgY1R/BcbbSt5k+mfDmJdtIB4HRDCmfpSe0Ty40EUBVdImJtG91wF/9n?=
 =?us-ascii?Q?NjaKIsdR3bohMZjMMOS65YunPL0+0qR811Z2LXfjCIO+IvYv0BIqpcTwmRNK?=
 =?us-ascii?Q?YyNth+e0u2dUqgtJConCiUndJuVqvmAI7IU0aafr4+uT2Q4N3XJTcW6AFNal?=
 =?us-ascii?Q?Co3A9nNXH1uG45ZyVeX4A+soaPYKP22ZKB87SOELuXLdSq+wgMczndKaNZNy?=
 =?us-ascii?Q?rokDN3T3gniOMX0zL2hgwI2Wcs2o3+IlKLt2SHG2edcl/5AZ3z0hPWN/kJBG?=
 =?us-ascii?Q?zJ/H84hrzotS4980g5/4eVq6xgglf4sYbf+3f1JyYGOopBpVqgwcDdDbLfwV?=
 =?us-ascii?Q?Cl9QTgseWhMLtbKALftvjQ/wxbZFBS62RUaLGavptdx7cHAMZ1MZGYleyUqa?=
 =?us-ascii?Q?fLRqdubOy9VhY2LMu+u5ALOdp8asdLsodqTebE0Gg/4+VVK84Fj+vpPHe/HP?=
 =?us-ascii?Q?q6cANO73R0zauFtYTsnEWl1z+8ggnGch63IqQC2RX6kQPbDg5nxIOJbMH8F6?=
 =?us-ascii?Q?SfcQ45o8d2XxlrpolWqHCp8RkDYXbtHoGyYaArJMu1+FbMY0CLzE9LH9gNxF?=
 =?us-ascii?Q?si6v5nrOAIBDadoPrpFDbnz0UoV9R6ey7wpru+eqPpxr3WBU3U8k+eJzRy3q?=
 =?us-ascii?Q?Zvaf403L/HB+1NPmh+mOsPITFKzzyGUI//EPhcnPl8m92Dr5BIIlycgVCBeS?=
 =?us-ascii?Q?ZHfeawXlxcEvYB5kEkvUZh7hur5oF007pBwNCqP54B5iRTPklCZAKL79yn/c?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72871f04-55a1-41f6-91ac-08dd1afeefdd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 22:47:20.7113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGSGgLue1pukUHpCt6Vo13heXIZBExikf50G+YL/NMqTKJPDY3r4M1oJ5CMuoyuzWJZv6ICHxZT1/ikS1Frdrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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

On Thu, Dec 12, 2024 at 10:57:31PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 12.12.2024 04:23, Matthew Brost wrote:
> > On Thu, Dec 12, 2024 at 02:01:36AM +0100, Michal Wajdeczko wrote:
> 
> ...
> 
> >>  
> >> +static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
> >> +{
> >> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
> > 
> > So why is this guard needed? I'm reasoning this was for CS prefetches
> > but all current uses of the SA (xe_bb.c) do suballocations with CS
> > prefetch padding. We likely don't need to do this in both places.
> > 
> > I'd say drop prefetch padding from xe_bb.c and move the prefetch
> > calculation size to here.
> > 
> > Can be done in a follow up but before RBing let's make sure we
> > understand exactly why this is needed and develop a follow up plan as
> > the code as is doesn't look right / necessary.
> > 
> 
> since none of SA functions were documented, same with BB code, I just
> wanted to preserve existing usage without going too deep into a "why"
> 
> to get right answers we need original author(s), but since code was part
> of the initial submission, I can't tell who is it
>

I think Maarten was the original author here - will follow up with him.

Agree this out of scope for this series and not a blocker but we
definitly need to follow up on this - having things the driver which are
not understood is not recipe for longterm maintainability.

Anyways since this is not changing any existing behavior:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
