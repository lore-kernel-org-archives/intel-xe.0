Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F24D10362
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 22:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92DF10E095;
	Tue, 25 Nov 2025 22:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVV5mQhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922B210E095
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764110116; x=1795646116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n0lzUV5jIVj6B03KD7Fqc1gytOheXI3aLA+hJsagFO4=;
 b=iVV5mQhRLdxj8rbqBoi7q57hU2QWq4+5DbqSLtOt27s4EDEsQlKaQl67
 4Efkp3cvlXfjDotw4rsPAnCxSpUq5Q9C6255M7HsyqwKv0+SHPG/YTQic
 ltpNl+OfcpJEgwHi+tGO2rYU/q3Ur8BrQntbURU7kMvU3GD3BF3jnQysP
 8ubXRFWk116WzAT6zGDEc+JzR6zCOqAMo3OryqHc9upmJvFWWSFLXXJFO
 vshXY+nywFpXOe40mvdjauC006p6SEkBTKTx3YhY+1srl50qFeu+LZcwR
 NyIdRAhES/rnrPT1IwFsgoG08/nhmd/VvXw9MoC5jWjWUQCkoahauxtEp w==;
X-CSE-ConnectionGUID: gy43N+CJQY+S84VtjCNbMA==
X-CSE-MsgGUID: ukO+CkzpS/SzsmOVUOCCow==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76823148"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="76823148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 14:35:15 -0800
X-CSE-ConnectionGUID: y1rNmumKRHm+ZIBBw/SiYA==
X-CSE-MsgGUID: LzM0/gbjQDSE3F0eCEBr7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="196927971"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 14:35:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 14:35:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 14:35:14 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 14:35:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBgoluXZSrwLmjYeIg1GTP97r7uDEO31+fOIA/gKNhn16ChEZKT+pgDr3+BP9xVRyWXPvMsbCo55hAZnxucDyrcXHjC8jTwYSFzatw3/nYgNHI8PZi7BSWQt8kQDsjihd+tnc3ss2SwNZtTvm/msZLLuQIGZXrBPCypG78SCsuBzDGJyM/gdCcVCkHKgWUjzCmOxSb4RTpfvMZ/ftx9Xvzz7iR09VIa7ODHkRdNM3gIbfvz5W7vDLRwZ5pdHrSD2VT+IBGQn01FVPqopOwsheB237pRuxBMsXRZdnQWpgqxFApUnV5tXNXb2RW4o5V6o8x9nPBjq3uh98u40o3ZSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bea9hAQzvcP9P2N0MJ4RKQspuF3/7ChXZsevHhTi28=;
 b=Eb96LKGMFxmUxz1ZpEUL3RDYjQq6r6wbyrdvsfpD6JS+ur0BHWFm4R8xptPRXac7LfTiZiJvqyQNJ1RQJvjahwZAV2P0lcRHj9XeaV8sq3PIgY6WY4QEeJapCWjgI6DudqM8wk6RjCFcrgC11EbthcvELeN2/KDHNpy/3nG+JpaEgLo7VPvlBoRzHgv3DxLWCfi0+QPelkiVB3CAXTXQ0AEDy/cU/c3crePMg+3l+6B7I3qNVY8o8cWhxKYcHK90OCV6h4SFNoPsb8f3zde7B6pPIPK+f5uvs9hrNkEj8S8kw/OfrhYny1H3sUZOrNTHLEIp2EATCbR1CcZHP0b/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 22:35:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 22:35:11 +0000
