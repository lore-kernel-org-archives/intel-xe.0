Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B444DD59D8C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 20:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F6510E958;
	Fri, 12 Dec 2025 20:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4GyyhX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13E10E958
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765570375; x=1797106375;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=0iI8Nx8MVAyZJ87I77Jo3LQ05sm9EEg15Q2EUFr1j9E=;
 b=R4GyyhX/j2EKnvyu1y9VZ9I5rCBt1JYVwUx2GkKwxvC1bvwQpS+lwpaZ
 KwJfznrL6NO68VSFVbsHqQbu8u1bkNwqcoC762Rg1ot6+ipTLMd2Vk93J
 Mib5NIBloqDpQsFyI2izAwowPgW/14eztGdtYdU8XBVe1f3hFXesijOW3
 gUV/vqkKwa9hVOdT70UA0p8mXNsPSC+4SW/8PLRxCS16G0FOQl16QSK6N
 BRnKXAIm3E4gAwH/b8ZzEA2r4MbJaZ6BmpQcZm/sunyr5EPkyEKlEYxsN
 7OvNWRZPZFEsi5uKwEroLWs+21UPyYSOojiOG69Ub5POvz35pVOSxaqTU A==;
X-CSE-ConnectionGUID: 2v7SSt36RmeCnzdP4pVW8Q==
X-CSE-MsgGUID: XtWiUasrTCWtPZxituxuOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71425621"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208,217";a="71425621"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:12:54 -0800
X-CSE-ConnectionGUID: TWxjxQHGQ0ajgDTvDNSgSw==
X-CSE-MsgGUID: P3a81m2hRb+/5YBlZexdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
 d="scan'208,217";a="197237110"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:12:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:12:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 12:12:54 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:12:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rR0EZt71GI++NXNTdaB/NY/ce26U7PCmts6mQg8Eut8rLwgfbfJcl0OEP7pI6cABo6LQIxn5wys1OH0WkOmRn48X4e79iOSmLcJS8VZBfRZxdMF4yeaSKXsR/FS6Cr88nnuIK9OnHaE0qtA4riABEmg5f77f5tEHwH4EYL3l2SWawxFCCRygvcDaE0BOnlJXpZoZUP5reqvuNICxOHKknrZSsZtRZA/GjolVv4lDGJcOgJ3nvv3pkt9dJ0dPI+TqL3tMqEix7P+0OkCulbcbIWiqi55T+zGS9vweAx+GrSsvbqPg0mKdENAhtIEF08weLh1ilUdObU91xtTIgw6zRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUGLjN76Gmwe+s3LtZlIbLUI7nHRGaQGiUVdniIp3O0=;
 b=uvonEru6RRpjTUTXxQ+11UeaS5Tm9EhVLSdirS4nvj5lbANXLqCCPMn4QlG2s26xRqa6LeVCcJfYpLolNL64WzQaSGxLGZNoG0UjVay7Ie+5M9bBDBZrPfHFLC+/QVeLzpFF6TDUeWOqjw+SvEg4HQAXShGYE49C38hyzbOHHNblgRrS1qZ0BK9gfUHADXg2afBO2HAk7MCt61b2cZe/Jdgq7Zvnoi6y+eHRCMRNkCxqmaEvBz3fDn0GKVLa1KrjZ63wve7XrLjKPSsLuNRzu5qssenVnE1QG6rMxGe9KIrsA/HugWEax2KdTWRuWRKGd9/XabrZ5S+riggiTcPCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 20:12:51 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 20:12:51 +0000
Content-Type: multipart/alternative;
 boundary="------------uqTzcIo7940D920wQM7SvbZC"
