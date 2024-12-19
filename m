Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA586E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 04:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB2C10E05E;
	Thu, 19 Dec 2024 04:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUkRoHQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74DC10E487
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 04:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734581719; x=1766117719;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Jj1amn/KQuUVjZqDyc9dzrJehnr7QB7frWvjSN5KM4=;
 b=cUkRoHQFe0cn17wGQFBx/2GYGVxlI1stsX6qNESTIa9PxXVVkjNND7DJ
 OluhDIq42fe5lfV3zFB0fpVzFlQmRg13EywHrSHPrPPFWduOxYLTVlvNF
 qdaA7oj9cGPUgyo66v6H8hEClZX++k2lPPclcGjkqSXWdS3LtRHPRR2yR
 LNGrwUtsoshUGbOTVpMAzDeFeGHYCRPc/EMNBaJ4iSsWQ/ecbzJM7yZ/E
 7CW8oiWuRPysF5UFoXSWfkeRUhAsOExzWWH8u5R0PS0I8Tl3VRRDvztms
 YV9yuAum9FZa2yDhhGUS3WzGHzpMkrEOKYoJTfD0luOsgSuyz29qzI0mi g==;
X-CSE-ConnectionGUID: L84hwEsgSmy8a7Hjz9OfxA==
X-CSE-MsgGUID: Uah5zotXSDK3HX0VLGoQwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45675190"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="45675190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 20:15:19 -0800
X-CSE-ConnectionGUID: K4BzzndEQfSAS6TH4NOerw==
X-CSE-MsgGUID: s/KG+BooTOuK1a2LqaObtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97906113"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 20:15:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 20:15:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 20:15:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 20:15:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/Fhexq1SN3Dg4sogodv1KDf3CsA3pJSnNT4PmOMc4/GSBCEjDaO0TYmvHDHfPoH1CB66wfEsnf0ZjeIz/MXk8S/qqaRKS5V9sDQ6txFxGsvR7R8aJvMbZJ0byQwiE32R4hLMeujzITBGwMwX8uAwSPlTURKajAmjRCLD22DGWL7NDGvxuBOVpg0d5TpUJef3c+KZ88LUS/a6Wua3bnC3vlnSvmgurf/TmawrbAxcJRL0kMXs30B7510q/DkmkAeMn6QuteV5hwcListKvU4+QiA6G1nmKcXEdsJCCbKwfSX88IbDJnjwwwMD5KDmLPOc/hz9uVMcvTlVf+NEAbCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPfGN30UXOq90eA0fKaOyxr/PIfZKuZJobOaUNDKeWA=;
 b=V/h+DZHmAo+dpxOV+wuPGos7Cg/j/NSL+DkNNScZLeuI93cD2rO+SRQOmCFyHyav5m7iQ1zUCNPqEaefvGGh6a99EhhyMk2Jc/pzcDdeyRTfgD+BkwR9VSh1+utO6TnRxlyQ2vvLeR6QSjaSCWXHhwNnWlLs+dfxMcBvYfwj6kDJem9mRX9HpikULG+vtZooOip4IPjiKGyc24xsBGhr8/Wg0nDtXGN1Bv49XGgw0Nx+u8lLMnlngraTHTrOCDHj2ZAycw5QjGEq8bMnuByPCNaZxXxqmNe70Q4aBRqxWlqHoux/DXK1VTA/a/34GLHRY/rCy7fUbTuwJt6N640wKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 04:15:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 04:15:16 +0000
Date: Wed, 18 Dec 2024 20:16:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/sa: Drop hardcoded 4K guard in sub-allocator
Message-ID: <Z2OeAfNF7FdIMQRs@lstrano-desk.jf.intel.com>
References: <20241217222246.863-1-michal.wajdeczko@intel.com>
 <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
 <aeec7c51-b04b-4805-82bb-c5f2051178f7@intel.com>
 <326e8edb-e38e-44d7-b078-2defaf01fbbf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <326e8edb-e38e-44d7-b078-2defaf01fbbf@intel.com>
