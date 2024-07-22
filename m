Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85982C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 17:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE5710E0C5;
	Mon, 22 Jul 2024 17:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mU78K5b/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC47210E0C5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721670666; x=1753206666;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5UzMJm6DDqz3DDtdd4xnSvVMPAshVC/NrWBpP93xU8Q=;
 b=mU78K5b/+byNYf6W96QmZAhTcRg/Hdq1ey/6OHpvSCgdwmR+Hz2Nk83A
 YiUtjgA6fp20BsWx6z12uMD9u82f3ZdJSatNG1N0vTWga3AliZM4p/iEa
 qENcIQ7bDuPXokd/xTSQIikLa8bIuEz/LxhPYR5nOVMHbzyDB7cyOyGMY
 J+iaf5YFYW+dOKa/rnPHcnTglI8poUg0d3unRqhJEmEh+SRnW6g8Yn0bl
 cN7rnE+jTLgGm2ViP9ssiGdBA1o7qtscubncuZKZIZ4d13xjx8rWxScRt
 EAvIdFX3D8E+KiVkt5GkywZlHGltrw38AaGs4hNem8gDrwL4oXCV9+TMc A==;
X-CSE-ConnectionGUID: 7+xnsO8rTh+xnGOaP93RmQ==
X-CSE-MsgGUID: GPL3RQ/STyKoAYyIYMhRYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29917486"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="29917486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 10:51:05 -0700
X-CSE-ConnectionGUID: /Df0saNdQhG+O69aIhcU5A==
X-CSE-MsgGUID: 5KmVhF1eRcC86ACse0NFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="89413523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 10:51:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 10:51:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 10:51:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 10:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOiHVVkXO8lWztIFnkiaInL8QrpX/Ax5TNv7tQkN4ONixrT9AIlM//FVysgo790c2hKcQNieAcEMhPAGTNDZ8qeFgWiIT1UKz6N2k3ls4wTlxtFsscs0s+66+OvnPeY7hDoQHT7QAEm3kkY8uIpOSc7/HQ4/VbXu02OjSyguwgfhStJ6csAt2owvXdBeUqAHoJdUILW505Oe/UNVWUDmv55qp8zW72zEarxsULn+/AQibgKuSCUhHA1z88PjDoLadYBdumXPM5A4Y56Wq6fDUkeV7LH9DYHLwcShEJQ/l4q7cs9Pn3B7KjfhAgKaXvZRxLiyxQ21piFUPs+V4DBGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpW8FxgN1hu1cF0QXdzrSsrMC3XrprKJRx+bOzXfzJ0=;
 b=W9KVTrxYBzFa6lzYTjEOTD46y/GjjnnpRnukC9ELbdXqfuEf8T/w5lOsVfQJPkWvbmUy0yFODlgWgT74FUg2zQst+JXdZyLIDJfQLqYVNMKQwXjRjoT4RI21FcXltcJKv59habYeNpRemRAv45OVFJpXpOUofH37VeAKayra7zucxLvPHkAZLtYIdWX5ODTSQIXGIh4YQDZ7EkEhFO1yadqrprOjo2BC0msFRR+QDqp36nW0r8cJb1o1Q4Ong8lYb/i7MbI26YXagYHSh7agNxrPDiKyqUjjt5GqHvE31u5Hq2dR3vtpt40CndPuEDxS7ieW2vKWAsXnBYOcpw1HHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.14; Mon, 22 Jul 2024 17:51:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Mon, 22 Jul 2024
 17:51:02 +0000
