Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D12D6DDDA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACA10E06D;
	Fri, 15 Nov 2024 07:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLr3QmZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6658A10E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731654577; x=1763190577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BoMDlWtM9SA3T8Pi2TnfGMOEfBdmVth8QBPzLOTo0gE=;
 b=OLr3QmZhHH5emd5bN39ooEIO9xdSwLUVbaK+mmcwYPLYfqKShT4S0bjG
 9xwyFuhY5hP0u5+xuw6mCRVDFRWH1NN1EWWPHeTZvCWQt681mMbygmanV
 oyHw3vQ175AC0WdyMfBahW2T4hZKIpzyyBCcKhZMp8puWnOXB83FCpMCK
 DlEHE8jsfXpDw0cf/iwonz7mRdohA3mSI/XxC9r1ou3gtjeUo/+uPPiD4
 jCI539qn3JgZ81j/zwB4Y0Y9fc+VDdDi/DBcwXLGEcJe7dJBIGrWN7Pib
 HYsik/ZVnAcvlaCUD9o11LAs3RHLKmYKC4uFkOjg9T5/dcOyPos2Qn0I6 A==;
X-CSE-ConnectionGUID: 9BfttRgQRIKX9ediD2A4oA==
X-CSE-MsgGUID: dbaNmSJpT6SuXsIx8b82Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31567610"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31567610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 23:09:37 -0800
X-CSE-ConnectionGUID: 3YynfLspSfWu7uDnm8rYMg==
X-CSE-MsgGUID: JHF0XifbQaCROxJuvQ6mMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="93537118"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 23:09:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 23:09:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 23:09:35 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 23:09:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cee3tggkVWVfytTw99GfUmB5sCzpVcKhDcoaOt2bay1r4rWPsHi7RYek5l6q7TE9GX5oBuffFendXatKvOMH0xh4yWucmHQ0zUq80iypki0kXfZH9PA/uyN2K6YK+SZnmhSIoUlBe8YemKC59d/AN69e+I50GsPj48SokWXv89hRtPbnX8UvblnhcraLRC/Tp4W4+Bw72/phddUMcErn8zgI8pBB6DdBJ1xPbS9AYSDwN8wm5X6v8SwfHqqFiLi0160I8DR36A0EBAjGouWMUBoXcb7Ege+6vcRJOV4kKLKkut2HVoJ52D3ZUfHdRVRekIdzUR4y81vYQn/QP6lPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ2rcAd2PoiKqY5qnaVlw7PYUX4PhahVqpBHZOzAWjY=;
 b=uKWF7n9aEDguFGqy24yJhRfufhQ7Z3s3ScypSW3l+wS6b62/LlhDz6nhA9j8a6wwtpUc0f6we6jjJdXkNfBsjqtr+HbH8oDyE6SfVMeMMwXqLCvNg06ClMTVm2CmT7/bkVf2QiQpzCCFU4tTZjr3L/D51DeIuHQBIJ7r6iSh8+ge42DEqMsP4xAqfT9Eia23HPnr/elCha5xx3B0XaZkEDCYbXDfl6/GrN6wdTh9RBntldz6dkCXYuTzLUtkEqyU3Jk83t2Ang8+RwPmslR12nnPGr8UYnGiF17EFk0ThvZmMBIai403b8iopZSxKHmNUOe6k2AnNzYdgPwrZHk6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 07:09:24 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%5]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 07:09:17 +0000
Date: Fri, 15 Nov 2024 12:39:10 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure GT reset is complete during ccs_mode
 change
