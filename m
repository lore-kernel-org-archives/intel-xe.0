Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44CECAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2010E7CF;
	Wed, 24 Sep 2025 20:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bF7wSCqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5375510E7CE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758744773; x=1790280773;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4SvyeapxYsPC52X1odMsW7fBSMspx7coy/ssGKBXUJ4=;
 b=bF7wSCqVF9roCmIxLKXMNRWOPrQe1qP9SnTD7oy9Tt+UUFd9uQHv27Dx
 qgSajkAUP+wRsQYzM5TqFAtk/lLHGdy+F2DjjE9x33V8tdpWMx7Wtiedo
 wFljw0eeEbJCYiaDPyE6d/3tEU1lyuiWp7W653FzEkM6fINj7ma9teSLX
 5qnGEiPf3ZE60Fl9NrU/meKQm8fTsPbCHx5MjvAHo7cS+9o+aZC7BW4+x
 B4uz+Bksc7Lj5qjgKjIgbpjV4CtV9yDVbgPNxRgyYWgxwQ2Qp8YUPhX+R
 K/T8hB3qBQSOA3HvVllq2iQrnCQS/EsKq0/Mksv4ZKTCzJ3zw4QG+OFTM A==;
X-CSE-ConnectionGUID: 4+Tji13XRdWocs/xNIE8yQ==
X-CSE-MsgGUID: 9Ed8BqTSRW+0QsvJGiBmkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61104868"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61104868"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:12:53 -0700
X-CSE-ConnectionGUID: IpgT3OAYQE66WLmP+t5AjQ==
X-CSE-MsgGUID: ICVVXYN3Rc2hQD+mwKQBBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="181131618"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:12:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:12:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:12:52 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqoZXB6q31PlxD/jKzKEbqRZnDH7WK7ZqARZy2abR2PXWiUK0lkQD8Hv404WzQKfa4tG2oCs3f8yiIxINVYBCD6JL7aFpTf4JoVKRYW26ccWK77n3sHJ6trNEUie3QSrcp+fD2ZskSdrpVRmvE2u75ltjMs4ZE64JbRpHelPtph04e8MkqodTrWZpo6S0OcCZq3W32XRtyZNMierPfRMZrjSnlIthIQLr/zPprJ659htior0mbCaJ58zOs8w47YeBYxjw9/TncDTlv6S6zHMa65d21rf8A94ZwI4d/C4I8zvQXzgxUIado0i/Ed4NJh+m8fOFzxtMsxKRnajHHrA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPe3Yn/Qr4rj0BfAI1oUXUTFrUUlPP2Lk7pGqRc3ttc=;
 b=Ur5GHHbkY3a1ZI5enL2bYI/rkWS7QvhTyEdvGJhTqAIWkQMuH7LEkJ44j3CKszp8Sm9u0M+IkEwKQDr5l4CVTWKlkdrCHElmpihGAPTOxSHqKp/vTYolz6jmGkJ1ox4/bzxksW/0MuzahVHkLhqeyH1MMbPQtarH3mgL5U9GamK4zf4gHMk3sE5E9F9s2Tnm+ipbL3rd0KcG5br/x8WwNzUM1F0IA+2Ni/k4A4zesDe+X/TRRa0nZXNVkgNm0AZR6e2AKrMQWO97GU8sFeiMenfik0TulQ5ZmDXVzMqzZVXLY7VmGX3OAZZRqn97ZCEXxKLjpicCxtCNmvWskXtmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Wed, 24 Sep
 2025 20:12:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:12:45 +0000
Date: Wed, 24 Sep 2025 13:12:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 21/34] drm/xe/vf: Stop and flush CTs in VF post
 migration recovery
