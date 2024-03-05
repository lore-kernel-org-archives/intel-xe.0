Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F060DC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAE1112C61;
	Tue,  5 Mar 2024 17:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgN0gRml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0648112C61
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709658758; x=1741194758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lx6yM/oMmzQnhv5iuaUjdPCsmsjfgYzyVoZ3Tt1wD/8=;
 b=GgN0gRmliAh3U9+DvELhDVlkq19aOOiDVaEUqm0DdiK32LcQdOyV+LpW
 o0FX6BAMvvV1uGU++nRp88b/kbqT+urh35SUjQ081oQfGnjTD+wNiRw0k
 KudRP8pVUuL7AT5FN5WIbmuXM2UdpLn/VTlmgmaPYDv/aot8HBBvGs/Jg
 6sRUXIrqRdL4fXJfk1BO40QRJnX7B3yPTxpAu+hYjm8pgvnj+Cf4gMREI
 d1aaje7U4M3mxwxfLB/5HCV8+JIB7vEe3lsYUt4rdKOP42ox+v9esWzv4
 sovmkmtD3B96v82s4lDttuZuK7rKamUQD58/e4X0A1hoPmvK4WO0j5v63 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14806568"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14806568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="32621861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 09:10:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:10:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 09:10:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 09:10:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 09:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXQ+xeGInpuMTFOSa7kppXKrbdjp9TukOkqt/cMRPrBz59PQHy1zJRZneWTGCJ27+MGaEmmP61bgDkPE2gvIvfdvA506PLeVPX4tq3tvvrwpKx75s+uJi5mMkD1fnZM6hoU2bYlZFckmpK47a7LTi0U2yGcDZa+AfittBuDtbfy1eLl+lLV8yS5b+kdhB5GgKxUzapLz7pUde4n1+ASJ4yDLYsLL7F5n+or1WMc+tfLX3vZVRzjhaLi57LeVBU7pMCap+32xHXgagffLEL0rjHiYi+2Mi39OO3/johpXnG6Qn6hskd4RVbJFVWF7TRVU5Gnh7Nhmj6rLDKW1YVruWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2AHT+1ttiFGH0tgRNGCih2hFOj5XN9LPWGSYY5FovU=;
 b=ZTQi6zggjdBaUFMqy3kIO8fEVaY/I3D4H+UUF3feHlyEPVb58HmxEoiLrORXZjipcv5FSfO3ALkUPHbl3Gas4pQctM4NU9dKQeEgbnMqL9dOvET0I5AL2gC8NMhcAREe3LdXtw828aFeTZAhmkJWS9FCyj4enol/LzcXP8wohn0MIHDrzp+z+i2l7638sv0zsM1uZ23XWfbWvtSYzwvJAqvU4bcj3lAwFADgqbSfACfK6uwEAyO18seNNb/v0q3H7nlc4cADhRLOeIkpt43KnPrdrmj9J9A6eqsvJb8C90pgzzeztIZmehcUmHDHN9VCmpbOSASnROYLfE0TFpsSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 17:10:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 17:10:42 +0000
Date: Tue, 5 Mar 2024 17:09:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Do not perform GuC TLB invalidation for
 display GGTT
Message-ID: <ZedR1A2npexqEuee@DUT025-TGLU.fm.intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-4-maarten.lankhorst@linux.intel.com>
 <ZecwVzfIoKwhHj8z@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZecwVzfIoKwhHj8z@intel.com>
