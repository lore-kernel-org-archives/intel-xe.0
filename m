Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C115C54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 17:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5B810E108;
	Thu, 22 Feb 2024 17:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f80a4Egz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C6E10E108
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708621789; x=1740157789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cFJ9CK9qNGRhhgRgaTqglj2VRpP8Ve/NeWtJdaanLrY=;
 b=f80a4EgzWvN3tzZCkCf26H4GPMM6Y9wsqV9brV4JGIkUUp4uytJVy9I+
 f34JoW4gxfNVsN2P9HXveW75frTw6cAV/whUbM3y9IYsm0Vof5Ka6QcTi
 OVJ3Is7FbvuMP9c1Fb7whMxU8eDQq9q9BLia8v6NkT+Aw9qREpPhVUAPO
 X7JtiZhhwGSBAn9uXYyCsocXXK0nwbP75BypzbRxe0YE4BlSSJgqpI4ux
 1wJix90twfd1txq616+XotCnKgAF6Be2MCtXcaf6hTFHSywJW3l0tG9jD
 WJvPnSNDo7PazGAruId/n0qjIO0Khu8v7VObnRUdNPC4/LiKdQfOwsIOi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6686898"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6686898"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5718484"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 09:09:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 09:09:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 09:09:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 09:09:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 09:09:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX9n30Qqsm6y2IFULbGJPeUxbDHn4mma8H567TFVXD34b5JC7NU9ctLEXb0B27774iQdT/yCKiwfYyEV6Y5+4HxUeEmR8Q67ovu34Qy6FeBF1gMzqd2og2XbYLvjdB2+W1BX0VqnfhnAEXYv2g8D9U2UeMhuQjnnM3FUxtU9HCTwxa+7cFlL1euYKUQRiF6ukJLG6ymdmWjY4QpH5Yuqvu0JsS9VUX1FXMGpHvi63tBPFfWTdS7J3vJcUfcL/6W8u0tHZ48m8ukPV6100aFBCa9wn1RyDj/qy69lAyo/T+FHGODPTKHa9NCut2vkWUAIYk79hwZ4et6J1/uAjQj/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/1GKTUfO/y2iI0pA2jhPX304Ivg51bzV6O1JNWyZvQ=;
 b=aoM1n/horX/ZNcol8rHad79HPYHSZFDZgqX2krhR7lHTLvOYJ2uRxts9aeVQUsOTSFpTynwshaowoHXVaoxZ5Bch0sWGmloZ+P1wXd2JUbSE/PYkq94vL4dRk/KQOzlJ+58kc6xa+o8zRXTQRiNdb9Ds+FlCwILXsPRgGPyQVrWFf5cS/JHqu63P23rwPOk1z8NcLb/WW65MrjYyNZFV/RI9Qvrbj4ZpWkGoZVhZHFthzX4UKlw/jtXQLnXqGG2ijqY9iUPnQfegPoZzxd+D1G/MzWar8pPnGZrYmiXYe4HDnA4bYyLFMORp64x3++iPguRZOnEb0jM4rykVI+bY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 17:09:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 17:09:45 +0000
