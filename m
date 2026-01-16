Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC86C98305
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D362A10E08E;
	Fri, 16 Jan 2026 21:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA3kh7Fi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F278A10E08E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768600326; x=1800136326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B6qxdMCI/T5DHSENi/HRZOBIc/l4dDA3k8zSlY+BToM=;
 b=TA3kh7FipYJfuVafPyqi1N7BlA4+aYEzl0oBTs6eqYk1LDPhUUEPzCjt
 u+QYY4ofFXCZQP+ujEpc8ZvNtWLI4FXMIhEeOJivaxEU8rOYamP359FIo
 cfelGI3woffW+D/E6RsE33Izu8J5NDYD4bAj4C/9MgXNXa6Irwnp4aj9X
 mOVOKZ0YMXZ7VnJPTLJUxHSoCYk4+nwNx0Fxet3sMhPAltYk21tBm5xjR
 n//03LvZwKA/Hf2eGua3dYvbsSsXzfBXi2ThMebk/MylRZyDjdAU0ut0o
 dUxVcX7U3p60q2TKiYwhoJZus3jFPxiDsqjJoSrMKzPVvtmmcTcc9gCea A==;
X-CSE-ConnectionGUID: y6SipONlTj+ywUnwjMdnWQ==
X-CSE-MsgGUID: aM26+LhYQXe2WGqIEip4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87335414"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="87335414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:52:05 -0800
X-CSE-ConnectionGUID: UFsy1Gf7QgGzr5/hEHZKjA==
X-CSE-MsgGUID: jiiQK588QUK5D01q+u87ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="209476995"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:52:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:52:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 13:52:04 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:52:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdAxNQ30ki8Z2qbWzAzrwUNePOSkp5Ert2mik/M8pO0wT4zFtOsJiYfyoK7uft9fjTMJ6O22MLQoLZu+gKrc/5p+WuldowNMJDwUU3g0HcbNhRL4gcd71MBBEUNkqqpLU63ljBxfmiBbXGNWerXNYMae54RgLwo7UMA0JNE8cSq6JOe4d9cmFOGNxqr0a6LTnbtLx0ePmoynmKtKrIIv0268jaK689gKEQjfHXp2joInp2ILl3H7v1yoHR78BrYOBRk4e/EvOJgqtCtHJnVaeB0NcRIeu06SqHR5lJwHFJBV9DbpM6OEVm7/bzFp5yRz5cZcTukcRhrbjaIII4JNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5fFabtWX814sAmN/S0nuvJiYOznqXa45DokFdS5Y2g=;
 b=xZOWAqZMn+L1rRhRDYkyUxrC0EgQA+Mh8HRtFII5euWDQZNYluPFQUHRayeFPzHOaqx0QKrWDvJkIWTAI9qarkdPYGqNAQZxRcXUB/Qgfx7wW0XqBsIWrxb3TeRuX+swaTcPYQg3f+RdBBtyVgKHjS/pkoD50nBNqHdiugzLuXLDUkNvx9HvKALWcfdl5ZY+U2nQhB16v8AQowFe2TjPPNLLkIxSBILFHpJ/kw+qjIhInnzjRsPZwiTW280Vb5K8aUkX8SXoYXxJsStQrL/yw58BR8juldpZcfUvS95hQ7vNgL8lFHBlHRuWouQIZ4o4jox4d0aj07fO5m8U47Ky4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 21:52:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 21:52:00 +0000
Date: Fri, 16 Jan 2026 13:51:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Ban entire multi-queue group on any job
 timeout
