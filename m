Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B1CC02193
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 01:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2378710E023;
	Wed,  5 Feb 2025 01:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1wVgGuj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1BF10E716
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 01:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738718961; x=1770254961;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2U7lXoZEMLP3Lak2MB0JKTZDFZ4awtoOsUEk65tJY+0=;
 b=K1wVgGujOSM2x/ssavbaKc5CPVBjLrx6IKbFj0Vj7qpiAD03KwA6LqlP
 gfeqqT7orxc6TOm9RILsPqJXaHBYslz8htpZ040BqfsH82HvcYiLt0L4w
 /Hvzz2/zvU+mjFKaeP8xegMAWBiRZi/AwbtTJH9xIEjB7FprRDmyE5wq5
 Cm8U5ELduws+rHnoEiH1aeYiR+yeLE8bw2FB4GNK4yKk6P4V9rUj5aIAR
 JUp4CFV9F7x3O2LWk2ifxWGjCuZq5yLlMxqcGtLIHm2iZ6dupj1R1ydmO
 m4xqI9xrknfbo6Ui5W/2jAKpPDXVpDwhAqFbGY8o13frQC1N8Ourj10On A==;
X-CSE-ConnectionGUID: kjzNDjRfQzWjN16VwPs73A==
X-CSE-MsgGUID: DPJ5xXT2SY+u12ti281FUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64628206"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="64628206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 17:29:20 -0800
X-CSE-ConnectionGUID: dyk+Wz0fRkmcOBuGrMokcg==
X-CSE-MsgGUID: Xyuy4ceoTCm3yC5jWoyxdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110602032"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 17:29:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 17:29:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 17:29:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 17:29:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQZAnuNXLkotJ84TH3RZKxcZsU5pUVyPPtDysMuGrcEIFt3jaKMe4+jOgU6SWwfhLOUgTZ5EhVFLmL3w6yYN8anfy/ocX6lrOxskRP81+g8tEg+FVXuxKLvG8Ebwn1a0/9BKKGOqTNnNfCEdXXnGq1YKtm/JztO7OkGgRNT+HWtMwpxdBvrh6RJ3ALNsuCh1fYaiwrNbkkga7io1HWSs20efy0bripVcZGSZ7sd3b+XKNPYzHbBeebrFLJ8L0PmRBiVlP2mLU//uKEwr2L3Q30j8TU48LMu7KlnXcQkKxYGqg7ZhXuq/GY/fez5v06O6Ly3kbcPe8IGVK1ibrc0GmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7Pjy3In8A7WZfwOYexUb8GRHh3YcfcroLltFdLcusY=;
 b=aIXfPsgb5r1BquAOEPQBSqW0hnLbjCIZRZeFE/1ZM71Jn6JKtuXbmXEa6YleHwf0c+sWSLB2mFyqt0/gJpJXy7oPXDZIRZKjQ4WcyaFL3dgVIsbGmZq1VZMN0lHnOkLA1tdHT+n/gOvUkdOF4uKamORsEj2xyIcANIIPZryhEex95K/aSvzP2x6IUsCTgJZJcgAXM8PMC2R309e4LAJXnez7rqSagwcg4jOPkNHcFMhuDT61bdc80xdQYqxg3TfzFyjsTdZ1i3GlFXV+KSXVCWOxW7mlSitWwJDP7tMI1uXsJ0B/7OatdoA0Nwr691ZkE5ySN8xgmIXMcGPPuSKgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 01:29:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 01:29:11 +0000
Date: Tue, 4 Feb 2025 17:28:50 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 4/8] drm/xe/xe_pmu: Add PMU support for
 per-engine-class activity
