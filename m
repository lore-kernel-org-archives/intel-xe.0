Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C302AFF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 21:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D84F10E031;
	Tue, 28 Apr 2026 21:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWJOpdYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEB110E031
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777411676; x=1808947676;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=u5Hw041ffsskBEXrOf+oQMQSEfhTOeAH4NGLuwLYE8g=;
 b=NWJOpdYZhQ0Mt8DX81W0jvd2Bn5azrbYFPWPcLKrRrdVbYgGV+29D9Hf
 166aVVdQ23k34ALb55Yw0QDXUOwUuvExMNDo9oMTeZP1JD7efmDhikcMI
 lG7gMOBWNL36FjSNzffiWdfKguV7OQr3QJXovai2ZLX12otwKu6h7oeDc
 Rsor6nxakwuty7wA39w976wGYmiF7x65uPZ81KSgpog+6Src7ru0kxT2E
 RADXL5S0NL0ldT9VLwiEEm2PISjjAyi7PIqNUX582COarO1+ayD19qB4P
 +HshXmkQGXy7SMmUVk2To+m5TuucQOGSkOUbkvFylB4QoSBSCvgL3JIIi w==;
X-CSE-ConnectionGUID: al+Z66GkSpai7ZEqMVmOLg==
X-CSE-MsgGUID: 2vMMD9qiQjuupl8q58V1aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="100995868"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="100995868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:27:56 -0700
X-CSE-ConnectionGUID: H5Qop3YoTTOR8r98GhmM3g==
X-CSE-MsgGUID: 2Txx+sF5T0qVfj71B0/N+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="229718109"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:27:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 14:27:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 14:27:55 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 14:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt+1rmmiVZihKzvQlfMM5Mg6yQNUYfF879UyswoEOQk5xX3YWCxtpKr5Hfj5GO75NecUX0ES/I/V12Y0DTlGOKhfD3sx0R8zWZpybOlPT5MX9AT7iCoEOggcpo1fB2tjWfdZQBo1Xdarx+86GwvJ0qaHUToE1rxzzNXiCTRTxc5KIks80z+FuvBmPm4+4U4BILIAeaT2Sx7+8dI582ayg25KwcBMdMVbC1R0XE5m0HAkXSieTF+JN9PEV01h6eUuehMl0eKNSShcN0pJKhEUCrWBGyGzbxMKOTikz3TGPPiLVPqNnpzWUG910+O6HTA97qvWhcg/kBPzvnyUqZZDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15tAMPyLet1AxEpFKBY0sONre0pq8ZWEiAsbWzFHCAA=;
 b=hrKBl62MGs5SG2rCmhzIrJgdNqYUwZTOXnDczEG9xTX4V/6Y8mZghB0MoBJYjQNYir/kmIJQdro71fkMBZNI+6MPNA0aB2RHVHFI+Cba28Udowy/fsP71IXTXA3pAQlz8UYg+rZX9dO85Dr79C6xzF9tw6aYs6AbcywF5mHfjPZ7/HnJOMR5Z0D7/CCyB8W5sX37IHa55Qgp4I9uzvAh8SpWpqOH3ZZldtKw3ptT8bTJekqHiX+aqjyAx7C8fQI8cWbK3FYZUB0GxbuWiyVf9EJ9HPhewpkf1LiVUb+fChfvHjXEQskAFv0WJlTKzvM+KqC5/hvsyn8Oq3/Nwy0wQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 21:27:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 21:27:48 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>
