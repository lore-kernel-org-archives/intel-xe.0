Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF97EBFD16
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 08:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5242F10E371;
	Mon, 13 Apr 2026 08:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gbc9qLdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EA310E371
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 08:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776068260; x=1807604260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FIsPPo0jdn+J4W/vHYY4Yu3tPS4ggK6KLRGYt4KP1aE=;
 b=Gbc9qLdHBTHpG+vQlc/dgsv0nXu+cVs6s1eD7NIGGpRUcR28Z5J15knd
 UoRbNtyjjNfaLGPPct3MEDkN31u+IaIl3P3XIt2kjuFesgclrbdsJF4zE
 QegNyCcAg4hdoj7yRibplX998Q2lya2MHR83hElraRbOQJwPurewDPfR9
 8eXoPd+U+h62CZnkgZUG6IioxezVs1dkWxdEvBeEHcCAVv75BCEDSqU2L
 lNFQ3eDZquZm8AcXkilhhhpPZ+VQcrsSqV9K0cC/8IK1DLXfgCgO/ivH4
 9E071YApTNwUDyJt+HohT2ReE84gyhSQYVz9FCn3OI+0kbUUQmZ9KX44t A==;
X-CSE-ConnectionGUID: 6e61ElkURMOcfBwRuJPIZw==
X-CSE-MsgGUID: +4pGwpd5RT6il9Gd4msPbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="102456646"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="102456646"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:17:40 -0700
X-CSE-ConnectionGUID: 2gsdv/0QRkKtUC4s5O561Q==
X-CSE-MsgGUID: uKhhtsl3TBmX1To6nyQQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="267709590"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:17:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 01:17:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 01:17:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 01:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMpOP21kMecC9roCYrsM0c2rTySsAVTCShOgmYrvAK16o5lVDczNrDHRQMrMc3nC1HembF0/sND07EpDBW0mp+BYqHdfJjx9BCZ3XxH4zYsKPwq1BR6g/vUdagbofPuQb41XWROdJNM/shbzyP8pggOmsDNahIj3Ul8+bAIouuYRdaBpBkcWqOunBdcI9ch2jW/riCiKH0QoLT9uQ2VPtfcMvLbXJDnev6C0F990gFFRo3GVC7viVA3cBhuPYMeN2vk5FYoP/u6+3iW/t/9ZB5cemaHFkDszmOoSaW25ZEHqOp/5UvxVeYLMtfPoHJ2CBYYHORhFD+lpqWfnWnJ8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJK+LwHpuwrjet2MfFK3YHBfOIxOuGNsydB6I61QmXg=;
 b=X0gdNF8td2LI7358VUmlnMz6rbbQpIAw3gdzdJ+B9UxhtJL3awioiUIeV2nwSMTUk+/DZT8YXpmo1sDZlw3TAR4ZXlGNvPFsRKYEe/9OjDPRJBOWaYdVjS9t42HYSy4heW1mRxYH9x3SVlDGSjTr3eujbTtSuhuy30XJuZ62EQIV0BFomJs3ulKooEezFk97zg7WC2sy3pgxdIMpXwz3mzFzhQUT38Je0domSqvoJlUfsC9/zEqD3czbcrdc6FY5lO4lnHeVEMbnvIhU4w9O9XDrhcirVO2YT3vAe4Qsgut5t4anx4PBFJY8ZK6r4QnRcWYvEDIhvi67pc18gu3HoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Mon, 13 Apr 2026 08:17:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 08:17:37 +0000
