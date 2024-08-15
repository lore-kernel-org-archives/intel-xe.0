Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD065C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 14:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F7E10E452;
	Thu, 15 Aug 2024 14:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4688b1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F100010E452
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723733796; x=1755269796;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vMgy3gl4NvmcptiEB5eES3fsOsZ6Zn6faRqjKjbhP5s=;
 b=K4688b1DoRcB77JC8uPNfRxodB8AVF3/KckRKAAGeP4dmHnyLAdrf7om
 mjXQbYFdHXWEfx3XKcdHPhm0MIoxlInBZ99BMEbsLqf1K8fGofZy2NFb/
 f9PofFhiNYLuxzWGO1fiPYyJAL5nNAGz0VLkfgPIBvN/PzqvVB4S4zF24
 Q9WF+t3IL4vLikkHbMozp/udHXI52hEhl86SQ0wpg0wY/VmU/CFMWKM2Z
 hM+mKgE1caDc5RconeWttEZ8hwtYlyQjToUveDtsy6iMxYeOQQsq2bvD4
 Imy7uUL5slgGxQrYhLJLiGHrYvdxYJq9AjfdDL+itP4vueOATyjuZHftE w==;
X-CSE-ConnectionGUID: 4yl7zv//Rm2JXFXBg69zZA==
X-CSE-MsgGUID: 3vmN5xTWQgiwT1XeaSKySw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="47399861"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="47399861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 07:56:35 -0700
X-CSE-ConnectionGUID: AqcKh+WTSJO6ucmwB74bDA==
X-CSE-MsgGUID: qjVB2pxuTXiiGWgknuIfjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59336506"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 07:56:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 07:56:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 07:56:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 07:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TovURl5AYJZ7xUVmhk6pOQHK+8nLZtrFoC5VmjZEAWAB+h1cDfwsdxiw8p85h0OxwT3rCnLk+jCLdD4n3uOIi8HO4lnTZ/ccfeXcqFZJbsKqo333/A3HvsAFJlXMhyO740iUgOjO5tQiS5lPSYSXHKaM5y5eU34XYofkW7oHHzZN3aII9jjbQJoVaUbBxoj7kaOWuMqaliUTmsAVZW5h8BLsu6Ncw/g9jk8OBUtiZn6h8K9DCw+hSrGuTkK6KwNK3ybZfg9r51AsD9XnUx0mQsc1vTtT/9M+xMqYFs+F29aEoRQ3XZUaU9PZoiG4Zmd+l5e2GdDGWu9TAiNQ4o3zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w30GoyM0lY84QvyBzfWsxtZDxwpIfWVNcxi6H8smOQw=;
 b=zLjzPTRdyxdjqXF5+dmN+IAmmYhhxCNwswsWR5p+f3fFRGcIrrprCT1NjeUhBRNXAKDjh2n10nMv7tlvvgbp1CEbOBO/kNnHxjnZ9Cy3DAW+dQL9xhthJdM0xstlr0BEmX2MCROm3H6h3H2HCIRu2SWhSkDQYlDkBMIHKqfSWZ3hpPFV7KfZRrWKssKiOjH80F4RHUx38MKXa68kt89p8lWJfRVv35CXsmOWKoYk33aFfdCBotxw6BGPvCFUwbkNxUKfEvod4JuOymMI0uBRv1aXeCFVpUEItNoy3t8P10db2yEluT2mmai58MwpMm3idkpOzNcvMt8iiM9JJIfWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 14:56:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 14:56:31 +0000
