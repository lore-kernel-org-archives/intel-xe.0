Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFBDC2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 20:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCB810E467;
	Fri,  7 Aug 2026 20:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPMFFLGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FCD10E467
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 20:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786134528; x=1817670528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iC+wiXRUlWT9EBNl8msHbg++WGWe96hCMoh7lSSqmXU=;
 b=DPMFFLGGBntrGnjZmXF5GXjR1Qv4aN1e/zoSIdBDC9lgmPujPS6hlJ4c
 OcDyZoXPiHsUJHankIvMRlQH3Fd8/rE8K4trETXcQZ6O+5+4iM80AkGbW
 otfdpMLpDdMOK1tiRjTFa4HNwEnVuh8PnSA4f2NAMwukMAk2DZAnWweJ7
 HAkNyxmCsSs221TCYZGD3+t+bAkB+HnGuViYqM7wwv1hfxPfvam439LA5
 LEanb0BV5PSZGeGOMScqZ+uakelAgQ7LvufgpMWi2BES/TGS6YqzPOKEa
 XyqLhKrnFNMAZ4fllf4XOQkiBor4rj772aZ/C/AvEylfTvR2w2a1G8vFd Q==;
X-CSE-ConnectionGUID: gGut7nGjQGOXX6FN0xKmxA==
X-CSE-MsgGUID: ZMAN157TQlePzZ3tDEaMiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97102746"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97102746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 13:28:47 -0700
X-CSE-ConnectionGUID: XPX33nYwQ9e4pjfqIBV4eg==
X-CSE-MsgGUID: T657nBwgTRmeUQCMarsg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="262529770"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 13:28:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 13:28:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 13:28:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 13:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqVT+TpildbYtV2at4NywidNZ3YzAmwapuB3wB1dn/FSDc5H7T5yF3Y1fezoK5D2oQRxzTHv+Ugo7dVsFeXNsK5YAUKRsZw9JO+A5C6vKeJ0i1yvuUIjKCOrn3SJfBad2Fz3+s50G7OD48vwot5dXw/CFoEQ1zOCKWZnZtwjErcfcTqKqcnJog0u5rJ39ftKS8/eSReO4U2OBd982gM40rSwMJJRs7Fxj4oOgMsg3LsYWjmRS8Z+eXZ5svUCtrEWk4EAnsTGk17dUjsG9lBihGmkBkTA5GdZjo1n6VtSFgRlw2XceRjVihoLQ7mJ34hbW8MBd2HRsNLX47H1q4N0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8tpN4VH4WtslwJnU5eBo7nbhrDjjxsS4OvEgTEQ2FY=;
 b=tRzWvYQAPwPwciJ3B7JAyQ/gcpYurHU+6DEZakF7VanmhXjwieAi/JKyybswE4xtVkDq5QsC+SeXtZEEkIqmPoB49S8LoM4hCiLwVk4eUx38/EALAvkc7yu4JA678po05NkVf9hB6CD69E/fLdVflL9V5JhopreOW7UWWeuiSpcJvMdmCFpSxKaAa+SJ9pCRvnqf6n4LL/1708zyakOT4g+KpsDlImqGiI1SN0DTiPkRHExSulyd73ME0BCTNBCCX5UbB61WaQlCI1R1Oj85jI00DsqSGLi2Y+E0UccVB0EgO38kOZC1KDnvToB2MjWmEzd+BEUENvU9lHVfvftrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 20:28:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 20:28:42 +0000
