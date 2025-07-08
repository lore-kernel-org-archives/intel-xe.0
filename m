Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B23C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 22:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7327810E702;
	Tue,  8 Jul 2025 22:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHSl12ya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F410E6F4
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752012704; x=1783548704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B/29jz3zO61tuFFnSQWXDKEdS8CvlntVsJy6bue79XQ=;
 b=ZHSl12yaW1Bwoef/na8aWwLFIY/ezu8DZFmYce2p78qTLRMszDVEBPo3
 UI4Pwk1xcqlMynSzEilxmhX/uQP/WZjEaM2udhezyEWyysmFnmshJtgc2
 Wu1g3q1sKyCi3J4vnvr8DI4ISlt7Oj+2QrK9KUN1DW9cJQYIWbDCHHfvK
 DQ5y5PScIMSiqyoUgrZ9bwq3rkvvijdsPRNLsrgcRG3/6Y3m0rPSBf8E+
 Uhod7eQz6FssSXG12K3nRH9zX4Vq1hHr+lH9ybd/GpiCFkGJKDR5aj9A6
 F7+zt24AJkfARD5BHIuYEAIi0FWqFrvYckvxftn0xTpoquBSAWt66bhaJ A==;
X-CSE-ConnectionGUID: LI0wUIf2TvGPRDJ2HtTgDQ==
X-CSE-MsgGUID: DwWrwv3/ThWQTbYhUyLRUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58067259"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58067259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:11:44 -0700
X-CSE-ConnectionGUID: nMUoX/gmQZ+2eaih2G2m+Q==
X-CSE-MsgGUID: eYkSE8rERL2ZEEU0VIlBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186577763"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:11:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 15:11:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 15:11:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 15:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np7xMnMz1/54QxqMOm6ionPWb1Z3xbngus6lx2i6ZtZAbXYvy93NiiMLXffyzaUz2evpV56SDfkURcQCIKFRs09ANM2Ka6LfLegl7IulGT5eKqkM/7JLbyZx3z2b15Iqv3YV0k0y4nck04Og5FWlHu77dUrVCdW2+oOFUPnHlA+USxYPnBnuy0T2tAOCPZ+7U9R8A5J7O5cGXg5MECrfU9aApeUNenL/BycbsufWtlF0j7MtwmbyEkqxn4vzC36CTU0mi1S2Jkck2SqOxnlPrDjKY+ecFNujRvCw84AtiyiK8csOxs8H4uHdaQ5SwM3q+BVMZBZl+4vuo4qlLwl2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRKkxQFzcdyb/r7xKBZNDFWGXcZFigw9QVmnFJBG9Mg=;
 b=Lnlpi/2pwV67bXCUbPJ4vi0lKW+C4VS68mbk2U1goN+ufU3H3kMEd2swD4qGtow7BAW1mEqXZCyuVfZkIbQSeCCrAzPYmL9WyVi7rde+xdaCws8K2NYfl0kOR92Jgm/6NIb/qv+z5WvqqJHKeBx8uZaWqWCCFIOz/OyqdquFuBIqyIq6N4kkERzFIreO6PX0ck2jdshsgWGCY99wOXBv7k5QSJMiHkmXXBlNm7H1yjDywGVH4AeObypLe26JZzUUJYYsu1yNyQLfytYjZBpHustz3nn8CjObuubBI1NVckXnKoa0sT2unUQCdX0djsizWLHoVs+BjTPZbMUQdQDTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 8 Jul
 2025 22:11:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 22:11:26 +0000
Date: Tue, 8 Jul 2025 17:11:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v8 3/7] drm/xe: Return number of written dwords from
 workaround batch buffer emission
