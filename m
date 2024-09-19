Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CBCCF3962
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 18:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126D10E74D;
	Thu, 19 Sep 2024 18:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIVhljuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB0610E74D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726770687; x=1758306687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t4H4RSHlwTMRZY4qbB5N/v9DzsiYEdqe8DKvOoAMvWs=;
 b=eIVhljuEqoGgBtwAoQ5RC0PKuZgaxrBOXow+23ET227yn+SUC47y+4Zs
 cjLVtpzur87840XGWnmr6WxojA29uf7mvZ0OHnhBbgjUUriK8vYdr04Hz
 XrpHWGqMUPqKNGpEdvcV1+F5TllKvtVwxnbtVzDBMQ2sRC3G85W8nJd2c
 7xDFnw4DGWUYLrIqmjprjv9NzKHzm13aiC7gTlg78pNMjv2HPUy2bL5lI
 CFf3U7p7y7qweC1gyun8txSFqvJgANNghjHRl7/rTDRhZvzLpvl7AIlop
 pUX4OdtvNc5XH8kZ8MVhEwlkNBZEVNAKXW/oZyKb/WWcM6EXfwU9qBCRy g==;
X-CSE-ConnectionGUID: pHc09hoGQC+aMemFhnqUaA==
X-CSE-MsgGUID: 57dTlDIWR8uXvDCy+s5RdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43225616"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="43225616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 11:31:27 -0700
X-CSE-ConnectionGUID: HxCzBO1DTNKfEiVGhMWB+Q==
X-CSE-MsgGUID: t4NxkrV0R+atQ5RYOBCdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74809886"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 11:31:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 11:31:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 11:31:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 11:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuLRbNXnU9kVcCTlPzMPWFPgnWNiFduWfIIqtjdcLqWmLt/hA4B5IrT5xNikhg48m04ARzwrmK1dXu6W+3pog4eowcH4C2JzaSBL4DugdnnZ8dvZoJXG6cTVCX1p5w7RDlqy9PadZwKIqva8OoHx3VPfrFOTqufcULsvB9rVJy3rxZ7mxjpnlP5jcR7yMWCHGzSqcjXY1BNSDdVi4s1FncVPSKaceuH1JwRFyrOPFLyv1s47ivb+UZrakTj+gloZD8MI7IHD13qvHXMOR/m2zhaisu+0fMWdXasm6mmtsYhSLYb8/iue0QtGAkKpzKvTbJ/tzxYv8G+B+ouMbeuQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKXF7S/dR1tG2RybvKnrSmlMVREY5cWh7RCrbw3uhk8=;
 b=HAWNA86jbctzUurxPe5dLruhAOQeTq7zemUNvYvLRXpmoO83bDsiqD0GtRem32aiS/CJ6/Peeqhjt1TQlily0GDmpx4yGYUjUJd+9TdT22qZ58HI3RyRkQl+Xth2jlFB+u3eCrZAxg2vJL2pAx11UbVwJMGQ891UgQDkqVe38OSF5lWZQB0Ae2CWi6LHeeDiNh02nXFhrGNB016vZXz5GvwHWbohBwA2mVH2OHum0mJOk2WCCdrtH7VmBV9qGwZu8wwyGHFW4Pp/OJGVI01dMsZwGQRkryUGqqkYnSCnWfCYymn8eL5xMRdDMmLGZPMpKtYiO6teaTWm7YpcF/+4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 18:31:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 18:31:22 +0000
Date: Thu, 19 Sep 2024 18:29:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Message-ID: <ZuxtkHIpDWrhTlFx@DUT025-TGLU.fm.intel.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
 <ZuxHslDgHJem4LJT@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB31598BEA9375C5162EDA9C4792632@BYAPR11MB3159.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB31598BEA9375C5162EDA9C4792632@BYAPR11MB3159.namprd11.prod.outlook.com>
