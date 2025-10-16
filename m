Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF75CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 03:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDA410E2C9;
	Thu, 16 Oct 2025 03:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBCi/H8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D560D10E2C9
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 03:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760586135; x=1792122135;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jt0h0EVcXR4lvTzxRx2pCi7VuBf6ri8eTjMisFeedkk=;
 b=HBCi/H8rmXiz3ItWYRGoHSWQZ6aU/RVqzTeZHxBy/OdzXV1HhlEsfzQ4
 XPR0v+SgIdV6mURyNGRkKMvRiFyg9YzlttPGronpn65lJGaLC/I8Azfdh
 aL5lm0n3gaeHU0uNsuZMSGPB+A0BzeviO6g/0rAl6/RXEGCpJnD5XFwnr
 nW/dL+ybdZnI+YievNn0ydes7nglddU2w7DYlAyZA/GXsVfm7LhXBdKJY
 wqPzYqjgjTvcB1yFb1z1kPvIQM7+Zsn4jo9xVaR2iEpB9cPDSx/0iESOB
 I+sP6IhXJWcF7CgN3fQML+F4ObuNxsb+6fErpk1EYQdvVdhMeURPrB0zZ A==;
X-CSE-ConnectionGUID: Ngys1OSuQjaCLwzswvdYCA==
X-CSE-MsgGUID: qx85A/ReQ9mQJXpBmbRDDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88239296"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="88239296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 20:42:14 -0700
X-CSE-ConnectionGUID: 2Hw6LMJHROuKI67JBAFQKQ==
X-CSE-MsgGUID: gcV0ILQVTxKwKfTajjZlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="183132718"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 20:42:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 20:42:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 20:42:13 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 20:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By+zHXe7wa4Pb+RPMuqXGg0na6P2tsPLihegBfz3L5yqqQfUzZRXvejm0MDwHLNC6jSTOb/X1nr6IkajU44d3oaacWzhvNbfVNetPMRklOv1aMgcyySMDsBInPDE+6kDUhSyENeKABqJbai7nEzAdWMcaixiScGnqg8f0CumaVaTzUeuBl/MHnxQYEBJTBtTCoLfLoscsZ2BK3riZpcMVUe4H759S6jnFqnwFY6S5+BBgNv8DMaFrxePG9Io3Py7L1Elc4pH4YD50+urFYcxfpVTcWrT2jyZvMn2YZKQCo0PI6zf0m93U4gevG/w2sYb9TMx7BwK1cM73ESxjaIGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIQHj0/XtogGaVYXBYCpRmRvvjHV15X9uAz65gM4kRc=;
 b=k4R8eFoyMOGF1T458dRdT/GxG4WWp8SYPD/jERSeqrQPsuyA8BzBlFHvCDHMRvhLsQwF8dRm3DXkoGqDekkrnzFiwKZq8Mgs79r7OQ8nAUVhErjGj1zGcXYBWiqX2vYRExYWOfRDeR1fSpzfqtSPn49eiwG7Im+cKGr1m1UmLt8/iCgNdmk72XH97NJFVNSp/2Ia3HV6rbe1D8ziZrZYqfz3D2XGzfqPCj1Z54UGry0/vupk05V1qxOhZwvpMNEMUCBjXuizhEPn9cnlXtxtX3XqnFmkzffxafkELGuiQMjDdFAcc/M6UwI9bPclBX3IHVZaVpeFftLiGZ9LarbXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 03:42:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 03:42:11 +0000
