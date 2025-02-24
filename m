Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08161C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C653F10E2CA;
	Mon, 24 Feb 2025 15:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqWhK1nr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4684010E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409600; x=1771945600;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yTpWtcGjVwxz2921J9UruGeU/+5PLCA5y7o1rl2mkPI=;
 b=MqWhK1nrUWrPDn+mbEuLBUvVM1FC4YB0UxzE02tuP8qIB/JHcqjVDQha
 v6zEGOGPNu2LsjJkwC9Zy8M+XhnJc2vNdTU4M7ZWyJN9N06da07GaKbhP
 MV5ca0/KzzcHpeDzhoE0JZLCZowpytM1sI4ZTj3rtRwQ3FakYc5CFvEEJ
 2zMEqIu3rRLFhiIU/BBtmCAa8pfc5yfllkNTifLvuuDDy+xUrFjYjsE8h
 jFl5SiFM7YnXw6PKozW6ES0HeeQsHF1DTEMeU1knPtpW71srRJrjf9g1C
 aKyXpxlUdKISEeK/cmBFpvkRNb+JCKc58aY2yOyoRXPD8GCzRCqv0gNiQ w==;
X-CSE-ConnectionGUID: 8T3WjET2TCaytV3CTo1Yqw==
X-CSE-MsgGUID: IGMjfR/rSdal5N84NvIvgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45074800"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="45074800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:06:40 -0800
X-CSE-ConnectionGUID: 2u5xrOMbR1ODPq0aolmFQg==
X-CSE-MsgGUID: TtudPN0OTAKoErWlsxPwcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="116105485"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:06:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 07:06:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 07:06:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:06:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWXkbjBVndGrqMOjgg5985K3iL7tIcq/n8K0j0u+6Y82CcQhYa2Q3MluYkRJa5kxSLeWxjQnEq3bDrKION3swEydZm//AtCXwyFV0+vyGT+gh313ORI4c2Y0q5KylnrVNgWxLm9khLkHpDks0H+gNI+vrzYRpRgEpEA8PwH1SSu5TpoNgUwv31WmOqSHq5biItXSO6Ai787elddItbKhCKSvIuPIa6GSOkA7DD4nl8btnWYiUBAtwG31VFulctx3xx/pFCvZjgdW8Ro60K0hZHKKM70F/Mlr8ntfvjkRsTYhAIrEORL3SaXSrzKtGHIjEClVWUTZ1JnCyT9qqxVmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWIkxciQR/dgP8hHnqMbrYrbia5kSvDS8/DMwndFJZA=;
 b=ySyWBVxOlTALkuOpj4kJcijIfIXvcWOajikkYTzxoDk18YS63dnYvzCwObtWKWQZwSFIFd03/AdBWOV0MJ53+O+hLejeOive5y/GJ6flnhXxuLkhdRNjRrLL2C4U/2mxFMsOSamrdUrfBQuc56yO4lYsd5zRXg8HtPKPxhbi8DtdmQE3JJWFTG5wkehRKsInvgh+g7uHR2/tGBnyk4R1sHDyLHRJ18+1rr/IR0jlCLtjmwAS2TONmVUv0tS6maDPz5Ym6AIpW1oNWBpblCwbmjIblh9ZtTMODpvgiMsEM/czSUn9s0usiGmV3bnmkV95y0B7WJFZqr6Og3UK3qQ9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:05:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:05:50 +0000
