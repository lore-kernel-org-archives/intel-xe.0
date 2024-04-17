Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC49AC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834EA10E724;
	Wed, 17 Apr 2024 20:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUEStH8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB3C10E724
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713384752; x=1744920752;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yjv2S6uq52JnTi+9/4Mw3hukignFXXiVDvD565XdTW0=;
 b=JUEStH8osSZ9/4bvp7qCc8Oi/jNYdzpy8ihFdx1abJr6ZdJ+1jwqc/a+
 scbMnD8h7qusu29hRnxkcaJgbNlKI2fddd3Z1piCsMCgi3TOV1USkK8Hv
 QVqXEVfdsJPAFiHqdY9cADi/ERnr3H+SCaMgtEsqyujZNmfPA3H/qx6Gr
 hydDxoH3q91d1wYBisC4wDvSt9Drbe/Z/0pgp55Aqnq56YzF/fcp6Scui
 CG53DOtMiohNTKB7SI4i3O6FiAn2WtkRQW8UTt7M85wsEAvtCrk+zFJS4
 nADYDL4fiaGo2FpajfNOttlOfW/3RZlw16Xv7WwtVxrrUkPzTUTu/w5b9 w==;
X-CSE-ConnectionGUID: kmTGQybmTwyL8N61f9PQ9g==
X-CSE-MsgGUID: U/ivS5DzTaCpphvSwlvv7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8759376"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8759376"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:12:32 -0700
X-CSE-ConnectionGUID: 9n6izjTDR1upwHXejS6ZQA==
X-CSE-MsgGUID: 8+8GQYNhSBOvsJkhuPnxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22618593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:12:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:12:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:12:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:12:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdH5rkQ54wOV9CXlWmcd3/EafyTb+ikoJX+vS1ASUcvavLUipsZXjewkt2L16eX2Rawg4f5K7GomEq3+k1ruSSkQAsU+Y8y8Bwbvlm5/MHEcZ48nN1HdLreSX0r63KDKKCRiQJtx+e0Kr6emZ+nC3ru9GF+4Y7i4dKXXBbO6fN/de1lsd51/S75nzE3S3Q1DPituxRY6kDkqSkKziaQC8/iTWEZzKH+A9bemH2PqndiXAr9wopmmymehZDEHUogKRJbz86I5q7o5gJSFLdNjDr1/OB+7QgiBcWFlPBXCPbhnATOzn2FoXN6yagDHL1hq+l1uQMtb+3QN/FLM3JvvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dyn1g+UaDYiPdjtDwE9NVqIs9D4MMLKHigSPlcMcoRQ=;
 b=C20jIiMedAUcTs+fXvj+IhwuCb8uIZ1h3NqZHEPiw7V7AUwk3NAgPqJbmizH5oXjaenIIJu5gtWkfGcXz4Ql5HeyDsoYsbBSxSyD/E3srLL1psxfApZbyAyjge9Koarby67+NSH+lmA2ukZGOlJeQWFQCnwKTI4926+ybRqZl532v2jDPXedfH0j6J2lmLYy5Pri4LUmHyQTy7S2p8KJ/WiqJL3TVYCw2zy6JH16xJDvhbP3lUtunpsWELWwlzXAxAFch9XqBkE2lO/U5OxQSW6GBieH3rXMYwmUt6zphGCgAjB1y8S/aib+EkiWO/y7DoqGZER4rEf1L4yQuOhmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 20:12:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:12:25 +0000
Date: Wed, 17 Apr 2024 16:12:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Add outer runtime_pm protection to
 xe_live_ktest@xe_dma_buf
