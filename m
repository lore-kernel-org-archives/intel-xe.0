Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02426C87FD3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 23:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807410E135;
	Thu, 31 Jul 2025 23:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwLEE/kB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E9910E135
 for <Intel-Xe@lists.freedesktop.org>; Thu, 31 Jul 2025 23:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754003676; x=1785539676;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PSufhfY3pf7IPSOEXIXPrmdzNpRKuNeMJxkJqeMolbA=;
 b=TwLEE/kBeo55ZUPDH5OWFUimBWZivd0y0oNz1/QShfWCsa9qRkjiahOK
 IxtE8XbPqIDt89Znz8Lx+U53BYGWKsVOYUrSG0+tY03/RC+V7B82+891c
 VFLK/xMX0Cmi8HxweIIPFwXqinUjPxNMC4kCwkH97r00sK9wUjBkACrd6
 8K4+iEDL9WeyDWuZ6V6/AvfcRZClHy4fwCJQrhj85hNbmRajhs1OGLePZ
 LNZ6P+J3ZNH6DOYlwj9zgybnGEgDfMi7d7WhAqCrh+bp8cNaAKlrH4T5x
 VqX5k9ycD564tKnJ8ix6s1g4ZSc09DAIIUDJ2ggTQn0YoRyRjgENeEpRn A==;
X-CSE-ConnectionGUID: gpl40bU5RPCKoa8VZ0/V4w==
X-CSE-MsgGUID: OP/DFwh9QZC0kQOgMDxUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66614762"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="66614762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 16:14:35 -0700
X-CSE-ConnectionGUID: Nquct8awSEKEO+jVig9yeA==
X-CSE-MsgGUID: ci+BT/6kSTmxYPMU58hcuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162964019"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 16:14:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 16:14:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 16:14:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 16:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQDGpIi5ZrzBNU0mP0/Iltw8yZHFXOcVONwQnfF+MQq3mN62DnnLLyMa9qXqHhG1807XMr9ncEWxj43fnRfqa37UZUN/dzrkCvA/g2kSwPWKCNitWRjkczfUUYHneefkWcaopG2Fx0XTdOe/J5U75gvi92HxBgOi59uapxs7T1Gh+XmYRvvwd5vtsareNNNsuX9vUR4uxn7xWvYpJcOHr7uvUJ1ogkUHGe7hepAimSI6wgDBBhtHPK71x+iEkKCAiSh0eYBI/nhD1ApUh7XwkgIzdIkEbmuvZcFjVesNXsaaHMjqk9FEUBn7FwQV5mXW2xNcIfV1NY1xdVjUB7L+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okEcsxJxQLQlkUKFYJYeXH6UPPnbX6RdRHokjNuyCv8=;
 b=SxZtwPWp86kCOv/XFDQbCGDDoFbtjqZTzKS8A6FTplubPzofpLvGxj8P/honB6fpLuOFgMXQh4Q6eXj4ekSPKjbuvMieuU1XIuf0yAApDbW3ABrFADfLRlTPXFZZCzqcrfXrr7PQYJyLTQnPxnck4rUbsOWjGHiHB2LUuS/1RouwJjrywRj8EOAetkceZ1juCjMwhWS55IFQBmGtHG7TdYmfeT/+hpIm2DmHQ3V/3uV0NYnx6kdC2E9aEHI4+qa79WcOBOv26hW54ZWOZEL5DyZBCwzS+2bxNnDjsSfvQx+BmB7TBAblUxFQAJ9vOIsD1nFtPguDH9KUxgT0UTagdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by IA4PR11MB9345.namprd11.prod.outlook.com (2603:10b6:208:56c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 31 Jul
 2025 23:14:03 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524%7]) with mapi id 15.20.8964.025; Thu, 31 Jul 2025
 23:14:03 +0000
