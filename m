Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FC0C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC98A10E65E;
	Tue,  1 Apr 2025 19:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GK71AN8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC9310E65E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743535161; x=1775071161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r7P31inaIQH7JXagxu0+OBFjUaoFTiwlsN3ptq8dV1U=;
 b=GK71AN8Q1nJvOePj7IwXDqgssIifWfBDqZdqtz6qRODx4AVdz2slQgzF
 0AZI9vlILCh+Tw5L86O2ZaOl3TNVfbVWc9j6S0JGnHx4egEMHfSab0skl
 AFPMqq2LdeYOjnDsHhFds9aAWUcuLVH/k3NOlD2wjWvSKKzEhdKh1wfrk
 Ua1o6T+XAfn0qY6SJ7s3Xcp9942gkh4LAJuWqWdVZx0qQejzqRxvrAK9M
 r+Kb0HFk3xW7ycYvg/qelTAjYkU5ugXPuSTZn3kIUURTzxeMvm+kCfrc6
 BIwPqXxDYs1vTao+HOCGNFH3GRAD2EmMaLXQlOi0UvavSXHxs+RSSp0lQ g==;
X-CSE-ConnectionGUID: CrkDi0yLR5WjqvUGOHqztQ==
X-CSE-MsgGUID: mA6DG0PdT4m1113ufFP9UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45049436"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="45049436"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:19:18 -0700
X-CSE-ConnectionGUID: PwF5KRsRQciiMaxiQQdRhg==
X-CSE-MsgGUID: ZE9Mslz1R4aNeccy0eY4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="130590930"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:19:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 12:19:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 12:19:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 12:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYrWRWw5/zf8izs7i6fTnLNetR88qbTRV+CyPSjngCrhwHxtth3ee1P7ItM4KWbAe2wnf92Bs7b43ksknqZMrdNSMi0lvxVdrHRFYyIhPkhxsCcr8dKE3lv1pLeVPml745sNY02AoYGtULmA4sluJraBffaWh8oQrkX9xZpa7aPqfQNQNgdHY487XBCUUTKn5lHbh31yJZjbQ89mWkwzNWfYKpUSpwusYX5OjZ2FIpeosNP8T45rQNbFjoPdL75n9qHPczjsUeXreGs0P1tHg4MscwyH2gP11cDnHQKWQZN1IulrL/yqL605I/vx/RBStaFdgBtyw90WmwQsBNtUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7P31inaIQH7JXagxu0+OBFjUaoFTiwlsN3ptq8dV1U=;
 b=L0Lj8fhaz41/bFJigjqYQ0Wq0UCTZvyUlWBdXLVCGGyqY9fm5CVyXqIJ1Snm8e+X90v3YUikAE8Gl1VPRIqmifanPY8B0g1X3HuzUMbDzvYw/ylFgE9oiZw+dphkWpF+xTIN3TKZFhPWqoAOtfmao5itOqXkeclA3Iyg90egVNO9blIEYEXB+bNUobTD9tBNdfBX/kUHOoHzaULwBNdeHWFsarCPb+cLrsAlnc4IL85SsEDQKMdrvGMTasCGPOy4Nd7cRRySH038ZQ/Uoe15iAkOrhxANzcVD7hpEhieIUCGiWFbEjbY4KvIhEF3w7IZJpUlrqmNPQS2Tr3Sp1Jxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 19:18:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 19:18:33 +0000
Date: Tue, 1 Apr 2025 14:18:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/8] drm/xe: Only dump PAT when xe_hw_engines_init_early
 fails
