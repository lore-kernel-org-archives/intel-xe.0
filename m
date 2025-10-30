Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C9CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 12:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8EB10E261;
	Thu, 30 Oct 2025 12:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGtZl8Br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7E910E261
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761828848; x=1793364848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+LprB97dSeqNGLKcYd7lEZKGdNZ5vFrcQX3ezJi8rf8=;
 b=OGtZl8Bru9tYZx+f+VIRnSBRShUmXAvzluHfd0p/hANoCla9o5HXzoXX
 0MOijBfpXC0eqR6yFWTe8oW5JEdERejlhIoOy18cgqFKm0O+f8+3W3HgJ
 h6neYPYurqBnScQx7NTLOxU0gC+ykdpeoxbxtmWVctxe88lwxHp6TWHzw
 vnD6a4hOfZAoROydm3C4X6vKMv2DiUlWjQfEcWf3pfE2w/MZCJ3yAcqpP
 +Ng5qluuwqsUEJ5KPUAbouO6MeRsu7W9jRHXeDVlXDXIMjaniPL1QQ6QD
 alnUPZnPJMjg+9HjrcKCSuZgXBC6jRuj3DUzrIJGABVJtSHbzGKGKmtKy Q==;
X-CSE-ConnectionGUID: t9D9hMmuT26sZCCL4RN3FA==
X-CSE-MsgGUID: 2NM3EGS1S9mS2eszEhYR+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75316281"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="75316281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:54:07 -0700
X-CSE-ConnectionGUID: D2wuCiXRRyWCZgGfSOMP0Q==
X-CSE-MsgGUID: PGwU3ESFQd+GOJgbiZ927A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="209526287"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:54:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 05:54:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 05:54:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 05:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSSSySbC1AL9prVqvuRNhMaRHx3p8lNqCzDa1XFpo6fa6wgQtGq4BqSzHb54iES9IoWsgi0yKM/rWOlZLrw+fa+fd8/xEonpmdiy5MKAojVu7Y71ClJ5v+6UFMeAP2+vk1tqVpJQRGzwAHWQ6w3SpBxGYDgn/Q8MnuNeJCIcp6GyOeEmcP4tpmMI00qyzUCnJWKSeI0peKhOIDLD8rnHMB5mPzDeq5h2+yRfqOosgQOM0PvKiCDM8zwcalZ7lp2J13Jzw9ULcnSXEoyrHtr1b70WnR/PQczen44Mh1B16jVBa767sXKpPAkmyOC8gRtoPxkhxf0i4GgLj/QOTEuodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE/EDqxjBTB553H5/6jFQgCfokxbx23hmXZsyRRn6Qw=;
 b=izeKH5Y99ThkBIjjtg3YJcENFzG4dTFJly8j636LM0bfe1cffTFbBB0PCoe9z8gkx1aI+KKM5Bs9InAtuTTBrXnOltIPiPQxgjoq2GNm+Ren+iHu3jcvD+VlQvsrvm5525hE8FuCvt8es7AUGIr2E6NcUdLKA8Ye27J3Gsv/YNAG/m5OFWuGzsLixEsQOAPPT6RS+zD+ld9nbpHoJ/fEq/imivA1UmgbBq2PF21QhieNGO2oIE8PvT2l0E5uCkst2S/YbCtPzRzOWpQPcGF0FaoQYEcTcoGmdQUH0BTjb4hBHsxv0aQCCWl1Db2bfkXktpod1hm3IL6iaQoUbTy9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 12:54:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Thu, 30 Oct 2025
 12:54:04 +0000
Date: Thu, 30 Oct 2025 05:54:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/6] drm/xe: Enforce correct user fence signaling
 order using drm_syncobjs
