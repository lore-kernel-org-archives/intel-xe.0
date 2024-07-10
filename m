Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C00C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 16:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C33610E83D;
	Wed, 10 Jul 2024 16:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLE2ZCAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816C210E83D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720629809; x=1752165809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lv0M3D8bgBnzXkkGfnpOMCVIkp/JBGqxItr+FqNkm/o=;
 b=HLE2ZCAO76AZJ9Rl9GLbaKlQfy7SCFtb6SPFQOmoaT2qMkt+jeM2GtOi
 4Kl6nK//oBel1WCCXsa02Cb6QxJrm6AYmGOl8JhD2zaTlpnvO16kB4FVC
 hwoDrrDar37lucPs1xtSr8BnyG1pxsYpl0N+DEwZEndhTr6rlYIuVFIEO
 uxITGqUqHZfimTMuxzdQLC5gbf1+RIHWw2woKrk0LorJk9f6G4C7X0cFN
 kCieYirW+X9ISvNFMrLEnpzD1lXdPw155duOffraY1x/6TR/M/2P5wJDg
 p19XiLoiIFvXbnhveBLLQ4hgRBRGRpbgnJmI6KdbE1h1o4ePqUtrpkuXm g==;
X-CSE-ConnectionGUID: NJbCHjqGSIeszOpnwKcfDw==
X-CSE-MsgGUID: 3teUH1PuSmmIFm38Y20jQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17809100"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17809100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 09:43:29 -0700
X-CSE-ConnectionGUID: 6WFcvXp0RNSEOhelm/NCSg==
X-CSE-MsgGUID: vo+Lu/7uRtaFrJ2yAzaKNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="49012345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 09:43:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:43:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 09:43:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 09:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJmnINtG1vYaOIkoysLxVEHj0GSmfHLNDPVY88GNryuRcFWimhmVewwXieAJ5B0T0s2hRQqBU6xtYj/d+NpUnj1A6SwPoVAq5i9HgOq587EfSPKsmZ3Uh3Vu632nM7B3Loh6hqvDkQwuHLNb6yywSyChocagtZACQnIokuO50cph4BqEZgcSl42OJA58dE7ct88mVYHL0zz5LpRc2l0q24W+ySUlvqCFYpIeMrC7o2P+lN8lJcS6A8knq5npuaf+XegtG5JcKMVgxap2k5wkvtsuzyUpG7t16dUnt8hsP1pPbtbS+uoR3jjBihbudkkDIohIp4/mgEu7P9fWHytebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuammI0U1L4uQqr8E7NgcLbCD/8PBx6Gq02ZllYhKEo=;
 b=dSWbkUchXPvb/QCt/Qbvv/wqDwUqZprmmlx00ZnfGVvYjBOD1/aGUGI9CxDWahnF9xHr43qphN28ORrWg+n/TrtHLYhKZC6XFxrLjpEnVtOCaccTt4vWtRReYohvquDnQmpj64v200REfo6tgyO9419CiaRNb2ZSXVJERxlnJpRHJ9+EB1CAMjCqej8ySriQmqcuog1S1a4KmVOl1RKobUP80aL60wZHoFYWDjY0f4oqNOt8ioyV9txGHzDDC+Yi3epDHyzuQXozugtx1+PRvhcCOJMtMXJD4PJIvE4o02USxth0yKQLPA2a/Bf8iBpZzzUWSrjstegWF9hIt5DCwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 16:43:25 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 16:43:25 +0000
Date: Wed, 10 Jul 2024 09:43:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe: msix support for hw engines
Message-ID: <Zo66K6Fv6w7f9SMY@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-9-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-9-dliberman@habana.ai>
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 301cbd8b-400d-44a3-a738-08dca0ff6ad1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NKJzNQKnuMrv0tTYEbES5Bn2PZLhahMI37sW5q5eeRI4hXlx/sGpW2fu7ydW?=
 =?us-ascii?Q?bqsnXiqRVymPFhQeGuRtd2uw+pn4XlYA069Ur1HqkWka2RfqlTFceR9vHeEm?=
 =?us-ascii?Q?pkyleGYQ9e98QvGeH8s88tcXjnmZ92ru8uHtq5dOUuv53Gp47YFWA5r/6C3z?=
 =?us-ascii?Q?HQTHV35oN1tkHESLHisH+9I1/196DfMpP+6EhYhcD42dVFO9AS5uOlQatXYU?=
 =?us-ascii?Q?KsKrcnZ4+9pYqaLfRRb7FyF1dIk5a9kCTJq2/mwv7iCMhp8lgEmRJ4KBxUHS?=
 =?us-ascii?Q?04WXKYRQ9QMV/Mvzo8F36uNr4O0gj1vyxnUuyHSt0ewgr7JrWpIAbNUsyMTN?=
 =?us-ascii?Q?utxjBOx8uLiKEsbXIDjiXy2/kuAGztrzqg7F7uMRXkGQY4+LCdA79CUAHY+d?=
 =?us-ascii?Q?3RXQGCMQKRLMixgyr6S2651JyrsgRvf01YXskMZcxgpSvlxBcyPSGIVTNxXc?=
 =?us-ascii?Q?6T5lFPM8zhMsw+L5KVKln+Ou+EpW0zz/EWmlPbe6+CZ3u46ykmZWR0HBMzut?=
 =?us-ascii?Q?tB4ej/3RrM8zg8lE1CKHZDT3VDivyYxreFmgHNfIpxumfyJUrQbBFJBl6yfX?=
 =?us-ascii?Q?Y4Zgg52mIH/MiTbOrwJJIZXKWpxLQl5Z6qhbmpBdl7NPKj+8SmQBXGUtVOPB?=
 =?us-ascii?Q?+B3ePLesTyOM2rHPRvUudFRyTA7d6nrL6g0lN3fdF2QcEcqy833RYIJ9Df/n?=
 =?us-ascii?Q?FAsaWV5iBbNaLmMgw1Flq4RCzQElMHPNgds6CHu7Jd3/s444K24S3VxxKcU2?=
 =?us-ascii?Q?vjrMKv2qAgF3w81gZxU5TQurdUoXbIUeB/r0FwlamQfISVmzHxuYwyKgcsP1?=
 =?us-ascii?Q?XqUhmqwTiTM6Ui+WX52hItD7mBx+Q/cxVwATiR20ThHTlJYv0kwo2ivmp2rl?=
 =?us-ascii?Q?Bn4EKjK0C040HMZZz1/qBeIBMndTelGrzjohmPhyn/zt9PI+SYuw/rkXTPve?=
 =?us-ascii?Q?mCYi8VXFeg92lV3i4mOKqggmZazF2mRP3kwP7oLOedAA7JpZa8q43t+17Dz+?=
 =?us-ascii?Q?s6qE9lpivIu9v8mbWEnjkjy6uHjis2Uqmk4JvtQ1VtdR359EI2zRFud9E/fm?=
 =?us-ascii?Q?NhXptEHGNqE8Ic9Nlj29cQrZz5B9SQl8w2w9Z41XDOc8dsaJHanHo8AVrlj4?=
 =?us-ascii?Q?ysMhO3gzg0PmkHpsM4wBHmYFMSZ8Mkpi9sLoo4tX8U1NaqevV2tZLoEsaMWI?=
 =?us-ascii?Q?kiBwIPtfI09H+xqG/Fb+2WvTWwNJouDVM4Tstgy2lNHFYvlDSopno5jO9xys?=
 =?us-ascii?Q?IJTDg0YJYqzHjx5cIPUeb9WGiCU7dHgO4phqEn1kF2BlYbBlIHhh53QfLu+H?=
 =?us-ascii?Q?ayrf42KsEMbg+ufbBqFQ7AXOD5IrSljcHG/SzhntK6bCMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+P82ukz0q/wJGDzqCS5O1TEvI63wgCNXiBfwMO83ej7hqjoEQqqHIfx62lIc?=
 =?us-ascii?Q?2ImeW67fp+jEQd/Vf8fkzUZ8Am1Wn1l9BxKgIa8a+M+9cwAzDLA9MaptA3uc?=
 =?us-ascii?Q?97bL7C82fgPVP+Ak+B1r38QdvvQMnFmmbjWrSIcwFqdP64zcTTa8fNJhsTMu?=
 =?us-ascii?Q?eddzme4WBeFRNrx1SKuUGabtLQFA6tKdgt8rD1+Z5qAASGB9SwVkLuSEVgVf?=
 =?us-ascii?Q?jEWsYBNHlEn/0nYOUlPjeyV+rB6e/3AWGI25GeBFh9ERct39qiPpdrOLhErq?=
 =?us-ascii?Q?ln2b1AZYuS3WmLURLysJPAb0hUXJwXwx49Hn8Sv+ykUtqM6d7hmIgK+h97uH?=
 =?us-ascii?Q?rYrcxJUge5D0QqkAUxs21QAHjoh+jb87akSKMs9N/Dj1mi4kE1AxwbW6wOP5?=
 =?us-ascii?Q?4oJhyD+LUeW8qatcO9ajuJB6OEI4oxw9Xku0C+XhevFpXMKJcADfqfAF4N+T?=
 =?us-ascii?Q?iY4TSzQrH1A7vDGbjyGIe0FJmk0rOXjuo7/9fhcqLDM8a7s4YGUbLLIfWQDl?=
 =?us-ascii?Q?FDG59DipfCWP4huauFVR0T551ty4Mrl+AyzTyCo/5yG6S5T1XQHf4nkiREZ1?=
 =?us-ascii?Q?FX4EAMVLKiIWaLsjrRoBiaO7AAtBQTA6v6r6gKiip2uIjs+3E5hEgQuzivJR?=
 =?us-ascii?Q?dQug0uq+JjCcYzRjXM3cLdZ1Ov2tArTMKapTnggAm/sLSKCBt1T3/oBrTCvI?=
 =?us-ascii?Q?qUiL83FhrfBtCYhYaga/+4RaIM8cjcxK7ECuomH4cCxU7BOxM+8u6QpPA45F?=
 =?us-ascii?Q?bRHfEiULnxR2TFNQ7q0iiL44NOjiv+sUb88aj2Mteh+twiYx592WkgoC3c73?=
 =?us-ascii?Q?0EDO5RtsAvCLPjpDde960qP7CFA3AuFs9Z8aEl7KnelMuF14EcCdelFBfB27?=
 =?us-ascii?Q?a4ktEYUKCxNTjblRopHDPQonNlhA3XMnzCqCWkrf0/wpO9ma6BbSkietr6se?=
 =?us-ascii?Q?+pJ48cYnfmCx0MUCqBOx4vW6REC8nA5Dr/TtKVzQemYkls86bYgNu1Z7ydpj?=
 =?us-ascii?Q?6FC0zxwE2s60V5Cg08I9xRa6b95DNDQUqUo0PaO09AgMSa7OZM0JfxSo8jF8?=
 =?us-ascii?Q?e7n0ay2sKRA5iYOjbdmoRWW0QpJSwwD6VF/Z7jYlJ81rZavmtlt/LQ2ULUsd?=
 =?us-ascii?Q?Hq8sugCwBZTsdHEhn91gYH20k36jWrH3xlaVvx0nabXhRKRGxkpYhjraX8ih?=
 =?us-ascii?Q?swUL1sgkKPuL2AyQ6RynzVnFfiMNULo4CrAUwAqr1oW/kXMha9vPAZ37DnLT?=
 =?us-ascii?Q?Lh/Sff6rji0GVEEz/wDCZ7Xi0IOiC6RxLo6pBfRsgY4zvvHSd9kNfaUKbdmd?=
 =?us-ascii?Q?qhn+gUfw+iiTa7m/12kwJEzZTkWkiSpSJ/gbKZEgVldHJDZUH4KLylLYFucL?=
 =?us-ascii?Q?9LDWTrFVqx0KxT89WnoOQHB7oGPEaqzwjKojp3aE/EskHp0F6q8j9RhEv0rV?=
 =?us-ascii?Q?b0hCU7TBXwzTPLQLt3kHAb7U0Y2kyfQJ1O5LZD1rpbpExKnlXUT+bFTBZewy?=
 =?us-ascii?Q?lIOdU1ERNer3hOmt2nVtLvhKFLENBqj/PZSYaK7RQAF5RnloU39UZVjUq/8/?=
 =?us-ascii?Q?TC6SozPCj+5FxCnoR6z67I3GE5+K8iM1cDyzlswdRF5KfqiEh4iBTEJsw6KF?=
 =?us-ascii?Q?SqtY5ylMOOGuFxHmZsfjL8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 301cbd8b-400d-44a3-a738-08dca0ff6ad1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 16:43:25.0328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2zKH07KGp/fFHYQvHq9Ahr1RE1nezLuStBqR0wZAmLS/7HE+isd55SSymbr55xlA5hGVFg4UcjnYYf1Tpd2UEgUBZI36WAg+1AJNYyLJVuZmdhds8qJVQQ1hklZGhPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Thu, Jun 27, 2024 at 03:40:43PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>For devices that support MSIX, we would like to be able to configure
>the hw engines to work with MSIX. This patch allocates MSIX vectors
>for exec queues (via MSIX allocator), registers a handler and
>programs the lrc the same way vf does it (using memirq). An
>additional field added to the lrc is CS_INT_VEC.
>
>MSIX vector 0 is used for GuC-to-host interrupt.
>
>bspec: 60342, 72547
>
>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 ++
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 ++
> drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
> drivers/gpu/drm/xe/xe_execlist.c         | 12 +++++--
> drivers/gpu/drm/xe/xe_execlist_types.h   |  1 +
> drivers/gpu/drm/xe/xe_hw_engine.c        |  7 ++--
> drivers/gpu/drm/xe/xe_irq.c              | 42 ++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_lrc.c              | 22 ++++++++++---
> drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
> 9 files changed, 80 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index c38db2a74614..4c9e4f467e64 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -83,6 +83,8 @@
> #define RING_IMR(base)				XE_REG((base) + 0xa8)
> #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
>
>+#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
>+
> #define RING_EIR(base)				XE_REG((base) + 0xb0)
> #define RING_EMR(base)				XE_REG((base) + 0xb4)
> #define RING_ESR(base)				XE_REG((base) + 0xb8)
>@@ -137,6 +139,7 @@
>
> #define RING_MODE(base)				XE_REG((base) + 0x29c)
> #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>+#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>
> #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 045dfd09db99..9b3eafd2bdc4 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -25,6 +25,9 @@
> #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
> #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
>
>+#define CTX_CS_INT_VEC_REG		0x5a
>+#define CTX_CS_INT_VEC_DATA		(0x5a + 1)
>+
> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index e40c5380e292..8b709968ec56 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -143,7 +143,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> 	int i, err;
>
> 	for (i = 0; i < q->width; ++i) {
>-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
>+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_number);
> 		if (IS_ERR(q->lrc[i])) {
> 			err = PTR_ERR(q->lrc[i]);
> 			goto err_lrc;
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 354f85b591b1..858a77c83b5c 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -17,6 +17,7 @@
> #include "xe_exec_queue.h"
> #include "xe_gt.h"
> #include "xe_hw_fence.h"
>+#include "xe_irq.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
> #include "xe_mmio.h"
>@@ -254,7 +255,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
> {
> 	struct drm_device *drm = &xe->drm;
> 	struct xe_execlist_port *port;
>-	int i;
>+	int i, err;
>
> 	port = drmm_kzalloc(drm, sizeof(*port), GFP_KERNEL);
> 	if (!port)
>@@ -262,7 +263,14 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>
> 	port->hwe = hwe;
>
>-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
>+	if (xe_device_has_msix(xe)) {
>+		err = xe_request_irq(xe, xe_irq_hwe_handler, hwe,
>+				     hwe->name, true, &port->msix_number);
>+		if (err)
>+			return ERR_PTR(err);
>+	}
>+
>+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, port->msix_number);

Where is this port->msix_number set?

> 	if (IS_ERR(port->lrc))
> 		return ERR_PTR(PTR_ERR(port->lrc));
>
>diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
>index 415140936f11..bbb05310368e 100644
>--- a/drivers/gpu/drm/xe/xe_execlist_types.h
>+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
>@@ -23,6 +23,7 @@ struct xe_execlist_port {
> 	struct list_head active[XE_EXEC_QUEUE_PRIORITY_COUNT];
>
> 	u32 last_ctx_id;
>+	u32 msix_number;
>
> 	struct xe_execlist_exec_queue *running_exl;
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 90660d9382a0..667393d70d6d 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -298,16 +298,19 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
> {
> 	u32 ccs_mask =
> 		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>
> 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> 		xe_mmio_write32(hwe->gt, RCU_MODE,
> 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>
>+	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
>+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
>+
> 	hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> 	hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> 			       xe_bo_ggtt_addr(hwe->hwsp));
>-	hw_engine_mmio_write32(hwe, RING_MODE(0),
>-			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>+	hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
> 	hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
> 			       _MASKED_BIT_DISABLE(STOP_RING));
> 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 24e8445b2a76..62ed569bfcc7 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -11,6 +11,7 @@
>
> #include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_guc_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_device.h"
> #include "xe_drv.h"
>@@ -31,6 +32,7 @@
> #define IER(offset)				XE_REG(offset + 0xc)
>
> enum static_msix_allocations {
>+	GUC2HOST_MSIX = 0,
> 	NUM_OF_STATIC_MSIX,
> };
>
>@@ -686,6 +688,13 @@ static void xe_irq_msi_free(struct xe_device *xe)
>
> static void xe_irq_msix_free(struct xe_device *xe)
> {
>+	unsigned long idx;
>+	u32 *dummy;
>+
>+	xa_for_each(&xe->irq.msix_indexes, idx, dummy)
>+		xe_free_irq(xe, idx);
>+
>+	xa_destroy(&xe->irq.msix_indexes);
> }
>
> static void xe_irq_free(struct xe_device *xe)
>@@ -731,8 +740,31 @@ static int xe_irq_msi_request(struct xe_device *xe)
> 	return 0;
> }
>
>+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
>+{
>+	struct xe_device *xe = arg;
>+	struct xe_tile *tile;
>+	u8 id;
>+
>+	for_each_tile(tile, xe, id)
>+		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
>+				   GUC_INTR_GUC2HOST);
>+
>+	return IRQ_HANDLED;
>+}
>+
> static int xe_irq_msix_request(struct xe_device *xe)
> {
>+	int err;
>+	u32 msix = GUC2HOST_MSIX;
>+
>+	err = xe_request_irq(xe, guc2host_irq_handler, xe, DRIVER_NAME,
>+			     false, &msix);
>+	if (err) {
>+		drm_err(&xe->drm, "Failed to request MSIX IRQ %d\n", err);
>+		return err;
>+	}

Why only one g2h interrupt? Possible to have separate g2h interrupt
for each tile?

>+
> 	return 0;
> }
>
>@@ -798,12 +830,16 @@ int xe_irq_install(struct xe_device *xe)
>
> static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> {
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	unsigned long msix_irq;
>+	u32 *dummy;
>+
>+	xa_for_each(&xe->irq.msix_indexes, msix_irq, dummy)
>+		synchronize_irq(pci_irq_vector(pdev, msix_irq));
> }
>
> void xe_irq_suspend(struct xe_device *xe)
> {
>-	int irq = to_pci_dev(xe->drm.dev)->irq;
>-
> 	spin_lock_irq(&xe->irq.lock);
> 	xe->irq.enabled = false; /* no new irqs */
> 	spin_unlock_irq(&xe->irq.lock);
>@@ -812,7 +848,7 @@ void xe_irq_suspend(struct xe_device *xe)
> 	if (xe->irq.msix_enabled)
> 		xe_irq_msix_synchronize_irq(xe);
> 	else
>-		synchronize_irq(irq);
>+		synchronize_irq(pci_irq_vector(to_pci_dev(xe->drm.dev), 0));
>
> 	xe_irq_reset(xe); /* turn irqs off */
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 838609915916..575b4833be84 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -598,8 +598,9 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> {
> 	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
> 	struct xe_device *xe = gt_to_xe(hwe->gt);
>+	u8 num_regs;
>
>-	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
>+	if (!xe_device_needs_memirq(xe))
> 		return;
>
> 	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
>@@ -607,12 +608,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> 	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
> 	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
>
>-	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
>+	num_regs = xe_device_has_msix(xe) ? 3 : 2;
>+	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
> 				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
> 	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
> 	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
> 	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
> 	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
>+
>+	if (xe_device_has_msix(xe)) {
>+		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
>+		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
>+	}
> }
>
> static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
>@@ -890,7 +897,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>
> static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>-		       struct xe_vm *vm, u32 ring_size)
>+		       struct xe_vm *vm, u32 ring_size, u32 msix)
> {
> 	struct xe_gt *gt = hwe->gt;
> 	struct xe_tile *tile = gt_to_tile(gt);
>@@ -959,6 +966,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> 	}
>
>+	if (xe_device_has_msix(xe)) {
>+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix);
>+	}
>+

