Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C062D1CA27
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 04:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419E910E149;
	Tue,  5 Nov 2024 04:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCUXbZHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D3510E149
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 04:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730781916; x=1762317916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hH3/X08h4D1398hNLlqCmCyqp3BgRbr+kPr87YnbAcM=;
 b=kCUXbZHXByt7vICINiRJVHXikaFp8ni3BxurIFsu1gM89fL89iApshWX
 6rOgVoGozWjikFDFIR9Z2pyE+XFF/pEQOqsKzXnBe5yPyTX3H8dsvtJoX
 mRlshsCghESkx5nhov21ebL+t8vWSiHczp2r6H6wfeN0k0k6UDTLep4g+
 8W5Y67BRSHRXymq7FVxrG5BfKZ9ZM6FzaoQSGLfeqSeGJbR89flEtv/J9
 ngXecOF5HOvYN0Sawha4aVQO049NnPY3URbQzwl0C+oH4zLGhbMu2yHy7
 vyuk6PV1yD0fuhCF+3BWmmT63FMbFWVWgi6XqNrpKQv2QoyJvrRwjM3hz A==;
X-CSE-ConnectionGUID: xWJcBfY0SGSQ2MeindFbRw==
X-CSE-MsgGUID: r6OoTNrzRR+lFZOzZIlWcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41055891"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41055891"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:45:16 -0800
X-CSE-ConnectionGUID: QxZNBYO7RcSv2o5XX3ko7g==
X-CSE-MsgGUID: yuBN+W9HTp24ch/dbGDsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83537530"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 20:45:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 20:45:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 20:45:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 20:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiZjBiKo5Zwv0ynVElciOxzHOap+gcCtsG8cA3X3T9l7PXwvVz+/A6vSBPNS5WhfLumlgVfdfWnnO/hNiN8xM1fHCo4UzfQG9Y1ycaspHK+z527FQ2vfHVM6gnJDmPP98guKlJXbNrWuKUagtHwGScrBkYv3a8oVEicPUMNL+jmhtqqOsZyZkU9VNU7CUhRol11x78qdjULVvBoFhL8CmW+B8NXVEFP1gpr7aths1zTPvV/iBnFH8MD3S55THZMODwxYVF2WjtD19bytIyb1IMVPyGxPdf0fjD71PKTe+SjJEqq6Iq3WIjm6pKzDVHR16JCOAgqxAh7urbjVVYMqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5x+3cJwY+hAb+qcpVi/tZI7ZPQ5+vhtP0sSszFNRmM8=;
 b=VYq/YDx5/pSSYw8OWhh1VnvsuFQN6DrjLdS9RgHsSwLGy4vg+0PqQXQFiP7tOjUOx7xnXkwnSOl8UCdx2fG+X0oJpM7qte2SnH+fJ3Dbgbi7LAfmvBCfjmlfyX9TdPGYkvATvWHAwnoocyXNFaw6wZ5BTGGk2pKhoIt7V5eJ7GE1eWpBRdEk+bvu8q6zpDIz8aWp8rTALY56/FY7srOcjBHyJXeocM0Xzc5YQj2sgHmah+7w7ENDFRSZ0nb5rNfV9iE5IthWjIG6MS96CYxLO2lJK+6LBTAa0/j9meNP0PGKe2uC5TDt35KLoznhsE2RLhM3bdvSh/ZGIKg2l7NrQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 04:45:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 04:45:13 +0000
