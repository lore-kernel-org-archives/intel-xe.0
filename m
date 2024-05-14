Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9111C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 14:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8854E10E9AE;
	Tue, 14 May 2024 14:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aq2XfgDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DD810E9AE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715697389; x=1747233389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SD7aDhRDkMnD9c9OZqKabgooW+L/ThitWeQVmVT1GdY=;
 b=aq2XfgDxkOav87ACB23vy1pPEMdBvXw1T0gSLUU+fbdJ/KknhEXONSgg
 aOqrk+FDXjrzv/PeWUN2jM3shtSnKLbSjGjSWrC0/LnR7xPvw9mCQ2it+
 pevwRAuoPQVJz0wtL0Cr+qYI0PuswGFQCa/L7D2JHgM+klWhEFDELAv+d
 1O74e7OcsNn9WVmasdF0ypFznba80p4Zgn/C3hA51JCrPRA+9rT2ZHGxY
 G0QVMjnkDrkCYsG+24xCHIl1jPSDKkPya44u/g0eED3vdENdhvDteLMZ4
 LMnZ43q6JGrICR09mRN7uaBrT+h+xYOn/er/w0OyYB1P5Rd1kUTQCdzA3 g==;
X-CSE-ConnectionGUID: qDUS9YiJRvuyrQGvePytcg==
X-CSE-MsgGUID: 3Qvpqg1mRf+o6/4n3kWI/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="34198201"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="34198201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 07:36:29 -0700
X-CSE-ConnectionGUID: CYytkAFtRoy0AYFHgj/b/g==
X-CSE-MsgGUID: 5NB6M2WiTRWuMuYllxUrcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35462757"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 07:36:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 07:36:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 07:36:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 07:36:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 07:36:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7glJoHsXc9ZAvnQnI/8pXphhn9N5MDVogJdW3YOnhPUwtG7djsewdV+YLDZQ0EjsERal8GtCkzf7EN/aKiyTjlPtkdB9BoEEuD/A+IasRsBGBdYnGyj65WeJz9IEpBsH1ZdpAqi3t3BFX/zmfezMQwx14Tz8hUN5+hgt+D7VdG7y/Y/T4JkmdAJjKo2yY7ik4qtUecwq1VwSmi0T7AnjshU1TTXeQB04G2nVIsHfCv9A7EPNFZh0q7wrYi0ZT5s+8RMrvWXpac20mEvlKSdn1OgDNWt++KaXTLIdoqdpH6o6jJsKQXBClDGt5d4ans8SG3sabAIlwggCUJVTithtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+Qse2lxXY1kYUySQeqesXDnbqz7OSEL1AnJCzE95YY=;
 b=eSfQX85OMkqV6hFVhxVBcQ5u11MqpcCeiR1iJW52EYZ1HWJTSkGA+jl96nqLIXr0MpTOLFeB1cCGiOY6nMPeMTAAFYuTTXecOHEHF+I1dhXrxalP8up9/fl3s1t0Usdjx5uxnTpqPolaDnRfeML6GNhcQ66gWjq8WGBtEzUXJeHufiguBNp4gi6iKjqH0k5ABZHT2c2N/rwBWkYvLbsDRNetdMsoZPn5BVy+MM/R6TJWMURNokiFRZ3mIQJqSPcNVORYdooWJz9yoQFvIk0NbJVhZKibrcZulyrZb3m5/yHhpG5OLailtbOUQ78+z+mtuSU+c2T7kxIBvXq/2A1GjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:36:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 14:36:14 +0000
Date: Tue, 14 May 2024 09:36:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <jrplqu255fn4u5xdc7e3xzddpfheoqmllgpcny4wfmfuk5wdr5@tgl4mre7eqq4>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
 <Zia_KMGV8RSqUL_Y@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zia_KMGV8RSqUL_Y@intel.com>
