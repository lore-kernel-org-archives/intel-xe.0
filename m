Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91580C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 06:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBCE10F86A;
	Fri,  4 Sep 2026 06:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMQxITNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3CF10E07C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 06:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788501802; x=1820037802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ifmzlVvFN1s6VuucWZ3d68RJ6V664AxNs0IZVwkAUw0=;
 b=WMQxITNX+yyhK/TVNHhbd26DvPuVBWBXONgofCSy6xf8P8ir8ezjJlpL
 zY2WinR5HtBJovzJiH1F/wmAoxPfrTNYubydcYvvGRV8mxyp/6oIcXU+h
 nsbMPtvDjfYEfjSmpcwPqX7l4cgesapgUEgqvBsX6vWlfsJrthCdzWFxP
 mlFxTfZyC/Nul48VVsVMJk+q2CKqTneZ+9LOPYDIqLPdOtlezykKgZads
 c/dh3UBGaAmWarGnRtH8SfbBTRkQwIoj6K87Wold/CLln9Nr39TSoCvRL
 KCQey+qash5y5m/o/ujUqD36JhLV4H7Ix3QmT694iBdPNiH9HX8XkLcu2 w==;
X-CSE-ConnectionGUID: KCMT5UG3QjS1vifg5lNo6A==
X-CSE-MsgGUID: Eat7mq3ETnyCWexMFtKEiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87936825"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87936825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:03:22 -0700
X-CSE-ConnectionGUID: Ex3s3xeqSFmVa+F0bfNA+w==
X-CSE-MsgGUID: VEeTKQnkRVK1Y6ARdNDh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="273465094"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:03:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 23:03:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 23:03:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 23:01:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na4qxtBpyVADQ2Gb/moXybhTyJhUmfGccnS7zWEHKAMtc1Ufjp8xOe435+pVtVff1mzMZ1GrXWnmX3I52c6+JpQnQTk6B8MPLHj2gY3poSgTwV/LkL6ulUYAMGKR5CRjruC9/LwdDjAjeosKE3U1Haqk4fgNxMOxER8VkG7qB8FnQ3CICvw+DcIDBDhWqMdQaaOJtsf3ViGdlbu1uX0kkpYM+VZLOxOOglghV9uXXeAoPBRhCAfr3ftBARkQV83otUpGoBODRKhW9wD3ZKZAyQpsYGqAikTgXJDXSAJdC/eyw0RbyjmzMzxt0/oiPBCpuwoFuPZeyOvEkNclF8nKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SREVeesVuxvXe6KfV4xSUZl0fpH0MsZ3Diz/HKIALRc=;
 b=MQlCwLIogqArCGIGcJUcp/beVR8I4DjOGQQZ/p/npA/QDMUZbplmdj3LfP0gdg55h4m5BSitPau8HDcDAUIX3nVebqxJohwh9CmiCd706rRu2+4RnIeOCS+Nz5TOyA7rirMYg4cD7H5uZlLO1YRwogjTwkPBoMubJUAVdp9WOp/IoXNXDA+equl1N+lOqkUPe6MDZTLxVCCanrNndSt2TJv1eadl8qIDnSBnLzSASU89iHzxp/XPBB/Mdhyqd5VEGUB9bkv2tSPOvSvfo1aTuhsA82rdcqSkNH6dguQMU3YoN94TRkAp64a/md2aZdpANiSBAFzOCDnqp1b0jTs6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:01:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:01:32 +0000
