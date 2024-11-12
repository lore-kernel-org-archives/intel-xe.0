Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A516D42BBA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 18:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463B410E613;
	Tue, 12 Nov 2024 18:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGUjdWka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB67510E610
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731435460; x=1762971460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G1G/aaf2cKlHbfMGgZ7qdN4FvEZ93VcWt/YKSuD3PXY=;
 b=MGUjdWkanjZJFS5XE/aL2UCJhZaQdvtehFwMZxzrGNBH/k15el6l3kJM
 jSnGOGfIGpDTkYzCxQoJBtnpH42iwI9qwQ+oJL+ic77kmP1wARSLxt274
 tJmo9VEHhnXXAJi53EMM2y+sJ756cA+lkV5TCVqr69w8xhpwu0OihfWvm
 VMPG2XiEoD39WckNn+8KgoiRQDKX5M4nHRzWVYysvizFED4gcg2WeWAAZ
 kUaBOZtKjlSC5l3QvBzTctaDgyaP2x3ak1phtumfszYsitsQ7gVrIa7o4
 Zs8kyNZ/ZoL4zwC1eP4u8nKc6PYsYF+6Q/sPQInhOk0m6M+K9t+TK7uGv Q==;
X-CSE-ConnectionGUID: 6Y5/OLb3QFq0PrMqBgewJg==
X-CSE-MsgGUID: prqyYZ+dRnOEVv+LkK9RCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31057582"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31057582"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 10:17:39 -0800
X-CSE-ConnectionGUID: XQgxra+jQCGNT4HFXM/QNg==
X-CSE-MsgGUID: ymhmavYDRtm1en4djdLHQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87167131"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 10:17:37 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 10:17:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 10:17:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 10:17:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBrKc4tL/dxZnUn98qCWoaGRGw3fMm+OxjIp2COto7yOUl43iIp0tIzyN2tMlIvlu/ufdTRXmDiXqpsg669vsd+G9MJ0UCmDKJUKDMBzew1Sl7epRTINEzf2g/QsnbIuHQBXQexc/9YTE2+Xor0lmvKItsVot3ervpJngpnSM0D8ToCrGDri1FfLz1u2O6VY6rpaM2wK3DjcvJy16VvBX9Mk59RGuQ69jbwKBt6dEac4ZF1kdbdsBb1TNU9XX4YmjOuVxKRx2/ga3Ziz+ebDln4OpJi24gQZKv9x/hun7AsBzFsdayEcorUlh6cIO/GGBJx72tdFfNBAU/fh/fBeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER9zgMaT2pjUqQnEUdElKBQxPkZIRhsweHxSv3oJR0c=;
 b=wX8yFAXXp36DTBixQpAcXNN4UIF2YOx/9wZh7AmBMBn2TNx/zL9S3S7GX6kZQxL7xTc5bfyzngl79CaDvsIXKnGUAx2/b6TbONpjyh7WNKwoskAyiSSfHyDTETR9GvAsxYhT0NSthx4suLEt0u6eUciDdR+D4qs+VkIlHUMAV9lxpe4tKg0tj8Svg5rVqzzI5oPDXbhMO+YWE1GlMFrfCpINo41/s7+8x2nNnP/I1+88RKPQadcJGjAmcEMFWNwN+zbULdLHsZS8wSzIsObS+cTrzkz6fsA4d4tlG7Z0t9JbdqNUKSf6ZWs56pmfbmez6SbrfrIajX5Y80LvUctTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 18:17:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 18:17:31 +0000
