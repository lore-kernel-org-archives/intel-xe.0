Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AEEC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 02:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5597210E58C;
	Thu, 11 May 2023 02:42:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E61010E58C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 02:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683772954; x=1715308954;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8hL0+hKEBAv2nD7a7y5VIIODxhZzdh9e5wnGOmnsyTQ=;
 b=l9DCTndthCloB3XNioU/vOb5p4NS4m82cJ975WWE0Omf432hEaCdA+e+
 FkWPMTj7F019mvzy6a/cYXtvMNsYK9oxLQMROTbvcYR9a1rGfiNZbaqU2
 CChOwU9NiSlIyV9a5aDHZn9IBDaTFR06YsOl9xeeeLtqUC7+J3oHOvlcg
 DbVREKA0jf5mvoyhQgqmmO4wLzqjpExiuUVPvIjOMXPkZ7TPFwJyU35Hx
 VusP1GvNh94YZwYoEMliIzQ1/PkRsc6veuwO9KFBhIBeN6cwS4+Q8Xomq
 fzRg5PxQXOEqTdP2viKAvmNdQ4UqaxdDWhdgrRGUHnLRWunUenE7JXCqw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334850243"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="334850243"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 19:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649966109"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="649966109"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2023 19:42:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 19:42:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 19:42:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 19:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vux2KC2KqxtC3BFEaJQIoXRLV5bK/mGtlsmKvIU+qzQrFhHFzlcr4upY+CMiIi4297lknI41QnPuY57kxrrvxe6aZJP7dHJnOtyViw4K4BTE5CxwHKr9gEmAcuGJXDGUa1etKaEPP4U8YG80QrkftlRYv4qKI0nSSdDqCWJklpXvjeAtpV7HK3gn83uOMP+fS8bnmXaiMcbkxYiTTHy2E+wTjvCbWGjXCLxUo7ErosUYmm6HEgqNlDr8Io3des1DLPEUlpXva2MDIfrg51AcpAVcHiB6M6+sIQVpzTe1jfJBW+U97Fx82DlOOBwJo0BkKQZRRiQLSaMmb3zFz0sHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93CWSCTzJc95Gw0SoqqbWdmbUJvHVO5pmewXVH092z4=;
 b=ATerHLs+t2dRLvOZ0tamMx6JdZ8ODj0BbzC+e+90SVe4kLC5cGlYUou5Xnllmi76f+SLraxfgDyT0p8NEmNT/HFED/PvQJ7S93FnDLjr3F5u/cU8oZs2UyzD/q3bS1zrb6dQDzL3zzDz+bzGYxCaBCe4Joa3wq7ZPRBnsAvmeMQYUYJBWODvVwKjmdPSqx0LRuqPplGLnmBLvz0y+peRoQ6jwOW977+I/b8U3wz/JLQj3cmDnDiJmrnzDW39bGWAz0muJFy87GcE/g5004s+sAWEi+YFp5yvymiajYs3DbfWU/LiVQ4nDBCeI2gIiBf1SlvOJ/HKiiHmecRbS0nzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 02:42:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Thu, 11 May 2023
 02:42:31 +0000
