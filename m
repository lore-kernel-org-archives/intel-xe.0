Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26377FD2D73
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 13:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D773610E6AA;
	Tue, 10 Mar 2026 13:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liL36fID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CD810E6AA
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773147739; x=1804683739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7+vMT7fu71xR8xdc18NtSmw99ADoHW/XzmLChHvOlt0=;
 b=liL36fID9OCr47SrjHNXFMOTxDjrjvqWOZwIOeJ2EtXa9GTluIQAN8vV
 v6qjbvLdPLviOb6MlfmjFfaXofOV6zphxtteic01+kjCDXkBFYsBK1wWQ
 PDRsoCRj8UCflhXFBwCbYCcOVNOExhTCKljFy86NJAy2mXuKsC2/EWrym
 tUMhPdVAFzyy2NF6s8Lbm6r8gJLdLyG4OxmgvYDGviQwv4PXRawQNVQ7N
 7n4vDghp7a3DMfgsfFCc5yHaydHEsLv2Mdks66NogIYBkiFZUVIhJmFxz
 Um5haFVqs1BMoa9PvNCmzguxwXQnkfFCczfK3P3jGgnj8Qqo4tOiFFiep g==;
X-CSE-ConnectionGUID: ZTnrRuXEStizm4WYDxPhmQ==
X-CSE-MsgGUID: JeX4r9yLRfOWZ2s81KjYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74308318"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74308318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:02:19 -0700
X-CSE-ConnectionGUID: +bvPjixyTjatfkYCmRL08w==
X-CSE-MsgGUID: OU5q+GN3R6q7ywPxjF1kUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219345952"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 06:02:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 06:02:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 06:02:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 06:02:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/u6tj/sQ1eZho0xVYf12/xejbLO7CyoCC4cIqPZP4SBJwycuZY89QkKGDkDwYhelFoW3a5wk6Uy5apYaWieoZ/RTC28RycE0ZeP6W/ECruc6ZGHUE+l9WBMxPFz2rxPIf8lTPDlFUNiElD+GWVzIpwB73u46LTT+iEqyouwvSzbkANNVQQBIeK6VKsfRnti5eBCT6Ryznty/EvYK/ae7UK8B0YUM46arvIz3aoI4H0lGUFvCiUvc/WjGZLIMSgpe2VBXfTlXRuUgF+IKtwmjE+99Q+hN7k/dFq7T3Rz25x/Ce1ZxYV1rLFmboLDmoogvTVcVFf9HI+DToBG2F9A0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdzpBmpIczhB7TBJfICmBBxhzLsjZFEKfKWCAyyx3eU=;
 b=rfkdtj/pc1St2lpwo4BPsuUQRBF6Avr+2BmTfFkyycvHJDSIT1T2P3U0G+lBqcRKTlG47LCJaS2cDQ5BLnh9AJpjeMoxo36N0HL7Vxjv5eODa1Xw3lWb5PJjDOYDxvzQxyXfjR7FZ7lUXJ0TjTbPn72m+ybfvAyIbh4idapDJ9c+ayA7Np+ELPoEY5BoYPh/j3Y5dBHLthdprc9x8ArTKw6mPgUKCuIGPWVAntjd01wSVY6kcsrv+kcKSAcb76cuOwlw60wWrRTcRVaNB/JDUY2BiEeZwqgcQgF6T9pmKdkzRCLvzB0TBmeKtkDP7rPxPaTUOY9BMMPoA/xEEmY1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 13:02:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 13:02:13 +0000
