Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0821BC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 07:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320D10E06C;
	Mon, 12 Aug 2024 07:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cwsr+UTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B5110E06C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723448891; x=1754984891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jCTVCWpRELI2fFjjnp+dggiQjW7yC6kgND/2urBJ3x0=;
 b=Cwsr+UTQVpSlw4KcNB2W6iiJ+nXRxEmz9lLdWPh0TnxOCCQAns1HWyFF
 u7Yq8zPmgNx/w1vhVFdMxqWs9ZUhyJzt5aF2wjuFnwxvpj02WMJJMm++o
 7zNTfWISXFin2qfe9ky0M9PcFKVj9M9SiIt451awxo8E1fc9GC2PbkOB0
 fn+gGHw52jR/qc0C3qJSxPaGZqcDXQ8azMKW7iwVg6sxNeCxrO0r0LPm+
 fZomUM00tFf5Gm2vHA7YyZIBwROCLtSnwVHZMTGMlTy7hBAFZxAF5Tg7C
 WmkpaCauIjfYyILMk51kokp6LPPMwkWRykr0rJ+cWsD4tO4yjVE4Bu8Rk w==;
X-CSE-ConnectionGUID: fKzOAgsGSGK/AeI+pIq5EQ==
X-CSE-MsgGUID: ejmw7zyvRz+juH4o6YQBYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21714863"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21714863"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 00:48:10 -0700
X-CSE-ConnectionGUID: BiRNkC77QRyvfzXvXJ5KOQ==
X-CSE-MsgGUID: LpH7FLOQQt2H0oGpNLZdSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62303593"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 00:48:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 00:48:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 00:48:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 00:48:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 00:48:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7pp8AvWLVMdkMhp1NRZmSUhy2oKtMPffX47vdFOKNgQSDpWl0sCZViiGGXHtJ0BEbw3aXKdtoqWWVmouhbYjrG9bmNgL8lLGChEsFaMA0ITyfBLP9aOrDZHJVt4zWEVy1re2Uz96dMH6hX2nJsnhbO260AEJiqEussPhnZkAIT1F3nDWgzfZVyY5UGHhc+geouE33q1slSMXm+38Rhf0BDvEkepNu28Q0kWIo7/X24Ja4cEVFmzXGz6gKQngzLHym5yg/UTmU61JwSU69IEI48d6RM7nebf+FxOX1mBm6PFaokF0Hy17Vqz7VDlc6AMrtrTvJD2MJ6yrtRey8IneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ys1Z3NIe541Bkt2uqwujwwYTyXqTfC3zWErs+YFTSM=;
 b=PXdsaa4uXRPVg8oRlTgqIBhAtujF1s0o5E0PqrgN09eURiXt8wBMdI0HQ9YIOWgLoJJSKFgqm1OkIM+bO7hYnmhVaFZ8yHLi3JexjUYV2PXL9jhuAllMEGcpuK3VJFt0KgLKBQYgSI+av9x9FEIKxaZ0v5KZv1IY02lTn+RdBr2NOc521JnCbrp1qv9sYK3s0NBqaQL8gaGSyDKlrAGaxHENBPT93I0H1hgrnOJGXnInzLhZmr1F4g1pcWS1Maq5zaigWcK4+FLp0f80npbiJZAj2QHz6ZPQ2rOEFgFh+nxoooyqSHCOAp0Nwcw79qrrd5nFEhAmILxiSc8Npl8LWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 12 Aug
 2024 07:48:07 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 07:48:07 +0000
