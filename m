Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72184C4707C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 14:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2235F10E00B;
	Wed, 10 Jan 2024 14:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0475F10E00B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704895567; x=1736431567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8BLnKA+v5GzpNVk+w8jNfqiynv9TuFIjHmU0tQokTQ4=;
 b=EAQMdsulIvXDQbyWv3inUURnVARLSNzDj5qvSslEMAggIAAJqxj3ISas
 GqBDOHQet/WisFVptW8Kw/doWn6P+x9yoUHtxMsU4ywKU+0RUsdNfSJLt
 e0QQ3O5T12GVlI1xYVInSR/hFA3/nBX4dzviFpvTtoa2DQWpy/IL98QjC
 OJ5m4htOCY9O0f8JMd93NqTWZUnUcY8YE8gy50923Jk0f5c9idwhjN8DU
 aPJoEOhnnTSr6XtS9Abd+y/ZDuAmXTmKN/jPeS5pG3cBBBoN3OYPh7Qzs
 T+54HqdW/vqR7xHJma6UKAddDgqvfFwiTHNPO2aAnk1sKhG5HjizwVFkU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="388968367"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="388968367"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 06:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731865180"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="731865180"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 06:06:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 06:06:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 06:06:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 06:06:05 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 06:06:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWt00dAiHwH7VJf/QiJYyQBLRT7oHSWTVlyyzJTlNyQ9axdb4e+IHNrxp/qagAOzqSrcmrAHhNXX5XqRIiyaZsTIoHU0cyV5Jzkaf11qGSJxlLhOf27E/A3ptP8JMCGFf/9x5jkswGbsZE1MO0QJICihOymp+QaXe/UqVlS0lf9w2GhocFF3b1t9kEO83ZdNOSoWY/NdaTOQGRUItx4/FpkSPX/oEbl+N4/+3YqTkMgo7wYtyidP6HL1OzyKzhON5DQLX2Q6pWt+0lLZ27cPEZgZBBal+hfnyFeE6muq/SfvUVxPU4e3ZUHKZW3DaOSeh5oX0Usu7R0SSmqiTtDsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fMgtixbnVO6vIvrKRGIZrRNjJGi7kMcBF3LJdzwZ9E=;
 b=a6BVqiR4iUZ0MQUlskp4n9Z0131Xm+6FHotmvavSRynrbgWnf7I3oksChYv7MwHe0rXRNbCeVh3J35a8aYfsIpcYMwQAXnr2z2SVJ55IDBwZj7KhmElrGOemnom0cWkpLa0c/tbE29UL3ultAw2FNrqszF1MKEhWusAtnDPVJJRTbDB7CdggvBMiygFCq2YCux81Y26jlfulksTiGehl/ENIQyS7fhLBZ2vaM37oxiq1dIostABD21vxvIGDpUfsWS3V+yspmNG9yQZrsWPc61TxGlr3C9QkoSuFsBBgELdcryG1fufoqsw9X+kh7OYan111KpGdtOUio8Ip1EodJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 14:06:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 14:06:03 +0000
