Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABADACDE038
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 21:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2625E10E21A;
	Thu, 26 Sep 2024 21:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjxTKPSw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8010E21A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727385740; x=1758921740;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tNEF6NbkONq0c13OQM6ld79PfWX8viU/OdvGymW4HmI=;
 b=GjxTKPSwi40sDP05ek1LPiQiYe1I36xrwg9305oo9+c3MSa9+1SqEMeI
 49GRemdxJtrhOH5DCuB/b9m3eagANFnlH4H+MvCnZImI6XOPTNXQ1m+fG
 DBkDDcU7SCCEHfA4T5dgMjX5ZMcxCQqJx3pHCrQW34aFivUtudTLp5HD8
 xbcvYtaos2asS8YtFXC6JbuMXy2oERdY5q71zQx300KbKE7Bfx8JElkIK
 wVzajHH0fdSShsp5yjYQlV9v1BXsHAx2BkEJfg4rK8lzrGVoBMakOZXvg
 ts3vnmssIZY0r2L4u7XFv6Tr9qhLr+zNHVu0iEL+hwYYcNjO/ahQRWS7d w==;
X-CSE-ConnectionGUID: 2U5vxEkuSY+jTsBADL7UTw==
X-CSE-MsgGUID: F04rCLFsRQCtViyKwboenw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26612811"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26612811"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 14:22:14 -0700
X-CSE-ConnectionGUID: ddrztHb7QVOItJe7a50XIQ==
X-CSE-MsgGUID: nxO4OHC7R6Gh0pnszsBdjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="76372493"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 14:22:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:22:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 14:22:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 14:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoR7p5IRpGLMpGIQF5VM/fuqFJNXdMJ+DOOXQbdK1ykLUzQzY+hySraASvJJtvs+n921eDg58lWAcXyzST0jv6XSbZuEtZ2bGOYXneqz8wENcWNMycx68lFsUlLId05rLs6kc6nki4OvFCqHdnISp1EhZd/Do8U/buoWme+qfpqKAarFFwKKvfcNkM2GgfzdypTwjj/tUbQHt0uEbezhXP2evPu9pwxl3cm+4H6gfh9oz848pd4IqcSK/Jayfr/Aaxb/pd1sOGr27ZZX8F5609Mpe3MorR+Jkgw/xD1Nub6kDEACOelhJ0Kqo+FDbY/q0tHiXEsayndCmoeFSy75Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9yiVxFdb7KMdF6yup1Hd3QBaYFzHZbuVmoe6737ko4=;
 b=VSXjZVvZpMV7ZgjJFFVa2TeVJQExxMR8wpJ7rWAFor7N1/PCHV8pvQ/z62catGqLXcqb4dUMuBH/1YH+st3zQP5EVjs6jylTQS7i0Gx1XkHrJ7pNJUMXLtdhAEIfRtnyhNwB7WWnLGpbMYAPu7PF8Y/cbs8CuSbiZR599jl4hLkHgnlXhmhpYWmnVcPEDBzpjDkXcEeyAUDSnhbzrfiqwEKWnIgyb7OdLskB4psCsTAzNd+OcYqhlS/dxPjXZjoJRIdSFznt0+bgOkn2rvDeiLnP6Tin113uoAbfwSt/2WM4dDmA6SCIZowj2Xxlu2FaLiIEmOQxPCFycU9qJI+hUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Thu, 26 Sep
 2024 21:22:09 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%7]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 21:22:09 +0000
