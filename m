Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3C6C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 21:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBD610F8E8;
	Fri, 12 Apr 2024 21:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ko04jIRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4862A10F8E9
 for <Intel-Xe@lists.freedesktop.org>; Fri, 12 Apr 2024 21:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712958995; x=1744494995;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qCSygSHu7Rv/2wS2cpn1oAde+xMV0xICpSiIg69ZMWc=;
 b=ko04jIRdgRRSMgSqJ+dOe3m2ucOFJTmQtU0JPs94JfjFXyhezlp6Ki2l
 XmxUYJsHE7tBXv11oDfkgRIy6n7W1U8jsHnMEWMWoTIA9BgVt1TJaNxlk
 DHkqYPr9tEFFbjlXBnnFrf2IhJpMFkPemim8ZmXVUaBkIBsShua7xVLO8
 Nm2hgUja8kvhEMFFxGQDS5OAyVKB79hHPk23Ji5R8c7HenIP8QLh8vwMh
 rMH+b0jSdmUSGrUSMNuwYH8yxJwOG5cElcTJsvG7w+yf7wqm1q+TrwMa4
 M6WT1VaaioPPjxRgODjH/7j1zaQMtPIKGsnup1o2XFc3woMMbS6KlzmE0 Q==;
X-CSE-ConnectionGUID: gxO3ov0TSEOj1EPOYyCgqg==
X-CSE-MsgGUID: vIOOEGLpQPC5n9P+z7EHBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19036060"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="19036060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 14:56:35 -0700
X-CSE-ConnectionGUID: i0gI/joyT7KGPByqvJqnXQ==
X-CSE-MsgGUID: zeB72UqvTMC++okOy7x1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21422264"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 14:56:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 14:56:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 14:56:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 14:56:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYFamANkWejBnVhcS6LEZCQNdjRxf6qjwjqKrRR/jEKy2MpdDdbKPOTOp3SKW4P+yix1EWPdoYJlZCsrpV+Amdhf8f/u5aZTCO4jDe7GkDOXjH8RDAWEuXlI1enhfk3Qai/EetIcdLZEcioXmY8o9MjNaPw4A0wf1nF/oTKGxsHqHV+uxPS91EICLv6Eqc2rFzE0jII1ShTth/KE6EdJcZwZe/Fb+0HRQNw6CKpKLr5QSU/Ze/Bo53ZXteNW6uAL5PUX55z7zRTrOgOf1wJdAHMB6sCBS63n7q3HfGLqtKRru2Ywm8ysoOVi8kgRa9H6a80woLkKNoeNBFr306HLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0hzmDHDNT/HBlVElwxyeLbPmL5fCCGbp2/iHTQ8zik=;
 b=Ya2UZfQ1/xsYA8OBAbGEqY48USHHYWNJRO9qM0Xb9TuDdgySfXQgl6AV+G/wSExHoJvUlsnlzYvOIVtDxEYYfjGxIrfTzkpdzUuxoTplObWiRabpEsTgzstHQB86StlPskuvWN4iLYsFZ9ss+HujpIFhtDfSEVxmmbGX9oHTHVoOn5+db5CYXaQivSz8u/sha7TuWiPGP7dbSlCmB6RLW+r7cQn0PMYAfT9Zn4nq57mGlZk8C+FciHIWdttmV6oPgmfa8n15uLdqDIn/bfBRou+cmKlcjOevOQFbuG3MqHskNE6xzzaBTCVrS3D7x6KOV2CJBagIcov74dsPS6Tyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 21:56:26 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127%4]) with mapi id 15.20.7430.045; Fri, 12 Apr 2024
 21:56:26 +0000
