Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21016C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 01:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E1B10E56D;
	Fri, 16 Aug 2024 01:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRPr6ZiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AEA10E56D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723770696; x=1755306696;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nnZvc0lT83ZdeiV9qElEDrK+nfeWs0cNBA0HjDtOdQE=;
 b=JRPr6ZiYj9wgi2grAyyYfOxvyUyzCNrjDTKKtSi81e9BWXMROMx/EWfN
 1DRbaTrmG64uxS5qVJjYCZifRu6gmuKkJie84U1+FHHth2MR7JL/XQLkO
 2VLRZ5P2UPULjbLbp3o6K1FltJC2NHAalOdtenJJuHOaiTek1TPWTJtK3
 rglDqwn/1VzUUVuTA3nZfuY2a9MRNcJthEkdawplQWU8l+j5mDTurZkaC
 jLy/gAhN4aS7eJEzc2vm/2xclbIMhEh80Eaade5gA+gONR8uIE+YiuIvF
 tjCVbJxZrNCRykQYOPQF76B29HZ+iEReQdg+KsIL0OxCBiJb+Ma+gSuD6 g==;
X-CSE-ConnectionGUID: xpzsdoKURbeKBnoVwbXgiQ==
X-CSE-MsgGUID: ibDD2neQSkmfQb9/dMjMxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="39572058"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="39572058"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 18:11:36 -0700
X-CSE-ConnectionGUID: SmHKIE8RS3uDuRMWrq7Teg==
X-CSE-MsgGUID: v6n2e1dVSM+4LZP0u4POfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59478966"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 18:11:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 18:11:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 18:11:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 18:11:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 18:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWevGScLnFklFSNsR57B9+S85GIBSqCLpXkU7R6Cjj/zyZGjnmR1E67iZxiPdukXETHpiBBJ/mFwk6bH4alc0CIY5GlAABzVXuRmLEp0eN1MBBymMhlIv1Tc5UyFfjvDEILOtrSJMMvjV2+gL4HwS+VQS+2xZM2naMxgLgDGLSygoczjIkG/1JCmz1OD3L2CE6T4OxfR8ylp0Cnl52UE2gbThD2Kh1vYrNZlMmZn1vxYSSfk0i3/R0qL/lln1jRRTRBCLVYnB0WmIFfHDOYhqp02wHhp8sJNX0kWD4u9byUYQNh+ai2k0lM96S1BxcW2IggFZyQukfph211twUfEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PlEjIqlI09Zv+48qRgzcQwsblbp4ucEMKRXb+/mv40=;
 b=JZtn8CdzdupsoP+uv6LVxO7UzOdyBVjTrmuc0XF5NFyL9EL/EiAUaUh+pJIMkCZO4tqynsg80fJXs0R4k9PBYG+vrgcCyaGh5CL0naJonkPg4j0NXWQl6z4G3FgoQIITpt78XnHINt7E8w4eu9ILr3Rjnqb9wTp3paVuyC0UvKbCP6dQMEVqLLsbW+vlMJlAhz1l1QRRt27K6G0TH2B8w4FORPXabKG/RScuG0UvCnbOL2zxqc9Jgxpu7ymRjLya+KnzNr7OUO8xuyqDPSW2x6UVSdmV9X/vsL3MSwWsSIxS42gcAKLnNti9WlFCA7nnfCqYoy7eLhnwE67EIbW9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 01:11:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 01:11:25 +0000
Date: Fri, 16 Aug 2024 01:10:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Use resevered copy engine for user binds on
 faulting devices
