Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297D2C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 09:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C942110E275;
	Wed, 26 Aug 2026 09:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bd7ANfC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784F10E275
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737954; x=1819273954;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WSDJLYlzZL8Uh3QG0QNV93ZNKyE1OPKfsDfu+mKO9xc=;
 b=Bd7ANfC/YWES/iwkQTRO1yOfGvpdqbqF+7+/8hOo/g47zShEk/EYIWEb
 whKOSem6UpIXsHJwg65cCsVdt0oNPr0e1bi6KIAjBX0AvXF3Ew7Aszbg0
 846CdMNnjg5K6u/XUrLix0gqv5NjrgUBW926KRssdDApjZQY6mtM1Pz+C
 cAKiiZZ6FLyS7qlRzPkgp/EZay04X+fcmZpzHIktbeh+RqLaR7JOuCOmV
 4w0Hg9/g50qEShp5ub6ieFNyZ0RkptQb+EM2GLUjLmojqsEsa0arjbnKf
 eCwurL6nEH2+fqSqs1IXh4l8hMHn29NcGE78h/LO2kkMWAmq7sCf3qX6R Q==;
X-CSE-ConnectionGUID: 2igxLljERPyC2sZSMhHiMA==
X-CSE-MsgGUID: nrAiUlF1Rn+WXRe8KxiNOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105593700"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105593700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:34 -0700
X-CSE-ConnectionGUID: ZQRUWc3nRVKDGzTvVWLIUw==
X-CSE-MsgGUID: 1WqE9avZSP2fWz7EGJEkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="265737565"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:52:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 02:52:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 02:52:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 02:52:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnOpUSCoyakfK80YavH9HS82XsTtwch/PLs/1tMaAiBUcb6Yw7iXG6ZowqKoIVuq2BPwYNAT9OHa7gw1AXAL++BEBETlFVjcg7wrKuYjtkqybc6/zQG+HSYK5XmTyjR4vbv1LslFJgfq9oMY/ZmxCZt3QbRCSWFXFlC+Zk94zunNdQD0ggR4tH+BNdOuRD09IbArUGVC9F4KWQ2WjCcnHwUOgJtxqUvlLfOyWigwcu+KlLc08H4DK1DKKZJIGYDpD4zPZczRwayZM6WiHGOsxGBTHexbn8muh14sPsNwgqS1M9Prxnwzd8iuHF3ehUT+Fst3CC94R/d4eb6okaoWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7bJanTNKZTAT3sjaEKqICBvVkDcWuNdHteOnNIT3Q4=;
 b=bMGTDIJOS0QEgAbEInVBq7ZmAxDwJHzVFbnaHlWl4IfbBXVdumv1n8GzjjMmXvClAwjzZiD3XjG2QInh/r3pY3JBht/bjHaeT79YyB8uyctkJHikOirqPXNKJ5mlZdhrZVcQkLUFJKfHeOuyWdZgJ9nJrl62ZSVby5GrTnt20f0qm9eD7e9yf3EbpBBBEIEq8XEoR66R84umXH4rvHtMl26QmqFjOy9d6mmmLsGntStw65XIMnNw9kK31EZgubVH5MqD0Fr7dTvq9jeklPEZ4pNVYpiC0JAfPCsQyjU9+WUEOZ1I1AUZevcsMC9tjEEZPKghamTJoxIutzSV13Ev6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 09:52:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 09:52:30 +0000
