Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E29C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEA110E276;
	Mon, 31 Aug 2026 09:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wp6nQLjs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C66010E276
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788170228; x=1819706228;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tdXolSa/a2ajKCUQdsioqU68O5xN183hgoqza+REHZA=;
 b=Wp6nQLjsb1JuTfSFlMlzmmNZ/lrq2vb+TBoDxTJrpdOBK6anbb0TkQYr
 jdNQgeKCiH+/x9TfN4JzItNXO9HttwGsnu2QyLGAqIbhaYqnMi5iOnbLc
 rn5+og9cV0kxO9uiq6ahXaZxH2Q/zehqfw3wdgC2s1vCC+IRItOROnnBt
 wbSYrab6IEwvBtS7S6kODy/pAvh5d+mDh1hB+VXUvQoyv9nwbuRhfIOb/
 U/wl1mjs2O90rQyc5HCf1VD0aDN6KsyK+LLs/PmiDxMy14ebE861Lkz5H
 zZX7B4gJ9GemQtjbK3s+KiqIbax7aLQodhJIY+1VyLppDm4+NzcG1K+Tv A==;
X-CSE-ConnectionGUID: CrBV7ay3Q8m/bMe17T2b/Q==
X-CSE-MsgGUID: OQrxNIC7TiyOjGe9vic9yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92383872"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92383872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:57:07 -0700
X-CSE-ConnectionGUID: Dh3LkLiQSCqxxFKyrd3F9A==
X-CSE-MsgGUID: ubKWsVyJQAep0S+jROzFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="265511427"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:56:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:56:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:56:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lL0O8pkzgttQCcqxC9Kk3tZJi19XxHNfyp6hcbdurk9TWC3oyX6W7Us6RPRbj67/p5Qnwbz8Gr0MsfUQpi9DX2R/AN8tjxX1oA/eJsFoVO6M6KdC8UligUWftXIQqP30XWtfhY+mNLhshmnHykB4bNjxRrK5W66nVZkxRVrtTXTyLcJA4OxnEJiO7SUqEhI288BzfQJtwzqqeoThQWRiXugO5y1SBEuY0kdBzfKQjIptnNNnzO0x7WYgV0/BTU8qALL9jORv5G2PWVAWLOCTq7BEAui/6Dj001QS7Xhoy+qpw38UjAdWESYazZ0hKKY7TFT9NCV1M0Y43H4jWQ/pJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOoT/YR7QGmcwBKijKeoexrwd2co76dq6vAmlAzPJxo=;
 b=Xup2ZTSaFMdjz3ykabBZxO9Cglzu6YOzXrj0tSPSZOrpakzEuRbgie3oOMGR/c/vehaBkECa3XKHR2o0GwPOfNhlxotjSBBQHjljb0bUV+3GnmrsB/HLf47bPFMAA6zj2AtwrfYbyu6mI281iItFpylOiRJvZS62vRq64vxvz1Gf0qkJw3NSoKuZg0tr0bKPBTAlwSdtSUwEpda9zpNLuQO2oV7XjY2xku+TTQBz6/TwTyZH5c2bsuX4zpHGPiQYJy5ilo0B+6z/O4PWIXd3L8yH6gQQc/F3xuc/lyjpeqvv8t9tD3PCOMRpdb9NriWKqVn8cbf9weiNnPchRlDT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS4PR11MB368325.namprd11.prod.outlook.com (2603:10b6:8:509::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:56:45 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:56:45 +0000
Message-ID: <667be405-f32c-457f-9dc6-5a3123dfb3ae@intel.com>
Date: Mon, 31 Aug 2026 15:26:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe/log: Add GUCSUBMIT component
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
 <20260831080507.2364687-2-arvind.yadav@intel.com>
 <d8d2f3e8-3d86-4364-ae0b-719edb9cb120@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <d8d2f3e8-3d86-4364-ae0b-719edb9cb120@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS4PR11MB368325:EE_
X-MS-Office365-Filtering-Correlation-Id: cbccdc63-b51c-4810-7f6d-08df07462a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: VUZhe7ZJostKAQtlx+Gas3GDjQpNZpwy9P4s9A1i1RmljikszB27uL9L88+D+ncAR4Lwgz/BIbsqUi4eJl7Cqzs32MwbXKPFvZ6iQDcOV0n173GKcb2ohzOWVF5P4dfybiDn42k3WHHQfVuA6HMXVls1BzX5+kpNZjvTU/SD0oL5GrCsu9MF9KFQjW+mqgkCOP2O1b/TMBsxlkA1Qy5DHExBwGqzkn0ilZgGqUMoX7GDw/SJS3aRlVLFEciyc+SPcAWvuQRDon4CgPFf+xtRkp4e0K3Yo/Ge80w2P5JV2LttWJ3W8ROPR9gluBMO1ThVnpgFZKXpxcqHTwm7GLiEJsgkr0u71+ukNPxaD4VEXev6O29djCpBXkdDBpq5Gtoy7w5NvcrxC0lTDD1sdaT2sz5yg1h5PZgep2/rkEH1mvbbNkfQMfCK3MLOuvF7F/KnekMZefoFiMcx8iT3n8p1YDVp0JX737/vmLxXAWEuDbeTKizMHBvK6gy6n2DPNo/jaNynpN28ZXCFC8/VHZ0a5olLvtEqa46bozyujtI3ctbb59Z2AxhzQmeU/1Mfy6BOXFJBOlE4jYIcgRZEQsqCSMwSFFpeoATYDNQ/fMalgcPpqhagKV267qzBvucU+2Bgn0Hyc4LSZMI4NOY2G5g6R4f+yg6Ym2bMDHJpnea7VBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk85U2hmQ0RGN2k1S0FlOE50RGtaTFlHRHBkd3VZMlFISS9HZklnd0RhOC9U?=
 =?utf-8?B?cWlhc1lOWU5HMzlZOGtFaUFDenhVTVJ5YU5XNU5tVkV6NitraDZZZjBkdGlX?=
 =?utf-8?B?cko5bVFQSlo2Z09UeWF5d1RXZTF4SmxIOTVJTXJtVS9PYTRRQmp4TXkxWGFp?=
 =?utf-8?B?SzgyMUl1TWtiWE1INE1FYWRmdmNmUGtVUW9EaHFCYmxvSzZMMVpNRWN0UnRk?=
 =?utf-8?B?Yi9pS1JWaDJ6YXFPUWNTSjlVTkh1VVhINnhlWnFSc0FMWGZpOGZCaHo2cklX?=
 =?utf-8?B?U2hUN1Boa2FYMUpqR25NbkppZVVCWjhGbkYzMmJ1VmxZWnJlQnRva0J4TGdJ?=
 =?utf-8?B?bXN0R1FlMXZBQWlHTWNUTzZFUVE4SXRnSHNwWC9XWWJBczlEVEh2ZjVCUzZ5?=
 =?utf-8?B?K3RxMnEvRERmbmd5ZVFMMmZYTmJYd29UOThBZUZqOE9qVXJ6VkgvcVhIaHVT?=
 =?utf-8?B?d3NSKy9pUUtwTnJiWVFtMzRHOHl4d1o5eXlOY2hMRThJdkJIbGhtTFRGY29v?=
 =?utf-8?B?RS9ma241dEVJYy95Vyt0M3ZLdStwbFQ1VzJ5c1FqVmxBZG14eVVxK3pPYlll?=
 =?utf-8?B?dEgrNEV4VGNlb3RuNmdmK0Urak11WDROVy9aY3puVWd3ZU9GUDBObURqb3Rz?=
 =?utf-8?B?dTZtclFKRnhiQmV1WmIwZzNNOEdLbUNOY01kc0NYS3ZHdXVWNzRXMzdlS21l?=
 =?utf-8?B?U2JSK05Jcnd1ajlUS0VUR1lVdndkU1Fudk1nZ3F5YkowM0FveUFlblhGZDlH?=
 =?utf-8?B?VVZGVnpYcCtNRUx1a20rTnBaVThKZityZHYzd1d1cjcyV1BESVVpMTBReXVU?=
 =?utf-8?B?VTBWVWs3cnV6R1YxQzl2dUJNNE5sSlVmUWlzazkwMW9RSnIyd1REbDFPYjFI?=
 =?utf-8?B?S3A4RTY4a0JmQXVIQytWTk5wWlBZNCsxSDA2aENoUkZncSs3TE51SHBoYWJh?=
 =?utf-8?B?NFY2SXBuTUUveWgza2FyMFlRRVBNVmdqckdTakx6T0xWNnFvNEoxbVk3Yk05?=
 =?utf-8?B?ZSt0SWpsbkFZVUZ1L1RRRUMyNmNkSU9vb0pNQWNNSXAwTmpNQk95M2tJTGF0?=
 =?utf-8?B?dTk2WkhZeE1WUk43RlNRWUVlZjlsY0VNTklCTkVFaU43LzZvSVVJUmhrSW9X?=
 =?utf-8?B?cjhVeHVRbEE2dHlPT3NoRldCdnY1NU1HNld3VUtDOU9XeGhWU1JZS2Q0bUJN?=
 =?utf-8?B?ZEVQaWhmbHB0eVd0b2w5OGYwaTBVZk9sTlYrVGRkQWJwWEtzMjBZV280OCs4?=
 =?utf-8?B?K2RUVkdMR2gwcCtYa2RCZmIxS0VET0NHNzU5bGkyOXZueWJNbFh3alFOWDls?=
 =?utf-8?B?YTFtandzMUdMQWdrSXc4aVEzY2M3WlNmVzNmbUVrMG5vdTFLRjJrUU5tQTRV?=
 =?utf-8?B?QkoxR0E2eHVvUi9JNEFUMVZaMGFKV3Q0OTBnWEkwNEMxaG9FOXpoeHl4QkRW?=
 =?utf-8?B?N1NuUnBvbUhXSGYzSkFubFIvOUUwSmV5ZTVvWEhhalZLdlVWamtJaFFNbFJz?=
 =?utf-8?B?YVpWSzhIdkNKMUc2ZnFBZlloVVBoN0NTSW9EcEhjZGh0Wjgva1NoNTA3R3Fv?=
 =?utf-8?B?bHU2NTFhOFp5TnJjZXc4U2lEbUg1Rm43bXVOOTk3MTAwSXF5b1o0dkR4WWRX?=
 =?utf-8?B?R1J1b2RIbGQyRjFsMnovaGhia2NiOXpkYWt3VzV2SFRmdjJIdGZaOUFGM0Vv?=
 =?utf-8?B?Z2Y2SGxMZklka3NGOGp4bklmUTErT25nQVVzUDdFb3hSZ1kyb2RKK290a1BM?=
 =?utf-8?B?ZUQvdjdNWlhPNjJ1cGYwQmpGSFNnTWJSNVoxOHFDWkZaZ1pwTzBTaHB5ZU52?=
 =?utf-8?B?UU1nSkVDZlc3UUlTMFlMVHBveEhwaUZFS0p4K0FwcjhiMnYrTjhYSmxueFIr?=
 =?utf-8?B?dmtHZ3lQUXBySWJTZE5rTXVIdHlCNkdtQnE4cFVLejMwYkF2VnArbDAxRFR3?=
 =?utf-8?B?cE1XWGd1ODV5TGNzTDl2OFBBWHlGNEpSTEVMcWJjV1Jkd0QvKzZoeDhzUnZS?=
 =?utf-8?B?Tno5YU9wMEM3b0MrV3pkTXd6djA2YkdtVjZCR2pVL1FUbzRhTEZ3ek1uZnRX?=
 =?utf-8?B?Y0xVSUtDM3hJZnlodGU4WkQweUJ0Rm9iV2RKZ3NSZXdxQ2dwYmF0LzBkZFpR?=
 =?utf-8?B?a05UMURPQ3U1NWRmc0NQb2lFOStWQnM1RndjSGgxOVUxalBSN2NMbWJYMFlL?=
 =?utf-8?B?WDZuSERqK3ZTUk5hTWo4b0Z4Y1RMRVVISUhkQ0l0RHJraU5MY3BvdTM0ZW5Z?=
 =?utf-8?B?QmZiU21KYmw2ZVZqb2VuR0tFVXdiMEVkRDdPMmhrS0Y5V0tCVzM0V01RQ25Z?=
 =?utf-8?B?VVg2YjBSWTJKTFBFR2RVV0g0cE9HcjlxNzAxQk9Gby9CbjJNRjEyUT09?=
X-Exchange-RoutingPolicyChecked: 19TShhlQBcOI3bWHVJo1c5sIhALHzF9zL1fAsdDBcQYm0iYyqVQ6gT2cQqO0mcdHOc3p1fTurZkdRQ2aYy6fg6SSumj1MZbT7Y1t/l2sG4/IYqHA/DFlPyKzVPpTiHsHhPGsl/uziJu3tsVmB/5EIfEwG/PxYnWmoINyBZXIoTkZDc0hIq/R8xBp0dbuaR/iQqvhSE1PADRvI8At5qb6+8FSdkgaWmrcQiuqYmuo5cnfCqrjX1KBq5fZ8afwU7YwGi1t3QIZULLX0b3c3wjAxXfDhlwSYoZ+Hfu1RLuVYGXQ5N81DzDDbNFYqc113YHiS42qF5no+2sR2czBNCwSvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbccdc63-b51c-4810-7f6d-08df07462a51
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:56:45.0761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AobglRHB2gS62MbxnS1jQqwVg6sgdeX+O9HzCf6LhJQEfR3gsVqkCOyaSxHYgSs5k3Lo5Q6HlCUkC/1+zyxB1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB368325
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


On 31-08-2026 14:44, Michal Wajdeczko wrote:
>
> On 8/31/2026 10:05 AM, Arvind Yadav wrote:
>> Add a GUCSUBMIT component for structured SIGID logging.
>>
>> GuC submit failures can still map to an existing SIGID, but using the
>> generic GT component hides the source of the report. Add GUCSUBMIT as a
>> separate component and map it to XE_SIGID_GT_TDR.
>>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> index d6105520173e..19976df21532 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -159,6 +159,7 @@ enum xe_log_location_bits {
>>   	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
>>   	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
>>   	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>> +	define(DRIVER_FIRMWARE, 4, GUCSUBMIT, GT_TDR, "GuC Submit")		\
> hmm, the goal of the DRIVER_FIRMWARE class was to have a way to
> differentiate between different firmware used by the driver, as
> in SIGID space there are only two RUNTIME/DRIVER_FW categories
>
> IMO "GuC submission" should be just a DRIVER class component,
> like we have PAGEFAULT component


Agreed, I will move GUCSUBMIT from DRIVER_FIRMWARE to DRIVER and keep it 
mapped to XE_SIGID_GT_TDR. That keeps the same SIGID but makes the 
component grouping correct.

Thanks
Arvind

>
>>   	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>>   	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
>>   
