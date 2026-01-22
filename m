Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C1DC44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 08:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A9910E8F8;
	Thu, 22 Jan 2026 08:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZ2LjkYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B4510E8F8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769069710; x=1800605710;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wt05WOJ6RDWg8KGIagbjghf/JXVCN/ciBSnfYzm5xeQ=;
 b=LZ2LjkYZRljffJWwSbJm5yVVP9HsEFHDdchMGZWTyl2v+/Iha50vMcQl
 9xjLwDy/NNy0auoj03NXiceBN6scE1Xd/m4UO2gZokBrL/r+0ViUj9qXo
 uP3QedF2xNIAsX8BEYlxskn5E51Uy4kjsL9FpsEr9VD2W6JfIEQbIPNBj
 mTk/5Z0PyJopVVFYbXHtDKDX+mgDSwr1RN2hCICAJhwAud69x5WrmETA2
 RoyBDFRR5wGcwcZ3SKMHO5EfvJ/FCxUzKuGU1jT5HL0NJM/ajeEBdfHpz
 k2wG3Zv3lTU6D6qVCXxuNK5e2W3n1V2AlNo+z2ibHRHzf+whRgCCvW+8F Q==;
X-CSE-ConnectionGUID: pCoO9xsfQsC1xPivzO6ayQ==
X-CSE-MsgGUID: vAkIeoW+S/Khdr2vbTp8lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70207638"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70207638"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:15:10 -0800
X-CSE-ConnectionGUID: lAXwQG0sTiejHjSskqwxnA==
X-CSE-MsgGUID: mMufIiPgQw21mfxL6qvnEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="229644398"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:15:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 00:15:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 00:15:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 00:15:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj9Tyyb7ayJcKtczIeqB0viXwDdDCID3s2uIIA5uYPX1GNWknowfhZZDIwBVdabHvpi0n9MdGZBpWbn5u6M9qTtJZwqx7AcJm7F2qsJ/1JntFqQqCuMt8dkYcM2njwu+k/PPlkHA3acOp/9MFk4pS9ktpWK40JNrv358iLMyU8j0V3BMpjzNmNIFn6anXH4fKwTqoh5yTCrhzJz914ScEO3wqRXLVMGX+4RNlKH2IVsODdivk/YSgcxxpAwmPVW+kuwhUrN6aN1uwx63yZ2QpVrvNLiuBLYrQrt9mzzE7ZENymRL5JMQG2d4gk17O/NaVvQ/zHJgxntRmYLxuOWBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8rn2PcztoOXuLX4jU4ALuSB6YciWuSiusRhiuVh2mc=;
 b=iiZZWLgVnFAAx3G9BPAzS6wNy1wtAY228+HNZigNAzP9MGFa++o+S2zz2foW7iRAgQXCjuO6jOLJ4P4r6dtuPkhlZQc1kQIq6p8iG7ilqyw9ZR7DIpd7r6eWVAiPOSsz8A9mbESw/HrW41LmzqWBSptoevQwd/NScdIanqZjAnSf5MwSfaQfAJ4j7NK7wRloV9bK7EihggFNCpHqegQve5z1Dne37Mw4pOMzD0DiAtJ/fd4LxLrzEeyQXijKqFJNI2GqaxoPGdMqUvlFxWA1IIR94gLXvWkpcoUrs5/7+PsF2LovB6CsBljGzmrWl+GlKvV2qDNkizKHT1VRwjHkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 08:15:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:15:06 +0000
