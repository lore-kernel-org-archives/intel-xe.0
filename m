Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3F4C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 21:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B9710E02E;
	Thu, 23 Jan 2025 21:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYd42jun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEAA10E02E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737665998; x=1769201998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sjl/oj8I4QQGxSe+9epkgwniKcpDUEHZkx3Dk7b5x7o=;
 b=YYd42jun0u4JluhXlYXXdNbkaNr11YuFTM0SNC3akhqtidR9aGo4zhSh
 TVbsyeBvCMJyOUS5Qaled0EDuzGqnryUAq1yTcKPSB6aKqCSck+CA8pvi
 jdl5kTsxacpzDLgUUMkM1iInj6zIXiSrRb2geP96ZJbu2+f6mPNbJ0sVx
 sEUoAvUSWK9QSGOs5RBl9fVKHP8Ue9Sij/1HUfa6c9UG/J9s3bOtNBVbN
 vs6L4mABXjekxtW5tVLnnk/LcStZt/GqpL2xB4ZPzQfJq3Zqsd7a6zp6k
 fRj9qLf+WMnb8r0AiJTL4YLWePr4MSuL4Tg723ax4EoJF4oMnxqv0Y6wg A==;
X-CSE-ConnectionGUID: gEAj5I0eSqiixJjXj9VWcg==
X-CSE-MsgGUID: 5QaNN2YrSe6qa3MWltJe/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49183039"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="49183039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 12:59:57 -0800
X-CSE-ConnectionGUID: XfNJhXaiRf+JgS56XbVT/w==
X-CSE-MsgGUID: KetpnJqYR/WmKtS5HoqUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130870417"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 12:59:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 12:59:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 12:59:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 12:59:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REw/PmwTQNew4BiZG8snYfAKJyiWsln65QBU9LnU8uX+V10ovjkPkEc46wgMDr/D3euBFcFToNMAfmPkF/7oocsHd7iOgW3NeV4RXoMOyQXdvSgo+us5nP1/Wf4CErzpnc/efuzR9dAaT7rnEblKAoIL0Z7hBE5yiOtq/Gwl6YYIVIA59D9+i7PYUM9FrfFLQ60AvBEw9iBM2hXt/RsDzbtAi1gniJIEoHYcCDbDkT6ScLq/WY0pICiBm1n2pabM1UlmM0uX1N7ZY3JWaUNAEacnRnoP2Jf6Blu692G8uia3rcZ0tWppWP2eti2XeWq/uUciQ+1X4hslW1s/32NDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCVuMqg1/defzKvfg3PsgPxANR/u1QlrpUgyah1cCeg=;
 b=xNqAhjIldxTSUTWqNGuJ+go4Ha4Y7Nx3SnaREHOCQPnQ6e3qO015R4g96jMi9/f95FJb4BXxL5NTVw+sUVaw7LUAZra7MJ2mrM+NiZAxn1TJqEuEJnSCG4noqsR4BL+Prg1jWodXg70aDI28aPP2q3C/vQtEnzFpjoM/naHI/YPcD9YNiFFVMMqY8yu4hQvSaer3A7qqeBbTLgz00allvY8RdLgMIf3fUuiAaQwx0DndCt4iKLGJgZYAcNe+XWpPNr61iqskBbDFLvghNmTAo8bhmVaNUUetiwqtur0N/69uQ7qg2qqIqhcalAfYfVqi1Y2hqUzsFuhc3aHZqORO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 20:59:51 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 20:59:51 +0000
