Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A904ECCD185
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530B710EA6D;
	Thu,  9 Oct 2025 14:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vh8HBg1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3762A10EA6D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760019974; x=1791555974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jmZlyVF4TWO6axdoyw87GTj7EwD/TNsE7zCa/2L8XFQ=;
 b=Vh8HBg1B8Xo2NpnIqoTosIFcrN8sXTt3Lyhe7rRcizHC3+Eya7dQ8BQh
 68ru2QOF8/J4Y2R8m1+Euan4wZ0WeamjLgXnAv4u7OSBlji7q4uxz8Y4v
 H9lfnJALCX4lETM9kWuRu6o0EgwLu/fG3kq7k7BywzraFiFEqNDs+kaJF
 vTAtG+YbM5oisJudDeevIj+qjL6wqUyEMo6mzrDP3yhFktNH37ZhBr67z
 1D3Tc37jP7mqQTdAWtM1TSkcLgOZjA83lmcJGyJGjccEJmhq6JmG+hgDE
 uxg9RD1AQgIgG9Ok7R8Zzv/9C0TyJu6MfvBXtGZnlynRiGipvQ3rWzAiW g==;
X-CSE-ConnectionGUID: djHLm16pTEa/P4eHC6makA==
X-CSE-MsgGUID: Wl+sI5WnTFehUih0+gdruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64852818"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="64852818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:26:14 -0700
X-CSE-ConnectionGUID: U7iwrlweTLOPLk0VFAFNpQ==
X-CSE-MsgGUID: Lgp17PpkQsmVkgJIuqPMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180408034"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:26:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:26:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:26:13 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePawHfJ/vhS6WPpRMKL5qh73+MxROuZ3Co9MJV4J5W0QPs9xxxDeCKQ52ll0AqAEIZviAjiOzTgLx9KFiPM+sN+tmkePe5wMIJUnS+p96WWO9dP4KHKwmBtZ+aamTZU1a9yxXWTJx+6K5zE+6sOzc1A2gGKAhoQfwwK3S19A3RxJiEJ9nH2k6N4h9G1Lz5ZmajOsVCFy/CHeL3LCTbtPAL3Lztd8F0glzqo7gdu8rXTDR6sPY4B46EyY6lDzpQbfqk/swK2JxLbHoZZZtvteP9am6M+adYxNU+810pg+6rU5ctIjOXTuIwnuVKTC0WPctju9GiHvYMtrQasrPfx4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPln96069cE9iFu24TlkiYQbdFlQPkMaxjFJZ0rz6JM=;
 b=mdmLvHnLTCV3WDycDFYscZ0ZWjR/CROScqIaj+M5YiSoVpAoQtGBW9xVcuyWPecLxwGVIOFFlaARWAdg6DVeGgZw3FI30QRzZrTUqmiOxf+swUrToZpVBErITQWF/inL8mB5dE6GTq8tApCxhuFFp3L8pVScQNZyvwFLk7TJGE1y994zx4JzX+XcpM0/NKq+4Yc25ho7LXLMXMhoMCZHttw3z/6vDhZzEe1kWnot0cEat++9b2aGLeCZOI274Isjg1Qjf7gCBxCn8OQi13sQN/5NpPJ1rkilFk2f53TEtpV3C3fyFqEZ9FCxEB+FEv/6GGECHLe53ad0/W9peOwWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:26:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:26:11 +0000
