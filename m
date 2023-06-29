Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D2EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 18:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1545E10E07D;
	Thu, 29 Jun 2023 18:52:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613BF10E07D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688064771; x=1719600771;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zW+LFcSm/mlq1T69iXwElsbkiW/Slqp69NITy8ihons=;
 b=bHz6pglt0zouaDnFn51fefqZKZTOUXVGld6ETIuCs7wYL54jzwwhXAkx
 07YXHJHI2Hi7j6943FqCVEDjkmaU4VIZGk563KVoZytH4sSjgnU1IPf7a
 eh4QRiEszTEO491W+3JQghY1/Pn3eUzCmF7FmZAA7RBrlCXUtz9eMm7G1
 PfAfbv/oeDDYmGiyK6MXRV+DelvYomcPY5o3E5FFsCSUppq/FPitkKYn7
 I2cH5X1nWdL1gFsQpfQGd9fNNzitR5oStEjJP8eh/c3vzbTz+nX+h2g/z
 czceo3UwJEUIqqs3M8DaLqDWDQ7guGTvYGpeGII0MrV8/K2ivCYUSSnw8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="341786576"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="341786576"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 11:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="862035301"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="862035301"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2023 11:52:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 11:52:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 11:52:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 11:52:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 11:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5xR9c67TjYtZ5kYxPK/N4iIepA0XnsX9S+CS/32bUz4jvmvVAT1oH0zmZJPVA65egTUpXoj9RHw4GTZLKWTZZRonZI5kgTThIeIDFK8PpRCp9A4GUjDl2qnvLxFY/AwTSk96FRU7uKflYpiGi/9+D5kILcYZFisCcm68BlQNB9OKpbwBrYiuO4eam6my0zG393FU7UAUwsinvh0vKKd7vY0j2WPaSAJpmpOJ/py1W+tbAidVdVET/bByZMF5ZDerXDqBHmpJJy+3YPf/8XZ9eTxyvHWbLDafNQcbKbSEQFBHsA6UPcXnOepT/pWyqcVqQTL/72On5b8SmzYoO3sBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNMaQtm0aZsXidOk17xzyBI2+sMpv2vzxJK5JsjbXMs=;
 b=RYlvlWLmgKtDvGf9+gudjecekNq4jCyG8Dl7BEpGmWS0b5OmIi90zqInBGvlROpffEAqKVnn7qrLIALkgtRo6MXoVkzwkP2xIJLS1SOpuqr9rTsbDqmM+Ah7yg0EOtB5IkGtPPtMLb87i7WwuoCwGueGiRwQ8OmW3wsbI6Zc4AOEU4GdMtuITlHon6cRo3b2ZG6hWUxrCIb62YrCsfq9h1rkFAWzEX2HVfcmwbzJSaqIvErXa5aRphQQ0ZqiYqdckpZAhGm6zIqUP1TeKR9q02vs7d9rkP5BWbfjEcAKitagKrKVrAEDRnjHtOcODadBnGTqwln4o1QlemqC/7gD0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5381.namprd11.prod.outlook.com (2603:10b6:208:308::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 18:52:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 18:52:46 +0000
Date: Thu, 29 Jun 2023 18:52:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJ3S07Tcy3IDnphJ@DUT025-TGLU.fm.intel.com>
References: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
 <ZJyFOuFPTiETB2Vf@DUT025-TGLU.fm.intel.com>
 <7401d1b3b6c8b7613347fadc95491db0e93b1531.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7401d1b3b6c8b7613347fadc95491db0e93b1531.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e37c14-75fb-41c6-868a-08db78d206fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5PJ6yZlmT2rXLGWSV9TVA+prd6wdfv0M89Twpx6CNIsUk6FD7w4N3zxajTVjkUIXa0DTRVZV+nk9Mm9+RJn1ryaUpQDhHw5oLETIWmF2umlQZrUJb8nDH3I4faLVr2PC/nANeiiDVJrJtCmzjJhqVJCdVkGnIn6wJLMFnh9hGMuayeQKDej3PTTcuwtjhCAtBF+DPqNMM44B74HUFo0TlGsPMqYGqOEqDKxsm7Yd2EHLnz6pS66lABPgg5P6rFAhljdf/Zi0djusximQg1YnsZl2zQ7q4Io97Y/rTpWHxWy7BLb6qZXrMRQ7sro94t33vzCGM0x9uypSCEPKciQ5DZvUSBMinnQvzYi1F/Tw1PzSVyInqR4PjesLKh8UtMDRyVBM0D9QP3oChuHOQnRUqvikwSHVgwE+9+LjKN0okQiepf1ksIGAEKEGrvtjYv1Q/JcmPr4uH6lnIZuisoorCAEYTI2N4Q44CvW0YuXlQRJeHCfgHAEtdjQma8OTdormDZoAP64Yh13GO29TGC/4gvB/BGZchZNUz+1I63cinwzgPKUIJonSlWaYFHsPw93zGXO5/k2ONyKeRSO6+upWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(66899021)(66556008)(6506007)(66476007)(86362001)(44832011)(30864003)(5660300002)(316002)(82960400001)(41300700001)(6916009)(8936002)(4326008)(38100700002)(66946007)(8676002)(966005)(6486002)(66574015)(478600001)(2906002)(186003)(6512007)(26005)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j+RYArZbHUhOXDoXd6ra4krEEa8G9K3Jn1Q2FUxyUhxg9xI2tb6bO4mu1D?=
 =?iso-8859-1?Q?04v3ho0qzTWblIJmE1WyMrC4JA6zadUn2khtpfBgPgS2CmoejXv3PNoTZW?=
 =?iso-8859-1?Q?ZLHEy1pEepIn488pAeGIHGJTPoVHv/Bm5jOChTSCpWKTL7Nh+Qx8f7pHL8?=
 =?iso-8859-1?Q?xM7p8TdqEsARnKxNnwz1kjNyIDdrR5pNDOyHWbTC7CjABICqg9UB0FW1/l?=
 =?iso-8859-1?Q?tyeCD0tXy8gjfjI6JBeu+Rt7Hwqo9Rw3FY/Qve1RpCj1OVWeJdjY2Eja7g?=
 =?iso-8859-1?Q?XaoG2LFv7Wi7pdSvq2J1M/tq+78kOEBiiENRWQDKGOPvUeBzIs4GiMfMvn?=
 =?iso-8859-1?Q?pt80WU9iPiR75xZYVuWutWFn2AmXy7grzKouqa4BqHZocszy7FEaQRK1jS?=
 =?iso-8859-1?Q?+eVROMC4xJ6NYPq7QJBCfcOZNxwVODE4yyh2Ym8EWjdUz+3ouoXpuC07J6?=
 =?iso-8859-1?Q?XUwM2wx/lFhEGdDLev/RB2PR2hvJ3sNtj9BCaVsy188bLvpfQY8D4yJ1mC?=
 =?iso-8859-1?Q?C64lzLmySrxw7FUA39gjvXx0RnQA7sjOighPSyT6Qsz4pkGsZXqvzk5YAF?=
 =?iso-8859-1?Q?BVN279rM9s8yUhNiviw5kw/QSweV1IMRRxff40QFaa3Pkla/5SxDXCDb/V?=
 =?iso-8859-1?Q?o5tuUZelwqxMnnxWlxm/Cx7mf4Mrgdwx/D3vo4v3QnYTpZQQk8ZhoRbrOn?=
 =?iso-8859-1?Q?i9ewBIsHYaN2cw4WFujihnflxgOYehN3vsRZgMR145jA8APudWZmsfKaQw?=
 =?iso-8859-1?Q?FG75ZNH0TEXQ59WiOY0OXdrxJMzVxds6OAnqmUtJLc1Nizyc7ephEyVn8h?=
 =?iso-8859-1?Q?0w2QtjOxYPpsimHCEPvTwo0PW3lWIecmLg8OAPGb6Fq+0Rccfb88OCUS94?=
 =?iso-8859-1?Q?Ehb/95eRVEODsibk4xVf6Zjv1llyefNqhbutw6aPXsEsNmCSL/NluRnWtS?=
 =?iso-8859-1?Q?zOClsIyVxsWbwZoidy13qS7HCle3DEICXe/iBMkXWO842uJAqxEh9d0brd?=
 =?iso-8859-1?Q?h4FKHYkL7UXufqGeiw50ieCQcDjauQJWwX6lhkfZ1b8sIeYcUBd7lY0WPO?=
 =?iso-8859-1?Q?L/mh/0KhrDwbR8wvziziUbpFBVhJ+knH+lJrjTIUQZmZxf2DSd3jdiS7Q6?=
 =?iso-8859-1?Q?k+/fRgJE+YtNTuacrZpjHsNmzpFrB57J3hMqyKEzTccicRBX7a+Pl1l5Eu?=
 =?iso-8859-1?Q?+evl1tuY/JEgzibflZImQjX8hig8lE4hZY5LazplS/LfMoDHbPKL7//Lye?=
 =?iso-8859-1?Q?i/RM9z1sBhEhfXP/Vp4VCkE7/zicw2R3wYwb9oLRTEyhijxxDV4Z8Rmqed?=
 =?iso-8859-1?Q?8HvLSv7sxttoEBbIM18ALJAHFmRxq+B9xC5XH3SP0JCEbpGwbNnvVPS01S?=
 =?iso-8859-1?Q?r4kII2wmx6BmcAsju3GOPKnhKpK7gB/+b+cpw1jiO+ut8pHm7qYrkgA0Ji?=
 =?iso-8859-1?Q?b1C4bB+400CKDz8phizE9qJA5fDXneYi/vCWV86GK3EKENYX47bnOvqu39?=
 =?iso-8859-1?Q?hG9Urjobki3pZqBTrB4HBcVtBH718/hnL/zAhS0LlRvGg3SZZdJTfM2s9H?=
 =?iso-8859-1?Q?nbCb+Qka5E9Wi13ZXgpT7cjKI9JL+9Wa2bP+JX953oBWcYbHYlUmHKJksf?=
 =?iso-8859-1?Q?CV7bgZzNsfXvcn9JQAiVSc+3+gkKOo9MhmoRlW7pFu2KJzExFnYt3JvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e37c14-75fb-41c6-868a-08db78d206fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 18:52:46.0470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoKg3oFQh54l979KCegqXAUlrg7A3mjm7BNNIeCCBnfFJuYxH0EYxzAiNvLOhTQAoN1CrYavzx4gd+UmYl/jYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5381
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] Documentation/gpu: Add a VM_BIND async
 draft document
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
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023 at 09:08:46AM +0200, Thomas Hellström wrote:
> On Wed, 2023-06-28 at 19:08 +0000, Matthew Brost wrote:
> > On Wed, Jun 28, 2023 at 02:51:46PM +0200, Thomas Hellström wrote:
> > > Add a motivation for and description of asynchronous VM_BIND
> > > operation
> > > 
> > > v2:
> > > - Fix typos (Nirmoy Das)
> > > - Improve the description of a memory fence (Oak Zeng)
> > > - Add a reference to the document in the Xe RFC.
> > > - Add pointers to sample uAPI suggestions
> > > v3:
> > > - Address review comments (Danilo Krummrich)
> > > - Formatting fixes
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >  Documentation/gpu/drm-vm-bind-async.rst | 150
> > > ++++++++++++++++++++++++
> > >  Documentation/gpu/rfc/xe.rst            |   4 +-
> > >  2 files changed, 152 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> > > 
> > > diff --git a/Documentation/gpu/drm-vm-bind-async.rst
> > > b/Documentation/gpu/drm-vm-bind-async.rst
> > > new file mode 100644
> > > index 000000000000..8f9e2d5c8f0f
> > > --- /dev/null
> > > +++ b/Documentation/gpu/drm-vm-bind-async.rst
> > > @@ -0,0 +1,150 @@
> > > +====================
> > > +Asynchronous VM_BIND
> > > +====================
> > > +
> > > +Nomenclature:
> > > +=============
> > > +
> > > +* ``VRAM``: On-device memory. Sometimes referred to as device
> > > local memory.
> > > +
> > > +* ``gpu_vm``: A GPU address space. Typically per process, but can
> > > be shared by
> > > +  multiple processes.
> > > +
> > > +* ``VM_BIND``: An operation or a list of operations to modify a
> > > gpu_vm using
> > > +  an IOCTL. The operations include mapping and unmapping system-
> > > or
> > > +  VRAM memory.
> > > +
> > > +* ``syncobj``: A container that abstracts synchronization objects.
> > > The
> > > +  synchronization objects can be either generic, like dma-fences
> > > or
> > > +  driver specific. A syncobj typically indicates the type of the
> > > +  underlying synchronization object.
> > > +
> > > +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND
> > > operation waits
> > > +  for these before starting.
> > > +
> > > +* ``out-syncbj``: Argument to a VM_BIND_IOCTL, the VM_BIND
> > > operation
> > > +  signals these when the bind operation is complete.
> > > +
> > > +* ``memory fence``: A synchronization object, different from a
> > > dma-fence.
> > > +  A memory fence uses the value of a specified memory location to
> > > determine
> > > +  signaled status. A memory fence can be awaited and signaled by
> > > both
> > > +  the GPU and CPU. Memory fences are sometimes referred to as
> > > +  user-fences, and do not necessarily bey the dma-fence rule of
> > > +  signalling within a "reasonable amount of time". The kernel
> > > should
> > > +  thus avoid waiting for memory fences with locks held.
> > > +
> > > +* ``long-running workload``: A workload that may take more than
> > > the
> > > +  current stipulated dma-fence maximum signal delay to complete
> > > and
> > > +  which therefore needs to set the gpu_vm or the GPU execution
> > > context in
> > > +  a certain mode that disallows completion dma-fences.
> > > +
> > > +* ``exec function``: An exec function is a function that
> > > revalidates all
> > > +  affected vmas, submits a gpu command batch and registers the
> > > +  dma_fence representing the gpu command's activity with all
> > > affected
> > > +  dma_resvs. For completeness, although not covered by this
> > > document,
> > > +  it's worth mentioning that an exec function may also be the
> > > +  revalidation worker that is used by some drivers in compute /
> > > +  long-running mode.
> > > +
> > > +* ``bind context``: A context identifier used for the VM_BIND
> > > +  operation. VM_BIND operations that use the same bind context can
> > > be
> > > +  assumed, where it matters, to complete in order of submission.
> > > No such
> > > +  assumptions can be made for VM_BIND operations using separate
> > > bind contexts.
> > > +
> > > +* ``UMD``: User-mode driver.
> > > +
> > > +* ``KMD``: Kernel-mode driver.
> > > +
> > > +
> > > +Synchronous / Asynchronous VM_BIND operation
> > > +============================================
> > > +
> > > +Synchronous VM_BIND
> > > +___________________
> > > +With Synchronous VM_BIND, the VM_BIND operations all complete
> > > before the
> > > +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> > > +out-fences. Synchronous VM_BIND may block and wait for GPU
> > > operations;
> > > +for example swapin or clearing, or even previous binds.
> > > +
> > > +Asynchronous VM_BIND
> > > +____________________
> > > +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs.
> > > While the
> > > +IOCTL may return immediately, the VM_BIND operations wait for the
> > > in-syncobjs
> > > +before modifying the GPU page-tables, and signal the out-syncobjs
> > > when
> > > +the modification is done in the sense that the next exec function
> > > that
> > > +awaits for the out-syncobjs will see the change. Errors are
> > > reported
> > > +synchronously assuming that the asynchronous part of the job never
> > > errors.
> > > +In low-memory situations the implementation may block, performing
> > > the
> > > +VM_BIND synchronously, because there might not be enough memory
> > > +immediately available for preparing the asynchronous operation.
> > > +
> > > +If the VM_BIND IOCTL takes a list or an array of operations as an
> > > argument,
> > > +the in-syncobjs needs to signal before the first operation starts
> > > to
> > > +execute, and the out-syncobjs signal after the last operation
> > > +completes. Operations in the operation list can be assumed, where
> > > it
> > > +matters, to complete in order.
> > > +
> > > +To aid in supporting user-space queues, the VM_BIND may take a
> > > bind context.
> > > +
> > > +The purpose of an Asynchronous VM_BIND operation is for user-mode
> > > +drivers to be able to pipeline interleaved gpu_vm modifications
> > > and
> > > +exec functions. For long-running workloads, such pipelining of a
> > > bind
> > > +operation is not allowed and any in-fences need to be awaited
> > > +synchronously.
> > 
> > Why? I think in Xe we allow in-fences for LR workloads + pipelining.
> 
> In-fences as memory fences need to be waited for sync before the bind
> operation starts anyway, since bind operations produce dma-fences that
> can never depend on memory fences. So no point in having them as in-
> fences expecting pipelining.
> 