Date: Wed, 15 Oct 2025 20:42:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Message-ID: <aPBpkZCqyqgfGO4g@lstrano-desk.jf.intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-7-stuart.summers@intel.com>
 <fa2d3d56688c64f27baadda86bc1aa8be118179b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa2d3d56688c64f27baadda86bc1aa8be118179b.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: f96afb1f-8c02-44eb-91e1-08de0c65fd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y4blEzJpUGgF0sGzC6fdqEikj9I7Jl4x3/qBuluhOdV58FCKhBehzpnHoR?=
 =?iso-8859-1?Q?hz/32ChOkK7pKPeBKUpGp3a0GgbNKyCVCNyJyjUH/T8nDlaKlbzW5UYIM+?=
 =?iso-8859-1?Q?V6qM8FcN84YIBu4Q6tQr4nKyKubA/DaNymmrp6YOyC+vOrOBkSGk3r+0a5?=
 =?iso-8859-1?Q?yFEZ3fLwGCkDX2OGYLXHmBrBNhOqIYMuyXjxRJoSecnFurCoayFVH1LlEI?=
 =?iso-8859-1?Q?w3Wu4UYnHBMlJUnoztJqIbDca4SCV24CoRg1pedDH0by+jLwvpaHDr+rtT?=
 =?iso-8859-1?Q?gGk20TB7yXt/dBu5ONRlB2tfMG6jsspyrBMAj+sZO6P24PHPLFNeCw2NhH?=
 =?iso-8859-1?Q?aQhOj/Jr6LXJwwc1SXus5cPcnJCzaijcWNY7WV3To5ipBwGigMwq0EJDZ3?=
 =?iso-8859-1?Q?OhUsU9xssfORFblndpWJ/HMm8XILeOYvkjkKwUQZ+3iiLyz3r5ueUnBgg2?=
 =?iso-8859-1?Q?mAI9JHFzJiWMIAiogCtcy4DxlLHO+zJPoJv0OfY6Xu5tZ679ZTPgAjyK3D?=
 =?iso-8859-1?Q?SGZkKLe900cJs0G+Tj7JoUVXlWtt8NUDTQoTaNVq18dD/NdNioMprjS7wD?=
 =?iso-8859-1?Q?H1qbn6Bnqe3SIyxh06y8TTWxpYvARHQK/E0B3nOt3ENJqTDJQbcGeLFccE?=
 =?iso-8859-1?Q?p8fGOtH+bIDyVahdfPidDHRPaGLgbitVy9l5R08zUlAqmGrkVfn1p+vTQy?=
 =?iso-8859-1?Q?p9tVFypmESGGRc1CGeiRsMogHsKRHSXjSovPZpNnjefqC+YKXe6ln5Bq5S?=
 =?iso-8859-1?Q?yQ883P+RzgoV3DPV5ZbKMo86t4sASYnM88t3NZ0t2jCRM3hFEhI9Tx1mkF?=
 =?iso-8859-1?Q?DMw+wb6jESGS2+nQT/nt2+rZx1oJRG49yzphF5ktYQzX27ou0gunMeOXou?=
 =?iso-8859-1?Q?jO4Owr4f38wLfsWGaQSspo43MycCaExgApyGTi6uM/lUXulcFExSNm8YwL?=
 =?iso-8859-1?Q?Cv87XREPgV/aS3qPil1zBmYSeZxKFbqog0kuG3nsz6/ItImjcL/Q7qfc9K?=
 =?iso-8859-1?Q?Uduu5y87jVy/FzqEAC0zWpWawfaSv5o04dq85D1hZBscxVSp2HFftX33E8?=
 =?iso-8859-1?Q?vs17Q0fjPIvKIni9k+hn86o2AXrdL5h6nBi0kMc+jVGmHMaJ/unxRARXFI?=
 =?iso-8859-1?Q?JU23Ic1haBLiYhP4CODYGQcge2bYqq+h6BeckTi7T8QaQ4/lZr7RennpKu?=
 =?iso-8859-1?Q?wwkNfw/dOKYMKIyArJy2Lf55X4lKH3jDwieLMsSSSVxBxK+Yl+w0j1U9Ih?=
 =?iso-8859-1?Q?Bgajhw7e0KFlE/Ho+EvimzmKeJ7UtyFg1CdcG9X4mYdPyQj+ioq7XBW8hE?=
 =?iso-8859-1?Q?A4cL681hsWp5rOA2zTRVHebQWJgBzzI0A4EegDdJ4XxzfCrnoiejizGl3o?=
 =?iso-8859-1?Q?5dlqKzUH/FBbwYlIvPByjzo3Gv00kXIDUCJfLt/vrK9eINgRoJC+cJHZJ1?=
 =?iso-8859-1?Q?JK/vWSuMlaBTr+dm29Y6+yhmUwuGaj/+ndR94MmoGWrjNVz145oTa3VmJN?=
 =?iso-8859-1?Q?noFkjsUuzUDUkRT8QD9s6g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dGhZKe55T2hIlYc6gy7q2u69GQa9RQWOAjoTcQazdhcdZ9ylChhCFbQkcA?=
 =?iso-8859-1?Q?/MJeMexbmrBPMEdN+K0/2WwEMVJ+FTVoS25sar0cSOaU/kvIuTyR2g1RUW?=
 =?iso-8859-1?Q?uAZhZSiijRYzDJWy3WtlOTtSrfZeuXHMvqoXwCl6oJ+XOo80dJ1472uNsO?=
 =?iso-8859-1?Q?NlUQmcd+0guHGvHCCBQS1huzcgxgz0d+gRiAobYTbb6E431xHl2JUNrN81?=
 =?iso-8859-1?Q?M2uDbkNMfIsGnwtcGjDVN1OET6VTByuqatz3w4FPBrUjC56NEsW2t49cxz?=
 =?iso-8859-1?Q?DFvQHiz3jOlNjkRmcILy41RKU7I1cGAKtpl32oO/bo8I61J24iWWKJCR54?=
 =?iso-8859-1?Q?KX2AKEOJcS/D+O/A2LI7XtlWN6/nTvStvfi7WZYGRCzgpR1pHgHLcr25Ip?=
 =?iso-8859-1?Q?1KuAxG9H2uzmw64nmQAwyinK05MUXLaNcJxOaN89agEXPfcB27bnSoCyWk?=
 =?iso-8859-1?Q?e40biWmsD4KhcxNN/z4COh2AJzCfqU5qoNaQVY6DhI6CJIZzsXDZ8esAqt?=
 =?iso-8859-1?Q?DPMfg+9yOgH1QWc68Z0WwKarBtTyd8yvTHjAlq8980pr63XvW4ZtqTgJCI?=
 =?iso-8859-1?Q?+k7GC+GjLC5e4Mvo/JntsAsiosC3aA05H3O0I7s4fv84PxuEs9mP3mPUZ7?=
 =?iso-8859-1?Q?rNgevcOVNK7tjPgZ8fw1f44RpBIuIRxDmTqB9Ma39b3s2Gs82LeIe/il2v?=
 =?iso-8859-1?Q?o2vnAP9mr4+QEmFpMiCLsghZboF3ri3bh9BDny9WnaU4stCz8eTMI/fOSj?=
 =?iso-8859-1?Q?tewoWae72024F60LVhm9vNPsu5jl677ygLTq5FfvAzefrEcUQf3t980pYI?=
 =?iso-8859-1?Q?75OvgXLxHHrNXGiOukGGAeYynX83nCqrrGVMK9l5j5OvuJ/V+q83y0hugg?=
 =?iso-8859-1?Q?n1ZQYI7Sglg9Dds7fa99Ww+1F+wdXh5ncIC5CxBf9EHXG4hwGVlB8EWiGp?=
 =?iso-8859-1?Q?+dTX/FsBMKMj96HvilBDIaw85sK2Iah58Rwxux9+sXyBRTyYmWrRy+gikJ?=
 =?iso-8859-1?Q?Z+O8RrgmiyE6l3QflyD0c5lFDTu0D6XnhblbwGR6JKliE6RIkMNP0jSWwg?=
 =?iso-8859-1?Q?yUBz9xiNbNQNUx+CpREpK/dsOBKkpWyH9ERkhLeo7jlFLeD7VHC7Q7ka1J?=
 =?iso-8859-1?Q?X3oWymOTUrk7yPf68jRwD+anPhgpz7L835+kMvi3pIoTykhQFR236DGh9r?=
 =?iso-8859-1?Q?nDb4k0Wm2CsJr0oFZwWMsbj8aopoXFE/8PgA9FETdFN5MTT8SW+QxH5YsZ?=
 =?iso-8859-1?Q?2JjR9xAUpuUz8VlIu/DW8yickAg1cuo1G75rt2uCM/9oEKPTYUu6JaiDyU?=
 =?iso-8859-1?Q?auAVUGLRqnIReh9IWZUUBZGJjPc942Cm3zSEfMcQiFGNBGRtGvGwdGWLBj?=
 =?iso-8859-1?Q?tEC3qya0yQOWYrc+/4g0VDrMJf8YLtm7+rSw1caYFubjhHIZxZNA7hQVLp?=
 =?iso-8859-1?Q?f76h7eJIbRODuRIIpeYIW3J0r8A6vHlmA1R4n19F5Bphvotc/cT/iM8Bw/?=
 =?iso-8859-1?Q?n7eZa8DrOCqsVrcJfH2Wpqhv/8lx0g4L5Vf0A8gZciYewASJ5XWnXDHBD4?=
 =?iso-8859-1?Q?6RJzx+j9yhyOL5CdZieSrTqEBOzYfcS9nihh5NvS8cKvgXo58QfazLuFlV?=
 =?iso-8859-1?Q?IUyhRNmT8JWtAxG+SKKLBm3tmO+qvHwnGYoQT2K4RBzWUAfYOT3bba0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f96afb1f-8c02-44eb-91e1-08de0c65fd56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 03:42:11.6030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoOkNhGhHzsxdL382w9P9TmzfbYiHMRl8RCZfk3gVazePcq2Y1uqmE+WX0CSuF+RLR0TEHGjuxVrH5+uuD/Ukg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
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

