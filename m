Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E961ECDB481
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 12:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87BB10EEDF;
	Wed, 24 Jun 2026 12:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFVALaGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EDC10EEE2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782302586; x=1813838586;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4AbKOLIlL3+kXZ0NXIc0ZfCIeJioI5+/SW4lCC4ehEQ=;
 b=EFVALaGdMiYGljwCKOCpRJZ8QmaPl2lHwM0D9MOQzm9gkrH4rbKD6QNf
 foRxRQxJSxaxrG8DS5VJJgaxONKeGKk/gv+UYSs8zmU6JbS0tLcs7qxP/
 4L0vFShViZfe/fhqYl3cjlOrdZ+02m3UNehjqqWV4fTW+tu2AEBm9zCVa
 smbjrtvQjuMa0wNhckv+wtGHraaCeK9nkgIaapaHLxlirJsAbis6nTKfi
 WiepUPhc9IrAM0W1d7/O9kkgWojMJRbMw/NcV8dmgO2KOywIN0dr76pE1
 F37s4iTTg6M5N2lh02B9QuPh1vavbnM9K6Y2+ahtJ+kS7zLgGV3kqrJfm Q==;
X-CSE-ConnectionGUID: gZd7TDtFSe68JW4ps6XUrQ==
X-CSE-MsgGUID: h8EN9QNAT92BWX/jfDO41g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94551900"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="94551900"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 05:03:01 -0700
X-CSE-ConnectionGUID: nFZXbFC/Sc6gytzQjaO6Tg==
X-CSE-MsgGUID: xZeR2b3ZQQ2C8Jc9Ay9wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273512442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 05:03:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 05:02:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 05:02:59 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 05:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/3tY1hUbMhadaH3Xqz4HGKW3t1Kelp9A6SadEG2uZ+VtDTsX2zk5YybeVLdFtj1IJEJAOxoYNFP1AJVdWOXKibNvVMwCBGVy+kb0HcieVE0x8O63H5gsdvY0Nc9CJOqs1Jktqi99IC1AZZoegUgb7McUdx7Hki5dvOWeSXRnmbc1RO8qMxnmTJXV/DEeo8DlYb8ZdcPxg2Y2ZVgi1T4QZF/n/AEIzbRdO/9zz7FngK3QtZBvfEA3QMCsn5iWPjY3O+KwqZKdtAbQgr7USPBCInj2fovX6zEEQxmEXXSY0x6/hGE0Y+FVnVfQYN9NAKE5jXzzI2aYxQNq9iIoqHwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCyt51dJDB2vmeXxVghNhGO9mnVETUcGByRuztdLmsU=;
 b=i091Tv6WuwVyajfmz78kzubMHZxMJhelA92LcavkN4YVwuxiigN9LmUOqpQRZU3QQXNfxMW9I7kY77M6vqWYnoVD178B+j2npLl6HSmSWctFS2yKgGeNg++m/PnR39Aw8c1oynZBI2jolEXATPPcOr/Te64JsQfKXi9I2iMFJE3y+X+fM4XaeBBFheYMmIdn3DG41eZg6ISpfgUn702rJNyjDhUVcSss94AbKmfBvN9I437UFH+y3UmQbKV3PmH8r7wNFMAviZZnAg8prHca4cDPgZNQ8SMaJqqL3cX8h3azpyl4O1yRguYEGIKiWl5S2A15ezpHg1Uj1tITWyxtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 12:02:49 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 12:02:49 +0000