Agree memory fences are not allowed as in-fences.

> As for dma-fences as in-fences for LR jobs, it will probably work but
> since you can't pipeline behind a LR exec when we discussed this
> briefly on IRC there is no point? Would anyone use this?
>

Yea it is goofy but we allow this [1], [2].

[1] https://patchwork.freedesktop.org/patch/534921/?series=117156&rev=2
[2] https://patchwork.freedesktop.org/patch/534929/?series=117156&rev=2

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > +
> > > +Also for VM_BINDS for long-running gpu_vms the user-mode driver
> > > should typically
> > > +select memory fences as out-fences since that gives greater
> > > flexibility for
> > > +the kernel mode driver to inject other  operations into the bind /
> > > +unbind operations. Like for example inserting breakpoints into
> > > batch
> > > +buffers. The workload execution can then easily be pipelined
> > > behind
> > > +the bind completion using the memory out-fence as the signal
> > > condition
> > > +for a gpu semaphore embedded by UMD in the workload.
> > > +
> > > +Multi-operation VM_BIND IOCTL error handling and interrupts
> > > +===========================================================
> > > +
> > > +The VM_BIND operations of the IOCTL may error due to lack of
> > > resources
> > > +to complete and also due to interrupted waits. In both situations
> > > UMD
> > > +should preferably restart the IOCTL after taking suitable action.
> > > If
> > > +UMD has overcommitted a memory resource, an -ENOSPC error will be
> > > +returned, and UMD may then unbind resources that are not used at
> > > the
> > > +moment and restart the IOCTL. On -EINTR, UMD should simply restart
> > > the
> > > +IOCTL and on -ENOMEM user-space may either attempt to free known
> > > +system memory resources or abort the operation. If aborting as a
> > > +result of a failed operation in a list of operations, some
> > > operations
> > > +may still have completed, and to get back to a known state, user-
> > > space
> > > +should therefore attempt to unbind all virtual memory regions
> > > touched
> > > +by the failing IOCTL.
> > > +Unbind operations are guaranteed not to cause any errors due to
> > > +resource constraints.
> > > +In between a failed VM_BIND IOCTL and a successful restart there
> > > may
> > > +be implementation defined restrictions on the use of the gpu_vm.
> > > For a
> > > +description why, please see `KMD implementation details`_ under
> > > [error
> > > +state saving]_.
> > > +
> > > +Sample uAPI implementations
> > > +===========================
> > > +Suggested uAPI implementations at the moment of writing can be
> > > found for
> > > +the Nouveau driver `here
> > > +<
> > > https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6
> > > >`_.
> > > +and for the Xe driver `here
> > > +<
> > > https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_dr
> > > m.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> > > +
> > > +KMD implementation details
> > > +==========================
> > > +
> > > +Open: When the VM_BIND IOCTL returns an error, some or even parts
> > > of
> > > +an operation may have been completed. If the IOCTL is restarted,
> > > in
> > > +order to know where to restart, the KMD can either put the gpu_vm
> > > in
> > > +an error state and save one instance of the needed restart state
> > > +internally. In this case, KMD needs to block further modifications
> > > of
> > > +the gpu_vm state that may cause additional failures requiring a
> > > +restart state save, until the error has been fully resolved. If
> > > the
> > > +uAPI instead defines a pointer to a UMD allocated cookie in the
> > > IOCTL
> > > +struct, it could also choose to store the restart state in that
> > > cookie.
> > > +
> > > +The restart state may, for example, be the number of successfully
> > > +completed operations.
> > > +
> > > +Easiest for UMD would of course be if KMD did a full unwind on
> > > error
> > > +so that no error state needs to be saved.
> > > diff --git a/Documentation/gpu/rfc/xe.rst
> > > b/Documentation/gpu/rfc/xe.rst
> > > index 2516fe141db6..0f062e1346d2 100644
> > > --- a/Documentation/gpu/rfc/xe.rst
> > > +++ b/Documentation/gpu/rfc/xe.rst
> > > @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so
> > > people don't get it wrong in all
> > >  possible ways.
> > >  
> > >  As a key measurable result, the benefits of ASYNC VM_BIND and a
> > > discussion of
> > > -various flavors, error handling and a sample API should be
> > > documented here or in
> > > -a separate document pointed to by this document.
> > > +various flavors, error handling and sample API suggestions are
> > > documented in
> > > +Documentation/gpu/drm-vm-bind-async.rst
> > >  
> > >  Userptr integration and vm_bind
> > >  -------------------------------
> > > -- 
> > > 2.40.1
> > > 
> 
