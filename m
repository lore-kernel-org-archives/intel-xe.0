Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2D7F99376
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 11:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37910E313;
	Thu, 23 Apr 2026 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXFa7ZVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39510E313
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776943334; x=1808479334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7B3IHG8IfGHOighfyEhTCqJ4S8euX1o6VW90SYNSMyM=;
 b=gXFa7ZVvv6UL6ATbI+WVuAGTbpQgpEpVpAOirtNXSiL0UQgHsBTWSPXf
 3fZR+rwr/OsT2J4GyNGSYIS6NdTJEfObN/9SR23WfL3SLCkIXlIj724k0
 EteDCllnb3knpjUOW+N1lJamSB6NSdfwqxbxKGVImacBQUwC1OIMWyX9u
 6H+GJf15R/nNmVZ31UTDm1Jq5MLtSJF0u8CBIkCmT64qhFZZK/lUIW/KS
 0q9o/bMSNK1u2W1/5yMchI2rWpwqB006RLqdnoWuIaGX1UIawGoLGLJga
 RwuxjC7t5Z4izUWaLU0/kkcr8Bnf+yTkHVSDqsblB6p4wFrI0M9jilGwV w==;
X-CSE-ConnectionGUID: km4sMwVnQ3y/cnCiNNR6yA==
X-CSE-MsgGUID: o1zbpzxMTeqGa8YyTprvGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88606195"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88606195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:22:13 -0700
X-CSE-ConnectionGUID: Gf3TRzKIRry6NgIntLONyQ==
X-CSE-MsgGUID: x52i+fNwSN6x+UDMsxzsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="256113776"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:22:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:22:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 04:22:13 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8ZNcuxLg9z6A1OxHkgU8y+WdDUUm34K4GPdGOBehpIguESFh+Hx4zLy+uJ3idsI79J7PO8sVZZwjJE5bDpXpSRM19lySNii02URvj1Rs8bKA9OcaxKI5x9Ozi0/sj0riUkqO220gahLDtsGZLFtnLAZoVhjp7F+CUQkqDx3uifBLhUQxW/nwXqakPA5GBVUpol4+8wt3qoLgWKW1MzyIfzFZvBQ95pLWox+V/fj0eZp+yOEgTSQ4px/rtfUZai9zjXJh+V4MmAUgoL48WRFo51KB/6HkF31Yksaa7q6OiOpHx3H+SRT/+c7QqzGirK4prslUHVclnIhOmZs3REHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+np5+uiwYi0elBsEPnBWBPxuc4kNvIn73vm29Irl3WI=;
 b=CoD2xrDRl+zXk6T7JWCF6SmVo+29Z+ycIBwa+DacT3lTMXrDlH4ytU2Zm9QDzmzi3oKjG0imTmmJv269FA/dpzrqHJ3IQMANddZ5jqAZ8/z1ZhTf3yHByC6NWkoXKkgQwhNEfqtDmiaObb2HfBqY43fqiP3Xs+GAdLEcnZ6njHccx2kgxRalnS5EpG3rErfZTrBro/l4WjvDvioQKY8DGMIqc2D0xD3xuypFVtQBK7rHBDE6BlVs+buFltMiXDyjzDRsa6vTJgC6Mm6hOQ6UnLOz2/LLQ0QtaM7DlAEM4Nw7iDtYCmFHnMUoXYnwxjevnTf9BztedbjBsKBL1NtRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.22; Thu, 23 Apr 2026 11:22:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 11:22:10 +0000