Message-ID: <fd49ce9f-42cc-4b17-94ca-c3b434a1493d@intel.com>
Date: Fri, 4 Sep 2026 11:31:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>, 
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260831104456.1770605-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0192.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 574750bd-8a22-4043-4907-08df0a49f7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 58Tx0rQRt+3bRcrrm/M+9YPjRXY/xyraqqKShNoaJJDH02CI0kF+RWbf16hOX+ruJTlaGRh23t1vdWaeq7V2oI2h1BRxAJvGZp2ttA4mKi2JXmM8HPhqS8/arcet9B2YlqB/4uJtpvM7mdI331kMB+WXdPLRhxB8DWfLGfUaWpnqltksqa7HqENVvYMGmYCF9OZcN+cNCNORsqlVQUcGZR1y3ux+DGHrsvq4Cg9pScZli7CVAEkvxCEgsL0uOZCBwl5QSTqUu/FFquSiMVOF5gwEzieOMmOkzyHLcR3zwX0nf23ZfBDYFTFWC4VJgr/uLGoCxQVB8Ygh7oPXnDhpcqC2sDHXJz6kY64v13h8rDjZkT+AOY+M879PN5/CYH6uMKNBnt9iUZlO/6Fz/4PuTfhOrva0t2HQCmxSImwWrcc1nvVkKUYClMIcI/rhEZeqN+uh7U24Rqbgz5Jk1TT5vhJY1WWWKryPbr7MHwIlPFWNRYnDfOq3X3LqIXjyguBvqU7tur61G2j6Y828NwkFDFJgzldOxKmsb7Ab78ktKlo14n4q8FfDwVsZj1wpfOFpK2MqflMK5ncPc65cfOCaDxkXY45yk4cyEWxrHxmQY8i1Gdcokz+UI5vOkeK7EFDKbpBjrIgd7kqc9j+lZXXO4MC/uBn/BP0ChodA+hjnHSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zy9NMFVtSVpjT0FoSklDODFYeHB6R2wzbmNGR0pieEJ5ODdwV1RpQlNnRWth?=
 =?utf-8?B?QStaL0J6U0FBaCttQ010SE1LcXpwa3NWTnBGU1ZZb1BOcStZc2VRQVd6aWdG?=
 =?utf-8?B?Vk5uSU1Tdm0wZ25ONHVJZGVCT1Q5QmRacWNFNXRzMzMxTDJxUlJmTnJNMUtr?=
 =?utf-8?B?TDA5TDlrQzBNNEYyWFFSeE5DZlN3NWZNZVorZGl0SUM2WlJBWDNyenZBaUVh?=
 =?utf-8?B?cGxoR2VUajFkOFBNK01hc1pMOW1hTGFENEoxeVBBVFBlL2owb055MnVCbFZh?=
 =?utf-8?B?L3prc1VGdjV3K1hHV3pUTkVhaTdrdmNqTVk2RVp2ZFlXZjJNY2tHVHZSd2Rv?=
 =?utf-8?B?WkJSeE5HY09hWXBOZ3BKblQzSzdUOHdBeUlVT25OMDM4akFWQUpLVytYMkFh?=
 =?utf-8?B?N2k1RzFJWmIxdVFJZXdNUHQ2UUJFL1cwaVp5SWhmQzNCTlliVXNrWFB4NGtI?=
 =?utf-8?B?Q0dIUzF3NHBIUGYya0h3YlhOYjZndFNzcnBYcjZxOExDbWh2NUNnUzYyRnQw?=
 =?utf-8?B?WEtWRlg1UXpGaUN1N2pZVm5uZHpnTzg4Q0owVXF1bEJOS29Pd2M2Q3BBVGd3?=
 =?utf-8?B?b29GeFZPb2tZOHM0UUduTklWN2czVTUvSmtScWxTRWE4NXNxSXNmOHlyemx4?=
 =?utf-8?B?Q1FxaTFrbFl5REVCUzJ4MU95b2FkUjhYMWhFQWJEWGtnV2ExUUk3N2xzTVlR?=
 =?utf-8?B?ZytiVlYxYUhUT3N6djhkSG9xRUdnd1dTbTZlOEFsVUR4N014cERvSVNFZXV3?=
 =?utf-8?B?T2VlNmZ1bzkyaWthaGFsaWFVV0E2KzJQV0dmOUQrRzV6UWdJOWd0UTJ2bFMr?=
 =?utf-8?B?QjJuMkRGeXZqWFl5V1lPbTNTemZoUFc1Tkgrb0ZiOVl1L1Y0NjlSdTFKLzVU?=
 =?utf-8?B?U1dORHRoeG1mOEg0eXlNNjF2dUl0RmcvTHVqeUlyUDVsUmttcjZENG9jSTZt?=
 =?utf-8?B?M3U3YmhXTUM4cmpncTFSSVJPMTFTZFlCTm9ITWlRSzVKUnppTklQZ01TYlhU?=
 =?utf-8?B?bUtVZGg3SzdtaXFQVnVvazlFZHJyZG11ZnU4Mi9WVThZOXZOTndmeEJnV1Fo?=
 =?utf-8?B?Um5hbmVZVHJ0UFFUTWt6ZUFHWGJyVjB3UmxJQW9wRTltckNsbnExbVB6UlRI?=
 =?utf-8?B?bkxMT1lvZHQxZFJOczd1eEMycDR5RjFEeDRubkNMdDNNcVFZclBnY0tkQjlB?=
 =?utf-8?B?TU5Dd1pSYUdaZ1AwS1JiUWVRbzdYRzRqd0hwZkc1ZXI0eHN5LzhGK09RUDBj?=
 =?utf-8?B?RkJORDB4K2JwMEVvT0tJd0hUTWN5UGNxdXg1M2UrOThNQXF0aVRQMnBvNGY4?=
 =?utf-8?B?bElNQmpyR1hlWHhUMXBzQ3F2dG5vSVJrSTBlYlB3WGU0bVRtMTNEaGRLTXhK?=
 =?utf-8?B?WXpuVmoyc3pZS1hTZFlwVWl4WERwN0xwcHhLM2xRc0tTN3pnOU1LVTJFL1Vr?=
 =?utf-8?B?NitVT1N6Y3VaeU5ZUFlNaXZXY1prYzFhM1NwYVk0b0xYSEZ3eUVCYmtDbHFO?=
 =?utf-8?B?REFneFJtd2JOTElSYjQzYUdxaW05dGpoRk54eUNhR2JIL0hDV2JBcjBCdnRt?=
 =?utf-8?B?Vmc5TlhVRGpyNWwrdjNFNWU2ZDhLSnlSZmg1Ymd0SGZPTWhTSmpwM04zMzhV?=
 =?utf-8?B?aFhNbGl6WjZYUVFjK1hIZmxVUTFpYjBmK3IzMytOeEIyUUdPbkRNUko1MjBG?=
 =?utf-8?B?UUloK2psY1QzNWZkQXU5bTFVM2hqeDJnNlJUSW15b1NSVHVXSFNLQVJwRDdR?=
 =?utf-8?B?RkVjSHJuNXZ3MjBkSmRMYUlpS1pPdjNZNmhHdWNIVzE5SlZtOFloR3dnb0JR?=
 =?utf-8?B?UjB1UEFlVy9CMmV3aG5kTFpzMi9zSEVWUjNxWXBmOTQwQUtoTmsvUDZERURM?=
 =?utf-8?B?dHVGUjYwTzJDNFR4ZWxYSjFRQ2x0eTVEZnl2QVJjdkZmYlNzWDk1NFQ2aWJK?=
 =?utf-8?B?VGhGVEpXS29Ob1R5ME13OFFuSHhjVVVmczFqb2RIN3dPQ2NXbW4wTUNsWEJF?=
 =?utf-8?B?ZGRXdGltUnVBaXRSWUNtZFA0NlphRWMwK0NsMmNvMUtwemp0Y0EwK0JuSS84?=
 =?utf-8?B?VkVVaS9VL1pjdm5uRGt4MkZmVW5lYlFTQ2hwZmNzYkRMZVhxYzMvaHAzeVo1?=
 =?utf-8?B?b2FBMHZJYzdWbkp6M2c1R1Q3ZUc1OUYwa2lPdThHcjVlYUNVdnZaZXIrVitm?=
 =?utf-8?B?SkZjbkdhZXY1ZXpsSXVNSjRaV3QzMjFhVzBSVW1renlaU0R5cHlZb2FONXFC?=
 =?utf-8?B?UWhJTytEYS9ETHdnVzAxMjE0dWNGZlZDQzNXWlVIRyt5d0RtY0gxWW5xUW5k?=
 =?utf-8?B?M25BcmdKQzg0S3krNzVoaVF3SzAvclY2WGxoWklFeUQ3dHpiM1ZyQT09?=
