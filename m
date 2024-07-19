Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0125EC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C278410EC56;
	Fri, 19 Jul 2024 16:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlqAZ6kI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046D010EC56
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721407226; x=1752943226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eI4N2ANh2hrG9ASkffJphvTo1hW5TiR4JQgcjFAU180=;
 b=dlqAZ6kIYY8UxJtn4Kis0MOSJ1fZPqruaGZDvX4OI/emgbyX/cIUwnaI
 tfTQ8nIJ+oGaC8HdFESyz070j50hAsm2AoX3g0Zy+2y0jUmCwgL+3Da3B
 OEUzl7/Vvsqjunq0hWCmqXt+PB+SaBOrbqf/MA8q+fJXCxuQ5FU5FcAju
 BMRXdN6aN+F8mp5ih000msekTFPWyIQ2avi9jRHh2PbMF0A4ow1yDahRo
 YaWggRHxXJV2Y86LBZYnjnQ/CwQjo+aHkrsi4jLPwpDIKI1OJP3yT0SOS
 rpB0UPADQ3085mmkVV4nHiw07mf2d8FvuJXQofIWaK58A2PAndt34gSKd g==;
X-CSE-ConnectionGUID: ChryjwBNT2CKrXCxiQ8ijw==
X-CSE-MsgGUID: mwCb+aJMQ1iASkgjRtbrqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18649063"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18649063"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:40:26 -0700
X-CSE-ConnectionGUID: rR2AbHEhTpm1Cv/HbhtZ1w==
X-CSE-MsgGUID: hzVUZi8JRuSTMwgYy2izIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51188749"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 09:40:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:40:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:40:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 09:40:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 09:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYSo91PVGxWO1zVEVrRIFGJoN/9oFQzcPMpt67ogz1QEU4+amSj5tG8hV+nmO/lwku3Jlq35RzAce04pLoEzOFAEqozFdl1/SganhGi/yQWvLheh6QZgLlGcH3oXMEZUQAh1NR7KATbQdgstR8Wd3lLoWxK6R19dUZ300KGsHMlC0C7AR+FHXtHvctL7lGkW+PAcgY3iRDVMYLpZWLS7ZSjYeCtAOqtwGrQbh0zq7LBBHt2R3OpU+jAA8Pj0nv6QbTsIx6b+3sDk9IHdn1ZlJB6MMzIyFsbZQj67a2WLBIMjGq0NMmDlZ4rpWiu+5LD36OmzarCZTiROPljUBzaRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI4N2ANh2hrG9ASkffJphvTo1hW5TiR4JQgcjFAU180=;
 b=wrmD1auR3c36F/ngpG0/oaw2Zt52Hbv/btN502o10kuT6s5/bGcJdIDCuV+S6Y+xrBr97EVb+rXu00CzH3/qFz02PAefnfjQ+dMdYsaKESjvAP08oxH3IM5hqE+D/Uwrz3LoRiXmIgSeoP6Dmky2fiyr7A6gtlEMTldSxGPe5Mv2/Nhse4QwTgpwfMr1Rki+Gj0DUh8/1RyWCfyk+XlOOKsDqDolYnmYZ6O9B4ULgiBRbfrwat0TfpbFXEDq+OaFHlyq3n19i+5aHOtRAWAn6IFN/ws5wl4WDc8MVSPd2x9CslNekLMKRcxifp2f/7k48TpyVdISFcpeyWQ3LfZOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 16:40:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 16:40:22 +0000
