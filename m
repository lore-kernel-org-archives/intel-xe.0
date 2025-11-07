Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B60CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 12:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008B10E0BB;
	Fri,  7 Nov 2025 12:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoGlD5wZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30D610E0BB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762517019; x=1794053019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PKuNPniZJX9RwIU3LvcYlkasuzvIb5xCPh2OZxTs9WU=;
 b=LoGlD5wZJEDm02T1PceX1Ht14MpyhhKcj3DtNv+vKZ+XCjaeHNlZkFPY
 FzLzZXA/F4gvPGscHJd6u3W0Cc2EBN+eogNedLfWA7ZqJA9J9q954Ikct
 FMTU2MhdTYLVcEf6IVhU6HjC2NT4wHajKYWJOHHspNarNr7+KXz2gF+Xf
 suy4k116AnHNMuyMB3O3CNScOhunHfJN31avPf1w0lPjl4ukfQcU7ihl5
 JxfxkG4TOuVdrKTAj7EQsVdCvX5E3a6SJQMTDlrdiE9/N5SWgtoI1PnZw
 oMXmxYP6D2W8zw9exlAIlLs8LrT1/VeSsblvTqXkH+0h4Kw4AVbzocQKg g==;
X-CSE-ConnectionGUID: pE1is3pRROCLNr/qWESLVA==
X-CSE-MsgGUID: SC0Li4xGQBybNZnmLLNIIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75356302"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="75356302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:03:39 -0800
X-CSE-ConnectionGUID: 5DMW30G7R4qoypxCLLOLBw==
X-CSE-MsgGUID: wtXNCYlRQNu4vNAfgGD7MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="193194295"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:03:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 04:03:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 04:03:38 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 04:03:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=li+UE7da+qSWlIPS1uOfhcqSEDzdvb9nWPtiOCpG++0kIj0NnfkzOgz2PtVCki/4oqqCAJVe/O1LQPF7Lqy19CyVYYapIGBm3pcye46OBfgI/OmBdFR1uJmebN8L8m4ENWEYkzxCOkOjw5KWHaughloNJf+UeWQrlBC0cHda202usCsHjguCYzM63piFBh5608uZRZiG6OKn3+sZeI/+lsG58nfkx0DaQUBOW+sTLcBhKXM7oAEahB0y5GQ/l3ixy9lqwtJGbTsXV7/XdfaMAgQTYfewsBC2uI3LjOSdkOHuJYyAKwTGIqmKb+BG2SOJRBz+ajDBXZZy3hH2Aamyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKuNPniZJX9RwIU3LvcYlkasuzvIb5xCPh2OZxTs9WU=;
 b=NAeZnjHxP3DDVfj321OOqy4XmuNzNWv7r0QBEN2NoxStlu78TD1QKH3NJRI4gwFUeJVosOD1FN6Xxkuxjm9OGSc5QH9R3zZ4Jx0YFLCU79vIHK+eNRUUToTGZLsG1spyN6Emo/jEPLyPqN050TdS3ir375+Ae1103h2Vv6H0h2s5PVhaxJvp5kqbjKO9Y/+tIs6/zMgOWymOEW84h9IPMudefvh9nlghp/i+sgc5096k05z7iwlLNQ8pF/v6TpEI3z6vcHytlQavjxDX6pSNCWp+7TnIofPmX7piQNgIwcih+jtcITngltfUQ1D49yyB+3KVStdtaTPlsNWrILYuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 12:03:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 12:03:31 +0000
