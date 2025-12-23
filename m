Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F3E748F7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 21:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7B910E2CC;
	Tue, 23 Dec 2025 21:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnyGUqSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E7C10E2CC
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766526316; x=1798062316;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UZ/oaKWpevE0racbpvlrZqYRq0SOmCNDBKUuWWT1FF0=;
 b=nnyGUqSJlyiKjNr3jAYgOoNeCSlm4eQgXGdiG3EIOc+hWNXhPwLdbVcI
 ZncVcbRxge8AtLNg6WzemW8KZB+L7iWttbCQMv2ZbRtYSLJyFSGLoqLqK
 6B99TZHUDsIprXaZrW4vs0ZdECkyG6xM6YKVtCDR8Y3PImEiGY7XpzHB3
 yy9dcoawddVC7p6g2TGnRYyIRhe+aCCysRLdEYiwVy1dF22jDNzSovtGL
 3tvt+C+BlOb9MHAriH82BBkiN7H5rJhxpqRh8pCkg8Y+lFuY4IxlY/Jby
 4+Zzu+8X3PNPPFeMZrMtgNhk2hhVYI1EdzaFBniFd+H+eqhROuOzFNfS+ A==;
X-CSE-ConnectionGUID: 0pEmab7tQFyybj+8dBLoPQ==
X-CSE-MsgGUID: N3n0cIgrR3SQ6kFU8bva8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72226797"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="72226797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:45:16 -0800
X-CSE-ConnectionGUID: tJ7ncUlOQliFx385ZoU3Uw==
X-CSE-MsgGUID: G6cROPxORMCIoeqbvEY3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="204375369"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:45:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:45:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 13:45:15 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sd0hFGlI9l5QfkDVJTUSy5QUmX4vRZHUIB4OXnfi9pK1NC7pFcjFINU4cODikU+A1ZLYwEyvYhLeL3yN14qa0uRTo/WVf3Kl8sVSYfiOy6812CtjPSp7EF4xIpC1V8JggD1+8QT94XWpGiQIQTN8dg9eV46wYd4+UmUpHEuoQWiwKUJQbXPD24HmrsIlR0z4m5Q6C6wF0ch9Key5cflz3WOGwAreRyBYOACHfVS2EP0dcR+S5nED2zqyfN8rCuoLUQ7fxFIZTpXT9cGbwV6c4uHnNdnCOQMnwS6zDCpJeyJcO7qFE/UFqtn57dvlVAsgujl+aHZ/q4T5IkCHTZ9y/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgOMYhoa5nI1LjqUUNkFq0arQluX7XVXWDRC0sF5eME=;
 b=eIvjm3yq3IFKcb3AxjvM0oLmwPwWDOkpmeIsfiEfiiHMhJq064cGoWFray4Q/DmLU/jh6wtM22z5ZgOHpaUtLd+gKYEY+wntIh+KKVNVRZtYmBdG9yeIXS6ke9tNYLJIxpNm5Yxmot2HHuXWcBngbA7Vxp0YHxw/KaPdg+dpHYQU50Yyc9l/Kp8lhvUPBdjVP1VHvnQ4lGLJfUvaj+wWpeNs4zG+PdDSR/iKvESSl3agvgCOHJXYpYpN/ybggGnbU/1S56Sq56ZbltvAST+goRwhPjxrxWjo8mUBM6P5K5sOYCl/40wTnvKk8whKwMYvlHbkEuwZmOZd7mtfYb3K2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 21:45:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 21:45:07 +0000
