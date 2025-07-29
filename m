Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7353BC87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 22:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5CF10E344;
	Tue, 29 Jul 2025 22:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPvyQHGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DCB10E344
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753827653; x=1785363653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xoitkhuEDkOyzfGQzb1kgEIyudy/hwf6LRkdNkxjVV0=;
 b=hPvyQHGOG7oE3C0xzSSlX/vfOuQBUZqrUBjvi/MLvTfXm5rGHMk6fxLa
 SkkhHSPbSnRm8zq9vYdzyquvhna2DSRCmKhoS5/XsrywkB9IQFCqT3XUK
 2DR7GK3p8kPR3sBMGQRF0rR0dnosGb0x2lSTgi9Vckd9hSGNRaihEXXsF
 RZwMlUZkrVnBdTRykvKkZnnzzF+izA1/n64KxLWI4yq4DoeCgjQbW0uJZ
 6vhfkYxZaF20m4jZixREOBC9hY4RTGjgNEBpxYTXfO5zUvbeKOIWzMYsd
 qoA9qCt9hJAv6SwJaSBD+sh1Ci5UFiplD0zkB23EJvrC+HYR0fofStivQ g==;
X-CSE-ConnectionGUID: 1ohS5qkaTryiT0Tl6t8Bhw==
X-CSE-MsgGUID: bEhgbesJROGpKLGuUeESPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59933159"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="59933159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 15:20:53 -0700
X-CSE-ConnectionGUID: HL6PthJUSO2Y+e/+i0cHLg==
X-CSE-MsgGUID: vlSWH80FTxqckHsRolXAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162540035"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 15:20:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 15:20:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 15:20:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 15:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQFE/r2CjxNBR/LBEMZVuIgkFc3LSZh7P33wTYpdc8c/lWsMUe/eSAwTK32FZvOaW56X2nk0Bb6WIfVP3lYzyEMkKWCLipEIDKD0BoPQDD5tZ0xM5IsxGCISc3m7bg2LQ/nMxwV80/k0QnzcvwPtUunQSOwxjWYBxl2iUdqixj2IR8sapUjfMUCcgztsx8r/WIRzrYH14SmEZX7iFFES7vcHrj9FQx3hBS7NtgIfmr/DkbxZcBDND3sjAX8Aj5RWRy7f4Xjc7AO5Maqy1/HDglCEpAa8vNLi+rpNU7KqYAdGmY/czmjlks32kFqVI8pLO4bDIYYqtRqvHrr6yX742w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9LaIOL2gEcir7mln1hmA+SgdyLA2GMXNqFWiQWoy5E=;
 b=Nd/xAknIK2o4TnnQk8t3GJN9aDeRNN/0RxP3CryH48O5JUA5efG6ARJe3pPFeoxEqlVwbPKIjv503Pcdj5OID0bsfELSRT2Ikf8s0MCe1hNJPaMRiqXgNCoEQ+QMAKW7nmruESYt4nowYczewVTuH/f5ZaYzeU07jve7dCqI43uI00bPpHBacbacwF22I+5jCd0dPfsK85qZeRk6EGiDAB/wQuBRWpmhnlspmDbtLhjS3lwVo/memORRvBd9RZ3Tg5UOlir2fQejyorTaCPgbo3ed+RgRT3LxI9qF8Q/Jrace1sJ1t55xiXQdgL9MrFGWSgPpOx6bZcyBJS8pAxHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by MW4PR11MB6788.namprd11.prod.outlook.com (2603:10b6:303:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 22:20:48 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 22:20:48 +0000
Message-ID: <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
Date: Tue, 29 Jul 2025 15:20:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aIk_4BBGSuIp19WQ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:303:8f::33) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|MW4PR11MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e47a94a-4a9a-40cb-b27c-08ddceee2acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emNKQ1ppcDJqaHNNSS9zVmY1ZVVyS3NsU0pNVkFaRjBJQ3lZNVpZT1BjOVhH?=
 =?utf-8?B?aHdxOHdlMUxsMDJ5U3BLOStWVnUwTUdSSU9zcTZmRjl1dWRiOTA5Z3BOejBz?=
 =?utf-8?B?MFh1KzJia29RVmZHU0hGVHVMMisyWWVUeGFBT0ZseEluNVpoOVY3TUFFUEJK?=
 =?utf-8?B?cWwra0c1WXNkaFlMd1BoVndPYlNRU3h6MDhjUmRrSytQL2pYL1o1S1VETEtl?=
 =?utf-8?B?OHNrNWxicitxWlhGNEF0UXJJdU1Bc01aRWc3R1VFUjdnSDZZdVVXZkJRSHpR?=
 =?utf-8?B?ZGpyMDJCSnZoN00yUVRrYWMzeGZpam44cnpmcWZhRXpXZHRXYTdtZkhWeFJs?=
 =?utf-8?B?bVR4ZXNETGQxbHpBbUFBcHdwWnU3VUJ1UzlHRUhkN2FBckM1aDRVVXpCSnBo?=
 =?utf-8?B?N0pnTzhUalQ3bzN2T2JBejhpeVd4cysxWnhDZHUxNXU3MXREU2dXYmJVaVM5?=
 =?utf-8?B?SGxFUjFUZGwvaHVZWnhGQURiZit1cmZNUjl4WTZYTzBnT1ZPSUluS2JXZWhC?=
 =?utf-8?B?MEV2cjJNZ3dLakVYeXFaQzJ3bEZJS3YrQmlyU2hudnVudlBLU1NRVG0wMUFI?=
 =?utf-8?B?QXNlaXM4dXp2dkMra3c2NEZrTmk5TmR6eEV5amhKZU43ZVBLS1JlOVk5VThP?=
 =?utf-8?B?MUpUdzRvSytVaVErWjF5c01rVjR3V2JFeHJ6YzhIV3grTVEvSXpJWkg2dEZT?=
 =?utf-8?B?T1BvWlZ1ZEdYcFhETlQ4V2h2ZHk3ZDFJT1JqS09hU21HYU5NS2NhdGhhVXVh?=
 =?utf-8?B?OFpQNHFELytJb0lRVEVpM3kwTWh2S1Y4VU9NeWc3S3Z2VE53a1BrOTA5WFRO?=
 =?utf-8?B?UmFqOFpCR2NsQWZhOU45ekt6V1YrZ2JBdWdFNlFHdUhZaEVuYXNkYkNlZzVS?=
 =?utf-8?B?K0pwc0pGMS95MzRDRVhwWFN0OGN3MVdoSjVSb0piYmJRanhONmIwbGMwdWhm?=
 =?utf-8?B?M25VR25IUVNTN3RDWVo5ak02SG5ONGVQQmVWb0c3cEJWWUVhSjJmbi9pV0NJ?=
 =?utf-8?B?eUcrRWlSbXRneW1XdWk2RXozMHRySjhEUVE3eHV0bDlRaGY3SW52cWZ4bnE3?=
 =?utf-8?B?TUVNQSt4OFJWTG5UOXJYaWVYYzV1ODdLdVY4L2dSV2ZxYzFmVTYyQVNTL2du?=
 =?utf-8?B?cEZubVVyZUVrWi9obHhkSDB1V2J1Ni9Tdzk4TjR3djN1R0N0QkI3RnFQeHZx?=
 =?utf-8?B?cXJldGozN0ZPWWxVSnNNZ0ZJY00vQ0xEN1pTOWg0K2tGZG10cWNGNW9Lazdy?=
 =?utf-8?B?Q0lDZ0diY0lNZFRaMkJ4T0M3TXNjaDl6dklPR2VFeUcxREh2U0J3NS9xNjN4?=
 =?utf-8?B?a0VMSUFyTW1FbmJHOHdQcGg4b1FLSGs5emZvYlZacmFlbEtoanFuZTJndHFQ?=
 =?utf-8?B?ZVZLcFphdytmaUs0U3pTWXFXbm9uRk82eEhIcW9xd2thTEdEaEhXMmF5bmdO?=
 =?utf-8?B?d2M3Z28rdlVkM2UxUFlTSXlwNlhJajdRT2NJMUxSUG0yakk4b1dKVU1wc2pM?=
 =?utf-8?B?RllBVU9QaFRpSEdvQ0RuQUxPS0M5dWN3d1R3cGJOa1FiTWJTNlkxVGxRUVQ3?=
 =?utf-8?B?RDhnNkdyNjBWeWRVYVh1ZWs5aHZ1N25MZWNUV3c4aGhVanAvTE9xU0tnY2FE?=
 =?utf-8?B?UzFUUkFlUUZBNlFHRXVkWlBNY0ZoSnlTandJZmJFK0RmdHg1aU9ZUENld1B2?=
 =?utf-8?B?Ujd4WWthY3pIaUk2Z2pkbWo0S0xmdmpOK1hjVVNkWlhndlZxTVIwZlFtS3Ny?=
 =?utf-8?B?a3FuK1JDN3VvcDl1aEtxTzRpdWI5cUJtT2VSeTlGVWxOazBPcnh0WkovR2pm?=
 =?utf-8?B?QVFsSmtIQWJDdWZiamgyaUU0L1JySitHQTRXcm02K1JnNGJRS2FaZHZxbGdB?=
 =?utf-8?B?eXRaUlVybURtOTBJeFRhUGVXK0VlSkEwZ2JhNFVWNENPQ1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UER0V1FNRlNqVjVJNXhvdU9ua0pGeTZtWU80Y1hSVlNQQUV4OE8yVnRpUjEw?=
 =?utf-8?B?UFJyMC9ySWxqREdJb0FxajZ6ODY5Z2xid3pwMzF1ajZhdGFsWms4UjZOOUg3?=
 =?utf-8?B?SERFaDZzaytxUjdEME5pU1RLOU4vSVpCaUxaOGhOR0FEcjM5K3YzcDBTWDcy?=
 =?utf-8?B?MDJHc0tlTkFJdE5pdzVldVBuMU8yR2hLUEpvYU1pN0FlQVNUdFIrY091SmVC?=
 =?utf-8?B?QUNZSDU0c3hpNWR6a1d4UWtZaVdoSkVHNGZPdzRydnN3cXc1TGdBdmJtbDR3?=
 =?utf-8?B?bFJnejJtNUd4VUQ2cXhESTQ0WW1STXluOFNGMVJ5Yk1SbHNBOFNna2RtQWx0?=
 =?utf-8?B?SDd1dGgwUGVWSnluRVpLcnJiTU5lbnRsTnY2OXd4L3I3bHB4RnBVWUpIUnF0?=
 =?utf-8?B?a2w1ckcrTXJkNmZFODZoaXIxSkFaM0dVaDd4MVMvOWRNR0RQZGl5c3R5K0k4?=
 =?utf-8?B?MVZIYjlBc2ZheEJkMXovQkVhdWx0c1JGZnQ3QjQrdGl3aFdOR1JqcHRIWDFR?=
 =?utf-8?B?TnE1NTUxTnBidG9YcExoSnk5RmtHTHRNUStoblZRcjlPWFpmdkc2dVp0aW40?=
 =?utf-8?B?SW5PSWNndDVLcUR0b1VJZzNRSFNiT1BueGtDTVBYRHRSQXdNZy9BZm4ranJ3?=
 =?utf-8?B?eVNEa3hkYUJkK2FNeGxiQnJxOXQxSHhsc1dxM1d1Y3JISUFDU0d4SSszT3lW?=
 =?utf-8?B?OVFCM1BBb3B6cGMwSW1yajgrVEFKK2NNaDNTbnBtbVVJT0dXK1R4cXR2U2tQ?=
 =?utf-8?B?Wko5aHZuUlJMSlZWSnE4RU9LTHRqazFNYlZaU0pGZXNGU1dkQzdtUlVKWTVn?=
 =?utf-8?B?RENERjQ3K0dHSWxpUnJXeHNoZ3FLbStZZlA0THNDODZHcFpybkpvZWxxZ3hP?=
 =?utf-8?B?ZnJJRE5UVnpMcHNyUUFiYW16ajJERVAxb1N1VXo2V2VYUWNlWExmZjFzWWZN?=
 =?utf-8?B?Z2FIWDlzdldZaEZOU2tYZzFPdFBWMk5qaGNUNWZWQXVyanl4UWU5eTBFVk1j?=
 =?utf-8?B?am9VR3VhSHNoYXpjUFVXWkttUEhVTy85UUN1SmZTMmVEcGxSQWdJNmpNSjlm?=
 =?utf-8?B?Tld4MldrWjhZck1pcTV2bDB2TDdSeG9KSU9pTlhUQ3FHVzVsdll3RG5TL3VJ?=
 =?utf-8?B?Q0M4NzRCSXV4R0VjbWVpRTcxS1d5emo0MDVhK0V3b3huWjhKeWdsTU90VmZB?=
 =?utf-8?B?RGZaWHYyTW1qY2lySS9xcHNpYTJ1a04rT2hXSTlrdmlSZzVLMlJqRWZBTnQx?=
 =?utf-8?B?ejRCNmVVcnl4MW44cmtVSkFSSDlmalFxSytZNzRuT1UvWFpNK1B0TkhNR2hB?=
 =?utf-8?B?U1NmOFUrMDVvSVR1MkJnNUwybWV6ak8yMTBUUmJ6dGJXRDM1T3VxYzR0SW1V?=
 =?utf-8?B?TVJVbGhZWVpHZkl1YVNoa0VOcFVyUjNwSXZoZ1oycU5lb1Mra1FlRGI0SG5B?=
 =?utf-8?B?UElwRHNoRzg4dkVzMVBFRFN3eHVNNTJPR1pXSWwvS1c3LzViKytESjNIV1RR?=
 =?utf-8?B?M2tKOHRGOW9SNEdoa3BuMXdaVE50Y012SFpaV0ZMcWVCeEViMFV0MzZHRmQw?=
 =?utf-8?B?QitKZHFCeWdqdDQwTkl3d3pkWnBZZGU0Mkw3YlVKOFA1dzB2OWdlejEwakkr?=
 =?utf-8?B?WHYzb2JYd2dWMVhhazVVRzdRY3ZiYnRSUis5NDRQUUwrTU95RGRicEhjNm5Y?=
 =?utf-8?B?ZERpOUZ2YzYrNUc5NFAzVVlITW9vZ0czTno0dVZvUzh3WmY0UUo4U3hOMnBk?=
 =?utf-8?B?N01qNldmUDB6eU9lSmt5cVF3dWVicUw2Ulh4eVRLZXQrSURHRkpCaUNFdGJK?=
 =?utf-8?B?OXN2ZmQ3cEZVOVc5cGNoYzQ4Tm83R1hPeWhQZ0Rqc0VmMm84Q2FhLy9Tdy9q?=
 =?utf-8?B?WW9PblJHcGp0Nk45Ymt4Vkg0K1E1SHI1M1RRaVRmdGxQd21OeXVZMjZvbDNT?=
 =?utf-8?B?cURtUllzWXdqM2hPYUVMS1pLbHdvUWpWbWI3eVBnS21reHBPampMcG10TXJs?=
 =?utf-8?B?NGE5aDZqTHUvVW9QMk9rcklia0liTTBIM1JCdVhWTTlzMHRocGJ2T2IxczZm?=
 =?utf-8?B?OE9NclZTMlk5TnkrRWJZUTNQWFVpYWZkRllxSnovcnRoK3lwV0s3SmdrOTFt?=
 =?utf-8?B?cTROTmFsN1lKRHMvdnJrY3lyNmdhZVJQeW0ydG53NmlSOEg2clBiZ2dXQ2lR?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e47a94a-4a9a-40cb-b27c-08ddceee2acd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 22:20:48.1798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70hlnEKKtzEncG9rxwU26TnBsnD8xbybEaRdCiqWRlqgBHch0jXrp8PSds75oZM5X+6wT79f1DTR8UOLm8inYoJXfNpZoyEgnOZURIjnrrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6788
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

