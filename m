Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEF0CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4C210E159;
	Wed, 29 Oct 2025 20:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vknew70O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF8910E159
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761770028; x=1793306028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0LuZoSAtmLSJ9DSwwF5Qv8Pb8eZOmpLl/znuj13Y8f8=;
 b=Vknew70OJthBqzwRe8zyNc2OmTcdxLve9rzEP/JhM8NiWZm4wLrGYjC8
 JinYew5sCQ1AysTnATrLh9d9BYA/ioCOfOdvXQxiQzZ6h065QDXZhkWmC
 ISpTrF2vu+IHTC62mbpum9iToSygCVnXDVEM4U1QTPSbdARkzLimSiIEc
 HaycUw/W3eoV2yIPwzfeKFU0SdCPx9qPFWfZjtvs1iukdsCv1CUte0CMj
 A8fJDaR6Bb1HxLakN5ZVjjvZq7uyfAM23l0ItGlCeAyUo2D74pgPhAqO4
 OPbFMqoePjM3Wyq6N3Uxq0GFJbUFNqOhzM34KKTUufko2OsdF+UMTkKq1 w==;
X-CSE-ConnectionGUID: 67Rgh3RzQlu56bunxRNGvQ==
X-CSE-MsgGUID: 8Tc/DmMIQm6VQboNDP9I6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89372757"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="89372757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:33:48 -0700
X-CSE-ConnectionGUID: YU5rHFGQRJC/oa6BGVQFKg==
X-CSE-MsgGUID: qQSnW9rHTleM2oAYunpcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185419988"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:33:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:33:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:33:46 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1YsTg34DGbyPtcTs325hwiJOpzucPv/fRAR9SlUdIZJah5zGhNcV3U0fun1dTwefpdF1U7IdA4F+He8LZ70nK9gzYrcEyBGdySVUwu3G0fTwFSt+h8CV+JV44HzSs2h8jgt6fhZ5Xg7gXXyMhkQPeQ0T9+6vJpSE8fWoY3aovqVaaIFLQmKtMBQ8chy4JV82Zm+MQgh33gGedtUn4WeIvbeq1Vi24wcVMVcDPof1oUwkJ/eEtQs3dqv+Xr+9LQbY0XkuhCDFRfJYa1fXPDlnU/hndJA6VjucfvObrQkEfPGXoLv9x59iyjZJ2asEnCCqTBdscjP/nqKFqDNx3b20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LuZoSAtmLSJ9DSwwF5Qv8Pb8eZOmpLl/znuj13Y8f8=;
 b=Rsx7YxAQyB2rmky1fC2oDbmWzRJYOu/L928dduAj9u0p4e0b7/6D3VW0/as5OTvaPoXGC7cZqPYzMLEFNuND940D3dbkoYPzejNlAzFb6Go+EhdkkOjuggrQ6s5yfFDoPsIF1zVu+IeyhI/dT3r3mA1UlGiziBLZcDPZqJ0KjyNuCm6ze6mAfMqGTo2XtMApdBacB7F6GOcAKZgooouYT3h6beIhjkbJfOKWqqhcsBetnb3g7T9E7zd59UvwADYt7N2sEkU91JL/wxIBIW+NctgQoTivJAgZdQZDpWKEQm5qaG/EDHjUV3Q68/rvxeQKqDN5aqeZsjnAZ293SQIHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 29 Oct
 2025 20:33:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 20:33:45 +0000
