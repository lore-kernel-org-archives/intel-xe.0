Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADDDC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 20:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC14B10E187;
	Tue,  1 Apr 2025 20:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnV2dLE/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F1C10E187
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743541094; x=1775077094;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=PU5n16h5x+PTwiYKSgVgT9F9hDGm3ryFbLwd54s3tLo=;
 b=bnV2dLE/8sy2xkFSlAYfftxU5KG2Je/bOR8tnbJkBHXlIRC2nCOsAzUQ
 oyBZk4fVVdkxOVUzNKan6i2tFTYvJlQY1hp1Hob288l4VaXttdqlEtAXc
 7Odd8Ue3Ri0xMk5c10yKcyJb3qy9Eno+fP5iNSySp2X9u/ODuxsUIe5Zy
 f6lGvByBBh6820ZwfRSLGHhOQOi6NiZUUaN9EyVRjSmHfMAd49tbXrrug
 TVs3fST8hv8IQsDUH/YD2GUzPsooxC3ZptExE+bJBp6RqnFmNAIenQNkh
 64ipKSFBRvAteYni6nlvSil/HojuN+kthxLIrfdPb90JyHDvMipg6gO/S Q==;
X-CSE-ConnectionGUID: iVJPXEgQRDSBl7M7u7n6HQ==
X-CSE-MsgGUID: +lWKZCwbSYGd8kF2DqjzUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44776989"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44776989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 13:58:13 -0700
X-CSE-ConnectionGUID: nmHGTLgzRJ+7m9nw6XAvVw==
X-CSE-MsgGUID: AvWEaaRtRKurQsYY71bhxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131212650"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 13:58:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 13:58:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 13:58:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 13:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If68qQdhY7i0kbv4lszjGzP+459fY8o9StBWJmg+sucAcYkguuqEopSGvIdTWUbv5aU/ZskPjvZW1QiMPUrIUrPoCFiXDKyhVs0YxPfm+v3Hm1UBS0h8+UgoBGAHsE1UVjZBUKdhsYHDs5OM2vmnr+SWdyfNWPSxTy4FXsE3zgKsG76F1PN+9EI7r2WV46W16HgwCu/rw5RFdaOfCHrNsdJr2t3/VZh8iupn61klkWsr5gVjA4KIwiCuwAK4Ocgipdq6tDOM6gcnoc5k9Nzi6io6y50mtpB0/DCWbKrPNowtOKeKFlvfvyNHHfYNrUpy0RRuHQnJZvbpkFrUEkeXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTna8J0eHcxrtAveIcHM+Vh58denEMTFCDPhiBNxnFw=;
 b=C+81CUWhjqp+F9Az5uPOZE9WTJj7oczLKNgvhtVRZdMr5H0vPalx9XgtNpCuRVfK8DfufivmpfTJKDpG3/ONp+F+0jlmo0RPWdMt7yZ7k1/lQQs8rAVvfH7P2rifwEikVgWx8C4zrxWvKjPEFjYyBSn2ITooKPVbootkXY7HeJ1bK6nioDcheGd/BdiO5Cisnm3utuY7GZtwxpLQaH5xOJBA07+jv27/TvsT9kw4cPHpQTN3L2VzFWhcouLVIpNQbu6dhvgOc2gxIeBqHJpfGgEtsiROY+SxBZ2AQloSu2MZPVNeisvCHDL8xMtayjzXnmOLk+MFE/AkqgQTuZkS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 20:58:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 20:58:08 +0000
