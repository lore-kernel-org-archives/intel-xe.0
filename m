Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D8DD6AB1B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 00:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5529B10F36A;
	Fri,  3 Apr 2026 00:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOse9v7d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4AC10F36A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775177135; x=1806713135;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+b03NpMlgViaTZUDc1kDP0/dxXOpKy0fiFiTFvcOVAw=;
 b=cOse9v7dCzOe3dLrCbuk0GT7WqD1jy787un3KweCp83rW9t74AIDWwSl
 16zq0UG6N3F9tHbszfJqzTInFt16EQOyUknEwR7+SNUVJ5AvjIa5xgvLI
 N9X3Ehdq5PEBrO1IjBYDw/4xw6U4q9KBjRiln0niggGDsik02KqBWC0Op
 UleE5evM47ct51qKYSt0LDog3JNOlKwNAe/ATvCh7uCdllCsS84F3M9mi
 00RJi6r9n+vcfqNc9s9gduClCKf8u5Q9c8YzWa6WRmQvS5VSzmuFxW9q3
 UaPxfxzuATX/P57iKxfvND52T69r8/WnUsYHQncZngmq7MyAVDfNbhtjx Q==;
X-CSE-ConnectionGUID: p/TKA1h2QMK6QMzvR84Qfg==
X-CSE-MsgGUID: HoB3+jFvRKuKLgOZCYH0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75287145"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="75287145"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 17:45:34 -0700
X-CSE-ConnectionGUID: JkcxTEhWS5KUWc9KNT+xvg==
X-CSE-MsgGUID: ylvrGapOQOiuTa3f1oWgtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222280462"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 17:45:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 17:45:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 17:45:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 17:45:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb80aofctolnmMpKPB8gz5bKH8Us9OSGDn+XVA7Q1pAPklxRAMLEK4CXrKL93Q5rpgBS00HBuPsWywzbFrdxkIzLhj0R2yq3PGeEOTgnsK72GGJ3mtRuuXihSiaWWdHkvMosOtNFSxhrSDDJgdUmNAJ0kwYjIlHOsuG82KtWHHtcoB1NU9TnjVRLKTqwsnPJYJ2BhQXr2TfYjTtlAzxCNSRevkVphppeTjeERoVjkYdT+Vh+s62iUOt02gmsurSoAYZo7e3QbcV6UDTF4hdQiqAjcHTv4qzvop8kVIb8fdt3oqKoPirPPt6PsoQZ1pcOdgI93tLpTFgsfwb1jLksCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byo6k+7wgEDyNGL2Co9iYvsiCG5bsfzlx0Tl6kAECro=;
 b=VfomnGpKt+gGozKQgvi5b8H01t67zt+aGAEye0Ppa8unPtjQCTN7STMBtgKOYaGh/QNuIRpzswDrR83Dh3puGIq8LyDZQHvlj+qWu2pdUK3k7Tq2RQBi4qtaYE2hrG1KLU5UO3cYq9mU+w9d/1fyQm2tQjcE+snQBQRYV4lQALjNMfvU//RUAOlQvVph+5SFUWoA1yooOn0vtQyhfe0Q7znGNj966C4gBF20OSIPM1qyTB/bwOJ9rPmbqvWUxM+GjMqUZCneiLUM3WOsb+voOPVV5WONiskJc8TDzx2FPzIYyFmjLgA01KnQIgXo6wlH1Z1Qk+8hvjwNCeE9tr7kKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 00:45:24 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 00:45:23 +0000
Date: Thu, 2 Apr 2026 17:45:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Suppress reset log for destroyed queues
Message-ID: <ac8NoEXghE1XbfbE@gsse-cloud1.jf.intel.com>
References: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
 <ac7hhMY7sZWW3aT7@gsse-cloud1.jf.intel.com>
 <38565bd9-47e9-4727-aa00-f49962250fee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38565bd9-47e9-4727-aa00-f49962250fee@intel.com>
