Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D43EC369C2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 01:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AA510E1F2;
	Fri, 18 Apr 2025 01:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQlUaV3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27A10E1F2
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 01:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744939006; x=1776475006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2wvncQUykwUalBEYAAmO8CkYnAVE6/hLmHCau8uVDvQ=;
 b=CQlUaV3LiHpiYwy548oWKKnhr20ymi4/fZRtDCeoWOu7xX/pm80B3Gl1
 22IhprB1ovRTNAXKdaRqGoLEDScGYJr1emHuB7eNmsQZPO+iJNkOMGulV
 6OjSmOXGXrebSgDCZW9LjV5ekPPQNbW1APP2kn13PdB01JObpoVnNE0+u
 GuoKlmdP9aa9Oayujgt8Y3HKERiFO+uBYeiU7ZIZaBFngklS1m8y+uWgm
 KAANlcApb3mbAac6vnuH6yrOZUZJrYa9uJaeg+yGutkUC7fUu5x292qjB
 Mvtj3G3bpgCg+Fim3JR43Z/qoMk581hZo/ps8DXV/Aihb2btvG40J8roM Q==;
X-CSE-ConnectionGUID: 6CpfYnTuSuWb7GJko5ofsQ==
X-CSE-MsgGUID: ZqIYhwhASX+rrPPEp3P/Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57938379"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57938379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 18:16:45 -0700
X-CSE-ConnectionGUID: dVW9fB52SoqrecChhn9SOg==
X-CSE-MsgGUID: 19SjHtaLSlKdcHXgT3QY9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135086578"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 18:16:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 18:16:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 18:16:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 18:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX5vv/HJkFG+dvJXBbG9tmOIPgF2AARKjwwOlM1TERa2bN0W7QF3ZWVBp9VgIW9WFtxX8JN+t8nFl6ZWum8lI2Za5zFkBJjoqDN5m9bILaZyuTK+Pc/KOUR6frfSCetPfHNganIzkZxDkvCXe6kW8ZdqOVHnGmYibOWIuTC3zCiZj5JgA0JjCoi3/ivRz5y1Q7/vygBuOrgjaxSf7Q8h4IUUzW+AO6JdYhaZxAtoWXr4iAkUb4uRAAz+IdKyzZ72zb1heDFojgk5kmrbQbmdZNt1h4rr+vEq4Uo9OLHQaHYvudlpmA5I4QcJSWBnoxaTINPJbQjofTkoobpbgNpGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wvncQUykwUalBEYAAmO8CkYnAVE6/hLmHCau8uVDvQ=;
 b=j+O1HkaEXuqOM81TWq5+3HIZZsptgCVGdRWZJzSprCJ85xXpMn///SYdpdxALrLyhpm2k7n9BaK8o2J9d3vAB5Qn109NdrTt4z6kWCssWypurO83A0Iz/QVpXspMT/F/dBONmovzjLhZUNzHeBoNI/B2tgSGwYQjLOXblsUgx4WYnDbwyubNmcXPinWTUt00tY7U6L4I02mAMr9zjOaq8CDDB9norfKl46BK/Od0/oA6+w//aRLVr8JdwMacFGQ+fTMNr92v2LVaJpTwMmI0dH2jLC4CwO2emFf0MEGZcRj7RgQRAgxfID7lINtoHwRRzNbnGzdLroAAJ0H+RvnvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.29; Fri, 18 Apr
 2025 01:16:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 01:16:41 +0000
Date: Thu, 17 Apr 2025 20:16:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <kenneth@whitecape.org>,
 <fei.yang@intel.com>
