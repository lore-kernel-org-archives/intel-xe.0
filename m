Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4E1C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D9810E095;
	Thu, 12 Jun 2025 18:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKouhyvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3375910E095
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752407; x=1781288407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MUW4uZFV/pJGRmgL5Wqq8OcDQm94UQrULq/TCc8hNxY=;
 b=NKouhyvcbti5OSQq9jZhgWIwQELche899aGigemjwjcAVGgp9Y7d2t6N
 gBt6d+su28z52pVwiV7STuEBCu+9Vsa/NnPsgK+HcEoSu53FDA80eNZMW
 TBnjvZ3lI2VI/Wu8R0mL38l3RF4/HSL0znyaG1eCbIB/Dv73MCyZ0IfCf
 o38eGMIu4tP+o2Mf/ngxH4jcdeeh6akThpSwZQgGhRt3UfIgZckCAWa29
 Rtn1hQbfxvlMX4rsCtxqU1fpmcILql6HhuFEPJJLtYmT2xhfkDIoPxeeJ
 oTH51OZS00JH3rfBfinu/79pvgBNrUoQ/7gRTNdDCgM4F4/Ik8Tej1oys A==;
X-CSE-ConnectionGUID: 5n4rdhPaSPi4RUDe33cGwg==
X-CSE-MsgGUID: JdL58K2EQgGJ+xJ/9V6tnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62561929"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="62561929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:20:06 -0700
X-CSE-ConnectionGUID: G9u2KLvrQbqBtNyycLKDIA==
X-CSE-MsgGUID: 66rU+eLLRsWg5OXM19vIcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="184842019"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:20:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:20:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:20:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIy3I0bM38NLChaa+H8f45laQj/3s1G7pZCXe0/p98u8IoW6CNUdtugVWisWX5W2UpjHrUuZUdoapvt3mmFNaBkb4UpwN+UBDvJXriigaGJwnDf2S7BfZhxmm315eC1F/oCirH34z34tuh87xHZAXhJ3hRN1k6n58IJRvbi4629MiAM8lpyldQEDBD1w0CO8puKwlm+2ws5wHZIMSfQA57xIrbSVtGh4ZgCfK2fod2yhXd+V7oXbnTaL9ktpW6ugZOWdf4241+u9uFgQjW8QSKuuEeYcbJwunEH3ibiO1fqu8WdsXl9E1KbLjsdh8iKDcHdrqeIJwUEU8iu1FQ4mLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+cH7J+1E4/Wg/MLV/95rRRzlRPPLl3K1CMpkujFzcg=;
 b=EdGas4qL94TGzW4tSYfOc1OrLhuDEFPJv0HK0HMSou7VsZ16DBurpHRUr50bVDLzAznZETvEHSI21mD5VXZL4mizfWIRM3K4jpM+sCUjuCKZlPpuLhs6tnsQBJsKN9R8CtGsF2YW4EtOGir52R9VB/FZOu53HofFrwmXyv9K+ZfDEWZQqagLMHUWfpFN17yvS8V4PRF4aB5Ud8nGGc65whxozG0Tzgaq8o2RTGYGaJAeziG8xjhpXJT9Z4f9juRcQHvZzOkaFcP9hxHyp9+vIheNACONxWhLJRYw3LZJJ6hYUhKdUQNlmIEQpk5b7HkR713MkyG85sT6WUpB693rPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFCA4893B55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 18:20:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:20:04 +0000
Date: Thu, 12 Jun 2025 11:21:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>, 
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Default log level to non-verbose
Message-ID: <aEsatLTQ5+93aO1T@lstrano-desk.jf.intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
 <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFCA4893B55:EE_
