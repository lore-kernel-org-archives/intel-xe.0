Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423BECAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 10:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27C610E35C;
	Fri, 26 Sep 2025 10:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax8TlSqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30E210E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758884199; x=1790420199;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LNSCnMdTb+cc9WSPUeN2NHL2RxVztWTiJ9MmFt5E3X0=;
 b=Ax8TlSqpEpVi4GfDTseqDm2nJ/EmvFGN4taLK44Q/za5iNMiS0CMNL4q
 oyEC2bmK0GU/xZ4BPudDV2w9uqHE/hlUe4fZM4RN/wSCjS8JZCIXrDr3b
 6Kh4IgKcqtopzRl6HYtj8bRompvmXJk6/wjSCswIaGM5N16CTJYXbYHQH
 1QQgWboiGKvsu7XRl88GMZH/STQRQGRvEEFlbS54eQrMNlUNYh1XQX+Op
 Yrsf1C+CAlFnjkaX6GN6fsXGIfSEv++l5IEXwC3VkyH9uIYZsPKfTWdcR
 YVEsC56kJhNxWhwy53W/WuLsHi43xWFWIU94PuUvWlg2nUxH4lH8rx3cx Q==;
X-CSE-ConnectionGUID: Re3abIFzTciwTpbO5r9YJg==
X-CSE-MsgGUID: KdJYzg4gShKrzghFSCeYVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="48778288"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="48778288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:56:39 -0700
X-CSE-ConnectionGUID: znKofsYhTGSa8Z9mv8p6gg==
X-CSE-MsgGUID: bQgpKPsYThaQC8b3k64N/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177152128"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:56:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 03:56:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 03:56:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 03:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpE7k/UZ7sNEn/th7XjnDzNFdB6RJrMd1XJbfWROL0LuSReyxkT8Cm+BiwLzkiEpyqLPn1oUPcjs9aC/XFVorXywfW1K1vJd3sYyFZZn2quEaiES9bVnTXq01OPgFJjYii/ED57WN3zOchS0S5YXnUgNic/UurJ3qY7pSTt3KHwPRP7Ix/d2gz+J7gQeHPK+YnFCrxgB/BgQ2CQSxWcjeasgU5lzdPmYJrG4ABN1MRyEZnB2U8qr55s4rCjE+JRkpgbl5Vlau/kIifrUV9mJOckp3unrIZ/Fk2HotFvDr+kbD6yI6rXue7bKQh+0R4+lY/2ngbmLwe6vd2l81x6KxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBDceAryucWexz96PoVbSx8IrAsx58lxmJDxWK+Bnos=;
 b=f4cf4HiQjeoZUCSDjLhd5cftcBAb6uth8pQ37GRGrqPEKgG4kE8T0oHVK6jAfPE+qFHE+jmKkiPGvh+fU1c/emr4LcWEBevdXJLXPEV9NaYgC0Ew8KTwsZdprcaKESkynfPzozNpCobU1hDX3sLIsfX3DDigpYl8HjpBRsB3QPd/kNrXg1wyQAP/OSfj2/6Coj/BMOHchcUjtkL3blMtxjyvu/7wZB2NFOBsBHUCxYz5NAWYYW3HVGokcd6Dg0EXkvHJOaFz3Ka9Egr5027XcDvrP+cMbgnPL0pjAxd6q50q430Z08rWYVSpJZ43GGs3zJbD3nKRh2Gs9y09kwZ6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 10:56:34 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 10:56:33 +0000
