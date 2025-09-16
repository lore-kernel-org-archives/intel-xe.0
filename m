Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1CACAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 13:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7206C10E371;
	Tue, 16 Sep 2025 13:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmYn5eX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DE110E371
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758030761; x=1789566761;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eW2ClcZgZnD8ADLIfpXPwHz769PbMp1ACq2AajJepDU=;
 b=SmYn5eX7rWHlzuh5RMrttHXuLLDI7bg0whydUFIq1Jnp8xmhNdYq63Ma
 E2UU+TMeXEf0qiRAQ9WKHn0NTFcVv1VUzU0Q7ziI7V35odFUA4hl1X/Jf
 x6KdxZIWR415h27/zUfzWbii0W/oTpYOUbqojzXb02lsHRPbq3oKZOmLI
 CXtKBF012k5Qu6aqRbETPWgh3ZJPkYjggxlGIHBTNPQKiEFZ7gOLGuEMA
 ilWG3UUcMkeDKcQbILI9ndVkT5+PV63kSTQ6rrD1f0ylFRfTsvbz+V86d
 z0Tlf7j71n+oB6mN6q4y+8FItSGOCYGFCIGVY83AW5MytaFOtg1/dsItM Q==;
X-CSE-ConnectionGUID: OH+sK/UwQoC///WhJeHHpw==
X-CSE-MsgGUID: QCI6uwYkRpunh6vYl1GxGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59356105"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="59356105"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:52:41 -0700
X-CSE-ConnectionGUID: ZnXjwedYTH2l730GVhtDPA==
X-CSE-MsgGUID: q6B3FQ+ET7mp0/gSyzt47Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:52:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 06:52:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 06:52:39 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 06:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0mMSANooJXtTJuJh3+cA1NeGdFfipSb0DQQ0HZvZZ7NonjMu6Fhf7EjphKOTk4adA1qaylKOYa6Dm7kcnNKwpT3IPUx17CZ5EajwoD6DZG1cA0y9wOB0aHzdCda9yEn7dN3x4JNsUqbL8hbP7oKpWsMfp/uCzBSsVwcjOprmgokvypZGZcjJgEAQbX61oWWwPeu/NZ5KcFnHm1OxcSHerSs+O+DFSMg7p1sYtmTPplV5QZcg+zwLeSbmAMnqb9I7mRnvzYKJDCXWz6hjYz4dqaXczDBIeiOAleJYGaMHVSgX5NSlUNDwfN+3rz2kGcu2GlnR1OvOxeR1nMSJeXlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4pmJUjvirnF/liV0oKerj2D1MK3xGQK8PpVc8x/DI4=;
 b=PbZ7JNvqyt6cEbMKL0LXSZJXOdtlzo36Kkman5PzdVxudwBZB+ZIdNiUkECZcyAqOnfDhtaLAKGoLV8JQru/W7tifDS/kemHK8RNszujN/TITec/hPYJm0Is7h3eAoKFX10K6EEYsummGpVpesLVyO0AQrBgHvD+Cx1QmawQTD+XeXwdX2ak4xYwg1GMEWyaTLyJ4VG2VBzyODsveekXsgdoJyHmehuKcjalbNJfu40qqtPsQpnopLcsd+ggyCI5wgrXqqb4dIApYUcmCc5GFUGLpRN81T7UMHajqlMipAIYGbsaRP/lKbB9HHWr2WXzKqRKrlwaqUdu3UnnjLlo4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:52:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 13:52:35 +0000