Subject: Re: [PATCH v2] Revert "drm/xe: enable lite restore"
Message-ID: <fmhag6wpw5pln4c42mxuaic4i7s6kphhimiw5lxeli5up6gvkg@2ifvouc35dal>
References: <20250417235756.456283-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250417235756.456283-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW2PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:907:1::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: aea87132-1c33-4847-fb74-08dd7e16ace5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wd/juvUQE8LtBfMS4MjjVo3pBdofb2fOePpHg1EMUbkxy8vdm2lZ7Kpx+fmM?=
 =?us-ascii?Q?fRn0PuSwugjbAIjBNNmOeOXqDmxX+TbL3kmu3ihCjpiU8DRd3IcYX5BrBNsh?=
 =?us-ascii?Q?8FQ5hxbOZBtkHLmvFchfeyN8omXgEdpouwwQjeySAp/r12tAriEj/Uo+iFvw?=
 =?us-ascii?Q?L2lbKET00Q9ZVjLC68zFsQr9etqmhdLUB09IwIqXFMn4EMt6n8qum7fhXt/3?=
 =?us-ascii?Q?YzXzeq56yPdyYScvhPp10vFwspf7DDNXfVakVFjTHWNxiW7Ih4I8EhrzLa9w?=
 =?us-ascii?Q?nyGzIBr6rWpiCZ5UtBLcIgYvW7Wl9DsE0ysUVu6lnPkvGGWznYzUnLNAgu81?=
 =?us-ascii?Q?Eq9hBhgzXwAZfUn2tIQzdCe+GhDOcQvY62xOYZKEQBZA1M+aR6XY1qStv99p?=
 =?us-ascii?Q?IfJrmdkks57035dxWrJNq/KX0s5HN2yBiGrJftTLWa/FcbGGbkYBTY/jfqyo?=
 =?us-ascii?Q?35tsJKkUywcHOwHmt82kOespBoigZM8fWFxXHmDtSHdyBBJ9uG4H6kQ2VUDL?=
 =?us-ascii?Q?gE1fp4IrITYA1lCois5hqphLaT8y9F9O5hJ7kGbf5VYwPGlQy8Fkuf3kKO8V?=
 =?us-ascii?Q?NX8rCjtab5ZsoLUvFb5uDyOUKPP267GDUHN4xsSrcuwWpsmAiqGThMPvECEG?=
 =?us-ascii?Q?QhH4VHrZORCFryKunQlLvmiy2nyW3XhMbnjU8po/puW61C19x4AERu812q1D?=
 =?us-ascii?Q?UtE9tKT+zPMsPaJ6dDPMEKBMozlkVx5fBAB/ARCtJp9z+GQb1SfDVD/tIx9D?=
 =?us-ascii?Q?BFLNSjUp8xSENsdXNouqzvZ6E2YSQoNSAEpZK3If1SexX/ZAiC4oME3BoYH4?=
 =?us-ascii?Q?ynpI7vFZwYwUFZ8VV2V19+j0S45JCgGtsGg3s+PxwevOXyn3O9fsiAUYj47E?=
 =?us-ascii?Q?VE3DVrWsF09BlDRkOkqhSb8cj58Rrq5mkKci9YSySX+ruOnDUo/YNXMXitbZ?=
 =?us-ascii?Q?t3d0uGIjoBskUx3Dz9tiWww8GBHnnusxBnPsx29PXR/qDnjeCc0fpz34oiSX?=
 =?us-ascii?Q?PVCXaFPLs1tAweD33CsWRrV5Op1Lz4mAkkkY6RwiUKLHdb+05WLgreR039yN?=
 =?us-ascii?Q?YDy1PZapjWTJasu0ZRYMwElZg8teeQ9Ob1B4if9Fcryr9IrgwHyUkMxactQa?=
 =?us-ascii?Q?jeamEvAPGHwPM4zRPK91fNPE+3meCadC4Lovqx3zL+M6qETfz2yTYgui8mH8?=
 =?us-ascii?Q?2eFp3bqkUXvFh1p5l3/HeqnPneFGeMmitQVQnocVgqfN/S32BV7ISIiabn8H?=
 =?us-ascii?Q?B9YlLyQxwKBUPhOM5BzE3PZWssHeZvOTa5xUX+CjQCAUx5Gz7tgF+04YGi2u?=
 =?us-ascii?Q?3ccA3lDA96j6AXl38MxNPmwaxtLGkDpfE6YQvn8+lrjkzQORFUgqgZu4yHNz?=
 =?us-ascii?Q?F74sjEU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XyRnr2/HHdWStdNR9saa9GR04Q6AU9TdyqagROkQ7fKB6bLdepYVMxv732Fd?=
 =?us-ascii?Q?CCldZt+PmuP8FVvpg0j+revxAKlqCFg6p7NcOHGdJABzVRzNJ+74xxy1wULB?=
 =?us-ascii?Q?9T12rzJk7RXw8j3L4qp+OU0yASY0qPQmkNHcmbDQC0wJEMbRKYdI9TBTvk/v?=
 =?us-ascii?Q?DC8zVpTqxEPNQU15hz96MRII/5mtuwed9tBY1DCgo6W711lkbUzTg8cL8W6r?=
 =?us-ascii?Q?YnyxOyYwA6jG4YqEvx4Fvi+7tUg08kAvBSzhjXiCDzLDB7o2BQybGJP0dx/Y?=
 =?us-ascii?Q?ZNAkG00Q956t7bgchfHTnTpMfNMgc8T40e/2kvfVn1nPFuY54cJvkMMyBT5C?=
 =?us-ascii?Q?ClXl7cmnq6tey2Kr/xLMYEFFuZe/zWfAXt8c95cMjh9ge5a4qZG5j/yVmlo2?=
 =?us-ascii?Q?/TMmhAQRdOnaR7yZ7ugaBOk6pow58z4xGLpkMgAtWxVkavEYXOrNwheTL21f?=
 =?us-ascii?Q?tTF64DdQpdG09E800xUGkzVbp/OsgQF/DoACdDZIeOvrklXUYbiWz2p4A2TV?=
 =?us-ascii?Q?53DNvq1xvwWHBVjqXI07G/i8bm+VKWDAIfEyHGRNAPWcrYhxBi+2vMAYbQgI?=
 =?us-ascii?Q?2tFs1cUak3XiVLMJgXnbrzBd1Dt6mRQp/OgpWSWbJKemygqdCZngc06vP/7e?=
 =?us-ascii?Q?JTqqnincvVwDaNiHvZHPKWyWIW8jTSMdB8aEW7B0UutljOea9Y/8ulFHBVXG?=
 =?us-ascii?Q?5v668+p247rwfK3ODiRJkd7RMHDLGGGlLNAxXk8WDwDA5wqbPDrtAbaqOCOm?=
 =?us-ascii?Q?6iTW8wHx41CxS59XfqlkcAAHtuagfMIxOx421AvxxpXQSXaA6mFD0S9dpfno?=
 =?us-ascii?Q?QMptdPKsD6a/0F2rkKB29OsE3MHyPHv2oDub9TW4Ae+HmNrdxa+sCK5tjTG2?=
 =?us-ascii?Q?353TZVsMbSGVSqEinHOUTeSe10CWYSXl81lo4+ombLBFlBXqFJXGwY0jZi3q?=
 =?us-ascii?Q?z91t4S34g7oI3eAKLpdTAAmztCu1JAWDA2K8tCLdBDfePXrUAdDAu2CL6R9o?=
 =?us-ascii?Q?L8ov+7xWJlO5+PkqGbW/ZtoFrJFTyv6yrs3+/Rt3J3KBMaKjgAc9nBCcsrRX?=
 =?us-ascii?Q?3pEv7kAHYKp2RG98Nx4ioPKtwEpDeaoURYHWkJESY5wvP/PY5MzlkW2Vr9Gu?=
 =?us-ascii?Q?le03FoDF1mWbUWGfMXf2oVzUv4foxtcDuKDSZ4a4jKlLKuUuFY1mNut+5Z2K?=
 =?us-ascii?Q?fyJzdYtBQDQlOAKcS4FUye/ehzxtt0qUMJcqIpvhR9YlyW+gUwjhJ9H0Xmv1?=
 =?us-ascii?Q?VDsKaMLDZl3NHHm3gqEZlepC/6V3feMz/2ZMfEDzuZQulBN1KVp20I6BDiGo?=
 =?us-ascii?Q?dPJuK2ehE2Qf/+bOus3gh7BQWiO989PhPJIDd7rR2kLxwHUfnMJseINraYb3?=
 =?us-ascii?Q?/2B1wUgltC6LoRUtaOYtkH0cw6vPDndgdy9+tlAyj8mg9fSp+mQfPUMcl7mM?=
 =?us-ascii?Q?hJDJ4TfUkBvxVBCEOMdcglu+RYDh0h0ICaE/f52sVljRS2jVcrxUZ4X0N4bZ?=
 =?us-ascii?Q?EQoTy8J5K5cKrVp56EVrZux7NR06LMGqW3OPTlgw0J5Z0FtnGrldxFEUGMv4?=
 =?us-ascii?Q?PUEf5XLQbpSv4aiBshilK4OXYGaPfk03pYhyBa3FfmVfqLRONojzpEQikPYO?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aea87132-1c33-4847-fb74-08dd7e16ace5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 01:16:41.3725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy2Ivf/CW2S4j3R7pRPRhZZsSbF7chOvCU6N0jkZxXfd8iKgjncjhRth7I6xWeIR8QulAc4nEBdPoQg1EwsmYqsU/bOA0oGBrtllVAYgH7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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

On Thu, Apr 17, 2025 at 04:57:56PM -0700, Umesh Nerlige Ramappa wrote:
>Lite restore is breaking some functionality in MangoHud. While lite
>restore is certainly preferable, it is throwing off per context
>utilization calculations that rely on the context switching out. The
>utilization counters are used by MangoHud to overlay GPU utilization on
>screen.
>
>Hold off on enabling lite restore until we find a better way to
>accommodate lite restore with per context utilization counters.
>
>v2: checkpatch issues fixed
>
>This reverts commit 6ef3bb60557d5e7f5af442c8c9ef0a9190bf3d23.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

This seems to be good enough for a palliative measure for the current
kernel release (and past releases that contains that commit: v6.13.y and
v6.14.y). But let's hold off until end of next week to merge. Hopefully
we can find a better solution.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
