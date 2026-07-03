Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2420AC43602
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 14:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D593610F822;
	Fri,  3 Jul 2026 14:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRMFWGdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892D810F822
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088257; x=1814624257;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wbRb7IvXyGU4Na6gqh8/ddcfdTnmt9x9qy2Va1AjLZ0=;
 b=nRMFWGdHr8nmwTKt1E98sRUJ4uAtAP6inX7CMEhEb57urk5sHKQGMfgl
 imBGY0M779j+AB0wmXS1gzpon57IbPekDNV2fwhAOlj1+oRPKOVBxx3K0
 m0ennSLFGn+XFPATbXjmtYNCVhmr0qLUl/sJgnDszwbdKBqjS8i4rkjCv
 8TLXFRTtYl+eYl/oB2z1GIg0MqMs0KRUY7mfqvbtsQ+ksQK+oHfk24ziB
 /+1MVtX66wzKDqqdf0xkoYK9R1kQ4roV53HrFJZSmGdD/KcgMYFIRaMu4
 m80Xjd9SKTmDltCAuRQeIGs2kmkd8herv1GW+N6bMN2jZTdLshf5JgOfN w==;
X-CSE-ConnectionGUID: V/avh0+gT9ytygWciTup8Q==
X-CSE-MsgGUID: E34AC0PQR+CAJ9z66eISLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87755683"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87755683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:17:37 -0700
X-CSE-ConnectionGUID: SJVHx/3gRCyl9x5NJDufjQ==
X-CSE-MsgGUID: 6T7M3ZIiRb+Ju6PMX9MPgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255041187"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:17:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:17:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:17:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZQD4cV3exiIcThUcRu6+0lg8GJ78krNv/ABemXOtpFtnYnVUq6fiVQ3xO0Cyujp82scmjHp7l1yGcf8MfQCvICE+S0WyES4ugP3UuSZnWopHaUFUznxgf8+ZNfKJxe5xZj9pwpqUftc2pT8SYqoKjZ3MNe/BK2B9BWWoOIpm3vZhm6OnT/UW/maWhGp76bU5RARkCkIIxZDtY2aNQrXiOXbClb7V1/p7pLRm05YPXoEyD9L7X195Qr4wfD+oLK8waqyOkfdoQHSKXLoet5H4744TQ+k0/T1j5PkHRndA0BipssJ75gZ+bD4oTsgkDQ0G8fB90Dhfp5vmyBNLwl2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PveFmN+14xxGSEx40mHsSRQTjGyRXe9xihJ8NWFn61Y=;
 b=YwikkAJa9GyHnEOTHsfy6P8k2ZM2AvL3+y/G5N3MEo+VVLKjiVp3kBbl3h4cZ2i1fkulLqTg3+gZJP35Z8qGyEMygEw8f0PMX0NiFPS6sGy6GvgU4SIuXH37nhJRNZC5LuVKVC1CUjcpSnYlD7jJn8eEKWREzqLT6yaVhpsTgpO/8Hn3CTmmprheUsALMxwPKMyQFaSE3Aib5dgAgMwjgOjLgxPPLXanVKc2TeH+txzzPy6G+1d4P168mU78RR0VQJYY04WC9rdLk0Z34xHifIUNfLXhlvDWwZyLsV7cXKWAya66So1duqivLf7c8HtKM3dYiMrABje/arQM1JTtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:17:35 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 14:17:35 +0000
