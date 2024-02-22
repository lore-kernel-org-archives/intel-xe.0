Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB1DC47DD9
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 22:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510D10EAA2;
	Thu, 22 Feb 2024 22:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqZVOC0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4F110EAA0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 22:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708639559; x=1740175559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=80QusVAl+MyZvlTLjBvEyDmTgv//w1O6+x6+FIiEDjc=;
 b=bqZVOC0LRezRin/+cM24HmUJnq6YCPwUtIehZ+Gq5kQ5gLAkwmGNgaYq
 CsOFSEcb3L6NzaewcVX4HH5VTF7XQrTUIp1M+ekh0x/KMTJE+zEBKb1b8
 esxYsW/ahMH3QnfCuMw/TFFpoGVMyEzPfNJFDDdzF+HCZ8A9m/tegMl4c
 n479AUMj4CaAIPeDZfnZjm7ST2JIX0/zHnt2T738VfW6BZ2/CB1WOLQcr
 Mbt0HTrshhPCZKRhYH1PN3XN2f0jdTSy9hkzcYPKscMhe+hQN61tMTNsz
 24tZ2CrRshUVyJ4+poD0eTGO026IhmXe2qbfxzXl7hzT/p4zG09aZb9sl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6682566"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6682566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:05:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5945470"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 14:05:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 14:05:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 14:05:57 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 14:05:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhPuppUF8KlkBQJrBqXQVAPqjZJpTMo4g+EYBirLDqz4zyaH4STXKGVLIO9Zu+HY/JlXgW1qk5CcBjsKax9IfL1RGzbXRGS7D3ckUccnTRXE/EgDFiwlQoTIJ1qjDJwkJiJORPDC/DhgSaSI9VsYqMQxaVwvh27et4GisHTPm+7S3Uu6Rfi0dx02mD1U42ev6e3/iTBA5nWx8EJqbE1GIHh1ENNge8njPJmUA7JxQAgasIOYVPCHm2qSCBmfbtjq6dUusOuTpNMiuQsZBm/pK7lhyTSq7ueG+1Go2IDwdjkUsvW5U+LS28aGhuMHEfBZqMtQmm0GU0QryPOBhn/0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/NUPdid8EpDaEcqYOyhIuqPgNIQ5HmrPbE7lWMnRZU=;
 b=Da6Y1yV6dBYKxP54Ugkl9fHJMuqIyAgDRKo+FaILvepOfYphTptQt9bAMTcuqKgnjIDLjRCup/dIc3KIPMD5vwjApdltl6BZuDRDyuzrtE+m2tHfXlh5v8beP/MHqMPE3V21xKxy8j7A0AaWJwBE8RmxYundptxzFRZSu1vtZW3kSObMCcgCQNTnJAwxEN/SNYmimI8dOBlglYaeV6JfnzWPAg/kBsavwNErf///7UuhyzIuDvC72K9BvokTv5S4uLCIr3yckqdTauzOT+mB0w+6gScXDpe5ZaPTYhvDh5qTSzmNfvm0QqvULJ+QgAbLU0Xlhjy/2ScvypSWqbwzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL3PR11MB5683.namprd11.prod.outlook.com (2603:10b6:208:33e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 22:05:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 22:05:53 +0000
