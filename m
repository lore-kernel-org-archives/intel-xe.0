Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F4EC021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 17:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EC710E564;
	Mon, 17 Feb 2025 17:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOm5WSAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A6B10E564
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739813320; x=1771349320;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sgskB5HtfpUg0asIhsF+gJA4VKdvcJho/jwBT4Ky+X4=;
 b=MOm5WSAWwBYqxiVXxHzq/yueTICUwh8b7rRzIyEmdMcdAlXl0CccmzIK
 i4uTsfLzoa8TNSyn228aWzSMoJUE+fPf0CS0yCz1GqeeM6w5VZaaPwKGQ
 7g6sNtYIAFJUWAwE1o7HHT8KgeOdmQtXJc83VKAh8ILNmgxwMacWA0Dcc
 RzGvWkdw12GZUK/VIzFcZkrAWJNUyC4hlVgwzHv6wVVgfpZUnzhtfMlyF
 sxWVMLc9sffzzJNUmcNFQmHr+OyADRd565UOwpX7bI+jn4cqwb6hlNZLE
 LMVUXOgd+5mrAvkiLkqZFM5OFa+R/JAVGG5pPWJBFH7zmGdY5ALPpUxdS A==;
X-CSE-ConnectionGUID: irwZW6IAS0+3sWsrOIZMvQ==
X-CSE-MsgGUID: 5l9K3iMuSSe8yyAmaWd0rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40626709"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="40626709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:28:39 -0800
X-CSE-ConnectionGUID: MsYpmk5vTTi5A+dmKu1RIg==
X-CSE-MsgGUID: ZbpGclRNQqayDSe2643a/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119170970"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:28:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 09:28:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 09:28:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 09:28:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agxwhzUr+qXVswDbHIhJsha9e+8tkLusysI/cVkwTAh5WOcLec8smbv99dx3NiO5OyYluhBNSkbERU0igL0oDa6nmuA3Cr5FCnvfQFERv/5HiJZ/4Q2kikneUPGg6VOVIH3geeQu8YK4mlM1Z9YXO9OwAbG3BoONKV/vgfxY8FFniKIphhbSSrdWpocUNTf3Qfbojkj9AEIDB60gTuXQNhbAB/3vzNkSBou0qr0eKRD3TsNEIhWvfmJIiZT/qYK7S7587wL9qk3sbVn2DkWXnXdnAOZpafTXklIIdV0wSPpI3efNYcho9thvOLPh1FHxrYgHEy7poUGdlEr01h8X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/SRYARfBzcY6bbacE/dfwaHNNbr2+GREBG7hGkeOOM=;
 b=S70A2psBwifUclfq45cPEzl321UtZyLKqMJTSH1XX3PVIl9MSP/Gvm7poczZlIfsXI1koMiBlooe90Ta8n+00ka5eD3sQfh6MQ2klfp5VA01oBRFnlfD0K5nF2R8du7ihh3cRXlWI5XUGHTMRs3ls87gJPC4JtT7wGDi5ZQY+e0BkKKq5+RjKWjZgUfhApCEcBazbIJ5cywDeFnBq6r22e4q1l6gqrqmlwTOyqQxutF+H7weBD2va1caJCMlecSdT3bOGVXYitpikcyQtTeD7C45RHFo6Xlkn2slPHdLdWk99AFySWd+D4oz+AanZ876nhybol37gJIOcYFHMbOrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 17:28:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 17:28:36 +0000
Date: Mon, 17 Feb 2025 11:28:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
Message-ID: <dgd4urucgypp7u6nqgjwacm3exeijvlsvuroq5iyxhk4hguxyc@xiu3pogry77w>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-7-lucas.demarchi@intel.com>
 <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <f9217dfb-4f68-41ac-83bd-9b0a95e7bbd6@intel.com>