Message-ID: <aQNf6qkmh8WSkFbo@lstrano-desk.jf.intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
 <20251029205719.2746501-2-matthew.brost@intel.com>
 <f647296ae0d8150745852b439da169529aa47e4d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f647296ae0d8150745852b439da169529aa47e4d.camel@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 203b3fac-77af-4b90-db25-08de17b36800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?UfMdxirD+pFTIu4EoeAZbxn9hJ717qXEQfBb7ink0uRQqkH5bDHT8p3W3C?=
 =?iso-8859-1?Q?YItj9hLJ1o9uytyFurlvtZV7THeymJz+35x/MSTpddXgcuxp2Boa4tQ+34?=
 =?iso-8859-1?Q?A6TSqx3OK6wdJCVriYkKp/+iImEIOF9YasdO0256iEVCwy1gnroPBsP04A?=
 =?iso-8859-1?Q?t5B712PJmQPI/jN75c1pzWzzsdYzkv5OFmi6nEPJCWkNf3p5xUm3xfhS/b?=
 =?iso-8859-1?Q?/YL3YeAd+kV8UpYxyxsUdv9bUxbPlC56HX4TISy5mznfUGtzmTuautEsGH?=
 =?iso-8859-1?Q?kSQJRfThuwhorz4sLJFpx8zGeMLTv2lkSTbyWvWhjCEP82Q22YD9tNI/JM?=
 =?iso-8859-1?Q?fEE0dTpbpA840oItz4ce6GyikVE5DLzsMsxp+sIFaig8LDnpOU9jzhehSY?=
 =?iso-8859-1?Q?7YFJLZJpp2QoJYyJWqCI1Fjv0MOhwBjbzMS/4AUyF4I6G/gN1sULK8U07k?=
 =?iso-8859-1?Q?P/CL9szTfyXaN9ATZfVEwh2RvYT4a8/6SncTCjSy1UVd2VIy5FKTP6gygn?=
 =?iso-8859-1?Q?+fmE2SLvgW55BQ0UBajs3mzMgb6HSUF8xBtm2gWpxyO8NjCPgil0GKvc3r?=
 =?iso-8859-1?Q?sDtp0+M2As7O/E2/8nttAfwWV0sdzyjistV045wqEixtuOMNaHDGsfOmFw?=
 =?iso-8859-1?Q?S/fzfHXOjsRaj9YS0sbda6C64Lanc3U4gZwSS3fRdkj14iOKSdkKjEIWhv?=
 =?iso-8859-1?Q?vyqjfbrqcLbRFdl1kyfJoU8MHUVtA9z2vxxDCT3UDFkJ027sf6KNZ1DSnC?=
 =?iso-8859-1?Q?gqZd1hfoF8eogGzHJ9UYTNRTAKvi7CKLVPdZr3tFYprL3gmBgYuvn0B/2L?=
 =?iso-8859-1?Q?X7H8WugWU5tOkGXhqwybXEZ2P8PwNFuxQ2hy3Ud6bFi8YbDXS2hhl5iN8k?=
 =?iso-8859-1?Q?l1FH5bPv4F9t+6q51xtdAE7biEMdG/kNP8X5kK93LRYcsFtqyLCfLySWP2?=
 =?iso-8859-1?Q?yQm4Ofa/UId/+zYqtEeedAKxoEP2gzbQ2gC3SYoz/3fv/ig80LjM5wd/Od?=
 =?iso-8859-1?Q?yoLmDvDvSP2wQK+IjY+2591iw+c3gXQuZlPlNo4x6YDOSruRM5zAiXCyGL?=
 =?iso-8859-1?Q?/IzvUmz2Zfp7RCeH3s2nwfet09siRzwqhfBmzold1sEPK7G36sQvepiQsm?=
 =?iso-8859-1?Q?8/194LwxNHfKLtcDmJ86Ghr61jh4tqj3dRJlpGMifgpXGZgN6XZcoQBV7j?=
 =?iso-8859-1?Q?aSZJtiwNJkyv7Ss/sFV4NoDjJ8dkgR7AWRZLBuP9euZ/TCKG5l0JanO/oh?=
 =?iso-8859-1?Q?faFQiVUFBh4e7z2q5qqCWXBX+brnUqYvGbkw88XxfPX4maG37QgRJl31Mz?=
 =?iso-8859-1?Q?MjCMl8zFXjbRe5dkiaYoRvOKDeRvlVwJ2FXLPYZ1hm5PITAmMIQdzvto7Z?=
 =?iso-8859-1?Q?MC2g6tPugqei3biZd2WPrTLde8gMmtHqP8MtkOi9t2oyz644V+oajin2lC?=
 =?iso-8859-1?Q?isqg3tlzSgD7b9baDRG0jRjJmxe3GSRK91aE6rihpD/BZUcKB94BZEG4Tr?=
 =?iso-8859-1?Q?/NWqTLOHHqHJcAHZgAy1ph?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?l7DJnoCSKKyhhLV1Uz0vLCLz6eGED8Np/ItMr8yo3KytpVZyIbUmXNh2w/?=
 =?iso-8859-1?Q?yLXn0PNpRRD7kuQzbUhiFC7igqesXmnL5OAFWdYNrG51bdm/G73B+vEWYX?=
 =?iso-8859-1?Q?0CcDyj+C0XtvCCmjFo410eTaMvFgCWnswQWSHte665X7JF9hwELqFaOrR1?=
 =?iso-8859-1?Q?0BUc7Tz8I7o8SeHrJAOlCEYV8D5SgJDMVahyQ0yn59NYA7r4yaDoo72o8h?=
 =?iso-8859-1?Q?V/dwR/SWFVNU00JjdghU+t03GSi6t0gPVcwVeSdET/n+fNx+Kip4xJzPM6?=
 =?iso-8859-1?Q?/gcKTNGoQKpZak4l0L2L4RSqD4BgwoTkB1AR8bbZEY3dmvXhUpsRlWCATz?=
 =?iso-8859-1?Q?K2KaM0shy2tD/U8rq/w52f9Z3FHHz7lUB6Mb2fYvRjNWfazvn/PQklv8ov?=
 =?iso-8859-1?Q?m3S1Xt2DIG8lq17VoYddGTOw/wxoYT7Ybri56nH9Exub8KJbe8CGA7A7Lr?=
 =?iso-8859-1?Q?przYDeTYqIkqyrp+w2GkYMQSNVocJxVYlOCks3/1OiAV3irD50JlYkHn7D?=
 =?iso-8859-1?Q?sb52QofqDsC0FSA1gRd0dO2lhe9LITCLThzouNSpfADoPvBbVmIO57CzQv?=
 =?iso-8859-1?Q?1+klG+wgjz73M9n7aFqq7rHH85zRHINn0AIBBVftcFw5QMdw/nl9+xmHNo?=
 =?iso-8859-1?Q?gI1gCL+A5FfFp4vKTDrgi1oGB8ZALzfnpZcb9elExTUFceEBnhruOBXuQk?=
 =?iso-8859-1?Q?glU7dRAYSL6U5BDoQ58TqEE2xef9fgxbAmLx9P+ke64NcpVejyI8s7uNWJ?=
 =?iso-8859-1?Q?L/QKhIv6VDxFEVEWuX4uSN41i3cjlehbsIx++ers7+0Jvllm99xtHsMvNx?=
 =?iso-8859-1?Q?j86NlyxJ22tcKKItoMwMgfPvGyftPtosqkJtrhKQfoMPAf/xOPETTOTFM9?=
 =?iso-8859-1?Q?dIC8qgN0c0S+rqSgo+TXvx5jT/8cuqOSFvh2Tm1+X9ENQ5jV3d+NahQD8Q?=
 =?iso-8859-1?Q?N+jx41CXnEhW9jqFrsNcUbvEQOPGfXkovNlT9diZDkrRtVhP8FEyidgxCz?=
 =?iso-8859-1?Q?XJIXg+ZZuPB2PuJJrBUTqYJl2dbpxNTwf7hKtfaSkyU/v3UcjBrEg7ljuY?=
 =?iso-8859-1?Q?tYH9Y080EbHAWKEUJ1q1POTCMwuMkcxuD9+E73NfWyb5BgiJuZG2YN1YSc?=
 =?iso-8859-1?Q?0Pvh5NlFN+CGRHB0OaSv+laE/K5Rnzf5FDOm+xp2dd5rkgaIUa1bt0dPPb?=
 =?iso-8859-1?Q?k3VsLjD2qFvlnnSJDoCQ409m/WhyYITpxLtI2TXIKX/y96A/sxC90O4UqB?=
 =?iso-8859-1?Q?9Omv+gmCcjZRMHTE8RUkhb1uwqn3GFrn2IXkGBuKk5CmiidEofQ9K0s5rH?=
 =?iso-8859-1?Q?voBccEEZmJ/M1LI0DZGE1jkRaYwTz18eIs3JBRSRDb8r8sRutuAnJJudcq?=
 =?iso-8859-1?Q?CtLua3q2ESzeuMjYeR69jCmtPmSA3PcZtJans12vLt/8UZCMHzCpEh9ZiM?=
 =?iso-8859-1?Q?rFv8Rn+YCigH9KuZ8ZyEtF+zcJIsW8+0tg1BAQrVP4x7prV4EPGrsNeqY5?=
 =?iso-8859-1?Q?m3goxeNqm/WjCMvGnaGchKqKTaW6/5XPSnGN/dCedEJqUJmG/smI+31ORL?=
 =?iso-8859-1?Q?HblYqfFxBJ4AexeNHWbNuC26Vi5OAYUxhFWQu38t09pCtMowKKD6Q3EJyj?=
 =?iso-8859-1?Q?ILKRGJdH7oHMD+Hsc2ALO2jrxXo527QJxwVHIul7qWyapSTDdvW9t+6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 203b3fac-77af-4b90-db25-08de17b36800
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:54:04.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWrpl029w8hehdiVbcquejK3O2TSy2AoBEQRod98NhO587r9aIDdIyJTcAUfUQvj+g1wlbJfUM7I16y/L3KUqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

