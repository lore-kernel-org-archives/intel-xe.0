Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D84EC3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 03:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C33E10E043;
	Fri,  5 Jan 2024 03:33:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E2810E043
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704425601; x=1735961601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zLUD7RBguQ4Yu4zkhM2K67JG9jcHIZnoaYXLWajqtq4=;
 b=Y+uNVYI+WPUuYMFiuo159v9H4X2Qvx5ZHCY9EwnMnfM6oe89Lxb/9mGT
 PDccJ6FpNBS4AUh9/JzZ9+0PwMmquU/jqTwToGtr+zhFgNLRwSyneqn0R
 ylasf7lasuSQcPu8DJL6Z/wwuZRM/QQZzzGEu0ZBBo9fJeoWcOrSCGGOh
 WweNiqsDbGPMeEYjuYlOY84zlJDPXLYUnj6bp1btCwComWCEzZJFvdhwQ
 /2tmPKY6khiDzLRZ246S08Q88a4ZDH+RXF78NWKQA8+con2e8NQy2KaQ3
 T4vDoNcSiTITT8tnZEM549mdccWBPmxPNUGdFgQmoqI4ullvzcqCp9c6E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4195138"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4195138"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 19:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="809431860"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="809431860"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 19:33:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 19:33:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 19:33:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 19:33:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 19:33:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw5+/e1OkeVMz2UcnTDrRt2E6bsOpUDvhE1mWhdp+a/j6XG64yIi80UDjSTO2cjZ8+a+jVuI2IOudBndPxRLksKxElKEtdQYFDnITdt7nR1ACZbM0cnW/0gBNPX62m4rLjIYx1BpoRPt7XvFVj45NrFWoqESqlM1aq7pHNFHMzTVEO3/n9Mow8ZKrymToB1Vyn4dSmdpy3S9h5fWascOrFOov//3K0C/Wy+4IllEy94gQ1JbiIBI3fhEg6s6ESWS5I7wFus5TW77LdSlmmS+nuM22lrFlInRilhAPAI0rfAW9OxG9hwf8IGeytxn8ybQmU+3XChCJUtV3LtyPlGh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOFN+nGgVuNqK/Wjx0fDc0c7ZjLNxFIlPjKYll6U+pM=;
 b=N5WQQ4paqnkLv6WFQeYFl/sIoxJieWeZyTYXdhhKIHWXprLtXSdRTgaTdU+n0erC38UJYZ1IPvhIFac/tD83AGoB27SomIlPn/5fJ3o7cf9zjg/Bf0SmW7MhoOuH1IGJrueDfE7Sez+8VR5GAiVqa5d4izdxgB5OTrW7pvbx8HjuKw8XlhdQMHkCT9FgZp3N7xhujc+sEcaRwWbKvz9bQ7VPGwbP5zdsMxBSGRpYVss5Hl6OYu3BH0WECYgsPaCd1G/uOGaYfDmS0jDmQo10rvbDAu6Yg8Nq/0SoFBiF9I8eA/vvXQjcIJNgOdfUSm+UyNbIZaCAzOcje6eXdZ6hmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 03:33:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 03:33:17 +0000
Date: Fri, 5 Jan 2024 03:32:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH] drm/xe: Fix exec IOCTL long running exec queue ring full
 condition