Date: Tue, 25 Nov 2025 14:35:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Message-ID: <aSYvHf9WLnGGWWxq@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
 <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
 <SA1PR11MB88393D5D019B5943600FCBA4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX+cMn4sFswa2HE@lstrano-desk.jf.intel.com>
 <SA1PR11MB88399ACA52B1883BE83A6D40AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB88399ACA52B1883BE83A6D40AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e263e7f-f985-4b12-36c0-08de2c72e517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EPfu0UgZjiYf32ywTZTMYCJhkDebLEBuT56z4ETh0F0ks3oZTODUN/8uFebW?=
 =?us-ascii?Q?k093b4YstX8tFlEC10quc6PU5Nx5MDFO6C8C99iHF4Z1eZFFuIWNgbm8Cj/o?=
 =?us-ascii?Q?VS7p+4CSqHV81s9u+HfWTbbIQt1U46cn2zGH9814yxtmJppb4oNFXAD6aaUg?=
 =?us-ascii?Q?YzAqx8kPkZr4gU0qPWB6l/yfNzZPkenU5G673tzjngDxKN7adL68KtE0dCi7?=
 =?us-ascii?Q?D2WhYSZj1AO1L/V22ERdsr5dnlwmRtHS1x44rmxmUCnr5YRcn4KvNCP4nb6S?=
 =?us-ascii?Q?Fc58R24lEKFDIfaO36SS7Ht8lRZhyWzHm22EvB7uy5Wh2D1alteDkynbv4dm?=
 =?us-ascii?Q?bflYHO48awjLnjWGE2o5L7/7aQSJiVmPUqXsCeMun/ZyJhyARf3uDT3qvfUf?=
 =?us-ascii?Q?YZUatYUdmGfEHrO02Yaw2f8384BigJFFn3GeqgMKrXz1g4sfUAL4gmJu1ECD?=
 =?us-ascii?Q?BMySkEMlHnAVK9vtIVKlYT5xE0CLs3Tx+btCCYLw220HmGf43EyypSqM3nmq?=
 =?us-ascii?Q?cBHyAfFMUsTdsX09tmwbO0yhMjHY7iEqv7ZFJVB/QuDIaqtqZE3EXe6wJwNs?=
 =?us-ascii?Q?FUquFksz47TyMAC49qJjXPqNYXys8aKTLUi029qpE1OGJu6HWAv3oXQQT+tw?=
 =?us-ascii?Q?ZAbhafaG6ABP4IxVQYnp74WBfX2uYRIH7zHYrRaD9dAEBK+4T3TOzUY660Od?=
 =?us-ascii?Q?2yCs3SwEHTts3sJTH+yfvjyoXFMlrZrzolmkd7vI2hNG1kV8PwnU5yH0VA5t?=
 =?us-ascii?Q?BYYl2ERp2gg/i8Gk1DlH+L24nfGH2Y9ge9RZ8L5Fi0ZOmy5NwqyuLIU9Cc9p?=
 =?us-ascii?Q?4KGGdFP9xDc/dgsiQLeuBHIul9vwobBXPdTG4YbN5RZ1v8Y0nJ3oDoMzq4Xo?=
 =?us-ascii?Q?Imvg0xGRziycOXEjW//aV1sn5sgEszQRnEDnttzmD8+syC+jhSgFwxI/TL9m?=
 =?us-ascii?Q?7s6GoksIwxHbJIG9KBQqcF8/5Y7I3ssdmuthAGjruMwEzl9lre8+NOZr4/rK?=
 =?us-ascii?Q?CPtbyjYBCCPCh/ttp7OS0WywhWhhIdfonssKLCxIxlyBComjOkhcoYnfKBeS?=
 =?us-ascii?Q?eBM9yFmSwEKcHSvLozmp5fuqlIWS2hgh8THUNVY7LI9ot2Yke4Z8S3f8xD4m?=
 =?us-ascii?Q?E5RwVVLWF0+0bmLCHCrMh7lJ5kCGChK5Szm25z5ht+AebSfrUE25E2SOh6Zw?=
 =?us-ascii?Q?3p19ORboefYOuboNK+yNgF8Tr88GrxyRnAALfX2OeLI22Zhah7WWOJX4l61e?=
 =?us-ascii?Q?8dgDuRU8y3EA6UUwqvOxRSIW+au390h4Xb/Z7KNCgr5o7UjEz22bW73vHhzX?=
 =?us-ascii?Q?FD6Y7zHR8iyjaTLev/jtJ29feeiF0r8NZgt2FHJlzI/UyJmAJcjD5MFYLj9l?=
 =?us-ascii?Q?wVpuDoHv47B60ulGmnP+DNTqxtxumxsqX6zjUwuLLvxDiNvR8wZhQreIdVre?=
 =?us-ascii?Q?94Bd29LDUqnAn+LyoVfMpf/nUXYDuMbl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jnN9Pc6pUQzPxHhoHZnC7JwulT/4E16vs6O+AUQoCZrmb365m6BhdUaz/jLt?=
 =?us-ascii?Q?1HO8VwWaMrm0AT9YxK8djoU7DUp/Lu/zUJzLEjpDyVqyeCq2lYL76f/SZA0/?=
 =?us-ascii?Q?jMfQ150AQKdei6/Sv5B5/Xe0HJNFQkOcTeBUEySiHXAAo9oa5V9K0EAwEjHX?=
 =?us-ascii?Q?dwuLs9I6Pn+/PdD7F1repkScQKjtQyO3o+a9DCBp1o/Uj/omJk2mWeWWZzSS?=
 =?us-ascii?Q?u6KowZnULeSAx+tmOi5KzC29WbMCI9EcojEL+ALn2HUZbDmOLTsqhLWVujnM?=
 =?us-ascii?Q?X5hjBE6k1yyT9Ki/7hj+bBh9nDBK72ZDWua6KKlrSBoWuAQ6PpEVdVeoNspo?=
 =?us-ascii?Q?FAwSmk6920A+Az9foVT1DRCq1P0F/ZSgFfl0P/6zSp9bknQJeGNICeHEjEyk?=
 =?us-ascii?Q?JruBjebdRb2CJULi9oEvVMrM593ZrsNCz2wjbYDm1YCQ8IbKc9JnRs6cNAUH?=
 =?us-ascii?Q?4hA/ZkQh/Jssml/GlIjOXhVUtZMmYFXQc7HVqZCy62s+mMFLQQNH+sS/dLRU?=
 =?us-ascii?Q?hN5kzAL74Ef9iAC7e7L3mizIEgfb1d6n3nJ16PpgkzpxrXnM+PoDkItNiDk6?=
 =?us-ascii?Q?on/eHrLsNbT/hqnentbUIUzxTh6+sDOobBMcVFBiOnCjIb1r3Q2GyjA/3Oj3?=
 =?us-ascii?Q?UJP4e4Va2a0KW8rE+f2lDSa2jDvGmx0pCtmefr8WNa9893Q3+EBQUg8CVGbo?=
 =?us-ascii?Q?sAltIZE5iXd1vHXk0olbQ7NGZDySstodgGFBXYK7n+Mt4uhKWGeXfgrQa7PL?=
 =?us-ascii?Q?J8PeTID/O78DeQBuM0Fgd9514GuqgzpW/TJPUDeRinKRu9R3AZj5Mf8rGErJ?=
 =?us-ascii?Q?WLwEpzY1d3vrI4u6vwFoNmqv19MVRXeexPfe4wxMrnLIqMToOAZVFIEQlfeA?=
 =?us-ascii?Q?LApY9Cw83K1aoUzDlqzmgUdlOEdC2/TabWsLBogVKYKSZarWVddyIoJDU5S1?=
 =?us-ascii?Q?yUeb3GXhVkaU6gajye55ht/CDrK2VsxurhMjpTDCtW7fZCdwifHEaWz1qsaX?=
 =?us-ascii?Q?SNL6ogKOPGYtRbIhpRO52UydmJkSuI2x/grHg8h3wSJpTXwW8JrFWYrhGf/X?=
 =?us-ascii?Q?bjpZ69hzhFGZD+llwNnSUkVgUALdcR/zDLGu95SQTNajumzZJKEjJ+RhrOCa?=
 =?us-ascii?Q?jpnrkRWAB8yKUWTNa9K9FF7AznCbPBTIpXiLChbAGRIv/k/DLZ7Q1fU5Dw3c?=
 =?us-ascii?Q?Ou8sPL/gCBToX0ITFAgVQJCpbp7rD9Qf+OBUXJajKSI8FHx/vIdpBDoLdDxD?=
 =?us-ascii?Q?E+MH9OKDxXNg88PXOdcuW9OmGmFo/sD7+vCwIn6Ke2Xz29uZ+CeUHkKSQkMC?=
 =?us-ascii?Q?Sjdk/Xy8WgFo+3PPFGRbJP4TI4BgxGdhbOVY/eR2/zHJdYEQgntQWG3HX1Hn?=
 =?us-ascii?Q?sdmQWNPB/vfdUEbOeZSJQPRf6V4qPjweooqzbvLKYxfTbsG7hKHyrqXM83FU?=
 =?us-ascii?Q?fgLD6stiRXbgmD0Yi3zpLnuqEVytn+eXblf4Aaweaj5uqRQFhQLKQsu9Ult3?=
 =?us-ascii?Q?TXQ/E+JLBoQVvAmkmjVM/aAaMWT7q0OV3WQX6Wq9DW5V5/ft0n6YLDlGING4?=
 =?us-ascii?Q?M8rR6cvaV/fdKTs4Di9CZBuNOcHme4PUN7YIrmrLXCJ7AVrfMg95nXzkWBoq?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e263e7f-f985-4b12-36c0-08de2c72e517
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 22:35:11.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlIcWrb3Mz5ePW7+zTnMjeqzMUrQvPyWhXkT9ijAX2Wp9uhbJCNJGQ5iyr/DvYgoNOJfWUBrXHws+IQiHDL4xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

