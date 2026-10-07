Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794D6CA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 07:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3033D10E366;
	Wed,  7 Oct 2026 07:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEV0I+yC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D632B10E366;
 Wed,  7 Oct 2026 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791358656; x=1822894656;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=myrBFK9gaZ1bqBDzi++5M64IUWBUhrCqwHAZ+a4SJqw=;
 b=kEV0I+yCvewaX4SkXsT4AhoVpAxC0gGYpAzhHp0WOEugzT4hEk8Ykls8
 TxOH+CX9PksqF3SiY+tE4MkxqIOZEKyxg6fzC7MiwKSsgrD8xrv4XN20a
 WpQn94VjBmFtfU46GC/kgHmusseaEZ/ZPj2RyleJNHNBReN3+Jafdr70M
 Uv7mcVXqXYt/GZmeUbs6Cp75/5mABrwNbooy0JzB6WDzSKlZdxDabIswE
 GqLkB8VwWxzbYNs0QRon9NxuRoYO9JhiETcoh905tPuL4Qcb4d4Q5AcUl
 uFd4k/VksXFgpWwkl2ZKqjwboD9wsDnchZvfZoYhkoIYZmIit5F7hHXS9 Q==;
X-CSE-ConnectionGUID: 0OQY2KZPQCm2nGuUXnGSxQ==
X-CSE-MsgGUID: XYe5nURiSgOvsT7cXb7PJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="116598"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208,217";a="116598"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 00:37:35 -0700
X-CSE-ConnectionGUID: /9GipzNGTwKCgeMjhSjWEQ==
X-CSE-MsgGUID: fiP/hWPATImvfGvtQU1QqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
 d="scan'208,217";a="281125750"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 00:37:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 00:37:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 00:37:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 00:37:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wysp5c+VNG6qzCICtoHfR8DBlhkPrOPKHsKtYDD6TxXoPjxnSvhLRE7diNTsvMRLkF9yH94CjFvegAnjaviOCfucKf6ZBpzmID/HbLBln34efPO0JmhbxJKu96IjPAotrdfQ/m03z4Bru2vFX4M+Al55AxJXH+yi+n30LQcGFHXKl3H+2w3Jsw7YVZWmOKPo88Bgc/EKkQgRrNf3CPFWuopV6uFVc8v8xuDTGHXadJlbB+j14mwkGqEwFPGQ44IkOoTtjVqwyUgGbOX/1KuUBoUvGENA3Omrf5mDbN5bwjqAjdZ+sLhi8pAaratmOF8xzxfBVo3UWrqfcypp/CjK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLAel+HGCMLT7Epn2OxZemLg87xh5jFrnMg0MsAXT6w=;
 b=xgBc87YZR1u8oClvh2hpmHwQgNRLZyKM3M/0iqnVFcsdUDbs1AB2m3cAHOZnBrop6KtVFNJaNY5NXvz2i4lRhiYbRXo3Pqg2GMxDEXJOj5zCPERZpHrtUUGd5wzjptFyLkPHYd/h0bfi7J1InHV5+ME5tWWPuMaSTWWOaCvEIVEtrxlcah1GBFtPR5fyesQ9cSahKeeuL0BYtqJwdedK0rf0MvPSlf1cpoJnCLL0/cdiE8ax0R0W8E87kQEc+inrjrHUU1hrYI5r2y5o01WFDOrXkXr1pcO30mO51oi9MqLtSk04lWo+vblPcNKjZCTUIKqmLmtpx0FDS2Zjwe6VMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS6PR11MB931270.namprd11.prod.outlook.com (2603:10b6:8:413::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 07:37:32 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%4]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 07:37:32 +0000
Content-Type: multipart/alternative;
 boundary="------------UVIkskNb7W1cgf9B0GpGbbwy"