Message-ID: <aWqy/o201NPK7utm@lstrano-desk.jf.intel.com>
References: <20260113042913.3517169-1-matthew.brost@intel.com>
 <20260113042913.3517169-2-matthew.brost@intel.com>
 <aWnmS2ZmTqNq5Hhd@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWnmS2ZmTqNq5Hhd@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ecfc40-3c11-450c-2032-08de55497a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Rl+ejb1zSsL4cAcMLqwL6lG6gimnuzMRpRs78bcVwLxtOUbNmICLHTdZNiX?=
 =?us-ascii?Q?78J1/I0GuVFEM4nC91+xQALIg/gHuoToVe1/o4Ui+pX4ftS6WtLebnit3NrS?=
 =?us-ascii?Q?6QcJzdHOV1nxOE+pgU383ep6cAyzhSOJ8X0YICAbGvM6wKyViv/c/IuHcD0W?=
 =?us-ascii?Q?TEVE+JGibhCnUTbVGSIm5/bbQBlMxXzc7A0HbkTiEJ7RkOkIeq1+AL7dQogs?=
 =?us-ascii?Q?5XcDomxwTx68pfmfeWMpxPfI7SXSB93i3yk+tj9FoSiJ/C51p6FjpLGL0Yov?=
 =?us-ascii?Q?IDHgRZKAmNp02y11NCKRVPcARH47BTsB8b9sP5JXhzx0sGqTHCmPAEFfVVOF?=
 =?us-ascii?Q?cL389bOeW0Bc+SX2QVYfYFwA9nA4CMb38g5lGM1yg8+NaWjWkzWdeCF2vT8c?=
 =?us-ascii?Q?TVtT522awPIdYCAQcx/ECyGV9R0yqxrrP2EQP5Qlcxw+oQqz2uFf5/2DmMk4?=
 =?us-ascii?Q?RSIBtt2fm6cbbsQcvhRBsZbwv3ZlUQK09ldbZjWAuAdel52DvEqC1JG5zI+d?=
 =?us-ascii?Q?BvVw1DuWxWv6wkYhnCu6A0SaZi9b7GrobiVyGvUcqO7S+9/JP9aAhNOtuhin?=
 =?us-ascii?Q?eK1NhqHbdVwhxXAXNlcHWHsUi70SCvbbX/FDSSZrNcHF+MPpYomUgWsUpJon?=
 =?us-ascii?Q?zVbnSPpelAlzUTZmqxq8lkJnMzGleKiLetTL48mZDiKHhz07TWV4stAwMvYj?=
 =?us-ascii?Q?r+vQFWVftRq6Y8lGTtG3SmctPHKmXUiwTfTiNGT60j/og1H69/a1sV6KYGe1?=
 =?us-ascii?Q?5nBMusSgTx0rVM1s6qXRqOnR1ZNGwWKynaH38JpkHsnyiv+kJnJfzcjs0OiE?=
 =?us-ascii?Q?P5oqrAlfXoqtj9WF+HgtvQMKKSRvx5Oh1j8hVAccglUewpax2xirf3gSUo+h?=
 =?us-ascii?Q?8JK/qa8DHAXtc/UBvfDkUdb11WNjKmGQuKnPCkzqNqQkyz2OiPW2fyjm9dCM?=
 =?us-ascii?Q?au/MO0xw6ZSJqTeaij7v0SpDsXbG3ZRJofTJA8hdB/BnBj6nEW7hvAkc+OrB?=
 =?us-ascii?Q?bVsbpPrIhzrdCTjOk3tCSNuU8E0cj9i/sEnhavG/MIb70DszfvL+MbrrwVmp?=
 =?us-ascii?Q?fHJt2CbCp2Oq5MqqZhZ6T0t3S7sQSAdxPOAKZE0ihPcV8WO5RBJeDu6DSaT1?=
 =?us-ascii?Q?7EBjpGCv6qtKV33j0ZZnB26eukbztzEPoYNN/kAuekfKDdozZ5lVVMi3q1q2?=
 =?us-ascii?Q?7jtdyXLzfXG2xG/e6Vnuyq/Dm5oicJD0DKfY6Gp4AyCGbCusk84jx6bDsVc5?=
 =?us-ascii?Q?JRmmBfdUUwBuF1oG/6O7wH3NoL9WAr+gUa/TLhsCWp62F7mRioqpXwvYrhus?=
 =?us-ascii?Q?ApA2pn+iXmYS6U9pasZi+aUNT98Bnavuhw7SY1DPVyA7MqmPnRp8wwxJ52YS?=
 =?us-ascii?Q?39mX/Jm+9NuJTEPFnKNWNldQbAPLbTW9eCp2C26Jgk51DjIt4jvAsZHaPo7Q?=
 =?us-ascii?Q?0UTUVbG13eIALBrv08NWPJleZ6RFCLqoFRQkVDgVbrQNDy+cUilhd5eaUu8q?=
 =?us-ascii?Q?ulCPBHkGi7odyyTG+/DczvjySs+c8tHjrNZwF0rzkcy2CKZSqnQfRYWX9IrG?=
 =?us-ascii?Q?Vr6KZZ8gq1vqUaRaQI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZWhTQyZGZ6COxIoD5TjIKzaQvyeHxFskwsMQXLMqq7Z/1+5s9pcxOAC1lWke?=
 =?us-ascii?Q?j3csVtw4I0EMQNE22sRkVkOlSe/fTNZ40WURjl4WUMHz8E1wejR3mWzzsBKA?=
 =?us-ascii?Q?ngUaKo3Hcrr/Hd0RYguwl1zqs6uXeXgvkwzWlaMsI5Wy5slMFI79ROadxaXF?=
 =?us-ascii?Q?sVN689U1fMg/YdZhJfjs9FHyRyF0MJkq1t0Viph/50dkXXnNBiFkmaOnZOwl?=
 =?us-ascii?Q?8YSHjMXzEN2tu1aeA0sjRX2pw2Gs9+BwIVB49XF7rkMit+P05VVMWeb0soLF?=
 =?us-ascii?Q?pTfG93Z+MoDKDd8GNo77VwKFW38lSNceywV0AVtotmMPUNilpr3GvC13ep6b?=
 =?us-ascii?Q?Gz1wMx33oKX2pkbVhtOeYR4bPnyh/+IaZGnov8LbkkvXvMuuJ/jEKxA/dHnT?=
 =?us-ascii?Q?/+yBIZLtOhO8Ge4r919kO6KJh652Q9hqHxcQkvQspdxgIf+m9x+8AdsO6VJ2?=
 =?us-ascii?Q?biylfkRpgYWEc1nP7Pfk5mAq62uIUVm5ZFp6OUYeHEvu+cTCSkmhpGH2jGX0?=
 =?us-ascii?Q?innaqTJY5pMdTDAb/ftBBdpsu3FqPcyUEI4gtLoG3KPsJWg3mpN5w0D6K51P?=
 =?us-ascii?Q?hqoIId6klhCRrNA2sYjr5E6t/rSyQSQGm90gE3lxdj/sokBJ6h7kdls7Qy0H?=
 =?us-ascii?Q?DqgyTz05kCjg4fMY3RcnoAKLJugXYvdk0pwrtSbg7YcVvXRADNjhvdFKqCfz?=
 =?us-ascii?Q?tIO7mH6HS/ocqAW6SNqBPP14yd1PmCVZnVdNLYZ6poz6q1AN3QCLPw0namwY?=
 =?us-ascii?Q?u0r4Y25ZEFfOJ14D6fiuOacu7TElRHENxD8VHn9XuUU1HGWxXBQj2NCmJkbi?=
 =?us-ascii?Q?O6ON2dumePFyTm+dOIpgTRH7vw+szJ5q5YYXLOkH3Qo7Zc95YwpLeGxJxOQ5?=
 =?us-ascii?Q?XXscarYu0WLRVjz+D2ruNcOLwK6ryll2VFECGkQTC/bv6xMyh0BWt4KKV1xB?=
 =?us-ascii?Q?B+4vVdlrRX18qvMIDLsnWHzanKFTQhQZrpA5GZ8iyUzqO2D49aKAfl8dOO2s?=
 =?us-ascii?Q?JqAn0GI9kN9LyjoGuVntLL0fH0jY/3gcEvObW7z/zf4TbEw4jgQg9ZCEKd+J?=
 =?us-ascii?Q?cK73fVwQJCEVMj9MkU5KXEqv67AOWuBhgJ1UEsQmBXgVkM+hYbDI6sm0qAgT?=
 =?us-ascii?Q?jKB2U3O3YX+SdL+Y7u/7h7sQkaqKk8+MWjBdgBwHJZtzKi4R7+9JoSgch19a?=
 =?us-ascii?Q?Bp/hgF6Gp6SDAucFLZsM819zBYffx4p95d3JJl1p8lRDt4SRo8L342LL7ZX3?=
 =?us-ascii?Q?fjDAwr4r+sQ/KZaPZbN7Dj193WoISOEJoCbyOjv8guC/AmUM+t+4guwEksQn?=
 =?us-ascii?Q?KR7GAORDeq9weCoBvFemzbdj/ZYDesG9av9mDDn66Qjvl5soxPJZVUpVcyp6?=
 =?us-ascii?Q?DOuXV0s8hkZDM7PloTQnzfBiS1XIYC8QxWGMthAm9HD6RPTFUi1r8c/oVlFl?=
 =?us-ascii?Q?LJf4nLoagdDq+LYu9voR+4sQje2iSnEWM/I8wh67NWAtV99d40v5qX2+W8Gr?=
 =?us-ascii?Q?a5Sf/me4nHn5ezEofGJ+/0mZBM9Cg3VY8/yjrwqXumo1ctJqG3V6b1wskR6+?=
 =?us-ascii?Q?1Wnyi5iaBliouFj0IBepGuwyOF2mzRtTYmGUT0e+pogSNoovKt1+F1/G5d7H?=
 =?us-ascii?Q?/KTPtyGtokJ4BIiYjquqgmf2louk+5rjnrvPbe0uulpn3SHdbXw07jUkqhbv?=
 =?us-ascii?Q?trUYNXLKagvwwnFFEiKzXIWIMrZR7epaWMslEcaNoAlK4MlWyR9EVSIR/68i?=
 =?us-ascii?Q?8z85cLB5zRyi9SILGwXi80OPw/vCW10=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ecfc40-3c11-450c-2032-08de55497a5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:52:00.8490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rphy5Tg2Q1+Elg3vKwpLIVKdkK3Zqz5/bT2ZM5w5m1S6k311m5W7xtpa4TQD3qonq+Zb0ifpsDVN1La3WWGCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7300
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

