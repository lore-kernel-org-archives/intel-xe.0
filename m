Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D6DC282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DE810E374;
	Fri, 28 Feb 2025 19:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK74WoEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D7710E374
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740771194; x=1772307194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gHeCbGchalNdVc20BH6C57ao8A3xKftWhjqr2YxHtS0=;
 b=XK74WoEQBWf4aGHTUV+LpBv0wWuRBv92h8u4M3uwKJbVYh76mbuJjyuJ
 L+pFBjxypza2DLJJxU98IrxyF+PDIKOwAkfwHGTOoYamjqShCnfdBfVMY
 TpgHPMzinZQnr87qR5q+692KIqtmC7HSIG+XJ2mu7W3O4ttErCQeR5/BT
 EX8ytIrz3ChVjcdpy2otoDKMb/KoYdREMKtQH3HY2JFKgnFLmMgkTn/xe
 rSHkQZHsLZWq/N0x2zmpsQINZBzUWP0fb7HuE5Uo67bmq92sC7r8dwTEc
 HI5ufpXzqtTHGX5/9ufPlawwb0sQXKFUjTuBpIZvmZ8zrh6aDfwThlJWf Q==;
X-CSE-ConnectionGUID: 2KDbhpi9T82OliabiFcIJQ==
X-CSE-MsgGUID: W1o4mejxT+6hHjjAOnObGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="53099893"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="53099893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:33:14 -0800
X-CSE-ConnectionGUID: QR9jerE1TJORmVnWmYnSpA==
X-CSE-MsgGUID: 21zTQqqYTK+1ySdQ0eiKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154594916"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 11:33:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 11:33:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 11:33:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:33:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5eRetYE3Ha9JV6fkT+vi3Pg1CToDJwp3/EkFHjtSoOTydJIg3I8Lr/ADDulbOd6IateG8L6C4ZxWlu7n/35peTPBi4N4EuAvmQ9YHqz4xwRx4zTZ+B1W8MU1FQSnWqCnRl+Y5vMpN51+Za/tUd3wnq7ymbBmHjetG6QHAW1dsNo6VEGp00gTLBKigcG5nQJXf91BBJIFq9QlHzkAu35Te5ZveeLMhPxymC5qG+sxvmM0pqqAp1DcdodiDaivLunU9CDzwEF5+1/AzQR0Jm0J3Dk8eoM0DWDEK/q36Y8yaRB5ESAVMfvfq/DQ3/0avZI40/d+k7yga3o7j6VLPiRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmodj2OC58KxSoaB3XD7pfOKeeOezcess1uv+iJ7y1Y=;
 b=NuyI3oGKVJ+KKNfojYEClYfzKT98qSbFGqfbboA8ikjIHl+pSuO1ENOpK6sFf028dtDO3FoMH20hW/wJtEKs30ZDMqH+Tymm6oK2fMQzXQqdxu9Ky0bbP9+6m5zVyNbh8V/NewqdLEFdHLxSR6lgw+O56qB3pOrdfIUFZhIMdx2n5nyzbtcYZV7eBKYQ7eQP5YmdqHwgcq9sVQGefQdapeBihwjtyihvXReNY2VGuH/8MiLe2oUAsaDZAdIxdtr0sLz++mp0O6xHvIyGhGjWxpMYFI1pIWF8UNpr3bK1Iew0JCz1D19t3wTmrQGX0YilqTa+UyXib0BmaYoYNcZAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Fri, 28 Feb
 2025 19:32:28 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:32:28 +0000
Date: Fri, 28 Feb 2025 14:32:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, "Juha-Pekka
 Heikkila" <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH 12/12] drm/xe/display: Expose AuxCCS frame buffer modifiers
