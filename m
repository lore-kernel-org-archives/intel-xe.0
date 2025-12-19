Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E67FD7879F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D56810E004;
	Fri, 19 Dec 2025 16:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+Y3FABm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9817A10E004
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766163224; x=1797699224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m1eopFGaMqjQ1oMOITu+5MizbzyNovYHPA/EOrNg4n4=;
 b=c+Y3FABmIVKVWGtUGaTKAKmF7xmdxg/FAU7EPBRpitvLU4fMIFsgnHS8
 gkM0of6nnX/vb8SGIHQRel8ajasxK/HlHP9IISGThV07VbjArhXgYiOq7
 2u5g0ya6iDODm64Lg5XcMI9pqu6TkNoQx2fGJQB5+jAlwyBllqUsz9ylA
 deV/9DtwzVbrhjdDGyW8VGrlwfjmYZ+p9ScDdcKE6oCcmIXFhoVcXHqe0
 xbqYT2Mx6/gjfNda8h5uIZoYI5sQLQc2CRrZEIEuNBV/BxhxlvdEkoQiw
 t01qMDHfYaHH1V9KS+RUTPzoodrcnXWMz5WZ5GBLrNDVdYWjgPZ7JkiNh A==;
X-CSE-ConnectionGUID: 8CUGhzxYR6OTEWK0chILYg==
X-CSE-MsgGUID: jG3DRIwaTDSdOpjit++n+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78761137"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78761137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:53:44 -0800
X-CSE-ConnectionGUID: 7h3uJAiiSBal9R0ZGQtAQA==
X-CSE-MsgGUID: VbdmPbjARjm+pvzZ6iyn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203300617"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:53:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:53:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:53:43 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:53:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1+sa0sp5EouUlWL/fT9XrQg9bJgdksqzRu8XyY6qqHYGerQc/PwwMXtP0xUC0F8WtSqLPvV+TxrHpq+jIefYMrKjDQa5sUKy/JS4n2/b4u73fdziyCIXh0aqMpKk0pn/G80+61ZOG41+mU+WdOwW5gqcqc0hJDhn5BqF+p4J74NwXSRgtMD0sNYqBjsJX8l0Tgc4x0gSXRLkmGiHD9FlSUmIrq4xKzJSc2pi5yiwGXyBLhd34RtqRR/bZ63moRRCBEULwoY33itxPLWN4qVi2WMT0KRm3VmWtLEFSyxcg+CBMVwt8Pr3Ay6BgqsBgBee/W7c5Ie1IFkistZbT2AnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaGp9o6bwZIwHbsvXea/UeZCVo9nsM9L1ZkQzpnz/tA=;
 b=vPMcbLP873liD1ZpJYTJfAvpAhxzWAlsXglOd55n5m3aRJGto/FI77PHcMFKhAK0BJw/yILz2dNzXuzpkc0RR6QQ12sOVE4qFMNsPOMtKg6gY4RD3gGz79LkpMmuZSZ6JdhBNrNckliLeXwHuriMepsOQMpBiNfZPl8jM+OzKnUQdwH4yTWKWsS7lvE6L2xrGb2z5Pn8cMfjy1b7FxsebFfZ4pS0dFYh6y7OItTC549cTJVUyn+rocvfJBl+1BwflwiHnqmKz0oCgr2Q0uL2GMsP1byMPumEsImvN9N7pUq4cWbwSF0Izxy+FvcuddYkGlAd+8ZUbocdlXBUEfMyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:53:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 16:53:38 +0000
