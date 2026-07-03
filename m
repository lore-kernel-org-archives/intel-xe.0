Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7BDC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B710E5CE;
	Fri,  3 Jul 2026 12:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lb8WA8Qh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9E210E5CE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783081140; x=1814617140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YM3Kdl5n2OHTu8y9s2U0ygdNhzABhlIfS+coRda+xSE=;
 b=Lb8WA8QhiBUakX+miJbjcbGq6AsVtOQM4IyPx/CGiv7jT9TH7JJHtbtU
 IZtqDXIfBDnsMRvq2JGVRcm9+S7D8IK8POy+X9Kcbk81qgvEJODKaM2Ty
 5A0U92wzurgwL6Qn2rNtf4E8WW9U1LcB+m5+u8rGQprmScKWZGI0vaTJY
 x9/GmP0kF0cyE9M85k12CpB0Ke/sIVCarlYNsqkUW348bFR6WujlqSEs9
 ZeE/2F7+HXfsZGRqaJw4JB+k+U1dlEwh/dY8cuIFrnRWEpK36qwhVKXi9
 YhjHJHtP5EdoRmpfnzPvtU13qCqV8aIP6ILSkr9wVXZ+Qu63Wl5AY2kvN A==;
X-CSE-ConnectionGUID: TgVx55byTK6e6P5Qf3f4uw==
X-CSE-MsgGUID: eg5HazXuSzerEfhGWJEwbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82822573"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82822573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:18:59 -0700
X-CSE-ConnectionGUID: i+Fg2tWfRy+0z4L7+V1hZQ==
X-CSE-MsgGUID: EM0dGuCFRG2g5THomA270g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291245018"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:18:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:18:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 05:18:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 05:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUpiqatmyKSVpc19pqMqKTldrL/puxKMrSdPqjbL8pjlYmJ/gRwitlZCj5EUEQhA5Z/tN3o0Y5hTXfkBsjQmQnoUAZKAVm/Whn2PkoCWCpu9Dt5qK/qS9Ij1VJDVhXWHU5Xsr4Pbkek66L2hm14IiMNSlZffK5zxvWL3kHTc41L+1jt3/M802jh+R7WGJw4bMaIAbl2plNDNUdPPiOZNfn9F6O27SB8ZiP9OYicPv50Vl2muU9RUwYOltSX5X9uo30kP0oqK8Z3oUJh6kNZQFAQMuWXCB70FV8kn+h8juqT6XDdc+0bJrq1Yp97faHDCpJmGYjtdLJqiPr4o1HkBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvMqnJvWJFZzXJuzmV7/QtR+9d5m2N8mGjCnUTikUD8=;
 b=sgYq4fqgLS96Wg0dGB+r3VkQFpUhmneeGM6RByKn9SA83yk+yXsNrvWBO3fsoHx190RehivULBIY9cBqVni57+jaBx5P0k6ajByM7KdCw9Y5aFbUNetVevyxJkUJGppK/Pz7VeDqbGWjDAXI5xUi1OthPU56abPDOj7W9DW0kvrF4jOLPF+baUIRW+ZN1/gSGhVULGrnuaU4AS01D/NSOE+u9DyGWaLkoXm3bf8z61NT6qE3qUbnB41fhpMuZKJ3hKr8JoVn6irmJ/Gb6NRQazXc+itCbMt73ZhV5OLMqXgiWAGJUWm9SRZnV3ENB62xpLSCj5UqaxC1weAkMR5m5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA6PR11MB187491.namprd11.prod.outlook.com (2603:10b6:208:5e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Fri, 3 Jul
 2026 12:18:51 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 12:18:51 +0000
Message-ID: <620aaf83-10de-4d33-b1e2-b5da5291d85b@intel.com>
Date: Fri, 3 Jul 2026 17:48:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe: Consolidate debugfs fault injection functions.
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>
CC: <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <matthew.brost@intel.com>
References: <20260616052931.72692-2-mallesh.koujalagi@intel.com>
 <22674c40-790e-4ee9-bcf6-8e118db2ea69@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <22674c40-790e-4ee9-bcf6-8e118db2ea69@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA6PR11MB187491:EE_
X-MS-Office365-Filtering-Correlation-Id: 1507dfe0-abdf-4c59-8f8a-08ded8fd3db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 1NhtzAk9W3ZVFbU5wiqV521yyJiUJXCa5PM/5eplfCQjJbmzeqvsCuEQpI4sgauIecsGjGLIoeR0kVeU7gp4AyrMveTtOySBveHmOsdWEDnqBn+TdfbdhWHnmAnyOMYh5NH/GcA7WFTXyq9XnSgPlhXGTuE0Nek49bYuV/TtUed7pJJHfG8omUC1Kt1akPT/QMmJN6943b3Ub64Yu0MKVKQAmFzEz6VlD60/64Zq0drkScwDf77kzidhqDdhqr+SNoKrxREfgReV6WJs8CGUCDK2dr7OtGFEnggQ+FrnPae2VjfhRiRkb9Am5vhDzLw96L5Fp510SQ/UjaKhHOSBRONmNlRjJ+M0chMAbCjVMb4jVjrAcWyH63H4+MS6O8gJPjNU4hb7VzhnS0Ii1Kva1Tp/ItoXlQm9OzbYeTpXbZRVYQV1jU9/FYlnsOr+k1gp3nXNxCLr+kJK7n8ljmyJ9ldkNLi+1S/kizcGehOmduPsCpUx3n8o4+KGnAHZkZPob94IbbeeYA8XeLZMlOaQMno5KyApszHP34xBkxCHtCfQbWUuUuMoHkiIxmwXMQhi2t11IadeGS5pXuVhWy4oerXJJbKT2vdKpldn6X4UXeVEOJzYwaGqWbhhdl8bI2DQ3FELwnDdeQsgaJskx7TFSQv46MFtj/zE0Bw1MOA0Dnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cllXN3BJNDdUV01Hb1lUd3VsWWNJcUlmMHY3a2FDT243L3RwWUFGMFZDcHM4?=
 =?utf-8?B?d3ZZWnZLbVlBOHBib2NTOE0xUm5IbHVta29wRUdnOW1lM2MzRXE2SXQxN1J0?=
 =?utf-8?B?YzIwdjVpWWxrVi9UVjFKUDdFSGVKTEFNNnUrNUluT0lEZzhnd1F0Ui95UnJZ?=
 =?utf-8?B?MGY3bUtJNDZEekdIUkhiYXZBOE9QOEJKVnpnTVNGZVhNZ2xmTnZnNEE5TXhQ?=
 =?utf-8?B?cVMvQVV6QkFPaUlyWGxwZ2VDd2NCV2szKzNsTWw1ZGs1QkNFL1poN1Yrc2xo?=
 =?utf-8?B?RGMyWHNLbnJGZGtoVmxaN2pEUDlacVR0V1VTQ2NNY014aGVOOW8wdm9SRjgx?=
 =?utf-8?B?M0pGS3RFVlV0QjVhMHI5aHV0QWZaMzdMLzBWd3JSMnJ4OXp4a3ozUXhocHpM?=
 =?utf-8?B?MHZFQ2Z4R2FLSVYvdDlRdkJqNHZVY3hsN3BEcFhlTzB6S2VCamM4aHdybjA4?=
 =?utf-8?B?VWQ5dVpPRWRwRlJJYTdDUHplSS9oNmpTSm1YdmVJamxURlpNUGh4UTlNOCsr?=
 =?utf-8?B?WE0vK2tUekhZNG1MRWROSytLcWtPZ2xsS0UvQmZONVBob3NpSXBaWEtzTmlG?=
 =?utf-8?B?UWlzUGppdTAvSkVPcnRDUjVocjFyRURZRnR5Skw2OEo0eGlodFpJdmRjMDNu?=
 =?utf-8?B?WjlIQkU5ZmtzYU0relMwN2ZGM0ZPdHFvemFUV2x4MFZSUG90N1JCL1ZMTWRk?=
 =?utf-8?B?QlZ2M2hlaDZ5TE5oMzA1TEtQY2xUZzFvT09DTjVNa3JFVGpwUHFON21jMGts?=
 =?utf-8?B?ZStjN2Z6anRhbzhBMy9WTlRBSUs2QlZZcmx1d1lqcysxS1RuT0JudEtUS0tv?=
 =?utf-8?B?eUMwUzM4Rkk5ZHdQeVJVRWE5M0dsVm1wakI0WUlSZ01yOFRsbDdWbDgyVlBR?=
 =?utf-8?B?a09MUFNWNU51UjdMY0hid1R4QUc4c2FodlUxZTJzWU9GcEcwY0tsMzVlZHFt?=
 =?utf-8?B?eWJYTHFTaFRFT0ZrWCtCcHdRM1FSYktJK3JhVG5DazgwS0wwT0lvek4yTDQ4?=
 =?utf-8?B?T1RHdXJkbGl4L2UxTmpib3VvWWFZTXhtTzUzRWFBN3FiYytRekNiVjAxS3BG?=
 =?utf-8?B?WVlEd2FzSXZDTlBCdC9VUkhtcE4yS3lBYTVQcHl3eXprRG02NVU1ZFg1Zk5p?=
 =?utf-8?B?SVhlV2xlY1kzN0xyU0lJZWRMYUQ3YVMzano2RVZaY3k2Y0k4UG1ETUVjVnRT?=
 =?utf-8?B?dy9xeGVtZnM5YnFFUVlacGdnSFlIYVhFelNtcFdmTDFsNHN3eVRUV0k3WTY3?=
 =?utf-8?B?TGxGY2tZT0xrdC8vcVZTVUlaVUpFOUQ2VWtveXdGRVhjd0FvRTVGbllNM3I2?=
 =?utf-8?B?Vmw1a1d0Zlk3WEF5ZVJrNVJ3VnN4SjJmcG1PS0ZIaG1PVWNCaUJEeE4zZDBP?=
 =?utf-8?B?V2QvS0swM0N6aUV4bGx6T3RWL1NyK3o1aVc1VDIrM2ZvK1dIazl0MDY5QWdK?=
 =?utf-8?B?MjJNRXB1cjBKWGdoc0tJcDVRaXo0WmllN3BHbTc2TE1MWkczbUtlWjMwLzFS?=
 =?utf-8?B?QWFUeHJ2Z0RxVURCMlZoa3JGdTR4Yzd3WGZIWWJHN1NRR0U4dTNPYmVRSG9I?=
 =?utf-8?B?cCtGOGpEZjgrK21oMkJLQlVLUVdoSEYzbllCZlpCYmh0b3Jua2tRWk9YZXBy?=
 =?utf-8?B?N3g5VjgxdUJCT1dtaERubkpLYkVXYWRvaDZuYmY5eE9SY1ppcjBRNFJQZk5i?=
 =?utf-8?B?UVF2SG1SVzFvM245cVcyMFNZcUN2NE42YlZsWGNPZ0FXYmRnV2JPMXp4WDln?=
 =?utf-8?B?Smd4QWovOHA0aVpVZVN5ajNpNU1NZ1BMSDgyZ1dtalpGL1NZSnhtSVd3R2sy?=
 =?utf-8?B?dy9wai9sSFVEbU4xM0RYN2lZTmQvWFJmYVVGdUhZTUZzS2VRQyswdUVNV1l0?=
 =?utf-8?B?eFV2QkxmL3l3QWtYWE1yVmxvZE1yZ2NzUnd4bmQxS21rZW5qVTlManVoSytJ?=
 =?utf-8?B?L2ZFVkZPNnUzUXJuOHhpVzFDbSs0R1E0L2FyNHlLeVhpTWExbEZNZnV5cjdZ?=
 =?utf-8?B?dmkzazBXZkZFeHQ2WlNWRGl6enZCY2lTdlQ3L2IwakRFVTB6YzZyWWRvb3p4?=
 =?utf-8?B?OFlYVUIwaFY0YmVtalROcWJ0WUY5KzJxSFZLR1p0eEZUQ3phdzVQalZ5QVp6?=
 =?utf-8?B?dmFMSW0rWHdxanpITzJJRUdjbWU3R0Fpb2k3UnM0azlLWkh4NmNrLzY0ZFJq?=
 =?utf-8?B?TlhSemdxVkVGWTI2WTZXTXZ4RVN6VmovUEVFVGlLVE96MWtySE13Mm9ieDZY?=
 =?utf-8?B?Q3FidEh2RlYzVXQzT3hCdWN1RW9iWUgwRUFWcTQyT1ZkM3hKKzVuSTR4MSt2?=
 =?utf-8?B?ZUN1SGFaTllNbklTcVE4MnA3VG54NEZwU0ZmdkNBK20rejlySWRLUHVoWVNt?=
 =?utf-8?Q?CKWm2PvBY8vuWwrA=3D?=
X-Exchange-RoutingPolicyChecked: R8l+G2tDkPYUy4y5ap35q6GFPxNbpJL6NyHKrQeRXRRigLprrHQ+FJpNPj6BUzaF8VmfgFlInO/BrO//X02/kajlsEAXt9PWVVTyOhL4xzO38GXL6J46EH9jr83nEC1qvYK8GMEtPWB6YMjcX4h1PoGEo49nniPnZ0KOa3ulho7rWucRErQS0FEcLwrQMlXmgei7RT6W5e+GXjC+xzfwqDE61XtB9OsBfXabEADIWv0t2rXQueP108vu12Fh5cbCw6I1iPdTtsdNgBlHAoQ2AziyPmTLeSgHHSJneccO4ixE2Zr4jFejdY/44i3V3qEYzKMS0fbeD1to7uCIlzTtDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1507dfe0-abdf-4c59-8f8a-08ded8fd3db0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:18:51.2120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFmEUnHqxnQRLL6tuIElOHlWiZPqgTTwfWQbTQlcnieDpzOOSXUDIQf86k0NtNTmeKjoGB8ZAZAF7V4jvwva/xyTAoQfC37jpB2HljFEtpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB187491
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


On 03-07-2026 12:47 pm, Tauro, Riana wrote:
>
> On 16-06-2026 10:59, Mallesh Koujalagi wrote:
>> The fault injection code was scattered: the GT reset
>> hook lived in xe_gt.h as an inline function with its own global
>> variable, the CSC hook had a separate global in xe_hw_error.c with
>> an extern declaration, and each was individually registered in
>> xe_debugfs.c. Adding a new error type meant editing many files and
>> copy-pasting the same boilerplate.
>>
>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>   - fail_gt_reset         - GT reset failure
>>   - inject_csc_hw_error   - CSC firmware error
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> v2:
>> - Add multiple platform support. (Vinay)
>> - Handle VF properly.
>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>    create xe_fault_inject_types.h file including those name.
>>
>> v3:
>> - Solved patch apply issue on tip.
>>
>> v4:
>> - Add proper header file.
>>
>> v5:
>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>> - Change 2025 to 2026.
>>
>> v6:
>> - Change return comments of xe_fault_inject(). (Riana)
>> - Remove full description of xe_fault_inject_debugfs_register().
>>
>> v7:
>> - Move all fault inject helper functions in xe_debugfs.c (Riana)
>> - Update commit message.
>>
>> v8:
>> - Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
>> - Remove CONFIG_FAULT_INJECTION block.
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c  | 45 +++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_debugfs.h  | 16 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt.c       |  5 ++--
>>   drivers/gpu/drm/xe/xe_gt.h       |  8 ------
>>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
>>   5 files changed, 63 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..b3899bedf70b 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -5,6 +5,7 @@
>>     #include "xe_debugfs.h"
>>   +#include <linux/bits.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/fault-inject.h>
>>   #include <linux/string_helpers.h>
>> @@ -41,6 +42,46 @@
>>   DECLARE_FAULT_ATTR(gt_reset_failure);
>>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>   +static struct {
>> +    const char *name;
>> +    u32 platforms;
>> +    bool skip_on_vf;
>> +    struct fault_attr *attr;
>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>> +                    .attr = &gt_reset_failure },
>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>> +                    .platforms = BIT(XE_BATTLEMAGE),
>> +                    .skip_on_vf = true,
>> +                    .attr = &inject_csc_hw_error },
>
>
> Here are my concerns with this patch before merging
>
>
> I'm not fully convinced by this structure.
> As we add more types in the future — fault injection that depends on 
> sysctrl, guc
> or anything else. This will keep accumulating.
>
That's a valid concern. Right now, the struct keeps adding separate 
filter fields (such as platforms and skip_on_vf)

