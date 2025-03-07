Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CF6C282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 15:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92B10EBCB;
	Fri,  7 Mar 2025 15:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lidNzmEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4726D10EBCB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741360632; x=1772896632;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Tua5g/uQP7EJBOc73ufcrOM9Azez44h+h3H0X+DpC/I=;
 b=lidNzmEq+z8oiGQcUNAL/vXxVEAU2/V1cXUHqCCk04kJp4NnsZZfB7Ri
 Hxzgyn0P3GPAXl/KVjN615rNmYbhS/ECbYmQhQEZDnqcTykRKcUyw3cJC
 5CIzp1KmuC+cHAPJ46zF37yvYOgT5wYCx4TeeN0glGe1IDmK7nzcy/LFz
 3TTeTSS0WUvHddOms8kkkcwrLnrn7DyQdpW6y5nxbkM2d2ylmhYFVZ/U4
 vQGMpletUhKcFUQ7YkukEXKXlfjhjGJ1oaUPWlP5JMpVqJJwIwdRtoYST
 R6spL4nNKBvZE5HBOxCqazurhhQkTbUXjA+YiB9rdkv8XyyXOEuVyubEr Q==;
X-CSE-ConnectionGUID: WiPq9yJOTOKqzlbzpu+IbA==
X-CSE-MsgGUID: 9U3SQb5FTASJW9uTdL4Ogg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64851496"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="64851496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:17:12 -0800
X-CSE-ConnectionGUID: FpgN138PQlOTX8i2sMpLoQ==
X-CSE-MsgGUID: e5kV3yOfRLqYmCiw4eCeoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156561433"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 07:17:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 07:17:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 07:17:11 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 07:17:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7HhzVTNG9Ea9ViEEut7KvVdE62k8/KocKLlE1pn+lXc4+4bqo3KTaWFTRW6mXsH95GwEVQmGH9EiWSDu7hwZU4XKB7JHkHI1weOl+p+67Mtf5NxekX9AentihJzdks6N8sGt/pQcKCrWisWhA76M5Y4gEiAgI7oAzNmhxFTwp6kYlgtiTAY2l0SG43DY/Z0QiyYLR5Nabg8zwb9xJ1Xa6nrcu8rONkUfn6yI9pkUfp5xHeBPec/87scJ7RAxHrvYTKtwvsJzSDXHb4xkkPj0Uda0/UFPKk3I8+zhXHy4bmBCw2vuVhKMzjhmmOE6da6YY1+fbGfXB3VvRQEMX+hBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LcxgKdCJuFCKNNIFL+4SKk9K2zgH+Iwli6EeD6WYUI=;
 b=OPqWF3eNkrto4+xtwXZ6yosZPlJZJESHJ1feiJFaqXRuN8IRIodkJdkvZscN5qFnMnukRus5leoI3vwwg3RXYgofn0AeRVrxrr+A8MZdbwsKysEboeLjGzJ3P5ig0wLIE4I2cEYIg94Opf12GE3Ez4fLUkF5FZrmvXzhnR7W3TS65uL7thOkmbJIwGSRWygF1P6Rbq6sak2cWwGkxGxyCz6De3ONlIlSakOo5NpBWCxRi/rEePr+z3XSnEyK9borVpXyrKgn5iiGpRMOhxizpTXUqYXubxXkyT8enIIgmtZawKV3O+BTkG1EyvwW4NIu/IrSSONJ6wcHld8rLxRx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 15:16:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:16:49 +0000
