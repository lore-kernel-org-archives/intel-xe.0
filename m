Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C06D1BDE1
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 21:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FAB10E80B;
	Wed,  3 Dec 2025 21:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBS97O+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0DA10E80B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764796144; x=1796332144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J+61cJEaU9h39d078X3JrY3/F6gR5580uxbvOtPkp/I=;
 b=mBS97O+1XAoFDw2zoLoSb+PkOjjIYi4STW86u5Xqm5DW0OoZB4Z8sd5e
 VcaNgXPzzetV7g8CnzR6G+9UU5aKZqs2rjka+O78JCO/J7ZRSZTghQ85g
 WyRvnI9kwNEEtWE7VLwrmRmlWqXiV8UhMgf+rshDUmdfx1iZ3VOr6a08/
 qhInRSuvWlbVSnGPO8Fq3omJ+R37D+rLlqZUxbtIvdCWY68O+J18wUwQE
 lYYFQ004dYzp1VppNcTc+hb80JHw6rM2GR0Dc68oOYFpw0CHs/EZ9kjka
 HBqR2VNn6yIcNWWZ9S5fbK7NWkrgAc9AzfMAS/PbLgWJq/zgVGPfqVdzT g==;
X-CSE-ConnectionGUID: PuHp0UI1TyqdBd8/j2w0mQ==
X-CSE-MsgGUID: jU1Q1uoxRyW5fpHzPsFRFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77427567"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="77427567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:09:04 -0800
X-CSE-ConnectionGUID: BiaTSO/TS4aaf7cF8/00wg==
X-CSE-MsgGUID: WJwqxzzfQ0KZGLO5f3f57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="195600835"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:09:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:09:03 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 13:09:03 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 13:09:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuZ6ubumia/cRYKGI4Py3dWFX1gGb7qWe8g4nioq5jXDzWgVleP/ZcD76psDa7mmo4ygbdwEBZHS8dpJRbNAHnPrLkvMaqBvFWW419geyqHTIr2mruCvd/yN4OUXyLfvPSHCsthu7qf//S9kzrml5QYHMwJHP9t4ct7r2zelY5mjCxaVHAyntfSyZjk0GspdCgGSSvvL7sEifPcnXoRdp9/r2qcWVbji4zhBtcMc3/kVh16yh++VfybI8uQkuwz/5TDPjr3dKkWzShaUj7YW97Td15FxAXiNQZYevubmrbQv5FPyu/7zuWIejsuVj41rJHoTIVK9vSljRe7uIEPBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXbP5EU7kGL4AS2v8NHnM/3eaoA6aJ1AEBJyHNhW/V4=;
 b=FzRi+Ce3TeiOKBjnAjJW36Urz3nEPpA+zBSMUNTOa5B5/HKRlJyqWh6acc4FwGxy0x68UHvB7SDOXfqivX8qxI+JT0ncA1Ebml0B6SM9sUd60vYnbMld77AO9ewjIm11PRCyhxPlAvmI7XR1HxGRD2vPhGtZonckWvD74qR0Gv4WvHlzklUYcf5nd8cYbCHOsY0Vg+ucc20rwOBTNpV55AhQ0zZLusJgl6ZXD/QqQUuV4tjp74KOc+nyadQQcdIMP5b/XihKLO8w9/wOz8/vd8lPDv/OXi/8OmZC5ADZPjDreTCInDtVGAWNChmyDQ9ogwcwKiQksAbeBa81GeTMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 21:09:00 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 21:09:00 +0000
