Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881A5C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3831D10E5E1;
	Thu, 23 Jul 2026 16:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4ItmojS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512EA10E5C7;
 Thu, 23 Jul 2026 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823458; x=1816359458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OTOpL4H4g7/+zcgLHhW5PMvoRRISzKejXxgSMiQqfYI=;
 b=P4ItmojSlPCDE2oyFsSGZdl6eXTypgcezuINWULDLTWO+gStsZ+uDE83
 PZs4MhPymIB/Nua80rX3WHCqi6K6uv3VsMtIog6F5tWaCZ6NqhjVX8FSK
 RbdLrR6h0L/h6qqCRkfEX8pHlpNCTRR9qrU27OqJ9TEoc2eYzZsLDhiYC
 nQGOK59detpLyApaIIreRJA98ZORjPgtNcaKH8uNqdj3CArwj4q6QKyMR
 P+/9PAWybNwg9L8kfVsiZg6B8BkQT2ZJVpNwFoDq4Y8Eodn/Gqv29ZwO3
 GZ5qHLB6cfiYhrUCVZ3bmbCTUdXHFszAVdbccSPt18pSdyFCYa6VIAlMV Q==;
X-CSE-ConnectionGUID: bW6s5z18RaeaIU7gmOwKCA==
X-CSE-MsgGUID: 2cvSr9pBTf6q+vlCXDVbkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84461250"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="84461250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:17:37 -0700
X-CSE-ConnectionGUID: kbSubYtFTmOKbjBq4pfjIw==
X-CSE-MsgGUID: 6f8e4LbLQFqPbkfrKPb0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282960589"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:17:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:17:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:17:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.60)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQsXJ4aNCpgX8bQl8G2wGz/94rrv5YBhRFGJiGYOP6pozfaH4mdsqQiJTiCFGTnFwN5b7LAuP293C4Haiy/mrXKZqlodP2btogoRVXoyEDHxHeoHh6NA8KMxgNUl2lm+IQZmU+66kLnSPY6y5VOpi8G0PfsRE3PvMRNg9fhqrtO+e4eXmHFt3Rgd4f/cKNwrQEhBYuzgZZmAsaDA0px6I98LJHmd2dIvIv0U2AMmTKAsWU4MUAm4WGujZMC1LYUU+MlSVrkoFTxjU1ir52Grnxo26kGrLmBIMVqnwXb5VcL9sVqkPgO384kY/vTYCAyB/6nN5w/B//gBhZHO4lasjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoZKHzXTpW7icKvhtI0NdgSzADr2mWrIfh0shawW7SM=;
 b=Y8zMyT6fv57PUXWWe00QfvSc7ZCVsAuk3n9BeEj1fCXXwcGl/aEDdCglwjs5htlm4/T98ppC1UHZAhiiodwP6uGc1ggaaNFcJLwnm1bHvWkb0dC9kpAfrZi52ZFp6Zm/58qafZClG73+55aP03byQqGulJrBZ/L7DA2XjWV+5S1qF9BpSoaiRoAob3VH7b8utseprABL0gLfYiCv7ednOv9hkKlXC0X8u6eLA6FRy+29+4ZjLFfMV4CWnyxGVruvRaPStaU546FZUeIMqKln6hA58M0hYkpmCLUmx9Oc+O+JoK92e7iIcDTfQXl2QyB385LKyiJczb1ZpStdo2SQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:17:34 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:17:34 +0000
