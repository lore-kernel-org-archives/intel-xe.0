Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F14C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D56E10E22C;
	Tue, 18 Jun 2024 17:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEVz+OAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8B010E22C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718733564; x=1750269564;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h1BWY3CMlMtw+etrbZmn32uKzRJEedQA/WQqBa7i/HY=;
 b=bEVz+OAvh2s7hSuBLfjo3NGHkTYuTyYjRvnRw3UoyFTBa0oOH/r+y1aP
 02CiHdYiUx+smRpDTyIl7LD4bIF2Ox3nSBE4plxjQGGcsFJFEcwJ4s3vX
 P/b3gdMRKiL67FLyYyrWdyrdLbdNsWTTKz+kbmxke3te0ftG4Rp9GVCqs
 JMZq8HnTafuZJ/m2mQCrzqekwJSrWQJa3EFX/3ShBVPUSjD4ONKlWdbf/
 FXOyYjz1Nc8lJnnzlgFiyqd1KoIaHNgwg/LS+s+2EBwBGdQYrTLb8/9gl
 OPQYBUd1Op3DFiWsRT+k0YYk87s/BC5PDD1sJl0BGdpyoVd9U/u+MPUBR Q==;
X-CSE-ConnectionGUID: SK10iLtnTySfMeK1mSwCHw==
X-CSE-MsgGUID: 0zun8tSuTBaxT38qhW7P0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19503534"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19503534"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:59:23 -0700
X-CSE-ConnectionGUID: 85DXJCJVS+q0BeqEmfZCmQ==
X-CSE-MsgGUID: +bwxq2jtTmSUr17ufqLCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46763739"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 10:59:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 10:59:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 10:59:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 10:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEKkPYH6DPdA9BFBltCxbF3CPQQwxL+I+hp9FYYn9uS1+EcVJYA/td5NXPswe8rkUeQ8FGkIyB9gLVTx6oZq9aIjGXSd810C3x4V8l+fcvjRlsiIxo1hJj4Ut1RHS8BObsVAR7D3S8SFyxAYhbiZ+TI5bJ8L9OX3qY1F772GEUVbf3gi1SSumLFq54OgvucwPsYP7E1PuaUHd5K3e8W1Y8MyM90fvEI88yy+7AC81GT0NRKW3WJ0Kwb3e+RKae8LZR64c7gCV/0zCMFZG5lB2aeBEYZocbp5EG8jryBUxFfI2zEppKGoHTssI0YEkEH+/WQd7YoB92rh7DZzu18IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nlrvw71Gj7WqnA44sYIHsJhuHFR6yACidvjiuaQfp+8=;
 b=fGhSYbeIlcbsn3bejsBZ+GuAiBLkfGzEy1qQiXP3yWLWTA0U2Uxdob/LYKVgEMRW0BDc+p4zEpVn2TooZp3G1YHfLYPn17KP9Bf8oU9FT+B9VYzJ5d54p0g4HYDIuArYvWVQAO1n/8ctr1B+T/BT/TB22JQHuH4gHHA8G0I5dEIqjUF9CnKo0s+hcEVfcnDkaAwisrnuQdCNatTd2lDeFLeUVgMsinQ48AKefMarn7kPxyEpdP6wSxy3vaX9S5xWh4Shy380b9oItl4W33gKX71ETKK72xkOOyWsM0N7FQlnhyMMNu6M47TdP4+yi4O+TKbUUyVblMDUt7hX6GDnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 17:59:20 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 17:59:20 +0000
