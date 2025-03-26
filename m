Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80774C28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F7310E094;
	Wed, 26 Mar 2025 04:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LACrdx2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A31310E094
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 04:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742963440; x=1774499440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CWG6sjCh+pS5+np6TVfCJtsmH6eqN//J4vhDxscxsPM=;
 b=LACrdx2CDqJJPFjYKdHe1Ffzhabh4VHhr10/osD0tciIKNhOuYxKrzDk
 gAB+58BHzo66xTojR/Lk/q8PexOYAH7sFIPiO5YVoRY4idVD9cqv3thwj
 rTkBjdxQ+Rgv90mJOHM7uM0MallXb1ZZATbVuqupGjVKbXVYqj5aE9DpU
 h71Qy0GIGFzGFA2Zsvpq4BaKWFLKg9gWYP8InlOQwQRsa/YpQRxQBqyF2
 HMSwIDk8NfAD2eOzyk+hyw4Kg0LlSYwVInN2vgDPo9eTbaNVX/BwhxCDF
 zfI8MnSAFW3Flyi7FY5VNhgQO1ulbdIR2Ym5rciMHUkKtZje4ORJ4Ya2S g==;
X-CSE-ConnectionGUID: JMNgDOHfSdaNmT0RZY2EVQ==
X-CSE-MsgGUID: EMry1D5PQ9Kyjyadgo4v2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44354392"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44354392"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:30:39 -0700
X-CSE-ConnectionGUID: rGzmwfYXQyGM4eMWOiyLcw==
X-CSE-MsgGUID: X9dQPtnlRLaOd8TvjkOl9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="155525437"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:30:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 21:30:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:30:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAfi6Zlb2p4l+hMy+tXXj+2QDvrKQU9+mFWE0x4EDwo05zXRM/zqX4y2Safq0eXDUvt3Ir7SQVYniAcU8RuKgcO16ib4SiR4QwI3O1snf++IDDKBmEGzeYJaiC1DjjegOIkWUPhRUuxiNQzv5EvG8x12Ve1rGA7K3Md51UPooh1aEkSZOkUd8tc7RW5VCoY6sDDSw5OnQ34fiZR/1bfvp/lTBIbj9T5cpoi+jq1GzE9rqs2qWISkdC4gXcmQzKFulC+npK8jxNnxbYagwFAcWLJoYX3U335A6765HxhIBAjnVnkCd/rdszEy0QTgXFxKPHcCnaqMIX3FeBc1ciibVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zdd1hOito32QUebnChmK1vhcGuR8fjQug4lYh85Gr0Y=;
 b=CPiW0eqN/BcYOh7dYhm+DDugAI5uITzmChZz5On6wTKwkI9VTHK8mHvWskpXCZOKgS82RCy0mE54R01ybCa7eezkdBiUPBxcUQiPuR5BHhDHTRXMPXSbvx517C9ZVRwtxzoiyyuvtToUyIKxptAC5TEHl4jYFAPBidQ1hOznqERDYeXmQZwDfwbqAvt3dUUSOvWMbo3Qwaj1X7Wd/ra1Si3NpJbV880m4TTy2T4fDWP5xSDAW2ODnMeC6fvEiMrJxBcPERdp0isWOpv1SP9WlErxh3s+uk1b9RwlU23F0XVEcNqO/VMdoVHklpj7QD262TGYqqU7h9uYOeBLYd45GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 04:30:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 04:30:36 +0000
