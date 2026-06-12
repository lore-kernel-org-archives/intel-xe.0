Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF94CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727BF10EAEC;
	Fri, 12 Jun 2026 17:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwyqE2i/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CADA10EAEC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781284505; x=1812820505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ys2jooq4fxILEk484GP8ENrAh84huLYDOHFwc/GP1r0=;
 b=LwyqE2i/vQMj4yLZp7Scd5HBKRjMzZYeUAhzYEefYPmL0oktC1SNjL5V
 cWBfIWo2z9dvfh/15c4pR4sKAceSLyxEeh5LgbDdY3HeJN46TuOgGMXq5
 Rl7ba61VC7PaGTwKj1yhSAjY3+Qac/GhWv5eRBQSoodA4vp40z5Mw6yHa
 DTPgaOku5fhyRuGX/3GqnQdMNhBozmkqu0AkxcrVbeMwvuuW/biF/WJkI
 hPLd3A3plzZkRwgNvvgHZoYS8vlXaddyTGdfTqkFRh0a/o4jl0tLdBhsE
 4/SyD5D/kb28fLJJpuPRYqD6OnmbRs+u1HYepjLQAsVDXj5AWB3XhBscG w==;
X-CSE-ConnectionGUID: QL5l0w+CTdiHfsyGrelnEg==
X-CSE-MsgGUID: SChFixWKRHKfoqUc71P2gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85964281"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="85964281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:14:50 -0700
X-CSE-ConnectionGUID: 5D9MmTxIS8WtqRMv9z7L9g==
X-CSE-MsgGUID: SeIBBZ2DRCS5nl0LSBtw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="270534550"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:14:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:14:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 10:14:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:14:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsnKuXNEFWnMLWcopnKbBWU3RrsraGGmIsCYkTVSgbcKOVqvW7WOgN+jRGzTz2tpfIKwA6LRpPyCSMkMQpSh20QfJCmt6JvKZOZ38DPzlXZY1qE10eiZ3gy9iEu8LWbS43POccxYoPE+InG6Bz4FJbp18lbL2T+INsmQ/vZ+BqqVtgYlfL+5hN/wf5SBkXW+NrXOlxcpbwk1S4Tk63j0dTZVN0Me+CJ1FoG36GRUDEQyeM9brRnUPWVBGMFdpg/iijKGAPTh+d9gbqc98kqw+CSsKj0ZcrcCfHWc539S9Ueemasn1XS80u4pQr/LCceOuL1tMTSShv30sUlGtVu9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt49xzziqNjD9SUYnKz3wqEnOUxEStdbgKs7aA/HJJ0=;
 b=akBmjxlYeJtVWnUzsKKsPXkBx8JLESs25WoGHB26upiDT26loSgRsZrP+30NqY6bkRR4nnIanluDyNb4vooyhN55u8xotrMNRe22M55wWa4gSa6IFvQUX49a7zaS711+E5rXlvY1biUsxBDkstHnRah7SbFmePSeRah7z5INubrYACWUaF0z+g/Q/vldmMqQYIydFbppXJXPRAQgSxtNniej4280BRffmjfjqarlGENb0Q+y/hBmylY/BE3Kuna9/vGg3zQb1BGSV1jF3WILI/7HwdWyVtMkMnxC5aTqOlLw++zuS2km5i8xf5aLnD43Oup/mlclpVyZkha+PBM6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 17:14:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 17:14:45 +0000
Date: Fri, 12 Jun 2026 10:14:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Yao, Jia" <jia.yao@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Wang, 
 X" <x.wang@intel.com>
