Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F62ED2F7D7
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 23:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4692910E11C;
	Wed, 16 Oct 2024 23:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhTtswoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46A010E11C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 23:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729121069; x=1760657069;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=uA82qkhndf4yO5hRmk3CFkfDvzMRF6x3W8PPCeMSSdk=;
 b=VhTtswoBt0YR22JCk6RKLlAjSFFckWLhNFGVNyt409pmcmA3VA0btyKe
 0xjW+J1lphrfNMLlVNmW12FxJkFgeoDIzXOnZg2kUUEMcj0mqtDbTTtUp
 8z27qq2popEj3b9GIQ5Ao7YH4D3DuuVHfNtVFS1xqnU2Hw6nZc0PgspuU
 1KlCrnsj1ro0rewRcQvuqV+uwWDP2niM3m46rM5qC5sWlHFLcYdu3GIDT
 1D8G80XHFIctYARPmJ0ThXt8fXzVbgDQvKbAAg2MFQPXy0tJ8nV7hiy+v
 YrXHoIqSz4FFFChy35e9Xv6nfsl6Js639/5ddsRL3JPW8leHmbRF1xyeJ A==;
X-CSE-ConnectionGUID: LTZn7Zm8SB+vzBzoRjCLQg==
X-CSE-MsgGUID: 1A1FgmwZSgGm0EvowiB27g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39173371"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208,217";a="39173371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 16:24:28 -0700
X-CSE-ConnectionGUID: 3U/i1FLcRVqv1lcV4rOD1g==
X-CSE-MsgGUID: 5bX8CaO7RHO7jlH7XaCVJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208,217";a="77990675"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 16:24:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 16:24:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 16:24:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 16:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSzxs7AWc08506OproVregyQYbT0Gn4VCieg08gC7K4XJdipMX/R2cPbBp4q/UWfwlL4rGxnuNKnSOyMGcU+HsNszOyZkhYiqzqQ77NLTQHet8VD4LuojXwaedgAOz1fO0J49Vibxtrm5tf3gKRg7F3rgqSgvQB9oMqDlDSCWvXzXy5X90Iz5tNTZvrXvBFJJWuYEvCnOkvD/SE9Rhc/ShJBi06VPCz7zvm2Wa0e3LIeBljtmW0sqEXgQpqR1SS2SPrhZHcFz6AYzY3b5Wdqxtc0ivOx1Ws0qz+BikbctqFg5EzCSodIAsR7YTISWcpRzps9FaacYqaqyCtDe266Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SAxUZN3B1Tq8m5FbMAUm2xCuFK4esds1IjW+iMTn2g=;
 b=wM5rFEvdCYwvUzd+2RYuLdi86brZglMvYQ3Hv5YSeE2BxEIVyZKqIuDUGQbmey4LNdinIzpwQsElImiPXi3v1EGI2Vx1l9uQWFzBeTQK37dn2C4beI2hpt5Mf/d3ltOrjXpOQ4jookMpdh9yySfS/xQGvb/jUSKwdZkeYUcq9ZZgn+JiNxjuDjso5UjYibAzaIZ09b9+bE+dyLI00o6t+Ls3OkK7R6onuKcnNAzs3/W3FDA7pjIEG9WqxCeorr4OcohHYkAMa/ab0p70Kk3+SCC/gMxVEeCHw541JdFYYIkVlc+zavjr2OBIKRIU3geBT/YW3TIxw8L2V4TW75yWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 23:24:08 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 23:24:06 +0000
Content-Type: multipart/alternative;
 boundary="------------Zn3yKE0ChX070Z9MorGAW9hB"
Message-ID: <12baa336-c892-4858-b682-17b6f32027e4@intel.com>
Date: Wed, 16 Oct 2024 16:24:04 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/ptl=3A_Ap?=
 =?UTF-8?Q?ply_Wa=5F14022866841?=
