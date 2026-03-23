Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D80EC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CC510E03B;
	Mon, 23 Mar 2026 09:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Apuq2Vo7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644E110E03B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774257397; x=1805793397;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YAztuGJXnlBloUDT2bi+HLOeV4U5VjLlZ0okUEPfgPA=;
 b=Apuq2Vo72QUbgrA4pcyssOg9KAsyeO7U7T+i+B4zxETrVQszNbLZcpon
 Uu+28BVGZe5gSmA1VFdJdzfLud/KsryEa3gUR9BVhpiFOJ4kfSg70RwlX
 VurmIB/y1UpebPx8Sk2uJsC3SYKbbzcDW44KmvbMEFi1ya+wfVjxoe6TG
 YQ8DQgtYFeEVhyTj2kbNEKCGbJU+059Rbw1VJPp6O1bXF/gaQ82J1tDIL
 ty420Hfw53F043/TJrqVQxajthmkD9yLfyTBHNEpDhL0KjPuFNgTvg2L+
 qZkM5QpNH/szQYPvxFOsidlpSGsWIg0BMeCWtJ/HT2MoEFzVAimSXPwuL g==;
X-CSE-ConnectionGUID: S9f7MHgaQhuJhKNZDAi/0w==
X-CSE-MsgGUID: xXwX09CCSrafHFqzDRy3Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75220335"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75220335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:16:36 -0700
X-CSE-ConnectionGUID: Be3sM0fsSGu9Wg3v0o3iFA==
X-CSE-MsgGUID: ZQJ5HizkTBKYGf8OI3Cqug==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:16:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:16:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 02:16:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4fSbKwBkGE7M1a6y12io8fFNh3HShhmPpCT86dXMWQLXQ/OmoQ+0AF/ZBVvq2KHSyWDoFaSY8KgxYzVxji52OQAvX83PiTjLrkTn3emlbXFKEWKBLMFFCWvYMZZqvf9D5CmaP3KbH0K4gZb62Sqmy4GZfnAheATzY38AusjZB63Z+dCPy/Nt1+0ueC5AZuDItvCm9P0UDoHLAenxdljIjRZnRivp1hAH65FlLZoT9Y42pfkT9KX98e3kntCRRcI9+64qRtHwt8IZT9I+uVb/+e78brtudTgMEjlmPCKXlfid5l5VDZoIr7/hKn1BcjMfo/7YS9b9wJo2LLpD5gK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqjiHk7/epurQOsw0KIQg/W5Ln+BGUDdBfI/VhxuBxk=;
 b=UJQg59HL9EM0r73hfwiWWUo7eEyx6EBY7kwhxL8ZNL7C0NEWgsqc1Ou44fBeCIWxXYSlr0Wha3SoAzI3qrtPg4bB20u7VTwDhzPTjGw/unb8Vn6F/zW0fYf98Oz8uJTn1VLXwO2UOZNxT8tALA/LZ4HlNrrwuGSZfQTz88VSpsiZCg9CFcKj6udwxqIarlVPhR7mVt4S9LEveDSU/MmJ0RKEhyF+pUezMpVrgEthOyas/Lo/6zbQYPK5SXlg2p9cpXsQBt7mLIM3N/kJQNr7qKYhxNe55GTvVMThTVB/V43zgPXp2uPgpKDOanj3bzILbMvmoYMoUmHjlNB8aKWIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPFCF54B2894.namprd11.prod.outlook.com (2603:10b6:518:1::d4e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 09:16:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 09:16:33 +0000
Message-ID: <ffddc490-017b-46b1-ad10-f60ea8eeebc5@intel.com>
Date: Mon, 23 Mar 2026 10:16:30 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Improve_getting_clean_NULL_context_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
 <177287644061.329859.14779825091938342622@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177287644061.329859.14779825091938342622@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPFCF54B2894:EE_
X-MS-Office365-Filtering-Correlation-Id: fc302dab-80ca-4138-8c26-08de88bce08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IgpluAK2N/XgGVyr4DuPhVpw3seSoR+2fkeTg8HXToEWbwsx6hJWdxJ3Tsz38tsyiUEAm+BdlonmMQPdeQlc1GchWupbTKHxkVvlsu89BihE6knmMYXvZXcnSEHzNQkFwQeUIlklBS7eKQKuaDcd3TpkR0YrCez1iUC3r9cFHdvmmlTWOS9sneiGG5oVdLMghOfiaGn569VFqPxYei0KeFQpLwVZ+1UBfgp0SYpzhMXbdBSaAKrJHUv3+JI2MLzzupsMIbsV+HGPzSe/y2hWEOSPSGZHkRvn62kVpCWNY6KN+f16PCc7zHvOThEA/IVScHRRR6nbj2VLzGDOQ1eZduuNLsxgx8I+L1jZ4SldIMKxs2z1wxv+LSXTGNDfpl6DSUQk4krg+/JbaVMVPT3FZS8f3f9bUhetx9fWXTtloDTHLcBaZe8tvxoXggOMNd9Wy20tT2jGqoOqWyP+LA/jeLyJeckyINVFffLFQjVX8NxDXwPoQYclSFwKuWLM5Ag/NuiSvQdrw5x3phVysf5d8f/D8t6hua17gecGVumwgavTp8NjuhgXDpnj2VjgFWXIR+oVZsj3nRGCwv42rQX6+u8EtsKFeuDM+pvAEMgC5AL01XWFVUMTcMoV/C6VHjBVUc048wAv3kZHQBfBCTecIiatz91yUCfJ69U2lV3WPQwc872ATxqoRnIgIbZSoqS+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVRnQnNWd1R6RE90UHpFdlV1UHNQWUZTanZaZi9xYjlsVDA5OTQ2VEorNTU5?=
 =?utf-8?B?ZWV1NXg3eEFGRkZsZWM2WCtZTmhPOHB4WkFiL3QxUEkwNXk1TWpnbFdUZm9Q?=
 =?utf-8?B?T3RHZ0R0V3RjeEpMY29ZZEtMMnkzT2lmNVBFM0cydU82dXM5cWJRUUtndnZS?=
 =?utf-8?B?V3JjbkNTMXUyc2lvc1dCbllXTys1NW5LVVovWEJmc0JZZXhJUGNvb0pYWmt5?=
 =?utf-8?B?K3dqM0syOUtXVmdtVmJlMTlBSWhYanZFZXFSVHowMFVXemxacEpUdldIQ01y?=
 =?utf-8?B?b1BhL214bDNoM2JOd2J4TVdzcEEzRm5WbzMydkY0dDQvNkdPTEFadEIwRkNT?=
 =?utf-8?B?UTB3ekNPNDRxRjZiWXpGbXhWcUQ5TVpsMWVnUjNVU1NOUkpJVU1INkk5RXNu?=
 =?utf-8?B?cHFhakxQUW9MTDR3WXVndDhLK3Mva1QwV050cnRIekY1WmwwVHdKbElVdXNh?=
 =?utf-8?B?SWh6eUc3eVBrNmY1N3NWb1A4NXFNUEpvN05VOUxzRTlPeDdVSGF5VW5RYVBW?=
 =?utf-8?B?Qk5tQWdzZ3JKMTlWY1VHb2F5d3phSldPMUIrQnNLd3RPbzZNb1JhamRpQlhh?=
 =?utf-8?B?N1cwd2lIVkUydVNFY1dzcWtyMzl6Y0JmSG1vOTRiQ2plRDFHS05MSkh0dzZ5?=
 =?utf-8?B?MHlkN2NaaC83VzNYdWZOY2s1eUhNSWNjNjVWb3JKbDJQcDhrZlZyODFnNXZZ?=
 =?utf-8?B?VjRURm1DSlBnbCtMT0NoN0kyWlY4SkIzcFJvRTVUMDB3c0llZnZvelJsZ3hW?=
 =?utf-8?B?Rm9ZZWZwTCtqSWhhTTBwMWM3a1R2Mmxuc1NnaXZ2TEtUalIyZDN1ZkhRQVU0?=
 =?utf-8?B?RTJtSEVrZXhIV3hFcHFna2J1ZnFNempQQ0VTdDFVdEhiNVVGaU1nTnpBWng5?=
 =?utf-8?B?elk0Z2hxQkcrVXdJWjBRb3k1d0Z3U2wxSHFTRTFiMnV0T2FScHJnNTVQQnUx?=
 =?utf-8?B?bTM5V2FjYTFzOGdQcnhtVDBORDVEbUJyRXJNVHBVc2VDVVBESDBhalRuR3ZK?=
 =?utf-8?B?cDlWbm1qRzNRSC9UdzNUVW5Uam9uVjJuR3pPOWxhODBLTTJaNzZFQmducHp1?=
 =?utf-8?B?QlVhcFhWS212Zld1SDUrcmF4bHRYMTI3Z1lXd2VVRlpPQ1ZKWEJoRnBLano5?=
 =?utf-8?B?cTJjVEJYanA1Y1pDa05QaHk5am9BZ3pSZTFkanZuSnRhdDdaM1Z1ZFNzalFR?=
 =?utf-8?B?YjJOcWY3YkdrbmpMeGZTMWdWTHVscy85b3Exa1JIVVdCcmIwcDFaMjg1amJn?=
 =?utf-8?B?SE5MRWMrL1Yzb2Y1MHpUN0FyRlVPRjFrMGdnNDF0ZXRqbGtOK0s2enh0cnFE?=
 =?utf-8?B?MjkzRW13U3F1WjZ5ZEdKdk5jTndzQlZkUzRqeC9RWXFjekFkRmt2czVtSmlF?=
 =?utf-8?B?anJndHNuUW4vdVJPcnV2eUdTZmZOZGZ3enZNd1Z0YkJZZURWUUJTc3lSRExV?=
 =?utf-8?B?TTk1NFkxMnJlVU1jU2Y0cnU1MG1wQURYRTdCL0ljaGZkMk0yMU8rVjZCSW1U?=
 =?utf-8?B?bmJyb0EwUlk0UGJjTDg4NmYwV0RqWXNsWnYvWmR5NXlrTTJkNTI3SUdLZVd0?=
 =?utf-8?B?b0U2bC8xdDNUcmxZNm92MmRCd2RWOFlnY3pXSDBCT3pUU0Fkc2hBRmJ5bzZ5?=
 =?utf-8?B?S0J4TXZxS3J4cUdtNzE2MXY2ZmhwaFNaQzZHaHRZYWRBZTVKSHplM3MxbjZE?=
 =?utf-8?B?K3lUUDRINVd5WE5WRXF2ODc0aEJRZzdjeWlMc3J2WHA0R2NxdEJwQnVvTFho?=
 =?utf-8?B?VHdveWJxeEhtODNQQ1U3UkpMR3RaQ3JwZFBMd0o2UmRUdHFZSTlCNllNYXRF?=
 =?utf-8?B?c2drSWk4QUI3ZUZ0eUI0VGtaNjB2dUxsK2xnQzh3WGVoQnpSbmcvT2ppTEt4?=
 =?utf-8?B?Z1FrTUNqUVBScmduTnNyL0FxL2tPRGZqaWlWNmY2RjRWbDk5N1Z5UnVTc1NE?=
 =?utf-8?B?MkdnMnIzTllnOE5ueS9IT2VCZFBZMXJGOW5adVorSlFBSE53ZWI1TXNnT3pT?=
 =?utf-8?B?dHBBaUk1dFl5anBQL0QrZ3pwWTdRSDV4QXkralFadmtEanZEME0xTTN6M0FM?=
 =?utf-8?B?dGJ3aGkxU0NLRnpPTXB4L1Fya0VrcUZVWWllZ09tWDMvTGhTTnE5OHZERlJ1?=
 =?utf-8?B?aVFxVFZqbTNXT3pVR0FXQXZZdmFTMTlVNWl0Sk9LaHRibEJjeHJFNTV4T3h6?=
 =?utf-8?B?MUFFdEsyRjFkWnYzMXZINE9OKytWTHFnWVFweHI2RTRBSkc4Lzl2TXpCZno5?=
 =?utf-8?B?VzR0MUEwVmVRVlRwVXNLRE1kM1VYTFpRc0xUNUxSN3AvV3FKR3A1dmg3THhO?=
 =?utf-8?B?aE1NemdoQmJkRDVVRy8wUUppeFRuSERaVDZxQTFwZHpMd1UvdmlMZzB1eDlH?=
 =?utf-8?Q?r8sofDXMqblZEKNk=3D?=
X-Exchange-RoutingPolicyChecked: YXGL28pYIg8Tm3nYvTjI7cEO5o27owJi1KySfJ0QTte2ZcLh7uw31dWDNT/DSVCn89h5nAMUlEbUToVGJMhEJxJTFpwX5hq/6i3bjC6f0kE4hdbY/FaH/J3ht7KwcO9Xm26hbFxaXN31zVvUbfrAfLugzmzYKxnisJphDNleE1Us6Azufn7aOa9pwLDNYEO0pcFgv8mgy80i17ms8FvfLy9G72GP36fNMcF1xA51DsVuy21wd31qI2ZQ+bCyA2VsEAJ04px9wnJiLipBwUExef30WE2Xjs7P7ct7nO33sV6uJym3kaEi5ek+25CEsIWN7RR8ZaKp+FzEqlxx0HcgDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc302dab-80ca-4138-8c26-08de88bce08b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:16:33.6468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nWtcSYJHutoPnUEebs87uGTi8uWFk5iwtOZovNb9E5H92GmTVrBe1u5NcRE1ezFW1tGZ2UoqbmGPAcA2vAXgBt+6+z2iW4YG5TCEpmo63k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCF54B2894
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



On 3/7/2026 10:40 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/vf: Improve getting clean NULL context (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/162520/ <https://patchwork.freedesktop.org/series/162520/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9_FULL -> xe-pw-162520v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-162520v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-162520v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-162520v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

only in KMS tests which are n/a for VFs anyway

> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>

(kms_cursor_legacy:2687) CRITICAL: Test assertion failure function flip_vs_cursor, file ../tests/kms_cursor_legacy.c:1035:
(kms_cursor_legacy:2687) CRITICAL: Failed assertion: igt_crtc_get_vblank(crtc, 0) <= vblank_start + 1
(kms_cursor_legacy:2687) CRITICAL: error: 1693 > 1692

>   *
> 
>     igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9/shard-bmg-10/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html> +1 other test incomplete

(no logs)