Message-ID: <66a2c0d2-09a4-4e1a-a445-204e92e9dbdd@intel.com>
Date: Thu, 22 Jan 2026 13:45:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260113220801.2198264-1-vinay.belgaumkar@intel.com>
 <20260113220801.2198264-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260113220801.2198264-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f2d1d3-3b13-43d5-4c50-08de598e5a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGZWMWswYmZZWmdxeGRTWVZLSkV5MndMRzA2eGVQMnZYN081OUVGN3B2dUZn?=
 =?utf-8?B?TFdsUnF6VGRwdGw3RW5oM2p6WXF4cGU1cFhZTE9CQVdFb1pKVll0YndlV2dV?=
 =?utf-8?B?MmJQaVFtdDU1dlFSbFJiVmJmejF4L0RwcU14b2lUUjdMclhTZndFenlCdm1x?=
 =?utf-8?B?OTV0SkdRYlJVeG1HTnRHQVlpY2ErdVRxQ1FIa2N1WENnSkFOL2oyMDVmT0JE?=
 =?utf-8?B?Z2ZiN25JNnM4VFg1cjNOaDJtTThXenJqYjdvZkk0QmtndzRmakdBMytKTW41?=
 =?utf-8?B?SHBOSVBtRjI1dVFqUTJXNXVDRHMwcFQ2VGZXdGxaWkhVSnZmWGJnZVRJaUpU?=
 =?utf-8?B?SUNxWjNreVplUHJtZ3ByV2pqMXUvR01aclY4NEFudk9IUm83SHVSaUpMeFM1?=
 =?utf-8?B?WEtYa212aDhGa1d5bDRsK1VtUklCOE5zaTVyQ3NvcmYveFJnRDRyTVdlSklQ?=
 =?utf-8?B?VEhNM0lINitYMFVpaUxSdWJCVm1NR25wRDZMSUYxbC9pK3d5a0J6cHN2Qmlx?=
 =?utf-8?B?OUdXSXRUK3ZWNkY5YnRWTGpCejhOMGxWTHlDNjFWZjZ3MHR1Nkhla2gweVM3?=
 =?utf-8?B?akpqRVZtU2RLR2lNQ1lsVmFneTIrVldvV2cxVDF0eVhpeWFpTnNHN0NwVUF6?=
 =?utf-8?B?d1lJWGpCSHB2UmVPelBMZFZlSHJnRHBIRU5sWWZKTlJnSzBDQ05aZ3VhYkNl?=
 =?utf-8?B?NTZPQ084cThEdmlMc1NldEo0WGhlT21lc3JZZDgzb0YvbmJxdUZTRUF4cEFJ?=
 =?utf-8?B?c1ZqS1BFbCtBcmpMOE96V2IrRzcwKzB4WllrRmhkbzAxcHdlVENVSm95TUY5?=
 =?utf-8?B?V05ZSzk2UEIxRVlmSHB2N24xT2xxK3R2WlBpSEtaWVFJWnVCTjk3UkVBUXc3?=
 =?utf-8?B?Qjlielp1OWRkc1BzaHphR3lkd1IxbGtybm54MzBHYUdEUVBLSDJvamtiS294?=
 =?utf-8?B?U2QvdUIxZzZ1NHJpZTZ2WjJ1clRoV2VXT0FsN0EzWjV1UUQzV1d3L0dvS2Ez?=
 =?utf-8?B?NndMaUg1KzRhUGVHdkpjcEx6Y3IxWHV5NFhWRFNEbDhKRGYvZlVUVUNoQ2sr?=
 =?utf-8?B?K3ZUcHAyU1pZa3F6UUNUQ0pzYWR6Rks3SHRVMTN6dTQ0RGltK0tGWit4Qzhq?=
 =?utf-8?B?Zk5MU2RUOWlSY3NrYldDUnBOaDhqc2g1Yk1oc2p2TkIwR0ZDVTdUKzZaeTVT?=
 =?utf-8?B?YXJPQ0Q5QmtXQzg1WFF6dStBSzNOTWorRXlNdjRGcWhTMWoxQkZ4RDVTVjVD?=
 =?utf-8?B?eHZ5eWdCRjRTUCtzOXk5Rjk1Tm01OHhFSm5LZy9WYThUTHBtL0ExMStNMVRK?=
 =?utf-8?B?cE9qcjAwNUxsdytjejg0T0pydDRsdkZUa1F4TjR3eDNzWkFLR2xRczUyL1RF?=
 =?utf-8?B?SUNiNExCbDg2RGQrYU9OMkdCN3lQcE5KajFNcFpaWVZkd3hOTlpXaHBONjVi?=
 =?utf-8?B?cmlrVFI5bDBBNTNNWkpRK09uNkJhWEZlNjJva2VIaE9leHRQSy80c1prUEQ1?=
 =?utf-8?B?NU94aVZpRkh6ZTI2eUZCdDJQK21UTHZrUEx5LzROSHNjRGVDbWhYWEhGQWtq?=
 =?utf-8?B?Q3JFNWJ0L2o0emZZZEJ3ak5VZlpvVTlnWXRWUVRLNnVxcVdqcWd2dkExL0Ev?=
 =?utf-8?B?ejdNMHdpWU1ma3VBTEtNb3BoNkFqL1EvS0JaUHRYMkdDNHhoN2ZZWC8zQ2ZQ?=
 =?utf-8?B?YmRBWC9aZGNiY29XM1hMY0pndXFnaWVFWWJYdVlrRFUwZldMMXJSMXFQYU01?=
 =?utf-8?B?dFovcWc5MnA5Wm95eUJBS3RnVzI4OGlCWDlFOU9BekZ2UG8zdWFoeHdaMHd3?=
 =?utf-8?B?RHg2eTRyT1FCY1RPUmpqWlpIL0ljRWVUR3pZclA0TUFKdklRYmhpaHhMRDdY?=
 =?utf-8?B?UnZxTU44S0dEOGFoZm9sQTdodnJqSW9pN0ZkcncrZkhIaUVGaWdzUy9lbSs2?=
 =?utf-8?B?eGxWeFFXRkJEUDhQN0ZRRldaSU5TRDNsV3Yra1Y4WXJJUHVhOEJpY2p4UGcv?=
 =?utf-8?B?VElGZFNQY2tiNnVlTm1CTE1VdnVScW1UM0xEcmYwZ2hINmxBZldGdi90cE1x?=
 =?utf-8?B?aG12VHQvSFNCcW9PZXZhZVFSU0p3bVpYa1hkS3VqNE5iT2ZFaEFCZGlZNjFw?=
 =?utf-8?Q?Umvg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXVBOHdCcWR5WlE2SUJuSjAyTkFFVU5qNzdtaE9xeDZJMFZxUm5UdytEM2E3?=
 =?utf-8?B?Z2ZBcjJ0Mm9KOENRMGEwRjNJbWhhbjdveFVKTm9YdGpPZ2gzTmJRVWYwVGhL?=
 =?utf-8?B?bElXSjZoZ213RVBnOWYybTRPVWhRWWpTcjdyR1AyTnJSMWxIVTFRMy9Cc0hB?=
 =?utf-8?B?eUM2QndoK2dLV2ZSREVRMnp6NFpFTk80NEpWUDJKNlQ2MWg1eUlBMkoyMEZI?=
 =?utf-8?B?Z3RBNXk1Vmw1akJtclpWdUJGbG91SnFWSWRFcGlFRHJ5MVNYSnNqa2VoNTY1?=
 =?utf-8?B?K25YZjVka3VYclcxY3lrWGVXS1JGMStqUXg0emdsRm0xb1FDek8xWXJOTVdk?=
 =?utf-8?B?SDdjVnJUM08rU2VVYkxvWFZqS25mdWw3Yk52L3hqeTdjM2g3Q213VWxRQVJX?=
 =?utf-8?B?aEdZWnFaTG9qQzlVdkRxTENqUFpIWEluN2xDOE9EU0xONCtwZTR1eGJORDhS?=
 =?utf-8?B?eVp5KzBRSkdnR2oxSEtMR2pnbmM1VU5kdURkcG13ZjBOZkE3SDlhRTFrMXFU?=
 =?utf-8?B?MkdzT1d0QTdCbEVibTJDb3dSNVZVYTY3WUtrVHg2STlMb1oxeXpOVWtzMFpJ?=
 =?utf-8?B?UHh6SjBPNVU0dnpJdG1Dck9jR2JmRkxBZzAzYUg2eDVRa3JwWnNSQ3oraHVn?=
 =?utf-8?B?MnNERk4zNkt0K3BWRGRxczhaMjFRMHJhTGZiMHZ2Y1FXUDEwYncvTWM0MXR0?=
 =?utf-8?B?ZTN3b0krOWRKZFovV2djYlI1RmNERWk3cXFpUGUvc2xwTEpISGJhRlljdzJk?=
 =?utf-8?B?Nk1Mc3NIckZmNE9pSWlLc1haRnN5VUF2NDMxdHQwWk9lZTVwN25VWml6Z3hm?=
 =?utf-8?B?aHU4cVJ6MEtQc0JpODFxZ1FESFdBSzEzeWpWTk0xVjAxVTJ6T0RHMTdoeDlh?=
 =?utf-8?B?T2k4a2JIZGNFeUR2YnFJS1NEdGovdU5LQS9VbTBGenlURFJlcjlYYlliRTZP?=
 =?utf-8?B?ODREbnI2UzRiZDg3ZzA2cXJMdTc2T203LytCV09zczBjTG1aclJnbjVQQ2Jt?=
 =?utf-8?B?cmlUQnBoT1NxNGhrTUI0LzBHQUtVM0lTaXRHY2JlKys2Z2ViL2dxaUM4WFZF?=
 =?utf-8?B?dU41M1dmVVZMWHM4N0RTcmV5Qm9PLzQ5N0I3bHFCQm1NQUJuN3dzUUpCeFNP?=
 =?utf-8?B?SzJCZEdXZlRMc2IwdUlQL3N3dFJkVHFicndTQ1NlOGx6NTczZnZoTCtmcVEy?=
 =?utf-8?B?OGk3MzExSmVtdWt5RmJWWTRZQm9QRVFGbEtpRWJ2eUZERFJtQkxwOXRVYjlr?=
 =?utf-8?B?OHdScnFCVXRTRzZ2ZmpaY1kvZ1VDcHBuSXh0eDRvUXA3cWRFMTVsYTExUFA3?=
 =?utf-8?B?UEFnejF0MjlPYVRxT1Fxd2hTLzVmMWhnNTJEZEZIM2xpRXA1TXE1d2crYXVq?=
 =?utf-8?B?VnpEYzNjbVVqWVRDVXR6ejBYVVNTLytJNnFQMVN4RXAxeStYU2p1V3IrdVov?=
 =?utf-8?B?Wm5OcFRpRTVoR2dIM3VTVWh2MmY4RkNCc1FKMDNQejAwdkpkbHJSR3laUmZC?=
 =?utf-8?B?R2xUQ2tndlEyQysyZjRndGMzZDZjQUhYMUs3b1ZNOHVtUEhmNWlYZDZOaEpx?=
 =?utf-8?B?N2dsN2lmaGVUbDNwbTkwYUgvclFLTEQ1RXRSV2U3WkZiM2tjaFdKclFpd1Iw?=
 =?utf-8?B?V0tqYjk3RjIvQmRTUDY5b0xPZnBxODJGVkMyYy9vWkhrNFhYZUhiaTZEb1NU?=
 =?utf-8?B?bWFSZXVmeWhFTVA3TU1yZXJDdmhOM2M0SEtLWi9pM2loY3NRSFQ5K0l5YXNT?=
 =?utf-8?B?T2doTlRrOVphMzBZRzR3ZFBjak01RnBGK0JHajFUY0tjVFBnR0JHczJKVC9E?=
 =?utf-8?B?QXFPaW1pQmt3Q3JsbzRMcnBtdzE2cW5KemR6c1JKYW16bFVtZmkwN0RtUUJO?=
 =?utf-8?B?SE1iM0NvbVdacXhpdDZHclFqazlkK1pXNW9rSzRsODlyREpTcDdibEw2WWEv?=
 =?utf-8?B?cUs3MlVvV0Q5a2hqb1JjRmY5Mkk5Q2J2U2VPbURCNVJobFI5NnR4VE1uZWg0?=
 =?utf-8?B?aXpHaHlBdGZHSFNYaUZMc1dwcG5VNUhLNk9hWlRwVzJkY21jOHp2d0tOSEF5?=
 =?utf-8?B?TzR4WFBoK1lqTGVxWXRKdmhTNHMyYjJaSVpadW5TNG1ISE9CZUJuN3VxRXhL?=
 =?utf-8?B?azNKNDl2WFNRN3IrNkRBREoxaWJtaythcEdNZXdjYnFHOGtqeXAzUmJISzBv?=
 =?utf-8?B?ajRNU1dQcmtVeFNvS0p1dTdWTldyaW1jeVFEZEhKZzRjY216UU1URXRkQ3Fo?=
 =?utf-8?B?MHNXOUJCOU1EUUdid0ZXZmhoVHQ2WFlJOHh5QXppTTFLR3kwSmR1L1UyNWFM?=
 =?utf-8?B?b29Wc3MxYk8zL1BXK0NUVk50KzR5NUpmZGtIZTNHNzI3aGtSUFhLdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f2d1d3-3b13-43d5-4c50-08de598e5a13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:15:06.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2rp3tZJ5c6RHvcTyKAlNlxAdWNU+Il5TqbUVs/288dweB69QwjXAcJI2WZ0UU03JyptZ4lVUV4bQEUs+695VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
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

