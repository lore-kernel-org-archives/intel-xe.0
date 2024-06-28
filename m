Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FC3C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6E10ED40;
	Fri, 28 Jun 2024 20:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwthYGNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF2710ED40
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719605889; x=1751141889;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Pwgn2F+LaN8LeRKcmdR7w9UmVBHA2O8rKPx6+tknDE=;
 b=VwthYGNhYLbbmVKHW8MtPKfcydD2V+/GUaUGdIFTGnjs38NdXOm+nXC5
 JraDM/zKFAfdiBv2S7ys1tT2DZ7gpbxI1IhPIL8rqSw5gY72y6UkvvCfM
 NxqEP3nwUPdBDaV/u1QTtO1PsgQMK98Lg1Q/4NB30v4+q+m9cFllej/fA
 qGS6FTKZY+MesXiYPMeHZZiuXcSLEYUSf5LtIIme9fL0/fj8C8eTKCGcM
 6YxobFdcSgODmeRJ3hUiemPOBpKOVdcXclLn3tsCuwtxZMvq+YmBJIdJT
 0VVoy2Y9nDxEdZsMdbFSaW4KS17wSQdB8Vcwjg9nvCQKWtoN6RrJBUIq0 A==;
X-CSE-ConnectionGUID: bPlc6g6gTJOXkkUppOc0kw==
X-CSE-MsgGUID: WlFGPLrySUuAZCM1dyczWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16623483"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16623483"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:18:08 -0700
X-CSE-ConnectionGUID: StAT39jFQs6jFedFkiFg+g==
X-CSE-MsgGUID: hqVKib9/SS2Q9aa9487z1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44676070"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:18:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:18:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:18:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:18:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNpRVMgYBh3eFpCOOwWyVzHkt+pFeeyt8uSC6cAg9ZLOiSGNRFLAkCUWlLevc/QLEKNYIYRDKI/e5+3ToO3r6xDRiT2pde94M8Fvern2xFbx/gHzJqC2UKD/VgqrzjCrBEFjVuB1dkz8JthmWompI1d1j+7syroBh46J/r0wtukyYhZ9bXLOTfcsPJAfevFkbRvh4l6l0i8YPHm1hp09BcooVMpEW68Nik6NXKqAeW1okmtrJPIx0/w66DhWeF9M1nJsipBTVGC/eZik20RIO3wTuBn881r1IuXdB3eQcGyXckMaYoJOhNRZS41foC4X2vMJpBV2VzmF6+5YSGMiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv4AVtWcRJKBdhFWk5Pq0fNQs8B+3YLVhYln4WhVGOw=;
 b=ge/cJiCpBwdSYwpWX3unNin+hw2m+DJ1pVP7+j4VSb0UjCbf9YmrbtWHrZlgqGV7UMk++QpJv8kjypbt39DOkzri+PVCwsaei7fBO4xi+RNiDiIhJ1ukoioTEoG8FRpG/xSm8RO4Mfxq+5NXxmHuyCIi/aHZwT3rrZt271DHmLLlW8DD9sX/VmLKHRdMzWwxJXiGdfJ0TA+N2RPuI6PkKEsKBlvPy8KDkYJBLu9RLkh5x6NbDt5F8jXAMWh8Ni2VIwciI0VuT3yh6pufS1zePPEvDH+J31avEj3+yaTmq8YU+XiXh25YzqZiBUfxQEYjMsEe88vdKi5lhJMyV3nT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 20:17:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 20:17:57 +0000
Date: Fri, 28 Jun 2024 15:17:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Message-ID: <qjx7gkubwxhy5kbjgmakf7ppnah4ormmnw4xzplifwph4an7ef@vcbqqaqjm5tl>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
 <i6u5mewr37v7ujevqsevvjcdq3g56jmn4zyquv6qym42i2anvq@ve57hgm3xovu>
 <fb510ccd-1d3c-4fef-b365-01765f8e672d@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <fb510ccd-1d3c-4fef-b365-01765f8e672d@intel.com>