Date: Wed, 10 Jan 2024 09:06:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC 00/20] First attempt to kill mem_access
Message-ID: <ZZ6kSCeaX4xutZYe@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <ZZ4pXlyXImJ52o6M@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZZ4pXlyXImJ52o6M@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:a03:60::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b50e6e-fd4b-4170-77e3-08dc11e547de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4twM5qErw5ZCr4HEMskSqq/UG/czjfxRTZ3YfZ4mGc+LmYNeMWkXWziH5EXDTfn4WtX9BKkaGqtcZg4MFMZ84TDun1+xXNvefsInL9DzjUBb8ffrz1S+OYNaX5hRMwa9Pd9Iu9dwFP1o0xR8iVIwJ1fZxJTEfjyRDItVriAONes09oDG6dAqW+TETCKrV+wS49GjncxHXuTpGG5eevpMSlVd8nGNgB4TrO0ZVm2qfvEoXRiGs3Pa7gHkVv6eFnxDMW5/D4l/zK0KSkJIVd+YQUfXRJ5yzcp2EJKXvWnjFIppoGkReuNB6e+H0YDLFVX2uOJLjyYiBU4C6XEl2osQG6JP/MwEBSHncRoVyJEWGw0gYEqPSlr+P66ZXw2OgrdzQfctjFDwcYzCTkfHOK8Gvl2O1yYV6yLu/Gfd1K/CthQJ53ixNIMDPXCB1FuIr2tgYVgDMr7t3PJz21byMQhxgg18W5G0MxPeB0zH22r4eY6gbeD7wG/mZu+SlRNJQKjPThTwcj8YHUEJtLGWmRwx6SL2uZ/CT1B0opVMwrbqazyjxAL+zWrs3pCRvhZBCUZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(2616005)(6506007)(478600001)(6512007)(6486002)(38100700002)(36756003)(82960400001)(86362001)(41300700001)(66556008)(83380400001)(2906002)(4326008)(316002)(5660300002)(6862004)(37006003)(8676002)(66946007)(6636002)(8936002)(44832011)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ryjo+fQpItFLd30VeDC3jBCUaOuScZNhGRNMUZ8aD0aVBuXo32RgZtzAKSSj?=
 =?us-ascii?Q?pg9qD8rgcIIftj41eN9yRpe54PIwJYKbuiUc59/WhSC5XPpxCOMyAMryM0VD?=
 =?us-ascii?Q?HGEXRPs8cnZrhHXG4+HudxTsTDhHN0yPATlml6qMGA9nSD/iK6sS24lfWMbd?=
 =?us-ascii?Q?4pRkqSbkOHrzo2ez6gW0xSTmGMPl4ECu+IwKLBMvtIWTXJ4gfyNyqkRZV2+2?=
 =?us-ascii?Q?ffK88Wp0YDIH/GzOUY4fGr9hYFqRT3fagTOipdR2SyMQAC+XD7q+RuC5E8ZS?=
 =?us-ascii?Q?GjNHk3OGXhP62FbDMRhzyTwRTWRfenLQINlbwsRwImik5mSZuPWQKdPDFF26?=
 =?us-ascii?Q?K9Cj+CdVNCWJfEascoimFBVUNK3f7l9yQshAj5qv3S17CZBHPR2+uypQkLHq?=
 =?us-ascii?Q?QWBqC9XnO6zEFIrZrVaGsYXhd5mrIIl6WzUOvTFrK23LhbkwkZIOt45gjdAD?=
 =?us-ascii?Q?CiCHDDhAcCiLJBiej6QgqrMzEjwf+xSTcahnYxf82pL3U/wWBLLWH32LJITF?=
 =?us-ascii?Q?3zizxvzZ7O4lw2jf16cV/jxtAfEVbjiZK2NOl5Q3C+K32e3J4BkUNFjJmo2o?=
 =?us-ascii?Q?IeE98r3b7JO49obLohyiYD1UkeGl4+NlbSD6uzG/AmtRktbZj2DhiLTzJWmA?=
 =?us-ascii?Q?EpTqKvyD0QVE98ZhXymJmbdrwBPedw9B8EX0k4zVoYngg/iR/NLNMUTzuvkF?=
 =?us-ascii?Q?HA1cPRRhb+947pvUptfrdO1jh3Ku+9kjPjD5QquLQBwagpO3Q+RMHwu8YmKT?=
 =?us-ascii?Q?R4kqmS+6Rs7/Pd3nLojIOz1NlneDX1WGWazcLnH6irpv2QQyaYwCqKWjdSis?=
 =?us-ascii?Q?zL169x8qxsI/cRe5a/HttS5YJrf209vPJSqHziCoi4YhEjZvSV7WtO8Rrpd8?=
 =?us-ascii?Q?mx8eOfynInVJWHh0CGwTFAyKn/Ct4/AqBddh10HnMEw6TznVpd2QFBR6yMo6?=
 =?us-ascii?Q?S1LypBv8sJLis+Cb/FUSPc6S7MTwMKyjE8yYRpPUQL1tsj/c9g9DS7WAHjAT?=
 =?us-ascii?Q?Z9gD8XagHs1yMIL4TNO/toI/1l5V6sG17BhDFzMURXRI0z0PXcOqEh72HwP9?=
 =?us-ascii?Q?RByRnnGw56Duc8NUYrFa+eXp60gl4W9yIciOzjK/Gc3AGj3LKImWw+MnEoOP?=
 =?us-ascii?Q?njscOOLAg8IrtKpYcSt8XxoamF3Ahki8OIdmohGw/1hn4FchlDfMSDaA6glg?=
 =?us-ascii?Q?o5KdTGqXwxYqASPBfsfXrV2NaBrNVE2IcgLVMtQh7S5Hn6YZ7X3l0T8t1tI7?=
 =?us-ascii?Q?aAQz496TPpiTRu9Iu9lkTlg9cKL9D7Z1rTpzR1x33WgSNx7WukRZz9JTfoR4?=
 =?us-ascii?Q?VQgVACHK2tXr7aapAmzk4QoLljA8WUMBajn8wJyrs4InXEbNJjIi5OnT8w2Z?=
 =?us-ascii?Q?k39ub5FtXyEebUulQ2ZmNYfeGISD786WwbRCYa0qxSOIX699KpGaDue76YC5?=
 =?us-ascii?Q?oMP9WRFxg9T4Nv2p08d/TEPmsmfQuPUOumHolFwNcBS2JiNfJTlio0FM7MY1?=
 =?us-ascii?Q?t9CJTh+U/hHjwlvNCqaaaW2Pr6CCle7+2ZcXGgsVIdS1EBkqquUlzS7bREnY?=
 =?us-ascii?Q?wyTD6R2JjLeyj6z5dBVAon9OkB/HIXeJGC0XoToycARZIDHzpBPEGU2jECfe?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b50e6e-fd4b-4170-77e3-08dc11e547de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 14:06:03.3790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FiVKhBjK5DaaHQq0kvdX+7CcjNiHhtpTKLd+H4W+MSxZ9J+wwOVdGve0oQuNF9rwaz58KNjzWpcggnOoW5O4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 05:21:34AM +0000, Matthew Brost wrote:
