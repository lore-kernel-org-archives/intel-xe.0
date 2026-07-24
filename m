Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CD3C531FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 09:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84BB10E64E;
	Fri, 24 Jul 2026 09:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPBBfxx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236510E619;
 Fri, 24 Jul 2026 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784886643; x=1816422643;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jv1mgY/y+T0mx50TEuhL7PZDRDyA81KMnlIj0FH5DTc=;
 b=NPBBfxx7Rf32pDEIo8x/5Hv6mrw5EjBt8LXxOm+91ygAMJt7D3DgpGMH
 HN/9KrN9f4BxCgb8/hseL8oaToo+g01d7rBz5Rpgy5p+ETa6nuUBaYqlg
 BSZ9+3UJETMmPX3AhvOdWyx2EMktJ1SFJFtpGLweC1j1uiTlm8/5Ux3vy
 aMgQFmmm3QrC5bl9veW9d+qD+F2N3IVp4QKNxWassze4w27X0XEEheDzy
 m2csfGpazCXe337of06EA6Yt1qYfnOTL5jlYvo4GOLQviXs1GmKD7Yhk8
 OsKQIrVgMbnsw6nSoqCWE01EzUG+uT7tK032X7a/pGe6BerPll2KVccCJ A==;
X-CSE-ConnectionGUID: CGxn/FQRSUewDSqEjTkiwA==
X-CSE-MsgGUID: jBvHdkgvQ7W23E7kiE2ktQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85422251"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85422251"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 02:50:38 -0700
X-CSE-ConnectionGUID: Kv78dFcCSgq/OJI3rhCY5g==
X-CSE-MsgGUID: jHpTuM6bTKK+cjg5qzh/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="258123087"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 02:50:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 02:50:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 02:50:37 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 02:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxVbw6y7nN7T80vRRA+5cN7tFsqo9FSSBNQgr03Do3e7n3VSm1V5Law7OZZi5DGvGM/of2jvBgq3SB5Nq2aVc0sNexnxDokePa02fIjC1EvqiAIu2f0PPqmkQzqcQEucDQ0RD3tC822wMXgxD84dr6V+JgYEqPboLk9PXAszBm0XWyfDXOTRhg5diqhGAfsINfLvCx5zjw6eo6FvMXIZculQH4xYigJVKUkMENm0Dhwhm4AKcZMFUsh5ttggXIA99rdQ1a4Wju2K1XowvKWPeZOplikA5n+ZDP3mMpYdmmlrwEBf2K/EqXbERF25Der6PzURL4siBkoxuFYKyHDx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zmayA9a1L+TB+eryLoMHUL0jdOocVCADIfPYSaR3eQ=;
 b=fvHwL04619DLFcJM/i7W673wDkSTdP04XD2cK0uSsqmVC5jvzpg3YEQ8K8RwWdSEVx1jUTHsSQFrejWPkgw4mVy6e0q3vyCgSlvlT+xE7bhBzGnKM4aLqtOnDNfJUFVPFQ8N2cmm1SST8+FANuVz17ioC0RHcaGqruXThaCY+S+cgIC1aPbXH/BhFyr0mjVPW4hr2zv9j1v+je9nK6Y1i25/tZCuRexaRMOMqLggyBASHr0XHVcEYdjsyRA1OiX+c3K79mIdZ8Gqp1VFrcgAZ91EMYDSkJLANZAaUQTHv8P8fYviz/bbkYVbS4lzc131QVvTRf3s9+6pSqDtQ458eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:50:35 +0000
Received: from DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825]) by DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825%5]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 09:50:35 +0000
Message-ID: <1c19cb67-bf6a-478a-945a-12523ca6c5a8@intel.com>
Date: Fri, 24 Jul 2026 15:20:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] drm/i915/vrr: Enable cmrr
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-10-mitulkumar.ajitkumar.golani@intel.com>
 <3adf77cc-f716-447f-898f-fd129533ff44@intel.com>