Date: Tue, 16 Sep 2025 08:52:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/sysfs: Simplify and fix sysfs registration
Message-ID: <6fpcepsb32kih6p6x5dktxwpt3bawpgch666wltrqfsd3r4uwe@vjsusedz6v4p>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-2-michal.wajdeczko@intel.com>
 <wrdmty6mixvzuononvsfwqcg3ftvsraallbaibauffhfymizu5@ejcdqwurfqd5>
 <32cb4726-ad85-4240-b40f-cf5a3b499fae@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32cb4726-ad85-4240-b40f-cf5a3b499fae@intel.com>
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5262f8-bb8e-4814-d528-08ddf5284a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?USygN2jTLEepiAM4vH+uxy+nsW8cTitOsAjKvD3lucAtKP9P+YpNUs2Fk5?=
 =?iso-8859-1?Q?5FX83ZtE/Jup6ZGYC2aNy8S0I19FWSTIg6O7WHJQi4rnVh3LECgwCm4WVz?=
 =?iso-8859-1?Q?14TRn8VX8uKu+dP8UOk17vaeOILSbO0V4QsSWuUPWfKNpDS+5DxWIzvlmm?=
 =?iso-8859-1?Q?ak6y5JQxza022M7FzyeYbNm5SAIHFRRIo23AO15Qgbd6PwUzKmKGWyPFgc?=
 =?iso-8859-1?Q?X1mZlkQkPIAMPa0tGxu8UjamV93uMZZNoz5HeX23hyp1naJ+OiXhxHQX8v?=
 =?iso-8859-1?Q?sLugi/1JviqSGYJg33lMJZJ/MoM2WOtGGobC8RkNwxtAE0g5Kt8izsHceG?=
 =?iso-8859-1?Q?ckcoTn5EOmmvAz+aIFM5cK+YWLy5gupzdY28EKYar5/xKriJTw4E4sGfpi?=
 =?iso-8859-1?Q?LWYa8aKBILnjs4Z8x+RDpt0pcn6Cej9j7o9AN3Obyu8oZVqV/+i1e713iS?=
 =?iso-8859-1?Q?JV8Mo4lDfE1UARHxBfXMaum8gUDoj1TJEAunBKravL2TVQlA2hmxvoBbqc?=
 =?iso-8859-1?Q?bEjIzsrgm2IUHaIH7HNN5s5RUHT3UL3XdzNdzZVPeCLSqOfNx+sOZdIE0P?=
 =?iso-8859-1?Q?uMxe5SGHaqrg91+eJw0kKDfplo7P0dHw+PiUMSqYx5Mi9XK4NHsqxEihDv?=
 =?iso-8859-1?Q?6zmzZbFHIU2fTbjozG47PS3XtlO2pXMERYXNh4e9O8FayqhjqLngFSeopk?=
 =?iso-8859-1?Q?5cH/lAnVuKTyZ23F4zBhO48KGZyjAfUCp8xeSfCOyohu8CEOsz+8V3ykd4?=
 =?iso-8859-1?Q?1csiLJfglfuomxbEEPf3wbblrzkxvaAzNLSL+5gXqC2lJ8nnwA8vh1cGFU?=
 =?iso-8859-1?Q?6kYEzlTjaxqmIsqFKWbDDjuYTwqeoyuNBtJz8yZho5NLhzbbzsHSsdZhkq?=
 =?iso-8859-1?Q?oyWhpQovuFXzZN87UL9JwYFxPLDjzt0UBbQe3QfkmGIl6rdquvvjfirGya?=
 =?iso-8859-1?Q?E3DWLwObt08EyEE7cw4VCkRxQ0lBjw96dHSacPyleMUzcWH/p2eb2eFrmk?=
 =?iso-8859-1?Q?BsMkcSvtyLxhGTK44zoBp8/ti5kEhxzEoYJhkZC+Lbt6L0So7B2q+DgICN?=
 =?iso-8859-1?Q?qnem0qX0S9gCqhX7f69nZylAXNKmlV9rj8pmTqBiLhgJY8NwfMdfxWk+tz?=
 =?iso-8859-1?Q?49O6BpurmNzQY7eCwTveOhspCA04mNuODd4OX8737bcyLOZf3kNuxW/gF/?=
 =?iso-8859-1?Q?0cwnQLNpOIVP0/ieYuVe1XD0y1Sw6bMkyOrN3orXz8XF2kdbXt7XOw7nFa?=
 =?iso-8859-1?Q?vmPh8uWv9Mj1l8D7HV/Mt1k2Ileq6ThWscR9/tUFJN29BsNILHF5Y531av?=
 =?iso-8859-1?Q?GFKIO/NetqY6QDDSv6Pcvf6P8hf4EwLPjrlc9Dbed4D3pKwpRrwNgnlXsq?=
 =?iso-8859-1?Q?sFm+V7JejX4Ulyn0FVZ91MuQ0hNgKYK3D4MsXpdeH/PjwJ0bPeBHIlf6w9?=
 =?iso-8859-1?Q?t48aagmJCcpZeMWC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j6TWW5j1mJHLw1RWN55yZ4dHMh5eAlbz9lREwd/A49ZUB9JIa8Lzf6dIFQ?=
 =?iso-8859-1?Q?3bMi7FHlHKPDqdgyav8HXcrOo4MVzO5EqrEEaoufmUlVAQU7pN2xmqH7ON?=
 =?iso-8859-1?Q?te8a6d43syDyvCqi7HL+4HQoJv/lnO1zG+8eddULs3MWW9rJoxDoHXJXvN?=
 =?iso-8859-1?Q?x5t6W9O4B63byA/Kh+iYm7qCXIgw/vji0fLtL+IlQOn6NhaJAfSnhYOy0h?=
 =?iso-8859-1?Q?q7j+V8EqLpzZX3+92Jo2J5jhr4OKMET/FmopvMw1rGFkS0L/Je0O5Hqg1a?=
 =?iso-8859-1?Q?5q4OLOYwZqyvQbioFswNaGFZOWacOHCAJYhX+rsAYIKa2HnPXfk2yP/9MV?=
 =?iso-8859-1?Q?zJaUDOEKq73XrK+gfEUhkxfq0MIBFDh6ILtSu+OOr9LB+BarwV2ntWLE08?=
 =?iso-8859-1?Q?ju+7ht9eo73nMtaguou/REPACHQP3v1hTp1N3pz6XOF+zw78ISV/YcSRry?=
 =?iso-8859-1?Q?syP4aEl8N5zCbCBzWW1PuwKwuOF0CHlYTOwTpkZyR2sfpTPXu8IQrhfGM2?=
 =?iso-8859-1?Q?A1AFt1x0A3K03VGBWqkUKl5/jr5xQlFsxYisfhzHro+uNppPOiz/dFG8qQ?=
 =?iso-8859-1?Q?CL62D9jCcVbobzlFoy69jXkQQV63cGmp4XCs1jqmYev90cGVkoGgo2p6rq?=
 =?iso-8859-1?Q?fwpE7jzhur3ihe3090zX1YtDQCJzMx99pp3WsvB5hXRKE7VWK9q1+dWyYb?=
 =?iso-8859-1?Q?FXHODB2pLS00y9BecfrDgOXapfQlpImtnvmQx47mkhE5B3vKAltwzDEVMF?=
 =?iso-8859-1?Q?OO2gZ1hgnxCZkIEXEdB1U7hCX26uSsu95a/n8UBojmoDl3yk1kyxoxWJyB?=
 =?iso-8859-1?Q?xHYA5t1nmYMB8r46Vyo4Vf3EA9GXOREaWp3nOv+bovDPInRORU3IOAA+xu?=
 =?iso-8859-1?Q?jPLYrTbjhK7fSs67eAubb5d8bwF7pZtXBf9stS//VCOLfyUTGVp20Cs4nz?=
 =?iso-8859-1?Q?uEhc/OMOdJhi72bZyZOIC0f28nwl2bRSrd7yapGXHgywvt0CjcOjpYGHn0?=
 =?iso-8859-1?Q?+6zLAyx4nH3MedtEa6cnvkO5ROg12ni1kF3jLi7nOTIOzs232NsFCsGc8x?=
 =?iso-8859-1?Q?vYE/QyMDzz3aCuUCN8rsC+otgG7OaR+ldFRK1FegnqvvnZBLpWKQd4WDU1?=
 =?iso-8859-1?Q?vdr/iNoL86nbW/jFdiSri33qE5c+RqVB9z7QMv3Pv30lL86vL2sh6g/HSh?=
 =?iso-8859-1?Q?JtFV/Luc2oarlDG6H8HZSlkRcP3wswWbKw0glw/Dp/XCSBnTjBolIfcN3D?=
 =?iso-8859-1?Q?CgBzRa/ZNxWiZXYTrHfeKx1FtfqKdlJq4Ime5GygO5/WKXVdqn6q6KQG/i?=
 =?iso-8859-1?Q?2QdFh+KDhzZNPEvmT3M4TAsaKHAaU5FLa6x8eDutEk42bgb8RgngV6vGFa?=
 =?iso-8859-1?Q?5MUW5KnI9c3izlcQMIF0lqxyg2Njxv5wFJenUbOgKTj3kBHWE2ObOB9ABU?=
 =?iso-8859-1?Q?vphBx9eXks+FjNxmtZr/zCyeoZEs/05AY00ZSaBpTsLtPWNTqyKH0geCTF?=
 =?iso-8859-1?Q?qOiUPAU0f1UjbiPh7oBiQABRVe9K64CZIvgPACoz0aI6rRtPDir6IiwSa4?=
 =?iso-8859-1?Q?miiPme3qWgiZ3N2zOuPhyIJ2Q3T1VCfx/EeAJHX77LV50qLc7SGqV2qT0q?=
 =?iso-8859-1?Q?9zYq3cmBLeXpSZAKcdX7FiBaMOUv0zN7HlOi7KciCzVO/3EJ2Ai2FppQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5262f8-bb8e-4814-d528-08ddf5284a70
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:52:35.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOU3TlC58wR9q6ihj9DPwuJFR6RbY7el51ifUvirybx8Aw5BZHTi8tECWzDGUPJW/UAC0F1pGcbmWobebeD5AcvmiQtYKpDxLsX3Tj8O7Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
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

