Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A4C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 20:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACFF10E4E8;
	Mon, 17 Jun 2024 20:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LK19CTZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445B710E4E8
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718656125; x=1750192125;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gHyiiVmlD3IQQ5WmbE0+M+ruKU/Uabt/C39Y/lYTYvU=;
 b=LK19CTZj9s7IWA+d+2PNtU0UNoXBlstAwjmyD2uNA0ZBw/R+3yC48y2y
 MjMvT59ZkNjatCmJhQK1unrZNjK7Z6cBvDJ9hVbWnYLHhuBXez6oWau3X
 RLKYUcJdB3iwSCe3ApOY949OxaaakrfoP/IIxky/FboqsyPSkYgE4cfad
 6BNrsiW0xbbEFEqF5MyzPgO+Hp2NnmRzKeQAD9tUOxv8Tv2YFWI/kjqJ2
 H1U7SArNeP1N5X2zNbOKvNOZdgoJ4KXabfGgt2ns6XWxbqlsPtku7chzh
 b+qyN5P2uVvCDHefSkaLLqFTS0jiJGgqE3xeT+d33UIRaQweNKqz2JFnT Q==;
X-CSE-ConnectionGUID: rp6kE47fT6OcJx3qIMBh4w==
X-CSE-MsgGUID: MKVCw5D1RGu8bdOCnkBAhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33041121"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="33041121"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 13:28:45 -0700
X-CSE-ConnectionGUID: JhuuVZI/T06msQwFIHrOSg==
X-CSE-MsgGUID: mcZZYNbnTcqszUzkrOer7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="46225784"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 13:28:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 13:28:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 13:28:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 13:28:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 13:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl+qoSCGAhgKyLkU5X5qgX3LDRX43Q74hdfGovKceP+2glA2yZyGEV4h3tCjSPtsOQ+6DVXIaHyY1xM1IoVuAFiOCPjprPJojW40vJnD3ROJ90ZQhzKt+yLGHhFnw3fC5cOZiMo6JsqCGb/bSz/9QEv0brTLULIpw2zoToq6BvpoxL9VmJUImVgSIuuhwyMF5VX8I29mrL0yY9pZ8BKw9At7x+kM0ciP4dYW8acKc/Ah4AYHdJlF9GBfTc0tEDTw9lyOmxUEvzBEbea5SAmKMzTGBxdmLnwaC7ozhgu+3em33xC1P+wqNqfbofWnQYCT9gRCFoue6yb6/e7fz5v3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pws8ioAL8Fm+GVNf/NyH0qzcsh2hiiDLzCx2KqpXG7w=;
 b=Y7gSaM0reyGnALlvTZZS6I4EkvEt6RwIPBMrkRuKUZJ4tJ11jOgBquSGR3nri4gBWnKVTflXGkamrz7XZYDqNpD7UkvcyL+IemhG4MVMRO61FTkKdee196jz1+B9U7GChI5abcz/Y4wEsNZjRFZZzkIFDb+nXlqkJ2i6YI9F1GCRxspLBvGnszBG7QxufYrntDlrG5Hn93c7o4W5tOs7APZN28Kbx6Eq7bhlixIRQVG/d0CeLY/u/AvDgptRyo5iR5ZxsUS7NMz2TTs3qfThYSQeqI+eT7BwkAYVYrpHeTxi68MItVHtygEftDF9/wDK8uZsvPssSst7/V2l45CDHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 20:28:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 20:28:41 +0000