To: <intel-xe@lists.freedesktop.org>
References: <20241015234428.2004825-1-vinay.belgaumkar@intel.com>
 <172908076613.1273660.16054928906213682158@2413ebb6fbb6>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <172908076613.1273660.16054928906213682158@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:74::25) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 905fddff-7bac-4098-4024-08dcee39a107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Lzh0NVcyaXlvamVYQVFvZmFKZnRsL3NxcDVQYTBLcFJDbnp3Nzd6WHM4ejVW?=
 =?utf-8?B?ZXpoK2Qvd1F1S1lKR1QrM2x6dUtvZ0o2eUZIbUdqWStyTkpDU3FsVnVkeDZx?=
 =?utf-8?B?RmZJQVIxbGF0US9tY0l6RzVYSVptc2JuZEVGVzdHSFBuVGFmRi83emlqNTBH?=
 =?utf-8?B?ZExYNG5SZmEzaVVaTGd6MEpqZURCM3VNTnFXSmNVUFB0UHZ6Wmw0Z3M0eUNp?=
 =?utf-8?B?NFd3b0p0WGV4Mm9NQ29VSjVpZDlqanZJaWI0dm56SGJPM0VYS0NzS2ZucWRh?=
 =?utf-8?B?Q3FUQkRKeFJKUUVzYUNOY3ZYTXpOMmk4OHA0MGY4di9ZRThpRUJVWTc3L2pG?=
 =?utf-8?B?WXJaSGlXTHdlaGVKUXp0YXlTc09ET09najl3UUFlSG5nTmJOZVJwR20wYmNp?=
 =?utf-8?B?Nk5GTTZ3dmg2dm16S0kxTTlFUW5MSVAyUmFCcCtJbmROekY3eGoySlBFbFJ4?=
 =?utf-8?B?NUJ1U0RES2VtdjNpOVZibGc3MWVIMUNxQzAvRTlFNnk3d0tDV1pxSThBQjM1?=
 =?utf-8?B?SWY0TkZnMytWN2xNNkRoQWlDL2pVOGUzd3U4RVExWTllRi94bkM1NEdGZVJy?=
 =?utf-8?B?L281dmMxbUdLaUR0YjBud0kwTU5zb3hyUnFtR29YcEJjSXNtQzZ1Sm5uUzNQ?=
 =?utf-8?B?Z2RlaEU2eDVoUzgyQjdCTlZ1bWJQdGs5V1BVMS9wYUZtWCt2Y2tNMzJMVHVE?=
 =?utf-8?B?cG5QMitEMWdYeTJmOEFLbEMyWDdtdFYzMklmdHRRdWJhQTVab1dnZzIveDVD?=
 =?utf-8?B?WitnOVdFNHRzL2pBQStTODgyTlZqdUovdUdtVVZ1Wk8xdHpXaHVra1U1MDBo?=
 =?utf-8?B?dnE4WS9KYU1NT2RpaE1OTUJWNmdtVmJxUUFVT0k5NVZCTmpqZTlWUVJmait1?=
 =?utf-8?B?VjJnL3ZoVTI4ZE56dHBJczVwdEpWNDdZRytlZlV3SGRlUkhhTEtXcnRqajM5?=
 =?utf-8?B?YkhDWEVXTVhaN1BTa1hVMVVJY0RIWDkzNDdhZVR6Y0JoREt5Tjl4MXVGZHQy?=
 =?utf-8?B?YU52VDBhdWtLTEdyZ3pCVmdOSmIrRk5GSWZ1WTNWQVN2RUQxUTZnVXZweVNw?=
 =?utf-8?B?RUpaV29ndkJWSVJBd1dycVJNdWdodGhHSXpDQURZNUh0dHFmS0xvejdva0E5?=
 =?utf-8?B?WnNmb21DNitFWDl0a2lLQXNqcXBRU3R0cjdOOGhwL2NuZzh2aFZEZkh6Q2lz?=
 =?utf-8?B?YTA5WGdiOU13cXVaS3BqRlJlaForZDNHU3R5OGorR0t1R01kZmpCWVlWM2VC?=
 =?utf-8?B?ckMwNHc3dVNLNk5JRnJOZ3BQeXE4WlBxbEF3dFNFZEZoOVRXcDBOMlFWZEpU?=
 =?utf-8?B?WERjbUZpL0E3YXBzQlQydng4WGs2N0ROdHBpMWJaYWc4Q0dYQ1h1bC81SzNC?=
 =?utf-8?B?RFhyRWdTSnFzOUxCZXBlNk40THp4YTh0MllQU2ZzYWhFRGVDVUU0cjhTUVAx?=
 =?utf-8?B?cElJVGpyZTBFemdvNEtyYldEUUlGcDlWakZ0Z2dyWHJvL0FwSDUvVzBHMDVU?=
 =?utf-8?B?YVkvYzRiRnhabkZZa2dYT1IzM0NJSEdXdzBsRUoyY011ZjhoTXk3UHVkR2Qy?=
 =?utf-8?B?UEJBdlFpc1h5TnpTVm1WMkFGWWxwKzFWa2xFQSsvWnFBV2h2RG0zNTVIYmFJ?=
 =?utf-8?B?ZmtEWkpjbitmbVdVY0xSQmlEQVlLWHFISXNlNWJ0UW5jQ01RUjBhUGNJZ0Rt?=
 =?utf-8?B?dDhRNHJSZjBkRmtWRy9icUhMS2NYRzVTdFJZb2hHOVBuZ2MwdmVRbWdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNSWUc2azV2enpkWk4zeWhLYzlKaTZxWTZHaDdYaUVmOEF4MytjMjkvY0tJ?=
 =?utf-8?B?ZUhMV3d0MXdDN0FYN0paQ3IvTTc5SG1ZN0ZwVWNiRndEWmJ1UFRhMS9qeDcw?=
 =?utf-8?B?dUY0R1NCY01sOS9xQVYxWHlFbWR1S1BTOXNXS2Q3c1BXZFcySXJzekJ6c1BJ?=
 =?utf-8?B?RnNzQ290akRFakljSE9MclVYQmdmSE9HVXM3bDBGWXNJRmp4NzlnVEt5Unc4?=
 =?utf-8?B?SldMRXJjSXV0NUExaTVUOXo4dXRZZHRjRmQyOXpSY2hIOGd0dHN2eENuK1pQ?=
 =?utf-8?B?ZFQ0UThkaVBhQW5hcHcrMFlyU3VaaHEranIxbUFvaGV5cWlmaWgvMHdNSDlk?=
 =?utf-8?B?enBoYmlIOUZINzhEUUlEcXlqQU1qclZpSEFKKzBIeXoyS0pWaWFBSjlWRFF1?=
 =?utf-8?B?V0dzSkw1SFpVTEltTlRidDU5eU5LMlBXc3YxaExKV3pOWldsSGdwN3MxWnUx?=
 =?utf-8?B?VnF4RmMvUXllVWxpQ3RDTjBVUFVPYldwMDNublhCUm8wcXlqOGpILzl1U096?=
 =?utf-8?B?WXFBZlVOOHJydlliazhwc0M3ZzVjNVdJK1VCeDZLNUV2WnRMQjRkT2s4aU1F?=
 =?utf-8?B?UFYxdStUMXcyL2tOQ1lHejVHZnVLQWgzNWFveHYzTlh1OWxMdXVFMnBScUgr?=
 =?utf-8?B?VVNyZ0xqNGhKTHY3ZDNROG4wMFpaMmZLUER3MUpPSTltU1ljYy9rMXUrY2dk?=
 =?utf-8?B?d3hQd2lXNjRYYkllS2lsNWs1ZmZlUk5WT3UwVVUwMlN6dFMvNTlueEtqbmJO?=
 =?utf-8?B?cHNnMFRlRnNpTU4zNGpnTkFRVVhRM0h3czRUMlhXWUR6RHJhbTFWbUZhYzQv?=
 =?utf-8?B?VXVJcWNadGpoNnNmcnlQZU9pU1ovRSsxbmN3dXYwN000anhWY0JCcXROMTFQ?=
 =?utf-8?B?N3lyOEJ5Z3Y1Nmc1QUN4bzU0b0JoMzh6eWM5MDQ4M1BaUWdmOHNXVTBteE1L?=
 =?utf-8?B?VXI1ZER6cUdxM0wxSWoySnhVY0VQWnp5Z3ZSZkRXVytpWWJIdzRYcTNBd3ha?=
 =?utf-8?B?ek1tQzNlRWdxbU5USFVRclZKVzJ6UmxXbjZqSSsrV09OOS9uM29IV2dLbHpR?=
 =?utf-8?B?Z0VDWVByY1paa2VtaG1rK2tHV3o4Z01ZS3kvVEtxSXR6dW1JT2dkRGdJeGt2?=
 =?utf-8?B?VXhMZGdSV2hZUDQvNjl1VjFGZFpyL1JiUmpmbmJIQVEzNldCWFBCM0hnZUFT?=
 =?utf-8?B?WTk0VnhHM1pJRGhBRUx3NjgzcVZjR1MyckpTbzZqbTZjZFBLNGw2cmQxcHdJ?=
 =?utf-8?B?WmxON2w2YXl3SUJiWGV4NTh6Qkp4TVkyV2tJRjg5Q05lSGhBTENCWlpxNUY5?=
 =?utf-8?B?cVhCb1JjaUo4ZHJOMzVLa1ZqLzFvQzhKbzhxeWhtS2NJUytOcGlYTC9YdExi?=
 =?utf-8?B?U1pwOWt6RWZzUVN4Z1FGdFFQYzF4SUtkbnhnVlJWTjFQRGc5N0NvM3hYTC9q?=
 =?utf-8?B?SzdEQ1hRRExRM1A2cXRvQWx3aWVuYm53M0MzT0tqRmtqM1RtemJ6UUpVcno4?=
 =?utf-8?B?clhiVnRyaEx0Q1BTKzViK0l1TDhMWVdETmZMc0dmR2psWG0yY1ViL1llcjRK?=
 =?utf-8?B?NUN5a0VyeWlycUZpRyszS2xkRDBlMUNNc2JDb0FXdEN6V01DUU9oQWNEZEZF?=
 =?utf-8?B?VzdmUXJjRmEzbGpXckhKcmQxdFQ2bXh3KytTZ0RLV0hJT1RnZVhCa2NoQ3ND?=
 =?utf-8?B?R00rNVpHY2RkZm5aekUwNGdWaE9jYXEyZ0xyR1pWMFZJaXVrVDJOWGQzbkJG?=
 =?utf-8?B?c21OdTJRcDcydjdZN2JoU01kVDlzQmE3cnowdm1UQ0tqMFJZeEJWcnBsQkp4?=
 =?utf-8?B?cnRRK0FZMnpOeTlkV2dIc1UvbGEvTUR1MWErejgrdlJuMkpBeE1BLzRvdDhy?=
 =?utf-8?B?WDYySmRFSFh4OTIwc01uWGZPTEI2V2M4clBiSW5tVUpXSWc0QVFBZVdtM0tw?=
 =?utf-8?B?UVpvM053bE44U1BQM2hOd29Fd3BLWHNsajNFQk13Z2R6SmRwcVRaUmozUkVX?=
 =?utf-8?B?bHRSUEVSTjg3Y2hVS2pFWWhyM2ZhWWZSVWNWcWVXbHhRdGFsa3BCbUU5Z051?=
 =?utf-8?B?K0lkbitza21VT0dxdXN6cERyTWhKbjdhRGw0R2l0eTlCSHdDSkgxR3FxSU9a?=
 =?utf-8?B?RnkrWlJLUDFEUjdXSFFzUVNtRTNUbjgwV1FMNGVZUGEza211czA1NUtTSjhs?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 905fddff-7bac-4098-4024-08dcee39a107
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 23:24:06.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsDrL3F7uHg0vnyA6HuS/xvtiNcn0GPl036GieIwDd3jBH5/3BCqEQF4Pk4C2y54/T+aEeSd+icGOXHouPHh7mA+k1TP7lodsCGZj5vo0m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
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