Subject: Re: [PATCH] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Message-ID: <aiw+giECCoOotsyI@gsse-cloud1.jf.intel.com>
References: <20260612042548.3740605-1-matthew.brost@intel.com>
 <PH8PR11MB80406CC88853B0C439BBFADEF4182@PH8PR11MB8040.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PH8PR11MB80406CC88853B0C439BBFADEF4182@PH8PR11MB8040.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9aebc5-737d-453d-8371-08dec8a6196c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 8i2c2ZmY7l4g93wxea70oS+IHaxZfklrmLzYxAWAFfZFfhU/mb+x+T5h2xbcv/JZTb9ZjNY02bkhdBe3feWF91NS7IZ3FBzZRp28BctqUTppY5ltA4GZr5/ZzeAjwUEsRiABxuh4hNu0y8UwJKhSDRzQJmbm5FtURw+t79sPrfG1PChZ46xGjWXBh3KpIu6kJZBXBL76xbL6BzUCKlqM+38W3CG2+SehDu6+GuHx9AZLx8ig70qTOrA9Yw06+eALvDrPwLIqlQFh0u1sh3YO9KPCjT+mf+tBL8h8uxHMAB7gjfB22yXjgK2ZIXz/PVCrUErpizi7n8TlHQ788Sq+alr6OX4auRBuYsrRRB122+AtoiY1q5BEPME2iVScboILQlYwg2a8dGytQdrAUby9r/+ejfpqJmYXNifQKS4HLr8KPGCdidFk/6bbA78uKAym7egWw9PzLmZ019dkkBA7NFT31qNbTGPSZG4HE9wQepOIzju1COGn+uySsH1Jv6h+fvQhpmGiF1SFDJ+4Z2Zm9nJrkiLiQTA1/hcpBt7bSoMqT7JNGAY3MNy22VhC82q4GbpzKOMQA0zvvhqEM3NZYzimfTIjOMpKrO+05r6ze40jbF+R9cOifi7aCLL3Mmndw0q4rGPzCb6fu/9SyuJCu3Dl+OU+0OpVCTV40zJfrMRCGXxyP95HzIhe5qkIC/M6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pa13vcrS/o1nfQHRCo8Ve6hz0FvhLex+Djt61ACBiVd5E9lHEzqnqVd9mBjT?=
 =?us-ascii?Q?dT/9wnchpZAXlBfwNrEI/Uk+tlPrnF+/LVxEpK+7/6QhNGxGy+9tHbozm2cE?=
 =?us-ascii?Q?q4CbkkIX4u1uvTkvtIYruk/krNzqvl+a1TsZ5YkwK64UpNnnd031eSeMr2fY?=
 =?us-ascii?Q?z2tAUgqwFsXuEPfwISyDVPgT06D5eQ8YNscmgoiEsHnbe/kCBFDJaLtBeDX2?=
 =?us-ascii?Q?xXTTwC9RDUjSJAtcQAtClVLE5yne7SZUPH3jEU/PFyj5plmVxNPV1u63rlW5?=
 =?us-ascii?Q?vdvlwUnBtfw2Spi6jKTLFm0qCSVkBTXin/JH4qIWr/w4aVArXp9PtYJ9RREV?=
 =?us-ascii?Q?DYWIAXAD7BwJHamuf+kuC4F34Uqt85dnhIVaPALT7KqAVvyP/PNqa2xt5TRa?=
 =?us-ascii?Q?HQ9B5HVDIPS5e34XoznNl3S8YPcWLYvcaWNe+tMLQKW9oYLVBwxGWLQ2/IVg?=
 =?us-ascii?Q?CMf//hjOKiECMbWKAHJxPlnqhetYPQxL3fmAh1Pn3ldtlyZwDSfTHQ+RwzJr?=
 =?us-ascii?Q?Z6QtxqU4jhtuE4SWq+D9p7AeUIhojdXhtYDhc/XeUURx/F+3faaf0kMJKCd1?=
 =?us-ascii?Q?vx7+u+Xv/u3JmomOIiw7Az9WJ2ifaOxPtqgONs1SuwNpeBcf8gI86k2EULwk?=
 =?us-ascii?Q?sTxRyTUXDtWHjc+au/2QP0kszgnKrctLqyHfwm++iJODeXhqjSef0K8QFeXw?=
 =?us-ascii?Q?nBWXyls9v02vKIW1rGyIX8EcD5PC3PbbKUmzGIIjDoLR/yS+7phkjQRENHPp?=
 =?us-ascii?Q?xWMka4G4qBzCnuLj66vYlthXEqTMAEJVN+d7q1zjUffISaELlao44s7Zf2lS?=
 =?us-ascii?Q?M+5UCm6hTVE4gvHmeeaoKDHTKUH40YXYbx9KoXE/OjnLhBfXb9nxcnQfZzSM?=
 =?us-ascii?Q?EptmWHvSt1COvE+6U43DE88qo91ftnv9Vs5etKaHNwEC5tf4s4ULOvuIW6b9?=
 =?us-ascii?Q?+IQe8Vwbu+xIxp8YIOXnyIMjTmZT6/WmH1Zmfs9/g+/tM+i9zcY61ObQSwO8?=
 =?us-ascii?Q?OoCD47OVijA3FN2Y7v/5REQ/L8T51OE49s8x1KGOvhPetV777TwZHWyI7X5x?=
 =?us-ascii?Q?Gzd7W05vTZVuxh0dyhRPVIDfexPQOJ8Se+JnaHd9Ip4FQgKd7IoEyyOOnFvO?=
 =?us-ascii?Q?eRUs0sNWEAgdJ9MeUG1W+bTshX1hzbljgFN9IvUTRdh2L8+RJhxznwb4lOkY?=
 =?us-ascii?Q?aF0VEjwyEq3D+YFIQWZLBL9Pwbz6uB+rSbcLINv2YoRflInVcE8eb/3nmtFi?=
 =?us-ascii?Q?z0SZfQ637xOKlUSo4JlegAJ53rDWzfSNuarXnjnnkCVtJbvYvSvIDRVDokkG?=
 =?us-ascii?Q?U38oMQteiodzWEfuzcnSGh0g6ULpsmp/lloSxXN31OLKkljU5i5Ou6Tg7A+j?=
 =?us-ascii?Q?PyaNETDQWqS09mB5jjUepYJg7Nyb4c85vdY0Gxhakdu3EZXbC4Meb7A1hkC+?=
 =?us-ascii?Q?L1ZiTyFQ/HnmVrJOjduekOO4OqRYWxpvarVjfjJtmgi0o6lLfshP4jIAqjVY?=
 =?us-ascii?Q?rBttrQolLpy1CfVh4YVHrp3D7S2uI3S+MbImgycFmYFPOKHcHP97mk+UQpTr?=
 =?us-ascii?Q?yxQjzL46McebkQ1k37iLJw6KiiWD/dcnoAQsQWCSGUhBqcrlcapdKXkpP6Yw?=
 =?us-ascii?Q?/sWeqIYC6kOCYAgKL7OOEgbVedLt5/ePiCWJThW80PFJXIVuqOl4UfpKgIti?=
 =?us-ascii?Q?SesQoLNo79NLDVgnNn/HQGrom153avGtm7ZV193XmNkqCAyrzkntk+o6scbN?=
 =?us-ascii?Q?OFWM4+R2ZQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: sMMrjRNOtyV4Z+9vqXnZSMkrBBNQKHoSnVBMZBQZjI3v/t1resdZ6mB/+GXItP8fGxqVcPvu54AzSPw+r0lUsGpWdecI7S2JR8bXfZfj+pB7oqyfFpYQpVLspnj9CT6U6zIprgGtSW70G38T45NTl2d+873VUYa6BXNg7nVZVrK3oHczXui44CT/h6tiPzSoxL1QHF5fSK+bvsziSyh0YiEA81tJ6RokiiP16BAVDR9XW30eqfLsoKNVSvtc9jUOQd/gWBi1G1taw4w3kC9ab3yTVz7XQ3VAUw3VgMlx+rqMKKii7Y/lbdFX7BYrPDdCZYLAL0kQLha6BYHvu2phpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9aebc5-737d-453d-8371-08dec8a6196c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:14:45.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imHq7c2LDBlnEqXLr6bp9kKW+mWhGl+Y2OGKP/TKp8ip3yC8LfiDtXE5v6IftsDTgoHjhmkHNq4BeXVWXpP4Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
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