Message-ID: <Zr6nAX4KmLz2pEn7@DUT025-TGLU.fm.intel.com>
References: <20240815204207.31720-1-matthew.brost@intel.com>
 <CH0PR11MB54442DFBFE559E1339938590E5802@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB54442DFBFE559E1339938590E5802@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0028.prod.exchangelabs.com (2603:10b6:a02:80::41)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 215f5dad-5208-4e2c-ac8b-08dcbd905963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4GdtI0QDXbyFpY05ll0v97FeyQwAomNUPlNk1dYL0AbubApnE0HR5N2SqA?=
 =?iso-8859-1?Q?v5y+1+4dU7FKrMLrPJnRAI4GafOA+7ZrCsXNaAy1hW+Ndy22ln4yqhRPwi?=
 =?iso-8859-1?Q?n9uOOP/WPjdFDzVAfJklzOo7VnYHO1z4z2McpTdagyDmz6KwCKs7tkjlr5?=
 =?iso-8859-1?Q?3RoyEYG8kjY8lO2mDATGq1502goeKljVyym5Cmt3v7/rk7Cj+V8v0dlJDd?=
 =?iso-8859-1?Q?s92R9N1HjhMI6SonnLoLMqcXavZ4VjdglQHgK9DbNY41ktRwZa/KHazJNl?=
 =?iso-8859-1?Q?1A/AvIavjZW5q6G5YEjacRxjz2M/dRZ1ad9JPfsNC/F9AHeHGUTH3HRsFC?=
 =?iso-8859-1?Q?Y1uLnkYeQ/hSaSYSgxBCRlgVpsIF+Q+VzSrgeYtiCMjrGC4fZSO/xM8S2J?=
 =?iso-8859-1?Q?IrtqGm/eX7mk0sRT3elNyRUsaEHSWZfUBt8ayFiTU+UuaXd7S1VHfMikmq?=
 =?iso-8859-1?Q?e1DzCm7HTwTZUEomtpIbSRA9cmrfYYy46d2kf4DneXY2LXQuLrUKtCHS/o?=
 =?iso-8859-1?Q?ZjUaUvKrRX1MZrP+/O6XGfsIl/rA+JQ0SCIZUPUuzxReaEGwKO09yxz8oE?=
 =?iso-8859-1?Q?l16UIZ5wRUKTRPSSoENJervT5L/kKLBoxQN2yC65flKU86g66ZszSHcB/A?=
 =?iso-8859-1?Q?cP+BWwd4jRDJeuPgbiUgoBVxLPvEQbAr1R9VzFVqMLuNHbrRNsUG24q32L?=
 =?iso-8859-1?Q?qJIL1PuG5za6F4SPnPN422JtPdY5i/2IAOc/hdZwk6FkvIGWnGtbR5Ru8T?=
 =?iso-8859-1?Q?Y2MNz+ZYvZXpzIOlWe1xIbM1Kuqx5Lrj78HpN585GM8EgH4TNprE24ryxk?=
 =?iso-8859-1?Q?wefAuJZPqRbiemWcer5IW5UQeXElPKGci/VzXJP98sJt0oWhUooa7HIaam?=
 =?iso-8859-1?Q?aFQA4I4gArTkgBOmhTV0G87StReSwVbgr1X+FILxA2y12/N78JNUnTOolB?=
 =?iso-8859-1?Q?6MlDndw+xUkh3fxK0BbdfjR0hF6dnC/Lq7j3Wekyps5l8pJo9ZFGlTRE3d?=
 =?iso-8859-1?Q?3RCyq1dW59/7qhuwKTT/Z0NYBwiseDM6UO2Ch/db2wZ6a90gCzKUe7bc0K?=
 =?iso-8859-1?Q?p3LiG7U51hhpK3oZAjuahQk5Plim9M+DWG5sLXcp+ue07hm/WdPT4ZvACw?=
 =?iso-8859-1?Q?7717kn3snWHxylo1/DnlREFyMjgrmOdGrhx4sOOSCoUGpflm8Er4y2mvDK?=
 =?iso-8859-1?Q?FuFtKvlai5yEiKxmb2dTFr0tWxcJIPKL4O2px5JTOuts8zWfbNroyRSwE1?=
 =?iso-8859-1?Q?FtBC15mq/A4SxZTAaQCessE44WVKK/nlLWmBIOCi6alIHOEPnxfsrPjzCh?=
 =?iso-8859-1?Q?V8TOfOpno31GNwlA8S4xXfoPX7TRUjGEj6l6o7JczkLhfzsDfFOYPElEFn?=
 =?iso-8859-1?Q?MCiytZ4V96zT/o9yT5aQKEpwT580gSuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lc8DvDbPOXp5EKfgpNYaLZNizsaua9Ju3FzFmsztBk4chkQa5iB7/1vWl4?=
 =?iso-8859-1?Q?q7yJ1uY6567ILtqDaNuclUtSB26u8iwheTRLDcU562vnmoWVANvpaznMmx?=
 =?iso-8859-1?Q?2L1JX8AHUT+aCQKp27oAZqvFGlEw4v8erbZ0xasMBVTwYaCRFxRklz5evS?=
 =?iso-8859-1?Q?fgcHHkxWJroBJJYhne79UCjIVA0nLIhwRP8UZ5hLp7ybmZzCIIV959A5UQ?=
 =?iso-8859-1?Q?OaZNYM1zsdSj0htE+4yFJmHKaWdKeNXv/lAzzs4fBQygPJXhUc6rY/FIiM?=
 =?iso-8859-1?Q?buoUuoD8+mddUZ6fAe/AjqXb5PDCKQnJse/t8gsKD9GeKFCuSTDOYBz+/x?=
 =?iso-8859-1?Q?XxSBTiQYSKoK9B1Z0YO4MMsGUX144WmkW9gHzpNV3uzJOQSXVItu6YPeAl?=
 =?iso-8859-1?Q?AcbggmjXla1Z9KTSXLMdWBPn4qi2NjWk17ofcSVwBchtCscpTojYHvJsyj?=
 =?iso-8859-1?Q?o7Omc7+CEAa/TjEPLuPlqbGTVRDzPRGE2jQ911MTVodeOt8KKd2Xea2UOC?=
 =?iso-8859-1?Q?RPp4C8oQvq2utoWhTL7Pi4dKpuBo9rS4BLgboaINWHVqHZIeJW32WQ/sFO?=
 =?iso-8859-1?Q?0uBFUUriNFa0gV6C1gFVBJ7kxAUO7TtaVic22HKeASzGbJp0r/OzeQU2Ay?=
 =?iso-8859-1?Q?9inc2d1gU1wUwbpYobSDsiFty1Hu9I1tDyOMxtjVjroX/LHpS2a6NLR40X?=
 =?iso-8859-1?Q?P64EKd3/McrysTLVJv3s0B3g0ywXsJTlfKxeEQpaHHnj6Z2bI539xYc1iO?=
 =?iso-8859-1?Q?cuVDB/1PEgQ5IVSsZaujhMbf8DYHStY2l1BR6LJCGiOV5WHUdK2V380aqm?=
 =?iso-8859-1?Q?fmVQIeGpfbcUa8eTvmqjEyivoaXThwHNV/Yo0SXV2mVWlJEmBpZYIm2IWN?=
 =?iso-8859-1?Q?o7qXp2Q8X1wSFipZljRO9VO6DTgIJQz6lh3b6EVvSXGKVNigBOtVvL/fa9?=
 =?iso-8859-1?Q?J89EKqCZ5wv9RUCWEJCaSZxeTAhv31U+MLyOcGpngh+8JW6Dma/a+bvvs0?=
 =?iso-8859-1?Q?x6CeY9egWpd9RH4YJYetjETmziqe7BZnx8maA6RbD5L/hNX7zCeSlp07qM?=
 =?iso-8859-1?Q?XGVtBf4RfDJggkLDXhs1vri3f5EMSYOEYjKt1kzzmHECzUo3+oeN1qeyd/?=
 =?iso-8859-1?Q?FJKkJXYrQOnMY2ED7fBKesMSnAIphKEdmOr525tCP62//mA20VE/usgohQ?=
 =?iso-8859-1?Q?LPMfDr/MHaAETNuTWYtZyclIWVoVnbmMovs5cD0te5NchJLgOxOzINiQnq?=
 =?iso-8859-1?Q?b6Y7Ur6FcpjubRXFND6fTOOBe0VEierUB6zRSPLvk1j5MjPxEy18eEoxTP?=
 =?iso-8859-1?Q?DTPg6rdgqcboU2V6ZLXy437aWeOskqIPvYHZhsj5chWPiPYt66DwQDJwnk?=
 =?iso-8859-1?Q?7g01Lcmwmc8/hS+jwb3bKyC2+Lr5pYCbG5gFxk0n9sCdfPQlfHLF1Q0MHQ?=
 =?iso-8859-1?Q?vWM7bggYbBP8Hh7shWOlJs75D2EM22t0MCqqGorz1zV1A8sevOWdi9VCek?=
 =?iso-8859-1?Q?cUz+gEjvzzWRO4OISvScx1Ou1dy0eUNEgJQYJ9RcK7WYnSGs3w+x0wn9fK?=
 =?iso-8859-1?Q?+zBrmw/eoutK1xiHbS5C5VK2YNB8ZtCe1B5GAYz13DwfBkUPtkJ/XzpNSr?=
 =?iso-8859-1?Q?gbSk7pAIUKcqnjvu0WLJysa2PRCu+0gZVu4jkxXKujxjBBORFT3MGN0g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 215f5dad-5208-4e2c-ac8b-08dcbd905963
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 01:11:25.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUnwuIy2HORnlxNuoabkJrufenVOAmFDZ1kMo43RXJXb17IoGuzKios06eDuyHEaARzA8CEUCnF0qtWtYVRnBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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

