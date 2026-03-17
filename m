Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D0FF3029A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 05:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131C810E0E3;
	Tue, 17 Mar 2026 05:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNH06MZQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D42510E0E3
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773726436; x=1805262436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e1MqDHwr/pbqqALecZUTUwvFWjnrDxJJ8xGylbmdL34=;
 b=CNH06MZQCL8OZjdPN5oqS/ztbGbxp6mjwMSHtnZ/qO4YpCGWOl6D4x+E
 SZW0yVlj4hJKWeIDFbzlk9h/NmUT7dmotd91L9dGhrN+ryzFVrPnqVSfZ
 fxwzltDvu/jgZ2xK+x7dSclGMpqgJMotjm2+RXkXcijo+7Q2E+Q97Hp8k
 ti4Gb02X745IxnBGpffPAhKVeEkHmqdd0tH9RimVKrJJBvZSSprEGI3sn
 tBiUgZ5gv0wfhODYKaLrs6ACtQcHqh3kYKLLWK5ZePWucQyY9qj9/rwug
 qbJ/YLKNmMMjmYx91/7BYr/AMto0UIPpnSmm3FM7oFU2Q7Pu5S83wIUYG Q==;
X-CSE-ConnectionGUID: b/qomqJIQ+mcB3tcpy2mVw==
X-CSE-MsgGUID: J4nw3ZY3SaWf50QG0rsKzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78603960"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78603960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:47:16 -0700
X-CSE-ConnectionGUID: d0e1UIIIQz2vOXbzivBiGA==
X-CSE-MsgGUID: WVV5/VFrTte5VChSXwNx2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="217890688"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:47:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:47:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 22:47:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gh1cnprTgyzdmEdOSdB03jWv3S+1kD0WwEq9FnbVrZnfnbUDgBGRd6l+hXadTRrFI08qlWX/CIC9A6e+LimFJ4qD5sWfCVmW6m31blGAsi/TYSIK4P+hXimPf+rrE02YUo2EM/sRY8w2/ZdWXlYxsVVwdN5zS2XZjvpRyzMzVAQ7p3bbEQnpNW4a+zV1Vsz9Go3WuSqiRtXNPcleIw6iMWUXFccJ4UFgQm5T5QF5ItZcB85lvRfl4VzbDdtzRxJURVZJtgK1h+kdi602e/EtPhrxK/j5OB3tTL+nRuEpGYtVWnL5B3waRjOXiWpUMhllWyw5WpaXxaOnr25S3dHHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9YtUT2LSzOQdhvSxfepV7nfnxZYjl9T/Jdl6NZJgFw=;
 b=MkHjbrTsy6R53I13nLKU29XHu4ik2Yw9zWzx7BQEu46l+KZnnhGVV/FwF562fPC+QDbVlPKRFIniBrU4QHqMv8W7IOYmBTxvk7vClDDbgsxKKTnuzi+7gHNg5VgcIIMkgGkULpPqVIJr9ljm8cq5xxL1vDg/Mg9wTcJ1O7hGWkYdr5sh88N8Gs2upmnzftMYY5NfChdXaIoxbOKv/hFZkh3KP4QKLnmkiO5J4hS/MizXqLMTpmkAR4kinPXMEAwpNteQmEOuGn3gsiVRzG4bdjAfZYpj8f+uPHfxjlHEMvuAc5z6araPq30Bo/Vcc3hGq4uclo5Mh1vyJ57SosmL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Tue, 17 Mar
 2026 05:47:12 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 05:47:12 +0000
Message-ID: <259a44be-1fd8-4ff0-8924-d647106de413@intel.com>
Date: Tue, 17 Mar 2026 11:17:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/sysctrl: Add system controller interrupt
 handler