Date: Tue, 1 Apr 2025 13:59:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add devcoredump chunking
Message-ID: <Z+xTqgxHw6bkkiI4@lstrano-desk.jf.intel.com>
References: <20250401204351.4130873-1-matthew.brost@intel.com>
 <20250401204351.4130873-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250401204351.4130873-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:907:1::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: cee0c783-6a72-429d-b95b-08dd715fe7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CmA9gwJDeGqIG5PVITm2c1CINn3vIr5mGPb15QRHC1D8qZTs6S7jk/0o8hiq?=
 =?us-ascii?Q?1Ms3pWfDUOhGhvpjC4ZckreG8SIilUZmeMu/AMhLKKSt9077NKxPvIpF4ZUW?=
 =?us-ascii?Q?pacZYSby/S//pXmqlUkxt4Sm2bHZRP9vC8A3lUlUr8OI4h04SDx8Ajy9TAw1?=
 =?us-ascii?Q?1s9f9Tf0BJDZHBEdfJ42RIDQEN1dZO8qUjpfTw9XKfJOFJo3hPr3CZARRzmA?=
 =?us-ascii?Q?YOmcRvqgEZ8QL5GwP8d30EOk7U99KULpgatBt2roNBR7VMRr/WO/uXdYfqx4?=
 =?us-ascii?Q?asJ/E9MT7ppKy/+WNk4JHzBWzBs1hNN9mHPY7EQMZH0oNJkRyO9HGWLLa54i?=
 =?us-ascii?Q?8CotOxJ/SzMVwz45UaUKB8Zbff2uKqNZYzCy8NkOh22I01XJL+XOyyfmza3y?=
 =?us-ascii?Q?rXuGma7I2TirIyx+swCnlygs8CKtPxgKCuc+glqnqd0aC1JhRf27ziivbPJs?=
 =?us-ascii?Q?ipsNcN3kszyrXlsqRA3Jc+XK8hJirVzlbIa6xiLfsgyHuYKAQvRGK2gRjCHb?=
 =?us-ascii?Q?aKK3ifPE6zcH9B7vdyjJUtmtnvaQcbIZT4vASyaRHKmu4dxb+tbG9RoY8fIP?=
 =?us-ascii?Q?TXzqLWBsWgzyzIA0NySTTR87/6ExwRAK99drPxI7yVZJthlBPZbcJqBaVc3i?=
 =?us-ascii?Q?zxMdU1Pp47KmYChdXEBsXLg0Tmiy68bRDjIiC5Yp3Y2G1LJx1WG75Ov/TuUL?=
 =?us-ascii?Q?saUMUIcSxi96bw4Ldl1VJ2PKGro9oMnB6+foJ9h/nGMPWZ7SUtv4TAHLzCNT?=
 =?us-ascii?Q?bHCoN2KnCZwWecq0bpsNb4+BDHE8cgEV4aef7mQdGqtsM+uFbkkp9F11FEce?=
 =?us-ascii?Q?2YVUQARudwtOJls9Y0uyM3/mK4Zfn5db9dMx9ZkV08Pxoi+1b1WL9dndagRX?=
 =?us-ascii?Q?9t3xfqO+Ty9DBsCv/tRXoUdxvBiSiVWz7hXXqPkDB4+akoO4V39m4TcWYiZ8?=
 =?us-ascii?Q?YxuMb9cgggl9UMWjV22elvvYS39iN8UN2bLg2gMZJKuHdjeAVkzodRR2YFRh?=
 =?us-ascii?Q?7VraZS5bcdVY5ZYHEsMiAPdkE9dcYZ4ZQFjdqb4dPH/YvgQJ1L5815M1m5cJ?=
 =?us-ascii?Q?ylEw487C0M6tT1fWR/gkhBZwwDTxfqASIxjpIn645uQuRuqmcQMfIQDr+Acr?=
 =?us-ascii?Q?XOlBIOiGSefcGqvJ3++grQmCS1woPFCpnca4vnFUNs0p/ef9E5QW13WmHt+d?=
 =?us-ascii?Q?DRpDI7BVRKB7+Ay2G0FX6WLQ0OcskXTyp7ZDh2SiDGka/Gmoz3oU0FRqyJgv?=
 =?us-ascii?Q?WGjzYAPJRffLKw0stt89UbPa2Gk6MCQYp0w4NYodcpP9mOWzr2N4G7l4ILSc?=
 =?us-ascii?Q?ybMwTORSsChd4j3cH2YnrhlThfL6/w908GI2Qzc6gB+8PTGFnoMXGSsQslF3?=
 =?us-ascii?Q?mddGau09Ibi76uT/q7fdcB9SATaV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fiy5RPBKO83NxHH6031llDHgokNr9Iuv1e4FWt/foDrwEYymO4BAu3QIqfzZ?=
 =?us-ascii?Q?XZUy/uMzEdd7iNixPDxug8noan0zknx3YL1xLV79snjQl5fmXyWX3e9Jcu66?=
 =?us-ascii?Q?pdlzciiQDwngfbef+myjYA8Ihb6Bwu1eKr85wJIoxA3qLFWRRIMovWLIcsYx?=
 =?us-ascii?Q?KCJahj+QsNJsN5vqpsMku5x4nJ6TYhwXj+fB/FQYc6gSEbzm8I0qksWcGmjm?=
 =?us-ascii?Q?s8I8OpPsjG6sZ5PgSU87uxS1PNtwsd67eAG0OePfseYImMNjhVMaaNSkcKaB?=
 =?us-ascii?Q?gI0YlqSewpp8uf0d17V84/OVfghn8uVOD0QFjaG5qHH/IDDSwnKP0BqSHk1c?=
 =?us-ascii?Q?Q0aHx45msngp77g+/kGKt3oX7opOHFpXqid3oO/5CwH9sy0kCwTf41fusm3G?=
 =?us-ascii?Q?cl4sjja549kixpGjdzmrG/UAq0GDVNOxej4yRd6gOy8465hB3ydhxMmcPl+s?=
 =?us-ascii?Q?Xz7rTjU8F6GZVlG2EJLph/N0yIrrLBjGmKQF6V/qFH9Z0+D9WD1isQXQxPUe?=
 =?us-ascii?Q?CFcyU22yvOdTk/zIb3G4Kvw/W7tPcxHQg1QcxB4Ztu6uVWuvWNZ01xIAvjXr?=
 =?us-ascii?Q?7LMo1LL0K+AGzgI59vFfczlZx1EHmj3LOtkmxLRt0O2LZgV5jNkchtJQ7dtq?=
 =?us-ascii?Q?rys0m8z2mEiWR+L4e88NF2+sBpfw0jWyC7m/B+IWezkxoIFKv0U6DZhcxCdA?=
 =?us-ascii?Q?qXJGriHho6t/GaBMO1mpCGEaaqxKO2m3VJAR4w2Sqkp8Gv/Qi25e5+VCbZzx?=
 =?us-ascii?Q?TTOdZ0TJEnl/mNR/3psLL1X7dXZ96oF3D8xE8rcfaghT4FW8ZFgaKhkJmQDd?=
 =?us-ascii?Q?MF7LRK/QYH6o0j77uYSzJCj6BZpn65SjYZLqNPWoitCaQoiT4n8maTgFAfx3?=
 =?us-ascii?Q?Cs4pOvhSGfIzSaE79W5PYwcpfLtAN6PpUqf52Va1FiAwe16T9g238bCNnNBD?=
 =?us-ascii?Q?DKbGxoTwMiY/RY+AJjfjvJagvGwwYzuESMwx3Q2T1E2MfGMkGdBB3GYUfuVM?=
 =?us-ascii?Q?0I45KT0EM3+EMtRTqzGawL1AMkcX3ZpgTtxYZbWco8wNL1VfzKMBscrYX42b?=
 =?us-ascii?Q?UkTn3fXDF+RtTyMHlJwu8i4dRFY56OSq1SZwSW/h23YPuEj9D7TCk7yVUVc8?=
 =?us-ascii?Q?/o+6KAlwGne+S4PfrvoFEH36f6WSkxRvtAoyIRCJIJuADrvqmNyyVGk7eUgW?=
 =?us-ascii?Q?oLbSQsKdYfZ5o0G+mMh+MXsOGWID+JLlDFTAomINqyzDhgnbxB/eSkG8FH+D?=
 =?us-ascii?Q?s3IF19k8FTladAbX3ijkh/AzfHy8dVAH5dxNSXrbShrOgIwcbKfJRirWfDz4?=
 =?us-ascii?Q?Kin0jkahClrO/YM6iGOqLV2ZBoIJvaIkvrprqHB7ZsPId2IJn9nNXom51r1/?=
 =?us-ascii?Q?ewNlNSCwEIZxNhchHVCV9A+X66nsehrmQjIN+EdcTLVrnZLIif3wLdQC38hY?=
 =?us-ascii?Q?t4tY24Ek1YNJ4KZwTLIbH9bR33Qjsks9fiJe/LJ3PF/HZp1GhuN9rnmUvpbJ?=
 =?us-ascii?Q?d7wUrL7RbDXFZIiXcq6RBAkbuYfwVgmoQHtSngoG2aJw5ddeA77JOUc/oZBQ?=
 =?us-ascii?Q?A/kI7hx8VR5feP1sVesmSaKxFZfIztcJWoXBoUJcRdK05gHz2zwlN6qMyQpY?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cee0c783-6a72-429d-b95b-08dd715fe7bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 20:58:08.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HapTfU13v1gMbjVhxCL4y6xU+23q7cKTS3Z6+e5J/KY/uEh4n8ZAtUIx/lXcrUVp2blUzTm5Wm1oLa7OY+pxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