Message-ID: <ede6ec1c-9cd8-489c-9ee2-e3062a69f88a@intel.com>
Date: Thu, 23 Jan 2025 12:59:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Drop duplicated information about GT tile in
 devcoredump
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-4-jose.souza@intel.com>
 <09e5ad52-be12-4d39-9b64-ca75b4851307@intel.com>
 <124780756da7b9546d16158659a562408a23497e.camel@intel.com>
 <a8ac03e2-43c1-488d-a821-902aba7caa25@intel.com>
 <75d315bc086d8382c6cb89a65b1be0b65547e0a1.camel@intel.com>
 <1af7bdef-0602-4f1f-aaca-2e68a5b94685@intel.com>
 <2310bce60e6afed539da5c6bd0f9deac3dee0355.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2310bce60e6afed539da5c6bd0f9deac3dee0355.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:303:b8::10) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 966a35f4-d0be-46bd-587c-08dd3bf0e135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWUyM3A3cS9jaUVEVjFSbytZaHlkWDFFUFg2WkszRVVmbE9hZUdjRlZ5TEVl?=
 =?utf-8?B?TVR0eUwzZnY4OUhIUGhKS21pQWVkM091U3dRVldBR0hVa0pCeC9KcGJSSGlL?=
 =?utf-8?B?ZFVzODdyQ0NHbitXYVh3REc2UXdZOTBQOHJzNEp6aHpyWmhUZEw1NzlhYTFI?=
 =?utf-8?B?cENlQ3RRS3FoNVJvVXdpUUpUS1FnTCs1NW80NGpWcU5EZSszQllxUVV2S3NQ?=
 =?utf-8?B?L0pnYzJJUGFzWElybGFrTVNwVFA2RWVJZmhjNzVMcHpLZmtuYkMvM3k3Nlha?=
 =?utf-8?B?R2hmR2lPV1kyTnFOdmhITnBwdlFWeEVMSzB4bitTa3hVUFBCZHlxazlZckJW?=
 =?utf-8?B?c3IrWW1WOS9BakV6dHZTK3R6UFRqdGtuZ0ZnTURQcmNMbFZ4YU9pZ0U3amI4?=
 =?utf-8?B?SjFXTnJNZGhmZGtLdUcxSE90cHZ3TGZDR2NRb0szUUZXVXZzQWNtbWs5Ujg5?=
 =?utf-8?B?NjNZd2UrYytSdm95cEtsSFQzSVMyWWxnVzRQMmJFN1RCUjNqYk9Wb1ZUTHVD?=
 =?utf-8?B?TVc0VTR6Y3lpeVdnSHg5dXhQR3lNelRBeDBZUUI2RWZ4aEQvRG9XYk5pRzZN?=
 =?utf-8?B?SERPU21hTFd1eXpTYkRNTmlxa2h0WDBoWkUwVGx2SjdtWkJuc09OM2Vob3ln?=
 =?utf-8?B?bWpjR3FUT3BRUTVTREljbUlOcXRyc1lLVjkrUW5McUhnNFZ3aE5TSnJFWll6?=
 =?utf-8?B?MDdLUm5YaGZzQ3JqMnJCamVyei9nSTZnVEo2M2d5dVoxemJFb1JyZlZQekVE?=
 =?utf-8?B?RUQ4cWhZVVIwbURxYjI1cGNyVXpHcHBYZ29EOUJ1c2VHT2c0Y3dTa0VrTmd5?=
 =?utf-8?B?OVdpUGttRGZkb0xpYkhJRFhRUTdQRDhteGhYWm4ra3ZVUzFBMzBWYVNYOEdt?=
 =?utf-8?B?MzFsOXdmS0xPL2tmY2RvTFpFWVB1SitRMXY2TnFXQXdZZUJhbUdScGF1cnFH?=
 =?utf-8?B?Q1dGK01yZ1cxY3lib2lKR1VpTjFrcFV5czJyNm5Sek80Mlh0S3pUaUhjaktz?=
 =?utf-8?B?Ui9VTmNteVRtaGQ0NUNiMkROZndoc0c5VnpsV2FDckJXV3d2aU9nNk45VGRN?=
 =?utf-8?B?VGRHdjUzY1Fmc2dqU3d6RG8yRG1PN2VDZ2FMR242c05YYzNOMkowZ0IvU1RT?=
 =?utf-8?B?MWhpYWRmcTlwN1VubUlaRVZuMDZLdGwxMm1TenJVK3ZNeVdwSGdPSndBQkFu?=
 =?utf-8?B?aTBZWTFXcWc1YWl5bU9EZzRpZHRLK2RVR2YvQldneElVVFhtMXY0R1I0S0FJ?=
 =?utf-8?B?SDFuakNyWW9VMG01RzY1QkdLdEMvekdxeGMxNVkrUDAySGhxRWFVMmJOSjdB?=
 =?utf-8?B?RGxOSjdPL1RXOFF1OE9GcG1XQ25Hcmx6QkxDc0tJRFRsMStIdWoybzB2bmpq?=
 =?utf-8?B?dGg3aHRlaDF2cTNBYXpQZHZOcGcvK1M2dElnVjBqZXREaWlocUxTMEhBbVI4?=
 =?utf-8?B?U3JucStxU1RtNXA4YzJnaFdUamJoUklnR1Uwbk5VUEQ4MGROUEI2WnJrSVdX?=
 =?utf-8?B?NnJTdnc3MVFKS1hveXlxYWJCb3E1K05iMExiU0NZYW1BWlpVb1hnRVZycmgx?=
 =?utf-8?B?cmVUT1lTQllBN2U4QTNuL3dWRFhwdXNHdzNWVmtkSVNxVmtJZHFEa2crOXQx?=
 =?utf-8?B?Z3BJdmlWM3k5amFSN2RUZUlNeXVtblNiaVN1dEhCYVNac2lLVmJVdUZHcmFv?=
 =?utf-8?B?R3d3dno1UThDamJPVTRtQTAwR2toZmVmVEcrQ2xCeGdvZkYvWVpUMStkQmk5?=
 =?utf-8?B?eEU2eEF2K2hyUzVNckFhZnNOdmRKekM3VXRPdGZORDNIRldST3NLKzRoMWo1?=
 =?utf-8?B?OG4rcm5qTER2RnB2WE9RaTJJTmlYRW1rbGgrZVpudTRCbzFPRnZuTUlSSzI4?=
 =?utf-8?Q?4+yYgRCkRV19c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnRoWVpDYlIvNG0yZXpUMUZ3ZUZlRmZTL2tJV3YvZEtzSFlMSXFTUEdZdDNY?=
 =?utf-8?B?dno2Vzd1TVRxNTNHR0JZQzQrUkpKWXJZMTdlanlxaTUrVURTK0pHSVk3TytC?=
 =?utf-8?B?V3JSM21DMit4SmNnZ0k4YXBVUjNQTDRZVG1Zd2ZqZGRvMjBhRGVVZFYyMzRI?=
 =?utf-8?B?T2t3NHpESkpIcjdDSG9nMXFGbnlvb3NIblpLaEZNckhTM1ZrdXJacVUyb212?=
 =?utf-8?B?Q0ZROE1XcnFKRWxNWUNwNk9lQ0RCMEp3MTFhcGowMHpFM0huRG1Zajk4YzIx?=
 =?utf-8?B?T3RieXF5WUJYQndyMkxHZ3liTXdJTFB6MEtRelhoZnpoSE9ZVHJMaUZ5QjFS?=
 =?utf-8?B?andxNmNPN3E2MURWdGhlKy92Tmh4L2tyaXpIYUFGSUZhTW81Q25PU3FaT1hU?=
 =?utf-8?B?S2o5RFY2ZE92MVU0QXNZaDJ2U0FQMDZlV09UKzhTanRTc0ljSlEvMWR4aUhs?=
 =?utf-8?B?YWN4aHZHM1ZVYkJUeVFMdm5JWkh3MTBNUkMrZ2FRcmtnZjFqNnBoMkdZUlB4?=
 =?utf-8?B?R3FhNW50U1NNUk9leDM5cHQ1RmQ5Vkt6bHJkcmg5b2dra2FZanpUL2lLME1N?=
 =?utf-8?B?c3R3OEpUbkVJc1pGeVNzSlFkUkREUkNxQUgzZkhTenVaKzUxbXZnMzhRTUZP?=
 =?utf-8?B?WEJBNUpOdlBYcXlPKzRYU1ZnSTBqL0NDT3dZMDFvMXRPc0FCaVVZOWZmTzQz?=
 =?utf-8?B?UjVBZUc3RVZqM1dOenZyVzZ2MzhsY3Z1TVFFS3lYZ1BZWDF0Q3E1WXdpbXJF?=
 =?utf-8?B?OW9mNGlIbEdRbmYrcEg2NVIwcUJWMVBXb3ZCVjFGRSs5amttUXhKVm0zSHR6?=
 =?utf-8?B?OUtDTlVMZk1jdmRwSUw3aTZLQ1ZxbEpvZWNaaDdueE1TVzcwTDJJbzJPcHMz?=
 =?utf-8?B?YWJ5WW9YQ2Y4UG5veGIvZTB6MzJabkp6UW9Ea1dub2UwbDRGcGZkd1ZyQjRm?=
 =?utf-8?B?bTVuSkV3OStiY2tVclZaZlo0d1pxU3V4RVpTZENGUnQ5WEQ3b0RHM0NaTHUy?=
 =?utf-8?B?ZDJGcGk1eVY5ZHJvbytIbmNCazRhU3Mzd2NadHNaRTVIMDg0aVV2R0JMY1dh?=
 =?utf-8?B?dDBVUFJ0UGd4R04vZ2Iyci9SVW9HZkxxNGViSlYrUjZqcmJCL0lSTWFvWGtR?=
 =?utf-8?B?MjdNd3ZKdXlyaHBBQWV6K1JLVFN1OGZhWVlVUGRNY0xJak5rcWx6N0s4SGpj?=
 =?utf-8?B?WlB6OTdIL0o3TDFnSkFRdjhRTzZUS3k3N2hQUWVjV1dkY1RqS3ZXQ29GUWc2?=
 =?utf-8?B?eWNnTmRaYVc5SzRYeGxSSyt1NjdLcDNpZ2d4YUNnR3RMQ25xUUp6U3MvdmpO?=
 =?utf-8?B?dmFEdjlCOFduUlM0UUVGNkUyY3M3cHJvT3ZBRFZaSERya3c1SHljV1F0WkJL?=
 =?utf-8?B?Mk9TYWxPSmVMa2Y4N08ra0ZSZU1WOE4wdWR1RlhzNHprRW9VUTBvTGpSZzlO?=
 =?utf-8?B?UVJYY28zTmF0Qm14dDRaZGZIMmF4VWFFUlNzNWZPMGRpSGh5Ny9ZNmV5NEFS?=
 =?utf-8?B?Z21rVlZmT08xdU01QkJMZ29LNEtiOXlLNWZMTmVPNjRnTG9BNGdmUGV2WERP?=
 =?utf-8?B?bUVuTUdRK1BBTk1EbkEwVTBOODRiWFBiYmFDUnEwVnNjbi9qV0t1VjFRemJZ?=
 =?utf-8?B?ZXJNbHIyRG81UHg4dVFwd20xR3lReFV2c3VVRkZCWXR5MzFYMmszVy9kSzlz?=
 =?utf-8?B?UGlSL3hlY1JYYWVVUGhjQkNwUHpmRkcyemg2Lzg0M21zZUZrRys2M3NiNEMr?=
 =?utf-8?B?OEkvYUgyVDRqRUlTbjBCM0k1TlNHeFo1TFhsY0FQQ3djWGJqYUNEMDRqbnFK?=
 =?utf-8?B?WlZBNllUR3VWU0R2c0t1NXgyalo0b05CMk55QjVJZHloZHJnZnJZT2drQ1hR?=
 =?utf-8?B?RGUrOEdiRE43c0djSWhVc2JBbFF2VGkyNWdKNkl4YVJvSVV6ZGY0RTFucnZh?=
 =?utf-8?B?RytTWlIrMFI1b1V4aXFhaVJTRTgrNXpHM2ZSUFA0L1huNGFrTVlyVmFuOXk1?=
 =?utf-8?B?djllSkQ2cVJsWUNCYjZjNlBvM3R6aE1YWTl0WWxVYWZNcDN2UzYwNHpCcmh4?=
 =?utf-8?B?Y3RIM3VFMEQ5WDBxeWlUZUxVN2ZoRVM1Uk5tTDRaYUx1aEFrR3NteFZub084?=
 =?utf-8?B?M29UbURERGRocWtuWGxRZ0Vkd0p2K29wbjRRZzYwcVZyN0ZjQlpSMWJLZUdH?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 966a35f4-d0be-46bd-587c-08dd3bf0e135
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:59:51.4499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiOCkAMmHfxM+BHe1QIhGAJNO9ADO+Mmiu1Nmt41WY0ijK/r2geBPTJEIP66cQGLWwVj0F8mxRZe9SjCBgEcGWwjhCp/xPPPKNU8+r18qNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
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