Date: Mon, 4 Nov 2024 20:45:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Message-ID: <Zymi+Ohpb9UnVKn0@lstrano-desk.jf.intel.com>
References: <20241105003832.4021758-1-matthew.brost@intel.com>
 <20241105003832.4021758-2-matthew.brost@intel.com>
 <ZymGit7CkuWQsHvj@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZymGit7CkuWQsHvj@intel.com>
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 22785792-f688-4418-7d02-08dcfd54a2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RzOkO5r9H2pfPIlmc/PJJsrdZpISiGtR2M2j0t1LnhZrg9zD6PesxUXEm1Ek?=
 =?us-ascii?Q?UuvIucMwW4d4ibe5NFgI1LSSxYZf9d3sXUdr2r1tQirklVs5VmVpPdDrvvYB?=
 =?us-ascii?Q?gZuMAXBQZ07fLadHh9RBm24LXmLPxPwaMKmrdE/4TfiZ8HqLvcr2yFI/IGDa?=
 =?us-ascii?Q?hKKBGcKugErHLSbxxG0Te1hQsvGlWc1mP6ykrusPdXvlYHSSx6LNI61SY6J1?=
 =?us-ascii?Q?ml4Ft00rJbFGWGnRno4DrzfACAct5XO8lixGdb+JMtH3/sSFIRZ+LsXV6g8F?=
 =?us-ascii?Q?Mt3lLTkOYOsXLvVNIPNDdKAA3BSwO3+xjtDgzv2kiTlVnhxU9rvgdnRMDqJ9?=
 =?us-ascii?Q?hv3pGxzmjrgUMN0P244pGFCjztmJ2CvXOBVaWGUM18pnXBuuQyzyeVINluIL?=
 =?us-ascii?Q?9r0zWw0j6ZPpYuTE9fxReYSeZP9xS4QtFIqtjiDuhOuT3fpdbQtnaY14Boav?=
 =?us-ascii?Q?EsUpfpPNb6KtXGLbE1oWbhORkuL3gV1Caa2yKve7tMtAVCzdQ/e+S64F4wkC?=
 =?us-ascii?Q?mdtKFngusAEtH3bEwxdDgVtfFQmmCEllL8cy2kOQm4rISBwDkWvVF0mQJiXH?=
 =?us-ascii?Q?PRQDaujPYKYjlL38ly+tAia4HvS+Z+xt8V710KSnuV0xpKlt7Au29Gx80ztc?=
 =?us-ascii?Q?iGZbxXenx+Aqmttsgs7gnGvkfddg8P1He3JyWLzsns6MzPdPMzbUkKS7te+x?=
 =?us-ascii?Q?HNPvus059RUwcZ21O33TVoPpEp9wV+kPPs9gbzLXJZPlzUd5QrUSWkDAB9Ha?=
 =?us-ascii?Q?64WX4YuS8mgPFCdeKI3hZKRvnCE89Xwx4IZ2x56tfNiU3tZuFyxSOk97/mIi?=
 =?us-ascii?Q?SxOHFj0pJe2Wsyu+yx/RscJ7gZEnn8JHwmQ0ZOVtpaYQACf1iXpOMNwWQMeD?=
 =?us-ascii?Q?BQ2cYDZ9TqnzVVrJ+OiCg/cI4kmsddQne1DfckE8piKG8xACVmHdZPFZULPS?=
 =?us-ascii?Q?N03FtZCeB778I4Ze69j7RgyODmDYuUKcli/87afShoia/H/3xkCtdiqHxSnx?=
 =?us-ascii?Q?L8io53U1AqjVWbRgQgiprwNHtageDhPy3BPrRAU8Rh5U4CGrl7DV5x83JaaL?=
 =?us-ascii?Q?rKEaV89AU0Ohba5CNHlMMUp4JQEmg+df0xVq5XSDDh77hhZyv6HFsRaCBIuk?=
 =?us-ascii?Q?spCds5pNSepDEvvPTj/EF1oAdclj2ZMCI6eB+8BwTN4chkHp2qDooPDtvncE?=
 =?us-ascii?Q?pqcxMNuNgzbRNOzcVWW4U9VSwhmXirJpkDXuJXcU8UjjLjIXLp9Zl6CNgo+E?=
 =?us-ascii?Q?hx+0Mt1hQld8BWd0e2BoUWUjsHidlaS95S3wF9qErlk2TChYzyrRmVe5r8OO?=
 =?us-ascii?Q?MvySGhPt4sIBD1+TjT0eY5vI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?coG1YTfq3T9hnqjVPMIRmXKiqMRc8nVZ5piNRf6jDkEJ6tPLTYhTnT5YNrLt?=
 =?us-ascii?Q?sfuyvzFT9q1oK/Jp5TVtIQILyEYcfqKfNOg+EVM3QTyAP/kqDiZRnHnpaUSW?=
 =?us-ascii?Q?HNf+GQK79X1fQnylL2WRMoRR+ZTGzWPQj7nvY0Gs6Q2HcGcGhT16u1lgwH8E?=
 =?us-ascii?Q?pFeXQY9fIjtiTi49l3vyrMV68pR6Hnn04bxNHQoz1LQsAzi0YDd5nJsMWcuC?=
 =?us-ascii?Q?vOgn1y+7t4Ndp1NOScV2bjI8owLrkwNZDnROAHUf4t3mOdWJDFuZow4JAHRA?=
 =?us-ascii?Q?plPxMQtTSO4K2aPbUFgCECaWiVzaO3o2PeCczO7oqXmJVE/kgJ5nVGLkegAt?=
 =?us-ascii?Q?wTyi8OzZ1/tu9EcFHgWYHexzq/kkpnuk3+jpdSErSx+EhfdbaK9YZ4wFOH5Z?=
 =?us-ascii?Q?2S0GmY4WXkcORwTRu3HipisGotfLmGLPCeUFw7A2zzGq/Zv8e6dttzs18qJ0?=
 =?us-ascii?Q?PTKd2zWY4aAXEDvuTheb6l4zvt9XW1tToXjgAGUaLxIgGqe7BMzbHYSemKH+?=
 =?us-ascii?Q?qJ0ztc8wotdrjl4SgIqx93EcRbO3PpYbxB1tm5mc4AdTdNpad1DyCHebh4iW?=
 =?us-ascii?Q?lPLDiMSus80APuyv6AxopxzsekOsXhif7gjlI4aSlHLA90F75cAv2UmsRG23?=
 =?us-ascii?Q?hukWmELYYnjT9AAYgT2KuyJMzP/30Eogx2p5mcObXfApFUYUybA//FSu7nkm?=
 =?us-ascii?Q?hNSNGvJq7TDrDaBdqKCunQep+oZoTAuDhKFafdRc+QqRpZLQecojHtUWQ6KA?=
 =?us-ascii?Q?xB+p4vIQjvsR53LL1h5r5NaNQeeL6cTih7V+Dwn6zKb5btDwJhO29Xq6++ll?=
 =?us-ascii?Q?fH4lu4jrgSiyuoOGoJtzdYiDPbOcnzqQhO8WwAbU7meVtFPt10cSSU9cftUK?=
 =?us-ascii?Q?3GFYrq0pKQYeQXnSXhv/5jQPdTFbvoFPQddA3ERvwsEzUUUpOHP7IGZMPv/E?=
 =?us-ascii?Q?bjk8ZrwF96dbrGu3gV7iViaO4q0/hQPBA4OI2nSYygBTWiOLlNlIFo5rM0/t?=
 =?us-ascii?Q?h5yaXPf5TlzJHQOnWRXwfIWe/2tWIuC2qruuZncx+htE/uW3zS2A2flBVqwL?=
 =?us-ascii?Q?wp3st3vxDF2KMwlyp17mHcPvg2pGT80FZIrmgSt+KqL1BPbEPxoNGXWeO7lh?=
 =?us-ascii?Q?5tmDLRNzKLnpmgqSq0I6MrkQPyqTbdn/bFFlrjMLSqKeE913aMmJlsACs6Wm?=
 =?us-ascii?Q?4rryhdmnxuA5VV335SvfHbhKEiC8GD0/lnioKOODd+sbj2EHb7Jz1ZjpEVAe?=
 =?us-ascii?Q?w5iX+qBYueON8X1gycuVNd/UNj+hvMk+z/1cvNnfeyEkv6tnT4m8CL7TZjcz?=
 =?us-ascii?Q?Hjc/pXjDELV68UANJFK8Dhcnw28NH5jCxZrNdJPHQ6DqhhfjzlFjrllZe4QN?=
 =?us-ascii?Q?8fuCyFBON0rfjS/KmsihwVrF9CUhap89y6XECNjjG/9QVh6laCh8MPIdzyqK?=
 =?us-ascii?Q?Rn7TGea3MBkYo4TkOcCpmIipEWNKAUbJkpzr90yCDCdg7nTH9ANc0bOaS4BL?=
 =?us-ascii?Q?m0FWNQiEXXopxN5/K0ZF1NEHypu9JS5J7MSx7bHhpGmsxz9NhROsBxPApHEv?=
 =?us-ascii?Q?bllpQV2M8M9OsTE5j7lb33Xkz1QoOIZiGozgSQ9fNiLZUGMudJl7NbwyOgNZ?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22785792-f688-4418-7d02-08dcfd54a2ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 04:45:13.1646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XX6Vd8CJ3Qq+lN+uDJmmgtqfBy4iGxA2cLyJdrFruKe0DUZLKeHdJtnsPyfiaB80oTHiDs3U3OUIrft1HnxZpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