Date: Mon, 17 Jun 2024 13:28:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
Message-ID: <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
 <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 66550b3e-c4a0-4939-4afc-08dc8f0c137d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NsEY+/8ZW19AZj051iXfQrN8ZqIYY0MOHI8KczN1U58Bsll0Sc2v/nnLCK?=
 =?iso-8859-1?Q?J1/QX+/cVZMIrmLReLRKSRxVYoCO855br1e0ypK0krup9ka6XK/3hobPC7?=
 =?iso-8859-1?Q?65uiVQO4X26AdtMp5dCi0B6u8m7EgTMB6+hLi9zoWMCtbNR5yXJqrB82If?=
 =?iso-8859-1?Q?7MG+My5Reqy+X4iIqWVOLqt1UGPxY5EuSy8MdmG4s18P7m7fqOA4+GlEaL?=
 =?iso-8859-1?Q?k+FkiuTSlMaJlG2E3GBZfVLiHgzaknfSYUEdPekch3p/O32YhVC8svFBQv?=
 =?iso-8859-1?Q?WTlPyNUH4zXgXbqJ7Ure7CT7RePDkWdlwLYwufrbZjLOPGB4cO6dA6MExj?=
 =?iso-8859-1?Q?+KnMD/LcMNV08Bb3UZ/Do40yXsRPXjHEyVBZ4lWlG0QKwx0YRthROEtRrx?=
 =?iso-8859-1?Q?pbd8ZNTO8gKXqNP2YFdp1di+wHvhxfT2+4y1A8CHnZISL9JmNaqF6vHUeT?=
 =?iso-8859-1?Q?wr32a5thFczPJEFoH1fW9GBEp5w+Axf+X83Z1oOroAqVF2n6dqcAnNNGjk?=
 =?iso-8859-1?Q?rGLCRiiak13dOJvxrSyo4aeWOX5t3cWzQoZQ/bk0XMMpevnUfaGjMORl9f?=
 =?iso-8859-1?Q?5r2d6gKxp9geb5WKu17xvGYp67hq48/ELgnoAJMFX2ihnkQzWVXc84h0ty?=
 =?iso-8859-1?Q?TzMLKaAb/7CY63C705wvCF6qxkWOUYW3XxUPjce+0F3lg66T+vW1SbYsB/?=
 =?iso-8859-1?Q?offGtOb1LVU84vYxdltQ/Y4JCvw8rcHsbVv+ex11Hge1bCmfjGwZ2ThMuq?=
 =?iso-8859-1?Q?X9DjW3o9NNR/RPxmOyfueqS5q8iAVdDLquCBMYkXqSweELVygHNf7vLX2b?=
 =?iso-8859-1?Q?prg7MioHM1f/1PqhIK0oVTP4BD/cVNr8YB06iH2d/JLnX4LLBeYnfU5bBM?=
 =?iso-8859-1?Q?u57rOMFwJb+HTo379rEt+crVorcRC5OQKWjkS/5/os9G/uKu+Uq/yG1zCp?=
 =?iso-8859-1?Q?2gwFkTqSJSp0ny2GorUFmTa8s6L2IlLs6k2ye8WCvgP2BAc3/TbocUxVW3?=
 =?iso-8859-1?Q?brUvxn/1Ov/wgGFFXEIxGFhuai+c0FJq6GRehl0Fmh57U0U5gDRsYW9TIj?=
 =?iso-8859-1?Q?aRpcdqYy5cBL1MaFhiq7bl+VIfpaP1lrrjwgjkpLoJPe1UC4kZBY8Ex+n7?=
 =?iso-8859-1?Q?Hh6vmhAqgpbzvlZPPSqHwRQThGNqZFix8cBrlbTbH1lunbrhaFvUdhrMCq?=
 =?iso-8859-1?Q?xll5eAM8HYsdgtmHf21J3lcj4eVU8E3h3PwT9GWzp7DO5A8vs2GS3LSWoO?=
 =?iso-8859-1?Q?YHlfyh4YVfbsqV6ZJ/ZkLwM6Re8gTGS7Lm5ShtXY3voL1pnPE3v3u7PpLJ?=
 =?iso-8859-1?Q?DOCiDaKeg3vGviKKfm1omhBR2Snwfeof6cmYTckSicH+McFzBq/TdsU4Nz?=
 =?iso-8859-1?Q?//kCJp0SrH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DLzhprYx+/jx0nD4SRqWuA0KlOeOGfQtxgBWSRuaJiiSU9t2NUulQH+aFc?=
 =?iso-8859-1?Q?XoZH55HclpQSHHFIwpnK08GPcMLQD3c/bRvEHUagaUrjGS1NDSUWX+utFb?=
 =?iso-8859-1?Q?i3+AnSwYpsYW7Wrh5y2DBTymp/gLamHWOJ5MBM/OyybzMCy5+Eyo4OOVDc?=
 =?iso-8859-1?Q?lWkmbO6HkTUDuGunSd/yQJ4rE9Iic20hpnASPk4SxTf55KlxIswndINI9F?=
 =?iso-8859-1?Q?i9Q+JfYPCuGgCM+X9I3QYulmPnTnkcMYJtS/R8t4J00xd1v4DO3P23x7b4?=
 =?iso-8859-1?Q?mq+V4fUFBRLn/ZUuLIHacTmN2Q3LDJmnVoYx66utUF/2wRQ4JzxcPz0O14?=
 =?iso-8859-1?Q?phYQEv8aqdOWou8mZtVxkiGo/JpH41cs1vRHwxwNeKg2it791LpWQwvZaM?=
 =?iso-8859-1?Q?SOADKGt2IiHhQU9ubIXXqqEhW1bx+1J2KzCmuMpQySv53TONLGLOJhb4He?=
 =?iso-8859-1?Q?jFzAp+rQW+Nw9+R3vfZW0AE1/oJjLPMJ4KAwISZqtDrUYB1l1r8T+6f2Yn?=
 =?iso-8859-1?Q?RXBBAgLZSVZLZoksNXLTUa9/O9Z6q5x2T92y55qFieHK2CIwKuJf7sQBeC?=
 =?iso-8859-1?Q?UFhHlG1FNH9Wcj5DoQxkApvhbuAHJTvcg9oteVmuR0Ot33usdx8+0Bw5aL?=
 =?iso-8859-1?Q?ejxwcKSclRI/5b1Oy9rwacEqG0sQehQSv16+OMlH1a4FGTBKs/P38Pj8uz?=
 =?iso-8859-1?Q?jrGh/d8qEon1JU9pNWoXbeIVJb8mSR3xbiiavD/64Xe3CCQi/lVjQ/Q5xu?=
 =?iso-8859-1?Q?QPE8lV9xA5qxLsnYKaVrZEpHuLmg1ppYtQRYr4uKZeJoUCqGGdV5j+ff9c?=
 =?iso-8859-1?Q?8Pf+VHi/6fP+Zjap32lpFS3HFRK44EtJ/2c9AhBk0GUzl4dnaT+xg00Wbo?=
 =?iso-8859-1?Q?sZ6bfrepMBO4Fmh5B4MsxFto3pNhI/PzsdcotVVuTRCCPM01Rh+Ae0vomm?=
 =?iso-8859-1?Q?H/bEeqJgJ3KoqxcGPuw4NehZBslQaMvfpdemlkOJj9i9Gqq3D2hJVWvX9q?=
 =?iso-8859-1?Q?A80jb8tdzLGprdVs3U4xv+a/ORO4pxl2kZCXX53TZ1Ts41EpMYo4ejbh1U?=
 =?iso-8859-1?Q?ZXLhg1TEdJruelgQCXw+nHDfsD5irdw+gWd60IrbO5bpODxMCxNP9ySaJG?=
 =?iso-8859-1?Q?hNfpa8z0EAK22rqstOS9jKwpb8L11YEHzAVDtuRD0LK3lJ45rQ3NQS+wQQ?=
 =?iso-8859-1?Q?X9ko9HX3/189t9//wBZ7Y2JZdZvHHsm/alDbNoFopEIBGG4IiAm5x79kvk?=
 =?iso-8859-1?Q?0QCmaZgMd8imug3LbqwpC0GVNjUI22hfHbEWA6VPaaVWIxzyWw9mvdS6eL?=
 =?iso-8859-1?Q?D37FLeQyo5dCnX5f0+vgUZxK/K8sVFXsQCq4z0R7SwKUwFRWEhlLFB3c98?=
 =?iso-8859-1?Q?IaJjgSu2hJhRdKnuMB2Ffdhh4CHVv/19Z6Tk2A6OkxtfmIGReIwmzSaJmR?=
 =?iso-8859-1?Q?TiMrwSk66JxxRHOsV+XLu48wQQtMERm8NhPfMXzW6BkddCeWoqX19dpgZz?=
 =?iso-8859-1?Q?uMFZJgdq/+P6/YCmb5UasSFVd0DTvPw7TIIj0aUGBPBkFDkfnh7zfJhmaX?=
 =?iso-8859-1?Q?fQjaiYEUIBSjooKck+XF9OeN6bjH4M/8KE4OVUjA2qsfXDkPtNV4rhzb8P?=
 =?iso-8859-1?Q?2bA032eJuMaSfdS6T5wKtfuy86dptS3Se6L0ABds/DcAChYQHJeLLpLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66550b3e-c4a0-4939-4afc-08dc8f0c137d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 20:28:41.0354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nEr3fAZzROuDkHkTEBNCpIaUB8dJdSFp+O34G2DqPWstW62PxBMo4rnV0R2XGPoUu6qfCCPQib4koCBMQDeMpgEJvK14kBcpWbk+CD3z9W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