Message-ID: <Z6K+0oBpkPqKwuUm@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-5-riana.tauro@intel.com>
 <Z51YmyBWc2HlsSZt@orsosgc001>
 <10546030-ec4e-4717-8d80-5c976bd3e596@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10546030-ec4e-4717-8d80-5c976bd3e596@intel.com>
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fda118-0c04-4348-2b27-08dd458472d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEFITGR0bUJ6VkE1QXdDT3JzNHFtVlltZGlubHN0TDdsRm4zQkpJd3NDbmZ3?=
 =?utf-8?B?MWVjTk96ZE1oU1BhdVdrS210S1hSWkNQeE41MUlBYlYvdVJYL1JvV214b3M3?=
 =?utf-8?B?eDgzeXpiVTJQWWxESHl4WlpxeDROWnBDUytZb3I0YlZFMDdDZVVBNHNLaG91?=
 =?utf-8?B?Z2k3OWtXTy9ON3A2ZkVUaXFQQzlJaUVSRmQ4SmltV2hpUUk4UTJKWmVpMXU4?=
 =?utf-8?B?VWdtb3B1YnNhYlFQYUF1eittelMvZDIxcVEzTzBpNnZWM09ocVAvRUxaNHhI?=
 =?utf-8?B?OXdZeitTS1ZxR21URkJBSEFhNGZhTGRDL3hCTi9MWkNHVEo2dGYxZTJ6VkZ4?=
 =?utf-8?B?S3djVFpxVlBpNGRFTnNSa25waHM0aW81ME1UNFVPTHhpS0dOZUhCYUxXZGJX?=
 =?utf-8?B?dGJnck1hTG9MQ1RiQmZDRlhqVk0xbXJwRnJ5SDJlZFVwUE1wMzIrRWtXTFNw?=
 =?utf-8?B?RDY4azh1aUI3MmlCb2lmeUJSMHFHcDhhRW1Od3dzVWRxaVJjazJTcFpQODBX?=
 =?utf-8?B?eFNNZzJjWmNNc21UcEZTL3QyT3RCbUQzV3lTSElkc09FQzVxV3pXVWZOaEtz?=
 =?utf-8?B?UHNhMnl5SGJwWkF5NTczbVdSZFZlMkwzNFd2dHh5NWJxaUpUWVJyWXpTMUVN?=
 =?utf-8?B?dWxMbG5keVZjVUpFVU05VnhsQndkbE9FWHV0VER4aUhMTE9iczdLWS9CRGkz?=
 =?utf-8?B?cjhmZVVLZkJ3WWZNT0FnQlFGZXJkL2NuVGVPSjU2TzFKdVBQalFOZ1BUcy9K?=
 =?utf-8?B?elVNM3I3UE1wY2FiMVZSOFV0NVBUemxyazZJcldRYktGUW5BZXJwdVhtYTZr?=
 =?utf-8?B?K1lPLzdGS1FRK1RuU3RoS1JHakxQY0l1NU55V2ZpT3BteTBEbUh4NmVoMzJv?=
 =?utf-8?B?UHJxNzYrMFN2TXdhaDBoWGVaSWtsRFJkMzdXZ2FEK2gvNDB0MExvakhJL0hL?=
 =?utf-8?B?cXQrSU5wWUkzWkp6ZVY1MFJkQ0llNEYvZ1hlS250QVhraGZKaXZxWTd4VFlP?=
 =?utf-8?B?ZTdaS0kzcFlOdVFuS3ZDeHVwTmdCQ3FaRTZGTmlqdkZ4NnQ2K3dZZjRNVlA3?=
 =?utf-8?B?TVpxL2xqaUQrOGE5cGZJdDgzT0IrLzBzWGhHRXdxT01EdUVPcEZIaUFFNGlm?=
 =?utf-8?B?dWhzaVlMd3RObXNrRjhwUkRKRzY0UDlZeStJSElUbDZMdEVyZ2ljbkMzanNM?=
 =?utf-8?B?anpoWmdrQ2tvckI2QjlrMVpKdHlObXRwQ1QyZFIzZXJwWlI3cUZDcGtlVGhI?=
 =?utf-8?B?Uk13VGdrNEhkUjY3NHNrODZHRFRWWTNoV1lSa1FmSGZ6U1dkUG1UU1U4ZUZC?=
 =?utf-8?B?eDA4ZGVKdTRhVEhiTzg3Y0Irc1dMTE1PdFFORldYeS9MTldydTRSYnE3SHNK?=
 =?utf-8?B?ak5JRkFlcE1UdENmN1U3TFArUzhHNlZlUzFvZ2RDem5QdlY2WUVWQWdtcDlk?=
 =?utf-8?B?dmpobmFmQkZOQmZjM3U4UGg4cmVTSkxtQ2N3aHBnMjZvNnV3Mi9NMHR3UEJL?=
 =?utf-8?B?YmxSd0d1ajhyZDdhNkdvSzVsdkZTYnRyemhrby9WS3VJYjdyZ2R2VVhYNE4v?=
 =?utf-8?B?NmowaDJIajdpZ2h5YlY0WEZDckV4L3dVbTRPb0dXQ3oyNU9oeXkvS3VJVSto?=
 =?utf-8?B?bVZCZFhwN0FEcmVuaDBsUFZPZG4wZjY4bG16Mkd3dXdnWFUxNml6VzhhU2xL?=
 =?utf-8?B?aDJtSUs0VEJYeHkzR1NZZU9XZFdUR2xQL1NaQTB3cGpHZXRWOVFQNGhWMFRY?=
 =?utf-8?B?dkFCVHJ2Q1BkZWVxQW9lOXVOWE5XSUVhWmFwVVY1c3B0NEw2a3h0SHVQbFdB?=
 =?utf-8?B?SWYzWldncDdlMFJRVDd4QmVLeE91Rjd1dmJIZEZVN1drS2c4WlVpejJBbWZl?=
 =?utf-8?Q?iAG7GuzZVlgIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9ZTmNKaEMxZFZ3ZTdtcHJWajJQNDJaTElBbHR0UkhSSVFTYW82TlRXS0h6?=
 =?utf-8?B?MWRHVHlHTG0vRVU2QktiTWM3L0d3ZHliZ2JhRGVtQnVVYzA1Q3pIRjVRSkM4?=
 =?utf-8?B?MlgzcVE5R1ZBTGNLckFJeUQ3bWh3NTEwUUtjZ2dVT3NCNktHd2owbitTVDFu?=
 =?utf-8?B?UXdSVTQ2ZkhybEpMU1hYa09wb0Yrc3ZYdFFKKzk5MmVPM1cxTjFrRURnQ2Qx?=
 =?utf-8?B?czg3RDhvQlBTc3pvcmZJNFR5azY0akhRWmVHQ3VNL0hSSHlYWWUxOWRtT050?=
 =?utf-8?B?bkNMa1p2OGJ4dWlyai9RbUNqYkUyRGtyOHZJVnBYZW5neUdQbU5MM3U3elk1?=
 =?utf-8?B?OXVEdndTOFN4amlHcFhTWW93NlQ1TjVTcFp2dmQ4YzdOR3p5SW42Nk5qOVdO?=
 =?utf-8?B?eHJBZUJiNzMxVExUUzNrWjRzcEJqek5LVkp3ejQwTG9KeEtTSlN5QTJYYmkw?=
 =?utf-8?B?T0I0MHJOR0pkSnFndENnWG9zL3JrQW1paWVsajNBNUNLaW9lVTM5OUVuVjRT?=
 =?utf-8?B?M3dyQjE1OGY2WVhqOUh5TzNFbmZ0ZGMzTWJUMHhBaC9CVkFqbjlxa1pxeUFh?=
 =?utf-8?B?Nlp4SWdkT3pLYWdnUisrMC9UdTRjRklmUW1RZ3lubURmS25jY2xaMFI0d3dL?=
 =?utf-8?B?TG9TR0twTVNrMVBEd3pKc2NERnVXNjZ5cE1EOXZFREdRam4wM1ZOeU4vNGF3?=
 =?utf-8?B?ZmFtYWVGamdWL3Fpc3JRdlFEVUhEdVFFMnptQ25acWhNQTFSbkJTRzFYVTAy?=
 =?utf-8?B?TzdlR0g4UlRYQUU4YlpQZU1MZEQrZDBSZmJlV0Z3dVN6OU15NnpRNStsSVJy?=
 =?utf-8?B?V3RjMFQvMitLN1hlZ2NoclJrU3BlSExLVGI4ZHUvMFYrWVZlSzZ4TkJ4OEtx?=
 =?utf-8?B?UEhQOTdNZlU3a2lLelBsWndOYm9Zc2dHUTlRYUsxZHFHZ1FwVkdudzBRRTFs?=
 =?utf-8?B?Ukl1a1RVUndEaGlRbDFDYTA0Yld0VjZidk1wT3hkb1B3SHkvT05aZG9zRENO?=
 =?utf-8?B?c0s2M1VaYjVFVWxIb3RHVlZ0dFh5NWQyeTJsSEwzSy9TNlB6SGF0TU14SUtS?=
 =?utf-8?B?WFhpZU9MdDVsNkNQeU4yWWZlOEVhZ0RodERwTGQyMlR1NjR4Q3FJQmhlNzRn?=
 =?utf-8?B?SSs2T08zV2FLVXV3TjcwRHVQL29CenRhQ2MxdFB6YWt3VTh3R0dsalVGUDVw?=
 =?utf-8?B?Mm1TWTFtd1ZDNXlnaUI3a29yb01LZ2lxN24vWENsem1BYTJrYktaMjA1SlZw?=
 =?utf-8?B?d0xLTHVscEJKZnFJR2piNXlTcWIyMkpOcm80blpUQ2FrTHBSRWowV0tPSERN?=
 =?utf-8?B?Q2FsR1QzWmRhQ3AwaGJmSURHL045VWdEekdHbGpIME96eUVva2dkYWI0ZGhU?=
 =?utf-8?B?QXh6TG9Ua2tjME03bHh4MVY4TWRUdkpqckVmTTRLVW5WSWxaR3NxVXgxbHBK?=
 =?utf-8?B?bkpFeVZhQ0p1RlFYV1VQM2hKZnJKWitTZHE5citBWXVEVnNDdTdNcHlkd1FD?=
 =?utf-8?B?T09tSmVxSDZUdElhZEp1VnlnWXJsOXVUb2g4Znp5RWsyUU1zVjR0QjNMaURK?=
 =?utf-8?B?WXFHMDVBU01sM05PeDE3a2VWdmR5UDFjbGQraGxVdCtseERQRy83YmhqU0hM?=
 =?utf-8?B?V2NKZ1RvQlFtU3BSaktzNVg3Uk52WThlQWpzYldETDZMcEZlVHprTUxiQm82?=
 =?utf-8?B?ME5XZVdFdWRnbDFWbTQyclNRYXFqcjlCZG1OVEdYZnUxMExIRjBDTmN2bWVM?=
 =?utf-8?B?Q1dEZ29ZODczaEErRjVIZC80ckVGS1JNb2plZXdnaG5za2xOcU8zWUdDcXRK?=
 =?utf-8?B?a3FSK2lKMjJyWG0vSVJIVFFZeW1MeWNmcENueXJuaXkySzJhVFJXVnRZNWdi?=
 =?utf-8?B?SWphSGhudHdKamsvV2hPYmNpU21VYVZOQzErNlF2SUVYaXkvY2JHbFlSRUFU?=
 =?utf-8?B?dTM5czlMTEZGSi9rME1GSkZUZ2dvRHV0YWpCZmtmVmIySm50RlhOQ0prdXB4?=
 =?utf-8?B?NGxDYXhZeTZpbEk1REFQdlp6aFB2TWM4VXg2QmpVVXJQSUdnQWNYa28rdjZJ?=
 =?utf-8?B?bkNrbFQyTng0eFcxZFdmRUZBaG50UDU4UE5oVkw1dFdLS3pCa1VJY002SElS?=
 =?utf-8?B?VCtRS3RLM0ZPRkJPMEw0Q3FOeXk4Qm1LcThIdUY2a0FEUkNlYTMwR0NxQTRI?=
 =?utf-8?Q?Bi0jah2+6B8PQrn2pgLsEYc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fda118-0c04-4348-2b27-08dd458472d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 01:29:11.4453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNNOcdV5NW/Lsx31HYCMsQWnQEWScOnFCeXuse28DwlAFK+wNgR/Ir5qGhV5cPjRe6IzZ0C0n0YtG+xdgkdAI+JzpX6+wwW0Nn7Gy4PlW6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

