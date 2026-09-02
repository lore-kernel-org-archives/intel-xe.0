Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD0AC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505FB10E4F7;
	Wed,  2 Sep 2026 18:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZmxDkUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E2B10E4F7
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788373936; x=1819909936;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yEO3kajR/B3td+OfHEHrq7ymSIgDyp0bRlACFbwwvhg=;
 b=iZmxDkUt98UsjtIJ8DAUtJiq+8nPP4D/MKjzvIaIIy49FSUqXg2aNIpf
 gBs6BxTfAZjP38MvvcV7Imp0G6wx8oiX5e5DfRfzyanR5Nbn622SrUvFQ
 RtOhSChdLCPoFyXqMJFDoWwfKBDozT12i3LWHJeWHdcxdnyqeJvQAayHh
 RbIntA8Vbxsxbjs43xFVi2qsq/h0WLZbpySvfKAa6PA+G5LmYaJe9mO4v
 fTVZFgxiw7RzT/yMOrSHJsneOLeuIrgwi+K2mymmwb4Mtn5DUjepAnxb0
 fMucXzvXXbp0CIfRgL9UDJaDFFpq5ncJONCDgayhPuKTUYprRekbSbFka Q==;
X-CSE-ConnectionGUID: Z/g6wtH6RG+Fz4l9kSvz/Q==
X-CSE-MsgGUID: r7lworlbRUywIsn7Iy0ykQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111616882"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="111616882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:32:15 -0700
X-CSE-ConnectionGUID: 6/TdFc/XT0W0vgOGCFjCPA==
X-CSE-MsgGUID: /L4bJqhwS6idkpFUIEmdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="272991358"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:32:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:32:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:32:14 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugEyrqHyljIrAgvy8znwbBS1gkZqBuh0zDPORG1woDR3PKTy2Udsw2lMBTts0c5EoqXKlHRY09izkRZB87qCb0oMI9JA7f/2ipTQh6dc0A10K/VJ4D53u8sIiRopkf3MWggASwEInOZGy+JDk+F8Az4pmzQsTH0K3ZiO/FSN+12s1EE+2uNnWkyHAGRzrdm16N88ePOYhLr5abMg/iGtZtP8wrYK/X0qmkI6iBOsJUWtxI370A7/fKBvIbBnpOnOLCCCRgtCYMcbXzEPFXPJSUU3c7AE7urffWyZSzlD4/ZKinvKVh8HuYPd4kiukyDRgKtDb74y4JqalRG0CK2/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAD6BpGCP2zY+MwKNuUZPrwO9KU5BirmSMpa/3C+o4g=;
 b=FMv19vqibtmZ87N2DmcVIfJWCfjPDEmv3EYDsZHuy14dihttjz53O8dESQgNOBzsBm9xyxx41S4Yxs5LAtjwbUhjP25TALFEdbjnULYgffYeBrah+AR0KktLQBF2dFM2DiYufbvFmPU4qMmYWj0+/HNyd5ZSTFbpGdnI1NtolGGzR8ZyDffcsFYL/jmAIIfHzB2Nc4fYndguHrbcGqEq4WMj6H/FIufLXdqqghudSz3oUtbWq6foCqFAdp37I6xM1kN59kO/WLFby1nksavmvJcIIQwF673jiLSuguswQwyXJ3JNlPgBe2YlC8ywg4dxmi8b1fO+lrR+wNa5q9e41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:32:02 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:32:01 +0000
