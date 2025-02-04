Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C32C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 22:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8BD10E0F9;
	Tue,  4 Feb 2025 22:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOSStnZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8110E0F9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 22:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738709010; x=1770245010;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bzp0VI/40qCIEDRf6J9rhZDV9ZMrJ0T3uXhgNAKXAOM=;
 b=fOSStnZ/Pcx4WRUp9jNaym+S4i+cHL3I13dr7ZLAIr2a84boZPg8r8rC
 hRsXcKRZgJrfYZ+ZMPL7gevHKR0xtCAQe5qmyqAQznz2XnGloS3OycXh0
 WltDEjD92tBTXCyiLC9JCaIda6yk5zXer4aUxS7Naxck8T2Vr/fNCibVE
 c6nSkCl5Y4Az1qiB1SzDKvTqLVPI7M1klxU5tKbg++G7q4Hry/67+60dV
 oC82W8eYJJIiW7lx99txmehFjV2np/0SxxMhlkXctyP1BN4PLDEV27Dcg
 KDKpMMsTjKBbk4e/ljkKLsB0X6BxRKGui0gmmiCqQiNCFp0b3h4mxrfFs g==;
X-CSE-ConnectionGUID: hMkxb1vvRsWZzJrj9ppX1w==
X-CSE-MsgGUID: LspMsbRUT5SIHlGYI8+6/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43179343"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="43179343"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:43:29 -0800
X-CSE-ConnectionGUID: mwTYfG9mRfq8OPcUlAJeJg==
X-CSE-MsgGUID: rpT1VHheSB2n6/n1dkDfWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133973148"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 14:43:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 14:43:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 14:43:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 14:43:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsOzQgr8JQvtNYybaJOebFKaoJJLA3gkQ6gsLwq20zjqOpzd0rShMdImbnOXbOQMPXrdnwrna24u5byUYY4/13xhhvhKc0CmXk0xGEVWrjRIAEvcvrTbmOxqyvc9798uh3PrRlpjVxYFzIOnlkClZ3bol1dpCNbTYaC4rv19errJvo1pFgVPzC1nw1D3BTq2yMNEWj5f4ePt2pApnxK062Zv2nuL6D/svqK3ffwGybsoDM0lIkDwt4uV91DSDSpXeqjBCARYEySEL14mvJ9DbghN6BLnpZwxz6PfquX/YijBJeJvX5LEnb0LVu1h53g7kEe4Agg2Q8Tny5sQaok5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg1ZIVdBJ6igPHurpR4Q0xYIfmpKN8qnX48WiTTgO0E=;
 b=FQRsza4/dDV0ZkJvwuRIcDjAdodknTUr+ukxlg+4dAY8UIBHIaJmH5koBhh6cFPbmedt6Vpzn4iYyiByKEQYmMwJxlwnSwyzp/8iWBA7y5eArCsIZ58m8iIcwq5/oJRFusQDIxGUOy47tAnUktuBEVqqIxattfJ+OeIazqwhpLm8cKphec3vh2rHmbj7Y6XnN7kgGNMt8b4OEVqdixGeK26zu60m9ANDSy31ePkr+oPj/Ab4xUGpfb5SHYu2udpcF/cb8YATsvUMljbKZ/7xYJxyDz68QCFbTYaCW9OtuC77pXEk24PPxd7GOTguvo/H3hyi583Yo6XYy3HYmyxTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 22:42:42 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:42:42 +0000