Date: Fri, 19 Dec 2025 08:53:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
Message-ID: <20251219165335.GP4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
 <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4804c94c-2e71-44fd-9504-08de3f1f27cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TefBj6Bgi9DSFq6HzQFouzL4vTS92zQLAQ8qGOzxU8M3PJSjX+Dw+TPX5RDj?=
 =?us-ascii?Q?SHfafl0OTplgAyjQlPcOIKuGwUZPO2wj9h5SVaou3oEool68Y8R8FuU/DFlf?=
 =?us-ascii?Q?reDaacgKweNDHXBq0917OlFDw9rH/Iiq5ReRJR3xBhZOrK52abOD0JL98iiy?=
 =?us-ascii?Q?rV+jjsZ2YEDcSirTAKBgh8iXqtwqmVBwvK31AyQ1MXuM53RbGFQ7iVTEweX7?=
 =?us-ascii?Q?RtwTVRtaV0cF/iO2gfc4ZDXzAsNDeAJ/5527wmdi2ndA/aVucJlkk3p7Cmi2?=
 =?us-ascii?Q?XysAkiI8e85Tvrm5JBaIQD4FYfOG4x/1sr/b1F/sGXJdCLXourNMTawB5i0q?=
 =?us-ascii?Q?QNaSVi2qnRBDvKI4czZKA243wTEyP778HB0e1lZ02GkzJ+5uLI7lWy1qmIKX?=
 =?us-ascii?Q?K5eiujMwVMtmrBhqAypH0F3jc0PxNutTO7BfEbT8HJM9VfKL9jxb7k72TzNQ?=
 =?us-ascii?Q?avPy8LcRqhhLDbwzOA1+y95H6xI3eg/jA96pxEkUbkjwLrhg2No6cAX2kdiM?=
 =?us-ascii?Q?juLC5JSy81Lcngtrva2T6zf3U3L9dvvxuyxXC+pUsaFPE4gHvKRq5OXuT0nX?=
 =?us-ascii?Q?RFQHtnVQhBCU5mFPkRnToA/nBD5Zf+Oz69sVKhza/DzaFasXSJBfzkbjdQ/m?=
 =?us-ascii?Q?215zXps8w20PVemYZtebQfTRr7Cu7CGoyN3eGiWYr45RWBrhuPZd6GA8iM1y?=
 =?us-ascii?Q?63cIdK5AxspqAZg1jK5zT4aB7geP/hX4MNtj0b66jZN5Cl58fG4igD+JDnKu?=
 =?us-ascii?Q?Lq2HNmfyPaZfBwst4kGl9luliJNYcLl5YlP6AKkakzixbi+Y4hMnbcxct0VZ?=
 =?us-ascii?Q?TUw1nX3lXHC5RDPo/8kUK+BWWaPc1DwFVg1e/eXcItGkqEiy9hx/gxmCXRAL?=
 =?us-ascii?Q?qea5pCGtAXiXQlgPqj+VY58MKhqJ0mZrIYA9XcPOG0Ea2BYPvDo6dh1Z4NKX?=
 =?us-ascii?Q?EW573enXkE1d+d2IXPPRzQOUi1lUZpzKTU+JxpqcaxzoxuHZDQ8kB5Jk2q1X?=
 =?us-ascii?Q?4ki8Wk6Qr6KITMBQIdgW7G/eIFBItoLs9BrXNn5+EpilfL5Ztci/q5Bl8Af0?=
 =?us-ascii?Q?U9JhpgUHO5YZw/Aq8ZuyLTonBRF6AJ4FHNVci/3N6Zc7/968QPzWU3stPoda?=
 =?us-ascii?Q?O3SIpkfnFmZPmJ8PGxo5HV9qfnzHoCLp/pUPHGZ/ZSuIkDfl8S5JAcFwuIS3?=
 =?us-ascii?Q?ZpAChaSReJkpR+Jpg0Sk50RUH6kAPj54B/uEgmGNvD0Z6TVE1Wk2Z1qJpXQ5?=
 =?us-ascii?Q?yT2nsOb41nqk/WUmw5NlF7KzCMJ5OfUTHnBzW9z7XDVvobrCaUrYp7Oe5KBM?=
 =?us-ascii?Q?M+6+t9LHZAsh+9U0XbtNN39+CdhgxHuvuD3aVYyHtJfUCjfHApfHCZJinAQP?=
 =?us-ascii?Q?2L8RwTWg9fWC0POahj9FqE9GA/LzatnSICw/4bGS7u3x/FHCTjiYxpR2pvcv?=
 =?us-ascii?Q?VmLmpqlSdUlPq8/s570qOUNXx9zw0pxQyruBhJRLXwTUQ+/5E0ZWyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GMlODLjVnB2+OBGoqiu8OutCbqBTBIxtFl3aogFZmSgn5z3pD7QfrGjghERh?=
 =?us-ascii?Q?2q1IUfzwBUqrYPfpJ+E1NASpJMoQ49sSTC2iE+6J7kAZnjpXC9pVDp4nMrhx?=
 =?us-ascii?Q?5PPG0jFH4U+amzsmyNp5Y7NRBfk9lKqHB/iwsiC6YKwgoCkR7HGSLlj2yIBi?=
 =?us-ascii?Q?OulEzgcOAvjBCHgQyvKOXiN8taMvwA3dikRtyt+O2Kqs4NK6W4MB9dC8GV3E?=
 =?us-ascii?Q?ILUblQuCxy6SOuDDZ67WSHEIFC3OJ2m4mxrds3l5TiqaSrMdW2qkHpn3KIPD?=
 =?us-ascii?Q?fDnCGF2UANats2tm218bMdhFkC2eUH84jJnOx347UmgyEqrnYZiAwwGRIscI?=
 =?us-ascii?Q?iWxPjz786fY25hcFo7Ls7xxRCaEELSk+K7hNLiRhnu7ahGy6ccZhzazGz2VY?=
 =?us-ascii?Q?LazFa9LMf2f+NCPj72TuVN6InbI2Lyxeq3goAo1K8NjhoKeEPAoN342r9e4s?=
 =?us-ascii?Q?MQU6z3WjFky/5fukFsH5yCHFY9ODtJy4+QkzcQAFK3kgJH5JWyXnu8t6uzWn?=
 =?us-ascii?Q?Iqe8oOiHu1oOXTEB2cKUSQwDAaxWuu+1DkT2sPhdfeq0miZuvjZQySYQIVcM?=
 =?us-ascii?Q?Me7uAPQAS9bxzCkbZYqt6lUuVhra/xIX4ZleSspiZ3VycU9z46ho8IuAD5JE?=
 =?us-ascii?Q?rRrsByVIUNypzj1mU5nRQBIHsxZgp6AAB8G8g2MNMxlJ5Xch1gI9LOvqRknm?=
 =?us-ascii?Q?QYkQtkfdebLawd0eXm8+ucjzNob5VoUu5KsMdFoCtAF5RPCyoeZajQ78duIP?=
 =?us-ascii?Q?FZJoOF2jEvPKgALnUiXZGGZRrOxQPTnSJ6LlE1N283pDCDePMoGc5mXDWxLk?=
 =?us-ascii?Q?KibcTZbXWIUl0AbQdZMIxORWkXdlM0GMvYZZXXJw+ZHSgHffyvm0v90LMawe?=
 =?us-ascii?Q?JJznuAXQw0/r2PGiZeJ6KQPftSlKrFT6WLkIB7Q6SiDMXGdicR3iOnCcwVR0?=
 =?us-ascii?Q?0vFp75xTE7x6H7upi7w+sxImP4h5iv54wbf1bVlxyHur5r18njRU//azl70J?=
 =?us-ascii?Q?OaykuyxdND3/pAwRkXL34fpnygxF1qyVvbWKVOwX6b+ENIai/77f+vkREHQp?=
 =?us-ascii?Q?0vb/jP16UukbxmKXQ1wt869KIUQdoBaTnkz7lBROqLBbZkDhaplrDDURrm30?=
 =?us-ascii?Q?fAF9mfBbvHeTu+W2ScEocUabwa30+fr4YeG339x2mjhE2MuLWAuhMSlMG6Ve?=
 =?us-ascii?Q?wIX5xGir6CYtzlyD/xallEoEqhE3SICytPW30oGqhktoraF0/+V/izX0Xu4E?=
 =?us-ascii?Q?rTOlFxV3ZbVvjrMujxmvurkpwBYcpeP88i+DzGmcEAByGqYjD9vLjTDAmY5J?=
 =?us-ascii?Q?55XyTg81y0qYJIDLb9d+LdIGhDdrxYmbIynj5u85wR/e7HUCLn4k/ujNEkCl?=
 =?us-ascii?Q?h6ZviUXgahEQ3MoFiWHuDU0TFm5iTuq+6pgdqCGy+8KWEkwJb5GUrBc/xhRu?=
 =?us-ascii?Q?6V0BIXQXTP8tyer8fFq9R1rSJ5sOeqCqcq2k19qGQR+vonqLotEj/Spi96x7?=
 =?us-ascii?Q?y0c0HxbEfI/CETKzXjz2IExDeN4R4RKlr5pKA51lohTADEXItIo3M93etOyq?=
 =?us-ascii?Q?UwZQDpEK1mnr4D23tQ9zaoYB/CIgiSCWBr5jz9ndYSgCyhqEqeKBFsDWvaFa?=
 =?us-ascii?Q?+ux2jD7uROp3hGBKrMxMcYbaAm0kbRTVl7aJeYh9B6CWkXHC1rqe6LPYP7rD?=
 =?us-ascii?Q?N510JiBE0dFl/wprfBqCZGB+1GoGM2K4AYgWY8cgn0iusgqjx0J1lX/2wx0V?=
 =?us-ascii?Q?pi0z35Q9QfGq+kIqG3P9HQQDZEmTE9Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4804c94c-2e71-44fd-9504-08de3f1f27cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:53:37.9078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ouwt78ReER3JSRZFVjPoPDEoB7GOTLUtv5foOXsUWhZ9GbeIeEyGVldfru+D3QbnCFEBPBApNuByYezRoUA1VsdldhTD0YS94HKSDF9tyLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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