X-ClientProxiedBy: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 732f08e9-ff27-47c9-8b1f-08dd1fe3be30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j+G8PIJJ2omrSVHSSbylP0gwvFXcdXu+juwqEDIoBckCwp8gqjXOjkWps/SR?=
 =?us-ascii?Q?roiYiqaZbBka14VGNYtV6kb/AcqdBALdL7/kclrPDiK/wYfCpD6RzVD+gDA2?=
 =?us-ascii?Q?yuXaoFYJ1L8xK09mJmY+guq8zNUyZ4PYqJ28U6D+bnn4bTKC02soq/BTuJh0?=
 =?us-ascii?Q?70EQpDMtYw73kiaPL7tqAXz2I1+biIVvaF1HlrvAW4P8fR/yZFN4RTrV3Pne?=
 =?us-ascii?Q?G2CeluORb1Z+NcvMXq61loj37fE6+0xda3LG6TEfWFUSeFcqg/GtEF2zhE12?=
 =?us-ascii?Q?I55jpDHd0AKbyFpoeOvJFk/D7dj76Y7hM0lwZFimUYcnaPSgBbnix+KQ+TkY?=
 =?us-ascii?Q?zMUbjIBAh9pSFAKHrCotd9efrxnm0GuWIkuiPiVjOHF9+/tkpMC5ug3enQew?=
 =?us-ascii?Q?5ayEYo6vRvqNh3j0h9U8fwJ4eZo1768ZtSqBSgM7HEidMNG1dm0kOfs6w/D9?=
 =?us-ascii?Q?iR6pVwWtHnRcjGO1UQAJlXtdoCDFM3/Ks+PL87Cm+q+ZoWoJvaXNPVItE7jW?=
 =?us-ascii?Q?/rwKuoqsSs6nAD6XjNu96opuEovobW5d7qXuZSRvqhFCofbz/v8uMo/WNFmy?=
 =?us-ascii?Q?wuSxcXw1/ZbclyjoNmYOH5/g3N0WN/cOGFFUY1k67uoNpDPO3UQem2Se7PvX?=
 =?us-ascii?Q?WHcwX/BFmyjQUXa8+pH2NkHxutzO6wDDOokXcMTaJB75S/e7AYxyYoivckG8?=
 =?us-ascii?Q?yinsg5uW2tw+YnuVo1fRXL43b3IfRnwRna2O6+65BXhUAeuqLIu0GnY0rAKi?=
 =?us-ascii?Q?IOTY606gr0fLHk+hbDnH0Ririe19VYsFcmGj9QLPACWS2vl34YazRhIY+u90?=
 =?us-ascii?Q?B+/usdRngGUa2JFtIPzUzNjl/b4oul6gTl6eP3yBim1cZtP1EtWFGe/0XRpA?=
 =?us-ascii?Q?+HiNCZ093YzZuAX710AYP5YhJyu0aztGRd19eUKGj4bl5wClKchde/tcG0Cn?=
 =?us-ascii?Q?EAcpnQa729l5YkU+HptVvfE9iI7eXxA+RpIW7BduuHYScgHK84lMpB+bsG1W?=
 =?us-ascii?Q?fb0xmqQ68qfCyTndPf1tv3TxRoagfgaj9cpEuO6/9anlzWAarTrUtbPLeUdK?=
 =?us-ascii?Q?VSVFO9d704MT1xIPcNRGZdkdRebMYsdpo1RQ8fbx0dWVBwuMlrqgYDrarxjk?=
 =?us-ascii?Q?tEjdBjbuqHeHvuPStRBP0mmGqYoX01+rqxq38hgD2GzK1AoDZbd6W3mu1PAY?=
 =?us-ascii?Q?FzBNaVMOvbx6IP6nhrjDoOojfPBdTwK/O/LE8qm7BaiAMkmSVKYn3r3RIKqs?=
 =?us-ascii?Q?+QsGiaPzevNKy5pk6oaLDagBORtE4gWJEfNmRJrd16sZYlyRfMVvqZLGwJSq?=
 =?us-ascii?Q?3UV9h1j3F3YH/FwsuU3jM7xzglZbZwpN3z+quZ6SVoZiEFR7zxHDbtXcBepY?=
 =?us-ascii?Q?6eN2eYu3YhM2gwquf+F30SD5O0wi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NXTbBGqlD8Pnn1b7Jr4aMZSklQ0ydJnC1z2+bkPIAZgdGEO62xHwS4MI7al4?=
 =?us-ascii?Q?A2cu/QsX8KNocOKMC1tx0U2l3QaeEXI3AI5W3eIPAJdBM1uxcJd3EW7doKLo?=
 =?us-ascii?Q?BFf15ahmuLu4haHLfcmefGdYfqX5nctRV9+KrwecgRVvG7rFV72b/krKlWFN?=
 =?us-ascii?Q?VUtgYfenDZilupJM/LSlv0OFb7oT+A0L6r5dRCP2OBT3sFPCGQhRDJiXG7F4?=
 =?us-ascii?Q?EUz5UwGHBL0PUcImrHZG7tXNMNDQa3TV19jzsRsvmX3RcI1S+qM5M6algfWR?=
 =?us-ascii?Q?GKEA+UvmrXDu+mPt1sjXH/oZk1SimEPk0r6UjNtnXy4gAta8jB5/E6VCw/I4?=
 =?us-ascii?Q?m+ty1OYgHMORBhrSgh5hSr+mL5my6sOtKE0b3W9/hTNgdnct1bUpHBCqs+jQ?=
 =?us-ascii?Q?IV046VZbyDxvneCQiqJ5Tg988E0VzfBWyWFxnfW39YVS910Qt4MOD9nlL/S9?=
 =?us-ascii?Q?V8jQy5OcQr3JcmwdydovY/Y2nm6I8ZHlFQ8r9FaG0CFiKgao1ciQj3eU49Ax?=
 =?us-ascii?Q?fZsMfcu6omaoN7mbUQmbeOvrPMy56U9mnoUXYzr6/V+VR+rxHtDAjFCc6Kkq?=
 =?us-ascii?Q?dWGWHKXi956U24qUbQtWqN2JyCRz/2ykfHNzTjqpHjXOhoIGfyfGJsC1/CB+?=
 =?us-ascii?Q?TmcgG44A/+0LGUEEdfKLPnTEOOAmBCoRpu2Y8Fh5vsWQRjxyhQAABIiHD7Oz?=
 =?us-ascii?Q?xeLCRC6XsXYKM5f/yTa38po/8nLNLfBBJSdTZl2Oe+TIsdzgEtZCkDAsUR1J?=
 =?us-ascii?Q?iMEkRBXWsEJOkRWq5O3iOLlSyQSG2F+3cVx28jokKgQnlso3m7GR3+cwnVb2?=
 =?us-ascii?Q?f6iTgrEFUhJyE93PCLe71IMOjTCt/3R+1zwN+PkYKuobh373hN/+pKDDTxnb?=
 =?us-ascii?Q?z47+Vn8CtQRy7sDD4HcT+UVSIL1VUhJIpSn3yF3V4gfn9t8xsAn3IemvktnW?=
 =?us-ascii?Q?fc3AnmufHnKrk3ZkDbms4uniApfC9Y3aUI5NLjHh5Fb9tD0DM0u2/qFcUX9z?=
 =?us-ascii?Q?z+7bwEP8wm0JSQZY987k/SAZldeq6+F8+hevkRgbQ1rhCqY1LZ8L6icQfevw?=
 =?us-ascii?Q?fdEqvZ++alFtQoHnjCq5/MDqhmsLX0tNd5TxyBjO9y2y9V1PontHVSwq4paw?=
 =?us-ascii?Q?3s66e10dB1RkAzcJhacI3bdzTrLcIWrzDjVIeztUp0PEQ1dgKA6cr8auVuQo?=
 =?us-ascii?Q?KFC+hsSv+UR7tI4OM02dnFtqHl0k77H8apYgwlDELOjgLqmSkLh7tlP72mPF?=
 =?us-ascii?Q?PzHcHlmr98Kj+EWrwSnAntwFUo8rUFOal4XC4EXEs/HOxHNDx+eQfegvM+2g?=
 =?us-ascii?Q?W8XckrD2pVhCfB1ObhCEOz50RlJeX8qH67m8xR5XSSUlu0niKH9qx8doFnYP?=
 =?us-ascii?Q?ioDGMl1JvgoXDjl3VnS3qhPmVrNw4abZVCS+XWXZxeAxdcCau7xhq0KbXydp?=
 =?us-ascii?Q?4RSX3BP84M0cWIK9V7NXQDtqiJaxBeb1ksvR3+fnh6WzrhTqa0tPkiyAfTot?=
 =?us-ascii?Q?U3p1ZJHDpxNqIGQUZdFKlVLA3SxCSzEGWlKRvjBGDFSmz/69w72lxMiPOIPD?=
 =?us-ascii?Q?0in0zLKOu5pf3J2cA7EmPWtAC072txMXTngyTlrZrolbK63cZ3/zulRcP8Pe?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732f08e9-ff27-47c9-8b1f-08dd1fe3be30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 04:15:16.7282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POE48NAjMbmG4YNddKKg+gNIUm85JyGRUT38FXa9uh+cQWAWD3Iq8AuU9bR5xUlJ4su1oUERJFq71mM18NhjVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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

