Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ED4C2BB85
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 16:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBC610E734;
	Tue, 18 Jun 2024 16:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuLGXMRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1810E73E
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718729010; x=1750265010;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YDyY5bHdkePaXYJc8c85NbDZuYf6mCbqM7A6kV3Yy28=;
 b=IuLGXMRrR19I6fESrv+cE8GhGabwbg+r1rWKbNxwPz54Rj+s2qA7tYGI
 +PGEa3PvkoJsFp6bJ0UD+YSXVNPcM9kvFII9WGJAaWYY3Tdv2lTe7gfMn
 RzeFHJOd8dZ2PlUrAR8s8lZJ5+btmGkB2S5+cqzF6YRPuKcE1bPoKlgTi
 QOZ2MJFxBFel6/9fwF4IS3Sgp0eDsBScSuWt0NFl344GyUJa8eNgeu+/F
 g87alDWatOlrKBSy8NZ+r7qM5z4B13OKg44TgycIb0Gd1pfsKuQ2OVL6k
 PYlRI2xs39DrleaMMr04+qLnR0oI9hsZm158hmQl0qXekIJxNeNQucVgR g==;
X-CSE-ConnectionGUID: XHFkfVrUSKexGKbqNctVuQ==
X-CSE-MsgGUID: fZ0FOu+fQY6MMcF1P25/fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19447394"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19447394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 09:43:30 -0700
X-CSE-ConnectionGUID: p+blWX+rQF+DIwSRopsFSw==
X-CSE-MsgGUID: 7ERrScPKTEiqUDLSYEpozw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46576917"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 09:43:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:43:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 09:43:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 09:43:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 09:43:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KImNZ3GUiVzvSX/fklR60VNVR4ouZtxyquIIRwk7n28kf33PReakmvxAvgwCSiGb1UrYrHMJu7ktI28U5iG+K3RrRwYjQPbXh191nc4fJf5oQ49NwVb/AoXKRwlDwDzxMo8r2rvl9KWo8JVeO+eo8/y6R4eMqSLSh9liSFCQ7s8IxUEjCtdhjmz84Ls8qoqLJZzYJU7D9k1ajav3JYwPxH7LMsCFXnmQ9Fk+Vyy0uD0tpOJJQt/9zOngiNhaU2PaULrtkgDIzsgPE/53QdxRnN/vV8Onx1zxYdBw3bX6SVMtKNBFIyKQ5vpco7Bw4L8HzYpFZLbUAh+5n1HLbGooPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxbNLgZSV1hk8jQOGe+GP7uM72T+5qu7okilP60a0Ds=;
 b=MzuegSwxVIpK+/wg8XxzSaXbJ7PF9Fxd5Z3klCepH1mXGSLdjQZcfA0LCbvZ/lwkxMZn3azmUrTKugTETXL1TUyhjMhPbkGb1bSE8zrnLGIwLwjaxPmU6hCsA0nrpdwjRhV68w7vCrH1jazY0vF6qj0ptb7SpAVa3QKxUd5kCvSEOhQ8vYrM4mwxZrB0UtHljG+/ae8xld0PzhrrU/1I0RhL09mmVEs6fEmL5cw66nHmSk+woxTObw0aLsWBXaxoKn0KD6BZN/r+uKc0ODPRuCdYlZOuhqNfaQLLvXJbLMDMcdhdac+4hZHnbjSluX6X4cgdGk8t3j8vqVmh05Nheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Tue, 18 Jun
 2024 16:43:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:43:26 +0000
