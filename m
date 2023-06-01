Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8386BC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 19:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEDE10E5A2;
	Thu,  1 Jun 2023 19:26:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCCD10E5A2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 19:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685647600; x=1717183600;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BOm2kQXcq6xPUJGa5XBqEugA/KV0ix3juVn02dH2zjU=;
 b=YWjBB8lXeWGJU2cKdPi6rYHeWYmEwPeYs0DhFl/BOJsvo3/CyHvgwZzP
 b2qUZyGfKVBjiDE/bd945eGMClHY7OBdlJVfMPF+3VMC3JK8St3yHJNmv
 UkqfOKQWb9NDV6JB1xSKp+AnVWRk0dX5gcKY905RoLLbw7k6NvVHhuDAI
 du5f1T+zC3rzFnVLJF8oqW8tj5jJ0O0zWIvuR3oaNn3FPEhJFf4iNOHaG
 qYKpqlHzM8RuddC8lfhpeLuQPbB54fwhV7gxjK/S+heEYpZYezWb9+1fQ
 nSkffKjwgbEeV33gOrEnwPVkZdgNVc3FQIhKMAwnKw9wD1bzg1Xug8WnD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354517521"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354517521"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657921154"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="657921154"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 12:26:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:26:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 12:26:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 12:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zko2E1L9xSxL78qKWM3khdlCgM926cMPCclH4JT3iIY1C4pCvAXbEkUVH3FeKoG7ItLTPa5SBsLd3oKq9AO3YYw39NJfe4ArJ759QxKqYn0o9Y8m5hxhCRrxcn9BBXGU2IZlMUk+VWmMF4ibnPk115R/U3dAH2ofxflyueu7jFUxPoZPW3/Ykq0W8LPljA0Pwn1ko9vrEtEzigue+DVvkFX1Q4Mm4oDpB+/a+Et4xHFds9bjEF1ZsgX1Zs/BPMDFjRMv+Q+/SMxFDfW9VQv+/QEvBQmvNc3LN1C5WBKX0lwul8FHCRkkaMvsA7Dxb1mcjY8xjxz9S2UvHXIKRJfuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKWlM3N7przhZMeFZlfhyXzwA0vW8tVRk5KwJR/aWxQ=;
 b=DsNNfI/dHBXXhBZsU1MSZf91F+JvXxdII7JGuWVEy0DMU9zBDzMcwGijXkc6pgsD+h3wFom+kUmszq2NXvZE0Ej67m2LQNdnuEFzyH1fvUg5kEidLw32BknjDVLRi3Ass9wKL74liSPql9aEWwQ/g7/qrGVDogf5tXgVoUNmJ6inMhTOUkiCdi2hgu/mFKWpiHyf9M+lnuiLON0E0EK1kAevgLG6GhS1GT0N2BDR35W5Z9RRhOptV0N+oWaYRWrRmx8I2cq1GkLw9dREGQaDTMw4Tv6oG3hK7sIp5QPFNwt0DKkfTB15+J1MPHrpYqBR/cN4bB/+OSAYbMfdKstuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.24; Thu, 1 Jun 2023 19:26:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 19:26:35 +0000