On Wed, Jun 12, 2024 at 08:03:24PM +0200, Michal Wajdeczko wrote:
> Hi Thomas,
> 
> On 11.06.2024 14:47, Thomas Hellström wrote:
> > Hi, Michal,
> > 
> > On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
> >> We should honor requested uncached mode also at the TTM layer.
> >> Otherwise, we risk losing updates to the memory based interrupts
> >> source or status vectors, as those require uncached memory.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >> Cc: Matt Roper <matthew.d.roper@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_bo.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >> index 2bae01ce4e5b..2573cc118f29 100644
> >> --- a/drivers/gpu/drm/xe/xe_bo.c
> >> +++ b/drivers/gpu/drm/xe/xe_bo.c
> >> @@ -378,6 +378,9 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> >> ttm_buffer_object *ttm_bo,
> >>  	    (xe->info.graphics_verx100 >= 1270 && bo->flags &
> >> XE_BO_FLAG_PAGETABLE))
> >>  		caching = ttm_write_combined;
> >>  
> >> +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
> >> +		caching = ttm_uncached;
> >> +
> >>  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> >> extra_pages);
> >>  	if (err) {
> >>  		kfree(tt);
> > 
> > To me the preferred method is to teach bo->cpu_caching about the
> > uncached mode and then include it in the switch statement above.
> > 
> 
> but bo->cpu_caching is currently documented as:
> 
> /**
>  * @cpu_caching: CPU caching mode. Currently only used for userspace
>  * objects.
>  */
> 
> and value 0 is implicitly reserved as kind of default, so 'teaching'
> would likely mean either extending uapi with something like:
> 
>   #define DRM_XE_GEM_CPU_CACHING_WB                      1
>   #define DRM_XE_GEM_CPU_CACHING_WC                      2
> + #define DRM_XE_GEM_CPU_CACHING_UC                      3
> 
> which will introduce lot of undesired right now code changes, or we will
> introduce internal only flag:
> 
> + #define XE_CPU_CACHING_UC                      ((u16)~0)
> 
> but that doesn't look like a clean solution.
> 
> 
> OTOH, just above this new diff chunk, there is already a code that
> updates caching mode outside the "switch statement above":
> 
> 	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> 	    (xe->info.graphics_verx100 >= 1270 &&
> 	     bo->flags & XE_BO_FLAG_PAGETABLE))
> 		caching = ttm_write_combined;
> 
> so maybe as a short term solution we can keep this patch as it's doing
> similar last resort stuff and return to 'preferred way' later:
> 
> 	if (!bo->cpu_caching && bo->flags & XE_BO_FLAG_NEEDS_UC)
> 		caching = ttm_uncached;

Yeah, cpu_caching is a "uapi only" thing at the moment (and even then is
only set in some situations).  Given the current design and assumptions
of the code, maybe it would be more clear to add an assertion like this
to help document why this is special?

        if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
                /*
                 * Valid only for internally-created buffers only, for
                 * which cpu_caching is never initialized.
                 */
                xe_assert(xe, bo->cpu_caching == 0);
                caching = ttm_uncached;
        }

If we decide we want a more general redesign of cpu_caching behavior,
that would probably be a separate change from the direct functional fix
here.


Matt

> 
> Michal

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
