Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6CDC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 14:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579DB10E35B;
	Thu, 16 Jul 2026 14:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFMEe+Rx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016910E35B;
 Thu, 16 Jul 2026 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784212659; x=1815748659;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6t6fN4gUgeIW6Q6fkh4JoYMepROrOIerCKgnnZPi1NM=;
 b=NFMEe+RxmKMSWkuYairkwzlIrL/T0KNhtXg/SVCKn8987dGajpcvVDyX
 26+rP8omvELgIaHCtVLIz8/Jp9CbTtRRfDc2CiiuYtqvAKwhii4a2e+Qt
 hMwOKH3cLXbTgQyKlWmyviCm4vwaW415BNTZ3gBE62vD0dirqLPrrxolz
 vD2lDXWPQDX/kv8XXfDzhZgFTPOOXT0iOffRVuANDBM5D2WKHpPNBIKA3
 8AO/2D10a6i4gjMVzXFr9vFjxKXNrB7yBi0xcKX2uNGI0er4QzQno99tq
 J7ZykqRca9xAeZFC8wk6AkFpc6tuRHSgNqJ+7YPYymA/qEnjQSPCV+3W7 g==;
X-CSE-ConnectionGUID: xmAyGQqhQtCM/U876Ow+uw==
X-CSE-MsgGUID: dOjjZxPiRxKyTRBgXi7mqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="72406246"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="72406246"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 07:37:38 -0700
X-CSE-ConnectionGUID: eczOl5UfRqqlfj4Pc+gwAg==
X-CSE-MsgGUID: y81alG79QySndCHOLVO3wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="261439033"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 07:37:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 07:37:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 07:37:37 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 07:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y82JV6v0J1W3nHhPeA2+WkitGh+VNFEXs5SJ59CUm4AGe55n9nU41OxgzfVQzF2uDlh2WxfGKMeu+AB+f/BJAVQeUJg3rxO6EWrvoX2ZENp2RDF+5E9ysQKkZkovzTNWYcg7gTb4GajOITxTaMP8bXDcKEb6tU0b8hHsP3cholIM6uAn8v4mWjd+QG8U6Z6rrSER0+OdQFu04FCjRC50E0pKkl4Hppb3y89MU8L1K3znS+TBIBK0yVyCJZ7ApaP6gNthRphf57obnVM/HFqMJRY1eQRTPfJvP51B1yDYa7QPmxoi8h1Xf+fjS/WiPgcVowmTKP2J6p8UQIm9wEipvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZprANatZpFSczmUD6zPdSUSRh5zlL0nTtPaLX60CVc=;
 b=UKCf3L/lJ0zgwwP+Ggwh0x+I4Wzhz0E+4/RMeka316TdRUAB387WJuCVEeP4r0XoB4WOnzzEdrDarGIqGmgzoNMWkE29YXpkLLhdI8A8reAs60Kh40L1S244c1GANRSuoT3Q08ijW02SBN9jf7TfFeaTTIASfxVi9npH5XJxgopoiDaZlcWukFKN5vckZHdQ0A63rm9PfPCYMH+QWTrEzxFm6f843litrYXi3OmbTw9nxCTEreBrmQeMF4xlsNi/NW4fsauXwXLvFjYAw3e+ddY72w7En0wiQoTNfH/kJr8t1STifAW8tdF1h0DfSRKQgdspZExDtHHWmqVoBRz2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.12; Thu, 16 Jul 2026 14:37:34 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 14:37:34 +0000
