Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99636C3DA49
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jul 2024 02:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484AC10E080;
	Sun, 21 Jul 2024 02:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpnU5W76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBCE10E129
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jul 2024 02:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721530004; x=1753066004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MZenZRJwC5X5nw3ZYhE9jHWwFlYTYUMUlNrkKo5cvTo=;
 b=kpnU5W76untIRZMj6xHYoSKOqby0XOCaFlTEwNsKiYlWt4Sxm8Q4WumU
 T2O2Xc5MkwbU18IUPYz8tM7KJqVa0M7vriBlRLDUUOJHcW4QOcY7vPhJq
 c4v/NrRkx2sYZNHouxDVFjeg9bIRY276MfVT5v/sdWkI+lTkhTttVVABc
 MceKIDGixyuWzSocT3PiwKtVfe3ujOH7qIU3UHFzt2HZoqVl0J0wNJaee
 GJKGJX5P90VN9ET9rWicxWowbSdyhIGw+UHNG5+dDoVEsDFGMo9HFUcDO
 +cOc5KOOyxMOl0Ao5CBnxGMlqXtP2L8WXx9A2s+29lR2sAx4LeM3PKzLm g==;
X-CSE-ConnectionGUID: xZJUQ/LORDK5sQcqPSbBWw==
X-CSE-MsgGUID: goDnbCWBTf+cGMPHsRCQ3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="30508346"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; d="scan'208";a="30508346"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 19:46:43 -0700
X-CSE-ConnectionGUID: oHyt7jsYS+O7C3O9Yc2+0w==
X-CSE-MsgGUID: uahB1nr5SQ2olneXCaZ6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; d="scan'208";a="51398249"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 19:46:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 19:46:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 19:46:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 19:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZ+EGn7ij9EOg17IaOYtMhefiCibZez3CgS8oBjEKyvzqSOrfEPKHPsjdQgv/OtEhu7Eh1/n3O2AG3b0Z+aKF+8fmqmhLH8xOKiXa8XTxIudPVCD398uJEQU0JY6ONdgBpP0ID8YfvYnjdCTczTS8opgeZ3Tz5bPqfamaxACRwzr1Ingj2UZQDWMrLsL6asusLCW5YldGzcXIKaCN9beMmLiuIl26mP6aEIaoQGMmNiPfwKNORwkCTiG3Bng2pbeexpz1gKlbf2WhwJXKTh9u06Zck6giqLj8rE/ypi/bgN7fUIuH+/f7K9AG7cXO06AqiYPeLc48VcIXQMXRdQR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZenZRJwC5X5nw3ZYhE9jHWwFlYTYUMUlNrkKo5cvTo=;
 b=kI1qiadphdW3e+pSecmJzaXSha5pNVOBDvKbjTyKk+2GiLFv18Z0wfSjC4fPmue98NQLAeLAchcAyjiII3BCwKZmTeCDn866HDAxvvAnTuMAPB0J7RK/5NEuOW02nMfSd01CpujYFjgDsGSaelEKhqkpQeD9YEVvWD68W9BOeGvOY+gDQ+wMCy8PZ9ZRnR/tYB1d2UsVIaouxC0hRPSfgjzAPBk/+5qX9M2QSKKHQEI1U/JE728wzEJWhMlPFroUXRkr4VV6Fh8708KKMe1IeQfCYhIXO/s8jF0JcFOysxe1DcKK+CUlgOg4bPG6A7vCw4mOnV1x86iMu1CIZ7RruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Sun, 21 Jul
 2024 02:46:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Sun, 21 Jul 2024
 02:46:35 +0000
