Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE998D1267F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5BF10E68F;
	Tue,  2 Dec 2025 22:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw8Y7iIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1870A10E68F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764716370; x=1796252370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v9og8jVxKfffFncFDIJ2sQyvdqN/D84NFhFNLqBRrmA=;
 b=Mw8Y7iIKuepqcFmSu3ZqbiQigo3FQ6C5qkNQPLy7tqJVo223YFioy8Mw
 wPGI3bUWeygxyKhVEgkRma/yfTeo9gb/UlW/z7emlPRg2DQYKr5dL2UTl
 j9a0x0++QbWYNB6eXfwaoOC5C8h/aVWvf34t4V09NTjwvpxtF2N5+LF6W
 H0sx0IqZcB+eBcBdCkgnQ/YBibE2bCyqkumg9OVTwuVrA0Rhr1JaLlkIX
 wmTWtS5Cox2O05FExk7mFN1x1rsegwwYDn9p1ESlVMNq+bA71RZ7Mcivq
 g1IMLYf9kfs0FpO0ROqZBzxmqn8koG82A+m9uCa4Aw4sTFZo9b0/nm5OG g==;
X-CSE-ConnectionGUID: +ABmx8n0TOC/YWGe6mUxxA==
X-CSE-MsgGUID: mHS7r7ljQla0JXWPMPMYRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66736600"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66736600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:59:29 -0800
X-CSE-ConnectionGUID: nkiJ6QMIQmGplIGcyqFbQQ==
X-CSE-MsgGUID: t7lJgjvEQjClgt8pxjVBlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="193599295"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:59:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:59:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:59:27 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LidQq10vrAZqRAmoKPIIGejE/MmEP0g3yZhhEUvJ1I4iLvNIEC5fNGE4j8J65CN7i02SYStDbf2iyjoZvYosrHpOxZsGrMNxVGUzqZPKrutJSQXea01f+Q+KirZqlzu0xAjVs1w/kY2gKwEDg1DbdeANAlAMRB1Mqq7e6IHUkgMCzppbJGTHJIMjg6zTEyJgPFiD4Mb7YUTVA4Ij1SmnkGOlU7rHKCJhqJ7RAdDtuGOIo6W1ziA1BvZQSUkaVVdzl/L9O7Ej62AXzh4RWCFf82Wfv4g1+DR1k2pRXx2qU+UZs6hma94QT2Slzs4VW4dbFryKsj6ItZPqxVxEd9++4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryqvVN0FlV3i9Khx9Cv/E765fLv0zAZv6yYnJ7fbUls=;
 b=mYvTe+98vAJzlHRsTgXP5PAZz+Ny+7g6+1MdwMkLQ61xOgRRr8cwRA2qLmmiX9ifgoH/2ZOQs4jwXaUIOhLRGlSREDw0sXaq/encHOkoV+rfc3UV2VDDaOx/BXNDQhAsaFchw6tNA2MlkPpAiGEYSN6gQrLWPoI9x7/H/fOck/ULxSiG1QkoB2kWboG5PtSLhoEYKiqVpaG9EFV06xhcw12vaqmSzT3Ct/c0W+/yJWSMBdxe0VIhN3YPLpEYY811aIybyB50VtaZ+2UGEk/uw1eGrEGOhTxidv9iQvOBQlC+KJnrFTxeB8fn2+8cMzxfsNavFlQX3gIyhsr4znaYxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:59:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:59:20 +0000