Date: Tue, 18 Jun 2024 09:43:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Pallavi Mishra <pallavi.mishra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
Message-ID: <20240618164323.GN2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
 <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
 <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
 <9c3ee93c4f5fffa5d5dd61ea71066fa231ab3ec5.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c3ee93c4f5fffa5d5dd61ea71066fa231ab3ec5.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: c80279ad-3498-49a9-4c16-08dc8fb5c666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HAekwEit8A3t5WIc2jjxeCQNC/qemP/HThmynY+50mRTBec8cbg3ogfZCR?=
 =?iso-8859-1?Q?AN7g3UHLQEF0EZLB55Ld2op0FhN3b1IDYzyr8dnxGUsYYrwmxuS8KMEAHl?=
 =?iso-8859-1?Q?93a+R5zCKp1UzJAeMEGSgFyjwF6fzDet4cC3YIBZPqR4nWTADOvKEnjr3S?=
 =?iso-8859-1?Q?kob6N3uTG3LslkB7+5CLMBkqDg+03xdCVKriicO67t7fbBRGP5h4KZrHRI?=
 =?iso-8859-1?Q?5M57LM57aXW+9jwwbbZM6VadSngkUi8ksorgyfkfpbPWkLqhelDAca1nZq?=
 =?iso-8859-1?Q?4g1lc7Fqq2HafD8GRgU2SRH0SH0YYgep2rEny3Pcy/flCBWga0n3pMfjs8?=
 =?iso-8859-1?Q?S9hqJchBZo6YBEDCdGRW4DsN5oVTS9eoqwXjn3XUpbs98p32vkesb9An5m?=
 =?iso-8859-1?Q?V8ARKTxuA2dUC17MbRU1dsoYFmhKKgMNPM4ewANzMFVMjmbiNpFZOORTCF?=
 =?iso-8859-1?Q?NlpLpP5+YN3DOUtxeSBfOQ2C6Mhif1lXQlKUKoiqYnu+MXd8SgkjljtXu8?=
 =?iso-8859-1?Q?iJwt0DMre5Ar6u+a0DIrmAV8VWk0ENBxosIvR9ak87loy5xsqRP/auRNwW?=
 =?iso-8859-1?Q?CdthG5jIXud7O+L2f2U9y0KRLyHbYyJUV0aho/HBiI9DY7JOBrkEWzNWWe?=
 =?iso-8859-1?Q?mnZ0JrKjT7mvuF/AH+pXPp4bfNJqgZLscqMhe3cA0qzHzwbh/MMNcg+qzu?=
 =?iso-8859-1?Q?Od4HCo4fZQXTZpXY4r+mbAhkRlyG7dx0weYw8V8XMK3VpitLdvuymXUGwS?=
 =?iso-8859-1?Q?xgwnScnnjwour4kFxjEgUVAs4aLbYLRfXWSj+B7CIIlLTfBUPMqG/7JOh7?=
 =?iso-8859-1?Q?QWOHdar/Jq5FWFPmgmBxgoPvK/fNtlmAS2T1EqhGAw65o/cJwBwrDpazxp?=
 =?iso-8859-1?Q?yu9EX14JnHBPoYkVP1sY7Bnp4fkmsSvYFdGUuxufVue0e1SlirMBu0V9Gm?=
 =?iso-8859-1?Q?moeGFx0eb9P4GlwRPs32ulecDrfjxc1gafjGFNaZmkt6Md001zpvQRrxtK?=
 =?iso-8859-1?Q?Km/wOO1t9kQYYu9x2fbAs6N2x9lXrNXaollPR+T73wS9prAs+hw0FheDMs?=
 =?iso-8859-1?Q?yITRU6ZrzQFkJ60YXFcrpIHxCjilO/cH0Kxmz2clGls5d2UH7PQ/ljml07?=
 =?iso-8859-1?Q?KmL4ZGEBuweDdfKfA69c9ZytsXTm4rPV9hdi+oXwWZLsqSa4F0lEI0B1Mz?=
 =?iso-8859-1?Q?GGD6zMZoxG+ouaEjm3EAk7Kjdr1XtK4toyR5JPH4EnEynLNhf7lgGoTcV8?=
 =?iso-8859-1?Q?NpfFSQEGjjoXpQnH1XDvuicetGkV4lEXuQk4g01J+L9QO1TbFLqOzEs07m?=
 =?iso-8859-1?Q?Ngv4giXQs2JfvAUR535jqx+ZWRqpPR3wwId2fq97lUsiI2pZtkl+Kp9u21?=
 =?iso-8859-1?Q?j2Oh6O91RH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xgqi1/+jBhlijxVNf6cHa82BNk2rcblP65G/ilbVk9vnJobsTBgJqUiBCX?=
 =?iso-8859-1?Q?2x6hNbgsWVsPpg0OcQboSHijHIXYw8YB8RvXokkSUV1vDQmSXSepw1ECFT?=
 =?iso-8859-1?Q?KooFdpJMaPDPTxlLxQOJ97yYDwReVtdtXtdcnmkjyE0/tNuAL2/TZdPS9e?=
 =?iso-8859-1?Q?O/ic5mgJLf+BW9q6bWKAOlrqgsHy2/zcUCUkEPBLw4i1iftQkVJkFDr+uO?=
 =?iso-8859-1?Q?ELxkItWQAaLYjOgBgK+5FOHmEmX9g7vY6B3ybDBvgTEfkzmOlytnoQ1v2L?=
 =?iso-8859-1?Q?hE95uWhV1jaQ9miV9M/p6gt7W2yS6JdeJuKK9xm9wTK136qzLVuNi0uRZc?=
 =?iso-8859-1?Q?iXi9KTMzFz6FHY92WGQI6TsPnLuoQKr82sDmXs62UQtCgNUJmbQeDKyO3h?=
 =?iso-8859-1?Q?qgX4yqYGKHiB0VeQ17Amu3WTgxpuzGOBUioxfBt8/ryzABEPorWNOBTJs1?=
 =?iso-8859-1?Q?Poq7yPLhmMnm4aeuNM0YbUSe3Zv/xKxVZ/YcALU1JNytXzZBYRGSaHIN68?=
 =?iso-8859-1?Q?ISkVBnFvvWO7YnnkHAJEBaH1331M2oIOiDIAYzSQZ8e/9bppf4oQAh0FOg?=
 =?iso-8859-1?Q?Qo3WzfBttI6pUywIlu7UrwaKnLaKuQwVg3uoc1eo2gZlymESEBtP4RBELW?=
 =?iso-8859-1?Q?wK8KpBXFScS/eVDchjLS0JbprmldsdApNNWJXj5mjm+4j22jeMSOU5Qibw?=
 =?iso-8859-1?Q?B1Q6URtcZyzG8Mv1rpjSyU4EBPH4J0EuDsb1VeuFz6BZ9BRzCEZiTbHq9+?=
 =?iso-8859-1?Q?Ax8LtU6eg8rPuvRU+YLg5l2TJQgOaOYeH7raNCKMqKK/1GwBSbnlaI+oIy?=
 =?iso-8859-1?Q?dGSTzcRFuAtM5PMlS3TtrjvY4jlmubHIPQP6caJVqthZzT3DZwLhhrTOf0?=
 =?iso-8859-1?Q?UxLzsHN0iTHg6ihiyoBKF10YwZ2m9WSP5YLLlzzRFhLZ3ZUVL0Rpj9wseZ?=
 =?iso-8859-1?Q?YxAQob0U+Xp0jssQ43UCF5+rQHn94RjvZ7CB20PR+c7K10UiI1HeKYHpR/?=
 =?iso-8859-1?Q?ez8I3pMyYVc9gsGGavR/bz4VvWvMkxXnL/gdKfwPMJD3Qz0STigQnEPBKG?=
 =?iso-8859-1?Q?DTICWtRNvNotUuyCkHtNlpf+FbOj2LxwSlZkwCRNNURsV5GJp0wpDon9pi?=
 =?iso-8859-1?Q?C38fNcfKaAOB3Ntx5b6hC07StrlIuYQoNcs64Sy/vOEWuKPTKr09RW4KVb?=
 =?iso-8859-1?Q?TgYHMHfyRFiSxGNVsAugJmE4iaZYZpEGvnJS1I0Dy8hS4wyeBvKxXzinV2?=
 =?iso-8859-1?Q?SUKrvQa2DCUyjilvqHADK4/vEqYjxk2d7hEwxPcEWKBwH51GuSGaaYBEKF?=
 =?iso-8859-1?Q?vVUkOvf4HvUvm4zTncjzTRbMeTFRaqTABY7bbkOfYvy6aNxd8E58R4HJdc?=
 =?iso-8859-1?Q?TvcxGJpRvWGGb5yMoDfizyA3v++aWcpWy9n27WrzXhSycHAFLxQeoONQLz?=
 =?iso-8859-1?Q?psw1E69USJpf2w2bpihbvmi3U6YaTHDhOAz4oOUtboTxegBMeLmvtUpRVo?=
 =?iso-8859-1?Q?B/8NLuuTQB7oUbi1nT40tSX+IcYHfkq23SacFo8t7FKvpBIGSOPd6jSDau?=
 =?iso-8859-1?Q?4WpCqLCxCSg9ZdAL/vYUBkvToeubGD08fVNdOQ12sFlYb9c6uDP/cUNzHJ?=
 =?iso-8859-1?Q?Hn4+yJxmO9qH1e466iBa6x3Q1r9mUCOjUmJRGWmd3uSprMyEhE95J5IQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c80279ad-3498-49a9-4c16-08dc8fb5c666
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:43:26.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bhgedj60tZArNXusoEkP4F8esp5baKvlbi2xR8Lt7DU4lOlIq5FIXU13hhhC/ENqI+m+X85L6Xyq81LPGLJ933j94nz/BdB0OW0IWAblgAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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

