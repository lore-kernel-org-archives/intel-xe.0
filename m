Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407D0CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 19:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC6410EA12;
	Thu, 30 Oct 2025 19:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WApfyIIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68D510EA12
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761853678; x=1793389678;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JT4CC83OBEV0ReZgqQCU1R0rKO9xK/BzTr8uYouEGwo=;
 b=WApfyIIfkizI+x+06DAftp2jPDTGL7yHXlsXqb8ni08rL/zDnBD1OSLK
 q05XAA0BKWD8r+ye1SvLPqgpYv7xPTILb06bhpA2dzgHSIC429UmK3pGL
 uLVFJnccrhRItfCoGqOOuY1A+38RSC42crOP62PoTtcpn8wFdbDDvFxa4
 Qju73wbrUcNFI7letHArY9UY722ZB8l6cUwbS4TLBrZ/6kKFz9jgC3IJh
 tPZZ1ZloV7uSx/d76A/Tti3P9drKr0Op/mw82KEgEQO8RWznFy/wTShMg
 FGpgEJvQRz1VGqzbdwrjvYH5+KblUjuIEeBKkeYvm2bHKHJ/VFo4fWswS A==;
X-CSE-ConnectionGUID: Ezx5UZgDSOir9LShu2vnJw==
X-CSE-MsgGUID: 2mV56IP6RHetuXfR/mF1UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81636822"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="81636822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:47:57 -0700
X-CSE-ConnectionGUID: 0IWGe3luRga/E7+XUrP2OA==
X-CSE-MsgGUID: XJ77EZewTcuJEglxi4qKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186781036"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:47:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:47:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 12:47:56 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 12:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIl2zOkGHXVvQ1pg3khRRH4hIezUMecrNffBCZyzPnCknPQxvrSFnQZadCsT2tLbk9frnyasSJjM6bZ1iS5z+YcgkurI6N/0gJSVTxV7+2glqZfigt7h/om8RhNgjU/n9rtINEr1qGuKQth6p1NbjcfeRTueGLMm4Qyxf/C9uvieu0as7n0pBDVxDIWeBGPJ8PeRKLyPkUotPV4zp9MBvD3eL6f4XAhqmlN1OmXaat4E0QcuTlP84ukY/y27ZggGMRnybu7Oc1sXKT8c1EJwLB3E78mHc1LZo1aUowNq/0THAb3iG4iCXo2KBQ0G9c1MGgLmVhcFaBtu1ixbAoMUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6J8TTUS0141IdOxplYE8r7ouTuVGXXDC2sozyNxgJQU=;
 b=fMz0DBeMPEcEnZs8qBKG93gYk3lUvWismMlhKG4sRWnyQ+lpmg21Ou7vKLcPzVEsJ3SA4wKvBK+fHXhdqbRwp7GT67YyC3K+7rlyuvPIOuyG7QzNUCPV5oR6dAmccxIWoIW3vD7Uf5xBH6jMZWN1oacCWbvse2Oc8YtF9HV0L3CD4IgHjpF/OjuqbapqTs2tx5XWLY96U27EWPCS3Q/gz8mhPhJg7at62UksD1mBj3EOD/1/fC1KMwkD0xFFvIlud7M2qxshRjKVcysqq4Dbxpzz8HRz7scfYYb0niM5fWnIX3n4QNIbNVRyVi03NcXXvmX3h7aKVPxH1YKqbDfR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 19:47:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 19:47:54 +0000
