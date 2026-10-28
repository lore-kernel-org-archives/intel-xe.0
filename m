Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B389F606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cELCVXW6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8281F10E07B;
	Wed, 28 Oct 2026 13:07:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB7A10E07B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793192818; x=1824728818;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ShuxsRIMBjmB9Bu2NQnWhIiwqZ6A9wOFpHYGIAou/KQ=;
 b=cELCVXW66anzaq/rZ0oNFRBhetEh9DwnF/Ji5mFm7vLV6RRF5qUA7KBo
 /+0zLyuoSeYBcOH6qXR31qMS1eelaJYl9D3psu5LsK6Ez/ZS0X1952Js0
 qHs9l7gDiG7CLz2x0lmbCdgaVmo/6SXMvVIRgLm9FPbaBg+tLduk/VbOB
 yPP1Gt9TVVMXUUFm/b6y9zbQ6XgpkpRk6N9xovEorIQIm9NOCcJ9quabY
 Huui7Yl1eSP9yk6i8C3u7QGVKHV0BK63RMoNpY7isbTrc2L67rPaG4moW
 cq70lh6L+bigJxSDObbdv6vY7Y4T9edFI3MMrhhjomcRgMydeu53fBvcS w==;
X-CSE-ConnectionGUID: +58/KLRYRBW53J7Uo19c1w==
X-CSE-MsgGUID: goo/vX57THKW9CQiHiPI2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1808321"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1808321"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:06:57 -0700
X-CSE-ConnectionGUID: 07sop34VTjOGmJ+KyCJ8RQ==
X-CSE-MsgGUID: f8oOGhR4S7qpbwpaAU46og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6658855"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:06:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 06:06:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 06:06:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 06:06:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fm8zKwwT4dG9qadGNopvFuj6qhBt5VCF+FddE+8D4cheXJC+sDBl+McAcyHsYEJPOJlccKSY3iDIqagGHQ60bo40zI7twyyv6QduTQfwwvMHrFeaw8pDrvtqgu4vOhG4EuougAkRM1IhWx/VsOADOtVrUi5nRQS9f3kE9t7tEr3S/wS62ka225Y1jB1yyRK4fatoqd7SsiiW5uONm8NsLcAL47K7zUAU3KjMK+SUnmhXla8G3cHYcAaiBp9bRfBQwMPlfa+frQGQefasnAedRpZnqYENcGPuGWW/tttKcFB0uGNWZuzFpV+kkg1ZV8als1V1ry/1j1sODKcWqRKdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94lFlQww4BRCvcYy6GrfCn8tms21KTefd2FO/13Gsw8=;
 b=kGlEKjLyrIJxcq1D3VhdaeLKn6nONUdlssZOF178cgO2VV1j66HksJZlSCRwrEprHmJaf3+yFFnJTKE7CW4wgfMEuCo9STa9KRY5GPH12mILyGe+v49tAQHHh7S1YwuifW0sW74a0LeleoiNJccRbYjIjHCe/+RnGtfpX//qSsrU4s5i8OYX44K8zM4a5LGk1b+StHkGuRccmUqBnVFi/ThgAMjdKqNq+SpD8Y8XZyZvzKUsFD1XQ1VWWzeKAI2iFHSAIFX8wpm6oW3JF7pbU8W2vQJOcJdJdhCUxXh5C6LFqz5ci3byIfJGjUwxObgbvQms+uhy5dP3TBYoHeuB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 13:06:54 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:06:53 +0000