for each entry. If we introduce new checks like GuC readiness, SysCtl 
state, or GT generation, we'll need to keep

adding more fields.

A cleaner and more scalable approach is to replace these individual 
filter fields

with a single availability callback that handles all dependency checks 
in one place.

This keeps the struct fixed and makes it easier to extend in the future.

Please let me know your thoughts or if you have any comments on this 
approach.

>> +};
>> +
>> +bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    if (type >= XE_FAULT_MAX)
>> +        return false;
>> +
>> +    return should_fail(xe_fault_inject_entry[type].attr, 1);
>> +}
>> +
>> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>> +                         struct dentry *root)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>> +            continue;
>> +
>> +        if (xe_fault_inject_entry[i].platforms &&
>> +            !(xe_fault_inject_entry[i].platforms & 
>> BIT(xe->info.platform)))
>> +            continue;
>> +
>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>> +                      xe_fault_inject_entry[i].attr);
>> +    }
>> +}
>> +
>>   static void read_residency_counter(struct xe_device *xe, struct 
>> xe_mmio *mmio,
>>                      u32 offset, const char *name, struct drm_printer 
>> *p)
>>   {
>> @@ -563,8 +604,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>           drm_debugfs_create_files(debugfs_residencies,
>>                        ARRAY_SIZE(debugfs_residencies),
>>                        root, minor);
>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>> -                      &inject_csc_hw_error);
>>       }
>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>> @@ -610,7 +649,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>         xe_psmi_debugfs_register(xe);
>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>> &gt_reset_failure);
>> +    xe_fault_inject_debugfs_register(xe, root);
>>         if (IS_SRIOV_PF(xe))
>>           xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h 
>> b/drivers/gpu/drm/xe/xe_debugfs.h
>> index 17f4c2f1b5e4..beedc7ebdaaa 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.h
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
>> @@ -6,8 +6,24 @@
>>   #ifndef _XE_DEBUGFS_H_
>>   #define _XE_DEBUGFS_H_
>>   +#include <linux/types.h>
>> +
>>   struct xe_device;
>>   +/**
>> + * enum xe_fault_type - Fault injection types
>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>> + * @XE_FAULT_MAX: Number of fault injection types
>> + */
>> +enum xe_fault_type {
>> +    XE_FAULT_GT_RESET,
>> +    XE_FAULT_CSC_HW_ERROR,
>> +    XE_FAULT_MAX
>> +};
>
> I would still prefer an abstracted function.
>
Sure! We can define a named macro for each fault type, such as 
xe_fault_gt_reset() and xe_fault_csc_hw_error(),