Message-ID: <ZzbzlkMyVKETs4Zq@bvivekan-mobl1>
References: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
 <20241114133738.2125717-3-balasubramani.vivekanandan@intel.com>
 <ZzanDvPKh7a7lQ/f@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZzanDvPKh7a7lQ/f@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: PNYP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::23) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 060921b1-80b5-4c97-2543-08dd05446b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3dHa1N4alpCVkV0TlJ5MzdiMlJDZzBSQi9xaGkxTGFKVmVKOXRqeEJiMElp?=
 =?utf-8?B?c1gyOUs2cnJPcG5yYVQvS2VWQW9rbWFMUU5ydVpLRE9GaVV0YU5oTjA2OGpn?=
 =?utf-8?B?bHZaaEIrMDhGOVE2QXYyOWVsaGxNbFJacDRLZmYrbFFJcnBldXdndlNDd1Rm?=
 =?utf-8?B?NE1NZDB3eGxDWDBmYVB4SzBrb1VidVV3MHdjUnI0Vm1qMmY1ajNlVDQzSnFy?=
 =?utf-8?B?eS94bi80ekJHck1WQllmL21ZTFRrcThxYks0SzBnbmt4SnJaSlVBZlF0N21P?=
 =?utf-8?B?QzdPazNtM1JQVUpBdlRrSXNmV1RlT2QvOFV2MG90bjQ4UXNwZEJUSGV6QWZ4?=
 =?utf-8?B?UWY2bjRIQjZUVjM3OXRTaGxQOTE2R1dNWlp1ZThRMUdMbGlOSHM5VUR6M0FH?=
 =?utf-8?B?cEhpeGpSZEkySGowSHIyaGxxemtybWYxY1NnQXFEemJqZTdRZmV0TURMbWxV?=
 =?utf-8?B?cjd0OXE5WUt4RFpWcXExWWtaQk1sSkFlQXRqNWo1Vlkzc0ZMMXlIOEx6MUQ4?=
 =?utf-8?B?TXdBdmNWV2Q2WlRrUlNmR2J5N0UvbUZDbHNSWlVNRG1TNzF5V3pQZmNDcXBN?=
 =?utf-8?B?MTJLdUkyU3p1TUVvR3RqSFNldzZscTBkeEd0eVpLMnFySlMwQzNsUytDRWts?=
 =?utf-8?B?bUt1WUxQc3JXSEdaaU5RNGpPbGJiZEZ3K2orRm1Qa0p4U1dkU1ZEWlRRd045?=
 =?utf-8?B?WHVyR21yZDE4eUhXY0F1cjl0YnprcmdVNlVkcllCeEdlUnRUc1pBTDY1UHgw?=
 =?utf-8?B?QTdTcVQraER6T0FNUGZHMXRvYTN3bUtITENJZW9LcFhnbkhMc3lFc2VzMjFH?=
 =?utf-8?B?UmFseEJYZmNEOFhZUjVDV2xub2VUVm5jd00wd3JnVWs4L0c3YkRjZFJsTWxU?=
 =?utf-8?B?TURGT3ViYmo3aDZOUjZSV000dll5ajRCeUhicVcxc3FhR0RLQTE0cjRMZWhT?=
 =?utf-8?B?NHVEM1g3V3Z4ZjZDdEZnWjc4YisyNUJZZTJLbnQxN0FmSWw5N2gwRjcvbUg1?=
 =?utf-8?B?MVpmcUN1N1V1YmRiV3dLWG9kaVB2WXJIdE9GejR2K21ObmRNcnVTVnVhQmFJ?=
 =?utf-8?B?blprN0FnbE93b1pUWkdLN3A1RGRFVFlhK2YvMkJ5R2h3dkVYQXlPV2s3WkN5?=
 =?utf-8?B?eGVtY1FPSUVsWGRFKytNZTFtOGZPVnpmRS90M2dpdVcvbkM5OFFrdDduVUlv?=
 =?utf-8?B?L1Bub1YyQmkzWUFuZ0xuc3Y4dnMxQUhUa3pVNzBpbnVqSGZZWUpHUU5xR0c4?=
 =?utf-8?B?UW1hZDMzakk0NWpZSFc0WEdDMWExWnNwckFwRnlVSUozTlNyTU1Vd3FvTVlN?=
 =?utf-8?B?ZGlyanNpQTFQZlpEeUJpZTVxVHN6YTRFNWdrQzhyUE05cmdhZUdOTFFZK1k0?=
 =?utf-8?B?TUQ5NHB5T3NxeEJNalpKOVpQTUNUQ3hRSkswTGZyTEY1cHNvNVJRRTdmaFk2?=
 =?utf-8?B?RWdpL1F0V0xnVnV1L3JHak84RVdIMlBvQ3RsTy9ObGpMK3VCWkRNYmtmZGlG?=
 =?utf-8?B?a0hERUJpQUEwNUM0WHFSSDNtVHg0ZUgwREtHM0lYbVZnSS9INWROYnc2ME5O?=
 =?utf-8?B?bTJtOWpYSFFCd2NTb1k4SUEvSzQyNmh6ZDN1U3lSdFR3Y0Vpa0pUcFNXbFVG?=
 =?utf-8?B?YXA1TmhEN05WWXIyOTVGYVoyaFBiSkFSRkU0cS9ZY3h4YmRTbFVQRjNCaXg1?=
 =?utf-8?B?aEZ3WkpFZThVL1NwcnBEeUFlN1pSUEF1QnZ4NlhjQ0R0UHhtV0VKQWplSmlu?=
 =?utf-8?Q?eQpt4rj0CWy2Ph8gfg4W4WmoSJLdFUm3JCFK1hn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmNNeUcxQ0dmWGlSTVhNeGVYRklzZzlwY1d6T3NucDlWb2JEVVFsblFHMDhh?=
 =?utf-8?B?bW1TWTQrS2Z2cHB5cGk0cmd1LzJjM3NaaVhLZ0pTUjVrdFpaZnovR3l2K3pB?=
 =?utf-8?B?VWN5L1VMdVVjUU5DTEtkUDNGbGRIdVRmUm9jMDU0enZmRDc0TnIxNWFKTzRY?=
 =?utf-8?B?aVJma3lwb0tzcUFZbGZvY1d1NmxFUmp6cjdXU0hramVSZHd0eXIwZUppK3Ey?=
 =?utf-8?B?TVRVcFJCS0w0OXhhOW1TcFgzSUd0c284ODJiWVB3QzZCMVV1Y2RkdEhhbmlX?=
 =?utf-8?B?VXJkV1U1Q3hJTjQvcVdGaFhDd1JqSkRUemN4TXRmZXJYZDkzMUR6ZGxkd3Rz?=
 =?utf-8?B?RzVDYmpUR2N2UjVUd3NmejYvOEp1WDQwbXNTKzlUa2t4RlFrZWlQdmVzc0Iz?=
 =?utf-8?B?UjNhOXFzaGovSUFXYWlIZEV6MktjVG1QNTNoekR0aWQwWER1UHVpWlRXVklG?=
 =?utf-8?B?TFlINnF4bDhXN0ViUzdCVWxCSmpKNXNlcE5ubjlSblJZZ3RUck11L3o0NFYx?=
 =?utf-8?B?aU5PbkM4dGVGbTJuRmcyZXpLZEhLWHR4Q0J0V0ZMWENYZjlCM3MyYUFJUzdz?=
 =?utf-8?B?bWtiK1dWV3Y3UEVzbkFTSHUwdE5FSU5CSzA5TWhVMVltSFFSU3JNeU9ZeUxD?=
 =?utf-8?B?Yllzc0U0VXlGWHp3TVo3czVYTU5QdVNScXZLUFJvMWVWVzh1MFQ1OVNCUzEz?=
 =?utf-8?B?Y0V2d3pXZ1V4S2c3dFc1dzllVnJBR3ZoaHErZWJreHRkTUJMS3lXVVJDZFV2?=
 =?utf-8?B?RUEyK0szY2VTcE9Qdk04a3lLQi8xRWZsdjc3bWUvL3l4RnlVQVpEK1Nka21m?=
 =?utf-8?B?WTFXaXZCSUFHU0paSnFTWUhQeGV6UGlZNkdUT25lSDJBK0V1ZzlDUWFlcFY2?=
 =?utf-8?B?dnZmbzBsSG8ySDFjYlRkU2ZqNzFxdXYxcm5lL1lMM0hSUTVQNmJ6enRGYTVL?=
 =?utf-8?B?Rmx6N0Q1RzdIN3dnZHNDd0UwSnlsQnptd0tEKzJhOXRrVXpVd05sYjc4OTRD?=
 =?utf-8?B?US81eHdLNGVlYUx4ZjBjVnpaNFFOY3VFKzF4eXk4YUdIckFDMkFSZlJYeVJa?=
 =?utf-8?B?QllTbUxXRzNmVGNTazc5clVkR1ViV2xiYUZncFpGNlBBL0dQN0liZ1RsK0dJ?=
 =?utf-8?B?ai8ranhOSW5ZQkxlOTQxZlhjNS9zNjBKZGo4d2crSFBnV1VsWDZrTk15cis0?=
 =?utf-8?B?YzdGdURPaHVDZEhDa2g4eDgrVEZFLzVITTUzN2hHbXdXQlBCUHk5NTFMZmFa?=
 =?utf-8?B?cGU0VjZzdUFpT0ZVcHFNazMzOWhNZitkdzRyTkkrMDJKdzBkVUNwZnYxWmM0?=
 =?utf-8?B?dVNwWmtXdFBiWktZTDI1dmluN3JWMGl5MFNZaVhEWnV6UzRFNTFHcHVUNkZz?=
 =?utf-8?B?M09mU1Riam42TXVXNHhVTDk0TTVoNWx4ckRVQnN4eTgvSmJVQVRsVkFSS1RN?=
 =?utf-8?B?Snl2amlxclFqR1crdTJNQ08vZ00zZkcyNWR6RUlnYUZ0RWRkbWRNVmc0Z3VQ?=
 =?utf-8?B?Z1hmWFQ2RXJDWFpqbkx0czg1NnhxeVZjOEtaOEdIV2FnT09KYjF0QSszVTVO?=
 =?utf-8?B?OGtYSjhUVW5GWVQzSXRDckZDSWs5OVR2bXFVVG1VdUkrUzU3d0RnK2ZUTVBR?=
 =?utf-8?B?dXRMd0dERThlRURWdjFhRExlbHQzUDBYSkhpdFBDdVVQYzYxbjN5MEJaMnRn?=
 =?utf-8?B?NzE5bzF6WE04NTJ6UDI5OTJFNjFhOHdGUURGTVhaa2hlY2cxeWtEN3lCWWht?=
 =?utf-8?B?UG5lM3NId3BqR3p1aHpMYktmbFBhRUJmeTZyR09keVM2dHgwcFA4L3htNXdS?=
 =?utf-8?B?T1A2WDNsR002dHhaK0lUZUgrTVdNL3FoZVZJdTBsN0FyYS9KNGVPQ0RZTGVE?=
 =?utf-8?B?ZWd6VHhwMTVXeTBwWHZlMEkzVTMybzREUmRlSzR0QTFKalJKL0c4K3l0Unl1?=
 =?utf-8?B?cE40cFdDak9yZ1M2SHBWK1ZCZmVhcHJvbUV0VTRuZFVla29tVmY2WjR0b2hi?=
 =?utf-8?B?RDljSTdtYXc5ZFp2c1FEd2MwMFdRUjJDVWhpZ1E4bmw3bnRoMS9yZ1Bnenlt?=
 =?utf-8?B?OGtBQ2JQVUtEdlIranVheVprNlNXTW55THFtYnpYdkVCdWFnWkN5UU9VTnMy?=
 =?utf-8?B?MFlpZE9jZ0txUTEzR3JMUTVIY1hCL2dRTGJibjVnRytQdkd0a0NpKzV2UWc2?=
 =?utf-8?Q?T/eT0RFQvCRasK8YAubth8M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 060921b1-80b5-4c97-2543-08dd05446b52
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:09:17.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /skXItjkqDVtRAeX+AZ9rIGLCs2vQ9J5AJx+pqUNS626GJtBhkB21mFcV6Hd6ktbGwfMxWeDcJRJQqsOGKgT23THVTvMGnnQNwT4K4uDJiK45sm0lw78xjFsszsAlY4q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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