Message-ID: <c6731e27-483b-4437-a135-4ad535eed472@intel.com>
Date: Thu, 16 Jul 2026 20:07:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 322d0347-116c-4124-cd6d-08dee347c5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|3023799007|56012099006|4143699003|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ykE5kQPzW5fPdQ+oRBY5hLMNyhbTh6X9s+/vUdBJvH3nrlDexJvacvV2EWAv1rZAtEjH+NXhx/VFv4PZ72PUhEfRk5iBDLfR9sy2kSckaxo5w2MOkrB1qFS683TGLqTvHFj8NT9KvlKuLp+P6IYvAJUqqXqDf/ppXIgeFq5HLzRpqQRs7ttxJ/I3Vl6wtO6CT37eYj7WdvFWfsFl0siYZY2+y6gioMmV/mB2zOhQlShaPXfcVhtEUG3RqGKibz9WMzDQpLjQdzqoBW2MvUfj6tlok1TSwVA6tn56xtQeuYk7bAatjMKTvbzr4KfYACk4vooXwoLhvKF9KTRYZOV5ZrXt8o0twibBSjL25nqnHWmy+6YGdd8S/+0w6aQzk3OzW9hp1EiAiHq7xtbrRYqkht0xlZSPILrEnzuM7Oz+eF2ZNieq82GhUd703rYoxSgSkJ4VGmiPmHcissqqvMvm/GJ6+5kvR4CUhujXOYonnno23LU/UJt1z0P0ZYCzEpneENWW4T/i8yr86VDBRaT9tIfUHuBvz0z2WRc0UvRyzie2WF6Db/l/Q7bQmPYfh9rSs1PTWCNy99aP0ArbEACngHQzwwrbTPkgGbkEaVL8oGxV1eX3p8xCvpXUp94FpzPfncKB95ChcS8y2GZgb6SqsrTmB5L/1/EB+vHqvOZVhEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZrRVo5c213dzJVRER4a25zV0kzclNSNVpLelYxbFA0Z3BPUU4vUUpVR1Vy?=
 =?utf-8?B?MlFOR0FwUkM3WVVyaXJBVk80SUR4QThRVllrZFlreGtDVEFxclp2aVlxc3d6?=
 =?utf-8?B?bUkrNy9yZU1KdVkwbTRWNlNJRUlkbjh6cGE0eC9NRmtZd2lGTkFJSXdZZ0U3?=
 =?utf-8?B?TjFIUmZsVGkzaytlL2h0SENKMUZzNDU5ZXVIUk5IZy9IYUpmTTNLNVpKU3VT?=
 =?utf-8?B?UmZmQi9Oc25GUnRXS3doVEZLL3BNTm1qbkM3cEdXa0VFdVNNMlE3UTFjaUpR?=
 =?utf-8?B?WFk2dWFxTHFRSU1DZlV1Rkx0VERCNzRadXFPNTA3MkkxS1dlM0RXV21PUkZG?=
 =?utf-8?B?NVowSUVhV0wzZitFZ3B2aGlkZzdIUUhKZ2ZCa3ZjUEtFOFJpNjZrdGVqVmo4?=
 =?utf-8?B?NXdWYVV1YVlLZHQrVmNScHpoK2Rvb2NicnpUZkVIRGg5VzhmbUp6dzloc2dZ?=
 =?utf-8?B?cDFad1h3NkNweHFBTHM5aGMyN01Lc1BSY2dXOUNkVU4rc1IzN0dDWGo2R2JK?=
 =?utf-8?B?WlA3LzlJNTlONWRmaFRPVkpXSHorQnpRZEtrTzFxb0JqV0VCZ2YwNGVtZ01k?=
 =?utf-8?B?eWlzTXovWEFuZ2Evdyt2UkNaY3JYYy9NVG4zT1lnaEU1MDgySWM2aElwemJ1?=
 =?utf-8?B?RkFRaGoweGkwWXJheC85NWhMb0c3VXhOM2N3TWdxaXkrcTFRWjlQVVJkeGYw?=
 =?utf-8?B?Y1lLN0lPSzlQYWZuekFueDd3dnVCYTJVbFdiZFFPZEZWOW9NNWRpajQzUldT?=
 =?utf-8?B?blNuMTRwTnJxR1hSelRkVjJzMmU1M0VrdWk2ZDc4OGZURlNCWFcyVUw1Y1hr?=
 =?utf-8?B?aE8yRHJCSWxtbnJsYVFLL3pOblJ2enU4eEUvVnMwanBxUlBjeW1uWi9nREpH?=
 =?utf-8?B?bnprK1FrNGY1c1V6VklzV2ltTjhvd09uTU01V04zdzRZbHMvaUtTZWh2WW9J?=
 =?utf-8?B?aSt0NFA1VzQ5Z1c5OXJUM2VGVHJ3WTdRN1E4aUZsaEVmQ3RqN3VSWFRXalR3?=
 =?utf-8?B?am5sTnFDamRiOVVaQUxpMnRrdXlra3VabkxaRWhtTDdwWENnRW9LZEErYzJL?=
 =?utf-8?B?SFpNYmFZOC9VczlKSVR0U3dMYlg5MmdIV1VGN2JFcHlONVM5TWUxSnN5MzVH?=
 =?utf-8?B?N0dWNUVocE9QcDVqS2FyK3N2UExHYXRWQWZ4VHJvRWVLS1crYlBHTTVqa1Nl?=
 =?utf-8?B?SmxoRyswdkI3TlZ5aXBuZGJxcHhMWk9xNHhtRndlNUNpSWlDR3oyV2FaQitM?=
 =?utf-8?B?OWQzN2VKQWRCOHNvVEtIOFlGOVhTQ25hZzBJNGZDZFEzc0JGRFk1dzJkR2h1?=
 =?utf-8?B?MDdySkNzNnV3aDM1TGtnSmJmUDZxOEFQbUU0K0ViQWVBWnNMVncvVVpEejNF?=
 =?utf-8?B?YmFJTlAyS20rOFU1TlU3V3h1bkt5cW9YcUN2ck9rdlBHNG9CeXVjbCtLZ2wv?=
 =?utf-8?B?bXhIdThtdU9oLzBjSGYzY2JFdkRLbXhQdS9WeE84a2tTekVCblZDRk9lYUlL?=
 =?utf-8?B?WnlLb3JyYzVGZlUxTVlGZmVlYWt4QWhOdytUL3cxbkpoUlBmemsxbW12bEJi?=
 =?utf-8?B?enROd252Y3NkOC9ET0R4b1IvM3diUUVnVG1lenZWK2h0L2xKaGh4Y3VneDJv?=
 =?utf-8?B?YkxDMHZXY2sySGc5YXR0UlZnM1A3bWJOMERicytnMXhHWHN5NTNxNWJUeEFN?=
 =?utf-8?B?L1FkdXRTNzJ2NjlXUTFtRVIrZUtDek9paXR2ZjMrUHYxMnRHV1dCWThhcGMx?=
 =?utf-8?B?SXh6eXJ2QkJQM2xBYzlJN3MxVHVuOUZ2THBzR0grRndhVXkwNS9MMzMyV2V2?=
 =?utf-8?B?MUl0djg4ZTlpeGhYd2tyc2FnN3dWVWFJeUtoZmNJb2hvd0IzYTZPOUh5UFRS?=
 =?utf-8?B?TTljOFZTNVhnWnYwS1llandNdlN6M2RsczdMWU1paHVXWVdGazlWdi9Kbm1T?=
 =?utf-8?B?MUpReXBiM0E5MjBzMmNDT2NBMmxpR2lTZkNVWkhrMll6emxYY1dGbFh6YnF0?=
 =?utf-8?B?b2JFSktVTXlvN3RFdC9tTEowdkJEaURBRVllMzdKbnpyWHdTWGdEOUp0NTlv?=
 =?utf-8?B?aFU5bnpGR1daWEZYVjkvZXhpMmxhRDlxYXBwVGRQYzN6ZFR0Zy8vK3UxMEN2?=
 =?utf-8?B?MEtudGtzSFJDYjFLbGFjZ2I5WnZRSElDWUp2dE5QbmFiVU9hRE9jZmJYWGFE?=
 =?utf-8?B?OEo5WENyRVlLU2dzakgwbDBWcUNxUHB2SFRjMGxSTkR0aTEwV25nUHM5Z2Js?=
 =?utf-8?B?SUM2MDdJSHRNdkU0cmpQMU9rZCtpaTJ0alp4blhJSmY1MlpRZmVTcXFJbzdq?=
 =?utf-8?B?b21waktnRUpHOGtHSWRKYnVRd3pRZ3ZYb21JQnY1SWNrNlVZQ00xMi83bEtx?=
 =?utf-8?Q?w79P8we6EoE+sWYo=3D?=
