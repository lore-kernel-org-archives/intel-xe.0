Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02417C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6A210ED2E;
	Tue,  8 Sep 2026 18:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/vJFoW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3BA10ED2E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788892683; x=1820428683;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ToxZFOkuwZdEC13GgubF4Je2drvQYfofH1W6AIg6RSA=;
 b=d/vJFoW3Ab3Sz6jyAg2QaoU159exlsYq0IPlX1r7NA4de/CIOJx0Y0+d
 d4VgS8Dlm1Amwcz4NrAgdrcvpte1/2/FEz2XhLJCjvacH740FRHm2hcN1
 nbM9iWNa15vYuNgGr1OcqbNAGXXmeyU4fdZsvNq7HOR4KH3KtsFTUV9R3
 /0NBJwejdhWE01h5/IBtsthhxPrxg9hxKQKrJxLl4rjZruPgSeJk1wlvA
 dUK4bKJOZaYVr1a/KiWE9LLvw6fiT18kBDSTWgX6SpWZhcg5S7BSVoVCn
 l63Y/PO1w85Y5R5Tkh3kw2a06+8u9Ky9hXWYP1HqKB2P9vMkbKlG6U+ZU g==;
X-CSE-ConnectionGUID: SRKGWLduTHOh3CqddPIdmw==
X-CSE-MsgGUID: SKq2nCz7Tsqf1ZejHT3tIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89231478"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="89231478"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:38:00 -0700
X-CSE-ConnectionGUID: 99elajePSLm6DETKY34k5w==
X-CSE-MsgGUID: jO4ra8WgRICs1ewT9XTlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267836484"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:38:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:37:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 11:37:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWfuNSUbllPeY6KB0/nvVyx5k7F+S7jq1Tg3t1OvCdn/M9j8HqJEP+X2gk/Ao73FmyL8J4p87i9oL3hdWvFZGIAztSncUt6Fl3vAHyEaywl2H0JuvDDLldEOrZuG7lndW41R2UOAF2ccO5JPhHo5Opab+WWybzmCcAVpVU3C259E1u4m3BU4JZjcu+qX3LFEWUhtl3D2EGpBCKnMZnkhpIdX6pCQLJ8auSUpTO+jecRAz4fFV7Aj0i2+5DjSTDx8F6CCLvZ3Irn+hcpuWk3DFO1vy0G2o1HBq3fDIO5w7iXqBlB5Yaki70piJF92bAielqT+moYVcCxGp1OjHXDSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VXTmz9ewcvOW4NdoR6vy/fwk/HWiBm3ts7XiYZK2W8=;
 b=guEcpfL5adK/3JlUm+RCDPZ6lmU1cCo+l/pN/VCUwJtGix+ca2U00CGbBz7NW9sy/MNfvb81wWlDaksw/cD6kPv0A5lb7WBUoRnAPIkUTXefIY+DdclVv/0+RJG4B+GR0k/xDeSIRrzGeUZsW0rSWkFLYi/Z2nE3QQVuiZpF6gw1ZYDcjmDDaKgG9GovAKijzaABriGnB9ShNRe7knw+vsFpkcR+VjNdIkB0Tc+BWcDHaf9G6t+SWMycbJxG1CkRGH9gCSEOikQc33/d2+oG5TBzOYjOo47z5Y4GexhlMswWubw+3LbOt9uiQSHVpeAVbIKM8gLD0GSDPhShq/XBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 18:37:52 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 18:37:52 +0000