> On Wed, Dec 27, 2023 at 09:12:12PM -0500, Rodrigo Vivi wrote:
> > At first the mem_access seemed a good idea since it would ensure
> > we could map every memory access and apply some workarounds and
> > then use that to ensure that the device is awake.
> > 
> > However it has become a nightmare in locking conflicts with memory
> > locking. The only sane way to go is to move the runtime_pm protection
> > to the outer bounds and ensure that the device is resumed way
> > before memory locking.
> > 
> > So, this RFC here is the first attempt to kill the mem access and
> > have a clean rpm handling on the outer bounds.
> > 
> > Well, at this time we already know that we need to solve some TLB
> > invalidation issues and the last patch in this series needs to
> > be split in smaller pieces. But I'd like to at lest get
> > the discussion started.
> > 
> > Happy New Year,
> > Rodrigo.
> > 
> 
> Hi Rodrigo - I haven't fully reviewed everything but noticed a few
> issues to discuss.

+Auld, who was also raising very similar concerns.

> 
> 1. LR mode VMs
> 	- I don't think the PM refs taken for LR jobs works. LR job's hw
> 	  fence is signal immediately after scheduling the job to the
> 	  hardware. Once the hw fence is signalled, the job can be
> 	  typically be freed.
> 	- How about we just take a PM reference when a LR VM is opened?

I like this idea!

> 
> 2. Tearing down exec queues
> 	- Tearing down exec queues requires a ping-ping with the GuC
> 	  which likely needs PM ref

would the idea of getting with the CT that expects G2H help here as well?
(calling CT-expecting-G2H-ref now on)

> 
> 3. Schedule enable G2H
> 	- First job on an exec queue will issue schedule enable H2G
> 	  which results in a G2H. This G2H could be recieved after the
> 	  job is freed

for this, the CT-expecting-G2H-ref would be enough right?

> 
> 4. TLB Invalidations
> 	- Send H2G, receive G2H when done

for this, the CT-expecting-G2H-ref would be enough right?

> 	- Four cases
> 		a) From a (un)bind job
> 			- Job can free before invalidation issued /
> 			  complete

hmm... I believe I have faced this at some point.
would the CT-expecting-G2H help here?
or any other idea to cover this case?

> 		b) GGTT invalidations
> 			- BO creation, should be covered by IOCTL PM ref

this should be okay then.

> 		c) Userptr invalidation / BO move on LR VM
> 			- should be covered by #1 if LR VM take PM ref
> 		d) Page fault handler
> 			- should be covered by #1 if LR VM take PM ref
> 

these (c and d) would be okay with the LR-VM ref, right?

> 5. SRIOV Relay?
> 	- Haven't looked into this all might have issues here too?

would this be covered as well with the CT-expecting-G2H-ref?
or any big hammer needed of blocking rpm anytime that we have a VF
maybe?

> 
> 2, 3, 4a all are H2G waiting on G2H. Perhaps it is simplest to build the
> PM references into the CT layer? A lower layer but off the top my head
> not seeing a better option really.
> 
> e.g. A CT send that expects a G2H takes a PM ref with the caveat we
> expect the device to already have a PM ref. The receive can drop the PM
> ref and it can transition to zero.