To: Raag Jadav <raag.jadav@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260312090657.4026013-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0248.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c407a7-6bcf-4ba6-3f72-08de83e8a2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: JNj1w9kUztLq353j56o5ihDwJWdPa28zI5CwM4+snRMCWG469buDrhqz6KvBV/SEtfNyP9OoLJqNrmISc7b31SbJOkeeCeboa45lftDVRxEycrDBXMIQrBpSdG+Ivae9jxsyqityyZaqXxXKwJJvdduJvQiA0tU2Nx42MwYvistnWvMNb49ii7ZLFJt3R/nQgimDkcTvvnq/0sNWStWcsM+EIWJQiSYMpJdDA7nFWSALc1ovxVzp5oFiIBfY8NoQEoPqi4xCkm8d2/OCEr+XIfSP9bvSay5aEKAae/lQ2rPAq7RFdBJ84TmT6pAoujdURNok1C+Z5A3UqYPldcGPqjuiqTbOQl9aH4gCfktr9/IpuL94mof1ysFyA+po+cfMLaD7mMpX6AN3nNF5MUuqulED04tuWA1t/8RsEsFp6UMsT4r/ZCOYX9Q8KufPWSOo2nO16eDHLQxKoLNBwTM9Q320uP17r7njh7JFWd4jHFEUD/47u0l2Ohms5QPoEZthg0OC+9BtVxZbmsJ4TkXL+g/J8mHZrN5PUvYf8kM2kdK37CE+tZ7/JZAh5ZY2wPP+NFbfUq6BNZlFB4dHDQNCG0Dp/pSiwhXb3VVQeQsbIewzKxpKK1pHEBDb17kXwiwBWNMsFgzCxrWwMUlsUa1HxZ2UVVOUbsDZti9vwkpEtnRrPFzFtkuaK/Nhy6hJLJas35ufoVv+apr1Z7wAovOYaKrZA0mCrAjHq4MCy3IvGEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdDcklibXBLYS9ZUThnYlV3cGllT3QxMmI3UlpnWTlHbkpRRUNzK3FURWUy?=
 =?utf-8?B?QVYrcWxTMzhlZ3BZZ1MrdGlsbXM0dk9pRWtmZVYvZk83NGprMkszeks3aEhk?=
 =?utf-8?B?QkFQNXVPSXNuZ3E3aTZkU25XMW9zVnJ0YlRBNnVCTk04dDBuUzdXM21LK1hv?=
 =?utf-8?B?MGx3d2dkcFBQU2ZuVHozaDFidVdoUlQ3RDlUc1VMM3ZQOVVYdUl6dkRFMjJz?=
 =?utf-8?B?KzRmRlRmaU5SZkF3MkRWUkY1WGxSUU1Tb3dyU2tQaXJDbEJtUndKajJ4K1V1?=
 =?utf-8?B?WG5ER2MvR1F4bmJ5VmZReCsyT3lCcHVHMmRnRTJSMEpEVy81R2xsclZsOWFH?=
 =?utf-8?B?M2pDKzlYaUZzZGJpaXF6NHZBU3R5S3hJcXpOUnp5RXREakNhUG9hWUNtb1dS?=
 =?utf-8?B?N0lGYU0rN3lBclNwY203RmZvNkZXZTM3VUNJaUN3aWNKVEhjV3ZKU3pqV3Vn?=
 =?utf-8?B?Y0F2UFNmK3JscTVUOEEwM2RUR1dKMG1tNnh3NmlDcGVYeVIzT2EzSDJaUFJQ?=
 =?utf-8?B?OFRlMkUrWEJEazBUNTQ1QWlidE1LTWZoSDRzaGxBVGthdFVJNmdLM1prM09s?=
 =?utf-8?B?MEUrUVFsSHd1UU1OeTdpT25oeTJvR3psRUdid1Z1WDlIY25WZEdRZnNyZ2VG?=
 =?utf-8?B?Wkl6UzQxRUh6VVNPdU1zNVB4S08yOEduNkxNdk5UTFRIZGhIZmNXTjNobVV2?=
 =?utf-8?B?NzU1S1Y4TWtvcjB0QTRvanJmSm13Zmp6UFh3MzNNUFVncGJCNWdGY0lES3l1?=
 =?utf-8?B?cTNQZWpydWx2c3M1Qm5qbExqYjVaQWUvZFJrdS9ub3hRVmMxdmplVlZPNlBm?=
 =?utf-8?B?ZXlSWWNCcnpqR1FXeUZ3SGZ1LzZMV3pGYTRidnZtU3FPSDJ2YUV2YzJ0Nits?=
 =?utf-8?B?bW04NVhabUN6Mk8weWV5eGFJQm5IZ1dFaG5oVEhpMmp1VjBaY2REa3dJOHls?=
 =?utf-8?B?UXo3cUZhaHIxSzloODFpMktEcFJjVzJIcW1hZkZ1TGlMeHJacVdGMEI1bko5?=
 =?utf-8?B?UDd1d21mOVBUVngvd2h5dkt1bWtxRGU5ZWJSaHJPck5WcmxpN3hZMmZjcGJG?=
 =?utf-8?B?MCtoUFM4cDBNMTY4a0hEM1ZmdWd5WVlHcFNmQUJLdFRVd09tRUwwRXBqVEJz?=
 =?utf-8?B?amM4N1JPOWFWUldHbk8yYU5nTElhWU5VaVZIVGlPVWsrWnJoR1lPU0c5ZFJ3?=
 =?utf-8?B?Y0dyS3RwZ2lNajQ1bW5qeWlBaW80V2V2dUxmajhubXhNcXBhTXFucXlYek1E?=
 =?utf-8?B?NTluMDUyM0wxaWlIR1Fud3JrUHBWTG1aVUY2L2FXSWM3Sy9JRFgzTkZRSDNy?=
 =?utf-8?B?T0xRcGx3RmlHTm5henJXaDNMaDFsVHozVjZRZlRFVXlaaUwreGE5WEFGekd3?=
 =?utf-8?B?VjBWL1Q1UzRVSCtWT0JKUVhkajQvSVhub3hqa21ETWw3c0p6TWlRS2w4KzBx?=
 =?utf-8?B?OEk4eXAwS2Iwd0RSZ0tRMWgxbHdMeVo0aWhrcW92Uy83VkVqY2hqMlRNcXht?=
 =?utf-8?B?ell2Q0VsWk9PSS9naXUrcHpHL2QxNnVycUcrUXQ2ZTZZMWMzeHd4cVRMU0xM?=
 =?utf-8?B?ajZOUUxNK2UxM3BDWkN5RGFEQmxLK2ZjYXUzQWxBdnV3WENDajFETXIwaTVH?=
 =?utf-8?B?aUp4b24zbVhpVzlUUzBYcGVNMGMrQkF0Rms0RldseS8yWEhsOXR0NDlvRldE?=
 =?utf-8?B?R1Z1SUx3NDdTZ0ZUUWQxdDJMdXJqYWZjV1hoUmtzNzNtaXlmWVNJNmZFTmhM?=
 =?utf-8?B?OGdMM2FLLy9xOCtzaC9vYk91WkNFRS9sVnMxRUlKdGRZMEEyMGtINlFRc1B1?=
 =?utf-8?B?VUcvYWxoYUt0QUlQempDd3ZyTjRzNDlRRkJON0ZBK2NMUlF4cnlROWRrd2cx?=
 =?utf-8?B?NkNEQ0xUbHNtMlhIRHdRZ0dYYWIveVpDbTQvTm5wdTRuRURicnpqT3BFblVk?=
 =?utf-8?B?c3poaE4rakNvK3F1OE0xdHFvSjIwMXNmUTgvV0JFa2FsRXJPQkw4ODEyS1FI?=
 =?utf-8?B?bHpqUVpveXZ6bWZoSXlBREZlai9QWjlTdnZZWjJ0dzVkUHRicGVOcTlqNlFQ?=
 =?utf-8?B?U1JzRmlYdFFVZ1N6ejIweitVb0ZyTnlFUmdYSVI1ZkVjaFhWRTNHY0R5U1Ex?=
 =?utf-8?B?TTVyNUVNRW1QWG56VG1aL2REUTFSR1R5YUtDMzNHZmVLTSt6WDRXY0JSSHd2?=
 =?utf-8?B?Zm9ZNDVXaFNTdDBNWnE1Z0lVbUhZNWpQZkFocEszYUFqUjRsSVZ4QjVUaWxz?=
 =?utf-8?B?N3lTaG4vWE90dnQ0WDFzdjVuaFU3RndtdGhyYnZIdnhiV3FzdmltM3A5UVBU?=
 =?utf-8?B?cTVhWmg4NFJJNzNpVGpZSmZMMEhLZGszczVXdkFKc1ZiOTZ4SVV0d0NHbTNr?=
 =?utf-8?Q?vRZuHo2Bq2xFpzfQ=3D?=