Date: Tue, 23 Dec 2025 16:45:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>, <stuart.summers@intel.com>,
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: READ/WRITE_ONCE ct->state
Message-ID: <aUsNOudeywmMtGdP@intel.com>
References: <20251222201957.63245-4-jonathan.cavitt@intel.com>
 <20251222201957.63245-6-jonathan.cavitt@intel.com>
 <aUsLbPyLcHFzAlTQ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUsLbPyLcHFzAlTQ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 31775df2-2422-45a8-4462-08de426c8a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2AEU6iiyC37bH8OA789T0IB/Jqc6MnhBL9ZNJOZlQ8HGjNwQ8dmjjCY/pyMV?=
 =?us-ascii?Q?evUVkSGAl6MhjlNuDBvN21eV2CEetMsPnlsy3L129SS0G5vPjeCGIev6iqvg?=
 =?us-ascii?Q?k7eZl9EzB5AU5bjb29NDXLTWjsfWLaxxjGYRrFh8NaTBYZaK4dW7d1Be9t2e?=
 =?us-ascii?Q?Z/O7T3/WcTKasd8eBjm2VUrJqM7384nm7c0BOO9gcCYdJ0U+JXF02vW9yDXJ?=
 =?us-ascii?Q?0gsNaY5MnfD8i609RqZ+cU3raXEtabYmM3Ss5r7wxJy1SH5maun9l1J5f50o?=
 =?us-ascii?Q?ZEyNC14IlN3NjQXxa2LHW8u8SE06lcEd+rLMcFZ7M5Sue2BRPazmWwg6k5t4?=
 =?us-ascii?Q?y3Ui/9xOzv8CAXAWOs6IbJUNZRJkEEXG9LqHdA3Rrzz3TXu1SEX/tspJrAuv?=
 =?us-ascii?Q?D3Ex2GMyhJEE2/h8mrKbBdBnTRK7qIdGleMzlf8tMEQyLMUR42RnYDE635NS?=
 =?us-ascii?Q?EdAGDJ/J0NbVLpMu1v+YlPcqSCfkCMrfpYIgJ9sYhqe7VLeI0pm3WwSjVDAe?=
 =?us-ascii?Q?Ciy+GLEbN/DMIpRlN+1/A8qc37FkxmDYqgGRWnQWSnorSaAlI92TxY3syuqb?=
 =?us-ascii?Q?+hQjVX4QMjp0NYYfWuLAfO0tJnsDO7A3LS9UEi+AJe52qtKkVuvXWaUB1fWz?=
 =?us-ascii?Q?JoFGKrW4fiqbZLLVJdlW0zEI3pJXHnRvMj9CGQ7oqe2JRaVVIeBPaibNjFsd?=
 =?us-ascii?Q?eMBpUdI/uye5/stmoCLVTXSQaxy+U01pmVzRsdZgIJqTOKSlR53WouPPd6sT?=
 =?us-ascii?Q?9fqgmMq3L5XEuI8aDJJxakLm82BRl1H/JilRezZH+nswIYtnSSKSF6pHESEE?=
 =?us-ascii?Q?N0oURAtesXoqKkAH9A2XuF850ZpUR4ZHMVtcHdESECMGQGi4+9zs2Pb3+8kg?=
 =?us-ascii?Q?0PbYVoScrMSAVoqMbhSftLKUDDW+mO3fuDHXvRJdTNp/ITJnRRbs/Laax7Dc?=
 =?us-ascii?Q?4JCWBD3BxfjT0Gei+rMBjEx1AYXcpK+vzOk20GYeMhhXZu3XPbtjZapLPgcO?=
 =?us-ascii?Q?s3A0RGwiiHIaVVj/RFcDk8nBGGa2j0gltDS1ckD2d1Q5q0hzRrngNrmw+U6M?=
 =?us-ascii?Q?ynKTideqFoJqh7EgFqGL64sTq9LCzB9YjCEMW1IsFZiooCQMScI/dMEqdWLh?=
 =?us-ascii?Q?gKX69o+WgTJ10vozmLMcNPZBeMtGyAEidfpFkAe86yKx+0DI14kOCfpwaOvS?=
 =?us-ascii?Q?162VrjrSaAkROoBrleNQCWoASRpEfqEA2dp9LEoy8y5T0jA3ZOmN3L2i3hUI?=
 =?us-ascii?Q?JthlfKTBqQPmg5GjAM/6ZYBUUlVG0N/jjkMIHlH0epAHRkMA3aT56iq7qYjj?=
 =?us-ascii?Q?8bK8DeiWu6yO2dCwXcXTL612WqG/CPyVG4/Cw4yYLlseUo3xWO0/j0zojnIw?=
 =?us-ascii?Q?03Mq6M9DKV5GouB97r9JpHHKsxC5dZyUEHa0fpMGMuJrxMKRldMXTNtqdMJ0?=
 =?us-ascii?Q?zjeIA1SiKYi+RyhNMIX6zzAxPYDv7w6k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Odx9NtoKi+SBLZwCtEAQBx0o5zplmjSM7nRyZ5n+EC3UrkhwTwe/FTiWtfbX?=
 =?us-ascii?Q?dMzmJO7iLmjzUWDr8Ul3E4+lzeGALrv+xiAs7UeV0gKVGJeOJimJccj34sH0?=
 =?us-ascii?Q?iK5Mk2GmZxvgSfe08FCGyBZvczjHNUqLp0QYZ3hMlTFiKybzMCNumz4ISEwr?=
 =?us-ascii?Q?DP5is2xzxibDBprBByrKw5jZ2uwdi3d2sXMlic7iZzm8iwQ0EfoKyZCyv0lh?=
 =?us-ascii?Q?uhhdZyLfbHNGXkPGIl76IyEzIlwLzUYdoSq4wlnkZba5q1FHeeBiFVLle9rU?=
 =?us-ascii?Q?6VWeB7N/2Kopj8oQLUpDdLhQ06FJdLthEJdyhDuUH5UB9/Zh8IcdoLpy0M9m?=
 =?us-ascii?Q?6dsMpwlh30s5XHlsnlKXc4r5FKG3QJBGOnbz9JQK6W3PLixeRWCYyBWDjvrf?=
 =?us-ascii?Q?DxF/5DectuRE8M6HJldZaKVF+aNjOxahBQnCjPwr6eKzSBBUoyLIh9k8gCtw?=
 =?us-ascii?Q?NpVx5IQL/RTtwU2HFJyCVjGRhQoqEdo+7FaWUuxo1nUH7govnVrRsvklAxKT?=
 =?us-ascii?Q?ewYVTweOz8uwWe4ua40muGQV9GB6TdfrHoWlA+fJi22klvGQtVWGm5nNoU9g?=
 =?us-ascii?Q?S/5rMio2FyzwZkDi4KJ0gu+YyAhCi2uE0MUApVkVLuy5pKFtM/AQ253bRSB3?=
 =?us-ascii?Q?tYKbHYFnKtyprQ7PCJfZ0Op6jPcML4U/WNb2c05jZsDgPNk8wfvsSA8nrlaQ?=
 =?us-ascii?Q?KW62i2Myy/wWYgxTdAu0YHvJJ51niHfa9k3Gig7cQgcc+Gp+DSg+MwhoGm9a?=
 =?us-ascii?Q?kPdlAVQ+SLkl9hpOuVT1GOb26epHhK071BF5aCYd6VCjsZHaQoT/JrAt0X+2?=
 =?us-ascii?Q?Wyn6OkRGfxadWho5EwLRYX7h+TY6J+fqqeV7HJcHSE+4Ox4I7qdC+260yA+M?=
 =?us-ascii?Q?oStVX5YmmjgloB6p+HanpCyuhdUp6/Yr4OM303t7C2gJ0grjYohsGGqX8NzD?=
 =?us-ascii?Q?LACx7bQClwAIYm/6uNKgJyu4Tnbf2iUiguxzCBEJsrQeZtyGuR+43WnpFgtG?=
 =?us-ascii?Q?ziFoWgxRr4I/MCNkZi/z/gDH9GCfPit31q8YeUxapt6ZQZ2G7pyfeJm8FXSi?=
 =?us-ascii?Q?TJfjJ2XVPvAZpyCzqkfUwc7XcvTLBmFBwYi8CCqP8G9EbpH0osEXKr/OfYpC?=
 =?us-ascii?Q?OarBKYpMrI8sl8b2frCNd+yytjXEceELyadC07WVrjFz9Ann6BROnezmCIqQ?=
 =?us-ascii?Q?WAOmnSPyxf2UUS1+KYc1xzkqJ/TJIfb99SXR/fyHdYjipR+mfK9ACjaLXmys?=
 =?us-ascii?Q?yAbP6QULhX0/23MrJ/dZpHD8n+UbRxE6lvriK2n64bEb/IzrUniI3bhwkivA?=
 =?us-ascii?Q?1f9G0EOvFnzXuJ/MqMppzduY+wkxcJvMgZtPxYbIkwb5tisiD/312IZp7sS6?=
 =?us-ascii?Q?2NHCjbx0Rr3aCTUK5RM/dY8EDHkgzsrL+sGku2SRDeQgKQz7znNNu7KZYQUo?=
 =?us-ascii?Q?cPQH9m87LZSiCibrRQuyfnB5caK4oJCKvbJuzxJAa5rCkkMei5x9yq2s2Quu?=
 =?us-ascii?Q?dYeIwf+wYReecdsh8kjbpw1sl1Ac06Sc7xUu+Wmrv+zGiT3Fo2gAQNgcmcXS?=
 =?us-ascii?Q?CrssS9mPwACbZ1fTJRGlqT/QiPlJtabOWzkCZzBwudiG8DQnZqlqX6rNI882?=
 =?us-ascii?Q?Tzu5GQ8CkCg6BT1D9aGRIikAQx6GRNjqad4D2e0V2mOP7/RQM2fH736rR/0I?=
 =?us-ascii?Q?OkFOL5laSgrpewD0XZY9e+w9q7PBw0AgAONXmrRW+z2TobsExuc1/wSC9vgR?=
 =?us-ascii?Q?b3GzTK9KGg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31775df2-2422-45a8-4462-08de426c8a39
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 21:45:07.8280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKNmkYiPfJDQp0fk6gNgJoVBEb/FgcxbaIznU2W+iLox3XwsSFv/cpsvdmNVb0YhOFFa3CBEFWkxFJjs2ekWIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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

