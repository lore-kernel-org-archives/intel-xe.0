Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1888CCD19F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 22:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF5E10E52C;
	Mon, 20 Oct 2025 22:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmdklQK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7017D10E52C
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760997600; x=1792533600;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hXB1r13igLrAEZ6jMw/gSN+NkqEHNNsHb9Y2my5tef8=;
 b=JmdklQK8F8it8ybZV5RI9XocsSIImvy3lrDGmdAwyhabARPHtRRKbC8Y
 44VGJR6c0n+t3EZUSd30zI+tM+QptSUcO/nBjYoYyhfDrgSqZRPDYaHm1
 TcZE4/Ze72+gOu1Kb1BMPAzGOrbqXPXi3rtNI/saMr346P5qnb3z+Jlt9
 ES7Uo/hTRtrwsQoxBKi9JTeyuh/t4hlaOYb13OV0vDjqvIo/Td0IXyblS
 /vzY8TR1P4BliLVS0CI+/0MIjsFia1vG0HYMIV8KwX0+CCDzF/I8COZzf
 4TpTEl7pSePNSfO3dVKfhLlwPkaWP1J+LQa7PJJAtUAYK5eD9DBcDtneK Q==;
X-CSE-ConnectionGUID: yf62gQCUSbCFYr+gKYWowQ==
X-CSE-MsgGUID: OFjElIfcRZilns3DssPphQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63029478"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63029478"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:59:58 -0700
X-CSE-ConnectionGUID: sC3pq7geQx+J6DWh3MA54A==
X-CSE-MsgGUID: +SWjABARSvm7TeFbCuJwtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="187453949"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:59:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 14:59:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 14:59:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 14:59:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bj15okKii09U+z2DhyHAGQ+0LdIAMlOdt0vxrbTkoHc8iG4RqPX5lFyE/0bFu/EYgid6iunWt/Y2M26y6muGhcIfmcm8md+rf4HNfHFeiGhIlnMiFbVZURHuAEZo9L69XgolV6b6Z2zMgrx1beKIR+unlORWf7sAl1YmstFxJLjH7LXa2PMrFIIfHZNoHEYRyyxz8P/9Jcxsk9a9+dG1kZiodVJR7OzsfD6W0fI/mJw3rUwAnqc9ibtkKwzMGAk3cDqEg6JdLncBtS6cMsKzSrKcK+RbclBBI/1B2tGEPUo3B9jKSl5iFqae2qdEHhQGnOgVn8ZvrmErAX7jD1g0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i741k/Z5d3kgII4kRHuGN0Vh7O3A+PHWzq3elPL5ghI=;
 b=jrstohXzjWXfXpl/JHMEWSczPxjrWnZa7KkhKAtkkReBqAGj27KWwRMItkbQ0vGVFeUnMmu5Huo8J1pEttIPUtij4+GdQfrmA5IClpNLFvCX/fi98hsJVT2C38U/+gwKnY3egthEyAgo3uWWtPOqUxXrmtPwiGAIegEtCHQnoY13tRubs3qD4PrPQGhUU9K4AI+CA3iPgaiEb7AVDyj8YeOWoHfP7Pa4fSny98Q/4L+/DbUnfBvcmuh5dXU2zbecVBzr07ugUMpfqW811UtdAIYU+hEJrLczyMdRWqAkdOGVk7fxo6qpPBO5Hg2gnoJ/AhH5VG1C4On22xAVYsIcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 21:59:53 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::dc22:ef1e:53e2:f00f%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:59:53 +0000