X-Exchange-RoutingPolicyChecked: JhimhVaRU2dSNvhzMvQSx4+G2ZQ8ZdY7y3DFO9iDJFTSlmewYh52Lo54mi0zZGiQmYelbSyodw05CSFnBbNSJGtoehTuS2pL83DHEqpOrYaXO1ZiHPp8ABgpdMggEEmg/fiW+epWg5QxmavfaVi1cpOJVMAX6dE59QpzUaQvBzrCJQ6e4aTGnJ4OnF8sDD+F7Rg12CUe4VFHuZ6XA2FKlljom7S3gKOKqLPb0LZpzRUU2kRBZuvZuh5+Ukm4i32QFG8K0e7vFlb4n0NGXrb60h/r90IRBDavOecde69BmnJ98oPHzmYQ4z3UAyuwmQgEOF6LJNI5CW486dK6uB538w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 574750bd-8a22-4043-4907-08df0a49f7ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:01:32.2075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKqarbDToW7IUz++vpfbfQAoBGK6SHy2qErA1gXrEGNazENPJrQm0XA7qz0purU5C1Uw+5bSN60sPUZJ1TT3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

Hi Mallesh

On 31-08-2026 16:14, Mallesh Koujalagi wrote:
> Make sysctrl_wait_bit_clear() return an error code rather than a bool
> and update callers to use xe_log_err() with the propagated error code.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Can you please respond to all comments in previous revs before sending 
new revisions

Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from 
sysctrl_wait_bit_clear() - Tauro, Riana

<https://lore.kernel.org/intel-xe/292aaec1-662d-466a-83a6-dc820dace637@intel.com/>Thanks
Riana

> ---
> v5:
> - Fix align issue. (Michal)
> ---
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 28 ++++++++++++-------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 72baf1aa4b3a..c36cac8c6288 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -11,6 +11,7 @@
>   
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>   	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>   
> -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> -				   unsigned int timeout_ms)
> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +				  unsigned int timeout_ms)
>   {
> -	int ret;
> -
> -	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> -				 timeout_ms * 1000, NULL, false);
> -
> -	return ret == 0;
> +	return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +				  timeout_ms * 1000, NULL, false);
>   }
>   
>   static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> @@ -146,12 +143,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>   	u32 ctrl_reg, total_frames, frame;
>   	size_t bytes_sent, frame_size;
>   	bool phase;
> +	int ret;
>   
>   	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>   
> -	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -		xe_err(xe, "sysctrl: Mailbox busy\n");
> -		return -EBUSY;
> +	ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
> +		return ret;
>   	}
>   
>   	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> @@ -174,9 +173,10 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>   
>   		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>   
> -		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> -			return -ETIMEDOUT;
> +		ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
> +			return ret;
>   		}
>   
>   		bytes_sent += frame_size;
