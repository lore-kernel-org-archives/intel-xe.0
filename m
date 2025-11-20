Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CD0CFA441
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 19:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDA810E7C9;
	Thu, 20 Nov 2025 19:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nE4oPXlI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526A310E7C9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763665994; x=1795201994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gw+Ux2kFUGcNxRP6gXdXvC1xHXyIhnRornSJ73LErOo=;
 b=nE4oPXlItv4dzm4rlCFnLKHhPryUiUYYi8jfkB4hN+7Cr8MT63QKY2Bw
 DhoBcvwizzz27IGKqDanYxBu7CMqifYR7p0rB8+xBlydubY6Pv2q9eSw6
 tgt3emar0RnT+0A1OaYRhJ4cSFSRppr+EbCm0KgTKDRVaPPaJJ0MQu05P
 M/emaJjhDK7fhHU/1JhPwWvko0eZF20vL+yOYQTmKh672+P8pvnPZZ+4m
 9MDRcGSyV5x5o/OTLwGnq24LeDaf4HVMTT0IZwSw6+xlN9Eya6vkrQCHV
 wc7kXkKveNOWaHvEvgNYJIxwX7MM9lta8exIbdlabw08C7AqJZZfO3Qqq Q==;
X-CSE-ConnectionGUID: QZvs25U9SXySSodKUGkyzQ==
X-CSE-MsgGUID: iZL2NQjmQHaxQipFt7O8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77112501"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="77112501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:13:14 -0800
X-CSE-ConnectionGUID: pID4KQ2pTsycx95GHSuBOw==
X-CSE-MsgGUID: KEbj5z8AR3GF2p174PsybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195935575"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:13:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 11:13:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 11:13:13 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 11:13:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5jysjYTFkoZJ4XCH4309jMH9KbHgftAExRhpRRurTzk9T5+1GXwe3PfZi/vOvrK+RQ3AplXYUEFTJSnNnS2cE9Oyevmp55OVM6Myvb6IiRsW4W0+6N1Uo476oaRq8wlXFLJDoyWF+SG2Pa9B5Xs0suTyneIb3dQWvEJ1IPDtODrDVNvNrauCugk0hwvU3yOcsh6zjr+4PnrQyKq7G5wH9JrHMv6uaF6eNamaozD1WjjdNbdJAFM4yomGhW2eLBwnbq78YFiZPoyjfxRTXGxR2ioEnb2n0EcoPqhI2QUxJamqLN+7ujEiuna3ZGjvkfCdaLOgZJHp2rTDV7VZtWvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw+Ux2kFUGcNxRP6gXdXvC1xHXyIhnRornSJ73LErOo=;
 b=KdLK1WOiVujsntHKZa3xRN3EZfKEpa51LeOypumVpDv6B5yPgFedZB59h8FpOKOETo68E2sl2i3b62QnBv2HhqgWFa0j7Lc1yE5a4tKe6hl5GAXx/cxVQ6iMpYu9SEiXhidwV5zXBV/ScZXEgNQ3F/N7fDIbU5v95iNuaDb/Do+xfg6XxZyVCUW1KQu26Dhuj/pMxckRgffEhtxLMKVGjfzTvCVnhoISgO4fPyfdSkhxFPI8CPGbkv8J9xKc0WiRB4r60I4xXy3/rrZVT03BScfjjQOR3SoYyt8OtvVXch1IulkKp9J/eWv/p5833CMEYGWbm4+xAIGedL7jS9OxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 19:13:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 19:13:09 +0000
