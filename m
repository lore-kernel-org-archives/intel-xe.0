Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E100DEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 17:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A377C10E78B;
	Tue, 10 Sep 2024 17:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cv2xmrad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1210E78B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725989054; x=1757525054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JrZZxnA+P4QJpL6BhsGJCOsscE69dPE1qKnk4AjKeII=;
 b=Cv2xmradgvz53wUfMeMMyMYbjTHxxpUDoM7Kik3VfYiyYd1MaA3NVFw6
 8qeeFA8IY6X2HIfNr1GRKlyA8wOiFBDto13ZTTKhPn3fUXWC/FEd/Qy7G
 fY7EG8mpqj9KXJyBY6IfQIqMQs+lElassuu1UQkMo7qZ/VLVD4cepDSHI
 FDgGJui4j9e9Nl9Rmz/OPr1Pc1+Rl6nmF1xGpyXlgP8PRluNk7oYhpjFK
 LaID1oNnnD5URjzx6/gV2jUZIA1zrl7lVLzAwkfmA73+ZPJIiBflqse3G
 lwFF3STJinmXMiyg+efdhQ6WHrcg8A25MJo0lSVUvIxjMbrR8qJcv9xMk g==;
X-CSE-ConnectionGUID: cXHcHntPSHOpgKOZX33aEg==
X-CSE-MsgGUID: y4Eh7kuTTd2opfljOahFSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24913523"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24913523"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 10:23:49 -0700
X-CSE-ConnectionGUID: CWmUNh5WRK+DrZ8RwLOEeg==
X-CSE-MsgGUID: AcKPjiocTVWP+Q63f9H9SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67396960"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 10:23:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:23:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:23:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 10:23:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 10:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7Pmc7/qdz9QYkqK2G13I/30tuQTF/2ktq7EJGXcq2eynzNstudT3pPNeoGu2WfgUibTUFXdRCOWaLKMJyd/p8DhmL8mRnwQ+FQdzNAXTsYH7x7Gk/4+2IGofjwmkyPVnch6dXiEVvS5Ld1+1Sf/vxw5f39tDBXFHM4UQLC1zzd2PsK60TNxMG936Y0ShRJGWJtZmDoNBJXB/dYuMMqC7faMnqHqmmEys8TzSM/HTGN0R4LxL8kM+9V9fbQ3enrfDOYwqWdZPZHCU5+eg/UO9Fby6qaB/2POn/QxJ8xiX6OZVW69//Pfk7ll1km2sk50paEIZJg1+/4YzsVctDi9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYG6t1dKPBk/vrvwHFwQ2fB6WACzOU5fnkKK0WkzEJA=;
 b=XIeIAUSLcRpwx2hwmbnWyqgI1Ihga+4hKXeWZrr6kYC++J5QUKjBEFo75xCJ5VoQrWnt33L65ITOqzjWwy9KhA9A+0mf/4Xm2ToGh/k4FfRiy+HtBTxgm/xGUEXtgooVz8Veri5fNEb1757d6z0O7mhQKThdyxct4DFVb54CWzxMVS5RKKsbuGQWqhtpR+Hzqwi6NX/OB5GXzQhHAxDF7F9+2Onno9JAWqWlA01LzmdtHCizoz+uWIGl0+kIRl4sRds94qwdfjRVkjPS+N/hQvSjAj3itzUP+FwhZyCuLJ0pS3vtGSDKSUpkOV8wELC0tg6WhRgyKwTY03FAXmStbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 17:23:45 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 17:23:45 +0000