On Mon, Sep 15, 2025 at 05:33:29PM +0200, Michal Wajdeczko wrote:
>
>
>On 9/15/2025 5:12 PM, Lucas De Marchi wrote:
>> On Mon, Sep 15, 2025 at 04:06:13PM +0200, Michal Wajdeczko wrote:
>>> Instead of manually maintaining each sysfs attribute define and use
>>> attribute groups and register them using device managed function.
>>> Then use is_visible() to filter-out unsupported attributes.
>>>
>>> This will result not only in less code and smaller footprint:
>>>
>>>  Function                                     old     new   delta
>>>  late_bind_attr_is_visible                      -     183    +183
>>>  ____versions                               80832   80896     +64
>>>  vram_attr_group                                -      48     +48
>>>  late_bind_attr_group                           -      48     +48
>>>  auto_link_downgrade_attr_group                 -      48     +48
>>>  late_bind_attrs                                -      24     +24
>>>  vram_attrs                                     -      16     +16
>>>  __pfx_late_bind_attr_is_visible                -      16     +16
>>>  xe_device_sysfs_init.cold                     20      21      +1
>>>  __pfx_xe_device_sysfs_fini                    16       -     -16
>>>  xe_device_sysfs_fini.cold                     21       -     -21
>>>  xe_device_sysfs_fini                         271       -    -271
>>>  xe_device_sysfs_init                         421     135    -286
>>>  Total: Before=2848898, After=2848752, chg -0.01%
>>>
>>> but will also fix some bad error handling that we had here.
>>>
>>> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>>> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
>>
>> we should probably land the fix separately though:
>> https://lore.kernel.org/intel-xe/7p7wqbghc2ebupbzljjaegakun3azczuby2haiqmmneavnpl44@joqtzfismsgv/
>>
>> and suggestion to rather use attribute group, similarly to what you're
>> doing here:
>> https://lore.kernel.org/intel-xe/3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu/
>>
>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_device_sysfs.c | 96 +++++++++++-----------------
>>> 1 file changed, 39 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> index 6ee422594b56..5b0b98ac9b17 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>>
>>> static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>>
>>> +static struct attribute *vram_attrs[] = {
>>> +    &dev_attr_vram_d3cold_threshold.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group vram_attr_group = {
>>> +    .attrs = vram_attrs,
>>
>> since we are already checking by the attribute inside the is_visible
>> hook, couldn't we just add 1 group for "device attributes" and
>> share a single function?
>
>I tried that approach first, but checking for late_bind_attrs was
>so different that decided to keep it separated from other attrs
>
>after all, this is what the purpose of having multiple groups is, no?

yes, my concern was just about having too much boilerplate. Looking
again at the late_bind_attr_is_visible() you added I'm ok with that
though.

>
>>
>>> +};
>>> +
>>> static ssize_t
>>> lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
>>> {
>>> @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>>> }
>>> static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>>>
>>> -static int late_bind_create_files(struct device *dev)
>>> +static struct attribute *late_bind_attrs[] = {
>>> +    &dev_attr_lb_fan_control_version.attr,
>>> +    &dev_attr_lb_voltage_regulator_version.attr,
>>
>> As above, I think we can just consider them "device attributes".
>
>IMO we should _group_ related attributes into "attribute_group" and
>either add them based on single prerequisite condition and/or provide
>is_visible filter to control each attribute separately

ok

>
>now as we only have five attribute, it's tempting to put all into
>one group, but I assume we will soon have more attributes, and trying
>to manage them as single group may not scale, so it's better to show
>how to split related attrs now

ok, fair enough.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

But as I said before, I'm going to land the fix from the other patch
series first as that can be propagated much more easily to stable.

Maybe one step further would be adding something like this on top?
(WARNING: just build-tested, may very well not work as is)

| diff --git a/drivers/base/core.c b/drivers/base/core.c
| index d22d6b23e7589..a84b74e487b0e 100644
| --- a/drivers/base/core.c
| +++ b/drivers/base/core.c
| @@ -2858,6 +2858,15 @@ static void devm_attr_group_remove(struct device *dev, void *res)
|  	sysfs_remove_group(&dev->kobj, group);
|  }
|  
| +static void devm_attr_groups_remove(struct device *dev, void *res)
| +{
| +	union device_attr_group_devres *devres = res;
| +	const struct attribute_group **groups = devres->groups;
| +
| +	dev_dbg(dev, "%s: removing groups %p\n", __func__, groups);
| +	sysfs_remove_groups(&dev->kobj, groups);
| +}
| +
|  /**
|   * devm_device_add_group - given a device, create a managed attribute group
|   * @dev:	The device to create the group for
| @@ -2890,6 +2899,39 @@ int devm_device_add_group(struct device *dev, const struct attribute_group *grp)
|  }
|  EXPORT_SYMBOL_GPL(devm_device_add_group);
|  
| +/**
| + * devm_device_add_groups - given a device, create managed attribute groups
| + * @dev:	The device to create the groups for
| + * @grp:	The attribute group array to create
| + *
| + * This function creates the groups in the NULL-terminated array for the first
| + * time.  It will explicitly warn and error if any of the attribute files being
| + * created already exist.
| + *
| + * Returns 0 on success or error code on failure.
| + */
| +int devm_device_add_groups(struct device *dev, const struct attribute_group **groups)
| +{
| +	union device_attr_group_devres *devres;
| +	int error;
| +
| +	devres = devres_alloc(devm_attr_groups_remove,
| +			      sizeof(*devres), GFP_KERNEL);
| +	if (!devres)
| +		return -ENOMEM;
| +
| +	error = sysfs_create_groups(&dev->kobj, groups);
| +	if (error) {
| +		devres_free(devres);
| +		return error;
| +	}
| +
| +	devres->groups = groups;
| +	devres_add(dev, devres);
| +	return 0;
| +}
| +EXPORT_SYMBOL_GPL(devm_device_add_groups);
| +
|  static int device_add_attrs(struct device *dev)
|  {
|  	const struct class *class = dev->class;
| diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
| index c5151c86a98ae..e398176679e48 100644
| --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
| +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
| @@ -69,6 +69,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
|  	return ret ?: count;
|  }
|  
| +static umode_t vram_attr_is_visible(struct kobject *kobj,
| +				    struct attribute *attr, int n)
| +{
| +	struct device *dev = kobj_to_dev(kobj);
| +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
| +
| +	return xe->d3cold.capable ? attr->mode : 0;
| +}
| +
|  static DEVICE_ATTR_RW(vram_d3cold_threshold);
|  
|  static struct attribute *vram_attrs[] = {
| @@ -78,6 +87,7 @@ static struct attribute *vram_attrs[] = {
|  
|  static const struct attribute_group vram_attr_group = {
|  	.attrs = vram_attrs,
| +	.is_visible = vram_attr_is_visible,
|  };
|  
|  static ssize_t
| @@ -173,8 +183,10 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
|  	u32 cap = 0;
|  	int ret;
|  
| -	xe_pm_runtime_get(xe);
| +	if (xe->info.platform != XE_BATTLEMAGE || IS_SRIOV_VF(xe))
| +		return 0;
|  
| +	xe_pm_runtime_get(xe);
|  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
|  			    &cap, NULL);
|  	xe_pm_runtime_put(xe);
| @@ -269,6 +281,15 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
|  }
|  static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_status);
|  
| +static umode_t auto_link_downgrade_attr_is_visible(struct kobject *kobj,
| +						   struct attribute *attr, int n)
| +{
| +	struct device *dev = kobj_to_dev(kobj);
| +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
| +
| +	return  xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe);
| +}
| +
|  static struct attribute *auto_link_downgrade_attrs[] = {
|  	&dev_attr_auto_link_downgrade_capable.attr,
|  	&dev_attr_auto_link_downgrade_status.attr,
| @@ -277,28 +298,17 @@ static struct attribute *auto_link_downgrade_attrs[] = {
|  
|  static const struct attribute_group auto_link_downgrade_attr_group = {
|  	.attrs = auto_link_downgrade_attrs,
| +	.is_visible = auto_link_downgrade_attr_is_visible,
| +};
| +
| +static const struct attribute_group *device_groups[] = {
| +	&vram_attr_group,
| +	&late_bind_attr_group,
| +	&auto_link_downgrade_attr_group,
| +	NULL,
|  };
|  
|  int xe_device_sysfs_init(struct xe_device *xe)
|  {
| -	struct device *dev = xe->drm.dev;
| -	int ret;
| -
| -	if (xe->d3cold.capable) {
| -		ret = devm_device_add_group(dev, &vram_attr_group);
| -		if (ret)
| -			return ret;
| -	}
| -
| -	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
| -		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
| -		if (ret)
| -			return ret;
| -
| -		ret = devm_device_add_group(dev, &late_bind_attr_group);
| -		if (ret)
| -			return ret;
| -	}
| -
| -	return 0;
| +	return devm_device_add_groups(xe->drm.dev, device_groups);
|  }
| diff --git a/include/linux/device.h b/include/linux/device.h
| index 0470d19da7f2c..63cc4aaf5f416 100644
| --- a/include/linux/device.h
| +++ b/include/linux/device.h
| @@ -1170,6 +1170,9 @@ static inline void device_remove_group(struct device *dev,
|  int __must_check devm_device_add_group(struct device *dev,
|  				       const struct attribute_group *grp);
|  
| +int __must_check devm_device_add_groups(struct device *dev,
| +					const struct attribute_group **groups);
| +
|  /*
|   * get_device - atomically increment the reference count for the device.
|   *


Thoughts?

Lucas De Marchi