X-ClientProxiedBy: MW2PR16CA0070.namprd16.prod.outlook.com
 (2603:10b6:907:1::47) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d37f68f-8643-4d2a-ad78-08dd4f788265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZRtYbP8kPMPjZpb7E0xRqNi12jEknfPvO8L6RIY+A/C35N52COmiX9RBK2ak?=
 =?us-ascii?Q?tUdIL1SwxBSkfFjmJTY2FKjeLw2h/v79c/2oiOggwSmDs7dy6usIW9Dru+uo?=
 =?us-ascii?Q?lJigwWS15QeJQMc3OUq09LMteegCzdbc7X2nMDP/F9zfpVtlaxSmynYE+NvS?=
 =?us-ascii?Q?IQeA07Ab0WiAFTQGbH8tJBCtOMhlI2HfSjUWfXijDCo0sQf2LvR81iSgpX1l?=
 =?us-ascii?Q?9j4+1uPLv+grbDKO503ryfGZ8TP4fO6ZEkfOdFq3/ZOPcOWk8OjCRRA5xPwy?=
 =?us-ascii?Q?QS5s+GnLr9Z0X1IYo+dS9HDsdAJdOEqluIk2df4QYgFOseboDL1VHb/HaJJs?=
 =?us-ascii?Q?Uf+c/ZXbK5v9+vCM8Jvh18lmNO5dMD1pt1oruDLzAIo+3bG5cr1XdMHDg6vv?=
 =?us-ascii?Q?Zccs5eJB4Wjlo8zbeIiM+unW3f2LmPqE4uDALthtx9KgqSzZqOBjJgWJwfaU?=
 =?us-ascii?Q?BXGPKL6GtwR15ZFK/I0BXWTnWNlq2pkO/KSZ6BV+yng9d7YJbFuI8I7+a7wz?=
 =?us-ascii?Q?4gX5xrTouw5c2pmB63RaOIhBO6FI0DySeg4snojXvrlScOsuncNJXwYLpYHE?=
 =?us-ascii?Q?rkNcMzzxtvU5CMmiVc2psV4IBR/06OhDdmw8/NvLLd5l4XZh1V3gTMpg9Akq?=
 =?us-ascii?Q?EWSAWOGmBP7uLRVZUgQ0MOkKm4ABQbmn8kleyGumY/gJYpt30QVabL88fCFE?=
 =?us-ascii?Q?+aeCuMbvuJXg9F0Wh0CsT2WNNyAavq5bPppsWJVjDKTkfkksV39RUEXly0az?=
 =?us-ascii?Q?lo4pKC+xuEK65YpFmAu6i5YJssaD1uKA5+FIf9CzsOOiz1ZizVDx73Q6osvd?=
 =?us-ascii?Q?ILQBV3j+I1hSOl+R/7JSgJRDSaAuwlsMy8H7rXmVGqk1dIT67p2Zh2FRgwG7?=
 =?us-ascii?Q?J2pEtZjmlyGpoZusvx6jEyxEvJEvNlLy0sn103Yji6XzwN4USQ83HRjkhACf?=
 =?us-ascii?Q?JSqN/6UjJThOoKDvvJOFS3RpOzCs2hW838yXkUp9sxa/AP5CvNw9SxVeV3xG?=
 =?us-ascii?Q?1LxkZOY0s4ETcYVlZ/AEc3i/uHv9c4CtA4881nsAJIQoaxjExwzfwCdU1VOj?=
 =?us-ascii?Q?4mMIN+I/1EvFgG0ohbdMqw5toFHENFK/E2CVSCD5Q4cLRv4iQPyNC+UiTRXa?=
 =?us-ascii?Q?Q+givjH2Oj5iGqvo2LTSlY6haCdq4BdrkUnw5/zdU9KBlYB71W70JePmrAH3?=
 =?us-ascii?Q?0EOE5JHlhnrmOIZNrDHWmUWwhS4+S55ZJO+a0tvb6bvAwg/kgtozwvBhyJZH?=
 =?us-ascii?Q?xJZQdTi++69nxLokAaBJkRAO2H3gkwOOuM/S7Lx7e7Y5L3qrDyDznbbT+G6D?=
 =?us-ascii?Q?A4eTh5hLfDPhmGcLzbau3UHNqHcqA/611AW4ePCggC895VlwumIDpesd8Sid?=
 =?us-ascii?Q?LW4zmNvpJ0+OZg3V3fR3zb+92tMw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIz67M4jaQcpHi3evq2FowiCjs0u8/jbOSRaD5ba3F2a8vefZ7Lmba6shlTq?=
 =?us-ascii?Q?iTZuvxYrCYyRx9GeQHM6InbeSN/w7Qo6rSQKoCVm3wavC1boYvRlewjOPQc7?=
 =?us-ascii?Q?HXrGk88NVZo2aZ/1ecbt5pBAZObJlP4FNeCH0Cz7UgYfyTx95kMNFrVwvOgQ?=
 =?us-ascii?Q?ECm/YYt6Zx+rDB/RnB61OlG4x9fDCoel9pmHbtqmBPyQQchhiRs4rLPOdnS+?=
 =?us-ascii?Q?FRRaK8q6OtG3iiznli3nQa0RiCSkjii3Bxn/ohJJrLtW6hJ+2v7HBCxIBG6w?=
 =?us-ascii?Q?s3rGD9AUTQO7xlcgvb8pvcgk+GKQlt4TsjDfFtnB5PYWWXthmTwcuJ5qg2dw?=
 =?us-ascii?Q?rpTr3BJFx5nc9YVZhshQrOfyKxWbrNeYXvczE+pj4DNPnecRBceuA6I46b7C?=
 =?us-ascii?Q?42g5FtJTGm1ijG+383oPeSzc/fn/1wrEraYFOeenvZIG29VQThNaY0Gx4oHN?=
 =?us-ascii?Q?c9ZuVIv0FC+W0PIk2ULkHFZwWnr0qDX9qdkh3iSiAmizcQjcwkzgjxhwu+ge?=
 =?us-ascii?Q?EG81VgOALJFPJIS9D5wRas3g9P4tlY4PbJBuwgJ5eGYqYvifzrI2ha3Koemx?=
 =?us-ascii?Q?8GheKUrMyV+h19rxhMJQJchVTFPvmbRee11xy9/RS5/lErFbuL/0NOt5LurR?=
 =?us-ascii?Q?G9g0o/tKApm3Jom5YZ4sVn4TthoJqam/n9Q/6djz8YcUFmSj5Er8aVnjy4DA?=
 =?us-ascii?Q?o5R3SxJgN8YDnLVdvF/rsO00Ky3w6+/1URkyNXuOM2tTBNo1FGXHtE2kZlea?=
 =?us-ascii?Q?SYIJsEar1vmEzzmzYadV1oEz3nLcOXaFMG/NaXpydGYHZAugsgcxKf4ajYnk?=
 =?us-ascii?Q?uK95FW44HQv1vbygmAroVwPfYO67aZCCNaPJzPkcxUPWwUSZEbDXA6KRJu0T?=
 =?us-ascii?Q?fCXtnTHnQXDOpfs6AehEqiQ1Gceqb+RNpMciKNROFoOs9Fs8+SjzdLjRIe0/?=
 =?us-ascii?Q?SKFBcroJy1zZ+YDbFq0Q9vfcDRkwIrN0CHdenfxvMEfeSb6sQEcnF/n5pwMf?=
 =?us-ascii?Q?Rz+MgUQvbTNHmaOK4MMoR63NLrAbjcMx5JF906qsMjbJMiX7KMXnzpwBU8yL?=
 =?us-ascii?Q?/qbXnVvutI5gNHy97seg/p2xU76jtyoTd0CJcuZouiLAW0sB8ToWHJnInutd?=
 =?us-ascii?Q?3/aqQyhUqWpoRA0JGA8FMWw2Qyna5MB8Y03KWApI3MH2wOz28LW0kBrK9z3O?=
 =?us-ascii?Q?3seofB9A2MhyUoz4oytVbWTI8qxHg5QFzuHFDfcaG0Jy5smlT8hnvLPcgtee?=
 =?us-ascii?Q?DtX1ICVDMwzPw6lCzqJgMG+cnLW2L9s49c5zz5h/Al06EhyZNRdV/XTh2lGq?=
 =?us-ascii?Q?eAbO5j1m1eJ2vmJgfsGhXn3KH+z4QZTR6lTwLMMN0UGD7JJWP450B9IWxHI7?=
 =?us-ascii?Q?I9lYEeOd3gvkFCh+ugV5xzpvxc/RPapv6LiDio1AsOB5Ay64zJrn0ciIZOsF?=
 =?us-ascii?Q?vGkPI3VkYrx/9J9FDLOicbuS6m71cP47n1xC3Dj4YFmAEr8aQ05khGz+EeCM?=
 =?us-ascii?Q?y+bHm21FlveAh35LUpUZZA40dDDFHh5qL/BCeaTSVWHxc5APUsqhjLFexKI7?=
 =?us-ascii?Q?goyVi8GZuEwECcllmpUWBNJDNnoolhr1RQZofLBpxjXpQb0RZHyMJ65VaThE?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d37f68f-8643-4d2a-ad78-08dd4f788265
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:28:36.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvNg+5x2deg6drQFv1ZCcOIpPtsHm412zNEGLtp5pTrq/hbLibciUWeMXeywRhcWV/OWEUx+Fc5uxxEBnZJWn9ETLHseTZKeuvUD/vKM6Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