On Tue, Jun 18, 2024 at 02:38:01PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On Mon, 2024-06-17 at 13:28 -0700, Matt Roper wrote:
> > On Wed, Jun 12, 2024 at 08:03:24PM +0200, Michal Wajdeczko wrote:
> > > Hi Thomas,
> > > 
> > > On 11.06.2024 14:47, Thomas Hellström wrote:
> > > > Hi, Michal,
> > > > 
> > > > On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
> > > > > We should honor requested uncached mode also at the TTM layer.
> > > > > Otherwise, we risk losing updates to the memory based
> > > > > interrupts
> > > > > source or status vectors, as those require uncached memory.
> > > > > 
> > > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_bo.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > index 2bae01ce4e5b..2573cc118f29 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > @@ -378,6 +378,9 @@ static struct ttm_tt
> > > > > *xe_ttm_tt_create(struct
> > > > > ttm_buffer_object *ttm_bo,
> > > > >  	    (xe->info.graphics_verx100 >= 1270 && bo->flags &
> > > > > XE_BO_FLAG_PAGETABLE))
> > > > >  		caching = ttm_write_combined;
> > > > >  
> > > > > +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
> > > > > +		caching = ttm_uncached;
> > > > > +
> > > > >  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > > > > caching,
> > > > > extra_pages);
> > > > >  	if (err) {
> > > > >  		kfree(tt);
> > > > 
> > > > To me the preferred method is to teach bo->cpu_caching about the
> > > > uncached mode and then include it in the switch statement above.
> > > > 
> > > 
> > > but bo->cpu_caching is currently documented as:
> > > 
> > > /**
> > >  * @cpu_caching: CPU caching mode. Currently only used for
> > > userspace
> > >  * objects.
> > >  */
> > > 
> > > and value 0 is implicitly reserved as kind of default, so
> > > 'teaching'
> > > would likely mean either extending uapi with something like:
> > > 
> > >   #define DRM_XE_GEM_CPU_CACHING_WB                      1
> > >   #define DRM_XE_GEM_CPU_CACHING_WC                      2
> > > + #define DRM_XE_GEM_CPU_CACHING_UC                      3
> > > 
> > > which will introduce lot of undesired right now code changes, or we
> > > will
> > > introduce internal only flag:
> > > 
> > > + #define XE_CPU_CACHING_UC                      ((u16)~0)
> > > 
> > > but that doesn't look like a clean solution.
> > > 
> > > 
> > > OTOH, just above this new diff chunk, there is already a code that
> > > updates caching mode outside the "switch statement above":
> > > 
> > > 	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT)
> > > ||
> > > 	    (xe->info.graphics_verx100 >= 1270 &&
> > > 	     bo->flags & XE_BO_FLAG_PAGETABLE))
> > > 		caching = ttm_write_combined;
> > > 
> > > so maybe as a short term solution we can keep this patch as it's
> > > doing
> > > similar last resort stuff and return to 'preferred way' later:
> > > 
> > > 	if (!bo->cpu_caching && bo->flags & XE_BO_FLAG_NEEDS_UC)
> > > 		caching = ttm_uncached;
> > 
> > Yeah, cpu_caching is a "uapi only" thing at the moment (and even then
> > is
> > only set in some situations).  Given the current design and
> > assumptions
> > of the code, maybe it would be more clear to add an assertion like
> > this
> > to help document why this is special?
> > 
> >         if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
> >                 /*
> >                  * Valid only for internally-created buffers only,
> > for
> >                  * which cpu_caching is never initialized.
> >                  */
> >                 xe_assert(xe, bo->cpu_caching == 0);
> >                 caching = ttm_uncached;
> >         }
> > 
> > If we decide we want a more general redesign of cpu_caching behavior,
> > that would probably be a separate change from the direct functional
> > fix
> > here.
> 
> I do think the change should have actually been done before the scanout
> caching hack. We shouldn't be building special cases like this, but
> rather fix what's missing.

I think things happened the other way around.  The scanout caching
adjustment pre-dates the existence of bo->cpu_caching in the driver.
When bo->cpu_caching got added in commit 622f709ca629 ("drm/xe/uapi: Add
support for CPU caching mode"), it intentionally left kernel objects set
to 0 by design.

We can certainly change the design now if everyone agrees that it makes
the code cleaner, but I think that the general refactoring and
repurposing of bo->cpu_caching is orthogonal to the functional fix that
Michal is providing here.

+Cc Pallavi, Matt Auld as the authors of the original design in case
they have any thoughts on extending the usage of bo->cpu_caching.


Matt

> 
> Can't we make bo->cpu_caching valid also for kernel bos with a new enum
> and do the translation in the ioctl?
> 
> /Thomas
> 
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Michal
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