Message-ID: <b649bd68-1bb2-4f5a-aab5-f9345a145e83@intel.com>
Date: Mon, 12 Aug 2024 13:18:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2hpg: Add Wa_14021821874
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240812070251.796744-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240812070251.796744-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: e50c26fd-ab5b-479a-ef8c-08dcbaa31ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWoyV2tiVDhRU21lVTFZQkppN3R5Kzl0anVMLzJrOVRRTS95Tzk1QXZpYith?=
 =?utf-8?B?NzcrdDA0WlpibldKeWNDY3lDTUt6WDhvZ2hBd0M0cDhiR3JiTlgxcXM2VFBZ?=
 =?utf-8?B?SHljN0l2eDJhQzhwbks1TDZzTHp4ZnByeE9ZUmlFN2VZYXR4NG1ILzMxSUZF?=
 =?utf-8?B?eFhkNVpCUS91VzFxV2o5R1pEZndMbWp4WUlkYjdyYlV3MFJqcUs5VVN6MG1o?=
 =?utf-8?B?bEJGUjFEQUZEYlU1aXlVR0REVkpSdXBneDUxQnF0MzM1dlFKSjJSQjUzU0Vl?=
 =?utf-8?B?T0xIaTVjZTFhOVlNeVpQQmpqS1dabjdnMGMxT014cEhuSmoveU9xaVd0K2RH?=
 =?utf-8?B?N1pIN0lVWUg2Tmx6SW1vU1I2ZTZ2YW5VU0VvNERFZTBPS0NUeXVaK0U1dVVL?=
 =?utf-8?B?RUY4SCtOcjZLSVlYc0UrbmtiZG1HUjlvQlJLZUZoTHpkSnFvM0RtU09vK1ZB?=
 =?utf-8?B?SkdQcGU5Z3JXV2tzK28zMk92V2FiN3pvbHpWc05qeElnaWhKU0pxUVJMMkdV?=
 =?utf-8?B?Vi9BS21Ga0RRQjBQWmNYQ1A4TUgrSC9jMlRaVFkyU1hUa21jQjNQMjZCQVBW?=
 =?utf-8?B?aEc0UTRWTFpSUSsreGJVVkswaCt3VXR1aXU0OXBpVFliZ3RRcjVvNlh2UlNt?=
 =?utf-8?B?T0JQakxveURpZmphTjJUalNOcENWaTNFSll2M3EzeDQraktqcDVlTXdTOSsy?=
 =?utf-8?B?dGQ1dnA2UCtkU0VDMEVWNmdHZDRjdVVlZk5sakpaOHVRVHI0NDVmeWdoZkI5?=
 =?utf-8?B?OHkvQkNJMG9GRUpVbjhtOTk3SWFKZ0RCOXh0SEVjem5jdFBGODRYdnZWeW9K?=
 =?utf-8?B?eUE2aHpMalN6dURTcW9RaUxFaG03bnR2dHR1YjI3RHNlVW5TYjBobzR2cWkr?=
 =?utf-8?B?OU1UeU9WYmJTTWFXM3J5Y3dFOG9Sc0pDL2FKMWRiYmFqa0ZkY3orUEFiRi90?=
 =?utf-8?B?QkFQWEtZMUJqN3QxdWNLbmJ6U09lcWpPQ1N5dGVHQUFpWUh5ZXE1bGRJU004?=
 =?utf-8?B?RjNQTFFZdlNhb0xVS2Rwam80biszeHNoVzdoM0JnZGNuSExYZmNuUnc4OVlE?=
 =?utf-8?B?YjNCZDFFTTJPMy9MczNhWXJGTTg5c05yMXg0bTAzMnJodFhLcm44Nzh5eFFu?=
 =?utf-8?B?eFc4TkQxUDJXbDU4SW5JNDVuMlB6VC9MVVhHQ21NdnloVURKUmxEN0NxdldB?=
 =?utf-8?B?dnBUUkpuS2VETVVjaFZWTnpybEtGbENER3hkeTI1aG5vNHQwc1dqWkdURHhL?=
 =?utf-8?B?RGQ0eHdhbk16YW1zeExta1IyLzhIcENLdzJubk1WT1N3RzJXb2hiODVSWnU1?=
 =?utf-8?B?Snl2TU5SR2VWZXVOSjFNRnFHODdkbjl3ekp3QmJBZXY1VGZRTWs0Nkh0V3oy?=
 =?utf-8?B?c0xqT2pmY3ZPRG9naXllSUw2Q1B5SldpTTBXWkZCanF5a3d1NUhVU2t5RHF2?=
 =?utf-8?B?MG53c2Y4Q2ptalNJOEZwYzM4WHhUdjF2Z2s4akd3TzY3dENpQzBxTXNXTkhG?=
 =?utf-8?B?RFR2dHB0YXh1V2hnN3RFdkI0cHNNNEMwL09HWmczZzV3ajlVbUlMSGxGNW81?=
 =?utf-8?B?TVp5SXJaeVhnUmVyN2hDU21sS0hmbzZUaVBkMElNdmZKdFJmanNvK0F3ME5m?=
 =?utf-8?B?V0NtK1B1Mkh1YlFPZGZUUEtKbFRVeWxEZHlIYmlLa0diSVVrNXp0VzhWVDU4?=
 =?utf-8?B?VzFPK1BRd0dOWVRNclQxcm15MlpBdGNadHBaeURTbThoaWNCbUVwNFpWajFY?=
 =?utf-8?B?YU41SzBzMEEzb0JXTWJzRi9ubGxJLzR3d2NkY2R4SHZiWnNBRlk3STlwWWh4?=
 =?utf-8?B?YlNtVVJwQ2ZWZnpOSkg0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpRUnJGS21xZlZ5QW83WE1GOUJZNnMxbjhMbTc3bS8wdmd3d2lYK0V3dnpX?=
 =?utf-8?B?ckRVWmswN0ZTRGVxSHEyd2RhLzlxVXZRT0svWVpCM25GYVh2bzdNczExZE01?=
 =?utf-8?B?Tjl6N0ZZYS9BK2w2b0YyazhFKzh5eHpXSTFXOVp1cG1CMFk1SDBOdWRqcmFC?=
 =?utf-8?B?RjFkT3ZCMTNaRHoyNFRFU2hJVmpETlgzWXd2a2VUOUs5a2JkRlMrSFRFZEZv?=
 =?utf-8?B?c1ZRb0dndko3emEzVHJteFlnN040TlBVZnlIUlpjL2ovNzdycUQrNXpIS0lU?=
 =?utf-8?B?d1M1YXdLd29ZQzV1Z3g5NTdDWjlnWlByMmJjQUt6aG5tbGdkMnhnYjFnYXpB?=
 =?utf-8?B?SmVBVFIyVUxFa0RQMWgwd3NPYnlBelFocGpLYlNVcUlKTmVJTjFpYWVNQW1U?=
 =?utf-8?B?SWtyNXFKMkIwK05TQjd2dFJSRnptbndhRjR0S2VKMzc1aElJTm0wWlZSM2NX?=
 =?utf-8?B?L3JkWE9QQTZGa2REUXhCWk00YnVCbTVUc3ZBRERXSEZlRFlZRXZINnA3UGx6?=
 =?utf-8?B?U3ErcC9BWngrRjRtOVZoZzhZeFlPR2Z3WWkwYkkrcmpMcy8yOW1rNDQyS3dQ?=
 =?utf-8?B?TXdhVFJ2alQrREx6UHVTRjVrOEV0WjkzbnZ5TzJ2STV1bUhNdmw0TE5lYm1M?=
 =?utf-8?B?RkdFaEVFdVRWaGczVkFSRTdDWDlJaS8zb3QvK3Q0dlJkd3JXRkFzOThsZzNL?=
 =?utf-8?B?eVVaZTNjamtOdXlhUkZKMUxFL0ZHSVNFS1Y1blREc2ZKQy8yUjAxRVRTbXRo?=
 =?utf-8?B?ZmdiMkhPbUZMRmlzNzdHYXI3Y3JqVmdZSy9zQ3NBK0R2YUVNV3R1UTdwSWZZ?=
 =?utf-8?B?ODltcjVCNHMvVXNFNnlzL3kwbFNaUTFuNzRldkVtejRZQTBSc2UwZHR1WVZY?=
 =?utf-8?B?dlozTEdhTHBtQWZRTXlIcm5EMVNMVHp1R0NyVklkSXRFWUk0RG9vR0JUY3Fk?=
 =?utf-8?B?QUJuMWxGbVhKY2k2UzRHeW85czVJR2RsTjVuS1JZWnVqRXlCcDA2S1kzdFI2?=
 =?utf-8?B?eVdWQkVPSnNGY1diUnhGbnJSZFZBdy9DUWoxUUpLYUVpK2J0c0hTZVVhWjdI?=
 =?utf-8?B?WnFYb3hSQWMraDBxekFuaEdWVXBTWXNpcXpWWTFsWkNNUEEzazdiNjI4cVJh?=
 =?utf-8?B?Ym5CMHQ2QVFyN3crMnRDd1NFc1JTb0g4TVl3OWcrWXFpUDAwbHRqRmxqV09j?=
 =?utf-8?B?K3d5QzdYU09wTmg3NUUvd3J0aFdlV1Q4RGZnYUMyanR1RXhDWVQ1SlZ2MkRv?=
 =?utf-8?B?WU56ZE13Ym1maGd1NmFuNVVHTnZzWFBlenFXWnUvTXNBTUNCcXVCWTRuYzkx?=
 =?utf-8?B?SUxMY3N4a2labXlsViszYVIwcGhudkg0V3lGNmIzZ1kxZXVYcTRNT3lMbVpD?=
 =?utf-8?B?TG9nT2tjTUZNbld2blNhVis1UXBBNStWSWR4dnVxS1JId05kTVprVXlzS09N?=
 =?utf-8?B?RlVXUnRHSG1WQXFqT0R6bDE4Nks0QXBHdklTd0UzL0xueGVEOHR2RkZlQzZx?=
 =?utf-8?B?QTZHU1UxRERLWUNUcWNQa3RHOEFlZk4zZUNEOUZmeGF2Q0liblFacDRmdkRX?=
 =?utf-8?B?eCtUTUg3NnJ1S0xjelgvWk9lOTB5eEd0NWsyVmo5Y2VkUkUvaTVHYjY5d21p?=
 =?utf-8?B?bytmZDdXamZzRmd4THpnZjdHdlh0RXFCcXZNdVFoVXNCK3pjQ0VqNkRLUEox?=
 =?utf-8?B?LzhBcjkvMzg4THBxRC9PTW9VNkNrbkQ3ZWZuc0hXcVFGOFF0WjQ1aExqV2ps?=
 =?utf-8?B?ZEVXVUdHMlU5cGRlaWo2cXVWcjVVQ2dPZ2JzOVF2eGtnWDVhb3A0WmZ6c2xQ?=
 =?utf-8?B?eHdKTllieEhjVUlNWGRKTEhUTitVYXFIUlNDSWtYaWd1N1VXNUxiS2xFdjFW?=
 =?utf-8?B?ZzFvaXk0K2Fzbyt1UzBzQmVNMENUdU54SC9KOG5obXdXd0d0VVhSTFhpVlJj?=
 =?utf-8?B?WUFOOFZoa01sMUt1YThKMi9Bdnc5UVNEMk5Lck1yVUdvQm4wN29XekFhNkVV?=
 =?utf-8?B?MytOSCtESmtFTUNGUTRwN2hIRjB4VTJmVHd0OTVOdDdjVzY0ekRrbWpWRHRG?=
 =?utf-8?B?akxEYjNuL29kM3BtdlpGMUlkSVVOMjM4K0xnaktLTWVPU0NzU1lOSzdtdE1J?=
 =?utf-8?B?K1NZdDQzQ1diZGlZMlNrSnRtRXhReDA1czdGMWlndkZoY1dCSk5oNXNHaUpH?=
 =?utf-8?Q?IM+FdfMx0jdobkff1OjdoJg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e50c26fd-ab5b-479a-ef8c-08dcbaa31ade
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:48:07.5648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtXSK+TuxHaecevDd6+XqJmKfcfmb+WeAz2HA2BzCbOvdkFVkooMO3rgfWK+/tyhpYG7fGxX0mw/pKlKpXW3VxSpphgT+sVdkZ9w264w0rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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



On 12-08-2024 12:32, Tejas Upadhyay wrote:
> Wa_14021821874 applies to xe2_hpg
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 2c8c4d4218db..9054253f6aaa 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -451,6 +451,7 @@
>   #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>   
>   #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
> +#define	  STK_ID_RESTRICT			REG_BIT(12)

Nit: space instead of tab ?

Patch LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   #define   SLM_WMTP_RESTORE			REG_BIT(11)
>   
>   #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 564e32e44e3b..28b7f95b6c2f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -542,6 +542,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>   	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>   	},
> +	{ XE_RTP_NAME("14021821874"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
> +	},
>   
>   	/* Xe2_LPM */
>   
