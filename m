Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B3BCFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 08:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDD210E1E9;
	Mon,  7 Oct 2024 08:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zo2ylBVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EC410E1E9
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728288338; x=1759824338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1lAYt4sGBux+va0ODyQhdxwu4pH8gEXYGURGLNjFnB4=;
 b=Zo2ylBVmDriYAn/446A7/1ciHb7QKxYOtSsdjiFPYtcFgpcr8f9RyPQh
 XvX6ENPTY/2b7OZM5l4vMZVIxA/NhagE3XArIs0aST1TtVzJeyHU0tYOX
 3Iw1+PRtwE7x1BMl5FVvwWq/ZzkJxtC9LGML/AgFYb8R+zHRHy2KpI4J6
 v/Uhjgw1BDjgUmu0Zm2G2qLMhPsNINmbzOIcgpCl71sW2pyPYTPEERK04
 KqB3w1fMqkKJktkSoH0v/DIBAH6Y35wdMbcyukhCAGOcyCK5iYUltNSGA
 lPE7uAK09773pPsU3ygaD0S+fv1U108t59lhPjoJfZGOpmdGczwjjk0LR Q==;
X-CSE-ConnectionGUID: X5wzTG3RQoCE9g+6yIq/aw==
X-CSE-MsgGUID: mdUxvaSVQkG1TbO8pFwUHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31220975"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="31220975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 01:05:38 -0700
X-CSE-ConnectionGUID: /t+b0BN+SxKLlAqbdnkd4A==
X-CSE-MsgGUID: QKXnq1FHSqSGh0jkh2g9zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="76224196"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 01:05:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 01:05:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 01:05:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 01:05:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVGN/79k1wlSmdYwkKqGvmduc/SDA5TEZZbcIiONQ/TdWeilMt6WvplVfDmzEm+3cjYJ3i4M6EEB972E6TiDKDXTcDHJGZF4z9Dlrn79gFM7E76izj8cRJcVwQno2pLdIqfwnlFMu4x+MvvtmDMM/NyQxbrCwgKJsJ3gAtMa+8cM73KoAXEYlSw/1X3zQsuL5ekrgmULJkUO72m1EODSz4lGFGsxurPnLQyyyglNjdpuu6W6U7aRhgfoMlfE2/25uOiG3KRX5AnIzwrBsFjj+s0XBU6izr55baUN/T7w59COB5d3jMd2XMovgDeFQhZKDk/AaNsG2NRjPa8oPMDU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V754Ha2JMA5u60lIMQQtgcFAcEsLy++xiTgBpAjc1j4=;
 b=glRRwh2gLK0XPa3x1ebNU7JVAs15/Zy6IAZzd51xpHljN0cO+Pu6DP1dIlO0hfTlTEAjqwE01zxaL5XQAreTXj73DsrsuZTIl7fndEzetALxE7o3yw9jmEGi73GkSnGDoqvZ+wiojfTamy52jFY3r57i7yJPH9GGOuZb3X+J4qtWCmIFQ+tIuiKGQVBRCMxnGEhi33GT0PmO0AZSTnehrqlqViY8Dcw6COamkJbdYxCduhmUnP9JIZ3UCF8EGehY4MHQhepWB3SeHPy0vs2MgC3QB0zmX603PX2WixnE6o+xSAp8DOCo/hVYAqqFtjtZWHbv7lc4Gn/yFMyf2z+TJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 08:05:33 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 08:05:33 +0000