Message-ID: <Z8IPSFlTmdbc1kXJ@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-13-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221101736.78986-13-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:303:b9::17) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 0231d391-0c13-4d9e-677d-08dd582ea2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VkjxseaP2Tq1T1LKXOy5FsJr8YrDd4XHR5S9ba8Sd7Ocu7Ugup7hBL3qnG?=
 =?iso-8859-1?Q?TgXsaUHUhtToz8Q8L9FwVil2bBP2PaI7H4IALX1rj0cJvmpazLFPQ83NRm?=
 =?iso-8859-1?Q?DjXUmMjbKaI5ZtS9xw//LBrQMmytmUy5t8dO8ElQKUhJo+PoGjYUOBoqXO?=
 =?iso-8859-1?Q?xXGklhuBUVqIgk3cVw8cV3eWEU3ebB6OrG35dYyBGwtT0hdLhpjsHDjyI4?=
 =?iso-8859-1?Q?spZ794ngucQIwSke+w4kELvcNp2AixOF8EeoLvrsFW4uGoMYp4SUNJ1ZDc?=
 =?iso-8859-1?Q?oCY4JTka1rSJVtTCimP8KT235jco2j7AxbWBUhbbKQ8vGadi1F8uewbbr9?=
 =?iso-8859-1?Q?LidNwjKpHW8DE/ZGNbLR8gHbPO78eIHrvDnu2ALXqFStjXbFjMwYbRuOfC?=
 =?iso-8859-1?Q?9nFRDQkrr5XUibxtFjMonaZKX20fGmemR/aMppo+h+8XnIFcDiSntbzNCB?=
 =?iso-8859-1?Q?+iC+rRAFtHnexGDUotZuJm0NIa7VVksSQYj6d8R7f8ZObgla1MJFYz16W8?=
 =?iso-8859-1?Q?0el/+5SUUqbm/VuyEp14P76hdKPAV4Vvxm/QxpBVYW/TrW8DMaG0Nf6oZp?=
 =?iso-8859-1?Q?ab9EpvEuIuVwL5BcAMBY6HEgfFJ0QqtJKbJyCEQQiX4ucAgGnjVRJZbHro?=
 =?iso-8859-1?Q?bum3LIcCiXXi643SzC3Silz0TokGI7BiNwgySZ534ZQaF3Bo1uQmKvIdM5?=
 =?iso-8859-1?Q?zV59VRM1h2RqtQrHw3AEYJw8ICxiqKn2e23rg2hl43XDKIoI5kAC5lI9CA?=
 =?iso-8859-1?Q?dp78W9HRnEBaIFHmC2+I7Zx3zGkh8YQ9KldftokPI5XVJGfeCmPcn8qcOX?=
 =?iso-8859-1?Q?7OoQ+5YuqwVUoF01/Za/68SeNyrb43xddCLLLRngyVCWhI2lIBtvTwxgar?=
 =?iso-8859-1?Q?qFrbO8M3tfxCUlplLHM+sJ4T/35f8AswsNCgrbxV7v4zIkOO4e9Z3ZVBsh?=
 =?iso-8859-1?Q?WXNDNCiGsiDOTv/haPjVqw3eLhxA6TFVjhSKI2flGLsSj3xP8CHpCeSjHR?=
 =?iso-8859-1?Q?H11STpyNPANNraxcdoF30Gz6wHuk0OcS+baxTcttwl4cJUrRWfo1nxanEf?=
 =?iso-8859-1?Q?IpvTUo0dCIp3l3h2N0MWjbQbxwQpibiHN2lYqxcu/0/YkPEhGNPmkaCNUc?=
 =?iso-8859-1?Q?mGAxgdv5LOU/cd1izgUTyJeXa6TCoet5SdgCgmeURammNYSPekuOCxY2v5?=
 =?iso-8859-1?Q?yaQ3aB1RZfoPku3CjySE5sZCLSKg1zsVnW7J82Qq6AkeMw7yZGusTYi2ka?=
 =?iso-8859-1?Q?emVrQVQyNEsGjQpMi337D73gkMwPasQU+EidmrYBUO3q2CMX/I7gfhT4hg?=
 =?iso-8859-1?Q?87OPqKax759wvRS4jGSqsRwpP5NJ8ZL+osDRRx8Ziyyt4cy7NRjX+srezy?=
 =?iso-8859-1?Q?WlTkYLp5GOElem1tfuZz+pG21GFez3SNcx/BGNqps+1gkVvUBXKgyRs0WN?=
 =?iso-8859-1?Q?VP9aO+0Pdp6Q7ejb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Zc5UEVoMACPrgS+RExiGRQEsylpBSDiqtR88W/WlpHSvej8/KPCgftDzF2?=
 =?iso-8859-1?Q?TyPF/4kviLtZPxSOnqGZMXdb60/xiX//cjTkU+eOcBTKadfF9ZRhANTmVE?=
 =?iso-8859-1?Q?P3mW8xKIF/61ShY5Dw5LCAqGMsPMOUj7pXAzbIhwCthK/doBPUokNW/CYM?=
 =?iso-8859-1?Q?uSS3Di7cc53DO9idi4ia25ub/MMxDkb7ilBK1qbCL1Ao7iUa+tOTOn6HYM?=
 =?iso-8859-1?Q?kVhojwdo6+JUuxL9JxQltpltPRbG5KYP3FUVhUhNyswVmCrMw/EbOxORkf?=
 =?iso-8859-1?Q?KzuvvTxgeU2EMFVzuqGvmfb7H/zbD8g//g/jrpSkjXAvImrH1Mq71O/hVN?=
 =?iso-8859-1?Q?aBPOxcBiHI0DE18Z9oyU5Jh+QVj6Q/0rZL0Px8VEI4YmH+mv023Fa0hCNH?=
 =?iso-8859-1?Q?ZmjBrKuzbUt/LfBqj5TG1DgBFzOeKIEvuMVmObMJGNHj6/IhUWaqjHcHbO?=
 =?iso-8859-1?Q?qJM+1FsclfRR9FtkXNDhNod3m7vQPaBl2Vnv8cZlai9TdDw2Zi55xplvNL?=
 =?iso-8859-1?Q?S4QuBTjtc75gZVWBGoRVKtX4RZglwd89To5U7wfIzqYQzABtsACVITzq02?=
 =?iso-8859-1?Q?B8t1xNaT8ong2yEvD/mwZ4K7p62zoe5O2f871feRpigWGEo8hPbp4kEHyB?=
 =?iso-8859-1?Q?CX3IprF3thV7TMegBAMkoKZ2uraMTCrcKuTyD/rD9ePuf+5ElqBvHSD9K2?=
 =?iso-8859-1?Q?NkiM+CSw3a7bNlMPOcGb9dTVtij6a1eZLs0gab0Lp4fOOLZD8F5vaf0U2R?=
 =?iso-8859-1?Q?/JpK9CFep7/9fT89j++C5OngrhnRB0p/ID/r7Mo5gLa4JSJTbNqLDyASvI?=
 =?iso-8859-1?Q?iZ8CBIgL5/OhBVX1sV8ISWETkoRN0OCqFhfYmHYOSG7B16F/3ONgUvVTln?=
 =?iso-8859-1?Q?berdw1WW//ZesEL4Kim/dSn8bbPUeIpk+w3a+0SMUl1BIz/cvjpu7LrCIj?=
 =?iso-8859-1?Q?MbG606wsk9w9zdbOrac8AxSz+qFoMUI6bfuOjeSJT12FnHX+ylLuh7Fznq?=
 =?iso-8859-1?Q?udRzNNnBDA87rOo+8MwnGRRik/f5DF0Z3dYcQlheUlTzIW2Oz4+iaoHhcL?=
 =?iso-8859-1?Q?wzUmRs+YH4TLVPpm67gCamb5JZaTciWG5IYAxgZLUK9HDNl/dOk/1YWrnR?=
 =?iso-8859-1?Q?3uzPvhxCgJxf9HHbaRBiC1SUdyzQlvCH5ehgxhiMBwP7NK7tO//YCPWFQ/?=
 =?iso-8859-1?Q?m5hh86ZRAmrAZsMQ4x0YttzePmFfj7MkhM0Ba7v/je3bUc4Jiu9H4T+8tz?=
 =?iso-8859-1?Q?P3rq3+oEgVeEwilXUuVROwud9EpmBByG6LYUgzmfsJEnMWZfdeQsyIR5Ap?=
 =?iso-8859-1?Q?G9J3DCwai/NU83w+qfQ4DWg4dLZuB+TisVG5+AdDqUgX6+GXMDvvgGv43q?=
 =?iso-8859-1?Q?rJRx0pfEdvha2pCB9YYK2rqoIE7n7pEqHv27q7UjuC4QFZ11Spsuv5u6GM?=
 =?iso-8859-1?Q?BRQrFHvkI6y3pwDjvYNIfs6vSj9HBQ4tlRle8OSRxnqOAWLNy2mc9iW3uW?=
 =?iso-8859-1?Q?b1ZZlXNevEkQYeXYrrFNse4mSTLlCaLqEMZdGiFNin7ntjgxQKUrfjuNMS?=
 =?iso-8859-1?Q?dvaHBHhlKlu7ngFYEBMYgRLucf6UTKwRh3AggxZgRICiNka8Wvn5XEuFQ/?=
 =?iso-8859-1?Q?HxPEKrwgDIneIb+OCHMMBpQiZDteEtm2dS2HKmPZ8Fw11ZXvnYYX4YPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0231d391-0c13-4d9e-677d-08dd582ea2d1
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:32:28.1905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUhyXsigEapLrSosLvllb59rcFnlIeo7uw9Cq7z7Djth3/Q4QcWc7im9k9i1IDAN2z2sHecFzA2y1XWnlzvRxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