Subject: Re: [PATCH v2] drm/xe/pf: Fix EAGAIN sign in pf_migration_consume()
In-Reply-To: <20260428201448.3999428-1-shuicheng.lin@intel.com>
References: <20260428201448.3999428-1-shuicheng.lin@intel.com>
Date: Tue, 28 Apr 2026 18:27:44 -0300
Message-ID: <87y0i6ojvz.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f6e432-0318-4505-7b69-08dea56cfefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: r6tV8oVrfNm/ptmwMp8dwkzapQzuDGT04i6QHnLn1LGf33YrDv42Fjm67nNhQanM8lY9ahjXgf1IKJIy0qdeOveh6vW05sc7p7V3EInydEHUzvGaqnvlTvuyc500I4EwYm4R+LTtc9kIdjkOchhyu5q4CPn30jMBFyh86PBs+P51LpeiB9Ak4aeXcXyv+M/NsFNR8o++YYPWLY0bvZNCWvZDRRmzRQBR81iGNAzhEvGfJbyeymoTnMxz+Pii89dPDiLaocxtLXxMLoo0C5VUd7BQkr5OosUl2SlOg2JrUNp7uf47mrHent0PPvXb+AEZT7LZqYq3JWlMRyVSZLGRmPjElpqEyaaYDRlbKMOeep2fn0Qemi67UqKNeCi0gDSIP9QupER3gYHWz/vvd5LyzAquy/0BN1b55jp0oqTHOTuxNZqlydCjrDnoSiDG6qImC743U2Oi90bh1xc7Wma4XtbHlLP+gqmHve7bz0APIudewohU2z53y8Rj37fK3eUHBkEN8tNc4n2SlIpMsxvPkeMp0++tXmzlQx6nqikIFpJVXGjKLsHYr7DKicB3BazeuiW4Qbfj8WELMWpeksn8v1Kx7gmGIeNMp5Am24sXiCDssvs9Qy35XGsEMFJhOOu+2nRc3OLT70wEobLqe05B0ySAtxWB4/WD76bM66xPCQgB6uq8JeX/FhmS6BquFZpnfmBU6eTJfkf/47mxcT12Yjoo06XHbcFGNyOkREbJ+98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEM5Q1ZFbmtjVGdNWkh1TGZCRFVGNXFxTlcxTnQvOVBiZ3NMalhCZ3llY2pV?=
 =?utf-8?B?ZnFLTXU5NHV0eG5BSkZ0NjlvMjZaelhoU3d0NW0wSHdydEpXSkNpM2IwK2xt?=
 =?utf-8?B?UmpGald3bDBNVXVIRG8rOFNWdDJrWld4Q1dSVWZTYlFlSW9KekZkYWEwZzNH?=
 =?utf-8?B?UXJxVEFNTkx2VmovbkNjZmEyais5TU81WHVwZlBRZVFDKzIxT2Q5WlRFMmFT?=
 =?utf-8?B?VWZDL1hvYlMvUWgzMDZPTG1vTHhiaGUzUU5tRldaaEdkd2I2dFpUREc5cWpO?=
 =?utf-8?B?RFJWWlRqeWxVRDY3aktvdTJrSDhNK1ZUQU82QTZISDZ6UEVsdGkybWRjbEJU?=
 =?utf-8?B?a3h1c3FlUjcrdjRwdmpKV05UbnhITmUvNlIzdzNkWkZpdnNLRUc3TDFSTUJT?=
 =?utf-8?B?UFRGS1p5Q3NUYllRRHZPMVFZNkpNMmMvdWdmbGJKb3NDQlFvUml2QTIzRE0x?=
 =?utf-8?B?VlhkVmQwVHFrMVNNcTFGamdOS24yeERxcGhtS2QvaTZCV3NyMEpNbXh5Wnkx?=
 =?utf-8?B?cTNVcW5HWmhZTlF6Q1VuNWxYSUgvT25OcjY1cG5GRHV4ajhQSStKYmhTN043?=
 =?utf-8?B?NGl4NGlpT09DYVo4OElxcWxYQXBYbk9pc0oweGJXWnh5bkpVRG5IQjF2bHh2?=
 =?utf-8?B?UGpwQTJiYWNVMGU3d0ZSNHo4ZXMrVkgwVnphMXBFVTF1SXdiK09saURrdGkz?=
 =?utf-8?B?cjN6UU8zbDRob3BaNzNjbUV1UnlGcWIrenhickc5aVNCcURuUWlNN3M2SnFk?=
 =?utf-8?B?VURYZllmd1lTSStWVndPb2JTTzZTVXR5U3NiaHJZS3NIQ1JjUHJWVXJZVXFP?=
 =?utf-8?B?SnVDQXVFNEZSaDdGdlA1bDZwYVA2RnMxWGxNVUFXejhiZ1o3VCsyTzdKU3V2?=
 =?utf-8?B?TmN6YXVGRHduNVJDdUVvUk1aQmVsUWtnMHc5ai9QN0JWa1ZuNzAwZFRXcU9P?=
 =?utf-8?B?V2pESDhpNEdHSFpmc05DR21YNEQvZ0VxSXlwSDE3M2dxUTRmRGtrd2pDZnNX?=
 =?utf-8?B?Szh2UXhLZGlJaFJHYXFxREFBd3htSGlnaDNlNUtOdTNjTFhlMzBWZUxtTjIy?=
 =?utf-8?B?UnYvclJNT1BGc254SnRGenYzYVBnSisvNnVwZTlUbThPOXF4Ky9uMmNKV092?=
 =?utf-8?B?RE9UNGQwUkFMVFc5TXAvSndqbnVkaXNYOE5JaWlKYkVMRXFwVDQrVDNVZ2lv?=
 =?utf-8?B?dWg1cWgzZWlJN2cyWmtVcDFvRzhvZXFRS3dzRnc2Ym1LUnBDWVpBclFWYVU4?=
 =?utf-8?B?c21ncllMM2dxVHdtVjB6SEMxNEVmemYrVVNIbGloYlZWckYvdUQwdUoyTytT?=
 =?utf-8?B?cXFZTXoxdlZSRlZUTGJVQkhEK09udnhKdWNDTTU0a2E2R09Nc05vTGxsYStJ?=
 =?utf-8?B?SkE2WHZ5K1RkY01VRFlXK3I1Y3lVT2pWa1lOSDgzMit5RzVnekUzTmxYbm1l?=
 =?utf-8?B?U1pTTjROUC9pTmppK2dGUmY4ZHpURExnUzdkZ0lBcUduZFJsSVNLckwrUHVk?=
 =?utf-8?B?WFRtbmxtSVFGWjFrZEVWeHdZNmtNcnNiMFExKzJlZEtWVk1qakp6UngrWENt?=
 =?utf-8?B?QXpKbHZibjQ0Tmk1bUZITldzRXZwYU9XeksyUGl3citzeWFhQm5FdFdFSDNJ?=
 =?utf-8?B?M0NjQUNRRmxZejhtY2E0OElLcERwU0E4S3pjem4zcjhNYnFBM2tVV1lsS2pi?=
 =?utf-8?B?VThzMm42VkJZeWpqMWk0eU5oZXUvOHVnU1p6cS9qcmtyeWZlYUhBT0xaWjRa?=
 =?utf-8?B?WHIzcTE2ZnYxNW5CNnpOUTN0T0d3WHJad0JONTRDVVdENjFraUFKS3lFUXNJ?=
 =?utf-8?B?ZFB5MWJ3eENmWnZCU1l1SEY2azVvRTdndCtOWURqZGgzeWVMZC93bUxBOS95?=
 =?utf-8?B?aDFFSXVIR2t3Uk5UY3lQei9neGpiU0hCVkxSSjdhVDFTMEJFd0E5YWpNWG1J?=
 =?utf-8?B?aHNwYW5VT2g2dkJDL3UrdmhlczFzdU13bktXNzF1cGQ1WlROYTE0a3VOTW1m?=
 =?utf-8?B?elBQK2xkdmhnWUpYL2JGNVdYRCtLNE1IRUwwZ1NDc01VNUJERnBwczlxa2N3?=
 =?utf-8?B?d29aQ3FuVVUwT0ZtTkFVUUVrVEZjem50QmRxMGhqMkVwa1hacUNzMVdNVWp5?=
 =?utf-8?B?b2gxZmVWMW1SbTQ1RGk5REVXQnYvTWZNNTkwVCtMdmVIdzRoMEFCbkZCeGw2?=
 =?utf-8?B?Y1QxUkdOemszWVlBcmFEY3p0dEtOaEluNlpFVDA1bE9jSDZrWG4rM1ZCRFc0?=
 =?utf-8?B?c2tnQTJrNHFrZVk4OGFKZnV6eHUvRTN2RWhqV1ZDaXo0dVlsdWpJK3N1U2NU?=
 =?utf-8?B?N3hISi90VGtiSHVSZnNoY1l5SkxXa2JEWnpJd2V3andOZUVLbzByZz09?=