Date: Thu, 15 Aug 2024 14:55:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zr4W3VPtYEJg/pOE@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
 <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
 <3ea93f190b62c3f320abe150d00d06eeada07b25.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ea93f190b62c3f320abe150d00d06eeada07b25.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:a03:331::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: c030fd8d-3bbd-4994-39f7-08dcbd3a732b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kvYlbj6UK6j22e/1lEKjZCFC6uAIbSZE9YJ4ZgAqCRSKuHO6PYDy1TWFXh?=
 =?iso-8859-1?Q?TlBnXpBt4vA5VCDDNJcXyiqNOoh/ReeGCDuiJqiD7ysnbOqdbQ+3RMZUq5?=
 =?iso-8859-1?Q?5e/R7qaZNOx+kH/XRWD7vOMbPqq6A+VaT5fm+SzO+wvR1QKaPqXai9qsz6?=
 =?iso-8859-1?Q?Mxg/UR8IWKPm0ahhF9bIkk83CUwUWr8nS53yR4rK7o0aRe7PfOXUszdYcK?=
 =?iso-8859-1?Q?4fhRhzNmSInmveUe92tNxqOe4T1s23sgQ7dTf+AMuReYwo0xsc7MGVHq4n?=
 =?iso-8859-1?Q?rfpn3IM15ak7/GVmk11852jPXz6ch2UD2G/0m/1+L7V/tO/fFPFpWEmKH+?=
 =?iso-8859-1?Q?nAE93aXUbFU9cXVADIkpFQg/4DBv/bqjCoFp1s1vTj5IegHKi2chv+ce+t?=
 =?iso-8859-1?Q?qKKUR6H82JaIUYqHwb5tVTstEcOpR1TPzlLwElR/qxIxXdp45gOOKXBOLt?=
 =?iso-8859-1?Q?6K3uIb1InOI1CGH3cUPv2OrFlyKFYAYsRk9Co5xblmCXWkq+I7UsDuoVye?=
 =?iso-8859-1?Q?d6P1gQrZwbIzup8Wngeyvs8NhKUWwFQkmUWHe5mhKFsrfsm+AtnQZJ1/OT?=
 =?iso-8859-1?Q?/rGxsRjYGnBUcdsX/QTOlVRsY8hCSUp7OaznJ4WvcqJxVpIQJqyQR63JfL?=
 =?iso-8859-1?Q?aBbGFo99aYKdfPMx96JOKR5mePmsLSZz5D+I1apqI1mv+bSH3ofjXrFM8z?=
 =?iso-8859-1?Q?nMMDwUKJ4gvRHl0kyW2vhHTOR8XIuF1gl0tkBU4Fqzs6R+ZGgAyFoaUxvB?=
 =?iso-8859-1?Q?HvE1jGWdccCKYBZuy4ERoRytTvCy53uE5MqfYAVFKpNLSt+TjyYE7EEI+j?=
 =?iso-8859-1?Q?1yZBjC6aV0m0AnBWnvsK09Onmo4/iAPDruaHbev8Nr734w/8O25zTcFcqn?=
 =?iso-8859-1?Q?+DtPEDaovURS0z8ZdiBfaeQDhklg+L1KpTdETkfoxFHhowwTS3VMr6xKAj?=
 =?iso-8859-1?Q?QfsPKEc6TszxGvWIuhE6A0wuxU9grVKnBCSPmatZ/1gnMI9w48jN8FQB5O?=
 =?iso-8859-1?Q?cb/s+Wbn/vN06yrpxmso0PRdr0N5rWoqkVOd9pL/AmuCc8+opEi4V+kSmv?=
 =?iso-8859-1?Q?IoildV8lW1Y4nR7R3rdb+G4N34/w5Ts5ifcKCvColowlhEMM3XN0QyUKYP?=
 =?iso-8859-1?Q?E7hOVlbXDTkpJl4l0f1vMqrEqr/3MTw5bem2MjTy1zql4VKknCV2UlHBYR?=
 =?iso-8859-1?Q?o5f6zdVaaGbDX00ac2bN+XlKGF241W3W0ixKZPVjB9osRytCLqq1rhGWXz?=
 =?iso-8859-1?Q?FxXsX0ft1rk0HmHvAAY2Mjl1nixwG4atknQYfhD1QLMcsQQRWomPsujmEs?=
 =?iso-8859-1?Q?iJ6NRYLqlDaTKonEvKl/emG+W8gp0a+r+7ZY4WBGVfDSu8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wYQ1uO6r35QR4obSktx++AXc6ZN2YkUOAuNsGS4w4FIPuYhyYJfQK12iqm?=
 =?iso-8859-1?Q?7R31RqcUR5YXIbPMOxAmIHNmkDS7j5QtLNQNs6ebYOeLTFquRDEHLte72l?=
 =?iso-8859-1?Q?KLaVAqiFv8VluqxVPVNYyLWB+hE4XdgFV4HKlM/k8+nxFQYjRJbvUU59xO?=
 =?iso-8859-1?Q?pzmgi+f3anTzbEoA9a3YOZ5YLsUyGj0ZfxxKg1YcNPYNywv11ToNFKWaTt?=
 =?iso-8859-1?Q?o5IMCq/mhYKhWbHgfTGOwcYJXwZeZPMNTnf8MDTqZun6lKd8bsjkaeQL+G?=
 =?iso-8859-1?Q?ScPEGckXPNYujgD9XfldyNLzHR6g2MRklj8CRm0O/nUUnDHUZrBko6z9ly?=
 =?iso-8859-1?Q?R0i2AP54r0k+MOUwpXakZygvYHY/9Qc+4aJtWVIi6WYRaewrKg2D2TLiUN?=
 =?iso-8859-1?Q?L7WkSfVR6Z7ZsU+LMDTXYZqmS3sDpwHB3lrA9PXrhEpV+1+mFgwAAAUuhK?=
 =?iso-8859-1?Q?oxW0tb8zbOR3ZLaatGwlWqngr1iNcQIdGVwVqC+GECwyUaNonoLTn1IgfL?=
 =?iso-8859-1?Q?isDADGLGE5Gru2RPZSPerURKcsfisCYobtia8GoIeC6j+0JjDS3L6oW55l?=
 =?iso-8859-1?Q?BEr9EDPLxUF2DiDn98Kt/mUbRmT7kFvIaUiWgFUl8vMTJqIN2eAVPe2fni?=
 =?iso-8859-1?Q?iH2/cyeqVvBLq1ItbLyiehZ8xidEjoLnK5HfdkIMmJX7o2OqgL0MBufoJ6?=
 =?iso-8859-1?Q?RMdaGu5BST0H8pu+H/dT33Qoh2BHUJ3UbSx3x16hMDcWMUkZ7QoSpvWufo?=
 =?iso-8859-1?Q?40SkuN+gvd0ahsdRtwZO7kIgwjYqm9L/VZgrPEywJCD+1h3i1Ze4rYFuDg?=
 =?iso-8859-1?Q?uaO7LhoMjwYZRxIIoayULksjF0J6Fqc2w2QaC3waUeffWg3Ee08pT1TmXC?=
 =?iso-8859-1?Q?TgzGPQuSruRFTxMVMUCCg8WVc0Y+GmeOsbYVwThyTQkQNMrxDh2hxiQxO6?=
 =?iso-8859-1?Q?Y7YzFiLNai4zvioBqhWMxjuHw+Josha4m4kLocrvFi8W4kvxjO3GMXbsfH?=
 =?iso-8859-1?Q?f3NWDGpJQdr3dlGS/zE549i3wGyLzbB1bnmDTvG02KmX/3lSVTWY2E9mEe?=
 =?iso-8859-1?Q?vWhwHlK64uJQ8D+c2pJGuOUpq4s3Qa5GMpi6xFabRZUZZ21B+vR522nmdO?=
 =?iso-8859-1?Q?Hz9QjOCs7l9Qrbo1LeR2zQgfSilu/b+vyUo/gdIlpPODYvjIOsJFKIzA5p?=
 =?iso-8859-1?Q?eOEye/r/2LMVjm/7d8gCaDaGekI7xEroP4X/4479dWFkIJ5WfTXf5a3sUL?=
 =?iso-8859-1?Q?1oXSJZRRFeTTAwMRMFfCkcsYm86d9xKYH8MvvlkcKvt6N/kmhw3hgxpx2U?=
 =?iso-8859-1?Q?8PfJMFp+NOKtLhqES0MQf9OWLQTx50K8peoBFtcZomsjylwk/Am+12plFd?=
 =?iso-8859-1?Q?Dj5uUoznB4GC19MpcoVVvolzTpbaf7LwTJNUNfSj1tIl93oIQ+D/fjdVNK?=
 =?iso-8859-1?Q?XOYJowPOj4n1U//HYekhsDslcGQvhi84r1pGAA+dW/R9CvFGEBOTcugbvl?=
 =?iso-8859-1?Q?qacH2jW55wh9LjJj99sQrAI1+WhtHAVFXPCWH7/G2a8TbsOuKcg2L/4E9J?=
 =?iso-8859-1?Q?fibqbjsT1pSZqU1pKNrtV9xAPpNTkUL4SpkELIm7GoqjbWt9nYLdXhUg5S?=
 =?iso-8859-1?Q?vy36q5dW7E1qtNsUSoOFG3Vs4gk1EN03Vt7+LiseZc3m83PgXzPldJpg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c030fd8d-3bbd-4994-39f7-08dcbd3a732b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 14:56:31.9061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VVyI8B84qYccOgf3Z2q/wopaZbHcZG7NSLnS4sX3yWs2sYT380gZLiUuyB2Dwkj4zUqNwhSvx6RfJ49uUhsvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
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