Message-ID: <ca7b58e8-1723-43e1-b6da-01081068bec7@intel.com>
Date: Mon, 7 Oct 2024 10:05:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/bmg: improve cache flushing behaviour
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Vitasta Wattal <vitasta.wattal@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20241007074541.33937-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20241007074541.33937-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA2PR11MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac0c95c-ce43-42ed-b4d2-08dce6a6d16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2szTmwyYzJCeDJjZDVra3hZQjdXQlVOUnNPMENqb3JxQUxRYXN3WDl1TFF0?=
 =?utf-8?B?alBRV3UrWnJNVHEvQW5aUkoweDZmb2hFQjNrRWQ0TjJVbzJ5NElWdnhpL3JM?=
 =?utf-8?B?NGhOMDNmM3NCeG1Belpmc0FDK3dXRTI1ZG9QeXVOWENoOC9uZkdBS3Y3b2hJ?=
 =?utf-8?B?NUk1OVZBczczL1FhUGVraFkzYVgrUWh2cWdOOEFuRGhsOTFMUmRtNEpsWFk3?=
 =?utf-8?B?UmFVR0h6bG1tWTYxRnZHbk01b3pId3hjV0RDM0E4WVZmT0VRU1JLemRNQ1Jm?=
 =?utf-8?B?WDNFVXhMSlpUWnQ3dkxPQ1pSbVZST1BydWUyNkVuTEd5WS93cnY1ZU5xTnps?=
 =?utf-8?B?RFA5cG9EdU5FbEI1Tzh6K3ZyNGh0VFYvWjZUMGFhZExQVktpams1bWlXaWVZ?=
 =?utf-8?B?MnpqMGVjaEl5dUhnVGEvZjQzTTd3QnY4Y1NhRnFzS1JzVkI2V2NLUTJBTkpS?=
 =?utf-8?B?bitWeC9DUGtHZG1ydWFiZW03Si9oNU5JOXZhdDF6RzN6MURXNlJJMWRJdmVv?=
 =?utf-8?B?RGFrODR2eStYR2dmWW5xU1RSRFhqYmxERkNoRkpPOHkxS2lzYjgxb0RXOWtI?=
 =?utf-8?B?VytDQ2lvN2l5akdzVzMySlpOMTY2RHEweWY3TmFTcmNXYjJqTlpOTVBRY1k2?=
 =?utf-8?B?NnlOaGNkbEV1RHdzZFphNlp5TUd6SWt2UnJZZHBNWmVuaFh4b3lkOTBGMmQw?=
 =?utf-8?B?S0c1MzhKb1FZUWlFQUR0SFpYWmVyc1BMa3paeUp0ZzdaakZXRHZ4Q2I1dEpF?=
 =?utf-8?B?bjdLLzh5ZVovTGJ1YmtCdWN2WmJZeEE4Y2hMY3g5eGNCbC9HREJFK3YxdGM4?=
 =?utf-8?B?YVdualZOUE43Uks4dWdrY2pBS1lxemZKUElmaXFpVGFic2RoYTlxVU42SVFp?=
 =?utf-8?B?a3VVQm9mNXJqbVhlZndHMmFEb0ZNNGx3NnlFZDdQSUpMZHZ1UUxNdEx0VTJj?=
 =?utf-8?B?cjk3aDNmNDR1UkdjdXBxODhzaXQ2cXB5Sm1ESmpEYzBDNTV3UnZCODlyNHlr?=
 =?utf-8?B?cjRqdFNqUFliYU1uSHpScENiM0tKbnJqSGlhQy9FQXQxeU1kUFEyNExNVUxi?=
 =?utf-8?B?Q2VEMVlWUythQ2RPOU5tdUNPL1FXYU1YaFhHWEFneFBZMlUwMC9HSXRGZGhE?=
 =?utf-8?B?VHJOc2tDZkQxMGlzUHMrcXUza3ZDMHJpaS9VN0lZL3ZkQWZ5N2FXaEJBTGM5?=
 =?utf-8?B?ZDByMC9NWkdDcm82cHh0eWNIL28yY2lGTzIyWUFzZVhIK3hUTmlMdS91OFp3?=
 =?utf-8?B?enB5NlgrcHpvQVVqTUJyYzZpTXkreVNRMzNHWDAwQ0VURW0yVlhvNGlvOGtu?=
 =?utf-8?B?UCs4REZEZFk5blVwUDB0MkNvZTU2VjNnS3hwSzFrQk5qa01Gd1drMW54V1d0?=
 =?utf-8?B?Y0NlekpXV2EzUUVNTkZzRXdNeHFVUEFIM2gvMkUvMTNzV2lvK0pkQVF2amJH?=
 =?utf-8?B?c0hncXJ1Y1hJM0ZCVjQvSEk5amRIaSs4UDVScURjOC9wUUY5NGcvaFdaTEdI?=
 =?utf-8?B?VDVtTzZPYXVwZzBuaFV1Y0JIK2VrMWlCOHFCM1pPV2dLTDhpa1J5MjAzaEFx?=
 =?utf-8?B?M1grYjd6cldkakJ6T0d6NlFORE9oZGhVdEpXemdRZEtNTG5NTGdrV1FpaEJ0?=
 =?utf-8?B?VWNlTlZCMGVCcVV4M1FDSjJ3eC9SeEVJaGV0RXNjYjZuNDhOWUlrajRRZUR5?=
 =?utf-8?B?NEpTb0dyZFc1aUF5ZFY1SjNxVm51Q2dVVFc5bCtxNW1DRm9LaVZETzJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjNDZVBZUGN0ZHJkWjVjSENrQVJEc3MvUHBBYndJRWY4dm0rNWVKakNJS1hZ?=
 =?utf-8?B?UW9GaFJGWTBOelNMZnBoN21MMDltSzJSYzlPSE56YkRhVUpXNzkwQ1V1T2F5?=
 =?utf-8?B?MnJrcWY2bnpjS2Jxd1NtVnUvYVNvOFpNSWRvZWNoQmVCT1dIN09COUdvcmpD?=
 =?utf-8?B?UWVYTFZROGhQVmxSU2tYT1RtM0N2aTdxcjNHNTdmam5PTFAxVmt0YlArVzd3?=
 =?utf-8?B?UHloZWlLVUtRL3orRi83SUNHTEg0dElzOW0vL0tXS1JacGtaQWx4d0podmFq?=
 =?utf-8?B?RmdYSEdxTXIyZ0MyYlM1a1RtOGNTb3lOUHA1WXBUbUFXRkE5TDRDVUZicmZw?=
 =?utf-8?B?cGh5VFFCSlRTOTNrUVNVUWJTV2xid2R1Ui9NZWQ0aVBGNDhFelpkeU9zN1h4?=
 =?utf-8?B?VHY3QkVPMmxDYTUwKzJ6RHkvNnV0V2x2czNDQnMveXJjSE9VZXBOU3pOcU5a?=
 =?utf-8?B?VngwYk1oM3lSWlQxZjkxcExjNGo4VFRrS2tVRVFWYkFXSTltWHoyY0x1YkZm?=
 =?utf-8?B?dVBUb1BsR2N4RzVTMk9iUXYxQWxZdHZtSVZzMFFqWTFyWjRMcmR4dnQ2ajkx?=
 =?utf-8?B?MDdaQ2tuWHJUNjZ5eUhnK2tJdUU3OGpLQjEzcmo3bTdXOHFqVDN2UUk1bGky?=
 =?utf-8?B?NkZ5NnpVN0xTTmd3L0NIU0JPVzBlcGd1dFhlQUtZSUJhVDZpUDA0TWRSN1hn?=
 =?utf-8?B?eHBEbGs4YklpSUlNV21WWG1VcXV0VDdLYm5CcVZCTVRsY3BicXp2WWQ5dEhZ?=
 =?utf-8?B?SHZyZUV5QzloZFMyQnlyOHdsRG4wbVZ1QlI0cjlUMnlrNnNZVkFuU0V1a2xM?=
 =?utf-8?B?MFIxRkFCbE1VVkdWOFFQY3ZZYm41Tk5DdHdaU2RuTTU3TzlKQUhpdlBSK1px?=
 =?utf-8?B?eXVWWmFiZ3BrMlFKZnh1cTRHY1B3UVl4Qkl4S093ZnY3UGRmNjV1blBMK2ZE?=
 =?utf-8?B?dVBGZDRrTGwzRFJKYzc3dTEyYzJ1ditRS0xzM0VMVm5aM1BFdmFhczcxQitR?=
 =?utf-8?B?K0twUmlUeUVsQVE5TGEyNk5PcmVoTEp6N2UzOFFES21KeFJWWW0yc285VDF3?=
 =?utf-8?B?Mm5pWTIyaTVTV1dkQm0yb05DNFc1ekhXSWdMNXVUWGtpZXFlRGpSVTBLUStL?=
 =?utf-8?B?UXJRYlAyUC9WUmxBcU9wL3JEUEpwMjJleGxjM1o4WWZwalFhSmRPYUJEWjhX?=
 =?utf-8?B?NUZSWU9HRXRiRVlMNzdwUWlIY29idjFEYnBGb0lETVJzdVUzZmpVRThJYzFV?=
 =?utf-8?B?djVOYXF4Q3kyWldMUk9oYW9xWitQTEo4RWVNamJ2dnBjZXZvbjJLVjZjTVBT?=
 =?utf-8?B?T2JIdHU3blFXY2xnb00yVCtYbVVtdEdURkFKWTc0VEErVzBlYVhoQXd3Uzgv?=
 =?utf-8?B?UjNzVi9FeEErU2lwdkxGTUlmOFA0aEFCYmpLSUJqMEhqS1BrMC9SZTBmK0Nh?=
 =?utf-8?B?UnNqSmhITXptM0IrZjlxSjVOeTBDYXBzbGRwWXFHck9sallib2oza0dKaUpZ?=
 =?utf-8?B?VzNyZllDVEx4Mzc5Wk1BTy9ETzZmNXh4LzZxUHlkV0hLN2hrejRwSnZsUzF0?=
 =?utf-8?B?SExIWkxLWnFFVDBScGZGOGp0ZkQ3T29BUEV5cmdFUXhHaDdSTjQ0NTh0NmVC?=
 =?utf-8?B?ODg4NFliUFlyNTJBUDlCN293c1c3UnR3TXp2UzJJemljTkI3Y3pHMk1PVEI3?=
 =?utf-8?B?WHlZMW1lV2F3NFljVzkyMkpUWmdSMWp2THRhQTBuaHVUeTFZREgzUFkrdUdI?=
 =?utf-8?B?Y1h3cERjRndPNWlqcVprV0lGcmdubzFtcG8rU0xxZytzbzZScXdxOHpEd2xI?=
 =?utf-8?B?QXIvU3BvWm0vYStuSDIwdTJjSVNhZWZLR2p5RWdUUkxMMjNVbzJPODJ4aFV2?=
 =?utf-8?B?ejRMQzRuRkUwVDM3TGpDOXZLVmlMVnlmN1I4M21MbFpabk1BU2hVcHFXN3Jk?=
 =?utf-8?B?SEVNNTIra3dHWFNsaU5xaGlVL1hXb0Jxall4UmdsQlR1dXBZaTdJYUFXOTRp?=
 =?utf-8?B?Q2NQaWVDeUhFdHp0OFMyTzBBVWlScDZ2T2Jwdmk0dnRYN00xNDRwUyswd3Z3?=
 =?utf-8?B?bnk4cThyV1JDeVVOQ3JncWwyUDUzL3hmbnh0dGdiSTFScjJoTFB3RnJqbXlZ?=
 =?utf-8?Q?AlE1MXNpVZFS2gfCbJ4F2ImjG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac0c95c-ce43-42ed-b4d2-08dce6a6d16d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 08:05:33.5043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUZP41aQWG4N+y/QBwTqJprFaUdjZkHtOixEphZBisTR9yHM5AJWEYo8XX1ZZjL9mZygGpLJ000kj5pSzGw45w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
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


