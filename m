Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489DEC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 00:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABAD10E759;
	Thu, 12 Jun 2025 00:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAe5EP14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DCC10E2AB
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 00:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749689739; x=1781225739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cmyTSf6imEuHS3LwcTPlecHiIvnN8Ikwh4+1BLKB7fw=;
 b=kAe5EP14VGOfvutLQ8Ko77pKXRb1EKTL1Bqv79h3CpkqSk/sbP21u+OD
 DBSQ35ZOVVj6zvHeA9qc03Wkd5gCDstB0tRTFrcnZvhfR4Q8AM/zs6hGK
 86BxEhJWd8RE8Vz17l1uX1457NIBX3W4H4pBNGz5/rasIK+AMUc3Sz6xw
 t3IYYW4sVuqZa1eCmj9raFjKC5uLbOWKgogbCywzzufqeiT4ymAp5qM4X
 KgY7RN3BIvL/bw3BGQoZrs+xJaww7/T7RLBQAnfPHn8JKhCSsHD9yNhz5
 ps8RYjbr8Bqjum1UyTcrp7UUva3ml7ojR7jdBALk3mQHMWnQ9ho7U43YZ Q==;
X-CSE-ConnectionGUID: jJTxoubfQwus5h4Dm2DIGw==
X-CSE-MsgGUID: UO44nU0kRuqfq1Hg6kyREg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69418694"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="69418694"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 17:55:38 -0700
X-CSE-ConnectionGUID: s9XS7ljLThy1EwyrMdvlRA==
X-CSE-MsgGUID: maLvAmLLR2KVkBNSEUPFkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147849807"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 17:55:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 17:55:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 17:55:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 17:55:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFKJi4VP32beemibqRku9HVELF1F9L44ER8zZHq+/mTzBtF1saNikmqpLsqKdvJEEOAaVxAy/y5bt68gXq1F4K1UMp6QxYiV3VuMeEwADvUFmY0mVimGSKdCHdLObKt+Ir1MSv8VPPxdEu5mkLGauipjiqMeCzPLvHkhSFO5/HZVkoN12tAIGy/VxEqbPxfLKvkrGeq9Zl/YIhevbk2+nhn8Aza0yknNG8iy/WFUWtjQGctFzXV9ERiKrCWr8aq9nz0IVhcp1vH4JQILYGJGOdvfQODmGFWQp7DMFXSuyIrt9s63QulgnOJsho+dj4X6H9z4Aixe+rhNoufnGb2w4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2hE/tf2vNyzxAb1hkZQOUYnlWBISeyxFbIRrXGI6zg=;
 b=Je/VRZQck3s9IrKc3gD/RZMNuT4ocH11O2VcOcUsDhXEGT9yQTL2oFL2YQP/nXhUtbDNN6n17qj/yXrKaPVnxIIDWLJTbbdlUxcoDwWOH3mvNpPNLHbKsCnTkfj8ThQSLGxJmolZRS93C2sovCzB6RoIqEpxwP3XJ+MMdJPiWk2adGUH83OhmRY4tGAZnnAU4VOp4caPEkPP5VsAtkwG9mFLwVGeCjwa68yoo+sp2Tz6ME11M6Xx8R+fbOemW2ZTQPC4Kan3Vvcy7yDqQE3LamOpFCoMI9mAvlVVp/kGYin9hBegbAGxGuT4KId8bUE4q/nyCNf2sueSGth4/VFzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Thu, 12 Jun
 2025 00:55:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 00:55:35 +0000
Date: Wed, 11 Jun 2025 17:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <aEol5y/5FA1V0ZAE@lstrano-desk.jf.intel.com>
References: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
 <7c4a125a758c00a506927cb3549736c1eb9d3886.camel@intel.com>
 <aEnKG6LYzYE7f3eK@lstrano-desk.jf.intel.com>
 <dabadd3dd43fa70ce9a13f5f507bc6b421673d8a.camel@intel.com>
 <aEnUfsBrPnVejB65@lstrano-desk.jf.intel.com>
 <3ba202fdc129e510cffd11d824948eeab8b29e71.camel@intel.com>
 <aEnpPWcXoY9Mz9oE@lstrano-desk.jf.intel.com>
 <50a9868d8b9283e84e17bdcdbcc17521a67858f1.camel@intel.com>
 <8293c286fa209c13e1ac7e2342a5b0237b3f955a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8293c286fa209c13e1ac7e2342a5b0237b3f955a.camel@intel.com>
