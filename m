Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE17C021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6110E7FA;
	Tue, 25 Feb 2025 22:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+iTwvJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B45610E7FA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740521542; x=1772057542;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JSpEkW2/FCr0sW2oI/jsuQ6h9I9XTJ5WBytko8P5MlY=;
 b=T+iTwvJKCfd07KQWFoPH7Qr8Fz3AtwDWZTYWPaNus/VNE1YYXFucSTOA
 unhdR0SuVAjQQ6XU7TB/5jhRyVY8bEsmZBI1S9HZd+J7edBzkyvGE5HLc
 jeA3qtMvOg7h81nWvPbfeepANinKq9t2qCRC7Ctv/9D6Bh3FaWjfsq0UK
 dNv4F/fp1wH6l+apYjFPHMwTsBqWp68Sl3FF6voH4HZLI4UE/cr67Yu1j
 JGGQGOtKlWm04hhlRgxn0cb+702syU+kqbd9WHlg/HTz2gOX1fFol3piI
 lqxWam2ZmgSuSWjbQlMCVM/O7ARdx3plWrAruKebchbvLlpg7IJg0Rt5l g==;
X-CSE-ConnectionGUID: RDfqWHcUQB+om2Ty0EmRwA==
X-CSE-MsgGUID: aEfVyjiLS0GvM7EUghA2NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52772813"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52772813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:12:22 -0800
X-CSE-ConnectionGUID: M3Nu8p9rTL+km+/A0RI+4A==
X-CSE-MsgGUID: GCuRjaJ0Qj6oSO+4aOakdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117449852"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:12:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:12:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 14:12:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:12:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peL+oTwRVfhJfQGMmKqTwhH6Z2Yd386na/exe4PQybCf+dw7k3hSh1X6NqNcs7K57Bg4DL4tE9CpNpNdpM3r0PaR56NWMUgjDVpXbwwmzbagTGXeHz18ONQm2XTIrUMsVBcJD+X3JPn7EwlaUSReHuUeMyICHd3wbkvZ1iOGELue1qa14Epu8CMYML+AqxsEt1suA2gYBxEbbMLy8HiFkITiClUZ3AExee75hN4cwIUkQbryh2RcBNKNqivUZYwzi5HydnP5LCha0r0gPVE046dP5xzk9stxft1qaUpva7Y7CHTuBQPABeK8ZSzDZOVzd42Z9Ev2HSbxcBzIg5YtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP7DT1sGdiglXPT6tkm4aPYTnBH2LyzpHjtA9g24aM0=;
 b=HRTMhx88DQp61uO6gsrFgWEBBB5BoKbE71WcZrtEnseYJATxo1MkfJ1V5T4rcKln6d7KIgRauLGnC2OFz32MkUpjaqrX6QdmW29XFQNjwYHx8LH90ckea0Z+p+OfIRTqS8MzH0VBU+9ul0E+u/krInFgjs/MOpaFJI+xATxynDOoHl6ieCMLaGq/oEmDWs2Rqx3dh1dLH3DiN2EcPWxe/amCud2ISYfsn48cP2yHsTZVt7OsKJyMFhidEf7chFgDad1gAWnpbYusY3aEjFaxz+n7mBQs9kPjQF8J6My9qbRZUChsOvjqWqfXtTdLR9225U3wGp9aj0ctLjkspeyubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 22:12:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:12:05 +0000