On Mon, Feb 17, 2025 at 10:56:22AM +0530, Riana Tauro wrote:
>
>
>On 2/15/2025 2:53 AM, Lucas De Marchi wrote:
>>There's an odd split between xe_pci.c and xe_device.c wrt
>>xe_survivability: it's initialized by xe_device, but then finalized by
>>xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
>>the flow entirely.
>Hi Lucas
>
>device_probe_early has other init calls that return error. And since 
>this occurs only when pcode probe fails, added it there.

right, but it's very confusing to have this flow with both xe_pci and
xe_device playing a different role on init and fini.

>
>I hadn't added the fini in the devm_action because of the pci_set_drvdata.

which is now fixed as a prep patch in this series.

>
>As, the remove function is moved to devm_action. IMO it would be better
>if survivability_init stays in the err condition of pcode probe 
>because if someone decides to move pcode_probe to some other function, 
>it would be intuitive to move this too

but from entering survivability mode, it would still be after
xe_device_probe_**early**().

An **early** error in xe_device probe, by means of having a call
xe_device_probe_early() means a very fundamental issue with firmware and
we'd better enter a mode that allows us to recover from that. If the
call to pcode was moved somewhere else after that, it's mistake that we
should fail in CI (btw we need a way to do that in CI).

The only thing in between right now is the "wait for lmem", which I
think is ok to have and still check for the "do we need to enter
survivability mode and abort the normal probe?" after it.

