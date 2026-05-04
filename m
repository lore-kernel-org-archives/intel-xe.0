Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A485CD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 17:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD2210E7B5;
	Mon,  4 May 2026 17:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeEPTm6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2C610E7B5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777915748; x=1809451748;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=pjZk8TE3olbl94pDhO9czC/4xM60kSe48d235D0+VrY=;
 b=QeEPTm6++/PT3/mEIoMzbRyFnCCBtdyz02RfWx7W8DkAY9oqkWSQ0n3Q
 MdDr+SwPowMn9gAC6cmwxcRp3lHYwiEhVRAWAwppGhvnu55ntKJi2xPCV
 QTbGHAhmhmBcIRYyEchvnMjuN3NIOrO/FSMFeojNp46leWAA8VbbGrORV
 MU9gQt9UrR2Sh75uanTh6n8u0YOokjKADJvPGMzeh7PE9UsAbn7iTmr5t
 MG4k4oZu9lUO5EZnzwswX/vbI2Y2rom13I/q8f1t8dXwYCa9ealcBzcgF
 SeSt4Y5y7MWyKuHCZWDMrt5K/ZrVRGqjJlUXSFZ1r9joZ2bxcS+8z9QB/ A==;
X-CSE-ConnectionGUID: F2qhG7cQRlO0S+8pc7vFYw==
X-CSE-MsgGUID: jz4PVm1EQouqdrykAdZ+Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78971428"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78971428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 10:29:08 -0700
X-CSE-ConnectionGUID: qXyr2GRvQeSkKajQfcXntQ==
X-CSE-MsgGUID: dSUBtjHJSSSW7lNCwvIRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="232908881"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 10:29:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 10:29:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 10:29:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 10:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep7XnTe06dN4AYZbF/W73tI7LhSE3GTqlVH+7zABHN3DJ7acbKM5N9zGOOcya80gASHv4p2yV2QKZTTeYsMTz3BXK87a0lfzY4NGJG8eaxfDVEURkppV4cYwzddKl89VeUL6DscWYxl67yh25445pDNR74/JGE2o+OVc7Cx9w6cx9roErg3JswNazVlmNKc6m1rlP63x1Q6CCratrAMOPFn07IB4n1kG4aUg30PM/YSAbbP1kgCxf+gDlOrp83YJZWthC6oPqK3MZ/+oV03k3n+e7dfAZyYWU5edn9x24EBDh37mlQdSBnbSEAhjfYMV1VYxzUfvanmpR14ntVTemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjZk8TE3olbl94pDhO9czC/4xM60kSe48d235D0+VrY=;
 b=ldFSpPN1uAeuRa9tg192LIaRUru/vStbPL2/ddDbRjz2SIamYb+giB5VjEllz6paZn/oez5OlH78sGn+/usNcNhwEOCOqXAhME3w6uLY6Vl1Q2CO7OhGo0zDdOSUnB+Cy9cjc6zjpuTyxxqh4ZfCoMXgsFND5YipVK84mFVS3XAUvSY2YkyE/ylvvDBmZrysMO+35szXvA01/Rwlana4tGtb1PRUQ4kYkQ0XAV43fPBpboR8YgHgXXczw/ImD5mifpej8saZH4i58cORvyWswWotNYX9QyrKBkZ3iqJIhZTAJEsrUWiKtmfotYvNCxAbR6zrvyfvuiMbBl9YAVsNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Mon, 4 May 2026 17:29:03 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 17:29:03 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
In-Reply-To: <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
 <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