X-Exchange-RoutingPolicyChecked: WC5qGn3SGs7CvB4bhdG2oY4QPQpNk5vPAQtLYSrePW75hUZKXBDsvk3FxT1MVZhgkGmaX8KhKR04R/pZ+UBUdKcqC8ktVMAOKN27WxKw7qE74N3KEqKI6N+jry7YPf1xPMdn38TYtYjBG7nD/c5n9REA5elKwYtPdzWtEVLin7yKXm/SH+poFT+D9OHAiWMOiVjDQ/js1usUhHJ3ar/L8ssQsMBsV0JLsVZeiVMaTvsUyYKtdvAKEBL/FxMUS0kJegtWDcohw38DcclDt3bylEDou2Ez9M+b6v7Z/fSr9uFD399os5/4uSotYyveDZei0RwRQ0Np5aatks0vus/bfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f6e432-0318-4505-7b69-08dea56cfefc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 21:27:48.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LRzxrhE3768aosdXF26eBYWAvd96lfUhnsoBLxZZTNb/MEFtqcsiEEDGZMHjSCfjBLwtg+C1qJFtGXPU1w5IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
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

Shuicheng Lin <shuicheng.lin@intel.com> writes:

> PTR_ERR() returns a negative value, so comparing against the positive
> EAGAIN is always true for ERR_PTR(-EAGAIN), causing pf_migration_consume(=
)
> to bail out instead of continuing to the remaining GTs. On multi-GT
> platforms this can skip GTs that already have data ready.
>
> Compare against -EAGAIN to match the intent (and the following line
> that correctly uses -EAGAIN). While at it, gate PTR_ERR() with
> IS_ERR().
>
> v2: add IS_ERR() guard before PTR_ERR(). (Gustavo)
>
> Fixes: 67df4a5cbc58 ("drm/xe/pf: Add data structures and handlers for mig=
ration rings")
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm=
/xe/xe_sriov_pf_migration.c
> index 6c4b16409cc9..150a241110fb 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -149,10 +149,11 @@ pf_migration_consume(struct xe_device *xe, unsigned=
 int vfid)
> =20
>  	for_each_gt(gt, xe, gt_id) {
>  		data =3D xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> -		if (data && PTR_ERR(data) !=3D EAGAIN)
> +		if (!data)
> +			continue;
> +		if (!IS_ERR(data) || PTR_ERR(data) !=3D -EAGAIN)
>  			return data;
> -		if (PTR_ERR(data) =3D=3D -EAGAIN)
> -			more_data =3D true;
> +		more_data =3D true;
>  	}
> =20
>  	if (!more_data)
> --=20
> 2.43.0