--------------Zn3yKE0ChX070Z9MorGAW9hB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/16/2024 5:12 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/ptl: Apply Wa_14022866841
> *URL:* 	https://patchwork.freedesktop.org/series/140029/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full ->
>   xe-pw-140029v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-140029v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140029v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-140029v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html>
>         +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html>
>  *
>
>     igt@kms_vblank@ts-continuation-modeset-rpm:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_vblank@ts-continuation-modeset-rpm.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm.html>
>         +1 other test dmesg-warn
>  *
>
>     igt@xe_oa@non-privileged-access-vaddr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_oa@non-privileged-access-vaddr.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@xe_oa@non-privileged-access-vaddr.html>
>
failures are unrelated to this patch since it only affects PTL.

Thanks,

Vinay.

>  *
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (Intel XE#660
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (Intel XE#660
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html>
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html>
>         +3 other tests incomplete
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html>
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         +8 other tests skip
>  *
>
>     igt@kms_plane_cursor@primary:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_plane_cursor@primary.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_plane_cursor@primary.html>
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html>
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#2329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-140029v1_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +1
>         other test skip
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         (Intel XE#1701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-180:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#1428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2
>         other tests dmesg-fail
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +8
>         other tests fail
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +8
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +2
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@vga-edid-read:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_chamelium_edid@vga-edid-read.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-fast:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-fast:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x42:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508> /
>         Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@dpms-vs-vblank-race:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_flip@dpms-vs-vblank-race.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip@dpms-vs-vblank-race.html>
>         (Intel XE#3097
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +8
>         other tests fail
>  *
>
>     igt@kms_flip@nonexisting-fb-interruptible:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_flip@nonexisting-fb-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_flip@nonexisting-fb-interruptible.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +8 other tests skip
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         (Intel XE#2957
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +13
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +26
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +25
>         other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-4k:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_hdmi_inject@inject-4k.html>
>         (Intel XE#1470
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
>  *
>
>     igt@kms_invalid_mode@clock-too-high:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html>
>         (Intel XE#1450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> /
>         Intel XE#2568
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568> /
>         Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html>
>         (Intel XE#1450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450>) +1
>         other test skip
>  *
>
>     igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html>
>         (Intel XE#1450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> /
>         Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-adlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html>
>         (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>
>       o shard-adlp: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html>
>         (Intel XE#2078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078>) +1
>         other test warn
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_lowres@tiling-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +5
>         other tests incomplete
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +18 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#2864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864> /
>         Intel XE#2990
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes@plane-68:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-68.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#3085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3085>)
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html>
>         (Intel XE#2625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>)
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_pm_rpm@universal-planes-dpms.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr@fbc-pr-cursor-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-blt.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +11
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-basic:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-basic@edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@fbc-psr2-basic@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_psr@fbc-psr2-basic@edp-1.html>
>         (Intel XE#1649
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +1
>         other test fail
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-move:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html>
>         (Intel XE#2948
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1
>         other test fail
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +2
>         other tests fail
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1
>         other test fail
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +1
>         other test fail
>  *
>
>     igt@kms_vrr@lobf@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_vrr@lobf@pipe-a-edp-1.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +1
>         other test fail
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +2
>         other tests skip
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x369:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eudebug@basic-connect:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@xe_eudebug@basic-connect.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +7
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-exec-queues:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@xe_eudebug@basic-exec-queues.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@xe_eudebug@basic-vms.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_compute_mode@lr-mode-workload:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html>
>         (Intel XE#2125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125>)
>  *
>
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#2754
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>)
>  *
>
>     igt@xe_exec_compute_mode@once-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate.html>
>         (Intel XE#2754
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>)
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#2105
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>  *
>
>     igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html>
>         (Intel XE#1169
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>)
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +4
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_eudebug:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html>
>         (Intel XE#2833
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>  *
>
>     igt@xe_oa@invalid-remove-userspace-config:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_oa@invalid-remove-userspace-config.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +2
>         other tests skip
>  *
>
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         (Intel XE#1694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@xe_pm@s4-basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@xe_pm@s4-basic.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html>
>         +2 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-0.html>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-0.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-0.html>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         +2 other tests pass
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#2436
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_color@ctm-0-75:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_color@ctm-0-75.html>
>         (Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_color@ctm-0-75.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#2791
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html>
>         +7 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html>
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@d-dp4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html>
>  *
>
>     igt@kms_invalid_mode@uint-max-clock:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_invalid_mode@uint-max-clock.html>
>         +7 other tests pass
>  *
>
>     igt@kms_invalid_mode@zero-hdisplay:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_invalid_mode@zero-hdisplay.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-8/igt@kms_invalid_mode@zero-hdisplay.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-plane-1:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html>
>         +6 other tests pass
>  *
>
>     igt@kms_plane_cursor@overlay:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_plane_cursor@overlay.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_plane_cursor@overlay.html>
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_plane_cursor@overlay.html>
>         (Intel XE#3109
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3109>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@kms_plane_cursor@overlay.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_cursor@primary:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary.html>
>         (Intel XE#1471
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471> /
>         Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_plane_cursor@primary.html>
>  *
>
>     igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html>
>  *
>
>     igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html>
>         (Intel XE#1471
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html>
>         +5 other tests pass
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> /
>         Intel XE#2864
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html>
>         (Intel XE#2042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms@plane-68:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html>
>         (Intel XE#2932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes@plane-59:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-59.html>
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_vrr@flip-basic.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_vrr@flip-basic.html>
>         +1 other test pass
>  *
>
>     igt@xe_create@create-contexts:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@xe_create@create-contexts.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_create@create-contexts.html>
>         +6 other tests pass
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html>
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#2472
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@xe_evict@evict-threads-large.html>
>  *
>
>     igt@xe_exec_basic@no-exec-null-defer-mmap:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@xe_exec_basic@no-exec-null-defer-mmap.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@xe_exec_basic@no-exec-null-defer-mmap.html>
>         +1 other test pass
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@xe_exec_basic@no-exec-null-defer-mmap.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_exec_basic@no-exec-null-defer-mmap.html>
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html>
>         +17 other tests pass
>  *
>
>     igt@xe_oa@mmio-triggered-reports:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html>
>         (Intel XE#2249
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-7/igt@xe_oa@mmio-triggered-reports.html>
>         +1 other test pass
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html>
>         (Intel XE#2249
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html>
>  *
>
>     igt@xe_oa@oa-regs-whitelisted:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html>
>         (Intel XE#2514
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html>
>         +1 other test pass
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted.html>
>         (Intel XE#2514
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html>
>  *
>
>     igt@xe_pm@d3hot-multiple-execs:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@xe_pm@d3hot-multiple-execs.html>
>  *
>
>     igt@xe_pm@s2idle-multiple-execs:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html>
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@xe_pm@s4-mocs.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_flip@2x-plain-flip-interruptible:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_plane@pixel-format.html>
>         (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> /
>         Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_plane@pixel-format.html>
>         (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035>)
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-psr2-basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_psr@fbc-psr2-basic.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_psr@pr-primary-page-flip:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-extended-discovery:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1000
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-exec-after:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_pm@s3-exec-after.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_pm@s3-exec-after.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8073 -> IGT_8074
>   * Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823 ->
>     xe-pw-140029v1
>
> IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8074: a886e0ad97832dc2ba9b85d35bca22e667c15105 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823: 
> 01c7b2c084e5c84313f382734c10945b9aa49823
> xe-pw-140029v1: 140029v1
>
--------------Zn3yKE0ChX070Z9MorGAW9hB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/16/2024 5:12 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172908076613.1273660.16054928906213682158@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/ptl: Apply Wa_14022866841</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/140029/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140029/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full -&gt;
        xe-pw-140029v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-140029v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-140029v1_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-140029v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_vblank@ts-continuation-modeset-rpm.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm.html" moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-privileged-access-vaddr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_oa@non-privileged-access-vaddr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@xe_oa@non-privileged-access-vaddr.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>failures are unrelated to this patch since it only affects PTL.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type="cite" cite="mid:172908076613.1273660.16054928906213682158@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660" moz-do-not-send="true">Intel XE#660</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a></li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660" moz-do-not-send="true">Intel XE#660</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430" moz-do-not-send="true">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">DMESG-FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html" moz-do-not-send="true">INCOMPLETE</a> +3 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> +8 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329" moz-do-not-send="true">Intel XE#2329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-140029v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701" moz-do-not-send="true">Intel XE#1701</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-180.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428" moz-do-not-send="true">Intel XE#1428</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send="true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) +8 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669" moz-do-not-send="true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@vga-edid-read:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_chamelium_edid@vga-edid-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-fast:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953" moz-do-not-send="true">Intel XE#2953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703" moz-do-not-send="true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137" moz-do-not-send="true">Intel XE#1137</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send="true">Intel XE#310</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@dpms-vs-vblank-race:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_flip@dpms-vs-vblank-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip@dpms-vs-vblank-race.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3097" moz-do-not-send="true">Intel XE#3097</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +8 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_flip@nonexisting-fb-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_flip@nonexisting-fb-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957" moz-do-not-send="true">Intel XE#2957</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469" moz-do-not-send="true">Intel XE#1469</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-4k:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_hdmi_inject@inject-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470" moz-do-not-send="true">Intel XE#1470</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450" moz-do-not-send="true">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568" moz-do-not-send="true">Intel XE#2568</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450" moz-do-not-send="true">Intel XE#1450</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450" moz-do-not-send="true">Intel XE#1450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send="true">Intel XE#2934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send="true">Intel XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078" moz-do-not-send="true">Intel XE#2078</a>) +1 other test
              warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) +5 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718" moz-do-not-send="true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_pm_rpm@legacy-planes.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864" moz-do-not-send="true">Intel XE#2864</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990" moz-do-not-send="true">Intel XE#2990</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes@plane-68:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@kms_pm_rpm@legacy-planes@plane-68.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3085" moz-do-not-send="true">Intel XE#3085</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-modeset:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625" moz-do-not-send="true">Intel XE#2625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_pm_rpm@universal-planes-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@fbc-psr2-basic@edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_psr@fbc-psr2-basic@edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649" moz-do-not-send="true">Intel XE#1649</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948" moz-do-not-send="true">Intel XE#2948</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883" moz-do-not-send="true">Intel XE#2883</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send="true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330" moz-do-not-send="true">Intel XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send="true">Intel XE#2443</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_vrr@lobf@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send="true">Intel XE#2443</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0x369.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-connect:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@xe_eudebug@basic-connect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-exec-queues:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@xe_eudebug@basic-exec-queues.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@xe_eudebug@basic-vms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send="true">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125" moz-do-not-send="true">Intel XE#2125</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754" moz-do-not-send="true">Intel XE#2754</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754" moz-do-not-send="true">Intel XE#2754</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105" moz-do-not-send="true">Intel XE#2105</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169" moz-do-not-send="true">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356" moz-do-not-send="true">Intel XE#1356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_eudebug:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833" moz-do-not-send="true">Intel XE#2833</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-remove-userspace-config:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_oa@invalid-remove-userspace-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-send="true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694" moz-do-not-send="true">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@xe_pm@s4-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@xe_pm@s4-basic.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-0.html" moz-do-not-send="true">PASS</a></li>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" moz-do-not-send="true">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436" moz-do-not-send="true">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_color@ctm-0-75.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086" moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_color@ctm-0-75.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791" moz-do-not-send="true">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send="true">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send="true">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@d-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate@d-dp4.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@uint-max-clock:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_invalid_mode@uint-max-clock.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@zero-hdisplay:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@kms_invalid_mode@zero-hdisplay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-8/igt@kms_invalid_mode@zero-hdisplay.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-2/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">PASS</a></li>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3109" moz-do-not-send="true">Intel XE#3109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@kms_plane_cursor@overlay.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471" moz-do-not-send="true">Intel XE#1471</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_plane_cursor@primary.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471" moz-do-not-send="true">Intel XE#1471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430" moz-do-not-send="true">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864" moz-do-not-send="true">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042" moz-do-not-send="true">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932" moz-do-not-send="true">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-59.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send="true">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@create-contexts:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@xe_create@create-contexts.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@xe_create@create-contexts.html" moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472" moz-do-not-send="true">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-4/igt@xe_evict@evict-threads-large.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@no-exec-null-defer-mmap:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@xe_exec_basic@no-exec-null-defer-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-1/igt@xe_exec_basic@no-exec-null-defer-mmap.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@xe_exec_basic@no-exec-null-defer-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_exec_basic@no-exec-null-defer-mmap.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-prefetch.html" moz-do-not-send="true">PASS</a> +17 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports:</p>
          <ul>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249" moz-do-not-send="true">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-7/igt@xe_oa@mmio-triggered-reports.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249" moz-do-not-send="true">Intel XE#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-regs-whitelisted:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514" moz-do-not-send="true">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>{shard-bmg}: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514" moz-do-not-send="true">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-bmg-5/igt@xe_oa@oa-regs-whitelisted.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-multiple-execs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620" moz-do-not-send="true">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@xe_pm@d3hot-multiple-execs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@xe_pm@s2idle-multiple-execs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@xe_pm@s4-mocs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@xe_pm@s4-multiple-execs.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873" moz-do-not-send="true">Intel XE#873</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send="true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-6/igt@kms_flip@2x-plain-flip-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033" moz-do-not-send="true">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format:</p>
          <ul>
            <li>shard-adlp: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_plane@pixel-format.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-adlp-3/igt@kms_plane@pixel-format.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send="true">Intel XE#1035</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_psr@fbc-psr2-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-page-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@kms_psr@pr-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939" moz-do-not-send="true">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-extended-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_eudebug@discovery-empty.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_eudebug@discovery-empty.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000" moz-do-not-send="true">Intel XE#1000</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-exec-after:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_pm@s3-exec-after.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140029v1/shard-lnl-8/igt@xe_pm@s3-exec-after.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8073 -&gt; IGT_8074</li>
        <li>Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823
          -&gt; xe-pw-140029v1</li>
      </ul>
      <p>IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8074: a886e0ad97832dc2ba9b85d35bca22e667c15105 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823:
        01c7b2c084e5c84313f382734c10945b9aa49823<br>
        xe-pw-140029v1: 140029v1</p>
    </blockquote>
  </body>
</html>

--------------Zn3yKE0ChX070Z9MorGAW9hB--