Content-Language: en-GB
In-Reply-To: <3adf77cc-f716-447f-898f-fd129533ff44@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7631:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e9e8d2-1bc2-44ce-d900-08dee968ff84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: N5uauq1n1+BgBPtfpZf47IF/5voPWJwZpuuwtOshstkLZBAoYQylONa/RvS0BaVunBOvZ6vUcRqgT2zLZfjRX+2hzncxaUKp94ljSqjYysxk0bid2RFDnRUB8JJNmu2g1IGWIMrvpYH5mgkOatRRNl6R7O7jE3GpcZNmJDf6VslezdFezEi3fBe+RL+MAgyaaerENAjoqHcd2BIZ+1qwNFayBxUq3ND0xNQ0pWBlU8+mS1AqJlqwuuBGGG3JMpUyIz7iCSKujbQ+LCwJO2S5C+jG2s0kqdzehh/OpxZo5J+Gop5SHHNepJd8tEtfb+ZlA0bDQ5kInJZHR/QrX0c0V9w2Kff5owVsvq4PqDUGOzCbowsULZyL+j7ef0T9lrxMvn+D+r+w15AgP7YWn3ttIoIQ4pLbDpWoRIL3tyfZ8cHZV87XoGwrlQEvXVxrTNjKIn7SGSCdxo63FHh77XnfHs7HOnERKkguvqqWRfNCCeP79mbUm9bdePLHrqVp2WI/LlhL/g/yYlVVEeC8Xr7gSdGZWTFYKWOfooN9Hi4IKFO1TdmocZ4HoHt+kvYKHvKXPTlktpe4/gphHYu7vJRh15lnYxbogRMFlKiBiuzZgMkWqUMbk0cyihymgnWGHPi8BmbvuhldzGc8BMD496rCJAsyMMvGHb/r3E1YRQ3sIX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7631.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGZXYUtSRzgxankySHpBWlQ4T1EraXV4ek1relVXNzUyd0k0SVBzNUZWbmdQ?=
 =?utf-8?B?OUd6Zld6TXd6Uzk4dWxaZ2R2NUt3aDV1anBVRWVFZ0g1aERrOFhLazBEc3p1?=
 =?utf-8?B?R0RCcmdqYWE1Y08zTXhZMTc5VG1rWEdaa2ZEbU9FOWMwbTB3WlpuVVBJM01B?=
 =?utf-8?B?VCsyNFY5Q2V1dEFadEJmOC9na1FIM05TR3U1YzNiQmRmZEdPVXR5Qkhqckdx?=
 =?utf-8?B?aDl4Rk81bFR4ZVc2M1Q1bE1OZkR0Z2x0N1RvUThxVjBUTXdUbzVBMENUanhZ?=
 =?utf-8?B?WlRURWdxQTN1VHppeVVBaTFUWkpsbGtuc0FwelNxSDlpWXJmcTc4WnRhaW1y?=
 =?utf-8?B?VnQzMWF1WFVSdmZPYWhlL3pNa3hEMXU4NWdSM3JuTnZCZjUrZzlTOG96cjdH?=
 =?utf-8?B?VlhtaFA1M2NyRGoyRm9aUW9yVEJ1TnZEREdCWkhvNHp3VzU4aWg1cjM5ZmZP?=
 =?utf-8?B?djdEangvOEpGZGFLVHZ0VnpmRE1QaFJnNW9Wb2ZsbnQ2UTNJYWRQUE9sTU9F?=
 =?utf-8?B?Snc4YXBBWVVpS0l0RnJlM0VmS0NXdmNhUmMrLy9BL3A3M3diRTlyUXorRGJP?=
 =?utf-8?B?TkhpdFZCT1Y3WVZib0pvY01oVVUyWTZncWpCdTZxZVRJT3N1V3pXM0ZOQ0FR?=
 =?utf-8?B?Mi9meWxWYzRXMWd3QitXb3pUTTEyN0Ztbk8zZUs4QmNXNFMvWDJXUWNzZnh3?=
 =?utf-8?B?UlNaUk1yakdPdktteWVJckxleENZMHZ4TUVLMFNENDBLcDVLRUl2ZWlYbTRL?=
 =?utf-8?B?QlZzTDh3OG5VVHlnWXltaGNGN3h6bDVHWEw5RUN1ZFRPdWJaSlQybyt5eE5E?=
 =?utf-8?B?UndvOUVSWUs4cTFoSHgwdlRLTDF5c0x0Uk9SdjhwQjd0WXJZeExnUDBRVEJS?=
 =?utf-8?B?M2VVY21mMVU2b3VlUmNzZ0lCODc3WjFsaG4vL3BVYlpBbGM4a0RqeEM5dTdy?=
 =?utf-8?B?LytFWHdKLzBZWTdrbDFmOWMvN0pGZjg0RlpqWnkzNXRENk93aWVHMnNCQXY3?=
 =?utf-8?B?YUVDTmZKa0MwRlU0MC96cU9GVE0vWFRwK3RsYU1ZOEN4a2RDdlJIOUw1TTdn?=
 =?utf-8?B?cmpCQlF1WWZKeXVHelpyUFZWZnZmcHU0RW52U1FwakNzV05neUp4RXYxQU9K?=
 =?utf-8?B?ckMzWnVINk14RXhsMmpxTytVY2xtQ2ZmVDg5T0FxZFBybnErMXdseGpxbE9C?=
 =?utf-8?B?Ri9RNHFWd05FWDNzb0V6bHZPMEJVbUtPdjJBOXNOUXpHUUJhU3RxcFVaVnlY?=
 =?utf-8?B?QWhXSG9XN1FXdmp4YS9JMHh1RWNqd0d1VE5taFF1dlZvdVc3VDY2V0JBckhL?=
 =?utf-8?B?akpIUGo1dTlHZXNLRVB3NEU1YlJzVkxUS3J6T1ZtZkh1bnFVR3dJZldRYWln?=
 =?utf-8?B?NWQ2RVNhaThvaDRQd3NMRldwK1p2UnNzWnY2UkN5S2UyN0hybXBWWWNmWXBR?=
 =?utf-8?B?b3UzeXgxZk1DSHAzNDlJbFY2UUdGQXFuSk1OUEJUQVdyUlNKc2tRcERPTUpS?=
 =?utf-8?B?a0wvYXR1Skxicy9jRUpJRVByLytQSThGUWJmLzRvZHpSbEMwUkZ3NFUxQTlC?=
 =?utf-8?B?UE5pVjZDMXpxKzJYMWZuSXR2WERCS0JJemFBNjRnalJpV09QaGVXQlZDa2I5?=
 =?utf-8?B?cGN6dkdkRkhuRU9NRjhsRVpsK0lhazgwcDlSR3BWRUVYUVQ0emNWUWZjd3R6?=
 =?utf-8?B?aUYvRnYvZ1hlZlk5L3dYWUE3MjdMZlVBcEdGVE44by9DZWJLN2xuTUdtaFhC?=
 =?utf-8?B?cFhDQWpFaUljWXVhL1ByWWc5aG9UTEJZbm1yL0lwM0ZVbUdsZE5CUkFwTGNU?=
 =?utf-8?B?NzRYVGpUVDFrOE1TVS83ZlgxeDVZNVhCMklHd3lXaWwwbFdYcjFKNy96aGdL?=
 =?utf-8?B?UU1lTWtja1kyaDBObjFMdVVxVTJTaWhBaDdTeGp6Q1NXZVYzMG15dnphUFRx?=
 =?utf-8?B?SGZ0dnZNMkZZZWNoK3o1TjdVL3dIVzYrcUlvNHMvM0Ezb1REWmdseWhWRmlz?=
 =?utf-8?B?Q3hHcDFRYTNuSjZ2Z1VkVXA5ekJlWDJZT3F6Y3Y5WWxlS1J0WEdJRG1LSGVw?=
 =?utf-8?B?TlhWMi9QUEMwSFBNbmpKUG1MOFJXaXl2UFlTNlU0R1ZxNzRraVQxNWN0OSs1?=
 =?utf-8?B?bm1EM3ozeWJ4aUpkY3BKVlNmN2UvWkJFVnJFTnl2b011K0FjZXpsUmJYSTBr?=
 =?utf-8?B?NmdCd3Fvd3FPZnIxbHlpY2IxWEovendMNHlZVmlzZWFxemxYd2NpakZtYlZ6?=
 =?utf-8?B?Tlk5eXQ1Zk5xbFZrS25Rb3Ird3E0OW95QStJNk5BVSsrZjVtQk15WFJRY2ZT?=
 =?utf-8?B?OEZuZ3kxS2dZRXowYVNQZU5KdnVmVHhCTkNyZjEzRUc3cFNubEFHT0N1RVlD?=
 =?utf-8?Q?I9i3L5slCVuYjh2U=3D?=
