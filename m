Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0C6E8FDC2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 00:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453710E008;
	Wed,  4 Oct 2023 00:31:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9106210E008
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 00:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696379483; x=1727915483;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DIekLjRwknlFcLqhyw3yuqg3wy+lEAL74fWlOTBtKEY=;
 b=jeofw3ZIY8i2/mGkSB/vVcngPi7TiLVTSMwVGl5In1ZmjL4jCV05TsMT
 FgAjwJb8Midx/DIbibu4koELlj4Y8oBoVVU9nZR6u4160vQ2MqFqOYhav
 z6qMCz6+KKxeRRbwnEri6APVQPV2ji2yC8H8nFubF9en2U1oPVAIpWpH4
 8dkYnMxvQEDRa3S61tTcWdcT4xD25D4KZeM36/sRdYcAdQeLsSFffCpne
 2VvN4Jgfn6tsgRBRjYABdHbNu5W+P9RSsgaOOk+xx6YyejyWvMDTu8E3q
 /R/VorgLKiA+loT6wmcKtoGyt5iF9CBBZBQF2H6UWJXTd52B5u8EAaTmS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382919710"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382919710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 17:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="841575042"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="841575042"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 17:31:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 17:31:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 17:31:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 17:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qem0Bgbp+NYoGx0oa48cYR+w6ES8JQ0VG+fjydsI0zE4K7ETx60Ldr3LpletW0g82p+kdPm5yH6D6vbU9vJ+KHJL+H2Y5GIITYNDD5zjiAjSh4PFXCryj1qeKSk+lhySz1ESxgeFqFCWxdpqW0DtLxlhFVvfOZRfHSTXYDc3xoP6xEnJZjUIUnmlGsdrVtbuWNjT3EWR/FE+k1NzItgI5a0CAJEqMb1MtI5RlhbCY3bA/+w98w8mfnU/7cvjnOfOMuIGsSGjhJDBUUMzs3ZFCSiC8Jz1QHJt13oUFNVgSOWkUcOYvXdA7MRYBXC5xBP5ZbbXbBdQx7nEjA14Q1kcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUKik5oOz3HBHt3o/ildrncHtwcGOP5oQVg2pX396eM=;
 b=UlhAx5kLb+5mJ9tgHcSlLc0PIcYeqWTa2xCCUiaI0Bi44XGGqBLCnFj1ZOoV0AZutAESXE/qROfDToabC0tWSoemh612KodedXZ2jCeNdZnp8pgpRJBdwgoEUC3hiRispKeF9vXAGPQQKzd8Ak5ZUoikbzoNuRfgpvvjiE0183TqVHOEz/CYDObaCqE3OWCJyuUkqv4t2Jl8O8j3aRZdNhcD9wZyVnFnK9vbpGHZrsetXXzRKsHg7Q4MCtaxdq89hqeY3fMYi1+2eolMe5QgZsBoYhTCe9iIANMTQ/o9JIsHYPqP25fZTXbbxaBHtkFLgwFnHxSY4YZKaAlZx6Twhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 00:31:20 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b015:c622:edaf:8c86]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b015:c622:edaf:8c86%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 00:31:19 +0000