X-ClientProxiedBy: ROAP284CA0178.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:43::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c35881-5c1f-4526-ff81-08dcd8d942df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AZ9L5dXb1XlbdQh6WYKl4DtSEMLcTcz8172N2W9D1DMMgniIpGKcFzJ0tYpB?=
 =?us-ascii?Q?84Npp/F9467T3R6sVmFCzdUuH6ZlpAZ9rrZ0VMVEw/9t5JMnT0czRqfmeGKJ?=
 =?us-ascii?Q?coRx4ACYyxEQt07wkg/+itkfNeh+9GcEIZRTo+n5foZNQxa7wJWf63svHYR8?=
 =?us-ascii?Q?Pp7n1QUO06npTn4a3UfaoQla/tMdKip4n6xjcT2FyqYRCxiEmtwb2gEoTsJt?=
 =?us-ascii?Q?OksHRzF00GheZzqlvp2RjCgJgI58xBdaPieVdMm/9a4BVwLhrwrlL/zpdsN6?=
 =?us-ascii?Q?SFAWJ9n9IOv/qHUe7e8DVpXy7msVN8nEselQdQcTZ16YMJN3sIHms1k0lzkv?=
 =?us-ascii?Q?DMitVzgqhQPrWhlgZsy04bvLb2o2ubVcSMw2JheLuzjK1I/JkI0w09OSbQ9L?=
 =?us-ascii?Q?K9CvhETTv4H4P9ikRdbCpNKIx4yzvDGhFkEuNIR2re4ShCg6hwWpMp17O6oi?=
 =?us-ascii?Q?Ho/PrtDj1Fre7O6mQDVNEApN64slZ9ixm11/KO67QVrKGe1M2//79eX4wZle?=
 =?us-ascii?Q?w+rJUBf6yraXMt3PXK+37uL6MhKw5D2q59U4LsUC9CVhthsT8ts+Bo0ae1M9?=
 =?us-ascii?Q?YYgmSKqSJIaFK4mSpBmDMpzKN+vhz2mder4RF/S2YbztlrK7s4yVSFko+2ry?=
 =?us-ascii?Q?zje6anl8hUoC793lvuiOKvazz83hLxLZU39t0MN4IZHUVLfjMtOXgZblIG99?=
 =?us-ascii?Q?F7MJNBXpg43/9o/M2DL7omLGm1BYOxDtOBBd5X82jb2j52YcZX8YvPd2eNyv?=
 =?us-ascii?Q?KudJDt0IzN1R5Mup1ACZHGsX95HlIA5kv/fgooW2qTf8xMifk/5jnLV0fZRH?=
 =?us-ascii?Q?9MVFgEvNpygme26+PK7yh45BsqUCNhGoP7I1TvAMZACvU2YfPSDIjHbzmCln?=
 =?us-ascii?Q?ZoSB2KyUb9Mk0mG97XwPA/3DsEOtQOTDwdI0U3sYs/E2o6UmADV0gT19Foug?=
 =?us-ascii?Q?G69Hi8CBiAqhX5uBw1DPPzFD+fcsIEIBBrjO5soHm0u0eVIUQ9EghMXIQ8EC?=
 =?us-ascii?Q?CrjIYvIiNezVZhq4632uDeFjrg1rp3rAd/wHxT1Sv50aMip/M09wqeLg7Jz0?=
 =?us-ascii?Q?Y6rZfa7dNkX1iEx6oASmqo2oepfwNMWio52jU8Eio9Tn+loJ2FZ1awXv64hs?=
 =?us-ascii?Q?qd+VOapHJabUl7gYc0PiCGa2KYWQ6PE1yfhYYI0hWrl5xmMvP15bP0UpTegG?=
 =?us-ascii?Q?3OnK/CHLYpu+lt2W/OLMAdoXFPc2ItrqnAXTEriYVfga7Ws/KjOO/YoZXUAB?=
 =?us-ascii?Q?ddk5ZVU0fkWPrUjaJASU8JGB6Kk2UmgTqISsPwRbiZnzt6hhhYnk8ThYjZmm?=
 =?us-ascii?Q?Sq2KCoQCkj0UVHqUNM+ELKlaBKXlYfcJydFc1w/Ip+FVNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jBJOYrDRv5ADtcUa+rKrhlKB7E9cHzGSwYlyiadbBYPes4lu/z6cxxibJ1wG?=
 =?us-ascii?Q?OSHLjKL5R9I3rx3STg21WKl5jqLdP8jWaCP7YvjooN37L//l2kExjCeM0kIb?=
 =?us-ascii?Q?+wgx5gIg6ILFhAmC3Acoz+rulJFWyAOFXXuBJuUOwAA/+ZJfOkXELUJcwfVs?=
 =?us-ascii?Q?TR4O4TH+iMK9gAxoYkAGVJHoGMhL+dhJEep7hfiUVSSqUS3CY9DNWrz4oN1w?=
 =?us-ascii?Q?E/PdpisRYungRk76Id8pEaPDQAB8lrHoL7Tz0kEpE+RvW/CJBryTgYcfamI+?=
 =?us-ascii?Q?yUNeirATSQ5MeBscTy+4tL9ZHMrlZfIkeQ0nTSOXa5KkV46g9BZZ7AdWolRy?=
 =?us-ascii?Q?p1gtRpngwWBVK8IdjxEg0QZwfMi4CliCn9r9SQUXkxy0GbNlHkx+gP4e3KbV?=
 =?us-ascii?Q?vGI+8qe3O0nOhp3A1oMyca091ifDV9rG0Wa9J02CEGDgXO+/3Rkhw92VKYsd?=
 =?us-ascii?Q?y+QROKtN/K1USnSADkA+kFSCPWScgEugB8Oa4vX4wR5POENxBU725JZvnz8S?=
 =?us-ascii?Q?f2iaknpYfz4Lbs6k7wCmZLZljHs2dEBwJ1V+Hd/Uizpl1AVYbmF5i1aZ+kAq?=
 =?us-ascii?Q?jtkBElwdaHqNQz4fJmVFPPwcnq+rztsY41jq0UYp8cxecJkdgf+CaLj12kZm?=
 =?us-ascii?Q?fbAEHAhYR8nGya2oRVPeawFbZFI0ZWgKNa7Ifj3W7OE2lHnABAvt0vFNOrSN?=
 =?us-ascii?Q?W1xf9FpeIRxQjBfbE3Rtzmyk+tDt+Se7Qd+NtDZJ0PN9I+Ys7zNxV+gKh0QC?=
 =?us-ascii?Q?UO/ZW9dpO7WzZDnabBlLRn+07TBQ/dX/VAY1cb3X8Tqjy3tJeb6g35IJkFki?=
 =?us-ascii?Q?kQsIEm7+1uqsF2Qs6MQ7viNmx5/CzEIMdiDWvTHaSgGM25cX/uZnFCAntPXY?=
 =?us-ascii?Q?B7OjIwVDqAv06jlnHIIxMzOVTg572wXabQgw5nZ/wGoIyy9ASAB8X1PDI7OW?=
 =?us-ascii?Q?DjFck+WeckvhIUj+eafIacgAe5H9gzxSBzCXdnLHsTKHVC350sreGUmVNAom?=
 =?us-ascii?Q?OkC2M5ZSjLxAf5fp14Jt84rlh+7X5u50Ox2MVX77yaxfvWMKhVqZxE9XF8lY?=
 =?us-ascii?Q?EBHhXWP7JrMVeI0g4grTiMUsSEydXP1SqYSvNvnpEN90IcoTrRWiZpUIyVgu?=
 =?us-ascii?Q?ijIVjH/56ZmKGUGiWTFklxeYM/sArmwIGicFTRU/ZqupoWIvLWUY6EFOIlZV?=
 =?us-ascii?Q?MTw25T1GTkiq/+1rFgcNKZHXzEBoisNgDcspPeTvYMV+T9PlJlvbUxP1Dzrx?=
 =?us-ascii?Q?mBOcBIALEWsMaKj1zQcoHYxw3AA2eK8Hkdq77dkxoTu9TIQPuPHPa4Ea5/wH?=
 =?us-ascii?Q?j0f5N0Y0mFDQZuS7koCmd3sGxjVXAWSAv7yYxy/E1hnAvLRC9p2AhbTjongq?=
 =?us-ascii?Q?uGBz198atd48mbxgG8ubzZrJBbFaBxgvU3CgZsdnPKe1unsgNLGPgOUaX8QW?=
 =?us-ascii?Q?swIN/Rv6deWK2PAf/SVFVgvuuyqqQL5gCO8RCJiFWFMPXkqqp5DjCHUffhHK?=
 =?us-ascii?Q?UY55+0wCtkLQHOpPiZfKFIF38zd5VkzFcTk3RYxAvjCEGGTqlfVIs0S1hvef?=
 =?us-ascii?Q?Y5EHveg+49W5ssyMnIWjGdKknGV0pJUVI2i5/foTcpYuiFgI6zsKRkBSxUGT?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c35881-5c1f-4526-ff81-08dcd8d942df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:31:22.4455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQF6lKmM61m1s4hUrtQ/zZrIqKI085tkkVbpcnu1jDTKkfbXMpT3PC+zY6ghJa3h4D1stY3NBgmI+SEcpvJFvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
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

