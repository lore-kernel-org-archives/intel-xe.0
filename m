Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F44C79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6210E4B8;
	Mon,  7 Sep 2026 19:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGhKeZdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7144A10E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788807897; x=1820343897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HoCI02lkohONrlu24CLHgdviB8GrI6aJmeJv/th0+gc=;
 b=mGhKeZdZ4oq3CdJakoKWE3pNFDD8JWdIlp5lx1AoCtOW5jh9FJOvNJOd
 GAK5fFovKE4hn0YHf6LrQIBugdgD1rexZsueHvSwAz89gSv5uPdupzGfW
 6IjC0Jq8kAs1ilJ7xIi9IS/B6zT1AbKMTU5D1kGCs0zgXczD209HKdpem
 K2saXt7iNMTp+SH7352lhAyyreJj9nEZQY2ZXXvT/oi7USMnOPCe/VIjQ
 My9GH+wGKMBZj8Lk8mRumBUimpTRJaemsJdEc5SMVgdfKWnaHzb8B3Qq5
 Del3ghDH894ywl2EBoYy/feDFLZtOa+4CvcSTRcGHTb3ReRIdF9wFoxZO g==;
X-CSE-ConnectionGUID: 16o5/gNUQfKOe2EPx1b3oA==
X-CSE-MsgGUID: UFuaHpS+QJq4YPb9pSbbvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100370615"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100370615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:04:56 -0700
X-CSE-ConnectionGUID: LK9POKgZQAi2GdpPWCQ4ew==
X-CSE-MsgGUID: pK5XC4AvRpy0xk+Na8Yydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="309020111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:04:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:04:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:04:55 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w52YqQxDvCHco4uq1k3ZGeOlsigCKxbs6S/ZA/hMHxQQhe/Pfl3bXTWzF8CYTIaBFObBejDXtOFw1O4r6tVrgNCF7sZ+587BRo9SNLMupTZGFDMmcJ6BKx3FhpZ6OylVze8/PxMlUKGqzxX6rP16AfnQmvj4Bdz4RY6M3i6kuWyRXLZvJqVbwSXakAIfF+kbTSbo4TbNRWAceuhU6EYwzpuUVwDoX8Y/Pcfc2RX7TNeRskPVVWpvuhwEHSTZjwcOugTWX0xDKo+qYY9mZD8et5zV4BPtP9sHrQ1ACdTM8aOxhCzkysY/1fouutVLpYrye0Uc+Ji6tt6jZUMh3PtfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3zcq690h6nCOTefQdqqSN3sMYp1W8msCgOO2qdmUYE=;
 b=qFeiVkf45JYu+NgaQpGNeCyDfl1sGFJTZLIM2IMwsmkl/tCHLQB3UPMG7oAuEK5wDxyVMaSUd8i6LAj453i0KbubJeBGMNqKpISEmP4dosYrDowfQiE0ejYqZr8rpxQm5dKRvSi3JJX/wGF0n9NQPYKMKFe72avfaSG+2tLz4ved529AehqsGcc0v1+qSCxb3cCRxqyQEjUL1m6XqU5ZIADVbKkI1ZtWKhA4/U7MtZEEMOVsG+XC/SxCdlAh485XPOy5sv1VAqWR0vUhrh+UV3YSEP/ig2uX7lA77A75JDohbNZSfgl3sSM0/LdkhTpdgAyRlQtjttumszjRCSwYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY5PR11MB6320.namprd11.prod.outlook.com
 (2603:10b6:930:3c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:04:53 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:04:53 +0000
Message-ID: <c6b2e25b-ced3-41a7-b2a0-2029877bf351@intel.com>
Date: Tue, 8 Sep 2026 00:34:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/xe: Separate drm-ras netlink data from device
 and firmware RAS state
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-11-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260907094706.1407436-11-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: d537c30c-b6fb-4ca7-e3dd-08df0d12e5f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2z7yuolUVVc79QnXZzIM+1krOVXF0YXrNRGyGhu9lRddx2yUXgFb4EHBKT9b2HLoL6exuTBYL7jYDmXbJANgcBR45l8kfFTz5OwAeZDEShUuskwmtPMcW/btY2m8ped/6DH6z0fjhxDlnf6D7HlY0y+J9wV5bPWPNLkLeORMuce7rkmXhWpuhN9SbojMXyJ7wM91gQCRCseRcAmOVeBzVVKMQPIY7zx305hY9cXX83ktneB2fMEa4sMXD5rCo/xcQvVu3OWaF3DGv7ypfpght5KObUSVQqDdH2mhgLt+qoPkUhgTPwj1QKM4FJJH3yQE5lYxUHvzFE+kOkhB0Xdt2aH46LyGBufV6SWuyCm/xOeJUy1OmoU2VcbM+NCG+AXkmH+iysxP05IXdu4PRa0KdtSvFnSnqSPcRWBTyLeiIeHPmEw/xHPPTBruVw0SesWQnqdRK6DEGK2ZNSqDyeQ8UbqCqWzSuIgacORbHk7igh3DvI8jqH2K+OxdM9jUJ3qClDDOorj6Uew/ehkMlsl8Ghp5pA+ZHy4aE9O2nh2Dl/VzJEcho8IieIb9z2QKWPikmAs6mnvdQvjghc+MaG643W6d/R8+YM2zm0kig2AK2e+QYiHtGpYwmQJeXByrlg3QKjqun/w6k2gmw0mqMf4erKH1msuIKcWwUpPHnQ6IyY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDg1UEEvT2lRLzVmdmtqNEhPV3I5eGR2SitHa3RYTTVWbkNlSUZwS2pkcGQy?=
 =?utf-8?B?c0Z3Tkh1blA1NGVuMXhZV1hEMVVKOEVscWhmYVA3SXd6cWFRbnpZSWd3ZlRy?=
 =?utf-8?B?R1A1ZVN6dHM2SmFtQlhuY1M3Y0FWTWFaSEJhdDRMTEYwUURpQytnTVdJYkxU?=
 =?utf-8?B?MjdWeDlwMXl1RXB1UG1XbkpMWG5qWVUwRVhUTVpDdnBlYjBuUnZzeTJvdUNQ?=
 =?utf-8?B?TWxlalQxK2drMitKNG1KZHJQZ2h0RG5vZmJFRmxHcWQ5dlA5ZHdDU0svOHJD?=
 =?utf-8?B?WUoxcEdFaFVVaVlEcklEZ3BBdEUybU1LSjd1LytOcUNCWmRJNnI5R3pQdmwr?=
 =?utf-8?B?QlJtQzc3eEZMY0dLNENSakliNkN3RTJQeHNJSW1xTVkrT3NIb3I1UjBlR2o5?=
 =?utf-8?B?TWUya2phd3FkQ1BvYWZWVlZyREx0QWlodEtBRjAyYklHNjl6blZKZ1dmUnNW?=
 =?utf-8?B?b0s4dER4Z2JQS1ovWFo4a2lzbkJZczMyQm85WHRtR21VUUpwQ2l0d1FkZE5o?=
 =?utf-8?B?bG5GYTlQa2VSZmRYbERPWXcwUW96UkhUTEJzVjhCZFlneW8vMXhIZDU3eGFN?=
 =?utf-8?B?VVB5ZW5vbVluZDRCTGZCb0Fpd2pBZnA1Wm1oYVlYblovQURob2lhckpoanFs?=
 =?utf-8?B?endScmtjUjE1Uk1ldSttWm80WVZyallkNFVtTDJUZzJiVndWWk9oTHBIY2ZQ?=
 =?utf-8?B?Q0llSXc0OXV5ZDFncEUvbjltM3M2LzhSeWppY2lJVk9nUGpkcXllTC9WdG4y?=
 =?utf-8?B?Zm1PejNsWVNVSnpmUGtyL0Q4Y1hXS0FiV0VYZGVEN3IvbjdvMGhVOGcwYURH?=
 =?utf-8?B?WkhNOE9uZm14d2swWHNWcHdoaXY2RUJiamtqamhrTTEzQUxuU3pYYmxSVXhG?=
 =?utf-8?B?SjVkaUdXbml2TjZySEdaRjVxQktpUTJWYUFZLzdxRUcyU2hLSVB1Q1d0cFhD?=
 =?utf-8?B?UlE5LzBLdkorVTgzbFo4UzZZZGhWT0VHeGx5NjNteXRueXJINmxrUWlMN3Zl?=
 =?utf-8?B?NzFHcVhqZUlZVGpGR0NVT1gzVnAyd0pIMDVVRlQ1Ui9Xci9zK09kNWM5UTBq?=
 =?utf-8?B?RWJpNkI2RnE0MDltcTNiemZTMzR6WjBOWDZ0U2JnakZTQTFxcFhqdFdLQUNh?=
 =?utf-8?B?bjRBeUNTR0E4Tlp4VFNNeVNkWnk1U0dUM1FwZTlSSU5XcVRRaXJwbjJLdUlX?=
 =?utf-8?B?YXBzN0tQWTI4U0FnK1gvWVhlb0FEa091cnJQZTgyQWszdi8rSjNCdGUxem1D?=
 =?utf-8?B?MXNlSVQ1RnkycGY0YjB0WENqUjgvZ2FhckRpbGFtbFI1RUlBQklRa3JBL3hR?=
 =?utf-8?B?NnR0NTBnNnp1M1NNSmlSQzZJUXFudGtUd2ZWV0lhd0NuVjBiTXIrLzQ2MFdy?=
 =?utf-8?B?K0p3WTViU2hJTjk3ZlJzSzl2TkFtZy9mM3NVZTBpc1NLMWpieVV0Ym1nNyt5?=
 =?utf-8?B?SjV0bWRJLytMdis2ZnZBc0ttOGNPZHVVb0x6c3ZEWjZZVDNvMDRUUGlUeWo5?=
 =?utf-8?B?YTlNSUZ3OVdlMnI3NzNBUjhYVXNocmlyRXpPZkFSbG5qZTIwZ1hSM2ZSTEpE?=
 =?utf-8?B?dmRKSzM4ZFBTb2NWWEZoMUxBdXlWU0o0Y1NpbVgvaEhGMFM5dk4rNGhrQjdX?=
 =?utf-8?B?VkZKeHYzYVBVdUdpQ0J3eWw5L1hlNkVxV3FZSVJJSWVYbW95OC9uay9QOXVn?=
 =?utf-8?B?d2lDb1VBc0RrNUV4V2dpSUQ0Y21sRjVHcnRMWFdkaGpxRFBWcHd1RGxvSEFi?=
 =?utf-8?B?RTF6VEtPL1hPLzRGekt1b3I3RmJTdmRySHFBWUFQb2xtT2NEeThwTDk4WFM2?=
 =?utf-8?B?MWJBK0ZsUkdHdWI5N052U3I0TEJ0M2FYWThzK054TGRrT3R0OHAzSjlsdTZy?=
 =?utf-8?B?UGc3cFVlK2V0bGRoMm1YcUMrajA0Q0FDTzFXc1p5dUpZVDRoZkpzNW1oMGtU?=
 =?utf-8?B?YXJVYVRRVWV4T29odWlJS2VmbkNFRGZHSVJVNHlZYkZJeDJYMHlGZFozWFFa?=
 =?utf-8?B?aG5lYVZMajI5TEFtRWRRTjFxd2JBamZ1RWxQbjRFTnRTNmVpTlRRUkk0RTFR?=
 =?utf-8?B?YlhoM01vVURJOXREM0xxbHdhaU1Xc0lEemNISXdObzFWeEZJaStpeklRUU5P?=
 =?utf-8?B?M2pYYWdlMm1zZXZGRmQ3MW5LODl4ellOYlZLaERQbmErRFdWRFNqekVmSnlR?=
 =?utf-8?B?MzJ1Mnc5ckpGemROV0FoUFVJVlZJc2NtQ2tqb1B1a2NrNks1UjY4MUFqRnJH?=
 =?utf-8?B?OUhvQzZmcTA2ekVZMW5udlZ1ZVhRa2RSejBSazN0c0hCT0sxOHZyQjlpa0cz?=
 =?utf-8?B?S1RUR0xXYTh0ZzlVQ1pQM1AxMEphcE5WdWw3QmZaZERYYnJzckR6UG4rS3Ez?=
 =?utf-8?Q?ajwwqv7gs9zx/vjE=3D?=
X-Exchange-RoutingPolicyChecked: lgE0wo8rwRRxLogvN0vqJmK+PQ5ZhEimuWelZnDTywsjzndZIavGAYhMF4eX0QC6qg0HIhQbczG6FVUS473IObPK6xGNfg4LMbF5szG2yckwdfnk5ql7p5kWTG4FEOG+rkhT66t93zb9bd/TEeEKadodhGPJtsJocU8tbr8iTiXWWZk25O4XCKTTHuN4mAOTyRHJLcOTHPa2bBeMnOh4Va9KIeLUu4sW8QVBp/keFe/9H04Mt/RndCu5SY7NG+DN/zNDDzu3h3Cl/+SFsSC5TzbwjFvW7ORCLuJ8nUbXGvpZQJGSTqWcYlgFnciG5WzQEOPENi5X020YwHq8PmWKUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d537c30c-b6fb-4ca7-e3dd-08df0d12e5f5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:04:52.9708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj4QpESJD2r8U8Mrnv6ZT3dGrqXDOWcL94ilcDdAUeS0v94pnHUdXdLf+kGlajhc/sWnJJfW14MA+2j7OIEXFH9H7Vjse3CzRM73JelXCl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
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



On 07-09-2026 15:17, Riana Tauro wrote:
> Keep the DRM RAS data used for netlink reporting separate from the
> device and firmware RAS state in xe_device.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
>   drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
>   drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
>   drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
>   drivers/gpu/drm/xe/xe_ras.c           | 15 +++++++--------
>   drivers/gpu/drm/xe/xe_ras.h           |  6 ++++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
>   8 files changed, 45 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..f9dd65d94417 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>   #include "xe_platform_types.h"
>   #include "xe_pmu_types.h"
>   #include "xe_pt_types.h"
> +#include "xe_ras_types.h"
>   #include "xe_sriov_pf_types.h"
>   #include "xe_sriov_types.h"
>   #include "xe_sriov_vf_types.h"
> @@ -550,8 +551,14 @@ struct xe_device {
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>   
> -	/** @ras: RAS structure for device */
> -	struct xe_drm_ras ras;
> +	/** @ras: RAS (Reliability, Availability, Serviceability) structures */
> +	struct {
> +		/** @ras.nl_data: drm-ras netlink data */
> +		struct xe_drm_ras nl_data;
> +
> +		/** @ras.state: RAS device and firmware state */
> +		struct xe_ras_state state;
> +	} ras;

+1 for this separation. Looks much cleaner

>   
>   	/** @i2c: I2C host controller */
>   	struct xe_i2c *i2c;
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 7f3695707611..38d77561facf 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>   			       enum drm_xe_ras_error_severity severity,
>   			       u32 error_id, const char **name, u32 *val)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   
>   	if (!info || !info[error_id].name)
> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>   			       enum drm_xe_ras_error_severity severity,
>   			       u32 error_id)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   
>   	if (!info || !info[error_id].name)
> @@ -90,7 +90,7 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>   					     const char **name, u32 *threshold)
>   {
>   	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>   
>   	if (!info || !info[error_id].name)
> @@ -106,7 +106,7 @@ static int query_correctable_error_threshold(struct drm_ras_node *ep, u32 error_
>   static int set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id, u32 threshold)
>   {
>   	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>   
>   	if (!info || !info[error_id].name)
> @@ -142,7 +142,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>   			      const enum drm_xe_ras_error_severity severity)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	const char *device_name;
>   
>   	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> @@ -190,7 +190,7 @@ static void cleanup_node(struct drm_device *drm, void *node)
>   
>   static int register_nodes(struct xe_device *xe)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct drm_ras_node *node;
>   	int i, ret;
>   
> @@ -230,7 +230,7 @@ static int register_nodes(struct xe_device *xe)
>    */
>   void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	struct drm_ras_node *node;
>   	int ret;
> @@ -260,7 +260,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>    */
>   int xe_drm_ras_init(struct xe_device *xe)
>   {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct drm_ras_node *node;
>   	int err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0be218ba2db7..8d729ad6a264 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -43,9 +43,6 @@ struct xe_drm_ras {
>   
>   	/** @info: info array for all types of errors */
>   	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
> -
> -	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
> -	bool disable_vram_page_offline;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5f2abc9485ff..f53a6b3055de 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>   {
>   	const char *severity_str = error_severity[severity];
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	const char *name;
>   
> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>   {
>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	struct xe_mmio *mmio = &tile->mmio;
>   	unsigned long err_stat = 0;
> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>   	const char *severity_str = error_severity[severity];
>   	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->ras.nl_data;
>   	struct xe_drm_ras_counter *info = ras->info[severity];
>   	unsigned long flags, err_src;
>   	u32 err_bit;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 648e46df831d..b5b0c1a3a663 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1126,19 +1126,18 @@ void xe_ras_init(struct xe_device *xe)
>   {
>   	int ret;
>   
> -	/*
> -	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
> -	 * once the feature flag is plumbed through device info.
> -	 */
> -	if (xe->info.platform == XE_CRESCENTISLAND)
> -		xe->ras.disable_vram_page_offline =
> -			xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
> -
>   	xe_drm_ras_init(xe);
>   
>   	if (!xe->info.has_sysctrl)
>   		return;
>   

I believe has_sysctrl is currently enabled only for CRI. Is it possible 
that future platforms will support sysctrl but not VRAM page offlining? 
If so, it would be better to have a separate device-info flag for that, 
or at least keep a TODO here.

> +	/*
> +	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
> +	 * once the feature flag is plumbed through device info.
> +	 */
> +	xe->ras.state.disable_page_offline =
> +		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe->drm.dev));
> +
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 0b8669f28d56..6e65443cd262 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -7,6 +7,7 @@
>   #define _XE_RAS_H_
>   
>   #include <linux/types.h>
> +#include "xe_device_types.h"

No, please. Let's not bring this dependency here. Move the function 
definition to xe_ras.c.

>   #include "xe_ras_types.h"
>   
>   struct xe_device;
> @@ -21,4 +22,9 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
>   void xe_ras_init(struct xe_device *xe);
>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>   
> +static inline bool xe_ras_get_disable_page_offline(struct xe_device *xe)
> +{
> +	return xe->ras.state.disable_page_offline;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 7bfd86c9d135..ca459e785add 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -414,4 +414,14 @@ struct xe_ras_set_health_response {
>   	/** @reserved1: Reserved for future use */
>   	u32 reserved1[2];
>   } __packed;
> +
> +/* Device structures */
> +
> +/**
> + * struct xe_ras_state - RAS device and firmware state
> + */
> +struct xe_ras_state {
> +	/** @disable_page_offline: cached configfs policy, immutable after init */
> +	bool disable_page_offline;
> +};
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9a514d983e90..2c4722a956a0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_res_cursor.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_vram_mgr.h"
> @@ -933,7 +934,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	vram_mgr = &vr->ttm;
>   	mm = &vram_mgr->mm;
>   
> -	if (xe->ras.disable_vram_page_offline) {
> +	if (xe_ras_get_disable_page_offline(xe)) {
>   		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
>   		       addr);
>   		return -EOPNOTSUPP;