Message-ID: <f995cf6b-7dbe-4216-ab5c-ef613f7dde95@intel.com>
Date: Fri, 26 Sep 2025 16:26:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/migrate: Atomicize CCS copy command setup
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20250926101814.2148970-1-satyanarayana.k.v.p@intel.com>
 <1b9403c0-9944-472e-9d7a-af1c2519d18e@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <1b9403c0-9944-472e-9d7a-af1c2519d18e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: d3545e8e-60da-42c6-ecf2-08ddfceb5ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTR4NElzRG5nZXhDWEREZU9RaWQvWjZLMWJSUGJ0RE5qRlFja3IxRkpTVWxx?=
 =?utf-8?B?TWpGNm1uUWI4NXdaT3pQdkVoMkdYcVVmNW5FQU1oeVE4eTRKSDJnQmRhVVVw?=
 =?utf-8?B?U3F4SzJMNVNqR2tpeVFrNEk0RldFblFnRlQ4UmZBT0NoeEFzS2Roc0xtaSsv?=
 =?utf-8?B?dmVUSXpCeGhGVjJOSWFQcWJweWlscG9hbU4wM0RVM3N3Z3h4cmVUWUwraHpz?=
 =?utf-8?B?NG45a2lGV3N3YzZLNnJja2xURGpmZVNIMmh1QkFPU2J4YU85RTI2eHdVQTht?=
 =?utf-8?B?NjlZbG9iamRTTDhoa1RmRTdDTHJDT3FxUWZDRFdCLzg5RVhZbXE0MVVLZzN5?=
 =?utf-8?B?cWM1cGRGSW5QVmtteDUzK1VaV3VqYlpNL0ZkUU9NNlc1cFFmZWptdDZ3RVdw?=
 =?utf-8?B?eHVWcUE2elpTZXNuL3I0Z0o0b2tHeWJtcGZoN3ZmQWRlaVQ2Q0R0eXhDQndq?=
 =?utf-8?B?dUhnSm9TVjRLdkdEVWVZNVYzd1JoRjBWVnhLclVCNFFFMnlGWlpWb29JSjdH?=
 =?utf-8?B?MzBLZGoxZ2w3eG5CampxYWZKd0QwOFR4OFR4eStXU0VDUVN6dFVHUzN1Z09F?=
 =?utf-8?B?MHBQeFZBdzIrS09vcDRvbi9WR3I2Nk1seUNUZG4wUkZmYUo4Vmw1SlRsWnY2?=
 =?utf-8?B?UitNU052SVVkc0xOUWdINlFaTzJHR1NNSElTcDlzRGM2UklOdHY4bk94WEJX?=
 =?utf-8?B?QVBZakZ5eGNvOGVEdWJOQm01amVOTkEvK3gxZkwyMVY1bXkycDI3M2RwOWta?=
 =?utf-8?B?aE9iMHduNklPd1c1c1VCNmU1SHZQTmNHTkovREdSY1V2Vk1TWnB1N3VYOWdi?=
 =?utf-8?B?NFcwbmpmQ0cvWHpnL1BuZHIycFphWXdLeDhPRWhUWkdrZTR5cVdReGcvNjdp?=
 =?utf-8?B?SnlJTlVna0o4QmUyVDBsUXhwUWdLOU1yTnJXejFSZzdzeDVRTXhUOUNQbFJ6?=
 =?utf-8?B?YjNMTytoK3FubTZWRkIxOHVrblBmQjZmTGp3MU5IU05CdTJlcjE0MllxdXpU?=
 =?utf-8?B?Rm43NGhnc1VCek54aFVXOFM1U0NaRHJDMm4wLzhwUFIrWjNMcnFUb2xiSmRU?=
 =?utf-8?B?YnVjNG9rZ09ONTlVdFpBWFg2ODlxMlpoeE5GbkswUi9iQThNenRya24zZDJp?=
 =?utf-8?B?eExHRlVWcjZYd25YSnVHRjFaOXJMck42UWNmWEkvQjVTNDROSmIrK0lLMmJU?=
 =?utf-8?B?Zkp5Z3NacllvSk9BMW4vNkEzRytsRXIxVlFydS9Lc1JaY2d4M2tHMmVid1Vw?=
 =?utf-8?B?MWQ4MkFjV0hGOW5maXEzSjRBRDZRWTJ6dlpoYUxLWVRGTnNaZWFxczVMRWxT?=
 =?utf-8?B?QVFBajdzcldTN2ZMNWcraVhYNG9xYkJaRjZjRk5lZUlSeEd2VENMNEJvUDA0?=
 =?utf-8?B?bnZmdHBMQlZuTTVCdXVzcklhM2JIMXF4bnBFeG4yb3AzR0FBNjdFdjY3REd4?=
 =?utf-8?B?WnhjZkF0dHdGODZqbWE3QVdwUjV4WU9mdWxNamRiZmRYSXdBMERab1M5ZW5M?=
 =?utf-8?B?MVp2blU3a3FxRHg0VUNqbS8vM2NCMDN4UzNKQTRvRDZ5NHo2T3NEaVRyVDc2?=
 =?utf-8?B?M3RpSlM2VGY2WThkSjVYYWpXUmhxWkpXTlhpQ2VZMkp6aytJMVpMNEJ3REND?=
 =?utf-8?B?RHpYQXo1ZlhmMUJxdFk2N0xMVEdxNGtxUUFNcm1vNVAzaEdMSlJBUDFSWjl5?=
 =?utf-8?B?M0prOGVibE9IbEgyTlFvaDNkemlReUtKZ0UrbGZaUWtDaEs2di9DaDh0Vm5s?=
 =?utf-8?B?OEpPUS9TWHZNdTh2NlBHUjQxY2QrYkRnaWVTVCs4V0Nxdkw1VE5CeXY3eDhy?=
 =?utf-8?B?NkRzbzJNOHdYUjQyQzc2aVV6ek1OajNvU2dDSG02WEhUcm5CbGNMdmE1RWh4?=
 =?utf-8?B?QnhhdW1LSDdzVSt6V2lTKzREQUZkbEpKQ1lOQWhXcU5KUDFab0pRMjh2Zm1a?=
 =?utf-8?Q?ppVcMm5k+gyqR09kyibWnMrjDr5CNhO5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2h5bURNVzNhLzNwenNMUFJVdWpBc1dSU0VZZnB2WkVabzcrTkZuUCtiTGw0?=
 =?utf-8?B?MUhXeTF6NDUrRW9hOUhZU3pSdnd2b1p5WTVZVFBRU0xWMlpBdE8zUTltZG9a?=
 =?utf-8?B?S1BnT25vYXRueUMwWGdoTFlONUQ1blQ1MlI1NWxUeVo2WkFCeHpqeVBNMTFt?=
 =?utf-8?B?RTB2Zlc5VDhRRFlUVldUSkQ5QVZEcVljU3gxWkZkOU53U2Y5UWhndXhneGgx?=
 =?utf-8?B?Q24vUUp1bzl3dVBTK2lhNFNNdHVlWlVCWmVORC9BaG8zZFQ3Z1RUd2wvL0tT?=
 =?utf-8?B?YnJTVWQ2TXdDVitycXhrZ2ZZSXFiUlVqVE9IT3VGVU5CcSt2bldieitVNUtq?=
 =?utf-8?B?b1htQktXa052T2JnQjM2QmF1ZGdpWlBMMkNZbEI1ZndnMmtWaExhK3hQdzNV?=
 =?utf-8?B?ck9BNmV2ZkMwRmxPdHJITmVPUno1TGs5UXlYOGcyMnRiK0t4TlBzVkozMUpX?=
 =?utf-8?B?cEJ3bGhqLzI2aVFqOW9qUTAxd3B2Uy9GSE92Z285OHUwWmx1dUVRZ0dacG5h?=
 =?utf-8?B?ZGVKdm5WY1lVTi9xcWIzbG44b2dOaExBTTh3dzg5cWFWNmE3ZGNhVG5MRDFN?=
 =?utf-8?B?NmtUOHEvV0NPTCs5UkdhNDl4YzNPYmQ5Y21ic1dURjZaMkVnelR1TFlSV0tv?=
 =?utf-8?B?WGdrcER5eG1qZXpQallqS0lzTUVZbTdLYTZjQ2F2YzVRMVExRzVvS1BydEdL?=
 =?utf-8?B?VlNFT2M1TEwvVytyMjJ0b2hEWTFMb09GdGJ0WHMyUGtUanNjdWxGT1QrUmpS?=
 =?utf-8?B?eCtsNHhvb2NrNUxIdU12SCtvNGZudkFJd00va2NNeWZVa25qbjZGa2RiT0cr?=
 =?utf-8?B?R0grREJQODFLVE51czh0MFZ0c1EwWDMvaWNBcG1OcUQ1MUxQa3pMSGlPZGhD?=
 =?utf-8?B?cGpIM1FSbUErSFJDa1ZhVTlLU1lKdzJRUzZyTHB2WmhIdVJOTEhPNkxwQUZz?=
 =?utf-8?B?dUtDWHdHT3QxT2hWc1BGUGQrVG9iVVYxQzJrSERNL09jaDNqdmpLd1lvY2tL?=
 =?utf-8?B?UGJBK1NMU0VwbkVwR3ZwejByVlNmNmdoZWZ3YzFGNm5rMHFRTlJrdUxhcnRS?=
 =?utf-8?B?NG9XNlRhejgwc2dVSCtOdnprSTdOV0UrQ2RacVdHdDdwNFc2V1hKaDlyVWVB?=
 =?utf-8?B?UG1ES2ZKL1ltM1hnQ2VEWWNFWnhiSFRuODkxaEFSOFZFNW54R3lkaGlCcCtV?=
 =?utf-8?B?WndxUmJZOG11MWJYcEdxckZNUnZSRXpOKzh0dGphWld5K3MyN0hLbnRUUVFh?=
 =?utf-8?B?T0c1Yk5iOGFnUFJtL0pGaDg4dWtwWkJnOGFibDlLNnlEZThKeExBMzBmUlNo?=
 =?utf-8?B?Y0M2QTFOcUdUcllqNkxLSjVvYWc2alFNV0NFbi9OYjh6azgyMGhxYjBCRTRn?=
 =?utf-8?B?b2d6OGxiNlZhbDVheDRLaDJlWkRFNnhNTDF6S1lNSnpCbFF1a3U2TGZCL0hB?=
 =?utf-8?B?QVlyTUVOQVN6aWN1TWo1eHkvZzRRaUk3dHBVMUQzWDUxNG8zdm1QU0hUalBG?=
 =?utf-8?B?aUMrMGs5UHM1RjNYSU9USDVtZlJRVUhNQ0pVZmpDRGlBVkgvVmJRZnBOYytH?=
 =?utf-8?B?U0ErMlJYb1J0b0dwZmxzM2xZVUUxS0dRQ1kvMkdWeFdMWmNUcDM2Q1dIMW5R?=
 =?utf-8?B?eVZjaHYyRjcvQkFwclA5b0U3TGR3R0sxQzIzcW5UT3RPajdQekwrRVdPQkxR?=
 =?utf-8?B?dlB0ZWNUMzZGWExXWVNlaDRKZ0Rtb3VRVjl1bnhIbFNuZ0IwUWk5T29naHZG?=
 =?utf-8?B?bnVpT3Q0QmpxU0RrNzQ0RW9aV1ZzYVEyS1pJYWZKeEc0TVk0MGFmWGg4QVBy?=
 =?utf-8?B?SFhVNGVNWTdMaTROZG9GckxZZEdBc3VyZDBJMGpGUDZGUVErNjRLZklxaytG?=
 =?utf-8?B?aE5KdENDV2I5bG5JZ2VBaXVTVWVBMVNOZ2NUMjFkakR6RVZ0NWx4WGpMMkFy?=
 =?utf-8?B?UTliU3hIUXdrZTZ2MVdaV2hBZlUrOWszSElSY28xZFRjQUZldjZKMXptRW5U?=
 =?utf-8?B?cnlNQ3VzNFNoeXRzTWxYSWJIOEk0ZE5qUEFhNWt2WElTbzI1aFY4MERkZ25r?=
 =?utf-8?B?d0QzUmp1YktOTXFvMkRiTUljbzlnb1RyVjE0U0xNRXE1WWtYN2N2Q0JEN0V5?=
 =?utf-8?B?ZlNybHNranUwRzNnUlRlVDRZU29hTFJnMFFGNWVOS2c2d1BldHhGaHlob3ZP?=
 =?utf-8?Q?rJvFoNv4e9eTJAnWuAq7el8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3545e8e-60da-42c6-ecf2-08ddfceb5ab7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:56:33.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJNmFc2yBgcb5h2rY5yr9LfVrD9GyTztAopOOjvlDIHjeiVJXL0CcyiB7DXdKZgJ1q4JoU1+yNAiUUSD4xSAfCcCvXo4o3xmbzBdkR5u92w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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



