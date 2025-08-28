Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC88ACA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 20:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1A310EAB9;
	Thu, 28 Aug 2025 20:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAEmtQZV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2362A10EAB9
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756412459; x=1787948459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=er4z8tbOuvTFO9sVcUg66pZQxJIuSkuZDXgdinBdNyI=;
 b=JAEmtQZVhcSrZcfswPDgACdv/07du1uox/8ApWt4Djai7um6Hxs0DFN5
 Qod2icHgf47hDt1QPf7DmLFgG96sX6mT5yeX11EfsyxL3oy9vX+2HS2bL
 TzEh2Hgb9vfPjMsUEyA8jVsyPABG6Qmu1y5zodD3e9JKjirxL4PpdUxmz
 xLHe4BICemccTdtPK+PZR0C8Xc9oh7I0ElBG6i5ZTRedS6pub9MSZcgiG
 pJ5v5SQOScOsv0BciB/cGcSntJdcAnvNLyRGnyYAX8Wr9YxBsnx/wZGbs
 g1QaAx7m8Ce2k50/3NkVgBNWMbsy68Vb9NCmfcdOPM4ts/PD+VanIZusE g==;
X-CSE-ConnectionGUID: 9wJmhnYIQSSaZHK2Koq44g==
X-CSE-MsgGUID: oH2xI5YHQqejl+CcUcrihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="68971177"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="68971177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:20:58 -0700
X-CSE-ConnectionGUID: Pdfy3ATNRNe4xKx+9GONdw==
X-CSE-MsgGUID: vkKuWk47Q+C5BTQlLOOglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="207353823"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:20:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:20:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:20:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.43)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:20:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeYPxaljR/HRbkLhGInEJnPAocb+oqTNu3J8IakmMj3Il4r6Cdp4x6vqGYrstmUI/yfjeIAsXBOgaChlmzdFPn9KvUzRZFD4etra7fo5mIClH5fZrOiIUYdl3QdOYf8dgPDbrGoSCi+SwI0xIzfe7+8n+OiaMkU8L41E/NeVD1Pr4G3az03ACcjCpLb1uIWOuet+cd1M5kVW7+4pUUfCPT3ZjdG7WkwMBEd9nGNmIDOrmsxTm+Du9g1NiaDYh+y102Vljkn1CzcQLQ3BAsvi3TmDVDqrEbKST5jH3BaWHO9XR+HyCHVFHrF0GYMTJAak/aPSMar7xO9e2e1IXO6vAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRg9Uasfra7qGkLXRVv17vNrZzVAHOgLHMjAEyZjRj4=;
 b=bTDawRTsW+CLgfHV5TpAErFyESAbtdEdZX4TjHvjL6Yrv5vptsPJQQS2CLYCgirR5I/3b9OBL8SuMPi+wxgjRS8ZuCGZKG6gtZhXIxm/WsXMu/fEjZZ2sHV9vIbQU/5XPwVaWdJryI3d5GQACcAftqNHXJdpf1MX0qv2f33wKIrtOj5cnr4UJW0wZO0BUqGv5K3KuneXozMJBvIMEfUFE4vAGHzurFH623TR7/YDXI8sTb/eCAfq2+oRWo+96mBk8Hf1PTgzSWpEX6vNhQ/g/mlhbffbOI0xqaWtAJ6LH2EX0VqEt1Z/lSI95P7kYrlpvYz4FI3Rmb4WF2toOgY95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.23; Thu, 28 Aug
 2025 20:20:51 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 20:20:51 +0000