Message-ID: <ZiAtJgbbg4qkBg2c@intel.com>
References: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
 <20240417193411.21833-1-rodrigo.vivi@intel.com>
 <ZiAsmERgUb0x5KlW@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZiAsmERgUb0x5KlW@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 810ce28e-dfd8-46a9-847e-08dc5f1ab2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVWTRGQ3YBmjEj1fTEY2/oB5UrDfGAVOcZYYnXEFnMlUfNzZhQIDbJhivYAUmlxknUmPiUKXo2oTJA98ZjRtStg8u5YnPvXzmbogZvJOtyLMGpIg4XX6uy7YJ6RakKBTyKxvG1B0nI5GjD/EPG+JDiWukIfwAvCYvBekJGXOtaWx5FYU6oWWkklAIjAEbTnH2EGwc8vf52orlnU5MTKwYwpGXqTvuyeBewo703vV9x06b7KafUph3wwhSzTB01ltQTolESR55bcMfYPX1ZO+qfUljK/Z1ER3pU+SulFVKLSiaFj/UnnBeazksq0b3V+JNePsTqBrj8U9bEt6LnucZ/keDmSBZBWNA10jLkvnVAHIUFfNcGZ9DyddXJujK4+FpZL3uoK/HvnVLC/eUuVWln/K+YEMmlsGueGR2zShjt3JESXZgqUjRaEnA9fAQoW16l6KcMhI/JrESHln5m95IDyksOgfVKH62nxpebyUyoEl16H1SQYOwjEi5q8I9kS9KjXvbWrsAcm47WA7rwurPU9SUyt97EtsOOT0ZliznxF19IkXAWs5JxXkUCS9FrnZe0eEER6KUW4xMoYW3n7NUNbIYtAGz64KBgnW9FQ0NJSZq47jlPgjQmVELTo9rhohjrEDCCy1RM/oO40pQu+pp+dwE06BYkUWot6OCSWn4nc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CVBcP1kh0lA7mWxMt5SsWJXNeNKdPrAXXu46jxJt4v+wf8cq3ntfQsh3Eq5t?=
 =?us-ascii?Q?c4rz591yWTRniNht1O8H0X+31RN4N+uhRqF+jAq16X5vM4ZOqYfty4snGttn?=
 =?us-ascii?Q?YM+P27tpOBmoNqE4XLlDs6CaX0dCGkB+0opG4oEuC1Ijc1TqP8UKxdYauDF/?=
 =?us-ascii?Q?DhcSnJuUpszqvdsR8wO6fzDYlrzqkbd6N2XKj9sjOKIHvilXhMkoRS2A0IvZ?=
 =?us-ascii?Q?FvIVjNVvJP20bGpTTlB7+NHpF6t0s6RNrfI35iwzi6FlA24bL0JSsjMhbTjw?=
 =?us-ascii?Q?0ls7AfLDDUhXQPTvB19o453gHqlAaCvTt/9HvZLdnb8XELuS8pCA9fwLdfno?=
 =?us-ascii?Q?/agswKAwLEIjJo8CRRfLNJGtnkt16Xltreq1HiAVNLZdnsqchP8HplG0/UXA?=
 =?us-ascii?Q?HqzhqDm+3+DJKc8S8gN5bdPycK9Htozozp7Wmoz4H+6094P+/k3FkpOk2Cyg?=
 =?us-ascii?Q?+xj20vZUbQRC31DWuJfTbiXoFnsFKrDshuIKqHCEtzyIt9pyk7K2VKXFDj0U?=
 =?us-ascii?Q?pOQAZnDqAaqIv9cmsgotyhInhoEB7DX0D5OOIggsaygPzIE3mlAQye8xA1mH?=
 =?us-ascii?Q?sxcpQWYAsFuONWxAZoJimWrUqQFcPQCR5X7mW2rqYurVsh8Ap47JBCyT4WkW?=
 =?us-ascii?Q?H9FXZeI7H1Xp7RtQ8cucWYvL7ExT9Vka5zPDzpVtJTWrtfoR8O7BMfpvu7i6?=
 =?us-ascii?Q?PJlcrL/k6ZdMRdcRPLrG8NdBTYO0EqXPj95j0iqlvICRH7Sd6qrNCdZxTSIl?=
 =?us-ascii?Q?YYeSe4mRuOBC04Kz042NrcFwxIa5ipkvh+d+aAsjxgYzNL/fK74gbp+Uleh4?=
 =?us-ascii?Q?P0V25hovl7JmSKIlxm+9W4Y+hlT5jp4bR5AhqjcUB1ARRmVxXqLrAbk3bKTK?=
 =?us-ascii?Q?tjsnb/W5miBtcMhV1Ftl7ahlGWTKVTmf8eLQy6wHFo8rKNPYn9ZB+IfMGIP0?=
 =?us-ascii?Q?4oxzZX++xEVUfy4gt392vF3X+mY+UnF8BAwT1nIY7EhCVlGoyXBbV2XajI/C?=
 =?us-ascii?Q?pzz85rEDW7TCdhYCyk3NktnfN12eowY/PnWoxwERdOtmSJfdpG9CegtusKo0?=
 =?us-ascii?Q?VN/huMKFTRKYocjtIXW/CgShZvUpSUKYy3bofGuUanqV6vrUptv0RGkyIyDR?=
 =?us-ascii?Q?8dToYdJLHX/jahnHyKMWrdM2GDL07ciApyce5xB/O1FPLemzd2FqSzQvwGXd?=
 =?us-ascii?Q?LzBlyY5OG5Ull4hdBv4Yawfr5wSWwpjmJGF7qntLbpAQHRUHUYUaW/rNlu1C?=
 =?us-ascii?Q?FsJZgCSafSizGAoMAaiKC6lXuoxXptRZR27O2siJZthU9x+ZhOPlPkL9FLUV?=
 =?us-ascii?Q?al9kki26plj3YSxRWGkjlzQ7kBGUIQiGBleKnYRw5vj9+Bhg4yYyDPVYOFoe?=
 =?us-ascii?Q?vHp4DxqxDlQiAv+E9TIklLE9X/W5iHK+CS66RltYmlY9mRsrnbRS/NA+lGBQ?=
 =?us-ascii?Q?8wlS3on5/v3faVKPk99eE35l6SGApxShBr+5XoSpMFiz6yFKnEUVkIIqVMth?=
 =?us-ascii?Q?Zb9qf/hVBq8KRrqjyqNx7MN+u74x4lytjeaVP+vOel4HdgvVpg6hdbhOooaZ?=
 =?us-ascii?Q?r2eoUM7rt9SLUeoLduPoY2H5ti+X56ewVKBzwGPd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 810ce28e-dfd8-46a9-847e-08dc5f1ab2e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:12:25.7941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rODFwBI2+x73tcQ2qu08t7PIiPdKa+jqISuLPhyzjHFVQ8qISVZ+HXx5JuK5leR/Me+88oK6F3nOuUNWSll2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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