On Fri, Jun 12, 2026 at 10:35:40AM -0600, Yao, Jia wrote:
> This patch can extremely reduce the possibility of CAT error.
> 
> Tested-by: Jia Yao <jia.yao@intel.com>
> 

Thanks, this version still has a few issues which CI / sashiko flagged
which I need to close on.

Matt

> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, June 11, 2026 9:26 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wang, X <x.wang@intel.com>; Yao, Jia <jia.yao@intel.com>
> > Subject: [PATCH] drm/xe: Disable scheduling early on FD close to avoid CAT
> > error cascade
> > 
> > When an FD is closed with many exec queues, teardown relies on the TDR
> > path to clean up scheduling. However, the TDR handling is serialized (i.e., only
> > one exec queue is processed at a time), which can make it too slow compared
> > to GuC scheduling activity.
> > 
> > In this window, GuC may continue to schedule contexts backed by invalid
> > page tables, leading to a cascade of CAT errors and repeated engine resets.
> > This significantly increases recovery time and can degrade system stability.
> > 
> > To mitigate this, eagerly disable scheduling by sending a self-message outside
> > of the TDR path. This prevents further scheduling of invalid contexts and
> > avoids the CAT error/reset cascade.
> > 
> > This change improves robustness and reduces recovery latency in multiple
> > queue teardown scenarios.
> > 
> > Cc: Wang Xin <x.wang@intel.com>
> > Cc: Jia Yao <jia.yao@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 32
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e82018445b7c..1625d3cd03fc 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1872,11 +1872,23 @@ static void
> > __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
> >  	kfree(msg);
> >  }
> > 
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> > +{
> > +	struct xe_exec_queue *q = msg->private_data;
> > +	struct xe_exec_queue *primary =
> > xe_exec_queue_multi_queue_primary(q);
> > +
> > +	if (exec_queue_enabled(primary))
> > +		disable_scheduling(primary, true);
> > +
> > +	kfree(msg);
> > +}
> > +
> >  #define CLEANUP				1	/* Non-zero values to
> > catch uninitialized msg */
> >  #define SET_SCHED_PROPS			2
> >  #define SUSPEND				3
> >  #define RESUME				4
> >  #define SET_MULTI_QUEUE_PRIORITY	5
> > +#define KILL				6
> >  #define OPCODE_MASK	0xf
> >  #define MSG_LOCKED	BIT(8)
> >  #define MSG_HEAD	BIT(9)
> > @@ -1903,6 +1915,9 @@ static void guc_exec_queue_process_msg(struct
> > xe_sched_msg *msg)
> >  	case SET_MULTI_QUEUE_PRIORITY:
> > 
> > 	__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> >  		break;
> > +	case KILL:
> > +		__guc_exec_queue_process_msg_kill(msg);
> > +		break;
> >  	default:
> >  		XE_WARN_ON("Unknown message type");
> >  	}
> > @@ -2014,12 +2029,29 @@ static int guc_exec_queue_init(struct
> > xe_exec_queue *q)
> > 
> >  	return err;
> >  }
> > +static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct
> > xe_sched_msg *msg,
> > +				   u32 opcode);
> > 
> >  static void guc_exec_queue_kill(struct xe_exec_queue *q)  {
> > +	struct xe_sched_msg *msg;
> > +
> >  	trace_xe_exec_queue_kill(q);
> >  	set_exec_queue_killed(q);
> >  	__suspend_fence_signal(q);
> > +
> > +	/*
> > +	 * We eagerly send a message to ourselves to disable scheduling, as
> > the
> > +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> > +	 * If an FD is closed with many exec queues, the TDR can be slower
> > than
> > +	 * the GuC scheduling contexts with invalid page tables, creating a
> > +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> > +	 * this by immediately disabling scheduling outside of the TDR.
> > +	 */
> > +	msg = kmalloc_obj(*msg);
> > +	if (msg)	/* Not fatal if malloc fails */
> > +		guc_exec_queue_add_msg(q, msg, KILL);
> > +
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  }
> > 
> > --
> > 2.34.1
> 