Message-ID: <ZZd4SpVzH7lnrYZs@DUT025-TGLU.fm.intel.com>
References: <20240104080909.1271480-1-matthew.brost@intel.com>
 <69ff1c8d-d844-44b2-af42-cbccc035ebfc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <69ff1c8d-d844-44b2-af42-cbccc035ebfc@intel.com>
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c067ceb-08b4-4cac-1bb7-08dc0d9f0e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATVlkWpMVMICRIHuoCpS8B5IOe33NMzcUeJ4ujlPzq8QlXxUzzyDS1/jVozGGGjZNRBod1oLGtcONWGF5ME0vK6imm9ggnjUO1GpfBjbb+PpbqcBbTM68v3MeJmfAoqpJoUDKh4ZAYnXrhlr3e9ABmffIpiAzh/TZnCES+ML+rBBRdBxxUspgB1/U+6Yh50ry2WGx74/+EcwXgwlUEVwq/S3xTmwBCSvNXQXSdl5wUHr81hGKgnaDbHWEELt6RdY+kdo0Vcme6EZ8KeBpBJWBqaCbQgRc3baJeB6/bzsM79+wlN7Qepe0AFJWrU8/JEidUEWweuSFaP0Zww4v3EUzLI0TjBfaU6tP6L/uVtH4Fr/Y+b4nDd9+0l4LEGPZNgKdTar3oCq8vfFIk/aRUdb2aSa1CBneOVXQnzZ86Gl0m4l37LhO5lbSs5KsIQ2SCrYx9yvFKMP9Rr0ZibYJg+K+wy1+AwXk06O/EHyCbqN21RptHIzr4II2EFD7cyDoOIqYmHez+8DJ1d6lyniwEFNiPlo59cavs/7vvJwoskCureu39eMk08+DNg/EDdQhTDk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(478600001)(107886003)(6666004)(6506007)(5660300002)(6512007)(53546011)(4326008)(6862004)(316002)(8936002)(8676002)(6486002)(66476007)(66946007)(66556008)(6636002)(38100700002)(44832011)(82960400001)(86362001)(83380400001)(41300700001)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7bXe82izKbLKfF8lIuI4O/eZ25IWdceUi9R8tf81tPttWnPjffbJyU7sVpx?=
 =?us-ascii?Q?I85czyAO4U9CXbz6gbDPb4Quvfu0qNN4q4/Od63zhNYMMJW00ISDkiRpulgq?=
 =?us-ascii?Q?hW3TWQPfUbWrxoVQXaBBcQdns+JDeN7qu+V8vTHjnhBRRLSMt/PdJWH9LjQ7?=
 =?us-ascii?Q?H+Nx5EGy/2F6xIC9FlBjWdRS0jVrJgnsZm/95ucICtLTn07B/RY1WwyAJsrw?=
 =?us-ascii?Q?YK9tXV7vXkaW7KS2Q7mzqPUvdJ5NxZAZS9ZaBNg5OdpAtBlEWP1SKRcnNvKg?=
 =?us-ascii?Q?aB9slHztf6KLutkM3rE/BFfaeNOM05lqKUZIUsqrrJDERtSzoQQtaun6IxhS?=
 =?us-ascii?Q?dLy3TeI3HVfzn3dHzaAqYqQKlpDZ2bM6zR8pClaSgnqF5ZHWq6UUOyM1/O6n?=
 =?us-ascii?Q?6E7CITvSOKDygWqs6ExvHinM3hEXHi84w6tQqTbsGplLTgDQnQr3923AMKs6?=
 =?us-ascii?Q?zm9Y9iV9zAf+EbrRRNWpBhUCsaNJUrnX6tmcLccVZPGQkOu6zkhKWLNB46fH?=
 =?us-ascii?Q?jPz22VTGvC9XaBzU4fUEjmJV941X5F7Xk4I7Ak6Mj09UDLW1OSUBLmmqTPDF?=
 =?us-ascii?Q?EB9nBZlEN9G75Of/iEMg12nUaHHVfnDcfdKRqqjv7OGfXJ7OkVWKHrhfeS5S?=
 =?us-ascii?Q?Je3sCPL5c51JHN0kZnCu4Ij+xBZdPnVXLXo56etQyHC15RBIyIhH/VblP6Bj?=
 =?us-ascii?Q?9gUEVgWqxI+sIxR6p7m+jU82g51e08i/67SScpuDPIa7RNYaEP2DmaMuua8O?=
 =?us-ascii?Q?ISawVNug7AAT290VcEi5bnz7cTFGpDLfxbhxLkEaccLRpf80lXC0sygnn1wq?=
 =?us-ascii?Q?bl9XG3xnDVhpW4V+y7a6JpKgTntCIAHMYAnZQjBLa4j+b54CaixjxHG5mq4n?=
 =?us-ascii?Q?uRzbzEvhYoTNo7fwjEJAFIhDDGR0aR3mQc9TJQeTA7t0uOrkLzmlPM7mrQ7j?=
 =?us-ascii?Q?f3FiDP6cXReSHGz0O2bWT/1M3VMkFY6DwjRZ9zJe6qDrtcOm3Pj18R44+2Zd?=
 =?us-ascii?Q?y++r2kSwo1AtVd1D6aprE9bFRJcTvDGm82R9DnU+53oDUb9cQQ5vhI13D0NA?=
 =?us-ascii?Q?Xevstz7GQM8Gy9M3/2rfQ8qFsjXWv8VtzMtxunnSDE+FknpX5Oz1EkH6PMSG?=
 =?us-ascii?Q?lacWgIzbsWYifOwKqcDXMSVPVq4EyTawAGxBAXBtuVfHk7ToQRZdAvCr3RWN?=
 =?us-ascii?Q?uPJp/Dj+Pjwe8tdZDSSDgce5kx99e9davosbEaIzFnbw/JFhweINxdMDGy8n?=
 =?us-ascii?Q?hR2qpxqrK3odZ+R3ss2sYmz0O8rK88rbXt0sexyUOC5VqYErWPRRtHdkCRtK?=
 =?us-ascii?Q?F61HZnsoviPxulKd1Q7VyQfjtadHQ73nrLDAdFV5PTffCxYCSPssR4so81D/?=
 =?us-ascii?Q?mqsM4jSgV+zr4f/9OpKvq+Ta/lvpbIgDphtQn+5RJjk09qN2gCStT2Mh/KzY?=
 =?us-ascii?Q?XVu8AfMqG0ptW+/xa6XP5Z1Wm8VLbJ4fNKGvNtR9bAoqGsgz2EiHOhRWB+hr?=
 =?us-ascii?Q?U4oIgC8P5UgXPh/p/AJ1qA4o4A/GIYij9F34TxlYwYIGnOHePwq6AWVx9Pjt?=
 =?us-ascii?Q?9kWGTFoXQ2CZTA2p79BTBx/tcfmPfcnjT0owtR7ydz5sTPvOGmpu7eHuBXY2?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c067ceb-08b4-4cac-1bb7-08dc0d9f0e69
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 03:33:17.4250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCauf9+4ejmQLE28uVEhljvCOcexHq5IuU0xLYCX9B8GVyH1LjWUZyctw7yK8UUOXKL+cXgjs0CcKWjFdsCMgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 04, 2024 at 01:55:48PM -0800, Welty, Brian wrote:
> 
> On 1/4/2024 12:09 AM, Matthew Brost wrote:
> > The intent is to return -EWOULDBLOCK to the user if a long running exec
> > queue is full during the exec IOCTL. -EWOULDBLOCK aliases to -EAGAIN
> > which results in the exec IOCTL doing a retry loop. Fix this by ensuring
> > the retry loop is broken when returning -EWOULDBLOCK.
> > 
> > Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> > Reported-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index d30c0d0689bc..c68e1bd15e6a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -115,7 +115,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	struct xe_sched_job *job;
> >   	struct dma_fence *rebind_fence;
> >   	struct xe_vm *vm;
> > -	bool write_locked;
> > +	bool write_locked, skip_eagain = false;
> >   	ktime_t end = 0;
> >   	int err = 0;
> > @@ -227,7 +227,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	}
> >   	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> > -		err = -EWOULDBLOCK;
> > +		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
> > +		skip_eagain = true;
> 
> Would using another error code be more clean and avoid confusion in
> user-space as well?   Such as -EBUSY here?
> 
> But if you feel strongly about using EWOULDBLOCK, fix looks good to me.

I think after quite a bit of review we landed on EWOULDBLOCK as this
means user space should retry the IOCTL.

Matt 

> Reviewed-by: Brian Welty <brian.welty@intel.com>
> 
> >   		goto err_exec;
> >   	}
> > @@ -337,7 +338,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		up_write(&vm->lock);
> >   	else
> >   		up_read(&vm->lock);
> > -	if (err == -EAGAIN)
> > +	if (err == -EAGAIN && !skip_eagain)
> >   		goto retry;
> >   err_syncs:
> >   	for (i = 0; i < num_syncs; i++)
