Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8349BCD5BAB
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 21:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1D10F40C;
	Thu, 21 May 2026 21:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI++mb+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1552810F400
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779397926; x=1810933926;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=G2Cq4E7VD7zgC0GuONMa+WopdgBTukDAk1ah5XV8UN0=;
 b=mI++mb+xfJJHaSJv+SLomiH9OT2gxaCL4M2Swq+aWEneBMcMVTtqPJTD
 pUAft0LNOl1bZijPZdUL4tkslqEXZQzmNO2e6qcYwLtbvQoAaF9eklLSx
 /9WLlvknHQ/1eqPejXXPbWGao2q+YmRmBlML5lqJtrqmwVtC/YwPnXr+N
 OfSNRADqiRz59Me2/3WDytHKqDJIOG1J61OvoyIRsrM7nT5cwGiKyAWc1
 5XH/Oy/g6kKrur72+ADsxU8TYgxAdHa3XRGrq002AAUsJk9OmghqxdJN8
 JDWuxhV9SaBJm0QR/JwYRplKikd3k2PtwlN5GdFpBLpbn/Brzc6Y4tNsP w==;
X-CSE-ConnectionGUID: 0WVsK70pRuGirSx4mpW2ew==
X-CSE-MsgGUID: vSFp9XENTxegSjZWj5BXFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103001379"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="103001379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 14:12:05 -0700
X-CSE-ConnectionGUID: UwlWFoXsRaOiIXYLLLmRPg==
X-CSE-MsgGUID: cOV5SLKBSW6+gMlwNrwnCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="245703430"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 14:12:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 14:12:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 14:12:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 14:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNuz6n2iOiiVW5KsdaWtE2kRJeRsOdHbnXB8DRCFPsvliyt+dRBvHJcsgvQby4l2Tjp7PprHwh+Lw1E16Fs9DzdfXcQe0RDiX/tsvBBElju7Y18IRmoFM8awJSB3ONCjABTN7sN2bec0+1m0E2k4+lfM94Uz0WwDlvWJYftwQhiwYgkI0q2cSjYiyP2TH2bAbeYdhuIdCi3Y6CJfizgQTeCtIizN38SjuYAPVM6TnfbObhrfmn0ZuCkxSpaZ4njlpGn+Stywy0/BobgvaDWFVeZrRsNqFWjKxAn5b/os6Uvb5gZcG1GzqB4j+jBQ8HggmkTI4iTiatwFtuFAk7Capg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxXKo/0MDtqgZZDum3abotFx2grz3oUK3AcKPGDWvFw=;
 b=neDlkB7p/jhDQHYUHroa0Xjh3IhczS9GL+2HczxpHcsWP625I1Z48gfiO/+uDXc4KhF0ceQAsgGISuMZrxVv2QK/EAFjl6JwT3FDTt17qPFcUyh2b1DkDnKrkpRNeXera8jGrVaSQrD32p5sDWEAECy0bQSGPBfJBS+uJtMIrPfbJYHKUmJH+RDu5l/aIjCeHJT+qvjs9oaCJNQH2TiDRWFLcxBsiMwdaq/9EiyVIUuyQt8rXej9Ily0aHxFo7OAJutWnd3nM/MA6VZeFN5Hk5Ij9oN3cLOHMvGT5u6ltvwHAYRVGgpUEYAt/0TDv45UnQ4vsxr1Fy/jRknEWDm7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 21:11:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 21:11:59 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules
 with engine types
In-Reply-To: <87bje8sers.fsf@intel.com>
References: <20260519193216.546048-6-violet.monti@intel.com>
 <20260519193216.546048-8-violet.monti@intel.com>
 <87bje8sers.fsf@intel.com>