Message-ID: <c97e2de4-e219-40bb-9565-d1b39a5ab3eb@intel.com>
Date: Thu, 23 Apr 2026 16:52:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/xe_ras: Add support to get error counter in
 CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
 <20260421145056.253300-9-riana.tauro@intel.com>
 <aen5oJTmbeQuNi4_@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aen5oJTmbeQuNi4_@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 79726495-8c58-4496-d169-08dea12a8f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: VgWOLHhSo16IlkZDFjtKKl5PjBi5q0NPCcaPgDQeoGhQ0Xu8B4WTHrdg8cWSPEW1KsWu71ChqrBTVyOj6cXy2H6xe0ORUro7cAQwmKNOcWdMAGUJ1Q82dpzSwvo34lCWtQs/03jBHOGmMMkhYpBZS5tY7vblgzjy6lK+pEXvmXbysu/CLa0ip81s88MfbDD4FWqun50Xa7Tr8Ofu+xKfVg+ezXEcXZ7yJRS2IxS5jxAIFk2xhaJxxV5L6OJ57I2/XKvh4dzvKs6ZliHzyidX+uVAAMmgn/Y6B2NJWF4SaFRrZdPLn1tJ/eQGufYeTbxUhE+vvUUraCzmCrYjPs6SwhYROGWZPZgzVTp1QqipB8FqG65WR9SyRjGJaozygV61WGTVK19lr4LalhsSaLfINmSCiwzXMdc7sVFD1FVWCYFlWJ2/JU77l3qgiv2k3RXH64EIbC2sLKXyYVuBKIQXCGvIsilKejt/It07o/mZ4U7f5tcpmiI/xg9aM0F+qZW8GUpXvdeAQRCMGzlWP1eC0Yk4/UegFG2OHL6iGDzoe+2BYtMJmnWo0RXs1WbQ9sRLoVoPQt2sBATcK+21J1TQlWOt6ZHoGITKwZPQs3JqxZi/Fg/MPifus0CTkoVerLgh+CY38FlpOET4G/yDeUCeyhwz7E3hnoawPk4shXlfQjQGPeP667c0ETBSVqFgGmCevN3Cue3liUTbIpVpv893Cc0ct7ZWOXrr/KIgPCnHFf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0R3V1VPalpnTklQQy9QV2dDd2U1MFhwd2s5SVlpYk05cDlqR0cwYy8vdGdG?=
 =?utf-8?B?TFAydExDNUhvZUZkUUMxb2xwTmlyVlF0Mjk3VWV4QnNVcUNadk1NaUxnZlVq?=
 =?utf-8?B?eDJ3bWhqcWE5NTJSblFEbHkzY215U3F5ckNTU1BPbzl5Z05MMmM5K3c4UEl5?=
 =?utf-8?B?aDdiUWxoNlpTVVpvajVHMWNMSEZSMm5OOTFMK0JEdmlJdk1lbjZYckdjczdE?=
 =?utf-8?B?Z3pLVlZhcGVhZWdaZ2lPVUZkNGdPZWZtejBVNDF0ZzFkQU1lQmpFTktvLzZp?=
 =?utf-8?B?RVR3YWpJS1VxK2l5SkdwV1dBS1ZOQi84WTdLbEswdnBrRU5zYXlKaXJZbXpj?=
 =?utf-8?B?cFdld3k2a0pZRUNqNjJVWGtVclVZcTgyK05hWEYzaWtRK0VMcVB2TElHZExI?=
 =?utf-8?B?TzE1SnBzekdETFp5UTBDV0hiWDBNbThNN2VXc2dLdlQwR0dGWU5QQkJwTm5G?=
 =?utf-8?B?SHZGUlJzZVFxNCtXaFRoYncyN2lYdjMvb0JubFZuQUJVM0pBUmsrQ3ZOM0Y1?=
 =?utf-8?B?OWZuZUJkajA5TGhHYUw0djhXSERoempOUzBRUzJIVUJobVh4aDhPeWJUTmJj?=
 =?utf-8?B?S3dhWWZWaGFTSW4wRjJGcHBCVnJlYmJuWTJkd0hRWXRBTGNwUU9ZTWVHa2VE?=
 =?utf-8?B?MjJmVFZyckxSQ2VWNVNxNHdTeFdkc25pZnpLY0lxZFR5czhpRWZEWE1pSExD?=
 =?utf-8?B?QmgwL003Sy9NTVpSb0JQOXBvZm8yV2l3SHNpbFp0YTN3ai9ueTlnZ1BmekJw?=
 =?utf-8?B?VjlQcnFIdjlib2hJK3RRU1llM2w5eHdXRC9RU2xIMmp1RWdackp5ODBmb2oy?=
 =?utf-8?B?MjdHM0VMTm5oVmp5a1BlOU91cTVtZ2VjampnV1ZPWGRETnFteXVkVElhdWpS?=
 =?utf-8?B?QUNJa000VzdOMHAySkdyZ0M4UTN2eEdVQk5MY0JRRjJPMUlpYi9uaVBzRXZr?=
 =?utf-8?B?WjdlaStDT05OcW1haFJldWI0QnNuM2FKM2kreFRFV3N4K1FhUmhjeDJTSUZr?=
 =?utf-8?B?UHpMYmdCUHh6RDFyVjhEby9DQjQ1Rlo5K1ErL3l4NU1iL0dCc2VVNkVVeEo4?=
 =?utf-8?B?VHVCakFOTnpiN0R1Rmp0Q1RXSGtJMjN0SS8vQml3TmJCaUJWcjdWZWMvQUdI?=
 =?utf-8?B?MlhsbGU4WDFPQnBQMlhGWktCWE1YakVqRjVKNmJEV3htRitHNTUrT2Nxb0F6?=
 =?utf-8?B?SzdDRUI5ZTFCc2RDL3I4dDNPWFVnMlhpNHdMOS9sVDBwV1Jtak1yTWpaclht?=
 =?utf-8?B?QWJlNzlGRThzUW5jRGxoSGtzU0xaYW9CRTE5bkxGb2Rtd0llajB6TVNrei9h?=
 =?utf-8?B?QWtIVUZkaU1Ud1l1UjZtVmdUd09LTzdPMjA3cFlqamJYa2o1VEgwUDR5Q0hE?=
 =?utf-8?B?SWhXK2wzaVZjaU5Ld2p1YVVYOTR0WmYyVUJIemFyUHRuOS9QTVFQaHFvYlRH?=
 =?utf-8?B?V0NJajRZejdzUmlQd011bVVwMlFQWTdmK0x6VjhpZDJ3Z1pMSEVrWWVhU3li?=
 =?utf-8?B?NkpxZEpVVWpZZUVTa1RZNDgwY1JCOEtITEJFbjhZTmdYcXZvRmhDM2I0Yldw?=
 =?utf-8?B?cjk3RE91SG1PSjQwWWpUdlVYdHRIWVhJQTRWY1VqVmIxdmFQKzB3RjhtaDlj?=
 =?utf-8?B?S1ZGYkpDTVZXK1BOMmhPK3JvUndXWTFkc3NCTjUzMWxkMzlRNlVjR1h4MUs5?=
 =?utf-8?B?RmhsMFJsY0F3M0UxZWlPOXNzYytSZm9RVEk3OUZzY1ljSmVhaWltWUxMVldI?=
 =?utf-8?B?MUh1YWJKemZTTExPREI4ZHJtOUdyVHhwWWQ1QnBGdFh1REJPNEhzdzkxTkJ1?=
 =?utf-8?B?eUxLdXBwbW1PanpNWGljM3cxU2l2K0R3YndoQTRJMEE0VUFwdTVjUy96Kytq?=
 =?utf-8?B?S0FZL2J0R1ZPOWtESHN1QzJ4eGpMcnlYcU56RG0wQUYrR3AwVEFMTkhpQzJY?=
 =?utf-8?B?L3puR3ZYbTZMd3VVa3k2WlR6ditpRFEraytRNWhmVWNONnh4eHI5YVQrUE1k?=
 =?utf-8?B?Wmt1TmMrbGZYMktOMjZ2dGd3TEtLRzFDcHUzdjJOUkRVeCs5dGFlVVV3VHc4?=
 =?utf-8?B?NmpWcytpV1hnQktBSzlWTnE0cStsYitZelIzSEF4Zzd3N3ByLzhZRDd0UjRH?=
 =?utf-8?B?K2hPOFVwcWcyMGkycDJlSjRxTVBxV0kwTTZ4eWJXUkYwY3hvSk1DazZ0VTB4?=
 =?utf-8?B?eTYyWnR1RnoyWis4UHlPbXdzSjhLNmxmcXpsQlJXdGREaVVDZFR1emtOWlhR?=
 =?utf-8?B?dVNIVXlOc0t0aElUcE9Xb1Njbi9nSHh1OUtISkEwZWpUTVU1QUJNWW5YdXZK?=
 =?utf-8?B?TWlXekpsN3hlaXNialdZR1pING5hUjNLcjR1dU9pMDVmUzRCYk8rUT09?=
