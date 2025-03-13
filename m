Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDF4C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 19:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7392210E91E;
	Thu, 13 Mar 2025 19:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOl9SeWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334710E91E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 19:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741895612; x=1773431612;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NZF2u7TdgFFeMpoJ+5fg1X4/OGppddpXG2bVvuVSoCs=;
 b=BOl9SeWlXLVd18qdh2lMSAJONZUOvESvUal9aD7rMC15msDI24CfZ4Vt
 A8enZ0oY7d7mV5PwISl2Q51c1KY28guizzPCg6wQSOLMZ6ouHBRjbS/sZ
 3FZQ/qatIcQDFz2FzYbzCli+RO0d+AsengoaG8C1VHjeIi8SDeZfU/mBG
 Fo0VaON5EW3IigY4TYr5u20X2CnCZXZnQ1nQq70n/VZKM96ChSY/j+Hiu
 eJsxRzNMMdqMq7fVHwu9zipi5DDDjtNxLf/IRwdpo/rnGev8Vv56tfvcH
 UaxDQrHPhqUTdbxm41E2IV6EWNgwxuUasadqJYelfOJ95hoWUhvgKkaFm w==;
X-CSE-ConnectionGUID: Cn1m6jsuQGurU/B4ZkCTzg==
X-CSE-MsgGUID: d33ROSzJSduYq2CfnBHEww==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42759396"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42759396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 12:53:29 -0700
X-CSE-ConnectionGUID: EtrrMjVGS7S5NmIxixOrBA==
X-CSE-MsgGUID: d/DEipt2T22Ldvgohdbe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121263634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 12:53:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 12:53:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 12:53:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 12:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzNYE2V0y8etIVc/ZRLrhIjwBX5PEN4bq17p8yF7a/LhCdPkw63vLBj1jSBrAQxSSyy6C1lNPCHKIEHtviayBRD59Sl45W/rbtGvT7RLC5wE+UmyoROFyoeBNxheTJ8Zc0GGhKCxLWanGsUeV/deRad+EOdMfI72lMcPe/rZoHPiYlnxN1m2wnwHhACw7dHf0Ss3adC0quOu1N4G4ujhFnqzwuSjir8H6cM1dvKnQDp613R7hz37ytVoOEQ4AuaxbOlx2pEsAeAfR2VKaB4plrKs0gYtB+6qDT47mAfLK9b+XJt/letx2HpAC6cn5GuLRJdb20XGHOY+HH5h9XxeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B44z55ZyzGSkrfVUbQnwaPQzp3SIc1yvHJZhZ/osCQ=;
 b=hAXrw55yZZcO/6GENKbrhou8wBFBJzzxHeMfi1FHrpQqomsWtl/wnf/EADOtp+R6h9bbD6190J3EjwoNdoj97tEJ0rT1aY6m0VKXDc1pENVY6pGO9IIaAVpdSydfj15/b6r6eXLKgQtCltucgvpBNkBmA3bZDNe+csZctUM0j0uhp5GeEMXfsZjT/AJT5a8M4Byv49iYEVHXbBDZg6wBdv0B5AJ9/Uinrx009WHIucaY3NBXCATXGA4nKHdUB8R/Zh2SvZl0CBgKIidTnNsTM15WJK/SgSy85X6Hn0AQp+JmYO/kCE/lGU64W9HeILgrpQMsfnSl9qu72IfRKdUArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 19:52:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 19:52:44 +0000
Date: Thu, 13 Mar 2025 14:52:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <ubetnx73lqskmhdruqg4z4jqurc6ixydul6k7qijzltsstk2fr@eh4lkbd5x3je>
X-Patchwork-Hint: comment
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <6d82e345-aef5-4629-b7e2-4b9281d919ea@linux.intel.com>
 <8e2ecdef-8709-4b9a-a79d-21da5429ee24@intel.com>
 <Z9LxNEDuyjBFhUuA@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9LxNEDuyjBFhUuA@intel.com>
