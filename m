Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433B510F6FB5
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 14:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33E10EC7D;
	Wed,  1 Apr 2026 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+jmND+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDEE10ECD9
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775054801; x=1806590801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uq1Ic6iqr/hly2ZHgfLdAX3EIaxPhyFioP03/TGUYq4=;
 b=L+jmND+mUUcD9TQXaKYTbfJkdkGTWHD5fUcoMcbxwUFWxi7ix4luHYVh
 isiq/1yMiJ68+o6j/H4uZAD6fzDWp9qgHi08zg1iCDmMLV3D63veOR7jA
 USi1+P1GHxW6FQ1eJAUCW6hlwZK6PF6S/ZuvaJM3fR9lPVLLRC0837Z0y
 3Vyxg2ixwJpgwhxK6zmbdPxojVJwTtXiqhFgMn00dMV3N8NRj5MC7aFkd
 rhWm1a8z4U2Z0jH2sZVoBpBX8C0GdGCbR9WIQvuuS1wFhmQlxSgd0+Vqj
 epHTzskJYtxKTYy28VcNUBHqTrDonk4FjU7dHdbTZHA5joWvdbXFdy9y6 g==;
X-CSE-ConnectionGUID: c39vIYjyQIeimwZ7CsLsEA==
X-CSE-MsgGUID: aK6+n/K6Q2iiAo/4advcig==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79982982"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79982982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 07:46:41 -0700
X-CSE-ConnectionGUID: 48mNCvZKSVKlTCfr7eR9bQ==
X-CSE-MsgGUID: 9EIJHIl6TVarBfxGftmKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223826747"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 07:46:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 07:46:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 07:46:39 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 07:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Om+0sUTFIq5ovoM5Faq+XvUowF42FoefSuldreTDPxlMfq7Ad7X9TWj0jZq5i2CrVLa23UIc4TXXPrO1zO9Igb5u27rpxmWqdoDEjnnd2smdNcNHjWiHWIsEZ9jgQV27P2+qffE4ON7OD2eN28yIzcl1el1fP+DgVb4QrQWehj0H6n43Yi7NQaoLZqipJib+LEfpdK+1y/8uKnGcspay/CMwlp1+fWVfNlzYNEH46ZgyrGAMhnc8ViKppKCafH4DQBW31+xACghJX4YSjdaboqp/D4sGrintNjFsT+Y5zfpU81PkQ2pSLlzJg8W9qGtGbbl2Akrst7MIlPDSpKG49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfVTY5sLRWyS2rwYkQ0UaHb09zYo68hP9ZFU7miETxo=;
 b=XO2kFxxPlADGqULW6bIzYS8iLV7uggB7SugC3qBPV+GTuqa0xc4o2S4ijoEgI0nEEltIEmRUySv0kwxndx6wxF6Y7scb0kTFCuMpt9ZXvz1cEFEVE1WtmWMURZzJJD2oaCKhd4qtHeZvWTQRAaoOF1yqKoOBOjlLVMhvPCGcYRy2CbotaTuxX4+vGUCt69m09akN+tKvYttrB6fKYlKIkuNNXZSSM1cGMu3Fc9acA14x5z51adUakLixmko8rC31TdUMTO0JoH5jUWIUXuxUXq1RbsJOMZMXghRM+xV7uoBD87EswsHH/BtDqGGHSCeCzXD3JRGkqvQlRJK+uuZttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:46:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 14:46:35 +0000
Date: Wed, 1 Apr 2026 07:46:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 12/15] drm/xe/uapi: Add access counter parameter extension
 for exec queue