Date: Thu, 1 Jun 2023 12:26:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230601192632.GB5433@mdroper-desk1.amr.corp.intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
 <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
 <5d211028d654a8d824e899a073fad9e530c13e95.camel@intel.com>
 <495e7460-cb03-f049-9eb1-43512669acb7@linux.intel.com>
 <41f697fa-97dc-50dd-e438-c62bb1190afe@linux.intel.com>
 <faf59c70a4e046654d734fa77629971595dd7331.camel@intel.com>
 <2aee91cb-d377-476d-dd82-65236a7ac9c7@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2aee91cb-d377-476d-dd82-65236a7ac9c7@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: ef98f9f0-5bf3-45f4-858b-08db62d61cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Y2NHikf2H6bwtgJTMgxcxngjkloLu6cjicEygeX8nj0I91Rkve/usK3sp+YKMHpV7yOji2PwN5AypWp1L2j8SZ6PI5MeoPtezVPu6kAKNUWHFpcgUbu86Rx5SIPLq6YowO7eLigSKDRLjXSEpFN2TdiGcvu0s0qxyAb0pn3M2rCqM6dhPKj5mmA+4lGdXVsPGV5mYYwqcbLbG77N1MTaEWhYwfpou8813lhBbpFbhxtbJ2vAS4twYptBqupDa/3iGahB2NHySaEfXsO65DStiL3lGk2II7Kl8nTnnQ/+M02che04FFbJQfx1vFM23AIrrSpvOpVOv+XCVue8LofI3M+6C1sEicXphfJLyqdTMAbyXUtOWDscoEyzctjmcuqTqKz9CiPSSzqRMwJ13oTRxmCMYdKZQSwasmUUKITz0v1N2StF/6sHqoBRuPtkl2pR9ZA7nEU8nNa39em9HqUpli+p27D9oMm99CtWINu1dY3Pld0dd6KuRvnDqgXXjswsQX4oRRdO5lK0LF+xnyRmBj7efwoI4s1aNocLXxaaE/WXVtEKnjqf6n2vWsH28tj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(26005)(1076003)(6506007)(6512007)(186003)(53546011)(6666004)(6486002)(66574015)(83380400001)(41300700001)(316002)(2906002)(5660300002)(8936002)(8676002)(478600001)(6916009)(66476007)(66556008)(66946007)(54906003)(86362001)(33656002)(4326008)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iklciK8h7WgVhURJ8LO3iNR3CTevAc2V4dmqcRyqV2DNvxUH4ZtNPN3b9x?=
 =?iso-8859-1?Q?TfBjzRMlCFrDu618OwD6arA20UqNrGFo/8VjR+4FsgNixcJFSGqwoUl4yz?=
 =?iso-8859-1?Q?a8yq8zV7KyIl89O2DHYlii7V01L3J0ohl1/pNm+nrteTgJPJ/QlMtDbzr3?=
 =?iso-8859-1?Q?9ABretZwNMuR0+dFzMeMYmcKSQrOR0kHNoNvbUzyafEjWs6B0Q4Hx5neiA?=
 =?iso-8859-1?Q?N50pG9FhnknAA56PfG0PIzkerbNkQTrj8dkBh437hsk7O3IQe9Z8hdHUSI?=
 =?iso-8859-1?Q?qH3CVK6k2V6ri4GA2yjoOXg9fIHSoyso0f91M5os2u8+2f8dieMGrbwxyY?=
 =?iso-8859-1?Q?2tSQZT9sAI48LEC7+wb8ev9tC7IDi2atpeWLRguG1UFH/WoftRbZ2lopkd?=
 =?iso-8859-1?Q?zpnxBRT07c70WieSjKZM3vJ1fHcypjLwjZ+2PvxZXB2k6/qtUDOWp6/9uP?=
 =?iso-8859-1?Q?d+gSOXPn4Es23vw6ksYhr2d4IQIDWQhUBTDmYLGfeqe9gktSqxoh/wwSQd?=
 =?iso-8859-1?Q?P45Dmg5oo7wzOnZzaf5Oy4siIFVnxxQqeOYzf78lzzks6g+VEKUfxPUZjO?=
 =?iso-8859-1?Q?OnFxMdPI61JvpnGUjuw/hSguzZKzpqL/paXP52vL49CkCmylrRYpwBfS5s?=
 =?iso-8859-1?Q?Yqm8gWigxmwvadjG3TS4/DkU0cQ9+FihzTPWmsMhoIa6VMWCUKGYqN5tiL?=
 =?iso-8859-1?Q?EoBKI1V/+DMfw9GE7hIQeFmI7Rb6N7/dDDkB2nYA103WF8uPDSdKRYdlKH?=
 =?iso-8859-1?Q?IdkijwQvTD4I6MGXVOAvnarzEVaQYdXnRIT4PgOz3plfWWaF/CWdK0C23n?=
 =?iso-8859-1?Q?PqxdQt+aTZjPrngm/9rnJhoudhGI3yGzLOoyuBXdQLOhm8LncNCaH1P8yp?=
 =?iso-8859-1?Q?8eUnjA+J6c2O94QyuUcpHZMl735/xF/JKoLcg+H7Kep5KuF5sTV/01rUp7?=
 =?iso-8859-1?Q?GBVCcm9rMEMxa5DkzlSIaCnNKwqvCOBSrnCnSs0W+dKcvsVzOcGHGSrE/N?=
 =?iso-8859-1?Q?vlGBGJISj0EEJdlRtXVUOlhoro9fZhuYHaYbq5b1lcx5y/m392UaeXSPYT?=
 =?iso-8859-1?Q?qqPPV68GmwoVSo4srxP0+G4zidl68OBZFyX7KY4VgDLb6W4JvTEIJU6vql?=
 =?iso-8859-1?Q?x4kka2ehDJkBXzlk+H1YZtLaADVdfml7dL8JF6fGnOcfR9qrV9q9jseQqn?=
 =?iso-8859-1?Q?6kFi+E7/ci1CWHuRWdq1IMonVLzG8q7qRoV9LOoRw46H2HAGLQqOh639cx?=
 =?iso-8859-1?Q?c6+9xabH1GVIemewU63zB94iTp/biip2lIc2CCCt1h4Z+HJ2h5OjXVZPG6?=
 =?iso-8859-1?Q?MY9fn6Q7qBoYXo1ysQHaYmEvmpVwBYpF+K+kjjMGNeQmNEKfJo1Ea74J3B?=
 =?iso-8859-1?Q?dniPXXJiTHw0QgYLUyF8FYpoWxLlAmJz9GtP8enU7FOApAmiWKk1qy0Clf?=
 =?iso-8859-1?Q?X6v6PeFrBfcZdl1vG07+Se4GateMPHrPPSNeKxBfp9NLPN4cjr1OgApsrD?=
 =?iso-8859-1?Q?FbbA4qpdRXWl8cIy+YtxdpiPbSCCjGyvYVQDRFl65jFHwC2mhdIIf10O4C?=
 =?iso-8859-1?Q?RTf4MwW3YXlW08RHJVCRY+vDu4TxG6yM69/ZRU+9VzwNRmcTwW7uoZd9Ag?=
 =?iso-8859-1?Q?Fw9qdOmA/ed733xMGzHIDLYsI63b86IuxlzxfT9/k174Dw4fn7foTnkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef98f9f0-5bf3-45f4-858b-08db62d61cf1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:26:35.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CjzAZpVf568Z6soSePVsAt9lgEP0Hl7kgEKrh2JhrJvn4+x1fCI9fcOYGHmgMrKQ0TxKhH0FhJ9TqjYeGSgKd9s+PQfHCy/00qYhv90KfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 10:46:20AM +0200, Thomas Hellström wrote:
