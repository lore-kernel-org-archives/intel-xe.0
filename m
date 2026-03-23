Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AB4EC01A6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0F210E3F7;
	Mon, 23 Mar 2026 09:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuJetSrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC1210E3D8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774256931; x=1805792931;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2vYgdEi33fbXuLLFBE2sI56wunxG6QNeGV0wG24HCuQ=;
 b=YuJetSrSVH54ss8D6sUu47NNG0++Cb5R9Y52H4DlJteuwgKRn3p56ymQ
 WoGLpxxDekF1KSaPnhTppW/p//u2Yd7BwF+L7Y0W9tpKNgMICK6Aj6XCh
 7Vly4107V0ziQ2pAx+jOi9hekwvGSpZzSMB4GIn4LkPmT3OCMrV7xBlZr
 O9P7oMJviHYeBDZGbW4LV1oSbaDJZC8Th08RpD4O/036K7ELfMA3HWTYa
 19fniMCDc3RYAUX6jZqijjpbMNKT042iuoxAXr0uCQLEGXPwHjBR4Kyu3
 nU78kROzy8OpAMjJQPpmovtnSCmGIRPxo56989WDd0eciTiyutIagw2h4 Q==;
X-CSE-ConnectionGUID: mkm1RdtsQgeon5w4+7He7Q==
X-CSE-MsgGUID: 8s2LTErsR1qYOF9OkB5jSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86613890"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86613890"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:08:51 -0700
X-CSE-ConnectionGUID: EiCciqofRoSAIIR8SwL57Q==
X-CSE-MsgGUID: mVV/LbSTTfGRXTe/PCKYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228689735"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:08:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:08:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 02:08:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz5v3rC+VItx0KPeDljAjfxWih1aalJlZFMdrZ1O4X/Uo0MfLTHzEQsBHmu5Ya7KicdRqxCO8j9i7KpQI5kczKrOjRkpgazQg5g669WGOt/kFfrIeYtzNR4LdsPt9B40xYjohoW5fsimdf6SJbjgHA+HIuU2hMll9eT56iiTOyDukTisj9WSOofVGc9v89oPyTqk2lcOLJqVrSo2T5CEwJdDVUIqxtrXV+0M8dUYB/GtMnknYxNKkRAeyYwT+qqb4cvL3uGKzOsG2LCwoXAMvbEnT9QxYQzR0aYKLui+BibIPFzCXVCMyfVAXm0yeXvSsRPcDuiQkyHwttHhVAgDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUx7JHWYTbR4SSQjo/iOMNx407WuR2qEl3zGf8DBuDE=;
 b=nF59aCUGffXeNrPAuZFQj5R9T8crGf38twsdCop0yjOXV19Q0L4opMBGCZTppnGFSSJ1OxOCRsHBiH/Rs2IdFL4erOVTJHzzByta51Ikdr3c97WKn04V58Bip7tNQZD99WjiDTcnzE/5bTk83x+RNPegWnFDehQjI8PZVsnDtgH0G5XMJRKoKSG6ILaw5hoGu6Ehz15qi4GKzCZTyliGql9ghRhZjGCP9P4KelEhMDLefCwzg+v1z2lktbs4g8bwVeVwXcLjX14u+spVj3agctmBJ70yAzFfn5q6RujML2xSoOjT9o0w4s0wBTAqEbxttSBfZFdQoxQzAs3ZxtifCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPFCF54B2894.namprd11.prod.outlook.com (2603:10b6:518:1::d4e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 09:08:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 09:08:48 +0000
Message-ID: <3c019d17-4b36-49fe-a570-d97bc73e8c20@intel.com>
Date: Mon, 23 Mar 2026 10:08:44 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZS92Zjog?=
 =?UTF-8?Q?Improve_getting_clean_NULL_context_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
 <177278971648.325615.16518170783259880674@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177278971648.325615.16518170783259880674@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPFCF54B2894:EE_
X-MS-Office365-Filtering-Correlation-Id: 220974bc-cc9e-445c-1baf-08de88bbcb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: As8EUFSjqqpngbIkJs1x37cE2ptgRtbsk7UssTqGG17Z2snEh+oW8BJ7MtaIblONe4+VndiEKckQzjefDhYjLbu84RsXdHyD4pkhbp7kdsvfjpjyPUgJ0p9kzH8oBcPxkpa9Zutf9pjcePMzBYc4Bs6LXSaTwoBSS5rBU6Ums5rrmSBVgPIugliQB1Z0ZK60q6Ss+MXmW983346Lu5aK2dPauJzWiaTYha45waNW21iLn1STM1uAh+a9aSLHN6L5NiZV815lZnifBIKmz5SLWHNHQT1qDLmGsY7n93qbGUjfEOp/sgGXsVo6qf6HMEiH1hTD3SBPJgK1dluIcEQ/g7WRe3Mj/aAEioCuQYtO6llMCNAz7K/1KZrHOZfZq/L51i735SQuTH20vKD4ChACK6EUAeohFDMTjUnR+Jjg5YXYjuJ7FMuQCF0qKMjMtUuMTI0DpmDn4r4+e48go6UvmGohZSlVprf6GGRfLX9yGgsKxhT5tdQCI9pEJa9cuyfen0lsgJHQ81u1HAJGJa82SeRZUn7TImeWK1E2SLxq5TBhYxcpsQjDoHSzVseIUtFuSZGbfAz+e1tTKsDTgQNLz1LYCfP3xXfMb9qVDAUoAAUaNLobCEUPGMW6TftMdxJvnWD6HZEtutiCYGM92K4P9RHoThusVD8e7kD9XRpXycLOLUBXaWj9uw5otp0nkMVd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1JvU2dZVURKQW5jLzU4U1dvWUgxdDBiRWpzbzlocXRRTndlZkNRTWNlY3Ix?=
 =?utf-8?B?NSt0bjlrWWhZY2dzMXNYSkdkTlV5WkZZL254Y0VnV080Wk9YL05yQndIRVhN?=
 =?utf-8?B?UldMRlFCT3dMdThFS3BMOG93bTNKb1F2c3V1bTlYS21OYVZrTnlQa0llcjVK?=
 =?utf-8?B?UmFKekhuMHVyRmxBNmw2Ync4dWdsZGdLVkYyeVc2YkV2NCs4QVRQaTB3d24z?=
 =?utf-8?B?VWI1UTlBa2EwSWl2a0MzOGdoU3FwTzlpb0s0N1Y2a2FFNmpXdU10ckcrc3JU?=
 =?utf-8?B?ZjMyMWxiM2NGUXFDYjlPZ0hmMHhXVm9tL3JMVzNWT0tvelpaUG9OcCtKaUxT?=
 =?utf-8?B?b25yM1VpTzB0UktrY2c4WmxtMmQxalNjZTVyUWZYa3h2OW1VTitoOWxDQlMr?=
 =?utf-8?B?d1VKRXNCdnZrSjE1d21CSkJFYlJyZ1BqT3hrRm1rOVAxSTJrMElDdHJLODFs?=
 =?utf-8?B?Wm1LYUZCVWJsYnN5WTRVNDVXd1AxUlhtbiszWFp0ZEJmdldOWWh1QUpPKzFv?=
 =?utf-8?B?QzR1RWg1RWY0eDczbGx6TEFpUXdTdU9HSWFrWm1Ca05SWHdobU5ZcnRqZXl0?=
 =?utf-8?B?czAwMWl3TTFrdjEwSlROcDFsTGkwTTJoRkdyTHE3WEx5NDlGNkwzQUt5OFRi?=
 =?utf-8?B?MStBaklWbFEyKzI3bmdDUEZlekgyQWp6UzV2WnJ3cExqUHdwbEc5cGZWdjU2?=
 =?utf-8?B?NVIwZlNRUUk2Sk5GNWJMMS9WN3Q0S20xVHF1ZTdpZ2IxTDF6NStIWVgvbEJa?=
 =?utf-8?B?QlFBZ3NpY0k2WjI0a0doY3JYNG9TS2ZCeHhSd0tQUldKbVhDOG9QdkZWVW9p?=
 =?utf-8?B?aXA2ZmVsMkRuQUU0dDRDYzNBTzc2dTc0NUdVYnkrNXMxQThuN2NXR1NKRnRy?=
 =?utf-8?B?L1AwWWdaQnoxRjlERU9EVjFTSDBCSzl6d1pPOVRrTThXQXArOUNoaG9URGZu?=
 =?utf-8?B?Tlc3UnhtNm1neWxLUkVMaGJSWVNEQVV6aDNCSFRtVURDcFJBSFdCZEkya3Jo?=
 =?utf-8?B?UDloOFJRNDVieXBES1RUSkNCbTNTQUlnbllyak5KZzNjNU9IMjNWL1pZaExV?=
 =?utf-8?B?VURCa3llbGpTY3hXYUFtQnNQa0ZNZmJsODhibG04ZXpyK1RTd2VIaHQ1NTlM?=
 =?utf-8?B?UzJQa3NCVzlTajdrL0hNY0sraWMrTlJaNytsZFZTNlh6aU5qbWJtRWtrZ1Jj?=
 =?utf-8?B?ckplekVDSytXUlo4NDVkUVNNMEl1SHdsc1hpekVIKzA5eXN0cUYzQ2J4cXZB?=
 =?utf-8?B?Qmd3ZWlBc00rSTRTbFBRc1VpVEVLT2kvSDVqRXl4Qlg1eDhWUWgzdVh2UFBV?=
 =?utf-8?B?enM2NUw0MkJsa3E5bjhHc3doWEtmTWJ6ZWN5TlV6L1l2NUFsVHF3dUFnYis0?=
 =?utf-8?B?bGkzci9Mb3FFaWV3dXlPNXoybFE5U1hyVXVvbFplMkdFVVlFZ1hvblVWQWxn?=
 =?utf-8?B?eHJ0bzAyNEpZV094Y3JaZkFJWG9mbTJsQVB3bHJRZVg3eGorYTlVOXdacW43?=
 =?utf-8?B?TWRjVExhSEsyZkFDakV5ZWRneFg0Tk5FWVZZWEo2M0Z0a00xYzlwQjc4a3pW?=
 =?utf-8?B?RlkzZVZBdlhZbVVTV1RZcm1YN3F4b0hLeVYxQVVvZzRXcys1MUJ2VnhDQi95?=
 =?utf-8?B?b25FK01wME9xbk9rYXcxTVFmVm9GMG5HdEZCSWtKTFd2Rng4alAxRTBtM2E5?=
 =?utf-8?B?SGdxUDJMdFJEWmFwSmRLSFpESysyd3FaT2xMY0prc2o0SHlmL3ZwekRKNjA3?=
 =?utf-8?B?dURSZjlYa2gwRnhBeUc1OEFZMDJWNlQ0ZDRJWmU0c3FKS094bDB2dUEyenUy?=
 =?utf-8?B?SVZNaEdVZ0ZTVTZzUmxkMHJTWkFDUlJOcGxMT1ZnRkcvQkZqcFcwTnVTRG1u?=
 =?utf-8?B?RlFoYVZpTVFrU0wxZzhlY1BzOXNIdGtqRWM3THQvZUp6bjRMTVlhMjFnVktw?=
 =?utf-8?B?NEU5VHZwWVNDQ1ppUldTMlJUZHE0SFpMeDc2OU5zOHRnR1gzWk43REUvQUtL?=
 =?utf-8?B?NmZkb3ZhaEFrSVVwS0k4ZkRHbWRENDdva0x0NW1KMlBMRlVwd0ljTFVQVzlH?=
 =?utf-8?B?VnNrSmx6SkdHRXBhZGRndTJwckgyV2hKMjJkWDhGam13c0JFTWRvQ08wc2NX?=
 =?utf-8?B?T1ppTjloNzhwczNkTFJXYlBYYnQ4bG9MRW0rRCtoMXFHc0VNcDBKTHVZOXgr?=
 =?utf-8?B?amJuVktlNE9vSjBNZU4rNGpXRVFlYWhvdnRTNUkxVDBBbERKbmNOa2dBVDJq?=
 =?utf-8?B?RWs1QTNlWDBHTHZHbldTSTFHY0xiQ1VDWUI1aXl6Zk4rb1dBamxGNTFEbDhO?=
 =?utf-8?B?ckw4bFlWaWhXdllZNE0rV0h1amxzVUdHV2FpbzVYYldLajV0ajU5ZEwvOVNG?=
 =?utf-8?Q?e/OJW06Ootj5nS9Y=3D?=
X-Exchange-RoutingPolicyChecked: gbLXh0ZZsFOhtrVqOD3O+wCw+Yf7dLN7l2poot10qS4YRQDkAKUGwCSe0Bcr+kQR6cnOf3Z3uGi/X+YQWaciSbWp7/nNVLvmda5Sh/7zFfdMsBsrEd8XUYeONUDJFxfCDadReZyBO1gfXOrHj28kG0+rpHllOTKt0Oc4CEMKwUy6UQ1h3ra6g1G5ULEAYoWHVJD36M2PD3gmdl6fcdv2a89gHMZmrhVz7u0cBbLWWTHK1A4/v22Z+0lF4bjmB5jZqDl+JkJUedGYwIBTcEa9WCZlWIzuHViKz8hyJ02fQgTcVplCF1pYMiFvA5cK3wVl+myyYjT6uCHdnDqKtZcknQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 220974bc-cc9e-445c-1baf-08de88bbcb0a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:08:48.2259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWNOgF1gCSp3Xk36sluPmt9lNsGf35P/GTXbE3567kyxErGjAdUYUX5ygN0XdIJlAP0rYjC6xpXwJaTdJthUl7ei8hdg8/8Bxd+ZmmkIFOw=
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



On 3/6/2026 10:35 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/vf: Improve getting clean NULL context (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/162520/ <https://patchwork.freedesktop.org/series/162520/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9_BAT -> xe-pw-162520v2_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-162520v2_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-162520v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (14 -> 15)
> 
> Additional (1): bat-pvc-2
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-162520v2_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_module_load@load:
>       o bat-pvc-2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162520v2/bat-pvc-2/igt@xe_module_load@load.html>

this is just an old PVC used by the CI:

<6> [125.688216] xe 0000:aa:00.0: [drm] Pre-production hardware detected.
<3> [125.688218] xe 0000:aa:00.0: [drm] *ERROR* Pre-production workarounds for this platform have already been removed.

> 
> 
>     Build changes
> 
>   * Linux: xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9 -> xe-pw-162520v2
> 
> IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9: 79792a2fc5d37b5446e543f1de05158ab0f551c9
> xe-pw-162520v2: 162520v2
> 

