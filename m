Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F62CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0270B10E108;
	Wed, 15 Oct 2025 23:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjOBIzFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3636F10E108
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760570941; x=1792106941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oc6ksSSZNcN5k1Ca8h92kWcxTx+07rjoKslUFfypQq4=;
 b=gjOBIzFdeeASBdquUbHbKIfQewEWWJnPWne+QduvaP7g9o4fAbglOCer
 /thnCEGsAFzT94rv3l24q0uLxwfBLzkgYAUunh9OcoR96bRdN1rFzj3Fb
 qe4kMXio00B+Fyoc3SU8HYfTK8ETlcPpJpYEMFCQWTyXGAf6qDTtwXKE2
 32+UgfKCgFMkL1rBWJhGogPlJMgQaRgvcLUGtsQSvdbqDplpiLjKhg9Wr
 qBTfEv2HsZsPWukpukdSfUFudoVq//MHegUkILJDiXBFrydT7cyRvaWFq
 hNW0pch0KlTdcyzdhl+BvlAcvj9HM9g4vtWP2oQEfc/Qamr9hxlf+UgVc w==;
X-CSE-ConnectionGUID: AxdAvB4jRQu35lD+DGDBGA==
X-CSE-MsgGUID: aerqAMJ+T9SMAFCK+yB5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62851949"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62851949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:28:58 -0700
X-CSE-ConnectionGUID: qWjJmJmyTNSXobCHKJzAFQ==
X-CSE-MsgGUID: MJAzrwMQToKuoodr/svOpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182286301"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:28:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:28:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:28:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP7GA82f527aKzL6G7cxTKGTkV61rbS+TXgjZKsL+cQx3alrRTRLPd6QF8jNkN+iRXfKaBqiBcz7GoOGkfdEUsrW2SH9+u5QEHTP6kxlQlg2hi7jLJj18EWm3eQgQC1JHPEQ+uJC8lhSEErnssvTZacjih68tXxt8ywIZ4ROUZ8+sXLUO7lySfZ4BhSZypn6kVWFD+i5L85kK7NzwokMi+ZcvMtsqB0WSEPFy+5Stuw3GRB0AwXLr/3VD2cwSSVYGk7UPOSEuepQvU4TrrixIZ0mFoIINcazolf6Wp/LYoabnVaW+ZcPu899/vR3+zze6KYdh5CGW/t/e9231LNB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Um2PfDqlOnyZqAHlYAWxYX+PlwBdZQuXxpqQKZMoerA=;
 b=cAwJYNKtzmTzW1/Lk39pegn/Td8JC05dBAqkGL/jTWlLLxfmc6+EBi0iRUyfQPqpjuLZJvaZ6z6WwQ4Os3odnq2bTj4cCW6TrWvOtD8vu9b/BS7g/zW1DIj7kU8mThSZFIB7UHTgqOco1xEYAYWQ4OOXjV01iv79dnZuskZTloHKWvL5dfjBoHWWyisEqA+rX2v2Cgu7pgdMj0ieVYohwowoRxUsmjqK01/JZAbF0Aw9VfxZGY3l8wKCKEVMa4tdZxp1p759FiTM6d85V4ffB7sYmxt8TfsoCAzD4af1WzmhS+S9Y6YG0uH8mxRKfEjXr/WUTlmayDA/rxS9mbQnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:28:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:28:55 +0000
