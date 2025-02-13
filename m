Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D2C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 20:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1C10EB8B;
	Thu, 13 Feb 2025 20:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKciKPOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99BC10EB8B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739477930; x=1771013930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m1tR98SXk1NbfyqzQf9YEbip2rAIhMQigSV/z/U9z3U=;
 b=oKciKPOYUCZJ6+sQjU1iwS5T9UDZEQF6Sqy22A+esdIGPwzU0hz/Kc0v
 BgRjM7mtoiT4ojDcA3eKsdcr/TfIO+qYZhTGR5jm0kqiidi3ASySl4Gpm
 W1t4eSuaH573KHpofpf/ohX+wsqkKETs0RwoPoibSqtL8nItZo4yMtdEz
 sKzs6V/SX6/bxrz5QxctEkjbWnPio4wV5BFrc9eABFoOmkKT+j1UPqDJO
 C2ZRDeKf3teRJ2wCm1xG8DLsHzccJQ1MEQRrY0Upc5PgPP0dPFZ1uuW5U
 a+qPxucNZKFanbOeJIZvAeZuuOXed7dQHC6a0K2ZXJ4U+HSJI6TyHlesp Q==;
X-CSE-ConnectionGUID: LK0wgGWvS8mTGGU2bahNCg==
X-CSE-MsgGUID: BJJnUC5BQlmrJ40jJ+99cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40327510"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40327510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 12:18:49 -0800
X-CSE-ConnectionGUID: cAsJLCduRLCnWJ2f7fSWNw==
X-CSE-MsgGUID: iBfzxG29RqGXjJDsB7ecPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118455949"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 12:18:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 12:18:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 12:18:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 12:18:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXweegAXlHamt9+iH1ABb5zwV9xM/SOhVw3ad92ZMWItA7ZI7jV/1eC2pQBnQtdnubHm/D+a1sXw+2DNWtVWdKwgT8+k3H5AMQUYaGtZyIeC+55TmyjT1v+wm63sgVa0JrunMjTTMLBLyjAe+3WteTI+hvYXCknbdyZ6Uo0Cd5/jgjBLbaga6j1IDPn89X8qUsXuu6TqcyA7jY9CZlVByvpjSVIydGMEJ5EyeRxhgJqku3la23+dwZbMmJI0CvuZDyvjJThxKYQl0dtti9nYmsPFIPXtAsvybg4Elxh9fDaXPKgsZxxt0Ye2ZgsRkF/TJrL9xxMbVqeejpeC6mp+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Us7FofUjQ/NEC3nnntAwh8Am0a6qHsqEAHXCfXhwugo=;
 b=AYHH8o14a4YeKTKx7ziT2azmnSLnWaOw6yqxDTkZGfPfCl8U23z5aBPmbfUWBBaqTZFhVTUWIs7Qrd1wvw88ar+usfpJQuzf6Lj724bTf0Ll420qKMQYG0Fzi60KpdpGT9efXGKU21wtsGdrsABbemEKEYRchu5Rz6ysRWivy0zFtvKdMrliPdI4PlpKEf49z1bbpIKKhgEBkX0Tm0mSwwgMV4tg6hoRyZNNuxq30z9b5+TZIjiVBABcxVOY+/0ie090y4ecLGaBfOR8wzJfSVwZDZlnYaSByCWpnjYwFRG+rJKasJ3EKAbHRJXehmwA+IkoQux/cDB930VC6LIlcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Thu, 13 Feb
 2025 20:18:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 20:18:45 +0000
Date: Thu, 13 Feb 2025 12:19:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
 <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