Message-ID: <4c4e9f47-c04a-4426-91ed-b415532d9dde@intel.com>
Date: Tue, 10 Mar 2026 18:32:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] drm/xe/xe_ras: Add structures for SoC Internal
 errors
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-22-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260302102155.4074630-22-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d311cf-a662-4a17-6bb1-08de7ea53f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|22082099002;
X-Microsoft-Antispam-Message-Info: PD4fdn6A8gZf6r0c6nxFZSAoqBFMyHW9zVMBoiqdsROnLln6x777RiV6rY6deD7CJRPjfutr06TWzYjWliodV7RtYCC0yyM99uX/oGswKuhVXZ9y23EUTS/k1o24P0ltWYIBrFpTFdca1B4K9PB75nFP0zDc3EJsA75uvQkRhPON6rEb3n66IF8+icBYB6CxXVBZqx1P63+uxYzEcnuWLvwP6enY3mkLI/vsMZJO3PwNJ5izPLP7ycMZfZXPI//bvDmJGJMBysZAItul/BnZATSIcQrF7Xklc0q1bHWMCDpwSpzKjQ92VXtEWkVq+Lm6BxH73LSgMLBhxGQWfNUpfLcv2MUTXvNILs5ejatg3IQ5ShayX0FCglCMnvJAAERgrrdiqWjaae1+DFVCG35Pq4ifOwhtd9fFziWDgaIcNOQGgUPSUS6Q8a8+BrtQCaRsmBS0lbgUkmMG5TeHUfOX3ScQ3XHxu79OI/PuEvOFd+xjZCz9P94UtlqZBJbi7AWc3W89P4Puv0nhz6kghOLWvDiOPZTHphPyzY7CvieKVgsUBuWDQFKm1VAU+CrGjoOfwmp0ush+gTtN++sRkfjn64wKen6Qxl4UbuX961fYsf+YmEDPhsVVZcuHX5ldRKrNAM9v3z1yLGlh1EVkbZuH6KrywCJXTngmq3CNRTqeruOBZ51rDagHRu31QusvQhSIfqRlN3CFFE+9yZdFQU7Xv2JEtsMCVIRIzmCgnFwD2lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099002); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFdXRUtubWNYRDZBQ0ZnMnFybmRsVW00VXJSUTVwdWQrWUYzWHMwVm1idEJO?=
 =?utf-8?B?WFBSMG1DTmgyM0kvbCs5UElXNVl6d2FRVUFzYkJFQ3h6QW85L0dya3EvcUcv?=
 =?utf-8?B?V1BhcjBVOFJodHB3dnd2VDhaVWt5QUpaM2UzbWdTQWtnRkRQMzZOdVFLZmFm?=
 =?utf-8?B?RERjOGo0dmkvNHZ1UWp3bEJuMzVqS1NZR0JTdFRTNThPY2QrbGJrOWlIZE8x?=
 =?utf-8?B?V0RQa2JaQXo4T1hEYnpNaFBMZk04M2k2SXVETWllSHR4OENMQUhDYTZnU1Fr?=
 =?utf-8?B?Mm9zVFI3VGxvU09rd2RyaE55QUZoS0tLaWliVE5xb3JqOEhIUVQrTVpLdlFi?=
 =?utf-8?B?akJEMHJldTVZaFlwWlFlTWVTVnc5b1paeCtTa2NTT0g1THEwTjZGcWUyUENx?=
 =?utf-8?B?cmcvRGNDdEVGR2tWWmpNTHhUSDAyTXR4aXhqbnNSWnMzU3BxTVVKMlcwbnRn?=
 =?utf-8?B?RXFqTkhoT2VXbDA4RDN3RjFDU25lRWdCcFBSbHFXSzFGVXZ5WGN1eTk1RjF2?=
 =?utf-8?B?SFM4Q25ydmVTYTNQWTVIZFlrdGJnYmFYR1U1ZmZBSnZUVEtMK3dQRVpyeHNs?=
 =?utf-8?B?MkFxRm9HZDFxY25jTitTRElETTV3NFFwUkk3Q1pieExQeVFTYmlZVW1DMkEw?=
 =?utf-8?B?eWJnbGQ5akRiZWJHeGszYmdDZEZ5TCs0MTV3bm1CZi9BazNVbXJuR1g0YTll?=
 =?utf-8?B?Z01mR3RFNHNNaW1xVnFJVkdxdEZ6QXd2cHArUW1PcG0xMW84dG5tZW5KMVhE?=
 =?utf-8?B?Q2VIS1ZNYXllTmI0Z00rN3VlOHdZaFRZK0UxTWJmc2xVZTNjZXFlbkZCdTlD?=
 =?utf-8?B?N0NTNm9URER4aUdUY29Bam5KRmJ5OHF6VkdZOE1FUmYzQTNhTE1pcVpDZnhs?=
 =?utf-8?B?Z200N0VJZWlBOWkyY2NTei9EMSt6bHVSSHNOYVRKNjZqZVErS2twQVlVYTVj?=
 =?utf-8?B?anlpY0Z3UWlMcFFCa2Z1NStrcnBscW1ObWlSeVgzVG54ZVRHdmRPK09UcVo0?=
 =?utf-8?B?bEFBdjZOZG01bjFadVdWNnJvTUthaHhMS0lrbzUwM1RMRjByMzFLK1F0dW9F?=
 =?utf-8?B?TENnUDA1MDZEMHlBSDlNcG9jZHcrbG1WQUsrSDNObGV1TjRKTDN2Tmp4MzRF?=
 =?utf-8?B?U1lXTFNMdHNwZDkzcHUrY1VvUnRVOUMrVDNOUkdlTnJsYlFwNFU4UlBLRHJD?=
 =?utf-8?B?OG0xZzgvYW5tS2RBN0RMTEdDQWxDVkNLUXFBSnN4WFRaNVRvNm1obm1WaXBt?=
 =?utf-8?B?T2hoWkxvV0UyUis4Ymh2OHl5dEF4eGEzejA4d3ZpZStQaXFVRHF3MUl3VmY5?=
 =?utf-8?B?NFQvWGJ4dmEydGNob2tXbmk5QlpGNUFwNDJyY3JnOEhpWHZuRUZxZmxKMW1T?=
 =?utf-8?B?M01yMmdVWWRqVmFrbWU2SlIzSk9KczZMQ3A2T1Q4aGQ1cm52SkFiRjFaZkZZ?=
 =?utf-8?B?dmhJMVZ0emQ1YTlrNDhsVCs2bXY0Ylp6cVM0SFU0WmtMQkE4aVMvQWI1amxO?=
 =?utf-8?B?dzNKZE5HMGxIdEVNNHJuQllGUjVSQ1h6VkNHMitQTjZZTC82M2MrTW5DMG82?=
 =?utf-8?B?TktXQzhHZDJheWJoK0JLamFnUnY1eXlCTVo2YVhWYXgwem5Sb2FFQUNVZnRV?=
 =?utf-8?B?ZU5zRVNNcm41bWI4VUVIQ1ArUFdYT0FBeUtKTnB5K0U3dXFoR1NWdUYrd2Nr?=
 =?utf-8?B?Skk5ZjJXYjVLNFNQeVY1UTFCLzZBR0M5cklBSmdVKzlLSlJoaXdvblpaREJI?=
 =?utf-8?B?cDZFOFYzR0tuUk5ORUZxS3FQQnpyU2U3WG8yUm9SbUdYVnNwRzRoNUUrNjBh?=
 =?utf-8?B?cXRwMkUxWnFBWWdmUmxMQnhtLzNvMjRSZTMxVmFnVzNFY2xQZ1JnSi8wM0Iv?=
 =?utf-8?B?TUNOMDNxODZRUFdTWFZNSTNMc0oyRlBQU1RUY3FCOHV1M1VseHB1NWZ6WEVW?=
 =?utf-8?B?MUlva2Vqd0M3VW9uVFpsNTIwK1BaYUFDeVBuWkhHTTJQTG1aWFhZNjlWcjRm?=
 =?utf-8?B?WUF5a0wwV0hNNGZxT2ZTWXlaWG5FelNVU3lUMnRWSUxBM2VYRlpTOHhnb2Vl?=
 =?utf-8?B?WENkYk40Vk9vNkN3cWk1YndpM2FWTElSb2dYdjl2RzVaRXB6NU1NMFluNitl?=
 =?utf-8?B?Nm5heEM4M01jWDRkT05zSzJkZno3VmwrMllEa05pV0RaU3JrdVRLM3VrWEVs?=
 =?utf-8?B?NGJacVlROFRmT0ZPNUh1U0dJR055N2p1RUlBL0pyTnEybkVMTkRaT1BLWXNH?=
 =?utf-8?B?Y1dRaXRuVkx0bTBwZHN6WndXRjZMR2ZITWpZeEdyZ1JIVk0wZmNOdTZBTlRt?=
 =?utf-8?B?bkpVaGlrRGYzV2c3WFhmWG5tOXdOTWdpaEc3d3VCb0plWURRUGhVL0l1WXZD?=
 =?utf-8?Q?3oFzBN+Y1Pg8acOc=3D?=