On Tue, Aug 13, 2024 at 02:24:27PM +0200, Thomas Hellström wrote:
> On Wed, 2024-07-17 at 20:09 +0000, Matthew Brost wrote:
> > On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> > > Add helpers to safely add and delete the exec queues attached to a
> > > hw
> > > engine group, and make use them at the time of creation and
> > > destruction
> > > of the exec queues. Keeping track of them is required to control
> > > the
> > > execution mode of the hw engine group.
> > > 
> > 
> > Missed a few more things...
> > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.c  | 45
> > > ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
> > >  3 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 0ba37835849b..645423a63434 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> > >  			xe_exec_queue_put(eq);
> > >  	}
> > >  
> > > +	if (q->vm)
> > 
> > I think this code path can be called GSC exec queues which don't have
> > a
> > q->hwe->hw_engine_group. So I think:
> > 
> > if (q->vm && q->hwe->hw_engine_group)
> > 	xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group,
> > q);
> > 
> > > +		xe_hw_engine_group_del_exec_queue(q->hwe-
> > > >hw_engine_group, q);
> > > +
> > >  	q->ops->fini(q);
> > >  }
> > >  
> > > @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct
> > > drm_device *dev, void *data,
> > >  			if (XE_IOCTL_DBG(xe, err))
> > >  				goto put_exec_queue;
> > >  		}
> > > +
> > > +		err = xe_hw_engine_group_add_exec_queue(q->hwe-
> > > >hw_engine_group, q);
> > 
> > So this only called on non-VM bind exec queues. I think techincally
> > this
> > wrong as VM bind exec queues can use dma-fences plus the copy engine.
> > I
> > plan dropping the copy engine for these [1] and I don't think it
> > worth
> > fixing VM bind path with mode switching if we only are going to drop
> > this requirement soon. Let me just respin [1] and hopefully we can
> > prioritize though reviews so these two series land at roughly the
> > same
> > time. 
> > 
> > [1]
> > https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5
> 
> 
> Matt, Francois
> 
> I have expressed concerns a couple of times about ripping out the
> capability of gpu binding, mainly for two reasons.
> 
> 1) I think a pretty common use-case for a bo is
> a) clearing/readback
> b) binding
> 
> If we can have those executed by the same exec_queue then the binding's