X-Exchange-RoutingPolicyChecked: C/ossFO92XR4B3zWWKxdGZdJaAyBzCFE/ca6U97o4OADw5CvM0jyLYpaX0Jr++kqdxf7FfTSxq5/uu0QMABwNMolM4EPi5xqwhQ3ZK48+LspWCS9JnVKaOZTt3vrCT7syi2aOLrBjmxXsRCksj2m94JisUJgTEYaBkZAOOmWzV2Ap/bcth2qmBkbsvIvZ5TL8ZRSEcuMiIKLxiSnNJxi3HRQ+jUJtxS0Og2go+hdccStPVGL4FQHJbHgOyhRMkUF3qVBhYyarum3gQHYLYcPBQRexEaNf9ZHI9Kc2xDp0yABCidA2L0PnkEUHhXaQ5FAPN2+EIWm4Shtyji1avsFOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 322d0347-116c-4124-cd6d-08dee347c5dd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:37:33.9099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgHGq8ESCiNow9b6JtojNABiTHFqrpJMJAeQFXdjslrBj1QPYlbc/0PI/WOaex6uDGUybr11K9eZU1I2l+E6oMIT3Z1ynTUH2wOpPAiVbDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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

Hi Mitul,

Resending this, as it was previously sent only to i915 by mistake.

