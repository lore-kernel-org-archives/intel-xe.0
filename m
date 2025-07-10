Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE77C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 22:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06A310E987;
	Thu, 10 Jul 2025 22:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUMRgusf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8D10E987
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 22:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752187377; x=1783723377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X9TgNxdv0+S0WWM+UWa1nFD08WMww7nU/Mx5NiyPnzU=;
 b=FUMRgusf7PZp+Sn/Y+EykYyMZVUHN3IvP0iwXcmXkVCH1TC2oVx7UN2e
 OhKmNivC/f6mu+gW6kRJ4Z6iNg0xRzNO7QhNP4Nr3Bp2WLCq+XwpfE2Kv
 GKWvKFDxjpy3Gx+4spNlJhu8zxA5ecBJterB47/T6jtoltksQfdjLMmOg
 PyOYk9MbuOsvKstYrGFxcAPWUlYRRDZuUvqrh/cwS7oybBljVn9i8MtmO
 wYIei4p48XltHb/bhc104xiRwgu/xzZzXZ8cibBmFawJ6pGMBZNUvYfkg
 wQxsMx4W6c9/hie9JoynNYdSlsO0DRZqZhGU+ZIY0T21GaEM9iUXNNdFy w==;
X-CSE-ConnectionGUID: Sq5DCvACSiuTUL04Cl9nlg==
X-CSE-MsgGUID: 1lPMw1l+Tmu1N3lIttrdSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53700846"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53700846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:42:57 -0700
X-CSE-ConnectionGUID: gbVWK+5tSpm9KiDgBVRcVw==
X-CSE-MsgGUID: LzwgR0RETaC9XPvWK+tVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156556893"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:42:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:42:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 15:42:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGammobztxnxEHD8x/c//duViRzwNGtOl540CrFUglEhctbzJvW41GEUz6RA9zvXPhSp5VggTwi+uqppB05MykZhcaF+pw2+n6aoSXgu817OIAizhcQ8D70BXWZkME4gpn48z7Fch+LwxS/MhALGrLAEg4GJQImkeYRU2l0mvBDNd1O8FV/fEwftXzkp3T0KQf2tDFYP5NF7OufDT06sPG+L+hmU70kwZ/FMh5T12ccGBGFaFnDFPxxSNc/1b7UbnQfD7PcfuqrmEnFsF4Ivx/bg0LClUYXQ0P8KROqjNmFz4F2wUbO2Ncg/pzQRT+yc+Tz3vvybcPrygIrWTTBZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9TgNxdv0+S0WWM+UWa1nFD08WMww7nU/Mx5NiyPnzU=;
 b=tx1atUuS7+brfnOPeokcgyuQtzUWO7jJhoYhisizjnfQNMVOjrwlp+znKnmc+kRgWWTKAuYHHGIVbo3SALKHRAAxe9nYpQV6fmXoTkgIYFQJzl9dR3edJ75uc2wLtwuyMi9m8JDE5tGaqEvhC4oHg0W/J8YhKYN/UIVqkvkgoSXGGRohNwsfMg818BxdmARm+G4FvWmthyc3W649EXDAD+ELNyFK+zF4H/2M5m+JTyr+WEyKabH0k9Ww3T9YN0bCMsoQ6Oj43RCxqUbXue6F/2jWcA+3F4T93ZcihNUOKGfOHT/Aq+nRFNc9j5zRzok01PEtyLNp3fewLnCEa+0m4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 22:42:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 10 Jul 2025
 22:42:53 +0000