Date: Wed, 15 Oct 2025 16:28:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2 09/22] drm/xe: Dump CURRENT_LRCA register
Message-ID: <20251015232852.GG5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-9-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-9-b9189b3056a2@intel.com>
X-ClientProxiedBy: BYAPR06CA0067.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: ee56d7a8-0f47-40d3-9e06-08de0c429bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?54tI8yULNnVeY3dPtjI18tPFmzxY+YhPf+aJULNZY3krBWsf3LFKi0IV7Beo?=
 =?us-ascii?Q?jxIHAWuAjL7gK2cByVzCTjj3za66LIa3SzoQFq7d8KTukEDtZrlB0Zc76BSo?=
 =?us-ascii?Q?SkEdgEBOOCV0i90J3j3yzqjzOfNKlkdfNN6wJrThfaB2IAvPS7v7bLiZCV14?=
 =?us-ascii?Q?k5myqGXvQr4JJwxOZbMWgPfA45RtYRwELY0f+Sj+n9Z61AsiHluE7eq4XuzL?=
 =?us-ascii?Q?RbO/qdYXEre2hnF4x9mlbeAJGVvK8ZApO84on/g1JHe/jC71HfvlsKu3tjHA?=
 =?us-ascii?Q?2GqeLWnhULPD0njjjeKQe0sJ5z9GzoCvsNSMtvSEaTP11KzOiaSWKj6Nd5/m?=
 =?us-ascii?Q?cLa7WEy1+V40TjtkFr80jFO4CaV77az6uVjfAPg+3rIeT4xiPot0c4G3Vc64?=
 =?us-ascii?Q?6qYfS3hLFoTCOauTAwBewO/AmueXxJAKsjSuBiRgKYt9XSGQ+jbeDe7RHTOU?=
 =?us-ascii?Q?vdDo6eGXUVQF7FCI4bGRBLHHCxz3tOmzUi5Nra/mfa2Na1Oj6VQJ5U9wp01Q?=
 =?us-ascii?Q?7wFPoToZm+1o83Kn3WVRWE0GMTj6bfo+xfL6xQVedNgmmu0qafvDOIEpkYYy?=
 =?us-ascii?Q?I9+ZFlHbsaWB/B9oQDHU48+R4Ekp72MTV1ZhvAWwMQaJs/gopUe/qsd5EYmO?=
 =?us-ascii?Q?G4ZRfmC6HyQfEJeMe9M2l15Fufka5gHzpuHMMxP3H9N0fGnktf4lg5VR8igI?=
 =?us-ascii?Q?nYCbUVbX/aNYx0TtEpF+zvlB9cRoomPeIhDPFzN9bNAt26nNmwpOm0doZJsD?=
 =?us-ascii?Q?6KpsicBkEpXdQFbiJ/gJFUUv+hMT3zW3nmcVQGt2au1MKBxywYth8af/BO7R?=
 =?us-ascii?Q?27Avxkt+zmbSWUopafUPEqe8VAecIMXQuB0ELDaWpY8XB8oaWgHEBgzOWkua?=
 =?us-ascii?Q?YJv4cEQAJzmu0Ib4tCTCLcEhrvSs60J3M3qBk+Y02iVtypdaR8km8hnYYOuV?=
 =?us-ascii?Q?74+2dkWwh14Karnfbn3D3GPf3VGOIcJ/tepte2Jcskoc+Omkrs90I3CYJq7T?=
 =?us-ascii?Q?33yMT7Y4Q1EIGmqj2vwv0AYhkaLWKJHCF6AM7sTBIp260wM1+7wW5vJ9Eknz?=
 =?us-ascii?Q?ewOdM0ZD09ax6cYgG8A6spes9klNSdUtXbXrOeosiXG+b4gBNYASTdBXNrTq?=
 =?us-ascii?Q?WoNCgDzD5C220imXtexuU+d20OzZUIINfDKdwSEPHh0RqMpNHlvcHx++Q9qm?=
 =?us-ascii?Q?yk1ToQAtvLhhHDZDxLPRHdGlqPTkJYCqFCp1jVboSMGRMTtg94AtQ1z8/K/U?=
 =?us-ascii?Q?f01xl1wQ+gQM5IkkUUhG/eguIhxAIN0AScfaWN1tzDOjRUMX5I9QE+vG3yHr?=
 =?us-ascii?Q?KVGTkdYiIDcqRQ6PkiJyyF8O79Tc/G62nOAP7CfOjV9b5mcE2vpblyIkWxj6?=
 =?us-ascii?Q?tHJcyh4un1QFVuKlSTLRlIElyXwMYZiOx+yXiy68xGDzy9h8vLPMuQ0psMpn?=
 =?us-ascii?Q?jCa+jv2Zz3cCSrFZg6J2BuxDv6FbXIdK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KivwNKt5ymw2qcoy0IBxKFLraqDKFNj5iKHx5nlvihBT+3WrpKqVltzeswDN?=
 =?us-ascii?Q?oOg2qkrXbaOvsEOpdUFEdADPoQ9X7dnF9BrtdP/tvfsqEcpqEc3P7lKwJSHS?=
 =?us-ascii?Q?yKqNa1MYiGW6QLI8I202FLEqBt+BKIk3mywL3mmDWh70yTJrDQb9F2eTDJgv?=
 =?us-ascii?Q?pX7qgfIyHbIB/aCerIdGvQx0oLfnNUWt7TV5K0OqiuA1Ku0XQ8KlCcz7HMab?=
 =?us-ascii?Q?jdaaBZyRvzUkQ0yAW9JDm3g4lSpAhYPB8bSyQQtIzAcQU9fbj0bK4+9jBbcK?=
 =?us-ascii?Q?DvtOvLaN/rPMbvh2zasb4XUNORp0XKCZaz4Lirsg7B1/j96D1+CGY9ePUu+t?=
 =?us-ascii?Q?ouU73NV0gYwEoOv4JE7TgCWw147fucSmG3lM1PWOqb3ICZsmPZMCNyhMLYf+?=
 =?us-ascii?Q?ErPkd3O+2buWAVVYBaDZl1t47rn4CrxnhxaTq2rkocWfurfidCs37S0gDHzM?=
 =?us-ascii?Q?4oc9t5BAphMPpEHhxnw2boyVviqwErZbIudu6Bs9od/qWCxHY7GR7GgRxAzx?=
 =?us-ascii?Q?MKBoVOjO3IvbgSeRep3IPIEIglc4XPagfuvtuavAfXFwCrSOm+C5CcUH0PwS?=
 =?us-ascii?Q?cMC7e1HEY+rJHFTrpzX7J181PNX0X0dtn2hTrBg3sOEfa+UDIToDJk3JLrcr?=
 =?us-ascii?Q?mYEKeLSxoelj4dYOcCodsIn9ex0xn2xdWiIcPwYbYC5/DiCTI2+wVDYMBDG5?=
 =?us-ascii?Q?j/ojx9tcXi2DaIAgtzTYWUW5/CagDEPpKidgieotgusJZaCwkOjmDGZrSj3R?=
 =?us-ascii?Q?VgLnOvA371fR4xUXpBTr9d0JAA9ehWP/axkT5WTt/M334IG3I0NK6zLcjk0P?=
 =?us-ascii?Q?Yv1/fIg8WOoTNOo8GQm4DnEwMpH7EWTZ1ZtM7/AaAnkU5rib6rVZEDJSHgXC?=
 =?us-ascii?Q?oRyjaGlrsvI7nYR3lZNLaftLfPKPRLJhAEz+ugFs9MKVy9S36ARhHnwvAvtA?=
 =?us-ascii?Q?32r3Xf0IhuOgpSLJpARv7htdGDWp50nnIhfsNsI2QelqeJ5pruDyKTJlE5q0?=
 =?us-ascii?Q?46x56QXxSMUOuISaBYces4W7ieGT4Z7fY2ifmLJO8DkOGp4hKfwqTDg9nKl3?=
 =?us-ascii?Q?YZJCBw2c4OkSn2y3uR016Ptu/73zrWeRtmYqo7SE3+5C9S0b5YDW/a0nbUwr?=
 =?us-ascii?Q?6Ux+KqhApf9jCrTf//lZ6rcWZcQ7ksfNEFybdeGFnICixqmnNzdVPkl4MB+G?=
 =?us-ascii?Q?QIWcgToV4bMUlE4ADlaSZpoajYUMOvp4Xo/OrhRU+4oKFTEw/LM6NeDqJ4iy?=
 =?us-ascii?Q?y0HVP5SISUo61ALfv0MQTfV0AEYJlUrEhwA91Kw+3Pj9s/Iube1wf+KvinSw?=
 =?us-ascii?Q?9OidowyINydNdqa9FpAh75a0v6ifUFszj98EWKBVKevEszr5E4V/7uihn2yb?=
 =?us-ascii?Q?pOGOtbpZZMvp7Egha5Qv7V2+C95zwUORASXyQUaLs2PFscU2NtJVlcbL9TB0?=
 =?us-ascii?Q?bkrRrjmzCOeaisqBuIn2pXTj68+oDuXUOtpRBIXuQ72s8FoyJPmC9PtDEj8X?=
 =?us-ascii?Q?d7Zk2/6ni4tvCkr2ukJxcKECQRI0Kg0hf4Jw7/F2fC21iP+COi61ZASgH/Hx?=
 =?us-ascii?Q?jV8WbxUXlsHvV2uB4pqcfP3R8+obw/BZ9hmVHRXmvXUs5M6ShHA0EILEwtpG?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee56d7a8-0f47-40d3-9e06-08de0c429bba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:28:55.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gjCNoy0F5Ry/rH3roWGdbREPAuX1Q5hhYUl/jDNTmVWsIBELSAgmHvwJ1wbC9kqQyrnZQMkGEgM7v24KbRBy29rvcvlxJebHFdOOIHIuS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

On Wed, Oct 15, 2025 at 03:06:24PM -0700, Lucas De Marchi wrote:
> From: Wang Xin <x.wang@intel.com>
> 
> Add CURRENT_LRCA to register dump to help debugging.
> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Wang Xin <x.wang@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Extract CURRENT_LRCA from other patch dumping xe3p-specific register
>     (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index f4c3e1187a00a..3c05d85902c69 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -141,6 +141,9 @@
>  #define   INHIBIT_SWITCH_UNTIL_PREEMPTED	REG_BIT(31)
>  #define   IDLE_DELAY				REG_GENMASK(20, 0)
>  
> +#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
> +#define   CURRENT_LRCA_VALID			REG_BIT(0)

We only need the register definition itself for now.  We can define bit0
down the road if/when some patch actually wants to start using it.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 243dad3e24185..8d1bfa2cdb151 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -122,6 +122,7 @@ struct __guc_capture_parsed_output {
>  	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
>  	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
>  	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
> +	{ RING_CURRENT_LRCA(0),		REG_32BIT,	0,	0,	0,	"CURRENT_LRCA"}, \
>  	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
>  	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