Date: Thu, 20 Nov 2025 13:13:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Track pre-production workaround support
Message-ID: <qafncwksng7b6znox3te27id7ilw5dfp5fvnvfoeqv5cuqdsmq@4bjgppdebcvg>
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
 <3zguwnf7qbdsiy6n7vvndbbvtidvmp3q2nzxdz6xi5bkifgtgv@rzmfr7eo3a4n>
 <20251120183559.GC3905809@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251120183559.GC3905809@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:74::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1026ef-0bad-4524-e959-08de2868d7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+VFPNlIaTEOhGdULqNMhUzkreedoDsJruwzt40iFcY+1ElVhW9MocrJkNBDG?=
 =?us-ascii?Q?ze3RRExjOX9f6LkuFxRTgb7sT/iJbtmdbEv828kJAmkuQ/RxDB1ir3vj3DmN?=
 =?us-ascii?Q?KCvRCerQRiAlZzqCUskQnUla8ESLLTKMHK3yOKQv7tudG2F4eiBnoEPFDECH?=
 =?us-ascii?Q?+V2Xx+XBN2IUiR9rf5JuZejM6TVva4LVvgqviyy7Yv0spAVZAWr61xEwofsW?=
 =?us-ascii?Q?3Yzeay7R6372eAUqW0OkaVGnd86lQaWKghCEYhqScEnIK6j9477VIpQuHQ95?=
 =?us-ascii?Q?3qaIc4foq29sTLiED3MiWbMtH4ix4U7F7akEDVri1FLjy264yKJqN7Wewjva?=
 =?us-ascii?Q?gTCky9yRFHdUE/hCae7cpBC9exaq7hG0mgfVIm2PluPjyVzh7JapARjhkSPH?=
 =?us-ascii?Q?7N4PsOGOt9JdnvpJEfL7MrdpSPMuGtgYslN1qx+TPttFROMDXKM/Q1zJDE5n?=
 =?us-ascii?Q?eO3CeUkT9KqgtTZHEgfZh9eWouyXrbGaS+8W2EbVuYMW9dVgdOVQNJkIl6wV?=
 =?us-ascii?Q?3PuvdXAbSLM1JUYESJoqygLawdc2WiY7h7dAaAo/mwuyrCRJZooBAe+hybcL?=
 =?us-ascii?Q?egmrQQhl+hCnaozUJ5v5rsK2A+g7PwNK4KGQJblM9ttWqRjr08UdKsGbVYmR?=
 =?us-ascii?Q?lURTlTnqWX4j1OBFSMn9bMX7irwfqdHCU2+iw8fmxdU8wVChxsokT+QL6aux?=
 =?us-ascii?Q?A7fODGA/U5q5Wf5mSOmqLYynJOLZc/ExTGBXf6J89O5TuMBFM8XT2FXdnhiy?=
 =?us-ascii?Q?6wBwivALmDpuMIsDx8ydokUB6DnCg34piJqgMD0AUsD+0lFVzIaLQCFdCAks?=
 =?us-ascii?Q?DKm8Nkdsf7OXIoQzdW1vibWHlUgVp18K3ylh53y2j0OBI43E0F0rAIkr/vHL?=
 =?us-ascii?Q?VNC/GRaK1iVmWlWwI6YdFCVlrjlbs5Fk59KKjpu+blGFnyPtFzr4FN5GnvM+?=
 =?us-ascii?Q?IbWXkdf7kO6kG9Pu7cgMtxfcw4cEfZsXAMJeLyqd6/eRr/nkPmQD44zS3a3C?=
 =?us-ascii?Q?/Fc6hiEeFbnFouEwhtgr0sXnidHgJiblxNx4QxyXtD7E7ApADzg5fcz+uh0d?=
 =?us-ascii?Q?cr8i02OXAmzkzlSduTHifboKMShRrQh4uzAY5hRk9sv8kz2S2pP0qR3xt/p+?=
 =?us-ascii?Q?x8oyhL33Vor92Unuy6YtgtKlcP71FZdvPxPH2ys4Z4tc/iOrL+Xm8J9tKFiI?=
 =?us-ascii?Q?Jabu6Z3uryJYPiax29bQWOj8ipj/5q1n38C2NxImigfviqHSA8i2Rt8YYbOk?=
 =?us-ascii?Q?NN/PomgBxo1USPR9N7JRCHzKdnvR5adwLcHxJk1RKneAe48PVTwa7zlov9es?=
 =?us-ascii?Q?E0+vqXOiYloH4tYtMy3j03XarzTqQJ0nToef98WDYns7a+9AnuT/kf4+W2wO?=
 =?us-ascii?Q?58kF+Hx2TGZEVVBzPobsRCn+SmUVdnytR6I+ov25+PWVUN2CglYsHEiVQloX?=
 =?us-ascii?Q?c+kow0tK/CIlBtq5FY0Djd+1yQ3xfC/z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILiooObeFqkTgdMvgeFVa9frjAHmMULrj3iUzzo/QsGpxI1rojMWE8shSn6f?=
 =?us-ascii?Q?t+5LcRQQn9Jn2ezRDlHFpOFx3hie7dXYUdpREUpAPqR8yli/Dg6UtHs/Ar2b?=
 =?us-ascii?Q?jR2Qx7gdN8k6geYBQQbL6nNE5jY6gLtTEN+jdv8bMjIod7GQjUIVYsNh48EI?=
 =?us-ascii?Q?EDdQdSHy2Z4UX05tmTGRY824cMal2M7oF8w9UQbexe5AwzGDMMrxt1EUQW7f?=
 =?us-ascii?Q?e5WnwEnIta9eW/FEf157z8S27i4ONE9balwUTcWB4N9Al43LrNGf7tqU/lQZ?=
 =?us-ascii?Q?JgEK1vNMrpUyOmcBsDdZCMlAQYJH5I1ZmuxhUIr3KL5pw36PxOS3MZ0sqZTi?=
 =?us-ascii?Q?3jWjxQOmjUiIvCetBgz4fJTuy0i30BFJOC79n68cQjmt5E0vm2+zQZCGMrQU?=
 =?us-ascii?Q?pSwGLDaRbgzK1tSJ27lQdwqWJFaHyZzou5fNUNHjau1nFcKU/YDII9ULaAm6?=
 =?us-ascii?Q?CMux2E2Oc6z7PtnKMHpwTudaahKwlBtIu9q7fMPylibBH00zM/8qgIpwqFlL?=
 =?us-ascii?Q?So7xAmFC5cdRV7sR2Ng2p40jAmlN/kyIpEmdkb4zbV7j9LVQX2O52r3dH863?=
 =?us-ascii?Q?OodGnl3RQEQslihKROPpuAkprv9AiZjPz5MwEaU5LOPmOfKH3vDjUoZwgjgk?=
 =?us-ascii?Q?pf6GV/RHD2oRAt4pxiIJCeQ5Ibqwg/X1kD4hm/RdduUCQ+t213CIW9EcrPml?=
 =?us-ascii?Q?BsUlIknHeOTqXRBjiN6lh18FX1/t+/fjziqlgKnugIE3lJUX1JNaXJ+SRi1i?=
 =?us-ascii?Q?wTdZ1FB3j2i1WNV/EFKNVYxX7yhCrqtfVKC7OKkIuDh3QAIIV4Z0cpk51uX3?=
 =?us-ascii?Q?CJlxPLSsTQkLsrruWX0YgKs8f4iCT1No+Pr7zdEuU3JSvNtA8NMATRHmqpKE?=
 =?us-ascii?Q?CvD4qDJVGkJbkDzaMdkMCkWyeoo0EpKf3eLs5IHtpIyGkSK/9oXV57bP0Dam?=
 =?us-ascii?Q?R6fggMUmA4hrtaisgSi8bCbTHixzub6XJWZFuapwAMjaWBFlgSS0bJzjNhq6?=
 =?us-ascii?Q?2Jen5lXQDtrv7QC1qux1JICtQaCneNyF9hmCK53pybooGRjI2bcSHyMfuG8O?=
 =?us-ascii?Q?IDca+rLVXJ2xYnh6RbiWkGgXyocclaqkVm1ffBoB86ab2hCUiziJV8OrAdDO?=
 =?us-ascii?Q?4e9Nt9zYqxZpv3FV/79Jm48rGoBWiRuLmyMSsfTEPpUgERaKsMrtDwOwlSFZ?=
 =?us-ascii?Q?6HkZUYED5tc+qDv44HCCfup0jdV7w3AEoCEERA8zTSL91QGPeipyriewztmP?=
 =?us-ascii?Q?Ez13Jvqfr5G9dAYWbAvkcatuO7oHMqS3ie0IvgpzbUpS6lVGU6zndLGFVhC/?=
 =?us-ascii?Q?1+TfZN1eD6u2eoxsJQtBNoTdADWyIz8tDiJVcjbBtrxo9xsZxSLtBs8c8pCm?=
 =?us-ascii?Q?bidHUc+UoRWW+N4eB0/lg7pNZOOXiXiKcP+cYvkWTYwFmwM1uWv9BMfbWtr0?=
 =?us-ascii?Q?Y2cyPdp5lvoEJ3O3kzBlgOTTfJafTA3uAW9DRokDmpJyJCcVYHCohTkKk1LP?=
 =?us-ascii?Q?mqXIMIQs1bhxwdmJy4e9mIZRR0mS1ToyvdO2x0wewdbK53MMJ9C4Zs78wKEP?=
 =?us-ascii?Q?qCcfc6fHRtuMhBtk/TA+AcD8lkQXOekCldBg3oxEUS6A78NRFffID3zDhPQO?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1026ef-0bad-4524-e959-08de2868d7bd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 19:13:09.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MnvHUZlk/C2Qu8FUqwjKgo1eeEcPdyaDhL8rQSwBVIK7MKOwg3j3yikZbft2qvs24Xw1jOb9XxL9K0xw3SEv3xPzIgLjL/dKS2BqnBmM3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
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

On Thu, Nov 20, 2025 at 10:35:59AM -0800, Matt Roper wrote:
>> This patch itself lgtm and if we decided to extend, it can be done on
>> top.
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Jani suggested that I invert the device flag to indicate that a platform
>*does* still has pre-prod workarounds, and then we drop the flag later.
>What are your thoughts on that suggestion?

I think it's good so it matches the require_force_probe semantics.

Lucas De Marchi
