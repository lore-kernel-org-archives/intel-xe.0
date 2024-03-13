Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04ACC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592A10E9E6;
	Wed, 13 Mar 2024 19:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzOBFTqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326510E9E6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 19:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710359068; x=1741895068;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pdULWt5JSTIJVAB7Zq97PPypELksGM2tAJyziK6UTgw=;
 b=MzOBFTqq00RMd6THF+rk3GUOlpuTiiumXhZSTWKdffobg4H0Gn/YpjrJ
 X2Fde2vkdvz/Q3VOk+9Z18CmbaU7a352BvnTZojUbmJNHWPwuQXcabyZm
 Ym/uW5OlV6Pzti4332xHDsxW2jlyd/jv6zS0H/Jeasl8ZuMxj+au+VAfx
 uAL0HOQ5izMGeh4BWXjl4uNDreidBM0DZx3NmdYCd4cjAg/XrUPKdk9Wo
 CJEVoso/yIPzLkIgd+A18PmnBsZiWfO+DyNGHUYUhJMJLDUVyvNSHN50Q
 0jnZaN4EqZnF5nWVhPclA5xrJXEuBUnCJXiXkFjBlL8KoenkQVijtEHYC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15878481"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="15878481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="42961246"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:44:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:44:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:44:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCSiBW6iMe3Mpcdmm/BZVnejWG9Ej+rxJduEeJg25qB8AJ1hwoHW4/b34jCnGM1Ue9c56Pj23Ni5MzKv4ijl3oRK6+6QgiPwkIbsEobpVAqcDI5V/WMQZTxdzigJG5hLabKAnd38hXGwoWSzPZB7eaX/bIblb+Kd9ckRavKX4mUYLDhcc3gWUlShSMU1qxeTSOMnbqD1E23zdxivZlvKgcN2Og2sTvj4yt0l32dWndAlKOrvi13U0mSQywZV0vKl2RZ/lC2Fu7Pw+WQPbg+sAT0nAHjFjfJneaZu/7WjbGIh8y7U5otIuuLfuxKo0nLsBvkH/wBpPh2uAPH14g+ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f7F3Dc5LnqNE0wZSvOCBEvQH5HZoT9O2DdkGCKf5Og=;
 b=EwLGxFhRmOhLZEISjVZ56j0zRFtD+tt41/8njYEBZVC+vhBC+6oPbjVEQtETQxA+8XZsEMGRWihlzW9z0Izg2xWIQtGfAtebA9rIfDcDvpbyx9NUlHWnmLBJBVnn1Bjc6BcpdIDi4NP+12mLddbLh8/cXhRzJwlLGb/WDgyJt2PjTQree+o053cRiywHfgdwb5xpSAS9Jmpt9+h9WrMHksK4mOwdOXrTwQcvslG1GWo6C5MPCU9mYsekQfd+usxqA1Shw33VKoXAu+/x04liMoNTsVugmzlmZr9W/wUEnYG3jTfWJYoSGtl6q0FF2WbuzWoPe2Uz8wSg0GItx3GPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 19:44:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:44:23 +0000
