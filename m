Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8437C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 17:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7176B10E648;
	Wed, 29 Nov 2023 17:39:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09F10E648
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701279554; x=1732815554;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iyV/A/uSTnQKUFdUWUENfwrfRK5opYzc6TTSmSuuwb8=;
 b=nNqap2A095pDffVbWJ1bBdgkiwD1FI4jN5vq8MeSbxoUSDcqifzcTu6c
 BbglkEcjc8U7EJkotNITwBBo9+Sg23XLfYrSDBn3mCWAXKteZyjyPH1gu
 4hrU00ov3X3fjh3TTmv+NhjRXi+HAp8LDvAYMuLJVLnYA2vdgxe8HweZm
 BwmtYUMMKCtHFnxcwFtmF/XqYJigZPeDe3UTEinaezLGNpVUePrdSiaqp
 Y6nB49R3ItVRsBaYL8KrQ/AEPSc/KVymb4xVXI5ZvTSNtkc2Yy5JdnZ+1
 jOxggpyyjK7AELCwMCc3b9+6TZvi+70ulaVT89ZHCzbPB+wRzwduakrhP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479402799"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="479402799"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 09:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100600227"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="1100600227"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 09:39:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 09:39:10 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 09:39:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 09:39:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 09:39:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1qEmTyl658uMzW9+ceQpzLEErLAjPCXlJNV/1Uz5qRyEn7ivhPyaulaDnFyFi2nwDxmI3PGEux5xNOA96blfc2n53C9tqcFpcbYGyogUxuPfRkni3293Idijhqh7fDiBdbTuoZoUWqGU5+GK0qcANdL7giS8abX4eTBd4J9x87VV8j7z3UMI99UxU6p4IUb9suYvYFrYvnlsJcl+BlS5dZdY7AOCS+XYq8MvU9zc3rWET1Mow2OW/UPpXKzzpmJm7jZ8DoaRh74cy+rYH/fv+nkxQxPJrnn55sJOGjfaxpni/0d+/6bUKMN0kTbjbR4Cw3mNP5gTyK/NniZjzQDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExNNmw+SCV49Q7lTVB251ZhYtoWCxjr5QKyPnw6Awsc=;
 b=ip7swG00VmOD4VdgOu/whHkLpm3BunhshMxvXN5a31djDjot7qv7JpBh5pvi3MCWasmfBRwb8ad6o7d9dN3JizqbYuq3Jx1oyT6SHNyEiKlMQZYYtdB+/lmlyNsjdAC41HCZWMbjMaT+nFHCzYm9ZmDsLVZCCLDn8qJrpPKSPk65KdyA8Ao6FipjojvX/vVikVtDQsxgbCBz/QZg671IXwctZcvLSWjuV9GaWo8R+WHXJtlUBtZC4fM8NXItNQM4Bx6O5Lmtl95Zm4+p3NsPTkSZJk5ONmfAIqO224H2mr74kYBWBs/LWcTWTTznsYboZMAag73WtdONNe6D6VCpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 17:39:07 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 17:39:07 +0000