Date: Tue, 4 Feb 2025 17:42:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
Subject: Re: [PATCH 0/7] Cleanup error handling on probe
Message-ID: <Z6KX3rUYTllATuEW@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <37e94776-ea74-4fb7-ae50-ab999324df7f@ursulin.net>
 <juvslcazrixq4cy3ebiddbw7zwnpfah3mmaqu5qyclaonmupg3@x5l5kv4nuwg5>
 <7d074cfe-0a64-480c-b1c5-d3dc850b6c1e@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d074cfe-0a64-480c-b1c5-d3dc850b6c1e@ursulin.net>
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ed19a2-dbc6-46b0-abee-08dd456d3c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8R1IHoYyXicYh/kpFsU60WPM9YqatumaVlxWYqXQVkl6eCi8unTGIzRyKC?=
 =?iso-8859-1?Q?FqzyZTBVtjPIv0VNTO4bddqbLns8p+WHs7XksOOI6T6uAGKaPQZYSXwwju?=
 =?iso-8859-1?Q?rrsGh5qCwjj3eUIXnlJxRpyHFTezGuj17aiCIDCAOhNnbBrsJwFKof2RV4?=
 =?iso-8859-1?Q?nEpmP+OPPiwLT+mF6uCqzkOYqU0QYo+dPSDxdTCjlR+ua4xdLf8Rg3k2Qw?=
 =?iso-8859-1?Q?4Igwlio2OCBPoDpPm3sz+4B7R0p8PCwMR8VZyR8uSphQroNpYqSTRC0LOG?=
 =?iso-8859-1?Q?Y12CMZ/zdcxMUHVZ1Xci1KjhU8hRXHjE6oNCMm1IMEP2clr5zQ7NB2qNcq?=
 =?iso-8859-1?Q?ZuBBTiDXDmVil+bgJUwUmldQEh/Nj5cuRr/W7wOAQRy0gBKwdYzU9z0SdA?=
 =?iso-8859-1?Q?i64df3om+elcT0PhSCGxY8aaMqOJRLmWLp4lOUg2goG/mPvrkowZV43795?=
 =?iso-8859-1?Q?CFWEtVFjsbGGCEJBnhShsU8OpP0uEe62wEx9fNbAsBWz6Ka26DDF3i5nPf?=
 =?iso-8859-1?Q?z+5zMrQJ5x3Y1WqWgIAHokkab92ZO42iWm291Gv5hvcVhj6d2tLJUvOJ0N?=
 =?iso-8859-1?Q?rAXsLcX4xNzfdi6+aWdXoZwvrLa7qhwKla0XyDN006eIVculF0O2WvoZKv?=
 =?iso-8859-1?Q?HVJ9bzbvPko09YNppQ+q6UaGxQzaNSxLwx2zAiOQv7NkeA0cUNdxMPsPKy?=
 =?iso-8859-1?Q?zAh/txhvmT7+Uv8ag5k2XY8paBcRC+NfcmE3o/CEWVavqnZgUjoyC6QE+f?=
 =?iso-8859-1?Q?C0hADdlvRlcWFhUtBKewOiM2V8Kn1VGifSBBjgJNoUIZcga6TRkfWNzoo+?=
 =?iso-8859-1?Q?Grk8RDydHX0gMZ16PldmQhPR7tzHg5xQ+dWcJe6cdWdysLhDdLSlEU6XGO?=
 =?iso-8859-1?Q?29FJIT2ilElc/unblFZ4DcRS0NoYY5MjcmoeMS0x2h8u2aheqCaBCeYshN?=
 =?iso-8859-1?Q?gt/NeSbCM87nmHkudEH0RqD44NYSvIgkgoe57QEVxEjPs1ciZ1Wrx3Mem3?=
 =?iso-8859-1?Q?Uc/S3fDwSWm+nkbaf3cFka+vk0eJW901TcuQcCP/eG5kcnn0bOBaMMUX3i?=
 =?iso-8859-1?Q?r+mxYbrgghdBcaRYjoNhkvNbtVwTPTJwAUau1MKw9M4Luhr9b6P77VNOGe?=
 =?iso-8859-1?Q?KfWLVZh6q/EHEmI2ux9SwClgZYHxFtdAkoZil2BqTB2oMT0Sf6YWzffHu6?=
 =?iso-8859-1?Q?y07TyFgW9vVFzkbZCmornVbaZVbJosISuBE7HlQjI6FfVes3b22aabZGn0?=
 =?iso-8859-1?Q?DyTIBWpq5DIPOrgwzfSPAbYZYEXLKGTTtQUDRNuOWSsQD95363Xtj7aDCd?=
 =?iso-8859-1?Q?BWxZVm2+iGLzCxN4wvjkCSE8ljxviMa/5uotSGwWKLFUzBLcrfDMQTaMJz?=
 =?iso-8859-1?Q?r72VkZpfIEh+fMO1VsfhqgUFgxZkY5k7CcHISrCmIsNxGmdUOEQPzJuxmW?=
 =?iso-8859-1?Q?OCSJZEtbK+mvTUwO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IXyRL5GpUQDXIILEH063/ExUh36qTQBNUE9ExCiMhTCYV3/IUP5f4Swsne?=
 =?iso-8859-1?Q?JUI5JG/NUXwahulIUVo2782oaPHeuaB3UNyCeeHlRDni9AhBkYoyy7UkUa?=
 =?iso-8859-1?Q?fCA06dFubY5hj8Pr/hWfJKF3Rp9wXvLiQJtO2lhduk5zThH3HOL7QIfafE?=
 =?iso-8859-1?Q?D2pq9sM/+OPfxVw4EaWw5Zm014RpHXm0nZXFB3ESWzgwhT6y7mb0JsHqLp?=
 =?iso-8859-1?Q?h9lI/lMG+OpTAfSnB3K29XzRa4uPv+Mv2Uo2yLpTsi0ivroK0RMCEDLsNf?=
 =?iso-8859-1?Q?SbtsHuC0DzfTn/PEf8p2uJkCPn1v1EEUU7S0SKW7v+CtdiRlbtrKWLo+lD?=
 =?iso-8859-1?Q?lqdqHygruZH8fYj/RfoA/RSNgd/Q6jAkr+j9ieiLbUkmuUv1sVgRqrWZe7?=
 =?iso-8859-1?Q?k8uEufyR/KLqnpU8Af3SzJBIaMQ/71IcTo986tfhHc0ST/94IbAMk8tVD/?=
 =?iso-8859-1?Q?FGct8RGLaAw6jPhWeWt+jYU/mqTielSO0B9ucwR4yWjlD8lJNJ2ho35nMN?=
 =?iso-8859-1?Q?AOmAmS6PzK1MxX2vilqBsXkJl4ON5FrJXInGbNe2BW2BsJjjxNjZaX/t++?=
 =?iso-8859-1?Q?/Vi+qecLcAwroQVVQzpRp8DJZh5iuOhYc1KuifBLCIhBJSoyQBm7bGK2Gk?=
 =?iso-8859-1?Q?F32tzRZ52vqQseo0XJLnxU1DPi7ENSFtrg/eacsXx9weW4DbXM91k/R/5P?=
 =?iso-8859-1?Q?fmCgFmp0fYUpmpX768gwoBw03KYEF9LgMliqccT3YlAF/VZBs9sA7w9SmK?=
 =?iso-8859-1?Q?FMPd1xQpST9w9Uh8jT+HTmvjT/SK9eUZ+yDEUoODjy/+K34oVsYBcRmAVq?=
 =?iso-8859-1?Q?b81bXvR305Xphj26ohMfYHTpxE4nSVPhiXTPmf+8gGhMKeT2KWXE0r8ckn?=
 =?iso-8859-1?Q?d1Yy5eK/pkVDdydDbOT2u9dYt25/IRgNM2vrB6kOTHfdrlftatAy38nrUW?=
 =?iso-8859-1?Q?Cxnva8cumhWoWxaJjrqmoN9VzX1GO5J4mdyNJRwmQOcmV/SkJk5Q8i4kuQ?=
 =?iso-8859-1?Q?DdO6d/PnQJs/ehBEfFAAyTrZv6GTECOAgGMvK8hp6aLPKjakZWuUY0XHdL?=
 =?iso-8859-1?Q?eLYj+2IOP0EFrnRNGuWYiS97wU8vm74AttijZb25dMKZGiSj/B8+AJV6Ly?=
 =?iso-8859-1?Q?jgcdHp+TKxRefL7kI5rBpKj13wxcivUfjdEHxbfp74TkoClv6MHnNkehTX?=
 =?iso-8859-1?Q?+mxajSyXkX1Zn3TV0zQTumo5kO0NLSrjOhFULt5zlfrfHvx7cxwb/OH5AB?=
 =?iso-8859-1?Q?ooJqZSbC2e+lU4RVnxtQ86pz82KpfmNgxgGFQ18Zxy/Fe65NiKi7UkCKq4?=
 =?iso-8859-1?Q?fjyESRpunib3a11AwXN3TuTKIbWSX2fawmIxoGCd1DST86zZfttpsLGegM?=
 =?iso-8859-1?Q?7JBZvbfhTtOFbHHNdQmAK8RAxo8sxoGyoiOfQTUaFWQeKTve3uoxxCBEPM?=
 =?iso-8859-1?Q?h5qyc9ZudIBPihB4PcIbJ5LuE6e+F7A2tOSlPO8HxOPZ9KZpKT32vgFv3H?=
 =?iso-8859-1?Q?6qV/TVUHsD6i6ozkeysZPyITIm4odSDsRvf5BeCYYIrvJPbIs7scSaWv6n?=
 =?iso-8859-1?Q?fgouvCtRCzaaFqFXUIKPEvFiyGltbfemEYDDIzgPcz6jQCAyhnGPcW/OrH?=
 =?iso-8859-1?Q?AGuDB32xDvmI+MhzBC5pDv19CvrQkqhL/TSovEdH0lEDra0xG2s5B38Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ed19a2-dbc6-46b0-abee-08dd456d3c65
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:42:42.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/3zSPXMYiI0GgAE63Bbz1Q027sU8Iclbi4xQ4HXi//Dvkn3wr2w3zt5gQC4MDrlv5tYDDP38u2/mXZYH/72Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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