X-ClientProxiedBy: MW3PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:303:2a::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 0965dac8-0aac-46f0-a51c-08de911a4a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: GyiBvMJFaZfUwJ4A8PBdb20PvBmmfOYUa1cFDLzDzstPZQMfYBZeklWNCL5CKYPmQmnWDL3ZXAvA1DfowF6+MCTIPmRad7esxPlEKc/YVPvilsyugSUxhk11w7scwApLMSPsTsP5I5zW3DpyRNCIu3mSQZCBZCBuX+EIAJMuFMPBoQrXEYzGApalC/CgeIwW79cGmH82ZdKGtrF+c7NkK4b8ahqbrEGkyf5I9gmNbQn0KuHWJm18MadaV6MSgF3Wgvi5hBr8+S7PPQCtCkY5RnTfshCNdGwBF9ug2ORQA8fDU8ENA6q19QtAqU3pEBG8wkANzIb4mAPVUobrQsECQQbWq1M9R5+Y4+qbCpFZlb5SmN+oXPxX5GjFJKbvCXsrSp3KA8N/tzx/cJRzftJQ62/QKE5NpE15W2UKJp3PPu9h76+L6nh1DCJWZgHMbPL1q9SLk/Mmtit4dqibGJA5b34EYklBTq5AHh4ThQGL8qDlDSUhVFD7DIQcqg6H2Xe3/OWoejAHCYMKgsWn1btJNPJmY6XH0pgsXhqD2gnZLgBIMbLwtzdx8KpvHQChZPjzoqBcvG3vAMYdp61aSaSgohfsShFZoSNUhy88qz63+FO1v0oBSsIQf7upjCVlvacI/sn5xSHBMfmI3MoqxsJ8vNQjnCBiPeuqx5BgX/h4tInMtVdP0kUkvebUtLnPCNgfEGxX2MEqljvfeUDJkVYUfDu27CzHAUMpx17ubQQ0bKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGU3QjJYcDFLUmdnSmQ2WVVJK1BucTI4VmtBTTFhTXAzd1NNdEFmenpWV0Zn?=
 =?utf-8?B?bFM0anpTRFVDUDdLV3YyQ1BkTU5kR2xIRkloazBiR29QSG9FaXI1L1VYNG1W?=
 =?utf-8?B?dnA0TUVwREg4VUV0dXRTT3JhTWtCM0EzWGYyTG10cjdLRmU3UkF0ODZnQ3Qw?=
 =?utf-8?B?M21iTWsyVkM2QjVCRnp1a3NjS002RjZmL1ZJaUtPY0JYaWJieFI1bmFuV2Iw?=
 =?utf-8?B?dlUxN1l1eTQ5QmUraGhySkw3dkhZTWliRTZJc1hMU0V5RUpBVHZQa1k3MjlT?=
 =?utf-8?B?c1Faa0Z2Tms4R05JREtYRDlHRVBGeFNtV2E0aEFsTUUwTGNGWGF1TWx1eUlJ?=
 =?utf-8?B?VDJackRPVTNXN1RmbnJUYnVQUTZUbjNDQnlGamh3dmxEeWR6MlRBSTVHbjA4?=
 =?utf-8?B?cjEyQ1lGS2ZPOGNqMVI4QmJpbTJQTDlBckx3SFYwTnpmS3dmWm5Ocnk4alhw?=
 =?utf-8?B?MjJuRExiWmhoQzJIb0pZanpkQ01IK0VmN08va3ZNck5vZ3RzVFRsMzFwZzNX?=
 =?utf-8?B?ZFhEOEdiN2FYMnUxbHJ1dDNhT0dQSlhSRC9tcXJBKzdQVFNvUjlhM2VDeG40?=
 =?utf-8?B?VkwrU1JOYkMzTTBURUJRMllOQ0hISVpoUnkxMHkvVkFLR1p2QXcrQWNNNnFk?=
 =?utf-8?B?d3RldklKT0hKd3d1dUY4UEpEalJRYXQzSmRsMERxQWlyMlhGb1R4N1hTVTZB?=
 =?utf-8?B?TXJnOHllMFVydFo0M2pUV2gvRnI5WmM1OVRFNXN2R0JxUk5uRHNCUnQrRUhK?=
 =?utf-8?B?bDlJei9iTk05c3FPS1NIWFNnaHk3NGYxamt2MXNMNHNYdDg3L0NpLytXcVpv?=
 =?utf-8?B?YnFMeUU2TTg4NSs1eEdFcU4ySmtyLzdPaHVmcFNhelJMTGFiS1R4Z1FtUnJr?=
 =?utf-8?B?ZzQ3ZUFnRGFpVTN5UDhVeXRSdHBPMWs1WWNURGRsWHZWOXZ2eUdsSzVkWE5x?=
 =?utf-8?B?QWxadWVpdEMvUlBsOVpiNWljbFB3djFWT1JGVXdXRUVOUWZIWERaZG5MbFBh?=
 =?utf-8?B?bjhuemlZeU9hNG5xbXd4RGhKUllvWS9haVhoTk1EZFcwVFBZcDhjMWo1blZl?=
 =?utf-8?B?Mzl0bjRma1VYWSsxb2lvVEFBNzFObGl2Z05HYWpqOE1tdDFiL0RMOHFsSVl6?=
 =?utf-8?B?dVd3cVFXV0t2cGo4MDRNOTUvc0phOUhhM2dsRGVhSU4vSDRlSTAxL2NFYjlr?=
 =?utf-8?B?VTRyYmZoempIankzcEt3a2NLS3piUUF3ZTR1NDB6dkkxUVNWL3Y4OEhJMzRD?=
 =?utf-8?B?dFZNdk93TFJtVnlMK2xYa1RwZ1lVUUpsMU1rZmh5OFE0bkNhYnp1b1FFelVz?=
 =?utf-8?B?SUhKM0JadjdRYVRzaTY2bEVsOEpVamZFYkJEQ1pTRWFiN1AzTzlMS25CQVVR?=
 =?utf-8?B?dVd4d0RxdlYzS1I4RkEvS0RLVDVzZzBFeGNoeCtCaDJBeml6bHNzZkhDQ3Ja?=
 =?utf-8?B?KzhlSUJ4S3lxSVlZS1VyNVNyT0hCbUJvakhjenJ5TVNxaWY1TDRJejZLMzhj?=
 =?utf-8?B?VlVrRzJTb0NSVWZKL21sUldFSlpma1p0OXJoSEpFa3B1TStBaUVnZVVwK3VQ?=
 =?utf-8?B?NkVzdTlCK0RrclVRTjBzUnRBZEJYdDFyYlJITWxpbTEyZEZIWTl6OVRMTUFB?=
 =?utf-8?B?bWFJTUhETGUwbXNtaWlaelJPUGtESFU1RE1lNUVJVnlORVdhRkljR3IzY0xY?=
 =?utf-8?B?MU5sWXlFcmF3dWVWN0M3eHlUbXlXQkcxNVpvUFFhcVpEdVdiUFdsMjE0TE4v?=
 =?utf-8?B?ZFRFNVBWME5ic1ZpYmlTT01MeVpkaDRobW43TzcvaTVqRmRxRFJpSjZ3Y2ZF?=
 =?utf-8?B?cFBNUjAxZU9Ea0ZyR0hZbUhncXBZWWhOazF1Q1Z2SzRCQ3lidUN0T05zSDM5?=
 =?utf-8?B?S1VuUnUwZUFBczVVU1MveWZGbjNSRThkaUhpd2U4bHlGWjAxVjRZUnlBQmEw?=
 =?utf-8?B?UGM4VTl1MVZia0ZkSmtCL0ZVajJyODA3bEJsdjBtd2hSVDlGUEk5MDdtaUlT?=
 =?utf-8?B?TFZ3SkFuYjBsQXhveWFSTnRnbUZiNkl4V3hrOW96bDRaNkQ2NTNPUmc0VjhW?=
 =?utf-8?B?SkpNc1VXSlN4QUdHeDlaWUxuNmhYOVpLSDJnczgwMWhnMmFNMzdycUlOdDRL?=
 =?utf-8?B?UllPenpLS25FWkVLWXF5a1FQcFBpM2grUXE3MFNKVi9KMVBCY0tTYmZ1RWJL?=
 =?utf-8?B?V0tRQlA4TGl3UGJyTlNHS0xleXVaMHFIMUVXUzEydXR3NTY0SzNhY0JqUWVD?=
 =?utf-8?B?TFZoT2I3NFRVRWRHVGkyblFJR1IrazNZTnFmc21DTXdlaUJtNTlaQXE2N2FS?=
 =?utf-8?B?by9qc1FIeTAvRDVlN1pkWnJvaUxtSHRBYW9XdEd3U29zL1ZsMlVoakpTVjVv?=
 =?utf-8?Q?3IYeN3LCHqmGBUE0=3D?=