Message-ID: <19187bf0-1cdc-4e85-8d3f-db5893c5bbcd@intel.com>
Date: Wed, 24 Jun 2026 17:32:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Add the definition of VF resfix abort event
To: <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
 <20260624095634.1250956-3-michal.winiarski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260624095634.1250956-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cc4e1a-1f29-414b-37f0-08ded1e882f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: lbvPTPrQdY5nQOqIMzLo8QKfe1s8u9nRSzRRAW9womU1dcfg9cboNdvyiWZDQBKd1iPF8CmmfH/xwHSjS1pmOEboKRLmnfCoUaiJogI47Un29SdDsXhL41vjm7P7EvjTm1YxNm9ZFhWk2tXELIcYBhl6axwlCtFx1sRZiiExWQES7MLPgn0Rx3KyvL8Gg0pjtEDl6J9VXuPE4/VOqyxBgwKJVX7rl7C5BW6tayYMl06LnZd4f5i+0t4ZkxVhHFXrQ2q7JGufvpj970ofj5thIfUEqDNetJd+UtWS8x3EdoSnPg/VQXrqPMMoL/eNtBF3VIUCkhdO77sxKCttacVBWBnkeTCAEcYBSx8TXTjMPwaB2VJLK/q4meH3hRSSFWsE9apZFouQ1QxSTfRYlboI8hplIueHXYTUpWluYNmyKXFXZ9PCH0vovNyrcxFpdBtJ8C58Y2l5011M9XfIe2vl8YTBP+QNJM78oys/uvgzDrl5adCktTjBej1Nw4UQE8uITqcgZjqKchitSSE20ZG/DkI57tDf0Pgh6LyItmdnsjTAq2e+LE1ixc73b81I2zamFLG0aBpVr5wp8mAZBDmV5uow+14WVCAu2+ObSY71g2mlLFktYcjeh5q1PamRYHM5Kx80C4/8nmad6LZeFSrd6nfLKP2qoaDGV31xedSlfoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVU0REh6bEYrd0QyWGRhNng2TFVuUTVzRkUrdjlaLzdqSFJSbjVabEl6dWpR?=
 =?utf-8?B?TC9ISTRSVEl2a3VRdFlTWlFaSkRyRXFteUFwblY3Y0N2UWJEU0YxdEtBcURX?=
 =?utf-8?B?TWdmWjNZMzRhb1dJK0xWVnBMSnpXRXE3bVRBK0h4L2l6d0taTkhGTFdxc1lm?=
 =?utf-8?B?NFJLLzBndjcxRGJJWjN3bjM5a09GRy9lcmNkQ3NNR1VHYkFIaTFCd1lxeXJT?=
 =?utf-8?B?RmRiYmY5ZWlRQy83RDVMcGZqQktJeHFtbXVQQUovVk56WWorVUllb0J6UXZG?=
 =?utf-8?B?T2lvSFhORTRpSEd1SWF5TFhkMkZ4WlF6WDlBVks5WmlYcUpWUEtaZTNoUTBa?=
 =?utf-8?B?amJiVDJySisyRzJtN0lxejFpeTlXNm5jRzNvZFlUWU5KSkswVnE4dzlQSmNx?=
 =?utf-8?B?S1J5RFF5V2tQTFBNSy9yOGVEK3BTQ1MrSHgyTnoySi81TjJHRFJ3ODQ4bWRY?=
 =?utf-8?B?a25SMGdWcGFoeDVSd0FjU0NaTENVeHhRMXNHNjE4MDRwb28ySWFCaHMwTmhY?=
 =?utf-8?B?TkxjTGhwcnRkQjBHZUNDakttN01VQXpBVHBUVUtkWHpxS3VlT3Fpd3Q3VmFF?=
 =?utf-8?B?VXB6RGNQZjloQ1g0WmNPaVRTSnpSMlRqWEJFYmlqZ0tUOVpQUkpSUEE0YXBJ?=
 =?utf-8?B?aUFYYVYwQWhUN29hTXZVQTZ6aThvRlBxOVRwVi9taVRDaEhLTU56cWZ1SUNP?=
 =?utf-8?B?Uk5wbnM4czhxeHZ6cnc5OVFBVEVGWklHUVVhdXRKZDV6SStxemxCd1lqSUk4?=
 =?utf-8?B?TVBlczFPNjBZYnFKMjBiYlpLR0hrL1JGcUxFZ0xRZDRzOUdNRFZwU2t2NWRi?=
 =?utf-8?B?ZHYySkkxS05BdUhnYlE5WXpRRExjbmlPTldxb25oVkFtaE4zamZCcjNMdWI2?=
 =?utf-8?B?Y1Yvc1Y2Zlc0RFJXYkt6TnhsV1RLeFJwNTZUK0xLanRSYktFdXRzUVJraGQ2?=
 =?utf-8?B?U3BhVytuenMycndqcUhyWDBuY1dVcmRaeUgwWkxmc09HNDdHaXpyYmhtT2pG?=
 =?utf-8?B?aUlEdi9uMGRXZjhyV21aeTdPeHhiRHg1Z1pkWlpqd1BjOENkZjA2b09WM1pI?=
 =?utf-8?B?cGN4NEkzcTlvZDB6bjFJSUNVZ2RwMWdlMEhYdVgzUzlDMzBBT3pPZ2NQVWlP?=
 =?utf-8?B?ci94UDBmYlJtbE03MGRrOSs2NWlIRUF5VGszYmhVRHppY3l6d3RmS3BPQ3V6?=
 =?utf-8?B?cW9sMXRMeEpUayt4V3lCV0NMR2tNSVRQRjB1SjkzcmJvY3NabUF0Qko3VXlm?=
 =?utf-8?B?S1FNSytZcWZMbGs3OHl3dzByRU1IejVmQXVmWlBjbDVBMlRtaVU2L0c1U0F5?=
 =?utf-8?B?RTdvMXV4NUlHbmhmYXlVRVNabVpUTXdobUZoYXMvMmIvMU8xMTQ5WG45SGw3?=
 =?utf-8?B?amFvbTduT3BFdGJablh4UnI0cWg3cHIycmxOWmI2S0NtaFV1ellrQ0RtdkVT?=
 =?utf-8?B?dWZxMGo0Q3lWUXRUMDBNQ2hEQ28vUHpQZWxwRVJhNmxJT1pHSHBnTVh6Ymha?=
 =?utf-8?B?REl3MUNmR1JremRrckUvRHhKNDVacmF3bms2NmF3eVRabjl4Y3pWc1MvbVFw?=
 =?utf-8?B?ZWdNWFluVnFEM3lxamVSeHdyMS9rTXdZcHBWYUhMSUF1eTVjWHBObW82M2Nq?=
 =?utf-8?B?VEJVdURsU1RKQ1dOTVFOVFVsTG5JZDYzMWZMajdkenpySFgxV2dUeU1uQ3hR?=
 =?utf-8?B?U1NxVkI2MVBRcXNOM0hoT2h2Uy9nTzkrWTh0TVd2L0Y0ZjNyaHcvbHZnN1Nv?=
 =?utf-8?B?dWZia2VtZXhTMXg2d0pXSTRIUWhUY0pvOXh2UTJLZ2pwTHgva3A2TTc4SC80?=
 =?utf-8?B?cDZEOWJBZTRsaWpNSGpHbEN6MUU4U2J3NHZuWWpjd2Nhdmh3Q2pWRk9lVk9G?=
 =?utf-8?B?dElrSlNSQnZQV28xdlJ3bEdtcHQ1elRCVnluQ0dENllGY29HbWswMVI0T3RO?=
 =?utf-8?B?VVdYQ29VMkVUVWcwZmt6dFh5cjBENE5kQng0UCsvNG9tdjhpT2ExRkdPM3Iw?=
 =?utf-8?B?aXZJSWhpci9OVEltMXlEN2dsYlN0a0lmNG9ENnNLdWpueTFXQ0VBNWpCY1pj?=
 =?utf-8?B?VmVuVFB2QzdRcS9mS003aEtuRkJFNkdxWGVkSXgzdC9INEpzdlFLRW1tZjNy?=
 =?utf-8?B?NXJRc0JtTmE1bkVHVXdGYUZMb3JDUTBObFFsMXY3TWczWkxHVEc0Yldvdzh5?=
 =?utf-8?B?M1pSZXpCNExTMGVuZzlyVXpqQm5TRis4UTFHNkhpWFRnQnlNSkdscWlLVkZQ?=
 =?utf-8?B?ayswV0h3L0xoYVBLS3FPNXFxcHNZY0tCd1hvQVArTjBnZkRtSkxzdkpGakR6?=
 =?utf-8?B?OW5pVjdnY2NwQkRBcElxYWNhbVc4MEJIYXBjdVROY2Q0YzRuUTlKNHptaWw2?=
 =?utf-8?Q?qxZ6yKGxoTq/ooBg=3D?=
