Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B877C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 14:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5B610E944;
	Fri,  2 May 2025 14:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zy4HXhMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704FD10E943
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746196526; x=1777732526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ykxgV7cf6JtheJ5lGyxlup71CVcTjMf5Pb5HQsJmG9g=;
 b=Zy4HXhMV6Xl2qq+pfz7UQrvqbNdNpKomBZGGP05yCFNdkPrDuUVTqkF6
 iSLGVPmL3hWv7Rd7EnP4uyk1sb+SKP9nRMcpqjQo/MU1BdESp59GcxbbG
 4xPhO8TxZJEtfZ+WX1p0LrkDxfqOHumxMjHYWlwb9LW7QTDgtG/d55swy
 6Cns7m49oQ7b8tsQddf1VC4sWOcZjq+CpOFSUAyHhQHyJ761oPwbHMyrT
 s/X91J9+bfeJPs3Jpofw7FDVD59PUr3FJE2JHzXGf2gV/CDEBXf+/IN5L
 1z30f9NLj43ib2Jffi3RIOcWPY4YDwyleFn7andRM07NedtLM2aMyqV/3 w==;
X-CSE-ConnectionGUID: 6kpgTc5MSVSoG0LTOJvUcw==
X-CSE-MsgGUID: a9zNtjxcQYe48f9GPurg2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70382894"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="70382894"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:35:25 -0700
X-CSE-ConnectionGUID: Mmmwzta9QzWS3CaHEPn7Wg==
X-CSE-MsgGUID: mdwvjJcWQ8i6/Snze1oXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="134964024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:35:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 07:35:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 07:35:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 07:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezdwRR5LJD+vI1DW0y3EaaQ8hS2aN06ur97fLA47DG7ZWLp8D3XnhDtiXs2kgk608SB07LO/AMRp/SNeX+AMHENl/jz9gOPkFtwTXHS5KcWr6pdsX8QMDoZK4hWSIkpFH3Mp3vfSMF20mknuwnGH8dnZzIl/PIar1/MhQUAa7U9Q7Erk6NwSqluk+363xXQCUkLB+JUMjGhnVak+J3C1MUUREAxKMzDRkl+5LobgJjJNqZdooBYHosZXz5ylsKnPgVPLZJMMC5BMbsxyHeOBJVXAfEhfE5ofME8u/Xd+PSaBRTuxLQo4HNq8DzCAFjKy8A0GjDzPGpbA/6JLXjmOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4SoPWq/KX/AOl7hkSWAcymJzQPQE+HiR3hl1s+F998=;
 b=C3R+W9JcYLR7UrncRQ4KoJavl75JP/uUn7MQitY8B1hznngEieuHg3Fh9q43izbXj5GHmOIL3mfeNq/cEDX1fEEboWeJQm89j+1prHGjH/IslEIyfBx9/OYTaV61O4eADVf2ssTIme6m5hoxG+vfjqRMOc8edMsOyrr2hkmRTQ6+ownR9rI1tlNZjaZHj9BMCr/WF04IobpDUDcWWDtIJQqM/R5Ilq7YW/VZCpP9XhqRJMAZkybf/ahvTagL+9nZPgkKtxwNPv/QhHRt7RpaJilp+3aB81VNU7MzxGUGIloVIpuy+QDLKsF8Hqq2Awbf2c7de4OtxRj7RKJAV7vrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8518.namprd11.prod.outlook.com (2603:10b6:610:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 2 May
 2025 14:35:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 14:35:21 +0000
Message-ID: <6206f91e-aef4-400f-891c-6b11bbe4ffca@intel.com>
Date: Fri, 2 May 2025 20:05:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
 <62989f8bbb1d8f57fea227f7afdbc753b492dbcf.camel@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <62989f8bbb1d8f57fea227f7afdbc753b492dbcf.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b3a142-0167-42ea-3d78-08dd8986912b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0tpSlV4SFkyWDg2amxWZ2I2VTE0Q1h0Q1hsVUdvUlQ2Tk9ib05MSUhxaVp5?=
 =?utf-8?B?U2RRdHhSeFMzOWsvd2J6WkxHd0xkWEtLWUVsK1pxcGF1SWQ4YW9zb3dkeXdR?=
 =?utf-8?B?S2xjbjlLb0NIWmVXUk1tMUF1RCtycnM1OHN3T25HMXphdEUrd3Z3enU0V2V6?=
 =?utf-8?B?ZDVMYkFZaHZhSFJPQmlLZW1pWjJ3c2toTlhpT0l1YXhrWWJrY2RqMFRUU0hP?=
 =?utf-8?B?NVJzMFpYdUsyTk9wWFhJOVg3bytaUFB4NnN3Uy8rTEpCczhBektlL0NNaW1j?=
 =?utf-8?B?cGxrNmF0bVZmMVBMcXZoTnpXU21XK3NURTBMbzk2NW43NXFGakdYWTd4dU43?=
 =?utf-8?B?ZFhWOUJnMVo0QUd4SmZBUHZPOUxOOElQd2VHNHFMeGx6TGdkTGxuckNMWGFx?=
 =?utf-8?B?dWVyVkhqMVpHcGNHMkVUclZNcnh4c3lCdjFVUU10R0tWR0gvQzRlSkllaDJk?=
 =?utf-8?B?ci93VVUydmtNYkRJQ296NmhaSEFXcnQ4bU55STRmTnk1R0UxdExZZVE3ak1D?=
 =?utf-8?B?M3V3RS9oVkM0WUdTQUtwMFRORTU5ZExYLytWdWVxT09lV2dWSWJhdUZUTmZO?=
 =?utf-8?B?OG9aQ0RZa3RwWHJQaW1PcmkxalFhN1RjQnlqYlRWb05wcnU1V2Flb0t0RkZG?=
 =?utf-8?B?ME82cXlOeVNYczZBY2NiMGtrd1EzRWlUMzNZQ2pZNis5b1haaEt6YXZIaDN1?=
 =?utf-8?B?SGZScUtwSFo2Z1dtS1JqaVNYUGppRUJDSFhJTHMvcUlVVmhNTUwvM1Q2eGtL?=
 =?utf-8?B?SzNBVVRKSGhDR0hFQmk2QlM1czFRRXUxMlYyVlVIWHlTME83UU5pSklESmxI?=
 =?utf-8?B?VnZSaEhjRU1LOTBCWEJDUTJTQUJFNHo2SUcvRTkrOWpMc1FsazZ1L1l5Ynl1?=
 =?utf-8?B?d3lBTVE1TnZWT3U3aWN3Q3ZneDZZTEl6RGxZRFVnT3hOeU92WUF5YTV4TFF5?=
 =?utf-8?B?ei9pL2psSi9wQXVuWWZwVTZ0NWlyeHJIaWIzQXRtb2pOcUlvaU9BcS9OdVVj?=
 =?utf-8?B?cm90bW5XRi9nL0NkUmtiYjY3a1BCSFlaV0JoMFhRWTVydkpXakJnNWlrdXNE?=
 =?utf-8?B?c0dEQmZudnpPT2hqdXNrNGJ6N0RhaVNycU5kSHFiUHBveDFSNG5iVUVkLzA5?=
 =?utf-8?B?WFNIeGdIaWcwVlh6aGFJOWxyOURBWit0VlppdTVYYzFSZFVLbTRyTjU0WkNQ?=
 =?utf-8?B?d1RSRlJXajExSUlSY0pxdW9GN3JwdFNJd1lRWVo0OUlyUGs3N3JxOTdxbW5t?=
 =?utf-8?B?Q3c4aDZqQ1B4V2d3ZFRUNVJCQ253MXMxaDJKMlRtbEdvckN0QmFMejF1YkpB?=
 =?utf-8?B?Rm43OUZmTTMxc3NiOHdxY3hUZDhMbUJ2NEVQaDRUZFVjZ1k4aTZra05hSDlS?=
 =?utf-8?B?SWVjWTlwQmREMXpxdDh2MDRTSVB1SXJlTFoxTEFhZlExVThZZGcxK0dEdWR0?=
 =?utf-8?B?dFI1MnpGT0s1NmFDRlljSndMMHU2cnY3MmQrMzBuQUtTZlpWVzVPditDQjNI?=
 =?utf-8?B?bElJMHlJRDB3RDcvQldVZzQvSVVZSysydG14U05lZ2FGbXVEYXlqVVFSN1V1?=
 =?utf-8?B?UGFXOVFDM3FWeko4UUtpWUt4ekQ0Wlhxc1RTMTZZM2R0clBZUE9ORmZpbDZH?=
 =?utf-8?B?UENrUUNONmJDNE9KakJWdjYydjNmVGNEWHFPNnhUYVZtbEJjZEF0VG1kM3dW?=
 =?utf-8?B?bHVnNGNTQWlWRnc3d0U4SGxxdnRVZkIwdjh5NXk3VUt0cno5VUxrZWpkaDRS?=
 =?utf-8?B?NTZteGJiclNlTGJkNEZGNXpyL0JRTnh4TjlDRmQ1TStsS0VPNi9sMHdzYXV5?=
 =?utf-8?Q?Y+uXyAkHdQb0wppRa8eVbDO5nMJTQFDmQez2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnAzZlh6aE43NU01bmlrbmt1SFVkdFBrd3MxSUMvYnJTTTRwVlIzcHU0SmJE?=
 =?utf-8?B?MFZZcjBlRWhxYnlTblgxVXhTMVhPOW1MUGNNd2ZYVmZndWhnYzJ1aVp5b055?=
 =?utf-8?B?VkFSaURCdThtcU4vY0ZDRFVaOENUTW9ualBBdWlhOEJOS2QrbHJzL002Y2FX?=
 =?utf-8?B?THkwdzBJaFpxcFVhUTNTMWFzbFFYK2VuSVo2YWF3Y0pQSFRIbnRJOFl3WWlJ?=
 =?utf-8?B?ZGRjK3BFblJsQytadVJBVUQvdE51ZkZJejVCUDRiT0REdVM5OEtkSWVGYnkx?=
 =?utf-8?B?RTg2VTgyb2dWZlJUdW1USHZ5QlFoVTNiSUt0WjZuTDhUdUpvbzQ4V2diMDdB?=
 =?utf-8?B?bEZ5VFBXMWkwZ0hId29WQmpLUGFhNnB6UGNxY2hzQzdJcWV6OHdOS3pyWGJv?=
 =?utf-8?B?M3d2akxLNDdpcS9FTTdia1BjOVhuN2h5WlgwYVRPZzFGVU5wcWIzR2IydGpm?=
 =?utf-8?B?QVJYYkxJK3lCZ1BmYjNxY0hlR2RZWncxN28vUEtCZm5namtxVi9Fd3hSRjAw?=
 =?utf-8?B?dFI2SW0rZHhyL0Q5NjFHMmxMQXlZOTdkT0Q0bDRaTzNVSFVyaVNWd05PL0Rr?=
 =?utf-8?B?cHpPWGNrQWk4d0UyemVOVWFVaVoyZ2crRlFCS0lzNnJSem9DV2FKWE15aHdr?=
 =?utf-8?B?SFRxVFRDeTNzbzZuNno4R0gzNWJlV1ZPM0RDeFJxUlJiMkJQckJxTzkxZ3lr?=
 =?utf-8?B?emlJYXFyTWRKOGhLK0c1eXhCUlZPWmVOSkpidEV4T1B2U05GdVdqb2kvY2c5?=
 =?utf-8?B?d0VwYUFRbWpGOHpIRWJ2WVdIUzl1aW9sRUNrdDZmWFQwOGhnVzJsbXBNbGxM?=
 =?utf-8?B?ODdyaVVnSGhxVTFOSUhXeU1QQnNPNU9jd3ZwdHZKYVpjNEhwY295YWw3M051?=
 =?utf-8?B?SWZzM0E2TkorMGpEWTF3cEVleTU1c1RPT0MxSm1EZkdrb2NzYlVSTWg4UzI3?=
 =?utf-8?B?WEtGdEdJa1dleXpMR1hEU0tQZWdNWHMvNW01UzlvZ3VCQnVBUnZ5eVYvaDI5?=
 =?utf-8?B?clMrR0tSemVWV2dsbStyU3VwYWp5ZXVXbHVmQVJXc2d3R1Uwd1NadWE3NFkx?=
 =?utf-8?B?M1Y4dTdUdW55RG8xVytpWk1qTVRDS3h4ampqeEttb3JwTktYaDFmVnR4TjZM?=
 =?utf-8?B?N1pHTVNIam1RUHBYcnhjSE52RlRBc0VOUzZPZFA1NHdQam5mMFluZ0NEeHhS?=
 =?utf-8?B?dHk2QTRqUEI3ZFpRT3hFTUV3eTQ3UVNvRkJySnVQc05uRERjU2UrK0hodmQr?=
 =?utf-8?B?SkdhTUlweElmZm03eUN0WHVlTitza09BRGdFSk50WHJwVkpoT0xlYVFDQnhY?=
 =?utf-8?B?K2VUSkRqMmdxcXdjUGZsY0cxRGdHV2VUeHBtemxGWERHRGxpc3VpNkEvZ2Zk?=
 =?utf-8?B?SDBBRnNwYVRKKzBzcFQxY09JYjNEeDJHejVmMlNJRDg1amlaY0IyaTRyeFhG?=
 =?utf-8?B?SUlyV2FSTU1kbzh5RzRhc3NDM2RPb1o4RlZRaDZ1Z1h3TW9Vd2pnV21vM0V3?=
 =?utf-8?B?eUl6N1htcjBGMDBuVVAweG0rejI5c3NDYmdOR0d4aFV4YitQM25wdkhUdFp3?=
 =?utf-8?B?VlpmME0xaU4rT3krYk9iTTA1eTdTellqZmR6cnI2NWVISURCK2tXZ014aXRh?=
 =?utf-8?B?OTVESTMvd2I4RlRoeDBMWTA1T2xwUlNZQm5UcGpzS0ZZcjl5d25QWUI3VzR1?=
 =?utf-8?B?azJqTU5tSGhDL1N3RklrSWljYm9wNWVna3JaRWEzQ3VTdDR6M0ZvSnZCL3pS?=
 =?utf-8?B?WFliK2hDZGNCYTBURDhWWW5PWXpKdk5XdEZQMDAzRHRnMW9oU2tvNjNjWG9m?=
 =?utf-8?B?bDczcjhDMGhtZllsL2haQ2crS2plNmpWaldTYXM1MHNNRnA2Z2JuQ2xpOVdU?=
 =?utf-8?B?KzkvVXVWcWNPR2g1aWtKWHhoOUs5VGx6Vk56UFI3M2RsZFovU3hRd0tsMTkx?=
 =?utf-8?B?bzBZdkNqV0E1VFpYMGZxTnZoL3FadkIzOGJOODRlakwydFRZZzl6c1FzVDBx?=
 =?utf-8?B?ZWs3c3ZFbGE4SHhqdS9IczB2RWxYZ3JZMTVudHUvYjNYVmtCVkNwZDRCYXAz?=
 =?utf-8?B?ZVRRZ2s4TWlyaU1Ya3pVbFp4VE9SN1NyMzJaTU1hOUFzM0NZRlJRaW1lZ2FC?=
 =?utf-8?B?U0RMVTNtQ1Z4LzQ5bXRjRmpOVFpEcW9vQ0dGQUpnVE1Gc01SMzJzT3oyaHU0?=
 =?utf-8?Q?IBeBmgGIE3kjwM1X+WrQrM8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b3a142-0167-42ea-3d78-08dd8986912b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:35:21.4218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGur/5mZiANgZHmSpLrSHDJbPQPHgxdzfxqi455zHOLYiyDwTRNDx0p5opX/l1oWA4eI7XaTXakvXKcgWpCNGMXKZ+l+bCpWv+wDeHfs/HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
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



On 02-05-2025 19:12, Thomas Hellström wrote:
> On Wed, 2025-04-30 at 17:49 +0530, Himal Prasad Ghimiray wrote:
>> This commit adds prefetch support for SVM ranges, utilizing the
>> existing ioctl vm_bind functionality to achieve this.
>>
>> v2: rebase
>>
>> v3:
>>     - use xa_for_each() instead of manual loop
>>     - check range is valid and in preferred location before adding to
>>       xarray
>>     - Fix naming conventions
>>     - Fix return condition as -ENODATA instead of -EAGAIN (Matthew
>> Brost)
>>     - Handle sparsely populated cpu vma range (Matthew Brost)
>>
>> v4:
>>     - fix end address to find next cpu vma in case of -ENOENT
>>
>> v5:
>>     - Move find next vma logic to drm gpusvm layer
>>     - Avoid mixing declaration and logic
>>
>> v6:
>>    - Use new function names
>>    - Move eviction logic to prefetch_ranges
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c | 197
>> +++++++++++++++++++++++++++++++++++--
>>   2 files changed, 234 insertions(+), 21 deletions(-)
>>
> 
> I was thinking a bit around the UAPI, and prefetching foreign device
> regions. That doesn't really fit into the current UAPI.
> 
> What are your thoughts here. IMO this should align somewhat to what we
> do for madvise().
> 
> Let's say we want to prefetch into a foreign device memory region
> identified by an fd? I figure we could add that later as an extension.
> 
> But how does the UMD API for this look? Do we cover current usage with
> the existing UAPI syntax?

During Initial discussions one of the way we discussed was using a flag 
something like DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for prefetch to 
madvise assigned preferred location.

so it will be two step process from UMD perspective:
1) madvise sets up preferred location: which should also be used in 
pagefault handler.

2) If user wants to prefetch to same location, user passes region as 
DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to vm_bind ioctl.

https://patchwork.freedesktop.org/patch/647180/?series=146290&rev=4

or we can simply pass u32 devmem_fd as prefetch_mem_region_instance to 
vm_bind ioctl, if we want it to be single step, but w/o madvise that 
wont work for pf handler.

/Himal>
> /Thomas
> 