Message-ID: <e35a5469-15b4-499b-9a03-7427ebb319be@intel.com>
Date: Fri, 12 Dec 2025 12:12:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pf: Prepare for new threshold KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
 <20251212173449.192639-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251212173449.192639-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: a6498d4e-f27c-4248-43f9-08de39bad3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzNVYXQvVWlRVGZLY0l0Y1FGYnVOUy9oM25lWlQ0TW1XNzhhZEpJYzVHOGNa?=
 =?utf-8?B?QW5yeEhkTVpZZWEvNENNNlF6Y1ZER1o3MkNHSU5pMEUxVk1tRXQwNExhRXJa?=
 =?utf-8?B?L2U1dGdXY0pHeEhDMFg0U0IxZlNPWjFvQmJwRENuRkF2V2x0QTJDOGYwVWVp?=
 =?utf-8?B?WWVQSmpNc1k1THhXYlRZcDJBeWdXdDQxRWk4ZlpmRzBvZG9DWXBYL2dXdThE?=
 =?utf-8?B?K0kzbUZtQkpVb0hsak8wUXEvV0xJUkRMR2liYnNkaHVPQ2VBQ2pFUHZuY0F5?=
 =?utf-8?B?ZExZZ1hBbmNvUFRMNzhkNUFwSnRiZjV3UzQ1RWgyakw1L2wrRzl2RHN4U05y?=
 =?utf-8?B?V0ZIVUgyUnYzQktEbFBISmE1d3pSV2YzSVBPQnVGNHo5QXZTMlQ2OHNqckc2?=
 =?utf-8?B?Tm1ZOHpiU205NVZ1SWNSY0Y2elo2VnAvWktpU3lyZzJsZHo3emFmWGFOa2s4?=
 =?utf-8?B?cWpjc1o1bHJrUDdkRXNvYTJmZzYwMmk4TWhsYkFIS2V2SklRajhXRVEvM25n?=
 =?utf-8?B?SEsycFkzVldwcXdlQnQvM3ZoQzJVV1VXby9MQWF2djBlUUMyMy93SW1tdXRq?=
 =?utf-8?B?ZG9EelZsQ2J5TUlVU2ZwN1FEQzg5eTAzako3cmhIUjZmQjJSUExzNmMrQ2hZ?=
 =?utf-8?B?bVdpMEphb0tWUHFoUGJnclJPenF4bjVSL3ZxdDltMm1MWnp6dUJzOGI0U09s?=
 =?utf-8?B?U1pYUmxOSG5Gd3JqZ2xhUElXU29tY0c5bHkwcktIeUF3TnJReWN1enVyZElX?=
 =?utf-8?B?dzVmRlZUK2pkVzAxcjlMYWNsRC9PUTVJbzhvOHdaOCsxZEdOR1RyOHpVMm9y?=
 =?utf-8?B?c2lKVW5ud0xzYVBZaUducmQ5c29NUjY3QkhrRUtnMisxd3RQbGNsQlFHc09H?=
 =?utf-8?B?Skg3VFhGb3FITFMyMG02WGkxRlBwU29lMjRNc3RlREFvWEwwN1ZCU28yb0tF?=
 =?utf-8?B?eE51WWcvTWFITk1aaVpuNlhOTW9MNDdWbFk4MkJzNGZXVGpVVUZURTZueVdK?=
 =?utf-8?B?a1N5NDJyVUpPa0kvSEkvRzJidFlDNWlQak9oVWdCZjRvemc1SDN6bzlqREJq?=
 =?utf-8?B?VzRueHpOM3ZtaW1BOHc0elpNK1dHV0Z6SjlPOFdWbzdyOTJBQ3JnVkRCd2Fp?=
 =?utf-8?B?NHhsdFRxamNxSzNUWUd0SHlvLzVjZ1lxcjhmaHhkNzdkdWIzQTZZWnQ3ZVhp?=
 =?utf-8?B?RHM1UjVTUFViOGFjMHZGQXpWY1kveVplWU9CMkluZmNHSnFvQnRLaEtlVzJP?=
 =?utf-8?B?QkdZMUV4T3k2VFlQbmFYQjV5ZG0wZTA0d3BMei96a29OeFZ6N0NVRS8xNkRh?=
 =?utf-8?B?Yit2NGIyVE5tWEZkdDZtZ3NsOEVRVmJ2ZUwrekQwWHQ4Y1ZpZGZKMnRyNGJM?=
 =?utf-8?B?ZHl2eDZPTmhUWHpDMlZBbjJlVEdDQ1dKNUxyeXhGSkJWZlVFR2hGcG1mT3hR?=
 =?utf-8?B?N3RyU0NFT3dZdTFNSlYwb1VlbnpRT2RxeHBsNG1mL2VTN2drZVpDOVpsWjMw?=
 =?utf-8?B?VjNJaWhJSkc5ZVg2MzU0YU10a2szWWxCY0VJMzFxWXB5aFFCSEplb3NlL1Q1?=
 =?utf-8?B?RFF2YXRreFJNQWRBN3NBYzh4d01mQTVJdUZnZ3pyNFhvaDVQSVA3ckllQWZS?=
 =?utf-8?B?TWFXbVFVQnRQV2s4MGFiSFNManlCV3ZwOEttaTdVZngyYUdlb1A2SEZiNjQz?=
 =?utf-8?B?VDZHL1ErNFFCa21mbFEzbUU0UVE0UTdtVTdxUmdqQXlSZkpubnN0UXg4U2M5?=
 =?utf-8?B?Tkh6b21tTWNyYTJIaExQOE4xWU5uc0dCQzI4cDdnYURaTkIxazNTaXA3NGQw?=
 =?utf-8?B?OVgzSVoxYjYrTkNzcmFHYi9jVGhrUHpZdnNaRDhVcHZaMXBWM01vSUtKbW9Q?=
 =?utf-8?B?Zzh0YThMV1VaNWhsUGFNamF0MWZRRmxNRWRjT28vQWIxNGxoQVFEMm9hNkpZ?=
 =?utf-8?Q?ur9RUf91qlD3ffdB7eTb7OsxCUfvZ6sr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUhKaVdQUko4c3ZQaGtMcytZUjE5SXhoeFZ1L0tWcjdENmVXdHZxdDVQSzY2?=
 =?utf-8?B?dFBnb2lJSEtzT2RpeXFadm5DbVNxdm1qRzBuMXd4em4yelI3ZTh5b3hmeFFs?=
 =?utf-8?B?bldQZElzWEZCaWcyaDJBd2FBcnhPaFdtY2RPZk91MGFOTDFuMThZcmdiMkxp?=
 =?utf-8?B?VUJDaE1MS1J4bklpWjRWcER5TnV3U0txQXZyRmNJaEpKTGtYZVUweG9IZWVD?=
 =?utf-8?B?aitIY01Idyt0cHE4NEtiZmFBNzRNcTFFZWhPNjNHUXJpcjFWdjkzeW9JalFB?=
 =?utf-8?B?cTBiR28rRUFWbGhHbStZYnJZb20yZHZxODV0eVV1S2pjajZMQUNmazc0WnNS?=
 =?utf-8?B?V096QzdHMys2VktHK3dSUjk5cnJsM2ZXYlA3bVU4cFNyOFFUbFZYem9XMnp3?=
 =?utf-8?B?Y0V1S01ZbVVrMmFiSmJGTXN3VVA2cTFSTS93RjMrazZkU05jOVBkZXo2TElZ?=
 =?utf-8?B?N0pGYnFiK0tvYkdkSTV3eTcxRVhaTktrdU1qb01BVG94dm05TE9Td0lWOFdX?=
 =?utf-8?B?bTYxRHBrSE8yZ1doeVJKMjlLckR6NWJ6Vld5dVNsb295emUxNUhJM2dVd0lu?=
 =?utf-8?B?MExHamY3WmlNTWVMQkhLbG5GY3lTRy9jS3VabnlVSGp2SHgzMy9HcVpUU2VD?=
 =?utf-8?B?MjgyNElqTHdteHVhTGVZVzE0REZlWmF6N0VZeEZBSTBtb0dpVWJFbEZER0ZV?=
 =?utf-8?B?ajJUeUlBbTJPN3FsOEFoa0ZzNWNJemJWc0hYUU9XdW1wM1ZKYUVaSXFXMFg3?=
 =?utf-8?B?bHpOcmg2dlZWVUIzbHEvREh3RHF5RVVQNnFQOUF3QVd4aEpqbDIrUmFnSkJI?=
 =?utf-8?B?YTVQTTM3ZEkrZjB1ckRyTll5enVBb2ZUR3hzclByNTBYY0JFZG9DT2dVMjc0?=
 =?utf-8?B?QVJMZE1OM1dLNVJabG1qMldubExQU1BGSjY3RlM1WGZaYm1hT3dWazVPajhm?=
 =?utf-8?B?Z3RGMW9Tem1zVDJEcmo0ZEpFdHJKQ0RnUE93Nno2ZGxielNDWXkzKzFaN1Yw?=
 =?utf-8?B?dFVHRkMyNFYwcytwZFZBTzVPcXlhSU9MTjVoOGNzUzZVWEl3Q04wTTIwMlRx?=
 =?utf-8?B?Zm5GWTRMcHJTVTFyamUxWDIrYlpJMGlHdXBhWkxVdk1KT0p2cnhJdm8vVi9S?=
 =?utf-8?B?YndiYUY3U3FISWVVTzZnYXcyU25KZ0VSUEc2SmEvQ3NkOUdnazQzNHBkVEFK?=
 =?utf-8?B?VEgxREM4L0Jac1RWbDl0S1VvVkZoekJSbmdPcnNtcUVtSkQ2c0k0TFhXV20z?=
 =?utf-8?B?bXFTcnE0VWFJcWk0bnZMSjBLUjBNSDRFWnRway9oZ0M3M2JxbC9kZWg3QVRK?=
 =?utf-8?B?NGJDVzRYY2RyUGIzS1JWUzBFWU5oWUFBbkMrcXpxYTBUVVZPSmRlaUZ0aFdr?=
 =?utf-8?B?VXNGajRpdEZqbTdxbk5HazhseWxKTzBvUFdBSmxMdFNwRCtOTVFaWmJSdFZN?=
 =?utf-8?B?ckZzb2wxT2xXWXpQSkh4d1ZPWlZHNjdCakFOdEpSbGVyenA0eGhSV1M4Unk0?=
 =?utf-8?B?ZStyREg1MEZReWlqRjhsQjBxZE5xZENieEkyeHBYNFgrSWs0dnhWRkZueUQ5?=
 =?utf-8?B?eUN3ejFBRGlZVU1PU3dqZ3gxdjh5WHkyZVYrS0lLWFErdkI1bTJmM0NkZE9J?=
 =?utf-8?B?R1p4NjBhQUU5dEI3eEV4bnZPTm5Ld1d1WjNNbFE4dC9EN0l2NXo4a3g5VFE5?=
 =?utf-8?B?SEorbTBjK3lNN3FJRGtyc05WeSt5RHd6OWVoUkRvcG5aQmt1TWR5NHlyR2Vs?=
 =?utf-8?B?SUw4L2k0aTF0Nm91WnNiYmZHU3ZibndLMW0rWDI0QnpybnJnZFlxTk1sTEI1?=
 =?utf-8?B?T2pKWHM0Ujh2WE9pMytTU0FJczV2MkxzbEdJa0JEVUhwSllMcXFMUlNxNy8w?=
 =?utf-8?B?a3JiYmIwaWJNUUcrZFlVMEtFUlUrQ2h6TVpuOUl0SXUweGxUWG1nN3ZJTkpt?=
 =?utf-8?B?KzlmSytDUkxVdTZTUkRnd2JpaXRiaktBQVZ5bDdBZ3BjTW1SRUIrSi8ycFpJ?=
 =?utf-8?B?ZFdwV0VrQ2o1WFdLaFBYOXR3YXYwdU5sYXZtclhXSUVCendIb0VKN0Q0OXda?=
 =?utf-8?B?dWk1czQ5ZisrWDZzUGhoUkxZbGlVdys1aTlPUmFWSzN3TkZ1T3FVV2Z5em94?=
 =?utf-8?B?bW0xSHY1RjNCUkNMUng2Q29qbGg1T2dSc3dyRmdvbnU0QkZKc2I2T3cvMEU4?=
 =?utf-8?Q?tHqnMFNfrnh0CGIUml+dCq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6498d4e-f27c-4248-43f9-08de39bad3ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:12:51.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqDE6+a1TE8s3jbTjJe3wPUQXcT9GlpbRHmmmyvMj88zYqYX2V1LX4A/UWpz/lCN/NHkxZIox0QKA1tGS6lo86suwedZfv9LpTwyZHmrZ7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
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

