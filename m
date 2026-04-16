Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E20AF43859
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 06:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5F10E18C;
	Thu, 16 Apr 2026 06:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOzFt4bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FD710E18C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 06:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776321359; x=1807857359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pikMeBZM5mGSa/eIhQ0reW+WWdsUIz3+SXFir49kUZ0=;
 b=AOzFt4bjSTmVfO9xNXhdP0z5K9pQO1iv/9IPuZ7BT0Up8a0xFY4ebFcF
 75BizR+x/laRkW5zCcO1MhbSDCpnyuR/Hk4Wp8LWs9XvPpmYxZBmaIBRe
 NNGAgsHvAhSHfqpdul3u13O1u4+e3j7imlunr+jJg2ry/z+buGFDxKeHf
 lhZKj84W5sUqfT0+MyLdwvR81sg65PPEBz6gGWFu3d+KaDd3rVYMPhBsg
 Zj/GVLqhf2b8UfLJKQ7k7hlfSSyDoADm9iEEk+BEx03g9azyAojeemwYp
 4+/Tj+cOZxm1C1fkbGcp4eSuSjmQcWW4E3zpV04bOgIkSrDSMRKxfPUcW w==;
X-CSE-ConnectionGUID: Lkp1ssZsQSKV2Uy95T1dwQ==
X-CSE-MsgGUID: p6uC6s8VRSelSGTT/DtYJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77010971"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77010971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 23:35:58 -0700
X-CSE-ConnectionGUID: pRQFnpFHQeuBx6Si0BaA3g==
X-CSE-MsgGUID: m8I9CmBNQmKZGHbQc3OvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="268627520"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 23:35:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 23:35:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 23:35:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 23:35:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYmtlxzUaVTsmqHmqUaqfWSsbzhO6iG4tzMug9sSoiYgAVouvcGmg5+oVVLmlMJXynZydUCH1wALgMooxUuUzk9vRIgDJPKP1Zw3clM0BvUzif4zO29nKD4qFHtp/PuCo+TaDa20aSO8AXKsgp8iCPClRi5iNZ9s5b1SdulkWv0QtdkBU5BJ5hHWKJ33i59ZTNE+D3SmbkIX0+rZRtog6MFajA1zbcMf963SgDGehTt2dGStKmCQPjpe+LN0xJ/4dJYG2FyGsXMUJ+bZcDIOX+48uJgiJ9CKEWhNEQosXSEYfF58Kqzb7czNFB+NQ/yGWKExUEJK9d9qd0otNbJ2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUJQ0qzrgdi3yKSRLnh4izfURj6Iwiiiutn0bxvPo6o=;
 b=mdFv4p+pcMqzrASwnycPjy7cQfLJ98EtAobyZPPuBc5Ib6b1/Rv5OX1UO3Z1yMet9+E+o4e/hCoF7MYC/Re79YkHcopPyaH56vkOjraNvU7Na51MT3qpRHXUvyqUFxs03jWAFqZ2Fr2RDVICZ29zJbTeXepyQi3dfVpv8ROOs7KXkQhuU4jSVbXjfpLP+73gKX8TFBdjgd7oAo6Uc4jgYpde+jtpNNwaLlqGOVSwGlVJyCGzQJFkkW75MBiT/YzbblFdT5MWFfrKSdPPUKcAuvn2ppNw4kC/qBv1zuxg09VGKOIMYsbV+u07zfJPhtjCJ4AefBvo+/zD258WxWPKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 06:35:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 06:35:55 +0000