Date: Wed, 3 Dec 2025 13:08:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Message-ID: <aTCm6Aal-BoFd9hz@nvishwa1-desk>
References: <20251203035800.1086089-2-niranjana.vishwanathapura@intel.com>
 <aS+48B53fgZG0JPL@lstrano-desk.jf.intel.com>
 <aS-57K3sQXZqjuEC@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aS-57K3sQXZqjuEC@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 527f432c-b902-4580-f6da-08de32b02e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iaxVIC3ctsMYzK5ktUZVYkpPzgCmSYuYuD49IuD3nKjYES+9fUuGHJOJYXY/?=
 =?us-ascii?Q?kCkBQ53iMuObuETDyyfO13GfPTZmt29cWRLpF/LAPN8oThrh0ux79BlE7lKz?=
 =?us-ascii?Q?r+7ccSCbqe8oZmO4j9HLUK9CUddOX7NsbWof6JDqGeHGVughrWgF3Klpw7Yz?=
 =?us-ascii?Q?4vioTfQQWO5LbdkLVKcAE+pTl1/NL/zi6F6iASrqidxpcQyVrFM5yyN+qHg8?=
 =?us-ascii?Q?IcbeSZkN8WYn9IS2B/GJVr3ZxNA6p3syxQDdONbjrNivlB6L/X3LPhm0JEPk?=
 =?us-ascii?Q?KZ0sMayvTRqfIh05hQBwfXhnk4W8UWPQl9S6bIppihGqXQyNBgWHhB7WqoEF?=
 =?us-ascii?Q?MMpV0UOvaoPWAP+/Y3H+ftjpRSIA2yp+ffiRDNNk0bZfhk6LBVETlluxvrQC?=
 =?us-ascii?Q?CBaWPPaN33nH/azitWXTVlIWk8AGg6xb1Yz+T1kNN/NiIxsyTRteySUZwqF8?=
 =?us-ascii?Q?loJ7jO89kpxl0TJqPrfewmZBiNp2Fvu580Ov1i4td+pIREbNdRRadWt3SzSP?=
 =?us-ascii?Q?Ln9SpMr9kDTwklHpD5OvPOSgp9xB0FlIkduFzdIEo9D0dUMwaNBAK7MW6tLh?=
 =?us-ascii?Q?B40RhB8O0c9+EkEExQkDa5EsMSIDCy3Sgl3M95DKHJwC61lez9sl521jdpIR?=
 =?us-ascii?Q?qUruPUvr9LZ/MeN0Au502jUkmgen6sXP8i0nXF6ByUIjK9WsU7otXQPhVNTg?=
 =?us-ascii?Q?S/DhFKjgT114SlBxf4gRmazZ52t3eD/VpHwUCtGzWNY7EFpDfr2MPNey5Mg+?=
 =?us-ascii?Q?oLUk34BZqj2eRzGqU70YaIB2xPGWc2Xfmwrmyu5V+8HMoiwjw/28YhJ2Xd0R?=
 =?us-ascii?Q?Jw7Ft9XYdrhDDLKQY6W70+zll1L828aDzX9ub9CRxMPscYMrfjFJCqymKzPD?=
 =?us-ascii?Q?8P6BvwPlcTBUIskRNLfn1lugm2osJXLjGQVjlBZCYbBqP2G2hl4bPzJOwDMM?=
 =?us-ascii?Q?QneLIbqJTLaYgHXgWsLlev1Qf+BoOBry5ZrTV1eL/fzx22ykAa9tcaCaRmTV?=
 =?us-ascii?Q?39zBz968hUffHMQBwEJ0ZuZD73tmiAtPDipUjrNaueQERnI3TrUA2zbNOEey?=
 =?us-ascii?Q?Z1CyHjYGai9FHjwKR9lpE/o85/ISg0GsnbImu4sjYw3EHGbBvpQFqR2T7SX0?=
 =?us-ascii?Q?W3okcDUwFfwZzx0G7RxloRdoaLYYVHlXSrveTvQadzPfWTvyM7HF8CkDoHW6?=
 =?us-ascii?Q?KLkrWGWhKLbQ31Fx/HN1VFQkoeuMd5oGWcgW/vILhZqAY908tPHW6xdBlQAP?=
 =?us-ascii?Q?kFcpOA0u5a3lRzUT7fWCL0gegKICokgzZFdOn4z1YphXyRqpyG+X4RnsOrDD?=
 =?us-ascii?Q?uR429OVDW8meLqNs8PJFRc0fXNqXGEZyILJrXpeNFUYOFX+5IzIzKSA4KpgS?=
 =?us-ascii?Q?1DpzpAEyguUshJGnr5MbsRzUmjDPKBz7/DU9DBuq2YnTr0pGIGvab0svJ7pV?=
 =?us-ascii?Q?I/XA+WsQFGEFtP1Xp7TFEP9sPo/R9cpl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h+fnlKHYhYdrFNQYoCPRSeRLPfL7m5QNEMqtaoyd7CoNO4drxjWEobichxLH?=
 =?us-ascii?Q?bwSoH7N8KoJr2omYblPh6+Xpdteq60ccBSJhKjBSOhycZIZed5odd+1cy3aT?=
 =?us-ascii?Q?rnc/vdVXiPfLtWeuR5/8eXnaoHnIg7ay+9eJ5L4upIO9D9prS9QvyruYYWXX?=
 =?us-ascii?Q?oNqFa4KG7Pl3d1ETqVwEN+gelbjRFa3JE5pGcif3THhOk7fJKajwr2Q+i/qI?=
 =?us-ascii?Q?TGDFEmg8GmD7vDQoF36NBouUsmFh1WiU9H1d6l0DCOQVWw8+lKT/NU42yyS4?=
 =?us-ascii?Q?Aeh3rxFz8F2CzT//BLfxwbJcarLiEn3DLsPGLU12iJARttHsDQbaDhjRDWnE?=
 =?us-ascii?Q?NjREJNCcekDVeqHjzl5hydXzZIJYgYVGYUp3rw8vgq+O19y3AIp3jB044YLW?=
 =?us-ascii?Q?rGHw1a3smm8v3SjCzceWgKZ1OX1FuGyFA+6WE39b/zl66c92FFVTPDnHymvj?=
 =?us-ascii?Q?MEt8vHOAYyFdKHeomqF/kJiJTmlfVQCNgtTeJz/97X/fKRo8LtwrRyuKegFz?=
 =?us-ascii?Q?QT+lTWgvBo0Wk9oHT97jpaN2C3TjaEsj1/odv90bHqO/HV40GLyIuCAbffY1?=
 =?us-ascii?Q?CENb3+qhXWVlYjnmoVpCiQnCz92Rb9a+juOIgx3SxGPDsDyfkQBrdWKr8JYw?=
 =?us-ascii?Q?QQHWA5sEDdrSmpydPaSn5+qpKqEXkdvvK+SCDiG3rMmlj3LPTOb7+dWLDRDp?=
 =?us-ascii?Q?wWsqgXV3kS2RV0sF6UmVVRdGbYDuQOVP7oJ4MDuoRXcG6Dcy3rXr7/eZZAZ2?=
 =?us-ascii?Q?CbywO7vgxAR7ai7D98mJKe+BbNRQ28BqXY/C9BIL8dg9bxVjaVOmXwzy+wwO?=
 =?us-ascii?Q?2qt9DPL3vzaGoED/CgLUuX17sgOd4XO67Mxz1BD/4toeE0p4ky7rfPFUcD7r?=
 =?us-ascii?Q?UCrSG6TFbDfJs1HLHPzpIqHwL19Kk/WLwYxkYo+Zp8M18vgP1RyJ0JATT2gi?=
 =?us-ascii?Q?Ha7ldLNcprhQPLpAJDaFfaWxJwWDkO+tDwi9KlIHlky+sCs1H8Sg9lu23+3c?=
 =?us-ascii?Q?NwfYgMEf66tIFbfX0k80PKaem2C8iLvxQdXejtL13bI3UFxanTXjkQr34pav?=
 =?us-ascii?Q?j5XjF8fGASZO9lGVohTw4qVWrCJ8ywgSTRv/MzwZJUU0sLlbO52z8/WKQgR+?=
 =?us-ascii?Q?6JN5pZefmD2Iro0Eb51rZy/56XP/rKMdbslGxMD3aO0NTFzYi1vFYAOes7fz?=
 =?us-ascii?Q?0zrWTnhioxVlk32s1MlHdWRDMtYvtMu/aUEFY02hMzQMS4MmpcFYyJdHJUov?=
 =?us-ascii?Q?W7B+D1z7RFP3Ui9PqKgm4cc0kuOkw9tTwiXlcVV7eO2XuDPCof9wiwdSCMAI?=
 =?us-ascii?Q?BlTFL8/DdbU24ARkhOV+00dzvck9654EnSbI0IC71ck/Igt9zPfBNbfbfidm?=
 =?us-ascii?Q?gdlVkANUdeeDuTN/dtUSyrD/dGy7AXYydYYAYUFNVKzCBat7rjRX718t0SAn?=
 =?us-ascii?Q?Fs8/2bGREG+Nmy7WMcu/JlGvPnZFbTj10cSxWPY+YJjDvlu3liPlbAtpwcuL?=
 =?us-ascii?Q?fdcovZWR16/xQklqWMbacJgFPoIDxua61MZ3yPtVH6qQ8NeXipiYJmvd/LtR?=
 =?us-ascii?Q?dt1ZuLfpGTvuOBfDQhi4H7DfHb3ERf0HFWBt+Q5FaF9zapSu4foxfXmugFxV?=
 =?us-ascii?Q?0ZiLflojrcozQsOIFLrJbzA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 527f432c-b902-4580-f6da-08de32b02e14
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:09:00.5189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UliQ5Exeif5EbpBOsnaIFxKeFSa9d3zKU4iQ3x8pPxFyEuCi6Y41W6/cZhYadvmP6CW8RrQanjhHHECwPrxah/f8nCmV31wJ005hXpPfil1wZXOL8GOG3hdIGKkmC27
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
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

