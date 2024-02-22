Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F9FC5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 21:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B5410EA94;
	Thu, 22 Feb 2024 21:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KM7Xe8mO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A4010EA9B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708638845; x=1740174845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NaZmcnIGwOJfs4TXENt2WNPoqe1BXoKGIgCpGgAnSjk=;
 b=KM7Xe8mOEGWPIOWsSB51SGAGD+NzDq9acRI+tlNAxI3CXsq7DQd+/zqL
 Xf2RWtAn2gMhT1c3T6O5Ysn4qDI5oc6ENYai0Gbvf6pvipFa68pab+0YM
 pJqNkKuULJUW6qm9ELTAI9JwzYP0yCSX7oIrfF0rR44bD5sc5e2hFX+BB
 2abN4oJU0wjAz4NCbx13P3imuThxXU2eKJvUuYkveu7QnnG27gexshOR8
 rptLx9hRCogK9JID97VeDaXrnjomFu71EK7EP1kZwmLLOPpP4v8ycZL9q
 PIcO3lALelstb4OiiVp0CNuO9FvTViwgJUQVAHfwdVjfDKIgTTwiAkTEr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5856835"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5856835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913595908"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913595908"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:54:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:54:03 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:54:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:54:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:54:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3SKk8IyG8BkXAqJxw6u4EfG00wfT5eL+d55IEZjWqZ7RTP8fJHL7rDfjSVOX0yHv7MQ23jRkLCPbyqPnx4pOT1icEn6fvh+8DAutv8LzIGTuRiXqFm73ydrdjYNTCo9YdyOiaNHG2FeJfXW82shFCCD4xJ++yQtEAccma7VMLgevL8Gg3933EafUIFi1gRpkvWXFdtwjFd8C46TY+XUabzHCXVSrvxPjSiYvb8o1JVCKU2HE4McqxDAmpAm8f6d4LpASE/KR+kpCuW5JPPARuP8s2t9w8Dvq/oObU/t3QqWiBbttFL09m2gyVhceS8MXUOMKZ+uDLZp8jBL7EflzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqhUP8ECYjS155LfpQim5BnUragM3EV1douXUmp1Tq0=;
 b=O+HoB5YYZQ/Ar6OR6KAzq8zhc3B3gSMI1DuCAJU3X2WyzBidHEXXp/L8a9BwyYvGwAkaNEkwwDr5Oj/Ga0oXNpgoaIhKY+cva2M4biNmM6Wn9XJvzkSxOLpaa+ZlxMbJhmZUGtibrhgPDddfjTnHeAppc9qur6ofk+WIKwxakhjA4EiGJuv0LQ5tAEcAr0xuHlXHW9hIj38DGBQB8yzeaPvwnX8MTgfiJ/nqGHX9oXnb8vMU7YvBW4KYJX/wablVf68NMcXI3iA+8vUGDotSNRUKn+ydpKPdQTF1e6dERy8D1kj33EvV0KQxMERAPgrH24dKBX0nJ1hqECGNvyuGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 22 Feb
 2024 21:53:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 21:53:59 +0000