On Thu, Oct 30, 2025 at 08:58:53AM +0100, Thomas Hellström wrote:
> On Wed, 2025-10-29 at 13:57 -0700, Matthew Brost wrote:
> > Prevent application hangs caused by out-of-order fence signaling when
> > user fences are attached. Use drm_syncobj (via dma-fence-chain) to
> > guarantee that each user fence signals in order, regardless of the
> > signaling order of the attached fences. Ensure user fence writebacks
> > to
> > user space occur in the correct sequence.
> 
> Perhaps describe exactly what the signalling order is supposed to be?
> Like calling order per exec_queue etc. (strictly I guess it's the
> grabbing order of a certain lock, like the vm resv?)
> 
> Do we need a Fixes: for this?

Yes, we probably should add a fixes tag. It seems possible to hit, but
by chance, timing we haven't hit this yet. Will add ahead of merge.

Matt

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> > 
> > Signed-of-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c             |  3 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 13 +++++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++
> >  drivers/gpu/drm/xe/xe_oa.c               | 45 ++++++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_oa_types.h         |  8 +++++
> >  drivers/gpu/drm/xe/xe_sync.c             | 17 +++++++--
> >  drivers/gpu/drm/xe/xe_sync.h             |  3 ++
> >  drivers/gpu/drm/xe/xe_sync_types.h       |  3 ++
> >  drivers/gpu/drm/xe/xe_vm.c               |  4 +++
> >  9 files changed, 85 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 0dc27476832b..f7b9d8715053 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -166,7 +166,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  
> >  	for (num_syncs = 0; num_syncs < args->num_syncs;
> > num_syncs++) {
> >  		err = xe_sync_entry_parse(xe, xef,
> > &syncs[num_syncs],
> > -					  &syncs_user[num_syncs],
> > SYNC_PARSE_FLAG_EXEC |
> > +					  &syncs_user[num_syncs],
> > NULL, 0,
> > +					  SYNC_PARSE_FLAG_EXEC |
> >  					  (xe_vm_in_lr_mode(vm) ?
> >  					   SYNC_PARSE_FLAG_LR_MODE :
> > 0));
> >  		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 90cbc95f8e2e..6e168efbac65 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -10,6 +10,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_syncobj.h>
> >  #include <uapi/drm/xe_drm.h>
> >  
> >  #include "xe_dep_scheduler.h"
> > @@ -345,6 +346,7 @@ struct xe_exec_queue
> > *xe_exec_queue_create_bind(struct xe_device *xe,
> >  	struct xe_gt *gt = tile->primary_gt;
> >  	struct xe_exec_queue *q;
> >  	struct xe_vm *migrate_vm;
> > +	int err;
> >  
> >  	migrate_vm = xe_migrate_get_vm(tile->migrate);
> >  	if (xe->info.has_usm) {
> > @@ -368,6 +370,14 @@ struct xe_exec_queue
> > *xe_exec_queue_create_bind(struct xe_device *xe,
> >  	}
> >  	xe_vm_put(migrate_vm);
> >  
> > +	err = drm_syncobj_create(&q->ufence_syncobj,
> > +				 DRM_SYNCOBJ_CREATE_SIGNALED,
> > +				 NULL);
> > +	if (err) {
> > +		xe_exec_queue_put(q);
> > +		return ERR_PTR(err);
> > +	}
> > +
> >  	return q;
> >  }
> >  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> > @@ -377,6 +387,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> >  	struct xe_exec_queue *q = container_of(ref, struct
> > xe_exec_queue, refcount);
> >  	struct xe_exec_queue *eq, *next;
> >  
> > +	if (q->ufence_syncobj)
> > +		drm_syncobj_put(q->ufence_syncobj);
> > +
> >  	if (xe_exec_queue_uses_pxp(q))
> >  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 282505fa1377..838266c3914b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -15,6 +15,7 @@
> >  #include "xe_hw_fence_types.h"
> >  #include "xe_lrc_types.h"
> >  
> > +struct drm_syncobj;
> >  struct xe_execlist_exec_queue;
> >  struct xe_gt;
> >  struct xe_guc_exec_queue;
> > @@ -155,6 +156,12 @@ struct xe_exec_queue {
> >  		struct list_head link;
> >  	} pxp;
> >  
> > +	/** @ufence_syncobj: User fence syncobj */
> > +	struct drm_syncobj *ufence_syncobj;
> > +
> > +	/** @ufence_timeline_value: User fence timeline value */
> > +	u64 ufence_timeline_value;
> > +
> >  	/** @ops: submission backend exec queue operations */
> >  	const struct xe_exec_queue_ops *ops;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index f901ba52b403..7a13a7bd99a6 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -10,6 +10,7 @@
> >  
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_managed.h>
> > +#include <drm/drm_syncobj.h>
> >  #include <uapi/drm/xe_drm.h>
> >  
> >  #include <generated/xe_wa_oob.h>
> > @@ -1390,7 +1391,9 @@ static int xe_oa_user_extensions(struct xe_oa
> > *oa, enum xe_oa_user_extn_from fro
> >  	return 0;
> >  }
> >  
> > -static int xe_oa_parse_syncs(struct xe_oa *oa, struct
> > xe_oa_open_param *param)
> > +static int xe_oa_parse_syncs(struct xe_oa *oa,
> > +			     struct xe_oa_stream *stream,
> > +			     struct xe_oa_open_param *param)
> >  {
> >  	int ret, num_syncs, num_ufence = 0;
> >  
> > @@ -1410,7 +1413,9 @@ static int xe_oa_parse_syncs(struct xe_oa *oa,
> > struct xe_oa_open_param *param)
> >  
> >  	for (num_syncs = 0; num_syncs < param->num_syncs;
> > num_syncs++) {
> >  		ret = xe_sync_entry_parse(oa->xe, param->xef,
> > &param->syncs[num_syncs],
> > -					  &param-
> > >syncs_user[num_syncs], 0);
> > +					  &param-
> > >syncs_user[num_syncs],
> > +					  stream->ufence_syncobj,
> > +					  ++stream-
> > >ufence_timeline_value, 0);
> >  		if (ret)
> >  			goto err_syncs;
> >  
> > @@ -1540,7 +1545,7 @@ static long xe_oa_config_locked(struct
> > xe_oa_stream *stream, u64 arg)
> >  		return -ENODEV;
> >  
> >  	param.xef = stream->xef;
> > -	err = xe_oa_parse_syncs(stream->oa, &param);
> > +	err = xe_oa_parse_syncs(stream->oa, stream, &param);
> >  	if (err)
> >  		goto err_config_put;
> >  
> > @@ -1636,6 +1641,7 @@ static void xe_oa_destroy_locked(struct
> > xe_oa_stream *stream)
> >  	if (stream->exec_q)
> >  		xe_exec_queue_put(stream->exec_q);
> >  
> > +	drm_syncobj_put(stream->ufence_syncobj);
> >  	kfree(stream);
> >  }
> >  
> > @@ -1827,6 +1833,7 @@ static int
> > xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> >  					  struct xe_oa_open_param
> > *param)
> >  {
> >  	struct xe_oa_stream *stream;
> > +	struct drm_syncobj *ufence_syncobj;
> >  	int stream_fd;
> >  	int ret;
> >  
> > @@ -1837,17 +1844,31 @@ static int
> > xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> >  		goto exit;
> >  	}
> >  
> > +	ret = drm_syncobj_create(&ufence_syncobj,
> > DRM_SYNCOBJ_CREATE_SIGNALED,
> > +				 NULL);
> > +	if (ret)
> > +		goto exit;
> > +
> >  	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> >  	if (!stream) {
> >  		ret = -ENOMEM;
> > -		goto exit;
> > +		goto err_syncobj;
> >  	}
> > -
> > +	stream->ufence_syncobj = ufence_syncobj;
> >  	stream->oa = oa;
> > -	ret = xe_oa_stream_init(stream, param);
> > +
> > +	ret = xe_oa_parse_syncs(oa, stream, param);
> >  	if (ret)
> >  		goto err_free;
> >  
> > +	ret = xe_oa_stream_init(stream, param);
> > +	if (ret) {
> > +		while (param->num_syncs--)
> > +			xe_sync_entry_cleanup(&param->syncs[param-
> > >num_syncs]);
> > +		kfree(param->syncs);
> > +		goto err_free;
> > +	}
> > +
> >  	if (!param->disabled) {
> >  		ret = xe_oa_enable_locked(stream);
> >  		if (ret)
> > @@ -1871,6 +1892,8 @@ static int
> > xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> >  	xe_oa_stream_destroy(stream);
> >  err_free:
> >  	kfree(stream);
> > +err_syncobj:
> > +	drm_syncobj_put(ufence_syncobj);
> >  exit:
> >  	return ret;
> >  }
> > @@ -2084,22 +2107,14 @@ int xe_oa_stream_open_ioctl(struct drm_device
> > *dev, u64 data, struct drm_file *f
> >  		goto err_exec_q;
> >  	}
> >  
> > -	ret = xe_oa_parse_syncs(oa, &param);
> > -	if (ret)
> > -		goto err_exec_q;
> > -
> >  	mutex_lock(&param.hwe->gt->oa.gt_lock);
> >  	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
> >  	mutex_unlock(&param.hwe->gt->oa.gt_lock);
> >  	if (ret < 0)
> > -		goto err_sync_cleanup;
> > +		goto err_exec_q;
> >  
> >  	return ret;
> >  
> > -err_sync_cleanup:
> > -	while (param.num_syncs--)
> > -
> > 		xe_sync_entry_cleanup(&param.syncs[param.num_syncs]);
> > -	kfree(param.syncs);
> >  err_exec_q:
> >  	if (param.exec_q)
> >  		xe_exec_queue_put(param.exec_q);
> > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h
> > b/drivers/gpu/drm/xe/xe_oa_types.h
> > index 2628f78c4e8d..daf701b5d48b 100644
> > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > @@ -15,6 +15,8 @@
> >  #include "regs/xe_reg_defs.h"
> >  #include "xe_hw_engine_types.h"
> >  
> > +struct drm_syncobj;
> > +
> >  #define DEFAULT_XE_OA_BUFFER_SIZE SZ_16M
> >  
> >  enum xe_oa_report_header {
> > @@ -248,6 +250,12 @@ struct xe_oa_stream {
> >  	/** @xef: xe_file with which the stream was opened */
> >  	struct xe_file *xef;
> >  
> > +	/** @ufence_syncobj: User fence syncobj */
> > +	struct drm_syncobj *ufence_syncobj;
> > +
> > +	/** @ufence_timeline_value: User fence timeline value */
> > +	u64 ufence_timeline_value;
> > +
> >  	/** @last_fence: fence to use in stream destroy when needed
> > */
> >  	struct dma_fence *last_fence;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 82872a51f098..d48ab7b32ca5 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -113,6 +113,8 @@ static void user_fence_cb(struct dma_fence
> > *fence, struct dma_fence_cb *cb)
> >  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  			struct xe_sync_entry *sync,
> >  			struct drm_xe_sync __user *sync_user,
> > +			struct drm_syncobj *ufence_syncobj,
> > +			u64 ufence_timeline_value,
> >  			unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync_in;
> > @@ -192,10 +194,15 @@ int xe_sync_entry_parse(struct xe_device *xe,
> > struct xe_file *xef,
> >  		if (exec) {
> >  			sync->addr = sync_in.addr;
> >  		} else {
> > +			sync->ufence_timeline_value =
> > ufence_timeline_value;
> >  			sync->ufence = user_fence_create(xe,
> > sync_in.addr,
> >  							
> > sync_in.timeline_value);
> >  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> >  				return PTR_ERR(sync->ufence);
> > +			sync->ufence_chain_fence =
> > dma_fence_chain_alloc();
> > +			if (!sync->ufence_chain_fence)
> > +				return -ENOMEM;
> > +			sync->ufence_syncobj = ufence_syncobj;
> >  		}
> >  
> >  		break;
> > @@ -239,7 +246,12 @@ void xe_sync_entry_signal(struct xe_sync_entry
> > *sync, struct dma_fence *fence)
> >  	} else if (sync->ufence) {
> >  		int err;
> >  
> > -		dma_fence_get(fence);
> > +		drm_syncobj_add_point(sync->ufence_syncobj,
> > +				      sync->ufence_chain_fence,
> > +				      fence, sync-
> > >ufence_timeline_value);
> > +		sync->ufence_chain_fence = NULL;
> > +
> > +		fence = drm_syncobj_fence_get(sync->ufence_syncobj);
> >  		user_fence_get(sync->ufence);
> >  		err = dma_fence_add_callback(fence, &sync->ufence-
> > >cb,
> >  					     user_fence_cb);
> > @@ -259,7 +271,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry
> > *sync)
> >  		drm_syncobj_put(sync->syncobj);
> >  	dma_fence_put(sync->fence);
> >  	dma_fence_chain_free(sync->chain_fence);
> > -	if (sync->ufence)
> > +	dma_fence_chain_free(sync->ufence_chain_fence);
> > +	if (!IS_ERR_OR_NULL(sync->ufence))
> >  		user_fence_put(sync->ufence);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > b/drivers/gpu/drm/xe/xe_sync.h
> > index 256ffc1e54dc..51f2d803e977 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include "xe_sync_types.h"
> >  
> > +struct drm_syncobj;
> >  struct xe_device;
> >  struct xe_exec_queue;
> >  struct xe_file;
> > @@ -21,6 +22,8 @@ struct xe_vm;
> >  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  			struct xe_sync_entry *sync,
> >  			struct drm_xe_sync __user *sync_user,
> > +			struct drm_syncobj *ufence_syncobj,
> > +			u64 ufence_timeline_value,
> >  			unsigned int flags);
> >  int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
> >  			   struct xe_sched_job *job);
> > diff --git a/drivers/gpu/drm/xe/xe_sync_types.h
> > b/drivers/gpu/drm/xe/xe_sync_types.h
> > index 30ac3f51993b..b88f1833e28c 100644
> > --- a/drivers/gpu/drm/xe/xe_sync_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> > @@ -18,9 +18,12 @@ struct xe_sync_entry {
> >  	struct drm_syncobj *syncobj;
> >  	struct dma_fence *fence;
> >  	struct dma_fence_chain *chain_fence;
> > +	struct dma_fence_chain *ufence_chain_fence;
> > +	struct drm_syncobj *ufence_syncobj;
> >  	struct xe_user_fence *ufence;
> >  	u64 addr;
> >  	u64 timeline_value;
> > +	u64 ufence_timeline_value;
> >  	u32 type;
> >  	u32 flags;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 10d77666a425..4058c476aa2d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3633,8 +3633,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  
> >  	syncs_user = u64_to_user_ptr(args->syncs);
> >  	for (num_syncs = 0; num_syncs < args->num_syncs;
> > num_syncs++) {
> > +		struct xe_exec_queue *__q = q ?: vm->q[0];
> > +
> >  		err = xe_sync_entry_parse(xe, xef,
> > &syncs[num_syncs],
> >  					  &syncs_user[num_syncs],
> > +					  __q->ufence_syncobj,
> > +					  ++__q-
> > >ufence_timeline_value,
> >  					  (xe_vm_in_lr_mode(vm) ?
> >  					   SYNC_PARSE_FLAG_LR_MODE :
> > 0) |
> >  					  (!args->num_binds ?
> 