Message-ID: <772334b6-77cf-4a0d-ae71-3b1f1187c977@intel.com>
Date: Wed, 7 Oct 2026 13:07:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/mst: let the branch-sink check uncompressed with
 18bpp
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260804094450.125307-1-arun.r.murthy@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260804094450.125307-1-arun.r.murthy@intel.com>
X-ClientProxiedBy: MA5P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::10) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS6PR11MB931270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2830f4-ea4d-4d71-bce8-08df2445d8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|3023799007|13003099007|8096899003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: u/xKbLi8hWomJw7ptTyoL0//XFOfn4vY2e3r3HM9yvhzfIWnfypvEAFvcHXLtofrz774nAyQJgEmvSiwB2QVmw5og4YqB/v1c3Y5diEfBzpkwmH2qNEonCOdEqlbjyH6lDgPjRtyOUGcOLgqeUvgHFp1dS6uVM8uq6LSHdNc3XAE13+eX5oQk4bmjSYW7p3FEGCLi1vj9sAGKD6ZbViL7ZJUW/X+vL5cNIzRxKTf2tJWT8xwW5B+pthCrwI5skY2au0FG7QHPpPQGVwkbRC4UCVjCh33HRZ8wa31Bbtb/2oKG07EVsYBhG+asHNudiCnPp7n4/AM7k/RjWowWaY2E9BilKi4V1VY/33o8pz71DbM5tWJsxlmpCbsM3e3O2EiunAZOAuEHY0DB7YFdbzi9iDNap1GUldnEExvHn2YSVDbzCcN1lAd9qK3V9vko2WD9UIOdsGf+CX4GFp4sVyfbiIrhD2JTy3ydVxZVQQyncvMq4G031VEWVT3apc4EMAVa7nn+anFBvP5h/FvPfwjmHfiC8Udp9tI+EuREvD9OEUnUhTCEU5RDS3GCraLhavV2ZLYYgbYeMfNCu7lIzLUoSSDMZ6QSRg+Q5IM9N98DRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(13003099007)(8096899003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1p5VXdTNTE4bHFIYnRGM0x0cDBZT0M1ejduMVgrQ3k4R2Flc28rVHVKai9j?=
 =?utf-8?B?czNvam85U2pVRE50SVA2SUhZOU9lY1l1OFBqbnF0S2cvS1NYNzdQUEFralBQ?=
 =?utf-8?B?RU5hMUw2M294d3NwUWwxdEJyVWltUVhUVTJUK3FJRlUyT2dQekQwTWVSei8x?=
 =?utf-8?B?eUVESS82SUtJNTVIZURwRVpta3h3WFA4Q3BZR3VNL0g5SU9QNGtCZzNDVFVJ?=
 =?utf-8?B?YXZYN0xxNzFIRnNZamd1cnY4MnVSSWtKUU91bXZYa3FjUUVmTHdQbGFaRTNS?=
 =?utf-8?B?SFhFclZFL3JndFo5bkpodEdla3RpOXFCcThwdFlsRnN5dmwvUFVxWjREZU5U?=
 =?utf-8?B?NkNtVkM1NUlPZTdsb2tWTzR5K3RQeGpLNFNncVlIRWVoZFI0RExSeTZoSkVp?=
 =?utf-8?B?NzR2bWtaS3dlRHNTWHp6MjNoZHN6Tm9WZG5HcE1NWC8yUG1LQ2s3a21ub2N4?=
 =?utf-8?B?c1lTWUVEZENSZGEwNjVlVmNiMjF2YjArUGhya25kVnl0cFNDQjZwYW1UK2xW?=
 =?utf-8?B?dmNsQmZ2elpiMHZCT3Bna3pvbWNyOU5vbllIOGZac0d0eXZZdy9DbHBMZWhZ?=
 =?utf-8?B?VzZHbGY5Z2lxdFh3MHR6Q21qUlJUc3ZMRWUrUlhOQXIrd2VnbjFYbGh6cEVU?=
 =?utf-8?B?TXdzYUlQTHNLcFdRMWhNbnNvNGRqQWNaRzRWMTFuTmVxWWNUWHFwS1FYT092?=
 =?utf-8?B?a1VqZW1Rd1gwMXBNQkFSVGtkL0NKNU1PZWg5YzRXS3JLeHdWNURlbHJOWVVv?=
 =?utf-8?B?ZFVIVTEvcGlDTmI2Szl3Tkt4aEhPNnhqWnY3SkFhWHQwRi8rSWZoRzBEWFhu?=
 =?utf-8?B?UjFtZDVtVkt4VzNobFd0M00wNXFzalp0c2p4dWpkTkZEbWNqME91Yzc5b3Bp?=
 =?utf-8?B?YzBYci91d050QTVxQUtpMFBEbDFIYTlITndES01XNVVSamhUbE1UbVgralRF?=
 =?utf-8?B?NUNYREdLU00zOFo5M1BPS3l1amVRNE5LMUJqT1kxV3ZHS0xuUUh5VFo1WUQ5?=
 =?utf-8?B?YjFGTjRlNURuM1RlSTR0VERLc0RPdmxmOFg1S3JmcWFoK3E5TmloNGovdjR1?=
 =?utf-8?B?MGV4TC9nK1hJSVZoNE0zR3hjd2kzdnFBNnFZV1BzbHd6ck5wWklkZE1ETjJx?=
 =?utf-8?B?MXRDRElNWUJ6YUROSWVESWdEeWo3bytpUGJuUGV4KzloNEdMQ05saVlicU5C?=
 =?utf-8?B?QnBRWHhERG0yNDE5R09HOXV4cnlCYVh2V0FLbFcyaUhpV25tL2s1MFFERXRD?=
 =?utf-8?B?ajJHZ0tOYU5UcHZ5UEdJYWcrMWMzQlFBRVdnWjZOYlBDR01sRXc0cUxlMFZF?=
 =?utf-8?B?WEEvNDV4STlmRDZWc0ZVTjk2Q3JIZXlrb3JQWEloYktUV2F5dFY2alNjVmpa?=
 =?utf-8?B?TDBTZFRReG9qbW1nem5DOVRxdmxoaGRYUjE1OEFwcndvNUJNUkZEbzFBaU9X?=
 =?utf-8?B?TXF0aFY2Y09HaThMWTNJVWpiUXRTem9tU3FrVURiQ2JDdFdWUnpIOXd0VWhy?=
 =?utf-8?B?Z2Z0aTBTM0lHelZCVmtZaGwvcitJc2JWc0IwT3RYS1ZneWpPWW1veWcwQ1FL?=
 =?utf-8?B?SFJtS2lBd3BCNXY3WklZSmFjNDVINitjUlNPOElyVHdOWnUvbityZ3MrWVRS?=
 =?utf-8?B?eStybWtzNk1qM3MreUxNWU50bU12cURJSzZhb2hwTUpmOTJjKzBTN0pvVmhs?=
 =?utf-8?B?TjdMY0x2Ry82QmF3azQxdVMvZUtWVmFlQnVDRWhKd1hKR21zNE5RUUtzNzNV?=
 =?utf-8?B?eFd5VXJHcThQQXhtNGhjT3FHRWRKRGMwQVpFQndqWEQwQWduRGE0OUcyRVJL?=
 =?utf-8?B?SmY1b25SQ2RsUFg0ak5VeTRQMEo2c0I2VHlpYi9vaTVwOEQ1U1pMMmp4Mnli?=
 =?utf-8?B?dFhSdEkyNWl3OWJoa1RUU2RQS0lRNDV6VlNFYnpqTkxTTWVYM1hFRmtlS1p1?=
 =?utf-8?B?aUFpQ1lMdW8xaW5UNGlpRzdMZlNPN1cxOURjaXFVUnNVbGVJZHRqTkVnc0dv?=
 =?utf-8?B?U2pWUllCTmNibGZQUEwxejBQYW0yVDZFWjl3dHFiRUlhUVA2MExhUGgzZUFk?=
 =?utf-8?B?MVoxaUJhMVRycUNJcXRFSVd4WXpFMzh1cE5VWjlhZUlXMVROelp0VTlxVnAw?=
 =?utf-8?B?THBWL0krazFsbmNDMXdQRXdnYmlTTEpKa25sS2gxYmZwWkpWdEYxSnVNWHlV?=
 =?utf-8?B?WjF0ekFTUUYrMnFiMENrUlV2REhYTjc5VmFFK3o3UnVGUk5WYkl5djY2ZjVU?=
 =?utf-8?B?ZHdIUFNUbHh4SzdnS0RRcHczNXdRYzJDdlh1TTk3ZHNjMVlUZnl6OHJxbGZV?=
 =?utf-8?B?K3FJYVlMdFU3NG1jaXBTcFBiS3BPK3AzeXZjdjY1MVBZYTJKVVJvQT09?=
