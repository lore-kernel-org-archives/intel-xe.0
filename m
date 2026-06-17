Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BECCD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 12:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10810E263;
	Wed, 17 Jun 2026 12:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIHiyOf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D57710E263
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781700236; x=1813236236;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FfLwUhSCtm9TDv0kST9XNZoa2U0HA5ysOlpyHrwee18=;
 b=GIHiyOf5LYqimjVqIxep/DDSYJnirraaKhsDxOSFzrViJm1DehAGG9Ib
 EtkdaZq5XYRuwf8sZbUmcjdlhqewlJKNhOLk/cgq0QTS9hs4Tfyvi7CNv
 K1M/NIykuZ4IKjXedbq9tEL2U31y5hNugJksDVMqR0HHg3XvFcGrNBRkW
 Fw4pjnI9T/m5PU+fYJ011fuDMtLOHvIN/bqWQ4G1PIk69O87eCFRC1Cd4
 rIGLB2wtIdXvFETtJ+l2y1S0/3MtqTa3Ma8sO80ii1YBC6vwy6gnadyIE
 PhbRB7pW0H6m+Hvd76+D4RSGYbRWzHSBfz8ukn1ozDaYRzAuL9GJENGR9 w==;
X-CSE-ConnectionGUID: fpEOsU8bQFGYKsyJfQu5Xg==
X-CSE-MsgGUID: ycB4VikzScWtrl4nE5RhOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86147453"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86147453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:43:56 -0700
X-CSE-ConnectionGUID: 0qsJqeOUQ6ur1X39WOaSAA==
X-CSE-MsgGUID: Ns9cGDWtRw+NP/mp+qHL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="286170276"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:43:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 05:43:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 05:43:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 05:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvXjRovVelznHlfJiKXoyvPVEXs+FGUBUh1PpWiXE/zDdX2K8HZ29/Gv5UbATWPqPO4SXa1Y0vP+DjlIbYWQDmtrB7iE3do7xIQAyP7mLPBDwvh40XG4zE+ge0B9/0nvrawD3wQ4XIft9EsU8Cc49fqLr/D3Z0SkV3n+RuGyRvwXmE5jaA7iF4c/sB5FW2dM7w9cV2zvfVQY/+rij9EryQnyKKdI80kTb8uI9jL+527scu7FNTaZhO+H4yVYwIlVNXmHs8PBpiaPBCdz+HN2wXHxiEKTDf5zUe3vG5FMZVj9U3mhB367xaVtUUV19qBPH2BmZFvx+1htYeQuhA0K4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVWs4VOa1PCGV+8GJfmMw8NaeWmWIpmVU3iBXsZvPLk=;
 b=NrOtKcxElW5ThN426XmZuxZxdLFe1wBb0wKVbC5NbCU5mfo/TBWvl1/tvGwNn8ZoiihwDHTOZwdN/2265MlbRxKeKf9RabRS3LKMK2mom/bH8zL8p+Fz82/X+vT4qAeAczZ5p2jxiI5XgVv+671h4FMuBbv9+8Rrk8gLFOFmdhIshVt+9NmJcHoJHkVJewMPsrH+fvgCHs8k9RdG8QzhvaIbfR5leytWfRPLrwMmTriJTVJ+ulO8qIZQlLmIc32rP1AjlAFItLA0cBopmBMx631FWDDhgKPhLFHL8lw4F/H1wHUFwoL3ngHvUOit6ZArS2bSlvJKuE1PHHu9EHf4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB5299.namprd11.prod.outlook.com (2603:10b6:610:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 12:43:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:43:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe: Add framework for info probing
In-Reply-To: <20260616215642.GN6214@mdroper-desk1.amr.corp.intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
 <20260616215642.GN6214@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 17 Jun 2026 09:43:48 -0300
Message-ID: <87ldcd1gmz.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB5299:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4ce766-ff39-4e4f-d470-08decc6e1639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|5023799004|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: MBG2niZL5Jgw5xoW9N2Cx9kIf50YqDAjRXXk/xuy1+ERbsAPsBM11leWTfVA/ISc9cREebkTyIw1+MrHoXxoVSfx5PS31kpML7jYHB3aLrLQFrWa//kfKvesaEjVrwEbThmZtPd5GDaefbP7E9I6L82cr1EZWbs5wxOdwQ05I5PVdLmClaMKJMsiBbB/hXxG3e6CGA7+Eg2Tr3yzLp+XajbOyqZtq7g3Qrs/jcSC5TSp3Vw7q8Ta242uwXmONws67nFcJeVmiaAlyIHkSvUZx5Tca62qFmpk/JhRCFSGuS50cIQpZknka8CYAnjQGl4jXDIhvFNT74kTv8Bidmt3dk2iogHmVMRiLhXp98hn4VdjtyRS9+93BxcXp/h+rFyedBlC3m8JB/vjHC2CqogIgZbhVSnaVPgxMm2qH2QK7V+HxC4Frx34EC925+8xZBgyx0UeAFzZ6ink0dL7jk6VKw9Xr0pArDcOivLg/K8n/QXg3irRd3Q1+fEDZPwikzhBWwYBYd14m+woNFHTioNTu6kUft8B8PtMlT6d6HZ+UN2NcjpZnXVrF7LV9XrdxTWUXUQ+eBeb3iowsTahPV78pP0lOCdGMDQDv9ZOHxHclJ1IC7akF9LHs6MziDg3lcguFBEmBLLjgsO3FMFnd43ceXmZ9qAFYC4f1liBbnSUTuFqIayA4KOHBhGbyjkpf80t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(5023799004)(4143699003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mO29ku5MGH2a7ggWMesFy6RZxPli6gvjI+NXHyVZuLM444YKsCxP0dDNBHci?=
 =?us-ascii?Q?EKdlYacVtVCtwale+eQ0HyFMtZJmnpjd013InLeCz1FnPFAS1WsCu+10CZGe?=
 =?us-ascii?Q?YEShm0luibs+TwnKptqjXefs59x0kEZl77VNES3egMe2d8ITP/R6OZNq3MLb?=
 =?us-ascii?Q?0Ju7msfvDbiujLYSxXXflsiD2cr7t/1r7Lt4AeACD6SllyITQzp71sbIRjQj?=
 =?us-ascii?Q?uAbMvHIRaqHBYXDk0UpekB1i6Xz+HuiyIFt+N8ZHTo37JCYBA4P0V9gFl4HO?=
 =?us-ascii?Q?Sh+YglPhPQnCDpf7CSyzVr21+Qgoct0S3agROro7aiscMLdtO+gmuq2yGH57?=
 =?us-ascii?Q?R/HJ8O6YvXPyBhR1GcUSvz4qu5rPnUoLI+8OScIZ1EVcK8cCebfDeKkJXJBx?=
 =?us-ascii?Q?8Ta30GIsFbzAtpZVidA25NijGX0iDaUfxyK4qTDRoBnIEcv7DPSEDkDCzrWf?=
 =?us-ascii?Q?TELoXV+tBuH+E9BrVo21U9oJEosli7RX4CJIW34oMmnr1/EYW7fccubTdcLV?=
 =?us-ascii?Q?Rr5CkVEhgTxY/GK+jGs8vIeI/4LIQ2HZ6dWyQVbqnrYBXbqQ+zsJriO4GgEY?=
 =?us-ascii?Q?WoQLu/w7+kZjAisM8OUGs+ouiV4sGbeFz+KDbgV+oRlVp7Sp+3aP9InjbEqM?=
 =?us-ascii?Q?sDD86bBx7IPd7zsp/Yb7LC207BSCT+EXe91apiZH7KxQ0hsfQ1i9Ep3/n3mR?=
 =?us-ascii?Q?W6s/0U46Q3Mc3ikUpucs9NAu3iJBrKiwJNFnkVD3NQxP/yo2t3wbpvb2ZMj+?=
 =?us-ascii?Q?qGwrnWihaQZ4+mBRTnGv8zl7V8qDJqaL1JaRBa9Gg17EF+37v7L6psrf18UX?=
 =?us-ascii?Q?Mroy0OyCOVXr4SRcL6iiXJ/MlnclESCPG5YoMBIUjcNZi1u9duyjmhqWUQn5?=
 =?us-ascii?Q?HhDh6DwWemqnJz4XZHEw1M44NBmUBbiRXrv2V2+F0F5LMPOe5iB1YP/2kl5h?=
 =?us-ascii?Q?UskM+nQcAP4ZDX1rPBI1tNj0azBHVafWIrm69j2zuiWLXT5gfm9+KAgG54PJ?=
 =?us-ascii?Q?jjvpE2VK56yRJjSLskcZua4oZXG1BsXWVI72xCZtNyPWVg7TB+y0BWWftsiH?=
 =?us-ascii?Q?Ds4e7TYM53cl52NYmVdHDxn1QSSjUyLBj9H8Qy1h7C3lXc/m+y1f2By8BWq/?=
 =?us-ascii?Q?wTi420NilEkKAEQKoemGZ87ygIWVDPiNB2CSccJDu999JEX7XIeuFyWN6XI2?=
 =?us-ascii?Q?5Suc23794J8L7IFJ/m1GJvGumhMlz8RiiavOXYDsN6GZNjf1p3z++fvdffYA?=
 =?us-ascii?Q?r1TxVPVjmDlg0HNZdWfhijD34RosfwH+tY/FYMgOOuwZPxxaXM1OlorchTMl?=
 =?us-ascii?Q?ZJdAAJnFZb1W55lVl0nHW6oGBbB5NB7Y5CuXGQvuDckIVOMhtWOSQFjYQQhY?=
 =?us-ascii?Q?fE52WTUKPKNF1/iMFJhS1Xn/h4jkl19b0B6Ro3ov0CcAyyE13PZKy4RwjJiy?=
 =?us-ascii?Q?SByI77cg4W9QaGdgLcKRM+vgcWOBU5jYEO4yeDCpOCYoTy9x/eLn3PA9a9CU?=
 =?us-ascii?Q?R2AXUPCvWIaMlu60Kdj+mrbyVQsShhETtOeC5W0w1y3olVH/IB8rRJloqCmn?=
 =?us-ascii?Q?42VTksk21w4Do+aL55vfFI7tXTQpA25eevxl8j/PhOC2P/hdhtVWzQZ1rOZn?=
 =?us-ascii?Q?o5xzh2fs9NyOGBkv3zsz4W1TUg39ZgGdjnuHu7bRE9mhbA1jTq2rTHbS3UAO?=
 =?us-ascii?Q?GEBwYxV5/IR4LQNrkWAW5fVp4KDvD0vG00G2SLfOPq8c6W4UcbTcIxQCEUg/?=
 =?us-ascii?Q?wYBEUmg6BQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Gv8JiK8Nxkvyr3Am2HHqM4OE9BsYnxt5XuQl334+roIJq6vm1+08Z2D4ER5UTZFQoNk2/sgyNUDjPVtHBwv4g1sEmsoUXi3l8Ewy3pHDs23sEMZ+PEtDgAci/WKq5N6JfEUgu3UgAstu+uFtmIgu+t0TX/e+mCHWnjqtFTjyQBVaJLn+YcP9ltMT46EbTA4FMLcbrGdqo8HNMTtjUuiv1fwfQGmpAAajbQvZkg1mg4LlNk1jLGVWKBynwxlh1RgBgQ+aP8Od9KI85V9oUEez5sylFcdl48nHMcEhLP68SHzWBqJa++uzwCQIHJwDzKy9KD6qlbOu98TZZ/tU9pSVXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4ce766-ff39-4e4f-d470-08decc6e1639
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:43:52.8927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFVRgShBlpppmpLhimGWHIUSELdJVk8KHLwb5ww8MJRhUlE/z7paUakJWwwTBjwOYmWlwbnWrOpYTjjPbDUJ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5299
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Jun 09, 2026 at 05:17:33PM -0300, Gustavo Sousa wrote:
>> Functions xe_info_init_early() and xe_info_init() currently probe some
>> information from the hardware while doing initialization of info
>
> Is the mention of xe_info_init_early() here correct?  The general rule
> is supposed to be that *_early() functions are software-only setup
> (e.g., kzalloc'ing memory, initializing mutexes, etc.), whereas
> non-early functions are the ones that touch hardware in some manner
> (either for reading and/or writing).  There were a lot of mistakes in
> this area early on that we're still cleaning up, but I think
> xe_info_init_early() at least is following the rules as far as I can
> see?

Yeah, to be fair, xe_info_init_early() does not directly try to read
information from the hardware during its execution.  My argument is that
it "probes indirectly" when it gets the PCI device and revision ids from
the PCI subsystem; that becomes more evident by the fact that we need a
kunit static stub for init_devid().

--
Gustavo Sousa

>
>
> Matt
>
>> fields.  Besides mixing responsibilities, another issue from this
>> approach is that kunit tests need to implement static stubs for the
>> probing part.
>> 
>> Let's prepare the ground to ensuring that those functions stop probing
>> the information from the hardware by creating the necessary framework
>> for extracting the probing bits out of them.  Do that by creating a
>> new struct type called xe_probed_info and the functions responsible
>> for populating it.
>> 
>> In upcoming changes, we will gradually refactor the code so that all
>> info needed by xe_info_init_early() and xe_info_init() that is probed
>> from the hardware is passed to them via struct xe_probed_info.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci.c | 16 +++++++++++++--
>>  drivers/gpu/drm/xe/xe_pci.c       | 41 +++++++++++++++++++++++++++++++++++----
>>  2 files changed, 51 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index 9240aff779da..51d032a9e01a 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -338,13 +338,21 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>>  	/* Nothing to do, just use the statically defined value. */
>>  }
>>  
>> +static int fake_probe_info(struct xe_device *xe,
>> +			   struct xe_probed_info *probed_info)
>> +{
>> +	return 0;
>> +}
>> +
>>  int xe_pci_fake_device_init(struct xe_device *xe)
>>  {
>>  	struct kunit *test = kunit_get_current_test();
>>  	struct xe_pci_fake_data *data = test->priv;
>> +	struct xe_probed_info probed_info = {};
>>  	const struct pci_device_id *ent = pciidlist;
>>  	const struct xe_device_desc *desc;
>>  	const struct xe_subplatform_desc *subplatform_desc;
>> +	int err;
>>  
>>  	if (!data) {
>>  		desc = (const void *)ent->driver_data;
>> @@ -379,8 +387,12 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>>  				   fake_xe_info_probe_tile_count);
>>  
>> -	xe_info_init_early(xe, desc, subplatform_desc);
>> -	xe_info_init(xe, desc);
>> +	err = fake_probe_info(xe, &probed_info);
>> +	if (err)
>> +		return err;
>> +
>> +	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>> +	xe_info_init(xe, desc, &probed_info);
>>  
>>  	return 0;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 78fc2e4dcfc6..7f1da6d25011 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -737,13 +737,27 @@ static void init_devid(struct xe_device *xe)
>>  	xe->info.revid = pdev->revision;
>>  }
>>  
>> +struct xe_probed_info {
>> +	/* Nothing for now. */
>> +};
>> +
>> +/*
>> + * Probe from the hardware the info required by xe_info_init_early().
>> + */
>> +static int xe_probe_info_early(struct xe_device *xe,
>> +			       struct xe_probed_info *probed_info)
>> +{
>> +	return 0;
>> +}
>> +
>>  /*
>>   * Initialize device info content that only depends on static driver_data
>>   * passed to the driver at probe time from PCI ID table.
>>   */
>>  static int xe_info_init_early(struct xe_device *xe,
>>  			      const struct xe_device_desc *desc,
>> -			      const struct xe_subplatform_desc *subplatform_desc)
>> +			      const struct xe_subplatform_desc *subplatform_desc,
>> +			      struct xe_probed_info *probed_info)
>>  {
>>  	int err;
>>  
>> @@ -910,6 +924,15 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>>  	return gt;
>>  }
>>  
>> +/*
>> + * Probe from the hardware the info required by xe_info_init().
>> + */
>> +static int xe_probe_info(struct xe_device *xe,
>> +			 struct xe_probed_info *probed_info)
>> +{
>> +	return 0;
>> +}
>> +
>>  /*
>>   * Initialize device info content that does require knowledge about
>>   * graphics / media IP version.
>> @@ -917,7 +940,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>>   * present in device info.
>>   */
>>  static int xe_info_init(struct xe_device *xe,
>> -			const struct xe_device_desc *desc)
>> +			const struct xe_device_desc *desc,
>> +			struct xe_probed_info *probed_info)
>>  {
>>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>>  	const struct xe_ip *graphics_ip;
>> @@ -1073,6 +1097,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>   */
>>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  {
>> +	struct xe_probed_info probed_info = {};
>>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>  	const struct xe_subplatform_desc *subplatform_desc;
>>  	struct xe_device *xe;
>> @@ -1117,7 +1142,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  
>>  	pci_set_master(pdev);
>>  
>> -	err = xe_info_init_early(xe, desc, subplatform_desc);
>> +	err = xe_probe_info_early(xe, &probed_info);
>> +	if (err)
>> +		return err;
>> +
>> +	err = xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>>  	if (err)
>>  		return err;
>>  
>> @@ -1136,7 +1165,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	if (err)
>>  		return err;
>>  
>> -	err = xe_info_init(xe, desc);
>> +	err = xe_probe_info(xe, &probed_info);
>> +	if (err)
>> +		return err;
>> +
>> +	err = xe_info_init(xe, desc, &probed_info);
>>  	if (err)
>>  		return err;
>>  
>> 
>> -- 
>> 2.53.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