Date: Mon, 24 Feb 2025 07:06:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z7yLDpCcS6jGBM/w@lstrano-desk.jf.intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
 <20250224040529.3025963-3-matthew.brost@intel.com>
 <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5e829157edf3f4e1f4ea3178216ba400ff6f314.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:303:8c::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: f269e907-48a3-46c0-3068-08dd54e4b9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JxLJn+Nm166wmz7LFYUmGby3RB8kFF9L1+uB0XwEmkrQT7m8AZVxq0UU9B?=
 =?iso-8859-1?Q?K681S4qEczjUZddeApuzoylAcfd0b8AddZb6e9EUK99J2KeBhbNHyrIxXq?=
 =?iso-8859-1?Q?84VNFt9qYDXOJwryAlyZz5NlNaITHpJzOOEvGH//SdsJGRC6JSxso3FXWb?=
 =?iso-8859-1?Q?2sMJQNZ/XKJcLP2+ozgDfn91qsT9R19jWceIGlNXZ1ihPsF6zQQdsRTWnS?=
 =?iso-8859-1?Q?1r5MAMTzju/BKWCcofxu73XVwKSW4/jiiW9tPZx3Y0CvimqQc2m/Y6SEqF?=
 =?iso-8859-1?Q?9plRqICSkHqf+ngL+sPQ9zfQcnTZxhPxMzOMcfcc+duiEbhHBTX2uQb4Sq?=
 =?iso-8859-1?Q?BCjJhDePS48JGRrkyXitQxDeoqFOuIGlkhrJTUFX1M5pHN9ry1j47q/8e7?=
 =?iso-8859-1?Q?ovXEUeixfS+bdXimlDXhqeoz5UFfpTrq+/wx77ayhMPjKkg3sbGjE5xihh?=
 =?iso-8859-1?Q?phRmBJ1b5rFxcZXhh/yRxq5oozO7GdMW9GnaIoGM0BMjFH0OENMwA+AFmP?=
 =?iso-8859-1?Q?CYNV8Leecyb6ilpll9lO8+M6g5ID4aox8MWOzgVBM5/HT5jHI4uDAzCXBP?=
 =?iso-8859-1?Q?yoaPdi6ZC/WPagqLTRm1XIOpAYhdWjohl2DErv8lyZ5FZZG1AJMyeVXmtj?=
 =?iso-8859-1?Q?KJDnmPYOT6X7HTXIaKHwsiHMcoN3rfxNk63LWJP//gTYpMNFCli+Qr6xga?=
 =?iso-8859-1?Q?qO35Vz4lELzBAYCfHQdNVXcxbvSHaE4GfsymqhkZFkCFU2X9oKbUhZmKwR?=
 =?iso-8859-1?Q?Q4NDQtTGnlQ70ij+AeWVK2BEBj+mF79Ocj9JALl6dzs1PIOzLvMmhMdWSq?=
 =?iso-8859-1?Q?XR8qyGr5OjVhGkvb8XTZRhclyyd4D2pI9fmaXCbZtJxoEiuoYYU8iDTG9b?=
 =?iso-8859-1?Q?1HrE2Ee/RHP0Es6+Xex3lQfBEHhJrj0B8RR/BHiuSQSGGpHLxHfPMX6kHW?=
 =?iso-8859-1?Q?gCtCw7dOtQOpkrcS4zVFJQpFF1vAn6nJewdhfddrz+Ala4OiZS0LKKO1yd?=
 =?iso-8859-1?Q?1EZYRxENUZVNj6F3xgEMySsBW2T/3niU4QAk82RX+q68cjg69LcXyoY7rE?=
 =?iso-8859-1?Q?0X4L63RMt74QOiFWsTa5tX1wGc0i3T+nRyFLSzqUpjqxIh98nlG6errjw1?=
 =?iso-8859-1?Q?KqzzhPi9A+M9U11U0GgIKN8bi4W4z9A4elfmfGWSaf/96ZnTSJiot4z07t?=
 =?iso-8859-1?Q?Z8gsj02pzXydwUD6ScEIrCaHTW49NxJrVlr+q8eS6HdmwrHZPHnnAVD77z?=
 =?iso-8859-1?Q?u7MQiFDpT2IGXIEQc4KFST5hlzyNgO0nxTC5i2+B9gzHS7IMroyraTWcNj?=
 =?iso-8859-1?Q?mGyrnZHhs9dTGbodLUPgMjfkn5S3qoPccnxQ1+UE24PrjfCKfDE622QAai?=
 =?iso-8859-1?Q?miSvXTWGsm8r+RzNMXd0aTn/jk8jImFNqBNQGxt1WRsQaQpm7l+SSmQ71F?=
 =?iso-8859-1?Q?DvTHLdmJ80OrO0U2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6VUGH6eqH6LBOz3J5oAcm4D42vlFKK19iQPdZzFKdD6f/pU0Na4zNmL6O5?=
 =?iso-8859-1?Q?0US7TI8VIviU0V2RYp1PcnNAbV+NLKTMCeJ9eS5UVTfqIGZnrycY4KuAtF?=
 =?iso-8859-1?Q?D8MLszL3h+h637h3SHWWdLM6tlEwsQ6aQwjvYfqcr0MJsDnbnWgCLoZD0x?=
 =?iso-8859-1?Q?h0gNMP9GihS7Rd5FdgJVX9u/tEgUF6IuBk07QQSHh5RZj/W7aHJo2DaSs+?=
 =?iso-8859-1?Q?ye3W5vu7HfawMw/UW09L5l+RAI5DhUCZAOSQ8PbPu3JlGT4cy0TRlSAVVM?=
 =?iso-8859-1?Q?Pmg/o+A45WYzixHnVyFiDohABk/yTDxV/tqgPvnWJtEyZnpo2GkmiqEVDl?=
 =?iso-8859-1?Q?8a8H0Opub0/asLQr1si7etYq138NxBHZdqxDdFe4opOz7d+tijywtgBaqS?=
 =?iso-8859-1?Q?u0rLGT3U3h3cc11hgkBUSZMpU+t44NdCtSAvCskcpqQ3J+y9FiInxi78+E?=
 =?iso-8859-1?Q?RFz+rosWQV0C5sPvuM1mL+IqRQPG5VTh8zb9WktznnxySMtCZ1NoMeikI+?=
 =?iso-8859-1?Q?7LLGXETxEm5fGkstjmHx5e0B9red1WERYbwrWPP5JfAtK2xkbak9Kd0Mdc?=
 =?iso-8859-1?Q?dm0mbrs9NeYzCa4BTdsjHEp8tTxRhmkoFyRpIs2lt/XOLURJxC/nPWrPtC?=
 =?iso-8859-1?Q?MAECeh/lTnHW1o0V0jhkK6GpZ79UfBn5+nWXTqdKXRO1TLQle/4ycShdOf?=
 =?iso-8859-1?Q?VBfuuTdwz7Hdoauv5UsMOQHIU9j/RdjB4lA7bZklFhvFrI49pjFNNxh+9M?=
 =?iso-8859-1?Q?4wCH+HRZkVFfNaxlx1s5ztwRsAZwqRdvtBFIMb8qxIqn8zG7MOPzK7dhL0?=
 =?iso-8859-1?Q?LahbwK+LJw3vMhM4WUYGZh+BLMIHsbONwCEQ5dPAY1OfgFDZEXcwNA5m/D?=
 =?iso-8859-1?Q?QhbbuuY0+9SAT+xPob+oF+n1nxblypSUSxQdoqVOktRj5pmhaQVzsPOEt5?=
 =?iso-8859-1?Q?8YiKOYDG4xrYwU5FQQRjnoEtAs1SGwCSygJ7JI4dZv0751vX58xc4A5+3+?=
 =?iso-8859-1?Q?uxHov5QL7ETPAgvFJsb3mmhlRHcyxNkVBmWNq7ijf+ykSHuzznYyGxjrjY?=
 =?iso-8859-1?Q?RWIIHsoP3cIly+1GufCWCLPMsbH1hksjBLty536mHb3nidT1F5p4TmqUCP?=
 =?iso-8859-1?Q?Z1gLVRhX1kFbYbtou3VFwndjhsb9YzB/7Ag6s2MMSyCA995S/YyyJhob42?=
 =?iso-8859-1?Q?jBKlYdFdG6o/DYLGesOwuhJcekogbfPXcEDoLgJO8BzFRLPWoWbMHilIiJ?=
 =?iso-8859-1?Q?L/09KHf0GnlrMJOzul/Syhs2FIohZPUGYG51FSXXRwxKzUWHbk+NzTk4NY?=
 =?iso-8859-1?Q?bLyAOauvQAmUIxuVpb5441/fskwVwi8xK5egB3Lx6Vipco9FPu67uU9NO1?=
 =?iso-8859-1?Q?e1dVeCuS1EyAAE+uI6UMg2VbCg9hOsjPf2n+UHSGWLctER2VZ5dbfsmpwd?=
 =?iso-8859-1?Q?P7mX7nYq8oK6XsMBRf4SsvcFjBGFePOkTg+hquxnDkobo/Bu+asWrjsJge?=
 =?iso-8859-1?Q?Oho96Xd3HQKvt9eJhD0yBkaK4m4udy3wt7KD9FOgX7ecdz1aYvzFSEWLbG?=
 =?iso-8859-1?Q?nNIbBc3D+bLPuwntD78JD75vhJldtcY9If64jm7lfe7oxp2klcA0QiSfIS?=
 =?iso-8859-1?Q?AZRp7MNyy9gZp1qcIwDDf8y9WHgz6gS7Y+dcLyBvTlPnHRRvZao0s+Qw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f269e907-48a3-46c0-3068-08dd54e4b9cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:05:50.5475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnTUD1MqPQwfSQZA/hRhDN0YPVHHptGugUSlW6IebjAWsi2w+5WuJ9GtISJGFsdE1QaC6TjvVJPBtzOAd32c9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
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