Message-ID: <b6a0b928-b43e-44bf-b5b3-88c147f521f4@intel.com>
Date: Wed, 2 Sep 2026 20:31:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V20 12/15] drm/xe/vram: Check disable_vram_page_offline
 policy in fault handler
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, <rodrigo.vivi@intel.com>
CC: <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-29-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260902145343.465686-29-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0001.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ae8728-379b-49b3-f239-08df09207ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: rf4erof24XB/IB95TOV1CfbOOon5zV4+kIfdBuu0rbtZOMfpBG1/CAF3rpucdmeyRsNxMLYUPp+h/wjmiPQgrORy47qSTpX3MefCA/TlxYgYxkStroCqa1FHzf4ieDL4BdZNu1UsTdI8xUTD6199nkcmV12+lHGaU2tUtaYOPJpd/vRYg/Gq2AfBIYSj5gtyO5VMfKFzJGgorHBPmPdm3oYOmOt3VwytOZ4B7+FzgIgETQmOyJsUF8bQZC21cwgsxJ2t2H3dcVVa32QOuHEs95BIno8+kbHKtk7poq5CuKCA2elklZZ+JICrD/fRCp+5DTmCK3JfxELmjZci+C0ozd8PYlh7Tu8X3KY7Jh0CtItoRUC4OlEAjhohCfrBU5amCqYWT37KFnC5o8Nw5C0Pv1z3SU8FkwtfO8ONpRf4vgFVNadJDb4AEq7rWkvt2/Wfhkl75HC9mbVqAnGrMFT13gCDZIJmGKR9mr2XAaK9Hs9xWjEXS1Wa7T516ox4WZH+0+nnIgi9ZDFCfN4aPFQYQEt87m6LQq3WJD397/fXw6oEGwsqPFSMb9vfakpVlQUko8bUn4YUItbYC1dEAHPWHO2v4bRGQa4r98WtUWxfzJNskeggJIB5UmS1wY6r+6azkYcXwmB6mOvyOeepVD9N8ioTNejTWysEcKItWorrXMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlVSXQzL3pWUVhuV2lQTmRxcEp0djhVSHYvVWxYeTREMUhMbmZQU0xvN0Fj?=
 =?utf-8?B?MTg3eU42ZWhBR2tMcU1TOUxJYXdQRjBZUGd4dGRuUDZqMDhWdGloRmVSZmlC?=
 =?utf-8?B?QmVqbldlQkJtYjVZRDg5MTMvbzB5NHVRemN0R2hVdjdNZkZXbW1oY0V4MGlx?=
 =?utf-8?B?QnVzTVlJTUZSemFITytjWjJXbElCTDVIMmZCZVNGUjRPLzlwWWV3cXh5RFBo?=
 =?utf-8?B?dXc5clJFOVpHUTJlSnBhYmRhemhwKzkxdGR2N25wUlhVTGFRS1JjZmovR2Y3?=
 =?utf-8?B?amYzditXcmlaZC90OEJpL1VGbUk3VElIenQ3Q210OFFLY3lyK2gvSVZyOGJU?=
 =?utf-8?B?emh2TDZ6eDlqUytzT29QdHd4RitOS2FRbzBtZEZRNkI2eXZ1UkkraDU0NXVZ?=
 =?utf-8?B?QTU0SkVrTkdOUk91RjBTVVdpbHpHa3Q4NXhXamhFRXYzMkNKa3RZMnQyNTJ5?=
 =?utf-8?B?NWhVY21uWFh0eG1OQ0l3aWtrSmUyOWVwbEx0R2MrUVN2Um9hWnNUckVjb1lE?=
 =?utf-8?B?cVJLNGZ2OEprcnU0Y1I4Mi9PVW5vclJ0aGNLdzFmTXJMNitaZTVpNndGcmps?=
 =?utf-8?B?L2NmSFBJRjRqZm5FSXR5NUlyNXhxYlNMMkRlbDZDUHZLWmk0dUprdkFYSG1E?=
 =?utf-8?B?N0lLSGIvSVFYbmxMVjJqemRYTzdzWE1GRVVFUXhaYVU2UWhzdmFlNGMrdGlq?=
 =?utf-8?B?MGdscGZrQnRNNm1VTm1lTjV6Z0lPaXZzbE1zejl0MWphMjNvOWZUa25CMG5z?=
 =?utf-8?B?UVpXRHQyV3g1WUgycWFnOE5na09VdHNwZFVXQXVoQ20vc2g1RmhrUjNxTUFT?=
 =?utf-8?B?ZzJvSHJGay94b1QrdEhjZ1ZaVWUrOEJBYjVjRWRmUkNJUzFaeEJERTdxTmk1?=
 =?utf-8?B?UVVhOVAwQWl6ZGdaWFJhNGFTV0ZIam1rNXcvZXh5YlN5MDdUQUNGZktITDJK?=
 =?utf-8?B?ejVKdmhSN3FOYXB4M1lIQWUwWkIwZnBQb3BQUUZ5c3EyOU9zdVlrYTN4bWRX?=
 =?utf-8?B?VVcwdDF2TDd4dGVJdElXQ3JCUHZhWEYyS0VRZkY2NGRPNUUxUzI2ZFJrUUVM?=
 =?utf-8?B?akZ5TkNVVk5QWWVPNDAzZEsxa0xvS2plZlZtV1JCWDEwdjdrSmE1MXJabzM2?=
 =?utf-8?B?UUYwVm5obUJRM2l0Q2w5Tk1QbXB3QXh4YmJtSWw0RDdoZDNEQmI4cHAwUkdt?=
 =?utf-8?B?UnVqcDQveTV5am1ML2NSMGpJNGNaOEFDbzIwSmdnVHV1ZkVlY0llWnppUWdu?=
 =?utf-8?B?a2w1NEVZbWpQYkRVaVF5QkdwdVIzcHFRd0V6aVVYL09jbzRiVnNnTXlicTRY?=
 =?utf-8?B?dDlIdDhtYVhUQThMTElyNFF1S3F3eVk4UWxXMFVSdHVFMy93cEFVNFl1Rmd4?=
 =?utf-8?B?bE1lckRvaUVlVnpFM1J3TDVqalhrNVMrdUJOQTF4dHI3VU05Zjl5akNVYTR1?=
 =?utf-8?B?cFlpWG1nL0h4WXJiVzc4K2dsS292L0V6eG5CMUVPSHdxenNOMjlEMVlzQjFh?=
 =?utf-8?B?cnhzRTZXRzdZTThheUsrVE5RVDZZWHBmM2Uyc0liMzFScEF2blhKM242U09L?=
 =?utf-8?B?U1ZvYVZZc29IaTE0Q09zUzczNVVSK2x5VnRCamdmS1ZSRG9HYTcrZzdCL3Va?=
 =?utf-8?B?LzI0cC9OMDBkTUNjWUQrRWlKRzVsQ2VEZVg2MG5mTEtBaUFYalFiZFhvQlcr?=
 =?utf-8?B?WEJla3dUUDFJNEM5ZHdCMExJOVA5UkIyRWh1S1hnVll6dmNqbEhpdmFseVZu?=
 =?utf-8?B?YWthS0xXRlpXSkhRdSsydnBPREZ3MlhFRU96MXpNb1JFT3REWG1mN1NLVnJC?=
 =?utf-8?B?Q2Z2dFJSZS9xeXYwNzNEQkdXdGRPUjdiZ0dUZmpVWDVDMXF2Vy9LOS9qRUtW?=
 =?utf-8?B?VnFldjFBK2FZOWQwY3NpVThPUkV6RUpVdlFRbit1Y0pqcTI3bWhpRDlZcFRK?=
 =?utf-8?B?cmdJWE5nTmp5Z1NpcFRGK0R6K2dhY0dtMTl6alZLdVdxMGIzWCtaakpSc3FU?=
 =?utf-8?B?c0ZvQWVuRHFLYlZ5ellWR0JSWFJKV0J2UEhuOCtoVGtKbnd4VXhENGFHd2pU?=
 =?utf-8?B?WTdmNXdpWFpTTTdyazdKRXJ1eE5OdFlpbUZWNWt6Y3R3b0NNU2h3UkJvcGNV?=
 =?utf-8?B?TldWUmdpd051MWJ6eXJCeHpQbE1iUTBFZkdibHY3alZFTUJQamJ2T25xelUx?=
 =?utf-8?B?eUF0WVVMTGRBRGVOZE5xWnNDcnhDM2RKTmJub3Y5S29NU2hoR2tmK0JxQVNW?=
 =?utf-8?B?S2NxQTlwcURLcWRwVkFwdTJJNmJmb0RLWC9ibmZMLy9zM3BObTJ6MXJ2Mjl0?=
 =?utf-8?B?U3ozVjEzN0VNci8xSytQaVhudXZUeXpLN1hYNWVzZmFjNUoyaEhhcGdMRGxN?=
 =?utf-8?Q?fHs2c1KlieznmC/c=3D?=
