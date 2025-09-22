Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2C6CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 16:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72A10E09C;
	Mon, 22 Sep 2025 16:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKZt1d8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F95C10E09C;
 Mon, 22 Sep 2025 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557158; x=1790093158;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=ea6VsYWa7Z/YgDICbA5Ovelsue9oFIXobJXaW9nm+AM=;
 b=RKZt1d8APcAx3mujf+6HXAdBO04RXPG9btrUWXAhETTxOwFZSyChKwWt
 dDLOr6JHCOU1CEyNr5S6gdZd3beIuICybnR8loqJtxBb7B5TIyfC4PPHB
 sPaoCo7MjTH5KddnjhAs4SBRO6gXmoHoSClatXkH/5QryCB4cSZMznvbm
 J72JqVQoGhsNxCfMURRluzG2Rv0tMtDyCfxu1SggwoPVwtY7p9KvayCMV
 Z+UUxmyO58CRqNoZIlqPxgACuR/WPubRphqzQ4uNlxgeidQUczEuTRrDO
 bD6LzKAVMHeAxX2VLzGw6LlbP2VWC9OWzVvE57jOyueMnE0G6vVoMPBDd w==;
X-CSE-ConnectionGUID: pS8p8FucTiqVmn1SEerqrw==
X-CSE-MsgGUID: HkFpf4oiQ/mbxrHnc14XKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72187424"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72187424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:05:16 -0700
X-CSE-ConnectionGUID: v4GVdKWuTCSDnoOuhq4dcg==
X-CSE-MsgGUID: evzSx0gzTWGq6WmjUk63aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176124906"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:05:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 09:05:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 09:05:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 09:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIbGBxqPz0OlQttgDzjNXeiXbHYUcqMlfJ1oYGwQJw45Ks/PDcTv5dgAWKE9fnQmlmeuoET0fZkRZrZkWekgqt+QsHqf0gouhfoVnlNltqv31sNyrGuE3WzWXlLL3Xjtbw68TXFpDNo6SlKGaEGM+Rqk6P/zycPYxeMsfVkgohqQX7ys2CiDAdMpAf1by5sXho3AwHC9GPNMtt/mUovB83rRtxdo/Ex9mZsC5YKonktKiFOOz1ORrBNQyIuiR8RAD3DroYpsiEhseIukjcO4MqhypvwAOMpVchICmdHYzXUiCtD1E4ReuCgzKLVzfva2+UqwqJKzhKm9aqJV0deFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hg2shmxSomSyZfC8xCB7Zs+Uwy277WHOfB10vCpi8Hw=;
 b=PzsN7UvoZUiihO009+7d8T2+GCR45MbUiOUrmLLkobEW9ahJXIJL4OAGYLsc84pNIXxbBVtXr6BH0a2BfNG1W5s0XmD763em0KBMrCYOdndvLJriC55FXVG6VI1gXxiXt2DNb2jVYM1YdHqwf9we14be03s9QLm5jTRHcEmsiHv4Z1w7cAVgCX9d4VT5J0ub2JgfzPlTMXURvBwCvSQK81cg7nQ59arTvoKF4w93vgCPyQRwakX21R+sjIiciJmS0EfI1Aa8WnT1X40ocWPxuvOe7TrKsGadjV/uiB6uWjRcdQqZLcid+2FpyyCGyR5lA5plSfMinNnp7S4W8HXf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 16:05:13 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 16:05:13 +0000
Date: Mon, 22 Sep 2025 19:04:31 +0300
From: Imre Deak <imre.deak@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e_fo?=
 =?utf-8?Q?r?= drm/i915/dp: Work around a DSC pixel throughput issue (rev3)
Message-ID: <aNFzjwViWnPHjOMk@ideak-desk>
References: <20250918211223.209674-1-imre.deak@intel.com>
 <175855614562.354824.565057761427346128@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175855614562.354824.565057761427346128@1538d3639d33>