Message-ID: <2f362330-4f4e-4228-927a-1275d2035ef2@intel.com>
Date: Mon, 13 Apr 2026 13:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-19-riana.tauro@intel.com>
 <adY4x7iYSfs04ufg@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <adY4x7iYSfs04ufg@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: ff675180-a673-4798-fcc5-08de99351f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 5vluPJQ2kFI1YfcWXwjR7EtyUswMrKlMCHdbG+FwwjYXkl0nZDNbNlLf4Zdml+np7GtEA+CnPiMTgGJzv+bPQ1DDNO2BWOiwKkNSvsq2kIppgZYz2ur+mbzlJvzxHEmdAveUunzOCgliFiypFgXH8M89liAwEHJgboP4VcsRYdnCug4RO+BC4AoJObg4mscny7ZvzcJn+TCwOt/aGUlfIezIu2ruHYXwraxBCY6b2Tf+lYMiVUUWYk8tv2ksj1fGXll4Y12NASMd/mqcxREVF8ulE/Vf+XxVSidkv54ZX/KdIyOkvhMRkPR+QojEAXeOZDzEKW3hv5xuLFW4VDyyq1IKP2k9UH1+urDTnWYvDkunL4RDBGwZWVJiTbs51QeV2o+NiWfH++Vc13dUKWUzIFkTpSq6DMkzsNyvYVcNtb5SBADaJWm/s8lr0Fo+pW4RW1SkJMNh+BRHUOCgqPx5CneBJjmfIT+ykPEFH1FTBdSVrec/1TrbB7OPddoPBzYvL6UQwFQR5dWv63aq4br+RGqx+FsiQ5Xxh2V72JJ5P3WAWS2cBocwvMf99kzwKSi+azko62maRU3iosnCp3/FGZLK4NOQ6s+j1I8gbQbFjCn3O5dTaG3IwKbmjqIWlJx2EDYwq/Lp9H9R5rr2tBajlzcZWXzW18fNrZlvaRkKtZCeFqMHrBKfkVAHHgiWf97fzb1QMZmZpsqONPwN4bGWK3/M6hg4Sb69z4W9Stcv2n4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1J1cjU5cTl1cUtDNmtIN25UWXlQU1dRNy9aV1N4TGxJOVJiN3NpOUUwL1R0?=
 =?utf-8?B?ZmdXZlFjMUYreFN1U3dtcmE3eFloQVErUU03TDFqZU9ZOWVPd3lNNzNUU21r?=
 =?utf-8?B?M1FnUE5KeUNkL3pHOWRrYWh1UkdCT0JTdEdTeDU5cjF3OXRVMmo5SW5NRmFS?=
 =?utf-8?B?YTExUk4zRnlPS00wS0VBUTNxTmpOZWRLSFJUU25aWCs3S2JIazF4NTV1R2Qw?=
 =?utf-8?B?SjlyQjVlZ3FlL085Z3JJdWF1ZFpHN2FFdnFCRzM3eVBCOGRjQWFxTHdGQTZZ?=
 =?utf-8?B?Wnk5QnFYK29aL2l2d1pPdW9UWmY0WXRXbms2VzJITjhENjduc2NZb3p4dHBh?=
 =?utf-8?B?ODM5L2ppVGZ4TENxZFI0ZHR0VElXMHYxdWhlSnlweHA2RERWWWxJY2NNMU5t?=
 =?utf-8?B?MVBGR0wwTFBSU2svMHI5WGxXMVRrSEI1a1ZEcWplZUNuZkdxWUhITlQvMTFj?=
 =?utf-8?B?V2tPZTkzVmJ3RnVZOWxFV2VvNGlnbWN5eUpvaE1ZcUN5MDJDMmVMbTR2bVZ2?=
 =?utf-8?B?TDg3a0h6TmdFdmNEQkthalpqSmFLMk1qb01YQUJUb0psbHVMWlFTcEN6WEJ4?=
 =?utf-8?B?aGk4aGlCcmNoaXptQ05CQ3BBeVFsejJXZGJhVHR2bUkwbmR3REdIVnYvZXA3?=
 =?utf-8?B?VjFuZjZmWDFiU1cvSTlPM2llZzBFOHV4TFlDVVl6M1FGVjhJbnY0THJWdjBB?=
 =?utf-8?B?cFZ5c0hUWmEyaCt6OFRzZFlVcGxIaDh5Rlo4dmI3MzB1YlFjSU5yL09HNkov?=
 =?utf-8?B?MDJ6YmZ5NExremF3ckFXa2hMcTBtTTVtQlhaZ0h1Vm42VE84VG9wMXhsQXR4?=
 =?utf-8?B?UjVoYjh3cmRBYkRPWnBaNGl5N01rdXRPVFZKRUdmUVBKYVY5WmNjWS90UTZs?=
 =?utf-8?B?OUtETUVmYlpYS1FLbnFrem53T0I2WjEwMnpXR2w1TU9adjZVR2ZUMVVTYWp6?=
 =?utf-8?B?R1kzUE5wVFJkT1haUzdqYzVRUXhxWHJWR3Q1V2lYdjBjQUdiU1V2anJESWFl?=
 =?utf-8?B?V1FOSFNrSWdZeDZNRmFyQmp0WFozbXpOQTBCZjg0L1VEdXdnaUluaDFmMHNB?=
 =?utf-8?B?dWRqWGVyU2RtOVJENG1qVVIwMzJoMDVkVmFuYWNjblN3MDFTY3BabjE5NjYv?=
 =?utf-8?B?cmVoQ09jT05Ud2lKbnVIT1oxYThHenpGOXZjNFg5cXBicE95aTNVWjk0Zita?=
 =?utf-8?B?QjhyaFoySUJmb2VxYUpYQTR5OEI2ai84QUxjV1YrTTVvK0xjQnNkMjUwelVE?=
 =?utf-8?B?aTcrcUR4OVZwaVN5VDJ5V3c1bzNPdml0Z25Jay9Nbk1QcmNlSTFXYkVsVzRk?=
 =?utf-8?B?d1JuaEU0azBSSVRFSWw1L1ZaUkc5aUF1TnRkYWxVc1lxSmRsTHF6QTdYZS9r?=
 =?utf-8?B?TWd5NmdENHlLMHd3RTVGMHFkdHN0WnZqVW12SjhZSnRlOE1pUVA1K2doR1Av?=
 =?utf-8?B?TXFFQUdVd2pzUFhyaXFDd2t2blZmYmZzanVVWXFyeHpXUE5NcHdMTFJpeEFO?=
 =?utf-8?B?N2Q5eFlTM1RNYmlZNi91RXpSVGN4bzFFR3J3T1QvRFVvWDJzYnZyMGE2Z2dU?=
 =?utf-8?B?ZlA3NWowUU5vR2FYbmMxSVlpdlRQakEvWFJQNEdnQlZhUGRwY3orYnJXQUVX?=
 =?utf-8?B?RTRXRkZiS0FIckExQzc5eGtqMmFpT09MdU13bUNQQnJyTnAzdHZ0cVdFcDhV?=
 =?utf-8?B?bXlKb0R4Mmg3UkJXNTdzSzNXeHlGZGZTa0R2dzF2NkxUNXZhYzZUYUMrN0Uy?=
 =?utf-8?B?anV1elRvaSt6Um5xVWh6NTNQUUVhdmdMZ1dmamJNaTFuVCtDMmZubGd4TW9K?=
 =?utf-8?B?aThReVVUZFJvd1NDOWRya3p6R1V2TXNTUUlackNzK1hLcFkwUlpsTE5TWFV4?=
 =?utf-8?B?b2lmQTUzQmtjb01DNXRjTDZ6YTUwTFNPQVQ2YnRqL0diVWdHUkd5UVY5eTlM?=
 =?utf-8?B?bXhIV3VETkdVQlFSZDVYcmg3QWtFRlQ1Q043ZWlUdFAvMjMxOVFmUGVZMEdm?=
 =?utf-8?B?WjRWMXJrRFp2TkdIUlV1bGJmb0t0YWxKOXl6ZW9ZeDJYbGhzbWhhK0pOSlZF?=
 =?utf-8?B?VHZUZzZDVitUeG8yOWlQbm5teVNzZm5RYjFJdDJkU3F3aTRTMmF2OFN1T2hi?=
 =?utf-8?B?Um4xajlsVGxkNjJFWjU4SURlYm13V2k0NFgySUlIb3hDQ3JOREdIRXNsRmov?=
 =?utf-8?B?ZzRvYWhkYXlFNlFMUGt6akN4b0NmcDk1U1VBVGRkaGRtQlpOQjN4VjlXK0pD?=
 =?utf-8?B?dnRidWtTV0N5cHB1UlBDaERjNmNyRW9nbmwzeFdFazhNNVBXNkRJaVdFN3Uw?=
 =?utf-8?B?aDZQSzZjY2ZGckF3MS9WajNqeHNzK1g4QUQwdStSTjY1ME1pdW5zUT09?=
