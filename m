Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C5DC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 19:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2860010E422;
	Mon,  9 Jun 2025 19:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="II1rmd8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4A310E422
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 19:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749495818; x=1781031818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u4G+nU95Ox1BVt+IxumPGQ0WEa5FFg6FzK6+BJ+UOWs=;
 b=II1rmd8otLrPwq9lonMGh/x9OktMqrBaDKxuoWbbqwNiYaV6eC+YvpfT
 T7WzNJ5F+wuynRjQC1lVNIxwg3pfHowsW5FWmqkvUvRAzihw4E7UL1ci5
 c1LSdYQO6+5gfZqgcG7+RCsoYRXC/uqciaVa4XegSS93djP5nlgF+x6Xq
 Hs7NKT9M30kbDydcAYa9K4amYChSHMpXr+cncQl7AYlovaNqniZbMAnUT
 kdETCb+0sXqXzOINIFhRBBRr1TjwO/y/nIUQJlXPlc6z6OXYjYNpQPUJe
 JhoZG030raCSvLse49gSv2M1UuaEA3ojjhW1hKpZm1hlm9nF6Be0PpwGg Q==;
X-CSE-ConnectionGUID: MW2yQqV3S5ObGHQ6AVf8/A==
X-CSE-MsgGUID: IN6OXvIZQFOI466hmR4iiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55391312"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="55391312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 12:03:37 -0700
X-CSE-ConnectionGUID: R9/txHm5SMif71WQPQs1iw==
X-CSE-MsgGUID: GNQXd/AeQoiakz84grwd+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="177505828"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 12:03:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 12:03:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 12:03:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 12:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6BP9P3+euXAg6j7YhoPTn+iYv6IrG+NJZ01f6r8NOk6IgWRTbnAhnDt4B9eoMTuRotCEVr9Ko0GLQVJGsCxojIVxgNowNQTi7BaWPmRfyHPYsoPCwxmoS+ezsuj5aGE6RJdMxt2+tJn11hKSSKDxAQ/oyDlFkiBaOJ6deT5a5P/Tps+e2G04vi1rnaoyyRRCsl2xDyFAz5+7I/NqsyV3GiemLq6s8f/fl/cRiGH+ITBxwUSqZxERkDfPyeoz4xiUIhtQdrfyCKvpQMUJHU4wFK29NSJdO5cYE6xwMRIWET/j6sYguy9kGrZDXgM1/bl7dV3G27IteFpRN9isQdivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJmnY2XOUI88VIkvBD48BCOxk97m9otPHiHRIhNLsbI=;
 b=I2aHqmDvFdGmoEUiE/Uc3ezn6tE0z8fsqASYipibXqBTLKSRscmNoDUSY9U3or58GP0Jo77yXY9FhCd1RcsI0D5VHxlkrqPWMa77BWWOXPTQ0WnDuZMLsEDTBzXi254fvSI6KrZw3agcoN9I1QhIAKfqMGFuHnZsqh6QYbao1/OTHwTPeyhl14fG9RTfIHMDjAfa2Dqe7QEl5+F0hLTtVeaY9Z9GUi/rEQtAOrM7gt/jQXqeVPK06ZP74Rg5XNpkzAnoekUmzgrYXLbLeS/2QgC9IQWCxgzwIwE8XMW0NViVL/dnpBN/tnI2ZvvSrHaSbeg5quUBg8NCA5bYMpDl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 9 Jun
 2025 19:03:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 19:03:28 +0000
