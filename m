Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CF1C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 11:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D7410E2B6;
	Fri,  7 Aug 2026 11:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXGCWoZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C25310E2B6
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786101505; x=1817637505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=IXdBduLQ8EUlYzRdJ9DarLn0t7+AVdeoZvdeI6AebOE=;
 b=LXGCWoZtlfFAnrwM0Rk+/Z9K4nwJYZeFRXpEzWVzIY+5jpfpAuxZLuUU
 U8nFxJireBskVZWH1O+CYhBBeTVy5AcDGPJETP1i14jPx3FHYd/Dfd4q5
 cnRIpLJPl82eIK2C7zvUZ0+IY7dWwS4eNnIE6qI/d/RaZ7KsjaG8JLMWJ
 asUy8x/s+3oz0IVBWHIpmvgnvRkIX+mqkX3MlscvD1Vd/2h4lTvrQuWjK
 RqLxEVvDFLbG/BOWlBcGPQuz8zhs05GsJKDMtLu1wWVd1z+iQy7riEwKs
 r/1nQ3p9H0UnNJD2vXSB1kG9LjVKB/VGszFyHJZByMzHw73CuIIknx91F A==;
X-CSE-ConnectionGUID: H6feu+J3QSqqRKHd7qspIw==
X-CSE-MsgGUID: kLB3opK1ST2PPXuQZqLSiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98067823"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208,217";a="98067823"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 04:18:24 -0700
X-CSE-ConnectionGUID: EOBLZr+cTzqckTjer2FZHg==
X-CSE-MsgGUID: V9ouRuQZS4iIqCENRj3j9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
 d="scan'208,217";a="287055160"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 04:18:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 04:18:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 04:18:12 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 04:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu+k8xGgGN6RxRFNAfDYRXPi314HjsGUwP3R3IRxlj0ok+eOYnoKyh35jcuu+DukuXgVTSNESZ56dS3kr7mgVeIKDwI8Oe7K+wNMv8Qmc8A4n91I2FcVeo3Mjhl1jPFcAKzSueVyWkF7LgAlymBGWvAZ/DZBGvcxj/MeT0c1llYjafyGsVmFFiAPbLqAjK6+UmtMAhw1dfpZVPqha2lbgiFG5+Pqcd3jAmQiQ3CMWw4YuXKeCaIjny0yskg5GSopmbObKGEbLrt541ufNi3U7f15SMoGYaDFWXCA9EBO7vd7jcSdwW/mtN9FSTJqV0dRELATOvXbr9GOgjlVIqqviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GNLEXaFWAu1En/U9+Ww0y2CrDGKwYUS+n+GO+Dyzis=;
 b=nPvH1v8nMGZx4/S0EU3i09K29YUFJbbA6EYfyfxSI98c2bbWZJcIuKLEiTW6MQhggH/XYSD4Fbbi0U171epV1qPr+TQjdwo+agZqSBbaD5Pn577lhDaGa3Z+QlBj4tsTUjeOb+ZWsJPi2s7FPfLJKSAqD6s70Eqxb+NaKb3P2mBMOaG3h53VZsbv0LScPI4Q0anYlTgGlegoOm+HgVKR/lEq4tWYXd0HrtQrypBTmGJskN0pJh9MfQIfaNUQoLQWE/nu9krge9lpmONFv16YwFEuiiSXUu+FHQ2/cvi+rBiL/hK7nrYp7J51zwzsZFCL9tjbIeG5VtCewQzNbuOFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB5013.namprd11.prod.outlook.com (2603:10b6:510:30::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 11:18:10 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 11:18:10 +0000
Content-Type: multipart/alternative;
 boundary="------------PY3Ite51GDvrLac2KSBi6H4z"
Message-ID: <ca3dd4a6-91f9-410e-8142-53256de9e817@intel.com>
Date: Fri, 7 Aug 2026 16:48:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] drm/xe: Report 'Survivability Mode' errors using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-19-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-19-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c79a21-4248-4e2d-faae-08def4758ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WhhDe8tng/I/YS8OGl9+JxuN5AfnF5LpgBRgpnQY2CybadGVmLmUsE/Uy1W/c014Ls9M972r3KAYuPObCA47FFP1dGsW3tS9rx5cUCqiPH50xb/2rPDvXTj9VoHrTaQxNufUYeUeUvdOP2TDcT6Kdcge3sSm2MGqUghpualjDIg8pRdgDOJPxPDculCKF5EryFT12pEl2HeDKuJ2ATlBMFpt6FFbpiDsESTDL/Ym+QsX7rNZvmymFgdWkioyxBQqgNNq370bsB3zdBKRT9IXGRQ3PlRyk90AkOJL0TqsmCxwOUlFSvz/uBGm2y8xRuPnoh8LtF7R3LbkXsX1+px4pvo0GXGRL6TCAR7/KIXsKgZjqDw8C2tpvSMeLvszkiQeR8fiICdWLw/CX1ygAtfYSs5rQwpfkeYDeXBicpdl8ieWf6k/ksCBRlcV4dDR9Rbe3oFH6EHcMSHWFVIVyUwvVHd2EdWzJKuEaBFOTWYkElp/cCwM5vNSX1XLgtSO1fDwkUpgQauZiVzVdca/OjgO5dMGtutbSzU2Llxcfgn1xHYNAqlGt0jpbHeRVoA+uj0UL+BH69jZfmS+W2tTtlcfgqe/cLeL6oCz70Ui41r9UpG55YxhIKgTbJ6UwDgB2q34cYlsXQy9t18X9zviJYpagbNiQAB/fiksSbwMyrc+gA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzUrV1IvRkR2Qmw3TjlJKzJLaVJ0TVMyZG9JZG80TGNKT3ZKQ25Hek1tbWhX?=
 =?utf-8?B?alNFUzJWcG1ZUDlxN2JEWklPMFluQXppdEd5K3Q0cEh3aTVNQVFuTDVCaEFQ?=
 =?utf-8?B?Z3VaVVIwSXkrUTA3S25SdDFKUVFDdUxsT2FRekFwMGxOVkdLSFUxTkVWTGF6?=
 =?utf-8?B?aG5XekFpenB6Qy9JdER6c0E3cXN5QStoVkpSVkczV1ZWOUovT0I1Zk1XYjF3?=
 =?utf-8?B?dFJzcGpWUWY3VHVMOWo2aVRFb2NNaGdjSDVZbE9xQTJCcEhyYXdvTXEyNXk1?=
 =?utf-8?B?alNhL1hKR2czNEFCWjFiOXdpL3BKMm9EMVZqMFR5Q3l4cjRKcFl3WjhRVjYr?=
 =?utf-8?B?V2pUQWxyYnMzSG16S05tazNJc2prems3WnQ4K0hNZ0lET1JpK1YvaFJUTmJW?=
 =?utf-8?B?TUtwNFc4UG1PUlJBNFIyMFVEVHFxc0JBdzUvakJrR3ovY3VxNjMxSGJkWndK?=
 =?utf-8?B?T0ZjaDd2S0FER3dVcU1WMlJYOEJGYlQyVW9objZRUnA5RnJGN0xLS2dPYnBw?=
 =?utf-8?B?bWRTUzhDeEx6aXhtRFdyenovSC9aZHROR2kzbmdsQkp5WXVFSjBMeGRpenJB?=
 =?utf-8?B?WHpIOXlha092TTAwT2pPUGNVazlxZlF3OUU5Um4vSFFIYmpSZk0wSElsa0J2?=
 =?utf-8?B?Ukt5OXcwY0dLejZZYWF4a3J1Zmx0RDZaSkJTVmJUc3g5Rit1ZkQ5cHhPUkcv?=
 =?utf-8?B?Nm9pTGlVN1kwY21HZUpxTGpRR0h4TWRqbnFUMVJNU0N1VXl2ZEVkV2ordTln?=
 =?utf-8?B?QTFxN2hIdE9xVXltOXZ4V0l4LzVadmtxVkxFY1ZSbDZrM3k5M25LY2RsS3JE?=
 =?utf-8?B?YUNicXRuMGRzY3dQNmNUNEJ4MllYMUtwVXRvOHJrRm9HNHc0dVgrL1VBLzY2?=
 =?utf-8?B?OFpreDRPa3dhYnRUcEhpbUNlenJSVkR2aVNvTEpDTktYdlJRTDBIT0dkdGZr?=
 =?utf-8?B?NlVxUXZLQmQxd1orNmdaSjNHNzJFN1NmYTF1SnJ2YnRieU1kS1JvWHh1SzZC?=
 =?utf-8?B?U3h3cWRFa2ZyQm9LR0Y2SUdia2JYUWJXK2xwUlg0QkRIR0xpSFJDT3R4YVNy?=
 =?utf-8?B?VnB1RkRpejl3S1l4UTEya1Y3anNFaitrTlF2eldUeTBEa0RBekh2UjJ1cXpp?=
 =?utf-8?B?eGQ4dys1YlVheURQTCtSdDAvQ2IxeHpONlZveDRZU1pzUXREMGVsY2J3cSt5?=
 =?utf-8?B?Qlp6VDhxOGNKMTVqT3BjSGx3Qll6S2xYaHBQaXFYdnpNK0pTejJtUXkxS2Ux?=
 =?utf-8?B?WlhNd3oyMFBsYVJ0RllRc1lDSFBsZ05IeGhhUVFWQW5FbmxQQklEbTJiUWdo?=
 =?utf-8?B?VDFtWEVub0RTVFdUaEtyNG5jMWxVc1hQTFJhTE5QWEFEb2ExWExaQXdhQ3ox?=
 =?utf-8?B?M0pFNHpQUVpDTm90a08va0psbndBRlRrNjRxbTdxZ1h3eERrdVVYeTlBTk1M?=
 =?utf-8?B?RUhXT1FUNGlISmx2WEs5cmR0aUM0OFFLeFB0clg3bXJTaFpWeGJ0ZzVDOWdC?=
 =?utf-8?B?SzJFMDdvbGtPWXpGamFQS2JWVUt4K2JsYkZjMFJVQ2xHanVTa3BCVHBSZHIx?=
 =?utf-8?B?UE9pZ2tFNFpiaFE0c1dkZnhZVVdnWlNGalFQMjlRM2c0b1hIc1hBd2lFKzdF?=
 =?utf-8?B?TTRUbkg0UXkyQytwMi90R2Z4d3FkWEJDQWxKM01ZdVJHYUVZd2haVmprOE5i?=
 =?utf-8?B?bTlIT01mYzRNTUswVTFtSFZGcG5xWEtGWWdhMFA4ODYxQTV6aStRUWhpVUNu?=
 =?utf-8?B?d2Z1dlZCTHVwckdqVnMyOVFPN0lVWHFoakdKVm5GR1d3b2ZBUEhLRjNsd0dp?=
 =?utf-8?B?WVRDaWlmTGhiTWpUaUVmTjJsUGpMbHhQa0c0ejRVNEF4NUYxMld5Vis3Q1Qx?=
 =?utf-8?B?UDAxTzg4Um5KbXY5ZFMzVFN2dFpCWkhxRndvMlBPU0NOYklZZGwrTGdmYnV6?=
 =?utf-8?B?MGM3VHVsZE5temNLWmIwY2lBOWNpZmhnQ2NzRE5NWkFPTUhyVzN4NDJYUDBB?=
 =?utf-8?B?dXJ1L280UFdKNjJraXA4MHVCUUhhNDFPWmF3QlJ2Y0NXTDNFbmJCb1VYbi9h?=
 =?utf-8?B?WGxkKzVvTTNCek85MG1mZWxWM2VPT3NlRCtSQ01UQlV3c2JKUmNSQmo4cm5w?=
 =?utf-8?B?bFpacUNpR2Z5aDlMMkVqeEZPTENlTnByNjMyajRUcmlKZXc5d1pqRHYrVEV6?=
 =?utf-8?B?L1Y5cUZBY0R6MWhhQ3U0Wlp2Z25tYVNtNUVvQXh6bmREa2g1N0l3STZ1ZTRm?=
 =?utf-8?B?UU5meUttZk9ZcW5zSk5WcHAyMXJiU0dVckNaZXFHZ1lyVTN2V0JUMUVLUlZw?=
 =?utf-8?B?d3BuNkFNT3RBUGlva05lZUFkUWV1NFQ3S0tURDF3WnNrVDFHYTVMeWNMY1Iy?=
 =?utf-8?Q?67q7uEccg3jdL7PA=3D?=