Date: Thu, 21 May 2026 18:11:55 -0300
Message-ID: <8733zksc10.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7ea00e-f4c2-4312-8bc9-08deb77d98c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|11063799006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: HmwQod6nvhVAzMJMbwCmdACOJ5iFJ37ogBu2xeLtzgv5mHIEyLWCoGpV5o6Pv5sTnFi7XUhztBvYeyc0Q3zmeel9LAMxwvRWZkiVHZYtkq7Hx1bRCoyS59xgpQPgeHnuHy3Pas9E8htB6nit7NxqHya73iEI+MHYXmFn/5Tu+LFstix4ICaRi3Dd/5mqi1qQyJI5UOlXQ0WShyO1aBdVNCi2ME0n0Q4pu6lWmNGzipPSlT5XsYcrFrxMtu/jObAp2Y/Vu/0tFKxvH9H47S6tr3JmsMJr1i5bxB0U/BUh6UToNdDEuJbOnxJUuaaHItrfqXcBC317W0qI8R/zmO/xPLh8JKuHapYR8ik3QHaWTFo+lnCfGlgepOu9KWvh4vLjawUWPA/fYLk0z3z2QONmn+gtl9fVK0sWN+t3EZx2R33n2odiyXzAxJN7vJplfuj75LRLn1fyGXrCn1mRlHvuuBwImjDyCEl3gCOLnXVTQhaq9DnrrPpAI6ti8HoPktMwzqZfVUDFBMmBV0NdQ4seBFYQsCt2KwlrK72+mgdRxwV4O+VNhnwQq4Hi1xPFC4oP97KzMfpeq4GSecxEP2OSDsDYMpwGq8iAb3E+QPDMobyfr/BEl5gTdpMot78Y3posK5D6T2n1BuIxyMi45b3jIS26VJvv1QwrDWieTtcCUXbFKNtwgTioVvlvoKk//xk4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1hYYTR5TWNyZ0VEbEljZkV1SWc4YkIxSy9yNlRaemxSVVBKcnREMHFXaGNP?=
 =?utf-8?B?Njl3cTdacTc2d25BWGRSNm12YUhNTEZFbEQvaFFSK1JxbEZzV1NLSDNJMXBr?=
 =?utf-8?B?cnlvOEgzcDVTTjlEUFUzM1d0NDRRMkdycllKZXVuQWI1UHBHMWN2bmxaNEZu?=
 =?utf-8?B?R1l0OEFBRmoveUZ6MVhsM1RHeSt1anBuRktrMWZBdHBPbllVaGI0ZTdqY3F4?=
 =?utf-8?B?ZWhHS09IN0tlUit4bENZaGd3dUZQYzBhYXhkZlExVklkMW85b09TQ0JHb240?=
 =?utf-8?B?ckNMTHNtenZNUWF4NHhXcEFZc2RLdEVHSEVxMGlvb011YkhsbG9Uak5DLzBv?=
 =?utf-8?B?VWhBNmhkM2F5SDhlVFJCVmxrWUxmSjkyY3lyZi8vTEV1dGFURlgvZGZFNkJ6?=
 =?utf-8?B?bFBtZFF0WjBOdjZ6enRndjAzSEFKSHZyTXRDOTlFNHZFckhMSndyRXBLWjFZ?=
 =?utf-8?B?N1pCTTc2YkdNVFZwNkZPcWI3UVpWQ0RLaFdkOUQyQlV1eXFLakNUODdiM1RM?=
 =?utf-8?B?TjFmVUR1K3NFTjVCYkl2K3lQMmxUZkdYZmIzcVhpSVp3NFZTSko1M2lkdmFB?=
 =?utf-8?B?cnFsNjliTndLVWFBU3Z3NFgyc2N2VFVQYjFnQzc2V0RpS204SlJHYVJGMGhW?=
 =?utf-8?B?c3A2U0FpSWx1U2h6N3grMHdMclE4SmtyamZtSDFxUzlQS0oyVGF1NkQwRVR6?=
 =?utf-8?B?YzBBSy9zeUNJeStNaHVJejlWcUJBK1FFSUlDOENFamU1VFV3SmpuMDFGYnpj?=
 =?utf-8?B?b0NSbjNXekFrK2hXNURhMjYyeC80eEtja3dEeUY4NCtXaGk2SXF2bnlKOVlv?=
 =?utf-8?B?MnNrYjZtUzdVSUxVSjcvQ3ZmQTZsVHhrd283T0pOSG0rNWxPS3lSeTBYZjlW?=
 =?utf-8?B?VUlwN1hjS2p4bXdDcVlnS1Q2RFJJbDYxQmpFOGNDdDd0eWZPNlBjWDhINkxu?=
 =?utf-8?B?MmZQcGNaMmU5bHZoNmt1S254bjUvQU5MdnFYZVpZWkI5bGxQNm42NzV5WStz?=
 =?utf-8?B?aktrSTBYdjB0MXdvREFGK213MExNM3lYNjJlZ3dzL21nZTBxcmpHUkR1cDJi?=
 =?utf-8?B?TStIUHhKbVBRUnZQNXFqWUdZOFpSa1grbHIwSUY3ckRaNTZLdHRHQ0pIY3lj?=
 =?utf-8?B?N1AxMmNWL0NXMU0rc0lpY2VObytsM1EwU2FCR2RSTGZCUVk5SHJKekczZHRv?=
 =?utf-8?B?NGRsNkFpU3owRWhna011THlTcFZpK2pid0xVbjlEemxwcDV0VnUzM0VacUNs?=
 =?utf-8?B?blZXUTFnSDBxekh6LzdkcGRqQ0kwWTRkRnhFUlIzZjFycUloR1BQZTArQjBh?=
 =?utf-8?B?c3Y2bWFQaFBRUEpuRjdQTWpjRyszSTRMcTlYd0h1cmIxWVJ6ZVRQT3Q4dlBq?=
 =?utf-8?B?UWV3SnlBNTMzVkd2N2NqMDZPZ1ROUlMvaTUvK2t2bGNvb2xvTm1EZkJreU5I?=
 =?utf-8?B?bDV1TjYvWnhwNVdad3pWWFdDWGNHUm03NllybmhTdTVvRjRjMEFOQkpERWZU?=
 =?utf-8?B?ZlB5TWVySko1enlodGpTRnB6Q2NTMkdCS215SHJxSzhlOHZ3aXhVQkc3OTFv?=
 =?utf-8?B?WU8vNW8yMUFyK3kvZTR1TGdLeHZOVE5aL3ZLM09DcFgxNmNKSG1aWTdlbW85?=
 =?utf-8?B?Z3JZQ1B0aE4vZllUZGEvOGFLZXh3MGFjYVJxN2pDa1NJc3hLMG9vNkViaHFY?=
 =?utf-8?B?a1d3UDBqSVJpTGQ3SFh1Y0pQallBTktCbDY2SlhXbU5IaUZsN1NZaFU1Qzls?=
 =?utf-8?B?UmM5NXFqZE55QkhmTWFNaDJyTXhYQ1NFVGNMV1ZVQnNHaEMybWszb2JEL21M?=
 =?utf-8?B?U1kzc1RoSE5YK0IyV0tNRHZEZUFKRnNZQVMwNFRRdlZDRktkV0hxZ2VyWDh5?=
 =?utf-8?B?RXU1THV5eWYvbWJ2TDhac2E5M0FYdE9kdzl6UW8yRE11K1RydTVtOHBGT0h5?=
 =?utf-8?B?VVEwVUNhMEVTQ3NkMStVRDVIM09kMHFWU3IwUTVXWEs2NkYzTTJDWEpoWm96?=
 =?utf-8?B?aHpON2ROVVhPdm53MFp6Zit0ZXhJU241NGc4VnltOHRVdUhWU2pUMFNseks0?=
 =?utf-8?B?UVdVL0RJM0p4ekRHUUtwYW5raHZPck93dWRablRhbTdOU1VCdTJRWW9QZTFI?=
 =?utf-8?B?eDFSQVNSdUx6NmYzckVXbE45aWxJU2twanA5QlpyeU1ZaUt2OU1RbGd4UStm?=
 =?utf-8?B?dXkwRG5GMVU2aE1FSGlQVHRQZzhRK1Bmc1JONU1UVXhFRUVmLytpS3ZJYlkv?=
 =?utf-8?B?dWRQc2ZLRExwK09ZaVN6Yzd4SDRjQU5sd2NjTzJsQm9XNzB0SXpvVGlZYzJo?=
 =?utf-8?B?czFsc1lUdjdQRzBuUDVNYnRETERJMS9tUEJyUFNxZ005bnJQWnJOQT09?=