Date: Wed, 29 Nov 2023 18:39:01 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZWd3NSH-SGtamUMz@fdugast-desk.home>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-14-francois.dugast@intel.com>
 <cce23fbe34b769dc27a4f70f62b04c1c0f4850bd.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cce23fbe34b769dc27a4f70f62b04c1c0f4850bd.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0229.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 566c706a-e9c2-47f8-80a5-08dbf1021635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3GQbVinXMaKYFYAx4RSdlqqWX4/W0nBbwQjQcpjT8S/KSmtgpOlnjoxn8qlvcz+RYGGhAjxB9bNRfQ7KTNARI5JYC1NgEanmM0wUIYARiQmNDUh1jGmT2ib+/TwVP37kByAYIX7A6uOC6nlqBXMuJMvZX8XcToXyG4i+9Kr9/qyw2shgQkej7aX1SaV3sDsNmXFGA3+8tx6rkGN1J/noAQNCeFlatKlkihncq89Ljkhtr8459HO/cGegoqY0hktHn87Eq8vFVQRw+xN3tA0grbL62TXwTMYSOUxulSaJrPqOBePafUztxzsIXtkrKKhFvyDKOOQ+PLq8AhVjFmAIRGITjwSST+U7y5d/73YXPmF7iqdCzkbM+8tZ2Fbie7dGYJrCVUgheqmIQ7bxsgv3FuVBdQwi4sf22wMZRxiEdjsB/s4T8mxolNVyLlbKMJgIwMCFyfFGwy8qzkfB+e/SdsoT2ew29NEQGtb9mqeU3GfVlFPHwn/KQUayoFj6FlvBxdJRi/nTAV3AT8nO13iV4X6VSqBxumNdbf5L7SSMdXv/rHO806OKtItx+1leAsO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38100700002)(82960400001)(36756003)(86362001)(9686003)(6512007)(41300700001)(44832011)(6506007)(4001150100001)(478600001)(6666004)(36916002)(6486002)(4326008)(6862004)(5660300002)(8676002)(66476007)(54906003)(6636002)(66556008)(66946007)(316002)(8936002)(2906002)(66574015)(26005)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9VxalXFdbBhGjCARaCozf7LFmW1llLhWk2wtwL3S+jyNrnmvz2UwuodYa7?=
 =?iso-8859-1?Q?0p6fzjA/ko9gup+5d59Cfll+uZkOi0phYlVT1fhRuYFu8TqLJZx/5XRd3m?=
 =?iso-8859-1?Q?Jway/+GwVm5CX6VrJqZb5OZ+nF71E7yxfQ8Qpfk4fWqXA49kX7Sztcq8zn?=
 =?iso-8859-1?Q?xriV1GbwLl/m32L+wHW4l2IcqTxQikF7++YDimdnE7WXdkFNl/hHbDXnL6?=
 =?iso-8859-1?Q?7sS9MCDlTh4MW5a+q3+PEBFoKLUqwRy8V5qu02n0fj+eL20Asx7qTT1yzl?=
 =?iso-8859-1?Q?EuUwrCyatY+KrtcIvIVhYzRhUB40OGhObMwX+PO4bDu1KTVbi+JMqXJlGQ?=
 =?iso-8859-1?Q?CZfZE4nAkEk4sgnwyriLSvIElHbf3JmAEfwvx0FsMEMI/tpRcyJ4DhABen?=
 =?iso-8859-1?Q?qhnbBlNFxzZRqvOiDZd8t5yV9jO4aLZxXYw+sgbCp1gXb7a9fhvjQc5xLa?=
 =?iso-8859-1?Q?+BpOZyih+cjow1gcjjeWb+8Tc3n76siNrPNRG0VZoxkbG43+BxZduvdjFH?=
 =?iso-8859-1?Q?pAprLAqms+ez3B1nPcRzhknoyAl08WplizLrW4VLqhPw6vhzoaV1l1SvTz?=
 =?iso-8859-1?Q?kO4i25SgfJL4PZV6P3cdvogEypX8Ha/3OMBWnVM8e8adOFOEqUJ9SEkaLD?=
 =?iso-8859-1?Q?KYRp42H2rf2AbnSFISgJ2V09RW95Le8DN06Y2Nb/zA2ymeLqrDsImgImOg?=
 =?iso-8859-1?Q?oEwMS48E9Pvq/Az+sPtRQaz1GUAZiouQYdA6C2lieaCZLkyBiFwQVSAiwI?=
 =?iso-8859-1?Q?MHrWLGJDw6Zo8GT1EVWJhXlmhfCfK0/4IXCofNU/X26k9DyqsxRCe0GpKE?=
 =?iso-8859-1?Q?Th5tgZvogvMEFNsYx1DUUTLwfm+LFqmKo/G1nVpt6jH1bgPcO9lj8Lf6v3?=
 =?iso-8859-1?Q?DotccPJUTWy63UPqstNMwXaIA1evhmHCfTUyidQXJIIBcyzLQX3SGkq0Wt?=
 =?iso-8859-1?Q?+psMEnn7znASgdoF2zvJNVQwEvSuVzt9cLNSe+JjPhfTI/QJHnH33+eVeS?=
 =?iso-8859-1?Q?/JQZBpUnfl1fBkv0fDEYrgj4/SXKTCwiZyPNH8P/4lLW9V/t3+rlw01/re?=
 =?iso-8859-1?Q?gEojke3V3VDa1naCmB0bhXD73EJqRJhc8GN3UUJwsV5MbF5acZIRKtEXRv?=
 =?iso-8859-1?Q?yWjqvQ8tXdfVXxG4ysMu4V+P7U9Febf/QfM4lfEl38Ew33h0wbEaHyXtf4?=
 =?iso-8859-1?Q?gb17SPQwk6GzT9Z8CeVx36egVJzMl2TSvQaF+NyUNexwlMleHfLbgDT+WS?=
 =?iso-8859-1?Q?Du8BgaQTysT9bwkU1JaR6cC+nR2Fy/EZskFmdZofkUCHPUAu6UfQWiM+SC?=
 =?iso-8859-1?Q?syXwe7b7u0L+fOhZmHZNdaGHnTLtK//l3PyRYAoH2HrXKqZzCKumrM7bi+?=
 =?iso-8859-1?Q?vnqc2h74dN7uuOZAAwTofXfJROty1PY8tK2o5CHTK1z4SODC2ziDQ6rNGu?=
 =?iso-8859-1?Q?sIQhtzfTbgwTw8K9pftVFqr0RNZuwhxJ2X7eqH85Qo8ubwq5Ij15XjLPpR?=
 =?iso-8859-1?Q?Ofm2KWdKCo9y4ZYM/zFtM1eZGr51efnqa59GLURioFONWz2P0XNIxRRjch?=
 =?iso-8859-1?Q?AZWr/wgOwZlOu1yw4K3+CzNRs49rQ16SCfantgSy3vmwjWTOdC7aRHh+kW?=
 =?iso-8859-1?Q?a3bVGSWcwJI7VGuV7YLEWI1gEkvOph56yr2OLrqGJd07VgZhRr7ogVIw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 566c706a-e9c2-47f8-80a5-08dbf1021635
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 17:39:07.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9K3mTSNtucHNQocEDZgkVCAltUlc05t4nLaLPYGDNmNmjQQJ4sGEQ+b4TKsW2FtLvorSmiWXwqRUES0haCf1zj1SrLkHt20c85OHFzZhbCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 13/14] drm/xe/uapi: Fix various struct
 padding for 64b alignment
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 06:02:54PM +0100, Souza, Jose wrote:
> On Wed, 2023-11-22 at 14:38 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Let's respect Documentation/process/botching-up-ioctls.rst
> > and add the proper padding for a 64b alignment with all as
> > well as all the required checks and settings for the pads
> > and the reserved entries.
> 
> Now that the PAT uAPI landed this patch needs alignment fixes in drm_xe_gem_create.

