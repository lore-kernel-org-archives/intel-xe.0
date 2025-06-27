Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF79C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 17:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051F010E0F4;
	Fri, 27 Jun 2025 17:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYCmbt/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2910E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751046978; x=1782582978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wnzpb4HJzO7vcpDn6XqRJVsGni6onu9LTIqwBjM8u6Y=;
 b=AYCmbt/ddh1bIGAeokGOUnhLICDv7SQQ2go5F/iKxqCwTNs3ieFQcZkw
 opQO+uXlBYQeG6CtmA8jgZGHAD9B+yFzrD1Q28l0RtKx/jWC7nfrJX+4Y
 lJgjp2d5trwVzE8ctbozaE1Dy5LsW3MeBbW6yYwUcLDSFBoUjM6ojLhWO
 kUPrGvBE1bo5pmgjVfNI3V5Gw7Ww0vnbQpQRpxUMlXtf7zoRbGSFbMBRv
 OnbH3bLOPo9mOO3u4Sz6Kx9U65gqgiFzmpqw5i/wUuG2ochFckvONXhOT
 8anVBYyWsJrFsKSWbcPDrFfIx392XjCHSk2WtDhhaeIJeXljnBHzJDovh w==;
X-CSE-ConnectionGUID: E1SRu5KXTrCKGLC/Ux3TtQ==
X-CSE-MsgGUID: 9xDIGSLYSxCJiyjSo1Oxzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70801599"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="70801599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:56:18 -0700
X-CSE-ConnectionGUID: svjZhit0RaelRNWDR5aPYQ==
X-CSE-MsgGUID: X7w1FbhNSluRdFnsPvqnEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152599428"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:56:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 10:56:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 10:56:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 10:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnO+8E7D5aLFCCyAbQdyyeoWECsudVS+Gdg7261TQ7QWb4ZZBROJRn3i+reRtEx/RvZTrBNTHTL2dzJUCCencsH6IKVqhBOrWrhnwm3TL26tCENu+eMyxKHkBejcUEP1hF5bmwWVXGE5ifsgk/kcyAP5KaxVbr6iABTq9AFGS6M2dia4W7Rso1oETZFbQQQGFgJ8j2DZrkg1tZt1jp+273vMyG92NJU8HmJHCOdFWtxQHW9zxnpd4b7HaXnPnw5dTLM8sfMzc9rSYKz++me94gzwWawJ0+Xq1X75wpexU5P990t1mXifsX9C0yJSCCCwpyRryl7ft9x7DFqbfC/vTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roK/svyAX2804S4glJJalKwWE62vpWLMe4Q6IYZUhUQ=;
 b=lEN9holf9Ah3CEezsygFap4nazPsgGB7NsDUmA2M0jNk62KPBWA5kwwc4h7LreJ6gi8M0WsoiWEh+Vpc78Mi7etuKe8jbqFj7m+VlV0B/aI0JbXCSFnLnDoGYbP8z+tQieoFN0kj7ax2LF09rN05QmCzNr2i2ARSIeEo/wYrrpIv56I5cBp9L7Kb6UHRqwLG9y4oFRytzOuKd7VFYuFIp8plIq0IG0CPo902P5ayw6qqGcuK3cHcakZqrrGxtAfg/aMYSRuW48j+pi8+qGuWVnVRHbqcQEBmtV5bU55BYlMFRTZASDlOvFeMUAZZU61lf0B7DxzlyvTx0U/ObLtK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 17:56:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 17:56:14 +0000