Date: Fri, 7 Mar 2025 09:16:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307142446.1790715-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 2134d806-b7d0-41fa-c4f4-08dd5d8b14d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yiP+F3t+G+GsbWZxHmwLMsY2++/bXD/ZeKk8Ktpwsa9UREcEIovj3LtyDp?=
 =?iso-8859-1?Q?Qn8/c5/npsi0I0OV6qcNDUHN1k6t8QiUt837KLKFDssOTrPXNzXb2jMEeG?=
 =?iso-8859-1?Q?yKIGUHda1truRMVtsMhRRk7NIJvqXe1TGHoKLF8OYDt2BthQ1H0EFxS9MI?=
 =?iso-8859-1?Q?i+k2BqBRulX84ZA/Edm6a0AbDaG4Y/+WKoBipyC/dshtXVIcakcRZXZgwW?=
 =?iso-8859-1?Q?hwZz9pelABrAAP4ic4rLn6HNG/dddpN9i+3OXQjaoa0YnbFVv2xDzVX5yF?=
 =?iso-8859-1?Q?VAcmLUBPEMkNVEEHp4AY3PncDBzyXNj1x24C30DdBYPAUJokk3P9PY/9zC?=
 =?iso-8859-1?Q?shv4zq8CE/YPSKVouNvLHCsuTkizOQ7VWN7nzukvJQCaQb/2P9CINDNprP?=
 =?iso-8859-1?Q?7Fb4rzTXhKDo/bDYDEnM/Xg3Wkgmj2QFuPKLeHbT9g7hbP1STheE+VI+fW?=
 =?iso-8859-1?Q?9KME0D8p+R92dizTsrRC7+OPTvILZhC34nVTaMcEXXjuZvIkGeTiZK4fpE?=
 =?iso-8859-1?Q?wzgbm6MtC4+7hKHFO3mwp2Auxj9E+ScO8eZyX6uF62ZKx29INYkTKCOI4S?=
 =?iso-8859-1?Q?yNQnUgYo1Og62XMCzChroXYVJ9mIh97hS2cRahUt0XVvsunqH2P/7NweTA?=
 =?iso-8859-1?Q?8iMjl5IKrKo0WJ3tYv0XxWhcA7+baK6Vs25RTWWV3P+iF0TGMspHGiBPA+?=
 =?iso-8859-1?Q?FRmMhq+iXhKdqHMy8qbkDpM0YjhW2sOAuKucZUoEHmfW9vi5lbHimG9bGc?=
 =?iso-8859-1?Q?CLLTewTlaE4aUY++r6LZgMXo1g2NdKBloN+gauHp6EH4QuI8oGUsMChSuo?=
 =?iso-8859-1?Q?V/hKrjwdnUyE5cHyMSKSu45xXooiC5xuO2YlcsI9qz63RbGX0VdZRl9dxP?=
 =?iso-8859-1?Q?wdvohHI2EVFUn8kFcnThBX3lvmv/GqldH1GMIIl+SfccWuY/nYu8S/beIV?=
 =?iso-8859-1?Q?wmuu7/FP19y4r4ahN5vXI67RNDby45b+5Rcsx8EJPSA0J14nMgUG6sT2MG?=
 =?iso-8859-1?Q?DM54RFZOtsDhHr/JtmIIjQom4gCIc1aGKk0VgyCrEL6dmcCEESe4BBKIBM?=
 =?iso-8859-1?Q?+0Iy41PtcKktwmoC2cQ+KrztfMsK9edxfKS/zBByk08BNLkeAyBlyd7Vih?=
 =?iso-8859-1?Q?D9KhAG9Fm09N8vxPiTdwBboEqQW7lwDf/UeeI8WNUttP0wUQTiDK1akRcw?=
 =?iso-8859-1?Q?gX8OYZktcoR5lrsBLuzmH9gxn/P0gsW5WIUZ7aZIhhbDgdFZZp09T3FSUK?=
 =?iso-8859-1?Q?6QCtWSl1y1Mfn0P80l63WMYcHg69616+M2STkXxvaUtCnva10IVzQOklFh?=
 =?iso-8859-1?Q?sSo75/R59bBgCmqvNCU2ngm0QwIWNAkLspB+d1kH7GooY5FZnXuxLa+Ad8?=
 =?iso-8859-1?Q?9Rf3O35Vt7fiyDC+5MUapb6j/7bsG2jJWJANnDV09a9HTNsz9i9ly0YX9d?=
 =?iso-8859-1?Q?hajOG0j6EoRsReUc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wdcNyQsfykf2F6Mrli4y4v9D8x3Sm3y/KQLqGGzQ6dpYqUl5hWYBLHMTkF?=
 =?iso-8859-1?Q?pzv3pPjkTYpDhU2AhJFDxAxYhtnsrGZmeuVnybDUtDuo2klC1efFUTnT30?=
 =?iso-8859-1?Q?79j/7s9hgRDmtVWuDIY4XYtWfWIvjEgIE+l+VT9cjE/9kDZuEz6cAqYbtO?=
 =?iso-8859-1?Q?meb+pDP3IMe8S1o8mVYzDtj987tYREW0jIJ3mcopZgfGU5pnR/jtnmw8EF?=
 =?iso-8859-1?Q?XBfy3p54oWEROjoxzLonuxbecN6dfBFZnYxvp/itsU9DXzLjA0Wg+xXWId?=
 =?iso-8859-1?Q?BMDnR5/rXua5atzHCTTWVrUfsWWmlAhMf7bjKaJqmHW24MjgvGlw+JwFwa?=
 =?iso-8859-1?Q?eV2E+6tCh4oPb7UPshlzk+/ntJYp7MctVyBGu+KnCFJU+3hciHMUtj6Lwb?=
 =?iso-8859-1?Q?ApWc0Ey0FFN5VU6u4lJeR4kqfud/j44UthtKxGlITxh17ndQOuE+j3y5uh?=
 =?iso-8859-1?Q?2+IiikVF/Z0vbY1yM/zg1X2PRvGLwRKmKke+WtQ1jR7iUH7TtcBN2y3av/?=
 =?iso-8859-1?Q?Vbit1oT0bKDlUZrpHyFEgv70Ic0gSm8Y5vs/9a3dVCZWPVZXarYLyOKic6?=
 =?iso-8859-1?Q?1BA+N4mR+ppOwXIYUc9piOdBxnd7iDRZ6MvKzbuyl4HD/ZHwANQahNNEbq?=
 =?iso-8859-1?Q?CEcRlF7QfZgoAQClNuGK1PTht8vOsW5N7wpJ+EwW/r6uAOQDshDTsWYi+6?=
 =?iso-8859-1?Q?Z5zEA/FZMGeW75ev6yXSWWlYa7SpaJvLmivaFYBzRmNSdZf/ciUBGZSjzz?=
 =?iso-8859-1?Q?dY+RjuzKLrFirY0qXnROwEVh/mDC+5acjPpgYye/ZOfkiu7+pRBiayFeIq?=
 =?iso-8859-1?Q?aKyPtG9157yztOhGAagw15N8yeqOIW5QspHHS6iU40trRss88cOm7Ev4A8?=
 =?iso-8859-1?Q?9eTg/VU7owXOTEloytU+OxOgYHQJPHVXwLP7m1Ns+/Plr3hUOiDzICZsVI?=
 =?iso-8859-1?Q?5Pox1JAUAU5vlGa011U2FeguROh82Ol32OgjpN5f2a1nEPReEiFWUvREIh?=
 =?iso-8859-1?Q?FtPzohxIyO5zymNxAdsM+o/3dPJKKKgWmWDoGl1qZNmwv6oFIgfl+3zGy+?=
 =?iso-8859-1?Q?kMDiRGSm/m/CwabQrkCPSr+m72GgAL9U/eXGxMX6ooArRqoyTdhGIWzEqZ?=
 =?iso-8859-1?Q?rqF4+pdli1JoyIYTDVVcSFAbKdfoddg883SS1PuZ8PLZt74hV0FHI7iaVa?=
 =?iso-8859-1?Q?0znrvRfJTLnLNuhvyAcJw7cdynDq/UvyDFKvhZe4x1qvsyBf/t/0l2Q+Zf?=
 =?iso-8859-1?Q?C5BzGRe0pjeGeYs1LrX8ngwnR0O3t9Zo8sQ1A88+2GL3SFo0T2RP1mIls/?=
 =?iso-8859-1?Q?a0lF5af9exRETQZq4LLQYoQoPAJXPeHuYpTuif5cqMJ9ovdFLnsMC1Yb/d?=
 =?iso-8859-1?Q?sTHMyo62ZozW6VHgnn6Dq4Mgn6pq5mDHCHLqzFA2dD7cxHmalJoNEjWJ8f?=
 =?iso-8859-1?Q?wuB77nVMG0SY5lZIf/KAgluS1Va94PBF+ExkkCNBgs8B6yhjiSw1oDkRPh?=
 =?iso-8859-1?Q?+kkb3lZMROsTrIxrJwaP09JMum8PVuDTohakCdgQ6Tg0QRywC499DH2UxF?=
 =?iso-8859-1?Q?KO7XqYzA6MrchKWqAlkH6SLsZLruQ1dKzborC594EjGjTliqA/LP3XO4Df?=
 =?iso-8859-1?Q?d5yUcvxjzyEI+JFhXOXXmh50Smo09PjQaUnwNqG1yrWxTFIxFqSmjA5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134d806-b7d0-41fa-c4f4-08dd5d8b14d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:16:49.0342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrzYNjxad/3BnFJTmZjfJfsy/hk3jG8wX2ALhzhWXnzVHRk2NvTrYiQrkrF54FePXdMezsW53wbL7B3/tLCtnuv8/yI428nKEa33Xz1g5S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
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

