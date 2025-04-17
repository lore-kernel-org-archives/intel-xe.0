Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D03C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 05:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BAF10EA33;
	Thu, 17 Apr 2025 05:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEtMkJ0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ED410EA33
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 05:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744867072; x=1776403072;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8CKZ3KOy2skLwgKcIX/NTijiZ7/R0OGOnGsN/H2lzto=;
 b=HEtMkJ0Ce3JqRLuH5tpRKP00omFrKmhVBhTMB/GvF49IpspyU0ewY6Do
 8n72iiiREV4DjNyulqm+DP0gjhMCoYH3lLd+38YSGSEd81ShVjcjt4Ink
 Z1MTDesHxlK2fbNOKIPDrIVMVpWpYp7AmOF9veGaD3GeADjoQbvJ+NO+7
 MyY/eRBVkInuKxs1tjoxYU+gAb/2Ce+7CeCQG8xw9tB1BhYytz0WEVqzw
 jtA7b8dV8lv0Vrf39xgipKOthwuSPg4teZjd/TrDKYTkeqKbUVe5osBIc
 +SrupAGFiaLGomZz7HsZ6QEZlYXkXpXvPqOIMD7vZaE/eaCjY/VQBtNCd w==;
X-CSE-ConnectionGUID: SCmpySvxQSucZ3VxJrMb4A==
X-CSE-MsgGUID: bclYjAF9ToycAURTUalEsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57080257"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="57080257"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:17:50 -0700
X-CSE-ConnectionGUID: uda/yZ7HQ1um9R4Q88I86Q==
X-CSE-MsgGUID: +KfB7uCmQ1idfOuvsLkQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131593849"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:17:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 22:17:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 22:17:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 22:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVSF1jZzdLV1XdvygWcKS8lmBHXJT76HY0z7bRT5yLfYSoR4yTnE5AjlHhv+TjtwNxuNS+JzD7QN9D2FW5jPUj1eIvDvOzL/yD28ltGpOttizqqhqHVS0PUtiA3rlY4YL/IbRkyx9lfbIfiu2yu83JVJ9TQ7wrG1ZztL0EiXM2+OV1GI4UUZBZslAuN8GyFBURg4hCvmpz2PUSoG7g8s1OCMo1gvzC0z4UWi1CKmTlxfD56OAPBfAFCDJES4iGywUVPDNhYP2v6tBYFihRuGu9dbtrMLcWBnre5dyXoJaM8LO4/jVV5sv3uZHg9fTbqbyYnWA7/HiIhtCl0r7fqV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqIeZuni0aE8xDT1oSwD3fgibq7Doo6yu0DnRI9k5CA=;
 b=gthbYoSASv/4buaq3Id8W91hb4coiSsnDQIr29o4N9l+VLWJ0X32Ov65GXdBNMOtvT1tniqYlmg/VGEpSZLHooEje3UA2gyl2rdpIwfx1tHDzFO6wbnRKCAXzl2c8TmzGVOis2R8YqYGuWFtQ3ngM9fzNbPIciJmFOmdCQXYqWyVI2vrczHI8UwoKg9UX+BFeUe60QgtC4395fhDyLNRQqNrEah/nmOdbgT4ibqc5QFrpJUnpaDQ/r43asiMqFx9yGJU+FWv7z1JhE6a+515lSUNT5bxG7fN7xDfCFKUUwoFeBVhTUuVR1COyERd7aQrfUPs2Vh1ZH06F+6UqlnD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 05:17:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 05:17:26 +0000
