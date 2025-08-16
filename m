Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEBECA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 13:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8333D10E070;
	Sat, 16 Aug 2025 13:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3w3KJrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62810E070
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Aug 2025 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755352341; x=1786888341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sRmEtUKPmCPuME1FMFXOdrk4GE0DdlZS3rtVLrrPpg0=;
 b=I3w3KJrWd3MRxDYxDo2ZzNVCxKzqQXF3erDWqrpuCpkzWo+LYyS3UI/g
 jDNxXsZR8tHWNq7xGYkHpFdvniC0L9ZQ3Md8D9x8y/P33BpTLqlNaZnxp
 2smBd4tmlU94oOG2k90N4Q3VyTg3zzrQtFEqFhUx3bJRea3RDr9pKHpFQ
 ON8A6BUuMPbJdufoWQ8JayId5jCpkb6utPlABHqU1fsAh+k92ILjNygV0
 I+yp83BPss4HR3sVKI0YR83958NGV/dcwDH6vBu16toOnNBnoiKNhEsVJ
 t45f7J5Q64aVsjbXyiaaF4GZGzny3pupjN/SGU17DTtgIls+sVMFVDLqa Q==;
X-CSE-ConnectionGUID: VSxTZmsATmGe4Y3++kWyVQ==
X-CSE-MsgGUID: fU+V+oyoSYCBmLuD4v3I5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="56670494"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="56670494"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2025 06:52:19 -0700
X-CSE-ConnectionGUID: kqgthz+2RFWuljnex8uk8Q==
X-CSE-MsgGUID: TfM+T5rXSUmFO1sJfECGug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="168029414"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2025 06:52:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 16 Aug 2025 06:52:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sat, 16 Aug 2025 06:52:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 16 Aug 2025 06:52:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWdiQnxjUM0rsjlrPQtuSIflIsqH+fQog/8R5ZPDx+EzjmMmHGMzzJRncqybtt+Hlz3qxVpfJb35jP2A6X4vJ2ZKIAKgVfryKjGbXZilpWw6VsubY4zjHT54TKy0+lTw7x88Tbfy7C3MHgqTqOrBR2W/6vjOOC3s8rUApE0GmZ+79hmbhd3sjcMCod4YV6Ay5aEDz0cEpk/NMiyNB77J2tq2Aw7REBiEpA7akqbAQx5qGFa8sga0RsKgfzmsoIljSBcLhTZbgtlV66uvNOunca8Mhk072XvhNnVrNxYmYmlim88rxog/9Rsx1nVNWhAGO9R+mj+j1VY1ZFl02c+dVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9YPSIT5IvwogHR5NhFWpf+zu/ufwHTAxp3wMzNsOn4=;
 b=HzcJ81FolaiNsERkf9FPz2wIaznZ4GJZYTA/XWRK47gaL2Zg/djF2UZ7EyWYuskuoUjU4kRgMzmhg0p1DhgWWqIvHKDCSKfreRFAPqAfex37c8lb17D4lXCpQTwceNFj48dp4TL3ZDAI65Al8P0e0mhUZFhVEnOkyeqGJT5iy6UzCYcu6p7gEgVluJG+9rIhLv3W9eoF9ggGbps015v3u1Zhjs5LLpOCjR7mdUSy6EONdpjWdxrOR4vC4QdA/VrmC3K/EGHm7GuKu1foPUPH8PiyiLDgS6nRcMTvaiSmiYuToBvP8TY378bjJrGWaZxWoIzwQTVoFXCECrrICC4+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Sat, 16 Aug
 2025 13:52:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Sat, 16 Aug 2025
 13:52:16 +0000
Date: Sat, 16 Aug 2025 06:52:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: Re: [PATCH v5] drm/xe/guc: Add devm release action to safely tear
 down CT
Message-ID: <aKCNDRvVrN6WOQg9@lstrano-desk.jf.intel.com>
References: <20250813101225.16638-1-satyanarayana.k.v.p@intel.com>
 <31188898-5f9f-4c6a-ba78-cedbd92ead9f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <31188898-5f9f-4c6a-ba78-cedbd92ead9f@intel.com>