On Wed, Dec 18, 2024 at 08:47:37PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 18.12.2024 10:15, Matthew Auld wrote:
> > On 17/12/2024 22:39, Matthew Brost wrote:
> >> On Tue, Dec 17, 2024 at 11:22:46PM +0100, Michal Wajdeczko wrote:
> >>> Any required prefetch guards are added during batch buffer
> >>> allocations anyway.
> >>>
> >>
> >> This should work but I think we actually want to do the opposite of
> >> this - drop the prefetch pad in BB allocation. This would enable a more
> >> optimial usage of each suballocation. I think that would work unless we
> >> have an odd caching issue - if caching is a problem then maybe the BB is
> >> a cacheline.
> > 
> > Also would be good to update bb_prefetch(), since current prefetch value
> > is too small for xe2+ on some engines, so the hardcoded 4K here was
> > maybe saving the day.
> 
> since I don't what would be a good value for xe2+, I'll hold with this
> patch until someone fixes the bb_prefetch()
> 

Let me post, test, a quick patch dropping the BB pad and see if it works.
I don't know enough about the GPU caching structure to know if this
create problems though.

e.g.

Job prefetchs unused memory
CPU writes unused memory
Subsequent job executes unused memory - will this read the updated memmory?

I think we have cflushes in the jobs at the end (?) but I get little
lost on exactly how our hardware works.

Michal - don't consider any of this blocking for your GuC cache series.
Easy enough to fix on top of that series.

Matt

> > 
> >>
> >> I haven't had time to try to out yet but I think we explore the above
> >> option first. If I'm missing something and the above does not work, then
> >> agree with this patch.
> >>
> >> Matt
> >>