Date: Thu, 28 Aug 2025 13:20:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aLC6IKv+W3EC36qx@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <afdc621f35edb08a9c161e4e08bfa5c74eecad1f.camel@intel.com>
 <aJPq9KNMFVegkdkN@lstrano-desk.jf.intel.com>
 <34a741ad4bf9765e3ca98eba65b1ebc4ee8730e4.camel@intel.com>
 <aJTsFpVkoH77b6A0@lstrano-desk.jf.intel.com>
 <c0a4dda50822a073b6685163f29df1e3e6129e92.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0a4dda50822a073b6685163f29df1e3e6129e92.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 8357aa3e-317d-446e-f29f-08dde6706211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTk5T0pBUFhtRHB3Y3Y1cDJVUHMxRzhqYmpSSjNVS1FkdHJ2Y0dmUnhCcml1?=
 =?utf-8?B?a01DbDRldUV1T0xic3c5T2VCckNOMWg4cjVzK3pITjdnMEZWNStWN1lRSXh5?=
 =?utf-8?B?MWFQRUNXb0p4Z0dRRjJRZi81dC9qV2dCL2o2OXprN1J1S0pzdVFxdkk1VnRD?=
 =?utf-8?B?aGZ3NWFNMnh4d2x6ZVZvZHZ5Y05ySmRWNzlLNmExR2VSYjZBdkhRa3d3Vjdu?=
 =?utf-8?B?bnJrSDZNNTk1UVlSbTZNNmFwS0ZpZTBkenJDT0ltcndVT3ZKZ2dPMFBZalgv?=
 =?utf-8?B?aGcrbmpGY05aZ2VIMEJ4cFZoZjJkaXU4MzBMZjF3WjVTSy9xOG5iMnEyOVYy?=
 =?utf-8?B?RGFSUHlHTisyaHpMSGRsSkNJZ1RxenNmS0owcXBSUkVLd29GcjBPQnFSUFBU?=
 =?utf-8?B?aGtZWnhCeUtRczVlV2VYMW1xM3NtSnlOUElaTStNY0NxUlJIMEY1ZnB3R3M1?=
 =?utf-8?B?VnNUOHpVNlFheXJORHpCOEg3ZUk4WmZQVUgrQXlENE9XWjlDT05QeWZhejdr?=
 =?utf-8?B?aEpzTUUxcEpGVFA5dkpMTHJ3WTM2WCtHaEdSMkliUWNNTjRRc1BLdk44YlJn?=
 =?utf-8?B?emZRZzhGU2RMZTNHMzcxZklQdHR2c1dGaFlPKzZ4UnltbTZzeHlrZ1VTTG5J?=
 =?utf-8?B?cFRWWkNabUgzVHhyRmwwd1V5SHBCb1dZUFNJVTk0Q3BPQnFRbW0xUXdMOGtM?=
 =?utf-8?B?dzNRaW1ocWgxeXFzWHM0SDRyYkV5d2NVMllqdkhNL2FtdTg3OW5JblZMdlFV?=
 =?utf-8?B?K0lYOERVSGJmT3duOEp4V0N6L2JhSUhOSDl4MkVzWHVxNXRXUk1tKzlta0E0?=
 =?utf-8?B?djhmcXdoOUFMY2FiYmVtRDQrZVlYZzJPS2NzeGRUY0N6VU40TVRkbXFucnFv?=
 =?utf-8?B?ek81aXRBYk15RTRuaUt2N3lrR1pXeFRjRG9mdHYwSDhXdXBFTGx5OUZFSEdJ?=
 =?utf-8?B?ZlFONE9TMStqNEs5NnlKdWZsY1JQSjFiWE9zbmtIcHdrbVZvQm1CWVZDd2oz?=
 =?utf-8?B?cFBkWXpSdFRWY1FEWDBYeVBRV1ZzSWY1N0gwNGNzb1FiNVh2ZXdGUCttSy9D?=
 =?utf-8?B?RFhPcHhqSzB3OE1zeUpYenUweFluWFYxMlBqYzBZaUlXU0t2Sm5yemc0Tk9y?=
 =?utf-8?B?RG5ZTllnOThSL3dEOUd1QWxUZEFZU1gvMm5wWHF1ZFZNVUtWOUNyOHBELzFN?=
 =?utf-8?B?alNaa0MvMTJBcml5ek1BMmwzblBBS1ZibmdEcGREZ21FMlpZN2VWekNvc3Y1?=
 =?utf-8?B?bktxQWNuZzlFdUFDWlduNTBRNWtyRGQrWW1BcUh4aUhGV1BwSCtBVzRmemly?=
 =?utf-8?B?d0lCVGFyM2h1VlBKSlhKbitIZ3owWjNFNy95N2tLR2NiNmJDdkMydTVBY0dF?=
 =?utf-8?B?dklFTStBcjNzMm9pdFM5VzlucHFZK2dCZkVteEdINUkvUUdYSTl5K3dnVE1F?=
 =?utf-8?B?SVlyZ2FWaGlZeGNkYythazhHd2M4MUh4NnR4Ulk1cGF3anZ5ODc5ZjBldmZx?=
 =?utf-8?B?dHJ0L0pUZkZKTmQ0dWNTNkdEVVV1eW1NOU5oMFFYVSszMkJDNnUvNlg2L1c3?=
 =?utf-8?B?N3h4MjhpVHRta2JKTzRMZVlUOFB2L0lDL0Y3NVloSitlcCt6VDQ1Sm12SHJK?=
 =?utf-8?B?dHlsQ3NWSW9uUHVhak9hQ2VqcDFHTVNxY1R0N3ZUb0d6Z3RLQjM2cHlwSnZp?=
 =?utf-8?B?WEt2alNWRFBPc1p4N0dIQ09QWE9aUm5GSEc2UW5XYVI1Qy8wcHpIS3MzSmdL?=
 =?utf-8?B?S2EySjNzYWZLWDJVekhvcVBpNzFzOEpaSElSL3lNWmhpTk1PSkVnOGhBT1hT?=
 =?utf-8?Q?Aq7M9bziDXYwV0mWQk65NESqNfenBOOkC1hP4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1zeHp2MmRhaEkvTzJrWnFUc3ZMZWZDM25CRkVmM2JacHg0YUJCaEJkZkg2?=
 =?utf-8?B?YUVpMFI4RGF6TjN2VkpQSnVtMlhzWkp0THZ4a3N6U29xblFsQWVvS2RhcE1u?=
 =?utf-8?B?ZHg2NlZnTjBoSUNZc25BRUJkMWxCTzFYcVQ3Um5mM2JuNU4reEpLdFAxL3ND?=
 =?utf-8?B?OHpkVmlUSlpaK2ZkTGpXeFMrNEhmYkxxbHdVYkk2ZWFjcWhjTmZYanNPdnlY?=
 =?utf-8?B?bGM2b2N5bFdma0xyTHNYNW9Yd3lscGg2dlFGZDZybmVTVE9manVleGo0ZE0r?=
 =?utf-8?B?MGZNbU9BSzFKUjRWSVJTcVBCdHljU1lCVmxYRzdFRHB3emJWRFBIbnltQWsr?=
 =?utf-8?B?VUVyZUhYR3BHaWtWUkltbW4zZkhPa1lpL3FHdEJhUGJsc1hJUzNLV0lXbnVL?=
 =?utf-8?B?Q3NUMGw4bEZmdEloc05ucjhhRExnZ2I5UXZzMFdjWW5LL3JqMjhJNkpxcWlB?=
 =?utf-8?B?S3lxdUpKai9lTlplNWd5dHEvUDErcTFnZzZVSHo5WlJUb0RzRkl3SWpHQUFS?=
 =?utf-8?B?K2s2ZHp1ajQwUERjWnN4eHlqSFhmRTdKUXdxL1BDSVNyVEpXaE1ZdGRPeU5l?=
 =?utf-8?B?RFI2cGN1cEMwMkdjbTYwbUxGWVFyV3JmKzluMUc2UStqRE4vTSttOVJYN1Jk?=
 =?utf-8?B?b1R4elZGdHlsUUxXcDA4Nkh1OTlxL3lMOUlzdEoxRHVFb2lHSEFQZlFvMDRG?=
 =?utf-8?B?ejNWeFlRV1hqYmNHenhpdDdWcWVKVTV3ZTVOZ1c4WDIvWVcrL05iUUNTRFV1?=
 =?utf-8?B?RXMyQWNKNzdRVUdmVFYrcThEY1lvMmNBWnRkdmZTeDFOb1U4TXgxYXVEdHND?=
 =?utf-8?B?UFQ2cHJlYkI3VlRCSmlnTVlUdWNxeko2OC9PSEVqYUFwL1U1WHVVMWdMY0FB?=
 =?utf-8?B?SFFBNGFRMXFQTkZRZTIvRkNiaEhGODU3WjEwbEIxK3lldy8xeG1LRDlVVlFT?=
 =?utf-8?B?WW5HSkwzY054L25NMm0xMDVjVE9iaTlqbkxRdmhvU3FXa01RMVluQXJLU0Fp?=
 =?utf-8?B?aHZVR2ltbmR3ZzZjdVNDb2hKNzBrWlMwenV0V0g4eUk4L0JYNDRCSHNQWklT?=
 =?utf-8?B?NENiZGpmTDlWMlFBT09QRGpiNExhUGtSMDE3UHBXWGE4QjVyMDJpM0J1amcr?=
 =?utf-8?B?WmNlUHU1UDU2ZVh5S3dKTklzLys0Z1lFREV2MXNzYzlCNHBNQng2L3NCN0xC?=
 =?utf-8?B?ZHhhN2JMYVpvTUE2N0U3YW1NK3drbnVGWnc2SkVNbCszeHBUaVRNRXlwOVcv?=
 =?utf-8?B?ZmVCdDZGYlF2T1FoWVhWTkMrNncxbkQ2OHRuTTRQUWgzSU1FYmlkWkJhVThT?=
 =?utf-8?B?OXhWL0ZtamtSeHc1NVNsY0Q0Y2hBaGM5NGNmZkxYcEtlVmkyaG9UTjVjK2xD?=
 =?utf-8?B?T0lGZWExWURZYzNjUlAxTHQ0MWxlSW4rVXV6cWtBVTJML0xvdExYeFJqQU9t?=
 =?utf-8?B?QkYzbnlpaWRnYURxNXRNK1p3UnlvaGJlaWxGaU04RUwzV1Bxd2RNZDYxejBL?=
 =?utf-8?B?ZVJ6MzZoUk9XREYxK2hibnVhUGZWb1BmMDlJTFV1OWFTWGNzNEdRdkFHSjlx?=
 =?utf-8?B?Wk1hVGp0cldkT1JBN1ZoSStNOEc1eTV6OFNKcitvNW1kOE1VK3RQdlNSL1Bx?=
 =?utf-8?B?WEhDck5DNGwzQnZ5czJjM1pEYm9YRGxpbDg4dUt4VmdhS2s4eWxPaWY1MGZT?=
 =?utf-8?B?OWU2alY2OFpjREZMMzZkK3dCV0pmUjZWNTV0MXlJaDliZHdZS3VQd2tjOVZS?=
 =?utf-8?B?U2JNTHh4UFQyVDU1UmV0S0RGMWFLdnFLMkM5aU5yUW9BaXh4R2g5QXJNOU1h?=
 =?utf-8?B?VEZlUFZPUXFSdVM2TGVybitOMURqSkpEUDN6L2crSXVGazVCWkdBZlU2bTZh?=
 =?utf-8?B?NmlnbXh3c0FwUUsweHNLVWZqWkw2Sy83VG9rRTdPVFhhWVVTZ2xJdmwzL095?=
 =?utf-8?B?NHI3Z0Izam1DZldzbDZOcDRRTE9EeHZJNlpic1NtSkRoSXhRS2JZS1FEa040?=
 =?utf-8?B?OW4rTmNkak14UFoyMFZiMlZWc1E2WkJRMjRJNjZadnUwdnVETjBLWnpZd1Bp?=
 =?utf-8?B?SDJLcnJqbjJtNmZtZWZMNHh1bHk4L21hSDRpdERkOXJ1UThrc1duT2ZDUHg2?=
 =?utf-8?B?MFN6MnFyM2lLdWI0ZGl3bmwwYWJpN240UDQ3cFB0azlXanduS3Z1ZG10QnFs?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8357aa3e-317d-446e-f29f-08dde6706211
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 20:20:51.4603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0+UCn87Ef0LSz3H3gT3vhb94jMui0N5jXPmxze9KT+dU1f1QvGkyef7R3lM7TvcPfMq1R+nGgVVVAlkjJZWfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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