On Mon, Nov 04, 2024 at 09:44:26PM -0500, Rodrigo Vivi wrote:
> On Mon, Nov 04, 2024 at 04:38:30PM -0800, Matthew Brost wrote:
> > In a couple of places after an exec queue is looked up the exec IOCTL
> > returns on input errors without dropping the exec queue ref. Fix this
> > ensuring the exec queue ref is dropped on input error.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index f23ac1e2ed88..6de12f91b865 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -132,12 +132,16 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	if (XE_IOCTL_DBG(xe, !q))
> >  		return -ENOENT;
> >  
> > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> > -		return -EINVAL;
> > +	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
> > +		err = -EINVAL;
> > +		goto err_exec_queue;
> > +	}
> >  
> >  	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> > -			 q->width != args->num_batch_buffer))
> > -		return -EINVAL;
> > +			 q->width != args->num_batch_buffer)) {
> > +		err = -EINVAL;
> > +		goto err_exec_queue;
> 
> this function is so huge... it probably deserves some splits...
> but the patch is correct
> 

Thanks for the review. Yes, big function. Let me look at this, I see a
couple of logical places to split.

But I think in general our exec IOCTL is pretty tidy...

mbrost@lstrano-desk:xe$ wc xe_exec.c
  354  1320 10399 xe_exec.c
mbrost@lstrano-desk:xe$ wc ../i915/gem/i915_gem_execbuffer.c
 3645 11483 95597 ../i915/gem/i915_gem_execbuffer.c

Matt

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > +	}
> >  
> >  	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
> >  		err = -ECANCELED;
> > -- 
> > 2.34.1
> > 