Message-ID: <8c9bf95c-e650-4035-a5a4-3c6b1d353851@intel.com>
Date: Mon, 20 Oct 2025 23:59:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe: Assert that VF will never use fixed
 placement of BOs
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
 <20251020205808.1187308-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251020205808.1187308-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::18) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d495c6b-859a-4595-3b60-08de1023ff89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDBaUGtINnljN3dla3ZHK1A3SE9kM0Jnc0FRaEUrMGlyaEo4N0Zld1BPbkRI?=
 =?utf-8?B?RmtRVUZzYzZsVVF4ZE5MbDZqOUhUZkJVczkvR3Z4ZFFMRDJPQzlmU3BYWWpM?=
 =?utf-8?B?NkNhZlBad1dkTm1icVI3K0hrdmlRbkpjakNtQ1ZNZm83OHZQYzBlZDh4WWQz?=
 =?utf-8?B?NVJNYU9DMzRrQU1ZOWMwWVI5VHVPY1p5NDZVQzRCcWQ3QTZzTHY4OHR0bDA1?=
 =?utf-8?B?clp4Y2VQT3J6a2g4MDFRSTFPUDYycnd0L29xa3R4Yis4TDZlMEdJU1N0VzJQ?=
 =?utf-8?B?dXhMcDBXL25nTEUxTUVYQ1MxcXpGVURJTE9QVmovTjZ5NzRZdWswK1pWaTZj?=
 =?utf-8?B?UjkyZTNWSXFIcCtEakliZVorSDI5eU45Uk5yeURxV2twNVhWZDhURW42bE1N?=
 =?utf-8?B?c2NnRTRBUmlhT1BsWHFnTzRqRDJxcE1BZEVPL0o0Z2RQRlBnWmJpY2JvQlhh?=
 =?utf-8?B?b2VMVElqTGRJSXVGWk9pSFV3MWVKdUFzQjdUR3VUaDlQQitRSi92K3I5Q3RV?=
 =?utf-8?B?c0g1YTN0YnUrYkd5RGVrdVpVeEFwTXFBbm1INWVtQUZORktvYUYvZVdnMG1v?=
 =?utf-8?B?N0dKUkRvTzMyN2IybmpiWEpLenFOSVFra3FrL0JUT080dThPZjJVUnJJTjVx?=
 =?utf-8?B?ZkpGUHlBcWVybVpmU080aW0vejd4UzVSR2JYdnB5U1VhbDU0MHZvaFE3OEY5?=
 =?utf-8?B?bGlwQ3Mra2xxVlhWMmFML1lMWVFCeGNkNmpmYUNLT01vTGwyY0JRMDdPVEVu?=
 =?utf-8?B?Zy9PN1FjZ0NRMkticGljVUd1VmthbFJiUWRoV1FDeDI1eEpUSmxQbWlDazFR?=
 =?utf-8?B?aXFjWGtnZ3dodUZKNkkyMi9wQUsxbmJDbTN6TloxMnYwS290Z3N2SUlNK3lz?=
 =?utf-8?B?WWRSaERpSWRzR1J4UGs1T2RLMWpFNHcyV25vbU43czBXZkttcWFVejBvNi92?=
 =?utf-8?B?cGsxSjJmQjM1cXcyMTIxTllzWElYbWpkWlVNNDF5TmlCSkdDcUIzMlRhbVRu?=
 =?utf-8?B?MXU4eUc2RXNsbGZmSk85UktQQkwwVCtnaXFBY1QyRTNZb2JOV2wrSExmT3ZM?=
 =?utf-8?B?Tml1SWx4aE16TUZ2S3ZpclJxUk5NQVdUVEVKYWxDRHVTTmdOeTJXbGpybkor?=
 =?utf-8?B?dUdvd2xFb0gzZ2J6SkRlNzgxR29POHl3L2Jqenh5d05aWDZTYldIRXpQWUt1?=
 =?utf-8?B?TDUzYVZyVFBPd2haWUZ2THlaL0ErMG1JTUxxc0ZRY3ZCM052VURvQ2tUZ0pi?=
 =?utf-8?B?eXoxcDF6SUlvcGlNemFHUVpPRk5uNmtILy9Qd2tiTFhZSUw3SGxDNjQrbjJQ?=
 =?utf-8?B?LytFdkJ5T05ycExGOVIxTFAydjd6TytvS25pZ3ZiUU05MHBrZ3VvWE81dmU2?=
 =?utf-8?B?Z3lqWDJsM2M3UUV4QjJuRzdBSk1tVjZPNVJ5Q295dFVFLzlKeldPRFNGeldm?=
 =?utf-8?B?T0VFR1p6d29tYTZIdU9LQVVmcFFYTFAycGEzK0d6SmlkK2pJbmRqNkRLQVVk?=
 =?utf-8?B?Y2t5aXpHcWwxQ1ZJYUJLMjRZR0lsQ2QwSlV5TnVYZE5FakV0Y0NvWWtSUktT?=
 =?utf-8?B?bjJ4VUNnYjR4ZXhVQnVXdFI4Y3YvbXJkK2Rvbk9Tc1M0RU05Ky9BZUJZYkZT?=
 =?utf-8?B?bGdqbTNvUzJRYldFR2trQjdMWEwvdGwrN09SczREWm5aU24vYUF0cUVhMEMy?=
 =?utf-8?B?WTZYSG9GQk9teUFSM01FaXNQSFNNNVFNTFVYT2xsRjBvMGJvU0lSekFQZjJs?=
 =?utf-8?B?NVdYL2V3amNlbkhoa2Zlc0VWMklOWmlXWG1HS21TajMyNGU0L0l1U0VGUDN2?=
 =?utf-8?B?WjFwV2lKUU1VakhiNnZZdm4xWnNDeHBLenZsclRpeDV0RVJUV2xyQVFSV3Rz?=
 =?utf-8?B?Y3VsdWc5cDMwclhtUEhIU1d1aHpMTjhUM1Bnc09JV3J0WnV6anAra0FKQUN4?=
 =?utf-8?Q?ecD/urZd2vxhqaVN6z/pQnviMboqKt5w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxCSVFJZlpVVytnQ09YRTZHaHpXTVAxTFlSWUJSeUEyMWF0cUhHTTlZT0xL?=
 =?utf-8?B?cmlOdk5sVnRxSUU2aFZlTk5yMzFlRk82Yk0veEpIMy8xNklzcGdGbjdLTEJE?=
 =?utf-8?B?RTZzb1BOT2xwbnlXcjhUbWU5RFg1d1N6NmE4QmRjRUQ4a0dSYVdIRWhtZjZq?=
 =?utf-8?B?VWN0OHpyS3p1dVlwcWEweFgrQVZUL0E2TW5KUjRGZkJQNkxqdVdsV29TUzR0?=
 =?utf-8?B?Wm9TMnBOWkpUSUFhWVlocDBqQnZzSVAvZjd4YXd0UitmNUtTWTIvWWxScHE3?=
 =?utf-8?B?cHVjRHIzT3Y4c2NXWXYxcW1kNVhneUFLdk9ZVmxGSzhWeWZ4cU0zT0lIa3Jw?=
 =?utf-8?B?NWxYVXdSUWFtT2hpamNLNDJOZUNqQlZxa0tJeGp4NGlvM2NLOFJ1Tzl6a0l2?=
 =?utf-8?B?UnFEMURVTVZjM05mWW5WZzBSOHBSb0hvdS8zSmVTL0xQcFAxZ0hCQTgzVjV4?=
 =?utf-8?B?K0l4QzNpNkQ2anNlMTA5TTBBbWNhanJ1bWM5Vm1id0hLcVpSYzBQZXpsT2d4?=
 =?utf-8?B?N01KSm1xZS9IQVlmaVpkc1FUS0FiQW53N2VZQm9qZzJabWRpNlduMVFraDhW?=
 =?utf-8?B?cGVlUFAwcUNDWTRSS1EzRTlqRlQ2QjEyaE5xOWIwZ2gvQU1PNHoxUzdicTdz?=
 =?utf-8?B?T3g4alhCM1kvV0hQQU9WcnZYT2NrOG5oTm1zaW1hV2wyT2FVZ3Awekl6d041?=
 =?utf-8?B?V1V4V2pxVHhjUUozK2Qvem11MVMwYzNoa2pkU01HS3VGNVdnSDB6dUs1L3ND?=
 =?utf-8?B?bHhMOFR4SkN2bUpFR2dMNUY5WlM0QUplNGVwbmplQWFXa1RvNVNld1AxVG4z?=
 =?utf-8?B?dHpnaWlRT0NvQVcyZk5lMjhhVnBlRE1mcjF5eWhRaS9TRWhXSHpRQTlDWlY1?=
 =?utf-8?B?VEdjT3ZkT2tQSTIxY1ZhV0dMdnhwR1BVZHZyQmo4TzVJYVBhTkZ2TjhNTmlk?=
 =?utf-8?B?L05rK2E5d2RzMElLZVlCN2twZUN1WEIyZnI2SGtSR0xUd0RnanhoTkVRODZU?=
 =?utf-8?B?NG45Mm5Ld1hpc1ZxNHBEWnd1Mmx2UU0yRFcxVGRudkZwejJocVdwUXdOdkp3?=
 =?utf-8?B?MlVzZ3MyR0l6MjFMdnIxWXJxVUJKYWZodUMyNmtHNkoyU1MwVmgrbENESm12?=
 =?utf-8?B?N2RKVzVPSG44c1hzZlFMY3lYb1dCMTNlZTFFZ1lKNVVsVmp3T0E0ZW1YME13?=
 =?utf-8?B?cmJOV3hOc1JuM08xNGtMcTZLVFBydEYrQi9BbzBHNVUwZGYrd0E5ZnF6U1NM?=
 =?utf-8?B?aWh5Y1lGelZIMjNSamQ4VG5Ua1ROV2tlZ3JTTmpNbFNjS3VUVnpZNGp2a0JV?=
 =?utf-8?B?N3M4T0hsU3pHUDVOdXBvdFR0YzRkMlFCc2IzMjhaUjhxeGQ5QzBCQW5mdlJ0?=
 =?utf-8?B?d2lTWGVZT3Uvemttc0tPeWh0QW5nSHJ2M0FYcHp6S092YXVvZi9mY2FaRzJV?=
 =?utf-8?B?QVg2RWFCOFhZWjdvT2lSanJIZTJDSXFyQklnN2U0dVBPS3FGSDlhNXl0d1lY?=
 =?utf-8?B?K0RRemxPNEFuK2JFTldPcm84RDZXMERlamtLeGZRVTNDZ1p0aGRiTHFaendy?=
 =?utf-8?B?VUFteGVjNk5hNGNmbEs5YVRGT2RRekltd3htV2JhQUZHZ29PNEkvdC9ZTnBl?=
 =?utf-8?B?cGwvM3UwTk9XbmJDS0NHM1RKT21ramxuWi9uM1hlbEJKalZnQ1hJZlk2VUU2?=
 =?utf-8?B?MFE3eVBJai9VTlFocmhLSVp4dDJsd0U0R0lySDIyNzhCamlCVzNUcUNhS1Jj?=
 =?utf-8?B?UUxtYkJKbWRSdkMxYldxRnRucWJOWVJ1S2dPMDBFbDJZVnVYTzVtc04zTjB4?=
 =?utf-8?B?QTFuTi9tMzBZRStTMnJjTElBUnRGcGxGUjBpRS9xVW5TbVJNWXdLZXBxR3hB?=
 =?utf-8?B?L3NOYjdPM3dCV2VnYmM0czMyYndIUmg1RVV5UHE3UGdFN08zV3Rsam9jbTVx?=
 =?utf-8?B?MWJIN2lHSktBWU0rMHRwekRtaXNLZ1grUEIreVpWZld6ZzFHSUVIUDhPZk85?=
 =?utf-8?B?QTNNbnBBSEM5Ym9PT2dGaEQzNHA3eVdJU0kwbm4yZXc2djJ6S1hGYm9zank5?=
 =?utf-8?B?Z3ovK3dWM1piVktobjFXdDE2MC9oNU5yb1BvOXNhc3V6eFRwOE1xZjl1QkFq?=
 =?utf-8?B?YTRjRmNaSkYzMzBtZWZLZ2ZJVGNaRzhJUHZZZFpJa2RSbG92SzVLYnhsUmMz?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d495c6b-859a-4595-3b60-08de1023ff89
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:59:53.3237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyQOOLbK+MQNLPAPgSMIGQV0WnLJ4lEhVBkZvSus6sE+a0jIrGjF+Rmmgj4/l2v/DNF78IvT/BTGDQw7thRHSLLJNUH5GS8wL8BNwnHvwwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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