Message-ID: <gmq72whamose6gbfnbb7j4wlcjueg4sf3jyby4xbtxhvsakinm@66ts3yntuvzf>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250703082059.61597-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: da00f21b-f328-4326-3f6b-08ddbe6c61ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tubFHiJQDHhkWcML0PW+L2qYC2cvv6U8C1L7nPPQHXrSO9ZWHYGFfRuHcraY?=
 =?us-ascii?Q?+ToN6gJommvJcwvvS2DgSFXMkovx7k4k87W0UvH5XU5ssQSa/80EE30/lRPi?=
 =?us-ascii?Q?k4BILLcY7HVUTbbTCTDSmPer0ZwQj8gEuqTJA9SBBydmhI0WGBVRW1mtg3eG?=
 =?us-ascii?Q?ZPljvv3uLCPViVUyLeF+UT8kwL/+KZ7qy2c4mTfvvEuKTAnV2MPWezeKShBn?=
 =?us-ascii?Q?aXaH+U5Q0NDNIaSCAKJMARgfYGIjU5xqKy3Xx6ejnV903vNVz9mfSpJwFiz3?=
 =?us-ascii?Q?z2sR42r/GuE8lGzxLA1A7cCzHjjbiC74LteIWASrNF9qlHxnT2StckpWboka?=
 =?us-ascii?Q?1qqeK1UADj+j3Ouyd9gBJkk7fUvvJyXansTEwsmBTwZlKkVSEQLgK5kji1u9?=
 =?us-ascii?Q?5PCrkH+zAKNJlYqKZAzw8xPt7tR2lAzc/GoZ0Ak90s8J+5GmCNdXXPgLHL8a?=
 =?us-ascii?Q?J8OA5dPlH6jfbS//wpGOjdqizwqwO+WuROPMW39cMnkZeIVAv/kUG72EO9lt?=
 =?us-ascii?Q?79sNRSEct2OKO6IMxWLQeLhBR3hRQRuXb4oT3eqFbV3UTNGiXiYLoO6UGx+E?=
 =?us-ascii?Q?zLcJTlyXSqVB/lANZsTgByy8wknBj4AlRuvQ+Jr3w0dBtFEMnmQWfRbvkI0G?=
 =?us-ascii?Q?smIJpvioYyOcbK9cwtFg8g1MHT1IXSl/dw2p0scv+lp3XNT8kx+GHkIBopZh?=
 =?us-ascii?Q?0XGmUn+9sspMMO5ab55GQdvsFHT2Va1fowPYATBmoit9D3913t538c0uV7qE?=
 =?us-ascii?Q?t1gW8nr8EED0ICVTtrbm5bv2Jx04t3pbL/5nNSriICq3u0wY9UnW6UI/5GYY?=
 =?us-ascii?Q?hoVz8BJW9T4c65Hphazjz28XQ8QopuYjn1JgFU95Ktq2eAar1CESKCD1Jkjm?=
 =?us-ascii?Q?nyyJq60Bc8Y/XPT95Oo32gvISyePjarG19i5Ea1dxQ903JjJ0l4Pgpa8Z5X3?=
 =?us-ascii?Q?11n8iHP5bcWRoMKJ0vSyrkUZFVfGIYsbkg13VPDXmsWSiyIGAHjXoYvS/Rec?=
 =?us-ascii?Q?cRgfVGyo8eZB5Q2gUE7byewajwwAGHwrtOW2frTUyzXQuv/yth78+b0hwKfI?=
 =?us-ascii?Q?Co/En0clTyQAfJbM2fsqgSL0yKp2s4SFmrNcNFAdUcg6cSyyQG2FqfumitxR?=
 =?us-ascii?Q?8fFLwzWZHzWLQsCWJBZpHF7aXI/mHF0jiYeol9mGMGAqpeIsbTUSdDRTZLm1?=
 =?us-ascii?Q?a/HAcL1EjvPOr5GfcYCWPKoD2qZsQnNs8AoKlsEQqW+FwU8Q2/O5NR7qerk2?=
 =?us-ascii?Q?UyvGKX+SYg3H1/wfYjJTzrZalejUcrBhrMIlAumbvjjH31pu07uHEgzPWBe2?=
 =?us-ascii?Q?rb3q61KrKE7zGXBTXz+tfStDVNHQ8d33OduVYlWdQUUN3kpVBpXxqcGA15xb?=
 =?us-ascii?Q?kfIC5HBRHsaIsdHrf19LukraVYTOkrJZBjuia+A7SZ5RvDWIl9WPfj5M0X4n?=
 =?us-ascii?Q?uaZ/zD0MvJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U5/MpJKFL8Vu96JHCTLd3i5/8U5XZB6YXIqW4zbSnOKCm1HSMano2jMLcRZG?=
 =?us-ascii?Q?YDtBuQqfCBUqwMbh0VQH/+oUtu1keOIIj1aXfJipHDJGS0KmxgQnf3zQa8yA?=
 =?us-ascii?Q?5ONJCrt+FQAiBNd7vUcIAXE2QN8jscGn8XdRZrc0rzJtQHOjrpYkY2b5kaFp?=
 =?us-ascii?Q?zJNDiH0n1MJbhI7dMc+rXrf/j6eUlDLHBsTghpTFcCeox8DiZWj7ul03DepR?=
 =?us-ascii?Q?1AZ3eKMvyC23AO9TQ4gXjJ8mHdJSWxJqO2mUZopK+U9E66PRL3KK6Xyq2V+2?=
 =?us-ascii?Q?K86PmRii9KLJAQPLd9MstOcSASHatyo9kiylmmYGL2b1HxzOsB+OmZ55bu18?=
 =?us-ascii?Q?wSBiqtAVoHFtfEw8ryW5TUlSlyj5SqbICgqzAynIL5EKDxD5RC2jUi3l0PDR?=
 =?us-ascii?Q?Qg8FRK+i1eQ0jAlin0zQ+SPMq7TXHYUuNzQ1UqS3+py9TrTJT7ri4ABGmV8L?=
 =?us-ascii?Q?X1qouSHUIgqw4s2GXiG47Xj4eF4i20NV+1seUmjsIsObRRIMArHO0znNR0nt?=
 =?us-ascii?Q?Ue5xSzBWPGavt9P3kZo8qI0NKVpmtolqWPlWihIpGEY0giHvF/lDwRKD3BDL?=
 =?us-ascii?Q?q9Dwbd/1RnYU1c20Mzo6lf+eFRS5yJE41VyKejHLW7vTcbZs6tvYiQuVoI8N?=
 =?us-ascii?Q?bJtK+pt4cKLgaFIGVd9U1tS5P19FDmdNbWhK1+VFBnLk6nDK/mRAbhtK+aKz?=
 =?us-ascii?Q?mqMY7Uz3FMI8O/jMGaxY9+aW9KMJPnZEjlY1x8Sz5UHsEAKb0Q8F5pAPdIwC?=
 =?us-ascii?Q?U0O3UmADXitxRXRjkMggxHkzwu5AijCxPuPWjFSQYleXP/u70a9H8TA6pazA?=
 =?us-ascii?Q?AmGcjmijqK96TPItZWENq/U+0WUaSfoAQ8++vgn4u1QPSQP/+dnoUMrVp8EJ?=
 =?us-ascii?Q?OW2x0nElIqPi683G7CQD062PeHnY6++mr3ZcF991zAqUs//Gj/V2g1+VNJLu?=
 =?us-ascii?Q?HDjMCGLF0TRF07OyVQ2+sQv2YlMCPA6IvOe6LTxSFV2D4hIAugxJXXl1t8vY?=
 =?us-ascii?Q?ApoNMMybvLfgPY6SYlxXtcOuLVbJYAKiD2XUc0TIG/tRd8FgSzsRcgWIHqEW?=
 =?us-ascii?Q?OUS/7ROaldW2v3/CQGTEIeKDKCN0mZmFMzU5/xdgMo9KMH8+3rWT3DFhHlfF?=
 =?us-ascii?Q?DJBpo85vLKpQpmr0WPsuQ/tNcPBsefFBH0k88E4XFlmscKI1ZkVgB2wYEG/a?=
 =?us-ascii?Q?RTyHdYKQAux9S2r+jYLUn0xcymyDPHHnrio3QQZpoenbJBJTo9JbjPCFKyIj?=
 =?us-ascii?Q?h4Gfd5p1dN+yBdp3bvvbSvRtvYtTexcpeALBEmh6R0xZFDAbj8bHEg4vaCgj?=
 =?us-ascii?Q?evtWiA/pfImOQjbhQ+3FZg5tvB1b5r33sWyDO/WYW9oP+82NuicFxWsfFu51?=
 =?us-ascii?Q?Md7hY2nKMjOgSmVUx5Z2I2HXutzseIWx6l98OZIF35x0CSdLP0Cd72Azb6Kb?=
 =?us-ascii?Q?VxodmCU0BsyO6xHVkFKkqaLXo8JfViYSbC4BpGCTKpvqbyvjn4iy1B1aJI0D?=
 =?us-ascii?Q?oR6hbPFuTgVovqpCJ6RdgEVS+CrUQuVh6BAkXJg4/6yIhHD226mAktbbIIxe?=
 =?us-ascii?Q?OqwW+W3n/qijVPf0Q8UvfidZ4Sjzm+2yaRnk2/KEgz1t1gq+/jciHXIrPW+i?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da00f21b-f328-4326-3f6b-08ddbe6c61ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 22:11:26.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uC+rapzYei6qQztvL9/U+fZtr2DfR1SZFJ6S/9RGoxuDcFqVIoeHncVb9f0He4c02h1XUilybsOI72WS7JOHCDX5R+EsD16wmV2sfWIac5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
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