X-Exchange-RoutingPolicyChecked: WS4iXYU2r5EXM3bt4iqvTYj5WFdjhyLsyQK0mYEMbCqn7Ct14CBNGe69TqeKltVY5haigkrqeLR68iX+riPyH/qeL5c2MXakEha6ibPgkP/E4heuXsFRqeYF1P+JK0f7qmKnzTPt/vCG5/ZwuDslDkGix5eMFwFA0Me9w+o+ALRBmo9C5WnIhX/G0aSzKrnkhDmYY33QHx1i0gNWWUAPYejrSvsdYZkbz/xO+YwAjXgzIyYJqXTcyYlIUj5bSZZ3N45fVO1aLRAW8BpPoVyG0LXtKV9CjwfxF0klC10fXVmOttqieAzYC7DAI0Z+ACeTUyWuar1+6KADk3Vsc258Dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0965dac8-0aac-46f0-a51c-08de911a4a53
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 00:45:23.8929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YjwmV35nufK+qLhJLKwd3HIbfaQN2vO2PW/rQevZSWCj+BRnzjGOxYqY+aZfk6AiGQGWjsNOnk0sZXQPNQWcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

On Thu, Apr 02, 2026 at 03:51:36PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 4/2/2026 2:37 PM, Matthew Brost wrote:
> > On Thu, Apr 02, 2026 at 02:30:30PM -0700, Daniele Ceraolo Spurio wrote:
> > > When a queue is destroyed while still active on the HW (for example
> > > because the app owning it is exiting abruptly), the driver tells the GuC
> > > to preempt it off the HW immediately and to reset it if it doesn't
> > > preempt. This can cause a reset log to be printed to dmesg, which can
> > > be confusing to users as resets are commonly tied to errors, while in
> > > this case the reset is just done to speed up the cleanup.
> > > Given that a queue is only destroyed once all refs on it have been
> > > released (i.e., no one cares about it anymore), the log of it being
> > > reset is not useful and therefore we can simply suppress it to avoid
> > > confusion.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 10556156eaad..e6702bd99309 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >   	if (unlikely(!q))
> > >   		return -EPROTO;
> > > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> > > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> > > -		   atomic_read(&q->guc->state));
> > > +	if (!exec_queue_destroyed(q))
> > I think you want killed here—right? Destroyed is tied to the refcount,
> 
> I actually wanted destroyed here. I was thinking that a queue can be killed
> outside of the user control while the user is still using it (e.g. PXP
> queues are killed when the PXP session is invalidated), in which case it
> might be useful to keep the log.
> I have been pinged multiple times about engine reset logs on destroyed
> queues and I kind of got tired of having to explain that it was irrelevant,
> which is why I'd like to just suppress the log in that scenario. Maybe I can
> rework the commit message to be clearer on where I am coming from?