Date: Mon, 4 May 2026 14:28:59 -0300
Message-ID: <873407dqxw.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a12e548-70e1-4c31-dc88-08deaa02a2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: uaXKEdCsVlYu+9k/4MyM39YgNmbfdoYcDUPWsPmNz1lwRNyvwqDhDfMJUJMC2MB/476BXNUiXczIr+cvm+14oSMiTRPxwA9LLHHl/B0Vv3Y69nqsjBDwkGs7JLMCsr6n3s0j3Jur+DhZlwc5AdiIFZ3yIAQhu6EZNp3/agAsx3TLco6BQVjVz39iefjwnhtl0n0NVzuztQ+tDz1A97KHvfb609sdjfFQn1RlrbnAVXBD/6QMPvmJOlw6o7Ab1MJuW7Vy2u8xc4pW6kh0onb2fLEaYsDPatWIIyo66Uo9EcQ4N9urUcARJ0Eb5R4rNYaihLPUIyaQ4/GUzNbHnwLgw8HRsvNyiqUsCTDl7DfyglzNZ63DegSPMu0NjHmePfkRgVN3olkTDHERhEZ1fOrnjGLce/fKcbgOLhxjOTdDTMZECFDUSgrtyFXYopVTq5NSP2UOvxi1gCjknYgsFcaQ6gb5rwtCcfajMfcUGP/IUmhSY78SEA9rGR7bx37COGi+kSEHc6rnJtVZgwUF0eCvUyQoXwCFz3TIWtRtd4eTg9xGlh8McA9U20X47G12H9BQqxDhTMep3UMKD0QNorkArAg1B8FpusX0AiHVDn4ZRpopFBAQXhqGX3d+p2DiikA3ouC8l9RVN9CHuniqEWixbuThsWInUxyRPeiVbFlxJFMq48HxtimMT4gVKH9qWu7p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnBnL3ZlR09NZlcwUzJONzRCMFRleVEwbmdYRlVLVWZyS3JvakYwVHJXUWZy?=
 =?utf-8?B?S2FFc3MvcVJsQkc5QlpYT1M2UjF3UHV5Z3Y1aHBHUVB2Y3JBNHVmZ1VGVjdp?=
 =?utf-8?B?cCtkTzc5WWxrdllRWmYzWFZMampuY2t2eWRiOEwxR25pemZmOE40T0VqUGM4?=
 =?utf-8?B?c0dXZks2c0xFQkUzVDJrejNZaU1LUzFqY3BKM2hNbFJIOGQzc3d3bU9LVDNK?=
 =?utf-8?B?eksyeWp5MGhLTVZlSmJTY0NwNmJSQlZjSnJZV0ZnZGxYS3BHWVJUMG5TQnlN?=
 =?utf-8?B?VlJ3aHZ4c2crZ2EvZGVreCs5enNjVHdiM1hDM0tTR2VuRmJzU3M5RThUdTBT?=
 =?utf-8?B?RlgzTE1aOXQ5eFBGQ2ZEQkppaEt0WDd3dXlDc29DQ1NWajRVWXNTOGxvV3pO?=
 =?utf-8?B?RzFldyttU09TZUY2NjE5WHFPK3o4RktTNjVnVDFuWGs2SWhNY1AyZlB2TDFW?=
 =?utf-8?B?VmNPT3JJUnhDZmM3V3laWUlMYTdNazZuencwc21SaWhCS2U0NFVoalNsS3Jn?=
 =?utf-8?B?VXFuWWdGN1lkY1c0SlJOTVJMOUtmZEdNZG5YNnBDOGVONG1SdGJweEJzMmM0?=
 =?utf-8?B?ZzhNaXFnZGFVSUZKMDRxN1p0YnplTllFd2l5VGFabDE3RW9XRld0NWVKcDY4?=
 =?utf-8?B?bWtoc1VHQ3BrTG00Zloza0Zyc090K29ScW9aUElrSm8wcmQvVzc3TlYwbGlo?=
 =?utf-8?B?YVRVaHp5eFlnekczTnZQVEV0RTJLNnNzeDZFQVA1YWhOMG8rNHpEMjc5aVla?=
 =?utf-8?B?WFc1ZUNDVE5iSDBLNUY2TkhTc05CR2Evd2o0SVFIa250dHB5Wkp0ZnRLaGgw?=
 =?utf-8?B?bmkrV0NJUlFjQ2RTWVArTXlUVTBza2ZINUw1N3ZDMGRsSkRyWkJoTjNQOTBj?=
 =?utf-8?B?ZkpDamZoVDZDSHAyNDY0MWtaVVczN0pmOUdzcUlWTjVVaVhhKzJ2eXAzZEZT?=
 =?utf-8?B?MTVGMFVSeW5EcDRoR0hWY3ZGRzRDSlAxY3IxWlpOaGtnYk5oWmxzTUl0aWRn?=
 =?utf-8?B?KzdUNmRrcVpPYVRCYWNleDc1czBHUkdaZHBpN2k4YjlZTyt0ZklrLzZoY0dq?=
 =?utf-8?B?bXhGUVJQcVZ0U1RmN3Z3VXJFQTZlMnJvZExLZktvaU1KOFk5LzFWZ21ockVp?=
 =?utf-8?B?Q3I5UE5ZdmkzVG9Hc3FFMUY0dU1mQjRmSXlUVzVObW94aHd2azhadmhITnpE?=
 =?utf-8?B?VHBzNzFCSzgvYTZ3OWc2Q3IwdnN1Q1QyQWVucVhYWWs1YnMrRk9QWHB2blF3?=
 =?utf-8?B?NVVJR2UzWkQ4L2JXeUxHb1NrQURCL05PZnl1QzVSRGJ5cEZaUlhlRVhWTFNI?=
 =?utf-8?B?YlI4R0hPOGdtcXhHYW5BUndrMUgzcThoODhZRWpIeG8yb05lTWZSNnVjVmhU?=
 =?utf-8?B?NGkyVW0rUG51MnAxT2NCODU1eE5lRE1TcHFWSzlBMVFsbVo4NGx2aXErZ1hX?=
 =?utf-8?B?Zk1Dby85NVNJMldEd3drVUliUGZjK0N1RE5SbGkxMnIxZHhHd3dXZlprNkxs?=
 =?utf-8?B?YUNzSWFzVDVBV2FJSUZ5N1FTUjVJK3dLOW43T0NZTEFVZE5lZlE4V1IvODNE?=
 =?utf-8?B?WWgxeVdUMWVkT2NMSjE5MmtNWVJ4N1RYQ1NsRlZ0ZithTDVuMHNMNlpYUzls?=
 =?utf-8?B?VlUraFNtL0lmZXdyOWkzOTNQWHduTzh6N0hRd2IxdnIvUm1HdTg3dUx3Rndk?=
 =?utf-8?B?WkJXazdYZmpuZUdnczFRTFRsVWljeE5nVTl0N0YxR2tJNDVCaGZBSEVRUGk3?=
 =?utf-8?B?dXdhT0V5WHh5TUZYRHVJZVoxRU5LbHZldEE3NnFNWXNFbjZEMUlDYkZ3QnRS?=
 =?utf-8?B?UmVISEdiSUxBQmZmZ3BXZ0JEQjYzd2JsV09oSUlENzZPcjNUTXFUR1FnRUtp?=
 =?utf-8?B?d2F6YlpaaGl4ZWNDanFWdVlvK0d1MFFWTm9SNFFDbHA0T2p1QWhEdWxqUExV?=
 =?utf-8?B?WUZrenNhWUFMZ3RMdytJS0hwNjVzNXMwRUlwbEhSdGZCK1lOM1FqbEpVVE5h?=
 =?utf-8?B?VUEzRmNWNm45SHhXcnI1aGZCWlV5NjVoUmFWVUpRN09iNEUrMWlEWUJNSGo0?=
 =?utf-8?B?bGd4ZVdCUXVjZFl2NGd1eGE4NTFuZVZ4YlVwV0VsOGVweURjU0NPd1V4S1FT?=
 =?utf-8?B?enlmZFVEMjExZDlLbENNZ2VwdE5PZW16RXpOYzV5NU5tU0Y5bnRIZndCS2Y3?=
 =?utf-8?B?R2ZQdVFOcC8zOFc4eEw4SnpJY3dkbyttaTRnY1BHTlZkVnhnQUFsY0FDbE1E?=
 =?utf-8?B?YUs1MnQ4azJHWWwyTGw0VlRTWVFFajFHazNiMmdsVUpZTk5XblFFbkNHQXNh?=
 =?utf-8?B?MnBnTktBM2xFbFl0d1hvUlhVc3MyNXMxL2JQQ2pkdm8xSjcrYlAwZz09?=