Looks like upper 16bits of CTX_CS_INT_VEC_DATA is a different field than lower 16.
What should be the value for upper 16 bit? Shouls msix variable (here and elsewhere)
should be u16 then?

Niranjana

> 	if (xe_gt_has_indirect_ring_state(gt)) {
> 		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
> 				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
>@@ -1019,6 +1030,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  * @hwe: Hardware Engine
>  * @vm: The VM (address space)
>  * @ring_size: LRC ring size
>+ * @msix: MSI-X vector (used only for MSI-X capable devices)
>  *
>  * Allocate and initialize the Logical Ring Context (LRC).
>  *
>@@ -1026,7 +1038,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  * upon failure.
>  */
> struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>-			     u32 ring_size)
>+			     u32 ring_size, u32 msix)
> {
> 	struct xe_lrc *lrc;
> 	int err;
>@@ -1035,7 +1047,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> 	if (!lrc)
> 		return ERR_PTR(-ENOMEM);
>
>-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
>+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
> 	if (err) {
> 		kfree(lrc);
> 		return ERR_PTR(err);
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index c24542e89318..1eded8919d73 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -23,7 +23,7 @@ struct xe_vm;
> #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>
> struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>-			     u32 ring_size);
>+			     u32 ring_size, u32 msix);
> void xe_lrc_destroy(struct kref *ref);
>
> /**
>-- 
>2.34.1
>