X-ClientProxiedBy: BY5PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:a03:167::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b8ed1b-8956-4fa7-a543-08dda94bd701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9xpddklEapKWFP7AEDyXpswQdpkSQLdn9dlcZMlooZIeaBp2tqlIE47HRs?=
 =?iso-8859-1?Q?BIbOELS40nDOAHZP7FMLIQVVho+QNPX+Xc2semVdWJy43g3vHMJAFxxt7v?=
 =?iso-8859-1?Q?6bWti0xB7Ec49B8NafCwRogiqtHkOvVhY5qQ1zO8hGIEIJggfMTmrvvC5F?=
 =?iso-8859-1?Q?K/gocXzb7WYOkr72tjNtBwCv56yMaQfIJBMWzBF/QQ3XHjvfSA/EloMvK1?=
 =?iso-8859-1?Q?ndCMpe54kfJxwA/WumsTSz4xyck1V/XS3nP3mMBtNrneT8bfjwKvedKbCY?=
 =?iso-8859-1?Q?LDHUsJXxOtF/ZfomPiAOSaR81LBak5nq9UkK9a8Kr50Kycp2C33BvldZU6?=
 =?iso-8859-1?Q?HKIM8sbeyM/f5xxnfrzMk911XXtlMQd1Kjen7KgadiXbwDhGVGhDHl5HqA?=
 =?iso-8859-1?Q?blChgpcd0THLx7n9S82mw0YKfe+9XOawlIqYX5dDW4EL2K888a+RnCJQ/0?=
 =?iso-8859-1?Q?+swVslWBN8JN9gOyVfGe6iu3TLJxi6VV/yV3FwFzlRHQmdGgYQDER80C4/?=
 =?iso-8859-1?Q?rsNfAvtbUet4a4iPNEArKuDWYX6QqoOvqrTrt4BOSWp4NwH4dtY2rawRz1?=
 =?iso-8859-1?Q?NjzMgm1iC5rIkJEKfnszew48phSGa2rcX+G3ouK6dCiqqwsT119QNBjYL0?=
 =?iso-8859-1?Q?cQ8gQH8l5hOHf90YNiWxvTxPSMubLpMItBMd2Ub3rZlzjWVvaYnBd2lzcx?=
 =?iso-8859-1?Q?J3wXY5znGq2xVzQioTE82vwhCH9ZkFphJLN0fBhU4m+n0VmJgYWs7aQzOP?=
 =?iso-8859-1?Q?OHsIr6fIPhjIgI3Iv55qwafxatilTeXk2SjXImP8jLXisqcZuaerNQOy9Y?=
 =?iso-8859-1?Q?CpR6GtrIhz/aV1960NPplmJDKnQNvpWTFKScAqQvcuMLNw/4T+owUYFB0l?=
 =?iso-8859-1?Q?Vd5gaQkmtWmhZiTpAQ1+efY2wVsj4ZCMs/AzAE9M3ybZlnN1Hj5LfEZllo?=
 =?iso-8859-1?Q?uEiBhG411uUkDDB3aJLryATPxmwpYVyYQvjjov5FOPV/LHuJf3CZq4Iwva?=
 =?iso-8859-1?Q?LkujzT/63DCWARRpjG2boQhusqwNsMGwoRitxlpOFv/QS7UhtxONVVV++n?=
 =?iso-8859-1?Q?xI6SGtOeIdsHzfkUanMfp6IkxcsyuYTGJg74WWHlWKNbtyrralZrvh5tDQ?=
 =?iso-8859-1?Q?zHOqQ78GB2YR7EzP7JNoGXtp+4KZkWm+7ruokKQ5je5M9E8AKVf+bwRnD7?=
 =?iso-8859-1?Q?Ry3n0hHWn5Bayf4YJOoSCLFthPjH7/SxPQTgfZIcNPJaMKYAIbCYux7QYk?=
 =?iso-8859-1?Q?AOQZA53ERnTeUVkbPhBkDx/akndtdQbJ/vHVBW8Z3RBRtIWeYvJRpBakjr?=
 =?iso-8859-1?Q?rWaTu9WJcnns3V/raN79IDrPYCtlVIptSq61ZttrhwxWCqBIgGnDE4Jzso?=
 =?iso-8859-1?Q?s7gM/ZfUChxDJOqlOA3DatUD367Gk17dVJsebhbUm/ISygSsIcRO6EFWly?=
 =?iso-8859-1?Q?izWZQSek4O5Mimsqp9kBMJEXLFqHpxcjRYmd7GRtYUAHiTyDUSYL31RO8f?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hwl0oRjqBiqVF0boHsqGNgk2XWCZVAT/zIc8LSDL2o0nODHK/Dn14ibcTo?=
 =?iso-8859-1?Q?4/Je8xRdbL5HI7j7ACQKdBxycCMWUt4CdiRcRbK3XI0lWTiI96/0VHVbIQ?=
 =?iso-8859-1?Q?yenqdva9k2HJ9LYk4JGEXzRek8ZUBMA+jSDrtwW7KUyHlGlYRQwFy4At/0?=
 =?iso-8859-1?Q?QzS9FNvxHV+QQTxUSvsxIDhrzgYHQhD1Ht5X7K/1LpTuF29g71qkU5SZqm?=
 =?iso-8859-1?Q?2FBq1h1cA5D75DYTMogc0AP0+KAHTJ4R0r45D+T8CZJrXBhZuzOqf5sKYi?=
 =?iso-8859-1?Q?rDvu6noGf9qcHqPYWvuRrhQUg6UaWAUff1CCwMb5xB4k0NYfRXz5/OGe13?=
 =?iso-8859-1?Q?TBkayH9tCiSZEa8WxmTsQvtw4tMd0kP83QRYPTcKsEF8GnlQRJSzGO+jW6?=
 =?iso-8859-1?Q?/n+azJc8xXDOcSQleAPDDlOiwPY6tNCK61ZvQkGFMuy/GfVMVEzV51ihVp?=
 =?iso-8859-1?Q?UEEZZMQM4V/MAVGyb8svLHBd1qIDIQqP4qMHtEQSahbukXqemuN/KrqI8z?=
 =?iso-8859-1?Q?cAUA+uHgT5HRlKPKXlVcAU2oJB8wonDEw+DGe/C7nFUkw0YD/OYTpZf5rG?=
 =?iso-8859-1?Q?33H+2UGq/ls44a0VDvizzblgrec2IkLAz4Yldj8IFnSs+W4xnzFeEhKb8N?=
 =?iso-8859-1?Q?aaanz1lv+RYm7AoGJmAUI0KeVA8CdDMSvAz/J24FBJn6DSynm/cjvkaXMW?=
 =?iso-8859-1?Q?MemK3Ipbhl8d5f/JFptfUL3vNgeVhEDi5RHk+y6Nn/XdT5SEd74HYHP4RO?=
 =?iso-8859-1?Q?Ljz0K7q5Wzox8vK88k9CyoBlhXXHyff4JReqid3P60dMBPZ9fqpMTHGCrp?=
 =?iso-8859-1?Q?GtSDov1pkVkgHB7xw/hao0GEJggHZ3d6Mo96SPl709BNN+2IFm+sFEgGDs?=
 =?iso-8859-1?Q?4qKkjpw+FuhCylLAteGiYhFbkRN8f9/WyzLZU9buC29+hUg00FRV9g/pa/?=
 =?iso-8859-1?Q?dHTYswRgVPReoXU/ZIMVMnbtF4Aj6hbfi4kk3KANG0CnX2w3SpLqTR5OXQ?=
 =?iso-8859-1?Q?PbfeyFvJRz+nx/jrxnqq0znItutNCRDVGQGP8dVk+GL/CBoziVFckWerOZ?=
 =?iso-8859-1?Q?ccyXGdil7NhBmDkEDiy+Q2JdT+j+WQ/tZUcipRnAuNbtFjkNkV6lOQp9tz?=
 =?iso-8859-1?Q?aZSx584hQsEEjZVYQqphDEMMrUtW7D0DC1kFyI12BwKijUqTf1dpLZobhE?=
 =?iso-8859-1?Q?wst/0YHrJ/f2ysaycD6oShobMvhUBj2rnX/Gj4jA7IfsVIsh5kNhf+ZUkK?=
 =?iso-8859-1?Q?0gQwcVFVYdTYK25SU/pX9A37Z+ZdGJI49TmqPwq/Qc7AiL3cIAj46LGFCy?=
 =?iso-8859-1?Q?sV9itE623P++tecGrPOPVDIuZZnCG5j2FWOC7nBtTD9oB35ORCfQfCTvSp?=
 =?iso-8859-1?Q?owCKq/IEMW+Q5cN8PuDcPwmDzoN20ej2Y3EriilvLOd+uMaoIojFsaQ5Rn?=
 =?iso-8859-1?Q?1nD1j9sbKT8pc2JsrVO3eIucKFraLPQoPOVxNd4jtKp6TNgeS+40DvGcOC?=
 =?iso-8859-1?Q?/Bhm+YNxyciova8Fdw6YDR3Pmk0Eil3arcmORRtOFOyHSZlIHnafN1p7nH?=
 =?iso-8859-1?Q?ZryAb0380muUNnCO9Eh8mS73RLhAnKglXEU3XxzCGaA5/mkFw4z1pa1ES7?=
 =?iso-8859-1?Q?y26sXj/RPxeDQeqmPnXhsh5vKSwKMpBhV5NkV6k5EeYqf/fKJINmJq/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b8ed1b-8956-4fa7-a543-08dda94bd701
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 00:55:35.3635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 910SEfsHhFNSlEceekFJBQYW8F6uYWjFeiNAC/ZgNGp0HQk1ZQJc+y5i06joMLpVS/jVdoxZ0jlKLyWJHAl2Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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