Message-ID: <0425ad1e-6ed9-4fa0-a768-c5d0871b1bb8@intel.com>
Date: Tue, 8 Sep 2026 20:37:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] drm/xe/pat: Return error from
 xe_pat_init_early() on unknown platform
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-9-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260908104550.1283933-9-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0040.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::7) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b48f23-6e44-4d62-f207-08df0dd84a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: C1Lq4C957AVHGh8TkEDN6/6scxwwtP6hjQL9E+LiO+O13FR1kJAqOdvpe757fnhFRC+M4bqSSSdWi9DuHf+ZDfwx0/Kaqy+2tnx34vZZ2ywnuNBy4srI51sQcgf8j/27eXl9mgi+2qTDrAARWtRo7N+0zEpnA0Hu74rH+zRkYhzT0Ylv0Aqd/lmiTB1BqMxI6HzbgsSLw3IfmJuSeaPxYNAldAy66Sz6JXa2VieDRt0JifY+TUfl/bcvnlE3zuYKID3+RnV9zU7nGQy0FPaz46IhNjQpKe8OaoGIABLMSwmkACHjrHy4cByMBIDEfwYEUa3jjDf1FfX9vuwx9cbTecWatNIzDtE9wI/jRs/1EeaKoXEG5cFzmh6aQDSGkloriuTfkSl8UIyOtxJiUgiZV8VXo2fzuWoAqde/OfUjG+XOwbV69DP0r94C9GNVirtdOkCJmXuwVWT5khz7RM8DZGgNoj0ozMvcPxeTrC6FGld7hOQbbhkYnbxdxnzD5lGnwTHdOGx0ssauDZ0PfcHC1T62lbw28Hc6CO/CySkTsPhhgZeJH4C08CGpRCO/GPJoyzX/ztey4Xga/0AuQc21BwYbeHz94dH0EIzKKldKVBAygMVCXopVU0uAXo8Zj49OXK4kFxf5wegdTpA3PMR40UUb6iviN6R7XQqefW9ZoKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ljeE5LL29hVldiOW9oVDZGNVNvM1dFQ01xMUFjZlNFRGxyQUpaTDNBc1lv?=
 =?utf-8?B?aWs4WjZGM3VuN1BIcG1vdDIzWXprMTVXUWd0b0JVNU5yYzVtcjQ5QjA4V3Q4?=
 =?utf-8?B?RklRUjlKUmwxSlNNT0pUNGhrU25OWkgxSFk5NnlFVStkVHphbzlCS0ZRckly?=
 =?utf-8?B?UWtWU1ZxdkRtZW1HWm1aT1Y1eHQrMkw4UjVzTk1NN09VU3dJRUdJRmxsV25q?=
 =?utf-8?B?aHdMSjBPKysvdERtUzRQZVZQTlZJcm1IbjQvSjRYVTJaU2t4TVhYa3REK0Vq?=
 =?utf-8?B?L3Y0ZXVSZ3VPNC82V2QzZzNXWmRObWFxVWlRNzZzbFFNcFdwS2VoaGd5Zm44?=
 =?utf-8?B?dGl6M2c4di9VZ09jQ1VRdENOcTVpTURMbm4rNG5hSXNtcFo4V0k0QXJmSmFC?=
 =?utf-8?B?Q0ZrWlJUeDVQR0wwZ3A2VVlESWl3dkppMjhXelUyWVpPYW1XUTlwTzJEK1lj?=
 =?utf-8?B?QjN2TmpjbHBoeTlHL0lQeTArNUtpeDVoMk5pWEw3N002MkNDeXVWY09BeGpv?=
 =?utf-8?B?WmJLTndJbTVoMjBiSk5ZRmwxOVFvZlBNQVB1Sy84VUg2aHpUSjlzdXZzZFZx?=
 =?utf-8?B?K3ZaVnh0aWFzZ0Fua28xWVlOMzNoVkxKSWJ0OUtpd1dIbHNaeElYbmpwSngv?=
 =?utf-8?B?amcxcUFNT2FQSHJqRmY2SGlYY1FzZnhjOHJWeGU2U3VENUtxSjRQdUpsa2Zv?=
 =?utf-8?B?Z09QNlhTSU1iUkR0Vjd3UnhuMUsvQnQ1QkEzMS83d05jV1hpUk9tSVF3ZVhi?=
 =?utf-8?B?VWl4aXBJN3ZDR1k2TU5ac05idVJTQ2c1UDNuOTVVVEJ2NU5pdUovQTB0aHp6?=
 =?utf-8?B?RnI2TTExUU04eDg2UVhwSkwvL0JDL2NxWVczeXlUa0xGcmdlQVNVbzZIcHhP?=
 =?utf-8?B?ZENpQkpsMXc4ZUNHOHFsVVQzdXFRUURtekU3NVpzQnhIaGFiUlozdS96TDgy?=
 =?utf-8?B?L2NkQ2l5ZmVEQVJJRlB0R0Y2NkwvTE1USmNvdW1KUkdUYWN0RVBldjVhSGRl?=
 =?utf-8?B?cFN2Tm9aVzlndDRvVEhuQTRMbVpLWnVYZHczU1ViMlRwQVhadGRBYjJyRGE0?=
 =?utf-8?B?aDJhbnN6Y1VZUUJyOWZyZEZWY0s3YjhnMWwwc3VWZnhwemFXRWtaZUd4N3N5?=
 =?utf-8?B?VGlydVFaZm9WL3R1S0xiNCt5NUxsTXdkVHdNSnNlVHU2TXNwNHB5b3Awazla?=
 =?utf-8?B?eGx6dlJ1UnZCbCsrQi8ralhQMVBWR3VZOUNVQkNQbmhCVUtiZDB0bTRwY0ZE?=
 =?utf-8?B?L20yMGJZbm9ZS0NIU2JiU1JpRTFGRWZrVTZRSHE4NllzamxPb1hBS1E3dEdZ?=
 =?utf-8?B?TjRRVFRUd0ZJR21OSXF2YzZNQWlzSnBGQzY5RXVyTGVpcXdZODg0L1ZkazBz?=
 =?utf-8?B?Q0U0bHNQTkhnUFpXZkFWN1crSkFPblZvTkF1NmdSTjVTL3VEUFVGYmo1RmNV?=
 =?utf-8?B?WTBkaTVTK2I1UnZpZGVwdkh1enpLc3EraGVuMEZmME0zT0xzTlhLQS9McWc4?=
 =?utf-8?B?SHhmZlFhbm5xMm0rNVFHZ1RGUkhseU00Mm5NRHk1cUZ0YjlQaEk2SHRUQVZj?=
 =?utf-8?B?MXRWcnE2akJLVVdlVk1CS1F5QTA1a2NSZCtFNURtLzQyWnArSHFvUGpncXdO?=
 =?utf-8?B?VnZZTTBWRTZYTkplTDg3MmltOWt1KzRjb0w3YmlOei9DbmVWNlRHMGhNNytl?=
 =?utf-8?B?OTk2ODVoYnFJNTdiSCtScWNSeGdZVjU4bGNxWFRYclhNa0FWbyt2Y1h5djgv?=
 =?utf-8?B?Ynp2a2hNZG9wSU0xb295QkxTcERDMWY0L2FrY3VUc3BaYWJRekxLSGlvMngz?=
 =?utf-8?B?TTVqWTB0UTF5eFpTaThrRHVDcm5tTDhGTWhzR3NKL1NHT2hDM0V2N1N4RkVB?=
 =?utf-8?B?ZjE3NDRlUW41MGo5WFFKRWpYcWtTWDVCYUN3UUdoTDI1MzE1RGlOUHpIdGdo?=
 =?utf-8?B?TGIxeGtqamREVTR1SXNXUVlZeGZ3Zzc3WjNVSE1HQyt3ZUx4MU9JS25RVnc1?=
 =?utf-8?B?N0daNjBVVzFlNEs4eUFoR0FoeUFjbU1nNWhxTk01SVpidUZYYkU5RlhOdlU5?=
 =?utf-8?B?Y2l0Tkl2UG9JSm91RElRVlBmUzQxZ0tVdS9uZUpiNmlPTXd5dEdKeHM4OWk5?=
 =?utf-8?B?b2RNQUIvUDNUSS8xaG9hLzlsdjZ1NXRvNDBNNStSNjgwckFrOVRRS01lZmh0?=
 =?utf-8?B?L2JVbmhJbkdYS2VVSHB3RmpqeWhGbTU5WjBQVW5DSHBFYmQ2SEJhVzQ4Mzhr?=
 =?utf-8?B?RUp6dnUwMi9sVHBhR1RKVlE5Q0MyVjVERlpnbG5PSVd0MCswdlpvYXVWTnBk?=
 =?utf-8?B?eWgrcUZnQk5ydUFqRzFYNldjTUljbFFZTk13WmEwVFhTR3N1cXpoR2hHb1pp?=
 =?utf-8?Q?t8gBQL6vnvSvmIus=3D?=