as thin wrappers around a common dispatcher like

#define xe_fault_gt_reset() xe_fault_inject(XE_FAULT_GT_RESET)


Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>> +
>> +bool xe_fault_inject(enum xe_fault_type type);
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   void xe_debugfs_register(struct xe_device *xe);
>>   #else
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 783eb6d631b5..eda8df8adf11 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -21,6 +21,7 @@
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_assert.h"
>>   #include "xe_bb.h"
>> +#include "xe_debugfs.h"
>>   #include "xe_device.h"
>>   #include "xe_eu_stall.h"
>>   #include "xe_exec_queue.h"
>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>         xe_gt_info(gt, "reset started\n");
>>   -    if (xe_fault_inject_gt_reset()) {
>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>           err = -ECANCELED;
>>           goto err_fail;
>>       }
>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>       xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>>         /* Don't do a reset while one is already in flight */
>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>> xe_uc_reset_prepare(&gt->uc))
>>           return;
>>         xe_gt_info(gt, "reset queued\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 4150aa594f05..f8e3ca63aabb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -6,8 +6,6 @@
>>   #ifndef _XE_GT_H_
>>   #define _XE_GT_H_
>>   -#include <linux/fault-inject.h>
>> -
>>   #include <drm/drm_util.h>
>>     #include "xe_device.h"
>> @@ -38,12 +36,6 @@
>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>   })
>>   -extern struct fault_attr gt_reset_failure;
>> -static inline bool xe_fault_inject_gt_reset(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&gt_reset_failure, 1);
>> -}
>> -
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>   int xe_gt_init_early(struct xe_gt *gt);
>>   int xe_gt_init(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 4b72959b2276..bdbf87eb743d 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -4,7 +4,6 @@
>>    */
>>     #include <linux/bitmap.h>
>> -#include <linux/fault-inject.h>
>>     #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>> @@ -12,6 +11,7 @@
>>     #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_debugfs.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -25,8 +25,6 @@
>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>   -extern struct fault_attr inject_csc_hw_error;
>> -
>>   static const char * const error_severity[] = 
>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>     static const char * const hec_uncorrected_fw_errors[] = {
>> @@ -167,11 +165,6 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static bool fault_inject_csc_hw_error(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&inject_csc_hw_error, 1);
>> -}
>> -
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>   {
>>       enum hardware_error hw_err;
>>   -    if (fault_inject_csc_hw_error())
>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>           schedule_work(&tile->csc_hw_error_work);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