On 14.11.2024 17:42, Matthew Brost wrote:
> On Thu, Nov 14, 2024 at 07:07:38PM +0530, Balasubramani Vivekanandan wrote:
> > Driver returns from the ccs_mode change request soon after initiating an
> > asynchronous GT reset. Userspace may submit GT workload while the GT
> > reset is ongoing and may see unexpected results.
> 
> I missed this part. It should be fine to submit a workload while a GT
> reset is ongoing. Can you describe the unexpected results because AFIAK
> this should work.

I got intimidated by the exec_queue create ioctl prints getting
interleaved between the GuC firmware upload prints (because of GT reset)
in the dmesg while executing the ccs-mode-basic subtest of xe_compute.
My impression was exec_queue create ioctl succeeds but any actual
workload submission might fail during GT reset. My plan was to test the
actual workload submission in parallel to posting this patch.
But my thinking was wrong. I tried the subtest ccs-mode-compute-kernel
which actually submits a kernel after ccs_mode change and it completes
successfully. Driver is taking care of serializing the work submission
after GT reset.
So there is no need of this patch.

Regards,
Bala

> 
> Matt
> 
> > Make sure the GT reset is complete before exiting from the ccs_mode
> > change request.
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > index b6adfb9f2030..9b6c15239487 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > @@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> >  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> >  		gt->ccs_mode = num_engines;
> >  		xe_gt_record_user_engines(gt);
> > -		xe_gt_reset_async(gt);
> > +		xe_gt_reset_sync(gt);
> >  	}
> >  
> >  	mutex_unlock(&xe->drm.filelist_mutex);
> > -- 
> > 2.34.1
> > 