Message-ID: <aNRQu0lB1VZ5hXKz@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-22-matthew.brost@intel.com>
 <c44e9ebd-33d1-488e-bba5-724e00c0e7b9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c44e9ebd-33d1-488e-bba5-724e00c0e7b9@intel.com>
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fefb8ac-64b9-4c86-4faf-08ddfba6b97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2XJbMXkmdEz/uCLgKH5QqV7tOQo5PW7IfiAAF5ORaBMmGFgm9LK3s9JOeynB?=
 =?us-ascii?Q?kH8feej5SVpElWLnsv2p/7fsN9SGOYLlQ3UpbeN5p/ntofeachO6Z5PoiNYD?=
 =?us-ascii?Q?Rh29oPMYC7iA+fu4CN8Yt2QiSektv4P23CTNHd2FZ3b6VAB08tICtLyuKchE?=
 =?us-ascii?Q?zq9w/5AOvwVRc15dEjk9KgOY77jozh8s6aIqhGDUOPiXfUzdhCfCJ8wmK1Bu?=
 =?us-ascii?Q?FuVxYyo5t60hlIZ4AhWYewfDgOu7kvEAWb6F0NlyQfA2JQe0r2L8p4OkUy5r?=
 =?us-ascii?Q?qAv8VXiqUNg8yptq5JDzoOYY/oC/Aw1Z51LxxnidEqbXhAdnhYE3kW1ebgYC?=
 =?us-ascii?Q?TWPTf64X3lzRQU//20K0M18Mf1Nmkqh8QpmYqF9Cm+XKKZ1vkxRZ13n91SbY?=
 =?us-ascii?Q?39bcNYKGrSU5J6qgDbLwL8tXM7PFFQq4+rcZYxjl2jr5vFFuvC98tA2yfwEq?=
 =?us-ascii?Q?+Lini1AyHTdt0KhR5IPSyowfI7GRkxBfxdI3G4oPntbYzSqR0PTyBEYYAq13?=
 =?us-ascii?Q?pHSr9+6Cd2NRARUDLIiZZb4AvqniqoUJbLP4JK4dH+XbV7snbuYqYOqAzvLi?=
 =?us-ascii?Q?YekFYSoFf7qDt/g7MpdKXmlsygGbYdaChZgjrSkzKdU30YEAOVBuc8hzeg+d?=
 =?us-ascii?Q?nSroZxeFuMldOwzG9AJAnHfvFZr0i7/2QbzU80Q8DzSBcm0MFbbqgMnNnXVr?=
 =?us-ascii?Q?MOeY6TZI7K5+5Ob2iIShXTohN/gnIV/TdDgLiRdUd3Y4iElxwYEpvtnN7ya5?=
 =?us-ascii?Q?FDkN/GPAja88paS8cKWTaWN/eqXiTem8ye31/Rdr3WzCa/qxqseA9YqRy/c/?=
 =?us-ascii?Q?AORLxW+hwyyYLEbHkOl0Ognr/u2bOaKPQxHloZJX0ljtPtfQJYxgrHA396td?=
 =?us-ascii?Q?zed3y3RcxW2kg+4utUjcFPApHiqkwmV6bR8vl8HB/0s3CtKfn5N4XY9GkpxA?=
 =?us-ascii?Q?yjIILm8cDmPZSSss+GJsSUQSxcpllpmY5d6aAkWxjHNL1nX8LM7zfZplZzGb?=
 =?us-ascii?Q?X8vFtu+IVoqzGT7G8alv0Tf4SVNSLSQ+pEbhZE5e2qM0a0LLuadOLAOo9cdF?=
 =?us-ascii?Q?ovvWrLEwuk3XhrFrZZXthSrtPnyAuThHumUIh6rydfuPa0ts/FA8KY6Q0y4p?=
 =?us-ascii?Q?Y6zBl1iFPIYBXFlt8MDhUfAJ1QYTZvljqyXEUZgPPk4uPgVtwgA6Hjt5K0wi?=
 =?us-ascii?Q?ccNdeSqZ+iLPfv1gLgxwJ9+1hVBCIWKuOUbFTv93rZl/k1raPyaPOGWvcN8T?=
 =?us-ascii?Q?Qxc7zZCGdC4g6G/+LmFZ5jR5tBD0vdekklU4tYdQPZ8S4CzmJQVf5hNOZznT?=
 =?us-ascii?Q?DMHyl1K2Yl0vgjlzcNSkI6+WTB2nfcUIMhFJJqNvjGsBWWXaCNfJFtLHKfNe?=
 =?us-ascii?Q?8/lObRocWpERLz75E06lMe5ha8JUSILTKCQ+556I1jbLRmsj62GowvsMKeoY?=
 =?us-ascii?Q?Zw2fUPtLiis=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYHXEV8DDpnpt+LsgMxh7vFh5xq/ymRSodAAumYWwFqyU++DDFhbBQA+cz7Z?=
 =?us-ascii?Q?aUghNTmEnqiW3Kk5fqyRg8MG4spJLT4oVIiTNiDIBtlkxnHXmin2+VPkfuGE?=
 =?us-ascii?Q?KYSfq59Pqhr1I01/HTY7SDTkj6sKOKzrQ9xSS9UVFRiI+zs5wZGBd58OcBRU?=
 =?us-ascii?Q?sBw2nUVLNKMixzpuPy5yyssOPyPpuDN3YlUT8OlDEdwOsXULOWtk64puisOx?=
 =?us-ascii?Q?jTwVvD5YoG+NFW38OigBhB9q0+PoAmT+f1rQ6kAvgu0A6niQBUqzkL/sqi6e?=
 =?us-ascii?Q?g52BYZBhfhLej9owVGKkazGU1rdSWYurfpdYy1qwPo7j+Bqrs78R70leuYF1?=
 =?us-ascii?Q?2hRmY7kMZEf9RxnQRSsqLB+ZkVBRP03GzrcGuAD6dY1S2ykSYGB8HPGovxAH?=
 =?us-ascii?Q?Cb2nQ9xWcTYRSx19LlzISt1fiFFXkfSYg/pvBtqKR+cmb5EHQPIi0EnvYAPo?=
 =?us-ascii?Q?/FLJ1yhluUpHYL0pfWLsMp1+JH1glfOzdgG4OMBc0PFKlYkJH5b/TuKfw+iA?=
 =?us-ascii?Q?oZf96O+51QiJ1KMh+oTjy2IxIGWyGBjkQRqMAjkuB+W6vQ0NIgfvo6bwj8y5?=
 =?us-ascii?Q?mDCoEkYTx0sG8WFti7+OZODOHcP2IneM50R8C3BTmXvXnI/QlklXyKMsZk82?=
 =?us-ascii?Q?C8nP0KBtIGplSfeg0L0juUbdfWnaePxLRqBWZlaimazAq2jMe7pohRqhULln?=
 =?us-ascii?Q?Ev5A7jGnQa+PNGtI/mE5FkZBnmshByECoAehj1njp/NJp9kzf/Jl/iUjugX4?=
 =?us-ascii?Q?dy/d2bnhVUUOnZKmVi0GILu/cP47WsgT0CSNc+sYaJsIxpoweEuPDk7xj2Gv?=
 =?us-ascii?Q?ASNLOLj5kaasA1pLTdtqVBXdOWg4skHGnlq6qpd6k2ML99S99vsB+JvM41nc?=
 =?us-ascii?Q?ZvDdi58EuuB+f0OoiMzDLoFMBhuN0Z7yEtztOWgM6b/3350lgQox0UTPDLql?=
 =?us-ascii?Q?kyqks+3AgiAsxN2xvAqu5556WgLgHsbReorKnaB+mWbJeAKXSpYVsFMGwlAc?=
 =?us-ascii?Q?wNrc0RdiY3DqlZC2wJodTXd+dT3qxOmCICx2DZ+ocFG3zeUFFn6EccGFlDUs?=
 =?us-ascii?Q?YE+4+v90n3wNbuj07JR8gflCDwMAXl3tnnhjXqR/+uJc6GlwZeo63Cp8VhSb?=
 =?us-ascii?Q?Fb/v4K9vDIDvDjuH3cVB3dkgiR3SPbHtpHVGm7DQu0Hp1hvs3WS8RRxZbEml?=
 =?us-ascii?Q?T6nHkJ6BXtTi2cg4XvX7EPJ/NIYkECEridUf5GtivCTOYG58Q5NwR9YDPG/d?=
 =?us-ascii?Q?lUbJZcc1RTqMiwdj0CJWDJyTKF3QdbDGM+8WbVGTcnrqzLUYXgHmkUIbIg/f?=
 =?us-ascii?Q?2poT1JeHwGjh17ys+nqB3jUEajuxxGcC0bqmJmrVj9MIgQ+GUVJMekaYfhtl?=
 =?us-ascii?Q?Jucs3npoUcU/7CsJJ++dvmDIPa4Oj3DEmS5D/LqCfoTlJRbxBJDkB8KXqe4t?=
 =?us-ascii?Q?BTtTo9LV5fScaYbOLos/xzkl6F86X+IeXqkCc14a8V/U2YK61R07Zriaya2z?=
 =?us-ascii?Q?dZVRBfywAU0Y03hM8nvm549LFVjpYXagWh/GstQ1w6drMbkQbz01jcY1BdlZ?=
 =?us-ascii?Q?yW4m/XcZUig6Q2Us8xW7kJc2bhs6B3ne+WMJ+XHzkPrz1dhM2Y2GIvf4SsYw?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fefb8ac-64b9-4c86-4faf-08ddfba6b97d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:12:45.3581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcujDrDQdQo6lKuNca3x7+3/SEAQBtpy3Wq9/WkOUzM/OVkRJLP8KwHt8minSGAAtsce9PqETWNq8yQ/QfV5DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