Date: Mon, 9 Jun 2025 12:03:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/lrc: Prepare WA BB setup for more users
Message-ID: <aEcv_mm5C8VeHBQ8@unerlige-desk.amr.corp.intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6b4bcd-aa4c-4525-3c80-08dda78851a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmtvT1RqZGVoeXAxakU5KzROelBtWjVlNHpGbTlSMWxDQXYxS3VzenhNeGFu?=
 =?utf-8?B?QjZWR25aeDJEY2xOd21lSEJxR2hWNVlwbGJVNitpOHhDaDVlSC94dmIyUmxY?=
 =?utf-8?B?Yk84aWFxQldjSVNPU2lmWXVhcWtsL210TGk0UU5TQ295NnJrbjE0eWVQOUtt?=
 =?utf-8?B?eHVtaWJLZmlCK21vMlhDbE9SSTliSjVwOHpsZGxPR0c3ZDNTSDgreXBrQUwr?=
 =?utf-8?B?dWZMSldSYmM3dGJibEgrbzhvQnN2TXgvUWNPakpIcktMUTRyQWFJVFdrSlpx?=
 =?utf-8?B?SUpUSjJCNDNoa0xXRDBvbksyMUl0Z2JzcUpPNGgvbGhuTFdYdDFKUXo3YVAx?=
 =?utf-8?B?OWlKTjNNcUY5dnlUWDFBUDNIUzRVa0Rra2xlNWxDQ05qZC85cVpWWVZkcG1G?=
 =?utf-8?B?UEQwZnhmRENITllaZEcwR0JJVU05NmovSUtHOGFNQXFhT2JHd2ZhUlpnSFZq?=
 =?utf-8?B?bkZBT21SWVJGRW1EeGszVWNuTitsR05kY1ZBck8zZkh3Rk01UHRySjNoWEEy?=
 =?utf-8?B?ZXg1L0RQaTJ3RjVhcFhyM3JLSHNKRFpRblpFNFV6ZFZqeTl2d3ZZRlp0c25o?=
 =?utf-8?B?NSt0cG9LVzdjbVJLbHRjNzJhQUlTazNsU1ljakN1bnNPL254eFRwUTZmZ2V4?=
 =?utf-8?B?SEFXRnJmeFQwRTNVZlFrcmsyU0RzcmZVMFpnTWh2NUlpeHJFUG9hcHhuUlBL?=
 =?utf-8?B?dndaQVQ1R2lBR0VveXR3WnErWEl4QWx5YWM2VHJhd0wzMkFweUlLYVczcHJR?=
 =?utf-8?B?QjcyZi9qOXA5ZElDeEhYMm5iYktVTE9GbzRPTCt4L1dDb0R6WCt1TDA2U1NE?=
 =?utf-8?B?cU1XdXBIT2FLT3dwOENZbEhvS3oyMnhrQ05Wa0V1cEsrT3Z1TXk5djF1VDFu?=
 =?utf-8?B?Z2hQR21zYms4Y0czV0h0WUpuZituZGhYL2JyR1pUNGVqQkVFRUFZMFNVNUdM?=
 =?utf-8?B?K1pYNDk5UEhDckJGak5aelpsa21WRmJwbVV3dFpaSHh5Vmp3RzVrblcwald2?=
 =?utf-8?B?Q3JQRUI2eTZWd2paZVJFL3hDeWNDbDNlQ0pwQS9nUEMxeW04N2c4aVM4akU5?=
 =?utf-8?B?cW41Tlk5dTlVSENYaTIyZG1NZjEwZkVMbkxmN0wvQ2FPc1c0R3poUzh3VXIz?=
 =?utf-8?B?SmI3eHpZM0FXZnd3TXJsYlkvbFpTeHJpOHVDOE5mR21QdERmYVE1NmMyeDFa?=
 =?utf-8?B?RG1BL2swZzE3QVYxbHJ1bGJMRHllOElDVllGbUVneWJRNFUvK3VtKzgwdEpB?=
 =?utf-8?B?RVZjaXNwM054VFlNZEVSMFprS0tZWms3dVk0aXpoeHU3dExaN0laMWJ6L2Y1?=
 =?utf-8?B?RnYzVFRIM0Q1OUpuUWdWaVBMalpxRmRmQkxXakZmWFc3SHJ2ZjhTbjdqWmtC?=
 =?utf-8?B?REtBWEtzTjVPL2lrMk41WlVRM3Jxb1BNRmc2VDJ6ODY5Q1htSUlkQ3VHdGc1?=
 =?utf-8?B?QlhMOXNxNVhqZkd5VGtmNE1seVZlWHU4M2s5UGZUNlp3ZUl2akFyMEorQ0wy?=
 =?utf-8?B?L0ZvdC9GU3YwMFE2dElzYk50T1JpUzA5U0hYUDd4Wk54eGg4V05YR2NKNVdG?=
 =?utf-8?B?dUJYSHp2eUFjNWJPM1FWQXlvdmJRUXVQdDlNRDk3cFZCekdxVTZPTW4zTHFo?=
 =?utf-8?B?c0orTC9ZOTJNVFF0bEFaLzFxbXBDd1FkRDFDdGdyYTNIeUFKMDBqVHd4Y3RO?=
 =?utf-8?B?K1htWTJpUnZVZ29kRTJZcVlOV3c1SHZYNXNkdE8wa1AzWlNveUFYNkZKdVVv?=
 =?utf-8?B?L3hVMDlqbnpDMFpGTE9JcHZXdjB6emF3am1wV0VVM1I0Q2I1aGtBTkpGY2tk?=
 =?utf-8?B?ZzkwaDhwYjBEUW82ckg3Ylo5ak1jai8zYStGUjllQXNxalFvOWwxcTlMc0Qw?=
 =?utf-8?B?N3FrMkJDMHlOY2ZqMG9XQ3diZzUvS1VqMGhRYlBORWNzWXVCK0NsTlN6SXVy?=
 =?utf-8?Q?QDKC+aRrVQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXAwMlFqYWk2d2s5UnU5aXFGVEdOTjNXTU1Zb0dJdnhmNmpKMGE2UWpweFZa?=
 =?utf-8?B?Z0FMcE8xbWR2UDhVb0d5K2RZSXBrWDBPQ1dkWEo2Z2xLekxralBiaE5LZm1a?=
 =?utf-8?B?bHpkVjcwdzhXQmVLSlJxRHdCaEJWUzVEcTMzVE1SRTlZbm1YQlNTOVNLL0dM?=
 =?utf-8?B?YVgvWjFmS1V4MEtYRS8xZVU1RmVUanlVRjVsbnhzZ1g1QnJpVUxjOXdDMWtL?=
 =?utf-8?B?Y1lyMkkxYUF6QTlzVG05cjZiblpnSGs2T0FHMDVZdEtreFVKUnJuaHNTcFV3?=
 =?utf-8?B?cENhRUM5UTY2RHlkaFM3YUt1dWpMbiszSko2UXU2RFpIaXdQcHhtY21QckRM?=
 =?utf-8?B?aEJBSWxGMTA3eHI4d2I1T1BLVHBPZTh5Q0JZSmM2aVVoSjRLMGpBRUtJNGhV?=
 =?utf-8?B?K0c0dnBPR3ZTcFlmZGlvaG9heVlLc0tVNi9SaUg2QjhsdThIakhwOFZmMnVi?=
 =?utf-8?B?NE1FVWZpMll3dEVmR1lpaG1iNmR2c3ZFTmpFb24rSUU3YjJIbGRtREQxdk5u?=
 =?utf-8?B?eWlmajlnNVpseFg2cFMrbk40alRrN2k4b1RLcFJmUW9RTXY5K0Q3b0pXT0Rn?=
 =?utf-8?B?YmxjWHQ5QWxHcVZ0ZU52Vm1tdXdjUVZEK0dIamhpTXkvUkJpM2g4YlFBMHNE?=
 =?utf-8?B?QVZYNWVEK2V1dmNnc0pDaGFSdmdNN2lPL2pHemtKTE5xRHREZFNmdVdLczlB?=
 =?utf-8?B?UkNYRXJjOXFCSEF6WE1hdTRRQzQvNHRKNklwQjdZNklmYlAyZFRpeXgvMVUz?=
 =?utf-8?B?SkdPYUx6RDBXZTdXQzJ4bWQxZTZJY3pERklYdUJocmJEb3p3VCtiMXFnb2pE?=
 =?utf-8?B?cXpkTy9SWVZWeC9QbU1KOEJVdk92UUpZK01xbWRLQmExL2NKd0l4bHBLdG9U?=
 =?utf-8?B?cGJnb0tVTjdSWUlGNFFrMEw3bUFqRFZSd3dzbWh1TnJFNFR2VGxLMTdiaEtv?=
 =?utf-8?B?VnVMWmtmdlBrV0FieHpIVXNyMUtaM3RhVlN6ZWdyUklseDNjUCtrV2VSQ2Fh?=
 =?utf-8?B?clQ2d2c0RVM3elBnTVRQbHY3ZGZvbUFYSXN3ZjRvZWJ3QUlIS2tXNEtZeXRL?=
 =?utf-8?B?ZDBxblkxR3JSL2JzVjV3SmFqcDFONDQ5cjE0Z1pLTmZhZFEwQ2x0WHM3U2lE?=
 =?utf-8?B?MzZnbWRIMU1YRm9QREtFRU1zU3RheTBEdTM1NTZqQTN1eUlUOW5LNWpDdUtI?=
 =?utf-8?B?YXpBckxNRWtJQU9hRnlhVFV0Z1Vxd2dFTjFKMUdOajM3allqTThodGlQZ2s4?=
 =?utf-8?B?eXpqQWhyc21LSzgyRnRtMXVxWWh1ZUdrVGV2dUpmWmswTDhGb2lDbjRMaXA3?=
 =?utf-8?B?U2IxTjBvQTUzMCtuU2F5dEs3Yy80enZMWGFjRzQ2Uyt3TXJjbnVoTXNKMkEv?=
 =?utf-8?B?aEYxaFZXMWJCUGhubVBCeStRZnNGY0I1b2Nha0ZqWitqZjZOc0tWNXJzQ25G?=
 =?utf-8?B?aUUyWUJ1WGs4ZGtPbnN1cUJsc0hEREtEMThPaXc0VG02dkkvN09mZjlpc2VB?=
 =?utf-8?B?MFFSaEl5VUY0dHpKYzIyM2NOdVRzWWFCd0w1blgvVzlpd3F6b04walpyejla?=
 =?utf-8?B?cE1XSDVwWTQ4a0tySFc3TjlEVE1tQWFJc2MxQTBrK1YyQzlCem9JWmFVQzdw?=
 =?utf-8?B?Ly9CSi9vVjR4a092SjlwMzBpb29oT0k5MmJEWU5CK0JTQjFnSUtvU2RBRzI3?=
 =?utf-8?B?Qit4RWxBYkp2VUZrRCtyMlplb1lwOW1vNUp6MGJUS21xQ09FbTk1WnBOZUVw?=
 =?utf-8?B?MW03UkJXSDVYUVFpMVZXYnkrU3BpK2htOVBQKzZSRmFmaGZjL24yWWk3Q3BU?=
 =?utf-8?B?Qlh2TUF6bEx4YWQwekZEZFJYVFhWWFBrOC9pTjIvV0VnNWVHbVFlRnpRdWp2?=
 =?utf-8?B?VFRPek9jTlNKRWhqUE5SeVlmZVVOcFBGSHNndlhLakZwZnMxYVF6aFczbjhN?=
 =?utf-8?B?MWFQNTI4Q3I0OE1Cdlc0ZENFME5YMnphYlh3bzY2U0IxTm1TZGFyalJNemdF?=
 =?utf-8?B?SUpYTU4yN3AwbVJjSXJXQU5qUFZhcVdTc0xBYkV1WitreTVFbmY4UHliN25t?=
 =?utf-8?B?ZFNCU2FTV1pZcVVaY0xvT2FWMDAzcmtGVHE2eWEyTjlvd3RNbUFOSVVpQzkw?=
 =?utf-8?B?VUVrV08rQ0xmMU5DWUtOenF5U1Mzbkp0eEl4ZWphc25nYXJ5ck1XMGhTMnQy?=
 =?utf-8?Q?1GHjde26DR7ocXyGLEzbBvQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6b4bcd-aa4c-4525-3c80-08dda78851a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 19:03:28.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8F9Zk/gEJ6a7EazPNjYZQTMcBSo1fD5XKhecwPyrRzDDPzg6hXTP4sXtxYP4kqnqWwraUWgdyQqumk6ZzkeEkytl/LcIkxoX9Z2AcQ0ac4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
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