Date: Thu, 9 Oct 2025 10:26:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <heikki.krogerus@linux.intel.com>,
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Wire up reset/postinstall for I2C IRQ
Message-ID: <aOfGAA0GrT0JGMTR@intel.com>
References: <20251009070304.3210101-1-raag.jadav@intel.com>
 <aOe71Yj-o6QFFXaU@black.igk.intel.com>
 <bkkwks7j546u7qskxobxdd6xjohupriruopviuxog4hig37a7t@g7otn7xly3yw>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bkkwks7j546u7qskxobxdd6xjohupriruopviuxog4hig37a7t@g7otn7xly3yw>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: c83970ae-ebdb-4843-5825-08de073fcb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7obHV8GYXIql1BhILvmmfDEJFvGeu3cyb6KmmJEkziI+sdgnAez6zmiIg8fe?=
 =?us-ascii?Q?RngpxlP0UAK+28Y3WX8Ni/TjtLQ0aHQT5Yy30PUyUIEhPOf71QQl6gO5RRXH?=
 =?us-ascii?Q?0lvNvEmnhFOfTv+9/cGSYYyIhWOB8iYni9chp1Fj9zml6hYkX8aRX6/jIQ5e?=
 =?us-ascii?Q?tlkeybXr4NFjNhKDLf2240wzOh/m0uqvwNEDIJHRysFHZrsc9gTydSBx3iTR?=
 =?us-ascii?Q?2cU3TS37dhf1MGyQ9FPmQ2PisdrjzqLuaJREwmMdUTLyBaG43Rg/uUl3sGlh?=
 =?us-ascii?Q?mGlbLn8m6QtdJOJ0xFX5bW3ciaARNDmoOd75JzSFaiOHQ/CZJFVxD2gzYCmV?=
 =?us-ascii?Q?MGao2J+8ITAcvG5Ewv5MqlXvgfMOuxG0BiwcZNsVcV0/3x7yAG/7DsDnhjH6?=
 =?us-ascii?Q?kLo65d1cU5juStOg4POcBWo6ZCQ+rdY3DdlgIHoCfD1CcTTN5K/UnAt0cy1E?=
 =?us-ascii?Q?96J0gBVRr1smy2mJdqU2LgIJ97O6y9e/7I3NeBh0pTCkbsZLivs+mdlfPC2m?=
 =?us-ascii?Q?jhYLgiTzEn4eF+HHAu1hXuuQWWyDHpaAlU+fsueeBD/V36mfFLQAIzRamu0Z?=
 =?us-ascii?Q?LQwPuRPsIbMFYe135Iqzt93pt0KbUoO0wu22VfmlyQAxIlZe1sCu0+qbQst1?=
 =?us-ascii?Q?6APEl5T/KLfUt4oKxaSoBqlKUT0f2WyZi2vl48hSMUWgGvYkbrDZKukTLvwZ?=
 =?us-ascii?Q?Uur4lcQy0clDvdkQjJg7WMNOVLHpqTftsejcQf9+sdXX/AtmXYRbE9A5TRh5?=
 =?us-ascii?Q?WLm/Wq+bubhYAU9IJVqxfhsw1jGSJ+uCJaFS9h4xPtfRJfGOEsZ/kB2q1Sf3?=
 =?us-ascii?Q?QTqQaTUWFW8MjLPC2loNxETAJEY6Yu2+PD6dQGz5ZVimmKUyNV4x4QJzDTWp?=
 =?us-ascii?Q?xrrXpSi2RKsrECQ2MzLHVpDjDGq/svIZAe9v4INZNfXlYRT54JI1hd1oKZt7?=
 =?us-ascii?Q?uJsN0L6eqMgFsDkVoj7doqhB1q2a4rKYNrlJ4yIPUvuZ3ZbzGwAnfH/ipMqI?=
 =?us-ascii?Q?SxLWHHn8en7iDbbLcZryq3iaGSbIzYcD3gnxSzpEw8HftCVEDSkvuVUjVe8m?=
 =?us-ascii?Q?3Xh4pDHFmcV98U+eCl4yF99u7a7KsgGigzOMcsK1rT62EqEOTavABSSG+Yc+?=
 =?us-ascii?Q?Tym79yNdtj8/MhiRH0kgOZrJazkV+XeRb8UQGup9KZ+jAxtXBoG2S+7PPScV?=
 =?us-ascii?Q?TfZ/0yaDedmjNa8Cn1HdeqTVHAk8HONRom1iebXKKe3fMGJFlwnCFONuzVMJ?=
 =?us-ascii?Q?xRGjAxY0qYZGnD0WsOKFC+DyMyeBLvfkEVy8aWjQLFPqRx9kjlMF1gLN832w?=
 =?us-ascii?Q?8Hw3L66Z+ThtylnaLzFd4HXKKBHA+JdFB9VSEPMN1///5JuJhuapHcgN780m?=
 =?us-ascii?Q?EscK3OVanjyV2V1v3oD5uf6AXeXap16cwD31RJ8Knf1S36DkdPoPV7diyFqK?=
 =?us-ascii?Q?K4kSwWEXQNy9MEG19NfKrvoB0h+8Iom7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zlFlOP9zEptaYWWcwG5C355GRTkliLqy/DmhZwEi2Hljjn8etcq6z4Pkbu+f?=
 =?us-ascii?Q?J24GuK5IOJ7bjBaB/QOzRY+SYxTNhFkfSnB3o6z3RetPQj3mBj905pkz+mbu?=
 =?us-ascii?Q?v2aINGOUTow+PwPDmpThSCEgsiQj+71EIhaJEMnKzPo7slWaIxXh3E59vyKb?=
 =?us-ascii?Q?ucdi7eArFccoz6YBYpFUkkLj+xg7B3RFRJkCq/eoOmeKgYPUBXhCD2lQrpQ8?=
 =?us-ascii?Q?8kSzMsUn+jRUbhEWH18H/vUunKRfgftuwJ1x8VOVwrc6y9dN07PbBu/X76Qg?=
 =?us-ascii?Q?0vlKV2wWtgaNYHvEsOXbP2C/H4zhUB0x2v8ahoojv6ekRwBqg4G03F0EyWWQ?=
 =?us-ascii?Q?tykgde80fCil7ORYMVmB7w0rTkpOI3M+5f5CglOvkzNuNlH+JeaRwvkSs72H?=
 =?us-ascii?Q?piq7h1k/W5zA1K9MC2WcjJOZeN9nW99pvre/vSqFoo0GoE0qKtoin04DfPgP?=
 =?us-ascii?Q?MyL3N1HNe8JHLq4+TB3uKfoJFZlZ5j58iQYdRvgd0t8FhdrccbIZ7tN9ySku?=
 =?us-ascii?Q?gFUOfem7hU9Kj84d/XCMapc17mnlZjOqMUgOgTu7yrlgcHtZpEfUhiFX3Ler?=
 =?us-ascii?Q?9X4r5uiIdf2/8MP7GTtwx4WF9iLuSU+KnaHTSf8RL8TRCRSXovvv1Bk1W/rB?=
 =?us-ascii?Q?GYTnDeNbzfqnnWRejuhGv+JEDe0T6EtxSn203pJ7ttPbuVxOekeBsfC0rJQk?=
 =?us-ascii?Q?3/FRF/CIR0k8YM+SqZ6kQADkYa4mYPPoldujYLRs5Z3asxsxPzRZmwnxLaKO?=
 =?us-ascii?Q?0CCZOEtJ1Ky1mUGUFTlRptLJU0vE5Hr6AOEUKCyQdhI07qbHQEPwxLz2Bcu/?=
 =?us-ascii?Q?lhTg/1kl98Z28R0uRHUN9pNVA2+xHCq+nJGC7kXvrcsaf7zz2AmtPMnB8dfD?=
 =?us-ascii?Q?yRslt13aH780qRCnQaEe0flD0sh/+BCScR6qYfHBOMVNnmL7KVqJeA6be0od?=
 =?us-ascii?Q?fJTahDWAKVofNPZ+eIO3ltbvVN3V3MEamlueLDvldDzjgk0qV6+ZAELyYQCW?=
 =?us-ascii?Q?oQXhN9LaxntbTsdFitl6U6DX/hHY+ssiHj1NdOzQaIFApFs/2GvwZ6gVlDOc?=
 =?us-ascii?Q?wmio7KJCywnlcWWxNv/aCNSNK4G2AaNZBLD4pDUrFLiY3S3s6XtqOD677GeV?=
 =?us-ascii?Q?ADsBX26cSPRNLxFISB+TJ1eeM6yI8ePzCr603Jydz3frhc0AR/Rkf9xmeqGI?=
 =?us-ascii?Q?u8U5dVLO3FPqG+HnxHbsYodaPYE9d8vjUi/mO2N0R/uDkPShKILD0DTItDvo?=
 =?us-ascii?Q?mAfVROtuTgTwILB0LKamPC1B6AwgBNt9Y0vypmmJpmC/I+iogaFVJnpR1zUK?=
 =?us-ascii?Q?GNz5Mux3xQA//HspiH4HDrbhA7ZJcQ9uWxtgMhdtNFar0OYc6oZu/N646Io9?=
 =?us-ascii?Q?lC7S/lACPpPj4KWWwsWmYRiwxdncIM3dta+50HC1j5+AHZSWn4BcuMTdQLiO?=
 =?us-ascii?Q?HQMGpUOH/b83EDT00gAhQXiqEkvsxHSLVMKF9ZsIiDwVvecnbkSxlQUauoAY?=
 =?us-ascii?Q?aZYj/Ylx/9y3cB4PG6iesp1E7IuT0v3Za3A5yEq7SeKi5BCY5bVUN98jyfJR?=
 =?us-ascii?Q?pW3TGZaRbIwE/nH0rPpg7deAGGdWoofTIQ+hgfptj6cL4PHtDFfD0YU2jNv0?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c83970ae-ebdb-4843-5825-08de073fcb8b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:26:11.4914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pFrTwS2ImZ+hCARuLRm3Oy7+u8wHGoqBCJMqSR2BfCWWEkBBxnIu9CWhYH9NvKQLiey1XKJ3sEjEnZVRXn8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
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