Hi Vinay


On 1/14/2026 3:38 AM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
> (Michal W)
> 
> v4: More comments (Michal W)
> 
> v5: Remove rc_init and use enable/disable (Riana)

Few small comments
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile    |   1 +
>   drivers/gpu/drm/xe/xe_gt.c     |   1 -
>   drivers/gpu/drm/xe/xe_guc.c    |   2 +
>   drivers/gpu/drm/xe/xe_guc_pc.c |  70 ++++----------------
>   drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>   drivers/gpu/drm/xe/xe_guc_rc.c | 114 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_rc.h |  14 ++++
>   drivers/gpu/drm/xe/xe_uc.c     |  10 +--
>   drivers/gpu/drm/xe/xe_uc.h     |   1 -
>   9 files changed, 149 insertions(+), 65 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 89dc48cd73e2..928fdb925c13 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>   	xe_guc_log.o \
>   	xe_guc_pagefault.o \
>   	xe_guc_pc.o \
> +	xe_guc_rc.o \
>   	xe_guc_submit.o \
>   	xe_guc_tlb_inval.o \
>   	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 313ce83ab0e5..9ee328aa6579 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -822,7 +822,6 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_stop_prepare(gt);
>   
> -	xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
>   	xe_pagefault_reset(gt_to_xe(gt), gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..f66b0c987b09 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>   #include "xe_guc_klv_helpers.h"
>   #include "xe_guc_log.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_relay.h"
>   #include "xe_guc_submit.h"
>   #include "xe_memirq.h"
> @@ -1609,6 +1610,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>   	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>   		int err;
>   
> +		xe_guc_rc_disable(guc);
>   		err = xe_guc_pc_stop(&guc->pc);
>   		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
>   			   ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 54702a0fd05b..cf02c53ca3c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -92,6 +92,17 @@
>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>    * all platforms.
>    *
> + * Implementation details:
> + * -----------------------
> + * The implementation for GuC Power Management features is split as follows:
> + *
> + * xe_guc_rc:  Logic for handling GuC RC
> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
> + * xe_guc_pc:  Logic for all other SLPC related features
> + *
> + * There is some cross interaction between these where host C6 will need to be
> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
> + * overridden through 0x3003 which is an SLPC H2G call.
>    */
>   
>   static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	return ret;
>   }
>   
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>   static u32 decode_freq(u32 raw)
>   {
>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>   /**
>    * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>    * @pc: Xe_GuC_PC instance
> @@ -1217,9 +1188,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		return -ETIMEDOUT;
>   
>   	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>   		/* Request max possible since dynamic freq mgmt is not enabled */
>   		pc_set_cur_freq(pc, UINT_MAX);
>   		return 0;
> @@ -1257,15 +1225,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		return ret;
>   
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>   	/* Enable SLPC Optimized Strategy for compute */
>   	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>   
> @@ -1285,10 +1244,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   {
>   	struct xe_device *xe = pc_to_xe(pc);
>   
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>   		return 0;
> -	}
>   
>   	mutex_lock(&pc->freq_lock);
>   	pc->freq_ready = false;
> @@ -1309,8 +1266,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>   	if (xe_device_wedged(xe))
>   		return;
>   
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>   
>   	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..214473be6c83
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation

2026

> + */
> +
> +#include <linux/device/devres.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_guc.h"

Alphabetical

> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_rc.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC (Render C-states)
> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of the frequency component in SLPC,
> + * which is also controlled by GuC.
> + *
> + * This file will contain all H2G related logic for handling Render C-states.
> + * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
> + * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
> + * functions that override the mode for which we have to rely on the SLPC H2G
> + * calls.

Can you link this doc in the firmware documentation

Documentation/gpu/xe/xe_firmware.rst

> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +		xe_gt_err(guc_to_gt(guc),
> +			  "GuC RC setup %s(%u) failed (%pe)\n",
> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
> +			   "UNKNOWN", control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + */
> +void xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (!xe->info.skip_guc_pc && (xe->info.platform != XE_PVC))
> +		if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
> +			return;
> +
> +	XE_WARN_ON(xe_gt_idle_disable_c6(guc_to_gt(guc)));
> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_enable() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC) {
> +		xe_guc_rc_disable(guc);
> +		return 0;
> +	}
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);
> +		return 0;
> +	}
> +
> +	devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
> +
> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..9798cc80fb4a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation

2026


Thanks
Riana

> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +struct xe_guc;
> +
> +void xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_enable(struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..2212f195f5a1 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -14,6 +14,7 @@
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   	if (ret)
>   		goto err_out;
>   
> +	ret = xe_guc_rc_enable(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>   
>   	/* We don't fail the driver load if HuC fails to auth */
> @@ -244,11 +249,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>   	return xe_guc_reset_prepare(&uc->guc);
>   }
>   
> -void xe_uc_gucrc_disable(struct xe_uc *uc)
> -{
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> -}
> -
>   void xe_uc_stop_prepare(struct xe_uc *uc)
>   {
>   	xe_gsc_stop_prepare(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 5398da1a8097..255a54a8f876 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>   int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
>   void xe_uc_runtime_resume(struct xe_uc *uc);
>   void xe_uc_runtime_suspend(struct xe_uc *uc);

