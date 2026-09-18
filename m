Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF6AC982DE
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 17:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFA210E15E;
	Fri, 18 Sep 2026 17:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHHpHmD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7045610E215
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789754129; x=1821290129;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sQPYReT2JjPuecStYjrvbxPN/60I8FYWpQf9OLKg7yE=;
 b=GHHpHmD0zMQ1uqI1cJB597N6tjIQu13bjm0OCKPH2+t9dXXUk+YCd6k0
 9JfSs1NgQxnkqpRuhVdUINozIke98RiDU2guQqr/2nUWc42zF8xhOgBYA
 3lm3ExijgainRfTr2Lv/1JictkSL7Sao8872uvTUJYw+BmHQYYaUJRbiW
 NCRYKeRg8BlCL0s7ql6R/Ix2UNtLqrT7hTV7PvqoQ0JjLElQHoBLx0I4T
 q76RK8RZo0GNSIToEnB5AVgBcV3emNib+MegX/yKmjk/s5+G8qf5ZRbok
 ZNy/2MsOGyBx7RAkSTiRDA+ZC8YQ3USGSQsiD7L1ybeRWkx4/8XrcZACm A==;
X-CSE-ConnectionGUID: /2FwB62MToGuiWtFc3Vg5w==
X-CSE-MsgGUID: XtUbHlWqRKCiWieMDxkeTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89413270"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89413270"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 10:55:18 -0700
X-CSE-ConnectionGUID: PsvL+gZQS6aU6V7PJ6hNdw==
X-CSE-MsgGUID: 8fBMCENESb2ECRS68MN11A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2975533"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 10:55:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 10:55:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 10:55:18 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 10:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD7P9voZjTtfanhBMkb0R/6KiwD47002KTZQ54cn+OBGaD50mPaODSCquMOvJXwvJDk1Aw1LYHQlB8w5lTQy6Z5VP0Lxz3TCm+R47eZk7hCVioHUwkIO2zSpnTehGNmRCLmhhPlzB3A3GyFsJ+3OVedLaqz6HYxka8KdCJTqx5b+KkylSOTVMIdfPV+yoLvQvrhwhTgfcgl2pq9eXzIfJpxW6fQrNMPvzDxJGk0fK8ZkxUqaB/L7FGAPfnaAeItppr6xCZ2gk2RPDD7wFaQ+Li1D6Smym/w1Q93AF7NXCKeOJAqtCF/TdWqdO/5BDBWOZpn9Vi7k5XVAtZ+fb/qumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0phMxi03I3zRVHnzoudaB3k8vzpBRseCpZFNcB91g9o=;
 b=VN4IOFAdxpG6KP1Jrv7FJD/Dxv/iO9S+XiHIpoq4BjeAsbce4/SZ5ikU3hIe/4dzOUBSykW2/Pndqr3lNzb5FC7SsFytK9pae9nkoi1fi06YZ/0DIwYr5HnDoKMpVfdrZ+LTaejrgHd7lHAuUtwf9o1FV+26z1db8xc779pcIAcede8s5vV6bginkwNow7drQzSCn/CsE30tfzc55GTcDgX7O6KKs3uDRvW6D/iWZH5ZfkRcdKzMBYOM9cnPbTAI+WFEEQCGNo2x8KyMObtdt3a7zQbEvNngXDLd6OXjFaNZdiwtVRJLDrDu/KtprWUrQRXNx10PdOcchulnd7Kqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 17:55:14 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 17:55:14 +0000
Date: Fri, 18 Sep 2026 10:55:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Don't wedge shared engine on stale faults from
 torn-down VMs