Message-ID: <3fb93efc-2540-49a0-9abc-be033774e9da@intel.com>
Date: Thu, 26 Sep 2024 23:22:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/vf: React to MIGRATED interrupt
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
 <20240924202553.1541574-2-tomasz.lis@intel.com>
 <959687eb-92f9-4bfe-9065-577b467c2b2d@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <959687eb-92f9-4bfe-9065-577b467c2b2d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::12) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 903b75b3-4ca8-4a78-08ab-08dcde714758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2Zla28xSWtUYjM5ejhrdVNSRkg4STRUU2oyT3BMWWM0c3BNaG55YTBlQ25B?=
 =?utf-8?B?N2pPb0k0bmhxcE5FTzB6OHFFaUxLQlFmU0FWWHFQWU54Z2Rhb2g1SllCcE9L?=
 =?utf-8?B?bEV0cGN5RXBveFVGa3lJaUlSSU1hRTJzV2t1TkxWZjNDRms2dCt4Q2ZvV3oy?=
 =?utf-8?B?eVZlaW0rd3Fscmp3QUpuZ2ZqQWlySFc0bGNpT3ZPZkVua1Vsd05sSGV1Zm9j?=
 =?utf-8?B?RnFFemNVS0xEZ1IxZFJ4RHZSc2pnSnRSTGRrNFpQYnJvVlVIZHRDcHhoNEpi?=
 =?utf-8?B?YnZSRXFTZmZqbW9HM0RuOUw3dU56ZkQ2Vmk5SmgyOVliMmxQTmhLOENMbDVN?=
 =?utf-8?B?VW1RRk9JcFNRZGtDSC9CSEZnYzVsckFBbGJXNGVVaUxtVXNDQ0F6eFdsUWxa?=
 =?utf-8?B?VWRuSFQwNTF2dDd5dmRDRnN6YkIraTNaN2NXMGxwSzNSMkpDTGFRcW1ZOVFS?=
 =?utf-8?B?dGhqTEJPZ1JOQzhnWTZxVkxsN0xITmYyeXBhQ2NwSUVZelNtSVN1OXpjMkRo?=
 =?utf-8?B?aTNmUVRmaVRuZWVObXZ6YmJsNVBBNGpjVTZJR1oxM09aYzBSRys1T1cxWEFm?=
 =?utf-8?B?WGpEL1BtM045SW5IOVpmeHZvVWhhTTVOQm9lUFVOUnR2cEh4UU1pZm1TRmN1?=
 =?utf-8?B?QlNoZXlXTGFFTlphMWRna2ZnTkNSQmtyYzZzYy9MaEhGZU1NZmM2dVNmSjZo?=
 =?utf-8?B?YlRDbm1iYy9Qd2w2Y1VmZDVMRjJ0NDYvMWZibE8ycnZuRWxWTjBFTE05YnYw?=
 =?utf-8?B?a3AwWTFacHRIdU8vam9ua1VlQmVIRmVhMDZCUGhGMis2RlJGR2FKbG9tVkxW?=
 =?utf-8?B?QkU5TFBVR0s5ZVRJSURidlRBQ2VCdjlvRGt5UWtJLzQ3czByci85cTZycUVq?=
 =?utf-8?B?Y2o1dkx6bU4xUzlYYXlQemw5a010M3AzN2V2Z3YrNHV3dkZZWEVidzZoT292?=
 =?utf-8?B?SUMzY0RzNTJmdENURGR1bnptOHZ0N0p2ZU4vakNjQWFhLzM2YXZ1eGRtNG1p?=
 =?utf-8?B?VTA4UTZjNk9KL3Q5am8xWURZKzA3WXU1dkNIb2JFVDdWYTJEUjhjS3k1Tk9E?=
 =?utf-8?B?dC9FNGw5OXhMRzhhaHp4b2RJV1JKcTA0cFhab2pqelVNMHFmdzZJSTl4UzBy?=
 =?utf-8?B?bkkzdnlhMlNLQUIzRDVhejdKSDJoN2syNzJNZ2pGcEJvWTE3S21mdzdRVVFw?=
 =?utf-8?B?TTJxd2VnbWVyL0FLd3FMOWYvVEh1TC9DdjhGSW01dlJ2SFZTeWdNQzJoakNh?=
 =?utf-8?B?cEs0OXJ1aWhRSGp5RzZoR2JBd0xVemd6MndaNERQNUMxZ2s1WWxMUU5hT1Nk?=
 =?utf-8?B?cjlPNzRKSEpsZUEyaWt3SWFxMFVQNTcvYTdnTGMva2tPYTJUejBIamc3MTdx?=
 =?utf-8?B?Q1Zzb25xTXJRWGNwK1BuZ3VKblNWYzFrcWEvTXFyOTB3eWhONVZOSEYvMFhC?=
 =?utf-8?B?NlJZNld4US9hS1d5OVA2cXZVQ09WTDgySllwUFhxS3dYejRrVmNKaDlwU2JW?=
 =?utf-8?B?NlRnb0pPWjUvdnZKajJMcnBiT1JkaWlwSUFpNjEyb0Zpc05qQkFId05Scy9M?=
 =?utf-8?B?bTVhZmZoN2ljSzYyQlBZckN2RWo1VStNNnVtSWYvcFlxeXhNc1VQUVRFY2Nm?=
 =?utf-8?B?OHM1ZVA3VHRtcFcvR24wazR2TXBPNkg3ZFpBbzBsSjVESWZ2T1JRYjU3amNB?=
 =?utf-8?B?RmlmSURFUDJPcUpweEdwUnNiQlcxZFVlczVoTkc4dmU4UXkzRWZBcnVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MitiYVBkOFVzS3FCaVpoNjE1QUErUzBxZ0ZiRkhCanRyZCtDUVdEeEk4emR5?=
 =?utf-8?B?YU1sWXJHLzVFZUVVOWx6enZiNWRmNlY4T0w1aDhlMGpoZ21RdlVJekJmNUNR?=
 =?utf-8?B?ZDNRYjk4eE5rV1pSVVZISEIvczFadUdJNkJPRVJKWFRxeFdSWjZpV08yT3RH?=
 =?utf-8?B?SFZVK1FlODBPaU91U2pDVmpiL0M0ZGVTNEV5RWxxSHNoaGpXckZzQ2pLeUw0?=
 =?utf-8?B?N3ZrM2NmNDJyN29keGV2cGJ4bWovTFZic2w0Q21tRkg5QzNZWFlzQkJOVTNt?=
 =?utf-8?B?WlpWeXpHRjlwa1dka0o5K0xXenZ6UVpuNVMzU3VJNlBxQmFsQkVsK2JQcnZW?=
 =?utf-8?B?RWtxdnd1OVlkZmZBeUMyMytjNUloODNPNldDN0h2V3BTVzlQeUhpRVVWeVhO?=
 =?utf-8?B?R0ZYNVFFaFJuWHZIeDNXYTJOUVh4ZWthWDhFNkV1MTdhdTNFb05oRXpmek5j?=
 =?utf-8?B?aGMyUzgzSDdBOVhIR1FFOWNibjRBV2RnT1N5TVFiZEQ3NTBkYUVNVE1jWVE5?=
 =?utf-8?B?YnRmaSthOFRUOERpUm95NzBhazFCVXNoVVZEZTdYRExhTFAyb253akQrRG9m?=
 =?utf-8?B?VGRDbTRCS2hVWHBDU2d6bnkycmh3bElvaVQ5Tk9BeCs2Um0xcHMvWStqT2RT?=
 =?utf-8?B?WERFMHgzMFl6YlMzcE56V2s5Q3E2eDY1cUd6S0Q4c2x1V21sRFIranNSODYr?=
 =?utf-8?B?Y2YvemZyaDduRXdla2Z2aWlKb0ZPOTBFQks1bFloV1E0c0xrbWZkZk1sQ0Zy?=
 =?utf-8?B?cFUyNWVCWUpybVljVmRkSXNuMENTclpEbk16aGNhRnpJendwQkpRQjI5Vmdy?=
 =?utf-8?B?U3JtVi9mdVJRV3NiMkd1TlF4bnlhanFENjgzajdTaGRzNXZYMWhjZEs0emEr?=
 =?utf-8?B?TUdFZkx1Q0dOWnJFNEhhNnUxcFdFQ1JIb0x3N3dYb3I2U2dtMkRrYUx2UDJK?=
 =?utf-8?B?aEkvY0ZIcXA0aENwZXNLSllCSms5UVozalNxb3lUdXR2bU50c0R3Vy9vVTlZ?=
 =?utf-8?B?V3JVbXdXY3EwSURoczROUGQ4TXBSbi9WL0lkeWZuUXEzQjU2dEF0Nm5DMnlR?=
 =?utf-8?B?c1d2dno0V3ZOSzJOU05iTUJWaXJXaGFpTU53RmVXS2o0dVRKVUNVc0RvZ2Uy?=
 =?utf-8?B?d01ycEVndmFpYlJ0WHFXZUpRTkN0Y0lxb3JKL0pDQk5CUkMwMnJkekFhRGR6?=
 =?utf-8?B?ajFLY0dhK2xZd1N3bUtCYkprdzJBMkQrL1BNd295UVltTXc4WFVnbUhtQXU4?=
 =?utf-8?B?bnBSYTBSclBmOXROVHJVSjNCT2RydDlpY3FnYVhCbFAvTC9FdGJzeFBEWHJh?=
 =?utf-8?B?bnY3NFFjQ3NoenJXR2FsZEJkcXB1ZHpMVE00Ri8xWS8rYTZpc0NFRy9zbTcw?=
 =?utf-8?B?dU9FTlV6L0Y5cnRGdGJNOWN6dGdmMVNNVDRTQ0t0Mk0yakNPZlExSEliRnM0?=
 =?utf-8?B?dCthRFNmT3R1bGxYWmZlYmZnbUpwbXJJK2ZuWThaR1U4MG85K2pHYXRDZ0Ry?=
 =?utf-8?B?Rk5GQ3ZHUGc1TnFjNS9GZmptVW9QaFcweWZsOHZYSm05a2MrSUNvckdxOFlm?=
 =?utf-8?B?MytYdzZyV0NpMVB6ZHNHV1BXckRGMVhRcE43NFIzWndGWkdES1NLL1dYSXZV?=
 =?utf-8?B?dEV5OEpMUkxIUmNaZUxFcjh4ZCtEZHVTLzh4ZEdZV0NuTnY5S0F5YWJiR2g2?=
 =?utf-8?B?Y3FmczViQVlXTlkxZ0xiOUoxUXo1eHNRTTEyQ1d2N2ZzdVE0R2VWYlpzcUpz?=
 =?utf-8?B?SUhPRG1iY0pOWElwZGZqVVI3cm5DSWZ5R2NSVkRzc0d0VEJXd3c0MWZ2REhU?=
 =?utf-8?B?cWJDcjVwaWRwWHBpRThxOVYzVkN6ZGhRMFJDQU9MdEhYYm1YeGtwVDY5NGNl?=
 =?utf-8?B?TCtDNTUyM0tzdHNWR3hlTmxDWENQc2RpZm5qMkRNZmZ0RnVJU1BDZ1VaK25O?=
 =?utf-8?B?NW52VjZTSHZVWnVEK09rS0dTWHNROWJEazZQRVhNaE1DTmIrMVNlUytKS1d6?=
 =?utf-8?B?VmxEU1djVDBXbmdSbnNlSXFRVGdSdCtzK0MrOUoyWGtjZHYrOFRPenBHbitk?=
 =?utf-8?B?OWhhL2FITjhiaCthUEs3TWJUMU5HbVU4L0RtMTFzYTJRTm5Rd3lXUkNkNk11?=
 =?utf-8?Q?Xkt50KWwYibzuIoZIzC508rn2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 903b75b3-4ca8-4a78-08ab-08dcde714758
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 21:22:09.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcEPhd+wDe7eGH6YOPf2wghytHGVrG+gZO1jHiZUG0/Xj0myfJH2+5MhvISNvKla2r1NUJALNjb0mOA9OjR+ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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