Message-ID: <a2bb115f-80aa-480a-b8d4-c6f38c590e85@intel.com>
Date: Wed, 26 Aug 2026 15:22:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: Raag Jadav <raag.jadav@intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-10-raag.jadav@intel.com>
 <a1c9ead7-b3f3-4bfd-9840-df36f3e85d99@intel.com>
 <ao6raGv1PAtsmW4b@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ao6raGv1PAtsmW4b@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4d30da-d524-454c-91e1-08df0357be76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: m9IZfc4BMIUsi1sgng+dI1/GuHhnOt6YFzGcDdIYoPfh2Ld+D8jr2kKZv3JT544KOPdVW4OcY4FgHhg9Gc2G4hLo3pO5GvAJfGv1smk7nCI+s03V7zVhdtRafII85E/V35ntbsTgzuU1UsOrIDyz3p8LlaTVAvLGKwKLsgQpq5hX7tYFLk0JheaTG+iMsyFWkwXNV3I1naakA6/RayQj+guyfNz9QQJbRjip+LKwNJWClUmcw3Ob1tjlCKCWn20u1ykqVCm/6pDw9HWFhA+YKl6P2obV7TaWspAJlwGMacozcDKWBtiwirH/fWH842fhOVe72UGRd667aPjE6+Xntfh70FYL8fLmoJlL9deAqsocOZNsKRE7JwpHphQcVk6/qsMIJQ+6P1bFFLTHTXTX4OV+thhXDtVHFJEg2Hkd60hUglhh+2txtF8HdxP/vznsMIWDOFv2mlftDli1wTSQxayy3bcc9hUFDTMoPnSz8hOynetzuGsJu6o/L+ojZ2TtEmYu0hKRP3RxER1ptZEMi4zXxsugjKywko5wWa0OqBfHbK7JV7ya74OXZjGSpARxz+y2/tV6nCbUXYZsueTTyA4qptDqI/MnhQe6LCfYoU4hGWoir7QqkHGAhGT5aihTudeqq/7DrERam2mynw/OUonzE+32+qN/VGC5dsRdnhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWNSbHU0eGJDQ1JuRkh5dldCYVEvdk9IWXhhWmxrUEZBaHB6M2tQc0hEalAr?=
 =?utf-8?B?R1crRk9UMkZZZFdGcmZybkFVeDlXcEpzRnZ3alFJZVhMbDlHc2VDaWV5YUVT?=
 =?utf-8?B?VWdmU1JjcG5jeGFGU2VRZk1kS01uSk9WTnpQWjBXSkh5c2ZYTDFnQ2FwOU1k?=
 =?utf-8?B?Z3YwNFJERENBeFdERDhyV1dMV3dwUXFhbWYxWGU3d3pQTlNmbW53VFIyNzBT?=
 =?utf-8?B?WjMza1NIZy8ycnBpOXpwcFZaN1d5MHE5ZVJZYXRCbXU4R3NIM3FmMVExZEIr?=
 =?utf-8?B?SGluSjR3S2JmNWRTVVREYlRBTGEyVHhnVXR1UllYTDFMQlgrVGQrOGE0UG1X?=
 =?utf-8?B?cVRrUEhiZW1BVEVGZWJDR01XNHh0VDdGeGYxZmlRWmw5Z3JxOEdDM1VTQ1Vo?=
 =?utf-8?B?amdFN2pRMTUyeGg4QUtYWXRFV050Y0pRMDRmRGE0MjJKWnJrQ3R6c0xhOU1B?=
 =?utf-8?B?TnVNVDMwb09WRkRKL21KS1RhODBPV1pOa1FiMm53UnJGamp5TEY2TUltbmc0?=
 =?utf-8?B?VmVWYThEOWxCQ0NWWWhmdFRsaG5OTWJZZjZFSjI1cHB2ZmRCbTRkOVVuN1Z4?=
 =?utf-8?B?OWxTMTFiZDVNb2tiV0JwbEdlU09VYnlQUXBUdHFvUlBFVGFVT3k3azY1OERN?=
 =?utf-8?B?Q05jR0Y3WWh2Y3lvcGxWMnNCZzB6S3F4S2Q3VTQ1Y29xbkZUOUIybEozSlZ0?=
 =?utf-8?B?cVFYcEM1aTlwWUJkd0JzZmZlWC9aVmpWUkwwRS9XblpZVHlCaGR4WlV0K3oz?=
 =?utf-8?B?ZER4N2hEbWNFdXhuano4UGN0d0FWcFpCTXZaMk1RYnFVSng4bEluOFcwY0t2?=
 =?utf-8?B?alhiT1YwTzNIcGVJNjdwL3dJekdkT0xac0F6Tm1DWEhwQTYzTWhLSjVBUGNW?=
 =?utf-8?B?MTZZRGxBcjRVOUZkY2lENTkvNTlwZmIwdElGbFI2a2NNeHhybVkvek5hN0lU?=
 =?utf-8?B?eDJabXJyYm1paDA5WWdvT04yaDkwR3hiR0l6M1dPMFJiWGlVSGhld0dWQmFZ?=
 =?utf-8?B?TG51U3ZEU1hTUDFRREJiNTJqdkd6OWlwUFVUQ1BlL2dxSHFFNWlNRmpMYkZ1?=
 =?utf-8?B?VXpsUVdmY3lpSllQZ09NQ084WnVzR1ptdVZ4S1Q0RzVZcWVOZ2FaTmYvUG0w?=
 =?utf-8?B?a1M1T01ZbURNb2ZVbEEwL25qZnlsbm9qejRhYU1zS25JK3pzWjRPUVl0TlJH?=
 =?utf-8?B?TGFualV0Ritnd1EvZk95eTJlRmdUcWdBODI1aFp0dnNKbHB3bnowaDZXa1dJ?=
 =?utf-8?B?Q0hJQ1pzVmVGMFdHQ2FmUU5lM1pCTDhRWmQxUlVWQ0IyWkRRWWtYU3c1ZFgr?=
 =?utf-8?B?c3RwQVpDT1FEQjJPSkNOUnBISWUwVWZ3NjIzRjE1WDF4SU9wVElVV05MdWhj?=
 =?utf-8?B?SWZjZUZiSkJYUUw3WmF2UmkzRXZoa09jYm0yaXdJQm04Uk9PRHZTUWg2NHNX?=
 =?utf-8?B?NFVVMjRzQVA4VGhyb1B3bnhlb0JwbFhtdEwyMXFSRkFkRGxveTg3bzJwWGVU?=
 =?utf-8?B?UysydGFxa0g1cDNXcTVINGl2U29GcEZnRzVTUzJ2NkUvY3A5N0g0YlE3MVFF?=
 =?utf-8?B?dXNNd2JQSUdCTFJWVitaSE8wTVpra2hPYlViblQzTVZhUnFkVkg4Q0NadEFF?=
 =?utf-8?B?ZlBmWDB2a3FWL3FvOUNKUFF6YmpBRWRrL05Xci9CS200OUpjb3JzQSt2U0hD?=
 =?utf-8?B?TkF6TnQxM08vQmFSUDhydlM0RzRXRXV3MkljV2RCTFY3WUI3T2t6OG91WGRm?=
 =?utf-8?B?YkQ4d3g3SG1OdURkMTF4anJheVYrTjNCbHVMQ3N3TGZvbnZISzgvMG85YjJi?=
 =?utf-8?B?dXFPRmthdWdkZ2Y1UHFwSEs1VUk0RTJnMWdoVS9iaWwzOUdNcm9sV3NxQXl1?=
 =?utf-8?B?dHBxNStUYS9QRlJVOXlNbzRvcHpUSmVQckV6QWxYd1hZRXV5d0cvQ1Vsc3lH?=
 =?utf-8?B?R0RKRitGM0dOcXVzWmtlM3ZQU2JFMHhmRDNzamhmMnlrYzZOVEtOTnQ4N3VG?=
 =?utf-8?B?Vnc2R3duRC9WTVdCTlZFb2VLcTRqWUpVaFRGUkwwOEFoZWROeXZLYkRPakRL?=
 =?utf-8?B?d0hFd1R0SERWNG1NaDcvOEZ2bVcxendFMVU2SkJpUHpQbWJYUkVadjJZU0ZK?=
 =?utf-8?B?U2FPN3F6dDVCVFBzRUwvaVh4N0NvREhKR0gyUzJ4K213KzBsc2ZIM1VZRm93?=
 =?utf-8?B?K0xEM2V0QVAzZ0J4eXhabHdZVS84S1JFYnNQN1F2VmlOMGlKWDZ6YnRUZzFj?=
 =?utf-8?B?dkN1NUlwRDAwMnliT1NHcUdwMXkxUUx3QStLMi9rdGdSYkJ1R1g4a3NFNFFH?=
 =?utf-8?B?bmlqVnQwRUFBMUdMT2hlVnlhWmh2MGNBUitUcVNHWFFXZ2IvMkx1Zz09?=
