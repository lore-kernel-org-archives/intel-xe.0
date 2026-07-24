Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8B6C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 10:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB88410F366;
	Fri, 24 Jul 2026 10:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpbU5DWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB1910F362;
 Fri, 24 Jul 2026 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784889274; x=1816425274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oESTd6GIXJxa9kRHoYLMQ/USXUKqrRa16I1gjQATG0I=;
 b=VpbU5DWrMZjWVzWv+ZCyUlTb6geGW4bX+Bi19LF34Id1UXqcUYYPHCz/
 X3A+35CWaZHmvjrHnRW1q0wfp9XdH4tJ0zk28F6z21p9pJI12JCgxSn9S
 ZxfQtzC12KAQ+SIbyXYyjJ7ohOP7AJC5YnTA9sr554Zs9AS3I2EU74G9S
 fztk+AFjCoVbMvmXxvnjnqXfQ6XFrsoATx91awwza4UHqSuANUDxgIpzA
 ZaUst1Ld4gCDLUs9f7nflyxR8GvzYXIGHarNcEWVoHPD8WbhCF5DAL6GK
 pZP05gK0nw+gQWJAk08HYOZ91xtv22xU00cW3JdmVTQzuOMWdz+FJEvHc w==;
X-CSE-ConnectionGUID: MNmvF9whQdC6jBu8Y60Kag==
X-CSE-MsgGUID: zsKwCYx4Svuji74p53KsgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96219227"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="96219227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:34:33 -0700
X-CSE-ConnectionGUID: mx12GBJcTmC9P8y7UA5Gig==
X-CSE-MsgGUID: yWZJXCsNRU+0bS6phj9d3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="254364605"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:34:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 03:34:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 03:34:33 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 03:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtiFZ3gs6mrzcrBPRvZZI46QezahRelCyfb8GQbvlU+dLcRExC7iDpMwLAn+VLyqCjKuFTt/rMXO+BlaChIA4qc3D78pDjPa5t0C+W8Hhm7Yx4ht9mDsqMDTA0dl3PExjbz80x9NzSciLC8cZTAP2blugTiBMxAkNB4mD+UTEZ0b7HY4HqPsEGa4brmKTMj3P6iN4WlBaodWikkYcdhbIw8bWO3vsojbI1KB4oBa2DGElIRac/IKy3tmfj3g1p/0q1ffdPM51vm5Bfs+4MpMSjljL0fWsDifvCvIHuBUsg5Hz/Iej4Mv2Z7xnUXsbK7yqXsfBEu8UiRyuxbB97cXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM2gwuG3MOvrsnL+rlt43Elj2Q/NtAUSgrcIniUJ2vA=;
 b=RWIi2uIZy8to3LJK0xgIoOHzJ+vDSXmhpooKeQshWRhYo3C3dHXozZvojvDI56lPmMBEhPako7kAUtfw7ZCrALwNL9lfHdA/R7qwdHbNZvmAyTjrN1AR/X0g+Vcut07qDliCZe6AVCHDQ+v4nAbhE1BJY3FyjlYvCjnp+EuXP9STOwQO3qegqTHOYgPcWhrZGUsI1T2uIbMURaODL8X9WLNUTjvi+/iKoK00O2dB0nL6i9e16GGFBEu0EaAJHGmNlSEw+Rs0nCc4NDNexyEiuigZQx2St5Ci8rw72Y3/gmsA1sVM/FNhQxal4tZm/S5QVjl+WUGENlIorS0h3mUD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 10:34:23 +0000