X-ClientProxiedBy: MW4PR04CA0327.namprd04.prod.outlook.com
 (2603:10b6:303:82::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c92e6ad-f426-4cf6-0c79-08dd62689ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sE3fLbfeWBhhGEppeEk1bGtCfY3nI6Cong4TrAbqp6RWUlbIXKsJ8br4HA?=
 =?iso-8859-1?Q?A7bzxs2hD3u1t5Dsk9jdIgi5By9ZWm3AT3Agzutxp1yAsfOiK/K5PvIh9Z?=
 =?iso-8859-1?Q?044cp25XhfrFSN9ILEs1Mdk+t4/EWqyY0ZCW/KimwGZJaOd0mJX1ouvDil?=
 =?iso-8859-1?Q?evggadS4On5ZeJHT91SQl09SPWXRI/x46V2qpcAS02kFn2RUnzd4UqB3J1?=
 =?iso-8859-1?Q?90hn8yqz77AIUj2pATeWDdmlGB7oHKkAgxVvH+MqbBnpPQfdfP15899nRF?=
 =?iso-8859-1?Q?vp+qWt36YezG3meorUCgEeHTM6B9YetKq3KAoxqXavExH9j/rk5AGvwdFb?=
 =?iso-8859-1?Q?K+INCDLRJ2lnU8vhDCEaudm4a6XRjiM9UF8zOgaPQmtxBqKkJo19TQSYRt?=
 =?iso-8859-1?Q?XwQCuZB2FEXsGG+zOJlOAzQFgmKNs/N0L4+luKESkcgVGxkKb607Cbe8Wp?=
 =?iso-8859-1?Q?vd8fcXKjpodCcCKaluNFJHdJDIaxauaWfp1w3pjyDlF7qoMOgcyPDg5+Dl?=
 =?iso-8859-1?Q?9XL/D0XUE7Qz+pw456fN7C6FaD+NeD5e/NwKZtk+UqTMkacm1QUJ8FNtR6?=
 =?iso-8859-1?Q?5OO0zEOE7p+eFstIwmDX/cBTptuBpxdWCYcIzyzbQbHrPoatG7aXLUvGfu?=
 =?iso-8859-1?Q?77Nq+VMAG16nDcAnXuIC3pxQRPn5UKEA93aFMvgBGOjPICk0QR8cMHq7Y1?=
 =?iso-8859-1?Q?K1gq3pXdcpKxOPcabxCfKlMjYL17DHDaBaoOjsiR988+z9DYriknXS4T24?=
 =?iso-8859-1?Q?3+pidX3RjJAeSwKndxX2kr1i6zJNfIBsgGXQqHvFuUHwfyP9yJxyQm0bp4?=
 =?iso-8859-1?Q?89q6NA2juA2e3oRQuzcrNQmEWXTSvLEA56Hqpz1VA/UhqORarUx9IsOaNr?=
 =?iso-8859-1?Q?gNu48UvaZ7/xpCy+i8h1dF8KgelmRzVpRM+uz9SRyRgRDPCuQAZglLWtyF?=
 =?iso-8859-1?Q?z3Z9A7c1HiZtbd6rYiz7/ma1+8mN1W3kvPWuYk5xYVjZTmBqLUCWZzxezT?=
 =?iso-8859-1?Q?UpuXSlmbzYGWvhmrOtXSa/BnKorYBUoRCcoD3gj7gSi6VDfyUSFY5WaGd5?=
 =?iso-8859-1?Q?TGYj2veh7sXhw0nQ/kBF4z9Ap5hmQFOV4Qxl36Fa2XKr/ExcmEJ4WNDJgu?=
 =?iso-8859-1?Q?QFncxJLwxHoOhDL4ZCV/n3hkBP6XfyjkpdcoaERowJL67ucY0uaokJmZt9?=
 =?iso-8859-1?Q?0orcADEmCzjwEAhOKD0metTMOP358ikdktuVh4eHVwJWFWL0Aikx6KiLz2?=
 =?iso-8859-1?Q?huO4UiH30sNxS7L98xiamJS33/oVd3JaOoq22UpxvQ90zFUgozs7AHjxLb?=
 =?iso-8859-1?Q?g52R5YCzmoPS5X4DMJ7ZAEoJ4251OCeuR0SiC1z8qQYhEmJxhFvCz6+cY+?=
 =?iso-8859-1?Q?6O9FIUbfMmuRhH7VSULu8N/TANXEUekN2BImjTpoHJFhJ33O6MDA88ms8A?=
 =?iso-8859-1?Q?JH6plgjFm3A6D50l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wrshMaBNePWRxbOfazE9szFpIXhoPmK8O/kt+qojbzXyiNAfIXEXovJF+7?=
 =?iso-8859-1?Q?JXodn4Kb/8tROtZs3NZBxAgD6HHHVgxQoUBJ2XRu/hBtuJocDyErE6Hdlc?=
 =?iso-8859-1?Q?iVX/mZKe40LjTvfHKGMcPBYO92BGi5InibxSqnYDsL09uvZW6VchygRkth?=
 =?iso-8859-1?Q?BjrPhHym32RUi06iZkQjWnYmxcPVGFqbXcRq439PiP+cWJw4bryUt1C/Vt?=
 =?iso-8859-1?Q?sidChu9C7v+pUFFHM9gpfSPEWKGjjdJTSg7Al4+DRqIMIVIu+NgY8iJtJT?=
 =?iso-8859-1?Q?+cMn/s6xzQY4QULKMge2oW94QtMMnuEQvRRACSmoZ28xN5pgmKUnq9HfnK?=
 =?iso-8859-1?Q?7K/tz9peb86SqWxz1AuIVUpZ+beOMXv+yJYpvxvmt8S77ak3EFDEFhqqPc?=
 =?iso-8859-1?Q?J8AH14TdtbOsp9yWo7V3AIxoK+k1mu7VyCaSuBxm4ItAbTnw1a5keoFH4s?=
 =?iso-8859-1?Q?1tJ9GIIpBESN029OMDk71HwdWD6UskYrUYLyGDKDqF03DLlQ+elGScngfH?=
 =?iso-8859-1?Q?6jp3S4MKeJqzEVtFjRLXczxZ6F00BH9PusgApW0BfUaZ9xBpa7dcIDqqgK?=
 =?iso-8859-1?Q?f6g+ls7OVS16OaRliIvEF9BHSQRbbxiKxOagxAbHxMZClx4gPuOoV2AMAJ?=
 =?iso-8859-1?Q?RjwvgLJWzQfQKCFWLgfWEF2qW2EBgIVKhkWNatB4dixSsMCrs2dWPcGEff?=
 =?iso-8859-1?Q?6l3bRR/avg2cF3oMs5ncGOJp1jt79LVtl49ndQq6IB3Y87ViETYeBbACmG?=
 =?iso-8859-1?Q?L0Ra63I+5keUlz1N8XVoESP23+y74mowbfVFYpYwkob2cGv9g3F/RWcpX8?=
 =?iso-8859-1?Q?hYX+JpVy7htn5pN02BkPCt64QuACDG700aynlnJP+l4Bc3JCyAygjRs5zV?=
 =?iso-8859-1?Q?X/QW67dfJr4IySQCwi5ERIvGeX5GGRkkhSvTQaf4kOi2yal9MTPFs9rmHV?=
 =?iso-8859-1?Q?JSNIoEYMYAJkdpO+b95OfiEZz1wq+oJJymfl5kAjkEg/tRpQqH2bYEOvj9?=
 =?iso-8859-1?Q?5AfpjelQ657veliJuSfXRDeYLrevTZxMBJVEizax3altWU2v7DHqt+55VT?=
 =?iso-8859-1?Q?SnQXS95a6//bcvARiJ7hyt/t0F4zZ4ynABE8T8sdRMb9A1SXyekD5sDpeJ?=
 =?iso-8859-1?Q?uKLGSVW8N7mKz4E09mTYoIo61HaXInBoFzTHPUZ09pA5KwgICwtoj846+A?=
 =?iso-8859-1?Q?tNGoz98SjutG4ypRA55zn4zG7xFBVODSlOWYQxdn7FLtG33sCqXyuLquZt?=
 =?iso-8859-1?Q?tQc/LRwMfCY/78spRwenWdmUn45IhMGy8vH/Uploy0Bsb3tOYci0r0SOwd?=
 =?iso-8859-1?Q?gVBFvD/BLctOIqoMiZVhfBtygBXFiw9Y7nYDZmdcurLkuhZefJkkIN5+SQ?=
 =?iso-8859-1?Q?Zk/nX7ALV+yGifFYKJYKhg75Fvd1FoZ04FtSVUVmChtTUaOimeNOtiikTs?=
 =?iso-8859-1?Q?GJqhmobYWkqIYLsc6p2Y/tBjQkYvusoYmCQyQi5N6Y5DnE1mme+a5SqDK1?=
 =?iso-8859-1?Q?wL6VdesuZkLW79kLGQNWe8Qnb1mzZ3GBVMrpXyc7QpvDhx3sDI3zAUDi3S?=
 =?iso-8859-1?Q?LxBBkUuoG3eeDffLgdzuAUrNMIDyZeweamzC0o9wUm2F+gLg4oX/AYsxOD?=
 =?iso-8859-1?Q?T3MgtW9MEyPHc8C1VapoTpiVL/acV1DsVoy+z5/sjTcMrc8yi1gsVWfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c92e6ad-f426-4cf6-0c79-08dd62689ef7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 19:52:44.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zul/tVxLIBg8PYxSUd4cFMHKKvtriIKkXPgznDCPkCp5D5wlce6JBs4gIQIwKwAAmEo6pkFjt4g0mGO6SQRQsBp7xRHq3+UqteTDUEOUPck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

On Thu, Mar 13, 2025 at 10:52:36AM -0400, Rodrigo Vivi wrote:
>On Thu, Mar 13, 2025 at 11:48:41AM +0530, Riana Tauro wrote:
>> Hi Aravind
>>
>> On 3/10/2025 12:44 PM, Aravind Iddamsetty wrote:
>> >
>> > On 07-03-2025 19:54, Riana Tauro wrote:
>> >
>> > Hi Riana,
>> >
>> > I do think we can achieve the same functionality with module param and
>> > we needn't reload the driver
>> > if we are doing unbind, Since the driver will be loaded event after
>> > unbind we can modify the module param
>>
>> tried this.  We can modify the module param using sysfs and bind similar to
>> configfs.
>>
>> If we want to configure any other attributes or move existing module params
>> to device specific then adding configfs seems better.
>>
>> @Rodrigo thoughts?
>
>Yeap, if we make the param write-able and document that it is only checked
>at probe we could indeed use the flow
>
>echo <bdf> > /sys/../xe/unbind
>echo <bdf> > /sys/../xe/param/survivability_mode
>echo <bdf> > /sys/../xe/bind
>
>and accomplish the same.
>
>on the good side:
>
>So, this is the future prof case. Because if we start seeing cases where
>the device fails at boot without the FW request for the survivability mode
>we might be forced to have a parameter anyway. :/

With parameters we have these possibilities:

1) driver is already loaded:

	echo <bdf> > /sys/../xe/unbind
	echo <bdf> > /sys/module/xe/parameters/survivability_mode
	echo <bdf> > /sys/../xe/bind