Date: Fri, 7 Aug 2026 13:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Message-ID: <anY/9434kWTatv4Y@gsse-cloud1.jf.intel.com>
References: <20260806033205.3858054-1-matthew.brost@intel.com>
 <68a4c12e90c7f3fc08a62a6de41c9bb26b38fc23.camel@intel.com>
 <anTdHVUUQ+P86IrR@gsse-cloud1.jf.intel.com>
 <a8ef91582b768a63a3f2b5528a2b5f093392a357.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8ef91582b768a63a3f2b5528a2b5f093392a357.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 85589025-8019-4244-cf3a-08def4c278ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: hzkeIpSpzvp1PIYebh/yOj4Bs/ijJn+7gbmbQNe/2uHL0Y6mQ2+x79Imyc1w6r+yWx2DxL0fJmIX76u5FiUHj3M4l8eJkUInFUwMLI848gNs1vMolG5Q5cPQgv/PpgEejlHjbl0k7NKm46gRVIwb7sl0VPptuUoL8Mnzdj9wIggvXcvCxlBP+FFNbRtnDjtK1kL8I/CpArVyNMbIE5b7oDJNmaT4drMPfR559mKUgQNrMnG0cpwa8CYJCFFVkZ1dxnHg+KGnte8tZftCLwfJm9qOkIv9AzFca17OxMg7+0oHlBM9LUO582E8cpJmJn4mqGpjpgtw/5ku8cdDt3hsl6oxG8tXN7of5mF3II9iMOxf3BXmOMz/Gz0yyiscIBQkU5nRmkvjQJTjYqYTCVmeP1t9wKaDslROHAXBK57u72QHXVIYhAzb7FXFzoW5Q3prMjI8epoEjZVZQUycb8C4pq1w/TfZKusipofKYUhp33lrtK0AN/CR/Tuv4as+qhTf6pIwi4mEUpwpPAANzB7LfCGcTXgZjuBVs5OuWE1MJKevJ+A3vRGyquhcijhRVLEQxoDZGXMYY+TI1Zs8QALMFaGazWeWw5X0tQX90KRokFh32y+jwNZxxkWNjNq9wzBAsicpGyQDD/NwEkD9yjPrFXZRnr9R6Zo6sdSrFUEFd74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p16vfR00xqetd1uy94n/b9tTjUV/eLZKr/Sp/oXHftETtK1m8LP0lhQ8nL?=
 =?iso-8859-1?Q?XwHZoSU56i0TiSgDkjM4KsttjP9JOpGO2SeEYtn97K1ooTeOitbYGys1tB?=
 =?iso-8859-1?Q?/h9UDBIeiFh5EIL/q8tR3gQwQOQsv6xxOYiAVrWoU8pna6KA/0Rfh4TzDU?=
 =?iso-8859-1?Q?GJfsm1AdGIl4sFF7bdYXP7E0AfgpmPgzV3rkk2XIw2tZgQy09VQLLEqeYJ?=
 =?iso-8859-1?Q?ELMDuszT0DbEbUVj8AdMhtdWyyXCld8GOCC82C0l5uXHXVeJCzwhbX8xbx?=
 =?iso-8859-1?Q?GDh4WTGqjx+Fat59CPwMt4nnWQr3Az9x1ffQCRTqndqyBeaRBr4xDnZ0Ta?=
 =?iso-8859-1?Q?Hrh6Zu5qMp9m5h15kq7z0drVn4aTh0beZSnSzEhwywZinh4DKe6+mhZF4f?=
 =?iso-8859-1?Q?W1EmUmUWG/aBhXBNXu3AMJUZ81oQo/cNcraz0/KXWev22ZZikHB4XC4Fj1?=
 =?iso-8859-1?Q?JefpstS97FecUvKATWbCIrj5ysT0ohzFi4Mps24ICul6th72cJUX7/i0S6?=
 =?iso-8859-1?Q?ywITIsCxTJoWatoXEKvZzhI+Dep4rNqzNyYOKKIJJK4KJsKD0yNWCpvLMS?=
 =?iso-8859-1?Q?Y6PJsWocFoGlQ1ShQKEEx5f3YZoyzlcvJUMmynh1CwimmzUBfmDPk49ke8?=
 =?iso-8859-1?Q?VsOwJLd+V9cjL7h7p72gAFMiCub/jez+3TyMohXxIPPAcRmE2ThhLVcMlt?=
 =?iso-8859-1?Q?nG9prZ66W+7ZmSeYL8MkyUzTYCQWIQmu+4JyXdmGxkSstvkxNq5tEQ52+V?=
 =?iso-8859-1?Q?SyPCObr5ovIrM8T7A3L5G3fhsU/kUt7IAEzc9nprYHwG5xXwLBlTH2K8L3?=
 =?iso-8859-1?Q?/nwHAGq+ze4rt7MulPpNIjgQJQkwje1PccBtD8uzJSRfVNvHCUCX6wxkNK?=
 =?iso-8859-1?Q?N4JLKNQ/jLLHIUX3nJvy2OuVX7l2iEjFYD0M8U1FnMhdXKZVKH+CsIlT53?=
 =?iso-8859-1?Q?MGfJONByawoPGUrhtDtRHnfM7ck6VqdtkyViObEoasZyAwD0ppCbn9o8sb?=
 =?iso-8859-1?Q?OcZjdR6XoErxWwD5wF9jo1V9O4/OXtuVTT+5Ze0OJQ1pKAYK9GAV907RDz?=
 =?iso-8859-1?Q?zKhP9y4SJVzUmvpFVhgfh0d3arUnbQutMluSujGG0qfdI53YzmrBpLFPyd?=
 =?iso-8859-1?Q?wAor+IhhqBSVF12HzhqxvQUk1WZmEIfREHyaYrlfczjhbfuuok53M6Ska9?=
 =?iso-8859-1?Q?5c/QRefoBb7JSgsae9/XwFklmj2WHJy0x5CsTKgL5YXiRCb2v9MDyxM4xf?=
 =?iso-8859-1?Q?/3w/KIoybqgOAehhF1IhEMHSQHzuX6jB6QSuwM7zv7jSi6mYpRh6eLo44L?=
 =?iso-8859-1?Q?HhrNTDIFSRd+3n2/gl98FcyBv+Mrbp3ah7HfS32IkvLzaOsUhLB5GHSSKW?=
 =?iso-8859-1?Q?qJcddWJcT8caX1XEFQpUfyaqL4k5Sx8l5tlo6fSeVnoP7OLg+pYdn/mVFE?=
 =?iso-8859-1?Q?jliqbWU9OoRKvg42QQ2Mou6oBG7FEiU6zckgAa0u1q4RRQQwoQG/Ayue9a?=
 =?iso-8859-1?Q?WnVDPuUbYzTXHBJDgqQSTb3h+9snyuhjl0j7keBYLmwgzzK6AQx8NSCNBW?=
 =?iso-8859-1?Q?6YuSLBf1F2/uXwUgSacgcdKswp7Yw2WSM/xZqrn1f2pQ43gcKPkslIC3xo?=
 =?iso-8859-1?Q?jNSQBaQVKmwyFaapEpURiF68/RW2LHshn144GLqNPnKtGMqnMR4jpYbwR6?=
 =?iso-8859-1?Q?ioYCI7vKEy9FjqbrLHC5q0fUVrjDgNlb/oItiXTGb9POAwwZFSatA+Pwym?=
 =?iso-8859-1?Q?QQI0KgX5tZBgR4kA30DEXGmlvC7+MbGZwGzjfwWW5EN4b5BkrUnaiUSErR?=
 =?iso-8859-1?Q?0kI14PoIBmQoM7thY/L8JFp6fPvyUZs=3D?=
