Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47143CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 22:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095D10E0C5;
	Wed,  8 Oct 2025 22:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrE25Dkx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B356510E0C5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759964319; x=1791500319;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+MthPQut0ff9c3RgbrEfoVeAxjGwslJsE4zOWQRM9R4=;
 b=KrE25Dkx5I9fDlfap8MxZPh7J3XhfQX8rD/pGfSniUF032BK25qFQFlM
 JK8WUNjDlyV4REZjaMaWjg+5WUcQMh3gzo6gRU4jaBGK9B3jBYAS165Y3
 Xz2eGR50MsYxxbNxyV5JKVeymRYsHDpL9iVXqXqEBkJD/IqnSnllSihMW
 jkQR4+IFrii7lunHf6hAf9IXvCwTo7bjbGEWLDfE/Wa/Lwr+nz1yd+B4D
 DgQ5rmYaP93kGq5k3ee4m9Cop6hdPI7WIvmWgLztHYzylF7W2zr54Ll5r
 fJhRPcRybMLCmtBqTNT9vbYGgVEJ10QFQNY8pCKRl4J40gJiJnfY1gLkP w==;
X-CSE-ConnectionGUID: g8FPfTnbRlCWQM78yUSsUQ==
X-CSE-MsgGUID: MIx8DSXNR6mk9h2oogULUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72847088"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="72847088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:58:39 -0700
X-CSE-ConnectionGUID: /s5zWU7RTWGyaka7PHDO/Q==
X-CSE-MsgGUID: l0qc858CTFOQf2nU7NYZnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180585731"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:58:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:58:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:58:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:58:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6VmCtbjcZoGz4Q2P7zhRyQPWebTEZnqyj1m66bfEHG7Th/ym6nshZoqf/XLVY8Hz6LZYmN4Y5W+LZOhqOGcJj8JWM3U4CGrg3IDyM34RoBfVse3W6M4F2s2YQ8yQd39lm0oRleIOAfmlLjFaMuLM9cnwWS4YhLMSpH1SjEOTRrUKqLXCkcaUMGkp7eR877XlretGuTITIZqqygg9jDbkCQKr5SU+dTtpydgTUC21B6XDDjfnLHnU7g+NA6pdzg9BbYWPvLztmzy9F+/wPmVwz5uMHM2qlTp5Kkz7VNChFhB80OyG2yX8rCN/iX7vNv0eEW18/FWyalXTt2BvEmKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHZcv89n/SB0e5dxO+rlwB8RfMv66qAm/AjR5bH1U74=;
 b=H3CuC5YMoriRVzUTgmLXY7dHo1s0Gisj3KDSdYYX85UybU6v19BbiitADRpuz86bdD+vBWvfdRFX6dBEqDolXOO3VmkM6MLw+mGMgQxdTFIeCO3LxwGqpHve4oH2dJ1QJgFbHVaST9fC2EuFiC+GwxGCowOLimFM8sH4M/EHEqChTpJzr4HHtU70Yo4PwV3+iB1V5EhxTAN8OBqtFLGq19nFd+oE7J54sK+HWtK8TWKxFFHTeX7CKT0Jw/NXYRtBqKyoGxcehGQjl+jvLGQlLsZfGBvQ/V0Eq1RCHSMgx02aPPagPFdzYGKCA5SrmQXUyZOoQJmdDeBexmxcbuQHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 8 Oct
 2025 22:58:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:58:36 +0000