Received: from DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825]) by DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825%5]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 10:34:23 +0000
Message-ID: <6f4fb4ec-4aaa-4c13-abc3-28441213653a@intel.com>
Date: Fri, 24 Jul 2026 16:03:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] drm/i915/vrr: Return from PSR2 compute config in
 case of CMRR enabled
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-2-mitulkumar.ajitkumar.golani@intel.com>
 <1a0e6afe-56fb-4fd9-b618-eedc2fb0167a@intel.com>
 <IA1PR11MB6348E7C75695B22DAB65C989B2CF2@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <IA1PR11MB6348E7C75695B22DAB65C989B2CF2@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0325.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::17) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7631:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d59bc2-31c4-48d6-42c1-08dee96f17ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UzKvIsINC2qCUu0PVYyZbhAmWLxOZJFRDRunQTJ9a321w/8R4FHgcezRUbMwqlJpDmWhKkU5vQ7+Yb89NCPD1xZegJoFFyAp6Dqx2tAIqXyWoEsudPNQzZHJ8NsXes32782uXXHFaH/ASU15Z68GlGyY6ne2gZ97a0kDQJt4xGkLY/620zC/xS5Mqem8kdxz0Q2hT0/DInY6G5HCqYHVaKLorKFmkinhN8n5Fx5zMIov73YjYWvPdoPBc+hnAR6dcWLdVHWweoYjJfRf16IGc/7A7Syso6oxpP005AteFzaxDHA/8zq4tct6VD34civMYZ069YdjF6Pq86/5wq5Xtalh/txy8xkHJ1ZffwvFENGLaipE5BLaV9hDXBrlidPJ4OkTD/zIKNTlBEMcr4lye9H5I+B3JU5wKRwtrhmyrHXXgNpXE/5DSMt7R7ernwq012t6RjMWnUfnvUzbo8wFWLK9jUOIskbWoIDK/YZT4MLJMVA5RLdIOddrnNJ5QH2qOdduZs/lw93AQNHsPnFEVeTUHQfCr4ceQg39C9ddY4vQm751ykBzdti9FM+yULJQ3jOoJ6soofPsG99W6CmDULjyGzUVZvomF5u1fRAdzrp6iE8xbgpjTt+XWWfC9CJ97amFbeC78Q0kpYSBC6sgj0y15t470YV3aVGCRR1dg4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7631.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29SRitrcGhVMkQvUkw2L1dmKzNoRXlDUnFlL0dXQmVqcWJ2Z1p4UTY3RXdF?=
 =?utf-8?B?NnFuS010N3NkOUJHZE9ueTlyKzhIUFhhUksxRnpjTW1QR2I4VUZMVWRkeFBT?=
 =?utf-8?B?TSsvSmRseVdSYUc5N0JCZ2Z2RStScWhwZlluWWxOUitOMDRtMVk0b3NNaWE0?=
 =?utf-8?B?emFrd1hoZkJRYjRibFhjcENiL0xpVGxPVG04SlB6ak55ZVRqejZZSExCakw5?=
 =?utf-8?B?NGNLZTZUNW9Id2xDd0hJOVQxaW9CdjZqdEZmZk0yQkhoMkxUaHA3cmx1Szhw?=
 =?utf-8?B?ck9rNDUxNE96S3gvUUNMWUFobXhvczlNNVVjbzNFNm1HNjM2ZXEycWlmcDI5?=
 =?utf-8?B?Ky9na2F6UlpsYXdGTVRmdmJPYlkxNEZzS0R0c1VBMjlhTlpHTzlrWTJCL1Nv?=
 =?utf-8?B?S2Z5aFZiNU4vL3diOHNlaXJsUUo3WVZFcWF1K3pPbmU5ekk2VFNmMGxNN2RZ?=
 =?utf-8?B?TFFZY3FQYmhnaExQZEhjQzgxL0grZ003Z3QvWFJqdWh4S3hudWRadHkxbG04?=
 =?utf-8?B?anNwcXh1ZVQxWk15QkhpOWdRcjMzZFUxR2VMVzAzTzVmWU81Z3VzaW9qQlZE?=
 =?utf-8?B?SU9RbXhmbXA1eHpSZnpHYWI2NGJHdTM2aFlrNFRPVWlZcnFXVlJpMjllK05I?=
 =?utf-8?B?ZGJrN3NVNkpYdnRlK1dkMXd4WnM1MFhsd2swampNcTZHYXF3TTFCcVZkRi9B?=
 =?utf-8?B?SjFEM3hRV0lpN21CcUxNK0Q0aWRuWUNObytDcXNDUFNHMTAydEdValE0OXFr?=
 =?utf-8?B?aWExcGJVaVFaME9NSzFnZDJJMUdkaGpWK25LRk4xMUNaUEhZVEQ3Y3pHa21J?=
 =?utf-8?B?cXgyZ1VkUXU2TzVTQmlscS9GZk9iQmFHNnFJTkVGL3M5d1NFTjB4dytSRkFE?=
 =?utf-8?B?ZnI5dnphclU4VGlDT3JKTDZSeE5McUhZanA2cEdLcVVxbUE3Sk1vY0tVdXZW?=
 =?utf-8?B?YzBjQll2UTZQR1VyYmVGaVJVMFFGOWk2Um0zL3JxTXE3dWFKTlVjR2NucnBI?=
 =?utf-8?B?OVFUbGpTVXl1YTFYa0pzRkN6RnU3cGkzZjhvc3dVakpuZWd4MjlTQlFKQ2NW?=
 =?utf-8?B?V2dxMnpxeG9EeG95VUtYOEozcis4YUlCSHFTSmNVWnFqV05mRVNYbldhMmp5?=
 =?utf-8?B?eGNjZVhMaDlUZGw1RFc3RnR2bkdobW1mVGZIK2FPa09FNG13b3U2clFwY1Jr?=
 =?utf-8?B?T0NoenBobmt6NVcxNFJ6dlQzbTVrN01zdzVQem1oSThvN2hvTFRtSFVtK0FG?=
 =?utf-8?B?V05sclhJZFFxa2VyUlduVXJ5dlJkUS9lOGlnWTkrLzFwMTV5UzE2enY2MWNx?=
 =?utf-8?B?S1hGSmdRczc2eHlFbmkwRmc4MnNsN1dZRzJCNlBmeVc3cnY0aU9IZUZNeVA0?=
 =?utf-8?B?bGd5eTJEMlVvTDlEL1htdHZ4eld6YUhWN3ZHZVprcEN3bW1XT0N1d091NkMx?=
 =?utf-8?B?MVRLVDdwWVBmV29KN2V0bEZXVEIwS1VSbElrcVpZa1Y2M0Jyc2FsOXBiQlVO?=
 =?utf-8?B?NDZ3VVBWVDN1bW1rTmxjSW1WVnlBaVdrR094T2RzUlNIaE5ZTnkzY1lmWEcv?=
 =?utf-8?B?UnNraU10YW8vVVJ6Wmsvc0cvRFJPUE5NcVBLMFZJMWVHM3dJWGxydnFTUzlj?=
 =?utf-8?B?cFo0NUNoT1BiVU56MHQrS09MSlM5WjMvQ1NkMkVZa2RqY2s1YkEwOEpLT1pm?=
 =?utf-8?B?ZXQzZFpON2ZyRGVkRHdhME1KS21Kb1lGM0dGRnlzVFNEMWE1Q1VmaTZCbDBu?=
 =?utf-8?B?U1VDcVZwcHRITUg4N0dNWjNPZGFLZkE5RnF5KzNNTmNQYW1tdXJ4YnV3TGx3?=
 =?utf-8?B?ZjVsVnVHNGRwVmJjSGlvdmUwVGlWajlkVGo1b2lvTGFjRWo4QS9CaWw4d0s1?=
 =?utf-8?B?ZkJISUhsTHBHWWZ1bmFTK3k5QmYwVWcxcGNUdGx2SzJFNSsxSCtJenV6blFl?=
 =?utf-8?B?Nk5OWHJtdTdJTTlxUHA4NnU3bmpJY0JRZW5YTU1tNnF0NUJWV2NmUEdMVENX?=
 =?utf-8?B?Z2s2MFBMaHBOYzRHY0toVFJiWFVpUU02SFZzMGpDQmVBNm11ZUgzNDg1N2Yw?=
 =?utf-8?B?YkxDY2pnUzREbXRieVdacmNXcEppNG5qTUgySzZFSGpnZUM5bEU5SG9VV200?=
 =?utf-8?B?dTk2YWx0c0c3cEloSklERUx2VnlkcDMxU25XYm1IZzZ4T3FiSGJhUUlDZUxk?=
 =?utf-8?B?V1lzekNZK0tZZGwrbnNWMWJ0eFRWdzR0Uk5GNnliVXh4azFEQkZGdXRiSU9u?=
 =?utf-8?B?Q0RMYVprUU9IWWtWV2o4Rk9FcDljUjc3T25TaDRpVytZNS93ejhFeUNWMlVU?=
 =?utf-8?B?ODlvYWpZS0dLWlpQdllwWXBXOEdTNzlPZll3dUZHOTFvSHpFbHBycThMZytC?=
 =?utf-8?Q?tHwpZ6RI0PXO5pMo=3D?=
