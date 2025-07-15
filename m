Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9BAC83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 16:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295D10E219;
	Tue, 15 Jul 2025 16:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTXsM9Q/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806C910E219
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752596664; x=1784132664;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WfMGoAstr2ib8w5T384k6OtPyrIIRWl8STt12nCJgDQ=;
 b=fTXsM9Q/Ba7xwBoym5hSItwIj/070eJs3Tv1D0Y5dVlMNLdnNUF1o0jR
 F0EQHbvLJzihmVWBEUBUOHWaRvyivppBZcEugoGEuvUAI5fHGl6loKwPD
 wQCsWLEFpR2KVmXuQjhF4nQHH+ySiCwop9EZLhqbCbQfO+L/brvtjOaa4
 +I5+6TnI8C/YFSafFfavSqEr2vDN2Xf/5JibeV+1eMldf8g/K5OkDMtjF
 t+xTTdHjYTQ4bDIqoLmL8VwS7ZRYEybpClsnaI3nCNqxD0OHnFB7yDA+x
 yrohtnMt6sA/vX65ZOBFIh3ayrGfMU3yY4Xegmya+v+TuuqTAwmb/TUlG g==;
X-CSE-ConnectionGUID: XC5Nd4CoQ8yrDcxBIOsnIg==
X-CSE-MsgGUID: 5T2BtMg3Qu6uU8Q4L/hu0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65522269"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65522269"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:24:24 -0700
X-CSE-ConnectionGUID: W1O2uESfRoCUwMUQr/7HUw==
X-CSE-MsgGUID: PZY0ZrCuT5+XgH/53OddVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157991784"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:24:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:24:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 09:24:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 09:24:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GntinVCFT6RtU5XacWsECVCQf1fMyHMOjH37CZm2nSZgOVrFB2h8ROSwhKneo6ifSu8PJpJDRFuBsasNcrLsd9Knw5UvCzvTMIcyV5vvI+TpiOm7A1DjuPy9+/u9IYC1fUb/9+Pz7eYu1cnr4goTYlRizvjcA6F1DMqmiXGqlZ4tL2EMCH5Fni24maVKCXNyUMS8vrTjWfq/to+5udu6qGOLXdYoYY0n8knXzAT+fBS3qq3cQUQri4EyPltK+hirRiVOCjJueBCzjZ11z03fXjwM/e8R3RJdiH9oMA8qf0wVg3KtOd/ra8gjaKfbRBri5E+T+Keuu2AQ7fgDV9N5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIED3IT4XOBO8+PPUBBFAO7vETZyx2m/of4ulw/5Gso=;
 b=h43P1tIFCRLGoXjjabl4zc5jmFwo2A8rELXHYtZfcUIxgy+eQyOiWW3koO1U0j7zyXbOPTxR6Pxud07OCGEYMAy1ZP3iXW23jb5EQ852lEbkLdR5TZC2g8Yo+MyoceEvNVnFudij31HeuEym2B5/HLXbP1bA8IwH9IJJh+9EN9gJ5vy89GpsQ4FXmmxAcjl3l//axebxfrouIA72tvaDwqfb+jwuHYlUIShlpOKD08b8tZa/Fu44j17NlqSD81RyKG9er4BJDk5e/ErDeQX/QipPveV/crCpg/usZzoihIKgKgVZmQ6/7SgFXCiKJQKU+rL/wyv0YRHDlcvrxwLx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 16:23:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 16:23:50 +0000