> Add a per-CRTC debugfs file 'intel_vrr_cmrr' that lets the user force a
> CMRR target refresh rate and video-mode requirement.
>
> The file uses a "numerator/denominator" format:
>    - numerator:   requested refresh rate in milli-Hz
>                   (refresh rate in Hz * 1000, e.g. 60000 for 60 Hz)
>    - denominator: 1000 for a 1:1 ratio (no video timing) or
>                   1001 for the 1000/1001 video timing
>
> Reading the file reports the currently stored values; writing updates
> them. The file is created only on platforms with VRR and CMRR support.
>
> --v2:
> - Drop the "vrr" debugfs subdirectory and expose a single flat,
>    intel_-prefixed "intel_vrr_cmrr" file (Jani, Nikula)
> - Rename struct intel_crtc.cmrr to force_cmrr to make its purpose
>    explicit (Chaitanya)
> - Fix parse comment: numerator unit is milli-Hz, not KHz (Chaitanya)
> - Add debugfs/intel_ prefixes to the debugfs handler functions (Chaitanya)
> - Expand commit message with debugfs entry semantics (Chaitanya)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../drm/i915/display/intel_display_debugfs.c  |   2 +
>   .../drm/i915/display/intel_display_types.h    |   5 +
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 103 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
>   4 files changed, 112 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3f02868ef105..2bbf4760dc30 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -49,6 +49,7 @@
>   #include "intel_psr.h"
>   #include "intel_psr_regs.h"
>   #include "intel_vdsc.h"
> +#include "intel_vrr.h"
>   #include "intel_wm.h"
>   #include "intel_tc.h"
>   
> @@ -1395,6 +1396,7 @@ void intel_crtc_debugfs_add(struct intel_crtc *crtc)
>   	intel_drrs_crtc_debugfs_add(crtc);
>   	intel_fbc_crtc_debugfs_add(crtc);
>   	hsw_ips_crtc_debugfs_add(crtc);
> +	intel_vrr_crtc_debugfs_add(crtc);
>   
>   	debugfs_create_file("i915_current_bpc", 0444, root, crtc,
>   			    &i915_current_bpc_fops);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c048da7d6fea..84a6d016e226 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1546,6 +1546,11 @@ struct intel_crtc {
>   		u64 flip_count;
>   	} dc_balance;
>   
> +	struct {
> +		u32 numerator;
> +		u32 denominator;
> +	} force_cmrr;
> +
>   	int scanline_offset;
>   
>   	struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 51e4f3309b8b..8b6e36ee9f55 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -4,6 +4,10 @@
>    *
>    */
>   
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +
>   #include <drm/drm_print.h>
>   #include <drm/intel/step.h>
>   
> @@ -1231,3 +1235,102 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
>   
>   	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>   }
> +
> +static
> +int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 *denominator)
> +{
> +	char *sep;
> +	int ret;
> +
> +	/*
> +	 * Parse a "numerator/denominator" CMRR ratio string. The numerator
> +	 * is the requested refresh rate in milli-Hz (refresh rate in Hz * 1000)
> +	 * and the denominator selects the timing: 1000 for a 1:1 ratio
> +	 * (no video timing) or 1001 for the 1000/1001 video timing.
> +	 */
> +
> +	sep = strchr(str, '/');
> +	if (!sep)
> +		return -EINVAL;
> +
> +	*sep = '\0';
> +
> +	ret = kstrtou32(strim(str), 10, numerator);
> +	if (ret)
> +		return ret;
> +
> +	ret = kstrtou32(strim(sep + 1), 10, denominator);
> +	if (ret)
> +		return ret;
> +
> +	if (*numerator == 0)
> +		return -EINVAL;
> +
> +	if (*denominator != 1000 && *denominator != 1001)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_debugfs_cmrr_show(struct seq_file *m, void *data)
> +{
> +	struct intel_crtc *crtc = m->private;
> +
> +	seq_printf(m, "%u/%u\n", crtc->force_cmrr.numerator, crtc->force_cmrr.denominator);
> +
> +	return 0;
> +}
> +
> +static int intel_vrr_debugfs_cmrr_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_vrr_debugfs_cmrr_show, inode->i_private);
> +}
> +
> +static ssize_t intel_vrr_debugfs_cmrr_write(struct file *file, const char __user *ubuf,
> +					    size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_crtc *crtc = m->private;
> +	u32 numerator, denominator;
> +	char kbuf[32];
> +	int ret;
> +
> +	if (len >= sizeof(kbuf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(kbuf, ubuf, len))
> +		return -EFAULT;
> +
> +	kbuf[len] = '\0';
> +
> +	ret = intel_vrr_cmrr_parse_ratio(kbuf, &numerator, &denominator);
> +	if (ret)
> +		return ret;
> +
> +	crtc->force_cmrr.numerator = numerator;
> +	crtc->force_cmrr.denominator = denominator;
> +
> +	return len;
> +}
> +
> +static const struct file_operations intel_vrr_debugfs_cmrr_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_vrr_debugfs_cmrr_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_vrr_debugfs_cmrr_write,
> +};
> +
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +
> +	if (!HAS_VRR(display))
> +		return;
> +
> +	if (HAS_CMRR(display))
> +		debugfs_create_file("intel_vrr_cmrr", 0600, crtc->base.debugfs_entry,
> +				    crtc, &intel_vrr_debugfs_cmrr_fops);
> +}

The debugfs interface accepts non-zero values, but fails to reset the 
value to zero.

> +
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 55e9c429f579..19c7990be1b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
>   int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
>   
> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
> +
>   #endif /* __INTEL_VRR_H__ */
