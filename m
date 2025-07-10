Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700AAC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8E110E235;
	Thu, 10 Jul 2025 20:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiosglbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A6B10E235
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752178140; x=1783714140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ha5YkQyttoyLsTzw7XHMRMnxT5Kb3a/UE+paacahD54=;
 b=kiosglbieMtSDavx55JZSzXJQgTcVYg8F6tg4/NamYJCFv0wWiE/8ooD
 bfxE4IxB0x4N1WNLwsono6o9t1tRwFA+hkp/XD2eDGD4RLSMwKDHjwThp
 f4Mtpa2am/sUmFpf7cThPlyChuq4w8pJP1trL3ls+Zc2NNX3GeT6bVr4G
 h6RZv7DD7IcJvwjZRTsqAUy4w02B/bIohJelsseYAc42gRyA2IYfTIIqd
 CVJXjnE7HnjqRV/cdC/CtQD+8dcyl6NYLurSMNdAutoZKK7JhSakVOCJv
 0aDn8YquWBoJxd+hi/l6nolEgLrZc6Vhs/Mf2eJqT5cVb3Ij8KUyvHMZl w==;
X-CSE-ConnectionGUID: djN05fySRhWJX1+oxZSJXA==
X-CSE-MsgGUID: bN1hgYUsQBKAMfKIUcNi6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58278558"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="58278558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:09:00 -0700
X-CSE-ConnectionGUID: qJ6q5akfTwelt49HJ4Td0Q==
X-CSE-MsgGUID: XU37Jdv0TfWFbm3Q47zuGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="155961198"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:09:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 13:08:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 13:08:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.56)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 13:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmCJly9xOJbwnuihss74FkzY8ZbnnDqJLXzxY653GPeiRFeTAF0fbF0bXsmo3jMxX9Rk457qnKkdTuNgisYZk3g2A0+13OK0q1AfV/OYGPQ70j7rWi+KzVauWCm/nir/UuWJlT4gHb7lCxVWN7kxnJlOg1TeZD5iMEhl7Qrj61meUr5wb+M1iDgQrwHdNj/mU4b2I7iCmv6jFSUZiEhzVEDEx0wST/iqh9xsbR9ugGGXZNf93ai3vOwLVJkH9B3vhg7MmE9of4Ybh08zwUykOvark4Gq4DjS9DWQs3t6X2kpSrfMwbPurm96XrzT97q9PZAIArlZMkSK2IZWlK7S7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rqgmTwenpk/BCTVM8+386x+W4sRJK2GGX1an7PTo5Y=;
 b=bnqoIkYOQ6Z2ub3hjOoHtYLFRAjmI9Hzj2whWGPRuuQgLk5BS52+CtHRH/Zfw/4pC+Z9RBoVMw4jPoEy1f9tA6oKOY9drN0Zh82JV5euH2xq7HexGDhFbOd7/O0QsP3nkD/fWhZphQhy+4hVVs8DS1pdZfzYq1/5Wl48kvwgjoFU1ZF+r/b2s8FFchuas7pU7p6FMfA4ajEiaHWJSpPhCdwVC1yjaNlbEQNc8/hLfZubd5+vDVdSk5eEIYoS7TNqr+Xklg0CNxdsEWK9IQNCodMiNii4lczg7e1DmmcqrGtz1h1q7zU8UGfdsS0LZRCWBqPTbyk3sN0TjyuLqLIb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 20:08:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 20:08:54 +0000
Date: Thu, 10 Jul 2025 13:10:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/migrate: fix copy direction in access_memory
Message-ID: <aHAePtUUGGzXw11L@lstrano-desk.jf.intel.com>
References: <20250710134128.800756-2-matthew.auld@intel.com>
 <aG/25+aNyGqoCPXn@lstrano-desk.jf.intel.com>
 <tajuqsix4mnzoqx5ctzy574oupgmbifudsw7hhi7cx2mbru57b@ejsukafklbw3>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <tajuqsix4mnzoqx5ctzy574oupgmbifudsw7hhi7cx2mbru57b@ejsukafklbw3>