--------------uqTzcIo7940D920wQM7SvbZC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 12/12/2025 9:34 AM, Michal Wajdeczko wrote:
> We want to extend our macro-based KLV list definitions with new
> information about the version from which given KLV is supported.
> Prepare our code generators to emit dedicated version check if
> a KLV was defined with the version information.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 20 ++++++++++++-------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
>   drivers/gpu/drm/xe/xe_guc.h                   | 18 +++++++++++++++++
>   .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  5 +++++
>   4 files changed, 42 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 59c5c6b4d994..2d039f67c99d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>   }
>   
>   /* Return: number of configuration dwords written */
> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
> +static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_config *config,
> +			 bool details)
>   {
>   	u32 n = 0;
>   
> @@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>   	cfg[n++] = config->preempt_timeout;
>   
> -#define encode_threshold_config(TAG, ...) ({					\
> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> -	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +#define encode_threshold_config(TAG, NAME, VER...) ({						\
> +	if (IF_ARGS(xe_guc_supports_fw_version(&gt->uc.guc, MAKE_GUC_VER_ARGS(VER)), true, VER)) { \
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);				\
> +		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];		\
> +	}											\
>   });
>   
>   	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
> @@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>   		return -ENOBUFS;
>   
>   	cfg = xe_guc_buf_cpu_ptr(buf);
> -	num_dwords = encode_config(cfg, config, true);
> +	num_dwords = encode_config(gt, cfg, config, true);
>   	xe_gt_assert(gt, num_dwords<= max_cfg_dwords); if (xe_gt_is_media_type(gt)) { @@ -2518,7 +2521,7 
> @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int 
> vfid, void *bu ret = -ENOBUFS; } else { config = pf_pick_vf_config(gt, 
> vfid); - ret = encode_config(buf, config, false) * sizeof(u32); + ret 
> = encode_config(gt, buf, config, false) * sizeof(u32); } } 
> mutex_unlock(xe_gt_sriov_pf_master_mutex(gt)); @@ -2551,11 +2554,14 @@ 
> static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int 
> vfid, return pf_provision_preempt_timeout(gt, vfid, value[0]); /* 
> auto-generate case statements */ -#define 
> define_threshold_key_to_provision_case(TAG, ...) \ +#define 
> define_threshold_key_to_provision_case(TAG, NAME, VER...) \ case 
> MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG): \ 
> BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u); \ if (len 
> != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG)) \ return -EBADMSG; \ + if 
> (IF_ARGS(!xe_guc_supports_fw_version(&gt->uc.guc, MAKE_GUC_VER_ARGS(VER)), \
> +			    false, VER))						\
> +			return -EKEYREJECTED;						\
>   		return pf_provision_threshold(gt, vfid,					\
>   					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
>   					      value[0]);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 0fd863609848..5362c791a698 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -21,6 +21,7 @@
>   #include "xe_gt_sriov_pf_monitor.h"
>   #include "xe_gt_sriov_pf_policy.h"
>   #include "xe_gt_sriov_pf_service.h"
> +#include "xe_guc.h"
>   #include "xe_pm.h"
>   #include "xe_sriov_pf.h"
>   #include "xe_sriov_pf_provision.h" @@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt 
> *gt, struct dentry *parent, unsigne &sched_priority_fops); /* register 
> all threshold attributes */ -#define register_threshold_attribute(TAG, 
> NAME, ...) \ - debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
> -				   &NAME##_fops);
> +#define register_threshold_attribute(TAG, NAME, VER...) ({					\
> +	if (IF_ARGS(xe_guc_supports_fw_version(&gt->uc.guc, MAKE_GUC_VER_ARGS(VER)), true, VER))\
> +		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,		\
> +					   &NAME##_fops);					\
> +});
>   	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
>   #undef register_threshold_attribute
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index fdb08658d05a..2a083d5c5865 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -18,6 +18,9 @@
>    */
>   #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>   #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
> +#define MAKE_GUC_VER_ARGS(ver...) \
> +	MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver)))
> +
>   #define GUC_SUBMIT_VER(guc) \
>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>   #define GUC_FIRMWARE_VER(guc) \
> @@ -96,4 +99,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
>   	return &guc_to_xe(guc)->drm;
>   }
>   
> +/**
> + * xe_guc_supports_fw_version() - Check if GuC supports given version.

I don't think "supports_fw_version" is the correct name here, because 
the GuC has a given version, not support for multiple of them. Maybe use 
xe_guc_fw_version_at_least or something like that?

> + * @guc: the &xe_guc
> + * @ver: the version to check
> + *
> + * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
> + *
> + * Return: true if loaded GuC firmware is at least of given version,
> + *         false otherwise.
> + */
> +static inline bool xe_guc_supports_fw_version(struct xe_guc *guc, u32 ver)
> +{
> +	return GUC_FIRMWARE_VER(guc) >= ver;
> +}