Message-ID: <Z65T4j6Z81Hxl0so@lstrano-desk.jf.intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
 <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
 <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a01bdb-347a-4ce6-2feb-08dd4c6b9e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xeX+oZl/K88mHmMRXB2emYuOJBXk4Q2pqaYuDuryc/kX4WuPj/8pceJgdA?=
 =?iso-8859-1?Q?IuRNzx/QJ7jhTytAa2nWrjwRbUW5YHBb78eKrmP0icsCxYMNmLBrt5dfNU?=
 =?iso-8859-1?Q?ByAxeb9/L+ctym70jxV86MTQoMwAA9A7It0w7qLysRXuKmx7NRL+RgBAsD?=
 =?iso-8859-1?Q?4KI5mMM5sMeUhAA81T28+TzAhgKDn0w+6We/iOrVFegEKAtCgzYPMBOz/b?=
 =?iso-8859-1?Q?FSr1QxkMdyL2TopiiXv4FYKaO49tengFN262BmPg+mMYBA2pFEU+Ut23ej?=
 =?iso-8859-1?Q?QUJBqu6JNaNRgbThMz0PsIHz8Uujhi5fuCLKTVerfCN3o1UdijFlfF/rA1?=
 =?iso-8859-1?Q?KrbEkJO4umnZuxjwZ/to3LEYloPD1x5vWYFAnDGYK37W5+8p60W/xOUSMQ?=
 =?iso-8859-1?Q?WTRSoGn3DZH7CwPvFAQxkvtUlTwTdpR5rZMq9HBDGbtKmWZgAnYJLeEiu0?=
 =?iso-8859-1?Q?I9gM6ZLRhTymYmEuUuF4xBly7OMN94d64x6rKa63g/nRqDRshvchCQkLg0?=
 =?iso-8859-1?Q?DN/awyJ4iVR3rEfdw8mhjpjfAOugeM+4Kus0UJXh2aMctH0xLsMaeu00FT?=
 =?iso-8859-1?Q?QSwO9dhH93c2GfrVUINAG5fBFIHKRlCNIADbEl2elu99PJfNPOvlO9ePoO?=
 =?iso-8859-1?Q?eyeo9NT2bv4/R5bqq0T1iTj5oIQJmLPfTBrsq55YFV5IOk3YI2Srxw752C?=
 =?iso-8859-1?Q?2JGbaBU/NbmVm8i1l1ARItoRgSEOVMn8JtRuIFgmpAbIrqMaQ59Bfe87a1?=
 =?iso-8859-1?Q?7P2Vx9o/d5kCa+Urz9neOFiNADBu9Qi5i//fzIye+PbTvNe8h5Yja2d1ID?=
 =?iso-8859-1?Q?zbKxATa0OdsTAgO5Qur/oRDq/qYgHqenhpMMQzjYHv8TQB3Zm1UN+wgWmk?=
 =?iso-8859-1?Q?hfqY4a2Iyvx3F0WSAeeMYFrG+pM9ztVSXhoDA9sagxrfU9iYZBjlxdqW5V?=
 =?iso-8859-1?Q?b2qtZyn5WBvav41SOW8Ucb7rFMT176UMarRG1ldb7Eb2MsnkrcVkfiYsGC?=
 =?iso-8859-1?Q?ZdikkXFL7DTDsNnt7o81kLpm4U4yPaQ3eSMQ4olVo/JSjsSLL/t1CnEgm3?=
 =?iso-8859-1?Q?Gmg89E5k2BXE3/zHZHZbYNT5tGsdwgxPTR6/V3JcX3NNPSADg3janpBrdR?=
 =?iso-8859-1?Q?ArjAUbm6TKG9POOjj3gmGShtrZ395tRitldpMNsDv8jkozhH7uaHq2Pkz2?=
 =?iso-8859-1?Q?aXE7Y8XjnzEG5MAtEjDL1TlLYLcSw46EdI86DgkZJYBdccZ6igAchcF7pI?=
 =?iso-8859-1?Q?97P/d35gVB1h8KwzXoz0xS2xErJvbNH193k7Phn2y+Zutb5IE5/nOA2i98?=
 =?iso-8859-1?Q?D/lEMdfMESsxu28k02jZgtZlL07P2j4KIkOeDccNh9qgqv7VpexZqLyl5X?=
 =?iso-8859-1?Q?ogCm/9pT/tUcB9LOnsj90s8qVX6w0M7KTp8kaPmrtzpXo5w7cS5zEwdyVg?=
 =?iso-8859-1?Q?tG5ZHRgcMXvWsrLV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8OygkXfkFxsjHSBJtW0wpvgNB9j+SbLzUUcW1QG+Y7sXXfKynTeOX3utv/?=
 =?iso-8859-1?Q?64B81vFkQgTVBYrbPHulDXl6eoLja9FrYeggeHhfnSOdBNLeOxEMsgr+Ga?=
 =?iso-8859-1?Q?goEbDeTFuGXF3YVPawbnAbT1x3bpU2Suqq0fvi2tby/KcAfSjq4kxzfnmq?=
 =?iso-8859-1?Q?oB7EKaIHsD/0s20qJ5OqQ/sQiP5ld5xN6ANRUdXCXwT7wbboMInUAy8/oK?=
 =?iso-8859-1?Q?y9a/TUEWbZodiwnHihUX7xSSlyS7GzuZ9RNn7EQkXzRpzRNtcbyK4/IS6c?=
 =?iso-8859-1?Q?yt76vTuEUWs2koKbe+4tjlCsZrX4jlfxHUtHFuR0lsla9syCvD/z91h9FW?=
 =?iso-8859-1?Q?cGAAW3ItE+Wly5oMGvb1iuI4G1XC/CusoZdOZ/StOzkUnODWDgXVvcrdqD?=
 =?iso-8859-1?Q?gVO0R2yEWsiF5hRg6PXpESjFZ0teR5fnWu5t9458Fpp42uvyg9ZHnQs2kA?=
 =?iso-8859-1?Q?MxWPXm4GaVlTyoM/C6W71xGPc5QmWdoLkvDOlnNUfN0uXWX4RHf1uyfhXT?=
 =?iso-8859-1?Q?anqOyaR0CkXOqQmJ8dE84oXLWobU33pVyGgQga+WoK12KPSriKkSSuVOKa?=
 =?iso-8859-1?Q?YW54hUE9dYFLkhkc3sVl4MDIAzoN/VKBBy9uyhDPmKuKIh49/d5khSVFSl?=
 =?iso-8859-1?Q?M4JF1sv4qTYrW/3en2ZPah3chQhkHtiyBZaG+m0cta/qoaY90rqcFKQVul?=
 =?iso-8859-1?Q?u3PKZ32sq6WErIpIx21fZ+NCOsUFAeJsixnPrOE4KvK1GTNILOO8kBAGo+?=
 =?iso-8859-1?Q?TLc+Gz3hCVOe41LCE9Ej/ABXcOt2Gidqj36bKNY1e8DaDk/xmZ1m1mgxsf?=
 =?iso-8859-1?Q?25up6pFFvB0oZGP8pCTb31oUiOv94iVNFpz2aHDL/MUSVybruw+URax94F?=
 =?iso-8859-1?Q?aGjqglIUEoARCaBc8qTkiPA0z/7MMLCnLQMW+1hbu885WlUxi9S7F/IMAm?=
 =?iso-8859-1?Q?P5qlThuF1dWKL1z2a2wThRCe9iM3Mr+Lp5wGQTHj1QFpob2SGXALJmc81X?=
 =?iso-8859-1?Q?8dO0zR3X81d8lN5FVImeMlGYJflkYq/7YktzsisfJ+RVocn+ByPo3tdJDw?=
 =?iso-8859-1?Q?0bSoQr8i/uxHXIYvbOE9Df8Ap1p2sXl/vxOyp/RF6kgymPZPOHWf+iGyJo?=
 =?iso-8859-1?Q?Ll0sLhLqXdO03VB37bagAzyi/kyEIjF4tXGbjSwKRV/Es1pTuurWL7YK46?=
 =?iso-8859-1?Q?OpzRXITbB1NReOKl/kWRwIAFMoQOJiDDXKAjTvk49xM/G2n/4zcS9HONXZ?=
 =?iso-8859-1?Q?OLffirjkem92j3dVHVpYNyFRpMAuFUAkZVz2c//M1zrP1UzV9C+U8w/6RG?=
 =?iso-8859-1?Q?J2PkVDHAxCJpAT3aPKxizuP6n1ARADG9WeMKquOhLklsVzxHr7lG62Twh2?=
 =?iso-8859-1?Q?l+BuQ6p4FHGoKvqodlzSmI4hrT1ahBuk5wBLzT00xlbMM8rYuhMvJqMhmM?=
 =?iso-8859-1?Q?jU0xCN8Cbn2hrALNRcN4gUCSkQ0JmI9mpSin31/BxvqZZi4vPsl59mOpOK?=
 =?iso-8859-1?Q?TNRP5dn6WvEUp5sCniBIDwESEojEyzL236oqSXyb4d1fI0Lg9R4qKEhqZ/?=
 =?iso-8859-1?Q?tPZTmBF17LBxJ0VZE2eoZho9JiX95OHm02lW2oS12uo4ru/RhjDGIxQ2Db?=
 =?iso-8859-1?Q?K8X4CfNQiUHJGw0Riki4LOJIR/ZPIDEvfB+VWGeHQjL9yJhp5R2/UE8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a01bdb-347a-4ce6-2feb-08dd4c6b9e2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 20:18:45.7229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsBPbYBy99ZECWN0bNJw2LE/7GlPB4xp9cMQSIeYLet/7g5AsAAM2Eq5reOoCStx/S4Em5b94FDhOso2tE1khQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
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