Message-ID: <75cdfb6b-c38d-4156-982a-73438fd1b13f@intel.com>
Date: Tue, 18 Jun 2024 10:59:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Simplify locking in new_vma
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240618003859.3239239-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240618003859.3239239-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::19) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: d67389d2-fdd8-4d8c-fc17-08dc8fc060dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2l6cWErZ1l5d3kzR254TXlIV2ppaDE2RVhLaVhIcEdNZlBDY2lGR2tKUE5x?=
 =?utf-8?B?c2ViOWVDQmJyaEkzZ2MxS2pncFBnZEFucVA2VURjVCtoRlR5WldwOFZGR3dn?=
 =?utf-8?B?UXQ0QkwwS2xheHplSEdOaVZYSGQ5OE94OVZvOVUrNzFvTFZJQVRzbGRpTHJw?=
 =?utf-8?B?Y0lrbktwU3cwK0Q1alhybTAzYU9wRy92ZEZTeUxqdVR5bGxoUFVSYWhyWlZ5?=
 =?utf-8?B?NWw4cVV1cDUrd2dsVVhjenJNa1BDWFVSU1lPVURMTXpWSWUvK0g4KzJ4WWU2?=
 =?utf-8?B?dUJ0R2xUdnFiamdESG9KSzRzd3ZHVDduQkZhSjhuSTVwNmVpSHduVXBUeHEx?=
 =?utf-8?B?bVV5Yi9yOGJBem5sTDRPZ0hYaDlHekZ2WlZpRlBRSlFoRUlhWW11QXp2WG1J?=
 =?utf-8?B?Y1dyMnhzN2d2SzJMaW9CTzArRVdrRlA4SjE0OSs2ajdJL3JJYkl0UXhZdVZx?=
 =?utf-8?B?R2lyVjNTd2c0SStwY3RudWU4NlliVlRtOWxmS042K2xtazNFaWRQU1hRMzd0?=
 =?utf-8?B?M0o4RkJ0UFlKUm9KcEdoVGl5ancrL01mRlplNUROVkd1UGR1MWUrbnRvZjNG?=
 =?utf-8?B?WGFlL2hNS3hSU0JBcUZWWXI3U1BXVnUyM09PdmRuVDFRUTIyUFFRS3F3YllS?=
 =?utf-8?B?Q2VWL01zbFlMWXBnNGxSaUE0dWZoQXlvV01rRFZKQ0MxcDVUMXJOWEdkQkxJ?=
 =?utf-8?B?MGgxVWpNbkg4S0NXdG9nbWxJeDBIeFM0RkVNYmRQeFRxd3l2U0hldU5QbXpE?=
 =?utf-8?B?UFQvcGtPVkkvS3hUc2JNbEc5MkZ2UGlLWDVETWdtcnV2bXluVWtRRGhGbE1X?=
 =?utf-8?B?WjZHRmk0Ulp4M0lGQlZ3RDIzQm9GbGw5TFdmNEpHWEp0T21wWnVSZkQwRysx?=
 =?utf-8?B?aEUxenlWanQxUlA4WUo4Nm13SlprZ2kvaEZqNmNMZVRYNU5BL0dERkN2eklB?=
 =?utf-8?B?YThIY3NzUVVNMnlJZnZGSnA0S3JXSzFjNFE4NzRGUU8rdnQ2VUhVOHMyLzFs?=
 =?utf-8?B?K200YmYrS1JMVmhHeTdwZTB1QU9PSWhkUW1RNm5MckRYK2gxZVA2WHlSb0Vr?=
 =?utf-8?B?eTlmT2NSY2duSUthck1VNmhOMmZIbXpYSFhkZkFxcmFWZmJzKzRYVUhHRThp?=
 =?utf-8?B?S0J5SEdHVm1LczJUU1ByNDRkUzRYRk5ub2V3K1p1ZWRORDN1QXBod1llTXAw?=
 =?utf-8?B?bTU4TTFmaGhSVkRUUTJRMEJzZW9GQkMxb01pYTZPanJyVkk0eU1UK2FUd0xI?=
 =?utf-8?B?alZMcFN3RFB5SHd4cnZNem9PVW9CbWdIYW43UmlPOHhnVUNGYzlxdUlNUVkz?=
 =?utf-8?B?SkVjZ1RTNVRFdTBJRUNuQldxTHhhRlRqVVV4c1Q0Q2RNU1I2bFg1ZFVMQWdC?=
 =?utf-8?B?S2xwSEprNTdRaHJrSHBsMmpKTklyZHFPTE5hSnhxdDkyZnpCWmx3RU4zRzBl?=
 =?utf-8?B?L24weWJwNWtaUEpGZlFwNnlQajdha1JrMXRKM3hNWDMrUFVZWGY2NlE4S3Fh?=
 =?utf-8?B?YUpEczZ1V0VCZVRYTWRpMEdpVTlheUp6amorTlZRa2t6MWk2YWxXdTdmbHo5?=
 =?utf-8?B?RGw1Z3Y5K2JVb0pUMFE5WlpFblVCNDE4M3ZHZXk4WGE3emRsUTVtSE1lZmZo?=
 =?utf-8?B?dkhOTEdiUWhMcTkxTmtUSWtVQXQ0ckMwV0p3RnFCelBGL3plMUNrV0IwVTgz?=
 =?utf-8?B?VWFoejNvODlnZ0ZsWTV3bkdkZmZhZVhwYi9sMGRFZ0NoT0ZsZ05yU0IvbGln?=
 =?utf-8?Q?6nUfg/bWJKedwlT/lc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJkV3p0MkxhcWtuOVdPM3UvSEFuWjN1eDRrRGpCeC9qOE12Z0xSYlRiMWZ6?=
 =?utf-8?B?Kzg4SUU5ckJObXhqQVhHWHNIV01MSHRWTmZ3ajY0c1NNb2QrNXlsVXBqZXd4?=
 =?utf-8?B?TExwdXdwOVB3MldCeEE2U2VMQjQyV2JRSzltY3ZFR1pnc1JnQmR3R2Qwcjg2?=
 =?utf-8?B?VGRDN2xrZ0JKYjc1Q216aUx1NXkxR0hTL0tObU9BNlVvMWVPRW15dlRqZGF3?=
 =?utf-8?B?Rk5TakNtYkpqOFdrWWt4Qk1iejl0Yy94ZGtwdTRjVTk3Q2VmZVFMZW5GVUtF?=
 =?utf-8?B?RlBmbTFranRNQjY3b1daODJQQlRUR2lwQnJEVWxXa21zNVFCem1WSm9BSGln?=
 =?utf-8?B?YzVjbEpiMXRIZ1RsMVdPb1dxaW1sbkoydG8wRVdkUUxPcUk3VWJ0SjhwV2FS?=
 =?utf-8?B?TFEzMnBGa2M2Z2k3dlVlWTVHNkUwa29JNFFZbXpWYjJrWlRyeWR0NURVTFZk?=
 =?utf-8?B?NmpFKzBKb1hFallUS3pGYTBneExTNXoyYnErV1BhRExaRTZQaGt5bnVMU0pH?=
 =?utf-8?B?bkQxdVZ1ejBIQ25jOURFWlBxeDlYbVVjc3I2TzV5L0hudTZkMHdTWVVVQ2FD?=
 =?utf-8?B?MFFDMURnaEZLRWFZbE8wM2dZZzhQNzdrVmFQbDBWOHlubUlFdTRnbDJ2bnlp?=
 =?utf-8?B?cGZGZzlwTXhjMERRZkJMQi91QTN3ejhZQXRuVnkvWWJ5ZU8ybVd2Sy9PNlVy?=
 =?utf-8?B?UmRqL29Ob0diRUJibmVXclZod3U2VXlxcThzQzhTdUdnNU9hUncwWWpKS29U?=
 =?utf-8?B?aXZ0S3JCdzByVDdzbEFoVkp1RXJaMGNhdUtId0ZxWmYzRlp1YmxJSHNiVVBZ?=
 =?utf-8?B?OXBrN01vN1BiS05oeHhpVWJUMEUxS0twSFZ6SnhuT3ZHMWpNb0IwVmc0Tkc0?=
 =?utf-8?B?VHFSVzdJbVBvS0Jha1ZLRk5pZUR1Yy9Xa21KL3VrcG0xK21tNUQ5VEVRSStm?=
 =?utf-8?B?ZDJ3bHBKV3pEYy84SDgrdWdLcWZGc1k5UE16YzhFYUc3b2Z5aURPNVhuM2pv?=
 =?utf-8?B?RFBTUjVkVXRNV3IvVkpGajdHS05TN2dQdWt3VzkxWko3RVBDUTJLQzlpbnBh?=
 =?utf-8?B?ZGc1cEhNdUhocDNqVDNPK0dRMW9yZ2ordU5iVVQwS3JsQlEzdGE4RlBMZjBJ?=
 =?utf-8?B?TkF0bFVocUNHVFlSVlFWVXRBekM1MHFUcEpJdlIzaC9XZjllV1BrNDQzdHdQ?=
 =?utf-8?B?YjdjcGV1UUJ5MUJpRDFVZVhwbWNaRFY2STlJdVdreEtVL29lTVBOTGNPdE85?=
 =?utf-8?B?VGYwS3RNNVYvVFA1VVVqczRUdW1qU1pFUk8yV2Q5V3lySVdZYUp4U0piVGZo?=
 =?utf-8?B?ci9ad0tTWWcwYkhQaE52Z2VQZ2NnNmpjZnJFREcyUytWRGRNcVhQeFZpMU1O?=
 =?utf-8?B?WnZ3ZDlJbDMvNlJKTHQ3Rm9XcStSZ2dRbmo5NmlDNEZyYXB3OUFheFNSSXJ2?=
 =?utf-8?B?VzFjQnFCeUZiUldBN2NkSUJ4anVSUWtmWG5LREplWHU5cjNMT2xaaldDYnpV?=
 =?utf-8?B?eVZPMXVVV2xQZ0EzU25OZ3VnVTFGQWJZT1hBb2tNTFhhRWh4dXdCWVV1WWVY?=
 =?utf-8?B?OVpFenYrUDZZQk9FU2V6emErTTFoYTVjTlhpOEZ3NDkyQ0YyamJpOG40UWVW?=
 =?utf-8?B?a2FOYUZwVkh6aVdYVnRhVkVQNzhoeWNPSlRTV0ExZ3pjemk2RFozM1dhdkVN?=
 =?utf-8?B?QVR6akFIS2VleTRadEgvUUk0cUJGWmxjdG8rVUlSSENaL1VYQXl4eTdJY01t?=
 =?utf-8?B?Tm9KSm5XZ3JqWTArNUExN0hvcG9SK2xmTTI0WFNWTzRjU2UzR2NhSStXUGI2?=
 =?utf-8?B?U1R3dWRxOXFKVE8yV1dkSmpEQzY4NGVhVHFNSXowTmFJd2tTRXpoMmNibHpm?=
 =?utf-8?B?dWgwQXVwZm9zWGQxb1YzWm52aitDaVc5R3lBclJYTUZBZGNPa0ZRMkVHVW9J?=
 =?utf-8?B?SHl6Nmg2R0pnVFV4NXRTY05ISGp0SWZUMEtZdFp5UUU3YkFXZFhRVzEzMXE1?=
 =?utf-8?B?UEFSMHdWUDBYK0lVQU9wVVJVTk9JMXpFK1ZGeUpkamRMNkptMUUycG1uYkNG?=
 =?utf-8?B?VTh4ZG1qWHBtZ1FRZFphajRhQnJpdXB6aU41bHlzSVJLTW9reVBDS2p1S2xS?=
 =?utf-8?B?Z3dXbTJ0TGpYRU5TRlpaVGpqMmNDTVFDQ3FURGZuZXFLQ3RLZzVxamdCVTc1?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d67389d2-fdd8-4d8c-fc17-08dc8fc060dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 17:59:20.2532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrcYSm2fgeKH9sfrUcOlDZFS9O4OCGNqVeAjDPw/fWED6uGIRMKzP+n8xhR7dXAJP0ggaXPKJ5yO3Fd3uYacOmKKBPGQkV+9yACFPsSx0Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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


