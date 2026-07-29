Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA21C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B517910ECA1;
	Wed, 29 Jul 2026 15:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoGurwYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51BF10EC90;
 Wed, 29 Jul 2026 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785339043; x=1816875043;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=68qOdFlQkDG8h/UKCwSaxUsLZVf53mD5Wul64jUhqtc=;
 b=RoGurwYVP47/olCgUR1aY54X5H3WU1342x0FLqzdKs4b/27Z7/uGXiCR
 v/n/tJqoMK8l/W9AH6qgIrmrx46iKmyx9kJR2WBeCEtMsXVcvalUqsQd0
 17FURN3V0AmflTgQOUViSuKMYrQMOmp9PNN1fbPnyWcV8hSHqNeh+vEnV
 RFJCSwkozFVh0r94mVi1sM7jebnlVEbpo2H6jpb6ZLcPUxteXPmQbIIqX
 9u+fzp+zyiyU4tOmeR1810jE3wTQwJQLGHPBXbobncUtYKdmDp2lpT8OI
 sYZkbt1oGdz4S56weo/RhMN3OR+2QTPn1nHwJbwCNv8q4Z3jDkhVKL7Lj Q==;
X-CSE-ConnectionGUID: AWcr5jLiR+GmU5YgZb0EZA==
X-CSE-MsgGUID: apGCRKJLQTCDhPztsd1V9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86138681"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="86138681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:30:43 -0700
X-CSE-ConnectionGUID: gOswf5LtQWq+rNYOwf87Aw==
X-CSE-MsgGUID: a38hS1AGQLq5Mg62HDe+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="259449693"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:30:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:30:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 08:30:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:30:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xexiORkHJXk8wYTHHocl8c23wL0CNkWnO2m4mErqSkb2dFHfl37ey1GPYFvv0VGrS6Cto06kKiEDMS8XnV53He84UYCShyDMWT5sjqFnY9p0Kw5pnefMam3YNNHR2i5+Uvyvs3CD4w14skvoDsSrvHkCUw3fmALgIieSvnKL+8pE9tPwMN3G3LheTg0hZBjWrbxHjhb+/tGIbImweCSg+R3BsHeMCSA0Qh1cX2fquaaXcvnmP2Ilr4RT9POUCpJjgjnGi7VEon/Dgy6Y1ixi1+sLCLw9t4xeSfChlopGljiNuU8ivKUD7zV3pxch0alnDbI8E365pfQ4z7tj+ZEpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFY5NBadBnoLVt1JgQuhk9m3Sgvv/j7Rp1R6Mi2Jqo4=;
 b=r88U9l2YcFdCEMGdse0/ZaGWRn9ruCMtyB+Pppm5iQyZJ82X04Ol+WUMeL8zhPeuJkK5Mux0FBid6dgeRivesN4yBJtMRbKJjUgjoG02hMyh6ry8J1SmFp3yhHVeonxS0/2PrvxiNhUkFt6U+jFzBm2THaWo4YVRaSMbfpq7CJJiKMHPHqgTUv+qUKGO7iRTpnlnKrQlEB7xG7sXpjyusB7jcGZkc/7Zg96MAOqaeghjd9qnNGgL3ZfKl5Bv5AzoWhWxK9BBZb2gIcxkJKQNPK6u5+q4VcWfZ/UEjTHfCp3+xIlacLS+uRJGofOyeJDAYlJCKngu1+vp5MPjX3Gp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS4PR11MB045191.namprd11.prod.outlook.com (2603:10b6:8:50b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 15:30:40 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:30:40 +0000
Message-ID: <ce5db027-682a-4ea7-9b1f-56d2fe024f65@intel.com>
Date: Wed, 29 Jul 2026 21:00:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/i915/cursor: Program secondary cursor planes
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260706115629.2984258-1-nemesa.garg@intel.com>
 <20260706115629.2984258-5-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260706115629.2984258-5-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0174.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS4PR11MB045191:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d038428-f22a-4b82-f978-08deed86586d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: dWk1SSHIsveFaFMmZufRKS/GmWJtvu9jtklzPNgqHMD9lslSwEgkJwjV9K4eZiviO/LRAPyYLuW5kG/S/Pa73xQJt2ftoMI23maV0aNP7vWaVjNc181VnBlpCubY3foGG0oBvgSvi5hzzJeyDslS/lQtQvUEQns/ivpL7W9h317KiVKJaDRV2f5E9MkO+N0sXjJdsEI2ij4pUVT6kBdzSA/uwrXnvbUxBAlpvWMFKGII8aKWOCKxM2fN2oxX1GVz+eBtOw+Xx7qx7pgIGamC5tHMvIZJ8GM0INPuiy5m6JnkF0q5zbDXl3XJmh1DS+duMm+a21Tf+miLJZFnO+CSuIyTv2iyV0ouVbs/8lma/n1I3PW+vOUFqwA++m7d5TDrDmMX+kfeAGYvpjk2HHKAvGgjB+bkikCBfb7KDjoLfJnn6qCuzJAlUS9zR/YWzu6++mRCB5KZTbf8/9XAvVlNmJC9hSiQzro6J815s4nkMANTe8Fw7Xxv09iQXQtaOviUktiK8suf99i+ZPDNIMS5FRbFknkZEQlD2DsyBkGxHDL/JwkkHvazXzg9mnpHxBqPSIFQdciH7xIeLTK8gjE9GAuIMZHKdRCwINhAwq57G0tbOTkphlLQlNKOe64uLaZb9hT9Gbq3bWIv/GRWcbXxAcv8UPg3YEPa22fqWmaiAqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWF2YXhnc1A4c0dDWmNrcDUwSFlYRm94b1REZEpwVmRUT2ZYYXVkU1BOalo4?=
 =?utf-8?B?WFRTaEM1YVAyWGpmQlcveWUvYTdjM0RVY2ZEbnFTdk93VTNiaVJZbEQ5UVNQ?=
 =?utf-8?B?cDFwUTI2d1FwODg5TTlacWVHMktnYlkrZjVvU1lucUVVa3dqU0w1K3RQZnFD?=
 =?utf-8?B?bkVhd2REdHhycGVRbit4TG5JTU1YY045S1FtYlRWeGJvUXFZVngwN0l6Vjhj?=
 =?utf-8?B?czd0YmJBRkYrZkwrYXVUV0IzWDh0b1NMamZVdjZ2K0swSUUyMTc4cWg2Rmdz?=
 =?utf-8?B?WUduSWhEeUpkbFRPVEt2WWNXY1N3a29SZk9rZ0JseWU3eXBqUndCanZiRWVv?=
 =?utf-8?B?REs1NWtTU05YaTUxWXN4bmd2dlA2amZEbk8wb2dGMVBjTE1ydmN5a3Rzc2Rr?=
 =?utf-8?B?WmJndnlHQ1o5bzMramFrcExCRDRTQU9VS3Q1QmpvNk5nRzNMRHhPUWQrRkNy?=
 =?utf-8?B?Y3JBL3kySjJIQzVxZlQveVFPOGxDWUI5eU5zcjdsVVZnWGRpalArK1VsWlFF?=
 =?utf-8?B?dk42NjlQVzYvL2YxQTdueDhCKzJBSTcxdkdLRlZVdDc2Z1VRT1YxL0JFRWY3?=
 =?utf-8?B?R1JTVExscHp6R2ZUa29WdFNvRXkrVHJyaUozNTc1MVl1eC9lR2tzSW9ER1M3?=
 =?utf-8?B?dlloWjBkTzZQb3ZNdDRVZWJpN0V3aWlTMzU4dy9yQlpBaDMzeGFJK01oMFdq?=
 =?utf-8?B?R1RQdXQrVVdHNjBRVVVlWjFMaEdhMVMwNnczTE1uNitBVTZxQ2R2b2dsQnM1?=
 =?utf-8?B?WTVta0QzcC9SN1dtME5JQW43b0hNeGQ0OU56TzVTTEluTmNZU082cHJRWXhi?=
 =?utf-8?B?eFRvU0ZBc2NTNXRZQUlJdDBHKzBhcXc0MWVWZ3MzeEZVUVh2NG8wclpZUmJ2?=
 =?utf-8?B?NTMzWFdFazU2RER4RFlZZ3ZuT3R5WEkydnBsY1FQMzRFS29QMmpLS2JheWxN?=
 =?utf-8?B?YjdHT3FpWDVxaHVOd0tmeDNLSm9mUGJZMXJDRVFsRlY1cW9ITkUxQkZITGNt?=
 =?utf-8?B?UWtlcjQ4VGZkKytVeDM4NlhCd1B4cExXU0U2WnR6Z3Q1dVJKaGpXaHBEbytR?=
 =?utf-8?B?YTV3R3IwSUlSM0R6TGpyM3lnY1kvZ2tLREpjNlBJY1lQSit3N3FDUWwzOGRz?=
 =?utf-8?B?R2lBb0w3d3JmYktvTVhrdnRGS3pSR2lEQ3d6eHFFZU80Y2R3T0ExQ24rV3Z6?=
 =?utf-8?B?MU9OZlQ3UlZLTzdUTEdNNkd2WWE1eG0xQWZyakQwblpuazlsZVBFc3FhYk1a?=
 =?utf-8?B?OWZTa3g4Y1RDRSs4dHlVdWZrUFNSdGdGckQzS28yaFFjS1QzZk9PUlVodktm?=
 =?utf-8?B?Nk9iVUVFMDVLOVZzcWhwSGhEZE9NQ1ZtKzgwUll3QXF0RW5oQXVLQllWNGk5?=
 =?utf-8?B?L3dxalNwS3Y5QXlCMHFWTlBOcGJRbGdRakk2RTNIYnNISlh5SXhXQmtFQlFa?=
 =?utf-8?B?c05NdmVRbjZmT1U1ZlM4VEdiZzd6bi9EUVExejFmT2xXa09OY3ZDajAvN2lt?=
 =?utf-8?B?blhjRzV1Wm1ieTdGTlgrWmpqRXdHeHVzODhxZDBRUHNIWDZKQk1mUEtWVXpH?=
 =?utf-8?B?dkxlSFlVNDMwYUxoSGZZSVdmdmlBS25BSDVJM21yTnpxTkpwUFRRV0V6SE1M?=
 =?utf-8?B?T0hWdHRoZEwrcTJMa014QVJCMmIySFdoRng1R216SXhSd2R5Ylh3UUlqcGdJ?=
 =?utf-8?B?Zi9hV2VYSHZuR3NVanlYMWJQZDhjZHVpZ0RSN0F4MVRTb00vVEhxNk8yZlh1?=
 =?utf-8?B?NmQvOGc0OFUrZitXUTlQL01HWjMxOUxza1lqeGtrRlRSRk9sWGJ3ZXN1cEFT?=
 =?utf-8?B?cVpSNkYwNVZzY3VId3BSTDlYMjdzYmE2NlpPV2dXcXB6Y2ttRk9NdDVtdG1r?=
 =?utf-8?B?cThsd2F3ZCtPUkRqaGx3V3RwblJ4TG9nM01sclV5Q1UxcVh1bXNHNUYrMlhC?=
 =?utf-8?B?U29CMFljZ3hRR2RaS1duRk44Nmc1OHl2N1FjZDh3V3NyVU9uT1FpRzhtMENu?=
 =?utf-8?B?TGoya3pPOWg1OVNHWWpGUlRIU1U5WTVMZGx6Nnp2d0JFSUxRYnV3YmdFSnow?=
 =?utf-8?B?Y0RnNVpOZzVVdGVtNE53VkxLSHRPUTNpcjhLemxMRVlId2FHUEZ4VVJwYU0y?=
 =?utf-8?B?ZkQySXhBejZ5cEFnUUx4MzNmZEYweDd3Vmx2ZmFaQjhYM1NMMzBzYWk3OERp?=
 =?utf-8?B?VGtOZGprRXh2eFFrMmJEM2JZb2F1YlFjYjU1d2sxRWpJNXJuQUNHa1N5bDJL?=
 =?utf-8?B?RUE4R0Job2dvU2JvQjB4dEN0eEo5VTU5aW9ydlFjODdMWDYxcVczRUltOUxV?=
 =?utf-8?B?Z3AwMFF6cnpjMEdzRDZUeG1YSTdiVGducGZIZ0JsYnFDbjY4bzZYT1JCYXI2?=
 =?utf-8?Q?sb+t+N2HX0Vy+t90=3D?=
X-Exchange-RoutingPolicyChecked: oC1ZoAadmgnHJU3kwkyktLWqErubqiPpGTRo+RxiHqpoj/nWsLh3eO0LnkKR572HbfrTp6Hj4wtQzlbgl5g8w8UNMuZoR44zzYfAwTzNcbBBk9rES0+4aqKgvOHfUhvnLXtu0PqSdKEn6AX6JVt3Ia262n5uXX9dk4JeUMfRGjsscshoHyqTjC/Y3G/GLKz4dYUDvSaImWrdKIBMS1wFE8HNMTwRMj2K6jDqpIPk3lfhtYYa7adiiGiqgW48NiXC/dbHJBpalOGL5mw/DSek6J1mh8+No4sPpO17ZOtC0HvNe/2k/T1w8KUl2D0FFCVxDnoYohyoCUjSPRwK/XkWsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d038428-f22a-4b82-f978-08deed86586d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:30:40.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDUcS3PMj+WnZ99f9fy3QaspXwtGkVF/CfH6F2k+v4AQ1r1QZzpYD8OPTdTmgX9t8R/dWlmX+cSPD69JQR8Vck11uToga5USO7AJ4dDk3mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB045191
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



On 7/6/2026 5:26 PM, Nemesa Garg wrote:
> Iterate over all joined pipes when arming/disabling the cursor plane so
> secondary pipes are updated together with the primary. The pin, check
> and state duplication for secondary pipes was already prepared in the
> previous commit; this converts the update_arm pass to a loop over the
> joined[] array.
> 
> Because the whole loop runs inside a single primary vblank-evade,
> sample intel_crtc_get_vblank_counter() per pipe around each arm and
> emit a drm_err() if the counter ticks during that pipe's own
> programming.
> 
> v2: Check primary and secondary pipe together. [Ville]
> v3: Use struct intel_cursor_pipe. [Ville]
> v4: Add per-pipe vblank straddle detection around the arm loop. [Chaitanya]
> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 26 +++++++++++++++++----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index fad5d5302b36..65e1fa60a606 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -1039,11 +1039,27 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   		local_irq_disable();
>   	}
>   
> -	if (new_plane_state->uapi.visible) {
> -		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
> -		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
> -	} else {
> -		intel_plane_disable_arm(NULL, plane, crtc_state);
> +	for (int i = 0; i < num_pipes; i++) {
> +		u32 start_vbl_count = intel_crtc_get_vblank_counter(joined[i].crtc);
> +		u32 end_vbl_count;
> +
> +		if (joined[i].new_plane_state->uapi.visible) {
> +			intel_plane_update_noarm(NULL, joined[i].plane,
> +						 joined[i].crtc_state,
> +						 joined[i].new_plane_state);
> +			intel_plane_update_arm(NULL, joined[i].plane,
> +					       joined[i].crtc_state,
> +					       joined[i].new_plane_state);
> +		} else {
> +			intel_plane_disable_arm(NULL, joined[i].plane, joined[i].crtc_state);
> +		}
> +
> +		end_vbl_count = intel_crtc_get_vblank_counter(joined[i].crtc);
> +		if (start_vbl_count != end_vbl_count)
> +			drm_err(display->drm,
> +				"Atomic update failure on pipe %c (start=%u end=%u)\n",
> +				pipe_name(joined[i].crtc->pipe),
> +				start_vbl_count, end_vbl_count);

The straddling logic should be outside the for loop. We want to make 
sure all the updates went in the same frame. Not that write to each pipe 
is done within the same frame.

Assuming that joiner pipes are always in sync, sampling the frame count 
only from the primary pipe should be enough. Please call this out in a 
comment - this and also that the evasion logic also depends on the 
primary pipe.

Also no log printing when IRQs are disabled. It extends the period IRQs 
are off and will make a straddle, if any, even worse.

>   	}
>   
>   	local_irq_enable();