X-Exchange-RoutingPolicyChecked: EkHfyYOCV2P5sLA7/n+muDkh3BaD9zMT6JmTrzQHl8sO6H6fALLtBtfK0HEr/B9EAgXY+P604qLRSmhEyQxuCsCdN4VJ+wByufWAlnBGAbe7QpYaMZmUjnwrmEfJ/jqPnN93NMh8UHdwWKh4wlk7td94eGbXv+dvnQK6+D0eOv/3Q22LkimXLERMyW86tcLknxF7CoORidJJPdaQl7oUN4qUhED5o9jUIq9OitemaM+x8fiDgKXcCX3DxFXwXdWegLrjCkbH/szaZc8gxsqSvMsdWL1+viJG/LAFBqJYXE3DPDVuVgutTosxeQSR8r7UQ3491oPMmajM+wdhV+AbTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4d30da-d524-454c-91e1-08df0357be76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:52:30.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooDDHwRMVvv3AjcWT649gPCffeGhmqAEAyKs23/rHQ62C8m9iAIOE5SjEYrz4MLFZZiy6VJ6g5WYGYO6rVof9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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


On 26-08-2026 14:31, Raag Jadav wrote:
> On Tue, Aug 25, 2026 at 12:06:32PM +0200, Laguna, Lukasz wrote:
>> On 8/21/2026 13:23, Raag Jadav wrote:
>>> With bare minimum pieces in place, we can finally introduce PCIe Function
>>> Level Reset (FLR) support which re-initializes hardware state without the
>>> need for reloading the driver from userspace. All VRAM contents are lost
>>> along with hardware state and driver takes care of recreating the required
>>> kernel bos as part of re-initialization, but user still needs to recreate
>>> user bos and reload context after PCIe FLR.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    v2: Spell out Function Level Reset (Jani)
>>>    v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>>    v6: Add PCIe FLR documentation (Daniele)
>>>    v7: Refine PCIe FLR documentation (Daniele)
>>>        Introduce xe_pci_reset_skip() helper (Lukasz)
>>>    v9: Add 'Xe' prefix to document title (Rodrigo)
>>> v10: Update documentation to include PCI Error Handling (Lukasz)
>>>        Maintain wedged reference on FLR failure (Lukasz)
>>> ---
>>>    drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>    drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
>>>    2 files changed, 131 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 7be3f15bf7a0..8cbb5b747710 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -518,6 +518,9 @@ struct xe_device {
>>>    	/** @pxp: Encapsulate Protected Xe Path support */
>>>    	struct xe_pxp *pxp;
>>> +	/** @flr_prepared: Prepared for function-reset */
>>> +	bool flr_prepared;
>>> +
>>>    	/** @needs_flr_on_fini: requests function-reset on fini */
>>>    	bool needs_flr_on_fini;
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>>> index 48466d726eae..81c4e55fae8f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>> @@ -12,8 +12,55 @@
>>>    #include "xe_pm.h"
>>>    #include "xe_printk.h"
>>>    #include "xe_ras.h"
>>> +#include "xe_sriov_pf_helpers.h"
>>>    #include "xe_survivability_mode.h"
>>> +/**
>>> + * DOC: Xe PCI Error Handling
>>> + *
>>> + * Xe driver registers PCI callbacks which are called by PCI core in case of
>>> + * bus errors or resets.
>>> + *
>>> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
>>> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
>>> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
>>> + * hardware needs a full re-initialization. The way Xe driver handles it, is
>>> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
>>> + *
>>> + * Prepare phase:
>>> + *
>>> + * - Temporarily wedge the device to prevent userspace access
>>> + * - Kill exec queues which signals all fences and frees in-flight jobs
>>> + * - Stop the scheduler and all submissions to GuC
>>> + * - The fact that FLR is needed is because hardware could be in corrupted state
>>> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
>>> + *   contents
>>> + * - Remove all memory mappings since VRAM contents will be lost
>>> + *
>>> + * Re-initialization phase:
>>> + *
>>> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
>>> + * - Restore kernel queues which were killed in prepare phase
>>> + * - Reload all uC firmwares
>>> + * - Bring up all hardware units
>>> + * - Unwedge the device to allow userspace access
>>> + *
>>> + * Since VRAM contents are lost, the user is expected to recreate user memory
>>> + * and reload context.
>>> + *
>>> + * TODO: Reuse FLR callbacks for bus error handling.
>>> + *
>>> + * Current implementation is only limited to re-initializing GT. This needs to
>>> + * be extended for a lot of components listed below.
>>> + *
>>> + * - Proper re-initialization of GSC and PXP for integrated platforms
>>> + * - SR-IOV cases which need PF and VF synchronization
>>> + * - Re-initialization of all child devices registered by Xe
>>> + * - Prepare existing xe_device_wedged() users for temporary wedging
>>> + * - MM corner cases
>>> + * - Display
>>> + */
>>> +
>>>    static void prepare_device_for_reset(struct pci_dev *pdev)
>>>    {
>>>    	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> @@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>>>    	xe_device_wedged_put(xe);
>>>    }
>>> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
>>> +{
Add a TODO
>>> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>>> +}
>>> +
>>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>>> +{
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	int err;
>>> +
>>> +	err = xe_pci_reset_skip(xe);
>>> +	if (err) {
>>> +		xe_err(xe, "PCIe FLR not supported\n");
Nit: Can the log be just PCIe reset
>>> +		goto wedge;
>> Looks like we always take the reference, so can't we do it at the top of
>> this function and only return here?
> Because we check for pre-existing ref below, in that case something else
> is already wrong and it's pointless to move forward. We take a local ref
> anyway because PCI core doesn't distinguish failure cases and calls
> ->reset_done() regardless, so we have to compensate for it by maintaining
> the ref across calls (which we later drop in ->reset_done()).

  If it is not supported why not just return in both function calls? Why 
proceed?

Riana

>
> Raag
>
>>> +	}
>>> +
>>> +	err = xe_device_wedged(xe);
>>> +	if (err)
>>> +		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
>>> +
>>> +wedge:
>>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>>> +	xe_device_wedged_get(xe);
>>> +	if (err)
>>> +		return;
>>> +
>>> +	/*
>>> +	 * The hardware could be in corrupted state and access unreliable, but we try to
>>> +	 * update data structures and cleanup any pending work to avoid side effects during
>>> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
>>> +	 */
>>> +	err = xe_device_suspend(xe, true);
>>> +	if (err) {
>>> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
>>> +		return;
>>> +	}
>>> +
>>> +	xe->flr_prepared = true;
>>> +	xe_info(xe, "Prepared for PCIe FLR\n");
>>> +}
>>> +
>>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>>> +{
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	int err;
>>> +
>>> +	err = xe_pci_reset_skip(xe);
>>> +	if (err)
>>> +		goto out;
>>> +
>>> +	if (!xe->flr_prepared)
>>> +		goto out;
>>> +
>>> +	/* Unprepare early in case we fail */
>>> +	xe->flr_prepared = false;
>>> +
>>> +	/*
>>> +	 * We already have the data structures intact, so try to re-initialize the device.
>>> +	 * This will be similar to system resume flow, except we'll also need to recreate
>>> +	 * kernel bos and restore kernel queues.
>>> +	 */
>>> +	err = xe_device_resume(xe, true);
>>> +	if (err) {
>>> +		xe_err(xe, "Re-initialization failed\n");
>>> +		goto out;
>>> +	}
>>> +
>>> +	/* Unwedge to allow userspace access */
>>> +	xe_device_wedged_put(xe);
>>> +	xe_info(xe, "Re-initialization success\n");
>>> +
>>> +	return;
>>> +out:
>>> +	/* Most likely the device is unusable and there's nothing we can do about it */
>>> +	xe_device_declare_wedged(xe);
>>> +	/* Drop local reference */
>>> +	xe_device_wedged_put(xe);
>>> +}
>>> +
>>>    const struct pci_error_handlers xe_pci_error_handlers = {
>>>    	.error_detected	= xe_pci_error_detected,
>>>    	.mmio_enabled	= xe_pci_error_mmio_enabled,
>>>    	.slot_reset	= xe_pci_error_slot_reset,
>>>    	.resume		= xe_pci_error_resume,
>>> +	.reset_prepare	= xe_pci_reset_prepare,
>>> +	.reset_done	= xe_pci_reset_done,
>>>    };
