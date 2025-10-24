Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC59ACCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 21:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8371610EB41;
	Fri, 24 Oct 2025 21:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBinGnPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E278A10EB41
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761342515; x=1792878515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=smZDwsqqNGppmLaagk+D+ejB1USGGlFk2arVGCWysuk=;
 b=VBinGnPjPD59vh0KP0ZoBB0Z3nC2hvsKFnqSu7nEDqfIc/IBJMfyLWbR
 zb9B6saOXWAh2s3AV0744u53nBKTHxF+pKi/mKhzlX7j76AEnhd2s+RTK
 p7Lb1WX8ClJ/e3AkOqQx050OitGNu4rOh/Ute4EYhGzEheoViFp/S1J+6
 kxSGiJ9QOAPuD/h3LqztZXXshhiPz/dZ0gQfm53A+HYFnVtLzjIY1nn6I
 prHU/TKNQ3miRw3D/mmFSwH+yc8e+kI1EAtF6qSIS0HI9DYlewQkgVwiv
 VxvZPOMvlmbVP8MHlfIeGnGi1oHTzv1UqM53I885QmAOF3ZvedbDxZN7Q A==;
X-CSE-ConnectionGUID: cBZgDrotSfq5vznGhP7xSQ==
X-CSE-MsgGUID: CHRAvgNQRMKWuLCMHGSbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63621780"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63621780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 14:48:34 -0700
X-CSE-ConnectionGUID: +qZZSi9wRUGyy2yJORAYmA==
X-CSE-MsgGUID: utmKFF1rTMa8Zf84+oEGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="189655933"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 14:48:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 14:48:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 14:48:33 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 14:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZbqCQf9o+pHbH3lu40mdRaPhWKEDUnmXtWc6AEtDBRi5+dGlUWHbWH86yK0kpoZuVmz9tuw+unznBmcOEiNYpTVGryI+QRewmibeIGU3WGznHILo+kAUdSnep8f7XEQMypON2UwgJl+e4BYtgbD+GjVB9xiDQcsDhbw/EMWsflW87eM+S7nKGiLMMGt1rfLmw2BFNtMCfYoDbjDnUwRWS78rKwtat2aogkjjO4mafKtT10N3NJfF9Az2e8iJNTgk/mxYX1MWIfEdnNn4Ey+xQ/sLYGwVXLSRQp4qLrB6T2+4f6WPcxWuE2wfQRO0PHYggnC5p5u8kfDQIry2H2vKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCaHPJhl9PIlY4du0eg0rwZ16TDvcXtSq7fwaWtFpes=;
 b=kp63ybsrFB7rezA2BURTBsyuK632ArepXTtM96P3k++u5tr61PbiSP2hcymosS4/d9l43lIi5FpIlL+1HVJBY9DbvBmjAQ5JURcL3nRWojM5Y/aPWQpvcdfBw6iNNuO++MaHN5JEXalg76R7dkTHDI8hMYfqU1soCQlbySe+uVjA5V6lX/q0KUMgv095TeIB0FVO8nYDgOIfB2NltAs+QRYDl6QVeCB/jZ6UuQSdbpyRrYtbvXbAvFg4UMNMU1s4evMmb460WrTxqyBzuWgNI0WzCzU9kfH7P/z3qnYIQW9xCAR2d7tC0MMIh6bN3dZVTuYzxp9dCKEHMtI7TEKFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 21:48:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 21:48:31 +0000