X-Exchange-RoutingPolicyChecked: OKBZR9X7fYgJbGJn3O/yJR4S8qMVdq8djQVxVF06OcCRHVt7ACLITI1tELCnkVfhwPvg2JeobuklaU2YBrM4zVkSL52jhBeZH65cnt5scBli6ANOTWPOITwhMYIEHDwGsk3lM8WVrig26tvvsonYXz02OMTV1wTcZeJ1HFkuXQ3MwoOBGJHFMno1Shpwvf1efA27PbRWferrMvdexUbH/f1e++Dx2QWj8WIhksEKF3ZReC3M6MYZAKjmAzvaawOM+5SDKVHIIqkKY9oXZN4jm4ATkfmpFCaDtsLyRAgWTuCZrwYx4EY9l1JTzhI0OfiitcZrKfJbwLUoWYShbwVYvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85589025-8019-4244-cf3a-08def4c278ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 20:28:42.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4Abi7lPulEn7vhrAv9eteoBk528y2B/oT+9z4AHJt2QA7CcVe1MJOldRv25h5FDklQX3MXCeb1fIvbM2a3zrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
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

On Fri, Aug 07, 2026 at 01:58:02PM -0600, Summers, Stuart wrote:
> On Thu, 2026-08-06 at 12:14 -0700, Matthew Brost wrote:
> > On Thu, Aug 06, 2026 at 01:04:28PM -0600, Summers, Stuart wrote:
> > > On Wed, 2026-08-05 at 20:32 -0700, Matthew Brost wrote:
> > > > If no exec queues from a VM are mapped on a GT, issuing a PPGTT
> > > > TLB
> > > > invalidation for that GT can require an rc6 wake which is
> > > > expensive.
> > > > 
> > > > Skip the media TLB invalidation when the VM has no exec queues
> > > > mapped on it. If TLB invalidations are already in-flight on that
> > > > GT
> > > > we can't break fence ordering, so issue a dummy GGTT invalidation
> > > > instead to maintain seqno ordering.
> > > > 
> > > > This optimization is particularly impactful for SVM workloads
> > > > which
> > > > may or may not use the media GT. Average TLB invalidation time
> > > > drops
> > > > from ~75us to ~18us in such benchmarks on certain BMG parts - the
> > > > improvement varies based on platform.
> > > 
> > > Still going through the code changes, but is there a chance we
> > > could
> > > deregister a context (so no queues exist), then mmap to invalidate,
> > > then register a new context and read stale data here? I think in
> > > the
> > > context invalidation case where we don't have queues we would
> > > normally
> > > send a full invalidation instead rather than just skipping it. That
> > > seems risky...
> > 
> > We don't call `xe_vm_remove_exec_queue()` until
> > `__xe_exec_queue_free()`. The latter is only called after all GuC
> > references are gone (i.e., deregistration has completed, or GuC state
> > has otherwise been torn down due to PM events or a GT reset).
> > Therefore,
> > there is no race where we accidentally fail to send a required TLB
> > invalidation. If anything, the opposite can happen: we may send an
> > unnecessary TLB invalidation.
> > 
> > We don't need to use the queue reference-counting trick here to
> > prevent
> > deregistration, because whether a queue is registered is immaterial
> > to
> > successful TLB invalidation. The interface invalidates an ASID rather
> > than the CTXID that the GuC tracks and requires a valid queue.
> 
> Ok.. so in the event that something like this does become required, the
> expectation is we'd add the required reference counts at that time?
>