Date: Fri, 3 Jul 2026 16:17:31 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/13] drm/xe/tests: Add GuC KLV helpers basic tests
Message-ID: <akfEYqdr-qLQA5-9@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIUP296CA0138.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::13) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 364b06a8-c9e3-4a6b-e354-08ded90dd407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: qhLuE5rOrsOGLkwkgwZTz7NUYK9K2Kzo+3kMUOILiWMi+rBx/uqSZkvym0tTVCDvsRCWICXrV4YcEm7ejbHAK/7K+iWyluqmrnUUT4oo62l6pJd86Pdn2xw9l/ZKRi3yFlnKBmX+HKcofILQq7Kx6deMjvUgTtJZamggjITxxI+170nvdLN9ev/CQ4qQMvt6Mjv9qyIOCWIr0JQS9HJPnFRZXF9SrlNMinBLCRNjGEFsXE91tkDBQCCaIRhLzXd7c2i4nvLpGg+4qGVhgEvnne4qtYXtiLTld0gTO53UoU98bwM5lHjcZQQi/oo4F4PoX9vAp/bjlw4sdYO1WeCs3yHVj+M03pEJa0d+S5r4k3QrdBia4g2VJ/AoK2R3E+jV3ZckpNAVQkLSd4idviBd8ETusDCAmMfdmD1zD6WXm/C5Os8ut6FXrOwAm3/zmuVTgTCR6z1AQRPPq9xbLDVoz1QBfXYVHhoshK8HoQzZuqQPdEjPvHWXhbyn02g/N1FAvF5R39nS3atcLB72DK5hsKJZteLKpliAIPHpKZhBtx9BaDM/7ZVTsvlt6bx/BOjHhSTsEA3WBzq4aptK7rdltqgObH0cQOVBBH8t0wZwNou1Kg+MKSQnbLnVA3ecpIJSfFbzLWamrEYVBEZq8UgVO8a31ps3vI/41qGPatHctdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnY2QkZlZ3dwUTJCeERGdEtySjRZdDBUTEpycmZDQTlVYnBIRlFOTWlqTDZW?=
 =?utf-8?B?Sk5qdFoyenFQSDlZU2habWpIQUl3aFd6SFEyZUc4RE53dHdDRU16cUxsNC9a?=
 =?utf-8?B?czUycjJsTko4R0lhTFVOeUIyZllVdW5LNXhoTjZtSlNVOGRUNnpIc3dWMEIr?=
 =?utf-8?B?VlcycG1XZHVQWDdRcnErbkdURG04dE9pUnlIaHJ2aUxHYXl4MnZrVTFkT05l?=
 =?utf-8?B?NXFCd1ZWYS8zYVF2T2JSZ01TMjlvWUowTnB0U0xlSjUvRG9vY3NCL2txSXZG?=
 =?utf-8?B?WndWek5kK2l2ZUIzVERzVnZQN1F1TXpHQzNSUUxBMHVZUHhyZ0VDOXQ5UFpI?=
 =?utf-8?B?YlM3R3NETDRWNXQyMGc4RTVnOWJNL2x3bEpKT1phdm8xOE5rVjViSGtVRkNq?=
 =?utf-8?B?akpNWHlZWS93UzRqQUgxWDhPckRRS0tNUlFFL0JucWliUTFDVEJEUXgvMHli?=
 =?utf-8?B?VnpRbVZoTTBVakgyS3JjR2RiMkVkclErdmNFTWxQL3kwMzB3dG5rRUdaSnR6?=
 =?utf-8?B?Vm81UFZtVWZLd205NnBTUmg0N3hjcGg3UnVua2h1UVNHUzIveHl5SVk5VU1V?=
 =?utf-8?B?aWxDUmNicTJnQXdBdVovcEY5VGRYMHFxd1pjeCtUeGxEOUhvek1Gb0pYS0Y4?=
 =?utf-8?B?SVhES3cwQlFVLzRXdy9zUGVLVmxZTWx4UW13N3FQNzRxYWVuMFIrUUlkOGYx?=
 =?utf-8?B?cVhmZ3QxRXpRRkRkVms0NzhhMHc4Y0oxWVpONUhFU21pc0EzeGw1bUREN1lp?=
 =?utf-8?B?WUxmU0NIL0RRcjBGZG9KSW9tR3luZ0ZBNFJDRUQ2NktibWN5SFN1RjhaSVlp?=
 =?utf-8?B?SUhGTEwwY0tGZkxqSXhBeXQzY3g3VjArMHMzUGhHeHlpMVdra1hZdW8weUQ0?=
 =?utf-8?B?eXBYa0hjYXhCemFQRm9oZWxHMnJIVm5ZNXkzR3JlZE5LUlZrMHRDeWZrZ1Ay?=
 =?utf-8?B?ck13WkdsK1dGV0Q2L2F2YVRqc1Y5c2htN28rOVU4Y3MrTXZnTHlFVjFwdk5K?=
 =?utf-8?B?cFFhalFleHVCbFYvMEtmR000N3JCMVc1K0x4ZWhGMDQyMGxUdjFLM0FEenhK?=
 =?utf-8?B?T3Uzd20zT3E2c1dEZ0pGZnRxd2d3U2ZHN21pQUhFYkkzdTd5MVhTL29PL3JB?=
 =?utf-8?B?Z1NmZEFLQUdiTmVjK3N0aGJXc2t6UFZUN0VvN0U2SkQxNk41R2tnN2JaZkhS?=
 =?utf-8?B?dWxKQzBtb1h3dHMvY1hLRUtJKzVpZ2lwYzJWNHdGcEZLWUM2MVZjTlNHVTBu?=
 =?utf-8?B?NXlGVzlvZFdKODdKdXBPSy8rVzJjdGFWT0xZNmx1Tktycm1DOHNOYXRrRG9a?=
 =?utf-8?B?RTg1aXNVeE5hM3EwemJiYkJyNjhDMHd6M2pzcGZtZTRBVUtqVGFGSFdXcklJ?=
 =?utf-8?B?cVgwQWFCM2VyYXUwV2tnN2hDUTdSd2RGQ2F3Y0wzNVdYMHZQYkRVbWIrR1ds?=
 =?utf-8?B?K0ZPV0Jka2JJajJnWDJyWXRFUUdOMjQ1Z0tsUE5kNVZPM0dEbDcvZWtFS2Jx?=
 =?utf-8?B?Qi94cWZwR3BRL3VUbTFIMmt5K3FiUW94ZEp4WkJ2YkZLRkZaM0xhVjBabWtl?=
 =?utf-8?B?YXZweHV6Q3FIRTRwbzFvTWNyaTBIaytkRHQzRHFjMU8wUFAwMjdnT2o3NjRa?=
 =?utf-8?B?S09HencvQ2JwNVJoZ0JEd0laNWhJN3UxMHdJdmlaU1hEZlF2WTNocFdML2N5?=
 =?utf-8?B?am9ibnk5UDAyRm1ZVHVodzhscGtvOHg0Skd6bWZvaFB2N05iQkNOUVhvQUhX?=
 =?utf-8?B?dlJaamxzTzB1S1RQWklRc21rb3dtRzJLcmZvMnROaDhpeGwyY1hWK2UzVHYz?=
 =?utf-8?B?K3oxMEc2OUc0dndqenk5TzZXazZIMHdVaW85VmVzSGRRejdqMXN3OU5zZUY1?=
 =?utf-8?B?Z0M2c3F6SlZqMjR6clRORGRkNU92d29wNXlZQU5ncGdFaXZGcExWMUUzT0lh?=
 =?utf-8?B?Znk3SDEyVXIxWTJEL1drKzR4eG1TWWN2ektTblBGKzNHUGFia01rUXF0dTVy?=
 =?utf-8?B?dlo0NmR3UUlncUFYWmdmeDNmYytaa1F0QVpLa3RtTkMwZ1A3aFVsc2w3WTFS?=
 =?utf-8?B?anZuWThNUEMyWW0wQ0MzTERpN3lEaDZYdDF5aksrTjQwNkJIM1ZISW1mN09u?=
 =?utf-8?B?RE5vdjREMGFnaVB5TGNLS1NkWVFHbTlpZll0U1NuNnNmMDhFTWhTZEt0ODRl?=
 =?utf-8?B?QitTUXdHNXI0UXFmMi95Y2hXK1NWS21IR1BEUXdwY3cxU0NoZEp0bEVpU0Nz?=
 =?utf-8?B?YWFNYms2NkUyVDNiSFlzdk83SEozcGtEblN0czZaNzI1TFFxZXBmWE4zNWZy?=
 =?utf-8?B?TGlhVVU5amZiNTFzekhZb3ZySnJTTDNTQllyaEkvQm04UUZGd05KVnhTb0p3?=
 =?utf-8?Q?whEoSOuB4BeoABCU=3D?=