On Thu, Feb 13, 2025 at 09:23:26AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/12/2025 10:42 PM, Dan Carpenter wrote:
> > On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
> > > On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
> > > > xe_exec_queue_kill can sleep, so we can't call it from under the lock.
> > > > We can instead move the queues to a separate list and then kill them all
> > > > after we release the lock.
> > > > 
> > > > Since being in the list is used to track whether RPM cleanup is needed,
> > > > we can no longer defer that to queue_destroy, so we perform it
> > > > immediately instead.
> > > > 
> > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
> > > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Patch LGTM but can this actually happen though? i.e. Can or do we enable
> > > PXP on LR queues?
> > > 
> > This isn't really an answer to your question, but when I reported this
> > bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
> > xe_vm_remove_compute_exec_queue().  So it's possible that this was a
> > false positive?
> 
> We currently don't have a use-case where we need a vm in preempt_fence_mode
> for a queue that uses PXP, but I didn't block the combination because there
> is a chance we might want to use it in the future (compute PXP is supported
> by the HW, even if we don't currently support it in Xe), so a user can still
> set things up that way.
> 
> > 
> > > Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
> > > catch this type of bug immediately?
> > There is a might_sleep() in down_write().  If this is a real bug that
> > would have caught it.  The problem is that people don't generally test
> > with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.
> 
> We do have CONFIG_DEBUG_ATOMIC_SLEEP enabled in CI (and I have it locally
> since I use the CI config), but since PXP + preempt_fence_mode is not an
> expected use-case we don't have any tests that cover that combination, so we
> return early from that xe_vm_remove_compute_exec_queue() and don't hit the
> down_write/might_sleep. I'll see if I can add a test to cover it, as there
> might be other issues I've missed.
> Also, I don't think it'd be right to add a might_sleep at the top of the
> exec_queue_kill() function either, because if a caller is sure that
> xe_vm_in_preempt_fence_mode() is false they should be allowed to
> call exec_queue_kill() from atomic context.

I see what you are saying here but allowing something 'like we know we
not preempt queue so it is safe to kill in an atomic conetxt' seems
risky and a very odd thing to support. IMO we just make it clear that
this function can't be called in an atomic context.

We likely have some upcoming TLB invalidation changes too which I think
will move all queues to a per VM list with the list being protected by a
sleeping lock. Removal from this list should likely be done in kill too.
This is speculation however.

I agree some test cases for preempt queues and PXP would be a good idea
if this isn't explictly disallowed at the IOCTL level.

Matt

> 
> Thanks,
> Daniele
> 
> > 
> > regards,
> > dan carpenter
> > 
> 
