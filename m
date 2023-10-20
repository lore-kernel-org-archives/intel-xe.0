Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410D8CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377010E58D;
	Fri, 20 Oct 2023 07:44:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F51B10E58D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697787842; x=1729323842;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X3G+dIREcLzkB6kvdS1BSSeC8fyGYVFwzzeJvppiUI0=;
 b=aWcoH77duTvLcmAyD+vHjbjm8FnBxy5lnSgJgL0gX/q5e9LhOC46gOIW
 0Hr7nieAx4kNq4nBY1gJgNv1jlbs0SD6knS/mkRJrReN0vfoSq8JyVDuN
 lS+ByKWlU+uIWOfe8quI/88zP0CWYNnPoX2SUCs/JEyKxgN54gRBEm0Of
 jc0MOVZIuKCH0aGzWlYyzLy+fot5s2uvqTT3mTU4ogTdsewvflfqcxRBX
 cVqqZJyq0T6fLqFBK+b/yyavT3k2TwTLIDiMCq1jLsjxuBPrZEectycxD
 guXoz1uGwKoCG3o5B0WRSoGhQD3tqTRDGb0zvv8wcUVc1z8/YcYj1p/mY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="389311754"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="389311754"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="707154962"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="707154962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 00:44:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:44:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 00:44:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 00:44:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnr16bkHd74VbRZMOHnHoRQGcmol87S2YJMFtSgrZqFyB1EPZeN4JIaWcxEtiK0S/4bctQC4kYnujFKmBkIIJhtBZ42xfsvoB6+/yBBhbL2pdKx4k5ENfVavv/YcBdCP3je0zuzK8U7Ha4i2hCO/0ZovcR8g95FVx3CFkPKtW+w4BWYb3Mlu+qWvCRfEINGLAischgN19EnM0QYy4kRBSsR4LQ1QNWLkw2w6rO2kBm+stlmvIp5g8ZRti/jIMEUsfSvirnkxCI+T+BIwzJn4bzFW/IujjD4Wat9OYgeuSFcU570bYscopNrkPjw5owrsmWSk2bwETTldnkSgIZYESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6fn7rs9DFi5ul0EStdeGQrPRr+V5fMkJj0a0X0sbPU=;
 b=Mc3BbzCcYsmxbmEaFZnvKOeKAUDj8YHpmCYg1hWhr0AcE/TO2ezsz2Qbfnmf11DB38wog4rdW9mwjYL4ZHfbRSgLMRTHLy7QbhenaY7jJS4dQFPt4Y9GaoKY8qHkK8LfhpKMnu7dmPIwQRH1P5YZPaCrBFrB6JnQOW171q7Hy5KH5mchQ3RJeyt7KnpSYQLsPKryD/Na4weRPVlJcu21ShjqkPcPMtg8cGeFkc8c9H2BI/RsGh8NwxgqnEB8Z0NpOByuts27RG/MRCesCGwWjKAP3JaOSeAvzJW3NneEdTDAMA7LRW83VxQ5h/kuMRqeB/M/4uGX9gXLYBcZOCyzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM4PR11MB5376.namprd11.prod.outlook.com (2603:10b6:5:397::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 07:43:59 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:43:58 +0000
Message-ID: <c14e2f76-9201-400f-ae50-a66651a473fa@intel.com>
Date: Fri, 20 Oct 2023 10:44:13 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM4PR11MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e87e1f0-3dc0-49ee-09ae-08dbd1405123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLhUHt3rVC7H+bpbZDXXdcy09A+d6bInjteKxlPbqlieaEpDlrU7PC3kmKKGGDVV8oTjoFaKDwKwxpEUmsQCERqF5NjLLdae0DvhPEpf21gJg3DqlnFFfDXUu97NX0SBCQH55xkGOTR8GzUGo1qHgzIB3etOAWsYzjZ5vRFf/rgb1Yvwpi5DWvgzswO2MsWwygXC4BAVaxF7FsLwixyOiMjrYuP9CwrKB21Z8ynXrp5MVpOaGK7tXlli+3lpBfdLiCkNzBj3DmteiR88rNovR+gaMaJxKCczHGF8uz7dANFKEn2uHeOgq/qEsupIx7t8Z3peqH8twIfShU6sgzSsCFYdYoZT+rGS5XEa2pQnxbxNKbz4dbNvRMMKOrP3+Rf8SUgLzTT9HJch4hlPWkA4F6vpcncEgZ6TZJbyYhGzE5SsOt7uk6XdXmkzAkYeT1bHZstNeUyNLo8MyVcge0dDavNEp6ijHgUv3M3T9K5je6H6VKGLqQHRDFcwk+0pA/Yq1W7eAOaQQweNOHJT2+BmRGexnxA5SfWt4UslnWZntvFfPrMfFzQ6dgBETMX5hgzwNtLrzPqlDMp0vfjtyJ7KQMO10uXlJdBhhS4cRG+hRdDuV9fujiQflxsdamIOrndLj2GkQaRxDazC68/NdNP2ss3M38En0kelVfnHGQ/oxXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(31696002)(36756003)(38100700002)(2616005)(2906002)(82960400001)(86362001)(83380400001)(6512007)(26005)(53546011)(6506007)(66476007)(6486002)(5660300002)(41300700001)(8676002)(478600001)(316002)(66946007)(8936002)(966005)(6666004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTNFS3VyUHBLaHNSNWhuVDhMa3FiTHJZdHo4cTlRVGJBUm1ldWFhTXMrN0U5?=
 =?utf-8?B?dnZCa3FjZkdzN0dmd2lpUEZSYjE2LzZpWEVXR092RkFSZDJhNVZtQmhxSnZw?=
 =?utf-8?B?M1RuMVNDZ2V0dDVOUW9WVFgwM04rak1TWjNyREhNb05GdHpJMmFsOFlsSHpZ?=
 =?utf-8?B?MkYyTDc4TzRkcWxmME4yYTRleEpyYkpLMzBUOWE5REp1MlNpWkJrQ2tmaFJx?=
 =?utf-8?B?aHVRSlhDVHV5TU5UbXgwU0FqdmxYTElZVkRrWXRvazMvOEtuZ1c3eld6SVRu?=
 =?utf-8?B?czVacjVNTllReU9GMGlWNmhQVjU5T01UY0lRc1Q5Wm0zRzRTdC9kQUh6TXNM?=
 =?utf-8?B?dTl2dzRlK0RUeUpqZDM0aysvMi9JZFVHQy9rSUpHVlh6MjNMT2pxT2Z4S041?=
 =?utf-8?B?RGo5c25yK1JuOTl2M0JIS0hNRzduNzJWY2NqdWE4NmZCZ1VscXpYSGFTZlBp?=
 =?utf-8?B?WitEYlVLeEJTK1lvNU04N1VrWlZhd0xHQXhqUTNvS2lyWDhkakJ3aTM5Z01o?=
 =?utf-8?B?ZkVPbkZWY0QzZmpHVExvem1WNURYcTFFYkFvS0hyb2srcUlGOUt1d1pmOWhE?=
 =?utf-8?B?ZDJNd0dXUmhQQXNXcjJSa3RvdnNCWHpnTTNxbDRGYjRkRU4xaFc1OVowN1NV?=
 =?utf-8?B?dHNFc0pGTlZMQ0VYU2xycHd5VEkxS2JkTWdtdlpwSmtZN1RwdkplVUlqOHU1?=
 =?utf-8?B?YVNFUlhBS0FVZWFRbFRFemt2K2hYcWJZUlFId200bmJTbjd0dkkxRU9SVGtW?=
 =?utf-8?B?clgvc2VSdWExTjBiZW5ZdFFaa1k0UHFaMmZSa2NhZ2dSUk9xU1JwSDNKeHkw?=
 =?utf-8?B?VE03Wjdva3pLMCt0RTNmeWpQbVVvUEV6dVJnSThOamtEeTFBRUJBNFJMZjFp?=
 =?utf-8?B?NUpCaWhvZHFwcVkvRVliM2ZqWWcyTWNzWjdnM0FQTk8wczJOdjlzL1BRRUpt?=
 =?utf-8?B?WEJ6bVpXMTRVdmhmS3R0VUIzOE0wKzMyVnF0SEpLR0FZRUE5U3BJbWlnRjVD?=
 =?utf-8?B?aTFRRVRaVlJTeWJLNW1WYWZKRjBFOGg3RzlIT1F6My9wc2VWMjZVZUhtcE9T?=
 =?utf-8?B?THhMamlWK1Fpc3VtZWN4RVpMZU5JNnpMM1gzMFFCWDRlUkk2WFR6SnY5TUF0?=
 =?utf-8?B?RVVoRDB1cXBFdW9XV09STEJnRWRNSlgra3R1VEwzZUVOUmhjdWR2OHZvWlpN?=
 =?utf-8?B?dkhLdGRJbE41aUxWa0pBdFFKVFJlWjJkOGYrQ0oxK3h0M2YxVGF3TkhrVUVF?=
 =?utf-8?B?N2JickVPZWdhWnJqWGlMellHYWdZdUZoQThYLzIzQ2NPK0FlN0pnMjRZV2Zt?=
 =?utf-8?B?K2h4ZDB0emV2YXlUeDRvTEdtZGFXUEd6M2JmMmlFa2xYSys1dnpKNjlPWE1H?=
 =?utf-8?B?Y1BtdGdYNTl6bE1paStCSGdzTmtCV0VxazhUOWpjKzdxenlXOUJ4cnIxRkJz?=
 =?utf-8?B?U3ppWXpONEYwTVBZUUQ3WHNFaUljaU82SFRhVG51alJKOXJ5anczWWVmeDUr?=
 =?utf-8?B?Vk9WS3JEaUFRdzJLSHBoT01MODVsS1Vnc0w2V29HSDlMY2o1eUNkdGYvQitP?=
 =?utf-8?B?dUg2emt0dktRTTIyL1N4NmJjemFkSzMrMFZpWW1DdXZQTUJsVkR6TVJ5L1VM?=
 =?utf-8?B?R0w1VnBYcVJFc1hncytuUktKak9BS1RsNEhONStuZmJjeGlQcjhYWXgwREUw?=
 =?utf-8?B?cTZLR3pacXBySkJIUkE3Z2Z0VllFeFE1VTZsUUFzNDg3SDhJWEVEOEJIR3Nx?=
 =?utf-8?B?UGZ3VGtaODUrWFVHOGdFeG92Y2VKalhhc1gwRTdRTXNwSHRlWms5SkdreGlq?=
 =?utf-8?B?VDIzRlplU3RWOW94MjR0b1FoME4xdS8vS3dCSHBZY3NKUjJwWTZ0dm1kSGQ3?=
 =?utf-8?B?alFQTDAxbjBDVGJFZ01ORlZzLzV0d2E1NTN6NjE4dEx4VVhFWDhPNWh0MnRi?=
 =?utf-8?B?Q0tlaHk4Z0tLMHhndDJBOXV1U20vTUVpRnhySHFoRjBSd0Q0ejBFdW5YQng0?=
 =?utf-8?B?dEU4RFZ1RWlWNG5JTGgzTi9tZHJtcmJEWng2cFZkek5nUmV5ZHdscmJ3NzBZ?=
 =?utf-8?B?cTRJL0hjMmFqSERNNXB6NzVHdVpuaDFqV0dZakwweXhSM1llOTlwaThLdlNI?=
 =?utf-8?B?SDlUUElPRHVlbTZJSWFmcjhqTWpSbjc0UHdwYUw2bnR6bjFRRUNvU2Jmbjc0?=
 =?utf-8?Q?9fzayw27S8RdGnPA2+qzDPk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e87e1f0-3dc0-49ee-09ae-08dbd1405123
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:43:57.4176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+9+fMa07xa+A4t46PnU0F19fI9zUop5yfjgCZpgBBXHFfvjIkd0zosuoCvEofpmoPxgwEPdyxG9TSn7FZsYUvEhNCB4DXDsb/Ve2/O59cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5376
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/21] Add OA functionality to Xe
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

On 19/09/2023 19:10, Ashutosh Dixit wrote:
> This patchset is the initial port of i915 perf/OA functionality to the XE
> driver. The following features in i915 have not been ported and will be
> added (as new patches) if/as they are needed:
>
> * Inline batch submission on stream exec_queue/hw_engine

If you give us a syncobj to wait on for the NOA reconfiguration this 
won't be necessary

> * NOA wait

This is kind of required, otherwise we start reading reports from the OA 
buffer and the values are garbage

> * GuC ctx id (guc_sw_ctx_id)

This is probably fine. On Gfx8 we always consider using OA a privileged 
operation, if we keep it like that then it's okay.

> * CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
I think if we never care about Gfx11 that's fine.
> * hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)