Date: Wed, 8 Oct 2025 15:58:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW2PR2101CA0034.namprd21.prod.outlook.com
 (2603:10b6:302:1::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5523486a-eb0e-466e-96b0-08de06be35bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OKlm4vGzPYpI4baGjUSnMQd/e/oiwyNmq4zK3E03ChFLQcoyyVJj+DDmYqDw?=
 =?us-ascii?Q?mxt1oqZhTmqozR1L+iiSO2y5sWN0aoui9ySJIGbc2JoocgO549KajQmiVDYG?=
 =?us-ascii?Q?w5aw1lauYUp8LjbvozajUPeNSBVroIyVG6/W2SjsikPp2N+yvG8XKxNhyarD?=
 =?us-ascii?Q?S+eVazEEYiRQWzIFKmXkZN/CFyBUhvlhyppWXIy1KD8XfCZyvmLjTuDenmbB?=
 =?us-ascii?Q?4S+ZXcDBErtnPnyrlXZt87/NW5TKgFQOVcCl8deW9XvxyvMTkqfJTg/k3HTI?=
 =?us-ascii?Q?ntReQwwHC3HFrqcePGCBr0d1Mm5A3MBPbX8nanqG2FXLN9tockkP2LMPEf5C?=
 =?us-ascii?Q?ONp7dRVckOyLfr/aH6T2cliYfQu11OAOUMJGjX/sc5Br5u0RaXVDaIBkFxrE?=
 =?us-ascii?Q?6dYNkcv4II2vgRqX/C+4Lz2D2Z/9qv/oA1f1QgW/RqcUTGLl7QtBypFL2LE8?=
 =?us-ascii?Q?eiqq04K0Hnsw8OcFKtLterTQKBj/5BIXImgPY7Abb4cEXdZdz7o0OO2zD6bP?=
 =?us-ascii?Q?kpRSwexVHT4UANLFD5FbLtgldG204SzHznYcBU5DmZtHuTSFQOpTOvAo6d7w?=
 =?us-ascii?Q?jKu9eOpYhhZnjh5bRDIjpmMkBDrgWnQEki/CAqncUpBK9wYL0cElv2GxoI8x?=
 =?us-ascii?Q?2Skx6sLaDvj03TYaZksd5yLWG7F3t/xwmJ2HXiEtq9xdxjMRqtnrrlrlrBeu?=
 =?us-ascii?Q?pq3zXhiXdaZFVWm9hz9Tk02/5B2fww5et4MoaPcRmmQYgG9kLRjqydbjI8G6?=
 =?us-ascii?Q?36frAYX4exhN8puh65RJ1DSe7tdiwACNK24GcWy9XR2IEwBkAviS2/FMmZXc?=
 =?us-ascii?Q?W4HYaAY2inIZmr53fetYZnkZnRe4Vuh+HVevamacfcleTR4Kjq3qhLUyTRpb?=
 =?us-ascii?Q?lZ6IQtuerlXIctgLL5Ubj+Y9rrMUIDenB+Gg34rqboyUxfObNVPB5q8td2lF?=
 =?us-ascii?Q?rLnhlaKARD+HdnXv38zQcMNVr67YsBSIolpeA7K1l8u0+pQk/t/HO5/+PYOX?=
 =?us-ascii?Q?qsZscBiXfy6+qmp2Pz9Xto5V3+nImrxxKABFMKrL065/sVERsVasteatnA1r?=
 =?us-ascii?Q?TN5NkvzXZr2qzxkrG4kXYcosTcSiLiVAy2FOBQ6Nq2+i63bW6ykG7utE6itg?=
 =?us-ascii?Q?8q8G6rce82I0ORGLWaZLWTGqwFIAn90nHITk1wyif4+rcqk6M3z/fz0IDTiB?=
 =?us-ascii?Q?3WUPV/5xczCo8bqnvtRCFbmMvMD8xni5RQgjwA9bJXzswZW9HmxaW9HA8aRp?=
 =?us-ascii?Q?dDnYkylHLkXvTRNvDYu1YNg2ORqh7rxVvkfb8dzKSpQsQSRMC5bD2qv9j110?=
 =?us-ascii?Q?9QZsJbsi7tLczocVkBjqASyFMk7LGMTemx3slcyK3/23h1UOFNR0fvMWxZIe?=
 =?us-ascii?Q?MCgOl/4MomVgXVweqXHLXguqbC3pTvT9Qj09+2/qPUl71JfWYVYArlLnH+eE?=
 =?us-ascii?Q?8yi0T9D8/ipYNwmfcW4K1QvpigfIzA0Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZsrMfGuV5ai21ICquXQfzP+mm55UciGYZGCZXTTRyJ4PfBIHy49s32UQNo+?=
 =?us-ascii?Q?vH1Vg0cEo+IJyTOrb6cQk8NjORs5vBsjotCTLKG+d0qLoN/0IuedolqC/Uy0?=
 =?us-ascii?Q?znPCHVxA+OQyreoUwhF4yeYkq7xjBchITEQJEX0RnabbkmdOBm4mG8IDpj0c?=
 =?us-ascii?Q?+UiDTxHfS6h3OfFbobmlS0MtP4o5lpKJEHxs+lzJhkZwGfxYkvS5KrmHXknI?=
 =?us-ascii?Q?JSHBrFfzot5d4sAPBXuE2j0BGGAkPCJUs8ZwcuvsHbz8+DrkFo57PmLRoEHd?=
 =?us-ascii?Q?6KsPqdpfNDHuize5MMC4Bb/DYDHYlG/o0IMXGI1iSS6nl/KA72TWgD/7FIRV?=
 =?us-ascii?Q?iNafskDCuWFbsliD1HW4EqVm/W5tq8fwNO15xB5oJUTsoedVh2Zdgrt2+QNj?=
 =?us-ascii?Q?5PVTd4+WUgoUysrmFai8GSWzHytTEI5NtD7k5roARSgqIve7uWqZrSS0M7mF?=
 =?us-ascii?Q?mD+qL8pYjDR9Qbv/7i3ljER6XDrHe7WE+ysTdeQ+4v1VhBEbSR1RDPIwW8V0?=
 =?us-ascii?Q?gwegGsWsGhLfGkzpqKEhCGLwlsz9BzFZYNyMP5fnE+hut+kOKkgetFydpP0k?=
 =?us-ascii?Q?gppY8F91/ig8VASlDDsYovW1gciewPwhl1DrfT1jUt2leOsrTevZ18YFFd+z?=
 =?us-ascii?Q?Jk7xSPiKvGLweV63VSqzrPDTKokbfTW8r1bVFiRfu3dEg3aoQ3nAvsrsTRr1?=
 =?us-ascii?Q?M7NmqKlBAb6Yy8HqvCIFuuk6VPxXg3IN7/MtIk/27qvo2oWYYKZtgXXCrd0C?=
 =?us-ascii?Q?GjpS3fJdt7UgU2Lrtaklv3NBqsIH01dJ6k+lClmm+HX/TzIV4CZYeuQTeeND?=
 =?us-ascii?Q?q4vaTlQS8jj4bo2rv07jvHAbyj8L3o8V/A2Q+h5/inoZfRlr95DbIyhMlL67?=
 =?us-ascii?Q?H4Xp77FxU7pL9KwR/0f5aE5HL2VH2Lit2dAvG8D1lljBUXdQ4QUECerEu81v?=
 =?us-ascii?Q?hzQ1+0om/5MMwNqZ7ABtov/R7szuTeh7eJ2zEAszzCB+hFJGOvqjfINAFIhd?=
 =?us-ascii?Q?YDEp82mX+7X62ty3UmI2QZls31/0hYLb3tnJ4tsKQuddYi4dQGELqKC91VO0?=
 =?us-ascii?Q?M/q+oeyft8clC2etdcWASzj8PzRO0y+WouLBuGe02Sfy4l2AGn/w8R4Xztzl?=
 =?us-ascii?Q?y4YG/QNWn0yBKjcGdddcCcBeAu6kIuE2u6cA6Ik0GjfYjPDy0ZAhPMQsFnbN?=
 =?us-ascii?Q?cyIRjPYnD8ShdUtKtHrwKKQ0EfyDcUyNqT9EOzMJ+hJRBS3qedArXrVU05Ke?=
 =?us-ascii?Q?N9gRAvNW364sBd1RcpLdoDJAOhr+Hm+cCIstCVA3AoC4Zeoa8XBQjzjhaAnd?=
 =?us-ascii?Q?ghOzFRoFWrUMLNIqpJIrrNqHNCxURmCF/YqdWJi2GQkFmeM/5Fh6TYlxe+N0?=
 =?us-ascii?Q?FzebYHHhB3zSwXniQHuwjhug/7Z01IcE2jE105cCJqtKSljlBGY+zZejS88C?=
 =?us-ascii?Q?wAoOiXrQXOU7htGbPRjwK4JNL2ZYqw8KDMuVkcxuMoRr+udw312W7kr7G6a6?=
 =?us-ascii?Q?3j4MbVrKl8emTxw7P0NC9/YkJ06igMrfIkLJC2DHuXEwsQ7fJEVltRgfq/F5?=
 =?us-ascii?Q?3kIJ1fjW85eBWcn6K5rJiJ4wk4yZpHe9LTfvXt/rLZv1+w2H1+7iCZbt303N?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5523486a-eb0e-466e-96b0-08de06be35bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:58:36.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqCoyHXazV+AalhZZKml5zEDAm7t9kyWMuT783N47jSH9/qvemMWeYj1PmKQcMR81NVl7rhLQlpCsUzA3vxsUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> chunks.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V4 -> V5:
> - Fixed review comments. (Matt B)
> 
> V3 -> V4:
> - Fixed review comments. (Wajdeczko)
> - Fix issues reported by patchworks.
> 
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
> - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
>  1 file changed, 72 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c39c3b423d05..b629072956ee 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,7 +5,9 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
> +#include <linux/cpufeature.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>
> @@ -33,6 +35,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> +{
> +#ifdef CONFIG_X86
> +	kernel_fpu_begin();
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	}
> +	kernel_fpu_end();
> +#endif

Everything in this patch LGTM but I think we maintainer input to ensure
we are breaking some rules about inlined asm code in a driver (no idea
if this exists) or if a better place would be somewhere common. Can you
ping Lucas, Thomas, or Rodrigo and ask them about this?

Matt 

> +}
> +
> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> +{
> +	u32 instr_size = size * BITS_PER_BYTE;
> +
> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> +
> +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> +		memcpy_vmovdqu(dst, src, instr_size);
> +	else
> +		memcpy(dst, src, size);
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>  
> +	/*
> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> +	 * save/restore while this sequence is being issued, partial writes may trigger
> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> +	 * write the sequence atomically.
> +	 */
> +	emit_atomic(gt, cs, dw, sizeof(dw));
> +	cs += EMIT_COPY_CCS_DW;
>  	bb->len = cs - bb->cs;
>  }
>  
> @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * emit_atomic() to write the sequence atomically.
> + */
> +#define EMIT_FLUSH_INVALIDATE_DW 4
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>  {
>  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> +
> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	dw[j++] = lower_32_bits(addr);
> +	dw[j++] = upper_32_bits(addr);
> +	dw[j++] = MI_NOOP;
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(addr);
> -	dw[i++] = upper_32_bits(addr);
> -	dw[i++] = MI_NOOP;
> -	dw[i++] = MI_NOOP;
> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>  
> -	return i;
> +	return i + j;
>  }
>  
>  /**
> @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	/* Calculate Batch buffer size */
>  	batch_size = 0;
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
>  
> @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	 * sizes here again before copy command is emitted.
>  	 */
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u32 flush_flags = 0;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  
>  		size -= src_L0;
>  	}
> -- 
> 2.51.0
> 
