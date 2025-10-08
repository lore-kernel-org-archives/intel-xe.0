Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B287CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 09:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE88510E0E3;
	Wed,  8 Oct 2025 09:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSv3yym5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724C010E0E3
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759917052; x=1791453052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bHjBrOKjyZwoaIFdnjFZFqmt3miMWqXODxE5kOwI524=;
 b=FSv3yym5gLPdbmx/VNeqCUYNnWwEHCJQV4VCg3QnntFeQDM8agVutlLt
 SN4siUOa0l4Hbefj4SsYhSqttv3ytKV57JufuSvmsbJ/Lx5blwNxRtNHI
 MRc7RyeMQXZyrrtMNDbRcFt4Znf08L4PE6MArqQu5rPhU5cVZeRIlXesM
 16RzY+b9f2AvzDa+qKlAKRE2bBAqtsrexf3zqySfR+IBQaTNhWJNJK+FL
 JMhiSNaBZZkfhNOmRLqv5YWz8Ah3/pwvtdPJooGC28KcBhI328wiP252P
 BRJyIAaKsFUKFsQj1D38pPLnpOMvXlykxGcctJer7Lcaj0lWdWKxz9THK g==;
X-CSE-ConnectionGUID: MtjgU8kfSjye0gmG2SplKQ==
X-CSE-MsgGUID: pP8WfWv1QuG3y6RaVWNzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="62202940"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="62202940"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 02:50:52 -0700
X-CSE-ConnectionGUID: +R7tcA1fRvWcZWIFxfwOwA==
X-CSE-MsgGUID: mbvRjTIFStGPrFHdXCGHvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180815825"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 02:50:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 02:50:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 02:50:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 02:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyB8nySkAZvdWsjPwfAs5fiwP8PLJVyeWvJ6GLhZ6zfCCCbxPgP4hPaIHjZKuhDUKSoe+giIptbqPRHEN+GrSQ8IHyM1WOyitF+IyEpOuJD+1HrrlXFA8V1bGu4To0tAoOYzos4rMpRH8xoC3CrAzXVE9XlHpESUzAmFab4kVKYozSCBtyZpA61U58CvUPwch5+qy/tqMO4jtKSzffEQEU5zcji3n93k/A4W1sk05ntGeV0XOlgTqeHcs2v0ZWDx4WbdN1vJMhdFoDkzEzBGyVdWJ7y7syMzyABUXrdUakIYNdHqbC/i9dPByt0g7UqETs9BW1NDpUldXWxkG5d6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShH1e2x9GgoOmHG4Xyq9HiNT91RqlnavG2Zu1cnVJjY=;
 b=sbqVD3vs5C6hMbU6vqdpW3MuI5Ns8/XWR0QyTPLe30Y4dD66Cjgo8xeKyvQo1wrWTGcaXX+rxsPadInOGUSFhIgDz/cjhIkOhOZ0qUCCjdJn7WoBHu3b4R8tpc/tCC5ap8nSc6rmamqSARBKP8n/v3aVLfsMva9Tk9rNEy6g4ZinlXHEWE8NKiLoaGv8MuWhMFSsciaasEqFHVphviyIaW/6Rg9J7pclNNTTwm4pqdSBKfn7EVF3GiZPmjrIODpcNs5u/YB6knKasVihVXX1zmNCwr09gDONCJZ6TqrSGeJGRmYP0vOVOtstLlQbVsu9x87OXWm7YD+JbWc2YoiDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Wed, 8 Oct
 2025 09:50:44 +0000