Date: Thu, 22 Feb 2024 11:09:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Yury Norov <yury.norov@gmail.com>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <fwkiemz7vg4nnswxmzwrd7stxe2agzg24b6iykhimqn7qdxini@keoa37xaghip>
References: <20240222190448.26dc124d@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240222190448.26dc124d@canb.auug.org.au>
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: fee9fee0-a2f0-4cbd-a9fd-08dc33c91130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YokTwQD8h2u07LQsnLx/HarvKpemuIjEoZyKL3a4JgPHUDc+u/ox2Y6R7c83kHsMQMQdcltGTC+lz7jdDQE4b7+NgdFBWsFQgSyuTHK0Sl+G7WSJ3kB9QGmUYUn/h8UPy6ugOATAw+VqekSz3wrrg098MW/6rzwPmX49eKv4g0hEftBgQ2E6/HWl4nm4ZLqTCCnIh/S55GGRaiXVRepcPIk0OriuL1LTv0X0ar7MlEo/2M/4DPbRGjvQ3vPTfir1g0087ZSJK9WXQDuxmKh2fZagaKzvYSq0n3wloJ7nKSNBadTaeVhGDWTQps7FAqG1kv+D8wZxRdC6qTGbbBODbLvFPmkhzTTshxaNcQSm1/4knd6FqPmUnw8E/dFQeOAyGjEDw0Zu4stZ+WG22UL/cJFPoes1y0aMptVBat3yIgpMgJ8wkd8+Pgf+OBcJM+K54YiMfaAuYIozsSexAQxCeWKOsqXHHb2grQjKdPDZjWEFcEOps+R2oml61Hco7DW/U7nQaJAYeB0rmySkT3/773lbSFONYyyE7mGkiR4eMfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?08+G1c5iWbVeAVBLHizikO4jweNmNdk1WJIojKswmV40V0CHKpCXdViXa87f?=
 =?us-ascii?Q?LjQ6+PGKA/IIPRM//cshatz0lzofKzKEsUtkBEvcyxXgOCpAOd5KC/s2Rs9h?=
 =?us-ascii?Q?jaUPOvig11RxNRJcdhEPT8RwQhGx+d7n9P2sLLZ+Ts8PeMA8h3oRH7sh/6bG?=
 =?us-ascii?Q?HLOkC7mDIczU4Soso2xGw0cAW4SzGHDLovtmI3QnseFtv9HYS2PGkdY7jPPM?=
 =?us-ascii?Q?sp1uI/pqW1J/uHXt8cy+lQIkOMPfM2gcJy3Zc+e0c0pH0BIKPas3QV6q2wVp?=
 =?us-ascii?Q?vh0G5RiQ5WKkA4k5VrFYPRiGRLBgapT3TuOYgBCrlN4kGy5k0I9Ki3BWdN4I?=
 =?us-ascii?Q?OGJ4lbItv//7bL2csLoIQ7BdhxKrGqLZf70i5uMqXSRRkChNx10dFDhsoUYs?=
 =?us-ascii?Q?r0J0IRQVeendVGOFPCf+NOqBgHZ69ugtQ+UcSX00InoPjHOdLXB/knpb0was?=
 =?us-ascii?Q?vLP2P5wJzGPHm7Hk3M1eAwiTSgug2MuOK7UjtFakfRxDl3PFIibL4T8qIBgx?=
 =?us-ascii?Q?bVVya6C8oYf6zAJ8Tctr/uG8HuOjg5Jn/OKkMIKZvshRXcFP2J9bMypUjX4j?=
 =?us-ascii?Q?l/omQuvJtRPEKM0W3mrAEIKrjOEgctMW1NaYJamq0y+at3scetcHGv3u53Tw?=
 =?us-ascii?Q?T52asPj4OJ2YGUM0fuGeaGGLUtp6ai/cZqGud0B0AHFyCTB6DOAeH5sGMp4A?=
 =?us-ascii?Q?sYlNQ6YvUeonZunMio13I45sR+58cHg946l1CHDMXwPue61eoX1lXEwa8Thl?=
 =?us-ascii?Q?E4YJvfS/t1RiCV/kCSXfVALJHZjvR5hBxf647MJWnop+j+GV98LlhN04iJXK?=
 =?us-ascii?Q?sczApVerKyCBjEh51Z3arU1QcVs+OHHUNVeHOGp/HcjQufG0LzekWKS8XlSg?=
 =?us-ascii?Q?Ye6P85cXTuzE/obO9xiN2sD35CocJUzZ9+H4iA+Szp5T0YRWmLc62ndnmSe/?=
 =?us-ascii?Q?W3KHwN88JUKml19z+DnPGkN2w3UwITMs/00AfvH+yVkQhe9HUTx/eQIO6q1H?=
 =?us-ascii?Q?NAUe0sbFp2+FSSt8Zv6QtKUjNFwNPXRR1tc9WRiqxr1X1ODb/de1P+X8T9Md?=
 =?us-ascii?Q?Ym57TVwpX1G8FVEmm3/HPSSrDaNFdYGZ0B73D9OOZT+V93FazAE+J8FE1RQW?=
 =?us-ascii?Q?tvVjvE8aTy+bHdZGnkfkJF1UJinKMgLID6LJLChNpXMc/TvgdKJyc5dkQJwp?=
 =?us-ascii?Q?pYjzuJS8uqTCBztOEVUX4dSWS9enQWDeHNHimaLP+PVwM/aFm8l9B4ixHhe6?=
 =?us-ascii?Q?4U97PRiksAEU3u+xVSfktJGgBuN3wGWbM50dNavTKOrZAFyxAHq7yw7mEgyx?=
 =?us-ascii?Q?j8MfXQ9CT5No57J5LNCv/BRJgS29tENEQJgAXtIuIZXqBKMrKzVda5QlPJcP?=
 =?us-ascii?Q?i356Kzm2wkae8Bp+ticFydTl7vVn3hyn6OOwnH9cRPkLqX/vbXOuI2c5i82I?=
 =?us-ascii?Q?XzYyHYtMUvA03cDMxZt16xxOZsp1aJsCXb/Gz+007PznwqZO1Ze/UynaVAtH?=
 =?us-ascii?Q?5KV99trdIUKYA61Ib1Nz0QXk7RsT6guapvlL8rU/y+z7HUtQAQEhIPpoSXLJ?=
 =?us-ascii?Q?Q+END9NfbNaAYHWq6AM4YlAN7aq0FdquMncS/YPhE5+LqLYDJHIx8H8OXW64?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee9fee0-a2f0-4cbd-a9fd-08dc33c91130
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 17:09:45.1846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4csUhDZsQy0So5dPFMsUW78m5MSrtxRhdN2Q+vad8np2IGO0uwlTqpJKy2GPfgoNmS2orYwPBM4JdUIqJlvZsGhddTQW9qn8HEhfHOHq2P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

On Thu, Feb 22, 2024 at 07:04:48PM +1100, Stephen Rothwell wrote:
>Hi all,
>
>After merging the drm-xe tree, today's linux-next build (arm64 defconfig)
>failed like this:
>
>arch/arm64/kvm/hyp/nvhe/hyp-init.S: Assembler messages:
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:557: Error: found 'l', expected: ')'
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:29:  Info: macro invoked from here
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:221:   Info: macro invoked from here
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:557: Error: non-constant expression in ".if" statement
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:557: Error: junk at end of line, first unrecognized character is `l'
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:560: Error: found 'l', expected: ')'
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:560: Error: non-constant expression in ".if" statement
>arch/arm64/kvm/hyp/nvhe/hyp-init.S:560: Error: junk at end of line, first unrecognized character is `l'
>
>and many, many more.
>
>Bisected to commit
>
>  b77cb9640f1f ("bits: introduce fixed-type genmasks")
>
>I have reverted that commit (and the following 2) for today.

those commits were already removed from our branch due to those issues.
New fixed version of them should appear through the new bitmap tree
maintained by Yury.

Sorry for the noise they caused and thanks.

Lucas De Marchi

>
>-- 
>Cheers,
>Stephen Rothwell