This allows to fix things like mentioned below and make it easier to
keep it working.

Lucas De Marchi

>
>Thanks
>Riana
>>
>>This also allows to stop ignoring some of the errors. E.g.: if there's
>>an -ENOMEM, it shouldn't continue as if it survivability had been
>>enabled.
>>
>>One change worth mentioning is that if "wait for lmem" fails, it will
>>also check the pcode status to decide if it should enter or not in
>>survivability mode, which it was not doing before. The bit from pcode
>>for that decision should remain the same after lmem failed
>>initialization, so it should be fine.
>>
>>Cc: Riana Tauro <riana.tauro@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device.c             |  7 +--
>>  drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
>>  drivers/gpu/drm/xe/xe_pci.c                | 16 ++---
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
>>  drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
>>  5 files changed, 48 insertions(+), 55 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index d88c0fddf0680..782ad564d0ba4 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -53,7 +53,6 @@
>>  #include "xe_pxp.h"
>>  #include "xe_query.h"
>>  #include "xe_sriov.h"
>>-#include "xe_survivability_mode.h"
>>  #include "xe_tile.h"
>>  #include "xe_ttm_stolen_mgr.h"
>>  #include "xe_ttm_sys_mgr.h"
>>@@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
>>  	update_device_info(xe);
>>  	err = xe_pcode_probe_early(xe);
>>-	if (err) {
>>-		if (xe_survivability_mode_required(xe))
>>-			xe_survivability_mode_init(xe);
>>-
>>+	if (err)
>>  		return err;
>>-	}
>>  	err = wait_for_lmem_ready(xe);
>>  	if (err)
>>diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
>>index 06dc78d3a8123..992ee47abcdb7 100644
>>--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
>>+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
>>@@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>>  		return;
>>  	}
>>-	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
>>+	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
>>  		ret = heci_gsc_irq_setup(xe);
>>  		if (ret)
>>  			goto fail;
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index 447eacb355d7c..c18c58447d9fe 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>  	if (IS_SRIOV_PF(xe))
>>  		xe_pci_sriov_configure(pdev, 0);
>>-	if (xe_survivability_mode_enabled(xe))
>>-		return xe_survivability_mode_remove(xe);
>>+	if (xe_survivability_mode_is_enabled(xe))
>>+		return;
>>  	xe_device_remove(xe);
>>  	xe_pm_runtime_fini(xe);
>>@@ -851,13 +851,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	err = xe_device_probe_early(xe);
>>  	/*
>>-	 * In Boot Survivability mode, no drm card is exposed
>>-	 * and driver is loaded with bare minimum to allow
>>-	 * for firmware to be flashed through mei. Return
>>-	 * success if survivability mode is enabled.
>>+	 * In Boot Survivability mode, no drm card is exposed and driver is
>>+	 * loaded with bare minimum to allow for firmware to be flashed through
>>+	 * mei. Return success if survivability mode is enabled.
>>  	 */
>>  	if (err) {
>>-		if (xe_survivability_mode_enabled(xe))
>>+		if (xe_survivability_mode_required(xe) &&
>>+		    xe_survivability_mode_enable(xe))
>>  			return 0;
>>  		return err;
>>@@ -951,7 +951,7 @@ static int xe_pci_suspend(struct device *dev)
>>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>>  	int err;
>>-	if (xe_survivability_mode_enabled(xe))
>>+	if (xe_survivability_mode_is_enabled(xe))
>>  		return -EBUSY;
>>  	err = xe_pm_suspend(xe);
>>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>index 04a341606a7c5..7ba02e085b5b1 100644
>>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>@@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct device *dev,
>>  static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>-static void enable_survivability_mode(struct pci_dev *pdev)
>>+static void xe_survivability_mode_fini(void *arg)
>>+{
>>+	struct xe_device *xe = arg;
>>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>+	struct device *dev = &pdev->dev;
>>+
>>+	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>+	xe_heci_gsc_fini(xe);
>>+}
>>+
>>+static int enable_survivability_mode(struct pci_dev *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>>  	struct xe_survivability *survivability = &xe->survivability;
>>  	int ret = 0;
>>-	/* set survivability mode */
>>-	survivability->mode = true;
>>-	dev_info(dev, "In Survivability Mode\n");
>>-
>>  	/* create survivability mode sysfs */
>>  	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>  	if (ret) {
>>  		dev_warn(dev, "Failed to create survivability sysfs files\n");
>>-		return;
>>+		return ret;
>>  	}
>>+	ret = devm_add_action_or_reset(xe->drm.dev,
>>+				       xe_survivability_mode_fini, xe);
>>+	if (ret)
>>+		return ret;
>>+
>>  	xe_heci_gsc_init(xe);
>>  	xe_vsec_init(xe);
>>+
>>+	survivability->mode = true;
>>+	dev_err(dev, "In Survivability Mode\n");
>>+
>>+	return 0;
>>  }
>>  /**
>>- * xe_survivability_mode_enabled - check if survivability mode is enabled
>>+ * xe_survivability_mode_is_enabled - check if survivability mode is enabled
>>   * @xe: xe device instance
>>   *
>>   * Returns true if in survivability mode, false otherwise
>>   */
>>-bool xe_survivability_mode_enabled(struct xe_device *xe)
>>+bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>>  {
>>-	struct xe_survivability *survivability = &xe->survivability;
>>-
>>-	return survivability->mode;
>>+	return xe->survivability.mode;
>>  }
>>  /**
>>@@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>>  	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
>>  	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>>-	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
>>-		survivability->boot_status == CRITICAL_FAILURE);
>>+	return survivability->boot_status == NON_CRITICAL_FAILURE ||
>>+		survivability->boot_status == CRITICAL_FAILURE;
>>  }
>>  /**
>>- * xe_survivability_mode_remove - remove survivability mode
>>+ * xe_survivability_mode_enable - Initialize and enable the survivability mode
>>   * @xe: xe device instance
>>   *
>>- * clean up sysfs entries of survivability mode
>>- */
>>-void xe_survivability_mode_remove(struct xe_device *xe)
>>-{
>>-	struct xe_survivability *survivability = &xe->survivability;
>>-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>-	struct device *dev = &pdev->dev;
>>-
>>-	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>-	xe_heci_gsc_fini(xe);
>>-	kfree(survivability->info);
>>-}
>>-
>>-/**
>>- * xe_survivability_mode_init - Initialize the survivability mode
>>- * @xe: xe device instance
>>+ * Initialize survivability information and enable survivability mode
>>   *
>>- * Initializes survivability information and enables survivability mode
>>+ * Return: 0 for success, negative error code otherwise.
>>   */
>>-void xe_survivability_mode_init(struct xe_device *xe)
>>+int xe_survivability_mode_enable(struct xe_device *xe)
>>  {
>>  	struct xe_survivability *survivability = &xe->survivability;
>>  	struct xe_survivability_info *info;
>>@@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device *xe)
>>  	survivability->size = MAX_SCRATCH_MMIO;
>>-	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
>>+	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>>+			    GFP_KERNEL);
>>  	if (!info)
>>-		return;
>>+		return -ENOMEM;
>>  	survivability->info = info;
>>@@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device *xe)
>>  	/* Only log debug information and exit if it is a critical failure */
>>  	if (survivability->boot_status == CRITICAL_FAILURE) {
>>  		log_survivability_info(pdev);
>>-		kfree(survivability->info);
>>-		return;
>>+		return -ENXIO;
>>  	}
>>-	enable_survivability_mode(pdev);
>>+	return enable_survivability_mode(pdev);
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>index f530507a22c62..f4df5f9025ce8 100644
>>--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>@@ -10,9 +10,8 @@
>>  struct xe_device;
>>-void xe_survivability_mode_init(struct xe_device *xe);
>>-void xe_survivability_mode_remove(struct xe_device *xe);
>>-bool xe_survivability_mode_enabled(struct xe_device *xe);
>>+int xe_survivability_mode_enable(struct xe_device *xe);
>>+bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>>  bool xe_survivability_mode_required(struct xe_device *xe);
>>  #endif /* _XE_SURVIVABILITY_MODE_H_ */
>
