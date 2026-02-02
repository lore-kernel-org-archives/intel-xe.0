Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C5EE7314F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 09:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A997110E3D9;
	Mon,  2 Feb 2026 09:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbRuacBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AE10E3D9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770024862; x=1801560862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNaUqn4B634dtfSU9sEgS3NoQIJau2kFqN+okdwR+/M=;
 b=FbRuacBZbVdUiANVDih+sLgTOvO8w3Q32gX+gpEJZlF9lF/ja2Knfgxm
 iVkGEZDrAUsZyLPE/7WHmPHS5Snr4vWLrLBrKtJjLNWu/noGhH2+l0psf
 zVGl0qxkdP5ZubqbCoakWb+/6lrDjujaX3LThSzCK4BoaEckKrvcw5zNE
 pGFKgQzPbRFz3gvEHhrqxmT3MLbpO8CbH5HZRuBVCQGt5xo1IudZ4d+AO
 fn4nnYj6xqua2wUokkfGm0lpqU8Ifv+tt361ErxRRu+ihCE4daiioQrYB
 2O8sUxZ6KaCb432I3+TKvoY7lh13kOnfyexy017NhXvlbTmxcrl1fGmc2 A==;
X-CSE-ConnectionGUID: U3Jg0z8LRcy5OzQqlxOfHQ==
X-CSE-MsgGUID: JUKo64BuQ8CLNUnVEbB2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71264056"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71264056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:34:22 -0800
X-CSE-ConnectionGUID: +/X3LjRSTl+o5Ic495/Xvw==
X-CSE-MsgGUID: FPbKpFLFTjOsWK6u6g6tNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209472509"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:34:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:34:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 01:34:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:34:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+E9VDNZmwyqH0Q38tBePCWjEf1h0mTEOSSdN5HO8yRs2/ipChUkzlKifKsPF4Ze8i//iBlotvs5y2LZ20p0TMsy/5g9Cctko3Kg/vLPUx73gcO1qYg46gfJdMZ/FVPPfZ72WnMmVG+4Ow7hzVH5prTMvXK384eTzLKeRGOlNzMuz5xMdgK50kitx5XnVmkAviOSF5UD4hzscB1Qkw+blrJrRGhh+nPimU1AESSHi62MBrcGx3EHuLDYcN8QarzQ+bQuf+1MhhiRg7+sH/GhhRRdh3SSSZY+R42PAKmJCMEJ3FrlLl9mgV7gU4R5PohtmwRY/ShY5YwdO03CwfF2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu5lzwR5Gqz0xoN0AXaShne2QwBbPo9ni9bjQeAxiUk=;
 b=DUQGIPf3rRMsOMgHDv40zasOOqYZL57h/nDYPaq7vhGGY2U0wLOVmpOstVwRoeX5H4evUdWmP9ADjUxkU5ef7Rz4Z5naAOSSevhhuolJOziBvwthFCUb6MqrCIxu66XJJdu3qTyquBJj3gJZVza2iFLsk6DqSKFF8Fh8y7PHDDG+IhjadTiuteM6OZxlX8P7KkEXJThT6Vq0X3hIuiTVbChoAqAGc/MYwNOVH1kjd6cBDeDI/uKlh2tR2m7jWC30jv55PWggDvIPTD0mFyXHFln3ZW5QruPlpbYnJdfqewdYT5sdhTtsxPFl81J0A+Cf2oh7rq0mFAfmjQ/UVq4wzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:34:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:34:20 +0000