On 1/23/2025 11:35, Souza, Jose wrote:
> On Thu, 2025-01-23 at 11:27 -0800, John Harrison wrote:
>> On 1/23/2025 10:56, Souza, Jose wrote:
>>> On Thu, 2025-01-23 at 10:30 -0800, John Harrison wrote:
>>>> On 1/23/2025 10:24, Souza, Jose wrote:
>>>>> On Thu, 2025-01-23 at 10:18 -0800, John Harrison wrote:
>>>>>> On 1/23/2025 09:59, José Roberto de Souza wrote:
>>>>>>> The GT tile is already available but was added again in commit
>>>>>>> c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info"),
>>>>>>> so here deleting it.
>>>>>>>
>>>>>>> Here a devcoredump example with the duplicated information:
>>>>>>>
>>>>>>> **** Xe Device Coredump ****
>>>>>>> Reason: Timedout job - seqno=4294967170, lrc_seqno=4294967170, guc_id=13, flags=0x0
>>>>>>> kernel: 6.13.0-zeh-xe+
>>>>>>> module: xe
>>>>>>> Snapshot time: 1737573530.243521319
>>>>>>> Uptime: 2588.041930284
>>>>>>> Process: deqp-vk [8850]
>>>>>>> PCI ID: 0x64a0
>>>>>>> PCI revision: 0x04
>>>>>>> GT id: 0
>>>>>>> 	Tile: 0
>>>>>>> 	Type: main
>>>>>>> 	IP ver: 20.4.4
>>>>>>> 	CS reference clock: 19200000
>>>>>>> GT id: 1
>>>>>>> 	Tile: 0
>>>>>>> 	Type: media
>>>>>>> 	IP ver: 20.0.4
>>>>>>> 	CS reference clock: 19200000
>>>>>> This is an overview of all GTs/tiles in the device within the global
>>>>>> section.
>>>>>>
>>>>>>> **** GT #0 ****
>>>>>> This is a section header telling you that everything which follows is
>>>>>> inside GT0.
>>>>>>
>>>>>> It is not duplicated information. And if you remove it then you now have
>>>>>> the information of all GTs back to back with no indication of which GT
>>>>>> they actually belong to.
>>>>> Can't you get this information from Name + class + instance? if not that should be placed in one of the sections below.
>>>> No. I was trying to do that originally and determined it was impossible
>>>> to do reliably for all current and future platforms. Hence the section
>>>> header was added.
>>>>
>>>> It is also much, much, much better to be explicit about debug
>>>> information than force people to guess based on heuristics or tribal
>>>> knowledge.
>>>>
>>>>> So this should be placed in one of this sections:
>>>> No. It is not information within a context or within a hardware engine.
>>>> It is the reverse. All the following contexts, hardware engines, etc.
>>>> are within the GT.
>>>>
>>>> And when you have multiple GTs in a single dump then you need a definite
>>>> delimiter to say that all the following is now in a different GT to what
>>>> came before.
>>> Can't I do a exec over a exec_queue created over engines in different tiles?
>>> I think we are allowed, so having tile and gt in '**** HW Engines ****' would be better.
>> Not that I am aware of. The whole point of the 'hw engine' section is
>> that it is related to a command streamer. And those cannot bridge GTs.
> No, I mean this:
>
> - create a exec_queue with instances in CCS0(tile 0, gt 0) + CCS5(tile 1, gt 1).
There is a difference between a gem context (are they still called that 
in Xe?) and a hardware context. It might be possible to create a top 
level context that operates across multiple engines. But underneath, 
that connects to multiple hw contexts, one per hardware engine.