X-Exchange-RoutingPolicyChecked: MUV8pC19R9UiVvIffHwI4virJGwDQRRrugekLrVXJYNDO+kwobOApvWqaXFOi7flKNpx3DFdj+lzZFyrtOieq8dsle+m0w3odErTH0VMgJS9G1Du0yy0tGdF8HYtYsl2IZCVfRS0mRcuVbsbzFLpi4oQQqSV8GwDoTvfAbehu4sHjIHzP4CZMWqZxMeKURXyIyHSwsoXGpgc/cK7ONgf0cTWbtmm77b4VoGYNUMeJqOwqmT/StDV7uR7Ke8X6wRbHPfoceoqCNVTpcIfn12ro2HgJtNhABgoMhn1g+daV6OCp847nig2bSCpId2hndNZFppCDo1PxdqMRLsJ01EyQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a12e548-70e1-4c31-dc88-08deaa02a2ea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 17:29:03.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52ERiVjiBy2wMv8aHlmXEKicyy+P142qEh69uU8n6Dd2SJ0Jqdy6+ShDk1A/2E0zRYrOlNQ8QrY6i58kyxjAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

"Summers, Stuart" <stuart.summers@intel.com> writes:

> On Mon, 2026-05-04 at 12:42 -0300, Gustavo Sousa wrote:
>> Stuart Summers <stuart.summers@intel.com> writes:
>>=20
>> > Add the skeleton code for a new debug specific configfs group.
>> >=20
>> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> > Assisted-by: Copilot:claude-opus-4.7
>> > ---
>> > =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>> > =C2=A0drivers/gpu/drm/xe/xe_configfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++++
>> > =C2=A0drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
>> > =C2=A0drivers/gpu/drm/xe/xe_configfs_debug.h |=C2=A0 8 ++++++++
>> > =C2=A0drivers/gpu/drm/xe/xe_configfs_types.h |=C2=A0 7 +++++++
>> > =C2=A05 files changed, 35 insertions(+)
>> > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
>> > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
>> >=20
>> > diff --git a/drivers/gpu/drm/xe/Makefile
>> > b/drivers/gpu/drm/xe/Makefile
>> > index 09661f079d03..b58667b0b18e 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -161,6 +161,8 @@ xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
>> > =C2=A0
>> > =C2=A0xe-$(CONFIG_PERF_EVENTS) +=3D xe_pmu.o
>> > =C2=A0xe-$(CONFIG_CONFIGFS_FS) +=3D xe_configfs.o
>> > +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) :=3D
>> > xe_configfs_debug.o
>> > +xe-$(CONFIG_CONFIGFS_FS) +=3D $(xe_debug_configfs_obj-y)
>>=20
>> What are the downsides of keeping this available for non-debug
>> builds?
>>=20
>> I imagine that the debug configfs could be useful for someone not
>> involved in kernel development working together with the developers
>> to
>> debug issues without needing to rebuild their kernel.
>
> So the focal parameter we had in i915 was enable_rc6. Something like
> this is what we explicitly don't want to expose to a general user as it
> can have unforeseen consequences (like having very high power usage).
> But, having the ability to disable rc6 for debug purposes as a
> developer is extremely useful at narrowing down certain types of bugs
> at the hardware/software interface.