X-ClientProxiedBy: MW2PR16CA0055.namprd16.prod.outlook.com
 (2603:10b6:907:1::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 333aad85-a3e3-4d9e-c444-08dc97af66ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eDQhtXHbbt17byyvCwwDFvtAQgWW5ed5Zg/f/38jFH32QA+XQGR7PyViEvjc?=
 =?us-ascii?Q?mo0UgaWYGygUp88N2EKGv7v0mAdIo5LcQvWi8O0fpTh+TEzMkyJCxXmutY/H?=
 =?us-ascii?Q?CzYHxLvD+4JJ5V2aTMpz8LkadTDXQrT24oFL/Lqr5cZx82xj9jDSLA5xexSl?=
 =?us-ascii?Q?mCZAeN3KgAn2uQi/g5+fwPedwnOzYbtYvD08LPaR95gS52f2xX+lh9RFOHWi?=
 =?us-ascii?Q?WHAP4QKwq+2V9cIqwS9NQ52FatpItWL6E+ZMB3tBog0TIczbLNdUfJF/rR37?=
 =?us-ascii?Q?E16tFjkLU5aDbAbn8IrzbV/SV8vViQWQsFx0gqRWRHf2maOAGVf6nQxd+Cq/?=
 =?us-ascii?Q?DmnJUo77DTQv5ZtsX05eN49HTVorXIRt4JNWduJlTVFTpE4NJqAbuU4oAs4b?=
 =?us-ascii?Q?RDj1RCy4S+MNEBM5+G8jRIIwQnsK2xoioYvB2mCVqnjfKptkgDaUrlOD7rfn?=
 =?us-ascii?Q?uYUdNjrrW7F+7D30ajy4NryP8aY9IsqorLQgkCqxiTRgwD6qJO9vevv9o0lT?=
 =?us-ascii?Q?o/aqo1q2GqsvsnLkZjAfLrigNqwL+FzRC2xMcl/euphz68jmPptcRNpbvvQi?=
 =?us-ascii?Q?QtbdhdDDaDiIzszBJw6Ddhwlpb5ewcfN3oIzQBKw/jVqnhcIWiGmDb7cnxwt?=
 =?us-ascii?Q?Npv77hXKEXPjTSUytWqYuHaAgQVqfOWE1H0pfynoTn+XVGd23sw3V+JGaGAz?=
 =?us-ascii?Q?78Lvr6S4FgilLo1HU0c2sJAnwwjxSNJgAInEoG5BjbMaGfgd4iccHqTnBJot?=
 =?us-ascii?Q?kRTmwyz4nR+cpE2vL34Y/KyBtlgUh5+kv3Fr2IAz2PRxwggpGsfALWK8CcGP?=
 =?us-ascii?Q?xP/WgW1UHw+G0b1vw8CUnEE++4Sw47EtHbmK6oCMqFwASkvZMLKvMb6Nkrvh?=
 =?us-ascii?Q?mVN6owFnE1GU1ErtL/SqCefGOC+zfHiyDXKetMsP8a80nFYi2jIGzRKtjskm?=
 =?us-ascii?Q?8cAD27eXBIivrEoa3ahWfGaV5M4p0FDBLqmiGUAMKUJkV8PiHcKI0xvKrTUg?=
 =?us-ascii?Q?ZOdE+Yx8vKZYsCJbF6alR9olVkinnIhPRI25CIWx3TQtE3JZ9ciHxiP49oJJ?=
 =?us-ascii?Q?PfBkN3nMYJ/mg3nJtqLFt2G0jWPf9OwC2aqyU87aHLvezviJift5qxYyjtl/?=
 =?us-ascii?Q?s1lW4AJqBg5Gwz7sI3Vff2/otaBKyEbnCsYBultJFjzbc3O32dfrsG2nQHhr?=
 =?us-ascii?Q?zUoe3/No7cyvq3Fvgc6ebn3g/JJJyg7spMWTgeBv8cEKlx0jSe6akI4pzrQo?=
 =?us-ascii?Q?DN2iFDjycxk3/60Wxj5hTu/QsAnj4A2DfKCwtbAToUhCqB79CRiwKVD2uWPf?=
 =?us-ascii?Q?NkInGrbxlpplYFJR4X+zi/txmQVqk+nUEMI3OKax+0MW+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6BWaPYTCAbKg+9mloMPZKDBbd6UV1c4uFZyvYwfN9bOwuYe2J/fn3VvWd1M?=
 =?us-ascii?Q?sIG8/p7YyxUaRkLoRtCwmfeGNAOMvZDAMr+yVq3pMaApfZ6oR1n0AMb+GqVc?=
 =?us-ascii?Q?/Cu9OsNq0FC8A8Vum+W1ulOgPcKBt3yBXJXtzbPzltyuaUdPidNHwHfa1k50?=
 =?us-ascii?Q?r+HpVTGNNXpeo8Ct8OWXw2HI4gF2uX1MaZ+GmAFAhjD/9tMLtckbZhUJyyWv?=
 =?us-ascii?Q?DiHQRXGd4dSVjkpVw9a36lefwaq3cpEK3N5dOUC12Uj9YWodHK5urf81BMBL?=
 =?us-ascii?Q?oZl9elkwDw0hQrbzw4y6UskMQxNMAsggNS/0JRx4Z2lcUEz9fX4g6yf1hTWk?=
 =?us-ascii?Q?uHdwvhYruHCouGYCC7UHECplQ/1rn+hYhFljl6XX9xj18vuRQ0u8Ke4n0VIo?=
 =?us-ascii?Q?G/F65yrckP/F91odvxan/WP2Qj3IV7nKBTo4gOowS5072Em9NGosGuM6rxqV?=
 =?us-ascii?Q?qN+Cwm/Mg/+HWzz/A58iyO0PJSdItVBO4kHlsYCkULkRkibRZVCFZnpNyqXO?=
 =?us-ascii?Q?rUsUanqf1Wzsk+jSqv96VanXjPyAuyu6XzP+/HB2Pc0bHxDyfgD/gWDMuy1P?=
 =?us-ascii?Q?lR9N3Zr0ibuDx/CxTtNOx5x7+1YvvbJyVWqBw+k7QEprcQ/4a9Ry0DNfb14W?=
 =?us-ascii?Q?Yl1m2aJL7YMqs8czSE7K2EQJIWYW8lufrqkpJV6FVWw3zl9joAVWefu4J5Fw?=
 =?us-ascii?Q?jotq5/FVL8Kkd1DGT8+1s0yo0ut4IKIMmX1FChzIdGpllrknY8rFjcij18KJ?=
 =?us-ascii?Q?mWWe1DpLHYxyf303B4nKep1t90pxDi+P7s9fXrSIZ6EbyvLgAC/1oD6Kg6Nb?=
 =?us-ascii?Q?iZX1vISFhrl/vw++Lew0cUIA5DqtlXZGKzyCFUOxq9VP4P1rIHohqaRSaRwr?=
 =?us-ascii?Q?tUv8LBbNCGLP0lcqV7xcsnW1xkl19SQns6fu7/SSnRc2oiGJT8j+qUOFN4+D?=
 =?us-ascii?Q?seDK2bZy8xQHgh29oNHhWsWJIQXc0gGijFEshQ7UC8VLvtAZmCm4PnNq+Fhl?=
 =?us-ascii?Q?U24FB76ZznENfHIkInns0fD9gvd6DWmjZ/tsrn+ifGiuzy12Hhfq4bj3ykFL?=
 =?us-ascii?Q?Bnpto+93enV96U6Ud66tsS89KKJxZOisevxX9qNMsiFnVKQaCd7zvR3MVlDr?=
 =?us-ascii?Q?c8UAEilyDv41FiGVJP9WukpJtG/fCu1f2Zft05v/IBQuyfmixJpD41ijIcXd?=
 =?us-ascii?Q?mPJHtBQy4W17LCB1/Ehf34I0ZYDO7HO5Fxhbmk5tomiNLZUPpA5ejKZnh8Y7?=
 =?us-ascii?Q?RTMEQn8zwhiu3MzAa0vI4hIaRGN/Cx8pijizZneOxONG1O1TJIvuLOytReAi?=
 =?us-ascii?Q?ShTImn6sVwtJDS8qVc+HfCJUjPSah/9Fe5x7B6io4nGpwyQHWKIMShwpbyKz?=
 =?us-ascii?Q?V+9DVjz2j/thKGwYhSL5tCGO8tIcFugBtB8/uoqu+vjZRsITJeAXzcRDSMOb?=
 =?us-ascii?Q?uVoj7//rSRka/uZhSBfc7nxsdk+I6BOVICnWL4Wm1csOaSnw6eXFgw70ecE6?=
 =?us-ascii?Q?XKSWP8yKVGCbLuFpjOk9wd5xXESsNS1BK0FueaZwl0x0dyELAE8vNFDa5yOb?=
 =?us-ascii?Q?7WrpLO/vXifeBUoKORnjMCA92tKNi+nT2gEWGHo9NqMIR3HimV67qP5dSNHl?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333aad85-a3e3-4d9e-c444-08dc97af66ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:17:57.8330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3IFXcvV4Ulk2989jY5tymZc5H2sWhMaIEKWX/8Xn7xVA5qVogfaq0DgWidftfb04AwbbrOefTgWdBfTQsaN55f6t9HY8O1urkg4a/BElPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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

On Fri, Jun 28, 2024 at 04:06:59PM GMT, Dong, Zhanjun wrote:
>As guc double-load will be changed in the future, the comment will be 
>removed to avoid misleading.

regardless of guc double-load being removed, this can already be done as
the comment about engine_mask doesn't make any sense anymore.

Lucas De Marchi