one extra reason to keep the lockdep checks, but that should be okay
I believe. I will try it here.

> 
> Thoughts?

Basically it looks that we need:
1. Get back the lockdep
2. Add a big hammer around LR-VM (outer bound refs at VM creation and destruction if LR)
3. Add an inner rpm get around CT messages who expect G2H back messages and put on G2H responses.
For this, do you have any good idea for the right places and conditions for the proper balance?
and to ensure that we don't keep holding the ref forever in case of never getting the response...

Anything else that I might be missing?

Thank you all for all the great comments and suggestions!

> 
> Matt
> 
> > Rodrigo Vivi (20):
> >   drm/xe: Document Xe PM component
> >   drm/xe: Fix display runtime_pm handling
> >   drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
> >   drm/xe: Convert xe_pm_runtime_{get,put} to void and protect from
> >     recursion
> >   drm/xe: Prepare display for D3Cold
> >   drm/xe: Convert mem_access assertion towards the runtime_pm state
> >   drm/xe: Runtime PM wake on every IOCTL
> >   drm/xe: Runtime PM wake on every exec
> >   drm/xe: Runtime PM wake on every sysfs call
> >   drm/xe: Sort some xe_pm_runtime related functions
> >   drm/xe: Ensure device is awake before removing it
> >   drm/xe: Remove mem_access from guc_pc calls
> >   drm/xe: Runtime PM wake on every debugfs call
> >   drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
> >   drm/xe: Allow GuC CT fast path and worker regardless of runtime_pm
> >   drm/xe: Remove mem_access calls from migration
> >   drm/xe: Removing extra mem_access protection from runtime pm
> >   drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
> >   drm/xe: Remove unused runtime pm helper
> >   drm/xe: Mega Kill of mem_access
> > 
> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   8 +-
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
> >  drivers/gpu/drm/xe/tests/xe_bo.c              |   8 -
> >  drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 -
> >  drivers/gpu/drm/xe/tests/xe_mocs.c            |   4 -
> >  drivers/gpu/drm/xe/xe_bo.c                    |   5 -
> >  drivers/gpu/drm/xe/xe_debugfs.c               |  10 +-
> >  drivers/gpu/drm/xe/xe_device.c                | 129 ++++-------
> >  drivers/gpu/drm/xe/xe_device.h                |   9 -
> >  drivers/gpu/drm/xe/xe_device_sysfs.c          |   4 +
> >  drivers/gpu/drm/xe/xe_device_types.h          |   9 -
> >  drivers/gpu/drm/xe/xe_dma_buf.c               |   5 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.c            |  18 --
> >  drivers/gpu/drm/xe/xe_ggtt.c                  |   6 -
> >  drivers/gpu/drm/xe/xe_gsc.c                   |   3 -
> >  drivers/gpu/drm/xe/xe_gt.c                    |  17 --
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c            |  53 ++++-
> >  drivers/gpu/drm/xe/xe_gt_freq.c               |  38 +++-
> >  drivers/gpu/drm/xe/xe_gt_idle.c               |  23 +-
> >  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |   3 +
> >  drivers/gpu/drm/xe/xe_guc_ct.c                |  40 ----
> >  drivers/gpu/drm/xe/xe_guc_debugfs.c           |   9 +-
> >  drivers/gpu/drm/xe/xe_guc_pc.c                |  62 +----
> >  drivers/gpu/drm/xe/xe_huc_debugfs.c           |   5 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  58 ++++-
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   7 +
> >  drivers/gpu/drm/xe/xe_hwmon.c                 |  25 ++-
> >  drivers/gpu/drm/xe/xe_pat.c                   |  10 -
> >  drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
> >  drivers/gpu/drm/xe/xe_pm.c                    | 211 ++++++++++++++----
> >  drivers/gpu/drm/xe/xe_pm.h                    |   9 +-
> >  drivers/gpu/drm/xe/xe_query.c                 |   4 -
> >  drivers/gpu/drm/xe/xe_sched_job.c             |  10 +-
> >  drivers/gpu/drm/xe/xe_tile.c                  |  10 +-
> >  drivers/gpu/drm/xe/xe_tile_sysfs.c            |   1 +
> >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +-
> >  drivers/gpu/drm/xe/xe_vm.c                    |   7 -
> >  37 files changed, 445 insertions(+), 391 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 