I wonder if it is worth macroing this up to avoid the MAKE_GUC_VER in 
the caller? something like:

GUC_VER_AT_LEAST(guc_, ver_...) \
     (GUC_FIRMWARE_VER(guc_) >= MAKE_GUC_VER_ARGS(ver_))

or even further:

GUC_VER_AT_LEAST(guc_, ver_...) \
IF_ARGS(GUC_FIRMWARE_VER(guc_) >= MAKE_GUC_VER_ARGS(ver_), true, ver_))

Just a thought, not a blocker.

With the rename:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> index 0a028c94756d..5f84da3d10d3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -24,6 +24,11 @@
>    * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
>    *
>    *	define(TAG, NAME)
> + *
> + * If required, KLVs can be labeled with GuC firmware version that added them::
> + *
> + *	define(TAG, NAME, MAJOR, MINOR)
> + *	define(TAG, NAME, MAJOR, MINOR, PATCH)
>    */
>   #define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
>   	define(CAT_ERR, cat_error_count)		\

--------------uqTzcIo7940D920wQM7SvbZC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 12/12/2025 9:34 AM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251212173449.192639-3-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.
Prepare our code generators to emit dedicated version check if
a KLV was defined with the version information.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 20 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
 drivers/gpu/drm/xe/xe_guc.h                   | 18 +++++++++++++++++
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  5 +++++
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 59c5c6b4d994..2d039f67c99d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
+static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_config *config,
+			 bool details)
 {
 	u32 n = 0;
 
@@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
 	cfg[n++] = config-&gt;preempt_timeout;
 
-#define encode_threshold_config(TAG, ...) ({					\
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
-	cfg[n++] = config-&gt;thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+#define encode_threshold_config(TAG, NAME, VER...) ({						\
+	if (IF_ARGS(xe_guc_supports_fw_version(&amp;gt-&gt;uc.guc, MAKE_GUC_VER_ARGS(VER)), true, VER)) { \
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);				\
+		cfg[n++] = config-&gt;thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];		\
+	}											\
 });
 
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
@@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 		return -ENOBUFS;
 
 	cfg = xe_guc_buf_cpu_ptr(buf);
