Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA0CD6E57
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 09:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FAC113E9B;
	Thu,  4 Jun 2026 09:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDOBJLSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1659C113E9B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780566969; x=1812102969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jqOz/gPhu+tJlqWP/a4rXiYta4aLSNy7Fxlf5UvFRBw=;
 b=LDOBJLSNwyNvIjBSeQBpY+FSsNvMi9QTU/Wg4r95hWPoBuk9ICTbzYYE
 QfWUhCsaALTXWJlBHRVnqonNaTnWhjKAudgu7C/CNi/83YvMMgb5K04yN
 ZCUnkVhVRg1C32TTDHPFNV95FYX+LQ3FbaCN+ZnVR+cRf36UGrRotaHJN
 Moz06G/CVJhPAez9bV+3mXNtcXp1FaJ+wittwJXHiueoJytJ8Xs8xJAAa
 A5PO5MnoCL46W8iTWbNC2bJSMfGVcxgeAUZxnR8f12P53HP4QalBe1T63
 vG7j2Nakufa7l0UDaCTPhqSwB9dqV7t5PDc2Akt0rI9yFCBogx4JQjSkO w==;
X-CSE-ConnectionGUID: VgfearcSRwCdwQ+X3Oc2uQ==
X-CSE-MsgGUID: DuV7WJBTQMWq1/KieyEFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="106838355"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="106838355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:56:08 -0700
X-CSE-ConnectionGUID: vjZIpGbbTNiQkpxLQBKfIg==
X-CSE-MsgGUID: BWqjRCd0SW+hmHnT7pfLUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="240041755"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:56:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:56:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 02:56:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ix+1hMIZF2q8fH3GjVgN5/+CB7xYWSv/CKgHh0vjNHWCsbV99Ieluylmp/JA9qhbhumBSGs29XQzm0721YlkKGelAQqlxio2E8TGKZcWrBJ+SD8wLY/X3bwQz2telt8TWtFRArVBc2isLRz8oLsfvPvXNsFVl4odK1LdkRH5ID/E03XeglpnOQaXePgzG6Ar4zU8I3l3na1SfYNRVyt0yVF9zTaLOYKNJ0f+X6ioI0W3dZQPa99jJunYehEgMIAyHG0dAkkvveKzDhpzBGF8am81ZaD3HzSd2xleV3s/KQy43i5XdeXnQJDc9EAd/jL53jwHXTbkIrWVl9LIfdJOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrJxss2lh8vmazqKYzfVhcmvPJ68ZCdAZaYqVlI682A=;
 b=ZBkpFvnryk5hIP2W1HLB99EmUT4tSwDWOquI1w04gHjYD9kUt6dkEoCnHHdkJgceLkvUQFoEe9Z4ZNRXRC6te9LKDcUiT6QOzB46tDt3XoHJm1+xM1mXhPfLmksIb0Di/pgRrvUCYpPPZ4TJ6htsiBomIEsqJJSWO3NIWCpukt+2bYKc5S3Jiguyb5BcMhWTnjm0vbtI+UHMxzHBw8VZoDkLHTDYbZehBXh4yAQobOslyTBI3J5GrEfko5x8+vJDRaHzEQ81+N4vBvFVrcZiKLv9/gmkzWMQYhL2EOLWVKnrHn1ex7Gve2M1UZynkFxYhGNR2eZ9bWopDJ4BrYUb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 09:56:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 09:56:04 +0000