Date: Fri, 27 Jun 2025 10:57:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Message-ID: <aF7bog/C/FNcdfDe@lstrano-desk.jf.intel.com>
References: <20250625095805.1390907-1-nitin.r.gote@intel.com>
 <aFwF53I_d8OkwI3_@intel.com>
 <IA3PR11MB89873DE9E3CF21838937618AD07AA@IA3PR11MB8987.namprd11.prod.outlook.com>
 <IA3PR11MB898706D0EC2F50C11BCE2F64D045A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <SJ1PR11MB6204C011AD05706EF7CCFEDF8145A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB6204C011AD05706EF7CCFEDF8145A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e509c4b-f198-4239-27c0-08ddb5a3e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3A0SWNZdlBPd3RQalJNV2wvSk4rWWJDNDdleCttTTJzaVozSnJ3dWpMR21V?=
 =?utf-8?B?ckZpUWRpZDhYYWxUUStsWmY5RE0ySlRSbFkzR0N0WmRHcG1VcnR6UmhYQ1A2?=
 =?utf-8?B?SWk5ZTJOekd4R05YeDNQalZxbHA2ZzErWkJ0VU13WHpMcnFIV3F5eXppSEZl?=
 =?utf-8?B?T3pHMDdvcGNaVlNsbzJodTdzejNXOUFZT2xTUEpURzA1U0FrS3NrOTdMYlha?=
 =?utf-8?B?TTJpbVBGbmJIejlacGRyYWJZNm5zMGVKRGJmU25ZeXI2NGZ0MHcxdDlGV01p?=
 =?utf-8?B?SWp2QkF5N0VxMnIwKzl6T1VhUmdvVEJkb2xRa1c3TUdHanQwM2dVQWVMa29x?=
 =?utf-8?B?Umt6bHdvV3FrYjl3c1lvY0Q1cjZoNEJzQytHWW1sT0E4bG5QTi8zMXF1TjVP?=
 =?utf-8?B?NU9ERGo0TlhyUDd2Nm8zS2tzdkx4b1l0cEdBUGxaemFoVWQycmRFMVh6T3Qx?=
 =?utf-8?B?bkhCZ3REblhsRE5EOHVPUXNxS1BIWGM3cXByekc5Yy9TL3R3aENQL1dzQlAr?=
 =?utf-8?B?S1dLMENvcWJmVHNnWGc3S3RYUEI0d2dHZzdOOWtraVlWbjJpWnp5Yi94Nkdk?=
 =?utf-8?B?bU9ka1NUK3BERHBTeXprWGhlN2MyOE9Va3BwOERFeVdOOExNVkhWYVI2eVVx?=
 =?utf-8?B?V0pWL0dvQ2dvVzNJWVR1WS9GMEtBcU5rcW9FdlJrT2lVT0ZIaDdtRFJHb3pJ?=
 =?utf-8?B?ZU5BRkswa0pjcjNmdk12TGRSNXc2TU0wMHByQ0owK2ltMUQwUzdvZDJvQVJD?=
 =?utf-8?B?NlI4c3ZYWkk1bE0weVNrSzlPWk11dm40Mm5CMEZkRlFubTNTZnRvWUJuSW9I?=
 =?utf-8?B?OHo0cUZNazhCazgvVnJOcjZQZnhOQmVHTUxXWGU5dVBSczZZdnRhY0hkS1FP?=
 =?utf-8?B?S0ZyU2xaOUtyMUF1YUdUYmhJdjdvR3YyNVVTWmtmWGpnS1NNcDdOZGJDSnR6?=
 =?utf-8?B?YmQwZHdkaHdlVnU4NEJ0VGFvMHJvb1U3VERhS2RPdUtRakQ3VnZpWWpMeFBD?=
 =?utf-8?B?Wi9uY2w2UHpram1QQ25sQjJOcHZYUkZZU2hmSlVMUnJ6Z25QbGpLejhBbnQy?=
 =?utf-8?B?Zm1seTN2c0ZXZ2NrRHNtRzVac2tpQlY5MjZpbEUwcVd2K1J3SFd1bGNvYVpk?=
 =?utf-8?B?TllWbnJxSnBQc1pwNEVTcWJORVZQTmE2c0lsU3F1aHUxR1ZNOXdEMWZBRWFC?=
 =?utf-8?B?OHZWa3hybXNJRi9vLzdrWStpaE1uVUwxd2tjYktjRG9VRUo4SllhUVcrbkhU?=
 =?utf-8?B?dTdSa0NqNEo4ZW81WDgwdm0zZjF3eTlhZWM3bVVUekNHWTUwWnVUcWZFSFVm?=
 =?utf-8?B?S1V1ZmVzbS9PczdNd2UyOURlVHNRYjdwekw5Sis0UnpENEJxaGhzYVRmYVB4?=
 =?utf-8?B?U0ZlR1UzbEZBU25rMjN6WG1qUCtqMWhqckwrVWkvdTBSSTRFaXI3OS8rZ0FX?=
 =?utf-8?B?ci9xSDhtNDUrSzZDcVFCWEw3TlI5MlVkN0lMSm9FVUprVGY2VnRrclhqVm5F?=
 =?utf-8?B?VkRDWVFpakY0aDJCNHFIc25wK2hoSncrODN2eEhpQ0JvQlBXRzdScXhVdjBs?=
 =?utf-8?B?UXlqVExWUmN5T1NmUXcwQnRDREV0T0lZeHRmakVXMXljSEdHajNEcnRlY2ZJ?=
 =?utf-8?B?L3k4L1lEaldsbjJkQnhqUFRyM09sSTAzdlp4YUgvN3VydDBBeWwyWjRiWll6?=
 =?utf-8?B?a0NQNGdIU3B3bGswb3hwdFd3UnQzQnEvY0U5c3lzQlpueVErRTBjWCsxejBM?=
 =?utf-8?B?SkpVWVUweWtsRFhSZmh4RXRPOCtTb1kvbmhIV3BxU0lmZ3RoVHdjcHl1VDIw?=
 =?utf-8?B?UTNiZUFWSUJDZU0zcEFnRzN0cHQxeGlJWWVod0RWTExyWDlMdGorVDU4RkRY?=
 =?utf-8?B?SlJzTlRqTVNQUTFERzJHblJWeWVVMWhVVDFkbEhSQW5XTytJSkNQR1N4aDls?=
 =?utf-8?Q?iPEJeK8eppw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkplZ28wLytTdUNUYlhhVHBjUDgwQkZwSHk5U0M2cUJOcHd3WkNrMHRqMnFp?=
 =?utf-8?B?T0lvNGUyZmRhdVRxQy96YTlJU0pvUUtrTUFTMGlwS29YRkdaNEhSQ2VDTWZq?=
 =?utf-8?B?OFhickVJZmNBTzN2V0VVOWlOWWpINEt2S3UvMGJrS3l6SmNMUVQvY0NEY2x2?=
 =?utf-8?B?TEpPRWg2QjF0ZkQ1Q1ZJeTlQUjRMMzFlNzk2eTVhLzRUQnI0KysxdHlyKy9J?=
 =?utf-8?B?WWE3VWcvaUJuR2UrZnJtTUZCTi9maE53RmRVUjJyQThTNUw0UEdaR0Q1UXJO?=
 =?utf-8?B?Y0IyZFdMb01QRkdNSmJ5TWR4S0wzVGdvNjgzNTExQkxITlZoZEp2Y1k0WCtw?=
 =?utf-8?B?b0Y5TDMzRHRzU1BON2lQTjFtRUpPekMrb29pN3g5R1kzZ0xzb0draG95Y2RH?=
 =?utf-8?B?NWVOTUoxL21iWTI3WmhMUVZUWS9XV1A1VStGbHFmVWcvWXFGWTEwWkc2N0l1?=
 =?utf-8?B?bmxDNFdHZXZkeitXVFJnY3ZETGFpM1JMSnlPMmlKakhDd2VSMit6SWhVWmw3?=
 =?utf-8?B?VDhLK29NSzhGRFNGcW1Ndk1BdEdzWW5icWhOaERTb2JtWDZ4dDM3cFJyR2J1?=
 =?utf-8?B?cXVrcVlBWnVETXhBNW0zc3Y3VGFZR2s1eW50UFl1MmtubTRLUktEdm9Kb3cw?=
 =?utf-8?B?MUpjZ2xvTEE1bkd3dUpiTitHZXo4ckwxSE9QcU1ZSXE3Q3h5N3J6d2xxdmxG?=
 =?utf-8?B?U2tsaG1idGdYekZhVkU5amRYY3FQNnpMQ2NZT3ltQUI5cytrNWZJVlNNTjd3?=
 =?utf-8?B?RlRpVCs3SjE5WmNYTkZMZEJlOEtzMDd0a3kxOHo1RVBmZk9KWDJ6WTRIczVq?=
 =?utf-8?B?QmtsR1MxNk0ydDVCcE4wdFVFZnlTeEdNeUY3a0FSMmhtb2tOb1BDSTJVcUJt?=
 =?utf-8?B?S2xvbWVBVkV4YVJMZnh2YjArQ3ZwR09EQzVNYU1BRjFGVTZUNXFVQnJuc0dG?=
 =?utf-8?B?RXowZk83VWRFclFYLzA4TFBXV2V0NHpieVg2MzMvK1pCK25GeE1YK29pVFp6?=
 =?utf-8?B?aEIxRStTdTFiNkNDTTF5dUp2WGg3cG5KcXVvVTc5eWdIOGFhMXFyaDNlZFVD?=
 =?utf-8?B?WkF5eDI1aVJnTk5ncUVWRzZjdEdMYmxubVZoWjZWVlR2ZFR1TksrRUg3UmVm?=
 =?utf-8?B?eE9BV1JKZ3IzT1c4U3BlYi94RE44aXdpQWN0b1ErcnNmTVdnQXRjOHRTTjJr?=
 =?utf-8?B?VkNidVBIVUN2TWVJaEtPR3lEdFZnSmJBT090Y241L05xK2V4QlFFZzYwSWVu?=
 =?utf-8?B?NTh4RWxxV2NKTmxETkl1alVtSFV5cUIyM005cHJpcTFBRmt2VUhCdDlQMzBp?=
 =?utf-8?B?NVptOEluUUhZTERXNzJuK3lGb2dGZG1aUjlvWVAxMUxCNTd4Y1FKL3JxNFp1?=
 =?utf-8?B?RUJFNGRWMDVSUlFCVUQ1cDdPRlBxdTNic1dieCtCcWJIQmVkQ0lFYyt6MWc3?=
 =?utf-8?B?b3I3aTZwbHNlS2x1cFNNVnBhQ0dwaFFia0lhYnFpVUNXamdQOXQrMTdOR3RN?=
 =?utf-8?B?SG9PTTgycE80eVJZZ0QrOTdQaU00VDdROHZDNklEaTVxeHF1NEkrbitxYmpp?=
 =?utf-8?B?RzdVWFd0bE1tYWNvOE1qemYxKzVET05QcC9LSHIzWmNLWEVlQnJRa1h1Vmcr?=
 =?utf-8?B?S0FKYVBDT2VZTnJTbDlmOEFHSmtMMU9WY0JNL2thY2FVejBVRDRyeWJHaUZG?=
 =?utf-8?B?bHBvVWY2U1ZxZG5HYVRIMHBNR2ZKUmJXTVQ2Tmluam81eTdnMmptSGhHNFZt?=
 =?utf-8?B?SlFZOWNwR2YrL0x1c2FWaGdqczU0MzFTTVJ3djI2Q3hiQW5oZk14UEN3cXo1?=
 =?utf-8?B?b0N1a0w3UktxRW5EMCtMOXZadmJNVXV4VnJBeU9CYUIya2ZlNUVURlliY2lj?=
 =?utf-8?B?Mk5CSXRXeDNwVUZSRGFmR2pnMENIRlU4eEFhR0lPWlJSTGMwLy9vdWN1MUVU?=
 =?utf-8?B?Y0dQTWRDMVdqdm15RVR1VDZSNGJ4YzNDM2lVeXluMzc0ZndTTDcySHllZzQ1?=
 =?utf-8?B?RGNpOGZtblgxeXFwamYxQUliM09YT3dzQW5pdmdBNVV6RG1PbVJUcjdwN1pl?=
 =?utf-8?B?ZnFyMFUzbGVhTU95dW9QUVQ2eWZZeko0Q0xCZnRUTlRKVnVWeTlzcTJ1M0hC?=
 =?utf-8?B?MitQa3dPUGVVU1VqODdaZncwYjB6UkNDdk1NcEp5VTBDaVlWcVFFbzJVcktN?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e509c4b-f198-4239-27c0-08ddb5a3e8ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 17:56:14.7505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKuslR8cs+wTtiUHs/X2ShJMyjuLdZfgU5p9b4fuS5smBvgFGO6EZhPyNVOg86JvWe0Lu/5ExyvdcM/OECtn9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