Date: Fri, 24 Oct 2025 14:48:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH v2 2/7] drm/xe: Implement xe_pagefault_init
Message-ID: <aPv0LB2/W+HBR/py@lstrano-desk.jf.intel.com>
References: <20251024180414.1379284-1-matthew.brost@intel.com>
 <20251024180414.1379284-3-matthew.brost@intel.com>
 <d9b8836901d89e7eaf1026ada6dd4e5c8e83a57d.camel@intel.com>
 <aPvQ6y+/Hhh1WpiY@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPvQ6y+/Hhh1WpiY@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f590ea0-c7ba-4402-7053-08de134712de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ejbs7RQNdqEx2izTlaLGqvVQRkOmeXJdWmoSx3BqVs0mrl1zAanNshJxzx?=
 =?iso-8859-1?Q?m8o/VgLpO0/lg2JUQmpsv7/TLu8ibN6UeW2ncfA51c/VOvDf/sFkFboPTo?=
 =?iso-8859-1?Q?5DCsh8c3TFU4L3nOR8Hp/DJEp82mHGoX4zS+Ni5d2LawUnKiqiRdoYTGcI?=
 =?iso-8859-1?Q?O236UIo6riAp8XkVNzUqaQzsOtO5C0NrmUYRS3aqZdrPwjpHupo5quDduG?=
 =?iso-8859-1?Q?3twyIjVYZ0Ia7CuPKC8j6UP9z9EZFTxOmHmSbQOSdheCCRh8zGhuh/Kxir?=
 =?iso-8859-1?Q?XmR5DuhOMUfN01xI57mwy6nH+R5TAaZkYIpMRrFklH+UvmKmQOIAEHKetR?=
 =?iso-8859-1?Q?vi5q6QHnjYw6spomBAwwYc1TUEdjNPksKuM0AgweiYGe+TdCiMOqwBm5k4?=
 =?iso-8859-1?Q?9cYAy3hIMKfCSREDBtaULfI9mJHliinT25Rwv6ge+mfv03TtNIObauIxUd?=
 =?iso-8859-1?Q?NBoNo9MsHgLQLG0e+HTugozbGMMlb1Vv0Pz1z3PYqI1Yy1Wz/sknttFA8X?=
 =?iso-8859-1?Q?r6mvkTfZQ36MvsJSC4RNuy2zAuj/yUZyyYsS7Sx/KFA8Y0BpckYbTyHNC6?=
 =?iso-8859-1?Q?SiQ2wlObyly4nsGg0qONNhTWXkjEC5dJMrhSWV2y7IW4RO+ongHkdgBEY5?=
 =?iso-8859-1?Q?s6mY3eQ3uj7ZKVfOsnS87WSmUp8h9hONU/Av4+nCAu0Juj/qMEWXpmP0AT?=
 =?iso-8859-1?Q?vNgIMh3/KTA2IYRoAQ1EtVDOe8Q0r3yBAATa2UA5o0uoHCPLgFADiayJ5P?=
 =?iso-8859-1?Q?6Ukjw6GNLHBisTmtqSE0B8SF6Nt5FUQeRODSrk+tCvdPsFVV0z/Ej8fOn+?=
 =?iso-8859-1?Q?c+o2Qt3NLyycrbGwjFOkMWiqQ5gmsqbWjdz8P1XRTs5grkO7YtAYGXgkWY?=
 =?iso-8859-1?Q?Sbi9zIrL8tddgDWkY/99yiVL2/CSnAZsdeKsPoKSOhYUVaSoduDthEiWUd?=
 =?iso-8859-1?Q?HF7Uas8z6teAmrNzjImFSIowrlzYMWECDoXgnCpOom3uOQfATwn9Y+iyjP?=
 =?iso-8859-1?Q?dtMoItqmdIgTOWsHzyFchhU/F9xJKXRvMQlaLJFBJbOtgGYifDCPJE7aFH?=
 =?iso-8859-1?Q?LDxZdw2dU2yMr65bdl/rwGqPg9DAOBAWYxmBm9kKh75CoyJYryQBmRRVHc?=
 =?iso-8859-1?Q?fvl19kRnD/tXy8RqrGCSt7qNTVKUxse7AYimLG1C3/JoDdwT4XAEhta8uT?=
 =?iso-8859-1?Q?InXzwS2W6KxOSWpvRlgAjEMabseqIwRWxB+u8H/yzPqpxn2HxzqTQ0BLWe?=
 =?iso-8859-1?Q?n7nntcFQV3v3FzFLXAhvWs0qjZ1sB9vptY3h8m5pTjhOncZnnt/+43FT3L?=
 =?iso-8859-1?Q?0I2sz8T88V4tOHJJQ3x81ENvap27TQMmBFkU+pxQZTn8wZtqnaMVMau6v/?=
 =?iso-8859-1?Q?MmhHnOBhY/gzSInNMCSvYO6c74YMmlpmIrvigHFTVafXrXLx4dMs9CRVZQ?=
 =?iso-8859-1?Q?heUk9H1CLjfs/7pYg4eK0O5hihuY4cw6PF2t9nSvexb/ZWgO8Y3xtKt+xd?=
 =?iso-8859-1?Q?KsXfzB6WyQqDIJPKByat1H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aeqyOUJX40L1X4dJ4MiIWFtluEdMB/54NFNl1FiWUrYkTGPVzW12tO7NRo?=
 =?iso-8859-1?Q?Q8TQbMOimAxYQy4VVe9hTm4DZZm2iihuQUCf5tJ/wN4evGt548WgHkA9+C?=
 =?iso-8859-1?Q?HGpiyURdQUqwPR/juqIplC1z3qo78ugNF/G8UxuX5UHj324EL9+6omhS97?=
 =?iso-8859-1?Q?rO0NVRCdeDlTJDUOHtPDrhdToJCw/ztGofZBAi5rnE6NapMlGXhNex9Eut?=
 =?iso-8859-1?Q?8WrANtPlgYAR0HSV4CgfgsLIsGGscNti3zk9UtxsVlPTQGXqhluXJUhfN0?=
 =?iso-8859-1?Q?q4ZUrdP7rbLZOy3IPQn+e+IVRXQ3Mx8f3j5986wJoZCGlJDkXDuewETRs7?=
 =?iso-8859-1?Q?QV1kyDAA5kbckFbEtuFm0De8NmoBkFxb42m3P72NTSGxa+EKj4VzRVFiu3?=
 =?iso-8859-1?Q?WFaavMMSezv4lsVaVJanNYFKeW//UJiG/6YoEkT0tmeoTjLjgE4rFeaEvr?=
 =?iso-8859-1?Q?CbZ7b2tGEfahDjnkJ7/GSZzgXxeZOrsRUyFRu3s+awHpIIiQukwmt7HOnE?=
 =?iso-8859-1?Q?3F+5rMtvH54jWdxhoJQV/J1/2xLh76HS3JIobzy8Yc+0ZSu08/RtH2SM5o?=
 =?iso-8859-1?Q?FAZ4trWz09z54Ji34nb3YGap63tLLpGMWRFLIBImQ5986bveItcwrt+nD+?=
 =?iso-8859-1?Q?DdHgo0a9FrGGWdWnmGa3axaEcR/oEnps8qIuJm45nmiOOc0oDUFLqvSmaa?=
 =?iso-8859-1?Q?i1yQ2l0AwoEIExmF3wegaoioHCMkB5oDsFh49nKlWu7CcLtrwIHbBfFxi4?=
 =?iso-8859-1?Q?+RbbJqsdtKzdciiX9gnYMO5cfE1rbkxvKLTX4bDXtANCdxagCxhoP4TwwZ?=
 =?iso-8859-1?Q?lSff8DArK395oLXXycnwA2L8FPdq0DeFLrHVxH5iihbEkmcchqsofe0eFW?=
 =?iso-8859-1?Q?iavxWRg5eRn4MlEgRZlgXRPgLrP6qD37LjVmxq1IbNO6JAQDSauC9BF5sW?=
 =?iso-8859-1?Q?LWnwsQtCbCDROB1E3Y332jG9n1ILSrEWhDi8YrBhNJc4/ZWMT80wTPtOjB?=
 =?iso-8859-1?Q?lc88PvKFjaTx1qdbjOoeoSfXJ4HmJ8Ok8ve1Go0gYlf7mTn256el6zSbwe?=
 =?iso-8859-1?Q?oJuttKSC/CwGsd504k98jU4IYnMBTzJidgw+nzg69ga9kB/qwuz+8stM/S?=
 =?iso-8859-1?Q?GDiJOxMJU2UhnUL8LZd0KbCsfv0Imc93ztJ9CsFxlSiPgbGrI45KsXt1q1?=
 =?iso-8859-1?Q?6TNVr9woBHBCEYYLUbyH51kFtEcIlqL3a5XM/PRLXTrW1Qqgiy1qNGBsez?=
 =?iso-8859-1?Q?O4AvO0v+v/U4KynWLpFx5ReG4AdbL7HxzOUJyDRViTrpGt7vJsUYPwzkst?=
 =?iso-8859-1?Q?dhcTZg0bc/G0ofRq87B7zDg6xYOG17ZziYgBEWg9OB+ftpyvBRuHhUoL2O?=
 =?iso-8859-1?Q?AkZikFJnBYx+85gRoo/+jn19k53ZJB6c5/mzhyJOl4fr9FbkbSo/Jruz+q?=
 =?iso-8859-1?Q?z+TV2YBNEfWSflVUG6EbVL4w4TTsR/4ogruupkBVbOMlpm73Eu+XBDlxeo?=
 =?iso-8859-1?Q?F8U9g9TkAcMkRgwQM7dsobR8z385QXTEis8hHvPOdhDE48HdQ9aW/N/n7B?=
 =?iso-8859-1?Q?ushV/qeFIodjKBdeNsH49MvrK4G+O+GPhnKtxjlxUW6hcoeO6zTPA5rRhF?=
 =?iso-8859-1?Q?t33nwXieImZ2rs9mwXwciWOWO/6pWIyvuNs1NnTYz8KdiilIm+EdnOWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f590ea0-c7ba-4402-7053-08de134712de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 21:48:31.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z54y2z81fHA79FDFTL6AOPop/115kEPuDO84z7KBf81h+GQJg9XcxjxqnilsWDLmJN3B8l+Hd3/XW+61vFkilQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
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

