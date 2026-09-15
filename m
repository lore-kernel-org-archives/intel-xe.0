Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31129C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 14:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1010E368;
	Tue, 15 Sep 2026 14:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4Jx0Lz1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6898910E368
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789482803; x=1821018803;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p0nx4OqyABCYOHzS0C8gX8yxN7ZUGxU/ZyV+BSALks4=;
 b=L4Jx0Lz1MEgLrbi/POqZkSaQO15ky4IOc3HU7rSMw8mUA2iplOhG9KGf
 yaQA39TCYnN4IJ1Kc4Gzr1cEg5huZHlsoPrIwHwydwcPosyzFpl0qwtr+
 apdpqs8fTNsCKYNN8ZPPUfdJvvDSoEPYKW7WRNPFoVtoAJc5FczoGJ2bt
 j62rDi0Y9Ide6jWbY7Hap1YszWFSSfHYva7BXI7IhCBWu3DN4WPZlFwN9
 j+tS/g6Liw7gI34H3F/CIbk4/kYi9uFzRseXdVSafeB3sI2ntraICvohs
 uDahrU2CtWl010qksD3mLvpFP+1k+LzifHPBRngwwORsqvIu9PTN6t011 g==;
X-CSE-ConnectionGUID: C09YMqpIT1Gy7U7oWDDvKQ==
X-CSE-MsgGUID: IpnZjbhpRWmrwSLJQYiytQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89691057"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89691057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 07:33:15 -0700
X-CSE-ConnectionGUID: B38+hJc1SYug4Ya9k0foig==
X-CSE-MsgGUID: i5BCWt8QS92lVR3dUVAv6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="274978528"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 07:33:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 07:33:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 07:33:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 07:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsQ5aqavokd438MWRr9Y3PtEueKr4/CQP6oNKzo+t7dTFrk37+40PN7BD0Qxf/QwM+NxpwOPzAycvYzHuKUiSvvVugDEKCd4qtcwj1B3jFHlJ2dhFmf2n475OQo26szjOfFsVi9Q0KVIh9ExPqTSEarLmaEd3oc1NsZJWDPQx3NEv7Sa0XtHpZOHrU4QkfEhoNu3QXTUmWNqqxoXena6P7yW7B9eHAv95UQwE3sbkdYYWUj77imt8QC6NC5C7iF5rpdomSXFvqyZJMTLFjIUBx4kYD9Zz9JOxa8EEu8boKJkuT7J0AILtlz3wkEWKF+4Ya/1qidcJHvTM39vx2rGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdo7c/47wDeiYufc/03tvaD8IlZlaTHmFKYNDyemVjk=;
 b=V3nBzQJo2e0opHQ2QQqVRlpJPOK60cBdpKoRqWcI/V/Bg+v/zMB9hKsDwYR4g++K40cEAJTuF0fZS7uccjicORGMYdw/JuvfeYE4jFNm030wAmfymxMB+wsXPAy+7l/EyAmCsRKH/OA06RWTrECpxPdYFQwTQ4xhXknoi4HRbhCotpITMQg77Jtmq74K5TewZIp/hREHxyH2R7hcRdS0tAVvQb+npIETHRzxW9VmKcIvO30EvIoMAl5wUJeIIeIa6WIGizFwR1DoSuUMnZNh1UtSgFJQjDtkV350r0afwy+e9aP9oRcZ4t07UGJZnRfwWnCCl3rPOiI3zJ9SJmALVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:33:10 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:33:09 +0000