The existing code always issues an ASID TLB invalidation, regardless of
whether any queues are attached, which is the a performance issue. This
change makes that scenario significantly less likely to occur.

If something changes that makes this approach unsafe, then we would need
to update the existing implementation as well, likely by adopting
something similar to what is proposed here, combined with a
reference-counting mechanism akin to the context TLB invalidation
scheme.

> I'm just a little worried we're overoptimising here and will cause some
> issues down the road.

CI is green. I wouldn't call this over-optimization. It's a structural
fix that correctly identifies work that can be skipped, which improves
performance across the board.

A TLB invalidation blocks the GuC from doing anything else, so avoiding
an unnecessary TLB invalidation allows the GuC to make forward progress
on other work. The RC6 case is where this really hurts. If a TLB
invalidation required to service a page fault takes 70 µs (compared to a
20 µs baseline) and the copy itself takes 90 µs, we've already lost a
significant amount of throughput. Likewise, if the shrinker is under
memory pressure, this invalidation adds 50 µs or so before the move
operation can proceed. Likewise if userspace wants to shrink is caches
via unbind, now unbinds take 50 µs longer. This ripple effect propagates
throughout the stack, and small wins like this add up over time.

It's also incredibly common for nothing to be mapped in the media GT. I
have a BMG part running with this display active and a number of WebGL
Chrome tabs open, yet there isn't a single exec queue open on the media
GT. In that scenario, the media GT is likely sitting in RC6. I think
anything Mesa or level0 based, won't have anything on the media GT (not
100% sure on this though).

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > So all of this is safe.
> > 
> > Matt 
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > ---
> > > > v2:
> > > >  - Make GT generic rather than just media GT (Thomas)
> > > >  - Fix accounting bug in empty vs non-empty (CI)
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 20 ++++++++++++++++++--
> > > >  drivers/gpu/drm/xe/xe_vm.c            | 12 ++----------
> > > >  2 files changed, 20 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > index 046d0655122f..ab04b87cf1c3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -205,11 +205,27 @@ static int send_tlb_inval_asid_ppgtt(struct
> > > > xe_tlb_inval *tlb_inval, u32 seqno,
> > > >                                      struct drm_suballoc *prl_sa)
> > > >  {
> > > >         struct xe_guc *guc = tlb_inval->private;
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +       struct xe_vm *vm;
> > > > +       int err, id = guc_to_gt(guc)->info.id;
> > > >  
> > > >         lockdep_assert_held(&tlb_inval->seqno_lock);
> > > >  
> > > > -       return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> > > > -                                  
> > > > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > > > prl_sa);
> > > > +       vm = xe_device_asid_to_vm(xe, asid);
> > > > +       if (IS_ERR(vm))
> > > > +               return PTR_ERR(vm);
> > > > +
> > > > +       down_read(&vm->exec_queues.lock);
> > > > +       if (!vm->exec_queues.count[id] &&
> > > > xe_tlb_inval_idle(tlb_inval))
> > > > +               err = -ECANCELED;
> > > > +       else
> > > > +               err = send_tlb_inval_ppgtt(guc, seqno, start,
> > > > end,
> > > > asid,
> > > > +                                         
> > > > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > > > +                                          prl_sa);
> > > > +       up_read(&vm->exec_queues.lock);
> > > > +       xe_vm_put(vm);
> > > > +
> > > > +       return err;
> > > >  }
> > > >  
> > > >  static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval
> > > > *tlb_inval,
> > > > u32 seqno,
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 9e0176861cb6..e2667200462c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -4946,8 +4946,7 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct
> > > > xe_vm *vm, uint64_t start, uint64_t r
> > > >   * @vm: The VM.
> > > >   * @q: The exec_queue
> > > >   *
> > > > - * Add exec queue to VM, skipped if the device does not have
> > > > context
> > > > based TLB
> > > > - * invalidations.
> > > > + * Add exec queue to VM.
> > > >   */
> > > >  void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > > > *q)
> > > >  {
> > > > @@ -4961,9 +4960,6 @@ void xe_vm_add_exec_queue(struct xe_vm *vm,
> > > > struct xe_exec_queue *q)
> > > >         xe_assert(xe, vm->xef);
> > > >         xe_assert(xe, vm == q->vm);
> > > >  
> > > > -       if (!xe->info.has_ctx_tlb_inval)
> > > > -               return;
> > > > -
> > > >         down_write(&vm->exec_queues.lock);
> > > >         list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q-
> > > > >gt-
> > > > > info.id]);
> > > >         ++vm->exec_queues.count[q->gt->info.id];
> > > > @@ -4975,14 +4971,10 @@ void xe_vm_add_exec_queue(struct xe_vm
> > > > *vm,
> > > > struct xe_exec_queue *q)
> > > >   * @vm: The VM.
> > > >   * @q: The exec_queue
> > > >   *
> > > > - * Remove exec queue from VM, skipped if the device does not
> > > > have
> > > > context based
> > > > - * TLB invalidations.
> > > > + * Remove exec queue from VM.
> > > >   */
> > > >  void xe_vm_remove_exec_queue(struct xe_vm *vm, struct
> > > > xe_exec_queue
> > > > *q)
> > > >  {
> > > > -       if (!vm->xe->info.has_ctx_tlb_inval)
> > > > -               return;
> > > > -
> > > >         down_write(&vm->exec_queues.lock);
> > > >         if (!list_empty(&q->vm_exec_queue_link)) {
> > > >                 list_del(&q->vm_exec_queue_link);
> > > 
> 