Date: Thu, 11 May 2023 02:41:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFxV7ko6wKRvFF3W@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-17-matthew.brost@intel.com>
 <87710316-f6d8-5fa4-e320-7c2a1969ca6c@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87710316-f6d8-5fa4-e320-7c2a1969ca6c@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ef9630-cfb5-4658-1427-08db51c95da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14KE6R/gHN/GlPxkh5q9a3b/nxqQECEsvgD4EAsZH2bFqQek467aBXi2D+xZDy2nqu60QrF1oBx/XxjAMO1v5A+CiTEOg+jfGrRzjxfee+LEw689/3oIb2RUB57IAvzphzCfYoZeD+sf9MXr8xTjSoNVDKzYW7ZzJHUTwZG8GEXIIjpc3AAa2M7ewL9YpK4mhgDmMgEARLIU4lbl0tLQXb+LG+7p79AArs+5o9Gg4OFKz5Eqi5dAJ2KbH7QCorigCKpRRVTM7wpmlFpplEcPCfH/j9PRp2uBhFNk/2aOVD56ijqYMAnO4daTA8F9RHVgqbcODZ7V6ZX8OYXFEioX/bHqO/N9Q0p7wGMvJULG3euRyJZNtdFXMoqA7/LEI/15qRFbbYoU9sX3+6qQb3hfXLVNfU04oK5a+DwUEJ40IXqv3AznTxE9IBY3tFklXRghC9iLjV+EN57+gp/aAeecLVVoGSZLdA7vAn9sXFEp77a8fHsefPKZeaj0R+hCvaQWy2Uiu+ZYg3zdofk27Ttgx2xjHtq1YgDagsg9fp6h2KN1aedKeXnhV3+/bicutdZL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(8676002)(8936002)(5660300002)(38100700002)(6486002)(44832011)(4326008)(6916009)(66476007)(66556008)(66946007)(82960400001)(316002)(478600001)(41300700001)(6666004)(186003)(2906002)(86362001)(66574015)(6512007)(6506007)(53546011)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gWMkF0gtzXVcBHGIRGlEI/JDuOD8dJKnhxSy8jwzDAoQYCZHboSVLBkCYg?=
 =?iso-8859-1?Q?2uLnumlsLUIco6Hv+5+GVemc8sO7urGIJJZHtC6dr9HJ8ovXPydk4Pnt3v?=
 =?iso-8859-1?Q?m+GewObu5NNWnCnpCzGXIvZ6pFBZT1QzwlQ6Vrc8kIUNvLFXEj6+oocXcC?=
 =?iso-8859-1?Q?k9p0z6KdkykV55uPxFLbaA/UyjUjQTFF3RFprJvb4aloKNEuywBsuB7ZEF?=
 =?iso-8859-1?Q?5hFSZcjY1Ldl0PdSVm2vShPKVkUSlFYLHD1F9WbrqedWaFB5QkmRrmiGeJ?=
 =?iso-8859-1?Q?C30T7e/eimlLyYlOHlaUWEci8iuuYEnbAZ1zjG+dTYSNoWesH2t/uWHJWy?=
 =?iso-8859-1?Q?OjsH+zgpU8o6Q1mVXk71iujuWfQYWUTy/9T31K24EidY1F5O2P3A7j9Nv5?=
 =?iso-8859-1?Q?GPC+s+Y0ZKKC09sKQdMEei5UwjNs2TTlrXfqFCKomjsrGLWmOm3TtDozoi?=
 =?iso-8859-1?Q?e6GvgWczto21uB1xLKNTjvw6ebMvDnh6sSWtV8hXVuGSYF4Vr33NyU6C5P?=
 =?iso-8859-1?Q?ORbGIxRa7eUtbBJOvmwZckokgq4nuQLpeDDlQPt1u2UMS9pwHve5aocjYX?=
 =?iso-8859-1?Q?aOKf0clUvFmzV26/OPRwNiyUHo1Kw+okpLU2sCaUSXXcaEycztZxNZGsbK?=
 =?iso-8859-1?Q?2cBf8/Bz70aSEzsJBujDZYmx9fO7TxCB7jSKpFGfp/tiS4a7o3HXRO2f0U?=
 =?iso-8859-1?Q?UbI2AHSnUAe2ULV6nVUVvah9H8Z4vu5U1/k5gNBrX5oO+BNIi2u8Df/FCH?=
 =?iso-8859-1?Q?rO9dTIi8Vyg9yqa7nNhpH4SLvdfqGLjsqqPRb2nw/uHFSyrwjfiZZrOyez?=
 =?iso-8859-1?Q?HrvPmLwjRaMsRJKs3zj5qKWRV1ou+XW8zM3BW5FUGoH4p+Ahp2rZoM42R+?=
 =?iso-8859-1?Q?AaF+EYNgwKRrjey0hatXNPDxpA0H5HD17yAmInRScD1nt2PHMWbK4Ju5hl?=
 =?iso-8859-1?Q?k+h7SRfCryUaFw+5WZc1guumTS+mEPNaslGXvb3HCpsWluct+bhBTFOacD?=
 =?iso-8859-1?Q?GZDmdOFCbsOhleMswTkO3JLYKKFhfm9+patjK+VbPQAfyrhRUQaDi/0uvJ?=
 =?iso-8859-1?Q?a3uslOisJxxhnCYA4Dw25CFFWEPFWSGoBFmiPRpIX0aql3Sw1E0xLimoJz?=
 =?iso-8859-1?Q?l/pt/WS7OcyqLBrJ0e6tKLKXuKc6DYbiqM63XkwOQdvUXfdSUuPxWzWsOx?=
 =?iso-8859-1?Q?vtlTBeN3O597/I/RW8PR6HloSuYEXydKwd+AMcTL53Bje0OYAG/FrRIyhG?=
 =?iso-8859-1?Q?zyNOIjM4n+CDRJHVuAK6G0tFv8DFXWjo510oQ9LkfKaRFx5Mm8XrPOcMpx?=
 =?iso-8859-1?Q?4pwLGmLzBTlwl/kdqN3Gzaf11ZTGUOkIZajDVVtpNkuigNOx0wCQ3eHiBf?=
 =?iso-8859-1?Q?UI7WzZBUAaWWKy978GykZ4hl8DZ6zaD2qdoyC/KkWvPSIoYtXH9UcCLNJ+?=
 =?iso-8859-1?Q?GlmG+bUnBfSqXSf7pD1e9JO8A1xlWfMiO2DDgrsF3UU8pY01Otb5AkYXZt?=
 =?iso-8859-1?Q?2/TuxIsE9cy6Ad+eyini7dga6Z6cbpZ76tvYMBH7Cntx5uAq63KUrELz56?=
 =?iso-8859-1?Q?t3HLt2cpVu5DTVof8CyJDz5LMAC+Eu4G/UXwOmMSum3yDh9ZDfuITeO8Vx?=
 =?iso-8859-1?Q?4KAuiaRJQjqNf/16s37Ks6ipSPMxpsNXkAgsD6II7bZuENjE7HpFkGZg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ef9630-cfb5-4658-1427-08db51c95da8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 02:42:30.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SoE4t3RQ/qEAtiVgcgHMJvhqUAV5+TLSXr2C+oZowVTb/2kUGABQ1YgcdbewUd8KKLKpNuiuPmzIyennjh2Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 16/31] drm/xe: Port Xe to GPUVA
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 03:52:24PM +0200, Thomas Hellström wrote:
> Hi, Matthew,
> 
> On 5/2/23 02:17, Matthew Brost wrote:
> > Rather than open coding VM binds and VMA tracking, use the GPUVA
> > library. GPUVA provides a common infrastructure for VM binds to use mmap
> > / munmap semantics and support for VK sparse bindings.
> > 
> > The concepts are:
> > 
> > 1) xe_vm inherits from drm_gpuva_manager
> > 2) xe_vma inherits from drm_gpuva
> > 3) xe_vma_op inherits from drm_gpuva_op
> > 4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
> > GPUVA code to generate an VMA operations list which is parsed, commited,
> > and executed.
> > 
> > v2 (CI): Add break after default in case statement.
> > v3: Rebase
> > v4: Fix some error handling
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Before embarking on a second review of this code it would really be
> beneficial if you could address some comments from the first review. In
> particular splitting this huge patch up if possible (and I also think that
> removing the async worker *before* this patch if at all possible would
> really ease the review both for me and potential upcoming reviewers).
> 

My bad that I missed your comments on the list, yes I will address your
comments in the respin, expect it by Mondayish.

Removing the async worker first doesn't make a ton of sense as GPUVA
makes the error handling a lot easier plus that basically means a
complete rewrite.

Matt

> Thanks,
> 
> Thomas
> 
> 