On Tue, Apr 01, 2025 at 01:43:50PM -0700, Matthew Brost wrote:
> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> callback as needed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Worth noting with this, we still have some O(N^2) characteristics within
the xe_devcoredump_read callback so large devcoredump, say 6G, take
about 1.5 minutes to read out on BMG. We could move this to snap worker
by allocating multiple buffers via kvalloc - it would take the same amount
of time but would be in the worker. The readout would be faster then
once the worker completes. Easy to make this change if we decide on that
direction.

Matt

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>  3 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 81b9d9bb3f57..a9e618abf8ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>  	return &q->gt->uc.guc;
>  }
>  
> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> +				     ssize_t start,
>  				     struct xe_devcoredump *coredump)
>  {
>  	struct xe_device *xe;
> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>  	ss = &coredump->snapshot;
>  
>  	iter.data = buffer;
> -	iter.start = 0;
> +	iter.start = start;
>  	iter.remain = count;
>  
>  	p = drm_coredump_printer(&iter);
> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>  	ss->vm = NULL;
>  }
>  
> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> +
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +
>  	mutex_lock(&coredump->lock);
>  
>  	if (!ss->read.buffer) {
> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  		return 0;
>  	}
>  
> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> +	    offset < ss->read.chunk_position) {
> +		ss->read.chunk_position =
> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      ss->read.chunk_position, coredump);
> +	}
> +
>  	byte_copied = count < ss->read.size - offset ? count :
>  		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> +	memcpy(buffer, ss->read.buffer +
> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>  
>  	mutex_unlock(&coredump->lock);
>  
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> +
>  	return byte_copied;
>  }
>  
> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>  	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>  	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>  
> -	xe_pm_runtime_put(xe);
> +	ss->read.chunk_position = 0;
>  
>  	/* Calculate devcoredump size */
> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> -
> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> +
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> +					   GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      0, coredump);
> +	} else {
> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> +				      coredump);
> +		xe_devcoredump_snapshot_free(ss);
> +	}
>  
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> -	xe_devcoredump_snapshot_free(ss);
> +put_pm:
> +	xe_pm_runtime_put(xe);
>  }
>  
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>  	if (offset & 3)
>  		drm_printf(p, "Offset not word aligned: %zu", offset);
>  
> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>  	if (!line_buff) {
>  		drm_printf(p, "Failed to allocate line buffer\n");
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..a174385a6d83 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>  	struct {
>  		/** @read.size: size of devcoredump in human readable format */
>  		ssize_t size;
> +		/** @read.chunk_position: position of devcoredump chunk */
> +		ssize_t chunk_position;
>  		/** @read.buffer: buffer of devcoredump in human readable format */
>  		char *buffer;
>  	} read;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index af2c817d552c..21403a250834 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>  	if (num_dw == 0)
>  		return -EINVAL;
>  
> -	hwconfig = kzalloc(size, GFP_KERNEL);
> +	hwconfig = kzalloc(size, GFP_ATOMIC);
>  	if (!hwconfig)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 