Date: Thu, 22 Feb 2024 14:05:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH] drm/xe/dg2: Fix number of mocs entries
Message-ID: <20240222220551.GI5347@mdroper-desk1.amr.corp.intel.com>
References: <20240222204203.3007498-1-lucas.demarchi@intel.com>
 <20240222211639.GO718896@mdroper-desk1.amr.corp.intel.com>
 <4mbtddukq2uwra4ssin7dufh7ytln6rnvn2ym6xaubxwbrrsag@3wxthrsbuqsb>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4mbtddukq2uwra4ssin7dufh7ytln6rnvn2ym6xaubxwbrrsag@3wxthrsbuqsb>
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL3PR11MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a64338-8fbc-462a-024d-08dc33f2702d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVSIiwgLEVI+93/yAHNedrBpmB7CSZaxwUP5vj0Qm2jvg4peiL2IcF5sIq7+ppGC8a28xEcQSTwsdT0irl6uY0s0ICbiHn4LRjqLRJ2QDBUbIJ4hXAfKx5JAcLXXLY1w0uIQm/9yPACOqL6zjjukWYIvWsYRw1+PoaB635BffLxtb9ePzoifDZqeUiUDCpMDPEP4uJpH2CTtPPEM42DbDWNrQp71Md/vZ9UEciArNMgZO1BvzYxElGAqjmNTtQdAUKh1fR/hal+ksbb+db+v7ZhoJdpJeq4b7VCkaDkwIAJr6s41RRGIBimLIX0ikZrujz31Bj06XtOOvlNhPDD+B12Mblnr1rF+lajZ8YovDncbp9ZYPkB0c1IrOjn/6W/9w4HdBYWZrp/+fiIVBNF3OThSN2FTr3uBhnOiClqSP1XTUutE05o1n93ot9ef2EZgNZAXZFmURZpChOFMI+tDlus0Ktpzee6gnth1xY+RZCmWKtQWvmtrr11iEGSzjRHL3cISSkLPdpri90GJHncmUeJyE4YAzWii/4dAt0sqOuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TTjEdjnG/OJoY5fZ7U63+Ghc3uC5+i4zKM5rxnAkwz+yZT6/gYJseKTkwPG0?=
 =?us-ascii?Q?h8KXfA8diFn7vBuz0rYeoPVp3r24Agd3j8l1a8ErJqfNMLPK8dilHzQezI8n?=
 =?us-ascii?Q?p3AQ+0UgREtuJaYHlx8x4uh04ht2fRscTb2qE2BNTLBpHhfxe76uOrBbwqfu?=
 =?us-ascii?Q?6/GXGtjiBNKBwIZTvTSabUr5iCp1aGTb7GX/hD8BbkjRvxe/DWAnHb7imAI7?=
 =?us-ascii?Q?xLPC/JEqhUQ1aXpFRn71+/5kXLdZLujz4vecsUih/1yWoKeP7twi2Y2aGVKM?=
 =?us-ascii?Q?/o/ghvF8VjHHRVlh7joesISXZk94FmBK7g5L90yKez14/FFMkrkDWdsZ5uDS?=
 =?us-ascii?Q?OFhm0CmLHOttSbcG6rukcmiu8cF0qMse/aMpp/pl0Lih3l9dzGdaUW5doC44?=
 =?us-ascii?Q?hobg9I0pDuMtIxA8AJk/U6jZYX0MNlyGDvRr/Nrk+QV4FpDeqeWHjvQN01+L?=
 =?us-ascii?Q?JG+a8un2fdzoF1GPYCzDlpA3eIg7sEFl3vrNWnuZK5Wq7fic0N5gAk8lcZQG?=
 =?us-ascii?Q?clUXYXufsfC35PIRUf7IM4m7XgoQg7HolacZLIKNKoM3QmhaZCIb+wcC7RQU?=
 =?us-ascii?Q?SB0Y2REg2Tri+z4jO5T5fF1bzT2Wq0mItwYlaW2g9vGlsZnZyBHMEi8GjBGH?=
 =?us-ascii?Q?bTkx8vgndkUpn8KXmOibeQPtSa7GulsUYBr2G2Ry6Sy+vmKHy1KK1kI00/du?=
 =?us-ascii?Q?/8hne3itWPNeaerdXVKk1dzPvw4vhPWwqZP5L88H1/rWuqoLxbP/AZ3/94+T?=
 =?us-ascii?Q?WX8BerCB7w4wUEkJ5sI7dyxjBaIb3XqWmRxQxx4uJnTixhTkYi1uFfO8hLH7?=
 =?us-ascii?Q?Y1RQZRgJDG0mVAQ1gA6J7nmJUPXvFQ5dWg2jnBngkEzO4triwrjB+HDUxxBF?=
 =?us-ascii?Q?vkwJT2GJDCsY3MWf1DKBsPlW4Y5fGbWkekm8eV0IJCpSMMtV+0qzUFdY4nsb?=
 =?us-ascii?Q?KD2oqApGSau1U78jsef+kizS8vSFg3sCUgSKzPqUfKmOKqfYMGrZoi4nTWl9?=
 =?us-ascii?Q?NOLnK0RAxUIXrhS3mM3NocBqTp+qCi8++gc1kq2avNthtZ5ce+h5Zj9wuK9N?=
 =?us-ascii?Q?p+oAuMeCwrLiB0BOrXz+ZZfapJdls9AhZ9ch944hgA/ldDDvVEOm0H97loKe?=
 =?us-ascii?Q?YxC3CnTAZqPU9AeudfJcPYp5ji0DAOSo3LASm058HmFv++/pA6iJrggbp51m?=
 =?us-ascii?Q?U/yCx1NzX6uf13MDfv9hlXu++9PyEl9Hn1fWW0+DoP/CDFSEv8ZBKirX/rM6?=
 =?us-ascii?Q?GJW6JTV4FYF9rZlXWa0DRSrfVdpuxOeo0Sghys2UByoaSkD4On78CE3Gw1tS?=
 =?us-ascii?Q?ydsKqwsMS9IRtbaGfKAMeJt+YEUdHXh4vXyDOCIh01leomBGWbS9/+reOJ6q?=
 =?us-ascii?Q?4UrKVIZP4Ei0Csu/ZeKktWiMX2IDoI6gIy+xfDlw2a5VQQz5SnPwba5mbqKD?=
 =?us-ascii?Q?PAzIqRBMnAQvLsf5YUK/dhJRBevS9b7HIOkC/dejz/Htq2mtBaL+f3A7jF2y?=
 =?us-ascii?Q?MfQOjjN5I8gZvw9oa9gWYMKVmuhL3Ug5QTrpB1gZOwns5R+HnV/lZAYmuYW2?=
 =?us-ascii?Q?BjA21qa1QH/MkWo5d7bWfLB29VeOdJhzbrvAMt033U8Yg4DJpgeY+Gh3cP85?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a64338-8fbc-462a-024d-08dc33f2702d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 22:05:53.7772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcDp9yK1/rE40MO5jfoFv2l251q3DsO9vLBgOYG3Wq+qSfXzC2AZ4YitduBA3tG7X0N1mPExcLGBt2ldYNhTD31zcAn6B2GkTelGDMVRZkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5683
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