On Thu, Oct 09, 2025 at 09:15:37AM -0500, Lucas De Marchi wrote:
> On Thu, Oct 09, 2025 at 03:42:45PM +0200, Raag Jadav wrote:
> > On Thu, Oct 09, 2025 at 12:33:02PM +0530, Raag Jadav wrote:
> > > This series wires up reset/postinstall handles for I2C IRQ so that it
> > > can be routed to SGunit or PUnit when needed.
> > 
> > Please hold on to this series while I resolve a few queries with the
> > architecture.
> 
> you caught me between applying and pushing :-o. I will wait further
> updates here for the push.

similarly here... I typed "dim b4-shazam", then I opened here again to get the
message-id in the header and noticed this msg :)

> 
> Lucas De Marchi
> 
> > 
> > Raag
> > 
> > > v2: Integrate DISABLE_MSI_CAP changes (Heikki)
> > > 
> > > Raag Jadav (2):
> > >   drm/xe/i2c: Introduce xe_i2c_irq_present()
> > >   drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
> > > 
> > >  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  4 ++++
> > >  drivers/gpu/drm/xe/xe_i2c.c           | 28 ++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
> > >  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
> > >  4 files changed, 37 insertions(+), 1 deletion(-)
> > > 
> > > --
> > > 2.34.1
> > > 