2) driver is not loaded

	# put all device in survivability mode
	modprobe xe survivability_mode=

3) driver not loaded, and only one device in this mode

	echo 0 > /sys/bus/pci/drivers_autoprobe
	modprobe xe
	echo <bdf> > /sys/module/xe/parameters/survivability_mode
	echo <bdf> > /sys/../xe/bind

With configfs we have these possibilities:

a) driver is already loaded:

	echo <bdf> > /sys/../xe/unbind
	mkdir /sys/kernel/config/xe/0000:03:00.0
	echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
	echo <bdf> > /sys/../xe/bind

b) driver is not loaded

	# no equivalent option for "all devices in survivability mode"
	# other than repeating (c) for each since the option is per
	# device not per module

c) driver not loaded, and only one device in this mode

	echo 0 > /sys/bus/pci/drivers_autoprobe
	modprobe xe
	mkdir /sys/kernel/config/xe/0000:03:00.0
	echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
	echo <bdf> > /sys/../xe/bind

>
>on the bad side:
>
>But we were actually aiming to reduce the parameters that we have
>because that was getting indiscriminately used and even recommended by some
>distros' doc and wikis.
>
>Another problem with the write-able param is that people might expect to
>
>echo <bdf> > /sys/../xe/param/survivability_mode
>
>and immediately get the device in the survivability_mode for that device.
>Then we are going to get questions and bug reports that this is not working.
>
>But well, perhaps documenting the flow properly in the param description
>might solve this concern.
>
>Lucas, Thomas, thoughts?