For certain, the HW engine dump (xe_engine_snapshot_print) starts with 
'gt = snapshot->hwe->gt'. The whole thing is very definitely contained 
within a GT.

So in your example, you would (hopefully) get two separate hw engine 
dumps - one for each CCS. And each would be within a single GT. 
Although, I think at the moment, the GPU hang infrastructure is all GT 
focused as well. So actually, I think you would get the dump from the 
hardware engine that caused the hang and nothing from the other engine 
which did not. I have further patches for improving the handling of 
multi-GT coredumps that I haven't got to posting yet.

John.


> - do a exec with a batch buffer CCS0 + other batch buffer for CCS5
> - one of those gets hang
> - devcoredump should dump information of both engines("xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)")
>
> so having tile and gt information in **** HW Engines **** would be better.
>
> but we can work on this after the GuC log part.
>
>> John.
>>
>>>> John.
>>>>
>>>>> GuC ID: 13
>>>>> 	Name: ccs13
>>>>> 	Class: 5
>>>>> 	Logical mask: 0x1
>>>>> 	Width: 1
>>>>> 	Ref: 2
>>>>> 	Timeout: 5000 (ms)
>>>>> 	Timeslice: 1000 (us)
>>>>> 	Preempt timeout: 640000 (us)
>>>>> 	HW Context Desc: 0x025e0000
>>>>> 	HW Ring address: 0x025dc000
>>>>> 	HW Indirect Ring State: 0x025e3000
>>>>> 	LRC Head: (memory) 152
>>>>> 	LRC Tail: (internal) 296, (memory) 296
>>>>> 	Ring start: (memory) 0x025dc000
>>>>> 	Start seqno: (memory) -126
>>>>> 	Seqno: (memory) -127
>>>>> 	Timestamp: 0x0000035e
>>>>> 	Job Timestamp: 0x0000035e
>>>>> 	Schedule State: 0x441
>>>>> 	Flags: 0x0
>>>>>
>>>>> **** HW Engines ****
>>>>> ccs0 (physical), logical instance=0
>>>>> 	Capture_source: GuC
>>>>> 	Coverage: full-capture
>>>>> 	Forcewake: domain 0x2, ref 1
>>>>> 	Reserved: no
>>>>> 	FORCEWAKE_GT: 0x00010000
>>>>> 	RCU_MODE: 0x00000001
>>>>> 	HWSTAM: 0xffffffff
>>>>> 	RING_HWS_PGA: 0x018db000
>>>>> 	RING_HEAD: 0x000000ec
>>>>> 	RING_TAIL: 0x00000128
>>>>> 	RING_CTL: 0x00003001
>>>>> 	RING_MI_MODE: 0x00001000
>>>>> 	RING_MODE: 0x00000008
>>>>> 	RING_ESR: 0x00000000
>>>>> 	RING_EMR: 0xffffffff
>>>>> 	RING_EIR: 0x00000000
>>>>> 	RING_IMR: 0x00000000
>>>>> 	IPEHR: 0x7a000a04
>>>>> 	RING_INSTDONE: 0xffdefffe
>>>>>
>>>>>> John.
>>>>>>
>>>>>>
>>>>>>> 	Tile: 0
>>>>>>>
>>>>>>> **** GuC Log ****
>>>>>>> ....
>>>>>>>
>>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/xe/xe_devcoredump.c | 3 ---
>>>>>>>      1 file changed, 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> index 1c86e6456d60f..2996945ffee39 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> @@ -111,9 +111,6 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>>>>      	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
>>>>>>>      	xe_device_snapshot_print(xe, &p);
>>>>>>>      
>>>>>>> -	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>>>>>> -	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>>>>>> -
>>>>>>>      	drm_puts(&p, "\n**** GuC Log ****\n");
>>>>>>>      	xe_guc_log_snapshot_print(ss->guc.log, &p);
>>>>>>>      	drm_puts(&p, "\n**** GuC CT ****\n");