Without this, we can't implement perf queries in userspace.

Maybe that's okay?

> * sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
Without Gfx11 probably fine.
> * MTL bios_c6_setup
> * ratelimits
> * compat ioctl




>
> I am providing the following additional HAX patch (not part of this series)
> to help review these patches:
>
> https://patchwork.freedesktop.org/patch/551683/?series=120100&rev=4
>
> The commit message in the above patch explains how it can be useful for
> reviewing this series.
>
> This series is also available at:
>          https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa
>
> The series has been tested against this IGT series:
>          https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
>
> v2: Fix build
> v3: Rebase, due to s/xe_engine/xe_exec_queue/
> v4: Re-run for testing
> v5: Address review comments, new patches 11 through 17
> v6: New patches 18 through 21
>
> Ashutosh Dixit (21):
>    drm/xe/uapi: Introduce OA (observability architecture) uapi
>    drm/xe/oa: Add OA types
>    drm/xe/oa: Add registers and GPU commands used by OA
>    drm/xe/oa: Module init/exit and probe/remove
>    drm/xe/oa: Add/remove config ioctl's
>    drm/xe/oa: Start implementing OA stream open ioctl
>    drm/xe/oa: OA stream initialization
>    drm/xe/oa: Expose OA stream fd
>    drm/xe/oa: Read file_operation
>    drm/xe/oa: Implement queries
>    drm/xe/oa: Override GuC RC with OA on PVC
>    drm/xe/uapi: "Perf" layer to support multiple perf counter stream
>      types
>    drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
>    drm/xe/uapi: Simplify OA configs in uapi
>    drm/xe/uapi: Remove OA format names from OA uapi
>    drm/xe/oa: Make xe_oa_timestamp_frequency per gt
>    drm/xe/oa: Remove filtering reports on context id
>    drm/xe/uapi: More OA uapi fixes/additions
>    drm/xe/uapi: Drop OA_IOCTL_VERSION
>    drm/xe/uapi: Use OA unit id to identify OA unit
>    drm/xe/uapi: Convert OA property key/value pairs to a struct
>
>   drivers/gpu/drm/xe/Makefile               |    2 +
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    2 +
>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   13 +
>   drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
>   drivers/gpu/drm/xe/xe_device.c            |   13 +
>   drivers/gpu/drm/xe/xe_device_types.h      |    4 +
>   drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
>   drivers/gpu/drm/xe/xe_guc_pc.c            |   60 +
>   drivers/gpu/drm/xe/xe_guc_pc.h            |    3 +
>   drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
>   drivers/gpu/drm/xe/xe_module.c            |    5 +
>   drivers/gpu/drm/xe/xe_oa.c                | 2314 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_oa.h                |   27 +
>   drivers/gpu/drm/xe/xe_oa_types.h          |  307 +++
>   drivers/gpu/drm/xe/xe_perf.c              |   36 +
>   drivers/gpu/drm/xe/xe_perf.h              |   16 +
>   drivers/gpu/drm/xe/xe_query.c             |    5 +-
>   include/uapi/drm/xe_drm.h                 |  288 ++-
>   18 files changed, 3272 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>   create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>   create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_perf.c
>   create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>