Let me add here that we will have to extend configuration to more
things. The one I will work once this configfs lands (or even before it)
is to allow developers to add WAs (or we could say
register-save-restore) dynamically so it's much easier to
try/error/recover. For that my plan is something like this:

	echo 0 > /sys/bus/pci/drivers_autoprobe
	modprobe xe
	mkdir /sys/kernel/config/xe/0000:03:00.0
	cat gt-wa.txt > /sys/kernel/config/xe/0000:03:00.0/gt_wa
	cat engine-wa.txt > /sys/kernel/config/xe/0000:03:00.0/engine_wa
	echo <bdf> > /sys/../xe/bind

And cleanup my kmod "frontend" protoype to make it simpler[1]:

i) no additional configuration:

	kmod bind --device 0000:03:00.0 xe

ii) with configuration stored somewhere:

	kmod bind --device 0000:03:00.0 \
		--config <path-to-config-dir|path-to-config-tarball> \
		xe

iii) with configuration in the command line:

	kmod bind --device 0000:03:00.0 \
		--config-kv survivability_mode:1 \
		xe

So, I think the configfs approach is more future proof. For a simple
switch/panic-button like survivability_mode I wouldn't oppose to have it
as a module parameter though. Maybe make the module param read-only
and if per-device support is desired, then handle only via configfs?