On 6/17/2024 5:38 PM, Matthew Brost wrote:
> Rather than acquiring and dropping the VM / BO dma-resv around
> xe_vma_create and do the same thing upon adding preempt fences or an
> error, hold these locks through the entire new_vma() function.
>
> v2:
>   - Rebase (CI)
>
> Cc: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 41 +++++++++++++++++---------------------
>   1 file changed, 18 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 61d4d95a5377..5b166fa03684 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -180,16 +180,14 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>   	struct xe_exec_queue *q;
>   	int err;
>   
> +	xe_bo_assert_held(bo);
> +
>   	if (!vm->preempt.num_exec_queues)
>   		return 0;
>   
> -	err = xe_bo_lock(bo, true);
> -	if (err)
> -		return err;
> -
>   	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
>   	if (err)
> -		goto out_unlock;
> +		return err;
>   
>   	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
>   		if (q->lr.pfence) {
> @@ -198,9 +196,7 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>   					   DMA_RESV_USAGE_BOOKKEEP);
>   		}
>   
> -out_unlock:
> -	xe_bo_unlock(bo);
> -	return err;
> +	return 0;
>   }
>   
>   static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
> @@ -2140,7 +2136,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>   	struct drm_exec exec;
>   	struct xe_vma *vma;
> -	int err;
> +	int err = 0;
>   
>   	lockdep_assert_held_write(&vm->lock);
>   
> @@ -2165,23 +2161,22 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   	vma = xe_vma_create(vm, bo, op->gem.offset,
>   			    op->va.addr, op->va.addr +
>   			    op->va.range - 1, pat_index, flags);
> -	if (bo)
> -		drm_exec_fini(&exec);
> +	if (IS_ERR(vma))
> +		goto err_unlock;
>   
> -	if (xe_vma_is_userptr(vma)) {
> +	if (xe_vma_is_userptr(vma))
>   		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> -		if (err) {
> -			prep_vma_destroy(vm, vma, false);
> -			xe_vma_destroy_unlocked(vma);
> -			return ERR_PTR(err);
> -		}
> -	} else if (!xe_vma_has_no_bo(vma) && !bo->vm) {
> +	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
>   		err = add_preempt_fences(vm, bo);
> -		if (err) {
> -			prep_vma_destroy(vm, vma, false);
> -			xe_vma_destroy_unlocked(vma);
> -			return ERR_PTR(err);
> -		}
> +
> +err_unlock:
> +	if (bo)
> +		drm_exec_fini(&exec);
> +
> +	if (err) {
> +		prep_vma_destroy(vm, vma, false);
> +		xe_vma_destroy_unlocked(vma);
> +		vma = ERR_PTR(err);
>   	}
>   
>   	return vma;
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