Date: Wed, 15 Apr 2026 23:35:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
Subject: Re: [PATCH v5 0/9] Introduce Xe PCIe FLR
Message-ID: <aeCDR/MjNyNV0Y3C@gsse-cloud1.jf.intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <adcfe2bd-56af-4368-96ce-32fb9a5c6642@intel.com>
 <aeB_g9mtwo6Y9sR5@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aeB_g9mtwo6Y9sR5@black.igk.intel.com>
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF7DCFBC32A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d477c16-ba02-45bb-c6b6-08de9b82695e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11006099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: QSuE40s9v33bYlbq3kkJ04Gy/DPTuCqYaizLoyRGau0Clgd9nDtmKp9X8TkmzQSkGLP5eJOu5MvAbWRh7agybiSm4F35jg5HQE62ASik/5Om2lUkCH7hUaEyUE166qok5yTgPzyVP2LxpZqTVOMCfNj/iJl3hMLVDyPgaOowsHEsAHjKgnDRD+cTX090WDMPjuwxWRScGTMSUmLc+J/yra4YcOh+/W/ymVKbhQY1dqBQ1jtox7OQ755/l4UY+RJsHKmjOjRBaQoxjFghzczw4dh5gAX2BiXXgOu+F+doZO4s/5xb1c7VMJtsehlnoIrfSremwvNF3csnE//JMP86Bmf+TBrOYxRznB0SfX0FLkPzoyVpfieho95Gk/07Jd6VndIo7Vm2fvNY1pWF9hQefaR4byqshahKgcq1dMG+zVPFDX/PZWetfxJQdsfUJ2l19mWGOdtdNAXCrTjOb3xOk08YEZy5RhcAM4dGbl/2A9KhYTKOu5PhGX99eLYUoKJbenMStvCYGlIlCwO8j+PMsksnwKGJTJLLGR0OGwNoFBZVgy6rfxHNxQ7RI5RZq3rYQarlA+jfDlzK0BxgaURXPsS8+7nFIM31+zsU0GRhjz4KSRboZyN/Eq3p369drUEIh3G0OjrG+8prEKQZ0nH/5TJoRPYkzfQg+JEv9O0f3CuI/Ud02HUK/mS1eTu/KRkjEbs6gQSlUEPMHhwy4KLX+PI5Vbbf5uZfmvR6SALTOq0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11006099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUmbUsIYPHu+tZKpaLuz5usOjMAbyB/KrBHbrdeEUG2/aNZv/NaKp8LXVHOw?=
 =?us-ascii?Q?ukD8XcrZTFZtFhpxtgC65fpaeap7+3XN1899tpzF+YL37yaVnY1cjJffJzXN?=
 =?us-ascii?Q?K0vpTxD4qi5vKn/Q0j3iwXEaFHqNnD1XfpxNa61p9uhhD+i+76jQhIVp3WBf?=
 =?us-ascii?Q?cFdJCckIDoKDmQyCgUK719qsClbvb3aL9CH2iQ44b7gN6S9U3/YK9OWAaoSt?=
 =?us-ascii?Q?pORz2qOFrXf+uIydu6xlmVwDHuOvjHBRwjfDos/2YBdb2rvmprNJ+BWHHFNB?=
 =?us-ascii?Q?iezfwx9QgJpmHj5Q0oo+UIRS1xcDoIUcNtznvctJpe/pOUT1YeZcoASlpCQg?=
 =?us-ascii?Q?6ElJS8cp/ZZKThFSA7JT5XNvd00R+m0Jb+nWN04PdcPMvW2+198Z4G/Pg7K+?=
 =?us-ascii?Q?oE0/5YdlUBeY00VtTbPL39d+bp4L1R5E9B9jMI9kim5BDBuqEZhRQBfMrWLv?=
 =?us-ascii?Q?5/Y5+YISMvcU/Sr18JSauDm+NjExy0whN55V3NpSe29MlxrR9D/PMZtfAblr?=
 =?us-ascii?Q?UqharlG3MYfYFvTsHVWfy8ToRjZxvNO4LdAJV4dJG1S/Wf0p4TssWC5NMF4Q?=
 =?us-ascii?Q?hBw6o1Wbi4yo6SyTyUKVXkZl9D7Q9JSxKLcKx6aZC7cvh5Rm5f1/cxg6YLcO?=
 =?us-ascii?Q?gPDTkN8MfnrrVom8un5X7CVTZpokUzipG607LIrKYwzZNT6s96VUFxKplNHG?=
 =?us-ascii?Q?s3cc9w+XNzhz9uIAzGFgsPxI2rGd+t4r0mdlfOoTeLc9eEyLqb/AYn3zQDxP?=
 =?us-ascii?Q?w2cpohJTpahBgFccHUMYldEH1upZYj0hkMjfCORAeqcG8P1YT5Gg44/fNCtO?=
 =?us-ascii?Q?CF7gSqJv0VOXxokoXmdHCp661O8PQIqRj9optYYWh724UuKn+aHjdFNFYhau?=
 =?us-ascii?Q?Wk09RUaHZLiNfGEtaS2bdk+gyMjAWajY0V9Ca7YTbMPcd0foUb0JKpCUXSJU?=
 =?us-ascii?Q?OSRh+D4BlRu2Plqn0bP+FEYOycYAHwp40HNYfStadV0V91b/tGrQNTj7iHKu?=
 =?us-ascii?Q?mAuLvGNd5DAmsUDjHNx7ILhPaZI4DUtCDRVGelFQKphc29f3IYNv3ptKA7GN?=
 =?us-ascii?Q?s4ULrdbDrL33mFCh6qCZuxj3KE1Em+2QmS5NnhtO4uGKr3kYc4s9v225l472?=
 =?us-ascii?Q?OYHURGXSQD4PXY2uOeC+nSJ8lBvGz58k9FZtOGib0/tRcen1KAxgYkW/mOYo?=
 =?us-ascii?Q?3/0tjUZkuUC8l/ffOrElAxSjAyO4pgps8KNEc3VdOWSed5+MjjB7z9+VkNHr?=
 =?us-ascii?Q?/zSC/y52EbxWemsN8KlNR85S7Qx6o+1CPQUdJlqs10c+s8107YcpSTsK3E1o?=
 =?us-ascii?Q?V7aZt/NTlhM/UTxuJTIfaIZqqn5O3hLoNTsYR5bNWkll5saxJal6zlSZ9cHN?=
 =?us-ascii?Q?gixmBV9iZANU2i26xYmlslykgdgsZ/dmF/MiuntmfKGSzwtC3AXk5XhxVGn/?=
 =?us-ascii?Q?IQ0BOI/78YiMU4d5Tg8pT72rPTXY7ykp8bVYb2yO+Krju1u9wlCN/SS5Gdb6?=
 =?us-ascii?Q?xHwiq95wOnxpzZqANMstmDnO3bjG2tFlGwtNKAyMkXZmCkhvh6hNXQqRTyF7?=
 =?us-ascii?Q?RXmquWQmkaNhYH16amN3NixU/Y7NUSzd8CFL1BbAg/YlADxeCwTNDfYl1dJM?=
 =?us-ascii?Q?Ub35gdC6jmB9n8SOILX2TmOFVbq58DTqkHoyEZQ2LuvWypNh3VbSTqO8HAAQ?=
 =?us-ascii?Q?SkRVu1Z1lltrJYt/ErfAgtjBk4IzHgxstrgDiMrzhVWhWzzC/2/lMQiLaKKt?=
 =?us-ascii?Q?0bv+TtmTIA=3D=3D?=