X-MS-Office365-Filtering-Correlation-Id: ed339472-6943-43f2-2e73-08dda9ddc08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oObNXhHOSDtJxyP5lhEU6qd6hlHUESlmpqWWewAtHWTYi4jcOcSg0JTFrYCn?=
 =?us-ascii?Q?ErIBqXTZI01rPYlM3XBkNEHuH4o1yCIrltMj8lAQZ6LIXOamng47TXxjl8IE?=
 =?us-ascii?Q?IT4EYHnplIV2Ou+s9Y+poqh2UbLwo1JGi90Fl7H83RF0JO5edDW9ZLT8BoOb?=
 =?us-ascii?Q?Nxh+gy65LwsJfljP2J94NmVcvviB27MDlwqJP47SDqb+YPYzckJCSzfqVoyB?=
 =?us-ascii?Q?NkuOLSgAxDVisfb4/d7me8V778txZeg5hS3LfZ2vDVYXAkO12w7VTsOBWx/u?=
 =?us-ascii?Q?aCjNpFxb9ksMgqq8naHbD61GzemA7kUyYW5TnHEt4G0FXffoaNj8cqu/Xi6t?=
 =?us-ascii?Q?IrBlqUtk/jA8X16OPZmXi07PY54HpOhTM7VE/ItgSagFOgX9l9SS1enmcJdO?=
 =?us-ascii?Q?vSXUjyK9VyN5fTPx3Dmt0V2Iw7HO2zAjB/NhGnvyf1LjobWWgWn/CmNO2NnD?=
 =?us-ascii?Q?EBczkOTvIA8x2zKlvvC/5qbT1sKDqatjiI2EXCxgGkeV0rxgZhddouwf7120?=
 =?us-ascii?Q?c/TS4rPZWM/Rf6qb6MO4aBCtUFOc3z+Muaqq6keM3fcO8y06TrKgmrEXWql+?=
 =?us-ascii?Q?+r9MU7cu6vwUrFZ87+TR/ObFteP/o/7yT0bfrTL5pV1djwIxQYMNdDg+We4Z?=
 =?us-ascii?Q?8Iq5rWPxHQDRdz19amzAP+UgYt2kV2r/qlVFdN3HEGzDOesHelOnNgTJ2ZrV?=
 =?us-ascii?Q?wASPEYQ5R4odbl5CngmCVPVdSpg/dol12UTAysXk8+z/IValeTDB2uBP7aUm?=
 =?us-ascii?Q?qV7YZcfKDyJ9Hn9DZXImXajnMGJXsWo2qOMQ6DBx3ClmtiGoAg8ALkvrXzMF?=
 =?us-ascii?Q?Ye0MZWpN432erQp5z/KvRb0YbbDnxxExPLcK8bOSHp9/eicJ1iMh23rQLguH?=
 =?us-ascii?Q?btJ9T27CLIVfwhspg/3lG6IxDTt5l+3UFvnDcaULGRMQuY+QMEc7lBSvMFeT?=
 =?us-ascii?Q?IeykY5gjyKe3F12O0yRhTaPu5zIKjU0OOakYIokxJyBJ62Cxzi1IU6Tpr4eC?=
 =?us-ascii?Q?2sm6Et6AUrfTZgcp7ikF3w1NkN8TwmtCfdZyq20aF0412qjwytlOKRBsFFo3?=
 =?us-ascii?Q?sJff4Oa+OaCVEwbQANJcYwXzbeqzwvNs0dQkgK7ZdZxY2sYE2fXvOG5p0X/i?=
 =?us-ascii?Q?OilKC0J9bljW6LTX1ODzZGmxlHMNA4+W225G736PVo+0nsvUxWMv40/Mi7ug?=
 =?us-ascii?Q?GXhAfxr9BxWB3CZufik7ROeLufYLEA2VdoThTORSwxwWCWQ9VruMvdQQnAaB?=
 =?us-ascii?Q?WbkB5598KjNAaEYpXaUjZZq4IeeIl02GHFGSVB41hWFiToPwja1Pe8Uk9H0z?=
 =?us-ascii?Q?3eb9/r7F5kuL1L5lkH0Jk7QEDca3zSxMqhfHSteqbACUTzavRrdqYh9BDbnG?=
 =?us-ascii?Q?rBE12G7QHc4K5h2tMve2mvaf4ynsPuRZp6kTwJKRh++4OZT2h9svER8uTxXt?=
 =?us-ascii?Q?K/e6zFEreYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UQfRPQRM+9AyBQ2nd6LJP/v5U5qDy3B+ostxraBmRRMhU88GM6doDUOxEhbH?=
 =?us-ascii?Q?+70QtQNyPLKiOVpS4V8Gt2RH0XEJc++dgYM6fOSYmW+TKR9noNIxbJC/rVYT?=
 =?us-ascii?Q?NvmINkE8gcTvWkybaQsHTVPN15z9dMfN7vnthQfJiMQH/v95A7mGtC3STEC+?=
 =?us-ascii?Q?7ukKXGlLLD9Z7v3CyhXtcVUCOp+pb8ECTXcMs/yZLOSyPz/Wh30eXYV9524i?=
 =?us-ascii?Q?PvW+20P4aZbaQlNgB20acWnF5uZqkuNwyY5rcZO1RjAymHcdZdMYjD5DFCxM?=
 =?us-ascii?Q?9eLbCOanMfGkG8v9rACkfDDef2jSwiEZbQfeeLqy/CnZ2yEM1LHGA+kjpJyV?=
 =?us-ascii?Q?+PFcC94ferEv0AnWJtgxogrQ/4ugayxRtgX9/b9AhqnhmD36GbBWZo4aVNaw?=
 =?us-ascii?Q?xGIhrXid2bsf3ex0RnMSzXtNFpNoeGilwGnwgD1xntJcvhUeDSNPfBPHPcJv?=
 =?us-ascii?Q?gfgn2zqZfBVFxwmJBauiUDn277VLvzwK53hOjocdBZEv7jIfUlRaqpubxnpv?=
 =?us-ascii?Q?IjbroVLgWyJ6S3xhREmePpmO8zxYui0/jFlq2WIcKA2oljda4bCxS802dyHn?=
 =?us-ascii?Q?Bvg4UZCei65oU5DyXbSKj8VTIrUwnoYyUkb0xfAEuGh/YpQ3souaeHhK8cT5?=
 =?us-ascii?Q?E+1VgGfrLtsC33zzMNCby19t1M0QFWl//bNZHrGTBEvjs7mKKRPgFoZVGC3D?=
 =?us-ascii?Q?tL57lxRcVEnCCEHGhbF8TkE2DEdrj6ii5JoT3pr8yCw6/G9gmzPnt2Zbmosc?=
 =?us-ascii?Q?cEubpLL5HpqEy/lq2S/e4iJS6WjgxOl8zEBBWeia2RZZaKkYs3bSszveVN5W?=
 =?us-ascii?Q?Tx4fT9FLC7akyXnZpcPJUt68bJuu2ePGeyn9HrJ9PjKlqa5RfmpdYtYepzZS?=
 =?us-ascii?Q?M71WPQ7qFrcH35o2UpvQYZGzpW4jDzbXidA30TkT63Skn+BKCoR37qP0FvKm?=
 =?us-ascii?Q?fe6JPO+rAOYiErbXwKGkrY1r3mLBho6MrQP/y0LwiN6qi9t53v0D+BWTNsq9?=
 =?us-ascii?Q?wPfzPXstDiS/ig4U+f7Gf9NiENTbMMjTSXs3Ws2LA8pRoXVzznn3C0Q2ychM?=
 =?us-ascii?Q?8+967GK3gnDT/NabmJMQa2EmLtzCXcYijXj1bLE7oc9c7x9AlAFBkG7xyoRh?=
 =?us-ascii?Q?uqUgFkP9LlI/z0AXZob9Qz3L9lYLah/aeVAcNo9nC7UEcT182ELCFXNJE5+w?=
 =?us-ascii?Q?HfyBS63yVPKPt2gCjLgKIBCq5eDWHrTYB+kVN05rCf4tF8hjFgH3LaK69zn2?=
 =?us-ascii?Q?uZsfnHarBRKtngOm1jOaPC0AjIAixTzQAUrtusOkh1SC50A4nqq3nzHPrakJ?=
 =?us-ascii?Q?os7pQfp33T/mLN8oAJPFEWCyJsEuMWCTvWOJg7a3EiLj1RykLCgoQp6f/wWY?=
 =?us-ascii?Q?HDlp3x+5AK78bejXekfYjmx4Wq+7rNavIbBJw3sac6pjWe6ZRH3UtoLCZZSn?=
 =?us-ascii?Q?47lCeE7qYOvCCc+qHNnMVaP1H+EEBROOHa8KXj9kbwAAlB2x+55gM5opxzSW?=
 =?us-ascii?Q?2/5XHXZEhiPgfRr02IN7OP/H+7VyeS5L2GqcppjYXit2rbukIrXmKfBFt81N?=
 =?us-ascii?Q?XHI7lyekBdqt95SaI8iW+aBjwfOTtoQrREql9MiyL5omm4UkTX4nO5mHIwsG?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed339472-6943-43f2-2e73-08dda9ddc08e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:20:04.1755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntHgiEO8hvWacHVpRPTyUREx2D0lI1pDvtca/GBvA7BOSLHSYABPN7+i7jmAKecY51DJUcoSUYCoK8JNlHfAig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA4893B55
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

