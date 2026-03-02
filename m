Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8FED58E47
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359710E1A4;
	Mon,  2 Mar 2026 04:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+lFyJ0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EB910E1A4
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 04:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772426443; x=1803962443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GGRhf19MUZa7DUgISq9UMCQrsyR5jp/H4S6+iwUyckk=;
 b=D+lFyJ0kGdVFIaOvWaCGxYkSUaWOZVrzFVcu1hdF4Fln2XkOBi33G11P
 WiMr1zv77IOK9lptiTeeLP3Sr38qVKZdPDw0VJP1SAxJ0jINIVjEcKbp9
 B/XPH5IuPIJwA/kGcwLWJ9FeYhhWkferfPsCxFhjnqSZY+6Ox4KNLAw10
 d2XXIKNdWj89PZCJajGrxTchuTnqUeI+SWyAKUZfdqNJ+rQ/+0KTGu1eU
 ZG8OC40gO1iIPFhPd8H5IAwDRugUoxJyBRBwLFCefedyjOgvn8rKY9l4Q
 3nm8W3d34j3egSv0s2y1plP8PUqDdoioZrSICWiR/NzrxNxnpaaY57UHF Q==;
X-CSE-ConnectionGUID: K6Iin0UqTNm8PzP42XVJDw==
X-CSE-MsgGUID: cWVGouxUQfuduNHjrnRe8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73338491"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="73338491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:40:43 -0800
X-CSE-ConnectionGUID: 0P1eeQWeS4u+dvjaYyZuBQ==
X-CSE-MsgGUID: PNfutxg7QyCMkjdbCtJVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217643377"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:40:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 20:40:42 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 20:40:42 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 20:40:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkSCHpAeSRXMc122H7oldKDKc3l0FBb9qAjAi/AGWzDynwAqAmM5M9gDuOh4houg1GGKPRvAksNZWyiWj6I893UfbTHKed8F6kQqkzOaqhx6oJ8CnMLCp5Vv52RLR34aSNUWqFhjfYbSMttzhTYUObkwyWI4RlSKRo4lEzwm4L2lluJD2M6zhMWMOKGCIOaiMzsMmcZpYmUEIGFrgpc3AQCswmUL0kCjQKVPh8mxDeBi2KiOvy5o/kcEkqPk7zPY5CB56hC8HEpeGJGh+uz9gz/7Ni1qiWGwvBfVIR5+tz57ziNjMcAo8G5eoEtk4IMnvOsUmdl/hEPynn3ZnA2TcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL2R7Jmg9AQbXa0MDI3nbFmUZXxjzjrqZatBhWTCbOA=;
 b=fwovhhLurujK9P+P3c3duiiJdiW4/tb+pS6AZ3pEViFVEIK4UEGuUMKXWJc75XcNxJVDDMEOmFa7ZyE+mQ0D5W03lBA3bjU7XfzkGMS1r0NZirE93ginVV0bzNJqYAZzVDn8KVkwG4x4ntva9OBdwHh5+M9bt3iwNYOqN7tBDdAWbFH7Q7GxgdhwUbvnfof4wR7EFVdvhRDOy+AAbek5yPFt4MChf9bLnqS+TAwulQK86/4KJg0KCQc7IJynxwFrnFB5Svq8RM8PQqrGedwtGf7T/6/wASKrUU5xLB/yFsjOk5VPfK6ksTtAOrtcddaOX8IPDxaVRmdS4pEn5Cswmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 04:40:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 04:40:40 +0000
