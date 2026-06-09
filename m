Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC8DCD8CAA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 15:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBF510E313;
	Tue,  9 Jun 2026 15:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFgsPrVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586B10E313
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017506; x=1812553506;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gNhPIDV4NHYgSazOuXB4D7iKcJRcq7cCWQPJYmPXG0I=;
 b=GFgsPrVNggpalPxfWKgziQvyz66XmYN0AhNuM1pI80Zv5rPp1sz7Ly1H
 MBf2G+/z1XO8Nbjq42UdnW9A4F/RaTADwbpNAfOKptkwwQ2mSNuWfyi2n
 8xrAv6QxGq7XxUmdgyfTn3KWFtMcsROBaMBxaLkJ1lKOmznkFeDrtnB1e
 w936d4Vq1mopgFjOe95k2xIVdTGB/M9D3COYMyTCYavgA9XzyUL3/d5Cb
 WB2E2AtNBWVJh/WogRbfvJXe78Q08perSN3xDRogmRefDZoF4n2LaFZ2D
 v7BesMJfMh9wtAfSqNdyPY1G7jh3JZ91TQ2u7wyCuLAyI8vSr3hZdMK34 Q==;
X-CSE-ConnectionGUID: AVNQPD5bQgia7kt/KEC+KA==
X-CSE-MsgGUID: /gv/cFviS9+i1T0n6FO6Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="69313830"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="69313830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:04:24 -0700
X-CSE-ConnectionGUID: f8Q87SyoR2GdIj4N9d6bzg==
X-CSE-MsgGUID: T1bGDOK+SG6qrb3ApYUpkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="239548514"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:04:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:04:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:04:22 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwoLHOmDggJn2dHizIR/M7NqHG9e47yuK8kcV8JXIDtxfL297rNOQUAZbobI9Jlrtew6fz9f3HbwgIyvSv3RsiOXbNeVuquYXyUJGY8nU9zuqwx6lquUxJae8IA3q77xCfosSj1wXiiaywTeZR+OOcnO45fZL4aoJD2oFJuVeMA0XE1IdQnZJS7Lt9UWkAQLAyJ+eYB+6oBbHqk7vqcYrDoaNnN7zHMKzYAj+DKT7e+gqAJSJAHTARYUSef00zEll4yXlAZHO0/tKYdSYJ8/zLEsu4o2aqOO4UGvl7yQMw2ZwfyxB9QNbwWkDJppFc3Ca/9tcV+YaGJQuJADKfxylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkFbh7tDxS8xLjUmWyvVLw/sqLnR0S0GGZX3YZUTInc=;
 b=CuBSSZBDLen/xCFecx+H9Ru89gF6JEFH23/HCs3ykybw64ds/JuZJN9eo8xN6pSvRCxtfh8ySTPzUDgCIkU0nRkt7TkPBzOUjopqZHNskZjtTMe7txtxcNy6dD5MrMzJUK5N8bZ/Rv8S0txWCQpNQOJIPH8iCH9RQiVd7Kfk9QLAuHJoBBrZOPcDe5tb/Qbwx+adC+00R29o8QTSxX/DC6hx0W4wr+czaWA37Tb1bM7yn2rkMSiNrlrpc0YtsX05ajFkSxWby793w3NGsTTMl6DgPe79Y4yyLkwbdWkmDtaHVUx3l9KYlV+9QyPPogBz6j2wSL7eR9eBPkt4Qom38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:04:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:04:18 +0000
Date: Tue, 9 Jun 2026 08:04:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
CC: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: include all registered queues in TLB
 invalidation