On 26.09.2024 16:05, Michal Wajdeczko wrote:
>
> On 24.09.2024 22:25, Tomasz Lis wrote:
>> To properly support VF Save/Restore procedure, fixups need to be
>> applied after PF driver finishes its part of VF Restore. Those
>> fixups are applied by the VF driver within a VM.
>>
>> A VF driver gets informed that it was migrated by receiving an
>> interrupt from each GuC. That should be the trigger for fixups.
>>
>> The VF can safely do post-migration fixups on resources associated
>> to each GuC only after that GuC issued the MIGRATED interrupt.
>>
>> This change introduces a worker to be used for post-migration fixups,
>> and a mechanism to schedule said worker when all GuCs sent the irq.
>>
>> v2: renamed and moved functions, updated logged messages, removed
>>    unused includes, used anon struct (mwajdeczko)
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 11 +++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  2 +
>>   drivers/gpu/drm/xe/xe_guc.c          | 11 +++++
>>   drivers/gpu/drm/xe/xe_memirq.c       |  3 ++
>>   drivers/gpu/drm/xe/xe_sriov.c        |  4 ++
>>   drivers/gpu/drm/xe/xe_sriov_types.h  | 10 ++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c     | 73 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf.h     | 14 ++++++
>>   10 files changed, 131 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 8f1c5c329f79..1f07983bb865 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -123,6 +123,7 @@ xe-y += \
>>   	xe_gt_sriov_vf.o \
>>   	xe_guc_relay.o \
>>   	xe_memirq.o \
>> +	xe_sriov_vf.o \
> wrong order
ack
>
>>   	xe_sriov.o
>>   
>>   xe-$(CONFIG_PCI_IOV) += \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 484fb34dde98..07ff7554fc3e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -374,6 +374,8 @@ struct xe_device {
>>   
>>   		/** @sriov.pf: PF specific data */
>>   		struct xe_device_pf pf;
>> +		/** @sriov.vf: VF specific data */
>> +		struct xe_device_vf vf;
>>   
>>   		/** @sriov.wq: workqueue used by the virtualization workers */
>>   		struct workqueue_struct *wq;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index d3baba50f085..489ace57c2a1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -27,6 +27,7 @@
>>   #include "xe_guc_relay.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>> +#include "xe_sriov_vf.h"
>>   #include "xe_uc_fw.h"
>>   #include "xe_wopcm.h"
>>   
>> @@ -692,6 +693,16 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> this is public function, so you should add kernel-doc for it
ack
>
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
> since below you are accessing VF specific fields, you may want to add:
>
> 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
ack
>
>> +	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>> +	smp_mb__after_atomic();
>> +	xe_gt_sriov_info(gt, "VF migration recovery ready\n");
> the xe_gt_sriov_info() will already add "VF:" prefix for you:
>
> 	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
>
> [ ] xe 0000:00:02.0: [drm] GT0: VF: ready for recovery after migration
ok
>
>> +	xe_sriov_vf_start_migration_recovery(xe);
>> +}
>> +
>>   static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>>   {
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index e541ce57bec2..544e913b8465 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>>   
>> +void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>> +
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index b6cd5e941f19..05aa93070e5a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1092,10 +1092,21 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
>>   	return guc_self_cfg(guc, key, 2, val);
>>   }
>>   
>> +static void xe_guc_sw_0_irq_handler(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +
>> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +		xe_gt_sriov_vf_migrated_event_handler(gt);
>> +}
>> +
>>   void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
>>   {
>>   	if (iir & GUC_INTR_GUC2HOST)
>>   		xe_guc_ct_irq_handler(&guc->ct);
>> +
>> +	if (iir & GUC_INTR_SW_INT_0)
>> +		xe_guc_sw_0_irq_handler(guc);
>>   }
>>   
>>   void xe_guc_sanitize(struct xe_guc *guc)
>> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
>> index 3f8d4ca64302..2d2f40378942 100644
>> --- a/drivers/gpu/drm/xe/xe_memirq.c
>> +++ b/drivers/gpu/drm/xe/xe_memirq.c
>> @@ -435,6 +435,9 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>>   
>>   	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>>   		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>> +
>> +	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
>> +		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index 69a066ef20c0..2f4c3ae24f6e 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_pf.h"
>> +#include "xe_sriov_vf.h"
>>   
>>   /**
>>    * xe_sriov_mode_to_string - Convert enum value to string.
>> @@ -112,6 +113,9 @@ int xe_sriov_init(struct xe_device *xe)
>>   			return err;
>>   	}
>>   
>> +	if (IS_SRIOV_VF(xe))
>> +		xe_sriov_vf_init_early(xe);
>> +
>>   	xe_assert(xe, !xe->sriov.wq);
>>   	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
>>   	if (!xe->sriov.wq)
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
>> index c7b7ad4af5c8..8c518e68d33a 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
>> @@ -56,4 +56,14 @@ struct xe_device_pf {
>>   	struct mutex master_lock;
>>   };
>>   
>> +struct xe_device_vf {
> you need to add kernel-doc for the struct, otherwise below doc will be
> ignored (now) or wrongly interpreted (in near future)
will do
>
>> +	/** @migration: VF Migration state data */
>> +	struct {
>> +		/** @migration.worker: VF migration recovery worker */
>> +		struct work_struct worker;
>> +		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> hmm, if something is per-GT then maybe it should be defined under struct
> xe_gt in the xe_gt_sriov_vf_types.h as
>
> 	struct xe_gt_sriov_vf {
>
> 	/** @migration.ready: ready for VF migration recovery */
> 	bool ready;

So there seem to be two ways of doing this: keeping the flags together, 
or distributing between GTs.

Keeping together restricts the amount of supported GTs, but that's a 
lesser argument.

Separating consumes more space, but that's also a lesser argument.

There is no strong reason to go either way. I kept the flags together to 
allow atomic clearing of all of them.

-Tomasz

>
>> +		unsigned long gt_flags;
>> +	} migration;
>> +};
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> new file mode 100644
>> index 000000000000..0e332bb215fd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -0,0 +1,73 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_sriov.h"
>> +#include "xe_sriov_vf.h"
>> +#include "xe_sriov_printk.h"
>> +
>> +static void migration_worker_func(struct work_struct *w);
>> +
>> +/**
>> + * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
>> + * @xe: the &xe_device to initialize
>> + */
>> +void xe_sriov_vf_init_early(struct xe_device *xe)
>> +{
>> +	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>> +}
>> +
>> +static void vf_post_migration_recovery(struct xe_device *xe)
>> +{
>> +	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> +	/* FIXME: add the recovery steps */
>> +	drm_notice(&xe->drm, "migration recovery ended\n");
>> +}
>> +
>> +static void migration_worker_func(struct work_struct *w)
>> +{
>> +	struct xe_device *xe = container_of(w, struct xe_device,
>> +					    sriov.vf.migration.worker);
>> +
>> +	vf_post_migration_recovery(xe);
>> +}
>> +
>> +static bool vf_ready_to_recovery_on_all_tiles(struct xe_device *xe)
> you likely want to mean "on all GTs", right?
ack
>
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags))
> 		if (!gt->sriov.vf.migration.ready) ?
I'm not that sure about changing the flags into separated bools (see 
earlier comment).
>
>> +			return false;
> as you're testing each GT separately, then maybe it's worth to add
>
> 	xe_gt_sriov_dbg_verbose(gt, "still not ready to recover\n");
ack. Yeah, I originally had a message there.
>
>> +	}
>> +	return true;
>> +}
>> +
>> +/**
>> + * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
>> + * @xe: the &xe_device to start recovery on
>> + *
>> + * This function shall be called only by VF.
>> + */
>> +void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
>> +{
>> +	bool started;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	if (!vf_ready_to_recovery_on_all_tiles(xe))
>> +		return;
>> +
>> +	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
>> +	smp_mb();
> IIRC each use of mb requires documentation of "why"

That's true, but I don't really know how to comment that other than 
citing the mb docs, ie:

/* make sure all workers see the flags change */

-Tomasz

>
>> +
>> +	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
>> +	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
>> +		 "scheduled" : "already in progress");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> new file mode 100644
>> index 000000000000..7b8622cff2b7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_VF_H_
>> +#define _XE_SRIOV_VF_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_sriov_vf_init_early(struct xe_device *xe);
>> +void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>> +
>> +#endif
