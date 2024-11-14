Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5CDD6A22F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 21:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1897C10E378;
	Thu, 14 Nov 2024 21:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZ33vjio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9210E378
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731618746; x=1763154746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fLoCsWfsoE6mII9tS4Z4H3JtWVNrYx3aovrrnjvjs8Y=;
 b=OZ33vjio8l3FHpbnioDRo8Bmn0PW6/KlMu+qPr/Pn7cgDukFNVjyR6zm
 jqzgckRy1oGOGuGnGOTsW8bdo5dPLCqQpFeEj2oo0yiaMOFPl8O2ohcm6
 sRqOqsF6VvAUJ9/F7fwcL3stgug5BKdUTpDHx5d863GiBiK0YCwSKVYYt
 OgvQiY1wLfvUoM1t9mU3XwLkpfW/WMicTMAqGWMDIf/snSFgpT68APH6B
 RmYETmy+c0IXPYVfHhSkRZ8dlyTxdDxPm5gGbiBmOFxOemEU0gxeGqj+z
 pgL5NzE369BNJzQPLJo2Ohqo9Q5fVg89yiiFdUwt4sCQvZvQ6jYmKV/Ek Q==;
X-CSE-ConnectionGUID: rRbx27D9TG+TsOC/acv19w==
X-CSE-MsgGUID: lsfm5QrxRrCELSxc9WYUOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34458379"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34458379"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 13:12:26 -0800
X-CSE-ConnectionGUID: 647DIEDGSB+01LhFV/HYqQ==
X-CSE-MsgGUID: X3dycObaRS6kyDS37iAT/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93284482"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 13:12:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 13:12:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 13:12:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 13:12:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaOhYyUiw8HQFJ7ScwawI8nh1PtRYLcCu/JuGq6db7QraDE4U5AtUONgC4QDMHEqNaXK7qkERS7pWhG5Q0aXdxyhik9IvYELTBS2EQ8lmVMz92bPKbT0oTYnvjz2ELEubmfF3QNOdfqfRJem2S9Ms/M0tIAiBM9bXSxWKK8EWShsBXBXYknEO7HIoRV9i4KlnZZHO55Ovw2hyaeHHq0B1LJCUmTtRaxLU8/7eL2b2viJqhXqcCBlZRRvrWKiMJwCbugDZbaPhLa73BEd6c+Z0EA2gMcaz0CED4HS/ls3bh73seh8xetrCK09wC8nQ1/LTu7ZaV7zUDOEFUo3r3Tx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qT7nWuE5uQmgTx3657It0sgeC8nbBkwrmyzrmgXcDdY=;
 b=Cz7ULCnecjnnWyqYw3q7jSgAy4GG/1GHYjPYLmYyFV4ZaAXgm6+tdV0qrxGDW8DdkozwB4LdROGjvBf44RHHtO232rhmWTmsA9tDVYRBOFHW5Uym4uSEu8ZuZK1NGamgVRcE9nXUW9z60t1nBX+VlU0u5nw341KeLe1ZWLA7hv2LjQmiuk8ArqFwPLbzesPV4BDSNsdqaqYDnFwA0KBbbwQRKrdDvwLm/Rlmxt69SluQ/J95rWhW+YNqoloyCbqiHzDwISdTl8tfBTytiyxrQoOOJG7bfzOIsIxcm3c8UVqyXvkEMTfh7w7TJjtcg4jKK1hAsJZ8wjrsPK3gOYzxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB6856.namprd11.prod.outlook.com (2603:10b6:510:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Thu, 14 Nov
 2024 21:12:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 21:12:20 +0000
Date: Thu, 14 Nov 2024 13:12:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <ZzZnsubeuFrar5S6@orsosgc001>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241113045549.2390980-7-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:303:87::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB6856:EE_
X-MS-Office365-Filtering-Correlation-Id: 386a2444-615a-40fe-9877-08dd04f106d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0ZOQjROaHNVYVY2bDZNOUJFRWgrWGRLVFljSzQyOGxzQlltMlltdlpWSlBp?=
 =?utf-8?B?WU9xWlcxLzBQbXNHV0E2dnRlUHNMQjEwa1NYUDU3M1NvcWtsbkFKWjRqazZP?=
 =?utf-8?B?WjBJWjFsUE4wMXB6aGNKYzBMcm5DVFBwL0IrODM1UmtzVk0vWGFWcDlGelps?=
 =?utf-8?B?WkoyK2xDQVRSNzJOWU5xZklzVldRemVJSjFLcktJQzhKWmxrZUNpVTFKajlU?=
 =?utf-8?B?UmhJRktjTUU0ckpNMWduMStuK004VHJCMkd6M2hrdmg2TmNlVkVITUUveTdS?=
 =?utf-8?B?SU1pTmRzNU81bEJPcSt2RklTVUI0OUs4WDNaTCs0UEZhMnFQTWhEMDlOSndG?=
 =?utf-8?B?RFB3dk9oME1DcEV6WFFGeFZqSnJCK3hrQ1VJWnlaUkZWUEo5YzJSNmRtbC9Z?=
 =?utf-8?B?MjdZcXAzRml6MUxRcDhkOGptTnBBWlFWWC9vRlBma2ZkUU8yNjlmVnJkVnhC?=
 =?utf-8?B?Mm1wNUhUTUdrZjlzRENYVXRZVHBobHBNbnZydldkeWJPNHpROUNQaTFZSG1X?=
 =?utf-8?B?cm1XWDl2cjBWR2luNW5UWkRpUDZIUEdiUW11d29LWFAyODdUZ1VCZjliYUtn?=
 =?utf-8?B?eFhRWk14MExYQW9NdzJKdFllS2J3RlZNUzlUZXgxWEt1aHY3T3R5cEg4ZHY5?=
 =?utf-8?B?Ym1FSFoxVCtwekNsZmtZSkduM1VhdkdNNlFDMWRrakt4VmtWVTVRK0pHSlRC?=
 =?utf-8?B?RlJMeEdJMGtGRlc1bWg2cW1IZmd1RzE2dWEweDlLWDZlOVJBMkZxSjU2WGVN?=
 =?utf-8?B?eGJVWXZwaEdtRy9WMkx3T01pQTg2a1k5bWhmdkZDRnVvenRuWWo1bUJRUHB0?=
 =?utf-8?B?YW1IcWZsc0t0dHR2YXl0ZWNWdkxwVExwdENMNEppcHJMWUhldm94ZzJPTFMx?=
 =?utf-8?B?dHBQVHJJTXowNk5XMFpQYlVZZ0ZNTWMzc3I3QWZ1V1U3N28ydVVGcjRyMVJC?=
 =?utf-8?B?L3FJcXp1NW9oUTlDd2NMTnJzd2xYUExLUWFBdms5Ykc0ZEtwWGdlQlpUTlM4?=
 =?utf-8?B?VWM2OTgvd2p5T1E1SUpDQ3gxVXlFQ05FRnZzQXJMbVFHM3ljNWxwMHdod3JB?=
 =?utf-8?B?eHBTdjdHcUQ0ZGdXUGw0WVZGK3U3SFJsSGdLTVNRR0F5ejVFWW9xUlRFY0xD?=
 =?utf-8?B?SVV5ZmhlK0NhOFAwNS9EbUkzRmZLTExmSThXMVp3bkVwWWxYUkVadm1kVW84?=
 =?utf-8?B?QXk4NlAvQTVOU1p1Ulh3SzBONTJqVTdSTVg5dzAwc0V1R3VDZ2RYSGZqdWlP?=
 =?utf-8?B?Q0NWMkEwUHZXNjM0NEZzU1FkaUtvMkwxQk5XOFZVRHdVMVJJSkY2MDByR3Fy?=
 =?utf-8?B?Z2hZZWh5S3BLL3lRQUE2ODNKUXN5QkxJZ0tCdmhHcnc0ODlSdmpHUzFLa25L?=
 =?utf-8?B?Wm9DdU54bmxkZDBaSXl2VFZ1M0RhenRhclZDa3drbG92c25IZm81SE9tQnF6?=
 =?utf-8?B?THlid2pSREU2SHhrc2VLRVZmRXUybGUxSUFxOEFudFNLVGlQeW9Td1Q0akg1?=
 =?utf-8?B?ME14QXNWZXlmQWxJZG8rU2hCRWhpcWtYWE5Va1huSjBWWXJCNS9jTWVUbEdW?=
 =?utf-8?B?VklWUDhUSnk0SHp3WGNqcCttOGpjN2FOVnprMnFiUXVrUkhkYnVPMmkvMS9r?=
 =?utf-8?B?YnFFdkJEUDVDZFhuYWlQMCtBRkVrRjZBZVFseVVoTng4QTlsRWVFSWoyWWNl?=
 =?utf-8?B?WTg3S3Mxc2hBRmZPbmlvMWg5aGVMQld1R1QyLzhDUWl5YUMzVldwQzBUdE8v?=
 =?utf-8?Q?wMpyvmDSyqfeLyeIci825zf7x9MXc+uG1EdAT91?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkhSYWpyS3cxd0V1L29uTG5HY3lJeWtaanB6cTZvb015WWcrN3NwSi8veTBY?=
 =?utf-8?B?WjdRUEdkT3M2NTlReG5jdCs2aGQ3VnRSeE1MQXdRMmFycFU2YjY5bmRiWHlC?=
 =?utf-8?B?TWNoRm5xWkNXRmhKUEdHYlR6bXZ6TE8ycFQ1aityNVA1T1BLdTlYNncvSE9Y?=
 =?utf-8?B?MTd6a0hRSTRMRUhtRGtuRzRqbkFISmFsclJRVXpZTGNkcFVZaDVrLzdSWTRo?=
 =?utf-8?B?Z0tSMlNKbEU1UkNsL2dRSFcxcUhIek51SzhPaVRFNURSSUtJVUNHWEZ1cjlO?=
 =?utf-8?B?eVdMSWFVdjRLSWwzeDFjbFNGd2Y2WmQ2UXZlNEtKc2IxNW1tUHhNTWNEQjV6?=
 =?utf-8?B?Vkx5LzBCVlVDdElvM3BqZzlkUVNLQXJSeHRJaFJxY01zRm1Ld3FCR1BEdVZh?=
 =?utf-8?B?TCtUdG5hdDZsa0tCNmZuNGxjWG5iYWFKeXV5dU1Gc0pCOVV3RjhmYjBKNmNZ?=
 =?utf-8?B?Y0taRHA4Sk5WT05tUE1EUmdtQ3ovQythVjkrMVBuQmNlUmI3MUhpVm1VREJV?=
 =?utf-8?B?Qzd2TmNKb0F1NGVyVElJZzV0bE9hYmVpeXZpNmZRckNMUFhEaTBkYnJqTzJl?=
 =?utf-8?B?TEt2K3krMTgxNG5ycGcwUHh6eXpJM3hqaHQ3TWFSVXlCcjJ2MkhPRlo0bGhC?=
 =?utf-8?B?bUduUHN2dkFVaEVkSkhycE9jSzBZbEEyOU4yMThPQWRMUVR5SThvWUY0Z2I1?=
 =?utf-8?B?OXMzOXRKUkNUUWh3SlgwT0ZzaGRjRXMzbHhjeDQ1Z0tMdll4dC9PSERqRVNM?=
 =?utf-8?B?bWlLUlZRMzVmdVN1SkxPR0h4R2NtUWw5M010WVJQTEZvMTQ0dnBzNCtqZTVl?=
 =?utf-8?B?dEZVc3BVTzhLQ3grMXQ5RVB5azQrVmU0VGdIZ1padUN6blhqUGVtYjlubTNm?=
 =?utf-8?B?b00vNTZ4NlJNS09QeWRxazFNYlNTN3E3SFhidTFIYUJ3NGlYZ3F1QzNOdUVT?=
 =?utf-8?B?U1pQKyt0azFJKzhCREh1TGkxM0FnMjl0eXJrOUhFVlYzNC92WUZzNDg2dzRQ?=
 =?utf-8?B?T3VRSVBxdVlwNGFjMFBmOEVjenlJeUJOYk1wdGtQSk9BcERBSTY1QUdLZ3oy?=
 =?utf-8?B?a3Mxeld1RUhFN3N1dDF0SjdHVU0rR25RbU5yS0h0cWZtdkhMWXc3ZTNWakpa?=
 =?utf-8?B?cTE1ZWx0Q01SOHZSVGlCaC9xeWVidVZBV3lBSVJjWHZ4MS85ekpiVTlpdFc5?=
 =?utf-8?B?UEZiZWpxQStDekFucy9PSHI0dUNZS05UOFR3Mm5FbUVyRHJoRDgxR1Z5TmU1?=
 =?utf-8?B?Z2lnK1BKRU12eC9LaTJlbHN5UGpLbjBoRVV4dTR3akp4RS9wRDhib21MNHYz?=
 =?utf-8?B?S1FmM2w1UWZiWnU1WGhudzFLR3pBQlVia29ZbVAvUU9oZnBiTjRBMDh3czBY?=
 =?utf-8?B?SGlPWGw4TWZodWRWNjh0czBaa3FuOStKSmw5SlVDNGQ3aFdhZ01INnBta1dS?=
 =?utf-8?B?L1JISkNuREpoYmJtSVJjR3JUbTdFRVlpOFNaYTJ5ZVBuSHhhS3E2alRUeXBR?=
 =?utf-8?B?Z3hycHpVSldtKy9TMUJJWkpYemxTRXZuVjRJVXNCNHZ5SjAraS9VUENmUWZ5?=
 =?utf-8?B?R0d2aXBJa3psWTEwdmxPcGhPc0JlZnFvbmNSOFdGdkwvNXllWGloeWVoVTJk?=
 =?utf-8?B?WlFEMjhUOVg3Z0V5VUQ0QWx2OTJrT3BNLzB6bVZUaVhFRnJoZmcyU3lHYVJo?=
 =?utf-8?B?aWIrQ2hZQ3pnNzJ3VkZJNnlsa29mRUpYN2VaZXA5ZTkwYWM5dVV2bG9kL2Fk?=
 =?utf-8?B?MTZ2Nmd5dzczT056aEVaNHROMHVhSTAxUVVzYTJML1NNVXAzNmw1VG80YzIr?=
 =?utf-8?B?Mk1sNURGeHFSaDkrd3pSajRweGJ3YUZwU3pwZU45TEMybzdNdHUzNVcvSEdo?=
 =?utf-8?B?dGorT1lhSWJ1cytoVkp1RDlrdlQvNFJ3L3NvbEtKbEIzcjBiTEY3RE5WYytk?=
 =?utf-8?B?M0s1bWV3c0xqbGtCdG4zdmhVZ3Q4WFUvUWhFVllyZVk4ZGNWdEt1UFU5dXpV?=
 =?utf-8?B?SXVjWGw5cFgwc3kwMlNiNUM1ZjJjSFVmbTE0L0VObVh5SHZFSzhQTS9BMXNz?=
 =?utf-8?B?d1BEcldTUlA2TUhHWWNtWjVBY25iOUNDNDY4TW44TmQzQTZSSTNtUWkyQW9G?=
 =?utf-8?B?RUExL3JnWmNkZjJZTDAxNytRZ3NEWkdjWFpRZ0luY0FLWHZhZkhKbVY4aDhO?=
 =?utf-8?Q?RC08RFYcrLYN9vTjsSnlylw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 386a2444-615a-40fe-9877-08dd04f106d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 21:12:20.6229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bD7V25yKuOgmHJd2hxW0IeZvvf6RaLtueD4mDa7zhHpWJlnu2ias+C+HytGdU+FvPMh1t/77xC9sGoXtM/sNecFeE2OIZmU0unF76Z3uB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
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

On Wed, Nov 13, 2024 at 10:25:48AM +0530, Riana Tauro wrote:
>Engine busyness is supported only on GuC versions >= 70.32.0
>Allow enabling/reading engine busyness only on supported
>GuC versions. Warn once if not supported.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
>index 7a2ae09d23de..fc34dcf3057a 100644
>--- a/drivers/gpu/drm/xe/xe_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>@@ -236,6 +236,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
> 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> }
>
>+static bool guc_engine_activity_supported(struct xe_guc *guc)
>+{
>+	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 32, 0))
>+		return true;
>+
>+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>+			 "Engine busyness not supported in this GuC version\n");
>+	return false;
>+}
>+
> /**
>  * xe_engine_activity_get_active_ticks - Get engine active ticks
>  * @hwe: The hw_engine object
>@@ -246,6 +256,9 @@ u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_active_ticks(guc, hwe);
> }
>
>@@ -259,6 +272,9 @@ u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!guc_engine_activity_supported(guc))
Since total ticks is used in the denominator, UMDs would run into 
divide-by-zero if they implemented this feature, but do not have an 
updated GuC. We ran into that issue with some older version of this 
feature and UMDs patched it up in their code. Do you think we can return 
the cpu time here converted to gpu ticks? That way with unsupported GuC, 
UMDs still get 0 busyness.

Thanks,
Umesh
>+		return 0;
>+
> 	return get_engine_total_ticks(guc, hwe);
> }
>
>@@ -272,6 +288,9 @@ void xe_engine_activity_enable_stats(struct xe_guc *guc)
> {
> 	int ret;
>
>+	if (!guc_engine_activity_supported(guc))
>+		return;
>+
> 	ret = enable_engine_activity_stats(guc);
> 	if (ret)
> 		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>@@ -298,6 +317,9 @@ int xe_engine_activity_init(struct xe_guc *guc)
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	int ret;
>
>+	if (!guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	ret = allocate_activity_group(engine_busy);
> 	if (ret) {
> 		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>-- 
>2.40.0
>