Message-ID: <aigrb/MtXb3g5l1D@gsse-cloud1.jf.intel.com>
References: <20260608162745.338725-1-tilak.tirumalesh.tangudu@intel.com>
 <20260608162745.338725-2-tilak.tirumalesh.tangudu@intel.com>
 <18d30e971b2763075abb7254b4e2b8d63ab02e35.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18d30e971b2763075abb7254b4e2b8d63ab02e35.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0327.namprd04.prod.outlook.com
 (2603:10b6:303:82::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: a1750ced-905a-42f9-9487-08dec6386151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|4143699003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: EaYeJjNNHpE8zAXxEo4uXiBjcGHtrmKDFE8BFIpe+4pz9OYML5GknfcBGZLdrTUZAaXH30cvAqACzKzPU/kIxbg2enrn0L43IU2106XQqEYwSBL5M44h6eMJ+TF3LWuKe6HNHX/TwDqRrl1s8/oL0taKTqo8w3VWTpA57VZlKwWlgvlSw36z4ZwW8yecyoyRTGJ1Mhp5wiEIarjHKBAGveV4pIOLBMXYdFuoVnLY4QJIMtmuy1Ngrra/ry/UCSNGhzIm5gwFLvX2Yxwa7i40yW078eCRJzMYCVIz1JUYtS54hNiZvnUJi3A5292BI3f9XWUB5X6mn2QIbZu71piy7BnlhZRgoxw+TMNQ8yfU1A2rt47Kq5RlLaAyugoYQuiWC8uG77wUi8MXtedHh4U2GP1yjwjur2jVLMBn+B/OrcX1SwakriV+u/1GDXwsoBsGnT47eKyjE/iaWWB9rQcR8RZ4mPdGN27VwQVPgzUA+PJT6pwNJpeY2fr4gK/Hx7ZYF8r88Niselsnm0PRMBrLM5Ff/QYdmJz4KZpFsZPuKWHVKwj41qAsXHGRcEDKtmtkiDb9q9LblyFreZodxS87gfXxezqqOb6soj8fGkzaVRb6MYUI1YjRck5gRLCT9U3jkE5eRLXP1A1W+FDoh9xk2sSrEW/fE/2aY9z9IhjtMOYead6PKygi6rKqs7IXx586
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Sgh3cA2fHnA/IxJdxehPKLZRlL3Lc4Uy07DoX4UjmRjaiqYmHLWlfSXMg+?=
 =?iso-8859-1?Q?POi9BZ0tPmiIidclCqsRX79PhiZlRQg3qg4IkKqR4/1oqPE6fZWiBFgL++?=
 =?iso-8859-1?Q?9iw6D0mttF0xlCz7tmkpSCUR/PFdB8MGX+PYg25hKyHORwbpJDbqKMHbfY?=
 =?iso-8859-1?Q?RSyUbAGx4aAoQfCp00p8jAiFiq8SP3wpDSWRWX6uwhCQA04T4cHdo1iUzg?=
 =?iso-8859-1?Q?DHPt4YM/XZQyMmAvBDtHpW+bwZHCAyevGA9Q0ihx/ReJMh/8Y8AEkZoY9l?=
 =?iso-8859-1?Q?YVUl7EBKt2wUQazBKKfr4KzXBbPmgLBMjtyzLdC5z16ch+M7Eb/78ZmnRx?=
 =?iso-8859-1?Q?bWg4eXuSV9waDtFXDKL5LRRyHaK71dX6zr0bigzQI0ebHbj6Yjt4JCPmA5?=
 =?iso-8859-1?Q?8xICF2TEg2IFkRWIwYVjw4JlaFTGvQJctYCtJmYeXy8Dv3LOxIpr3tdtgu?=
 =?iso-8859-1?Q?0eO3o5yuKHUadIun41Ir7TCFWytbiEBfg0ZlFCp3RzijDowDtMR95jBLVN?=
 =?iso-8859-1?Q?qKadx/g/sxV8DnZXYHWf4oRpudmyUmwry3yh9aVejQTX3JPcdIh9UW9uwF?=
 =?iso-8859-1?Q?Y71YTqte43Bmbl93DKv+V57/O1OTBWfQnVUc5UOS9uNJQSlGajYcg8zOHL?=
 =?iso-8859-1?Q?qj4x/5pdeDQ5Mzkt/W4ln0aGQDuwRxTKbrBQMrsrmMEknGQnruQQcuIdws?=
 =?iso-8859-1?Q?/ziJnU6cNFW//z8Rrt/jRlP/YrOyUdNuNs73DAFGZ3HoxoZ0Ws4Lzjltg9?=
 =?iso-8859-1?Q?eYggv2af5cOkr+j2g9rnTx7Xk5K39+Le6LkFd5tnRtsIaOWHcnkh13CNM7?=
 =?iso-8859-1?Q?1YfEDPm3mwtXTByKCr0tnWFrOSFrZjQlk7OsINUE2DjuaQr1DhTZ0weeTO?=
 =?iso-8859-1?Q?K/FaXrE38Cte7sr4fnRCvtHMM0eum6Ed+EDKQoWSlEKDrKuFeem+Umq0Nj?=
 =?iso-8859-1?Q?HeveicNlssedY2GFqDvFXCtUN0RvgtF3hGklp4gS6f74O9TZCxF2TfrR2S?=
 =?iso-8859-1?Q?m5U51gpf0ylFjPADleC4LMHF6jpxGL66QjSL56nMWXLUC0SHXe9yr+Jb0S?=
 =?iso-8859-1?Q?ourx+XbcJY9yC5fxi9qWbJVPlazPO9QDjyRapVn+VQtKse1LnKvdcj8/w8?=
 =?iso-8859-1?Q?CEOrjA89bQ8CCCTgmzRP3pW6MvTfiaTy0pRy8k4tXs5Z5/pkl74gFiSfp7?=
 =?iso-8859-1?Q?LgFHN1qmM0CSR1MzDN/9BmD9kqDWtJugM3XtbEGDCKC+s/5xfOAC/8LXBJ?=
 =?iso-8859-1?Q?ZwnXBZp6Q8bV25GYKwfvTycyze3QEFmuPxADAevQwFmXcxKltYVsMW2ZSh?=
 =?iso-8859-1?Q?77OX3ZDHuFWkZDPTnR+dcRY5GDiMTW3/b2Lkz8cttl940nh3yTXlvnNtf5?=
 =?iso-8859-1?Q?O49dWCxOhhnBXWkBbKh4Z1aZDJ4T5yqzT9K7biW2qWe0bT9ygjd5cSs2iF?=
 =?iso-8859-1?Q?ADwDugx9muse7Re/b7DQv599rp3PJto4xgu7UVdYunInF/PykiBOVHAiiB?=
 =?iso-8859-1?Q?EPkvjPe3wOZNdLvN+XGOfRFmtCpTZ9Ciry7s+8ENKEXxiwx7ztRftH+zKO?=
 =?iso-8859-1?Q?yjfZ6ddtk4YBsXv9xDhmurqBtCFnUpjb6B0KpR6aKY0HRGVqExpunZpf1a?=
 =?iso-8859-1?Q?tA56OB1brwGGDMprD+fwfb6mIpxPggWcx9DuITBJvsgNfeKO3D3a6PgKd4?=
 =?iso-8859-1?Q?13AYPqZWveUQxDVwHqJzUZ1r02VCzQSSkBHF/cA6LzMTiHRvsM5OGM2SFf?=
 =?iso-8859-1?Q?qlro84yl77+LSv2EnE3VEMeXpB0ql7U5LZxvTMXIdqSVezA6Ksz/QiLjnK?=
 =?iso-8859-1?Q?NBbG9ksfbg=3D=3D?=
X-Exchange-RoutingPolicyChecked: UZtWkewwNsch2jKoyRET73W1lmldc+XXUbLZ7TLU1oUIdjEqVi/kkN4g72JIMYStTApm5g8+g60ggSNuJdeZCEjK3Kw9HSTSnwFDziJiYdmR+ZPKjOruhpIpDzvMaR9nxkEqD4smiGaawb2siwXddzemEjF8Xx4TOQZw3HDgnTJnlLYEmlUek2DEtoEvP5ZYm5/xx4V87d7NSN3Ku3T4bqX63aC08d6wQyz8ECWz2nG+36JfpTeU712KghKuHFYrZGW/2Y2BgU9JHjl2WaxT1LC7EDc+C4f5ee/NxMuDXlA/OJGDh1B2WtNhSR6GyyMAM500aexwdv71Xoc1Psc5fg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1750ced-905a-42f9-9487-08dec6386151
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:04:18.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SscO6LKDqz5xJFeMrV4QRjvnZ41APySuun//Hd9zD/innS/wqQrvu2Srp+L3lDuK3TW+iDlhc9YWA6/zhSJ8Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
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

On Tue, Jun 09, 2026 at 09:02:18AM -0600, Hellstrom, Thomas wrote:
> On Mon, 2026-06-08 at 21:57 +0530, tilak.tirumalesh.tangudu@intel.com
> wrote:
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > 
> > Context-based TLB invalidation currently selects only scheduling-
> > active
> > exec queues via q->ops->active(). During rebind flows, queues may be
> > suspended (or transitioning through resume) while still owning valid
> > translations, causing them to be skipped from invalidation and
> > leading
> > to missed TLB invalidations on LR rebinds.
> > 
> > The underlying issue is a TOCTOU: q->guc->state bits are flipped
> > lock-free
> > from enable_scheduling(), disable_scheduling{,_deregister}(), the
> > suspend/resume sched-msg handlers, handle_sched_done(), and
> > guc_exec_queue_stop(); nothing in send_tlb_inval_ctx_ppgtt()
> > serializes
> > against them, so any state-based predicate can race.
> > 
> > Include all the registered queues so that TLB invalidations are not
> > missed. This is race-free because list membership on vm-
> > >exec_queues.list
> > is stable under vm->exec_queues.lock held by the caller. The
> > performance
> > impact is expected to be minimal and harmless. If it does turn out to
> > be
> > a concern, we can come back with a race-safe solution to ignore
> > certain
> > queues.
> > 
> > Fixes: 6cdaa5346d6f ("drm/xe: Add context-based invalidation to GuC
> > TLB invalidation backend")
> > Assisted-by: Claude:claude-opus-4.6
> > Suggested-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Tangudu Tilak Tirumalesh
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> But let's hold merging for a little while and see if Matt Brost has a
> different idea on how to approach this, and if so whether we should
> implement that as a follow up.
> 

I'll agree this is a little racey but I'm not convienced this is actual
problem. The possible issue I see is in disable_scheduling()
set_exec_queue_pending_disable is called after clear_exec_queue_enabled,
if that order was inverted this should be race free.

But in general I agree this is a hard reason micro-optimization which we
can pull out for clarity.

So with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Thanks, Thomas
> 
> 
> 
> > <tilak.tirumalesh.tangudu@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index ced58f46f846..cf6d106e6036 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -255,9 +255,8 @@ static int send_tlb_inval_ctx_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >  #undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> >  
> >  	/*
> > -	 * Move exec queues to a temporary list to issue
> > invalidations. The exec
> > -	 * queue must active and a reference must be taken to
> > prevent concurrent
> > -	 * deregistrations.
> > +	 * Move exec queues to a temporary list to issue
> > invalidations. A
> > +	 * reference must be taken to prevent concurrent
> > deregistrations.
> >  	 *
> >  	 * List modification is safe because we hold 'vm-
> > >exec_queues.lock' for
> >  	 * reading, which prevents external modifications. Using a
> > per-GT list
> > @@ -266,7 +265,7 @@ static int send_tlb_inval_ctx_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >  	 */
> >  	list_for_each_entry_safe(q, next, &vm->exec_queues.list[id],
> >  				 vm_exec_queue_link) {
> > -		if (q->ops->active(q) &&
> > xe_exec_queue_get_unless_zero(q)) {
> > +		if (xe_exec_queue_get_unless_zero(q)) {
> >  			last_q = q;
> >  			list_move_tail(&q->vm_exec_queue_link,
> > &tlb_inval_list);
> >  		}