X-Exchange-RoutingPolicyChecked: iw/V9cmYxJdYgAuGuxQZ6gCr2NF8HOcYBh2xHCr//sM8N9P2xG6ID8lv86wf7vPR+VP45xSltLFzPZOWunxhFeCpK42WIjwo6s/gxCa9lCae7t+6rIt8dpkEagIH/+V0PVwgE6qgDXdzzN1jbQhjQo3HCzKBmp+68TEiZ0tlz0pqMGFnaxPxeYwy+edDdFIbAh/3EJMxP7iVsHh7x/YtLQLthCU7ywTlZAnKEsswvTGs7JKU22oo/sgPRyPqlQ3gW3vkieTMm8P5jldXemG6aNARVW/MDC1w2oT3nhOPlQBycgeau0q2XvDmJOuLCCjYIM07PwLGrBdDYZaeAYKYng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b48f23-6e44-4d62-f207-08df0dd84a8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 18:37:52.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhTUQYZ1Vk2JQcP+ebKmwMte00cOLLhwsmPTZvLBHocUmHqO9ECuYZIDBjNHdsQ2kVJgdNoXkqDSrsxrGa1XaCXckktk+wHxNVbqNrhs/rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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



On 9/8/2026 12:45 PM, Dnyaneshwar Bhadane wrote:
> xe_pat_init_early() currently only logs an error when the platform's
> graphics version doesn't match any known PAT table, but continues
> probing with an uninitialized pat.ops. This can lead to a NULL
> pointer dereference later when pat.ops is used.
> 
> Change xe_pat_init_early() to return an int and propagate -ENODATA
> to xe_device_probe() so the driver fails to load cleanly instead of
> continuing in a broken state.
> 