X-ClientProxiedBy: BY5PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:180::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: e49f50a8-a5f2-4671-e70b-08dc3d373043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJEfiFbLSE3z0WaWPCPJiK+c2gpJyoWYEMRizwL/CuQwSOqgojcM1LZfF8I9Z7BPSHXy7MlHYRAUAzPbx/15Wl1Kf2AJHX5KaMPNo8kgzbZ3Uwhl69KKyZKTDDk1XLWpir9LO3dmwcucGFTfLW6/cq0vj3HaRLVTPCQn3m8kSX43HJylzxmKHXu8b4fOSCXKt4G0AxGwVdFAbBxruE4Se0A338oCBlNFMNgyb85uFJABNL5GgkABQztugjuPCaFDmPqB3fck9ds7tCDAdrWz8gkiCRk3mZD+DvjW5Q5h0UpAYd8Gd64xlfxQii3gIaFG6WA27fLUc2w0QtJEXJ1CyncRp29wbg4Eq2RNN/egaHMtvdgyGcgkuqq9H+xLGHJx1YIWdkJi59XXOnfr6/5KjU1Ke5UP1WwevL3hYZIwCYT1lujcg3ECQ43qaxaS4q8/YFkEhu8XYqkyLZ2VHBsuKHK1XpTSpWf+p5MIXtZ8faCfZeUSE+vMtJKI1pM93wR7nMzLFyhta3k8OUesFVHK9fdBEBkHQfXmWHzVjeFcbXbzc+PThf60cRkX/cCABr++GCXWmK9WsRjXAIRhil/SksAO0BZv0wjfS63x7wQhMCcfSnXJlQCEtMtBCdORfTW/mZub6xaRWu9hCfMRS4LfWYqYcDOUoMp4mnyZS/RE5fQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ht1BmA5xQFMp8VA2ocWzkcDmL/YqBaQgLxi4TSVOCbmistobo5vTip4hJfsU?=
 =?us-ascii?Q?lVKDPm3tiL9w85EjkBf7b0rlQIj3dm5KR7TruMph9hrjwJT0YTvk6xPHmAfq?=
 =?us-ascii?Q?GxewV7mpEHRX+b3+rwu7Z4R20xOsbvwIFbo9swDHnNocL7OJ7kB6CB0f9a/j?=
 =?us-ascii?Q?Pr5cc886U2tyIipFHnGg2EVKdtCwtYMrXk8FxM/PNSrDB4GZgf6FZoaXCaoo?=
 =?us-ascii?Q?nVHHMQIGfHLEXazWoFygmGU1bkIaBAlTougJIcoGzZ8/BBLB3TytOEoBHnZK?=
 =?us-ascii?Q?4lU3OBLZOWNhV5tR1LjbPgWA/4zqwRzguMzoG71weOdLf8x66zQvb4hjftvq?=
 =?us-ascii?Q?/HCwXuhqiV0ubWONVWtSIUMN4Hq8KfZXlD5jeSvA6SCOfCZPBQb0rAQyJ3g8?=
 =?us-ascii?Q?1eBUFbVsbOkMukxAg9xe+7uAgsaiNfvtvZiFvhKd6gyPFDxWVfQt9qAPHHQP?=
 =?us-ascii?Q?CheP72+OyOjSMpCoUEl7LNxe9m/voLtaIjGI6EaeV4iPopiMVeUznPdztouW?=
 =?us-ascii?Q?mvZNFGeAw7s0YNLxwy/W3RBMlh56XdBEM5BdkcytV0AdhdKDIBJ+OCNWW06f?=
 =?us-ascii?Q?1PLwZaagaw6HY4AMZ6LNthXUTh7zs3TpuIK4pbo4b39IvBuvAJwreJgmRFep?=
 =?us-ascii?Q?UdCneNtQ+0o9vNTLrc5IO3EsB07PZc7uifJ6SPmZXhPetUck+Iql2ivfsmkm?=
 =?us-ascii?Q?Hi6Z/qsgYF7wmBvXjMxDlu3zwv29vZQxbLeQ43tArQJSemUtdh/e1pu4hXep?=
 =?us-ascii?Q?J+TwqynsDpocvHqn9NwvRZ9EcmE8qiCvzIUglFy3SGqv3rOAolwheLQ7FvYd?=
 =?us-ascii?Q?d0wcJq1rrVPYILsktk+XhflsvOeOSO6xwMqWNRgeRsRLzwJNEULrKpLlF9AT?=
 =?us-ascii?Q?pzW9zBjlqzIQ/RX6++wYD0APoUXblIL45PafobST+elcYJcWNOua6nIOXW5w?=
 =?us-ascii?Q?+Ljo7uG1xkJohA+yfuZROrWPVUDzDuU6jty5fINvjVuGH9p1MmnJ1MZ9RL9Q?=
 =?us-ascii?Q?J6AUDphRT9DFuo/1zJBmle2tZimxTUb3xFuPxC3qRNjDH+amV+CmacO/ug4o?=
 =?us-ascii?Q?M9curkE08xkvI6/1hBiMUFDfaaNzDmjDdK66kaJo19JLFCEVSU4LlPbir1T1?=
 =?us-ascii?Q?HJzTkNGcTaYWGTJrKga1INu1VI6BnUspwhwZMOZdZwrl4reDvG870a1JshCW?=
 =?us-ascii?Q?PnG5GMZ6nPHuQoTnTvGMRrWBd9Q9ZiXtkd5DVBCtn0XKlgevjBxz3iTSPILN?=
 =?us-ascii?Q?8uaNTF52ZAqxoGwLqZYIDP8lqIo2mNLhG7nbhsfZnG3jZ2VVzV0xmUNLTQzz?=
 =?us-ascii?Q?mwquKMQ71qdaqXhwmJcJ5usE9iEVnTNj8uqdepJrt2KX4hlUfcYBjdAEcmAR?=
 =?us-ascii?Q?4Bz3ehI6jiLzwwWpxtAOeGeNKb6qZcT/UsKni7CLtDwftpib0zY9FjgSWYev?=
 =?us-ascii?Q?+n228tHwi72vacfo75OtiBOCl8Re4xgcxSdSW4zzg9vDZQPApMUe3ahjUDmb?=
 =?us-ascii?Q?VjUs8icnx9Us80KYR+7Xv1Z4wcrcLosQ/3QfCO/shYRVCNefJrw/n4N/they?=
 =?us-ascii?Q?z2QRBTcF3Kv3p6f/wtR7iNv2PNdLwVpR8FZ+BGYq0x8PmatXpOehCzvZGkji?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e49f50a8-a5f2-4671-e70b-08dc3d373043
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:10:42.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDC2NUDKzonfDMihgl7M+V5w9k42vXbhZQP7VEeK3Z6nDZi95p0NrNBysdMx63PPZj167Qk+XXd7rtz1KXrNTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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