Date: Sat, 20 Jul 2024 21:46:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 1/7] drm/xe: Introduce const cast helper
Message-ID: <uhvjbx56wyuy6ajyltyuixn6ptxxrpkkzc27jgp76ztjbxggay@k474564thae5>
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
 <20240720142528.530-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240720142528.530-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0235.namprd04.prod.outlook.com
 (2603:10b6:303:87::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7ad5e7-34b9-4528-afb3-08dca92f5610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O/Y5lmrA1BXOmmyCSJg3DXKAlqylSzFb62UgRjm1seydbUJoWvrJAZSs4Zum?=
 =?us-ascii?Q?/KV84WJKcx9/2uPe/Jw7lzrvCvpBoY57iKfPgsZRNPiPJFHwgz+P9cagK4Iq?=
 =?us-ascii?Q?JYTZlDjmdZ9UVwA2a+rRYXypI2iOhcf57Qu+6EMRMLnW7z4R4ArlzKchJFve?=
 =?us-ascii?Q?YDUuAIHQVwPg/bU6SMshIsviOtMhvJ8EMBFQ0Xuh5ydF9++JgjumbmGkd8mt?=
 =?us-ascii?Q?od/55LJ5s3dAOLZIwoF8la1uFXyDaut48m37LPUL3REtIWg/68mSP/PlFdYG?=
 =?us-ascii?Q?7zfmOTWjH73h5n11Jt6uLfB+haH+WB8D5n8yzEt5cTNcwzl9k6UD0kCzhWe2?=
 =?us-ascii?Q?4Bq6GkKc9vkmLHPMejoMytgDRGHvgO2ppLVpjX0DWeLSze6ryfccrgxPBcRo?=
 =?us-ascii?Q?7kizC0a/XV8YSy5g8m5Ud7cvz4fAtwm4gXQkb0Vs1rSAQdoCS8HLaxSqpPpQ?=
 =?us-ascii?Q?EiW6GHB7txxQ1m/h+R65cAHTGbtK2PajTp3SWRva9Ls+uTATC3S2vaytzB//?=
 =?us-ascii?Q?IbuofzyRX4GrO07+sswa6FA13snEIBFP9arUfGIGmwUZqySGTEVrdED3i8sJ?=
 =?us-ascii?Q?RKvk5AeZG4U+TDNxkd9yjYq8AiA5ynUdCIytEiE1PS67nJsrIZX9ln9bolfG?=
 =?us-ascii?Q?tqbr0YcmM9ifqzZ37kdE4iZx5+jBY68vQ/i/AgSDiEqksdiGS/1y7rrSKB99?=
 =?us-ascii?Q?QClZpbA7aUw9kYjb3WyGOoYIEQUk7ikyZST6KfvXsI360Wk6+BeBtB7yaSPX?=
 =?us-ascii?Q?wcqr8ftq4AOyq6wl6Ess5h9VjF34x2Y7GMpMHyZdglrWFiq0GwNw5TQTdlVp?=
 =?us-ascii?Q?n6Ppb6Ynwl+gdEV8MOAFc8fTfeKcVGqyu6CxpsmAa68PLryijK7HOY+8dAx7?=
 =?us-ascii?Q?6x/+tYEjhw4GY3LgvXC47RSIU8DCDfq6A1LMlmHfOpJKYWywpLxFIjhNli4R?=
 =?us-ascii?Q?0YYZ8leydDg58/9E3Od66TebNnCBhpzk2e6K4E5zkanrGsRJxDtdp8ZbG6bN?=
 =?us-ascii?Q?shAhzKGENC4uGr8oeXf3s95ulin5uvrHiRqyOOzoTpv+zHGMDzoFHucEcrOC?=
 =?us-ascii?Q?p9HQu4P2kPV2eshJ7hJXLPcghihK383NtwyG8ov6yUSKgpHryweT4sUNYD5/?=
 =?us-ascii?Q?Qy6kgydq/n6NWU0+9l9qRd7kSNYukEKsnEbSrHnQ84mTXkw8pfsELGP8nU8M?=
 =?us-ascii?Q?pUQ6lDIlfSm3VowpDUsBuJ5ceFnMvIApcd5Wo93GUpmQ1+GdHRbz+MhOobTW?=
 =?us-ascii?Q?CS8K6BvnTAYK54mPRbo7cbM4OweRhtSeM8CUQn3ZTGSsI9FsEGtpoWJvZjfy?=
 =?us-ascii?Q?/QxJc0fdGwMtjX5zVYQaR6ViCDDqAO+fbxhTy2BnzHevhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YY4chISLSt9Ge+2t1wXap2XLR7M9/kokXavDh6uWayyrHvsmoQde3hmD7Rnd?=
 =?us-ascii?Q?DSGi/wq2yXgrOAUdatgpi7weVvq1RVkRsfAARohPY8hTJ6MimjM9mgI5SwRG?=
 =?us-ascii?Q?sq6wlRRD0ncc/kpfDHeDofZTT75XUoXIY1SOa072R9uCnDzbMdq/pcwtutTn?=
 =?us-ascii?Q?EhEn4dq+j7WYutbS8D47W/pUJyhhWgAz0RMfctxo0MXX6xRga9sb2rmqFKAI?=
 =?us-ascii?Q?Ecx1Ma7Qq9U01NeziSUYjPYZorQd9Ur4mjp/8MhPnTcTRxoaZiSLaiHqm2KP?=
 =?us-ascii?Q?Nn1VLaFu5zaBWT01O0bar2EpyzPFHDZ3jUCkpGkeY0QQe6Z4amY9RiujhNH1?=
 =?us-ascii?Q?/bN0qa0oJ/3d76g8AnOv7SChlta1IBkqow/RQUi9SEKQgn5/DTAZ18v5Te11?=
 =?us-ascii?Q?Z4tjmjIyGsRsl9e4BYtrHRaapYLFudheCR9wkghwsmEJJvEJg5e17fvLQGEk?=
 =?us-ascii?Q?AARt6VOiQdKs8MIeNUEvHUGIl94cvVl2s+Mo9eK1S44VIt/v6LW4uk4WJ8Xb?=
 =?us-ascii?Q?tyZjl1YtZnWmygwzGtRtzCwAM20SHGUNJERfvHk8Wu9Mb3Pk0FQ4peegG1oI?=
 =?us-ascii?Q?0wV5Vc6g5XJUvUYtqr3GcE+HHK8ElJeAEw2HDTdsobZtgMZA48hCk7vPqxAE?=
 =?us-ascii?Q?A8NOF6YKfbJuhPsLNE8J7RuE5tnszJFwE0Ux1aiddymnWcRKMuYdb/0Sgp6z?=
 =?us-ascii?Q?t5G25sPXrtPr1/ZigTAeP2SL0D9nwcVESwjK8H54k3TCcR+RFORM5dA2GtkM?=
 =?us-ascii?Q?HrtWeXt0ahKaiLwNgPpd0IaetbN9WOFd9V94knFK+i8XkxYBruw5FdDn0h8h?=
 =?us-ascii?Q?m/tFFR/3WnEjbVvzFLu6y0ZfNfAjxyi22N1Y55gG/Rhizel7AAxFtpyFt+e4?=
 =?us-ascii?Q?wr97F6eVGrV8KgCc1Gr8CBCbTt7/7y8liCBASGALjGGMTbawNqMJ//BBeAgE?=
 =?us-ascii?Q?zmWE/QWdjFY5T5bgGvZQ9aLjfclxRmtDrcwyYpTBxRnm7QBki2GtYZzLKECW?=
 =?us-ascii?Q?0PpX5lWy1CtnKIO16TEt4lNcgO7kAWmOL5JVQd1d5Ml8oSfjQMwJK/ZxyB1f?=
 =?us-ascii?Q?rGGw16a7732aOX16Pj6sGneb0pira4aQo8b1T5qVXZAQX1aFsEi8+vKh5p6j?=
 =?us-ascii?Q?ruBN7Tvo3DtoPX9mjmO2WrYYIYUZSpX9BtcpuipZf7WrpmIbyolCvzPDTthk?=
 =?us-ascii?Q?GXl/9NCQ0pirXPMHqZkSObxOPZ/6KdSteTMSl1c5iMh6MIeNbmjrNskALOeG?=
 =?us-ascii?Q?vluorJSdrjz1SB9r/rninhLQ8ePdSrguG8l4m7fVH41yC2aGx4HRhF8GmDWc?=
 =?us-ascii?Q?OHDPufiJFcXqqe/nEAqG6G9CLCiZ12YdFqsvlvEX4TYFG94b9XXmfiyEAcVZ?=
 =?us-ascii?Q?ew8Irs7L9OrLNoyPogUKIdP6tlT4kdckKfKAt1h2mnxMPkrBXevmogLYlg0P?=
 =?us-ascii?Q?Gt3Hwzh4YMI4DlP9k127sxYpd2NOuXW5P171qrGUfuguYsy0GT4x1y2LLUh5?=
 =?us-ascii?Q?JCO5mbEkcystWxzkRMvFOWlSl/Z0nfDtzGC7qcj2kPAYWMDauS23zxEeygYs?=
 =?us-ascii?Q?75E1mzuGWlhz/MqzzmIRH2S5kaF8d7ePzutRyfJ00GOQIUd2OwyzcPUOIV0J?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7ad5e7-34b9-4528-afb3-08dca92f5610
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2024 02:46:35.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzWkWwI6ibyNEf+AGXdk74f9Jy8c/3B2gAkqnMSW8MavGM1umueZadIPX0c6ek33C9AOcaZqaJZuXhIt61LgGX8u+7mpO6+zZZAYpIdv9J4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4811
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

On Sat, Jul 20, 2024 at 04:25:22PM GMT, Michal Wajdeczko wrote:
>Typically we want to preserve pointer constness when converting
>from one xe pointer to another, but in some rare cases, like kunit
>parameter conversions, we might want to discard this constness.
>Add a helper that we will use to clearly indicate our intention.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>v2: use explicit cast (Lucas)

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