This was my mistake—I didn’t read your commit message closely enough.

However, destroyed can only be set once the queue is off the hardware
due to the reference counting between jobs and the queue (job hold a ref
to the queue). Note that disable_scheduling_deregister, which sets
set_exec_queue_destroyed, is called from __guc_exec_queue_process_msg_cleanup,
which only happens when the queue refcount reaches zero.

We can only reach a refcount of zero once all jobs have naturally
completed, or after we time out jobs, disable scheduling (a one-way
transition), and then signal the job fences.

So we should likely assert !destroyed in
xe_guc_exec_queue_reset_handler, since reaching that state afterward
really shouldn’t be possible.

Compare this to a user pressing Ctrl-C on an app (which sets kill). We
can trivially trigger this message while the queue is still on the GPU
because the TDR (immediated kicked) sets the preemption timeout to the
minimum value, disables scheduling, making an engine reset highly
likely. I think this is the case you’re trying to fix, unless I’m
misunderstanding the problem.

I haven't looked at the PXP cases so can't comment but will look in bit
if we to discuss further.

Matt

> 
> > whereas killed is tied to either a user closing an exec_queue or the DRM
> > render FD being closed. There may also be a multi-queue case that needs
> > slightly different logic. I forget the exact multi-queue teardown flow,
> > but IIRC it is slightly different. Niranjana would likely know that
> > offhand; otherwise, I’d have to reverse-engineer those flows again.
> 
> I'll check that out.
> 
> Thanks,
> Daniele
> 
> > 
> > Matt
> > 
> > > +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> > > +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> > > +			   atomic_read(&q->guc->state));
> > >   	trace_xe_exec_queue_reset(q);
> > > -- 
> > > 2.43.0
> > > 
> 