On Tue, Mar 05, 2024 at 09:46:47AM -0500, Rodrigo Vivi wrote:
> On Tue, Mar 05, 2024 at 02:12:49PM +0100, Maarten Lankhorst wrote:
> > There should be no need to invalidate GuC for display, and it adds
> > a lot of latency for pinning/unpinning.
> 
> why 'display' is the special condition that doesn't need invalidation?
> isn't there anything else we can use to differentiate the issues?
> aren't we over invalidating then?
> 
> > 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 11 ++++++++---
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  3 ++-
> >  drivers/gpu/drm/xe/xe_bo.h                    |  2 ++
> >  drivers/gpu/drm/xe/xe_ggtt.c                  | 16 ++++++++++------
> >  drivers/gpu/drm/xe/xe_ggtt.h                  |  4 ++--
> >  5 files changed, 24 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 722c84a56607..95595d2cf1dc 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -100,16 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> >  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> >  					   ttm_bo_type_kernel,
> >  					   XE_BO_CREATE_VRAM0_BIT |
> > +					   XE_BO_CREATE_GGTT_BIT |
> > +					   XE_BO_DISPLAY_GGTT_BIT |
> >  					   XE_BO_CREATE_GGTT_BIT);
> >  	else
> >  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> >  					   ttm_bo_type_kernel,
> >  					   XE_BO_CREATE_STOLEN_BIT |
> > +					   XE_BO_DISPLAY_GGTT_BIT |
> >  					   XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(dpt))
> >  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> >  					   ttm_bo_type_kernel,
> >  					   XE_BO_CREATE_SYSTEM_BIT |
> > +					   XE_BO_DISPLAY_GGTT_BIT |
> >  					   XE_BO_CREATE_GGTT_BIT);
> >  	if (IS_ERR(dpt))
> >  		return PTR_ERR(dpt);
> > @@ -201,6 +205,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> >  
> >  	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
> >  		vma->node = bo->ggtt_node;
> > +		goto out_unlock;
> >  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
> >  		u32 x, size = bo->ttm.base.size;
> >  
> > @@ -238,7 +243,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> >  					   rot_info->plane[i].dst_stride);
> >  	}
> >  
> > -	xe_ggtt_invalidate(ggtt);
> > +	xe_ggtt_invalidate(ggtt, true);
> 
> this is a bogus call... isn't it better to simply remove this line?
> and perhaps not even adding the display condition inside the function
> but checking on the outside?
> 

Agree with Rodrigo here, rather than adding an argument to
xe_ggtt_invalidate properly call or not call xe_ggtt_invalidate.

So here just delete xe_ggtt_invalidate.