Date: Tue, 10 Sep 2024 13:23:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_idle: Fix name conflict
Message-ID: <ZuCAnYNYC8_ICcKC@intel.com>
References: <20240910142837.636680-1-riana.tauro@intel.com>
 <ZuBdM3qnzcZM_uNK@intel.com>
 <ZuBdll8hFS1bElT6@DUT025-TGLU.fm.intel.com>
 <0732e0c6-d3d1-4886-ba76-11995ca4554b@intel.com>
 <yc4ftt3mt5pvah6kgr2kkq2rv3pf6s7swi3uqp77nd3tyzxloj@fpjowiwgpjxt>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <yc4ftt3mt5pvah6kgr2kkq2rv3pf6s7swi3uqp77nd3tyzxloj@fpjowiwgpjxt>
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ceac067-9387-4b31-9efc-08dcd1bd5311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7INQfylCHubAutepXPZtgtT1Y+SuPkL/oaM6otAtxupJTbpWHCstgtgkq3T6?=
 =?us-ascii?Q?DkGEP1AeaGZG3U3PlwVh+l13lOUXGtEAAEnCaXMbkeiMhiqiFrcpubOliDR5?=
 =?us-ascii?Q?WWPlzjW9NJJJTjzNzyS47mwXNpA7u7EQ6KkmLxVIBuvPF1/pkyUpfudIkuSv?=
 =?us-ascii?Q?3gxsm9aI93uCXHbDwPXDpW6wkl/IDDHttsdM7AuShrOuDNGH65DzUPpvgEH5?=
 =?us-ascii?Q?jDEyaKBodL6UEp/5MPF9wOerlKOYI45+yRA6NY9hgxzkkfu1rEufPO/bHk8B?=
 =?us-ascii?Q?Ouh25IFy+EEnBK/9SY7AbdyfbLlLhN7C93a5hxdBbc6C5YoR0toebG6TagB/?=
 =?us-ascii?Q?tbZUSCuGA290fb/5QEmjawGDQmp3O8bSKvjAfcZTtJ3yh2m69kEaj+wBuNBE?=
 =?us-ascii?Q?2o97OB1q3XB6sDik+yWbz0b0FZSGViKpyoBmXFRIvUmjAThUCwANMfzM2RxW?=
 =?us-ascii?Q?VoK9WoiQzK/KUqdViBM6YFP9UCKDGqnvKdHMlp7E6LlvJdW/H7+PxerwlQHa?=
 =?us-ascii?Q?NHPu1nUnKLMKwm8VZAl/JIgdSsShrTaOQWu8mT60zln5EBPLq9xInVGpX71i?=
 =?us-ascii?Q?1c86jmGhtepdXhf7HxHFFy8Hc8nLGTMVw7cCX3HA/g2IvIhDCvoVIEkJZdkV?=
 =?us-ascii?Q?v9K1DOyIyaOUOxVBfiKNhJIA5R1PNU56oGhSBIW4ULCG5Spk+Bz6qN0lffvO?=
 =?us-ascii?Q?v2zAVyMLTrSwVScIcfmijZG210QzGUdLX2EXaj5VT0VWas2H7p6o+/2epNTJ?=
 =?us-ascii?Q?iY/yntP5bZQ00590DPgj/VBquD4LPftKYtWzYCALYXoS4syoIhEmB/UHDoco?=
 =?us-ascii?Q?9exQyfOb4Rv86efBzFngBHx6ZSEcQzFiODmqVlZjCs+uaR/T/6GO3Iz8P+I6?=
 =?us-ascii?Q?fh+lF7lDbglwy6SO9t/eOeRLx9o4+eEcwcjlR52heBseKv4mC/5YffbkBaOg?=
 =?us-ascii?Q?O5+p1FV1nJIE1+0dNUv8y3rQqkVezqxcHYXPdFfvI92N+ghTxAoh9lA5tFEd?=
 =?us-ascii?Q?nQvoEkT96jOnLlEVn6lWT5TRTrPwb1MN/VlSY7TcRNyMQectvISFD2Uzk4bE?=
 =?us-ascii?Q?T4dvIw8XJY2saEwUHftQ4jvraNtOPB4okNhtFAWcNnDxreG+LB+9sXUfp+wN?=
 =?us-ascii?Q?Gf7FJS2SKC36Y/jyuhCGynEpKA/xEbaNd72kzpg50E/D2JU1hE10L2rRP6Jw?=
 =?us-ascii?Q?cYX2+0/vuaUwibFLpW16nWtZq8XkC0zbOfKWW2ySktHviwVkSKc9YktFKRcn?=
 =?us-ascii?Q?y5TZd+JMHCyMNQQSuCOEWoEN3ms+oVUzX01g1ui1o7H5guEr4YfH78/B0Xo0?=
 =?us-ascii?Q?S0s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ffVkBM9HRVdfFbQgpDddtPxzM2tCOAL/FXqOKl84Tzuz78EJbFo11JEMqBDb?=
 =?us-ascii?Q?ZCtiCJtWe81caBHDx8gsPHvs1Z2ZAeqNR+J8HaGxZB6zHPfYNczCtHdL19yD?=
 =?us-ascii?Q?jwpsc3rq+QR0eSy8/G2m2TKrs05E6eNwHUeo7XsarLSWdDdrfBc09w7bpQ7U?=
 =?us-ascii?Q?LbSt8SGloY4OYU0jgIHk9EZMOVeWnOpsvx2DHatwka5mIkU6XcfR77kLeRaG?=
 =?us-ascii?Q?wq5VrCV9eLnKca3A7aLIjlMSnD85m2Gw2pY3FB00644zifZeICI66ptmuxot?=
 =?us-ascii?Q?amWJbK+z54I/4+NUJsCtjoevZS8JgakJFScqndoMgbzqblFnsehP9Kw2+Otp?=
 =?us-ascii?Q?A/F8p2epdqkR2+3MWRBATQZcM0n2NCnsod9B/D8uPyOWLbkYYfxg1WGslvLv?=
 =?us-ascii?Q?XURaQr0YVLYaVHFroXvHkfzuiRe3b+xV2Q1zQfc3EwqnSpEsP/e/FLE7wrUJ?=
 =?us-ascii?Q?4aV2ky++kcRj3YGVnqlVkhqkJS9j0jWQ4IoTdrxWgWJouSNY/VODJsPYpVvg?=
 =?us-ascii?Q?gsQMYSicl88h/voz6Kc0N6GdRj+Q1WwV2RFmYmWYtJ7g5gBJG4zhXFxOap8K?=
 =?us-ascii?Q?9SqrzW3VE2VBCAqYgcx+Lz0azU8fOyDQJekK4WlWnv3ru0EYSiwHmsN//+ZO?=
 =?us-ascii?Q?qsPYn83S5AarwRAH6gugdqveFdyANsJVTdUPJIUihTsRLl5qPcFqmuetwQJQ?=
 =?us-ascii?Q?tF0K/YNOj8rgBNG/hhRMIx0JQkLrOA4r2azLpdjWtiJkcQYo/K8hpiE+63PJ?=
 =?us-ascii?Q?zHU0byHfmknhNuupkVNZ/E/UN6+Zl6FsTLqtn/sUhhS3yTifi2V82QIzD5Fa?=
 =?us-ascii?Q?fFrJCSFDPgP9K/ZtRrGJuIs/qrtN4h2ItVAxM9At9bHGkOsO/205jvyk/jys?=
 =?us-ascii?Q?5F0so8jQtFY4vwWnwi8tmq8/J4AhMtcqhjgqV8BDGotv8MzSSg0mcLFX8nDf?=
 =?us-ascii?Q?Q/Sq7vFy/SDkZs9ClbJDf/RE1isetLNly9VlnwRfJWa4gzJmXJpLO3LxxIWg?=
 =?us-ascii?Q?c3Fa2LI/8K/TZiO63MK9V4N03HfUDXDJ9AhKihqGBZ2vc9iYHhluy+p8mu+J?=
 =?us-ascii?Q?GdAxhz6Sio77WqoS5KwaBfLOsz+uo7+LrRiQmm3kLcJ8V0ybyRWRbwbRbaVD?=
 =?us-ascii?Q?kMdOSEyaGTrLRjxxwc4MNP2JPI88+ll5hPyKpLbyEFA6mEQa04c1mocGH5fi?=
 =?us-ascii?Q?IPWbfKKKVZKEq08Sh7UCNM+yFTZ0BYmuDyM4l8sZEN65jrq5SClKXxNg/PBi?=
 =?us-ascii?Q?snAop4VcLyGCEQr8Z85W+HoXw/iIebx5CVtVoES87jSVua2imHqmQLp6FIiQ?=
 =?us-ascii?Q?eL/CLm2Z7jrNzvwICU94tvggdPBAqxIJ2vg0qApesrrJthtZ5K18YenxI7eQ?=
 =?us-ascii?Q?h2GYHOtrN+2CvDGtb6uXwwgee33OfqTi+2Sh3U225p14kolWEj9psiOrakYo?=
 =?us-ascii?Q?Zziv5pVtXu2Qnf1f++foRyQ7KxTa3n5WX8DcJ4ZJjLuy7kvmVT4FzQ9NBD+U?=
 =?us-ascii?Q?93B3QrXSb1KeRY1le8xWO9+NRkjdNpI+k/ULa841bxythq22vkaX3u9HHFht?=
 =?us-ascii?Q?3rLXvy6mLbX6UXwwok4P8fBkc2isztiM4jdp2iRMPG4kGC0TdUTK0BsHiTho?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ceac067-9387-4b31-9efc-08dcd1bd5311
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:23:45.4294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXOA8BGqnUT9d/ESvAGgYXtjRCFeykR+B2E71N7iRuH3YnZ7vrvEMd/PzN6IGHicte5F7PcO+Li3pUqubtv4Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
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

On Tue, Sep 10, 2024 at 11:48:20AM -0500, Lucas De Marchi wrote:
> On Tue, Sep 10, 2024 at 09:55:23PM GMT, Riana Tauro wrote:
> > Hi Rodrigo/ Matthew
> > 
> > There was an error when this change was merged to linux-next
> > https://lore.kernel.org/r/20240909195939.067c1c13@canb.auug.org.au
> > 
> > The conflict was because the below commit
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=3ff37dbb1ae9926d3b51749f7d0d3f474fe2440b
> > 
> > Jani suggested to rename or remove it in
> > https://patchwork.freedesktop.org/patch/612760/?series=136477&rev=5.
> > 
> > Removed it for now, will add it once the commit is in the tree
> 
> I think this should just be solved as normal merge conflict.
> 
> It's already solved in linux-next with the right conflict resolution,
> which is to drop the local helper from drivers/gpu/drm/xe/xe_gt_idle.c
> and just use the helper from include/linux/string_choices.h.
> No need to drop it here and then eventually bringing the same change
> back.

Well, indeed. Since the function is exactly the same let's just do it.

> 
> Lucas De Marchi
