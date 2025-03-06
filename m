Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D59C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 06:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B61210E8E8;
	Thu,  6 Mar 2025 06:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epzXtHi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F8510E8E8
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 06:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741241057; x=1772777057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RvLNwgJtDhr7Bp4R3GneVA9vaqI9app1DecNBWJsBPE=;
 b=epzXtHi328gkH7PclQfqvxIncSpJLndT7aoW1z5pd+jHS6x+dwpDmIJu
 gpICkbJdDaJIpaIjQC8Ate3OVu50W4LwPSDcyj/juJWByeTSCCLBP4kyf
 F90ZMrT06iUFyqE5S424t9DzTTJC27Vbq6DOlBG6FuuXgFrwu6UCksL6i
 wZe+Vjp0U4yhSedejo/+KpL9iiISP2yMHZrAXv52KVbQb6HbQoDq/V2aK
 I8YpnAo7fkrjyRXsEMKzfmi5Q/PfT1inLoZAcf7NsDATkHJi6PlDTt+d0
 5Y1UUcbIUifvpZ8gxDfpZVzsoS2nUii3q1lyPxog3mA8EaiHdmxUVKIIG Q==;
X-CSE-ConnectionGUID: Y+vwfAvYQB+g2ZUQsa4pxA==
X-CSE-MsgGUID: +U4QsgCWS52XGjpPVy7VyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41409804"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="41409804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 22:04:15 -0800
X-CSE-ConnectionGUID: S3KgDvd3Ql+RWDHVPwf0IQ==
X-CSE-MsgGUID: /7z0QuIYS/ms2Y26HxY4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149851321"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 22:04:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 22:04:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 22:04:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 22:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UD8ZwvRU1BDLJ7Ovr3/WWjoy6Xe6tIFdNbzaiEoVs0ngU5sDnwLuEGS8Ss5xZwAaPucu3j1sRkZ4995dkiYLDHhKdReSZQ5/ymgbrLnD8lAYyEaTYigfFnTAWxAWA7l7OUUXV9vqC/jhEAPY9BsYuqD6MME2DXRPEONiZuutL1CHM3NVNaqQBAiCqNF8n4hshEPDTCTDEwsCSWBASaJc5DvXW3vG+4WKXDED0XRvuCqsG3atP17Fdcr5FLZYPRKPZrwDTkw/M/wYVDxI/3zclo9nBe/npcmJA94UdkQt/4FdEMxQxsyx1HlQ13nEApOt6e4y8ZXXOOJaDCNGe4IcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AueQlZR/RRzkt00RBZL5Mel2vTi2R30hymtSk+6Njs=;
 b=llW5lSneRLgcFExjs2txmr8KGiHdrLhCZR3ytY8zgMgGxOPWxQyQbu+EJVdyOiTE6otl/SGqnE6MYMf/XIR95mk0VCPUszhjYnQ7qxsx/riaPU4s8p6SnDEXuuQVrwhWNndP+OqW51X4VSPQqoe5H5x3x5zKNSfsjuT8YjdZ0hTLZhWaoC1Y7/e5hySdBpsywoAa4sPli9XGFlU5bduR0j+lKJvaVPjq/ULKhHGfHjvBOUAg+OU8rjUoDg09FoNMZS+ydZfVdGRvAQNCgklQISuD/902hcknON5nQb1RK1PvtvR17MofOfx3bco1xjZbIlXCjWI9vJzKLY4SMxiFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 06:04:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 06:04:10 +0000