On Fri, Jun 27, 2025 at 03:37:34AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Gote, Nitin R <nitin.r.gote@intel.com>
> > Sent: 27 June 2025 13:44
> > To: Brost, Matthew <matthew.brost@intel.com>
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org;
> > joonas.lahtinen@linux.intel.com; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: RE: [PATCH] drm/xe/uapi: Add
> > DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > 
> > Hi Matt,
> > >
> > > Hi Matt and Rodrigo,
> > >
> > > > On Wed, Jun 25, 2025 at 03:28:05PM +0530, Nitin Gote wrote:
> > > > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device
> > > query
> > > > flag
> > > > > which indicates whether a device supports DIS_NULL_QUERY (Disable
> > > > > null anyhit shader query mechanism). The intent is for UMDs to use
> > > > > this query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to
> > > > > disable null query mechanism for anyhit shader by setting
> > > > > DIS_NULL_QUERY bit of RT_CTRL register for Xe2.
> > > > >
> > > > > v2:
> > > > >    - Use xe_rtp_match_first_render_or_compute() api to check
> > > > >      render_or_compute. (Tejas)
> > > > >    - Validate args->flags (Tejas/Matthew)
> > > > >    - Add proper kernel-doc for both
> > > DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
> > > > >      and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
> > > >
> > > > Matt asked for full spelling of DISABLE, no?!
> > >
> > > Thank you for clarifying the uAPI naming convention.
> > > I will update it.
> > >
> > > >
> > > > Also, where are the UMD patches/merge-requests for this? And their ack?
> > > >
> > > From the Mesa team (Palli, Tapani) is going to send the corresponding
> > > Mesa patch.
> > > Meanwhile, I floated this patch.
> > >
> > > > Thanks,
> > > > Rodrigo.
> > > >
> > > > >
> > > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 11 ++++++++++-
> > > > >  drivers/gpu/drm/xe/xe_query.c      |  3 ++-
> > > > >  include/uapi/drm/xe_drm.h          | 12 ++++++++++++
> > > > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > index fee22358cc09..ef8b49d2242a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > @@ -26,6 +26,9 @@
> > > > >  #include "xe_trace.h"
> > > > >  #include "xe_vm.h"
> > > > >  #include "xe_pxp.h"
> > > > > +#include "xe_gt_mcr.h"
> > > > > +#include "regs/xe_gt_regs.h"
> > > > > +#include "xe_rtp.h"
> > > > >
> > > > >  enum xe_exec_queue_sched_prop {
> > > > >  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> > > > > @@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct
> > > > > drm_device
> > > > *dev, void *data,
> > > > >  	u32 len;
> > > > >  	int err;
> > > > >
> > > > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > > > ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> > > > > +	if (XE_IOCTL_DBG(xe, args->flags &
> > > > > +	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT |
> > > > > +DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY)) ||
> > > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > >  		return -EINVAL;
> > > > >
> > > > > @@ -693,6 +697,11 @@ int xe_exec_queue_create_ioctl(struct
> > > > > drm_device
> > > > *dev, void *data,
> > > > >  		}
> > > > >  	}
> > > > >
> > > > > +	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
> > > > > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> > > > > +	    xe_rtp_match_first_render_or_compute(q->gt, q->hwe))
> > > > > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL,
> > DIS_NULL_QUERY);
> > > > > +
> > >
> > > Also, as per Matt's suggestion in rev1, I'm exploring the WA BB
> > > program to set this.
> > >
> > 
> > If we move this implementation from the exec queue creation time to
> > the submission time and write a WW BB program, then this register will be set
> > for every exec queue submission.
> > Let's say if submission happens 3 times, then register gets written 3 times,
> > which seems unnecessary.
> > 