Message-ID: <812be929-0fb2-4eb3-9cc8-310e945848cc@intel.com>
Date: Wed, 28 Oct 2026 18:36:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Store mailbox temperature data as bytes
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
 <5f4ec40b-ae68-4a04-8f57-573e02a29d3c@intel.com>
 <507815d9-811f-47ce-a449-e7cf9aeb05cf@intel.com>
 <239f14f8-87bc-4671-8564-edbe6b14481a@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <239f14f8-87bc-4671-8564-edbe6b14481a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0324.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::19) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 689ed2aa-d919-4734-03b0-08df34f455fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261022115727099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: M2jfYrQf8dnGIA0rFrH1EmMHUhx7Yj3LJ9gdDMbg9mg1XTD9pOE85Pv6bph64bqW952E0N3QYCM581i0yek0W8U9a6BPd9PAwtjZ7yimqeGF3Iv65/AGBldimZsQh9rkTpYa1IcWWdQgQuNh2Wl2PMvcSL+psDjqoXpvzx/FvQMcQn1ghBqi31Lsm20v0hp5T79pztudcSaTbaaaBJtcOHJca9sfRABtkNStbj0MzaH1U+HCMhz0ppoeQos2Jmvha2MQSPt/JtXmmS86jk3qUfHT5NRZNNtp4VvU8BKEFdgFOn3rKJz28hWwVGfJNCw7h9RBdLrCpvc1u+aYajMj18ZCpHrQ13+yy8MvfgPe3/1v4XutJtswVX2o+cVmV+uezujeQOG0XT0OYjnkyxf0XHMOUgmRLrWx6ILMw0S/V1a/+c2UdnWiFgqPFTzALUyFwmpEK/p5EQ7hdmO8Mrruyd08pNo1kChrJFAdrBQnQYhcOum9RKd8gl58Rzi/4vpr5kNjBOdyAyOOftDJ2/0XxZncBHccealvh0lPfca3QOBUBM2VFz1Q8/5JHZkjVexS40mBAX9N9QmDm4zUnwku7e9vbYC4JVmxEctTSdX+hnY104J5S9RvMVGnBHvMRT9n6Y2rLFWOwIOxNb5knnntLJ1OYi3UULvga2OmfPsScfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261022115727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFVc3dsL2JuYnpBcWhwY1NidDVLaCtYREZCeHJHNzFIV3JNRnRKR2hzQmt0?=
 =?utf-8?B?U09LbnFKUy92alZwWXlwUGt6K2hwdTNKLzZnbXlPR1NUZTZuRmFxSDdyZEt3?=
 =?utf-8?B?cjdMMnhvQUlXd3dnbWJ2SGtjeHpxTlFRR1ZqakU2VkR6UjdEUG4wL0F5VnFD?=
 =?utf-8?B?RGdNWjBsOWRtc0tPMk50MmkxbXdYTzgxNURzczU3RTgyeXhLaWtxYmdVNWY2?=
 =?utf-8?B?cmFLSzBDQkJHQnprbTVhWkZFY0hQSkJnTy9pNEdlZ1hra2FmUHBGS2lKSjZa?=
 =?utf-8?B?S1VqakQveXY2czVCMEhjNHV0WStNTnZrdEx3TGpDYnZJT04wcXBEbExrL2dW?=
 =?utf-8?B?TlhPM1p1SHp2YkNUbGxnNHRFUllaZmpHejNrUjhHdlc4c1VWaHRGd0RDa0U2?=
 =?utf-8?B?eThveUNERFFpZ1ZVWkZJWVBRemZRZVcvV0xlMk5xZGxmOVVETkdMUGY4NlhX?=
 =?utf-8?B?UlBSRWZxdURIK1JoeUhQRzhMU3NoVDdsdWdUUVBwS1lGKzVBYmpuNWorMWtZ?=
 =?utf-8?B?YWRPbFNwQlhtZlhidm0zalVOK3d2Y1pSTjFTMzd5cmhOMlpGQnd4M2s1WTJ0?=
 =?utf-8?B?TElib1dNNjM5a0t3eHI4aVRLOEYxUWxxV0Q3MDEwUHJpTUorYStRMEZkZ1FE?=
 =?utf-8?B?KzFxYTNLVG9TNHRVWUU1ekZ1eklEMmlVc0RjZm9pTUdIRlVEdmo4aVY4Q2lT?=
 =?utf-8?B?Rk05OGU0ZWJ2ekJkWm1YWjBKQzhSU0lyN282V0d2KzV3dXRQd3hINS92b1I4?=
 =?utf-8?B?S0ZkTWFTOUlJbTdUQ3ZGODJWWnV5Q1ZpcjFsM2hJei9xYjcxd0tuZnFzSjNq?=
 =?utf-8?B?eUpUUkxxcjc3cFVraWIveTVjQmNTUEozaHBoallRUTJXME5icTZXSExLWHFK?=
 =?utf-8?B?V1RHZTUvU2g4dzJkOEIrQXdqUVlLNTEyTFpjeVRMNnY5VnBmNlFOOThSNVNn?=
 =?utf-8?B?OWpBZDJPcHhTbHZBMFhzQkNWWDlmeElhWWJqSEZYSnE4Ky9rbkVPOFZ6SXNL?=
 =?utf-8?B?MlpJM1EydFBEcGMvTCsrK1l2Y0NQb2w0a0hKTGJnck1wTFVFM3NvSDJBa0hO?=
 =?utf-8?B?dTFDMVpLejFIeXRiOXZKMUNaNHBZaExhQ016elh5a20zdzN3NnZWVGZXc25j?=
 =?utf-8?B?aTZLMjF4REQ1YTZvbm91eWJoMzJIM2JObXRMUUZwZUFUSDg5eXUwSFNML3hB?=
 =?utf-8?B?UDdGd1lnaUprcHpEeFFTYWVrVmlwVHhFZ282TDMrZFRyY2taazlYZzFDVjgr?=
 =?utf-8?B?Z2N0dXA0c2dlTEMyV1dTMHhsNWVaWTUzZWp5UEFmR2hYYjcweUhMWUhSK0Nz?=
 =?utf-8?B?V3R6eVphenN1djBBRnVmOU10dWVCbVRmQkhqTWFTOU9lTlZmbklxR2JnamQ0?=
 =?utf-8?B?a0NINzlsdDlUcHBNRkFRYVRQMWdybmltSnc0N1VBOGQrS3FreXljRzQzdG5X?=
 =?utf-8?B?MWd0NlNPQnB2Zks5eHF6WmlGMWJWdDd5WTFHdkNwNCtwSTN6cnlqM1I4Vkl3?=
 =?utf-8?B?cVY2a2pXR1o2YTAwWEdnRjJxRXNpY0t3SHZURXlYSDFKaWFGUFlFMmNSZFIv?=
 =?utf-8?B?UXV3TFZlT25ab1o4WTdnZHNrZjNWMTNMbUIra3FGMUQxdUhDSUlYUXZ2dU1y?=
 =?utf-8?B?QUExbGRvQ3pqOHhrSFhEWXZVNSs4S25mcm52RmtFQVVMSlFNYklsUkFycXF4?=
 =?utf-8?B?RHN5RW1wNWYwSDNIN2ZHbFordlFweHkwUlRUZXJBTGdpWjBZRC9tL0hLdUVw?=
 =?utf-8?B?SmF6dU8vMHE5MlpYNWFYU0UraXk0Q2FTYVh3eDVBdS9WanFBdXpRYlpiVFVE?=
 =?utf-8?B?TWQ3d0F2MXh4OGdlK2lLN1kxM0x4Z3ZoZWVQVE1JbWZCd09CT3EwZUc4WWJq?=
 =?utf-8?B?ZFVnWkNrbHdkdW5HOVNVQmRqTXBROFZHdTZjeVUwQjVhY0NwY3VjUDQ4MmxC?=
 =?utf-8?B?Wmp5a21YT1ZrdlhjZVR0YXdSVnJhTE1WSjM1V1NMdFhOK1VJVndKRFVCa3Yz?=
 =?utf-8?B?Uko5ZytwRjNCZTJCRjFtNGdkY3ZMdmQrcmtKWURnT01HakE0d0xtVWk1RWt1?=
 =?utf-8?B?UjlqUzV0cGwweklLamhtNDZ5dlZGeE9pKzE0YmZMNWdGU2lCSWpXVnNodmtT?=
 =?utf-8?B?aldBMnJqb1VBY0lqSDV3MDl3OHAzWCt1d0pOUGtweU9ETmhwbWtPM1hNL1dK?=
 =?utf-8?B?Sml0U1hZcVpob00xbDQrL2hkS0VidEdUQlkvYVFQNXJrcWU0UmNicWxneGY2?=
 =?utf-8?B?VFZVZHh1ODNEOE1wWEdCZWxnZWNlVWl1NThjYTN2eVdUMzNVbnRsZG9qNTJ4?=
 =?utf-8?B?dnZRd213c25YQnRYRHlOUnBQazJVSnhzbkVMVUh3UUd5SzJLTGh3WkFGR3lW?=
 =?utf-8?Q?0pJdRrvU3TR1U77U=3D?=