X-Exchange-RoutingPolicyChecked: zMsz7nfHhy648GLTZ3GHVFJcnsAv+6pGagFPcSsAMn9rGiipxe3wzGAKSCjsCjHdysb4FcXL83rtFgUkTcJzgpNmfko/lGbeL1p9+uLhMvkvi7uaRvoAqm9yx53+dlT9CrWqxBDnpQ3rPNY4HYBWPvd1EDA0Hr2g4/iS1O1FVyiuelMiHLECeFXUT6TI0UAGC8xP0JqHhJFSqGmNuDsfg82SQy27EhgpO93vKzApLSshusu2cGTteqzdWLpfTS3+IZ1KDZ4PjCNREqhTa9+eDvHX2MikkrZRVN2KKt46LX/vqWlEAvkgrXdj4Ad04Jv8bCEtJXS+o4I6wC/tRiHBgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2830f4-ea4d-4d71-bce8-08df2445d8d0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 07:37:32.4442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TM4g0NpY5oEMN2Hnqg/H/txVZNt2l59S0QM/LxHcaOIUcpnudXDCdKX/0EfamwWRZoHctHeH88bJqaqt6gvjhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB931270
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

--------------UVIkskNb7W1cgf9B0GpGbbwy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 04-08-2026 15:14, Arun R Murthy wrote:
> mst_connector_mode_valid_ctx() uses a single 18bpp floor for both
> the source-link BW check and the last-branch→sink PBN check, and
> only drops it to the DSC-compressed minimum when the branch is in
> DSC pass-through mode. This rejects modes on topologies where the
> branch decodes DSC locally — the source→branch segment is actually
> compressed and should not be gated by the 18bpp floor, while only
> the last-branch→sink segment needs to remain at 18bpp.
>
> The source-to-first-branch MST link carries DSC-compressed data
> whenever any device along the path (a DSC pass-through branch, an
> intermediate decoder-in-branch, or the endpoint sink) is able to
> decode DSC. In all those cases the source can emit the stream
> compressed and the check against the source link BW should use the
> minimum compressed bpp, not the uncompressed 18bpp floor.
>
> The last-branch-to-sink segment however is only compressed when the
> path is true DSC pass-through; if the branch decodes locally and
> re-transmits uncompressed, that segment must still fit at the
> uncompressed 18bpp floor. That case is handled via port->full_pbn
> below.
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17207
> Closes:https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16640
> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>