Message-ID: <21d46175-f77b-46ce-b3fe-50f21322f48d@intel.com>
Date: Mon, 2 Feb 2026 15:04:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-15-riana.tauro@intel.com>
 <58c5f662-a150-4295-bf20-27e1ed748126@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <58c5f662-a150-4295-bf20-27e1ed748126@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: fc23f5a5-d9c6-44dd-f893-08de623e3dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTBaN3B3cjdvMmF3U1l4cDdvcDR3S2VnYkFybVB5YXREUHpxaDNpU1F1YUNQ?=
 =?utf-8?B?UmJ2YlJxbUFkNG1aR2t6RW5rQmNjRlplY3B1TEFBVXJ3Znd4eGMxcGRIb05X?=
 =?utf-8?B?UTliMzhIVmJGMlJFRDVJenNtSWt5WmNFOXZ3djB3MnhydnMxVXI5eThTb2V2?=
 =?utf-8?B?NG9wUUFQdEp0YjZsNmxJbzYwcnpoYy9vaWtySmc0b0plYm9hdzdpRGMybDYz?=
 =?utf-8?B?dWJYcnVSNE80bUU5YUtMalBtM3VpRkxuenY4a0RRTVliWEwwZ0xaN21tZDM3?=
 =?utf-8?B?MmxBeHpIc2czd3N6R0RMSXlueHNXaDZ0MWpKZGdJclZweGpHbGkyQ1crdFNO?=
 =?utf-8?B?YUVHWGV4UW13Mk1tRWErNG9sejA0UUVlallDNDJpWnV2Nm1vQ1M5TllhaHRq?=
 =?utf-8?B?UlhXa2JiUWU2Y0lkWmZjNHU0RlRhMUJpRlR5TzllQnZYbDY5Q2FudERPUWF2?=
 =?utf-8?B?aEsxRXNXcmhXK242ZEEyQTQxTWlDeGhpSURNM2lWaysyU3VCZGx3Z2d6cllC?=
 =?utf-8?B?L0F5bVQyTm9vczcydFZuTVJ6aEw3L0Z3a0JmbzZyc2x3Wi9rZUNVNXhmYXZE?=
 =?utf-8?B?UkVFa1EyZ1ZPWlJ2UUtxbDhqYnJUWkZUZTY3NXlYSkY2eFlMc2lZQWdac0o4?=
 =?utf-8?B?RmY2N1FYU3FoOXpRS3FrRmZ6QmRSanduUGc4VTFBYjV4TXlvd0dEZFNkWStV?=
 =?utf-8?B?em8wZEtQSEk0TGM0clQ4UnRVeSsxc01iVmdHQUl4K1dmZkpqZ052MGpYLzVX?=
 =?utf-8?B?NlR5bEtQS3VWRSt5VUNjMVZmcEdYelM3ejRKMkxNZjUxZG4rcTV5M0l6UEtl?=
 =?utf-8?B?THhWNFJjZGQxZFAwbXppVUEwZUJibXUxNUxaMEE3cldUTkdGc2NTVXVhKyty?=
 =?utf-8?B?TmJrVEF6aW4yaFNlV05ySzhNYk9YRmRDVVM1UWRTMDFpVTYrQmlJalhXa2RR?=
 =?utf-8?B?WVpGS0ZuaTl3dWl0SlBJL0dQNnpuSnhHdkh3TndveUFNN2hVaTRlRjduNXRU?=
 =?utf-8?B?SERqeml0UU5hMldTN2JxOU14dnNLelRJbHhGSFpBRThKeW55RS9HbjR1bEpZ?=
 =?utf-8?B?a0poWW1ZZ2VRc2ZWbUdGRUhSMllJaHI4bnVqZURGTnJuTnRzWDMvVjB1cmFv?=
 =?utf-8?B?K2E5QmdhNU1qMHZJS3prL1l3MGpuV0p4YnlDM09FdEJZM3FQTlp3MlRPZkdR?=
 =?utf-8?B?SzNmWm1uWXFkanltbjdtaUJWUUFQcVBXMThmSGUycnVlbXZRRHBOcW5UTEI3?=
 =?utf-8?B?Z2F6eGJ2VFhCWjJBV3RlVHhPNGdHVHdDVUppdDM1d0JQdDl6eG5Fdzh4cDNI?=
 =?utf-8?B?dUtIb092WW1Pdkk0aWZaNlloL2dVK01vbXFsandsZm5pY2ZuRyt2bld6cU1E?=
 =?utf-8?B?MHMrbDRFSitoTW9XMVp1MG9wRHpUa2t2dFZPQjVmT2tKUVd4M29LVnplZFFh?=
 =?utf-8?B?MzlKVjA2d3hSU1AwSldpenBjTnpzRWtyWERUMkNldUR2TnBIVTZObVJOM3dV?=
 =?utf-8?B?YlJGRjN5RWxxM3BIUkltd2FHQkt5aE9GOXJVenBXYm5mRjF0WXVoMk9pV0lh?=
 =?utf-8?B?YXFzeDd1RTRSRi9FTHFNUTl2bkNETVBTM0krWmhGNmNEc1pPZDFHaUdDOEdv?=
 =?utf-8?B?b1Y0VmV1RW5uT2trWmljcXFjUWJJMktxdmVmT29SWjNhdHl2bXk4YUJJOC9F?=
 =?utf-8?B?WTY1WnVVWTBCRlB3WkFFakM5czRicjZ2eTBvQVB5NzdTenVpNGxRTHR3Vkp0?=
 =?utf-8?B?dDZGS1VSOG5FRFdPSmFkM29uNkprL0I5aDkrK0huYittSVZyemZhQmw1d3Zi?=
 =?utf-8?B?Zk9ERHdnK3hGM3BQZitWbmQxOEJ6MlB2T0I0SnZ4cFNZTWpMMW04emZsK29m?=
 =?utf-8?B?Z3l0Ukl6clNRd2tFSGxVQjdHclRwdEtIdWpBT3U3Wlgxbm9Yci9HaXJhWFB1?=
 =?utf-8?B?NmRpcWt0NzNpbFJpeFJZb3luTmQwNkhtWGJLQ3ZQa3N0anhRN3dkNmNXV1p2?=
 =?utf-8?B?ampNTGVjYk13eFBFaysraGEwMTNUaSsyU09ZcFRHWXl6S0pHVGNtczVDSWhP?=
 =?utf-8?B?ZDRHdHpzMGtVMks0STZDcUI0cGxjb2UyUVNyTDlxWEptYldEOEJqNWJoK2xF?=
 =?utf-8?Q?ycWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1A3SExlOVVzUTlCb3IyZm5VRmdoZWI4UGswSjNUZlpWWTIzVlhLWGRMVThs?=
 =?utf-8?B?N0Z1OUV5R285aFdaZm9ZempJOCtkZ1lza1poUGd6bk1DM3hzLzFpc0cwdWFV?=
 =?utf-8?B?STJueXR6UzNKaFBFVUkzMmdTdGRVRWdFUXRRNm1PMS9nbnhJODNSTXFoR0tY?=
 =?utf-8?B?N2hwWVo3V2JlbFduNzVaSnRPYnJxVWVKZkJQN3JHZWFrNkJlbVFybEFpYUpB?=
 =?utf-8?B?R3BUWDExWTBSUjBtdjFicEozUFhRKzdEUUtBSEttcC9qM001d21qell2UlBu?=
 =?utf-8?B?aGFLRHU5VFh3WlBpZlA4VEhqaGZBMUVaTjNkMzBHOWJaOE9XYndObE5laVNS?=
 =?utf-8?B?Q3piTENwZGtnNHIzQVVKdzdzMHhCM2xIaTRPMlVXS2R3dDU4cnpLVHZUQ29F?=
 =?utf-8?B?eWVPV2hEUERtS0dnQm9PV0RtY1JRUnU1UGhSaCtiME9JRm1ndkNCaE0wYlg3?=
 =?utf-8?B?a213Szl4WjZhMkV6M2g3TlIxeDg1RXJyWVkrV1RIZlZZclFmUnhMOFdZWllW?=
 =?utf-8?B?VFRLRGE5ODczQjZrbVo1T1kzRzI2ZUhvdXhlZFgzT1NJSFpLVEN3OHJuakNC?=
 =?utf-8?B?dVZYSmVWS0JVaVZHSXdZc1BiaHVvZDNGelU2YVJ4dlNOZU5pMktLMCtHR0or?=
 =?utf-8?B?TmpOL1VsZzZLY1VqTVVaYmdXemFxWWNxNU4vMUxzY2NZVVgvdXdkOXhFZTRv?=
 =?utf-8?B?QlQzMFBvUzJBazdFWGZXamY3Z3MzYXhBZ3cvYm5kaEUvNFd0SHRFbUduNldh?=
 =?utf-8?B?NTl3S1c5NEI4V2RJcDcyb3ZKZzh4VURMRzhIcm83Q1BocHlqM09YOXF5bUxi?=
 =?utf-8?B?MDkzUmFjeUhiY3dTYWpHQklWM1lEcmwwSXgrNlNvTGFSKzVnVWR0Mmp2djZL?=
 =?utf-8?B?RnczVmo4aVlDN3JObHJ5dm5PNXdCcXhCdzJtOHB1NVBkQmg5MUp0dVFKbW9o?=
 =?utf-8?B?dWdYNlZZdDViM3czRnpXSW9UeVJUYjl5U1c0QUhZdFd4SmtIaTZLOG5OeTN0?=
 =?utf-8?B?ZkJsQmpLMGN5dnkwNFlETk1kV0JyZDNUZm9JQksvSFhwTHhOTG4wZ044NUtU?=
 =?utf-8?B?Tm90aEx0c3RvNjFPK3RIZDlZcEZPTGRhM2xaS1AyQllUYnB6ZTYwMC9kL3pE?=
 =?utf-8?B?SFpwMVlDY0d6SWMwTXNicVdET1VYRzNIc1I1RE03T1E4dnF5L0VDSDB6UW9k?=
 =?utf-8?B?UytEMVlIN0RSNGNJMHZETjhWcElISGlNcHZRb2RySUNGQ1JZeFpEZUJ5ZTVX?=
 =?utf-8?B?Mi9aeW4vMG9zQ3A3emRxSWJOMlBSbkdXSVlwdXlFK2xIcUZpNVRya1pSdVpW?=
 =?utf-8?B?L1ROMm9GSkh6SzNHaTBMU0RvZkV5dGxYcitBVnJqKzFNMlRJL1F2bmhGTEU5?=
 =?utf-8?B?dG5hQUV6NnM0OThPOTBPckpiLzlMekxGczM0REtIL3ZiaVkydFZ1bjBiM2tm?=
 =?utf-8?B?V3pLZUVkSEF2MEIzTG1NQTF2Y1dOTFVnOFp4SGVLWjZjRCtIajdnYVB4eHd3?=
 =?utf-8?B?Njh5UEpvWUd6dWlRNXJUVFZGZmg1aEsxNFoxdHJObmpTNmV5S1dHYUk2cHhy?=
 =?utf-8?B?a0I1MFNuQklEQ1JpWmxkNk9FS0d1Ylo0dXRVejh4WmpPRzVlWDhwNlVNRDRW?=
 =?utf-8?B?R25LRjM4QzZNN1lJeFVJMUhEbkJJQ0Zqb3NteEt1QUdNL3lEbTk1TUJEaUdh?=
 =?utf-8?B?dzc5end5N08wekw1K2pMMHVCMnVCL2Z4RmNjWDlSaGVDem5VYnFtL1I1eTA1?=
 =?utf-8?B?ODJWRUNRak1aWlp6cnhsak4rZm8zZ09HY0F4RkVWOUpVdVRGOHFOQjlGL2pJ?=
 =?utf-8?B?Z3RlQTRGbG5hbklIeG8reWNxL0xjbW9aY0twbjVZbU0zL3RON0l3ZUZSaUlo?=
 =?utf-8?B?SWk3WjZLWVQ3bWZlWXlsOWxQUGZFVFRhdkIrb0JSM1BkTVVNb1d5TS8rMGFV?=
 =?utf-8?B?M252M1pQVEZ5MFNOU3c0ZFJsVlR0VzNPdTI1YU9xQzl5YUpCUTVqWjY4QjV4?=
 =?utf-8?B?K0tBM2lzTlA2S1k4cVdQV05VNFhiSy9oZ3JRMmNlRTVlc2hrNE5Da1MzY2p0?=
 =?utf-8?B?R2ZwUEZHNWxFZ2lHSFlBdGJNbWM0eW1HbWVPSjZVdCtZc0VaaStFTityYTRC?=
 =?utf-8?B?dWdwZWZXZ0JFVXdIcXI4amtWRStiaGxzNlVHUjZOeG1laFJ2cUFpdGp1Q3BW?=
 =?utf-8?B?N0tLRDNKUHRrc0JYVU9VeHU3MGw4Ty9qd08wZVFGZVZhS2NtbnVkVjgxM2RC?=
 =?utf-8?B?Wmx2YlVRa0QxbUdlbkRFazVwN0xRekxnV09BZDRXYlVOYTh5d3pxU2ZXdjRI?=
 =?utf-8?B?V3JJdVBheTFxbWRMeU9CSFBzaUF3MExFUURBcjBYZHpLRjZYbW4vQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc23f5a5-d9c6-44dd-f893-08de623e3dce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:34:20.1564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBW0uoczrtiDbIqXi91nOCQbWOPdjk5aRcAw32h0tTuMG15EeIPIgexB6Nbl8wA/g5MugkTNFouw0QrPUpBdbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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