Message-ID: <3121b9f4-476f-4735-a1d4-ae6f419c82d7@intel.com>
Date: Tue, 15 Sep 2026 16:33:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] drm/xe/tests: Add KUnit tests for VF
 provisioning error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
 <20260915071159.51402-22-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260915071159.51402-22-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0182.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b18639c-e9e6-47ca-5ec8-08df133643e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 9hnbO0YFlxCFk7roW6H7QsjAG1woq8579lS6N0FvcVmwTty5UqkN8qRAfEF2eisegdsA4hoKsVmf0TLA/FFHwg2tGtBFPLIgIororDDQmGGlTl7tQFx4TqGvAMCoWepuTGX6A28Mrg1nLaqAEmlviHRE+5CbU27Vj7mzBsXypInb9b03wphA7Mn0RZSdm900CvKOACQOa/lNOPgRROxIx27GAEFiFFfEwa56eDqF4u39olPabHZ58+11QPj1KszbnrgtIg0w6pqPdNzz1cnS7zPMKlQHhntvbU87nT8vRSFIm2V12aOPbTxI3gxGZpFU9DhlsEY0NmzWYJtCiJCxfRvej0+SwOSN0G1+2dz3oPiSvtHeYVw+LIMx0OW+jITvcWHLKzZioqHKuCk84gvoOlOqg1gXaOuEwRgU53M4nTcDWe7z+uyzAuuQn2BbLN8tSOMS5odXLNvB5Be6NCGEEiWRL5QPh+1ec6yl7BpoGEzCDabeZBsLADE7wGZNVNjk5qEFu+Bwjqg0Dnlmnzti5a9731bPBFDDwS1RpUR7DBsB9rvKoEfbdEp1X++n9nXrbrgE4B9Crj4ueLi9HtzesFpJPkxs2uYX3QYK+yhSJaMR4wUn2eR1ocvTb7g+RtKI1JY7rQHjvDWB9KXzTnJdzUX6AjTS8TQ2Tzk2+uhfE6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhBSFIyd2ZTd2ZVb3RsVUZPM1hnZFR6dlo1YTY4cGlDMnhuQ2RBL3dTd1VH?=
 =?utf-8?B?Nk0xSjRVeXREYU5ocDZwWWMxQ1hHNnk5UWJuN0hOTlFzWDZKdlc1SjdrTkdq?=
 =?utf-8?B?MFl3dXh1SE9BcDBZb2J0bldRS3MxRU1WUU1EWHh4TU1hb2tUMHNsQ0NndkNT?=
 =?utf-8?B?YUQyZmhTVUpCcUZ2Vno3ZFhRZERZN2F3ZEZJRkJvbzFzNkFZTkV1QU0yMEcz?=
 =?utf-8?B?U0lFWXVHQmVBaHgvZVNtTUJUQktiZ3cyaFhZcXF2ai8rY2VSSys3NVhOb29F?=
 =?utf-8?B?MGhVQ3BQMzdyOHBpcm1JUjV6R0pkaVdvVkk2MlRBUkNHZGdvY3dZR3NVc1N5?=
 =?utf-8?B?bHRJTENsTW84U3VLTVZhS2tRcmk3NlFOTTJnNFFscmJndnBad2N1R2FkNHlz?=
 =?utf-8?B?RmdBTzUvaUhRYWxNL1FkdTBqd3dFejRNdThXQkVZb2lvQTFJU2UvT3JoTVhG?=
 =?utf-8?B?bDJEdHhGcFd0OTFiUlpRY2hHaXBobFEwcmFNYTRnY0NxZGhxeENHVXorYU8z?=
 =?utf-8?B?dUZsOGJrNENLNm9YaW9zaFY2eGNENitPZ3RQOVdZdEZiQTB5akNnSG9jeHJ4?=
 =?utf-8?B?bm5pRmVIaXNOS2ZTN1JNeUgvVEhISW03RENXbEFieGdhUUk5VmRuaHVIRktq?=
 =?utf-8?B?Y1huSDQ0YVJpRnp4ek1ab1p1MDJ3N3FuajRnWnZ6NlZHeVJ3NUY0aFVhbXhq?=
 =?utf-8?B?SWluNldIcUFDaU9zNExTaW40MFhhU01SSk5KZFEyRHdEeklNdkdDZ1ZVU0xm?=
 =?utf-8?B?a3lwdkw5VmJjcEhJRVVPUXF1TjFIR2xKMnFpVGFQOHd0R2c0M05CRGtiWXYz?=
 =?utf-8?B?UU0waVJLM1lkTEM2em01aERoSUN5SWF3U3ZqcllOUU1aYitPcWNHTW9vWFd3?=
 =?utf-8?B?clpUVEs2Sk1aaVRCZW1DV0UxQ3NvZXNMNmFPbE1uY29hNmtEN3NEVWQrQmpK?=
 =?utf-8?B?WTFxeTR0U3R5NFlLVnp6WjBxOUZOekdEMkpOUktxcTVuVll2ZkhYUUEzV0ZC?=
 =?utf-8?B?c2E1aXZjT0pyaTlHeFpoaWpJS2pma2hYbEFzYnRXMUpaRlNWd2lSbXQySWxJ?=
 =?utf-8?B?MTVvRTkxOFVTTHpmcU5zQUh1RGlmQUQ1ZUV2VjllWFdIYmNla0c3Z0g5U0hL?=
 =?utf-8?B?S2tSR2wvZ3dHdVhROGtVWElUQnBwWUR0Z1FlTTh3V3pnMU1XVzFXbnREYlpC?=
 =?utf-8?B?OXNPSDJKenYwejFkVlEvZFBPdTJCUFJ4bXRhemN4L285MG9idStHOHBUakYy?=
 =?utf-8?B?MDdVYkR6SHlUbVVENTJvZXRRcWpmb3JRZnlrWGxhY3huTG1sL1hHR3JzcTRs?=
 =?utf-8?B?ektveWdpK2R3MWROQ1dFSXlhWWVFR0J1Z0p1U0tyOW9Wd3FZd0FoS05pQ1pz?=
 =?utf-8?B?NEdxUEdONVEwaitGWFo0UjU5Vk41YzVNSU0yUlJOSDkybnk2NWRyTkRDTGcz?=
 =?utf-8?B?N0FOL2Q4OHNsZlkxd2N5aEJVWWpvQnlOK2pzb285dUxqaUd2U1JHL3p0bzJl?=
 =?utf-8?B?K2dZNVJUa0d6S3psUlN1akRackpwNWJySmFMQ0N2bnByMUxISTlsQXhqYThz?=
 =?utf-8?B?a3RFWXZhMHBNZEs1UHdnQnBiTllRcm5EZ0hLZkV6Nk1VWG1GTjVBajlwQ3da?=
 =?utf-8?B?bTI1b2RjZzdLQS91QnFiTEROSzhkYTJDWWk1K1RNU0xVZlRSaWQ4WGJaY3Zj?=
 =?utf-8?B?VmVKTXBXK0FTZ00rMXIwNzRBR2F1aTdmR2lkdE5QSXJZaTQ4SU9QMFM1bmtZ?=
 =?utf-8?B?U0xjcnppS2FtaGJpQmhLOGwzZHJBNjRQK25uYklkREo2NW8reGdkM2xsZ1hm?=
 =?utf-8?B?c2F4SjRWVkR1QUJDeWhMcnV0Qm1pbjh4SjRlYlN6dG5YWkZrd0ZXQzhMV3RD?=
 =?utf-8?B?TXd0VW9pdWZ1Uy9rVWluNEVYTlUzTFdSSkJaYmd4c2ZTMXBHaFBSL0xIT29V?=
 =?utf-8?B?czdzOHBZQW9TTmxWRnBwclhnM00zZjNMaEdYMERQZ25qMzFhS2tKWFVQUWlv?=
 =?utf-8?B?d0dFcHBiZWhPQTV6c1MxOWVCbnhJSWFqMmNGREZVYUhmdnkzZzI3a3NnLzNp?=
 =?utf-8?B?SmxsaThZT3p6Zmx1Z3c5THVCd2ZqR0ZHd2g5NVdvYndJTVZvczRzQ1NXR0ho?=
 =?utf-8?B?dDIyYi9ySnpsVkgydGppT0NEMUVuV2NoL1JOR21pSWhlQ25oUUZOaFM0bmhj?=
 =?utf-8?B?NitwUVdJd00rUTM3Rjk4UWZBWjlQZXNKSmRBWXhlb0xLQlNEWENPVE53amJZ?=
 =?utf-8?B?M2JreGJMMzFYaTZyN29aNFZQR1BDcExEaDVYN3FYbUk0VDduRzd1dXN2c2xk?=
 =?utf-8?B?VUdpczNTUjRxQjdRNnBkMU9PcjZCaDhQOFQ3Um1EMGpMLy9QeXd2Mk9rMWxH?=
 =?utf-8?Q?PHfSGfHtgUZpdxu0=3D?=