On Thu, Jul 03, 2025 at 09:20:55AM +0100, Tvrtko Ursulin wrote:
>Indirect context setup will need to get to the number of written dwords.
>Lets add it as an output parameter so it can be accessed from the caller
>regardless of whether code is writing directly or via an shadow buffer.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 16 +++++++++++-----
> 1 file changed, 11 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index edd8751b164a..7f8911a10cc9 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -985,7 +985,8 @@ setup_bo(struct xe_lrc *lrc,
> 	 unsigned int offset,
> 	 const struct bo_setup *funcs,
> 	 unsigned int num_funcs,
>-	 u32 **free)
>+	 u32 **free,
>+	 unsigned int *written)
> {
> 	u32 *cmd, *buf = NULL;
> 	ssize_t remain;
>@@ -1016,6 +1017,8 @@ setup_bo(struct xe_lrc *lrc,
> 			goto fail;
>
> 		cmd += len;
>+		if (written)
>+			*written += len;
> 	}
>
> 	return cmd;
>@@ -1026,13 +1029,14 @@ setup_bo(struct xe_lrc *lrc,
> }
>
> static void
>-finish_bo(struct xe_lrc *lrc, unsigned int offset, u32 *cmd, u32 *free)
>+finish_bo(struct xe_lrc *lrc, unsigned int offset, unsigned int written,
>+	  u32 *free)
> {
> 	if (!free)
> 		return;
>
> 	xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
>-			 (cmd - free) * sizeof(*cmd));
>+			 written * sizeof(u32));
> 	kfree(free);
> }
>
>@@ -1042,16 +1046,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 		{ .setup = setup_utilization_wa },
> 	};
> 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>+	unsigned int written = 0;
> 	u32 *cmd, *buf = NULL;
>
> 	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>-		       ARRAY_SIZE(funcs), &buf);
>+		       ARRAY_SIZE(funcs), &buf, &written);
> 	if (IS_ERR(cmd))
> 		return PTR_ERR(cmd);
>
> 	*cmd++ = MI_BATCH_BUFFER_END;
>+	written++;
>
>-	finish_bo(lrc, offset, cmd, buf);
>+	finish_bo(lrc, offset, written, buf);

we should still have cmd in this call, right? But in the next patch the
cmd should be gone as it's then unused.

Lucas De Marchi

>
> 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> 			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);
>-- 
>2.48.0
>