Date: Fri, 7 Nov 2025 06:03:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
References: <20251107055746.110055-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251107055746.110055-1-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f6bf0c-d33e-49c8-66d0-08de1df5ab67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h9MoHSuwdCp1ivsNgaiPE28/ufYVKSDDpNFPqPV/aaiLliSAwJzXzu8k9RI8?=
 =?us-ascii?Q?BzcqrD5T97sdmxDSRWpxsuiLsOmwu2p/E6SAFqyOS0rZFI90voeBBzoaZlim?=
 =?us-ascii?Q?vvuAdsaGwvbIKnQA4RhcKnsejhMiOcpc7XXTVx8MM06LiLbGoLaInqRTcdTV?=
 =?us-ascii?Q?UgwuVWHRdgf/7G21TrxoxkSj1tV86XgvdPSUmtQJPp8gjacRksLDlBw5CqMf?=
 =?us-ascii?Q?DimmwO0SP8IjjdAcsFC/9SX5PrHDKNbys+ROAcIhGKoIM5CFIRmdpCHe50m8?=
 =?us-ascii?Q?UrJXyVkh+UHPAp+0OnVLHb+GlkWchpiyJaQSeILOzlbiYmPBJZ34zfFaLN/F?=
 =?us-ascii?Q?+TdnX/D0yU2E23y1QVPQhdt8CYXWSIUN6E36WPSe9ozmte+4WLXzTZCILPZA?=
 =?us-ascii?Q?BuQmjislJaod7O3jUPtjP2MtdnPt0wfTUYJ9W0gP10cLnZBuOO+mO7Zzwuqt?=
 =?us-ascii?Q?MJ+vd6c1coUje0kqEYPE/H5GiCtsnNHqYHZ5MKJ31543XTYo6NihkqLnVBeO?=
 =?us-ascii?Q?OcaBt34ki6ygx0WHxFMAsA6/8CyYGcKE+zxkNsCjCrrh7DFUDYXkVGS+/rFX?=
 =?us-ascii?Q?Q4lgQU4WXFCxvr7gdisF6JskS20PpCJc7bo5LaVU9NcB9wlbnUB2dNLQuZdN?=
 =?us-ascii?Q?Q86Q0zawphamQmZkv5rKWjeSeljjLQE1CsO00uPBimbJHhCD4uFm/9Uo7Zk4?=
 =?us-ascii?Q?U4AQgjHFsSyaGN/n1mxqdSoes0EdZL0CEgKHrOJcLPUthvT7MTMb1ru2ZbLj?=
 =?us-ascii?Q?k1dy0pQVFlaf7aplJrAbGlX8HuDIgpN4Kkwpac8nr/L/Gl5evhr8AxhYLtLQ?=
 =?us-ascii?Q?D0Dp+/WpLpbYRa4neflkXXUsgjiTg8xpPZX2pALYmsl6jFmbwJLSD757smhm?=
 =?us-ascii?Q?ntrksCbErkoovoW6CnHo3hVBXWaM4n5jBmPv04tZGBDJlzr+bA2ONNc+dL0W?=
 =?us-ascii?Q?1wynTLsv+HcKgXHzGR35HjP/4r953fqA+sKAg/DJAaQd2XRJ7f/IaHJz1PlG?=
 =?us-ascii?Q?9o1c70Mk3RK30M0iBO1rldErTokFfWwEFit1VvM9pHkbr4tw8GHR/34vl/9u?=
 =?us-ascii?Q?+GhvGaHsMjyj6OXAV5nWOWuSgZvzqmWWR3KtjOXUgiEDUqY5tJ1dYOzeffKc?=
 =?us-ascii?Q?D4ygetS/S11ej7HQ8jpc39kx2r9ya3pVhpir5GmD5jfa/bxFG2fo2dnNHh7s?=
 =?us-ascii?Q?pKwEc4KPR1bLBkAAwVI7QAjESrIcfhxP2BKA+1hELHGJPeqJXC6fHPEwI3CT?=
 =?us-ascii?Q?B+bmUs1LAwbdK5N2zzErGihV/Y3qjfCMRIjnjklkjdq9TX4BdpKiYZouFwRy?=
 =?us-ascii?Q?e8tUVXA811FeNssY89Fwiba0Bmexxp0F+FaMAB42Iny4/sTlpji0BKpdq6Za?=
 =?us-ascii?Q?EYkexziXYvsGoWBCSkoQoQ62Y5Kw+G9eMBsX82OJWPkJkAIX/jnUQraSOEEz?=
 =?us-ascii?Q?+1vrTyDAdVSOJoyeYuTjN62Ms8OrSYaP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oKZymTLvndl9Qvv2rTxpOXeA2udcIBc15f3jt+rKwgpgt1I6Z1boI1ydLobu?=
 =?us-ascii?Q?LTVKTmDapr5RdQFe0W2/ot9vMVTzOnV2G9wRDFsn5CTQFvH/yah9eEO2EIgJ?=
 =?us-ascii?Q?NG1tocd5ojPMdQdrfOovzW+M/9ZGART/qAsnOYhN605ItXs6G9Ur6CFQbXKG?=
 =?us-ascii?Q?itB6MSm4j1JAcXhjKk/IN5So1fazhq8dFAIjnTgSzuUqXbS/QiYIJAPyjQ9s?=
 =?us-ascii?Q?8e7otnwGaFNDMoxV7jxDne4A9iB43Z+Gmi8wBCPi33tFZh7/LeieUOiP4icx?=
 =?us-ascii?Q?o4OD4AvIDHw9jciOsOQonOIi9Hvdiu2Wu+AhQBRLY4cZl6fY5+wEL56YVCUb?=
 =?us-ascii?Q?bkvBs9gpDo7fTYjfyWorQ3XCMmaK+Hg5Y/UytNrld8VPd0lI54Btvj4E0dJ7?=
 =?us-ascii?Q?bo4ufpeNl9pjBiCg3iHzeKaUKooyit73mHuLezQTZVGQhLTo2AKZcl46aZKC?=
 =?us-ascii?Q?0un3aVE+xplo8ifVGZXx1rncp5vmbfHb0eqJtiLCwdeEVxxP+n4Sxd0vrNPM?=
 =?us-ascii?Q?mX8YTYVZOcepwkD5rWkQoUA9MEYDfikKz1r6IqIYqcj3+FPNVdft3pp8pubk?=
 =?us-ascii?Q?CsMjravE87VxK10b0+Sc2oMSlR0XOhRPdcthm/p/SQDfgMAitxubN23czkHy?=
 =?us-ascii?Q?oaIuT4YHIUtDtm08UMKqaxsXs9unwdeIifC2ciJBq95pK/sqGIJCSQlfFMbu?=
 =?us-ascii?Q?2YD3hDEX5DxvqrCi/QKKNVr+QFo2ffXytnxS6Uh95GedH0FVmjn0ZoO2l9HK?=
 =?us-ascii?Q?CX0D+QmuGE9R6oI7SdcqNZujZyQMaqxA3rR3Jr/0T6Bo0PE1qWJs7NpOX+jk?=
 =?us-ascii?Q?QJCWoAhTom3J28zgKR37yvEX+gs86f3vlfsfV3pzMvNg86TGuETRuTK/vNzJ?=
 =?us-ascii?Q?4ov5u9o10RKJF1I+W6ClqcuU/C6pRjUYORaq8HjhTevTK3+vCei4fYaj/QuF?=
 =?us-ascii?Q?fSSKDQKsb75cdZtNXha9va0Pg5bUhK8nPefEHOkb3I1/eExm76w7YuU/qzCx?=
 =?us-ascii?Q?sobABWDC8SNFxK4KpINEqC5nFZIJSTRuPzpJFc5FylKy60/qQmhTf9HjN2+z?=
 =?us-ascii?Q?+H30S/pkaQefyEsszjeW9zuQADfNevyh5DH8rKS5q85ZDfm4Y40dbf+P7UdM?=
 =?us-ascii?Q?sQe8OUTTmO5GfwAkfRq1I6oCxFuSmTbtY1BNPXR9B+XK1R8vXXfqNRqEyxhx?=
 =?us-ascii?Q?FKDNaHbDE/5g9qjIKxPhfoYmqu0SZyE3y8MDsP7dYzuU7mUy2n+tdNC1otCr?=
 =?us-ascii?Q?3u0by873n2L0AcknpUPBHv4k+3Jqm59txaYNuRnl77XcdqwM98CQ0ARk59Fv?=
 =?us-ascii?Q?CxRy416IMVGnTiTD2lOt+flVolYtaWw93fFRQaZAhr906FkXuSTFftFcD/EK?=
 =?us-ascii?Q?ncrG/0FXRO9NXHN5l7N+t8a6/BkDbZYgJMZ6CY6wEM8C4qgQa/jA/yFY4ad4?=
 =?us-ascii?Q?GvzbgjrTFgaoBRuEluUQNQzJEpz+Prlol0CGC0HYEheU592QFcKBOhvoOP+2?=
 =?us-ascii?Q?l6OqoyfglrJ7Wfi7Q8YiNeYWjfgiwONJ98V91JI2gGWT1my5/ubPfqkqJb/X?=
 =?us-ascii?Q?QqGvk2sJ5ldJLBspKBfy0VT44nb2QWe30DBh4Se012f5krc9EYVuC/WvDp7p?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f6bf0c-d33e-49c8-66d0-08de1df5ab67
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 12:03:31.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWy8VgZm7HW+vzKAUwAdu3ZlMLef86ZnkFnq7liZOxgMMIh7ZtQe8SJvahkv1SKbcjKqpUt+IFO3tew1/aXG1JlBO33+GnRhfOuvqORE9KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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

On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
>If the device is running older pcode firmware, it is possible that newer
>mailbox commands are not supported by it. The respective functionality
>isn't useful in that case but neither is error logging, since it doesn't
>particularly signify anything wrong with pcode firmware or device as a
>whole. This is useful in cases where we want to make a decision on driver
>functionality based on pcode return codes and a bit simpler design choice
>compared to other solutions like checking pcode firmware version, which
>comes with additional complexity of binding every single command to a
>specific version and deems pcode commands useless in case driver fails to
>obtain it for reasons unrelated to pcode.

yeah.. I don't think we should regress the support in new kernel
versions and require users to update their IFWI. However dropping the
error message here also makes it harder to find cases in which we are
indeed using a wrong command.

I'd say to decide on err vs dbg based on CONFIG_DRM_XE_DEBUG so
developers can still see the error and take the right action.

Lucas De Marchi