Message-ID: <b5bc4844-78d6-438e-bec0-458e731e2600@intel.com>
Date: Thu, 23 Jul 2026 21:47:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] drm/i915/vrr: Update AS_SDP target_rr_divider
 based on CMRR config request
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0214.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c67a84c-f0af-40ba-fcec-08dee8d5e72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ymxD1GvQS2iZtmshUGpL6Ig7bXSkKuj1e6FAY/uanvZt+fYUddOqx+mj/33xhTmlLPKhteU4IcDTBmd+rwEDREoneUT9X1gTs/XC4VyzEiopftAu4wfzKVVO5EgBP6GPTimD4bHnB6uhIkH7l7yO+0lumXqk7mIY6m5+iG+swJnrhsJWrC8+3c0Uj/ERojVAWo1S9Iv7kZ/4yDUnx0co9Eb5bx4EBCSgjTfwomyzXrBKKme+An9JiYFNogWI2HHQVctMKUrCE0gR3n4fjx5oLoWd4GCSTn/NDy9B8QqKshR7OAzJW0ksz93fHryVq+fGPeSoc3yf43SaUmpweEDeG5d5EHrVpbGpoEAAWP/9YjxpZoQJnQanjHmRW85r+XVJn8HPEHjQK1++QNKeURAicpu4uOXvFznrT0XX7UpRgJXeF5A+cM8eTFucvNhZDvyOhibAdWtBIVWAqnoVyCxMukHEjidXj1FvknOKo6d3GgZY0R4+6SQ7FGM5NGQd5ZHoZOV4VLJpiPag2BpwWPY8R1zmhlQNK58FU2JtCuqpypPwJDjwESLnKbZ3HV41TUPLbLcRxhtA6mkJqHYTu0Vba+dOrh1JeloSFPnLjY9Yv3Dt5knBVKUT6rq6Xt5/TSA0ds6zC0af59h1Ewd7UhuH+DhMQdHekN2vt34CG5JK7P0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWV0RzhHMDl4VDArQmZaU0IyRzNPc1I5SEhaditlekxmaHNpbDdWcVNzYysv?=
 =?utf-8?B?Y1NQRkRjR0cyZWRoM0dORlR0Mm94djl5WTFnOWlyU3ZjRXJpc2k2cFZkeklV?=
 =?utf-8?B?OUt6WkgxWVpIVVBxOXJEckEwRXB0aFQySzJ1RGJPQ21FbnJtUDlSbkgyWWsr?=
 =?utf-8?B?TEtWSG9aT3J5US9tOGs1VmNXMHoxNVZpOVZnaDBHSGdvbnFPTjZyQzhNRjd3?=
 =?utf-8?B?aTN3a2kzYTBBRllHVjRtMTVtTGxKRFpMaUtJVW5ncmY3ak12eXVtUUdrTVNs?=
 =?utf-8?B?M0VpUzVKcXN4YXd2cFBpUUJzOXA0OHNEcnJ2QzUzZW5hbjljUjFhVkhKZWd4?=
 =?utf-8?B?Nlk5U1QzTVgxKzR6L2ljNEQ1VDJhZXNGYk42azROK3V3TjFCcXFLalhnRGN3?=
 =?utf-8?B?QnNKNDFrUzc2VWI3SGlMN1p0bUZZNXRlM1NsVEhuY0dpQzF5dTZ4WTU4NnZx?=
 =?utf-8?B?QlArVUdKUHBHaHdaREdPaEtCN2h3SzR6TlFRc2g5MkhWUDB6Z1RNckluM2hx?=
 =?utf-8?B?ajFYSFdnMjFJUXpRTStZOUFCNmVmOW9OOEFkZFJhRm8vN2NQTjRlczk2bDgx?=
 =?utf-8?B?aGZHTHRqbTRaSHo4M0Vpbm8xMUpwbkF0OTF0UFo0bWxtR1hqNDZzNm42a1ND?=
 =?utf-8?B?aUlmeVM4WE5TYXEvbjZ2RGY3VWlYdzdJenAzVUQzY0F4MGtEUEtFa3FET1li?=
 =?utf-8?B?WXgwd0syYTh0QlQwYS9FUUJ0NGJ6VmFpcmVodi85VmY5OHlNSlB0OVZwRG1o?=
 =?utf-8?B?WGc4Z2FWVTVEOWpvYVRPdTd6c1pCU1VRNFRvcTRGTlJOSndPdDE4TzJuRGVS?=
 =?utf-8?B?enQ1MFBIZC9vazJTM1M2K2szVGxCcThMZk56VVFrR2VhRXZ5WkNYeVhaUXZB?=
 =?utf-8?B?N3c3Vjl0L0FJUHZKVjE5cXFHVTkydW5QU2IrdEVmV2xJSUt2WEw2TmlEeFM2?=
 =?utf-8?B?MUcrMEdKSG8yTVhDeXpqSkVCcXNEczVSSitjaUprditKQW1MWkRleXp0QVBL?=
 =?utf-8?B?YWNYNEVwRzdPNzhGZnJ1UzdFTmJLTCtwazZKcnFmaVZJK1BsclZzeTNuYXhW?=
 =?utf-8?B?NHlDZng2M0xTSmJMaUU4OVVoYWppejlzSjg4ODhNenRZT1l6L1EzMVp0WUFF?=
 =?utf-8?B?SjNtVTd5WndsL3p5MHZlOGtGcW1na3hzT1lyUG45MEtLZ1plQTRwUkpRNXB3?=
 =?utf-8?B?eXd4MEtLYUh5Z0diYURnUldjK2RoNVhsMnd6RkRyVXhGVm1pckRtV2tSV1BV?=
 =?utf-8?B?NGZHZVFHMGRZSXl4VkcvcTVYTXVRc0xSRzQ0cGRzenFpUWJsWWxOdXdGUllk?=
 =?utf-8?B?Q0hjTkcwRDM4NHNmaGY5UTk2bnU2SkFleE1SVzFLQ25QdzhJVXZLMzRGQXZs?=
 =?utf-8?B?YW0xRW1HU2liK0plSUFpdGIyMTdYSm5zVStzZ1BrMStYSlJINk9pV2JlTnRY?=
 =?utf-8?B?d0JYcEVwTnV3SUhQajZzaitSdGJqV2srTzEvTjhqR3ZZWkh1NXdWTmlxTUxn?=
 =?utf-8?B?cDU3QUlyTmY5MUVGK3psbHdwV213dFhnemx2L2FYVWpWT0crVU5MSm9TOFo1?=
 =?utf-8?B?cjJxTERwc0YzTExGZVJISFVZYWlRcVNTRjl1dXhmRndjbWFjcWdET2I2Smw5?=
 =?utf-8?B?YmdhQVlOY3RhS1AyY1lEcWxsYzAvazcyRFZRSlFoQVl3QmlnVDJCVXp2RE1L?=
 =?utf-8?B?dTQ3d09LT1UrdW1JeDVXb2JyUzlXbTBRQWYrSTRHQ1cwM21RZm4zY3lhSVF1?=
 =?utf-8?B?dzNBVnNhMXBpSGpSa0lHZzYxSnFGMGwwckFWRDJqVS83VUpDMURPZEJaOW53?=
 =?utf-8?B?Wlc3UFpvZHNocDE4dFRqZzc2Ykl5Vno1bmRiZUJ3MWJtZzF6cVdaMnpvR05r?=
 =?utf-8?B?UzB2SDVkZzJQY2ZhRFhteDJSRVJDQlROY0dBM0owR0NkeVdoL25OR1NlQ2RU?=
 =?utf-8?B?V1NDUGRlWTJXeW94d3dNVmhid2s0MmFxVTZCL3lQeU83b0g1blNFeGJqMFBS?=
 =?utf-8?B?Z0MrYnk1eEI5MFV0Q3E4dWhOZ0doeXhwaFQ2V3pkMjVwdVlVNDFNS2lQTXRv?=
 =?utf-8?B?NmI0WXlMeFZaZXJxS0IvMjZSZ2VNNFE3TmpOU1VFNS96dmJtbHFFZ01mWE9O?=
 =?utf-8?B?SU9hMFJIV3FLZ0xVYmhGMDJQVGlkNktndC83amdDVHNiODFoaUQxd05nS24r?=
 =?utf-8?B?bWpsaGl5SUliclFuektHak9uS2hoTGdOdTBNK2YzaHpvYk5UeW1FdzAzZ214?=
 =?utf-8?B?Q0F0WUg4ZHloeGM0NXVsc3grVUlZcEI0K0NERWdQd3R0RFU4a0tndjQ2dlBC?=
 =?utf-8?B?alliMC84TitwbFp0Z0x3ZkswQlpjZHcveWxxVjNGTnNzZUovOUtHQklLOGVs?=
 =?utf-8?Q?7Pkba7AcX3qfGJkM=3D?=