Message-ID: <cd958de0-cb98-4b8b-9053-44228a5235f2@intel.com>
Date: Fri, 12 Apr 2024 14:56:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/bmg: Some LNL workarounds also apply to BMG
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
 <20240410002646.3002394-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240410002646.3002394-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: cea22a2b-778b-4227-0631-08dc5b3b66be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ExU1grK1pNaURUYWxnWms1bk5hU2prbDdsdkFFQkNIcmVRWURtSkJ5bEd6?=
 =?utf-8?B?WkFmcG5WN2hSYXI4RWhnMW1LVThuUjFROEhnOXBtUVNIVWp2alVGKzBwcE8y?=
 =?utf-8?B?bDJmZUNVUGhWU1poTGJDSWpvektGN2psUDVkemdqUWVLWStDTlI4TEVBaC9P?=
 =?utf-8?B?OE1Ec1BhQ2Z2TjRJUHZEK25sZWE5MUdaWUZaRlc2MHBoV0ZTcEczV0QxejRm?=
 =?utf-8?B?RWR0NEFDMGE2b0pkRjZ4TjBiZ2lURnpIK0E3RjFxaFZtWklSUzZ4Tk1RaTRN?=
 =?utf-8?B?UjlRUTlkNmxaY2piRjlUWEJqZllqWk8wR1lSaXIrMTJEa3pDelNCbDV1VmVV?=
 =?utf-8?B?dVlWY2ZRM3NKMHp3RHVNbnVRbDdNa3Q5VjhYUHErM0M5dUdmTWM0Zzh4dEs4?=
 =?utf-8?B?UFdyUFVFVU9xdmpsaE5FL3J1OHhsamxHRm1IMkxvYUUwbjB4dVZLelMyYVBv?=
 =?utf-8?B?cURjRUd1d1p1VjlwQXhUbFo1dVg4NWNhM3hPTENtdGhnQyt4YTYxQ3QvbzNP?=
 =?utf-8?B?K3pLSTlCc3F2QmgvY2RVR1JBemlOVzFKbkZGVlRwcCs5azJmMWVIcmFMdnBx?=
 =?utf-8?B?Y054d2UyR1kzRk80bEFieG1yYU5ES3VnbWdZU2tEVytiRXUwclZ1Qk9jM2hC?=
 =?utf-8?B?Z09FV214bXh3cEVRSGcxNllIU20rWmJac2VKVDhYbitPV2dySk0ydElEOUZO?=
 =?utf-8?B?NTJVVWllV1FRbGJXUkYvMU14VnBVZE84dzhNenJzRm5IT0JsNWxlaWtIdmFp?=
 =?utf-8?B?MVpOYnJ0blc1blJZUFdSVFE5aXQwRXYrT0YvdlQ2Yy9KdEFTWWNxUEYxbDBo?=
 =?utf-8?B?anU4eVdPZlYwV0E3eUxGU1pGMzk5eDZhcmN5SFFIeWQ2eVRYczBJYTBQUlox?=
 =?utf-8?B?M0hpVWxsVTFHWG9aa2dTMkt0QUtBRFU2TUpxTUc0L1ZZdEIzNmplNVUvUW8y?=
 =?utf-8?B?L3J3RjBFMmo2RVhNRVU1SDN0R2FmcjBFMFkxNlE0SGorMHpxQlF0UkkxZ3JF?=
 =?utf-8?B?QUZIU3B1Rm82L29zOXFia2JJTDlmWVRYRDVOUU0ySzF5eSsveEcwdE9nSFBy?=
 =?utf-8?B?Z09ib3UrYnhPSmZpTWE1TFJWMG43RkNWc0pkeVVKS2M3OVpUOXVIaldvbVVi?=
 =?utf-8?B?Q2Z0UVpZM21tZjBjMWc2dDNXZGFuQVd2Yk5uaUc5cjY3bFdKRWJHa1BIT3NU?=
 =?utf-8?B?b2pUSW1DZW5VeXdmY3BRMTdRTE1hT0t6YU5DVWFuTjREVHZmYjVvWk9kSXVi?=
 =?utf-8?B?RW15djRzcGp4ODZUS0o0TFFSRC84eWIrQXNxMkhZWlRyODI5MzdDaUQ0TWdt?=
 =?utf-8?B?K1UxVGR1cmxTTHVJbUFQbStudEpHV2NOd1o4bjJpMDdqV0d1R1QraEF1NTVH?=
 =?utf-8?B?ZThLbFRMalpQd2JMbUwyV2ErOWQrRmUxWmpVOHc4aXpTSXRibEVGVUhIcDhU?=
 =?utf-8?B?MCs1SGhEMktrc3d1eWQyaUZLYkZjZnNwYTllWUo1ZXRoc1h6cFZIaUFoVEZT?=
 =?utf-8?B?MDNHOGlYWWF2REtMQ0dSaElCUkQxYmoxUWhCbVF0UTFuZC9ISWZVWFN0UVpp?=
 =?utf-8?B?YXdERlVKU0MyU0JXeUwxYVBtNVZmbFMva21uRHloYkdYYjdLRzhGcXdVV2JL?=
 =?utf-8?B?a1RWTWhycGtGWUtRNk93UnBtUlZoKzR4cVNKNmlsaW1OYzllNzRjQkhFaXhl?=
 =?utf-8?B?RlZHZ0hsdlV1M2J5aFAzQ0IzV3RNQzhBcWlnRXhsRlVZdStJbGhOZ3FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFlDaGNVWTFnYVpTNGFvV0ExRHFzbUJjUlQ1M09wdXVxVkJDZ1lKdExsZ3Fi?=
 =?utf-8?B?WEhrREhDUUV2VFBQTzlvaTYvdlM1MlpHNkVyNkhlelRoOGZWSTZNSk45Z2tp?=
 =?utf-8?B?R3NZYS9Ga29VZHJoeWMvSHZBbkxjNEpuY0tqdTg4d0ZKY2I0Tk9BVjNqM0JG?=
 =?utf-8?B?dWJTWmptYlU0TUZZUkJMdHRtVm9ZMW9MSnZQQ04rdUhNUi9FTkFoUEQ0enhD?=
 =?utf-8?B?ZVRDbkNXYjNEbWhRM29zR0pmRkFWTUdQLzBHM2I3NUZLUWV4SnNUSWdXbFNG?=
 =?utf-8?B?d1E4RnZBNFgzQVJMdVI0NFpCRXVkZVU5andMVkZTU1RUU05qWlIvR2R3TzV1?=
 =?utf-8?B?RHJ5aUFIN3lsS3lTaFFPTCtFbFhKNTkwZUY2Y0F3b1F3L0pBYWt6LytQd1NP?=
 =?utf-8?B?SWxyUlREYUZtRVoyNnFGMlBjZ3JpNHRUUWd5bThBOTdFT24vTCswV3l4T0ZN?=
 =?utf-8?B?bWt6NHNScjZrVTh1ODlPWjhpZGpwME01SFFIeVNYQTJBWndDZE45L2lXUGRs?=
 =?utf-8?B?OWNsVm5GTzRZcmtHWk9WcjVXVnE1dXg3NEFha2N6VUZjanA1SmxMUWI5a2pk?=
 =?utf-8?B?VWx5SjliN0pwZ2NJTUZsU0FGeXZaeC92Q2l4eGtSV25NSW82azFHcXU1L1hy?=
 =?utf-8?B?ZURXU2NkbVEwNGQrY21JRm9kR2x2UU9vdFpwWnJJbWFJQmxiWnU1a1dnS3Rs?=
 =?utf-8?B?eXZpTHpkV2h3RmY4K1k5WDVQQUh0OTJQaDdtcHFNa01RY3hqRWpJVFFEamRw?=
 =?utf-8?B?NDhuVHBMaVVOS05UVzMvY1d6M3hDa2xrODRPbTJ1NytNcVVwWSs5NFIzbGhU?=
 =?utf-8?B?bC9iNW5NUTlpemNWR2dBd0hrZjF3enhqdUhZWDV0dlhzalFIZGhjR2NKOTFv?=
 =?utf-8?B?MGV4MEt0OVE5SEQ0cktaS2JMVE1weXdBcXcrWXZmbTR1WGVteG1rOG5xL2tK?=
 =?utf-8?B?YjRaQytoakNNaTJ4T3dzR2NtL2E1TlRweUJoZnAzVEhJOHJHOHRodnFZdmVB?=
 =?utf-8?B?bVpYK1k5cnUyQjlZKy92WWs2ZHBPMktuTUZyeWVMdnY3cElyaEhSOVFKR09E?=
 =?utf-8?B?bW9XMnhNc0o0dkpYMlpyekpaRm9peUI4ZmRTZEdDOTJaeXdGeHVGZGR1bUFS?=
 =?utf-8?B?MVB1OUVPcEJZT1JGREkyV0wxRmNyL0VVN1hidWxrQlFuMHZNR3crZUNvUlYx?=
 =?utf-8?B?MmlZT0pabjhDVm9CdmMxSk16SUkzdGhxQ1dCbmF2MExORkdKTkdMMW9tdUtJ?=
 =?utf-8?B?b3ZLd25wdnBTU0JkRDlEMFVleFJCL05EWE5tcC91dlBXNHIzY056YVVMTlFL?=
 =?utf-8?B?VEZxakg5ZGtCZlNjV2FuOEIzZnhuOTUxYXRoaFRUU0luQWVWOU53UmJVV1I5?=
 =?utf-8?B?TGFyd2w0d2R1eHVUUzBHVHNtUlErUHlzbDEyazA0N2hJNG96aklVVGhCdTRr?=
 =?utf-8?B?Rys1ZWhpV0YwOWcycUFHSWh0czQ2OGJSMzFUaHNWbWlxUGs0YVd4bmJ5YnlF?=
 =?utf-8?B?aWpjQmpCMTJtMUJQZzE0UE1xNmxueXZ4SDNrdjhBdURzVHBxaTA0SzA0TDUr?=
 =?utf-8?B?ZzBFbmxSVy9WK2dUY040cS9meGc5TCtsWGN4VGxEdWRETjNXdG5kc09ORzRR?=
 =?utf-8?B?L0hwT3BoWnZRZlFsdmFLcG1BV2pFL3c4VlJvL2pNUXhsc2haRmlzK3ZyNDYw?=
 =?utf-8?B?QTVoMlFTaEpDeXA1SmpUbDc2dWRXWXZqb2RKTXV6ZkE0U25CNlNOTno1UDVp?=
 =?utf-8?B?WHJybTJxSzhGckZUd2cwTjRQbHhwQ2JHY241N2ZZWVRUVXRSWTdnaTRlUHBV?=
 =?utf-8?B?Yzl0ZWxSZlk0YnUvZm5ObDA3Tkd5cXI1QTJFM0xTbTNPNjR6S1h3azloeVAx?=
 =?utf-8?B?K3RHQ1FrdzZtbVNWVUpoOU1PcWlkVERTYlFISkpTZHZDcHVxRXpXNE9EOWhP?=
 =?utf-8?B?blRHMDdZSENjeGZTczdMejBmSzhoUWQxQWNqVC9aN0tldm4yRnlFRk4veno3?=
 =?utf-8?B?alY5Z3dFblYrV3I2VndFUks1Q1VwU0o0RlNhd2ZiYjVVcjVRQm5LK0hOMlho?=
 =?utf-8?B?YVkwQ04wejMzaEI4RTY3RThvdWs3cUU5NjZpcFlvMFRRUlZ4SCtUYkQ3UFJL?=
 =?utf-8?B?Mm1qeEJEeUkwdU84bGFFRStxMld6ajRqekpsNjlVaUdtQU5qbTQyK01sUkdm?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cea22a2b-778b-4227-0631-08dc5b3b66be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 21:56:26.6136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eA2J/uf4bMIGLUEuhLER2Hi3PFxHhz7c8aIbMBb7EWB/tx1huMuSP5Vv1KrT+rwvDf/KxeM8kQdshu5YDHL2yHAkvTN5byGcuA0o/tYMNtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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


On 4/9/2024 5:26 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Enable a couple of existing workarounds for a new platform.
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5759b7bc1b70..eb647d5a1e16 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,6 +21,8 @@
>   		PLATFORM(DG2)
>   14018094691	GRAPHICS_VERSION(2004)
>   14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> -18024947630	GRAPHICS_VERSION(2004)
> +18024947630	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
>   		MEDIA_VERSION(2000)
> -16022287689	GRAPHICS_VERSION(2004)
> +16022287689	GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2004)
