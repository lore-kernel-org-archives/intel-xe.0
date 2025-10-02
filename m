Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBF0CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EBF10E853;
	Thu,  2 Oct 2025 21:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ppxgddx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B410E853
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759440848; x=1790976848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7eZNc9+Rp1cREsYtEbog0b1Qdx5si2j61tnhNggkGbA=;
 b=Ppxgddx7zDtlV/G2JExAzL/VFMQL5Il0EkaOokT2zlsuLEP26+ztdb5D
 BEE05chhd8ayBsYioaN6Qh09vf/c+hb82ANJaGbK+GzNxMX12Pfy7fUKe
 8Rmlg2brkW+38iKrRmjOK+pKej+2ySdmXufNTVMEoh99VbrEwjZll4u2W
 PARoVpPUuye//joMc7gSIHuZuwWSuO+VBSQWTbbJnLerV1vK0031+JMj4
 cY9M4icG8gUQGm3YuNZ79+FQnWr7ItBCWlMJQiaO3HOlUgtRIbaiyhuRs
 zLazGMu3DNfYBVI910lQoLxBxPEEeypD6N2vbAQKBj9tpwcCLuYlC9sit Q==;
X-CSE-ConnectionGUID: uDNUATnNS0GxHlsO204fVA==
X-CSE-MsgGUID: EzZxBVhPT4iB+xPMxe4siQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61777593"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61777593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:34:08 -0700
X-CSE-ConnectionGUID: nHF55JHiTkys4M2gy0+fKg==
X-CSE-MsgGUID: JCC5a4amQzGEFu21J+2KHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179160597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:34:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:34:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:34:07 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wcze2fOi96rcpugnOisWWyLOSvNZId996X/grjsHZTHy4yg7fJEusW+Wm54yZMOY/UXShnFZCs43qzzQWOJqVOLbhguvQoaNuBSr7voI3XFUZSkwh08Dz3pmDeeLaWIZnEtfQXkrMkf6B9vKRdsFROQL9b4KtuTLzYX+LenOFj5nY8SoHlgqhXcR63GCsoOX1mmr4xIW3AgcSbMPqkmQTrOl1eOTSGwDLMtQsRBmxHWfkR1F7MVI1Qf6dAGDqUljWnW85Z2JPpDkO0h7Cz6Jfh4OqZ6O4Wx2f9yS1CALl8fSaanVD9OMCd4DE+V1DKEWmlGvz+eCbZ4WhNs3O/p9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlXbGhwHCcS3wWmGaOnSX1kwMaMoxhForOB8rtUi9BI=;
 b=ga7TYCHiSFxpvAKY8RQbLUKsMeykwTGCzCqR121ydPo8jrkRejtV4mn+3eUEBpIed+VKPlD/KDULL3/7JYJEYivXPJEd38J78V07xnktRkh9SPQeX83wFwGS9TlGs02wcKIMV6iwTkpSWRvn1HcyWj6pzyosFUa2A6NcB7SGLb3H3e1AAtt8Jj/LY4MR+BAOsapL+Pj/4upY+domrUnDsrHXRzDAfYPWRwiQlKcSuLaNnv6eI9Tb1VT/OKqjdMQ6SWW9pDsGONlrKKoF2+k0MOZDqb61O4yhCbkaDnfa50uOlTibqjQOcBvbaGaKvJ6lkmX7x0+nBKMK5FiZ2NiQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV4PR11MB9513.namprd11.prod.outlook.com (2603:10b6:408:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 21:33:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 21:33:59 +0000
Date: Thu, 2 Oct 2025 23:33:56 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/pf: Log only top level VF state changes
Message-ID: <qfaneymcbydau3ibcfqdomb4fojhwgsesfvprwm6zf3nqhydyu@j5e7dqd7zvfl>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV4PR11MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d00df2-4374-4ec7-b104-08de01fb65fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm1RTHRDWGx5TElUWDYwNmlxN2tGM0hXdmw5VitKaURPRHJmZ1lleEh6blB3?=
 =?utf-8?B?VFo3N091YmtzMm5helBvalV4QTd0ZXgxOE1uSWhVUW5KWklxcGZzcG04UFNv?=
 =?utf-8?B?UHczQlhHZ3NjcGFiSWZVaVovQ3ZldWt5LzhXY3RXcmNQaFhKakdILzNiZHBq?=
 =?utf-8?B?YnZVU01Wbit0dFd3eERPK0t0MkUrdEN6WFcxbGVELzZpSGc0RnhyVWhFK1hH?=
 =?utf-8?B?eVU4RlQwYkhqUmhPY1IxTVlwN0drd3lqSnl4SHRQK3k2ZUM0dFVrRlNaLzNG?=
 =?utf-8?B?RDhPRWlJWk10K1I2VHpBenpkWHR3NTluWkF5aVZEajZuRGwrZHJwbFVtRU12?=
 =?utf-8?B?MnlMdVpLNWRKN1JaSnlqeCsreU96aGo1bm1JRHJldUVwUGRUaGphT1VaTC8w?=
 =?utf-8?B?cElJb25NZjdQMUIveGd5MkxSd05CSnBzZFRoUVNNQXRtNU1iZVZFUk1nTG9O?=
 =?utf-8?B?T00wYkRRMXUxWUl3Q1pHbDlXV1NVMTU3eWp0UHpnVDhUVCtObklBdkx4NkRS?=
 =?utf-8?B?Uy9hS1pJSDRKSENKVVp4dHVqeUI1Qk9oZmxhb2wrd2RHL3hWQnl5RVZ6dWRX?=
 =?utf-8?B?ZEwrOGZvWGs1NEdkNWo2N3dzdGp6V1I0YW5ibTBsSlJtUnBkOE56OWRFU3pO?=
 =?utf-8?B?UkpxUmRkSlYyTmd3eG9IQytTWTJrOGthU1Z6MHpDZlFGSXhmYnZYY2lKZm45?=
 =?utf-8?B?R0RpODgxV0lZNGtIQ0tCdVNOTjZCSDhLM3FqS1E4T1NYRTBqRlgxS2hnampP?=
 =?utf-8?B?OTRxT0dXS0VmQjd5TXZhNFplWW9WYTVXSlZnYW5hZmNNUFFTNUNrUmF0bnFa?=
 =?utf-8?B?SVJjYlUreXgyVDJraWlZZ1lvcnNLSFN5azNGZTlmTXM3RVlXS3hQTXhsUTRq?=
 =?utf-8?B?REx0Z2lrYVlINENqamVHOVhaVWpFS2g3NG80Q2FhRUU5UUU0bGV1UUNNelVY?=
 =?utf-8?B?UmkyOWUwSkZEZEd0L05GemtuUTN3NUhNK0xJbU9wSE0zL2NMVVlOREhsZmVF?=
 =?utf-8?B?OXVhQ1MzVFFkbm4xaU55bW1scHM0UkRSQnd1NEJSVWY4YUxOUUs1eUc3eFlF?=
 =?utf-8?B?K0NPbUxCaWVHTllRMFNDUEs2Y0pkYWM1OEsxWitxZys4K2JiYlY5Wm0xOFBm?=
 =?utf-8?B?RUhpMllPVXhuT1B6QUVlUEFjb25UbmQzVzFEUTdkR3ZicDVRWnZ6TENUZUZP?=
 =?utf-8?B?V3RTZmFSemN2RjlMVnZjOUMyZDVrZzhLQ3R2MC9mTGdxRjVDSjhxMUFWQU8x?=
 =?utf-8?B?VFFGelBrK0E1Ym5Gem9FY1pHUVo0OVF4ZldMdlRFT3FsSzRwdTNGSVlzaStQ?=
 =?utf-8?B?MmZib3h6SE51QmtzY2ZPdWZmNS9ESFJTYURKOFRhTFRYbkZrV0xtL3JxeEhz?=
 =?utf-8?B?NGVIdjhVeW1VOVB2QklyMHJiZGkzQmFiclhKUWJnQjRUcDhGcDlwMjJSWFg4?=
 =?utf-8?B?YjBYRWM5ZnBEaHAzcXJiU2NLWDBaSjFsZWZzTEREWW5DNmdSSm1sTmEyK2dK?=
 =?utf-8?B?ZXBwZHVaTWkrSE9YTzJjajArSnBoRmo2K0JYaFM1YkZWNmlzbXpoL1BrcWVF?=
 =?utf-8?B?YnZjanExaWFKQng1Nlo0RTVBVU1aWUVsV3kyK2ErQ2xBYWhmNE5BdUhHUzJJ?=
 =?utf-8?B?L3ljSU9SZnhyQjZvY3R2MEcwY1hyYzRyU1hCSUtjWW9CeGJqVDV2ZGN1NHNB?=
 =?utf-8?B?UFhQUyszZ0x1bXU2NVJHVmJQNU1hcTMxbFppTmNSQS92TytvTElvZUI3VzRk?=
 =?utf-8?B?LzhLUjBRNUxnZXdLRWxVU0VLa2hUMTI4dDdPMlcvWU5EWnpmWmI5NkFiVVdR?=
 =?utf-8?B?citMR3dlbTlqQWVGc2tLWlhPZ0R0c1RYODRybWdjK2RncEVKZ1BNTk15Qlhy?=
 =?utf-8?B?U2J4WXpuUUdSTVJwU1llQ2pYUDR2ZXhUZzBmWUlPMXpGaFBnaGdRdXphcVlG?=
 =?utf-8?Q?sr6cFSgpkfGNv85RZ77lSRz4HJg81Ak7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXgwTXpsUTJxNWFyeXdodmtKNUsvUEdoWWkvU0R2UkI2MVNweXc1bnVuVThp?=
 =?utf-8?B?ajJiMmhiNXcxSE9Ld3AyMjRBMEQ3bjNNTWJqUElXdXlGRzh6YVE0OWxvZ1pv?=
 =?utf-8?B?TXNobWJWS0pzYVhpcktKMFFpQU1wQzBVbWZzWitzTVhxTEhUTkVIMThCUTRE?=
 =?utf-8?B?SHhyeWs5aE5sd0dkNmRRUXVzbVJPNHp0WGFxLzdJaG5QMmxUNHh4NFNuQmls?=
 =?utf-8?B?aG9xT1BpTm1RdGc0MHJrSitOdDEweWZ1bHNGRVY2dTdsdE9Rb1BtV3pTQWdX?=
 =?utf-8?B?RGVDR2lsNGJZM1R2dE5vQ0t2SkphdXB3RDFQSm9ZWklwVDZYaFhPZUJMZ2lR?=
 =?utf-8?B?MXhsdUpRdmQrc0hyZFBqOVlGTEZOQTlXVHg4b08wTzFyQTlPdjlIL01WRm5m?=
 =?utf-8?B?bldLbjY3TjlmVmlXcFhYSkVHRWdYNUpKN3VQWWZSUFl6cHpncVhTckxQcDFY?=
 =?utf-8?B?MS9VdE03N2lnNGVMYm8wVU5vUXJSZW8xQXBSL05uNjlHbG84aFZrS1lCZVhR?=
 =?utf-8?B?MHZVOElpTEwzVC9TeThmTjNWaWFhYjRRVVJMMlRSY1hZSXNLQ21oWSsvYXdk?=
 =?utf-8?B?cjdMRGwyNy9kMFJyMk9MeSthNENvaVFHVm1XaTgwaFJlbks0QVByY1J2cTB5?=
 =?utf-8?B?c0JuOEUxWUV2MXR6eGsvcXJVT0NleDNaTW0yVksrQkVUZ1h4UGI4R1EyVXp4?=
 =?utf-8?B?RUc0WHBuOTdUT0hlc214eGoxNFBqM1BiM05oM0hXejhxZnc2Zkk1UE9PdlpT?=
 =?utf-8?B?OC9FODF3c1o1clFaZTBJakViOUY2SWI3SlZQSjRRUmFjTyt5RmtvYWRNWk5v?=
 =?utf-8?B?cjRaTVhGdjRzSG1RK2JBMlZQMXBCeTNleVFMaEdpVm1UbXk3SVdNN20wTi9M?=
 =?utf-8?B?d1JZbWREUTJnY1hvOFVYQVR6RUNseHptcGRGT2VaZnpXOFJjT2dRQlVyTksy?=
 =?utf-8?B?dHdCazV0dzRkcXZkcW8wOFc2b1BWaW5CdkpyNGFmMGI4eEcrUWpvT0l4VU16?=
 =?utf-8?B?cVBKR3ZxVXYrYUlCVXk3Q1FJUWlqcFV4NmU3aGwxOG9sR1VQNWtZbnZsMzM1?=
 =?utf-8?B?blljVXFjNVkwdDVUQS9UTW94U3o0dFRRbzdmZmJ5Qjdici9Tb2ptS2J5QjdK?=
 =?utf-8?B?RE54V3loK2dXRFdqSVdJem1aSzZIRWIrODA4dmd6ZUM5VjNDb2htOUJGUUJ5?=
 =?utf-8?B?MUk5d3BWWTdBU2VYY0FaM1A3emR0c3FXVXVlWVZBaWIxSHoyTHgxQmNSM3NC?=
 =?utf-8?B?QTlvMURCZit3QittWlBHcDNEakJCVTBtY1N4S2htbWlIY1psMUh5a1hVeUtX?=
 =?utf-8?B?Nkl2VHJieExHWlo2ckxoQzN4cjJpT2VRZVFON0EwQ2k2Z3hheEx1OFpmdFNT?=
 =?utf-8?B?Si94MXVGMlZUZzF6NnBEK21OR3Q3UUpta0RGbXBsNnUzRzZTVmFqcUl0VGNu?=
 =?utf-8?B?VHNPOHZWK2ZOTmd5eVdNOVRUWmtsOVRJcittMGgvSi9FUGEyY1hneTQxZDR2?=
 =?utf-8?B?LzVQanNoeU9CVHdkdFJaMzBRTWdtUk9keUh0OW5wdFNhNHhhd0w4RTd5c2g0?=
 =?utf-8?B?UkFWNzRUQUVhUzI3d0hnMVpnd2huLzQ1K0lyZDh2dTdZQUZBL3FIVTNWdEZ5?=
 =?utf-8?B?WEd3a3M5ZERzTlF2OFovVm1lOXVseVNBKzF0OGtwVjZsaXZnbWhJVUNBUHlr?=
 =?utf-8?B?MjBXSTZNSEVFVGpReXZCREdMMUoxUzRHN3pzT3pMWllxMEt5am9ZZkVEVStw?=
 =?utf-8?B?ZXVvcnd6dW1LRFRHbTRHVE1MRE43bmlXREFMcThtZmdzT1lia1NhMHd0Nm14?=
 =?utf-8?B?SXM4elVHUjY2TDlIOHEzK1pITkprTHUrYnBLUlVhdGU5L0lDcTdzZ3N5MFVF?=
 =?utf-8?B?cXppTU92Yk9ZUEFSYTQyMU9FREtPRXQ0N3FhL0U0TFFGckJEZHNhT3Y1c2ww?=
 =?utf-8?B?U05PTTljd2t3bGFhZzlmSGtRemMyaUN4ODMrcDJ4bVpub25PYjdYMnVlR3pJ?=
 =?utf-8?B?RUVKa1VPemIyNzBVZEhvNEtHMi81OEljYjFhdllkc292MnQzUjZsYmhWSmFE?=
 =?utf-8?B?S0EyeEZzZjV4azJ0cVAyQzRIZjkzUDlVR2RpbVNiRUJJY3NGUnQrR3A2dGlL?=
 =?utf-8?B?M05Wb2ZLNEJ6WjlJalpiTVN1ZnBibW9VNm4rQkJqZS9mOHJoNVVPVlh1cUZJ?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d00df2-4374-4ec7-b104-08de01fb65fd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:33:59.4641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aE25L5+AkF+3/rgkG9AxxZWh2i+Xh64IZbs0DmJxpjukbXLZdw8bcvHnSj1rxcAJW16UB9E4AA75Qjl93b4fop2GILhkxNAkOkHeMRH9DJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9513
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

On Wed, Oct 01, 2025 at 01:35:20AM +0200, Michal Wajdeczko wrote:
> The user likely only care about top level VF state changes, any VF
> state logs on the per-GT basis can be demoted to the debug level.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c |  6 +++---
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c    | 19 ++++++++++++++++---
>  2 files changed, 19 insertions(+), 6 deletions(-)