Tested-by: Ioann Komarov ioannkomarov@proton.me

Thanks and Regards,
Arun R Murthy

-------------------

> ---
>   drivers/gpu/drm/i915/display/intel_dp_mst.c | 23 +++++++++------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 3be1643f8d03..2e8f4c31e07f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1519,7 +1519,8 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
>   	int max_rate, mode_rate, max_lanes, max_link_clock;
>   	unsigned long bw_overhead_flags =
>   		DRM_DP_BW_OVERHEAD_MST | DRM_DP_BW_OVERHEAD_SSC_REF_CLK;
> -	int min_link_bpp_x16 = fxp_q4_from_int(18);
> +	int src_min_link_bpp_x16 = fxp_q4_from_int(18);
> +	int sink_min_link_bpp_x16 = fxp_q4_from_int(18);
>   	struct intel_dp_link_config max_bw_config;
>   	static bool supports_dsc;
>   	int ret;
> @@ -1549,9 +1550,13 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
>   	supports_dsc = intel_dp_has_dsc(connector) &&
>   		       drm_dp_sink_supports_fec(connector->dp.fec_capability);
>   
> +	if (supports_dsc && connector->dp.dsc_decompression_aux)
> +		src_min_link_bpp_x16 =
> +			intel_dp_compute_min_compressed_bpp_x16(connector,
> +								INTEL_OUTPUT_FORMAT_RGB);
> +
>   	if (supports_dsc && connector->mst.port->passthrough_aux)
> -		min_link_bpp_x16 = intel_dp_compute_min_compressed_bpp_x16(connector,
> -									   INTEL_OUTPUT_FORMAT_RGB);
> +		sink_min_link_bpp_x16 = src_min_link_bpp_x16;
>   
>   	intel_dp_link_caps_get_max_bw_config(intel_dp->link.caps, &max_bw_config);
>   	max_link_clock = max_bw_config.rate;
> @@ -1561,19 +1566,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
>   					       max_link_clock, max_lanes);
>   	mode_rate = intel_dp_link_required(max_link_clock, max_lanes,
>   					   mode->clock, mode->hdisplay,
> -					   min_link_bpp_x16,
> +					   src_min_link_bpp_x16,
>   					   bw_overhead_flags);
>   
>   	/*
>   	 * TODO:
> -	 * - Also check if compression would allow for the mode
> -	 *   in non-passthrough mode, i.e. the last branch device
> -	 *   decompressing the stream. This makes a difference only if
> -	 *   the BW on the link between the last branch device and the
> -	 *   sink is higher than the BW on the whole MST path from the
> -	 *   source to the last branch device. Relying on the extra BW
> -	 *   this provides also requires the
> -	 *   DFP_Link_Available_Payload_Bandwidth_Number described below.
>   	 * - Calculate the overhead using drm_dp_bw_overhead() /
>   	 *   drm_dp_bw_channel_coding_efficiency(), similarly to the
>   	 *   compute config code, as drm_dp_calc_pbn_mode() doesn't
> @@ -1588,7 +1585,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
>   		return ret;
>   
>   	if (mode_rate > max_rate ||
> -	    drm_dp_calc_pbn_mode(mode->clock, min_link_bpp_x16) > port->full_pbn) {
> +	    drm_dp_calc_pbn_mode(mode->clock, sink_min_link_bpp_x16) > port->full_pbn) {
>   		*status = MODE_CLOCK_HIGH;
>   		return 0;
>   	}
--------------UVIkskNb7W1cgf9B0GpGbbwy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-08-2026 15:14, Arun R Murthy
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260804094450.125307-1-arun.r.murthy@intel.com">
      <pre wrap="" class="moz-quote-pre">mst_connector_mode_valid_ctx() uses a single 18bpp floor for both
the source-link BW check and the last-branch→sink PBN check, and
only drops it to the DSC-compressed minimum when the branch is in
DSC pass-through mode. This rejects modes on topologies where the
branch decodes DSC locally — the source→branch segment is actually
compressed and should not be gated by the 18bpp floor, while only
the last-branch→sink segment needs to remain at 18bpp.

The source-to-first-branch MST link carries DSC-compressed data
whenever any device along the path (a DSC pass-through branch, an
intermediate decoder-in-branch, or the endpoint sink) is able to
decode DSC. In all those cases the source can emit the stream
compressed and the check against the source link BW should use the
minimum compressed bpp, not the uncompressed 18bpp floor.

The last-branch-to-sink segment however is only compressed when the
path is true DSC pass-through; if the branch decodes locally and
re-transmits uncompressed, that segment must still fit at the
uncompressed 18bpp floor. That case is handled via port-&gt;full_pbn
below.
</pre>
    </blockquote>
    Closes:
    <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17207">https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17207</a>
    <blockquote type="cite" cite="mid:20260804094450.125307-1-arun.r.murthy@intel.com">
      <pre wrap="" class="moz-quote-pre">
Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16640">https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16640</a>
Signed-off-by: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a></pre>
    </blockquote>
    <p>Tested-by: Ioann Komarov <a data-sourcepos="25:26-25:47" href="mailto:ioannkomarov@proton.me" class="moz-txt-link-freetext">ioannkomarov@proton.me</a></p>
    <p>Thanks and Regards,<br>
      Arun R Murthy</p>
    <p>-------------------</p>
    <blockquote type="cite" cite="mid:20260804094450.125307-1-arun.r.murthy@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 23 +++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3be1643f8d03..2e8f4c31e07f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1519,7 +1519,8 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	unsigned long bw_overhead_flags =
 		DRM_DP_BW_OVERHEAD_MST | DRM_DP_BW_OVERHEAD_SSC_REF_CLK;
-	int min_link_bpp_x16 = fxp_q4_from_int(18);
+	int src_min_link_bpp_x16 = fxp_q4_from_int(18);
+	int sink_min_link_bpp_x16 = fxp_q4_from_int(18);
 	struct intel_dp_link_config max_bw_config;
 	static bool supports_dsc;
 	int ret;
@@ -1549,9 +1550,13 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 	supports_dsc = intel_dp_has_dsc(connector) &amp;&amp;
 		       drm_dp_sink_supports_fec(connector-&gt;dp.fec_capability);
 
+	if (supports_dsc &amp;&amp; connector-&gt;dp.dsc_decompression_aux)
+		src_min_link_bpp_x16 =
+			intel_dp_compute_min_compressed_bpp_x16(connector,
+								INTEL_OUTPUT_FORMAT_RGB);
+
 	if (supports_dsc &amp;&amp; connector-&gt;mst.port-&gt;passthrough_aux)
-		min_link_bpp_x16 = intel_dp_compute_min_compressed_bpp_x16(connector,
-									   INTEL_OUTPUT_FORMAT_RGB);
+		sink_min_link_bpp_x16 = src_min_link_bpp_x16;
 
 	intel_dp_link_caps_get_max_bw_config(intel_dp-&gt;link.caps, &amp;max_bw_config);
 	max_link_clock = max_bw_config.rate;
@@ -1561,19 +1566,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					       max_link_clock, max_lanes);
 	mode_rate = intel_dp_link_required(max_link_clock, max_lanes,
 					   mode-&gt;clock, mode-&gt;hdisplay,
-					   min_link_bpp_x16,
+					   src_min_link_bpp_x16,
 					   bw_overhead_flags);
 
 	/*
 	 * TODO:
-	 * - Also check if compression would allow for the mode
-	 *   in non-passthrough mode, i.e. the last branch device
-	 *   decompressing the stream. This makes a difference only if
-	 *   the BW on the link between the last branch device and the
-	 *   sink is higher than the BW on the whole MST path from the
-	 *   source to the last branch device. Relying on the extra BW
-	 *   this provides also requires the
-	 *   DFP_Link_Available_Payload_Bandwidth_Number described below.
 	 * - Calculate the overhead using drm_dp_bw_overhead() /
 	 *   drm_dp_bw_channel_coding_efficiency(), similarly to the
 	 *   compute config code, as drm_dp_calc_pbn_mode() doesn't
@@ -1588,7 +1585,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 		return ret;
 
 	if (mode_rate &gt; max_rate ||
-	    drm_dp_calc_pbn_mode(mode-&gt;clock, min_link_bpp_x16) &gt; port-&gt;full_pbn) {
+	    drm_dp_calc_pbn_mode(mode-&gt;clock, sink_min_link_bpp_x16) &gt; port-&gt;full_pbn) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------UVIkskNb7W1cgf9B0GpGbbwy--