Message-ID: <7581b9cc-a4e4-7417-4652-e8b12c78d7f4@intel.com>
Date: Tue, 3 Oct 2023 17:31:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-GB
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230926125540.7-1-francois.dugast@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: 861bb518-a6e5-40a4-770c-08dbc4713aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhXfXR+IenwqnWSKPGNIMtNgZsC5Q5taksNvkf5XguawdPywPotv6DOyihUfZTo0HYv1A4E2pkQOxdNqn1273hEs3ehWwHf2MLOQvaH5kJfygV1XGv+AcT/zV5CWqOKmdJOgTUjhW6fR6H2RkztC3tSJ9+ypRjxl88Q0Bv0uRzlXyst4Z2Y7a3kX++1JjQ8KOeUuVyhZWI5KDntUQSx82XkTDZP4j0mA2NjUd8o4yvzN9Ib+kiIiluzePI+FEQ0UbSf955xJAM5r4/EJ0XIPvE32WkxpBM/fPfjxHMd5aekqgEa6YDh2w7kRjsALtO3F0xC9oRCEnfev15Qo1NzaI3JOX+XXLiCt6i1ibHBmH++7gRDCKWHJs4IwsRMlCDYWfUeaO4UJGSEEFSSvEt0Rzs/Ydwqnyg9NIr7YNCTfOplsLLLdY8B5w2lJuzdjhTtnh8E3M1cSRztbSlJk/rpLfAy/wQQaMttirdIctI+Zjp48tHEMrH8JoMFO/D9l29IrlajdtjZVLRKpvhg7OheRbA7DeSwDqayxu7q/ynXs866APy14ql/5x2E1oahjhqwDjokO2DdqRrqK964EX9O4k6uD2wognZdQUYcstozTjhlnG7DMRgFQJf1h8enCv0Bb18NjS99g9Sz8XSMqoxtCq82kpYLGWF3HH+sZ46uy9yo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(38100700002)(82960400001)(66946007)(66476007)(2906002)(316002)(83380400001)(26005)(66556008)(2616005)(6506007)(53546011)(6486002)(6666004)(86362001)(6512007)(966005)(8936002)(41300700001)(5660300002)(478600001)(36756003)(8676002)(31686004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2sxZDJ3a254akIrVFVTc0NQT2pCb3hmMG1hckhhUDgvVmo4d0VUYjlIdjUr?=
 =?utf-8?B?c2NXZWxSNGxqM2Y5c0ZaSEZaT1JLZlJpZGN2V3ZzY2FlV1d4OWlSeFIxK2Yw?=
 =?utf-8?B?Vk5RWkJpSW0rMHphQWo3ZU01Yk8yWE5qanFyM20yclJ5TkdJU3ZsMlIyZmZv?=
 =?utf-8?B?TEFRNmdOK2dYMU42blVoa1ZxTWhPWE9zSkVtaWM2L3o0bmpTY2trMkgxR1Bx?=
 =?utf-8?B?WUloSmtPK3dxVGoxWFBHTHgzbzE2MXROdWNJOU13aUJpc3oyOHNDdzhtTWlt?=
 =?utf-8?B?VnhSd3k4VUJ5Q2VVQWM0MCs3ZlVGMnJVZmMrWURVVGRpR04wNDNpMXBOVlpF?=
 =?utf-8?B?QjNOY0N3bnlMSjhxYTc4b3dyc0o4ajU3L21GMldWWU1TNzFSN1Q1YmJ1UjBM?=
 =?utf-8?B?TzJWa1dvK1JMNlBjcUx6cnNjK1dsUTBYejFRVTlCNkhMS2R4SDYzaTNja29k?=
 =?utf-8?B?c3R5MUFQV2pYVEFiT2t3dm9DYmhFZjNNSkp3N0VaTFhzclIySkRQWVpsUTRF?=
 =?utf-8?B?R0V2QUdMOVFyajVtM3NWUFkvM1dLQ0tSSVJ5L00rdC9SREpTZW9DUmEreFNZ?=
 =?utf-8?B?YjVVUHgwQVFqMGw0cS9DVVBaVGJDRTB5YWRHbkFaNnpDdSsrQVdVRWl2UnJI?=
 =?utf-8?B?Z3picnBUQ0lnczhRUXRHTDJrSlBsZ0hlZERFZ3VCUU4yRW1WWlN1SDBwcFlL?=
 =?utf-8?B?aEphcklRNkNRUjJRa2NlUHBpLzFkVWMvYTR1QlJYSzE5SldydlkwQm1lUlJB?=
 =?utf-8?B?b2ZLMVJQajhsYTcxc2d1ZWR0MUVMaEVYellzUzBFQy85ZjV2MElkaDNvYVA4?=
 =?utf-8?B?VEdUaUlhMTJlWjdZazhhSVh5RUVqTVlFUWRUeTlZRXNoNGNuWU5VS08rdEI2?=
 =?utf-8?B?c3RaRWMxZFg2YXFVSWN3SUNReThIN3Z1RVJQc09ZMVkvMXI1RlRnOFIrT1Y1?=
 =?utf-8?B?VHNhSnhMQlI2OE91b25oTGJuMFc3RkxUcmVSTFFLRktiUTFrQlNJZDRqRTlJ?=
 =?utf-8?B?NGJCLzdsamZmOGF1bDhGTGFDa3IwZm1VTjYrWm9Cd3VvYVNtQ0sxNXc5aFJn?=
 =?utf-8?B?OU5STXY3ZERUVk85cll6dkpUSzNTM1RWRW1oeXVNQWhQSVFnVHVoejVDSGR4?=
 =?utf-8?B?ZHZhOTMwVVdtbVVvM0h1eUIyQUFRZFBXLzlvTUFHeU1vMCtXTW5kcnNWMm12?=
 =?utf-8?B?MWRTaTkyd0xhdDl1R0s3UmF2aWtyRUhiTitVWlZ3N09MS05xOEpZbmNZQTlH?=
 =?utf-8?B?ekZYZVc5Vy8yWFlhd0VUYmk0TU8vbHU4UFg3eUJZQnJFZS9sdCtmdGJVTEpN?=
 =?utf-8?B?WE9nUlJVNlNHVkh0UXZ5UG5pcVlLV2NUYWtxZHdwRENuMEZuNWVobElpSVNq?=
 =?utf-8?B?ME5ITFphR200OVFJMExkYTcxT2ZqaDQwczFQZFpaOGppcEQ4NWtLc3Zwc2pq?=
 =?utf-8?B?Ukp2cThOWFZZU3ByWDYxRUJJQVVFcHptUkhNcGVIbTNheE5hVG51eGhxb3kw?=
 =?utf-8?B?THZPYXVCWVhKOW1zMXBBZmVOOEFNOHluZDJjbGtGczZzVWY3MWwzQ3Bpa2lK?=
 =?utf-8?B?dHp4LzVMQ2tkbldRaUxpb2xNNDlHblBkWHl2V0IyRW1OMmpEZmNnYlFpM0dI?=
 =?utf-8?B?K3l0ZDJFdmRDNWR6eXFwTm5Cai9tN0dLdllrbkZNYXpOdCtlM2NzRlFiTlZp?=
 =?utf-8?B?eU5BMmFyUmZ3NHNIRHZRZGxIU3A3c1pLMHVGOSs0alQ2OTBvUC9xTFU4bzVs?=
 =?utf-8?B?MDNVTUY2N1NDUDh5MEVtdW1EQ2NHdTJhN0ozNVVmVWx4ampWYjdQQnVJSk5Q?=
 =?utf-8?B?NWNOUEJSS0MxUXZSKzE4dlhwb3V4LzMwRXd0RGloZ2FXVkRnc2VqRUdBRXFz?=
 =?utf-8?B?YWUxVjR4ZjYvd2Y4UHBmR3RLSXo5K1dOSlVwQ0VtbHJTbEd1SmdlQ2h3d3ho?=
 =?utf-8?B?U1ZxTDNha3RIU0FtS1d4YVdhSWtndFd4emVhT0YvV1dHODZKOFBmK29rcDI4?=
 =?utf-8?B?cjZyVDY2TUp2dTlndHdsM2dBb1NpTElGT1lkWko4cFpoVE9PNnJOclRNYzF0?=
 =?utf-8?B?SndoVFhweDE4QnlBM0t6dmJ4eVhTblBnb3RlQ1pWZlFTWEpDcGZhbEZ0M1ly?=
 =?utf-8?B?ZFhrbDdKMWlacUpXK3pWdUFPZVJKZVBLYmhvUHVKckxyUjc3UzdGZ1A0dTE1?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 861bb518-a6e5-40a4-770c-08dbc4713aaa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 00:31:19.9578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xGHNueeJEIvU+xdypKGMUmAXsnC5JoLRdjbRrmoyFCQqlI3SKtXg1I9hWjiJhTbfimRYzNQsBugziUkCqQUZ9F/6vXPCkdX2NkePay6iDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 00/30] uAPI Alignment - take 1 v3
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