On Wed, Apr 17, 2024 at 08:10:00PM +0000, Matthew Brost wrote:
> On Wed, Apr 17, 2024 at 03:34:11PM -0400, Rodrigo Vivi wrote:
> > Any kunit doing any memory access should get their own runtime_pm
> 
> So maybe we grab a ref for any live kunit tests in a generic way?

Yeap, I wished to have something like that so we don't risk end up
with missing cases like this, but I couldn't find a generic way.
Right now every other kunit is protected. This is the only one left
behind. Perhaps we should move with this series as is and then
have a follow up with a generic entry for all kunit tests on
top?

> 
> Matt
> 
> > outer references since they don't use the standard driver API
> > entries. In special this dma_buf from the same driver.
> > 
> > Found by pre-merge CI on adding WARN calls for unprotected
> > inner callers:
> > 
> > <6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > <4> [318.639957] ------------[ cut here ]------------
> > <4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
> > <4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > index d54dd5b43007..e7f9b531c465 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > @@ -12,6 +12,7 @@
> >  #include "tests/xe_pci_test.h"
> >  
> >  #include "xe_pci.h"
> > +#include "xe_pm.h"
> >  
> >  static bool p2p_enabled(struct dma_buf_test_params *params)
> >  {
> > @@ -259,6 +260,7 @@ static int dma_buf_run_device(struct xe_device *xe)
> >  	const struct dma_buf_test_params *params;
> >  	struct kunit *test = xe_cur_kunit();
> >  
> > +	xe_pm_runtime_get(xe);
> >  	for (params = test_params; params->mem_mask; ++params) {
> >  		struct dma_buf_test_params p = *params;
> >  
> > @@ -266,6 +268,7 @@ static int dma_buf_run_device(struct xe_device *xe)
> >  		test->priv = &p;
> >  		xe_test_dmabuf_import_same_driver(xe);
> >  	}
> > +	xe_pm_runtime_put(xe);
> >  
> >  	/* A non-zero return would halt iteration over driver devices */
> >  	return 0;
> > -- 
> > 2.44.0
> > 