On Wed, Sep 24, 2025 at 01:21:19PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Flushing CTs (i.e., progressing all pending G2H messages) gives VF
> > post-migration recovery an accurate view of which H2G messages the GuC
> > has processed, enabling the GuC submission state machine to correctly
> > rebuild all state.
> > 
> > Also, stop all CT traffic, as the CT is not live during VF
> > post-migration recovery.
> 
> this is what I was looking for, some comments below, but LGTM
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_ct.c      | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
> >  3 files changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index e79ab4a2a273..071c2c5e0d0a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -23,6 +23,7 @@
> >  #include "xe_gt_sriov_vf.h"
> >  #include "xe_gt_sriov_vf_types.h"
> >  #include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> >  #include "xe_guc_hxg_helpers.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_guc_submit.h"
> > @@ -1185,6 +1186,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
> >  	gt->sriov.vf.migration.recovery_queued = false;
> >  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> >  
> > +	xe_guc_ct_flush(&gt->uc.guc.ct);
> >  	xe_guc_submit_pause(&gt->uc.guc);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index aa9fb08f7856..d4a132b81b86 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -574,6 +574,17 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
> >  	stop_g2h_handler(ct);
> >  }
> >  
> > +/**
> > + * xe_guc_ct_flush - Flush all processing of G2H / H2G
> 
> Flush and stop ?
> 

Sure.

> > + * @ct: the &xe_guc_ct
> > + */
> > +void xe_guc_ct_flush(struct xe_guc_ct *ct)
> > +{
> 
> do we care about ct being not initialized yet?
> 

I don't see how a VF can be moved if the driver isn't loaded. Maybe can
an assert here to ensure this assumption is correct?


> > +	receive_g2h(ct);
> > +	wake_up_all(&ct->g2h_fence_wq);
> 
> this is part of the guc_ct_change_state() called by below stop
> isn't that sufficient ?
> 

Agree not needed, let me drop this.

Matt

> > +	xe_guc_ct_stop(ct);
> > +}
> > +
> >  /**
> >   * xe_guc_ct_stop - Set GuC to stopped state
> >   * @ct: the &xe_guc_ct
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index d6c81325a76c..1e32a59817cc 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -17,6 +17,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > +void xe_guc_ct_flush(struct xe_guc_ct *ct);
> >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> >  
> >  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> 