On Wed, Jun 04, 2025 at 08:03:06AM -0700, Lucas De Marchi wrote:
>The post context restore (WA BB) is a mechanism in HW that may be used
>for things other than the utilization setup. Create a new function
>called setup_wa_bb() that wraps any function writing useful commands in
>the buffer.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>---
> drivers/gpu/drm/xe/xe_lrc.c | 69 ++++++++++++++++++++++++++++++++++++---------
> 1 file changed, 55 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index bf7c3981897de..529c6a972a55b 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -914,9 +914,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> }
>
> /*
>- * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>- * context run ticks.
>- * @lrc: Pointer to the lrc.
>+ * wa_bb_setup_utilization() - Write commands to wa bb to assist
>+ * in calculating active context run ticks.
>  *
>  * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
>  * context, but only gets updated when the context switches out. In order to
>@@ -941,18 +940,13 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * store it in the PPHSWP.
>  */
> #define CONTEXT_ACTIVE 1ULL
>-static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>+static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>+				       u32 *batch, size_t max_len)
> {
>-	u32 *cmd, *buf = NULL;
>+	u32 *cmd = batch;
>
>-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>-		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
>-		if (!buf)
>-			return -ENOMEM;
>-		cmd = buf;
>-	} else {
>-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>-	}
>+	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
>+		return -ENOSPC;
>
> 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> 	*cmd++ = ENGINE_ID(0).addr;
>@@ -971,6 +965,49 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
> 		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
> 	}
>
>+	return cmd - batch;
>+}
>+
>+struct wa_bb_setup {
>+	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>+			 u32 *batch, size_t max_size);
>+};
>+
>+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+{
>+	const size_t max_size = lrc->bb_per_ctx_bo->size;
>+	static const struct wa_bb_setup funcs[] = {
>+		{ .setup = wa_bb_setup_utilization },
>+	};
>+	ssize_t remain;
>+	u32 *cmd, *buf = NULL;
>+
>+	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>+		buf = kmalloc(max_size, GFP_KERNEL);
>+		if (!buf)
>+			return -ENOMEM;
>+		cmd = buf;
>+	} else {
>+		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+	}
>+
>+	remain = max_size / sizeof(*cmd);
>+
>+	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>+		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>+
>+		remain -= len;
>+
>+		/*
>+		 * There should always be at least 1 additional dword for
>+		 * the end marker
>+		 */
>+		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
>+			goto fail;
>+
>+		cmd += len;
>+	}
>+
> 	*cmd++ = MI_BATCH_BUFFER_END;
>
> 	if (buf) {
>@@ -983,6 +1020,10 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
> 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>
> 	return 0;
>+
>+fail:
>+	kfree(buf);
>+	return -ENOSPC;
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>@@ -1139,7 +1180,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>-	err = xe_lrc_setup_utilization(lrc);
>+	err = setup_wa_bb(lrc, hwe);
> 	if (err)
> 		goto err_lrc_finish;
>
>
>-- 
>2.49.0
>