X-ClientProxiedBy: LO2P123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::32)
 To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: fd79e412-670d-4e1c-2d94-08ddf9f1d01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uNE+StPKRCdOguFm+YUgoLoeCc0to3Sq/IcdDKX0YpRNMjRypUw4/pESckH1?=
 =?us-ascii?Q?tdZfHhhlOAGmk8qOCvjaLX/rR3UwYTWu98wI8wi57r/d/RQNrBUEGuvlrS6+?=
 =?us-ascii?Q?ZHNpw1H+xw+sZzk1prjmLyFQDgOu5A9VzxjRJ28XCq2oMzP0KdCtw0gYI0BN?=
 =?us-ascii?Q?upWG5wl67ww8SmvVVJFvDnVzUW0/0Z0fB3cd0ZqngrXgRwQG9qcmgvQuYFxb?=
 =?us-ascii?Q?0ZkN+yi9+8VavPk8xo41rjszg44/L54QTtzpYu/wi0mVEoCQlpx5l1DAcpnd?=
 =?us-ascii?Q?MaCiPCoK2Uy1YwnHXwC7NCSbd1+4YWjaxKMKjZztncgbO4dd+gfyPZgse/wB?=
 =?us-ascii?Q?iWwJiUTV1IPbfwdxbB//Zv+IM053MlItb1haisC7B83P7c/ZRJCfCFtFeJrV?=
 =?us-ascii?Q?yrcZ6s/GCgdY5ubOAYuExq1+Xje1nRIVJvyIhST02TWZxvlwKki6qUex0qMI?=
 =?us-ascii?Q?Wnbnif/XUL4SxKCAvdjO++nTPc05bf7JzxwWDPbfU8RbBRsoud9pOzpt1niW?=
 =?us-ascii?Q?L8KILX5R1siXaB3Y3RkYehEpkhBh3RajkXiHZarS1pFX3+so+qJnYlBGDQrD?=
 =?us-ascii?Q?yYBl3oNl0FikfXqiHtr40D5Ofoyje96xBtFdN2VoIMS+4p4BdTeraUpKD51j?=
 =?us-ascii?Q?1cqWxt/uMri30iQgKlrYAmxkaRtlPXB4vrFnBa8J4fMx/rLfh8y8OwOxkzdi?=
 =?us-ascii?Q?PS8QKkFvwNcX0MD/TjwnaGJFdNYpdiiLTecpwwbxnblchiM/gMMDG3SUKaOK?=
 =?us-ascii?Q?9SdImIcWqPcKsAuiIibh9BbZd5AxuxIDiF6GbhObcXYUnwrQrf9XZ04D6Tai?=
 =?us-ascii?Q?JC21j55lfluWrIusmI8oDV6+awPGbNRT0xSd3MkbvzDAVTB6wfmpUssb+MWd?=
 =?us-ascii?Q?+H/ltfL7oKMq1mgwR6Zv02mS9oPAqb0YPqDPnv0+7ccsyahzYQMydod9HRUf?=
 =?us-ascii?Q?jOJ4VyJBtbaTCUXkDURXZVH2Q9uUSGk3/kS+TjODQDFyufnXzbWzG5RPgbN5?=
 =?us-ascii?Q?/UEBMXheV++qncDpk4QdGmgO7DmqfbTHVSVBFGHUUP98xdV3TqS7oFpvlRIY?=
 =?us-ascii?Q?LGXHSvlsSU52PfL3W1yASExJGEUqc1tnw2Jrao32Pk8UDIPQ0OGBPUFQZXZx?=
 =?us-ascii?Q?Yh4+mD7Zx61w7Rbwy78OYwMfGzxpK3bWffs3WV3+eg+t2907PRtvqBliImm/?=
 =?us-ascii?Q?/6/HIsk7/pBjdQKvdZx1pk/rS/9rZxjQA0fzRmmC3+tPbiBEh0JGKzlEFRmp?=
 =?us-ascii?Q?anjMamTD7TvYsMTukQ4ihw3mTxzhz0zvE7xLG5Z+z/+yfCyiSmVD24UOteEZ?=
 =?us-ascii?Q?oI57Xlk2JHsMKAPzWac3r0yIAaPxgokVMONt3/ifm3FgRATn2r7NCHqtt/sO?=
 =?us-ascii?Q?0YK8QDUx8RNt5Q0uvTsGDEbcDA4D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lx1pwU05Br+ySXgZgiWF3WDN8wtxB7bTmTfTqBfgG7SoPDVVH0S95UDr5WL2?=
 =?us-ascii?Q?VKWV/X4sDUbTlADPL6kl/xDP2L4wnE+nBENEJ3El1Xqshs37prmpfcBgO7gF?=
 =?us-ascii?Q?MYLMkS9sJ38CAW+JsAY7ExP0ea0qdaUCuJn/YT+MHn7mDTxe21dZxNI7iLNO?=
 =?us-ascii?Q?biUnboS9kvGaZRfVeUtgsv4xbWanU8R7j4ZUGzr8tGY6qVzafmC+zBzmRQiO?=
 =?us-ascii?Q?R0SJ4c/0Ggh4/vuItwJhr7RQyVT/tkeWhAC3HDE7DyBkp35hmoe+B9HHjqlx?=
 =?us-ascii?Q?IdO/9ZNeeZ73hzvmFYGHkQ9KDiPm1SjEGn2CY6n4mw2nHbw3xhszLJcw5E8S?=
 =?us-ascii?Q?mvxewC1UXR7ft/I647qFNBaB6DIt5jAAXnIosZzeUtSsXX3hIoxgccDlg6Yi?=
 =?us-ascii?Q?I26nbQdpR+d+VDskeHyJwSzauAKTmp0Pp6Rdc+7uFGTYf1wu8xU39wrzLeVl?=
 =?us-ascii?Q?pDntPKHS7v9WK9F781ys5/mHwxC1bcrsTrTMSjWXdFcU7Nja+3ag1eXcYUcA?=
 =?us-ascii?Q?WFCaNl1bRbdEPb4Xg657xqH4nJOEmuTS/AMFi+5HUttWxWgmR33eJEOJOwNi?=
 =?us-ascii?Q?GOsd27dB1ooEw/1ptv3WBXSQIz/ZQNT6Dqbf8JPOMPf04IXDGdzt1nIGdp1C?=
 =?us-ascii?Q?543AGIiZOme6ceEeAxZ8Ch7bnnc36qzzAkQfEOkY3Uf6G1RFa5fb6t+h+6BD?=
 =?us-ascii?Q?q+dJxGYHTYHBuBgJgVIH6IeUCeIoaiMpMRo47tOQO4EkeXZOSRDg2AAT0VHt?=
 =?us-ascii?Q?nXi4IJlMxICS8CD5FVfM209w9YjpPDAkYDeQKdtuIoRWs0uoLMcmnmH75kMX?=
 =?us-ascii?Q?m02iplqzjxer3lQbrAyPMgUbrLqbcdXaLAHhD+XqwTT3CGYvv7nid/btCBtw?=
 =?us-ascii?Q?jx1pqD6XIaNJsO4y16p5xzRnjGBgnxnJiKx2jfCsNeFsvIH3joCQlvNX2qjh?=
 =?us-ascii?Q?PI5YO7v1yRRqyV8zwN1bNi6/Y/FsF60rSa6qDXfvNauv0bPDlWN5fkL1gwuR?=
 =?us-ascii?Q?t4WlPG0T5VcPJzJJ7j6e285gL672PUrH+GH3R2qWlixAJcR6Pb9udntgtcRG?=
 =?us-ascii?Q?dCfPok8S/ps2xZuhytNwn0sTzeehuXEOqhmdJKm7uroT2ZGDzVGN8LmHwftG?=
 =?us-ascii?Q?4A1mDEPBgALAa92dw/wCtR31MdMbi4tgNPK8w7UhUZUy/o3Nfm2o3f5aU5WH?=
 =?us-ascii?Q?3L9gQVvQ2dd+eR5Fq5zYBGQP547ttmQ7OJwzhoVh8lRzAxFDMyQODSNLLI0O?=
 =?us-ascii?Q?44RQ9oxVBN+QEAAmzYO2++q2KbVwrD67xGq5RLVhEFK8YeqWkDammS2c58hw?=
 =?us-ascii?Q?I39EGeduC/txdKn4h0Y5DEXOhq0ZJFyGNIYjOQaqmpp8HzsToLw1KLRjd41l?=
 =?us-ascii?Q?mE2AJ4sPaxNVLDFIVWehfpgDU/We5GYpU/eDtEQUryZ8ALehGcWOSWSMxhD5?=
 =?us-ascii?Q?+8AQurGGmaSZPx3nAGuBSSAS0Q5Qsow7RUjZcIao28c3jysziYLMKxprZYLo?=
 =?us-ascii?Q?Yiq+iJ42imwZvi9/UrQAFe/uMlKo0DHcCP1M6Yxy00vdBLTMbJKRbhb2Q3zV?=
 =?us-ascii?Q?QcgDn6AYVWywdvmYfCI5vZfv/dMq3CnPws0EJnQVZj7FLnRYbYQ6iuqObfI0?=
 =?us-ascii?Q?TlVfVmkumRrNAdUk/pkpF6UQm9pZluLojY3TwvErxwpO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd79e412-670d-4e1c-2d94-08ddf9f1d01b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 16:05:13.2007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEH81ZnWTYFZVAV3mUDYJ53yZVRJmMiNgqm9EC0DelNAUeMSDdER4yTeARAgGaqG1LSNvSOvN8AwvDTzn79I3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 22, 2025 at 03:49:05PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp: Work around a DSC pixel throughput issue (rev3)
> URL   : https://patchwork.freedesktop.org/series/154737/
> State : failure

Hi CI team,

could you please re-report this result?

The issue is unrelated, it's present in base-line IGT/xe testruns as
well and has now an open ticket too:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6201

I suppose the cibug filter could be simply set to all platforms for this
issue.

Thanks,
Imre

> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0_BAT -> xe-pw-154737v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-154737v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-154737v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (11 -> 9)
> ------------------------------
> 
>   Missing    (2): bat-adlp-vm bat-ptl-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-154737v3_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - bat-bmg-2:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154737v3/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - {bat-ptl-1}:        [ABORT][2] ([Intel XE#6201]) -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154737v3/bat-ptl-1/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-154737v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-bmg-2:          [ABORT][4] ([Intel XE#6201]) -> [PASS][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154737v3/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#6201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6201
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8546 -> IGT_8547
>   * Linux: xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0 -> xe-pw-154737v3
> 
>   IGT_8546: 8546
>   IGT_8547: 8547
>   xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0: c4d19320a0e2f7d8dec97d4a59309349a3a63ec0
>   xe-pw-154737v3: 154737v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154737v3/index.html