Received: from DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::bf73:67c:8fe0:7e29]) by DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::bf73:67c:8fe0:7e29%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 09:50:44 +0000
Message-ID: <b71ff0c5-6e30-4a84-a894-1b574d10c3be@intel.com>
Date: Wed, 8 Oct 2025 15:20:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe/migrate: Atomicize CCS copy command setup
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
 <20251006152443.12269-6-satyanarayana.k.v.p@intel.com>
 <aOQfeQ5YYcOVmafh@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aOQfeQ5YYcOVmafh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To DS0PR11MB8686.namprd11.prod.outlook.com
 (2603:10b6:8:1a9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8686:EE_|DS4PPF6CF7B12C6:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eab7c1d-a0f0-4d29-ef14-08de065025a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U09GajVERmhzbUFRMG14TGZ5dTRyWlMxR1hoM3ZRSEw2bFhXZCtrczlhQS9P?=
 =?utf-8?B?dDM4c3ZnZ21PSUFNNVNUQnZVcHI4dUtvRzNxOEIzbHNLWGxHSjVPNVcvL25F?=
 =?utf-8?B?ZXA3cmM3d3pkRFg0aGFsTW1IZUJCdmR3Um1PbGNiRjZnUkNjUjhZVVR5bDZZ?=
 =?utf-8?B?Z1VLa3ZTa0VGOGErd3pWSFdXbXJWY1FEK3hJWjhjZGJEQ0E5M2JxU2RROEdo?=
 =?utf-8?B?UUFaS3RITEcvMjBvem9PRWxLbVNVd1dKa1BGa1M5MXoxby8rcHhaeDJTWWxL?=
 =?utf-8?B?ajdIaFpQQWJpWjQrZFBHYi9IcDBFNjJmTkUzRTIyaUFQY0E4K2JNZnhXRDBk?=
 =?utf-8?B?Wk1iL3VMYS9TWVE2TlZrbE9QTVpQMGdyYXZ6UEtKQllrcDk1QWVneW9LUnMx?=
 =?utf-8?B?OUNYSkFaenlrWEt4Q3Z3NVIwZmk0Y1hwWFJSL2NkNXdiU1pLMWk4REFiQkhI?=
 =?utf-8?B?a3BxcFZRM1VBd1lQY0Jra1dYcDRHdDF3d2luSHJCem41bDlydUNXNS9pVUJk?=
 =?utf-8?B?aHlqcDhEd0NTZFYrcm9hN0ZrRlErRjYybHI2TFZhbEF2UDZYcXA3STNFR3pD?=
 =?utf-8?B?SlNDRjgva1ZYRVA5QjlabWM1ZlVaSFJHOUVJZjVwck5EVWp3a3d3V3VRS1Jv?=
 =?utf-8?B?cUpaUzRRc1grVStITFBXQUVBdDAwR1dRV1RtUE1IZTlFd3pvZFlQS092c1dq?=
 =?utf-8?B?L0xucXhpd0hSWHNDQitsb1lEQnlTaFhESjY2eCtOUUIxeU1pQnlqaVQwNFk5?=
 =?utf-8?B?N1I5dWd4Sk5KcVBCQ0cwa20zSVJtWEJneldXQW53d0FDbWU4bW9rejF0VXhY?=
 =?utf-8?B?bnpndE9WbzhySWV1dWxhS3R0VUNoY1g1aU5RemszeW13QjkvUWZGYURzN05w?=
 =?utf-8?B?MDYwTnllZ3NLcmVDeldNRDN2Y2oxTEN6UzRGZzBkL3ZIcGlDYzh6dWlSN0V0?=
 =?utf-8?B?ZHRoTE1Fazg5Ykp6MFR6bmx5YUdkS0wwZlBQMzZVeGZ1MXRZMC84ZTliMm1D?=
 =?utf-8?B?TGlib2pRWlhjbWRmM2dVNkI3RGtwWUt1Q1dTWVpUcmtHLzZhMTJRQkpmajkv?=
 =?utf-8?B?T3c5NVlkdFpyb3kyc3hEaVVyWEVZQkNFUTN6OW0wWTI0SFUyTlEyQlhhbTZV?=
 =?utf-8?B?Q2xiOCtIc081T3pVRFJzU0Nta0dyTS9JSFFyRERFUHZoVDM1dFdDcHU3SjUv?=
 =?utf-8?B?cjhXYlUvRDFBN1F4dHhYSTI3RGNKWVJTNW5ESWw3bVhiMm9odmRndS9vR296?=
 =?utf-8?B?ckV6WlExQ2VoenI2N3I0bzFkT3RTYTFxQmRZTWtCbDArcCsrQlppMGNON2cw?=
 =?utf-8?B?bXZtNVFqVDFMSkZLbS9NN09RYkNKbGVDZTNsOG9vTDNtckMzVEx6YTl2ZGQy?=
 =?utf-8?B?TnNnZkhtbnIzeml2SXJEYmM5YlMyTFhkWk1nejFDZUVCNTNkWTZLYS9Palpn?=
 =?utf-8?B?eFdIdTh1L2c1TjZ2MkwrMFUra2V4ZGVrMnB4aVVVV01zT1NhSXk0bWNPeE43?=
 =?utf-8?B?ZllHSnQ0SVNtY0dBUUdPdTlUQXByRjhIR0cxakUzWTdrcmhtdGpBc3lrVjJ1?=
 =?utf-8?B?cUFwcHJxcVU4dG5KRXFtcUM5U2FJOVYwcHBTaENGSFJhZE5BdGhYbkIzWVdJ?=
 =?utf-8?B?Tmd4ZlNNeW5NbXpIVm9TVnRoTUJJb2E1U1hXR28vdGVWTE1FZUNDRTk1ZkRS?=
 =?utf-8?B?eHh4T3dRNGNkU1psZHhUL3YwN2ZGY3hMNWVaT0ZvNVRGNHloc2ovaUM0Qjhr?=
 =?utf-8?B?a0szaXpHVDhybjJja1YzNUpyTWthM2FDUDFkcENWNEs0K2tvaWVCeVc5Ulh3?=
 =?utf-8?B?eDRlbGttRVNFQzhYS3hjUmFJclFFNkRGQ2JyaDdKS21zVUFxRi9CM1JjNFZY?=
 =?utf-8?B?VlBHU2dGMW4rbGZTOUdtRm0yNTd2ck5OblZubk82M1M1YkdGdGtzdEdqTW9R?=
 =?utf-8?Q?ICWAtkl8iJVhWh1sTihOZtXlsWp0DeCH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDNtOXlNeUxoajNxVDF2WlllWDlTcTUyRXVXaEtFUW5UTmZvcUo3cWRGZGUz?=
 =?utf-8?B?MUJVZ0xaR0NLaEZIdENlbzhiNmRVZXhOWElSejNab1AzR3Q2YTJGNDlLR29M?=
 =?utf-8?B?bEpzWlEvZ0VXNXFhdnlKYU9JQWkvZUNaY21SZTU4Y1ppZ3RKVkRmLzhKNHFG?=
 =?utf-8?B?emhST0lHVStTOUZSN3NkWlZxOHRYK0JwYU52bFYyaEZJOS9UMVhjeUZSbkxN?=
 =?utf-8?B?TUNPM0U2ZnNhbVB1cmw3aG52VVhvcUptQkk0QzQrT1ZqWStic1JpR0Iwdm5D?=
 =?utf-8?B?YjMrbDc1WEpVUGdjSnVsUStqMGRpQ0ZGaTRrUiszUkQ4N1hlZCthemJ3QXdJ?=
 =?utf-8?B?djZsRjBwNGswVFViZEZqYUYydTZ1ejB1YlpaZU96SmJDM29vbDVZWHBQQTNC?=
 =?utf-8?B?Z29DUlVUWU5vU3dqMmtuTUpZemk3ODZKTUtkWWo0THZMK3ZvOE9lY1FnSWZQ?=
 =?utf-8?B?OWw2U2ZRUjh6bThUc2lRczlTQWFtQU1EM1pFWEk0MzNLakRPR3h5S2E2bVd5?=
 =?utf-8?B?MWRTK1plblVWTnNxSEF1VGNJUy9aRVlGblpWR0xVNkNjNVVSSHFtZUptTTMw?=
 =?utf-8?B?SFIwOHpVRGpYancvSkFQd3U5MnE2RGt1V1QzSDRDVGhKcFB1UHVVcjBUZTVl?=
 =?utf-8?B?S2xFejc3c2d5anFlRXIvbk1lOXROWmhMMFBwclhLM0wvcC8vVU5zeWlsY1Rj?=
 =?utf-8?B?SG41YTdPUzdvdE5FSW50SWpKQ0lVeGtCaHhBc29UNmF5dUpRMmFXK0F4Qks4?=
 =?utf-8?B?Zld1T0JqZElFcUFTRU0vTXVFckV6ZjhuUHdBUytBYmRMbE5EQjNHSzdBcTk2?=
 =?utf-8?B?QWNZK2pELzZxTFF0RWJ2Z3oxNmJsbkFlVXNUV01YWkJ4R1JvNHdYc09ISUVy?=
 =?utf-8?B?a0JHNVo2SHNGN3QxY0dhNEFlVm5QcXZibmJvY0JobHFlV0pYZGgrdHUybUgx?=
 =?utf-8?B?VVFLVm5CVStETHlDK3VEOFFtTjAyc0VjcTVJWlVnVEd3VUQydmhvZTNXUVZP?=
 =?utf-8?B?V0NlWXYvUGVudUkzUncrTGRWdFhRR0c2RUFBVTMvL0FJdUdhaDJBRElqelN0?=
 =?utf-8?B?V0o5MmVzYzhLTXVVeDN3b2pZclIwTk51enlJRXlRM1p6K3BZS3A1ellGNmpr?=
 =?utf-8?B?aklNVlY0bmo4OERhMUdoY3AwaEh3TG56OUJLUW4xVjRXaFFYaGhQT3pCQWh5?=
 =?utf-8?B?R0xscXVZVE9qTUZFMHdicU5MWGYzZStoUlZpZXVmaDhSMXI4djhQODcvaHlk?=
 =?utf-8?B?THY0Y2I4bVE0aC9td0wxWWdWVk1wUzIxN1RjTGJQVEJnNlkxc2dzYkRoaGFz?=
 =?utf-8?B?Z0kzd01jVVdRQStEeldPaHFudWVCRVAvaUlSdEVDaUs4Nkd2bWRwWmplY3hH?=
 =?utf-8?B?UmpTTno1T2FnY1JIbXoxRGl6and0L0RFamJzQkN1YWxTZE9qK3dtOTdhQUxw?=
 =?utf-8?B?aHZadzIrRWJkUGd6ZGUxbGdVbHI5VUhkL1YxSGdpS05rdTg0bXI3RVBhOVBR?=
 =?utf-8?B?UHcwcmNYaDNDWDJCQ2dqQyt6QzhxZTIvUW4wZzc0NWtNSk94MnZXNnpwT29t?=
 =?utf-8?B?SFg5QitwR3cyeHdpWjljR01DaXZMVU9LcnpMQjQwMFFVbVZCOTVaazBpVkMy?=
 =?utf-8?B?anM1b1pTdXgwcWFQNXYrY2xFZXBkV3JYeGZTWWZFOGJQQWp2akkvcFk0NHh0?=
 =?utf-8?B?ckl2RVpNZ1RhN3ZlTW5IK1haTXhrb0lJSE96M2wrSEt3L0tVd0dVZDZ6cFd3?=
 =?utf-8?B?bW1wZEE3WmExYVdHVnN2ZXdndmorSDFLamNzblByeHZXR1pSU2NBS2g5V3Mz?=
 =?utf-8?B?OGZnN2dqaHBJeTlEMUhOUWd6bTdHc3JWazBEM05RWjJVSG04QlVRKzRYNll4?=
 =?utf-8?B?cnpkaWJnekZ3V2M1SkRXcHAxeHNndmZwTGY0amN2UTM5aUVxaEJTRzFEQlJ3?=
 =?utf-8?B?dHhxRG95alRQTkVnZGZ0MkxlOE4zZUwyQUdkUkI0cDJRWVF1Yi9nQVgzSUoz?=
 =?utf-8?B?NDJJU0YvMDNKS3NQQUVyU0NIbUE1UHozR2pjYWMxYW9ZZUExTWxKSGowSGpr?=
 =?utf-8?B?ckdwR1RpQWEyOWdpVHU5aFJRQkVFMnI2VVQ4TjVVclNibGMrOVBmRmlrNTdZ?=
 =?utf-8?B?SGRFaUNISXp6RkFFSVdITDNoYzZseGNSNEMyczhmZVRsTmZSTVArYVpMUERS?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eab7c1d-a0f0-4d29-ef14-08de065025a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 09:50:43.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoPjFOO5LxF6XZnlndBnBSllxd39QSvCFp48QAfO39s1w7/jLDge+AMf/CFsFq3Un3a9oCFMYcEWfMMz5GV007KmHJimnpNBcHLQqWfdP88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
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



On 07-10-2025 01:28, Matthew Brost wrote:
> On Mon, Oct 06, 2025 at 08:54:45PM +0530, Satyanarayana K V P wrote:
>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
>> save/restore while this sequence is being programmed, partial writes may
>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
>> instruction to write the sequence atomically.
>>
>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
>> 8 dwords instead of 5 dwords.
>>
>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
>> chunks.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>>
>> ---
>> V3 -> V4:
>> - Fixed review comments. (Wajdeczko)
>> - Fix issues reported by patchworks.
>>
>> V2 -> V3:
>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
>>
>> V1 -> V2:
>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>>    (Auld, Matthew)
>> - Fix issues reported by patchworks.
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++--------
>>   1 file changed, 71 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index c39c3b423d05..b960fdcecd88 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -5,7 +5,9 @@
>>   
>>   #include "xe_migrate.h"
>>   
>> +#include <asm/fpu/api.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/cpufeature.h>
>>   #include <linux/sizes.h>
>>   
>>   #include <drm/drm_managed.h>
>> @@ -644,18 +646,50 @@ static void emit_pte(struct xe_migrate *m,
>>   	}
>>   }
>>   
>> -#define EMIT_COPY_CCS_DW 5
>> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
>> +{
>> +	kernel_fpu_begin();
>> +
>> +#ifdef CONFIG_X86
>> +	if (size == SZ_128) {
>> +		asm("vmovdqu (%0), %%xmm0\n"
>> +		    "vmovups %%xmm0,   (%1)\n"
>> +		    :: "r" (src), "r" (dst) : "memory");
>> +	} else if (size == SZ_256) {
>> +		asm("vmovdqu (%0), %%ymm0\n"
>> +		    "vmovups %%ymm0,   (%1)\n"
>> +		    :: "r" (src), "r" (dst) : "memory");
>> +	}
>> +#endif
>> +	kernel_fpu_end();
> 
> I think you can hide this entire function by #ifdef CONFIG_X86.
Kept the body of function under #ifdef. Otherwise we may compilation 
error when CONFIG_X86 is not defined.>
>> +}
>> +
>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
>> +{
>> +	u32 instr_size = size * BITS_PER_BYTE;
>> +
>> +	xe_assert(gt_to_xe(gt), !(instr_size != SZ_128 && instr_size != SZ_256));
> 
> I think it is slightly more clear to write it like this:
> 
> xe_assert(gt_to_xe(gt), instr_size == SZ_128 || instr_size == SZ_256);
> 
> I suspect Michal would insist on xe_gt_assert here too.
Since CCS save/restore is per device, xe_assert() should hold good.>
>> +
>> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> 
> Should this be VF CCS initialized check rather than generic VF check?
Fixed in new revision.>
>> +		memcpy_vmovdqu(dst, src, instr_size);
>> +	else
>> +		memcpy(dst, src, size);
>> +}
>> +
>> +#define EMIT_COPY_CCS_DW 8
>>   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>   			  u64 dst_ofs, bool dst_is_indirect,
>>   			  u64 src_ofs, bool src_is_indirect,
>>   			  u32 size)
>>   {
>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 *cs = bb->cs + bb->len;
>>   	u32 num_ccs_blks;
>>   	u32 num_pages;
>>   	u32 ccs_copy_size;
>>   	u32 mocs;
>> +	u32 i = 0;
>>   
>>   	if (GRAPHICS_VERx100(xe) >= 2000) {
>>   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>>   	}
>>   
>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> -		ccs_copy_size;
>> -	*cs++ = lower_32_bits(src_ofs);
>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
>> -	*cs++ = lower_32_bits(dst_ofs);
>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> +		  ccs_copy_size;
>> +	dw[i++] = lower_32_bits(src_ofs);
>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
>> +	dw[i++] = lower_32_bits(dst_ofs);
>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>>   
>> +	/*
>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
>> +	 * save/restore while this sequence is being issued, partial writes may trigger
>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
>> +	 * write the sequence atomically.
>> +	 */
>> +	emit_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
> 
> sizeof(dw) to check this consistent with below or change below to match
> the logic here.
Fixed in new revision.>
>> +	cs += EMIT_COPY_CCS_DW;
>>   	bb->len = cs - bb->cs;
>>   }
>>   
>> @@ -993,18 +1035,26 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>>   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>>   }
>>   
>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>> +/*
>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
>> + * save/restore while this sequence is being issued, partial writes may
>> + * trigger page faults when saving iGPU CCS metadata. Use
>> + * emit_atomic() to write the sequence atomically.
>> + */
>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i, u32 flags)
> 
> s/dw/cs ?
Fixed in new revision.>
>>   {
>>   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
>> +	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;
> 
> #define EMIT_FLUSH_INVALIDATE_DW 4 ?
> 
> s/tmp_dw/cs ?
Fixed in new revision.>
>> +
>> +	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>> +		      MI_FLUSH_IMM_DW | flags;
>> +	tmp_dw[j++] = lower_32_bits(addr);
>> +	tmp_dw[j++] = upper_32_bits(addr);
>> +	tmp_dw[j++] = MI_NOOP;
>>   
>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>> -		  MI_FLUSH_IMM_DW | flags;
>> -	dw[i++] = lower_32_bits(addr);
>> -	dw[i++] = upper_32_bits(addr);
>> -	dw[i++] = MI_NOOP;
>> -	dw[i++] = MI_NOOP;
>> +	emit_atomic(q->gt, &dw[i], tmp_dw, sizeof(tmp_dw));
>>   
>> -	return i;
>> +	return i + j;
>>   }
>>   
>>   /**
>> @@ -1049,7 +1099,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	/* Calculate Batch buffer size */
>>   	batch_size = 0;
>>   	while (size) {
>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>> +		batch_size += 8; /* Flush + ggtt addr + 1 NOP */
>>   		u64 ccs_ofs, ccs_size;
>>   		u32 ccs_pt;
>>   
>> @@ -1090,7 +1140,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   	 * sizes here again before copy command is emitted.
>>   	 */
>>   	while (size) {
>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
>> +		batch_size += 8; /* Flush + ggtt addr + 1 NOP */
> 
> EMIT_FLUSH_INVALIDATE_DW * 2 ?
> 
>>   		u32 flush_flags = 0;
>>   		u64 ccs_ofs, ccs_size;
>>   		u32 ccs_pt;
>> @@ -1113,11 +1163,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>   
>>   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>   
>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>>   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>   						  src_L0_ofs, dst_is_pltt,
>>   						  src_L0, ccs_ofs, true);
>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> 
> Side note: I don't think the second emit_flush_invalidate is actually
> necessary here. Removing it is probably out of scope for this series,
> but once this is merged and testing is stable, we can try removing it in
> a follow-up and see what happens.
> 
> Matt
> 
>>   
>>   		size -= src_L0;
>>   	}
>> -- 
>> 2.51.0
>>