On Thu, Aug 15, 2024 at 04:11:16PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Thursday, August 15, 2024 1:42 PM
> To: intel-xe@lists.freedesktop.org
> Cc: thomas.hellstrom@linux.intel.com
> Subject: [PATCH v2] drm/xe: Use resevered copy engine for user binds on faulting devices
> > 
> > User binds map to engines with can fault, faults depend on user binds
> > completion, thus we can deadlock. Avoid this by using resevered copy
> > engine for user binds on faulting devices.
> > 
> > While we are here, normalize bind queue creation with a helper.
> > 
> > v2:
> >  - Pass in extensions to bind queue creation (CI)
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 122 +++++++++++++++--------------
> >  drivers/gpu/drm/xe/xe_exec_queue.h |   6 +-
> >  drivers/gpu/drm/xe/xe_migrate.c    |   2 +-
> >  drivers/gpu/drm/xe/xe_vm.c         |   8 +-
> >  4 files changed, 70 insertions(+), 68 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 971e1234b8ea..a3a5685a4d57 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -166,7 +166,8 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
> >  
> >  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
> >  						 struct xe_vm *vm,
> > -						 enum xe_engine_class class, u32 flags)
> > +						 enum xe_engine_class class,
> > +						 u32 flags, u64 extensions)
> >  {
> >  	struct xe_hw_engine *hwe, *hwe0 = NULL;
> >  	enum xe_hw_engine_id id;
> > @@ -186,7 +187,54 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
> >  	if (!logical_mask)
> >  		return ERR_PTR(-ENODEV);
> >  
> > -	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
> > +	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, extensions);
> > +}
> > +
> > +/**
> > + * xe_exec_queue_create_bind() - Create bind exec queue.
> > + * @xe: Xe device.
> > + * @tile: tile which bind exec queue belongs to.
> > + * @flags: exec queue creation flags
> > + * @extensions: exec queue creation extensions
> > + *
> > + * Normalize bind exec queue creation. Bind exec queue is tied to migration VM
> > + * for access to physical memory required for page table programming. On a
> > + * faulting devices the reserved copy engine instance must be used to avoid
> > + * deadlocking (user binds cannot get stuck behind faults as kernel binds which
> > + * resolve faults depend on user binds). On non-faulting devices any copy engine
> > + * can be used.
> > + *
> > + * Returns exec queue on success, ERR_PTR on failure
> > + */
> > +struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> > +						struct xe_tile *tile,
> > +						u32 flags, u64 extensions)
> > +{
> > +	struct xe_gt *gt = tile->primary_gt;
> > +	struct xe_exec_queue *q;
> > +	struct xe_vm *migrate_vm;
> > +
> > +	migrate_vm = xe_migrate_get_vm(tile->migrate);
> > +	if (xe->info.has_usm) {
> > +		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
> > +							   XE_ENGINE_CLASS_COPY,
> > +							   gt->usm.reserved_bcs_instance,
> > +							   false);
> > +		u32 logical_mask = BIT(hwe->logical_instance);
> > +
> > +		if (!hwe || !logical_mask)
> 
> If we're concerned that hwe might be NULL, shouldn't we check that earlier to
> prevent a potential null pointer dereference above?  Specifically:
> 
> """
> 		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
> 							   XE_ENGINE_CLASS_COPY,
> 							   gt->usm.reserved_bcs_instance,
> 							   false);
> 		u32 logical_mask = 0;
> 
> 		if (hwe)
> 			logical_mask = BIT(hwe->logical_instance);
> 
> 		if (!hwe || !logical_mask)
> 			return ERR_PTR(-EINVAL);
> """
> 

Yes, it practice is shouldn't be NULL but it is good catch it if it is.
Also static analyzers will quickly complain if this good merged as is.

Matt

> Everything else looks fine, though:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> 
> > +			return ERR_PTR(-EINVAL);
> > +
> > +		q = xe_exec_queue_create(xe, migrate_vm, logical_mask, 1, hwe,
> > +					 flags, extensions);
> > +	} else {
> > +		q = xe_exec_queue_create_class(xe, gt, migrate_vm,
> > +					       XE_ENGINE_CLASS_COPY, flags,
> > +					       extensions);
> > +	}
> > +	xe_vm_put(migrate_vm);
> > +
> > +	return q;
> >  }
> >  
> >  void xe_exec_queue_destroy(struct kref *ref)
> > @@ -418,34 +466,6 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
> >  	return 0;
> >  }
> >  
> > -static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> > -					struct drm_xe_engine_class_instance *eci,
> > -					u16 width, u16 num_placements)
> > -{
> > -	struct xe_hw_engine *hwe;
> > -	enum xe_hw_engine_id id;
> > -	u32 logical_mask = 0;
> > -
> > -	if (XE_IOCTL_DBG(xe, width != 1))
> > -		return 0;
> > -	if (XE_IOCTL_DBG(xe, num_placements != 1))
> > -		return 0;
> > -	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
> > -		return 0;
> > -
> > -	eci[0].engine_class = DRM_XE_ENGINE_CLASS_COPY;
> > -
> > -	for_each_hw_engine(hwe, gt, id) {
> > -		if (xe_hw_engine_is_reserved(hwe))
> > -			continue;
> > -
> > -		if (hwe->class == XE_ENGINE_CLASS_COPY)
> > -			logical_mask |= BIT(hwe->logical_instance);
> > -	}
> > -
> > -	return logical_mask;
> > -}
> > -
> >  static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  				      struct drm_xe_engine_class_instance *eci,
> >  				      u16 width, u16 num_placements)
> > @@ -507,8 +527,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  	struct drm_xe_engine_class_instance __user *user_eci =
> >  		u64_to_user_ptr(args->instances);
> >  	struct xe_hw_engine *hwe;
> > -	struct xe_vm *vm, *migrate_vm;
> > +	struct xe_vm *vm;
> >  	struct xe_gt *gt;
> > +	struct xe_tile *tile;
> >  	struct xe_exec_queue *q = NULL;
> >  	u32 logical_mask;
> >  	u32 id;
> > @@ -533,37 +554,20 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  		return -EINVAL;
> >  
> >  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> > -		for_each_gt(gt, xe, id) {
> > -			struct xe_exec_queue *new;
> > -			u32 flags;
> > -
> > -			if (xe_gt_is_media_type(gt))
> > -				continue;
> > -
> > -			eci[0].gt_id = gt->info.id;
> > -			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
> > -								    args->width,
> > -								    args->num_placements);
> > -			if (XE_IOCTL_DBG(xe, !logical_mask))
> > -				return -EINVAL;
> > -
> > -			hwe = xe_hw_engine_lookup(xe, eci[0]);
> > -			if (XE_IOCTL_DBG(xe, !hwe))
> > -				return -EINVAL;
> > -
> > -			/* The migration vm doesn't hold rpm ref */
> > -			xe_pm_runtime_get_noresume(xe);
> > -
> > -			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
> > +		if (XE_IOCTL_DBG(xe, args->width != 1) ||
> > +		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> > +		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
> > +			return -EINVAL;
> >  
> > -			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> > -			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> > -						   args->width, hwe, flags,
> > -						   args->extensions);
> > +		for_each_tile(tile, xe, id) {
> > +			struct xe_exec_queue *new;
> > +			u32 flags = EXEC_QUEUE_FLAG_VM;
> >  
> > -			xe_pm_runtime_put(xe); /* now held by engine */
> > +			if (id)
> > +				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
> >  
> > -			xe_vm_put(migrate_vm);
> > +			new = xe_exec_queue_create_bind(xe, tile, flags,
> > +							args->extensions);
> >  			if (IS_ERR(new)) {
> >  				err = PTR_ERR(new);
> >  				if (q)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index ded77b0f3b90..99139368ba6e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -20,7 +20,11 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
> >  					   u64 extensions);
> >  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
> >  						 struct xe_vm *vm,
> > -						 enum xe_engine_class class, u32 flags);
> > +						 enum xe_engine_class class,
> > +						 u32 flags, u64 extensions);
> > +struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> > +						struct xe_tile *tile,
> > +						u32 flags, u64 extensions);
> >  
> >  void xe_exec_queue_fini(struct xe_exec_queue *q);
> >  void xe_exec_queue_destroy(struct kref *ref);
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index a2d0ce3c59bf..cbf54be224c9 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -442,7 +442,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> >  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
> >  						  XE_ENGINE_CLASS_COPY,
> >  						  EXEC_QUEUE_FLAG_KERNEL |
> > -						  EXEC_QUEUE_FLAG_PERMANENT);
> > +						  EXEC_QUEUE_FLAG_PERMANENT, 0);
> >  	}
> >  	if (IS_ERR(m->q)) {
> >  		xe_vm_close_and_put(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 22add5167564..7efabdd16abd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1478,19 +1478,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >  	/* Kernel migration VM shouldn't have a circular loop.. */
> >  	if (!(flags & XE_VM_FLAG_MIGRATION)) {
> >  		for_each_tile(tile, xe, id) {
> > -			struct xe_gt *gt = tile->primary_gt;
> > -			struct xe_vm *migrate_vm;
> >  			struct xe_exec_queue *q;
> >  			u32 create_flags = EXEC_QUEUE_FLAG_VM;
> >  
> >  			if (!vm->pt_root[id])
> >  				continue;
> >  
> > -			migrate_vm = xe_migrate_get_vm(tile->migrate);
> > -			q = xe_exec_queue_create_class(xe, gt, migrate_vm,
> > -						       XE_ENGINE_CLASS_COPY,
> > -						       create_flags);
> > -			xe_vm_put(migrate_vm);
> > +			q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
> >  			if (IS_ERR(q)) {
> >  				err = PTR_ERR(q);
> >  				goto err_close;
> > -- 
> > 2.34.1
> > 
> > 