Message-ID: <6ef5b3b0-cf8c-4882-a686-9b9c7f6679c1@intel.com>
Date: Thu, 17 Apr 2025 10:47:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-3-raag.jadav@intel.com>
 <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
 <Z_-NUpQjdXIqrP_9@black.fi.intel.com>
 <16165ccb-25f8-4cd1-9ac7-63496c965be4@intel.com>
 <Z__MHqrwNmXW8lmu@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z__MHqrwNmXW8lmu@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 834a3f88-7795-4b8a-300e-08dd7d6f243d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDVPZlRiN2dzQm9acWJoRE5lRWgvRVBRc3Z0N1VlcTNCNXFuVk95WHRwbE12?=
 =?utf-8?B?MTdoUDBRTVlocDlwMHdMNlg5Mjd3dDJ0WjRoaDU3K0k3S2dJVWlCek1yUmRZ?=
 =?utf-8?B?V21BZmV2T3JpaGRTeWh0TDNpVUhqZUFEd0hMNkxiamZVcCtTZlpHYkpvQjZm?=
 =?utf-8?B?TDlpQW9vellGUVZzUXJLMGQvYzFCa3lCRjVtTyt2SWlSRndNVmxvVVZHTDBs?=
 =?utf-8?B?Zmw3eWszbGdSNEcyREFPcFphaVFGK1BieEJ1VGNQZzhTN1BUemxmeGxOZjFs?=
 =?utf-8?B?ZmppQzBrcTMxZEFhY1NsdmttUCtGWDJpUTZLaTRiVkpSVnBMRW5DQ3c3clly?=
 =?utf-8?B?OWtVcG1XL2RtSjFieGNvS1JDV3ZIVFJYekMyRVJ5OUdrSDdHVEF0dTFNYWxu?=
 =?utf-8?B?amhhSm16MFR3djBMbTBMZEEzRE9OaHRPYkVJT2JHSTFaQmhRRjFGSlJsZ21s?=
 =?utf-8?B?NzhUcWdwYm9TTHEvUTVVemdVRFB2WG12YnpUaUN6TUtrM0J1aWVhMElYdTdR?=
 =?utf-8?B?SDhiMzhCZWcxRmYwZ1U4ZlQ5NTlweVZGcVNSUUx6UzhUbUdubnlOWVFKbE9u?=
 =?utf-8?B?Y1ErOU9lNkNEaERtZTBXWGIxYjZySXFPZmtmOFZma3Erb1JGaEx0c21LRmNq?=
 =?utf-8?B?cUJPbVpuaTZNN1lRMjRldFFVYkFKT1NjTmlkbEpMeHJCdFRBbGIrNS9ra2E3?=
 =?utf-8?B?UUxUMktFS0lidHFvckUwK1FuSU1Rb0srb3hiT3dMNlZwZmlJeGorUHpRazFy?=
 =?utf-8?B?aUJvN2Vxbjl4QURoc09uOFZoMXRnREZ4dlU2d1RucTRIdGw2end4b2Z3dVU0?=
 =?utf-8?B?by9Yd2k2bHprQS9nUHBrNGRqU01STDZDOWVtTGo2RktaY1JLS0pjY3FhRXhj?=
 =?utf-8?B?S0FpaFNHd21QZ0FiNnM0NDZYRThCQXEybXFONjdOV01xclVUZXArNHNXZ1Nv?=
 =?utf-8?B?ckE2aERLci9mbDU0bTJBMEYyTXJwMjh6eXNSVml2NHBmTThGanFOZVpqVm90?=
 =?utf-8?B?RDFWZGQrbmUva3dqQ0tIOCthWnJOTWVuMTZOeEF0WEpRTFJYb3lxOFJRVll5?=
 =?utf-8?B?WVpDeE0rRHNpQktpTE1xaTBPdDM2YVBlRHY2bXA5cFh6Smo2VDZrSHRMNFZk?=
 =?utf-8?B?c0tXeWp1SDRwd1orTWtJMmN3NG9RUExJOE1udzY3THNFdlNYY29pbHdBSWhH?=
 =?utf-8?B?dk5NdlZHbURYWDU0cUhKV3ZXcjMwbzRDMkF5S0VxSnRBdUpxM0luYmF6WVA2?=
 =?utf-8?B?b3RySEprSmpWOXpSSllsYVhSN0hzbWVHaThaZEpEcHBjaUtuV3VING1VOFBN?=
 =?utf-8?B?WTZVQWdNdm1COXdXeGZVS2l5TFZIQUFhVHcwS2Z2WE1GRE9Rb3ByRktNMktU?=
 =?utf-8?B?dTEwOFBra0hBK0NnbjN1cDBWSTE3dnlnOWVuamx2RVc2Z3NsaHpZVEhOSVQ2?=
 =?utf-8?B?ZTlzRWFycFR1Y29yWnU2aG9QVFBYNGVxSkY2aDRlR3Mxa20zTmIyMFpVOEd0?=
 =?utf-8?B?ZVIyWDRKSUJrdStWWS84TEx0NENhQVV4ZnF2SFpCL3NZWGNndTdaelpqamZm?=
 =?utf-8?B?VE5PQmV6ekdtS1ZqMDJsMDB6UUFSb0pEbCtGQ0hXeWs2aFFDVWRKdHBuSHhV?=
 =?utf-8?B?QTFra3B6TzVtTWtlakpQLzllTnR3enA0MFVUZDViMXFnVFNxcnFpZnpTU3dY?=
 =?utf-8?B?a1V3cEhlZ1dCTlN5Ylh2bGw0UU9GZW1QS2hURldJM00vQjVvUUx6SUdGYU9p?=
 =?utf-8?B?dkhka1J0UlNDL3FpSGlzTWRZcWV4TGY4dHM5eEFOVnZkaFF5aWx4SC9aSXhZ?=
 =?utf-8?B?S1hGRGFVN1hJd3hnYU9mbGE2cndhNUFHS2FsZnhQWHFuL0ZGeldqbFNtU2dF?=
 =?utf-8?B?bjVsSCtpaDVqYVprc3M4SWM2UFBiYnVtVzJUa1N4YjhDNGYydXdlNjM1dWlD?=
 =?utf-8?Q?EmmQqFTBlDY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHozR09oT202WTF0MnU5Z0dEYmkySHJTQ2lManJjTDVqMlRVVWszS1liaTZ4?=
 =?utf-8?B?NE1KRytTN2dzNkJyaWdJTk9sSy80Nmk5c2RyUDN4TnNPVHRWaW9US2dZWlZQ?=
 =?utf-8?B?aXZvL0tPTlZ5TW1qM0tGejVJb0tlWXhqbXlaNCtlM0N5ZmRXOUp4M0RKc1ZP?=
 =?utf-8?B?WFdkMDdkTDRuai9rQUpBKzJUTW9QZXhSbkZNbGFocUg2TldtL0lFdG5OWUR5?=
 =?utf-8?B?R3dXS2NVcFk1REJrWFZoeXpxZmV4NUZGM3ptQ0NET2hiTkFKZEdxcXFHd1pj?=
 =?utf-8?B?U1BnZXk1czFUek12cFNhbkFIdENIK2p5cGt5NTQzbElJUEwydHMyZ1czOGtm?=
 =?utf-8?B?eXhyVnlVb01sczdmRitHS3hIYmhRZ29NTElyaGI5NjdicEs1SUorYjBiY3Bt?=
 =?utf-8?B?T2UxVWxFRVZGN1Z3SmVWWjFXdlA2ZTNVdUc2YlBTZzFBa0oyaExsSWZkemd5?=
 =?utf-8?B?dCtMRFZOSUpyNzFRRXRNY0xhN3NidEZxUGFWUCtpKzdVWDU3VEhvZWwzT292?=
 =?utf-8?B?eVZNRUhtRTM4ZTVhbGNYcEtJRzBHeGJlNU1oMGRNaERMWDZOdWpWdmttdmJE?=
 =?utf-8?B?azc5YjZkdjJkYzJwazZ4WWVRRDlCYkxkSlpNbnVFYmJmL0cwaW1pZmFKend5?=
 =?utf-8?B?K1FtZFpLcmd3S2FRUXZIbERQTXMrWWZiLzUyWVR5aUVCcGZ3YUlPekhiOGZa?=
 =?utf-8?B?VHRVMzNMdUJlaEhXbWxCcjkwSzIrS244Z1ZtbE5EM3pqbU0wTDNWdlM2R0FP?=
 =?utf-8?B?K3NVdXBkRzlkbW1uY21xTkF2clR0M25wRFBnK3lGU1pyZHRiaGFxQmRSM0VL?=
 =?utf-8?B?STllZE4zUUJkMjlmVlhIZTVVczFGYWpqVFpLNU9OQklXUTZsWkYrN20zQWpL?=
 =?utf-8?B?S3Uwb1FoMDNwaE16QjBtUFdYTno2ZElKTFhmdUdzNGJKanhaUDEzZkVXKzhz?=
 =?utf-8?B?SDZjc2R4bTJVRjNSMXg1alBpVnI1SkxWL1dSdTF2SGIraE9RYXpmTmFHTkhM?=
 =?utf-8?B?Ui9Na0RML084eFBkelFodDZocVZrYjk1cVkrenJyZ1pOc1o2SU54SGdPbTA2?=
 =?utf-8?B?a2RieWE1ZHZrZmJxMHVOZHpOU2M5QXBPcWRrSUZQQU03UEk4SVNVejZXS2JK?=
 =?utf-8?B?SWViYWN3dHk3Q1NNRnlpcmZ5dFJ5bG9iS3ZmWnVZZlhvT3V1ZHFsdmJuQUIw?=
 =?utf-8?B?dFFxUkxoamZ2Y2ZEeTFmS2doTTZ4ZHBpTWJ6WHl2QVZRMVVEMjhXT0FWT2Rk?=
 =?utf-8?B?WnVEQkhHbzZaaE4rSFpJdDdPdGt1ZC9WWXlNM2tVZW41cy9QWnZnWmpjd29M?=
 =?utf-8?B?SWZQQ3RRajFSRHZPbjhWdjlEb01OZnRKTmwyUXE1dnVXQ2VlckRJZWZRZ3Yr?=
 =?utf-8?B?c3ZWS2s1eWJabWw1c0I2R3N6eEFISk1uMXZxaksrajFHMnk5cDdiRS9RdDF4?=
 =?utf-8?B?THF5UjlzUnMvOHVkNWo1R1MzMEs0cXpndnV5VlFBNnNydGliM2ZFQzhheGRx?=
 =?utf-8?B?aDc5TjROWFcvckRwblBXeHBUR296dkV2M1Y1L2l6UU15SkFrMzFDb1lzRUVm?=
 =?utf-8?B?YkNNbjJKUnJUcCtYcWlIazJXUFFSbWlXSE11NUZ3U0ZKbW45SjRXOXF1K0xS?=
 =?utf-8?B?c3dVZk9mNHRxNHRzOVZySUV4N09relRJVWVoR2h5c1B0WmhvRW8xOU5QWVJ4?=
 =?utf-8?B?ZVFSSkNlV2tVZ1NoNytGREhCU3VQYU5GdFo4enFDSUw2UnVBaFR6RmJxTm1C?=
 =?utf-8?B?bDdjamVQU0Z0dXZhRE14MHp5bTNucS9RQlNocGthYTFRUVNJZ3IrSE5STTJl?=
 =?utf-8?B?dUZOcDJzbFY3blF5U3hVTzNtOUs1dUcxdU5XRFVwcEZPOWoyRm9OenBqY2d0?=
 =?utf-8?B?ZUVSTENxaWEvc0tpeGVjeUY5a0tmWVh5ejlqdUY0VnU4L2JFOGljYzAxNy9r?=
 =?utf-8?B?TFNWYThBMFppa2lkSG1oSHFiak9EOUhaS1pLK096aWlGQzdsMXp3MWozZ2VV?=
 =?utf-8?B?YjhYRmxnQWhEMnFjYmJsNjFzUlo4VTBOallTSUM0R0JJaTRLLzRkMzZxRTdO?=
 =?utf-8?B?cWFBcTIrVGxwN1gzOTZSVW1HcXJUTjdkYndnRmVob011ZW5zSUE4TngzK1hF?=
 =?utf-8?Q?c/spkcDWpX0vTL8wpK3+Tqe4X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 834a3f88-7795-4b8a-300e-08dd7d6f243d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 05:17:26.5271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p95qKL6/+gnSxLPw/Mem3s7CuTO+eyP3gh4eCS1YpPPaACN6Gvk46DDv5t/2vH8G4zLpmOFv/uDQ3JMB41wvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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