X-Exchange-RoutingPolicyChecked: Y2qNuuDsTJ4cu4X4oEPsEfLpT4M8ssTwq9/JsczQMOaaTBiBSfMgDNAIthSGh2l/A/clZ/cYtUOU3n8mrV55GHKEcASZLqQh4xfskm5cffQyQ9T7L16ZyyVltjBkwS8QmR5TsEImTaQlHAlVZ/74tRvIKypmj9alAD0Z2Ds6u6RwF3kndaXvcCz4KGUlpCkpAUJDMeH6oNfuq05r3Ax81M86O3S9fPCuVuaFTvuaDXgdgPoIRteRkqEjjE/CL8uzdEjQwEp9tv9a6233HyP8OuN/7Bb9de7uvsYh/Igb/CThOvmvi8d7+2PkRW7P8KcmnM6a1k//oyj0JtRsFTsQqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 689ed2aa-d919-4734-03b0-08df34f455fb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:06:53.3160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrTbaiDdBCa3P7i9RQ65ctmfs+HP9ip04pP3HDm2f4Bs1In4n1cqhUQcoPYOInxDbA9PqNvzXip+sMbxlbgrQsdc7Fp3R0bXh7W0GSGqEXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 05:06 pm, Poosa, Karthik wrote:
>
> On 26-10-2026 17:24, Mallesh, Koujalagi wrote:
>>
>> On 26-10-2026 04:47 pm, Poosa, Karthik wrote:
>>>
>>> On 23-10-2026 16:06, Mallesh Koujalagi wrote:
>>>> Store pcode mailbox temperature data directly in the byte array
>>>> using put_unaligned_le32() instead of accessing it through
>>>> different views of the same storage.
>>>>
>>>> This keeps the layout unchanged and makes the data access
>>>> consistent and endian-safe.
>>>
>>> 1. Is this patch addressing any issue reported by a static analysis 
>>> tool?
>>>
>> Yes, it's reported by static analysis tool.
>>> 2. Given that |cpu_to_le3()| already handles endianness, do we still 
>>> need this change?
>>
>> Yes, cpu_to_le32() already handles endianness correctly. The main 
>> reason for this change is not
>>
>> to fix an endianness issue, however to address the static analysis 
>> warning about inconsistent union access.
>>
>> The code writes data through temp.dword[] and later reads it through 
>> temp.value[], which was flagged as
>>
>> inconsistent access.
>>
>> To avoid that used put_unaligned_le32 writes directly into the byte 
>> array that is later
>>
>> read, making the access pattern consistent.
> I understand the static-analysis warning about writing through 
> |dword[]| and reading through |value[]|. However, since |value[]| is 
> accessed as |u8|, there should be no alignment issue, and 
> |cpu_to_le32()| already provides the expected byte representation. Is 
> there any known functional issue with the current code, or is this 
> change solely to address the static-analysis warning?