X-Exchange-RoutingPolicyChecked: D1zdI7jt2I8qkihc3UoPnFKRN9pmEu6Ux9ZGxW1tfrsayST0LIRWsvAqvJj9qYW3eecRh8BLIARRNOq/28hJIHm4x3xv08tgYil4zboJ3C9pxkIv8ZbZO/APTUQ1zgWp3ohtS21ykfhz4IuwEkhegsvCzqBCJRtRbRznLzh+xFebIB4B6QDlDDujqxfqrlfQ3FwUAlEGIC+gsm/wkvOWL54zYTSL73EVCKEk2gK+jG696Q0Tmo6gNLWsjJQ4skFD2/Ap2+qRXZAmfoQV9XEQaFROGJ9OtInVh+NkFakmSyuYpzkXpQhlXgwl082uzBxUiNLehtb+fhydPKsEMxyhRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d59bc2-31c4-48d6-42c1-08dee96f17ae
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:34:23.3590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oORNIJ8ZtjHfD9mj7JJiKy76GICCA36N1eBi4vaCkwtYrLrjK+h5tTybI7M/IDa0ke1PaZGVmyM04mQO+KWO+T5x1049gUcsKq4mnOJWYSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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



On 7/24/2026 3:52 PM, Golani, Mitulkumar Ajitkumar wrote:
> 
> 
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: 23 July 2026 21:45
>> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Subject: Re: [PATCH v6 1/9] drm/i915/vrr: Return from PSR2 compute config in
>> case of CMRR enabled
>>
>>
>>
>> On 7/22/2026 10:09 AM, Mitul Golani wrote:
>>> CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
>>> enabled.
>>>
>>> --v2:
>>> - Restrict selective update config check (Ankit)
>>> - Commit message change
>>>
>>> --v3:
>>> - Commit changes
>>>
>>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
>>> b/drivers/gpu/drm/i915/display/intel_psr.c
>>> index 40e3d7095996..6a90ded5d1fa 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_psr.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
>>> @@ -1587,6 +1587,12 @@ static bool intel_sel_update_config_valid(struct
>> intel_crtc_state *crtc_state,
>>>    	struct intel_dp *intel_dp = intel_attached_dp(connector);
>>>    	struct intel_display *display = to_intel_display(intel_dp);
>>>
>>> +	if (crtc_state->cmrr.enable) {
>>> +		drm_dbg_kms(display->drm,
>>> +			    "Selective update cannot be enabled when CMRR is
>> enabled\n");
>>> +		goto unsupported;
>>> +	}
>>
>> This also disables panel replay, please make sure that this is desired.
>> If so, add it in commit message.
> 
> Thanks for the review,
> 
> The check is placed in intel_sel_update_config_valid(), whose return value only feeds has_sel_update. has_panel_replay is computed independently beforehand, so Panel Replay is not disabled, only Selective Update (PSR2 and Panel Replay Selective Update) is.
> 
> *  has_psr (alone):					PSR1
>   *  has_psr + has_sel_update:				PSR2
>   *  has_psr + has_panel_replay:				Panel Replay
>   *  has_psr + has_panel_replay + has_sel_update:	Panel Replay Selective Update
> 
> 
> Per the mode table in intel_psr.c at start, disabling has_sel_update when CMRR is enabled turns off case 2 (PSR2) and case 4 (Panel Replay SU), while PSR1 and Panel Replay remain functional.
> This is the desired behaviour since CMRR is incompatible with selective update.

Are we sure?

Bspec only ever calls out PSR2 as incompatible. It never calls out 
selective update.

> 
> Although this is explicitly called out as part of code comment at start of this file.
> 
> Regards,
> Mitul
> 
>>
>>> +
>>>    	if (HAS_PSR2_SEL_FETCH(display) &&
>>>    	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
>>>    	    !HAS_PSR_HW_TRACKING(display)) {
> 