On Wed, Jun 11, 2025 at 06:48:38PM -0600, Summers, Stuart wrote:
> On Wed, 2025-06-11 at 22:38 +0000, Stuart Summers wrote:
> > On Wed, 2025-06-11 at 13:38 -0700, Matthew Brost wrote:
> > > On Wed, Jun 11, 2025 at 01:14:35PM -0600, Summers, Stuart wrote:
> > > > On Wed, 2025-06-11 at 12:09 -0700, Matthew Brost wrote:
> > > > > On Wed, Jun 11, 2025 at 12:27:09PM -0600, Summers, Stuart
> > > > > wrote:
> > > > > > On Wed, 2025-06-11 at 11:25 -0700, Matthew Brost wrote:
> > > > > > > On Wed, Jun 11, 2025 at 11:56:25AM -0600, Summers, Stuart
> > > > > > > wrote:
> > > > > > > > On Mon, 2025-06-09 at 09:46 +0530, Himal Prasad Ghimiray
> > > > > > > > wrote:
> > > > > > > > > Introduce xe_vm_range_tilemask_tlb_invalidation(),
> > > > > > > > > which
> > > > > > > > > issues a
> > > > > > > > > TLB
> > > > > > > > > invalidation for a specified address range across GTs
> > > > > > > > > indicated
> > > > > > > > > by a
> > > > > > > > > tilemask.
> > > > > > > > > 
> > > > > > > > > v2 (Matthew Brost)
> > > > > > > > > - Move WARN_ON_ONCE to svm caller
> > > > > > > > > - Remove xe_gt_tlb_invalidation_vma
> > > > > > > > > - s/XE_WARN_ON/WARN_ON_ONCE
> > > > > > > > > 
> > > > > > > > > v3
> > > > > > > > > - Rebase
> > > > > > > > > 
> > > > > > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  24 ----
> > > > > > > > > -
> > > > > > > > >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 -
> > > > > > > > >  drivers/gpu/drm/xe/xe_svm.c                 |  43 +---
> > > > > > > > > --
> > > > > > > > > --
> > > > > > > > >  drivers/gpu/drm/xe/xe_vm.c                  | 103
> > > > > > > > > +++++++++++++-
> > > > > > > > > ----
> > > > > > > > > --
> > > > > > > > >  drivers/gpu/drm/xe/xe_vm.h                  |   3 +
> > > > > > > > >  5 files changed, 75 insertions(+), 101 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git
> > > > > > > > > a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > > > > index 084cbdeba8ea..0111ee59b81d 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > > > > > > @@ -440,30 +440,6 @@ void
> > > > > > > > > xe_gt_tlb_invalidation_vm(struct
> > > > > > > > > xe_gt
> > > > > > > > > *gt,
> > > > > > > > > struct xe_vm *vm)
> > > > > > > > >         xe_gt_tlb_invalidation_fence_wait(&fence);
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > -/**
> > > > > > > > > - * xe_gt_tlb_invalidation_vma - Issue a TLB
> > > > > > > > > invalidation
> > > > > > > > > on
> > > > > > > > > this
> > > > > > > > > GT
> > > > > > > > > for a VMA
> > > > > > > > > - * @gt: GT structure
> > > > > > > > > - * @fence: invalidation fence which will be signal on
> > > > > > > > > TLB
> > > > > > > > > invalidation
> > > > > > > > > - * completion, can be NULL
> > > > > > > > > - * @vma: VMA to invalidate
> > > > > > > > > - *
> > > > > > > > > - * Issue a range based TLB invalidation if supported,
> > > > > > > > > if
> > > > > > > > > not
> > > > > > > > > fallback to a full
> > > > > > > > > - * TLB invalidation. Completion of TLB is asynchronous
> > > > > > > > > and
> > > > > > > > > caller
> > > > > > > > > can use
> > > > > > > > > - * the invalidation fence to wait for completion.
> > > > > > > > > - *
> > > > > > > > > - * Return: Negative error code on error, 0 on success
> > > > > > > > > - */
> > > > > > > > > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > > > > > > > > -                              struct
> > > > > > > > > xe_gt_tlb_invalidation_fence
> > > > > > > > > *fence,
> > > > > > > > > -                              struct xe_vma *vma)
> > > > > > > > > -{
> > > > > > > > > -       xe_gt_assert(gt, vma);
> > > > > > > > > -
> > > > > > > > > -       return xe_gt_tlb_invalidation_range(gt, fence,
> > > > > > > > > xe_vma_start(vma),
> > > > > > > > > -                                          
> > > > > > > > > xe_vma_end(vma),
> > > > > > > > > -                                          
> > > > > > > > > xe_vma_vm(vma)-
> > > > > > > > > > usm.asid);
> > > > > > > > > -}
> > > > > > > > > -
> > > > > > > > >  /**
> > > > > > > > >   * xe_guc_tlb_invalidation_done_handler - TLB
> > > > > > > > > invalidation
> > > > > > > > > done
> > > > > > > > > handler
> > > > > > > > >   * @guc: guc
> > > > > > > > > diff --git
> > > > > > > > > a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > > > > index abe9b03d543e..31072dbcad8e 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> > > > > > > > > @@ -19,9 +19,6 @@ int
> > > > > > > > > xe_gt_tlb_invalidation_init_early(struct
> > > > > > > > > xe_gt
> > > > > > > > > *gt);
> > > > > > > > >  
> > > > > > > > >  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
> > > > > > > > >  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> > > > > > > > > -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> > > > > > > > > -                              struct
> > > > > > > > > xe_gt_tlb_invalidation_fence
> > > > > > > > > *fence,
> > > > > > > > > -                              struct xe_vma *vma);
> > > > > > > > >  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt,
> > > > > > > > > struct
> > > > > > > > > xe_vm
> > > > > > > > > *vm);
> > > > > > > > >  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > > > > > > > >                                  struct
> > > > > > > > > xe_gt_tlb_invalidation_fence
> > > > > > > > > *fence,
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > index 83c63fd7b481..3fd2d63c73a2 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > > > > > > @@ -167,14 +167,9 @@ static void
> > > > > > > > > xe_svm_invalidate(struct
> > > > > > > > > drm_gpusvm
> > > > > > > > > *gpusvm,
> > > > > > > > >  {
> > > > > > > > >         struct xe_vm *vm = gpusvm_to_vm(gpusvm);
> > > > > > > > >         struct xe_device *xe = vm->xe;
> > > > > > > > > -       struct xe_tile *tile;
> > > > > > > > >         struct drm_gpusvm_range *r, *first;
> > > > > > > > > -       struct xe_gt_tlb_invalidation_fence
> > > > > > > > > -               fence[XE_MAX_TILES_PER_DEVICE *
> > > > > > > > > XE_MAX_GT_PER_TILE];
> > > > > > > > >         u64 adj_start = mmu_range->start, adj_end =
> > > > > > > > > mmu_range-
> > > > > > > > > > end;
> > > > > > > > >         u8 tile_mask = 0;
> > > > > > > > > -       u8 id;
> > > > > > > > > -       u32 fence_id = 0;
> > > > > > > > >         long err;
> > > > > > > > >  
> > > > > > > > >         xe_svm_assert_in_notifier(vm);
> > > > > > > > > @@ -220,42 +215,8 @@ static void
> > > > > > > > > xe_svm_invalidate(struct
> > > > > > > > > drm_gpusvm
> > > > > > > > > *gpusvm,
> > > > > > > > >  
> > > > > > > > >         xe_device_wmb(xe);
> > > > > > > > >  
> > > > > > > > > -       for_each_tile(tile, xe, id) {
> > > > > > > > > -               if (tile_mask & BIT(id)) {
> > > > > > > > > -                       int err;
> > > > > > > > > -
> > > > > > > > > -
> > > > > > > > >                        xe_gt_tlb_invalidation_fence_ini
> > > > > > > > > t(
> > > > > > > > > tile-
> > > > > > > > > > primary_gt,
> > > > > > > > > -
> > > > > > > > >                                                         
> > > > > > > > > &fence[fence_id], true);
> > > > > > > > > -
> > > > > > > > > -                       err =
> > > > > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > > > > primary_gt,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > &fence[fence_id],
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > adj_start,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > adj_end,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > vm-
> > > > > > > > > > usm.asid);
> > > > > > > > > -                       if (WARN_ON_ONCE(err < 0))
> > > > > > > > > -                               goto wait;
> > > > > > > > > -                       ++fence_id;
> > > > > > > > > -
> > > > > > > > > -                       if (!tile->media_gt)
> > > > > > > > > -                               continue;
> > > > > > > > > -
> > > > > > > > > -
> > > > > > > > >                        xe_gt_tlb_invalidation_fence_ini
> > > > > > > > > t(
> > > > > > > > > tile-
> > > > > > > > > > media_gt,
> > > > > > > > > -
> > > > > > > > >                                                         
> > > > > > > > > &fence[fence_id], true);
> > > > > > > > > -
> > > > > > > > > -                       err =
> > > > > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > > > > media_gt,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > &fence[fence_id],
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > adj_start,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > adj_end,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > >   
> > > > > > > > > vm-
> > > > > > > > > > usm.asid);
> > > > > > > > > -                       if (WARN_ON_ONCE(err < 0))
> > > > > > > > > -                               goto wait;
> > > > > > > > > -                       ++fence_id;
> > > > > > > > > -               }
> > > > > > > > > -       }
> > > > > > > > > -
> > > > > > > > > -wait:
> > > > > > > > > -       for (id = 0; id < fence_id; ++id)
> > > > > > > > > -
> > > > > > > > >                xe_gt_tlb_invalidation_fence_wait(&fence
> > > > > > > > > [i
> > > > > > > > > d]);
> > > > > > > > > +       err = xe_vm_range_tilemask_tlb_invalidation(vm,
> > > > > > > > > adj_start,
> > > > > > > > > adj_end, tile_mask);
> > > > > > > > > +       WARN_ON_ONCE(err);
> > > > > > > > >  
> > > > > > > > >  range_notifier_event_end:
> > > > > > > > >         r = first;
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > index 18f967ce1f1a..a0c70698265a 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > > > > @@ -3842,6 +3842,68 @@ void xe_vm_unlock(struct xe_vm
> > > > > > > > > *vm)
> > > > > > > > >         dma_resv_unlock(xe_vm_resv(vm));
> > > > > > > > >  }
> > > > > > > > >  
> > > > > > > > > +/**
> > > > > > > > > + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB
> > > > > > > > > invalidation
> > > > > > > > > on this tilemask for an
> > > > > > > > > + * address range
> > > > > > > > > + * @vm: The VM
> > > > > > > > > + * @start: start address
> > > > > > > > > + * @end: end address
> > > > > > > > > + * @tile_mask: mask for which gt's issue tlb
> > > > > > > > > invalidation
> > > > > > > > > + *
> > > > > > > > > + * Issue a range based TLB invalidation for gt's in
> > > > > > > > > tilemask
> > > > > > > > > + *
> > > > > > > > > + * Returns 0 for success, negative error code
> > > > > > > > > otherwise.
> > > > > > > > > + */
> > > > > > > > > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm
> > > > > > > > > *vm,
> > > > > > > > > u64
> > > > > > > > > start,
> > > > > > > > > +                                         u64 end, u8
> > > > > > > > > tile_mask)
> > > > > > > > > +{
> > > > > > > > > +       struct xe_gt_tlb_invalidation_fence
> > > > > > > > > fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > > > > > > > > +       struct xe_tile *tile;
> > > > > > > > > +       u32 fence_id = 0;
> > > > > > > > > +       u8 id;
> > > > > > > > > +       int err;
> > > > > > > > > +
> > > > > > > > > +       if (!tile_mask)
> > > > > > > > > +               return 0;
> > > > > > > > > +
> > > > > > > > > +       for_each_tile(tile, vm->xe, id) {
> > > > > > > > > +               if (tile_mask & BIT(id)) {
> > > > > > > > > +                       xe_gt_tlb_invalidation_fence_in
> > > > > > > > > it
> > > > > > > > > (til
> > > > > > > > > e-
> > > > > > > > > > primary_gt,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > > &fence[fence_id], true);
> > > > > > > > > +
> > > > > > > > > +                       err =
> > > > > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > > > > primary_gt,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > &fence[fence_id],
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > start,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > end,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > vm-
> > > > > > > > > > usm.asid);
> > > > > > > > 
> > > > > > > > Since we're already doing the refactoring of the svm and
> > > > > > > > non-
> > > > > > > > svm
> > > > > > > > cases
> > > > > > > > here, can you also refactor this so we have something
> > > > > > > > like:
> > > > > > > > invalidate_tiles(tile_mask)
> > > > > > > > 
> > > > > > > > void invalidate_tiles(tile_mask)
> > > > > > > > {
> > > > > > > >     for_each_tile(tile, tile_mask)
> > > > > > > >         invalidate_tile(tile)
> > > > > > > > }
> > > > > > > > 
> > > > > > > > void invalidate_tile(tile)
> > > > > > > > {
> > > > > > > >     fence[i] = invalidate_gt(primary)
> > > > > > > >     fence[i++] = invalidate_gt(media)
> > > > > > > > 
> > > > > > > >     for_each_i(i)
> > > > > > > >         wait_for_invalidation(i)
> > > > > > > 
> > > > > > > You'd lose a level pipeline with this suggestion. The can
> > > > > > > write
> > > > > > > is
> > > > > > > quite
> > > > > > > intentional - issue all TLB invalidations to hardware, then
> > > > > > > wait
> > > > > > > on
> > > > > > > all
> > > > > > > invalidtaions. What you suggest would issue TLB
> > > > > > > invalidations
> > > > > > > to
> > > > > > > each
> > > > > > > tile and wait invalidations from that tile - if you have
> > > > > > > multiple
> > > > > > > tiles
> > > > > > > you delay issuing the invalidations until the prior tile
> > > > > > > completes
> > > > > > > its
> > > > > > > invalidations. This could be cleaned up with helpers but
> > > > > > > regardless
> > > > > > > we
> > > > > > > want the pipeling in place.
> > > > > > 
> > > > > > Ok makes sense. Then we can just pull the
> > > > > > wait_for_invalidation()
> > > > > > out
> > > > > > to the invalidate_tiles() piece:
> > > > > > 
> > > > > > void invalidate_tiles(tile_mask)
> > > > > >     for_each_tile(tile, tile_mask)
> > > > > >         fence[i++] = invalidate_tile(tile)
> > > > > > 
> > > > > >     for_each_i(i)
> > > > > >         wait_for_invalidation(i)
> > > > > > 
> > > > > 
> > > > > That still doesn't work as each tile can generate multiple
> > > > > fences
> > > > > if
> > > > > it
> > > > > has a media GT. Yes, we could have helper which takes a fence
> > > > > index
> > > > > by
> > > > > reference by ROI on this low IMO - this is not some crazy a
> > > > > couple
> > > > > 100
> > > > > line function which is hard to follow.
> > > > 
> > > > Perhaps, but we should also be in the habbit of coding functions
> > > > that
> > > > try to perform just a single operation as much as possible. This
> > > > is
> > > 
> > > Sure, hence the helper here which reduces the LoC. Another helper
> > > which
> > > is used in exactly one spot, touches stack variables from another
> > > function is kinda ick but that is just an opinion.
> > > 
> > > > what prevents the bloat down the road. I also don't think the
> > > > suggestion I had here was intrusive enough to warrant strong
> > > > pushback.
> > > > 
> > > 
> > > Well to be fair, both of your suggestions do not really work - that
> > > the
> > > is the main issue at hand.
> > > 
> > 
> > Also feeling a little under the weather here so please bear with me.
> > Let me send an actual code example of what I was thinking rather than
> > pseudocode. Hopefully that will clear things up. Not trying to block
> > the review. I'll respond back this afternoon if I'm not able to get
> > this out.
> 
> Ok yeah I don't think I'm going to be able to get back to this today
> unfortunately. Sorry for the noise here. Let's proceed with the r-b as-
> is.
> 

We can always do a follow up patch if it makes sense.

Matt

> Thanks,
> Stuart
> 
> > 
> > Thanks,
> > Stuart
> > 
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > Stuart
> > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > Stuart
> > > > > > 
> > > > > > > 
> > > > > > > Matt 
> > > > > > > 
> > > > > > > > }
> > > > > > > > 
> > > > > > > > invalidate_gt(gt_type)
> > > > > > > > {
> > > > > > > >     invalidation_fence_init(gt_type)
> > > > > > > >     fence = invalidation_fence_range(gt_type)
> > > > > > > > 
> > > > > > > >     return fence
> > > > > > > > }
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > Stuart
> > > > > > > > 
> > > > > > > > > +                       if (err)
> > > > > > > > > +                               goto wait;
> > > > > > > > > +                       ++fence_id;
> > > > > > > > > +
> > > > > > > > > +                       if (!tile->media_gt)
> > > > > > > > > +                               continue;
> > > > > > > > > +
> > > > > > > > > +                       xe_gt_tlb_invalidation_fence_in
> > > > > > > > > it
> > > > > > > > > (til
> > > > > > > > > e-
> > > > > > > > > > media_gt,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > > &fence[fence_id], true);
> > > > > > > > > +
> > > > > > > > > +                       err =
> > > > > > > > > xe_gt_tlb_invalidation_range(tile-
> > > > > > > > > > media_gt,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > &fence[fence_id],
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > start,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > end,
> > > > > > > > > +                                                      
> > > > > > > > >   
> > > > > > > > >  
> > > > > > > > > vm-
> > > > > > > > > > usm.asid);
> > > > > > > > > +                       if (err)
> > > > > > > > > +                               goto wait;
> > > > > > > > > +                       ++fence_id;
> > > > > > > > > +               }
> > > > > > > > > +       }
> > > > > > > > > +
> > > > > > > > > +wait:
> > > > > > > > > +       for (id = 0; id < fence_id; ++id)
> > > > > > > > > +               xe_gt_tlb_invalidation_fence_wait(&fenc
> > > > > > > > > e[
> > > > > > > > > id])
> > > > > > > > > ;
> > > > > > > > > +
> > > > > > > > > +       return err;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  /**
> > > > > > > > >   * xe_vm_invalidate_vma - invalidate GPU mappings for
> > > > > > > > > VMA
> > > > > > > > > without a
> > > > > > > > > lock
> > > > > > > > >   * @vma: VMA to invalidate
> > > > > > > > > @@ -3857,11 +3919,9 @@ int xe_vm_invalidate_vma(struct
> > > > > > > > > xe_vma
> > > > > > > > > *vma)
> > > > > > > > >         struct xe_device *xe = xe_vma_vm(vma)->xe;
> > > > > > > > >         struct xe_vm *vm = xe_vma_vm(vma);
> > > > > > > > >         struct xe_tile *tile;
> > > > > > > > > -       struct xe_gt_tlb_invalidation_fence
> > > > > > > > > -               fence[XE_MAX_TILES_PER_DEVICE *
> > > > > > > > > XE_MAX_GT_PER_TILE];
> > > > > > > > > -       u8 id;
> > > > > > > > > -       u32 fence_id = 0;
> > > > > > > > > +       u8 tile_mask = 0;
> > > > > > > > >         int ret = 0;
> > > > > > > > > +       u8 id;
> > > > > > > > >  
> > > > > > > > >         xe_assert(xe, !xe_vma_is_null(vma));
> > > > > > > > >         xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> > > > > > > > > @@ -3892,37 +3952,14 @@ int xe_vm_invalidate_vma(struct
> > > > > > > > > xe_vma
> > > > > > > > > *vma)
> > > > > > > > >                 }
> > > > > > > > >         }
> > > > > > > > >  
> > > > > > > > > -       for_each_tile(tile, xe, id) {
> > > > > > > > > -               if (xe_pt_zap_ptes(tile, vma)) {
> > > > > > > > > -                       xe_device_wmb(xe);
> > > > > > > > > -
> > > > > > > > >                        xe_gt_tlb_invalidation_fence_ini
> > > > > > > > > t(
> > > > > > > > > tile-
> > > > > > > > > > primary_gt,
> > > > > > > > > -
> > > > > > > > >                                                         
> > > > > > > > > &fence[fence_id],
> > > > > > > > > -
> > > > > > > > >                                                         
> > > > > > > > > true);
> > > > > > > > > -
> > > > > > > > > -                       ret =
> > > > > > > > > xe_gt_tlb_invalidation_vma(tile-
> > > > > > > > > > primary_gt,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > > &fence[fence_id], vma);
> > > > > > > > > -                       if (ret)
> > > > > > > > > -                               goto wait;
> > > > > > > > > -                       ++fence_id;
> > > > > > > > > -
> > > > > > > > > -                       if (!tile->media_gt)
> > > > > > > > > -                               continue;
> > > > > > > > > -
> > > > > > > > > -
> > > > > > > > >                        xe_gt_tlb_invalidation_fence_ini
> > > > > > > > > t(
> > > > > > > > > tile-
> > > > > > > > > > media_gt,
> > > > > > > > > -
> > > > > > > > >                                                         
> > > > > > > > > &fence[fence_id],
> > > > > > > > > -
> > > > > > > > >                                                         
> > > > > > > > > true);
> > > > > > > > > +       for_each_tile(tile, xe, id)
> > > > > > > > > +               if (xe_pt_zap_ptes(tile, vma))
> > > > > > > > > +                       tile_mask |= BIT(id);
> > > > > > > > >  
> > > > > > > > > -                       ret =
> > > > > > > > > xe_gt_tlb_invalidation_vma(tile-
> > > > > > > > > > media_gt,
> > > > > > > > > -
> > > > > > > > >                                                        
> > > > > > > > > &fence[fence_id], vma);
> > > > > > > > > -                       if (ret)
> > > > > > > > > -                               goto wait;
> > > > > > > > > -                       ++fence_id;
> > > > > > > > > -               }
> > > > > > > > > -       }
> > > > > > > > > +       xe_device_wmb(xe);
> > > > > > > > >  
> > > > > > > > > -wait:
> > > > > > > > > -       for (id = 0; id < fence_id; ++id)
> > > > > > > > > -
> > > > > > > > >                xe_gt_tlb_invalidation_fence_wait(&fence
> > > > > > > > > [i
> > > > > > > > > d]);
> > > > > > > > > +       ret =
> > > > > > > > > xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma),
> > > > > > > > > xe_vma_start(vma),
> > > > > > > > > +                                                  
> > > > > > > > > xe_vma_end(vma),
> > > > > > > > > tile_mask);
> > > > > > > > >  
> > > > > > > > >         /* WRITE_ONCE pair with READ_ONCE in
> > > > > > > > > xe_gt_pagefault.c */
> > > > > > > > >         WRITE_ONCE(vma->tile_invalidated, vma-
> > > > > > > > > > tile_mask);
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > > > > > > > b/drivers/gpu/drm/xe/xe_vm.h
> > > > > > > > > index 88d6c0ef89c7..acd3fd6c605b 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > > > > > > @@ -228,6 +228,9 @@ struct dma_fence
> > > > > > > > > *xe_vm_range_rebind(struct
> > > > > > > > > xe_vm
> > > > > > > > > *vm,
> > > > > > > > >  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > > > > > > > >                                      struct
> > > > > > > > > xe_svm_range
> > > > > > > > > *range);
> > > > > > > > >  
> > > > > > > > > +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm
> > > > > > > > > *vm,
> > > > > > > > > u64
> > > > > > > > > start,
> > > > > > > > > +                                         u64 end, u8
> > > > > > > > > tile_mask);
> > > > > > > > > +
> > > > > > > > >  int xe_vm_invalidate_vma(struct xe_vma *vma);
> > > > > > > > >  
> > > > > > > > >  int xe_vm_validate_protected(struct xe_vm *vm);
> > > > > > > > 
> > > > > > 
> > > > 
> > 
> 