Agree, no alignment or endianness issue since we are using cpu_to_le32() 
which provides the correct byte representation. This is purely a 
code-hygiene cleanup to silence the static analysis warning via 
put_unaligned_le32 so I'll drop the Fixes: tag and add no functional 
change. Please let me know.


Thanks,

-/Mallesh

>>
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>
>>>>
>>>> Fixes: ca6e33701de8 ("drm/xe/hwmon: Fix thermal sensor data handling")
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_hwmon.c | 15 ++++++++-------
>>>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index 42acfeb8818c..7bb1223dc30b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -7,6 +7,7 @@
>>>>   #include <linux/hwmon.h>
>>>>   #include <linux/jiffies.h>
>>>>   #include <linux/types.h>
>>>> +#include <linux/unaligned.h>
>>>>   #include <linux/units.h>
>>>>     #include <drm/drm_managed.h>
>>>> @@ -165,12 +166,12 @@ struct xe_hwmon_thermal_info {
>>>>       bool available[CHANNEL_MAX];
>>>>       /** @msu_mask: VRAM subsystem enable mask read from MMIO */
>>>>       u32 msu_mask;
>>>> -    union {
>>>> -        /** @value: per-sensor raw mailbox temperature; bit7=sign, 
>>>> bits6:0=magnitude */
>>>> -        u8 value[U8_MAX + 1];
>>>> -        /** @dword: sensor values as little-endian dwords, 
>>>> u32-aligned for pcode reads */
>>>> -        __le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>>>> -    };
>>>> +    /**
>>>> +     * @value: per-sensor raw mailbox temperature; bit7=sign, 
>>>> bits6:0=magnitude.
>>>> +     * Written one dword at a time via put_unaligned_le32() to
>>> Written -> Write
>>>> +     * avoid inconsistent union access between dword and byte views.
>>>> +     */
>>>> +    u8 value[U8_MAX + 1];
>>>>       /** @vram_label: vram label names, dynamically allocated 
>>>> based on vram_count */
>>>>       char (*vram_label)[MAX_LABEL_SIZE];
>>>>   };
>>>> @@ -995,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, 
>>>> long *val)
>>>>           if (ret)
>>>>               return ret;
>>>>           drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 
>>>> 0x%x\n", i, data);
>>>> -        hwmon->temp.dword[i] = cpu_to_le32(data);
>>>> +        put_unaligned_le32(data, &hwmon->temp.value[i * 
>>>> sizeof(u32)]);
>>>>       }
>>>>         for (i = start; i < end; i++) {