X-ClientProxiedBy: MW2PR2101CA0001.namprd21.prod.outlook.com
 (2603:10b6:302:1::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c31881d-89da-4e1b-938a-08ddbfed98ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HMLz6Y4zIuwTJWJJ8ddnspyepq67pjZJP0kc4XtiVtsDL7aB0xncWUARCnZC?=
 =?us-ascii?Q?VRcDef1lQQ8H1b9tpcyCgtgebssdzgL0P49paeIcpc+yQf9Jlu7PwBGHcvm3?=
 =?us-ascii?Q?70C/7Kmv2Py9y19tdcURdTNF+9+7UsRs+N/AXTZajtrweHyAqBP7/opgju5Y?=
 =?us-ascii?Q?K0NMIo8mJ5kNz0fna2H/h/+aFr648Wt6U6jTTR9jKDSieRatNiA+cUYohdk1?=
 =?us-ascii?Q?g/1LuGZsv9A1qQ9tr4IHLVO+OITSbcZcZXpni7Peoti5W4p26aU6zJR+4HRe?=
 =?us-ascii?Q?Na3y3Mu6j0SK1qBHs8yLMYe6qZKxdW1y8jg0IAOorI+gtzbOuBV3tIIhOXIR?=
 =?us-ascii?Q?/ddFCFq3h5Q5ieRDV4CLYSPF17nFQ9qdDAA9Kqh9zJW0nx8qam+QPX6FncKe?=
 =?us-ascii?Q?wmMOd+4+JsPA/Im0MQVXZA5G2j1IFuyUvMrfjXCuf1zb3ZufnEbWXNfutSjZ?=
 =?us-ascii?Q?0Vbl3Srm9GVBMJ0lvBg4cEv4RhF3Wj4NsDAe49A12At6SlrMW/orhvvrZHT7?=
 =?us-ascii?Q?2ct0TBDbLmBOh6QEJdzB8Im7Fyq2avgq4ksjv/mJhJ8yY8CNFKHPtSmPqfUW?=
 =?us-ascii?Q?KbRuTjYgwKzAeXzF9Tn3y9V6J2hmRNB8HL+tUXwZ8HosRL3pcc7u+JkHb2d/?=
 =?us-ascii?Q?fFbkcO7fQEx/GSY3yGB+Fz2mQe1wFTeriVFI66rq7xaL9/dS3WMfoibLYB4z?=
 =?us-ascii?Q?sytgh/njyl8FS3iEtkpvRoiUREYqgWAnBxwUNHdnL2seoRFSR6KskNuUX7n/?=
 =?us-ascii?Q?+97bIOxK7UrN8P+lxfP35aGKyaTs33shTcq/p3dO+tcF1h0mifGFJ5UJKtz9?=
 =?us-ascii?Q?+C8MMsRxP9QwrkJR2wDdc6VuFQAU9dKmZkA2DK0pcZen0y79gHweUkC4ugmV?=
 =?us-ascii?Q?Rk4f/D8xNorS3IOaF5sl7zDeAvvQ3K1N+K/z6YBe9bHoSjTP1ZwEKlYiLET8?=
 =?us-ascii?Q?2MUTEb1xIgy9ot7R9ENdx16mLhtPwNTDxyxb4zK/3QrgLy6nGic50rl9nUaX?=
 =?us-ascii?Q?ng2U77xTRqAEz62S/pZqaRkzEf8rYor9NTQPSQxa1Ys3ibBBS+O2rxaaFN58?=
 =?us-ascii?Q?iEkIgl/plwRNRkbVXU+QziaP9h9jcLQom4nm78EvyOrBJ0keu9nca0x4Stx1?=
 =?us-ascii?Q?ql/+FAkzLXBWDb/eslGrWXA8R4AXAosy7u/Jm+6S8TRa97on6glfj/IgHcEo?=
 =?us-ascii?Q?PF9Zi8O2WTzMpwdsf257eymcFFeliCQWjIco+H3CgKaiyE+u6+PCzqSF4X0l?=
 =?us-ascii?Q?WPv+sJMrIYYnHmVbI8fqBaE8j+tDy+OHH5s9qXMHogcEbt+M7/QG30spTCY1?=
 =?us-ascii?Q?bYgwFZ8I7D/G1jLIrlHIF9rgfjDnOgkLuXO+tOTkbN2jJkPY5GPGokQcM9qV?=
 =?us-ascii?Q?u4wd5ZxZbXqB6BlZmSaECzV7hTejG0OQKop+rFHtbDCaR9XDlQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PXbb5mJI5x7KSrDH0b5mlF2hsRfHGer/ZmGHW6mVGKbbJ9Ge0FrrA+dAScOW?=
 =?us-ascii?Q?UylGl8hBRgrdZ9NFIc/JROtLICW8N7FzLEozYcbOj47GsmCkIseM+HFwbTEV?=
 =?us-ascii?Q?pKw1jgAavdE/0CHXgP6bSpa23eMZAdO5+GTb3wUmZO7WgBklvcj1Fy1Aee/J?=
 =?us-ascii?Q?sXCTlQpcPg0mz4efHwWbr6xBl9xaelTv559A+SER/iDeWN1+20DhL0rUxR2n?=
 =?us-ascii?Q?Pyt7KRM42sCHo//T1d38YwFbsb0HWWIQ9UBEZaRkmXllaSvluXVGhVZGJD8w?=
 =?us-ascii?Q?yVimBWxlFbgtILRf9CipDr6dvqaVWvbVt9zMnEGCDKxkQAyzpfWtNUKwvpfl?=
 =?us-ascii?Q?VuqsxZHCPqOsoTcpjJ9lV7PfF7XMe9pPu7GxSFhF51Ft8lU03+mQgN2aer34?=
 =?us-ascii?Q?tMW4DDReYNfTGRh6cN3QBP7PGw/Rvvm3VQ/EEcuWkBl7BwHIpH8NdRs2uv7s?=
 =?us-ascii?Q?HG+/rE8fzetvZycmjaEcncFEAXAIzFN0vXVNpGVgsUzmIsn+OY34GnP0jMIL?=
 =?us-ascii?Q?lkEhRZQKSZpzjNrfkF6PQFXsKVzQXCzREGyFD3TtWNazU6aon2BwgxiShJvF?=
 =?us-ascii?Q?Z3Sh3yxF4G+S3nMNVx15CDlDP49/hvhDqSY9dnJR2rsXLToM3DM102EjrUM0?=
 =?us-ascii?Q?DYKdweYqQVO873eVRj0SNCUYucxzjXJCWN1t0iB7IPxbZr1HqznijZxKdQU0?=
 =?us-ascii?Q?+zmQdB67rs3gfBMur15nRlotizam1y+yj5Y2MY/sCtrwRwA8LTfw8KI7wfbn?=
 =?us-ascii?Q?qKAQTGdpL8a6ZVXcFCEkHscQf/bZ+4n5yjIdXcXRQ+3lX/UyUVJWJ21ynVyZ?=
 =?us-ascii?Q?dWXNAkI5hk5rh6NxcKLAWVp1KW6vGxByQ92hs02SLE9dI+R4ch1KAU4lWyWq?=
 =?us-ascii?Q?zhpNe9smfv8Agq1V2CCGl+8Zk26Lk3j+aCMMmznox6IgBuHSmlvyXMLvxvhI?=
 =?us-ascii?Q?tWLyuZsV30B0btN8VtASLaAzVkXTiW0xfcaADJ/KrnmVRhXcuJf1iD3IZpTf?=
 =?us-ascii?Q?CQ70wlo4MU9YASw0Ufo8aKB+IqZy6sYShxZFvJtrq4u+Yxce3rJhOzZf3406?=
 =?us-ascii?Q?IRq9kUHzLL+uLzG1CziVTiEMGOa+pCLKH5aRB6dcdX/Gx4N+o4ve8obUMJOm?=
 =?us-ascii?Q?rbKBF9JhC0yVzuBDTSIUuhFpKWZIDVn4T9V56IRDkYC3dxAqsVdhSTwGxpm0?=
 =?us-ascii?Q?9Se67LiCxbJD3Kbhl4TL1ULyX6o5WL54x4VZLFbnDK0XlwimIUK7vZhDmAyw?=
 =?us-ascii?Q?qns43AW4Lxln52Pe29oAJqPaWI+1qAG/jGTB2V/l6kn7gbH5uYWBVwTn0j+G?=
 =?us-ascii?Q?W3kort+dDKWAiqp/wwrov1NXIapeXVLc39+McA/hkhNeWNTPYr1rAv1/ig5L?=
 =?us-ascii?Q?hcqQCEsGq3ywHV4eEA9NxeBTtSY9gpsdO2VBxz2MYHkIwexXNraGOy+Tf2mP?=
 =?us-ascii?Q?50uXfqK49ot1TZVgQ9Rd0mVuoWKJLNpFtgqzguyPoIraxdteFmi2XhYO1g6h?=
 =?us-ascii?Q?ppIrfvPzzFT6exbH0J0pG7Uu4EIwkAIrui4LoBredp4v2dU1VImjQ2/hQwGs?=
 =?us-ascii?Q?VH7oQeTgJjfXOs8TOQ7cOIGBJHEtoaUqaoNfsdiVX5g3ubzO20uzBBnmHV0J?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c31881d-89da-4e1b-938a-08ddbfed98ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:08:54.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLEoxp8GY1yHK5ApIY/9YCgL6CZdhBn5ZYQ866uyLhCwSu7E2ggfhRmkFWXhyYUEXjtfs23Aj2CK18fMSbV3Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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

On Thu, Jul 10, 2025 at 03:04:39PM -0500, Lucas De Marchi wrote:
> On Thu, Jul 10, 2025 at 10:22:47AM -0700, Matthew Brost wrote:
> > On Thu, Jul 10, 2025 at 02:41:29PM +0100, Matthew Auld wrote:
> > > After we do the modification on the host side, ensure we write the
> > > result back to VRAM and not the other way around, otherwise the
> > > modification will be lost if treated like a read.
> > > 
> > > Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 4e2bdf70eb70..2adf95d35c31 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -1848,7 +1848,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> > >  				err = xe_migrate_access_memory(m, bo,
> > >  							       offset & ~XE_CACHELINE_MASK,
> > >  							       (void *)ptr,
> > > -							       sizeof(bounce), 0);
> > > +							       sizeof(bounce), write);
> 
> pass by comment... isn't the check for alignment above this snippet also
> wrong? This one:
> 
> 	/* Use bounce buffer for small access and unaligned access */
> 	if (len & XE_CACHELINE_MASK ||
> 	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
> 
> We have:
> 
> 	XE_CACHELINE_MASK == 0x3f
> 
> and supposing:
> 
> 	buf == 0xffffffff1234563f
> 	offset == 1
> 	len == XE_CACHELINE_BYTES
> 
> this would go through the small/unaligned access, but it's actually
> aligned: we are copying XE_CACHELINE_BYTES from 0xffffffff12345640.
> 
> I guess we wanted this instead?
> 
> 	if (len & XE_CACHELINE_MASK ||
> 	    ((unsigned long)buf + offset) & XE_CACHELINE_MASK)
> 
> or even:
> 
> 	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
> 	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))
> 

Yea, I think you are right. Likely need another fixes patch here.

Want to post this one, since you spotted this?

Matt

> Lucas De Marchi
> 
> > >  				if (err)
> > >  					return err;
> > >  			} else {
> > > --
> > > 2.50.0
> > > 