X-Exchange-RoutingPolicyChecked: p5T5l/pxJa1K+0TgR3eIwWba99gTzWivNhP4D8ad2CY/3d7nKIYgnRlT/rVpp07L2k4uG318JV1EDDp/U6uklem7KSyHd1yRJQPhiCR2xawY9xT5oXzZ2dH9XSRMv/VsdPdNkjUMnG9evg6NL73KlbvmZuZTFp0hyYUcMzjiWXcWmP4GdFjJBeGz6qD5JSbx5wZupw+Y6JyBFV4Zbsn73UmrKOJP4NQAiEz80uiR8EK5dsLmxql1JqVj2HJWO7gOXw9dnvtWUtX1TM/a3235SKRWpXjV9VmtGOD+tYpnJ0LHJN3D+AkOuP0lwMWUKb5IT2Ks6HNz+nUU/3D6yoT1lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79726495-8c58-4496-d169-08dea12a8f90
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:22:10.6631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gikaFPOHexxfdPVqsgfuDdcWlgmCE65Az7CCsiSJ2r9JSKK0G4ZgmHRzQAU8X/TQLz11SjiRYNWYjdLQGJvLAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
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


On 4/23/2026 4:21 PM, Raag Jadav wrote:
> On Tue, Apr 21, 2026 at 08:20:58PM +0530, Riana Tauro wrote:
>> Add request/response structures and helper functions to query system
>> controller to get error counter value.
> ...
>
>> +/**
>> + * xe_ras_get_error_counter() - Get error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be queried
>> + * @error_id: Error component to be queried
>> + * @value: Counter value
>> + *
>> + * This function retrieves the value of a specific RAS error counter based on
>> + * the provided severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_get_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> xe_ras_get_counter()? Pretty please.

Any reason?

>
>> +			     u32 error_id, u32 *value)
>> +{
>> +	struct xe_ras_error_class error_class = {0};
>> +
>> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
>> +	error_class.common.component = drm_to_xe_ras_component[error_id];
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	return get_error_counter(xe, &error_class, value);
>> +}
> ...
>
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -0,0 +1,92 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_TYPES_H_
>> +#define _XE_RAS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
> Any users?


Missed removing this..

Thanks
Riana

>
> Raag
