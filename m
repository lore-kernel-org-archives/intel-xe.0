Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CCACCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 18:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2810E962;
	Fri,  3 Oct 2025 18:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEf7PEaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D6810E962
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 18:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759517673; x=1791053673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gfbug6buI6G3JOifTFar3ebIvBJeWZQ8VitObQFliq8=;
 b=IEf7PEaDqJkzNxjn1r/Y21/W+T+h4HEkQ4O1vc/H6sFbZKoe3AMDztfR
 lSmTBBpVWI3t+PhkqlSHf07001KBmaCTuO31sKg4hfwX72VChPA5hz+Nw
 wovydu9SXCInA7zDbhmJjBHV9dlmn7L1qyxWGU6NjPBT0+H5j172Okx4+
 60RxsruLCuvifmO4IZzEv/lVazyJ4qHTTIQLS4CG36n1AtpQVCSAOnO/C
 mENa8+TcYLs2KLIEo39/Y6CIKoeoxXeDS1veulNRU3ktevkLfO2w1Wg+8
 faYBHbB5MVfls6XW+9dD03ft+lS300haqKqholWc1dxmHlVsiRc4a/227 g==;
X-CSE-ConnectionGUID: MAYyinBcTbCH2JS6LlJY+A==
X-CSE-MsgGUID: VrLkk8IOQ+WPKbmp6w0ntA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64418581"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="64418581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:54:32 -0700
X-CSE-ConnectionGUID: qB7RgjhsRG2lcVD2RhAkFA==
X-CSE-MsgGUID: /kj0iSGJQLqraW1h4dXfvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="184641105"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:54:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:54:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 11:54:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huvOiapp5+zILiVZOwBh8A2FuedJR5jZaJp/yXF20NuoesXcQn6oGXHhEVHApdlrWeF41ccpTteSIN+ggoJwt+p1HXtGFPbDqg7xUJz3ko3w5lP7asWLsOTVmOXnveWeDwes29/pLLEFY2FohyJGuEmpo6OyLRp9c5BQF+av2/Qv/mfs8qJqJPyAaHoVLE7mYLHlH1mr52eLfVx+3YOiLJl9umqf8zecpfbJj5H3HuppR44EOmV1QIY7fWGjxUii3b3U/ixavpNmh1LSAVW2dZGkl+mhriBHBTZblKF52ZzeNM2x3sRnveSK8M/yye1IqGuPdu6Ax1OrpSYU7RsnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+wlzJ596xtuETyS1YDqkpkRoOP8jZApk4H5Nkkd6s4=;
 b=mZsfvuj1og2lZW4R2S8TpJcCJruKAMoc36p//6PX4tWJNYSEWbcgZBYEIeChSlHNGlvD8sUC/nkdqCyHJkaL7Gts/PGUDwWDdydOM81hGg2r31V6Kq5YXNTfDyWU5rRVgZWS+McViqyhYg0p9fgLVeTn5lQhi5gRdRJan+yyCPqY9lRW1VqbhjTJ+71LWQ8mAVRVFSJ2C7yWK/54zr8BAHpClCyg1xVwfxsqJUaHgvXH5LFfK1M+5xJgCx9JWw5bOS51gZ8D0Z8rSn3vVs8TAKvajY87nOvwxp5Ubti5RraKkd6KZPeifJxnuGZGLDmeotxKrbd6pA0f/MN11pBZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9456.namprd11.prod.outlook.com (2603:10b6:8:290::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Fri, 3 Oct
 2025 18:54:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 18:54:11 +0000