Date: Thu, 22 Feb 2024 15:53:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH] drm/xe/dg2: Fix number of mocs entries
Message-ID: <4mbtddukq2uwra4ssin7dufh7ytln6rnvn2ym6xaubxwbrrsag@3wxthrsbuqsb>
References: <20240222204203.3007498-1-lucas.demarchi@intel.com>
 <20240222211639.GO718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240222211639.GO718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: ec252814-84a1-4994-066e-08dc33f0c5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aH0b7SyvhaTVJMrkYUSIBtI7aP2R2penmVTYwwGO208vHQalmXCITCIz2cnjlbdzKgjcBGD0y/w8r/DQzFA0wxAqcSZV3QqsY8qFiX7SpHZ4QdWTSmuafYUCwBEAt7hRmCRp4RgCmYAifF2wjOYudXwuJMphtjYoHz4GZKmrxOzndrJe9GXG7DSWCfjpTkBdP4Kv2EA44iNGf7N/SAYIFAoYpYu6mS4aoYMaw2ZxhO/0TM69sDpXtIJNkuMxkSw44ICc53+JaouIuCNAQRFp518mxMX3vy8FSwrxxU1fqY8+sivloU6sRe4e2m+5OjL7RX9gulKLuqHDmPCh85RGPPLx0Fh+lzcasRccOmN6zgsoAqU2TXkGjHD8cclg96eJYlytjL+yjx7feS0DyLsk1QvDJoU90JrQx7fIO4yNsJRM3cn0lRJXY6/jXxP44cL4Iwb6xKY+Oiq3qzGfIpmNclY5OY/NiLVN9UgRHHK0hCYZtweaDzPHCXHolmOfEWbJTaLmqkE+LaIycny/OTk12703brXF4IEradp6XloXF78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wKcXmsSNlRqJEOJ+umKvwE2aYURkX7txG9PrdID24VXBbJ0sCYM0OyGK8/ZM?=
 =?us-ascii?Q?Q7G2Jaep0THgUh9G/3yBYDDj7RFRkI0ePUD0QkHpDOtSPoi4Ea4F/nnzxYjm?=
 =?us-ascii?Q?cLSVxb3bwYz+79oqu5KA5hqFS06fzuUQXVzdfy5RhN9agBQtZ3TxpBbvJ1Ny?=
 =?us-ascii?Q?uhlqFELr5JG2Die7rNSLZJdiObVj+pT/1aL0HgXQxrtOourL53a5IHw8ob8T?=
 =?us-ascii?Q?igiIiANdIwfgpQ0lJesrj3nieJm6edH3yfp1jcOY7jGmG38+Qdg00ae4lXeH?=
 =?us-ascii?Q?TZ+8+kaRf4igZLGGh/RT1PF2Ph4EKBrqub+qr4Q8OKGprdYAwPT7PG4GP7VP?=
 =?us-ascii?Q?OKkqHdjScasDBQWrzzVwRaTslAosJZ7ae9AbosHg7zd8Qbk9o6lDultEdGK3?=
 =?us-ascii?Q?3r/vWbgcaeID1XQE33VC3NmQAS1p+P7qr8Vxe6ADkziwuYOya/IUMkZOJGAK?=
 =?us-ascii?Q?YZHRYofzNgo9prOKSokgSrZ96C70aWjw+pkteMCAc2qx/C21p8LmnL7Sk4eW?=
 =?us-ascii?Q?AGhFZI+EKT7DKkKCIkmKXVUKqNT3GwlPf3hCm5ugb4lFrO4kQcX0vuiBnvpt?=
 =?us-ascii?Q?lMEOIPOifOGWUQrv1xjlpYMP6VqwBezq5oLQtxMcBZijwRN1VDx2xS6TikU5?=
 =?us-ascii?Q?W1wQgdHGDvweDKK7KlI66tjP0iUrm9n1qud4IGthpi6UFzjRwhH1VLsiYPUu?=
 =?us-ascii?Q?QsF75PXcI09lU2b/ODCHPhKFuxepWsQpixI0FiL+bSFmp7EVY0U0RW2Dq+3s?=
 =?us-ascii?Q?g6Jm1oxgDu6vwBuXAnG+qmTQcU6DNuLZfmD3nWqpMqpcQ77FegQ5XUYxTjgm?=
 =?us-ascii?Q?90rpAyAWdjXoaDY3JQvrOuiZeSAGP0bKX5JnfokNgm8HyImSnJ0XZb64++iC?=
 =?us-ascii?Q?TRaHHIMruIBS3qlld29Yq3EwjcaLzT8TD3j8ZgCvZMXhAii8hIsM/EMUrbZM?=
 =?us-ascii?Q?7Ivw2eIo1Ykn04VDsCiPhJME4bc8l3A4V5Hr+R08O/rlk21QzODQuBFFWxZj?=
 =?us-ascii?Q?eFYX3O2oVw5ZFBkMuvX1vRK5TAMStqjnwEYr7tAGPpyaD5c8nvWF/VxMtkQE?=
 =?us-ascii?Q?MAiokuArcBEVx2STQ5jyDuhgZ1qIQziA/fKshxZaSBROrSz34YBwkTNrz7Xq?=
 =?us-ascii?Q?lu0BNWBtCUmeHuqzuOm0iktyMHurd5B7jcMg8ZEh8LeZ7U+gcARZPTRCFW0o?=
 =?us-ascii?Q?4D7QV9fu+xtXR0jLU3O00AJ2GLEyDnVDKansBu/M0BdCwI+9htuV/1lgm690?=
 =?us-ascii?Q?UUK/YvE3ZvjXpPOxc3DBxjbPmpW9abCjTIt38u5LTRaoBSwWSlqLuJwPzQv1?=
 =?us-ascii?Q?bHxcoJZquAihAvgVxjGtm4zGyse6LJhVSPRXW7ggQ53d9ZZpYEFprMshGL8N?=
 =?us-ascii?Q?AKgga10dU+DGSmakhxFX0LzpYOFc3w6i9w/lkpXhZIDF6c4qiYVM7Yf8iULq?=
 =?us-ascii?Q?B8pSa8HIDnVOgLlzaab3bvzI27f5ZS8aazBj0RgHXCEkBFjxhsG1/EmAePEV?=
 =?us-ascii?Q?qNpmL5wipB4ud/3XmKDW24SLGogxI38xFRYLkZLIUE7nZoD4x0YZJqEvepG9?=
 =?us-ascii?Q?a1qstGlL7j+g4pILArmYR1t2qsmDaSJQd+9YskdHFZHIanpDr3gRamfELEEs?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec252814-84a1-4994-066e-08dc33f0c5ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:53:59.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nICpOKbVeamk2X5blkMuH/rQtHtRFX0lOXTZFW8s59mJ9NaAOpmhlKZvhc+7sDR8BZNnr6EreuQ5si+QtYwLaQgClWKHrF52f5Iwzdu58VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
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