Fixes: ??

> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  4 +++-
>  drivers/gpu/drm/xe/xe_pat.c    | 14 +++++---------
>  drivers/gpu/drm/xe/xe_pat.h    |  2 +-
>  3 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8583b2e9ecf4..b7f78d45dee1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -960,7 +960,9 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> -	xe_pat_init_early(xe);
> +	err = xe_pat_init_early(xe);
> +	if (err)
> +		return err;
>  
>  	err = xe_sriov_init(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652..8af92e3c4c17 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -590,7 +590,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>  	.entry_dump = xe3p_xpc_pat_entry_dump,
>  };
>  

now it's time to add kernel-doc
> -void xe_pat_init_early(struct xe_device *xe)
> +int xe_pat_init_early(struct xe_device *xe)
>  {
>  	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>  	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
> @@ -678,22 +678,18 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.idx[XE_CACHE_WT] = 2;
>  		xe->pat.idx[XE_CACHE_WB] = 0;
>  	} else {
> -		/*
> -		 * Going forward we expect to need new PAT settings for most
> -		 * new platforms; failure to provide a new table can easily
> -		 * lead to subtle, hard-to-debug problems.  If none of the
> -		 * conditions above match the platform we're running on we'll
> -		 * raise an error rather than trying to silently inherit the
> -		 * most recent platform's behavior.
> -		 */

can't we leave this comment as-is?

>  		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		return -ENODATA;
> +
>  	}
>  
> +	xe_assert(xe, xe->pat.ops);
>  	xe_assert(xe, xe->pat.ops->dump);
>  	xe_assert(xe, xe->pat.ops->program_graphics);
>  	xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
>  	xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
> +	return 0;
>  }
>  
>  void xe_pat_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 7060f66e1d63..66e335fb3b0c 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -43,7 +43,7 @@ struct xe_pat_table_entry {
>   * xe_pat_init_early - SW initialization, setting up data based on device
>   * @xe: xe device
>   */
> -void xe_pat_init_early(struct xe_device *xe);
> +int xe_pat_init_early(struct xe_device *xe);
>  
>  /**
>   * xe_pat_init - Program HW PAT table