On Fri, Dec 19, 2025 at 05:42:36PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 12/19/2025 5:32 PM, Matt Roper wrote:
> > On Fri, Dec 19, 2025 at 11:04:06AM -0500, Rodrigo Vivi wrote:
> >> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
> >>> Xe driver uses configfs functions to expose configuration to userspace.
> >>> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
> >>> undefined reference errors occur.
> >>
> >> Perhaps we don't need  this middle phrase. Only the first and the last.
> >> But anyway, we need the patch in. I just pushed it.
> >>
> >> Thanks,
> >> Rodrigo.
> >>
> >>> Add select CONFIGFS_FS to ensure configfs is built at minimum required
> >>> level.
> > 
> > If we make this change, shouldn't we also remove all of the #ifdef logic
> > we have to support running without configfs?
> 
> but is it a good idea to always back select CONFIGFS ?
> maybe the actual fix should be like this:
> 
> -xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> +
> +ifdef CONFIG_CONFIGFS_FS
> +       xe-y += xe_configfs.o
> +endif

Yeah, that looks like a better solution since it doesn't force users to
enable something extra in their kconfig that they may not want or need.


Matt

> 
> 
> > 
> > 
> > Matt
> > 
> >>>
> >>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
> >>> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
> >>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> >>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> >>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/Kconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> >>> index 4b288eb3f5b0..1094c5fc5bdf 100644
> >>> --- a/drivers/gpu/drm/xe/Kconfig
> >>> +++ b/drivers/gpu/drm/xe/Kconfig
> >>> @@ -46,6 +46,7 @@ config DRM_XE
> >>>  	select WANT_DEV_COREDUMP
> >>>  	select AUXILIARY_BUS
> >>>  	select REGMAP if I2C
> >>> +	select CONFIGFS_FS
> >>>  	help
> >>>  	  Driver for Intel Xe2 series GPUs and later. Experimental support
> >>>  	  for Xe series is also available.
> >>> -- 
> >>> 2.47.1
> >>>
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