On 4/16/2025 8:56 PM, Raag Jadav wrote:
> On Wed, Apr 16, 2025 at 08:22:38PM +0530, Riana Tauro wrote:
>> On 4/16/2025 4:28 PM, Raag Jadav wrote:
>>> On Wed, Apr 16, 2025 at 03:36:55PM +0530, Riana Tauro wrote:
>>>> Hi Raag
>>>>
>>>> On 4/3/2025 11:17 PM, Raag Jadav wrote:
>>>>> Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
> 
> ...
> 
>>>>> +static ssize_t
>>>>> +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +	u32 val;
>>>>> +	int ret;
>>>>> +
>>>>> +	xe_pm_runtime_get(xe);
>>>>> +	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
>>>>> +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
>>>> indentation
>>>
>>> Can you please elaborate? Shouldn't it follow the parentheses?
>> yeah it should. DGFX_GET_INIT_STATUS should follow PCODE_MBOX parenthesis
>>
>> or align PCODE_MBOX instead
>>
>> ret = xe_pcode_read(xe_device_get_root_tile(xe),
>>                      PCODE_MBOX...
> 
> Which means we should change it in hwmon as well?
Not sure about hwmon. checkpatch is also mentioning the same

-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:130:
	ret = xe_pcode_read(xe_device_get_root_tile(xe), 
PCODE_MBOX(DGFX_PCODE_STATUS,
			    DGFX_GET_INIT_STATUS, 0), &val, NULL);

Thanks
Riana>
> Raag

