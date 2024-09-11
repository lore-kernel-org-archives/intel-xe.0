Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9855EE01F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 06:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4DE10E187;
	Wed, 11 Sep 2024 06:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzwibVay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FF910E187
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 06:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726035956; x=1757571956;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/5aAVsdgYzgX4TaOGsRKrceOJN55kbDLzhpHxv2ejqo=;
 b=ZzwibVaycvAWThAsa+kZitss5zbg2M+PJm/tMHHbJP+G++k/bfBcs3Zo
 Kvj/axuh4rqYBw/wjyArYDGpzqHuEA92MFBrOAVUbLeA2peJ/ewRfP56B
 CUdLdTJR7KQuRIhRmh24GwcWZ8X0gaoZQK3fmYVXfvzyohyTAjq8KjhPp
 FK/Sk9vArWrZmart+o+jnLUUbOjO3L6Un2A9mOy1AiUiBX4/q99CTQyeJ
 MvaZ2AREF+bb0SFO7vzraP8dEhnA3wD7wEgq4nffLlM02YbKdZhJzsTXY
 Khn1lu1W2re4vwbvc1uaQr+uelZ8r9TxQ/sjXchU/R6D0OsYs4KHeCPug Q==;
X-CSE-ConnectionGUID: Gafo6Fj+RoibHYhBqcjW9w==
X-CSE-MsgGUID: q305p5VxQkScPA+8GwEpOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36170714"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="36170714"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 23:25:56 -0700
X-CSE-ConnectionGUID: gZc+UYRJS+mDsBBYvQURWg==
X-CSE-MsgGUID: kdm/8moOQu2u559jcB9MVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67767474"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 23:25:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:25:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 23:25:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 23:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bg21B+p+XR14t62+qnJzNNJfXFeWD+t2gv5PVBSz+VdzpvDLrq2+tPThIN6udQC/qnFIMwbD9RBa84RmBYMqcDm0FG1vWOf+SxZaAIxAn8ifFpjHy0n5Sr2PSlGXe0/+z033L3Tlg0D8Bgim9O+fL1mFjSuFMQJjN6B+VjmCD9KygyTZxuJlcc6N3ig2vA/oulkVNWS/90QmTMltbs61zw7YNvzk47UZ21olC/3MJwAg9O40olNmD+kj+NapQypo92+uf5yPXmFCmsdpKu3RBUIAoS1NIbzGNUxXBo4PNkagNU+QcumPXRunGM2Xl7w7opcYpvwVJFUvjmTPDpKXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6LYEIjg0V1O4QysKMYyhiAuIozcjVle2h3LR+jQKyk=;
 b=vS6gMGMwGnuXcXkoPwLGY31M73TOh7r1sMXt3Z8oAR94TGZu454MlPZZYdUjucU07XEGfZC3if3pcNM72DkXnJT1HPacROUqzdJYmSkAXxMQOwt8WhOkdkrDeq8vbD3zY1Y+yC7EZaKENGsqg62K0pISWeacNMZ4X6Plz8m9e/tZHj/hz6/Hz7d+o1N46kaNa8cYKVsXJYLyuEvVLME9+fRATFOAhyWj8pdgbDOQt18kdQzv2rQ6ltYufGr9MT9okyN/MDiKvdM9rnIPXwKdkbw5uMo5SK/Llrn4SjSWnKTx7HcJy0BOlnfMhrlpy4/J0l0UDAj7MTVphhkZEz7G7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 11 Sep
 2024 06:25:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 06:25:50 +0000