X-ClientProxiedBy: MW4PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:303:8d::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb2e706-ea57-484a-4f90-08dc742334fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+qSgdiJcJ+VHnW79GH5F+HbxX18bF7LWy9aCPd8vqtxfqwj6nQe4QZIXPv?=
 =?iso-8859-1?Q?soEgEb/VqqOYTEW6HSF6HlgMbgb+YVfPZDsl7DawMqltKLb1sZpAw+3p1d?=
 =?iso-8859-1?Q?zRokm/HtVROUjhE/Rmh68oN02zY3vlQkVJsAfMwBZZA5W6KzRDjuzUd0nM?=
 =?iso-8859-1?Q?8Dao8Ot9d7fdfDLqgeQPaQPSqa3TGzN4b/8qL7lSMUoTDbQ3g1i9nUbN+P?=
 =?iso-8859-1?Q?/Kp5ftNBaQl/BtxqbPy76H528EGY5Y4P2tV0cePzwtJ4ty653mH5NuDp0X?=
 =?iso-8859-1?Q?SEVDdBgJ619fvA73l+n7v/fVZzbd05RccgVyY8QjkJhTAJTisK5kVw5B+a?=
 =?iso-8859-1?Q?B0Pe/y0YuLKvpHeRuHtcwQX5I2O1EwGbz2LZZTOmaaDhEyW2UALZokg4nE?=
 =?iso-8859-1?Q?CCpXIHTeVH86SbM+k2LIxce1hQgqOTiK+NV8DtZArzw8qwNlOsrOC51bUn?=
 =?iso-8859-1?Q?9TGC47tnTtR4365r+SwTICVi6u/SWbR/Tn6+fnX+LBE5N5fdSpNrdlT9Mr?=
 =?iso-8859-1?Q?rmLvtZ1jYCvWrM59c0F0H9WF65a2FN9+cka8vr9+jBgHIRI2kERhcoj5pk?=
 =?iso-8859-1?Q?ZX9W5rd9u5bHhSkNV5KlZHcm7jpZCYI25r/fVWbW+x9mYd93UvNYdqWzMM?=
 =?iso-8859-1?Q?7qbahg8nhpF+yD4yqh3ttJMZryeshutBmzTt3eKwIkMGnAqj2xjY4yC6DW?=
 =?iso-8859-1?Q?VpjIn0YreIyPw+x8c6yalV/KjLf8HWzPVzgmrPQyDjGT6X00BlPjxsvTNV?=
 =?iso-8859-1?Q?VSp8NCiSiOCCK8QiwOEIrJuwpcdW3ttCL+xH9xVdcI2pTMaXQAHYDFmZiA?=
 =?iso-8859-1?Q?MdWRuoak3L2STqnGrM5EIjN1nWapOgNTUwPUXZH3y6kWrI6wPTkqnze5KX?=
 =?iso-8859-1?Q?4CREDjwHBdCCiR67adD/RiaDjxZNRx6HL4BWQan3iHhi9kHoHAsL4BeC3w?=
 =?iso-8859-1?Q?eWzBz/a911vAg5sFP+qDMtxxcrhoam+0vdtGXxrbiCLei4znL5IWwTMXXc?=
 =?iso-8859-1?Q?EeS2ZhDW+GUK1k5VvimcR2OOcgjwG8NQt4M2Etq14zqwIy/2JxVwl2i+Yb?=
 =?iso-8859-1?Q?nzBzFtc4ex8kaYC7ZrCpFvdxfJLklg9tEppDKtqhbw6l0nTcuJVnM4NOyA?=
 =?iso-8859-1?Q?s8dnXuVBDCDZwtch7ILl9BufqcrXaxaU5SPxJKP2w2hWb9sKL1jc9/+Cj7?=
 =?iso-8859-1?Q?apeWvrjCRikbzOvXtGssel3mLaKBMkm3uOnSaBXuSO4vaCavF7f2C6uz0p?=
 =?iso-8859-1?Q?DfsX2KYWZa8gPzLHHV6IPimmrZ0e3K+N8H8BEcFhHluf0VswslzzVQeAFu?=
 =?iso-8859-1?Q?YNL87kea2o1K3XuGUGdVcEMkJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P6Sgm79rmNggzmtcqkym6JfNslQ3QBvGbnRXV+xVTalIrt1UdhS6RXFX4w?=
 =?iso-8859-1?Q?rF3S6wMpQ/UseBWd8kQ1SM2Up2Kb4Xrs+cE1amO+leYALjdMdGbuuvVxBv?=
 =?iso-8859-1?Q?0mRKpjmClb/M800kSUN526SlcUxSRNzNu0Fe7oZtebyDgGXba5t8khuV4S?=
 =?iso-8859-1?Q?OXcRpZCxP8HO+x7T9uruBT5gmPeIQ6mvMh53Wtc03R06HY7THZ8mctzD3q?=
 =?iso-8859-1?Q?28XgkXNLAQL5A9zUGQLoHCM/af3gBmi5BUBv3jbbBiNHtv2L5YrfvGIKZ/?=
 =?iso-8859-1?Q?dqoUD4q3iF/+yU5nfIeFCj/s9XGPlocAei4B9rPv55iG9h4IpcSvHQaH0R?=
 =?iso-8859-1?Q?xxHN2rXiRxR8JQ/yvfH6EmMRVupgAV7SI5Bjtnwbs+ARKoatWvZv3rXs6j?=
 =?iso-8859-1?Q?iVg/bnW1nswpff84mOIApf9ldOWIn6CN5KdD+eFvuOGF6YbC0zKK4LgHss?=
 =?iso-8859-1?Q?cxOgy4EscWnmDltfEWDUa5csuWH9DlQ5SFkK9SO0emQ3ZJsESD8sfOXArP?=
 =?iso-8859-1?Q?cCBNZeKTDuhkV13kjQE9A9T2S+9RFjlqGxG3MktI6YfT5yvDxed2zr1Xsv?=
 =?iso-8859-1?Q?C43UnW75oi5sMqKEWSHdDGkZpUcC0dylYXvs6nNBpBoGtl4QssYOjBvtue?=
 =?iso-8859-1?Q?bavdDQIlqDAnZ3Qt17/ojyv3r3xhN8AiWDekJvVE2CM689QLgL6TDSlS+0?=
 =?iso-8859-1?Q?1jg+rSMLry/8YNTIHWJAtVa8QFiVbTmyT2jd0UoTResAJAOvZX40U3pV49?=
 =?iso-8859-1?Q?M+6oLItvivG4rCWfmbsWi6AVN3cRT7XNQjY30uAgA5PoL5E6tNwoh6Z7oQ?=
 =?iso-8859-1?Q?c2msmT+EhUZvVd7b9k+nxAQp8kkfVknItHO25N9jsY6majAgehbrLix2DU?=
 =?iso-8859-1?Q?gS0xgsTORwKIFD83BFGakXO03X6L1yIqJ+AK9Xpo67U3z62okyysYGgf4v?=
 =?iso-8859-1?Q?9TfbbLpVZbB7s1crj7vVJc5+mIVH8i2ulQLYuyIzbygfXgTcJV9HJ8jVXR?=
 =?iso-8859-1?Q?D1IAVQwAZ4bYDugWW4iKS0h3j2dRVqoAOVuaOvehi4dXQh9SEJr/9fAoqC?=
 =?iso-8859-1?Q?vvXN79Zjf+8pHNwHH4wo2CIFFoPSxGXfF5+oBQC0d8hI/23Taj8faAY+cv?=
 =?iso-8859-1?Q?qCRzfvGXT4hDRvC8Z/4gboD1TzuVNl3inHbclAmSIUt/Q+k2rm6Rgn3jVN?=
 =?iso-8859-1?Q?/WcNw1bpraQDLULXTrM9JXQ8qV7wL/vQ3tiBOZLir1CZQOXBI6jypWAGip?=
 =?iso-8859-1?Q?7319eADA+w5JXOLglDPNZCZ3s1yVhQBqwXsWXTNiiGkGOhSbEuOjYW1Jhq?=
 =?iso-8859-1?Q?uVs4qm9NMQSsjwGc9Bkx1uGbEzsvkSKCLUxhOdHWt9e0a+xO8eb+wdM7Dk?=
 =?iso-8859-1?Q?EccIFp90CqQtBNS2cG7/mnsS0FltF1fe64esrUqR6kasnOFzeUNPkl/wjK?=
 =?iso-8859-1?Q?rWA9m/o4/plm1llk5aS2l70wSGeF0yB+OJgLy8GE64WOQlCPPQ9QfHyjq9?=
 =?iso-8859-1?Q?YE1Wa1AfqojW29b21xfneRCqPQ1pZzxCZejR2nChDX46m0YMRxxneAA3lV?=
 =?iso-8859-1?Q?m8mZ1sYSsvCZzfsH0bb4OV6S572oNcKiTzfJZ3ZcN0wBKFyfRnudu4gRTa?=
 =?iso-8859-1?Q?LhhTpeHzcb9IeghOTb11yxqD/2VDymUf3kdjUeSRKvpSC43zKdM0Jkvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb2e706-ea57-484a-4f90-08dc742334fb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:36:14.3636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeGiKmO5zzyWofJfx76vUwHjWUSJB8KNsV9jyUPtsPstSOkiG0lWhod3SwadWNnbN6+qEe49jVorvKo4kQM/Iv0ftiWRiEQtmZs4fQhOw54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