X-Exchange-RoutingPolicyChecked: RWWCnyrgEqsJUK61xmgleaTgIag9PVkptdX8B3axJm5QIJTHXHn7tLn7dyf77fXFy/GlHnUQE0GDVVZCKoBgXVnoqUdElekKkAkBqSdOwvxiFTl5wuWZ5AIX4i29bWCtKwIICPtaWh7Mop4jit3ntaZD9wi9OlHh25PYW1mNknNAl2hZjhOOQ5Cc/O9S1I6V894ocXdC2/Pt/Ga2n7Aw1+07dGyHNJk7g9eZ+tMLY0AdHEcHlOFFeW36H5vhhUvqlfP4HmIEqP2Gqq+x596yCZnUwh7S+tuWAEgspzprc2GtifqzH9O9j6Qrqj2C0D3dC+DuUWGoeIjZ+AKM+PrM8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d477c16-ba02-45bb-c6b6-08de9b82695e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:35:55.0725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tty1yple4oOie+56iA+BgZsfRSP0vOWpzoGzgt6DAAIMWqMgGcYzuqg2mddToSxXGufMX+DFHRGoXzbf3ZzWdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7DCFBC32A
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

On Thu, Apr 16, 2026 at 08:19:47AM +0200, Raag Jadav wrote:
> On Wed, Apr 15, 2026 at 08:47:50AM -0700, Daniele Ceraolo Spurio wrote:
> > On 4/6/2026 7:07 AM, Raag Jadav wrote:
> > > Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
> > > support in xe driver. This is ofcourse a half baked implementation and
> > > only limited to re-initializing GT. This needs to be extended for a lot
> > > of different components which I've skipped here for my lack of competence,
> > > so feel free to join in and support them.
> > 
> > I'm jumping in to review a bit late, sorry for that.
> 
> Thank you.
> 
> > I think we need a comment (both here and in code) to detail exactly what we
> > expect to happen around the FLR (or let me know if it's already somewhere
> > because I couldn't spot it). Which objects are expected to survive, which
> > ones do we need to recover or discard (and why)?
> > I'll sprinkle a few question in the relevant patches.
> 
> Yeah, there's not much of internal documentation from software POV either.
> I'm just making this up as I go along.
> 

Completely valid design flow...

But +1 to Daniele's suggestion - once we land on a design, let's write it
down somewhere in comments / kernel doc.

Matt 

> Raag
> 
> > > PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
> > > a spin and let me know if any regressions.
> > > 
> > > Trigger it with:
> > > 
> > > $ echo 1 > /sys/bus/pci/devices/<BDF>/reset
> > > 
> > > v2: Re-initialize migrate context (Matthew Brost)
> > >      Add kernel doc (Matthew Brost)
> > >      Spell out Function Level Reset (Jani)
> > > 
> > > v3: Cancel in-flight jobs before FLR
> > > 
> > > v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> > > 
> > > v5: Re-initialize kernel queues through submission backend (Matthew Brost)
> > >      Prevent PM ref leak for wedged device (Matthew Brost)
> > > 
> > > Raag Jadav (9):
> > >    drm/xe/uc_fw: Allow re-initializing firmware
> > >    drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
> > >    drm/xe/gt: Introduce FLR helpers
> > >    drm/xe/irq: Introduce xe_irq_disable()
> > >    drm/xe: Introduce xe_device_assert_lmem_ready()
> > >    drm/xe/bo_evict: Introduce xe_bo_restore_map()
> > >    drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
> > >    drm/xe/migrate: Introduce xe_migrate_reinit()
> > >    drm/xe/pci: Introduce PCIe FLR
> > > 
> > >   drivers/gpu/drm/xe/Makefile              |   1 +
> > >   drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
> > >   drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
> > >   drivers/gpu/drm/xe/xe_device.c           |  10 +-
> > >   drivers/gpu/drm/xe/xe_device.h           |   1 +
> > >   drivers/gpu/drm/xe/xe_device_types.h     |   3 +
> > >   drivers/gpu/drm/xe/xe_exec_queue.c       |  37 +++++-
> > >   drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> > >   drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
> > >   drivers/gpu/drm/xe/xe_gsc.c              |  14 ++
> > >   drivers/gpu/drm/xe/xe_gsc.h              |   1 +
> > >   drivers/gpu/drm/xe/xe_gt.c               |  47 +++++++
> > >   drivers/gpu/drm/xe/xe_gt.h               |   2 +
> > >   drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
> > >   drivers/gpu/drm/xe/xe_guc.c              |  29 ++++
> > >   drivers/gpu/drm/xe/xe_guc.h              |   2 +
> > >   drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
> > >   drivers/gpu/drm/xe/xe_huc.c              |  14 ++
> > >   drivers/gpu/drm/xe/xe_huc.h              |   1 +
> > >   drivers/gpu/drm/xe/xe_irq.c              |  13 +-
> > >   drivers/gpu/drm/xe/xe_irq.h              |   1 +
> > >   drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
> > >   drivers/gpu/drm/xe/xe_lrc.h              |   2 +
> > >   drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
> > >   drivers/gpu/drm/xe/xe_migrate.h          |   1 +
> > >   drivers/gpu/drm/xe/xe_pci.c              |   1 +
> > >   drivers/gpu/drm/xe/xe_pci.h              |   2 +
> > >   drivers/gpu/drm/xe/xe_pci_err.c          | 160 +++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_uc.c               |  37 ++++++
> > >   drivers/gpu/drm/xe/xe_uc.h               |   2 +
> > >   drivers/gpu/drm/xe/xe_uc_fw.c            |  39 +++++-
> > >   drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
> > >   33 files changed, 510 insertions(+), 21 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > > 
> > 