On Tue, Feb 04, 2025 at 06:10:48PM +0000, Tvrtko Ursulin wrote:
> 
> On 04/02/2025 14:50, Lucas De Marchi wrote:
> > On Tue, Feb 04, 2025 at 08:58:37AM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 31/01/2025 22:31, Lucas De Marchi wrote:
> > > > Mixing style with goto and devm_add_action_or_reset() is very confusing
> > > > and error prone. Clean that up. The only missing one is one of the
> > > > display calls, but that can be done in parallel to the review of these
> > > > first patches.
> > > > 
> > > > This received limited load/unload tests on LNL and may very well not be
> > > > 100%.
> > > 
> > > Is this series hinting you are looking into making heavier
> > > refactorings in the init code? Triggered by me recently
> > > discovering
> > 
> > yes, I still need to move more display init around and some other gt
> > parts.
> > 
> > > GT-per-engine workarounds are not working?
> > 
> > it was not what triggered this - it was rather my review of the pmu
> > integration in xe when I noticed we were just continuing on a failed pmu
> > registration:
> > 
> > https://lore.kernel.org/intel-xe/lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5/
> > 
> > what's the state of your patch to fix engine registers in GT WAs?
> > Did you find a suitable place for that fix?
> 
> Status is that I found a chicken and egg where GuC load needs
> engines and engine init needs GuC. I had some vague ideas that
> something could maybe be done in two passes, but then I spotted you
> were working in init paths so parked it until I see what you were
> up to. :)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