-	num_dwords = encode_config(cfg, config, true);
+	num_dwords = encode_config(gt, cfg, config, true);
 	xe_gt_assert(gt, num_dwords <a class="moz-txt-link-rfc2396E" href="mailto:=max_cfg_dwords);if(xe_gt_is_media_type(gt)){@@-2518,7+2521,7@@ssize_txe_gt_sriov_pf_config_save(structxe_gt*gt,unsignedintvfid,void*buret=-ENOBUFS;}else{config=pf_pick_vf_config(gt,vfid);-ret=encode_config(buf,config,false)*sizeof(u32);+ret=encode_config(gt,buf,config,false)*sizeof(u32);}}mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));@@-2551,11+2554,14@@staticintpf_restore_vf_config_klv(structxe_gt*gt,unsignedintvfid,returnpf_provision_preempt_timeout(gt,vfid,value[0]);/*auto-generatecasestatements*/-#definedefine_threshold_key_to_provision_case(TAG,...)\+#definedefine_threshold_key_to_provision_case(TAG,NAME,VER...)\caseMAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):\BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG)!=1u);\if(len!=MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))\return-EBADMSG;\+if(IF_ARGS(!xe_guc_supports_fw_version(&amp;gt-">&lt;= max_cfg_dwords);
 
 	if (xe_gt_is_media_type(gt)) {
@@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 			ret = -ENOBUFS;
 		} else {
 			config = pf_pick_vf_config(gt, vfid);
-			ret = encode_config(buf, config, false) * sizeof(u32);
+			ret = encode_config(gt, buf, config, false) * sizeof(u32);
 		}
 	}
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
@@ -2551,11 +2554,14 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
 		return pf_provision_preempt_timeout(gt, vfid, value[0]);
 
 	/* auto-generate case statements */