X-Exchange-RoutingPolicyChecked: hJnuwTF3V88YKALZDdOuDG8Rkv78F4ZfpJ3w6RLbLQgtwTfRVHeJMa2lL6EOD3Dx/qOwIs+lytssVRO3n0dM3GNW9l0RSo3yyptZ1uh8L6xSalDxP81qXAUN49BpwDcNEF4qzDIGWbfjz92A41YjCmLRqxpmVanPFeqgYaLk56oibl62MRhWW9M3YTrPYGBNn0QcZw+IQH9mLuQbxrWgXpjH/IqElsvDeQE3asRqJt2xdcxkJsS8FU0vjXX2etgRmrN7iST6UDcndoPgPf2iXFAjuVBD6TOi7qZuTpd5EU+rFDHcoGCIhax13heODPEnfNANZRB/M7X+y5Dw6VNm5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b18639c-e9e6-47ca-5ec8-08df133643e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:33:09.9264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed1CLMifjCZg5tdWq3qMNFPDpGwEKtJtDGm0JhCFAuSakLPbyuc9QXQgHHo/0YrBXw32Hw0Ywum3olRFkB6vyFfvmYqb3x5ni8Bk22HM5FY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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



On 9/15/2026 9:12 AM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In the unlikely event of PF malfunction or
> misconfiguration, a VF may receive incomplete, zero, or out-of-range
> values for its submission contexts, doorbells, VRAM or GGTT assignment.
> 
> Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
> bad KLV responses and verify that VF can survive without crashing for
> the invalid configuration data received.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V7 -> V8:
> - Updated kunit test as per changed from other patches.
> 
> V6 -> V7:
> - Fixed review comments (Sashiko, Michal W).
> 
> V5 -> V6:
> - Fixed review comments (Michal W).
> 
> V4 -> V5:
> - Added alignment tests for vram, GGTT base and size (Michal W).
> - Separated stubs for ctx, db, vram and GGTT (Michal W).
> - Added new test cases for xe_guc_mmio_send_recv() (Michal W).
> 
> V3 -> V4:
> - Changed stub function from guc_action_query_single_klv32() and
> guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
> - Fixed review comments (Michal W).
> 
> V2 -> V3:
> - Renamed the test names. (Michal W).
> - Fixed review comments (Michal W).
> 
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 393 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 397 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..e1a1bc5f1223
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,393 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_ggtt.h"
> +#include "xe_guc.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define TEST_VRAM			SZ_8G
> +#define TEST_GGTT_SIZE			SZ_2G
> +#define TEST_GGTT_SIZE_OUT_OF_BOUNDS	0xfffffffffffff000ull
> +#define TEST_CTXS			1024
> +#define TEST_DBS			128
> +#define TEST_GGTT_START			0xa0a000ull
> +
> +#define TEST_VALIDATE_IN_PARAMS(test, len, request, key)	\