Date: Thu, 6 Mar 2025 00:04:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: fix enable survivability mode
Message-ID: <v7b65hpbmftedtbgq6qggel2xcvyal6wmxukx462rp2a75464w@5blgurlukprs>
References: <20250306055407.511405-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250306055407.511405-1-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc03478-ff8a-4297-0501-08dd5c74b631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gNS6D970UtXYIdNs/gcKoUAAvxW/y9ejsmscdYEMdgqKV3THSwXjWqPm3VMh?=
 =?us-ascii?Q?9hG6CiXyssiNeaSuPNTfOjf2Dyp1auwUyEBRKE8ZM1+XctGkvQ3Y1Eaw5tdA?=
 =?us-ascii?Q?kUoBhaDIJrWMCGIH30hTpa189yF6EyTY/K9nkjLrBrC8eT613SMZRkRvmPve?=
 =?us-ascii?Q?NcIxPN/aQqUs/M5yXOTHyOFxvyAPyvlDaObD1sKFgBtzgIHbR//hrZN5gMpz?=
 =?us-ascii?Q?ImMkP2WXZv9MkTLjNaYHSMkvJVHaDLI8WC731sU8/V5FCTpAnomaZSvmRccY?=
 =?us-ascii?Q?FkXyOjGyrjzmNGZWkzZFCtNpFXiZypLz1tyHiXq4b6xTSO8Xf7bFj5nLq3ZE?=
 =?us-ascii?Q?JjPnp6u6x6jiK2a8ISFP6EBKCWl5wssFzwx9MHXMWiEoO0uoBLqS3My5kByb?=
 =?us-ascii?Q?ljdTf7eeygtxOAVP5Znfru69isle75/sL96rPIYLwtKNS08ofNNjjptRaSVt?=
 =?us-ascii?Q?iiRjeXLkpQ0YwexNH9Dov1HeXWlcsIdWBHsAU1nJQMRMuGQMsNCIOwjx5Te1?=
 =?us-ascii?Q?BZfnmVKATuBrlOcv9S06ONkozmPeix++K+/sQQEz5hEXerldnoa2roYQ0x3p?=
 =?us-ascii?Q?Kzn4Xn8xuLRVeHUmopUBBxBXkLWzzGK/Z19Jgr5QXMYNZ45cOG8v6K3BtpCt?=
 =?us-ascii?Q?5Q3A8niiifbRFn8RcKONT7OsOZYa2CoYH3B8CfSuQqGVh7Ex6cShm0Q708HA?=
 =?us-ascii?Q?lsdpQjW3ouR+ZDMQZxb0x0m8GD5ZB1szJkakc9sofEAZaJTXLNu9aPegAVaT?=
 =?us-ascii?Q?YzwLs97ufSmxdvvTk9JvUnCBBFacKeZdPsXnsOcuP8uOsswnQe7vuagMP1ZA?=
 =?us-ascii?Q?wWGpJdpkjJOHZNpniFnn7wF3C1MnTt7C0A5WRw5HlwfSMVTD136bjNVzQJDf?=
 =?us-ascii?Q?fLbAztlPFuj8E9sMRIepr583RQNrrmB6y5YBvfVLznsKICV639l/jf94Ax9c?=
 =?us-ascii?Q?U8NJzOcth8dNbS6YAHqU+kCxFxxZngUPm1Qt16aetWAXD+sBgNeq+2zz/g5U?=
 =?us-ascii?Q?a2qzR7dgnuFIZ6QnoQ+xRtuJLgex7wKwcVm3qligIPW3xrcTbFLdLQ8ARBx7?=
 =?us-ascii?Q?Fo2J+wXbcrOvexitU/aHACSc4hOXD0hs023QVwdRtfxqiAIboD0PR3DVswN7?=
 =?us-ascii?Q?bAN5khxSFUs3UloXvD0lXQM7QCqMFXsqMjiOY8y/EvgV5JCNbOyce0dRwigD?=
 =?us-ascii?Q?7eaMDOvg6inJmIVKBIw2hdF6YUEX+RbuSlL503n6Rr/PqApHg98Iv7tuL70p?=
 =?us-ascii?Q?bAkdlGVQHnUX8adJsI9aQT4qzct2/XcxaH+7BbKotiw1wqRqv9FdWs68ZErs?=
 =?us-ascii?Q?Vv/v07iN0MSVDAofmzpIwUcHMKeyddtssYy7K1djHEpIz3QmeiBHbneZ67LM?=
 =?us-ascii?Q?UZBxjLnaMZ6wUSRWmowLHZmR3ldo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PInOkaySgL9yX1V1/kT6Dq0zd9wHZHJl59MGn+fTVrotw7k+5g8bkF1v3+dL?=
 =?us-ascii?Q?WCTfAyQmFqeWt9xyI+CwpGdeCtkmnW08uk2JkTAm9IpYmuXUW4HUG0eh05T7?=
 =?us-ascii?Q?cSw7doNNaRS0hmK3NXjoCqzXzYgQGiZvMPkR3Yde+Hi3dyusSpAH5vtF9tSR?=
 =?us-ascii?Q?n59ww0/JyECrXB4xsOmbJm1/AmC6mVLPuQqejxhYkbyjpa49i3P7ZYBYS/X4?=
 =?us-ascii?Q?mzL6wYbThjgG/2qkEXbLNfON19GQT6ebGBooAZWhgBZc0oY7T+/LH8ieWKN+?=
 =?us-ascii?Q?zsQUiKn8fmBIkCLH6WHpZkQpyjcxRKTI37+sjUHPGlpHO/leIKnMmkOH1x2D?=
 =?us-ascii?Q?aYjVwCTyONXWl7P+/r2kpK3tWkm2UXNMoLWNXL01lHJwQvVH/fagW3ubCjaN?=
 =?us-ascii?Q?SvXY5NQg9aJJ2mB4BNWcgvA54+UuAS5wh3akAgRMiwD/Uen0dQxbUub9Uz6H?=
 =?us-ascii?Q?pqrKjO3W3Wj0kXe8bued92Ks5JbROo4ItgoREWlbZ2VmVpXZy/cxy60dKuZ5?=
 =?us-ascii?Q?EhjrbcwurfRLO8r1eZ040vShNFbiGfsvpKoYOTXuOJQo4mEj7j2Hz9Ho9t6X?=
 =?us-ascii?Q?3ol+DE8PacPpqe0ce/4kPVsgW56Oc2m9T7Prg/N09eopuundWZZhwpDu0w3F?=
 =?us-ascii?Q?88ooeY81w+NL+Uz2bC4koNHIDQyz+9wma647B2zzbfC4Osz2lzZJqI4oUNeM?=
 =?us-ascii?Q?FqFPdC6aSbzXsDKXKVC1VZkqsvF0baN+g2fwS6MkOE+ro4TN9d9swnkd+SGl?=
 =?us-ascii?Q?CCytNcVF4o/J/MCrnyF6/oDYcUZWMeAlajbdrwoOaAygUEL/wqy56kRcN/Qf?=
 =?us-ascii?Q?DHZVYa5sEBChBlMn28NEk1jYV3cDdILEbfEo7FsnnBg8m+P7qOqxEwU+fc+/?=
 =?us-ascii?Q?c3h8bVizymfxsQ4HJs9TPFM5DgR9KbQBOVp2/30YTSItojqxetsywZJ+6sw6?=
 =?us-ascii?Q?cp3MvZlLxv3Mt1xqdOmsqGk8R8cReUCQ14oUHJ/APs4TGxFunHGMrobTJoSU?=
 =?us-ascii?Q?2ysipSXI940/7N2hWwJHmmrsrCZ3r/lNtj1FEOBblC8Zvu62yDiPqz/P5NNW?=
 =?us-ascii?Q?rGmoJ7z8oN8MM9Iciz4/PIiM/w9w0fP+hFRSxZBRzEIxQeNzcuu1ESNyARK2?=
 =?us-ascii?Q?Y/FKNnjsue5cnKBFJXa21wLYi64vsMet+KhIRho0uak91XXvyHN/8xZjHjRI?=
 =?us-ascii?Q?BiZdnTpEZ5x1S4rxVzpr/AKfCguUUJ0mypI1rAUjzZ5r90/h7URF7BKa4Hfm?=
 =?us-ascii?Q?KgqJpofaLH47dis6DulQVwoGWRR0gifCaVBUNGBaNpfXyyxgpeNj4RSQst3C?=
 =?us-ascii?Q?TlO3lmF1Xxs4kVhmu7Rn7CNGlSldApmSiJiUyR8Qhs0pooCxwGIHuM8SAy1a?=
 =?us-ascii?Q?JYI0VxNPBleXMb1j6zX6doLUDhECDWkz9PbGL1Ai3+Xx6cXKpMLT1vgYEm3S?=
 =?us-ascii?Q?XF1V1aU71bJQ0LKmc3bx9LyveFbeveQVsieIpsOVQyCnDs2am2+JqTydad8L?=
 =?us-ascii?Q?VqXPXy7cuiP6Mx9LQMZXXW6HTHeGtGODCZbVQPdNORGmgoLQsR6xnwnkguAK?=
 =?us-ascii?Q?nxPqiofB5PXinDhPeos1a9GEl2DGXammfBeBugQLuo3jkfsI/cX/eAUn4B60?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc03478-ff8a-4297-0501-08dd5c74b631
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 06:04:10.0872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thfNpaKRzQBuN+RUWD5q69UrTT8K1Rr8Wehc4+u8387Cq8RUehXDGHJInY6w9iha4bZ9EeyhiqA/6Q9/1EKrCoaXmtDjrMuDka0rwwHyACA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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

On Thu, Mar 06, 2025 at 11:24:07AM +0530, Riana Tauro wrote:
>The current implementation skipped entering survivability mode even when
>survivability enable returned success. Enter survivability mode
>if enable returns success
>
>Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 6b5fa067b39b..ee0665e54489 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -857,9 +857,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	 * HW to be enabled. In that case enable it and return success.
> 	 */
> 	if (err) {
>-		if (xe_survivability_mode_required(xe) &&
>-		    xe_survivability_mode_enable(xe))
>-			return 0;
>+		if (xe_survivability_mode_required(xe))
>+			return xe_survivability_mode_enable(xe);

ugh... the mix of bool and int above threw me off. I remember fixing it
but probably forgot to put it in the series.

+Francois

Can we inject 2 errors to easily test this in igt?

1. xe_device_probe_early() to return error
2. xe_survivability_mode_required to return true

Thanks,
Lucas De Marchi


>
> 		return err;
> 	}
>-- 
>2.47.1
>