On 1/27/2026 6:11 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Uncorrectable errors from different endpoints in the device are 
>> steered to
>> the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
>> Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> from triggering a Secondary Bus Reset (SBR). This allows error
>> detection, containment and recovery in the driver.
>>
>> The Uncorrectable Error Severity Register has the 'Uncorrectable
>> Internal Error Severity' set to fatal by default. Set this to
>> non-fatal and unmask the error.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |  1 +
>>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>>   drivers/gpu/drm/xe/xe_ras.c    | 71 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h    | 13 +++++++
>>   4 files changed, 88 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 5581f2180b5c..85ec53eb0b62 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>>       xe_pxp_debugfs.o \
>>       xe_pxp_submit.o \
>>       xe_query.o \
>> +    xe_ras.o \
>>       xe_range_fence.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index f418ebf04f0f..be89ffc9eade 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -59,6 +59,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1019,6 +1020,8 @@ int xe_device_probe(struct xe_device *xe)
>>       xe_vsec_init(xe);
>> +    xe_ras_init(xe);
>> +
>>       err = xe_sriov_init_late(xe);
>>       if (err)
>>           goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> new file mode 100644
>> index 000000000000..ba5ed37aed28
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <linux/pci.h>
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_ras.h"
>> +
>> +#ifdef CONFIG_PCIEAER
>> +static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    struct pci_dev *vsp, *usp;
>> +    u32 aer_uncorr_sev, aer_uncorr_mask;
>> +    u16 aer_cap;
>> +
>> +     /* Gfx Device Hierarchy: USP-->VSP-->SGunit */
>> +    vsp = pci_upstream_bridge(pdev);
>> +    if (!vsp)
>> +        return;
>> +
>> +    usp = pci_upstream_bridge(vsp);
>> +    if (!usp)
>> +        return;
>> +
>> +    aer_cap = usp->aer_cap;
>> +
>> +    if (!aer_cap)
>> +        return;
>> +
>> +    /*
>> +     * All errors are steered to USP which is a PCIe AER Complaint 
>> device.
>> +     * Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> +     * from triggering a Secondary Bus Reset (SBR). This allows error
>> +     * detection, containment and recovery in the driver.
>> +     *
>> +     * The Uncorrectable Error Severity Register has the 'Uncorrectable
>> +     * Internal Error Severity' set to fatal by default. Set this to
>> +     * non-fatal and unmask the error.
>> +     */
>> +
>> +    /* Initialize Uncorrectable Error Severity Register */
>> +    pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, 
>> &aer_uncorr_sev);
>> +    aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
>> +    pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, 
>> aer_uncorr_sev);
>> +
>> +    /* Initialize Uncorrectable Error Mask Register */
>> +    pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, 
>> &aer_uncorr_mask);
>> +    aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
>> +    pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, 
>> aer_uncorr_mask);
>> +
>> +    pci_save_state(usp);
>> +}
> 
> What happens when upstrean switch port is shared across another device 
> (another GPU / NVMe drive) etc.
> 

This is part of card. If there is audio or anything, they need to also 
implement error handling.

Thanks
Riana


> Thanks,
> 
> -/Mallesh
> 
>> +#endif
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +    if (!xe->info.has_sysctrl)
>> +        return;
>> +
>> +#ifdef CONFIG_PCIEAER
>> +    unmask_and_downgrade_internal_error(xe);
>> +#endif
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> new file mode 100644
>> index 000000000000..14cb973603e7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_H_
>> +#define _XE_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_ras_init(struct xe_device *xe);
>> +
>> +#endif