On Fri, Feb 21, 2025 at 10:17:31AM +0000, Tvrtko Ursulin wrote:
> Now that we have fixed the DPT handling we can undo the nerf which was
> done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if
> built for Xe").
> 
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> 
> 	[PLANE:32:plane 1A]: type=PRI
> 		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 		hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 
> Display working fine - no artefacts, no DMAR/PIPE faults.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 110f66dd5cf0..37438e84203d 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c

because this patch is entirely under i915/display, but only for !IS_ENABLED(i915) (which == xe)
I believe the proper subject is something like:

drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe

or something like that, which is the opposite of the commit reference above.

> @@ -2851,12 +2851,6 @@ skl_universal_plane_create(struct intel_display *display,
>  	else
>  		caps = skl_plane_caps(display, pipe, plane_id);
>  
> -	/* FIXME: xe has problems with AUX */
> -	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(to_i915(display->drm)))
> -		caps &= ~(INTEL_PLANE_CAP_CCS_RC |
> -			  INTEL_PLANE_CAP_CCS_RC_CC |
> -			  INTEL_PLANE_CAP_CCS_MC);
> -
>  	modifiers = intel_fb_plane_get_modifiers(display, caps);
>  
>  	ret = drm_universal_plane_init(display->drm, &plane->base,
> -- 
> 2.48.0
> 