X-Exchange-RoutingPolicyChecked: bmPHfy4EWquJ+hJeuZMXacMACAPwpwT80+MVdwBGAW+5ctKrBEluuLb3EJua95O+qVj3s6VhOdr+EESoNE7S+Rv5IlThLQWx13MOT7TLyBlv+tEwT9VE+XQ5AXmc4sknKKDwFLhvEttBLMHiYU8KNCCPhSjTWmcQHhpPB+jzdzGo0TJKDGqiCOXMHvhZlMwPwcbqlNJjvTAxGhOjcpwkmf4i/3NFi4bMH6yhDjFzAt5RcsadPJOiDcCYVXst8c/eE/HLy7a8yM4gwqugdgBcbkDNI1EzC99cV4+BVeBH1WYizadNJ4Hkd6Ae5tphegidiVuafAllANkeTDo5V10rqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c79a21-4248-4e2d-faae-08def4758ff2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:18:10.0149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1U8PhZziBRDcs55WgQJKWR4w5PhNy4tKWrfiWwnmdoqmobx7m0n9XNLH3dlBZI24vt2KJ1AGe15X8+zJq9kXkqh3cU7WOXvJV1Kob+h5Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5013
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

--------------PY3Ite51GDvrLac2KSBi6H4z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report various 'Survivability Mode' errors using xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 24 +++++++++++++---------
>   1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 4c506027fa94..788b7e8137a9 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -14,9 +14,11 @@
>   #include "xe_device.h"
>   #include "xe_heci_gsc.h"
>   #include "xe_i2c.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_nvm.h"
>   #include "xe_pcode_api.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   
>   /**
> @@ -179,11 +181,11 @@ static void log_survivability_info(struct pci_dev *pdev)
>   	u32 *info = survivability->info;
>   	int id;
>   
> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
> -		 survivability->boot_status);
> +	xe_log_info(xe, SURVIVABILITY, "Boot Status : Critical Failure (%d)\n",
> +		    survivability->boot_status);
>   	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>   		if (info[id])
> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
> +			xe_log_info(xe, SURVIVABILITY, "%s: 0x%x\n", reg_map[id], info[id]);
>   	}
>   }
>   
> @@ -316,7 +318,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>   
>   static int enable_boot_survivability_mode(struct pci_dev *pdev)
>   {
> -	struct device *dev = &pdev->dev;
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	struct xe_survivability *survivability = &xe->survivability;
>   	int ret = 0;
> @@ -342,12 +343,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>   	if (ret)
>   		goto err;
>   
> -	dev_err(dev, "In Survivability Mode\n");
> -
> +	xe_log_emit(pdev, check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
> +		    XE_SIGID_SURVIVABILITY, 0, 0, 0, 0, "In Survivability Boot Mode\n");

Please make it cleaner and simpler.

if(check_boot_failure(xe))

     xe_log_err_fatal(xe, SURVIVABILITY, .. );

else

      xe_log_info(xe, SURVIVABILITY, .. );


OR

xe_log_emit(xe_any_to_pdev(xe),
             check_boot_failure(xe) ? CPER_SEV_FATAL : 
CPER_SEV_INFORMATIONAL,
             XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURVIVABILITY,
             xe_log_location(xe),
             &survivability->boot_status, 
sizeof(survivability->boot_status),
             "In Survivability Boot Mode\n");

>   	return 0;
>   
>   err:
> -	dev_err(dev, "Failed to enable Survivability Mode\n");
> +	xe_log_err_fatal(xe, SURVIVABILITY, ret, "Failed to enable Survivability Mode\n");
>   	survivability->mode = false;
>   	return ret;
>   }
> @@ -412,7 +413,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
> +		xe_log_info(xe, SURVIVABILITY, "Runtime Mode not supported!\n");
We can add xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, ...);
>   		return;
>   	}
>   
> @@ -422,11 +423,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
need to use xe_log_err(xe, SURVIVABILITY. -EIO, ... );
>   
>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> +	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
hmm, Logging error as fatal, however passing err=0 (Success). is it 
right? or simply we can log as xe_log_err or xe_log_info ? any thoughts.
>   
>   	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>   	xe_device_declare_wedged(xe);
> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
> +
> +	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
ditto
> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
> +		xe->info.platform_name);
>   }
>   
>   /**
--------------PY3Ite51GDvrLac2KSBi6H4z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-07-2026 08:51 pm, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260730152121.576-19-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">Report various 'Survivability Mode' errors using xe_log() helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c506027fa94..788b7e8137a9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,9 +14,11 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_heci_gsc.h&quot;
 #include &quot;xe_i2c.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_nvm.h&quot;
 #include &quot;xe_pcode_api.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_vsec.h&quot;
 
 /**
@@ -179,11 +181,11 @@ static void log_survivability_info(struct pci_dev *pdev)
 	u32 *info = survivability-&gt;info;
 	int id;
 
-	dev_info(&amp;pdev-&gt;dev, &quot;Survivability Boot Status : Critical Failure (%d)\n&quot;,
-		 survivability-&gt;boot_status);
+	xe_log_info(xe, SURVIVABILITY, &quot;Boot Status : Critical Failure (%d)\n&quot;,
+		    survivability-&gt;boot_status);
 	for (id = 0; id &lt; MAX_SCRATCH_REG; id++) {
 		if (info[id])
-			dev_info(&amp;pdev-&gt;dev, &quot;%s: 0x%x\n&quot;, reg_map[id], info[id]);
+			xe_log_info(xe, SURVIVABILITY, &quot;%s: 0x%x\n&quot;, reg_map[id], info[id]);
 	}
 }
 
@@ -316,7 +318,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
 {
-	struct device *dev = &amp;pdev-&gt;dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &amp;xe-&gt;survivability;
 	int ret = 0;
@@ -342,12 +343,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		goto err;
 
-	dev_err(dev, &quot;In Survivability Mode\n&quot;);
-
+	xe_log_emit(pdev, check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
+		    XE_SIGID_SURVIVABILITY, 0, 0, 0, 0, &quot;In Survivability Boot Mode\n&quot;);</pre>
    </blockquote>
    <p>Please make it cleaner and simpler.</p>
    <p>if(<span style="white-space: pre-wrap">check_boot_failure(xe)</span>)</p>
    <p>&nbsp; &nbsp; xe_log_err_fatal(xe,&nbsp;<span style="white-space: pre-wrap">SURVIVABILITY, ..</span>&nbsp;);</p>
    <p>else</p>
    <p>&nbsp; &nbsp;&nbsp; xe_log_info(xe,&nbsp;<span style="white-space: pre-wrap">SURVIVABILITY, ..</span>&nbsp;);</p>
    <p><br>
    </p>
    <p>OR</p>
    <p>xe_log_emit(xe_any_to_pdev(xe),<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; check_boot_failure(xe) ? CPER_SEV_FATAL :
      CPER_SEV_INFORMATIONAL,<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; XE_SIGID_SURVIVABILITY,
      XE_LOG_COMPONENT_SURVIVABILITY,<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xe_log_location(xe),<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;survivability-&gt;boot_status,
      sizeof(survivability-&gt;boot_status),<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;In Survivability Boot Mode\n&quot;);</p>
    <blockquote type="cite" cite="mid:20260730152121.576-19-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	return 0;
 
 err:
-	dev_err(dev, &quot;Failed to enable Survivability Mode\n&quot;);
+	xe_log_err_fatal(xe, SURVIVABILITY, ret, &quot;Failed to enable Survivability Mode\n&quot;);
 	survivability-&gt;mode = false;
 	return ret;
 }
@@ -412,7 +413,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe-&gt;info.platform &lt; XE_BATTLEMAGE) {
-		dev_err(&amp;pdev-&gt;dev, &quot;Runtime Survivability Mode not supported\n&quot;);
+		xe_log_info(xe, SURVIVABILITY, &quot;Runtime Mode not supported!\n&quot;);</pre>
    </blockquote>
    We can add xe_log_err(xe,&nbsp;<span style="white-space: pre-wrap">SURVIVABILITY</span>,
    -EOPNOTSUPP, ...);
    <blockquote type="cite" cite="mid:20260730152121.576-19-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		return;
 	}
 
@@ -422,11 +423,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 		dev_err(&amp;pdev-&gt;dev, &quot;Failed to create survivability sysfs\n&quot;);</pre>
    </blockquote>
    need to use xe_log_err(xe,&nbsp;<span style="white-space: pre-wrap">SURVIVABILITY. -EIO, ...</span>&nbsp;);
    <blockquote type="cite" cite="mid:20260730152121.576-19-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	survivability-&gt;type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&amp;pdev-&gt;dev, &quot;Runtime Survivability mode enabled\n&quot;);
+	xe_log_err_fatal(xe, SURVIVABILITY, 0, &quot;Runtime Mode enabled!\n&quot;);</pre>
    </blockquote>
    hmm, Logging error as fatal, however passing err=0 (Success). is it
    right? or simply we can log as xe_log_err or xe_log_info ? any
    thoughts.
    <blockquote type="cite" cite="mid:20260730152121.576-19-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&amp;pdev-&gt;dev, &quot;Firmware flash required, Please refer to the userspace documentation for more details!\n&quot;);
+
+	xe_log_err_fatal(xe, SURVIVABILITY, 0, &quot;Firmware flash required!\n&quot;);</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260730152121.576-19-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	xe_info(xe, &quot;Please refer to the userspace documentation for more details how to flash the firmware on %s!\n&quot;,
+		xe-&gt;info.platform_name);
 }
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------PY3Ite51GDvrLac2KSBi6H4z--