Date: Fri, 3 Oct 2025 11:54:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Message-ID: <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-8-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251002230444.313505-8-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f0ee5c-a9b9-4f95-1aca-08de02ae3d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WGx6EGguQy+khFxXLWNLzBVq80AU0QDT6Ra/ScO4TghTcZ7So8SF5PCPuu+1?=
 =?us-ascii?Q?SpzLZaVQv0P+xNi253Jffp1gQefwDSTG0A70cZQ2U4jPue0LHbOvgUqxFEAD?=
 =?us-ascii?Q?8AkhHM4Uh4RKOgFpQhtDTTiLpOjkeiwoIzLEjNARhvTF3QzDFHpZOL5jHSic?=
 =?us-ascii?Q?lohJUhV1B71O2wqXT6qSMLOJ9GEq4weSdJi9oOnGjIQPel51pSd8XupQvkH3?=
 =?us-ascii?Q?zRzVl9Jb2dDkwxCsy3+wHrpVOPUZMNuqa9pp89FWL6BTmp4z/bZZBeHHxeVp?=
 =?us-ascii?Q?hcZnGrUTscC77RtqMihVG/SqGJKOY8Bq9z41A1md0KcfzlWTs/iy3uYWvnqE?=
 =?us-ascii?Q?UfK3umMT+pz3erMB90yG3T6pbmuw2fYpJNY+Dagxq1F2UG1pK83f6tCm/qVq?=
 =?us-ascii?Q?PXh2qe/stNOjW9rYLYxLPAj+EOxGiL8WyMx0xGdk3uC2WdQZcIQy6NpIM5O5?=
 =?us-ascii?Q?O+Bq86iVXp5FOnFO3fVGlquNWlIyDhw3PupKI5CAQCnhGpcQt/lA2a2ZMaN0?=
 =?us-ascii?Q?x8Kk9UcD7yDxThLfwezZloSNb8ZI5krghj2xc6HOeJC+NGAAATiVpQKZLZp7?=
 =?us-ascii?Q?yj1wwX878qauipUjr4mYFG4fgQtxvVLK/x3NL8v1cQ0vA/8R0H4Dy06y0fLt?=
 =?us-ascii?Q?YMO3VzfxjkO/oWn1SDR+5HsD2zc88Xwl83PAkXzb6sp+5HdPGcY02eqQ4zmB?=
 =?us-ascii?Q?5051c2BtdWjNtXwhvFJxvfAVahjHycgEYffzxCVfGYVQMpCISvZ8fl402ote?=
 =?us-ascii?Q?6z19cSJ38xRcrWpjU+AZeyvbGvTk6O/VFATkXPk5x4nWvByMqkqIsexpauKE?=
 =?us-ascii?Q?nRlWjXf7mTxIdSbOAwMd3ql7K+KyQUSb4F6CDHqDKbwJhR/LeK+/xYY7fx6i?=
 =?us-ascii?Q?4v1IAYDG9tEVlDe8xX7Yl7q/ohaBTjql/BABL0ovYl6XZJEsLBny1+MUZVi9?=
 =?us-ascii?Q?lwPLN0ZG7EPK401NXx/OkFgkr+ei0Yo+U1nalcJnwTM1J2bRVle1XiZVO8aK?=
 =?us-ascii?Q?UJSdftEnajzQIcRamCWhqNUHw+nibKDnLz2Ouy70lTsLGb/LWH7sYfwE0ZH8?=
 =?us-ascii?Q?8Ai6BbdNsQc8LGrfPSugxkuRIf/ftsmdJ0FN+9d/XiTxSV6uMDTxvJ/Df2Jc?=
 =?us-ascii?Q?/v+m2Ls7YhhXLmvyaQJv7oV1IDkufI7VyX6MSoqm5XCsX0VPObqacpDwyqRD?=
 =?us-ascii?Q?IQj6llnhH53Co5SkBtyE6Z0vqqOAB0vVZ4VZlpvr6sNxfgTHfAcGvdBef0tP?=
 =?us-ascii?Q?9D9/B3UsPvbVJ6pqKBboBXa3nLmVi2/Jq0eCsHxPt6dWrN3UF8lO0YgV0bib?=
 =?us-ascii?Q?Xr4+rhECIEb03No7BgQJRTAN6UWiFSWrdbQj0oRkyDPbCp5r1s3zPXsQuevo?=
 =?us-ascii?Q?SROwOIqczYVkYH0gVR0fvT+7fkdtUv6JwaEq5wT5yfh/nkSAn2TcCGXxzsal?=
 =?us-ascii?Q?3kTlWX+T8HWXJUwYJsD84RA+YKLuitHF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycaiOR6orCTVP9wpIReqclV8NaLI6gDynf0oh//5MLxmypTdDg0QSyLVJ1aa?=
 =?us-ascii?Q?9gk2CmkaaL/fRNU4NyQoxwvhIFbQzd/tP0VXNprHyKwG+PT2OOtGnIESmdMq?=
 =?us-ascii?Q?TRxwExwV4AC2QdpYWrTn3n0Oleow9eZl3ClK8pDzB67LJ3A3VpAkDHye3HM8?=
 =?us-ascii?Q?PoLEIR3AFSO9qUcNZSfawkVY6sqq623D8+aO/DgBytZ802/B1g+pluDpWg67?=
 =?us-ascii?Q?SgqL9sREpQydiA9DPkpn9rZX6oIgZhefO6XYt+MgklwSpcdN5YJCT4dkRL3V?=
 =?us-ascii?Q?USVGhabPGhKTCdhknILkvailpcKcCo30Z0ord8gpMaoTrsh7tuM+Z4wFRqCF?=
 =?us-ascii?Q?uTGGipDIgsWeuLquOkxTjIq5boeaUEhhdbNTqPnDPdClGmxKENPTcPAjh6Ex?=
 =?us-ascii?Q?ku40llvZ6470S+uDudRbTAwnLWRhLMVXfTPuUpHTlejqcbrGMj6Yi2ADw79g?=
 =?us-ascii?Q?5GYfvoFYLyvKb4CxTwHPpkiSKoOp/Qj3Yg0Nx4UAYR4RzO6t9/OxROoI0yv8?=
 =?us-ascii?Q?7r/R9/uNIP6FgwdWG5cWRM37ksOqlE7LpEoNwAL3sQpcEAzhJYKxPc7dJ4M3?=
 =?us-ascii?Q?lJwsQoT6H7tBeCaRrs9W2Iu1JfYEUGJVY4b0MF6Iz+980pqnuptOwI/fQki1?=
 =?us-ascii?Q?gV2ZoCEefFADHwtj2X8vngdV4+seDR92q4j8V+DNNIT8kvvdPQtyNMhODZAf?=
 =?us-ascii?Q?YZceVTFNPHN5t67DUyvuIQTqnG1zbO06MjbkqZGOWnX4i8PLEQh2xpU/xoy8?=
 =?us-ascii?Q?wlz1WsjU89W3c3t5ljjRQLFmR09/OgCJreD7ukGg6m31vnSrRjie4TOwYrUa?=
 =?us-ascii?Q?BRbBm/UXtspyAszLCzBHaeCmcop21JJturYCv37rx5OuQE6uYsb7RnTdj0Yw?=
 =?us-ascii?Q?tYtp6h707OdiSB9gCemXiGLT+RTUHCZr/o+MFkFMjQuFtiSmuxlSBKSvGCyu?=
 =?us-ascii?Q?hovJVvQWlIpyz+LzEVP0agAFbOj6yjEDPHP71DLFZELkqaxoWmFDKzLLJuL1?=
 =?us-ascii?Q?kdJbX03Qi9sBLgtK2rswzMSb9zhaxMUtv1OO6rt4hb3LpZN/xsAXp9lN020o?=
 =?us-ascii?Q?WuRMrinadlc6u9md/3E6yJODQ3yZyXO07UAJGJxFnQjrk2ItHhsS1bEtd+bS?=
 =?us-ascii?Q?d+NzuIagPYWI3lP4Wz8F/IwESuWBmM1zINJh7QHqHGPOs/2fBeNs3bZELBWO?=
 =?us-ascii?Q?bro5NalN69/OH1v16aCqm0SPafCzty6ZoW17KeNGuMZeM8jpPuN680YGJMYt?=
 =?us-ascii?Q?ua9K4e/26ZzvVkKboZwA55w9jBB9elal0eqij1SCofWP7vD7Zu3findbtFEX?=
 =?us-ascii?Q?lLtP9V37D2199QwOSN9U3dcuOzaeDstK0BpunxGXcwKJ+20Gjsxn9qiNX+Eg?=
 =?us-ascii?Q?MCyIGKbE+htl3LnQwDragNbMrJ7/7f50KdxDV4DcN2yHEu8Y0YkgXSEHNtyz?=
 =?us-ascii?Q?/QxodQjhjB+fbPxCdLq538NWImObjltVBz+vfduJUdfsUyBIa0gKATXmT3oL?=
 =?us-ascii?Q?xug2yFTUtDJgqAqV/eumsYRNZvfJb06ozexf7RhC2XbjY120hFD7jIbBcaVk?=
 =?us-ascii?Q?Q/rCGS5RIY8UvwHd69orP3PlWh1m3EJgu0vWL0dDcRYz844utu4IU/wz67qr?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f0ee5c-a9b9-4f95-1aca-08de02ae3d78
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 18:54:11.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jem3RepEUqag5B1f6NYWkTZDxqWOFnnHtEK7W3CGiqTlyQZyrjzx1oS++GsTFuKFuX2xe2ceqELPRisHVoDW8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9456
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