Message-ID: <b73d15e9-100f-463e-b90d-75b8fb39c11c@intel.com>
Date: Thu, 4 Jun 2026 15:25:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/15] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-28-riana.tauro@intel.com>
 <DS0PR11MB871883AF9282F1DA287A2E9981132@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB871883AF9282F1DA287A2E9981132@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca7e393-47a1-48c9-7bd8-08dec21f7dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 0NtWDakzMm514GykJ0CdSUMLCotN+W6CCQwydO34caUQw/IBius9QHIAfn153YlhWvfkBjpO8fnJwLYEdOTACHXVUHPbj2/UWWCN5V3eO1Nwii29m7F9P2xfBDK09n3Tocak1m9Kt8DqUuEMNTsEr/DmVGa7/i4mHx2g6yAVragMNr12+4qVVNklfoBF6YzYfbeu8l7Eb8Htl82hxCwI1k2J8Dgh8aPRWicyUHOkA/Br1bteSmXFooIJoTikyJzoipgitfJg2Y4G4hz1KGO0HrySxKzpQfDW1qpbcrqNWjoKu5TGl26XV5TgzYcczxTRFhVF95pG3TL/LTCDO/YRpl2KIBVr9E5s8gqBzPXJoPSYEQPrbSQ6f9XpudPt6HjPj7TKy5nHLavbA+4fGNKAnQyRSF+Pob2/ERy+ph4Auss7IcLlD/yQKSVlItnQUCAh8nxRb2w4dadxOOedYVYFdFdhtipv4dqIXLTdQQeaIprfMkyxoAOMqQptsmySpNVNYCX6JE6vDGj4FRR9ADliLQAxWeSOdRhspMJ+3I7fDwthBBg7rEUhd3UV1Y2fekDDrl46KEpRA4BS862lEuQKlQ3fidxHA5FQs7BRg+s01xD9sQbO726J7uip9OctbEe3OKAj40HDcYKsopfhEueNfj3RFH8/M5exDS/5ramj+v0nxfbqPqJUwu6jZrSEE+EJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDhCZGNUaGV2MVFnLzBORG10aWpTZzZIRnQzck9qbVl0VDdwU2Z2a29Cc1Zz?=
 =?utf-8?B?V0JIa3VnMjJDeUZjaXRQZHBZeUw1RDdJWlQ1NHFOTVlJMWw5TmxKamFmMkRh?=
 =?utf-8?B?OE43a2U4b01vWkVZOWhDOERyM2EyWVczZFdqL1FtRHJ6L0tvODRvNkpCY2pR?=
 =?utf-8?B?WXc2VXJvTjhwSHNLNVZjRWk0T2dtRUNyQ0N1bytHalZORklqUmpDMGhINmN3?=
 =?utf-8?B?OHcwTnJXQ0MweWVjS0FSSVpnVUdtOFZFMXFqYXd3dC9ycDZnNFpTYU43bTBr?=
 =?utf-8?B?ZXZMa0tiMmhXV3ltM1FKdGdMd2pxY2NVNHVzYkVtcWdVcFc2Zld4SElZL0dP?=
 =?utf-8?B?OHZCVnNpSnQxS3dmZ285ck95cmpLWGcrTE81VVcyQVFuV1ljVzN0N0M3NUhh?=
 =?utf-8?B?aXRlMGNxektYNytRVllRbHRhQVFDa2dMb2cxNVlKWnJrTmtWdjFnMFJMT0xn?=
 =?utf-8?B?WndMemhVdU5xSHlHZU85VTlNVGY5ZHQySTFTeHplTlc5aXVTaHpsVlVDc1dP?=
 =?utf-8?B?UmxLcHRlYUlRdTRzZzZWZndxTUwxUlZXMXpjQ2MzMUtKaHJuZUxFS2dVaG9t?=
 =?utf-8?B?b09DbnJ3NFdYSnpIVW5yWHJFRXVEMHdGbzdYc0did3VvaUloL0hROUxLd25M?=
 =?utf-8?B?Y1grRjlLSDErR0NWek5BMytTYVNBeWZ3WWM5NEtiNXFyT2IrNUIzR2VRb1Ja?=
 =?utf-8?B?U05sYkEvR3RIK0N2d21XOG12OGgvMDdXMHRmaUN4KzE3TjdSZThuV1pIaDdn?=
 =?utf-8?B?OFkzdEREbHNzUXFHbFlTWHFwQnBDRGxCWjhFbEl6RTZBRUNSMk5pTFYvT1JQ?=
 =?utf-8?B?eW1ueXM3aGdyNXk0a2dqYng4TUZKMDNLeXNtWUxkKzFDNHhoZUorcmN4bFE3?=
 =?utf-8?B?LzErMWxJZ2thV05aUGhTNHQ2aDh5QjEvZEtzUFNTMnhkcG50SGFTWjlYRSs4?=
 =?utf-8?B?Q2ZxVjA2S0M0REpYMG5ib3MydlIvdk84NFZxdGVEdTNWZHRvWmQzdWNWQ0V4?=
 =?utf-8?B?QjRMQVQ2cUU2TlFCN0lFWGZMdDBmWkU0WVFGZ0NlZjJtRTlCVnRrVUdLaTNw?=
 =?utf-8?B?SzF6SHFKcks4T1hGZEgzbmFLbm1hdGZQS0E3Q2JWT2l2Y2ZvVlo3b203Um5p?=
 =?utf-8?B?SkpmTW94eU4vbCtOTmVTemMxWXRtZ25jYjVhSEJOeXJmS05SQS9EaktvMlp6?=
 =?utf-8?B?dnNTVDBvcHNHVTFCUXJXczFhQU5CS3A1UDU1Y2pEa25tVmcwekpKSEhrRzNw?=
 =?utf-8?B?dDV1N0ZVcEJBbTE1a3hrMTVxRnRoQ1dYL2Zva1dVZnJmVzk0OVpTV3I0UGZa?=
 =?utf-8?B?OU00cFlib0Q2d2Q5RUI4L251Z2s4QnVMbkR4ZUZ6cmJaK01NcjdKdWRMZnZt?=
 =?utf-8?B?aEZkanNzazJtNjZwVUlpT1lvQzhHYVdFVmI4c004VWJhU2NsQkt1ZUVQYUpu?=
 =?utf-8?B?Ync4UFFiaDFvL3d2QzdTRU5zcTRTYXlJR3MxSWJiZGxIeVBkcW05SFVPbjMz?=
 =?utf-8?B?aXc5RVFCSTI5dzh0UDNIYzJBaDBHSTRFZFg2MUtLKzNyUkdiRittQTI2VGhI?=
 =?utf-8?B?WmNkRHNEcUU4WVd3aEZuRGsyNlJrNjkwWjF0czY5QkJZUHZMSnRLeXlJajJY?=
 =?utf-8?B?dWF6ZzdpQ2tVVjNKTTR6Y2JQZHZFZU04cmQ4TjRvNGZmdHhON0wvM2NvRmxW?=
 =?utf-8?B?aUhLNXhXTjU5TWFXZDJ0WWkvd0tDNEhac0tkalBucHJiWVZIKzVtbzVaMTNz?=
 =?utf-8?B?YS9KckltaVJBU2RGb0VwUGpDenRkYkthMFI2dTIweUJaUklMQkUyOWNOSDdH?=
 =?utf-8?B?aUFPbG9tb3pvUk1takt3NW52eC9BRHJkNEVaMStVUldvZlRGbzhRTU40Z1V3?=
 =?utf-8?B?alRucml4emJpaFdRK05LdUVzUk5ZUTNsbTV4ZTVXcjFPbVRoaDBKU1BiVjQ2?=
 =?utf-8?B?cVJsMjUvSWxuSUxWVERUR25tVWJRdlFCQ29iaWhTN1VkV0JYRHhpSXNzTkxo?=
 =?utf-8?B?L1hRNlBzdXJ0NUhIUWNEczJJVVF2SGZOUStHb0ZqMkxXRGpIOU03NXJoeU9G?=
 =?utf-8?B?ZCtzKzVFWjhLR25hV1dSZ3MzWmlpQzJaWmQxNE1JbFFTYmJjQUZOOEVpWDNZ?=
 =?utf-8?B?bERtWWtOdlVZcURxMnNYWndLb1hicU85VllVNUM3T2dCWmdzdnQreUJNQnpj?=
 =?utf-8?B?QUdxUmtUREVENkpTNGJhWUdUbWt2MG9PanVrZzJyYjJzUHpORzRDTCswYmZq?=
 =?utf-8?B?bnFhZTdNNFp6QU9CVVpaS2tKU1ZvdEcvekV6ekpjYyt1d2pWTG9zUFhRelJP?=
 =?utf-8?B?RjFDZGxqV0ZKODRpenBTd3lQem5wcmM2cTU4YTFCWGE1MG1lenk3QT09?=