can't we implement this as a regular function?

	void assert_valid_query_klv_msg(struct kunit *test,
			u32 len, const u32 *msg, u16 key)


> +	do {	\
> +		KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);	\
> +		KUNIT_ASSERT_EQ(test,	\
> +				FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),	\
> +				GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);	\
> +		KUNIT_ASSERT_EQ(test,	\
> +				FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]), \
> +				key);	\
> +	} while (0)
> +
> +#define TEST_FILL_RESP_BUFF(resp, c, type)	\

here too, please use regular function/functions
or just inline the required code
our priority should be easy to understand code
rather than maximum code reuse at the cost of complexity

> +	do {	\
> +		if (type == sizeof(u32)) {	\
> +			resp[0] = sizeof(u32) / sizeof(u32);	\
> +			resp[1] = (c)->query;	\
> +		} else if (type == sizeof(u64)) {	\
> +			resp[0] = sizeof(u64) / sizeof(u32);	\
> +			resp[1] = lower_32_bits((c)->query);	\
> +			resp[2] = upper_32_bits((c)->query);	\
> +		}	\
> +	} while (0)
> +
> +struct config {
> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config vf_ctx_testcase[] = {
> +	{ .orig = TEST_CTXS,		.query = TEST_CTXS,		.name = "same",		},
> +	{ .expected_ret = -ENODATA,	.name = "none",						},
> +	{ .query = GUC_ID_MAX + 1,	.expected_ret = -EPROTO,	.name = "overflow",	},
> +	{ .orig = TEST_CTXS,		.expected_ret = -EREMCHG,	.name =	"lost",		},
> +	{ .orig = TEST_CTXS,		.query = TEST_CTXS / 2,		.expected_ret = -EREMCHG,
> +		.name = "reduced",	},
> +	{ .orig = TEST_CTXS,		.query = TEST_CTXS * 2,		.expected_ret = -EREMCHG,
> +		.name = "increased",	},
> +	{ .expected_ret = -EPROTO,	.ret = -EPROTO,			.name = "proto_error",	},
> +	{ .expected_ret = -EIO,		.ret = -EIO,			.name =	"IO_error",	},

hmm, not very reviewer friendly layout ...

> +};
> +
> +static const struct config vf_db_testcase[] = {
> +	{ .orig = TEST_DBS,		.query = TEST_DBS,		.name = "same",		},
> +	{ .name = "none",									},
> +	{ .orig = TEST_DBS,		.query = GUC_NUM_DOORBELLS + 1,	.expected_ret = -EPROTO,
> +		.name = "overflow",	},
> +	{ .orig = TEST_DBS,		.expected_ret = -EREMCHG,	.name = "lost",		},
> +	{ .orig = TEST_DBS,		.query = TEST_DBS / 2,		.expected_ret = -EREMCHG,
> +		.name = "reduced",	},
> +	{ .orig = TEST_DBS,		.query = GUC_NUM_DOORBELLS - 1,	.expected_ret = -EREMCHG,
> +		.name = "increased",	},
> +	{ .expected_ret = -EPROTO,	.ret = -EPROTO,			.name = "proto_error"	},
> +	{ .expected_ret = -EIO,		.ret = -EIO,			.name =	"IO_error",	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_ctx(struct xe_guc *guc, const u32 *request,
> +					  u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	TEST_VALIDATE_IN_PARAMS(test, len, request, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
> +	TEST_FILL_RESP_BUFF(response_buf, c, sizeof(u32));
> +
> +	return 0;
> +}
> +
> +static void test_ctxs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ctx);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_db(struct xe_guc *guc, const u32 *request,
> +					 u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	TEST_VALIDATE_IN_PARAMS(test, len, request, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY);
> +	TEST_FILL_RESP_BUFF(response_buf, c, sizeof(u32));
> +
> +	return 0;
> +}
> +
> +static void test_dbs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_db);
> +	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
> +}
> +
> +struct config_vram {
> +	u64 orig;
> +	u64 query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config_vram vf_vram_testcase[] = {
> +	{ .orig = TEST_VRAM,		.query = TEST_VRAM,		.name = "same",		},
> +	{ .expected_ret = -ENODATA,	.name = "none",						},
> +	{ .orig = TEST_VRAM / 2,	.query = TEST_VRAM + SZ_1G,
> +		.expected_ret = -EREMCHG,				.name = "increased",	},
> +	{ .orig = TEST_VRAM / 2,	.expected_ret = -EREMCHG,	.name = "lost",		},
> +	{ .orig = TEST_VRAM / 2,	.query = TEST_VRAM / 4,
> +		.expected_ret = -EREMCHG,				.name = "reduced",	},
> +	{ .orig = TEST_VRAM - SZ_1M,	.query = TEST_VRAM - SZ_1M,
> +		.expected_ret = -EINVAL,				.name = "unaligned",	},
> +	{ .expected_ret = -EPROTO,	.ret = -EPROTO,			.name = "proto_error"	},
> +	{ .expected_ret = -EIO,		.ret = -EIO,			.name =	"IO_error",	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_vram(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_vram *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	TEST_VALIDATE_IN_PARAMS(test, len, request, GUC_KLV_VF_CFG_LMEM_SIZE_KEY);
> +	TEST_FILL_RESP_BUFF(response_buf, c, sizeof(u64));
> +
> +	return 0;
> +}
> +
> +static void test_vram(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config_vram *c = test->param_value;
> +
> +	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_vram);
> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +struct config_ggtt {
> +	u64 start_orig;
> +	u64 start_query;
> +	u64 size_orig;
> +	u64 size_query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config_ggtt vf_ggtt_testcase[] = {
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE,
> +		.name = "same",									},

as you can't fit all fields in one line, better to code them one-per-line:

	{
		.name = "same",
		.start_orig = TEST_GGTT_START,
		.start_query = TEST_GGTT_START,
		.size_orig = TEST_GGTT_SIZE,
		.size_query = TEST_GGTT_SIZE,
	},
or
	{
		.name = "same",
		.orig = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE, },
		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE, },
	},


> +	{ .start_query = TEST_GGTT_START,		.size_query = TEST_GGTT_SIZE,
> +		.name = "query_on_init",							},
> +	{ .expected_ret = -ENODATA,			.name = "none",				},
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE + SZ_4G,
> +		.expected_ret = -ERANGE,		.name = "overflow",			},
> +	{ .start_query = TEST_GGTT_START,		.size_query = TEST_GGTT_SIZE + SZ_4G,
> +		.expected_ret = -ERANGE,		.name =	"overflow_query_on_init",	},
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,		.expected_ret = -ENODATA,
> +		.name = "lost",									},
> +	{ .start_query = TEST_GGTT_START,		.expected_ret = -ENODATA,
> +		.name = "lost_on_init",								},
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE - SZ_1M,
> +		.expected_ret = -EREMCHG,		.name = "reduced",			},
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE + SZ_1M,
> +		.expected_ret = -EREMCHG,		.name = "increased",			},
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START,
> +		.size_orig = TEST_GGTT_SIZE - SZ_4K,	.size_query = TEST_GGTT_SIZE - SZ_2K,
> +		.name = "unaligned_size_4K",							},
> +	{ .start_query = TEST_GGTT_START,		.size_query = TEST_GGTT_SIZE - SZ_2K,
> +		.name =	"unaligned_size_4K_on_init",						},
> +	{ .start_orig = TEST_GGTT_START,		.start_query = TEST_GGTT_START - SZ_2K,
> +		.size_orig = TEST_GGTT_SIZE,		.size_query = TEST_GGTT_SIZE,
> +		.expected_ret = -EREMCHG,		.name = "unaligned_base_4K",		},
> +	{ .start_query = TEST_GGTT_START - SZ_2K,	.size_query = TEST_GGTT_SIZE,
> +		.name = "unaligned_base_4K_on_init",						},
> +	{ .expected_ret = -EPROTO,			.ret = -EPROTO,
> +		.name = "proto_error"								},
> +	{ .expected_ret = -EIO,				.ret = -EIO,
> +		.name = "IO_error",								},
> +	{ .start_query = TEST_GGTT_START,
> +		.size_query = TEST_GGTT_SIZE_OUT_OF_BOUNDS,
> +		.expected_ret = -ERANGE,		.name = "out_of_bounds_size_on_init",},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +	u32 key;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_EXPECT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);