Date: Wed, 13 Mar 2024 19:43:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: Separating xe_vma- and page-table state
Message-ID: <ZfIB41awiIoMvotS@DUT025-TGLU.fm.intel.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
 <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8c507084e016186e0fb75c45b826f612ddc6c40.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e60d769-de85-4738-a8c3-08dc4395fb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXA6EAz0DPlx6AAU/gyz+vyxE9wliZmrPhC6S425pr97cIYTphi74rxbaFjMXwva2ugS8WNoV1aJPz7CrhLrFHmCGdMDz1DhxVJVdrbRjtZ/K2nhkcUvT8MPcyiYjxe88mlJt2RfnEw8F+Jkrw/VTXlhNPnGb8v5r8eqUg9gQcO0mFIczc2MqiDDoUNK3GGGxRdQI56yb4SZbBs+xw7rgGZgMGaszmOKLaNG+DjlCYqWFlWXWD6IEKNEYN4sEIK527tlUmWkwX0lmBpKHpp+nWx6PTv7bdPCpK61hZsQxJp/mg+nUVsO7uO9Io/mpMWrN2HlgFiMROqtEjlGLEHbV7g/ocfpjy29LpFNETrenGtlJrHjAzMqsrCGXenDEDLxPG2LjDopvysZh3PpFwn+WK+MEJG295KbPus/itrPiaigdKVthYgoHmsGbqKMsvqU1Q3Ipbk6FANYjhK5RgDlyjGiGmv1DO3qr/qYcxegJHR03ThvcxJsgCOd2Cz/guAZpd3GpyXRPtCNrqiJc7/FzEmWPKekVMKZO4qk+4ZAXC8hPZ/1/usOfKH276+WLmw3lmudRpfkWI3JfkX/ukRY7hSdJK7+D1ihKP0xua/iCIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nkougN8Ls2LXpi4j88dFY1H7d4ZRPFtv5MMKzmBxU9owSPVcGbYkdPs6sT?=
 =?iso-8859-1?Q?YN9jClOBDswDJGggADNfwur+PsfQMuY3K9i9oo84wmxIKm0/hDn28yUhB/?=
 =?iso-8859-1?Q?WDSfWEu6XLgDhX+wJd50d2HevMgBkpwNfY2JvKg8Deih0LbH3PRVEBYld3?=
 =?iso-8859-1?Q?ULFSKTKuDYMVppDyoVmFoQSZZQyKEsF9vycEAKF8N1jRmuWcQ3aL3gPx8G?=
 =?iso-8859-1?Q?3AtdebHa5lDmAXruBAJDSOT1l+wD4MJyRDvs11qPIi3nfpTbaz0f74UqBT?=
 =?iso-8859-1?Q?uqoDM4tsOqg81lrZLvCS2tou97cXOKgDzDHddOOtXnw4OcVvEOAw9loZyx?=
 =?iso-8859-1?Q?PI7jbC5psVx5ngCnLTEglzcphvTYZyROcX6jTfXcBCaHqAaT4B2gPeJXAt?=
 =?iso-8859-1?Q?VAV2BstK9Rh3oR9zwlr0NeIw6kJDCo98M6kqVhEDc+NM9fWd8xNXM6QHMk?=
 =?iso-8859-1?Q?+DjBvtF/unhNTANd+gfr8PThDiEii5EMvGpHpqD5t9wCu9uueu5rHhgwGs?=
 =?iso-8859-1?Q?pewMGBwHHp4vfHtal30FRGw5FFunYZ2mo3NYJFhRx6+U2Hki8e8udmkCOI?=
 =?iso-8859-1?Q?81ll3HMmXS2MogUjkhVGQFpVSCr/NoHfRXcb6nKLcrbDaoJkSKzhIaHarZ?=
 =?iso-8859-1?Q?5VPnW1f0l9zu6iurFUam1AgtYLbOYjUZ3WpB3P9InUMwaHBcVOwFbTEvlv?=
 =?iso-8859-1?Q?rdqQNsJNLsclrtgCmKkctt76XsBTPlh+m/V8L3lns+12ZJbR3Mdx+26hWP?=
 =?iso-8859-1?Q?Py/RXD6ZPWqHk/fP4HptDqrvUleTdRl2AQ+llHGDyAPlLvv/daCd9ylc0p?=
 =?iso-8859-1?Q?YunSMkz1upJjFCEX5auFXSIGNFBPriQnng5hhQjwHb87yp3oqr7IiG0sQB?=
 =?iso-8859-1?Q?bIf7MyZuqyABEd7QBd4Vkto10okKJop6PoCIuFbVZWldo4o3pOifDe44CO?=
 =?iso-8859-1?Q?79mDr82+QArS335MyvRjZxBHyy46oOtk8co8PvLCKPq4QkdYNZmRw6mQ1y?=
 =?iso-8859-1?Q?GdhJHLiFk67UFm1xVbAT3REjKvk4qAkhuolnLH6GetgIXn8BaHAMtDgd/1?=
 =?iso-8859-1?Q?BocdhtwlodBrGMibFKc2QlmRgrQIOAjmo5KBiHnoSh9XLgByLHoPEZnP6l?=
 =?iso-8859-1?Q?Xi7tpJ5vgZFS7bvQNqL3tA5zMGWZ5LOej00E7gahHlaC1oa/+9TbMR/ZvB?=
 =?iso-8859-1?Q?hGvXH17BAP4DnLFSMu7uaUym8VvFFbGotaeG/s2UfOVjCflRQ2m29GIAR4?=
 =?iso-8859-1?Q?Culk+4DABKlsnkXOD4poBIP4nC3RyGoR5er4a+ZK9dDRFNZLbZG5cE9LvX?=
 =?iso-8859-1?Q?4lb2NdTZjmZ3yrdaVJQR8nzZeZiGpPLPRyrHaDjtbuDngzlqXw/tbMhsSW?=
 =?iso-8859-1?Q?RnRMfwxa31qqFmPbwqx8utN43g5/D1rWDbQr83CNPGGKuDUFL1XMDGKB97?=
 =?iso-8859-1?Q?h99zxlh3PscbCVz+SdQvbz+F6ZWVX/8tyZ34p11vgGrUyH3fp2UeTfTt5i?=
 =?iso-8859-1?Q?+QmD6HU+9rESWoTCgq2bthLXG8wKDB1D1oomRV6AmPkCr17PtGoInY8wcQ?=
 =?iso-8859-1?Q?A85/p7PPl+EOQR1SWLDCyAZSvkB09IpbNP07h4fjMCrWWZ42+9aCfLM9Eg?=
 =?iso-8859-1?Q?q4IgwrT4IBbwo0XPLzHAnJpllS4rYsqirO1IyGWt5lYt7vJFEwowp/oQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e60d769-de85-4738-a8c3-08dc4395fb8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:44:23.1182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWG9mDg8Wge8HxC4fbWWzsYLWFEc/YJrVZCL5gfe+CarDKujs+b6XqzciEApnHfVjAlKMgslAyLl8qXj8K9TuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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