X-Exchange-RoutingPolicyChecked: Y2JWnssos+ctfPIB0UMvi/YeIo96DbAAiFyseneJIJySWBZDXAbxk6oh2zXnnA5saBuA61OTkPblEJgiA01Dub6NRjMO4nXpg0w90aMfmA9j4+O2u2/mKK39riw+yoJs0NUDftloGk4tDG97frgwMHTBpondIRefIa07nhRKPWhjCinZykpfz3F4xuXxeXCeAcUnl6y78k7hqh7AzSxgLnRNH44zK6kZVPUeVY2g5pSJUhO5XNdvZcCpbrNlivOJJ1QqfRtWSYrLpYP68u3XRICZM0KqKTs86EuVjyxwSEqI7U6+KOrNTCcAQ7Ov87B2H/5gnBVtQFHQUsuGEWSpDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c67a84c-f0af-40ba-fcec-08dee8d5e72e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:17:34.0593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pckGaKwcJo90mrtzp21J8grkN0u8duTPkaTgItvCBd9Q0dae6RSlreHw21UdAksDrzq+0HgHoXLfbpJlw+vRtaF5Q4XlYN5apUiWVi6b5I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> Compute AS_SDP target_rr_divider based on actual CMRR request
> requirement.
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 1915d376b943..23e169d8db7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3111,6 +3111,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
>   	const struct drm_display_mode *adjusted_mode =
>   		&crtc_state->hw.adjusted_mode;
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>   
>   	/*
>   	 * #FIXME: SDP/infoframe updates aren’t truly atomic, and with the new
> @@ -3131,7 +3132,11 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	if (crtc_state->cmrr.enable) {
>   		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
>   		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
> -		as_sdp->target_rr_divider = true;
> +
> +		if (crtc->force_cmrr.denominator == 1001)
> +			as_sdp->target_rr_divider = true;
> +		else
> +			as_sdp->target_rr_divider = false;

This should eventually move to state tracking. But for now works.

One fragility is that we use den == 1001 here and den != 1000 in compute 
config. Not a blocker though.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>   	} else if (crtc_state->vrr.enable) {
>   		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
>   	} else {