Date: Sun, 1 Mar 2026 20:40:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v1] drm/xe/guc_submit: Log wedged mode correctly
Message-ID: <aaUUxT84WtDEYfJe@lstrano-desk.jf.intel.com>
References: <20260228190524.3471743-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260228190524.3471743-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:303:6a::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbd24bb-2a7e-4d1f-d823-08de7815db35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: ujelIROsQcjnM0b6TxQWgLlXHIORZ3rcXQvMH8BFVaOQsNYFQt+NxpxRwNGDn2hi3CuIXOqQ6Q+XfScHaCdAhBz86RxLOY9oyFDBKMDmxTDR+C54ZXhgDQaj/wfiadKV9yLrPt5sXg/5mSMIKCmCvbkvWSd343+EdDJr1TQEfi+Iw8O/xYSzXI2z1iPRMxN22Hse2UPObtTjtKFCNutpZAx5z2EyEwuiqoWxM7/go2N4KyTZhgZtlUpsZf0srilqxqBPpLMNEWvm1f9dcZGrQxiZfKgvfQ+YXrimf+5k9UgMY+VDDW6z86Z3qmQhy/SVAHxcZlwWzm40VbqJS49YVb+rl2cbIk4FDObqNIBPsJeToJo1otEu4JRIBbjH9qhYEW3dTJDTKAIQyUdILm8hOU3iZJhaK8Zy8GDdCNEWZUnD1FTEMIWDzCbqZirmCNS3FxlKdFjzHMlXieejpT3Pgr5foYbjK5r7CttGFsFNozmJNkBc7pz00Rl0IHLxoI9ULGuQXCSuZBK1uaHkztu3bfnV716otWsEk5CeJQLRtNA2EetbB8I2yhVE+ATS2cs14uRvuJuHnTZBIvDDsEm/Vm3JN4D+D4tRRxUCEWrsBzv5eQOQ8Yp7K87/9PiO+AsAHYXdyevhfzJlDgaa6otT6U3ITmGkjJD7WX08Iwwvlhzn5oUvjV2sufC81ToCFmXN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S5/XlRhq7d6pjXKL2XSbw5Ah0yYJtbwMHScywyqlLgwz+DyuXoRa6r56eVAv?=
 =?us-ascii?Q?wbgNx4jOuOsT0IB7TQ16IXMAQVvfybI/32d1a+LwOAHWRPbNNRorxZRsd98d?=
 =?us-ascii?Q?ylOn/mU5vNZG1XmqW20VLjCfKaiKENFpQmwtNfDuznxtoAAf5ltV+UmHQktw?=
 =?us-ascii?Q?DYyJdfMZMjAknxWlUHnZwujt5a8yfv6fsjG/lHD/gqmxbzhiJPQTYu3xOBEK?=
 =?us-ascii?Q?Q8Uec9AguPYrt1Fo4HoD8ZZleZoFpVet8G/IF+hb4UnhntBawjrawmnKaiXs?=
 =?us-ascii?Q?owguU9LDlrfRRtH3LHr5st3kolUuo89iFsjvXbLTrMc0wdxBZ3oxxnuNs+MI?=
 =?us-ascii?Q?BdarWeqEJV5ZTK5ngPfOB9xEOuEpQJyLvc6ehT8gizRtZYSGZhWygXN7lQZn?=
 =?us-ascii?Q?9TkEYtfgxSbfl8DFlxZ/NXYB0DORiAbYtFX9g7k6FWNMffQjcDqpOhsyjXli?=
 =?us-ascii?Q?TLsZSEZ1aYTrNVXOf2dieXwO46HwSGM9tBpcwJX84Qc4eU8J81MJ+2niJcY2?=
 =?us-ascii?Q?KEYYCTxeyLXHg/Jkehkzn3Iz+s9K38C3OJy2MbusYa61Wx37KFeRT8L2wDJ7?=
 =?us-ascii?Q?Swd4+6d/UYwBdIPYh/0PqqIu81zCVEmXJoq+69+pO5jut73SpUr4ufS2gdQd?=
 =?us-ascii?Q?KJvWM8Bu3pQPT6brIKpHMccDydmLKT/RbDOEKNc9qKGSyBwB/nVlo58l9hex?=
 =?us-ascii?Q?sFUiva5ra8i/azLnrxQLI8ssnEV+xLflBgQFWprk0ZnNb9wcwAMaWbWuRGiz?=
 =?us-ascii?Q?+PpZedJG23kcYMUbgfYZBddZGHZ7KQq+hRDZy4dqsc9UUD8uCzJCDjC5L2Co?=
 =?us-ascii?Q?ETUyAxNYmh4QlSdwMICYF2CLCP6nDogXCutv6QPabfeluJVDboeGU1sU6rW1?=
 =?us-ascii?Q?DBB8u340hfwFq8vMSdQmZSEh9gtu/aCUe0ZVp9W1a0WhKMIwO7Dk90a38lGf?=
 =?us-ascii?Q?tEP+7p2nJQIBzeSfuUMhnYyw5E9MTPXPRVE/z9/YkMm+fdvqCZ1ii1130h/S?=
 =?us-ascii?Q?qnwhp+yWlaA/ofsX7yO29BqcO6uEEOSXrPituCkVzCnQ7rB8RCOy/UEhvjLN?=
 =?us-ascii?Q?B+P6mXw9HLLffG3+uBCdkR7wSDOaeBxYs9Y8qGFI70w5rXpfuoq1nsNXxju2?=
 =?us-ascii?Q?tCVhSNUUg3GMV+ISyP1X19xB4fy5pwKr1nQKqvjN1JJ9bvp9eadRHNcXH/e5?=
 =?us-ascii?Q?6BntTF9oJOvbmvoaiWE+1q7pAehkDtD3YvDRQRPJ2JerCTH8IInon51NOR8g?=
 =?us-ascii?Q?Z0BSBnybndmyIdTXvWGFjfw71CVChz6T7PxLDXgltCsVISqLcoyo+IdbbsrB?=
 =?us-ascii?Q?uiLN0YWVeRaRH66TjYcoGlnEVZU8PiO5AOUloZUpbsoxnCvdA2EBvbE78+Jd?=
 =?us-ascii?Q?LYHDRYesZ8LDo2ES6SwnwPQmKD3LzJx5dtI4v+t7i+73fqugkS1GVqP5OJui?=
 =?us-ascii?Q?Z8S+CR9T2pORN5bTSNgPMJ856nNGlH5b+u5sHG42sMVD90yUT3ZsHhZAa97u?=
 =?us-ascii?Q?PsOsm2ql0ueNbKSjbUN/xa747al5VXFbnygv98ZQhSiq6ciwV11qaZaV6n+h?=
 =?us-ascii?Q?Ss1dxp7eY8IjEwRazv0rje/gTc8h2aes+Dy/SkFpt4FqaDoAi6nJwkjmmWmA?=
 =?us-ascii?Q?WWanLFW585dKa0923/zXo7tF3RlX1+bcnBiRrcvuag1d8+mB/9G5COAeMS3G?=
 =?us-ascii?Q?mxPrmAXGF2LbzO3clrH8NpS6St/daOk9Zgw1B/VHyped7g3yJh1lXuk9pr/K?=
 =?us-ascii?Q?md36ip7E3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbd24bb-2a7e-4d1f-d823-08de7815db35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 04:40:40.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEprUudmGQjEb9cOmWCke1HvoIpGaQ9pJaIavcxuWbEKt2jswokxXkhdjMwtlZJL/8jlsmsf20HD/GYOcqgDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Sun, Mar 01, 2026 at 12:35:02AM +0530, Raag Jadav wrote:
> The device can be declared wedged in basically any wedged mode. Log the
> correct one that is set in device struct instead of hardcoding it.
> 
> Fixes: 17d3c3365ba9 ("drm/xe: Validate wedged_mode parameter and define enum for modes")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index de716c1fb18e..4c761087c830 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1319,7 +1319,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	if (err) {
>  		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
>  			  "Although device is wedged.\n",
> -			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
> +			  xe_wedged_mode_to_string(guc_to_xe(guc)->wedged.mode));

It is actually a bug to register this in any mode aside from
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET. We have a patch / series floating
around to fix this [1].

Matt

[1] https://patchwork.freedesktop.org/patch/706751/?series=162074&rev=2

>  		return;
>  	}
>  
> -- 
> 2.43.0
> 