On 9/26/2023 05:55, Francois Dugast wrote:
> v3:
> Rebase and add more fixes to uAPI as well as drm_xe_vm_bind_op extension,
> query for microcontroller version and documentation.
>
> This is still not the final version as we are missing at least:
> - a fix for GEM create flags [1]
> - a uAPI update to go per tile rather than per GT [3]
> - PAT and cache coherency support [4]
There is a need to rework the PMU counters (unless that support hasn't 
yet been ported across from i915?). Hardware generated engine busyness 
is reported in clock ticks not nanoseconds. And while technically a 
native device can convert from ticks to ns and compare the activiy count 
against wall time, a VF cannot do that - wall time is not a valid 
concept in a VF because the VF only gets to run on the hardware for some 
amount of the time. Therefore, the interface needs to return 'active 
ticks' and 'total available ticks' and the user can only use these as a 
ratio to determine an active busyness. Comparison to wall time is not 
valid. And in order to prevent code being written on native and then 
failing when run in a VF, we need to make sure the only interface 
provided to the user is the VF compliant one.

John.


>
> v2:
> This v2 has 3 extra patches that was missing on yesterday's submission.
> But that aligns with the IGT series sent yesterday.
>
> Also I'm glad that Mesa reacted super fast and we already have the MR
> ready that aligns with v1 sent yesterday:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300
>
> Thank you Jose!
>
> v1:
> As a result of the uAPI review efforts started by Thomas[1],
> we have identified many updates on our uAPI that would lead to
> breakage in the compatibility. What it is not acceptable after
> we are merged upstream. So, let's break it before it is too late,
> and start upstreaming a good, reliable and clean uapi.
>
> Most of this work on putting these patches together for a single
> shot was led by Francois.
>
> The IGT counter part of this series is available as well[2].
>
> [1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
> inux.intel.com/
> [2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com
> [3] - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/633
> [4] - https://patchwork.freedesktop.org/series/123027/
>
> Ashutosh Dixit (1):
>    drm/xe/uapi: Use common drm_xe_ext_set_property extension
>
> Francois Dugast (11):
>    drm/xe/uapi: Separate VM_BIND's operation and flag
>    drm/xe/vm: Remove VM_BIND_OP macro
>    drm/xe/uapi: Remove MMIO ioctl
>    drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
>    drm/xe/uapi: Add documentation for query
>    drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
>    drm/xe/uapi: Add pad to drm_xe_engine_class_instance
>    drm/xe: Extend uAPI to query HuC micro-controler firmware version
>    drm/xe: Remove useless query config num_params
>    drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
>    drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
>
> José Roberto de Souza (1):
>    drm/xe: Add uAPI to query micro-controler firmware version
>
> Matthew Brost (7):
>    drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
>    drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
>      implementation
>    drm/xe: Rename exec_queue_kill_compute to
>      xe_vm_remove_compute_exec_queue
>    drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
>    drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
>    drm/xe: Remove async worker and rework sync binds
>    drm/xe: Fix VM bind out-sync signaling ordering
>
> Mika Kuoppala (1):
>    drm/xe: Extend drm_xe_vm_bind_op
>
> Rodrigo Vivi (6):
>    drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
>    drm/xe/uapi: Document drm_xe_query_gt
>    drm/xe/uapi: Replace useless 'instance' per unique gt_id
>    drm/xe/uapi: Remove unused field of drm_xe_query_gt
>    drm/xe/uapi: Rename gts to gt_list
>    drm/xe/uapi: Crystal Reference Clock updates
>
> Umesh Nerlige Ramappa (3):
>    drm/xe: Fix array bounds check for queries
>    drm/xe: Set the correct type for xe_to_user_engine_class
>    drm/xe: Correlate engine and cpu timestamps with better accuracy
>
>   drivers/gpu/drm/xe/xe_bo.c               |  14 +-
>   drivers/gpu/drm/xe/xe_device.c           |   1 -
>   drivers/gpu/drm/xe/xe_exec.c             |  43 --
>   drivers/gpu/drm/xe/xe_exec_queue.c       | 201 +++---
>   drivers/gpu/drm/xe/xe_exec_queue.h       |   7 +
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  14 +-
>   drivers/gpu/drm/xe/xe_gt.c               |   2 +-
>   drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
>   drivers/gpu/drm/xe/xe_mmio.c             | 102 ---
>   drivers/gpu/drm/xe/xe_pci.c              |   4 -
>   drivers/gpu/drm/xe/xe_pmu.c              |  20 +-
>   drivers/gpu/drm/xe/xe_query.c            | 266 ++++++--
>   drivers/gpu/drm/xe/xe_sync.c             |  28 +-
>   drivers/gpu/drm/xe/xe_sync.h             |   2 +-
>   drivers/gpu/drm/xe/xe_vm.c               | 829 ++++++-----------------
>   drivers/gpu/drm/xe/xe_vm.h               |   3 +-
>   drivers/gpu/drm/xe/xe_vm_doc.h           |  14 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c       |   8 +-
>   drivers/gpu/drm/xe/xe_vm_types.h         |  42 +-
>   drivers/gpu/drm/xe/xe_wait_user_fence.c  |  49 +-
>   include/uapi/drm/xe_drm.h                | 516 +++++++-------
>   21 files changed, 915 insertions(+), 1252 deletions(-)
>

