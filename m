Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB4FD39421
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 13:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D78610EF7A;
	Thu,  2 Apr 2026 13:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMMRVfOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C24610EF7A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775136614; x=1806672614;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/1jfhftNTeTti71M6dFz4PKrtWpKXY/qFDnebWouXb4=;
 b=XMMRVfOy7RgVBMKFnqg8DPLuyiai6l5dMuDd5f/k9ojx309NlgR3ZZki
 JuP/FpQuaLsgfViGsFU+a4HMxZR9unhLjWLyf3IkRfJAjQ9nq2TUrr8eE
 2pUYl+NjP9IU2P2ml4oBrIUF6R0P1e58azy2HDehyuTwAV4ukhB4u9jSP
 AoDjuGIVUehjWZ2pnXgbYz3gTKO7I/rEQ7hwvuBBjUY1oqbG6uhIcHCfP
 5ZmeIREFQF3bhUksKAFZVP74eMGNb+iAN8OfFksWrFZrX3mU+wvJo/+pD
 ZO1Bue4i81NlZxB47DTsPMRki4qIo8nhOWa/QCzF13kfeyOBI5KkuBgPe w==;
X-CSE-ConnectionGUID: kPFN1Wy/QsOpuvfzVvNVVQ==
X-CSE-MsgGUID: WMhfOlLaRpe5EyQDz4YMvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75234664"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="75234664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:30:13 -0700
X-CSE-ConnectionGUID: my7mqpsoTrO8Pre36vEy6A==
X-CSE-MsgGUID: cti781GBRfCkna3RPKe9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226945765"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:30:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 06:30:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 06:30:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 06:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVibmreyhRmMVRnT6NsVG3rrfv4K6VUesdSY9ebFKzK54sFpFhFzqk5VJBSnBJzWMYfjKPFHJCErFClqUdin/4x3YK+/GTd9T7a1DTO/4TXbzWMKf1CJD4ZQH5eOYVWUY4NsHPWOayV4se04B7b1Jch+8DnMhPkEMqf4QmfTR9UEdHrC3Ly1WdrPsi2FcNPeR4Y4WVd0UZUaPb5/2Ubme8rHlNh4EWOJBwTy9am47xxfMFvDFV62AQ5GP2Q97ldGrxVHWe8pO5VUmLQcNx953FEpQ4qPu7iICnt4kT8gjnC1R6j4/RJ3KKL01zPqDRbLxFRd/qgEHbIh8tUoNMGsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dl337dKrDgeq9NCq8XXLpk4taTAJdoEB2boXmX7Bt0=;
 b=J5v5OWtFBUIZye2Svw2UswMwhSbCcyeUXjyfooPgcCuu/89C4mL8XQ+9B2hizH4X0T9P7w+0pz2O1CFn3xnvlTAvi7Lar08QjWvHqiJbbR4m9lp5zCDxGJDelbjzcKneUibxx00eu4f4CyTi2Nk+9ssjILT9Bpp1jgGobnWCMxG8xXap5IB3YWoasHabjEETb85luYHqFYh86whlAkofj5l7McySnd0pfGC/eGzq0YdC5BgB9OpBAoHN8JQkgsPeEbWvNj95QT+LIL+alF91wBGXw07ulKe1aKAHO5YY7HcEuqBp5sW20uXYzVDqNzdzEOBn0ut/TLlGYhT2TxPTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CH2PR11MB8778.namprd11.prod.outlook.com (2603:10b6:610:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 2 Apr
 2026 13:30:09 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 13:30:09 +0000
Date: Thu, 2 Apr 2026 15:30:04 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/13] drm/xe/pf: Check EQ/PT/PRIO when testing VF config
Message-ID: <20260402133004.wdqe7qougwbzujbf@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VE1PR03CA0001.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CH2PR11MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b4a508-59b7-488f-c78f-08de90bbf5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: VnPKBIBAk1mOB5MzgJMMNmQi38hd6xjkKfXhcFHmgUSUv8G5AUag/Gi70aGMI0NTmqGKIIMYlmv8+ac/PIFNmWAa+/pm5QaZkkqhprWlx3sGwY9DZ8h9Rq0GRI8NWEr3ZERBsrOKzlaXriOU1WJ8WFQuofeSVoQhI96dJN5UM/dcy3O0+q6BxVTFkFuygFb4Ps8xVHvUArWmavSE3Cv7Ziidm8pzsliJKDXqNL4IpvzRgd1y85Pj2Pizc6XA5MQUp1xOaYLHU3dZVKtSoeFvJvxlDeR3qr/1SpPKeaTB46vuEcJ4VRHtiiCsLp3Qou+vip0kZ/O+2cyyMG29bfRaFO3YhyVslGqaYdSEScIMLILDaLtcZZUD3Oq5Hh7L079t+O36l4F9M0o6iif2SmjaKsa0AnuLz6BAOmaXymals1EIxl94E3tBKNIF514L4iUWoAgB/R88gWgCYeq+TyXyIWTp00+vzlYYl8hu33q6EQiTcfyr8vUn9VdEDMeJ4WAZCZ8fEOZFEe15pWbhXX27GJEA+VMzcDdrjm8D/jg6JhgS0IkGSvAN7fYQcdKEU8nEUOOeH3Qdhxve9KJEizSPy+H/QApSo7wR+rDX79b9/Ce12bC/069TeweO/0U+EUG6oXLI/g7x9HTw8z8VzEGiddrB1nUVMTMiFZqF4nmD83IPXsF8yyl9AgnW8RwHoGsPys7eilQi0dQN9U9S62FIPRZi5+5dsfbgfZUgKTvdMQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW91aG5FVFR6bHVnUXA2VDRUbk5TVTZSNzh0clNQcndWRlhEVlNXeFJVTENX?=
 =?utf-8?B?clhnRzFtQ0oyRThrQTg5bjRlT3NxWCtTbDZTMnFMaEZEQTJpQjhsM2Q2dHVn?=
 =?utf-8?B?czAvWVl0Yk5oK3hwZXNHeGtNOVNjMHE3N3BjU0J1QUMxK0lscHpLb0NsUy8z?=
 =?utf-8?B?akhwcWU4c2tmT05VeXRjT3RHNllnak9URFI2Z0c1a2RKWXdkdGpVeVF4V3RH?=
 =?utf-8?B?ay8yZXl6cWdKS3lia0FuRmxDdUFaZlpwZW1UZTE3Q1BvT3RpRytuMUdobnQ4?=
 =?utf-8?B?VWJNRUxNT1pqU29VSWpqWDI1Z0plS0pvdFJxYUtNUUdHTUhldTh0VGhBTWJp?=
 =?utf-8?B?eG5LanZxL3Y4cit6eGlmV1dNSlp5cXlVVERudStkUTdkK2JtTXg0MHU5S1JP?=
 =?utf-8?B?YjB5enBvL3daZW43RmxYbFZ4S2w4Mnp6dG9WRkRYbkRkS0pCWVFEekxzSGF0?=
 =?utf-8?B?L29uaS9KZWN4Q1h3OWNOb1pIKzVoaWZzRHlpempGK3grRGhkNTBKanlpWjZz?=
 =?utf-8?B?RUpFWXlUa2RCUnNmckhDQjNiU3BITmVOUGd3UUgrUXlLVVVDdDFycHV6dEdw?=
 =?utf-8?B?RU5XLzhIMmdlK1hVbTJTM1BGNlBUbjhyQURlZ2FpVUxSYXJIZ3FxVUR6NXc0?=
 =?utf-8?B?Sncrb2NOenlBWXphL0dnYnVKZ1Y5RW0rY3MwK3dZZ1UzTTZPcFZvWW1zdVQ4?=
 =?utf-8?B?VjVyYUN2b01nRmtOb1EzWGQxYVh4aTBNaGpGc1k0RlkwWXhXR25lZTlkVFpw?=
 =?utf-8?B?RWJmUmVQRGQrazI3NTdzMUJaVW9Zd2tQTDZjUlBkaEVSTUpxdzYrcWFFMVJK?=
 =?utf-8?B?YjI4Z0JZN3E0TzdWdzdkL1R1V1VYNHdnd1dhRjVpUG5WY3N5c3lJQ2pBcnNI?=
 =?utf-8?B?bUhIMWhVbnE5RTNPdWI2a2Y4L3N3WEl5RnZPOVJsOFo4YXBZUTVBbms5Q0Zv?=
 =?utf-8?B?RHM3TjlwNkRtN3RVbEczcTZ1cXQ4WHF5eVcydlVrSlQ0WXNsK0h2bXJVNHdG?=
 =?utf-8?B?cmZ1bHVZMEhoL01GUnBSYTdKVEowUStSMnpEM2U4NUs5WFplOGNJb0Z6Z1Vj?=
 =?utf-8?B?a2Fzbkp6NVlsSGxFZU9zRjgxcFZ5NTA2R1FoRU1iajgwWFN1THBFSkxHbkZp?=
 =?utf-8?B?WjdmWmhRR2tWdUk3aU8vc2VrMnE0WkJMUGl1clpyVUJ3dkMzQmlXNmZNTUVQ?=
 =?utf-8?B?ZFFWR3FtaWZBWlUwYkFOL2hpQ3ZaaUVkU1N3clBNcThKVWVhRUFSYVd6czg0?=
 =?utf-8?B?ZkhKL0l2bDlBMVA2c1QzS1FiN0d1dnVSeXUxTmtSeEtWVWhFNEplQ1RYdGlK?=
 =?utf-8?B?cUlvSlAzaVlZTzczcTZQcXpuV04zTDhGTng5MldXV3EwcFByMzkrNERwdFY5?=
 =?utf-8?B?YWZpY2huczd5dUlndTVMTEppd1hWZVhoTnJSeW55QU9ra010dTR1N01SK0dO?=
 =?utf-8?B?VnlvVFlsK2JXT01JV3hSRkFWRXU5QjJ0NlVzTWNwejcxSzhicnJlalZGU0lH?=
 =?utf-8?B?VGVTdmY5UmFZejVWSld6VkxJU2czZVY0dW1pcDY1eSt1a0tBeWpPQnBBdUUw?=
 =?utf-8?B?S2tUOVNhTW90RTliY2IyMzVUNXhqWkhuUXB6aVI3bXpSakdjaEV5Zm1nOS9J?=
 =?utf-8?B?Mzg0b29JeVlPeVFMT0J2anF1NzNTVGEzRFhRWWNWVVZlRG5odWlNdHp6amE1?=
 =?utf-8?B?QlArVmczbmx1TXM3NjlKZVVhR1hqbCsvRGhCUXhUL1ZOdVVRa21OUGNpV0Mr?=
 =?utf-8?B?VDdDQXR0V1BCS2lOZlRIRXRSdGNYbEpKZ2F0S0J2cDFQMmZwZUFBK2UzdnVY?=
 =?utf-8?B?Vm9VNWtLOXc3WmRTRC9ZT05rTWFOaHlncHV0OW1SbFlocUNPdlcxT2tkejhH?=
 =?utf-8?B?NmxnSXhUQ2xHeVlnendvNExKaE9FVFprcVg2cVl3R0FEU2dtYTNhRHFoNUUw?=
 =?utf-8?B?ZkR1L3lObVUxVmdDS1BxaXp2VjAxNisvTEllSTBFSDVGTDJTZVJJOTVDa0lG?=
 =?utf-8?B?bWhSZW1mR1NRUm91OFJKZmdYbCtJdWswamtNYm8ydlhpYmMwSTJOR2V2REky?=
 =?utf-8?B?cGVQU0hIYVRJWC9mOE1QeHdJbzBnSW0wOTBBVllDUy96MWlLcmY4VU81S0hh?=
 =?utf-8?B?aTFoajRnenhRZitjTWswT096NE5yR2tBMzZ6TVZGdHZkZ3ZUMXgxdWZxNnVK?=
 =?utf-8?B?SmRsUE54blZnWmV1NkZKaExlYkg1ZDRLNlRGcklGdU9hVzQ2UHZMTEZKd2s4?=
 =?utf-8?B?aXp4M09ReWRuaCtObmN0cHpwNlJ3UElwcW5HeXNGVFk0ekxtTXV2WjRTWEFt?=
 =?utf-8?B?WVRBa0NzeEV0U0k4QW5tNVdwV3VnZEwxaU9hSnViTEJ3OFFKSmZYQkUzOCs2?=
 =?utf-8?Q?9pgMN5EN677FqMcU=3D?=
