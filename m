Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF18AC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6192710E52F;
	Tue, 28 Jul 2026 06:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp5YIe0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA97410E527
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218842; x=1816754842;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DIwbIfkG/7TChLarxGRQHn7e2ijDfcvhtbOmyYzcUK4=;
 b=Fp5YIe0F5L2mOJZtUakLctTDr1pN7bcVDJTueJE61oHLGnF4V1R5zlh7
 2uulE5o7C9FZ5h2Bqs8lJEwL3/RNAXOj6vc+e+nz4463Vjd4PUIOOpw1l
 CSgCDOjGems3/bz94UynYKNP6S5sbSC9/JaUqVfVQvfXV7Z3YwPY3dmbo
 IC6lrqtm52x6rARho4VZ+fFlRawZ2BoDkYXXOmUIfLMNVOSEhDbgIgAdu
 RbzrdScg9sG2rGu5Bo9zgl6c+YcNBJ7BbEhRVErgiHHaW8kD2IMc+l8g4
 8XhY0WkceRma14xqt0x8Eny/D1DIlHih5Zjxyx7lUSfSVARQcMeaSWtsp Q==;
X-CSE-ConnectionGUID: FhgQyL4WQkyKPQY/Oh1+BA==
X-CSE-MsgGUID: n7UdT+P8Rd2ATH8jiWqaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111339309"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="111339309"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:07:21 -0700
X-CSE-ConnectionGUID: m3KFn0Y8SxCPonTJWeB4mw==
X-CSE-MsgGUID: 1NyNuuWERp+cXxW1yrmIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="263926577"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:07:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:07:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:07:20 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:07:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEVMuKIjFglK+no+mp7Z9ugbnOWOIc0U68uM5cD6Skyy2gw4nXVblsiMstfutbxha8wiFmA6CmO0zs9W47A+t89Qit3ByPx0+0zL3123NqgsvbJlDiZ29aKmMuXJk49BKz3ovxgHJnineXgds98QQtI1AjievJbTvdhuC2/x1L/c4fo0mfNaeZPBrcPM9oWPHwBqlPrYl7idR/BR+TZrSQ2JOV6ZAMtz6qYFnOvzuRKC7dW/bvzT43M0CDinSt9Opdxxs277hmYBLR74Dx79aHltT7oxUU8Lg6DpNEK6caiberbAJ6qSJHAVlWttQ1+sjvl5n6td9kaekcME6Vcw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HpP/k1Bm5VkpLz+UYJS2Tc4AnRc1IEzvAFOcXdb6bI=;
 b=qLV/4vtHkpULvCqb3IR2Uwol3c/YXkr9ESb1M3eVH/hUmMHgS73E5BGu+WengutZlHfWKRhpyMZSLeOAkEGxaOs19ZKaMKpHH9slZXk8BlQ8VjnLI+Fvpr5LFF/X0C2uSEKUggA3NTpTrmj5kTyOH9toxFhvTQf4/vqtjttCe97sBSRh6uK7+84PRX1y6qjxOWMVPxXDbUIMaBydKWWx75VV2Gjjf1z8hUpIlDd6wlUYOo+MZzRPrUuFs4yRTisIdz57hcm/D+ocJgckxZxlo6tN6tw0Iyq60pRPH7lO4FJyJQJC6vt+DASNXO4iq1Nlol4Tm6hMYvssYLcN9dPZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH8PR11MB6973.namprd11.prod.outlook.com
 (2603:10b6:510:226::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:07:12 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:07:12 +0000
Message-ID: <a256c585-756a-4057-87e0-9b7e953361c0@intel.com>
Date: Tue, 28 Jul 2026 11:37:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/xe/tests: add live KUnit coverage for BO
 page-size allocation modes
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
 <20260728060132.4067990-7-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260728060132.4067990-7-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 3445d2ca-3a55-4872-aafa-08deec6e7732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QDAwtq3sR5FaWwIajWBatl5Z/HCVeipSwFqj5/Mr/Wu7nh6Q7za2gARPVQ7kMoZ+fcrjgFRvr/gx+2DmFKqKMDnFdD4BvEy217cO14by2Xy3Ycm1W/tTHwfyJnW7QvQBRO9POfm83NswdaPVDWkh6OPyLndKhPtMQyf2yX6FUd/YotQ9aoShPaccoEliXBPHHtApjhCBf+5d/SpV7pRUonSe2P37v6Y1dQe+S+8rATR6/IzBrT5mP6FvVt7YFQ5/RfNSGCugnRFDYwuKciuFAEKTHGDchRjfZ2wX3CQ+SXkIWDcZvUOe4FuYpNQgSJZCkhs4M3/KqcwdKxnKe2PPvTAv/MpNeW/oHMTqJDJOyB5uH5o62lLA1uLOygHpcC/vhb1cMO1MXF8XQ7GFcowJz0NHXr3umjUfrrMWxqyp6sfnpMwSZfRvBF/qDibpyEgkC54ZD+u1Fhv9eyL7miEE74mNSCohagxsxSP0JUFI3S8v9nZ01kxoVuH5QGtzyHflms89pXF4AmXAxBiVgZBBkgh9OgF8OSXyq88STeXE1K4YNp0TIi+ka8u0LxUchXOCEgQh9Lg8blbZ3S2hsb5nXKculkBIzBbe4UM5/qDD1FCk8sqj+iQSHND2hM0mzcFtiaTEgExuSc1ndQLEvM5aNPaKgPzJ9La8etuSy5JHUCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlCYUZIVVlSNjNrRU1SOCs1R05hVFNNZjZSclY0MiszYjg2Y0pWeU5ocVRs?=
 =?utf-8?B?V2hZa2NPZGFsYTQ5dm9kSUJ3Vkw5bklkY0xER1JBMHpYelNCSkRxSnRBQjQ2?=
 =?utf-8?B?aEpVTjk1S0tMcTByMVp5dmw1MEh2NjM1QnM2SzNITWJ5MmlxVGNMUVJKL0d6?=
 =?utf-8?B?L1RpWTVlVnoxcW1zNTVnR3BRalR1MjNXQXk1bGl5U2VPMGVYWUlocU5waXUw?=
 =?utf-8?B?WFNxazhTUGQwY3FjRkE3OVJDZGdVUndMNU5FUk1aTTRhblFtQnNwZkt0RW03?=
 =?utf-8?B?eGlZeW5GL0JIM0pVVUVEUi8rU2VCUE9IZ05lLytSaVBVN1V5MUtJSEJFVEJ2?=
 =?utf-8?B?bXpVblRLbkloU0hDTDArbFlZSjJBa2phU0YyYTZSM0JOakI2M3ByTjdXcWx1?=
 =?utf-8?B?ZnZBSW5uVFN3cWlUbERZSjZwUFVLcS9QTjNRanJkZTBZMkJHRUp5RGdUK1lF?=
 =?utf-8?B?YU9EMWRKOU1UcUQrdEIzM1pVd1VmWWk2bmF3SkFJbDBxdTdOYXpmTlNSNmdQ?=
 =?utf-8?B?Qlg1MDRGK1phRDFKK25ncmJPWEx2aVdxM2VUZVNVdE9Pa3E2SjFqLzR2OXh3?=
 =?utf-8?B?RjVseHovWnBLQVE2bU02R0NTbkM2cUNPeHRRN3plNGpEYnU1TjN4V3Q0dDhX?=
 =?utf-8?B?VFhMNXNBOHhvUWRzb1RxbFFsMkVtRWY0N2VQTThHSEN3aEdzUFRuK2d0VmtW?=
 =?utf-8?B?dDYxcHpld21mOTVUaTNIR3RvNldFbTZ1bjRXSWg0NTlBSGxqdHlyWlhPdlVY?=
 =?utf-8?B?L3EvWU9JMzByaUtDL2g0TnVoQmxQZkRRd1MzRWFiNk5zZEF2T1NhQ3hOdTBq?=
 =?utf-8?B?MXhoMFNMcmVLb3FtS2N3cGhHWm9IN21hbzVETndHcEVDazdNWUZzYzlJZDNk?=
 =?utf-8?B?T1ZkWW1RYUUzMm85eGhEZ2pnNHRPZEg5NGtwSU9ZOWtiOW9tcHR5cjRiZ3hD?=
 =?utf-8?B?Y20wMnlKY2VkOW1TWWVSdHZvREloai9IdWE0cXJSWnphWDRaUGo2NDkrdjRX?=
 =?utf-8?B?bU0wblYyeTU3bGk4SXZwZU9LRjlIZHFQVDZKSDBMWlpycnYrdHV4aTlwbENT?=
 =?utf-8?B?TDRSQjlGcm9GWitKNGhNSm03clJwQzI2aFBCbm56YVo2anpIZ2FjekxBamE4?=
 =?utf-8?B?emMvcEZ4MHV4Rzl0WVc2NUJkemRvNEx2WXIrYXUzaEtGMnBLaFBCeXBqVmE3?=
 =?utf-8?B?dkRNaWE1dEFDZFFQeWZUanlpamk2cnl5M3h6eEg4VGloK2VjWXpKRHB4TTM3?=
 =?utf-8?B?dWhYZmI4OVJITnVPdU5Gdm44OFd3a0dCc0ppRVk2c0hFZDhqRGtjVCtYdVVl?=
 =?utf-8?B?YU1HdURoSlNuNEdoemUzYVRYUzNrWFNlSEIxMEdLbm53VnRQRkcyZzY3clRU?=
 =?utf-8?B?ZStmMUpxa3d5alVEcy9RR3NIWHdyeitzMXNUMThXVkNPKzBZSjRWczg4YXBm?=
 =?utf-8?B?bHBDZk5yeitDeWkrWnJIbzI5MDV4Mkl3czJWMmxFWmUxaTBQNG5Na001NFVt?=
 =?utf-8?B?eGt4cUdmMnMvSlVEbG81MzdSQkhSWEdpY2RNSVhFKy9ZQmVoNldOMU1RUDhV?=
 =?utf-8?B?UTUxc1h2eUNLaGJmd3lzcGlNZGF6TW1UeXRSQW9tbU9VWVhrSzVxOFBLZHF5?=
 =?utf-8?B?L2U3dGNBUFFlREY3MnllTGhQMHhiSHZWcTNGOVdRNG9DU1dLWU5ZSzZQbHl4?=
 =?utf-8?B?ZXpEem14TFJaU290cWdySzcrUE5mMDZvaUZvM0Fmd2lQaUorQ3NwMFR1T2Fh?=
 =?utf-8?B?Zm5vaERzYVZKNGdyNVVqY09ORzduaGlVTjZwQ3JPQ3ZHd2ZUb0VyWkpxZ09y?=
 =?utf-8?B?SUFjTWo0bytyVUlRaDVuQW1XQ283WHkxdWpiU2dKYXVOVTRsaUdwMGZzNHFs?=
 =?utf-8?B?OVNxRllHNHQyVU5Zb2NLOWZsMDFhSGVsaHZTL3dta0pjdWNMQXZSckEvVWZs?=
 =?utf-8?B?NXpKV1NIYktMRm5SL01XYjcxQmJjb1hUeFNpNHo1R3pvcU1IK3hjbWk4MDd6?=
 =?utf-8?B?UGFQaFZwdVBZQ2loTVdWY0psOXFFVlNXelFLYlhSWHMwbytFOEs4MmJvUnVZ?=
 =?utf-8?B?YnJkaklLTDRqL3RWUEFIS3Z1SThBaG82THRHbVlBSUZsbzNkV3duYUtnRTdt?=
 =?utf-8?B?UlEzK2hPK3VubkRUdHd1dC92TVJGNmJqdllsZVI2OXBZb2hsNDNuTk5pQVh1?=
 =?utf-8?B?M3poUmFkUHhwSU9PbjhIaSs2YkFUYSt2RXFuWEtOVWZVSHhIL1YwSmN3OWVk?=
 =?utf-8?B?SWRWcVhFVk5HaURJb1ZVUlJjVGt6azNSS051YUlYNEhNOXhycVlOcE1uMnFt?=
 =?utf-8?B?YkNsY1RWL2MvUERraE1QU2Ftc1htMnFQMG1NODBtcVdaVFhZNC9QTVRpZjJE?=
 =?utf-8?Q?By8VU9x/4+r7O3LE=3D?=
X-Exchange-RoutingPolicyChecked: mU3jmvIlkHNs5WOzwJt+w+0X1Hh9NVCk50aM1jH01uh5VLbrseYvKC0H8EoYXt7gLLz5HsE3IWbJ34zjz9PLNhKnw7rp8YNwrk5UX8Jb+OxKMatmvNsLNS/1bAOX8H38Bn5dzGR1iDiIess3mB38GDUuQCy6rpP4GF+7t8ygtEVVb69lay8SKjMHCiYjWxWSp6Nc+ZQgTUe4E56Kpfz4ZT3pEuwjlEW8O2gHZZIDun9jlz4UTA69JWNvWVFLQR7nXqVMxprcNr2WeYtT1mhNE8F0cMI+ISYjWZN4iPw1Z3oIyqBD7+nO+sBRVkAFaX0HfWQuh0CPzEefm6n881ywHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3445d2ca-3a55-4872-aafa-08deec6e7732
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:07:12.6828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9vtgxyuA9KiieJYD5V06rdbQMFwIA7Ec6pPb4wJW8lFjbo8Pczcsv5u8WsG2/NKpxNM/uSQ/r7XjsFHtsBNv303PdDkge/+hrh5XVcNSzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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



On 28-07-2026 11:31, Nareshkumar Gollakoti wrote:
> Add live KUnit coverage for the debug-controlled BO
>      page-size allocation modes.
> 
>      The new tests cover forced 2M mode, forced 1G mode,
>      and mixed mode. They verify that user BO creation applies
>      the expected NEEDS_* flags, that no unexpected page-size flags are
>      added in the forced modes, that BO size is rounded as expected, and
>      that page_alignment matches the selected leaf size.
> 
>      The mixed-mode test does not assume a strict per-allocation rotation
>      sequence, since the device-global mixed-mode index may be perturbed by
>      concurrent BO creation on a live system. Instead,
>      it validates that each allocation results in
>      one valid mixed-mode page-size outcome.
> 
>      Treat transient VRAM allocation failures as skipped test cases so the
>      tests can run in varying live environments without producing false
>      failures.
> 
>      v3
>      - address review comments
>      - rework mixed-mode test to avoid assuming strict rotation order
>      - reword commit message
>      v4
>      - skip VRAM-targeted live tests on non-dGFX devices
>      v5
>      - advance the mixed-mode index in the test
>      v6
>      - Gaurd kunit tests under CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>      v9
>      - consider XE_VRAM_FLAGS_NEED64K in mixed mode for certain
>        platoform min alignment expectations.
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c            | 242 ++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   6 +
>   2 files changed, 248 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 49c95ed67d7e..6a17e13d58cf 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -22,6 +22,231 @@
>   #include "xe_pci.h"
>   #include "xe_pm.h"
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +struct page_size_alloc_saved {
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +	u32 cur_index;
> +};
> +
> +/* Caller must hold xe->page_size_alloc_ctrl.lock. */
> +static void page_size_alloc_save(struct xe_device *xe,
> +				 struct page_size_alloc_saved *s)
> +{
> +	s->mode = xe->page_size_alloc_ctrl.mode;
> +	s->cur_index = xe->page_size_alloc_ctrl.cur_index;
> +}
> +
> +static void page_size_alloc_restore(struct xe_device *xe,
> +				    const struct page_size_alloc_saved *s)
> +{
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +	xe->page_size_alloc_ctrl.mode = s->mode;
> +	xe->page_size_alloc_ctrl.cur_index = s->cur_index;
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +}
> +
> +/* Expected properties for a forced page-size allocation mode. */
> +struct leaf_info {
> +	u64 leaf;
> +	u64 alloc_size;
> +	u32 flag;
> +	const char *name;
> +};
> +
> +static const struct leaf_info leaf_2m = {
> +	.leaf = SZ_2M,
> +	.alloc_size = SZ_2M - PAGE_SIZE,
> +	.flag = XE_BO_FLAG_NEEDS_2M,
> +	.name = "2M",
> +};
> +
> +static const struct leaf_info leaf_1g = {
> +	.leaf = SZ_1G,
> +	.alloc_size = SZ_1G - PAGE_SIZE,
> +	.flag = XE_BO_FLAG_NEEDS_1G,
> +	.name = "1G",
> +};
> +
> +static void run_only_leaf(struct kunit *test,
> +			  enum xe_page_size_alloc_ctrl_mode mode,
> +			  const struct leaf_info *li)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct page_size_alloc_saved saved;
> +	struct xe_bo *bo;
> +	struct ttm_buffer_object *ttm_bo;
> +	u32 other_flags;
> +
> +	if (!IS_DGFX(xe)) {
> +		kunit_skip(test, "requires dGFX VRAM");
> +		return;
> +	}
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +	page_size_alloc_save(xe, &saved);
> +	xe->page_size_alloc_ctrl.mode = mode;
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	bo = xe_bo_create_user(xe, NULL, li->alloc_size,
> +			       DRM_XE_GEM_CPU_CACHING_WC,
> +			       XE_BO_FLAG_VRAM0, NULL);
> +	if (IS_ERR(bo)) {
> +		page_size_alloc_restore(xe, &saved);
> +		if (PTR_ERR(bo) == -ENOSPC) {
> +			kunit_skip(test,
> +				   "no contiguous %s VRAM available right now",
> +				   li->name);
> +			return;
> +		}
> +
> +		KUNIT_FAIL(test, "%s BO alloc failed: %pe", li->name, bo);
> +		return;
> +	}
> +
> +	ttm_bo = &bo->ttm;
> +
> +	/* 1) The mode added the right NEEDS_* flag. */
> +	KUNIT_EXPECT_TRUE_MSG(test, bo->flags & li->flag,
> +			      "%s: flag missing, flags=0x%x",
> +			      li->name, bo->flags);
> +
> +	/* 2) No other NEEDS_* flags accidentally tagged on. */
> +	other_flags = (XE_BO_FLAG_NEEDS_64K |
> +		       XE_BO_FLAG_NEEDS_2M |
> +		       XE_BO_FLAG_NEEDS_1G) & ~li->flag;
> +	KUNIT_EXPECT_FALSE_MSG(test, bo->flags & other_flags,
> +			       "%s: stray flags=0x%x",
> +			       li->name, bo->flags);
> +	/* 3) BO size was rounded up to the expected leaf size. */
> +	KUNIT_EXPECT_EQ_MSG(test, xe_bo_size(bo), li->leaf,
> +			    "%s: bo size=%llu expected=%llu",
> +			    li->name,
> +			    (u64)xe_bo_size(bo),
> +			    (u64)li->leaf);
> +	/*
> +	 * 4) Allocator honored the requested alignment.
> +	 * ttm_bo->page_alignment is stored in PAGE_SIZE units, so compare against
> +	 * the expected leaf size converted with >> PAGE_SHIFT.
> +	 */
> +	KUNIT_EXPECT_EQ_MSG(test, ttm_bo->page_alignment,
> +			    li->leaf >> PAGE_SHIFT,
> +			    "%s: page_alignment=%u pages expected=%llu pages",
> +			    li->name, ttm_bo->page_alignment,
> +			    (u64)(li->leaf >> PAGE_SHIFT));
> +
> +	xe_bo_put(bo);
> +	page_size_alloc_restore(xe, &saved);
> +}
> +
> +static void xe_bo_page_size_alloc_only_2m(struct kunit *test)
> +{
> +	run_only_leaf(test, XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M, &leaf_2m);
> +}
> +
> +static void xe_bo_page_size_alloc_only_1g(struct kunit *test)
> +{
> +	run_only_leaf(test, XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G, &leaf_1g);
> +}
> +
> +static void xe_bo_page_size_alloc_mixed_bos(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct page_size_alloc_saved saved;
> +	struct xe_bo *bo;
> +	struct ttm_buffer_object *ttm_bo;
> +	u32 all_flags = XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
> +			XE_BO_FLAG_NEEDS_1G;
> +	u32 flags;
> +	u64 expected_align;
> +	int i;
> +	const int n = 4;
> +
> +	if (!IS_DGFX(xe)) {
> +		kunit_skip(test, "requires dGFX VRAM");
> +		return;
> +	}
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +	page_size_alloc_save(xe, &saved);
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	for (i = 0; i < n; i++) {
> +		mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +		xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
> +		xe->page_size_alloc_ctrl.cur_index = i;
> +		mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +		/*
> +		 * Request a size valid for any mixed-mode slot. Since cur_index is
> +		 * device-global and may be perturbed by concurrent allocations on
> +		 * a live system, do not assume this iteration will see a specific
> +		 * slot.
> +		 */
> +		bo = xe_bo_create_user(xe, NULL, SZ_1G,
> +				       DRM_XE_GEM_CPU_CACHING_WC,
> +				       XE_BO_FLAG_VRAM0, NULL);
> +		if (IS_ERR(bo)) {
> +			int err = PTR_ERR(bo);
> +
> +			page_size_alloc_restore(xe, &saved);
> +			if (err == -ENOSPC) {
> +				kunit_skip(test,
> +					   "mixed mode BO allocation unavailable: %d",
> +					   err);
> +				return;
> +			}
> +			KUNIT_FAIL(test, "iter=%d alloc failed: %pe", i, bo);
> +			return;
> +		}
> +
> +		ttm_bo = &bo->ttm;
> +		flags = bo->flags & all_flags;
> +		/*
> +		 * Mixed mode may result in:
> +		 * 0-> default platform VRAM alignment
> +		 * XE_BO_FLAG_NEEDS_64K
> +		 * XE_BO_FLAG_NEEDS_2M
> +		 * XE_BO_FLAG_NEEDS_1G
> +		 * Any other combination is invalid.
> +		 */
> +		if (flags == 0) {
> +			expected_align = SZ_4K;
> +			if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> +				expected_align = SZ_64K;
> +		} else if (flags == XE_BO_FLAG_NEEDS_64K) {
> +			expected_align = SZ_64K;
> +		} else if (flags == XE_BO_FLAG_NEEDS_2M) {
> +			expected_align = SZ_2M;
> +		} else if (flags == XE_BO_FLAG_NEEDS_1G) {
> +			expected_align = SZ_1G;
> +		} else {
> +			KUNIT_FAIL(test,
> +				   "iter=%d invalid mixed-mode flags: 0x%x",
> +				   i, flags);
> +			xe_bo_put(bo);
> +			page_size_alloc_restore(xe, &saved);
> +			return;
> +		}
> +		/*
> +		 * BO size should remain valid for the selected mode. Since the
> +		 * request is SZ_1G, it should remain unchanged regardless of the
> +		 * selected page-size policy.
> +		 */
> +		KUNIT_EXPECT_EQ_MSG(test, xe_bo_size(bo), (u64)SZ_1G,
> +				    "iter=%d size=%llu expected=%llu",
> +				    i,
> +				    (u64)xe_bo_size(bo),
> +				    (u64)SZ_1G);
> +		KUNIT_EXPECT_EQ_MSG(test, ttm_bo->page_alignment,
> +				    expected_align >> PAGE_SHIFT,
> +				    "iter=%d flags=0x%x page_alignment=%u pages expected=%llu pages",
> +				    i, flags, ttm_bo->page_alignment,
> +				    (u64)(expected_align >> PAGE_SHIFT));
> +		xe_bo_put(bo);
> +	}
> +	page_size_alloc_restore(xe, &saved);
> +}
> +#endif
> +
>   static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>   			    bool clear, u64 get_val, u64 assign_val,
>   			    struct kunit *test, struct drm_exec *exec)
> @@ -609,6 +834,23 @@ static struct kunit_case xe_bo_tests[] = {
>   	{}
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static struct kunit_case xe_bo_page_size_alloc_cases[] = {
> +	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_only_2m,   xe_pci_live_device_gen_param),
> +	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_only_1g,   xe_pci_live_device_gen_param),
> +	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_mixed_bos,   xe_pci_live_device_gen_param),
> +	{}
> +};
> +
> +VISIBLE_IF_KUNIT
> +struct kunit_suite xe_bo_page_size_alloc_suite = {
> +	.name = "xe_bo_page_size_alloc",
> +	.test_cases = xe_bo_page_size_alloc_cases,
> +	.init = xe_kunit_helper_xe_device_live_test_init,
> +};
> +EXPORT_SYMBOL_IF_KUNIT(xe_bo_page_size_alloc_suite);
> +#endif
> +
>   VISIBLE_IF_KUNIT
>   struct kunit_suite xe_bo_test_suite = {
>   	.name = "xe_bo",
> diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> index c55e46f1ae92..87cd7db20e5f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> +++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> @@ -11,6 +11,9 @@ extern struct kunit_suite xe_dma_buf_test_suite;
>   extern struct kunit_suite xe_migrate_test_suite;
>   extern struct kunit_suite xe_mocs_test_suite;
>   extern struct kunit_suite xe_guc_g2g_test_suite;
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +extern struct kunit_suite xe_bo_page_size_alloc_suite;
> +#endif
>   
>   kunit_test_suite(xe_bo_test_suite);
>   kunit_test_suite(xe_bo_shrink_test_suite);
> @@ -18,6 +21,9 @@ kunit_test_suite(xe_dma_buf_test_suite);
>   kunit_test_suite(xe_migrate_test_suite);
>   kunit_test_suite(xe_mocs_test_suite);
>   kunit_test_suite(xe_guc_g2g_test_suite);
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +kunit_test_suite(xe_bo_page_size_alloc_suite);
> +#endif
>   
>   MODULE_AUTHOR("Intel Corporation");
>   MODULE_LICENSE("GPL");