On Tue, Dec 02, 2025 at 08:17:48PM -0800, Niranjana Vishwanathapura wrote:
>On Tue, Dec 02, 2025 at 08:13:36PM -0800, Matthew Brost wrote:
>>On Tue, Dec 02, 2025 at 07:58:01PM -0800, Niranjana Vishwanathapura wrote:
>>>The xe3p_xpc platform supports Indirect Ring State and
>>>it is required for the upcoming multi-queue feature.
>>>
>>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>>Just to confirm - in Xe2 we had hardwarwe issues with IRS, thus why we
>>disabled it. IIRC the GuC eventually implemented a W/A and the HW should
>>be fixed in Xe3. Can you confirm one these fixes is in xe3p_xpc?
>>
>
>I think the issue is fixed in HW for xe3p_xpc. The workaround is only
>for xe2 platforms. Will check.
>

Yah, the workaround is only needed for xe2 platforms.
There is no issue in enabling it for xe3p.

Niranjana

>Niranjana
>
>>If so:
>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>>---
>>> drivers/gpu/drm/xe/xe_pci.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>index 75e3588242c7..fbee83dc347a 100644
>>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>>@@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>>>
>>> static const struct xe_graphics_desc graphics_xe3p_xpc = {
>>> 	XE2_GFX_FEATURES,
>>>+	.has_indirect_ring_state = 1,
>>> 	.hw_engine_mask =
>>> 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>>> 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
>>>--
>>>2.43.0
>>>