X-Exchange-RoutingPolicyChecked: fTrcqLr0EwJNYEQeXpXqlvhjgjdsFKVpzY3OKMI7bMvKNg9EoYx4ctchahXrtkBY/t2lgXd36wCBWeHdXyT9PEXXNDE2IANUPfTgpRnXyDfeBtoUafNLD/qJnp2U8ogPyiXBJRHe4P8MYNYglu8ACknDtafv4/XcbQ474QObfRP+UkiObsmbLGstNAgCOGALDEytReGr6jj1QYHzWBRp/CzPef9qQlsM8A1eLvfXzZe/ZrVq0xCeFVeNFXp59UUKOj817qSDrs4BzrdOBJWypNvjyxcANpQExJjZF7mx9vn1MJ/N0+2FUDTPkBz2s2oeD8Dpybio2zOjDIeRK2kbfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c407a7-6bcf-4ba6-3f72-08de83e8a2a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:47:12.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYTgQ4a01xW70gK0feZw4MUZhmlc/dlIYkrSfs7d7/MfVRLbQQuzgR0TWUBN7gHa8Ui4quEh/kZbM9oSwEO2x72Mhk13dfliCARen0ow2Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
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


On 12-03-2026 02:36 pm, Raag Jadav wrote:
> Add system controller interrupt handler which is denoted by 11th bit in
> GFX master interrupt register. While at it, add worker for scheduling
> system controller work.
>
> Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
>   5 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 9d74f454d3ff..1d6b976c4de0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -22,6 +22,7 @@
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>   #define   I2C_IRQ				REG_BIT(12)
> +#define   SYSCTRL_IRQ				REG_BIT(11)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9a775c6588dc..e9f0b3cad06d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   
>   /*
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   				xe_heci_csc_irq_handler(xe, master_ctl);
>   			xe_display_irq_handler(xe, master_ctl);
>   			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_sysctrl_irq_handler(xe, master_ctl);
>   			xe_mert_irq_handler(xe, master_ctl);
>   			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 365f73ef680d..30349df1c04b 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -8,6 +8,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "regs/xe_irq_regs.h"
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_assert.h"
>   #include "xe_device.h"
> @@ -33,10 +34,16 @@
>   static void sysctrl_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_sysctrl *sc = &xe->sc;
>   
> +	cancel_work_sync(&sc->work);
>   	xe->soc_remapper.set_sysctrl_region(xe, 0);
>   }
>   
> +static void xe_sysctrl_work(struct work_struct *work)
> +{
> +}
> +
>   /**
>    * xe_sysctrl_init() - Initialize System Controller subsystem
>    * @xe: xe device instance
> @@ -60,12 +67,6 @@ int xe_sysctrl_init(struct xe_device *xe)
>   
>   	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>   
> -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> -
> -	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> -	if (ret)
> -		return ret;
> -
>   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>   	if (!sc->mmio)
>   		return -ENOMEM;
> @@ -78,7 +79,31 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = drmm_mutex_init(&xe->drm, &sc->work_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>   	xe_sysctrl_mailbox_init(sc);
> +	INIT_WORK(&sc->work, xe_sysctrl_work);
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> +}
> +
> +/**
> + * xe_sysctrl_irq_handler() - Handler for System Controller interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by System Controller.
> + */
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +

We need to check sc->work.func if NULL then return, since initialization 
of interrupt enabled @ line: 923 xe_irq_install() after that line 989: 
xe_systctrl_init() set the work.func. In between

xe_sysctrl_irq_handler fired then work.func is NULL and going to 
schedule work which lead to panic @ worker->current_func(work).

Thanks,

-/Mallesh

> +	if (master_ctl & SYSCTRL_IRQ)
> +		schedule_work(&sc->work);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index d5d8735038ae..ff60d42b52a7 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -17,5 +17,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   }
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 8217f6befe70..13fbf2990280 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>   
>   struct xe_mmio;
>   
> @@ -27,6 +28,12 @@ struct xe_sysctrl {
>   
>   	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>   	bool phase_bit;
> +
> +	/** @work: Pending events work */
> +	struct work_struct work;
> +
> +	/** @work_lock: Mutex protecting pending events */
> +	struct mutex work_lock;
>   };
>   
>   #endif