Date: Thu, 10 Jul 2025 17:42:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Fix alignment check
Message-ID: <gphn5cnfgqpzaynuyttdyasnuzvkhigmoxza5qah4ntabicwbw@qo44ra5qjqht>
References: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
 <aHBAh6HHWCRHXLei@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aHBAh6HHWCRHXLei@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cddb03-476d-4a10-b157-08ddc0031b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IdLlAiGrHPXSH6igHYUWQhVHA76z43hmCj9sa2VSacxKM3kmlDISMSOyguaK?=
 =?us-ascii?Q?mKonfS4XeUuT0eg7GvI5PQ9k/Gk3Pdo2z/Y9kQrX6/bhHUlhXVtArKsCpYPe?=
 =?us-ascii?Q?T3vVGdyZGLQRQdpG/7mjsYDXH+gQEwgMLkmgOXf3IOZC5b0w2Z8BO8wDSS+N?=
 =?us-ascii?Q?XHQpr6j5GPSRe5XkaWQED2VL09WOR/9DXx6UmFOeFaCYZDBCJ+S1wLol9jAJ?=
 =?us-ascii?Q?R9mli81/LSmCmd0sM2DHK+M/bLjwzVNkuoL1b+bR0kz04c6k/8fRiQ+fMiZ8?=
 =?us-ascii?Q?Bl1cWurqVYEO3vROOUaMqGfrEomANrw+khlV2zgmBSN5/+/Q4h1ppVGWPw0Y?=
 =?us-ascii?Q?U9ZE5AIYJ6w9oD1QCzgdF5Ab4QXEbSSo08vp89OzootIZ3qIDQ4gUxy+nbt1?=
 =?us-ascii?Q?8b571RuWI4WVThMMWD0EC6Yry9liZrwvLpFuhnWV8IMURKL0x5F+uC3N0sR4?=
 =?us-ascii?Q?h1kenFz9DPCQqwn8nu23r4MDLpcWQyMDoBkjZX+dqy7fNdhJ97RdXe6sppII?=
 =?us-ascii?Q?TnVe2NqreStu3wRgOaIRZmgDLtrKMRytQzHa1Nfk5sZXBq/bnuF6457brM7v?=
 =?us-ascii?Q?LDCjlZ0wuYWMK8pimTfuy0JXZX7LmOU4IPOoF/ntYOCVC/FXO9slhkLzALgk?=
 =?us-ascii?Q?fzSqREakhvLvNwMbHdnbmhGUedIv1vQm6XhMTl8FrjahI4Bs7FgP7SCxcXO6?=
 =?us-ascii?Q?dho2IG56reVOvVGYL+OHvFisLRf8TK2N+fEGHkcBCOHa9JGFfFdxtfO2KZgt?=
 =?us-ascii?Q?4+Xg8tvVK4YtIr1B01gNLTNtcXUlx3f3JePschCFZwdrMtS0nIHWvXv16RRf?=
 =?us-ascii?Q?U9URKCXlj53sAYG3/qIgpZADFmebwHZIalCO772Cefvn5eQ+4IqqzwdWVw+N?=
 =?us-ascii?Q?In3Vk9De01b58EZbvtPGGRCrvHhn4c2N+mc4vjKvndQij5AqMurJqeqSNkFW?=
 =?us-ascii?Q?9AVd0SSdZqkAmP/PNGwop4xNjRCX7XUvSpFDkNJHW49krvW1Qd1WyBag76HT?=
 =?us-ascii?Q?0oEZlB6J7sjyScjTWE0+hxsMJGmtl9KNjIEhH2L13B7fVFdGtf2k4U46E4mQ?=
 =?us-ascii?Q?hWlaYPq9oUYqL/8N79zP81OwTUGxpfgU7GJbysIBkp4Om8eyBXYCORaAGil/?=
 =?us-ascii?Q?AqY/S7NgRpE+rOiNXQFlL4I1fCDbzhN71kKpBXJFNbOwKAqPbrddcLc7RnIx?=
 =?us-ascii?Q?u9wIxSw7zQuxlG9OMVxLFpeWRyYbe9HqnoclUxnNzetOyIId5mMxDSJq+KxY?=
 =?us-ascii?Q?6SiHWrSh8FqUS9SKqx+SvUL5tn2mVaLao6OhEntxGgUySap6LCnC4PRVw23n?=
 =?us-ascii?Q?o4PQkUVTeU3nLAT8aiWCu6jw7lSWznobHme9V74nnTx8UYSDcQwaoMFQpFLI?=
 =?us-ascii?Q?DesAPAfZXHT/xjOSZX6YDq561+nZ7Z2sYp6+OChdECnbX8Qgo6ZCVkavoT4A?=
 =?us-ascii?Q?70AEsmTRCt4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Ra39Jo36lquu8F32Q4W8ddRg/t9PgOKI0UflfVZzOT7vWL1I6v8V8+KfVRD?=
 =?us-ascii?Q?MmVBJrEzUhyUpv13pCYJ+vPoV0JscuyXRPfTDMcf9HXisc3f9DajStRWBZNZ?=
 =?us-ascii?Q?qzXeIJtHlWaxOZsqrTQRhFGaKkRG+XvejuHux0KYO6tP9e7yCSWdTMmYb+en?=
 =?us-ascii?Q?olK/7QcjJHY+kTieqt9tEiZmz5ioSTeYFclb8VXQOJ5xm6WEaQO7aEYEBx07?=
 =?us-ascii?Q?CzaIM5oiH9cH3gmmmCls7YaTIzJelNIGWXl/1Bm6Tvc/v2tkOmTwFmo0c9IM?=
 =?us-ascii?Q?o9ZzAOZUquexsjPrXpxngjvABKO4OzXF6nIsZbrmghaEgJPAEv9bWSiyqEtL?=
 =?us-ascii?Q?+Haxx0rMjpm1z3WYdUAjz8JIq9L8OhvfIx7RA0QI81VtPU2+8swjcKS6Vlla?=
 =?us-ascii?Q?0JN8fKylSFqto5YtDM6xkiGr98EcsfVSup9FLz30Mg02h41gCZcWUcSbTOc/?=
 =?us-ascii?Q?ARp1iIp1cYTuImLJhIjxH+2SdaKl/0G7ZwYSKAxcww8V49nUjBg45RoEQ/ma?=
 =?us-ascii?Q?dJEDwatJoe4nOKkU0GjOWMKRwStI2pfboWazwUmUScgYINLJIF6je3ziSqwZ?=
 =?us-ascii?Q?qOMlCJ9jtlIZKi9lAciJRATq/7g9J4i3+SlZp2idlLFhHr21+JpifgKhmT5y?=
 =?us-ascii?Q?cP6h1ZIxE4PfYHGXGKoseW2CiwSHwmYSg2NPwGfxEK3omgcp8tNxkc2F0VQr?=
 =?us-ascii?Q?WWODZjuftcbgEEeu/yfK13GnkxGqQ3YcvUeKNMO5nf/t3JDRQH1FIIxKxgpP?=
 =?us-ascii?Q?0KuWy5o38hwGAZ1LlJjT8tLfhBPKphyLDj6eWdYsgV/BShGpGzSTMG8hUCUV?=
 =?us-ascii?Q?I4xoIeswO+WNZpW6lpnGqIgP2GXhAampUEZYyzsLXfXOcyAuCqOFW6vFXf6G?=
 =?us-ascii?Q?4Ws+QlEmiOS/aTqIqHfH8fWlfMz6kK9Ysay0EWS4xjPKzPYqjCMsVvrqF3Lb?=
 =?us-ascii?Q?g3nKDC7jI0Y2KMjRdf3ahNCY3Jcfmac/IkVCWTJszYjookusEN2gwfcAIMZB?=
 =?us-ascii?Q?yggne9ChFUn734M5SJUeermNALReNM8a3yWrDhum9/3YlYA605aV1OHgyi+J?=
 =?us-ascii?Q?4rpnde6ILAQyAA5onrdmRc5IugT/ARMHTxzq0GqHuzdSi3dLBIO96JV/4If1?=
 =?us-ascii?Q?YQBeu+mktJEHbktQ4Qg+WeZSMEuQWF+7QIlXZ9jTQNtbDWrYUeZook3ZXdRx?=
 =?us-ascii?Q?HxFhSBJb2CnvMA1euD7mlKnJI1omTZw9K7/oIMXCJSU68V2xV/srZMYDMk8V?=
 =?us-ascii?Q?8EOidE2X7USoOBSrOmEqLPj3eZJ9zirZTbwSU8BQTp3v1eqcraB7+pl8uIGd?=
 =?us-ascii?Q?lYwLoTVoLjc4Y2SdNZ7JQ/5+FwhczXBbv20/6Vk3czPIqz+g8+tp+2Ba5UbM?=
 =?us-ascii?Q?jxlT6HLg9PcsRKtvB91HIgxilkqAaaskbmY1sip367POhDgOX4Kbza0wfy7L?=
 =?us-ascii?Q?qYGTBs4zijJH8YvgxSznsE2HLy0hsdpcGhTNN70xPGzerApohlSG8b1sQj9x?=
 =?us-ascii?Q?4JjD/UPc+F9B9VIosFE1FUEEXdWeCIz837tS+edIOHKsitJxGc634OxfQCVY?=
 =?us-ascii?Q?1FYGlnFG1hy6pfW4RxdRUNKvaKpieGAKRTeoFMo6/2R24tZJX0cTjntwoUvt?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cddb03-476d-4a10-b157-08ddc0031b7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:42:53.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mD2vxKYvc6GNsViypdJv8EOvg+yFGbWulki79BXDy1VSoRwqC73AyIpEcAOvlfBdVjsgjPAAzSA8JdIPXwhHk9UvaB0opzGgZTZoF/dLlKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
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

On Thu, Jul 10, 2025 at 03:36:55PM -0700, Matthew Brost wrote:
>On Thu, Jul 10, 2025 at 02:34:41PM -0700, Lucas De Marchi wrote:
>> The check would fail if the address is unaligned, but not when
>> accounting the offset. Instead of `buf | offset` it should have
>> been `buf + offset`. To make it more readable and also drop the
>> uintptr_t, just use the IS_ALIGNED() macro.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>
>Probably a fixes tag even though this data path is not used at the moment?

yes, not sure what happened here.. I think when I added the Cc I ended
up replacing the Fixes I had added. I will add it back later when
merging.

>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

thanks
Lucas De Marchi