X-Exchange-RoutingPolicyChecked: PDq/boQ6kcwAYl3a+a/MKCE8IQIIBJS2LIjYBdJnrE6N/wbCYwZ+lQlWMKthczxpRN6O03aEnov71/Maq06JeFAqjCZAfbkgAOpSLC5iWhDuD1rwGFxEFHj0FUMvr4wfPTOd/N7N7JMUDt4b/yvsISTLwYH/YwvOFql5SIWR0HqOXdBvZQI871h2DDxMFD61zkIGAwjCslWGnwsXl4zP+5+Pj/ZDG0ly7iciquiAzizQ1vd/yFJwTff8dahYac/x/AYlDcg4Fkc4XNwyoDUAcTAS4BNRtBTkGKgJsvEg9+e5S42YBACl1Mx7GhP1PEJbtI3TK6/58rF9SG9GZF0qCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d311cf-a662-4a17-6bb1-08de7ea53f41
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:02:13.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOmD5b43cXYZJVRkl+iwkZBLFOrnweZ5glFQIQjY1Tk/kV2btB7oXS/ycPAJ7bBsL3NtoXv68arQmytMF0SBJwIZ0GrW6TAbLsCyugS/ca8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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


On 02-03-2026 03:52 pm, Riana Tauro wrote:
> Add response structures for SoC Internal errors.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras_types.h | 134 ++++++++++++++++++++++++++++++
>   1 file changed, 134 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 221d07efd84c..466db9f47127 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -145,4 +145,138 @@ struct xe_ras_compute_error {
>   	u32 spare_log3;
>   } __packed;
>   
Add hardware component glossary to more understanding.
> +/**
> + * struct xe_ras_soc_error_source - Source of SOC error
> + */
> +struct xe_ras_soc_error_source {
> +	/** @csc: CSC error */
> +	u32 csc:1;
> +	/** @soc: SOC error */
> +	u32 soc:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +} __packed;
> +
> +/**
> + * struct xe_ras_soc_error - SOC error details
> + */
> +struct xe_ras_soc_error {
> +	/** @error_source: Error Source */
> +	struct xe_ras_soc_error_source error_source;
> +	/** @additional_details: Additional details */
> +	u32 additional_details[15];
Use Macro
> +} __packed;
> +
> +/**
> + * struct xe_ras_csc_error - CSC error details
> + */
> +struct xe_ras_csc_error {
> +	/** @hec_uncorr_err_status: CSC error */
> +	u32 hec_uncorr_err_status;
> +	/** @hec_uncorr_fw_err_dw0: CSC f/w error */
> +	u32 hec_uncorr_fw_err_dw0;
> +} __packed;
> +
> +/**
> + * struct xe_ras_ieh_error - SoC IEH error details
> + */
> +struct xe_ras_ieh_error {
> +	/** @ieh_instance: IEH instance */
> +	u32 ieh_instance:2;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +	union {
> +		/** @global_error_status: Global error status */
> +		u32 global_error_status;
> +		/** @error_sources_ieh0: Error sources for IEH0 */
> +		struct {
> +			/** @psf0_psf1_npk: PSF0, PSF1, NPK */
> +			u32 psf0_psf1_npk:1;
> +			/** @punit: PUNIT */
> +			u32 punit:1;
> +			/** @reserved_2: Reserved */
> +			u32 reserved_2:1;
> +			/** @oobmsm: OOBMSM */
> +			u32 oobmsm:1;
> +			/** @i2c: I2C */
> +			u32 i2c:1;
> +			/** @pciess_gpma: PCIESS GPMA */
> +			u32 pciess_gpma:1;
> +			/** @lpioss_pma: LPIOSS PMA */
> +			u32 lpioss_pma:1;
> +			/** @fabss0_pma: FabSS0 PMA */
> +			u32 fabss0_pma:1;
> +			/** @fabss1_pma: FabSS1 PMA */
> +			u32 fabss1_pma:1;
> +			/** @reserved_9: Reserved */
> +			u32 reserved_9:1;
> +			/** @reserved_10: Reserved */
> +			u32 reserved_10:1;
> +			/** @reserved_11: Reserved */
> +			u32 reserved_11:1;
> +			/** @reserved_12: Reserved */
> +			u32 reserved_12:1;
> +			/** @reserved_13: Reserved */
> +			u32 reserved_13:1;
> +			/** @memss_ieh1: MEMSS -> IEH1 */
> +			u32 memss_ieh1:1;
> +			/** @memss_ieh2: MEMSS -> IEH2 */
> +			u32 memss_ieh2:1;
> +			/** @saf0_mhb0: SAF0 MHB0 */
> +			u32 saf0_mhb0:1;
> +			/** @saf0_mhb1: SAF0 MHB1 */
> +			u32 saf0_mhb1:1;
> +			 /** @saf0_mhb2: SAF0 MHB2 */
Please remove space
> +			u32 saf0_mhb2:1;
> +			/** @saf0_mhb3: SAF0 MHB3 */
> +			u32 saf0_mhb3:1;
> +			/** @saf0_mhb4: SAF0 MHB4 */
> +			u32 saf0_mhb4:1;
> +			/** @saf0_mhb5: SAF0 MHB5 */
> +			u32 saf0_mhb5:1;
> +			/** @saf0_mhb6: SAF0 MHB6 */
> +			u32 saf0_mhb6:1;
> +			/** @saf0_mhb7: SAF0 MHB7 */
> +			u32 saf0_mhb7:1;
> +			/** @saf1_mhb0: SAF1 MHB0 */
> +			u32 saf1_mhb0:1;
> +			/** @saf1_mhb1: SAF1 MHB1 */
> +			u32 saf1_mhb1:1;
> +			/** @saf1_mhb2: SAF1 MHB2 */
> +			u32 saf1_mhb2:1;
> +			/** @saf1_mhb3: SAF1 MHB3 */
> +			u32 saf1_mhb3:1;
> +			/** @saf1_mhb4: SAF1 MHB4 */
> +			u32 saf1_mhb4:1;
> +			/** @saf1_mhb5: SAF1 MHB5 */
> +			u32 saf1_mhb5:1;
> +			/** @saf1_mhb6: SAF1 MHB6 */
> +			u32 saf1_mhb6:1;
> +			/** @saf1_mhb7: SAF1 MHB7 */
> +			u32 saf1_mhb7:1;
> +		} error_sources_ieh0;
> +	};
> +
> +	/** @lerr_status_ieh0: Local error status of IEH0 */
> +	struct {
> +		/** @reserved_0: Reserved for future use */
> +		u32 reserved_0:1;
> +		/** @psf0: PSF0 */
> +		u32 psf0:1;
> +		/** @psf1: PSF1 */
> +		u32 psf1:1;
> +		/** @reserved_26: Reserved */
> +		u32 reserved_26:26;
Reserved bit 3_28 right?, need to change name
> +		/** @npk: NPK */
> +		u32 npk:1;
> +		/** @reserved_30: Reserved */
> +		u32 reserved_30:2;
Reserved bit 30_31 right?
> +	} lerr_status_ieh0;
> +
> +	/** @gerr_mask: Global error mask */
> +	u32 gerr_mask;
> +	/** @additional_info: Additional information */
> +	u32 additional_info[10];

ditto above

Thanks

-/Mallesh

> +} __packed;
> +
>   #endif