On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
>Registers a configfs subsystem called 'xe' to userspace. The user can
>use this to modify exposed attributes.
>
>Add survivability mode attribute (config/xe/survivability_mode) to the
>subsystem to allow the user to specify the card that should enter
>survivability mode.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/Makefile      |  1 +
> drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
> drivers/gpu/drm/xe/xe_module.c   |  5 ++
> drivers/gpu/drm/xe/xe_module.h   |  1 +
> 5 files changed, 114 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 9699b08585f7..3f8c87292cee 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> xe-y += xe_bb.o \
> 	xe_bo.o \
> 	xe_bo_evict.o \
>+	xe_configfs.o \
> 	xe_devcoredump.o \
> 	xe_device.o \
> 	xe_device_sysfs.o \
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>new file mode 100644
>index 000000000000..8c5f248e466d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -0,0 +1,95 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/configfs.h>
>+#include <linux/init.h>
>+#include <linux/module.h>
>+
>+#include "xe_configfs.h"
>+#include "xe_module.h"
>+
>+/**
>+ * DOC: Xe Configfs
>+ *
>+ * XE KMD registers a configfs subsystem called 'xe'to userspace that allows users to modify
>+ * the exposed attributes.
>+ *
>+ * Attributes:
>+ *
>+ * config/xe/survivability_mode : Write only attribute that allows user to specify the PCI address
>+ *				  of the card that has to enter survivability mode

I think the desired interface is actually that the user mkdir the bdf in
<configfs>/xe/. This populates the available config entries that the user
writes to.

>+ */
>+
>+void xe_configfs_clear_survivability_mode(void)
>+{
>+	kfree(xe_modparam.survivability_mode);
>+	xe_modparam.survivability_mode = NULL;
>+}
>+
>+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)