No, completetly unnecessary, we have been over this. See below.

> > So, having implementation in the exec queue create time, the register will be
> > updated only once, and we can disable it in the exec queue destroy.
> > 
> > What do you think? Could you please suggest?
> 
> Hi Nitin/Matt,
> 
> Are we talking below cases,
> 
> (if kept in WA_BB) :
> User1 --> submits on rcs0 -> register will be updated for rcs0 (User2 will not be affected)
> User2--> submits at the same time on rcs1 -> register will be updated for only rcs1 (User1 will not be affected)
> 
> (if kept in exec_queue_create/destroy) :
> User1 --> creates exec_queue (register is written(not sure on which instance of rcs?) --> submits on rcs0 (User2 will be impacted if used same instance as User1, which isn't possible)
> User2--> creates exec_queue (register is written(not sure on which instance of rcs, but for sure not the instance User1 is using?) -> submits at the same time on rcs1  (User1 will be impacted if used same instance as User2, which isn't possible)
> 
> If above cases are true then both look same, isn't it? Unless I am missing something.
> 

Tejas — I'm not really following your examples, but no, writing at exec
queue creation time is not the same as writing a WA BB.

This is a very basic process isolation concept that I would expect all
KMD developers to understand. If not, then please take the time to learn
it — this isn't something I should have to explain repeatedly. A quick
Google search or a query to ChatGPT will explain process isolation quite
well. With just four queries, I got an explanation for this exact
problem, including why this must be part of the context state (i.e., the
WA BB), since work gets switched on the hardware.

Here were my chatgpt queries:

"what is process isolation"

"in a computer chip why can't you set a global register wrt to process
isolation"

"more in the context the register changes behavior of computer chip
rather than data sharing"

"say in the context of kernel submitting work on behalf of a UMD which
changes global register before each submit, why is that a bad idea"

Anyway, let me give an example of why the current implementation will
not work:

Example:
User1 wants DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY set.
User2 wants DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY cleared.

If a global register is modified at exec queue creation time (i.e., it
affects the entire GPU’s settings), then both users cannot have
different behaviors — and we’re now broken.

The only way for User1 and User2 to have different settings is to make
this part of the context state (WA BB), which dynamically modifies the
registers as work from each user is scheduled on the hardware.

Matt

> Tejas
> > 
> > Thanks,
> > Nitin
> > 
> > > > >  	q->xef = xe_file_get(xef);
> > > > >
> > > > >  	/* user id alloc must always be last in ioctl to prevent UAF */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > > > b/drivers/gpu/drm/xe/xe_query.c index e8e1743dcb1e..c5002b8c9ac0
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe,
> > > > > struct
> > > > drm_xe_device_query *query)
> > > > >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > >
> > > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > > > >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > > > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > > > +
> > 	(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > > > |
> > > > > +
> > > > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> > > > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > > > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> > > > SZ_4K;
> > > > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > index 8e8bbdec8c5c..7c30e707346c 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > > > >   *      has low latency hint support
> > > > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag
> > is
> > > > set if the
> > > > >   *      device has CPU address mirroring support
> > > > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is
> > set
> > > if
> > > > the
> > > > > + *      device has null query support for anyhit shader.
> > > > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> > > > alignment
> > > > >   *    required by this device, typically SZ_4K or SZ_64K
> > > > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > > > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> > > > 1)
> > > > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > > > 	(1 << 2)
> > > > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
> > 	(1 <<
> > > > 3)
> > > > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > > > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > > > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > > > @@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> > > > >  	/** @vm_id: VM to use for this exec queue */
> > > > >  	__u32 vm_id;
> > > > >
> > > > > +	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
> > > > > +	 *	Flag is set if the device has low latency hint support
> > > > > +	 */
> > > > >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > > > +
> > > > > +	/** DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY - \
> > > > > +	 *	flag is use to disable null query check for Anyhit shader
> > > > > +	 */
> > > > > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > > > > +
> > > > >  	/** @flags: flags to use for this exec queue */
> > > > >  	__u32 flags;
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