X-Exchange-RoutingPolicyChecked: Yf/iT6TBuwCAHTmJB+liz7JYfY443rN5fuo+ZxFdg6YMJ///7CNndCymQ4n+JUF5nOybpnDm0TI5wv/xLg8qhCDmFTRvmKw18INWrXf9ArKrlUrjXVeq60cIEHFOx+qVBfwAuC7YKUFV/Ira1IkpgBa8ghxs6QsTQEnaq9KnV3WETLIjK9cnNIwxaNnYXgIsMLkJsEF4f4RmwcTE54vA7YKpjvLStnuL9RUhxDIN5ehpYDZV3YtXN4D3E6sccBRr9FwPQ7U0wDBYVe9PrnVwQajfCNWusuxFzHStQERoFT9/agufgO/yCMSMJvJrggt6GHUfBWLAkY8mD5ZMZyflrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7ea00e-f4c2-4312-8bc9-08deb77d98c1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 21:11:59.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCbc19GHEcB7qOTEE5UnK7yvoD5NrlWDzn7AvYTvSfgOtXWR2CN0VYeLOo/RTD9wyjXC1r4vIny2EzWQaXNt7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Violet Monti <violet.monti@intel.com> writes:
>
>> It is currently possible for a RTP rule, and subsequently a workaround,
>> to expect contexts that may not be present when the workaround is
>> applied. For example, the workarounds in the engine_was[] in drm/xe/xe_w=
a.c
>> expect an engine entity to be active. Conversely, the gt_was[] is not
>> depending on an engine entity to implement its workarounds. This kunit
>> test addition checks the gt_was[] workaround list for any workarounds
>> with XEP_RTP_ENGINE_CLASS() rules. If a workaround does have one of
>> these rules, the workaround is then checked for the "FOREACH_ENGINE" fla=
g,
>> which ensures the workaround is implemented properly.
>>
>> The result of this test is an expectation failure if a workaround has an
>> improper XE_RTP_ENGINE_CLASS() rule setup, and aims to prevent future
>> issues of gt_was workarounds being applied without proper contexts.
>>
>> v2:
>>     - Moved contents of xe_rtp_tables_test.h to .c and removed file
>>     - Renamed macro RTP_KUNIT_ARRAY_PARAM to RTP_TABLE_PARAM
>>     - Removed unnecessary functions and iterative components from
>>       generated _gen_params functions and implemented usage of table
>>       name and WA number as entry name
>>     - Condensed xe_rtp_table_gt_test() to use KUNIT_EXPECT_TRUE with no
>>       message statement
>>     - Removed xe_rtp_table_test_init() and xe_rtp_table_test_exit() as
>>       fake device initialization is not necessary
>>
>> Signed-off-by: Violet Monti <violet.monti@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
>>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 55 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
>>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
>>  4 files changed, 63 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>>
>> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/test=
s/Makefile
>> index 0e3408f4952c..f7aa47f11a36 100644
>> --- a/drivers/gpu/drm/xe/tests/Makefile
>> +++ b/drivers/gpu/drm/xe/tests/Makefile
>> @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
>>  xe_test-y =3D xe_test_mod.o \
>>  	xe_args_test.o \
>>  	xe_pci_test.o \
>> +	xe_rtp_tables_test.o \
>>  	xe_rtp_test.o \
>>  	xe_wa_test.o
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu=
/drm/xe/tests/xe_rtp_tables_test.c
>> new file mode 100644
>> index 000000000000..01d2bc6e8aad
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_kunit_helpers.h>
>> +
>> +#include "xe_kunit_helpers.h"
>> +#include "xe_pci_test.h"
>> +#include "xe_rtp.h"
>> +#include "xe_wa.h"
>> +
>> +/**
>
> So, the macro is used only internally and simple enough that I
> personally think we don't need the comment.  But, if you think that will
> be useful, I'm fine with it too (but it does not need to be a
> kernel-doc).=20
>
>> + * RTP_TABLE_PARAM() - Define test parameter generator from a RTP table=
.
>> + * @table: array of test parameters which includes a n_entries value
>
> The input is the RTP table, no? And then the function will generate the
> test parameters from the table.
>
>> + *
>> + * Define function @table_gen_params which uses @table to generate para=
meters.
>
> If this were to be processed by the kernel documentation generator, it
> would not find @table_gen_params.  Not sure about what would be the
> alternative here.  Maybe just spell out the CPP syntax here? I.e. Define
> function table##_gen_params().
>
>> + */
>> +#define RTP_TABLE_PARAM(table)						\
>> +	static const void *table##_gen_params(struct kunit *test,				\
>> +					     const void *prev, char *desc)			\
>> +	{											\
>> +		typeof((table.entries)[0]) *__next =3D prev ?					\
>> +			((typeof(__next))prev) + 1 : (table.entries);				\
>> +		if (__next - table.entries < table.n_entries) {					\
>> +			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	=
\
>> +			return __next;								\
>> +		}										\
>> +		return NULL;									\
>> +	}
>> +
>> +static void xe_rtp_table_gt_test(struct kunit *test)
>> +{
>> +	const struct xe_rtp_entry_sr *entry =3D test->param_value;
>> +
>> +	for (int i =3D 0; i < entry->n_rules; i++)
>> +		KUNIT_EXPECT_TRUE(test,
>> +				  (entry->rules[i].match_type !=3D XE_RTP_MATCH_ENGINE_CLASS &&
>> +				   entry->rules[i].match_type !=3D XE_RTP_MATCH_NOT_ENGINE_CLASS) |=
|
>> +				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
>> +}
>> +
>> +RTP_TABLE_PARAM(gt_was);

Ah, another thing: it occurred to me that gt_tunings is also applicable
for xe_rtp_table_gt_test, so we could also add
RTP_TABLE_PARAM(gt_tunnings) here and add a new KUNIT_CASE_PARAM()
below.

I think it would be fine to add this to this same patch and reword it a
bit.  But if you prefer to send it as a separate patch, that would be
fine as well.

--
Gustavo Sousa

>> +
>> +static struct kunit_case xe_rtp_table_tests[] =3D {
>> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite xe_rtp_tables_test_suite =3D {
>> +	.name =3D "xe_rtp_tables_test",
>> +	.test_cases =3D xe_rtp_table_tests,
>> +};
>> +
>> +kunit_test_suite(xe_rtp_tables_test_suite);
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index b9d9fe0801aa..1a1e04215f21 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -130,7 +130,7 @@
>>  __diag_push();
>>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> =20
>> -static const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
>> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_S=
R(
>>  	/* Workarounds applying over a range of IPs */
>> =20
>>  	{ XE_RTP_NAME("14011060649"),
>> @@ -307,6 +307,7 @@ static const struct xe_rtp_table_sr gt_was =3D XE_RT=
P_TABLE_SR(
>>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>>  	},
>>  );
>> +EXPORT_SYMBOL_IF_KUNIT(gt_was);
>> =20
>>  static const struct xe_rtp_table_sr engine_was =3D XE_RTP_TABLE_SR(
>>  	/* Workarounds applying over a range of IPs */
>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> index a5f7d33c1b32..17dff615e507 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.h
>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_WA_H_
>>  #define _XE_WA_H_
>> =20
>> +#include <kunit/visibility.h>
>>  #include "xe_assert.h"
>> =20
>>  struct drm_printer;
>> @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *til=
e);
>>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>> =20
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
>
> The VISIBLE_IF_KUNIT here is unnecessary and doesn't make much sense:
> that macro is about adding or not the "static" keyword in the
> declaration and should only be part of the variable definition in the .c
> file.
>
>
> --
> Gustavo Sousa
>
>> +#endif
>> +
>>  /**
>>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as n=
eeded.
>>   * @gt__: gt instance
>> --=20
>> 2.43.0