On Thu, Oct 02, 2025 at 11:04:44PM +0000, Stuart Summers wrote:
> In the event the GuC becomes unresponsive during a scheduling
> disable event, we still want the driver to be able to recover.
> This patch follows the same methodology we already have in place
> for TLB invalidation requests, where we send a request to GuC
> and wait for that invalidation done response. If the response
> doesn't come back in time we then at least print a message
> indicating the invalidation failed for some reason.
> 
> In this case, we send the schedule disable and the expectation
> is that GuC will respond with a schedule done response. The KMD
> then catches that response and in turn sends a context deregistration
> response. So in the event GuC becomes unresponsive after we send
> the schedule disable, we actually have two g2h responses that
> have been reserved but never received.
> 
> To handle this, make sure the pending disable event in the
> exec queue gets cleared (i.e. we received that response from
> GuC). If it doesn't in a reasonable amount of time, assume
> GuC is dead: ban the exec queue, queue up a GT reset, and
> manually call the schedule done handler. Then in the schedule
> done handler, in turn, check whether the context had been
> banned. If so, manually call the deregistration done handler
> to ensure all resources related to that exec queue get
> cleaned up properly. Without this, if the device becomes
> wedged after an exec queue has been created, the attached
> resources like the LRC will not get feed properly resulting
> in a memory leak.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 45b72bebfc63..a177d87c8524 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -939,6 +939,9 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>  		GUC_CONTEXT_##enable_disable,				\
>  	}
>  
> +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> +			      u32 runnable_state);
> +
>  static void disable_scheduling_deregister(struct xe_guc *guc,
>  					  struct xe_exec_queue *q)
>  {
> @@ -974,6 +977,17 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>  		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
>  		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_disable(q) ||
> +				 xe_guc_read_stopped(guc),
> +				 HZ * 5);

This doesn't look right. Deregister is designed to be fully async. If
this flow stops working for whatever reason the GuC is dead and
eventually somewhere in driver will detect this and trigger a GT reset
which is cleanup all lost H2G.

> +	if (!ret || xe_guc_read_stopped(guc)) {
> +		xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +		set_exec_queue_banned(q);
> +		handle_sched_done(guc, q, 0);
> +		xe_gt_reset_async(q->gt);
> +	}
>  }
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> @@ -2117,6 +2131,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  	return q;
>  }
>  
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	u32 action[] = {
> @@ -2131,7 +2147,12 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> +	if (exec_queue_banned(q)) {
> +		handle_deregister_done(guc, q);

This would leave the GuC with reference to guc_id and subsequent reuse
of the guc_id (i.e., next register) will fall.

Matt

> +	} else {
> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> +					   ARRAY_SIZE(action));
> +	}
>  }
>  
>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> -- 
> 2.34.1
> 