On Thu, Sep 19, 2024 at 10:32:31AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, September 19, 2024 11:48 AM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> > Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during
> > a map operation
> > 
> > On Thu, Sep 19, 2024 at 09:09:57AM -0600, Zeng, Oak wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Wednesday, September 18, 2024 2:38 PM
> > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> > > > Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range
> > during
> > > > a map operation
> > > >
> > > > On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:
> > > >
> > > > Please sent patches which touch common code to dri-devel.
> > > >
> > > > > Considder this example. Before a map operation, the gpuva
> > ranges
> > > > > in a vm looks like below:
> > > > >
> > > > >  VAs | start              | range              | end                | object             |
> > > > object offset
> > > > > ------------------------------------------------------------------------------
> > -----
> > > > --------------------------
> > > > >      | 0x0000000000000000 | 0x00007ffff5cd0000 |
> > 0x00007ffff5cd0000
> > > > | 0x0000000000000000 | 0x0000000000000000
> > > > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 |
> > 0x00007ffff5db7000
> > > > | 0x0000000000000000 | 0x0000000000000000
> > > > >
> > > > > Now user want to map range [0x00007ffff5cd0000 -
> > > > 0x00007ffff5cf0000).
> > > > > With existing codes, the range walking in
> > __drm_gpuvm_sm_map
> > > > won't
> > > > > find any range, so we end up a single map operation for range
> > > > > [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
> > > > >
> > > > >  VAs | start              | range              | end                | object             |
> > > > object offset
> > > > > ------------------------------------------------------------------------------
> > -----
> > > > --------------------------
> > > > >      | 0x0000000000000000 | 0x00007ffff5cd0000 |
> > 0x00007ffff5cd0000
> > > > | 0x0000000000000000 | 0x0000000000000000
> > > > >      | 0x00007ffff5cd0000 | 0x0000000000020000 |
> > 0x00007ffff5cf0000
> > > > | 0x0000000000000000 | 0x0000000000000000
> > > > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 |
> > 0x00007ffff5db7000
> > > > | 0x0000000000000000 | 0x0000000000000000
> > > > >
> > > > > The correct behavior is to merge those 3 ranges. So
> > > > __drm_gpuvm_sm_map
> > > >
> > > > Danilo - correct me if I'm wrong, but I believe early in gpuvm you
> > had
> > > > similar code to this which could optionally be used. I was of the
> > > > thinking Xe didn't want this behavior and eventually this behavior
> > was
> > > > ripped out prior to merging.
> > > >
> > > > > is slightly modified to handle this corner case. The walker is
> > changed
> > > > > to find the range just before or after the mapping request, and
> > > > merge
> > > > > adjacent ranges using unmap and map operations. with this
> > change,
> > > > the
> > > >
> > > > This would problematic in Xe for several reasons.
> > > >
> > > > 1. This would create a window in which previously valid mappings
> > are
> > > > unmapped by our bind code implementation which could result in
> > a
> > > > fault.
> > > > Remap operations can create a similar window but it is handled by
> > > > either
> > > > only unmapping the required range or using dma-resv slots to
> > close
> > > > this
> > > > window ensuring nothing is running on the GPU while valid
> > mappings
> > > > are
> > > > unmapped. A series of UNMAP, UNMAP, and MAP ops currently
> > > > doesn't detect
> > > > the problematic window. If we wanted to do something like this,
> > we'd
> > > > probably need to a new op like MERGE or something to help
> > detect
> > > > this
> > > > window.
> > > >
> > > > 2. Consider this case.
> > > >
> > > > 0x0000000000000000-0x00007ffff5cd0000 VMA[A]
> > > > 0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
> > > > 0x00007ffff5cd0000-0x0000000000020000 VMA[C]
> > > >
> > > > What is VMA[A], VMA[B], and VMA[C] are all setup with different
> > > > driver
> > > > specific implmentation properties (e.g. pat_index). These VMAs
> > > > cannot be
> > > > merged. GPUVM has no visablity to this. If we wanted to do this I
> > > > think
> > > > we'd need a gpuvm vfunc that calls into the driver to determine if
> > we
> > > > can merge VMAs.
> > >
> > > #1, #2 are all reasonable to me. Agree if we want this merge
> > behavior, more work is needed.
> > >
> > > >
> > > > 3. What is the ROI of this? Slightly reducing the VMA count?
> > Perhaps
> > > > allowing larger GPU is very specific corner cases? Give 1), 2) I'd say
> > > > just leave GPUVM as is rather than add this complexity and then
> > > > make all
> > > > driver use GPUVM absorb this behavior change.
> > >
> > > This patch is an old one in my back log. I roughly remember I ran into
> > a situation where there were two duplicated VMAs covering
> > > Same virtual address range are kept in gpuvm's RB-tree. One VMA
> > was actually already destroyed. This further caused issues as
> > > The destroyed VMA was found during a GPUVM RB-tree walk. This
> > triggered me to look into the gpuvm merge split logic and end
> > > Up with this patch. This patch did fix that issue.
> > >
> > 
> > If a destroyed VMA is in the RB tree that would be a big issue and
> > definitely would need to be fixed.
> > 
> > Adding a test case to show the issue you describe would be good.
> > Also if
> > we end doing something with merging adding a test case for the
> > description in the commit message would also be good.
> > 
> > > But I don't remember the details now. I need to go back to it to find
> > more details.
> > >
> > 
> > That would be good.
> > 
> > > From design perspective, I think merging adjacent contiguous
> > ranges is a cleaner design. Merging for some use cases (I am not sure
> > > We do merge for some cases, just guess from the function name
> > _sm_) but not merging for other use cases creates a design hole and
> > > Eventually such behavior can potentially mess things up. Maybe
> > xekmd today doesn't have such use cases, but people may run into
> > > Situation where they want a merge behavior.
> > >
> > 
> > I don't think Xe has a current use case, but the situation you describe
> > is very similar to a system allocator case where we would want
> > merging.
> > 
> > Simple example below.
> > 
> > Initital State:
> > VMA[A] 0x0000-0x0fff - System allocator VMA
> > VMA[B] 0x1000-0x1fff - BO binding VMA
> > VMA[C] 0x2000-0x2fff - System allocator VMA
> > 
> > User op:
> > Bind 0x1000-0x1fff to sytem allocator
> > 
> > Ideally we really want this final state:
> > VMA[D] 0x0000-0x2fff - System allocator VMA
> > 
> > The without merging like above as BO bindings are bound / unbound
> > the
> > system allocator space will get fragmented into lots of VMA which is
> > not
> > ideal.
> 
> Yes I observed the same when I ran system allocator. From one log I captured, I end up with below fragmented address space:
> 
> VAs | start              | range              | end                | object             | object offset
> -------------------------------------------------------------------------------------------------------------
>      | 0x0000000000000000 | 0x000000000044c000 | 0x000000000044c000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x000000000044c000 | 0x0000000000001000 | 0x000000000044d000 | 0x0000000000000000 | 0x000000000044c000
>      | 0x000000000044d000 | 0x0000000000002000 | 0x000000000044f000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x000000000044f000 | 0x0000000000001000 | 0x0000000000450000 | 0x0000000000000000 | 0x000000000044f000
>      | 0x0000000000450000 | 0x0000000000019000 | 0x0000000000469000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x0000000000469000 | 0x0000000000001000 | 0x000000000046a000 | 0x0000000000000000 | 0x0000000000469000
>      | 0x000000000046a000 | 0x000000000000f000 | 0x0000000000479000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x0000000000479000 | 0x0000000000001000 | 0x000000000047a000 | 0x0000000000000000 | 0x0000000000479000
>      | 0x000000000047a000 | 0x0000000000006000 | 0x0000000000480000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x0000000000480000 | 0x0000000000001000 | 0x0000000000481000 | 0x0000000000000000 | 0x0000000000480000
>      | 0x0000000000481000 | 0x0000000000011000 | 0x0000000000492000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x0000000000492000 | 0x0000000000001000 | 0x0000000000493000 | 0x0000000000000000 | 0x0000000000492000
>      | 0x0000000000493000 | 0x0000000000005000 | 0x0000000000498000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x0000000000498000 | 0x0000000000001000 | 0x0000000000499000 | 0x0000000000000000 | 0x0000000000498000
>      | 0x0000000000499000 | 0x0000000000001000 | 0x000000000049a000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x000000000049a000 | 0x0000000000001000 | 0x000000000049b000 | 0x0000000000000000 | 0x000000000049a000
>      | 0x000000000049b000 | 0x0000000000002000 | 0x000000000049d000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x000000000049d000 | 0x0000000000001000 | 0x000000000049e000 | 0x0000000000000000 | 0x000000000049d000
>      | 0x000000000049e000 | 0x0000000000010000 | 0x00000000004ae000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00000000004ae000 | 0x0000000000001000 | 0x00000000004af000 | 0x0000000000000000 | 0x00000000004ae000
>      | 0x00000000004af000 | 0x0000000000019000 | 0x00000000004c8000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00000000004c8000 | 0x0000000000001000 | 0x00000000004c9000 | 0x0000000000000000 | 0x00000000004c8000
>      | 0x00000000004c9000 | 0x0000000000036000 | 0x00000000004ff000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00000000004ff000 | 0x0000000000001000 | 0x0000000000500000 | 0x0000000000000000 | 0x00000000004ff000
>      | 0x0000000000500000 | 0x0000000000008000 | 0x0000000000508000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x0000000000508000 | 0x0000000000001000 | 0x0000000000509000 | 0x0000000000000000 | 0x0000000000508000
>      | 0x0000000000509000 | 0x0000000000015000 | 0x000000000051e000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x000000000051e000 | 0x0000000000001000 | 0x000000000051f000 | 0x0000000000000000 | 0x000000000051e000
>      | 0x000000000051f000 | 0x00007ffff58b1000 | 0x00007ffff5dd0000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00007ffff5dd0000 | 0x0000000000020000 | 0x00007ffff5df0000 | 0xff1100013e668400 | 0x0000000000000000
>      | 0x00007ffff5df0000 | 0x00ff80000a210000 | 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> 
> This list can go on if you run more test with single gpuvm. In a real world use case, this could be pretty bad.
> 