On Wed, Oct 15, 2025 at 01:45:35PM -0600, Summers, Stuart wrote:
> On Tue, 2025-10-14 at 18:09 +0000, Stuart Summers wrote:
> > Comments also added to the code, but in the event of
> > a wedge or a hardware failure while communication with
> > GuC is outstanding (e.g. during a schedule disable or
> > context deregistration), the driver doesn't automatically
> > reset the software state as it would in a typical GT reset
> > since we are trying to save the state for debug. However
> > once the user unbinds the driver we still need to go through
> > and clean everything up for these exec queues so we don't
> > leak memory on the DRM side (e.g. LRC or LRC BO).
> > 
> > Add a kick start to the DRM scheduler to handle any outstanding
> > messages on hold during the wedge and go through the GuC stop
> > flow to simulate that reset on teardown.
> > 
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> 
> Please hold on review here. I think there's still something missing on
> the wedge cleanup case that causes issues after wedging and then doing
> binds/unbinds in a loop after. I'm working to resolve that and I'll
> post a new series after.
> 

Sure. Just couple of thoughts below which might help.

> Thanks,
> Stuart
> 
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 5ec1e4a83d68..0bbae336c722 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -276,6 +276,14 @@ static void guc_submit_fini(struct drm_device
> > *drm, void *arg)
> >         struct xe_gt *gt = guc_to_gt(guc);
> >         int ret;
> >  
> > +       /*
> > +        * If GuC stopped responding during deregistration
> > +        * some queues can be left in a bad state. Ensure
> > +        * these are all cleaned up by going through the
> > +        * GuC software reset flow.
> > +        */
> > +       xe_guc_stop(guc);
> > +

I think we'd need to restart here at minimuum after cleanup.

> >         ret = wait_event_timeout(guc->submission_state.fini_wq,
> >                                  xa_empty(&guc-
> > >submission_state.exec_queue_lookup),
> >                                  HZ * 5);
> > @@ -295,6 +303,13 @@ static void guc_submit_wedged_fini(void *arg)
> >  
> >         mutex_lock(&guc->submission_state.lock);
> >         xa_for_each(&guc->submission_state.exec_queue_lookup, index,
> > q) {
> > +               /*
> > +                * Kick start the scheduler since some messages
> > +                * might have been added while the scheduler was
> > +                * stopped during a wedge event.
> > +                */
> > +               xe_sched_submission_start(&q->guc->sched);
> > +

I don't think possible to get here with a stopped queue, I think it a
bug elsewhere if we do.

Matt

> >                 if (exec_queue_wedged(q)) {
> >                         mutex_unlock(&guc->submission_state.lock);
> >                         xe_exec_queue_put(q);
> 