Date: Tue, 25 Feb 2025 14:13:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Message-ID: <Z75AdSXMB5i6MzZj@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213022331.265424-1-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0255.namprd04.prod.outlook.com
 (2603:10b6:303:88::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fe8a43-1c13-42c4-5be6-08dd55e96fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cGk7Y+GpiLO3AKCq83THXq4DGC5SwgavK1mWX0zvBA4mi0NSSVUVPvKKp+?=
 =?iso-8859-1?Q?c8qKgY2mPzYVD1JoSCGA9raJyz8BfwLmx3+9z8qFUOpI0yrlpugd/myj6S?=
 =?iso-8859-1?Q?vfMQHNQNpyWvz/0LQ9o6zeIxZr/xDzfpYW1MrE+QhjSEflHZcTOUl8BcfH?=
 =?iso-8859-1?Q?gmD0MP/OkctTvd94vSER3HdG1BNJvUiG/peJMx6agv0noRqCUvnsa1/7Gv?=
 =?iso-8859-1?Q?WvR1ZWzRL9k7No0b1GpEgxldQER5CyCrKM8Uc8412shuGznbpSlCBFOHv8?=
 =?iso-8859-1?Q?+5NlZoRDvh8fueXGPSrjRld6WUHYx4MOzGT2Wq1h8gh32BcX9JPG/Xj9aq?=
 =?iso-8859-1?Q?Eo7bZV7thTaiwvDsVbINWyOUY2gKnwo2ap0Sv5CO+/cveewIbRUTGI5m65?=
 =?iso-8859-1?Q?O4A9diDYXjjITNjJNzgAkF8EzVOAxZ1hXxRWUh6PgoEFmNe7m4EcUsx9Af?=
 =?iso-8859-1?Q?hs8ExhAXEEAeGbVVTh5BNhI2Fm4B/Dywwc+szptdilaxbTJIEW5KRiL3h2?=
 =?iso-8859-1?Q?vFwYA4F+PciQ4GF81H1BCJ21pv+nMFea2WCOMj/4x//f5335BVHuTd+CYr?=
 =?iso-8859-1?Q?3REz5x8VHYacnaPm2iA7P3kCMRwbDvgWrarO+nQq+Xz6JNM95mh2Ea90/m?=
 =?iso-8859-1?Q?f7TNEdRipfsaEIhRBpX6hxSopA/7HGdJOsaiO+fdMleyoAH1Y0/8YiPg5s?=
 =?iso-8859-1?Q?w1TPTtoFKmt+MDaRZJ7vikhum3Gt/IRsQv5cQz6TO+a+1GdmVT64JCiHx7?=
 =?iso-8859-1?Q?2zJy2S2cOR6qY824YBS0PsLeBkIRXfCKrnKDwpKMk0us0sVNTejh2imCs1?=
 =?iso-8859-1?Q?+rnPw58Opet8KsokCr/zS4398w3byqdrYc9qS7KmV0DWxLob2Ajky+CuVv?=
 =?iso-8859-1?Q?HgxRO1AKR7SFQ9H8Za8uMRKddQgrJHwZfzgR73TvpqMolLwQWPuISbAP57?=
 =?iso-8859-1?Q?pnaL/fWyjem3W+5upa6lImFmb27D3EW/OsAAc2pyrisvBavMQxDUCth6vK?=
 =?iso-8859-1?Q?ycKxZKbV1jzdnn5D5c49eNvxZr95oY7vFF1ZWSl5EOQtgKMaK6qz+JRb9M?=
 =?iso-8859-1?Q?Hg1xRxmpyVDWXHhphb/p7wLsuE62gL7E/6U5wa5UFhcrpXTQi0joMSrzXW?=
 =?iso-8859-1?Q?TGUAVYtyf6P8GfQJvy1KmqYaGiM+E97VWjlbqANCql0UhsgbsOJaGhF2HT?=
 =?iso-8859-1?Q?Yt9fL2JxOwDCQalIpYNrEwCrwsyioRoz/PPnGiO8CauEB9c4W7ZlJmCQxS?=
 =?iso-8859-1?Q?qu4yIl3ytz3t2IR5GtwWEvT9hqxcQJR2iEuWOptwPQ0mdwB1p4mEAvRAz8?=
 =?iso-8859-1?Q?g4dw3aYR5OXb0Z93gQ6Da5nfMPvi06aEbZLmM/eNIqyjCs75KmOE7wBGor?=
 =?iso-8859-1?Q?FqnJ64hnlGzgMSLD5y8cuxAWILIx1DGdYPD5qxobIh5p5M5Oy2POCgOcKp?=
 =?iso-8859-1?Q?hBNYF7LjpbBn2RPs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Jei/VV976KxYPFPwSCAkS69GjGmS1bUrjmVNvK2ywimJWuOWQYlzpnjDRz?=
 =?iso-8859-1?Q?5cigXsxCz0EWTxBtrEMIfXqozvWu6kA/ltLvu0l17iexaSarLcHd2IFgMB?=
 =?iso-8859-1?Q?5QXu09MuDAznYh7xJ7mvjbEwv5gGie+h/4v5Qhh1HA/u88zmfZ50GoCsOc?=
 =?iso-8859-1?Q?2nKAZsPYaW4K1YnVfWlOhJPvw1fn75tTMxtgafr3eL1DWBE+Hx7Ny0/XZz?=
 =?iso-8859-1?Q?JDJrtGq4IfFU/UU7huNffgYv3ZVlMmPOFxBvPUuJfbd+J0A6cJ1Izd6AqO?=
 =?iso-8859-1?Q?31rgYgddX5OoPF02uPV+fM7VmlXlkl7XQILOqquhwufvnfnhGDoPVp5ZsX?=
 =?iso-8859-1?Q?4JubynBDemvtG7PAw5NjNWr8/ZpcnG79RkXnZ5/FKIQj4jG2e9KaSHLxZo?=
 =?iso-8859-1?Q?hNIUQ9nC54YyOyPvMBo6uHkySoowwxq9FejLjZprVxo+u8lUTQGlGMhYqm?=
 =?iso-8859-1?Q?VDaq4MmgTFc7G1KtE3kn7V0AZB4E4DOu+fOAmv1kI+3ISglHc9u8YvEGe6?=
 =?iso-8859-1?Q?vZS3NM4M3LxAigQc4euEKVQqp999zbVMCaWVoPvF5AreD4LZFNvQSSm8KR?=
 =?iso-8859-1?Q?x4Z4hgWdyFEgpXTSBV2+ftqWe17NugGd2GJtHOWMk0kQZ35bVy6qg9rxIr?=
 =?iso-8859-1?Q?qyp0KSZrd0d5mfrZFMnaGf5KySkvgq/XPComtO5NSO40IyD/5RmmwlMbY0?=
 =?iso-8859-1?Q?cpz+uLRJsmbMrq/lSLp2CuO0gY6HdggHiXB/cC73RytRngxBOhX+QgjTnn?=
 =?iso-8859-1?Q?oKGlZA9QwTDf/Ss6/1del8cvxseaYVIKkoIVuCtHo7NIi6IdCChIVOzcCB?=
 =?iso-8859-1?Q?4wmifxcpFIBzhFfnGAyD4U7WsYrQtQmAceoru1PFvbnqgL1Iv/Pwq9rpkJ?=
 =?iso-8859-1?Q?mcGRQYKkt6i0qnI0PW2iF9aG7SSou/TVg/A6/3cKmmnbT24aR8yqBZdncY?=
 =?iso-8859-1?Q?murDW5TT/v+PeXtZXZ/WO/lZ51Fypi9BRUYJhVXSRhnMlcntW+BYiPyxvk?=
 =?iso-8859-1?Q?eD68IL/3ASpzP8LfnkFyLWIMwzDLVvhPuFDS5JONNKN6JEU4xSM8I1tPIB?=
 =?iso-8859-1?Q?GueoIffgUTfpxmM4IDBcyWPq7mT4xkFt2p+W7Ezy/aOrgM0f+bmw02ENrg?=
 =?iso-8859-1?Q?OJ63CM7hLAa26pdl9kTUFDXL4BCx0GOhI0Lh+lMQJQHtXGIzWK0MIJI18T?=
 =?iso-8859-1?Q?VAcveH0FG3DIWlYmgCbf9HC71HWmtYUAGJpub90U61i9CpFHjL6qhnN3Ic?=
 =?iso-8859-1?Q?CL1cvZw2A045RCOgik20a6sd8XOs1LL/G0QO0l/GtAoI8kXqNahpXdIiDu?=
 =?iso-8859-1?Q?e/KVoYUaDbwfU7AP0HzHhLhjfc6ky+RNDzcfSnPpFndeBRYp+OPekYeNWi?=
 =?iso-8859-1?Q?WDUxmiz10F4F/2T/BWV9QTHTOjVmavscsNrH0GNIz7OQ5TIse2QOIOomUA?=
 =?iso-8859-1?Q?i8G5gW6Y6g5JJ9clF3fybzMM1BBritzsntrzLla4dhn9kEX03mQd1vMaB5?=
 =?iso-8859-1?Q?pdNUtg7kWYAXP3tLX/N9YJPISE0Pu4k1KwvO/x7BGUIImiUTmxj9t2N5n6?=
 =?iso-8859-1?Q?4rrIBcioOHSdO/EAZYSvNDwL22NcquHynDsBuREfmwEXJdIFwPEURwnYUS?=
 =?iso-8859-1?Q?6x0AC6rR4zZLM8OnuSw/0/A3NpEwXwm+j+T5yFL4r4KPiXUzkXVJMquQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fe8a43-1c13-42c4-5be6-08dd55e96fef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:12:05.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMBTOCdxvtgQLnfiVFThHsix1ZlSfu0lWMFPwCzBLx+pcWfTKR+XpLs2XcZFldhXDCmKBw5Q6zueEalKkQVDYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
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

On Wed, Feb 12, 2025 at 09:23:29PM -0500, Oak Zeng wrote:

Again, replied to wrong version earilier. Please include version number
in patches.

Copy / pasting my reply here. 

> On some platform, scratch page is needed for out of bound prefetch
> to work. Introduce a bit in device descriptor to specify whether
> this device needs scratch page to work.
> 
> v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>  drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 833c29fed3a3..a5ba9e4e470f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -46,6 +46,7 @@ struct xe_pxp;
>  #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
>  #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
>  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
> +#define NEEDS_SCRATCH(xe) ((xe)->info.needs_scratch)
>  

I'd drop this macro. These are leftovers from the i915 code and I see
little value in a macro rather than looking directly at a field. In the
existing cases these macros are used all over the code so they make a
little more sense so if change the variable we only have change this
macro, but in this new case the macro is used 2 places in the code so
I'd say just look at the variable.

Matt


>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>  
> @@ -318,6 +319,8 @@ struct xe_device {
>  		u8 has_usm:1;
>  		/** @info.is_dgfx: is discrete device */
>  		u8 is_dgfx:1;
> +		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> +		u8 needs_scratch:1;
>  		/**
>  		 * @info.probe_display: Probe display hardware.  If set to
>  		 * false, the driver will behave as if there is no display
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6a8e82aff385..c614f673efa5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -67,6 +67,7 @@ struct xe_device_desc {
>  	u8 has_llc:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
> +	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
>  	u8 skip_pcode:1;
> @@ -353,6 +354,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_pxp = true,
> +	.needs_scratch = true,
>  };
>  
>  static const struct xe_device_desc bmg_desc = {
> @@ -361,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_heci_cscfi = 1,
> +	.needs_scratch = true,
>  };
>  
>  static const struct xe_device_desc ptl_desc = {
> @@ -369,6 +372,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_display = true,
>  	.has_sriov = true,
>  	.require_force_probe = true,
> +	.needs_scratch = true,
>  };
>  
>  #undef PLATFORM
> @@ -644,6 +648,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> +	xe->info.needs_scratch = desc->needs_scratch;
>  
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> -- 
> 2.26.3
> 