On Thu, Jan 15, 2026 at 11:18:35PM -0800, Niranjana Vishwanathapura wrote:
> On Mon, Jan 12, 2026 at 08:29:12PM -0800, Matthew Brost wrote:
> > In multi-queue mode, we only have control over the entire group, so we
> > cannot ban individual queues or signal fences until the whole group is
> > removed from hardware. Implement banning of the entire group if any job
> > within it times out.
> > 
> > v2:
> > - Fix CT lock inversion (Niranjana)
> 
> Turned out it was not the CT lock, but work_completion lock.
> 
> > - Initialize new queues in group to stopped
> > 
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> > drivers/gpu/drm/xe/xe_guc_submit.c       | 103 +++++++++++++++++------
> > 2 files changed, 81 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 5fc516b0bb77..562ea75891ba 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -66,6 +66,8 @@ struct xe_exec_queue_group {
> > 	bool sync_pending;
> > 	/** @banned: Group banned */
> > 	bool banned;
> > +	/** @stopped: Group is stopped, protected by list_lock */
> > +	bool stopped;
> > };
> > 
> > /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index be8fa76baf1d..a11f3e572d25 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -558,6 +558,57 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > 	xe_sched_tdr_queue_imm(&q->guc->sched);
> > }
> > 
> > +static void xe_guc_exec_queue_group_stop(struct xe_exec_queue *q)
> > +{
> > +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > +	struct xe_exec_queue_group *group = q->multi_queue.group;
> > +	struct xe_exec_queue *eq, *next;
> > +	LIST_HEAD(tmp);
> > +
> > +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> > +		     xe_exec_queue_is_multi_queue(q));
> > +
> > +	mutex_lock(&group->list_lock);
> > +	group->stopped = true;
> > +	list_for_each_entry_safe(eq, next, &group->list, multi_queue.link)
> > +		if (xe_exec_queue_get_unless_zero(eq))
> > +			list_move_tail(&eq->multi_queue.link, &tmp);
> > +	mutex_unlock(&group->list_lock);
> > +
> > +	/* We cannot stop under list lock without getting inversions */
> > +	xe_sched_submission_stop(&primary->guc->sched);
> > +	list_for_each_entry(eq, &tmp, multi_queue.link)
> > +		xe_sched_submission_stop(&eq->guc->sched);
> > +
> > +	mutex_lock(&group->list_lock);
> > +	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
> > +		/* Corner where we got banned while stopping */
> > +		if (READ_ONCE(group->banned))
> > +			xe_guc_exec_queue_trigger_cleanup(eq);
> > +		list_move_tail(&eq->multi_queue.link, &group->list);
> > +		xe_exec_queue_put(eq);
> > +	}
> > +	mutex_unlock(&group->list_lock);
> > +}
> 
> May be add some documentatin for this function why we are doing this
> list copying (ie., about locking requirement)?
> 