Message-ID: <aq16/9tdIZDDqN5m@gsse-cloud1.jf.intel.com>
References: <20260911192300.1561972-2-sanjay.kumar.yadav@intel.com>
 <aqRoWdaMm1VH1OW0@gsse-cloud1.jf.intel.com>
 <878c1246-d4fe-466b-a109-8e3f617ac546@intel.com>
 <7aaa165f-e426-4e05-9811-9aa96a48314e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7aaa165f-e426-4e05-9811-9aa96a48314e@intel.com>
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: f2128104-e65c-4b66-1590-08df15adfda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|5023799004|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wnBg9amkK7VEION1eLxQ4i9tesvz2rFZp+cbo6ofZpPlHXEmLLk5xz5ZHOhx/0L06Z6V/UNFTLNysJo7ZAhtcEfUdt0BOlQIhWEE1w0KKKJ7d03a86KRd080PBRYmRxiD8EuuNKLpP9zB22+uhY1MgJil9GDQ8G/Xnl2nCAiRWKRRUeU6q6XZOxqmy2Y4jMSvaycK1Jlq/eB9DCVtE7MPbTrxZTaaXn1cTVEPwf0pHpa9uEb/dDdb8+7teBKnpEhu/4NzVxR/d6IrBtdyTwOXNAGMmbKvsYtNOARvr2xzWnYLsMkjYVKg6R9j1MXmeJKa8yaLXYjCkZtZsQVQ9Vq3gptLKWwt/FeNLOlzIAKZCc0KEevt1B2q5ZSZ0cln16OVOK1hpRJ/IJZrTTGXNuEGv4gqHyIQjpyUPjJmDlDEf+IP4mT7fyFWEe3MUJuwV7PTAIWDeK4m9SHUENhcPLXxlFNBacGfPCEjbqVY50xWXkVf9DYRnpefB3brzZj3q16Y54KRP57xQsDZDp5QChDTIRYnrPDigI/xLH2zgEoVUE/1eURg6MCbOEj/XJAmNv3PbFP6RkW6kwPH461WgbjT2OXDnIeyikXwQ+gY/eqc7I1bsf3/INLj+0KzLcJF9cw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WqbG0j/Vv5K84BiB4WXRtO3sAUcOxpplAlE9EmAjy8I6AU5nZx1GfFQBL1?=
 =?iso-8859-1?Q?QepAz83smL67d/l4EsL+AtTVvx0LmAcwc0ZuViO7z4jND6xutjaiYZTb3b?=
 =?iso-8859-1?Q?AR/H4M0MiIWNWKqoL7Pgdbp5tnw2HOr4hhU+g6ogbr4EtALWGJSVXLqSnh?=
 =?iso-8859-1?Q?em4yiu7MlDws1PjvXDRGE9mp1d5TROKFTqbzgUAIcCVTrAL5xa73OwSD7m?=
 =?iso-8859-1?Q?OhcGjKqFpvYadIQ8V0xizfQ2MkQgyMIY+oowmCJgSu42dwVf6805BcFDDd?=
 =?iso-8859-1?Q?JgPgckFoq2d28ihmH+etfol9RInUChl2DIz8IjOy22JzoKTXz76nenuiwF?=
 =?iso-8859-1?Q?lKKEHl8gmibwREbcKBYsGkpdM+8qnOimckC9ln6spaA0P0vwr5dAaRew6T?=
 =?iso-8859-1?Q?uMIOuuCqZ5+wmIfwOuknvkfQGWvBI574EdjpK7tVrB5q+hyTi1i+fhitB4?=
 =?iso-8859-1?Q?Sl4hpMhX4OxQlT/a9d2Aqas7WKknJm1KeXbOow7FvzVEu7HhoKY0ZHEgNS?=
 =?iso-8859-1?Q?mSKQgHW7tzkiPf8vcJfwx/ejbjpQwST48otOF1YSTzxIoRxKaBYsUBl7Q0?=
 =?iso-8859-1?Q?W+Za/2rxRuqRggO990V/OUCbDhwF8PEK4qYNU7AVFzWstqHcXpUn9nQtlh?=
 =?iso-8859-1?Q?u9H0CITicRCZ40frqvyjDjx7Lh/FH2VtkEwkT0X8Ta7jWDecssdWhprBLs?=
 =?iso-8859-1?Q?otRMGIQ8GxEewm+arUewY4tqXL+M7UHy37y6q2IeSBdxwwnZQZWK+lmFfE?=
 =?iso-8859-1?Q?qzcsB+5inmO+iTminCqNrILpzSzQM+d4b4zq2RfAWt9/8GlVSpqCaJdNyr?=
 =?iso-8859-1?Q?eXwGEvcKJqHFrQHLriu/dxRD7qFdAvFum9yzkeF6IhaGieHLDniqkqZuSz?=
 =?iso-8859-1?Q?oXDw9ix5dKoMKRf44chY2i3CR7npB5ztOKHslHqmfrDp4SYxIuhq+3SWp/?=
 =?iso-8859-1?Q?n/wdnAa3xY5fPyx2VPnXQxleelSi9/bpvQ1sJ1ChgHwsTSaB5xaFVpC3fH?=
 =?iso-8859-1?Q?46D7JblWatQvhp8mDnH7TLpFiE7hDt8h1Tg4kB8Lnk/pcGhTOQkRqqnyU9?=
 =?iso-8859-1?Q?q0Wgu8OFmr/EDYDsAdS/bNMmzYh6n4VJosuZnsmV9Sm2/8ad7Uqy2yixf2?=
 =?iso-8859-1?Q?ukS0zO7IQOJFPQ3kZ906zlyzULufH2Q9h4lhb1FCOH9MqZ33vsWIgF/nED?=
 =?iso-8859-1?Q?SNRGQ6roPbb61hKxMkTF9uKWCJaCoi25M9hG0uutPnW0QefiRlvhvCOJI2?=
 =?iso-8859-1?Q?t9bcfPuWk5j2WYsUHZkO92lOhY8YmJ4hMeUbZHaaMQa0jXTaFHnsh7DBVy?=
 =?iso-8859-1?Q?fN+0YjPbAss3Oi1tTW/h4KOz9vLO9Z6tSXnL/pHwMhCf+UHn7Fx459jhNV?=
 =?iso-8859-1?Q?Nv9/ZYjRCSCXyNNc5HCamIoBwjEZSy0JKOIpnqWJpvwCvgNswXSGrEHoen?=
 =?iso-8859-1?Q?phMBPSpA2pfn+bu9mQYGOOOIpBCHZa47K23ZSvDvAKCenbNVJJ4TtS/F6P?=
 =?iso-8859-1?Q?nOe5k6b5SQpzsmh7o/CThh7SBwoTISzGRtrKl+2sqwhnyDYO2PTMDn3LvZ?=
 =?iso-8859-1?Q?G809n47nDJeExI/N8dcITzMQdf5Je7Uq8TR8r0Po9gkuqRDzom7pZLt4DG?=
 =?iso-8859-1?Q?sesMZ/za2y+q4agRlxF/4LSFnAOImk7f9pFy2mI86hOgnk6fU4DVMAXE07?=
 =?iso-8859-1?Q?YUSDSDx5RgGyYU9pcCIUvDNYuLHSrcP7zxR81gWjW8nqP2VsBQh0dlt7zQ?=
 =?iso-8859-1?Q?VA1mQGIZcXH0umUxLwThqyi+eHqqvs2SdGDNBZCS8fdf8y+zzH81M51toi?=
 =?iso-8859-1?Q?6eOyjz6NkA=3D=3D?=