On 10/7/2024 9:45 AM, Matthew Auld wrote:
> The BSpec says that EN_L3_RW_CCS_CACHE_FLUSH must be toggled
> on for manual global invalidation to take effect and actually flush
> device cache, however this also turns on flushing for things like
> pipecontrol, which occurs between submissions for compute/render. This
> sounds like massive overkill for our needs, where we already have the
> manual flushing on the display side with the global invalidation. Some
> observations on BMG:
>
> 1. Disabling l2 caching for host writes and stubbing out the driver
>    global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH enabled, has
>    no impact on wb-transient-vs-display IGT, which makes sense since the
>    pipecontrol is now flushing the device cache after the render copy.
>    Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
>    expected since device cache is now dirty and display engine can't see
>    the writes.
>
> 2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
>    invalidation also has no impact on wb-transient-vs-display. This
>    suggests that the global invalidation still works as expected and is
>    flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH turned on.
>
> With that drop EN_L3_RW_CCS_CACHE_FLUSH. This helps some workloads since
> we no longer flush the device cache between submissions as part of
> pipecontrol.
>
> Edit: We now also have clarification from HW side that BSpec was indeed
> wrong here.
>
> v2:
>   - Rebase and update commit message.
>
> BSpec: 71718
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Vitasta Wattal <vitasta.wattal@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>  drivers/gpu/drm/xe/xe_gt.c           | 1 -
>  2 files changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index fb80042cbe0d..e98b7b91116d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -401,9 +401,6 @@
>  
>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>  
> -#define SCRATCH1LPFC				XE_REG(0xb474)
> -#define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
> -
>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>  
>  #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2d5e78311b76..1c79660fb086 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -108,7 +108,6 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>  		return;
>  
>  	if (!xe_gt_is_media_type(gt)) {
> -		xe_mmio_write32(&gt->mmio, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
>  		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>  		reg |= CG_DIS_CNTLBUS;
>  		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