Lucas De Marchi

[1] Typing here without much thought on the actual interface - my
     prototype hardcodes it for pci, but the kmod command would
     probably have to consider other buses too.

>
>>
>> Thanks
>> Riana
>> > and once we bind the device back it can check if the BDF belongs to this
>> > driver instance and configure the mode accordingly.
>> >
>> > Thanks,
>> > Aravind.
>> > > Registers a configfs subsystem called 'xe' to userspace. The user can
>> > > use this to modify exposed attributes.
>> > >
>> > > Add survivability mode attribute (config/xe/survivability_mode) to the
>> > > subsystem to allow the user to specify the card that should enter
>> > > survivability mode.
>> > >
>> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> > > ---
>> > >   drivers/gpu/drm/xe/Makefile      |  1 +
>> > >   drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>> > >   drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>> > >   drivers/gpu/drm/xe/xe_module.c   |  5 ++
>> > >   drivers/gpu/drm/xe/xe_module.h   |  1 +
>> > >   5 files changed, 114 insertions(+)
>> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > > index 9699b08585f7..3f8c87292cee 100644
>> > > --- a/drivers/gpu/drm/xe/Makefile
>> > > +++ b/drivers/gpu/drm/xe/Makefile
>> > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>> > >   xe-y += xe_bb.o \
>> > >   	xe_bo.o \
>> > >   	xe_bo_evict.o \
>> > > +	xe_configfs.o \
>> > >   	xe_devcoredump.o \
>> > >   	xe_device.o \
>> > >   	xe_device_sysfs.o \
>> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> > > new file mode 100644
>> > > index 000000000000..8c5f248e466d
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > > @@ -0,0 +1,95 @@
>> > > +// SPDX-License-Identifier: MIT
>> > > +/*
>> > > + * Copyright © 2025 Intel Corporation
>> > > + */
>> > > +
>> > > +#include <linux/configfs.h>
>> > > +#include <linux/init.h>
>> > > +#include <linux/module.h>
>> > > +
>> > > +#include "xe_configfs.h"
>> > > +#include "xe_module.h"
>> > > +
>> > > +/**
>> > > + * DOC: Xe Configfs
>> > > + *
>> > > + * XE KMD registers a configfs subsystem called 'xe'to userspace that allows users to modify
>> > > + * the exposed attributes.
>> > > + *
>> > > + * Attributes:
>> > > + *
>> > > + * config/xe/survivability_mode : Write only attribute that allows user to specify the PCI address
>> > > + *				  of the card that has to enter survivability mode
>> > > + */
>> > > +
>> > > +void xe_configfs_clear_survivability_mode(void)
>> > > +{
>> > > +	kfree(xe_modparam.survivability_mode);
>> > > +	xe_modparam.survivability_mode = NULL;
>> > > +}
>> > > +
>> > > +static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>> > > +{
>> > > +	char *survivability_mode;
>> > > +	int ret;
>> > > +	unsigned int domain, bus, slot, function;
>> > > +
>> > > +	ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>> > > +	if (ret != 4)
>> > > +		return -EINVAL;
>> > > +
>> > > +	survivability_mode = kstrdup(page, GFP_KERNEL);
>> > > +	if (!survivability_mode)
>> > > +		return -ENOMEM;
>> > > +
>> > > +	xe_configfs_clear_survivability_mode();
>> > > +	xe_modparam.survivability_mode = survivability_mode;
>> > > +
>> > > +	return len;
>> > > +}
>> > > +
>> > > +CONFIGFS_ATTR_WO(, survivability_mode);
>> > > +
>> > > +static struct configfs_attribute *xe_configfs_attrs[] = {
>> > > +	&attr_survivability_mode,
>> > > +	NULL,
>> > > +};
>> > > +
>> > > +static const struct config_item_type xe_config_type = {
>> > > +	.ct_attrs	= xe_configfs_attrs,
>> > > +	.ct_owner	= THIS_MODULE,
>> > > +};
>> > > +
>> > > +static struct configfs_subsystem xe_config_subsys = {
>> > > +	.su_group = {
>> > > +		.cg_item = {
>> > > +			.ci_namebuf = "xe",
>> > > +			.ci_type = &xe_config_type,
>> > > +		},
>> > > +	},
>> > > +};
>> > > +
>> > > +int __init xe_configfs_init(void)
>> > > +{
>> > > +	int ret;
>> > > +
>> > > +	config_group_init(&xe_config_subsys.su_group);
>> > > +	mutex_init(&xe_config_subsys.su_mutex);
>> > > +	ret = configfs_register_subsystem(&xe_config_subsys);
>> > > +	if (ret) {
>> > > +		pr_err("Error %d while registering subsystem %s\n",
>> > > +		       ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>> > > +		mutex_destroy(&xe_config_subsys.su_mutex);
>> > > +		return ret;
>> > > +	}
>> > > +
>> > > +	return 0;
>> > > +}
>> > > +
>> > > +void __exit xe_configfs_exit(void)
>> > > +{
>> > > +	xe_configfs_clear_survivability_mode();
>> > > +	configfs_unregister_subsystem(&xe_config_subsys);
>> > > +	mutex_destroy(&xe_config_subsys.su_mutex);
>> > > +}
>> > > +
>> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> > > new file mode 100644
>> > > index 000000000000..491629a2ca53
>> > > --- /dev/null
>> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> > > @@ -0,0 +1,12 @@
>> > > +/* SPDX-License-Identifier: MIT */
>> > > +/*
>> > > + * Copyright © 2025 Intel Corporation
>> > > + */
>> > > +#ifndef _XE_CONFIGFS_H_
>> > > +#define _XE_CONFIGFS_H_
>> > > +
>> > > +int xe_configfs_init(void);
>> > > +void xe_configfs_exit(void);
>> > > +void xe_configfs_clear_survivability_mode(void);
>> > > +
>> > > +#endif
>> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > > index 475acdba2b55..15b3cf22193c 100644
>> > > --- a/drivers/gpu/drm/xe/xe_module.c
>> > > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > > @@ -11,6 +11,7 @@
>> > >   #include <drm/drm_module.h>
>> > >   #include "xe_drv.h"
>> > > +#include "xe_configfs.h"
>> > >   #include "xe_hw_fence.h"
>> > >   #include "xe_pci.h"
>> > >   #include "xe_pm.h"
>> > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>> > >   	{
>> > >   		.init = xe_check_nomodeset,
>> > >   	},
>> > > +	{
>> > > +		.init = xe_configfs_init,
>> > > +		.exit = xe_configfs_exit,
>> > > +	},
>> > >   	{
>> > >   		.init = xe_hw_fence_module_init,
>> > >   		.exit = xe_hw_fence_module_exit,
>> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> > > index 84339e509c80..c238dbee6bc7 100644
>> > > --- a/drivers/gpu/drm/xe/xe_module.h
>> > > +++ b/drivers/gpu/drm/xe/xe_module.h
>> > > @@ -24,6 +24,7 @@ struct xe_modparam {
>> > >   #endif
>> > >   	int wedged_mode;
>> > >   	u32 svm_notifier_size;
>> > > +	char *survivability_mode;
>> > >   };
>> > >   extern struct xe_modparam xe_modparam;
>>