On Thu, Jun 12, 2025 at 11:05:32AM -0700, Lucas De Marchi wrote:
> Currently xe sets the guc log level to a verbose level since it's useful
> to debug hangs and general development. However the verbose level may
> already be too much and affect performance.
> 
> Michal Mrozek did some tests with the L0 compute stack for submission
> latency with ULLS disabled. Below are the normalized numbers with log
> level 3 (the current default) as baseline for each test:
> 
>                           Test \ Log Level                        3      0      1      2
>  ----------------------------------------------------------- ------ ------ ------ ------
>   BestWalkerNthCommandListSubmission(CmdListCount=2)           1.00   0.63   0.63   0.96
>   BestWalkerNthSubmission(KernelCount=2)                       1.00   0.62   0.63   0.96
>   BestWalkerNthSubmissionImmediate(KernelCount=2)              1.00   0.58   0.58   0.85
>   BestWalkerSubmission                                         1.00   0.62   0.62   0.96
>   BestWalkerSubmissionImmediate                                1.00   0.63   0.62   0.96
>   BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=2)   1.00   0.58   0.58   0.86
>   BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=4)   1.00   0.70   0.70   0.83
>   BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=8)   1.00   0.53   0.52   0.78
> 
> Log level 2 is the first "verbose level" for GuC, where the biggest
> difference happens. Keep log level 3 for CONFIG_DRM_XE_DEBUG, but switch
> to 1, i.e.  GUC_LOG_LEVEL_NON_VERBOSE, for "normal" builds.
> 

For series in general, I think this is a good idea - no need to slow
down performance for customers.

Downside is devcoredump from customers are going to have less
information. I'm wondering if the GuC log level is low, if we should
print something in devcoredump indicating this, and instructions on how
to turn up the GuC log level for filing verbose bug reports? e.g., A
similar message to what we print in xe_device_declare_wedged?

Matt 

> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 1c4dfafbcd0bc..4809afa7ce3f9 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -20,7 +20,7 @@
>  
>  struct xe_modparam xe_modparam = {
>  	.probe_display = true,
> -	.guc_log_level = 3,
> +	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
>  	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> 
> -- 
> 2.49.0
> 
