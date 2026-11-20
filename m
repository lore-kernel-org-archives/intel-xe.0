Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918F606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BxhNpzQx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NUeOfgDf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C3610E013;
	Fri, 20 Nov 2026 15:29:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80B10E013
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795188548; x=1826724548;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IaIXoFb67WoCs/VhsAn83oSYWxb41VwsjZbOikyPrig=;
 b=BxhNpzQxkt5c7fONo1WDIylm1Wa00QgY2NW1jpo62UG2fPTJ8blbTRlr
 +KizzYer27F1b9tMOvvnFlSdCHwoVLnLLrKXVawSaxIAaEbtrLUqUYjqg
 TUc/jBVpWw5ZpXwGJIQyV5gIu6PNv86UbVq/cYH3VZOT6iYhyDMIHv4uo
 l9r/1CSkxNNaPED/ASpzKNanI2A+e9STc2h/CVWzQrHPx0rY4xsib/ic2
 9CBJGxzhbg5VTGqkWA07GRsD8pofzI6sNENThHNFQlhnVNpuKJMv8/X51
 5ylZNY6fI+u/qzGt1W5fsgiALNSbCmP4XGfuwB+jDbnqz41DxwzWAhHLh g==;
X-CSE-ConnectionGUID: 0+ZOmY35TmC15bUYcybQEw==
X-CSE-MsgGUID: mqwvGSJ9Szyb224AWnFkzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4148280"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4148280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:29:07 -0800
X-CSE-ConnectionGUID: XmGUMoLyR9u/ZF0yYCehhw==
X-CSE-MsgGUID: ALa6nM0OROO73wmIKSizBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11015079"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:29:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:29:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 07:29:06 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:29:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQW9Aznli+xqa9wQFeY9CO9XOAmUBc1IBASENTaxBzT4Y+bqR+I1rpjSHLAR8wLu6lsliWAOo2lhDxBIEBzjgMFnqJEua30U2q5q9lVNe0qLuE6Xi90It8FvYU3B1AYZ1qO2pmCQ7M1jjmtdzOqMOyPv6RBy6chP542uI99f8wsokVxZP9C/O00xoZcEpRsZihAP7wZYRiLuM4Y9RYmtU9aGgTf1I6NWyLhcOlMNSk4zXpj0PWLhWQ0HKOJWp3bVo+Wm4agS9/+hUDMBEqetJXQ13s7l36L9lwQ5Q61nH2/Wx8vIgVxy2FSaUE0cTkkvZNH7U+h7p0vLtwXjj8xXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpxaDhKt1JKjt/YvGfyQW3chHk0zHWflq10/pEl4Q/8=;
 b=wT5v1eUecJp0zjz67Xe22gZ/0H7XcIE92Q3vw1+u4oFRUb/CztO+XCkaSQHZ123xAXmlmaRzAWBYmzQQ4GH300EmMztycFkEsUy1jgpiRkF5p3rObYhvhuyGg8w6Chc+JTm1DKGzDLOeESgSewWIkTr+bd7ygAr36C7OuIXvBavS17xwhftfupaY8Uih8eycX2AfXQFGVWJckvifl2+Kg5baE4bNImk1Uerbe5ovECR+9qzvIdhjzAlykzhTG/77bsmrwSPg8M/bq73axY68hZ1jneTa9GxsscS50OCdfhzXpqz0ZlqKYMtscRuUYVE5HYm0DMszKxYAeU1vprmyEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpxaDhKt1JKjt/YvGfyQW3chHk0zHWflq10/pEl4Q/8=;
 b=NUeOfgDfI7CSQRkqhhYYPGgLOX85D9A1HsewyJpE2QKxOxKlB3RgIbwg3W17mmR5HSaLzQ6cM4WFAQTrDQ/690BF5A9n6X9gndlicgPZ4m9E7mnlZdoO/x5Zl2yEYT5dtlSG1l0pmus6xJ2Mo5pouh9/glg+lFq08xmOmx9DqvQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by EA3PR11MB899369.namprd11.prod.outlook.com (2603:10b6:303:30a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 15:29:04 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:29:04 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Julia Filipchuk <julia.filipchuk@intel.com>,
 "Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH] drm/xe: Add GuC FW path configfs overrides
In-Reply-To: <20261119014602.243548-2-daniele.ceraolospurio@intel.com>
References: <20261119014602.243548-2-daniele.ceraolospurio@intel.com>
Date: Fri, 20 Nov 2026 12:28:59 -0300
Message-ID: <87bj7jr078.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|EA3PR11MB899369:EE_
X-MS-Office365-Filtering-Correlation-Id: 298028ea-6677-4d34-85df-08df471b0283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|3023799007|11063799006|261021135927099003|261026130827099003|56012099006|10067099003|261022075727099003|261026135527099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|261022113327099003|261009223027099003|261021123027099003|261102123227099003|261021130227099003|261009221227099003|261021121427099003|261021133027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 1PEpUXUpim1WnQMQ905rfOxDOmYzHT5Ri5P/NunquCWoXp/f+SR+TMNM7AR6ZgksnC1w2Q/PiqhzknUckTFBbMUihyZEWcn/df/5vip9MRO52kwbcrbtHVMux/XSTFLErkcmrpzHigKrOrzWyqeqjsg5FrvRHHTJG59KrUSWiOa3Znpvi/gfCFY7VEwO47jjNC6AQut6IuXfJVEm7AsjHuWqzTL1cCJTPvwjoeM66bjCYdy0U1+wvpjefAHqVp+Pi20YRGNmLAyd1dMpkb558fBdP42mBM+plL2QJSXRi0wVWq5kAUC9nD8bkCncujt4ND7oK7/GbAzzsXkvM6tvd/Yyzzw+yfr5+CbjQ1eVp/dFtnMvkftgM+7YuD8/1lC1nMw6J2MujDtC4FiuTyoLg9WaFze/wN11+PnFPkkcLs6qCNW6kHbiaFuBBJe7M+3ROpTEripwXLQRk01OURAyazM6/C6rXTbOWy+mhXmiKB4AJlfb1EEiOe/Y4rTjkFDCpGmH9HKB641NLxaQ4y879U7kbKPWcpyX1e5xbviquCapT9gd8gvBiH9H4Gm3kRiw1P7IJ11+Hi+cI17658DVZtQMQ6JqMMwV3Igc76IyaLX1KqWlBABxzCOFwVfZD8dXpx+0USTHbpDqfM0FyySPwIA2HxGI0dofumhIduaksjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(261021135927099003)(261026130827099003)(56012099006)(10067099003)(261022075727099003)(261026135527099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022113327099003)(261009223027099003)(261021123027099003)(261102123227099003)(261021130227099003)(261009221227099003)(261021121427099003)(261021133027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7ufhJ8oKOibty3byou5V4dEWZfMIjZ/Wc0asw5yqOaXAk5JZ/DpeQbfGT7e?=
 =?us-ascii?Q?j+HRfEPrDwGYp9UdaT1IrdBygK3J37sIzCKbkKsk4/8KcEztseMGkqpD82O7?=
 =?us-ascii?Q?X+pKiXiKH21N5TR9C3K0hbZamD8RQqnqI+BxlqdkaIiiRsO3KBKCwABZdGO1?=
 =?us-ascii?Q?h7CRBMLRNIwXnXG1d4EMR4s5MtCOdVh3EKNsm77vYiI2VRaCD26/Qm0woHtO?=
 =?us-ascii?Q?/sAksBkwnz6T8+45f/7HRyewa95KOeXnYNax0G9MKbZPA7WAHfz8qzcGfCfW?=
 =?us-ascii?Q?ggd4bZWFYmacTFA7o9DG9HgsNCgpe31Aw4x/La6u2bUmhx9Yai8i3Fa+yJG3?=
 =?us-ascii?Q?Q5oF2ZgBNbWoI4CNO+LkqM5ccjiQ8ZN7wftgv1Y2uSKZWgE2lqruAXkxMTVI?=
 =?us-ascii?Q?/Qqx/Ucv3DqHQCpfJhVrXZvNx3neZ/8BI7FnB1ouGOILO+cmA6ve6lRC82WY?=
 =?us-ascii?Q?w3zx4sUoR5elt++658A9BCDCM7qSUYOUh29v3gbenv3j8qU7gmRh0EFAv0w6?=
 =?us-ascii?Q?v8kKqW9twnrpTx296tQWnz2aQSsrEJ8lV39MUiGRbophvDncHWq4OvsgY8kK?=
 =?us-ascii?Q?3M5Dp+iirUbtTdiyG646iWs+A8jXKbOoIthAqG29eQL9oUCHEeoZahm805Kt?=
 =?us-ascii?Q?A0lu+dgWM0ac/xLG9FgjH3KtLcWNqWCVP0Fgf2YsW4+QTAL6S39y0onlM4N/?=
 =?us-ascii?Q?9QQ1YCKQUKZ66QbViNulkWqGfU0m8A+uWEXE+ZHTU9Qww6p7QkM9RF/P4X2I?=
 =?us-ascii?Q?fYavNnF44gEvN7U+XNE//3o4q+bMnL5RB+6BmGrlURvq8JEUVRydf7O3Sffg?=
 =?us-ascii?Q?zyK6/7k0KoNYdpzmTA7Ju8mn5yi1oftk/m+utVylFOF4ij7JJhNtmu/3jei0?=
 =?us-ascii?Q?nqpf7IF3undvMuGECRwkyVOOjZqub+jPpvOhaSC40q1wQ80bIvZplrAPiaD/?=
 =?us-ascii?Q?h0XREJnnFzRcBei8UpzZpiDkf12HP0rjnRurob1BR7Lr+ZTg17/KY9Qt6lOT?=
 =?us-ascii?Q?jQFkSy5Ld1AfKh7K5/K8Q/T+YD/hxDQ1aFosEHyXu7dSUiHvvDD5uIkczbig?=
 =?us-ascii?Q?qmAjYjAHQA/QRiKJQ+TKKGeyKrAPSlrPcv0Km/vJVEAqrKPU/QlgUeHHHofW?=
 =?us-ascii?Q?E7R2qKgwYMjDIk4VoSH9O8NWnQbGwYs7uqe0em1+i0OyiTs71n6fDSSGstVV?=
 =?us-ascii?Q?tlo8LBLvUvXTi/JVIw4MxMOnU3FP/1JYNY+9LMBxc6thvZYCnANervScvJFF?=
 =?us-ascii?Q?KAFm209uE62PaPu6g+Uz8r3QZLJxCLRgBM605StXDr5/qcEo7P2g2rImdHmT?=
 =?us-ascii?Q?rIA8g01c9v9y/Bs/CMHlOcDiAIsSWFCPeDx/NFQ6uuwIu95s74jRkq/Txrxb?=
 =?us-ascii?Q?QwrcJXo6T4U5awWwZHA/UQfXAWqaG6BoY+vfyX9EYmZ+Q5CNhVQNii8CD8Ev?=
 =?us-ascii?Q?+4whO7IELMGX2YilyB7ntzw9VWpoCA3YeJu6Y43wCQ2xhYjInyGtxrrWGCMI?=
 =?us-ascii?Q?D0ZAd3AAol911+5tjK5E5EoJllMGeZKDyof7fYZrfR2Dfy8am0wltovJXqNM?=
 =?us-ascii?Q?zmJnxjFRYtiqwLgErH3vIoGj+FV3BptW/hIQT/Z76r5op0vOuEpyr5hP9sGi?=
 =?us-ascii?Q?EEGqB2KGcPdJ7Njh6gymrDN67JjoKTpdI+tD4BD3G29GLP9iHWV+oFkVNqXn?=
 =?us-ascii?Q?z5vAEokB0/+N21dl7KpV/+89IVivBDp5cLBRi24PJWaMdR/5Zq5Rm5G2Xf5J?=
 =?us-ascii?Q?T4tqldn2xA=3D=3D?=
X-Exchange-RoutingPolicyChecked: edKpEb7VgNwGlczE/QJaDugES2cbQp657zYv6SdC+VL3as9lGp0C5ATbRGKWaaVImvHiXec6Ps6T5pIYqoSLIVFavwTVnwt2pq/ypxbyKDcIdNghEaFr99p+LjJjNZQ8cB5D8o9KaBuL4JCGUl0ajR761EGscJw2kbmeR7lHrVJ4jkvD1YpGYq70RZK0HRLuhmIG2l/o0KYqNL7cmW5SK4ZkuGTQdoFvzMMGDBsG4/ZHsy8auhgqjm86k8xo5SIa7BH/KOMQSp4dGsyUyn4coxC9cpriawYII5IW4OI5sIhvioJ2IEzUmRbl2GXMeipTE1Rde9mOoDsuECGGQCnfXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 298028ea-6677-4d34-85df-08df471b0283
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:29:04.4378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Awu4fhRwSw5q04WpapyVwy6oHrLv0XTcXtYo0xxZRTdP55U+loFbeY9h//NcJpWnbBc5Eo68O9I84VHeNUybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB899369
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> writes:

> Some platforms (e.g. NVL-P) use different GuC binaries for the primary
> and media GTs, which means that the guc_firmware_path modparam that we
> use to override the FW on all GTs for testing can't be used on those
> platforms.
> This patch adds separate configfs overrides for the 2 GTs, which can be
> used to tweak their GuC FW paths independently. Note that the modparam
> is still supported and takes precedence over the configfs.
> Since the allocation containing the user-provided config is only
> guaranteed to exist while we hold a reference to the config group, we
> need to take a copy instead of pointing uc_fw->path directly to it. To
> keep things simple on the cleanup side, we use a drmm allocation.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 150 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |   2 +
>  drivers/gpu/drm/xe/xe_uc_fw.c    |   7 +-
>  3 files changed, 158 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 2ddd707a6dbd..b6b544c3bc9d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -13,6 +13,8 @@
>  #include <linux/pci.h>
>  #include <linux/string.h>
>  
> +#include <drm/drm_managed.h>
> +
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
>  #include "xe_defaults.h"
> @@ -277,6 +279,24 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * GuC firmware override
> + * ---------------------
> + *
> + * Override the GuC firmware path for the primary and/or media GT. This is
> + * useful for testing a newer GuC firmware version without having to update the
> + * driver. The specified path must be relative to the /lib/firmware directory::

The path /lib/firmware is not the only base directory that the kernel
uses for finding firmware.

The documentation at
Documentation/driver-api/firmware/fw_search_path.rst shows the other possibilities.

> + *
> + *	# echo 'path/to/guc_firmware' > /sys/kernel/config/xe/0000:03:00.0/primary_gt_guc_override
> + *	# echo 'path/to/guc_firmware' > /sys/kernel/config/xe/0000:03:00.0/media_gt_guc_override
> + *
> + * Writing an empty string disables the override::
> + *
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/primary_gt_guc_override
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/media_gt_guc_override
> + *

We probably want to taint the kernel if an override is applied, no? And
then document that a taint will be added when these options are used.

> + * A modparam is also available to override the GuC firmware path for all GTs,
> + * which takes precedence over the configfs override.

This is unrelated to this specific patch, but I wonder if it makes sense
to have the module parameter apply override only to the primary GT if
the current platform requires different GuCs for the different IPs?

Another thing that comes to mind: is it okay to load different GuCs on
platforms that use the same GuC binary for both IPs?

> + *
>   * Remove devices
>   * ==============
>   *
> @@ -309,6 +329,11 @@ struct xe_config_group_device {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
>  		} sriov;
> +
> +		struct {
> +			char *primary_gt;
> +			char *media_gt;
> +		} guc_overrides;
>  	} config;
>  
>  	/* protects attributes */
> @@ -331,6 +356,10 @@ static const struct xe_config_device device_defaults = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
>  	},
> +	.guc_overrides = {
> +		.primary_gt = NULL,
> +		.media_gt = NULL,
> +	},
>  };
>  
>  static void set_device_defaults(struct xe_config_device *config)
> @@ -937,6 +966,84 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>  	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>  }
>  
> +static ssize_t __gt_guc_override_show(struct xe_config_group_device *dev,
> +				      char **override, char *page)
> +{
> +	guard(mutex)(&dev->lock);
> +
> +	return sprintf(page, "%s\n", *override ? *override : "no override");
> +}
> +
> +static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
> +				       char **override, const char *page, size_t len)
> +{
> +	char *path;
> +
> +	if (len > PATH_MAX)
> +		return -EINVAL;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	/*
> +	 * An empty string disables the override. Some bash commands can add a
> +	 * '\n' or '\0 ' at the end of the string, so consider a string of
> +	 * length 1 containing one of those characters as empty.
> +	 */
> +	if (!len || (len == 1 && (page[0] == '\n' || page[0] == '\0'))) {
> +		kfree(*override);
> +		*override = NULL;
> +	} else {
> +		path = krealloc(*override, len + 1, GFP_KERNEL);
> +		if (!path)
> +			return -ENOMEM;
> +
> +		memcpy(path, page, len);
> +
> +		/*
> +		 * the echo command adds a trailing newline unless the -n option
> +		 * is used, so replace it if present.
> +		 */
> +		if (path[len - 1] == '\n')
> +			path[len - 1] = '\0';
> +		else
> +			path[len] = '\0';

I think we could handle the trailing chars stuff in a single place with
something like below.  What do you think?

    |diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
    |index b6b544c3bc9d..1a763d9f241c 100644
    |--- a/drivers/gpu/drm/xe/xe_configfs.c
    |+++ b/drivers/gpu/drm/xe/xe_configfs.c
    |@@ -978,6 +978,7 @@ static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
    | 				       char **override, const char *page, size_t len)
    | {
    | 	char *path;
    |+	size_t path_len;
    | 
    | 	if (len > PATH_MAX)
    | 		return -EINVAL;
    |@@ -987,28 +988,27 @@ static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
    | 		return -EBUSY;
    | 
    | 	/*
    |-	 * An empty string disables the override. Some bash commands can add a
    |-	 * '\n' or '\0 ' at the end of the string, so consider a string of
    |-	 * length 1 containing one of those characters as empty.
    |+	 * Some bash commands can add a trailing '\n' or '\0'.  Use
    |+	 * path_len as the normalized length.
    | 	 */
    |-	if (!len || (len == 1 && (page[0] == '\n' || page[0] == '\0'))) {
    |+	path_len = len;
    |+	if (path_len && (page[path_len - 1] == '\n' || page[path_len - 1] == '\0'))
    |+		path_len--;
    |+
    |+	/*
    |+	 * An empty string disables the override.
    |+	 */
    |+	if (!path_len) {
    | 		kfree(*override);
    | 		*override = NULL;
    | 	} else {
    |-		path = krealloc(*override, len + 1, GFP_KERNEL);
    |+		path = krealloc(*override, path_len + 1, GFP_KERNEL);
    | 		if (!path)
    | 			return -ENOMEM;
    | 
    |-		memcpy(path, page, len);
    |+		memcpy(path, page, path_len);
    | 
    |-		/*
    |-		 * the echo command adds a trailing newline unless the -n option
    |-		 * is used, so replace it if present.
    |-		 */
    |-		if (path[len - 1] == '\n')
    |-			path[len - 1] = '\0';
    |-		else
    |-			path[len] = '\0';
    |+		path[path_len] = '\0';
    | 
    | 		*override = path;
    | 	}

--
Gustavo Sousa

> +
> +		*override = path;
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t primary_gt_guc_override_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return __gt_guc_override_show(dev, &dev->config.guc_overrides.primary_gt, page);
> +}
> +
> +static ssize_t primary_gt_guc_override_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return __gt_guc_override_store(dev, &dev->config.guc_overrides.primary_gt, page, len);
> +}
> +
> +static ssize_t media_gt_guc_override_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return __gt_guc_override_show(dev, &dev->config.guc_overrides.media_gt, page);
> +}
> +
> +static ssize_t media_gt_guc_override_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +
> +	return __gt_guc_override_store(dev, &dev->config.guc_overrides.media_gt, page, len);
> +}
> +
>  CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_multi_queue);
> @@ -945,6 +1052,8 @@ CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, disable_vram_page_offline);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> +CONFIGFS_ATTR(, media_gt_guc_override);
> +CONFIGFS_ATTR(, primary_gt_guc_override);
>  CONFIGFS_ATTR(, survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
> @@ -956,6 +1065,8 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_disable_vram_page_offline,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> +	&attr_media_gt_guc_override,
> +	&attr_primary_gt_guc_override,
>  	&attr_survivability_mode,
>  	NULL,
>  };
> @@ -966,6 +1077,8 @@ static void xe_config_device_release(struct config_item *item)
>  
>  	mutex_destroy(&dev->lock);
>  
> +	kfree(dev->config.guc_overrides.primary_gt);
> +	kfree(dev->config.guc_overrides.media_gt);
>  	kfree(dev->config.ctx_restore_mid_bb[0].cs);
>  	kfree(dev->config.ctx_restore_post_bb[0].cs);
>  	kfree(dev);
> @@ -1479,6 +1592,43 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  	return len;
>  }
>  
> +/**
> + * xe_configfs_guc_override - get configfs guc override path
> + * @pdev: pci device
> + * @gt_type: type of the GT for which to get the guc override path
> + *
> + * Return: A new drmm-managed allocation containing the path to the specified GT
> + * guc override if set, NULL otherwise
> + */
> +const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_type gt_type)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	struct drm_device *drm = pci_get_drvdata(pdev);
> +	const char *override, *path = NULL;
> +
> +	if (!dev)
> +		return NULL;
> +
> +	if (!drm)
> +		goto out_put;
> +
> +	scoped_guard(mutex, &dev->lock) {
> +		if (gt_type == XE_GT_TYPE_MAIN)
> +			override = dev->config.guc_overrides.primary_gt;
> +		else if (gt_type == XE_GT_TYPE_MEDIA)
> +			override = dev->config.guc_overrides.media_gt;
> +		else
> +			override = NULL;
> +
> +		if (override)
> +			path = drmm_kstrdup(drm, override, GFP_KERNEL);
> +	}
> +
> +out_put:
> +	config_group_put(&dev->group);
> +	return path;
> +}
> +
>  #ifdef CONFIG_PCI_IOV
>  /**
>   * xe_configfs_admin_only_pf() - Get PF's operational mode.
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index d726800de26a..514f115e1977 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_defaults.h"
> +#include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  
> @@ -31,6 +32,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>  					enum xe_engine_class class,
>  					const u32 **cs);
> +const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_type gt_type);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>  bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c042075a36e5..98cf7f658b8e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -10,7 +10,9 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_guc_regs.h"
> +#include "xe_any.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gsc.h"
> @@ -291,13 +293,16 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  static void
>  uc_fw_override(struct xe_uc_fw *uc_fw)
>  {
> -	char *path_override = NULL;
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	const char *path_override = NULL;
>  
>  	/* empty string disables, but it's not allowed for GuC */
>  	switch (uc_fw->type) {
>  	case XE_UC_FW_TYPE_GUC:
>  		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
>  			path_override = xe_modparam.guc_firmware_path;
> +		else
> +			path_override = xe_configfs_guc_override(xe_any_to_pdev(gt), gt->info.type);
>  		break;
>  	case XE_UC_FW_TYPE_HUC:
>  		path_override = xe_modparam.huc_firmware_path;
> -- 
> 2.53.0