-#define define_threshold_key_to_provision_case(TAG, ...)				\
+#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
 	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
 		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
 		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
 			return -EBADMSG;						\
+		if (IF_ARGS(!xe_guc_supports_fw_version(&amp;gt-&gt;</a>uc.guc, MAKE_GUC_VER_ARGS(VER)), \
+			    false, VER))						\
+			return -EKEYREJECTED;						\
 		return pf_provision_threshold(gt, vfid,					\
 					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
 					      value[0]);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..5362c791a698 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -21,6 +21,7 @@
 #include &quot;xe_gt_sriov_pf_monitor.h&quot;
 #include &quot;xe_gt_sriov_pf_policy.h&quot;
 #include &quot;xe_gt_sriov_pf_service.h&quot;
+#include &quot;xe_guc.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov_pf.h&quot;
 #include &quot;xe_sriov_pf_provision.h<a class="moz-txt-link-rfc2396E" href="mailto:@@-301,9+302,11@@staticvoidpf_add_config_attrs(structxe_gt*gt,structdentry*parent,unsigne&amp;sched_priority_fops);/*registerallthresholdattributes*/-#defineregister_threshold_attribute(TAG,NAME,...)\-debugfs_create_file_unsafe(">&quot;
@@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &amp;sched_priority_fops);
 
 	/* register all threshold attributes */