only expect?

> +	key = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]);
> +	KUNIT_ASSERT_TRUE(test,
> +			  key == GUC_KLV_VF_CFG_GGTT_START_KEY ||
> +			  key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY);
> +
> +	response_buf[0] = sizeof(u64) / sizeof(u32);

	response_buf[0] = FIELD_PREP(GUC_HXG_RESPONSE_MSG_0_DATA0, ...

> +	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
> +		response_buf[1] = lower_32_bits(c->start_query);
> +		response_buf[2] = upper_32_bits(c->start_query);
> +	} else if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
> +		response_buf[1] = lower_32_bits(c->size_query);
> +		response_buf[2] = upper_32_bits(c->size_query);
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_ggtt_shift_nodes_stub(struct xe_ggtt *ggtt, u64 new_start)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	u64 expected_start = ALIGN(c->start_query, vf_get_ggtt_alignment(gt));
> +
> +	KUNIT_EXPECT_EQ(test, new_start, expected_start);
> +}
> +
> +static void test_ggtt(struct kunit *test)
> +{
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +
> +	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
> +	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
> +
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ggtt);
> +	kunit_activate_static_stub(test, xe_ggtt_shift_nodes,
> +				   xe_ggtt_shift_nodes_stub);
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +struct config_mmio {
> +	u32 response_length;
> +	u32 response_value;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config_mmio guc_mmio_resp_testcase[] = {
> +	{ .response_length = sizeof(u32) / sizeof(u32),
> +		.response_value = TEST_CTXS,			.name = "same",			},

redundant with test_ctxs.same, no?

and maybe it shall be called "valid" as it's just a new valid value
there is no prev value to say "same"

> +	{ .expected_ret = -ENODATA,				.name = "none",			},

redundant with test_ctxs.node, no?

OTOH if we want to test guc_action_query_single_klv() then
there might be a KLV with len=0, and then ret==0 is expected

> +	{ .response_length = sizeof(u64) / sizeof(u32),		.response_value = TEST_CTXS,
> +		.expected_ret = -EOVERFLOW,			.name = "overflow",		},

len = 2 is overflow for query_klv32, but it's fine for query_klv64

> +	{ .response_length = sizeof(u32) / sizeof(u32),		.response_value = 0,
> +		.expected_ret = -EREMCHG,			.name = "lost",			},

redundant with test_ctxs.lost

> +	{ .response_length = 0xffff,				.response_value = 0xffff,
> +		.expected_ret = -EOVERFLOW,			.name =	"invalid",		},

for len>3 we can even use KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT

> +	{ .expected_ret = -EPROTO,				.ret = -EPROTO,
> +		.name = "proto_error",								},.

if you want to test the guc_action_query_single_klv() then you shouldn't
just define .ret to be used by stub, as then you will effectively just check:

	ret = xe_guc_mmio_send_recv(guc, request, ARRAY_SIZE(request), response);
	if (unlikely(ret < 0))
		return ret;

to test -EPROTO you should prepare the response that will be catch by:

	if (unlikely(FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ, response[0])))
		return -EPROTO;

then other one for these "if" checks:

	length = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH, response[0]);
	if (unlikely(length > value_len))
		return -EOVERFLOW;
	if (unlikely(length < value_len))
		return -ENODATA;

> +	{ .expected_ret = -EIO,					.ret = -EIO,
> +		.name = "IO_error",								},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(guc_mmio_resp, guc_mmio_resp_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
> +				      u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_mmio *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
> +			GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
> +
> +	response_buf[0] = c->response_length;
> +	response_buf[1] = c->response_value;
> +
> +	return 0;
> +}
> +
> +static void test_guc_mmio(struct kunit *test)
> +{
> +	const struct config_mmio *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +
> +	gt->sriov.vf.self_config.num_ctxs = TEST_CTXS;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);

why vf_get_ctxs_cfg() ?

maybe it should be just plain:

	guc_action_query_single_klv32(guc, key, value)

and other test with:

	guc_action_query_single_klv64(guc, key, value)

to cover both helpers used for VF config query

> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_ggtt, ggtt_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_guc_mmio, guc_mmio_resp_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index ec79793bd547..2bafe34f1821 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1708,3 +1708,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif

