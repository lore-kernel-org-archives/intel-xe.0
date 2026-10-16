Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06700CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 16:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC6B897F6;
	Fri, 16 Oct 2026 16:29:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324CC897F6
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792168191; x=1823704191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xQMfzX+RuamHsw7ZTo/J+sBndngL1RSSRMtHS0XWzvk=;
 b=QYMW9qCiqfUVDwtzggQMoUhIN9jdqse4/GFOGF5DgBgmOTASJ9/lFEiD
 yjdx3Pq3mbeCcLrqveNFdUJPtLFXg/JpNlmSj0PIoUIMlTu5cIKjJ2WPC
 +FK9Ew50qPBWrZmbkiiTXU6Wxo0LZIt0010ZV6eMHDFy3Z7H2xeKa06AP
 Lr0B1SkcAbTaybKCalYHB2R/9HCQBOz+8Bb1ZBXKPSDBi98/uv5HVy9dr
 b5btUd/e+8bADv2SmVAJBOB+i6aApL5hT9ZpeOZMHMB9U1gY4yhvQTDGW
 D+LF1AdfMuX9yboLHoSwtAY3js6PFQsRhRghBVtjbNsMFJtc6+gmWZQba g==;
X-CSE-ConnectionGUID: +tJqPK6tQZe3Lsa/t80Y3g==
X-CSE-MsgGUID: QeCnob+tR5md5UN/Ecskgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="974190"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="974190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 09:29:51 -0700
X-CSE-ConnectionGUID: 2VpSuldZR4uVJAVi6qpEsA==
X-CSE-MsgGUID: BntjbukvRYSMVdBcGDIzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2408385"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 09:29:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 09:29:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 09:29:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 09:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqitB5eMddIyI+d1ERkmw2fQ3clZD0YogRkgpl8jWigXHDAe3o25AFpwe/CDajHYyufqAY7RnjEnlV9thoXwOxiVFbDNTRmIZTGNoAHUJE4GGTCzBnQScu4tpETppuIGixA/wddPRQTH2gyKBYn8/gIq9kbQZWInj5TDXjFIDAdCXDmRmLoBl05WEbvkeiKANF01sR/mK/YEbdesxQMKZiII1a2RIEflnfy5OX2UOTGntmW0NeDjE455ATdy8Jmc8JzYX9bpXbVqzp8xwSUSAtUOSo1FQpf6xgx2dKafBjqInQDF2N4WBy7MaENorlNiKafLnHBUNhtqYCzclTbWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvqkNQExIHPXcLsO42dNUaBV8JhsJpgDia6pWPML9LI=;
 b=UgQK/6R1J68ljr4TAYvABwxgT+L83GXWyI2hOaE2qYGDFFhv2SV59Hj+KMSjWyvMT6qwjHKmYfBXQH/GRk1ZZa+1dS9z5STWYMMLK0HI+QQyISuPAcXQC8TItL/MIVbV665ZDuXjjt2TiJ2IBytaXefZ4JLUo52TiPY//6tQZ8pgLc2czP9IKoGze+CT7+ZU1aUq6/OL9IARBCGLGnew3PTt+zJuT+9LerIlMQeFr7TwAGuixo3Jf3qs9JO//jIrixQPVB5mwzu7Rx3E/8c8ut70eU4du4+eMKPATLaHenzfYhC+khQnDVoBVwuC+HHcVJRvv6Hg2IIDCj3LV00aKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA6PR11MB284697.namprd11.prod.outlook.com (2603:10b6:208:5eb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 16:29:48 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:29:48 +0000
Date: Fri, 16 Oct 2026 09:29:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <x.wang@intel.com>, <jia.yao@intel.com>, 
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Message-ID: <atJQ+gI/kUq+T92J@gsse-cloud1.jf.intel.com>
References: <20261015050136.1069815-1-daniel.charles@intel.com>
 <20261015050136.1069815-3-daniel.charles@intel.com>
 <atJQM5JzVlw71stS@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atJQM5JzVlw71stS@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA6PR11MB284697:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a998627-f27e-4b91-e511-08df2ba2b227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|10067099003|18002099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: F4GwzIfY3ARq2HoGu5iKzgJZpZrDL+uoFUneJ/hNIGuRHqEsOXRlOX+Hrxm5KB7SlBetl5fDdaksLdUYpQFkutQllNRuxy+fnMKAeM+O9fZF8gdMSG2uRBCpjBoLA0aulQWTweHcKRjQdmMrIAc+Tj3Of7MugPx+alBVaBG7qv+cjptqaOJihkII2ZtIHLUhWdwqKEgARSPqOWWBf77UEoJoDKvQ3QrTEkhc6jJLlynKnOpQRoi4RMEH8yWAh4hVTBNr5V4KCatMs7cYOMjAoNWeOyRr8oBEj2JEnyn+68X4RYR9Mc8pe3IvDzkj2l4L5ke9CLLRRu3N89y6LLZHJFxdECCOZxMcbjdIEUgEOfJpjO5cEIZwIyyiJc8FN4B/Ca9sJuNpv8t4ZMr1HqgrIYr3Jf7EsZJxEzVstDxw0fk6bgmOsJk16HMPnF0g4b5cjTMtw5mQy1sEEM3GVaJAjENUd6PjZVbHMU09K+U1CpJwbT/vX8ukSxI401pKSPHnJfqioG44G/d+0CiwX6W8QOlhzROzNGGN9LOHWh9EQ9+zyG93xrzkvZ+a2IuWYjf02G2dZNY4OLau6pBmGwsVX46Zy4zov5HSyV9Hyx6r2pgHHemHOy668dxUkNGUVM4qUSRwfxLYNdV8vqaz0oTC0oaNpGjbLjW+bHZcmHKL0Gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZE3ah8imBo3YJ0So9LY3Q0GkMIcxv19w/tCk6seCEj6vvkKELa7x21PdQ2L?=
 =?us-ascii?Q?NBcE4rjl/4xyJ92Xq5egPQjTavYdNefALuKkWQLgGoIohiBEHXapp1VtKx6F?=
 =?us-ascii?Q?vQG8RWuwd+u4phNwxJf5xwhAaRozEymbDH20JjHbVuB/mGyvM2XbqOCBVID5?=
 =?us-ascii?Q?2xNL2TN8WpZzQIbcHxjTA2mS1wc7wzuEpNARQguH2KVtYMGcA0VlXlL6I1un?=
 =?us-ascii?Q?kUs8gvMHIdVj4ICWwaxHgwCJzBt4o+TIjtcH/+KXZGnM3lQFlAIoArMmuUx1?=
 =?us-ascii?Q?HKu7VreW218DmjHSwRbmZN+pL9islQVHNU9FJ763WIVevz8daAmRqFR7J831?=
 =?us-ascii?Q?yGKjUb7jWlBEtMct1WlIY693l0+7VsBrdoztntw2Gq9G8XFQ54xyewfXJh4n?=
 =?us-ascii?Q?rJvGrbC2NGKK+caEWoLHGaFiRDToxBxt7Lt/ukDZVFRnWC/yKhwZSq3B9vao?=
 =?us-ascii?Q?03UsNhk6tPmGkWhgAl2MGI4NkrSySeByR+nUTYgmfeEJJ/kjgzAphmxIUA3V?=
 =?us-ascii?Q?b68EcBv7X7yFr+RA0z/U26jc8P0M9Io6/yT7hmHMw3asLe6tatlw17GubATH?=
 =?us-ascii?Q?wbxRiEFkIP0SVqVihVx9vV551wu/wX4rMIoTyhZpElrNLbV0cq4rt/9GKwbK?=
 =?us-ascii?Q?Q6VnpGqMPqDXwrqu0fIAeKym6zVYIYpWLhpX/eFnkiyx6waJcFS/41/PTGsg?=
 =?us-ascii?Q?ligGLwUHWPyHNcbZAxxJhldwytlfG4Y9mChu6FyHPz4qaQVPXoIippnq8FKb?=
 =?us-ascii?Q?ECCOarVf90N/KsfxoFMl+udCQGffFLVzh/lQCTtsdOoAcXPKTrXSZ++nbIlt?=
 =?us-ascii?Q?UNkH0E9BlphRWqWzAHarciWVuPLGHl95jRJ5rH5SS3pKyVAC+7/gxjgiv0V0?=
 =?us-ascii?Q?gb6MYr97svEprhjvch5HCS3a/lfJ7OFoeR4wc/IaP3qJI2XGaD8bwqcJJjXM?=
 =?us-ascii?Q?EwXqg2ks0Ub7Jw5cW7LVGYMmR5Iv5WVoyYmk2lP1O8nwJLSQkYUUrlbnHvqf?=
 =?us-ascii?Q?i0j9ZRBEWhASfFsUk6BLe8kvhVAaaNK6kOxGZL0WMQfrB8CkNZ6PsYi5hm7H?=
 =?us-ascii?Q?E8iiYIMpnz+CTpgc/eGt4SoCH+ArwkVPNqAHlfLEgIJqb3nM3W8Y7sIVvXSH?=
 =?us-ascii?Q?L8cNuTiVen+P/pzHFXbgn92jBhCD9XMbgXlZPXRXZblSBtBo0/CSOLbW8iMr?=
 =?us-ascii?Q?FcVmVXRR1eM4QdsPp2GuMpLCxqtXvpEZSWqvopeZtozNhkIPO8GytWNytsx5?=
 =?us-ascii?Q?Fr3FgKk2X+nrUEGNyLLIIKkUESTSmvPLDeAjNQuwRWWvxqYSPd+cMzlGUvMk?=
 =?us-ascii?Q?AAp0M7RZQ5WlIQigbyUgZIpERJ90VJoTBVPZpFKDcxRbk6XGPeU1Z39U6nTP?=
 =?us-ascii?Q?nW3BRa3dyLC5pcOjku1g1gvo6iyBd6HpOUhnfz15SsNS8Z8CIi9Ugk2wHgmX?=
 =?us-ascii?Q?L55s83uS4RAdHHOCv8mIr2sFF9JKdgBEBjgzTLRjwhhfAdRX0uZ9OAhp5QPA?=
 =?us-ascii?Q?9vs3RVcj6uhKvEuZKQSTnDks/rCdXLj/9UjCoHqHrerSsLZ58HOtMybRlAM0?=
 =?us-ascii?Q?2xOwVWpaO8vGWuTD9F1piFmqCZOr12CMo8a6GkC1uFbhBVo4SYG7BML3fxng?=
 =?us-ascii?Q?QsGa0dR+UcumTbewEKd7E5Rskxdix14SGaFR+L5YmFDXLSwapwAK4mmfyyB0?=
 =?us-ascii?Q?4zDmDOf0c9eBIFnGBFC/xnYL5KmPmTpT1luq7h/lvGJJE56FqYV+PVE/wMYJ?=
 =?us-ascii?Q?Wq3p0SfSnw=3D=3D?=
X-Exchange-RoutingPolicyChecked: ICf+a+FQjsz2RXLD71sgSSmifPK8iLqG48O0yVbpLhtFBI3ffL/hqJDaaAcvYnWDFtSsP34bmzw/N0z0QGw2GNcdff0mhER8pYK03niuHsOMTYsdG28D3EALIw3ZaLQQ/OU7pTCKM3yNdQF1eyoHVQ/28/0xqlxvaa67QguIM0+hV9GrruG1TYPr9urmJn1qouTfirzo+mfOTr8H2cprvsDK/EMcxoBhhSSH+ydanRRmUL/lDTJ3Uddrh5OYb2MSBvfpgIt0eGDZdp2Sd2XljU2pKvZuqfdyoj8YyhK6G7+/CifBnSbYunYqg1RzCFLsow5fuzntKiTbQAUUVfN6yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a998627-f27e-4b91-e511-08df2ba2b227
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:29:48.5124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo6n8AyxC6hbCxh1Umz99ok2cp/PaO+AWk62v6Nx+5iVpmYHlIYpD5IXo4vq73JeeqdQi8L4k0M3vTy98DKDRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB284697
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

On Fri, Oct 16, 2026 at 09:26:27AM -0700, Matthew Brost wrote:
> On Wed, Oct 14, 2026 at 10:01:35PM -0700, Daniel Charles wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > When an FD is closed with many exec queues, teardown relies on the TDR
> > path to clean up scheduling. However, the TDR handling is serialized
> > (i.e., only one exec queue is processed at a time), which can make it
> > too slow compared to GuC scheduling activity.
> > 
> > In this window, GuC may continue to schedule contexts backed by
> > invalid page tables, leading to a cascade of CAT errors and repeated
> > engine resets. This significantly increases recovery time and can
> > degrade system stability.
> > 
> > To mitigate this, eagerly disable scheduling by sending a self-message
> > outside of the TDR path. This prevents further scheduling of invalid
> > contexts and avoids the CAT error/reset cascade.
> > 
> > This change improves robustness and reduces recovery latency in
> > multiple queue teardown scenarios.
> > 
> > Cc: Wang Xin <x.wang@intel.com>
> > Cc: Jia Yao <jia.yao@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Jia Yao <jia.yao@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c           | 46 ++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index 74b711abe2572..89397e1e65465 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
> >  	 * a message needs to sent through the GPU scheduler but memory
> >  	 * allocations are not allowed.
> >  	 */
> > -#define MAX_STATIC_MSG_TYPE	4
> > +#define MAX_STATIC_MSG_TYPE	5
> >  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> >  	/** @destroy_async: do final destroy async from this worker */
> >  	struct work_struct destroy_async;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index c4ef3e9bf7a18..609af66b343d5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2045,12 +2045,23 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
> >  		guc_exec_queue_send_cgp_sync(q, 0);
> >  }
> >  
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> > +					      bool bound)
> > +{
> > +	struct xe_exec_queue *q = msg->private_data;
> > +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > +
> 
> Here need to wait for pending_enable/disable here like
> disable_scheduling_deregister does. This is the CI bug in prior revs.
> 
> Also we really only should issue if exec queue ref count != 0 and if it
> zero deregiser message is directly behind this kill message (this is the
> healthy queue close path). Gate the entire function on behind this
> check.
> 
> Since I'm ask for changes, feel free to over as author.
> 
> Matt
> 
> > +	if (exec_queue_enabled(primary) && bound)
> > +		disable_scheduling(primary, true);
> > +}
> > +
> >  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> >  #define SET_SCHED_PROPS			2
> >  #define SUSPEND				3
> >  #define RESUME				4
> >  #define SET_MULTI_QUEUE_PRIORITY	5
> >  #define CGP_SYNC_MSG			6
> > +#define KILL				7
> >  #define OPCODE_MASK	0xf
> >  #define MSG_LOCKED	BIT(8)
> >  #define MSG_HEAD	BIT(9)
> > @@ -2085,6 +2096,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
> >  	case CGP_SYNC_MSG:
> >  		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
> >  		break;
> > +	case KILL:
> > +		__guc_exec_queue_process_msg_kill(msg, bound);
> > +		break;
> >  	default:
> >  		XE_WARN_ON("Unknown message type");
> >  	}
> > @@ -2211,8 +2225,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  	return err;
> >  }
> >  
> > +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > +				       struct xe_sched_msg *msg,
> > +				       u32 opcode);
> > +
> > +#define STATIC_MSG_CLEANUP	0
> > +#define STATIC_MSG_SUSPEND	1
> > +#define STATIC_MSG_RESUME	2
> > +#define STATIC_MSG_CGP_SYNC	3
> > +#define STATIC_MSG_KILL		4
> >  static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >  {
> > +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
> > +
> >  	trace_xe_exec_queue_kill(q);
> >  	set_exec_queue_killed(q);
> >  	/*
> > @@ -2222,6 +2247,23 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >  	 * stays set until the queue is torn down.
> >  	 */
> >  	suspend_wait_wake(q);
> > +
> > +	/*
> > +	 * We eagerly send a message to ourselves to disable scheduling, as the
> > +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> > +	 * If an FD is closed with many exec queues, the TDR can be slower than
> > +	 * the GuC scheduling contexts with invalid page tables, creating a
> > +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> > +	 * this by immediately disabling scheduling outside of the TDR.
> > +	 */
> > +	if (kref_read(&q->refcount) && !exec_queue_wedged(q)) {

Ah, I see I had this kref_read(&q->refcount) here, this is backwards.

It should be xe_gt_assert(gt, kref_read(&q->refcount) here, and then in
message processing skip that part if ref count has dropped to zero as I
suggest above.

Matt

> > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg(q, msg, KILL);
> > +		xe_sched_msg_unlock(sched);
> > +	}
> > +
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  }
> >  
> > @@ -2274,10 +2316,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> >  	return true;
> >  }
> >  
> > -#define STATIC_MSG_CLEANUP	0
> > -#define STATIC_MSG_SUSPEND	1
> > -#define STATIC_MSG_RESUME	2
> > -#define STATIC_MSG_CGP_SYNC	3
> >  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
> >  {
> >  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> > -- 
> > 2.43.0
> > 