On Tue, Nov 25, 2025 at 12:46:20PM -0700, Nguyen, Brian3 wrote:
> On Tuesday, November 25, 2025 11:07 AM, Matthew Brost wrote:
> > On Tue, Nov 25, 2025 at 12:01:25PM -0700, Nguyen, Brian3 wrote:
> > > On Tuesday, November 25, 2025 10:34 AM, Matthew Brost wrote:
> > > > On Tue, Nov 25, 2025 at 04:18:19AM -0700, Nguyen, Brian3 wrote:
> > > > > On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> > > > > > On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > > > > > > Page reclaim list (PRL) is preparation work for the page reclaim feature.
> > > > > > > The PRL is firstly owned by pt_update_ops and all other page
> > > > > > > reclaim operations will point back to this PRL. PRL generates
> > > > > > > its entries during the unbind page walker, updating the PRL.
> > > > > > >
> > > > > > > This PRL is restricted to a 4K page, so 512 page entries at most.
> > > > > > >
> > > > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > > > > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> > > > > > >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > > > > > > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> > > > > > >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++++++
> > > > > > >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> > > > > > >  6 files changed, 217 insertions(+)  create mode 100644
> > > > > > > drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > > > b/drivers/gpu/drm/xe/Makefile index e4b273b025d2..048e6c93271c
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
> > > > > > >  	xe_oa.o \
> > > > > > >  	xe_observation.o \
> > > > > > >  	xe_pagefault.o \
> > > > > > > +	xe_page_reclaim.o \
> > > > > > >  	xe_pat.o \
> > > > > > >  	xe_pci.o \
> > > > > > >  	xe_pcode.o \
> > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > index 4389e5a76f89..4d83461e538b 100644
> > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > @@ -9,6 +9,7 @@
> > > > > > >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> > > > > > >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> > > > > > >
> > > > > > > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> > > > > > >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> > > > > > >
> > > > > > >  #define GUC_GGTT_TOP		0xFEE00000
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..a0d15efff58c
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > @@ -0,0 +1,52 @@
> > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > +/*
> > > > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > > > +
> > > > > > > +#include <linux/bitfield.h>
> > > > > > > +#include <linux/kref.h>
> > > > > > > +#include <linux/mm.h>
> > > > > > > +#include <linux/slab.h>
> > > > > > > +
> > > > > > > +#include "xe_page_reclaim.h"
> > > > > > > +
> > > > > > > +#include "regs/xe_gt_regs.h"
> > > > > > > +#include "xe_assert.h"
> > > > > > > +#include "xe_macros.h"
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > > > > > > + * @prl: Page reclaim list to reset
> > > > > > > + *
> > > > > > > + * Clears the entries pointer and marks the list as invalid
> > > > > > > +so
> > > > > > > + * future use know PRL is unusable. It is expected that the
> > > > > > > +entries
> > > > > > > + * have already been released.
> > > > > > > + */
> > > > > > > +void xe_page_reclaim_list_invalidate(struct
> > > > > > > +xe_page_reclaim_list
> > > > > > > +*prl) {
> > > > > > > +	prl->entries = NULL;
> > > > > > > +	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST; }
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * xe_page_reclaim_list_alloc_entries() - Allocate page
> > > > > > > +reclaim list entries
> > > > > > > + * @prl: Page reclaim list to allocate entries for
> > > > > > > + *
> > > > > > > + * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
> > > > > > > + */
> > > > > > > +int xe_page_reclaim_list_alloc_entries(struct
> > > > > > > +xe_page_reclaim_list
> > > > > > > +*prl) {
> > > > > > > +	struct page *page;
> > > > > > > +
> > > > > > > +	XE_WARN_ON(prl->entries != NULL);
> > > > > > > +	if (prl->entries)
> > > > > > > +		return 0;
> > > > > > > +
> > > > > > > +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > > > > +	if (page) {
> > > > > > > +		prl->entries = page_address(page);
> > > > > > > +		prl->num_entries = 0;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return page ? 0 : -ENOMEM;
> > > > > > > +}
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..d066d7d97f79
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > @@ -0,0 +1,49 @@
> > > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > > +/*
> > > > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > > > +
> > > > > > > +#ifndef _XE_PAGE_RECLAIM_H_
> > > > > > > +#define _XE_PAGE_RECLAIM_H_
> > > > > > > +
> > > > > > > +#include <linux/kref.h>
> > > > > > > +#include <linux/mm.h>
> > > > > > > +#include <linux/slab.h>
> > > > > > > +#include <linux/types.h>
> > > > > > > +#include <linux/workqueue.h>
> > > > > > > +
> > > > > > > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > > > > > > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > > > > > > +
> > > > > > > +struct xe_guc_page_reclaim_entry {
> > > > > > > +	u32 valid:1;
> > > > > > > +	u32 reclamation_size:6;
> > > > > > > +	u32 reserved:5;
> > > > > > > +	u32 address_lo:20;
> > > > > > > +	u32 address_hi:20;
> > > > > > > +	u32 reserved1:12;
> > > > > >
> > > > > > This is wire interface with the GuC. Bitfields can based on
> > > > > > endianess of the CPU. I know this is a iGPU feature for now but
> > > > > > it could possibly change in the future, with that, to future proof can the layout of this be setup via defines / macros?
> > > > > >
> > > > >
> > > > > Sure, I moved over to the typical FIELD_PREP/GENMASK macros used
> > > > > elsewhere for the guc interfaces.
> > > > >
> > > > > > > +} __packed;
> > > > > > > +
> > > > > > > +struct xe_page_reclaim_list {
> > > > > > > +	/** @entries: array of page reclaim entries, page allocated */
> > > > > > > +	struct xe_guc_page_reclaim_entry *entries;
> > > > > > > +	/** @num_entries: number of entries */
> > > > > > > +	int num_entries;
> > > > > > > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > > > > > > +};
> > > > > > > +
> > > > > > > +void xe_page_reclaim_list_invalidate(struct
> > > > > > > +xe_page_reclaim_list *prl); int
> > > > > > > +xe_page_reclaim_list_alloc_entries(struct
> > > > > > > +xe_page_reclaim_list *prl); static inline void
> > > > > > > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries) {
> > > > > > > +	if (entries)
> > > > > > > +		get_page(virt_to_page(entries)); }
> > > > > > > +
> > > > > > > +static inline void xe_page_reclaim_entries_put(struct
> > > > > > > +xe_guc_page_reclaim_entry *entries) {
> > > > > > > +	if (entries)
> > > > > > > +		put_page(virt_to_page(entries)); }
> > > > > >
> > > > > > Kernel doc for static inlines.
> > > > > >
> > > > >
> > > > > Added.
> > > > >
> > > > > > > +
> > > > > > > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > b/drivers/gpu/drm/xe/xe_pt.c index 884127b4d97d..532a047676d4
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > @@ -12,6 +12,7 @@
> > > > > > >  #include "xe_exec_queue.h"
> > > > > > >  #include "xe_gt.h"
> > > > > > >  #include "xe_migrate.h"
> > > > > > > +#include "xe_page_reclaim.h"
> > > > > > >  #include "xe_pt_types.h"
> > > > > > >  #include "xe_pt_walk.h"
> > > > > > >  #include "xe_res_cursor.h"
> > > > > > > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> > > > > > >  	/* Output */
> > > > > > >  	/* @wupd: Structure to track the page-table updates we're building */
> > > > > > >  	struct xe_walk_update wupd;
> > > > > > > +
> > > > > > > +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> > > > > > > +	struct xe_page_reclaim_list *prl;
> > > > > > >  };
> > > > > > >
> > > > > > >  /*
> > > > > > > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr,
> > > > > > > u64 next,
> > > > > > unsigned int level,
> > > > > > >  	return false;
> > > > > > >  }
> > > > > > >
> > > > > > > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > > > > > > +children */ static bool is_large_pte(struct xe_pt *pte) {
> > > > > > > +	return pte->level == 1 && !pte->base.children; }
> > > > > > > +
> > > > > > > +/* page_size = 2^(reclamation_size + 12) */ #define
> > > > > > > +COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> > > > > > 	\
> > > > > > > +({									\
> > > > > > > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > > > > > > +	ilog2(page_size) - 12;						\
> > > > > >
> > > > > > s/12/XE_PTE_SHIFT ?
> > > > > >
> > > > >
> > > > > Done.
> > > > >
> > > > > > > +})
> > > > > > > +
> > > > > > > +static void generate_reclaim_entry(struct xe_tile *tile,
> > > > > > > +				   struct xe_page_reclaim_list *prl,
> > > > > > > +				   u64 pte,
> > > > > > > +				   struct xe_pt *xe_child)
> > > > > >
> > > > > > Nit, xe_pt can be on the same line as 'u64 pte'.
> > > > > >
> > > > >
> > > > > Done.
> > > > >
> > > > > > > +{
> > > > > > > +	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> > > > > > > +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> > > > > > > +	const u64 field_mask = GENMASK_ULL(19, 0);
> > > > > > > +	u32 reclamation_size;
> > > > > >
> > > > > > Nit, I'd make the last variable declared on the stack for readability.
> > > > > >
> > > > >
> > > > > Ahh got it, reclamation_size moved to after num_entries.
> > > > >
> > > > > > > +	const uint max_entries = XE_PAGE_RECLAIM_MAX_ENTRIES;
> > > > > > > +	int num_entries = prl->num_entries;
> > > > > > > +
> > > > > > > +	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
> > > > > > > +	xe_tile_assert(tile, reclaim_entries);
> > > > > > > +
> > > > > > > +	if (num_entries == XE_PAGE_RECLAIM_INVALID_LIST)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	/* Overflow: mark as invalid through num_entries */
> > > > > > > +	if (num_entries >= max_entries) {
> > > > > > > +		prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> > > > > > > +		return;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/**
> > > > > > > +	 * reclamation_size indicates the size of the page to be
> > > > > > > +	 * invalidated and flushed from non-coherent cache.
> > > > > > > +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> > > > > > > +	 * Only valid for these specific levels.
> > > > > > > +	 */
> > > > > > > +
> > > > > > > +	if (xe_child->level == 0 && !(pte & XE_PTE_PS64))
> > > > > > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K); /* reclamation_size = 0 */
> > > > > > > +	else if (xe_child->level == 0)
> > > > > > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 1 */
> > > > > > > +	else if (is_large_pte(xe_child))
> > > > > > > +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M); /*
> > > > > > > +reclamation_size = 2 */
> > > > > >
> > > > > > What happens if we have 1G page? That doesn't seem to be handled.
> > > > > >
> > > > >
> > > > > Page reclamation hardware does not support 1G page. This should be
> > > > > handled and fallback to standard TLB invalidation PPC flush. I can
> > > > > add
> > > >
> > > > Make sense that we fallback. I am however not seeing where this fallback occurs.
> > > >
> > >
> > > !! Ohh I got it now, I silently dropped the 1G pages... My bad. I'll
> > > follow the new changes suggested below.
> > >
> > > > > a comment somewhere discussing this but the format for PRL only
> > > > > supports 4K, 64K, and 2M pages to reclaim. I'll add a comment here
> > > > > mentioning the HW support being limited to these pages and rename
> > > > > the is_large_pte to is_2m_pte.
> > > > >
> > > > > > > +	else
> > > > > > > +		return;
> > > >
> > > > I would think for the fallback, we'd set prl->num_entries to XE_PAGE_RECLAIM_INVALID_LIST here.
> > > >
> > > > Maybe I'm missing something?
> > > >
> > > > Matt
> > > >
> > >
> > > Given the 1G page, I'll follow this idea. Invalidate the PRL, and then
> > > change the if statement in the
> > > generate_reclaim_entry() caller to accept all PTE and invalidate it in this function above.
> > >
> > > > > > > +
> > > > > > > +	reclaim_entries[num_entries].valid = 1;
> > > > > > > +	reclaim_entries[num_entries].reclamation_size =
> > > > > > > +		reclamation_size;
> > > > > > > +	reclaim_entries[num_entries].address_lo =
> > > > > > > +		FIELD_GET(field_mask, phys_addr);
> > > > > > > +	reclaim_entries[num_entries].address_hi =
> > > > > > > +		FIELD_GET(field_mask, phys_addr >> 20);
> > > > > >
> > > > > > As suggested above, use macros/defines here to setup the entry.
> > > > > >
> > > > >
> > > > > Got it, moved over to using other standard define macros.
> > > > >
> > > > > > > +	prl->num_entries++;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
> > > > > > >  				    unsigned int level, u64 addr, u64 next,
> > > > > > >  				    struct xe_ptw **child, @@ -1579,10 +1646,27 @@ static
> > > > > > > int xe_pt_stage_unbind_entry(struct xe_ptw
> > > > > > *parent, pgoff_t offset,
> > > > > > >  				    struct xe_pt_walk *walk)  {
> > > > > > >  	struct xe_pt *xe_child = container_of(*child,
> > > > > > > typeof(*xe_child), base);
> > > > > > > +	struct xe_pt_stage_unbind_walk *xe_walk =
> > > > > > > +		container_of(walk, typeof(*xe_walk), base);
> > > > > > > +	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> > > > > > >
> > > > > > >  	XE_WARN_ON(!*child);
> > > > > > >  	XE_WARN_ON(!level);
> > > > > > >
> > > > > > > +	/* 4K and 64K Pages are level 0, large pte needs additional handling. */
> > > > > > > +	if (xe_walk->prl && (xe_child->level == 0 ||
> > > > > > > +is_large_pte(xe_child))) {
> > >
> > > So right here, I'll make the change to accept all the leafs of the
> > > walker and handle the 1G case in generate_reclaim_entry().
> > >
> > > Brian
> > >
> > 
> > It is possible we are even higher up page table tree too (e.g. with 57 bit VAs there are 2 level above 1G, 48 bits one level). We need to
> > handle those cases as fallbacks to cache flushing TLB invalidations too.
> > 
> > Matt
> > 
> 
> Was planning on just making everything else not 4K, 64K, 2M pages default to invalidating PRL.
> I believe that will handle these other levels as well? I am assuming these other levels with
> 48 bits and 57bit VA will still just look like leaf PTE with no children so I can use a simple
> (!xe_child->base.children)?
> 
> > > > > >
> > > > > > And also here? 1G pages are unhandled? Please explain.
> > > > > >
> > > > >
> > > > > As stated above, page reclamation only supports 4K, 64K, and 2M pages.
> > > > > 1G page will have to fallback to the standard tlb invalidation with PPC flush.
> > > > >
> > > > > > > +		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > > > > > > +		pgoff_t first = xe_pt_offset(addr, 0, walk);
> > > > > > > +		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> > > > > > > +
> > > > > > > +		for (pgoff_t i = 0; i < count; i++) {
> > > > > > > +			u64 pte = xe_map_rd(xe, leaf_map, (first + i) *
> > > > > > > +sizeof(u64),
> > > > > > u64);
> > > > > > > +
> > > > > > > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > > > > > +					       pte, xe_child);
> > > > > > > +		}
> > > > > > > +	}
> > > > > > > +
> > > > > > >  	xe_pt_check_kill(addr, next, level - 1, xe_child, action,
> > > > > > > walk);
> 
> Since we're on the topic of this section as well, how will xe_pt_check_kill() affect the page
> walk here? Do we need to handle some case where the whole directroy is killed before we
> look at the child pte? In that case, worthwhile to just invalidate PRL or attempt to walk it?
> 