X-Exchange-RoutingPolicyChecked: MhPQQENt+Ph4+EsNU6dad/xenanSBt2B7PU4t1Ce5LpUPC4PpockTDTMyxbUelOy8EdK9shXW88hwI9gWLqyaLDwdKaWigJR60uYJxteTmu1QCZGPK+tn2fH0WKydQeAHP4++jPo3O39kUKJr+h6mT6MJ7040P+N5ofwJ94AX0fDHceVPQt7nc2pkMXB7B9StkqF9rU0QcBaQr//W/zf+H3SGmSRJ+QBqbadeWAq++2L1Ubmap5Su3jQ3VCA0mXMnKfiVO7+7+JoYMJdfuTOo/AsWhxsrcZQtC7EtFLZXIGVkEdK9YGYGyoxqM/JPEbEVIfuVrXGQnBEGS/JCdJjVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ae8728-379b-49b3-f239-08df09207ace
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:32:01.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YsDt8xYhouiU0DHhHNll+wA4XkjNQji5uX1ziN0CJxjx10/TiPJIFolU2/uHcWOozwF4+fo/KEpAXzkhVNuHmn0j8r7nm/DFqahVB7MXwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
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



On 9/2/2026 4:53 PM, Tejas Upadhyay wrote:
> Before reserving a page at a faulting address, check the cached
> disable_vram_page_offline policy from xe->ras. If the policy is
> enabled (logging only), log the corrupted address and return
> -EOPNOTSUPP so that RAS can report to firmware to drop the
> address from the SRAM queue without attempting to offline the
> page.
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 0ab92bc3c699..00569c5279a8 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -21,6 +21,7 @@
>  #include "xe_lrc.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> +#include "xe_printk.h"
>  #include "xe_res_cursor.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
> @@ -906,6 +907,12 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	vram_mgr = &vr->ttm;
>  	mm = &vram_mgr->mm;
>  
> +	if (xe->ras.disable_vram_page_offline) {

shouldn't this be checked by the caller?
here it looks like a layer violation

> +		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
> +		       addr);

shouldn't we use xe_log() for this?
and also done by the caller?

> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Reserve page at address */
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>  }