In current design all clearing/readback is done by a kernel migrate
queue. Only kernel binds (page faults, rebinds in exec IOCTL, and rebinds
preempt worker) are done on this queue. 

All user binds on a per VM queue (or a user can create multiple queues
per VM, use case is VK sparse binding). Thus regardless if using GPU or
CPU for user binds, if a user binds depend on a BO move the bind job
will be held in the DRM scheduler until the BO move is complete. When a
job is ready in the scheduler, using the CPU will certainly have lower
latency than the GPU. Lastly, in general I have seen it is fairly easy
overwhelm the GuC with context switching lots of jobs, so anyway we can
relieve pressure their is also a win.

Changing the queue usage model would be pretty invasive and sharing
kernel migrate queue with user binds could create scenarios where kernel
operations are stuck behind unsignaled user input fences. That might
even deadlock, have to think it through. 

> dependencies are implicitly resolved and no latency incurred. If
> executed by the cpu, we have to add the latency of signalling the
> clearing fence and waking up the executing thread.
> 
> 2) Considering using page-table bos out of non-mappable VRAM.
> 
> It's entirely possible these concerns were considered non-valid at some
> point but in case they weren't, just a reminder.
> 

We'd have to rewrite our binding code anyways if pages-tables are
non-mappale VRAM. The CPU is always used to program the private part
page table entries. If dependecies exist, the GPU is used prune the
shared page tables via a job. Our code doesn't support using the GPU
writing the private part, that would basically be a rewrie.