On Mon, Feb 24, 2025 at 09:21:09AM +0100, Thomas Hellström wrote:
> On Sun, 2025-02-23 at 20:05 -0800, Matthew Brost wrote:
> > Squash bind operation after userptr invalidation into a clearing of
> > PTEs. Will prevent valid GPU page tables from pointing to stale CPU
> > pages.
> > 
> > Fixup initial bind handling always add VMAs to invalidation list and
> > clear PTEs.
> > 
> > Remove unused rebind variable in xe_pt.
> > 
> > Always hold notifier across TLB invalidation in notifier to prevent a
> > UAF if an unbind races.
> > 
> > Including all of the above changes for Fixes patch in hopes of an
> > easier
> > backport which fix a single patch.
> > 
> > v2:
> >  - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> >  - Support scratch page on invalidation (Thomas)
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: <stable@vger.kernel.org>
> > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single
> > job")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 146 +++++++++++++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_pt_types.h |   3 +-
> >  drivers/gpu/drm/xe/xe_vm.c       |   4 +-
> >  3 files changed, 115 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 1ddcc7e79a93..add521b5c6ae 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update *wupd,
> > struct xe_pt *parent,
> >   */
> >  static int
> >  xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct
> > xe_pt *parent,
> > -		   pgoff_t offset, struct xe_pt *xe_child, u64 pte)
> > +		   pgoff_t offset, struct xe_pt *xe_child, u64 pte,
> > +		   unsigned int level)
> >  {
> >  	struct xe_pt_update *upd = &xe_walk->wupd.updates[parent-
> > >level];
> >  	struct xe_pt_update *child_upd = xe_child ?
> > @@ -389,6 +390,9 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk
> > *xe_walk, struct xe_pt *parent,
> >  		idx = offset - entry->ofs;
> >  		entry->pt_entries[idx].pt = xe_child;
> >  		entry->pt_entries[idx].pte = pte;
> > +		entry->pt_entries[idx].level = level;
> > +		if (likely(!xe_child))
> > +			entry->pt_entries[idx].level |=
> > XE_PT_IS_LEAF;
> >  		entry->qwords++;
> >  	}
> >  
> > @@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> >  			}
> >  		}
> >  
> > -		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset,
> > NULL, pte);
> > +		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset,
> > NULL, pte,
> > +					 level);
> >  		if (unlikely(ret))
> >  			return ret;
> >  
> > @@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > pgoff_t offset,
> >  
> >  		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> > pat_index) | flags;
> >  		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset,
> > xe_child,
> > -					 pte);
> > +					 pte, level);
> >  	}
> >  
> >  	*action = ACTION_SUBTREE;
> > @@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
> >  	/* Input parameters for the walk */
> >  	/** @tile: The tile we're building for */
> >  	struct xe_tile *tile;
> > +	/** @vm: VM we're building for */
> > +	struct xe_vm *vm;
> > +	/** @scratch: write entries with scratch */
> > +	bool scratch;
> >  
> >  	/* Output */
> >  	/** @needs_invalidate: Whether we need to invalidate TLB*/
> > @@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> >  	 */
> >  	if (xe_pt_nonshared_offsets(addr, next, --level, walk,
> > action, &offset,
> >  				    &end_offset)) {
> > -		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child-
> > >bo->vmap,
> > -			      offset * sizeof(u64), 0,
> > -			      (end_offset - offset) * sizeof(u64));
> > +		if (unlikely(xe_walk->scratch)) {
> > +			u64 pte = __xe_pt_empty_pte(xe_walk->tile,
> > xe_walk->vm,
> > +						    level);
> > +
> > +			for (; offset < end_offset; ++offset)
> > +				xe_pt_write(tile_to_xe(xe_walk-
> > >tile),
> > +					    &xe_child->bo->vmap,
> > offset, pte);
> > +		} else {
> > +			xe_map_memset(tile_to_xe(xe_walk->tile),
> > &xe_child->bo->vmap,
> > +				      offset * sizeof(u64), 0,
> > +				      (end_offset - offset) *
> > sizeof(u64));
> > +		}
> >  		xe_walk->needs_invalidate = true;
> >  	}
> >  
> > @@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops
> > xe_pt_zap_ptes_ops = {
> >  	.pt_entry = xe_pt_zap_ptes_entry,
> >  };
> >  
> > +struct xe_pt_zap_ptes_flags {
> > +	bool scratch:1;
> > +};
> > +
> > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > *vma,
> > +			     struct xe_pt_zap_ptes_flags flags)
> > +{
> > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > +		.base = {
> > +			.ops = &xe_pt_zap_ptes_ops,
> > +			.shifts = xe_normal_pt_shifts,
> > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > +		},
> > +		.tile = tile,
> > +		.vm = xe_vma_vm(vma),
> > +		.scratch = flags.scratch,
> > +	};
> > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > +				xe_vma_end(vma), &xe_walk.base);
> > +
> > +	return xe_walk.needs_invalidate;
> > +}
> > +
> >  /**
> >   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> >   * @tile: The tile we're zapping for.
> > @@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops
> > xe_pt_zap_ptes_ops = {
> >   */
> >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> >  {
> > -	struct xe_pt_zap_ptes_walk xe_walk = {
> > -		.base = {
> > -			.ops = &xe_pt_zap_ptes_ops,
> > -			.shifts = xe_normal_pt_shifts,
> > -			.max_level = XE_PT_HIGHEST_LEVEL,
> > -		},
> > -		.tile = tile,
> > -	};
> > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_pt_zap_ptes_flags flags = {};
> >  	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
> >  
> >  	if (!(pt_mask & BIT(tile->id)))
> >  		return false;
> >  
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > -
> > -	return xe_walk.needs_invalidate;
> > +	return __xe_pt_zap_ptes(tile, vma, flags);
> >  }
> >  
> >  static void
> > @@ -1201,7 +1233,46 @@ static bool xe_pt_userptr_inject_eagain(struct
> > xe_userptr_vma *uvma)
> >  
> >  #endif
> >  
> > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
> > +static void
> > +vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> > *vma,
> > +			    struct xe_vm_pgtable_update_ops
> > *pt_update)
> > +{
> > +	struct xe_pt_zap_ptes_flags flags = { .scratch = true, };
> > +	int i, j, k;
> > +
> > +	/*
> > +	 * Need to update this function to bypass scratch setup if
> > in fault mode
> > +	 */
> > +	xe_assert(xe_vma_vm(vma)->xe,
> > !xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > +
> > +	for (i = 0; i < pt_update->current_op; ++i) {
> > +		struct xe_vm_pgtable_update_op *op = &pt_update-
> > >ops[i];
> > +
> > +		if (vma != op->vma || (!op->bind && !op->rebind))
> > +			continue;
> > +
> > +		for (j = 0; j < op->num_entries; ++j) {
> > +			for (k = 0; k < op->entries[j].qwords; ++k)
> > {
> > +				struct xe_pt_entry *entry =
> > +					&op-
> > >entries[j].pt_entries[k];
> > +				unsigned int level = entry->level;
> > +
> > +				if (!(level & XE_PT_IS_LEAF))
> > +					continue;
> > +
> > +				level &= ~XE_PT_IS_LEAF;
> > +				entry->pte = __xe_pt_empty_pte(tile,
> > +							      
> > xe_vma_vm(vma),
> > +							      
> > level);
> > +			}
> > +		}
> > +	}
> > +
> > +	__xe_pt_zap_ptes(tile, vma, flags);
> 
> As mentioned in my previous email, I'm pretty sure if we modify all the
> ptes in the entry array, not just the leaves, (that's basically all
> ptes of shared page-table entries) that will be equivalent to a zap.
> 

That doesn't work. I had that way originally but IGTs fail with IOMMU
CAT errors (e.g. xe_exec_basic.once-userptr fails like this [1])

Let me explain with example.

Array of bind 0x0000-0x1000 (A), 0x1000-0x2000 (B)

- (A) hits userptr invalidation
	- If modify all ptes in the entry array, highest level PDE is
	  invalidated. Both (A) and (B) either are 0 or scratch
- (A) does rebind in exec
	- We only modify leaf entry, not the highest level PDE which is
	  0 or scratch

Matt

[1]
[  359.895920] [IGT] xe_exec_basic: starting subtest once-userptr
[  359.902643] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]]
                ASID: 462
                VFID: 0
                PDATA: 0x0c90
                Faulted Address: 0x00000000001a0000
                FaultType: 0
                AccessType: 0
                FaultLevel: 4
                EngineClass: 0 rcs
                EngineInstance: 0