Date: Wed, 29 Oct 2025 15:33:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 09/17] drm/xe/pf: Add functions to bulk provision EQ/PT
Message-ID: <japdqislehisvkg7q7zq2e5ekgp22jv43mgulwjmbohj6fcftj@4nzdkwja36j4>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251028175832.184534-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbb48d8-7610-486a-1a89-08de172a74e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lkJV0thNb5vSQhqJ2lXn6OGJ9nNbBKtlY3PeQQO9BcZfBBdSgTnx3hgk4FWy?=
 =?us-ascii?Q?kJf9+mXUipwLjJydgRkpArkBlS/26c+PKi5uxPsjIHSYpEhqFpH+Fu4KHGCG?=
 =?us-ascii?Q?7OkEgS6eiPxU/54KJwqfBJB7WIfBaCHelVLQ5tXTHFnu3/CjX2I00jVeo3YV?=
 =?us-ascii?Q?Yrs2vBe9mRMvs6ekNkouMfxWxbFoSJgmZzFQCaZf7lBJPUi2Nd6gBcU0kxAY?=
 =?us-ascii?Q?HoBEhSyevqy1plp/AZT3FO0DvLd4rX5xRlltWFLrtBiRaEP5qSR9d+7gFo30?=
 =?us-ascii?Q?i9TeWQeRqZHiBpe9wLGcLlKCwz6YeZ5WRLqmXTd4i81GRQoXDZXpB1o2ci7c?=
 =?us-ascii?Q?cC3SsgglFOCAhzcO2nZoDg9Hp4Ke8FtVYsrmsdguYOBxlXvntAzRW/d4Gov7?=
 =?us-ascii?Q?qkimYEfUxVXYUgDcISzszo317iej+pkFTKDhDS63MyP+5f5BypOfJSz+UfkY?=
 =?us-ascii?Q?WoUECpZVyFHenhES+DyWEObXfgJ2dP8acmZy8fpgibfI4+7qAuTgsr7MXgA7?=
 =?us-ascii?Q?uyy94zL3T/fuTcdT0SZG718M6BQVMt/7jG9XMAvK3FotlhxPE5IjtOt8Fkxh?=
 =?us-ascii?Q?cSJTBjGRV6+K9M74R+TmFnojuvjPWrEOcdtCAf8fAeQeZCM7fIBdxQ6/E44e?=
 =?us-ascii?Q?VX9PUuLTcOEhnbymkjSCUpZRpu29jk6lgdOfEsNYPg67GMLpJ83HxSsTyDYn?=
 =?us-ascii?Q?F7KsOngFhmEF4nm8SqMOLp7dgJeVbeir46maj4c0s6+b+1irvg2aQIF7pLGG?=
 =?us-ascii?Q?ibGEZ7r+26tL568rA5js5vqqvZaU4yQutBkZoIUoAUxt7q3NWsKYZx5xhIZ8?=
 =?us-ascii?Q?WQS71HK2tNdh9rcOt6Ar81WMVtv3+CBfbTRagrk6UP78WjEIUk+0irr+bwEC?=
 =?us-ascii?Q?fcPoce8pYxpb45e9tezBjfgnA1lzM/9OUdaWC4IBCFq9u/CKvlkCrw615Y26?=
 =?us-ascii?Q?d5SzCH6ZWVnXsH0qdSxXYJEh+lWaU5kkAC88cXTp/g8SauPPwDdig/Xqw3JW?=
 =?us-ascii?Q?/5SCUpzY/H2tGekGMGh2ydIy3PpLkUOueg3nEdUr2XKfqv2oxwizFQpJjrXS?=
 =?us-ascii?Q?I/GWvQyyV3NLiJTMteGNFwgDcS8N1pSYzY+Jv1DG113g6zlydIV8pI933Q6w?=
 =?us-ascii?Q?jnyTf/Zz6q/wVyZr1lupccIJf3e0ekGbC1qcb423eaN1OfQ9cRLwRbrM4tHL?=
 =?us-ascii?Q?RSFkJo5bgGe1VZzD+idnDxBvLTfyBGhMrv6DhLhpvNIsZHEtMZQM618C6Sx8?=
 =?us-ascii?Q?wcqw7oztDXj+aR1etgqr0GRvTUcH7te7QRIaN9aiRNGpjlRE2WJgIJRG5q+i?=
 =?us-ascii?Q?asC/rTHHCD99nN7cJKrytXgrErekpWWgjNdWjI/EuNzB83hsrgR0L7RFUH1r?=
 =?us-ascii?Q?Ifw86lh0JYyty9FPS/wbjDgGMtZngnS5bZvmrQeqmqe9alziHKG0N7iAeOp9?=
 =?us-ascii?Q?RL9+9isCAqDJXw74VUVBS6DqWe7amznY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s6DKTpXhfSwZH6STUsZAvUe5gTdEKDpxFLrX6+O5quENgCZGpYXlvlmYVpzX?=
 =?us-ascii?Q?+5I5iK+kJKZ7zuPKlGbXii+JOJ+fdZ8VddVy9gI2iL5yLmkyCdZZXE+fn1gJ?=
 =?us-ascii?Q?ylAfs7s1Ji0K7htiKnBEQ0EpRGRnA2JMDS/DFymMpZHMoirjPh/y3LoCwLd3?=
 =?us-ascii?Q?Sq86FsDyyTDqG/9pDFd+GskzBNy66aF0UoaST4THZMxmBfZ4wAZVG90RSCYO?=
 =?us-ascii?Q?WRcPzEGybQ5gIFGBliJaOJ/KMtYwTrNNIgiJECK/NWQYFiKia2tiBrp4wgCy?=
 =?us-ascii?Q?MpAfOryz3qQZVyZXo4koWPdc3QzJIIJuXHnpeG4Jv+zvZF+hmeFTkX6m/jbQ?=
 =?us-ascii?Q?lVFZT3wUXVxIucdfqXJQgiIP/3ExsHX7SZVTaAMPTY9QW3ByxhLRNx8J+8xu?=
 =?us-ascii?Q?uN0L/aQfgbbVbgRa2DSs4QiE+++boyOb8IM8RFX6h9pYheg/BHJztgTb8aIJ?=
 =?us-ascii?Q?swMJHnimxeDZ7/elZJRmxC78nxRNKnQc8LqQ4hKYWc6Me+cukftB9jNW4rtm?=
 =?us-ascii?Q?ruZpHF7j9HCC73cB0+3d1oKT+Rdi2vo8zFMFP8NGixct+fu4Y1F6qBHtsklh?=
 =?us-ascii?Q?iK2qlJey+RMIVKGRuhzUAjLuyrdz4gBESv0WsNUF+ipLRF5tDtWe2zV0vfZo?=
 =?us-ascii?Q?5EdNkfcz37ORHVi5DTw54P27Ka3hvTWXFyH3/8va/Xzo91aY5lQ3xA+1yOfB?=
 =?us-ascii?Q?r24G8cbMZlkTT7yu+QzETFpLsWyz0EY4k/fuZaXlsajuIOOUVUlk3fzJEdLc?=
 =?us-ascii?Q?UEmkqEkHoXt867LUxI+8uZcgQxyIa9TvL4URRSwReLNqxONweojdnkYjvbg2?=
 =?us-ascii?Q?bMUis7GmsG3H84TxObaLvkPuuCmSd4RTG6aRSqVYC14nS/3Lf4/5gsCWyA4g?=
 =?us-ascii?Q?zCHuSDXxPUUypD7CQ1aEGVqIMWhTpP0Xtua6czGaSBsKskyvyvScI6OefmDO?=
 =?us-ascii?Q?3dBlUPkUKIV06Q16JSufuq7z8MDPPSO2OOoro4OuWLkOtglmnBzaQULj321m?=
 =?us-ascii?Q?OJgMrsMhoiPqMQWHVkg/uLlet5wH9OdT6+nZu3V4EkhME+EQKAYTmktPsnbk?=
 =?us-ascii?Q?Av7M+Z8gka1DW4nOBHSKK890PqVGB77FNda1wL/6LRCTyMFuXrvzbNI0Hz48?=
 =?us-ascii?Q?HXjicnj/+YeoXjheIgrNRB7iMBi5TyrG6RY5PSc8AFKMA4fZZi90cfpTZHLb?=
 =?us-ascii?Q?wQdcjTXTrZy3W0LRHbMmHVX6+r3lGO63RzfYbT9mAyeO8RgUu2bywzTmMF2k?=
 =?us-ascii?Q?c0IwewBtXNwNVQpzbHYDYF8gupjDyANktE9RtAxFAnvbvhm34SW1C1ft0iL+?=
 =?us-ascii?Q?dGpP5qdvCOXTmjOosKBxXwcMbqOPE1jsAxJyNbISVXPg5r+6kkoa8/NPO7Lg?=
 =?us-ascii?Q?P7cjxrSdT3DSngg4Nd2ukV6A26IL0ZpRqVQ/TaJLBHHg8Zu6z0t7aeO3oTe0?=
 =?us-ascii?Q?QrsV1+qYAdykVJaBCSJV+KwCSRMCGM4to4PsVjz4YFe8LHUq80JiNdGJhkXU?=
 =?us-ascii?Q?wju23r/Olq7cw8qSuMqIdy6l2rfV4UTueSGPuEtWKiD8kQjhwylbwHUgsUvP?=
 =?us-ascii?Q?fKGqbeiUkHUK9pnO34ZEh2zrMzjYVHo7ZDa7pM/TkT7gqYzRcoKxxKJ18jWO?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbb48d8-7610-486a-1a89-08de172a74e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:33:45.1689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDPZnOdJjx4BDTy4rtchF4lcYqYiiIuw6MOKEPvckIlpEOITKGBXMk4NvSLNk+uspeAxUMiMF1U/pacc4aAdOtwR4io8jSRW6ccFKw37+Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
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

On Tue, Oct 28, 2025 at 06:58:23PM +0100, Michal Wajdeczko wrote:
>We already have functions to configure EQ/PT for single VF across
>all tiles/GTs. Now add helper functions that will do that for all
>VFs (and the PF) at once.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v1

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