X-Exchange-RoutingPolicyChecked: Mu37nKgk+hx1rVwqXl5UnMHVZSo+kkyh9TUE/spQKxU47ZlMQw01e2IDTNlwXB+KpMfIMSTYT7ChmB/Vk86lAzCBkKL6L9aVHDUKtDixNBggPz5BPPKupo9Ap+Q/UTbapc3b1/m+dXuj2AaF7lX9iLZqTupvUsv2aCQ68l1FtbO+AEUMoq1091+Q4CS2FvjLwOo0ROr+XrMa9HSyI4QIqfFL+wTQF2QVEzZseaUvSe0MUVbKwUGv2r7KLey6Utrm5HECfPofSmgB1AbAjJpvfXOxJGT+IlbRYrAxuDJCyfBkRd/Roo3NS6ZeYxEqeJwyGEBVvaA2YOHSvjUs+3gayw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cc4e1a-1f29-414b-37f0-08ded1e882f7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:02:49.7176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQoKL12k0KY2iCMWfioYscijoloUyThDFzpmxGu/bnQ4TcRRB/7zzywuJpNSkg/PomgyioNRfR+AhYNPcg8y6iXifXUsroIeTrp4o77XFag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
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


On 24-Jun-26 3:26 PM, Michał Winiarski wrote:
> The VF RESFIX_ABORT event is similar to FIXUP_DONE event, in that
> there's no handling required from PF perspective.
> Add the definition to avoid the "unrecognized event" message.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h | 2 ++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c    | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 8665b8c5b7336..59c52b7c21ab6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -230,6 +230,7 @@
>    *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_DONE` = 3                       |
>    *  |   |       |   - _`GUC_PF_NOTIFY_VF_FIXUP_DONE` = 4                       |
>    *  |   |       |   - _`GUC_PF_NOTIFY_VF_PAUSE_ABORTED` = 5                    |
> + *  |   |       |   - _`GUC_PF_NOTIFY_VF_RESFIX_ABORTED` = 6                   |
>    *  +---+-------+--------------------------------------------------------------+
>    */
>   #define GUC_ACTION_GUC2PF_VF_STATE_NOTIFY		0x5106u
> @@ -244,6 +245,7 @@
>   #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
>   #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
>   #define   GUC_PF_NOTIFY_VF_PAUSE_ABORTED		5u
> +#define   GUC_PF_NOTIFY_VF_RESFIX_ABORTED		6u
>   
>   /**
>    * DOC: VF2GUC_MATCH_VERSION
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 82957c596b683..2762fff78f113 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -1986,6 +1986,8 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>   	case GUC_PF_NOTIFY_VF_PAUSE_ABORTED:
>   		pf_handle_vf_pause_aborted(gt, vfid);
>   		break;
> +	case GUC_PF_NOTIFY_VF_RESFIX_ABORTED:
> +		break;
Better to log a message if the event is not handled.
>   	default:
>   		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>   	}