Message-ID: <1860e1cc-1d67-418d-ad62-5e7e6ce55f97@intel.com>
Date: Thu, 31 Jul 2025 16:14:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/guc: Add firmware build type to available info
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250725002111.3906267-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|IA4PR11MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 02dd00c3-4483-453e-4d64-08ddd087f062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHNxYXBGd0JlaHgrMlcwcDRGeUg2bE15MUpjVHJtQU1kTU9Jb3QrdWlEa0FU?=
 =?utf-8?B?M0l6a212L3VzU3BUU2Q4RFRpaTRPL2tJNUI3WDV6VThoTzNzM1B3RmtrZHVR?=
 =?utf-8?B?VnpUaHhOSUhsNkttdUp5REN1Rm03TU94c3FGZ0J5QlJDb0dBT05iM2xKT0Uz?=
 =?utf-8?B?MmRmZUN5dWtGelIvOWZycU1TbmYrdEFMeTMyTVJlcHNJaS9kWXBQTTR3djFy?=
 =?utf-8?B?MmNENnl4aWxxODZlUnlETFdEL1JaVVBNeE85V1hQZ3lvc0x6VXo1QTFLbkRC?=
 =?utf-8?B?OWxhelNpd3JCaTJNSXJkb212cFJyVHN6VU5JUTdGTXEyN1lkM3dVMUFWZXhi?=
 =?utf-8?B?OTc5WnBoTjFoTkNQZWFrRlpPTHBia2d2bkh0Mng1MlBhL2k2b3VoZlJ2OERJ?=
 =?utf-8?B?WS9PRFpBTzM3bjR4UUJJcUJ5aXhRanRtb3QzdmZSOW5mL0cwMGdKbzV6M1Ja?=
 =?utf-8?B?WkJscXpWeDBiaVBQZnJHL05Ia2V3UTB0cnBUWVM1TWVHTFJpWlpUdWVRU1Ur?=
 =?utf-8?B?RGZmQmVkQytKNjg3MUYzY1dTS0JGbHhVSkVMVDJxRXpsM1JxQnJHK3YzYnYr?=
 =?utf-8?B?anQva2hWOW9JZEV2OVEvdVVjTHAwNTdsaXRKSmtabnZnSVBYU0JkQzRHRWtz?=
 =?utf-8?B?ZGp4bzl1ODdFbDF5bnE3eFdwT0pFdHRsSUZwMEFodDA2QS91VFJYc00yMzc3?=
 =?utf-8?B?UmZTOFpLOTdlTDRUb2hrLy95cWtpWEtNYUowdzhHWVBRR0pEb2JOZmd1bEhE?=
 =?utf-8?B?d1lDSjlKR3VFZDZLeVZCRWo1V3hMbXA5M2dVV0VNSGVnSlpHRVJhY3pUZnZH?=
 =?utf-8?B?b2w2cHFVSHl4QTZyWG9lSG81N0V5S1Vsa3RFa21od2VlcHhVcm5PYnNlMVVo?=
 =?utf-8?B?MnFrKzBWdmJTME5wOXdHREFta0V1b0M4dTBiWUJ0cHVFdVZKU3l3ZEFmM0xz?=
 =?utf-8?B?RUhac0hyNDRrRXhsNFg1bzVEMmtLa0ozRWlHL2FKZGI3N3ZVZnRoOXNmOFBs?=
 =?utf-8?B?N0FoazZtdWV6YzgyQysxVDd3UlhXYUN3WFhrK3BtN0VJRmh6Z0lIejhmM25B?=
 =?utf-8?B?akUzWjhVVG8yMmxhc1F4c2g0bEVNR003QnNkd0NmazNoYW5BMjJMZE5MR2pU?=
 =?utf-8?B?THFxRzBVSW85SEgyKzcvM3pFOVJ1YTRBUXJuc0Jxa3IvdjFJSkpRcEhaV1pt?=
 =?utf-8?B?RkJpVk43bDB1bFVVQnZFNUlWem1yMERKMEIrN3hUWUtmT2dqdHp4QjFOdE5C?=
 =?utf-8?B?cTVxUHUreFd3NHZhRUN1N2tvdFJnaVQxZmdEdjNaSlBQRndBVEQxeEIrMU92?=
 =?utf-8?B?bGpaUEw2NUJPZzRsbmphYnF5cms0L2lpMXA1RmQxbHArRXZzZTJBSXFCcFVX?=
 =?utf-8?B?Qm5QWjVrM3Y4ZWFaY2h5USt1M0J6OWx5dHBsOWF2alJmMFh6U1lDNXh0c3Q5?=
 =?utf-8?B?b0RYMDhxWHU5U0dkeWZoT0cyVGo1UC9hUitEV0h2ZkFrL0tpRmx5Y2NBN2Rm?=
 =?utf-8?B?eTZxb2JJaUY4NHRySzUrTnpDd0toZFZ1aFh0VEZxMkc4RitjRHdNekhIenVE?=
 =?utf-8?B?cnVQZDIvekd5NkYzRktjVGlhb2lqcEZOdjN6N0RGVlBudVp4UHZ3NEI3NmtD?=
 =?utf-8?B?SmJ0TjRLRCtVQUZ1NlVOQklDYy8vU242OGhqVENJdVI3czQzUGRleGtIQUV2?=
 =?utf-8?B?bGZnanR2WHRKajRMTE0xY1dVQ24zb2p0ZnJYdU1zN25PN2ZBWFl1bGRVeXFM?=
 =?utf-8?B?WVF3Ri84cWxnZnc5SG1jLzRNaW5vMExPVVNRT29idTZrTkdFcUNod2oySjlv?=
 =?utf-8?B?U1VKT0lieFBmc2tYTFBXa2VoWUcvTDV3RnVxOG00dlUrbmJGZjhrNlZPb1RR?=
 =?utf-8?B?eEtwUHVHL25XbjAvMHV6NjNDSlZZNUhRRUtmeklsMG9mTkNRYUxiNVM2WURG?=
 =?utf-8?Q?RhrIj3U3BYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzErb0lROTFGVEw5UjdsQVIzWmgvbUFvWkNqWFkwTjdjaU5OZkZpK1RuZ3o3?=
 =?utf-8?B?MS91dGtqb2ZNd3lRckw1Y3hqREtvMlEwZUIvUzBLMW5IMEpIcFJGSlk5c052?=
 =?utf-8?B?d2llSStyajhRaGZoLytuRWdlZmlwTGNLMmVuWTFzbGJLRVFpNkttWEl0QjhV?=
 =?utf-8?B?NjV2ZHZnOHMvUGI2SzUyWHprWTZCbjJRbHl0WDBQZEg1djZ2cHJpaFNEbXdY?=
 =?utf-8?B?VWI2T2ZoTW85SGJxaFdCbGxROGNMQ0QzMXBsZFA5QjUrQ0g0UkExckVGTmU2?=
 =?utf-8?B?blFrMjZPK2dVTVd2dmFoMkNyOGRBSmwvQmRqTlRVeHdSdmxWZyt0RWVJelAy?=
 =?utf-8?B?a2Ryb24zSDM1S1BVMXNZUjk3UG1NSWFhZy8xdGdROUJlSDRoQWVKcFV2aXBi?=
 =?utf-8?B?QW5iUXR6TlpOd2pzdzJQcElpYnY5dWJKQzM4MDZMQTAxZ0g2T2xrbTJLa2JB?=
 =?utf-8?B?U3pRTXlLbWUwU1dHdUF1Wm5ERGZOVGI2NTlkTUlQTUNHcHY4ZEcrSnVVRyts?=
 =?utf-8?B?Q1paVVJ5ejFud2haSXhZMG9xMnRGQ0FhNXoxQlZZUHNmVitGQkI1TEhIRjJY?=
 =?utf-8?B?MU80TjJVUHk3OFNIMGtyMm5OV3VWNW5KYUJmcTVScXRWMFFLQjFQcVl0bFhF?=
 =?utf-8?B?UHFDVHhRc2oxVS9hdjAxR0tJbDdPQWs3VytBRnhPSXJ4YlBTNU14YU1YVUUw?=
 =?utf-8?B?aTA2T1o2bXF5anVnWDg4U2F0NTgzN2pnZ3JWdTh0RTUxbjQvN24rZm5qUkE3?=
 =?utf-8?B?cmJaYnplN3VwR29XVWVqa2pxUFFJZ3hLTGt1b2p0dkwzRTFBOW9Fb3dPemRv?=
 =?utf-8?B?UW1NUWUvd3JMMU05OWJUd0M3UjR1UlRHRExiR0UxYXhOanlmbk5JalFjVE43?=
 =?utf-8?B?SGoyMjdsUGxoSjRlUDdOZU1QY3VYMGJ2Mi80M1FOMFJYZlhmSVY0VlNzVUgz?=
 =?utf-8?B?QzZKaERvNDhuM1JyR09CKzU1dnE5d2JWKzUyQ2FyVFJ5Z1M1cER5Q3pwZW5Z?=
 =?utf-8?B?S2NLZUgrRlV1bXFSd0x3bmxHSlJwMmxRRmZpSmZIMUpZMG5sN1V6YjFKN0s2?=
 =?utf-8?B?M0NhQXU0VmhCQm81Y3BWM0FsVFNWcG9QSFBRMllSVXJ3czhnSUNDVmZ6dThS?=
 =?utf-8?B?TXp3bVk2byswUjNobTJRYWRGd2EveWxsMXU3TkxHbytZT0ZpVmF1bEUvZXVv?=
 =?utf-8?B?MkVQQVl5RkJhYk93eHNWaTNRWHk0aDhjWlg0T0trWHhCR0xUUVRsZnM2NlNr?=
 =?utf-8?B?bVBGTHBwUjNNdHgyc0kwL1kxWXhGTEVOY0hrVmpSRGNYSzg0Qms1QzI3ZWtQ?=
 =?utf-8?B?VFNLNER3TThSaE1qZGRZdEMrUk1iV0ZORzl1V1JXNm4zSSt6ZzdibFhzaWJp?=
 =?utf-8?B?Rm9VTjE3SlBCZ25obFBETVBpclFWM3d0NGFpeWF3c3Q3MmRqOStsY2JJUWxH?=
 =?utf-8?B?akFWZ0JZTnNGVnFsbFh4MzZYcEhXKzZUaHpDUFQ4cUQxRVhCRHhZY2VlNzk2?=
 =?utf-8?B?bnE0aFZ4OUp6dm91bitCZFRRSHFJUXIrTnNvUm95TnVRZzgydEgyQTJvZTN6?=
 =?utf-8?B?YXdmMFA0WUpPT3duc2Z6akpoZHRycFFqMjRaT1pWbElUYThwQzBna1pjbDFM?=
 =?utf-8?B?REVUZ3VsMkdRc1VLdk92TWZISmJwT2pXVmU2WWIzYXYyVnVHWUpOdlN0bnZW?=
 =?utf-8?B?dEFzWWFEcXNQbWsvaG8raGYyT0ZaZmlKYVFGWm1ON3JVMXYxNnJEd1k3U1E0?=
 =?utf-8?B?dGprYTVpUGNVQXltUzVJM1BMa2ErRi90YWFaV1hCSzhIVDcwMHdLMXVsYXMw?=
 =?utf-8?B?dlhhMFFWelRDY1l1cHVSS2lESE50UjhML3lDamxWVVc3RUpGNkhhWkNUOG1x?=
 =?utf-8?B?NC83bVNPaVlIcTNIRjBYenE1WTdXd3MvRU5ydXN4d0Z1d3Z3eHprOEdaaitl?=
 =?utf-8?B?c3VHVkUwUVBVYWNvaFlLK1FFNkJnMXZyT2FyM0ZxcTBRWEt3WFlweXhyZ2NK?=
 =?utf-8?B?MDJYQkd2RmFzNVFsVHQ1Q0xpeDUvMzJEQ29zbzNwNERQQU9POGV4UFI3RUVP?=
 =?utf-8?B?bVNuQzNwZjBUUzZ5YW1EWGVkVS9STStJTXk1Mm1oelJhL3pCZVpqL3FSK1E2?=
 =?utf-8?B?eXZ6TmlOVkxKeFBWejYveUpWSzd2SWswRHRjaU00V2JGWWovNW00MDdWbFhs?=
 =?utf-8?Q?BziktxcApgnd02Gd9mj1MIA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dd00c3-4483-453e-4d64-08ddd087f062
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 23:14:02.9719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSI19DqVPnnyQu0DeypX1GcqYgwXQaddAI1VU3zaYslQm1FiqQXZ3GEIsvWcI0xw2F6oCRc6XR6zw5o1zezgGHdXqSNnNzlEdnVrnnLg+qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9345
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



On 7/24/2025 5:21 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Some test features are not available in production builds of the GuC
> firmware. So add the build type field to the available information
> that tests can inspect to decide if they should skip or run.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 1 +
>   drivers/gpu/drm/xe/xe_uc_fw_types.h | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c8378f3e0032..d51827c969b8 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -348,6 +348,7 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.submission_version);
>   	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.submission_version);
>   
> +	uc_fw->build_type = FIELD_GET(CSS_UKERNEL_INFO_BUILDTYPE, css->guc_info.ukernel_info);
>   	uc_fw->private_data_size = css->guc_info.private_data_size;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 914026015019..77a1dcf8b4ed 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -147,6 +147,9 @@ struct xe_uc_fw {
>   
>   	/** @private_data_size: size of private data found in uC css header */
>   	u32 private_data_size;
> +
> +	/** @build_type: Firmware build type (see CSS_UKERNEL_INFO_BUILDTYPE for definitions) */
> +	u32 build_type;
>   };
>   
>   #endif