Message-ID: <a6a09383-da82-42d7-8ac3-e8de31d6ec87@intel.com>
Date: Thu, 30 Oct 2025 20:47:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] drm/xe/pf: Add _locked variants of the VF EQ
 config functions
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-4-michal.wajdeczko@intel.com>
 <20251029084707.htvoaxto2ul7axjk@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251029084707.htvoaxto2ul7axjk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c87c91-dad3-427d-df70-08de17ed37ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ync2MkVjN1RLOXpXQm9NL0xRaTQyZFR5Q005ZllPN1RlRUU3Z2VISmVZSExS?=
 =?utf-8?B?TnZGWEovTDd0STFlbmJTaFpsczc0Wlowb3RGWWMzNnVRR1VHbVdEa3dFU1lF?=
 =?utf-8?B?MHp4VUJubHgwN2Zkc1U3d0NaTWE0ajBQTThNTEVkc2x3enAxRUJoOEg3YVdt?=
 =?utf-8?B?ODlzNGZ5SVVNV0pnUG9hWlYwQ0RFMFUxVFo3QXI2bGp1SEs5WDlseC9OVGdx?=
 =?utf-8?B?R1BDTlRtblJNVlRRUnRqNEI5ZVVQV3FvRHJOYkU5dUlNU0V5N0xCeXJUTkhL?=
 =?utf-8?B?MlB1U2E0dGVUa0hMV0prbXBZekNVMEpvNlVPNENjQkxla0g3M0hPV2xXNDk3?=
 =?utf-8?B?QUhmM1E0bWFTeHloNUJLaW5WOUtPZ09HVTJRNXpDVkxCZUlMdEd5a29Zakt6?=
 =?utf-8?B?dytrZ2RXOXhJRUVwMXBqWEhnVkpsUE82M0ZhYlVCOTJpYm8xeXZRYi9wb3F1?=
 =?utf-8?B?ZzMwRW42N0EyVldIZ0tNR0crMVk1VTE1KzNkNm5UN09BQUVLdE5xajJVMytE?=
 =?utf-8?B?ZytNOGhMbktUc2JRUE0zYnRGeHZKOWxzRHhwTmdUdFdCOVNKckRFYkoyVlZi?=
 =?utf-8?B?aEtKaDNkYXhlejhFRFgzTzhkaFdtcEtNNW5FZHRuMG9XWmViTTRnSUlYb0Fr?=
 =?utf-8?B?UmI4VXFVKzV3cWZMUVluMEtNcExSc3gyWksrSFdvTEhmcGd3QklJT1FCR1hQ?=
 =?utf-8?B?aGE1RkloL0EvS041d2JwZlVkaGo4RFNsRm5vSExKdktLcFhmR2xNdHNSQy8z?=
 =?utf-8?B?bFFBV0ZGUDZZOWxod0JPQXo5Y3ZVaTZKTmFTci8vLy8xMkZLM1lkQ05lLzFQ?=
 =?utf-8?B?TEFNRlBHNXhVSExwRktFendkNGJiYmdHMVZnbnJXS2NoT1pGK1MyTUNIMjIr?=
 =?utf-8?B?Y08vS1BvZHdKQ1BzVFE5cmZyYkhhVjRqaEhadXJ4U1FkU3dZR3dYREdTZnlQ?=
 =?utf-8?B?a3ZzMXRBdXVnb1ArdTdzQW9qTjF1T1dFRkoyaURrZGpvVld5em9WOFNWenhY?=
 =?utf-8?B?eHdKVEJzaGpBd2tjeCtyM3ExL1FwZ0VNWWUyQVNnUVhzcnZBSExnU01Xc0ow?=
 =?utf-8?B?dGdYalh4c1I0OFdINzZ0QzhXbXNueHA2Zk9yRDdwNkFsZERiVHpvblowejdh?=
 =?utf-8?B?QldSR2lMY1BzK2hYb3A5anRBQ1N4VVZqblNEK3ArVWRKeHl4cXdVNE56RXNU?=
 =?utf-8?B?NDh0VCtuZmx1bjlxb1JzMmVpcmszdldtT3hocWVRd1BzTktMcUorcG02M0NX?=
 =?utf-8?B?cFVFQ1JpamNvS0xDeXhjTjJjNVI1ZnpnNG8zSXBaWW00UFFCcnhmcWNldFh1?=
 =?utf-8?B?dkJFcVhCaWZPejhCM2tTZWQ3TEU0TWJldXpOMHpXN2F5cXZvMlVjaDNmV3BX?=
 =?utf-8?B?MDY5L0ZJQWJGM3RmaXlZWCtIQUVCcEdvcVlQNjdITXdHMmFPSmhtOFJkZHN6?=
 =?utf-8?B?STdzTXNxdUtGRDJOcW12bHVsRXRjUzU5S2ZlYllZSEMrOENXaHprS1lOQko3?=
 =?utf-8?B?QlgveWgyaDZpdy9nMTZGWTV1blRLYmEzc1ZiT1VlbHNzYlVUYm51Yi9ZTUJq?=
 =?utf-8?B?SlJudVR1dURZWW1kNU4xTjM4QlZmTEtqc0xHdSs1TGgyNGg3Z0NDcVVScDlp?=
 =?utf-8?B?ZGNLOGhBUUdjZkZ6cG5HVDdadURHZHR3ZjJQaExEU1ZjQUk0ZVRFTlRkbnpG?=
 =?utf-8?B?NVo2RVdRM25PUlcwQThVVkR2cTdvVC9oUlI0UVBIY1Q2MVRDbURTM1U0WXNu?=
 =?utf-8?B?VzVzc2JIbk5LZStNc0o0UDE5YTA5RFJLMTZwb3pMTkhCL0MzeHQ4SWFXeEpP?=
 =?utf-8?B?WGRmcGxQaEp4ejhLOEVsUlByVks5allNWDl0NEZESEFadk1ySm5CRThvTjRT?=
 =?utf-8?B?dkM1K1hlKzRFOHNJOWpDeERiNVdKNkhpNGZtVXNGamprL3ZtelRiMk9EWVEr?=
 =?utf-8?Q?B7An+t9J61AvynsFnm0yvJUND/3mhnT/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXNySVZQZjBSRFVZS09tYmNqN1ZiWFVGbDFHTFlsRWEvMFFZOU1TSzNnQWRX?=
 =?utf-8?B?OC9qWVgwN0E3dERBMGFwbTZ1QmVrY2RkWmNBa1FEMXlKNkJOV214QUpEclFR?=
 =?utf-8?B?TVFab1E0TmdiZEZtaFR2RDZyckFqNEM1aWc5Vm10V3c3cm01ZkpHZm1QWjdv?=
 =?utf-8?B?VURNYmo5L0dMZFJRSUw3Y0FlZzZ3aUxUVE1RazR6RHAybFZKRzVWV0R2bzZT?=
 =?utf-8?B?a3UxWU1kUXhaOXp3YUx3MVFsSVJkdm9kYXc0U28rVWV2Snk3Rzc1TENuVzFk?=
 =?utf-8?B?TEkzekd1blJMRlNwYWc4Rk1uTmJRclRjaDAvR2tzL2FLSUdXOVpTdU5OTFhW?=
 =?utf-8?B?V2lpVDlXd012eGRmOEpkdVd3MWl5WTBTSUtSellKR09oZElrcWtvckZNempj?=
 =?utf-8?B?VDRzNElieHk2YTdKbkpWeVVUQU9nRFpxeUM2SEx2cFlSeDNKNHJhWkRwUnI5?=
 =?utf-8?B?dThidjZkdEdVaUk5Tll4WmRJSDQ0VzFhbXcraFNnUDFNQmoxRmNSTTdlU3ln?=
 =?utf-8?B?ejhkSTB3UjFibnB6VGFLN2FSWWRackxuUW9GMVh1dEJUSXhaOXB3eFNEbmxh?=
 =?utf-8?B?cXlDeUNyeXl2dlVtMXVDSVRrbDkrUHBDMXp5NnpFWnpTNFZwUFd2WXQ5QUhU?=
 =?utf-8?B?L1hEN2xhK25MR0l5MVFZNVplVCs1ckVnWnl2V2FHTXdqV0lJWDh6aU56a21n?=
 =?utf-8?B?TUozcDdhR3htVmMvRUJuSi9ya01la0t5WWZ1T2xzazd6YkhGSTlpcFo5bEs4?=
 =?utf-8?B?VHNYS3lKKzEvNXM5QUZXRWZuWW4xdlpUcXRFM09LR3p5TUdGQnNGRXQrbHFD?=
 =?utf-8?B?TkcwVWF4RmVLOEVId2YydFpOeVkrMkE1U0ZtNWZBVmQ0Sm1RZFVjd1lWN05U?=
 =?utf-8?B?RmkxeWpwUWwwYmN2OTFtcUNXUGtoYmNqbUhDaWRYK25USGFPTjRKR0wxTnRt?=
 =?utf-8?B?WnRHdkJvMWFmYXNuOEcwYlFQaUNPeTFBVXF3NG1KWjJUanF6TEErbk9MMkhl?=
 =?utf-8?B?eThUZWFSL0JMRUZoWHNQWDJkYmUrOEVMcjFnYlZBdVJpU09Ta1VaNjV2Tkd5?=
 =?utf-8?B?bmN1L3lRdFNZZHNJSXljdmtQRUh5RW1BTGZCUDVndjRsVHpkMlBvYXVFbEtE?=
 =?utf-8?B?VzRHR2JGMm9NWm5qQ2kzcVBsZ09EV1VuY281SDBHTGMySlV0TkxKRWVxcmVt?=
 =?utf-8?B?Qm1QbXR5djFVOHMvRXFPcnR4RGloWUFBWERMK1hCZ0dEbENOcWpLcFZRYW1Z?=
 =?utf-8?B?Vzl0M0ZjdUoyUDZhemxqZDVQU2tQTHRPSFplSmtYZ3kweU4xekp2UHlXSTNP?=
 =?utf-8?B?SmtOK2ZFMTZGQjJwamlJS21mTFJmT1lnUURTWHM5a1YvV3NTZWtLdFdXQWJS?=
 =?utf-8?B?YTJxL202eDV1T0hzV3gwRm0rcnNiT2JQRkVwbGVVNHRCV1Y2aGZFRElMRElN?=
 =?utf-8?B?S0tSeG83WlEzaUt1ZDEzSWlzMGliSHdQYlc1RFluWHBGd00vZVRsTmEvYW9J?=
 =?utf-8?B?a3ZQTWR0RUV5NWNUZ25xUVZTaFA5dENmTEpyQ2tLaTBLbW1xUFo3WWhrOHBs?=
 =?utf-8?B?cWYyc3hmYmpqQnVRUVZJTXlhejBRdytVWWMyQU1IMDEwT2wrSUdOSHVaWksv?=
 =?utf-8?B?M2Fxc3YzMGZMczhnS0tpZ1BRRDA0a1NnaWMxd3pwYnZ2dWhYSVFuckVoMHow?=
 =?utf-8?B?anJNbGtPVnRaZUdiNTBkc1BvWGxNWEk4Qi9tMGxlSm8wSVQ0c0JiNUY4cCtl?=
 =?utf-8?B?SmpXYTlDdkxrTzR3ZEVPVmhrdDUrZFRseXJ5alF4N3pLWW9Sd0JrNy9PL3Nw?=
 =?utf-8?B?ZWtIMGR3K1k2RW9xSHZ0azRVODJ0NHFtRnM4aTM4dHRSVUVncHgxU041a0hQ?=
 =?utf-8?B?enZRdHpDVGhBcUpJWGhmMEhNZWsyY1JnMkpMQ215VnFCRncrd3kyazcxc0c0?=
 =?utf-8?B?T0JzTUpRbFo0b2Vsc1o0SzVnRHIxa1JNbWpWWVRvRVVEQ05nb05YL0QxWGZN?=
 =?utf-8?B?NUdlOW5VVy9HdVhBL0RWVGlYZ3E4eWk3S0JydUZMRXliZ05XYVBQaFRBWFNK?=
 =?utf-8?B?eTU3azJQVXhUTk5aU3ZCNDJMMEtEdE5Cc0VPdDF6T0g0RjN0eFNNQ2ptcFNJ?=
 =?utf-8?B?Q2x0TFk1VkE0SkNqR2tIZXNBSFVxNUppemtScC83dFZzdE5HdE5hcFgyQmo4?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c87c91-dad3-427d-df70-08de17ed37ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:47:54.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQeqg44X2M4crTmfXIFK8QsUj/qT8ykn7HqNMTZCNCH/Gx4glA20pfW3Gd+hnDVr/wMKIP5jBUQ6a+xSPPnpyKv21C9d4BXCdChxdRnpSu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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