On Wed, Mar 13, 2024 at 11:56:12AM +0100, Thomas Hellström wrote:
> On Wed, 2024-03-13 at 01:27 +0000, Matthew Brost wrote:
> > On Tue, Mar 12, 2024 at 05:02:20PM -0600, Zeng, Oak wrote:
> > > Hi Thomas,
> > 
> > 
> 
> ....
> 
> > Thomas:
> > 
> > I like the idea of VMAs in the PT code function being marked as const
> > and having the xe_pt_state as non const. It makes ownership very
> > clear.
> > 
> > Not sure how that will fit into [1] as that series passes around
> > a "struct xe_vm_ops" which is a list of "struct xe_vma_op". It does
> > this
> > to make "struct xe_vm_ops" a single atomic operation. The VMAs are
> > extracted either the GPUVM base operation or "struct xe_vma_op".
> > Maybe
> > these can be const? I'll look into that but this might not work out
> > in
> > practice.
> > 
> > Agree also unsure how 1:N xe_vma <-> xe_pt_state relationship fits in
> > hmmptrs. Could you explain your thinking here?
> 
> There is a need for hmmptrs to be sparse. When we fault we create a
> chunk of PTEs that we populate. This chunk could potentially be large
> and covering the whole CPU vma or it could be limited to, say 2MiB and
> aligned to allow for large page-table entries. In Oak's POC these
> chunks are called "svm ranges"
> 
> So the question arises, how do we map that to the current vma
> management and page-table code? There are basically two ways:
> 
> 1) Split VMAs so they are either fully populated or unpopulated, each
> svm_range becomes an xe_vma.
> 2) Create xe_pt_range / xe_pt_state whatever with an 1:1 mapping with
> the svm_mange and a 1:N mapping with xe_vmas.
> 
> Initially my thinking was that 1) Would be the simplest approach with
> the code we have today. I lifted that briefly with Sima and he answered
> "And why would we want to do that?", and the answer at hand was ofc
> that the page-table code worked with vmas. Or rather that we mix vma
> state (the hmmptr range / attributes) and page-table state (the regions
> of the hmmptr that are actually populated), so it would be a
> consequence of our current implementation (limitations).
> 
> With the suggestion to separate vma state and pt state, the xe_svm
> ranges map to pt state and are managed per hmmptr vma. The vmas would
> then be split mainly as a result of UMD mapping something else (bo) on
> top, or UMD giving new memory attributes for a range (madvise type of
> operations).
> 

Thanks for the explaination.

My 2 cents.

Do an initial implementation is based on 1) - Split VMAs so they are
either fully populated or unpopulated, each svm_range becomes an xe_vma.

This is what I did in a quick PoC [A] and got basic system allocator
working in ~500 loc. Is it fully baked? No, but also it not all that far
off.

We get the uAPI in place, agree on all the semantics, get IGTs in place,
and basic UMD support. We walk before we run...

Then transform to code to 2). The real benefit of 2) is going to be the
memory footprint of all the state and the fragmentation of GPUVM RB tree
that comes with spliting VMAs. I'll state one obvious benefit,
xe_pt_state < xe_vma in size.

I'll give a quick example of the fragmentation issue too.

User binds 0-2^46 - 1 xe_vma
Fault - 3 xe_vma (split into 2 unpopulated xe_vma, 1 populated xe_vma)
Free - 3 xe_vma (replace 1 populated xe_vma with 1 unpopulated xe_vma)

Do this a couple of million times and we will tons of fragmentation and
unnecessary xe_vma floating around. So pursuing 2) is probably worth
while.

Is 2) going to quite a bit more complicated implementation. Let me give
fairly simple example.

User binds 0-2^46 - 1 xe_vma
Tons of occurs - 1 xe_vma, tons of xe_pt_states
User binds a BO - 3 xe_vma, need to split xe_pt_states between 2 new xe_vma, possibly unmap some xe_pt_states, yikes...

While 2) is more complicated I don't think it is complete rewrite from
1) either. [A] is built on top of [B] which introduces the concept of PT
OPs (in addition to existing concepts of GPUVM op / xe_vma_op). With a
bit more of seperation I think getting 2) to work won't be all the
difficult and the uppers layer (IOCTLs, migrate code, fault handler,
etc..) should largely be unchanged from 1) -> 2).

With a staging plan of 1) -> 2) I think this doable. Thoughts?

[A] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commits/system_allocator_poc/?ref_type=heads
[B] https://patchwork.freedesktop.org/series/125608/ 

Matt

> /Thomas
> 
> 
> 
> 
> 
> 
> 
> 
> 