-#define register_threshold_attribute(TAG, NAME, ...) \
-	debugfs_create_file_unsafe(&quot;</a>threshold_&quot; #NAME, 0644, parent, parent, \
-				   &amp;NAME##_fops);
+#define register_threshold_attribute(TAG, NAME, VER...) ({					\
+	if (IF_ARGS(xe_guc_supports_fw_version(&amp;gt-&gt;uc.guc, MAKE_GUC_VER_ARGS(VER)), true, VER))\
+		debugfs_create_file_unsafe(&quot;threshold_&quot; #NAME, 0644, parent, parent,		\
+					   &amp;NAME##_fops);					\
+});
 	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
 #undef register_threshold_attribute
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index fdb08658d05a..2a083d5c5865 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,6 +18,9 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) &lt;&lt; 16) | ((min) &lt;&lt; 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
+#define MAKE_GUC_VER_ARGS(ver...) \
+	MAKE_GUC_VER(PICK_ARG1(ver), PICK_ARG2(ver), IF_ARGS(PICK_ARG3(ver), 0, PICK_ARG3(ver)))
+
 #define GUC_SUBMIT_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)-&gt;fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
 #define GUC_FIRMWARE_VER(guc) \
@@ -96,4 +99,19 @@ static inline struct drm_device *guc_to_drm(struct xe_guc *guc)
 	return &amp;guc_to_xe(guc)-&gt;drm;
 }
 
+/**
+ * xe_guc_supports_fw_version() - Check if GuC supports given version.</pre>
    </blockquote>
    <br>
    I don't think &quot;supports_fw_version&quot; is the correct name here,
    because the GuC has a given version, not support for multiple of
    them. Maybe use xe_guc_fw_version_at_least or something like that?<br>
    <br>
    <blockquote type="cite" cite="mid:20251212173449.192639-3-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ * @guc: the &amp;xe_guc
+ * @ver: the version to check
+ *
+ * The @ver should be prepared using MAKE_GUC_VER(major, minor, patch).
+ *
+ * Return: true if loaded GuC firmware is at least of given version,
+ *         false otherwise.
+ */
+static inline bool xe_guc_supports_fw_version(struct xe_guc *guc, u32 ver)
+{
+	return GUC_FIRMWARE_VER(guc) &gt;= ver;
+}</pre>
    </blockquote>
    <br>
    I wonder if it is worth macroing this up to avoid the&nbsp;<span style="white-space: pre-wrap">MAKE_GUC_VER</span>&nbsp;in the caller?
    something like:<br>
    <br>
    GUC_VER_AT_LEAST(guc_, ver_...) \<br>
    &nbsp; &nbsp; (GUC_FIRMWARE_VER(guc_) &gt;= MAKE_GUC_VER_ARGS(ver_))<br>
    <br>
    or even further:<br>
    <br>
    GUC_VER_AT_LEAST(guc_, ver_...) \<br>
    IF_ARGS(GUC_FIRMWARE_VER(guc_) &gt;= MAKE_GUC_VER_ARGS(ver_), true,
    ver_))<br>
    <br>
    Just a thought, not a blocker.<br>
    <br>
    With the rename:<br>
    <br>
    Reviewed-by: Daniele Ceraolo Spurio
    <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a><br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:20251212173449.192639-3-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 0a028c94756d..5f84da3d10d3 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -24,6 +24,11 @@
  * ABI and the associated &amp;NAME, that may be used in code or debugfs/sysfs::
  *
  *	define(TAG, NAME)
+ *
+ * If required, KLVs can be labeled with GuC firmware version that added them::
+ *
+ *	define(TAG, NAME, MAJOR, MINOR)
+ *	define(TAG, NAME, MAJOR, MINOR, PATCH)
  */
 #define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
 	define(CAT_ERR, cat_error_count)		\
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------uqTzcIo7940D920wQM7SvbZC--