Sure.

> > +
> > +static void xe_guc_exec_queue_group_start(struct xe_exec_queue *q)
> > +{
> > +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > +	struct xe_exec_queue_group *group = q->multi_queue.group;
> > +	struct xe_exec_queue *eq;
> > +
> > +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
> > +		     xe_exec_queue_is_multi_queue(q));
> > +
> > +	xe_sched_submission_start(&primary->guc->sched);
> > +
> > +	mutex_lock(&group->list_lock);
> > +	group->stopped = false;
> > +	list_for_each_entry(eq, &group->list, multi_queue.link)
> > +		xe_sched_submission_start(&eq->guc->sched);
> > +	mutex_unlock(&group->list_lock);
> > +}
> > +
> > static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
> > {
> > 	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > @@ -1411,7 +1462,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > {
> > 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > 	struct drm_sched_job *tmp_job;
> > -	struct xe_exec_queue *q = job->q;
> > +	struct xe_exec_queue *q = job->q, *primary;
> > 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > 	const char *process_name = "no process";
> > @@ -1422,6 +1473,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 
> > 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > 
> > +	if (xe_exec_queue_is_multi_queue_secondary(q))
> > +		primary = xe_exec_queue_multi_queue_primary(q);
> > +	else
> > +		primary = q;
> > +
> 
> The xe_exec_queue_multi_queue_primary(q) already returns 'q' if it
> is not a multi-queue. So, we can remove the if/else here.
> 

Ah yes, it does. Will fix.

> > 	/*
> > 	 * TDR has fired before free job worker. Common if exec queue
> > 	 * immediately closed after last fence signaled. Add back to pending
> > @@ -1433,7 +1489,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		return DRM_GPU_SCHED_STAT_NO_HANG;
> > 
> > 	/* Kill the run_job entry point */
> > -	xe_sched_submission_stop(sched);
> > +	if (xe_exec_queue_is_multi_queue(q))
> > +		xe_guc_exec_queue_group_stop(q);
> > +	else
> > +		xe_sched_submission_stop(sched);
> > 
> > 	/* Must check all state after stopping scheduler */
> > 	skip_timeout_check = exec_queue_reset(q) ||
> > @@ -1448,14 +1507,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	if (xe_exec_queue_is_lr(q))
> > 		xe_gt_assert(guc_to_gt(guc), skip_timeout_check);
> > 
> > -	/*
> > -	 * FIXME: In multi-queue scenario, the TDR must ensure that the whole
> > -	 * multi-queue group is off the HW before signaling the fences to avoid
> > -	 * possible memory corruptions. This means disabling scheduling on the
> > -	 * primary queue before or during the secondary queue's TDR. Need to
> > -	 * implement this in least obtrusive way.
> > -	 */
> > -
> > 	/*
> > 	 * If devcoredump not captured and GuC capture for the job is not ready
> > 	 * do manual capture first and decide later if we need to use it
> > @@ -1482,10 +1533,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	set_exec_queue_banned(q);
> > 
> > 	/* Kick job / queue off hardware */
> > -	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
> > +	if (!wedged && (exec_queue_enabled(primary) ||
> > +			exec_queue_pending_disable(primary))) {
> > 		int ret;
> > 
> > -		if (exec_queue_reset(q))
> > +		if (exec_queue_reset(primary))
> > 			err = -EIO;
> > 
> > 		if (xe_uc_fw_is_running(&guc->fw)) {
> > @@ -1494,8 +1546,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			 * modifying state
> > 			 */
> > 			ret = wait_event_timeout(guc->ct.wq,
> > -						 (!exec_queue_pending_enable(q) &&
> > -						  !exec_queue_pending_disable(q)) ||
> > +						 (!exec_queue_pending_enable(primary) &&
> > +						  !exec_queue_pending_disable(primary)) ||
> > 						 xe_guc_read_stopped(guc) ||
> > 						 vf_recovery(guc), HZ * 5);
> > 			if (vf_recovery(guc))
> > @@ -1503,7 +1555,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			if (!ret || xe_guc_read_stopped(guc))
> > 				goto trigger_reset;
> > 
> > -			disable_scheduling(q, skip_timeout_check);
> > +			disable_scheduling(primary, skip_timeout_check);
> > 		}
> > 
> > 		/*
> > @@ -1517,7 +1569,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		smp_rmb();
> > 		ret = wait_event_timeout(guc->ct.wq,
> > 					 !xe_uc_fw_is_running(&guc->fw) ||
> > -					 !exec_queue_pending_disable(q) ||
> > +					 !exec_queue_pending_disable(primary) ||
> > 					 xe_guc_read_stopped(guc) ||
> > 					 vf_recovery(guc), HZ * 5);
> > 		if (vf_recovery(guc))
> > @@ -1527,11 +1579,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			if (!ret)
> > 				xe_gt_warn(guc_to_gt(guc),
> > 					   "Schedule disable failed to respond, guc_id=%d",
> > -					   q->guc->id);
> > -			xe_devcoredump(q, job,
> > +					   primary->guc->id);
> > +			xe_devcoredump(primary, job,
> > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > -				       q->guc->id, ret, xe_guc_read_stopped(guc));
> > -			xe_gt_reset_async(q->gt);
> > +				       primary->guc->id, ret, xe_guc_read_stopped(guc));
> > +			xe_gt_reset_async(primary->gt);
> > 			xe_sched_tdr_queue_imm(sched);
> > 			goto rearm;
> > 		}
> > @@ -1577,12 +1629,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> > 		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
> > 
> > -	xe_sched_submission_start(sched);
> > -
> > -	if (xe_exec_queue_is_multi_queue(q))
> > +	if (xe_exec_queue_is_multi_queue(q)) {
> > +		xe_guc_exec_queue_group_start(q);
> > 		xe_guc_exec_queue_group_trigger_cleanup(q);
> > -	else
> > +	} else {
> > +		xe_sched_submission_start(sched);
> > 		xe_guc_exec_queue_trigger_cleanup(q);
> > +	}
> 
> There is another place below where we call xe_sched_submission_start()
> in the TDR. It also needs to be changed.
> 

Yep, will do.

Matt

> Niranjana
> 
> > 
> > 	/*
> > 	 * We want the job added back to the pending list so it gets freed; this
> > @@ -1962,6 +2015,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > 
> > 		INIT_LIST_HEAD(&q->multi_queue.link);
> > 		mutex_lock(&group->list_lock);
> > +		if (group->stopped)
> > +			WRITE_ONCE(q->guc->sched.base.pause_submit, true);
> > 		list_add_tail(&q->multi_queue.link, &group->list);
> > 		mutex_unlock(&group->list_lock);
> > 	}
> > -- 
> > 2.34.1
> > 