On 10/20/2025 10:58 PM, Tomasz Lis wrote:
> Most BOs do not care at which offset they will be accessed within
> GGTT or PPGTT. The few which do care, should be only created
> on PF, and mapped within GGTT. On VFs, mapping at fixed offset
> would be problematic, as each VF is granted access to a range of
> GGTT address space.

it's not a matter of being "problematic" but this is just prohibited
as there is no assumption which GGTT range will be assigned to the VF

> 
> So, since fixed addresses of GGTT mapping can only be used on PF,
> we can add an assert which makes sure no attempt of fixed placement
> will happen for a driver probed on a VF.
> 
> The assert will also ensure that VF migration can be properly
> performed without a need for special handling of the fixed placement
> addresses.

this last sentence can be dropped

> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b6502081873..8e826a4aa574 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2259,6 +2259,12 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>  	struct ttm_place *place = bo->placements;
>  	u32 vram_flag, vram_stolen_flags;
>  
> +	/*
> +	 * to allow fixed placement in GGTT of a VF, post-migration fixups
> +	 * would have to include shifting the page ranges

it's not about implementation of fixups, this is just not allowed

> +	 */
> +	xe_assert(xe, !IS_SRIOV_VF(xe) || !(bo->flags & XE_BO_FLAG_GGTT));

but the assert is fine, so with commit/comment updated,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +
>  	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
>  		return -EINVAL;
>  