Date: Tue, 12 Nov 2024 10:18:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Message-ID: <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
X-ClientProxiedBy: MW4PR04CA0366.namprd04.prod.outlook.com
 (2603:10b6:303:81::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c819542-742d-49ef-0b78-08dd034645c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0AJqg35GvBZ9ajgMZxpultDehzzWc5XLOJ2mXGSDAB+LogaNipgRIyqmmN/x?=
 =?us-ascii?Q?hHzcZpMvz3MmuYzzQRH96Y0mQlRQ2Nc72QbHejZnGZO6BmlyHHtJKO/Id4Cr?=
 =?us-ascii?Q?urwoqgq+9HBuikQB+sj94oWDkBgcv3DhEDCO90PfHiDBYrZQwigtZ94qHjF1?=
 =?us-ascii?Q?AX0CiPVYNAFHE4ZMrLsoDDqLMRhL78DYCcqKbzuxTFbDEHdWjXqD/GWLbbWU?=
 =?us-ascii?Q?Sf/XvWmc0o3ngvxTyPKtpSsxx5/ozBUzlECrvNL1ScIJ2F7hvvOI9hkCYMGq?=
 =?us-ascii?Q?b1N4xDj4nGRyrF4TsFEblVf1bJOisUVBLepRgAuI1nbBJ9XOeSoy8V1hF346?=
 =?us-ascii?Q?c40IYTTgSIG+OU12jAeJk0H9chzNofejkZ6BUl7vNtiQdqb9CvEpT/lVj/9a?=
 =?us-ascii?Q?GPQUVujXdc49v0zV5UvCRxhIaXducjR0iWqGIfsbH14PKziYW+QQnlrVyTJO?=
 =?us-ascii?Q?1g4B2EG9kOMIUS2rSCeChi/svzXe9g6o7EFOoJqKTP+JksOnGpN6ZQHWbKfr?=
 =?us-ascii?Q?E4I6EGJJfyjgOloFzT94mC3dR1JTXZukVKoQCNFj6/3sHKxpjYLO7MdkBkIB?=
 =?us-ascii?Q?1N4fKypC0iKIVhWUoIQzddWfQWWy6dA5frlwqIDSNUi5TrXCQtsgyAcumgK3?=
 =?us-ascii?Q?LhZNkEHVSePLEuL51eui9Dih3jS/Y8jksLDe1bcKJYliVPxHbT6Bfx2mdVDx?=
 =?us-ascii?Q?N0n9EW2k2FXjHoZfw6QQgyIms8YQIQgPwOrRZEU/YzR8+w5vT0jTkM22yZ+1?=
 =?us-ascii?Q?DkvzWm042+y6jhrAKxGFFDkQp87PhyHKTM++RlzzbM/Rie1aQoYQ4fE598Jf?=
 =?us-ascii?Q?tGmcCYrENgQf763+zzDBoZxtC3mWWrL6plw8WDkJVPmt2cnLIIrPOU5et8JS?=
 =?us-ascii?Q?zyEQDNNae46408GcGrrhXACzZfMkp+MkXmOofACFn7ZTw4dvCLdrpm6XzDPh?=
 =?us-ascii?Q?PGNY/JtzBfvMR69muVtU9N0Y4FFyan4ajQGqSDtANqPt3zHhP02D/WgESE+9?=
 =?us-ascii?Q?T6lTQOYK76PMusHKAj/mcLEoDdkdu+HdSMLXz08GnrFVdxzXCAJ5byZz+ObI?=
 =?us-ascii?Q?lXO59skp3KJKyvhPkO+Fpd1UoFhjT9AFZZIDKvlxdH2RzaF6AsJUo/OBQ2/6?=
 =?us-ascii?Q?sjfsnzHQbKScj35nR84C0ikIUWTxNS8KDGKBYZjLBYBhx/FKiFdnmCFbpjyc?=
 =?us-ascii?Q?vxOzq4AiFmzR611tLDsK9s+mV/VE3uGbroMRHRz4uMRM/H4rOfgD/r3PLMYC?=
 =?us-ascii?Q?CiMvA2NTK9+el2BBBjY5KkSo/B4eJTIO0jaaOCuUaMQwg8YUq4Wa8Ammuo/B?=
 =?us-ascii?Q?xSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FirYSiraxcg/MvS1xtXzfk29RCNjtg2sAKiQLFQgtye5m8TEJzKdZCAUG7u4?=
 =?us-ascii?Q?D8HxN5aBQwRgsSU03scXfl3TUPUOhgea1AWbh6VK/32K46Vq0LNVl78pPS1M?=
 =?us-ascii?Q?rdmpNRYJacgMqiuNLkXnJDsz9x54hWF/sS3R/X7UbaxI2IVcvxILz4WfARyt?=
 =?us-ascii?Q?1j/u7VcPGKvII3kEmTg+vw6s4WrHMH2nfwfCeKqrZMOl8/xePjBIW2PNqI08?=
 =?us-ascii?Q?eEJu2cl9AEE+ODEryRbVXS7uUnteXnLXD22B+HtwOGRWDrnT2nGq+T5tZejH?=
 =?us-ascii?Q?5JWh01eG+fRQbX+24Gq5AYGaEYZFlR7K928B3YYEt2l5khQASXPnSDOciotR?=
 =?us-ascii?Q?YNUxaqkCX3ppZbOk7fgvvVaniwpeg4sr5gjJ3qVWl+OPrT335YZnT7T/rZRt?=
 =?us-ascii?Q?RR7JQAI/P+VzPWeqk1qE+xepoZEmUj56MiXJZEqMqD+R6SRPS5ecuy9kdnsb?=
 =?us-ascii?Q?YmQQKcXePnKeNVs32hZUMojtIJQsWzWgbAnDVkUfD5odACTUPWTyT8CgjaPC?=
 =?us-ascii?Q?wakFAattKrMGYveThK6k7pwVvuYMHEEDYWTkyGfoCaEYY2zohJpeMq6B6fvS?=
 =?us-ascii?Q?G7zhqaoFWZYJia1yuA+oAV9a5xs2ZSHH4rpkPolIc2mhxKW8Yx05KzhIAdvA?=
 =?us-ascii?Q?eYno44rNqv+/Now0KPIpZd9XeOwc4w+//s7AxywBO5CECwhhRjstHADcft36?=
 =?us-ascii?Q?otQK+S2wPUxX8cSCxVfZhszo1KYrZkU9RPCyrOaw4u9p6WbVWBXT3NuNJw0m?=
 =?us-ascii?Q?07eVS93OzhWlPKRC+q/ThAITwVtqKwdH1U3tuwPDbByOulPUBfaGDjYrR5PT?=
 =?us-ascii?Q?aHvpIUwkki4CKsWhi94wICxAhjZYWLhTbViJ3Wx5rXuJ7Hds9RPq9M1/LXOl?=
 =?us-ascii?Q?UTncNBHd/AeKk7sosEmUiWC70R3/TCJvNAutOHI5ICGkMFTh8Z2KlQJLNtSc?=
 =?us-ascii?Q?d+qRwzzIgsdigwVjqVqZ3Sn5e4aRjPzWjgOG1poAHbQvY8Im8mTPqLrWEXVz?=
 =?us-ascii?Q?/r18168s5Ua5YWfmUsTBDPjfC7nL1+7mEjviyK/qVehomL3e8a9/04DMYQeA?=
 =?us-ascii?Q?Iyc1YVKYy3gkIr+JEUIBTEGtj63wyq1G+AH1RRBVS9x0fKF1tN9lTcRcP2ch?=
 =?us-ascii?Q?jdC0Gy4IaKFnUEo09kSa3uPbNZf1CfxcgKvLR+y/vm6cTavEyhLZ0+VkT7DZ?=
 =?us-ascii?Q?/FJeiTm8FdKHoqZvyG7uzmiqr4PR6lVOHV6U6kzMoW3KyvupPm0g0KGyh/6/?=
 =?us-ascii?Q?rkw7NGJzJYZsvP4fBOXjzL9uev9yhldOgvc7+ASDLCRbe/gz7u2D27kuK7Nc?=
 =?us-ascii?Q?sk94OHajOQt2X9zw3PzBXRltqdQ5F0Pzha2VZb5BT43qT0G0UHrClyalE7Jj?=
 =?us-ascii?Q?1Y64XySROnzfC2BvuGFmkyjtxoKLav/Fb+Erqg+ShUBAJ/Fosk86l4G7rDjS?=
 =?us-ascii?Q?Bzoo14X9psW9TGbLkj4KzGezr5YnKrJwAcOmq2YpGndLdx7jpSbQVFb5Bce+?=
 =?us-ascii?Q?lPtnejCRzaDskuTmJcaWFA5hvULF8SHVO/V9piFwL/sh6iMSdadC22gV+vWf?=
 =?us-ascii?Q?tU50zwlGchkxOqOPSbIB4lhc02mN2DT0TD/weUfTrGDEz4e9rn1EDQM1obtU?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c819542-742d-49ef-0b78-08dd034645c8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 18:17:31.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFwpMR1vNAYDjLHsN5Mrkdo5e3i0b+p/HbTH+0Jq1+BW3k10RtBawvryJ951nX4cuxc9QQleuuvvAThLgsY+Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
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

On Tue, Nov 12, 2024 at 09:59:16AM -0800, John Harrison wrote:
> On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Friday, November 8, 2024 3:10 PM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > > Sent: Friday, November 8, 2024 9:43 AM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > > > The ring is currently in LRC BO but this may change going forward.
> > > > > Include the ring address in the snapshot protecting again any future
> > > > > changes.
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > LGTM, though the terminology we're using to describe the various ggtt addresses
> > > > as "descriptors" is a bit confusing, even if it's consistent.  I wonder where that
> > > > terminology came from?
> > > > This is just a rhetorical question.  I'm not suggesting it be changed.
> > > > 
> > > LRC descriptors is name copied over from i915 and may even be in the bspec.
> > > 
> > > But yea, indirect_state_desc and ring_desc are bad names. Will change to
> > > 'ring_addr' here.
> > IMO it would probably be better to leave it as "ring_desc" for now as it's
> > consistent with surrounding struct members.  We can do a pass of the full
> > XE kernel for inaccurate uses of the "desc" qualifier in the near future and
> > fix the naming scheme here as a part of that fixup.
> I strongly disagree. Just because A is broken doesn't mean we should add a
> broken B and C! It makes no sense to add a name we know is bad just so that
> we can change it later. Anything new should be done properly from the start.
> 

I agree with John here.

Matt

> John.
> 
> > 
> > My RB still stands either way.
> > -Jonathan Cavitt
> > 
> > > Matt
> > > 
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > -Jonathan Cavitt
> > > > 
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > > > >   drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > > > >   2 files changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > index e219657535cf..afb0f4f44748 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> > > > >   		xe_vm_get(lrc->bo->vm);
> > > > >   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > > > > +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
> > > > >   	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> > > > >   	snapshot->head = xe_lrc_ring_head(lrc);
> > > > >   	snapshot->tail.internal = lrc->ring.tail;
> > > > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> > > > >   		return;
> > > > >   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> > > > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > > > +		   snapshot->ring_desc);
> > > > >   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > > > >   		   snapshot->indirect_context_desc);
> > > > >   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > index 9d64cedc4d14..a2058a501353 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > > > >   	unsigned long lrc_size, lrc_offset;
> > > > >   	u32 context_desc;
> > > > > +	u32 ring_desc;
> > > > >   	u32 indirect_context_desc;
> > > > >   	u32 head;
> > > > >   	struct {
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > > 
> 