On 26-09-2025 16:19, Matthew Auld wrote:
> On 26/09/2025 11:18, Satyanarayana K V P wrote:
>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>> save/restore while this sequence is being programmed, partial writes may
>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>> instruction to write the sequence atomically.
>>
>> Since VMOVDQU operates on 128-bit chunks, update EMIT_COPY_CCS_DW to emit
>> 8 dwords instead of 5 dwords.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 40 +++++++++++++++++++++++++--------
>>   1 file changed, 31 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/ 
>> xe_migrate.c
>> index e2fff2107f68..8c8685be3b44 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -644,18 +644,37 @@ static void emit_pte(struct xe_migrate *m,
>>       }
>>   }
>> -#define EMIT_COPY_CCS_DW 5
>> +/*
>> + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>> + * save/restore while this sequence is being issued, partial writes 
>> may trigger
>> + * page faults when saving iGPU CCS metadata. Use the VMOVDQU 
>> instruction to
>> + * write the sequence atomically.
>> + */
>> +static void _memcpy_vmovdqu(void *dst, const void *src)
>> +{
>> +    kernel_fpu_begin();
>> +
>> +    asm("vmovdqu (%0), %%ymm0\n"
>> +        "vmovups %%ymm0,   (%1)\n"
>> +        :: "r" (src), "r" (dst) : "memory");
> 
> I don't think this is portable? I assume this needs to be hidden for 
> non-x86? Also ideally disable this path for non-VF stuff, since this is 
> likely not free?
> 
I will limit this to x86 and VFs.> Also don't we have similar issues 
with emit_pte() if the GPU really can
> start executing before we have fully emitted all the bb programming?
> 
We do not have issue with just programming PTEs. If the the Copy command 
is not fully updated in the BB, then the page faults can happen. Normal 
memcpy is not atomic. So, had go through this x86 instruction.
-Satya.
> Is it not possible to do the bb programming as a separate step, and then 
> do the bb jump/ring programming only once ready or something?
> 
>> +
>> +    kernel_fpu_end();
>> +}
>> +
>> +#define EMIT_COPY_CCS_DW 8
>>   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>                 u64 dst_ofs, bool dst_is_indirect,
>>                 u64 src_ofs, bool src_is_indirect,
>>                 u32 size)
>>   {
>> +    u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>       struct xe_device *xe = gt_to_xe(gt);
>>       u32 *cs = bb->cs + bb->len;
>>       u32 num_ccs_blks;
>>       u32 num_pages;
>>       u32 ccs_copy_size;
>>       u32 mocs;
>> +    u32 i = 0;
>>       if (GRAPHICS_VERx100(xe) >= 2000) {
>>           num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> @@ -673,14 +692,17 @@ static void emit_copy_ccs(struct xe_gt *gt, 
>> struct xe_bb *bb,
>>           mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>       }
>> -    *cs++ = XY_CTRL_SURF_COPY_BLT |
>> -        (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>> -        (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> -        ccs_copy_size;
>> -    *cs++ = lower_32_bits(src_ofs);
>> -    *cs++ = upper_32_bits(src_ofs) | mocs;
>> -    *cs++ = lower_32_bits(dst_ofs);
>> -    *cs++ = upper_32_bits(dst_ofs) | mocs;
>> +    dw[i++] = XY_CTRL_SURF_COPY_BLT |
>> +          (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>> +          (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> +          ccs_copy_size;
>> +    dw[i++] = lower_32_bits(src_ofs);
>> +    dw[i++] = upper_32_bits(src_ofs) | mocs;
>> +    dw[i++] = lower_32_bits(dst_ofs);
>> +    dw[i++] = upper_32_bits(dst_ofs) | mocs;
>> +
>> +    _memcpy_vmovdqu(cs, dw);
>> +    cs += EMIT_COPY_CCS_DW;
>>       bb->len = cs - bb->cs;
>>   }
> 