X-Exchange-RoutingPolicyChecked: jgglxbwQqbRNoOip/LBk55soddFdR5F8tjiC5CxAoqMgPPsfTwSO70rPV/3tnxxnlD7vnLu4KQYeRKN8EDfKhpd6hX1UQTsYg14TQS6jE2gSehrfnFBag6Jju0kIrJuAEG6rCGmLoWkvgSXbHuA/6VX/0SNdXrGbZfEFgnt53ta4ViXonyi8HXW315vf4tBqQn6YIX8VT620LX5PbLmSeub2jV7nwN8vCtfxqgGUtK0qAxsoOD/Qq6EffmaLOROp5aVx6sBk8hDaOPjZHKkBUYH3P8lCrbi0GixChnLZMoUvFdnxU4/BbUIlUoG3elUToSP+8hpidtwsIu5WLC2ShQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2128104-e65c-4b66-1590-08df15adfda0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:55:14.0132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nSkkRzF1VNVYS7X1Wyox8czYFv0XqlKTgxS9zyPCe/+Ticzd+6tvoOJcFkUFAww9Qg0a/5CLXSU2NUrcbPLZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
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

On Fri, Sep 18, 2026 at 10:45:24PM +0530, Yadav, Sanjay Kumar wrote:
> 
> On 14-09-2026 16:05, Yadav, Sanjay Kumar wrote:
> > 
> > On 12-09-2026 02:15, Matthew Brost wrote:
> > > On Sat, Sep 12, 2026 at 12:53:01AM +0530, Sanjay Yadav wrote:
> > > > A recoverable page fault generated by a process's completed migrate/BCS
> > > > work can arrive after that process's VM has been closed and its ASID
> > > > removed (abnormal exit while GPU work was in flight).
> > > > xe_pagefault_service() returned an error for such faults, which is
> > > > reported to the GuC/HW as an unsuccessful response. Repeated
> > > > unsuccessful responses eventually escalate to an engine memory CAT
> > > > error. Because the migrate/BCS engine is shared, that CAT error
> > > > wedges it for unrelated processes, which then hang on their own
> > > > copies.
> > > Yikes. Do you have a reproducer for this? I wouldn't expect this
> > > behavior from the hardware, as it appears to violate the expected
> > > process isolation contract.
> > Yes, there is a reproducer, "l0-abnormal-exit-repro", in GSD-13290 on
> > BMG. I have also attached the dmesg logs
> > in the GSD from the drm-tip kernel, as well as from the older 7.0
> > kernel, where the issue was originally reported.
> > > > Detect stale faults whose owning VM is closed or whose ASID no longer
> > > > maps to a fault-capable VM, and drain them instead of replying
> > > > unsuccessful.
> > > > 
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Stuart Summers <stuart.summers@intel.com>
> > > Fixes, CC stable if this is an issue.
> > sure
> > > 
> > > > Assisted-by: GitHub Copilot:claude-opus-4.8
> > > > Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pagefault.c | 22 +++++++++++++++++++---
> > > >   1 file changed, 19 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > index c82b8bc8bc70..2827652ab8a3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > @@ -238,8 +238,10 @@ static struct xe_vm
> > > > *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> > > >       vm = xa_load(&xe->usm.asid_to_vm, asid);
> > > >       if (vm && xe_vm_in_fault_mode(vm))
> > > >           xe_vm_get(vm);
> > > > -    else
> > > > +    else if (vm)
> > > >           vm = ERR_PTR(-EINVAL);
> > > > +    else
> > > > +        vm = ERR_PTR(-ENOENT);
> > > >       up_read(&xe->usm.lock);
> > > >         return vm;
> > > > @@ -260,13 +262,27 @@ static int xe_pagefault_service(struct
> > > > xe_pagefault *pf)
> > > >           return -EFAULT;
> > > >         vm = xe_pagefault_asid_to_vm(xe, asid);
> > > > -    if (IS_ERR(vm))
> > > > +    if (IS_ERR(vm)) {
> > > > +        if (PTR_ERR(vm) == -ENOENT) {
> > > > +            drm_info(&xe->drm,
> > > > +                 "xe_pf_debug: drain stale fault (no VM)
> > > > asid=%u addr=0x%llx\n",
> > > > +                 asid, pf->consumer.page_addr);
> > > > +            xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
> > > > +            xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
> > > > +            return 0;
> > > Won't the page walker hotspin on faults until the executing queue is
> > > descheduled from the hardware if we successfully acknowledge them? That
> > > doesn't seem ideal.
> > > 
> > > Matt
> > agree with your point
> > also with this patch[with_patch-752845-fix_run.txt attached in GSD] from
> > a 1.5h run (3,373 torn-down contexts)
> > 95% of ASIDs re-faulted exactly once before being descheduled, 0 CAT
> > errors, 0 hangs.
> > So the existing async teardown already deschedules the context within a
> > fault cycle or two.
> > 
> > can I move it to teardown wait for the ASIDs queues to deregister and
> > drain its pending faults
> > in xe_vm_close_and_put() before erasing the ASID, but that a larger
> > change. Happy to change either way.
> > -Sanjay
> 
> 
> Gentle ping
> 

We have actually discussed this quite a bit, and you are not the first
to complain about it. I agreed on an acceptable approach in this
thread [1], particularly in this comment [2].

I haven't had enough time to implement and fully test this solution, but
if you or anyone else wants to take over, my latest version [3] can be
used as a starting point. The idea would be to implement [2] on top of
it to serialize queue teardown before tearing down the page tables
(xe_vm_close).

Matt

[1] https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4
[2] https://patchwork.freedesktop.org/patch/732703/?series=168398&rev=4#comment_1349875
[3] https://patchwork.freedesktop.org/patch/748380/?series=168398&rev=6

> > > > +        }
> > > >           return PTR_ERR(vm);
> > > > +    }
> > > >         down_read(&vm->lock);
> > > >         if (xe_vm_is_closed(vm)) {
> > > > -        err = -ENOENT;
> > > > +        drm_info(&xe->drm,
> > > > +             "xe_pf_debug: drain stale fault (closed VM)
> > > > asid=%u addr=0x%llx\n",
> > > > +             asid, pf->consumer.page_addr);
> > > > +        xe_pagefault_set_start_addr(pf, pf->consumer.page_addr);
> > > > +        xe_pagefault_set_end_addr(pf, pf->consumer.page_addr);
> > > > +        err = 0;
> > > >           goto unlock_vm;
> > > >       }
> > > >   --
> > > > 2.52.0
> > > > 