X-Exchange-RoutingPolicyChecked: bZ1Tz+YX2ssNrHx4v40gcaxBkrqls6aE3iG7jRDwTRr2hBWlitn5m8neEY+sLHo70hg96T7yPweNbERX8HCUpLz08/uap61SJnXhJIw7WgPgxz1BbyXFnda63L1if5yG9HY0OvFq2lDhP+OHd9rs6Do+bRC/Lhh2M6EDWCNp5/4mN/tlXwX+5JcAr5vxel745PlCMJ/WtxExKpRSveifB6qAN2Fgfqu83pZPn4jAplDWSpXPyLJnoQc/20MKE5gs4PsnLARidT9y0nL0QMAkC80hlu0VpcozS7Z0mEXJVhmcVGj6Xm95Ppqfs2/g0aoPB8uWH+V8d4prXlq/D75Wrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e9e8d2-1bc2-44ce-d900-08dee968ff84
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:50:35.4289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHNPnC5RuG70rQHFNBRgEVRcCWRPuX5DwXrz8/Lavm/EsTUgEEisFCxr0ZhZk7LkJ4JFl41vhcmhac+Rqax0iDesK4yxt4D+aLIUVqpNew0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
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



On 7/23/2026 9:51 PM, Borah, Chaitanya Kumar wrote:
> 
> 
> On 7/22/2026 10:09 AM, Mitul Golani wrote:
>> Enable CMRR during compute config and add related state
>> checker for the same.
>>
>> --v2:
>> - Everything else except enable compute to handle before this patch
>> (Chaitanya)
>>
>> --v3:
>> - Remove redundant return from compute config
>>
>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/ 
>> drm/i915/display/intel_vrr.c
>> index 6bc3ccd62513..ed23a03b0d3d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>> @@ -302,6 +302,8 @@ intel_vrr_cmrr_compute_config(struct 
>> intel_crtc_state *crtc_state)
>>       adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
>>                              crtc_state->vrr.cmrr.cmrr_n,
>>                              &crtc_state->vrr.cmrr.cmrr_m);
>> +
>> +    crtc_state->vrr.cmrr.enable = true;
> 
> We will also need to clear it (and cmrr_n, cmrr_m ) at the beginning of 
> the compute config. If we only have this statement cmrr.enable will 
> always remain true once set as it propagates through duplicated crtc 
> states.
> 

Spoke too soon, intel_crtc_prepare_cleared_state() zeroes the crtc_state 
right before intel_modeset_pipe_config() runs compute. So we should be 
good at that front.

The problem will still lie with CMRR_ENABLE not getting programmed 
during a fastset. It will leave the CMRR registers programmed (to 0s in 
disabled case) but CMRR_ENABLE bit in TRANS_VRR_CTL will not be updated 
as enable_vrr_tg (except in lrr case) and disable_vrr_tg are called only 
on modeset.

>>   }
>>   static
> 