X-Exchange-RoutingPolicyChecked: gGB0a7DGKEJGDfHS9hTskC58es/yH25ynwe4TGlzG5hd8T4DtctZF1DFo75AOokZa7hpB0LyJTrLbFR/C0Z404gNGwptRFM00Vs7C2ZbDh5rMbn9Y29bTmFeHeWtD/aZi7LEfP+VCd+8jHRSj10jzB7uawTzZTX/SR6avYCCHq2mh6m2vW7EKRUE/VoaRcSorGmw7vIFs4MAoe4FblLr4ITrNL8DEXUsvQOS1M+flQVD9OMv66uB9teN5rt3jYh8pFX6uv6A6qQ8jwEzGBmikfmEhm6/EvoCdRaqFq6yhjko1WzxKy5DvdqXHU3Yd+DF3XOqpCqW0pQ7uZW9BIlF0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca7e393-47a1-48c9-7bd8-08dec21f7dc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:56:04.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+37BSy+lPc5D5Db5JJJ6mNQxgT2r0BKXfpKQNtLCj6jOgUDU93RFlyVzjsbslRLtphoVBJUVbvGCvn44LwsEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
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


On 6/3/2026 7:54 PM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 25 May 2026 15:37
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v6 11/15] drm/xe/xe_ras: Add support to query page offline
>> queue and list
>>
>> Add support to query page offline list and queue from firmware during
>> module load. The page offline list command retrieves pages that are already
>> offlined by the firmware. The page offline queue command retrieves the pages
>> pending to be offlined by the firmware.
>> processing pages is done in a later patch.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: fix commit message
>>      fix log (Tejas)
>>
>> v3: move sysctrl prepare command to sysctrl layer (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>>   3 files changed, 124 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> fb6da3d06b9a..1710c6080554 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -146,6 +146,88 @@ static enum xe_ras_recovery_action
>> handle_device_memory_errors(struct xe_device
>>   	return XE_RAS_RECOVERY_ACTION_RESET;
>>   }
>>
>> +static void get_queued_pages(struct xe_device *xe) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_queue response = {0};
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE,
>> +				 NULL, 0, &response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "sysctrl: failed to get page offline queue
>> %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "sysctrl: unexpected page offline queue
>> response length %zu (expected %zu)\n",
>> +			       rlen, sizeof(response));
>> +			return;
>> +		}
>> +
>> +		/* TODO: Process pages and offline them */
>> +
>> +		count += response.pages_returned;
> If this returns 0, wont it be a problem. Also should you have some cap on max iteration say 100 or something, just in case it got stuck in loop?