X-Exchange-RoutingPolicyChecked: dOM/nX92CbsogbYGgf8g33QhFYw5nV5BjnAw1SEG4EKBKuKg4xrBPtLvohb607XJLbrU/r11ljMN66UuKX8pnYj1tyZMXeBIoan8OTNZI2OsvfXuSSdwScGVLrhyZsAM6HCYvaOpaI4nOZf3+uvYk7fj6X4GwBRh8B3y0Cg4zOHUQBH2KPZbQK4ekbvXrWYX4bSyR1IcSylyKFPWwJ+cPeILaH2MkpxRXwcH3XIH8SeyumsCFN/0N+MNuIvmYRaoiFoXq0WK8nGg8njI4mEDcGtxUzqkx5EPP3T+uNTyQUtX9IguDY9vns7HimxEEUmm6TqagcXknzxFDRGdgkibmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 364b06a8-c9e3-4a6b-e354-08ded90dd407
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:17:35.0749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7DI2T4HRgVagcjOVnWf/URySRQShc1F/PwQ0jK/sW77rggTaRVGmqeI8mkLkobz9TA9TB1WpX1aT+PhkfsgmdbYkCthmfevpCmObe7qlZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Tue, Jun 30, 2026 at 03:26:27PM +0200, Michal Wajdeczko wrote:
> We will be making more extensive use of GuC KLV helpers. Add simple
> tests to ensure the helpers are working as expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 99 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  4 +
>  2 files changed, 103 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