X-Exchange-RoutingPolicyChecked: trSii/JKmblUoIowCfPf0UXHNHx8ekEP5SHuGfznlBu7DyJhvUjBGmYs2ZdKF/CfJpguyPaHOYB/slWYaRVFc3V+ud7nMrLI2WaCspTEKU+aijiC/2/Khd7GhIMQGqrZH9qjWohCkiv1OFZAVu3kW+qSbi7oBrR89mCfxp5hK0ma5c6z1PV3CKyo3bCz1XsieDABa6oJ9M08TH5rEQtsL+jltafOClS5scdJtPhke+c2MMXnLAyK52S54lUt2gbIYbASxqhKyPgw075cec3ZwKQG+49PkF4OqYNMtmsGx+GnAB8gIGzoHLePCyqJvQfzI5yjgYOTOaeNhovJ3d384A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff675180-a673-4798-fcc5-08de99351f90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:17:37.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPYT8mJsXl24D4IDGCixFSgk8b05uFVmZt5OnFKDJIoOBRZQdq57z0uq4y72HSf/6/QUKQROOd1pROJKzMDgLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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


On 4/8/2026 4:45 PM, Raag Jadav wrote:
> On Thu, Apr 02, 2026 at 12:31:38PM +0530, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error which triggers a engine reset.
>> Return Recovered from PCI error callbacks for these errors.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add newline and fix log
>>      add bounds check (Mallesh)
>>      add ras specific enum (Raag)
>>      helper for sysctrl prepare command
>>      process all errors before deciding recovery action
>>
>> v3: remove TODO from commit message
>>      remove redundant rlen check
>>      fix loop
>>      add check for sysctrl flooding (Raag)
>>      do not use xe_ras prefix for static functions (Soham)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 131 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h       |   3 +
>>   drivers/gpu/drm/xe/xe_ras_types.h |  18 ++++
>>   3 files changed, 152 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 515c28167a69..6542ed4a6a24 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -5,7 +5,16 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device_types.h"
>> +#include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
>> +#define GLOBAL_UNCORR_ERROR			2
>> +/* Modify as needed */
>> +#define XE_SYSCTRL_ERROR_FLOOD			16
>>   
>>   /* Severity classification of detected errors */
>>   enum xe_ras_severity {
>> @@ -61,6 +70,128 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>>   	return comp < XE_RAS_COMPONENT_MAX ? xe_ras_components[comp] : "Unknown";
>>   }
>>   
>> +static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
>> +							 struct xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
>> +	struct xe_ras_error_common common = arr->error_class.common;
>> +	u8 uncorr_type;
>> +
>> +	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
>> +
>> +	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
>> +	       comp_to_str(xe, common.component));
>> +
>> +	/* Request a RESET if error is global */
>> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	/* Local errors are recovered using a engine reset by GuC */
> So do we need to synchronization with GuC before returning?