On Fri, Oct 24, 2025 at 12:18:03PM -0700, Matthew Brost wrote:
> On Fri, Oct 24, 2025 at 12:55:23PM -0600, Summers, Stuart wrote:
> > On Fri, 2025-10-24 at 11:04 -0700, Matthew Brost wrote:
> > > Create pagefault queues and initialize them.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > ---
> > > v2:
> > >  - Fix kernel doc + add comment for number PF queue (Francois)
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> > >  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++
> > >  drivers/gpu/drm/xe/xe_pagefault.c    | 93
> > > +++++++++++++++++++++++++++-
> > >  3 files changed, 107 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index 5f6a412b571c..f4261a461ddb 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -52,6 +52,7 @@
> > >  #include "xe_nvm.h"
> > >  #include "xe_oa.h"
> > >  #include "xe_observation.h"
> > > +#include "xe_pagefault.h"
> > >  #include "xe_pat.h"
> > >  #include "xe_pcode.h"
> > >  #include "xe_pm.h"
> > > @@ -904,6 +905,10 @@ int xe_device_probe(struct xe_device *xe)
> > >         if (err)
> > >                 return err;
> > >  
> > > +       err = xe_pagefault_init(xe);
> > 
> > Before we were calling this with the GT init. Should we move this above
> > there? Or otherwise why is this later?
> > 
> 
> I'd think this matters as it is a software init.
> 