Date: Mon, 22 Jul 2024 17:50:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zp6bzTszAx3VK3n0@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
 <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
 <Zp4VgvqF7AMrHs0Y@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zp4VgvqF7AMrHs0Y@fdugast-desk>
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a1eb79-7652-466c-07e6-08dcaa76d9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x+rjK1tZVXhyjiKxCvpa3u9BYyBqE7LdRgnZc4W6V6ZKjmoNCEe6dQ6ve90r?=
 =?us-ascii?Q?HJYMxwaU/ePUQ7whDjHfx1kE0Q5EnILJlNe1knquu843v6Xu8NE8aEq0QMAZ?=
 =?us-ascii?Q?i5rGSfNtbCPbMjuwQLJPDQvOu21DgI0K53QPcewurWWf5A/3olhtIUk08Ftw?=
 =?us-ascii?Q?JrYJlL8+15gI4/ghnYX2kVyu1VVS8FzjWkEi8IL22ljkoz+tyXz+pYrAhs2z?=
 =?us-ascii?Q?eJEOIQWPTr0DAbFLlCamwx5hqlXMCWiCO0MdGBR3JFzZUPx/OmKC4Is3D9Ac?=
 =?us-ascii?Q?3fghyhrfATei04UcNRWtnu1kQ2mcmCD4GMyR5ll1mPaQk14JmHA3HJUKbx0S?=
 =?us-ascii?Q?HG6cIJdavEmrxoMoPY9/eHPFvlGjMQ8kD1HiISxJbq1h2/8s+bMcjZeq1cWu?=
 =?us-ascii?Q?Fz3E43WcwEeQ6JEHT50L8C6m+HnODTg2JmVELp8KWQ6hKaCzMbcnp9IHRSOY?=
 =?us-ascii?Q?WHVPMEq37B3iOnoCIQwFIDzH6TkWXyr5uqOkwzNm0KBFKeDTnLS5l6z6ozwi?=
 =?us-ascii?Q?Mpfz26ohEK0JuGrkym7NhC5tz3kxwK5rB1PtG+HX0HFzEpODC+BoGEb9VGrK?=
 =?us-ascii?Q?fO5w1xhF7NDj7IgiOqAaBKA29OjyHIU/52GviaCmTeWQwcej8qe9tQeEhLe5?=
 =?us-ascii?Q?3IFR19nfg3ihwoMjy0GqHwNdLtMYMsyLcMMSTGlT6K0qFfAGoooUPNAnl6lR?=
 =?us-ascii?Q?wXltCItHXQTkpXQSwokitueL+YDBthmqE463hr/8IEWWxtv9LSkm7Gpnd3th?=
 =?us-ascii?Q?YuDEGvMGPIIrnE9GR3AbeFX7IU1JIW+/X/0xGqC6Mv9N/xuhAcgAVk77f002?=
 =?us-ascii?Q?cGF9bkEWOhHY9aOBAqgcyNg9bn9L+93bfsQKajhXC+tbA6GE1nLNNX5u0xbL?=
 =?us-ascii?Q?KJTSH/MiFwUju1ULjUAimOqKbjujADwAckHaxb7s0Oaex83hiVm3RdfzWFpC?=
 =?us-ascii?Q?EZOeqgM8YTeV2+tnHxbxdpqbR2Ri/ABSOS39DZ5siUrw4tqJBYzEaeuDxNFC?=
 =?us-ascii?Q?zsVmaU/U7qDwE5+Id3CL5nxzw75ihufyMkV3fu9pH22hBp7knvmciX3lL0uD?=
 =?us-ascii?Q?laprgXO2k8h9LMfI/Tx10INB4FFGYF0XdgDabWMqan7KE3tWJ+Tsy+96ut/W?=
 =?us-ascii?Q?zFK/vgSZZxSlwT+v7C94u/icVSFLsD8xwHx1xTanTKnZwIG8pIFuuMCq865I?=
 =?us-ascii?Q?X3MhK09AivyFXE+Dv15ivLIIoPQKPSp9DUd9llQeXgBnBroEoR7MV+DYhaaI?=
 =?us-ascii?Q?UTkxT6NlRCmtcqTpUYFs7bOms7Fu3HTdklpsW4hl8+puoCCN8+ozYFJsA7LN?=
 =?us-ascii?Q?4ig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?emBodfHEI+satopCgc3Cq5nNtap5JSBm3Q4+j4gUeuw1xuHs1ls6QOl1fD7u?=
 =?us-ascii?Q?WhxmeiPBVp/0gIjrE/zgWnmuleDFzxPo4nlztYQ/8QE3XM1yr5uTE6kyCWhL?=
 =?us-ascii?Q?KMbk30fB18cOZF+yffaCriv6a3k4vtF664F75lt+mfBSyxUZWK0EAze79G4u?=
 =?us-ascii?Q?lYLBnnxgUUJMJp4f4KgCUnaWE5UeLr+214KB6pGAiyoWsTrmvmFAmAmdbT1Y?=
 =?us-ascii?Q?N2c5fgA/Nsf/0pXNkw9/QIlvhIqgwjIpeHIYqNt8JLu1LvQrNqD2S1NAgRet?=
 =?us-ascii?Q?ytv0qCfdpHRrmQxC90PWX850a1U6itJxcIbp/yHNhcIvPqfJR4kg3ggjfjIK?=
 =?us-ascii?Q?KtJhhdcn9Vdu4zcqUQHo4rlIdMtCDRDmraNkOu7nrKuVWVF34SeKGFQBUBqD?=
 =?us-ascii?Q?llVeurIp/8hU4DahpiIKULHOo94qQznSBrpkyIIVCRMHQSIm9l9tzbl/UzyA?=
 =?us-ascii?Q?XUsBK82eGQkwqXhgO232lJVs1hzWsOdLbAgNSXdo+OVEGRMAKdOt7bjEGK/R?=
 =?us-ascii?Q?b2USlD263ECG8znuIxfKOfOWPM8i5LJEyK7HGZGkAKN6+AHZ8WWh97RWcnAU?=
 =?us-ascii?Q?52X43GDm4G5th+RxtXj7dbAWkRC2XYg6XrXsmHl9ooDZLh5nEjzdb0M1fa8/?=
 =?us-ascii?Q?zgFdcU5C55l5yNSHVNQ3kvCHOQARsoGaByekx7XRYpR89qptAVni+1Z4wMTU?=
 =?us-ascii?Q?9mDBeD19S3eUq3G2xQwWs+xf6OvLUHxWsTSHGMv360i88b3QSmqUpmgjeRrt?=
 =?us-ascii?Q?WrKRq6Vq+ZXqjITORX+Di//Waf+H2qQL/frFywnq6p9OdZe+Sg/QAg8GsITE?=
 =?us-ascii?Q?ekh8EnY+1eDtjZffnDofBTzv2f4Q1pjg4v9A3dxJ8aXISvQXzpLlrU/+Twsb?=
 =?us-ascii?Q?WMOKV2PnL3PKQPtAt8pK5TTTn10EROHAdJEYYEvX0Nl8FFX11Ath6BI5kyOU?=
 =?us-ascii?Q?q19rAQHNMVv9abs2nEWE9C39aNmgNpQ8maJfs+BPMQblGD4xxfvMBdjr/Cnr?=
 =?us-ascii?Q?3CvUVZoBcQIO0Gl/YBA36ISBgEYPqTSrugfDbM+h4XSqv8F4yQ7XaMovWRSC?=
 =?us-ascii?Q?Go1e5K9jvrxBuDxuNhFq1AuIxJ35HK9d3a6Lzr8LT5/l0k9bsXC++QR9W/cx?=
 =?us-ascii?Q?qsy5pFo+D90YHpd/BY7ILHhDdktsF8hJ9UJ9msZn/MmHiPYLunCCjrK2RvhX?=
 =?us-ascii?Q?+NL1+CkrCNE6AOdb703vxHHOO2K2AgIAGAKwmLck2qlaJL+QB8CLrZnKlIsR?=
 =?us-ascii?Q?dslYwZxLX1bne2HVWVfyOJlxJd1PCG1pBLIGZeIQ2H9zVV1Z6wiilVSj9uEw?=
 =?us-ascii?Q?ml/2ARAC/Rqxd3cEOd+4qjZOty3F7w9w7hb8ZPBF4x01BAAauuU9s8x4gSfp?=
 =?us-ascii?Q?EBKV5MMbyFSAOnB4mz7vWxHXB6q2DDUQ5A0makn62StxBiIcUJqh+pDke9dP?=
 =?us-ascii?Q?xW8e4D4KXAe1HuwdYc5KK5yl83R4mTt3bSDHkpqE3hiF6iMUpHqwVXOgx7vf?=
 =?us-ascii?Q?1YPpjXZHdsbSjfj+rq8cigAT+A1XjO9FXCmP2rO5jmrgIATkHkozJxK+gBF1?=
 =?us-ascii?Q?vCrEEE1raOZgX5LfayKKSZAUGM2jLKumW5yspWqH0L9GUxVBYMcmiXfO2yFk?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a1eb79-7652-466c-07e6-08dcaa76d9fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 17:51:02.0767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH5kS9ywibvqUhFq4kHs1xcy0IUBrb4eT/aadlyw1Kq91WpNp9GdF94unTZJHvXjmDj/WL12kZdbeBNoaxl/Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
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