Message-ID: <ac0vyICB0GIsteSi@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-13-himal.prasad.ghimiray@intel.com>
 <acKevKB0mEbwGLqH@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <acKevKB0mEbwGLqH@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a76c25-d224-4f69-1bd5-08de8ffd791d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: qEd5N0Ftlr6VA/6CNFbBF2DlRisfyiRqflytnCSw1axPaiRuJ9aV/EAsJlWxeeebR3vH0vI1iXGE8itr2UbPccBj6j389EoMHVHp8dvmMc42bs4tOClgF68IhPQcm3dz62STxCUnBbuMA4pVCKB8Y8kO0AqToBnGkN18E7VWbsQvF0NVumyqdO2509YzOk8Lw6EGma+OilCeEpyi6dGYAr8sCoyv+QF2PgHGVpIqkLZ1NS2qGHUw8pbITLTIOBcPsbF/qatYjwpJbGigXU4Y07HWYIkIWoDZofMaoWzCEILy05bZndWBoU8i058QWjofxvzEnnmuHGILAuJhcPQCAy+kni5buXJ5m6Q8EUlYiBA6Mx1Ev+hdaJHgd/XUCCibQu9uq+4NeXqqewu4nUK6ZBIotw4Aa7YRYvvPTCtWCiPMXhtJrV6N9az3CKwo1ThE7rDMsCZCngLkJWoiNbHmmNLgaFC4z0ajaTCsCdGKMOikPfx2htPvqd7rz2u6SU2i9bp4mcdds0U5Y6lktTRlUX59oGpurhjEfFv2ZE3oQHl8N0VdP+kaQYhuAORg4VcWmGH6NajsRsYE7ulHiYIHVoqOBs55c64QhEeJVQ3mQ/DsyBy5xWLxeUMVkYUlOttOP0uFwCb9FZtisll0/HSb5QcJPWDsCTC0wh299YU3q/r47tjxAq7nGSZjpsmQdEzrOeUPC6/5DtEeWoit/aSva0F4NJDowEy1yo+CSOlhv/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k1JHYwrVr9rHuCF27CnCVN5AhK6JC5LWRftpCOAdthtvZsXtuvg8sxre/wr+?=
 =?us-ascii?Q?oLaUHkl9U+UFgieWQfMftHEv+3xp8268HOJuHWtOUBR18PpRcqIB4btHzIxr?=
 =?us-ascii?Q?77DACRmEpmObn2vylECjknd6FM2+w2pJRPABriJ1RtEwTeVy41y85Onj5Z7v?=
 =?us-ascii?Q?6mD6Eq4zuYlZRZDr2jKvk/E4sO63bj3garo+/QeTWB+wGzjrTmytPGyYkOQK?=
 =?us-ascii?Q?ue3HU0a4k85voDIA/1IgJYoh5LyIUnMbJmr9+uuTYljTwROU9hZ14BcQEZC4?=
 =?us-ascii?Q?7kWfj/D5EPK+Pz31djKhtMQ3CruJ3RPMPNJq4Met7bdvvLkxMtWlVHV7wywe?=
 =?us-ascii?Q?u25bDocAI5vtt+GaOzSQclMHZA5ZgwVs0gHFlHUZLAOJPL6AMi3U3dwbPuOJ?=
 =?us-ascii?Q?RlkMD+CZ00LOdZZokFTWOK92e4GndDY8kg1Gz7kwheHMq5oOgzYIFtJrChHe?=
 =?us-ascii?Q?RWQ16a3mR36fzZEmQssjNIxxK3q5feOJLryqd5aSoB2xUZ6mbuW/I1ozNbk7?=
 =?us-ascii?Q?AMc3DiZEkVwhDYCzskP9yzr3ZkSVdXCM/jkVvhqyQVQAvoc/zS5GLVG+tYQA?=
 =?us-ascii?Q?ERbEJwW7+Aq+kLeGbLHX4ViGTh1C1KNBrQ7r006G68I+s2LLhZr/5l42dgyH?=
 =?us-ascii?Q?pn0dp7nxRaRfP3leR2SjfYSWTOu0AXkyXbBw7I1IIooaVTGIMTVOR2lV84jR?=
 =?us-ascii?Q?vEE5/KyPE8K/UxG811Wgmf4g4Ir9s5htq/Wge4WlF5do451CjVrcgRTyKnOb?=
 =?us-ascii?Q?Eim4dR6omtLMkC/dAJqKXukDPX0oBNL3eBu5MOmdc6cBJqV9pCyjvoHnOvo8?=
 =?us-ascii?Q?89636D0AjbSEpkY0zpKzSfE2dW3PEsdAOjcD/q9nzNjLT7YGkLWDWwyHwBZO?=
 =?us-ascii?Q?3V+x3hG0KiTcm0w8iJOqHBAsCK+RNIwEh5FQDUYOCe9gLI8/Ie1v5eqSyYW8?=
 =?us-ascii?Q?ufPljV7/krszx1D4azd73yOSMLFGXz4orCAh2s5MXArYqiK2AbPZbq5htTNV?=
 =?us-ascii?Q?JEMZVh4dLsC2kK7S98KxnacMtP4S1LdNxdT3TxjqN2FNvBp0PyEAxAZwoZRi?=
 =?us-ascii?Q?Xf+JNaA828j3o42UDtVsZLvr7wa/5ftfdiXVJ+y38kOGJPU2bWSPdJt5Q1xl?=
 =?us-ascii?Q?ESQVdRtMDsE1vToZNN3FXMPEWbi1EA+/ax9OGR+6XViGi+l9UPgVpMosKuWF?=
 =?us-ascii?Q?1Db8CQO244hUcg4Pqhh/6+ergeNaPA4UNgeQTd501UCfuixsHPRqjbOaTJl1?=
 =?us-ascii?Q?YoVl+IasF7kYTclGqsuQ0Dfeb9pq/au70ral/XYtw8/ZyChjqQoozVH7W9oc?=
 =?us-ascii?Q?A0srjle4jueGQ1HQUz3HsQwDfkSTN29DFSmUJOUgmZiRdLGV6zbj3PfH45SJ?=
 =?us-ascii?Q?SieJTSwpA6TJ9tSaJl9cRge9PecPvNCCLivU2TJaMnrQIxgZd2OUDQHD9h2i?=
 =?us-ascii?Q?x0fBA8gjQ8mAA1RHpydZAizeSQunhnxB4uaPnXj1hq9AU6Dm+NLtwJDl9GoX?=
 =?us-ascii?Q?JkgHJ8XAoKQMWFJk/L3c1spnsdV3gKrr7F2uXFAmvQqcyEfh1oMuxJ6mX4+m?=
 =?us-ascii?Q?EIrkHuwcPAN9uzhcNqQZdLEA26PMqX1kuK5OTVNm/zw9J91jomIlS/G5lkm3?=
 =?us-ascii?Q?VEksOrsa7cFI3nfs/+k9xEX7+CajRqWwQJ3JAO+ylXWtaD4EGnIdiCLOD5lf?=
 =?us-ascii?Q?dcPopb1Xzbc48/HiuG+vHHe+hXZxPKvqR7LOtXmPAz2tuxyRlIIvqW0addAz?=
 =?us-ascii?Q?d0IzRpfIj4yUHCVeLaUKYrOIJh6OkFU=3D?=