> >  out_unlock:
> >  	mutex_unlock(&ggtt->lock);
> >  out:
> > @@ -321,7 +326,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
> >  		xe_bo_unpin_map_no_vm(vma->dpt);
> >  	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
> >  		 vma->bo->ggtt_node.start != vma->node.start)
> > -		xe_ggtt_remove_node(ggtt, &vma->node);
> > +		xe_ggtt_remove_node(ggtt, &vma->node, true);
> >  
> >  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> >  	ttm_bo_unpin(&vma->bo->ttm);
> > @@ -381,4 +386,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
> >  void intel_dpt_destroy(struct i915_address_space *vm)
> >  {
> >  	return;
> > -}
> > \ No newline at end of file
> > +}
> > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > index 866d1dd6eeb4..79766b561d16 100644
> > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > @@ -62,7 +62,8 @@ initial_plane_bo(struct xe_device *xe,
> >  	if (plane_config->size == 0)
> >  		return NULL;
> >  
> > -	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT | XE_BO_CREATE_GGTT_BIT;
> > +	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT |
> > +		XE_BO_CREATE_GGTT_BIT | XE_BO_DISPLAY_GGTT_BIT;
> >  
> >  	base = round_down(plane_config->base, page_size);
> >  	if (IS_DGFX(xe)) {
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index c59ad15961ce..1290c17c10f9 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -45,6 +45,8 @@
> >  #define XE_BO_PAGETABLE			BIT(12)
> >  #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
> >  #define XE_BO_NEEDS_UC			BIT(14)
> > +#define XE_BO_DISPLAY_GGTT_BIT		BIT(15)
> > +
> >  /* this one is trigger internally only */
> >  #define XE_BO_INTERNAL_TEST		BIT(30)
> >  #define XE_BO_INTERNAL_64K		BIT(31)
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 325337c38961..bda5055a2a18 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -211,7 +211,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> >  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> >  		xe_ggtt_clear(ggtt, start, end - start);
> >  
> > -	xe_ggtt_invalidate(ggtt);
> > +	xe_ggtt_invalidate(ggtt, false);
> >  	mutex_unlock(&ggtt->lock);
> >  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> >  }
> > @@ -261,8 +261,12 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
> >  		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> >  }
> >  
> > -void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> > +void xe_ggtt_invalidate(struct xe_ggtt *ggtt, bool display)
> >  {
> > +	/* Nothing to invalidate for display */
> > +	if (display)
> > +		return;
> > +
> >  	/* Each GT in a tile has its own TLB to cache GGTT lookups */
> >  	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
> >  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> > @@ -388,7 +392,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  		xe_ggtt_set_pte(ggtt, start + offset, pte);
> >  	}
> >  
> > -	xe_ggtt_invalidate(ggtt);
> > +	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);

Here would be:

if (!(bo->flags & XE_BO_DISPLAY_GGTT_BIT))
	xe_ggtt_invalidate()

Get the idea?

Matt

> >  }
> >  
> >  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > @@ -433,7 +437,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> >  }
> >  
> > -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> > +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool display)
> >  {
> >  	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> >  	mutex_lock(&ggtt->lock);
> > @@ -442,7 +446,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> >  	drm_mm_remove_node(node);
> >  	node->size = 0;
> >  
> > -	xe_ggtt_invalidate(ggtt);
> > +	xe_ggtt_invalidate(ggtt, display);
> >  
> >  	mutex_unlock(&ggtt->lock);
> >  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> > @@ -456,7 +460,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  	/* This BO is not currently in the GGTT */
> >  	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> >  
> > -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
> > +	xe_ggtt_remove_node(ggtt, &bo->ggtt_node, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
> >  }
> >  
> >  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index 42705e1338e1..bc2a6379a2e9 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -11,7 +11,7 @@
> >  struct drm_printer;
> >  
> >  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> > -void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> > +void xe_ggtt_invalidate(struct xe_ggtt *ggtt, bool display);
> >  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> >  int xe_ggtt_init(struct xe_ggtt *ggtt);
> >  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
> > @@ -24,7 +24,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
> >  				       struct drm_mm_node *node,
> >  				       u32 size, u32 align, u32 mm_flags);
> > -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node);
> > +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool display);
> >  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> >  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> >  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > -- 
> > 2.43.0
> > 