> 
> On 5/30/23 20:40, Souza, Jose wrote:
> > On Mon, 2023-05-29 at 17:07 +0200, Thomas Hellström wrote:
> > > On 5/29/23 16:56, Thomas Hellström wrote:
> > > > On 5/29/23 16:48, Souza, Jose wrote:
> > > > > On Mon, 2023-05-29 at 11:08 +0200, Thomas Hellström wrote:
> > > > > > On Fri, 2023-05-26 at 12:06 -0700, José Roberto de Souza wrote:
> > > > > > > i915 invalidates TLB before emit BB start, so doing the same in Xe.
> > > > > > Hi, José,
> > > > > > 
> > > > > > Do you see an issue because of missing TLB flushes? In that case that
> > > > > > needs to be added to the commit message. We do TLB flushes on unbind,
> > > > > > but not sure if we do them on rebind, so if that's the issue we need to
> > > > > > figure out whether we should do them also on rebind or, like in this
> > > > > > patch, on each exec.
> > > > > I have a group of tests that results flips randomly. It fails when
> > > > > the rendered buffer is compared to expected result.
> > > > > Anything that add a bit of delay after the exec fixes those tests so
> > > > > I was looking for any missing flush in Xe KMD and Mesa.
> > > > > 
> > > > > This one did not fixed it but as i915 was doing it I thought would be
> > > > > good to do in Xe too.
> > > > I think missing TLB invalidations are more likely to cause random
> > > > overwrites of freed memory. Let me do a quick check on these. But the
> > > > problem you're describing indeed sounds more like a missing render
> > > > cache flush.
> > > > 
> > > It indeed looks like we're doing proper TLB invalidation on both rebind
> > > and unbind, so this patch shouldn't really be needed.
> > > 
> > > (look for "invalidation_fence_init()")
> > With this patch + PIPE_CONTROL flush at the end of batch buffer in Mesa, fixed the groups of the tests that were flipping results.
> > Do a XE_GUC_ACTION_TLB_INVALIDATION is the same as a PIPE_CONTROL_TLB_INVALIDATE?

+Cc Matt Brost and Niranjana

It's worth noting that the removal of PIPE_CONTROL_TLB_INVALIDATE was a
deliberate act in this patch:

        commit 41db3304cff95475c6f6667ae27fab3c144a49df
        Author:     Matthew Brost <matthew.brost@intel.com>
        AuthorDate: Thu Jan 26 10:40:41 2023 -0800
        Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
        CommitDate: Tue May 23 14:13:47 2023 -0400

            drm/xe: Drop TLB invalidation from ring operations