I will fix it during rebase, thanks.

Francois

> 
> > 
> > v2: Fix remaining wholes and double check with pahole (Jose)
> >     Ensure with pahole that both 32b and 64b have exact same
> >     layout (Thomas)
> >     Do not set query's pad and reserved bits to zero since it
> >     is redundant and already done by kzalloc (Matt)
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c |  1 +
> >  drivers/gpu/drm/xe/xe_vm.c    |  8 ++++++++
> >  include/uapi/drm/xe_drm.h     | 19 +++++++++++--------
> >  3 files changed, 20 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 095f1b8c2290..d0523dfc488f 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -371,6 +371,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  		return -ENOMEM;
> >  
> >  	gt_list->num_gt = xe->info.gt_count;
> > +
> >  	for_each_gt(gt, xe, id) {
> >  		if (xe_gt_is_media_type(gt))
> >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ccd2821e61f8..1dbd6e948741 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2817,6 +2817,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >  	int err;
> >  	int i;
> >  
> > +	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > +	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > +		return -EINVAL;
> > +
> >  	if (XE_IOCTL_DBG(xe, args->extensions) ||
> >  	    XE_IOCTL_DBG(xe, !args->num_binds) ||
> >  	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> > @@ -2933,6 +2937,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	if (err)
> >  		return err;
> >  
> > +	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > +	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > +		return -EINVAL;
> > +
> >  	if (args->exec_queue_id) {
> >  		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> >  		if (XE_IOCTL_DBG(xe, !q)) {
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b0ef1f62fd99..4c175946547c 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -211,8 +211,6 @@ struct drm_xe_mem_region {
> >  	 * a unique pair.
> >  	 */
> >  	__u16 instance;
> > -	/** @pad: MBZ */
> > -	__u32 pad;
> >  	/**
> >  	 * @min_page_size: Min page-size in bytes for this region.
> >  	 *
> > @@ -381,6 +379,8 @@ struct drm_xe_gt {
> >  	__u16 tile_id;
> >  	/** @gt_id: Unique ID of this GT within the PCI Device */
> >  	__u16 gt_id;
> > +	/** @pad: MBZ */
> > +	__u16 pad[3];
> >  	/** @reference_clock: A clock frequency for timestamp */
> >  	__u32 reference_clock;
> >  	/**
> > @@ -715,6 +715,9 @@ struct drm_xe_vm_bind_op {
> >  	 */
> >  	__u32 prefetch_mem_region_instance;
> >  
> > +	/** @pad: MBZ */
> > +	__u32 pad2;
> > +
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[3];
> >  };
> > @@ -733,12 +736,12 @@ struct drm_xe_vm_bind {
> >  	 */
> >  	__u32 exec_queue_id;
> >  
> > -	/** @num_binds: number of binds in this IOCTL */
> > -	__u32 num_binds;
> > -
> >  	/** @pad: MBZ */
> >  	__u32 pad;
> >  
> > +	/** @num_binds: number of binds in this IOCTL */
> > +	__u32 num_binds;
> > +
> >  	union {
> >  		/** @bind: used if num_binds == 1 */
> >  		struct drm_xe_vm_bind_op bind;
> > @@ -750,12 +753,12 @@ struct drm_xe_vm_bind {
> >  		__u64 vector_of_binds;
> >  	};
> >  
> > +	/** @pad: MBZ */
> > +	__u32 pad2;
> > +
> >  	/** @num_syncs: amount of syncs to wait on */
> >  	__u32 num_syncs;
> >  
> > -	/** @pad2: MBZ */
> > -	__u32 pad2;
> > -
> >  	/** @syncs: pointer to struct drm_xe_sync array */
> >  	__u64 syncs;
> >  
> 