Currently not necessary.  Once the GuC patch is floated, we can add
if there is a race as part of a different series.

>
>> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
>> +				    u32 cmd_mask, void *request, size_t request_len,
>> +				    void *response, size_t response_len)
>> +{
>> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
>> +	u32 req_hdr;
> With a single member, not sure if it's worth having a local variable.
Sure
>
>> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> Can simply be hdr.data.
>
>> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
>> +
>> +	hdr.data = req_hdr;
> With above in place, this won't be needed.
>
>> +	command->header = hdr;
>> +	command->data_in = request;
>> +	command->data_in_len = request_len;
>> +	command->data_out = response;
>> +	command->data_out_len = response_len;
>> +}
>> +
>> +/**
>> + * xe_ras_process_errors - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: recovery action to be taken
>> + */
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_get_error_response response;
>> +	enum xe_ras_recovery_action final_action;
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	/* Default action */
>> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +
>> +	if (!xe->info.has_sysctrl)
> This looks like should be at the top.
>
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
>> +				&response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +		rlen = 0;
> Is this needed? This is guaranteed to be updated if command succeeds.

Hmm yeah. If it mismatched it will fail else will get re-written
i misread the sysctrl_send_command condition.

>
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +			goto err;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
>> +			       sizeof(response), rlen);
>> +			goto err;
>> +		}
>> +
>> +		for (int i = 0; i < response.num_errors &&  i < XE_RAS_NUM_ERROR_ARR; i++) {
> I know this was my suggestion, but Mallesh later suggested that we fail on
> out of spec behavior, which is not guaranteed here. So we can go back to
> v2 implementation if it makes more sense. I'll leave it to you all.
We can add a warn instead of failing.

Thanks
Riana
>
> Raag
>
>> +			struct xe_ras_error_array arr = response.error_arr[i];
>> +			enum xe_ras_recovery_action action;
>> +			struct xe_ras_error_class error_class;
>> +			u8 component;
>> +
>> +			error_class = arr.error_class;
>> +			component = error_class.common.component;
>> +
>> +			switch (component) {
>> +			case XE_RAS_COMPONENT_CORE_COMPUTE:
>> +				action = handle_compute_errors(xe, &arr);
>> +				break;
>> +			default:
>> +				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
>> +				action = XE_RAS_RECOVERY_ACTION_RESET;
>> +				break;
>> +			}
>> +
>> +			/*
>> +			 * Retain the highest severity action. Process and log all errors
>> +			 * and then take appropriate recovery action.
>> +			 */
>> +			if (action > final_action)
>> +				final_action = action;
>> +		}
>> +
>> +		/* Break if system controller floods responses */
>> +		if (++count > XE_SYSCTRL_ERROR_FLOOD) {
>> +			xe_err(xe, "[RAS]: Sysctrl response flooding\n");
>> +			break;
>> +		}
>> +
>> +	} while (response.additional_errors);
>> +
>> +	return final_action;
>> +
>> +err:
>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 14cb973603e7..e191ab80080c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   
>> +#include "xe_ras_types.h"
>> +
>>   struct xe_device;
>>   
>>   void xe_ras_init(struct xe_device *xe);
>> +enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device *xe);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index ed69654e5bae..e37dd12bffa3 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -11,6 +11,24 @@
>>   #define XE_RAS_NUM_ERROR_ARR		3
>>   #define XE_RAS_MAX_ERROR_DETAILS	16
>>   
>> +/**
>> + * enum xe_ras_recovery_action - RAS recovery actions
>> + *
>> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
>> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
>> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
>> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
>> + *
>> + * This enum defines the possible recovery actions that can be taken in response
>> + * to RAS errors.
>> + */
>> +enum xe_ras_recovery_action {
>> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
>> +	XE_RAS_RECOVERY_ACTION_RESET,
>> +	XE_RAS_RECOVERY_ACTION_DISCONNECT,
>> +	XE_RAS_RECOVERY_ACTION_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Common RAS error class
>>    *
>> -- 
>> 2.47.1
>>