so the expectation is that this specific flag shouldn't be necessary due
to the GuC-based invalidation we're doing.

At the hardware level, there are a lot of different TLBs that cache page
table lookups.  Each engine has a TLB, the GuC itself has another TLB,
the OA unit has another one, and on igpu platforms, there are also
additional AuxCCS TLBs for the compression lookups that most engines can
do.  You can trigger TLB invalidations in various ways:  via GPU
instructions (like PIPE_CONTROL), MMIO registers (like
XEHP_GFX_TLB_INV_CR), or via a GuC request
(XE_GUC_ACTION_TLB_INVALIDATION).  The details of invalidation vary by
platform (e.g., you can do selective range-based invalidation on some
platforms, but not on others).  The GuC just provides a single
interface, but that interface lets you choose whether you're doing full
vs range invalidation, whether you're invalidating engine TLBs or
the GuC's own TLB, etc.  If using the GuC interface to invalidate engine
TLBs, it just requires a single request and takes care of invalidating
all of the individual engines on its end.

Are the mesa issues being seen on all platforms or just specific ones?


Matt

> 
> I would think so, yes, except that the GUC TLB invalidation is GT-wide and
> I'm not sure whether PIPE_CONTROL_TLB_INVALIDATE is per hw engine or per-GT.
> But given this really has an impact, it might be that we need to invalidate
> TLB also after a bind where we previously pointed to the scratch page.
> 
> If that's indeed the culprit we should look at issuing a
> PIPE_CONTROL_TLB_INVALIDATE on the exec following a bind or rebind, and
> leave the GuC TLB invalidations for unbinds, and then this patch makes sense
> as a start.
> 
> 
> > 
> > Do you see any PIPE_CONTROL flush at the end of batch buffers that i915 does but Xe don't?
> 
> The emit_fini_breadcrumb() called from __i915_request_submit() indeed seems
> to emit the flushes needed, whereas the corresponding
> emit_pipe_imm_ggtt() in xe doesn't.
> 
> /Thomas
> 
> 
> > 
> > > /Thomas
> > > 
> > > > /Thomas
> > > > 
> > > > > > Thanks,
> > > > > > Thomas
> > > > > > 
> > > > > > 
> > > > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 1 +
> > > > > > >    drivers/gpu/drm/xe/xe_ring_ops.c          | 6 ++++--
> > > > > > >    2 files changed, 5 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > > > > > > b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > > > > > > index 0f9c5b0b8a3ba..7c7320efea739 100644
> > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > > > > > > @@ -73,6 +73,7 @@
> > > > > > >    #define
> > > > > > > PIPE_CONTROL_STORE_DATA_INDEX                        (1<<21)
> > > > > > >    #define
> > > > > > > PIPE_CONTROL_CS_STALL                                (1<<20)
> > > > > > >    #define PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET           (1<<19)
> > > > > > > +#define PIPE_CONTROL_TLB_INVALIDATE                  (1<<18)
> > > > > > >    #define
> > > > > > > PIPE_CONTROL_PSD_SYNC                                (1<<17)
> > > > > > >    #define
> > > > > > > PIPE_CONTROL_QW_WRITE                                (1<<14)
> > > > > > >    #define PIPE_CONTROL_DEPTH_STALL                     (1<<13)
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > index d2fa0b4c8bcc0..4f3ef39109b9b 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > @@ -37,7 +37,8 @@
> > > > > > >                   PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
> > > > > > >                   PIPE_CONTROL_FLUSH_ENABLE | \
> > > > > > >                   PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
> > > > > > > -               PIPE_CONTROL_DC_FLUSH_ENABLE)
> > > > > > > +               PIPE_CONTROL_DC_FLUSH_ENABLE | \
> > > > > > > +               PIPE_CONTROL_TLB_INVALIDATE)
> > > > > > >      static u32 preparser_disable(bool state)
> > > > > > >    {
> > > > > > > @@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags,
> > > > > > > u32 *dw, int i)
> > > > > > >                   PIPE_CONTROL_CONST_CACHE_INVALIDATE |
> > > > > > >                   PIPE_CONTROL_STATE_CACHE_INVALIDATE |
> > > > > > >                   PIPE_CONTROL_QW_WRITE |
> > > > > > > -               PIPE_CONTROL_STORE_DATA_INDEX;
> > > > > > > +               PIPE_CONTROL_STORE_DATA_INDEX |
> > > > > > > +               PIPE_CONTROL_TLB_INVALIDATE;
> > > > > > >             flags &= ~mask_flags;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