Date: Tue, 25 Mar 2025 23:30:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/bmg: Add one additional PCI ID
Message-ID: <f55i4dx6ncgliw53nvxxq5bcri6hqgbq4n5u5z6xjagnmzutwt@lkyy24l4tfqu>
References: <20250325224709.4073080-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250325224709.4073080-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 75912717-ceb1-4e64-0e4a-08dd6c1ef47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8HQa41WrmY7HR613ja1IDUEoz8A9biqlV9Pf0klHHEVAsSobRNey+fX8LSpq?=
 =?us-ascii?Q?dCHlxYPBi2qwteLhevdSzGVYKXYXCafxZHvRjdj2Dhs0+CpC3AuKxIxSYSkW?=
 =?us-ascii?Q?04ef9V2vgRt68lYg5a+o6Rc2p6H6N8UcHlbh/PyJ6vYAJAbf8griD9M569vG?=
 =?us-ascii?Q?Mg9pLAVJxyAU5KttAjZl3j0DK0lzrED1cMxjgOxMkmsKWvWADUx9zJ6kzHGH?=
 =?us-ascii?Q?0hx/pgEtBtyPeyTsI2J1DJYJqSJTv8aUawxNGyHak8LqdMt5wszebu8Z8flE?=
 =?us-ascii?Q?Yneq+cfDNlYtCo0OEbeIJx6PCOkML/lGDLb/uNRqAmBUlZXAJGWvSIYiw6/U?=
 =?us-ascii?Q?uyw8ZUyCTt7N3zkesMOBKxByY0ombABDAt2MQJTJS5N0P1ck7YrBpufXzOvd?=
 =?us-ascii?Q?Bs7IHpC9G1lmd1hxZSPsBlgJRm/0cv6fi6lh2n3vtKPlBBPFQQJmdpcf167G?=
 =?us-ascii?Q?HIBWhA9pADlwhCgI6Kaqt5eD5OBwdYoTGeHE4O5Qa/FfqJNLZWx1nNlUW0mF?=
 =?us-ascii?Q?kOmJ8pjA+GOQQs4HOCcui1qnKgT7UFIAsNN5EdGw9Q+DyDtPfcfGUxf5LiFI?=
 =?us-ascii?Q?PcZkuVZG/eIZ3H1bymUIjwTgw5Kb1mWjgYjSVakoJj4bjy+wDHnH0QOulSub?=
 =?us-ascii?Q?apuUBDyht/Ng04pLrQu7Y0MEm6LrVg4wJcL55VmgXUkX4uFSu+bnanGo/lmW?=
 =?us-ascii?Q?rOA+VMCWnJj4IJ4CptL0D0mUPKjJaGEdVh/cb7YlQlhxLcIZxAJeWV4qPZBA?=
 =?us-ascii?Q?/MFaEWmR/l6wpi8wx9uxrn4dxTo6yX5YL2gep2Xkal18cL35moL+Eqqcpsmm?=
 =?us-ascii?Q?uYZCeQlRhXdiSVuSAbeafz5fbMiQESKXSEzSk2+eOiWkqHuVeAHLsIn4zGnr?=
 =?us-ascii?Q?7BHBx74xXk5Wqw9s7dGe435HsTkyRD0fJ5ggYKpnJhWD7tMT3MUMHGe4/XtX?=
 =?us-ascii?Q?VPmt2GW3NGeuxbbZw64n+DLPJ5VeFrmlbiVA8sf9C/1Ut/EGjP+cnVZfWZJY?=
 =?us-ascii?Q?6dbvIvHHdIKeCzMz+hUKZSDJrgPk2drJ+zHow95zu3FEwymMOcNtYSqTsgMy?=
 =?us-ascii?Q?S9kK7gqcHhDvp8MHNU10xBKHbibg1O3+fJrIKYU1Seuf89HlRu2NYOgyErIw?=
 =?us-ascii?Q?y0+viPCTmY4ecrkAWguAHBm13EeOrG7yNs4cz3PlE8tJijqecp+1YnnCkeMO?=
 =?us-ascii?Q?Ruh2lcrF4tQkzA4omaVAALMEGob2F1UVFfE+vkvK2P+f/4BcQQNg3udhujvj?=
 =?us-ascii?Q?5sk6EmBWs94sg8JpG8sRcGoX5fuQXMkqvtVTpYL2JRsxUZzkwfoq9j7y110W?=
 =?us-ascii?Q?5mOtpnVpVyVvAGNvA9QIsR7frt/vFV6XssLemYWul2JhgKXFckbN6L56U6Ji?=
 =?us-ascii?Q?7DfT1VLC+QpjU39eGkuoHZEUcTxw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WLMaCxcyR0Cdciv8a0RT8VpT+fmVYRmPu/2eoJJk5V42ZZCnqsYgb4vz2rND?=
 =?us-ascii?Q?ZpGW0CDnVpdmE69txwHNdc5ICxdN9ZhJYB8pA+TgEnq+zXzmAwLXlSjedglG?=
 =?us-ascii?Q?881S2fz4y9KksqENXvi+hCClrz/sgzEzXyXr/o8BIn03maSn1rR/NTqoieTU?=
 =?us-ascii?Q?+/yU2w6KJoRkyVVvercIj2/R3m2rBF+xb/M93TBd0y/sxjjafcEzK8AbKfXR?=
 =?us-ascii?Q?K3Q/sZNR5t5SV1HoOaYSljMGMu72jA3GgsftHonw1vqg8nfs8GoQl6Q68eHJ?=
 =?us-ascii?Q?2phONgSJwCZDrYsQ33EKq5CR31HoMmqlrzqWmiAsheskpxWnvPZkOUXpVxHH?=
 =?us-ascii?Q?PSobNXmivoKHjimgLNY9ZMP2zevNqQ8+Us2s7ZyPbxrnsxe0Vl11AMRn0Q2G?=
 =?us-ascii?Q?1pdnAaax+22oYEeVEkJLcfNgaWaoXGdwvEDDgiPL5pVK5GUtsn7gJk5Bve/t?=
 =?us-ascii?Q?Xjq0zQyVy2LpJ3sgtM9aTjS+fC6DTG1w2M7WvCb6H3lmdzccQdiDqWeq1zVI?=
 =?us-ascii?Q?oNA6zUfSPGYVqUDhU6Okyu0F2TiRG10MdaZBuVHK+avE8yWWAtyTfCAocSxG?=
 =?us-ascii?Q?jqsf1TJdZxWRY1oUHIx+rf6DWcI8OAtGkaC5G1tdrNzySWhS4Y2oQTIGjYM7?=
 =?us-ascii?Q?7QBJ2rB1WvjFZP/sIPy6L0oJ1e89qICHiw5ECamCQoGIttf0EclZu2ysuaGV?=
 =?us-ascii?Q?AVeBUaewwlpl/NXpT/yVgGxS+jXfDh9NV0yOZSXOCPZ/P3Tuf0PrVz8d/2qt?=
 =?us-ascii?Q?Gyb9HORPY77fq2eqOW/IbzYGfgYT8YGMNmA/R9qBKqZTUXb8Lc6nMWT5dRKS?=
 =?us-ascii?Q?VvdbEKR7BZ4cv9Hcj8DJZZiwAL1i78j+vIBHC07M5uzW+//w/u1WmPw241JK?=
 =?us-ascii?Q?6gKoKS4139MY0E9sMuBBXZdpu2nG9kXStcufr4Fv9GgwhTCJS4FsvcDd4whd?=
 =?us-ascii?Q?AYnPrdYRcuRpxn7ufQNJ6ltCH/DFdKhIdZJj3k//e1mFOLTJrs6SXZ3v0HQU?=
 =?us-ascii?Q?kClf3skVZgqIhESU/u509bH5wT/V1+NeKZYZDg3TpRo/bSB79YleJgPH20WA?=
 =?us-ascii?Q?FdhwPF13Y/8/SOgKN/tJFAqlcod8Qp6imFkJJhE8pnRkEdp0HryWkuMPxeyz?=
 =?us-ascii?Q?qrIula4+R7AYNyaiS02q+Z13N6RaQUk+3NCAG9mnvgrBlICNXHFnz+MF1p7Y?=
 =?us-ascii?Q?PUKZUXDwKnSFcqEidSZ/f5AFa8lHn1+HcCIayZ4Vm0thZzMPDunrB8uvw0Wl?=
 =?us-ascii?Q?/rLmTXkcO8YaNTtIs2sDq/IP2r+b11ah3pOqIKOnChnH2Jhoembn7hsY9bsr?=
 =?us-ascii?Q?5ucv8ChjRst512qfSbNUhK+rn+a5Aen6CT2bnM9EmjYeVUnHAerQrCDM0gbh?=
 =?us-ascii?Q?C0ym9sIwytPcHw9Q/wEwO+2UX61V3dkISy27WBciFmmrKQ4QyV7VtyvzyeDg?=
 =?us-ascii?Q?NFSScFt5WaNCQDG7axhRZxm2cUi0vBmTmxI3UYJQ3u1R/mfbGq3Z2C1OqmUp?=
 =?us-ascii?Q?1cSrfYcl1pZESLeOI1TJpjUXnxqrfs1kCdsjTq2W/TLEeu8ir92n9ve1ViOo?=
 =?us-ascii?Q?tMQA0JfhYUER672GkVLY8UnqEm91eZtXis7pkX1wQ1j1A8MqAtg/Uaw+6t9P?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75912717-ceb1-4e64-0e4a-08dd6c1ef47d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:30:36.4763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpX4rYm6vCSWZqAeO5QztC05LERUA/oEe3j61a/3Oj5pPPEBObx82VSEH6fi4YGcFbpy+D9xSUuUKg1lkTwDaIvjPqSO++QPt8Aw5eQ5pwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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

On Tue, Mar 25, 2025 at 03:47:10PM -0700, Matt Roper wrote:
>One additional BMG PCI ID has been added to the spec; make sure our
>driver recognizes devices with this ID properly.
>
>Bspec: 68090
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Since it's just a PCI addition and we don't need anything other than a
fix (that is already on its way to stable), this should probably have a
Cc stable - 6.13 and 6.14 for sure, maybe going back to 6.12 when bmg
got its force_probe removed.

It can be taken care of while applying.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/drm/intel/pciids.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>index 4736ea525048..d212848d07f3 100644
>--- a/include/drm/intel/pciids.h
>+++ b/include/drm/intel/pciids.h
>@@ -850,6 +850,7 @@
> 	MACRO__(0xE20C, ## __VA_ARGS__), \
> 	MACRO__(0xE20D, ## __VA_ARGS__), \
> 	MACRO__(0xE210, ## __VA_ARGS__), \
>+	MACRO__(0xE211, ## __VA_ARGS__), \
> 	MACRO__(0xE212, ## __VA_ARGS__), \
> 	MACRO__(0xE215, ## __VA_ARGS__), \
> 	MACRO__(0xE216, ## __VA_ARGS__)
>-- 
>2.48.1
>