Date: Fri, 19 Jul 2024 11:40:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/7] drm/xe/tests: Convert xe_mocs live tests
Message-ID: <26j3qd2w62gjthfhthzcywywk6gieuym7nb3zmsvbmxzvuv5uh@qqi3u5jvk3bo>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240717195155.442-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ead7e3-9f53-4aef-aa0c-08dca8117bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZBE18y2DlsuOAkB5YMjG36NTTHbsxQUNJI0tTUSeTzBx3Gd+iyk/k+eWFTa?=
 =?us-ascii?Q?wKLECWxcFicalOxlShVNmZn1+SDRRGsYGWMQ1WGH53WUsqr0rizmqZZD5gNB?=
 =?us-ascii?Q?W1ylAxTEOG/Yf7yJcjpD36+gej8rwfVQTE0YdED/S0y0AskvS7tM5MjNBy/h?=
 =?us-ascii?Q?RvGXfD5lYn6LYys/perOb5o0WDV12aWjue5Fnd8afRE+pfdkcHSpq9blBY6a?=
 =?us-ascii?Q?8lpuRtU+wgYTfDeITdU9qFAGFW8/XIzH7P6EaoEs2SBlxXStVAaMnD5DN00z?=
 =?us-ascii?Q?OTvfYl4HwaJ2wFrEwe7EehDvP7Wd+SHvwW9mcEw2QdUo13zHbJoSzSQ20gUI?=
 =?us-ascii?Q?D+0fl/gxqW1u+R5e/ujH+DFS2A0JehQavWxHvDsC0mEV4X3GnyhgoAQaWIid?=
 =?us-ascii?Q?XZu7owRLApC0Nfcow6+v0uwMFYjOHpDWvrogk4vLC8WzFBX1/smXvDKWWBR9?=
 =?us-ascii?Q?HHG/SHnwNcsUsasbAgXXJoY4BlwfrHHsk4oAyBCnBvRm1Ii5rAt4vHa727dh?=
 =?us-ascii?Q?whUS2fhpRbGp91vHGC67e0/DIc4+I4Bhoh6h4eVFVVPbGNcLH6dmr6Y8QAyw?=
 =?us-ascii?Q?sNFg67YAHTw5o7MgFXCXA4/DxYZCmS4gelzJp5ypMk9xyDfkCZBgxK1+ziVZ?=
 =?us-ascii?Q?cPVYxGG0vIC3ZvQvqgGDtl78plQua9E6vWSSWj/nkdEbWBohu/glVrt/UFv8?=
 =?us-ascii?Q?sjSEkJcN5HwfyAbJ6/p1BhsTFSwEixNXjp7CqWVgohNY5oFutaiXhB7apqSG?=
 =?us-ascii?Q?A7jNtLX07HKCAX2lU7XaKx0s2w6QDW1Z7X+Oq+RfO03Cg18GyzHUc48HFJUl?=
 =?us-ascii?Q?y3gSpFbEn51b+GSpP654ji4EPaAoD/gZgcCQhNLPKcHyQegI7zlqcBwC+/OI?=
 =?us-ascii?Q?KneJQ5ZP2YpfddIDsMqwLE3c+OQ5iyL5XtKzj3F9P21AD11Ndk1B/yUMZ4mU?=
 =?us-ascii?Q?E3KD0TGVPF1D6UrsN/XIi5nt1+rOnyPzK8skjFMG5n4j1B56//M6zKQobTDW?=
 =?us-ascii?Q?KnihB5ekj6DGbNgLH7vI/W4l4jjTefAExLCwfInZc6LWxQjAUjquFsp7RBhI?=
 =?us-ascii?Q?a01qruy1szewAHEdhSIK78o8UDl2WtqK/dnppkFQjdsFAt6ykGaRtSvw4fNp?=
 =?us-ascii?Q?SCIq4MzXBRosvsV0QebYxgD/DRoUIwiXA3bPayjHPtjsLBMpFIoEdBNmTvfI?=
 =?us-ascii?Q?zi/1GecgC6iqF3moYJT+BCzHVoN6aTeODLpx8GbI4TsaF92FmrkcPQieSrI8?=
 =?us-ascii?Q?ZcI5ZcgkRxbAM5QuAZ+RR8axUNtuxf+sZNfGTiQ1MxhVdn/cpl6nmcOnVPso?=
 =?us-ascii?Q?PcoBnM4A+NZX9qxXWmXAlTFBe8atpl1SblmVdIjrIrcamw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8SlcrRcXPM+S6THQ/JQgjQhVvjmipbKuFhjhyXbXIJyyWUYQgyHcb1jy9o8I?=
 =?us-ascii?Q?VgS2oFPZQFi6ONPAIvJPKZVPwu1+J0w6+9AIdlyguF4FQOjhK2GspuFvG5vf?=
 =?us-ascii?Q?SnO5f5DE+jsTfOb+FZ330ruEvNV8xXvv1JnG2WafgQvQM1RqmD6DUIPsNkM9?=
 =?us-ascii?Q?NRiubbABbWpID20/9ERvZQ4Ysq7F3LaCvFWz87wZ4GluKFkeeJ0NjvdjwQEQ?=
 =?us-ascii?Q?Pr61GohZoditQ47EkIJPsMR1GVkgaiQ7kIKbecJxigLLWuWAcMkU9/QUwhGD?=
 =?us-ascii?Q?MHejHG62OK8IVZDSZFKfR7ld0OlHE+12nAxtu0qWsb5ebwur/vew6CRXCTLn?=
 =?us-ascii?Q?cAsywoNG1NBeFac/YKZ5T2cOhvaU5rtQFmSru7z5BBObbokPVTQy2xWmI80D?=
 =?us-ascii?Q?v2v7RIt7fDb5nXpXqrXrptWKPnfUZbfxDmsaF1wTTK53+GJcKyYgCGHUOut8?=
 =?us-ascii?Q?yrbbZjnCfIvBERpTfEePwzi6x/bWKqBxdLH/z/jo9ZHRAcPxHxeLeZxFXRiq?=
 =?us-ascii?Q?JUWTKfcMSODiPdBUw5zYL7dgqiet1ujIKMKmC5w8NmrdgS5gikLw0BmrKLGh?=
 =?us-ascii?Q?gK7DMj3NyhFdy0Hdr9MJoKghbo7A3dHqbfzzbmjD/sMP+wRY4unv9dRKZt6v?=
 =?us-ascii?Q?w/1N1pzvztGKCzwv2q1VJSe74xoB6zyfrUjAXolJQ58QYHuVZytFoYWAcKb5?=
 =?us-ascii?Q?dbThl+2DNwBfieumq6ZRth9S/IecpvcpruF5TNCyUjKhFIa7X1n0xDBNCy8X?=
 =?us-ascii?Q?vbnId2ka4KhDo5jseurGDh+gcHexqv/9RXqQn8g3weRNivcYLaDjh1Z5rwFJ?=
 =?us-ascii?Q?wGNUrPkQl2vRFnGYLGj9gDmo4Qp0z7j2ilbQJpx0I4QmXEJyzZtga+pcgu0l?=
 =?us-ascii?Q?vpTYb/AF/ptBWHMq0K/YsjxIfNqdrXqgoTwIRGmzsQ++amRnjaKF+K3YQqoH?=
 =?us-ascii?Q?daH4725tMJ8BEZ9vsTTsdxlzUQOc2riBEX86fVR/8IRhNhV0C8pfyjH9OCfk?=
 =?us-ascii?Q?On7yozROE+LakG5TLeI1aTEB+G0hfJNH7iyWQbaHMfeBFktHOfxecSV2u/TL?=
 =?us-ascii?Q?Yf4aSYLebL5MErX4nTQu6xjMCDCSohdZ+9dTchmxfRBt0f9Bs1+qsm9IjUaQ?=
 =?us-ascii?Q?jOHPzilDvmpj2oNctBKnAIpL//XP8ZIQBhwXhgW/Mk7asTk4nJKtJBZDgG7y?=
 =?us-ascii?Q?b48de7i6et9PARvkkDqacwHpFwLcuPOvm7PTrND2h5OgjvDngj3Col1mY6oT?=
 =?us-ascii?Q?XbojhOwmV+J80Faqg3SMN2KoThLg62+PGO03jezyEYXGHWRrMAiMnOY/hx3+?=
 =?us-ascii?Q?5OhDLyVywErwLG3+KgPuRRXrtlxeQttPLocXPd1Xsdq5AW3gx2xu4huQnnxL?=
 =?us-ascii?Q?zLll3Wpl5qIIWDQ0bWSq+9/PyPJKWvrbHJBc5ApZKd4C+y/0QzGGqlZkfIo6?=
 =?us-ascii?Q?HcwwsO3aETGCSl4omLddU4P9BAKB/G/Z1j2ibfknotHzbzhuYPgndxuU6DLN?=
 =?us-ascii?Q?NkWNBydVx9VAg2igLGBudgmy7fAs/CKXV5kw4GFxS3046ydiH3Dg8pNy7ell?=
 =?us-ascii?Q?GvdOxepZWB3lFN65j8IUCoLEAcUmCkUM/q+PUwPmMGZ74aNMVX0S/xHVdmKB?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ead7e3-9f53-4aef-aa0c-08dca8117bb4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 16:40:22.4040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHcSR2Ri5LgVDGAkY6zJeidMvKqmQhkIt+pFuXs50Si4WTw1OivV1MpWjbNHU5sufNt5opaHtrJGcxO3EANk1rwWmqW9O1Fh2z+BTg2Upsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

On Wed, Jul 17, 2024 at 09:51:54PM GMT, Michal Wajdeczko wrote:
>Convert xe_mocs live tests to parameterized style.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

patches 3-6:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