On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
>> Since we already lookup for the real PCI device before we allow
>> to create its directory config, we might also check if the found
>> device matches our driver PCI ID list. This will prevent creation
>> of the directory configs for the unsupported devices.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: rebased
>> ---
>>   drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 5f145ccdf535..766775772eef 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>>   	.ct_owner	= THIS_MODULE,
>>   };
>>   
>> +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>> +{
>> +	struct device_driver *driver = driver_find("xe", &pci_bus_type);
>> +	struct pci_driver *drv = to_pci_driver(driver);
>> +	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
>> +	const struct pci_device_id *found = pci_match_id(ids, pdev);
>> +
>> +	return found ? (const void *)found->driver_data : NULL;
>> +}
>> +
>>   static struct config_group *xe_config_make_device_group(struct config_group *group,
>>   							const char *name)
>>   {
>>   	unsigned int domain, bus, slot, function;
>>   	struct xe_config_group_device *dev;
>> +	const struct xe_device_desc *match;
>>   	struct pci_dev *pdev;
>>   	char canonical[16];
>>   	int ret;
>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>   	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>   	if (!pdev)
>>   		return ERR_PTR(-ENODEV);
>> +
>> +	match = xe_match_desc(pdev);
>> +
>>   	pci_dev_put(pdev);
>>   
>> +	if (!match)
>> +		return ERR_PTR(-ECANCELED);
> why ECANCELED instead of ENODEV?
Or EINVAL? This is for when a user has created a directory for a PCI 
device that exists but it is not a Xe device? Seems like ENODEV is not 
the correct option given that the device does exist. But ECANCELED also 
seems odd.

John.

>
>> +
>>   	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>   	if (!dev)
>>   		return ERR_PTR(-ENOMEM);
>> -- 
>> 2.47.1
>>