We could probably keep the debug stuff available but cause a taint if
they ever get used?

The scenario I had in mind is someone who is not familiar with building
their own kernel working together with the development community on a
hard-to-reproduce issue and some of the debug configfs attributes being
useful to gather more relevant data.

--
Gustavo Sousa

>
> That's just one example, but there are a bunch of things that could fit
> this category and I expect we'll have even more use cases over time.=C2=
=A0
>
> Right now we have to hold these types of changes in a side branch not
> exposed externally and I really want to converge our processes so we
> can more easily make these kinds of changes and let us debug directly
> out of drm-tip.
>
>>=20
>> > =C2=A0
>> > =C2=A0# graphics virtualization (SR-IOV) support
>> > =C2=A0xe-y +=3D \
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> > b/drivers/gpu/drm/xe/xe_configfs.c
>> > index 12b7fe65446d..85df8ce5cf2a 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.c
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > @@ -1006,6 +1006,10 @@ static struct config_group
>> > *xe_config_make_device_group(struct config_group *gro
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0config_group_init_type_name(&dev->sriov, "sriov"=
,
>> > &xe_config_sriov_type);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0configfs_add_default_group(&dev->sriov, &dev-
>> > >group);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0config_group_init_type_name=
(&dev->debug, "debug",
>> > &xe_configfs_debug_type);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0configfs_add_default_group(=
&dev->debug, &dev->group);
>> > +#endif
>>=20
>> I guess there isn't much we can do about it today, but, based on what
>> I
>> read in configfs documentation a while ago, I suspect it wasn't
>> really
>> designed with arbitrary hierarchies of config items in mind.=C2=A0 It
>> would
>> be nice if there was an API for that though.
>>=20
>> Basically, a config group is expected to be a directory to contain a
>> set
>> of config items of the same type, which is not the case on our
>> current
>> usage (i.e. the "sriov" and now the "debug" group).
>>=20
>> I guess we are able to get our desired behavior (basically just a
>> subdirectory behaving as a config item) by not implementing the
>> "make_item" hook.=C2=A0 Not sure if that's an expected use of the API or
>> if
>> that's more of a hack on our side and could come back to bite us in
>> the
>> future.
>
> Hm.. ok that's good feedback. I do like bucketing these in groups and
> subdirectories. It also makes it easy to show or not show based on the
> Kconfig. But let me go through and make sure there isn't something more
> suited here. Happy to hear any other feedback as well here.
>
> Thanks,
> Stuart
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> > =C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&dev->lock)=
;
>> > =C2=A0
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c
>> > b/drivers/gpu/drm/xe/xe_configfs_debug.c
>> > new file mode 100644
>> > index 000000000000..45617282cec5
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
>> > @@ -0,0 +1,14 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright =C2=A9 2026 Intel Corporation
>> > + */
>> > +
>> > +#include <linux/configfs.h>
>> > +#include <linux/module.h>
>> > +
>> > +#include "xe_configfs_debug.h"
>> > +#include "xe_configfs_types.h"
>> > +
>> > +const struct config_item_type xe_configfs_debug_type =3D {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.ct_owner=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=3D THIS_MODULE,
>> > +};
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h
>> > b/drivers/gpu/drm/xe/xe_configfs_debug.h
>> > new file mode 100644
>> > index 000000000000..01170dc2f97e
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
>> > @@ -0,0 +1,8 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright =C2=A9 2026 Intel Corporation
>> > + */
>> > +#ifndef _XE_CONFIGFS_DEBUG_H_
>> > +#define _XE_CONFIGFS_DEBUG_H_
>> > +
>> > +#endif /* _XE_CONFIGFS_DEBUG_H_ */
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
>> > b/drivers/gpu/drm/xe/xe_configfs_types.h
>> > index 935097aafa96..c9d94a3c26a7 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
>> > @@ -24,6 +24,9 @@ struct wa_bb {
>> > =C2=A0struct xe_config_group_device {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct config_group gr=
oup;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct config_group sr=
iov;
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct config_group debug;
>> > +#endif
>> > =C2=A0
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct xe_config_devic=
e {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0struct wa_bb
>> > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>> > @@ -56,4 +59,8 @@ static inline struct xe_config_device
>> > *xe_configfs_to_device(struct config_item
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return &xe_configfs_to=
_group_device(item)->config;
>> > =C2=A0}
>> > =C2=A0
>> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> > +extern const struct config_item_type xe_configfs_debug_type;
>> > +#endif
>> > +
>> > =C2=A0#endif /* _XE_CONFIGFS_TYPES_H_ */
>> > --=20
>> > 2.43.0
