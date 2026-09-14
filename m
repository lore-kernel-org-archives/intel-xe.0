Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A03BC88E50
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 08:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66528920E;
	Mon, 14 Sep 2026 08:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOl5jW9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ED98920E
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789375026; x=1820911026;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wt9LFT7P/tTYe7GeJf35q2AH6jBP9a+cG8te44slMD4=;
 b=cOl5jW9dY4iDtd1pgKv23idxw/PF8XfVM6+D9qdBsfvG8A7jWSEPozYL
 t3GoTz1LQnzRQ9wuF58hIlv9arrb4obvETzP+CSiTauz9ULpQiAUwV3ui
 9S6wz0yozaccc2fFvWTHTajDstQdcu6MFLAcaE7WfuKIuw29RGLR8WM9g
 7gnNCXFii6zD29qXRPXYCfkEUvjryqmzfVcOs9/rVNXpcok7zDHsSTBpC
 awQ1xxDBpXU8faA7uUHaqzpqms33iq/TT4ogO1eSYEwpT+0amqXINNQoo
 y3/aIFNThi8/AMHAMJVLEgQpFuNKrXWJB75rC7MqHCIhITGHXf36xokCh A==;
X-CSE-ConnectionGUID: OxzzS1JXQ7qgqhczMTEcsg==
X-CSE-MsgGUID: TUN5iMeaRTufaiDrff5Kfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100319025"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="100319025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:37:05 -0700
X-CSE-ConnectionGUID: Rlcf8lhGTiiEO+fW7fi0gQ==
X-CSE-MsgGUID: SJO/1Tz5StufbBDUMNsO2A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:37:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 01:37:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 01:37:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 01:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHfl5SAhePB0e/gDjJAVYWH0KeDIzEDjM5TygcSCV+5Cd6FYprTuA/d6LX/m5VY6q4EXUYUPxuvp91/gFbQNXYo+xLqvrzb2tfklBHwyKd/uGOAc6EYjBRYmlHREsAgpplImS9GSRv16Ejwh2/4cOMEz9by2Svi8iN+lAUb27VJbbEQ2i2D3Ze2GcsR/4dYOZbP38LMq6U2ItAvNxh9qi5LfRl/E6wgzGkGesZ7CdohmRDJEJ30gmTs3DPuUFlToyXSb+qBRoCUhFREKcMx60QCcfIw26CoNkS8SdgucXyiYY+iqT1l1ZCzlKFNVORozidLObLwdbrEhVeEWsZSIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd9K3I3lMDAaoBy3+gFMA+0nnnt3XmlcbC7sAGCG14o=;
 b=HV1gXLBK2Xh8vNgy1G0O9Iw8NO+uhh7cIgqT2+5sm+oYEXxKV4Vt1KdDlfAIsVr2stPoojB0olNEFYYaYZWpTogE6uw3vvxSc4LPACiAYY350A06/P5nJnp1ZKg1Kt4BCQ0AGhWMwgq5BfhfF5zH5q3Nxj2Eq/UeuBL1wx4j0fJ9ZZxqUYIOC9FMfd0HSaa7FdoDTvaLajb680eLaae4rci/TiVkC4SmXtsMaAnS33Py4NsqgiRmm1nF9IfGuZLHOrcRjECDih4jXwcXqmu5NkCmrQ79GTr5mmgcgjgGrF/jROsVE96PFznWet0kEtm/FRKLbAJ1o7YFP8ro1W/h4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV4PR11MB9516.namprd11.prod.outlook.com (2603:10b6:408:2dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:37:03 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 08:37:03 +0000
Date: Mon, 14 Sep 2026 10:36:58 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Add _locked variant of the release config
 function
Message-ID: <20260914083658.x6qmou6hs433c6gv@intel.com>
References: <20260911183257.14999-1-michal.wajdeczko@intel.com>
 <20260911183257.14999-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911183257.14999-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR04CA0091.eurprd04.prod.outlook.com
 (2603:10a6:803:64::26) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV4PR11MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: d87e6ea9-8ff9-4dc7-14ac-08df123b59de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: l/JjnMtt8cvbDdo1EswuI6Jfn/xP5QoMlL0fXl1FKf16kbZ2lPMfP4bYtT0Ol2hFPCj4cxxt81q7gyBoqYp21Rze+z0jqq3EXv7Gs8YzAnXErGPvYnJxe1EDGE3400tS1HaqcFrTEGPT4YPLWS61++HL8LCSwEUvR0RlYDGWAaghmqsBuqDmbYCjbXdZ/unh8XM7hrLD4DGhQRqm2VOMcx06nQw1tUBt/qNv/V1ruvm8j1k+A1lreGdBT3+j+kIIrPENiRmq5cexdqy8lnsoQ/3IJ4c/LNs5VNsIfxZREC/lfhTdKT8nBsKO/ieTRP27tzNdzFOB1VtOYHk9plq2ehOLWz8cOlGYWpjbuFEUl5orEzbDIkrtaBPAvK2rtbVnn7gS1EjMJjLGL9mFoiDxIr4elxeMMjdFqlwgHRFtmRKg2WY6qJ/QyUi7160OsgnffrwtxwsJbiwTyT9JozVrpx73s1PfEPqipzL3JemEk8gpIgC//twsEVjMpTDSy4NrQ5+wzaYQDEgxoJbOAmbrIDEMVPsFZGKDBOppp61NI+S3V8uP/2QYDvbC/Na+PtVBiC3jsa0R57wgQ6imgiCqm1OGrhsDk/zOOJ5SAVJLEU27HKqXJRIy4xf4/ZnYnHvwt+5M6facBbDhM876iKvfYqb2m5rAzatltGj1HF0LjvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1NtSzZsZHZjRDVnSU8wMW1uTno4SWd2ejl5RllvVG52cmppcVppRG5Cek50?=
 =?utf-8?B?WlBYeXlxcEE3cTczNFd6MVFDZGlOQ0lobWcxWExtRUcvblNRL09UNVd5ek5K?=
 =?utf-8?B?dnJaaXNjbHB5SEpGdWtJU0pVQW1TZDNqZzc1TWRpbzJCbFNLeWlSN3Z3MHV3?=
 =?utf-8?B?YzZpYk4rZUNIUElqZlZKd3NiSzV0L21tSFJJeDZQcCtlbEd3U1BwSjBqUk54?=
 =?utf-8?B?L3dHY21YMElKMGpjVkVJUGF4QkZVdFBEWjZEVFJkT25Ebi8vNTVEMDZrSDl2?=
 =?utf-8?B?cFFnUXV0SDVUbGg0cUp1MG42Z1U5d0VSTEY1dldRVEhQa2hDZUVWdFJWYXNx?=
 =?utf-8?B?SFFGUktjK0JhTGhLSXVwTUllYUJvRXNIbXdjUnR0ck45VHhmL25rUTVmemtQ?=
 =?utf-8?B?N3U5N0Y5VmZzZ1RaSkJiZnEwcUlsZDI4WDRDK1pGbmI0ME9TRmpvbnBJQkU1?=
 =?utf-8?B?TzJyM2MxWkV5bnR5bnFUN0Z3SnRVZk12bjBMMnlOZVA5YVh2U3liNGZvT0pv?=
 =?utf-8?B?VEYrSldCV0x2L1BwNWRNQ0VIUlR4amNpMkRsN0FzcE5ydWJnNjAwRGFSZTBO?=
 =?utf-8?B?VGRuYndNQWo3akUwRm9FbDA4MGFFd1g1T1k2N2lRVTlFSnJpTEVqLzNCbzMr?=
 =?utf-8?B?b2JRWm9SOFdwWTg2ZndVb0tNOU1nVFNOM3NNcXgrYWpRcUVtMmN1cWYzaU91?=
 =?utf-8?B?Tk8vZnROQTNSK1VyUlprUGZ4MUh1SmtxLzdlWDZHSDc1a1VjS3VUOWtnY3Rv?=
 =?utf-8?B?ZVpRUVo2QWFKcTZFSjlXM1ZFLzBHL2lCU1Z6SGEvWVltZnlqdjh2WThOb1hO?=
 =?utf-8?B?Q0FVUE13eDJ2ZVN6QnJtNHFjK2U4QzNxcG9ZY1VJSzRIenNzQWRBWnh2RnQw?=
 =?utf-8?B?RHdBU3IwSldvNGN1dW5DZmVwQlhsdy8raEVzT2F0N2F2UjVYZkZFWlJ4SFph?=
 =?utf-8?B?Znk3SHNyTy9iWGVHcjNZbm1MMGVqdmdySTNncWtlK0lrNU9NbVYwNExqenRq?=
 =?utf-8?B?Q3hkeTNUdXFoYm1aZ2lCK0k0Rit6U3M5YlZmem9QSC9uYWczNWxGS3MzNEFr?=
 =?utf-8?B?cGU0OVEvN3JCNEhlaC9Td28zV0lSc21PQ25vUjNJUm5uVUwxOE4rRFZqMUp0?=
 =?utf-8?B?bjNsZEFEU3ZVeldDc1B1b1crQnJob2hGU1paS0tLK0tXT0g2a0VBenR6NTh5?=
 =?utf-8?B?UWtvL3ZtVzZxSTFwR2tLY0VGZFRzWSt6bmhuMTBIQWdQendwRytRNWRneTRM?=
 =?utf-8?B?VlVib0RsT3c3TTI4d1l5bVlPOW8vNnVKUDlmeFE0LzRQaDJYTUV3VzUzd0RP?=
 =?utf-8?B?cFY5Sndra213VjV4REkvSXRDZ2hWOVVoWGZCTllZTjk5Vy9hU1NIWlRXcDFS?=
 =?utf-8?B?cjFOaGxIZjhwOHFiN1J1Q0V1aW5Bcm1vK1VTaHBpcnI3SVhkNWV1WG5iT2x0?=
 =?utf-8?B?ZlFKZDY3bWdXYUhmaHZrOFlHNlNORGZiQWwxdGpQamJ3WWduTkV3M3BnUTZ4?=
 =?utf-8?B?M3ExeTBDOG12cWpBZHg3cEVEOU1uckZBS1phc3hwdlB1cG1xMG8vY3JidlZ2?=
 =?utf-8?B?a0FZTWFhc2Z2eTBmYjBjZHhFL1l1SzJJSnZhQVZwRC9uUjk2MnZYcyswdW1Q?=
 =?utf-8?B?eUtYdWQwVUpqWHI3QzVLWW8xajJNOVJwazhPaDNhbS93bnA4VGR5UDNlL0dE?=
 =?utf-8?B?L3VQQUFZT2V0NnBGb21MdGo0ZUZIYkxCZ3dDaHRZTVpzY1BWRFAxdkNFekIy?=
 =?utf-8?B?Mms1dndmOTM1OGgyMnppRXA4V05VdTlsVXU4NGdTaFQ0NWZxZFR0bnpDQ0Fk?=
 =?utf-8?B?NWZsNXIyejhTRXJKcU1Jc0pWUXVNcXg5N2hIWlB3SHg2RG5pUUV6bnZWS2JP?=
 =?utf-8?B?ZTdTZ2hTQlVMTHAwYWgvOExDcDJiZzAzT25aaGd1SkJKTkZJcnJHR3NZTE9P?=
 =?utf-8?B?bGdUcndlbkRHRWhXZEloM0tHVHpiWjFDeFl5VTVYakkzRzEvNHA5N0FKKzMr?=
 =?utf-8?B?b0YwQ0dicXU5Vll6VTF3WHFEL3NqV1o1Q25PWGlNOEtHNCtpQk94U3EyOWZL?=
 =?utf-8?B?UjFrUXhHWE5hY3o2TUJMRmdFWi83eWdYT0trSy8xUmhNWVdGOWwwcmtZemcv?=
 =?utf-8?B?Q08wbU54WWtqL3RJQnRYRCsrOXVFVEZOL3pyWHdRNG8wQlpROTlSL3FHc3Jp?=
 =?utf-8?B?T00vS2lzSVZmZ0NtNGs4S3ZVOEtqL0xkYWwxdWtqZGFnN0gxaFJITkFuQWZw?=
 =?utf-8?B?R01nOEtmVFpEU1ZqVmQ1MlIxNkxSUmRvR1NNbi90Tm9iYlZoUS9SeHdjWkta?=
 =?utf-8?B?RVdURmJHMmZYaXkwOUhuZWVUbEJscC9TYndLWGVzOUlBL0lNeFVscjJNRTV0?=
 =?utf-8?Q?5nzc2nbRfkJXKveU=3D?=
X-Exchange-RoutingPolicyChecked: YIyrsr26rUAs/tVIffmkCBYbY2e6TVNB8KP3bG9QlN2gs4NKfSEW1hWYz+eLwDm+Imk/fGTlQBan4BXa/CDAZyImakg6NMkMCrTf1Dd5JRMLFBkuOupKPTjWjvUEb5Du+MEeoc+bdEq5Fxv0VYpnHlDPnwv0sHqBUvY3i3sSk7sEv4vXB9RzvpJNqWrojqiLUvY3KbRrMZf0B0AF1uO9H491GLaxsowdtZZrcL8mEUrYH50tTDNH3Ifdf20uN4khrbhVwCJ0PIHfrbi4xfyMD5i6FEMAP095S22VfUiE1VXqM2+Mws6jkacmvv6nJfAS7u71lSm+XcxqopySYMX/bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d87e6ea9-8ff9-4dc7-14ac-08df123b59de
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:37:03.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMPfFOQDhUaIr940EsgNDIZHHJK5CC4uWfd3K0iEVwmln9LvJESLxwVPvRSKZaYYPlhs4/1iHHwzCAQ2M6ZlM18X55IS6b55lLinkspzz/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9516
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-wrz-11 20:32:56 +0200]:
> We will soon want to unprovision all VFs in a single step, while
> already holding the master mutex. Split existing function into two.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 ++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 8de8f42ed4d0..146981aedf5f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2932,26 +2932,26 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_release - Release and reset VF configuration.
> + * xe_gt_sriov_pf_config_release_locked() - Release and reset VF configuration.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier (can't be PF)
>   * @force: force configuration release
>   *
> + * Note: The caller must hold the master PF mutex.
>   * This function can only be called on PF.
>   *
>   * Return: 0 on success or a negative error code on failure.

NIT: maybe:  * Return: 0 on success or if @force was used, otherwise a negative error code.

>   */
> -int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force)
> +int xe_gt_sriov_pf_config_release_locked(struct xe_gt *gt, unsigned int vfid, bool force)
>  {
>  	int err;
>  
>  	xe_gt_assert(gt, vfid);
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	err = pf_send_vf_cfg_reset(gt, vfid);
>  	if (!err || force)
>  		pf_release_vf_config(gt, vfid);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	if (unlikely(err)) {
>  		xe_gt_sriov_notice(gt, "VF%u unprovisioning failed with error (%pe)%s\n",
> @@ -2962,6 +2962,23 @@ int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool forc
>  	return force ? 0 : err;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_release() - Release and reset VF configuration.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be PF)
> + * @force: force configuration release
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_release_locked(gt, vfid, force);
> +}
> +
>  static void pf_sanitize_ggtt(struct xe_ggtt_node *ggtt_region, unsigned int vfid)
>  {
>  	if (ggtt_region)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 84246978d21e..d43da8599977 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -90,6 +90,7 @@ int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
>  int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
> +int xe_gt_sriov_pf_config_release_locked(struct xe_gt *gt, unsigned int vfid, bool force);
>  int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
>  
>  ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size);
> -- 
> 2.47.1
>
One comment above, but still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

-- 