On Thu, Aug 28, 2025 at 02:18:30PM -0600, Summers, Stuart wrote:
> On Thu, 2025-08-07 at 11:10 -0700, Matthew Brost wrote:
> > On Thu, Aug 07, 2025 at 11:20:06AM -0600, Summers, Stuart wrote:
> > > On Wed, 2025-08-06 at 16:53 -0700, Matthew Brost wrote:
> > > > On Wed, Aug 06, 2025 at 05:01:12PM -0600, Summers, Stuart wrote:
> > > > > Few basic comments below to start. I personally would rather
> > > > > this
> > > > > be
> > > > > brought over from the existing fault handler rather than
> > > > > creating
> > > > > something entirely new and then clobbering the older stuff -
> > > > > just
> > > > > so
> > > > > the review of message format requests/replies is easier to
> > > > > review
> > > > > and
> > > > > where we're deviating from the existing external interfaces
> > > > > (HW/FW/GuC/etc). You already have this here though so not a
> > > > > huge
> > > > > deal.
> > > > > I think most of this was in the giant blob of patches that got
> > > > > merged
> > > > > with the initial driver, so I guess the counter argument is we
> > > > > can
> > > > > have
> > > > > easy to reference historical reviews now.
> > > > > 
> > > > 
> > > > Yes, page fault code is largely just a big blob from the original
> > > > Xe
> > > > patch that wasn't the most well thought out code. We still have
> > > > that
> > > > history in the tree, just git blame won't work, so you'd need to
> > > > know
> > > > where to look if want that.
> > > > 
> > > > I don't think there is a great way to pull this over, unless
> > > > patches
> > > > 2-7
> > > > are squashed into a single patch + a couple of 'git mv' are used.
> > > 
> > > No definitely don't think that's worth it. Let's just review as-is.
> > > 
> > > > 
> > > > > On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > > > > > Stub out the new page fault layer and add kernel
> > > > > > documentation.
> > > > > > This
> > > > > > is
> > > > > > intended as a replacement for the GT page fault layer,
> > > > > > enabling
> > > > > > multiple
> > > > > > producers to hook into a shared page fault consumer
> > > > > > interface.
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/Makefile             |   1 +
> > > > > >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> > > > > >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125
> > > > > > ++++++++++++++++++++++++
> > > > > >  4 files changed, 208 insertions(+)
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > > b/drivers/gpu/drm/xe/Makefile
> > > > > > index 8e0c3412a757..6fbebafe79c9 100644
> > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> > > > > >         xe_nvm.o \
> > > > > >         xe_oa.o \
> > > > > >         xe_observation.o \
> > > > > > +       xe_pagefault.o \
> > > > > >         xe_pat.o \
> > > > > >         xe_pci.o \
> > > > > >         xe_pcode.o \
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > > > > > b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..3ce0e8d74b9d
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > > > @@ -0,0 +1,63 @@
> > > > > > +// SPDX-License-Identifier: MIT
> > > > > > +/*
> > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#include "xe_pagefault.h"
> > > > > > +#include "xe_pagefault_types.h"
> > > > > > +
> > > > > > +/**
> > > > > > + * DOC: Xe page faults
> > > > > > + *
> > > > > > + * Xe page faults are handled in two layers. The producer
> > > > > > layer
> > > > > > interacts with
> > > > > > + * hardware or firmware to receive and parse faults into
> > > > > > struct
> > > > > > xe_pagefault,
> > > > > > + * then forwards them to the consumer. The consumer layer
> > > > > > services
> > > > > > the faults
> > > > > > + * (e.g., memory migration, page table updates) and
> > > > > > acknowledges
> > > > > > the
> > > > > > result back
> > > > > > + * to the producer, which then forwards the results to the
> > > > > > hardware
> > > > > > or firmware.
> > > > > > + * The consumer uses a page fault queue sized to absorb all
> > > > > > potential faults and
> > > > > > + * a multi-threaded worker to process them. Multiple
> > > > > > producers
> > > > > > are
> > > > > > supported,
> > > > > > + * with a single shared consumer.
> > > > > > + */
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_pagefault_init() - Page fault init
> > > > > > + * @xe: xe device instance
> > > > > > + *
> > > > > > + * Initialize Xe page fault state. Must be done after
> > > > > > reading
> > > > > > fuses.
> > > > > > + *
> > > > > > + * Return: 0 on Success, errno on failure
> > > > > > + */
> > > > > > +int xe_pagefault_init(struct xe_device *xe)
> > > > > > +{
> > > > > > +       /* TODO - implement */
> > > > > > +       return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_pagefault_reset() - Page fault reset for a GT
> > > > > > + * @xe: xe device instance
> > > > > > + * @gt: GT being reset
> > > > > > + *
> > > > > > + * Reset the Xe page fault state for a GT; that is, squash
> > > > > > any
> > > > > > pending faults on
> > > > > > + * the GT.
> > > > > > + */
> > > > > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt
> > > > > > *gt)
> > > > > > +{
> > > > > > +       /* TODO - implement */
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_pagefault_handler() - Page fault handler
> > > > > > + * @xe: xe device instance
> > > > > > + * @pf: Page fault
> > > > > > + *
> > > > > > + * Sink the page fault to a queue (i.e., a memory buffer)
> > > > > > and
> > > > > > queue
> > > > > > a worker to
> > > > > > + * service it. Safe to be called from IRQ or process
> > > > > > context.
> > > > > > Reclaim safe.
> > > > > > + *
> > > > > > + * Return: 0 on success, errno on failure
> > > > > > + */
> > > > > > +int xe_pagefault_handler(struct xe_device *xe, struct
> > > > > > xe_pagefault
> > > > > > *pf)
> > > > > > +{
> > > > > > +       /* TODO - implement */
> > > > > > +       return 0;
> > > > > > +}
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h
> > > > > > b/drivers/gpu/drm/xe/xe_pagefault.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..bd0cdf9ed37f
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > > > > > @@ -0,0 +1,19 @@
> > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > +/*
> > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef _XE_PAGEFAULT_H_
> > > > > > +#define _XE_PAGEFAULT_H_
> > > > > > +
> > > > > > +struct xe_device;
> > > > > > +struct xe_gt;
> > > > > > +struct xe_pagefault;
> > > > > > +
> > > > > > +int xe_pagefault_init(struct xe_device *xe);
> > > > > > +
> > > > > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt
> > > > > > *gt);
> > > > > > +
> > > > > > +int xe_pagefault_handler(struct xe_device *xe, struct
> > > > > > xe_pagefault
> > > > > > *pf);
> > > > > > +
> > > > > > +#endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..fcff84f93dd8
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > > > @@ -0,0 +1,125 @@
> > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > +/*
> > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > > > > > +#define _XE_PAGEFAULT_TYPES_H_
> > > > > > +
> > > > > > +#include <linux/workqueue.h>
> > > > > > +
> > > > > > +struct xe_pagefault;
> > > > > > +struct xe_gt;
> > > > > 
> > > > > Nit: Maybe reverse these structs to be in alphabetical order
> > > > > 
> > > > 
> > > > Yes, that is the preferred style. Will fix.
> > > > 
> > > > > > +
> > > > > > +/** enum xe_pagefault_access_type - Xe page fault access
> > > > > > type */
> > > > > > +enum xe_pagefault_access_type {
> > > > > > +       /** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type
> > > > > > */
> > > > > > +       XE_PAGEFAULT_ACCESS_TYPE_READ   = 0,
> > > > > > +       /** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access
> > > > > > type */
> > > > > > +       XE_PAGEFAULT_ACCESS_TYPE_WRITE  = 1,
> > > > > > +       /** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access
> > > > > > type
> > > > > > */
> > > > > > +       XE_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
> > > > > > +};
> > > > > > +
> > > > > > +/** enum xe_pagefault_type - Xe page fault type */
> > > > > > +enum xe_pagefault_type {
> > > > > > +       /** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > > > > > +       XE_PAGEFAULT_TYPE_NOT_PRESENT           = 0,
> > > > > > +       /** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write
> > > > > > access
> > > > > > violation */
> > > > > > +       XE_PAGEFAULT_WRITE_ACCESS_VIOLATION     = 1,
> > > > > > +       /** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic
> > > > > > access
> > > > > > violation */
> > > > > 
> > > > > XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION ->
> > > > > XE_PAGEFAULT_ACCESS_TYPE_ATOMIC
> > > > > 
> > > > 
> > > > The intended prefix here is 'XE_PAGEFAULT_TYPE_' to normalize the
> > > > naming
> > > > with 'enum xe_pagefault_type'.
> > > 
> > > Ah sorry you're right. I also should have been more specific that I
> > > meant this should be ATOMIC access vs WRITE access, so:
> > > XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION
> > > 
> > > > 
> > > > > > +       XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION    = 2,
> > > > > > +};
> > > > > > +
> > > > > > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > > > > > +struct xe_pagefault_ops {
> > > > > > +       /**
> > > > > > +        * @ack_fault: Ack fault
> > > > > > +        * @pf: Page fault
> > > > > > +        * @err: Error state of fault
> > > > > > +        *
> > > > > > +        * Page fault producer receives acknowledgment from
> > > > > > the
> > > > > > consumer and
> > > > > > +        * sends the result to the HW/FW interface.
> > > > > > +        */
> > > > > > +       void (*ack_fault)(struct xe_pagefault *pf, int err);
> > > > > > +};
> > > > > > +
> > > > > > +/**
> > > > > > + * struct xe_pagefault - Xe page fault
> > > > > > + *
> > > > > > + * Generic page fault structure for communication between
> > > > > > producer
> > > > > > and consumer.
> > > > > > + * Carefully sized to be 64 bytes.
> > > > > > + */
> > > > > > +struct xe_pagefault {
> > > > > > +       /**
> > > > > > +        * @gt: GT of fault
> > > > > > +        *
> > > > > > +        * XXX: We may want to decouple the GT from
> > > > > > individual
> > > > > > faults, as it's
> > > > > > +        * unclear whether future platforms will always have
> > > > > > a GT
> > > > > > for
> > > > > > all page
> > > > > > +        * fault producers. Internally, the GT is used for
> > > > > > stats,
> > > > > > identifying
> > > > > > +        * the appropriate VRAM region, and locating the
> > > > > > migration
> > > > > > queue.
> > > > > > +        * Leaving this as-is for now, but we can revisit
> > > > > > later
> > > > > > to
> > > > > > see if we
> > > > > > +        * can convert it to use the Xe device pointer
> > > > > > instead.
> > > > > > +        */
> > > > > 
> > > > > What if instead of assuming the GT stays static and we
> > > > > eventually
> > > > > remove if we have some new HW abstraction layer that isn't a GT
> > > > > but
> > > > > still uses the page fault, we instead push to have said
> > > > > theoretical
> > > > > abstraction layer overload the GT here like we're doing with
> > > > > primary
> > > > > and media today. Then we can keep the interface here simple and
> > > > > just
> > > > > leave this in there, or change in the future if that doesn't
> > > > > make
> > > > > sense
> > > > > without the suggestive comment?
> > > > > 
> > > > 
> > > > I can remove this comment, as it adds some confusion. Hopefully,
> > > > we
> > > > always have a GT. I was just speculating about future cases where
> > > > we
> > > > might not have one. From a purely interface perspective, it would
> > > > be
> > > > ideal to completely decouple the GT here.
> > > >  
> > > > > > +       struct xe_gt *gt;
> > > > > > +       /**
> > > > > > +        * @consumer: State for the software handling the
> > > > > > fault.
> > > > > > Populated by
> > > > > > +        * the producer and may be modified by the consumer
> > > > > > to
> > > > > > communicate
> > > > > > +        * information back to the producer upon fault
> > > > > > acknowledgment.
> > > > > > +        */
> > > > > > +       struct {
> > > > > > +               /** @consumer.page_addr: address of page
> > > > > > fault */
> > > > > > +               u64 page_addr;
> > > > > > +               /** @consumer.asid: address space ID */
> > > > > > +               u32 asid;
> > > > > 
> > > > > Can we just call this an ID instead of a pasid or asid? I.e.
> > > > > the ID
> > > > > could be anything, not strictly process-bound.
> > > > > 
> > > > 
> > > > I think the idea here is that this serves as the ID for our
> > > > reverse
> > > > VM
> > > > lookup mechanism in the KMD. We call it ASID throughout the
> > > > codebase
> > > > today, so we’re stuck with the name—though it may or may not have
> > > > any
> > > > actual meaning in hardware, depending on the producer. For
> > > > example,
> > > > if
> > > > the producer receives a fault based on a queue ID, we’d look up
> > > > the
> > > > queue and then pass in q->vm.asid.
> > > > 
> > > > We could even have the producer look up the VM directly, if
> > > > preferred,
> > > > and just pass that over. However, that would require a few more
> > > > bits
> > > > here and might introduce lifetime issues—for example, we’d have
> > > > to
> > > > refcount the VM.
> > > 
> > > Yeah I mean some of those problems we can solve if they come up
> > > later.
> > > Just thinking having something more generic here would be nice. But
> > > I
> > > agree on the cross-KMD usage. We can keep this and change it more
> > > broadly if that makes sense later.
> > > 
> > 
> > I think the point here is we are always going to have a VM which is
> > required by the consumer to service the fault, the producer side
> > needs
> > parse the fault and figure out a known value in the KMD which
> > corresponds to a VM and pass it over. We call this value asid today
> > (also the name of hardware interface + what we program into the LRC)
> > but
> > could rename this everywhere in KMD if that makes sense. e.g.,
> > kmd_vm_id (vm_id is a user space name / value which means something
> > different).
> 
> Ok for now no problem. I agree this is consistent in the driver anyway
> so better to make a more holistic change if we do that. I do like the
> idea of having this more generic to allow all types of fault
> originators. We can look later though.
> 
> > 
> > > > 
> > > > > > +               /** @consumer.access_type: access type */
> > > > > > +               u8 access_type;
> > > > > > +               /** @consumer.fault_type: fault type */
> > > > > > +               u8 fault_type;
> > > > > > +#define XE_PAGEFAULT_LEVEL_NACK                0xff    /*
> > > > > > Producer
> > > > > > indicates nack fault */
> > > > > > +               /** @consumer.fault_level: fault level */
> > > > > > +               u8 fault_level;
> > > > > > +               /** @consumer.engine_class: engine class */
> > > > > > +               u8 engine_class;
> > > > > > +               /** consumer.reserved: reserved bits for
> > > > > > future
> > > > > > expansion */
> > > > > > +               u64 reserved;
> > > > > 
> > > > > What about engine instance? Or is that going to overload
> > > > > reserved
> > > > > here?
> > > > > 
> > > > 
> > > > reserved could be used to include 'engine instance' if required,
> > > > is
> > > > there for future expansion and also to have structure sized to 64
> > > > bytes.
> > > > 
> > > > I include fault_level, engine_class as I though both were used by
> > > > [1]
> > > > but now that I looked again only fault level is used so I guess
> > > > engine_class can be pulled out too unless we want to keep for the
> > > > only
> > > > place in which it is used (debug messages).
> > > 
> > > I think today hardware/GuC provides both engine class and engine
> > > instance which is why I mentioned. We can ignore those fields if we
> > > don't feel they are valuable/relevant, but at least today we are
> > > reading those and printing them out.
> > > 
> > 
> > Yes, the debug message drops engine instance due to not passing this
> > value over. I think that is ok, engine class typically all we care
> > about
> > anyways.
> 
> I'd actually disagree here. I think it is valueable to print out all of
> the fields we receive from hardware for debug puroses - i.e. if we get
> a fault to a non-existant engine instance or to the wrong one, it could
> help us narrow down issues in that area. At the very least we should
> have a way to print and decode these even if we only actually store the
> class.
> 

Ok, since we have the extra bits, I'll include bring this back in and
ensure we retain all information in the current debug message.

Matt 

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/148727/
> > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > +       } consumer;
> > > > > > +       /**
> > > > > > +        * @producer: State for the producer (i.e., HW/FW
> > > > > > interface).
> > > > > > Populated
> > > > > > +        * by the producer and should not be modified—or even
> > > > > > inspected—by the
> > > > > > +        * consumer, except for calling operations.
> > > > > > +        */
> > > > > > +       struct {
> > > > > > +               /** @producer.private: private pointer */
> > > > > > +               void *private;
> > > > > > +               /** @producer.ops: operations */
> > > > > > +               const struct xe_pagefault_ops *ops;
> > > > > > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW       4
> > > > > > +               /**
> > > > > > +                * producer.msg: page fault message, used by
> > > > > > producer
> > > > > > in fault
> > > > > > +                * acknowledgement to formulate response to
> > > > > > HW/FW
> > > > > > interface.
> > > > > > +                */
> > > > > > +               u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > > > > > +       } producer;
> > > > > > +};
> > > > > > +
> > > > > > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer)
> > > > > > */
> > > > > > +struct xe_pagefault_queue {
> > > > > > +       /**
> > > > > > +        * @data: Data in queue containing struct
> > > > > > xe_pagefault,
> > > > > > protected by
> > > > > > +        * @lock
> > > > > > +        */
> > > > > > +       void *data;
> > > > > > +       /** @size: Size of queue in bytes */
> > > > > > +       u32 size;
> > > > > > +       /** @head: Head pointer in bytes, moved by producer,
> > > > > > protected by @lock */
> > > > > > +       u32 head;
> > > > > > +       /** @tail: Tail pointer in bytes, moved by consumer,
> > > > > > protected by @lock */
> > > > > > +       u32 tail;
> > > > > > +       /** @lock: protects page fault queue */
> > > > > > +       spinlock_t lock;
> > > > > > +       /** @worker: to process page faults */
> > > > > > +       struct work_struct worker;
> > > > > > +};
> > > > > > +
> > > > > > +#endif
> > > > > 
> > > 
> 