I think you are giht actually, I believe is complaining about this.

Matt

> > > +       if (err)
> > > +               return err;
> > > +
> > >         xe_nvm_init(xe);
> > >  
> > >         err = xe_heci_gsc_init(xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 6a62b520f5b5..a578781cc28b 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -18,6 +18,7 @@
> > >  #include "xe_lmtt_types.h"
> > >  #include "xe_memirq_types.h"
> > >  #include "xe_oa_types.h"
> > > +#include "xe_pagefault_types.h"
> > >  #include "xe_platform_types.h"
> > >  #include "xe_pmu_types.h"
> > >  #include "xe_pt_types.h"
> > > @@ -418,6 +419,16 @@ struct xe_device {
> > >                 u32 next_asid;
> > >                 /** @usm.lock: protects UM state */
> > >                 struct rw_semaphore lock;
> > > +               /** @usm.pf_wq: page fault work queue, unbound, high
> > > priority */
> > > +               struct workqueue_struct *pf_wq;
> > > +               /*
> > > +                * We pick 4 here because, in the current
> > > implementation, it
> > > +                * yields the best bandwidth utilization of the
> > > kernel paging
> > > +                * engine.
> > > +                */
> > > +#define XE_PAGEFAULT_QUEUE_COUNT       4
> > > +               /** @usm.pf_queue: Page fault queues */
> > > +               struct xe_pagefault_queue
> > > pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> > >         } usm;
> > >  
> > >         /** @pinned: pinned BO state */
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_pagefault.c
> > > index d509a80cb1f3..ea3813704242 100644
> > > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -3,6 +3,10 @@
> > >   * Copyright © 2025 Intel Corporation
> > >   */
> > >  
> > > +#include <drm/drm_managed.h>
> > > +
> > > +#include "xe_device.h"
> > > +#include "xe_gt_types.h"
> > >  #include "xe_pagefault.h"
> > >  #include "xe_pagefault_types.h"
> > >  
> > > @@ -21,6 +25,71 @@
> > >   * xe_pagefault.c implements the consumer layer.
> > >   */
> > >  
> > > +static int xe_pagefault_entry_size(void)
> > > +{
> > > +       return roundup_pow_of_two(sizeof(struct xe_pagefault));
> > > +}
> > > +
> > > +static void xe_pagefault_queue_work(struct work_struct *w)
> > > +{
> > > +       /* TODO: Implement */
> > > +}
> > > +
> > > +static int xe_pagefault_queue_init(struct xe_device *xe,
> > > +                                  struct xe_pagefault_queue
> > > *pf_queue)
> > > +{
> > > +       struct xe_gt *gt;
> > > +       int total_num_eus = 0;
> > > +       u8 id;
> > > +
> > > +       for_each_gt(gt, xe, id) {
> > > +               xe_dss_mask_t all_dss;
> > > +               int num_dss, num_eus;
> > > +
> > > +               bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> > > +                         gt->fuse_topo.c_dss_mask,
> > > XE_MAX_DSS_FUSE_BITS);
> > > +
> > > +               num_dss = bitmap_weight(all_dss,
> > > XE_MAX_DSS_FUSE_BITS);
> > > +               num_eus = bitmap_weight(gt-
> > > >fuse_topo.eu_mask_per_dss,
> > > +                                       XE_MAX_EU_FUSE_BITS) *
> > > num_dss;
> > > +
> > > +               total_num_eus += num_eus;
> > > +       }
> > > +
> > > +       xe_assert(xe, total_num_eus);
> > > +
> > > +       /*
> > > +        * user can issue separate page faults per EU and per CS
> > > +        *
> > > +        * XXX: Multiplier required as compute UMD are getting PF
> > > queue errors
> > > +        * without it. Follow on why this multiplier is required.
> > > +        */
> > > +#define PF_MULTIPLIER  8
> > > +       pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> > > +               xe_pagefault_entry_size() * PF_MULTIPLIER;
> > > +       pf_queue->size = roundup_pow_of_two(pf_queue->size);
> > > +#undef PF_MULTIPLIER
> > > +
> > > +       drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d,
> > > total_num_eus=%d, pf_queue->size=%u",
> > > +               xe_pagefault_entry_size(), total_num_eus, pf_queue-
> > > >size);
> > > +
> > > +       pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size,
> > > GFP_KERNEL);
> > 
> > Why devm here instead of drmm? I see we're using drmm for things like
> > the mutex init in xe_devcoredump_init() which happens before this.
> > 
> 
> Yes, this should be drmm.
> 
> Matt
> 
> > Thanks,
> > Stuart
> > 
> > > +       if (!pf_queue->data)
> > > +               return -ENOMEM;
> > > +
> > > +       spin_lock_init(&pf_queue->lock);
> > > +       INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void xe_pagefault_fini(void *arg)
> > > +{
> > > +       struct xe_device *xe = arg;
> > > +
> > > +       destroy_workqueue(xe->usm.pf_wq);
> > > +}
> > > +
> > >  /**
> > >   * xe_pagefault_init() - Page fault init
> > >   * @xe: xe device instance
> > > @@ -31,8 +100,28 @@
> > >   */
> > >  int xe_pagefault_init(struct xe_device *xe)
> > >  {
> > > -       /* TODO - implement */
> > > -       return 0;
> > > +       int err, i;
> > > +
> > > +       if (!xe->info.has_usm)
> > > +               return 0;
> > > +
> > > +       xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > > +                                       WQ_UNBOUND | WQ_HIGHPRI,
> > > +                                       XE_PAGEFAULT_QUEUE_COUNT);
> > > +       if (!xe->usm.pf_wq)
> > > +               return -ENOMEM;
> > > +
> > > +       for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > > +               err = xe_pagefault_queue_init(xe, xe->usm.pf_queue +
> > > i);
> > > +               if (err)
> > > +                       goto err_out;
> > > +       }
> > > +
> > > +       return devm_add_action_or_reset(xe->drm.dev,
> > > xe_pagefault_fini, xe);
> > > +
> > > +err_out:
> > > +       destroy_workqueue(xe->usm.pf_wq);
> > > +       return err;
> > >  }
> > >  
> > >  /**
> > 