Date: Tue, 2 Dec 2025 14:59:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Message-ID: <aS9vRTsPCfjoIyYo@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-24-brian3.nguyen@intel.com>
 <aS9oK/4y0NQM1w/l@lstrano-desk.jf.intel.com>
 <SA1PR11MB88390FA6405D467DFEF90266AAD8A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB88390FA6405D467DFEF90266AAD8A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac225c1-42dd-424c-11d9-08de31f66d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JfINwqa8MbA7Zg/m4Ib3tvSwfZUvA1a9k19pGVUGpniJNzKAGb3idM7JDrzR?=
 =?us-ascii?Q?sg1oPKYGP9g6DZivr/KwGpvqGAF/ineDtdqdibE66bmB1fp4zta4JhRoSfoF?=
 =?us-ascii?Q?m5/kP7FDHamZqE3G3LfdWhtBYoX/z5yt+QM7LqnrrBCQt0RMzMAwXJU/whvo?=
 =?us-ascii?Q?CnxYLUaOUUl+CGOqTnWlOjSSzueaCNqk+HGrqrJU+Y1dq+Ow/efgnVqIGGbY?=
 =?us-ascii?Q?8I9X9Qq+Osa5L73vQJhqxavyNJYthyiR23BUDhdcWt0re7ImRBuptV8YoUMD?=
 =?us-ascii?Q?5/NQU7iST5qwAyVQtdoNbrdvr+WvhTfIJnjdjRG1Wme1Jm1S9suvGN7LibrY?=
 =?us-ascii?Q?lULpfzr2bguwrBaj6ec7Ar1GcysFcGEchj9O4yfVRjef8vTZ/1uBtiXaYLhx?=
 =?us-ascii?Q?O7ALa9F7vBGDeyuyv5AAWsy/ZzX+W84zy9HHqdV6OR01W5WMBFiwGUa+InPK?=
 =?us-ascii?Q?/Sj55B4FhbZjnl+D9+5yAeldbgoOoXG4UFrRR+RXeb6cXQ9wQs0qv2TZWQY7?=
 =?us-ascii?Q?2c+7/q95fQvVZ7diQDWq41YcaI+8KVL5GaOSxZHjx27jCY/WL63i2DdGHzRm?=
 =?us-ascii?Q?wRcrAUYf5+1C4saD2j9DtTSsX1MyWzMTNbgJu9KdhFBY+Qz5/HBt2POuyvHd?=
 =?us-ascii?Q?r76X5btiWqdjBJHftBjTwqcdraPoAw7323w8NEp1+OHwtRU/0SzQ/MQDFHRe?=
 =?us-ascii?Q?2KWXvznv2CZ4ImtnTDI/QpThhk9jGkhjzcmdHnx1T3hrmspTGwyTwuGy9cC4?=
 =?us-ascii?Q?U2K8YEezeYsJ6hwmoEW3Qk/F0jxO33PfNL58k+I56ly6EycKqXG8yKybFbok?=
 =?us-ascii?Q?3XL6NX6d41y/pAnPKgCCN+lVEPheunia9vPg2qXlBwQ6jywQfcEzO7uUenDE?=
 =?us-ascii?Q?ndLVAt4XQAKt4+BPaXmJTwuIjBaWbwjIX1cbwEmGPLn9nILsTbaVIk4s2a6s?=
 =?us-ascii?Q?4XFvsbanbEzLvPwDQaWq67rgLIykWSSB4H/VZ25eSZKDqv5j+3AW5Gcg8R3E?=
 =?us-ascii?Q?pxeXB7r6ymtLWhsHfsaUVuBSZ4sUTEY+421fiqQW+cgPJcTmLCCDnqIjynX2?=
 =?us-ascii?Q?QgIBVcBkbOHR+vm/1WR8CbjJviLE9hjW+dkhzH66YHMjhtK/FMp/GqPw9GkG?=
 =?us-ascii?Q?9Wrxg5u9beK2d+GIH3hSEKLl/DT7SCe96TM3Ki0Ex2uV/qc1cb6hpWVfEtHR?=
 =?us-ascii?Q?IhwNzae5NgI84H0X2niKkp+iPUC4ieg5K80LMOpfLYOHrmipTVJC9+frbc9s?=
 =?us-ascii?Q?laBPvm6cUMPL97ZyEYbN6nCOtkY5nme+JKGQoEmPYo744fOKQ0xo1MAXQfQh?=
 =?us-ascii?Q?oLLRhGwuagI7V7d4ZQwHS6I54OwhuCmk+GOmCuHghdD82/EIfDTkn4kEFoCy?=
 =?us-ascii?Q?fXE4IxPDacNlgywXlg8k9ipxthHENJo2FzpZiJJiP83ElkcStp3lfqEG2IXF?=
 =?us-ascii?Q?x/Z9nfc3TZ6ZuvgeePRfNdIT0O6TLPYt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPT3o4Q8PHt1ESLHuQv3vRnoK52vYHfql7wnVHLYLR9t/mT6RymJNdlf1eQ4?=
 =?us-ascii?Q?s7qXcn+gx9D4MCl8H9HgPQATKDBnWifJ+a51JixfCzlJSuBdkS6aSu+7Q79b?=
 =?us-ascii?Q?SxkAAJ25CuBPNgAwglt9AyHJJB7SJq3qR3qhVcIGHNfPh0UXrhpOeurh0R9r?=
 =?us-ascii?Q?7PQTlssWo0yBG/OsHDslutUb6mPBMZ+tX5sMRwq2cFCSk1wK+mTop3e9OHss?=
 =?us-ascii?Q?vsCP+25VRUQQ85cUKBT5nJnvd7WpB9ZEhl/RTQs4+C51vvl32mfUzLBtryQ4?=
 =?us-ascii?Q?6Qi4cA/p8GynIcSfuLi7iyJM2BjFQu8Cfwn8o3kZEMkha+wqOXal9tJk1THp?=
 =?us-ascii?Q?GKOuvQFGI2pnaOfEIeRtcI9dK8mnJ+7gcmumjAJ9RWMzm3W1mVfjD89ZjsP0?=
 =?us-ascii?Q?pkkJp8Cqu874jf1Vr13BNwGRoQHLdZvZ0bFT2ar861YhfBNZGytQOJjJ9kKq?=
 =?us-ascii?Q?utGvZn9NgjJHgGzhne3M9NjPhHrZSakPB7LERg23Onoizq+wtkJw/dcBRzqy?=
 =?us-ascii?Q?W3zqG91ohLYhuBi2UumIDF1k0LJX8wMLBKdis705JZ3LNjhj+LoVx5P+TR/K?=
 =?us-ascii?Q?9mmXKh0FXJCaqxf2pLd6NwlYn1kNrt2D8TaDuaynhGpGgj/5ouDTIFHgX+vY?=
 =?us-ascii?Q?p3tMVy0y2GpTC/ySIRTAin0NxULH60ILtqgRlWSVKkS9NnPSQ2OJBxEnyh6g?=
 =?us-ascii?Q?hntmknC7CkFGdUYpqZzU3bRYOvKGVuV5JdDD64RVxT/V/IKJ8XMCcGewitpl?=
 =?us-ascii?Q?sunuqOuLeCV+MUHPqpYQutIaQfq9IXDMhjmkatPC6pgDYiXw8uZfp6gpGSQ+?=
 =?us-ascii?Q?HRJnKGlHBTRDVYDsd6oW4EbPr6oYKf+yi2n4I46fzwRFKzqL1nx5tvAB888Z?=
 =?us-ascii?Q?jNn1pJZOHgFyxpV7qcvKrtQV6LBjKTMg3vKZ+FOnoFmKM1URIHC128r7pgnN?=
 =?us-ascii?Q?Lfrx+gR0O0hPaSRPgzvIl6Fn/w/V2ofoadSUeDX9G8TjGDpjWUz0Ayl0lg9h?=
 =?us-ascii?Q?9Yg/Agz1mG609G2/qJYWcWhCqt0xsexaUbbXurVqNajmA05B8BRRSsduAyDR?=
 =?us-ascii?Q?71WSAq6D16omZsJCOJhv/SS8WdGfHgFAyZfwA1wWtxn8SFtO+KHg2GzDHUK8?=
 =?us-ascii?Q?029o/fSPY4tKjnzSSZzzWIU0mQZjmriUzAkqHXoXbOw8WL/HgSiZSrV6pxHi?=
 =?us-ascii?Q?LMj2XdqLRP8G/YCDuVR5R5srvK46uXyoS/WnpzpWKsm2tvk/KqEYSnv9+4fG?=
 =?us-ascii?Q?+VWoOe9i5lK/NyQnRW540Jv0zjBl+E2+sH+ASl2URxO1rj2oftlqeRtvLPqL?=
 =?us-ascii?Q?N2dIlq549bPW9CaBZHxkOxKB7GQcjQzMZl25ekmaqGUSx5wdUnvzWFvEq3TW?=
 =?us-ascii?Q?S9wZ5yTwe2KXulKKlfP9CY2aTPUw0YsAFD/HaZhRjdbytHbyCUk3cnkfH/gR?=
 =?us-ascii?Q?7C2t70rT2OEgLVJufVs+b0EDpK4r6qFGzgKKnN44jZEYyE+ja9fcVen/9V5H?=
 =?us-ascii?Q?aCKPGZ5pC24tHDRl3SeSc1Gb/u9a9gO5OrpSXfwQQg9jzpItIdJQWM0kmyCb?=
 =?us-ascii?Q?ZnctVBiUdsFTrUaJE8qpOscbHPcMjrGUmB+h8LwHLWbFe3xGWEqWywo5wrm6?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac225c1-42dd-424c-11d9-08de31f66d8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:59:20.3865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WzIuqmJC65HpSHzQ2mVhJCFe1AL3IHluaUnwrYQmetOVmaRhNkM+irw4V4c5cO+k1PkGlyzG0XI3SAzXFDilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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