On 10/29/2025 9:47 AM, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:17 +0100]:
>> In upcoming patches we will want to configure VF's execution
>> quantum (EQ) on all GTs under single lock to avoid potential
>> races in parallel GT configuration attempts.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 58 +++++++++++++++++-----
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
>>  2 files changed, 49 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index c0c0215c0703..717f81e76b8c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1732,29 +1732,65 @@ static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>>  }
>>  
>>  /**
>> - * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
>> + * xe_gt_sriov_pf_config_set_exec_quantum_locked() - Configure execution quantum of the VF.
>>   * @gt: the &xe_gt
>>   * @vfid: the VF identifier
>>   * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
>>   *
>> - * This function can only be called on PF.
>> + * This function can only be called on PF with the master mutex hold.
>> + * It will log the provisioned value or an error in case of the failure.
>>   *
>>   * Return: 0 on success or a negative error code on failure.
>>   */
>> -int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>> -					   u32 exec_quantum)
>> +int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
>> +						  u32 exec_quantum)
>>  {
>>  	int err;
>>  
>> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>>  	err = pf_provision_exec_quantum(gt, vfid, exec_quantum);
>> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>>  
>>  	return pf_config_set_u32_done(gt, vfid, exec_quantum,
>> -				      xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid),
>> +				      pf_get_exec_quantum(gt, vfid),
>>  				      "execution quantum", exec_quantum_unit, err);
>>  }
>>  
>> +/**
>> + * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
>> + *
>> + * This function can only be called on PF.
>> + * It will log the provisioned value or na error in case of the failure.
> 
> typo: na -> an
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>> +					   u32 exec_quantum)
>> +{
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	return xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, vfid, exec_quantum);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_config_get_exec_quantum_locked() - Get VF's execution quantum.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + *
>> + * This function can only be called on PF with the master mutex hold.
>> + *
>> + * Return: VF's (or PF's) execution quantum in milliseconds.
>> + */
>> +u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	return pf_get_exec_quantum(gt, vfid);
> 
> NIT: Perhaps it would have been better to be consistent and call it the locked version here.

almost all static functions in this file are expecting lock to be
already taken, also enforced with lockdep_assert_held, and we use
_locked suffix only public functions (as those usually are _not_
expecting the lock)

> 
>> +}
>> +
>>  /**
>>   * xe_gt_sriov_pf_config_get_exec_quantum - Get VF's execution quantum.
>>   * @gt: the &xe_gt
>> @@ -1766,13 +1802,9 @@ int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>>   */
>>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>>  {
>> -	u32 exec_quantum;
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>>  
>> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> -	exec_quantum = pf_get_exec_quantum(gt, vfid);
>> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> -
>> -	return exec_quantum;
>> +	return pf_get_exec_quantum(gt, vfid);
>>  }
>>  
>>  static const char *preempt_timeout_unit(u32 preempt_timeout)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> index 513e6512a575..b4beb5a97031 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> @@ -40,6 +40,10 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, uns
>>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
>>  
>> +u32 xe_gt_sriov_pf_config_get_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid);
>> +int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int vfid,
>> +						  u32 exec_quantum);
>> +
>>  u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
>>  int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>>  					      u32 preempt_timeout);
> 
> but anyway it looks good:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

> 
>> -- 
>> 2.47.1
>>
> 