Message-ID: <72fde079-f58f-48c3-89db-ece07469a790@intel.com>
Date: Wed, 11 Sep 2024 11:55:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not run GPU page fault handler on a closed VM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240911011820.825127-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240911011820.825127-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e13fa5d-b5df-4f3f-b11a-08dcd22a94bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU5tanBrelRLTkEyK2ZDSStsQ25sQm8vNlcyNVNSSXhEbnNmZ1A3Q3prbkM2?=
 =?utf-8?B?QUNHV2d2cmRVRDl0UjRNa2JTVkJzaUovaUVVWmloUWtja1hHUzdSVUNyRGdZ?=
 =?utf-8?B?ckQ2SjdIWHg0KzM3dTNYZHlXRkdpRUZCU3dadE1JZEZOR3ptV1p2bTNsaTRS?=
 =?utf-8?B?alAwcm1DQmRaSnNIblZoU3lZcGZMRU9vYzJBNFlreWFYdXpmZjZUNjhSRzQ4?=
 =?utf-8?B?Z1FOQ1hmL2p6WjhObXN6SVE1NE5sQllSbnJPeitJY2lXUk9HekVROTJ1MmFp?=
 =?utf-8?B?WG5iQ1JPem44aGNDSWxMd3pLUDVJV3Blb2hNVjhMNlp3UUltNnROclFpa1F5?=
 =?utf-8?B?ZTM5RWk2WlQ4MU5IVjNuUU9iTDJuMXZWbUZKRy9IcVNwbm5LMy9OR1p0VTZY?=
 =?utf-8?B?SDN0YURwazRKSUhTSUZ4WURWcVN5ZnhDbUdTZllXK3REcFdpOGROYytMUjhT?=
 =?utf-8?B?RklMZXNaNk9paTUwOHhTT0tkVzZnT2xvM25EOEZTaU95U2F0NjE5RWtOVkdw?=
 =?utf-8?B?YjNtalpGcW5qbTdpMFlwK21iTDdkaU1xdXFZQzQxU3Z5aGt0QkFlRVdsTU5u?=
 =?utf-8?B?RjVMeFJTeFFqZ0tydFBKZngxaEJ3KzFLdU9Gc1NJK0paWVZFZTYyNGs3bTRK?=
 =?utf-8?B?Nkd6a2tJNHVSUzlyZTJnL0lwMTNhWWlsNGNRYWwyOHdzcUt6NEUwTm1oY3Ix?=
 =?utf-8?B?OWdsc2pBeXRsVTRFcFlGdXlEWmI5MXRKZkdobGNZcGoxL1VyeXA5dWRLN05a?=
 =?utf-8?B?aXYyYlpjdUN1ZnJNMk5OUkMwOERLcDZBVTZscCtCeFY4YUl4SXBWQjJvS25K?=
 =?utf-8?B?MGtqNUJtMXBIRjQrYlA1NGxpY1lWbSt6aDFxM082bkE1UVhoUjliQVpPMDdq?=
 =?utf-8?B?RjRoak1EMm03enJSNDhtYlNZajBaNWdnV0g2dVIzSnliT2R5U1NxcllJN3dF?=
 =?utf-8?B?ZXl5NkczNnJ3SFVVeDhGQVRnOUJTNlFlS2ZORzYybzRwczhGYUZDbDdnMTd4?=
 =?utf-8?B?aS8wKzQ3cnBsUGZ5RVJQb2RxeW4vQnhqZC8wM1VYclY1ODdkcWtRU096ZWxJ?=
 =?utf-8?B?UHJqZ3BXYWVOSTJGeFhkcDgvWEZtanNwZWdtcFFwWU5MclRybVJzRHBQdWNq?=
 =?utf-8?B?bFdtamkremR3U3ZTbjdJbFZ6OEdwY3FFcXBZMkxxK2k3NVcxaytST2w1NlNx?=
 =?utf-8?B?R1c3M2FBOVdXNEwrNmQ3aVVGdzI0UE5hVGdOdmVLWHlTLzJPdEo2NWlDV0FY?=
 =?utf-8?B?V29QT0RobkFJOGh4QW9lTTJBYXdNWHhBTCtBUXFENm9vYld1dzN1Z3VjNEhF?=
 =?utf-8?B?ZlZkd3FyMWwyNm8yYnlVbk9FNCtQd2V3ZVBWUHRCMTF6bk5ZZjFvNFVjMWl4?=
 =?utf-8?B?NUtSMzVXdXZvc1QzcnZIamVpMTlrYVB5anV5UkZ6cDFsbCtnNUp6Y0RmZitl?=
 =?utf-8?B?dFk3bGpRSEsxUHpmUklnYUsvUEdnZ1RJTXRNWFVSTm9qazRBMXVST0tSK2w1?=
 =?utf-8?B?YVJxenNCalhsVDBxbTlZWVZaZVB4TWNqUzNnVS9Qcm1sUnI1RlMyejNZVGpz?=
 =?utf-8?B?Vk16a1NRK244enU0WENpeHE4cjZTSWxoWWNJc0diekNTSEt2ZWkyQWRFOFk1?=
 =?utf-8?B?NS91ZzJRRE02NE9CVkcxajI5cHRHMU1FRHRIQ2EzYlZ0V3lFWFdISEY2RE9z?=
 =?utf-8?B?aFVGYVh4bmEvaVFmWmpQU2pSSDFWcW54TXg5V1EzVWRrK09lcG1tTEswUENw?=
 =?utf-8?B?OFBSeWFKTEorMTRmZE13M0lpeFNxeEEvMThBUG84Yi9jNzNqc0pSbVZINjU4?=
 =?utf-8?B?ZmRtSXR2eTE4ZklCcHFnZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnZjSmVxM0tleVR0eHlYS1NzQ0RvLytKUE9zSmlrQmlMSGk2ZkZ4YXpxK0pD?=
 =?utf-8?B?aUtFa1dJb2lLSWp1MzAzdWNHemcvcHhkUXBhMVk1QmR1Y3Rsd2lhK01zdzJD?=
 =?utf-8?B?MHlucm1iU2hoWjA2N3dOc2FqdGNFcFh4RHJManUrS3BuL3VIVUp6TkgwR2RS?=
 =?utf-8?B?UUkrbVJFQjdaSXZoZFgzMWpadFhsenUxS2UvZmFmMjd0OTRhcS9mYzZuQ004?=
 =?utf-8?B?K1liVmNlOWlQVzBpZUtqaU81Wms5aXBWNXRPWHVBdGJEbHN0VWhMRzN1U2dW?=
 =?utf-8?B?amx5djRadmw3Zk1Zb3pFZnNEVEpiTEo1aCtZVzgzM09ic1RpWHRhYjZER3Rq?=
 =?utf-8?B?VnQycC9CWmtJTGs0YXlMNjYwUDVKdk52aFVWK1EyM1J1a2RhNVMrTU5aTzRK?=
 =?utf-8?B?eUF1VUJHR2tna2x4QjRsU1JmdGllandwRGZJZHFVRnRpdHRMbTBSakU4WTlq?=
 =?utf-8?B?clgyK0Y1cHNTd21CUmo5Z1JrQ0Y3S3gyWmhWZ3hoekNBa3dqZHVoYXo0K1RY?=
 =?utf-8?B?UzhEay9CMGQ0Z1N5VCt2OWNBdDlUVXRmNDFsNUVXWHNydys2aGRpS1NwQ2Y0?=
 =?utf-8?B?SkFzN0xuWUJpRU1DSXkrLzNScUJDc1R2T2s5Mk5RWFZWYWhOZEltR0hCMWNJ?=
 =?utf-8?B?eDA3ZkRZVm9SOFQwVWpsZWt5dWdtb1U3aGl4N2ZCUW8xRVpQeWFmVUlYdkJO?=
 =?utf-8?B?eFUxYlR0THJQeEtLQlBQdU1YUWlJdUY4UmYzR2VzZ1pManlVdjNWelM0OU5O?=
 =?utf-8?B?ZlB3K1AzdVRydENlL3AxYjZ2UTVFdHNGL0lnbzgrVU1kbFpobGZVK0ZnQWsy?=
 =?utf-8?B?c1ZhbDViMk1ta0hjMkNiYjRURVNPRURpZVlaS1VlMnB5WXhJWGEyc0Y0eHRU?=
 =?utf-8?B?TG96Q0kzQWRaaUdyRHh5alA1QWE4V3BpZVhLR3V1eWFGWVZEdTFEYjkyc2Zm?=
 =?utf-8?B?aGl5Yk16SUJlc1dqMTNFY05TZVZnNkY2aVRiazg1bWdFVEVwUlM5MEs1QUZj?=
 =?utf-8?B?K2RBMU9xU3FjUS9sUXlBeXdUaXZhdDJRd1JCYVowMDY4Rkg0Y2F6RHNIV3Ax?=
 =?utf-8?B?NjZ0YWtRcEZyVFo4M0NWQ1ZDdTkyMGtERDhCblhKakxhcWVWSWgwWnFkSm5L?=
 =?utf-8?B?YTJYYy85UE5VMGZubTRLVEVydkVUbU1nVGZ5WmZBZkRINkJDQzVjM3FFZmJn?=
 =?utf-8?B?djhmdEdWN2NpVnE4RDFUbUFNaHBzcmZnMTFBVGJpK1loTUNOa1RFTXdiZVBB?=
 =?utf-8?B?WUNFSldZb3hhUUVhU2ZxUE5RRzZxQ3V5NVNoYTdVOGk2RThnV3NLT0VvaEVu?=
 =?utf-8?B?VkQ2bXB4ZWt2MEFDbEpPTllmUHdwUVFrK3NnQUNad3FtR2VFaCtYdjN4SU0v?=
 =?utf-8?B?SUMzV0JZbDVoR2pqamsvaFIrT0lCMit2cmhLdjc0aFdURVpEWU1ZK0ZLbDZF?=
 =?utf-8?B?bTZSaVB1S2RqN29lelNOTlNVeXFHR2h2VHYvclZkZUh3QVg4RkkwOWVmRit6?=
 =?utf-8?B?VkVzMkltSC9lYlZWeG05SDF0OGQ1eWM4YlB3SUFpTkdWT3d1QXM2amx2UVVC?=
 =?utf-8?B?WjRmYktocXBXVzgwY3l2VHU1Z1FBV0oyOURXQkRmZ1YyaHBaL3lvUXJXdGV2?=
 =?utf-8?B?NGdnaWt6aXlrWUE3NWhQU255U2Zod1MzdkJ5ZGtxa2o4WnFIekRoUXp5dGRu?=
 =?utf-8?B?ZFpMOXZhNjhYMFI2bk52N1kyOFZSby8xNFIxTDcwaXBBd3RHdGl6d0ZVWGp1?=
 =?utf-8?B?ZDBCemJ1b29KM2dHK2VDQjl2S3BwdG1Ed2lFZU5ZckRNdGp4ZTVYbWY1UnU5?=
 =?utf-8?B?c0djV283K3U4V1JWZ0RnaWpMQnRKN1NKUUFjb2xQelZMbFR4ZVRRUGxYS0pB?=
 =?utf-8?B?V0FSTklOczJjUmRXTjJMODJLK2hmaUQ2cUh6UEl6dU1LUUYxdVprcVkwcjNm?=
 =?utf-8?B?bzlsci9ZMElBQXlBNjNhTTZTQldpcjEvdGdLOE1NN0ZtcHNlVWErZEdRTSsw?=
 =?utf-8?B?YXNLV09TK2lvNVZ1QWM4dFVScjZUVURBQlpMck9vVTJjNWtSU1NWTFR2Mkds?=
 =?utf-8?B?V2w2djAremJnTFErTU0rR21qSDFzN3lSeGkvSG91N3hUd25pSlRCQko2VW5Y?=
 =?utf-8?B?K0RncmJQOFAxWVYzRTBqcGZQTVlRckpEbzJWV1BRYlJwckpYS2dJT1JPb1Q0?=
 =?utf-8?Q?TAH5u2xLdZQ93NkFI6RVxaA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e13fa5d-b5df-4f3f-b11a-08dcd22a94bf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:25:50.8451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dYCPW5rO0zluhWBS1915mZwI5NA5PM2GaSDCO2H7EQCrsxm+p9FAm8mtOsUrnSiG96UzN+cyZmAa8WuaUqSutJiOyOPbKyaCUxTgKH9LZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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



On 11-09-2024 06:48, Matthew Brost wrote:
> Closing a VM removes page table memory thus we shouldn't touch page
> tables when a VM is closed. Do not run the GPU page fault handler once
> the VM is closed to avoid touching page tables.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 730eec07795e..00af059a8971 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -212,6 +212,12 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	 * TODO: Change to read lock? Using write lock for simplicity.
>   	 */
>   	down_write(&vm->lock);
> +
> +	if (xe_vm_is_closed(vm)) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}


LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> +
>   	vma = lookup_vma(vm, pf->page_addr);
>   	if (!vma) {
>   		err = -EINVAL;