once you handle the mkdir mentioned above, this should probably be
a boolean attr like this:

	drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_, param_pi_enable);

>+{
>+	char *survivability_mode;
>+	int ret;
>+	unsigned int domain, bus, slot, function;
>+
>+	ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>+	if (ret != 4)
>+		return -EINVAL;
>+
>+	survivability_mode = kstrdup(page, GFP_KERNEL);
>+	if (!survivability_mode)
>+		return -ENOMEM;
>+
>+	xe_configfs_clear_survivability_mode();
>+	xe_modparam.survivability_mode = survivability_mode;
>+
>+	return len;
>+}
>+
>+CONFIGFS_ATTR_WO(, survivability_mode);
>+
>+static struct configfs_attribute *xe_configfs_attrs[] = {
>+	&attr_survivability_mode,
>+	NULL,
>+};
>+
>+static const struct config_item_type xe_config_type = {
>+	.ct_attrs	= xe_configfs_attrs,
>+	.ct_owner	= THIS_MODULE,
>+};
>+
>+static struct configfs_subsystem xe_config_subsys = {
>+	.su_group = {
>+		.cg_item = {
>+			.ci_namebuf = "xe",
>+			.ci_type = &xe_config_type,
>+		},
>+	},
>+};
>

so... it seems you are missing a configfs_group_operations.make_group.

>+int __init xe_configfs_init(void)
>+{
>+	int ret;
>+
>+	config_group_init(&xe_config_subsys.su_group);
>+	mutex_init(&xe_config_subsys.su_mutex);

this mutex_init seems odd, but inline with other drivers

>+	ret = configfs_register_subsystem(&xe_config_subsys);
>+	if (ret) {
>+		pr_err("Error %d while registering subsystem %s\n",
>+		       ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>+		mutex_destroy(&xe_config_subsys.su_mutex);
>+		return ret;
>+	}
>+
>+	return 0;
>+}
>+
>+void __exit xe_configfs_exit(void)
>+{
>+	xe_configfs_clear_survivability_mode();
>+	configfs_unregister_subsystem(&xe_config_subsys);
>+	mutex_destroy(&xe_config_subsys.su_mutex);
>+}
>+
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>new file mode 100644
>index 000000000000..491629a2ca53
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -0,0 +1,12 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+#ifndef _XE_CONFIGFS_H_
>+#define _XE_CONFIGFS_H_
>+
>+int xe_configfs_init(void);
>+void xe_configfs_exit(void);
>+void xe_configfs_clear_survivability_mode(void);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 475acdba2b55..15b3cf22193c 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,6 +11,7 @@
> #include <drm/drm_module.h>
>
> #include "xe_drv.h"
>+#include "xe_configfs.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
> #include "xe_pm.h"
>@@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> 	{
> 		.init = xe_check_nomodeset,
> 	},
>+	{
>+		.init = xe_configfs_init,
>+		.exit = xe_configfs_exit,
>+	},
> 	{
> 		.init = xe_hw_fence_module_init,
> 		.exit = xe_hw_fence_module_exit,
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 84339e509c80..c238dbee6bc7 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -24,6 +24,7 @@ struct xe_modparam {
> #endif
> 	int wedged_mode;
> 	u32 svm_notifier_size;
>+	char *survivability_mode;

drop this.. We want a  config struct in the xe_device. It's actually
allocated by the mkdir in the configs and when we are probing, we should
find the config instace based on pdev and set the pointer xe->configfs
or something like that.

thanks
Lucas De Marchi

> };
>
> extern struct xe_modparam xe_modparam;
>-- 
>2.47.1
>