On Tue, Dec 02, 2025 at 03:51:53PM -0700, Nguyen, Brian3 wrote:
> On Tuesday, December 2, 2025 2:29 PM, Matthew Brost wrote:
> > On Thu, Nov 27, 2025 at 07:02:12AM +0800, Brian Nguyen wrote:
> > > Allow for runtime modification to page reclamation feature through
> > > debugfs configuration. This parameter will only take effect if the
> > > platform supports the page reclamation feature by default.
> > >
> > > v2:
> > >  - Minor comment tweaks. (Shuicheng)
> > >  - Convert to kstrtobool_from_user. (Michal)
> > >  - Only expose page reclaim file if page reclaim flag
> > >    initially supported and with that, remove
> > >    xe_match_desc usage. (Michal)
> > >
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_debugfs.c | 41
> > > +++++++++++++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_debugfs.c index 1d5a2a43a9d7..296b8136511b
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > @@ -291,6 +291,39 @@ static const struct file_operations wedged_mode_fops = {
> > >  	.write = wedged_mode_set,
> > >  };
> > >
> > > +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *ubuf,
> > > +					   size_t size, loff_t *pos)
> > > +{
> > > +	struct xe_device *xe = file_inode(f)->i_private;
> > > +	char buf[8];
> > > +	int len;
> > > +
> > > +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim_hw_assist);
> > > +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> > > +
> > > +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __user *ubuf,
> > > +					  size_t size, loff_t *pos)
> > > +{
> > > +	struct xe_device *xe = file_inode(f)->i_private;
> > > +	bool val;
> > > +	ssize_t ret;
> > > +
> > > +	ret = kstrtobool_from_user(ubuf, size, &val);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	xe->info.has_page_reclaim_hw_assist = val;
> > 
> > This does seem a little dangerous as someone could set this on unsupported platform or GuC firmware. Should we maybe store
> > page_reclaim_hw_assist_supported + page_reclaim_hw_assist_enabled in the Xe device and only let page_reclaim_hw_assist_enabled
> > move to 1 if page_reclaim_hw_assist_supported is set?
> > 
> > Matt
> > 
> 
> I had a similar check in my first patch, but I believe this is prevented now by not exposing the file on initial xe_debugfs_register.
> This should handle both the unsupported platform who is always false and GuC FW version check, which is done currently at
> xe_guc_init, earlier in initialization than xe_debugfs_register. Is there a missing edge case here?
> 

Ah, yes. I missed the file only gets exposed if
has_page_reclaim_hw_assist is set during the late part of the driver
load. My mistake this patch if fine then.

Sorry for the noise:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Brian
> 
> > > +
> > > +	return size;
> > > +}
> > > +
> > > +static const struct file_operations page_reclaim_hw_assist_fops = {
> > > +	.owner = THIS_MODULE,
> > > +	.read = page_reclaim_hw_assist_show,
> > > +	.write = page_reclaim_hw_assist_set, };
> > > +
> > >  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
> > >  					    size_t size, loff_t *pos)
> > >  {
> > > @@ -397,6 +430,14 @@ void xe_debugfs_register(struct xe_device *xe)
> > >  	debugfs_create_file("disable_late_binding", 0600, root, xe,
> > >  			    &disable_late_binding_fops);
> > >
> > > +	/*
> > > +	 * Don't expose page reclaim configuration file if not supported by the
> > > +	 * hardware initially.
> > > +	 */
> > > +	if (xe->info.has_page_reclaim_hw_assist)
> > > +		debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
> > > +				    &page_reclaim_hw_assist_fops);
> > > +
> > >  	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
> > >  		man = ttm_manager_type(bdev, mem_type);
> > >
> > > --
> > > 2.52.0
> > >