X-Exchange-RoutingPolicyChecked: GfECnWsd6aG4/hc2CMJ0277y41zNxSceo90TNCPx7i+9L3aVDASyDHENC/BNbHaITTPP/jq4+t975cF52w5aKXHNvYFl47t5TijiWOd/j9wK9xjRRf6y3+klEt4K/lURM1760c4DP1N/aMiwdq2n6rdXhh1RXCyD//inutPyHQcazT3UA3+Maz5IIblDMRjuotS4KOWtrx7HiSZmgOfwOayuM1Br42ro6BBAd0UxH9VDQcV2hGBrRE8nTmLSMosU2Ntxa8rZirrmWCTI21qFxGywwslwp/qMlngFL752ZF9PitLN3+a4zsrBlApiEFw/g8QJNbLpawG4SrR3UbfnSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b4a508-59b7-488f-c78f-08de90bbf5f7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:30:09.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mgvWmSE2/gjAoyDL2+X+SJymYdZeUbJ9jpHkg3jjxnzEtQkvqcQVRj+p4fEsYd2z+hjL2vxJU2Wd0MIOQbGE2lpPwULPkXTdQaWApea9uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8778
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:39 +0200]:
> In addition to the hard resources (like GGTT, CTXs, DBs) we should
> also check if VF was already configured (by sysfs or debugfs) with
> optional parameters like execution quantum (EQ), preemption timeout
> (PT) or scheduling priority (PRIO) as otherwise we might miss to
> send to the GuC updated latest values after a resume or GT reset.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b05034d3fdf2..e673e96a147a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2090,6 +2090,17 @@ static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  	return config->exec_quantum[0];
>  }
>  
> +static bool pf_non_default_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)
> +		if (config->exec_quantum[i])
> +			return true;
> +	return false;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure PF/VF execution quantum.
>   * @gt: the &xe_gt
> @@ -2305,6 +2316,17 @@ static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
>  	return config->preempt_timeout[0];
>  }
>  
> +static bool pf_non_default_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(config->preempt_timeout); i++)
> +		if (config->preempt_timeout[i])
> +			return true;
> +	return false;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_preempt_timeout_locked() - Configure PF/VF preemption timeout.
>   * @gt: the &xe_gt
> @@ -2602,6 +2624,13 @@ static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *c
>  	}
>  }
>  
> +static bool pf_non_default_sched(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_non_default_exec_quantum(gt, vfid) ||
> +	       pf_non_default_preempt_timeout(gt, vfid) ||
> +	       custom_sched_priority(gt, pf_get_sched_priority(gt, vfid));
> +}
> +
>  static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
>  				  enum xe_guc_klv_threshold_index index, u32 value)
>  {
> @@ -2878,6 +2907,9 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
>  		valid_all = valid_all && valid_lmem;
>  	}
>  
> +	/* also check optional EQ/PT/PRIO */
> +	valid_any = valid_any || pf_non_default_sched(gt, vfid);
> +
>  	return valid_all ? 0 : valid_any ? -ENOKEY : -ENODATA;
>  }


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