Date: Tue, 15 Jul 2025 09:25:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/3] SVM compression fixes
Message-ID: <aHaA/6lGNVWpcD2M@lstrano-desk.jf.intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <8c228e08-fb2b-477a-8b8c-0bcc62f098d5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8c228e08-fb2b-477a-8b8c-0bcc62f098d5@intel.com>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5ec1c3-e67f-48bb-b42a-08ddc3bbfb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TQjzqprjk61opNIApriOfwcSZo3D9kFhHHOkj2IQMhbIVJUNkgO276pIV3QH?=
 =?us-ascii?Q?+DS34t4wqbR44d7DmNYPipQK2kLkrSXmdW7/V/usMT2evgMEZ4btxRP59OSW?=
 =?us-ascii?Q?YBBkzesKtICtPaeUMoOMPTJuqcs4BcJZe+mS/Unr8Ikw/zcHzThTOX4sucZG?=
 =?us-ascii?Q?dKatJlg5lomv/tJeyQWXtPHYa/9HgUGGtrG1X5XCTyCsMfir++CCPijyxNDU?=
 =?us-ascii?Q?Qr2b1XAHSJ1wflhyhlotXa0ALPzoTaCa0lNXu2aPw78qtjGXn3mawNnO00OB?=
 =?us-ascii?Q?IxNQK8bYu0rVepE0ggKdw6x//VtAlJOYnM/7nawJYvF4pzMmy2rZgeVRo4iC?=
 =?us-ascii?Q?CSgTk67Ubk1hmWZhJ5YAvT0GkCHYYCjTIMHkoDxri+8e5XimQeattffwbEd7?=
 =?us-ascii?Q?fCE9NVwaIl6lk6KxlKR9OtaVIssZi2p/plMOGhThcLZw2vnRB73MQm2wot9k?=
 =?us-ascii?Q?etjuCUJKYSRg3uiPJYV5z+RNafgdmfGi2zY7Im0Cn6ZVD+Htqloq4rT2axyT?=
 =?us-ascii?Q?XNxfHvbzGzVqJ5MV9P09pkxMzyT23nHa35MOjqs4ewd8Pbmiyw52WTmJgX82?=
 =?us-ascii?Q?ccplAfYq/ViDNCY0n0r9NXM3Lwgqs3asTtlyay+ZfVNq4cCOt2ZBSIlpag5e?=
 =?us-ascii?Q?Yw9fns+jcjIQnHtx470bittdwKT3mom+z4HT69a75OUxoxvaMVPN23MZy2Fk?=
 =?us-ascii?Q?0gZjtbeTBsa1V07APqQX/XNOaL+3gbUiCfMa9arWrCjk9YJ34JbWFFPerZPI?=
 =?us-ascii?Q?BO1YkNdDevrWf16JVSPe7HYslJjAitCu+CdwB9baNx5z3ZOPK3u6IRXymkxB?=
 =?us-ascii?Q?dDMvriCYlTQofm45+ZtOxOox5rvXtXLXTBXGKlqR7UV10I+ORdinnjNpbgFy?=
 =?us-ascii?Q?SAMDej9YDX6t15k7idXcr8XCDveSp6eSRLI4WBfSgjf40fyaTQVrNhdteQa7?=
 =?us-ascii?Q?90W7zgOnm4X3/9OSv+Pb65Id7jczR40WQ0q0I8nyHKdgSFnzJNrSA/md8A0N?=
 =?us-ascii?Q?wB1/fhl4MXoyZw65iPK0liILJbutK3MolsSx1qQcdrsnhFcgcPqRsfWFKwlo?=
 =?us-ascii?Q?EydNKwPfkhF011iQLnb4oid0x9+lCU4nl2y0AqrePT/94VSlQUcjCihMRuFy?=
 =?us-ascii?Q?bgAMuXfdiyDCCDIX0KOH70p3Xxg4g851rD6aUPr3YbwwRAaZfhRTJ1gv96jc?=
 =?us-ascii?Q?qDayygxSryx8wpaIoDn0kvVB/3CGqbeegnY3326dC2uoED53mAGe4oHhxwhZ?=
 =?us-ascii?Q?AwmA3zvEIU3izyRRuM0bJmEg4NDp8iNKJp28l9I5T/kL69xIvdHzuTPCPRkG?=
 =?us-ascii?Q?LMOR6aclARj0r1aAqe+nbVqpHJn2mlmeyVGPIFfc5d2kYDLHSfFKU+JWV9AW?=
 =?us-ascii?Q?nzDu/8c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hEigwOhSjOikwIdUVUiBkkiLzXRRBLce7RGIFBkRtuN4CkPX4P8gTUdOd6mC?=
 =?us-ascii?Q?pfxN6MDrDyRQw2qFILDwn/ZuPHP1655PLdZuht+iWyHAnK1hdwExwwGSlVWS?=
 =?us-ascii?Q?fK9V8rj9BLnGixNny+gc1zggJu2gHgjrQTQwROvFr9iq9UyId27vBBj9M5AU?=
 =?us-ascii?Q?AQXsaSg9bAFUCNVQjCrHQUFWCsS5UlyUzNJglM2czszKB2FXnqyRj5WoAgmc?=
 =?us-ascii?Q?Ori+T1eKTbzYVPwePoJ+QmtF62a/vvESfofTQwwsjpufGqbw8JnfqBAySCcG?=
 =?us-ascii?Q?AwfXPqgBR94hhiHxDnxH02KmTl4Np3XTsXo/dHf+2qHsOSbwTzgszqpgS5r4?=
 =?us-ascii?Q?p1x2qrvuDV33iSsHL9XtCPEdpH++OcBe72lsnqcO41BdMn8D4h3L0ys5fn0m?=
 =?us-ascii?Q?0j5c3fuZASsvMHiQiULRazvd2GewvPUsctLjzG8Ff4hwcQKELMi3C3q8oxBV?=
 =?us-ascii?Q?peJcl8SwmEEMAc4aR9/AmDw9MXqLmuiqEgQBfC2BmQjY5fZkOASRTRoTOjzG?=
 =?us-ascii?Q?raFhsjqfzZNEiJ07vl13v7uUvaew/K5bXm31xBdylNjWLPmS1+O5Ho2Fi6J2?=
 =?us-ascii?Q?sj1S8+Texln01dwxyxiZnexqw/6dvjf4Ct3hj96twEvetxKv2z1p/lDLGft2?=
 =?us-ascii?Q?WRSrhEKAP5fiSOPMAirIq20SaCX+vugefsWgsWVeWwIWpXz7KSHcpRPjMmwX?=
 =?us-ascii?Q?p+CxXHPwd85KT4OBPMGS6rhLegwUaSaph4euuwJ8WU1LBcnGtBZV5Ym4P7N3?=
 =?us-ascii?Q?0oaX2rQCULSpDmcJWaLChv/EzwPPhwCG/xS0+7fI0SkgncADm7vX0lQIS21G?=
 =?us-ascii?Q?EeTb7rWapptWGRiRFd4TCzqJk71df1o67sFZBAN9xMuEv5wgucupA+6kDSnf?=
 =?us-ascii?Q?MS+4Jr7lwkdm5EH7imTQ1v72/iD/JV+mr05T4RAbCzorvlP6WS0ybnz8GzW4?=
 =?us-ascii?Q?FbUspaESLNojLdf496fce/Imo5UiaWcUKVeEtGw0zXKGT8Fjq3l7ywryKBBW?=
 =?us-ascii?Q?yVRzrWAc/SGhk5wauhiD3sK/kSJr/K7dkxgSDKllWfiSl4R6S3IgBSAw0JLM?=
 =?us-ascii?Q?p/kdhKFoofY5BKh6nQ7Jediq2wbJgkli3SmiWYtFI88n7OLwifZNjUFv7WDB?=
 =?us-ascii?Q?+4X9amu0zAFMPZI2rBdSMaehKHKL6uxMm9h12zF+y2h51lf9DPNpPsEWjBdo?=
 =?us-ascii?Q?mrjhaY+Y57m2/tBrgdCKd3bwJ2Hu1wdgYwU6FdtNHZqOzNFOdrj8Tm9XK/ev?=
 =?us-ascii?Q?MsEjFpeXOVYLEHoWBX4JsiwqnWAkL1Y3Ojr0ilmnQX0H7Mswndew6Ur5aEbj?=
 =?us-ascii?Q?j0IjUVw3914L3iAdROwkWrkH+Yqf/eQUI3fwfDfeiKWrhxXV752DjzaBjDA4?=
 =?us-ascii?Q?G/NqcM4/xJ8XGoaAOareGKqVtsU8lWgjZ5jKRsytqSPT5XouW9KGhorbu3hz?=
 =?us-ascii?Q?/t6YP0mYcERWVU+o8toDVX9Cu9PHKkeQRwxdDiI/QGuT+Jvb8LHwT5aD9dI2?=
 =?us-ascii?Q?e1Vq3P7PO4B+EmmJ89hB1OJmD+fj6HQ8/mM7mWk38o+VHoGJX4xuSLVZedeT?=
 =?us-ascii?Q?Wm9CJytmkVt0oCriAYN8Hf1rpkb0Ts10cnMKQ109rA7wsl4W72jJHc8ogqpn?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5ec1c3-e67f-48bb-b42a-08ddc3bbfb7c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:23:50.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAigPAaqt8zzv0MAY97LcIJ6D3uNvEFUmLhJBlRBckSnDpQPFA+7PJW6qxFRHFxxRclPvdEu7FQamrghPkEVEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
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

On Tue, Jul 15, 2025 at 01:59:16PM +0100, Matthew Auld wrote:
> On 14/07/2025 18:33, Matthew Brost wrote:
> > Compression is broken for SVM and for devcoredump when reading out BOs.
> 
> For devcoredump case is this the bo_read() call? Does that mean we would
> still run into trouble for < 16K buffers and then also igpu in general?
> 

Yes, we will need some more follow up patches I think.

Let's start here with this series and then fixup remaining devcoredump cases?

Matt

> > 
> > Marking the first two patches as fixes. One option could be to drop
> > patch 1 and proceed with just the last two patches as fixes, if we
> > decide we're confident in SVM with compression.
> > 
> > Tested with [1]. The append memory copy compression sections fail on
> > drm-tip and pass after this series.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/151581/
> > 
> > Matthew Brost (3):
> >    drm/xe: Disable compression on SVM
> >    drm/xe: Update xe_migrate_vram to support compression
> >    drm/xe: Enable compressed memory for SVM
> > 
> >   drivers/gpu/drm/xe/xe_migrate.c | 37 ++++++++++++++++++++++++++-------
> >   1 file changed, 30 insertions(+), 7 deletions(-)
> > 
> 