On Mon, Apr 22, 2024 at 03:48:56PM GMT, Rodrigo Vivi wrote:
>On Mon, Apr 22, 2024 at 11:10:43AM -0700, Belgaumkar, Vinay wrote:
>>
>> On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>> > On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>> > > This WA requires us to limit media GT frequency requests to a certain
>> > > cap value during driver load as well as after driver unload. Freq limits
>> > > are restored after driver load completes, so perf will not be
>> > > affected during normal operations.
>> > >
>> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> > > ---
>> > > drivers/gpu/drm/xe/xe_device.c |  6 +++++
>> > > drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>> > > drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>> > > drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>> > > 4 files changed, 55 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > > b/drivers/gpu/drm/xe/xe_device.c
>> > > index d85a2ba0a057..e29c152a6c4e 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -30,6 +30,7 @@
>> > > #include "xe_gsc_proxy.h"
>> > > #include "xe_gt.h"
>> > > #include "xe_gt_mcr.h"
>> > > +#include "xe_guc_pc.h"
>> > > #include "xe_hwmon.h"
>> > > #include "xe_irq.h"
>> > > #include "xe_memirq.h"
>> > > @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>> > > {
>> > >     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a
>> > > 3s wait */
>> > >     struct xe_gt *gt = xe_root_mmio_gt(xe);
>> > > +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>> > >     int ret;
>> > >
>> > >     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>> > > @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>> > >         return;
>> > >     }
>> > >
>> > > +    /* Set requested freq to mert_freq_cap before FLR */
>> > > +    if (xe_guc_pc_needs_wa_22019338487(pc))
>> > > +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
>> > > pc->rpe_freq));
>> > > +
>> > >     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>> > >
>> > >     /*
>> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> > > index 60202b903687..556e73fca813 100644
>> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
>> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> > > @@ -19,6 +19,7 @@
>> > > #include "xe_gt.h"
>> > > #include "xe_gt_mcr.h"
>> > > #include "xe_gt_printk.h"
>> > > +#include "xe_guc_pc.h"
>> > > #include "xe_huc.h"
>> > > #include "xe_map.h"
>> > > #include "xe_mmio.h"
>> > > @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>> > >     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>> > >     struct xe_gt *gt = gsc_to_gt(gsc);
>> > >     struct xe_device *xe = gt_to_xe(gt);
>> > > +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>> > >     u32 actions;
>> > >     int ret;
>> > >
>> > > @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>> > >     if (actions & GSC_ACTION_SW_PROXY)
>> > >         xe_gsc_proxy_request_handler(gsc);
>> > >
>> > > +    /* Revert the min/max freq limits as we're done with GSC/driver
>> > > load */
>> > > +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>> > > +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>> > > +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>> > > +    }
>> > > +
>> > > out:
>> > >     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>> > >     xe_pm_runtime_put(xe);
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > index 521ae24f2314..7f82b6c2ad3c 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > @@ -40,6 +40,8 @@
>> > > #define GT_FREQUENCY_MULTIPLIER    50
>> > > #define GT_FREQUENCY_SCALER    3
>> > >
>> > > +#define LNL_MERT_FREQ_CAP    800
>> > > +
>> > > /**
>> > >  * DOC: GuC Power Conservation (PC)
>> > >  *
>> > > @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct
>> > > xe_guc_pc *pc, bool enable)
>> > >     xe_mmio_write32(gt, RP_CONTROL, state);
>> > > }
>> > >
>> > > -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> > > +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> > > {
>> > >     struct xe_gt *gt = pc_to_gt(pc);
>> > >     u32 rpnswreq;
>> > > @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct
>> > > xe_guc_pc *pc)
>> > >         tgl_init_fused_rp_values(pc);
>> > > }
>> > >
>> > > +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>> > > +{
>> > > +    struct xe_gt *gt = pc_to_gt(pc);
>> > > +    struct xe_device *xe = gt_to_xe(gt);
>> > > +
>> > > +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>> >
>> > that's what xe_wa_oob.rules is for. Why are you adding it as a separate
>> > function that won't allow debugfs/.../workarounds to match reality?
>>
>> The workarounds are not initialized at this point, this is early in the
>> driver load process.
>
>So we likely need to change that. or we will start to create a mess in terms
>of handling the w/as.


These patches are now merged:

         d1855d284e9f drm/xe: Move sw-only pcode initialization
         45b9066ec351 drm/xe: Move xe_force_wake_init_gt() inside gt initialization
         65c4de2a9148 drm/xe: Move xe_gt_init_early() where it belongs
         402c014cbcc7 drm/xe: Drop useless forcewake get/put
         61549a2ee594 drm/xe: Drop __engine_mask

it's still not pretty, but now at least this part of the initialization
order is not totally broken. With that we can check for the platform
needing this WA in the right way.

>
>But another comment on this w/a is that it is incomplete. It is just part
>of the w/a here. We need to count the GGTT page table updates and with
>a threshold update another mmio reg, or something like that.
>also drop the freq at module unload, and other stuff, no?!

did we resolve this?

Lucas De Marchi

>
>>
>> Vinay.
>>
>> >
>> > Lucas De Marchi
>> >
>> > > +        return true;
>> > > +
>> > > +    return false;
>> > > +}
>> > > +
>> > > +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>> > > +{
>> > > +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>> > > +        return LNL_MERT_FREQ_CAP;
>> > > +    else
>> > > +        return 0;
>> > > +}
>> > > +
>> > > /**
>> > >  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>> > >  * frequency to allow faster GuC load times
>> > > @@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>> > >
>> > >     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>> > >     pc_init_fused_rp_values(pc);
>> > > -    pc_set_cur_freq(pc, pc->rp0_freq);
>> > > +
>> > > +    if (xe_guc_pc_needs_wa_22019338487(pc))
>> > > +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
>> > > pc->rp0_freq));
>> > > +    else
>> > > +        pc_set_cur_freq(pc, pc->rp0_freq);
>> > > }
>> > >
>> > > static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> > > @@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct
>> > > xe_guc_pc *pc)
>> > >     if (pc_get_min_freq(pc) > pc->rp0_freq)
>> > >         ret = pc_set_min_freq(pc, pc->rp0_freq);
>> > >
>> > > +    if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
>> > > +        /*
>> > > +         * Setting min to RPn disables use of efficient freq
>> > > +         * which could otherwise interfere with this WA for media GT.
>> > > +         * We will also bind max to MERT_FREQ_CAP until driver loads.
>> > > +         */
>> > > +        ret = pc_set_min_freq(pc, pc->rpn_freq);
>> > > +        if (!ret)
>> > > +            ret = pc_set_max_freq(pc, min(pc->rp0_freq,
>> > > xe_guc_pc_mert_freq_cap(pc)));
>> > > +    }
>> > > +
>> > > out:
>> > >     return ret;
>> > > }
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>> > > b/drivers/gpu/drm/xe/xe_guc_pc.h
>> > > index d3680d89490e..25fe693c7ee3 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> > > @@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct
>> > > xe_guc_pc *pc);
>> > > u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> > > u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>> > > void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> > > +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>> > > +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
>> > > +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>> > > #endif /* _XE_GUC_PC_H_ */
>> > > --
>> > > 2.38.1
>> > >