On Mon, Feb 03, 2025 at 07:44:27PM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 2/1/2025 4:41 AM, Umesh Nerlige Ramappa wrote:
>>On Wed, Jan 29, 2025 at 03:46:47PM +0530, Riana Tauro wrote:
>>>PMU provides two counters (engine-active-ticks, engine-total-ticks)
>>>to calculate engine activity. When querying engine activity,
>>>user must group these 2 counters using the perf_event
>>>group mechanism to ensure both counters are sampled together.
>>>
>>>To list the events
>>>
>>>    ./perf list
>>>      xe_0000_03_00.0/engine-active-ticks/        [Kernel PMU event]
>>>      xe_0000_03_00.0/engine-total-ticks/        [Kernel PMU event]
>>
>>checkpatch complains that the line is > 75 columns here. Maybe drop the
>>'[Kernel PMU event]' and move it to left:
>>
>>./perf list
>>     xe_0000_03_00.0/engine-active-ticks/
>>     xe_0000_03_00.0/engine-total-ticks/
>CI doesn't show this. Its below 75

oh, my bad

>>
>>>
>>>The formats to be used with the above are
>>>
>>>    engine_instance    - config:12-19
>>>    engine_class    - config:20-27
>>>    gt        - config:60-63
>>>
>>>The events can then be read using perf tool
>>>
>>>./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt=0,
>>>                   engine_class=0,engine_instance=0/,
>>>           xe_0000_03_00.0/engine-total-ticks,gt=0,
>>>                   engine_class=0,engine_instance=0/ -I 1000
>>>
>>>Engine activity can then be calculated as below
>>>engine activity % = (engine active ticks/engine total ticks) * 100
>>>
>>>v2: validate gt
>>>   rename total-ticks to engine-total-ticks
>>>   add helper to get hwe (Umesh)
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_guc.c |   5 ++
>>>drivers/gpu/drm/xe/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++---
>>>drivers/gpu/drm/xe/xe_uc.c  |   3 +
>>>3 files changed, 128 insertions(+), 9 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index 1619c0a52db9..bc1ff0a4e1e7 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -27,6 +27,7 @@
>>>#include "xe_guc_capture.h"
>>>#include "xe_guc_ct.h"
>>>#include "xe_guc_db_mgr.h"
>>>+#include "xe_guc_engine_activity.h"
>>>#include "xe_guc_hwconfig.h"
>>>#include "xe_guc_log.h"
>>>#include "xe_guc_pc.h"
>>>@@ -744,6 +745,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>    if (ret)
>>>        return ret;
>>>
>>>+    ret = xe_guc_engine_activity_init(guc);
>>>+    if (ret)
>>>+        return ret;
>>>+
>>>    ret = xe_guc_buf_cache_init(&guc->buf);
>>>    if (ret)
>>>        return ret;
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>index 3910a82328ee..8ea78d8f7e2e 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>@@ -8,15 +8,16 @@
>>>
>>>#include "xe_device.h"
>>>#include "xe_gt_idle.h"
>>>+#include "xe_guc_engine_activity.h"
>>>+#include "xe_hw_engine.h"
>>>#include "xe_pm.h"
>>>#include "xe_pmu.h"
>>>
>>>/**
>>> * DOC: Xe PMU (Performance Monitoring Unit)
>>> *
>>>- * Expose events/counters like GT-C6 residency and GT frequency 
>>>to user land via
>>>- * the perf interface. Events are per device. The GT can be 
>>>selected with an
>>>- * extra config sub-field (bits 60-63).
>>>+ * Expose events/counters like GT-C6 residency, GT frequency and 
>>>per- class-engine
>>>+ * activity to user land via the perf interface. Events are per device.
>>> *
>>> * All events are listed in sysfs:
>>> *
>>>@@ -24,7 +25,19 @@
>>> *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>>> *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>>> *
>>>- * The format directory has info regarding the configs that can be used.
>>>+ * format directory configs:
>>>+ *
>>>+ *        60        56        52        48        44        40        
>>>36        32
>>>+ * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | 
>>>- - - - | - - - - |
>>>+ *   [ gt ]
>>>+ *
>>>+ *        28        24        20        16        12         
>>>8         4         0
>>>+ * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | 
>>>- - - - | - - - - |
>>>+ *            [   engine_class  ] [ engine_instance ] [         
>>>event             ]
>>>+ *
>>>+ * engine_class and engine_instance bits will be applicable for
>>>+ * per-engine-class activity events (engine-active-ticks, engine- 
>>>total-ticks)
>>
>>Please also mention that gt is applicable to the engine events as well.
>>
>>Also a line saying "engine_class and engine_instance are not 
>>applicable to gt events (like c6 and frequency)".
>
>Is the below description okay ?
>
>"if event[0:11] == (0x02 | 0x03) (engine-* events)
>use engine_class[20:27], engine_instance[12:19] and gt[60:63] to select
>the required engine of the gt
>
>For the rest of the events use gt[60:63] to select gt. Rest of
>the formats are not applicable"

Note that I would only mention events known to us today. If more are 
added in future, doc needs to be updated.

Something like this:

The following format parameters are available to read events, but only 
some are valid with each event:

gt[60:63]		Selects gt for the event
engine_class[20:27]	Selects engine-class for event
engine_instance[12:19]	Selects the engine-instance for the event
vf_id/function[x:y]	Selects the function of the event

For engine specific events (engine-*), gt, engine_class and 
engine_instance parameters must be passed/set as populated by the
DRM_XE_DEVICE_QUERY_ENGINES.

For gt specific events (gt-*) gt parameter must be passed. All other 
parameters must be set to 0.

Thanks,
Umesh

>>
>>Ideally it would be good if there is an intuitive way for the user to
>>determine this association, maybe something like:
>>
>>gt-<event>
>>/* gt should be passed in format for events like  c6, freq etc. */
>>
>>gt-engine-<event>
>>/* gt and engine* should be passed in format for active/total ticks */
>would be intuitive to find formats.
>>
>>but I am afraid that could just result in very long event names in 
>>future, so I am okay with what it is now with the required 
>>documentation.
>>
>>@Lucas, any thoughts here ^ ?
>>
>>>+ *
>>> * The standard perf tool can be used to grep for a certain event 
>>>as well.
>>> * Example:
>>> *
>>>@@ -35,20 +48,34 @@
>>> *     $ perf stat -e <event_name,gt=> -I <interval>
>>> */
>>>
>>>-#define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>>>-#define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>>>+#define XE_PMU_EVENT_GT_MASK            GENMASK_ULL(63, 60)
>>>+#define XE_PMU_EVENT_ENGINE_CLASS_MASK        GENMASK_ULL(27, 20)
>>>+#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK    GENMASK_ULL(19, 12)
>>>+#define XE_PMU_EVENT_ID_MASK            GENMASK_ULL(11, 0)
>>>
>>>static unsigned int config_to_event_id(u64 config)
>>>{
>>>    return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>>>}
>>>
>>>+static unsigned int config_to_engine_class(u64 config)
>>>+{
>>>+    return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>>>+}
>>>+
>>>+static unsigned int config_to_engine_instance(u64 config)
>>>+{
>>>+    return FIELD_GET(XE_PMU_EVENT_ENGINE_INSTANCE_MASK, config);
>>>+}
>>>+
>>>static unsigned int config_to_gt_id(u64 config)
>>>{
>>>    return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
>>>}
>>>
>>>-#define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>>>+#define XE_PMU_EVENT_GT_C6_RESIDENCY        0x01
>>>+#define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS    0x02
>>>+#define XE_PMU_EVENT_ENGINE_TOTAL_TICKS     0x03
>>
>>checkpatch warning here ^ (space before tab)
>Will fix this
>
>Thanks
>Riana Tauro
>>
>>Thanks,
>>Umesh
>