[  359.902686] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
[  359.902890] xe 0000:03:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT0: Engine memory cat error: engine_class=rcs, logical_mask: 0x1, guc_id=2
[  359.905791] xe 0000:03:00.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=2
[  359.905826] xe 0000:03:00.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=2, flags=0x0 in xe_exec_basic [9607]
[  359.905831] xe 0000:03:00.0: [drm:xe_devcoredump [xe]] Multiple hangs are occurring, but only the first snapshot was taken
[  359.962840] [IGT] xe_exec_basic: finished subtest once-userptr, FAIL
[  359.963049] [IGT] xe_exec_basic: exiting, ret=98


> /Thomas
> 
> 
> > +}
> > +
> > +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
> > +			     struct xe_vma *vma,
> >  			     struct xe_vm_pgtable_update_ops
> > *pt_update)
> >  {
> >  	struct xe_userptr_vma *uvma;
> > @@ -1215,9 +1286,6 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	uvma = to_userptr_vma(vma);
> >  	notifier_seq = uvma->userptr.notifier_seq;
> >  
> > -	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
> > -		return 0;
> > -
> >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> >  				     notifier_seq) &&
> >  	    !xe_pt_userptr_inject_eagain(uvma))
> > @@ -1226,6 +1294,8 @@ static int vma_check_userptr(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (xe_vm_in_fault_mode(vm)) {
> >  		return -EAGAIN;
> >  	} else {
> > +		long err;
> > +
> >  		spin_lock(&vm->userptr.invalidated_lock);
> >  		list_move_tail(&uvma->userptr.invalidate_link,
> >  			       &vm->userptr.invalidated);
> > @@ -1234,25 +1304,27 @@ static int vma_check_userptr(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> >  			struct dma_resv_iter cursor;
> >  			struct dma_fence *fence;
> > -			long err;
> >  
> >  			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
> >  					   
> > DMA_RESV_USAGE_BOOKKEEP);
> >  			dma_resv_for_each_fence_unlocked(&cursor,
> > fence)
> >  				dma_fence_enable_sw_signaling(fence)
> > ;
> >  			dma_resv_iter_end(&cursor);
> > -
> > -			err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > -						   
> > DMA_RESV_USAGE_BOOKKEEP,
> > -						    false,
> > MAX_SCHEDULE_TIMEOUT);
> > -			XE_WARN_ON(err <= 0);
> >  		}
> > +
> > +		err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > +					    DMA_RESV_USAGE_BOOKKEEP,
> > +					    false,
> > MAX_SCHEDULE_TIMEOUT);
> > +		XE_WARN_ON(err <= 0);
> > +
> > +		vma_convert_to_invalidation(tile, vma, pt_update);
> >  	}
> >  
> >  	return 0;
> >  }
> >  
> > -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> > +static int op_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
> > +			    struct xe_vma_op *op,
> >  			    struct xe_vm_pgtable_update_ops
> > *pt_update)
> >  {
> >  	int err = 0;
> > @@ -1264,18 +1336,21 @@ static int op_check_userptr(struct xe_vm *vm,
> > struct xe_vma_op *op,
> >  		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> >  			break;
> >  
> > -		err = vma_check_userptr(vm, op->map.vma, pt_update);
> > +		err = vma_check_userptr(tile, vm, op->map.vma,
> > pt_update);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  		if (op->remap.prev)
> > -			err = vma_check_userptr(vm, op->remap.prev,
> > pt_update);
> > +			err = vma_check_userptr(tile, vm, op-
> > >remap.prev,
> > +						pt_update);
> >  		if (!err && op->remap.next)
> > -			err = vma_check_userptr(vm, op->remap.next,
> > pt_update);
> > +			err = vma_check_userptr(tile, vm, op-
> > >remap.next,
> > +						pt_update);
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		err = vma_check_userptr(vm, gpuva_to_vma(op-
> > >base.prefetch.va),
> > +		err = vma_check_userptr(tile, vm,
> > +					gpuva_to_vma(op-
> > >base.prefetch.va),
> >  					pt_update);
> >  		break;
> >  	default:
> > @@ -1301,7 +1376,8 @@ static int xe_pt_userptr_pre_commit(struct
> > xe_migrate_pt_update *pt_update)
> >  	down_read(&vm->userptr.notifier_lock);
> >  
> >  	list_for_each_entry(op, &vops->list, link) {
> > -		err = op_check_userptr(vm, op, pt_update_ops);
> > +		err = op_check_userptr(&vm->xe->tiles[pt_update-
> > >tile_id],
> > +				       vm, op, pt_update_ops);
> >  		if (err) {
> >  			up_read(&vm->userptr.notifier_lock);
> >  			break;
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 384cc04de719..6f99ff2b8fce 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -29,7 +29,6 @@ struct xe_pt {
> >  	struct xe_bo *bo;
> >  	unsigned int level;
> >  	unsigned int num_live;
> > -	bool rebind;
> >  	bool is_compact;
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> >  	/** addr: Virtual address start address of the PT. */
> > @@ -52,6 +51,8 @@ struct xe_pt_ops {
> >  struct xe_pt_entry {
> >  	struct xe_pt *pt;
> >  	u64 pte;
> > +#define XE_PT_IS_LEAF	BIT(31)
> > +	unsigned int level;
> >  };
> >  
> >  struct xe_vm_pgtable_update {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ea2e287e6526..f90e5c92010c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> >  	}
> >  
> > -	up_write(&vm->userptr.notifier_lock);
> > -
> >  	/*
> >  	 * Preempt fences turn into schedule disables, pipeline
> > these.
> >  	 * Note that even in fault mode, we need to wait for binds
> > and
> > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> >  		XE_WARN_ON(err);
> >  	}
> >  
> > +	up_write(&vm->userptr.notifier_lock);
> > +
> >  	trace_xe_vma_userptr_invalidate_complete(vma);
> >  
> >  	return true;
> 