This is what aborts the walk at higher levels. So I think here if we
abort the walk at anything above level 1, we'd need to invalidate PRL.
So I believe if xe_pt_check_kill returns true + level > 1, we invalidate
the PRL but perhaps that isn't needed at num_entries would be zero.

Matt
 
> Brian
> 
> > > > > > >
> > > > > > >  	return 0;
> > > > > > > @@ -1654,6 +1738,8 @@ static unsigned int
> > > > > > > xe_pt_stage_unbind(struct xe_tile *tile,  {
> > > > > > >  	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
> > > > > > >  	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
> > > > > > > +	struct xe_vm_pgtable_update_op *pt_update_op =
> > > > > > > +		container_of(entries, struct xe_vm_pgtable_update_op,
> > > > > > entries[0]);
> > > > > > >  	struct xe_pt_stage_unbind_walk xe_walk = {
> > > > > > >  		.base = {
> > > > > > >  			.ops = &xe_pt_stage_unbind_ops, @@ -1665,6 +1751,7 @@
> > > > > > > static unsigned int xe_pt_stage_unbind(struct xe_tile
> > > > > > *tile,
> > > > > > >  		.modified_start = start,
> > > > > > >  		.modified_end = end,
> > > > > > >  		.wupd.entries = entries,
> > > > > > > +		.prl = pt_update_op->prl,
> > > > > > >  	};
> > > > > > >  	struct xe_pt *pt = vm->pt_root[tile->id];
> > > > > > >
> > > > > > > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
> > > > > > >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > > > > >  			     struct xe_vma *vma)
> > > > > > >  {
> > > > > > > +	struct xe_device *xe = tile_to_xe(tile);
> > > > > > >  	u32 current_op = pt_update_ops->current_op;
> > > > > > >  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops-
> > > > > > >ops[current_op];
> > > > > > >  	int err;
> > > > > > > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
> > > > > > >  	pt_op->vma = vma;
> > > > > > >  	pt_op->bind = false;
> > > > > > >  	pt_op->rebind = false;
> > > > > > > +	/* Maintain one PRL located in pt_update_ops that all others
> > > > > > > +in unbind op
> > > > > > reference */
> > > > > > > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries) {
> > > > > > > +		err = xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > > > > > > +		if (err < 0)
> > > > > > > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > >
> > > > > > I don't think you need to call xe_page_reclaim_list_invalidate, right?
> > > > > > If xe_page_reclaim_list_alloc_entries fails the prl should be in the init state.
> > > > > >
> > > > >
> > > > > Yes. I'll drop this call for now then.
> > > > >
> > > > > > > +	}
> > > > > > > +	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl :
> > > > > > > +NULL;
> > > > > > >
> > > > > > >  	err = vma_reserve_fences(tile_to_xe(tile), vma);
> > > > > > >  	if (err)
> > > > > > > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct
> > > > > > > xe_tile *tile,
> > > > > > >
> > > > > > >  	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> > > > > > >  						vma, NULL, pt_op->entries);
> > > > > > > +	/* Free PRL if list declared as invalid */
> > > > > > > +	if (pt_update_ops->prl.entries &&
> > > > > > > +	    pt_update_ops->prl.num_entries == XE_PAGE_RECLAIM_INVALID_LIST) {
> > > > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > > +		pt_op->prl = NULL;
> > > > > > > +		pt_update_ops->prl.entries = NULL;
> > > > > >
> > > > > > Call xe_page_reclaim_list_invalidate for clarity?
> > > > > >
> > > > >
> > > > > Updated.
> > > > >
> > > > > > > +	}
> > > > > > >
> > > > > > >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > > > > > >  				pt_op->num_entries, false); @@ -1979,6 +2081,7 @@ static
> > > > > > > int unbind_range_prepare(struct xe_vm *vm,
> > > > > > >  	pt_op->vma = XE_INVALID_VMA;
> > > > > > >  	pt_op->bind = false;
> > > > > > >  	pt_op->rebind = false;
> > > > > > > +	pt_op->prl = NULL;
> > > > > > >
> > > > > > >  	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
> > > > > > >  						pt_op->entries);
> > > > > > > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> > > > > > xe_vm_pgtable_update_ops *pt_update_ops)
> > > > > > >  	init_llist_head(&pt_update_ops->deferred);
> > > > > > >  	pt_update_ops->start = ~0x0ull;
> > > > > > >  	pt_update_ops->last = 0x0ull;
> > > > > > > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > >
> > > > > > Can we introduce a function called xe_page_reclaim_list_init for
> > > > > > clarity? It might do the same thing as
> > > > > > xe_page_reclaim_list_invalidate but it would make this a little
> > > > > > more clear. Likewise later in the series when a job is created, you can call xe_page_reclaim_list_init there too.
> > > > > >
> > > > >
> > > > > Sure, I'll write another helper for this and modify both those PRL creation points.
> > > > >
> > > > > > >  }
> > > > > > >
> > > > > > >  /**
> > > > > > > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > > > > >  		&vops->pt_update_ops[tile->id];
> > > > > > >  	int i;
> > > > > > >
> > > > > > > +	if (pt_update_ops->prl.entries) {
> > > > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > > > +	}
> > > > > > > +
> > > > > > >  	lockdep_assert_held(&vops->vm->lock);
> > > > > > >  	xe_vm_assert_held(vops->vm);
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > index 881f01e14db8..26e5295f118e 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > @@ -8,6 +8,7 @@
> > > > > > >
> > > > > > >  #include <linux/types.h>
> > > > > > >
> > > > > > > +#include "xe_page_reclaim.h"
> > > > > > >  #include "xe_pt_walk.h"
> > > > > > >
> > > > > > >  struct xe_bo;
> > > > > > > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> > > > > > >  	bool bind;
> > > > > > >  	/** @rebind: is a rebind */
> > > > > > >  	bool rebind;
> > > > > > > +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> > > > > > > +	struct xe_page_reclaim_list *prl;
> > > > > >
> > > > > > Can you move this above the bools in the layout of
> > > > > > xe_vm_pgtable_update_op, likely just below "struct xe_vma".
> > > > > >
> > > > >
> > > > > Ahh got it. Moved.
> > > > >
> > > > > > >  };
> > > > > > >
> > > > > > >  /** struct xe_vm_pgtable_update_ops: page table update
> > > > > > > operations */ @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
> > > > > > >  	 * slots are idle.
> > > > > > >  	 */
> > > > > > >  	bool wait_vm_kernel;
> > > > > > > +	/** @prl: embedded page reclaim list */
> > > > > > > +	struct xe_page_reclaim_list prl;
> > > > > >
> > > > > > Same thing here, move just below "struct xe_exec_queue".
> > > > > >
> > > > > > Matt
> > > > > >
> > > > >
> > > > > Moved.
> > > > >
> > > > > Brian
> > > > >
> > > > > > >  };
> > > > > > >
> > > > > > >  #endif
> > > > > > > --
> > > > > > > 2.51.2
> > > > > > >