On Thu, Feb 22, 2024 at 03:53:56PM -0600, Lucas De Marchi wrote:
> On Thu, Feb 22, 2024 at 01:16:39PM -0800, Matt Roper wrote:
> > On Thu, Feb 22, 2024 at 12:42:03PM -0800, Lucas De Marchi wrote:
> > > While investigating why xe_mocs kunit was failing for DG2, Matt Roper
> > > noticed that LNCFCMOCS[31] is actually RO for DG2. It would be a spec
> > > bug to document a register to be programmed that is actually RO. However
> > > upon further inspection, it seems like we should not be programming the
> > > other values. Early DG2 SKUs documented that the entire set of
> > > LNCFCMOCS registers needed to be programmed, but this is not true
> > > anymore.
> > 
> > Wait...it's not the bspec that required us to program every index, but
> > rather the Linux-specific need to ensure we don't break ABI in the
> > future.  Although rare, it's consisdered legal for the hardware team to
> > add additional documented MOCS index values to the table as long as they
> > aren't changing/removing any of the pre-existing values.  If we have
> > (buggy) userspace today that's already using an undocumented MOCS index
> > and operating properly (due to luck), adding the new "official" settings
> > based on a future bspec update could regress userspace if those new
> > settings do something like reduce the coherency.  So to guard against
> > this, we always need to program every undocumented index to maximum
> > caching, minimum coherency.  That way, if [buggy] userspace can operate
> > properly with those settings, it should continue to operate in a
> > functionally correct manner if the index suddenly becomes more coherent
> > in a future spec update.
> 
> from checking past platforms and the updates I was actually under the
> impression that the table  in e.g. bspec 45101 would always document the
> possible indexes the HW can use, leaving holes to complete it. And those
> *holes*  would be the ones to change for future use.
> 
> from what you said above, it seems it's not really the case?

The authoritative way to check is to list all the MOCS registers for a
platform.  E.g., on MTL the LNCFCMOCS registers have instances from 0-31
and the GLOB_MOCS registers have instances from 0-15 (since two indices
are packed into a single register via upper/lower fields).  On DG2,
there are 0-31 for LNCFCMOCS.

> 
> > 
> > > 
> > > Do like is done in MTL: the additional registers are there, but we are
> > > not supposed to program them, not even with the unused_index value.
> > 
> > It looks like this was actually a mistake on MTL that was overlooked;
> > the bspec documents only 16 entries, but the hardware supports 32, so we
> > should be explicitly programming all the unused ones as mentioned above
> > to protect against future table updates.
> > 
> > 
> > At this point I think we're far enough along that it's extremely
> > unlikely these MOCS tables for Xe1 platforms like DG2 and MTL are going
> > to have any further spec additions, so this MTL mistake wound up not
> > being a big problem for us.  But replacing XELP_NUM_MOCS_ENTRIES with
> > XEHP_NUM_MOCS_ENTRIES on DG2 is going to extend that mistake farther and
> > make it more likely for someone to copy/paste the same logic in future
> > platforms.
> > 
> > The fact that DG2's entry #63 is RO and can't be reprogrammed by the KMD
> > also means that it's 100% impossible for a future bspec update to
> > request different values for it.  So whether or not we try to write the
> > "unused entry" value into it doesn't really matter (it's easiest to just
> > keep doing so, especially due to the way two MOCS indices are packed
> > into the same register), but the test should be updated to not try to
> > verify that last entry.
> 
> what I don't like is special casing the test, because the driver tried
> to write a WO value.
> 
> Would reducing the number of entries for DG2 like
> 
> 	/*
> 	 * last entry is RO on hardware, don't bother with what was
> 	 * written when checking later
> 	 */
> 	info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;
> 
> (also increasing it for MTL, for consistency),  and then making the test
> do the right thing for odd number of entries be ok in your opinion?
> get_entry_l3cc() already does the right thing, but we are not ignoring
> the value read back.

Yeah, that should be okay.  If this were a platform that used both
LNCFCMOCS and GLOB_MOCS it would have been problematic when only one of
the registers was RO and the other was RW, but since we only have a
single register controlling the settings per index on this platform it
should be fine.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