Agree this could get pretty bad on memory heavy app in real use case.

> 
> > 
> > So here 1) from my list is a non-issue as UNMAP system allocator
> > VMAs
> > don't interact with the hardware. 2) could still be an issue as VMA[A],
> > VMA[C] could have different caching or migration policies.
> > 
> > > If we decide only merge for some case but not for other cases, we
> > need a clear documentation of the behavior.
> > >
> > 
> > If this was added merging it likely would a be optional user controled
> > thing. I suggested a vfunc or something to test for merge condition,
> > we
> > could just use a user defined cookie attached to VMA that GPUVM
> > could
> > match on for merging (also could be used as enable merging if cookie
> > is
> > non-zero). That actually seems pretty clean.
> 
> This approach sounds good to me. 
> 
> This is a low priority thing to me. I have to deal with some higher priority thing now.
> I am open if other people want to continue this work, in which case I can help review
> And test it a bit. 
>

Agree it is a low priority as nothing is really broken rather perf could
degrade over time / memory footprint of the gpuvm will get larger over
time.

Also agree that fixing this in the gpuvm layer is probably the best
place so other drivers can make use of this too.

Matt
 
> Oak
> 
> 
> > 
> > Matt
> > 
> > > Oak
> > >
> > > >
> > > > Matt
> > > >
> > > > > end result of above example is as below:
> > > > >
> > > > >  VAs | start              | range              | end                | object             |
> > > > object offset
> > > > > ------------------------------------------------------------------------------
> > -----
> > > > --------------------------
> > > > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > > > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > > > >
> > > > > Even though this fixes a real problem, the codes looks a little
> > ugly.
> > > > > So I welcome any better fix or suggestion.
> > > > >
> > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_gpuvm.c | 62
> > > > +++++++++++++++++++++++++------------
> > > > >  1 file changed, 43 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > > index 4b6fcaea635e..51825c794bdc 100644
> > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct
> > > > drm_gpuvm *gpuvm,
> > > > >  {
> > > > >  	struct drm_gpuva *va, *next;
> > > > >  	u64 req_end = req_addr + req_range;
> > > > > +	u64 merged_req_addr = req_addr;
> > > > > +	u64 merged_req_end = req_end;
> > > > >  	int ret;
> > > > >
> > > > >  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr,
> > > > req_range)))
> > > > >  		return -EINVAL;
> > > > >
> > > > > -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > > > req_addr, req_end) {
> > > > > +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > > > req_addr - 1, req_end + 1) {
> > > > >  		struct drm_gem_object *obj = va->gem.obj;
> > > > >  		u64 offset = va->gem.offset;
> > > > >  		u64 addr = va->va.addr;
> > > > >  		u64 range = va->va.range;
> > > > >  		u64 end = addr + range;
> > > > > -		bool merge = !!va->gem.obj;
> > > > > +		bool merge;
> > > > >
> > > > >  		if (addr == req_addr) {
> > > > > -			merge &= obj == req_obj &&
> > > > > +			merge = obj == req_obj &&
> > > > >  				 offset == req_offset;
> > > > >
> > > > >  			if (end == req_end) {
> > > > >  				ret = op_unmap_cb(ops, priv, va,
> > > > merge);
> > > > >  				if (ret)
> > > > >  					return ret;
> > > > > -				break;
> > > > > +				continue;
> > > > >  			}
> > > > >
> > > > >  			if (end < req_end) {
> > > > > @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct
> > > > drm_gpuvm *gpuvm,
> > > > >  			};
> > > > >  			struct drm_gpuva_op_unmap u = { .va = va };
> > > > >
> > > > > -			merge &= obj == req_obj &&
> > > > > -				 offset + ls_range == req_offset;
> > > > > +			merge = (obj && obj == req_obj &&
> > > > > +				 offset + ls_range == req_offset) ||
> > > > > +				 (!obj && !req_obj);
> > > > >  			u.keep = merge;
> > > > >
> > > > >  			if (end == req_end) {
> > > > >  				ret = op_remap_cb(ops, priv, &p,
> > > > NULL, &u);
> > > > >  				if (ret)
> > > > >  					return ret;
> > > > > -				break;
> > > > > +				continue;
> > > > >  			}
> > > > >
> > > > >  			if (end < req_end) {
> > > > > -				ret = op_remap_cb(ops, priv, &p,
> > > > NULL, &u);
> > > > > -				if (ret)
> > > > > -					return ret;
> > > > > -				continue;
> > > > > +				if (end == req_addr) {
> > > > > +					if (merge) {
> > > > > +						ret =
> > > > op_unmap_cb(ops, priv, va, merge);
> > > > > +						if (ret)
> > > > > +							return ret;
> > > > > +						merged_req_addr =
> > > > addr;
> > > > > +						continue;
> > > > > +					}
> > > > > +				} else {
> > > > > +					ret = op_remap_cb(ops, priv,
> > > > &p, NULL, &u);
> > > > > +					if (ret)
> > > > > +						return ret;
> > > > > +					continue;
> > > > > +				}
> > > > >  			}
> > > > >
> > > > >  			if (end > req_end) {
> > > > > @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct
> > > > drm_gpuvm *gpuvm,
> > > > >  				break;
> > > > >  			}
> > > > >  		} else if (addr > req_addr) {
> > > > > -			merge &= obj == req_obj &&
> > > > > +			merge = (obj && obj == req_obj &&
> > > > >  				 offset == req_offset +
> > > > > -					   (addr - req_addr);
> > > > > +					   (addr - req_addr)) ||
> > > > > +				 (!obj && !req_obj);
> > > > >
> > > > >  			if (end == req_end) {
> > > > >  				ret = op_unmap_cb(ops, priv, va,
> > > > merge);
> > > > >  				if (ret)
> > > > >  					return ret;
> > > > > -				break;
> > > > > +				continue;
> > > > >  			}
> > > > >
> > > > >  			if (end < req_end) {
> > > > > @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct
> > > > drm_gpuvm *gpuvm,
> > > > >  					.keep = merge,
> > > > >  				};
> > > > >
> > > > > -				ret = op_remap_cb(ops, priv, NULL,
> > > > &n, &u);
> > > > > -				if (ret)
> > > > > -					return ret;
> > > > > -				break;
> > > > > +				if (addr == req_end) {
> > > > > +					if (merge) {
> > > > > +						ret =
> > > > op_unmap_cb(ops, priv, va, merge);
> > > > > +						if (ret)
> > > > > +							return ret;
> > > > > +						merged_req_end =
> > > > end;
> > > > > +						break;
> > > > > +					}
> > > > > +				} else {
> > > > > +					ret = op_remap_cb(ops, priv,
> > > > NULL, &n, &u);
> > > > > +					if (ret)
> > > > > +						return ret;
> > > > > +					break;
> > > > > +				}
> > > > >  			}
> > > > >  		}
> > > > >  	}
> > > > >
> > > > >  	return op_map_cb(ops, priv,
> > > > > -			 req_addr, req_range,
> > > > > +			 merged_req_addr, merged_req_end -
> > > > merged_req_addr,
> > > > >  			 req_obj, req_offset);
> > > > >  }
> > > > >
> > > > > --
> > > > > 2.26.3
> > > > >