On Tue, Dec 23, 2025 at 01:36:44PM -0800, Matthew Brost wrote:
> On Mon, Dec 22, 2025 at 08:20:00PM +0000, Jonathan Cavitt wrote:
> > Use READ_ONCE and WRITE_ONCE when operating on ct->state
> > to prevent the compiler form ignoring important modifications
> > to its value.
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Patches pushed to drm-xe-next. Thanks for the patches, reviews
and patience...

> 
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 7 ++++++-
> >  drivers/gpu/drm/xe/xe_guc_ct.h | 6 ++++--
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index f2148a8bf208..dfbf76037b04 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -529,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
> >  	if (ct->g2h_outstanding)
> >  		xe_pm_runtime_put(ct_to_xe(ct));
> >  	ct->g2h_outstanding = 0;
> > -	ct->state = state;
> > +
> > +	/*
> > +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> > +	 * xe_guc_ct_enabled.
> > +	 */
> > +	WRITE_ONCE(ct->state, state);
> >  
> >  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
> >  		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 5599939f8fe1..767365a33dee 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
> >  
> >  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
> >  {
> > -	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
> > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
> > +	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
> >  }
> >  
> >  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> >  {
> > -	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state. */
> > +	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
> >  }
> >  
> >  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > -- 
> > 2.43.0
> > 
