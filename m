Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C93DFEC118
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 20:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2092710E11D;
	Tue, 24 Mar 2026 20:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaJIeQa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09D10E11D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774385613; x=1805921613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iqr2LfHa4cl25lRVX9gMdlwb4fy4QZC+hwl2aKWrATk=;
 b=GaJIeQa1VF4Tny0ZIPLuSPmHnQvjVU50e0NNHBi/fMRu4GUsJTVP7ih6
 TRKrvAzeg6t7QYnC6iR+Ytxrzg3gIlcRSS/ppPK2BYc2KJ/OOD5lAM7Dp
 P5l2BC64zV6ehF2Y/BZQKqnP/iL72V2oer0Dogmh9QAcssL7VDCsFLO45
 lSwOxqBYtHZ5sYWCUOMnd8NTxofR3Fu7xKDnh8alo7DJBlkLB0Q1z7/1w
 oLGJ7/0ChI1548fWMFIh89TL2xfUsIcBbxoqAMRpPQg3YF6fy9kIQjOFk
 +u1ZHM3ENvQZIFIrEuCETsxxlR95N1y97kdj2xlwDEB+rkuoUk8t3bGxs g==;
X-CSE-ConnectionGUID: dIQ+k4f8SliCU10R9s+8OQ==
X-CSE-MsgGUID: gwG7VDFwSQe6VRfVXDuFew==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75534154"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75534154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 13:53:32 -0700
X-CSE-ConnectionGUID: jWlN5spJS3Susk2DmZpR/g==
X-CSE-MsgGUID: 1slEXS+0Rr63QDiWAVcGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228937454"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 13:53:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:53:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 13:53:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HW+GPUzG0UbFxTCyswu8mbSfEfwqL0NQq6JTicqN1QsybqTTbg0zEqjiPXQFVemQyG8uOG/CBfKwas0nsT1MjDjGHOrYWSphAWTYymGpaCx5vAf1pWFbxobXI/DDF0EnFoytRVbSVmnEI7jb+eepdokVbE5VPjr8UioAKb5XZMVtUWLJ9MyTl75fCdKwO3a3scHG/IyZAXnK60yBxhDn5To+qnMib6yecchVDvMrNGfAo365101Andl8CTUeME+VwQ8snWkgYmk18xQRStD2x8TC2dDQMZHXlT8uKNiGkIApA3W/3Y+wJw3FquxCy9G3iT4bFpLVhkNjpGHtzL7+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsFBP1AN6o6KzCy2Nw8EczoxBa/uHrUNTGCaAB4indE=;
 b=BP3v9B1fCcA4LfLAWjEJ8cFOv7Acrrcl5UrdybQxSu1XuA3dcBSvETz8+TvOx7+VG8s1KCcLVr1UBeltELMzYbkq+PSViwI0pW2aJrZ90FHwBdhZ31CDcel3a8iDj/vilPdfXb6X1NKDThw2FxIQMh22wHr3iPCMwaSyszaLyM3ghMJ6EZnxUG0UiROsysFV3dgJHDEzWogQ8YaV1CVuKEix1M5iJEONwnUpVxXrtLu361IPqUhH53uVTPMw24KY+FHZi0NrGEFwh/9DYKiii9jVmNcnzc0TbzOk3yriKsHbrbVxetAqU0Qbc7bB9phshfOQlyQnU2mF6O1md+d4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CHXPR11MB9628.namprd11.prod.outlook.com (2603:10b6:610:2f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 20:53:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 20:53:30 +0000
Date: Tue, 24 Mar 2026 13:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <acL5x1AakzkokUzt@lstrano-desk.jf.intel.com>
References: <20260317232133.4106716-1-fei.yang@intel.com>
 <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
 <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
 <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:303:8e::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CHXPR11MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf32cd9-de14-4ff1-ee62-08de89e76773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: tI4gvwYOp0ZEefZmrR21149byphvWstcNDJF0Vtn8tgWNmNR/Od15UqIG9iqn9L1REDicSGbuLHoGPucWF57wVYmKPjkutIRZNDFS0cPbnE0cLSt4M56v2bZRxnzq+bgrsRFdzI3W8BCa1AFT0vibhmXPzwVGVlQPer47Uxc+WzIbloeT3+lodNhBRkjAS0oxXKdL/Dzxi76rjcXCZZ4zhW3f5mWylnay4Tr51WC1mzB5f9l/TgZJDvJLbpFbQqt95WtxGYn5vKidJ7dPRIvKr/0GwpBe/0CPhWFNNrGAtzMf7A+UjLfoGvB8kOHWdPrgQ0ydUrw0ZR2TTxVCm4TWl5xnCDi++X0HjZBEOl/72CUi9MXKh8beUbff+mDtyKxfKQmPeTKxPdhkkTjwcWT5d6KBWI8jT8HzHrjbbtrr0YAxU6p3M0suljQp6K3JkhVqPzsAPZNk3wUpwmt0B1/FNUaDlWderTGhXLcv9mZoO1Pc7JeLiwr32nCU0rzSEH8W9a2aG/Yqd+03K3jds+KPk08y2Mw44ZljogM6HMw4mIneRM6Q289NvDiBvcDzuXV5qkPenXgZYFMN0Jj6z1zHi5RqYe8ys5/49QAUw8+e7Bc8i8B2ei0hA7fi80EeXPFRCNjLapdlWaUPES7UlXXLoAC+qoqD2GG1hPoVTX7xIl8YnXi2yCslFAfNrWxOsKOeZl7K7K3rAnAYlim/5OEGgHgmPdUt1SmNoRF5PokGgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGdPQW5CaXIvdVh4Vk9LMWQ3YTIwQ1dzQ3g0NzI5Yms1MG5nTjc2cGk1dDVU?=
 =?utf-8?B?OVN3SkpmTVpJdndyR3hrYURkV0hCYmpjaThFOGVoRFZxWm80cnhlLzJJM25h?=
 =?utf-8?B?RitDbWZLNXNtVy9TOEtqVlJFN29DTHVJMTBGbUhZbTBjRFFzdVA3RzNFZEtD?=
 =?utf-8?B?RkZob0NUNDB1Vk9yM0xEdWJlNzdUejByNEhMcWowcUcxTWdwMUJSc0JxM3F0?=
 =?utf-8?B?QVhiMWYra1A3MzE2bWZRQzB6VFN5dHlIZzVKWVZCMXVjWUg2Y0tkVEFSOU11?=
 =?utf-8?B?S2NBN2N1MmQ1RHRsNWdWa1B5eVdCbG41elcwOEhJbHh2aU5rekx4alo5S2Z1?=
 =?utf-8?B?RkJHRllKSU5PVk4wRmJaN29NU2NNWkpaOE5sektSSjhFNVhqaEVsVitzdlht?=
 =?utf-8?B?QnBCbG9IVHJOelk3dHZoeTFoRFN1d0kxcy84eUZsaUREKzdUVWZzT3EydkpR?=
 =?utf-8?B?WG54QzZrSmt6T2ZIT1hkbGtxWTNLWGwxQ2FwWk8zbUV3N0llWXFsTWJmUnJB?=
 =?utf-8?B?VkpHcmd4UWZrSG5WY04wK2UzL2F3VXpoeW1FOGxyRmR4azg3a01LV2dGdEcw?=
 =?utf-8?B?Uys4cndjQ0grRDVlRG5lV2JsMDhuaU5wVmNxV0YrZnVsOTkxZld0RWo0WlFm?=
 =?utf-8?B?Ym52RmpPY2gwajd1dGZuQzVvQTk2aVBZMy84amdWZzRwTFIrdGVhWTkwU0Vx?=
 =?utf-8?B?Ti9tbm9HREZCdFVKSHlEbTJoMEw1dmREaGVzeVpsQlVUdlYxbnZlZ01ObFRV?=
 =?utf-8?B?NFdHSlpSYnBzOGV0UmJGbWdpU1dTV3N5d3BjbldkY3U0cU1sTjBQZ3YrczhG?=
 =?utf-8?B?RGdaRTk3WjRXUGdIeVRhdmppRDNrenFvR0FFR2hYK0M2aTluVjhrYkdSWnJt?=
 =?utf-8?B?OXU1UTZqMjhwV0dkeVJCcUxyMS9qb0UwMDVObFRVYjVkb2NpZGFHOEpWMDZp?=
 =?utf-8?B?SzZXbDdZdENNQnpBZEl5K1ErbUU0eGlOcEU1bGdHS0JkM1hxSjVpcGZabFJo?=
 =?utf-8?B?SjVZVTIvOVVqcnhxY2V0WHlTcS9BSHIwUXA5dnBCUCtPcUN5c3lnQk1rSHBv?=
 =?utf-8?B?SXQyWEJwRW5uZ1VuSzVzTGtVRGJFblkvRkl5SUhIelB3Si8zdVZuTzJMbFd6?=
 =?utf-8?B?cXA0bDBEakdRTEI0VFB3RWpCRnRCdHlRQkcyYzNKNFFVUG1icE84MEhCemNU?=
 =?utf-8?B?TVByR04zLyttZDY2ZmFmTmFNNE53QVdzanRkSXFZTE4xc3dlM3psMVB2N2Q4?=
 =?utf-8?B?SHZhTmZQRnVNdjFDQ2dhM25ycEdkcGlZcTA0V25hSTV1eUFwMDhGNXVOc3Z5?=
 =?utf-8?B?d1B5NlpqU1RVM2F3ak1rWUQyNkxXSHFHUXZlbXZ6a2FOSXBSUlZ1US8wTm5s?=
 =?utf-8?B?VWFQR0pKbjNzYnpnSGE2Z3dHRzNpdmZQS0Y4M0oyaVBBRlQxZ1BJMlRZZGI3?=
 =?utf-8?B?bDdzS0R6d21iSlF2TlFyRnh1aEtRd3RhWXNNangzTURZUCsrTXQ4SUEvTGdh?=
 =?utf-8?B?NHFYcFdlM0NPT0RSc2VLbmRkT3FEWVZLWjI5SGlUbFI5WmtFRFYrcHFSYTBp?=
 =?utf-8?B?cUxnTGFXdWM5SlkwaGpoa1JWODFlbjhDWlhLNzNYenJGaGUySmNPSWNEK3VT?=
 =?utf-8?B?WDBxL01JdDJ1MEdoSkFGZDNXZkpWc2FFUXpWVHdaTStJZG1qZEpacUViREp6?=
 =?utf-8?B?YVJkY2tQUUFjYUF4R2VvbzJ0aUNxNE5VUmU0bzNESTVrSzFLNUd3M2dyNGRV?=
 =?utf-8?B?VTk4SERXRVAzRWVVejgvbTB4OXBhRmlTa2YyQTJidjJLYkZ2THZEVEdITnZF?=
 =?utf-8?B?Wi8ySDNycXM5QmRiYUl0WFJZc1hOa1lZZU4xdG1MQzJ2M3dmZy9UZXJES0xw?=
 =?utf-8?B?ZTlyL0huZXhTRUM5aUkrRGlXajVZZTFIdWtnbCs3amxkeTROeFoyNVQzTnZV?=
 =?utf-8?B?cjEzTUVLM3QycW5iZ2tJcXNEcVRWaWw1dE9jRmZBM3QyeTIvQVUyWkp2ek4w?=
 =?utf-8?B?RXJYVGMxMjlvOGJZbm03amUvMTg5Qzc1OFIwSmd6cTh5ZlU0VmoxQ0Zwd3Ry?=
 =?utf-8?B?N29LNFJML25lQTFoa2RBR0JUNWxkdCt0RTJsc2YwZExCMW1pMGYrUVZ5cUZU?=
 =?utf-8?B?OFI0Z2JIR0hoSkl5L2dEZ0lMZ0pITHdLc3crSlVFWG4wSU14aFNKbkVzRWhK?=
 =?utf-8?B?ck1KblZLODY5ZDJ2OXlwQ1NlUEN6dExBcnkrMG43cUdFSHIwNHE3M3FGUzRy?=
 =?utf-8?B?UkVIa0xwTVFFVzZFNTRvd3g3dWhpang4Yk1TT2xMSkZpaDk0UmQ2NVhnTW5N?=
 =?utf-8?B?NGNJczVTZEpUMTRsd3pyWVBXNDkraDF6VlloVkxxRWZmWjYwQ1ZsZz09?=
X-Exchange-RoutingPolicyChecked: rg63xdX5ldXanDblsC8zQpU7iEk9wQLQnQUtM7QfnhsVsNp1sE+Q9XiEZj8ndYWGNyHt0CE9k9tEprIdoiIJB89gJBlYLqeegXKUYnBV3fLkpOMZUj6mHYT72hgWtaWr8eTc9yiENK6ALKR+HVy42q6wY+nwblT/fIsQK4dZUGojBJljj5Or/p2XYvQLSymYTLMypgKCmQ28kblWg8gj8FERtZlPbGgNZGfmavoNHykYnylcQeL1s1yt23JgrifzEI6KT9CCtxvybToiKnqhfQ4celQWRvrerDtXBAKmQCRq9YgK5rWnvu6HnRN+j6ey+mgdpcPwBMBfEsbRyxnxig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf32cd9-de14-4ff1-ee62-08de89e76773
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:53:30.1285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8oPu1vKSG4wEiFYi1tT9FV4YUpMo2zkR079QtzDy95g9caO536aUqM+XOXvbki8QAjX1gQnV/NzftIAcyixaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9628
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

On Tue, Mar 24, 2026 at 02:39:54PM -0600, Yang, Fei wrote:
> > On Tue, Mar 17, 2026 at 05:28:14PM -0600, Summers, Stuart wrote:
> >> On Tue, 2026-03-17 at 16:21 -0700, fei.yang@intel.com wrote:
> >>> From: Fei Yang <fei.yang@intel.com>
> >>>
> >>> Hardware requires the software to poll the valid bit and make sure
> >>> it's cleared before issuing a new TLB invalidation request.
> >>>
> >>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 15 +++++++++++++++
> >>>  1 file changed, 15 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> >>> b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> >>> index ced58f46f846..4c2f87db3167 100644
> >>> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> >>> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> >>> @@ -63,6 +63,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> >>> *tlb_inval, u32 seqno)
> >>>         struct xe_guc *guc = tlb_inval->private;
> >>>         struct xe_gt *gt = guc_to_gt(guc);
> >>>         struct xe_device *xe = guc_to_xe(guc);
> >>> +       int ret;
> >>>
> >>>         /*
> >>>          * Returning -ECANCELED in this function is squashed at the
> >>> caller and @@ -85,11 +86,25 @@ static int send_tlb_inval_ggtt(struct
> >>> xe_tlb_inval *tlb_inval, u32 seqno)
> >>>
> >>>                 CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
> >>> XE_FW_GT);
> >>>                 if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe)
> >>> >= 20) {
> >>> +                       /* Wait 1-second for the valid bit to be
> >>> cleared */
> >>> +                       ret = xe_mmio_wait32(mmio,
> >>> PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> >>> +                                            0, 1000 *
> >>> +USEC_PER_MSEC,
> >>> NULL, false);
> >>> +                       if (ret) {
> >>> +                               pr_info("TLB INVAL cancelled due to
> >>> uncleared valid bit\n");
> >>> +                               return -ECANCELED;
> >>> +                       }
> >>
> >> Is there a reason we aren't waiting after the write to make sure the
> >> invalidation completed? It seems like we should be serializing these
> >> and at least making sure hardware completes the request rather than
> >> just sending and hoping for the best.
> >
> > Yes, this is correct—we should after wait issue *if* this code is actually needed.
> 
> No, the issue is that software cannot issue another TLB invalidation request while the ongoing
> one has not been completed yet. Otherwise the hardware could potentially lockup.
> So we need to make sure the valid bit is cleared before issuing another TLB invalidation request.
> 

Yes, but we signal the TLB invalidation fence as complete without
waiting for the hardware to actually finish. The locking here is also
incorrect for MMIO-based invalidations, now that I think about it. What
really needs to happen is:

- In send_tlb_inval_ggtt(), if the MMIO path is taken, acquire a per-GT
  MMIO TLB invalidation lock after obtaining the FW
- Issue the TLB invalidation
- Wait for the valid bit to clear
- Release the GT MMIO TLB invalidation lock

Without this lock, two threads could both observe the valid bit clearing
and then both attempt to issue invalidations, clobbering each other.

> > This is early Xe code from me, and it’s questionable whether it’s even required.
> 
> This seems to be required, otherwise modprobe would fail at golden context submission,
> [  480.237382] xe 0000:01:00.0: [drm] *ERROR* Tile0: GT0: hwe ccs0: nop emit_nop_job failed (-ETIME) guc_id=4
> 

I’m somewhat surprised by this. A better solution might be to drop the
MMIO GT invalidation code in xe_guc_tlb_inval.c and instead issue an
MMIO GGTT invalidation whenever we reload the GuC.

We can defer trying this until later, as it is a riskier change.

Matt

> > Typically, if the CTs are not live, the GuC isn’t doing anything meaningful in terms of
> > referencing memory that the KMD is moving around (which would require an invalidation).
> > So this entire flow of issuing a GAM port TLB invalidation is, again, questionable.
> >
> > So I'd suggest move the wait after issue, plus throw in:
> >
> > “XXX: Why do we need to invalidate GGTT memory when the CTs are not live? This suggests
> > the GuC is still in the load phase. Investigate and remove this code once confirmed.'
> 
> The issue is a consequence of an earlier failure which caused the CT to be disabled. And the KMD
> sees a bunch of TLB invalidation timeouts.
> At this time I would expect a GT reset, but that is not how Xe behaves (the ole i915 driver triggers
> a GT reset on TLB invalidation timeout if I remember correctly)
> 
> -Fei
> 
> > Matt
> >
> >>
> >> Thanks,
> >> Stuart
> >>
> >>>                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> >>>
> >>> PVC_GUC_TLB_INV_DESC1_INVALID ATE);
> >>>                         xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> >>>
> >>> PVC_GUC_TLB_INV_DESC0_VALID);
> >>>                 } else {
> >>> +                       /* Wait 1-second for the valid bit to be
> >>> cleared */
> >>> +                       ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR,
> >>> GUC_TLB_INV_CR_INVALIDATE,
> >>> +                                            0, 1000 *
> >>> +USEC_PER_MSEC,
> >>> NULL, false);
> >>> +                       if (ret) {
> >>> +                               pr_info("TLB INVAL cancelled due to
> >>> uncleared valid bit\n");
> >>> +                               return -ECANCELED;
> >>> +                       }
> >>>                         xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> >>>                                         GUC_TLB_INV_CR_INVALIDATE);
> >>>                 }
> >> 