There was some need for SRIOV that forced some refactor there
and I thought there were 2 phases, the initial with mmio only
before we could enable the ct communication. But definitely Michal
is the expert on that. And of course to take care of this sensible
SRIOV case.

> 
> Regards,
> 
> Tvrtko
> 
> > > > Lucas De Marchi (7):
> > > >   drm/xe: Fix xe_display_fini() calls
> > > >   drm/xe: Fix error handling in xe_irq_install()
> > > >   drm/xe: Fix xe_tile_init_noalloc() error propagation
> > > >   drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
> > > >   drm/xe: Cleanup unwind of gt initialization
> > > >   drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
> > > >   drm/xe: Move oa fini to xe_oa
> > > > 
> > > >  drivers/gpu/drm/xe/display/xe_display.c | 22 +++++-----
> > > >  drivers/gpu/drm/xe/display/xe_display.h |  2 -
> > > >  drivers/gpu/drm/xe/xe_device.c          | 53 ++++++++-----------------
> > > >  drivers/gpu/drm/xe/xe_gt.c              | 52 ++++++++++--------------
> > > >  drivers/gpu/drm/xe/xe_gt.h              |  1 -
> > > >  drivers/gpu/drm/xe/xe_irq.c             | 14 +------
> > > >  drivers/gpu/drm/xe/xe_oa.c              | 48 +++++++++++-----------
> > > >  drivers/gpu/drm/xe/xe_oa.h              |  1 -
> > > >  drivers/gpu/drm/xe/xe_tile.c            |  4 +-
> > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  | 17 ++++----
> > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |  2 +-
> > > >  11 files changed, 86 insertions(+), 130 deletions(-)
> > > > 