X-ClientProxiedBy: MW4PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:303:86::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: 8013da8e-3c2d-4db8-15e6-08dddccc1bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RgtpV15i5MCLgRp36s/+i497jdh534ZM4c+2H2pO+69Ueb1yozpmFfps9Qnn?=
 =?us-ascii?Q?2eIrstR6tR4EWxsQNIQLjhdNqQu/AEXUB1D/3uhycH3jjqSFLEMX1sg4wYzk?=
 =?us-ascii?Q?btUL6AUiJ7gWY32cqtZwCiVwv4qkzOPT+SQyZwDfuuxUH2IcybeXgaostwBL?=
 =?us-ascii?Q?luAuj198JEN13tUztma01Z0i2C317TBg6LPTQ3GB3hrdYJK8XAmtUm9FNNiJ?=
 =?us-ascii?Q?NSb+Ise1r9DoMgdhIXlhOsibMGsbNbZyepLhBiDTD8ZqzqGLGATbuADl9EQa?=
 =?us-ascii?Q?6Hiq6cO1QVGWEStfNRTPeqHHY3wo7yv53v4EaHQ/BIgBWxN6y5D4nQPIkUEn?=
 =?us-ascii?Q?SLsM3Ngtr5to22YfOnAGdE1uSEhQ448siki5JKg4dgDCwC9ZPkuG9/JkKJM0?=
 =?us-ascii?Q?DgNOd7LZQlvgU99aLjLygjzlrzH2rxSwfSNgacPHL6RbtfMCOzhFnA4nl91D?=
 =?us-ascii?Q?pXDGsKOmwJp3kb+RXth30mWdCMKdf7S/2xcVJS7Qdd3LJiHdeY8KElZdrdkY?=
 =?us-ascii?Q?H6C38gIWzvHHwUxxFx/eSvqdehz4f29DN3axPj/XcG1CTUwuDBww+6zZ8Uqv?=
 =?us-ascii?Q?0TmKAJjv1pw7nKazgNfuwiiM7pktOcWn0+z/xCG2SgNsKfcHnpchCDDzYqAC?=
 =?us-ascii?Q?oc57gOyOieziRAa4qSgoqexyhj0QbVKvV8ZjpbccvNUnQ4XrJPIyk50N5q86?=
 =?us-ascii?Q?jCmbuo39/BBQ+cctoPYVmkGhr+Dpj69FaQ5oqFTIeY+TiBxyM8ojpiDL8BS7?=
 =?us-ascii?Q?nowWbEY9JckVd0Gwa0byJ0B8RL99HEXUCGnBrxhMvd35c9TOj9q3EcwyQZ1F?=
 =?us-ascii?Q?LxG5WdURgdssZKLWf603xrfpJgIHCQJ6hDu2LygTrAryyMXcaUZeLdfNYWod?=
 =?us-ascii?Q?O3G+sJ1Tk+byUhKXbKmcLawK5Q1HJDS6Us0Qxm5EbS6q/bJjpS69aDYmatbX?=
 =?us-ascii?Q?W/+kf/QgOaNPxpE12RLtv1RRNZJY+CmlwoPQwNAgZJ0rR6SJblZIrbmHKSi9?=
 =?us-ascii?Q?0NkTKgB8LsrQ87/bdqVo+kpY3RlTYROXnZgndBIJIhcsNaosxaquF4XYyfvV?=
 =?us-ascii?Q?vpUBLmwNlO8Ok8aApcp+XlUatu90NNZl/bCxNmcgprnyEQnlf2PuhsP42wey?=
 =?us-ascii?Q?OdKIeU5FJGIE5joOEweenfWO5F109ZFOB7MT9ysfXnHIUeAl2+UJsb1tJDhV?=
 =?us-ascii?Q?Gmn8VeciK1jhaseibivQJm6Rk31NHAD1U2aUhOLAMMpOM6y0ba817wbTYw6P?=
 =?us-ascii?Q?hpzvuuTswgIMs+pCb3CiRex9UuHLDpTpy5/eHnR72Mr7Rk7YHuJ7+zO1/Xdt?=
 =?us-ascii?Q?lBvSo6Dydsxuefb9VvR7LMAWOtky4TWgRHq4AZxv2GLCF0c0ZMY8tvKL2puS?=
 =?us-ascii?Q?Dz0oBMHlj1L4f+ac75RbMcGzxSXhFx1LPR6ZdsAmW3aGgCCYdn7CU+rq8eng?=
 =?us-ascii?Q?SEJBj1RDOo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8F9FPKNAeKiq+L3p4pYDbSlCmftAO6Be4pfM7ZGgIoZgpOr1Vv1swiiDqnMe?=
 =?us-ascii?Q?1WTS2QJ2TcOMI9rooNGShZCjookgHeUEBJOcV8YXwj4rdsovLQUkGwVojgb4?=
 =?us-ascii?Q?rqUECsFB8LW4m7TfqOXSTPuhGHBVky6RwExjPCtO6UdGw2L9uH6CZRCPjgc/?=
 =?us-ascii?Q?EwHO01OKUn3vKNQ+bWftc4sefsPsSQXDA3ibmDv/qdWBC1rMd9qWI70jtLK7?=
 =?us-ascii?Q?O9iUoDcxG+Gf/Ba8T/GlqLyAr+ODwruT6gjG+3JFr7kasuA6iXE8+pwX+8mh?=
 =?us-ascii?Q?fq1UW1BElXXxb/ppmrKSGjuOhJnKcb+UVqLbkkqmYfqbmpkapcJDibQ/tHbe?=
 =?us-ascii?Q?H9HYqjyExAIhMTH/Avpw24DWc8m+QD/SzxpxBYNAW+mNibmcXHxBaSvcuVk9?=
 =?us-ascii?Q?zELQzLs4uEvYtS5AU4Q5IO2mQFiGTm3eYXu6Stx4yFroKepX7qQ3bQ+TkigX?=
 =?us-ascii?Q?dpqag+LL/Ry6Fws/MGNX+DjPUb/3sqUatYjt2HkcNVSRGuniwHy/c92MwKvd?=
 =?us-ascii?Q?9/K3xhDSBtiqc3AkWhDv9Y1Mgtop5h8BmKlX95uziR5MlmtD5AIzB2/UemuP?=
 =?us-ascii?Q?zobASsTcth3r/lbKaxVXgPPUfPMhcRiWZDyWCw7SE0gk0b7jfrCcyVQYzqpG?=
 =?us-ascii?Q?fZ6I10SM3etufparzd+eU6+r5awXtjlsmfeJr4oiEn/pWLaTWtiweiaakO09?=
 =?us-ascii?Q?sSB9utcM5AtnaYXp5XV/MaAKfvgCXqo1FJWnMePuAnQ+giARdkHsyOa7xXKC?=
 =?us-ascii?Q?AqBPcVE4AoTv9ODN0gBhsdLrmf1WQHxlte+S2zscLkrBz/+GnrpLClXBSyvc?=
 =?us-ascii?Q?sHGtRmpQp2kig65RohtNw2ArBi03ALBHR5LleRJyLRfoq7neiWxLhz7lHhiG?=
 =?us-ascii?Q?vig43VDtFM5wH/CnLgC1rICdSHChMU8HVEqagfD8c2V3EWypfoi2yp49HxAY?=
 =?us-ascii?Q?b5C9B/qvSrA/rr8Okvy4ZnLnJOrdwETESBQYSK/ZVFRcqYcr/fUZnWR4DfWV?=
 =?us-ascii?Q?nFGT72aQy1fs3Ol9oczjJSNcdOEJDP6mJKY6KK7Y4KqVr12XJfSswxzR2yS8?=
 =?us-ascii?Q?xhNh8vOmcWGA9sEwXRA+6o5TEoij1HRwvMTZj9hO3yQZU4Lkd91rt0Vhkt54?=
 =?us-ascii?Q?56LshMqLFMKMaYVu85TYlVEKySmG4AthXjwwUqiCbZEnV0XCIe9Xd01wbkoC?=
 =?us-ascii?Q?MrpJph3BNOsqpwHqQmlsWenJdC9rl1paR0JC0z5Ytk6LrqUD3jPizm75RrGI?=
 =?us-ascii?Q?8Yrv4BtF5Nvi3OuEAmyZ4MjoKCKnDBDjv8/WcgbQo/gSrifNoa73kVBV8wqU?=
 =?us-ascii?Q?mgeNP/OqxR6wcFe7dvxjKgIhvZYnaM5791czt+gl5GI99HaXAIAOHSAVHjdk?=
 =?us-ascii?Q?7VMsE0NRXK7VN6q5GNNG9BRd3Wf0IF21ki0mu/CGQo5NwIGMnQaOXw6gpNqP?=
 =?us-ascii?Q?ucfD7EBXlEsQ7HoWAttSZjGntyLOB0q8tvlpIHWVP2HlfYXp7Cv2pdyqfUT+?=
 =?us-ascii?Q?NjpDX0SfCGUVdhxgduMbZ1F/h0usLcQGjsNrBZHa00vyg1GP5gHl6ByxNG/s?=
 =?us-ascii?Q?gqflHyZzjOdVC5yVfJBKSqBxRNY+PbYvymHaOI4xBkrVP88vkpNuG/VflWvx?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8013da8e-3c2d-4db8-15e6-08dddccc1bf9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 13:52:15.9201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f04ImX3rNL7atnsjWYhxPaeeR0cDBV5hgVlm2GwE0uFySGWI0vaBtRxmbZ6wG5WcvDInYQ7GUBTxfhagfWTPBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
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