On Mon, Jul 22, 2024 at 10:17:06AM +0200, Francois Dugast wrote:
> On Wed, Jul 17, 2024 at 08:09:28PM +0000, Matthew Brost wrote:
> > On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> > > Add helpers to safely add and delete the exec queues attached to a hw
> > > engine group, and make use them at the time of creation and destruction
> > > of the exec queues. Keeping track of them is required to control the
> > > execution mode of the hw engine group.
> > > 
> > 
> > Missed a few more things...
> > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
> > >  3 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 0ba37835849b..645423a63434 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> > >  			xe_exec_queue_put(eq);
> > >  	}
> > >  
> > > +	if (q->vm)
> > 
> > I think this code path can be called GSC exec queues which don't have a
> > q->hwe->hw_engine_group. So I think:
> > 
> > if (q->vm && q->hwe->hw_engine_group)
> > 	xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > 
> > > +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > > +
> > >  	q->ops->fini(q);
> > >  }
> > >  
> > > @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >  			if (XE_IOCTL_DBG(xe, err))
> > >  				goto put_exec_queue;
> > >  		}
> > > +
> > > +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> > 
> > So this only called on non-VM bind exec queues. I think techincally this
> > wrong as VM bind exec queues can use dma-fences plus the copy engine. I
> > plan dropping the copy engine for these [1] and I don't think it worth
> > fixing VM bind path with mode switching if we only are going to drop
> > this requirement soon. Let me just respin [1] and hopefully we can
> > prioritize though reviews so these two series land at roughly the same
> > time. 
> > 
> > [1] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5
> > 
> > > +		if (err)
> > > +			goto put_exec_queue;
> > >  	}
> > >  
> > >  	mutex_lock(&xef->exec_queue.lock);
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index f8df85d25617..4dcc885a55c8 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> > >  {
> > >  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
> > >  }
> > > +
> > > +/**
> > > + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> > > + * @group: The hw engine group
> > > + * @q: The exec_queue
> > > + *
> > > + * Return: 0 on success,
> > > + *	    -EINTR if the lock could not be acquired
> > > + */
> > > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > > +{
> > > +	int err;
> > > +
> > 
> > Also assert here this is not a VM bind queue (e.g. EXEC_QUEUE_FLAG_VM is
> > clear).
> > 
> > > +	err = down_write_killable(&group->mode_sem);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> > 
> > I don't see where INIT_LIST_HEAD is called on group->exec_queue_list. I
> > think that should unconditionally be done in __xe_exec_queue_alloc.
> 
> A hw engine group's list of exec queue is initialized at the time the group
> is setup. This is done in the first patch in the series:
>  "drm/xe/hw_engine_group: Introduce xe_hw_engine_group"
> 

Typo on my end...

I don't see where q->hw_engine_group_link has INIT_LIST_HEAD called.
__xe_exec_queue_alloc seems to be the correct place to do that.

Matt

> Francois
> 
> > 
> > Matt
> > 
> > > +	up_write(&group->mode_sem);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> > > + * @group: The hw engine group
> > > + * @q: The exec_queue
> > > + *
> > > + * Return: 0 on success,
> > > + *	    -EINTR if the lock could not be acquired
> > > + */
> > > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
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
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > index 7f2d27c0ba1a..ce59d83a75ad 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -9,6 +9,7 @@
> > >  #include "xe_hw_engine_types.h"
> > >  
> > >  struct drm_printer;
> > > +struct xe_exec_queue;
> > >  
> > >  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > >  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
> > >  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> > >  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> > >  
> > > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > > +
> > >  #endif
> > > -- 
> > > 2.43.0
> > > 