Message-ID: <6pamhhpkbcltjpxw6vjpvctdq75vrzedmdgl76zf5pdb2rklew@ui5eqpf64efu>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-6-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250310200653.89731-6-dev@lankhorst.se>
X-ClientProxiedBy: MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: 000b2de6-1aed-463f-9585-08dd7151fe8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YJAH3meqbcC1nLISXVea6GlAWb+vpZFqLBrbJqgSihcU/RvI3CK+kEgCsSiJ?=
 =?us-ascii?Q?2DHSf70alt2K1fscwQNPHy/+Oi54JxhLu1ktXrQjju/3Mo/G/dSymSZabr9+?=
 =?us-ascii?Q?6HDXV9j7g+bPrHMeszc/tUMVgFVypiZ7VU/bXew3pfgbj0KJ9+xZpB+Sn2Em?=
 =?us-ascii?Q?I0EmUuH6hZOT0dQf0UJCABYAn7weWYWx6iFOItsfxGKsikLIuFwJEszz3aLg?=
 =?us-ascii?Q?/Icg0axejFuSSGcOdide+8IAQmLS+Dar9UWKWIxRqBZXT/gaRGUUDpPr3yr3?=
 =?us-ascii?Q?01db9lvIin2Mp9ztEdwXQZUxwcuCbwEo70AUb1OvjJOf1L1fBIky+fGUb1fG?=
 =?us-ascii?Q?s5IO6/nRBMFrvxmOV8phgzdCQR5BKjiK7Dmc9iyCKFgP3XkfyntWoBAsvfLT?=
 =?us-ascii?Q?i9xJlmGY3wNnSOLu3o7X8p5cejzYOdD+lBgxzJyYKJfa/N9veIs4X9dc5/fq?=
 =?us-ascii?Q?82ysiJ2SlsREcUKB2Wlalezv8CYrOMfPQ2ZiQ6oiqx+SnOJl19zBKWnKLlHr?=
 =?us-ascii?Q?FJmQaX5TMfL7A9JTfLiGGPMjdd5UrnXEOT8BWV3W6ir1QOxck2rxC80LT80m?=
 =?us-ascii?Q?IX0JQ1nKlO6HYxHL4Lsw/47srsBzrHW/67jqlyJ9+LZiWuuUQtoJAa7aqmZO?=
 =?us-ascii?Q?FjOKN0baIS8iedJBKsBVLM2hT/Y/XRXtKavfDKG68CuiGTiq/eN3Bs82uR1/?=
 =?us-ascii?Q?8Z25uCBZ/5mVEzioKeV/w7XxgRRF6eQFGuCmkRXgvK0Ew/q8Ndime1svHHm5?=
 =?us-ascii?Q?n3LW4gyUaIP1mseO58Wvnxvyp6tK4Dy4GMa/EODpYmZJnVz8rcm/4hXxJGIe?=
 =?us-ascii?Q?dXZkeYWWCGDwn0TfDhsYEZ14Ke3aVB3FuX8O3/13vf2CT5hox6RJLZUVl1AF?=
 =?us-ascii?Q?1wuL8WLUnLDDNtgdE/jozn7CZ4vvTZHV8HQBnovkPQKtuT+KXgSd5QsjPICT?=
 =?us-ascii?Q?ev3iQzvodSZCmRZjsLjOaQAiuPm8fXfC87zg+tsWfbokP2zBbJEdLgegiTyY?=
 =?us-ascii?Q?Eh1Dc20lgayIjB4vzOdonkkLt45EsyDb4lm9VTS6vFBy+3F0HdJT55HBdJvg?=
 =?us-ascii?Q?j2JljZWWjem0nTl/9fanvdJ4nWxWoXftiXO6OiEJsNZmXhQ/5Kp6GSesXB9f?=
 =?us-ascii?Q?w2MllTAlSvb70dthkjD5+u1O+2nnpdemnmdqcQjHLC+63PcjD27H030ZvneS?=
 =?us-ascii?Q?34DKoqKNolOqMUm59+MazM9gk66oqdMUeecl5F19TH43gM+sdZ9GUda1Fyq4?=
 =?us-ascii?Q?Ml77g4JO/KZCFu+KnlGYlVKhkhn6ALzGA0/vlOs6k2RS2uBMugM4q3iRpCE4?=
 =?us-ascii?Q?K8SLU8INAIuUQDNyoeHsjQzjleJMZzkdV659IBx4EJ9vIPRlAf47HGKDu9B3?=
 =?us-ascii?Q?teENflNkcbUmIOvUXNgeO4OXRliNkbJshlAcMR9xfXQD2AzQ6TLXPV+Lvken?=
 =?us-ascii?Q?n+gio2pG/OE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ErSZvNBAiCUHcBeymIgnnvZruka8yIG4VD2sqZWETQEOx6t5E+PYvYKZAT9c?=
 =?us-ascii?Q?H+aNzQvrQ1wQ/oKhxd48dI0gAO0l+ieBILKEtyj5a5X1KdyOIucNH3sJgO0s?=
 =?us-ascii?Q?kuWfsH+jjTLMUaDZzbEeGAy3IXOuC/1S8GGLmh82SdStI3yw83PW+34bWQvo?=
 =?us-ascii?Q?GVPCsopxNfC/FYDsBarRlpb2vRux4Y9rRDrmw6A/gfJK7c66fJf9zXENOo6M?=
 =?us-ascii?Q?ZXYfXAl1XkLSQnQU9MlGnlOD+2fST1ol3p5+iJ5qyix8tp57gUsBx3fsPOUW?=
 =?us-ascii?Q?uabNkcKPbdBqzzD2/2JBKW3segEhvJ+HVTOnUYnowwHZcfjMD+NsdTGxFOfD?=
 =?us-ascii?Q?hExIyK5upvThXaYOKODF1tvhKBnzben8GfBJexQ3+BAZdeAXmpRi/20vNXxE?=
 =?us-ascii?Q?lLnWd9y7AjVMQ6byPVUUJcY6Gu1ZeZjFfCpwRWEmRD9pBRN2393R6L8GmKS3?=
 =?us-ascii?Q?U93zamjJIMbZw0XIPdIKKDYpPfXdHjIIXUBLpihFZ5+0f0ZPywHaSgG7lbyv?=
 =?us-ascii?Q?QlV5v8KlT/ixCIA076sxQhpMzaUKL+xoNiVkzZjs6Wmr77O769ztVMunCdwm?=
 =?us-ascii?Q?vp8H8fPyY6oGxHxBfVPPK9xHb87drFQeKnbEMU6RwWoLqGzzMVZ1Rvs6cPCd?=
 =?us-ascii?Q?AyRgbi8xxbuLbLYDQ9BuORNlKocu+eo7+z+rNaBgfLwdbHALMK+lu6BYjmGW?=
 =?us-ascii?Q?XYt4/Yb06mqJqi+kgNfKJvwkXRr2bKSiOTUbguQwK0cje3MlELm1W3ypVRR7?=
 =?us-ascii?Q?N2MVLOTQoIj00T9EDF0oRifJHQxsvpJ9hklBuIcpqkrdURDflKaYkK+qfpWQ?=
 =?us-ascii?Q?Ti8EhlBCIo5T1+n7qwSMWy4eXspjYpU3olHhJRWNDiX5BivfMvF7sqQ7UIap?=
 =?us-ascii?Q?Z8HaGZtnZYy3vL5OX+Zj0mUqocB+aRB/W5juSVlXOI/+9kI7aA/21NV/tYV6?=
 =?us-ascii?Q?f6gGzz8X3jeXSn0WkNK7jd6gzMx+8fOinOEdWsBAzE/76lY5lEJmeTKEYl5M?=
 =?us-ascii?Q?jKh8GyXK+ZlKqvuG580hxHqxVnm6teJUDqxGNBa8iVsbKIkKzxvvsvXnNKGY?=
 =?us-ascii?Q?y6E21SOgtMA2a8An8Ewk1S64c/ZGmNc/uJxfvKfdnkO0h18j5Uf/3qXVjxcf?=
 =?us-ascii?Q?4v6Pp5xM8yVBl41HNGxLGURnsS7/jdecGfoI2wtvJIMf1jgMlfZhaspHMG6/?=
 =?us-ascii?Q?OYzMaf9VLOctf2yKjmy7K4rQGqtzbSzX6kK2d01Vi+eSE64x0eFlGpPvo0cU?=
 =?us-ascii?Q?BG51sqUig7C9Dis7apGrE17BQLu/TjtUPky+aRG/Q/14fgANoDE515GYcbCJ?=
 =?us-ascii?Q?lZak61AlUtnUS8QQJQwUKVazqgQ4IC02449t+rEqx+/UwrHo9+AaZ/mv47UC?=
 =?us-ascii?Q?eoDdF/4LXtlX42PRyCLj5No7HEP8DVV/04bV0VIR8Kjgr+UaQ4uDJ518bIGn?=
 =?us-ascii?Q?R7dKd7v66UHsGQOhyyyDDgOE1C632EENA2FKzQ58sK70eRM0i8PUuHFhn0UP?=
 =?us-ascii?Q?USM0HiWVp3bq/tOX0vjCUwKVBR18lMPyyOku0mVEUKk+KPu/TFP3zRDRTAar?=
 =?us-ascii?Q?kz4e0n7Z9ikqxUUf3L4txvZXesKZNwkBiE6eIxJLieFAOyxakSYU+ExB+Zxw?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 000b2de6-1aed-463f-9585-08dd7151fe8e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:18:33.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9mHT9iCyvVov2XmisCLAmNRo5d6Yw8xvFGV21zUUrTf7QSmI7tBXz3N6R41xHwe9aHKnZG9YFranXLYOcidT4tPn0PAzWAldT9cIhW86wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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

On Mon, Mar 10, 2025 at 09:06:50PM +0100, Maarten Lankhorst wrote:
>After discussion with Lucas De Marchi, it turns out that is the
>specific caller requiring a dump. This allows us to cleanup
>gt_init in a bit.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