X-Exchange-RoutingPolicyChecked: Gv/v7rTzo0FXg9FldVCioD/jL94OFHwBcwgRXRb2JUAcApLi9epDBRNUehdzs/OHb3FZiq9PIzCpR7GSZmWrq8lW+LG5eDWJ8WbWfbxg3cmhX30a1+bLZHojsBBqENSaXNaohHVjV1FQO8+P/mqqprl029K0gPffiR381WgXPguP6rKVm//wxDmdwGpUQG3AgaT0q2aIIDwtvmO5hQchukff3Iw9bugPq9s4n6O+BAW74VWbJJTcyDkBY7luwDnvW/389f85/YF2VwotLzfoaakqX3WQM0EuHgeZOE4q98IQ8Qu3JHYPeeZ+U8tpn/yCzpEeWbw0yEBpNW2nvVQqAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a76c25-d224-4f69-1bd5-08de8ffd791d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:46:35.7018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlHvRUsBtg0ZYpuBBMn8Ba6LFkkKkIGLTTHQ7B04Vt+il5zaMzVkIFhDqQWISTMMBE7/2imUXvEoJ6xxa9sLlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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

On Tue, Mar 24, 2026 at 03:25:09PM +0100, Francois Dugast wrote:
> Hi Himal,
> 
> On Wed, Mar 18, 2026 at 01:14:53PM +0530, Himal Prasad Ghimiray wrote:
> > Introduce DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension to allow
> > userspace to configure access counter notifications per exec queue.
> > 
> > The extension provides:
> > - trigger: Access counter trigger threshold
> > - notify: Access counter notify threshold
> > - granularity: Access counter granularity level
> > 
> > These parameters control hardware access counter behavior for memory
> > access pattern tracking and optimization hints. Userspace can configure
> > different thresholds per exec queue based on workload characteristics.
> > 
> > UAPI changes:
> > - Add drm_xe_exec_queue_set_acc_param structure
> > - Add DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension ID
> > 
> > KMD changes:
> > - Add exec_queue_user_ext_set_acc_param() handler
> > - Store parameters in xe_exec_queue.acc structure
> > - Register handler in extension function table
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 27 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  9 ++++++
> >  include/uapi/drm/xe_drm.h                | 39 ++++++++++++++++++++++++
> >  3 files changed, 75 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index b287d0e0e60a..815e82011c6d 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1080,6 +1080,32 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
> >  	return 0;
> >  }
> >  
> > +static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
> > +					     struct xe_exec_queue *q,
> > +					      u64 extension, u64 *properties)
> > +{
> > +	u64 __user *address = u64_to_user_ptr(extension);
> > +	struct drm_xe_exec_queue_set_acc_param ext;
> > +	int err;
> > +
> > +	if (!xe->info.has_access_counter)
> > +		return -EINVAL;
> > +
> > +	err = copy_from_user(&ext, address, sizeof(ext));
> > +	if (XE_IOCTL_DBG(xe, err))
> > +		return -EFAULT;
> > +
> > +	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
> > +		return -EINVAL;
> > +
> > +	/* Store access counter parameters in exec queue */
> > +	q->acc.trigger = ext.trigger;
> > +	q->acc.notify = ext.notify;
> > +	q->acc.granularity = ext.granularity;
> > +
> > +	return 0;
> > +}
> > +
> >  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> >  					    struct xe_exec_queue *q,
> >  					    u64 extension, u64 *properties)
> > @@ -1123,6 +1149,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
> >  
> >  static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
> >  	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
> > +	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
> >  };
> >  
> >  #define MAX_USER_EXTENSIONS	16
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 8ce78e0b1d50..3f10e3371e5a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -239,6 +239,15 @@ struct xe_exec_queue {
> >  
> >  	/** @replay_state: GPU hang replay state */
> >  	void *replay_state;
> > +	/** @acc: Access counter parameters */
> > +	struct {
> > +		/** @acc.trigger: Access counter trigger threshold */
> > +		u16 trigger;
> > +		/** @acc.notify: Access counter notify threshold */
> > +		u16 notify;
> > +		/** @acc.granularity: Access counter granularity */
> > +		u8 granularity;
> > +	} acc;
> >  
> >  	/** @ops: submission backend exec queue operations */
> >  	const struct xe_exec_queue_ops *ops;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index f8b2afb20540..19447ba10b1d 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1337,6 +1337,7 @@ struct drm_xe_vm_bind {
> >   */
> >  struct drm_xe_exec_queue_create {
> >  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> > +#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> > @@ -1377,6 +1378,44 @@ struct drm_xe_exec_queue_create {
> >  	__u64 reserved[2];
> >  };
> >  
> > +/** enum drm_xe_access_counter_granularity - Xe access counter granularity */
> > +enum drm_xe_access_counter_granularity {
> > +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
> > +	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
> > +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
> > +	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
> > +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
> > +	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
> > +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
> > +	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
> > +};
> > +
> > +/**
> > + * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
> > + *
> > + * Extension to configure access counter notifications for an exec queue.
> > + * Used with DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.
> > + */
> 
> Sorry if this is already documented elsewhere but I think we would need more
> details about access counters from a user perspective:
> 
> - why using them?
> - what is different when using an exec queue after setting access counters?
> - what is the typical flow, maybe with pseudo code?
> - how is @trigger used, what is triggered, on what condition?
> - how is @notify used, what is notified, on what condition?
> - are notifications going to user space or only to internal and trace?
> - what happens if access counters are not supported?
> - can access counters be reset? removed?

+1 to Francois comments. I never really understood the i915 access
counter interfaces on exec queues and without an explaination like
Francois is suggesting, I don't unerstand Xe's uAPI without reverse
engineering the code.

Matt 

> 
> Thanks,
> Francois
> 
> > +struct drm_xe_exec_queue_set_acc_param {
> > +	/** @base: base user extension */
> > +	struct drm_xe_user_extension base;
> > +
> > +	/** @trigger: Access counter trigger threshold */
> > +	__u16 trigger;
> > +
> > +	/** @notify: Access counter notify threshold */
> > +	__u16 notify;
> > +
> > +	/** @granularity: granularity, enum @drm_xe_access_counter_granularity */
> > +	__u8 granularity;
> > +
> > +	/** @pad1: MBZ */
> > +	__u8 pad1;
> > +
> > +	/** @pad2: MBZ */
> > +	__u16 pad2;
> > +};
> > +
> >  /**
> >   * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
> >   */
> > -- 
> > 2.34.1
> > 