> How difficult would it be to perform the switching also on these VM
> binds?

Not following this part.

Matt

> 
> /Thomas
> 
> > 
> > > +		if (err)
> > > +			goto put_exec_queue;
> > >  	}
> > >  
> > >  	mutex_lock(&xef->exec_queue.lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index f8df85d25617..4dcc885a55c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct
> > > xe_hw_engine *hwe)
> > >  {
> > >  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe-
> > > >mmio_base));
> > >  }
> > > +
> > > +/**
> > > + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw
> > > engine group
> > > + * @group: The hw engine group
> > > + * @q: The exec_queue
> > > + *
> > > + * Return: 0 on success,
> > > + *	    -EINTR if the lock could not be acquired
> > > + */
> > > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group
> > > *group, struct xe_exec_queue *q)
> > > +{
> > > +	int err;
> > > +
> > 
> > Also assert here this is not a VM bind queue (e.g. EXEC_QUEUE_FLAG_VM
> > is
> > clear).
> > 
> > > +	err = down_write_killable(&group->mode_sem);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	list_add(&q->hw_engine_group_link, &group-
> > > >exec_queue_list);
> > 
> > I don't see where INIT_LIST_HEAD is called on group->exec_queue_list.
> > I
> > think that should unconditionally be done in __xe_exec_queue_alloc.
> > 
> > Matt
> > 
> > > +	up_write(&group->mode_sem);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from
> > > a hw engine group
> > > + * @group: The hw engine group
> > > + * @q: The exec_queue
> > > + *
> > > + * Return: 0 on success,
> > > + *	    -EINTR if the lock could not be acquired
> > > + */
> > > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group
> > > *group, struct xe_exec_queue *q)
> > > +{
> > > +	int err;
> > > +
> > > +	err = down_write_killable(&group->mode_sem);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (!list_empty(&group->exec_queue_list))
> > > +		list_del(&q->hw_engine_group_link);
> > > +	up_write(&group->mode_sem);
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > index 7f2d27c0ba1a..ce59d83a75ad 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -9,6 +9,7 @@
> > >  #include "xe_hw_engine_types.h"
> > >  
> > >  struct drm_printer;
> > > +struct xe_exec_queue;
> > >  
> > >  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > >  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct
> > > xe_hw_engine *hwe)
> > >  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> > >  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> > >  
> > > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group
> > > *group, struct xe_exec_queue *q);
> > > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group
> > > *group, struct xe_exec_queue *q);
> > > +
> > >  #endif
> > > -- 
> > > 2.43.0
> > > 
> 