There is a additonal_data check. So if by any chance we have empty 
structure then this should also be set to 0.
For the limit we would have to get the number of pages. We cannot add 
max cap to 100 because there can be
pages above that.

We could however break if it's 0.

Riana

>
> Tejas
>> +		if (count > response.total_pages) {
>> +			xe_err(xe, "sysctrl: Pages returned from queue exceed
>> total pages %u, returned %u\n",
>> +			       response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>> +static void get_offlined_list(struct xe_device *xe) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_list response = {0};
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>> +				 NULL, 0, &response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "sysctrl: failed to get page offline list %d\n",
>> ret);
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "sysctrl: unexpected page offline list
>> response length %zu (expected %zu)\n",
>> +			       rlen, sizeof(response));
>> +			return;
>> +		}
>> +
>> +		/* TODO: Process pages and offline them */
>> +
>> +		count += response.pages_returned;
>> +		if (count > response.total_pages) {
>> +			xe_err(xe, "sysctrl: Pages returned from list exceed
>> total pages %u, returned %u\n",
>> +			       response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response
>> *response)  { @@ -341,4 +423,7 @@ void xe_ras_init(struct xe_device *xe)
>> #ifdef CONFIG_PCIEAER
>>   	aer_unmask_and_downgrade_internal_error(xe);
>>   #endif
>> +
>> +	get_queued_pages(xe);
>> +	get_offlined_list(xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 8c2d13152b32..fada9802667e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -12,6 +12,7 @@
>>   #define XE_RAS_NUM_COUNTERS			16
>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>   #define XE_RAS_MEMORY_ECC			BIT(1)
>> +#define XE_RAS_NUM_PAGES			25
>>
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions @@ -192,4 +193,38
>> @@ struct xe_ras_memory_error {
>>   	/** @reserved1: Reserved */
>>   	u32 reserved1[10];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_list - Response from get offline list
>> +command  */ struct xe_ras_page_offline_list {
>> +	/** @max_entries: Total no of pages that can be stored in flash */
>> +	u32 max_entries;
>> +	/** @total_pages: Total number of permanently offlined pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of permanently offlined page addresses
>> (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_queue - Response from get offline queue
>> +command  */ struct xe_ras_page_offline_queue {
>> +	/** @total_pages: Total number of queued pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of page addresses (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 5ccfc6325a90..b7a5e82c6eb0 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -24,10 +24,14 @@ enum xe_sysctrl_group {
>>    *
>>    * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
>> + pages from flash
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
>> queued
>> + pages from firmware
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>   };
>>
>>   /**
>> --
>> 2.47.1