On Thu, Feb 22, 2024 at 01:16:39PM -0800, Matt Roper wrote:
>On Thu, Feb 22, 2024 at 12:42:03PM -0800, Lucas De Marchi wrote:
>> While investigating why xe_mocs kunit was failing for DG2, Matt Roper
>> noticed that LNCFCMOCS[31] is actually RO for DG2. It would be a spec
>> bug to document a register to be programmed that is actually RO. However
>> upon further inspection, it seems like we should not be programming the
>> other values. Early DG2 SKUs documented that the entire set of
>> LNCFCMOCS registers needed to be programmed, but this is not true
>> anymore.
>
>Wait...it's not the bspec that required us to program every index, but
>rather the Linux-specific need to ensure we don't break ABI in the
>future.  Although rare, it's consisdered legal for the hardware team to
>add additional documented MOCS index values to the table as long as they
>aren't changing/removing any of the pre-existing values.  If we have
>(buggy) userspace today that's already using an undocumented MOCS index
>and operating properly (due to luck), adding the new "official" settings
>based on a future bspec update could regress userspace if those new
>settings do something like reduce the coherency.  So to guard against
>this, we always need to program every undocumented index to maximum
>caching, minimum coherency.  That way, if [buggy] userspace can operate
>properly with those settings, it should continue to operate in a
>functionally correct manner if the index suddenly becomes more coherent
>in a future spec update.

from checking past platforms and the updates I was actually under the
impression that the table  in e.g. bspec 45101 would always document the
possible indexes the HW can use, leaving holes to complete it. And those
*holes*  would be the ones to change for future use.

from what you said above, it seems it's not really the case?

>
>>
>> Do like is done in MTL: the additional registers are there, but we are
>> not supposed to program them, not even with the unused_index value.
>
>It looks like this was actually a mistake on MTL that was overlooked;
>the bspec documents only 16 entries, but the hardware supports 32, so we
>should be explicitly programming all the unused ones as mentioned above
>to protect against future table updates.
>
>
>At this point I think we're far enough along that it's extremely
>unlikely these MOCS tables for Xe1 platforms like DG2 and MTL are going
>to have any further spec additions, so this MTL mistake wound up not
>being a big problem for us.  But replacing XELP_NUM_MOCS_ENTRIES with
>XEHP_NUM_MOCS_ENTRIES on DG2 is going to extend that mistake farther and
>make it more likely for someone to copy/paste the same logic in future
>platforms.
>
>The fact that DG2's entry #63 is RO and can't be reprogrammed by the KMD
>also means that it's 100% impossible for a future bspec update to
>request different values for it.  So whether or not we try to write the
>"unused entry" value into it doesn't really matter (it's easiest to just
>keep doing so, especially due to the way two MOCS indices are packed
>into the same register), but the test should be updated to not try to
>verify that last entry.

what I don't like is special casing the test, because the driver tried
to write a WO value.

Would reducing the number of entries for DG2 like

	/*
	 * last entry is RO on hardware, don't bother with what was
	 * written when checking later
	 */
	info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;

(also increasing it for MTL, for consistency),  and then making the test
do the right thing for odd number of entries be ok in your opinion?
get_entry_l3cc() already does the right thing, but we are not ignoring
the value read back.

Lucas De Marchi