On Sat, Aug 16, 2025 at 08:52:23AM +0200, Michal Wajdeczko wrote:
> 

I missed Michal's points in review, I agree with his statements.

Matt

> 
> On 8/13/2025 12:12 PM, Satyanarayana K V P wrote:
> > When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> > flag, the driver initiates TLB invalidation requests via the CTB mechanism
> > while releasing the BO. However a premature release of the CTB BO can lead
> > to system crashes, as observed in:
> > 
> > Oops: Oops: 0000 [#1] SMP NOPTI
> > RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> > Call Trace:
> >  guc_ct_send_locked+0x8b/0x670 [xe]
> >  xe_guc_ct_send_locked+0x19/0x60 [xe]
> >  send_tlb_invalidation+0xb4/0x460 [xe]
> >  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
> >  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
> >  ggtt_node_remove+0x110/0x140 [xe]
> >  xe_ggtt_node_remove+0x40/0xa0 [xe]
> >  xe_ggtt_remove_bo+0x87/0x250 [xe]
> > 
> > Introduce a devm-managed release action during xe_guc_ct_init() to ensure
> > proper CTB disablement before resource deallocation, preventing the
> > use-after-free scenario.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Summers Stuart <stuart.summers@intel.com>
> > 
> > ---
> > V4 -> V5:
> > - Updated commit message.
> > - Fixed similar crash while releasing resources on DGPU after reallocating
> > CTB to VRAM from SMEM.
> > 
> > V3 -> V4:
> > - Added new devm release function action_disable_ct()
> > 
> > V2 -> V3:
> > - Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)
> > 
> > V1 -> V2:
> > - An additional check for validity of GGTT is added in
> > xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
> > from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
> > (Summers Stuart)
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c    |  5 ++++-
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++++-
> >  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
> >  3 files changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 433abc787f7b..a6e46272c0ef 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -705,7 +705,10 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	return 0;
> > +	ret = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct,
> > +				       &guc->ct);
> 
> hmm, while adding CT disable (aka fini) action from the CT init() function
> makes sense, doing that here (due to reinit of the invisible here CT.bo)
> looks suspicious and clearly violates the layering ... if this is the only way,
> can you move CT related code to xe_guc_ct_init_post_hwconfig() or something?
> 
> > +
> > +	return ret;
> >  }
> >  
> >  static int vf_guc_init_noalloc(struct xe_guc *guc)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 3f4e6a46ff16..fe2410091bfc 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
> >  static void g2h_worker_func(struct work_struct *w);
> >  static void safe_mode_worker_func(struct work_struct *w);
> >  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> > +static void guc_ct_change_state(struct xe_guc_ct *ct,
> > +				enum xe_guc_ct_state state);
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >  enum {
> > @@ -252,12 +254,20 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >  }
> >  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
> >  
> > +void xe_guc_action_disable_ct(void *arg)
> 
> this should be a static function since it shall be used only
> by the init()
> 
> > +{
> > +	struct xe_guc_ct *ct = arg;
> > +
> > +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> > +}
> > +
> >  int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	struct xe_gt *gt = ct_to_gt(ct);
> >  	struct xe_tile *tile = gt_to_tile(gt);
> >  	struct xe_bo *bo;
> > +	int err = 0;
> >  
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> >  					  XE_BO_FLAG_SYSTEM |
> > @@ -268,7 +278,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  		return PTR_ERR(bo);
> >  
> >  	ct->bo = bo;
> > -	return 0;
> > +
> > +	err = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct, ct);
> > +	return err;
> 
> since this should be always the last step of the init() there is no
> need to split this into assign err variable and then return err
> 
> >  }
> >  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 18d4225e6502..b9f06ec0db52 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >  
> >  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
> >  
> > +void xe_guc_action_disable_ct(void *arg);
> 
> this shouldn't be a public functions as it takes random argument
> 
> > +
> >  #endif
> 
